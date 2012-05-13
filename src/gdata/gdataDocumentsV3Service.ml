open GapiUtils.Infix
open GapiLens.Infix
open GdataDocumentsV3Model

module QueryParameters =
struct
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
    (* changes *)
    remaining_changestamps_first : int;
    remaining_changestamps_limit : int;
    expand_acl : bool;
    (* export *)
    format : string;
    exportFormat : string;
    (* Worksheet ID *)
    gid : string;
    (* Force a new revision when updating a resource *)
    new_revision : bool;
    send_notification_emails : bool;
    include_profile_info : bool;
  }

	let author = {
		GapiLens.get = (fun x -> x.author);
		GapiLens.set = (fun v x -> { x with author = v })
	}
	let category = {
		GapiLens.get = (fun x -> x.category);
		GapiLens.set = (fun v x -> { x with category = v })
	}
	let fields = {
		GapiLens.get = (fun x -> x.fields);
		GapiLens.set = (fun v x -> { x with fields = v })
	}
	let max_results = {
		GapiLens.get = (fun x -> x.max_results);
		GapiLens.set = (fun v x -> { x with max_results = v })
	}
	let prettyprint = {
		GapiLens.get = (fun x -> x.prettyprint);
		GapiLens.set = (fun v x -> { x with prettyprint = v })
	}
	let published_min = {
		GapiLens.get = (fun x -> x.published_min);
		GapiLens.set = (fun v x -> { x with published_min = v })
	}
	let published_max = {
		GapiLens.get = (fun x -> x.published_max);
		GapiLens.set = (fun v x -> { x with published_max = v })
	}
	let q = {
		GapiLens.get = (fun x -> x.q);
		GapiLens.set = (fun v x -> { x with q = v })
	}
	let start_index = {
		GapiLens.get = (fun x -> x.start_index);
		GapiLens.set = (fun v x -> { x with start_index = v })
	}
	let strict = {
		GapiLens.get = (fun x -> x.strict);
		GapiLens.set = (fun v x -> { x with strict = v })
	}
	let updated_min = {
		GapiLens.get = (fun x -> x.updated_min);
		GapiLens.set = (fun v x -> { x with updated_min = v })
	}
	let updated_max = {
		GapiLens.get = (fun x -> x.updated_max);
		GapiLens.set = (fun v x -> { x with updated_max = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let title_exact = {
		GapiLens.get = (fun x -> x.title_exact);
		GapiLens.set = (fun v x -> { x with title_exact = v })
	}
	let opened_min = {
		GapiLens.get = (fun x -> x.opened_min);
		GapiLens.set = (fun v x -> { x with opened_min = v })
	}
	let opened_max = {
		GapiLens.get = (fun x -> x.opened_max);
		GapiLens.set = (fun v x -> { x with opened_max = v })
	}
	let edited_min = {
		GapiLens.get = (fun x -> x.edited_min);
		GapiLens.set = (fun v x -> { x with edited_min = v })
	}
	let edited_max = {
		GapiLens.get = (fun x -> x.edited_max);
		GapiLens.set = (fun v x -> { x with edited_max = v })
	}
	let owner = {
		GapiLens.get = (fun x -> x.owner);
		GapiLens.set = (fun v x -> { x with owner = v })
	}
	let writer = {
		GapiLens.get = (fun x -> x.writer);
		GapiLens.set = (fun v x -> { x with writer = v })
	}
	let reader = {
		GapiLens.get = (fun x -> x.reader);
		GapiLens.set = (fun v x -> { x with reader = v })
	}
	let showfolders = {
		GapiLens.get = (fun x -> x.showfolders);
		GapiLens.set = (fun v x -> { x with showfolders = v })
	}
	let showdeleted = {
		GapiLens.get = (fun x -> x.showdeleted);
		GapiLens.set = (fun v x -> { x with showdeleted = v })
	}
	let showroot = {
		GapiLens.get = (fun x -> x.showroot);
		GapiLens.set = (fun v x -> { x with showroot = v })
	}
	let ocr = {
		GapiLens.get = (fun x -> x.ocr);
		GapiLens.set = (fun v x -> { x with ocr = v })
	}
	let ocr_language = {
		GapiLens.get = (fun x -> x.ocr_language);
		GapiLens.set = (fun v x -> { x with ocr_language = v })
	}
	let targetLanguage = {
		GapiLens.get = (fun x -> x.targetLanguage);
		GapiLens.set = (fun v x -> { x with targetLanguage = v })
	}
	let sourceLanguage = {
		GapiLens.get = (fun x -> x.sourceLanguage);
		GapiLens.set = (fun v x -> { x with sourceLanguage = v })
	}
	let delete = {
		GapiLens.get = (fun x -> x.delete);
		GapiLens.set = (fun v x -> { x with delete = v })
	}
	let convert = {
		GapiLens.get = (fun x -> x.convert);
		GapiLens.set = (fun v x -> { x with convert = v })
	}
	let remaining_changestamps_first = {
		GapiLens.get = (fun x -> x.remaining_changestamps_first);
		GapiLens.set = (fun v x -> { x with remaining_changestamps_first = v })
	}
	let remaining_changestamps_limit = {
		GapiLens.get = (fun x -> x.remaining_changestamps_limit);
		GapiLens.set = (fun v x -> { x with remaining_changestamps_limit = v })
	}
	let expand_acl = {
		GapiLens.get = (fun x -> x.expand_acl);
		GapiLens.set = (fun v x -> { x with expand_acl = v })
	}
	let format = {
		GapiLens.get = (fun x -> x.format);
		GapiLens.set = (fun v x -> { x with format = v })
	}
	let exportFormat = {
		GapiLens.get = (fun x -> x.exportFormat);
		GapiLens.set = (fun v x -> { x with exportFormat = v })
	}
	let gid = {
		GapiLens.get = (fun x -> x.gid);
		GapiLens.set = (fun v x -> { x with gid = v })
	}
	let new_revision = {
		GapiLens.get = (fun x -> x.new_revision);
		GapiLens.set = (fun v x -> { x with new_revision = v })
	}
	let send_notification_emails = {
		GapiLens.get = (fun x -> x.send_notification_emails);
		GapiLens.set = (fun v x -> { x with send_notification_emails = v })
	}
	let include_profile_info = {
		GapiLens.get = (fun x -> x.include_profile_info);
		GapiLens.set = (fun v x -> { x with include_profile_info = v })
	}

  let default = {
    author = "";
    category = "";
    fields = "";
    max_results = 0;
    prettyprint = false;
    published_min = GapiDate.epoch;
    published_max = GapiDate.epoch;
    q = "";
    start_index = 0;
    strict = false;
    updated_min = GapiDate.epoch;
    updated_max = GapiDate.epoch;
    title = "";
    title_exact = "";
    opened_min = GapiDate.epoch;
    opened_max = GapiDate.epoch;
    edited_min = GapiDate.epoch;
    edited_max = GapiDate.epoch;
    owner = "";
    writer = "";
    reader = "";
    showfolders = false;
    showdeleted = false;
    showroot = false;
    ocr = false;
    ocr_language = "";
    targetLanguage = "";
    sourceLanguage = "";
    delete = false;
    convert = true;
    remaining_changestamps_first = 0;
    remaining_changestamps_limit = 0;
    expand_acl = false;
    format = "";
    exportFormat = "";
    gid = "";
    new_revision = false;
    send_notification_emails = true;
    include_profile_info = false;
  }

  let to_key_value_list qp =
    let param get to_string name =
      let value = get qp in
        if value <> get default then
          [(name, to_string value)]
        else
          []
    in
      [param (fun p -> p.author) Std.identity "author";
       param (fun p -> p.category) Std.identity "category";
       param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.max_results) string_of_int "max-results";
       param (fun p -> p.prettyprint) string_of_bool "prettyprint";
       param (fun p -> p.published_min) GapiDate.to_string "published-min";
       param (fun p -> p.published_max) GapiDate.to_string "published-max";
       param (fun p -> p.q) Std.identity "q";
       param (fun p -> p.start_index) string_of_int "start-index";
       param (fun p -> p.strict) string_of_bool "strict";
       param (fun p -> p.updated_min) GapiDate.to_string "updated-min";
       param (fun p -> p.updated_max) GapiDate.to_string "updated-max";
       param (fun p -> p.title) Std.identity "title";
       param (fun p -> p.title_exact) Std.identity "title-exact";
       param (fun p -> p.opened_min) GapiDate.to_string "opened-min";
       param (fun p -> p.opened_max) GapiDate.to_string "opened-max";
       param (fun p -> p.edited_min) GapiDate.to_string "edited-min";
       param (fun p -> p.edited_max) GapiDate.to_string "edited-max";
       param (fun p -> p.owner) Std.identity "owner";
       param (fun p -> p.writer) Std.identity "writer";
       param (fun p -> p.reader) Std.identity "reader";
       param (fun p -> p.showfolders) string_of_bool "showfolders";
       param (fun p -> p.showdeleted) string_of_bool "showdeleted";
       param (fun p -> p.showroot) string_of_bool "showroot";
       param (fun p -> p.ocr) string_of_bool "ocr";
       param (fun p -> p.ocr_language) Std.identity "ocr-language";
       param (fun p -> p.targetLanguage) Std.identity "targetLanguage";
       param (fun p -> p.sourceLanguage) Std.identity "sourceLanguage";
       param (fun p -> p.delete) string_of_bool "delete";
       param (fun p -> p.convert) string_of_bool "convert";
       param (fun p -> p.remaining_changestamps_first) string_of_int "remaining-changestamps-first";
       param (fun p -> p.remaining_changestamps_limit) string_of_int "remaining-changestamps-limit";
       param (fun p -> p.expand_acl) string_of_bool "expand-acl";
       param (fun p -> p.format) Std.identity "format";
       param (fun p -> p.exportFormat) Std.identity "exportFormat";
       param (fun p -> p.gid) Std.identity "gid";
       param (fun p -> p.new_revision) string_of_bool "new-revision";
       param (fun p -> p.send_notification_emails) string_of_bool "send-notification-emails";
       param (fun p -> p.include_profile_info) string_of_bool "include-profile-info"]
      |> List.concat

  let to_query_parameters =
    Option.map to_key_value_list

  let merge_parameters
      ?(author = default.author)
      ?(category = default.category)
      ?(fields = default.fields)
      ?(max_results = default.max_results)
      ?(prettyprint = default.prettyprint)
      ?(published_min = default.published_min)
      ?(published_max = default.published_max)
      ?(q = default.q)
      ?(start_index = default.start_index)
      ?(strict = default.strict)
      ?(updated_min = default.updated_min)
      ?(updated_max = default.updated_max)
      ?(title = default.title)
      ?(title_exact = default.title_exact)
      ?(opened_min = default.opened_min)
      ?(opened_max = default.opened_max)
      ?(edited_min = default.edited_min)
      ?(edited_max = default.edited_max)
      ?(owner = default.owner)
      ?(writer = default.writer)
      ?(reader = default.reader)
      ?(showfolders = default.showfolders)
      ?(showdeleted = default.showdeleted)
      ?(showroot = default.showroot)
      ?(ocr = default.ocr)
      ?(ocr_language = default.ocr_language)
      ?(targetLanguage = default.targetLanguage)
      ?(sourceLanguage = default.sourceLanguage)
      ?(delete = default.delete)
      ?(convert = default.convert)
      ?(remaining_changestamps_first = default.remaining_changestamps_first)
      ?(remaining_changestamps_limit = default.remaining_changestamps_limit)
      ?(expand_acl = default.expand_acl)
      ?(format = default.format)
      ?(exportFormat = default.exportFormat)
      ?(gid = default.gid)
      ?(new_revision = default.new_revision)
      ?(send_notification_emails = default.send_notification_emails)
      ?(include_profile_info = default.include_profile_info)
      () =
    let parameters = {
      author;
      category;
      fields;
      max_results;
      prettyprint;
      published_min;
      published_max;
      q;
      start_index;
      strict;
      updated_min;
      updated_max;
      title;
      title_exact;
      opened_min;
      opened_max;
      edited_min;
      edited_max;
      owner;
      writer;
      reader;
      showfolders;
      showdeleted;
      showroot;
      ocr;
      ocr_language;
      targetLanguage;
      sourceLanguage;
      delete;
      convert;
      remaining_changestamps_first;
      remaining_changestamps_limit;
      expand_acl;
      format;
      exportFormat;
      gid;
      new_revision;
      send_notification_emails;
      include_profile_info;
    } in
    if parameters = default then None else Some parameters

end

let version = "3.0"

let feed_scope = "https://docs.google.com/feeds/"
let docs_scope = "https://docs.googleusercontent.com/"
let spreadsheets_scope = "https://spreadsheets.google.com/feeds/"
let all_scopes = feed_scope ^ " " ^ docs_scope ^ " " ^ spreadsheets_scope

let get_url ?(rel = `Edit) links_lens entry =
  entry |. links_lens |> GdataAtom.find_url rel

let get_etag etag_lens entry =
  entry |. etag_lens |> GdataUtils.string_to_option

let get_url_etag_document ?rel entry =
  let url = get_url Document.Entry.links ?rel entry in
  let etag = get_etag Document.Entry.etag entry in
    (url, etag)

let parse_documents_feed =
  GdataUtils.parse_xml_response Document.parse_feed

let parse_document_entry =
  GdataUtils.parse_xml_response Document.parse_entry

let parse_metadata_entry =
  GdataUtils.parse_xml_response Metadata.parse_entry

let parse_revisions_feed =
  GdataUtils.parse_xml_response Revision.parse_feed

(* Upload *)
let resumable_upload
      ?(convert = false)
      ?ocr
      ?ocr_language
      ?sourceLanguage
      ?targetLanguage
      ?new_revision
      url
      media_source
      session =
  let query_parameters =
    QueryParameters.merge_parameters ~convert ?ocr ?ocr_language
        ?sourceLanguage ?targetLanguage ?new_revision ()
      |> Option.map QueryParameters.to_key_value_list
  in
    GapiService.service_request
      ~media_source
      ~version
      ~request_type:GapiRequest.Create
      ?query_parameters
      url
      parse_document_entry
      session

(* Download *)
let download_resource
      ?query_parameters
      ?ranges
      url
      media_destination
      session =
  let range_spec =
    Option.map_default GapiMediaResource.generate_range_spec "" ranges in
  let media_download = {
    GapiMediaResource.destination = media_destination;
    range_spec;
  } in
    GapiService.service_request
      ?query_parameters
      ~media_download
      ~version
      ~request_type:GapiRequest.Query
      url
      GapiRequest.parse_empty_response
      session

let partial_download
      ?ranges
      url
      media_destination
      session =
  download_resource
    ?ranges
    url
    media_destination
    session

let download_content
      ?format
      ?gid
      content
      media_destination
      session =
  let url = content |. GdataAtom.Content.src in
  let query_parameters =
    QueryParameters.merge_parameters ?format ?exportFormat:format ?gid ()
      |> Option.map QueryParameters.to_key_value_list
  in
    download_resource
      ?query_parameters
      url
      media_destination
      session

(* Metadata *)
let query_metadata
      ?(url = "https://docs.google.com/feeds/metadata/default")
      ?etag
      ?parameters
      session =
  let query_parameters = QueryParameters.to_query_parameters parameters in
    GdataService.query
      ~version
      ?etag
      ?query_parameters
      url
      parse_metadata_entry
      session

(* Changes *)
let query_changes
      ?(url = "https://docs.google.com/feeds/default/private/changes")
      ?etag
      ?parameters
      session =
  let query_parameters = QueryParameters.to_query_parameters parameters in
    GdataService.query
      ~version
      ?etag
      ?query_parameters
      url
      parse_documents_feed
      session

(* Documents *)
let documents_base_url = "https://docs.google.com/feeds/default/private/full"

let query_documents_list
      ?(url = documents_base_url)
      ?etag
      ?parameters
      session =
  let query_parameters = QueryParameters.to_query_parameters parameters in
    GdataService.query
      ~version
      ?etag
      ?query_parameters
      url
      parse_documents_feed
      session

let refresh_document
      entry
      session =
  let (url, etag) = get_url_etag_document ~rel:`Self entry in
    GdataService.read
      ~version
      ?etag
      entry
      url
      parse_document_entry
      session

let create_document
      ?parameters
      ?media_source
      feed
      entry
      session =
  let query_parameters = QueryParameters.to_query_parameters parameters in
  let url =
    feed |. Document.Feed.links |> find_url `ResumableCreateMedia
  in
    GdataService.create
      Document.entry_to_data_model 
      ~version
      ?query_parameters
      ?media_source
      entry
      url
      parse_document_entry
      session

let copy_document
      ?(url = documents_base_url)
      entry
      session =
  let id = entry |. Document.Entry.id in
  let resourceId = entry |. Document.Entry.resourceId in
  let entry' = entry
    |> Document.Entry.id ^= id
    |> Document.Entry.resourceId ^= resourceId
  in
    GdataService.create
      Document.entry_to_data_model 
      ~version
      entry'
      url
      parse_document_entry
      session

let update_document
      entry
      session =
  let (url, etag) = get_url_etag_document entry in
    GdataService.update
      Document.entry_to_data_model
      ~version
      ?etag
      entry
      url
      parse_document_entry
      session

let patch_document
      entry
      session =
  let (url, etag) = get_url_etag_document entry in
    GdataService.patch
      Document.entry_to_data_model
      ~version
      ?etag
      entry
      url
      parse_document_entry
      session

let download_document
      ?format
      ?gid
      entry
      media_destination
      session =
  let content = entry
    |. Document.Entry.content
  in
    download_content
      ?format
      ?gid
      content
      media_destination
      session

let delete_document
      ?delete
      entry
      session =
  let (url, etag) = get_url_etag_document entry in
  let query_parameters =
    QueryParameters.merge_parameters ?delete ()
      |> Option.map QueryParameters.to_key_value_list
  in
    GdataService.delete
      ~version
      ?etag
      ?query_parameters
      url
      session

let documents_batch_request
      target_feed
      batch_feed
      session =
  let url = target_feed |. Document.Feed.links |> find_url `Batch in
    GdataService.batch_request
      Document.feed_to_data_model
      ~version
      batch_feed
      url
      parse_documents_feed
      session

(* Revisions *)
let query_revisions
      ?etag
      ?parameters
      entry
      session =
  let url = entry.Document.Entry.revisionsFeedLink.RevisionsFeedLink.href in
  let query_parameters = QueryParameters.to_query_parameters parameters in
    GdataService.query
      ~version
      ?etag
      ?query_parameters
      url
      parse_revisions_feed
      session

let download_revision
      ?format
      ?gid
      entry
      media_destination
      session =
  let content = entry |. Revision.Entry.content in
    download_content
      ?format
      ?gid
      content
      media_destination
      session

      (*
let update_revision
      entry
      session =
  let url = get_url Revision.Entry.links entry in
    GdataService.update
      Revision.revisions_entry_to_data_model
      ~version
      ?etag
      entry
      url
      parse_revision_entry
      session

let patch_revision
      entry
      session =
  let url = get_url Revision.Entry.links entry in
    GdataService.patch
      Revision.revisions_entry_to_data_model
      ~version
      ?etag
      entry
      url
      parse_revision_entry
      session
       *)

let delete_revision
      entry
      session =
  let url = get_url Revision.Entry.links entry in
    GdataService.delete
      ~version
      url
      session

(* Folders *)
let root_folder_id = "folder:root"

let build_folder_contents_url
      ?(base_url = documents_base_url)
      folder_id =
  GapiUtils.add_path_to_url ~encoded:false [folder_id; "contents"] base_url

let query_folder_contents
      ?base_url
      ?etag
      ?parameters
      folder_id
      session =
  let url = build_folder_contents_url ?base_url folder_id in
  let query_parameters = QueryParameters.to_query_parameters parameters in
    GdataService.query
      ~version
      ?etag
      ?query_parameters
      url
      parse_documents_feed
      session

let create_subfolder
      ?base_url
      ?etag
      parent_folder_id
      entry
      session =
  let url = build_folder_contents_url ?base_url parent_folder_id in
    GdataService.create
      Document.entry_to_data_model 
      ~version
      entry
      url
      parse_document_entry
      session

let add_to_folder
      ?base_url
      ?etag
      parent_folder_id
      entry
      session =
  let url = build_folder_contents_url ?base_url parent_folder_id in
    GdataService.create
      Document.entry_to_data_model 
      ~version
      entry
      url
      parse_document_entry
      session

(* ACL *)
let get_acl
      ?etag
      entry
      session =
  let url = entry.Document.Entry.aclFeedLink.AclFeedLink.href in
    GdataACLService.get_acl
      ~version
      ?etag
      url
      session

let refresh_acl
      entry
      session =
  GdataACLService.refresh_acl
    ~version
    entry
    session

let create_acl
      ~send_notification_emails
      acl_entry
      document_entry
      session =
  let url = document_entry |. Document.Entry.links |> find_url `Acl in
  let query_parameters =
    QueryParameters.merge_parameters ~send_notification_emails ()
      |> Option.map QueryParameters.to_key_value_list
  in
    GdataACLService.create_acl
      ~version
      ?query_parameters
      acl_entry
      url
      session

let update_acl
      entry
      session =
  GdataACLService.update_acl
    ~version
    entry
    session

let delete_acl
      entry
      session =
  GdataACLService.delete_acl
    ~version
    entry
    session

let acl_batch_request
      target_feed
      batch_feed
      session =
  GdataACLService.acl_batch_request
    ~version
    target_feed
    batch_feed
    session

