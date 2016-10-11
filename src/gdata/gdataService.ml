let data_to_post data_to_tree data =
  let tree = data_to_tree data in
  let body = GdataUtils.data_to_xml_string tree in
  GapiCore.PostData.Body (GapiCore.PostData.String body,
                          GdataCore.default_content_type)

let query
      ?version
      ?etag
      ?query_parameters
      url
      parse_response
      session =
  GapiService.service_request
    ?version
    ?etag
    ?query_parameters
    ~request_type:GapiRequest.Query
    url
    (fun pipe _ -> parse_response pipe)
    session

let create
      data_to_tree
      ?version
      ?query_parameters
      ?media_source
      data
      url
      parse_response
      session =
  GapiService.service_request_with_data
    GapiRequest.Create
    (data_to_post data_to_tree)
    ?version
    ?query_parameters
    ?media_source
    data
    url
    (fun pipe _ -> parse_response pipe)
    session

let read
      ?version
      ?etag
      data
      url
      parse_response
      session =
  try
    GapiService.service_request
      ?version
      ?etag
      url
      (fun pipe _ -> parse_response pipe)
      session
  with GapiRequest.NotModified new_session ->
    (data, new_session)

let update
      data_to_tree
      ?version
      ?etag
      ?query_parameters
      ?media_source
      data
      url
      parse_response
      session =
  GapiService.service_request_with_data
    GapiRequest.Update
    (data_to_post data_to_tree)
    ?version
    ?etag
    ?query_parameters
    ?media_source
    data
    url
    (fun pipe _ -> parse_response pipe)
    session

let patch
      data_to_tree
      ?version
      ?etag
      ?query_parameters
      ?media_source
      data
      url
      parse_response
      session =
  GapiService.service_request_with_data
    GapiRequest.Patch
    (data_to_post data_to_tree)
    ?version
    ?etag
    ?query_parameters
    ?media_source
    data
    url
    (fun pipe _ -> parse_response pipe)
    session

let delete
      ?version
      ?etag
      ?query_parameters
      url
      session =
  GapiService.service_request
    ?version
    ?etag
    ?query_parameters
    ~request_type:GapiRequest.Delete
    url
    (fun pipe _ -> GapiRequest.parse_empty_response pipe)
    session

let batch_request
      data_to_tree
      ?version
      data
      url
      parse_response
      session =
  GapiService.service_request_with_data
    GapiRequest.Create
    (data_to_post data_to_tree)
    ?version
    data
    url
    (fun pipe _ -> parse_response pipe)
    session

