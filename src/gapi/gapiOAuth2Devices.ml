module AuthorizationCode =
struct
  exception RateLimitExceeded

  type t = {
    device_code : string;
    user_code : string;
    verification_url : string;
    expires_in : int;
    interval : int;
  }

  let device_code = {
    GapiLens.get = (fun x -> x.device_code);
    GapiLens.set = (fun v x -> { x with device_code = v })
  }
  let user_code = {
    GapiLens.get = (fun x -> x.user_code);
    GapiLens.set = (fun v x -> { x with user_code = v })
  }
  let verification_url = {
    GapiLens.get = (fun x -> x.verification_url);
    GapiLens.set = (fun v x -> { x with verification_url = v })
  }
  let expires_in = {
    GapiLens.get = (fun x -> x.expires_in);
    GapiLens.set = (fun v x -> { x with expires_in = v })
  }
  let interval = {
    GapiLens.get = (fun x -> x.interval);
    GapiLens.set = (fun v x -> { x with interval = v })
  }

  let empty = {
    device_code = "";
    user_code = "";
    verification_url = "";
    expires_in = 0;
    interval = 0;
  }

  let render_content x = 
    [GapiJson.render_string_value "device_code" x.device_code;
     GapiJson.render_string_value "user_code" x.user_code;
     GapiJson.render_string_value "verification_url" x.verification_url;
     GapiJson.render_int_value "expires_in" x.expires_in;
     GapiJson.render_int_value "interval" x.interval;
    ]
  let render x = 
    GapiJson.render_object "" (render_content x)

  let parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "device_code"; data_type = GapiJson.Scalar },
         `String v) ->
      { x with device_code = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "user_code"; data_type = GapiJson.Scalar },
         `String v) ->
      { x with user_code = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verification_url"; data_type = GapiJson.Scalar },
         `String v) ->
      { x with verification_url = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expires_in"; data_type = GapiJson.Scalar },
         `Int v) ->
      { x with expires_in = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "interval"; data_type = GapiJson.Scalar },
         `Int v) ->
      { x with interval = v }
    | e ->
      GapiJson.unexpected "GapiOAuth2Devices.AuthorizationCode.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

  type error_response = {
    error_code : string;
  }

  let error_response = {
    GapiLens.get = (fun x -> x.error_code);
    GapiLens.set = (fun v x -> { error_code = v })
  }

  let parse_error_response x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "error_code"; data_type = GapiJson.Scalar },
         `String v) ->
      { error_code = v }
    | e ->
      GapiJson.unexpected
        "GapiOAuth2Devices.AuthorizationCode.parse_error_response" e x
end

let parse_error_response pipe response_code =
  let error_response =
    GapiJson.parse_json_response
      (GapiJson.parse_root AuthorizationCode.parse_error_response
         { AuthorizationCode.error_code = "" }) pipe in
  let error_code = error_response.AuthorizationCode.error_code in
  if error_code = "rate_limit_exceeded" then
    raise AuthorizationCode.RateLimitExceeded
  else
    failwith (
      Printf.sprintf "OAuth2 for devices error: %s (HTTP response code: %d)"
        error_code
        response_code)

let parse_success_response =
  GapiJson.parse_json_response AuthorizationCode.of_data_model

let parse_response parse_ok pipe response_code _ _ =
  match response_code with
  | 200 ->
    parse_ok pipe
  | _ ->
    parse_error_response pipe response_code

let request_code
  ?(url = "https://accounts.google.com/o/oauth2/device/code")
  ~client_id
  ~scope
  session =
  let scope_string = String.concat " " scope in
  let fields =
    [("client_id", client_id);
     ("scope", scope_string);
     ] in
  let post_data = GapiCore.PostData.Fields fields in
  GapiConversation.request
    ~post_data
    GapiCore.HttpMethod.POST
    session
    url
    (parse_response parse_success_response)

exception AccessDenied of GapiConversation.Session.t
exception AuthorizationPending of GapiConversation.Session.t
exception SlowDown of GapiConversation.Session.t
exception InvalidClient of GapiConversation.Session.t
exception InvalidGrant of GapiConversation.Session.t
exception InvalidRequest of GapiConversation.Session.t
exception UnsupportedGrantType of GapiConversation.Session.t

type authorization_error = {
  error : string;
  error_description : string;
}

let error = {
  GapiLens.get = (fun x -> x.error);
  GapiLens.set = (fun v x -> { x with error = v })
}
let error_description = {
  GapiLens.get = (fun x -> x.error_description);
  GapiLens.set = (fun v x -> { x with error_description = v })
}

let parse_authorization_error x = function
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "error"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with error = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "error_description"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with error_description = v }
  | e ->
    GapiJson.unexpected
      "GapiOAuth2Devices.parse_authorization_error" e x

let parse_authorization_error_response pipe response_code session =
  let error_response =
    GapiJson.parse_json_response
      (GapiJson.parse_root parse_authorization_error
         { error = ""; error_description= "" }) pipe in
  match error_response.error with
  | "access_denied" -> raise (AccessDenied session)
  | "authorization_pending" -> raise (AuthorizationPending session)
  | "slow_down" -> raise (SlowDown session)
  | "invalid_client" -> raise (InvalidClient session)
  | "invalid_grant" -> raise (InvalidGrant session)
  | "invalid_request" -> raise (InvalidRequest session)
  | "unsupported_grant_type" -> raise (UnsupportedGrantType session)
  | e ->
    failwith (
      Printf.sprintf "OAuth2 for devices error: %s (HTTP response code: %d)"
        e
        response_code)

let parse_authorization_response parse_ok pipe response_code _ session =
  match response_code with
  | 200 ->
    parse_ok pipe
  | _ ->
    parse_authorization_error_response pipe response_code session

let get_access_token
    ?(url = "https://www.googleapis.com/oauth2/v4/token")
    ?(grant_type = "http://oauth.net/grant_type/device/1.0")
    ~client_id
    ~client_secret
    ~device_code
    session =
  let fields =
    [("client_id", client_id);
     ("client_secret", client_secret);
     ("code", device_code);
     ("grant_type", grant_type);
     ] in
  let post_data = GapiCore.PostData.Fields fields in
  GapiConversation.request
    ~post_data
    GapiCore.HttpMethod.POST
    session
    url
    (parse_authorization_response GapiOAuth2.parse_token_info)

let poll_authorization_server
    ?(url = "https://www.googleapis.com/oauth2/v4/token")
    ?(grant_type = "http://oauth.net/grant_type/device/1.0")
    ~client_id
    ~client_secret
    ~authorization_code
    session =
  let expires_in =
    float_of_int authorization_code.AuthorizationCode.expires_in in
  let interval =
    float_of_int authorization_code.AuthorizationCode.interval in
  let device_code = authorization_code.AuthorizationCode.device_code in
  let start_time = Sys.time () in
  let rec loop session =
    let current_time = Sys.time () in
    if current_time > start_time +. expires_in then
      raise (InvalidGrant session)
    else
      try
        get_access_token
          ~url
          ~grant_type
          ~client_id
          ~client_secret
          ~device_code
          session
      with
      | AuthorizationPending session ->
        Thread.delay interval;
        loop session
      | e -> raise e
  in
  loop session

