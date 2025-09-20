with formatting as (
    select
        -- PK
        -- columns
        lower(account_name) as account_name
        ,lower(dba) as dba
        ,business_license_app_category_name as license_type
        ,strptime(expire_date, '%m/%d/%Y')::date as license_expiration_date
        ,lower(city) as city
        ,state
        ,lower(county) as county
    from {{ source('google_sheets', 'statistics_licenses') }}
)
select 
    {{ dbt_utils.generate_surrogate_key(['account_name', 'dba', 'license_type']) }} as active_license_sk
    ,{{ dbt_utils.generate_surrogate_key(['account_name', 'dba', 'city', 'county', 'state']) }} as facility_sk
    ,*
from formatting