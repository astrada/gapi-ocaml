open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiCalendarV3Model
open GapiCalendarV3Service

(* ACL *)

let acl_test_resource = {
  AclRule.empty with
      AclRule.kind = "calendar#acl";
      scope = {
        AclRule.Scope._type = "user";
        value = "test@example.com"
      };
      role = "reader"
}

let test_list_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (acl, session) =
         AclResource.list
           ~calendarId:"primary"
           session
       in
         assert_equal
           "calendar#acl"
           acl.Acl.kind;
         assert_bool
           "There should be at least 1 ACL"
           (List.length acl.Acl.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_insert_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         AclResource.insert
           ~calendarId:"primary"
           acl_test_resource
           session in
       let _ = TestHelper.delay () in
         ignore (AclResource.delete
                   ~calendarId:"primary"
                   ~ruleId:new_entry.AclRule.id
                   session);
         TestHelper.assert_not_empty
           "ACL id should not be empty"
           new_entry.AclRule.id)

let test_get_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         AclResource.insert
           ~calendarId:"primary"
           acl_test_resource
           session in
       let (entry', session) =
         AclResource.get
           ~calendarId:"primary"
           ~ruleId:entry.AclRule.id
           session in
       let _ = TestHelper.delay () in
         ignore (AclResource.delete
                   ~calendarId:"primary"
                   ~ruleId:entry.AclRule.id
                   session);
         assert_equal
           entry.AclRule.id
           entry'.AclRule.id)

let test_update_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         AclResource.insert
           ~calendarId:"primary"
           acl_test_resource
           session in
       let entry = { entry with
                         AclRule.role = "freeBusyReader" } in
       let (entry, session) =
         AclResource.update
           ~calendarId:"primary"
           ~ruleId:entry.AclRule.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (AclResource.delete
                   ~calendarId:"primary"
                   ~ruleId:entry.AclRule.id
                   session);
         assert_equal
           "freeBusyReader"
           entry.AclRule.role)

let test_delete_acl () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         AclResource.insert
           ~calendarId:"primary"
           acl_test_resource
           session in
       let (acl, session) =
         AclResource.list
           ~calendarId:"primary"
           session in
       let _ = TestHelper.delay () in
       let ((), session) =
         AclResource.delete
           ~calendarId:"primary"
           ~ruleId:entry.AclRule.id
           session in
       let (acl', _) =
         AclResource.list
           ~calendarId:"primary"
           session
       in
         TestHelper.assert_exists
           "acl should contain new acl"
           (fun e ->
              e.AclRule.id = entry.AclRule.id)
           acl.Acl.items;
         TestHelper.assert_not_exists
           "acl' should not contain new acl"
           (fun e ->
              e.AclRule.id = entry.AclRule.id)
           acl'.Acl.items)

(* ColorsResource *)

let test_get_colors () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let std_params = {
         GapiService.StandardParameters.default with
             GapiService.StandardParameters.key =
               Config.get test_config "key"
       } in
       let (colors, session) =
         ColorsResource.get
           ~std_params
           session
       in
         assert_equal
           "calendar#colors"
           colors.Colors.kind;
         assert_bool
           "There should be at least 1 calendar color"
           (List.length colors.Colors.calendar >= 1))

(* SettingsResource *)

let test_settings_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (settings, _) =
         SettingsResource.list
           session
       in
         assert_equal
           "calendar#settings"
           settings.Settings.kind;
         assert_bool
           "There should be at least 1 setting"
           (List.length settings.Settings.items >= 1))

let test_settings_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (setting, _) =
         SettingsResource.get
           ~setting:"country"
           session
       in
         assert_equal
           "calendar#setting"
           setting.Setting.kind;
         TestHelper.assert_not_empty
           "country setting should not be empty"
           setting.Setting.value)

(* CalendarsResource *)

let new_calendar =
  { Calendar.empty with
        Calendar.kind = "calendar#calendar";
        summary = "New test calendar";
        description = "Description of new test calendar"
  }

let test_insert_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarsResource.delete
                   ~calendarId:new_entry.Calendar.id
                   session);
         TestHelper.assert_not_empty
           "New calendar id should not be empty"
           new_entry.Calendar.id)

let test_get_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let (entry', session) =
         CalendarsResource.get
           ~calendarId:entry.Calendar.id
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarsResource.delete
                   ~calendarId:entry'.Calendar.id
                   session);
         assert_equal
           entry.Calendar.id
           entry'.Calendar.id)

