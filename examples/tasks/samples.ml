(* Tasks service samples (http://code.google.com/apis/tasks/v1/using.html) *)

(*** Setup ***)

open GapiUtils.Infix
open GapiTasksV1Model
open GapiTasksV1Service

(*** How to configure your client and authenticate using OAuth 2.0 for native
   * applications. ***)

let application_name = "YOUR_APPLICATION_NAME"

(* The clientId and clientSecret are copied from the API Access tab on
 * the Google APIs Console *)
let client_id = "YOUR_CLIENT_ID"
let client_secret = "YOUR_CLIENT_SECRET"

let configuration =
  { GapiConfig.default with
        GapiConfig.application_name = application_name;
        GapiConfig.auth = GapiConfig.OAuth2
                            { GapiConfig.client_id;
                              client_secret } }

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

(* Start a new session *)
let () =
  GapiConversation.with_curl
    configuration
    (fun session ->
       (* Step 2: Exchange --> *)
       let (response, session) =
         GapiOAuth2.get_access_token
           ~client_id
           ~client_secret
           ~code
           ~redirect_uri
           session in

       let (access_token, refresh_token) =
         match response with
             GapiAuthResponse.OAuth2AccessToken token ->
               (token.GapiAuthResponse.OAuth2.access_token,
                token.GapiAuthResponse.OAuth2.refresh_token)
           | _ -> failwith "Not supported OAuth2 response" in
       (* End of Step 2 <-- *)

       (* Update session with OAuth2 tokens *)
       let session = {
         session with
             GapiConversation.Session.auth =
               GapiConversation.Session.OAuth2 {
                 GapiConversation.Session.oauth2_token = access_token;
                 refresh_token
               }
       } in

       (*** Working with task lists ***)

       (* Retrieving a user's task lists *)
       let (tasklists, session) =
         TasklistsResource.list
           session in

       List.iter
         (fun task_list ->
            print_endline task_list.TaskList.title)
         tasklists.TaskLists.items;

       (* Retrieving a single task list *)
       let (task_list, session) =
         TasklistsResource.get
           ~tasklist:"taskListID"
           session in

       print_endline task_list.TaskList.title;

       (* Creating a task list *)
       let task_list = {
         TaskList.empty with
             TaskList.title = "New Task List"
       } in

       let (result, session) =
         TasklistsResource.insert
           task_list
           session in

       print_endline result.TaskList.id;

       (* Updating a task list *)

       (* First retrieve the tasklist to update. *)
       let (task_list, session) =
         TasklistsResource.get
           ~tasklist:"taskListID"
           session in

       let task_list = {
         task_list with
             TaskList.title = "New Task List Name"
       } in

       let (result, session) =
         TasklistsResource.update
           ~tasklist:task_list.TaskList.id
           task_list
           session in

       print_endline result.TaskList.title;

       (* Deleting a task list *)
       let ((), session) =
         TasklistsResource.delete
           ~tasklist:"taskListID"
           session in

       (*** Working with tasks ***)

       (* Retrieving tasks *)
       let (tasks, session) =
         TasksResource.list
           ~tasklist:"@default"
           session in

       List.iter
         (fun task ->
            print_endline task.Task.title)
         tasks.Tasks.items;

       (* Retrieving a single task *)
       let (task, session) =
         TasksResource.get
           ~tasklist:"@default"
           ~task:"taskID"
           session in

       print_endline task.Task.title;

       (* Creating a task *)
       let task = {
         Task.empty with
             Task.title = "New Task";
             notes = "Please complete me";
             due = GapiDate.of_string "2010-10-15T12:00:00.000Z";
       } in

       let (result, session) =
         TasksResource.insert
           ~tasklist:"@default"
           task
           session in

       print_endline result.Task.title;

       (* Updating a task *)

       (* First retrieve the task to update. *)
       let (task, session) =
         TasksResource.get
           ~tasklist:"@default"
           ~task:"taskID"
           session in

       let task = {
         task with
             Task.status = "completed";
       } in

       let (result, session) =
         TasksResource.update
           ~tasklist:"@default"
           ~task:task.Task.id
           task
           session in

       (* Print the completed date. *)
       print_endline (GapiDate.to_string result.Task.completed);

       (* Ordering a task *)
       let (result, session) =
         TasksResource.move
           ~parent:"parentTaskID"
           ~previous:"previousTaskID"
           ~tasklist:"@default"
           ~task:"taskID"
           session in

       (* Print the new values. *)
       print_endline result.Task.parent;
       print_endline result.Task.position;

       (* Deleting a task *)
       let ((), session) =
         TasksResource.delete
           ~tasklist:"@default"
           ~task:"taskID"
           session in

       (* Clearing completed tasks from a task list *)
       let ((), _) =
         TasksResource.clear
           ~tasklist:"taskListID"
           session in

       (* ... *)

       ()
    )

