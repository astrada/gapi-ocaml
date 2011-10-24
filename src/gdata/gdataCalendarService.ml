let version = "2"

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
    (GdataRequest.parse_xml_response GdataCalendar.parse_calendar_feed)
    session

let own_calendars
      ?(url = "https://www.google.com/calendar/feeds/default/owncalendars/full")
      ?etag
      session =
  GdataService.service_request
    ~version
    ?etag
    url
    (GdataRequest.parse_xml_response GdataCalendar.parse_calendar_feed)
    session

let refresh_calendar
      entry
      session =
  let url = GdataCalendar.find_url GdataCalendar.Rel.Self entry.GdataCalendar.ce_links in
  let etag =
    if entry.GdataCalendar.ce_etag = "" then
      None
    else
      Some entry.GdataCalendar.ce_etag
  in
    GdataService.service_query_with_default
      ~version
      ?etag
      entry
      url
      (GdataRequest.parse_xml_response GdataCalendar.parse_calendar_entry)
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
    (GdataRequest.parse_xml_response GdataCalendar.parse_calendar_entry)
    session

let update_calendar
      entry
      session =
  let url = GdataCalendar.find_url GdataCalendar.Rel.Edit entry.GdataCalendar.ce_links in
  let etag =
    if entry.GdataCalendar.ce_etag = "" then
      None
    else
      Some entry.GdataCalendar.ce_etag
  in
    GdataService.service_request_with_data
      ~version
      ?etag
      entry
      GdataCalendar.calendar_entry_to_data_model 
      GdataRequest.Update
      url
      (GdataRequest.parse_xml_response GdataCalendar.parse_calendar_entry)
      session

let delete_calendar
      entry
      session =
  let url = GdataCalendar.find_url GdataCalendar.Rel.Edit entry.GdataCalendar.ce_links in
  let etag =
    if entry.GdataCalendar.ce_etag = "" then
      None
    else
      Some entry.GdataCalendar.ce_etag
  in
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
    (GdataRequest.parse_xml_response GdataCalendar.parse_calendar_entry)
    session

