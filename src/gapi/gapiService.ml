open GapiUtils.Infix

exception ServiceError of GapiError.RequestError.t

let parse_error pipe response_code =
  try
    let error = GapiJson.parse_json_response
                  GapiError.RequestError.of_data_model
                  pipe
    in
      raise (ServiceError error)
  with Json_type.Json_error _ ->
    GapiConversation.parse_error pipe response_code

let service_request
      ?post_data
      ?version
      ?etag
      ?query_parameters
      ?media_source
      ?media_download
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
      ?media_source
      ?media_download
      ~parse_error
      request_type
      query_url
      parse_response
      session

let service_request_with_data
      request_type
      data_to_post
      ?version
      ?etag
      ?query_parameters
      ?media_source
      ?media_download
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
        ?query_parameters
        ?media_source
        ?media_download
        ~request_type
        url
        parse_response
        session
    with GapiRequest.NotModified new_session ->
      (data, new_session)

let download_resource
      ?version
      ?query_parameters
      ?ranges
      url
      media_destination
      session =
  let range_spec =
    Option.map_default GapiMediaResource.generate_range_spec "" ranges in
  let media_download = {
    GapiMediaResource.destination = media_destination;
    range_spec;
  } in
    service_request
      ?query_parameters
      ~media_download
      ?version
      ~request_type:GapiRequest.Query
      url
      GapiRequest.parse_empty_response
      session

let build_param default_params params get_value to_string name = 
  let value = get_value params in
    if value <> get_value default_params then
      [(name, to_string value)]
    else
      []

let build_params params get_value to_string name =
  let values = get_value params in
    List.map (fun value -> (name, to_string value)) values

module StandardParameters =
struct
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    key : string;
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    key = "";
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp";
       param (fun p -> p.key) Std.identity "key"]
      |> List.concat

  let merge_parameters ?standard_parameters () =
    standard_parameters

end

let get
      ?etag
      ?query_parameters
      ?media_download
      url
      parse_response
      session =
  service_request
    ?etag
    ?query_parameters
    ?media_download
    ~request_type:GapiRequest.Query
    url
    parse_response
    session

let post
      ?etag
      ?query_parameters
      ?media_source
      ?(data_to_post = (fun _ -> GapiCore.PostData.empty))
      ~data
      url
      parse_response
      session =
  let post_data = data_to_post data in
    service_request
      ~post_data
      ?etag
      ?query_parameters
      ?media_source
      ~request_type:GapiRequest.Create
      url
      parse_response
      session

let put
      ?etag
      ?query_parameters
      ?media_source
      ~data_to_post
      ~data
      url
      parse_response
      session =
  service_request_with_data
    GapiRequest.Update
    data_to_post
    ?etag
    ?query_parameters
    ?media_source
    data
    url
    parse_response
    session

let put'
      ?etag
      ?query_parameters
      ?media_source
      ~data_to_post
      ~data
      url
      parse_response
      session =
  let post_data = data_to_post data in
    service_request
      ~post_data
      ?etag
      ?query_parameters
      ?media_source
      ~request_type:GapiRequest.Update
      url
      parse_response
      session

let patch
      ?etag
      ?query_parameters
      ?media_source
      ~data_to_post
      ~data
      url
      parse_response
      session =
  service_request_with_data
    GapiRequest.Patch
    data_to_post
    ?etag
    ?query_parameters
    ?media_source
    data
    url
    parse_response
    session

let patch'
      ?etag
      ?query_parameters
      ?media_source
      ~data_to_post
      ~data
      url
      parse_response
      session =
  let post_data = data_to_post data in
    service_request
      ~post_data
      ?etag
      ?query_parameters
      ?media_source
      ~request_type:GapiRequest.Patch
      url
      parse_response
      session

let delete
      ?etag
      ?query_parameters
      url
      parse_response
      session =
  service_request
    ?etag
    ?query_parameters
    ~request_type:GapiRequest.Delete
    url
    parse_response
    session

