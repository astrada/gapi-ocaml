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
       let (upload_link, session) = get_resumable_create_media_link session in
       let media_source =
         GapiMediaResource.create_file_resource "test_data/test.pdf" in
       let (entry, session) =
         resumable_upload
           upload_link
           media_source
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         TestHelper.assert_not_empty
           "Resource ID should not be empty"
           entry.Document.Entry.resourceId)

let test_partial_download () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.category ^= "pdf"
         |> QueryParameters.max_results ^= 1 in
       let (feed, session) =
         query_documents_list ~parameters session in
         if List.length feed.Document.Feed.entries > 0 then
           let entry = feed |. Document.Feed.entries |. GapiLens.head in
           let download_link = entry
             |. Document.Entry.content
             |. GdataAtom.Content.src in
           let filename = Filename.temp_file "gdata" "part" in
           let media_destination =
             GapiMediaResource.TargetFile filename in
           let ((), _) =
             partial_download
               ~ranges:[(Some 0L, Some 99L)]
               download_link
               media_destination
               session
           in
             assert_bool
               ("File " ^ filename ^ " should exist")
               (Sys.file_exists filename);
             assert_equal
               ~msg:("File " ^ filename ^ " should be 100 byte-long")
               100
               ((Unix.stat filename).Unix.st_size);
             Sys.remove filename)

let test_download_document () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.category ^= "document"
         |> QueryParameters.max_results ^= 1 in
       let (feed, session) =
         query_documents_list ~parameters session in
         if List.length feed.Document.Feed.entries > 0 then
           let entry = feed |. Document.Feed.entries |. GapiLens.head in
           let filename = Filename.temp_file "gdata" "document.odt" in
           let media_destination =
             GapiMediaResource.TargetFile filename in
           let ((), _) =
             download_document
               ~format:"odt"
               entry
               media_destination
               session
           in
             assert_bool
               ("File " ^ filename ^ " should exist")
               (Sys.file_exists filename);
             Sys.remove filename)

let test_query_revisions () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = query_documents_list session in
         try
           let entry = List.find
                         (fun e ->
                            e.Document.Entry.revisionsFeedLink.RevisionsFeedLink.href <> "")
                         feed.Document.Feed.entries in
           let (revisions, session) = query_revisions entry session in
             assert_equal
               "Document Revisions"
               revisions.Revision.Feed.title.GdataAtom.Title.value;
             TestHelper.assert_not_empty
               "ETag should not be empty"
               session.GapiConversation.Session.etag
         with Not_found -> ())

let test_download_revision () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.category ^= "document"
         |> QueryParameters.max_results ^= 1 in
       let (feed, session) =
         query_documents_list ~parameters session in
         try
           let entry = List.find
                         (fun e ->
                            e.Document.Entry.revisionsFeedLink.RevisionsFeedLink.href <> "")
                         feed.Document.Feed.entries in
           let (revisions, session) = query_revisions entry session in
           let revision = revisions |. Revision.Feed.entries |. GapiLens.head in
           let filename = Filename.temp_file "gdata" "revision.odt" in
           let media_destination =
             GapiMediaResource.TargetFile filename in
           let ((), _) =
             download_revision
               ~format:"odt"
               revision
               media_destination
               session
           in
             assert_bool
               ("File " ^ filename ^ " should exist")
               (Sys.file_exists filename);
             (*
             Sys.remove filename
              *)
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

let new_empty_document = Document.Entry.empty
  |> Document.Entry.title
    ^%= GdataAtom.Title.value ^= "Legal Contract"
  |> Document.Entry.categories ^= [Document.document_category]

let test_insert_empty_document () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         create_document
           new_empty_document
           session in
       let id = entry |. Document.Entry.id in
       let resourceId = entry |. Document.Entry.resourceId in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         TestHelper.assert_not_empty
           "Document id should not be empty"
           id;
         TestHelper.assert_not_empty
           "Document resourceId should not be empty"
           resourceId)

let test_update_document () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         create_document
           new_empty_document
           session in
       let resourceId = entry |. Document.Entry.resourceId in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session in
       let updated_entry = entry
         |> Document.Entry.title
           ^%= GdataAtom.Title.value ^= "Updated title" in
       let (entry, session) =
         update_document
           updated_entry
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         assert_equal
           "Updated title"
           (entry |. Document.Entry.title |. GdataAtom.Title.value);
         assert_equal
           resourceId
           (entry |. Document.Entry.resourceId))

let new_empty_document = Document.Entry.empty
  |> Document.Entry.title
    ^%= GdataAtom.Title.value ^= "Text document"
  |> Document.Entry.categories ^= [Document.document_category]

