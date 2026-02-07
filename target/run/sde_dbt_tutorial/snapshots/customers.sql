
      
  
    
    

    create  table
      "dbt"."snapshots"."customers_snapshot"
  
    as (
      
    

    select *,
        md5(coalesce(cast(customer_id as varchar ), '')
         || '|' || coalesce(cast(datetime_updated as varchar ), '')
        ) as dbt_scd_id,
        datetime_updated as dbt_updated_at,
        datetime_updated as dbt_valid_from,
        
  
  coalesce(nullif(datetime_updated, datetime_updated), null)
  as dbt_valid_to
from (
        



select * from './raw_data/customers.csv'

    ) sbq



    );
  
  
  