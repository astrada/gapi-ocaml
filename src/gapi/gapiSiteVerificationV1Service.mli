(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Google Site Verification API (v1).
  
  Lets you programatically verify ownership of websites or domains with Google..
  
  For more information about this service, see the
  {{:http://code.google.com/apis/siteverification/}API Documentation}.
  *)

module Scope :
sig
  val siteverification : string
  (** Manage the list of sites and domains you control *)
  
  val siteverification_verify_only : string
  (** Manage your new site verifications with Google *)
  
  
end
(** Service Auth Scopes *)

module WebResourceResource :
sig
  
  (** Relinquish ownership of a website or domain.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param std_params Optional standard parameters.
    @param id The id of a verified site or domain.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Get the most current data for a website or domain.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param id The id of a verified site or domain.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiConversation.Session.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t * GapiConversation.Session.t
  
  (** Get a verification token for placing on a website or domain.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param std_params Optional standard parameters.
    *)
  val getToken :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceGettokenRequest.t ->
    GapiConversation.Session.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceGettokenResponse.t * GapiConversation.Session.t
  
  (** Attempt verification of a website or domain.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param std_params Optional standard parameters.
    @param verificationMethod The method to use for verifying a site or domain.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    verificationMethod:string ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t ->
    GapiConversation.Session.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t * GapiConversation.Session.t
  
  (** Get the list of your verified websites and domains.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param std_params Optional standard parameters.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceListResponse.t * GapiConversation.Session.t
  
  (** Modify the list of owners for your website or domain. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param std_params Optional standard parameters.
    @param id The id of a verified site or domain.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t ->
    GapiConversation.Session.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t * GapiConversation.Session.t
  
  (** Modify the list of owners for your website or domain.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/siteVerification/v1/"]).
    @param std_params Optional standard parameters.
    @param id The id of a verified site or domain.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t ->
    GapiConversation.Session.t ->
    GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.t * GapiConversation.Session.t
  
  
end


