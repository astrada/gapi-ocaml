module S = Tiny_httpd

let tmp_filename = "/tmp/auth.config"

let build_page title h3 body =
  Printf.sprintf
    "<!DOCTYPE html>\n\
     <html lang=\"en\">\n\
     <head>\n\
     <title>%s</title>\n\
     </head>\n\
     <body>\n\
     <h3>%s</h3>\n\
     %s\n\
     </body>\n\
     </html>"
    title h3 body

let start port get_access_token =
  let server = S.create ~port () in
  S.add_route_handler server
    S.Route.(exact "oauth2callback" @/ return)
    (fun req ->
      let query = S.Request.query req in
      let response =
        try
          let verification_code =
            List.find (fun (key, _) -> key = "code") query |> snd
          in
          get_access_token verification_code;
          S.Response.make_string
            (Ok
               (build_page "gapi-ocaml oauth2 flow" "Success!"
                  (Printf.sprintf
                     "<p>Verification code: %s</p><p>You may close the \
                      browser. OAuth2 token saved to %s.</p>"
                     verification_code tmp_filename)))
        with Not_found ->
          S.Response.make_string
            (Ok
               (build_page "gapi-ocaml oauth2 flow" "Error!"
                  (Printf.sprintf "<p>Cannot get the verification code</p>")))
      in
      S.stop server;
      response);
  match S.run server with Ok () -> () | Error e -> raise e
