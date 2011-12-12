(** Service definition for Tasks (v1).
 
  For more information about this service, see the
  {{:http://code.google.com/apis/tasks/v1/using.html}API Documentation}
 *)

(** OAuth 2.0 scope to get read/write access to Tasks *)
val scope : string

(** OAuth 2.0 scope to get read-only access to Tasks *)
val read_only_scope : string

(** The query parameters you can use with the Tasks API. *)
module TasksParameters :
sig
  type t = {
    fields : string;
    (** Selector specifying which fields to include in a partial response. *)
    prettyPrint : bool;
    (** Returns response with indentations and line breaks. *)
    quotaUser : string;
    (** Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides [userIp] if both are provided. *)
    userIp : string;
    (** IP address of the end user for whom the API call is being made. *)
    completedMax : GapiDate.t;
    (** Upper bound for a task's completion date (as an RFC 3339 timestamp) to filter by. *) 
    completedMin : GapiDate.t;
    (** Lower bound for a task's completion date (as an RFC 3339 timestamp) to filter by. *)
    dueMax : GapiDate.t;
    (** Upper bound for a task's due date (as an RFC 3339 timestamp) to filter by. *)
    dueMin : GapiDate.t;
    (** Lower bound for a task's due date (as an RFC 3339 timestamp) to filter by. *)
    maxResults : int;
    (** The maximum number of elements to return with this request. *)
    pageToken : string;
    (** Token specifying the result page to return. *)
    parent : string;
    (** Specify the task's parent task ID. *)
    previous : string;
    (** Specify the task's previous task ID. *)
    showCompleted : bool;
    (** Specify whether or not to show completed tasks. Defaults to [true]. *)
    showDeleted : bool;
    (** Specify whether or not to show deleted tasks. Defaults to [false]. *)
    showHidden : bool;
    (** Specify whether or not to show hidden tasks. Defaults to [true]. *)
    updatedMin : GapiDate.t;
    (** Lower bound for a task's last modification time (as an RFC 3339 timestamp) to filter by. *) 
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

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
    GapiTasks.TaskList.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

(** The "tasks" service. *)
module TasksResource :
sig
  (** Returns all tasks in the specified task list. *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:TasksParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    GapiTasks.Tasks.t * GapiConversation.Session.t

  (** Returns the specified task.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Creates a new task on the specified task list.
   
    @param tasklist Task list identifier.
   *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Updates the specified task. *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Updates the specified task. {e This method supports patch semantics.} *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Deletes the specified task from the task list. *)
  val delete :
    ?url:string ->
    ?container_id:string ->
    GapiTasks.Task.t ->
    GapiConversation.Session.t -> unit * GapiConversation.Session.t

  (** Moves the specified task to another position in the task list. This can include putting it as a child task under a new parent and/or move it to a different position among its sibling tasks.

    @param tasklist Task list identifier.
    @param task Task identifier.
    *)
  val move :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    ?new_parent:string ->
    ?new_previous:string ->
    string ->
    GapiConversation.Session.t ->
    GapiTasks.Task.t * GapiConversation.Session.t

  (** Clears all completed tasks from the specified task list. The affected tasks will be marked as 'hidden' and no longer be returned by default when retrieving all tasks for a task list.

    @param tasklist Task list identifier.
    *)
  val clear :
    ?url:string ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t

end

