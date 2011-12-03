open GapiUtils.Infix
open GapiCalendar
open GapiACL

let build_param default_params params get_value to_string name = 
  let value = get_value params in
    if value <> get_value default_params then
      [(name, to_string value)]
    else
      []

module StandardParameters =
struct
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = ""
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp"]
      |> List.concat

end

module QueryParameters =
struct
  type t = {
    (* Standard query parameters *)
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    (* Calendar-specific query parameters *)
    maxAttendees : int;
    maxResults : int;
    minAccessRole : string;
    orderBy : string;
    originalStart : GapiDate.t;
    pageToken : string;
    q : string;
    sendNotifications : bool;
    singleEvents : bool;
    showDeleted : bool;
    showHidden : bool;
    showHiddenInvitations : bool;
    timeMax : GapiDate.t;
    timeMin : GapiDate.t;
    timeZone : string;
    updatedMin : GapiDate.t
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    maxAttendees = 0;
    maxResults = 0;
    minAccessRole = "";
    orderBy = "";
    originalStart = GapiDate.epoch;
    pageToken = "";
    q = "";
    sendNotifications = false;
    singleEvents = false;
    showDeleted = false;
    showHidden = false;
    showHiddenInvitations = false;
    timeMax = GapiDate.epoch;
    timeMin = GapiDate.epoch;
    timeZone = "";
    updatedMin = GapiDate.epoch
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp";
       param (fun p -> p.maxAttendees) string_of_int "maxAttendees";
       param (fun p -> p.maxResults) string_of_int "maxResults";
       param (fun p -> p.minAccessRole) Std.identity "minAccessRole";
       param (fun p -> p.orderBy) Std.identity "orderBy";
       param (fun p -> p.originalStart) GapiDate.to_string "originalStart";
       param (fun p -> p.pageToken) Std.identity "pageToken";
       param (fun p -> p.q) Std.identity "q";
       param (fun p -> p.sendNotifications) string_of_bool "sendNotifications";
       param (fun p -> p.singleEvents) string_of_bool "singleEvents";
       param (fun p -> p.showDeleted) string_of_bool "showDeleted";
       param (fun p -> p.showHidden) string_of_bool "showHidden";
       param (fun p -> p.showHiddenInvitations) string_of_bool "showHiddenInvitations";
       param (fun p -> p.timeMax) GapiDate.to_string "timeMax";
       param (fun p -> p.timeMin) GapiDate.to_string "timeMin";
       param (fun p -> p.timeZone) Std.identity "timeZone";
       param (fun p -> p.updatedMin) GapiDate.to_string "updatedMin"]
      |> List.concat

end

module CalendarListConf =
struct
  type resource_list_t = CalendarListList.t
  type resource_t = CalendarListResource.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/users/me/calendarList"

  let parse_resource_list =
    GapiJson.parse_json_response CalendarListList.of_data_model

  let parse_resource =
    GapiJson.parse_json_response CalendarListResource.of_data_model

  let render_resource =
    GapiJson.render_json CalendarListResource.to_data_model

  let create_resource_from_id id =
    { CalendarListResource.empty with
          CalendarListResource.id = id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.CalendarListResource.id]
            base_url

  let get_etag resource =
    GapiUtils.etag_option resource.CalendarListResource.etag

end

module CalendarList =
  GapiService.Make
    (CalendarListConf)
    (QueryParameters)

module ACLConf =
struct
  type resource_list_t = ACLList.t
  type resource_t = ACLResource.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/calendars"

  let parse_resource_list =
    GapiJson.parse_json_response ACLList.of_data_model

  let parse_resource =
    GapiJson.parse_json_response ACLResource.of_data_model

  let render_resource =
    GapiJson.render_json ACLResource.to_data_model

  let create_resource_from_id id =
    { ACLResource.empty with
          ACLResource.id = id
    }

  let get_url ?(container_id = "primary") ?resource base_url =
    let container_path =
      [container_id; "acl"] in
    let resource_path =
      match resource with
          None ->
            []
        | Some r ->
            [r.ACLResource.id]
    in
      GapiUtils.add_path_to_url
        (container_path @ resource_path)
        base_url

  let get_etag resource =
    GapiUtils.etag_option resource.ACLResource.etag

