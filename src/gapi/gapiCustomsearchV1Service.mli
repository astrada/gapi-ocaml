(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for CustomSearch API (v1).
  
  Lets you search over a website or collection of websites.
  
  For more information about this service, see the
  {{:https://developers.google.com/custom-search/v1/using_rest}API Documentation}.
  *)

module CseResource :
sig
  
  module SiteSearchFilter :
  sig
    type t =
      | Default
      | E (** exclude *)
      | I (** include *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module SearchType :
  sig
    type t =
      | Default
      | Image (** custom image search *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Safe :
  sig
    type t =
      | Default
      | High (** Enables highest level of safe search filtering. *)
      | Medium (** Enables moderate safe search filtering. *)
      | Off (** Disables safe search filtering. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Lr :
  sig
    type t =
      | Default
      | Lang_ar (** Arabic *)
      | Lang_bg (** Bulgarian *)
      | Lang_ca (** Catalan *)
      | Lang_cs (** Czech *)
      | Lang_da (** Danish *)
      | Lang_de (** German *)
      | Lang_el (** Greek *)
      | Lang_en (** English *)
      | Lang_es (** Spanish *)
      | Lang_et (** Estonian *)
      | Lang_fi (** Finnish *)
      | Lang_fr (** French *)
      | Lang_hr (** Croatian *)
      | Lang_hu (** Hungarian *)
      | Lang_id (** Indonesian *)
      | Lang_is (** Icelandic *)
      | Lang_it (** Italian *)
      | Lang_iw (** Hebrew *)
      | Lang_ja (** Japanese *)
      | Lang_ko (** Korean *)
      | Lang_lt (** Lithuanian *)
      | Lang_lv (** Latvian *)
      | Lang_nl (** Dutch *)
      | Lang_no (** Norwegian *)
      | Lang_pl (** Polish *)
      | Lang_pt (** Portuguese *)
      | Lang_ro (** Romanian *)
      | Lang_ru (** Russian *)
      | Lang_sk (** Slovak *)
      | Lang_sl (** Slovenian *)
      | Lang_sr (** Serbian *)
      | Lang_sv (** Swedish *)
      | Lang_tr (** Turkish *)
      | Lang_zh_CN (** Chinese (Simplified) *)
      | Lang_zh_TW (** Chinese (Traditional) *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgType :
  sig
    type t =
      | Default
      | Clipart (** clipart *)
      | Face (** face *)
      | Lineart (** lineart *)
      | News (** news *)
      | Photo (** photo *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgSize :
  sig
    type t =
      | Default
      | Huge (** huge *)
      | Icon (** icon *)
      | Large (** large *)
      | Medium (** medium *)
      | Small (** small *)
      | Xlarge (** xlarge *)
      | Xxlarge (** xxlarge *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgDominantColor :
  sig
    type t =
      | Default
      | Black (** black *)
      | Blue (** blue *)
      | Brown (** brown *)
      | Gray (** gray *)
      | Green (** green *)
      | Pink (** pink *)
      | Purple (** purple *)
      | Teal (** teal *)
      | White (** white *)
      | Yellow (** yellow *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgColorType :
  sig
    type t =
      | Default
      | Color (** color *)
      | Gray (** gray *)
      | Mono (** mono *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Filter :
  sig
    type t =
      | Default
      | V0 (** Turns off duplicate content filter. *)
      | V1 (** Turns on duplicate content filter. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Returns metadata about the search performed, metadata about the custom search engine used for the search, and the search results.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/customsearch/"]).
    @param std_params Optional standard parameters.
    @param num Number of search results to return
    @param safe Search safety level
    @param c2coff Turns off the translation between zh-CN and zh-TW.
    @param cr Country restrict(s).
    @param cref The URL of a linked custom search engine
    @param cx The custom search engine ID to scope this search query
    @param dateRestrict Specifies all search results are from a time period
    @param exactTerms Identifies a phrase that all documents in the search results must contain
    @param excludeTerms Identifies a word or phrase that should not appear in any documents in the search results
    @param fileType Returns images of a specified type. Some of the allowed values are: bmp, gif, png, jpg, svg, pdf, ...
    @param filter Controls turning on or off the duplicate content filter.
    @param gl Geolocation of end user.
    @param googlehost The local Google domain to use to perform the search.
    @param highRange Creates a range in form as_nlo value..as_nhi value and attempts to append it to query
    @param hl Sets the user interface language.
    @param hq Appends the extra query terms to the query.
    @param imgColorType Returns black and white, grayscale, or color images: mono, gray, and color.
    @param imgDominantColor Returns images of a specific dominant color: yellow, green, teal, blue, purple, pink, white, gray, black and brown.
    @param imgSize Returns images of a specified size, where size can be one of: icon, small, medium, large, xlarge, xxlarge, and huge.
    @param imgType Returns images of a type, which can be one of: clipart, face, lineart, news, and photo.
    @param linkSite Specifies that all search results should contain a link to a particular URL
    @param lowRange Creates a range in form as_nlo value..as_nhi value and attempts to append it to query
    @param lr The language restriction for the search results
    @param orTerms Provides additional search terms to check for in a document, where each document in the search results must contain at least one of the additional search terms
    @param relatedSite Specifies that all search results should be pages that are related to the specified URL
    @param rights Filters based on licensing. Supported values include: cc_publicdomain, cc_attribute, cc_sharealike, cc_noncommercial, cc_nonderived and combinations of these.
    @param searchType Specifies the search type: image.
    @param siteSearch Specifies all search results should be pages from a given site
    @param siteSearchFilter Controls whether to include or exclude results from the site named in the as_sitesearch parameter
    @param sort The sort expression to apply to the results
    @param start The index of the first result to return
    @param q Query
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?num:int ->
    ?safe:Safe.t ->
    ?c2coff:string ->
    ?cr:string ->
    ?cref:string ->
    ?cx:string ->
    ?dateRestrict:string ->
    ?exactTerms:string ->
    ?excludeTerms:string ->
    ?fileType:string ->
    ?filter:Filter.t ->
    ?gl:string ->
    ?googlehost:string ->
    ?highRange:string ->
    ?hl:string ->
    ?hq:string ->
    ?imgColorType:ImgColorType.t ->
    ?imgDominantColor:ImgDominantColor.t ->
    ?imgSize:ImgSize.t ->
    ?imgType:ImgType.t ->
    ?linkSite:string ->
    ?lowRange:string ->
    ?lr:Lr.t ->
    ?orTerms:string ->
    ?relatedSite:string ->
    ?rights:string ->
    ?searchType:SearchType.t ->
    ?siteSearch:string ->
    ?siteSearchFilter:SiteSearchFilter.t ->
    ?sort:string ->
    ?start:int ->
    q:string ->
    GapiConversation.Session.t ->
    GapiCustomsearchV1Model.Search.t * GapiConversation.Session.t
  
  
end


