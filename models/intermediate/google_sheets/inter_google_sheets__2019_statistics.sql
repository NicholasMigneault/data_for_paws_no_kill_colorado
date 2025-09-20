with dogs as (
    select
        facility_name
        ,'dog' as animal_category
        ,'adult' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_dogs_adult                          as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_dogs_adult                         as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_dogs_adult                                                      as intake_stray
        ,animal_intake_statistics_owner_relinquished_dogs_adult                                         as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_dogs_adult                   as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_dogs_adult              as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_dogs_adult   as intake_other
        ,animal_outcome_statistics_adoption_dogs_adult                                                  as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_dogs_adult                                           as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_dogs_adult                   as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_dogs_adult              as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_dogs_adult                                       as outcome_other
        ,animal_outcome_statistics_deaths_dogs_adult                                                    as outcome_deaths
        ,animal_outcome_statistics_euthanasia_dogs_adult                                                as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_dogs_adult                                            as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_dogs_adult                          as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_dogs_adult                           as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
    union
    select
        facility_name
        ,'dog' as animal_category
        ,'juvenile' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_dogs_juvenile                           as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_dogs_juvenile                          as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_dogs_juvenile                                                       as intake_stray
        ,animal_intake_statistics_owner_relinquished_dogs_juvenile                                          as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_dogs_juvenile                    as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_dogs_juvenile               as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_dogs_juvenile    as intake_other
        ,animal_outcome_statistics_adoption_dogs_juvenile                                                   as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_dogs_juvenile                                            as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_dogs_juvenile                    as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_dogs_juvenile               as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_dogs_juvenile                                        as outcome_other
        ,animal_outcome_statistics_deaths_dogs_juvenile                                                     as outcome_deaths
        ,animal_outcome_statistics_euthanasia_dogs_juvenile                                                 as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_dogs_juvenile                                             as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_dogs_juvenile                           as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_dogs_juvenile                            as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
)
, cats as (
    select
        facility_name
        ,'cat' as animal_category
        ,'adult' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_cats_adult                          as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_cats_adult                         as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_cats_adult                                                      as intake_stray
        ,animal_intake_statistics_owner_relinquished_cats_adult                                         as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_cats_adult                   as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_cats_adult              as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_cats_adult   as intake_other
        ,animal_outcome_statistics_adoption_cats_adult                                                  as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_cats_adult                                           as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_cats_adult                   as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_cats_adult              as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_cats_adult                                       as outcome_other
        ,animal_outcome_statistics_deaths_cats_adult                                                    as outcome_deaths
        ,animal_outcome_statistics_euthanasia_cats_adult                                                as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_cats_adult                                            as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_cats_adult                          as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_cats_adult                           as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
    union
    select
        facility_name
        ,'cat' as animal_category
        ,'juvenile' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_cats_juvenile                           as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_cats_juvenile                          as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_cats_juvenile                                                       as intake_stray
        ,animal_intake_statistics_owner_relinquished_cats_juvenile                                          as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_cats_juvenile                    as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_cats_juvenile               as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_cats_juvenile    as intake_other
        ,animal_outcome_statistics_adoption_cats_juvenile                                                   as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_cats_juvenile                                            as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_cats_juvenile                    as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_cats_juvenile               as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_cats_juvenile                                        as outcome_other
        ,animal_outcome_statistics_deaths_cats_juvenile                                                     as outcome_deaths
        ,animal_outcome_statistics_euthanasia_cats_juvenile                                                 as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_cats_juvenile                                             as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_cats_juvenile                           as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_cats_juvenile                            as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
)
, other as (
    select
        facility_name
        ,'other' as animal_category
        ,'birds' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_birds                           as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_birds                          as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_birds                                                       as intake_stray
        ,animal_intake_statistics_owner_relinquished_birds                                          as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_birds                    as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_birds               as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_birds    as intake_other
        ,animal_outcome_statistics_adoption_birds                                                   as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_birds                                            as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_birds                    as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_birds               as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_birds                                        as outcome_other
        ,animal_outcome_statistics_deaths_birds                                                     as outcome_deaths
        ,animal_outcome_statistics_euthanasia_birds                                                 as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_birds                                             as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_birds                           as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_birds                            as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'small mammals' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_small_mammals                           as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_small_mammals                          as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_small_mammals                                                       as intake_stray
        ,animal_intake_statistics_owner_relinquished_small_mammals                                          as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_small_mammals                    as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_small_mammals               as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_small_mammals    as intake_other
        ,animal_outcome_statistics_adoption_small_mammals                                                   as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_small_mammals                                            as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_small_mammals                    as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_small_mammals               as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_small_mammals                                        as outcome_other
        ,animal_outcome_statistics_deaths_small_mammals                                                     as outcome_deaths
        ,animal_outcome_statistics_euthanasia_small_mammals                                                 as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_small_mammals                                             as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_small_mammals                           as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_small_mammals                            as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'reptiles and amphibians' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_reptiles_amphibians                         as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_reptiles_amphibians                        as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_reptiles_amphibians                                                     as intake_stray
        ,animal_intake_statistics_owner_relinquished_reptiles_amphibians                                        as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_reptiles_amphibians                  as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_reptiles_amphibians             as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_reptiles_amphibians  as intake_other
        ,animal_outcome_statistics_adoption_reptiles_amphibians                                                 as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_reptiles_amphibians                                          as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_reptiles_amphibians                  as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_reptiles_amphibians             as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_reptiles_amphibians                                      as outcome_other
        ,animal_outcome_statistics_deaths_reptiles_amphibians                                                   as outcome_deaths
        ,animal_outcome_statistics_euthanasia_reptiles_amphibians                                               as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_reptiles_amphibians                                           as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_reptiles_amphibians                         as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_reptiles_amphibians                          as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'rabbits' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_rabbits                         as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_rabbits                        as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_rabbits                                                     as intake_stray
        ,animal_intake_statistics_owner_relinquished_rabbits                                        as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_rabbits                  as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_rabbits             as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_rabbits  as intake_other
        ,animal_outcome_statistics_adoption_rabbits                                                 as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_rabbits                                          as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_rabbits                  as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_rabbits             as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_rabbits                                      as outcome_other
        ,animal_outcome_statistics_deaths_rabbits                                                   as outcome_deaths
        ,animal_outcome_statistics_euthanasia_rabbits                                               as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_rabbits                                           as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_rabbits                         as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_rabbits                          as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'other' as animal_type
        ,starting_animal_statistics_in_shelter_count_as_of_1_1_2019_other_fish_livestock_etcx                           as start_of_year_in_shelter_count
        ,starting_animal_statistics_in_foster_care_count_as_1_1_2019_other_fish_livestock_etcx                          as start_of_year_in_foster_care_count
        ,animal_intake_statistics_stray_other_fish_livestock_etcx                                                       as intake_stray
        ,animal_intake_statistics_owner_relinquished_other_fish_livestock_etcx                                          as intake_relinquished
        ,animal_intake_statistics_transfer_in_from_a_colorado_organization_other_fish_livestock_etcx                    as intake_in_state_transfer
        ,animal_intake_statistics_transfer_in_from_an_out_of_state_organization_other_fish_livestock_etcx               as intake_out_of_state_transfer
        ,animal_intake_statistics_other_tnr_protective_custody_returns_disaster_relief_etc_other_fish_livestock_etcx    as intake_other
        ,animal_outcome_statistics_adoption_other_fish_livestock_etcx                                                   as outcome_adoption
        ,animal_outcome_statistics_return_to_owner_other_fish_livestock_etcx                                            as outcome_return_to_owner
        ,animal_outcome_statistics_transfer_out_to_a_colorado_organization_other_fish_livestock_etcx                    as outcome_in_state_transfer
        ,animal_outcome_statistics_transfer_out_to_an_out_of_state_organization_other_fish_livestock_etcx               as outcome_out_of_state_transfer
        ,animal_outcome_statistics_other_live_outcomes_other_fish_livestock_etcx                                        as outcome_other
        ,animal_outcome_statistics_deaths_other_fish_livestock_etcx                                                     as outcome_deaths
        ,animal_outcome_statistics_euthanasia_other_fish_livestock_etcx                                                 as outcome_euthanasia
        ,animal_outcome_statistics_missing_stolen_other_fish_livestock_etcx                                             as outcome_missing_or_stolen
        ,ending_animal_statistics_in_shelter_count_as_of_12_31_2019_other_fish_livestock_etcx                           as end_of_year_in_shelter_count
        ,ending_animal_statistics_in_foster_count_as_of_12_31_2019_other_fish_livestock_etcx                            as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2019_statistics') }}
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
    select '2019' as year
        ,make_date(2019,1,1) as start_of_year_date
        ,make_date(2019,12,31) as end_of_year_date
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
