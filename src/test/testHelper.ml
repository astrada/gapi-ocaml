module Config =
struct
  type t = (string, string) Hashtbl.t

  let parse filename =
    let sb = Scanf.Scanning.from_file filename in
    let table = Hashtbl.create 16 in
      while (not (Scanf.Scanning.end_of_input sb)) do
        let (key, value) = Scanf.bscanf sb "%s@=%s@\n" (fun k v -> (k, v)) in
          Hashtbl.add table key value
      done;
      table

  let save table filename =
    let out_ch = open_out filename in
      Hashtbl.iter
        (fun key value ->
           Printf.fprintf out_ch "%s=%s\n" key value)
        table;
      close_out out_ch

  let get table key =
    Hashtbl.find table key

  let set table key value =
    Hashtbl.replace table key value

end

let build_client_login_auth test_config =
  let get = Config.get test_config in
    (GdataConfig.ClientLogin
       { GdataConfig.username = get "cl_user";
         GdataConfig.password = get "cl_pass" },
     GdataConversation.Session.ClientLogin (get "cl_token"))

let build_oauth1_auth test_config =
  let get = Config.get test_config in
    (GdataConfig.OAuth1
      { GdataConfig.signature_method = GdataCore.SignatureMethod.HMAC_SHA1;
        GdataConfig.consumer_key = get "oa1_cons_key";
        GdataConfig.consumer_secret = get "oa1_cons_secret" },
     GdataConversation.Session.OAuth1
       { GdataConversation.Session.token = get "oa1_token";
         GdataConversation.Session.secret = get "oa1_secret" })

let build_oauth2_auth test_config =
  let get = Config.get test_config in
    (GdataConfig.OAuth2
       { GdataConfig.client_id = get "oa2_id";
         GdataConfig.client_secret = get "oa2_secret" },
     GdataConversation.Session.OAuth2
       { GdataConversation.Session.oauth2_token = get "oa2_token";
         GdataConversation.Session.refresh_token = get "oa2_refresh" })

(* val build_config : GdataConfig.auth_config -> GdataConfig.t *)
let build_config auth_config =
  { GdataConfig.default with
        GdataConfig.auth = auth_config }

(* val update_session :
  GdataConversation.Session.auth_context ->
  GdataConversation.Session.t -> GdataConversation.Session.t *)
let update_session auth_session session =
  { session with
        GdataConversation.Session.auth = auth_session }

let do_request
      config
      auth_session
      interact
      handle_exception =
  let rec try_request () =
    let state = GapiCurl.global_init () in
      begin
        try
          GdataConversation.with_session
            config
            state
            (fun session ->
               let session' = update_session auth_session session in
                 interact session')
        with
            Failure message as e ->
              if ExtString.String.exists message "CURLE_OPERATION_TIMEOUTED" then
                try_request ()
              else
                handle_exception e
          | e -> handle_exception e
      end;
      ignore (GapiCurl.global_cleanup state)
  in
    try_request ()

let config_file_name = "test/test.config"

let test_request
      ?(configfile = config_file_name)
      ?(handle_exception = raise)
      build_auth
      interact =
  let test_config = Config.parse configfile in
  let (auth_conf, auth_session) = build_auth test_config in 
  let config = build_config auth_conf in
    do_request
      config
      auth_session
      interact
      handle_exception

let test_request_noauth
      ?(configfile = config_file_name)
      ?(handle_exception = raise)
      interact =
  let test_config = Config.parse configfile in
    do_request
      GdataConfig.default
      GdataConversation.Session.NoAuth
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

