open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiPlusV1Model
open GapiPlusV1Service

(* Activities *)

let get_first_activity_id session =
  let (activities, session) =
    ActivitiesResource.list
      session
  in
    if (List.length activities.ActivityFeed.items > 0) then
      let activity_id = activities
        |. ActivityFeed.items
        |. GapiLens.head
        |. Activity.id
      in
        (Some activity_id, session)
    else
      (None, session)

let get_first_comment_id activityId session =
  let (comments, session) =
    CommentsResource.list
      ~activityId
      session
  in
    if (List.length comments.CommentFeed.items > 0) then
      let comment_id = comments
        |. CommentFeed.items
        |. GapiLens.head
        |. Comment.id
      in
        (Some comment_id, session)
    else
      (None, session)

let test_list_activities () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, session) =
         ActivitiesResource.list
           session
       in
         assert_equal
           "plus#activityFeed"
           activities.ActivityFeed.kind)

let test_get_activity () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, session) =
         ActivitiesResource.list
           session in
       let (activity_id, _) = get_first_activity_id session in
         match activity_id with
             None ->
               ()
           | Some activityId ->
               let (activity, _) =
                 ActivitiesResource.get
                   ~activityId
                   session
               in
                 assert_equal
                   "plus#activity"
                   activity.Activity.kind;
                 assert_equal
                   activityId
                   activity.Activity.id)
           

let test_search_activities () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activities, _) =
         ActivitiesResource.search
           ~query:"first test post"
           session
       in
         assert_equal
           "plus#activityFeed"
           activities.ActivityFeed.kind)

(* Comments *)

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
                 CommentsResource.list
                   ~activityId:aid
                   session
               in
                 assert_equal
                   "plus#commentFeed"
                   comments.CommentFeed.kind)

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
                   | Some commentId ->
                       let (comment, _) =
                         CommentsResource.get
                           ~commentId
                           session
                       in
                         assert_equal
                           "plus#comment"
                           comment.Comment.kind;
                         assert_equal
                           commentId
                           comment.Comment.id)

(* People *)

let test_list_people_by_activity () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (activity_id, session) = get_first_activity_id session in
         match activity_id with
             None ->
               ()
           | Some activityId ->
               let (plusoners, _) =
                 PeopleResource.listByActivity
                   ~activityId
                   ~collection:"plusoners"
                   session
               in
                 assert_equal
                   "plus#peopleFeed"
                   plusoners.PeopleFeed.kind)

let test_search_people () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (people, _) =
         PeopleResource.search
           ~query:"Larry Page"
           session
       in
         assert_equal
           "plus#peopleFeed"
           people.PeopleFeed.kind;
         assert_bool
           "There should be at least 1 person matching \"Larry Page\""
           (List.length people.PeopleFeed.items >= 1))

let test_get_person () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (people, session) =
         PeopleResource.search
           ~query:"Larry Page"
           session in
       let userId = people
         |. PeopleFeed.items
         |. GapiLens.head
         |. Person.id in
       let (person, _) =
         PeopleResource.get
           ~userId
           session
       in
         assert_equal
           "plus#person"
           person.Person.kind;
         assert_equal
           userId
           person.Person.id)

let suite = "Google+ services test" >:::
  ["test_list_activities" >:: test_list_activities;
   "test_get_activity" >:: test_get_activity;
   "test_search_activities" >:: test_search_activities;
   "test_list_comments" >:: test_list_comments;
   "test_get_comment" >:: test_get_comment;
   "test_list_people_by_activity" >:: test_list_people_by_activity;
   "test_search_people" >:: test_search_people;
   "test_get_person" >:: test_get_person]

