(* $Id$ *)

(* Since Ocaml 3.11.2 there is also Printexc.register_printer allowing
   the user to register a printer directly with the Ocaml stdlib.
   Of course, we register our printer there, too, but we have to be
   careful to avoid recursion

   FORMAT OF EXCEPTIONS UNTIL 4.01:

   - tag=0
   - field(exn,0) is a block shared by all exceptions with the same
     identity.
   - field(field(exn,0),0) is the name as OCaml string
   - field(exn,1): start of arguments

   FORMAT OF EXCEPTIONS SINCE 4.02:

   Exceptions without arguments: The exception is identical to the
   exception descriptor:

   - tag=object tag
   - field(exn,0) is the name as OCaml string (NB. objects have in this
     field a pointer to the method table)
   - field(exn,1) is the OID (OCaml integer)

   Exceptions with arguments:

   - tag=0
   - field(exn,0) is the exception descriptor object
   - hence, field(field(exn,0),0) is the name
   - hence, field(field(exn,0),1) is the OID
   - field(exn,1): start of arguments
 *)

type printer = exn -> string

let registry = 
  (Hashtbl.create 50 : (string, (Obj.t * printer) list) Hashtbl.t)
    (* The hashtable maps the name of the exception to an assoc list
       mapping the exception anchor to the printer.
     *)

let scopy s =
  (* we really want to make here a copy! *)
  String.sub s 0 (String.length s)

let register_printer e f =
  let e1 = Obj.repr e in
  let descriptor = if Obj.tag e1 = 0 then Obj.field e1 0 else e1 in
  let name = scopy (Obj.obj (Obj.field descriptor 0) : string) in
  let descr_is_object = (Obj.tag descriptor = Obj.object_tag) in

  let alist =
    try Hashtbl.find registry name with Not_found -> [] in

  let alist' =
    (descriptor, f) :: 
      (if descr_is_object then
         List.remove_assoc descriptor alist
       else
         List.remove_assq descriptor alist
      ) in
  
  Hashtbl.replace registry name alist'

(* to_string_opt: This is the function registered at Printexc.
   It must not call Printexc.
 *)

let to_string_opt (e : exn) : string option =
  let e1 = Obj.repr e in
  let descriptor = if Obj.tag e1 = 0 then Obj.field e1 0 else e1 in
  let name = scopy (Obj.obj (Obj.field descriptor 0) : string) in
  let descr_is_object = (Obj.tag descriptor = Obj.object_tag) in

  let f_opt =
    try
      let alist = Hashtbl.find registry name in
      try
        if descr_is_object then
          Some(List.assoc descriptor alist)
        else
	  Some(List.assq descriptor alist)
      with
	| Not_found ->
(*
	    prerr_endline "Strange: exn by name found, but not by anchor";
	    prerr_endline ("name: " ^ name);
	    prerr_endline ("anchor: " ^ 
			     string_of_int(Obj.magic anchor : int));
	    let ea = fst(List.hd alist) in
	    prerr_endline ("expected anchor: " ^ 
			     string_of_int(Obj.magic ea : int));
 *)
	    None
    with
      | Not_found ->
	  None in
  match f_opt with
    | None -> None
    | Some f -> Some(f e)

(* to_string: This is the function called by users. If there is
   Printexc.register_printer, we simply call Printexc.to_string
   - our printers are also registered with Printexc. If Ocaml does
   not provide this feature, we can only use our own registry
 *)

let to_string e =
  if Netsys_conf.have_printexc_register_printer then
    Printexc.to_string e
  else
    match to_string_opt e with
      | None -> Printexc.to_string e
      | Some s -> s

(* If supported, register our registry: *)

let () =
  if Netsys_conf.have_printexc_register_printer then
    Netsys_conf.printexc_register_printer to_string_opt


(* Add printers for the core exceptions: *)
    
