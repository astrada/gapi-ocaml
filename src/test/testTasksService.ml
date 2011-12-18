open OUnit
open GapiUtils.Infix
open GapiLens.Infix

(* We should add a delay to let Google persist the new entry, after a write
 * operation, otherwise DELETE will return a 503 HTTP error (Service
 * Unavailable) *)
let delay () =
  Unix.sleep 5

(* Task lists *)

let new_task_list = {
  GapiTasks.TaskList.empty with
      GapiTasks.TaskList.title = "New test task list"
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
           tasklists.GapiTasks.TaskLists.kind;
         assert_bool
           "There should be at least 1 task list"
           (List.length tasklists.GapiTasks.TaskLists.items >= 1);
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
           new_entry.GapiTasks.TaskList.id)

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
           ~tasklist:entry.GapiTasks.TaskList.id
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasklistsResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiTasks.TaskList.id
           entry'.GapiTasks.TaskList.id)

let test_update_task_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasklistsResource.insert
           new_task_list
           session in
       let entry = { entry with
                         GapiTasks.TaskList.title = "updated task list" } in
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
           entry.GapiTasks.TaskList.title)

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
              e.GapiTasks.TaskList.id = entry.GapiTasks.TaskList.id)
           task_list.GapiTasks.TaskLists.items;
         TestHelper.assert_not_exists
           "task_list' should not contain new task_list"
           (fun e ->
              e.GapiTasks.TaskList.id = entry.GapiTasks.TaskList.id)
           task_list'.GapiTasks.TaskLists.items)

(* Tasks *)

let new_task = {
  GapiTasks.Task.empty with
      GapiTasks.Task.title = "New test task";
      GapiTasks.Task.notes = "Please complete me";
      GapiTasks.Task.due = GapiDate.of_string "2011-12-15T12:00:00.000Z"
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
           new_entry.GapiTasks.Task.id)

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
           tasks.GapiTasks.Tasks.kind;
         assert_bool
           "There should be at least 1 task"
           (List.length tasks.GapiTasks.Tasks.items >= 1))

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
           ~task:entry.GapiTasks.Task.id
           session in
       let _ = delay () in
         ignore (GapiTasksService.TasksResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiTasks.Task.id
           entry'.GapiTasks.Task.id)

let test_update_task () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let entry = { entry with
                         GapiTasks.Task.title = "updated task" } in
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
           entry.GapiTasks.Task.title)

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
              e.GapiTasks.Task.id = entry.GapiTasks.Task.id)
           task.GapiTasks.Tasks.items;
         TestHelper.assert_not_exists
           "task' should not contain new task"
           (fun e ->
              e.GapiTasks.Task.id = entry.GapiTasks.Task.id)
           task'.GapiTasks.Tasks.items)

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
                 GapiTasks.Task.title = "New test task 2" }
           session in
       let (new_entry, session) =
         GapiTasksService.TasksResource.insert
           new_task
           session in
       let _ = delay () in
       let (new_entry', session) =
         GapiTasksService.TasksResource.move
           ~parent:new_entry_2.GapiTasks.Task.id
           ~task:new_entry.GapiTasks.Task.id
           session in
         ignore (GapiTasksService.TasksResource.delete
                   new_entry'
                   session);
         ignore (GapiTasksService.TasksResource.delete
                   new_entry_2
                   session);
         assert_bool
           "new_entry' parent should differ from new_entry parent"
           (new_entry.GapiTasks.Task.parent
              <> new_entry'.GapiTasks.Task.parent))

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

