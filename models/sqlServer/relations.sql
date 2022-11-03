{{
  config(
    materialized = 'ephemeral',
    )
}}
{%- set event_relations = dbt_utils.get_relations_by_pattern('cli%', 'teachers%') -%}
{{ dbt_utils.union_relations(relations = event_relations) }}

