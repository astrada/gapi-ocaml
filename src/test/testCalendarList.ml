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

let suite = "Calendar List (v3) test" >:::
  ["test_list" >:: test_list;
   "test_list_with_max_results" >:: test_list_with_max_results;
  ]

