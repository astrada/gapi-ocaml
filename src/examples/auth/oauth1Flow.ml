let test_config = Config.parse "config/auth.config"
let get = Config.get test_config
let xoauth_displayname = get "oa1_displayname"
let consumer_secret = get "oa1_cons_secret"
let oauth_consumer_key = get "oa1_cons_key"
let oauth_callback = get "oa1_callback"

let get_access_token
      oauth_token
      oauth_secret
      oauth_verifier
      (cgi : Netcgi.cgi_activation) =
  Common.do_request
    (fun session ->
       try
         let (response, _) =
           GapiOAuth1.get_access_token
             ~consumer_secret
             ~oauth_consumer_key
             ~oauth_token
             ~oauth_verifier
             ~oauth_secret
             session in
         let output =
           match response with
               GapiAuthResponse.OAuth1GetAccessToken token ->
                 Printf.sprintf "oauth_token=%s; oauth_token_secret=%s\n"
                   token.GapiAuthResponse.OAuth1.access_token
                   token.GapiAuthResponse.OAuth1.access_token_secret
             | _ -> failwith "Not supported OAuth1 response"
         in
           Common.output_page "OAuth1 Flow" "Success" output cgi
       with Failure error ->
         Common.output_error_page "OAuth1 Flow" error cgi)

let oauth1_callback
      oauth_secret
      (cgi : Netcgi.cgi_activation) =
  let oauth_token = cgi#argument_value "oauth_token" in
  let oauth_verifier = cgi#argument_value "oauth_verifier" in
    get_access_token oauth_token oauth_secret oauth_verifier cgi

let get_request_token () =
  Common.do_request
    (fun session ->
       let (response, _) =
         GapiOAuth1.get_request_token
           ~xoauth_displayname
           ~consumer_secret
           ~oauth_consumer_key
           ~scope:"http://www.google.com/calendar/feeds"
           ~oauth_callback
           session in
       let (token, secret) =
         match response with
             GapiAuthResponse.OAuth1RequestToken token ->
               (token.GapiAuthResponse.OAuth1.request_token,
                token.GapiAuthResponse.OAuth1.request_token_secret)
           | _ -> failwith "Not supported OAuth1 response" in
       let url = GapiOAuth1.authorize_token_url
                   ~hd:"default"
                   ~hl:"en"
                   token in
         print_endline ("Open this URL in a web browser:\n" ^ url);
         Common.start_netplex (oauth1_callback secret))

let main () =
    get_request_token ()

let _ =
  Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
  main ()

