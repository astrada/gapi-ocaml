(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

let values = Hashtbl.create 13
let loaders = Hashtbl.create 13
let cksums = Hashtbl.create 13
let enabled = ref true


let read_db name =
  let v =
    try
      Hashtbl.find values name
    with
      | Not_found ->
          if not !enabled then
            failwith ("Ocamlnet: The lookup table `" ^ name ^
		        "' is not compiled into the program, and access to " ^
		          "the external file database is disabled");
          let loader =
            try
              Hashtbl.find loaders name
            with
              | Not_found ->
	          failwith ("Ocamlnet: No such lookup table: " ^ name) in
          loader name in
  try
    let cksum = Hashtbl.find cksums name in
    if Digest.string v <> cksum then
      failwith ("Netdb: checksum error for table: " ^ name);
    v
  with
    | Not_found -> v


let exists_db name =
  Hashtbl.mem values name || (!enabled && Hashtbl.mem loaders name)

let set_db name value =
  Hashtbl.replace values name value

let set_db_checksum name cksum =
  Hashtbl.replace cksums name cksum

let set_db_loader name loader =
  Hashtbl.replace loaders name loader

let enable_db_loaders b =
  enabled := b

