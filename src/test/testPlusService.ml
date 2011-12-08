open OUnit
open GapiUtils.Infix
open GapiLens.Infix

(* Activities *)

let test_list_activities () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, session) =
         GapiPlusService.ActivitiesResource.list
           session
       in
         assert_equal
           "plus#activityFeed"
           activities.GapiPlus.ActivityFeed.kind;
         assert_bool
           "There should be at least 0 Activities"
           (List.length activities.GapiPlus.ActivityFeed.items >= 0))

let test_get_activity () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, session) =
         GapiPlusService.ActivitiesResource.list
           session in
         if (List.length activities.GapiPlus.ActivityFeed.items > 0) then
           begin
             let activity_id = activities
               |. GapiPlus.ActivityFeed.items
               |. GapiLens.head
               |. GapiPlus.Activity.id in
             let (activity, _) =
               GapiPlusService.ActivitiesResource.get
                 activity_id
                 session in
               assert_equal
                 "plus#activity"
                 activity.GapiPlus.Activity.kind;
               assert_equal
                 activity_id
                 activity.GapiPlus.Activity.id
           end)

let test_search_activities () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, session) =
         GapiPlusService.ActivitiesResource.search
           { GapiPlusService.PlusParameters.default with
                 GapiPlusService.PlusParameters.query = "first test post" }
           session
       in
         assert_equal
           "plus#activityFeed"
           activities.GapiPlus.ActivityFeed.kind;
         assert_bool
           "There should be at least 0 Activities"
           (List.length activities.GapiPlus.ActivityFeed.items >= 0))

let suite = "Google+ services test" >:::
  ["test_list_activities" >:: test_list_activities;
   "test_get_activity" >:: test_get_activity;
   "test_search_activities" >:: test_search_activities;
  ]

