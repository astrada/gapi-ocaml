(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Tasks API (v1).
  
  Lets you manage your tasks and task lists..
  
  For more information about this service, see the
  {{:http://code.google.com/apis/tasks/v1/using.html}API Documentation}.
  *)

(** Manage your tasks *)
val scope : string
(** View your tasks *)
val scope_readonly : string
module TasklistsResource :
sig
  
  (** Deletes the authenticated user's specified task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns the authenticated user's specified task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    *)
  val get :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.TaskList.t * GapiConversation.Session.t
  
  (** Creates a new task list and adds it to the authenticated user's task lists.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiTasksV1Model.TaskList.t ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.TaskList.t * GapiConversation.Session.t
  
  (** Returns all the authenticated user's task lists.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of task lists returned on one page. Optional. The default is 100.
    @param pageToken Token specifying the result page to return. Optional.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:string ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.TaskLists.t * GapiConversation.Session.t
  
  (** Updates the authenticated user's specified task list. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    GapiTasksV1Model.TaskList.t ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.TaskList.t * GapiConversation.Session.t
  
  (** Updates the authenticated user's specified task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    GapiTasksV1Model.TaskList.t ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.TaskList.t * GapiConversation.Session.t
  
  
end

module TasksResource :
sig
  
  (** Clears all completed tasks from the specified task list. The affected tasks will be marked as 'hidden' and no longer be returned by default when retrieving all tasks for a task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    *)
  val clear :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Deletes the specified task from the task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    @param task Task identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    task:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns the specified task.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    @param task Task identifier.
    *)
  val get :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    task:string ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.Task.t * GapiConversation.Session.t
  
  (** Creates a new task on the specified task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param parent Parent task identifier. If the task is created at the top level, this parameter is omitted. Optional.
    @param previous Previous sibling task identifier. If the task is created at the first position among its siblings, this parameter is omitted. Optional.
    @param tasklist Task list identifier.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?parent:string ->
    ?previous:string ->
    tasklist:string ->
    GapiTasksV1Model.Task.t ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.Task.t * GapiConversation.Session.t
  
  (** Returns all tasks in the specified task list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param completedMax Upper bound for a task's completion date (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by completion date.
    @param completedMin Lower bound for a task's completion date (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by completion date.
    @param dueMax Upper bound for a task's due date (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by due date.
    @param dueMin Lower bound for a task's due date (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by due date.
    @param maxResults Maximum number of task lists returned on one page. Optional. The default is 100.
    @param pageToken Token specifying the result page to return. Optional.
    @param showCompleted Flag indicating whether completed tasks are returned in the result. Optional. The default is True.
    @param showDeleted Flag indicating whether deleted tasks are returned in the result. Optional. The default is False.
    @param showHidden Flag indicating whether hidden tasks are returned in the result. Optional. The default is False.
    @param updatedMin Lower bound for a task's last modification time (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by last modification time.
    @param tasklist Task list identifier.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?completedMax:string ->
    ?completedMin:string ->
    ?dueMax:string ->
    ?dueMin:string ->
    ?maxResults:string ->
    ?pageToken:string ->
    ?showCompleted:bool ->
    ?showDeleted:bool ->
    ?showHidden:bool ->
    ?updatedMin:string ->
    tasklist:string ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.Tasks.t * GapiConversation.Session.t
  
  (** Moves the specified task to another position in the task list. This can include putting it as a child task under a new parent and/or move it to a different position among its sibling tasks.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param parent New parent task identifier. If the task is moved to the top level, this parameter is omitted. Optional.
    @param previous New previous sibling task identifier. If the task is moved to the first position among its siblings, this parameter is omitted. Optional.
    @param tasklist Task list identifier.
    @param task Task identifier.
    *)
  val move :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?parent:string ->
    ?previous:string ->
    tasklist:string ->
    task:string ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.Task.t * GapiConversation.Session.t
  
  (** Updates the specified task. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    @param task Task identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    task:string ->
    GapiTasksV1Model.Task.t ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.Task.t * GapiConversation.Session.t
  
  (** Updates the specified task.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/tasks/v1/"]).
    @param std_params Optional standard parameters.
    @param tasklist Task list identifier.
    @param task Task identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    tasklist:string ->
    task:string ->
    GapiTasksV1Model.Task.t ->
    GapiConversation.Session.t ->
    GapiTasksV1Model.Task.t * GapiConversation.Session.t
  
  
end


