let random_generator =
  lazy
    (Cryptokit.Random.pseudo_rng
       (Cryptokit.Random.string Cryptokit.Random.secure_rng 20))

let encode s = Netencoding.Url.encode ~plus:false s

let generate_signature http_method base_string_uri fields signature_method
    consumer_secret token_secret =
  let generate_signature_base_string parameters =
    let normalized_parameters =
      let encoded_parameters =
        List.map (fun (k, v) -> (encode k, encode v)) parameters
      in
      let sorted_parameters =
        List.sort
          (fun (k1, v1) (k2, v2) ->
            let c = compare k1 k2 in
            if c = 0 then compare v1 v2 else c)
          encoded_parameters
      in
      let field_list = List.map (fun (k, v) -> k ^ "=" ^ v) sorted_parameters in
      String.concat "&" field_list
    in
    let buffer = Buffer.create 64 in
    let add_separator () = Buffer.add_char buffer '&' in
    let add_string s = Buffer.add_string buffer (encode s) in
    Buffer.add_string buffer (GapiCore.HttpMethod.to_string http_method);
    add_separator ();
    add_string base_string_uri;
    add_separator ();
    add_string normalized_parameters;
    Buffer.contents buffer
  in

  let key = encode consumer_secret ^ "&" ^ encode token_secret in
  let signature_base_string = generate_signature_base_string fields in
  (* TODO: RSA-SHA1 *)
  match signature_method with
  | GapiCore.SignatureMethod.HMAC_SHA1 ->
      let hash = Cryptokit.MAC.hmac_sha1 key in
      let _ = hash#add_string signature_base_string in
      let result = hash#result in
      hash#wipe;
      Netencoding.Base64.encode result
  | _ -> assert false

let generate_oauth_header oauth_fields signature =
  let oauth_fields_with_signature =
    ("oauth_signature", signature) :: oauth_fields
  in
  let field_list =
    List.rev_map
      (fun (k, v) -> encode k ^ "=\"" ^ encode v ^ "\"")
      oauth_fields_with_signature
  in
  let field_string = String.concat "," field_list in
  "OAuth " ^ field_string

let oauth_request ?(token_secret = "") http_method url consumer_secret
    oauth_fields_to_sign post_fields_to_sign oauth_signature_method
    parse_response session =
  let signature =
    generate_signature http_method url
      (oauth_fields_to_sign @ post_fields_to_sign)
      oauth_signature_method consumer_secret token_secret
  in
  let oauth_header =
    GapiCore.Header.Authorization
      (generate_oauth_header oauth_fields_to_sign signature)
  in
  let post_data =
    match http_method with
    | GapiCore.HttpMethod.GET | GapiCore.HttpMethod.PUT
    | GapiCore.HttpMethod.PATCH | GapiCore.HttpMethod.DELETE
    | GapiCore.HttpMethod.HEAD ->
        None
    | GapiCore.HttpMethod.POST ->
        Some (GapiCore.PostData.Fields post_fields_to_sign)
  in
  GapiConversation.request ~header_list:[ oauth_header ] ?post_data http_method
    session url parse_response

let build_oauth_fields_to_sign ?oauth_nonce ?oauth_timestamp ?oauth_callback
    ?oauth_token ?oauth_verifier oauth_consumer_key oauth_signature_method =
  let generate_nonce () =
    let hexa_encode s =
      let transform = Cryptokit.Hexa.encode () in
      transform#put_string s;
      transform#finish;
      transform#get_string
    in
    hexa_encode (Cryptokit.Random.string (Lazy.force random_generator) 8)
  in

  let generate_timestamp () =
    String.sub (string_of_float (Unix.time ())) 0 10
  in

  let nonce =
    match oauth_nonce with None -> generate_nonce () | Some n -> n
  in
  let timestamp =
    match oauth_nonce with None -> generate_timestamp () | Some t -> t
  in
  let common_oauth_fields =
    [
      ("oauth_consumer_key", oauth_consumer_key);
      ("oauth_nonce", nonce);
      ( "oauth_signature_method",
        GapiCore.SignatureMethod.to_string oauth_signature_method );
      ("oauth_timestamp", timestamp);
      ("oauth_version", "1.0");
    ]
  in
  let optional_oauth_fields =
    List.fold_left
      (fun fields (k, v) ->
        match v with None -> fields | Some value -> (k, value) :: fields)
      []
      [
        ("oauth_callback", oauth_callback);
        ("oauth_token", oauth_token);
        ("oauth_verifier", oauth_verifier);
      ]
  in
  common_oauth_fields @ optional_oauth_fields

let parse_token_response actions empty_response pipe =
  try
    let line = GapiPipe.OcamlnetPipe.read_line pipe in
    let fields = Netencoding.Url.dest_url_encoded_parameters line in
    List.fold_left
      (fun response (key, value) ->
        let update_response = List.assoc key actions in
        update_response value response)
      empty_response fields
  with End_of_file -> failwith "Invalid response: cannot parse response"

let parse_request_token pipe =
  GapiAuthResponse.OAuth1RequestToken
    (parse_token_response
       [
         ( "oauth_token",
           fun value response ->
             { response with GapiAuthResponse.OAuth1.request_token = value } );
         ( "oauth_token_secret",
           fun value response ->
             {
               response with
               GapiAuthResponse.OAuth1.request_token_secret = value;
             } );
         ( "oauth_callback_confirmed",
           fun value response ->
             {
               response with
               GapiAuthResponse.OAuth1.callback_confirmed = bool_of_string value;
             } );
       ]
       {
         GapiAuthResponse.OAuth1.request_token = "";
         request_token_secret = "";
         callback_confirmed = false;
       }
       pipe)

