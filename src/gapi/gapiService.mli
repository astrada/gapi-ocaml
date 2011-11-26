val query :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val create :
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val read :
  ?version:string ->
  ?etag:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val update :
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  ?etag:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val patch :
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  ?etag:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val delete :
  ?version:string ->
  ?etag:string ->
  string ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val batch_request :
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

module type QUERYPARAMETERS = 
sig
  type t

  val default : t

  val to_key_value_list : t -> (string * string) list

end

module type SERVICECONF =
sig
  type resource_list_t
  type resource_t

  val service_url : string

  val parse_resource_list : GapiPipe.OcamlnetPipe.t -> resource_list_t

  val parse_resource : GapiPipe.OcamlnetPipe.t -> resource_t

  val render_resource : resource_t -> GapiCore.PostData.t

  val create_resource_from_id : string -> resource_t

  val get_url : resource_t -> string -> string

  val get_etag : resource_t -> string option

end

module type SERVICE =
sig
  type resource_list_t
  type resource_t
  type query_parameters_t

  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:query_parameters_t ->
    GapiConversation.Session.t ->
    (resource_list_t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    string ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    string ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

module Make :
  functor(S : SERVICECONF) ->
  functor(Q : QUERYPARAMETERS) ->
  SERVICE with type resource_list_t = S.resource_list_t
                and type resource_t = S.resource_t
                and type query_parameters_t = Q.t

