(** Managing sharing permissions of resources via Google Data Protocol Access Control Lists (ACLs).
  *)

val get_acl :
  ?version:string ->
  ?etag:string ->
  string ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t

val refresh_acl :
  ?version:string ->
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val create_acl :
  ?version:string ->
  ?query_parameters:(string * string) list ->
  GdataACL.Entry.t ->
  string ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val update_acl :
  ?version:string ->
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val delete_acl :
  ?version:string ->
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val acl_batch_request :
  ?version:string ->
  GdataACL.Feed.t ->
  GdataACL.Feed.t ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t

