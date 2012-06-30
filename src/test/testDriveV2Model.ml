open OUnit
open GapiUtils.Infix
open GapiDriveV2Model

open GapiLens.Infix

let test_parse_file () =
  let file_json =
    Json_io.load_json "test_data/test_drive_file.json" in
  let tree = GapiJson.json_to_data_model file_json in
  let file = File.of_data_model tree in
  let tree' = File.to_data_model file in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      file_json
      json

let suite = "Drive Data Model test" >:::
  ["test_parse_file" >:: test_parse_file;
   ]


