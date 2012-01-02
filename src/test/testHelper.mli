module Config :
sig
  type t = (string, string) Hashtbl.t

  val parse : string -> (string, string) Hashtbl.t

  val save : (string, string) Hashtbl.t -> string -> unit

  val get : ('a, 'b) Hashtbl.t -> 'a -> 'b

  val set : ('a, 'b) Hashtbl.t -> 'a -> 'b -> unit

end

val build_client_login_auth :
  Config.t ->
  GapiConfig.auth_config * GapiConversation.Session.auth_context

val build_oauth1_auth :
  Config.t ->
  GapiConfig.auth_config * GapiConversation.Session.auth_context

val build_oauth2_auth :
  Config.t ->
  GapiConfig.auth_config * GapiConversation.Session.auth_context

val build_no_auth :
  Config.t ->
  GapiConfig.auth_config * GapiConversation.Session.auth_context

val test_request :
  ?configfile:string ->
  ?handle_exception:(exn -> unit) ->
  (Config.t ->
     GapiConfig.auth_config * GapiConversation.Session.auth_context) ->
  (GapiConversation.Session.t -> unit) ->
  unit

val test_request_noauth :
  ?configfile:string ->
  ?handle_exception:(exn -> unit) ->
  (Config.t -> GapiConversation.Session.t -> unit) ->
  unit

val print_exception : exn -> unit

val print_xml_data_model :
  ?print_string:(string -> unit) ->
  GdataCore.xml_data_model ->
  int

val string_of_xml_data_model :
  GdataCore.xml_data_model ->
  string

val string_of_json_data_model :
  GapiJson.json_data_model ->
  string

val delay : unit -> unit

val assert_false : string -> bool -> unit

val assert_not_empty : string -> string -> unit

val assert_equal_file : string -> string -> unit

val assert_exists : string -> ('a -> bool) -> 'a list -> unit

val assert_not_exists : string -> ('a -> bool) -> 'a list -> unit

