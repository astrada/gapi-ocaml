open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GdataDocumentsV3Model
open GdataDocumentsV3Service

let test_all_documents () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = all_documents session in
         assert_equal
           "https://docs.google.com/feeds/default/private/full"
           feed.Document.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_resumable_upload () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let media_source =
         GapiMediaResource.create_file_resource "test_data/test.pdf" in
       let (response, session) =
         GapiService.service_request
           ~media_source
           ~version:"3.0"
           ~request_type:GapiRequest.Create
           "https://docs.google.com/feeds/upload/create-session/default/private/full?convert=false"
           GapiConversation.read_all
           session
       in
         print_endline response)

let test_get_user_metadata () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) = get_user_metadata session in
         assert_equal
           "Document List User Metadata"
           entry.Metadata.Entry.title.GdataAtom.Title.value;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_get_remaining_changestamps () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) = get_user_metadata
                                ~url:"https://docs.google.com/feeds/metadata/default?remaining-changestamps-first=1&remaining-changestamps-limit=100"
                                session in
         TestHelper.assert_not_empty
           "docs:remainingChangestamps should not be empty"
           entry.Metadata.Entry.remainingChangestamps;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_all_changes () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = all_changes session in
         assert_equal
           "https://docs.google.com/feeds/default/private/changes"
           feed.Document.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_get_revisions () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = all_documents session in
         try
           let entry = List.find
                         (fun e ->
                            e.Document.Entry.revisionsFeedLink.RevisionsFeedLink.href <> "")
                         feed.Document.Feed.entries in
           let (revisions, session) = get_revisions entry session in
             assert_equal
               "Document Revisions"
               revisions.Revision.Feed.title.GdataAtom.Title.value;
             TestHelper.assert_not_empty
               "ETag should not be empty"
               session.GapiConversation.Session.etag
         with Not_found -> ())

let suite = "Documents List v3 Service test" >:::
  [(*"test_all_documents" >:: test_all_documents;
   "test_resumable_upload" >:: test_resumable_upload;
   "test_get_user_metadata" >:: test_get_user_metadata;
   "test_get_remaining_changestamps" >:: test_get_remaining_changestamps;
   "test_all_changes" >:: test_all_changes;*)
   "test_get_revisions" >:: test_get_revisions;

  ]

