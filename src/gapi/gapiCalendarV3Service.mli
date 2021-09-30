(* Warning! This file is generated. Modify at your own risk.
        *)

(** Service definition for Calendar API (v3).
  
  Manipulates events and other calendar data..
  
  For more information about this service, see the
  {{:https://developers.google.com/google-apps/calendar/firstapp}API Documentation}.
  *)

module Scope :
sig
  val calendar : string
  (** See, edit, share, and permanently delete all the calendars you can access using Google Calendar *)
  
  val calendar_events_readonly : string
  (** View events on all your calendars *)
  
  val calendar_readonly : string
  (** See and download any calendar you can access using your Google Calendar *)
  
  val calendar_events : string
  (** View and edit events on all your calendars *)
  
  val calendar_settings_readonly : string
  (** View your Calendar settings *)
  
  
end
(** Service Auth Scopes *)

module ColorsResource :
sig
  
  (** Returns the color definitions for calendars and events.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Colors.t * GapiConversation.Session.t
  
  
end

module AclResource :
sig
  
  (** Returns an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param ruleId ACL rule identifier.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    ruleId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Returns the rules in the access control list for the calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param showDeleted Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal to "none". Deleted ACLs will always be included if syncToken is provided. Optional. The default is False.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then. All entries deleted since the previous list request will always be in the result set and it is not allowed to set showDeleted to False.
If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param pageToken Token specifying which result page to return. Optional.
    @param maxResults Maximum number of entries returned on one result page. By default the value is 100 entries. The page size can never be larger than 250 entries. Optional.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?showDeleted:bool ->
    ?syncToken:string ->
    ?pageToken:string ->
    ?maxResults:int ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Acl.t * GapiConversation.Session.t
  
  (** Deletes an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param ruleId ACL rule identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    ruleId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Creates an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Whether to send notifications about the calendar sharing change. Optional. The default is True.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    calendarId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Updates an access control rule.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Whether to send notifications about the calendar sharing change. Note that there are no notifications on access removal. Optional. The default is True.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param ruleId ACL rule identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    calendarId:string ->
    ruleId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Updates an access control rule. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Whether to send notifications about the calendar sharing change. Note that there are no notifications on access removal. Optional. The default is True.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param ruleId ACL rule identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    calendarId:string ->
    ruleId:string ->
    GapiCalendarV3Model.AclRule.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.AclRule.t * GapiConversation.Session.t
  
  (** Watch for changes to ACL resources.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param maxResults Maximum number of entries returned on one result page. By default the value is 100 entries. The page size can never be larger than 250 entries. Optional.
    @param showDeleted Whether to include deleted ACLs in the result. Deleted ACLs are represented by role equal to "none". Deleted ACLs will always be included if syncToken is provided. Optional. The default is False.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then. All entries deleted since the previous list request will always be in the result set and it is not allowed to set showDeleted to False.
If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param pageToken Token specifying which result page to return. Optional.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?maxResults:int ->
    ?showDeleted:bool ->
    ?syncToken:string ->
    ?pageToken:string ->
    calendarId:string ->
    GapiCalendarV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Channel.t * GapiConversation.Session.t
  
  
end

module CalendarsResource :
sig
  
  (** Deletes a secondary calendar. Use calendars.clear for clearing all events on primary calendars.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Creates a secondary calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  (** Returns metadata for a calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  (** Clears a primary calendar. This operation deletes all events associated with the primary calendar of an account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val clear :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Updates metadata for a calendar. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  (** Updates metadata for a calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiCalendarV3Model.Calendar.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Calendar.t * GapiConversation.Session.t
  
  
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
  
  (** Returns the calendars on the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param minAccessRole The minimum access role for the user in the returned entries. Optional. The default is no restriction.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then. If only read-only fields such as calendar properties or ACLs have changed, the entry won't be returned. All entries deleted and hidden since the previous list request will always be in the result set and it is not allowed to set showDeleted neither showHidden to False.
To ensure client state consistency minAccessRole query parameter cannot be specified together with nextSyncToken.
If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param showHidden Whether to show hidden entries. Optional. The default is False.
    @param showDeleted Whether to include deleted calendar list entries in the result. Optional. The default is False.
    @param pageToken Token specifying which result page to return. Optional.
    @param maxResults Maximum number of entries returned on one result page. By default the value is 100 entries. The page size can never be larger than 250 entries. Optional.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?minAccessRole:MinAccessRole.t ->
    ?syncToken:string ->
    ?showHidden:bool ->
    ?showDeleted:bool ->
    ?pageToken:string ->
    ?maxResults:int ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarList.t * GapiConversation.Session.t
  
  (** Returns a calendar from the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  (** Watch for changes to CalendarList resources.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param minAccessRole The minimum access role for the user in the returned entries. Optional. The default is no restriction.
    @param maxResults Maximum number of entries returned on one result page. By default the value is 100 entries. The page size can never be larger than 250 entries. Optional.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then. If only read-only fields such as calendar properties or ACLs have changed, the entry won't be returned. All entries deleted and hidden since the previous list request will always be in the result set and it is not allowed to set showDeleted neither showHidden to False.
To ensure client state consistency minAccessRole query parameter cannot be specified together with nextSyncToken.
If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param showHidden Whether to show hidden entries. Optional. The default is False.
    @param showDeleted Whether to include deleted calendar list entries in the result. Optional. The default is False.
    @param pageToken Token specifying which result page to return. Optional.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?minAccessRole:MinAccessRole.t ->
    ?maxResults:int ->
    ?syncToken:string ->
    ?showHidden:bool ->
    ?showDeleted:bool ->
    ?pageToken:string ->
    GapiCalendarV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Channel.t * GapiConversation.Session.t
  
  (** Inserts an existing calendar into the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param colorRgbFormat Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB). If this feature is used, the index-based colorId field will be set to the best matching option automatically. Optional. The default is False.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?colorRgbFormat:bool ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  (** Removes a calendar from the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    calendarId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Updates an existing calendar on the user's calendar list. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param colorRgbFormat Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB). If this feature is used, the index-based colorId field will be set to the best matching option automatically. Optional. The default is False.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?colorRgbFormat:bool ->
    calendarId:string ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  (** Updates an existing calendar on the user's calendar list.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param colorRgbFormat Whether to use the foregroundColor and backgroundColor fields to write the calendar colors (RGB). If this feature is used, the index-based colorId field will be set to the best matching option automatically. Optional. The default is False.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?colorRgbFormat:bool ->
    calendarId:string ->
    GapiCalendarV3Model.CalendarListEntry.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.CalendarListEntry.t * GapiConversation.Session.t
  
  
end

module FreebusyResource :
sig
  
  (** Returns free/busy information for a set of calendars.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    *)
  val query :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiCalendarV3Model.FreeBusyRequest.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.FreeBusyResponse.t * GapiConversation.Session.t
  
  
end

module ChannelsResource :
sig
  
  (** Stop watching resources through this channel
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    *)
  val stop :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiCalendarV3Model.Channel.t ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  
end

module SettingsResource :
sig
  
  (** Returns a single user setting.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param setting The id of the user setting.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    setting:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Setting.t * GapiConversation.Session.t
  
  (** Watch for changes to Settings resources.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param pageToken Token specifying which result page to return. Optional.
    @param maxResults Maximum number of entries returned on one result page. By default the value is 100 entries. The page size can never be larger than 250 entries. Optional.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then.
If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?pageToken:string ->
    ?maxResults:int ->
    ?syncToken:string ->
    GapiCalendarV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Channel.t * GapiConversation.Session.t
  
  (** Returns all user settings for the authenticated user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then.
If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param maxResults Maximum number of entries returned on one result page. By default the value is 100 entries. The page size can never be larger than 250 entries. Optional.
    @param pageToken Token specifying which result page to return. Optional.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?syncToken:string ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Settings.t * GapiConversation.Session.t
  
  
end

module EventsResource :
sig
  
  module SendUpdates :
  sig
    type t =
      | Default
      | All (** Notifications are sent to all guests. *)
      | ExternalOnly (** Notifications are sent to non-Google Calendar guests only. *)
      | None (** No notifications are sent. For calendar migration tasks, consider using the Events.import method instead. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module OrderBy :
  sig
    type t =
      | Default
      | StartTime (** Order by the start date/time (ascending). This is only available when querying single events (i.e. the parameter singleEvents is True) *)
      | Updated (** Order by last modification time (ascending). *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Returns an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param alwaysIncludeEmail Deprecated and ignored. A value will always be returned in the email field for the organizer, creator and attendees, even if no real email address is available (i.e. a generated, non-working value will be provided).
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param eventId Event identifier.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?timeZone:string ->
    ?maxAttendees:int ->
    ?alwaysIncludeEmail:bool ->
    calendarId:string ->
    eventId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Returns instances of the specified recurring event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param timeMin Lower bound (inclusive) for an event's end time to filter by. Optional. The default is not to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset.
    @param timeMax Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset.
    @param pageToken Token specifying which result page to return. Optional.
    @param maxResults Maximum number of events returned on one result page. By default the value is 250 events. The page size can never be larger than 2500 events. Optional.
    @param originalStart The original start time of the instance in the result. Optional.
    @param alwaysIncludeEmail Deprecated and ignored. A value will always be returned in the email field for the organizer, creator and attendees, even if no real email address is available (i.e. a generated, non-working value will be provided).
    @param showDeleted Whether to include deleted events (with status equals "cancelled") in the result. Cancelled instances of recurring events will still be included if singleEvents is False. Optional. The default is False.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param eventId Recurring event identifier.
    *)
  val instances :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?timeZone:string ->
    ?timeMin:GapiDate.t ->
    ?timeMax:GapiDate.t ->
    ?pageToken:string ->
    ?maxResults:int ->
    ?originalStart:string ->
    ?alwaysIncludeEmail:bool ->
    ?showDeleted:bool ->
    ?maxAttendees:int ->
    calendarId:string ->
    eventId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Events.t * GapiConversation.Session.t
  
  (** Creates an event based on a simple text string.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Deprecated. Please use sendUpdates instead.

Whether to send notifications about the creation of the event. Note that some emails might still be sent even if you set the value to false. The default is false.
    @param sendUpdates Guests who should receive notifications about the creation of the new event.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param text The text describing the event to be created.
    *)
  val quickAdd :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    ?sendUpdates:SendUpdates.t ->
    calendarId:string ->
    text:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Returns events on the specified calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param maxResults Maximum number of events returned on one result page. The number of events in the resulting page may be less than this value, or none at all, even if there are more events matching the query. Incomplete pages can be detected by a non-empty nextPageToken field in the response. By default the value is 250 events. The page size can never be larger than 2500 events. Optional.
    @param q Free text search terms to find events that match these terms in any field, except for extended properties. Optional.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param sharedExtendedProperty Extended properties constraint specified as propertyName=value. Matches only shared properties. This parameter might be repeated multiple times to return events that match all given constraints.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then. All events deleted since the previous list request will always be in the result set and it is not allowed to set showDeleted to False.
There are several query parameters that cannot be specified together with nextSyncToken to ensure consistency of the client state.

These are: 
- iCalUID 
- orderBy 
- privateExtendedProperty 
- q 
- sharedExtendedProperty 
- timeMin 
- timeMax 
- updatedMin If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param updatedMin Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by. When specified, entries deleted since this time will always be included regardless of showDeleted. Optional. The default is not to filter by last modification time.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param privateExtendedProperty Extended properties constraint specified as propertyName=value. Matches only private properties. This parameter might be repeated multiple times to return events that match all given constraints.
    @param singleEvents Whether to expand recurring events into instances and only return single one-off events and instances of recurring events, but not the underlying recurring events themselves. Optional. The default is False.
    @param showDeleted Whether to include deleted events (with status equals "cancelled") in the result. Cancelled instances of recurring events (but not the underlying recurring event) will still be included if showDeleted and singleEvents are both False. If showDeleted and singleEvents are both True, only single instances of deleted events (but not the underlying recurring events) are returned. Optional. The default is False.
    @param orderBy The order of the events returned in the result. Optional. The default is an unspecified, stable order.
    @param alwaysIncludeEmail Deprecated and ignored. A value will always be returned in the email field for the organizer, creator and attendees, even if no real email address is available (i.e. a generated, non-working value will be provided).
    @param showHiddenInvitations Whether to include hidden invitations in the result. Optional. The default is False.
    @param pageToken Token specifying which result page to return. Optional.
    @param timeMin Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMax is set, timeMin must be smaller than timeMax.
    @param timeMax Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMin is set, timeMax must be greater than timeMin.
    @param iCalUID Specifies event ID in the iCalendar format to be included in the response. Optional.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?maxResults:int ->
    ?q:string ->
    ?timeZone:string ->
    ?sharedExtendedProperty:string list ->
    ?syncToken:string ->
    ?updatedMin:GapiDate.t ->
    ?maxAttendees:int ->
    ?privateExtendedProperty:string list ->
    ?singleEvents:bool ->
    ?showDeleted:bool ->
    ?orderBy:OrderBy.t ->
    ?alwaysIncludeEmail:bool ->
    ?showHiddenInvitations:bool ->
    ?pageToken:string ->
    ?timeMin:GapiDate.t ->
    ?timeMax:GapiDate.t ->
    ?iCalUID:string ->
    calendarId:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Events.t * GapiConversation.Session.t
  
  (** Deletes an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Deprecated. Please use sendUpdates instead.

Whether to send notifications about the deletion of the event. Note that some emails might still be sent even if you set the value to false. The default is false.
    @param sendUpdates Guests who should receive notifications about the deletion of the event.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param eventId Event identifier.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    ?sendUpdates:SendUpdates.t ->
    calendarId:string ->
    eventId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Watch for changes to Events resources.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param maxResults Maximum number of events returned on one result page. The number of events in the resulting page may be less than this value, or none at all, even if there are more events matching the query. Incomplete pages can be detected by a non-empty nextPageToken field in the response. By default the value is 250 events. The page size can never be larger than 2500 events. Optional.
    @param timeMax Upper bound (exclusive) for an event's start time to filter by. Optional. The default is not to filter by start time. Must be an RFC3339 timestamp with mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMin is set, timeMax must be greater than timeMin.
    @param timeZone Time zone used in the response. Optional. The default is the time zone of the calendar.
    @param iCalUID Specifies event ID in the iCalendar format to be included in the response. Optional.
    @param privateExtendedProperty Extended properties constraint specified as propertyName=value. Matches only private properties. This parameter might be repeated multiple times to return events that match all given constraints.
    @param orderBy The order of the events returned in the result. Optional. The default is an unspecified, stable order.
    @param singleEvents Whether to expand recurring events into instances and only return single one-off events and instances of recurring events, but not the underlying recurring events themselves. Optional. The default is False.
    @param showDeleted Whether to include deleted events (with status equals "cancelled") in the result. Cancelled instances of recurring events (but not the underlying recurring event) will still be included if showDeleted and singleEvents are both False. If showDeleted and singleEvents are both True, only single instances of deleted events (but not the underlying recurring events) are returned. Optional. The default is False.
    @param q Free text search terms to find events that match these terms in any field, except for extended properties. Optional.
    @param sharedExtendedProperty Extended properties constraint specified as propertyName=value. Matches only shared properties. This parameter might be repeated multiple times to return events that match all given constraints.
    @param updatedMin Lower bound for an event's last modification time (as a RFC3339 timestamp) to filter by. When specified, entries deleted since this time will always be included regardless of showDeleted. Optional. The default is not to filter by last modification time.
    @param timeMin Lower bound (exclusive) for an event's end time to filter by. Optional. The default is not to filter by end time. Must be an RFC3339 timestamp with mandatory time zone offset, for example, 2011-06-03T10:00:00-07:00, 2011-06-03T10:00:00Z. Milliseconds may be provided but are ignored. If timeMax is set, timeMin must be smaller than timeMax.
    @param pageToken Token specifying which result page to return. Optional.
    @param syncToken Token obtained from the nextSyncToken field returned on the last page of results from the previous list request. It makes the result of this list request contain only entries that have changed since then. All events deleted since the previous list request will always be in the result set and it is not allowed to set showDeleted to False.
There are several query parameters that cannot be specified together with nextSyncToken to ensure consistency of the client state.

These are: 
- iCalUID 
- orderBy 
- privateExtendedProperty 
- q 
- sharedExtendedProperty 
- timeMin 
- timeMax 
- updatedMin If the syncToken expires, the server will respond with a 410 GONE response code and the client should clear its storage and perform a full synchronization without any syncToken.
Learn more about incremental synchronization.
Optional. The default is to return all entries.
    @param showHiddenInvitations Whether to include hidden invitations in the result. Optional. The default is False.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param alwaysIncludeEmail Deprecated and ignored. A value will always be returned in the email field for the organizer, creator and attendees, even if no real email address is available (i.e. a generated, non-working value will be provided).
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?maxResults:int ->
    ?timeMax:GapiDate.t ->
    ?timeZone:string ->
    ?iCalUID:string ->
    ?privateExtendedProperty:string list ->
    ?orderBy:OrderBy.t ->
    ?singleEvents:bool ->
    ?showDeleted:bool ->
    ?q:string ->
    ?sharedExtendedProperty:string list ->
    ?updatedMin:GapiDate.t ->
    ?timeMin:GapiDate.t ->
    ?pageToken:string ->
    ?syncToken:string ->
    ?showHiddenInvitations:bool ->
    ?maxAttendees:int ->
    ?alwaysIncludeEmail:bool ->
    calendarId:string ->
    GapiCalendarV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Channel.t * GapiConversation.Session.t
  
  (** Creates an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param conferenceDataVersion Version number of conference data supported by the API client. Version 0 assumes no conference data support and ignores conference data in the event's body. Version 1 enables support for copying of ConferenceData as well as for creating new conferences using the createRequest field of conferenceData. The default is 0.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param supportsAttachments Whether API client performing operation supports event attachments. Optional. The default is False.
    @param sendNotifications Deprecated. Please use sendUpdates instead.

Whether to send notifications about the creation of the new event. Note that some emails might still be sent even if you set the value to false. The default is false.
    @param sendUpdates Whether to send notifications about the creation of the new event. Note that some emails might still be sent. The default is false.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?conferenceDataVersion:int ->
    ?maxAttendees:int ->
    ?supportsAttachments:bool ->
    ?sendNotifications:bool ->
    ?sendUpdates:SendUpdates.t ->
    calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Updates an event. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Deprecated. Please use sendUpdates instead.

Whether to send notifications about the event update (for example, description changes, etc.). Note that some emails might still be sent even if you set the value to false. The default is false.
    @param conferenceDataVersion Version number of conference data supported by the API client. Version 0 assumes no conference data support and ignores conference data in the event's body. Version 1 enables support for copying of ConferenceData as well as for creating new conferences using the createRequest field of conferenceData. The default is 0.
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param alwaysIncludeEmail Deprecated and ignored. A value will always be returned in the email field for the organizer, creator and attendees, even if no real email address is available (i.e. a generated, non-working value will be provided).
    @param supportsAttachments Whether API client performing operation supports event attachments. Optional. The default is False.
    @param sendUpdates Guests who should receive notifications about the event update (for example, title changes, etc.).
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param eventId Event identifier.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    ?conferenceDataVersion:int ->
    ?maxAttendees:int ->
    ?alwaysIncludeEmail:bool ->
    ?supportsAttachments:bool ->
    ?sendUpdates:SendUpdates.t ->
    calendarId:string ->
    eventId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Moves an event to another calendar, i.e. changes an event's organizer.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param sendNotifications Deprecated. Please use sendUpdates instead.

Whether to send notifications about the change of the event's organizer. Note that some emails might still be sent even if you set the value to false. The default is false.
    @param sendUpdates Guests who should receive notifications about the change of the event's organizer.
    @param calendarId Calendar identifier of the source calendar where the event currently is on.
    @param eventId Event identifier.
    @param destination Calendar identifier of the target calendar where the event is to be moved to.
    *)
  val move :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?sendNotifications:bool ->
    ?sendUpdates:SendUpdates.t ->
    calendarId:string ->
    eventId:string ->
    destination:string ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Updates an event.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param conferenceDataVersion Version number of conference data supported by the API client. Version 0 assumes no conference data support and ignores conference data in the event's body. Version 1 enables support for copying of ConferenceData as well as for creating new conferences using the createRequest field of conferenceData. The default is 0.
    @param sendNotifications Deprecated. Please use sendUpdates instead.

Whether to send notifications about the event update (for example, description changes, etc.). Note that some emails might still be sent even if you set the value to false. The default is false.
    @param supportsAttachments Whether API client performing operation supports event attachments. Optional. The default is False.
    @param sendUpdates Guests who should receive notifications about the event update (for example, title changes, etc.).
    @param maxAttendees The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional.
    @param alwaysIncludeEmail Deprecated and ignored. A value will always be returned in the email field for the organizer, creator and attendees, even if no real email address is available (i.e. a generated, non-working value will be provided).
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    @param eventId Event identifier.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?conferenceDataVersion:int ->
    ?sendNotifications:bool ->
    ?supportsAttachments:bool ->
    ?sendUpdates:SendUpdates.t ->
    ?maxAttendees:int ->
    ?alwaysIncludeEmail:bool ->
    calendarId:string ->
    eventId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  (** Imports an event. This operation is used to add a private copy of an existing event to a calendar.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/calendar/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param supportsAttachments Whether API client performing operation supports event attachments. Optional. The default is False.
    @param conferenceDataVersion Version number of conference data supported by the API client. Version 0 assumes no conference data support and ignores conference data in the event's body. Version 1 enables support for copying of ConferenceData as well as for creating new conferences using the createRequest field of conferenceData. The default is 0.
    @param calendarId Calendar identifier. To retrieve calendar IDs call the calendarList.list method. If you want to access the primary calendar of the currently logged in user, use the "primary" keyword.
    *)
  val import :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?supportsAttachments:bool ->
    ?conferenceDataVersion:int ->
    calendarId:string ->
    GapiCalendarV3Model.Event.t ->
    GapiConversation.Session.t ->
    GapiCalendarV3Model.Event.t * GapiConversation.Session.t
  
  
end


