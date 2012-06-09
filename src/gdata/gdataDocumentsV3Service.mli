(** Service definition for Google Documents List API (v3). 

 The Google Documents List API allows client applications to view and manipulate files in a user's Documents List. 

  For more information about this service, see the
  {{:https://developers.google.com/google-apps/documents-list/#batching_resource_operations_into_a_single_request}API Documentation}.
  *)

module QueryParameters :
sig
  type t = {
    author : string;
    (** Entry author. The service returns entries where the author name and/or email address match your query string. *)
    category : string;
    (** Category query filter. To do an OR between terms, use a pipe character (|), URL-encoded as [%7C]. For example: [http://www.example.com/feeds?category=Fritz%7CLaurie] returns entries that match either category. To do an AND between terms, use a comma character (,). For example: [http://www.example.com/feeds?category=Fritz,Laurie] returns entries that match both categories. *)
    max_results : int;
    (** Maximum number of results to be retrieved. *)
    prettyprint : bool;
    (** Returns an XML response with identations and line breaks. If [prettyprint=true], the XML returned by the server will be human readable (pretty printed). Default: [prettyprint=false]. *)
    published_min : GapiDate.t;
    (** Lower bounds on the entry publication date. The bound is inclusive. *)
    published_max : GapiDate.t;
    (** Upper bounds on the entry publication date. The bound is exclusive. *)
    q : string;
    (** Full-text query string. When creating a query, list search terms separated by spaces, in the form [q=term1 term2 term3]. The service returns all entries that match all of the search terms (like using AND between terms). Like Google's web search, a service searches on complete words (and related words with the same stem), not substrings. To search for an exact phrase, enclose the phrase in quotation marks: [q="exact phrase"]. To exclude entries that match a given term, use the form [q=-term]. The search is case-insensitive. Example: to search for all entries that contain the exact phrase "Elizabeth Bennet" and the word "Darcy" but don't contain the word "Austen", use the following query: [q="Elizabeth Bennet" Darcy -Austen]. *)
    start_index : int;
    (** 1-based index of the first result to be retrieved. Note that this isn't a general cursoring mechanism. If you first send a query with [start-index=1] and [max-results=10] and then send another query with [start-index=11] and [max-results=10], the service cannot guarantee that the results are equivalent to [start-index=1] and [max-results=20], because insertions and deletions could have taken place in between the two queries. *)
    strict : bool;
    (** Strict query parameter checking. Set [strict=true] to verify that each of your query parameters are recognized by the service. An error will be returned if a parameter is not recognized. Default: [strict=false]. *)
    updated_min : GapiDate.t;
    (** Lower bounds on the entry update date. The bound is inclusive. *)
    updated_max : GapiDate.t;
    (** Upper bounds on the entry update date. The bound is exclusive. *)
    title : string;
    (** Specifies the search terms for the title of a document. This parameter used without [title-exact] will only submit partial queries, not exact queries. *)
    title_exact : bool;
    (** Specifies whether the [title] query should be taken as an exact string. Meaningless without title. Possible values are true and false. Note: Matches are case-insensitive. Default is [false]. *)
    opened_min : GapiDate.t;
    (** Lower bound on the last time a document was opened by the current user. *)
    opened_max : GapiDate.t;
    (** Upper bound on the last time a document was opened by the current user. *)
    edited_min : GapiDate.t;
    (** Lower bound on the last time a document was edited by the current user. This value corresponds to the [<app:edited>] value in the Atom entry, which represents changes to the document's content or metadata. *)
    edited_max : GapiDate.t;
    (** Upper bound on the last time a document was edited by the user. This value corresponds to the [<app:edited>] value in the Atom entry, which represents changes to the document's content or metadata. *)
    owner : string;
    (** Searches for documents with a specific owner. Use the email address of the owner. For example: [owner="user\@gmail.com"]. *)
    writer : string;
    (** Searches for documents which can be written to by specific users. Use a single email address or a comma separated list of email addresses. For example: [writer="user1\@gmail.com,user2\@example.com"]. *)
    reader : string;
    (** Searches for documents which can be read by specific users. Use a single email address or a comma separated list of email addresses. For example: [reader="user1\@gmail.com,user2\@example.com"]. *)
    showfolders : bool;
    (** Specifies whether the query should return folders as well as documents. Default is [false]. *)
    showdeleted : bool;
    (** Specifies whether the query should return documents which are in the trash as well as other documents. Default is [false]. *)
    showroot : bool;
    (** Specifies whether the root collection should be shown as a parent of relevant resources. The [showroot] parameter does not cause the root collection to show up as a separate entry in feeds of collections. *)
    ocr : bool;
    (** Specifies whether to attempt OCR on a .jpg, .png, of .gif upload. Default is [false]. *)
    ocr_language : string;
    (** Hint at which language to use when performing OCR. Even while providing this parameter, if there is overwhelming evidence that a character or paragraph is of a certain language, the hint will not be applied in that case. *)
    targetLanguage : string;
    (** Specifies the language to translate a document into. *)
    sourceLanguage : string;
    (** Specifies the source language of the original document. Optional when using the translation service. If not provided, Google will attempt to auto-detect the source language. *)
    delete : bool;
    (** Specifies whether or to permanently delete a document when trashing it. 	Default is [false], meaning a document is moved to the trash. *)
    convert : bool;
    (** Specifies whether or not a document-type arbitrary file upload should be converted into a native Google Doc. Optional when uploading a file. Default is [true]. This parameter has no effect on PDFs or arbitrary file uploads. *)
    remaining_changestamps_first : int;
    (** Providing the [remaining-changestamps-first] parameter causes the metadata feed to return the number of changestamps since the given changestamp, including the given changestamp. Thus, to get the number of changestamps since a given changestamp, clients must provide the last synced changestamp, plus one. *)
    remaining_changestamps_limit : int;
    (** This parameter gives an upper bound to the number of changes returned by the metadata feed. *)
    expand_acl : bool;
    (** Expands the ACL of each resource returned in the feed if set to [true]. *)
    format : string;
    (** By default, documents are exported as HTML. Use the [format] parameter to download documents in alternate formats. *)
    exportFormat : string;
    (** Old-style export format. *)
    gid : string;
    (** When requesting a CSV, TSV, PDF, or HTML file you may specify an additional (optional) parameter called [gid] which indicates which worksheet you wish to export (the index is 0 based, so [gid=1] actually refers to the second worksheet on a given spreadsheet). If left unspecified, the first worksheet is exported for these formats. In the case of a PDF, the whole document is exported. *)
    new_revision : bool;
    (** Specifies whether to force a new revision to be created when updating a resource. *) 
    send_notification_emails : bool;
    (** Specifies whether notify relevant users via email, when creating an ACL entry that shares a document or collection. Default is [true]. *)
    include_profile_info : bool;
    (** Specifies whether to add public profile information for the users if it is available. If available, the API adds a link to the primary public photo of the relevant user's Google account. This is requested by setting [include-profile-info=true] to any request that may return user information, including the changes feed, resources feed, ACL feed, etc. Default is [false]. *)
  }

  val author : (t, string) GapiLens.t
  val category : (t, string) GapiLens.t
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
  val title_exact : (t, bool) GapiLens.t
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
    ?title_exact:bool ->
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
(** Query parameters used by the services. *)

val feed_scope : string
(** Documents feed scope. *)
val docs_scope : string
(** Scope allowing documents download. *)
val spreadsheets_scope : string
(** Scope allowing spreadsheets download. *)
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
(** [resumable_upload url source session]: Uploads the document specified in [source] to URL [url] in session [session], using the resumable upload protocol. *)

val partial_download :
  ?ranges:(int64 option * int64 option) list ->
  string ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** [partial_download url dest session]: Downloads a resource from URL [url] to destination [dest] in session [session].

 @param ranges Specifies a list of ranges (start-end byte ranges). If not provided, the document will be fully downloaded.
 *)

val download_content :
  ?format:string ->
  ?gid:string ->
  GdataAtom.Content.t ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** [download_content content dest session]: Downloads a document extracting URL from [content] to destination [dest] in session [session].
 *)

val query_metadata :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Metadata.Entry.t * GapiConversation.Session.t
(** Queries the metadata feed for the currently authorized user. *)

val query_changes :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t
(** Queries the changes feed for the currently authorized user. *)

val query_documents_list :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t
(** Queries the documents feed for the currently authorized user. *)

val get_resumable_create_media_link :
  GapiConversation.Session.t ->
  string * GapiConversation.Session.t
(** Gets the resumable create media link from the documents feed. *)

val get_document :
  ?base_url:string ->
  string ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** Gets a document entry by its resource id. *)

val refresh_document :
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** Reloads a document entry. *)

val create_document :
  ?url:string ->
  ?parameters:QueryParameters.t ->
  ?media_source:GapiMediaResource.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** Creates a new document on the server.

 @param media_source Document to upload. If not specified, a new empty document (with metadata only) will be created.
*)

val copy_document :
  ?url:string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** Duplicates a document in a user's Google Docs list. *)

val update_document :
  ?new_revision:bool ->
  ?media_source:GapiMediaResource.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** Updates a document.

 @param media_source Document to upload, to replace the current one. If not specified, only metadata will be updated.
 *)

val download_document :
  ?format:string ->
  ?gid:string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** [download_document entry dest session]: Downloads the document associated with entry [entry] to destination [dest] in session [session]. *)

val delete_document :
  ?delete:bool ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** Deletes a document. *)

