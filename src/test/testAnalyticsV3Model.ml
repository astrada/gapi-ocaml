open OUnit
open GapiAnalyticsV3Model
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_management_segments () =
  let segments_json =
    Json_io.load_json "test_data/test_management_segments.json" in
  let tree = GapiJson.json_to_data_model segments_json in
  let segments = Segments.of_data_model tree in
  let tree' = Segments.to_data_model segments in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      segments_json
      json

let test_parse_management_accounts () =
  let accounts_json =
    Json_io.load_json "test_data/test_management_accounts.json" in
  let tree = GapiJson.json_to_data_model accounts_json in
  let accounts = Accounts.of_data_model tree in
  let tree' = Accounts.to_data_model accounts in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      accounts_json
      json

let test_parse_management_webproperties () =
  let webproperties_json =
    Json_io.load_json "test_data/test_management_webproperties.json" in
  let tree = GapiJson.json_to_data_model webproperties_json in
  let webproperties = Webproperties.of_data_model tree in
  let tree' = Webproperties.to_data_model webproperties in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      webproperties_json
      json

let test_parse_management_profiles () =
  let profiles_json =
    Json_io.load_json "test_data/test_management_profiles.json" in
  let tree = GapiJson.json_to_data_model profiles_json in
  let profiles = Profiles.of_data_model tree in
  let tree' = Profiles.to_data_model profiles in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      profiles_json
      json

let test_parse_management_goals () =
  let goals_json =
    Json_io.load_json "test_data/test_management_goals.json" in
  let tree = GapiJson.json_to_data_model goals_json in
  let goals = Goals.of_data_model tree in
  let tree' = Goals.to_data_model goals in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      goals_json
      json

let test_parse_analytics_data () =
  let data_json =
    Json_io.load_json "test_data/test_analytics_data.json" in
  let tree = GapiJson.json_to_data_model data_json in
  let data = GaData.of_data_model tree in
  let tree' = GaData.to_data_model data in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      data_json
      json

let suite = "Analytics Model test" >:::
  ["test_parse_management_segments" >:: test_parse_management_segments;
   "test_parse_management_accounts" >:: test_parse_management_accounts;
   "test_parse_management_webproperties"
     >:: test_parse_management_webproperties;
   "test_parse_management_profiles" >:: test_parse_management_profiles;
   "test_parse_management_goals" >:: test_parse_management_goals;
   "test_parse_analytics_data" >:: test_parse_analytics_data]

