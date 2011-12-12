open GapiUtils.Infix
open GapiTasks

let scope = "https://www.googleapis.com/auth/tasks"
let read_only_scope = "https://www.googleapis.com/auth/tasks.readonly"

module TasksParameters =
struct
  type t = {
    (* Standard query parameters *)
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    (* Tasks-specific query parameters *)
    completedMax : GapiDate.t;
    completedMin : GapiDate.t;
    dueMax : GapiDate.t;
    dueMin : GapiDate.t;
    maxResults : int;
    pageToken : string;
    parent : string;
    previous : string;
    showCompleted : bool;
    showDeleted : bool;
    showHidden : bool;
    updatedMin : GapiDate.t
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    completedMax = GapiDate.epoch;
    completedMin = GapiDate.epoch;
    dueMax = GapiDate.epoch;
    dueMin = GapiDate.epoch;
    maxResults = 0;
    pageToken = "";
    parent = "";
    previous = "";
    showCompleted = true;
    showDeleted = false;
    showHidden = true;
    updatedMin = GapiDate.epoch
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      GapiService.build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp";
       param (fun p -> p.completedMax) GapiDate.to_string "completedMax";
       param (fun p -> p.completedMin) GapiDate.to_string "completedMin";
       param (fun p -> p.dueMax) GapiDate.to_string "dueMax";
       param (fun p -> p.dueMin) GapiDate.to_string "dueMin";
       param (fun p -> p.maxResults) string_of_int "maxResults";
       param (fun p -> p.pageToken) Std.identity "pageToken";
       param (fun p -> p.parent) Std.identity "parent";
       param (fun p -> p.previous) Std.identity "previous";
       param (fun p -> p.showCompleted) string_of_bool "showCompleted";
       param (fun p -> p.showDeleted) string_of_bool "showDeleted";
       param (fun p -> p.showHidden) string_of_bool "showHidden";
       param (fun p -> p.updatedMin) GapiDate.to_string "updatedMin"]
      |> List.concat

  let merge_parameters
        ?standard_parameters
        ?completedMax
        ?completedMin
        ?dueMax
        ?dueMin
        ?maxResults
        ?pageToken
        ?parent
        ?previous
        ?showCompleted
        ?showDeleted
        ?showHidden
        ?updatedMin
        () =
    let p =
      Option.map_default
        (fun sp ->
           { default with
                 fields = sp.GapiService.StandardParameters.fields;
                 prettyPrint = sp.GapiService.StandardParameters.prettyPrint;
                 quotaUser = sp.GapiService.StandardParameters.quotaUser;
                 userIp = sp.GapiService.StandardParameters.userIp
           })
        default
        standard_parameters in
    let p = Option.map_default (fun x -> { p with completedMax = x }) p completedMax in
    let p = Option.map_default (fun x -> { p with completedMin = x }) p completedMin in
    let p = Option.map_default (fun x -> { p with dueMax = x }) p dueMax in
    let p = Option.map_default (fun x -> { p with dueMin = x }) p dueMin in
    let p = Option.map_default (fun x -> { p with maxResults = x }) p maxResults in
    let p = Option.map_default (fun x -> { p with pageToken = x }) p pageToken in
    let p = Option.map_default (fun x -> { p with parent = x }) p parent in
    let p = Option.map_default (fun x -> { p with previous = x }) p previous in
    let p = Option.map_default (fun x -> { p with showCompleted = x }) p showCompleted in
    let p = Option.map_default (fun x -> { p with showDeleted = x }) p showDeleted in
    let p = Option.map_default (fun x -> { p with showHidden = x }) p showHidden in
    let p = Option.map_default (fun x -> { p with updatedMin = x }) p updatedMin in
      p

end

module TasklistsResourceConf =
struct
  type resource_list_t = TaskLists.t
  type resource_t = TaskList.t

  let service_url =
    "https://www.googleapis.com/tasks/v1/users"

  let parse_resource_list =
    GapiJson.parse_json_response TaskLists.of_data_model

  let parse_resource =
    GapiJson.parse_json_response TaskList.of_data_model

  let render_resource =
    GapiJson.render_json TaskList.to_data_model

  let create_resource_from_id id =
    { TaskList.empty with
          TaskList.id = id
    }

  let get_url ?(container_id = "@me") ?resource base_url =
    let container_path =
      [container_id; "lists"] in
    let resource_path =
      match resource with
          None ->
            []
        | Some r ->
            [r.TaskList.id]
    in
      GapiUtils.add_path_to_url
        (container_path @ resource_path)
        base_url

  let get_etag resource =
    GapiUtils.etag_option resource.TaskList.etag

end

module TasklistsResource =
struct
  module Service = GapiService.Make
                     (TasklistsResourceConf)
                     (TasksParameters)

  let list ?url ?etag ?parameters ?maxResults ?pageToken session =
    let params = TasksParameters.merge_parameters
                   ?standard_parameters:parameters ?maxResults ?pageToken () in
      Service.list ?url ?etag ~parameters:params session

  let get ?url ?parameters tasklist_id session =
    Service.get ?url ?parameters tasklist_id session

  let refresh ?url ?parameters tasklist session =
    Service.refresh ?url ?parameters tasklist session

  let insert ?url ?parameters tasklist session =
    Service.insert ?url ?parameters tasklist session

  let update ?url ?parameters tasklist session =
    Service.update ?url ?parameters tasklist session

  let patch ?url ?parameters tasklist session =
    Service.patch ?url ?parameters tasklist session

  let delete ?url tasklist session =
    Service.delete ?url tasklist session

end

module TasksResourceConf =
struct
  type resource_list_t = Tasks.t
  type resource_t = Task.t

  let service_url =
    "https://www.googleapis.com/tasks/v1/lists"

  let parse_resource_list =
    GapiJson.parse_json_response Tasks.of_data_model

  let parse_resource =
    GapiJson.parse_json_response Task.of_data_model

  let render_resource =
    GapiJson.render_json Task.to_data_model

  let create_resource_from_id id =
    { Task.empty with
          Task.id = id
    }

  let get_url ?(container_id = "@default") ?resource base_url =
    let container_path =
      [container_id; "tasks"] in
    let resource_path =
      match resource with
          None ->
            []
        | Some r ->
            [r.Task.id]
    in
      GapiUtils.add_path_to_url
        (container_path @ resource_path)
        base_url

  let get_etag resource =
    GapiUtils.etag_option resource.Task.etag

end

module TasksResource =
struct
  include GapiService.Make(TasksResourceConf)(TasksParameters)

  let move
        ?(url = TasksResourceConf.service_url)
        ?parameters
        ?(container_id = "@default")
        ?(new_parent = "")
        ?(new_previous = "")
        task_id
        session =
    let standard_parameters = GapiService.map_standard_parameters parameters in
    let target = { TasksParameters.default with
                       TasksParameters.parent = new_parent;
                       TasksParameters.previous = new_previous } in
    let query_parameters =
      TasksParameters.to_key_value_list target @ Option.default
                                                   [] standard_parameters in
    let url' = GapiUtils.add_path_to_url
                 [container_id; "tasks"; task_id; "move"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ~query_parameters
        url'
        TasksResourceConf.parse_resource
        session

  let clear
        ?(url = TasksResourceConf.service_url)
        ?(container_id = "@default")
        session =
    let url' = GapiUtils.add_path_to_url [container_id; "clear"] url in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        url'
        GapiRequest.parse_empty_response
        session

end

