(** Ocurl wrapper module.
  *)

type curl_context

type 'a t =
    Initialized
  | Created of curl_context
  | Destroyed
  | Uninitialized

val global_init : unit -> [ `Initialized ] t

val init :
  ?debug_function:(Curl.t -> Curl.curlDebugType -> string -> unit) ->
  ?timeout:int ->
  ?connect_timeout:int ->
  ?follow_location:bool ->
  ?compress:bool ->
  ?max_send_speed:int64 ->
  ?max_recv_speed:int64 ->
  ?low_speed_limit:int ->
  ?low_speed_time:int ->
  ?no_signal:bool ->
  ?options:Curl.curlOption list ->
  [ `Initialized ] t ->
  [ `Created ] t

val set_options : Curl.curlOption list -> [ `Created ] t -> unit

val set_writefunction : (string -> int) -> [ `Created ] t -> unit

val set_headerfunction : (string -> int) -> [ `Created ] t -> unit

val set_httpheader : GapiCore.Header.t list -> [ `Created ] t -> unit

val set_httpget : bool -> [ `Created ] t -> unit

val set_post : bool -> [ `Created ] t -> unit

val set_nobody : bool -> [ `Created ] t -> unit

val set_upload : bool -> [ `Created ] t -> unit

val set_httpbody : GapiCore.PostData.body -> [ `Created ] t -> unit

val set_customrequest : string -> [ `Created ] t -> unit

val set_postfields : (string * string) list -> [ `Created ] t -> unit

val set_useragent : string -> [ `Created ] t -> unit

val set_cookies : string list -> [ `Created ] t -> unit

val reset_all_cookies : [ `Created ] t -> unit

val reset_session_cookies : [ `Created ] t -> unit

val perform : string -> [ `Created ] t -> unit

val get_error_buffer : [ `Created ] t -> string

val get_responsecode : [ `Created ] t -> int

val cleanup : [ `Created ] t -> [ `Destroyed ] t

val global_cleanup : [ `Initialized ] t -> [ `Uninitialized ] t

val string_of_curl_info_type : Curl.curlDebugType -> string

