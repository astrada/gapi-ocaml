val generate_signature :
  GdataCore.HttpMethod.t ->
  string ->
  (string * string) list ->
  GdataCore.SignatureMethod.t ->
  string ->
  string ->
  string

val generate_oauth_header : (string * string) list -> string -> string

val build_oauth_fields_to_sign :
  ?oauth_nonce:string ->
  ?oauth_timestamp:'a ->
  ?oauth_callback:string ->
  ?oauth_token:string ->
  ?oauth_verifier:string ->
  string ->
  GdataCore.SignatureMethod.t ->
  (string * string) list

val get_request_token :
  ?url:string ->
  ?oauth_signature_method:GdataCore.SignatureMethod.t ->
  ?oauth_nonce:string ->
  ?oauth_timestamp:'a ->
  ?xoauth_displayname:string ->
  consumer_secret:string ->
  oauth_consumer_key:string ->
  scope:string ->
  oauth_callback:string ->
  GdataConversation.Session.t ->
  GdataAuthResponse.t * GdataConversation.Session.t

val authorize_token_url :
  ?base_url:string ->
  ?hd:string -> ?hl:string -> ?mobile:bool -> string -> string

val get_access_token :
  ?url:string ->
  ?oauth_signature_method:GdataCore.SignatureMethod.t ->
  ?oauth_nonce:string ->
  ?oauth_timestamp:'a ->
  consumer_secret:string ->
  oauth_consumer_key:string ->
  oauth_token:string ->
  oauth_verifier:string ->
  oauth_secret:string ->
  GdataConversation.Session.t ->
  GdataAuthResponse.t * GdataConversation.Session.t

val get_token_info :
  ?url:string ->
  ?oauth_signature_method:GdataCore.SignatureMethod.t ->
  ?oauth_nonce:string ->
  ?oauth_timestamp:'a ->
  consumer_secret:string ->
  oauth_consumer_key:string ->
  oauth_token:string ->
  oauth_secret:string ->
  GdataConversation.Session.t ->
  GdataAuthResponse.t * GdataConversation.Session.t

val revoke_token :
  ?url:string ->
  ?oauth_signature_method:GdataCore.SignatureMethod.t ->
  ?oauth_nonce:string ->
  ?oauth_timestamp:'a ->
  consumer_secret:string ->
  oauth_consumer_key:string ->
  oauth_token:string ->
  oauth_secret:string ->
  GdataConversation.Session.t ->
  unit * GdataConversation.Session.t

