-- Portuguese (pt) as a third language for leaderboard rows, certificates and case checks.
-- 1. the columns accept 'pt'
alter table public.leaderboard  drop constraint if exists leaderboard_lang_check;
alter table public.leaderboard  add  constraint leaderboard_lang_check  check (lang in ('ru','en','pt'));
alter table public.certificates drop constraint if exists certificates_lang_check;
alter table public.certificates add  constraint certificates_lang_check check (lang in ('ru','en','pt'));
alter table public.case_checks  drop constraint if exists case_checks_lang_check;
alter table public.case_checks  add  constraint case_checks_lang_check  check (lang in ('ru','en','pt'));

-- 2. submit_score() and issue_certificate() stop rejecting 'pt' (the rest of each function is unchanged)
do $$
declare f record; src text;
begin
  for f in select p.oid from pg_proc p join pg_namespace n on n.oid = p.pronamespace
           where n.nspname = 'public' and p.proname in ('submit_score', 'issue_certificate') loop
    src := pg_get_functiondef(f.oid);
    if position('p_lang not in (''ru'',''en'')' in src) > 0 then
      execute replace(src, 'p_lang not in (''ru'',''en'')', 'p_lang not in (''ru'',''en'',''pt'')');
    end if;
  end loop;
end $$;

-- check: both rows should show true
select p.proname, position('''pt''' in pg_get_functiondef(p.oid)) > 0 as accepts_pt
from pg_proc p join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public' and p.proname in ('submit_score', 'issue_certificate');
