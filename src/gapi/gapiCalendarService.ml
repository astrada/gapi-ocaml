open GapiUtils.Infix
open GapiCalendar

let scope = "https://www.googleapis.com/auth/calendar"
let read_only_scope = "https://www.googleapis.com/auth/calendar.readonly"

module CalendarParameters =
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
      GapiService.build_param default qp get_value to_string name
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

  let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxAttendees = default.maxAttendees)
        ?(maxResults = default.maxResults)
        ?(minAccessRole = default.minAccessRole)
        ?(orderBy = default.orderBy)
        ?(originalStart = default.originalStart)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        ?(sendNotifications = default.sendNotifications)
        ?(singleEvents = default.singleEvents)
        ?(showDeleted = default.showDeleted)
        ?(showHidden = default.showHidden)
        ?(showHiddenInvitations = default.showHiddenInvitations)
        ?(timeMax = default.timeMax)
        ?(timeMin = default.timeMin)
        ?(timeZone = default.timeZone)
        ?(updatedMin = default.updatedMin)
        () =
    let parameters =
      { fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        maxAttendees = maxAttendees;
        maxResults = maxResults;
        minAccessRole = minAccessRole;
        orderBy = orderBy;
        originalStart = originalStart;
        pageToken = pageToken;
        q = q;
        sendNotifications = sendNotifications;
        singleEvents = singleEvents;
        showDeleted = showDeleted;
        showHidden = showHidden;
        showHiddenInvitations = showHiddenInvitations;
        timeMax = timeMax;
        timeMin = timeMin;
        timeZone = timeZone;
        updatedMin = updatedMin
      }
    in
      if parameters = default then None else Some parameters

end

module AclResourceConf =
struct
  type resource_list_t = Acl.t
  type resource_t = AclRule.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/calendars"

  let parse_resource_list =
    GapiJson.parse_json_response Acl.of_data_model

  let parse_resource =
    GapiJson.parse_json_response AclRule.of_data_model

  let render_resource =
    GapiJson.render_json AclRule.to_data_model

  let create_resource_from_id id =
    { AclRule.empty with
          AclRule.id = id
    }

  let get_url ?(container_id = "primary") ?resource base_url =
    let container_path =
      [container_id; "acl"] in
    let resource_path =
      match resource with
          None ->
            []
        | Some r ->
            [r.AclRule.id]
    in
      GapiUtils.add_path_to_url
        (container_path @ resource_path)
        base_url

  let get_etag resource =
    GapiUtils.etag_option resource.AclRule.etag

end

module AclResource =
struct
  module Service =
    GapiService.Make(AclResourceConf)(GapiService.StandardParameters)

  let list ?url ?etag ?parameters ?calendarId session =
    Service.list ?url ?etag ?parameters ?container_id:calendarId session

  let get ?url ?parameters ?calendarId ~ruleId session =
    Service.get ?url ?parameters ?container_id:calendarId ruleId session

  let refresh ?url ?parameters ?calendarId aclRule session =
    Service.refresh ?url ?parameters ?container_id:calendarId aclRule session

  let insert ?url ?parameters ?calendarId aclRule session =
    Service.insert ?url ?parameters ?container_id:calendarId aclRule session

  let update ?url ?parameters ?calendarId aclRule session =
    Service.update ?url ?parameters ?container_id:calendarId aclRule session

  let patch ?url ?parameters ?calendarId aclRule session =
    Service.patch ?url ?parameters ?container_id:calendarId aclRule session

  let delete ?url ?parameters ?calendarId aclRule session =
    Service.delete ?url ?parameters ?container_id:calendarId aclRule session

end

