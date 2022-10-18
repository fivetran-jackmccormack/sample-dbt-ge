
-- Use the `ref` function to select from other models

select *
from {{ ref('unionAll') }}
where id = 12345
