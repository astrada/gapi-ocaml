(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for APIs Discovery Service (v1).
  
  Lets you discover information about other Google APIs, such as what APIs are available, the resource and method details for each API.
  
  For more information about this service, see the
  {{:https://developers.google.com/discovery/}API Documentation}.
  *)

module ApisResource :
sig
  
  module Label :
  sig
    type t =
      | Default
      | Deprecated (** APIs that have been deprecated. *)
      | Graduated (** Supported APIs that have graduated from labs. *)
      | Labs (** APIs that are experimental *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Retrieve the description of a particular version of an api.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/discovery/v1/"]).
    @param std_params Optional standard parameters.
    @param api The name of the API.
    @param version The version of the API.
    *)
  val getRest :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    api:string ->
    version:string ->
    GapiConversation.Session.t ->
    GapiDiscoveryV1Model.RestDescription.t * GapiConversation.Session.t
  
  (** Retrieve the list of APIs supported at this endpoint.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/discovery/v1/"]).
    @param std_params Optional standard parameters.
    @param preferred Return only the preferred version of an API.
    @param label Only include APIs with a matching label, such as 'graduated' or 'labs'.
    @param name Only include APIs with the given name.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?preferred:bool ->
    ?label:Label.t ->
    ?name:string ->
    GapiConversation.Session.t ->
    GapiDiscoveryV1Model.DirectoryList.t * GapiConversation.Session.t
  
  
end


