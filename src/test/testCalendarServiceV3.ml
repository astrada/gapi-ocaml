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
      scope = {
        GapiCalendar.ScopeData._type = "user";
        value = "test@example.com"
      };
      role = "reader"
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
           ~ruleId:entry.GapiCalendar.AclRule.id
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

(* ColorsResource *)

let test_get_colors () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (colors, session) =
         GapiCalendarService.ColorsResource.get
           ~url:"https://www.googleapis.com/calendar/v3/colors?key=AIzaSyCxmj--5AFh3tMpf1zEkkdodiZgcYUX4uc"
           session
       in
         assert_equal
           "calendar#colors"
           colors.GapiCalendar.Colors.kind;
         assert_bool
           "There should be at least 1 calendar color"
           (List.length colors.GapiCalendar.Colors.calendar >= 1))

(* SettingsResource *)

let test_settings_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (settings, _) =
         GapiCalendarService.SettingsResource.list
           session
       in
         assert_equal
           "calendar#settings"
           settings.GapiCalendar.Settings.kind;
         assert_bool
           "There should be at least 1 setting"
           (List.length settings.GapiCalendar.Settings.items >= 1))

let test_settings_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (setting, _) =
         GapiCalendarService.SettingsResource.get
           ~setting:"country"
           session
       in
         assert_equal
           "calendar#setting"
           setting.GapiCalendar.Setting.kind;
         TestHelper.assert_not_empty
           "country setting should not be empty"
           setting.GapiCalendar.Setting.value)

(* CalendarsResource *)

let new_calendar =
  { GapiCalendar.Calendar.empty with
        GapiCalendar.Calendar.kind = "calendar#calendar";
        summary = "New test calendar";
        description = "Description of new test calendar"
  }

let test_insert_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarsResource.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "New calendar id should not be empty"
           new_entry.GapiCalendar.Calendar.id)

let test_get_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let (entry', session) =
         GapiCalendarService.CalendarsResource.get
           ~calendarId:entry.GapiCalendar.Calendar.id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarsResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.Calendar.id
           entry'.GapiCalendar.Calendar.id)

let test_get_calendar_partial_response () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let parameters =
         { GapiService.StandardParameters.default with
               GapiService.StandardParameters.fields = "kind,id,summary"
         } in
       let (entry', session) =
         GapiCalendarService.CalendarsResource.get
           ~parameters
           ~calendarId:entry.GapiCalendar.Calendar.id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarsResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.Calendar.id
           entry'.GapiCalendar.Calendar.id;
         assert_equal
           entry.GapiCalendar.Calendar.summary
           entry'.GapiCalendar.Calendar.summary;
         assert_equal
           ""
           entry'.GapiCalendar.Calendar.description)

let test_refresh_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let (entry', session) =
         GapiCalendarService.CalendarsResource.refresh
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarsResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.Calendar.id
           entry'.GapiCalendar.Calendar.id)

let test_update_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let entry = { entry with
                         GapiCalendar.Calendar.description =
                           "Updated description" } in
       let (entry, session) =
         GapiCalendarService.CalendarsResource.update
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarsResource.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.Calendar.description)

let test_patch_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let entry = {
         GapiCalendar.Calendar.empty with
             GapiCalendar.Calendar.id = entry.GapiCalendar.Calendar.id;
             description = "Updated description"
       } in
       let (entry, session) =
         GapiCalendarService.CalendarsResource.patch
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarsResource.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.Calendar.description;
         assert_equal
           "calendar#calendar"
           entry.GapiCalendar.Calendar.kind)

let test_delete_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let (calendars, session) =
         GapiCalendarService.CalendarListResource.list
           session in
       let _ = delay () in
       let ((), session) =
         GapiCalendarService.CalendarsResource.delete
           entry
           session in
       let (calendars', _) =
         GapiCalendarService.CalendarListResource.list
           session
       in
         TestHelper.assert_exists
           "calendars should contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListEntry.id =
                entry.GapiCalendar.Calendar.id)
           calendars.GapiCalendar.CalendarList.items;
         TestHelper.assert_not_exists
           "calendars' should not contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListEntry.id =
                entry.GapiCalendar.Calendar.id)
           calendars'.GapiCalendar.CalendarList.items)

