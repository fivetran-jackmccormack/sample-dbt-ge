
{% for schema in cli_schemas %}
(
  select
    '{{ schema }}' as schema_name,
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
