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
             Sys.remove filename
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

let test_get_document () =
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
         get_document
           resourceId
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         assert_equal
           resourceId
           entry.Document.Entry.resourceId;
         assert_equal
           id
           (entry |. Document.Entry.id))

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
       let (revision, session) =
         refresh_revision
           revision
           session in
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
       let categories =
         Document.starred_category :: (new_empty_document
                                         |. Document.Entry.categories) in
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

let test_copy_document () =
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
       let copy_entry = Document.Entry.empty
         |> Document.Entry.id ^= (entry |. Document.Entry.id)
         |> Document.Entry.title
           ^%= GdataAtom.Title.value ^= "Copy of Legal Document" in
       let (copied, session) =
         create_document
           copy_entry
           session in
       let () = TestHelper.delay () in
       let (copied, session) =
         refresh_document
           copied
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         ignore (delete_document
                   ~delete:true
                   copied
                   session);
         assert_equal
           "Copy of Legal Document"
           (copied |. Document.Entry.title |. GdataAtom.Title.value))

let test_batch_request () =
  let find_entry operation feed =
    List.find
      (fun e ->
         e.Document.Entry.batch.GdataBatch.BatchExtensions.operation =
           operation)
      feed.Document.Feed.entries
  in
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let batch_query_entry = Document.Entry.empty
         |> Document.Entry.id ^=
           "https://docs.google.com/feeds/id/file:1234abcd"
         |> Document.Entry.batch
           ^%= GdataBatch.BatchExtensions.operation ^=
             GdataBatch.Operation.Query in
       let batch_insert_entry = Document.Entry.empty
         |> Document.Entry.batch ^= {
            GdataBatch.BatchExtensions.empty with
                GdataBatch.BatchExtensions.id = "1";
                operation = GdataBatch.Operation.Insert;
          }
         |> Document.Entry.categories ^= [Document.document_category]
         |> Document.Entry.title
           ^%= GdataAtom.Title.value ^= "New Text Document" in
       let batch_update_entry = Document.Entry.empty
         |> Document.Entry.id ^=
           "https://docs.google.com/feeds/id/drawing:5678efgh"
         |> Document.Entry.batch
           ^%= GdataBatch.BatchExtensions.operation ^=
             GdataBatch.Operation.Update
         |> Document.Entry.categories ^= [Document.drawing_category]
         |> Document.Entry.title
           ^%= GdataAtom.Title.value ^= "Updating Drawing" in
       let batch_delete_entry = Document.Entry.empty
         |> Document.Entry.id ^=
           "https://docs.google.com/feeds/id/pdf:9012ijk"
         |> Document.Entry.batch
           ^%= GdataBatch.BatchExtensions.operation ^=
             GdataBatch.Operation.Delete in
       let batch_request = {
         Document.Feed.empty with
             Document.Feed.entries = [
               batch_query_entry;
               batch_insert_entry;
               batch_update_entry;
               batch_delete_entry;
             ];
       } in
       let (batch_response, session) =
         documents_batch_request
           batch_request
           session in
       let e1 = find_entry GdataBatch.Operation.Query batch_response in
       let e2 = find_entry GdataBatch.Operation.Insert batch_response in
       let e3 = find_entry GdataBatch.Operation.Update batch_response in
       let e4 = find_entry GdataBatch.Operation.Delete batch_response in
       let batch_status = Document.Entry.batch
         |-- GdataBatch.BatchExtensions.status
         |-- GdataBatch.Status.code in
       let () = TestHelper.delay () in
       let (entry, session) =
         refresh_document
           e2
           session
       in
         ignore (delete_document
                   ~delete:true
                   entry
                   session);
         assert_equal ~msg:"Query"
           400
           (e1 |. batch_status);
         assert_equal ~msg:"Insert"
           201
           (e2 |. batch_status);
         assert_equal ~msg:"Update"
           400
           (e3 |. batch_status);
         assert_equal ~msg:"Delete"
           400
           (e4 |. batch_status))

