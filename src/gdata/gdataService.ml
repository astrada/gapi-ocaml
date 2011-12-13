let data_to_post data_to_tree data =
  let tree = data_to_tree data in
  let body = GdataUtils.data_to_xml_string tree in
    GapiCore.PostData.Body (body, GdataCore.default_content_type)

let query = GapiService.query

let create
      data_to_tree
      ?version
      data
      url
      parse_response
      session =
  GapiService.create
    (data_to_post data_to_tree)
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
  GapiService.read
    ?version
    ?etag
    data
    url
    parse_response
    session

let update
      data_to_tree
      ?version
      ?etag
      data
      url
      parse_response
      session =
  GapiService.update
    (data_to_post data_to_tree)
    ?version
    ?etag
    data
    url
    parse_response
    session

let delete
      ?version
      ?etag
      id
      session =
  GapiService.delete
    ?version
    ?etag
    id
    session

let batch_request data_to_tree =
  GapiService.batch_request (data_to_post data_to_tree)

