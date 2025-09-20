--TODO - REFACTOR
with dogs as (
    select
        facility_name
        ,'dog' as animal_category
        ,'adult' as animal_type
        ,adult_dogs_in_shelter_count_as_of_1_1_2017                         as start_of_year_in_shelter_count
        ,adult_dogs_in_foster_care_count_1_1_2017                           as start_of_year_in_foster_care_count
        ,adult_dogs_stray                                                   as intake_stray
        ,total_adult_dogs_owner_relinquished                                as intake_relinquished
        ,adult_dogs_transfer_in_from_another_colorado_organization          as intake_in_state_transfer
        ,adult_dogs_transfer_in_from_out_of_state_organization              as intake_out_of_state_transfer
        ,adult_dogs_other_tnr_protective_custody_returns_disaster_relief    as intake_other
        ,adult_dogs_adoption                                                as outcome_adoption
        ,adult_dogs_returned_to_owner_rto                                   as outcome_return_to_owner
        ,adult_dogs_transferred_out_to_another_colorado_organization        as outcome_in_state_transfer
        ,adult_dogs_transferred_to_an_out_of_state_organization             as outcome_out_of_state_transfer
        ,adult_dogs_other_live_outcomes_ie_tnr_snr                          as outcome_other
        ,adult_dogs_died                                                    as outcome_deaths
        ,adult_dogs_shelter_euthanasia                                      as outcome_euthanasia
        ,adult_dogs_missing_stolen                                          as outcome_missing_or_stolen
        ,adult_dogs_in_shelter_count_as_of_12_31_2017                       as end_of_year_in_shelter_count
        ,adult_dogs_in_foster_care_count_12_31_2017                         as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
    union
    select
        facility_name
        ,'dog' as animal_category
        ,'juvenile' as animal_type
        ,juvenile_dogs_in_shelter_count_as_of_1_1_2017                      as start_of_year_in_shelter_count
        ,juvenile_dogs_in_foster_care_count_1_1_2017                        as start_of_year_in_foster_care_count
        ,juvenile_dogs_stray                                                as intake_stray
        ,total_juvenile_dogs_owner_relinquished                             as intake_relinquished
        ,juvenile_dogs_transfer_in_from_another_colorado_organization       as intake_in_state_transfer
        ,juvenile_dogs_transfer_in_from_out_of_state_organization           as intake_out_of_state_transfer
        ,juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief as intake_other
        ,juvenile_dogs_adoption                                             as outcome_adoption
        ,juvenile_dogs_returned_to_owner_rto                                as outcome_return_to_owner
        ,juvenile_dogs_transferred_out_to_another_colorado_organization     as outcome_in_state_transfer
        ,juvenile_dogs_transferred_to_an_out_of_state_organization          as outcome_out_of_state_transfer
        ,juvenile_dogs_other_live_outcomes_ie_tnr_snr                       as outcome_other
        ,juvenile_dogs_died                                                 as outcome_deaths
        ,juvenile_dogs_shelter_euthanasia                                   as outcome_euthanasia
        ,juvenile_dogs_missing_stolen                                       as outcome_missing_or_stolen
        ,juvenile_dogs_in_shelter_count_as_of_12_31_2017                    as end_of_year_in_shelter_count
        ,juvenile_dogs_in_foster_care_count_12_31_2017                      as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
)
, cats as (
    select
        facility_name
        ,'cat' as animal_category
        ,'adult' as animal_type
        ,adult_cats_in_shelter_count_as_of_1_1_2017                         as start_of_year_in_shelter_count
        ,adult_cats_in_foster_care_count_1_1_2017                           as start_of_year_in_foster_care_count
        ,adult_cats_stray                                                   as intake_stray
        ,total_adult_cats_owner_relinquished                                as intake_relinquished
        ,adult_cats_transfer_in_from_another_colorado_organization          as intake_in_state_transfer
        ,adult_cats_transfer_in_from_out_of_state_organization              as intake_out_of_state_transfer
        ,adult_cats_other_tnr_protective_custody_returns_disaster_relief    as intake_other
        ,adult_cats_adoption                                                as outcome_adoption
        ,adult_cats_returned_to_owner_rto                                   as outcome_return_to_owner
        ,adult_cats_transferred_out_to_another_colorado_organization        as outcome_in_state_transfer
        ,adult_cats_transferred_to_an_out_of_state_organization             as outcome_out_of_state_transfer
        ,adult_cats_other_live_outcomes_ie_tnr_snr                          as outcome_other
        ,adult_cats_died                                                    as outcome_deaths
        ,adult_cats_shelter_euthanasia                                      as outcome_euthanasia
        ,adult_cats_missing_stolen                                          as outcome_missing_or_stolen
        ,adult_cats_in_shelter_count_as_of_12_31_2017                       as end_of_year_in_shelter_count
        ,adult_cats_in_foster_care_count_12_31_2017                         as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
    union
    select
        facility_name
        ,'cat' as animal_category
        ,'juvenile' as animal_type
        ,juvenile_cats_in_shelter_count_as_of_1_1_2017                      as start_of_year_in_shelter_count
        ,juvenile_cats_in_foster_care_count_1_1_2017                        as start_of_year_in_foster_care_count
        ,juvenile_cats_stray                                                as intake_stray
        ,total_juvenile_cats_owner_relinquished                             as intake_relinquished
        ,juvenile_cats_transfer_in_from_another_colorado_organization       as intake_in_state_transfer
        ,juvenile_cats_transfer_in_from_out_of_state_organization           as intake_out_of_state_transfer
        ,juvenile_cats_other_tnr_protective_custody_returns_disaster_relief as intake_other
        ,juvenile_cats_adoption                                             as outcome_adoption
        ,juvenile_cats_returned_to_owner_rto                                as outcome_return_to_owner
        ,juvenile_cats_transferred_out_to_another_colorado_organization     as outcome_in_state_transfer
        ,juvenile_cats_transferred_to_an_out_of_state_organization          as outcome_out_of_state_transfer
        ,juvenile_cats_other_live_outcomes_ie_tnr_snr                       as outcome_other
        ,juvenile_cats_died                                                 as outcome_deaths
        ,juvenile_cats_shelter_euthanasia                                   as outcome_euthanasia
        ,juvenile_cats_missing_stolen                                       as outcome_missing_or_stolen
        ,juvenile_cats_in_shelter_count_as_of_12_31_2017                    as end_of_year_in_shelter_count
        ,juvenile_cats_in_foster_care_count_12_31_2017                      as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
)
, other as (
    select
        facility_name
        ,'other' as animal_category
        ,'birds' as animal_type
        ,birds_in_shelter_count_as_of_1_1_2017                      as start_of_year_in_shelter_count
        ,birds_in_foster_care_count_1_1_2017                        as start_of_year_in_foster_care_count
        ,birds_stray                                                as intake_stray
        ,total_birds_owner_relinquished                             as intake_relinquished
        ,birds_transfer_in_from_another_colorado_organization       as intake_in_state_transfer
        ,birds_transfer_in_from_out_of_state_organization           as intake_out_of_state_transfer
        ,birds_other_tnr_protective_custody_returns_disaster_relief as intake_other
        ,birds_adoption                                             as outcome_adoption
        ,birds_returned_to_owner_rto                                as outcome_return_to_owner
        ,birds_transferred_out_to_another_colorado_organization     as outcome_in_state_transfer
        ,birds_transferred_to_an_out_of_state_organization          as outcome_out_of_state_transfer
        ,birds_other_live_outcomes_ie_tnr_snr                       as outcome_other
        ,birds_died                                                 as outcome_deaths
        ,birds_shelter_euthanasia                                   as outcome_euthanasia
        ,birds_missing_stolen                                       as outcome_missing_or_stolen
        ,birds_in_shelter_count_as_of_12_31_2017                    as end_of_year_in_shelter_count
        ,birds_in_foster_care_count_12_31_2017                      as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'small mammals' as animal_type
        ,small_mammal_in_shelter_count_as_of_1_1_2017                   as start_of_year_in_shelter_count
        ,small_mammal_in_foster_care_count_1_1_2017                     as start_of_year_in_foster_care_count
        ,sm_mammal_stray                                                as intake_stray
        ,total_sm_mammal_owner_relinquished                             as intake_relinquished
        ,sm_mammal_transfer_in_from_another_colorado_organization       as intake_in_state_transfer
        ,sm_mammal_transfer_in_from_out_of_state_organization           as intake_out_of_state_transfer
        ,sm_mammal_other_tnr_protective_custody_returns_disaster_relief as intake_other
        ,sm_mammal_adoption                                             as outcome_adoption
        ,sm_mammal_returned_to_owner_rto                                as outcome_return_to_owner
        ,sm_mammal_transferred_out_to_another_colorado_organization     as outcome_in_state_transfer
        ,sm_mammal_transferred_to_an_out_of_state_organization          as outcome_out_of_state_transfer
        ,sm_mammal_other_live_outcomes_ie_tnr_snr                       as outcome_other
        ,sm_mammal_died                                                 as outcome_deaths
        ,sm_mammal_shelter_euthanasia                                   as outcome_euthanasia
        ,sm_mammal_missing_stolen                                       as outcome_missing_or_stolen
        ,sm_mammal_in_shelter_count_as_of_12_31_2017                    as end_of_year_in_shelter_count
        ,sm_mammal_in_foster_care_count_as_of_12_31_2017                as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'reptiles and amphibians' as animal_type
        ,reptiles_amphibians_in_shelter_count_as_of_1_1_2017                        as start_of_year_in_shelter_count
        ,reptiles_amphibians_in_foster_care_count_1_1_2017                          as start_of_year_in_foster_care_count
        ,reptiles_amphibians_stray                                                  as intake_stray
        ,total_reptiles_amphibians_owner_relinquished                               as intake_relinquished
        ,reptiles_amphibians_transfer_in_from_another_colorado_organization         as intake_in_state_transfer
        ,reptiles_amphibians_transfer_in_from_out_of_state_organization             as intake_out_of_state_transfer
        ,reptiles_amphibians_other_tnr_protective_custody_returns_disaster_relief   as intake_other
        ,reptiles_amphibians_adoption                                               as outcome_adoption
        ,reptiles_amphibians_returned_to_owner_rto                                  as outcome_return_to_owner
        ,reptiles_amphibians_transferred_out_to_another_colorado_organization       as outcome_in_state_transfer
        ,reptiles_amphibians_transferred_to_an_out_of_state_organization            as outcome_out_of_state_transfer
        ,reptiles_amphibians_other_live_outcomes_ie_tnr_snr                         as outcome_other
        ,reptiles_amphibians_died                                                   as outcome_deaths
        ,reptiles_amphibians_shelter_euthanasia                                     as outcome_euthanasia
        ,reptiles_amphibians_missing_stolen                                         as outcome_missing_or_stolen
        ,reptiles_amphibians_in_shelter_count_as_of_12_31_2017                      as end_of_year_in_shelter_count
        ,reptiles_amphibians_in_foster_care_count_as_of_12_31_2017                  as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'rabbits' as animal_type
        ,rabbits_in_shelter_count_as_of_1_1_2017                        as start_of_year_in_shelter_count
        ,rabbits_in_foster_care_count_1_1_2017                          as start_of_year_in_foster_care_count
        ,rabbits_stray                                                  as intake_stray
        ,total_rabbits_owner_relinquished                               as intake_relinquished
        ,rabbits_transfer_in_from_another_colorado_organization         as intake_in_state_transfer
        ,rabbits_transfer_in_from_out_of_state_organization             as intake_out_of_state_transfer
        ,rabbits_other_tnr_protective_custody_returns_disaster_relief   as intake_other
        ,rabbits_adoption                                               as outcome_adoption
        ,rabbits_returned_to_owner_rto                                  as outcome_return_to_owner
        ,rabbits_transferred_out_to_another_colorado_organization       as outcome_in_state_transfer
        ,rabbits_transferred_to_an_out_of_state_organization            as outcome_out_of_state_transfer
        ,rabbits_other_live_outcomes_ie_tnr_snr                         as outcome_other
        ,rabbits_died                                                   as outcome_deaths
        ,rabbits_shelter_euthanasia                                     as outcome_euthanasia
        ,rabbits_missing_stolen                                         as outcome_missing_or_stolen
        ,rabbits_in_shelter_count_as_of_12_31_2017                      as end_of_year_in_shelter_count
        ,rabbits_in_foster_care_count_as_of_12_31_2017                  as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'other' as animal_type
        ,other_in_shelter_count_as_of_1_1_2017                  as start_of_year_in_shelter_count
        ,other_in_foster_care_count_1_1_2017                    as start_of_year_in_foster_care_count
        ,other_stray                                            as intake_stray
        ,total_other_owner_relinquished                         as intake_relinquished
        ,other_transfer_in_from_another_colorado_organization   as intake_in_state_transfer
        ,other_transfer_in_from_out_of_state_organization       as intake_out_of_state_transfer
        ,other_tnr_protective_custody_returns_disaster_relief   as intake_other
        ,other_adoption                                         as outcome_adoption
        ,other_returned_to_owner_rto                            as outcome_return_to_owner
        ,other_transferred_out_to_another_colorado_organization as outcome_in_state_transfer
        ,other_transferred_to_an_out_of_state_organization      as outcome_out_of_state_transfer
        ,other_other_live_outcomes_ie_tnr_snr                   as outcome_other
        ,other_died                                             as outcome_deaths
        ,other_shelter_euthanasia                               as outcome_euthanasia
        ,other_missing_stolen                                   as outcome_missing_or_stolen
        ,other_in_shelter_count_as_of_12_31_2017                as end_of_year_in_shelter_count
        ,other_in_foster_care_count_as_of_12_31_2017            as end_of_year_in_foster_care_count
    from {{ ref('src_cim__2017_statistics') }}
)
, consolidated as (
    select *
    from dogs

    union

    select *
    from cats

    union

    select *
    from other
)
,final as (
    select '2017' as year
        ,make_date(2017,1,1) as start_of_year_date
        ,make_date(2017,12,31) as end_of_year_date
        ,*
    from consolidated
    where not (
        start_of_year_in_shelter_count = 0 and
        start_of_year_in_foster_care_count = 0 and
        intake_stray = 0 and
        intake_relinquished = 0 and
        intake_in_state_transfer = 0 and
        intake_out_of_state_transfer = 0 and
        intake_other = 0 and
        outcome_adoption = 0 and
        outcome_return_to_owner = 0 and
        outcome_in_state_transfer = 0 and
        outcome_out_of_state_transfer = 0 and
        outcome_other = 0 and
        outcome_deaths = 0 and
        outcome_euthanasia = 0 and
        outcome_missing_or_stolen = 0 and
        end_of_year_in_shelter_count = 0 and
        end_of_year_in_foster_care_count = 0
        )
)
select *
from final
