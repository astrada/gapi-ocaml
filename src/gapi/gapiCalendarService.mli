module StandardParameters :
sig
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

module QueryParameters :
sig
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
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
    updatedMin : GapiDate.t;
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

module CalendarList :
  GapiService.SERVICE with
    type resource_list_t = GapiCalendar.CalendarListList.t
      and type resource_t = GapiCalendar.CalendarListResource.t
      and type query_parameters_t = QueryParameters.t

module ACL :
  GapiService.SERVICE with
    type resource_list_t = GapiACL.ACLList.t
      and type resource_t = GapiACL.ACLResource.t
      and type query_parameters_t = StandardParameters.t

module Calendars :
sig
  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarsResource.t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.CalendarsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarsResource.t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.CalendarsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarsResource.t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.CalendarsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarsResource.t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.CalendarsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.CalendarsResource.t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.CalendarsResource.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  val clear :
    ?url:string ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

module Colors :
sig
  val get :
    ?url:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.ColorList.t * GapiConversation.Session.t)

end

module Settings :
sig
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:StandardParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.SettingsList.t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.SettingsResource.t * GapiConversation.Session.t)

end