let test_update_content () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let media_source = {
         GapiMediaResource.source = GapiMediaResource.String "text content";
         name = "text_file.txt";
         content_type = "text/plain";
         content_length = 12L;
       } in
       let (upload_link, session) = get_resumable_create_media_link session in
       let (entry, session) =
         resumable_upload
           upload_link
           media_source
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session in
       let updated_entry = entry
         |> Document.Entry.title
           ^%= GdataAtom.Title.value ^= "text_file2.txt" in
       let updated_media_source = {
         GapiMediaResource.source = GapiMediaResource.String "new text";
         name = "text_file2.txt";
         content_type = "text/plain";
         content_length = 8L;
       } in
       let (entry, session) =
         update_document
           ~media_source:updated_media_source
           updated_entry
           session in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         assert_equal
           "text_file2.txt"
           (entry |. Document.Entry.title |. GdataAtom.Title.value))

let test_delete_revision () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let media_source = {
         GapiMediaResource.source = GapiMediaResource.String "text content";
         name = "text_file.txt";
         content_type = "text/plain";
         content_length = 12L;
       } in
       let (upload_link, session) = get_resumable_create_media_link session in
       let (entry, session) =
         resumable_upload
           upload_link
           media_source
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session in
       let updated_media_source = {
         GapiMediaResource.source = GapiMediaResource.String "new text";
         name = "text_file2.txt";
         content_type = "text/plain";
         content_length = 8L;
       } in
       let (entry, session) =
         update_document
           ~new_revision:true
           ~media_source:updated_media_source
           entry
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session in
       let (revisions, session) = query_revisions entry session in
       let revision_count = List.length revisions.Revision.Feed.entries in
       let revision = revisions |. Revision.Feed.entries |. GapiLens.head in
         ignore (delete_revision
                   revision
                   session);
       let () = TestHelper.delay () in
       let (revisions, session) = query_revisions entry session in
       let revision_count' = List.length revisions.Revision.Feed.entries in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         assert_equal
           ~printer:string_of_int
           revision_count
           (revision_count' + 1))

let test_update_revision () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         create_document
           new_empty_document
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session in
       let (revisions, session) = query_revisions entry session in
       let revision = revisions |. Revision.Feed.entries |. GapiLens.head in
       let publish_revision = revision
         |> Revision.Entry.publish ^= true in
       let (revision, session) =
         update_revision
           publish_revision
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         assert_equal
           true
           (revision |. Revision.Entry.publish))

let test_toggle_property () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let starred = {
         GdataAtom.Category.empty with
           GdataAtom.Category.scheme =
             "http://schemas.google.com/g/2005/labels";
           term = "http://schemas.google.com/g/2005/labels#starred";
           label = "starred";
       } in
       let categories =
         starred :: (new_empty_document |. Document.Entry.categories) in
       let new_doc = new_empty_document
         |> Document.Entry.categories ^= categories in
       let (entry, session) =
         create_document
           new_doc
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session in
       let unstarred = {
         GdataAtom.Category.empty with
           GdataAtom.Category.scheme =
             "http://schemas.google.com/g/2005/labels";
           term = "http://schemas.google.com/g/2005/labels#starred";
           label = "";
       } in
       let updated_categories =
         List.fold_left
           (fun cs c ->
              match c with
                  { GdataAtom.Category.scheme =
                      "http://schemas.google.com/g/2005/labels";
                    term = "http://schemas.google.com/g/2005/labels#starred";
                    _ } ->
                    unstarred :: cs
                | _ ->
                    c :: cs)
           []
           (entry |. Document.Entry.categories) in
       let updated_entry = entry
         |> Document.Entry.categories ^= updated_categories in
       let (entry, session) =
         update_document
           updated_entry
           session in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           entry
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         TestHelper.assert_not_exists
           "Categories should not contain starred label"
           (function
                { GdataAtom.Category.scheme =
                    "http://schemas.google.com/g/2005/labels";
                  term = "http://schemas.google.com/g/2005/labels#starred";
                  _ } -> true
              | _ -> false)
           (entry |. Document.Entry.categories))

let suite = "Documents List v3 Service test" >:::
  [(*"test_query_user_metadata" >:: test_query_user_metadata;
   "test_query_metadata_remaining_changes"
     >:: test_query_metadata_remaining_changes;
   "test_query_changes" >:: test_query_changes;
   "test_query_changes_expand_acl" >:: test_query_changes_expand_acl;
   "test_query_documents_list" >:: test_query_documents_list;
   "test_query_text_documents" >:: test_query_text_documents;
   "test_resumable_upload" >:: test_resumable_upload;
   "test_partial_download" >:: test_partial_download;
   "test_download_document" >:: test_download_document;
   "test_query_revisions" >:: test_query_revisions;
   "test_download_revision" >:: test_download_revision;
   "test_get_acl" >:: test_get_acl;
   "test_insert_empty_document" >:: test_insert_empty_document;
   "test_update_document" >:: test_update_document;
   "test_update_content" >:: test_update_content;
   "test_delete_revision" >:: test_delete_revision;
   "test_update_revision" >:: test_update_revision;*)
   "test_toggle_property" >:: test_toggle_property;
  ]

