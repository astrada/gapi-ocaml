(** Defines the session that stores the current state of a conversation.
  *)

module Session :
sig
  type oauth1_context = {
    token : string;
    secret : string;
  }

  val token : (oauth1_context, string) GapiLens.t
  val secret : (oauth1_context, string) GapiLens.t

  type oauth2_context = {
    oauth2_token : string;
    refresh_token : string;
  }

  val oauth2_token : (oauth2_context, string) GapiLens.t
  val refresh_token : (oauth2_context, string) GapiLens.t

  type auth_context =
      NoAuth
    | ClientLogin of string
    | OAuth1 of oauth1_context
    | OAuth2 of oauth2_context

  type t = {
    curl : [ `Created ] GapiCurl.t;
    config : GapiConfig.t;
    auth : auth_context;
    cookies : string list;
    etag : string;
  }

  val curl : (t, [ `Created ] GapiCurl.t) GapiLens.t
  val config : (t, GapiConfig.t) GapiLens.t
  val auth : (t, auth_context) GapiLens.t
  val cookies : (t, string list) GapiLens.t
  val etag : (t, string) GapiLens.t

end

val request :
  ?header_list:GapiCore.Header.t list ->
  ?post_data:GapiCore.PostData.t ->
  GapiCore.HttpMethod.t ->
  Session.t ->
  string ->
  (GapiPipe.OcamlnetPipe.t ->
     int ->
     GapiCore.Header.t list ->
     Session.t ->
     'a) ->
  'a * Session.t

val with_session :
  ?auth_context:Session.auth_context ->
  GapiConfig.t -> [ `Initialized ] GapiCurl.t -> (Session.t -> 'a) -> 'a

val read_all : GapiPipe.OcamlnetPipe.t -> string

val parse_error : GapiPipe.OcamlnetPipe.t -> int -> 'a

exception ConversationException of string

type ('a, 'b) iter =
    Done of 'b
  | Continue of ('a -> ('a, 'b) iter)
  | Error of string

val loop : ('a -> ('a, 'b) iter) -> 'a -> 'b

