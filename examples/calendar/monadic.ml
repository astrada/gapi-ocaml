(* Calendar service samples (http://code.google.com/apis/calendar/v3/using.html)
 * using state monad and functional lenses *)

(*** Setup ***)

open GapiUtils.Infix
open GapiLens.Infix
open GapiLens.StateInfix
open GapiMonad.SessionM
open GapiCalendarV3Model
open GapiCalendarV3Service

(*** How to configure your client and authenticate using OAuth 2.0 for native
   * applications. ***)

let application_name = "YOUR_APPLICATION_NAME"

(* The clientId and clientSecret are copied from the API Access tab on
 * the Google APIs Console *)
let client_id = "YOUR_CLIENT_ID"
let client_secret = "YOUR_CLIENT_SECRET"

let configuration = GapiConfig.default
    |> GapiConfig.application_name ^= application_name
    |> GapiConfig.auth ^= GapiConfig.OAuth2
                            { GapiConfig.client_id;
                              client_secret }

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

let batch =
  perform

    (* Step 2: Exchange --> *)
    response <-- GapiOAuth2.get_access_token
                   ~client_id
                   ~client_secret
                   ~code
                   ~redirect_uri;

    let (access_token, refresh_token) =
      match response with
          GapiAuthResponse.OAuth2AccessToken token ->
            (token.GapiAuthResponse.OAuth2.access_token,
             token.GapiAuthResponse.OAuth2.refresh_token)
        | _ -> failwith "Not supported OAuth2 response" in
    (* End of Step 2 <-- *)

    (* Update session with OAuth2 tokens *)
    GapiConversation.Session.auth ^=!
      GapiConversation.Session.OAuth2 {
        GapiConversation.Session.oauth2_token = access_token;
        refresh_token
      };

    (*** Working with events ***)

    (* Retrieving events *)
    let rec get_events next_page_token =
       perform
         events <-- EventsResource.list
                      ~pageToken:next_page_token
                      ~calendarId:"primary";

       let () =
         List.iter
           (fun event ->
              print_endline event.Event.summary)
           events.Events.items in

       if events.Events.nextPageToken <> "" then
         get_events events.Events.nextPageToken
       else
         return ()
    in
      get_events "";

       (* Retrieving a single event *)
    event <-- EventsResource.get
                ~calendarId:"primary"
                ~eventId:"eventId";

    let () = print_endline event.Event.summary in

    (* Creating events *)
    let start_date = Unix.time () in
    let end_date = start_date +. 3600.0 in
    let event = {
      Event.empty with
          Event.summary = "Appointment";
          location = "Somewhere";
          attendees = [EventAttendee.empty |>
                         EventAttendee.email ^= "attendeeEmail" ];
          start = EventDateTime.empty |>
                    EventDateTime.dateTime ^= Netdate.create start_date;
          _end = EventDateTime.empty |>
                   EventDateTime.dateTime ^= Netdate.create end_date;
    } in

    created_event <-- EventsResource.insert
                        ~calendarId:"primary"
                        event;

    let () = print_endline created_event.Event.id in

    (* Creating events with QuickAdd *)
    created_event <-- EventsResource.quickAdd
                        ~calendarId:"primary"
                        ~text:"Appointment at Somewhere on June 3rd 10am-10:25am";

    let () = print_endline created_event.Event.id in

    (* Importing events *)
    let start_date = Unix.time () in
    let end_date = start_date +. 3600.0 in
    let event = {
      Event.empty with
          Event.organizer = { Event.OrganizerData.email =
                                "organizerEmail";
                              Event.OrganizerData.displayName =
                                "organizerDisplayName"; };
          attendees = [EventAttendee.empty |>
                         EventAttendee.email ^= "attendeeEmail" ];
          iCalUID = "originalUID";
          start = EventDateTime.empty |>
                    EventDateTime.dateTime ^= Netdate.create start_date;
          _end = EventDateTime.empty |>
                   EventDateTime.dateTime ^= Netdate.create end_date;
    } in

    imported_event <-- EventsResource.import
                         ~calendarId:"primary"
                         event;

    let () = print_endline imported_event.Event.id in

    (* Updating events *)

    (* First retrieve the events from the API. *)
    event <-- EventsResource.get
                ~calendarId:"primary"
                ~eventId:"eventId";

    let event = event |> Event.summary ^= "Appointment at Somewhere" in

    updated_event <-- EventsResource.update
                        ~calendarId:"primary"
                        ~eventId:event.Event.id
                        event;

    let () = print_endline (GapiDate.to_string updated_event.Event.updated) in

    (* Changing an event's organizer *)
    updated_event <-- EventsResource.move
                        ~calendarId:"primary"
                        ~eventId:"eventId"
                        ~destination:"destinationCalendarId";

    let () = print_endline (GapiDate.to_string updated_event.Event.updated) in

    (* Deleting events *)
    EventsResource.delete
      ~calendarId:"primary"
      ~eventId:"eventId";

    (* Recurring events operations *)
    events <-- EventsResource.instances
                 ~calendarId:"primary"
                 ~eventId:"eventId";

    let () = List.iter
               (fun event -> print_endline event.Event.summary)
               events.Events.items in

    (* Creating exceptions to recurring events *)

    (* First retrieve the instances from the API. *)
    instances <-- EventsResource.instances
                    ~calendarId:"primary"
                    ~eventId:"recurringEventId";

    (* Select the instance to cancel. *)
    let instance = instances.Events.items
      |. GapiLens.head
      |> Event.status ^= "canceled" in

    updated_instance <-- EventsResource.update
                           ~calendarId:"primary"
                           ~eventId:instance.Event.id
                           event;

    (* Print the updated date. *)
    let () =
      print_endline (GapiDate.to_string updated_instance.Event.updated) in

    (* Working with calendars *)

    (* Retrieving metadata for a calendar *)
    calendar <-- CalendarsResource.get
                   ~calendarId:"primary";

    let () = print_endline calendar.Calendar.summary in

    (* Creating calendars *)
    let calendar = { Calendar.empty with
                         Calendar.summary = "calendarSummary";
                         timeZone = "America/Los_Angeles"; } in

    created_calendar <-- CalendarsResource.insert
                           calendar;

    let () = print_endline created_calendar.Calendar.id in

    (* Updating metadata for a calendar *)

    (* First retrieve the calendar from the API. *)
    calendar <-- CalendarsResource.get
                   ~calendarId:"primary";

    let calendar = calendar |> Calendar.summary ^= "New Summary" in

    updated_calendar <-- CalendarsResource.update
                           ~calendarId:calendar.Calendar.id
                           calendar;

    let () = print_endline updated_calendar.Calendar.etag in

    (* Clearing all events from a primary calendar *)
    CalendarsResource.clear
      ~calendarId:"primary";

    (* Deleting a secondary calendar *)
    CalendarsResource.delete
      ~calendarId:"secondaryCalendarId";

    (* Working with calendar lists *)

    (* Retrieving calendars in a user's calendar list *)
      let rec get_calendar_list next_page_token =
        perform
          calendar_list <-- CalendarListResource.list;

          let () =
            List.iter
              (fun calendar ->
                 print_endline calendar.CalendarListEntry.summary)
              calendar_list.CalendarList.items in

          if calendar_list.CalendarList.nextPageToken <> "" then
            get_calendar_list
              calendar_list.CalendarList.nextPageToken
          else
            return ()
      in
        get_calendar_list "";

    (* Retrieving a single calendar list entry *)
    calendar_list_entry <-- CalendarListResource.get
                              ~calendarId:"calendarId";

    let () = print_endline calendar_list_entry.CalendarListEntry.summary in

    (* Adding calendars to a user's calendar list *)
    let calendar_list_entry = CalendarListEntry.empty |>
                                CalendarListEntry.id ^= "calendarId" in

    created_calendar_list_entry <-- CalendarListResource.insert
                                      calendar_list_entry;

    let () =
      print_endline created_calendar_list_entry.CalendarListEntry.summary in

    (* Updating a calendar list entry *)

    (* First retrieve the calendarListEntry from the API. *)
    calendar_list_entry <-- CalendarListResource.get
                              ~calendarId:"calendarId";

    let calendar_list_entry = calendar_list_entry |>
                                CalendarListEntry.colorId ^= "newColorId" in

    updated_calendar_list_entry <-- CalendarListResource.update
                                      ~calendarId:calendar_list_entry.CalendarListEntry.id
                                      calendar_list_entry;

    let () =
      print_endline updated_calendar_list_entry.CalendarListEntry.etag in

    (* Removing a calendar from a user's calendar list *)
    CalendarListResource.delete
      ~calendarId:"calendarId";

    (* Working with colors *)
    colors <-- ColorsResource.get;

    let () =
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
        colors.Colors.event in

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

    busy_times <-- FreebusyResource.query
                     free_busy_request;

    let () =
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
        busy_times.FreeBusyResponse.calendars in

    (* Working with settings *)

    (* Retrieving settings *)
    settings <-- SettingsResource.list;

    let () =
      List.iter
        (fun ({ Setting.id; value; _ }) ->
           Printf.printf "%s: %s\n" id value;
        )
        settings.Settings.items in

    (* Retrieving a single setting *)
    setting <-- SettingsResource.get
                  ~setting:"settingId";

    let () =
      Printf.printf "%s: %s\n" setting.Setting.id setting.Setting.value in

    (* Working with access control lists *)

    (* Retrieving an access control list *)
    acl <-- AclResource.list
              ~calendarId:"primary";

    let () =
      List.iter
        (fun { AclRule.id; role; _ } ->
           Printf.printf "%s: %s\n" id role;
        )
        acl.Acl.items in

    (* Retrieving a single access rule *)
    rule <-- AclResource.get
               ~calendarId:"primary"
               ~ruleId:"ruleId";

    let () = Printf.printf "%s: %s\n" rule.AclRule.id rule.AclRule.role in

    (* Creating access rules *)
    let rule = {
      AclRule.empty with
          AclRule.scope = {
            AclRule.ScopeData._type = "scopeType";
            value = "scopeValue";
          };
          role = "role"
    } in

    created_rule <-- AclResource.insert
                       ~calendarId:"primary"
                       rule;

    let () = print_endline created_rule.AclRule.id in

    (* Updating access rules *)

    (* First retrieve the access rule from the API. *)
    rule <-- AclResource.get
               ~calendarId:"primary"
               ~ruleId:"ruleId";

    let rule = rule |> AclRule.role ^= "newRole" in

    updated_rule <-- AclResource.update
                       ~calendarId:"primary"
                       ~ruleId:rule.AclRule.id
                       rule;

    let () = print_endline updated_rule.AclRule.etag in

    (* Removing access rules *)
    AclResource.delete
      ~calendarId:"primary"
      ~ruleId:"ruleId";

    (* ... *)

    return ()

(* Start a new session *)
let _ =
  GapiConversation.with_curl configuration batch

