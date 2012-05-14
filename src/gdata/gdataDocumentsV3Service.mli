(** Google Documents List API v3 service. 
  *)

module QueryParameters :
sig
  type t = {
    author : string;
    category : string;
    fields : string;
    max_results : int;
    prettyprint : bool;
    published_min : GapiDate.t;
    published_max : GapiDate.t;
    q : string;
    start_index : int;
    strict : bool;
    updated_min : GapiDate.t;
    updated_max : GapiDate.t;
    title : string;
    title_exact : string;
    opened_min : GapiDate.t;
    opened_max : GapiDate.t;
    edited_min : GapiDate.t;
    edited_max : GapiDate.t;
    owner : string;
    writer : string;
    reader : string;
    showfolders : bool;
    showdeleted : bool;
    showroot : bool;
    ocr : bool;
    ocr_language : string;
    targetLanguage : string;
    sourceLanguage : string;
    delete : bool;
    convert : bool;
    remaining_changestamps_first : int;
    remaining_changestamps_limit : int;
    expand_acl : bool;
    format : string;
    exportFormat : string;
    gid : string;
    new_revision : bool;
    send_notification_emails : bool;
    include_profile_info : bool;
  }

  val author : (t, string) GapiLens.t
  val category : (t, string) GapiLens.t
  val fields : (t, string) GapiLens.t
  val max_results : (t, int) GapiLens.t
  val prettyprint : (t, bool) GapiLens.t
  val published_min : (t, GapiDate.t) GapiLens.t
  val published_max : (t, GapiDate.t) GapiLens.t
  val q : (t, string) GapiLens.t
  val start_index : (t, int) GapiLens.t
  val strict : (t, bool) GapiLens.t
  val updated_min : (t, GapiDate.t) GapiLens.t
  val updated_max : (t, GapiDate.t) GapiLens.t
  val title : (t, string) GapiLens.t
  val title_exact : (t, string) GapiLens.t
  val opened_min : (t, GapiDate.t) GapiLens.t
  val opened_max : (t, GapiDate.t) GapiLens.t
  val edited_min : (t, GapiDate.t) GapiLens.t
  val edited_max : (t, GapiDate.t) GapiLens.t
  val owner : (t, string) GapiLens.t
  val writer : (t, string) GapiLens.t
  val reader : (t, string) GapiLens.t
  val showfolders : (t, bool) GapiLens.t
  val showdeleted : (t, bool) GapiLens.t
  val showroot : (t, bool) GapiLens.t
  val ocr : (t, bool) GapiLens.t
  val ocr_language : (t, string) GapiLens.t
  val targetLanguage : (t, string) GapiLens.t
  val sourceLanguage : (t, string) GapiLens.t
  val delete : (t, bool) GapiLens.t
  val convert : (t, bool) GapiLens.t
  val remaining_changestamps_first : (t, int) GapiLens.t
  val remaining_changestamps_limit : (t, int) GapiLens.t
  val expand_acl : (t, bool) GapiLens.t
  val format : (t, string) GapiLens.t
  val exportFormat : (t, string) GapiLens.t
  val gid : (t, string) GapiLens.t
  val new_revision : (t, bool) GapiLens.t
  val send_notification_emails : (t, bool) GapiLens.t
  val include_profile_info : (t, bool) GapiLens.t

  val default : t

  val to_key_value_list :
    t -> (string * string) list

  val to_query_parameters :
    t option -> (string * string) list option

  val merge_parameters :
    ?author:string ->
    ?category:string ->
    ?fields:string ->
    ?max_results:int ->
    ?prettyprint:bool ->
    ?published_min:GapiDate.t ->
    ?published_max:GapiDate.t ->
    ?q:string ->
    ?start_index:int ->
    ?strict:bool ->
    ?updated_min:GapiDate.t ->
    ?updated_max:GapiDate.t ->
    ?title:string ->
    ?title_exact:string ->
    ?opened_min:GapiDate.t ->
    ?opened_max:GapiDate.t ->
    ?edited_min:GapiDate.t ->
    ?edited_max:GapiDate.t ->
    ?owner:string ->
    ?writer:string ->
    ?reader:string ->
    ?showfolders:bool ->
    ?showdeleted:bool ->
    ?showroot:bool ->
    ?ocr:bool ->
    ?ocr_language:string ->
    ?targetLanguage:string ->
    ?sourceLanguage:string ->
    ?delete:bool ->
    ?convert:bool ->
    ?remaining_changestamps_first:int ->
    ?remaining_changestamps_limit:int ->
    ?expand_acl:bool ->
    ?format:string ->
    ?exportFormat:string ->
    ?gid:string ->
    ?new_revision:bool ->
    ?send_notification_emails:bool ->
    ?include_profile_info:bool -> unit -> t option

end

val feed_scope : string
val docs_scope : string
val spreadsheets_scope : string
val all_scopes : string

val resumable_upload :
  ?convert:bool ->
  ?ocr:bool ->
  ?ocr_language:string ->
  ?sourceLanguage:string ->
  ?targetLanguage:string ->
  ?new_revision:bool ->
  string ->
  GapiMediaResource.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val partial_download :
  ?ranges:(int64 option * int64 option) list ->
  string ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val query_metadata :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Metadata.Entry.t * GapiConversation.Session.t

val query_changes :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t

val query_documents_list :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t

val get_resumable_create_media_link :
  GapiConversation.Session.t ->
  string * GapiConversation.Session.t

val refresh_document :
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val create_document :
  ?url:string ->
  ?parameters:QueryParameters.t ->
  ?media_source:GapiMediaResource.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val copy_document :
  ?url:string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val update_document :
  ?new_revision:bool ->
  ?media_source:GapiMediaResource.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val download_document :
  ?format:string ->
  ?gid:string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val delete_document :
  ?delete:bool ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val documents_batch_request :
  GdataDocumentsV3Model.Document.Feed.t ->
  GdataDocumentsV3Model.Document.Feed.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t

val query_revisions :
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Revision.Feed.t * GapiConversation.Session.t

val refresh_revision :
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Revision.Entry.t * GapiConversation.Session.t

val download_revision :
  ?format:string ->
  ?gid:string ->
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val update_revision :
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Revision.Entry.t * GapiConversation.Session.t

val delete_revision :
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val root_folder_id : string

val query_folder_contents :
  ?base_url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  string ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t

val create_subfolder :
  ?base_url:string ->
  ?etag:'a ->
  string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val add_to_folder :
  ?base_url:string ->
  ?etag:'a ->
  string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t

val get_acl :
  ?etag:string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t

val refresh_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val create_acl :
  send_notification_emails:bool ->
  GdataACL.Entry.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val update_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val delete_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val acl_batch_request :
  GdataACL.Feed.t ->
  GdataACL.Feed.t ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t

