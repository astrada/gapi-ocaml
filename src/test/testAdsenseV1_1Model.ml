open OUnit
open GapiAdsenseV1_1Model
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_accounts () =
  let accounts_json =
    Yojson.Safe.from_file "test_data/test_adsense_accounts.json" in
  let tree = GapiJson.json_to_data_model accounts_json in
  let accounts = Accounts.of_data_model tree in
  let tree' = Accounts.to_data_model accounts in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      accounts_json
      json

let test_parse_adclients () =
  let adclients_json =
    Yojson.Safe.from_file "test_data/test_adsense_adclients.json" in
  let tree = GapiJson.json_to_data_model adclients_json in
  let adclients = AdClients.of_data_model tree in
  let tree' = AdClients.to_data_model adclients in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      adclients_json
      json

let test_parse_report () =
  let report_json =
    Yojson.Safe.from_file "test_data/test_adsense_report.json" in
  let tree = GapiJson.json_to_data_model report_json in
  let report = AdsenseReportsGenerateResponse.of_data_model tree in
  let tree' = AdsenseReportsGenerateResponse.to_data_model report in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      report_json
      json

let test_parse_adunits () =
  let adunits_json =
    Yojson.Safe.from_file "test_data/test_adsense_adunits.json" in
  let tree = GapiJson.json_to_data_model adunits_json in
  let adunits = AdUnits.of_data_model tree in
  let tree' = AdUnits.to_data_model adunits in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      adunits_json
      json

let test_parse_customchannels () =
  let customchannels_json =
    Yojson.Safe.from_file "test_data/test_adsense_customchannels.json" in
  let tree = GapiJson.json_to_data_model customchannels_json in
  let customchannels = CustomChannels.of_data_model tree in
  let tree' = CustomChannels.to_data_model customchannels in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      customchannels_json
      json

let test_parse_urlchannels () =
  let urlchannels_json =
    Yojson.Safe.from_file "test_data/test_adsense_urlchannels.json" in
  let tree = GapiJson.json_to_data_model urlchannels_json in
  let urlchannels = UrlChannels.of_data_model tree in
  let tree' = UrlChannels.to_data_model urlchannels in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      urlchannels_json
      json

let suite = "AdSense Data Model test" >:::
  ["test_parse_accounts" >:: test_parse_accounts;
   "test_parse_adclients" >:: test_parse_adclients;
   "test_parse_report" >:: test_parse_report;
   "test_parse_adunits" >:: test_parse_adunits;
   "test_parse_customchannels" >:: test_parse_customchannels;
   "test_parse_urlchannels" >:: test_parse_urlchannels]

