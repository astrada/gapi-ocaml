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

let test_parse_user_metadata_entry () =
  let ch = open_in "test_data/test_documents_user_metadata.xml" in
  let entry = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                Metadata.parse_metadata_entry in
  let tree = Metadata.metadata_entry_to_data_model entry in
    TestHelper.assert_equal_file
      "test_data/test_parse_user_metadata_entry.xml"
      (GdataUtils.data_to_xml_string tree)

let test_parse_changes_feed () =
  let ch = open_in "test_data/test_documents_changes_feed.xml" in
  let feed = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                Document.Feed.parse_feed in
  let tree = Document.document_feed_to_data_model feed in
    TestHelper.assert_equal_file
      "test_data/test_parse_changes_feed.xml"
      (GdataUtils.data_to_xml_string tree);
    assert_equal
      5635
      (Document.get_largest_changestamp feed)

let test_parse_revisions_feed () =
  let ch = open_in "test_data/test_documents_revisions_feed.xml" in
  let feed = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                Document.Feed.parse_feed in
  let tree = Document.document_feed_to_data_model feed in
    TestHelper.assert_equal_file
      "test_data/test_parse_revisions_feed.xml"
      (GdataUtils.data_to_xml_string tree)

let test_parse_acl_feed () =
  let ch = open_in "test_data/test_documents_acl_feed.xml" in
  let feed = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                GdataACL.Feed.parse_feed in
  let tree = GdataACL.acl_feed_to_data_model feed in
    TestHelper.assert_equal_file
      "test_data/test_parse_acl_feed.xml"
      (GdataUtils.data_to_xml_string tree)

let suite = "Documents List v3 Model test" >:::
  ["test_parse_documents_feed" >:: test_parse_documents_feed;
   "test_parse_user_metadata_entry" >:: test_parse_user_metadata_entry;
   "test_parse_changes_feed" >:: test_parse_changes_feed;
   "test_parse_revisions_feed" >:: test_parse_revisions_feed;
   "test_parse_acl_feed" >:: test_parse_acl_feed;
  ]

