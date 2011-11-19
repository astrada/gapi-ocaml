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

