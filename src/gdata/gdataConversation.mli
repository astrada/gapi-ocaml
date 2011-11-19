module Session :
sig
  type oauth1_context =
      { token : string;
        secret : string }

  type oauth2_context =
      { oauth2_token : string;
        refresh_token : string }

  type auth_context =
      NoAuth
    | ClientLogin of string
    | OAuth1 of oauth1_context
    | OAuth2 of oauth2_context

  type t =
      { curl : [ `Created ] GdataCurl.t;
        config : GdataConfig.t;
        auth : auth_context;
        cookies : string list;
        etag : string }

end

val request :
  ?header_list:GapiCore.Header.t list ->
  ?post_data:GapiCore.PostData.t ->
  GapiCore.HttpMethod.t ->
  Session.t ->
  string ->
  (GdataPipe.OcamlnetPipe.t ->
     int ->
     GapiCore.Header.t list ->
     Session.t ->
     'a) ->
  'a * Session.t

val with_session :
  ?auth_context:Session.auth_context ->
  GdataConfig.t -> [ `Initialized ] GdataCurl.t -> (Session.t -> 'a) -> 'a

val read_all : GdataPipe.OcamlnetPipe.t -> string

val parse_error : GdataPipe.OcamlnetPipe.t -> int -> 'a

exception ConversationException of string

type ('a, 'b) iter =
    Done of 'b
  | Continue of ('a -> ('a, 'b) iter)
  | Error of string

val loop : ('a -> ('a, 'b) iter) -> 'a -> 'b

