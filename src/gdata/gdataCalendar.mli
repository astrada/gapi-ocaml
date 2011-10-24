val ns_gCal : string
val ns_gd : string
val ns_acl : string

type calendar_accessLevelProperty = string

type calendar_webContentGadgetPref =
    { wcgp_name : string;
      wcgp_value : string }

val empty_webContentGadgetPref : calendar_webContentGadgetPref

type calendar_webContent =
  { wc_height : int;
    wc_url : string;
    wc_width : int;
    wc_webContentGadgetPrefs : calendar_webContentGadgetPref list }

val empty_webContent : calendar_webContent

type calendar_calendarLink =
  { cl_href : string;
    cl_length : Int64.t;
    cl_rel : string;
    cl_title : string;
    cl_type : string;
    cl_webContent : calendar_webContent }

val empty_link : calendar_calendarLink

type calendar_calendarWhere = string

type calendar_colorProperty = string

type calendar_hiddenProperty = bool

type calendar_overrideNameProperty = string

type calendar_selectedProperty = bool

type calendar_timeZoneProperty = string

type calendar_timesCleanedProperty = int

type calendar_calendarEntry =
    { ce_etag : string;
      ce_kind : string;
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
      ce_extensions :
        (GdataCore.Metadata.xml,
         GdataCore.Value.t) GdataCore.AnnotatedTree.t list }

val empty_entry : calendar_calendarEntry

type calendar_calendarFeed =
  { cf_etag : string;
    cf_kind : string;
    cf_authors : GdataAtom.atom_author list;
    cf_categories : GdataAtom.atom_category list;
    cf_contributors : GdataAtom.atom_contributor list;
    cf_generator : GdataAtom.atom_generator;
    cf_id : GdataAtom.atom_id;
    cf_updated : GdataAtom.atom_updated;
    cf_entries : calendar_calendarEntry list;
    cf_links : calendar_calendarLink list;
    cf_title : GdataAtom.atom_textConstruct;
    cf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
    cf_startIndex : GdataAtom.opensearch_startIndex }

val empty_feed : calendar_calendarFeed

val parse_link :
  calendar_calendarLink ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarLink

val parse_where :
  calendar_calendarWhere ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarWhere

val parse_calendar_feed :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarFeed

val parse_calendar_entry :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarEntry

val render_link :
  calendar_calendarLink ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_where :
  calendar_calendarWhere ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val calendar_entry_to_data_model :
  calendar_calendarEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

val parse_personal_settings :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
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

