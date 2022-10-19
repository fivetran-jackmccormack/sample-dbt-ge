


(
  select
    'cli12345_dbo' as schema_name,
    ID,
    LastName,
    FirstName,
    Subject
  from cli12345_dbo.teachers



  -- this filter will only be applied on an incremental run
  where _fivetran_synced > (select max(update_started) from cli12345_dbo.fivetran_audit
  where table = 'teachers' and update_started not in (select max(update_started) from cli12345_dbo.fivetran_audit where table = 'teachers'))


)

union all


(
  select
    'cli12245_dbo' as schema_name,
    ID,
    LastName,
    FirstName,
    Subject
  from cli12245_dbo.teachers



  -- this filter will only be applied on an incremental run
  where _fivetran_synced > (select max(update_started) from cli12245_dbo.fivetran_audit
  where table = 'teachers' and update_started not in (select max(update_started) from cli12245_dbo.fivetran_audit where table = 'teachers'))


)

