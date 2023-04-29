(* $Id$ *)

open Printf

module Debug = struct
  let enable = ref false
end

let dlog = Netlog.Debug.mk_dlog "Netsys" Debug.enable
let dlogr = Netlog.Debug.mk_dlogr "Netsys" Debug.enable

let () =
  Netlog.Debug.register_module "Netsys" Debug.enable


exception Shutdown_not_supported

let is_win32 =
  Sys.os_type = "Win32"

external netsys_is_darwin : unit -> bool = "netsys_is_darwin"

let is_darwin =
  netsys_is_darwin()

external int64_of_file_descr : Unix.file_descr -> int64
  = "netsys_int64_of_file_descr"
  (* Also occurs in netsys_win32.ml! *)

let is_letter =
  function
    | 'a'..'z' -> true
    | 'A'..'Z' -> true
    | _ -> false

let is_absolute path =
  if is_win32 then
    (String.length path >= 3 &&
      is_letter path.[0] &&
      path.[1] = ':' &&
        (path.[2] = '/' || path.[2] = '\\')
    ) ||
      (String.length path >= 2 &&
	 (path.[0] = '/' || path.[0] = '\\') &&
	 (path.[1] = '/' || path.[1] = '\\')
      )
  else
    path <> "" && path.[0] = '/'

let abspath_w32 path =
  (* full path: resolves relative paths, and eliminates . and ..
     long path: gets away with 8.3 paths, and converts file name case
   *)
  Netsys_win32.get_long_path_name
    (Netsys_win32.get_full_path_name path)