let test_get_calendar_partial_response () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let std_params =
         { GapiService.StandardParameters.default with
               GapiService.StandardParameters.fields = "kind,id,summary"
         } in
       let (entry', session) =
         CalendarsResource.get
           ~std_params
           ~calendarId:entry.Calendar.id
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarsResource.delete
                   ~calendarId:entry'.Calendar.id
                   session);
         assert_equal
           entry.Calendar.id
           entry'.Calendar.id;
         assert_equal
           entry.Calendar.summary
           entry'.Calendar.summary;
         assert_equal
           ""
           entry'.Calendar.description)

let test_update_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let entry = { entry with
                         Calendar.description =
                           "Updated description" } in
       let (entry, session) =
         CalendarsResource.update
           ~calendarId:entry.Calendar.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarsResource.delete
                   ~calendarId:entry.Calendar.id
                   session);
         assert_equal
           "Updated description"
           entry.Calendar.description)

let test_patch_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let entry = {
         Calendar.empty with
             Calendar.id = entry.Calendar.id;
             description = "Updated description"
       } in
       let (entry, session) =
         CalendarsResource.patch
           ~calendarId:entry.Calendar.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarsResource.delete
                   ~calendarId:entry.Calendar.id
                   session);
         assert_equal
           "Updated description"
           entry.Calendar.description;
         assert_equal
           "calendar#calendar"
           entry.Calendar.kind)

let test_delete_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let (calendars, session) =
         CalendarListResource.list
           session in
       let _ = TestHelper.delay () in
       let ((), session) =
         CalendarsResource.delete
           ~calendarId:entry.Calendar.id
           session in
       let (calendars', _) =
         CalendarListResource.list
           session
       in
         TestHelper.assert_exists
           "calendars should contain new calendar"
           (fun e ->
              e.CalendarListEntry.id =
                entry.Calendar.id)
           calendars.CalendarList.items;
         TestHelper.assert_not_exists
           "calendars' should not contain new calendar"
           (fun e ->
              e.CalendarListEntry.id =
                entry.Calendar.id)
           calendars'.CalendarList.items)

let test_clear_primary_calendar () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       ignore (CalendarsResource.clear ~calendarId:"primary" session))

(* EventsResource *)

let test_event_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (events, session) =
         EventsResource.list
           ~calendarId:"primary"
           session
       in
         assert_equal
           "calendar#events"
           events.Events.kind;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let new_event =
  { Event.empty with
        Event.kind = "calendar#event";
        summary = "New test event";
        description = "Description of new test event";
        start =
          { EventDateTime.empty with
                EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-19T09:00:00Z";
                timeZone = "UTC"
          };
        _end =
          { EventDateTime.empty with
                EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-19T13:00:00Z";
                timeZone = "UTC"
          }
  }

let new_recurring_event =
  { Event.empty with
        Event.kind = "calendar#event";
        summary = "New recurring event";
        description = "Description of new recurring event";
        start =
          { EventDateTime.empty with
                EventDateTime.dateTime =
                  GapiDate.of_string "2011-12-03T10:00:00Z";
                timeZone = "UTC"
          };
        _end =
          { EventDateTime.empty with
                EventDateTime.dateTime =
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
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:event.Event.id
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.Event.id)

let test_get_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let (entry', session) =
         EventsResource.get
           ~calendarId:"primary"
           ~eventId:entry.Event.id
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:entry'.Event.id
                   session);
         assert_equal
           entry.Event.id
           entry'.Event.id)

let test_update_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let entry = { entry with
                         Event.description =
                           "Updated description" } in
       let (entry, session) =
         EventsResource.update
           ~calendarId:"primary"
           ~eventId:entry.Event.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:entry.Event.id
                   session);
         assert_equal
           "Updated description"
           entry.Event.description)

let test_patch_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let entry = {
         Event.empty with
             Event.id = entry.Event.id;
             description = "Updated description"
       } in
       let (entry, session) =
         EventsResource.patch
           ~calendarId:"primary"
           ~eventId:entry.Event.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:entry.Event.id
                   session);
         assert_equal
           "Updated description"
           entry.Event.description;
         assert_equal
           "calendar#event"
           entry.Event.kind)

