open OUnit
open GapiUtils.Infix
open GapiBigqueryV2Model

open GapiLens.Infix

let test_parse_job () =
  let job_json =
    Json_io.load_json "test_data/test_bigquery_job.json" in
  let tree = GapiJson.json_to_data_model job_json in
  let job = Job.of_data_model tree in
  let tree' = Job.to_data_model job in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      job_json
      json

let suite = "BigQuery Data Model test" >:::
  ["test_parse_job" >:: test_parse_job;
   ]



