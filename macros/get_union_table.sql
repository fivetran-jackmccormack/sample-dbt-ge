{% macro get_union_table(tableName) -%}

{% set schema_names = get_Schemas() %}

{% for schema in schema_names %}
(
  select
    '{{ schema }}' as schema_name,
    *
  from {{ schema }}.{{ tableName }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where _fivetran_synced > (select max(_fivetran_synced) from {{ schema }}.fivetran_audit
  where table = '{{ tableName }}' and update_started not in (select max(_fivetran_synced) from {{ schema }}.fivetran_audit where table = '{{ tableName }}'))

{% endif %}

)

{% if not loop.last %}

union all

{% endif %}
{% endfor %}
{%- endmacro %}