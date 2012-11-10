open OUnit
open GapiPlusV1Model
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_comment () =
  let comment_json =
    Yojson.Safe.from_file "test_data/test_plus_comment.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Comment.of_data_model tree in
  let tree' = Comment.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      comment_json
      json

let test_parse_comment_feed () =
  let comment_feed_json =
    Yojson.Safe.from_file "test_data/test_plus_comment_feed.json" in
  let tree = GapiJson.json_to_data_model comment_feed_json in
  let comment_feed = CommentFeed.of_data_model tree in
  let tree' = CommentFeed.to_data_model comment_feed in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      comment_feed_json
      json

let test_parse_activity () =
  let activity_json =
    Yojson.Safe.from_file "test_data/test_plus_activity.json" in
  let tree = GapiJson.json_to_data_model activity_json in
  let activity = Activity.of_data_model tree in
  let tree' = Activity.to_data_model activity in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      activity_json
      json

let test_parse_activity_feed () =
  let activity_feed_json =
    Yojson.Safe.from_file "test_data/test_plus_activity_feed.json" in
  let tree = GapiJson.json_to_data_model activity_feed_json in
  let activity_feed = ActivityFeed.of_data_model tree in
  let tree' = ActivityFeed.to_data_model activity_feed in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      activity_feed_json
      json

let test_parse_person () =
  let person_json =
    Yojson.Safe.from_file "test_data/test_plus_person.json" in
  let tree = GapiJson.json_to_data_model person_json in
  let person = Person.of_data_model tree in
  let tree' = Person.to_data_model person in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      person_json
      json

let test_parse_people_feed () =
  let people_feed_json =
    Yojson.Safe.from_file "test_data/test_plus_people_feed.json" in
  let tree = GapiJson.json_to_data_model people_feed_json in
  let people_feed = PeopleFeed.of_data_model tree in
  let tree' = PeopleFeed.to_data_model people_feed in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      people_feed_json
      json

let suite = "Google+ Data Model test" >:::
  ["test_parse_comment" >:: test_parse_comment;
   "test_parse_comment_feed" >:: test_parse_comment_feed;
   "test_parse_activity" >:: test_parse_activity;
   "test_parse_activity_feed" >:: test_parse_activity_feed;
   "test_parse_person" >:: test_parse_person;
   "test_parse_people_feed" >:: test_parse_people_feed]

