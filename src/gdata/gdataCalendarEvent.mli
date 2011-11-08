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
    comments : GdataCalendar.Comments.t;
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
    specialized : bool;
    entry : RecurrenceExceptionEntry.t
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
    content : GdataAtom.Content.t;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    edited : GdataAtom.app_edited;
    comments : GdataCalendar.Comments.t;
    extendedProperties : GdataCalendar.ExtendedProperty.t list;
    links : GdataCalendar.Link.t list;
    recurrenceExceptions : RecurrenceException.t list;
    where : GdataCalendar.Where.t list;
    who : GdataCalendar.Who.t list;
    icalUID : GdataCalendar.calendar_icalUIDProperty;
    privateCopy : GdataCalendar.calendar_privateCopyProperty;
    quickAdd : GdataCalendar.calendar_quickAddProperty;
    sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
    sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
    syncEvent : GdataCalendar.calendar_syncEventProperty;
    summary : GdataAtom.Summary.t;
    title : GdataAtom.Title.t;
    categories : GdataAtom.Category.t list;
    eventStatus : GdataCalendar.gdata_eventStatus;
    originalEvent : GdataCalendar.OriginalEvent.t;
    recurrence : GdataCalendar.gdata_recurrence;
    reminders : GdataCalendar.Reminder.t list;
    transparency : GdataCalendar.gdata_transparency;
    visibility : GdataCalendar.gdata_visibility;
    _when : GdataCalendar.When.t list;
    anyoneCanAddSelf : bool;
    guestsCanInviteOthers : bool;
    guestsCanModify : bool;
    guestsCanSeeGuests : bool;
    extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Feed :
  GdataAtom.FEED
    with type entry_t = Entry.t
      and type link_t = GdataCalendar.Link.t

val parse_calendar_event_entry :
  GdataCore.xml_data_model ->
  Entry.t

val calendar_event_entry_to_data_model :
  Entry.t ->
  GdataCore.xml_data_model

