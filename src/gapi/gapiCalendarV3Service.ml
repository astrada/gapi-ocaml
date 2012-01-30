(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiCalendarV3Model

let scope = "https://www.googleapis.com/auth/calendar"

let scope_readonly = "https://www.googleapis.com/auth/calendar.readonly"

module AclResource =
struct
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        ~ruleId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        ~ruleId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        aclRule
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"] base_url in
    let etag = GapiUtils.etag_option aclRule.AclRule.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json AclRule.to_data_model)
      ~data:aclRule full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Acl.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        ~ruleId
        aclRule
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let etag = GapiUtils.etag_option aclRule.AclRule.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json AclRule.to_data_model)
      ~data:aclRule full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        ~ruleId
        aclRule
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let etag = GapiUtils.etag_option aclRule.AclRule.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json AclRule.to_data_model)
      ~data:aclRule full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  
end

module CalendarListResource =
struct
  module MinAccessRole =
  struct
    type t =
      | Default
      | FreeBusyReader
      | Owner
      | Reader
      | Writer
      
    let to_string = function
      | Default -> ""
      | FreeBusyReader -> "freeBusyReader"
      | Owner -> "owner"
      | Reader -> "reader"
      | Writer -> "writer"
      
    let of_string = function
      | "" -> Default
      | "freeBusyReader" -> FreeBusyReader
      | "owner" -> Owner
      | "reader" -> Reader
      | "writer" -> Writer
      | s -> failwith ("Unexpected value for MinAccessRole:" ^ s)
  
  end
  
  module CalendarListParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* calendarList-specific query parameters *)
      maxResults : int;
      minAccessRole : MinAccessRole.t;
      pageToken : string;
      showHidden : bool;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      minAccessRole = MinAccessRole.Default;
      pageToken = "";
      showHidden = false;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.minAccessRole) MinAccessRole.to_string "minAccessRole";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.showHidden) string_of_bool "showHidden";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(minAccessRole = default.minAccessRole)
        ?(pageToken = default.pageToken)
        ?(showHidden = default.showHidden)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        minAccessRole;
        pageToken;
        showHidden;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      CalendarListParameters.to_key_value_list params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      CalendarListParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        calendarListEntry
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList"]
      base_url in
    let etag = GapiUtils.etag_option calendarListEntry.CalendarListEntry.etag
      in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      CalendarListParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json CalendarListEntry.to_data_model)
      ~data:calendarListEntry full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?maxResults
        ?minAccessRole
        ?pageToken
        ?showHidden
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList"]
      base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?minAccessRole ?pageToken
      ?showHidden () in
    let query_parameters = Option.map
      CalendarListParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CalendarList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        calendarListEntry
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendarListEntry.CalendarListEntry.etag
      in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      CalendarListParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json CalendarListEntry.to_data_model)
      ~data:calendarListEntry full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        calendarListEntry
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendarListEntry.CalendarListEntry.etag
      in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      CalendarListParameters.to_key_value_list params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json CalendarListEntry.to_data_model)
      ~data:calendarListEntry full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  
end

module CalendarsResource =
struct
  let clear
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "clear"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ~data:() full_url
      GapiRequest.parse_empty_response session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        calendar
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars"] base_url in
    let etag = GapiUtils.etag_option calendar.Calendar.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Calendar.to_data_model)
      ~data:calendar full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        calendar
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendar.Calendar.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Calendar.to_data_model)
      ~data:calendar full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        calendar
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendar.Calendar.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Calendar.to_data_model)
      ~data:calendar full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  
end

module ColorsResource =
struct
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        session =
    let full_url = GapiUtils.add_path_to_url ["colors"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Colors.of_data_model) session 
    
  
end

