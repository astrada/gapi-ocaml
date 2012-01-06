open GapiUtils.Infix
open GapiPlusV1Model

let scope = "https://www.googleapis.com/auth/plus.me"

module PlusParameters =
struct
  type t = {
    (* Standard query parameters *)
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    (* Plus-specific query parameters *)
    query : string;
    language : string;
    maxResults : int;
    orderBy : string;
    pageToken : string
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    query = "";
    language = "";
    maxResults = 0;
    orderBy = "";
    pageToken = ""
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      GapiService.build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp";
       param (fun p -> p.query) Std.identity "query";
       param (fun p -> p.language) Std.identity "language";
       param (fun p -> p.maxResults) string_of_int "maxResults";
       param (fun p -> p.orderBy) Std.identity "orderBy";
       param (fun p -> p.pageToken) Std.identity "pageToken"]
      |> List.concat

  let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(query = default.query)
        ?(language = default.language)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(pageToken = default.pageToken)
        () =
    let parameters =
      { fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        query;
        language;
        maxResults;
        orderBy;
        pageToken
      }
    in
      if parameters = default then None else Some parameters

end

module ActivitiesResourceConf =
struct
  type resource_list_t = ActivityFeed.t
  type resource_t = Activity.t

  let service_url =
    "https://www.googleapis.com/plus/v1/activities"

  let parse_resource_list =
    GapiJson.parse_json_response ActivityFeed.of_data_model

  let parse_resource =
    GapiJson.parse_json_response Activity.of_data_model

  let render_resource =
    GapiJson.render_json Activity.to_data_model

  let create_resource_from_id id =
    { Activity.empty with
          Activity.id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.Activity.id]
            base_url

  let get_etag resource =
    None

end

module ActivitiesResource =
struct
  module Service =
    GapiService.Make(ActivitiesResourceConf)(PlusParameters)

  let get ?url ?parameters ~activityId session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.get ?url ?parameters:params activityId session

  let list
        ?(url = "https://www.googleapis.com/plus/v1/people")
        ?parameters ?(userId = "me") ?(collection = "public")
        ?maxResults ?pageToken session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters
                   ?maxResults ?pageToken () in
    let url' = GapiUtils.add_path_to_url
                 [userId; "activities"; collection]
                 url in
      Service.list ~url:url' ?parameters:params session

  let search ?url ?parameters ~query ?language ?maxResults ?orderBy
        ?pageToken session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters
                   ~query ?language ?maxResults ?orderBy ?pageToken () in
      Service.list ?url ?parameters:params session

end

module CommentsResourceConf =
struct
  type resource_list_t = CommentFeed.t
  type resource_t = Comment.t

  let service_url =
    "https://www.googleapis.com/plus/v1/comments"

  let parse_resource_list =
    GapiJson.parse_json_response CommentFeed.of_data_model

  let parse_resource =
    GapiJson.parse_json_response Comment.of_data_model

  let render_resource =
    GapiJson.render_json Comment.to_data_model

  let create_resource_from_id id =
    { Comment.empty with
          Comment.id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.Comment.id]
            base_url

  let get_etag resource =
    None

end

module CommentsResource =
struct
  module Service =
    GapiService.Make(CommentsResourceConf)(PlusParameters)

  let list
        ?(url = "https://www.googleapis.com/plus/v1/activities")
        ?parameters ~activityId ?maxResults ?pageToken session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters
                   ?maxResults ?pageToken () in
    let url' = GapiUtils.add_path_to_url
                 [activityId; "comments"]
                 url in
      Service.list ~url:url' ?parameters:params session

  let get ?url ?parameters ~commentId session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.get ?url ?parameters:params commentId session

end

module PeopleResourceConf =
struct
  type resource_list_t = PeopleFeed.t
  type resource_t = Person.t

  let service_url =
    "https://www.googleapis.com/plus/v1/people"

  let parse_resource_list =
    GapiJson.parse_json_response PeopleFeed.of_data_model

  let parse_resource =
    GapiJson.parse_json_response Person.of_data_model

  let render_resource =
    GapiJson.render_json Person.to_data_model

  let create_resource_from_id id =
    { Person.empty with
          Person.id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.Person.id]
            base_url

  let get_etag resource =
    None

end

module PeopleResource =
struct
  module Service =
    GapiService.Make(PeopleResourceConf)(PlusParameters)

  let listByActivity
        ?(url = "https://www.googleapis.com/plus/v1/activities")
        ?parameters
        ~activityId
        ~collection
        ?maxResults
        ?pageToken
        session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters
                   ?maxResults ?pageToken () in
    let url' = GapiUtils.add_path_to_url
                 [activityId; "people"; collection]
                 url in
      Service.list ~url:url' ?parameters:params session

  let search ?url
        ?parameters
        ~query
        ?language
        ?maxResults
        ?pageToken
        session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters
                   ?language ~query ?maxResults ?pageToken () in
      Service.list ?url ?parameters:params session

  let get ?url ?parameters ~userId session =
    let params = PlusParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.get ?url ?parameters:params userId session

end

