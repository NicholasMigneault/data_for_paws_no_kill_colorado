select 
-- list all columns, 0 out nulls
    facility_namex                                                                  as facility_name
    ,lower(county)                                                                  as facility_county
    ,coalesce(adult_dogs_in_shelter_count_as_of_1_1_2018,0)                         as adult_dogs_in_shelter_count_as_of_1_1_2018
    ,coalesce(adult_dogs_in_foster_care_count_1_1_2018,0)                           as adult_dogs_in_foster_care_count_1_1_2018
    ,coalesce(adult_dogs_stray,0)                                                   as adult_dogs_stray
    ,coalesce(adult_dogs_owner_relinquished,0)                                      as adult_dogs_owner_relinquished
    ,coalesce(adult_dogs_owner_requested_euthanasia_upon_intake,0)                  as adult_dogs_owner_requested_euthanasia_upon_intake
    ,coalesce(adult_dogs_owner_requested_euthanasia_upon_intake,0)
        + coalesce(adult_dogs_owner_relinquished,0)                                 as total_adult_dogs_owner_relinquished
    ,coalesce(adult_dogs_transfer_in_from_another_colorado_organization,0)          as adult_dogs_transfer_in_from_another_colorado_organization
    ,coalesce(adult_dogs_transfer_in_from_out_of_state_organization,0)              as adult_dogs_transfer_in_from_out_of_state_organization
    ,coalesce(adult_dogs_other_tnr_protective_custody_returns_disaster_relief,0)    as adult_dogs_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(adult_dogs_adoption,0)                                                as adult_dogs_adoption
    ,coalesce(adult_dogs_returned_to_owner_rtox,0)                                  as adult_dogs_returned_to_owner_rtox
    ,coalesce(adult_dogs_transferred_out_to_another_colorado_organization,0)        as adult_dogs_transferred_out_to_another_colorado_organization
    ,coalesce(adult_dogs_transferred_to_an_out_of_state_organization,0)             as adult_dogs_transferred_to_an_out_of_state_organization
    ,coalesce(adult_dogs_other_live_outcomes_ie_tnr_snrx,0)                         as adult_dogs_other_live_outcomes_ie_tnr_snrx
    ,coalesce(adult_dogs_died,0)                                                    as adult_dogs_died
    ,coalesce(adult_dogs_missing_stolen,0)                                          as adult_dogs_missing_stolen
    ,coalesce(adult_dogs_shelter_euthanasia,0)                                      as adult_dogs_shelter_euthanasia
    ,coalesce(adult_dogs_owner_requested_euthanasia,0)                              as adult_dogs_owner_requested_euthanasia
    ,coalesce(adult_dogs_in_shelter_count_as_of_12_31_2018,0)                       as adult_dogs_in_shelter_count_as_of_12_31_2018
    ,coalesce(adult_dogs_in_foster_care_count_12_31_2018,0)                         as adult_dogs_in_foster_care_count_12_31_2018
    ,coalesce(juvenile_dogs_in_shelter_count_as_of_1_1_2018,0)                      as juvenile_dogs_in_shelter_count_as_of_1_1_2018
    ,coalesce(juvenile_dogs_in_foster_care_count_1_1_2018,0)                        as juvenile_dogs_in_foster_care_count_1_1_2018
    ,coalesce(juvenile_dogs_stray,0)                                                as juvenile_dogs_stray
    ,coalesce(juvenile_dogs_owner_relinquished,0)                                   as juvenile_dogs_owner_relinquished
    ,coalesce(juvenile_dogs_owner_requested_euthanasia_upon_intake,0)               as juvenile_dogs_owner_requested_euthanasia_upon_intake
    ,coalesce(juvenile_dogs_owner_requested_euthanasia_upon_intake,0)
        + coalesce(juvenile_dogs_owner_relinquished,0)                              as total_juvenile_dogs_owner_relinquished
    ,coalesce(juvenile_dogs_transfer_in_from_another_colorado_organization,0)       as juvenile_dogs_transfer_in_from_another_colorado_organization
    ,coalesce(juvenile_dogs_transfer_in_from_out_of_state_organization,0)           as juvenile_dogs_transfer_in_from_out_of_state_organization
    ,coalesce(juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief,0) as juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(juvenile_dogs_adoption,0)                                             as juvenile_dogs_adoption
    ,coalesce(juvenile_dogs_returned_to_owner_rtox,0)                               as juvenile_dogs_returned_to_owner_rtox
    ,coalesce(juvenile_dogs_transferred_out_to_another_colorado_organization,0)     as juvenile_dogs_transferred_out_to_another_colorado_organization
    ,coalesce(juvenile_dogs_transferred_to_an_out_of_state_organization,0)          as juvenile_dogs_transferred_to_an_out_of_state_organization
    ,coalesce(juvenile_dogs_other_live_outcomes_ie_tnr_snrx,0)                      as juvenile_dogs_other_live_outcomes_ie_tnr_snrx
    ,coalesce(juvenile_dogs_died,0)                                                 as juvenile_dogs_died
    ,coalesce(juvenile_dogs_missing_stolen,0)                                       as juvenile_dogs_missing_stolen
    ,coalesce(juvenile_dogs_shelter_euthanasia,0)                                   as juvenile_dogs_shelter_euthanasia
    ,coalesce(juvenile_dogs_owner_requested_euthanasia,0)                           as juvenile_dogs_owner_requested_euthanasia
    ,coalesce(juvenile_dogs_in_shelter_count_as_of_12_31_2018,0)                    as juvenile_dogs_in_shelter_count_as_of_12_31_2018
    ,coalesce(juvenile_dogs_in_foster_care_count_12_31_2018,0)                      as juvenile_dogs_in_foster_care_count_12_31_2018
    ,coalesce(adult_cats_in_shelter_count_as_of_1_1_2018,0)                         as adult_cats_in_shelter_count_as_of_1_1_2018
    ,coalesce(adult_cats_in_foster_care_count_1_1_2018,0)                           as adult_cats_in_foster_care_count_1_1_2018
    ,coalesce(adult_cats_stray,0)                                                   as adult_cats_stray
    ,coalesce(adult_cats_owner_relinquished,0)                                      as adult_cats_owner_relinquished
    ,coalesce(adult_cats_owner_requested_euthanasia_upon_intake,0)                  as adult_cats_owner_requested_euthanasia_upon_intake
    ,coalesce(adult_cats_owner_requested_euthanasia_upon_intake,0)
        + coalesce(adult_cats_owner_relinquished,0)                                 as total_adult_cats_owner_relinquished
    ,coalesce(adult_cats_transfer_in_from_another_colorado_organization,0)          as adult_cats_transfer_in_from_another_colorado_organization
    ,coalesce(adult_cats_transfer_in_from_out_of_state_organization,0)              as adult_cats_transfer_in_from_out_of_state_organization
    ,coalesce(adult_cats_other_tnr_protective_custody_returns_disaster_relief,0)    as adult_cats_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(adult_cats_adoption,0)                                                as adult_cats_adoption
    ,coalesce(adult_cats_returned_to_owner_rtox,0)                                  as adult_cats_returned_to_owner_rtox
    ,coalesce(adult_cats_transferred_to_an_out_of_state_organization,0)             as adult_cats_transferred_to_an_out_of_state_organization
    ,coalesce(adult_cats_other_live_outcomes_ie_tnr_snrx,0)                         as adult_cats_other_live_outcomes_ie_tnr_snrx
    ,coalesce(adult_cats_died,0)                                                    as adult_cats_died
    ,coalesce(adult_cats_missing_stolen,0)                                          as adult_cats_missing_stolen
    ,coalesce(adult_cats_shelter_euthanasia,0)                                      as adult_cats_shelter_euthanasia
    ,coalesce(adult_cats_owner_requested_euthanasia,0)                              as adult_cats_owner_requested_euthanasia
    ,coalesce(adult_cats_in_shelter_count_as_of_12_31_2018,0)                       as adult_cats_in_shelter_count_as_of_12_31_2018
    ,coalesce(adult_cats_in_foster_care_count_12_31_2018,0)                         as adult_cats_in_foster_care_count_12_31_2018
    ,coalesce(juvenile_cats_in_shelter_count_as_of_1_1_2018,0)                      as juvenile_cats_in_shelter_count_as_of_1_1_2018
    ,coalesce(juvenile_cats_in_foster_care_count_1_1_2018,0)                        as juvenile_cats_in_foster_care_count_1_1_2018
    ,coalesce(juvenile_cats_stray,0)                                                as juvenile_cats_stray
    ,coalesce(juvenile_cats_owner_relinquished,0)                                   as juvenile_cats_owner_relinquished
    ,coalesce(juvenile_cats_owner_requested_euthanasia_upon_intake,0)               as juvenile_cats_owner_requested_euthanasia_upon_intake
    ,coalesce(juvenile_cats_owner_requested_euthanasia_upon_intake,0)
        + coalesce(juvenile_cats_owner_relinquished,0)                              as total_juvenile_cats_owner_relinquished
    ,coalesce(juvenile_cats_transfer_in_from_another_colorado_organization,0)       as juvenile_cats_transfer_in_from_another_colorado_organization
    ,coalesce(juvenile_cats_transfer_in_from_out_of_state_organization,0)           as juvenile_cats_transfer_in_from_out_of_state_organization
    ,coalesce(juvenile_cats_other_tnr_protective_custody_returns_disaster_relief,0) as juvenile_cats_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(juvenile_cats_adoption,0)                                             as juvenile_cats_adoption
    ,coalesce(juvenile_cats_returned_to_owner_rtox,0)                               as juvenile_cats_returned_to_owner_rtox
    ,coalesce(juvenile_cats_transferred_out_to_another_colorado_organization,0)     as juvenile_cats_transferred_out_to_another_colorado_organization
    ,coalesce(juvenile_cats_transferred_to_an_out_of_state_organization,0)          as juvenile_cats_transferred_to_an_out_of_state_organization
    ,coalesce(juvenile_cats_other_live_outcomes_ie_tnr_snrx,0)                      as juvenile_cats_other_live_outcomes_ie_tnr_snrx
    ,coalesce(juvenile_cats_died,0)                                                 as juvenile_cats_died
    ,coalesce(juvenile_cats_missing_stolen,0)                                       as juvenile_cats_missing_stolen
    ,coalesce(juvenile_cats_shelter_euthanasia,0)                                   as juvenile_cats_shelter_euthanasia
    ,coalesce(juvenile_cats_owner_requested_euthanasia,0)                           as juvenile_cats_owner_requested_euthanasia
    ,coalesce(juvenile_cats_in_shelter_count_as_of_12_31_2018,0)                    as juvenile_cats_in_shelter_count_as_of_12_31_2018
    ,coalesce(juvenile_cats_in_foster_care_count_12_31_2018,0)                      as juvenile_cats_in_foster_care_count_12_31_2018
    ,coalesce(adult_cats_transferred_out_to_another_colorado_organization,0)        as adult_cats_transferred_out_to_another_colorado_organization
    ,coalesce(birds_in_shelter_count_as_of_1_1_2018,0)                              as birds_in_shelter_count_as_of_1_1_2018
    ,coalesce(birds_in_foster_care_count_1_1_2018,0)                                as birds_in_foster_care_count_1_1_2018
    ,coalesce(birds_stray,0)                                                        as birds_stray
    ,coalesce(birds_owner_relinquished,0)                                           as birds_owner_relinquished
    ,coalesce(birds_owner_requested_euthanasia_upon_intake,0)                       as birds_owner_requested_euthanasia_upon_intake
    ,coalesce(birds_owner_requested_euthanasia_upon_intake,0)
        + coalesce(birds_owner_relinquished,0)                                      as total_birds_owner_relinquished
    ,coalesce(birds_transfer_in_from_another_colorado_organization,0)               as birds_transfer_in_from_another_colorado_organization
    ,coalesce(birds_transfer_in_from_out_of_state_organization,0)                   as birds_transfer_in_from_out_of_state_organization
    ,coalesce(birds_other_tnr_protective_custody_returns_disaster_relief,0)         as birds_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(birds_adoption,0)                                                     as birds_adoption
    ,coalesce(birds_returned_to_owner_rtox,0)                                       as birds_returned_to_owner_rtox
    ,coalesce(birds_transferred_out_to_another_colorado_organization,0)             as birds_transferred_out_to_another_colorado_organization
    ,coalesce(birds_transferred_to_an_out_of_state_organization,0)                  as birds_transferred_to_an_out_of_state_organization
    ,coalesce(birds_other_live_outcomes_ie_tnr_snrx,0)                              as birds_other_live_outcomes_ie_tnr_snrx
    ,coalesce(birds_died,0)                                                         as birds_died
    ,coalesce(birds_missing_stolen,0)                                               as birds_missing_stolen
    ,coalesce(birds_shelter_euthanasia,0)                                           as birds_shelter_euthanasia
    ,coalesce(birds_owner_requested_euthanasia,0)                                   as birds_owner_requested_euthanasia
    ,coalesce(birds_in_shelter_count_as_of_12_31_2018,0)                            as birds_in_shelter_count_as_of_12_31_2018
    ,coalesce(birds_in_foster_care_count_12_31_2018,0)                              as birds_in_foster_care_count_12_31_2018
    ,coalesce(small_mammal_in_shelter_count_as_of_1_1_2018,0)                       as small_mammal_in_shelter_count_as_of_1_1_2018
    ,coalesce(small_mammal_in_foster_care_count_1_1_2018,0)                         as small_mammal_in_foster_care_count_1_1_2018
    ,coalesce(sm_mammal_stray,0)                                                    as sm_mammal_stray
    ,coalesce(sm_mammal_owner_relinquished,0)                                       as sm_mammal_owner_relinquished
    ,coalesce(sm_mammal_owner_requested_euthanasia_upon_intake,0)                   as sm_mammal_owner_requested_euthanasia_upon_intake
    ,coalesce(sm_mammal_owner_requested_euthanasia_upon_intake,0)
        + coalesce(sm_mammal_owner_relinquished,0)                                  as total_sm_mammal_owner_relinquished
    ,coalesce(sm_mammal_transfer_in_from_another_colorado_organization,0)           as sm_mammal_transfer_in_from_another_colorado_organization
    ,coalesce(sm_mammal_transfer_in_from_out_of_state_organization,0)               as sm_mammal_transfer_in_from_out_of_state_organization
    ,coalesce(sm_mammal_other_tnr_protective_custody_returns_disaster_relief,0)     as sm_mammal_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(sm_mammal_adoption,0)                                                 as sm_mammal_adoption
    ,coalesce(sm_mammal_returned_to_owner_rtox,0)                                   as sm_mammal_returned_to_owner_rtox
    ,coalesce(sm_mammal_transferred_out_to_another_colorado_organization,0)         as sm_mammal_transferred_out_to_another_colorado_organization
    ,coalesce(sm_mammal_transferred_to_an_out_of_state_organization,0)              as sm_mammal_transferred_to_an_out_of_state_organization
    ,coalesce(sm_mammal_other_live_outcomes_ie_tnr_snrx,0)                          as sm_mammal_other_live_outcomes_ie_tnr_snrx
    ,coalesce(sm_mammal_died,0)                                                     as sm_mammal_died
    ,coalesce(sm_mammal_missing_stolen,0)                                           as sm_mammal_missing_stolen
    ,coalesce(sm_mammal_shelter_euthanasia,0)                                       as sm_mammal_shelter_euthanasia
    ,coalesce(sm_mammal_owner_requested_euthanasia,0)                               as sm_mammal_owner_requested_euthanasia
    ,coalesce(sm_mammal_in_shelter_count_as_of_12_31_2018,0)                        as sm_mammal_in_shelter_count_as_of_12_31_2018
    ,coalesce(sm_mammal_in_foster_care_count_as_of_12_31_2018,0)                    as sm_mammal_in_foster_care_count_as_of_12_31_2018
    ,coalesce(reptiles_amphibians_in_shelter_count_as_of_1_1_2018,0)                as reptiles_amphibians_in_shelter_count_as_of_1_1_2018
    ,coalesce(reptiles_amphibians_in_foster_care_count_1_1_2018,0)                  as reptiles_amphibians_in_foster_care_count_1_1_2018
    ,coalesce(reptiles_amphibians_stray,0)                                          as reptiles_amphibians_stray
    ,coalesce(reptiles_amphibians_owner_relinquished,0)                             as reptiles_amphibians_owner_relinquished
    ,coalesce(reptiles_amphibians_owner_requested_euthanasia_upon_intake,0)         as reptiles_amphibians_owner_requested_euthanasia_upon_intake
    ,coalesce(reptiles_amphibians_owner_requested_euthanasia_upon_intake,0)
        + coalesce(reptiles_amphibians_owner_relinquished,0)                        as total_reptiles_amphibians_owner_relinquished
    ,coalesce(reptiles_amphibians_transfer_in_from_another_colorado_organization,0) as reptiles_amphibians_transfer_in_from_another_colorado_organization
    ,coalesce(reptiles_amphibians_transfer_in_from_out_of_state_organization,0)     as reptiles_amphibians_transfer_in_from_out_of_state_organization
    ,coalesce(reptiles_amphibians_other_tnr_protective_custody_returns_disaster_relief,0) as reptiles_amphibians_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(reptiles_amphibians_adoption,0)                                       as reptiles_amphibians_adoption
    ,coalesce(reptiles_amphibians_returned_to_owner_rtox,0)                         as reptiles_amphibians_returned_to_owner_rtox
    ,coalesce(reptiles_amphibians_transferred_out_to_another_colorado_organization,0) as reptiles_amphibians_transferred_out_to_another_colorado_organization
    ,coalesce(reptiles_amphibians_transferred_to_an_out_of_state_organization,0)    as reptiles_amphibians_transferred_to_an_out_of_state_organization
    ,coalesce(reptiles_amphibians_other_live_outcomes_ie_tnr_snrx,0)                as reptiles_amphibians_other_live_outcomes_ie_tnr_snrx
    ,coalesce(reptiles_amphibians_died,0)                                           as reptiles_amphibians_died
    ,coalesce(reptiles_amphibians_missing_stolen,0)                                 as reptiles_amphibians_missing_stolen
    ,coalesce(reptiles_amphibians_shelter_euthanasia,0)                             as reptiles_amphibians_shelter_euthanasia
    ,coalesce(reptiles_amphibians_owner_requested_euthanasia,0)                     as reptiles_amphibians_owner_requested_euthanasia
    ,coalesce(reptiles_amphibians_in_shelter_count_as_of_12_31_2018,0)              as reptiles_amphibians_in_shelter_count_as_of_12_31_2018
    ,coalesce(reptiles_amphibians_in_foster_care_count_as_of_12_31_2018,0)          as reptiles_amphibians_in_foster_care_count_as_of_12_31_2018
    ,coalesce(rabbits_in_shelter_count_as_of_1_1_2018,0)                            as rabbits_in_shelter_count_as_of_1_1_2018
    ,coalesce(rabbits_in_foster_care_count_1_1_2018,0)                              as rabbits_in_foster_care_count_1_1_2018
    ,coalesce(rabbits_stray,0)                                                      as rabbits_stray
    ,coalesce(rabbits_owner_relinquished,0)                                         as rabbits_owner_relinquished
    ,coalesce(rabbits_owner_requested_euthanasia_upon_intake,0)                     as rabbits_owner_requested_euthanasia_upon_intake
    ,coalesce(rabbits_owner_requested_euthanasia_upon_intake,0)
        + coalesce(rabbits_owner_relinquished,0)                                    as total_rabbits_owner_relinquished
    ,coalesce(rabbits_transfer_in_from_another_colorado_organization,0)             as rabbits_transfer_in_from_another_colorado_organization
    ,coalesce(rabbits_transfer_in_from_out_of_state_organization,0)                 as rabbits_transfer_in_from_out_of_state_organization
    ,coalesce(rabbits_other_tnr_protective_custody_returns_disaster_relief,0)       as rabbits_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(rabbits_adoption,0)                                                   as rabbits_adoption
    ,coalesce(rabbits_returned_to_owner_rtox,0)                                     as rabbits_returned_to_owner_rtox
    ,coalesce(rabbits_transferred_out_to_another_colorado_organization,0)           as rabbits_transferred_out_to_another_colorado_organization
    ,coalesce(rabbits_transferred_to_an_out_of_state_organization,0)                as rabbits_transferred_to_an_out_of_state_organization
    ,coalesce(rabbits_other_live_outcomes_ie_tnr_snrx,0)                            as rabbits_other_live_outcomes_ie_tnr_snrx
    ,coalesce(rabbits_died,0)                                                       as rabbits_died
    ,coalesce(rabbits_missing_stolen,0)                                             as rabbits_missing_stolen
    ,coalesce(rabbits_shelter_euthanasia,0)                                         as rabbits_shelter_euthanasia
    ,coalesce(rabbits_owner_requested_euthanasia,0)                                 as rabbits_owner_requested_euthanasia
    ,coalesce(rabbits_in_shelter_count_as_of_12_31_2018,0)                          as rabbits_in_shelter_count_as_of_12_31_2018
    ,coalesce(rabbits_in_foster_care_count_as_of_12_31_2018,0)                      as rabbits_in_foster_care_count_as_of_12_31_2018
    ,coalesce(other_in_shelter_count_as_of_1_1_2018,0)                              as other_in_shelter_count_as_of_1_1_2018
    ,coalesce(other_in_foster_care_count_1_1_2018,0)                                as other_in_foster_care_count_1_1_2018
    ,coalesce(other_stray,0)                                                        as other_stray
    ,coalesce(other_owner_relinquished,0)                                           as other_owner_relinquished
    ,coalesce(other_owner_requested_euthanasia_upon_intake,0)                       as other_owner_requested_euthanasia_upon_intake
    ,coalesce(other_owner_requested_euthanasia_upon_intake,0)
        + coalesce(other_owner_relinquished,0)                                      as total_other_owner_relinquished
    ,coalesce(other_transfer_in_from_another_colorado_organization,0)               as other_transfer_in_from_another_colorado_organization
    ,coalesce(other_transfer_in_from_out_of_state_organization,0)                   as other_transfer_in_from_out_of_state_organization
    ,coalesce(other_tnr_protective_custody_returns_disaster_relief,0)               as other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(other_adoption,0)                                                     as other_adoption
    ,coalesce(other_returned_to_owner_rtox,0)                                       as other_returned_to_owner_rtox
    ,coalesce(other_transferred_out_to_another_colorado_organization,0)             as other_transferred_out_to_another_colorado_organization
    ,coalesce(other_transferred_to_an_out_of_state_organization,0)                  as other_transferred_to_an_out_of_state_organization
    ,coalesce(other_other_live_outcomes_ie_tnr_snrx,0)                              as other_other_live_outcomes_ie_tnr_snrx
    ,coalesce(other_died,0)                                                         as other_died
    ,coalesce(other_missing_stolen,0)                                               as other_missing_stolen
    ,coalesce(other_shelter_euthanasia,0)                                           as other_shelter_euthanasia
    ,coalesce(other_owner_requested_euthanasia,0)                                   as other_owner_requested_euthanasia
    ,coalesce(other_in_shelter_count_as_of_12_31_2018,0)                            as other_in_shelter_count_as_of_12_31_2018
    ,coalesce(other_in_foster_care_count_as_of_12_31_2018,0)                        as other_in_foster_care_count_as_of_12_31_2018
    ,_dlt_load_id
    ,_dlt_id
from {{ source('google_sheets', 'gsheet_2018_stats') }}