let string_of_unix_code =
  function
    | Unix.E2BIG -> "E2BIG"   
    | Unix.EACCES -> "EACCES"  
    | Unix.EAGAIN -> "EAGAIN"  
    | Unix.EBADF -> "EBADF"   
    | Unix.EBUSY -> "EBUSY"   
    | Unix.ECHILD -> "ECHILD"  
    | Unix.EDEADLK -> "EDEADLK"         
    | Unix.EDOM -> "EDOM"    
    | Unix.EEXIST -> "EEXIST"  
    | Unix.EFAULT -> "EFAULT"  
    | Unix.EFBIG -> "EFBIG"   
    | Unix.EINTR -> "EINTR"   
    | Unix.EINVAL -> "EINVAL"  
    | Unix.EIO -> "EIO"     
    | Unix.EISDIR -> "EISDIR"  
    | Unix.EMFILE -> "EMFILE"  
    | Unix.EMLINK -> "EMLINK"  
    | Unix.ENAMETOOLONG -> "ENAMETOOLONG"    
    | Unix.ENFILE -> "ENFILE"  
    | Unix.ENODEV -> "ENODEV"  
    | Unix.ENOENT -> "ENOENT"  
    | Unix.ENOEXEC -> "ENOEXEC"         
    | Unix.ENOLCK -> "ENOLCK"  
    | Unix.ENOMEM -> "ENOMEM"  
    | Unix.ENOSPC -> "ENOSPC"  
    | Unix.ENOSYS -> "ENOSYS"  
    | Unix.ENOTDIR -> "ENOTDIR"         
    | Unix.ENOTEMPTY -> "ENOTEMPTY"       
    | Unix.ENOTTY -> "ENOTTY"  
    | Unix.ENXIO -> "ENXIO"   
    | Unix.EPERM -> "EPERM"   
    | Unix.EPIPE -> "EPIPE"   
    | Unix.ERANGE -> "ERANGE"  
    | Unix.EROFS -> "EROFS"   
    | Unix.ESPIPE -> "ESPIPE"  
    | Unix.ESRCH -> "ESRCH"   
    | Unix.EXDEV -> "EXDEV"   
    | Unix.EWOULDBLOCK -> "EWOULDBLOCK"     
    | Unix.EINPROGRESS -> "EINPROGRESS"     
    | Unix.EALREADY -> "EALREADY"        
    | Unix.ENOTSOCK -> "ENOTSOCK"        
    | Unix.EDESTADDRREQ -> "EDESTADDRREQ"    
    | Unix.EMSGSIZE -> "EMSGSIZE"        
    | Unix.EPROTOTYPE -> "EPROTOTYPE"      
    | Unix.ENOPROTOOPT -> "ENOPROTOOPT"     
    | Unix.EPROTONOSUPPORT -> "EPROTONOSUPPORT"         
    | Unix.ESOCKTNOSUPPORT -> "ESOCKTNOSUPPORT"         
    | Unix.EOPNOTSUPP -> "EOPNOTSUPP"      
    | Unix.EPFNOSUPPORT -> "EPFNOSUPPORT"    
    | Unix.EAFNOSUPPORT -> "EAFNOSUPPORT"    
    | Unix.EADDRINUSE -> "EADDRINUSE"      
    | Unix.EADDRNOTAVAIL -> "EADDRNOTAVAIL"   
    | Unix.ENETDOWN -> "ENETDOWN"        
    | Unix.ENETUNREACH -> "ENETUNREACH"     
    | Unix.ENETRESET -> "ENETRESET"       
    | Unix.ECONNABORTED -> "ECONNABORTED"    
    | Unix.ECONNRESET -> "ECONNRESET"      
    | Unix.ENOBUFS -> "ENOBUFS"         
    | Unix.EISCONN -> "EISCONN"         
    | Unix.ENOTCONN -> "ENOTCONN"        
    | Unix.ESHUTDOWN -> "ESHUTDOWN"       
    | Unix.ETOOMANYREFS -> "ETOOMANYREFS"    
    | Unix.ETIMEDOUT -> "ETIMEDOUT"       
    | Unix.ECONNREFUSED -> "ECONNREFUSED"    
    | Unix.EHOSTDOWN -> "EHOSTDOWN"       
    | Unix.EHOSTUNREACH -> "EHOSTUNREACH"    
    | Unix.ELOOP -> "ELOOP"   
    | Unix.EOVERFLOW -> "EOVERFLOW"       
    | Unix.EUNKNOWNERR n -> "EUNKNOWNERR " ^ string_of_int n


let string_literal s =
  "\"" ^ String.escaped s ^ "\""

let string_of_unix_error e =
  match e with
    | Unix.Unix_error(code, fname, arg) ->
	"Unix.Unix_error(" ^ 
	  string_of_unix_code code ^ ", " ^ 
	  string_literal fname ^ ", " ^ 
	  string_literal arg ^ ")"
    | _ ->
	assert false


let rec string_contains_at s1 s2 k =
  let l1 = String.length s1 in
  let l2 = String.length s2 in
  k + l2 <= l1 && (
    String.sub s1 k l2 = s2 ||
      string_contains_at s1 s2 (k+1)
  )
    
let string_contains s1 s2 =
  (* Is s2 a substring of s1? *)
  string_contains_at s1 s2 0


let have_nice_unix_error =
  (* maybe somebody enhances Printexc at some time so it can already
     print nice Unix errors. Test for this.
   *)
  let s =
    Printexc.to_string (Unix.Unix_error(Unix.ENOENT,"","")) in
  string_contains s "ENOENT"


let () =
  if not have_nice_unix_error then (
    register_printer
      (Unix.Unix_error(Unix.ENOENT,"",""))
      string_of_unix_error
  )

     
