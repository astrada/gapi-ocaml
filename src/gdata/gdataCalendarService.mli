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

