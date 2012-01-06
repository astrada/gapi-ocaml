(** Service definition for Calendar (v3).
  
  Lets you manipulate events and other calendar data.
  
  For more information about this service, see the
  {{:http://code.google.com/apis/calendar/v3/using.html}API Documentation}

  *)

(** OAuth 2.0 scope to get read/write access to Calendars, Calendar Events and Calendar ACLs *)
val scope : string
(** OAuth 2.0 scope to get read-only access to Calendars, Calendar Events and Calendar ACLs *)
val read_only_scope : string

(** The "acl" service. *)
module AclResource :
sig
  (** Returns the rules in the access control list for the calendar.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param etag Optional ETag.
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Acl.t * GapiConversation.Session.t)

  (** Returns an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    @param ruleId ACL rule identifier.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    ruleId:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t)

  (** Reloads an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t)

  (** Creates an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t)

  (** Updates an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t)

  (** Updates an access control rule. This method supports patch semantics.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t)

  (** Deletes an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

(** The "calendarList" service. *)
module CalendarListResource :
sig
  (** Returns entries on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param etag Optional ETag.
    @param parameters Optional standard parameters.
    @param maxResults Maximum number of entries returned on one result page. Optional.
    @param minAccessRole The minimum access role for the user in the returned entires. Optional. The default is no restriction.
    @param pageToken Token specifying which result page to return. Optional.
    @param showHidden Whether to show hidden entries. Optional. The default is False.
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?minAccessRole:string ->
    ?pageToken:string ->
    ?showHidden:bool ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.CalendarList.t * GapiConversation.Session.t)

  (** Returns an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t)

  (** Reloads an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t)

  (** Adds an entry to the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t)

  (** Updates an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t)

  (** Updates an entry on the user's calendar list. This method supports patch semantics.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t)

  (** Deletes an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/users/me/calendarList"]).
    @param parameters Optional standard parameters.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end


(** The "calendars" service. *)
module CalendarsResource :
sig
  (** Returns metadata for a calendar.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t)

  (** Refreshes metadata for a calendar.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t)

  (** Creates a secondary calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t)

  (** Updates metadata for a calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t)

  (** Updates metadata for a calendar. This method supports patch semantics.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t)

  (** Deletes a secondary calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  (** Clears a primary calendar. This operation deletes all data associated with the primary calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val clear :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

(** The "colors" service. *)
module ColorsResource :
sig
  (** Returns the color definitions for calendars and events.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/colors"]).
    @param parameters Optional standard parameters.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Colors.t * GapiConversation.Session.t)

end

(** The "events" service. *)
module EventsResource :
sig
  (** Returns events on the specified calendar.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param etag Optional ETag.
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param iCalUID Specifies iCalendar UID (iCalUID) of events to be included in the response. Optional.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param maxResults Maximum number of events returned on one result page. Optional.
    @param orderBy The order of the events returned in the result. Optional. The default is an unspecified, stable order.
    @param pageToken Token specifying which result page to return. Optional.
    @param q Free text search terms to find events that match these terms in any field, except for extended properties. Optional.
    @param showDeleted Whether to include deleted events (with 'eventStatus' equals 'cancelled') in the result. Optional. The default is False.
    @param showHiddenInvitations Whether to include hidden invitations in the result. Optional. The default is False.
    @param singleEvents Whether to expand recurring events into instances and only return single one-off events and instances of recurring events, but not the underlying recurring events themselves. Optional. The default is False.
    @param timeMax Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time.
    @param timeMin Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not to filter by end time.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param updatedMin Lower bound for an event's last modification time (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by last modification time.
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    ?iCalUID:string ->
    ?maxAttendees:int ->
    ?maxResults:int ->
    ?orderBy:string ->
    ?pageToken:string ->
    ?q:string ->
    ?showDeleted:bool ->
    ?showHiddenInvitations:bool ->
    ?singleEvents:bool ->
    ?timeMax:GapiDate.t ->
    ?timeMin:GapiDate.t ->
    ?timeZone:string ->
    ?updatedMin:GapiDate.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Events.t * GapiConversation.Session.t)

  (** Returns an event.   

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    eventId:string ->
    ?maxAttendees:int ->
    ?timeZone:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Refreshes an event.   

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Creates an event.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param sendNotifications Whether to send notifications about the creation of the new event. Optional. The default is False.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    ?sendNotifications:bool ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Updates an event.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param sendNotifications Whether to send notifications about the event update (e.g. attendee's responses, title changes, etc.). Optional. The default is False.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    ?sendNotifications:bool ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Updates an event. This method supports patch semantics.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param sendNotifications Whether to send notifications about the creation of the new event. Optional. The default is False.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    ?sendNotifications:bool ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Deletes an event.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  (** Returns instances of the specified recurring event.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param maxResults Maximum number of events returned on one result page. Optional.
    @param originalStart The original start time of the instance in the result. Optional.
    @param pageToken Token specifying which result page to return. Optional.
    @param showDeleted Whether to include deleted events (with 'eventStatus' equals 'cancelled') in the result. Optional. The default is False.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    *)
  val instances :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    eventId:string ->
    ?maxAttendees:int ->
    ?maxResults:int ->
    ?originalStart:GapiDate.t ->
    ?pageToken:string ->
    ?showDeleted:bool ->
    ?timeZone:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Events.t * GapiConversation.Session.t)

  (** Imports an event.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    *)
  val import :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Creates an event based on a simple text string.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param text The text describing the event to be created.
    @param sendNotifications Whether to send notifications about the creation of the event. Optional. The default is False.
    *)
  val quickAdd :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    text:string ->
    ?sendNotifications:bool ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Moves an event to another calendar, i.e. changes an event's organizer.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    @param destination Calendar identifier of the target calendar where the event is to be moved to.
    @param sendNotifications Whether to send notifications about the change of the event's organizer. Optional. The default is False.
    *)
  val move :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    eventId:string ->
    destination:string ->
    ?sendNotifications:bool ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

  (** Resets a specialized instance of a recurring event to its original state.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters..
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    @param sendNotifications Whether to send notifications about the change of the event's organizer. Optional. The default is False.
    *)
  val reset :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    eventId:string ->
    ?sendNotifications:bool ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Event.t * GapiConversation.Session.t)

end

(** The "freebusy" service. *)
module FreebusyResource :
sig
  (** Returns free/busy information for a set of calendars.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/freeBusy"]).
    @param parameters Optional standard parameters..
    *)
  val query :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.FreeBusyRequest.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.FreeBusyResponse.t * GapiConversation.Session.t)

end

(** The "settings" service. *)
module SettingsResource :
sig
  (** Returns all user settings for the authenticated user.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/users/me/settings"]).
    @param etag Optional ETag.
    @param parameters Optional standard parameters..
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Settings.t * GapiConversation.Session.t)

  (** Returns a single user setting.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/users/me/settings"]).
    @param parameters Optional standard parameters..
    @param setting Name of the user setting.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    setting:string ->
    GapiConversation.Session.t ->
    (GapiCalendarV3Model.Setting.t * GapiConversation.Session.t)

end

