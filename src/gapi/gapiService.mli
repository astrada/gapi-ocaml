(** Common operations for services. *)

exception ServiceError of GapiConversation.Session.t * GapiError.RequestError.t
(** Wraps a server error *)

val service_request :
  ?post_data:GapiCore.PostData.t ->
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?media_download:GapiMediaResource.download ->
  ?request_type:GapiRequest.request_type ->
  ?custom_headers:GapiCore.Header.t list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> GapiCore.Header.t list -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val service_request_with_data :
  GapiRequest.request_type ->
  ('a -> GapiCore.PostData.t) ->
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?media_download:GapiMediaResource.download ->
  ?custom_headers:GapiCore.Header.t list ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> GapiCore.Header.t list -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val download_resource :
  ?version:string ->
  ?query_parameters:(string * string) list ->
  ?ranges:(int64 option * int64 option) list ->
  ?custom_headers:GapiCore.Header.t list ->
  string ->
  GapiMediaResource.destination ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val build_param :
  'a -> 'a -> ('a -> 'b) -> ('b -> string) -> string -> (string * string) list

val build_params :
  'a -> ('a -> 'b list) -> ('b -> string) -> string -> (string * string) list

module StandardParameters : sig
  type t = {
    alt : string;  (** Data format for the response. *)
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

  val merge_parameters : ?standard_parameters:t -> unit -> t option
end

val head :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_download:GapiMediaResource.download ->
  ?custom_headers:GapiCore.Header.t list ->
  string ->
  (GapiCore.Header.t list -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val get :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_download:GapiMediaResource.download ->
  ?custom_headers:GapiCore.Header.t list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val post :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?media_download:GapiMediaResource.download ->
  ?data_to_post:('a -> GapiCore.PostData.t) ->
  ?custom_headers:GapiCore.Header.t list ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'b) ->
  GapiConversation.Session.t ->
  'b * GapiConversation.Session.t

val put :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?custom_headers:GapiCore.Header.t list ->
  data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val put' :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?custom_headers:GapiCore.Header.t list ->
  data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'b) ->
  GapiConversation.Session.t ->
  'b * GapiConversation.Session.t

val patch :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?custom_headers:GapiCore.Header.t list ->
  data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val patch' :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  ?custom_headers:GapiCore.Header.t list ->
  data_to_post:('a -> GapiCore.PostData.t) ->
  data:'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'b) ->
  GapiConversation.Session.t ->
  'b * GapiConversation.Session.t

val delete :
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  ?custom_headers:GapiCore.Header.t list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t
