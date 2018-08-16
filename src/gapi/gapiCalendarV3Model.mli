(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Calendar API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/google-apps/calendar/firstapp}API Documentation}.
  *)

module FreeBusyRequestItem :
sig
  type t = {
    id : string;
    (** The identifier of a calendar or a group. *)
    
  }
  
  val id : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FreeBusyRequest :
sig
  type t = {
    calendarExpansionMax : int;
    (** Maximal number of calendars for which FreeBusy information is to be provided. Optional. Maximum value is 50. *)
    groupExpansionMax : int;
    (** Maximal number of calendar identifiers to be provided for a single group. Optional. An error is returned for a group with more members than this value. Maximum value is 100. *)
    items : FreeBusyRequestItem.t list;
    (** List of calendars and/or groups to query. *)
    timeMax : GapiDate.t;
    (** The end of the interval for the query formatted as per RFC3339. *)
    timeMin : GapiDate.t;
    (** The start of the interval for the query formatted as per RFC3339. *)
    timeZone : string;
    (** Time zone used in the response. Optional. The default is UTC. *)
    
  }
  
  val calendarExpansionMax : (t, int) GapiLens.t
  val groupExpansionMax : (t, int) GapiLens.t
  val items : (t, FreeBusyRequestItem.t list) GapiLens.t
  val timeMax : (t, GapiDate.t) GapiLens.t
  val timeMin : (t, GapiDate.t) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Setting :
