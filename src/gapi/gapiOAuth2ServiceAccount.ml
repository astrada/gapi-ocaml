let parse_response parse_ok pipe response_code _ _ =
  match response_code with
  | 200 -> parse_ok pipe
  | _ -> GapiOAuth2.parse_error pipe response_code

let oauth_request url jwt_token parse_response session =
  let fields =
    [
      ("grant_type", "urn:ietf:params:oauth:grant-type:jwt-bearer");
      ("assertion", jwt_token);
    ]
  in
  let post_data = GapiCore.PostData.Fields fields in
  GapiConversation.request ~post_data GapiCore.HttpMethod.POST session url
    parse_response

let get_access_token ?(url = "https://www.googleapis.com/oauth2/v4/token")
    ?assertion_timestamp ?assertion_expiration ?user_to_impersonate
    ~service_account_credentials_json ~scopes session =
  let module Credentials = GapiServiceAccountCredentials in
  let module Claim = GapiJwtServiceAccount.JwtClaim in
  let module Jwt = GapiJwtServiceAccount in
  let service_account_credentials =
    Credentials.parse_json service_account_credentials_json
  in
  let private_key = service_account_credentials.Credentials.private_key in
  let iss = service_account_credentials.Credentials.client_email in
  let scope = String.concat " " scopes in
  let aud = url in
  let iat =
    match assertion_timestamp with
    | None -> Unix.gettimeofday ()
    | Some iat -> iat
  in
  let exp =
    match assertion_expiration with None -> iat +. 3600.0 | Some exp -> exp
  in
  let sub = match user_to_impersonate with None -> "" | Some sub -> sub in
  let jwt_claim = { Claim.iss; scope; aud; exp; iat; sub } in
  let encoded_jwt_claim = Jwt.get_encoded_claim jwt_claim in
  let signature = Jwt.get_signature encoded_jwt_claim private_key in
  let jwt_token = Jwt.get_jwt_token encoded_jwt_claim signature in
  oauth_request url jwt_token
    (parse_response GapiOAuth2.parse_token_info)
    session
