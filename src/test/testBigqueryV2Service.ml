open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiBigqueryV2Model
open GapiBigqueryV2Service

let get_project_id session =
  let (projects, session) =
    ProjectsResource.list
      session in
  let project_id =
    if (List.length projects.ProjectList.projects) > 0 then
      Some (projects.ProjectList.projects
              |> List.hd
              |. ProjectList.Projects.id)
    else
      None
  in
    (project_id, session)

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

let test_get_dataset () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (dataset, session) =
         DatasetsResource.get
           ~projectId:"publicdata"
           ~datasetId:"samples"
           session
       in
         assert_equal
           "bigquery#dataset"
           dataset.Dataset.kind;
         assert_equal
           "Helix Public Sample Tables"
           dataset.Dataset.friendlyName;
         assert_equal
           "publicdata"
           dataset.Dataset.datasetReference.DatasetReference.projectId;
         assert_equal
           "samples"
           dataset.Dataset.datasetReference.DatasetReference.datasetId)

let test_list_projects () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (projects, session) =
         ProjectsResource.list
           session
       in
         assert_equal
           "bigquery#projectList"
           projects.ProjectList.kind)

let new_test_dataset =
  { Dataset.empty with
        Dataset.datasetReference = {
          DatasetReference.empty with
              DatasetReference.datasetId = "new_test_dataset";
        };
        description = "test dataset created by gapi-ocaml";
  }

let test_insert_dataset () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let (_, session) =
                DatasetsResource.insert
                  ~projectId
                  new_test_dataset
                  session in
              let () = TestHelper.delay () in
              let (dataset, session) =
                DatasetsResource.get
                  ~projectId
                  ~datasetId:"new_test_dataset"
                  session
              in
                ignore (
                  DatasetsResource.delete
                    ~projectId
                    ~datasetId:"new_test_dataset"
                    session);
                assert_equal
                  projectId
                  dataset.Dataset.datasetReference.DatasetReference.projectId;
                assert_equal
                  "new_test_dataset"
                  dataset.Dataset.datasetReference.DatasetReference.datasetId)
           project_id)

let test_update_dataset () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let (dataset, session) =
                DatasetsResource.insert
                  ~projectId
                  new_test_dataset
                  session in
              let () = TestHelper.delay () in
              let access =
                { Dataset.Access.empty with
                      Dataset.Access.role = "READER";
                      Dataset.Access.domain = "example.com";
                } :: dataset.Dataset.access in
              let dataset_to_update = dataset
                |> Dataset.access ^= access in
              (* Warninig: at this moment (2012-04-16) there is a bug on the
               * server side, that allow only update to the access property,
               * every other field cannot be updated. *)
              let (updated_dataset, session) =
                DatasetsResource.update
                  ~projectId
                  ~datasetId:"new_test_dataset"
                  dataset_to_update
                  session
              in
                ignore (
                  DatasetsResource.delete
                    ~projectId
                    ~datasetId:"new_test_dataset"
                    session);
                TestHelper.assert_exists
                  "Dataset update failed"
                  (fun a -> a.Dataset.Access.domain = "example.com")
                  updated_dataset.Dataset.access)
           project_id)

let test_list_jobs () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let (jobs, session) =
                JobsResource.list
                  ~projectId
                  session
              in
                assert_equal
                  "bigquery#jobList"
                  jobs.JobList.kind;
                TestHelper.assert_not_empty
                  "Job list ETag should not be empty"
                  jobs.JobList.etag)
           project_id)

let job_data =
  { Job.empty with
        Job.configuration =
          { JobConfiguration.empty with
                JobConfiguration.query =
                  { JobConfigurationQuery.empty with
                        JobConfigurationQuery.query = "SELECT word,word_count,corpus,corpus_date FROM publicdata:samples.shakespeare LIMIT 5";
                  };
          };
  }

let wait_for_job project_id job_id session =
  let rec loop s =
    let (job, s') =
      JobsResource.get
        ~projectId:project_id
        ~jobId:job_id
        s in
      match job.Job.status.JobStatus.state with
          "DONE" -> s'
        | _ ->
            let () = TestHelper.delay () in
              loop s'
  in
    loop session

let test_async_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let (job, session) =
                JobsResource.insert
                  ~projectId
                  job_data
                  session in
              let jobId = Job.(job.jobReference.JobReference.jobId) in
              let session = wait_for_job projectId jobId session in
              let (queryresult, session) =
                JobsResource.getQueryResults
                  ~projectId
                  ~jobId
                  session
              in
                assert_equal
                  "bigquery#job"
                  job.Job.kind;
                assert_equal
                  "bigquery#getQueryResultsResponse"
                  queryresult.GetQueryResultsResponse.kind;
                assert_equal
                  "5"
                  queryresult.GetQueryResultsResponse.totalRows)
           project_id)

let test_sync_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let query_request =
                { QueryRequest.empty with
                      QueryRequest.query = "SELECT word,word_count,corpus,corpus_date FROM publicdata:samples.shakespeare LIMIT 5";
                      timeoutMs = 0;
                } in
              let (query_response, session) =
                JobsResource.query
                  ~projectId
                  query_request
                  session
              in
                assert_equal
                  "bigquery#queryResponse"
                  query_response.QueryResponse.kind;
                assert_bool
                  "Sync query job should be completed"
                  query_response.QueryResponse.jobComplete;
                assert_equal
                  "5"
                  query_response.QueryResponse.totalRows)
           project_id)

