open OUnit
open GapiUrlshortenerV1Model

let test_parse_url () =
  let url_json =
    Yojson.Safe.from_file "test_data/test_urlshortener_url.json" in
  let tree = GapiJson.json_to_data_model url_json in
  let url = Url.of_data_model tree in
  let tree' = Url.to_data_model url in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      url_json
      json

let test_parse_url_history () =
  let url_history_json =
    Yojson.Safe.from_file "test_data/test_urlshortener_url_history.json" in
  let tree = GapiJson.json_to_data_model url_history_json in
  let url_history = UrlHistory.of_data_model tree in
  let tree' = UrlHistory.to_data_model url_history in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      url_history_json
      json

let suite = "Urlshortener (v1) Model test" >:::
  ["test_parse_url" >:: test_parse_url;
   "test_parse_url_history" >:: test_parse_url_history]

