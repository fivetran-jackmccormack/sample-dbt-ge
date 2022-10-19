


(
  select
    'cli12345_dbo' as schema_name,
    ID,
    LastName,
    FirstName,
    Subject
  from cli12345_dbo.teachers
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
)

