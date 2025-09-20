-- any configuration here?
select *
from {{ source('google_sheets', 'gsheet_2019_stats') }}

--_dlt_load_id
--_dlt_id