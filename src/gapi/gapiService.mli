(** Common operations for services *)

(** Wraps a server error *)
exception ServiceError of GapiError.RequestError.t

val service_request :
  ?post_data:GapiCore.PostData.t ->
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?request_type:GapiRequest.request_type ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val service_request_with_data :
  GapiRequest.request_type ->
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

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
  ?query_parameters:(string * string) list ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val read :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val update :
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val patch' :
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val delete' :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
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

module type QueryParameters = 
sig
  type t

  val default : t

  val to_key_value_list : t -> (string * string) list

end

val build_param :
  'a -> 'a -> ('a -> 'b) -> ('b -> string) -> string ->
  (string * string) list

module StandardParameters :
sig
  type t = {
    fields : string;
    (** Selector specifying which fields to include in a partial response. *)
    prettyPrint : bool;
    (** Returns response with indentations and line breaks. *)
    quotaUser : string;
    (** Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided. *)
    userIp : string;
    (** IP address of the site where the request originates. Use this if you want to enforce per-user limits. *)
    key : string;
    (** API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. *)
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

module type ServiceConf =
sig
  type resource_list_t
  type resource_t

  val service_url : string

  val parse_resource_list : GapiPipe.OcamlnetPipe.t -> resource_list_t

  val parse_resource : GapiPipe.OcamlnetPipe.t -> resource_t

  val render_resource : resource_t -> GapiCore.PostData.t

  val create_resource_from_id : string -> resource_t

  val get_url :
    ?container_id:string ->
    ?resource:resource_t ->
    string -> string

  val get_etag : resource_t -> string option

end

module type Service =
sig
  type resource_list_t
  type resource_t
  type query_parameters_t

  val list :
    ?url:string ->
    ?etag:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    GapiConversation.Session.t ->
    (resource_list_t * GapiConversation.Session.t)

  val get :
    ?url:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val refresh :
    ?url:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val insert :
    ?url:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val update :
    ?url:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val patch :
    ?url:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (resource_t * GapiConversation.Session.t)

  val delete :
    ?url:string ->
    ?parameters:query_parameters_t ->
    ?container_id:string ->
    resource_t ->
    GapiConversation.Session.t ->
    (unit * GapiConversation.Session.t)

end

val map_standard_parameters :
  StandardParameters.t option ->
  (string * string) list option

module Make :
  functor(S : ServiceConf) ->
  functor(Q : QueryParameters) ->
  Service with type resource_list_t = S.resource_list_t
                and type resource_t = S.resource_t
                and type query_parameters_t = Q.t

val get :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val post :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'b) ->
  GapiConversation.Session.t ->
  'b * GapiConversation.Session.t

val put :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val patch :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val delete :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> unit) ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

