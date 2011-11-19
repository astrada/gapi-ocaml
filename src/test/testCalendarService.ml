open OUnit

let new_calendar_entry title =
  { GdataCalendar.Entry.empty with
        GdataCalendar.Entry.where = ["Oakland"];
        GdataCalendar.Entry.color = "#2952A3";
        GdataCalendar.Entry.hidden = false;
        GdataCalendar.Entry.timezone = "America/Los_Angeles";
        GdataCalendar.Entry.summary =
          { GdataAtom.Summary.empty with
                GdataAtom.Summary._type = "text";
                GdataAtom.Summary.value = "This calendar contains the practice schedule and game times.";
          };
        GdataCalendar.Entry.title =
                  { GdataAtom.Title.empty with
                        GdataAtom.Title._type = "text";
                        GdataAtom.Title.value = title;
                  };
  }

let acl_entry =
  { GdataACL.Entry.empty with
        GdataACL.Entry.categories = [
          { GdataAtom.Category.empty with
                GdataAtom.Category.scheme =
                  "http://schemas.google.com/g/2005#kind";
                GdataAtom.Category.term =
                  "http://schemas.google.com/acl/2007#accessRule" } ];
        GdataACL.Entry.scope =
          { GdataACL.Scope._type = "user";
            GdataACL.Scope.value = "darcy@gmail.com" };
        GdataACL.Entry.role =
          "http://schemas.google.com/gCal/2005#editor" }

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
       let (feed, session) = GdataCalendarService.all_calendars session in
         assert_equal
           "http://www.google.com/calendar/feeds/default/allcalendars/full"
           feed.GdataCalendar.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_own_calendars () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = GdataCalendarService.own_calendars session in
         assert_equal
           "http://www.google.com/calendar/feeds/default/owncalendars/full"
           feed.GdataCalendar.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_create_new_calendar () =
  let entry = new_calendar_entry "test_create_new_calendar" in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_calendar entry session in
         let id = new_entry.GdataCalendar.Entry.id in
         let (feed, session) = GdataCalendarService.own_calendars session in
         let (_, session) =
           GdataCalendarService.refresh_calendar new_entry session
         in
           ignore (GdataCalendarService.delete_calendar
                     new_entry
                     session);
           assert_bool
             "Created entry id not found in own calendars feed"
             (List.exists
                (fun e -> e.GdataCalendar.Entry.id = id)
                feed.GdataCalendar.Feed.entries))

let test_delete_calendar () =
  let entry = new_calendar_entry "test_delete_calendar" in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_calendar entry session in
         let (_, session) =
           GdataCalendarService.refresh_calendar new_entry session in
         let id = new_entry.GdataCalendar.Entry.id in
         let (_, session) = GdataCalendarService.delete_calendar
                              new_entry
                              session in
         let (feed, session) = GdataCalendarService.own_calendars session in
           TestHelper.assert_false
             "Deleted entry id found in own calendars feed"
             (List.exists
                (fun e -> e.GdataCalendar.Entry.id = id)
                feed.GdataCalendar.Feed.entries))

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
                                   GdataCalendar.Entry.hidden = true } in
         let (server_updated_entry, session) =
           GdataCalendarService.update_calendar updated_entry session in
         let (_, session) =
           GdataCalendarService.refresh_calendar server_updated_entry session
         in
           ignore (GdataCalendarService.delete_calendar
                     server_updated_entry
                     session);
           assert_equal
             updated_entry.GdataCalendar.Entry.hidden
             server_updated_entry.GdataCalendar.Entry.hidden)

let test_add_new_subscription () =
  let entry =
    { GdataCalendar.Entry.empty with
          GdataCalendar.Entry.id = "en.australian#holiday@group.v.calendar.google.com" }
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
             new_entry.GdataCalendar.Entry.id)

