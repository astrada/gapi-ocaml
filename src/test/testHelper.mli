module Config :
sig
  type t = (string, string) Hashtbl.t

  val parse : string -> (string, string) Hashtbl.t

  val get : ('a, 'b) Hashtbl.t -> 'a -> 'b

end

val build_client_login_auth :
  Config.t ->
  GdataConfig.auth_config * GdataConversation.Session.auth_context

val build_oauth1_auth :
  Config.t ->
  GdataConfig.auth_config * GdataConversation.Session.auth_context

val build_oauth2_auth :
  Config.t ->
  GdataConfig.auth_config * GdataConversation.Session.auth_context

val test_request :
  ?configfile:string ->
  ?handle_exception:(exn -> unit) ->
  (Config.t ->
     GdataConfig.auth_config * GdataConversation.Session.auth_context) ->
  (GdataConversation.Session.t -> unit) ->
  unit

val test_request_noauth :
  ?configfile:string ->
  ?handle_exception:(exn -> unit) ->
  (Config.t -> GdataConversation.Session.t -> unit) ->
  unit

val print_exception : exn -> unit

val print_xml_data_model :
  ?print_string:(string -> unit) ->
  (GdataCore.Metadata.xml, GdataCore.Value.t)
    GdataCore.AnnotatedTree.t ->
  int

val string_of_xml_data_model :
  (GdataCore.Metadata.xml, GdataCore.Value.t)
    GdataCore.AnnotatedTree.t ->
  string

val assert_false : string -> bool -> unit

val assert_not_empty : string -> string -> unit

val assert_equal_file : string -> string -> unit

