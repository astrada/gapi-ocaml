(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Google OAuth2 API (v2).
  
  For more information about this data model, see the
  {{:https://developers.google.com/accounts/docs/OAuth2}API Documentation}.
  *)

module Tokeninfo :
sig
  type t = {
    access_type : string;
    (** The access type granted with this token. It can be offline or online. *)
    audience : string;
    (** Who is the intended audience for this token. In general the same as issued_to. *)
    email : string;
    (** The email address of the user. Present only if the email scope is present in the request. *)
    expires_in : int;
    (** The expiry time of the token, as number of seconds left until expiry. *)
    issued_to : string;
    (** To whom was the token issued to. In general the same as audience. *)
    scope : string;
    (** The space separated list of scopes granted to this token. *)
    user_id : string;
    (** The Gaia obfuscated user id. *)
    verified_email : bool;
    (** Boolean flag which is true if the email address is verified. Present only if the email scope is present in the request. *)
    
  }
  
  val access_type : (t, string) GapiLens.t
  val audience : (t, string) GapiLens.t
  val email : (t, string) GapiLens.t
  val expires_in : (t, int) GapiLens.t
  val issued_to : (t, string) GapiLens.t
  val scope : (t, string) GapiLens.t
  val user_id : (t, string) GapiLens.t
  val verified_email : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Userinfo :
sig
  type t = {
    birthday : string;
    (** The user's birthday. The year is not present. *)
    email : string;
    (** The user's email address. *)
    family_name : string;
    (** The user's last name. *)
    gender : string;
    (** The user's gender. *)
    given_name : string;
    (** The user's first name. *)
    hd : string;
    (** The hosted domain e.g. example.com if the user is Google apps user. *)
    id : string;
    (** The focus obfuscated gaia id of the user. *)
    link : string;
    (** URL of the profile page. *)
    locale : string;
    (** The user's default locale. *)
    name : string;
    (** The user's full name. *)
    picture : string;
    (** URL of the user's picture image. *)
    timezone : string;
    (** The user's default timezone. *)
    verified_email : bool;
    (** Boolean flag which is true if the email address is verified. *)
    
  }
  
  val birthday : (t, string) GapiLens.t
  val email : (t, string) GapiLens.t
  val family_name : (t, string) GapiLens.t
  val gender : (t, string) GapiLens.t
  val given_name : (t, string) GapiLens.t
  val hd : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val link : (t, string) GapiLens.t
  val locale : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val picture : (t, string) GapiLens.t
  val timezone : (t, string) GapiLens.t
  val verified_email : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

