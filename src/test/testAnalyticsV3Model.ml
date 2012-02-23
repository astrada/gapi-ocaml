open OUnit
open GapiAnalyticsV3Model
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_management_segments () =
  let comment_json =
    Json_io.load_json "test_data/test_management_segments.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Segments.of_data_model tree in
  let tree' = Segments.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let test_parse_management_accounts () =
  let comment_json =
    Json_io.load_json "test_data/test_management_accounts.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Accounts.of_data_model tree in
  let tree' = Accounts.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let test_parse_management_webproperties () =
  let comment_json =
    Json_io.load_json "test_data/test_management_webproperties.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Webproperties.of_data_model tree in
  let tree' = Webproperties.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let test_parse_management_profiles () =
  let comment_json =
    Json_io.load_json "test_data/test_management_profiles.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Profiles.of_data_model tree in
  let tree' = Profiles.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let test_parse_management_goals () =
  let comment_json =
    Json_io.load_json "test_data/test_management_goals.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Goals.of_data_model tree in
  let tree' = Goals.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let test_parse_analytics_data () =
  let comment_json =
    Json_io.load_json "test_data/test_analytics_data.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = GaData.of_data_model tree in
  let tree' = GaData.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let suite = "Analytics Model test" >:::
  ["test_parse_management_segments" >:: test_parse_management_segments;
   "test_parse_management_accounts" >:: test_parse_management_accounts;
   "test_parse_management_webproperties"
     >:: test_parse_management_webproperties;
   "test_parse_management_profiles" >:: test_parse_management_profiles;
   "test_parse_management_goals" >:: test_parse_management_goals;
   "test_parse_analytics_data" >:: test_parse_analytics_data]

