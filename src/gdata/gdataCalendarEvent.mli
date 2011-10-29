type calendar_calendarRecurrenceExceptionEntry = {
  cree_etag : string;
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
  cree_who : GdataCalendar.calendar_calendarWho list;
  cree_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cree_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cree_title : GdataAtom.atom_textConstruct;
  cree_eventStatus : GdataCalendar.gdata_eventStatus;
  cree_originalEvent : GdataCalendar.gdata_originalEvent;
  cree_transparency : GdataCalendar.gdata_transparency;
  cree_visibility : GdataCalendar.gdata_visibility;
  cree_when : GdataCalendar.gdata_when list;
  cree_extensions :
    (GdataCore.Metadata.xml,
     GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

val empty_recurrenceExceptionEntry : calendar_calendarRecurrenceExceptionEntry

type calendar_calendarRecurrenceException = {
  cre_specialized : bool;
  cre_entry : calendar_calendarRecurrenceExceptionEntry
}

val empty_recurrenceException : calendar_calendarRecurrenceException

type calendar_calendarEventEntry = {
  cee_etag : string;
  cee_authors : GdataAtom.atom_author list;
  cee_content : GdataAtom.atom_content;
  cee_contributors : GdataAtom.atom_contributor list;
  cee_id : GdataAtom.atom_id;
  cee_published : GdataAtom.atom_published;
  cee_updated : GdataAtom.atom_updated;
  cee_comments : GdataCalendarComment.calendar_calendarComments;
  cee_extendedProperties : GdataCalendar.calendar_calendarExtendedProperty list;
  cee_links : GdataCalendar.calendar_calendarLink list;
  cee_recurrenceExceptions : calendar_calendarRecurrenceException list;
  cee_where : GdataCalendar.calendar_calendarWhere list;
  cee_who : GdataCalendar.calendar_calendarWho list;
  cee_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cee_privateCopy : GdataCalendar.calendar_privateCopyProperty;
  cee_quickAdd : GdataCalendar.calendar_quickAddProperty;
  cee_sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cee_syncEvent : GdataCalendar.calendar_syncEventProperty;
  cee_summary : GdataAtom.atom_textConstruct;
  cee_title : GdataAtom.atom_textConstruct;
  cee_eventKind : GdataCalendar.gdata_kind;
  cee_eventStatus : GdataCalendar.gdata_eventStatus;
  cee_originalEvent : GdataCalendar.gdata_originalEvent;
  cee_recurrence : GdataCalendar.gdata_recurrence;
  cee_reminders : GdataCalendar.gdata_reminder list;
  cee_transparency : GdataCalendar.gdata_transparency;
  cee_visibility : GdataCalendar.gdata_visibility;
  cee_when : GdataCalendar.gdata_when list;
  cee_extensions :
    (GdataCore.Metadata.xml,
     GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

val empty_eventEntry : calendar_calendarEventEntry

type calendar_calendarEventFeed = {
  cef_etag : string;
  cef_kind : string;
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
  cef_eventKind : GdataCalendar.gdata_kind;
  cef_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  cef_startIndex : GdataAtom.opensearch_startIndex;
  cef_totalResults : GdataAtom.opensearch_totalResults
}

val empty_eventFeed : calendar_calendarEventFeed

val parse_recurrenceExceptionEntry :
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

val render_recurrenceExceptionEntry :
  calendar_calendarRecurrenceExceptionEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_recurrenceException :
  calendar_calendarRecurrenceException ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val calendar_event_entry_to_data_model :
  calendar_calendarEventEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

