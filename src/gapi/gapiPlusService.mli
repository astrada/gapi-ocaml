module PlusParameters :
sig
  type t = {
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    query : string;
    language : string;
    maxResults : int;
    orderBy : string;
    pageToken : string
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

module ActivitiesResource :
sig
  val list :
    ?url:string ->
    ?parameters:PlusParameters.t ->
    ?user_id:string ->
    ?collection:string ->
    GapiConversation.Session.t ->
    GapiPlus.ActivityFeed.t * GapiConversation.Session.t

  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    GapiPlus.Activity.t * GapiConversation.Session.t

  val search :
    ?url:string ->
    PlusParameters.t ->
    GapiConversation.Session.t ->
    GapiPlus.ActivityFeed.t * GapiConversation.Session.t

end

