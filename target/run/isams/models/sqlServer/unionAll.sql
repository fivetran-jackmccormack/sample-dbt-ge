
        
        
    

    

    merge into `fivetran-wild-west`.`jmc_bq_sql`.`unionAll` as DBT_INTERNAL_DEST
        using (
          select * from `fivetran-wild-west`.`jmc_bq_sql`.`unionAll__dbt_tmp`
        ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.ID = DBT_INTERNAL_DEST.ID
        

    
    when matched then update set
        `schema_name` = DBT_INTERNAL_SOURCE.`schema_name`,`ID` = DBT_INTERNAL_SOURCE.`ID`,`LastName` = DBT_INTERNAL_SOURCE.`LastName`,`FirstName` = DBT_INTERNAL_SOURCE.`FirstName`,`Subject` = DBT_INTERNAL_SOURCE.`Subject`
    

    when not matched then insert
        (`schema_name`, `ID`, `LastName`, `FirstName`, `Subject`)
    values
        (`schema_name`, `ID`, `LastName`, `FirstName`, `Subject`)


  