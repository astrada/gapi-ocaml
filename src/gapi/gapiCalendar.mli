(* ACL *)

module ScopeData :
sig
  type t = {
    _type : string;
    value : string
  }

  val _type : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module AclRule :
sig
  type t = {
    kind : string;
    etag : string;
    id : string;
    scope : ScopeData.t;
    role : string;
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
    etag : string;
    nextPageToken : string;
    items : AclRule.t list;
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
    minutes : int
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
    etag : string;
    id : string;
    summary : string;
    description : string;
    location : string;
    timeZone : string;
    summaryOverride : string;
    colorId : string;
    hidden : bool;
    selected : bool;
    accessRole : string;
    defaultReminders : EventReminder.t list
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
    etag : string;
    nextPageToken : string;
    items : CalendarListEntry.t list
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
    etag : string;
    id : string;
    summary : string;
    description : string;
    location : string;
    timeZone : string
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
    foreground : string
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
    updated : string;
    calendar : ColorDefinition.t list;
    event : ColorDefinition.t list
  }

  val kind : (t, string) GapiLens.t
  val updated : (t, string) GapiLens.t
  val calendar : (t, ColorDefinition.t list) GapiLens.t
  val event : (t, ColorDefinition.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(* Events *)

module PersonData :
sig
  type t = {
    email : string;
    displayName : string
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
    dateTime : GapiDate.t;
    timeZone : string
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
    displayName : string;
    organizer : bool;
    self : bool;
    resource : bool;
    optional : bool;
    responseStatus : string;
    comment : string;
    additionalGuests : int
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

module ExtendedPropertiesData :
sig
  type t = {
    _private : (string * string) list;
    shared : (string * string) list
  }

  val _private : (t, (string * string) list) GapiLens.t
  val shared : (t, (string * string) list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module GadgetData :
sig
  type t = {
    _type : string;
    title : string;
    link : string;
    iconLink : string;
    width : int;
    height : int;
    display : string;
    preferences : (string * string) list;
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

module RemindersData :
sig
  type t = {
    useDefault : bool;
    overrides : EventReminder.t list
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
    etag : string;
    id : string;
    status : string;
    htmlLink : string;
    created : GapiDate.t;
    updated : GapiDate.t;
    summary : string;
    description : string;
    location : string;
    colorId : string;
    creator : PersonData.t;
    organizer : PersonData.t;
    start : EventDateTime.t;
    _end : EventDateTime.t;
    recurrence : string list;
    recurringEventId : string;
    originalStartTime : EventDateTime.t;
    transparency : string;
    visibility : string;
    iCalUID : string;
    sequence : int;
    attendees : EventAttendee.t list;
    attendeesOmitted : bool;
    extendedProperties : ExtendedPropertiesData.t;
    gadget : GadgetData.t;
    anyoneCanAddSelf : bool;
    guestsCanInviteOthers : bool;
    guestsCanModify : bool;
    guestsCanSeeOtherGuests : bool;
    privateCopy : bool;
    reminders : RemindersData.t
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
    etag : string;
    summary : string;
    description : string;
    updated : GapiDate.t;
    timeZone : string;
    accessRole : string;
    defaultReminders : EventReminder.t list;
    nextPageToken : string;
    items : Event.t list
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
    timeMax : GapiDate.t;
    timeZone : string;
    groupExpansionMax : int;
    calendarExpansionMax : int;
    items : string list
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
    reason : string
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
    calendars : string list
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
    _end : GapiDate.t
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
    busy : TimePeriod.t list
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

module FreeBusyResource :
sig
  type t = {
    kind : string;
    timeMin : GapiDate.t;
    timeMax : GapiDate.t;
    groups : FreeBusyGroup.t list;
    calendars : FreeBusyCalendar.t list
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
    etag : string;
    id : string;
    value : string
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
    etag : string;
    items : Setting.t list
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

