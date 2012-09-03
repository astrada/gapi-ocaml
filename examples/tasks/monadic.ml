(* Tasks service samples (http://code.google.com/apis/tasks/v1/using.html)
 * using state monad and functional lenses *)

(*** Setup ***)

open GapiUtils.Infix
open GapiLens.Infix
open GapiLens.StateInfix
open GapiMonad.SessionM
open GapiTasksV1Model
open GapiTasksV1Service

(*** How to configure your client and authenticate using OAuth 2.0 for native
   * applications. ***)

let application_name = "YOUR_APPLICATION_NAME"

(* The clientId and clientSecret are copied from the API Access tab on
 * the Google APIs Console *)
let client_id = "YOUR_CLIENT_ID"
let client_secret = "YOUR_CLIENT_SECRET"

let configuration = GapiConfig.default
    |> GapiConfig.application_name ^= application_name
    |> GapiConfig.auth ^= GapiConfig.OAuth2
                            { GapiConfig.client_id;
                              client_secret }

(* Or your redirect URL for web based applications. *)
let redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
let scope = [GapiTasksV1Service.scope]

(* Step 1: Authorize --> *)
let authorization_url =
  GapiOAuth2.authorization_code_url
    ~redirect_uri
    ~scope
    ~response_type:"code"
    client_id

(* Point or redirect your user to the authorization_url. *)
let () = print_endline "Go to the following link in your browser:";
         print_endline authorization_url

(* Read the authorization code from the standard input stream. *)
let () = print_endline "What is the authorization code?"
let code = input_line stdin
(* End of Step 1 <-- *)

let batch =
  perform

    (* Step 2: Exchange --> *)
    response <-- GapiOAuth2.get_access_token
                   ~client_id
                   ~client_secret
                   ~code
                   ~redirect_uri;

    let (access_token, refresh_token) =
      match response with
          GapiAuthResponse.OAuth2AccessToken token ->
            (token.GapiAuthResponse.OAuth2.access_token,
             token.GapiAuthResponse.OAuth2.refresh_token)
        | _ -> failwith "Not supported OAuth2 response" in
    (* End of Step 2 <-- *)

    (* Update session with OAuth2 tokens *)
    GapiConversation.Session.auth ^=!
      GapiConversation.Session.OAuth2 {
        GapiConversation.Session.oauth2_token = access_token;
        refresh_token
      };

    (*** Working with task lists ***)

    (* Retrieving a user's task lists *)
    tasklists <-- TasklistsResource.list;

    let () = List.iter
               (fun task_list ->
                  print_endline task_list.TaskList.title)
               tasklists.TaskLists.items in

    (* Retrieving a single task list *)
    task_list <-- TasklistsResource.get
                    ~tasklist:"taskListID";

    let () = print_endline task_list.TaskList.title in

    (* Creating a task list *)
    let task_list = TaskList.empty
      |> TaskList.title ^= "New Task List" in

    result <-- TasklistsResource.insert task_list;

    let () = print_endline result.TaskList.id in

    (* Updating a task list *)

    (* First retrieve the tasklist to update. *)
    task_list <-- TasklistsResource.get ~tasklist:"taskListID";

    let task_list = task_list
      |> TaskList.title ^= "New Task List Name" in

    result <-- TasklistsResource.update
                 ~tasklist:task_list.TaskList.id
                 task_list;

    let () = print_endline result.TaskList.title in

    (* Deleting a task list *)
    TasklistsResource.delete ~tasklist:"taskListID";

    (*** Working with tasks ***)

    (* Retrieving tasks *)
    tasks <-- TasksResource.list ~tasklist:"@default";

    let () = List.iter
               (fun task ->
                  print_endline task.Task.title)
               tasks.Tasks.items in

    (* Retrieving a single task *)
    task <-- TasksResource.get ~tasklist:"@default" ~task:"taskID";

    let () = print_endline task.Task.title in

    (* Creating a task *)
    let task = {
      Task.empty with
          Task.title = "New Task";
          notes = "Please complete me";
          due = GapiDate.of_string "2010-10-15T12:00:00.000Z";
    } in

    result <-- TasksResource.insert ~tasklist:"@default" task;

    let () = print_endline result.Task.title in

    (* Updating a task *)

    (* First retrieve the task to update. *)
    task <-- TasksResource.get ~tasklist:"@default" ~task:"taskID";

    let task = task |> Task.status ^= "completed" in

    result <-- TasksResource.update
                 ~tasklist:"@default"
                 ~task:task.Task.id
                 task;

    (* Print the completed date. *)
    let () = print_endline (GapiDate.to_string result.Task.completed) in

    (* Ordering a task *)
    result <-- TasksResource.move
                 ~parent:"parentTaskID"
                 ~previous:"previousTaskID"
                 ~tasklist:"@default"
                 ~task:"taskID";

    (* Print the new values. *)
    let () = print_endline result.Task.parent;
             print_endline result.Task.position in

    (* Deleting a task *)
    TasksResource.delete ~tasklist:"@default" ~task:"taskID";

    (* Clearing completed tasks from a task list *)
    TasksResource.clear ~tasklist:"taskListID";

    (* ... *)

    return ()

(* Start a new session *)
let _ =
  GapiConversation.with_curl configuration batch

