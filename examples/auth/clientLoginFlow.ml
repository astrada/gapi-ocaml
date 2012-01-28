open GapiLens.Infix

(* Load the configuration file and read the client login values *)
let test_config = Config.parse ()
let get = Config.get test_config
let email = get "cl_user"
let password = get "cl_pass"

let _ =
  (* Start a new session *)
  Common.do_request
    (fun session ->

       (* Request the Client Login authorization token *)
       let (auth_token, _) =
         GapiClientLogin.get_auth_token
           ~email
           ~password
           ~source:"GdataOcamlSample-ClientLogin"
           ~service:GapiClientLogin.Service.Calendar
           session in
       (* Read the response and print out the value *)
       let token = auth_token
         |. GapiAuthResponse.client_login_auth_token
         |. GapiLens.option_get
       in
         Printf.printf "Client Login auth token:\n%s\n" token
    )

