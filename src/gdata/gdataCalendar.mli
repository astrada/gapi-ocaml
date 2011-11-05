val ns_gCal : string

type calendar_accessLevelProperty = string

type calendar_webContentGadgetPref = {
  wcgp_name : string;
  wcgp_value : string
}

val empty_webContentGadgetPref : calendar_webContentGadgetPref

type calendar_webContent = {
  wc_height : int;
  wc_url : string;
  wc_width : int;
  wc_webContentGadgetPrefs : calendar_webContentGadgetPref list
}

val empty_webContent : calendar_webContent

type calendar_calendarLink = {
  cl_href : string;
  cl_length : Int64.t;
  cl_rel : string;
  cl_title : string;
  cl_type : string;
  cl_webContent : calendar_webContent
}

val empty_link : calendar_calendarLink

type calendar_calendarWhere = string

type calendar_colorProperty = string

type calendar_hiddenProperty = bool

type calendar_overrideNameProperty = string

type calendar_selectedProperty = bool

type calendar_timeZoneProperty = string

type calendar_timesCleanedProperty = int

type gdata_attendeeStatus = string

type calendar_resourceProperty = {
  rp_id : string;
  rp_value : bool
}

val empty_resourceProperty : calendar_resourceProperty

type calendar_calendarWho = {
  cw_email : string;
  cw_rel : string;
  cw_value : string;
  cw_resource : calendar_resourceProperty;
  cw_attendeeStatus : gdata_attendeeStatus
}

val empty_who : calendar_calendarWho

type gdata_kind = {
  k_scheme : string;
  k_term : string
}

val eventKind : gdata_kind

type gdata_eventStatus = string

type calendar_icalUIDProperty = string

type gdata_reminder = {
  r_absoluteTime : GdataDate.t;
  r_days : int;
  r_hours : int;
  r_method : string;
  r_minutes : int
}

val empty_reminder : gdata_reminder

type gdata_when = {
  w_endTime : GdataDate.t;
  w_startTime : GdataDate.t;
  w_value : string;
  w_reminders : gdata_reminder list
}

val empty_when : gdata_when

type gdata_originalEvent = {
  oe_href : string;
  oe_id : string;
  oe_when : gdata_when
}

val empty_originalEvent : gdata_originalEvent

type calendar_privateCopyProperty = bool

type calendar_quickAddProperty = bool

type gdata_recurrence = string

type calendar_sendEventNotificationsProperty = bool

type calendar_sequenceNumberProperty = int

type calendar_syncEventProperty = bool

type gdata_transparency = string

type gdata_visibility = string

type calendar_calendarExtendedProperty = {
  cep_name : string;
  cep_realm : string;
  cep_value : string
}

val empty_extendedProperty : calendar_calendarExtendedProperty

type calendar_calendarEntry = {
  ce_etag : string;
  ce_authors : GdataAtom.atom_author list;
  ce_categories : GdataAtom.atom_category list;
  ce_contributors : GdataAtom.atom_contributor list;
  ce_id : GdataAtom.atom_id;
  ce_content : GdataAtom.atom_content;
  ce_published : GdataAtom.atom_published;
  ce_updated : GdataAtom.atom_updated;
  ce_edited : GdataAtom.app_edited;
  ce_accesslevel : calendar_accessLevelProperty;
  ce_links : calendar_calendarLink list;
  ce_where : calendar_calendarWhere list;
  ce_color : calendar_colorProperty;
  ce_hidden : calendar_hiddenProperty;
  ce_overridename : calendar_overrideNameProperty;
  ce_selected : calendar_selectedProperty;
  ce_timezone : calendar_timeZoneProperty;
  ce_timesCleaned : calendar_timesCleanedProperty;
  ce_summary : GdataAtom.atom_textConstruct;
  ce_title : GdataAtom.atom_textConstruct;
  ce_extensions : GdataCore.xml_data_model list
}

val empty_entry : calendar_calendarEntry

val parse_link :
  calendar_calendarLink ->
  GdataCore.xml_data_model ->
  calendar_calendarLink

val parse_where :
  calendar_calendarWhere ->
  GdataCore.xml_data_model ->
  calendar_calendarWhere

val parse_extendedProperty :
  calendar_calendarExtendedProperty ->
  GdataCore.xml_data_model ->
  calendar_calendarExtendedProperty

val parse_resourceProperty :
  calendar_resourceProperty ->
  GdataCore.xml_data_model ->
  calendar_resourceProperty

val parse_attendeeStatus :
  gdata_attendeeStatus ->
  GdataCore.xml_data_model ->
  gdata_attendeeStatus

val parse_who :
  calendar_calendarWho ->
  GdataCore.xml_data_model ->
  calendar_calendarWho

val parse_reminder :
  gdata_reminder ->
  GdataCore.xml_data_model ->
  gdata_reminder

