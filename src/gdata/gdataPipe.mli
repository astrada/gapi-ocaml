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

module OcamlnetPipe : PIPE

