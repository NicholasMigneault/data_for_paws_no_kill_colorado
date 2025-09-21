{{
  config(
    materialized = 'table',
    )
}}

select *
from {{ ref('inter_consolidated__shelter_statistics') }}