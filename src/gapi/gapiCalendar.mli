module Reminder :
sig
  type t = {
    _method : string;
    minutes : int
  }

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

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

