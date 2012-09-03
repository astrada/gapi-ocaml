(* Calendar service samples (http://code.google.com/apis/calendar/v3/using.html) *)

(*** Setup ***)

open GapiUtils.Infix
open GapiCalendarV3Model
open GapiCalendarV3Service

(*** How to configure your client and authenticate using OAuth 2.0 for native
   * applications. ***)

let application_name = "YOUR_APPLICATION_NAME"

(* The clientId and clientSecret are copied from the API Access tab on
 * the Google APIs Console *)
let client_id = "YOUR_CLIENT_ID"
let client_secret = "YOUR_CLIENT_SECRET"

let configuration =
  { GapiConfig.default with
        GapiConfig.application_name = application_name;
        GapiConfig.auth = GapiConfig.OAuth2
                            { GapiConfig.client_id;
                              client_secret } }

(* Or your redirect URL for web based applications. *)
let redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
let scope = [GapiCalendarV3Service.scope]

(* Step 1: Authorize --> *)
let authorization_url =
  GapiOAuth2.authorization_code_url
    ~redirect_uri
    ~scope
    ~response_type:"code"
    client_id

(* Point or redirect your user to the authorization_url. *)
let () = print_endline "Go to the following link in your browser:";
         print_endline authorization_url

(* Read the authorization code from the standard input stream. *)
let () = print_endline "What is the authorization code?"
let code = input_line stdin
(* End of Step 1 <-- *)

(* Start a new session *)
let () =
  GapiConversation.with_curl
    configuration
    (fun session ->
       (* Step 2: Exchange --> *)
       let (response, session) =
         GapiOAuth2.get_access_token
           ~client_id
           ~client_secret
           ~code
           ~redirect_uri
           session in

       let (access_token, refresh_token) =
         match response with
             GapiAuthResponse.OAuth2AccessToken token ->
               (token.GapiAuthResponse.OAuth2.access_token,
                token.GapiAuthResponse.OAuth2.refresh_token)
           | _ -> failwith "Not supported OAuth2 response" in
       (* End of Step 2 <-- *)

       (* Update session with OAuth2 tokens *)
       let session = {
         session with
             GapiConversation.Session.auth =
               GapiConversation.Session.OAuth2 {
                 GapiConversation.Session.oauth2_token = access_token;
                 refresh_token
               }
       } in

       (*** Working with events ***)

       (* Retrieving events *)
       let session =
         let rec get_events next_page_token session =
           let (events, session') =
             EventsResource.list
               ~pageToken:next_page_token
               ~calendarId:"primary"
               session in

             List.iter
               (fun event ->
                  print_endline event.Event.summary)
               events.Events.items;

             if events.Events.nextPageToken <> "" then
               get_events events.Events.nextPageToken session'
             else
               session'
         in
           get_events "" session in

       (* Retrieving a single event *)
       let (event, session) =
         EventsResource.get
           ~calendarId:"primary"
           ~eventId:"eventId"
           session in

       print_endline event.Event.summary;

       (* Creating events *)
       let start_date = Unix.time () in
       let end_date = start_date +. 3600.0 in
       let event = {
         Event.empty with
             Event.summary = "Appointment";
             Event.location = "Somewhere";
             Event.attendees = [{ EventAttendee.empty with
                                      EventAttendee.email = "attendeeEmail" }];
             Event.start = { EventDateTime.empty with
                                 EventDateTime.dateTime =
                                   Netdate.create start_date };
             Event._end = { EventDateTime.empty with
                                EventDateTime.dateTime =
                                  Netdate.create end_date };
       } in

       let (created_event, session) =
         EventsResource.insert
           ~calendarId:"primary"
           event
           session in

       print_endline created_event.Event.id;

       (* Creating events with QuickAdd *)
       let (created_event, session) =
         EventsResource.quickAdd
           ~calendarId:"primary"
           ~text:"Appointment at Somewhere on June 3rd 10am-10:25am"
           session in

       print_endline created_event.Event.id;

       (* Importing events *)
       let start_date = Unix.time () in
       let end_date = start_date +. 3600.0 in
       let event = {
         Event.empty with
             Event.organizer = { Event.OrganizerData.email =
                                   "organizerEmail";
                                 Event.OrganizerData.displayName =
                                   "organizerDisplayName"; };
             Event.attendees = [{ EventAttendee.empty with
                                      EventAttendee.email = "attendeeEmail" }];
             Event.iCalUID = "originalUID";
             Event.start = { EventDateTime.empty with
                                 EventDateTime.dateTime =
                                   Netdate.create start_date };
             Event._end = { EventDateTime.empty with
                                EventDateTime.dateTime =
                                  Netdate.create end_date };
       } in

       let (imported_event, session) =
         EventsResource.import
           ~calendarId:"primary"
           event
           session in

       print_endline imported_event.Event.id;

       (* Updating events *)

       (* First retrieve the events from the API. *)
       let (event, session) =
         EventsResource.get
           ~calendarId:"primary"
           ~eventId:"eventId"
           session in

       let event = {
         event with
             Event.summary = "Appointment at Somewhere";
       } in

       let (updated_event, session) =
         EventsResource.update
           ~calendarId:"primary"
           ~eventId:event.Event.id
           event
           session in

       print_endline (GapiDate.to_string updated_event.Event.updated);

       (* Changing an event's organizer *)
       let (updated_event, session) =
         EventsResource.move
           ~calendarId:"primary"
           ~eventId:"eventId"
           ~destination:"destinationCalendarId"
           session in

       print_endline (GapiDate.to_string updated_event.Event.updated);

       (* Deleting events *)
       let ((), session) =
         EventsResource.delete
           ~calendarId:"primary"
           ~eventId:"eventId"
           session in

       (* Recurring events operations *)
       let (events, session) =
         EventsResource.instances
           ~calendarId:"primary"
           ~eventId:"eventId"
           session in

         List.iter
           (fun event ->
              print_endline event.Event.summary)
           events.Events.items;

       (* Creating exceptions to recurring events *)

       (* First retrieve the instances from the API. *)
       let (instances, session) =
         EventsResource.instances
           ~calendarId:"primary"
           ~eventId:"recurringEventId"
           session in

       (* Select the instance to cancel. *)
       let instance = List.hd instances.Events.items in
       let instance = { instance with Event.status = "canceled" } in

       let (updated_instance, session) =
         EventsResource.update
           ~calendarId:"primary"
           ~eventId:instance.Event.id
           event
           session in

       (* Print the updated date. *)
       print_endline (GapiDate.to_string updated_instance.Event.updated);

       (* Working with calendars *)

       (* Retrieving metadata for a calendar *)
       let (calendar, session) =
         CalendarsResource.get
           ~calendarId:"primary"
           session in

       print_endline calendar.Calendar.summary;

       (* Creating calendars *)
       let calendar = { Calendar.empty with
                            Calendar.summary = "calendarSummary";
                            Calendar.timeZone = "America/Los_Angeles"; } in

       let (created_calendar, session) =
         CalendarsResource.insert
           calendar
           session in

       print_endline created_calendar.Calendar.id;

       (* Updating metadata for a calendar *)

       (* First retrieve the calendar from the API. *)
       let (calendar, session) =
         CalendarsResource.get
           ~calendarId:"primary"
           session in

       let calendar = { calendar with Calendar.summary = "New Summary" } in

       let (updated_calendar, session) =
         CalendarsResource.update
           ~calendarId:calendar.Calendar.id
           calendar
           session in

       print_endline updated_calendar.Calendar.etag;

       (* Clearing all events from a primary calendar *)
       let ((), session) =
         CalendarsResource.clear
           ~calendarId:"primary"
           session in

       (* Deleting a secondary calendar *)
       let ((), session) =
         CalendarsResource.delete
           ~calendarId:"secondaryCalendarId"
           session in

       (* Working with calendar lists *)

       (* Retrieving calendars in a user's calendar list *)
       let session =
         let rec get_calendar_list next_page_token session =
           let (calendar_list, session') =
             CalendarListResource.list
               session in

             List.iter
               (fun calendar ->
                  print_endline calendar.CalendarListEntry.summary)
               calendar_list.CalendarList.items;

             if calendar_list.CalendarList.nextPageToken <> "" then
               get_calendar_list
                 calendar_list.CalendarList.nextPageToken session'
             else
               session'
         in
           get_calendar_list "" session in

       (* Retrieving a single calendar list entry *)
       let (calendar_list_entry, session) =
         CalendarListResource.get
           ~calendarId:"calendarId"
           session in

       print_endline calendar_list_entry.CalendarListEntry.summary;

       (* Adding calendars to a user's calendar list *)
       let calendar_list_entry = { CalendarListEntry.empty with
                                       CalendarListEntry.id = "calendarId" } in

       let (created_calendar_list_entry, session) =
         CalendarListResource.insert
           calendar_list_entry
           session in

       print_endline created_calendar_list_entry.CalendarListEntry.summary;

       (* Updating a calendar list entry *)

       (* First retrieve the calendarListEntry from the API. *)
       let (calendar_list_entry, session) =
         CalendarListResource.get
           ~calendarId:"calendarId"
           session in

       let calendar_list_entry = { calendar_list_entry with
                                       CalendarListEntry.colorId =
                                         "newColorId" } in

       let (updated_calendar_list_entry, session) =
         CalendarListResource.update
           ~calendarId:calendar_list_entry.CalendarListEntry.id
           calendar_list_entry
           session in

       print_endline updated_calendar_list_entry.CalendarListEntry.etag;

       (* Removing a calendar from a user's calendar list *)
       let ((), session) =
         CalendarListResource.delete
           ~calendarId:"calendarId"
           session in

       (* Working with colors *)
       let (colors, session) =
         ColorsResource.get
           session in

       (* Print available calendarListEntry colors. *)
       List.iter
         (fun (key, { ColorDefinition.background; foreground }) ->
            Printf.printf "ColorId : %s\n" key;
            Printf.printf "  Background : %s\n" background;
            Printf.printf "  Foreground : %s\n" foreground;
         )
         colors.Colors.calendar;

       (* Print available event colors. *)
       List.iter
         (fun (key, { ColorDefinition.background; foreground }) ->
            Printf.printf "ColorId : %s\n" key;
            Printf.printf "  Background : %s\n" background;
            Printf.printf "  Foreground : %s\n" foreground;
         )
         colors.Colors.event;

       (* Working with free/busy times *)

       (* Retrieving free/busy times *)
       let free_busy_request =
         { FreeBusyRequest.empty with
               FreeBusyRequest.timeMin =
                 GapiDate.of_string "2011-01-01T00:00:00Z";
               timeMax =
                 GapiDate.of_string "2011-01-08T00:00:00Z";
               items = [
                 { FreeBusyRequestItem.id = "user1@domain.com" };
                 { FreeBusyRequestItem.id = "group@domain.com" };
               ]
         } in

       let (busy_times, session) =
         FreebusyResource.query
           free_busy_request
           session in

       (* Print groups expansion. *)
       List.iter
         (fun (key, { FreeBusyGroup.calendars; _ }) ->
            Printf.printf "Group: %s\n" key;
            List.iter
              (fun calendar ->
                 Printf.printf "  Calendar ID: %s\n" calendar;
              )
              calendars
         )
         busy_times.FreeBusyResponse.groups;

       (* Print busy times. *)
       List.iter
         (fun (key, { FreeBusyCalendar.busy; _ }) ->
            Printf.printf "Calendar: %s\n" key;
            List.iter
              (fun { TimePeriod.start; TimePeriod._end } ->
                 Printf.printf "  Busy from %s to %s\n"
                   (GapiDate.to_string start)
                   (GapiDate.to_string _end);
              )
              busy
         )
         busy_times.FreeBusyResponse.calendars;

       (* Working with settings *)

       (* Retrieving settings *)
       let (settings, session) =
         SettingsResource.list
           session in

       List.iter
         (fun ({ Setting.id; value; _ }) ->
            Printf.printf "%s: %s\n" id value;
         )
         settings.Settings.items;

       (* Retrieving a single setting *)
       let (setting, session) =
         SettingsResource.get
           ~setting:"settingId"
           session in

       Printf.printf "%s: %s\n" setting.Setting.id setting.Setting.value;

       (* Working with access control lists *)

       (* Retrieving an access control list *)
       let (acl, session) =
         AclResource.list
           ~calendarId:"primary"
           session in

       List.iter
         (fun { AclRule.id; role; _ } ->
            Printf.printf "%s: %s\n" id role;
         )
         acl.Acl.items;

       (* Retrieving a single access rule *)
       let (rule, session) =
         AclResource.get
           ~calendarId:"primary"
           ~ruleId:"ruleId"
           session in

       Printf.printf "%s: %s\n" rule.AclRule.id rule.AclRule.role;

       (* Creating access rules *)
       let rule = {
         AclRule.empty with
             AclRule.scope = {
               AclRule.ScopeData._type = "scopeType";
               value = "scopeValue";
             };
             role = "role"
       } in

       let (created_rule, session) =
         AclResource.insert
           ~calendarId:"primary"
           rule
           session in

       print_endline created_rule.AclRule.id;

       (* Updating access rules *)

       (* First retrieve the access rule from the API. *)
       let (rule, session) =
         AclResource.get
           ~calendarId:"primary"
           ~ruleId:"ruleId"
           session in

       let rule = { rule with AclRule.role = "newRole" } in

       let (updated_rule, session) =
         AclResource.update
           ~calendarId:"primary"
           ~ruleId:rule.AclRule.id
           rule
           session in

       print_endline updated_rule.AclRule.etag;

       (* Removing access rules *)
       let ((), _) =
         AclResource.delete
           ~calendarId:"primary"
           ~ruleId:"ruleId"
           session in

       (* ... *)

       ()
    )

