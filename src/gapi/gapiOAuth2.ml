let authorization_code_url
      ?(base_url = "https://accounts.google.com/o/oauth2/auth")
      ?(access_type = "offline")
      ?(approval_prompt = "force")
      ~redirect_uri
      ~scope
      ~response_type
      client_id =
  let fields =
    [("client_id", client_id);
     ("redirect_uri", redirect_uri);
     ("scope", scope);
     ("response_type", response_type);
     ("access_type", access_type);
     ("approval_prompt", approval_prompt)] in
  let query_string = Netencoding.Url.mk_url_encoded_parameters fields in
    base_url ^ "?" ^ query_string

let parse_token_info pipe =
  let response = GapiConversation.read_all pipe in
  let json = Json_io.json_of_string response in
  let table = Json_type.Browse.make_table (Json_type.Browse.objekt json) in
    GapiAuthResponse.OAuth2AccessToken
      { GapiAuthResponse.OAuth2.access_token =
          Json_type.Browse.string (Json_type.Browse.field table "access_token");
        GapiAuthResponse.OAuth2.token_type =
          Json_type.Browse.string (Json_type.Browse.field table "token_type");
        GapiAuthResponse.OAuth2.expires_in =
          Json_type.Browse.int (Json_type.Browse.field table "expires_in");
        GapiAuthResponse.OAuth2.refresh_token =
          Json_type.Browse.string (
            Option.default
              (Json_type.Build.string "")
              (Json_type.Browse.optfield table "refresh_token"))
      }

let parse_error pipe response_code =
  let response = GapiConversation.read_all pipe in
  let json = Json_io.json_of_string response in
  let table = Json_type.Browse.make_table (Json_type.Browse.objekt json) in
  let error_message = Json_type.Browse.string
                        (Json_type.Browse.field table "error") in
    failwith (Printf.sprintf "Error: %s (HTTP response code: %d)"
                error_message
                response_code)

let parse_response parse_ok pipe response_code _ _ =
  match response_code with
      200 ->
        parse_ok pipe
    | _ ->
        parse_error pipe response_code

(* TODO: refactor *)
let encode s =
  Netencoding.Url.encode ~plus:false s

let generate_oauth_header oauth_token =
  "Authorization: OAuth " ^ (encode oauth_token)

let oauth_request
      ?code
      ?redirect_uri
      ?refresh_token
      url
      client_id
      client_secret
      grant_type
      parse_response
      session =
  let required_field =
    [("client_id", client_id);
     ("client_secret", client_secret);
     ("grant_type", grant_type)] in
  let optional_fields =
    List.fold_left
      (fun fields (k, v) ->
         match v with
             None -> fields
           | Some value -> (k, value) :: fields
      )
      []
      [("code", code);
       ("redirect_uri", redirect_uri);
       ("refresh_token", refresh_token)] in
  let post_data = GapiCore.PostData.Fields (required_field @ optional_fields) in
    GapiConversation.request
      ~post_data
      GapiCore.HttpMethod.POST
      session
      url
      parse_response

let get_access_token
      ?(url = "https://accounts.google.com/o/oauth2/token")
      ?(grant_type = "authorization_code")
      ~client_id
      ~client_secret
      ~code
      ~redirect_uri
      session =
  oauth_request
    ~code
    ~redirect_uri
    url
    client_id
    client_secret
    grant_type
    (parse_response parse_token_info)
    session

let refresh_access_token
      ?(url = "https://accounts.google.com/o/oauth2/token")
      ?(grant_type = "refresh_token")
      ~client_id
      ~client_secret
      ~refresh_token
      session =
  oauth_request
    ~refresh_token
    url
    client_id
    client_secret
    grant_type
    (parse_response parse_token_info)
    session

