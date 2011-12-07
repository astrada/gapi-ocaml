open GapiUtils.Infix

let service_request
      ?post_data
      ?version
      ?query_parameters
      ?etag
      ?(request_type = GapiRequest.Query)
      url
      parse_response
      session =
  let query_url =
    Option.map_default
      (fun params -> GapiUtils.merge_query_string params url)
      url
      query_parameters
  in
    GapiRequest.gapi_request
      ?post_data
      ?version
      ?etag
      request_type
      query_url
      parse_response
      session

let service_request_with_data
      request_type
      data_to_post
      ?version
      ?etag
      data
      url
      parse_response
      session =
  let post_data = data_to_post data in
    try
      service_request
        ~post_data
        ?version
        ?etag
        ~request_type
        url
        parse_response
        session
    with GapiRequest.NotModified new_session ->
      (data, new_session)

let query
      ?version
      ?etag
      ?query_parameters
      url
      parse_response
      session =
  service_request
    ?version
    ?etag
    ?query_parameters
    ~request_type:GapiRequest.Query
    url
    parse_response
    session

let create
      data_to_post
      ?version
      data
      url
      parse_response
      session =
  service_request_with_data
    GapiRequest.Create
    data_to_post
    ?version
    data
    url
    parse_response
    session

let read
      ?version
      ?etag
      data
      url
      parse_response
      session =
  try
    service_request
      ?version
      ?etag
      url
      parse_response
      session
  with GapiRequest.NotModified new_session ->
    (data, new_session)

let update
      data_to_post
      ?version
      ?etag
      data
      url
      parse_response
      session =
  service_request_with_data
    GapiRequest.Update
    data_to_post
    ?version
    ?etag
    data
    url
    parse_response
    session

let patch
      data_to_post
      ?version
      ?etag
      data
      url
      parse_response
      session =
  service_request_with_data
    GapiRequest.Patch
    data_to_post
    ?version
    ?etag
    data
    url
    parse_response
    session

let delete
      ?version
      ?etag
      url =
  service_request
    ?version
    ?etag
    ~request_type:GapiRequest.Delete
    url
    GapiRequest.parse_empty_response

let batch_request
      data_to_post
      ?version
      data
      url
      parse_response
      session =
  service_request_with_data
    GapiRequest.Create
    data_to_post
    ?version
    data
    url
    parse_response
    session

module type QueryParameters = 
sig
  type t

  val default : t

  val to_key_value_list : t -> (string * string) list

end

let build_param default_params params get_value to_string name = 
  let value = get_value params in
    if value <> get_value default_params then
      [(name, to_string value)]
    else
      []

module StandardParameters =
struct
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = ""
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp"]
      |> List.concat

end

module type ServiceConf =
sig
  type resource_list_t
  type resource_t

  val service_url : string

  val parse_resource_list : GapiPipe.OcamlnetPipe.t -> resource_list_t

  val parse_resource : GapiPipe.OcamlnetPipe.t -> resource_t

  val render_resource : resource_t -> GapiCore.PostData.t

  val create_resource_from_id : string -> resource_t

  val get_url :
    ?container_id:string ->
    ?resource:resource_t ->
    string -> string

  val get_etag : resource_t -> string option

end

module type SERVICE =
sig
  type resource_list_t
  type resource_t
  type query_parameters_t

  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (resource_list_t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

module Make
  (S : ServiceConf)
  (Q : QueryParameters) =
struct
  type resource_list_t = S.resource_list_t
  type resource_t = S.resource_t
  type query_parameters_t = Q.t

  let list
        ?(url = S.service_url)
        ?etag
        ?parameters
        ?container_id
        session =
    let url' = S.get_url ?container_id url in
    let query_parameters = Option.map
                             Q.to_key_value_list
                             parameters in
      query
        ?etag
        ?query_parameters
        url'
        S.parse_resource_list
        session

  let get
        ?(url = S.service_url)
        ?container_id
        id
        session =
    let resource = S.create_resource_from_id id in
    let url' = S.get_url ?container_id ~resource url in
      query
        url'
        S.parse_resource
        session

  let refresh
        ?(url = S.service_url)
        ?container_id
        resource
        session =
    let url' = S.get_url ?container_id ~resource url in
    let etag = S.get_etag resource in
      read
        ?etag
        resource
        url'
        S.parse_resource
        session

  let insert
        ?(url = S.service_url)
        ?container_id
        resource
        session =
    let url' = S.get_url ?container_id url in
      create
        S.render_resource
        resource
        url'
        S.parse_resource
        session

  let update
        ?(url = S.service_url)
        ?container_id
        resource
        session =
    let url' = S.get_url ?container_id ~resource url in
    let etag = S.get_etag resource in
      update
        S.render_resource
        ?etag
        resource
        url'
        S.parse_resource
        session

  let patch
        ?(url = S.service_url)
        ?container_id
        resource
        session =
    let url' = S.get_url ?container_id ~resource url in
    let etag = S.get_etag resource in
      patch
        S.render_resource
        ?etag
        resource
        url'
        S.parse_resource
        session

  let delete
        ?(url = S.service_url)
        ?container_id
        resource
        session =
    let url' = S.get_url ?container_id ~resource url in
    let etag = S.get_etag resource in
      delete
        ?etag
        url'
        session

end

