{{
  config(
    materialized = 'table',
    )
}}

select *
from {{ ref('inter_consolidated__facilities') }}