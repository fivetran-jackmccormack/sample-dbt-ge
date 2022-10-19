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
  where _fivetran_synced > (select max(update_started) from {{ schema }}.fivetran_audit
  where table = '{{ schema }}' and update_started not in (select max(update_started) from {{ schema }}.fivetran_audit where table = '{{ schema }}'))

{% endif %}
)
{% if not loop.last %}
union all
{% endif %}
{% endfor %}

