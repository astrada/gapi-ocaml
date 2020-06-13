open GapiUtils.Infix
open GapiLens.Infix

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
      [param (fun p -> p.author) Fun.id "author";
       param (fun p -> p.fields) Fun.id "fields";
       param (fun p -> p.max_results) string_of_int "max-results";
       param (fun p -> p.published_min) GapiDate.to_string "published-min";
       param (fun p -> p.published_max) GapiDate.to_string "published-max";
       param (fun p -> p.q) Fun.id "q";
       param (fun p -> p.start_index) string_of_int "start-index";
       param (fun p -> p.strict) string_of_bool "strict";
       param (fun p -> p.updated_min) GapiDate.to_string "updated-min";
       param (fun p -> p.updated_max) GapiDate.to_string "updated-max";
       param (fun p -> p.ctz) Fun.id "ctz";
       param (fun p -> p.future_events) string_of_bool "future-events";
       param (fun p -> p.max_attendees) string_of_int "max-attendees";
       param (fun p -> p.orderby) Fun.id "orderby";
       param (fun p -> p.recurrence_expansion_start) GapiDate.to_string "recurrence-expansion-start";
       param (fun p -> p.recurrence_expansion_end) GapiDate.to_string "recurrence-expansion-end";
       param (fun p -> p.singleevents) string_of_bool "singleevents";
       param (fun p -> p.showdeleted) string_of_bool "showdeleted";
       param (fun p -> p.showhidden) string_of_bool "showhidden";
       param (fun p -> p.sortorder) Fun.id "sortorder";
       param (fun p -> p.start_min) GapiDate.to_string "start-min";
       param (fun p -> p.start_max) GapiDate.to_string "start-max"]
      |> List.concat

end

let version = "2"

let parse_calendar_feed =
  GdataUtils.parse_xml_response GdataCalendar.Feed.parse_feed

let parse_calendar_entry =
  GdataUtils.parse_xml_response GdataCalendar.parse_calendar_entry

let parse_event_feed =
  GdataUtils.parse_xml_response GdataCalendarEvent.Feed.parse_feed

let parse_event_entry =
  GdataUtils.parse_xml_response GdataCalendarEvent.parse_calendar_event_entry

let parse_acl_feed =
  GdataUtils.parse_xml_response GdataACL.parse_feed

let parse_acl_entry =
  GdataUtils.parse_xml_response GdataACL.parse_entry

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
    entry.GdataCalendar.Entry.links
    entry.GdataCalendar.Entry.etag

let get_url_etag_event entry =
  get_url_etag
    entry.GdataCalendarEvent.Entry.links
    entry.GdataCalendarEvent.Entry.etag

let get_url_etag_acl entry =
  let url = GdataAtom.find_url `Edit (entry |. GdataACL.Entry.links) in
  let etag =
    if (entry |. GdataACL.Entry.etag) = "" then
      None
    else
      Some (entry |. GdataACL.Entry.etag)
  in
    (url, etag)

let personal_settings
      ?(url = "https://www.google.com/calendar/feeds/default/settings")
      ?etag
      session =
  GdataService.query
    ~version
    ?etag
    url
    (GdataUtils.parse_xml_response GdataCalendar.parse_personal_settings)
    session

let all_calendars
      ?(url = "https://www.google.com/calendar/feeds/default/allcalendars/full")
      ?etag
      session =
  GdataService.query
    ~version
    ?etag
    url
    parse_calendar_feed
    session

let own_calendars
      ?(url = "https://www.google.com/calendar/feeds/default/owncalendars/full")
      ?etag
      session =
  GdataService.query
    ~version
    ?etag
    url
    parse_calendar_feed
    session

let refresh_calendar
      entry
      session =
  let (url, etag) = get_url_etag_calendar entry in
    GdataService.read
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
  GdataService.create
    GdataCalendar.calendar_entry_to_data_model 
    ~version
    entry
    url
    parse_calendar_entry
    session

let update_calendar
      entry
      session =
  let (url, etag) = get_url_etag_calendar entry in
    GdataService.update
      GdataCalendar.calendar_entry_to_data_model 
      ~version
      ?etag
      entry
      url
      parse_calendar_entry
      session

let delete_calendar
      entry
      session =
  let (url, etag) = get_url_etag_calendar entry in
    GdataService.delete
      ~version
      ?etag
      url
      session

let add_new_subscription
      ?(url = "https://www.google.com/calendar/feeds/default/allcalendars/full")
      entry
      session =
  GdataService.create
    GdataCalendar.calendar_entry_to_data_model
    ~version
    entry
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
    GdataService.query
      ~version
      ?etag
      ?query_parameters
      url
      parse_event_feed
      session

let refresh_event
      entry
      session =
  let (url, etag) = get_url_etag_event entry in
    GdataService.read
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
  GdataService.create
    GdataCalendarEvent.calendar_event_entry_to_data_model 
    ~version
    entry
    url
    parse_event_entry
    session

let update_event
      entry
      session =
  let (url, etag) = get_url_etag_event entry in
    GdataService.update
      GdataCalendarEvent.calendar_event_entry_to_data_model 
      ~version
      ?etag
      entry
      url
      parse_event_entry
      session

let delete_event
      entry
      session =
  let (url, etag) = get_url_etag_event entry in
    GdataService.delete
      ~version
      ?etag
      url
      session

let retrieve_acl
      ?etag
      entry
      session =
  let url = GdataCalendar.find_url `Acl entry.GdataCalendar.Entry.links in
    GdataService.query
      ~version
      ?etag
      url
      parse_acl_feed
      session

let refresh_acl
      entry
      session =
  let (url, etag) = get_url_etag_acl entry in
    GdataService.read
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
  let url = GdataCalendar.find_url `Acl calendar_entry.GdataCalendar.Entry.links in
    GdataService.create
      GdataACL.entry_to_data_model 
      ~version
      acl_entry
      url
      parse_acl_entry
      session

let update_acl
      entry
      session =
  let (url, etag) = get_url_etag_acl entry in
    GdataService.update
      GdataACL.entry_to_data_model 
      ~version
      ?etag
      entry
      url
      parse_acl_entry
      session

let delete_acl
      entry
      session =
  let (url, etag) = get_url_etag_acl entry in
    GdataService.delete
      ~version
      ?etag
      url
      session

let event_batch_request
      target_feed
      batch_feed
      session =
  let url = GdataCalendar.find_url
              `Batch
              target_feed.GdataCalendarEvent.Feed.links in
    GdataService.batch_request
      GdataCalendarEvent.calendar_event_feed_to_data_model
      ~version
      batch_feed
      url
      parse_event_feed
      session

