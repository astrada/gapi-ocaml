open GdataUtils.Op

module QueryParameters =
struct
  type t = {
    author : string;
    fields : string;
    max_results : int;
    published_min : GdataDate.t;
    published_max : GdataDate.t;
    q : string;
    start_index : int;
    strict : bool;
    updated_min : GdataDate.t;
    updated_max : GdataDate.t;
    ctz : string;
    future_events : bool;
    max_attendees : int;
    orderby : string;
    recurrence_expansion_start : GdataDate.t;
    recurrence_expansion_end : GdataDate.t;
    singleevents : bool;
    showdeleted : bool;
    showhidden : bool;
    sortorder : string;
    start_min : GdataDate.t;
    start_max : GdataDate.t
  }

  let default = {
    author = "";
    fields = "";
    max_results = 0;
    published_min = GdataDate.epoch;
    published_max = GdataDate.epoch;
    q = "";
    start_index = 0;
    strict = false;
    updated_min = GdataDate.epoch;
    updated_max = GdataDate.epoch;
    ctz = "";
    future_events = false;
    max_attendees = 0;
    orderby = "";
    recurrence_expansion_start = GdataDate.epoch;
    recurrence_expansion_end = GdataDate.epoch;
    singleevents = false;
    showdeleted = false;
    showhidden = false;
    sortorder = "";
    start_min = GdataDate.epoch;
    start_max = GdataDate.epoch
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
       param (fun p -> p.published_min) GdataDate.to_string "published-min";
       param (fun p -> p.published_max) GdataDate.to_string "published-max";
       param (fun p -> p.q) Std.identity "q";
       param (fun p -> p.start_index) string_of_int "start-index";
       param (fun p -> p.strict) string_of_bool "strict";
       param (fun p -> p.updated_min) GdataDate.to_string "updated-min";
       param (fun p -> p.updated_max) GdataDate.to_string "updated-max";
       param (fun p -> p.ctz) Std.identity "ctz";
       param (fun p -> p.future_events) string_of_bool "future-events";
       param (fun p -> p.max_attendees) string_of_int "max-attendees";
       param (fun p -> p.orderby) Std.identity "orderby";
       param (fun p -> p.recurrence_expansion_start) GdataDate.to_string "recurrence-expansion-start";
       param (fun p -> p.recurrence_expansion_end) GdataDate.to_string "recurrence-expansion-end";
       param (fun p -> p.singleevents) string_of_bool "singleevents";
       param (fun p -> p.showdeleted) string_of_bool "showdeleted";
       param (fun p -> p.showhidden) string_of_bool "showhidden";
       param (fun p -> p.sortorder) Std.identity "sortorder";
       param (fun p -> p.start_min) GdataDate.to_string "start-min";
       param (fun p -> p.start_max) GdataDate.to_string "start-max"]
      |> List.concat

end

let version = "2"

let parse_calendar_feed =
  GdataRequest.parse_xml_response GdataCalendar.Feed.parse_feed

let parse_calendar_entry =
  GdataRequest.parse_xml_response GdataCalendar.parse_calendar_entry

let parse_event_feed =
  GdataRequest.parse_xml_response GdataCalendarEvent.Feed.parse_feed

let parse_event_entry =
  GdataRequest.parse_xml_response GdataCalendarEvent.parse_calendar_event_entry

let parse_acl_feed =
  GdataRequest.parse_xml_response GdataACL.Feed.parse_feed

let parse_acl_entry =
  GdataRequest.parse_xml_response GdataACL.parse_acl_entry

let get_url_etag links etag =
  let url = GdataCalendar.find_url `Edit links in
  let etag =
    if etag = "" then
      None
    else
      Some etag
  in
    (url, etag)

let get_url_etag_calendar entry =
  get_url_etag
    entry.GdataCalendar.ce_links
    entry.GdataCalendar.ce_etag

let get_url_etag_event entry =
  get_url_etag
    entry.GdataCalendarEvent.cee_links
    entry.GdataCalendarEvent.cee_etag

let get_url_etag_acl entry =
  let url = GdataAtom.find_url `Edit entry.GdataACL.Entry.ae_links in
  let etag =
    if entry.GdataACL.Entry.ae_etag = "" then
      None
    else
      Some entry.GdataACL.Entry.ae_etag
  in
    (url, etag)

let personal_settings
      ?(url = "https://www.google.com/calendar/feeds/default/settings")
      ?etag
      session =
  GdataService.service_request
    ~version
    ?etag
    url
    (GdataRequest.parse_xml_response GdataCalendar.parse_personal_settings)
    session

