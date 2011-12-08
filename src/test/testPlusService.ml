open OUnit
open GapiUtils.Infix
open GapiLens.Infix

(* Activities *)

let get_first_activity_id session =
  let (activities, session) =
    GapiPlusService.ActivitiesResource.list
      session
  in
    if (List.length activities.GapiPlus.ActivityFeed.items > 0) then
      let activity_id = activities
        |. GapiPlus.ActivityFeed.items
        |. GapiLens.head
        |. GapiPlus.Activity.id
      in
        (Some activity_id, session)
    else
      (None, session)

let get_first_comment_id activity_id session =
  let (comments, session) =
    GapiPlusService.CommentsResource.list
      activity_id
      session
  in
    if (List.length comments.GapiPlus.CommentFeed.items > 0) then
      let comment_id = comments
        |. GapiPlus.CommentFeed.items
        |. GapiLens.head
        |. GapiPlus.Comment.id
      in
        (Some comment_id, session)
    else
      (None, session)

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
           activities.GapiPlus.ActivityFeed.kind)

let test_get_activity () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, session) =
         GapiPlusService.ActivitiesResource.list
           session in
       let (activity_id, _) = get_first_activity_id session in
         match activity_id with
             None ->
               ()
           | Some aid ->
               let (activity, _) =
                 GapiPlusService.ActivitiesResource.get
                   aid
                   session
               in
                 assert_equal
                   "plus#activity"
                   activity.GapiPlus.Activity.kind;
                 assert_equal
                   aid
                   activity.GapiPlus.Activity.id)
           

let test_search_activities () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, _) =
         GapiPlusService.ActivitiesResource.search
           { GapiPlusService.PlusParameters.default with
                 GapiPlusService.PlusParameters.query = "first test post" }
           session
       in
         assert_equal
           "plus#activityFeed"
           activities.GapiPlus.ActivityFeed.kind)

let test_list_comments () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activity_id, session) = get_first_activity_id session in
         match activity_id with
             None ->
               ()
           | Some aid ->
               let (comments, _) =
                 GapiPlusService.CommentsResource.list
                   aid
                   session
               in
                 assert_equal
                   "plus#commentFeed"
                   comments.GapiPlus.CommentFeed.kind)

let test_get_comment () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activity_id, session) = get_first_activity_id session in
         match activity_id with
             None ->
               ()
           | Some aid ->
               let (comment_id, session) = get_first_comment_id aid session in
                 match comment_id with
                     None ->
                       ()
                   | Some cid ->
                       let (comment, _) =
                         GapiPlusService.CommentsResource.get
                           cid
                           session
                       in
                         assert_equal
                           "plus#comment"
                           comment.GapiPlus.Comment.kind;
                         assert_equal
                           cid
                           comment.GapiPlus.Comment.id)

let suite = "Google+ services test" >:::
  ["test_list_activities" >:: test_list_activities;
   "test_get_activity" >:: test_get_activity;
   "test_search_activities" >:: test_search_activities;
   "test_list_comments" >:: test_list_comments;
   "test_get_comment" >:: test_get_comment;
  ]

