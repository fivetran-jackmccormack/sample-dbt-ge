select * from (
{{ get_union_table('students') }}
)