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
      | E
      | I
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module SearchType :
  sig
    type t =
      | Default
      | Image
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
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
  
  module ImgType :
  sig
    type t =
      | Default
      | Clipart
      | Face
      | Lineart
      | News
      | Photo
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgSize :
  sig
    type t =
      | Default
      | Huge
      | Icon
      | Large
      | Medium
      | Small
      | Xlarge
      | Xxlarge
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgDominantColor :
  sig
    type t =
      | Default
      | Black
      | Blue
      | Brown
      | Gray
      | Green
      | Pink
      | Purple
      | Teal
      | White
      | Yellow
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module ImgColorType :
  sig
    type t =
      | Default
      | Color
      | Gray
      | Mono
      
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


