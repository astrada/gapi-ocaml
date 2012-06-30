(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiBigqueryV2Model

module Scope =
struct
  let bigquery = "https://www.googleapis.com/auth/bigquery"
  
  
end

module DatasetsResource =
struct
  module DatasetsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* datasets-specific query parameters *)
      deleteContents : bool;
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      deleteContents = false;
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.deleteContents) string_of_bool "deleteContents";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(deleteContents = default.deleteContents)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        deleteContents;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?deleteContents
        ~projectId
        ~datasetId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId)]
      base_url in
    let params = DatasetsParameters.merge_parameters
      ?standard_parameters:std_params ?deleteContents () in
    let query_parameters = Option.map DatasetsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId)]
      base_url in
    let params = DatasetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map DatasetsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Dataset.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        dataset
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"] base_url in
    let etag = GapiUtils.etag_option dataset.Dataset.etag in
    let params = DatasetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map DatasetsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Dataset.to_data_model)
      ~data:dataset full_url
      (GapiJson.parse_json_response Dataset.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?maxResults
        ?pageToken
        ~projectId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"] base_url in
    let params = DatasetsParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?pageToken () in
    let query_parameters = Option.map DatasetsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response DatasetList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        dataset
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId)]
      base_url in
    let etag = GapiUtils.etag_option dataset.Dataset.etag in
    let params = DatasetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map DatasetsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Dataset.to_data_model)
      ~data:dataset full_url
      (GapiJson.parse_json_response Dataset.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        dataset
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId)]
      base_url in
    let etag = GapiUtils.etag_option dataset.Dataset.etag in
    let params = DatasetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map DatasetsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Dataset.to_data_model)
      ~data:dataset full_url
      (GapiJson.parse_json_response Dataset.of_data_model) session 
    
  
end

module JobsResource =
struct
  module Projection =
  struct
    type t =
      | Default
      | Full
      | Minimal
      
    let to_string = function
      | Default -> ""
      | Full -> "full"
      | Minimal -> "minimal"
      
    let of_string = function
      | "" -> Default
      | "full" -> Full
      | "minimal" -> Minimal
      | s -> failwith ("Unexpected value for Projection:" ^ s)
  
  end
  
  module StateFilter =
  struct
    type t =
      | Default
      | Done
      | Pending
      | Running
      
    let to_string = function
      | Default -> ""
      | Done -> "done"
      | Pending -> "pending"
      | Running -> "running"
      
    let of_string = function
      | "" -> Default
      | "done" -> Done
      | "pending" -> Pending
      | "running" -> Running
      | s -> failwith ("Unexpected value for StateFilter:" ^ s)
  
  end
  
  module JobsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* jobs-specific query parameters *)
      allUsers : bool;
      maxResults : int;
      pageToken : string;
      projection : Projection.t;
      startIndex : string;
      stateFilter : StateFilter.t list;
      timeoutMs : int;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      allUsers = false;
      maxResults = 0;
      pageToken = "";
      projection = Projection.Default;
      startIndex = "";
      stateFilter = [];
      timeoutMs = 0;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.allUsers) string_of_bool "allUsers";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.projection) Projection.to_string "projection";
      param (fun p -> p.startIndex) (fun x -> x) "startIndex";
      GapiService.build_params qp (fun p -> p.stateFilter) StateFilter.to_string "stateFilter";
      param (fun p -> p.timeoutMs) string_of_int "timeoutMs";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(allUsers = default.allUsers)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(projection = default.projection)
        ?(startIndex = default.startIndex)
        ?(stateFilter = default.stateFilter)
        ?(timeoutMs = default.timeoutMs)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        allUsers;
        maxResults;
        pageToken;
        projection;
        startIndex;
        stateFilter;
        timeoutMs;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~jobId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "jobs"; ((fun x -> x) jobId)] base_url in
    let params = JobsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map JobsParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Job.of_data_model) session 
    
  let getQueryResults
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?maxResults
        ?startIndex
        ?timeoutMs
        ~projectId
        ~jobId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "queries"; ((fun x -> x) jobId)] base_url in
    let params = JobsParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?startIndex ?timeoutMs ()
      in
    let query_parameters = Option.map JobsParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response GetQueryResultsResponse.of_data_model)
      session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        job
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "jobs"] base_url in
    let etag = GapiUtils.etag_option job.Job.etag in
    let params = JobsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map JobsParameters.to_key_value_list params
      in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Job.to_data_model) ~data:job
      full_url (GapiJson.parse_json_response Job.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?allUsers
        ?maxResults
        ?pageToken
        ?projection
        ?stateFilter
        ~projectId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "jobs"] base_url in
    let params = JobsParameters.merge_parameters
      ?standard_parameters:std_params ?allUsers ?maxResults ?pageToken
      ?projection ?stateFilter () in
    let query_parameters = Option.map JobsParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response JobList.of_data_model) session 
    
  let query
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        queryRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "queries"] base_url in
    let params = JobsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map JobsParameters.to_key_value_list params
      in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json QueryRequest.to_data_model)
      ~data:queryRequest full_url
      (GapiJson.parse_json_response QueryResponse.of_data_model) session 
    
  
end

module ProjectsResource =
struct
  module ProjectsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* projects-specific query parameters *)
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?maxResults
        ?pageToken
        session =
    let full_url = GapiUtils.add_path_to_url ["projects"] base_url in
    let params = ProjectsParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?pageToken () in
    let query_parameters = Option.map ProjectsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ProjectList.of_data_model) session 
    
  
end

module TabledataResource =
struct
  module TabledataParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* tabledata-specific query parameters *)
      maxResults : int;
      startIndex : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      startIndex = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.startIndex) (fun x -> x) "startIndex";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(startIndex = default.startIndex)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        startIndex;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?maxResults
        ?startIndex
        ~projectId
        ~datasetId
        ~tableId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"; ((fun x -> x) tableId); "data"] base_url in
    let params = TabledataParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?startIndex () in
    let query_parameters = Option.map TabledataParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response TableDataList.of_data_model) session 
    
  
end

module TablesResource =
struct
  module TablesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* tables-specific query parameters *)
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        ~tableId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"; ((fun x -> x) tableId)] base_url in
    let params = TablesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TablesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        ~tableId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"; ((fun x -> x) tableId)] base_url in
    let params = TablesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TablesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Table.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        table
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"] base_url in
    let etag = GapiUtils.etag_option table.Table.etag in
    let params = TablesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TablesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Table.to_data_model) ~data:table
      full_url (GapiJson.parse_json_response Table.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ?maxResults
        ?pageToken
        ~projectId
        ~datasetId
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"] base_url in
    let params = TablesParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?pageToken () in
    let query_parameters = Option.map TablesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response TableList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        ~tableId
        table
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"; ((fun x -> x) tableId)] base_url in
    let etag = GapiUtils.etag_option table.Table.etag in
    let params = TablesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TablesParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Table.to_data_model) ~data:table
      full_url (GapiJson.parse_json_response Table.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/bigquery/v2/")
        ?std_params
        ~projectId
        ~datasetId
        ~tableId
        table
        session =
    let full_url = GapiUtils.add_path_to_url ["projects";
      ((fun x -> x) projectId); "datasets"; ((fun x -> x) datasetId);
      "tables"; ((fun x -> x) tableId)] base_url in
    let etag = GapiUtils.etag_option table.Table.etag in
    let params = TablesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TablesParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Table.to_data_model) ~data:table
      full_url (GapiJson.parse_json_response Table.of_data_model) session 
    
  
end