module CalendarListResourceConf =
struct
  type resource_list_t = CalendarList.t
  type resource_t = CalendarListEntry.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/users/me/calendarList"

  let parse_resource_list =
    GapiJson.parse_json_response CalendarList.of_data_model

  let parse_resource =
    GapiJson.parse_json_response CalendarListEntry.of_data_model

  let render_resource =
    GapiJson.render_json CalendarListEntry.to_data_model

  let create_resource_from_id id =
    { CalendarListEntry.empty with
          CalendarListEntry.id = id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url ~encoded:false
            [r.CalendarListEntry.id]
            base_url

  let get_etag resource =
    GapiUtils.etag_option resource.CalendarListEntry.etag

end

module CalendarListResource =
struct
  module Service =
    GapiService.Make(CalendarListResourceConf)(CalendarParameters)

  let list ?url ?etag ?parameters
        ?maxResults ?minAccessRole ?pageToken ?showHidden session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters
                   ?maxResults ?minAccessRole ?pageToken ?showHidden () in
      Service.list ?url ?etag ?parameters:params session

  let get ?url ?parameters ~calendarId session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.get ?url ?parameters:params calendarId session

  let refresh ?url ?parameters calendarListEntry session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.refresh ?url ?parameters:params calendarListEntry session

  let insert ?url ?parameters calendarListEntry session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.insert ?url ?parameters:params calendarListEntry session

  let update ?url ?parameters calendarListEntry session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.update ?url ?parameters:params calendarListEntry session

  let patch ?url ?parameters calendarListEntry session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.patch ?url ?parameters:params calendarListEntry session

  let delete ?url ?parameters calendarListEntry session =
    let params = CalendarParameters.merge_parameters
                   ?standard_parameters:parameters () in
      Service.delete ?url ?parameters:params calendarListEntry session

end

module CalendarsResourceConf =
struct
  type resource_list_t = unit
  type resource_t = Calendar.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/calendars"

  let parse_resource_list _ =
    ()

  let parse_resource =
    GapiJson.parse_json_response Calendar.of_data_model

  let render_resource =
    GapiJson.render_json Calendar.to_data_model

  let create_resource_from_id id =
    { Calendar.empty with
          Calendar.id = id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.Calendar.id]
            base_url

  let get_etag resource =
    GapiUtils.etag_option resource.Calendar.etag

end

module CalendarsResource =
struct
  module Service =
    GapiService.Make(CalendarsResourceConf)(GapiService.StandardParameters)

  let get ?url ?parameters ~calendarId session =
    Service.get ?url ?parameters calendarId session

  let refresh ?url ?parameters calendar session =
    Service.refresh ?url ?parameters calendar session

  let insert ?url ?parameters calendar session =
    Service.insert ?url ?parameters calendar session

  let update ?url ?parameters calendar session =
    Service.update ?url ?parameters calendar session

  let patch ?url ?parameters calendar session =
    Service.patch ?url ?parameters calendar session

  let delete ?url ?parameters calendar session =
    Service.delete ?url ?parameters calendar session

  let clear
        ?(url = CalendarsResourceConf.service_url)
        ?parameters
        ?(calendarId = "primary")
        session =
    let url' = GapiUtils.add_path_to_url [calendarId; "clear"] url in
    let query_parameters = GapiService.map_standard_parameters parameters in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ?query_parameters
        url'
        GapiRequest.parse_empty_response
        session

end

module ColorsResource =
struct
  let get
        ?(url = "https://www.googleapis.com/calendar/v3/colors")
        ?parameters
        session =
    let query_parameters = GapiService.map_standard_parameters parameters in
      GapiService.query
        ?query_parameters
        url
        (GapiJson.parse_json_response Colors.of_data_model)
        session

end

module EventsResourceConf =
struct
  type resource_list_t = Events.t
  type resource_t = Event.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/calendars"

  let parse_resource_list =
    GapiJson.parse_json_response Events.of_data_model

  let parse_resource =
    GapiJson.parse_json_response Event.of_data_model

  let render_resource =
    GapiJson.render_json Event.to_data_model

  let create_resource_from_id id =
    { Event.empty with
          Event.id = id
    }

  let get_url ?(container_id = "primary") ?resource base_url =
    let container_path =
      [container_id; "events"] in
    let resource_path =
      match resource with
          None ->
            []
        | Some r ->
            [r.Event.id]
    in
      GapiUtils.add_path_to_url
        (container_path @ resource_path)
        base_url

  let get_etag resource =
    GapiUtils.etag_option resource.Event.etag

end

module EventsResource =
struct
  include GapiService.Make(EventsResourceConf)(CalendarParameters)

  let instances
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?parameters
        ?(container_id = "primary")
        event_id
        session =
    let query_parameters = GapiService.map_standard_parameters parameters in
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; event_id; "instances"]
                 url
    in
      GapiService.query
        ?query_parameters
        url'
        EventsResourceConf.parse_resource_list
        session

  let import
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?parameters
        ?(container_id = "primary")
        event_resource
        session =
    let query_parameters = GapiService.map_standard_parameters parameters in
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; "import"]
                 url
    in
      GapiService.create
        EventsResourceConf.render_resource
        ?query_parameters
        event_resource
        url'
        EventsResourceConf.parse_resource
        session

  let quickAdd
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?parameters
        ?(container_id = "primary")
        text
        session =
    let standard_parameters = GapiService.map_standard_parameters parameters in
    let query_parameters =
      ("text", text) :: Option.default [] standard_parameters in
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; "quickAdd"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ~query_parameters
        url'
        EventsResourceConf.parse_resource
        session

  let move
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?parameters
        ?(container_id = "primary")
        event_id
        destination_id
        session =
    let standard_parameters = GapiService.map_standard_parameters parameters in
    let query_parameters =
      ("destination", destination_id) :: Option.default
                                           [] standard_parameters in
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; event_id; "move"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ~query_parameters
        url'
        EventsResourceConf.parse_resource
        session

  let reset
        ?(url = "https://www.googleapis.com/calendar/v3/calendars")
        ?parameters
        ?(container_id = "primary")
        instance_id
        session =
    let query_parameters = GapiService.map_standard_parameters parameters in
    let url' = GapiUtils.add_path_to_url
                 [container_id; "events"; instance_id; "reset"]
                 url
    in
      GapiService.service_request
        ~post_data:GapiCore.PostData.empty
        ?query_parameters
        url'
        EventsResourceConf.parse_resource
        session

end

module FreebusyResource =
struct
  let query
        ?(url = "https://www.googleapis.com/calendar/v3/freeBusy")
        ?parameters
        request
        session =
    let query_parameters = GapiService.map_standard_parameters parameters in
    let post_data = GapiJson.render_json
                      FreeBusyRequest.to_data_model
                      request in
      GapiService.service_request
        ~post_data
        ?query_parameters
        url
        (GapiJson.parse_json_response FreeBusyResponse.of_data_model)
        session

end

module SettingResourceConf =
struct
  type resource_list_t = Settings.t
  type resource_t = Setting.t

  let service_url =
    "https://www.googleapis.com/calendar/v3/users/me/settings"

  let parse_resource_list =
    GapiJson.parse_json_response Settings.of_data_model

  let parse_resource =
    GapiJson.parse_json_response Setting.of_data_model

  let render_resource =
    GapiJson.render_json Setting.to_data_model

  let create_resource_from_id id =
    { Setting.empty with
          Setting.id = id
    }

  let get_url ?container_id ?resource base_url =
    match resource with
        None ->
          base_url
      | Some r ->
          GapiUtils.add_path_to_url
            [r.Setting.id]
            base_url

  let get_etag resource =
    GapiUtils.etag_option resource.Setting.etag

end

module SettingsResource =
  GapiService.Make
    (SettingResourceConf)
    (GapiService.StandardParameters)

