{{ config(materialized='ephemeral', unique_key='ID') }}

{%- set event_relations = dbt_utils.get_relations_by_pattern('cli%', 'teachers%') -%}


--{% if is_incremental() %}
{{ union_relations_where(relations=event_relations, tableName='teachers') }}

--{% endif %}

--{{ dbt_utils.union_relations(relations=event_relations) }}

