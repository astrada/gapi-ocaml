(** Service definition for Tasks (v1).
 
  For more information about this service, see the
  {{:http://code.google.com/apis/tasks/v1/using.html}API Documentation}
 *)

(** OAuth 2.0 scope to get read/write access to Tasks *)
val scope : string

(** OAuth 2.0 scope to get read-only access to Tasks *)
val read_only_scope : string

(** The "tasklists" service. *)
module TasklistsResource :
sig
  (** Returns all the authenticated user's task lists.

    Usage: [list session], where [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    @param etag optional ETag
    @param parameters optional standard parameters
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    (GapiTasks.TaskLists.t * GapiConversation.Session.t)

  (** Returns the authenticated user's specified task list.

    Usage: [get tasklist_id session], where [tasklist_id] is the task list identifier to retrieve, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    @param parameters optional standard parameters
    @param maxResults Maximum number of task lists returned on one page. Optional. The default is 100.
    @param pageToken Token specifying the result page to return. Optional.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    string ->
    GapiConversation.Session.t ->
    (GapiTasks.TaskList.t * GapiConversation.Session.t)

  (** Reloads the authenticated user's specified task list.

    Usage: [refresh tasklist session], where [tasklist] is the task list to reload, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    @param parameters optional standard parameters
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiTasks.TaskList.t ->
    GapiConversation.Session.t ->
    (GapiTasks.TaskList.t * GapiConversation.Session.t)

  (** Creates a new task list and adds it to the authenticated user's task
    lists.
  
    Usage: [insert tasklist session], where [tasklist] is the task list to insert, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    @param parameters optional standard parameters
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiTasks.TaskList.t ->
    GapiConversation.Session.t ->
    (GapiTasks.TaskList.t * GapiConversation.Session.t)

  (** Updates the authenticated user's specified task list.

    Usage [update tasklist session], where [tasklist] is the task list to update, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    @param parameters optional standard parameters
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiTasks.TaskList.t ->
    GapiConversation.Session.t ->
    (GapiTasks.TaskList.t * GapiConversation.Session.t)

  (** Updates the authenticated user's specified task list. This method supports patch semantics.

    Usage [patch tasklist session], where [tasklist] is the task list to update, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    @param parameters optional standard parameters
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiTasks.TaskList.t ->
    GapiConversation.Session.t ->
    (GapiTasks.TaskList.t * GapiConversation.Session.t)

  (** Deletes the authenticated user's specified task list.
  
    Usage: [delete tasklist session], where [tasklist] is the task list to delete, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/users"])
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiTasks.TaskList.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

(** The "tasks" service. *)
module TasksResource :
sig
  (** Returns all tasks in the specified task list.

    Usage [list session], where [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param etag optional ETag
    @param parameters optional specific parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    @param completedMax Upper bound for a task's completion date (as an RFC 3339 timestamp) to filter by.
    @param completedMin Lower bound for a task's completion date (as an RFC 3339 timestamp) to filter by.
    @param dueMax Upper bound for a task's due date (as an RFC 3339 timestamp) to filter by.
    @param dueMin Lower bound for a task's due date (as an RFC 3339 timestamp) to filter by.
    @param maxResults The maximum number of elements to return with this request.
    @param pageToken Token specifying the result page to return.
    @param showCompleted Specify whether or not to show completed tasks. Defaults to [true].
    @param showDeleted Specify whether or not to show deleted tasks. Defaults to [false].
    @param showHidden Specify whether or not to show hidden tasks. Defaults to [true].
    @param updatedMin Lower bound for a task's last modification time (as an RFC 3339 timestamp) to filter by.
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    ?completedMax:GapiDate.t ->
    ?completedMin:GapiDate.t ->
    ?dueMax:GapiDate.t ->
    ?dueMin:GapiDate.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?showCompleted:bool ->
    ?showDeleted:bool ->
    ?showHidden:bool ->
    ?updatedMin:GapiDate.t ->
    GapiConversation.Session.t ->
    GapiTasks.Tasks.t * GapiConversation.Session.t

  (** Returns the specified task.

    Usage [get task_id session], where [task_id] is the task identifier to retrieve, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    string ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Reloads the specified task.

    Usage [refresh task_id session], where [task] is the task to reload, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Creates a new task on the specified task list.
   
    Usage [refresh task session], where [task] is the task to insert, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    @param parent Parent task identifier. If the task is created at the top level, this parameter is omitted.
    @param previous Previous sibling task identifier. If the task is created at the first position among its siblings, this parameter is omitted.
   *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    ?parent:string ->
    ?previous:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Updates the specified task.

    Usage [update task session], where [task] is the task to update, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Updates the specified task. This method supports patch semantics.

    Usage [patch task session], where [task] is the task to update, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Deletes the specified task from the task list.

    Usage [delete task session], where [task] is the task to delete, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t -> unit * GapiConversation.Session.t

  (** Moves the specified task to another position in the task list. This can include putting it as a child task under a new parent and/or move it to a different position among its sibling tasks.

    Usage [move task_id session], where [task_id] is the task identifier to move, and [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val move :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    ?parent:string ->
    ?previous:string ->
    string ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Clears all completed tasks from the specified task list. The affected tasks will be marked as 'hidden' and no longer be returned by default when retrieving all tasks for a task list.

    Usage: [clear session], where [session] is the current session.

    @param url the service endpoint base url (defaults to ["https://www.googleapis.com/tasks/v1/lists"])
    @param parameters optional standard parameters
    @param tasklist Task list identifier. The default is ["@default"], i.e. the authenticated user's default task list 
    *)
  val clear :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?tasklist:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t

end

