

  create or replace view `fivetran-wild-west`.`jmc_bq_sql`.`ref`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `fivetran-wild-west`.`jmc_bq_sql`.`unionAll`
where id = 12345;

