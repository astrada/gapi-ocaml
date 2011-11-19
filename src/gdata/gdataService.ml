let data_to_post data_to_tree data =
  let tree = data_to_tree data in
  let body = GdataUtils.data_to_xml_string tree in
    GapiCore.PostData.Body (body, GdataCore.default_content_type)

let query = GapiService.query

let create data_to_tree =
  GapiService.create (data_to_post data_to_tree)

let read = GapiService.read

let update data_to_tree =
  GapiService.update (data_to_post data_to_tree)

let delete = GapiService.delete

let batch_request data_to_tree =
  GapiService.batch_request (data_to_post data_to_tree)

