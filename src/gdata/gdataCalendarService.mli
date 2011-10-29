module QueryParameters :
sig
  type t = {
    author : string;
(*    category : string; Calendar doesn't support category queries *)
    fields : string;
    max_results : int;
    published_min : GdataDate.t;
    published_max : GdataDate.t;
    q : string;
    start_index : int;
    strict : bool;
    updated_min : GdataDate.t;
    updated_max : GdataDate.t;
    ctz : string;
    future_events : bool;
    max_attendees : int;
    orderby : string;
    recurrence_expansion_start : GdataDate.t;
    recurrence_expansion_end : GdataDate.t;
    singleevents : bool;
    showdeleted : bool;
    showhidden : bool;
    sortorder : string;
    start_min : GdataDate.t;
    start_max : GdataDate.t
  }

  val default : t

  val to_key_value_list : t -> (string * string) list
end

val personal_settings :
  ?url:string ->
  ?etag:string ->
  GdataConversation.Session.t ->
  (string, string) Hashtbl.t * GdataConversation.Session.t

val all_calendars :
  ?url:string ->
  ?etag:string ->
  GdataConversation.Session.t ->
  GdataCalendar.calendar_calendarFeed * GdataConversation.Session.t

val own_calendars :
  ?url:string ->
  ?etag:string ->
  GdataConversation.Session.t ->
  GdataCalendar.calendar_calendarFeed * GdataConversation.Session.t

val refresh_calendar :
  GdataCalendar.calendar_calendarEntry ->
  GdataConversation.Session.t ->
  GdataCalendar.calendar_calendarEntry * GdataConversation.Session.t

val create_new_calendar :
  ?url:string ->
  GdataCalendar.calendar_calendarEntry ->
  GdataConversation.Session.t ->
  GdataCalendar.calendar_calendarEntry * GdataConversation.Session.t

val update_calendar :
  GdataCalendar.calendar_calendarEntry ->
  GdataConversation.Session.t ->
  GdataCalendar.calendar_calendarEntry * GdataConversation.Session.t

val delete_calendar :
  GdataCalendar.calendar_calendarEntry ->
  GdataConversation.Session.t ->
  unit * GdataConversation.Session.t

val add_new_subscription :
  ?url:string ->
  GdataCalendar.calendar_calendarEntry ->
  GdataConversation.Session.t ->
  GdataCalendar.calendar_calendarEntry * GdataConversation.Session.t

val retrieve_events :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GdataConversation.Session.t ->
  GdataCalendarEvent.calendar_calendarEventFeed * GdataConversation.Session.t

val refresh_event :
  GdataCalendarEvent.calendar_calendarEventEntry ->
  GdataConversation.Session.t ->
  GdataCalendarEvent.calendar_calendarEventEntry * GdataConversation.Session.t

val create_new_event :
  ?url:string ->
  GdataCalendarEvent.calendar_calendarEventEntry ->
  GdataConversation.Session.t ->
  GdataCalendarEvent.calendar_calendarEventEntry * GdataConversation.Session.t

val update_event :
  GdataCalendarEvent.calendar_calendarEventEntry ->
  GdataConversation.Session.t ->
  GdataCalendarEvent.calendar_calendarEventEntry * GdataConversation.Session.t

val delete_event :
  GdataCalendarEvent.calendar_calendarEventEntry ->
  GdataConversation.Session.t ->
  unit * GdataConversation.Session.t

val retrieve_acl :
  ?etag:string ->
  GdataCalendar.calendar_calendarEntry ->
  GdataConversation.Session.t ->
  GdataCalendarACL.calendar_aclFeed * GdataConversation.Session.t

