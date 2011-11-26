open GapiUtils.Op

module QueryParameters =
struct
  type t = {
    (* Standard query parameters *)
    fields : string;
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
    let param get to_string name = 
      let value = get qp in
        if value <> get default then
          [(name, to_string value)]
        else
          []
    in
      [param (fun p -> p.fields) Std.identity "fields";
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

let parse_calendar_list =
  GapiJson.parse_json_response GapiCalendar.CalendarListList.of_data_model

let calendar_list
      ?(url = "https://www.googleapis.com/calendar/v3/users/me/calendarList")
      ?etag
      ?parameters
      session =
  let query_parameters = Option.map
                           QueryParameters.to_key_value_list
                           parameters in
    GapiService.query
      ?etag
      ?query_parameters
      url
      parse_calendar_list
      session

