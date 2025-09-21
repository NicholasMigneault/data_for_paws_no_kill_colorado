select
    facility_name

    /* Facility Data */
    , pacfa_license_number
    , facility_physical_street_address as facility_address
    , zip_code
    , county

    /* statistics */
    ,coalesce(adult_dogs_beginning_count::INTEGER,0)                                                         as adult_dogs_beginning_count
    ,coalesce(adult_dogs_beginning_foster_count::INTEGER,0)                                                  as adult_dogs_beginning_foster_count
    ,coalesce(adult_dogs_stray::INTEGER,0)                                                                   as adult_dogs_stray
    ,coalesce(adult_dogs_owner_relinquished::INTEGER,0)                                                      as adult_dogs_owner_relinquished
    ,coalesce(adult_dogs_owner_requested_euthanasia_upon_intake::INTEGER,0)                                  as adult_dogs_owner_requested_euthanasia_upon_intake
    ,coalesce(adult_dogs_owner_relinquished::INTEGER,0) + coalesce(adult_dogs_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_adult_dogs_owner_relinquished
    ,coalesce(adult_dogs_transfer_in_from_another_colorado_organization::INTEGER,0)                          as adult_dogs_transfer_in_from_another_colorado_organization
    ,coalesce(adult_dogs_transfer_in_from_out_of_state_organization::INTEGER,0)                              as adult_dogs_transfer_in_from_out_of_state_organization
    ,coalesce(adult_dogs_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                    as adult_dogs_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(adult_dogs_adoption::INTEGER,0)                                                                as adult_dogs_adoption
    ,coalesce(adult_dogs_returned_to_owner_rto::INTEGER,0)                                                   as adult_dogs_returned_to_owner_rto
    ,coalesce(adult_dogs_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                 as adult_dogs_transfer_or_rescue_out_to_another_colorado_organization
    ,coalesce(adult_dogs_transfer_or_rescue_out_to_an_out_of_state_organization::INTEGER,0)                  as adult_dogs_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(adult_dogs_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                          as adult_dogs_other_live_outcomes_ie_tnr_snr
    ,coalesce(adult_dogs_died::INTEGER,0)                                                                    as adult_dogs_died
    ,coalesce(adult_dogs_missing_stolen::INTEGER,0)                                                          as adult_dogs_missing_stolen
    ,coalesce(adult_dogs_shelter_euthanasia::INTEGER,0)                                                      as adult_dogs_shelter_euthanasia
    ,coalesce(adult_dogs_owner_requested_euthanasia::INTEGER,0)                                              as adult_dogs_owner_requested_euthanasia
    ,coalesce(adult_dogs_shelter_euthanasia::INTEGER,0) + coalesce(adult_dogs_owner_requested_euthanasia::INTEGER,0)  as total_adult_dogs_euthanasia
    ,coalesce(adult_dogs_ending_count::INTEGER,0)                                                            as adult_dogs_ending_count
    ,coalesce(adult_dogs_foster_count::INTEGER,0)                                                            as adult_dogs_foster_count
    ,coalesce(adult_dogs_avg_los::float,0)                                                                 as adult_dogs_avg_los
    ,coalesce(juvenile_dogs_beginning_count::INTEGER,0)                                                      as juvenile_dogs_beginning_count
    ,coalesce(juvenile_dogs_beginning_foster_count::INTEGER,0)                                               as juvenile_dogs_beginning_foster_count
    ,coalesce(juvenile_dogs_stray::INTEGER,0)                                                                as juvenile_dogs_stray
    ,coalesce(juvenile_dogs_owner_relinquished::INTEGER,0)                                                   as juvenile_dogs_owner_relinquished
    ,coalesce(juvenile_dogs_owner_requested_euthanasia_upon_intake::INTEGER,0)                               as juvenile_dogs_owner_requested_euthanasia_upon_intake
    ,coalesce(juvenile_dogs_owner_relinquished::INTEGER,0) + coalesce(juvenile_dogs_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_juvenile_dogs_owner_relinquished
    ,coalesce(juvenile_dogs_transfer_in_from_another_colorado_organization::INTEGER,0)                       as juvenile_dogs_transfer_in_from_another_colorado_organization
    ,coalesce(juvenile_dogs_transfer_in_from_out_of_state_organization::INTEGER,0)                           as juvenile_dogs_transfer_in_from_out_of_state_organization
    ,coalesce(juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                 as juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(juvenile_dogs_adoption::INTEGER,0)                                                             as juvenile_dogs_adoption
    ,coalesce(juvenile_dogs_returned_to_owner_rto::INTEGER,0)                                                as juvenile_dogs_returned_to_owner_rto
    ,coalesce(juvenile_dogs_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)              as juvenile_dogs_transfer_or_rescue_out_to_another_colorado_organization
    ,coalesce(juvenile_dogs_transfer_or_rescue_out_to_an_out_of_state_organization::INTEGER,0)               as juvenile_dogs_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(juvenile_dogs_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                       as juvenile_dogs_other_live_outcomes_ie_tnr_snr
    ,coalesce(juvenile_dogs_died::INTEGER,0)                                                                 as juvenile_dogs_died
    ,coalesce(juvenile_dogs_missing_stolen::INTEGER,0)                                                       as juvenile_dogs_missing_stolen
    ,coalesce(juvenile_dogs_shelter_euthanasia::INTEGER,0)                                                   as juvenile_dogs_shelter_euthanasia
    ,coalesce(juvenile_dogs_owner_requested_euthanasia::INTEGER,0)                                           as juvenile_dogs_owner_requested_euthanasia
    ,coalesce(juvenile_dogs_shelter_euthanasia::INTEGER,0) + coalesce(juvenile_dogs_owner_requested_euthanasia::INTEGER,0)  as total_juvenile_dogs_euthanasia
    ,coalesce(juvenile_dogs_ending_count::INTEGER,0)                                                         as juvenile_dogs_ending_count
    ,coalesce(juvenile_dogs_foster_count::INTEGER,0)                                                         as juvenile_dogs_foster_count
    ,coalesce(juvenile_dogs_avg_los::float,0)                                                              as juvenile_dogs_avg_los
    ,coalesce(adult_cats_beginning_count::INTEGER,0)                                                         as adult_cats_beginning_count
    ,coalesce(adult_cats_beginning_foster_count::INTEGER,0)                                                  as adult_cats_beginning_foster_count
    ,coalesce(adult_cats_stray::INTEGER,0)                                                                   as adult_cats_stray
    ,coalesce(adult_cats_owner_relinquished::INTEGER,0)                                                      as adult_cats_owner_relinquished
    ,coalesce(adult_cats_owner_requested_euthanasia_upon_intake::INTEGER,0)                                  as adult_cats_owner_requested_euthanasia_upon_intake
    ,coalesce(adult_cats_owner_relinquished::INTEGER,0) + coalesce(adult_cats_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_adult_cats_owner_relinquished
    ,coalesce(adult_cats_transfer_in_from_another_colorado_organization::INTEGER,0)                          as adult_cats_transfer_in_from_another_colorado_organization
    ,coalesce(adult_cats_transfer_in_from_out_of_state_organization::INTEGER,0)                              as adult_cats_transfer_in_from_out_of_state_organization
    ,coalesce(adult_cats_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                    as adult_cats_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(adult_cats_adoption::INTEGER,0)                                                                as adult_cats_adoption
    ,coalesce(adult_cats_returned_to_owner_rto::INTEGER,0)                                                   as adult_cats_returned_to_owner_rto
    ,coalesce(adult_cats_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                 as adult_cats_transfer_or_rescue_out_to_another_colorado_organization
    ,coalesce(adult_cats_transfer_or_rescue_out_to_an_out_of_state_organization::INTEGER,0)                  as adult_cats_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(adult_cats_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                          as adult_cats_other_live_outcomes_ie_tnr_snr
    ,coalesce(adult_cats_died::INTEGER,0)                                                                    as adult_cats_died
    ,coalesce(adult_cats_missing_stolen::INTEGER,0)                                                          as adult_cats_missing_stolen
    ,coalesce(adult_cats_shelter_euthanasia::INTEGER,0)                                                      as adult_cats_shelter_euthanasia
    ,coalesce(adult_cats_owner_requested_euthanasia::INTEGER,0)                                              as adult_cats_owner_requested_euthanasia
    ,coalesce(adult_cats_shelter_euthanasia::INTEGER,0) + coalesce(adult_cats_owner_requested_euthanasia::INTEGER,0)  as total_adult_cats_euthanasia
    ,coalesce(adult_cats_ending_count::INTEGER,0)                                                            as adult_cats_ending_count
    ,coalesce(adult_cats_foster_count::INTEGER,0)                                                            as adult_cats_foster_count
    ,coalesce(adult_cats_avg_los::float,0)                                                                 as adult_cats_avg_los
    ,coalesce(juvenile_cats_beginning_count::INTEGER,0)                                                      as juvenile_cats_beginning_count
    ,coalesce(juvenile_cats_beginning_foster_count::INTEGER,0)                                               as juvenile_cats_beginning_foster_count
    ,coalesce(juvenile_cats_stray::INTEGER,0)                                                                as juvenile_cats_stray
    ,coalesce(juvenile_cats_owner_relinquished::INTEGER,0)                                                   as juvenile_cats_owner_relinquished
    ,coalesce(juvenile_cats_owner_requested_euthanasia_upon_intake::INTEGER,0)                               as juvenile_cats_owner_requested_euthanasia_upon_intake
    ,coalesce(juvenile_cats_owner_relinquished::INTEGER,0) + coalesce(juvenile_cats_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_juvenile_cats_owner_relinquished
    ,coalesce(juvenile_cats_transfer_in_from_another_colorado_organization::INTEGER,0)                       as juvenile_cats_transfer_in_from_another_colorado_organization
    ,coalesce(juvenile_cats_transfer_in_from_out_of_state_organization::INTEGER,0)                           as juvenile_cats_transfer_in_from_out_of_state_organization
    ,coalesce(juvenile_cats_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                 as juvenile_cats_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(juvenile_cats_adoption::INTEGER,0)                                                             as juvenile_cats_adoption
    ,coalesce(juvenile_cats_returned_to_owner_rto::INTEGER,0)                                                as juvenile_cats_returned_to_owner_rto
    ,coalesce(juvenile_cats_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)              as juvenile_cats_transfer_or_rescue_out_to_another_colorado_organization
    ,coalesce(juvenile_cats_transfer_or_rescue_out_to_an_out_of_state_organization::INTEGER,0)               as juvenile_cats_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(juvenile_cats_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                       as juvenile_cats_other_live_outcomes_ie_tnr_snr
    ,coalesce(juvenile_cats_died::INTEGER,0)                                                                 as juvenile_cats_died
    ,coalesce(juvenile_cats_missing_stolen::INTEGER,0)                                                       as juvenile_cats_missing_stolen
    ,coalesce(juvenile_cats_shelter_euthanasia::INTEGER,0)                                                   as juvenile_cats_shelter_euthanasia
    ,coalesce(juvenile_cats_owner_requested_euthanasia::INTEGER,0)                                           as juvenile_cats_owner_requested_euthanasia
    ,coalesce(juvenile_cats_shelter_euthanasia::INTEGER,0) + coalesce(juvenile_cats_owner_requested_euthanasia::INTEGER,0)  as total_juvenile_cats_euthanasia
    ,coalesce(juvenile_cats_ending_count::INTEGER,0)                                                         as juvenile_cats_ending_count
    ,coalesce(juvenile_cats_foster_count::INTEGER,0)                                                         as juvenile_cats_foster_count
    ,coalesce(juvenile_cats_avg_los::float,0)                                                              as juvenile_cats_avg_los
    ,coalesce(birds_beginning_count::INTEGER,0)                                                              as birds_beginning_count
    ,coalesce(birds_beginning_foster_count::INTEGER,0)                                                       as birds_beginning_foster_count
    ,coalesce(birds_stray::INTEGER,0)                                                                        as birds_stray
    ,coalesce(birds_owner_relinquished::INTEGER,0)                                                           as birds_owner_relinquished
    ,coalesce(birds_owner_requested_euthanasia_upon_intake::INTEGER,0)                                       as birds_owner_requested_euthanasia_upon_intake
    ,coalesce(birds_owner_relinquished::INTEGER,0) + coalesce(birds_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_birds_owner_relinquished
    ,coalesce(birds_transfer_in_from_another_colorado_organization::INTEGER,0)                               as birds_transfer_in_from_another_colorado_organization
    ,coalesce(birds_transfer_in_from_out_of_state_organization::INTEGER,0)                                   as birds_transfer_in_from_out_of_state_organization
    ,coalesce(birds_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                         as birds_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(birds_adoption::INTEGER,0)                                                                     as birds_adoption
    ,coalesce(birds_returned_to_owner_rto::INTEGER,0)                                                        as birds_returned_to_owner_rto
    ,coalesce(birds_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                      as birds_transfer_or_rescue_out_to_another_colorado_organization
    ,0                                                                                                       as birds_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(birds_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                               as birds_other_live_outcomes_ie_tnr_snr
    ,coalesce(birds_died::INTEGER,0)                                                                         as birds_died
    ,coalesce(birds_missing_stolen::INTEGER,0)                                                               as birds_missing_stolen
    ,coalesce(birds_shelter_euthanasia::INTEGER,0)                                                           as birds_shelter_euthanasia
    ,coalesce(birds_owner_requested_euthanasia::INTEGER,0)                                                   as birds_owner_requested_euthanasia
    ,coalesce(birds_shelter_euthanasia::INTEGER,0) + coalesce(birds_owner_requested_euthanasia::INTEGER,0)   as total_birds_euthanasia
    ,coalesce(birds_ending_count::INTEGER,0)                                                                 as birds_ending_count
    ,coalesce(birds_foster_count::INTEGER,0)                                                                 as birds_foster_count
    ,coalesce(birds_avg_los::float,0)                                                                      as birds_avg_los
    ,coalesce(small_mammal_beginning_count::INTEGER,0)                                                       as small_mammal_beginning_count
    ,coalesce(small_mammal_beginning_foster_count::INTEGER,0)                                                as small_mammal_beginning_foster_count
    ,coalesce(sm_mammal_stray::INTEGER,0)                                                                    as sm_mammal_stray
    ,coalesce(sm_mammal_owner_relinquished::INTEGER,0)                                                       as sm_mammal_owner_relinquished
    ,coalesce(sm_mammal_owner_requested_euthanasia_upon_intake::INTEGER,0)                                   as sm_mammal_owner_requested_euthanasia_upon_intake
    ,coalesce(sm_mammal_owner_relinquished::INTEGER,0) + coalesce(sm_mammal_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_sm_mammal_owner_relinquished
    ,coalesce(sm_mammal_transfer_in_from_another_colorado_organization::INTEGER,0)                           as sm_mammal_transfer_in_from_another_colorado_organization
    ,coalesce(sm_mammal_transfer_in_from_out_of_state_organization::INTEGER,0)                               as sm_mammal_transfer_in_from_out_of_state_organization
    ,coalesce(sm_mammal_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                     as sm_mammal_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(sm_mammal_adoption::INTEGER,0)                                                                 as sm_mammal_adoption
    ,coalesce(sm_mammal_returned_to_owner_rto::INTEGER,0)                                                    as sm_mammal_returned_to_owner_rto
    ,coalesce(sm_mammal_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                  as sm_mammal_transfer_or_rescue_out_to_another_colorado_organization
    ,coalesce(sm_mammal_transfer_or_rescue_out_to_an_out_of_state_organization::INTEGER,0)                   as sm_mammal_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(sm_mammal_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                           as sm_mammal_other_live_outcomes_ie_tnr_snr
    ,coalesce(sm_mammal_died::INTEGER,0)                                                                     as sm_mammal_died
    ,coalesce(sm_mammal_missing_stolen::INTEGER,0)                                                           as sm_mammal_missing_stolen
    ,coalesce(sm_mammal_shelter_euthanasia::INTEGER,0)                                                       as sm_mammal_shelter_euthanasia
    ,coalesce(sm_mammal_owner_requested_euthanasia::INTEGER,0)                                               as sm_mammal_owner_requested_euthanasia
    ,coalesce(sm_mammal_shelter_euthanasia::INTEGER,0) + coalesce(sm_mammal_owner_requested_euthanasia::INTEGER,0)  as total_sm_mammal_euthanasia
    ,coalesce(sm_mammal_ending_count::INTEGER,0)                                                             as sm_mammal_ending_count
    ,coalesce(sm_mammal_foster_count::INTEGER,0)                                                             as sm_mammal_foster_count
    ,coalesce(sm_mammal_avg_los::float,0)                                                                  as sm_mammal_avg_los
    ,coalesce(rabbits_beginning_count::INTEGER,0)                                                            as rabbits_beginning_count
    ,coalesce(rabbits_beginning_foster_count::INTEGER,0)                                                     as rabbits_beginning_foster_count
    ,coalesce(rabbits_stray::INTEGER,0)                                                                      as rabbits_stray
    ,coalesce(rabbits_owner_relinquished::INTEGER,0)                                                         as rabbits_owner_relinquished
    ,coalesce(rabbits_owner_requested_euthanasia_upon_intake::INTEGER,0)                                     as rabbits_owner_requested_euthanasia_upon_intake
    ,coalesce(rabbits_owner_relinquished::INTEGER,0) + coalesce(rabbits_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_rabbits_owner_relinquished
    ,coalesce(rabbits_transfer_in_from_another_colorado_organization::INTEGER,0)                             as rabbits_transfer_in_from_another_colorado_organization
    ,coalesce(rabbits_transfer_in_from_out_of_state_organization::INTEGER,0)                                 as rabbits_transfer_in_from_out_of_state_organization
    ,coalesce(rabbits_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                       as rabbits_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(rabbits_adoption::INTEGER,0)                                                                   as rabbits_adoption
    ,coalesce(rabbits_returned_to_owner_rto::INTEGER,0)                                                      as rabbits_returned_to_owner_rto
    ,coalesce(rabbits_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                    as rabbits_transfer_or_rescue_out_to_another_colorado_organization
    ,0                                                                                                       as rabbits_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(rabbits_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                             as rabbits_other_live_outcomes_ie_tnr_snr
    ,coalesce(rabbits_died::INTEGER,0)                                                                       as rabbits_died
    ,coalesce(rabbits_missing_stolen::INTEGER,0)                                                             as rabbits_missing_stolen
    ,coalesce(rabbits_shelter_euthanasia::INTEGER,0)                                                         as rabbits_shelter_euthanasia
    ,coalesce(rabbits_owner_requested_euthanasia::INTEGER,0)                                                 as rabbits_owner_requested_euthanasia
    ,coalesce(rabbits_shelter_euthanasia::INTEGER,0) + coalesce(rabbits_owner_requested_euthanasia::INTEGER,0)  as total_rabbits_euthanasia
    ,coalesce(rabbits_foster_count::INTEGER,0)                                                               as rabbits_foster_count
    ,coalesce(rabbits_ending_count::INTEGER,0)                                                               as rabbits_ending_count
    ,coalesce(rabbits_avg_los::float,0)                                                                    as rabbits_avg_los
    ,coalesce(reptiles_beginning_count::INTEGER,0)                                                           as reptiles_beginning_count
    ,coalesce(reptiles_beginning_foster_count::INTEGER,0)                                                    as reptiles_beginning_foster_count
    ,coalesce(reptiles_stray::INTEGER,0)                                                                     as reptiles_stray
    ,coalesce(reptiles_owner_relinquished::INTEGER,0)                                                        as reptiles_owner_relinquished
    ,coalesce(reptiles_owner_requested_euthanasia_upon_intake::INTEGER,0)                                    as reptiles_owner_requested_euthanasia_upon_intake
    ,coalesce(reptiles_owner_relinquished::INTEGER,0) + coalesce(reptiles_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_reptiles_owner_relinquished
    ,coalesce(reptiles_transfer_in_from_another_colorado_organization::INTEGER,0)                            as reptiles_transfer_in_from_another_colorado_organization
    ,0                                                                                                       as reptiles_transfer_in_from_out_of_state_organization
    ,coalesce(reptiles_other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                      as reptiles_other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(reptiles_adoption::INTEGER,0)                                                                  as reptiles_adoption
    ,coalesce(reptiles_returned_to_owner_rto::INTEGER,0)                                                     as reptiles_returned_to_owner_rto
    ,coalesce(reptiles_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                   as reptiles_transfer_or_rescue_out_to_another_colorado_organization
    ,0                                                                                                       as reptiles_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(reptiles_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                            as reptiles_other_live_outcomes_ie_tnr_snr
    ,coalesce(reptiles_died::INTEGER,0)                                                                      as reptiles_died
    ,coalesce(reptiles_missing_stolen::INTEGER,0)                                                            as reptiles_missing_stolen
    ,coalesce(reptiles_shelter_euthanasia::INTEGER,0)                                                        as reptiles_shelter_euthanasia
    ,coalesce(reptiles_owner_requested_euthanasia::INTEGER,0)                                                as reptiles_owner_requested_euthanasia
    ,coalesce(reptiles_shelter_euthanasia::INTEGER,0) + coalesce(reptiles_owner_requested_euthanasia::INTEGER,0)    as total_reptiles_euthanasia
    ,coalesce(reptiles_ending_count::INTEGER,0)                                                              as reptiles_ending_count
    ,coalesce(reptiles_foster_count::INTEGER,0)                                                              as reptiles_foster_count
    ,coalesce(reptiles_avg_los::float,0)                                                                   as reptiles_avg_los
    ,coalesce(other_beginning_count::INTEGER,0)                                                              as other_beginning_count
    ,coalesce(other_beginning_foster_count::INTEGER,0)                                                       as other_beginning_foster_count
    ,coalesce(other_stray::INTEGER,0)                                                                        as other_stray
    ,coalesce(other_owner_relinquished::INTEGER,0)                                                           as other_owner_relinquished
    ,coalesce(other_owner_requested_euthanasia_upon_intake::INTEGER,0)                                       as other_owner_requested_euthanasia_upon_intake
    ,coalesce(other_owner_relinquished::INTEGER,0) + coalesce(other_owner_requested_euthanasia_upon_intake::INTEGER,0) as total_other_owner_relinquished
    ,coalesce(other_transfer_in_from_another_colorado_organization::INTEGER,0)                               as other_transfer_in_from_another_colorado_organization
    ,0                                                                                                       as other_transfer_in_from_out_of_state_organization
    ,coalesce(other_tnr_protective_custody_returns_disaster_relief::INTEGER,0)                               as other_tnr_protective_custody_returns_disaster_relief
    ,coalesce(other_adoption::INTEGER,0)                                                                     as other_adoption
    ,coalesce(other_returned_to_owner_rto::INTEGER,0)                                                        as other_returned_to_owner_rto
    ,coalesce(other_transfer_or_rescue_out_to_another_colorado_organization::INTEGER,0)                      as other_transfer_or_rescue_out_to_another_colorado_organization
    ,0                                                                                                       as other_transfer_or_rescue_out_to_an_out_of_state_organization
    ,coalesce(other_other_live_outcomes_ie_tnr_snr::INTEGER,0)                                               as other_other_live_outcomes_ie_tnr_snr
    ,coalesce(other_died::INTEGER,0)                                                                         as other_died
    ,0                                                                                                       as other_missing_stolen
    ,coalesce(other_shelter_euthanasia::INTEGER,0)                                                           as other_shelter_euthanasia
    ,coalesce(other_owner_requested_euthanasia::INTEGER,0)                                                   as other_owner_requested_euthanasia
    ,coalesce(other_shelter_euthanasia::INTEGER,0) + coalesce(other_owner_requested_euthanasia::INTEGER,0)   as total_other_euthanasia
    ,coalesce(other_ending_count::INTEGER,0)                                                                 as other_ending_count
    ,coalesce(other_foster_count::INTEGER,0)                                                                 as other_foster_count
    ,coalesce(other_avg_los::float,0)                                                                        as other_avg_los

    /* API Metadata */
    , _id
    , _version
    , _created_at
    , _updated_at

    /* dlt Metadata*/ 
    , _dlt_load_id
    , _dlt_id
from {{ source('cim', 'cim_2015_stats') }}
