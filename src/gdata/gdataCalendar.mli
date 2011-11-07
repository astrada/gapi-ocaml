val ns_gCal : string

type calendar_accessLevelProperty = string

module WebContentGadgetPref :
sig
  type t = {
    name : string;
    value : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module WebContent :
sig
  type t = {
    height : int;
    url : string;
    width : int;
    webContentGadgetPrefs : WebContentGadgetPref.t list
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

type calendar_calendarWhere = string

type calendar_colorProperty = string

type calendar_hiddenProperty = bool

type calendar_overrideNameProperty = string

type calendar_selectedProperty = bool

type calendar_timeZoneProperty = string

type calendar_timesCleanedProperty = int

type gdata_attendeeStatus = string

module ResourceProperty :
sig
  type t = {
    id : string;
    value : bool
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Who :
sig
  type t = {
    email : string;
    rel : string;
    value : string;
    resource : ResourceProperty.t;
    attendeeStatus : gdata_attendeeStatus
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

type gdata_kind = {
  k_scheme : string;
  k_term : string
}

val eventKind : gdata_kind

type gdata_eventStatus = string

type calendar_icalUIDProperty = string

module Reminder :
sig
  type t = {
    absoluteTime : GdataDate.t;
    days : int;
    hours : int;
    rmethod : string;
    minutes : int
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module When :
sig
  type t = {
    endTime : GdataDate.t;
    startTime : GdataDate.t;
    value : string;
    reminders : Reminder.t list
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

type gdata_originalEvent = {
  oe_href : string;
  oe_id : string;
  oe_when : When.t
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

val parse_where :
  calendar_calendarWhere ->
  GdataCore.xml_data_model ->
  calendar_calendarWhere

val parse_extendedProperty :
  calendar_calendarExtendedProperty ->
  GdataCore.xml_data_model ->
  calendar_calendarExtendedProperty

val parse_originalEvent :
  gdata_originalEvent ->
  GdataCore.xml_data_model ->
  gdata_originalEvent

val get_calendar_prefix : string -> string

val render_where :
  calendar_calendarWhere ->
  GdataCore.xml_data_model list

val render_extendedProperty :
  calendar_calendarExtendedProperty ->
  GdataCore.xml_data_model list

val render_originalEvent :
  gdata_originalEvent ->
  GdataCore.xml_data_model list

module Link :
sig
  type t = {
    href : string;
    length : Int64.t;
    rel : string;
    title : string;
    ltype : string;
    webContent : WebContent.t
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Entry :
sig
  type t = {
    etag : string;
    kind : string;
    authors : GdataAtom.Author.t list;
    categories : GdataAtom.Category.t list;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    content : GdataAtom.Content.t;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    edited : GdataAtom.app_edited;
    accesslevel : calendar_accessLevelProperty;
    links : Link.t list;
    where : calendar_calendarWhere list;
    color : calendar_colorProperty;
    hidden : calendar_hiddenProperty;
    overridename : calendar_overrideNameProperty;
    selected : calendar_selectedProperty;
    timezone : calendar_timeZoneProperty;
    timesCleaned : calendar_timesCleanedProperty;
    summary : GdataAtom.Summary.t;
    title : GdataAtom.Title.t;
    extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

val parse_calendar_entry :
  GdataCore.xml_data_model ->
  Entry.t

val calendar_entry_to_data_model :
  Entry.t ->
  GdataCore.xml_data_model

module Feed :
  GdataAtom.FEED
    with type entry_t = Entry.t
      and type link_t = Link.t

module Comments :
  GdataComments.COMMENTS
    with type link_t = Link.t

val parse_personal_settings :
  GdataCore.xml_data_model ->
  (string, string) Hashtbl.t

module Rel :
sig
  type t =
    [ `EventFeed
    | GdataACL.Rel.t ]

  val to_string : t -> string

end

val find_url : Rel.t -> Link.t list -> string

