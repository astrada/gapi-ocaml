(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Tasks API (v1).
  
  For more information about this data model, see the
  {{:http://code.google.com/apis/tasks/v1/using.html}API Documentation}.
  *)

module TaskList :
sig
  type t = {
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Task list identifier. *)
    kind : string;
    (** Type of the resource. This is always "tasks#taskList". *)
    selfLink : string;
    (** URL pointing to this task list. Used to retrieve, update, or delete this task list. *)
    title : string;
    (** Title of the task list. *)
    updated : GapiDate.t;
    (** Last modification time of the task list (as a RFC 3339 timestamp). *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Task :
sig
  module Links :
  sig
    type t = {
      description : string;
      (** The description. In HTML speak: Everything between <a> and </a>. *)
      link : string;
      (** The URL. *)
      _type : string;
      (** Type of the link, e.g. "email". *)
      
    }
    
    val description : (t, string) GapiLens.t
    val link : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    completed : GapiDate.t;
    (** Completion date of the task (as a RFC 3339 timestamp). This field is omitted if the task has not been completed. *)
    deleted : bool;
    (** Flag indicating whether the task has been deleted. The default if False. *)
    due : GapiDate.t;
    (** Due date of the task (as a RFC 3339 timestamp). Optional. *)
    etag : string;
    (** ETag of the resource. *)
    hidden : bool;
    (** Flag indicating whether the task is hidden. This is the case if the task had been marked completed when the task list was last cleared. The default is False. This field is read-only. *)
    id : string;
    (** Task identifier. *)
    kind : string;
    (** Type of the resource. This is always "tasks#task". *)
    links : Links.t list;
    (** Collection of links. This collection is read-only. *)
    notes : string;
    (** Notes describing the task. Optional. *)
    parent : string;
    (** Parent task identifier. This field is omitted if it is a top-level task. This field is read-only. Use the "move" method to move the task under a different parent or to the top level. *)
    position : string;
    (** String indicating the position of the task among its sibling tasks under the same parent task or at the top level. If this string is greater than another task's corresponding position string according to lexicographical ordering, the task is positioned after the other task under the same parent task (or at the top level). This field is read-only. Use the "move" method to move the task to another position. *)
    selfLink : string;
    (** URL pointing to this task. Used to retrieve, update, or delete this task. *)
    status : string;
    (** Status of the task. This is either "needsAction" or "completed". *)
    title : string;
    (** Title of the task. *)
    updated : GapiDate.t;
    (** Last modification time of the task (as a RFC 3339 timestamp). *)
    
  }
  
  val completed : (t, GapiDate.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val due : (t, GapiDate.t) GapiLens.t
  val etag : (t, string) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val links : (t, Links.t list) GapiLens.t
  val notes : (t, string) GapiLens.t
  val parent : (t, string) GapiLens.t
  val position : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TaskLists :
sig
  type t = {
    etag : string;
    (** ETag of the resource. *)
    items : TaskList.t list;
    (** Collection of task lists. *)
    kind : string;
    (** Type of the resource. This is always "tasks#taskLists". *)
    nextPageToken : string;
    (** Token that can be used to request the next page of this result. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, TaskList.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Tasks :
sig
  type t = {
    etag : string;
    (** ETag of the resource. *)
    items : Task.t list;
    (** Collection of tasks. *)
    kind : string;
    (** Type of the resource. This is always "tasks#tasks". *)
    nextPageToken : string;
    (** Token used to access the next page of this result. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Task.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

