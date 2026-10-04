-- Leaderboard for Rhythm (pm-sim).
-- The table is closed to the public API: the browser only calls submit_score() and top_scores(),
-- which validate input and never expose the player's secret token.

create table if not exists public.leaderboard (
  id          bigint generated always as identity primary key,
  token_hash  text not null unique,              -- sha256 of the player's secret token (kept in their browser)
  name        text not null,
  linkedin    text,
  score       int  not null check (score between 0 and 100),
  grade       text not null,
  mrr_x       numeric(6,2) not null check (mrr_x between 0 and 20),
  ltv_cac     numeric(6,2) not null check (ltv_cac between 0 and 50),
  months      int  not null check (months between 1 and 10),
  bust        boolean not null default false,
  lang        text not null default 'en' check (lang in ('ru','en')),
  runs        int  not null default 1,
  created_at  timestamptz not null default now(),
  scored_at   timestamptz not null default now()  -- when the best score was set; breaks ties
);
create unique index if not exists leaderboard_name_ci on public.leaderboard (lower(name));
create index if not exists leaderboard_rank on public.leaderboard (score desc, scored_at asc);

alter table public.leaderboard enable row level security;
-- no policies on purpose: anon and authenticated roles cannot read or write the table directly
revoke all on table public.leaderboard from anon, authenticated;

-- same thresholds as finalScore() in index.html
create or replace function public.grade_for(p_score int)
returns text language sql immutable set search_path = '' as $$
  select case
    when p_score >= 90 then 'Head of Product'
    when p_score >= 80 then 'Lead PM'
    when p_score >= 65 then 'Senior PM'
    when p_score >= 50 then 'Middle PM'
    when p_score >= 35 then 'Junior PM'
    else 'Intern' end
$$;

create or replace function public.submit_score(
  p_token text, p_name text, p_linkedin text,
  p_score int, p_s1 numeric, p_s2 numeric, p_biz numeric,
  p_mrr_x numeric, p_ltv_cac numeric, p_months int, p_bust boolean, p_lang text
) returns json
language plpgsql security definer set search_path = '' as $$
declare
  v_hash  text := encode(sha256(convert_to(coalesce(p_token,''), 'UTF8')), 'hex');
  v_name  text := btrim(regexp_replace(coalesce(p_name,''), '\s+', ' ', 'g'));
  v_li    text := nullif(btrim(coalesce(p_linkedin,'')), '');
  v_total numeric;
  v_row   public.leaderboard;
  v_rank  bigint;
  v_count bigint;
begin
  if length(coalesce(p_token,'')) < 32 then raise exception 'bad_token'; end if;
  if v_name !~ '^[A-Za-zА-Яа-яЁё0-9 ._-]{2,24}$' then raise exception 'bad_name'; end if;
  if v_li is not null and v_li !~ '^https://([a-z]{2,3}\.)?linkedin\.com/in/[A-Za-z0-9_%-]{2,100}/?$' then raise exception 'bad_linkedin'; end if;
  if p_lang not in ('ru','en') then raise exception 'bad_lang'; end if;
  if p_s1 not between 0 and 1 or p_s2 not between 0 and 1 or p_biz not between 0 and 1 then raise exception 'bad_parts'; end if;
  if not p_bust and p_months <> 10 then raise exception 'bad_months'; end if;
  -- the score must follow from its parts, the same formula as in the game
  v_total := 0.6 * (p_s1 + p_s2) / 2 + 0.4 * p_biz;
  if p_bust then v_total := least(0.45, v_total); end if;
  if abs(round(v_total * 100) - p_score) > 1 then raise exception 'bad_score'; end if;
  if exists (select 1 from public.leaderboard where lower(name) = lower(v_name) and token_hash <> v_hash) then
    raise exception 'name_taken';
  end if;

  insert into public.leaderboard as l (token_hash, name, linkedin, score, grade, mrr_x, ltv_cac, months, bust, lang)
  values (v_hash, v_name, v_li, p_score, public.grade_for(p_score), round(p_mrr_x, 2), round(p_ltv_cac, 2), p_months, p_bust, p_lang)
  on conflict (token_hash) do update set
    name     = excluded.name,
    linkedin = excluded.linkedin,
    runs     = l.runs + 1,
    -- keep the best run only
    score    = case when excluded.score > l.score then excluded.score    else l.score    end,
    grade    = case when excluded.score > l.score then excluded.grade    else l.grade    end,
    mrr_x    = case when excluded.score > l.score then excluded.mrr_x    else l.mrr_x    end,
    ltv_cac  = case when excluded.score > l.score then excluded.ltv_cac  else l.ltv_cac  end,
    months   = case when excluded.score > l.score then excluded.months   else l.months   end,
    bust     = case when excluded.score > l.score then excluded.bust     else l.bust     end,
    lang     = case when excluded.score > l.score then excluded.lang     else l.lang     end,
    scored_at= case when excluded.score > l.score then now()             else l.scored_at end
  returning * into v_row;

  select count(*) + 1 into v_rank from public.leaderboard
    where score > v_row.score or (score = v_row.score and scored_at < v_row.scored_at);
  select count(*) into v_count from public.leaderboard;
  return json_build_object('rank', v_rank, 'total', v_count, 'best', v_row.score, 'improved', v_row.score = p_score);
end;
$$;

create or replace function public.top_scores(p_limit int default 20)
returns table (rank bigint, name text, linkedin text, score int, grade text, mrr_x numeric, ltv_cac numeric, bust boolean, total bigint)
language sql stable security definer set search_path = '' as $$
  select row_number() over (order by l.score desc, l.scored_at asc),
         l.name, l.linkedin, l.score, l.grade, l.mrr_x, l.ltv_cac, l.bust,
         count(*) over ()
  from public.leaderboard l
  order by l.score desc, l.scored_at asc
  limit least(greatest(coalesce(p_limit, 20), 1), 100)
$$;

revoke all on function public.grade_for(int) from public, anon, authenticated;
revoke all on function public.submit_score(text, text, text, int, numeric, numeric, numeric, numeric, numeric, int, boolean, text) from public;
revoke all on function public.top_scores(int) from public;
grant execute on function public.submit_score(text, text, text, int, numeric, numeric, numeric, numeric, numeric, int, boolean, text) to anon, authenticated;
grant execute on function public.top_scores(int) to anon, authenticated;
