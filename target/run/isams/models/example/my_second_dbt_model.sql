

  create or replace view `fivetran-wild-west`.`jmc_bq_sql`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `fivetran-wild-west`.`jmc_bq_sql`.`my_first_dbt_model`
where id = 1;