let test_clear_primary_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       ignore (GapiCalendarService.CalendarsResource.clear
                 session))

(* EventsResource *)

let test_event_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (events, session) =
         GapiCalendarService.EventsResource.list
           session
       in
         assert_equal
           "calendar#events"
           events.GapiCalendar.Events.kind;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let new_event =
  { GapiCalendar.Event.empty with
        GapiCalendar.Event.kind = "calendar#event";
        summary = "New test event";
        description = "Description of new test event";
        start =
          { GapiCalendar.EventDateTime.empty with
                GapiCalendar.EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-19T09:00:00Z";
                timeZone = "UTC"
          };
        _end =
          { GapiCalendar.EventDateTime.empty with
                GapiCalendar.EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-19T13:00:00Z";
                timeZone = "UTC"
          }
  }

let new_recurring_event =
  { GapiCalendar.Event.empty with
        GapiCalendar.Event.kind = "calendar#event";
        summary = "New recurring event";
        description = "Description of new recurring event";
        start =
          { GapiCalendar.EventDateTime.empty with
                GapiCalendar.EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-03T10:00:00Z";
                timeZone = "UTC"
          };
        _end =
          { GapiCalendar.EventDateTime.empty with
                GapiCalendar.EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-03T15:00:00Z";
                timeZone = "UTC"
          };
        recurrence =
          [ "RRULE:FREQ=DAILY;UNTIL=20111206" ]
  }

let test_insert_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   event
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.Event.id)

let test_get_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let (entry', session) =
         GapiCalendarService.EventsResource.get
           ~eventId:entry.GapiCalendar.Event.id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.Event.id
           entry'.GapiCalendar.Event.id)

let test_refresh_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let (entry', session) =
         GapiCalendarService.EventsResource.refresh
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   entry'
                   session);
         assert_equal
           entry.GapiCalendar.Event.id
           entry'.GapiCalendar.Event.id)

let test_update_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let entry = { entry with
                         GapiCalendar.Event.description =
                           "Updated description" } in
       let (entry, session) =
         GapiCalendarService.EventsResource.update
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.Event.description)

let test_patch_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let entry = {
         GapiCalendar.Event.empty with
             GapiCalendar.Event.id = entry.GapiCalendar.Event.id;
             description = "Updated description"
       } in
       let (entry, session) =
         GapiCalendarService.EventsResource.patch
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   entry
                   session);
         assert_equal
           "Updated description"
           entry.GapiCalendar.Event.description;
         assert_equal
           "calendar#event"
           entry.GapiCalendar.Event.kind)

let test_delete_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let _ = delay () in
       let (events, session) =
         GapiCalendarService.EventsResource.list
           ~timeMin:(GapiDate.of_string "2011-12-19T00:00:00Z")
           session in
       let ((), session) =
         GapiCalendarService.EventsResource.delete
           entry
           session in
       let (events', _) =
         GapiCalendarService.EventsResource.list
           ~timeMin:(GapiDate.of_string "2011-12-19T00:00:00Z")
           session
       in
         TestHelper.assert_exists
           "events list should contain new event"
           (fun e ->
              e.GapiCalendar.Event.id = entry.GapiCalendar.Event.id)
           events.GapiCalendar.Events.items;
         TestHelper.assert_not_exists
           "events' list should not contain new calendar"
           (fun e ->
              e.GapiCalendar.Event.id = entry.GapiCalendar.Event.id)
           events'.GapiCalendar.Events.items)

let test_quick_add_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.EventsResource.quickAdd
           ~text:"Appointment at Somewhere on June 3rd 10am-10:25am"
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   event
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.Event.id)

