(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for  (v2).
  *)

module Tokeninfo :
sig
  type t = {
    access_type : string;
    (**  *)
    audience : string;
    (**  *)
    email : string;
    (**  *)
    expires_in : int;
    (**  *)
    issued_to : string;
    (**  *)
    scope : string;
    (**  *)
    user_id : string;
    (**  *)
    verified_email : bool;
    (**  *)
    
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
    (**  *)
    email : string;
    (**  *)
    family_name : string;
    (**  *)
    gender : string;
    (**  *)
    given_name : string;
    (**  *)
    id : string;
    (**  *)
    link : string;
    (**  *)
    locale : string;
    (**  *)
    name : string;
    (**  *)
    picture : string;
    (**  *)
    timezone : string;
    (**  *)
    verified_email : bool;
    (**  *)
    
  }
  
  val birthday : (t, string) GapiLens.t
  val email : (t, string) GapiLens.t
  val family_name : (t, string) GapiLens.t
  val gender : (t, string) GapiLens.t
  val given_name : (t, string) GapiLens.t
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

