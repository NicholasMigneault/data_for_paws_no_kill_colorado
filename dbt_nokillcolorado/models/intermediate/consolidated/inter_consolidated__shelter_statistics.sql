-- TODO: Add pre '15 data
-- README, video
with consolidated as (
    select *
    from {{ ref('inter_google_sheets__2024_statistics') }}
    union
    select *
    from {{ ref('inter_google_sheets__2023_statistics') }}
    union
    select *
    from {{ ref('inter_google_sheets__2022_statistics') }}
    union
    select *
    from {{ ref('inter_google_sheets__2021_statistics') }}
    union
    select *
    from {{ ref('inter_google_sheets__2020_statistics') }}
    union
    select *
    from {{ ref('inter_google_sheets__2019_statistics') }}
    union
    select *
    from {{ ref('inter_google_sheets__2018_statistics') }}
    union
    select *
    from {{ ref('inter_cim__2017_statistics') }}
    union
    select *
    from {{ ref('inter_cim__2016_statistics') }}
    union
    select *
    from {{ ref('inter_cim__2015_statistics') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['year', 'animal_category', 'animal_type', 'facility_name']) }} as statistic_sk
    ,{{ dbt_utils.generate_surrogate_key(['facility_name']) }} as facility_sk
    ,*
from consolidated
