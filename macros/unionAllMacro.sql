{% set var schema_names=('cli12345', 'cli12345') %}


select * from (


{% for schema in schema_names %}
(
  select
    '{{ cli_schema }}' as schema_name,
    'ID',
    'LastName',
    'FirstName',
    'Subject'
  from {{ schema }}.Teachers
)
{% if not loop.last %}
union all
{% endif %}
{% endfor %}
)
