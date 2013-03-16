(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Calendar API (v3).
  
  Lets you manipulate events and other calendar data..
  
  For more information about this service, see the
  {{:https://developers.google.com/google-apps/calendar/firstapp}API Documentation}.
  *)

module Scope :
sig
  val calendar : string
  (** Manage your calendars *)
  
  val calendar_readonly : string
  (** View your calendars *)
  
  
end
(** Service Auth Scopes *)

module AclResource :
sig
  
  (** Deletes an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    @param ruleId ACL rule identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    ruleId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    @param ruleId ACL rule identifier.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    ruleId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Creates an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Returns the rules in the access control list for the calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Acl.t * GapiConversation.Session.t
  
  (** Updates an access control rule. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    @param ruleId ACL rule identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    ruleId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Updates an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    @param ruleId ACL rule identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    ruleId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  
end

module CalendarListResource :
sig
  
  module MinAccessRole :
  sig
    type t =
      | Default
      | FreeBusyReader (** The user can read free/busy information. *)
      | Owner (** The user can read and modify events and access control lists. *)
      | Reader (** The user can read events that are not private. *)
      | Writer (** The user can read and modify events. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Deletes an entry on the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns an entry on the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  (** Adds an entry to the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param colorRgbFormat Whether to use the 'foregroundColor' and 'backgroundColor' fields to write the calendar colors (RGB). If this feature is used, the index-based 'colorId' field will be set to the best matching option automatically. Optional. The default is False.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?colorRgbFormat:bool ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  (** Returns entries on the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of entries returned on one result page. Optional.
    @param minAccessRole The minimum access role for the user in the returned entires. Optional. The default is no restriction.
    @param pageToken Token specifying which result page to return. Optional.
    @param showHidden Whether to show hidden entries. Optional. The default is False.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?minAccessRole:MinAccessRole.t ->
    ?pageToken:string ->
    ?showHidden:bool ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarList.t * GapiConversation.Session.t
  
  (** Updates an entry on the user's calendar list. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param colorRgbFormat Whether to use the 'foregroundColor' and 'backgroundColor' fields to write the calendar colors (RGB). If this feature is used, the index-based 'colorId' field will be set to the best matching option automatically. Optional. The default is False.
    @param calendarId Calendar identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?colorRgbFormat:bool ->
    calendarId:string ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  (** Updates an entry on the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param colorRgbFormat Whether to use the 'foregroundColor' and 'backgroundColor' fields to write the calendar colors (RGB). If this feature is used, the index-based 'colorId' field will be set to the best matching option automatically. Optional. The default is False.
    @param calendarId Calendar identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?colorRgbFormat:bool ->
    calendarId:string ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  
end

module CalendarsResource :
sig
  
  (** Clears a primary calendar. This operation deletes all data associated with the primary calendar of an account and cannot be undone.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val clear :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Deletes a secondary calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns metadata for a calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  (** Creates a secondary calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  (** Updates metadata for a calendar. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  (** Updates metadata for a calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  
end

module ColorsResource :
sig
  
  (** Returns the color definitions for calendars and events.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Colors.t * GapiConversation.Session.t
  
  
end

module EventsResource :
sig
  
  module OrderBy :
  sig
    type t =
      | Default
      | StartTime (** Order by the start date/time (ascending). This is only available when querying single events (i.e. the parameter "singleEvents" is True) *)
      | Updated (** Order by last modification time (ascending). *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Deletes an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param sendNotifications Whether to send notifications about the deletion of the event. Optional. The default is False.
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?sendNotifications:bool ->
    calendarId:string ->
    eventId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Returns an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param alwaysIncludeEmail Whether to always include a value in the "email" field for the organizer, creator and attendees, even if no real email is available (i.e. a generated, non-working value will be provided). The use of this option is discouraged and should only be used by clients which cannot handle the absence of an email address value in the mentioned places. Optional. The default is False.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?alwaysIncludeEmail:bool ->
    ?maxAttendees:int ->
    ?timeZone:string ->
    calendarId:string ->
    eventId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Imports an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param calendarId Calendar identifier.
    *)
  val import :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Creates an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param sendNotifications Whether to send notifications about the creation of the new event. Optional. The default is False.
    @param calendarId Calendar identifier.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxAttendees:int ->
    ?sendNotifications:bool ->
    calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Returns instances of the specified recurring event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param alwaysIncludeEmail Whether to always include a value in the "email" field for the organizer, creator and attendees, even if no real email is available (i.e. a generated, non-working value will be provided). The use of this option is discouraged and should only be used by clients which cannot handle the absence of an email address value in the mentioned places. Optional. The default is False.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param maxResults Maximum number of events returned on one result page. Optional.
    @param originalStart The original start time of the instance in the result. Optional.
    @param pageToken Token specifying which result page to return. Optional.
    @param showDeleted Whether to include deleted events (with 'status' equals 'cancelled') in the result. Cancelled instances of recurring events will still be included if 'singleEvents' is False. Optional. The default is False.
    @param timeMax Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time.
    @param timeMin Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not to filter by end time.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param calendarId Calendar identifier.
    @param eventId Recurring event identifier.
    *)
  val instances :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?alwaysIncludeEmail:bool ->
    ?maxAttendees:int ->
    ?maxResults:int ->
    ?originalStart:string ->
    ?pageToken:string ->
    ?showDeleted:bool ->
    ?timeMax:GapiDate.t ->
    ?timeMin:GapiDate.t ->
    ?timeZone:string ->
    calendarId:string ->
    eventId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Events.t * GapiConversation.Session.t
  
  (** Returns events on the specified calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param alwaysIncludeEmail Whether to always include a value in the "email" field for the organizer, creator and attendees, even if no real email is available (i.e. a generated, non-working value will be provided). The use of this option is discouraged and should only be used by clients which cannot handle the absence of an email address value in the mentioned places. Optional. The default is False.
    @param iCalUID Specifies iCalendar UID (iCalUID) of events to be included in the response. Optional.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param maxResults Maximum number of events returned on one result page. Optional.
    @param orderBy The order of the events returned in the result. Optional. The default is an unspecified, stable order.
    @param pageToken Token specifying which result page to return. Optional.
    @param q Free text search terms to find events that match these terms in any field, except for extended properties. Optional.
    @param showDeleted Whether to include deleted events (with 'status' equals 'cancelled') in the result. Cancelled instances of recurring events (but not the underlying recurring event) will still be included if 'showDeleted' and 'singleEvents' are both False. If 'showDeleted' and 'singleEvents' are both True only single instances of deleted events (but not the underlying recurring events) are returned. Optional. The default is False.
    @param showHiddenInvitations Whether to include hidden invitations in the result. Optional. The default is False.
    @param singleEvents Whether to expand recurring events into instances and only return single one-off events and instances of recurring events, but not the underlying recurring events themselves. Optional. The default is False.
    @param timeMax Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time.
    @param timeMin Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not to filter by end time.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param updatedMin Lower bound for an event's last modification time (as a RFC 3339 timestamp) to filter by. Optional. The default is not to filter by last modification time.
    @param calendarId Calendar identifier.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?alwaysIncludeEmail:bool ->
    ?iCalUID:string ->
    ?maxAttendees:int ->
    ?maxResults:int ->
    ?orderBy:OrderBy.t ->
    ?pageToken:string ->
    ?q:string ->
    ?showDeleted:bool ->
    ?showHiddenInvitations:bool ->
    ?singleEvents:bool ->
    ?timeMax:GapiDate.t ->
    ?timeMin:GapiDate.t ->
    ?timeZone:string ->
    ?updatedMin:GapiDate.t ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Events.t * GapiConversation.Session.t
  
  (** Moves an event to another calendar, i.e. changes an event's organizer.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param sendNotifications Whether to send notifications about the change of the event's organizer. Optional. The default is False.
    @param calendarId Calendar identifier of the source calendar where the event currently is on.
    @param eventId Event identifier.
    @param destination Calendar identifier of the target calendar where the event is to be moved to.
    *)
  val move :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?sendNotifications:bool ->
    calendarId:string ->
    eventId:string ->
    destination:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Updates an event. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param alwaysIncludeEmail Whether to always include a value in the "email" field for the organizer, creator and attendees, even if no real email is available (i.e. a generated, non-working value will be provided). The use of this option is discouraged and should only be used by clients which cannot handle the absence of an email address value in the mentioned places. Optional. The default is False.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param sendNotifications Whether to send notifications about the event update (e.g. attendee's responses, title changes, etc.). Optional. The default is False.
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?alwaysIncludeEmail:bool ->
    ?maxAttendees:int ->
    ?sendNotifications:bool ->
    calendarId:string ->
    eventId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Creates an event based on a simple text string.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param sendNotifications Whether to send notifications about the creation of the event. Optional. The default is False.
    @param calendarId Calendar identifier.
    @param text The text describing the event to be created.
    *)
  val quickAdd :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?sendNotifications:bool ->
    calendarId:string ->
    text:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Updates an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param alwaysIncludeEmail Whether to always include a value in the "email" field for the organizer, creator and attendees, even if no real email is available (i.e. a generated, non-working value will be provided). The use of this option is discouraged and should only be used by clients which cannot handle the absence of an email address value in the mentioned places. Optional. The default is False.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param sendNotifications Whether to send notifications about the event update (e.g. attendee's responses, title changes, etc.). Optional. The default is False.
    @param calendarId Calendar identifier.
    @param eventId Event identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?alwaysIncludeEmail:bool ->
    ?maxAttendees:int ->
    ?sendNotifications:bool ->
    calendarId:string ->
    eventId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  
end

module FreebusyResource :
sig
  
  (** Returns free/busy information for a set of calendars.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    *)
  val query :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiCalendarV3Model.FreeBusyRequest.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.FreeBusyResponse.t * GapiConversation.Session.t
  
  
end

module SettingsResource :
sig
  
  (** Returns a single user setting.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param setting Name of the user setting.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    setting:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Setting.t * GapiConversation.Session.t
  
  (** Returns all user settings for the authenticated user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Settings.t * GapiConversation.Session.t
  
  
end


