with formatting as (
    select
        -- PK
        -- columns
        account_name as account_name
        ,dba as dba
        ,business_license_app_category_name as license_category
        ,case when contains(license_category,'Sanctuary') then 'Sanctuary'
            when contains(license_category,'Rescue') then 'Rescue'
            when contains(license_category,'Shelter') then 'Shelter'
            when contains(license_category,'Breeder') then 'Breeder'
            else 'Other'
            end as license_type
        ,strptime(expire_date, '%m/%d/%Y')::date as license_expiration_date
        ,city
        ,state
        ,county
    from {{ source('google_sheets', 'gsheet_active_licenses') }}
)
select 
    {{ dbt_utils.generate_surrogate_key(['account_name', 'dba', 'license_category']) }} as active_license_sk
    ,{{ dbt_utils.generate_surrogate_key(['account_name', 'dba', 'city', 'county', 'state']) }} as facility_sk
    ,*
from formatting