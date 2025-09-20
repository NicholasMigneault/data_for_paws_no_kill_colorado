with dogs as (
    select
        facility_name
        ,'dog' as animal_category
        ,'adult' as animal_type
        ,"1_1_2020_Adult_Dogs_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Adult_Dogs_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Adult_Dogs_Stray"                                        as intake_stray
        ,"2020_Adult_Dogs_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Adult_Dogs_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Adult_Dogs_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Adult_Dogs_Other"                                        as intake_other
        ,"2020_Adult_Dogs_Adoption"                                     as outcome_adoption
        ,"2020_Adult_Dogs_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Adult_Dogs_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Adult_Dogs_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Adult_Dogs_Other_1"                                      as outcome_other
        ,"2020_Adult_Dogs_Deaths"                                       as outcome_deaths
        ,"2020_Adult_Dogs_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Adult_Dogs_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Adult_Dogs_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Adult_Dogs_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
    union
    select
        facility_name
        ,'dog' as animal_category
        ,'juvenile' as animal_type
        ,"1_1_2020_Juvenile_Dogs_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Juvenile_Dogs_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Juvenile_Dogs_Stray"                                        as intake_stray
        ,"2020_Juvenile_Dogs_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Juvenile_Dogs_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Juvenile_Dogs_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Juvenile_Dogs_Other"                                        as intake_other
        ,"2020_Juvenile_Dogs_Adoption"                                     as outcome_adoption
        ,"2020_Juvenile_Dogs_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Juvenile_Dogs_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Juvenile_Dogs_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Juvenile_Dogs_Other_1"                                      as outcome_other
        ,"2020_Juvenile_Dogs_Deaths"                                       as outcome_deaths
        ,"2020_Juvenile_Dogs_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Juvenile_Dogs_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Juvenile_Dogs_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Juvenile_Dogs_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
)
, cats as (
    select
        facility_name
        ,'cat' as animal_category
        ,'adult' as animal_type
        ,"1_1_2020_Adult_Cats_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Adult_Cats_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Adult_Cats_Stray"                                        as intake_stray
        ,"2020_Adult_Cats_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Adult_Cats_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Adult_Cats_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Adult_Cats_Other"                                        as intake_other
        ,"2020_Adult_Cats_Adoption"                                     as outcome_adoption
        ,"2020_Adult_Cats_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Adult_Cats_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Adult_Cats_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Adult_Cats_Other_1"                                      as outcome_other
        ,"2020_Adult_Cats_Deaths"                                       as outcome_deaths
        ,"2020_Adult_Cats_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Adult_Cats_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Adult_Cats_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Adult_Cats_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
    union
    select
        facility_name
        ,'cat' as animal_category
        ,'juvenile' as animal_type
        ,"1_1_2020_Juvenile_Cats_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Juvenile_Cats_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Juvenile_Cats_Stray"                                        as intake_stray
        ,"2020_Juvenile_Cats_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Juvenile_Cats_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Juvenile_Cats_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Juvenile_Cats_Other"                                        as intake_other
        ,"2020_Juvenile_Cats_Adoption"                                     as outcome_adoption
        ,"2020_Juvenile_Cats_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Juvenile_Cats_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Juvenile_Cats_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Juvenile_Cats_Other_1"                                      as outcome_other
        ,"2020_Juvenile_Cats_Deaths"                                       as outcome_deaths
        ,"2020_Juvenile_Cats_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Juvenile_Cats_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Juvenile_Cats_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Juvenile_Cats_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
)
, other as (
    select
        facility_name
        ,'other' as animal_category
        ,'birds' as animal_type
        ,"1_1_2020_Birds_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Birds_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Birds_Stray"                                        as intake_stray
        ,"2020_Birds_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Birds_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Birds_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Birds_Other"                                        as intake_other
        ,"2020_Birds_Adoption"                                     as outcome_adoption
        ,"2020_Birds_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Birds_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Birds_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Birds_Other_1"                                      as outcome_other
        ,"2020_Birds_Deaths"                                       as outcome_deaths
        ,"2020_Birds_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Birds_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Birds_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Birds_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'small mammals' as animal_type
        ,"1_1_2020_Small_Mammals_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Small_Mammals_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Small_Mammals_Stray"                                        as intake_stray
        ,"2020_Small_Mammals_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Small_Mammals_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Small_Mammals_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Small_Mammals_Other"                                        as intake_other
        ,"2020_Small_Mammals_Adoption"                                     as outcome_adoption
        ,"2020_Small_Mammals_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Small_Mammals_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Small_Mammals_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Small_Mammals_Other_1"                                      as outcome_other
        ,"2020_Small_Mammals_Deaths"                                       as outcome_deaths
        ,"2020_Small_Mammals_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Small_Mammals_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Small_Mammals_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Small_Mammals_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'reptiles and amphibians' as animal_type
        ,"1_1_2020_Reptiles_&_Amphibians_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Reptiles_&_Amphibians_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Reptiles_&_Amphibians_Stray"                                        as intake_stray
        ,"2020_Reptiles_&_Amphibians_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Reptiles_&_Amphibians_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Reptiles_&_Amphibians_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Reptiles_&_Amphibians_Other"                                        as intake_other
        ,"2020_Reptiles_&_Amphibians_Adoption"                                     as outcome_adoption
        ,"2020_Reptiles_&_Amphibians_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Reptiles_&_Amphibians_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Reptiles_&_Amphibians_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Reptiles_&_Amphibians_Other_1"                                      as outcome_other
        ,"2020_Reptiles_&_Amphibians_Deaths"                                       as outcome_deaths
        ,"2020_Reptiles_&_Amphibians_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Reptiles_&_Amphibians_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Reptiles_&_Amphibians_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Reptiles_&_Amphibians_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'rabbits' as animal_type
        ,"1_1_2020_Rabbits_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Rabbits_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Rabbits_Stray"                                        as intake_stray
        ,"2020_Rabbits_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Rabbits_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Rabbits_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Rabbits_Other"                                        as intake_other
        ,"2020_Rabbits_Adoption"                                     as outcome_adoption
        ,"2020_Rabbits_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Rabbits_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Rabbits_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Rabbits_Other_1"                                      as outcome_other
        ,"2020_Rabbits_Deaths"                                       as outcome_deaths
        ,"2020_Rabbits_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Rabbits_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Rabbits_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Rabbits_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
    union
    select
        facility_name
        ,'other' as animal_category
        ,'other' as animal_type
        ,"1_1_2020_Other_In_Shelter"                               as start_of_year_in_shelter_count
        ,"1_1_2020_Other_In_Foster_Care"                           as start_of_year_in_foster_care_count
        ,"2020_Other_Stray"                                        as intake_stray
        ,"2020_Other_Owner_Relinquished"                           as intake_relinquished
        ,"2020_Other_Transfer_from_another_Colorado_Organization"  as intake_in_state_transfer
        ,"2020_Other_Transfer_from_Out_of_State"                   as intake_out_of_state_transfer
        ,"2020_Other_Other"                                        as intake_other
        ,"2020_Other_Adoption"                                     as outcome_adoption
        ,"2020_Other_Returned_to_Owner_(RTO)"                      as outcome_return_to_owner
        ,"2020_Other_Transfer_to_another_Colorado_Organization"    as outcome_in_state_transfer
        ,"2020_Other_Transfer_to_Out_of_State"                     as outcome_out_of_state_transfer
        ,"2020_Other_Other_1"                                      as outcome_other
        ,"2020_Other_Deaths"                                       as outcome_deaths
        ,"2020_Other_Euthanasia"                                   as outcome_euthanasia
        ,"2020_Other_Missing_Stolen"                               as outcome_missing_or_stolen
        ,"12_31_2020_Other_In_Shelter"                             as end_of_year_in_shelter_count
        ,"12_31_2020_Other_In_Foster_Care"                         as end_of_year_in_foster_care_count
    from {{ ref('src_google_sheets__2020_statistics') }}
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
    select '2020' as year
        ,make_date(2020,1,1) as start_of_year_date
        ,make_date(2020,12,31) as end_of_year_date
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
