open GapiUtils.Infix
open GdataDocumentsV3Model

(* TODO: query parameters *)

let version = "3"

let feed_scope = "https://docs.google.com/feeds/"
let docs_scope = "https://docs.googleusercontent.com/"
let spreadsheets_scope = "https://spreadsheets.google.com/feeds/"
let all_scopes = feed_scope ^ " " ^ docs_scope ^ " " ^ spreadsheets_scope

let parse_documents_feed =
  GdataUtils.parse_xml_response Document.Feed.parse_feed

let parse_document_entry =
  GdataUtils.parse_xml_response Document.parse_document_entry

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

