open GapiUtils.Infix
module Option = GapiOption
module Fun = GapiFun

exception ServiceError of GapiConversation.Session.t * GapiError.RequestError.t

let parse_error pipe response_code session =
  let json_string_asciiz = GapiConversation.read_all pipe in
  let json_string = GapiUtils.string_before_char '\000' json_string_asciiz in
  try
    let error =
      GapiJson.parse_json_string GapiError.RequestError.of_data_model
        json_string
    in
    raise (ServiceError (session, error))
  with Yojson.Json_error _ ->
    failwith
      (Printf.sprintf "Error: %s (HTTP response code: %d)" json_string
         response_code)

let service_request ?post_data ?version ?etag ?query_parameters ?media_source
    ?media_download ?(request_type = GapiRequest.Query) ?custom_headers url
    parse_response session =
  let query_url =
    GapiUtils.option_map_default
      (fun params -> GapiUtils.merge_query_string params url)
      url query_parameters
  in
  try
    GapiRequest.gapi_request ?post_data ?version ?etag ?media_source
      ?media_download ?custom_headers ~parse_error request_type query_url
      parse_response session
  with
  | GapiRequest.BadRequest (session, response_code, pipe)
  | GapiRequest.Unauthorized (session, response_code, pipe)
  | GapiRequest.Forbidden (session, response_code, pipe)
  | GapiRequest.NotFound (session, response_code, pipe)
  | GapiRequest.InternalServerError (session, response_code, pipe)
  | GapiRequest.TooManyRequests (session, response_code, pipe)
  ->
    parse_error pipe response_code session

let service_request_with_data request_type data_to_post ?version ?etag
    ?query_parameters ?media_source ?media_download ?custom_headers data url
    parse_response session =
  let post_data = data_to_post data in
  try
    service_request ~post_data ?version ?etag ?query_parameters ?media_source
      ?media_download ~request_type url parse_response session
  with GapiRequest.NotModified new_session -> (data, new_session)

let download_resource ?version ?query_parameters ?ranges ?custom_headers url
    media_destination session =
  let range_spec =
    GapiUtils.option_map_default GapiMediaResource.generate_range_spec "" ranges
  in
  let media_download =
    { GapiMediaResource.destination = media_destination; range_spec }
  in
  service_request ?query_parameters ~media_download ?version
    ~request_type:GapiRequest.Query ?custom_headers url
    (fun pipe _ -> GapiRequest.parse_empty_response pipe)
    session

let build_param default_params params get_value to_string name =
  let value = get_value params in
  if value <> get_value default_params then [ (name, to_string value) ] else []

let build_params params get_value to_string name =
  let values = get_value params in
  List.map (fun value -> (name, to_string value)) values

module StandardParameters = struct
  type t = {
    alt : string;
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    key : string;
  }

  let default =
    {
      alt = "";
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
    [
      param (fun p -> p.alt) Fun.id "alt";
      param (fun p -> p.fields) Fun.id "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) Fun.id "quotaUser";
      param (fun p -> p.userIp) Fun.id "userIp";
      param (fun p -> p.key) Fun.id "key";
    ]
    |> List.concat

  let merge_parameters ?standard_parameters () = standard_parameters
end

let head ?etag ?query_parameters ?media_download ?custom_headers url
    parse_headers session =
  service_request ?etag ?query_parameters ?media_download ?custom_headers
    ~request_type:GapiRequest.QueryMeta url
    (fun _ headers -> parse_headers headers)
    session

let get ?etag ?query_parameters ?media_download ?custom_headers url
    parse_response session =
  service_request ?etag ?query_parameters ?media_download ?custom_headers
    ~request_type:GapiRequest.Query url
    (fun pipe _ -> parse_response pipe)
    session

let post ?etag ?query_parameters ?media_source ?media_download
    ?(data_to_post = fun _ -> GapiCore.PostData.empty) ?custom_headers ~data url
    parse_response session =
  let post_data = data_to_post data in
  service_request ~post_data ?etag ?query_parameters ?media_source
    ?media_download ~request_type:GapiRequest.Create ?custom_headers url
    (fun pipe _ -> parse_response pipe)
    session

let put ?etag ?query_parameters ?media_source ?custom_headers ~data_to_post
    ~data url parse_response session =
  service_request_with_data GapiRequest.Update data_to_post ?etag
    ?query_parameters ?media_source ?custom_headers data url
    (fun pipe _ -> parse_response pipe)
    session

let put' ?etag ?query_parameters ?media_source ?custom_headers ~data_to_post
    ~data url parse_response session =
  let post_data = data_to_post data in
  service_request ~post_data ?etag ?query_parameters ?media_source
    ~request_type:GapiRequest.Update ?custom_headers url
    (fun pipe _ -> parse_response pipe)
    session

let patch ?etag ?query_parameters ?media_source ?custom_headers ~data_to_post
    ~data url parse_response session =
  service_request_with_data GapiRequest.Patch data_to_post ?etag
    ?query_parameters ?media_source ?custom_headers data url
    (fun pipe _ -> parse_response pipe)
    session

let patch' ?etag ?query_parameters ?media_source ?custom_headers ~data_to_post
    ~data url parse_response session =
  let post_data = data_to_post data in
  service_request ~post_data ?etag ?query_parameters ?media_source
    ~request_type:GapiRequest.Patch ?custom_headers url
    (fun pipe _ -> parse_response pipe)
    session

let delete ?etag ?query_parameters ?custom_headers url parse_response session =
  service_request ?etag ?query_parameters ~request_type:GapiRequest.Delete
    ?custom_headers url
    (fun pipe _ -> parse_response pipe)
    session
