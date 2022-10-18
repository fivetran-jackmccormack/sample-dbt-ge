-- Use the `ref` function to select from other models

select *
from `fivetran-wild-west`.`jmc_bq_sql`.`unionAll`
where id = 12345