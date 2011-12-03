type t = Netdate.t

val epoch : Netdate.t

val to_string : ?time:bool -> t -> string

val of_string : string -> t