let test_delete_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let _ = TestHelper.delay () in
       let (events, session) =
         EventsResource.list
           ~calendarId:"primary"
           ~timeMin:(GapiDate.of_string "2011-12-19T00:00:00Z")
           session in
       let ((), session) =
         EventsResource.delete
           ~calendarId:"primary"
           ~eventId:entry.Event.id
           session in
       let (events', _) =
         EventsResource.list
           ~calendarId:"primary"
           ~timeMin:(GapiDate.of_string "2011-12-19T00:00:00Z")
           session
       in
         TestHelper.assert_exists
           "events list should contain new event"
           (fun e ->
              e.Event.id = entry.Event.id)
           events.Events.items;
         TestHelper.assert_not_exists
           "events' list should not contain new calendar"
           (fun e ->
              e.Event.id = entry.Event.id)
           events'.Events.items)

let test_quick_add_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         EventsResource.quickAdd
           ~calendarId:"primary"
           ~text:"Appointment at Somewhere on June 3rd 10am-10:25am"
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:event.Event.id
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.Event.id)

let test_import_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let event = new_event
         |> Event.iCalUID ^=
           GapiDate.to_string (GapiDate.now ()) ^ "imported_event" in
       let (event, session) =
         EventsResource.import
           ~calendarId:"primary"
           event
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:event.Event.id
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.Event.id)

let test_move_event () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let (calendar, session) =
         CalendarsResource.insert
           new_calendar
           session in
       let _ = TestHelper.delay () in
       let (event, session) =
         EventsResource.move
           ~calendarId:"primary"
           ~eventId:event.Event.id
           ~destination:calendar.Calendar.id
           session in
       let _ = TestHelper.delay () in
         ignore (EventsResource.delete
                   ~calendarId:calendar.Calendar.id
                   ~eventId:event.Event.id
                   session);
         ignore (CalendarsResource.delete
                   ~calendarId:calendar.Calendar.id
                   session);
         TestHelper.assert_not_empty
           "New event id should not be empty"
           event.Event.id)

let test_recurring_event_instances () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (event, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_recurring_event
           session in
       let _ = TestHelper.delay () in
       let (events, session) =
         EventsResource.instances
           ~calendarId:"primary"
           ~eventId:event.Event.id
           session
       in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:event.Event.id
                   session);
         assert_equal
           "calendar#events"
           events.Events.kind;
         assert_equal
           3
           (List.length events.Events.items))

(* Calendar List *)

let australian_calendar_id =
  "en.australian#holiday@group.v.calendar.google.com"

let australian_calendar =
  { CalendarListEntry.empty with
        CalendarListEntry.id = australian_calendar_id
  }

let test_list_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendars, session) =
         CalendarListResource.list
           session
       in
         assert_equal
           "calendar#calendarList"
           calendars.CalendarList.kind;
         assert_bool
           "There should be at least 1 calendar"
           (List.length calendars.CalendarList.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_list_calendar_list_with_max_results () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let std_params = {
         GapiService.StandardParameters.default with
             GapiService.StandardParameters.prettyPrint = false
       } in
       let (calendars, session) =
         CalendarListResource.list
           ~std_params
           ~maxResults:1
           session
       in
         assert_equal
           1
           (List.length calendars.CalendarList.items))

let test_insert_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         CalendarListResource.insert
           australian_calendar
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarListResource.delete
                   ~calendarId:new_entry.CalendarListEntry.id
                   session);
         assert_equal
           australian_calendar_id
           new_entry.CalendarListEntry.id)

let test_get_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarListResource.insert
           australian_calendar
           session in
       let (entry, session) =
         CalendarListResource.get
           ~calendarId:australian_calendar_id
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarListResource.delete
                   ~calendarId:entry.CalendarListEntry.id
                   session);
         assert_equal
           australian_calendar_id
           entry.CalendarListEntry.id)

let test_update_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarListResource.insert
           australian_calendar
           session in
       let entry = { entry with
                         CalendarListEntry.hidden = true } in
       let (entry, session) =
         CalendarListResource.update
           ~calendarId:entry.CalendarListEntry.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarListResource.delete
                   ~calendarId:entry.CalendarListEntry.id
                   session);
         assert_equal
           true
           entry.CalendarListEntry.hidden)

