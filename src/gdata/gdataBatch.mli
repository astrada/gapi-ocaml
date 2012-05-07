(** Google Data Protocol batch operations.
  *)

module Operation :
sig
  type t =
      None
    | Query
    | Insert
    | Update
    | Delete

  val to_string : t -> string

  val of_string : string -> t

end

module Status :
sig
  type t = {
    code : int;
    reason : string;
    content_type : string;
    content : string
  }

  val code : (t, int) GapiLens.t
  val reason : (t, string) GapiLens.t
  val content_type : (t, string) GapiLens.t
  val content : (t, string) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module BatchExtensions :
sig
  type t = {
    id : string;
    operation : Operation.t;
    status : Status.t;
  }

  val id : (t, string) GapiLens.t
  val operation : (t, Operation.t) GapiLens.t
  val status : (t, Status.t) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

