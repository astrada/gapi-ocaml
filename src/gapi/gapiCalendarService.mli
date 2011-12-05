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

module AclResource :
  GapiService.SERVICE with
    type resource_list_t = GapiCalendar.Acl.t
      and type resource_t = GapiCalendar.AclRule.t
      and type query_parameters_t = StandardParameters.t

module CalendarListResource :
  GapiService.SERVICE with
    type resource_list_t = GapiCalendar.CalendarList.t
      and type resource_t = GapiCalendar.CalendarListEntry.t
      and type query_parameters_t = QueryParameters.t

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

module FreeBusy :
sig
  val query :
    ?url:string ->
    GapiCalendar.FreeBusyParameters.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.FreeBusyResource.t * GapiConversation.Session.t)

end

module Events :
sig
  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:QueryParameters.t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsList.t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.EventsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.EventsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.EventsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.EventsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.EventsResource.t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

  val instances :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsList.t * GapiConversation.Session.t)

  val import :
    ?url:string ->
    ?container_id:string ->
    GapiCalendar.EventsResource.t ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val quickAdd :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val move :
    ?url:string ->
    ?container_id:string ->
    string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

  val reset :
    ?url:string ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (GapiCalendar.EventsResource.t * GapiConversation.Session.t)

end

