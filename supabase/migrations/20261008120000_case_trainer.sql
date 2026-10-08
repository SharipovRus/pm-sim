-- Case trainer (cases/ + the case-trainer Edge Function).
-- One row per AI check of an answer. Used for daily limits and to see how the beta is used.
-- Answer texts are NOT stored. Only the Edge Function (secret key) can call these functions.

create table if not exists public.case_checks (
  id          bigint generated always as identity primary key,
  player      text not null,                 -- random id from the player's browser (ritm-cases-id)
  ip_hash     text,                          -- salted sha256 of the IP, null for the owner
  case_id     text not null,
  kind        text not null default 'answer' check (kind in ('answer','followup')),
  lang        text not null default 'ru' check (lang in ('ru','en')),
  score       int check (score between 0 and 100),
  created_at  timestamptz not null default now()
);
create index if not exists case_checks_player on public.case_checks (player, created_at);
create index if not exists case_checks_ip on public.case_checks (ip_hash, created_at);
create index if not exists case_checks_time on public.case_checks (created_at);

alter table public.case_checks enable row level security;
-- no policies on purpose: the browser never touches this table
revoke all on table public.case_checks from anon, authenticated;

-- takes one check if the player, the IP and the whole service are under their 24-hour limits
create or replace function public.case_check_take(
  p_player text, p_ip text, p_case text, p_kind text, p_lang text,
  p_player_limit int, p_ip_limit int, p_global_limit int)
returns table(ok boolean, reason text, used int, check_id bigint)
language plpgsql security definer set search_path = '' as $$
declare n_player int; n_ip int; n_all int; new_id bigint;
begin
  select count(*) into n_player from public.case_checks c where c.player = p_player and c.created_at > now() - interval '24 hours';
  if n_player >= p_player_limit then return query select false, 'player'::text, n_player, null::bigint; return; end if;
  if p_ip is not null then
    select count(*) into n_ip from public.case_checks c where c.ip_hash = p_ip and c.created_at > now() - interval '24 hours';
    if n_ip >= p_ip_limit then return query select false, 'ip'::text, n_player, null::bigint; return; end if;
  end if;
  select count(*) into n_all from public.case_checks c where c.created_at > now() - interval '24 hours';
  if n_all >= p_global_limit then return query select false, 'global'::text, n_player, null::bigint; return; end if;
  insert into public.case_checks (player, ip_hash, case_id, kind, lang)
    values (p_player, p_ip, p_case, coalesce(p_kind, 'answer'), coalesce(p_lang, 'ru'))
    returning id into new_id;
  return query select true, null::text, n_player + 1, new_id;
end $$;

create or replace function public.case_check_usage(p_player text)
returns int language sql stable security definer set search_path = '' as $$
  select count(*)::int from public.case_checks c where c.player = p_player and c.created_at > now() - interval '24 hours';
$$;

create or replace function public.case_check_score(p_id bigint, p_score int)
returns void language sql security definer set search_path = '' as $$
  update public.case_checks set score = greatest(0, least(100, p_score)) where id = p_id;
$$;

-- a failed check (Claude or network error) doesn't count against the limits
create or replace function public.case_check_refund(p_id bigint)
returns void language sql security definer set search_path = '' as $$
  delete from public.case_checks where id = p_id and score is null;
$$;

revoke all on function public.case_check_take(text, text, text, text, text, int, int, int) from public, anon, authenticated;
revoke all on function public.case_check_usage(text) from public, anon, authenticated;
revoke all on function public.case_check_score(bigint, int) from public, anon, authenticated;
revoke all on function public.case_check_refund(bigint) from public, anon, authenticated;
grant execute on function public.case_check_take(text, text, text, text, text, int, int, int) to service_role;
grant execute on function public.case_check_usage(text) to service_role;
grant execute on function public.case_check_score(bigint, int) to service_role;
grant execute on function public.case_check_refund(bigint) to service_role;
