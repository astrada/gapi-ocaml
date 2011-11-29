open OUnit

let australian_calendar_id =
  "en.australian#holiday@group.v.calendar.google.com"

let australian_calendar =
  { GapiCalendar.CalendarListResource.empty with
        GapiCalendar.CalendarListResource.id = australian_calendar_id
  }

let test_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendars, session) =
         GapiCalendarService.CalendarList.list
           session
       in
         assert_equal
           "calendar#calendarList"
           calendars.GapiCalendar.CalendarListList.kind;
         assert_bool
           "There should be at least 1 calendar"
           (List.length calendars.GapiCalendar.CalendarListList.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_list_with_max_results () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = {
         GapiCalendarService.QueryParameters.default with
             GapiCalendarService.QueryParameters.prettyPrint = false;
             GapiCalendarService.QueryParameters.maxResults = 1
       } in
       let (calendars, session) =
         GapiCalendarService.CalendarList.list
           ~parameters
           session
       in
         assert_equal
           1
           (List.length calendars.GapiCalendar.CalendarListList.items))

let test_insert () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session
       in
         ignore (GapiCalendarService.CalendarList.delete
                   new_entry
                   session);
         assert_equal
           australian_calendar_id
           new_entry.GapiCalendar.CalendarListResource.id)

let test_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session in
       let (entry, session) =
         GapiCalendarService.CalendarList.get
           australian_calendar_id
           session
       in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           australian_calendar_id
           entry.GapiCalendar.CalendarListResource.id)

let test_refresh () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session in
       let (entry, session) =
         GapiCalendarService.CalendarList.refresh
           entry
           session
       in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           australian_calendar_id
           entry.GapiCalendar.CalendarListResource.id)

let test_update () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session in
       let entry = { entry with
                         GapiCalendar.CalendarListResource.hidden = true } in
       let (entry, session) =
         GapiCalendarService.CalendarList.update
           entry
           session in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           true
           entry.GapiCalendar.CalendarListResource.hidden)

let test_patch () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session in
       let entry = {
         GapiCalendar.CalendarListResource.empty with
             GapiCalendar.CalendarListResource.id = australian_calendar_id;
             GapiCalendar.CalendarListResource.hidden = true
       } in
       let (entry, session) =
         GapiCalendarService.CalendarList.patch
           entry
           session in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           true
           entry.GapiCalendar.CalendarListResource.hidden;
         assert_equal
           "calendar#calendarListEntry"
           entry.GapiCalendar.CalendarListResource.kind)

let test_delete () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session in
       let (calendars, session) =
         GapiCalendarService.CalendarList.list
           session in
       let ((), session) =
         GapiCalendarService.CalendarList.delete
           entry
           session in
       let (calendars', _) =
         GapiCalendarService.CalendarList.list
           session
       in
         TestHelper.assert_exists
           "calendars should contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListResource.id = australian_calendar_id)
           calendars.GapiCalendar.CalendarListList.items;
         TestHelper.assert_not_exists
           "calendars' should not contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListResource.id = australian_calendar_id)
           calendars'.GapiCalendar.CalendarListList.items)

let suite = "Calendar List (v3) test" >:::
  ["test_list" >:: test_list;
   "test_list_with_max_results" >:: test_list_with_max_results;
   "test_get" >:: test_get;
   "test_refresh" >:: test_refresh;
   "test_insert" >:: test_insert;
   "test_update" >:: test_update;
   "test_patch" >:: test_patch;
   "test_delete" >:: test_delete]

