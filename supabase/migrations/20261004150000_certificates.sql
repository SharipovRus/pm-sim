-- Certificates of completion for Rhythm (pm-sim).
-- Issued only for full 10-month runs without going bust; anyone can verify one by its public id.
-- Like the leaderboard, the table is closed: the browser only calls issue_certificate() and get_certificate().

create table if not exists public.certificates (
  id         text primary key,                  -- public id, e.g. 'K7Q2-9XMB'
  name       text not null,
  grade      text not null,
  score      int  not null check (score between 0 and 100),
  mrr_x      numeric(6,2) not null check (mrr_x between 0 and 20),
  ltv_cac    numeric(6,2) not null check (ltv_cac between 0 and 50),
  retention  numeric(5,2) not null check (retention between 0 and 100),
  tranche    text not null check (tranche in ('full','half','none')),
  lang       text not null default 'en' check (lang in ('ru','en')),
  issued_at  timestamptz not null default now()
);

alter table public.certificates enable row level security;
revoke all on table public.certificates from anon, authenticated;

create or replace function public.issue_certificate(
  p_name text, p_score int, p_s1 numeric, p_s2 numeric, p_biz numeric,
  p_mrr_x numeric, p_ltv_cac numeric, p_retention numeric, p_tranche text, p_lang text
) returns json
language plpgsql security definer set search_path = '' as $$
declare
  v_name  text := btrim(regexp_replace(coalesce(p_name,''), '\s+', ' ', 'g'));
  v_total numeric;
  v_id    text;
  v_row   public.certificates;
begin
  if v_name !~ '^[A-Za-zÀ-ÖØ-öø-ÿĀ-žА-Яа-яЁё][A-Za-zÀ-ÖØ-öø-ÿĀ-žА-Яа-яЁё .''’-]{1,59}$' then raise exception 'bad_name'; end if;
  if p_lang not in ('ru','en') then raise exception 'bad_lang'; end if;
  if p_tranche not in ('full','half','none') then raise exception 'bad_tranche'; end if;
  if p_s1 not between 0 and 1 or p_s2 not between 0 and 1 or p_biz not between 0 and 1 then raise exception 'bad_parts'; end if;
  -- full runs only (no bust cap), and the score must follow from its parts as in finalScore()
  v_total := 0.6 * (p_s1 + p_s2) / 2 + 0.4 * p_biz;
  if abs(round(v_total * 100) - p_score) > 1 then raise exception 'bad_score'; end if;

  loop
    v_id := upper(substr(md5(gen_random_uuid()::text), 1, 4) || '-' || substr(md5(gen_random_uuid()::text), 1, 4));
    exit when not exists (select 1 from public.certificates where id = v_id);
  end loop;

  insert into public.certificates (id, name, grade, score, mrr_x, ltv_cac, retention, tranche, lang)
  values (v_id, v_name, public.grade_for(p_score), p_score, round(p_mrr_x, 2), round(p_ltv_cac, 2), round(p_retention, 2), p_tranche, p_lang)
  returning * into v_row;
  return row_to_json(v_row);
end;
$$;

create or replace function public.get_certificate(p_id text)
returns json language sql stable security definer set search_path = '' as $$
  select row_to_json(c) from public.certificates c where c.id = upper(btrim(coalesce(p_id,'')))
$$;

revoke all on function public.issue_certificate(text, int, numeric, numeric, numeric, numeric, numeric, numeric, text, text) from public;
revoke all on function public.get_certificate(text) from public;
grant execute on function public.issue_certificate(text, int, numeric, numeric, numeric, numeric, numeric, numeric, text, text) to anon, authenticated;
grant execute on function public.get_certificate(text) to anon, authenticated;
