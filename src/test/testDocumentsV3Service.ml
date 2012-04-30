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

let suite = "Documents List v3 Service test" >:::
  [(*"test_all_documents" >:: test_all_documents;*)
   "test_resumable_upload" >:: test_resumable_upload;
  ]

