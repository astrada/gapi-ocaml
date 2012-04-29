open OUnit
open GdataDocumentsV3Model

let test_parse_documents_feed () =
  let ch = open_in "test_data/test_documents_feed.xml" in
  let feed = GdataUtils.parse_xml
               (fun () -> input_byte ch)
               Document.Feed.parse_feed in
  let tree = Document.document_feed_to_data_model feed in
    TestHelper.assert_equal_file
      "test_data/test_parse_documents_feed.xml"
      (GdataUtils.data_to_xml_string tree)

let suite = "Documents List v3 Model test" >:::
  ["test_parse_documents_feed" >:: test_parse_documents_feed;
  ]

