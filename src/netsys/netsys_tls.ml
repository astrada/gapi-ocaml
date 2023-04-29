(* $Id$ *)

open Printf


module Debug = struct
  let enable = ref false
end

let dlog = Netlog.Debug.mk_dlog "Netsys_tls" Debug.enable
let dlogr = Netlog.Debug.mk_dlogr "Netsys_tls" Debug.enable

let () =
  Netlog.Debug.register_module "Netsys_tls" Debug.enable



type dh_params =
  [ `PKCS3_PEM_file of string
  | `PKCS3_DER of string
  | `Generate of int
  ]

type crt_list =
  [`PEM_file of string | `DER of string list]

type crl_list =
  [`PEM_file of string | `DER of string list]

type private_key =
  [ `PEM_file of string 
  | `RSA of string 
  | `DSA of string
  | `EC of string
  | `PKCS8 of string
  | `PKCS8_encrypted of string
  ]


let debug_backtrace fn exn bt =
  dlog (sprintf "Exception in function Netsys_tls.%s: %s - backtrace: %s"
                fn (Netexn.to_string exn) bt
       )


let error_message tls code =
  let module P = (val tls : Netsys_crypto_types.TLS_PROVIDER) in
  P.error_message code


let create_x509_config
      ?algorithms ?dh_params
      ?(verify = fun _ cert_ok name_ok -> cert_ok && name_ok) 
      ?system_trust ?trust ?revoke ?keys 
      ~peer_auth tls =
  let module P = (val tls : Netsys_crypto_types.TLS_PROVIDER) in
  let verify ep cert_ok name_ok =
    let module EP = struct
      module TLS = P
      let endpoint = ep
    end in
    verify (module EP : Netsys_crypto_types.TLS_ENDPOINT) cert_ok name_ok in
  try
    let credentials = 
      P.create_x509_credentials ?system_trust ?trust ?revoke ?keys () in
    let config =
      P.create_config
        ?algorithms ?dh_params ~verify
        ~peer_auth ~credentials () in
    let module Config = struct
      module TLS = P
      let config = config
    end in
    (module Config : Netsys_crypto_types.TLS_CONFIG)
  with
    | exn -> 
         if !Debug.enable then 
           debug_backtrace "create_x509_config" exn (Printexc.get_backtrace());
         raise exn


let create_file_endpoint ?resume ~role ~rd ~wr ~peer_name config =
  let module Config = (val config : Netsys_crypto_types.TLS_CONFIG) in
  let module P = Config.TLS in
  try
    let recv buf =
      let n = Netsys_mem.mem_recv rd buf 0 (Bigarray.Array1.dim buf) [] in
      dlogr (fun () -> sprintf "Netsys_tls: Unix.recv n=%d" n);
      n in
    let send buf size =
      let n = Netsys_mem.mem_send wr buf 0 size [] in
      dlogr (fun () -> sprintf "Netsys_tls: Unix.send n=%d" n);
      n in
    let ep = 
      match resume with
        | None ->
             P.create_endpoint ~role ~recv ~send ~peer_name Config.config
        | Some data ->
             if role <> `Client then 
               failwith
                 "Netsys_tls.create_file_endpoint: can only resume clients";
             P.resume_client ~recv ~send ~peer_name Config.config data in
    let module Endpoint = struct
      module TLS = P
      let endpoint = ep
      let rd_file = rd
      let wr_file = wr
    end in
    (module Endpoint : Netsys_crypto_types.FILE_TLS_ENDPOINT)
  with
    | exn -> 
         if !Debug.enable then 
           debug_backtrace "create_file_endpoint" 
                           exn (Printexc.get_backtrace());
         raise exn

let at_transport_eof ep =
  let module Endpoint = 
    (val ep : Netsys_crypto_types.TLS_ENDPOINT) in
  let module P = Endpoint.TLS in
  try
    P.at_transport_eof Endpoint.endpoint
  with
    | exn -> 
         if !Debug.enable then
           debug_backtrace "at_transport_eof" exn (Printexc.get_backtrace());
         raise exn
  


let endpoint ep =
  let module File_endpoint = 
    (val ep : Netsys_crypto_types.FILE_TLS_ENDPOINT) in
  (module File_endpoint : Netsys_crypto_types.TLS_ENDPOINT)


let state_driven_action endpoint =
  let module Endpoint = 
    (val endpoint : Netsys_crypto_types.TLS_ENDPOINT) in
  let module P = Endpoint.TLS in
  try
    match P.get_state Endpoint.endpoint with
      | `Start | `Handshake ->
           dlog "Netsys_tls: hello";
           P.hello Endpoint.endpoint;
           dlog "Netsys_tls: verify";
           P.verify Endpoint.endpoint
      | `Accepting ->
           dlog "Netsys_tls: accept_switch";
           P.accept_switch Endpoint.endpoint (P.get_config Endpoint.endpoint)
      | `Refusing ->
           dlog "Netsys_tls: refuse_switch";
           P.refuse_switch Endpoint.endpoint
      | `Switching ->
           dlog "Netsys_tls: switch";
           P.switch Endpoint.endpoint (P.get_config Endpoint.endpoint);
           dlog "Netsys_tls: hello";
           P.hello Endpoint.endpoint;
           dlog "Netsys_tls: verify";
           P.verify Endpoint.endpoint
      | _ -> 
           ()
   with
     | P.Exc.EAGAIN_RD as exn ->
          dlog "Netsys_tls: EAGAIN_RD"; raise exn
     | P.Exc.EAGAIN_WR as exn ->
          dlog "Netsys_tls: EAGAIN_WR"; raise exn
     | exn -> 
          if !Debug.enable then
            debug_backtrace "state_driven_action" exn (Printexc.get_backtrace());
          raise exn


let handshake endpoint =
  let module Endpoint = 
    (val endpoint : Netsys_crypto_types.TLS_ENDPOINT) in
  let module P = Endpoint.TLS in
  let state = P.get_state Endpoint.endpoint in
  if state = `Start || state = `Handshake then
    state_driven_action endpoint;
  dlog "Netsys_tls: handshake done"


let mem_recv ?(on_rehandshake=fun _ -> true) endpoint buf pos len =
  let module Endpoint = 
    (val endpoint : Netsys_crypto_types.TLS_ENDPOINT) in
  let module P = Endpoint.TLS in
  state_driven_action endpoint;
  let buf' =
    if pos=0 && len=Bigarray.Array1.dim buf then
      buf
    else
      Bigarray.Array1.sub buf pos len in
  try
    dlog "Netsys_tls: recv";
    let n = P.recv Endpoint.endpoint buf' in
    dlogr (fun () -> sprintf "Netsys_tls: recv done (n=%d)" n);
    n
  with
    | P.Exc.TLS_switch_request ->
         if on_rehandshake endpoint then
           P.accept_switch Endpoint.endpoint (P.get_config Endpoint.endpoint)
         else
           P.refuse_switch Endpoint.endpoint;
         raise Netsys_types.EAGAIN_RD
    | P.Exc.EAGAIN_RD as exn ->
         dlog "Netsys_tls: EAGAIN_RD"; raise exn
    | P.Exc.EAGAIN_WR as exn ->
         dlog "Netsys_tls: EAGAIN_WR"; raise exn
    | exn ->
         if !Debug.enable then
           debug_backtrace "mem_recv" exn (Printexc.get_backtrace());
         raise exn


let recv ?on_rehandshake endpoint buf pos len =
  let mem, return = Netsys_mem.pool_alloc_memory2 Netsys_mem.default_pool in
  try
    let mem_len = min len (Bigarray.Array1.dim mem) in
    let n = mem_recv ?on_rehandshake endpoint mem 0 mem_len in
    Netsys_mem.blit_memory_to_bytes mem 0 buf pos n;
    return();
    n
  with
    | exn -> return(); raise exn


let mem_send endpoint buf pos len =
  let module Endpoint = 
    (val endpoint : Netsys_crypto_types.TLS_ENDPOINT) in
  let module P = Endpoint.TLS in
  state_driven_action endpoint;
  let buf' =
    if pos=0 then
      buf
    else
      Bigarray.Array1.sub buf pos len in
  try
    dlog "Netsys_tls: send";
    let n = P.send Endpoint.endpoint buf' len in
    dlogr (fun () -> sprintf "Netsys_tls: send done (n=%d)" n);
    n
  with
    | P.Exc.EAGAIN_RD as exn ->
         dlog "Netsys_tls: EAGAIN_RD"; raise exn
    | P.Exc.EAGAIN_WR as exn ->
         dlog "Netsys_tls: EAGAIN_WR"; raise exn
    | exn ->
         if !Debug.enable then
           debug_backtrace "mem_send" exn (Printexc.get_backtrace());
         raise exn


let send endpoint buf pos len =
  state_driven_action endpoint;
  let mem, return = Netsys_mem.pool_alloc_memory2 Netsys_mem.default_pool in
  try
    let mem_len = min len (Bigarray.Array1.dim mem) in
    Netsys_mem.blit_bytes_to_memory buf pos mem 0 mem_len;
    let n = mem_send endpoint mem 0 mem_len in
    return();
    n
  with
    | exn -> return(); raise exn


let str_send endpoint buf pos len =
  send endpoint (Bytes.unsafe_of_string buf) pos len

let shutdown endpoint how =
  let module Endpoint = 
    (val endpoint : Netsys_crypto_types.TLS_ENDPOINT) in
  let module P = Endpoint.TLS in
  state_driven_action endpoint;
  try
    dlog "Netsys_tls: bye";
    P.bye Endpoint.endpoint how;
    dlog "Netsys_tls: bye done";
  with
    | P.Exc.EAGAIN_RD as exn ->
         dlog "Netsys_tls: EAGAIN_RD"; raise exn
    | P.Exc.EAGAIN_WR as exn ->
         dlog "Netsys_tls: EAGAIN_WR"; raise exn
    | exn ->
         if !Debug.enable then
           debug_backtrace "shutdown" exn (Printexc.get_backtrace());
         raise exn
