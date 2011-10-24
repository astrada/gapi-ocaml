type gdata_attendeeStatus = string

type calendar_resourceProperty =
  { rp_id : string;
    rp_value : bool }

val empty_resourceProperty : calendar_resourceProperty

type calendar_calendarWho =
  { cw_email : string;
    cw_rel : string;
    cw_value : string;
    cw_resource : calendar_resourceProperty;
    cw_attendeeStatus : gdata_attendeeStatus }
    
val empty_who : calendar_calendarWho

type gdata_kind =
  { k_scheme : string;
    k_term : string }

val eventKind : gdata_kind

type gdata_eventStatus = string

type calendar_icalUIDProperty = string

type gdata_reminder =
  { r_absoluteTime : GdataDate.t;
    r_days : int;
    r_hours : int;
    r_method : string;
    r_minutes : int }

val empty_reminder : gdata_reminder

type gdata_when =
  { w_endTime : GdataDate.t;
    w_startTime : GdataDate.t;
    w_value : string;
    w_reminders : gdata_reminder list }

val empty_when : gdata_when

type gdata_originalEvent =
  { oe_href : string;
    oe_id : string;
    oe_when : gdata_when }

val empty_originalEvent : gdata_originalEvent

type calendar_privateCopyProperty = bool

type calendar_quickAddProperty = bool

type gdata_recurrence = string

type calendar_sendEventNotificationsProperty = bool

type calendar_sequenceNumberProperty = int

type calendar_syncEventProperty = bool

type gdata_transparency = string

type gdata_visibility = string

type calendar_calendarRecurrenceExceptionEntry =
  { cree_etag : string;
    cree_authors : GdataAtom.atom_author list;
    cree_categories : GdataAtom.atom_category list;
    cree_content : GdataAtom.atom_content;
    cree_contributors : GdataAtom.atom_contributor list;
    cree_id : GdataAtom.atom_id;
    cree_published : GdataAtom.atom_published;
    cree_updated : GdataAtom.atom_updated;
    cree_comments : GdataCalendarComment.calendar_calendarComments;
    cree_links : GdataCalendar.calendar_calendarLink list;
    cree_where : GdataCalendar.calendar_calendarWhere list;
    cree_who : calendar_calendarWho list;
    cree_icalUID : calendar_icalUIDProperty;
    cree_sequenceNumber : calendar_sequenceNumberProperty;
    cree_title : GdataAtom.atom_textConstruct;
    cree_eventStatus : gdata_eventStatus;
    cree_originalEvent : gdata_originalEvent;
    cree_transparency : gdata_transparency;
    cree_visibility : gdata_visibility;
    cree_when : gdata_when list;
    cree_extensions :
      (GdataCore.Metadata.xml,
       GdataCore.Value.t) GdataCore.AnnotatedTree.t list }

val empty_recurrenceExceptionEntry : calendar_calendarRecurrenceExceptionEntry

type calendar_calendarExtendedProperty =
  { cep_name : string;
    cep_realm : string;
    cep_value : string }

val empty_extendedProperty : calendar_calendarExtendedProperty

type calendar_calendarRecurrenceException =
  { cre_specialized : bool;
    cre_entry : calendar_calendarRecurrenceExceptionEntry }

val empty_recurrenceException : calendar_calendarRecurrenceException

type calendar_calendarEventEntry =
  { cee_etag : string;
    cee_authors : GdataAtom.atom_author list;
    cee_content : GdataAtom.atom_content;
    cee_contributors : GdataAtom.atom_contributor list;
    cee_id : GdataAtom.atom_id;
    cee_published : GdataAtom.atom_published;
    cee_updated : GdataAtom.atom_updated;
    cee_comments : GdataCalendarComment.calendar_calendarComments;
    cee_extendedProperties : calendar_calendarExtendedProperty list;
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
    cee_extensions :
      (GdataCore.Metadata.xml,
       GdataCore.Value.t) GdataCore.AnnotatedTree.t list }

val empty_eventEntry : calendar_calendarEventEntry

type calendar_calendarEventFeed =
  { cef_etag : string;
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
    cef_extensions :
      (GdataCore.Metadata.xml,
       GdataCore.Value.t) GdataCore.AnnotatedTree.t list }

val empty_eventFeed : calendar_calendarEventFeed

val parse_extendedProperty :
  calendar_calendarExtendedProperty ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarExtendedProperty

val parse_resourceProperty :
  calendar_resourceProperty ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_resourceProperty

val parse_attendeeStatus :
  gdata_attendeeStatus ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  gdata_attendeeStatus

val parse_who :
  calendar_calendarWho ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarWho

val parse_reminder :
  gdata_reminder ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  gdata_reminder

val parse_when :
  gdata_when ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  gdata_when

val parse_originalEvent :
  gdata_originalEvent ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  gdata_originalEvent

val parse_recurrenceExceptionEntry :
  calendar_calendarRecurrenceExceptionEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarRecurrenceExceptionEntry

val parse_recurrenceExceptionEntryLink :
  calendar_calendarRecurrenceExceptionEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarRecurrenceExceptionEntry

val parse_recurrenceException :
  calendar_calendarRecurrenceException ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarRecurrenceException

val parse_calendar_event_feed :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarEventFeed

val parse_calendar_event_entry :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarEventEntry

val render_extendedProperty :
  calendar_calendarExtendedProperty ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_resourceProperty :
  calendar_resourceProperty ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_attendeeStatus :
  gdata_attendeeStatus ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_who :
  calendar_calendarWho ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_reminder :
  gdata_reminder ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_when :
  gdata_when ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_originalEvent :
  gdata_originalEvent ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_recurrenceExceptionEntry :
  calendar_calendarRecurrenceExceptionEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_recurrenceExceptionEntryLink :
  calendar_calendarRecurrenceExceptionEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_recurrenceException :
  calendar_calendarRecurrenceException ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val calendar_event_entry_to_data_model :
  calendar_calendarEventEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

