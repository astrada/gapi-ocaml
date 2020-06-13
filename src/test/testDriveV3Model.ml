open OUnit
open GapiLens.Infix
open GapiDriveV3Model

module Fun = GapiFun

let test_render_file () =
  let file = File.empty
             |> File.appProperties ^= [
                 ("test", "");
               ] in
  let tree = File.to_data_model file in
  let json = GapiJson.data_model_to_json tree in
  let json_string = Yojson.Safe.to_string json in
  assert_equal
    ~printer:Fun.id
    "{\"appProperties\":{\"test\":null}}"
    json_string

let test_render_empty_file () =
  let file = File.empty in
  let tree = File.to_data_model file in
  let json = GapiJson.data_model_to_json tree in
  let json_string = Yojson.Safe.to_string json in
  assert_equal
    ~printer:Fun.id
    "{}"
    json_string

let suite = "Drive Data Model test" >:::
  ["test_render_file" >:: test_render_file;
   "test_render_empty_file" >:: test_render_empty_file;
  ]

