(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for  (v2).
  *)

module Tokeninfo :
sig
  type t = {
    access_type : string;
    (** The access type granted with this toke. It can be offline or online. *)
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

module Oauth2IssueTokenV2Response :
sig
  module Consent :
  sig
    module Scopes :
    sig
      type t = {
        description : string;
        (**  *)
        detail : string;
        (**  *)
        
      }
      
      val description : (t, string) GapiLens.t
      val detail : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module OauthClient :
    sig
      type t = {
        developerEmail : string;
        (**  *)
        iconUri : string;
        (**  *)
        name : string;
        (**  *)
        
      }
      
      val developerEmail : (t, string) GapiLens.t
      val iconUri : (t, string) GapiLens.t
      val name : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      oauthClient : OauthClient.t;
      (**  *)
      scopes : Scopes.t list;
      (**  *)
      
    }
    
    val oauthClient : (t, OauthClient.t) GapiLens.t
    val scopes : (t, Scopes.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    code : string;
    (**  *)
    consent : Consent.t;
    (**  *)
    idToken : string;
    (**  *)
    issueAdvice : string;
    (**  *)
    token : string;
    (**  *)
    
  }
  
  val code : (t, string) GapiLens.t
  val consent : (t, Consent.t) GapiLens.t
  val idToken : (t, string) GapiLens.t
  val issueAdvice : (t, string) GapiLens.t
  val token : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

