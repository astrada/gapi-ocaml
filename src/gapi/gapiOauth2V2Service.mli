(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Google OAuth2 API (v2).
  
  Lets you access OAuth2 protocol related APIs..
  
  For more information about this service, see the
  {{:https://developers.google.com/accounts/docs/OAuth2}API Documentation}.
  *)

module Scope :
sig
  val plus_me : string
  (** Know who you are on Google *)
  
  val userinfo_email : string
  (** View your email address *)
  
  val userinfo_profile : string
  (** View basic information about your account *)
  
  
end
(** Service Auth Scopes *)

module UserinfoResource :
sig
  module V2 :
  sig
    module Me :
    sig
      
      (** 
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/"]).
        @param etag Optional ETag.
        @param std_params Optional standard parameters.
        *)
      val get :
        ?base_url:string ->
        ?etag:string ->
        ?std_params:GapiService.StandardParameters.t ->
        GapiConversation.Session.t ->
        GapiOauth2V2Model.Userinfo.t * GapiConversation.Session.t
      
      
    end
    
    
    
  end
  
  
  (** 
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    GapiOauth2V2Model.Userinfo.t * GapiConversation.Session.t
  
  
end


(** 
  
  @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/"]).
  @param std_params Optional standard parameters.
  *)
val tokeninfo :
  ?base_url:string ->
  ?std_params:GapiService.StandardParameters.t ->
  ?access_token:string ->
  ?id_token:string ->
  GapiConversation.Session.t ->
  GapiOauth2V2Model.Tokeninfo.t * GapiConversation.Session.t

