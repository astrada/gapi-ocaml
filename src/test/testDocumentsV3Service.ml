open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GdataDocumentsV3Model
open GdataDocumentsV3Service

let test_query_user_metadata () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         query_metadata session
       in
         assert_equal
           "Document List User Metadata"
           (entry
              |. Metadata.Entry.common
              |. GdataAtom.BasicEntry.title
              |. GdataAtom.Title.value);
         TestHelper.assert_not_empty
           "Entry id should not be empty"
           (entry
              |. Metadata.Entry.common
              |. GdataAtom.BasicEntry.id);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_query_metadata_remaining_changes () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.remaining_changestamps_first ^= 1
         |> QueryParameters.remaining_changestamps_limit ^= 10 in
       let (entry, session) =
         query_metadata ~parameters session
       in
         assert_bool
           "docs:remainingChangestamps should be greater than 0"
           (entry.Metadata.Entry.remainingChangestamps > 0);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_query_changes () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 5 in
       let (feed, session) =
         query_changes ~parameters session
       in
         assert_equal
           "https://docs.google.com/feeds/default/private/changes"
           feed.Document.Feed.id;
         assert_bool
           "There should be at most 5 entries"
           (List.length feed.Document.Feed.entries <= 5);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_query_changes_expand_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 1
         |> QueryParameters.expand_acl ^= true in
       let (feed, session) =
         query_changes ~parameters session
       in
         try
           let acl_entries = feed
             |. Document.Feed.entries
             |. GapiLens.head
             |. Document.Entry.aclFeedLink
             |. AclFeedLink.feed
             |. GdataACL.Feed.entries
           in
             assert_bool
               "There should be at least 1 ACL entry"
               (List.length acl_entries >= 1)
         with Failure "hd" -> ())

let test_query_documents_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 5 in
       let (feed, session) =
         query_documents_list ~parameters session
       in
         assert_equal
           "https://docs.google.com/feeds/default/private/full"
           feed.Document.Feed.id;
         assert_bool
           "There should be at most 5 entries"
           (List.length feed.Document.Feed.entries <= 5);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_query_text_documents () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.category ^= "document"
         |> QueryParameters.max_results ^= 5 in
       let (feed, session) =
         query_documents_list ~parameters session
       in
         assert_bool
           "All the entries should be of type document"
           (List.for_all
              (fun entry ->
                 ExtString.String.starts_with
                   entry.Document.Entry.resourceId
                   "document")
              feed.Document.Feed.entries);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_resumable_upload () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 1 in
       let (feed, session) =
         query_documents_list ~parameters session in
       let upload_link = find_url `ResumableCreateMedia feed.Document.Feed.links in
       let media_source =
         GapiMediaResource.create_file_resource "test_data/test.pdf" in
       let (entry, session) =
         resumable_upload
           upload_link
           media_source
           session
       in
         TestHelper.assert_not_empty
           "Resource ID should not be empty"
           entry.Document.Entry.resourceId)

let test_get_revisions () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = query_documents_list session in
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

let test_get_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = query_documents_list session in
         try
           let entry = List.find
                         (fun e ->
                            e.Document.Entry.aclFeedLink.AclFeedLink.href <> "")
                         feed.Document.Feed.entries in
           let (acl, session) = get_acl entry session in
             assert_equal
               "Document Permissions"
               acl.GdataACL.Feed.title.GdataAtom.Title.value;
             TestHelper.assert_not_empty
               "ETag should not be empty"
               session.GapiConversation.Session.etag
         with Not_found -> ())

let suite = "Documents List v3 Service test" >:::
  [(*"test_query_user_metadata" >:: test_query_user_metadata;
   "test_query_metadata_remaining_changes"
     >:: test_query_metadata_remaining_changes;
   "test_query_changes" >:: test_query_changes;
   "test_query_changes_expand_acl" >:: test_query_changes_expand_acl;
   "test_query_documents_list" >:: test_query_documents_list;
   "test_query_text_documents" >:: test_query_text_documents;*)
   "test_resumable_upload" >:: test_resumable_upload;
   (*"test_get_user_metadata" >:: test_get_user_metadata;
   "test_get_remaining_changestamps" >:: test_get_remaining_changestamps;
   "test_all_changes" >:: test_all_changes;
   "test_get_revisions" >:: test_get_revisions;
   "test_get_acl" >:: test_get_acl;*)
  ]

