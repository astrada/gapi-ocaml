let service_request
      ?data_to_upload
      ?version
      ?query_parameters
      ?etag
      ?(request_type = GdataRequest.Query)
      url
      parse_response
      session =
  let query_url = Option.map_default
                    (fun params -> GdataUtils.merge_query_string params url)
                    url
                    query_parameters in
  let post_data =
    Option.map
      (fun data ->
         let body = GdataRequest.data_to_xml_string data in
           GdataCore.PostData.Body (body, GdataCore.default_content_type))
      data_to_upload
  in
    GdataRequest.gdata_request
      ?post_data
      ?version
      ?etag
      request_type
      query_url
      parse_response
      session

let service_request_with_data
      ?version
      ?etag
      data
      data_to_tree
      request_type
      url
      parse_response
      session =
  let data_to_upload = data_to_tree data in
    try
      service_request
        ~data_to_upload
        ?version
        ?etag
        ~request_type
        url
        parse_response
        session
    with GdataRequest.NotModified new_session ->
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
    ~request_type:GdataRequest.Query
    url
    parse_response
    session

let create
      ?version
      data
      data_to_tree
      url
      parse_response
      session =
  service_request_with_data
    ?version
    data
    data_to_tree
    GdataRequest.Create
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
  with GdataRequest.NotModified new_session ->
    (data, new_session)

let update
      ?version
      ?etag
      data
      data_to_tree
      url
      parse_response
      session =
  service_request_with_data
    ?version
    ?etag
    data
    data_to_tree
    GdataRequest.Update
    url
    parse_response
    session

let delete
      ?version
      ?etag
      url
      session =
  service_request
    ?version
    ?etag
    ~request_type:GdataRequest.Delete
    url
    GdataRequest.parse_empty_response
    session