end

module ACL =
  GapiService.Make
    (ACLConf)
    (StandardParameters)

module CalendarsConf =
struct
  type resource_list_t = unit
  type resource_t = CalendarsResource.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/calendars"

  let parse_resource_list _ =
    ()

  let parse_resource =
    GapiJson.parse_json_response CalendarsResource.of_data_model

  let render_resource =
    GapiJson.render_json CalendarsResource.to_data_model

  let create_resource_from_id id =
    { CalendarsResource.empty with
          CalendarsResource.id = id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.CalendarsResource.id]
            base_url

  let get_etag resource =
    GapiUtils.etag_option resource.CalendarsResource.etag

end

module Calendars =
struct
  include GapiService.Make(CalendarsConf)(StandardParameters)

  let clear
        ?(url = CalendarsConf.service_url)
        session =
    let url' = GapiUtils.add_path_to_url ["primary"; "clear"] url in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        url'
        GapiRequest.parse_empty_response
        session

end

module Colors =
struct
  let get
        ?(url = "https://www.googleapis.com/calendar/v3/colors")
        session =
    GapiService.query
      url
      (GapiJson.parse_json_response ColorList.of_data_model)
      session

end

module SettingsConf =
struct
  type resource_list_t = SettingsList.t
  type resource_t = SettingsResource.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/users/me/settings"

  let parse_resource_list =
    GapiJson.parse_json_response SettingsList.of_data_model

  let parse_resource =
    GapiJson.parse_json_response SettingsResource.of_data_model

  let render_resource =
    GapiJson.render_json SettingsResource.to_data_model

  let create_resource_from_id id =
    { SettingsResource.empty with
          SettingsResource.id = id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.SettingsResource.id]
            base_url

  let get_etag resource =
    GapiUtils.etag_option resource.SettingsResource.etag

end

module Settings =
  GapiService.Make
    (SettingsConf)
    (StandardParameters)

module FreeBusy =
struct
  let query
        ?(url = "https://www.googleapis.com/calendar/v3/freeBusy")
        parameters
        session =
    let post_data = GapiJson.render_json
                      FreeBusyParameters.to_data_model
                      parameters in
      GapiService.service_request
        ~post_data
        url
        (GapiJson.parse_json_response FreeBusyResource.of_data_model)
        session

end

module EventsConf =
struct
  type resource_list_t = EventsList.t
  type resource_t = EventsResource.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/calendars"

  let parse_resource_list =
    GapiJson.parse_json_response EventsList.of_data_model

  let parse_resource =
    GapiJson.parse_json_response EventsResource.of_data_model

  let render_resource =
    GapiJson.render_json EventsResource.to_data_model

  let create_resource_from_id id =
    { EventsResource.empty with
          EventsResource.id = id
    }

  let get_url ?(container_id = "primary") ?resource base_url =
    let container_path =
      [container_id; "events"] in
    let resource_path =
      match resource with
          None ->
            []
        | Some r ->
            [r.EventsResource.id]
    in
      GapiUtils.add_path_to_url
        (container_path @ resource_path)
        base_url

  let get_etag resource =
    GapiUtils.etag_option resource.EventsResource.etag

end

module Events =
struct
  include GapiService.Make(EventsConf)(QueryParameters)

  let instances
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?(container_id = "primary")
        event_id
        session =
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; event_id; "instances"]
                 url
    in
      GapiService.query
        url'
        EventsConf.parse_resource_list
        session

  let import
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?(container_id = "primary")
        event_resource
        session =
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; "import"]
                 url
    in
      GapiService.create
        EventsConf.render_resource
        event_resource
        url'
        EventsConf.parse_resource
        session

  let quickAdd
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?(container_id = "primary")
        text
        session =
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; "quickAdd"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ~query_parameters:[("text", text)]
        url'
        EventsConf.parse_resource
        session

  let move
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?(container_id = "primary")
        event_id
        destination_id
        session =
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; event_id; "move"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ~query_parameters:[("destination", destination_id)]
        url'
        GapiRequest.parse_empty_response
        session

  let reset
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?(container_id = "primary")
        event_id
        session =
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; event_id; "reset"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        url'
        EventsConf.parse_resource
        session

end

