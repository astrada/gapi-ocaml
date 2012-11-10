open OUnit
open GapiSiteVerificationV1Model

let test_parse_webresource_list () =
  let webresources_json =
    Yojson.Safe.from_file "test_data/test_siteVerification_webresource_list.json" in
  let tree = GapiJson.json_to_data_model webresources_json in
  let webresources =
    SiteVerificationWebResourceListResponse.of_data_model tree in
  let tree' =
    SiteVerificationWebResourceListResponse.to_data_model webresources in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      webresources_json
      json

let test_parse_webresource () =
  let webresource_json =
    Yojson.Safe.from_file "test_data/test_siteVerification_webresource.json" in
  let tree = GapiJson.json_to_data_model webresource_json in
  let webresource =
    SiteVerificationWebResourceResource.of_data_model tree in
  let tree' =
    SiteVerificationWebResourceResource.to_data_model webresource in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      webresource_json
      json

let test_parse_token () =
  let token_json =
    Yojson.Safe.from_file "test_data/test_siteVerification_token.json" in
  let tree = GapiJson.json_to_data_model token_json in
  let token =
    SiteVerificationWebResourceGettokenResponse.of_data_model tree in
  let tree' =
    SiteVerificationWebResourceGettokenResponse.to_data_model token in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      token_json
      json

let suite = "Site Verification (v1) Model test" >:::
  ["test_parse_webresource_list" >:: test_parse_webresource_list;
   "test_parse_webresource" >:: test_parse_webresource;
   "test_parse_token" >:: test_parse_token]

