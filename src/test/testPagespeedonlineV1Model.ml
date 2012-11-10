open OUnit
open GapiPagespeedonlineV1Model
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_pagespeedonline_result () =
  let result_json =
    Yojson.Safe.from_file "test_data/test_pagespeedonline_result.json" in
  let tree = GapiJson.json_to_data_model result_json in
  let result = Result.of_data_model tree in
  let tree' = Result.to_data_model result in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      result_json
      json

let suite = "Page Speed Online Data Model test" >:::
  ["test_parse_pagespeedonline_result" >:: test_parse_pagespeedonline_result]

