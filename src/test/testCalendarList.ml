open OUnit

let test_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar_list, session) =
         GapiCalendarService.calendar_list
           session
       in
         assert_equal
           "calendar#calendarList"
           calendar_list.GapiCalendar.CalendarListList.kind;
         assert_bool
           "There should be at least 1 calendar"
           (List.length calendar_list.GapiCalendar.CalendarListList.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_list_with_max_results () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = {
         GapiCalendarService.QueryParameters.default with
             GapiCalendarService.QueryParameters.maxResults = 1
       } in
       let (calendar_list, session) =
         GapiCalendarService.calendar_list
           ~parameters
           session
       in
         assert_equal
           1
           (List.length calendar_list.GapiCalendar.CalendarListList.items))

let test_parse_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
  let calendarListList = GapiCalendar.CalendarListList.parse tree in
  let tree' = GapiCalendar.CalendarListList.render calendarListList in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree'

let suite = "Calendar List (v3) test" >:::
  [(*"test_list" >:: test_list;
   "test_list_with_max_results" >:: test_list_with_max_results;*)
   "test_parse_list" >:: test_parse_list
  ]

