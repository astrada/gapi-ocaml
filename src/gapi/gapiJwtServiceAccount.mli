(** JWT helper module for service account authorization. *)

module JwtClaim :
sig
  type t = {
    iss : string;
    scope : string;
    aud : string;
    exp : float;
    iat : float;
    sub : string;
  }

  val iss : (t, string) GapiLens.t
  val scope : (t, string) GapiLens.t
  val aud : (t, string) GapiLens.t
  val exp : (t, float) GapiLens.t
  val iat : (t, float) GapiLens.t
  val sub : (t, string) GapiLens.t

  val to_data_model : t -> GapiJson.json_data_model
  val of_data_model : GapiJson.json_data_model -> t

end

val parse_private_key : string -> Cryptokit.RSA.key
val get_encoded_claim : JwtClaim.t -> string
val get_signature : string -> string -> string
val get_jwt_token : string -> string -> string

