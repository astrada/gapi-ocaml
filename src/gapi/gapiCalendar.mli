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

