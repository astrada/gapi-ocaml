open GapiUtils.Infix
open GapiPlus

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
          Activity.id = id
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
  include GapiService.Make
    (ActivitiesResourceConf)
    (PlusParameters)

  let search 
        ?(url = ActivitiesResourceConf.service_url)
        parameters
        session =
    list
      ~url
      ~parameters
      session

  let list
        ?(url = "https://www.googleapis.com/plus/v1/people")
        ?parameters
        ?(user_id = "me")
        ?(collection = "public")
        session =
    let url' = GapiUtils.add_path_to_url
                 [user_id; "activities"; collection]
                 url
    in
      list
        ~url:url'
        ?parameters
        session

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
          Comment.id = id
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
  include GapiService.Make
    (CommentsResourceConf)
    (PlusParameters)

  let list
        ?(url = "https://www.googleapis.com/plus/v1/activities")
        ?parameters
        activity_id
        session =
    let url' = GapiUtils.add_path_to_url
                 [activity_id; "comments"]
                 url
    in
      list
        ~url:url'
        ?parameters
        session

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
          Person.id = id
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
  include GapiService.Make
    (PeopleResourceConf)
    (PlusParameters)

  let listByActivity
        ?(url = "https://www.googleapis.com/plus/v1/activities")
        ?parameters
        activity_id
        collection
        session =
    let url' = GapiUtils.add_path_to_url
                 [activity_id; "people"; collection]
                 url
    in
      list
        ~url:url'
        ?parameters
        session

  let search 
        ?(url = PeopleResourceConf.service_url)
        parameters
        session =
    list
      ~url
      ~parameters
      session

end

