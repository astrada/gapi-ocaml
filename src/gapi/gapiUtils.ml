module Infix = struct
  let (|>) x f = f x

  let (-|) f g x = f (g x)

  let (|-) f g x = g (f x)

end

open Infix

let is_weak_etag etag =
  if String.length etag > 2 then
    String.sub etag 0 2 = "W/"
  else
    false

let etag_option etag =
  match etag with
      "" -> None
    | v -> Some v

let merge_query_string parameters url =
  let neturl = Neturl.parse_url url in
  let fields =
    try
      Netencoding.Url.dest_url_encoded_parameters
        (Neturl.url_query ~encoded:true neturl)
    with Not_found -> [] in
  let query_string = Netencoding.Url.mk_url_encoded_parameters
                       (fields @ parameters) in
  let new_neturl = Neturl.modify_url
                     ~encoded:true
                     ~query:query_string
                     neturl in
    Neturl.string_of_url new_neturl

let add_path_to_url ?(encoded = true) path_to_add url =
  let neturl = Neturl.parse_url url in
  let base_path =
    if List.length path_to_add > 0 && List.hd path_to_add = "" then
      (* if the path_to_add starts with /, then it's not relative, so base path
       * should be empty *)
      []
    else
      (* get the base path *)
      let base_path =
        Neturl.url_path neturl |> List.filter (fun p -> p <> "")
      in
        "" :: base_path
  in
  let path_to_add_encoded =
    List.map
      (fun p ->
         (* In some services: e.g. tasks default list (@default), the '@' should
          * not be encoded, but if the string contains '#' or '/', the resulting
          * URL will be invalid for Neturl *)
         if encoded &&
            (String.contains p '#' || String.contains p '/') then
           Netencoding.Url.encode p
         else p)
      path_to_add in
  let new_path = base_path @ path_to_add_encoded in
  let new_neturl = Neturl.modify_url
                     ~encoded
                     ~path:new_path
                     neturl in
    Neturl.string_of_url new_neturl

let string_after_char c s =
  let last_position = String.rindex s c in
    Str.string_after s (last_position + 1)

let string_before_char c s =
  try
    let first_occurrence = String.index s c in
    Str.string_before s first_occurrence
  with Not_found -> s

let divide_string s c =
  match String.index_opt s c with
  | None -> "", s
  | Some i ->
    let len = String.length s in
    let j = i + 1 in
    String.sub s 0 i, String.sub s j (len - j)

let strip_string s =
  let leading_trailing_whitespace =
    Str.regexp "\\(^[ \t\n]+\\|[ \t\n]+$\\)"
  in
  Str.global_replace leading_trailing_whitespace "" s

let string_starts_with s prefix =
  let prefix_len = String.length prefix in
  if prefix_len > String.length s then
    false
  else
    let start = String.sub s 0 prefix_len  in
    String.equal start prefix

let string_ends_with s suffix =
  let len = String.length s in
  let suffix_len = String.length suffix in
  if suffix_len > len then
    false
  else
    let ending = String.sub s (len - suffix_len) suffix_len in
    String.equal ending suffix

let wait_exponential_backoff n =
  let seconds = 1 lsl n in
  let milliseconds = Random.float 1.0 in
  let wait_time = float_of_int seconds +. milliseconds in
    Unix.select [] [] [] wait_time |> ignore

class bigarray_rec_out_channel buffer =
object(_)
  val mutable pos = 0

  method output b offset len =
    Netsys_mem.blit_bytes_to_memory b offset buffer pos len;
    pos <- pos + len;
    len

  method flush () = ()

  method close_out () = ()

end

class bigarray_out_obj_channel buffer =
  Netchannels.out_obj_channel_delegation
    (Netchannels.lift_out ~buffered:false
      (`Rec (new bigarray_rec_out_channel buffer)))

class bigarray_rec_in_channel buffer =
object(_)
  val dim = Bigarray.Array1.dim buffer
  val mutable pos = 0

  method input b offset len =
    let input_bytes l =
      Netsys_mem.blit_memory_to_bytes buffer pos b offset l;
      pos <- pos + l;
      l
    in
    if pos >= dim then raise End_of_file
    else if pos + len > dim then begin
      input_bytes (dim - pos)
    end else begin
      input_bytes len
    end

  method close_in () = ()

end

class bigarray_in_obj_channel buffer =
  Netchannels.in_obj_channel_delegation
    (Netchannels.lift_in ~buffered:false
      (`Rec (new bigarray_rec_in_channel buffer)))

let option_map_default f default v =
  Option.(map f v |> value ~default)

(* Initialize random number generator *)
let () =
  Random.self_init ()

