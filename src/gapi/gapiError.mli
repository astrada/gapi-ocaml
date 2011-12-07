(** Data definition for server errors *)

(** A single server error *)
module SingleError :
sig
  type t = {
    domain : string;
    (** The domain in which the error occured *)
    reason : string;
    (** The reason the error was thrown *)
    message : string;
    (** The error message *)
    locationType : string;
    (** Type of the location *)
    location : string;
    (** Location where the error was thrown *)
    extendedHelp : string
  }

  val domain : (t, string) GapiLens.t
  val reason : (t, string) GapiLens.t
  val message : (t, string) GapiLens.t
  val locationType : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val extendedHelp : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

(** Collection of server errors *)
module RequestError :
sig
  type t = {
    errors : SingleError.t list;
    (** Contains a list of all errors *)
    code : int;
    (** The error code returned *)
    message : string
    (** The error message returned *)
  }

  val errors : (t, SingleError.t list) GapiLens.t
  val code : (t, int) GapiLens.t
  val message : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

