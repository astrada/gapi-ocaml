open GapiUtils.Infix
open GapiLens.Infix
open GdataACL

let get_url ?(rel = `Edit) links_lens entry =
  entry |. links_lens |> GdataAtom.find_url rel

let get_etag etag_lens entry =
  entry |. etag_lens |> GdataUtils.string_to_option

let get_url_etag ?rel entry =
  let url = get_url Entry.links ?rel entry in
  let etag = get_etag Entry.etag entry in
    (url, etag)

let parse_acl_feed =
  GdataUtils.parse_xml_response parse_feed

let parse_acl_entry =
  GdataUtils.parse_xml_response parse_entry

let get_acl
      ?version
      ?etag
      url
      session =
  GdataService.query
    ?version
    ?etag
    url
    parse_acl_feed
    session

let refresh_acl
      ?version
      entry
      session =
  let (url, etag) = get_url_etag ~rel:`Self entry in
    GdataService.read
      ?version
      ?etag
      entry
      url
      parse_acl_entry
      session

let create_acl
      ?version
      ?query_parameters
      acl_entry
      url
      session =
  GdataService.create
    entry_to_data_model 
    ?version
    ?query_parameters
    acl_entry
    url
    parse_acl_entry
    session

let update_acl
      ?version
      entry
      session =
  let (url, etag) = get_url_etag entry in
    GdataService.update
      entry_to_data_model 
      ?version
      ?etag
      entry
      url
      parse_acl_entry
      session

let delete_acl
      ?version
      entry
      session =
  let (url, etag) = get_url_etag entry in
    GdataService.delete
      ?version
      ?etag
      url
      session

let acl_batch_request
      ?version
      target_feed
      batch_feed
      session =
  let url = target_feed |. Feed.links |> find_url `Batch in
    GdataService.batch_request
      feed_to_data_model
      ?version
      batch_feed
      url
      parse_acl_feed
      session

