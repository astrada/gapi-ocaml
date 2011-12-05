open OUnit
open GapiUtils.Infix
open GapiLens.Infix

(* We should add a delay to let Google persist the new entry, after a write
 * operation, otherwise DELETE will return a 503 HTTP error (Service
 * Unavailable) *)
let delay () =
  Unix.sleep 5

(* ACL *)

let acl_test_resource = {
  GapiCalendar.AclRule.empty with
      GapiCalendar.AclRule.kind = "calendar#acl";
      GapiCalendar.AclRule.scope = {
        GapiCalendar.ScopeData._type = "user";
        GapiCalendar.ScopeData.value = "test@example.com"
      };
      GapiCalendar.AclRule.role = "reader"
}

let test_list_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (acl, session) =
         GapiCalendarService.AclResource.list
           session
       in
         assert_equal
           "calendar#acl"
           acl.GapiCalendar.Acl.kind;
         assert_bool
           "There should be at least 1 ACL"
           (List.length acl.GapiCalendar.Acl.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_insert_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.AclResource.insert
           acl_test_resource
           session in
       let _ = delay () in
         ignore (GapiCalendarService.AclResource.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "ACL id should not be empty"
           new_entry.GapiCalendar.AclRule.id)

let test_get_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.AclResource.insert
           acl_test_resource
           session in
       let (entry', session) =
         GapiCalendarService.AclResource.get
           entry.GapiCalendar.AclRule.id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.AclResource.delete
                   entry
                   session);
         assert_equal
           entry.GapiCalendar.AclRule.id
           entry'.GapiCalendar.AclRule.id)

let test_update_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.AclResource.insert
           acl_test_resource
           session in
       let entry = { entry with
                         GapiCalendar.AclRule.role = "freeBusyReader" } in
       let (entry, session) =
         GapiCalendarService.AclResource.update
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.AclResource.delete
                   entry
                   session);
         assert_equal
           "freeBusyReader"
           entry.GapiCalendar.AclRule.role)

let test_delete_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.AclResource.insert
           acl_test_resource
           session in
       let (acl, session) =
         GapiCalendarService.AclResource.list
           session in
       let _ = delay () in
       let ((), session) =
         GapiCalendarService.AclResource.delete
           entry
           session in
       let (acl', _) =
         GapiCalendarService.AclResource.list
           session
       in
         TestHelper.assert_exists
           "acl should contain new acl"
           (fun e ->
              e.GapiCalendar.AclRule.id = entry.GapiCalendar.AclRule.id)
           acl.GapiCalendar.Acl.items;
         TestHelper.assert_not_exists
           "acl' should not contain new acl"
           (fun e ->
              e.GapiCalendar.AclRule.id = entry.GapiCalendar.AclRule.id)
           acl'.GapiCalendar.Acl.items)

(* Colors *)

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

(* Settings *)

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

let test_settings_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (setting, _) =
         GapiCalendarService.Settings.get
           "country"
           session
       in
         assert_equal
           "calendar#setting"
           setting.GapiCalendar.SettingsResource.kind;
         TestHelper.assert_not_empty
           "country setting should not be empty"
           setting.GapiCalendar.SettingsResource.value)

(* Calendars *)

let new_calendar =
  { GapiCalendar.CalendarsResource.empty with
        GapiCalendar.CalendarsResource.kind = "calendar#calendar";
        GapiCalendar.CalendarsResource.summary = "New test calendar";
        GapiCalendar.CalendarsResource.description =
          "Description of new test calendar"
  }

let test_insert_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.Calendars.insert
           new_calendar
           session in
       let _ = delay () in
         ignore (GapiCalendarService.Calendars.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "New calendar id should not be empty"
           new_entry.GapiCalendar.CalendarsResource.id)