sig
  type t = {
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** The id of the user setting. *)
    kind : string;
    (** Type of the resource ("calendar#setting"). *)
    value : string;
    (** Value of the user setting. The format of the value depends on the ID of the setting. It must always be a UTF-8 string of length up to 1024 characters. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Settings :
sig
  type t = {
    etag : string;
    (** Etag of the collection. *)
    items : Setting.t list;
    (** List of user settings. *)
    kind : string;
    (** Type of the collection ("calendar#settings"). *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided. *)
    nextSyncToken : string;
    (** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Setting.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val nextSyncToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EventAttendee :
sig
  type t = {
    additionalGuests : int;
    (** Number of additional guests. Optional. The default is 0. *)
    comment : string;
    (** The attendee's response comment. Optional. *)
    displayName : string;
    (** The attendee's name, if available. Optional. *)
    email : string;
    (** The attendee's email address, if available. This field must be present when adding an attendee. It must be a valid email address as per RFC5322.
Required when adding an attendee. *)
    id : string;
    (** The attendee's Profile ID, if available. It corresponds to the id field in the People collection of the Google+ API *)
    optional : bool;
    (** Whether this is an optional attendee. Optional. The default is False. *)
    organizer : bool;
    (** Whether the attendee is the organizer of the event. Read-only. The default is False. *)
    resource : bool;
    (** Whether the attendee is a resource. Can only be set when the attendee is added to the event for the first time. Subsequent modifications are ignored. Optional. The default is False. *)
    responseStatus : string;
    (** The attendee's response status. Possible values are:  
- "needsAction" - The attendee has not responded to the invitation. 
- "declined" - The attendee has declined the invitation. 
- "tentative" - The attendee has tentatively accepted the invitation. 
- "accepted" - The attendee has accepted the invitation. *)
    self : bool;
    (** Whether this entry represents the calendar on which this copy of the event appears. Read-only. The default is False. *)
    
  }
  
  val additionalGuests : (t, int) GapiLens.t
  val comment : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val email : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val optional : (t, bool) GapiLens.t
  val organizer : (t, bool) GapiLens.t
  val resource : (t, bool) GapiLens.t
  val responseStatus : (t, string) GapiLens.t
  val self : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EntryPoint :
sig
  type t = {
    accessCode : string;
    (** The access code to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of \{meetingCode, accessCode, passcode, password, pin\} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional. *)
    entryPointType : string;
    (** The type of the conference entry point.
Possible values are:  
- "video" - joining a conference over HTTP. A conference can have zero or one video entry point.
- "phone" - joining a conference by dialing a phone number. A conference can have zero or more phone entry points.
- "sip" - joining a conference over SIP. A conference can have zero or one sip entry point.
- "more" - further conference joining instructions, for example additional phone numbers. A conference can have zero or one more entry point. A conference with only a more entry point is not a valid conference. *)
    label : string;
    (** The label for the URI. Visible to end users. Not localized. The maximum length is 512 characters.
Examples:  
- for video: meet.google.com/aaa-bbbb-ccc
- for phone: +1 123 268 2601
- for sip: 12345678\@altostrat.com
- for more: should not be filled  
Optional. *)
    meetingCode : string;
    (** The meeting code to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of \{meetingCode, accessCode, passcode, password, pin\} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional. *)
    passcode : string;
    (** The passcode to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of \{meetingCode, accessCode, passcode, password, pin\} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed. *)
    password : string;
    (** The password to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of \{meetingCode, accessCode, passcode, password, pin\} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional. *)
    pin : string;
    (** The PIN to access the conference. The maximum length is 128 characters.
When creating new conference data, populate only the subset of \{meetingCode, accessCode, passcode, password, pin\} fields that match the terminology that the conference provider uses. Only the populated fields should be displayed.
Optional. *)
    uri : string;
    (** The URI of the entry point. The maximum length is 1300 characters.
Format:  
- for video, http: or https: schema is required.
- for phone, tel: schema is required. The URI should include the entire dial sequence (e.g., tel:+12345678900,,,123456789;1234).
- for sip, sip: schema is required, e.g., sip:12345678\@myprovider.com.
- for more, http: or https: schema is required. *)
    
  }
  
  val accessCode : (t, string) GapiLens.t
  val entryPointType : (t, string) GapiLens.t
  val label : (t, string) GapiLens.t
  val meetingCode : (t, string) GapiLens.t
  val passcode : (t, string) GapiLens.t
  val password : (t, string) GapiLens.t
  val pin : (t, string) GapiLens.t
  val uri : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Error :
sig
  type t = {
    domain : string;
    (** Domain, or broad category, of the error. *)
    reason : string;
    (** Specific reason for the error. Some of the possible values are:  
- "groupTooBig" - The group of users requested is too large for a single query. 
- "tooManyCalendarsRequested" - The number of calendars requested is too large for a single query. 
- "notFound" - The requested resource was not found. 
- "internalError" - The API service has encountered an internal error.  Additional error types may be added in the future, so clients should gracefully handle additional error statuses not included in this list. *)
    
  }
  
  val domain : (t, string) GapiLens.t
  val reason : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ColorDefinition :
sig
  type t = {
    background : string;
    (** The background color associated with this color definition. *)
    foreground : string;
    (** The foreground color that can be used to write on top of a background with 'background' color. *)
    
  }
  
  val background : (t, string) GapiLens.t
  val foreground : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FreeBusyGroup :
sig
  type t = {
    calendars : string list;
    (** List of calendars' identifiers within a group. *)
    errors : Error.t list;
    (** Optional error(s) (if computation for the group failed). *)
    
  }
  
  val calendars : (t, string list) GapiLens.t
  val errors : (t, Error.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceProperties :
sig
  type t = {
    allowedConferenceSolutionTypes : string list;
    (** The types of conference solutions that are supported for this calendar.
The possible values are:  
- "eventHangout" 
- "eventNamedHangout" 
- "hangoutsMeet"  Optional. *)
    
  }
  
  val allowedConferenceSolutionTypes : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceParametersAddOnParameters :
sig
  type t = {
    parameters : (string * string) list;
    (**  *)
    
  }
  
  val parameters : (t, (string * string) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceParameters :
sig
  type t = {
    addOnParameters : ConferenceParametersAddOnParameters.t;
    (** Additional add-on specific data. *)
    
  }
  
  val addOnParameters : (t, ConferenceParametersAddOnParameters.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CalendarNotification :
sig
  type t = {
    _method : string;
    (** The method used to deliver the notification. Possible values are:  
- "email" - Reminders are sent via email. 
- "sms" - Reminders are sent via SMS. This value is read-only and is ignored on inserts and updates. SMS reminders are only available for G Suite customers.  
Required when adding a notification. *)
    _type : string;
    (** The type of notification. Possible values are:  
- "eventCreation" - Notification sent when a new event is put on the calendar. 
- "eventChange" - Notification sent when an event is changed. 
- "eventCancellation" - Notification sent when an event is cancelled. 
- "eventResponse" - Notification sent when an attendee responds to the event invitation. 
- "agenda" - An agenda with the events of the day (sent out in the morning).  
Required when adding a notification. *)
    
  }
  
  val _method : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EventReminder :
sig
  type t = {
    _method : string;
    (** The method used by this reminder. Possible values are:  
- "email" - Reminders are sent via email. 
- "sms" - Reminders are sent via SMS. These are only available for G Suite customers. Requests to set SMS reminders for other account types are ignored. 
- "popup" - Reminders are sent via a UI popup.  
Required when adding a reminder. *)
    minutes : int;
    (** Number of minutes before the start of the event when the reminder should trigger. Valid values are between 0 and 40320 (4 weeks in minutes).
Required when adding a reminder. *)
    
  }
  
  val _method : (t, string) GapiLens.t
  val minutes : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CalendarListEntry :
sig
  module NotificationSettings :
  sig
    type t = {
      notifications : CalendarNotification.t list;
      (** The list of notifications set for this calendar. *)
      
    }
    
    val notifications : (t, CalendarNotification.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accessRole : string;
    (** The effective access role that the authenticated user has on the calendar. Read-only. Possible values are:  
- "freeBusyReader" - Provides read access to free/busy information. 
- "reader" - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs. *)
    backgroundColor : string;
    (** The main color of the calendar in the hexadecimal format "#0088aa". This property supersedes the index-based colorId property. To set or change this property, you need to specify colorRgbFormat=true in the parameters of the insert, update and patch methods. Optional. *)
    colorId : string;
    (** The color of the calendar. This is an ID referring to an entry in the calendar section of the colors definition (see the colors endpoint). This property is superseded by the backgroundColor and foregroundColor properties and can be ignored when using these properties. Optional. *)
    conferenceProperties : ConferenceProperties.t;
    (** Conferencing properties for this calendar, for example what types of conferences are allowed. *)
    defaultReminders : EventReminder.t list;
    (** The default reminders that the authenticated user has for this calendar. *)
    deleted : bool;
    (** Whether this calendar list entry has been deleted from the calendar list. Read-only. Optional. The default is False. *)
    description : string;
    (** Description of the calendar. Optional. Read-only. *)
    etag : string;
    (** ETag of the resource. *)
    foregroundColor : string;
    (** The foreground color of the calendar in the hexadecimal format "#ffffff". This property supersedes the index-based colorId property. To set or change this property, you need to specify colorRgbFormat=true in the parameters of the insert, update and patch methods. Optional. *)
    hidden : bool;
    (** Whether the calendar has been hidden from the list. Optional. The default is False. *)
    id : string;
    (** Identifier of the calendar. *)
    kind : string;
    (** Type of the resource ("calendar#calendarListEntry"). *)
    location : string;
    (** Geographic location of the calendar as free-form text. Optional. Read-only. *)
    notificationSettings : NotificationSettings.t;
    (** The notifications that the authenticated user is receiving for this calendar. *)
    primary : bool;
    (** Whether the calendar is the primary calendar of the authenticated user. Read-only. Optional. The default is False. *)
    selected : bool;
    (** Whether the calendar content shows up in the calendar UI. Optional. The default is False. *)
    summary : string;
    (** Title of the calendar. Read-only. *)
    summaryOverride : string;
    (** The summary that the authenticated user has set for this calendar. Optional. *)
    timeZone : string;
    (** The time zone of the calendar. Optional. Read-only. *)
    
  }
  
  val accessRole : (t, string) GapiLens.t
  val backgroundColor : (t, string) GapiLens.t
  val colorId : (t, string) GapiLens.t
  val conferenceProperties : (t, ConferenceProperties.t) GapiLens.t
  val defaultReminders : (t, EventReminder.t list) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val foregroundColor : (t, string) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val notificationSettings : (t, NotificationSettings.t) GapiLens.t
  val primary : (t, bool) GapiLens.t
  val selected : (t, bool) GapiLens.t
  val summary : (t, string) GapiLens.t
  val summaryOverride : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CalendarList :
sig
  type t = {
    etag : string;
    (** ETag of the collection. *)
    items : CalendarListEntry.t list;
    (** Calendars that are present on the user's calendar list. *)
    kind : string;
    (** Type of the collection ("calendar#calendarList"). *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided. *)
    nextSyncToken : string;
    (** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, CalendarListEntry.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val nextSyncToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AclRule :
sig
  module Scope :
  sig
    type t = {
      _type : string;
      (** The type of the scope. Possible values are:  
- "default" - The public scope. This is the default value. 
- "user" - Limits the scope to a single user. 
- "group" - Limits the scope to a group. 
- "domain" - Limits the scope to a domain.  Note: The permissions granted to the "default", or public, scope apply to any user, authenticated or not. *)
      value : string;
      (** The email address of a user or group, or the name of a domain, depending on the scope type. Omitted for type "default". *)
      
    }
    
    val _type : (t, string) GapiLens.t
    val value : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the ACL rule. *)
    kind : string;
    (** Type of the resource ("calendar#aclRule"). *)
    role : string;
    (** The role assigned to the scope. Possible values are:  
- "none" - Provides no access. 
- "freeBusyReader" - Provides read access to free/busy information. 
- "reader" - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs. *)
    scope : Scope.t;
    (** The scope of the rule. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val role : (t, string) GapiLens.t
  val scope : (t, Scope.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Calendar :
sig
  type t = {
    conferenceProperties : ConferenceProperties.t;
    (** Conferencing properties for this calendar, for example what types of conferences are allowed. *)
    description : string;
    (** Description of the calendar. Optional. *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the calendar. To retrieve IDs call the calendarList.list() method. *)
    kind : string;
    (** Type of the resource ("calendar#calendar"). *)
    location : string;
    (** Geographic location of the calendar as free-form text. Optional. *)
    summary : string;
    (** Title of the calendar. *)
    timeZone : string;
    (** The time zone of the calendar. (Formatted as an IANA Time Zone Database name, e.g. "Europe/Zurich".) Optional. *)
    
  }
  
  val conferenceProperties : (t, ConferenceProperties.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceSolutionKey :
sig
  type t = {
    _type : string;
    (** The conference solution type.
If a client encounters an unfamiliar or empty type, it should still be able to display the entry points. However, it should disallow modifications.
The possible values are:  
- "eventHangout" for Hangouts for consumers (http://hangouts.google.com)
- "eventNamedHangout" for classic Hangouts for G Suite users (http://hangouts.google.com)
- "hangoutsMeet" for Hangouts Meet (http://meet.google.com) *)
    
  }
  
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceRequestStatus :
sig
  type t = {
    statusCode : string;
    (** The current status of the conference create request. Read-only.
The possible values are:  
- "pending": the conference create request is still being processed.
- "success": the conference create request succeeded, the entry points are populated.
- "failure": the conference create request failed, there are no entry points. *)
    
  }
  
  val statusCode : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CreateConferenceRequest :
sig
  type t = {
    conferenceSolutionKey : ConferenceSolutionKey.t;
    (** The conference solution, such as Hangouts or Hangouts Meet. *)
    requestId : string;
    (** The client-generated unique ID for this request.
Clients should regenerate this ID for every new request. If an ID provided is the same as for the previous request, the request is ignored. *)
    status : ConferenceRequestStatus.t;
    (** The status of the conference create request. *)
    
  }
  
  val conferenceSolutionKey : (t, ConferenceSolutionKey.t) GapiLens.t
  val requestId : (t, string) GapiLens.t
  val status : (t, ConferenceRequestStatus.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceSolution :
sig
  type t = {
    iconUri : string;
    (** The user-visible icon for this solution. *)
    key : ConferenceSolutionKey.t;
    (** The key which can uniquely identify the conference solution for this event. *)
    name : string;
    (** The user-visible name of this solution. Not localized. *)
    
  }
  
  val iconUri : (t, string) GapiLens.t
  val key : (t, ConferenceSolutionKey.t) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TimePeriod :
sig
  type t = {
    _end : GapiDate.t;
    (** The (exclusive) end of the time period. *)
    start : GapiDate.t;
    (** The (inclusive) start of the time period. *)
    
  }
  
  val _end : (t, GapiDate.t) GapiLens.t
  val start : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FreeBusyCalendar :
sig
  type t = {
    busy : TimePeriod.t list;
    (** List of time ranges during which this calendar should be regarded as busy. *)
    errors : Error.t list;
    (** Optional error(s) (if computation for the calendar failed). *)
    
  }
  
  val busy : (t, TimePeriod.t list) GapiLens.t
  val errors : (t, Error.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FreeBusyResponse :
sig
  type t = {
    calendars : (string * FreeBusyCalendar.t) list;
    (** List of free/busy information for calendars. *)
    groups : (string * FreeBusyGroup.t) list;
    (** Expansion of groups. *)
    kind : string;
    (** Type of the resource ("calendar#freeBusy"). *)
    timeMax : GapiDate.t;
    (** The end of the interval. *)
    timeMin : GapiDate.t;
    (** The start of the interval. *)
    
  }
  
  val calendars : (t, (string * FreeBusyCalendar.t) list) GapiLens.t
  val groups : (t, (string * FreeBusyGroup.t) list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val timeMax : (t, GapiDate.t) GapiLens.t
  val timeMin : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EventDateTime :
sig
  type t = {
    date : GapiDate.t;
    (** The date, in the format "yyyy-mm-dd", if this is an all-day event. *)
    dateTime : GapiDate.t;
    (** The time, as a combined date-time value (formatted according to RFC3339). A time zone offset is required unless a time zone is explicitly specified in timeZone. *)
    timeZone : string;
    (** The time zone in which the time is specified. (Formatted as an IANA Time Zone Database name, e.g. "Europe/Zurich".) For recurring events this field is required and specifies the time zone in which the recurrence is expanded. For single events this field is optional and indicates a custom time zone for the event start/end. *)
    
  }
  
  val date : (t, GapiDate.t) GapiLens.t
  val dateTime : (t, GapiDate.t) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EventAttachment :
sig
  type t = {
    fileId : string;
    (** ID of the attached file. Read-only.
For Google Drive files, this is the ID of the corresponding Files resource entry in the Drive API. *)
    fileUrl : string;
    (** URL link to the attachment.
For adding Google Drive file attachments use the same format as in alternateLink property of the Files resource in the Drive API.
Required when adding an attachment. *)
    iconLink : string;
    (** URL link to the attachment's icon. Read-only. *)
    mimeType : string;
    (** Internet media type (MIME type) of the attachment. *)
    title : string;
    (** Attachment title. *)
    
  }
  
  val fileId : (t, string) GapiLens.t
  val fileUrl : (t, string) GapiLens.t
  val iconLink : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConferenceData :
sig
  type t = {
    conferenceId : string;
    (** The ID of the conference.
Can be used by developers to keep track of conferences, should not be displayed to users.
Values for solution types:  
- "eventHangout": unset.
- "eventNamedHangout": the name of the Hangout.
- "hangoutsMeet": the 10-letter meeting code, for example "aaa-bbbb-ccc".  Optional. *)
    conferenceSolution : ConferenceSolution.t;
    (** The conference solution, such as Hangouts or Hangouts Meet.
Unset for a conference with a failed create request.
Either conferenceSolution and at least one entryPoint, or createRequest is required. *)
    createRequest : CreateConferenceRequest.t;
    (** A request to generate a new conference and attach it to the event. The data is generated asynchronously. To see whether the data is present check the status field.
Either conferenceSolution and at least one entryPoint, or createRequest is required. *)
    entryPoints : EntryPoint.t list;
    (** Information about individual conference entry points, such as URLs or phone numbers.
All of them must belong to the same conference.
Either conferenceSolution and at least one entryPoint, or createRequest is required. *)
    notes : string;
    (** Additional notes (such as instructions from the domain administrator, legal notices) to display to the user. Can contain HTML. The maximum length is 2048 characters. Optional. *)
    parameters : ConferenceParameters.t;
    (** Additional properties related to a conference. An example would be a solution-specific setting for enabling video streaming. *)
    signature : string;
    (** The signature of the conference data.
Genereated on server side. Must be preserved while copying the conference data between events, otherwise the conference data will not be copied.
Unset for a conference with a failed create request.
Optional for a conference with a pending create request. *)
    
  }
  
  val conferenceId : (t, string) GapiLens.t
  val conferenceSolution : (t, ConferenceSolution.t) GapiLens.t
  val createRequest : (t, CreateConferenceRequest.t) GapiLens.t
  val entryPoints : (t, EntryPoint.t list) GapiLens.t
  val notes : (t, string) GapiLens.t
  val parameters : (t, ConferenceParameters.t) GapiLens.t
  val signature : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Event :
sig
  module Source :
  sig
    type t = {
      title : string;
      (** Title of the source; for example a title of a web page or an email subject. *)
      url : string;
      (** URL of the source pointing to a resource. The URL scheme must be HTTP or HTTPS. *)
      
    }
    
    val title : (t, string) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Reminders :
  sig
    type t = {
      overrides : EventReminder.t list;
      (** If the event doesn't use the default reminders, this lists the reminders specific to the event, or, if not set, indicates that no reminders are set for this event. The maximum number of override reminders is 5. *)
      useDefault : bool;
      (** Whether the default reminders of the calendar apply to the event. *)
      
    }
    
    val overrides : (t, EventReminder.t list) GapiLens.t
    val useDefault : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Organizer :
  sig
    type t = {
      displayName : string;
      (** The organizer's name, if available. *)
      email : string;
      (** The organizer's email address, if available. It must be a valid email address as per RFC5322. *)
      id : string;
      (** The organizer's Profile ID, if available. It corresponds to the id field in the People collection of the Google+ API *)
      self : bool;
      (** Whether the organizer corresponds to the calendar on which this copy of the event appears. Read-only. The default is False. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val email : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val self : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Gadget :
  sig
    type t = {
      display : string;
      (** The gadget's display mode. Optional. Possible values are:  
- "icon" - The gadget displays next to the event's title in the calendar view. 
- "chip" - The gadget displays when the event is clicked. *)
      height : int;
      (** The gadget's height in pixels. The height must be an integer greater than 0. Optional. *)
      iconLink : string;
      (** The gadget's icon URL. The URL scheme must be HTTPS. *)
      link : string;
      (** The gadget's URL. The URL scheme must be HTTPS. *)
      preferences : (string * string) list;
      (** Preferences. *)
      title : string;
      (** The gadget's title. *)
      _type : string;
      (** The gadget's type. *)
      width : int;
      (** The gadget's width in pixels. The width must be an integer greater than 0. Optional. *)
      
    }
    
    val display : (t, string) GapiLens.t
    val height : (t, int) GapiLens.t
    val iconLink : (t, string) GapiLens.t
    val link : (t, string) GapiLens.t
    val preferences : (t, (string * string) list) GapiLens.t
    val title : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    val width : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ExtendedProperties :
  sig
    type t = {
      _private : (string * string) list;
      (** Properties that are private to the copy of the event that appears on this calendar. *)
      shared : (string * string) list;
      (** Properties that are shared between copies of the event on other attendees' calendars. *)
      
    }
    
    val _private : (t, (string * string) list) GapiLens.t
    val shared : (t, (string * string) list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Creator :
  sig
    type t = {
      displayName : string;
      (** The creator's name, if available. *)
      email : string;
      (** The creator's email address, if available. *)
      id : string;
      (** The creator's Profile ID, if available. It corresponds to the id field in the People collection of the Google+ API *)
      self : bool;
      (** Whether the creator corresponds to the calendar on which this copy of the event appears. Read-only. The default is False. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val email : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val self : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    anyoneCanAddSelf : bool;
    (** Whether anyone can invite themselves to the event (currently works for Google+ events only). Optional. The default is False. *)
    attachments : EventAttachment.t list;
    (** File attachments for the event. Currently only Google Drive attachments are supported.
In order to modify attachments the supportsAttachments request parameter should be set to true.
There can be at most 25 attachments per event, *)
    attendees : EventAttendee.t list;
    (** The attendees of the event. See the Events with attendees guide for more information on scheduling events with other calendar users. *)
    attendeesOmitted : bool;
    (** Whether attendees may have been omitted from the event's representation. When retrieving an event, this may be due to a restriction specified by the maxAttendee query parameter. When updating an event, this can be used to only update the participant's response. Optional. The default is False. *)
    colorId : string;
    (** The color of the event. This is an ID referring to an entry in the event section of the colors definition (see the  colors endpoint). Optional. *)
    conferenceData : ConferenceData.t;
    (** The conference-related information, such as details of a Hangouts Meet conference. To create new conference details use the createRequest field. To persist your changes, remember to set the conferenceDataVersion request parameter to 1 for all event modification requests. *)
    created : GapiDate.t;
    (** Creation time of the event (as a RFC3339 timestamp). Read-only. *)
    creator : Creator.t;
    (** The creator of the event. Read-only. *)
    description : string;
    (** Description of the event. Optional. *)
    _end : EventDateTime.t;
    (** The (exclusive) end time of the event. For a recurring event, this is the end time of the first instance. *)
    endTimeUnspecified : bool;
    (** Whether the end time is actually unspecified. An end time is still provided for compatibility reasons, even if this attribute is set to True. The default is False. *)
    etag : string;
    (** ETag of the resource. *)
    extendedProperties : ExtendedProperties.t;
    (** Extended properties of the event. *)
    gadget : Gadget.t;
    (** A gadget that extends this event. *)
    guestsCanInviteOthers : bool;
    (** Whether attendees other than the organizer can invite others to the event. Optional. The default is True. *)
    guestsCanModify : bool;
    (** Whether attendees other than the organizer can modify the event. Optional. The default is False. *)
    guestsCanSeeOtherGuests : bool;
    (** Whether attendees other than the organizer can see who the event's attendees are. Optional. The default is True. *)
    hangoutLink : string;
    (** An absolute link to the Google+ hangout associated with this event. Read-only. *)
    htmlLink : string;
    (** An absolute link to this event in the Google Calendar Web UI. Read-only. *)
    iCalUID : string;
    (** Event unique identifier as defined in RFC5545. It is used to uniquely identify events accross calendaring systems and must be supplied when importing events via the import method.
Note that the icalUID and the id are not identical and only one of them should be supplied at event creation time. One difference in their semantics is that in recurring events, all occurrences of one event have different ids while they all share the same icalUIDs. *)
    id : string;
    (** Opaque identifier of the event. When creating new single or recurring events, you can specify their IDs. Provided IDs must follow these rules:  
- characters allowed in the ID are those used in base32hex encoding, i.e. lowercase letters a-v and digits 0-9, see section 3.1.2 in RFC2938 
- the length of the ID must be between 5 and 1024 characters 
- the ID must be unique per calendar  Due to the globally distributed nature of the system, we cannot guarantee that ID collisions will be detected at event creation time. To minimize the risk of collisions we recommend using an established UUID algorithm such as one described in RFC4122.
If you do not specify an ID, it will be automatically generated by the server.
Note that the icalUID and the id are not identical and only one of them should be supplied at event creation time. One difference in their semantics is that in recurring events, all occurrences of one event have different ids while they all share the same icalUIDs. *)
    kind : string;
    (** Type of the resource ("calendar#event"). *)
    location : string;
    (** Geographic location of the event as free-form text. Optional. *)
    locked : bool;
    (** Whether this is a locked event copy where no changes can be made to the main event fields "summary", "description", "location", "start", "end" or "recurrence". The default is False. Read-Only. *)
    organizer : Organizer.t;
    (** The organizer of the event. If the organizer is also an attendee, this is indicated with a separate entry in attendees with the organizer field set to True. To change the organizer, use the move operation. Read-only, except when importing an event. *)
    originalStartTime : EventDateTime.t;
    (** For an instance of a recurring event, this is the time at which this event would start according to the recurrence data in the recurring event identified by recurringEventId. It uniquely identifies the instance within the recurring event series even if the instance was moved to a different time. Immutable. *)
    privateCopy : bool;
    (** Whether this is a private event copy where changes are not shared with other copies on other calendars. Optional. Immutable. The default is False. *)
    recurrence : string list;
    (** List of RRULE, EXRULE, RDATE and EXDATE lines for a recurring event, as specified in RFC5545. Note that DTSTART and DTEND lines are not allowed in this field; event start and end times are specified in the start and end fields. This field is omitted for single events or instances of recurring events. *)
    recurringEventId : string;
    (** For an instance of a recurring event, this is the id of the recurring event to which this instance belongs. Immutable. *)
    reminders : Reminders.t;
    (** Information about the event's reminders for the authenticated user. *)
    sequence : int;
    (** Sequence number as per iCalendar. *)
    source : Source.t;
    (** Source from which the event was created. For example, a web page, an email message or any document identifiable by an URL with HTTP or HTTPS scheme. Can only be seen or modified by the creator of the event. *)
    start : EventDateTime.t;
    (** The (inclusive) start time of the event. For a recurring event, this is the start time of the first instance. *)
    status : string;
    (** Status of the event. Optional. Possible values are:  
- "confirmed" - The event is confirmed. This is the default status. 
- "tentative" - The event is tentatively confirmed. 
- "cancelled" - The event is cancelled (deleted). The list method returns cancelled events only on incremental sync (when syncToken or updatedMin are specified) or if the showDeleted flag is set to true. The get method always returns them.
A cancelled status represents two different states depending on the event type:  
- Cancelled exceptions of an uncancelled recurring event indicate that this instance should no longer be presented to the user. Clients should store these events for the lifetime of the parent recurring event.
Cancelled exceptions are only guaranteed to have values for the id, recurringEventId and originalStartTime fields populated. The other fields might be empty.  
- All other cancelled events represent deleted events. Clients should remove their locally synced copies. Such cancelled events will eventually disappear, so do not rely on them being available indefinitely.
Deleted events are only guaranteed to have the id field populated.   On the organizer's calendar, cancelled events continue to expose event details (summary, location, etc.) so that they can be restored (undeleted). Similarly, the events to which the user was invited and that they manually removed continue to provide details. However, incremental sync requests with showDeleted set to false will not return these details.
If an event changes its organizer (for example via the move operation) and the original organizer is not on the attendee list, it will leave behind a cancelled event where only the id field is guaranteed to be populated. *)
    summary : string;
    (** Title of the event. *)
    transparency : string;
    (** Whether the event blocks time on the calendar. Optional. Possible values are:  
- "opaque" - Default value. The event does block time on the calendar. This is equivalent to setting Show me as to Busy in the Calendar UI. 
- "transparent" - The event does not block time on the calendar. This is equivalent to setting Show me as to Available in the Calendar UI. *)
    updated : GapiDate.t;
    (** Last modification time of the event (as a RFC3339 timestamp). Read-only. *)
    visibility : string;
    (** Visibility of the event. Optional. Possible values are:  
- "default" - Uses the default visibility for events on the calendar. This is the default value. 
- "public" - The event is public and event details are visible to all readers of the calendar. 
- "private" - The event is private and only event attendees may view event details. 
- "confidential" - The event is private. This value is provided for compatibility reasons. *)
    
  }
  
  val anyoneCanAddSelf : (t, bool) GapiLens.t
  val attachments : (t, EventAttachment.t list) GapiLens.t
  val attendees : (t, EventAttendee.t list) GapiLens.t
  val attendeesOmitted : (t, bool) GapiLens.t
  val colorId : (t, string) GapiLens.t
  val conferenceData : (t, ConferenceData.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val creator : (t, Creator.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val _end : (t, EventDateTime.t) GapiLens.t
  val endTimeUnspecified : (t, bool) GapiLens.t
  val etag : (t, string) GapiLens.t
  val extendedProperties : (t, ExtendedProperties.t) GapiLens.t
  val gadget : (t, Gadget.t) GapiLens.t
  val guestsCanInviteOthers : (t, bool) GapiLens.t
  val guestsCanModify : (t, bool) GapiLens.t
  val guestsCanSeeOtherGuests : (t, bool) GapiLens.t
  val hangoutLink : (t, string) GapiLens.t
  val htmlLink : (t, string) GapiLens.t
  val iCalUID : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val locked : (t, bool) GapiLens.t
  val organizer : (t, Organizer.t) GapiLens.t
  val originalStartTime : (t, EventDateTime.t) GapiLens.t
  val privateCopy : (t, bool) GapiLens.t
  val recurrence : (t, string list) GapiLens.t
  val recurringEventId : (t, string) GapiLens.t
  val reminders : (t, Reminders.t) GapiLens.t
  val sequence : (t, int) GapiLens.t
  val source : (t, Source.t) GapiLens.t
  val start : (t, EventDateTime.t) GapiLens.t
  val status : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val transparency : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val visibility : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Acl :
sig
  type t = {
    etag : string;
    (** ETag of the collection. *)
    items : AclRule.t list;
    (** List of rules on the access control list. *)
    kind : string;
    (** Type of the collection ("calendar#acl"). *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided. *)
    nextSyncToken : string;
    (** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, AclRule.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val nextSyncToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Events :
sig
  type t = {
    accessRole : string;
    (** The user's access role for this calendar. Read-only. Possible values are:  
- "none" - The user has no access. 
- "freeBusyReader" - The user has read access to free/busy information. 
- "reader" - The user has read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - The user has read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - The user has ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs. *)
    defaultReminders : EventReminder.t list;
    (** The default reminders on the calendar for the authenticated user. These reminders apply to all events on this calendar that do not explicitly override them (i.e. do not have reminders.useDefault set to True). *)
    description : string;
    (** Description of the calendar. Read-only. *)
    etag : string;
    (** ETag of the collection. *)
    items : Event.t list;
    (** List of events on the calendar. *)
    kind : string;
    (** Type of the collection ("calendar#events"). *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available, in which case nextSyncToken is provided. *)
    nextSyncToken : string;
    (** Token used at a later point in time to retrieve only the entries that have changed since this result was returned. Omitted if further results are available, in which case nextPageToken is provided. *)
    summary : string;
    (** Title of the calendar. Read-only. *)
    timeZone : string;
    (** The time zone of the calendar. Read-only. *)
    updated : GapiDate.t;
    (** Last modification time of the calendar (as a RFC3339 timestamp). Read-only. *)
    
  }
  
  val accessRole : (t, string) GapiLens.t
  val defaultReminders : (t, EventReminder.t list) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val items : (t, Event.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val nextSyncToken : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Channel :
sig
  type t = {
    address : string;
    (** The address where notifications are delivered for this channel. *)
    expiration : int64;
    (** Date and time of notification channel expiration, expressed as a Unix timestamp, in milliseconds. Optional. *)
    id : string;
    (** A UUID or similar unique string that identifies this channel. *)
    kind : string;
    (** Identifies this as a notification channel used to watch for changes to a resource. Value: the fixed string "api#channel". *)
    params : (string * string) list;
    (** Additional parameters controlling delivery channel behavior. Optional. *)
    payload : bool;
    (** A Boolean value to indicate whether payload is wanted. Optional. *)
    resourceId : string;
    (** An opaque ID that identifies the resource being watched on this channel. Stable across different API versions. *)
    resourceUri : string;
    (** A version-specific identifier for the watched resource. *)
    token : string;
    (** An arbitrary string delivered to the target address with each notification delivered over this channel. Optional. *)
    _type : string;
    (** The type of delivery mechanism used for this channel. *)
    
  }
  
  val address : (t, string) GapiLens.t
  val expiration : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val params : (t, (string * string) list) GapiLens.t
  val payload : (t, bool) GapiLens.t
  val resourceId : (t, string) GapiLens.t
  val resourceUri : (t, string) GapiLens.t
  val token : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Colors :
sig
  type t = {
    calendar : (string * ColorDefinition.t) list;
    (** A global palette of calendar colors, mapping from the color ID to its definition. A calendarListEntry resource refers to one of these color IDs in its color field. Read-only. *)
    event : (string * ColorDefinition.t) list;
    (** A global palette of event colors, mapping from the color ID to its definition. An event resource may refer to one of these color IDs in its color field. Read-only. *)
    kind : string;
    (** Type of the resource ("calendar#colors"). *)
    updated : GapiDate.t;
    (** Last modification time of the color palette (as a RFC3339 timestamp). Read-only. *)
    
  }
  
  val calendar : (t, (string * ColorDefinition.t) list) GapiLens.t
  val event : (t, (string * ColorDefinition.t) list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

