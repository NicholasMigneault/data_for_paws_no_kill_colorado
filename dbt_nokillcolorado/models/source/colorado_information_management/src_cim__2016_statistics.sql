select
    facility_name

    /* Facility Data */
    , pacfa_license_number
    , location_1__latitude
    , location_1__longitude
    , location_1__human_address::json as address_object
    , address_object->>'city' as facility_city
    , county
    , zip_code
    , _acomputed_region_nku6_53ud as region_polygon

    -- always null is 2016
    --, lower(address_object->>'address') as facility_address 
    --, lower(address_object->>'state') as facility_state
    --, address_object->>'zip' as facility_zip_code

    /* statistics */
    ,coalesce(try_cast(adult_dogs_beginning_count as integer),0)                                                                    as adult_dogs_beginning_count 
    ,coalesce(try_cast(adult_dogs_beginning_foster_count as integer),0)                                                             as adult_dogs_beginning_foster_count 
    ,coalesce(try_cast(adult_dogs_stray as integer),0)                                                                              as adult_dogs_stray 
    ,coalesce(try_cast(adult_dogs_owner_relinquished as integer),0)                                                                 as adult_dogs_owner_relinquished 
    ,coalesce(try_cast(adult_dogs_owner_requested_euthanasia_upon_intake as integer),0)                                             as adult_dogs_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(adult_dogs_owner_relinquished as integer),0) + coalesce(try_cast(adult_dogs_owner_requested_euthanasia_upon_intake as integer),0)  as total_adult_dogs_owner_relinquished
    ,coalesce(try_cast(adult_dogs_transfer_in_from_another_colorado_organization as integer),0)                                     as adult_dogs_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(adult_dogs_transfer_in_from_out_of_state_organization as integer),0)                                         as adult_dogs_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(adult_dogs_other_tnr_protective_custody_returns_disaster_relief as integer),0)                               as adult_dogs_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(adult_dogs_adoption as integer),0)                                                                           as adult_dogs_adoption 
    ,coalesce(try_cast(adult_dogs_returned_to_owner_rto as integer),0)                                                              as adult_dogs_returned_to_owner_rto 
    ,coalesce(try_cast(adult_dogs_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                            as adult_dogs_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(adult_dogs_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                             as adult_dogs_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(adult_dogs_other_live_outcomes_ie_tnr_snr as integer),0)                                                     as adult_dogs_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(adult_dogs_died as integer),0)                                                                               as adult_dogs_died 
    ,coalesce(try_cast(adult_dogs_shelter_euthanasia as integer),0)                                                                 as adult_dogs_shelter_euthanasia 
    ,coalesce(try_cast(adult_dogs_owner_requested_euthanasia as integer),0)                                                         as adult_dogs_owner_requested_euthanasia 
    ,coalesce(try_cast(adult_dogs_shelter_euthanasia as integer),0) + coalesce(try_cast(adult_dogs_owner_requested_euthanasia as integer),0)    as total_adult_dogs_euthanasia
    ,coalesce(try_cast(adult_dogs_missing_stolen as integer),0)                                                                     as adult_dogs_missing_stolen 
    ,coalesce(try_cast(adult_dogs_ending_count as integer),0)                                                                       as adult_dogs_ending_count 
    ,coalesce(try_cast(adult_dogs_foster_count as integer),0)                                                                       as adult_dogs_foster_count 
    ,coalesce(try_cast(juvenile_dogs_beginning_count as integer),0)                                                                 as juvenile_dogs_beginning_count 
    ,coalesce(try_cast(juvenile_dogs_beginning_foster_count as integer),0)                                                          as juvenile_dogs_beginning_foster_count 
    ,coalesce(try_cast(juvenile_dogs_stray as integer),0)                                                                           as juvenile_dogs_stray 
    ,coalesce(try_cast(juvenile_dogs_owner_relinquished as integer),0)                                                              as juvenile_dogs_owner_relinquished 
    ,coalesce(try_cast(juvenile_dogs_owner_requested_euthanasia_upon_intake as integer),0)                                          as juvenile_dogs_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(juvenile_dogs_owner_relinquished as integer),0) + coalesce(try_cast(juvenile_dogs_owner_requested_euthanasia_upon_intake as integer),0)  as total_juvenile_dogs_owner_relinquished
    ,coalesce(try_cast(juvenile_dogs_transfer_in_from_another_colorado_organization as integer),0)                                  as juvenile_dogs_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(juvenile_dogs_transfer_in_from_out_of_state_organization as integer),0)                                      as juvenile_dogs_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief as integer),0)                            as juvenile_dogs_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(juvenile_dogs_adoption as integer),0)                                                                        as juvenile_dogs_adoption 
    ,coalesce(try_cast(juvenile_dogs_returned_to_owner_rto as integer),0)                                                           as juvenile_dogs_returned_to_owner_rto 
    ,coalesce(try_cast(juvenile_dogs_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                         as juvenile_dogs_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(juvenile_dogs_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                          as juvenile_dogs_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(juvenile_dogs_other_live_outcomes_ie_tnr_snr as integer),0)                                                  as juvenile_dogs_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(juvenile_dogs_died as integer),0)                                                                            as juvenile_dogs_died 
    ,coalesce(try_cast(juvenile_dogs_shelter_euthanasia as integer),0)                                                              as juvenile_dogs_shelter_euthanasia 
    ,coalesce(try_cast(juvenile_dogs_owner_requested_euthanasia as integer),0)                                                      as juvenile_dogs_owner_requested_euthanasia 
    ,coalesce(try_cast(juvenile_dogs_shelter_euthanasia as integer),0) + coalesce(try_cast(juvenile_dogs_owner_requested_euthanasia as integer),0)  as total_juvenile_dogs_euthanasia 
    ,coalesce(try_cast(juvenile_dogs_missing_stolen as integer),0)                                                                  as juvenile_dogs_missing_stolen 
    ,coalesce(try_cast(juvenile_dogs_ending_count as integer),0)                                                                    as juvenile_dogs_ending_count 
    ,coalesce(try_cast(juvenile_dogs_foster_count as integer),0)                                                                    as juvenile_dogs_foster_count 
    ,coalesce(try_cast(adult_cats_beginning_count as integer),0)                                                                    as adult_cats_beginning_count 
    ,coalesce(try_cast(adult_cats_beginning_foster_count as integer),0)                                                             as adult_cats_beginning_foster_count 
    ,coalesce(try_cast(adult_cats_stray as integer),0)                                                                              as adult_cats_stray 
    ,coalesce(try_cast(adult_cats_owner_relinquished as integer),0)                                                                 as adult_cats_owner_relinquished 
    ,coalesce(try_cast(adult_cats_owner_requested_euthanasia_upon_intake as integer),0)                                             as adult_cats_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(adult_cats_owner_relinquished as integer),0) + coalesce(try_cast(adult_cats_owner_requested_euthanasia_upon_intake as integer),0)  as total_adult_cats_owner_relinquished
    ,coalesce(try_cast(adult_cats_transfer_in_from_another_colorado_organization as integer),0)                                     as adult_cats_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(adult_cats_transfer_in_from_out_of_state_organization as integer),0)                                         as adult_cats_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(adult_cats_other_tnr_protective_custody_returns_disaster_relief as integer),0)                               as adult_cats_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(adult_cats_adoption as integer),0)                                                                           as adult_cats_adoption 
    ,coalesce(try_cast(adult_cats_returned_to_owner_rto as integer),0)                                                              as adult_cats_returned_to_owner_rto 
    ,coalesce(try_cast(adult_cats_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                            as adult_cats_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(adult_cats_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                             as adult_cats_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(adult_cats_other_live_outcomes_ie_tnr_snr as integer),0)                                                     as adult_cats_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(adult_cats_died as integer),0)                                                                               as adult_cats_died 
    ,coalesce(try_cast(adult_cats_shelter_euthanasia as integer),0)                                                                 as adult_cats_shelter_euthanasia 
    ,coalesce(try_cast(adult_cats_owner_requested_euthanasia as integer),0)                                                         as adult_cats_owner_requested_euthanasia 
    ,coalesce(try_cast(adult_cats_shelter_euthanasia as integer),0) + coalesce(try_cast(adult_cats_owner_requested_euthanasia as integer),0)  as total_adult_cats_euthanasia
    ,coalesce(try_cast(adult_cats_missing_stolen as integer),0)                                                                     as adult_cats_missing_stolen 
    ,coalesce(try_cast(adult_cats_ending_count as integer),0)                                                                       as adult_cats_ending_count 
    ,coalesce(try_cast(adult_cats_foster_count as integer),0)                                                                       as adult_cats_foster_count 
    ,coalesce(try_cast(juvenile_cats_beginning_count as integer),0)                                                                 as juvenile_cats_beginning_count 
    ,coalesce(try_cast(juvenile_cats_beginning_foster_count as integer),0)                                                          as juvenile_cats_beginning_foster_count 
    ,coalesce(try_cast(juvenile_cats_stray as integer),0)                                                                           as juvenile_cats_stray 
    ,coalesce(try_cast(juvenile_cats_owner_relinquished as integer),0)                                                              as juvenile_cats_owner_relinquished 
    ,coalesce(try_cast(juvenile_cats_owner_requested_euthanasia_upon_intake as integer),0)                                          as juvenile_cats_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(juvenile_cats_owner_relinquished as integer),0) + coalesce(try_cast(juvenile_cats_owner_requested_euthanasia_upon_intake as integer), 0)  as total_juvenile_cats_owner_relinquished
    ,coalesce(try_cast(juvenile_cats_transfer_in_from_another_colorado_organization as integer),0)                                  as juvenile_cats_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(juvenile_cats_transfer_in_from_out_of_state_organization as integer),0)                                      as juvenile_cats_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(juvenile_cats_other_tnr_protective_custody_returns_disaster_relief as integer),0)                            as juvenile_cats_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(juvenile_cats_adoption as integer),0)                                                                        as juvenile_cats_adoption 
    ,coalesce(try_cast(juvenile_cats_returned_to_owner_rto as integer),0)                                                           as juvenile_cats_returned_to_owner_rto 
    ,coalesce(try_cast(juvenile_cats_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                         as juvenile_cats_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(juvenile_cats_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                          as juvenile_cats_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(juvenile_cats_other_live_outcomes_ie_tnr_snr as integer),0)                                                  as juvenile_cats_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(juvenile_cats_died as integer),0)                                                                            as juvenile_cats_died 
    ,coalesce(try_cast(juvenile_cats_shelter_euthanasia as integer),0)                                                              as juvenile_cats_shelter_euthanasia 
    ,coalesce(try_cast(juvenile_cats_owner_requested_euthanasia as integer),0)                                                      as juvenile_cats_owner_requested_euthanasia 
    ,coalesce(try_cast(juvenile_cats_shelter_euthanasia as integer),0) + coalesce(try_cast(juvenile_cats_owner_requested_euthanasia as integer),0)  as total_juvenile_cats_euthanasia
    ,coalesce(try_cast(juvenile_cats_missing_stolen as integer),0)                                                                  as juvenile_cats_missing_stolen 
    ,coalesce(try_cast(juvenile_cats_ending_count as integer),0)                                                                    as juvenile_cats_ending_count 
    ,coalesce(try_cast(juvenile_cats_foster_count as integer),0)                                                                    as juvenile_cats_foster_count 
    ,coalesce(try_cast(birds_beginning_count as integer),0)                                                                         as birds_beginning_count 
    ,coalesce(try_cast(birds_beginning_foster_count as integer),0)                                                                  as birds_beginning_foster_count 
    ,coalesce(try_cast(birds_stray as integer),0)                                                                                   as birds_stray 
    ,coalesce(try_cast(birds_owner_relinquished as integer),0)                                                                      as birds_owner_relinquished 
    ,coalesce(try_cast(birds_owner_requested_euthanasia_upon_intake as integer),0)                                                  as birds_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(birds_owner_relinquished as integer),0) + coalesce(try_cast(birds_owner_requested_euthanasia_upon_intake as integer),0)  as total_birds_owner_relinquished
    ,coalesce(try_cast(birds_transfer_in_from_another_colorado_organization as integer),0)                                          as birds_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(birds_transfer_in_from_out_of_state_organization as integer),0)                                              as birds_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(birds_other_tnr_protective_custody_returns_disaster_relief as integer),0)                                    as birds_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(birds_adoption as integer),0)                                                                                as birds_adoption 
    ,coalesce(try_cast(birds_returned_to_owner_rto as integer),0)                                                                   as birds_returned_to_owner_rto 
    ,coalesce(try_cast(birds_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                                 as birds_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(birds_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                                  as birds_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(birds_other_live_outcomes_ie_tnr_snr as integer),0)                                                          as birds_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(birds_died as integer),0)                                                                                    as birds_died 
    ,coalesce(try_cast(birds_shelter_euthanasia as integer),0)                                                                      as birds_shelter_euthanasia 
    ,coalesce(try_cast(birds_owner_requested_euthanasia as integer),0)                                                              as birds_owner_requested_euthanasia 
    ,coalesce(try_cast(birds_shelter_euthanasia as integer),0) + coalesce(try_cast(birds_owner_requested_euthanasia as integer),0)  as total_birds_euthanasia
    ,coalesce(try_cast(birds_missing_stolen as integer),0)                                                                          as birds_missing_stolen 
    ,coalesce(try_cast(birds_ending_count as integer),0)                                                                            as birds_ending_count 
    ,coalesce(try_cast(birds_foster_count as integer),0)                                                                            as birds_foster_count 
    ,coalesce(try_cast(small_mammal_beginning_count as integer),0)                                                                  as small_mammal_beginning_count 
    ,coalesce(try_cast(small_mammal_beginning_foster_count as integer),0)                                                           as small_mammal_beginning_foster_count 
    ,coalesce(try_cast(sm_mammal_stray as integer),0)                                                                               as sm_mammal_stray 
    ,coalesce(try_cast(sm_mammal_owner_relinquished as integer),0)                                                                  as sm_mammal_owner_relinquished 
    ,coalesce(try_cast(sm_mammal_owner_requested_euthanasia_upon_intake as integer),0)                                              as sm_mammal_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(sm_mammal_owner_relinquished as integer),0) + coalesce(try_cast(sm_mammal_owner_requested_euthanasia_upon_intake as integer), 0)  as total_sm_mammal_owner_relinquished
    ,coalesce(try_cast(sm_mammal_transfer_in_from_another_colorado_organization as integer),0)                                      as sm_mammal_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(sm_mammal_transfer_in_from_out_of_state_organization as integer),0)                                          as sm_mammal_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(sm_mammal_other_tnr_protective_custody_returns_disaster_relief as integer),0)                                as sm_mammal_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(sm_mammal_adoption as integer),0)                                                                            as sm_mammal_adoption 
    ,coalesce(try_cast(sm_mammal_returned_to_owner_rto as integer),0)                                                               as sm_mammal_returned_to_owner_rto 
    ,coalesce(try_cast(sm_mammal_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                             as sm_mammal_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(sm_mammal_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                              as sm_mammal_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(sm_mammal_other_live_outcomes_ie_tnr_snr as integer),0)                                                      as sm_mammal_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(sm_mammal_died as integer),0)                                                                                as sm_mammal_died 
    ,coalesce(try_cast(sm_mammal_shelter_euthanasia as integer),0)                                                                  as sm_mammal_shelter_euthanasia 
    ,coalesce(try_cast(sm_mammal_owner_requested_euthanasia as integer),0)                                                          as sm_mammal_owner_requested_euthanasia 
    ,coalesce(try_cast(sm_mammal_shelter_euthanasia as integer),0) + coalesce(try_cast(sm_mammal_owner_requested_euthanasia as integer),0)  as total_sm_mammal_euthanasia
    ,coalesce(try_cast(sm_mammal_missing_stolen as integer),0)                                                                      as sm_mammal_missing_stolen 
    ,coalesce(try_cast(sm_mammal_ending_count as integer),0)                                                                        as sm_mammal_ending_count 
    ,coalesce(try_cast(sm_mammal_foster_count as integer),0)                                                                        as sm_mammal_foster_count 
    ,coalesce(try_cast(rabbits_beginning_count as integer),0)                                                                       as rabbits_beginning_count 
    ,coalesce(try_cast(rabbits_beginning_foster_count as integer),0)                                                                as rabbits_beginning_foster_count 
    ,coalesce(try_cast(rabbits_stray as integer),0)                                                                                 as rabbits_stray 
    ,coalesce(try_cast(rabbits_owner_relinquished as integer),0)                                                                    as rabbits_owner_relinquished 
    ,coalesce(try_cast(rabbits_owner_requested_euthanasia_upon_intake as integer),0)                                                as rabbits_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(rabbits_owner_relinquished as integer),0) + coalesce(try_cast(rabbits_owner_requested_euthanasia_upon_intake as integer), 0)  as total_rabbits_owner_relinquished
    ,coalesce(try_cast(rabbits_transfer_in_from_another_colorado_organization as integer),0)                                        as rabbits_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(rabbits_transfer_in_from_out_of_state_organization as integer),0)                                            as rabbits_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(rabbits_other_tnr_protective_custody_returns_disaster_relief as integer),0)                                  as rabbits_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(rabbits_adoption as integer),0)                                                                              as rabbits_adoption 
    ,coalesce(try_cast(rabbits_returned_to_owner_rto as integer),0)                                                                 as rabbits_returned_to_owner_rto 
    ,coalesce(try_cast(rabbits_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                               as rabbits_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(rabbits_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                                as rabbits_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(rabbits_other_live_outcomes_ie_tnr_snr as integer),0)                                                        as rabbits_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(rabbits_died as integer),0)                                                                                  as rabbits_died 
    ,coalesce(try_cast(rabbits_shelter_euthanasia as integer),0)                                                                    as rabbits_shelter_euthanasia 
    ,coalesce(try_cast(rabbits_owner_requested_euthanasia as integer),0)                                                            as rabbits_owner_requested_euthanasia 
    ,coalesce(try_cast(rabbits_shelter_euthanasia as integer),0) + coalesce(try_cast(rabbits_owner_requested_euthanasia as integer),0)  as total_rabbits_euthanasia
    ,coalesce(try_cast(rabbits_missing_stolen as integer),0)                                                                        as rabbits_missing_stolen 
    ,coalesce(try_cast(rabbits_ending_count as integer),0)                                                                          as rabbits_ending_count 
    ,coalesce(try_cast(rabbits_foster_count as integer),0)                                                                          as rabbits_foster_count 
    ,coalesce(try_cast(reptiles_beginning_count as integer),0)                                                                      as reptiles_beginning_count 
    ,coalesce(try_cast(reptiles_beginning_foster_count as integer),0)                                                               as reptiles_beginning_foster_count 
    ,coalesce(try_cast(reptiles_stray as integer),0)                                                                                as reptiles_stray 
    ,coalesce(try_cast(reptiles_owner_relinquished as integer),0)                                                                   as reptiles_owner_relinquished 
    ,coalesce(try_cast(reptiles_owner_requested_euthanasia_upon_intake as integer),0)                                               as reptiles_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(reptiles_owner_relinquished as integer),0) + coalesce(try_cast(reptiles_owner_requested_euthanasia_upon_intake as integer),0)  as total_reptiles_owner_relinquished
    ,coalesce(try_cast(reptiles_transfer_in_from_another_colorado_organization as integer),0)                                       as reptiles_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(reptiles_transfer_in_from_out_of_state_organization as integer),0)                                           as reptiles_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(reptiles_other_tnr_protective_custody_returns_disaster_relief as integer),0)                                 as reptiles_other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(reptiles_adoption as integer),0)                                                                             as reptiles_adoption 
    ,coalesce(try_cast(reptiles_returned_to_owner_rto as integer),0)                                                                as reptiles_returned_to_owner_rto 
    ,coalesce(try_cast(reptiles_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                              as reptiles_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(reptiles_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                               as reptiles_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(reptiles_other_live_outcomes_ie_tnr_snr as integer),0)                                                       as reptiles_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(reptiles_died as integer),0)                                                                                 as reptiles_died 
    ,coalesce(try_cast(reptiles_shelter_euthanasia as integer),0)                                                                   as reptiles_shelter_euthanasia 
    ,coalesce(try_cast(reptiles_owner_requested_euthanasia as integer),0)                                                           as reptiles_owner_requested_euthanasia 
    ,coalesce(try_cast(reptiles_shelter_euthanasia as integer),0) + coalesce(try_cast(reptiles_owner_requested_euthanasia as integer),0)  as total_reptiles_euthanasia
    ,coalesce(try_cast(reptiles_missing_stolen as integer),0)                                                                       as reptiles_missing_stolen 
    ,coalesce(try_cast(reptiles_ending_count as integer),0)                                                                         as reptiles_ending_count 
    ,coalesce(try_cast(reptiles_foster_count as integer),0)                                                                         as reptiles_foster_count 
    ,coalesce(try_cast(other_beginning_count as integer),0)                                                                         as other_beginning_count 
    ,coalesce(try_cast(other_beginning_foster_count as integer),0)                                                                  as other_beginning_foster_count 
    ,coalesce(try_cast(other_stray as integer),0)                                                                                   as other_stray 
    ,coalesce(try_cast(other_owner_relinquished as integer),0)                                                                      as other_owner_relinquished 
    ,coalesce(try_cast(other_owner_requested_euthanasia_upon_intake as integer),0)                                                  as other_owner_requested_euthanasia_upon_intake 
    ,coalesce(try_cast(other_owner_relinquished as integer),0) + coalesce(try_cast(other_owner_requested_euthanasia_upon_intake as integer), 0) as total_other_owner_relinquished
    ,coalesce(try_cast(other_transfer_in_from_another_colorado_organization as integer),0)                                          as other_transfer_in_from_another_colorado_organization 
    ,coalesce(try_cast(other_transfer_in_from_out_of_state_organization as integer),0)                                              as other_transfer_in_from_out_of_state_organization 
    ,coalesce(try_cast(other_tnr_protective_custody_returns_disaster_relief as integer),0)                                          as other_tnr_protective_custody_returns_disaster_relief 
    ,coalesce(try_cast(other_adoption as integer),0)                                                                                as other_adoption 
    ,coalesce(try_cast(other_returned_to_owner_rto as integer),0)                                                                   as other_returned_to_owner_rto 
    ,coalesce(try_cast(other_transfer_or_rescue_out_to_another_colorado_organization as integer),0)                                 as other_transfer_or_rescue_out_to_another_colorado_organization 
    ,coalesce(try_cast(other_transfer_or_rescue_out_to_an_out_of_state_organization as integer),0)                                  as other_transfer_or_rescue_out_to_an_out_of_state_organization 
    ,coalesce(try_cast(other_other_live_outcomes_ie_tnr_snr as integer),0)                                                          as other_other_live_outcomes_ie_tnr_snr 
    ,coalesce(try_cast(other_died as integer),0)                                                                                    as other_died 
    ,coalesce(try_cast(other_shelter_euthanasia as integer),0)                                                                      as other_shelter_euthanasia 
    ,coalesce(try_cast(other_owner_requested_euthanasia as integer),0)                                                              as other_owner_requested_euthanasia 
    ,coalesce(try_cast(other_shelter_euthanasia as integer),0) + coalesce(try_cast(other_owner_requested_euthanasia as integer),0)  as total_other_euthanasia
    ,coalesce(try_cast(other_missing_stolen as integer),0)                                                                          as other_missing_stolen 
    ,coalesce(try_cast(other_ending_count as integer),0)                                                                            as other_ending_count 
    ,coalesce(try_cast(other_foster_count as integer),0)                                                                            as other_foster_count 

    /* Other columns*/ 
    ,coalesce(try_cast(adult_dogs_avg_los as float), 0)         as adult_dogs_avg_los 
    ,coalesce(try_cast(juvenile_dogs_avg_los as float), 0)      as juvenile_dogs_avg_los 
    ,coalesce(try_cast(adult_cats_avg_los as float), 0)         as adult_cats_avg_los 
    ,coalesce(try_cast(juvenile_cats_avg_los as float), 0)      as juvenile_cats_avg_los 
    ,coalesce(try_cast(birds_avg_los as float), 0)              as birds_avg_los 
    ,coalesce(try_cast(rabbits_avg_los as float), 0)            as rabbits_avg_los 
    ,coalesce(try_cast(sm_mammal_avg_los as float), 0)          as sm_mammal_avg_los 
    ,coalesce(try_cast(reptiles_avg_los as float), 0)           as reptiles_avg_los 
    ,coalesce(try_cast(other_avg_los as float), 0)              as other_avg_los 

    ,footnotes = '**' as has_footnotes
    ,adult_dogs_notes
    ,juvenile_dogs_notes
    ,adult_cats_notes
    ,juvenile_cats_notes
    ,birds_notes
    ,rabbits_notes
    ,sm_mammal_notes
    ,reptiles_notes
    ,other_notes

    /* API Metadata */
    , _id
    , _version
    , _created_at
    , _updated_at

    /* dlt Metadata*/ 
    , _dlt_load_id
    , _dlt_id
from {{ source('cim', 'cim_2016_stats') }}
where adult_dogs is null -- this filters out all placeholder rows
    and facility_name is not null -- this filters out other notes/disclaimers entered as distinct rows







