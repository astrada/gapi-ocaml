open GapiUtils.Infix

type curl_context =
    { curl : Curl.t;
      error_buffer : string ref;
      disposed : bool;
    }

type 'a t =
    Initialized
  | Created of curl_context
  | Destroyed
  | Uninitialized

(* private *)
let set_curl_options option_list curl =
  List.iter
    (fun curl_option ->
       Curl.setopt curl curl_option
    )
    option_list

(* private *)
let reader netchannel bytes =
  let result = String.create bytes in
    try
      let len = netchannel#input result 0 bytes in
        String.sub result 0 len
    with End_of_file ->
      netchannel#close_in ();
      ""

let global_init () : [`Initialized] t =
  Curl.global_init Curl.CURLINIT_GLOBALALL;
  Initialized

let init
      ?debug_function
      ?timeout
      ?connect_timeout
      ?(follow_location = false)
      ?(compress = false)
      ?options
      (state : [`Initialized] t) : [`Created] t =
  let error_buffer = ref "" in
  let curl = Curl.init () in
    begin match debug_function with
        None ->
          Curl.set_verbose curl false
      | Some f ->
          Curl.set_verbose curl true;
          Curl.set_debugfunction curl f
    end;
    begin match timeout with
        None -> ()
      | Some ms ->
          Curl.set_timeoutms curl ms;
    end;
    begin match connect_timeout with
        None -> ()
      | Some ms ->
          Curl.set_connecttimeoutms curl ms;
    end;
    begin match compress with
        false ->
          Curl.set_encoding curl Curl.CURL_ENCODING_NONE
      | true ->
          Curl.set_encoding curl Curl.CURL_ENCODING_DEFLATE
    end;
    begin match options with
        None -> ()
      | Some option_list -> set_curl_options option_list curl
    end;
    Curl.set_errorbuffer curl error_buffer;
    Curl.set_followlocation curl follow_location;
    Created { curl;
              error_buffer;
              disposed = false }

let with_curl_context f (state : [`Created] t) =
  match state with
      Created context ->
        f context
    | _ -> assert false

let with_curl f (state : [`Created] t) =
  with_curl_context
    (fun context ->
       if not context.disposed then
         f context.curl
       else
         failwith "Curl session already closed")
    state

let set_options option_list (state : [`Created] t) =
  with_curl
    (set_curl_options option_list)
    state

let set_writefunction writer (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_writefunction curl writer)
    state

let set_headerfunction writer (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_headerfunction curl writer)
    state

let set_httpheader headers (state : [`Created] t) =
  with_curl
    (fun curl -> headers
       |> List.map GapiCore.Header.to_string
       |> Curl.set_httpheader curl )
    state

let set_httpget flag (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_httpget curl flag)
    state

let set_post flag (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_post curl flag)
    state

let set_nobody flag (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_nobody curl flag)
    state

let set_upload flag (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_upload curl flag)
    state

let set_httpbody body (state : [`Created] t) =
  with_curl
    (fun curl ->
       let ch = new Netchannels.input_string body in
       let readfunction = reader ch in
         Curl.set_postfieldsize curl (String.length body);
         Curl.set_readfunction curl readfunction)
    state

let set_customrequest http_method (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_customrequest curl http_method)
    state

let set_postfields key_value_list (state : [`Created] t) =
  with_curl
    (fun curl ->
       match key_value_list with
           [] ->
             Curl.set_postfieldsize curl 0;
             Curl.set_readfunction curl (fun _ -> "")
         | _ ->
             let encoded_string = Netencoding.Url.mk_url_encoded_parameters
                                    key_value_list in
             let ch = new Netchannels.input_string encoded_string in
             let readfunction = reader ch in
               Curl.set_postfieldsize curl (String.length encoded_string);
               (* using readfunction instead of set_postfields because there is
                * no way to reset postfields buffer using current version of
                * ocurl (doesn't implement curl_easy_reset) *)
               Curl.set_readfunction curl readfunction
    )
    state

let set_useragent value (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_useragent curl value)
    state

let set_cookies cookies (state : [`Created] t) =
  with_curl
    (fun curl ->
       List.iter (Curl.set_cookielist curl) cookies)
    state

let reset_all_cookies (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_cookielist curl "ALL")
    state

let reset_session_cookies (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.set_cookielist curl "SESS")
    state

let perform url (state : [`Created] t) =
  with_curl
    (fun curl ->
       Curl.set_url curl url;
       Curl.perform curl
    )
    state

let get_error_buffer (state : [`Created] t) =
  with_curl_context
    (fun context -> !(context.error_buffer))
    state

let get_responsecode (state : [`Created] t) =
  with_curl
    (fun curl -> Curl.get_responsecode curl)
    state

let cleanup (state : [`Created] t) : [`Destroyed] t =
  with_curl_context
    (fun context ->
       if not context.disposed then
         Curl.cleanup context.curl;
       Destroyed
    )
    state

let global_cleanup
      (state : [`Initialized] t) : [`Uninitialized] t =
  Curl.global_cleanup ();
  Uninitialized

let string_of_curl_info_type info_type =
  match info_type with
      Curl.DEBUGTYPE_TEXT -> "info"
    | Curl.DEBUGTYPE_HEADER_IN -> "header in"
    | Curl.DEBUGTYPE_HEADER_OUT -> "header out"
    | Curl.DEBUGTYPE_DATA_IN -> "data in"
    | Curl.DEBUGTYPE_DATA_OUT -> "data out"
    | Curl.DEBUGTYPE_END -> "end"

