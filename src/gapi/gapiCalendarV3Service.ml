(* Warning! This file is generated. Modify at your own risk.
        *)

open GapiUtils.Infix
open GapiCalendarV3Model

module Scope =
struct
  let calendar = "https://www.googleapis.com/auth/calendar"
  
  let calendar_events_readonly = "https://www.googleapis.com/auth/calendar.events.readonly"
  
  let calendar_readonly = "https://www.googleapis.com/auth/calendar.readonly"
  
  let calendar_events = "https://www.googleapis.com/auth/calendar.events"
  
  let calendar_settings_readonly = "https://www.googleapis.com/auth/calendar.settings.readonly"
  
  
end

module ColorsResource =
struct
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?etag
        ?std_params
        ?custom_headers
        session =
    let full_url = GapiUtils.add_path_to_url ["colors"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Colors.of_data_model) session 
    
  
end

module AclResource =
struct
  module AclParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* acl-specific query parameters *)
      maxResults : int;
      pageToken : string;
      sendNotifications : bool;
      showDeleted : bool;
      syncToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      sendNotifications = false;
      showDeleted = false;
      syncToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.sendNotifications) string_of_bool "sendNotifications";
      param (fun p -> p.showDeleted) string_of_bool "showDeleted";
      param (fun p -> p.syncToken) (fun x -> x) "syncToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(sendNotifications = default.sendNotifications)
        ?(showDeleted = default.showDeleted)
        ?(syncToken = default.syncToken)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        sendNotifications;
        showDeleted;
        syncToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ~calendarId
        ~ruleId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?showDeleted
        ?syncToken
        ?pageToken
        ?maxResults
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"] base_url in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params ?showDeleted ?syncToken ?pageToken
      ?maxResults () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response Acl.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ~calendarId
        ~ruleId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ~calendarId
        aclRule
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"] base_url in
    let etag = GapiUtils.etag_option aclRule.AclRule.etag in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json AclRule.to_data_model)
      ~data:aclRule full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ~calendarId
        ~ruleId
        aclRule
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let etag = GapiUtils.etag_option aclRule.AclRule.etag in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json AclRule.to_data_model)
      ~data:aclRule full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ~calendarId
        ~ruleId
        aclRule
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; ((fun x -> x) ruleId)] base_url in
    let etag = GapiUtils.etag_option aclRule.AclRule.etag in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json AclRule.to_data_model)
      ~data:aclRule full_url
      (GapiJson.parse_json_response AclRule.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?maxResults
        ?showDeleted
        ?syncToken
        ?pageToken
        ~calendarId
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "acl"; "watch"] base_url in
    let params = AclParameters.merge_parameters
      ?standard_parameters:std_params ?maxResults ?showDeleted ?syncToken
      ?pageToken () in
    let query_parameters = GapiOption.map AclParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  
end

