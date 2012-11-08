(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for CustomSearch API (v1).
  
  For more information about this data model, see the
  {{:https://developers.google.com/custom-search/v1/using_rest}API Documentation}.
  *)

module Promotion :
sig
  module Image :
  sig
    type t = {
      height : int;
      (**  *)
      source : string;
      (**  *)
      width : int;
      (**  *)
      
    }
    
    val height : (t, int) GapiLens.t
    val source : (t, string) GapiLens.t
    val width : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BodyLines :
  sig
    type t = {
      htmlTitle : string;
      (**  *)
      link : string;
      (**  *)
      title : string;
      (**  *)
      url : string;
      (**  *)
      
    }
    
    val htmlTitle : (t, string) GapiLens.t
    val link : (t, string) GapiLens.t
    val title : (t, string) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    bodyLines : BodyLines.t list;
    (**  *)
    displayLink : string;
    (**  *)
    htmlTitle : string;
    (**  *)
    image : Image.t;
    (**  *)
    link : string;
    (**  *)
    title : string;
    (**  *)
    
  }
  
  val bodyLines : (t, BodyLines.t list) GapiLens.t
  val displayLink : (t, string) GapiLens.t
  val htmlTitle : (t, string) GapiLens.t
  val image : (t, Image.t) GapiLens.t
  val link : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Query :
sig
  type t = {
    count : int;
    (**  *)
    cr : string;
    (**  *)
    cref : string;
    (**  *)
    cx : string;
    (**  *)
    dateRestrict : string;
    (**  *)
    disableCnTwTranslation : string;
    (**  *)
    exactTerms : string;
    (**  *)
    excludeTerms : string;
    (**  *)
    fileType : string;
    (**  *)
    filter : string;
    (**  *)
    gl : string;
    (**  *)
    googleHost : string;
    (**  *)
    highRange : string;
    (**  *)
    hl : string;
    (**  *)
    hq : string;
    (**  *)
    imgColorType : string;
    (**  *)
    imgDominantColor : string;
    (**  *)
    imgSize : string;
    (**  *)
    imgType : string;
    (**  *)
    inputEncoding : string;
    (**  *)
    language : string;
    (**  *)
    linkSite : string;
    (**  *)
    lowRange : string;
    (**  *)
    orTerms : string;
    (**  *)
    outputEncoding : string;
    (**  *)
    relatedSite : string;
    (**  *)
    rights : string;
    (**  *)
    safe : string;
    (**  *)
    searchTerms : string;
    (**  *)
    searchType : string;
    (**  *)
    siteSearch : string;
    (**  *)
    siteSearchFilter : string;
    (**  *)
    sort : string;
    (**  *)
    startIndex : int;
    (**  *)
    startPage : int;
    (**  *)
    title : string;
    (**  *)
    totalResults : int64;
    (**  *)
    
  }
  
  val count : (t, int) GapiLens.t
  val cr : (t, string) GapiLens.t
  val cref : (t, string) GapiLens.t
  val cx : (t, string) GapiLens.t
  val dateRestrict : (t, string) GapiLens.t
  val disableCnTwTranslation : (t, string) GapiLens.t
  val exactTerms : (t, string) GapiLens.t
  val excludeTerms : (t, string) GapiLens.t
  val fileType : (t, string) GapiLens.t
  val filter : (t, string) GapiLens.t
  val gl : (t, string) GapiLens.t
  val googleHost : (t, string) GapiLens.t
  val highRange : (t, string) GapiLens.t
  val hl : (t, string) GapiLens.t
  val hq : (t, string) GapiLens.t
  val imgColorType : (t, string) GapiLens.t
  val imgDominantColor : (t, string) GapiLens.t
  val imgSize : (t, string) GapiLens.t
  val imgType : (t, string) GapiLens.t
  val inputEncoding : (t, string) GapiLens.t
  val language : (t, string) GapiLens.t
  val linkSite : (t, string) GapiLens.t
  val lowRange : (t, string) GapiLens.t
  val orTerms : (t, string) GapiLens.t
  val outputEncoding : (t, string) GapiLens.t
  val relatedSite : (t, string) GapiLens.t
  val rights : (t, string) GapiLens.t
  val safe : (t, string) GapiLens.t
  val searchTerms : (t, string) GapiLens.t
  val searchType : (t, string) GapiLens.t
  val siteSearch : (t, string) GapiLens.t
  val siteSearchFilter : (t, string) GapiLens.t
  val sort : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val startPage : (t, int) GapiLens.t
  val title : (t, string) GapiLens.t
  val totalResults : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Context :
sig
  module Facets :
  sig
    type t = {
      anchor : string;
      (**  *)
      label : string;
      (**  *)
      
    }
    
    val anchor : (t, string) GapiLens.t
    val label : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    facets : Facets.t list list;
    (**  *)
    title : string;
    (**  *)
    
  }
  
  val facets : (t, Facets.t list list) GapiLens.t
  val title : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Result :