let test_import_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let event = new_event
         |> GapiCalendar.Event.iCalUID ^=
           GapiDate.to_string (GapiDate.now ()) ^ "imported_event" in
       let (event, session) =
         GapiCalendarService.EventsResource.import
           event
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   event
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.Event.id)

let test_move_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let (calendar, session) =
         GapiCalendarService.CalendarsResource.insert
           new_calendar
           session in
       let _ = delay () in
       let (event, session) =
         GapiCalendarService.EventsResource.move
           ~eventId:event.GapiCalendar.Event.id
           ~destination:calendar.GapiCalendar.Calendar.id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.EventsResource.delete
                   ~calendarId:calendar.GapiCalendar.Calendar.id
                   event
                   session);
         ignore (GapiCalendarService.CalendarsResource.delete
                   calendar
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.GapiCalendar.Event.id)

let test_recurring_event_instances () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.EventsResource.insert
           new_recurring_event
           session in
       let _ = delay () in
       let (events, session) =
         GapiCalendarService.EventsResource.instances
           ~eventId:event.GapiCalendar.Event.id
           session
       in
         ignore (GapiCalendarService.EventsResource.delete
                   event
                   session);
         assert_equal
           "calendar#events"
           events.GapiCalendar.Events.kind;
         assert_equal
           3
           (List.length events.GapiCalendar.Events.items))

let test_recurring_event_instance_reset () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         GapiCalendarService.EventsResource.insert
           new_recurring_event
           session in
       let _ = delay () in
       let (events, session) =
         GapiCalendarService.EventsResource.instances
           ~eventId:event.GapiCalendar.Event.id
           session in
       let second_instance = events
         |. GapiCalendar.Events.items
         |. GapiLens.tail
         |. GapiLens.head in
       let canceled_instance = second_instance
         |> GapiCalendar.Event.status ^= "cancelled" in
       let (updated_instance, session) =
         GapiCalendarService.EventsResource.update
           canceled_instance
           session in
       let (restored_instance, session) =
         GapiCalendarService.EventsResource.reset
           ~eventId:updated_instance.GapiCalendar.Event.id
           session
       in
         ignore (GapiCalendarService.EventsResource.delete
                   event
                   session);
         assert_equal
           "cancelled"
           updated_instance.GapiCalendar.Event.status;
         assert_equal
           "confirmed"
           restored_instance.GapiCalendar.Event.status)

(* Calendar List *)

let australian_calendar_id =
  "en.australian#holiday@group.v.calendar.google.com"

let australian_calendar =
  { GapiCalendar.CalendarListEntry.empty with
        GapiCalendar.CalendarListEntry.id = australian_calendar_id
  }

let test_list_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendars, session) =
         GapiCalendarService.CalendarListResource.list
           session
       in
         assert_equal
           "calendar#calendarList"
           calendars.GapiCalendar.CalendarList.kind;
         assert_bool
           "There should be at least 1 calendar"
           (List.length calendars.GapiCalendar.CalendarList.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_list_calendar_list_with_max_results () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let parameters = {
         GapiService.StandardParameters.default with
             GapiService.StandardParameters.prettyPrint = false
       } in
       let (calendars, session) =
         GapiCalendarService.CalendarListResource.list
           ~parameters
           ~maxResults:1
           session
       in
         assert_equal
           1
           (List.length calendars.GapiCalendar.CalendarList.items))

let test_insert_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.CalendarListResource.insert
           australian_calendar
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarListResource.delete
                   new_entry
                   session);
         assert_equal
           australian_calendar_id
           new_entry.GapiCalendar.CalendarListEntry.id)

let test_get_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarListResource.insert
           australian_calendar
           session in
       let (entry, session) =
         GapiCalendarService.CalendarListResource.get
           ~calendarId:australian_calendar_id
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarListResource.delete
                   entry
                   session);
         assert_equal
           australian_calendar_id
           entry.GapiCalendar.CalendarListEntry.id)

