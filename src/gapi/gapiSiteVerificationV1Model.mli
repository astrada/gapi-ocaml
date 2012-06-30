(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Google Site Verification API (v1).
  
  For more information about this data model, see the
  {{:http://code.google.com/apis/siteverification/}API Documentation}.
  *)

module SiteVerificationWebResourceResource :
sig
  module Site :
  sig
    type t = {
      identifier : string;
      (** The site identifier. If the type is set to SITE, the identifier is a URL. If the type is set to INET_DOMAIN, the site identifier is a domain name. *)
      _type : string;
      (** The site type. Can be SITE or INET_DOMAIN (domain name). *)
      
    }
    
    val identifier : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    id : string;
    (** The string used to identify this site. This value should be used in the "id" portion of the REST URL for the Get, Update, and Delete operations. *)
    owners : string list;
    (** The email addresses of all verified owners. *)
    site : Site.t;
    (** The address and type of a site that is verified or will be verified. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val owners : (t, string list) GapiLens.t
  val site : (t, Site.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SiteVerificationWebResourceGettokenResponse :
sig
  type t = {
    _method : string;
    (** The verification method to use in conjunction with this token. For FILE, the token should be placed in the top-level directory of the site, stored inside a file of the same name. For META, the token should be placed in the HEAD tag of the default page that is loaded for the site. For DNS, the token should be placed in a TXT record of the domain. *)
    token : string;
    (** The verification token. The token must be placed appropriately in order for verification to succeed. *)
    
  }
  
  val _method : (t, string) GapiLens.t
  val token : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SiteVerificationWebResourceListResponse :
sig
  type t = {
    items : SiteVerificationWebResourceResource.t list;
    (** The list of sites that are owned by the authenticated user. *)
    
  }
  
  val items : (t, SiteVerificationWebResourceResource.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SiteVerificationWebResourceGettokenRequest :
sig
  module Site :
  sig
    type t = {
      identifier : string;
      (** The site identifier. If the type is set to SITE, the identifier is a URL. If the type is set to INET_DOMAIN, the site identifier is a domain name. *)
      _type : string;
      (** The type of resource to be verified. Can be SITE or INET_DOMAIN (domain name). *)
      
    }
    
    val identifier : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    site : Site.t;
    (** The site for which a verification token will be generated. *)
    verificationMethod : string;
    (** The verification method that will be used to verify this site. For sites, 'FILE' or 'META' methods may be used. For domains, only 'DNS' may be used. *)
    
  }
  
  val site : (t, Site.t) GapiLens.t
  val verificationMethod : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

