(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for  (v2).
  
  OAuth2 API.
  *)

module UserinfoResource :
sig
  module V2 :
  sig
    module Me :
    sig
      
      (** 
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/"]).
        @param std_params Optional standard parameters.
        *)
      val get :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        GapiConversation.Session.t ->
        GapiOauth2V2Model.Userinfo.t * GapiConversation.Session.t
      
      
    end
    
    
    
  end
  
  
  (** 
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/"]).
    @param std_params Optional standard parameters.
    *)
  val get :
    ?base_url:string ->
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

