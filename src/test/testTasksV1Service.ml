open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiTasksV1Model
open GapiTasksV1Service

(* Task lists *)

let new_task_list =
  { TaskList.empty with TaskList.title = "New test task list" }

let test_list_task_lists () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let tasklists, session = TasklistsResource.list session in
      assert_equal "tasks#taskLists" tasklists.TaskLists.kind;
      assert_bool "There should be at least 1 task list"
        (List.length tasklists.TaskLists.items >= 1);
      TestHelper.assert_not_empty "ETag should not be empty"
        session.GapiConversation.Session.etag)

let test_insert_task_list () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let new_entry, session = TasklistsResource.insert new_task_list session in
      let _ = TestHelper.delay () in
      ignore (TasklistsResource.delete ~tasklist:new_entry.TaskList.id session);
      TestHelper.assert_not_empty "Task list id should not be empty"
        new_entry.TaskList.id)

let test_get_task_list () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let entry, session = TasklistsResource.insert new_task_list session in
      let entry', session =
        TasklistsResource.get ~tasklist:entry.TaskList.id session
      in
      let _ = TestHelper.delay () in
      ignore (TasklistsResource.delete ~tasklist:entry'.TaskList.id session);
      assert_equal entry.TaskList.id entry'.TaskList.id)

let test_update_task_list () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let entry, session = TasklistsResource.insert new_task_list session in
      let entry = { entry with TaskList.title = "updated task list" } in
      let entry, session =
        TasklistsResource.update ~tasklist:entry.TaskList.id entry session
      in
      let _ = TestHelper.delay () in
      ignore (TasklistsResource.delete ~tasklist:entry.TaskList.id session);
      assert_equal "updated task list" entry.TaskList.title)

let test_delete_task_list () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let entry, session = TasklistsResource.insert new_task_list session in
      let task_list, session = TasklistsResource.list session in
      let _ = TestHelper.delay () in
      let (), session =
        TasklistsResource.delete ~tasklist:entry.TaskList.id session
      in
      let task_list', _ = TasklistsResource.list session in
      TestHelper.assert_exists "task_list should contain new task_list"
        (fun e -> e.TaskList.id = entry.TaskList.id)
        task_list.TaskLists.items;
      TestHelper.assert_not_exists "task_list' should not contain new task_list"
        (fun e -> e.TaskList.id = entry.TaskList.id)
        task_list'.TaskLists.items)

(* Tasks *)

let new_task =
  {
    Task.empty with
    Task.title = "New test task";
    notes = "Please complete me";
    due = GapiDate.of_string "2011-12-15T12:00:00.000Z";
  }

let test_insert_task () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let new_entry, session =
        TasksResource.insert ~tasklist:"@default" new_task session
      in
      let _ = TestHelper.delay () in
      ignore
        (TasksResource.delete ~tasklist:"@default" ~task:new_entry.Task.id
           session);
      TestHelper.assert_not_empty "Task id should not be empty"
        new_entry.Task.id)

let test_list_tasks () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let new_entry, session =
        TasksResource.insert ~tasklist:"@default" new_task session
      in
      let _ = TestHelper.delay () in
      let tasks, session = TasksResource.list ~tasklist:"@default" session in
      ignore
        (TasksResource.delete ~tasklist:"@default" ~task:new_entry.Task.id
           session);
      assert_equal "tasks#tasks" tasks.Tasks.kind;
      assert_bool "There should be at least 1 task"
        (List.length tasks.Tasks.items >= 1))

let test_get_task () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let entry, session =
        TasksResource.insert ~tasklist:"@default" new_task session
      in
      let entry', session =
        TasksResource.get ~tasklist:"@default" ~task:entry.Task.id session
      in
      let _ = TestHelper.delay () in
      ignore
        (TasksResource.delete ~tasklist:"@default" ~task:entry'.Task.id session);
      assert_equal entry.Task.id entry'.Task.id)

let test_update_task () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let entry, session =
        TasksResource.insert ~tasklist:"@default" new_task session
      in
      let entry = { entry with Task.title = "updated task" } in
      let entry, session =
        TasksResource.update ~tasklist:"@default" ~task:entry.Task.id entry
          session
      in
      let _ = TestHelper.delay () in
      ignore
        (TasksResource.delete ~tasklist:"@default" ~task:entry.Task.id session);
      assert_equal "updated task" entry.Task.title)

let test_delete_task () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let entry, session =
        TasksResource.insert ~tasklist:"@default" new_task session
      in
      let task, session = TasksResource.list ~tasklist:"@default" session in
      let _ = TestHelper.delay () in
      let (), session =
        TasksResource.delete ~tasklist:"@default" ~task:entry.Task.id session
      in
      let task', _ = TasksResource.list ~tasklist:"@default" session in
      TestHelper.assert_exists "task should contain new task"
        (fun e -> e.Task.id = entry.Task.id)
        task.Tasks.items;
      TestHelper.assert_not_exists "task' should not contain new task"
        (fun e -> e.Task.id = entry.Task.id)
        task'.Tasks.items)

let test_clear_default_task_list () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      ignore (TasksResource.clear ~tasklist:"@default" session))

let test_move_task () =
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let new_entry_2, session =
        TasksResource.insert ~tasklist:"@default"
          { new_task with Task.title = "New test task 2" }
          session
      in
      let new_entry, session =
        TasksResource.insert ~tasklist:"@default" new_task session
      in
      let _ = TestHelper.delay () in
      let new_entry', session =
        TasksResource.move ~parent:new_entry_2.Task.id ~tasklist:"@default"
          ~task:new_entry.Task.id session
      in
      ignore
        (TasksResource.delete ~tasklist:"@default" ~task:new_entry'.Task.id
           session);
      ignore
        (TasksResource.delete ~tasklist:"@default" ~task:new_entry_2.Task.id
           session);
      assert_bool "new_entry' parent should differ from new_entry parent"
        (new_entry.Task.parent <> new_entry'.Task.parent))

let suite =
  "Tasks services test"
  >::: [
         "test_list_task_lists" >:: test_list_task_lists;
         "test_insert_task_list" >:: test_insert_task_list;
         "test_get_task_list" >:: test_get_task_list;
         "test_update_task_list" >:: test_update_task_list;
         "test_delete_task_list" >:: test_delete_task_list;
         "test_insert_task" >:: test_insert_task;
         "test_list_tasks" >:: test_list_tasks;
         "test_get_task" >:: test_get_task;
         "test_update_task" >:: test_update_task;
         "test_delete_task" >:: test_delete_task;
         "test_clear_default_task_list" >:: test_clear_default_task_list;
         "test_move_task" >:: test_move_task;
       ]
