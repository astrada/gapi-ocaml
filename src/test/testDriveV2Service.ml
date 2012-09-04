open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiDriveV2Model
open GapiDriveV2Service

let test_get_about () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (about, session) =
         AboutResource.get session
       in
         assert_equal
           "drive#about"
           about.About.kind;
         assert_equal
           about.About.etag
           session.GapiConversation.Session.etag)

let test_get_remaining_changes () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (about, session) =
         AboutResource.get session
           ~startChangeId:1L
           ~maxChangeIdCount:10L
       in
         assert_bool
           "remainingChangeIds should be greater than 0"
           (about.About.remainingChangeIds > 0L);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_list_changes () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (changes, session) =
         ChangesResource.list
           ~maxResults:5
           session
       in
         assert_bool
           "There should be at most 5 entries"
           (List.length changes.ChangeList.items <= 5);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_list_files () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:5
           session
       in
         assert_equal
           "drive#fileList"
           files.FileList.kind;
         assert_bool
           "There should be at most 5 files"
           (List.length files.FileList.items <= 5))

let test_list_text_documents () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~q:"mimeType = 'application/vnd.oasis.opendocument.text'"
           ~maxResults:5
           session
       in
         assert_bool
           "All the entries should be of type document"
           (List.for_all
              (fun file ->
                 file.File.mimeType = "application/vnd.oasis.opendocument.text")
              files.FileList.items))

let test_list_revisions () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:1
           ~q:"mimeType = 'application/vnd.google-apps.document'"
           session in
         if List.length files.FileList.items > 0 then begin
           let file = List.hd files.FileList.items in
           let (revisions, session) =
             RevisionsResource.list
               file.File.id
               session in
             assert_equal
               "drive#revisionList"
               revisions.RevisionList.kind;
             TestHelper.assert_not_empty
               "ETag should not be empty"
               session.GapiConversation.Session.etag
         end)

let test_download_revision () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:1
           ~q:"mimeType = 'application/vnd.google-apps.document'"
           session in
         if List.length files.FileList.items > 0 then begin
           let file = List.hd files.FileList.items in
           let (revisions, session) =
             RevisionsResource.list
               file.File.id
               session in
           if List.length revisions.RevisionList.items > 0 then begin
             let revision = List.hd revisions.RevisionList.items in
             let filename = Filename.temp_file "gdata" "revision.odt" in
             let media_destination =
               GapiMediaResource.TargetFile filename in
             try
               let export_link =
                 List.find
                   (fun (mime, _) ->
                      mime = "application/vnd.oasis.opendocument.text")
                   revision.Revision.exportLinks
                 |> snd in
               let ((), _) =
                 GapiService.download_resource
                   export_link
                   media_destination
                   session
               in
                 assert_bool
                   ("File " ^ filename ^ " should exist")
                   (Sys.file_exists filename);
                 Sys.remove filename
             with Not_found -> ()
           end
         end)

let test_list_permissions () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:1
           ~q:"mimeType = 'application/vnd.google-apps.document'"
           session in
         if List.length files.FileList.items > 0 then begin
           let file = List.hd files.FileList.items in
           let (permissions, session) =
             PermissionsResource.list
               file.File.id
               session in
             assert_equal
               "drive#permissionList"
               permissions.PermissionList.kind;
         end)

let new_empty_document =
  { File.empty with
        File.title = "Legal Contract";
        mimeType = "application/vnd.google-apps.document";
  }

let test_insert_empty_document () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (file, session) =
         FilesResource.insert
           new_empty_document
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         TestHelper.assert_not_empty
           "Document id should not be empty"
           fileId)

let test_insert_pdf () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let media_source =
         GapiMediaResource.create_file_resource "test_data/test.pdf" in
       let (file, session) =
         FilesResource.insert
           ~media_source
           { File.empty with File.title = "test.pdf" }
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         TestHelper.assert_not_empty
           "Document id should not be empty"
           fileId)

let test_update_document () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (file, session) =
         FilesResource.insert
           new_empty_document
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session in
       let updated_file = file
         |> File.title ^= "Updated title" in
       let (file, session) =
         FilesResource.update
           ~fileId
           updated_file
           session in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         assert_equal
           "Updated title"
           file.File.title;
         assert_equal
           fileId
           file.File.id)