let parse_access_token pipe =
  GapiAuthResponse.OAuth1GetAccessToken
    (parse_token_response
       [
         ( "oauth_token",
           fun value response ->
             { response with GapiAuthResponse.OAuth1.access_token = value } );
         ( "oauth_token_secret",
           fun value response ->
             {
               response with
               GapiAuthResponse.OAuth1.access_token_secret = value;
             } );
       ]
       { GapiAuthResponse.OAuth1.access_token = ""; access_token_secret = "" }
       pipe)

let parse_token_info pipe =
  let rec parse_next_line response pipe =
    try
      let line = GapiPipe.OcamlnetPipe.read_line pipe in
      let key, value = GapiUtils.divide_string line '=' in
      match key with
      | "Target" ->
          GapiConversation.Continue
            (parse_next_line
               { response with GapiAuthResponse.AuthSub.target = value })
      | "Scope" ->
          GapiConversation.Continue
            (parse_next_line
               { response with GapiAuthResponse.AuthSub.scope = value })
      | "Secure" ->
          GapiConversation.Continue
            (parse_next_line
               {
                 response with
                 GapiAuthResponse.AuthSub.secure = bool_of_string value;
               })
      | _ -> GapiConversation.Error ("Unexpected token info: " ^ key)
    with End_of_file -> GapiConversation.Done response
  in
  GapiAuthResponse.AuthSubTokenInfo
    (GapiConversation.loop
       (parse_next_line
          { GapiAuthResponse.AuthSub.target = ""; scope = ""; secure = false })
       pipe)

let parse_response parse_ok pipe response_code _ session =
  match response_code with
  | 200 -> parse_ok pipe
  | _ -> GapiConversation.parse_error pipe response_code session

(* TODO: oauth_callback "oob" value management *)
(* TODO: scope composition *)
let get_request_token
    ?(url = "https://www.google.com/accounts/OAuthGetRequestToken")
    ?(oauth_signature_method = GapiCore.SignatureMethod.HMAC_SHA1) ?oauth_nonce
    ?oauth_timestamp ?xoauth_displayname ~consumer_secret ~oauth_consumer_key
    ~scope ~oauth_callback session =
  let oauth_fields_to_sign =
    build_oauth_fields_to_sign ?oauth_nonce ?oauth_timestamp ~oauth_callback
      oauth_consumer_key oauth_signature_method
  in
  let post_fields_to_sign =
    ("scope", scope)
    :: GapiUtils.option_map_default
         (fun displayname -> [ ("xoauth_displayname", displayname) ])
         [] xoauth_displayname
  in
  oauth_request GapiCore.HttpMethod.POST url consumer_secret
    oauth_fields_to_sign post_fields_to_sign oauth_signature_method
    (parse_response parse_request_token)
    session

let authorize_token_url
    ?(base_url = "https://www.google.com/accounts/OAuthAuthorizeToken") ?hd ?hl
    ?(mobile = false) request_token =
  let required_field = ("oauth_token", request_token) in
  let optional_fields =
    List.fold_left
      (fun fields (k, v) ->
        match v with None -> fields | Some value -> (k, value) :: fields)
      []
      [
        ("hd", hd); ("hl", hl); ("btmpl", if mobile then Some "mobile" else None);
      ]
  in
  let query_string =
    Netencoding.Url.mk_url_encoded_parameters (required_field :: optional_fields)
  in
  base_url ^ "?" ^ query_string

let get_access_token
    ?(url = "https://www.google.com/accounts/OAuthGetAccessToken")
    ?(oauth_signature_method = GapiCore.SignatureMethod.HMAC_SHA1) ?oauth_nonce
    ?oauth_timestamp ~consumer_secret ~oauth_consumer_key ~oauth_token
    ~oauth_verifier ~oauth_secret session =
  let oauth_fields_to_sign =
    build_oauth_fields_to_sign ?oauth_nonce ?oauth_timestamp ~oauth_token
      ~oauth_verifier oauth_consumer_key oauth_signature_method
  in
  oauth_request ~token_secret:oauth_secret GapiCore.HttpMethod.POST url
    consumer_secret oauth_fields_to_sign [] oauth_signature_method
    (parse_response parse_access_token)
    session

let get_token_info ?(url = "https://www.google.com/accounts/AuthSubTokenInfo")
    ?(oauth_signature_method = GapiCore.SignatureMethod.HMAC_SHA1) ?oauth_nonce
    ?oauth_timestamp ~consumer_secret ~oauth_consumer_key ~oauth_token
    ~oauth_secret session =
  let oauth_fields_to_sign =
    build_oauth_fields_to_sign ?oauth_nonce ?oauth_timestamp ~oauth_token
      oauth_consumer_key oauth_signature_method
  in
  oauth_request ~token_secret:oauth_secret GapiCore.HttpMethod.POST url
    consumer_secret oauth_fields_to_sign [] oauth_signature_method
    (parse_response parse_token_info)
    session

let revoke_token ?(url = "https://www.google.com/accounts/AuthSubRevokeToken")
    ?(oauth_signature_method = GapiCore.SignatureMethod.HMAC_SHA1) ?oauth_nonce
    ?oauth_timestamp ~consumer_secret ~oauth_consumer_key ~oauth_token
    ~oauth_secret session =
  let oauth_fields_to_sign =
    build_oauth_fields_to_sign ?oauth_nonce ?oauth_timestamp ~oauth_token
      oauth_consumer_key oauth_signature_method
  in
  oauth_request ~token_secret:oauth_secret GapiCore.HttpMethod.GET url
    consumer_secret oauth_fields_to_sign [] oauth_signature_method
    (parse_response (fun _ -> ()))
    session
