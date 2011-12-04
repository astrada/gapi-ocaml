open OUnit
open GapiUtils.Infix
open GapiLens.Infix

(* We should add a delay to let Google persist the new entry, after a write
 * operation, otherwise DELETE will return a 503 HTTP error (Service
 * Unavailable) *)
let delay () =
  Unix.sleep 5

let test_colors_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (colors, session) =
         GapiCalendarService.Colors.get
           session
       in
         assert_equal
           "calendar#colors"
           colors.GapiCalendar.ColorList.kind;
         assert_bool
           "There should be at least 1 calendar color"
           (List.length colors.GapiCalendar.ColorList.calendar >= 1))

let test_settings_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (settings, _) =
         GapiCalendarService.Settings.list
           session
       in
         assert_equal
           "calendar#settings"
           settings.GapiCalendar.SettingsList.kind;
         assert_bool
           "There should be at least 1 setting"
           (List.length settings.GapiCalendar.SettingsList.items >= 1))

let test_free_busy_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar, session) =
         GapiCalendarService.Events.get
           "primary"
           session in
       let params =
         { GapiCalendar.FreeBusyParameters.empty with
               GapiCalendar.FreeBusyParameters.timeMin =
                 GapiDate.of_string "2011-11-10";
               GapiCalendar.FreeBusyParameters.timeMax =
                 GapiDate.of_string "2011-12-01";
               GapiCalendar.FreeBusyParameters.items =
                 [ calendar.GapiCalendar.EventsResource.id ]
         } in
       let (freeBusy, _) =
         GapiCalendarService.FreeBusy.query
           params
           session
       in
         assert_equal
           "calendar#freeBusy"
           freeBusy.GapiCalendar.FreeBusyResource.kind;
         assert_bool
           "There should be at least 1 calendar in free/busy resource"
           (List.length freeBusy.GapiCalendar.FreeBusyResource.calendars >= 1))

let test_event_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (events, session) =
         GapiCalendarService.Events.list
           session
       in
         assert_equal
           "calendar#events"
           events.GapiCalendar.EventsList.kind;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let new_event =
  { GapiCalendar.EventsResource.empty with
        GapiCalendar.EventsResource.kind = "calendar#event";
        GapiCalendar.EventsResource.summary = "New test event";
        GapiCalendar.EventsResource.description =
          "Description of new test event";
        GapiCalendar.EventsResource.start =
          { GapiCalendar.DateTime.empty with
                GapiCalendar.DateTime.date = GapiDate.of_string "2011-12-03"
          };
        GapiCalendar.EventsResource._end =
          { GapiCalendar.DateTime.empty with
                GapiCalendar.DateTime.date = GapiDate.of_string "2011-12-03"
          }
  }

let new_recurring_event =
  { GapiCalendar.EventsResource.empty with
        GapiCalendar.EventsResource.kind = "calendar#event";
        GapiCalendar.EventsResource.summary = "New recurring event";
        GapiCalendar.EventsResource.description =
          "Description of new recurring event";
        GapiCalendar.EventsResource.start =
          { GapiCalendar.DateTime.empty with
                GapiCalendar.DateTime.dateTime = GapiDate.of_string "2011-12-03T10:00:00Z";
                GapiCalendar.DateTime.timeZone = "UTC"
          };
        GapiCalendar.EventsResource._end =
          { GapiCalendar.DateTime.empty with
                GapiCalendar.DateTime.dateTime = GapiDate.of_string "2011-12-03T15:00:00Z";
                GapiCalendar.DateTime.timeZone = "UTC"
          };
        GapiCalendar.EventsResource.recurrence =
          [ "RRULE:FREQ=DAILY;UNTIL=20111206" ]
  }

let test_insert_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.EventsResource.id)

let test_get_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let (entry', session) =
         GapiCalendarService.Events.get
           entry.GapiCalendar.EventsResource.id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.EventsResource.id
           entry'.GapiCalendar.EventsResource.id)

let test_refresh_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let (entry', session) =
         GapiCalendarService.Events.refresh
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.EventsResource.id
           entry'.GapiCalendar.EventsResource.id)

let test_update_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let entry = { entry with
                         GapiCalendar.EventsResource.description =
                           "Updated description" } in
       let (entry, session) =
         GapiCalendarService.Events.update
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.EventsResource.description)

let test_patch_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let entry = {
         GapiCalendar.EventsResource.empty with
             GapiCalendar.EventsResource.id =
               entry.GapiCalendar.EventsResource.id;
             GapiCalendar.EventsResource.description =
               "Updated description"
       } in
       let (entry, session) =
         GapiCalendarService.Events.patch
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.EventsResource.description;
         assert_equal
           "calendar#event"
           entry.GapiCalendar.EventsResource.kind)

