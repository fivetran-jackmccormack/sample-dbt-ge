{% set schema_names = get_Schemas() %}

{% for schema in schema_names %}
(
  select
    '{{ schema }}' as schema_name,
    ID,
    LastName,
    FirstName,
    Subject,
    _fivetran_synced
  from {{ schema }}.teachers
  {% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where _fivetran_synced > (select max(update_started) from {{ schema.fivetran_audit }})

{% endif %}
)
{% if not loop.last %}
union all
{% endif %}
{% endfor %}

