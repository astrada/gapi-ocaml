open OUnit
open GapiError

let test_parse_request_error () =
  let error_json = Yojson.Safe.from_file "test_data/test_request_error.json" in
  let tree = GapiJson.json_to_data_model error_json in
  let request_error = RequestError.of_data_model tree in
  let tree' = RequestError.to_data_model request_error in
  let json = GapiJson.data_model_to_json tree' in
  assert_equal ~printer:TestHelper.string_of_json_data_model tree tree';
  assert_equal ~printer:Yojson.Safe.to_string error_json json

let suite =
  "Service Error test"
  >::: [ "test_parse_request_error" >:: test_parse_request_error ]