let test_list_tabledata () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (tabledata, session) =
         TabledataResource.list
           ~maxResults:5
           ~projectId:"publicdata"
           ~datasetId:"samples"
           ~tableId:"shakespeare"
           session in
         assert_equal
           "bigquery#tableDataList"
           tabledata.TableDataList.kind;
         assert_equal
           164656L
           tabledata.TableDataList.totalRows;
         assert_equal
           5
           (List.length tabledata.TableDataList.rows))

let test_list_tables () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (tables, session) =
         TablesResource.list
           ~projectId:"publicdata"
           ~datasetId:"samples"
           session in
         assert_equal
           "bigquery#tableList"
           tables.TableList.kind;
         assert_equal
           5
           tables.TableList.totalItems)

let test_get_table () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (table, session) =
         TablesResource.get
           ~projectId:"publicdata"
           ~datasetId:"samples"
           ~tableId:"shakespeare"
           session in
         assert_equal
           "bigquery#table"
           table.Table.kind;
         assert_equal
           "164656"
           table.Table.numRows)

let new_test_table =
  { Table.empty with
        Table.tableReference =
          { TableReference.empty with
                TableReference.tableId = "new_test_table";
          };
        description = "test table created by gapi-ocaml";
        schema =
          {
            TableSchema.fields = [
              { TableFieldSchema.empty with
                    TableFieldSchema.name = "f1";
                    TableFieldSchema._type = "STRING";
              };
              { TableFieldSchema.empty with
                    TableFieldSchema.name = "f2";
                    TableFieldSchema._type = "INTEGER";
              };
            ];
          };
  }

let test_insert_table () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let (_, session) =
                DatasetsResource.insert
                  ~projectId
                  new_test_dataset
                  session in
              let () = TestHelper.delay () in
              let (_, session) =
                TablesResource.insert
                  ~projectId
                  ~datasetId:"new_test_dataset"
                  new_test_table
                  session in
              let () = TestHelper.delay () in
              let (table, session) =
                TablesResource.get
                  ~projectId
                  ~datasetId:"new_test_dataset"
                  ~tableId:"new_test_table"
                  session
              in
                ignore (
                  TablesResource.delete
                    ~projectId
                    ~datasetId:"new_test_dataset"
                    ~tableId:"new_test_table"
                    session);
                ignore (
                  DatasetsResource.delete
                    ~projectId
                    ~datasetId:"new_test_dataset"
                    session);
                assert_equal
                  projectId
                  table.Table.tableReference.TableReference.projectId;
                assert_equal
                  "new_test_dataset"
                  table.Table.tableReference.TableReference.datasetId;
                assert_equal
                  "new_test_table"
                  table.Table.tableReference.TableReference.tableId;
                assert_equal
                  2
                  (List.length table.Table.schema.TableSchema.fields))
           project_id)

(* Warninig: at this moment (2012-04-16) there is a bug on the server side, that
 * does not allow updates a table resource that contains creationTime or
 * lastModifiedTime properties, or a table resource that contains a schema
 * property (since the table schema is currently immutable).

let test_update_table () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (project_id, session) = get_project_id session in
         Option.may
           (fun projectId ->
              let (_, session) =
                DatasetsResource.insert
                  ~projectId
                  new_test_dataset
                  session in
              let () = TestHelper.delay () in
              let (table, session) =
                TablesResource.insert
                  ~projectId
                  ~datasetId:"new_test_dataset"
                  new_test_table
                  session in
              let () = TestHelper.delay () in
              let table_to_update = table
                |> Table.description ^= "updated description" in
              let (updated_table, session) =
                TablesResource.update
                  ~projectId
                  ~datasetId:"new_test_dataset"
                  ~tableId:"new_test_table"
                  table_to_update
                  session
              in
                ignore (
                  TablesResource.delete
                    ~projectId
                    ~datasetId:"new_test_dataset"
                    ~tableId:"new_test_table"
                    session);
                ignore (
                  DatasetsResource.delete
                    ~projectId
                    ~datasetId:"new_test_dataset"
                    session);
                assert_equal
                  "test table created by gapi-ocaml"
                  table_to_update.Table.description;
                assert_equal
                  "updated description"
                  updated_table.Table.description)
           project_id)
*)

let suite = "BigQuery service test" >:::
  ["test_list_datasets" >:: test_list_datasets;
   "test_get_dataset" >:: test_get_dataset;
   "test_list_projects" >:: test_list_projects;
   "test_insert_dataset" >:: test_insert_dataset;
   "test_update_dataset" >:: test_update_dataset;
   "test_list_jobs" >:: test_list_jobs;
   "test_async_query" >:: test_async_query;
   "test_sync_query" >:: test_sync_query;
   "test_list_tabledata" >:: test_list_tabledata;
   "test_list_tables" >:: test_list_tables;
   "test_get_table" >:: test_get_table;
   "test_insert_table" >:: test_insert_table;
   (* Doesn't work
   "test_update_table" >:: test_update_table*)]

