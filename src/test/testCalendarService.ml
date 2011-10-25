open OUnit

let new_calendar_entry title =
  { GdataCalendar.empty_entry with
        GdataCalendar.ce_where = ["Oakland"];
        GdataCalendar.ce_color = "#2952A3";
        GdataCalendar.ce_hidden = false;
        GdataCalendar.ce_timezone = "America/Los_Angeles";
        GdataCalendar.ce_summary =
          { GdataAtom.empty_text with
                GdataAtom.tc_type = "text";
                GdataAtom.tc_value = "This calendar contains the practice schedule and game times.";
          };
        GdataCalendar.ce_title =
                  { GdataAtom.empty_text with
                        GdataAtom.tc_type = "text";
                        GdataAtom.tc_value = title;
                  };
  }

let test_personal_settings () =
  TestHelper.test_request
    TestHelper.build_client_login_auth
    (fun session ->
       let (settings, _) =
         GdataCalendarService.personal_settings session
       in
         assert_bool
           "Settings should contain at least 1 element"
           (Hashtbl.length settings > 0))

let test_all_calendars () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session') = GdataCalendarService.all_calendars session in
         assert_equal
           "http://www.google.com/calendar/feeds/default/allcalendars/full"
           feed.GdataCalendar.cf_id;
         assert_bool
           "ETag should not be empty"
           (session'.GdataConversation.Session.etag <> ""))

let test_own_calendars () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session') = GdataCalendarService.own_calendars session in
         assert_equal
           "http://www.google.com/calendar/feeds/default/owncalendars/full"
           feed.GdataCalendar.cf_id;
         assert_bool
           "ETag should not be empty"
           (session'.GdataConversation.Session.etag <> ""))

let test_create_new_calendar () =
  let entry = new_calendar_entry "test_create_new_calendar" in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_calendar entry session in
         let (_, session) =
           GdataCalendarService.refresh_calendar new_entry session in
         let id = new_entry.GdataCalendar.ce_id in
         let (feed, session) = GdataCalendarService.own_calendars session in
           assert_bool
             "Created entry id not found in own calendars feed"
             (List.exists
                (fun e -> e.GdataCalendar.ce_id = id)
                feed.GdataCalendar.cf_entries);
           ignore (GdataCalendarService.delete_calendar
                     new_entry
                     session))

let test_delete_calendar () =
  let entry = new_calendar_entry "test_delete_calendar" in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_calendar entry session in
         let (_, session) =
           GdataCalendarService.refresh_calendar new_entry session in
         let id = new_entry.GdataCalendar.ce_id in
         let (_, session) = GdataCalendarService.delete_calendar
                              new_entry
                              session in
         let (feed, session) = GdataCalendarService.own_calendars session in
           TestHelper.assert_false
             "Deleted entry id found in own calendars feed"
             (List.exists
                (fun e -> e.GdataCalendar.ce_id = id)
                feed.GdataCalendar.cf_entries))

let test_update_calendar () =
  let entry = new_calendar_entry "test_update_calendar" in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_calendar entry session in
         let (_, session) =
           GdataCalendarService.refresh_calendar new_entry session in
         let updated_entry = { new_entry with
                                   GdataCalendar.ce_hidden = true } in
         let (server_updated_entry, session) =
           GdataCalendarService.update_calendar updated_entry session in
         let (_, session) =
           GdataCalendarService.refresh_calendar server_updated_entry session
         in
           ignore (GdataCalendarService.delete_calendar
                     server_updated_entry
                     session);
           assert_equal
             updated_entry.GdataCalendar.ce_hidden
             server_updated_entry.GdataCalendar.ce_hidden)

let test_add_new_subscription () =
  let entry =
    { GdataCalendar.empty_entry with
          GdataCalendar.ce_id = "en.australian#holiday@group.v.calendar.google.com" }
  in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, _) =
           GdataCalendarService.add_new_subscription
             entry
             session
         in
           ignore (GdataCalendarService.delete_calendar
                     new_entry
                     session);
           assert_equal
             "http://www.google.com/calendar/feeds/default/calendars/en.australian%23holiday%40group.v.calendar.google.com"
             new_entry.GdataCalendar.ce_id)

let test_retrieve_events () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session') = GdataCalendarService.retrieve_events session in
         assert_equal
           "http://www.google.com/calendar/feeds/default/private/full"
           feed.GdataCalendarEvent.cef_id;
         assert_bool
           "ETag should not be empty"
           (session'.GdataConversation.Session.etag <> ""))


let suite = "Calendar Service test" >:::
  [(*"test_personal_settings" >:: test_personal_settings;
   "test_all_calendars" >:: test_all_calendars;
   "test_own_calendars" >:: test_own_calendars;
   "test_create_new_calendar" >:: test_create_new_calendar;
   "test_delete_calendar" >:: test_delete_calendar;
   "test_update_calendar" >:: test_update_calendar;
   "test_add_new_subscription" >:: test_add_new_subscription;*)
   "test_retrieve_events" >:: test_retrieve_events]