let all_calendars
      ?(url = "https://www.google.com/calendar/feeds/default/allcalendars/full")
      ?etag
      session =
  GdataService.service_request
    ~version
    ?etag
    url
    parse_calendar_feed
    session

let own_calendars
      ?(url = "https://www.google.com/calendar/feeds/default/owncalendars/full")
      ?etag
      session =
  GdataService.service_request
    ~version
    ?etag
    url
    parse_calendar_feed
    session

let refresh_calendar
      entry
      session =
  let (url, etag) = get_url_etag_calendar entry in
    GdataService.service_query_with_default
      ~version
      ?etag
      entry
      url
      parse_calendar_entry
      session

let create_new_calendar
      ?(url = "https://www.google.com/calendar/feeds/default/owncalendars/full")
      entry
      session =
  GdataService.service_request_with_data
    ~version
    entry
    GdataCalendar.calendar_entry_to_data_model 
    GdataRequest.Create
    url
    parse_calendar_entry
    session

let update_calendar
      entry
      session =
  let (url, etag) = get_url_etag_calendar entry in
    GdataService.service_request_with_data
      ~version
      ?etag
      entry
      GdataCalendar.calendar_entry_to_data_model 
      GdataRequest.Update
      url
      parse_calendar_entry
      session

let delete_calendar
      entry
      session =
  let (url, etag) = get_url_etag_calendar entry in
    GdataService.service_request
      ~version
      ?etag
      ~request_type:GdataRequest.Delete
      url
      GdataRequest.parse_empty_response
      session

let add_new_subscription
      ?(url = "https://www.google.com/calendar/feeds/default/allcalendars/full")
      entry
      session =
  GdataService.service_request_with_data
    ~version
    entry
    GdataCalendar.calendar_entry_to_data_model
    GdataRequest.Create
    url
    parse_calendar_entry
    session

let retrieve_events
      ?(url = "https://www.google.com/calendar/feeds/default/private/full")
      ?etag
      ?parameters
      session =
  let query_parameters = Option.map
                           QueryParameters.to_key_value_list
                           parameters in
    GdataService.service_request
      ?query_parameters
      ~version
      ?etag
      url
      parse_event_feed
      session

let refresh_event
      entry
      session =
  let (url, etag) = get_url_etag_event entry in
    GdataService.service_query_with_default
      ~version
      ?etag
      entry
      url
      parse_event_entry
      session

let create_new_event
      ?(url = "https://www.google.com/calendar/feeds/default/private/full")
      entry
      session =
  GdataService.service_request_with_data
    ~version
    entry
    GdataCalendarEvent.calendar_event_entry_to_data_model 
    GdataRequest.Create
    url
    parse_event_entry
    session

let update_event
      entry
      session =
  let (url, etag) = get_url_etag_event entry in
    GdataService.service_request_with_data
      ~version
      ?etag
      entry
      GdataCalendarEvent.calendar_event_entry_to_data_model 
      GdataRequest.Update
      url
      parse_event_entry
      session

let delete_event
      entry
      session =
  let (url, etag) = get_url_etag_event entry in
    GdataService.service_request
      ~version
      ?etag
      ~request_type:GdataRequest.Delete
      url
      GdataRequest.parse_empty_response
      session

let retrieve_acl
      ?etag
      entry
      session =
  let url = GdataCalendar.find_url `Acl entry.GdataCalendar.ce_links in
    GdataService.service_request
      ~version
      ?etag
      url
      parse_acl_feed
      session

let refresh_acl
      entry
      session =
  let (url, etag) = get_url_etag_acl entry in
    GdataService.service_query_with_default
      ~version
      ?etag
      entry
      url
      parse_acl_entry
      session

let create_acl
      acl_entry
      calendar_entry
      session =
  let url = GdataCalendar.find_url `Acl calendar_entry.GdataCalendar.ce_links in
    GdataService.service_request_with_data
      ~version
      acl_entry
      GdataACL.acl_entry_to_data_model 
      GdataRequest.Create
      url
      parse_acl_entry
      session

let update_acl
      entry
      session =
  let (url, etag) = get_url_etag_acl entry in
    GdataService.service_request_with_data
      ~version
      ?etag
      entry
      GdataACL.acl_entry_to_data_model 
      GdataRequest.Update
      url
      parse_acl_entry
      session

let delete_acl
      entry
      session =
  let (url, etag) = get_url_etag_acl entry in
    GdataService.service_request
      ~version
      ?etag
      ~request_type:GdataRequest.Delete
      url
      GdataRequest.parse_empty_response
      session

