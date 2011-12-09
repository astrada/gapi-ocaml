module Task :
sig
  type t = {
    kind : string;
    (** Type of the resource. This is always ["tasks#task"]. *)
    id : string;
    (** Task identifier. *)
    etag : string;
    (** ETag of the resource. *)
    title : string;
    (** Title of the task. *)
    updated : GapiDate.t;
    (** Last modification time of the task (as a RFC 3339 timestamp). *)
    selfLink : string;
    (** URL pointing to this task. Used to retrieve, update, or delete this task. *)
    parent : string;
    (** Parent task identifier. This field is omitted if it is a top-level task. This field is read-only. Use the [move] method to move the task under a different parent or to the top level. *)
    position : string;
    (** String indicating the position of the task among its sibling tasks under the same parent task or at the top level. If this string is greater than another task's corresponding position string according to lexicographical ordering, the task is positioned after the other task under the same parent task (or at the top level). This field is read-only. Use the [move] method to move the task to another position. *)
    notes : string;
    (** Notes describing the task. Optional. *)
    status : string;
    (** Status of the task. This is either ["needsAction"] or ["completed"]. *)
    due : GapiDate.t;
    (** Due date of the task (as a RFC 3339 timestamp). Optional. *)
    completed : string;
    (** Completion date of the task (as a RFC 3339 timestamp). This field is omitted if the task has not been completed. *)
    deleted : string;
    (** Flag indicating whether the task has been deleted. The default is [false]. *)
    hidden : string
    (** Flag indicating whether the task is hidden. This is the case if the task had been marked completed when the task list was last cleared. The default is [false]. This field is read-only. *)
  }

  val kind : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val parent : (t, string) GapiLens.t
  val position : (t, string) GapiLens.t
  val notes : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  val due : (t, GapiDate.t) GapiLens.t
  val completed : (t, string) GapiLens.t
  val deleted : (t, string) GapiLens.t
  val hidden : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Tasks :
sig
  type t = {
    kind : string;
    (** Type of the resource. This is always ["tasks#tasks&"]. *)
    etag : string;
    (** ETag of the resource. *)
    nextPageToken : string;
    (** Token used to access the next page of this result. *)
    items : Task.t list
    (** Collection of tasks. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, Task.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module TaskList :
sig
  type t = {
    kind : string;
    (** Type of the resource. This is always ["tasks#taskList"]. *)
    id : string;
    (** Task list identifier. *)
    etag : string;
    (** ETag of the resource. *)
    title : string;
    (** Title of the task list. *)
    selfLink : string
    (** URL pointing to this task list. Used to retrieve, update, or delete this task list. *)
  }

  val kind : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module TaskLists :
sig
  type t = {
    kind : string;
    (** Type of the resource. This is always ["tasks#taskLists"]. *)
    etag : string;
    (** ETag of the resource. *)
    nextPageToken : string;
    (** Token that can be used to request the next page of this result. *)
    items : TaskList.t list
    (** Collection of task lists. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, TaskList.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

