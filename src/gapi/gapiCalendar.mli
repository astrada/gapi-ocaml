module Reminder :
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

module CalendarListResource :
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
    defaultReminders : Reminder.t list
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
  val defaultReminders : (t, Reminder.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module CalendarListList :
sig
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : CalendarListResource.t list
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, CalendarListResource.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module CalendarsResource :
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

module ColorResource :
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

module ColorList :
sig
  type t = {
    kind : string;
    updated : string;
    calendar : ColorResource.t list;
    event : ColorResource.t list
  }

  val kind : (t, string) GapiLens.t
  val updated : (t, string) GapiLens.t
  val calendar : (t, ColorResource.t list) GapiLens.t
  val event : (t, ColorResource.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module SettingsResource :
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

module SettingsList :
sig
  type t = {
    kind : string;
    etag : string;
    items : SettingsResource.t list
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val items : (t, SettingsResource.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module FreeBusyParameters :
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

module Busy :
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
    busy : Busy.t list
  }
  type t = string * calendar

  val errors : (calendar, Error.t list) GapiLens.t
  val busy : (calendar, Busy.t list) GapiLens.t
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

