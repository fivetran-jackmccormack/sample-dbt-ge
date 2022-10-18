-- Use the `ref` function to select from other models

select *
from `fivetran-wild-west`.`jmc_bq_sql`.`my_first_dbt_model`
where id = 1