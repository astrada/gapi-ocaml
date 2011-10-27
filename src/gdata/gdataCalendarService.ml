let version = "2"

let parse_calendar_feed =
  GdataRequest.parse_xml_response GdataCalendar.parse_calendar_feed

let parse_calendar_entry =
  GdataRequest.parse_xml_response GdataCalendar.parse_calendar_entry

let parse_event_entry =
  GdataRequest.parse_xml_response GdataCalendarEvent.parse_calendar_event_entry

let get_url_etag links etag =
  let url = GdataCalendar.find_url GdataCalendar.Rel.Edit links in
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
      session =
  GdataService.service_request
    ~version
    ?etag
    url
    (GdataRequest.parse_xml_response GdataCalendarEvent.parse_calendar_event_feed)
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