module CalendarsResource =
struct
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        calendar
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars"] base_url in
    let etag = GapiUtils.etag_option calendar.Calendar.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Calendar.to_data_model)
      ~data:calendar full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  let clear
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "clear"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers ~data:() full_url
      GapiRequest.parse_empty_response session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ~calendarId
        calendar
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendar.Calendar.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Calendar.to_data_model)
      ~data:calendar full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ~calendarId
        calendar
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendar.Calendar.etag in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.put ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Calendar.to_data_model)
      ~data:calendar full_url
      (GapiJson.parse_json_response Calendar.of_data_model) session 
    
  
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
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* calendarList-specific query parameters *)
      colorRgbFormat : bool;
      maxResults : int;
      minAccessRole : MinAccessRole.t;
      pageToken : string;
      showDeleted : bool;
      showHidden : bool;
      syncToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      colorRgbFormat = false;
      maxResults = 0;
      minAccessRole = MinAccessRole.Default;
      pageToken = "";
      showDeleted = false;
      showHidden = false;
      syncToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.colorRgbFormat) string_of_bool "colorRgbFormat";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.minAccessRole) MinAccessRole.to_string "minAccessRole";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.showDeleted) string_of_bool "showDeleted";
      param (fun p -> p.showHidden) string_of_bool "showHidden";
      param (fun p -> p.syncToken) (fun x -> x) "syncToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(colorRgbFormat = default.colorRgbFormat)
        ?(maxResults = default.maxResults)
        ?(minAccessRole = default.minAccessRole)
        ?(pageToken = default.pageToken)
        ?(showDeleted = default.showDeleted)
        ?(showHidden = default.showHidden)
        ?(syncToken = default.syncToken)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        colorRgbFormat;
        maxResults;
        minAccessRole;
        pageToken;
        showDeleted;
        showHidden;
        syncToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?minAccessRole
        ?syncToken
        ?showHidden
        ?showDeleted
        ?pageToken
        ?maxResults
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList"]
      base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params ?minAccessRole ?syncToken ?showHidden
      ?showDeleted ?pageToken ?maxResults () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response CalendarList.of_data_model) session 
    
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?minAccessRole
        ?maxResults
        ?syncToken
        ?showHidden
        ?showDeleted
        ?pageToken
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      "watch"] base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params ?minAccessRole ?maxResults ?syncToken
      ?showHidden ?showDeleted ?pageToken () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?colorRgbFormat
        calendarListEntry
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList"]
      base_url in
    let etag = GapiUtils.etag_option calendarListEntry.CalendarListEntry.etag
      in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params ?colorRgbFormat () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json CalendarListEntry.to_data_model)
      ~data:calendarListEntry full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?colorRgbFormat
        ~calendarId
        calendarListEntry
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendarListEntry.CalendarListEntry.etag
      in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params ?colorRgbFormat () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json CalendarListEntry.to_data_model)
      ~data:calendarListEntry full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?colorRgbFormat
        ~calendarId
        calendarListEntry
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "calendarList";
      ((fun x -> x) calendarId)] base_url in
    let etag = GapiUtils.etag_option calendarListEntry.CalendarListEntry.etag
      in
    let params = CalendarListParameters.merge_parameters
      ?standard_parameters:std_params ?colorRgbFormat () in
    let query_parameters = GapiOption.map
      CalendarListParameters.to_key_value_list params in
    GapiService.put ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json CalendarListEntry.to_data_model)
      ~data:calendarListEntry full_url
      (GapiJson.parse_json_response CalendarListEntry.of_data_model) session 
    
  
end

module FreebusyResource =
struct
  let query
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        freeBusyRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["freeBusy"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json FreeBusyRequest.to_data_model)
      ~data:freeBusyRequest full_url
      (GapiJson.parse_json_response FreeBusyResponse.of_data_model) session 
    
  
end