let test_get_calendar () =
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
       let _ = delay () in
         ignore (GapiCalendarService.Calendars.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.CalendarsResource.id
           entry'.GapiCalendar.CalendarsResource.id)

let test_refresh_calendar () =
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
       let _ = delay () in
         ignore (GapiCalendarService.Calendars.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.CalendarsResource.id
           entry'.GapiCalendar.CalendarsResource.id)

let test_update_calendar () =
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
       let _ = delay () in
         ignore (GapiCalendarService.Calendars.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.CalendarsResource.description)

let test_patch_calendar () =
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
       let _ = delay () in
         ignore (GapiCalendarService.Calendars.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.CalendarsResource.description;
         assert_equal
           "calendar#calendar"
           entry.GapiCalendar.CalendarsResource.kind)

let test_delete_calendar () =
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
       let _ = delay () in
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

let test_clear_primary_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       ignore (GapiCalendarService.Calendars.clear
                 session))

(* Events *)

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
                GapiCalendar.DateTime.dateTime =
                  GapiDate.of_string "2011-12-03T09:00:00Z";
                GapiCalendar.DateTime.timeZone = "UTC"
          };
        GapiCalendar.EventsResource._end =
          { GapiCalendar.DateTime.empty with
                GapiCalendar.DateTime.dateTime =
                  GapiDate.of_string "2011-12-03T13:00:00Z";
                GapiCalendar.DateTime.timeZone = "UTC"
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
                GapiCalendar.DateTime.dateTime =
                  GapiDate.of_string "2011-12-03T10:00:00Z";
                GapiCalendar.DateTime.timeZone = "UTC"
          };
        GapiCalendar.EventsResource._end =
          { GapiCalendar.DateTime.empty with
                GapiCalendar.DateTime.dateTime =
                  GapiDate.of_string "2011-12-03T15:00:00Z";
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
         |> GapiCalendar.EventsResource.iCalUID ^=
           GapiDate.to_string (GapiDate.now ()) ^ "imported_event" in
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
           new_calendar
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

(* Calendar List *)

let australian_calendar_id =
  "en.australian#holiday@group.v.calendar.google.com"

let australian_calendar =
  { GapiCalendar.CalendarListResource.empty with
        GapiCalendar.CalendarListResource.id = australian_calendar_id
  }

let test_list_calendar_list () =
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

let test_list_calendar_list_with_max_results () =
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

let test_insert_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.CalendarList.insert
           australian_calendar
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarList.delete
                   new_entry
                   session);
         assert_equal
           australian_calendar_id
           new_entry.GapiCalendar.CalendarListResource.id)

let test_get_calendar_list () =
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
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           australian_calendar_id
           entry.GapiCalendar.CalendarListResource.id)

let test_refresh_calendar_list () =
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
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           australian_calendar_id
           entry.GapiCalendar.CalendarListResource.id)

let test_update_calendar_list () =
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
       let _ = delay () in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           true
           entry.GapiCalendar.CalendarListResource.hidden)

let test_patch_calendar_list () =
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
       let _ = delay () in
         ignore (GapiCalendarService.CalendarList.delete
                   entry
                   session);
         assert_equal
           true
           entry.GapiCalendar.CalendarListResource.hidden;
         assert_equal
           "calendar#calendarListEntry"
           entry.GapiCalendar.CalendarListResource.kind)

let test_delete_calendar_list () =
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
       let _ = delay () in
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

(* Free/busy *)

let test_free_busy_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar, session) =
         GapiCalendarService.Calendars.get
           "primary"
           session in
       let (event, session) =
         GapiCalendarService.Events.insert
           new_event
           session in
       let _ = delay () in
       let params =
         { GapiCalendar.FreeBusyParameters.empty with
               GapiCalendar.FreeBusyParameters.timeMin =
                 GapiDate.of_string "2011-12-02";
               GapiCalendar.FreeBusyParameters.timeMax =
                 GapiDate.of_string "2011-12-04";
               GapiCalendar.FreeBusyParameters.items =
                 [ calendar.GapiCalendar.CalendarsResource.id ]
         } in
       let (freeBusy, _) =
         GapiCalendarService.FreeBusy.query
           params
           session
       in
         ignore (GapiCalendarService.Events.delete
                   event
                   session);
         assert_equal
           "calendar#freeBusy"
           freeBusy.GapiCalendar.FreeBusyResource.kind;
         assert_bool
           "There should be at least 1 calendar in free/busy resource"
           (List.length freeBusy.GapiCalendar.FreeBusyResource.calendars >= 1))

let suite = "Calendar services (v3) test" >:::
  ["test_list_acl" >:: test_list_acl;
   "test_insert_acl" >:: test_insert_acl;
   "test_get_acl" >:: test_get_acl;
   "test_update_acl" >:: test_update_acl;
   "test_delete_acl" >:: test_delete_acl;
   "test_colors_get" >:: test_colors_get;
   "test_settings_list" >:: test_settings_list;
   "test_settings_get" >:: test_settings_get;
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
   "test_list_calendar_list" >:: test_list_calendar_list;
   "test_list_calendar_list_with_max_results"
     >:: test_list_calendar_list_with_max_results;
   "test_get_calendar_list" >:: test_get_calendar_list;
   "test_refresh_calendar_list" >:: test_refresh_calendar_list;
   "test_insert_calendar_list" >:: test_insert_calendar_list;
   "test_update_calendar_list" >:: test_update_calendar_list;
   "test_patch_calendar_list" >:: test_patch_calendar_list;
   "test_delete_calendar_list" >:: test_delete_calendar_list;
   "test_get_calendar" >:: test_get_calendar;
   "test_refresh_calendar" >:: test_refresh_calendar;
   "test_insert_calendar" >:: test_insert_calendar;
   "test_update_calendar" >:: test_update_calendar;
   "test_patch_calendar" >:: test_patch_calendar;
   "test_delete_calendar" >:: test_delete_calendar;
   (*"test_clear_primary_calendar" >:: test_clear_primary_calendar;
    * -- clears primary calendar;*)
   "test_free_busy_query" >:: test_free_busy_query]

