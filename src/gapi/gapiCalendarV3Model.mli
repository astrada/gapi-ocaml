(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Calendar API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/google-apps/calendar/firstapp}API Documentation}.
  *)

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

module Colors :
sig
  type t = {
    calendar : (string * ColorDefinition.t) list;
    (** Palette of calendar colors, mapping from the color ID to its definition. An 'calendarListEntry' resource refers to one of these color IDs in its 'color' field. Read-only. *)
    event : (string * ColorDefinition.t) list;
    (** Palette of event colors, mapping from the color ID to its definition. An 'event' resource may refer to one of these color IDs in its 'color' field. Read-only. *)
    kind : string;
    (** Type of the resource ("calendar#colors"). *)
    updated : GapiDate.t;
    (** Last modification time of the color palette (as a RFC 3339 timestamp). Read-only. *)
    
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

module Setting :
sig
  type t = {
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Name of the user setting. *)
    kind : string;
    (** Type of the resource ("calendar#setting"). *)
    value : string;
    (** Value of the user setting. The format of the value depends on the ID of the setting. *)
    
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
    (** The attendee's email address, if available. This field must be present when adding an attendee. *)
    id : string;
    (** The attendee's Profile ID, if available. *)
    optional : bool;
    (** Whether this is an optional attendee. Optional. The default is False. *)
    organizer : bool;
    (** Whether the attendee is the organizer of the event. Read-only. The default is False. *)
    resource : bool;
    (** Whether the attendee is a resource. Read-only. The default is False. *)
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

module EventDateTime :
sig
  type t = {
    date : GapiDate.t;
    (** The date, in the format "yyyy-mm-dd", if this is an all-day event. *)
    dateTime : GapiDate.t;
    (** The time, as a combined date-time value (formatted according to RFC 3339). A time zone offset is required unless a time zone is explicitly specified in 'timeZone'. *)
    timeZone : string;
    (** The name of the time zone in which the time is specified (e.g. "Europe/Zurich"). Optional. The default is the time zone of the calendar. *)
    
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

module EventReminder :
sig
  type t = {
    _method : string;
    (** The method used by this reminder. Possible values are:  
- "email" - Reminders are sent via email. 
- "sms" - Reminders are sent via SMS. 
- "popup" - Reminders are sent via a UI popup. *)
    minutes : int;
    (** Number of minutes before the start of the event when the reminder should trigger. *)
    
  }
  
  val _method : (t, string) GapiLens.t
  val minutes : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Event :
sig
  module Reminders :
  sig
    type t = {
      overrides : EventReminder.t list;
      (** If the event doesn't use the default reminders, this lists the reminders specific to the event, or, if not set, indicates that no reminders are set for this event. *)
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
      (** The organizer's email address, if available. *)
      id : string;
      (** The organizer's Profile ID, if available. *)
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
      (** The gadget's height in pixels. Optional. *)
      iconLink : string;
      (** The gadget's icon URL. *)
      link : string;
      (** The gadget's URL. *)
      preferences : (string * string) list;
      (** Preferences. *)
      title : string;
      (** The gadget's title. *)
      _type : string;
      (** The gadget's type. *)
      width : int;
      (** The gadget's width in pixels. Optional. *)
      
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
      (** The creator's Profile ID, if available. *)
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
    (** Whether anyone can invite themselves to the event. Optional. The default is False. *)
    attendees : EventAttendee.t list;
    (** The attendees of the event. *)
    attendeesOmitted : bool;
    (** Whether attendees may have been omitted from the event's representation. When retrieving an event, this may be due to a restriction specified by the 'maxAttendee' query parameter. When updating an event, this can be used to only update the participant's response. Optional. The default is False. *)
    colorId : string;
    (** The color of the event. This is an ID referring to an entry in the "event" section of the colors definition (see the "colors" endpoint). Optional. *)
    created : GapiDate.t;
    (** Creation time of the event (as a RFC 3339 timestamp). Read-only. *)
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
    (** Event ID in the iCalendar format. *)
    id : string;
    (** Identifier of the event. *)
    kind : string;
    (** Type of the resource ("calendar#event"). *)
    location : string;
    (** Geographic location of the event as free-form text. Optional. *)
    locked : bool;
    (** Whether this is a locked event copy where no changes can be made to the main event fields "summary", "description", "location", "start", "end" or "recurrence". The default is False. Read-Only. *)
    organizer : Organizer.t;
    (** The organizer of the event. If the organizer is also an attendee, this is indicated with a separate entry in 'attendees' with the 'organizer' field set to True. To change the organizer, use the "move" operation. Read-only, except when importing an event. *)
    originalStartTime : EventDateTime.t;
    (** For an instance of a recurring event, this is the time at which this event would start according to the recurrence data in the recurring event identified by recurringEventId. Immutable. *)
    privateCopy : bool;
    (** Whether this is a private event copy where changes are not shared with other copies on other calendars. Optional. Immutable. *)
    recurrence : string list;
    (** List of RRULE, EXRULE, RDATE and EXDATE lines for a recurring event. This field is omitted for single events or instances of recurring events. *)
    recurringEventId : string;
    (** For an instance of a recurring event, this is the event ID of the recurring event itself. Immutable. *)
    reminders : Reminders.t;
    (** Information about the event's reminders for the authenticated user. *)
    sequence : int;
    (** Sequence number as per iCalendar. *)
    start : EventDateTime.t;
    (** The (inclusive) start time of the event. For a recurring event, this is the start time of the first instance. *)
    status : string;
    (** Status of the event. Optional. Possible values are:  
- "confirmed" - The event is confirmed. This is the default status. 
- "tentative" - The event is tentatively confirmed. 
- "cancelled" - The event is cancelled. *)
    summary : string;
    (** Title of the event. *)
    transparency : string;
    (** Whether the event blocks time on the calendar. Optional. Possible values are:  
- "opaque" - The event blocks time on the calendar. This is the default value. 
- "transparent" - The event does not block time on the calendar. *)
    updated : GapiDate.t;
    (** Last modification time of the event (as a RFC 3339 timestamp). Read-only. *)
    visibility : string;
    (** Visibility of the event. Optional. Possible values are:  
- "default" - Uses the default visibility for events on the calendar. This is the default value. 
- "public" - The event is public and event details are visible to all readers of the calendar. 
- "private" - The event is private and only event attendees may view event details. 
- "confidential" - The event is private. This value is provided for compatibility reasons. *)
    
  }
  
  val anyoneCanAddSelf : (t, bool) GapiLens.t
  val attendees : (t, EventAttendee.t list) GapiLens.t
  val attendeesOmitted : (t, bool) GapiLens.t
  val colorId : (t, string) GapiLens.t
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

module FreeBusyRequest :
sig
  type t = {
    calendarExpansionMax : int;
    (** Maximal number of calendars for which FreeBusy information is to be provided. Optional. *)
    groupExpansionMax : int;
    (** Maximal number of calendar identifiers to be provided for a single group. Optional. An error will be returned for a group with more members than this value. *)
    items : FreeBusyRequestItem.t list;
    (** List of calendars and/or groups to query. *)
    timeMax : GapiDate.t;
    (** The end of the interval for the query. *)
    timeMin : GapiDate.t;
    (** The start of the interval for the query. *)
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
    (** Token used to access the next page of this result. Omitted if no further results are available. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, AclRule.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
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
    (** The default reminders on the calendar for the authenticated user. These reminders apply to all events on this calendar that do not explicitly override them (i.e. do not have 'reminders.useDefault' set to 'true'). *)
    description : string;
    (** Description of the calendar. Read-only. *)
    etag : string;
    (** ETag of the collection. *)
    items : Event.t list;
    (** List of events on the calendar. *)
    kind : string;
    (** Type of the collection ("calendar#events"). *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available. *)
    summary : string;
    (** Title of the calendar. Read-only. *)
    timeZone : string;
    (** The time zone of the calendar. Read-only. *)
    updated : GapiDate.t;
    (** Last modification time of the calendar (as a RFC 3339 timestamp). Read-only. *)
    
  }
  
  val accessRole : (t, string) GapiLens.t
  val defaultReminders : (t, EventReminder.t list) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val items : (t, Event.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
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
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Setting.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Calendar :
sig
  type t = {
    description : string;
    (** Description of the calendar. Optional. *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the calendar. *)
    kind : string;
    (** Type of the resource ("calendar#calendar"). *)
    location : string;
    (** Geographic location of the calendar as free-form text. Optional. *)
    summary : string;
    (** Title of the calendar. *)
    timeZone : string;
    (** The time zone of the calendar. Optional. *)
    
  }
  
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

module CalendarListEntry :
sig
  type t = {
    accessRole : string;
    (** The effective access role that the authenticated user has on the calendar. Read-only. Possible values are:  
- "freeBusyReader" - Provides read access to free/busy information. 
- "reader" - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
- "writer" - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
- "owner" - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs. *)
    backgroundColor : string;
    (** The main color of the calendar in the format '#0088aa'. This property supersedes the index-based colorId property. Optional. *)
    colorId : string;
    (** The color of the calendar. This is an ID referring to an entry in the "calendar" section of the colors definition (see the "colors" endpoint). Optional. *)
    defaultReminders : EventReminder.t list;
    (** The default reminders that the authenticated user has for this calendar. *)
    description : string;
    (** Description of the calendar. Optional. Read-only. *)
    etag : string;
    (** ETag of the resource. *)
    foregroundColor : string;
    (** The foreground color of the calendar in the format '#ffffff'. This property supersedes the index-based colorId property. Optional. *)
    hidden : bool;
    (** Whether the calendar has been hidden from the list. Optional. The default is False. *)
    id : string;
    (** Identifier of the calendar. *)
    kind : string;
    (** Type of the resource ("calendar#calendarListEntry"). *)
    location : string;
    (** Geographic location of the calendar as free-form text. Optional. Read-only. *)
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
  val defaultReminders : (t, EventReminder.t list) GapiLens.t
  val description : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val foregroundColor : (t, string) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
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
    (** Token used to access the next page of this result. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, CalendarListEntry.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

