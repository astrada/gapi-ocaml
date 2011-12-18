(** Service definition for Calendar (v3).
  
  Lets you manipulate events and other calendar data.
  
  For more information about this service, see the
  {{:http://code.google.com/apis/calendar/v3/using.html}API Documentation}

  *)

(** OAuth 2.0 scope to get read/write access to Calendars, Calendar Events and Calendar ACLs *)
val scope : string
(** OAuth 2.0 scope to get read-only access to Calendars, Calendar Events and Calendar ACLs *)
val read_only_scope : string

(** The query parameters you can use with the Google Calendar API. *)
module CalendarParameters :
sig
  type t = {
    fields : string;
    (** Selector specifying a subset of fields to include in the response. *)
    prettyPrint : bool;
    (** Returns response with indentations and line breaks. *)
    quotaUser : string;
    (** Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides [userIp] if both are provided. *)
    userIp : string;
    (** IP address of the end user for whom the API call is being made. *)
    maxAttendees : int;
    (** The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional. *)
    maxResults : int;
    (** Maximum number of entries returned on one result page. Optional.

      There is an upper limit on the number of entries that can be returned by the API. If the provided value is greater that this limit, the API will use the default limit. *)
    minAccessRole : string;
    (** The minimum access role for the user in the returned entries. Default: no restriction.

      Supported values are:
      - [reader]: The user can read events that are not private.
      - [freeBusyReader]: The user can read free/busy information.
      - [owner]: The user can read and modify events and access control lists.
      - [writer]: The user can read and modify events. *)
    orderBy : string;
    (** The order of the events returned in the result. Optional. The default is an unspecified, stable order.

      Supported values are:
      - [startTime]: Order by the start date/time (ascending). This is only available when querying single events (i.e. the parameter singleEvents is True)
      - [updated]: order by last modification time (ascending) *)
    originalStart : GapiDate.t;
    (** The original start time of the instance in the result. Optional. *)
    pageToken : string;
    (** Token specifying which result page to return. Optional. The default is to return the first page. *)
    q : string;
    (** Free text search terms to find events that match these terms in any field, except for extended properties. Optional. *)
    sendNotifications : bool;
    (** Whether to send notifications about the update. Optional. The default is [false]. *)
    singleEvents : bool;
    (** Whether to expand recurring events into instances and only return single one-off events and instances of recurring events, but not the underlying recurring events themselves. Optional. The default is [false]. *)
    showDeleted : bool;
    (** Whether to include deleted events (with [eventStatus] equals [cancelled]) in the result. Optional. The default is [false]. *)
    showHidden : bool;
    (** Whether to show hidden entries. Optional. The default is [false]. *)
    showHiddenInvitations : bool;
    (** Whether to include hidden invitations in the result. Optional. The default is [false]. *)
    timeMax : GapiDate.t;
    (** Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time. *)
    timeMin : GapiDate.t;
    (** Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not to filter by end time. *)
    timeZone : string;
    (** Time zone used in the response. Optional. The default is the time zone of the calendar. *)
    updatedMin : GapiDate.t;
    (** Lower bound for an event's last modification time (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by last modification time. *)
  }

  (** Default value. *)
  val default : t

  (** Builds an associative list containing the parameters. *)
  val to_key_value_list : t -> (string * string) list

end

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
    (GapiCalendar.Acl.t * GapiConversation.Session.t)

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
    (GapiCalendar.AclRule.t * GapiConversation.Session.t)

  (** Reloads an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendar.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.AclRule.t * GapiConversation.Session.t)

  (** Creates an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendar.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.AclRule.t * GapiConversation.Session.t)

  (** Updates an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendar.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.AclRule.t * GapiConversation.Session.t)

  (** Updates an access control rule. This method supports patch semantics.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendar.AclRule.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.AclRule.t * GapiConversation.Session.t)

  (** Deletes an access control rule.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?calendarId:string ->
    GapiCalendar.AclRule.t ->
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
    (GapiCalendar.CalendarList.t * GapiConversation.Session.t)

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
    (GapiCalendar.CalendarListEntry.t * GapiConversation.Session.t)

  (** Reloads an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarListEntry.t * GapiConversation.Session.t)

  (** Adds an entry to the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarListEntry.t * GapiConversation.Session.t)

  (** Updates an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarListEntry.t * GapiConversation.Session.t)

  (** Updates an entry on the user's calendar list. This method supports patch semantics.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarListEntry.t * GapiConversation.Session.t)

  (** Deletes an entry on the user's calendar list.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/users/me/calendarList"]).
    @param parameters Optional standard parameters.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.CalendarListEntry.t ->
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
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  (** Refreshes metadata for a calendar.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val refresh :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  (** Creates a secondary calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val insert :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  (** Updates metadata for a calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val update :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  (** Updates metadata for a calendar. This method supports patch semantics.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val patch :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.Calendar.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Calendar.t * GapiConversation.Session.t)

  (** Deletes a secondary calendar.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param parameters Optional standard parameters.
    *)
  val delete :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.Calendar.t ->
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
     
    Usage: [get ?url session] where [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/colors"]).
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Colors.t * GapiConversation.Session.t)

end

(** The "events" service. *)
module EventsResource :
sig
  (** Returns events on the specified calendar.

    Usage: [list ?url ?etag ?parameters ?container_id session] where [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param etag optional ETag.
    @param parameters request parameters.
    @param container_id ID of the calendar containing the events to list (defaults to {e primary} calendar).
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Events.t * GapiConversation.Session.t)

  (** Returns an event.   

    Usage: [get ?url ?container_id event_id session] where [event_id] is the ID of the event to retrieve, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event (defaults to {e primary} calendar).
    *)
  val get :
    ?url:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Refreshes an event.   

    Usage: [refresh ?url ?container_id event session] where [event] is the event to reload, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event (defaults to {e primary} calendar).
    *)
  val refresh :
    ?url:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Creates an event.
     
    Usage: [insert ?url ?container_id event session] where [event] is the event to insert, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar that will contain the new event (defaults to {e primary} calendar).
    *)
  val insert :
    ?url:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Updates an event.
     
    Usage: [update ?url ?container_id event session] where [event] is the updated event to upload, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event (defaults to {e primary} calendar).
    *)
  val update :
    ?url:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Updates an event. {e This method supports patch semantics.}
     
    Usage: [patch ?url ?container_id event session] where [event] is the updated event to merge, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event (defaults to {e primary} calendar).
    *)
  val patch :
    ?url:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Deletes an event.
     
    Usage: [delete ?url ?container_id event session] where [event] is the event to delete, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event (defaults to {e primary} calendar).
    *)
  val delete :
    ?url:string ->
    ?parameters:CalendarParameters.t ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  (** Returns instances of the specified recurring event.

    Usage: [instances ?url ?container_id event_id session] where [event_id] is the ID of the recurring event, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event (defaults to {e primary} calendar).
    *)
  val instances :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Events.t * GapiConversation.Session.t)

  (** Imports an event.
     
    Usage: [import ?url ?container_id event session] where [event] is the event to import, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar that will contain the new event (defaults to {e primary} calendar).
    *)
  val import :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiCalendar.Event.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Creates an event based on a simple text string.

    Usage: [quickAdd ?url ?container_id text session] where [text] is the description of the event to add, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar that will contain the new event (defaults to {e primary} calendar).
    *)
  val quickAdd :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Moves an event to another calendar, i.e. changes an event's organizer.
     
    Usage: [move ?url ?container_id event_id destination_id session] where [event_id] is the ID of the event to move, [destination_id] is the ID of the destination calendar, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event to move (defaults to {e primary} calendar).
    *)
  val move :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

  (** Resets a specialized instance of a recurring event to its original state.
     
    Usage: [reset ?url ?container_id instance_id session] where [event_id] is the ID of the instance to reset, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/calendars"]).
    @param container_id ID of the calendar containing the event to reset (defaults to {e primary} calendar).
    *)
  val reset :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Event.t * GapiConversation.Session.t)

end

(** The "freebusy" service. *)
module FreebusyResource :
sig
  (** Returns free/busy information for a set of calendars.

    Usage: [query ?url parameters session] where [parameters] specifies the request parameters (e.g.: target calendar IDs), and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/freeBusy"]).
    *)
  val query :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiCalendar.FreeBusyRequest.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.FreeBusyResponse.t * GapiConversation.Session.t)

end

(** The "settings" service. *)
module SettingsResource :
sig
  (** Returns all user settings for the authenticated user.

    Usage: [list ?url ?etag ?parameters session] where [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/users/me/settings"]).
    @param etag optional ETag.
    @param parameters standard parameters.
    *)
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Settings.t * GapiConversation.Session.t)

  (** Returns a single user setting.

    Usage: [get ?url setting_id session] where [setting_id] is the name of the user setting, and [session] is the current session.
     
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/users/me/settings"]).
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.Setting.t * GapiConversation.Session.t)

end