val documents_batch_request :
  ?url:string ->
  GdataDocumentsV3Model.Document.Feed.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t
(** Performs batch processing of operations on documents feed. *)

val query_revisions :
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Revision.Feed.t * GapiConversation.Session.t
(** Queries revisions feed of a document. *)

val refresh_revision :
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Revision.Entry.t * GapiConversation.Session.t
(** Reloads a revision entry. *)

val download_revision :
  ?format:string ->
  ?gid:string ->
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** [download_revision entry dest session]: Downloads a specific revision ([entry]) of a document to destination [dest] in session [session]. *)

val update_revision :
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Revision.Entry.t * GapiConversation.Session.t
(** Updates a revision entry. *)

val delete_revision :
  GdataDocumentsV3Model.Revision.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** Deletes a revision entry. *)

val root_folder_id : string
(** Root folder ID, used to query root folder content. *)

val query_folder_contents :
  ?base_url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  string ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Feed.t * GapiConversation.Session.t
(** [query_folder_contents folder_id session]: Queries the contents of folder [folder_id]. *)

val create_subfolder :
  ?base_url:string ->
  ?etag:'a ->
  string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** [create_subfolder folder_id entry session]: Creates the new folder [entry] in folder [folder_id]. *)

val add_to_folder :
  ?base_url:string ->
  ?etag:'a ->
  string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Document.Entry.t * GapiConversation.Session.t
