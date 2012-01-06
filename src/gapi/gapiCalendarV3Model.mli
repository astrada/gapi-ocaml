(** Data definition for Calendar (v3).
  
  For more information about this data model, see the
  {{:http://code.google.com/apis/calendar/v3/reference.html}API Documentation}

  *)


(** The scope of the ACL rule. *)
module ScopeData :
sig
  type t = {
    _type : string;
    (** The type of the scope. Possible values are:  
    - ["default"] - The public scope. This is the default value. 
    - ["user"] - Limits the scope to a single user. 
    - ["group"] - Limits the scope to a group. 
    - ["domain"] - Limits the scope to a domain.  Note: The permissions granted to the ["default"], or public, scope apply to any user, authenticated or not.
    *)
    value : string
    (** The email address of a user or group, or the name of a domain, depending on the scope type. Omitted for type ["default"]. *)
  }

  val _type : (t, string) GapiLens.t
  (** Functional accessors for {!_type} *)
  val value : (t, string) GapiLens.t
  (** Functional accessors for {!value} *)

  (** Default value. *)
  val empty : t

  (** Transform the record into its data model representation *)
  val render : t -> GapiJson.json_data_model list

  (** Builds the record from its data model representation *)
  val parse : t -> GapiJson.json_data_model -> t

end

module AclRule :
sig
  type t = {
    kind : string;
    (** Type of the resource (["calendar#aclRule"]). *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the ACL rule. *)
    scope : ScopeData.t;
    (** The scope of the rule. *)
    role : string;
    (** The role assigned to the scope. Possible values are:  
    - ["none"] - Provides no access. 
    - ["freeBusyReader"] - Provides read access to free/busy information. 
    - ["reader"] - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
    - ["writer"] - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
    - ["owner"] - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val scope : (t, ScopeData.t) GapiLens.t
  val role : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Acl :
sig
  type t = {
    kind : string;
    (** Type of the collection (["calendar#acl"]). *)
    etag : string;
    (** ETag of the collection. *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available. *)
    items : AclRule.t list;
    (** List of rules on the access control list. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, AclRule.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Calendar List *)

module EventReminder :
sig
  type t = {
    _method : string;
    (** The method used by this reminder. Possible values are:  
    - ["email"] - Reminders are sent via email. 
    - ["sms"] - Reminders are sent via SMS. 
    - ["popup"] - Reminders are sent via a UI popup. *)
    minutes : int
    (** Number of minutes before the start of the event when the reminder should trigger. *)
  }

  val _method : (t, string) GapiLens.t
  val minutes : (t, int) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module CalendarListEntry :
sig
  type t = {
    kind : string;
    (** Type of the resource (["calendar#calendarListEntry"]). *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the calendar. *)
    summary : string;
    (** Title of the calendar. Read-only. *)
    description : string;
    (** Description of the calendar. Optional. Read-only. *)
    location : string;
    (** Geographic location of the calendar as free-form text. Optional. Read-only. *)
    timeZone : string;
    (** The time zone of the calendar. Optional. Read-only. *)
    summaryOverride : string;
    (** The summary that the authenticated user has set for this calendar. Optional. *)
    colorId : string;
    (** The color of the calendar. This is an ID referring to an entry in the ["calendar"] section of the colors definition (see the "colors" endpoint). Optional. *)
    hidden : bool;
    (** Whether the calendar has been hidden from the list. Optional. The default is [false]. *)
    selected : bool;
    (** Whether the calendar content shows up in the calendar UI. Optional. The default is [true]. *)
    accessRole : string;
    (** The effective access role that the authenticated user has on the calendar. Read-only. Possible values are:  
    - ["freeBusyReader"] - Provides read access to free/busy information. 
    - ["reader"] - Provides read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
    - ["writer"] - Provides read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
    - ["owner"] - Provides ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs. *)
    defaultReminders : EventReminder.t list
    (** The default reminders that the authenticated user has for this calendar. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  val summaryOverride : (t, string) GapiLens.t
  val colorId : (t, string) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val selected : (t, bool) GapiLens.t
  val accessRole : (t, string) GapiLens.t
  val defaultReminders : (t, EventReminder.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module CalendarList :
sig
  type t = {
    kind : string;
    (** Type of the collection (["calendar#calendarList"]). *)
    etag : string;
    (** ETag of the collection *)
    nextPageToken : string;
    (** Token used to access the next page of this result. *)
    items : CalendarListEntry.t list
    (** Calendars that are present on the user&apos;s calendar list. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, CalendarListEntry.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Calendar *)

module Calendar :
sig
  type t = {
    kind : string;
    (** Type of the resource (["calendar#calendar"]). *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the calendar. *)
    summary : string;
    (** Title of the calendar. *)
    description : string;
    (** Description of the calendar. Optional. *)
    location : string;
    (** Geographic location of the calendar as free-form text. Optional. *)
    timeZone : string
    (** The time zone of the calendar. Optional. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Colors *)

module ColorDefinition :
sig
  type color = {
    background : string;
    (** The background color associated with this color definition. *)
    foreground : string
    (** The foreground color that can be used to write on top of a background with {!background} color. *)
  }
  type t = string * color

  val background : (color, string) GapiLens.t
  val foreground : (color, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val color : (t, color) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module Colors :
sig
  type t = {
    kind : string;
    (** Type of the resource (&quot;calendar#colors&quot;). *)
    updated : GapiDate.t;
    (** Last modification time of the color palette (as a RFC 3339 timestamp). Read-only. *)
    calendar : ColorDefinition.t list;
    (** Palette of calendar colors, mapping from the color ID to its definition. An {!CalendarListEntry} resource refers to one of these color IDs in its {!CalendarListEntry.colorId} field. Read-only. *)
    event : ColorDefinition.t list
    (** Palette of event colors, mapping from the color ID to its definition. An {!Event} resource may refer to one of these color IDs in its {!Event.colorId} field. Read-only. *)
  }

  val kind : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val calendar : (t, ColorDefinition.t list) GapiLens.t
  val event : (t, ColorDefinition.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Events *)

(** The creator/organizer of the event. Read-only. *)
module PersonData :
sig
  type t = {
    email : string;
    (** The creator/organizer's email address, if available. *)
    displayName : string
    (** The creator/organizer's name, if available. *)
  }

  val email : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module EventDateTime :
sig
  type t = {
    date : GapiDate.t;
    (** The date, in the format "yyyy-mm-dd", if this is an all-day event. *)
    dateTime : GapiDate.t;
    (** The time, as a combined date-time value (formatted according to RFC 3339). A time zone offset is required unless a time zone is explicitly specified in {!timeZone}. *)
    timeZone : string
    (** The name of the time zone in which the time is specified (e.g. "Europe/Zurich"). Optional. The default is the time zone of the calendar. *)
  }

  val date : (t, GapiDate.t) GapiLens.t
  val dateTime : (t, GapiDate.t) GapiLens.t
  val timeZone : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module EventAttendee :
sig
  type t = {
    email : string;
    (** The attendee's email address, if available. This field must be present when adding an attendee. *)
    displayName : string;
    (** The attendee's name, if available. Optional. *)
    organizer : bool;
    (** Whether the attendee is the organizer of the event. Read-only. The default is [false]. *)
    self : bool;
    (** Whether this entry represents the calendar on which this copy of the event appears. Read-only. The default is [false]. *)
    resource : bool;
    (** Whether the attendee is a resource. Read-only. The default is [false]. *)
    optional : bool;
    (** Whether this is an optional attendee. Optional. The default is [false]. *)
    responseStatus : string;
    (** The attendee's response status. Possible values are:  
    - ["needsAction"] - The attendee has not responded to the invitation. 
    - ["declined"] - The attendee has declined the invitation. 
    - ["tentative"] - The attendee has tentatively accepted the invitation. 
    - ["accepted"] - The attendee has accepted the invitation. *)
    comment : string;
    (** The attendee's response comment. Optional. *)
    additionalGuests : int
    (** Number of additional guests. Optional. The default is [0]. *)
  }

  val email : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val organizer : (t, bool) GapiLens.t
  val self : (t, bool) GapiLens.t
  val resource : (t, bool) GapiLens.t
  val optional : (t, bool) GapiLens.t
  val comment : (t, string) GapiLens.t
  val additionalGuests : (t, int) GapiLens.t
             
  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

(** Extended properties of the event. *)
module ExtendedPropertiesData :
sig
  type t = {
    _private : (string * string) list;
    (** Properties that are private to the copy of the event that appears on this calendar. *)
    shared : (string * string) list
    (** Properties that are shared between copies of the event on other attendees' calendars. *)
  }

  val _private : (t, (string * string) list) GapiLens.t
  val shared : (t, (string * string) list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

(** A gadget that extends this event. *)
module GadgetData :
sig
  type t = {
    _type : string;
    (** The gadget's type. *)
    title : string;
    (** The gadget's title. *)
    link : string;
    (** The gadget's URL. *)
    iconLink : string;
    (** The gadget's icon URL. *)
    width : int;
    (** The gadget's width in pixels. Optional. *)
    height : int;
    (** The gadget's height in pixels. Optional. *)
    display : string;
    (** The gadget's display mode. Optional. Possible values are:  
    - ["icon"] - The gadget displays next to the event's title in the calendar view. 
    - ["chip"] - The gadget displays when the event is clicked. *)
    preferences : (string * string) list;
    (** Preferences. *)
  }

  val _type : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val link : (t, string) GapiLens.t
  val iconLink : (t, string) GapiLens.t
  val width : (t, int) GapiLens.t
  val height : (t, int) GapiLens.t
  val display : (t, string) GapiLens.t
  val preferences : (t, (string * string) list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

(** Information about the event's reminders for the authenticated user. *)
module RemindersData :
sig
  type t = {
    useDefault : bool;
    (** Whether the default reminders of the calendar apply to the event. *)
    overrides : EventReminder.t list
    (** If the event doesn't use the default reminders, this lists the reminders specific to the event, or, if not set, indicates that no reminders are set for this event. *)
  }

  val useDefault : (t, bool) GapiLens.t
  val overrides : (t, EventReminder.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module Event :
sig
  type t = {
    kind : string;
    (** Type of the resource (["calendar#event"]). *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Identifier of the event. *)
    status : string;
    (** Status of the event. Optional. Possible values are:  
    - ["confirmed"] - The event is confirmed. This is the default status. 
    - ["tentative"] - The event is tentatively confirmed. 
    - ["cancelled"] - The event is cancelled. *)
    htmlLink : string;
    (** An absolute link to this event in the Google Calendar Web UI. Read-only. *)
    created : GapiDate.t;
    (** Creation time of the event (as a RFC 3339 timestamp). Read-only. *)
    updated : GapiDate.t;
    (** Last modification time of the event (as a RFC 3339 timestamp). Read-only. *)
    summary : string;
    (** Title of the event. *)
    description : string;
    (** Description of the event. Optional. *)
    location : string;
    (** Geographic location of the event as free-form text. Optional. *)
    colorId : string;
    (** The color of the event. This is an ID referring to an entry in the {!Colors.event} section of the colors definition (see the "colors" endpoint). Optional. *)
    creator : PersonData.t;
    (** The creator of the event. Read-only. *)
    organizer : PersonData.t;
    (** The organizer of the event. If the organizer is also an attendee, this is indicated with a separate entry in {!attendees} with the {!EventAttendee.organizer} field set to True. *)
    start : EventDateTime.t;
    _end : EventDateTime.t;
    recurrence : string list;
    (** List of RRULE, EXRULE, RDATE and EXDATE lines for a recurring event. This field is omitted for single events or instances of recurring events. *)
    recurringEventId : string;
    (** For an instance of a recurring event, this is the event ID of the recurring event itself. Immutable. *)
    originalStartTime : EventDateTime.t;
    transparency : string;
    (** Whether the event blocks time on the calendar. Optional. Possible values are:  
    - ["opaque"] - The event blocks time on the calendar. This is the default value. 
    - ["transparent"] - The event does not block time on the calendar. *)
    visibility : string;
    (** Visibility of the event. Optional. Possible values are:  
    - ["default"] - Uses the default visibility for events on the calendar. This is the default value. 
    - ["public"] - The event is public and event details are visible to all readers of the calendar. 
    - ["private"] - The event is private and only event attendees may view event details. 
    - ["confidential"] - The event is private. This value is provided for compatibility reasons. *)
    iCalUID : string;
    (** Event ID in the iCalendar format. *)
    sequence : int;
    (** Sequence number as per iCalendar. *)
    attendees : EventAttendee.t list;
    (** The attendees of the event. *)
    attendeesOmitted : bool;
    (** Whether attendees have been omitted from the event's representation. When retrieving an event, this is due to a restriction specified by the [GapiCalendarService.QueryParameters.maxAttendees] query parameter. When updating an event, this can be used to only update the participant's response. Optional. The default is [false]. *)
    extendedProperties : ExtendedPropertiesData.t;
    (** Extended properties of the event. *)
    gadget : GadgetData.t;
    (** A gadget that extends this event. *)
    anyoneCanAddSelf : bool;
    (** Whether anyone can invite themselves to the event. Optional. The default is [false]. *)
    guestsCanInviteOthers : bool;
    (** Whether attendees other than the organizer can invite others to the event. Optional. The default is [false]. *)
    guestsCanModify : bool;
    (** Whether attendees other than the organizer can modify the event. Optional. The default is [false]. *)
    guestsCanSeeOtherGuests : bool;
    (** Whether attendees other than the organizer can see who the event's attendees are. Optional. The default is [false]. *)
    privateCopy : bool;
    (** Whether this is a private event copy where changes are not shared with other copies on other calendars. Optional. Immutable. *)
    reminders : RemindersData.t
    (** Information about the event's reminders for the authenticated user. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  val htmlLink : (t, string) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val summary : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val colorId : (t, string) GapiLens.t
  val creator : (t, PersonData.t) GapiLens.t
  val organizer : (t, PersonData.t) GapiLens.t
  val start : (t, EventDateTime.t) GapiLens.t
  val _end : (t, EventDateTime.t) GapiLens.t
  val recurrence : (t, string list) GapiLens.t
  val recurringEventId : (t, string) GapiLens.t
  val originalStartTime : (t, EventDateTime.t) GapiLens.t
  val transparency : (t, string) GapiLens.t
  val visibility : (t, string) GapiLens.t
  val iCalUID : (t, string) GapiLens.t
  val sequence : (t, int) GapiLens.t
  val attendees : (t, EventAttendee.t list) GapiLens.t
  val attendeesOmitted : (t, bool) GapiLens.t
  val extendedProperties : (t, ExtendedPropertiesData.t) GapiLens.t
  val gadget : (t, GadgetData.t) GapiLens.t
  val anyoneCanAddSelf : (t, bool) GapiLens.t
  val guestsCanInviteOthers : (t, bool) GapiLens.t
  val guestsCanModify : (t, bool) GapiLens.t
  val guestsCanSeeOtherGuests : (t, bool) GapiLens.t
  val privateCopy : (t, bool) GapiLens.t
  val reminders : (t, RemindersData.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Events :
sig
  type t = {
    kind : string;
    (** Type of the collection (["calendar#events"]). *)
    etag : string;
    (** ETag of the collection. *)
    summary : string;
    (** Title of the calendar. Read-only. *)
    description : string;
    (** Description of the calendar. Read-only. *)
    updated : GapiDate.t;
    (** Last modification time of the calendar (as a RFC 3339 timestamp). Read-only. *)
    timeZone : string;
    (** The time zone of the calendar. Read-only. *)
    accessRole : string;
    (** The user's access role for this calendar. Read-only. Possible values are:  
    - ["none"] - The user has no access. 
    - ["freeBusyReader"] - The user has read access to free/busy information. 
    - ["reader"] - The user has read access to the calendar. Private events will appear to users with reader access, but event details will be hidden. 
    - ["writer"] - The user has read and write access to the calendar. Private events will appear to users with writer access, and event details will be visible. 
    - ["owner"] - The user has ownership of the calendar. This role has all of the permissions of the writer role with the additional ability to see and manipulate ACLs *)
    defaultReminders : EventReminder.t list;
    (** The default reminders on the calendar for the authenticated user. These reminders apply to all events on this calendar that do not explicitly override them (i.e. do not have {!RemindersData.useDefault} set to [true]). *)
    nextPageToken : string;
    (** Token used to access the next page of this result. Omitted if no further results are available. *)
    items : Event.t list
    (** List of events on the calendar. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val summary : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  val accessRole : (t, string) GapiLens.t
  val defaultReminders : (t, EventReminder.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, Event.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Freebusy *)

module FreeBusyRequest :
sig
  type t = {
    timeMin : GapiDate.t;
    (** The start of the interval for the query. *)
    timeMax : GapiDate.t;
    (** The end of the interval for the query. *)
    timeZone : string;
    (** Time zone used in the response. Optional. The default is UTC. *)
    groupExpansionMax : int;
    (** Maximal number of calendar identifiers to be provided for a single group. Optional. An error will be returned for a group with more members than this value. *)
    calendarExpansionMax : int;
    (** Maximal number of calendars for which FreeBusy information is to be provided. Optional. *)
    items : string list
    (** List of calendars and/or groups to query. *)
  }

  val timeMin : (t, GapiDate.t) GapiLens.t
  val timeMax : (t, GapiDate.t) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  val groupExpansionMax : (t, int) GapiLens.t
  val calendarExpansionMax : (t, int) GapiLens.t
  val items : (t, string list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val to_data_model : t -> GapiJson.json_data_model

end

module Error :
sig
  type t = {
    domain : string;
    (** Domain, or broad category, of the error. *)
    reason : string
    (** Specific reason for the error. Some of the possible values are:  
    - ["groupTooBig"] - The group of users requested is too large for a single query. 
    - ["tooManyCalendarsRequested"] - The number of calendars requested is too large for a single query. 
    - ["notFound"] - The requested resource was not found. 
    - ["internalError"] - The API service has encountered an internal error.  Additional error types may be added in the future, so clients should gracefully handle additional error statuses not included in this list. *)
  }

  val domain : (t, string) GapiLens.t
  val reason : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module FreeBusyGroup :
sig
  type group = {
    errors : Error.t list;
    (** Optional error(s) (if computation for the group failed). *)
    calendars : string list
    (** List of calendars' identifiers within a group. *)
  }
  type t = string * group

  val errors : (group, Error.t list) GapiLens.t
  val calendars : (group, string list) GapiLens.t
  val id : ('a * 'b, 'a) GapiLens.t
  val group : ('a * 'b, 'b) GapiLens.t

  val empty : string * group

  val render : string * group -> GapiJson.json_data_model list

  val parse : string * group -> GapiJson.json_data_model -> string * group

end

module TimePeriod :
sig
  type t = {
    start : GapiDate.t;
    (** The start of the time period. *)
    _end : GapiDate.t
    (** The end of the time period. *)
  }

  val start : (t, GapiDate.t) GapiLens.t
  val _end : (t, GapiDate.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module FreeBusyCalendar :
sig
  type calendar = {
    errors : Error.t list;
    (** Optional error(s) (if computation for the calendar failed). *)
    busy : TimePeriod.t list
    (** List of time ranges during which this calendar should be regarded as busy. *)
  }
  type t = string * calendar

  val errors : (calendar, Error.t list) GapiLens.t
  val busy : (calendar, TimePeriod.t list) GapiLens.t
  val id : ('a * 'b, 'a) GapiLens.t
  val calendar : ('a * 'b, 'b) GapiLens.t

  val empty : string * calendar

  val render : string * calendar -> GapiJson.json_data_model list

  val parse :
    string * calendar -> GapiJson.json_data_model -> string * calendar

end

module FreeBusyResponse :
sig
  type t = {
    kind : string;
    (** Type of the resource (["calendar#freeBusy"]). *)
    timeMin : GapiDate.t;
    (** The start of the interval. *)
    timeMax : GapiDate.t;
    (** The end of the interval. *)
    groups : FreeBusyGroup.t list;
    (** Expansion of groups. *)
    calendars : FreeBusyCalendar.t list
    (** List of free/busy information for calendars. *)
  }

  val kind : (t, string) GapiLens.t
  val timeMin : (t, GapiDate.t) GapiLens.t
  val timeMax : (t, GapiDate.t) GapiLens.t
  val groups : (t, FreeBusyGroup.t list) GapiLens.t
  val calendars : (t, FreeBusyCalendar.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Settings *)

module Setting :
sig
  type t = {
    kind : string;
    (** Type of the resource (["calendar#setting"]). *)
    etag : string;
    (** ETag of the resource. *)
    id : string;
    (** Name of the user setting. *)
    value : string
    (** Value of the user setting. The format of the value depends on the ID of the setting. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
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
    kind : string;
    (** Type of the collection (["calendar#settings"]). *)
    etag : string;
    (** Etag of the collection. *)
    items : Setting.t list
    (** List of user settings. *)
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val items : (t, Setting.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