sig
  module Labels :
  sig
    type t = {
      displayName : string;
      (**  *)
      name : string;
      (**  *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val name : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Image :
  sig
    type t = {
      byteSize : int;
      (**  *)
      contextLink : string;
      (**  *)
      height : int;
      (**  *)
      thumbnailHeight : int;
      (**  *)
      thumbnailLink : string;
      (**  *)
      thumbnailWidth : int;
      (**  *)
      width : int;
      (**  *)
      
    }
    
    val byteSize : (t, int) GapiLens.t
    val contextLink : (t, string) GapiLens.t
    val height : (t, int) GapiLens.t
    val thumbnailHeight : (t, int) GapiLens.t
    val thumbnailLink : (t, string) GapiLens.t
    val thumbnailWidth : (t, int) GapiLens.t
    val width : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    cacheId : string;
    (**  *)
    displayLink : string;
    (**  *)
    fileFormat : string;
    (**  *)
    formattedUrl : string;
    (**  *)
    htmlFormattedUrl : string;
    (**  *)
    htmlSnippet : string;
    (**  *)
    htmlTitle : string;
    (**  *)
    image : Image.t;
    (**  *)
    kind : string;
    (**  *)
    labels : Labels.t list;
    (**  *)
    link : string;
    (**  *)
    mime : string;
    (**  *)
    pagemap : (string * (string * string) list list) list;
    (**  *)
    snippet : string;
    (**  *)
    title : string;
    (**  *)
    
  }
  
  val cacheId : (t, string) GapiLens.t
  val displayLink : (t, string) GapiLens.t
  val fileFormat : (t, string) GapiLens.t
  val formattedUrl : (t, string) GapiLens.t
  val htmlFormattedUrl : (t, string) GapiLens.t
  val htmlSnippet : (t, string) GapiLens.t
  val htmlTitle : (t, string) GapiLens.t
  val image : (t, Image.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val labels : (t, Labels.t list) GapiLens.t
  val link : (t, string) GapiLens.t
  val mime : (t, string) GapiLens.t
  val pagemap : (t, (string * (string * string) list list) list) GapiLens.t
  val snippet : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Search :
sig
  module Url :
  sig
    type t = {
      template : string;
      (**  *)
      _type : string;
      (**  *)
      
    }
    
    val template : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Spelling :
  sig
    type t = {
      correctedQuery : string;
      (**  *)
      htmlCorrectedQuery : string;
      (**  *)
      
    }
    
    val correctedQuery : (t, string) GapiLens.t
    val htmlCorrectedQuery : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module SearchInformation :
  sig
    type t = {
      formattedSearchTime : string;
      (**  *)
      formattedTotalResults : string;
      (**  *)
      searchTime : float;
      (**  *)
      totalResults : int64;
      (**  *)
      
    }
    
    val formattedSearchTime : (t, string) GapiLens.t
    val formattedTotalResults : (t, string) GapiLens.t
    val searchTime : (t, float) GapiLens.t
    val totalResults : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    context : Context.t;
    (**  *)
    items : Result.t list;
    (**  *)
    kind : string;
    (**  *)
    promotions : Promotion.t list;
    (**  *)
    queries : (string * Query.t list) list;
    (**  *)
    searchInformation : SearchInformation.t;
    (**  *)
    spelling : Spelling.t;
    (**  *)
    url : Url.t;
    (**  *)
    
  }
  
  val context : (t, Context.t) GapiLens.t
  val items : (t, Result.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val promotions : (t, Promotion.t list) GapiLens.t
  val queries : (t, (string * Query.t list) list) GapiLens.t
  val searchInformation : (t, SearchInformation.t) GapiLens.t
  val spelling : (t, Spelling.t) GapiLens.t
  val url : (t, Url.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

