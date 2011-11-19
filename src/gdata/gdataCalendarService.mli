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
  GapiConversation.Session.t ->
  (string, string) Hashtbl.t * GapiConversation.Session.t

val all_calendars :
  ?url:string ->
  ?etag:string ->
  GapiConversation.Session.t ->
  GdataCalendar.Feed.t * GapiConversation.Session.t

val own_calendars :
  ?url:string ->
  ?etag:string ->
  GapiConversation.Session.t ->
  GdataCalendar.Feed.t * GapiConversation.Session.t

val refresh_calendar :
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendar.Entry.t * GapiConversation.Session.t

val create_new_calendar :
  ?url:string ->
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendar.Entry.t * GapiConversation.Session.t

val update_calendar :
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendar.Entry.t * GapiConversation.Session.t

val delete_calendar :
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val add_new_subscription :
  ?url:string ->
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendar.Entry.t * GapiConversation.Session.t

val retrieve_events :
  ?url:string ->
  ?etag:string ->
  ?parameters:QueryParameters.t ->
  GapiConversation.Session.t ->
  GdataCalendarEvent.Feed.t * GapiConversation.Session.t

val refresh_event :
  GdataCalendarEvent.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendarEvent.Entry.t * GapiConversation.Session.t

val create_new_event :
  ?url:string ->
  GdataCalendarEvent.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendarEvent.Entry.t * GapiConversation.Session.t

val update_event :
  GdataCalendarEvent.Entry.t ->
  GapiConversation.Session.t ->
  GdataCalendarEvent.Entry.t * GapiConversation.Session.t

val delete_event :
  GdataCalendarEvent.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val retrieve_acl :
  ?etag:string ->
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Feed.t * GapiConversation.Session.t

val refresh_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val create_acl :
  GdataACL.Entry.t ->
  GdataCalendar.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val update_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  GdataACL.Entry.t * GapiConversation.Session.t

val delete_acl :
  GdataACL.Entry.t ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val event_batch_request :
  GdataCalendarEvent.Feed.t ->
  GdataCalendarEvent.Feed.t ->
  GapiConversation.Session.t ->
  GdataCalendarEvent.Feed.t * GapiConversation.Session.t