let abspath path =
  if is_win32 then
    abspath_w32 path
  else
    try
      Netsys_posix.realpath path
    with
      | Invalid_argument _ ->
           (* this is sub-standard, let's hope we never run into this *)
           if is_absolute path then
             path
           else
             Filename.concat
               (Unix.getcwd())
               path

let restart = Netsys_impl_util.restart
let restart_tmo = Netsys_impl_util.restart_tmo

let restarting_select fd_rd fd_wr fd_oob tmo =
  restart_tmo (Unix.select fd_rd fd_wr fd_oob) tmo

let sleep t =
  let select =
    if is_win32 then Netsys_win32.real_select else Unix.select in
  let _,_,_ =
    select [] [] [] t in
  ()

let restarting_sleep t =
  restart_tmo sleep t


let getpeername fd =
  try
    Unix.getpeername fd
  with
    | Unix.Unix_error(Unix.EINVAL,a1,a2) ->
	(* SUS defines EINVAL as "socket has been shut down". This is a bit
         * surprising for developers of Open Source OS where this is reported
         * as ENOTCONN. We map it here.
	 *)
	raise(Unix.Unix_error(Unix.ENOTCONN,a1,a2))


let domain_of_inet_addr addr =
  Unix.domain_of_sockaddr(Unix.ADDR_INET(addr,0))

let protostring_of_inet_addr ip = (Obj.magic ip)

let inet_addr_of_protostring s =
  let l = String.length s in
  if l = 4 || l = 16 then (Obj.magic s) else
    invalid_arg "Netsys.inet_addr_of_protostring"

external _exit : int -> unit = "netsys__exit";;
(* same external also in netsys_signal.ml *)

let binop_inet_addr f (ip1 : Unix.inet_addr) (ip2 : Unix.inet_addr) =
  let s1 = (Obj.magic ip1 : string) in
  let s2 = (Obj.magic ip2 : string) in
  let l = String.length s1 in
  if l <> String.length s2 then
    failwith "logand_inet_addr";
  let s3 = Bytes.create l in
  for k = 0 to l-1 do
    Bytes.set s3 k (Char.chr(f (Char.code s1.[k]) (Char.code s2.[k])));
  done;
  (Obj.magic s3 : Unix.inet_addr)

let logand_inet_addr =
  binop_inet_addr ( land )

let logor_inet_addr =
  binop_inet_addr ( lor )

let logxor_inet_addr =
  binop_inet_addr ( lxor )

let lognot_inet_addr ip =
  binop_inet_addr
    (fun p1 p2 -> lnot p1)
    ip
    ip

let norm_inet_addr (ip : Unix.inet_addr) =
  if String.length (Obj.magic ip) = 16 then
    let ip1 =
      logand_inet_addr
        ip
        (Unix.inet_addr_of_string "ffff:ffff:ffff:ffff:ffff:ffff::0") in
    if (ip1 = (Unix.inet_addr_of_string "0000:0000:0000:0000:0000:ffff::0") ||
        ip1 = (Unix.inet_addr_of_string "0000:0000:0000:0000:0000:0000::0")) &&
       ip <> Unix.inet6_addr_any && ip <> Unix.inet6_addr_loopback
    then
      Obj.magic (String.sub (Obj.magic ip) 12 4)
    else
      ip
  else
    ip

let ipv6_inet_addr (ip : Unix.inet_addr) =
  if String.length (Obj.magic ip) = 4 then
    Obj.magic (String.make 10 '\x00' ^ String.make 2 '\xff' ^ Obj.magic ip)
  else
    ip


let is_ipv4_inet_addr (ip : Unix.inet_addr) =
  String.length (Obj.magic (norm_inet_addr ip)) = 4

let is_ipv6_inet_addr (ip : Unix.inet_addr) =
  String.length (Obj.magic (norm_inet_addr ip)) = 16

let is_multicast_inet_addr ip =
  let ip1 = norm_inet_addr ip in
  if String.length (Obj.magic ip1) = 4 then
    logand_inet_addr
      ip1
      (Unix.inet_addr_of_string "240.0.0.0")
    = (Unix.inet_addr_of_string "224.0.0.0")
  else
    if String.length (Obj.magic ip1) = 16 then
      logand_inet_addr
        ip1
        (Unix.inet_addr_of_string "ffff::0")
      = (Unix.inet_addr_of_string "ff00::0")
    else
      false


external test_for_ip6_global_addr : unit -> bool
  = "netsys_test_for_ip6_global_addr"

let ipv6 = ref (test_for_ip6_global_addr())

let is_ipv6_system() = !ipv6

let set_ipv6_system b = ipv6 := b
  


type fd_style =
    [ `Read_write
    | `Recv_send of Unix.sockaddr * Unix.sockaddr
    | `Recv_send_implied
    | `Recvfrom_sendto
    | `W32_pipe
    | `W32_pipe_server
    | `W32_event
    | `W32_process
    | `W32_input_thread
    | `W32_output_thread
    | `TLS of Netsys_crypto_types.file_tls_endpoint
    ]


let get_fd_style fd =
  let w32_obj_opt =
    try Some(Netsys_win32.lookup fd)
    with Not_found -> None in
  match w32_obj_opt with
    | Some (Netsys_win32.W32_pipe _) ->
	`W32_pipe
    | Some (Netsys_win32.W32_pipe_server _) ->
	`W32_pipe_server
    | Some (Netsys_win32.W32_event _) ->
	`W32_event
    | Some (Netsys_win32.W32_process _) ->
	`W32_process
    | Some (Netsys_win32.W32_input_thread _) ->
	`W32_input_thread
    | Some (Netsys_win32.W32_output_thread _) ->
	`W32_output_thread
    | None ->
	(* Check whether we have a socket or not: *)
	try
	  let _socktype = Unix.getsockopt_int fd Unix.SO_TYPE in
	  (* Now check whether the socket is connected or not: *)
	  try
	    let sockaddr = Unix.getsockname fd in
	    let peeraddr = getpeername fd in
	    (* fd is a connected socket *)
	    `Recv_send(sockaddr,peeraddr)
	  with
	    | Unix.Unix_error(Unix.ENOTCONN,_,_) ->
		(* fd is an unconnected socket *)
		`Recvfrom_sendto
	    | Unix.Unix_error(Unix.ENOTSOCK,_,_) -> 
		failwith "Got unexpected ENOTSOCK" (* hopefully we never see this *)
	    | _e ->
		(* There are various error codes in use for socket types that
                   do not use addresses, e.g. socketpairs are considered
                   as not having addresses by some OS. Common are
                   EAFNOSUPPORT, EOPNOTSUPP, EINVAL. For simplicity we catch
                   here all, which is allowed as we already know that fd is a
                   socket.
		 *)
		`Recv_send_implied
	with
	  | Unix.Unix_error((Unix.ENOTSOCK|Unix.EINVAL),_,_) -> 
	      (* Note: EINVAL is used by some oldish OS in this case *)
	      (* fd is not a socket *)
	      `Read_write
	  | Unix.Unix_error((Unix.ENOENT,_,_)) when is_win32 -> 
	      `Read_write
	  | e ->
	      Netlog.log `Crit 
		("get_fd_style: Exception: " ^ Netexn.to_string e);
	      assert false

let string_of_sockaddr ?(norm=false) =
  function
    | Unix.ADDR_INET(inet,port) ->
        let inet =
          if norm then norm_inet_addr inet else inet in
	( match domain_of_inet_addr inet with
	    | Unix.PF_INET ->
		Unix.string_of_inet_addr inet ^ ":" ^ string_of_int port
	    | Unix.PF_INET6 ->
		"[" ^ Unix.string_of_inet_addr inet ^ "]:" ^ string_of_int port
	    | _ ->
		assert false
	)
    | Unix.ADDR_UNIX path ->
	String.escaped path

let string_of_fd_style =
  function
    | `Read_write -> "Read_write"
    | `Recv_send (sockaddr,peeraddr) ->
	"Recv_send(" ^ string_of_sockaddr sockaddr ^ "," ^ 
	  string_of_sockaddr peeraddr ^ ")"
    | `Recv_send_implied -> "Recv_send_implied"
    | `Recvfrom_sendto -> "Recvfrom_sendto"
    | `W32_pipe -> "W32_pipe"
    | `W32_pipe_server -> "W32_pipe_server"
    | `W32_event -> "W32_event"
    | `W32_process -> "W32_process" 
    | `W32_input_thread -> "W32_input_thread"
    | `W32_output_thread -> "W32_output_thread"
    | `TLS _ -> "TLS"

let string_of_fd fd =
  let st = get_fd_style fd in
  let fdi = int64_of_file_descr fd in
  match st with
    | `Read_write ->
	sprintf "fd<%Ld>" fdi
    | `Recv_send(sockaddr,peeraddr) ->
	sprintf "fd<%Ld=socket(%s,%s)>" 
	  fdi (string_of_sockaddr sockaddr) (string_of_sockaddr peeraddr)
    | `Recv_send_implied ->
	sprintf "fd<%Ld=socket>" fdi
    | `Recvfrom_sendto ->
	sprintf "fd<%Ld=socket>" fdi
    | `W32_pipe ->
	let p = Netsys_win32.lookup_pipe fd in
	sprintf "fd<%Ld=w32_pipe(%s)>" fdi (Netsys_win32.pipe_name p)
    | `W32_pipe_server ->
	let p = Netsys_win32.lookup_pipe_server fd in
	sprintf "fd<%Ld=w32_pipe_server(%s)>" 
	  fdi (Netsys_win32.pipe_server_name p)
    | `W32_event ->
	sprintf "fd<%Ld=w32_event>" fdi
    | `W32_process ->
	let p = Netsys_win32.lookup_process fd in
	sprintf "fd<%Ld=w32_process(%d)>" fdi (Netsys_win32.win_pid p)
    | `W32_input_thread ->
	sprintf "fd<%Ld=w32_input_thread>" fdi
    | `W32_output_thread ->
	sprintf "fd<%Ld=w32_output_thread>" fdi


let wait_until_readable fd_style fd tmo =
  dlogr (fun () -> sprintf "wait_until_readable fd=%Ld tmo=%f"
	   (int64_of_file_descr fd) tmo);
  if Netsys_posix.have_poll() then
    restart_tmo
      (Netsys_posix.poll_single fd true false false) tmo
  else
    match fd_style with
      | `Read_write when is_win32 ->  (* effectively not supported! *)
	  true
      | `W32_pipe ->
	  let ph = Netsys_win32.lookup_pipe fd in
	  Netsys_win32.pipe_wait_rd ph tmo
      | `W32_pipe_server ->
	  let ph = Netsys_win32.lookup_pipe_server fd in
	  Netsys_win32.pipe_wait_connect ph tmo
      | `W32_event ->
	  let eo = Netsys_win32.lookup_event fd in
	  Netsys_win32.event_wait eo tmo
      | `W32_input_thread ->
	  let ithr = Netsys_win32.lookup_input_thread fd in
	  let eo = Netsys_win32.input_thread_event ithr in
	  Netsys_win32.event_wait eo tmo
      | `W32_process
      | `W32_output_thread ->
	  sleep tmo; false (* never *)
      | `TLS ep ->
          let module Endpoint = 
            (val ep : Netsys_crypto_types.FILE_TLS_ENDPOINT) in
          Endpoint.TLS.recv_will_not_block Endpoint.endpoint || (
	    let l,_,_ = 
              restart_tmo (Unix.select [Endpoint.rd_file] [] []) tmo in
	    l <> []
          )
      | _ ->
	  let l,_,_ = restart_tmo (Unix.select [fd] [] []) tmo in
	  l <> []

let wait_until_writable fd_style fd tmo =
  dlogr (fun () -> sprintf "wait_until_writable fd=%Ld tmo=%f"
	   (int64_of_file_descr fd) tmo);
  if Netsys_posix.have_poll() then
    restart_tmo
      (Netsys_posix.poll_single fd false true false) tmo
  else
    match fd_style with
      | `Read_write when is_win32 ->  (* effectively not supported! *)
	  true
      | `W32_pipe ->
	  let ph = Netsys_win32.lookup_pipe fd in
	  Netsys_win32.pipe_wait_wr ph tmo
      | `W32_pipe_server ->
	  let ph = Netsys_win32.lookup_pipe_server fd in
	  Netsys_win32.pipe_wait_connect ph tmo
      | `W32_event ->
	  let eo = Netsys_win32.lookup_event fd in
	  Netsys_win32.event_wait eo tmo
      | `W32_output_thread ->
	  let othr = Netsys_win32.lookup_output_thread fd in
	  let eo = Netsys_win32.output_thread_event othr in
	  Netsys_win32.event_wait eo tmo
      | `W32_input_thread 
      | `W32_process ->
	  sleep tmo; false (* never *)
      | `TLS ep ->
          let module Endpoint = 
            (val ep : Netsys_crypto_types.FILE_TLS_ENDPOINT) in
	  let l,_,_ = restart_tmo (Unix.select [] [Endpoint.wr_file] []) tmo in
	  l <> []
      | _ ->
	  let _,l,_ = restart_tmo (Unix.select [] [fd] []) tmo in
	  l <> []

let wait_until_prird fd_style fd tmo =
  dlogr (fun () -> sprintf "wait_until_prird fd=%Ld tmo=%f"
	   (int64_of_file_descr fd) tmo);
  if Netsys_posix.have_poll() then
    restart_tmo
      (Netsys_posix.poll_single fd false false true) tmo
  else
    match fd_style with
      | `Read_write when is_win32 ->  (* effectively not supported! *)
	  true
      | `W32_pipe ->
	  sleep tmo; false (* never *)
      | `W32_pipe_server ->
	  let ph = Netsys_win32.lookup_pipe_server fd in
	  Netsys_win32.pipe_wait_connect ph tmo
      | `W32_event ->
	  let eo = Netsys_win32.lookup_event fd in
	  Netsys_win32.event_wait eo tmo
      | `W32_input_thread
      | `W32_output_thread
      | `W32_process ->
	  sleep tmo; false (* never *)
      | _ ->
	  let _,_,l = restart_tmo (Unix.select [] [] [fd]) tmo in
	  l <> []


let is_readable fd_style fd = wait_until_readable fd_style fd 0.0
let is_writable fd_style fd = wait_until_writable fd_style fd 0.0
let is_prird fd_style fd = wait_until_prird fd_style fd 0.0


let rec restart_wait mode fd_style fd f arg =
  try
    f arg
  with
    | Unix.Unix_error(Unix.EINTR,_,_) ->
	restart_wait mode fd_style fd f arg
    | Unix.Unix_error(Unix.EAGAIN,_,_)
    | Unix.Unix_error(Unix.EWOULDBLOCK,_,_) ->
        (match mode with
           | `R -> 
                ignore(wait_until_readable fd_style fd (-1.0));
                restart_wait mode fd_style fd f arg
           | `W -> 
                ignore(wait_until_writable fd_style fd (-1.0));
                restart_wait mode fd_style fd f arg
        )
    | Netsys_types.EAGAIN_RD ->
         ignore(wait_until_readable fd_style fd (-1.0));
         restart_wait mode fd_style fd f arg
    | Netsys_types.EAGAIN_WR ->
         ignore(wait_until_writable fd_style fd (-1.0));
         restart_wait mode fd_style fd f arg


let gwrite_tstr fd_style fd ts pos len =
  dlogr (fun () -> sprintf "gwrite fd=%Ld len=%d"
	   (int64_of_file_descr fd) len);
  match fd_style with
    | `Read_write ->
        ( match ts with
            | `Bytes s ->
	        Unix.single_write fd s pos len
            | `String s ->
                #ifdef HAVE_BYTES
                  Unix.single_write_substring fd s pos len
                #else
  	          Unix.single_write fd s pos len
                #endif
            | `Memory s ->
                Netsys_mem.mem_write fd s pos len
        )
    | `Recv_send _ 
    | `Recv_send_implied ->
        ( match ts with
            | `Bytes s ->
	        Unix.send fd s pos len []
            | `String s ->
                #ifdef HAVE_BYTES
	          Unix.send_substring fd s pos len []
                #else
                  Unix.send fd s pos len []
                #endif
            | `Memory s ->
                Netsys_mem.mem_send fd s pos len []
        )
    | `Recvfrom_sendto ->
	failwith "Netsys.gwrite: the socket is unconnected"
    | `W32_pipe ->
	let ph = Netsys_win32.lookup_pipe fd in
        ( match ts with
            | `Bytes s ->
	        Netsys_win32.pipe_write ph s pos len
            | `String s ->
	        Netsys_win32.pipe_write_string ph s pos len
            | `Memory s ->
                let b =
                  Netsys_mem.bytes_of_memory
                    (Bigarray.Array1.sub s pos len) in
	        Netsys_win32.pipe_write ph b 0 len
        )
    | `W32_pipe_server ->
	failwith "Netsys.gwrite: cannot write to pipe servers"
    | `W32_event ->
	failwith "Netsys.gwrite: cannot write to event descriptor"
    | `W32_process ->
	failwith "Netsys.gwrite: cannot write to process descriptor"
    | `W32_input_thread ->
	failwith "Netsys.gwrite: cannot write to input thread"
    | `W32_output_thread ->
	let othr = Netsys_win32.lookup_output_thread fd in
        ( match ts with
            | `Bytes s ->
	        Netsys_win32.output_thread_write othr s pos len
            | `String s ->
	        Netsys_win32.output_thread_write_string othr s pos len
            | `Memory s ->
                let b =
                  Netsys_mem.bytes_of_memory
                    (Bigarray.Array1.sub s pos len) in
	        Netsys_win32.output_thread_write othr b 0 len
        )
    | `TLS endpoint ->
        let ep = Netsys_tls.endpoint endpoint in
        ( match ts with
            | `Bytes s ->
	        Netsys_tls.send ep s pos len        
            | `String s ->
	        Netsys_tls.str_send ep s pos len        
            | `Memory s ->
	        Netsys_tls.mem_send ep s pos len        
        )


let gwrite fd_style fd s pos len =
  gwrite_tstr fd_style fd (`Bytes s) pos len

let gwrite_tbuf fd_style fd tb pos len =
  let ts =
    match tb with
      | `Bytes s -> `Bytes s
      | `String s -> `Bytes s
      | `Memory m -> `Memory m in
  gwrite_tstr fd_style fd ts pos len


let rec really_gwrite_tstr fd_style fd ts pos len =
  try
    let n = gwrite_tstr fd_style fd ts pos len in
    if n > 0 then
      really_gwrite_tstr fd_style fd ts (pos+n) (len-n)
  with
    | Unix.Unix_error(Unix.EINTR, _, _) ->
	really_gwrite_tstr fd_style fd ts pos len
    | Unix.Unix_error( (Unix.EAGAIN | Unix.EWOULDBLOCK), _, _)
    | Netsys_types.EAGAIN_WR ->
	ignore(wait_until_writable fd_style fd (-1.0));
	really_gwrite_tstr fd_style fd ts pos len
    | Netsys_types.EAGAIN_RD ->
	ignore(wait_until_readable fd_style fd (-1.0));
	really_gwrite_tstr fd_style fd ts pos len

let really_gwrite fd_style fd s pos len =
  really_gwrite_tstr fd_style fd (`Bytes s) pos len

let really_gwrite_tbuf fd_style fd tb pos len =
  let ts =
    match tb with
      | `Bytes s -> `Bytes s
      | `String s -> `Bytes s
      | `Memory m -> `Memory m in
  really_gwrite_tstr fd_style fd ts pos len


let gread_tbuf fd_style fd buf pos len =
  dlogr (fun () -> sprintf "gread fd=%Ld len=%d"
	   (int64_of_file_descr fd) len);
  match fd_style with
    | `Read_write ->
        ( match buf with
            | `Bytes s
            | `String s ->
	        Unix.read fd s pos len
            | `Memory s ->
                Netsys_mem.mem_read fd s pos len
        )
    | `Recv_send _ 
    | `Recv_send_implied ->
        ( match buf with
            | `Bytes s
            | `String s ->
	        Unix.recv fd s pos len []
            | `Memory s ->
                Netsys_mem.mem_recv fd s pos len []
        )
    | `Recvfrom_sendto ->
	failwith "Netsys.gread: the socket is unconnected"
    | `W32_pipe ->
	let ph = Netsys_win32.lookup_pipe fd in
        ( match buf with
            | `Bytes s
            | `String s ->
	        Netsys_win32.pipe_read ph s pos len
            | `Memory s ->
                let b = Bytes.create len in
	        let n = Netsys_win32.pipe_read ph b 0 len in
                Netsys_mem.blit_bytes_to_memory b 0 s 0 n;
                n
        )
    | `W32_pipe_server ->
	failwith "Netsys.gwrite: cannot read from pipe servers"
    | `W32_event ->
	failwith "Netsys.gread: cannot read from event descriptor"
    | `W32_process ->
	failwith "Netsys.gread: cannot read from process descriptor"
    | `W32_output_thread ->
	failwith "Netsys.gread: cannot read from output thread"
    | `W32_input_thread ->
	let ithr = Netsys_win32.lookup_input_thread fd in
        ( match buf with
            | `Bytes s
            | `String s ->
	        Netsys_win32.input_thread_read ithr s pos len
            | `Memory s ->
                let b = Bytes.create len in
	        let n = Netsys_win32.input_thread_read ithr b 0 len in
                Netsys_mem.blit_bytes_to_memory b 0 s 0 n;
                n
        )
    | `TLS endpoint ->
        let ep = Netsys_tls.endpoint endpoint in
        ( match buf with
            | `Bytes s
            | `String s ->
                Netsys_tls.recv ep s pos len
            | `Memory s ->
                Netsys_tls.mem_recv ep s pos len
        )

let gread fd_style fd buf pos len =
  gread_tbuf fd_style fd (`Bytes buf) pos len

let blocking_gread_tbuf fd_style fd s pos len =
  let rec loop pos len p =
    if len >= 0 then
      try
	let n = gread_tbuf fd_style fd s pos len in
	if n=0 then
	  p
	else
	  loop (pos+n) (len-n) (p+n)
      with
	| Unix.Unix_error(Unix.EINTR, _, _) ->
	    loop pos len p
	| Unix.Unix_error( (Unix.EAGAIN | Unix.EWOULDBLOCK), _, _)
        | Netsys_types.EAGAIN_RD ->
	    ignore(wait_until_readable fd_style fd (-1.0));
	    loop pos len p
        | Netsys_types.EAGAIN_WR ->
	    ignore(wait_until_writable fd_style fd (-1.0));
	    loop pos len p
    else
      p
  in
  loop pos len 0


let blocking_gread fd_style fd s pos len =
  blocking_gread_tbuf fd_style fd (`Bytes s) pos len
  

let really_gread_tbuf fd_style fd ts pos len =
  let p = blocking_gread_tbuf fd_style fd ts pos len in
  if p < len then raise End_of_file;
  ()

let really_gread fd_style fd s pos len =
  really_gread_tbuf fd_style fd (`Bytes s) pos len


let wait_until_connected fd tmo =
  dlogr (fun () -> sprintf "wait_until_connected fd=%Ld tmo=%f"
	   (int64_of_file_descr fd) tmo);
  if is_win32 then
    try
      let w32 = Netsys_win32.lookup fd in
      ( match w32 with
	  | Netsys_win32.W32_pipe _ -> true   (* immediately connected *)
	  | _ ->
	      failwith "Netsys.wait_until_connected: bad descriptor type"
      )
    with
      | Not_found ->  (* socket case *)
	  let l1,_,l2 = Netsys_win32.real_select [] [fd] [fd] tmo in
	  l1 <> [] || l2 <> []
  else
    wait_until_writable `Recv_send fd tmo


let catch_exn label getdetail f arg =
  try
    f arg
  with
    | error ->
	let detail = getdetail arg in
	( try  (* be careful here, logging might not work *)
	    Netlog.logf `Crit
	      "%s (%s): Exception %s"
	      label detail (Netexn.to_string error)
	  with
	    | _ -> ()
	)

let is_std fd std_fd std_num =
  if is_win32 then
    Netsys_win32.is_crt_fd fd std_num
  else
    fd = std_fd

let is_stdin fd = is_std fd Unix.stdin 0
let is_stdout fd = is_std fd Unix.stdout 1
let is_stderr fd = is_std fd Unix.stderr 2

let set_close_on_exec fd =
  if is_win32 then
    Netsys_win32.modify_close_on_exec fd true
  else
    Unix.set_close_on_exec fd


let clear_close_on_exec fd =
  if is_win32 then
    Netsys_win32.modify_close_on_exec fd false
  else
    Unix.clear_close_on_exec fd


let gshutdown fd_style fd cmd =
  dlogr (fun () -> sprintf "gshutdown fd=%Ld cmd=%s"
	   (int64_of_file_descr fd) 
	   (match cmd with
	      | Unix.SHUTDOWN_SEND -> "SEND"
	      | Unix.SHUTDOWN_RECEIVE -> "RECEIVE"
	      | Unix.SHUTDOWN_ALL -> "ALL"
	   )
	);
  match fd_style with
    | `Recv_send _
    | `Recv_send_implied ->
	( try
	    Unix.shutdown fd cmd
	  with
	    | Unix.Unix_error(Unix.ENOTCONN, _, _) -> ()
	)
    | `W32_pipe ->
	if cmd <> Unix.SHUTDOWN_ALL then
	  raise(Unix.Unix_error(Unix.EPERM, "Netsys.gshutdown", ""));
	let p = Netsys_win32.lookup_pipe fd in
	Netsys_win32.pipe_shutdown p
    | `W32_pipe_server ->
	if cmd <> Unix.SHUTDOWN_ALL then
	  raise(Unix.Unix_error(Unix.EPERM, "Netsys.gshutdown", ""));
	let p = Netsys_win32.lookup_pipe_server fd in
	Netsys_win32.pipe_shutdown_server p
    | `W32_output_thread ->
	if cmd <> Unix.SHUTDOWN_RECEIVE then (
	  let othr = Netsys_win32.lookup_output_thread fd in
	  Netsys_win32.close_output_thread othr
	)
    | `TLS endpoint ->
        Netsys_tls.shutdown (Netsys_tls.endpoint endpoint) cmd
    | _ ->
	raise Shutdown_not_supported


let gclose fd_style fd =
  dlogr (fun () -> sprintf "gclose fd=%Ld" (int64_of_file_descr fd));
  let fd_detail fd =
    Printf.sprintf "fd %Ld" (int64_of_file_descr fd) in
  let pipe_detail (fd,p) =
    Printf.sprintf "fd %Ld as pipe %s" 
      (int64_of_file_descr fd)
      (Netsys_win32.pipe_name p) in
  let psrv_detail (fd,p) =
    Printf.sprintf "fd %Ld as pipe server %s" 
      (int64_of_file_descr fd)
      (Netsys_win32.pipe_server_name p) in
  let ithr_detail (fd,p) =
    Printf.sprintf "fd %Ld as input thread for %Ld" 
      (int64_of_file_descr fd)
      (int64_of_file_descr(Netsys_win32.input_thread_descr p)) in
  let othr_detail (fd,p) =
    Printf.sprintf "fd %Ld as output thread for %Ld" 
      (int64_of_file_descr fd)
      (int64_of_file_descr(Netsys_win32.output_thread_descr p)) in
  match fd_style with
    | `Read_write 
    | `Recvfrom_sendto ->
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd
    | `Recv_send _
    | `Recv_send_implied ->
	catch_exn
	  "Unix.shutdown" fd_detail
	  (fun fd ->
	     try
	       Unix.shutdown fd Unix.SHUTDOWN_ALL
	     with
	       | Unix.Unix_error(Unix.ENOTCONN, _, _) -> ()
	  )
	  fd;
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd
    | `W32_pipe ->
	let p = Netsys_win32.lookup_pipe fd in
	catch_exn
	  "Netsys_win32.pipe_shutdown" pipe_detail
	  (fun (fd,p) -> Netsys_win32.pipe_shutdown p)
	  (fd,p);
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd;
	Netsys_win32.unregister fd
    | `W32_pipe_server ->
	let p = Netsys_win32.lookup_pipe_server fd in
	catch_exn
	  "Netsys_win32.pipe_server_shutdown" psrv_detail
	  (fun (fd,p) -> Netsys_win32.pipe_shutdown_server p)
	  (fd,p);
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd;
	Netsys_win32.unregister fd
    | `W32_event | `W32_process ->
	(* Events are automatically closed *)
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd;
	Netsys_win32.unregister fd
    | `W32_input_thread ->
	let ithr = Netsys_win32.lookup_input_thread fd in
	catch_exn
	  "Netsys_win32.cancel_input_thread" ithr_detail
	  (fun (fd,ithr) -> Netsys_win32.cancel_input_thread ithr)
	  (fd,ithr);
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd;
	Netsys_win32.unregister fd
    | `W32_output_thread ->
	let othr = Netsys_win32.lookup_output_thread fd in
	catch_exn
	  "Netsys_win32.cancel_output_thread" othr_detail
	  (fun (fd,othr) -> Netsys_win32.cancel_output_thread othr)
	  (fd,othr);
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close fd;
	Netsys_win32.unregister fd
    | `TLS endpoint ->
        Netsys_tls.shutdown (Netsys_tls.endpoint endpoint) Unix.SHUTDOWN_ALL;
        let module Endpoint =
          (val endpoint : Netsys_crypto_types.FILE_TLS_ENDPOINT) in
	catch_exn
	  "Unix.close" fd_detail
	  Unix.close Endpoint.rd_file;
        if Endpoint.wr_file <> Endpoint.rd_file then
	  catch_exn
	    "Unix.close" fd_detail
	    Unix.close Endpoint.wr_file;
        if fd <> Endpoint.rd_file then
	  catch_exn
	    "Unix.close" fd_detail
	    Unix.close fd


external unix_error_of_code : int -> Unix.error = "netsys_unix_error_of_code"


let connect_check fd =
  let do_check =
    if is_win32 then
      try
	let w32 = Netsys_win32.lookup fd in
	( match w32 with
	    | Netsys_win32.W32_pipe _ -> false  (* immediately connected *)
	    | _ ->
		failwith "Netsys.connect_check: bad descriptor type"
      )
    with
      | Not_found ->  (* socket case *)
	  true
    else
      true in
  if do_check then (
    let e_code = Unix.getsockopt_int fd Unix.SO_ERROR in
    try
      ignore(getpeername fd); 
      ()
    with
      | Unix.Unix_error(Unix.ENOTCONN,_,_) ->
	  let detail =
	    try
	      let own_addr = Unix.getsockname fd in
	      string_of_sockaddr own_addr
	    with _ -> "n/a" in
	  raise(Unix.Unix_error(unix_error_of_code e_code,
				"connect_check", detail))
  )

external mcast_set_loop : Unix.file_descr -> bool -> unit 
  = "netsys_mcast_set_loop"
external mcast_set_ttl : Unix.file_descr -> int -> unit 
  = "netsys_mcast_set_ttl"
external mcast_add_membership : 
  Unix.file_descr -> Unix.inet_addr -> Unix.inet_addr -> unit 
  = "netsys_mcast_add_membership"
external mcast_drop_membership : 
  Unix.file_descr -> Unix.inet_addr -> Unix.inet_addr -> unit 
  = "netsys_mcast_drop_membership"


let f_moncontrol = ref (fun _ -> ())

let moncontrol b =
  !f_moncontrol b

let set_moncontrol f =
  f_moncontrol := f



(* Compatibility with older ocamlnet versions *)

let really_write = really_gwrite `Read_write
let blocking_read = blocking_gread `Read_write
let really_read = really_gread `Read_write

let int_of_file_descr = Netsys_posix.int_of_file_descr
let file_descr_of_int = Netsys_posix.file_descr_of_int

let have_posix_shm = Netsys_posix.have_posix_shm

type shm_open_flag = 
    Netsys_posix.shm_open_flag =
  | SHM_O_RDONLY
  | SHM_O_RDWR
  | SHM_O_CREAT
  | SHM_O_EXCL
  | SHM_O_TRUNC

let shm_open = Netsys_posix.shm_open
let shm_unlink = Netsys_posix.shm_unlink
