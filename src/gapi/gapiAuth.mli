(** Stores data used to authorize requests.
  *)

type oauth1_data =
    { signature_method : GapiCore.SignatureMethod.t;
      consumer_key : string;
      consumer_secret : string;
      token : string;
      secret : string }

type oauth1_params =
    { http_method : GapiCore.HttpMethod.t;
      url : string;
      post_fields_to_sign : (string * string) list }

type oauth2_data =
    { client_id : string;
      client_secret : string;
      oauth2_token : string;
      refresh_token : string;
      refresh_access_token : (unit -> string) option }

type authentication =
    NoAuth
  | ClientLogin of string
  | OAuth1 of oauth1_data
  | OAuth2 of oauth2_data

val generate_authorization_header :
      ?oauth1_params:oauth1_params ->
      authentication ->
      string option

