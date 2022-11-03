select * from {{ ref('relations') }}


/*
with jointTables as (
    select * from {{ ref('relations') }}
)
select * from jointTables

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where _fivetran_synced > (select max(_fivetran_synced) from relation.fivetran_audit
  where table = 'teachers' and update_started not in (select max(_fivetran_synced) from relation.fivetran_audit where table = 'teachers'))

{% endif %}
*/