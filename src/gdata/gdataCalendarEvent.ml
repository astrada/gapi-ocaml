open GdataUtils.Op

(* Calendar data types *)
(* TODO: refactor: put namespaces in a common module *)
let ns_atom = "http://www.w3.org/2005/Atom"
let ns_app = "http://www.w3.org/2007/app"
let ns_openSearch = "http://a9.com/-/spec/opensearch/1.1/"
let ns_gCal = "http://schemas.google.com/gCal/2005"
let ns_gd = "http://schemas.google.com/g/2005"
let ns_acl = "http://schemas.google.com/acl/2007"

type gdata_attendeeStatus = string

type calendar_resourceProperty = {
  rp_id : string;
  rp_value : bool
}

let empty_resourceProperty = {
  rp_id = "";
  rp_value = false
}

type calendar_calendarWho = {
  cw_email : string;
  cw_rel : string;
  cw_value : string;
  cw_resource : calendar_resourceProperty;
  cw_attendeeStatus : gdata_attendeeStatus
}

let empty_calendarWho = {
  cw_email = "";
  cw_rel = "";
  cw_value = "";
  cw_resource = empty_resourceProperty;
  cw_attendeeStatus = ""
}

type gdata_kind = {
  k_scheme : string;
  k_term : string
}

let eventKind = {
  k_scheme = "http://schemas.google.com/g/2005#kind";
  k_term = "http://schemas.google.com/g/2005#event"
}

let messageKind = {
  k_scheme = "http://schemas.google.com/g/2005#kind";
  k_term = "http://schemas.google.com/g/2005#message";
}

type gdata_eventStatus = string

type calendar_icalUIDProperty = string

type gdata_reminder = {
  r_absoluteTime : string; (* TODO ( xsd:date | xsd:dateTime) *)
  r_days : int;
  r_hours : int;
  r_method : string;
  r_minutes : int
}

let empty_reminder = {
  r_absoluteTime = "";
  r_days = 0;
  r_hours = 0;
  r_method = "";
  r_minutes = 0
}

type gdata_when = {
  w_endTime : string; (* TODO xsd:date | xsd:dateTime *)
  w_startTime : string; (* TODO xsd:date | xsd:dateTime *)
  w_value : string;
  w_reminders : gdata_reminder list
}

let empty_when = {
  w_endTime = "";
  w_startTime = "";
  w_value = "";
  w_reminders = []
}

type gdata_originalEvent = {
  oe_href : string;
  oe_id : string;
  oe_when : gdata_when
}

let empty_originalEvent = {
  oe_href = "";
  oe_id = "";
  oe_when = empty_when
}

type calendar_privateCopyProperty = bool

type calendar_quickAddProperty = bool

type gdata_recurrence = string

type calendar_sendEventNotificationsProperty = bool

type calendar_sequenceNumberProperty = int

type calendar_syncEventProperty = bool

type gdata_transparency = string

type gdata_visibility = string

