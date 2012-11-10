open OUnit
open GapiDriveV2Model

let test_parse_file () =
  let file_json =
    Yojson.Safe.from_file "test_data/test_drive_file.json" in
  let tree = GapiJson.json_to_data_model file_json in
  let file = File.of_data_model tree in
  let tree' = File.to_data_model file in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      file_json
      json

let test_parse_file_list () =
  let file_list_json =
    Yojson.Safe.from_file "test_data/test_drive_file_list.json" in
  let tree = GapiJson.json_to_data_model file_list_json in
  let file_list = FileList.of_data_model tree in
  let tree' = FileList.to_data_model file_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      file_list_json
      json

let test_parse_about () =
  let about_json =
    Yojson.Safe.from_file "test_data/test_drive_about.json" in
  let tree = GapiJson.json_to_data_model about_json in
  let about = About.of_data_model tree in
  let tree' = About.to_data_model about in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      about_json
      json

let test_parse_change () =
  let change_json =
    Yojson.Safe.from_file "test_data/test_drive_change.json" in
  let tree = GapiJson.json_to_data_model change_json in
  let change = Change.of_data_model tree in
  let tree' = Change.to_data_model change in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      change_json
      json

let test_parse_change_list () =
  let change_list_json =
    Yojson.Safe.from_file "test_data/test_drive_change_list.json" in
  let tree = GapiJson.json_to_data_model change_list_json in
  let change_list = ChangeList.of_data_model tree in
  let tree' = ChangeList.to_data_model change_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      change_list_json
      json

let test_parse_child_reference () =
  let child_reference_json =
    Yojson.Safe.from_file "test_data/test_drive_child_reference.json" in
  let tree = GapiJson.json_to_data_model child_reference_json in
  let child_reference = ChildReference.of_data_model tree in
  let tree' = ChildReference.to_data_model child_reference in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      child_reference_json
      json

let test_parse_child_list () =
  let child_list_json =
    Yojson.Safe.from_file "test_data/test_drive_child_list.json" in
  let tree = GapiJson.json_to_data_model child_list_json in
  let child_list = ChildList.of_data_model tree in
  let tree' = ChildList.to_data_model child_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      child_list_json
      json

let test_parse_parent_reference () =
  let parent_reference_json =
    Yojson.Safe.from_file "test_data/test_drive_parent_reference.json" in
  let tree = GapiJson.json_to_data_model parent_reference_json in
  let parent_reference = ParentReference.of_data_model tree in
  let tree' = ParentReference.to_data_model parent_reference in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      parent_reference_json
      json

let test_parse_parent_list () =
  let parent_list_json =
    Yojson.Safe.from_file "test_data/test_drive_parent_list.json" in
  let tree = GapiJson.json_to_data_model parent_list_json in
  let parent_list = ParentList.of_data_model tree in
  let tree' = ParentList.to_data_model parent_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      parent_list_json
      json

let test_parse_permission () =
  let permission_json =
    Yojson.Safe.from_file "test_data/test_drive_permission.json" in
  let tree = GapiJson.json_to_data_model permission_json in
  let permission = Permission.of_data_model tree in
  let tree' = Permission.to_data_model permission in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      permission_json
      json

let test_parse_permission_list () =
  let permission_list_json =
    Yojson.Safe.from_file "test_data/test_drive_permission_list.json" in
  let tree = GapiJson.json_to_data_model permission_list_json in
  let permission_list = PermissionList.of_data_model tree in
  let tree' = PermissionList.to_data_model permission_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      permission_list_json
      json

let test_parse_revision () =
  let revision_json =
    Yojson.Safe.from_file "test_data/test_drive_revision.json" in
  let tree = GapiJson.json_to_data_model revision_json in
  let revision = Revision.of_data_model tree in
  let tree' = Revision.to_data_model revision in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      revision_json
      json

let test_parse_revision_list () =
  let revision_list_json =
    Yojson.Safe.from_file "test_data/test_drive_revision_list.json" in
  let tree = GapiJson.json_to_data_model revision_list_json in
  let revision_list = RevisionList.of_data_model tree in
  let tree' = RevisionList.to_data_model revision_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      revision_list_json
      json

let test_parse_app_list () =
  let app_list_json =
    Yojson.Safe.from_file "test_data/test_drive_app_list.json" in
  let tree = GapiJson.json_to_data_model app_list_json in
  let app_list = AppList.of_data_model tree in
  let tree' = AppList.to_data_model app_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      app_list_json
      json

let suite = "Drive Data Model test" >:::
  ["test_parse_file" >:: test_parse_file;
   "test_parse_file_list" >:: test_parse_file_list;
   "test_parse_about" >:: test_parse_about;
   "test_parse_change" >:: test_parse_change;
   "test_parse_change_list" >:: test_parse_change_list;
   "test_parse_child_reference" >:: test_parse_child_reference;
   "test_parse_child_list" >:: test_parse_child_list;
   "test_parse_parent_reference" >:: test_parse_parent_reference;
   "test_parse_parent_list" >:: test_parse_parent_list;
   "test_parse_permission" >:: test_parse_permission;
   "test_parse_permission_list" >:: test_parse_permission_list;
   "test_parse_revision" >:: test_parse_revision;
   "test_parse_revision_list" >:: test_parse_revision_list;
   "test_parse_app_list" >:: test_parse_app_list]

