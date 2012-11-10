open OUnit
open GapiOauth2V2Model

let test_parse_userinfo () =
  let userinfo_json =
    Yojson.Safe.from_file "test_data/test_userinfo.json" in
  let tree = GapiJson.json_to_data_model userinfo_json in
  let userinfo = Userinfo.of_data_model tree in
  let tree' = Userinfo.to_data_model userinfo in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      userinfo_json
      json

let test_parse_tokeninfo () =
  let tokeninfo_json =
    Yojson.Safe.from_file "test_data/test_tokeninfo.json" in
  let tree = GapiJson.json_to_data_model tokeninfo_json in
  let tokeninfo = Tokeninfo.of_data_model tree in
  let tree' = Tokeninfo.to_data_model tokeninfo in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      tokeninfo_json
      json

let suite = "OAuth2 API Model test" >:::
  ["test_parse_userinfo" >:: test_parse_userinfo;
   "test_parse_tokeninfo" >:: test_parse_tokeninfo]