type calendar_calendarCommentEntry = {
  cce_etag : string;
  cce_authors : GdataAtom.atom_author list;
  cce_content : GdataAtom.atom_outOfLineContent;
  cce_contributors : GdataAtom.atom_contributor list;
  cce_id : GdataAtom.atom_id;
  cce_published : GdataAtom.atom_published;
  cce_updated : GdataAtom.atom_updated;
  cce_links : GdataCalendar.calendar_calendarLink list;
  cce_title : GdataAtom.atom_textConstruct;
  cce_messageKind : gdata_kind;
  cce_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_commentEntry = {
  cce_etag = "";
  cce_authors = [];
  cce_content = GdataAtom.empty_content;
  cce_contributors = [];
  cce_id = "";
  cce_published = "";
  cce_updated = "";
  cce_links = [];
  cce_title = GdataAtom.empty_text;
  cce_messageKind = messageKind;
  cce_extensions = []
}

type calendar_calendarCommentFeed = {
  ccf_etag : string;
  ccf_authors : GdataAtom.atom_author list;
  ccf_contributors : GdataAtom.atom_contributor list;
  ccf_generator : GdataAtom.atom_generator;
  ccf_id : GdataAtom.atom_id;
  ccf_updated : GdataAtom.atom_updated;
  ccf_entries : calendar_calendarCommentEntry list;
  ccf_links : GdataCalendar.calendar_calendarLink list;
  ccf_title : GdataAtom.atom_textConstruct;
  ccf_messageKind : gdata_kind;
  ccf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  ccf_startIndex : GdataAtom.opensearch_startIndex;
  ccf_totalResults : GdataAtom.opensearch_totalResults;
  ccf_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_commentFeed = {
  ccf_etag = "";
  ccf_authors = [];
  ccf_contributors = [];
  ccf_generator = GdataAtom.empty_generator;
  ccf_id = "";
  ccf_updated = "";
  ccf_entries = [];
  ccf_links = [];
  ccf_title = GdataAtom.empty_text;
  ccf_messageKind = messageKind;
  ccf_itemsPerPage = 0;
  ccf_startIndex = 0;
  ccf_totalResults = 0;
  ccf_extensions = []
}

type calendar_calendarComments = {
  cc_countHint : int;
  cc_href : string;
  cc_readOnly : bool;
  cc_rel : string;
  cc_commentFeed : calendar_calendarCommentFeed
}

let empty_comments = {
  cc_countHint = 0;
  cc_href = "";
  cc_readOnly = false;
  cc_rel = "";
  cc_commentFeed = empty_commentFeed
}

type calendar_calendarRecurrenceExceptionEntry = {
  cree_etag : string;
  cree_authors : GdataAtom.atom_author list;
  cree_categories : GdataAtom.atom_category list;
  cree_content : GdataAtom.atom_outOfLineContent;
  cree_contributors : GdataAtom.atom_contributor list;
  cree_id : GdataAtom.atom_id;
  cree_published : GdataAtom.atom_published;
  cree_updated : GdataAtom.atom_updated;
  cree_comments : calendar_calendarComments;
  cree_links : GdataCalendar.calendar_calendarLink list;
  cree_where : GdataCalendar.calendar_calendarWhere list;
  cree_who : calendar_calendarWho list;
  cree_icalUID : calendar_icalUIDProperty;
  cree_sequenceNumber : calendar_sequenceNumberProperty;
  cree_title : GdataAtom.atom_textConstruct;
  cree_eventStatus : gdata_eventStatus;
  cree_orginalEvent : gdata_originalEvent;
  cree_transparency : gdata_transparency;
  cree_visibility : gdata_visibility;
  cree_when : gdata_when list;
  cree_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_recurrenceExceptionEntry = {
  cree_etag = "";
  cree_authors = [];
  cree_categories = [];
  cree_content = GdataAtom.empty_content;
  cree_contributors = [];
  cree_id = "";
  cree_published = "";
  cree_updated = "";
  cree_comments = empty_comments;
  cree_links = [];
  cree_where = [];
  cree_who = [];
  cree_icalUID = "";
  cree_sequenceNumber = 0;
  cree_title = GdataAtom.empty_text;
  cree_eventStatus = "";
  cree_orginalEvent = empty_originalEvent;
  cree_transparency = "";
  cree_visibility = "";
  cree_when = [];
  cree_extensions = []
}

type calendar_calendarExtendedProperty = {
  cep_name : string;
  cep_realm : string;
  cep_value : string
}

let empty_extendedProperty = {
  cep_name = "";
  cep_realm = "";
  cep_value = ""
}

type calendar_calendarRecurrenceException = {
  cre_specialized : bool;
  cre_entry : calendar_calendarRecurrenceExceptionEntry
}

let empty_recurrenceException = {
  cre_specialized = false;
  cre_entry = empty_recurrenceExceptionEntry
}

type calendar_calendarEventEntry = {
  cee_etag : string;
  cee_authors : GdataAtom.atom_author list;
  cee_content : GdataAtom.atom_outOfLineContent;
  cee_contributors : GdataAtom.atom_contributor list;
  cee_id : GdataAtom.atom_id;
  cee_published : GdataAtom.atom_published;
  cee_updated : GdataAtom.atom_updated;
  cee_comments : calendar_calendarComments;
  cee_ExtendedProperties : calendar_calendarExtendedProperty list;
  cee_links : GdataCalendar.calendar_calendarLink list;
  cee_recurrenceExceptions : calendar_calendarRecurrenceException list;
  cee_where : GdataCalendar.calendar_calendarWhere list;
  cee_who : calendar_calendarWho list;
  cee_icalUID : calendar_icalUIDProperty;
  cee_privateCopy : calendar_privateCopyProperty;
  cee_quickAdd : calendar_quickAddProperty;
  cee_sendEventNotifications : calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : calendar_sequenceNumberProperty;
  cee_syncEvent : calendar_syncEventProperty;
  cee_summary : GdataAtom.atom_textConstruct;
  cee_title : GdataAtom.atom_textConstruct;
  cee_eventKind : gdata_kind;
  cee_eventStatus : gdata_eventStatus;
  cee_originalEvent : gdata_originalEvent;
  cee_recurrence : gdata_recurrence;
  cee_reminders : gdata_reminder list;
  cee_transparency : gdata_transparency;
  cee_visibility : gdata_visibility;
  cee_when : gdata_when list;
  cee_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_eventEntry = {
  cee_etag = "";
  cee_authors = [];
  cee_content = GdataAtom.empty_content;
  cee_contributors = [];
  cee_id = "";
  cee_published = "";
  cee_updated = "";
  cee_comments = empty_comments;
  cee_ExtendedProperties = [];
  cee_links = [];
  cee_recurrenceExceptions = [];
  cee_where = [];
  cee_who = [];
  cee_icalUID = "";
  cee_privateCopy = false;
  cee_quickAdd = false;
  cee_sendEventNotifications = false;
  cee_sequenceNumber = 0;
  cee_syncEvent = false;
  cee_summary = GdataAtom.empty_text;
  cee_title = GdataAtom.empty_text;
  cee_eventKind = eventKind;
  cee_eventStatus = "";
  cee_originalEvent = empty_originalEvent;
  cee_recurrence = "";
  cee_reminders = [];
  cee_transparency = "";
  cee_visibility = "";
  cee_when = [];
  cee_extensions = []
}

type calendar_calendarEventFeed = {
  cef_etag : string;
  cef_authors : GdataAtom.atom_author list;
  cef_contributors : GdataAtom.atom_contributor list;
  cef_generator : GdataAtom.atom_generator;
  cef_id : GdataAtom.atom_id;
  cef_updated : GdataAtom.atom_updated;
  cef_entries : calendar_calendarEventEntry list;
  cef_links : GdataCalendar.calendar_calendarLink list;
  cef_timezone : GdataCalendar.calendar_timeZoneProperty;
  cef_timesCleaned : GdataCalendar.calendar_timesCleanedProperty;
  cef_subtitle : GdataAtom.atom_textConstruct;
  cef_title : GdataAtom.atom_textConstruct;
  cef_eventKind : gdata_kind;
  cef_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  cef_startIndex : GdataAtom.opensearch_startIndex;
  cef_totalResults : GdataAtom.opensearch_totalResults;
  cef_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_eventFeed = {
  cef_etag = "";
  cef_authors = [];
  cef_contributors = [];
  cef_generator = GdataAtom.empty_generator;
  cef_id = "";
  cef_updated = "";
  cef_entries = [];
  cef_links = [];
  cef_timezone = "";
  cef_timesCleaned = 0;
  cef_subtitle = GdataAtom.empty_text;
  cef_title = GdataAtom.empty_text;
  cef_eventKind = eventKind;
  cef_itemsPerPage = 0;
  cef_startIndex = 0;
  cef_totalResults = 0;
  cef_extensions = []
}

