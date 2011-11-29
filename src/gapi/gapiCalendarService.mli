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
      and type query_parameters_t = QueryParameters.t