module ChannelsResource =
struct
  let stop
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["channels"; "stop"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url GapiRequest.parse_empty_response session 
    
  
end

module SettingsResource =
struct
  module SettingsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* settings-specific query parameters *)
      maxResults : int;
      pageToken : string;
      syncToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      syncToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.syncToken) (fun x -> x) "syncToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(syncToken = default.syncToken)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        syncToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ~setting
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "settings";
      ((fun x -> x) setting)] base_url in
    let params = SettingsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      SettingsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Setting.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?pageToken
        ?maxResults
        ?syncToken
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "settings";
      "watch"] base_url in
    let params = SettingsParameters.merge_parameters
      ?standard_parameters:std_params ?pageToken ?maxResults ?syncToken () in
    let query_parameters = GapiOption.map
      SettingsParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?syncToken
        ?maxResults
        ?pageToken
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; "me"; "settings"]
      base_url in
    let params = SettingsParameters.merge_parameters
      ?standard_parameters:std_params ?syncToken ?maxResults ?pageToken () in
    let query_parameters = GapiOption.map
      SettingsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response Settings.of_data_model) session 
    
  
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
  
  module SendUpdates =
  struct
    type t =
      | Default
      | All
      | ExternalOnly
      | None
      
    let to_string = function
      | Default -> ""
      | All -> "all"
      | ExternalOnly -> "externalOnly"
      | None -> "none"
      
    let of_string = function
      | "" -> Default
      | "all" -> All
      | "externalOnly" -> ExternalOnly
      | "none" -> None
      | s -> failwith ("Unexpected value for SendUpdates:" ^ s)
  
  end
  
  module EventsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* events-specific query parameters *)
      alwaysIncludeEmail : bool;
      conferenceDataVersion : int;
      destination : string;
      iCalUID : string;
      maxAttendees : int;
      maxResults : int;
      orderBy : OrderBy.t;
      originalStart : string;
      pageToken : string;
      privateExtendedProperty : string list;
      q : string;
      sendNotifications : bool;
      sendUpdates : SendUpdates.t;
      sharedExtendedProperty : string list;
      showDeleted : bool;
      showHiddenInvitations : bool;
      singleEvents : bool;
      supportsAttachments : bool;
      syncToken : string;
      text : string;
      timeMax : GapiDate.t;
      timeMin : GapiDate.t;
      timeZone : string;
      updatedMin : GapiDate.t;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      alwaysIncludeEmail = false;
      conferenceDataVersion = 0;
      destination = "";
      iCalUID = "";
      maxAttendees = 0;
      maxResults = 0;
      orderBy = OrderBy.Default;
      originalStart = "";
      pageToken = "";
      privateExtendedProperty = [];
      q = "";
      sendNotifications = false;
      sendUpdates = SendUpdates.Default;
      sharedExtendedProperty = [];
      showDeleted = false;
      showHiddenInvitations = false;
      singleEvents = false;
      supportsAttachments = false;
      syncToken = "";
      text = "";
      timeMax = GapiDate.epoch;
      timeMin = GapiDate.epoch;
      timeZone = "";
      updatedMin = GapiDate.epoch;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.alwaysIncludeEmail) string_of_bool "alwaysIncludeEmail";
      param (fun p -> p.conferenceDataVersion) string_of_int "conferenceDataVersion";
      param (fun p -> p.destination) (fun x -> x) "destination";
      param (fun p -> p.iCalUID) (fun x -> x) "iCalUID";
      param (fun p -> p.maxAttendees) string_of_int "maxAttendees";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.orderBy) OrderBy.to_string "orderBy";
      param (fun p -> p.originalStart) (fun x -> x) "originalStart";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      GapiService.build_params qp (fun p -> p.privateExtendedProperty) (fun x -> x) "privateExtendedProperty";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.sendNotifications) string_of_bool "sendNotifications";
      param (fun p -> p.sendUpdates) SendUpdates.to_string "sendUpdates";
      GapiService.build_params qp (fun p -> p.sharedExtendedProperty) (fun x -> x) "sharedExtendedProperty";
      param (fun p -> p.showDeleted) string_of_bool "showDeleted";
      param (fun p -> p.showHiddenInvitations) string_of_bool "showHiddenInvitations";
      param (fun p -> p.singleEvents) string_of_bool "singleEvents";
      param (fun p -> p.supportsAttachments) string_of_bool "supportsAttachments";
      param (fun p -> p.syncToken) (fun x -> x) "syncToken";
      param (fun p -> p.text) (fun x -> x) "text";
      param (fun p -> p.timeMax) GapiDate.to_string "timeMax";
      param (fun p -> p.timeMin) GapiDate.to_string "timeMin";
      param (fun p -> p.timeZone) (fun x -> x) "timeZone";
      param (fun p -> p.updatedMin) GapiDate.to_string "updatedMin";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(alwaysIncludeEmail = default.alwaysIncludeEmail)
        ?(conferenceDataVersion = default.conferenceDataVersion)
        ?(destination = default.destination)
        ?(iCalUID = default.iCalUID)
        ?(maxAttendees = default.maxAttendees)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(originalStart = default.originalStart)
        ?(pageToken = default.pageToken)
        ?(privateExtendedProperty = default.privateExtendedProperty)
        ?(q = default.q)
        ?(sendNotifications = default.sendNotifications)
        ?(sendUpdates = default.sendUpdates)
        ?(sharedExtendedProperty = default.sharedExtendedProperty)
        ?(showDeleted = default.showDeleted)
        ?(showHiddenInvitations = default.showHiddenInvitations)
        ?(singleEvents = default.singleEvents)
        ?(supportsAttachments = default.supportsAttachments)
        ?(syncToken = default.syncToken)
        ?(text = default.text)
        ?(timeMax = default.timeMax)
        ?(timeMin = default.timeMin)
        ?(timeZone = default.timeZone)
        ?(updatedMin = default.updatedMin)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        alwaysIncludeEmail;
        conferenceDataVersion;
        destination;
        iCalUID;
        maxAttendees;
        maxResults;
        orderBy;
        originalStart;
        pageToken;
        privateExtendedProperty;
        q;
        sendNotifications;
        sendUpdates;
        sharedExtendedProperty;
        showDeleted;
        showHiddenInvitations;
        singleEvents;
        supportsAttachments;
        syncToken;
        text;
        timeMax;
        timeMin;
        timeZone;
        updatedMin;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ?timeZone
        ?maxAttendees
        ?alwaysIncludeEmail
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?timeZone ?maxAttendees
      ?alwaysIncludeEmail () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Event.of_data_model) session 
    
  let instances
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?timeZone
        ?timeMin
        ?timeMax
        ?pageToken
        ?maxResults
        ?originalStart
        ?alwaysIncludeEmail
        ?showDeleted
        ?maxAttendees
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId);
      "instances"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?timeZone ?timeMin ?timeMax ?pageToken
      ?maxResults ?originalStart ?alwaysIncludeEmail ?showDeleted
      ?maxAttendees () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response Events.of_data_model) session 
    
  let quickAdd
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ?sendUpdates
        ~calendarId
        ~text
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; "quickAdd"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications ~text ?sendUpdates
      () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers ~data:Event.empty
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?(maxResults = 250)
        ?q
        ?timeZone
        ?sharedExtendedProperty
        ?syncToken
        ?updatedMin
        ?maxAttendees
        ?privateExtendedProperty
        ?singleEvents
        ?showDeleted
        ?orderBy
        ?alwaysIncludeEmail
        ?showHiddenInvitations
        ?pageToken
        ?timeMin
        ?timeMax
        ?iCalUID
        ~calendarId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?q ?timeZone ~maxResults
      ?sharedExtendedProperty ?syncToken ?updatedMin ?maxAttendees
      ?privateExtendedProperty ?singleEvents ?showDeleted ?orderBy
      ?alwaysIncludeEmail ?showHiddenInvitations ?pageToken ?timeMin ?timeMax
      ?iCalUID () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response Events.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ?sendUpdates
        ~calendarId
        ~eventId
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications ?sendUpdates () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?(maxResults = 250)
        ?timeMax
        ?timeZone
        ?iCalUID
        ?privateExtendedProperty
        ?orderBy
        ?singleEvents
        ?showDeleted
        ?q
        ?sharedExtendedProperty
        ?updatedMin
        ?timeMin
        ?pageToken
        ?syncToken
        ?showHiddenInvitations
        ?maxAttendees
        ?alwaysIncludeEmail
        ~calendarId
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; "watch"] base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?timeMax ?timeZone ?iCalUID
      ?privateExtendedProperty ?orderBy ?singleEvents ?showDeleted ?q
      ?sharedExtendedProperty ?updatedMin ?timeMin ?pageToken ?syncToken
      ?showHiddenInvitations ?maxAttendees ?alwaysIncludeEmail ~maxResults ()
      in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?conferenceDataVersion
        ?maxAttendees
        ?supportsAttachments
        ?sendNotifications
        ?sendUpdates
        ~calendarId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"] base_url in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?conferenceDataVersion ?maxAttendees
      ?supportsAttachments ?sendNotifications ?sendUpdates () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ?conferenceDataVersion
        ?maxAttendees
        ?alwaysIncludeEmail
        ?supportsAttachments
        ?sendUpdates
        ~calendarId
        ~eventId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications
      ?conferenceDataVersion ?maxAttendees ?alwaysIncludeEmail
      ?supportsAttachments ?sendUpdates () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let move
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?sendNotifications
        ?sendUpdates
        ~calendarId
        ~eventId
        ~destination
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId); "move"]
      base_url in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?sendNotifications ~destination
      ?sendUpdates () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers ~data:Event.empty
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?conferenceDataVersion
        ?sendNotifications
        ?supportsAttachments
        ?sendUpdates
        ?maxAttendees
        ?alwaysIncludeEmail
        ~calendarId
        ~eventId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; ((fun x -> x) eventId)] base_url
      in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?conferenceDataVersion
      ?sendNotifications ?supportsAttachments ?sendUpdates ?maxAttendees
      ?alwaysIncludeEmail () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  let import
        ?(base_url = "https://www.googleapis.com/calendar/v3/")
        ?std_params
        ?custom_headers
        ?supportsAttachments
        ?conferenceDataVersion
        ~calendarId
        event
        session =
    let full_url = GapiUtils.add_path_to_url ["calendars";
      ((fun x -> x) calendarId); "events"; "import"] base_url in
    let etag = GapiUtils.etag_option event.Event.etag in
    let params = EventsParameters.merge_parameters
      ?standard_parameters:std_params ?supportsAttachments
      ?conferenceDataVersion () in
    let query_parameters = GapiOption.map EventsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag ?custom_headers
      ~data_to_post:(GapiJson.render_json Event.to_data_model) ~data:event
      full_url (GapiJson.parse_json_response Event.of_data_model) session 
    
  
end