let new_empty_text_file =
  { File.empty with
        File.title = "Text document";
        mimeType = "text/plain";
  }

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
       let (file, session) =
         FilesResource.insert
           ~media_source
           { File.empty with File.title = "text_file.txt" }
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session in
       let updated_file = file
         |> File.title ^= "text_file2.txt" in
       let updated_media_source = {
         GapiMediaResource.source = GapiMediaResource.String "new text";
         name = "text_file2.txt";
         content_type = "text/plain";
         content_length = 8L;
       } in
       let (file, session) =
         FilesResource.update
           ~media_source:updated_media_source
           ~fileId
           updated_file
           session in
       let (file, session) =
         FilesResource.get
           ~fileId
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         assert_equal
           "text_file2.txt"
           file.File.title)

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
       let (file, session) =
         FilesResource.insert
           ~media_source
           { File.empty with File.title = "text_file.txt" }
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session in
       let updated_media_source = {
         GapiMediaResource.source = GapiMediaResource.String "new text";
         name = "text_file2.txt";
         content_type = "text/plain";
         content_length = 8L;
       } in
       let (file, session) =
         FilesResource.update
           ~newRevision:true
           ~media_source:updated_media_source
           ~fileId
           file
           session in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session in
       let (revisions, session) =
         RevisionsResource.list
           ~fileId
           session in
       let revision_count = List.length revisions.RevisionList.items in
       let revision = List.hd revisions.RevisionList.items in
       let revisionId = revision.Revision.id in
       let (revision, session) =
         RevisionsResource.get
           ~fileId
           ~revisionId
           session in
         ignore (RevisionsResource.delete
                   ~fileId
                   ~revisionId
                   session);
       let () = TestHelper.delay () in
       let (revisions, session) =
         RevisionsResource.list
           ~fileId
           session in
       let revision_count' = List.length revisions.RevisionList.items in
       let (file, session) =
         FilesResource.get
           ~fileId
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         assert_equal
           ~printer:string_of_int
           revision_count
           (revision_count' + 1))

let test_update_revision () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (file, session) =
         FilesResource.insert
           new_empty_text_file
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session in
       let (revisions, session) =
         RevisionsResource.list
           ~fileId
           session in
       let revision = List.hd revisions.RevisionList.items in
       let revisionId = revision.Revision.id in
       let pinned_revision = revision
         |> Revision.pinned ^= true in
       let (revision, session) =
         RevisionsResource.update
           ~fileId
           ~revisionId
           pinned_revision
           session in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         assert_equal
           true
           (revision |. Revision.pinned))

let test_copy_document () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (file, session) =
         FilesResource.insert
           new_empty_document
           session in
       let fileId = file.File.id in
       let () = TestHelper.delay () in
       let (file, session) =
         FilesResource.get
           ~fileId
           session in
       let copy_file = File.empty
         |> File.title ^= "Copy of Legal Document" in
       let (copied, session) =
         FilesResource.copy
           ~fileId
           copy_file
           session in
       let copy_id = copied.File.id in
       let () = TestHelper.delay () in
       let (copied, session) =
         FilesResource.get
           ~fileId:copy_id
           session
       in
         ignore (FilesResource.delete
                   ~fileId
                   session);
         ignore (FilesResource.delete
                   ~fileId:copy_id
                   session);
         assert_equal
           "Copy of Legal Document"
           copied.File.title)

let test_list_children () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (about, session) =
         AboutResource.get
           session in
       let root_folder_id = about.About.rootFolderId in
       let (children, session) =
         ChildrenResource.list
           ~maxResults:1
           ~folderId:root_folder_id
           session
       in
         assert_equal
           "drive#childList"
           children.ChildList.kind;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_get_permission () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:1
           session in
       if List.length files.FileList.items > 0 then begin
         let fileId = files.FileList.items |. GapiLens.head |. File.id in
         let (permissions, session) =
           PermissionsResource.list
             ~fileId
             session
         in
           assert_equal
             "drive#permissionList"
             permissions.PermissionList.kind;
       end)

let test_insert_permission () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:1
           session in
       if List.length files.FileList.items > 0 then begin
         let fileId = files.FileList.items |. GapiLens.head |. File.id in
         let new_permission =
           { Permission.empty with
                 Permission.role = "reader";
                 _type = "user";
                 value = "test@example.com"
           } in
         let (permission, session) =
           PermissionsResource.insert
             ~fileId
             new_permission
             session in
         let permissionId = permission.Permission.id in
         let (permissions, session) =
           PermissionsResource.list
             ~fileId
             session
         in
           ignore (PermissionsResource.delete
                     ~fileId
                     ~permissionId
                     session);
           assert_bool
             "Created permission id not found in permission list"
             (List.exists
                (fun p -> p.Permission.id = permissionId)
                permissions.PermissionList.items);
       end)

let test_update_permission () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           ~maxResults:1
           session in
       if List.length files.FileList.items > 0 then begin
         let fileId = files.FileList.items |. GapiLens.head |. File.id in
         let new_permission =
           { Permission.empty with
                 Permission.role = "reader";
                 _type = "user";
                 value = "test@example.com"
           } in
         let (permission, session) =
           PermissionsResource.insert
             ~fileId
             new_permission
             session in
         let permissionId = permission.Permission.id in
         let updated_permission = permission
           |> Permission.role ^= "writer" in
         let (server_updated_permission, session) =
           PermissionsResource.update
             ~fileId
             ~permissionId
             updated_permission
             session
         in
           ignore (PermissionsResource.delete
                     ~fileId
                     ~permissionId
                     session);
           assert_equal
             updated_permission.Permission.role
             server_updated_permission.Permission.role
       end)

let suite = "Drive service test" >:::
  ["test_get_about" >:: test_get_about;
   "test_get_remaining_changes" >:: test_get_remaining_changes;
   "test_list_changes" >:: test_list_changes;
   "test_list_files" >:: test_list_files;
   "test_list_text_documents" >:: test_list_text_documents;
   "test_list_revisions" >:: test_list_revisions;
   "test_download_revision" >:: test_download_revision;
   "test_list_permissions" >:: test_list_permissions;
   "test_insert_empty_document" >:: test_insert_empty_document;
   "test_insert_pdf" >:: test_insert_pdf;
   "test_update_document" >:: test_update_document;
   "test_update_content" >:: test_update_content;
   "test_delete_revision" >:: test_delete_revision;
   "test_update_revision" >:: test_update_revision;
   "test_copy_document" >:: test_copy_document;
   "test_list_children" >:: test_list_children;
   "test_get_permission" >:: test_get_permission;
   "test_insert_permission" >:: test_insert_permission;
   "test_update_permission" >:: test_update_permission]

