{% set schema_names = get_Schemas() %}

{% for schema in schema_names %}
(
  select
    '{{ schema }}' as schema_name,
    ID,
    LastName,
    FirstName,
    Subject
  from {{ schema }}.teachers

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where _fivetran_synced > (select max(_fivetran_synced) from {{ schema }}.fivetran_audit
  where table = 'teachers' and update_started not in (select max(_fivetran_synced) from {{ schema }}.fivetran_audit where table = 'teachers'))

{% endif %}
)
{% if not loop.last %}
union all
{% endif %}
{% endfor %}

