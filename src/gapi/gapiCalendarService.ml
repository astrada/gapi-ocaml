open GapiUtils.Op

module QueryParameters =
struct
  type t = {
    author : string;
    fields : string;
    max_results : int;
    published_min : GapiDate.t;
    published_max : GapiDate.t;
    q : string;
    start_index : int;
    strict : bool;
    updated_min : GapiDate.t;
    updated_max : GapiDate.t;
    ctz : string;
    future_events : bool;
    max_attendees : int;
    orderby : string;
    recurrence_expansion_start : GapiDate.t;
    recurrence_expansion_end : GapiDate.t;
    singleevents : bool;
    showdeleted : bool;
    showhidden : bool;
    sortorder : string;
    start_min : GapiDate.t;
    start_max : GapiDate.t
  }

  let default = {
    author = "";
    fields = "";
    max_results = 0;
    published_min = GapiDate.epoch;
    published_max = GapiDate.epoch;
    q = "";
    start_index = 0;
    strict = false;
    updated_min = GapiDate.epoch;
    updated_max = GapiDate.epoch;
    ctz = "";
    future_events = false;
    max_attendees = 0;
    orderby = "";
    recurrence_expansion_start = GapiDate.epoch;
    recurrence_expansion_end = GapiDate.epoch;
    singleevents = false;
    showdeleted = false;
    showhidden = false;
    sortorder = "";
    start_min = GapiDate.epoch;
    start_max = GapiDate.epoch
  }

  let to_key_value_list qp =
    let param get to_string name = 
      let value = get qp in
        if value <> get default then
          [(name, to_string value)]
        else
          []
    in
      [param (fun p -> p.author) Std.identity "author";
       param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.max_results) string_of_int "max-results";
       param (fun p -> p.published_min) GapiDate.to_string "published-min";
       param (fun p -> p.published_max) GapiDate.to_string "published-max";
       param (fun p -> p.q) Std.identity "q";
       param (fun p -> p.start_index) string_of_int "start-index";
       param (fun p -> p.strict) string_of_bool "strict";
       param (fun p -> p.updated_min) GapiDate.to_string "updated-min";
       param (fun p -> p.updated_max) GapiDate.to_string "updated-max";
       param (fun p -> p.ctz) Std.identity "ctz";
       param (fun p -> p.future_events) string_of_bool "future-events";
       param (fun p -> p.max_attendees) string_of_int "max-attendees";
       param (fun p -> p.orderby) Std.identity "orderby";
       param (fun p -> p.recurrence_expansion_start) GapiDate.to_string "recurrence-expansion-start";
       param (fun p -> p.recurrence_expansion_end) GapiDate.to_string "recurrence-expansion-end";
       param (fun p -> p.singleevents) string_of_bool "singleevents";
       param (fun p -> p.showdeleted) string_of_bool "showdeleted";
       param (fun p -> p.showhidden) string_of_bool "showhidden";
       param (fun p -> p.sortorder) Std.identity "sortorder";
       param (fun p -> p.start_min) GapiDate.to_string "start-min";
       param (fun p -> p.start_max) GapiDate.to_string "start-max"]
      |> List.concat

end

let parse_json_response parse pipe =
  let json_string = GapiConversation.read_all pipe in
  let json = Json_io.json_of_string json_string in
  let tree = GapiJson.json_to_data_model json in
    parse tree

let parse_calendar_list =
  parse_json_response GapiCalendar.CalendarListList.parse

let calendar_list
      ?(url = "https://www.googleapis.com/calendar/v3/users/me/calendarList")
      ?etag
      session =
  GapiService.query
    ?etag
    url
    parse_calendar_list
    session

