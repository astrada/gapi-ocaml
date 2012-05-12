(** Defines a pipe, used to stream HTTP requests and responses.
  *)

module OcamlnetPipe :
sig
  type t

  val create :
    ?out_channel:Netchannels.out_obj_channel -> unit -> t

  val read_byte :
    t -> int

  val read_string :
    t -> int -> string

  val read_line :
    t -> string

  val write_byte :
    t -> int -> unit

  val write_string :
    t -> string -> unit

  val end_reading :
    t -> unit

  val end_writing :
    t -> unit

end

