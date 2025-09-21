select
    active_license_sk
    ,license_category
    ,license_type
    ,license_expiration_date
from {{ ref('src_google_sheets__active_licenses') }}