open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiDriveV2Model
open GapiDriveV2Service

let test_list_files () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (files, session) =
         FilesResource.list
           session
       in
         assert_equal
           "drive#fileList"
           files.FileList.kind;
         assert_bool
           "There should be at least 1 file"
           (List.length files.FileList.items > 0))

let suite = "Drive service test" >:::
  ["test_list_files" >:: test_list_files;
   ]

