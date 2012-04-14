open OUnit
open GapiUtils.Infix
open GapiBigqueryV2Model
open GapiBigqueryV2Service

let test_list_datasets () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (datasets, session) =
         DatasetsResource.list
           ~projectId:"publicdata"
           session
       in
         assert_equal
           "bigquery#datasetList"
           datasets.DatasetList.kind;
         assert_bool
           "There should be at least 1 dataset"
           (List.length datasets.DatasetList.datasets > 0))

let suite = "BigQuery service test" >:::
  ["test_list_datasets" >:: test_list_datasets;
   ]


