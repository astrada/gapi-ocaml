val authorization_code_url :
  ?base_url:string ->
  redirect_uri:string ->
  scope:string ->
  response_type:string ->
  string ->
  string

val get_access_token :
  ?url:string ->
  ?grant_type:string ->
  client_id:string ->
  client_secret:string ->
  code:string ->
  redirect_uri:string ->
  GdataConversation.Session.t ->
  GdataAuthResponse.t * GdataConversation.Session.t

val refresh_access_token :
  ?url:string ->
  ?grant_type:string ->
  client_id:string ->
  client_secret:string ->
  refresh_token:string ->
  GdataConversation.Session.t ->
  GdataAuthResponse.t * GdataConversation.Session.t

