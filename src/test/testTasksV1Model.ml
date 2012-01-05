open OUnit
open GapiLens.Infix
open GapiUtils.Infix
open GapiTasksV1Model

let test_parse_task () =
  let task_json =
    Json_io.load_json "test/data/test_task.json" in
  let tree = GapiJson.json_to_data_model task_json in
  let task = Task.of_data_model tree in
  let tree' = Task.to_data_model task in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      task_json
      json

let test_parse_task_list () =
  let task_list_json =
    Json_io.load_json "test/data/test_task_list.json" in
  let tree = GapiJson.json_to_data_model task_list_json in
  let task_list = TaskList.of_data_model tree in
  let tree' = TaskList.to_data_model task_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      task_list_json
      json

let test_parse_tasks () =
  let tasks_json =
    Json_io.load_json "test/data/test_tasks.json" in
  let tree = GapiJson.json_to_data_model tasks_json in
  let tasks = Tasks.of_data_model tree in
  let tree' = Tasks.to_data_model tasks in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      tasks_json
      json

let test_parse_task_lists () =
  let task_lists_json =
    Json_io.load_json "test/data/test_task_lists.json" in
  let tree = GapiJson.json_to_data_model task_lists_json in
  let task_lists = TaskLists.of_data_model tree in
  let tree' = TaskLists.to_data_model task_lists in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      task_lists_json
      json

let suite = "Tasks Model test" >:::
  ["test_parse_task" >:: test_parse_task;
   "test_parse_task_list" >:: test_parse_task_list;
   "test_parse_tasks" >:: test_parse_tasks;
   "test_parse_task_lists" >:: test_parse_task_lists]

