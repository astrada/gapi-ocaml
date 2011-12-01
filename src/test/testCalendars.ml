open OUnit

let new_calendar =
  { GapiCalendar.CalendarsResource.empty with
        GapiCalendar.CalendarsResource.kind = "calendar#calendar";
        GapiCalendar.CalendarsResource.summary = "New test calendar";
        GapiCalendar.CalendarsResource.description =
          "Description of new test calendar"
  }

let test_insert () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       (* Add a delay to let Google persist the new entry, otherwise
        * DELETE will return a 503 HTTP error (Service Unavailable) *)
       let _ = Unix.sleep 5 in
         ignore (GapiCalendarService.Calendars.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "New calendar id should not be empty"
           new_entry.GapiCalendar.CalendarsResource.id)

let test_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       let (entry', session) =
         GapiCalendarService.Calendars.get
           entry.GapiCalendar.CalendarsResource.id
           session in
       let _ = Unix.sleep 5 in
         ignore (GapiCalendarService.Calendars.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.CalendarsResource.id
           entry'.GapiCalendar.CalendarsResource.id)

let test_refresh () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       let (entry', session) =
         GapiCalendarService.Calendars.refresh
           entry
           session in
       let _ = Unix.sleep 5 in
         ignore (GapiCalendarService.Calendars.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.CalendarsResource.id
           entry'.GapiCalendar.CalendarsResource.id)

let test_update () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       let entry = { entry with
                         GapiCalendar.CalendarsResource.description =
                           "Updated description" } in
       let (entry, session) =
         GapiCalendarService.Calendars.update
           entry
           session in
       let _ = Unix.sleep 5 in
         ignore (GapiCalendarService.Calendars.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.CalendarsResource.description)

let test_patch () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       let entry = {
         GapiCalendar.CalendarsResource.empty with
             GapiCalendar.CalendarsResource.id =
               entry.GapiCalendar.CalendarsResource.id;
             GapiCalendar.CalendarsResource.description =
               "Updated description"
       } in
       let (entry, session) =
         GapiCalendarService.Calendars.patch
           entry
           session in
       let _ = Unix.sleep 5 in
         ignore (GapiCalendarService.Calendars.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.CalendarsResource.description;
         assert_equal
           "calendar#calendar"
           entry.GapiCalendar.CalendarsResource.kind)

let test_delete () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       let (calendars, session) =
         GapiCalendarService.CalendarList.list
           session in
       let _ = Unix.sleep 5 in
       let ((), session) =
         GapiCalendarService.Calendars.delete
           entry
           session in
       let (calendars', _) =
         GapiCalendarService.CalendarList.list
           session
       in
         TestHelper.assert_exists
           "calendars should contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListResource.id =
                entry.GapiCalendar.CalendarsResource.id)
           calendars.GapiCalendar.CalendarListList.items;
         TestHelper.assert_not_exists
           "calendars' should not contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListResource.id =
                entry.GapiCalendar.CalendarsResource.id)
           calendars'.GapiCalendar.CalendarListList.items)

let test_clear () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       ignore (GapiCalendarService.Calendars.clear
                 session))

let suite = "Calendars (v3) test" >:::
  ["test_get" >:: test_get;
   "test_refresh" >:: test_refresh;
   "test_insert" >:: test_insert;
   "test_update" >:: test_update;
   "test_patch" >:: test_patch;
   "test_delete" >:: test_delete
   (*"test_clear" >:: test_clear -- clears primary calendar*)]

