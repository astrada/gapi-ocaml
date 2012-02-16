(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for CustomSearch API (v1).
  
  Lets you search over a website or collection of websites.
  
  For more information about this service, see the
  {{:http://code.google.com/apis/customsearch/v1/using_rest.html}API Documentation}.
  *)

module CseResource :
sig
  
  module Safe :
  sig
    type t =
      | Default
      | High
      | Medium
      | Off
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Lr :
  sig
    type t =
      | Default
      | Lang_ar
      | Lang_bg
      | Lang_ca
      | Lang_cs
      | Lang_da
      | Lang_de
      | Lang_el
      | Lang_en
      | Lang_es
      | Lang_et
      | Lang_fi
      | Lang_fr
      | Lang_hr
      | Lang_hu
      | Lang_id
      | Lang_is
      | Lang_it
      | Lang_iw
      | Lang_ja
      | Lang_ko
      | Lang_lt
      | Lang_lv
      | Lang_nl
      | Lang_no
      | Lang_pl
      | Lang_pt
      | Lang_ro
      | Lang_ru
      | Lang_sk
      | Lang_sl
      | Lang_sr
      | Lang_sv
      | Lang_tr
      | Lang_zh_CN
      | Lang_zh_TW
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Filter :
  sig
    type t =
      | Default
      | V0
      | V1
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  (** Returns metadata about the search performed, metadata about the custom search engine used for the search, and the search results.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/customsearch/"]).
    @param std_params Optional standard parameters.
    @param num Number of search results to return
    @param safe Search safety level
    @param cr Country restrict(s).
    @param cref The URL of a linked custom search engine
    @param cx The custom search engine ID to scope this search query
    @param filter Controls turning on or off the duplicate content filter.
    @param gl Geolocation of end user.
    @param googlehost The local Google domain to use to perform the search.
    @param lr The language restriction for the search results
    @param sort The sort expression to apply to the results
    @param start The index of the first result to return
    @param q Query
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?num:string ->
    ?safe:Safe.t ->
    ?cr:string ->
    ?cref:string ->
    ?cx:string ->
    ?filter:Filter.t ->
    ?gl:string ->
    ?googlehost:string ->
    ?lr:Lr.t ->
    ?sort:string ->
    ?start:string ->
    q:string ->
    GapiConversation.Session.t ->
    GapiCustomsearchV1Model.Search.t * GapiConversation.Session.t
  
  
end

