module type PIPE =
sig
  type t

  val create : unit -> t

  val read_byte : t -> int
  val read_string : t -> int -> string
  val read_line : t -> string

  val write_byte : t -> int -> unit
  val write_string : t -> string -> unit

  val end_reading : t -> unit
  val end_writing : t -> unit
end

module OcamlnetPipe =
struct
  type t = Netchannels.pipe

  let create () =
    new Netchannels.pipe ()

  let read_byte p =
    p#input_byte ()

  let read_string p len =
    let result = String.create len in
      p#input result 0 len;
      result

  let read_line p =
    p#input_line ()

  let write_byte p b =
    p#output_byte b

  let write_string p s =
    p#output_string s

  let end_reading p =
    p#close_in ()

  let end_writing p =
    p#close_out ()
end

