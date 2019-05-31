open GapiUtils.Infix

type curl_context = {
  curl : Curl.t;
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
let reader ?(close_if_at_eof = fun () -> ()) netchannel bytes =
  let result = Bytes.create bytes in
  let result =
    try
      let len = netchannel#input result 0 bytes in
      let result =
        if len = bytes then
          result
        else
          Bytes.sub result 0 len
      in
      close_if_at_eof ();
      result
    with End_of_file -> begin
      netchannel#close_in ();
      Bytes.create 0
    end
  in
  (* TODO: remove when Curl.set_readfunction is modified in: int -> bytes *)
  Bytes.to_string result

let () =
  Curl.global_init Curl.CURLINIT_GLOBALALL;
  at_exit (fun () -> Curl.global_cleanup ())

let global_init () : [`Initialized] t =
  Initialized

let init
      ?debug_function
      ?timeout
      ?connect_timeout
      ?(follow_location = false)
      ?(compress = false)
      ?(max_send_speed = 0L)
      ?(max_recv_speed = 0L)
      ?(low_speed_limit = 0)
      ?(low_speed_time = 0)
      ?(no_signal = true)
      ?proxy
      ?(ssl_verifypeer = true)
      ?options
      (_ : [`Initialized] t) : [`Created] t =
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
  if max_send_speed > 0L then
    Curl.set_maxsendspeedlarge curl max_send_speed;
  if max_recv_speed > 0L then
    Curl.set_maxrecvspeedlarge curl max_recv_speed;
  if low_speed_limit > 0 then
    Curl.set_lowspeedlimit curl low_speed_limit;
  if low_speed_time > 0 then
    Curl.set_lowspeedtime curl low_speed_time;
  begin match options with
      None -> ()
    | Some option_list -> set_curl_options option_list curl
  end;
  Curl.set_nosignal curl no_signal;
  Curl.set_errorbuffer curl error_buffer;
  Curl.set_followlocation curl follow_location;
  Option.may (fun proxy -> Curl.set_proxy curl proxy) proxy;
  Curl.set_sslverifypeer curl ssl_verifypeer;
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
       let (ch, length, close_if_at_eof) =
         match body with
             GapiCore.PostData.String content ->
               (new Netchannels.input_string content,
                String.length content,
                None)
           | GapiCore.PostData.File (path, chunk_size, offset) ->
               let in_ch = open_in_bin path in
               let in_ch_len = in_channel_length in_ch in
               let remaining_bytes =
                 Int64.sub (Int64.of_int in_ch_len) offset in
               let length = min chunk_size (Int64.to_int remaining_bytes) in
               LargeFile.seek_in in_ch offset;
               let net_in_ch = new Netchannels.input_channel in_ch in
               let stream = new Netstream.input_stream ~len:length
                 ~block_size:8192 net_in_ch in
               ((stream :> Netchannels.in_obj_channel),
                length,
                Some (fun () ->
                    if stream#window_at_eof then begin
                      net_in_ch#close_in ();
                    end
                  ))
           | GapiCore.PostData.Buffer buffer ->
               let length = Bigarray.Array1.dim buffer in
               (new GapiUtils.bigarray_in_obj_channel buffer, length, None)
       in
       let readfunction = reader ?close_if_at_eof ch in
       Curl.set_postfieldsize curl length;
       Curl.set_readfunction curl readfunction
    )
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
              * no way to reset postfields buffer using ocurl <= 0.5.1
              * (doesn't implement curl_easy_reset) *)
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

let string_of_curl_info_type info_type =
  match info_type with
      Curl.DEBUGTYPE_TEXT -> "info"
    | Curl.DEBUGTYPE_HEADER_IN -> "header in"
    | Curl.DEBUGTYPE_HEADER_OUT -> "header out"
    | Curl.DEBUGTYPE_DATA_IN -> "data in"
    | Curl.DEBUGTYPE_DATA_OUT -> "data out"
    | Curl.DEBUGTYPE_END -> "end"
    | _ -> ""

