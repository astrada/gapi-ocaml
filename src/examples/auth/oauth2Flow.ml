let test_config = Config.parse "examples/auth/auth.config"
let get = Config.get test_config
let client_id = get "oa2_id"
let client_secret = get "oa2_secret"
let redirect_uri = get "oa2_uri"

let get_access_token code (cgi : Netcgi.cgi_activation) =
  Common.do_request
    (fun session ->
       let (response, _) =
         GapiOAuth2.get_access_token
           ~client_id
           ~client_secret
           ~code
           ~redirect_uri
           session in
       let output =
         match response with
             GapiAuthResponse.OAuth2AccessToken token ->
               Printf.sprintf "access_token=%s; token_type=%s; expires_in=%d; refresh_token=%s\n"
                 token.GapiAuthResponse.OAuth2.access_token
                 token.GapiAuthResponse.OAuth2.token_type
                 token.GapiAuthResponse.OAuth2.expires_in
                 token.GapiAuthResponse.OAuth2.refresh_token
           | _ -> failwith "Not supported OAuth2 response"
       in
         Common.output_page "OAuth2 Flow" "Success" output cgi)

let oauth2_callback (cgi : Netcgi.cgi_activation) =
  let error = cgi#argument_value "error" in
  let code = cgi#argument_value "code" in
    if error <> "" then
      Common.output_error_page "OAuth2 Flow" error cgi
    else
      get_access_token code cgi

let main () =
  let url = GapiOAuth2.authorization_code_url
              ~redirect_uri
              ~scope:[GapiCalendarV3Service.scope;
                      GapiPlusV1Service.scope;
                      GapiTasksV1Service.scope]
              ~response_type:"code"
              client_id in
    print_endline ("Open this URL in a web browser:\n" ^ url);
    Common.start_netplex oauth2_callback

let _ =
  Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
  main ()

