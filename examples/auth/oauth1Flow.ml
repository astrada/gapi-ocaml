(* Load the configuration file and read the OAuth1 values *)
let test_config = Config.parse ()
let get = Config.get test_config
let xoauth_displayname = get "oa1_displayname"
let consumer_secret = get "oa1_cons_secret"
let oauth_consumer_key = get "oa1_cons_key"
let oauth_callback = get "oa1_callback"

(* Exchange the authorized request token for an access token *)
let get_access_token
      oauth_token
      oauth_secret
      oauth_verifier
      (cgi : Netcgi.cgi_activation) =
  (* Start a new session *)
  Common.do_request
    (fun session ->

       try
         (* Request the access token *)
         let (response, _) =
           GapiOAuth1.get_access_token
             ~consumer_secret
             ~oauth_consumer_key
             ~oauth_token
             ~oauth_verifier
             ~oauth_secret
             session in

         (* Read the response *)
         let (access_token, access_token_secret) =
           match response with
               GapiAuthResponse.OAuth1GetAccessToken token ->
                 (token.GapiAuthResponse.OAuth1.access_token,
                  token.GapiAuthResponse.OAuth1.access_token_secret)
             | _ -> failwith "Not supported OAuth1 response" in

         (* Generate the HTML output page *)
         let output =
           Printf.sprintf
             "<form method=\"post\" action=\"\">\
                <fieldset>\
                  <legend>OAuth1 token:</legend>\
                  oa1_token: <input type=\"text\" name=\"oa1_token\" value=\"%s\" size=\"50\" /><br />\
                  oa1_secret: <input type=\"text\" name=\"oa1_secret\" value=\"%s\" size=\"50\" /><br />\
                  <input type=\"submit\" name=\"save\" value=\"Save\" />\
                </fieldset>\
              </form>"
             access_token
             access_token_secret
         in
           Common.output_page "OAuth1 Flow" "Success" output cgi

       with Failure error ->
         (* Generate the HTML error page *)
         Common.output_error_page "OAuth1 Flow" error cgi)

let save (cgi : Netcgi.cgi_activation) =
  (* Read the values from the request *)
  let oa1_token = cgi#argument_value "oa1_token" in
  let oa1_secret = cgi#argument_value "oa1_secret" in

  (* Save the new values to a temporary configuration file *)
  let filename = "/tmp/auth.config" in
    Config.set test_config "oa1_token" oa1_token;
    Config.set test_config "oa1_secret" oa1_secret;
    Config.save ~filename test_config;
    (* Acknowledge the user *)
    Common.output_page "OAuth1 Flow" "Success"
      ("<p>OAuth1 token saved to " ^ filename ^ "</p>")
      cgi

(* Nethttpd handler *)
let oauth1_callback oauth_secret (cgi : Netcgi.cgi_activation) =
  if cgi#argument_value "save" <> "" then
    (* Handle the form submission *)
    save cgi
  else
    (* Handle the response from Google authorization endpoint, reading the
     * obtained values from the query string and requesting the access token *)
    let oauth_token = cgi#argument_value "oauth_token" in
    let oauth_verifier = cgi#argument_value "oauth_verifier" in
      get_access_token oauth_token oauth_secret oauth_verifier cgi

(* Ask Google OAuth1 endpoint for the request token *)
let get_request_token () =
  (* Start a new session *)
  Common.do_request
    (fun session ->

       (* Request the unauthorized token *)
       let (response, _) =
         GapiOAuth1.get_request_token
           ~xoauth_displayname
           ~consumer_secret
           ~oauth_consumer_key
           ~scope:"http://www.google.com/calendar/feeds"
           ~oauth_callback
           session in

       (* Read the response *)
       let (token, secret) =
         match response with
             GapiAuthResponse.OAuth1RequestToken token ->
               (token.GapiAuthResponse.OAuth1.request_token,
                token.GapiAuthResponse.OAuth1.request_token_secret)
           | _ -> failwith "Not supported OAuth1 response" in

       (* Generate and print out the URL used to authorize the token *)
       let url = GapiOAuth1.authorize_token_url
                   ~hd:"default"
                   ~hl:"en"
                   token in
         print_endline ("Open this URL in a web browser:\n" ^ url);

         (* Start the web server and wait for the Google callback *)
         Common.start_netplex (oauth1_callback secret))

let _ =
  (* Ignore SIGPIPE (required by nethttpd) *)
  Sys.set_signal Sys.sigpipe Sys.Signal_ignore;

  (* Start the OAuth1 flow *)
  get_request_token ()

