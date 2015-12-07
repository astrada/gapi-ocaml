(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for BigQuery API (v2).
  
  A data platform for customers to create, manage, share and query data..
  
  For more information about this service, see the
  {{:https://cloud.google.com/bigquery/}API Documentation}.
  *)

module Scope :
sig
  val bigquery : string
  (** View and manage your data in Google BigQuery *)
  
  val bigquery_insertdata : string
  (** Insert data into Google BigQuery *)
  
  val cloud_platform : string
  (** View and manage your data across Google Cloud Platform services *)
  
  val cloud_platform_read_only : string
  (** View your data across Google Cloud Platform services *)
  
  val devstorage_full_control : string
  (** Manage your data and permissions in Google Cloud Storage *)
  
  val devstorage_read_only : string
  (** View your data in Google Cloud Storage *)
  
  val devstorage_read_write : string
  (** Manage your data in Google Cloud Storage *)
  
  
end
(** Service Auth Scopes *)

module DatasetsResource :
sig
  
  (** Deletes the dataset specified by the datasetId value. Before you can delete a dataset, you must delete all its tables, either manually or by specifying deleteContents. Immediately after deletion, you can create another dataset with the same name.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param deleteContents If True, delete all the tables in the dataset. If False and the dataset contains tables, the request will fail. Default is False
    @param projectId Project ID of the dataset being deleted
    @param datasetId Dataset ID of dataset being deleted
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?deleteContents:bool ->
    projectId:string ->
    datasetId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns the dataset specified by datasetID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param projectId Project ID of the requested dataset
    @param datasetId Dataset ID of the requested dataset
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Dataset.t * GapiConversation.Session.t
  
  (** Creates a new empty dataset.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the new dataset
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    GapiBigqueryV2Model.Dataset.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Dataset.t * GapiConversation.Session.t
  
  (** Lists all datasets in the specified project to which you have been granted the READER dataset role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param all Whether to list all datasets, including hidden ones
    @param maxResults The maximum number of results to return
    @param pageToken Page token, returned by a previous call, to request the next page of results
    @param projectId Project ID of the datasets to be listed
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?all:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    projectId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.DatasetList.t * GapiConversation.Session.t
  
  (** Updates information in an existing dataset. The update method replaces the entire dataset resource, whereas the patch method only replaces fields that are provided in the submitted dataset resource. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the dataset being updated
    @param datasetId Dataset ID of the dataset being updated
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    GapiBigqueryV2Model.Dataset.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Dataset.t * GapiConversation.Session.t
  
  (** Updates information in an existing dataset. The update method replaces the entire dataset resource, whereas the patch method only replaces fields that are provided in the submitted dataset resource.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the dataset being updated
    @param datasetId Dataset ID of the dataset being updated
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    GapiBigqueryV2Model.Dataset.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Dataset.t * GapiConversation.Session.t
  
  
end

module JobsResource :
sig
  
  module StateFilter :
  sig
    type t =
      | Default
      | Done (** Finished jobs *)
      | Pending (** Pending jobs *)
      | Running (** Running jobs *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Projection :
  sig
    type t =
      | Default
      | Full (** Includes all job data *)
      | Minimal (** Does not include the job configuration *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Requests that a job be cancelled. This call will return immediately, and the client will need to poll for the job status to see if the cancel completed successfully. Cancelled jobs may still incur costs.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the job to cancel
    @param jobId Job ID of the job to cancel
    *)
  val cancel :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    jobId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.JobCancelResponse.t * GapiConversation.Session.t
  
  (** Returns information about a specific job. Job information is available for a six month period after creation. Requires that you're the person who ran the job, or have the Is Owner project role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param projectId Project ID of the requested job
    @param jobId Job ID of the requested job
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    jobId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Job.t * GapiConversation.Session.t
  
  (** Retrieves the results of a query job.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of results to read
    @param pageToken Page token, returned by a previous call, to request the next page of results
    @param startIndex Zero-based index of the starting row
    @param timeoutMs How long to wait for the query to complete, in milliseconds, before returning. Default is 10 seconds. If the timeout passes before the job completes, the 'jobComplete' field in the response will be false
    @param projectId Project ID of the query job
    @param jobId Job ID of the query job
    *)
  val getQueryResults :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?startIndex:string ->
    ?timeoutMs:int ->
    projectId:string ->
    jobId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.GetQueryResultsResponse.t * GapiConversation.Session.t
  
  (** Starts a new asynchronous job. Requires the Can View project role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the project that will be billed for the job
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    projectId:string ->
    GapiBigqueryV2Model.Job.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Job.t * GapiConversation.Session.t
  
  (** Lists all jobs that you started in the specified project. Job information is available for a six month period after creation. The job list is sorted in reverse chronological order, by job creation time. Requires the Can View project role, or the Is Owner project role if you set the allUsers property.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param allUsers Whether to display jobs owned by all users in the project. Default false
    @param maxResults Maximum number of results to return
    @param pageToken Page token, returned by a previous call, to request the next page of results
    @param projection Restrict information returned to a set of selected fields
    @param stateFilter Filter for job state
    @param projectId Project ID of the jobs to list
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?allUsers:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?projection:Projection.t ->
    ?stateFilter:StateFilter.t list ->
    projectId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.JobList.t * GapiConversation.Session.t
  
  (** Runs a BigQuery SQL query synchronously and returns query results if the query completes within a specified timeout.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the project billed for the query
    *)
  val query :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    GapiBigqueryV2Model.QueryRequest.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.QueryResponse.t * GapiConversation.Session.t
  
  
end

module ProjectsResource :
sig
  
  (** Lists all projects to which you have been granted any project role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of results to return
    @param pageToken Page token, returned by a previous call, to request the next page of results
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.ProjectList.t * GapiConversation.Session.t
  
  
end

module TabledataResource :
sig
  
  (** Streams data into BigQuery one record at a time without needing to run a load job. Requires the WRITER dataset role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the destination table.
    @param datasetId Dataset ID of the destination table.
    @param tableId Table ID of the destination table.
    *)
  val insertAll :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    tableId:string ->
    GapiBigqueryV2Model.TableDataInsertAllRequest.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.TableDataInsertAllResponse.t * GapiConversation.Session.t
  
  (** Retrieves table data from a specified set of rows. Requires the READER dataset role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of results to return
    @param pageToken Page token, returned by a previous call, identifying the result set
    @param startIndex Zero-based index of the starting row to read
    @param projectId Project ID of the table to read
    @param datasetId Dataset ID of the table to read
    @param tableId Table ID of the table to read
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?startIndex:string ->
    projectId:string ->
    datasetId:string ->
    tableId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.TableDataList.t * GapiConversation.Session.t
  
  
end

module TablesResource :
sig
  
  (** Deletes the table specified by tableId from the dataset. If the table contains data, all the data will be deleted.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the table to delete
    @param datasetId Dataset ID of the table to delete
    @param tableId Table ID of the table to delete
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    tableId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets the specified table resource by table ID. This method does not return the data in the table, it only returns the table resource, which describes the structure of this table.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param projectId Project ID of the requested table
    @param datasetId Dataset ID of the requested table
    @param tableId Table ID of the requested table
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    tableId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Table.t * GapiConversation.Session.t
  
  (** Creates a new, empty table in the dataset.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the new table
    @param datasetId Dataset ID of the new table
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    GapiBigqueryV2Model.Table.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Table.t * GapiConversation.Session.t
  
  (** Lists all tables in the specified dataset. Requires the READER dataset role.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of results to return
    @param pageToken Page token, returned by a previous call, to request the next page of results
    @param projectId Project ID of the tables to list
    @param datasetId Dataset ID of the tables to list
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    projectId:string ->
    datasetId:string ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.TableList.t * GapiConversation.Session.t
  
  (** Updates information in an existing table. The update method replaces the entire table resource, whereas the patch method only replaces fields that are provided in the submitted table resource. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the table to update
    @param datasetId Dataset ID of the table to update
    @param tableId Table ID of the table to update
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    tableId:string ->
    GapiBigqueryV2Model.Table.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Table.t * GapiConversation.Session.t
  
  (** Updates information in an existing table. The update method replaces the entire table resource, whereas the patch method only replaces fields that are provided in the submitted table resource.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/bigquery/v2/"]).
    @param std_params Optional standard parameters.
    @param projectId Project ID of the table to update
    @param datasetId Dataset ID of the table to update
    @param tableId Table ID of the table to update
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    projectId:string ->
    datasetId:string ->
    tableId:string ->
    GapiBigqueryV2Model.Table.t ->
    GapiConversation.Session.t ->
    GapiBigqueryV2Model.Table.t * GapiConversation.Session.t
  
  
end