let test_refresh_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarListResource.insert
           australian_calendar
           session in
       let (entry, session) =
         GapiCalendarService.CalendarListResource.refresh
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarListResource.delete
                   entry
                   session);
         assert_equal
           australian_calendar_id
           entry.GapiCalendar.CalendarListEntry.id)

let test_update_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarListResource.insert
           australian_calendar
           session in
       let entry = { entry with
                         GapiCalendar.CalendarListEntry.hidden = true } in
       let (entry, session) =
         GapiCalendarService.CalendarListResource.update
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarListResource.delete
                   entry
                   session);
         assert_equal
           true
           entry.GapiCalendar.CalendarListEntry.hidden)

let test_patch_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarListResource.insert
           australian_calendar
           session in
       let entry = {
         GapiCalendar.CalendarListEntry.empty with
             GapiCalendar.CalendarListEntry.id = australian_calendar_id;
             hidden = true
       } in
       let (entry, session) =
         GapiCalendarService.CalendarListResource.patch
           entry
           session in
       let _ = delay () in
         ignore (GapiCalendarService.CalendarListResource.delete
                   entry
                   session);
         assert_equal
           true
           entry.GapiCalendar.CalendarListEntry.hidden;
         assert_equal
           "calendar#calendarListEntry"
           entry.GapiCalendar.CalendarListEntry.kind)

let test_delete_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.CalendarListResource.insert
           australian_calendar
           session in
       let (calendars, session) =
         GapiCalendarService.CalendarListResource.list
           session in
       let _ = delay () in
       let ((), session) =
         GapiCalendarService.CalendarListResource.delete
           entry
           session in
       let (calendars', _) =
         GapiCalendarService.CalendarListResource.list
           session
       in
         TestHelper.assert_exists
           "calendars should contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListEntry.id = australian_calendar_id)
           calendars.GapiCalendar.CalendarList.items;
         TestHelper.assert_not_exists
           "calendars' should not contain new calendar"
           (fun e ->
              e.GapiCalendar.CalendarListEntry.id = australian_calendar_id)
           calendars'.GapiCalendar.CalendarList.items)

(* Free/busy *)

let test_free_busy_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar, session) =
         GapiCalendarService.CalendarsResource.get
           ~calendarId:"primary"
           session in
       let (event, session) =
         GapiCalendarService.EventsResource.insert
           new_event
           session in
       let _ = delay () in
       let params =
         { GapiCalendar.FreeBusyRequest.empty with
               GapiCalendar.FreeBusyRequest.timeMin =
                 GapiDate.of_string "2011-12-02";
               timeMax = GapiDate.of_string "2011-12-04";
               items = [ calendar.GapiCalendar.Calendar.id ]
         } in
       let (freeBusy, _) =
         GapiCalendarService.FreebusyResource.query
           params
           session
       in
         ignore (GapiCalendarService.EventsResource.delete
                   event
                   session);
         assert_equal
           "calendar#freeBusy"
           freeBusy.GapiCalendar.FreeBusyResponse.kind;
         assert_bool
           "There should be at least 1 calendar in free/busy resource"
           (List.length freeBusy.GapiCalendar.FreeBusyResponse.calendars >= 1))

let suite = "Calendar services (v3) test" >:::
  ["test_list_acl" >:: test_list_acl;
   "test_insert_acl" >:: test_insert_acl;
   "test_get_acl" >:: test_get_acl;
   "test_update_acl" >:: test_update_acl;
   "test_delete_acl" >:: test_delete_acl;
   "test_get_colors" >:: test_get_colors;
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
   "test_get_calendar_partial_response" >:: test_get_calendar_partial_response;
   "test_refresh_calendar" >:: test_refresh_calendar;
   "test_insert_calendar" >:: test_insert_calendar;
   "test_update_calendar" >:: test_update_calendar;
   "test_patch_calendar" >:: test_patch_calendar;
   "test_delete_calendar" >:: test_delete_calendar;
   (*"test_clear_primary_calendar" >:: test_clear_primary_calendar;
    * -- clears primary calendar;*)
   "test_free_busy_query" >:: test_free_busy_query]

