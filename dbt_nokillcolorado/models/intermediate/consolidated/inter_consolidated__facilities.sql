-- TODO: validate matching/dupes, build out DIM scope
with gsheet_2018 as (
    select
        facility_name
        ,facility_county
    from {{ ref('src_google_sheets__2018_statistics') }}
)
,  cim_2015 as (
    select
        facility_name
        ,pacfa_license_number
        ,facility_address
        ,zip_code
        ,county
    from {{ ref('src_cim__2015_statistics') }}
)
,  cim_2016 as (
    select
        facility_name
        ,pacfa_license_number
        ,location_1__latitude
        ,location_1__longitude
        ,facility_city
        ,county
        ,zip_code
        ,region_polygon
    from {{ ref('src_cim__2016_statistics') }}
)
,  cim_2017 as (
    select
        facility_name
        ,location_1__latitude
        ,location_1__longitude
        ,facility_address
        ,facility_city
        ,facility_state
        ,zip_code
        ,facility_zip_code
        ,county
        ,region_polygon
    from {{ ref('src_cim__2017_statistics') }}
)
, active_licenses as (
    select
        facility_sk
        ,account_name
        ,dba
        ,city
        ,county
        ,state
    from {{ ref('src_google_sheets__active_licenses') }}
)
, base as (
    select distinct facility_name, facility_sk
    from {{ ref('inter_consolidated__shelter_statistics') }}
)

select distinct
    base.facility_sk
    ,base.facility_name
    ,active_licenses.account_name
    ,active_licenses.dba
    ,coalesce(cim_2016.pacfa_license_number, cim_2015.pacfa_license_number) as pacfa_license_number
    ,coalesce(cim_2017.facility_address, cim_2015.facility_address) as address
    ,coalesce(active_licenses.city, cim_2016.facility_city, cim_2017.facility_city) as city
    ,coalesce(active_licenses.county, cim_2016.county, cim_2017.county, cim_2015.county, gsheet_2018.facility_county) as county
    ,coalesce(active_licenses.state, cim_2017.facility_state) as state
    ,coalesce(cim_2015.zip_code, cim_2016.zip_code, cim_2017.zip_code, cim_2017.facility_zip_code) as zip_code
    ,coalesce(cim_2016.location_1__latitude, cim_2017.location_1__latitude) as latitude
    ,coalesce(cim_2016.location_1__longitude, cim_2017.location_1__longitude) as longitude
    ,coalesce(cim_2017.region_polygon, cim_2016.region_polygon) as region_polygon
from base
left join active_licenses
    on lower(base.facility_name) = lower(active_licenses.account_name)
left join cim_2015
    on lower(base.facility_name) = lower(cim_2015.facility_name)
left join cim_2016
    on lower(base.facility_name) = lower(cim_2016.facility_name)
left join cim_2017
    on lower(base.facility_name) = lower(cim_2017.facility_name)
left join gsheet_2018
    on lower(base.facility_name) = lower(gsheet_2018.facility_name)
qualify row_number() over (partition by base.facility_name) = 1