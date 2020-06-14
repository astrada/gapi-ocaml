let default_config_file = "../../config/auth.config"

type t = (string, string) Hashtbl.t

let parse ?(filename = default_config_file) () =
  let sb = Scanf.Scanning.from_file filename in
  let table = Hashtbl.create 16 in
  while not (Scanf.Scanning.end_of_input sb) do
    let key, value = Scanf.bscanf sb "%s@=%s@\n" (fun k v -> (k, v)) in
    Hashtbl.add table key value
  done;
  table

let save ?(filename = default_config_file) table =
  let out_ch = open_out filename in
  Hashtbl.iter
    (fun key value -> Printf.fprintf out_ch "%s=%s\n" key value)
    table;
  close_out out_ch

let get table key = Hashtbl.find table key

let set table key value = Hashtbl.replace table key value
