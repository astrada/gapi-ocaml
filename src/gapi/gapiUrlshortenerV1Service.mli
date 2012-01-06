(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for URL Shortener API (v1).
  
  Lets you create, inspect, and manage goo.gl short URLs.
  
  For more information about this service, see the
  {{:http://code.google.com/apis/urlshortener/v1/getting_started.html}API Documentation}.
  *)

(** Manage your goo.gl short URLs *)
val scope : string

module Projection :
sig
  type t =
    | Default
    | ANALYTICS_CLICKS
    | ANALYTICS_TOP_STRINGS
    | FULL
    
  val to_string : t -> string
  
  val of_string : string -> t
  
end

module UrlResource :
sig
  (** Expands a short URL or gets creation time and analytics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/urlshortener/v1/"]).
    @param parameters Optional standard parameters.
    @param projection Additional information to return.
    @param shortUrl The short URL, including the protocol.
    *)
  val get :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?projection:Projection.t ->
    shortUrl:string ->
    GapiConversation.Session.t ->
    GapiUrlshortenerV1Model.Url.t * GapiConversation.Session.t
  
  (** Creates a new short URL.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/urlshortener/v1/"]).
    @param parameters Optional standard parameters.
    *)
  val insert :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    GapiUrlshortenerV1Model.Url.t ->
    GapiConversation.Session.t ->
    GapiUrlshortenerV1Model.Url.t * GapiConversation.Session.t
  
  (** Retrieves a list of URLs shortened by a user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/urlshortener/v1/"]).
    @param parameters Optional standard parameters.
    @param projection Additional information to return.
    @param start_token Token for requesting successive pages of results.
    *)
  val list :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?projection:Projection.t ->
    ?start_token:string ->
    GapiConversation.Session.t ->
    GapiUrlshortenerV1Model.UrlHistory.t * GapiConversation.Session.t
  
  
end
