open GapiUtils.Infix

(* Backport input_memory from Ocamlnet 4.1.2 *)
open Netsys_types
open Netstring_tstring

class ['t] input_generic name ops ?(pos = 0) ?len (s:'t) : Netchannels.in_obj_channel =
object (self)
  val mutable str = s
  val mutable str_len = 
    match len with 
	None   -> ops.length s 
      | Some l -> pos + l

  val mutable str_pos = pos
  val mutable closed = false

  initializer
    if str_pos < 0 || str_pos > ops.length str || 
       str_len < 0 || str_len > ops.length s 
    then
      invalid_arg ("new Netchannels." ^ name)
	  

  method private complain_closed() =
    raise Netchannels.Closed_channel

  method input buf pos len =
    if closed then self # complain_closed();
    if pos < 0 || len < 0 || pos+len > Bytes.length buf then
      invalid_arg "input";

    let n = min len (str_len - str_pos) in
    ops.blit_to_bytes str str_pos buf pos n;
    
    str_pos <- str_pos + n;

    if n=0 && len>0 then raise End_of_file else n


  method really_input buf pos len =
    if closed then self # complain_closed();
    if pos < 0 || len < 0 || pos+len > Bytes.length buf then
      invalid_arg "really_input";

    let n = self # input buf pos len in
    if n <> len then raise End_of_file;
    ()


  method really_input_string len =
    if closed then self # complain_closed();
    if len < 0 then
      invalid_arg "really_input_string";

    let buf = Bytes.create len in
    let n = self # input buf 0 len in
    if n <> len then raise End_of_file;
    Bytes.to_string buf


  method input_char() =
    if closed then self # complain_closed();
    if str_pos >= str_len then raise End_of_file;
    let c = ops.get str str_pos in
    str_pos <- str_pos + 1;
    c


  method input_line() =
    if closed then self # complain_closed();
    try
      let k = ops.index_from str str_pos '\n' in
      (* CHECK: Are the different end of line conventions important here? *)
      let line = ops.substring str str_pos (k - str_pos) in
      str_pos <- k+1;
      line
    with
	Not_found ->
	  if str_pos >= str_len then raise End_of_file;
	  (* Implicitly add linefeed at the end of the file: *)
	  let line = ops.substring str str_pos (str_len - str_pos) in
	  str_pos <- str_len;
	  line


  method input_byte() =
    Char.code (self # input_char())


  method close_in() =
    (* str <- ""; *)
    closed <- true;


  method pos_in = 
    if closed then self # complain_closed();
    str_pos

end

class input_memory =
  [memory] input_generic "input_memory" Netstring_tstring.memory_ops

let input_memory = new input_memory
(* END: Backport input_memory from Ocamlnet 4.1.2 *)

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
let reader netchannel bytes =
  let result = String.create bytes in
    try
      let len = netchannel#input result 0 bytes in
      if len = bytes then
        result
      else
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
      ?(max_send_speed = 0L)
      ?(max_recv_speed = 0L)
      ?(low_speed_limit = 0)
      ?(low_speed_time = 0)
      ?(no_signal = true)
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
       let (ch, length) =
         match body with
             GapiCore.PostData.String content ->
               (new Netchannels.input_string content, String.length content)
           | GapiCore.PostData.File (path, chunk_size, offset) ->
               let in_ch = open_in_bin path in
               let length = min chunk_size (in_channel_length in_ch) in
               LargeFile.seek_in in_ch offset;
               let net_in_ch = new Netchannels.input_channel in_ch in
               (((new Netstream.input_stream ~len:length net_in_ch) :>
                   Netchannels.in_obj_channel),
                length)
           | GapiCore.PostData.Buffer buffer ->
               (new input_memory buffer, Bigarray.Array1.dim buffer)
       in
       let readfunction = reader ch in
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