let test_retrieve_events () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (feed, session) = GdataCalendarService.retrieve_events session in
         assert_equal
           "http://www.google.com/calendar/feeds/default/private/full"
           feed.GdataCalendarEvent.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_create_new_event () =
  let ch = open_in "test/data/new_event_entry.xml" in
  let entry = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                GdataCalendarEvent.parse_calendar_event_entry in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_event entry session in
         let id = new_entry.GdataCalendarEvent.Entry.id in
         let (feed, session) = GdataCalendarService.retrieve_events session in
           ignore (GdataCalendarService.delete_event
                     new_entry
                     session);
           assert_bool
             "Created entry id not found in event feed"
             (List.exists
                (fun e -> e.GdataCalendarEvent.Entry.id = id)
                feed.GdataCalendarEvent.Feed.entries)) 

let test_update_event () =
  let ch = open_in "test/data/new_event_entry.xml" in
  let entry = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                GdataCalendarEvent.parse_calendar_event_entry in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_event entry session in
         let updated_entry =
           { new_entry with
                 GdataCalendarEvent.Entry.where = ["Tennis club"] } in
         let (server_updated_entry, session) =
           GdataCalendarService.update_event updated_entry session in
         let (_, session) =
           GdataCalendarService.refresh_event server_updated_entry session
         in
           ignore (GdataCalendarService.delete_event
                     server_updated_entry
                     session);
           assert_equal
             updated_entry.GdataCalendarEvent.Entry.where
             server_updated_entry.GdataCalendarEvent.Entry.where)

let test_retrieve_events_with_parameters () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters =
         { GdataCalendarService.QueryParameters.default with
               GdataCalendarService.QueryParameters.start_min =
                 GdataDate.of_string "2021-10-10T00:00:00.000Z";
               GdataCalendarService.QueryParameters.start_max =
                 GdataDate.of_string "2021-10-10T00:00:00.000Z" } in
       let (feed, session) =
         GdataCalendarService.retrieve_events
           ~parameters
           session
       in
         assert_equal
           0
           (List.length feed.GdataCalendarEvent.Feed.entries))

let test_create_quick_add_event () =
  let entry =
    { GdataCalendarEvent.Entry.empty with
          GdataCalendarEvent.Entry.quickAdd = true;
          GdataCalendarEvent.Entry.content =
            { GdataAtom.Content.empty with
                  GdataAtom.Content._type = "text";
                  GdataAtom.Content.value = "Tennis with John November 11 3pm-3:30pm"
            }
    }
  in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_event entry session in
         let w = List.hd (new_entry.GdataCalendarEvent.Entry._when) in
           ignore (GdataCalendarService.delete_event
                     new_entry
                     session);
           assert_bool
             "startTime"
             (ExtString.String.exists
                (GdataDate.to_string w.GdataCalendar.When.startTime) "15:00:00");
           assert_bool
             "endTime"
             (ExtString.String.exists
                (GdataDate.to_string w.GdataCalendar.When.endTime) "15:30:00"))

let test_create_recurring_event () =
  let ch = open_in "test/data/recurrence.xml" in
  let entry = GdataUtils.parse_xml
                (fun () -> input_byte ch)
                GdataCalendarEvent.parse_calendar_event_entry in
  let entry = { entry with
                    GdataCalendarEvent.Entry.recurrence = "DTSTART;VALUE=DATE:20100505\r\nDTEND;VALUE=DATE:20100506\r\nRRULE:FREQ=WEEKLY;BYDAY=Tu;UNTIL=20100904\r\n"
  } in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (new_entry, session) =
           GdataCalendarService.create_new_event entry session in
         let id = new_entry.GdataCalendarEvent.Entry.id in
         let (feed, session) = GdataCalendarService.retrieve_events session in
           ignore (GdataCalendarService.delete_event
                     new_entry
                     session);
           assert_bool
             "Created entry id not found in event feed"
             (List.exists
                (fun e -> e.GdataCalendarEvent.Entry.id = id)
                feed.GdataCalendarEvent.Feed.entries))

