type calendar_calendarRecurrenceExceptionEntry = {
  cree_etag : string;
  cree_kind : string;
  cree_authors : GdataAtom.Author.t list;
  cree_categories : GdataAtom.Category.t list;
  cree_content : GdataAtom.Content.t;
  cree_contributors : GdataAtom.Contributor.t list;
  cree_id : GdataAtom.atom_id;
  cree_published : GdataAtom.atom_published;
  cree_updated : GdataAtom.atom_updated;
  cree_comments : GdataCalendar.Comments.comments;
  cree_links : GdataCalendar.Link.t list;
  cree_where : GdataCalendar.calendar_calendarWhere list;
  cree_who : GdataCalendar.Who.t list;
  cree_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cree_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cree_title : GdataAtom.Title.t;
  cree_eventStatus : GdataCalendar.gdata_eventStatus;
  cree_originalEvent : GdataCalendar.gdata_originalEvent;
  cree_transparency : GdataCalendar.gdata_transparency;
  cree_visibility : GdataCalendar.gdata_visibility;
  cree_when : GdataCalendar.When.t list;
  cree_extensions : GdataCore.xml_data_model list
}

val empty_recurrenceExceptionEntry : calendar_calendarRecurrenceExceptionEntry

type calendar_calendarRecurrenceException = {
  cre_specialized : bool;
  cre_entry : calendar_calendarRecurrenceExceptionEntry
}

val empty_recurrenceException : calendar_calendarRecurrenceException

type calendar_calendarEventEntry = {
  cee_etag : string;
  cee_kind : string;
  cee_authors : GdataAtom.Author.t list;
  cee_content : GdataAtom.Content.t;
  cee_contributors : GdataAtom.Contributor.t list;
  cee_id : GdataAtom.atom_id;
  cee_published : GdataAtom.atom_published;
  cee_updated : GdataAtom.atom_updated;
  cee_edited : GdataAtom.app_edited;
  cee_comments : GdataCalendar.Comments.comments;
  cee_extendedProperties : GdataCalendar.calendar_calendarExtendedProperty list;
  cee_links : GdataCalendar.Link.t list;
  cee_recurrenceExceptions : calendar_calendarRecurrenceException list;
  cee_where : GdataCalendar.calendar_calendarWhere list;
  cee_who : GdataCalendar.Who.t list;
  cee_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cee_privateCopy : GdataCalendar.calendar_privateCopyProperty;
  cee_quickAdd : GdataCalendar.calendar_quickAddProperty;
  cee_sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cee_syncEvent : GdataCalendar.calendar_syncEventProperty;
  cee_summary : GdataAtom.Summary.t;
  cee_title : GdataAtom.Title.t;
  cee_eventKind : GdataCalendar.gdata_kind;
  cee_eventStatus : GdataCalendar.gdata_eventStatus;
  cee_originalEvent : GdataCalendar.gdata_originalEvent;
  cee_recurrence : GdataCalendar.gdata_recurrence;
  cee_reminders : GdataCalendar.Reminder.t list;
  cee_transparency : GdataCalendar.gdata_transparency;
  cee_visibility : GdataCalendar.gdata_visibility;
  cee_when : GdataCalendar.When.t list;
  cee_anyoneCanAddSelf : bool;
  cee_guestsCanInviteOthers : bool;
  cee_guestsCanModify : bool;
  cee_guestsCanSeeGuests : bool;
  cee_extensions : GdataCore.xml_data_model list
}

val empty_eventEntry : calendar_calendarEventEntry

val parse_recurrenceExceptionEntry :
  calendar_calendarRecurrenceExceptionEntry ->
  GdataCore.xml_data_model ->
  calendar_calendarRecurrenceExceptionEntry

val parse_recurrenceException :
  calendar_calendarRecurrenceException ->
  GdataCore.xml_data_model ->
  calendar_calendarRecurrenceException

val parse_calendar_event_entry :
  GdataCore.xml_data_model ->
  calendar_calendarEventEntry

val render_recurrenceExceptionEntry :
  calendar_calendarRecurrenceExceptionEntry ->
  GdataCore.xml_data_model list

val render_recurrenceException :
  calendar_calendarRecurrenceException ->
  GdataCore.xml_data_model list

val calendar_event_entry_to_data_model :
  calendar_calendarEventEntry ->
  GdataCore.xml_data_model

module Entry :
sig
  type t = calendar_calendarEventEntry

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Feed :
  GdataAtom.FEED
    with type entry_t = Entry.t
      and type link_t = GdataCalendar.Link.t