module EventsResource =
struct
  module OrderBy =
  struct
    type t =
      | Default
      | StartTime
      | Updated
      
    let to_string = function
      | Default -> ""
      | StartTime -> "startTime"
      | Updated -> "updated"
      
    let of_string = function
      | "" -> Default
      | "startTime" -> StartTime
      | "updated" -> Updated
      | s -> failwith ("Unexpected value for OrderBy:" ^ s)
  
  end
  
  module EventsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* events-specific query parameters *)
      destination : string;
      iCalUID : string;
      maxAttendees : int;
      maxResults : int;
      orderBy : OrderBy.t;
      originalStart : string;
      pageToken : string;
      q : string;
      sendNotifications : bool;
      showDeleted : bool;
      showHiddenInvitations : bool;
      singleEvents : bool;
      text : string;
      timeMax : string;
      timeMin : string;
      timeZone : string;
      updatedMin : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      destination = "";
      iCalUID = "";
      maxAttendees = 0;
      maxResults = 0;
      orderBy = OrderBy.Default;
      originalStart = "";
      pageToken = "";
      q = "";
      sendNotifications = false;
      showDeleted = false;
      showHiddenInvitations = false;
      singleEvents = false;
      text = "";
      timeMax = "";
      timeMin = "";
      timeZone = "";
      updatedMin = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.destination) (fun x -> x) "destination";
      param (fun p -> p.iCalUID) (fun x -> x) "iCalUID";
      param (fun p -> p.maxAttendees) string_of_int "maxAttendees";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.orderBy) OrderBy.to_string "orderBy";
      param (fun p -> p.originalStart) (fun x -> x) "originalStart";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.sendNotifications) string_of_bool "sendNotifications";
      param (fun p -> p.showDeleted) string_of_bool "showDeleted";
      param (fun p -> p.showHiddenInvitations) string_of_bool "showHiddenInvitations";
      param (fun p -> p.singleEvents) string_of_bool "singleEvents";
      param (fun p -> p.text) (fun x -> x) "text";
      param (fun p -> p.timeMax) (fun x -> x) "timeMax";
      param (fun p -> p.timeMin) (fun x -> x) "timeMin";
      param (fun p -> p.timeZone) (fun x -> x) "timeZone";
      param (fun p -> p.updatedMin) (fun x -> x) "updatedMin";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(destination = default.destination)
        ?(iCalUID = default.iCalUID)
        ?(maxAttendees = default.maxAttendees)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(originalStart = default.originalStart)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        ?(sendNotifications = default.sendNotifications)
        ?(showDeleted = default.showDeleted)
        ?(showHiddenInvitations = default.showHiddenInvitations)
        ?(singleEvents = default.singleEvents)
        ?(text = default.text)
        ?(timeMax = default.timeMax)
        ?(timeMin = default.timeMin)
        ?(timeZone = default.timeZone)
        ?(updatedMin = default.updatedMin)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        destination;
        iCalUID;
        maxAttendees;
        maxResults;
        orderBy;
        originalStart;
        pageToken;
        q;
        sendNotifications;
        showDeleted;
        showHiddenInvitations;
        singleEvents;
        text;
        timeMax;
        timeMin;
        timeZone;
        updatedMin;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?maxAttendees
        ?timeZone
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?maxAttendees ?timeZone () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Event.of_data_model) session 
    
  let import
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~calendarId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; "import"] base_url in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"] base_url in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let instances
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?maxAttendees
        ?maxResults
        ?originalStart
        ?pageToken
        ?showDeleted
        ?timeZone
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId);
      "instances"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?maxAttendees ?maxResults
      ?originalStart ?pageToken ?showDeleted ?timeZone () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Events.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?iCalUID
        ?maxAttendees
        ?maxResults
        ?orderBy
        ?pageToken
        ?q
        ?showDeleted
        ?showHiddenInvitations
        ?singleEvents
        ?timeMax
        ?timeMin
        ?timeZone
        ?updatedMin
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?iCalUID ?maxAttendees ?maxResults
      ?orderBy ?pageToken ?q ?showDeleted ?showHiddenInvitations
      ?singleEvents ?timeMax ?timeMin ?timeZone ?updatedMin () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Events.of_data_model) session 
    
  let move
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        ~eventId
        ~destination
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId); "move"]
      base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ~destination ?sendNotifications () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:Event.empty full_url
      (GapiJson.parse_json_response Event.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        ~eventId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let quickAdd
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        ~text
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; "quickAdd"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications ~text () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:Event.empty full_url
      (GapiJson.parse_json_response Event.of_data_model) session 
    
  let reset
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId); "reset"]
      base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:Event.empty full_url
      (GapiJson.parse_json_response Event.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?sendNotifications
        ~calendarId
        ~eventId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = Option.map EventsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  
end

module FreebusyResource =
struct
  let query
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        freeBusyRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["freeBusy"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json FreeBusyRequest.to_data_model)
      ~data:freeBusyRequest full_url
      (GapiJson.parse_json_response FreeBusyResponse.of_data_model) session 
    
  
end

module SettingsResource =
struct
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ~setting
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "settings";
      ((fun x -> x) setting)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Setting.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "settings"]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Settings.of_data_model) session 
    
  
end