let test_query_folder_contents () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.category ^= "folder" in
       let (feed, session) =
         query_folder_contents
           ~parameters
           root_folder_id
           session
       in
         assert_equal
           "https://docs.google.com/feeds/default/private/full/folder%3Aroot/contents"
           (feed |. Document.Feed.id);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let acl_entry = GdataACL.Entry.empty
  |> GdataACL.Entry.categories ^= [
     { GdataAtom.Category.empty with
           GdataAtom.Category.scheme = "http://schemas.google.com/g/2005#kind";
           term = "http://schemas.google.com/acl/2007#accessRule" } ]
  |> GdataACL.Entry.scope ^=
     { GdataACL.Scope.empty with
           GdataACL.Scope._type = "user";
           value = "test@example.com" }
  |> GdataACL.Entry.role ^= "reader"

let test_get_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 1 in
       let (docs, session) =
         query_documents_list
           ~parameters
           session in
       let entry = List.hd docs.Document.Feed.entries in
       let (feed, session) =
         get_acl
           entry
           session
       in
         TestHelper.assert_not_empty
           "Feed ID should not be empty"
           feed.GdataACL.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_create_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 1 in
       let (docs, session) =
         query_documents_list
           ~parameters
           session in
       let entry = List.hd docs.Document.Feed.entries in
       let (new_entry, session) =
         create_acl
           ~send_notification_emails:false
           acl_entry
           entry
           session in
       let id = new_entry |. GdataACL.Entry.id in
       let (feed, session) =
         get_acl
           entry
           session
       in
         ignore (delete_acl
                   new_entry
                   session);
         assert_bool
           "Created entry id not found in acl feed"
           (List.exists
              (fun e -> e |. GdataACL.Entry.id = id)
              feed.GdataACL.Feed.entries)) 

let test_update_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.max_results ^= 1 in
       let (docs, session) =
         query_documents_list
           ~parameters
           session in
       let entry = List.hd docs.Document.Feed.entries in
       let (new_entry, session) =
         create_acl
           ~send_notification_emails:false
           acl_entry
           entry
           session in
       let updated_entry = new_entry
         |> GdataACL.Entry.role ^= "writer" in
       let (server_updated_entry, session) =
         update_acl
           updated_entry
           session in
       let (_, session) =
         refresh_acl
           server_updated_entry
           session
       in
         ignore (delete_acl
                   server_updated_entry
                   session);
         assert_equal
           updated_entry.GdataACL.Entry.role
           server_updated_entry.GdataACL.Entry.role)

let test_create_archive () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = QueryParameters.default
         |> QueryParameters.category ^= "document" in
       let entry = Archive.Entry.empty
         |> Archive.Entry.archiveConversions ^= [{
            Archive.Conversion.source = "application/vnd.google-apps.document";
            Archive.Conversion.target = "application/msword";
          }] in
       let (archive, session) =
         create_archive
           ~parameters
           entry
           session in
       let () = TestHelper.delay () in
       let (archive, session) =
         refresh_archive
           archive
           session in
       let content = archive |. Archive.Entry.content in
       let filename = Filename.temp_file "gdata" "archive.zip" in
       let media_destination =
         GapiMediaResource.TargetFile filename in
       let ((), _) =
         download_content
           content
           media_destination
           session
       in
         TestHelper.assert_not_empty
           "Archive ID should not be empty"
           (archive |. Archive.Entry.id);
         assert_bool
           ("File " ^ filename ^ " should exist")
           (Sys.file_exists filename))

let suite = "Documents List v3 Service test" >:::
  ["test_query_user_metadata" >:: test_query_user_metadata;
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
   "test_get_document" >:: test_get_document;
   "test_update_document" >:: test_update_document;
   "test_update_content" >:: test_update_content;
   "test_delete_revision" >:: test_delete_revision;
   "test_update_revision" >:: test_update_revision;
   "test_toggle_property" >:: test_toggle_property;
   "test_copy_document" >:: test_copy_document;
   "test_batch_request" >:: test_batch_request;
   "test_query_folder_contents" >:: test_query_folder_contents;
   "test_get_acl" >:: test_get_acl;
   "test_create_acl" >:: test_create_acl;
   "test_update_acl" >:: test_update_acl;
   "test_create_archive" >:: test_create_archive]

