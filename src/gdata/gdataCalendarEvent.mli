module RecurrenceExceptionEntry :
sig
  type t = {
    etag : string;
    kind : string;
    authors : GdataAtom.Author.t list;
    categories : GdataAtom.Category.t list;
    content : GdataAtom.Content.t;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    comments : GdataCalendar.Comments.comments;
    links : GdataCalendar.Link.t list;
    where : GdataCalendar.Where.t list;
    who : GdataCalendar.Who.t list;
    icalUID : GdataCalendar.calendar_icalUIDProperty;
    sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
    title : GdataAtom.Title.t;
    eventStatus : GdataCalendar.gdata_eventStatus;
    originalEvent : GdataCalendar.OriginalEvent.t;
    transparency : GdataCalendar.gdata_transparency;
    visibility : GdataCalendar.gdata_visibility;
    _when : GdataCalendar.When.t list;
    extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module RecurrenceException :
sig
  type t = {
    cre_specialized : bool;
    cre_entry : RecurrenceExceptionEntry.t
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

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
  cee_extendedProperties : GdataCalendar.ExtendedProperty.t list;
  cee_links : GdataCalendar.Link.t list;
  cee_recurrenceExceptions : RecurrenceException.t list;
  cee_where : GdataCalendar.Where.t list;
  cee_who : GdataCalendar.Who.t list;
  cee_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cee_privateCopy : GdataCalendar.calendar_privateCopyProperty;
  cee_quickAdd : GdataCalendar.calendar_quickAddProperty;
  cee_sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cee_syncEvent : GdataCalendar.calendar_syncEventProperty;
  cee_summary : GdataAtom.Summary.t;
  cee_title : GdataAtom.Title.t;
  cee_categories : GdataAtom.Category.t list;
  cee_eventStatus : GdataCalendar.gdata_eventStatus;
  cee_originalEvent : GdataCalendar.OriginalEvent.t;
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

val parse_calendar_event_entry :
  GdataCore.xml_data_model ->
  calendar_calendarEventEntry

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

