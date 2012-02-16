open OUnit
open GapiCustomsearchV1Model
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_search_results () =
  let comment_json =
    Json_io.load_json "test_data/test_search_results.json" in
  let tree = GapiJson.json_to_data_model comment_json in
  let comment = Search.of_data_model tree in
  let tree' = Search.to_data_model comment in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      comment_json
      json

let suite = "Custom Search Data Model test" >:::
  ["test_parse_search_results" >:: test_parse_search_results]