let test_delete_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let (events, session) =
         GapiCalendarService.Events.list
           session in
       let _ = delay () in
       let ((), session) =
         GapiCalendarService.Events.delete
           entry
           session in
       let (events', _) =
         GapiCalendarService.Events.list
           session
       in
         TestHelper.assert_exists
           "events list should contain new event"
           (fun e ->
              e.GapiCalendar.EventsResource.id =
                entry.GapiCalendar.EventsResource.id)
           events.GapiCalendar.EventsList.items;
         TestHelper.assert_not_exists
           "events' list should not contain new calendar"
           (fun e ->
              e.GapiCalendar.EventsResource.id =
                entry.GapiCalendar.EventsResource.id)
           events'.GapiCalendar.EventsList.items)

let test_quick_add_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.Events.quickAdd
           "Appointment at Somewhere on June 3rd 10am-10:25am"
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.EventsResource.id)

let test_import_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let event = new_event
         |> GapiCalendar.EventsResource.iCalUID ^= "icaluid_imported_event" in
       let (event, session) =
         GapiCalendarService.Events.import
           event
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.EventsResource.id)

let test_move_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let (calendar, session) =
         GapiCalendarService.Calendars.insert
           TestCalendars.new_calendar
           session in
       let _ = delay () in
       let (event, session) =
         GapiCalendarService.Events.move
           event.GapiCalendar.EventsResource.id
           calendar.GapiCalendar.CalendarsResource.id
           session in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         ignore (GapiCalendarService.Calendars.delete
                   calendar
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.EventsResource.id)

let test_recurring_event_instances () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.Events.insert
           new_recurring_event
           session in
       let _ = delay () in
       let (events, session) =
         GapiCalendarService.Events.instances
           event.GapiCalendar.EventsResource.id
           session
       in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         assert_equal
           "calendar#events"
           events.GapiCalendar.EventsList.kind;
         assert_equal
           3
           (List.length events.GapiCalendar.EventsList.items))

let test_recurring_event_instance_reset () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.Events.insert
           new_recurring_event
           session in
       let _ = delay () in
       let (events, session) =
         GapiCalendarService.Events.instances
           event.GapiCalendar.EventsResource.id
           session in
       let second_instance = events
         |. GapiCalendar.EventsList.items
         |. GapiLens.tail
         |. GapiLens.head in
       let canceled_instance = second_instance
         |> GapiCalendar.EventsResource.status ^= "cancelled" in
       let (updated_instance, session) =
         GapiCalendarService.Events.update
           canceled_instance
           session in
       let (restored_instance, session) =
         GapiCalendarService.Events.reset
           updated_instance.GapiCalendar.EventsResource.id
           session
       in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         assert_equal
           "cancelled"
           updated_instance.GapiCalendar.EventsResource.status;
         assert_equal
           "confirmed"
           restored_instance.GapiCalendar.EventsResource.status)

let suite = "Calendar services (v3) test" >:::
  ["test_colors_get" >:: test_colors_get;
   "test_settings_list" >:: test_settings_list;
   "test_settings_get" >:: test_settings_get;
   "test_free_busy_query" >:: test_free_busy_query;
   "test_event_list" >:: test_event_list;
   "test_insert_event" >:: test_insert_event;
   "test_get_event" >:: test_get_event;
   "test_refresh_event" >:: test_refresh_event;
   "test_update_event" >:: test_update_event;
   "test_patch_event" >:: test_patch_event;
   "test_delete_event" >:: test_delete_event;
   "test_quick_add_event" >:: test_quick_add_event;
   "test_import_event" >:: test_import_event;
   "test_move_event" >:: test_move_event;
   "test_recurring_event_instances" >:: test_recurring_event_instances;
   "test_recurring_event_instance_reset"
     >:: test_recurring_event_instance_reset;
   ]

