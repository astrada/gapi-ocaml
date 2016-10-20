(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiTasksV1Model

module Scope =
struct
  let tasks = "https://www.googleapis.com/auth/tasks"
  
  let tasks_readonly = "https://www.googleapis.com/auth/tasks.readonly"
  
  
end

module TasklistsResource =
struct
  module TasklistsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* tasklists-specific query parameters *)
      maxResults : int64;
      pageToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0L;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) Int64.to_string "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
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
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "@me"; "lists";
      ((fun x -> x) tasklist)] base_url in
    let params = TasklistsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasklistsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?etag
        ?std_params
        ~tasklist
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "@me"; "lists";
      ((fun x -> x) tasklist)] base_url in
    let params = TasklistsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasklistsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response TaskList.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        taskList
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "@me"; "lists"]
      base_url in
    let etag = GapiUtils.etag_option taskList.TaskList.etag in
    let params = TasklistsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasklistsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json TaskList.to_data_model)
      ~data:taskList full_url
      (GapiJson.parse_json_response TaskList.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ?maxResults
        ?pageToken
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "@me"; "lists"]
      base_url in
    let params = TasklistsParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?pageToken () in
    let query_parameters = Option.map TasklistsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response TaskLists.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        taskList
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "@me"; "lists";
      ((fun x -> x) tasklist)] base_url in
    let etag = GapiUtils.etag_option taskList.TaskList.etag in
    let params = TasklistsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasklistsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json TaskList.to_data_model)
      ~data:taskList full_url
      (GapiJson.parse_json_response TaskList.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        taskList
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "@me"; "lists";
      ((fun x -> x) tasklist)] base_url in
    let etag = GapiUtils.etag_option taskList.TaskList.etag in
    let params = TasklistsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasklistsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json TaskList.to_data_model)
      ~data:taskList full_url
      (GapiJson.parse_json_response TaskList.of_data_model) session 
    
  
end

module TasksResource =
struct
  module TasksParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* tasks-specific query parameters *)
      completedMax : string;
      completedMin : string;
      dueMax : string;
      dueMin : string;
      maxResults : int64;
      pageToken : string;
      parent : string;
      previous : string;
      showCompleted : bool;
      showDeleted : bool;
      showHidden : bool;
      updatedMin : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      completedMax = "";
      completedMin = "";
      dueMax = "";
      dueMin = "";
      maxResults = 0L;
      pageToken = "";
      parent = "";
      previous = "";
      showCompleted = false;
      showDeleted = false;
      showHidden = false;
      updatedMin = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.completedMax) (fun x -> x) "completedMax";
      param (fun p -> p.completedMin) (fun x -> x) "completedMin";
      param (fun p -> p.dueMax) (fun x -> x) "dueMax";
      param (fun p -> p.dueMin) (fun x -> x) "dueMin";
      param (fun p -> p.maxResults) Int64.to_string "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.parent) (fun x -> x) "parent";
      param (fun p -> p.previous) (fun x -> x) "previous";
      param (fun p -> p.showCompleted) string_of_bool "showCompleted";
      param (fun p -> p.showDeleted) string_of_bool "showDeleted";
      param (fun p -> p.showHidden) string_of_bool "showHidden";
      param (fun p -> p.updatedMin) (fun x -> x) "updatedMin";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(completedMax = default.completedMax)
        ?(completedMin = default.completedMin)
        ?(dueMax = default.dueMax)
        ?(dueMin = default.dueMin)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(parent = default.parent)
        ?(previous = default.previous)
        ?(showCompleted = default.showCompleted)
        ?(showDeleted = default.showDeleted)
        ?(showHidden = default.showHidden)
        ?(updatedMin = default.updatedMin)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        completedMax;
        completedMin;
        dueMax;
        dueMin;
        maxResults;
        pageToken;
        parent;
        previous;
        showCompleted;
        showDeleted;
        showHidden;
        updatedMin;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let clear
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "clear"] base_url in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:() full_url
      GapiRequest.parse_empty_response session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        ~task
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"; ((fun x -> x) task)] base_url in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?etag
        ?std_params
        ~tasklist
        ~task
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"; ((fun x -> x) task)] base_url in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Task.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ?parent
        ?previous
        ~tasklist
        task
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"] base_url in
    let etag = GapiUtils.etag_option task.Task.etag in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params ?parent ?previous () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Task.to_data_model) ~data:task
      full_url (GapiJson.parse_json_response Task.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ?completedMax
        ?completedMin
        ?dueMax
        ?dueMin
        ?maxResults
        ?pageToken
        ?showCompleted
        ?showDeleted
        ?showHidden
        ?updatedMin
        ~tasklist
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"] base_url in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params ?completedMax ?completedMin ?dueMax
      ?dueMin ?maxResults ?pageToken ?showCompleted ?showDeleted ?showHidden
      ?updatedMin () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Tasks.of_data_model) session 
    
  let move
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ?parent
        ?previous
        ~tasklist
        ~task
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"; ((fun x -> x) task); "move"] base_url
      in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params ?parent ?previous () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:Task.empty full_url
      (GapiJson.parse_json_response Task.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        ~task
        task'
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"; ((fun x -> x) task)] base_url in
    let etag = GapiUtils.etag_option task'.Task.etag in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Task.to_data_model) ~data:task'
      full_url (GapiJson.parse_json_response Task.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/tasks/v1/")
        ?std_params
        ~tasklist
        ~task
        task'
        session =
    let full_url = GapiUtils.add_path_to_url ["lists";
      ((fun x -> x) tasklist); "tasks"; ((fun x -> x) task)] base_url in
    let etag = GapiUtils.etag_option task'.Task.etag in
    let params = TasksParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map TasksParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Task.to_data_model) ~data:task'
      full_url (GapiJson.parse_json_response Task.of_data_model) session 
    
  
end

