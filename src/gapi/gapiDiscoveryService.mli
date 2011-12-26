(** Service definition for Discovery (v1).

  Lets you discover information about other Google APIs, such as what APIs are available, the resource and method details for each API

  For more information about this service, see the
  {{:http://code.google.com/apis/discovery/v1/using.html}API Documentation}
  *)

(** The "apis" service. *)
module ApisResource :
sig
  (** Retrieve the description of a particular version of an api.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/discovery/v1/apis"]).
    @param parameters Optional standard parameters.
    @param api The name of the API.
    @param version The version of the API.
    *)
  val getRest :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    api:string ->
    version:string ->
    GapiConversation.Session.t ->
    GapiDiscovery.RestDescription.t * GapiConversation.Session.t

  (** Retrieve the list of APIs supported at this endpoint.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/discovery/v1/apis"]).
    @param parameters Optional standard parameters.
    @param label Only include APIs with a matching label, such as [graduated] or [labs].
    @param name Only include APIs with the given name.
    @param preferred Return only the preferred version of an API.
    *)
  val list :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?label:string ->
    ?name:string ->
    ?preferred:bool ->
    GapiConversation.Session.t ->
    GapiDiscovery.DirectoryList.t * GapiConversation.Session.t

end

