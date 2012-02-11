(** Server conversation manager. *)

(** Defines the session that stores the current state of a conversation.
  *)
module Session :
sig
  (** Current OAuth1 context. *)
  type oauth1_context = {
    token : string;
    (** OAuth1 authorized token. *)
    secret : string;
    (** OAuth1 secret associated with the authorized token. *)
  }

  val token : (oauth1_context, string) GapiLens.t
  (** OAuth1 token lens. *)
  val secret : (oauth1_context, string) GapiLens.t
  (** OAuth1 secret lens. *)

  (** Current OAuth2 context. *)
  type oauth2_context = {
    oauth2_token : string;
    (** OAuth2 authorized token. *)
    refresh_token : string;
    (** OAuth2 refresh token. *)
  }

  val oauth2_token : (oauth2_context, string) GapiLens.t
  (** OAuth2 token lens. *)
  val refresh_token : (oauth2_context, string) GapiLens.t
  (** OAuth2 refresh token lens. *)

  (** Current authorization context. *)
  type auth_context =
      NoAuth
      (** No authorization. *)
    | ClientLogin of string
      (** Client Login authorized token. *)
    | OAuth1 of oauth1_context
      (** OAuth1 context. *)
    | OAuth2 of oauth2_context
      (** OAuth2 context. *)

  val no_auth : (auth_context, unit option) GapiLens.t
  (** No authorization lens. *)
  val client_login : (auth_context, string option) GapiLens.t
  (** Client Login token lens. *)
  val oauth1 : (auth_context, oauth1_context option) GapiLens.t
  (** OAuth1 context lens. *)
  val oauth2 : (auth_context, oauth2_context option) GapiLens.t
  (** OAuth2 context lens. *)

  (** Session type. *)
  type t = {
    curl : [ `Created ] GapiCurl.t;
    (** Curl state. *)
    config : GapiConfig.t;
    (** Library configuration. *)
    auth : auth_context;
    (** Current authorization context. *)
    cookies : string list;
    (** Cookies received from the server. *)
    etag : string;
    (** Current resource ETag (received from the server). *)
  }

  val curl : (t, [ `Created ] GapiCurl.t) GapiLens.t
  (** Curl state lens. *)
  val config : (t, GapiConfig.t) GapiLens.t
  (** Configuration lens. *)
  val auth : (t, auth_context) GapiLens.t
  (** Authorization lens. *)
  val cookies : (t, string list) GapiLens.t
  (** Cookies lens. *)
  val etag : (t, string) GapiLens.t
  (** ETag lens. *)

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

(** Initializes a new session and executes a batch of requests to the server.

 [with_session config curl interact] initializes a new session using [config] as configuration and [curl] as the initialized Ocurl wrapper, and executes [interact] in the context of the created session. Then it disposes the session, and returns the result of [interact].

 @param auth_context Optional current authorization context. Defaults to [NoAuth].
 *)
val with_session :
  ?auth_context:Session.auth_context ->
  GapiConfig.t -> [ `Initialized ] GapiCurl.t -> (Session.t -> 'a) -> 'a

(** Initializes a new connection to the server and executes a batch of requests.

 [with_curl config interact] initializes a new connection using [config] as configuration, and executes [interact] in the context of the created connection. Then it disposes the connection, and returns the result of [interact].

 @param auth_context Optional current authorization context. Defaults to [NoAuth].
 *)
val with_curl :
  ?auth_context:Session.auth_context ->
  GapiConfig.t -> (Session.t -> 'a) -> 'a

val read_all : GapiPipe.OcamlnetPipe.t -> string

val parse_error : GapiPipe.OcamlnetPipe.t -> int -> 'a

exception ConversationException of string

type ('a, 'b) iter =
    Done of 'b
  | Continue of ('a -> ('a, 'b) iter)
  | Error of string

val loop : ('a -> ('a, 'b) iter) -> 'a -> 'b