val parse_when :
  gdata_when ->
  GdataCore.xml_data_model ->
  gdata_when

val parse_originalEvent :
  gdata_originalEvent ->
  GdataCore.xml_data_model ->
  gdata_originalEvent

val parse_calendar_entry :
  GdataCore.xml_data_model ->
  calendar_calendarEntry

val render_link :
  calendar_calendarLink ->
  GdataCore.xml_data_model list

val render_where :
  calendar_calendarWhere ->
  GdataCore.xml_data_model list

val render_extendedProperty :
  calendar_calendarExtendedProperty ->
  GdataCore.xml_data_model list

val render_resourceProperty :
  calendar_resourceProperty ->
  GdataCore.xml_data_model list

val render_attendeeStatus :
  gdata_attendeeStatus ->
  GdataCore.xml_data_model list

val render_who :
  calendar_calendarWho ->
  GdataCore.xml_data_model list

val render_reminder :
  gdata_reminder ->
  GdataCore.xml_data_model list

val render_when :
  gdata_when ->
  GdataCore.xml_data_model list

val render_originalEvent :
  gdata_originalEvent ->
  GdataCore.xml_data_model list

val calendar_entry_to_data_model :
  calendar_calendarEntry ->
  GdataCore.xml_data_model

val parse_personal_settings :
  GdataCore.xml_data_model ->
  (string, string) Hashtbl.t

module Rel :
sig
  type t =
      Self
    | Alternate
    | Edit
    | Feed
    | Post
    | Batch
    | EventFeed
    | Acl

  val to_string : t -> string

end

val find_url : Rel.t -> calendar_calendarLink list -> string

module Link :
sig
  type t = calendar_calendarLink

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Entry :
sig
  type t = calendar_calendarEntry

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Feed :
sig
  type t = GdataAtom.MakeFeed(Entry)(Link).t = {
    f_etag : string;
    f_kind : string;
    f_authors : GdataAtom.atom_author list;
    f_categories : GdataAtom.atom_category list;
    f_contributors : GdataAtom.atom_contributor list;
    f_generator : GdataAtom.atom_generator;
    f_icon : GdataAtom.atom_icon;
    f_id : GdataAtom.atom_id;
    f_updated : GdataAtom.atom_updated;
    f_entries : Entry.t list;
    f_links : Link.t list;
    f_logo : GdataAtom.atom_logo;
    f_rights : GdataAtom.atom_textConstruct;
    f_subtitle : GdataAtom.atom_textConstruct;
    f_title : GdataAtom.atom_textConstruct;
    f_totalResults : GdataAtom.opensearch_totalResults;
    f_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
    f_startIndex : GdataAtom.opensearch_startIndex;
    f_extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val parse_feed : GdataCore.xml_data_model -> t

end

module Comments :
sig
  type commentEntry =
      GdataComments.Make(Link).commentEntry = {
        ce_etag : string;
        ce_authors : GdataAtom.atom_author list;
        ce_content : GdataAtom.atom_content;
        ce_contributors : GdataAtom.atom_contributor list;
        ce_id : GdataAtom.atom_id;
        ce_published : GdataAtom.atom_published;
        ce_updated : GdataAtom.atom_updated;
        ce_links : Link.t list;
        ce_title : GdataAtom.atom_textConstruct;
        ce_category : GdataAtom.atom_category;
        ce_extensions : GdataCore.xml_data_model list
      }

  val empty_commentEntry : commentEntry

  type commentFeed =
      GdataComments.Make(Link).commentFeed = {
        cf_etag : string;
        cf_authors : GdataAtom.atom_author list;
        cf_contributors : GdataAtom.atom_contributor list;
        cf_generator : GdataAtom.atom_generator;
        cf_id : GdataAtom.atom_id;
        cf_updated : GdataAtom.atom_updated;
        cf_entries : commentEntry list;
        cf_links : Link.t list;
        cf_title : GdataAtom.atom_textConstruct;
        cf_category : GdataAtom.atom_category;
        cf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
        cf_startIndex : GdataAtom.opensearch_startIndex;
        cf_totalResults : GdataAtom.opensearch_totalResults;
        cf_extensions : GdataCore.xml_data_model list
      }

  val empty_commentFeed : commentFeed

  type comments =
      GdataComments.Make(Link).comments = {
        c_countHint : int;
        c_href : string;
        c_readOnly : bool;
        c_rel : string;
        c_commentFeed : commentFeed;
      }

  val empty_comments : comments

  val parse_comments :
    comments ->
    GdataCore.xml_data_model ->
    comments

  val parse_comment_feed :
    GdataCore.xml_data_model ->
    commentFeed

  val parse_comment_entry :
    GdataCore.xml_data_model ->
    commentEntry

  val render_comments :
    comments ->
    GdataCore.xml_data_model list

end

