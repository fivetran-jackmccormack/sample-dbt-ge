{%- set event_relations = dbt_utils.get_relations_by_pattern('cli%', 'teachers%') -%}

with relationsJoined as (

    select *  from {{ union_relations_where(relations=event_relations) }}
)




 select * from relationsJoined
