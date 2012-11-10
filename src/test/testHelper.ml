open GapiUtils.Infix

let build_client_login_auth test_config =
  let get = Config.get test_config in
    (GapiConfig.ClientLogin
       { GapiConfig.username = get "cl_user";
         password = get "cl_pass" },
     GapiConversation.Session.ClientLogin (get "cl_token"))

let build_oauth1_auth test_config =
  let get = Config.get test_config in
    (GapiConfig.OAuth1
      { GapiConfig.signature_method = GapiCore.SignatureMethod.HMAC_SHA1;
        consumer_key = get "oa1_cons_key";
        consumer_secret = get "oa1_cons_secret" },
     GapiConversation.Session.OAuth1
       { GapiConversation.Session.token = get "oa1_token";
         secret = get "oa1_secret" })

let build_oauth2_auth test_config =
  let get = Config.get test_config in
    (GapiConfig.OAuth2
       { GapiConfig.client_id = get "oa2_id";
         client_secret = get "oa2_secret" },
     GapiConversation.Session.OAuth2
       { GapiConversation.Session.oauth2_token = get "oa2_token";
         refresh_token = get "oa2_refresh" })

let build_no_auth _ =
  (GapiConfig.NoAuth,
   GapiConversation.Session.NoAuth)

let build_config debug_flag auth_config =
  let base_config =
    if debug_flag then GapiConfig.default_debug else GapiConfig.default
  in
    { base_config with
          GapiConfig.auth = auth_config }

let get_debug_flag test_config =
  try
    let value = Config.get test_config "debug" in
      bool_of_string value
  with Not_found -> false

let string_of_json_data_model tree =
  let join _ = String.concat "," in
    GapiCore.AnnotatedTree.fold
      (fun m xs ->
         match m.GapiJson.data_type with
             GapiJson.Object ->
               Printf.sprintf "%a{%a}"
                 (fun _ n ->
                    if n <> "" then "\"" ^ n ^ "\":" else "") m.GapiJson.name
                 join xs
           | GapiJson.Array ->
               Printf.sprintf "\"%s\":[%a]" m.GapiJson.name join xs
           | _ -> assert false)
      (fun m value ->
         let s = Yojson.Safe.to_string value in
           if m.GapiJson.name <> "" then
             Printf.sprintf "\"%s\":%s" m.GapiJson.name s
           else
             s)
      tree

let do_request
      config
      auth_session
      interact
      handle_exception =
  let state = GapiCurl.global_init () in
  let cleanup () = ignore (GapiCurl.global_cleanup state) in
  let rec try_request () =
    try
      GapiConversation.with_session
        ~auth_context:auth_session
        config
        state
        interact
    with
        Failure message as e ->
          if ExtString.String.exists
               message "CURLE_OPERATION_TIMEOUTED" then
            try_request ()
          else
            handle_exception e
      | GapiService.ServiceError e ->
          let e' = Failure (
            e |> GapiError.RequestError.to_data_model
              |> string_of_json_data_model)
          in
            handle_exception e'
      | e ->
          handle_exception e
  in
    try
      try_request ();
      cleanup ()
    with e ->
      cleanup ();
      raise e

let test_request
      ?configfile
      ?(handle_exception = raise)
      build_auth
      interact =
  let test_config = Config.parse ?filename:configfile () in
  let (auth_conf, auth_session) = build_auth test_config in 
  let debug_flag = get_debug_flag test_config in
  let config = build_config debug_flag auth_conf in
    do_request
      config
      auth_session
      interact
      handle_exception

let test_request_noauth
      ?configfile
      ?(handle_exception = raise)
      interact =
  let test_config = Config.parse ?filename:configfile () in
  let debug_flag = get_debug_flag test_config in
  let config = build_config debug_flag GapiConfig.NoAuth in
    do_request
      config
      GapiConversation.Session.NoAuth
      (interact test_config)
      handle_exception

let print_exception e =
  print_endline (Printexc.to_string e);
  Printexc.print_backtrace stdout

let print_xml_data_model ?(print_string = print_string) tree =
  let tab_string tabs =
    String.make (tabs * 2) ' '
  in
  let print_name meta =
    let prefix = try GdataCore.Metadata.prefix meta with Not_found -> "" in
    let name = GdataCore.Metadata.name meta in
    let namespace = try GdataCore.Metadata.namespace meta with Not_found -> "" in
      if prefix <> "" then begin
        print_string prefix;
        print_string ":"
      end;
      if namespace <> "" then begin
        print_string "[";
        print_string namespace;
        print_string "]"
      end;
      print_string name
  in
  let print_value = print_string in
  let print_node meta children tabs =
    begin match GdataCore.Metadata.node_type meta with
        `Element ->
          let ts = tab_string tabs in
            print_string ts;
            print_name meta;
            print_string ": {\n";
            ignore (List.fold_right (fun k _ -> k (tabs + 1)) children tabs);
            print_string ts;
            print_string "}\n"
      | _ ->
          failwith "Only elements allowed as nodes"
    end;
    tabs
  in
  let print_leaf meta value tabs =
    print_string (tab_string tabs);
    begin match GdataCore.Metadata.node_type meta with
        `Text ->
          print_string "text(";
          print_value value;
          print_string ")\n"
      | `Cdata ->
          print_string "<![CDATA[";
          print_value value;
          print_string "]]>";
          print_string "\n"
      | `Attribute ->
          print_string "@";
          print_name meta;
          print_string "=";
          print_value value;
          print_string "\n"
      | `Element ->
          failwith "Cannot have XML element as leaf"
      | _ ->
          assert false
    end;
    tabs
  in
    GapiCore.AnnotatedTree.fold print_node print_leaf tree 0

let string_of_xml_data_model tree =
  let buffer = Buffer.create 256 in
  let _ = print_xml_data_model
            ~print_string:(Buffer.add_string buffer)
            tree in
    Buffer.contents buffer

(* We should add a delay to let Google persist the new entry, after a write
 * operation, otherwise DELETE will return a 503 HTTP error (Service
 * Unavailable) *)
let delay ?(seconds = 5) () =
  Unix.sleep seconds

let assert_false msg b =
  OUnit.assert_bool msg (not b)

let assert_not_empty msg s =
  OUnit.assert_bool msg (s <> "")

let assert_equal_file file_name s =
  let ic = open_in file_name in
  let buffer = Buffer.create 512 in
  let file_content =
    try
      while true do
        let s = input_line ic in
          Buffer.add_string buffer s
      done;
      assert false
    with End_of_file ->
      Buffer.contents buffer
  in
    OUnit.assert_equal ~printer:Std.identity file_content s

let assert_exists msg pred xs =
  OUnit.assert_bool msg (List.exists pred xs)

let assert_not_exists msg pred xs =
  OUnit.assert_bool msg (not (List.exists pred xs))

