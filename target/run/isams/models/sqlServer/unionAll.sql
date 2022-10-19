

  create or replace view `fivetran-wild-west`.`jmc_bq_sql`.`unionAll`
  OPTIONS()
  as select * from (
unionAllMacro()
);

