open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiTasksV1Model

(* We should add a delay to let Google persist the new entry, after a write
 * operation, otherwise DELETE will return a 503 HTTP error (Service
 * Unavailable) *)
let delay () =
  Unix.sleep 5

(* Task lists *)

let new_task_list = {
  TaskList.empty with
      TaskList.title = "New test task list"
}

let test_list_task_lists () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (tasklists, session) =
         GapiTasksService.TasklistsResource.list
           session
       in
         assert_equal
           "tasks#taskLists"
           tasklists.TaskLists.kind;
         assert_bool
           "There should be at least 1 task list"
           (List.length tasklists.TaskLists.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_insert_task_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiTasksService.TasklistsResource.insert
           new_task_list
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasklistsResource.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "Task list id should not be empty"
           new_entry.TaskList.id)

let test_get_task_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasklistsResource.insert
           new_task_list
           session in
       let (entry', session) =
         GapiTasksService.TasklistsResource.get
           ~tasklist:entry.TaskList.id
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasklistsResource.delete
                   entry'
                   session);
         assert_equal
           entry.TaskList.id
           entry'.TaskList.id)

let test_update_task_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasklistsResource.insert
           new_task_list
           session in
       let entry = { entry with
                         TaskList.title = "updated task list" } in
       let (entry, session) =
         GapiTasksService.TasklistsResource.update
           entry
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasklistsResource.delete
                   entry
                   session);
         assert_equal
           "updated task list"
           entry.TaskList.title)

let test_delete_task_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasklistsResource.insert
           new_task_list
           session in
       let (task_list, session) =
         GapiTasksService.TasklistsResource.list
           session in
       let _ = delay () in
       let ((), session) =
         GapiTasksService.TasklistsResource.delete
           entry
           session in
       let (task_list', _) =
         GapiTasksService.TasklistsResource.list
           session
       in
         TestHelper.assert_exists
           "task_list should contain new task_list"
           (fun e ->
              e.TaskList.id = entry.TaskList.id)
           task_list.TaskLists.items;
         TestHelper.assert_not_exists
           "task_list' should not contain new task_list"
           (fun e ->
              e.TaskList.id = entry.TaskList.id)
           task_list'.TaskLists.items)

(* Tasks *)

let new_task = {
  Task.empty with
      Task.title = "New test task";
      notes = "Please complete me";
      due = GapiDate.of_string "2011-12-15T12:00:00.000Z"
}

let test_insert_task () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasksResource.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "Task id should not be empty"
           new_entry.Task.id)

let test_list_tasks () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let _ = delay () in
       let (tasks, session) =
         GapiTasksService.TasksResource.list
           session
       in
         ignore (GapiTasksService.TasksResource.delete
                   new_entry
                   session);
         assert_equal
           "tasks#tasks"
           tasks.Tasks.kind;
         assert_bool
           "There should be at least 1 task"
           (List.length tasks.Tasks.items >= 1))

let test_get_task () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let (entry', session) =
         GapiTasksService.TasksResource.get
           ~task:entry.Task.id
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasksResource.delete
                   entry'
                   session);
         assert_equal
           entry.Task.id
           entry'.Task.id)

let test_update_task () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let entry = { entry with
                         Task.title = "updated task" } in
       let (entry, session) =
         GapiTasksService.TasksResource.update
           entry
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasksResource.delete
                   entry
                   session);
         assert_equal
           "updated task"
           entry.Task.title)

let test_delete_task () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let (task, session) =
         GapiTasksService.TasksResource.list
           session in
       let _ = delay () in
       let ((), session) =
         GapiTasksService.TasksResource.delete
           entry
           session in
       let (task', _) =
         GapiTasksService.TasksResource.list
           session
       in
         TestHelper.assert_exists
           "task should contain new task"
           (fun e ->
              e.Task.id = entry.Task.id)
           task.Tasks.items;
         TestHelper.assert_not_exists
           "task' should not contain new task"
           (fun e ->
              e.Task.id = entry.Task.id)
           task'.Tasks.items)

let test_clear_default_task_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       ignore (GapiTasksService.TasksResource.clear
                 session))

let test_move_task () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry_2, session) =
         GapiTasksService.TasksResource.insert
           { new_task with
                 Task.title = "New test task 2" }
           session in
       let (new_entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let _ = delay () in
       let (new_entry', session) =
         GapiTasksService.TasksResource.move
           ~parent:new_entry_2.Task.id
           ~task:new_entry.Task.id
           session in
         ignore (GapiTasksService.TasksResource.delete
                   new_entry'
                   session);
         ignore (GapiTasksService.TasksResource.delete
                   new_entry_2
                   session);
         assert_bool
           "new_entry' parent should differ from new_entry parent"
           (new_entry.Task.parent
              <> new_entry'.Task.parent))

let suite = "Tasks services test" >:::
  ["test_list_task_lists" >:: test_list_task_lists;
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
   "test_move_task" >:: test_move_task]