let test_patch_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarListResource.insert
           australian_calendar
           session in
       let entry = {
         CalendarListEntry.empty with
             CalendarListEntry.id = australian_calendar_id;
             hidden = true
       } in
       let (entry, session) =
         CalendarListResource.patch
           ~calendarId:entry.CalendarListEntry.id
           entry
           session in
       let _ = TestHelper.delay () in
         ignore (CalendarListResource.delete
                   ~calendarId:entry.CalendarListEntry.id
                   session);
         assert_equal
           true
           entry.CalendarListEntry.hidden;
         assert_equal
           "calendar#calendarListEntry"
           entry.CalendarListEntry.kind)

let test_delete_calendar_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         CalendarListResource.insert
           australian_calendar
           session in
       let (calendars, session) =
         CalendarListResource.list
           session in
       let _ = TestHelper.delay () in
       let ((), session) =
         CalendarListResource.delete
           ~calendarId:entry.CalendarListEntry.id
           session in
       let (calendars', _) =
         CalendarListResource.list
           session
       in
         TestHelper.assert_exists
           "calendars should contain new calendar"
           (fun e ->
              e.CalendarListEntry.id = australian_calendar_id)
           calendars.CalendarList.items;
         TestHelper.assert_not_exists
           "calendars' should not contain new calendar"
           (fun e ->
              e.CalendarListEntry.id = australian_calendar_id)
           calendars'.CalendarList.items)

(* Free/busy *)

let test_free_busy_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar, session) =
         CalendarsResource.get
           ~calendarId:"primary"
           session in
       let (event, session) =
         EventsResource.insert
           ~calendarId:"primary"
           new_event
           session in
       let _ = TestHelper.delay () in
       let params =
         { FreeBusyRequest.empty with
               FreeBusyRequest.timeMin =
                 GapiDate.of_string "2011-12-02";
               timeMax = GapiDate.of_string "2011-12-04";
               items = [{ FreeBusyRequestItem.id = calendar.Calendar.id }]
         } in
       let (freeBusy, _) =
         FreebusyResource.query
           params
           session
       in
         ignore (EventsResource.delete
                   ~calendarId:"primary"
                   ~eventId:event.Event.id
                   session);
         assert_equal
           "calendar#freeBusy"
           freeBusy.FreeBusyResponse.kind;
         assert_bool
           "There should be at least 1 calendar in free/busy resource"
           (List.length freeBusy.FreeBusyResponse.calendars >= 1))

let suite = "Calendar services (v3) test" >:::
  ["test_list_acl" >:: test_list_acl;
   "test_insert_acl" >:: test_insert_acl;
   "test_get_acl" >:: test_get_acl;
   "test_update_acl" >:: test_update_acl;
   "test_delete_acl" >:: test_delete_acl;
   "test_get_colors" >:: test_get_colors;
   "test_settings_list" >:: test_settings_list;
   "test_settings_get" >:: test_settings_get;
   "test_get_calendar" >:: test_get_calendar;
   "test_get_calendar_partial_response" >:: test_get_calendar_partial_response;
   "test_insert_calendar" >:: test_insert_calendar;
   "test_update_calendar" >:: test_update_calendar;
   "test_patch_calendar" >:: test_patch_calendar;
   "test_delete_calendar" >:: test_delete_calendar;
   (*"test_clear_primary_calendar" >:: test_clear_primary_calendar;
    * -- commented out to prevent primary calendar reset *)
   "test_event_list" >:: test_event_list;
   "test_insert_event" >:: test_insert_event;
   "test_get_event" >:: test_get_event;
   "test_update_event" >:: test_update_event;
   "test_patch_event" >:: test_patch_event;
   "test_delete_event" >:: test_delete_event;
   "test_quick_add_event" >:: test_quick_add_event;
   "test_import_event" >:: test_import_event;
   "test_move_event" >:: test_move_event;
   "test_recurring_event_instances" >:: test_recurring_event_instances;
   "test_list_calendar_list" >:: test_list_calendar_list;
   "test_list_calendar_list_with_max_results"
     >:: test_list_calendar_list_with_max_results;
   "test_get_calendar_list" >:: test_get_calendar_list;
   "test_insert_calendar_list" >:: test_insert_calendar_list;
   "test_update_calendar_list" >:: test_update_calendar_list;
   "test_patch_calendar_list" >:: test_patch_calendar_list;
   "test_delete_calendar_list" >:: test_delete_calendar_list;
   "test_free_busy_query" >:: test_free_busy_query]