(** [add_to_folder folder_id entry session]: Adds document [entry] to folder [folder_id]. *)

val get_acl :
  ?etag:string ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t
(** Gets the ACL for a document. *)

val refresh_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t
(** Reloads the ACL for a document. *)

val create_acl :
  ?send_notification_emails:bool ->
  GdataACL.Entry.t ->
  GdataDocumentsV3Model.Document.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t
(** Creates a new ACL for a document. *)

val update_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t
(** Updates an ACL entry. *)

val delete_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** Deletes an ACL entry. *)

val acl_batch_request :
  GdataACL.Feed.t ->
  GdataACL.Feed.t ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t
(** Performs batch processing of operations on ACL feed. *)

val create_archive :
  ?url:string ->
  ?parameters:QueryParameters.t ->
  GdataDocumentsV3Model.Archive.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Archive.Entry.t * GapiConversation.Session.t
(** The archive feed can be used to export resources as a .zip file. The entry determines the desired export format for each type of resource. *)

val refresh_archive :
  GdataDocumentsV3Model.Archive.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Archive.Entry.t * GapiConversation.Session.t
(** Reloads an archive entry. *)

val update_archive :
  GdataDocumentsV3Model.Archive.Entry.t ->
  GapiConversation.Session.t ->
  GdataDocumentsV3Model.Archive.Entry.t * GapiConversation.Session.t
(** Updates an archive entry. *)

val delete_archive :
  GdataDocumentsV3Model.Archive.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t
(** Deletes an archive entry. *)

