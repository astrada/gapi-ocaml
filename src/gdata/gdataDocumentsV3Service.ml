open GapiUtils.Infix
open GdataDocumentsV3Model

(* TODO: query parameters *)

let version = "3.0"

let feed_scope = "https://docs.google.com/feeds/"
let docs_scope = "https://docs.googleusercontent.com/"
let spreadsheets_scope = "https://spreadsheets.google.com/feeds/"
let all_scopes = feed_scope ^ " " ^ docs_scope ^ " " ^ spreadsheets_scope

let parse_documents_feed =
  GdataUtils.parse_xml_response Document.Feed.parse_feed

let parse_document_entry =
  GdataUtils.parse_xml_response Document.parse_document_entry

let parse_metadata_entry =
  GdataUtils.parse_xml_response Metadata.parse_metadata_entry

let all_documents
      ?(url = "https://docs.google.com/feeds/default/private/full")
      ?etag
      session =
  GdataService.query
    ~version
    ?etag
    url
    parse_documents_feed
    session

let get_user_metadata
      ?(url = "https://docs.google.com/feeds/metadata/default")
      ?etag
      session =
  GdataService.query
    ~version
    ?etag
    url
    parse_metadata_entry
    session

let all_changes
      ?(url = "https://docs.google.com/feeds/default/private/changes")
      ?etag
      session =
  GdataService.query
    ~version
    ?etag
    url
    parse_documents_feed
    session

