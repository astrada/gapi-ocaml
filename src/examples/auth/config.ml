type t = (string, string) Hashtbl.t

let parse filename =
  let sb = Scanf.Scanning.from_file filename in
  let table = Hashtbl.create 16 in
    while (not (Scanf.Scanning.end_of_input sb)) do
      let (key, value) = Scanf.bscanf sb "%s@=%s@\n" (fun k v -> (k, v)) in
        Hashtbl.add table key value
    done;
    table

let get table key =
  Hashtbl.find table key