let test_retrieve_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (own, session) = GdataCalendarService.own_calendars session in
       let entry = List.hd own.GdataCalendar.Feed.entries in
       let (feed, session) = GdataCalendarService.retrieve_acl
                                 entry
                                 session in
         TestHelper.assert_not_empty
           "Feed ID should not be empty"
           feed.GdataACL.Feed.id;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_create_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (own, session) = GdataCalendarService.own_calendars session in
       let calendar_entry = List.hd own.GdataCalendar.Feed.entries in
       let (new_entry, session) =
         GdataCalendarService.create_acl acl_entry calendar_entry session in
       let id = new_entry.GdataACL.Entry.id in
       let (feed, session) = GdataCalendarService.retrieve_acl
                                 calendar_entry
                                 session in
         ignore (GdataCalendarService.delete_acl
                   new_entry
                   session);
         assert_bool
           "Created entry id not found in acl feed"
           (List.exists
              (fun e -> e.GdataACL.Entry.id = id)
              feed.GdataACL.Feed.entries)) 

let test_update_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (own, session) = GdataCalendarService.own_calendars session in
       let calendar_entry = List.hd own.GdataCalendar.Feed.entries in
       let (new_entry, session) =
         GdataCalendarService.create_acl acl_entry calendar_entry session in
       let updated_entry =
         { new_entry with
               GdataACL.Entry.role =
                 "http://schemas.google.com/gCal/2005#read" } in
       let (server_updated_entry, session) =
         GdataCalendarService.update_acl updated_entry session in
       let (_, session) =
         GdataCalendarService.refresh_acl server_updated_entry session
       in
         ignore (GdataCalendarService.delete_acl
                   server_updated_entry
                   session);
         assert_equal
           updated_entry.GdataACL.Entry.role
           server_updated_entry.GdataACL.Entry.role)

let test_event_batch_request () =
  let ch = open_in "test/data/event_batch_request.xml" in
  let batch_request = GdataUtils.parse_xml
                        (fun () -> input_byte ch)
                        GdataCalendarEvent.Feed.parse_feed in
  let find_entry id feed =
    List.find
      (fun e -> e.GdataCalendarEvent.Entry.batch_id = id)
      feed.GdataCalendarEvent.Feed.entries
  in
    TestHelper.test_request
      TestHelper.build_oauth2_auth
      (fun session ->
         let (target_feed, session) =
           GdataCalendarService.retrieve_events
             session in
         let (batch_response, session) =
           GdataCalendarService.event_batch_request
             target_feed
             batch_request
             session in
         let e1 = find_entry "Insert itemA" batch_response in
         let e2 = find_entry "Query itemB" batch_response in
         let e3 = find_entry "Update itemC" batch_response in
         let e4 = find_entry "Delete itemD" batch_response in
           ignore (GdataCalendarService.delete_event
                     e1
                     session);
           assert_equal ~msg:"Insert itemA"
             201
             e1.GdataCalendarEvent.Entry.batch_status.GdataBatch.Status.code;
           TestHelper.assert_not_empty
             "Query itemB"
             e2.GdataCalendarEvent.Entry.batch_status.GdataBatch.Status.content;
           assert_equal ~msg:"Update itemC"
             404
             e3.GdataCalendarEvent.Entry.batch_status.GdataBatch.Status.code;
           assert_equal ~msg:"Delete itemD"
             404
             e4.GdataCalendarEvent.Entry.batch_status.GdataBatch.Status.code)

let suite = "Calendar Service test" >:::
  ["test_personal_settings" >:: test_personal_settings;
   "test_all_calendars" >:: test_all_calendars;
   "test_own_calendars" >:: test_own_calendars;
   "test_create_new_calendar" >:: test_create_new_calendar;
   "test_delete_calendar" >:: test_delete_calendar;
   "test_update_calendar" >:: test_update_calendar;
   "test_add_new_subscription" >:: test_add_new_subscription;
   "test_retrieve_events" >:: test_retrieve_events;
   "test_create_new_event" >:: test_create_new_event;
   "test_update_calendar" >:: test_update_event;
   "test_retrieve_events_with_parameters"
     >:: test_retrieve_events_with_parameters;
   "test_create_quick_add_event" >:: test_create_quick_add_event;
   "test_create_recurring_event" >:: test_create_recurring_event;
   "test_retrieve_acl" >:: test_retrieve_acl;
   "test_create_acl" >:: test_create_acl;
   "test_update_acl" >:: test_update_acl;
   "test_event_batch_request" >:: test_event_batch_request]

