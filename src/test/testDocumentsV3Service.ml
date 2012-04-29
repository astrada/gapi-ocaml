open OUnit
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

let suite = "Documents List v3 Service test" >:::
  ["test_all_documents" >:: test_all_documents;
  ]

