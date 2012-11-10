open OUnit
open GapiUtils.Infix
open GapiBigqueryV2Model

open GapiLens.Infix

let test_parse_dataset_list () =
  let dataset_list_json =
    Yojson.Safe.from_file "test_data/test_bigquery_dataset_list.json" in
  let tree = GapiJson.json_to_data_model dataset_list_json in
  let dataset_list = DatasetList.of_data_model tree in
  let tree' = DatasetList.to_data_model dataset_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      dataset_list_json
      json

let test_parse_dataset () =
  let dataset_json =
    Yojson.Safe.from_file "test_data/test_bigquery_dataset.json" in
  let tree = GapiJson.json_to_data_model dataset_json in
  let dataset = Dataset.of_data_model tree in
  let tree' = Dataset.to_data_model dataset in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      dataset_json
      json

let test_parse_job () =
  let job_json =
    Yojson.Safe.from_file "test_data/test_bigquery_job.json" in
  let tree = GapiJson.json_to_data_model job_json in
  let job = Job.of_data_model tree in
  let tree' = Job.to_data_model job in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      job_json
      json

let test_parse_getqueryresults () =
  let queryresult_json =
    Yojson.Safe.from_file "test_data/test_bigquery_getqueryresults.json" in
  let tree = GapiJson.json_to_data_model queryresult_json in
  let queryresult = GetQueryResultsResponse.of_data_model tree in
  let tree' = GetQueryResultsResponse.to_data_model queryresult in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      queryresult_json
      json

let test_parse_job_list () =
  let job_list_json =
    Yojson.Safe.from_file "test_data/test_bigquery_job_list.json" in
  let tree = GapiJson.json_to_data_model job_list_json in
  let job_list = JobList.of_data_model tree in
  let tree' = JobList.to_data_model job_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      job_list_json
      json

let test_parse_queryrequest () =
  let queryrequest_json =
    Yojson.Safe.from_file "test_data/test_bigquery_queryrequest.json" in
  let tree = GapiJson.json_to_data_model queryrequest_json in
  let queryrequest = QueryRequest.of_data_model tree in
  let tree' = QueryRequest.to_data_model queryrequest in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      queryrequest_json
      json

let test_parse_queryresult () =
  let queryresult_json =
    Yojson.Safe.from_file "test_data/test_bigquery_queryresult.json" in
  let tree = GapiJson.json_to_data_model queryresult_json in
  let queryresult = QueryResponse.of_data_model tree in
  let tree' = QueryResponse.to_data_model queryresult in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      queryresult_json
      json

let test_parse_project_list () =
  let project_list_json =
    Yojson.Safe.from_file "test_data/test_bigquery_project_list.json" in
  let tree = GapiJson.json_to_data_model project_list_json in
  let project_list = ProjectList.of_data_model tree in
  let tree' = ProjectList.to_data_model project_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      project_list_json
      json

let test_parse_tabledata_list () =
  let tabledata_list_json =
    Yojson.Safe.from_file "test_data/test_bigquery_tabledata_list.json" in
  let tree = GapiJson.json_to_data_model tabledata_list_json in
  let tabledata_list = TableDataList.of_data_model tree in
  let tree' = TableDataList.to_data_model tabledata_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      tabledata_list_json
      json

let test_parse_table () =
  let table_json =
    Yojson.Safe.from_file "test_data/test_bigquery_table.json" in
  let tree = GapiJson.json_to_data_model table_json in
  let table = Table.of_data_model tree in
  let tree' = Table.to_data_model table in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      table_json
      json

let test_parse_table_list () =
  let table_list_json =
    Yojson.Safe.from_file "test_data/test_bigquery_table_list.json" in
  let tree = GapiJson.json_to_data_model table_list_json in
  let table_list = TableList.of_data_model tree in
  let tree' = TableList.to_data_model table_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      table_list_json
      json

let suite = "BigQuery Data Model test" >:::
  ["test_parse_dataset_list" >:: test_parse_dataset_list;
   "test_parse_dataset" >:: test_parse_dataset;
   "test_parse_job" >:: test_parse_job;
   "test_parse_getqueryresults" >:: test_parse_getqueryresults;
   "test_parse_job_list" >:: test_parse_job_list;
   "test_parse_queryrequest" >:: test_parse_queryrequest;
   "test_parse_queryresult" >:: test_parse_queryresult;
   "test_parse_project_list" >:: test_parse_project_list;
   "test_parse_tabledata_list" >:: test_parse_tabledata_list;
   "test_parse_table" >:: test_parse_table;
   "test_parse_table_list" >:: test_parse_table_list]

