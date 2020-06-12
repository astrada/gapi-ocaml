let authorization_code_url
      ?(base_url = "https://accounts.google.com/o/oauth2/auth")
      ?(access_type = "offline")
      ?(approval_prompt = "force")
      ?state
      ~redirect_uri
      ~scope
      ~response_type
      client_id =
  let scope_param =
    GapiUtils.option_map_default (fun s -> [("state", s)]) [] state in
  let scope_string = String.concat " " scope in
  let fields =
    [("client_id", client_id);
     ("redirect_uri", redirect_uri);
     ("scope", scope_string);
     ("response_type", response_type);
     ("access_type", access_type);
     ("approval_prompt", approval_prompt)]
    @ scope_param in
  let query_string = Netencoding.Url.mk_url_encoded_parameters fields in
    base_url ^ "?" ^ query_string

let parse_token_info pipe =
  let response = GapiConversation.read_all pipe in
  let json = Yojson.Safe.from_string response in
    match json with
        `Assoc xs ->
          let table = Hashtbl.create 4 in
          let () = List.iter (fun (n, v) -> Hashtbl.add table n v) xs in
          let parse_string n =
            match Hashtbl.find table n with
                `String s -> s
              | _ ->
                  failwith (Printf.sprintf "Unable to parse %s in response: %s"
                              n response) in
          let access_token = parse_string "access_token" in
          let token_type = parse_string "token_type" in
          let expires_in =
            match Hashtbl.find table "expires_in" with
                `Int i -> i
              | _ ->
                  failwith
                    ("Unable to parse expires_in in response: " ^ response) in
          let refresh_token =
            try
              parse_string "refresh_token"
            with Not_found -> ""
          in
            GapiAuthResponse.OAuth2AccessToken
              { GapiAuthResponse.OAuth2.access_token;
                token_type;
                expires_in;
                refresh_token;
              }
      | _ ->
          failwith ("Unexpected access token response: " ^ response)

let parse_error pipe response_code =
  let response = GapiConversation.read_all pipe in
  let error_message =
    try
      let json = Yojson.Safe.from_string response in
        match json with
            `Assoc [("error", `String e)] -> e
          | _ ->
              failwith ("Unexpected error response: " ^ response)
    with Yojson.Json_error _ ->
      response
  in
    failwith (Printf.sprintf "OAuth2 error: %s (HTTP response code: %d)"
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

let revoke_token
      ?(url = "https://accounts.google.com/o/oauth2/revoke")
      ~refresh_token
      session =
  let query_string = Netencoding.Url.encode refresh_token in
  let url' = Printf.sprintf "%s?token=%s" url query_string in
    GapiConversation.request
      GapiCore.HttpMethod.GET
      session
      url'
      (parse_response (fun _ -> ()))

