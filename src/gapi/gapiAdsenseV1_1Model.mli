(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for AdSense Management API (v1.1).
  
  For more information about this data model, see the
  {{:https://developers.google.com/adsense/management/}API Documentation}.
  *)

module AdUnit :
sig
  type t = {
    code : string;
    (** Identity code of this ad unit, not necessarily unique across ad clients. *)
    id : string;
    (** Unique identifier of this ad unit. This should be considered an opaque identifier; it is not safe to rely on it being in any particular format. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#adUnit. *)
    name : string;
    (** Name of this ad unit. *)
    status : string;
    (** Status of this ad unit. Possible values are:
NEW: Indicates that the ad unit was created within the last seven days and does not yet have any activity associated with it.

ACTIVE: Indicates that there has been activity on this ad unit in the last seven days.

INACTIVE: Indicates that there has been no activity on this ad unit in the last seven days. *)
    
  }
  
  val code : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomChannel :
sig
  module TargetingInfo :
  sig
    type t = {
      adsAppearOn : string;
      (** The name used to describe this channel externally. *)
      description : string;
      (** The external description of the channel. *)
      location : string;
      (** The locations in which ads appear. (Only valid for content and mobile content ads). Acceptable values for content ads are: TOP_LEFT, TOP_CENTER, TOP_RIGHT, MIDDLE_LEFT, MIDDLE_CENTER, MIDDLE_RIGHT, BOTTOM_LEFT, BOTTOM_CENTER, BOTTOM_RIGHT, MULTIPLE_LOCATIONS. Acceptable values for mobile content ads are: TOP, MIDDLE, BOTTOM, MULTIPLE_LOCATIONS. *)
      siteLanguage : string;
      (** The language of the sites ads will be displayed on. *)
      
    }
    
    val adsAppearOn : (t, string) GapiLens.t
    val description : (t, string) GapiLens.t
    val location : (t, string) GapiLens.t
    val siteLanguage : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    code : string;
    (** Code of this custom channel, not necessarily unique across ad clients. *)
    id : string;
    (** Unique identifier of this custom channel. This should be considered an opaque identifier; it is not safe to rely on it being in any particular format. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#customChannel. *)
    name : string;
    (** Name of this custom channel. *)
    targetingInfo : TargetingInfo.t;
    (** The targeting information of this custom channel, if activated. *)
    
  }
  
  val code : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val targetingInfo : (t, TargetingInfo.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdUnits :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : AdUnit.t list;
    (** The ad units returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#adUnits. *)
    nextPageToken : string;
    (** Continuation token used to page through ad units. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, AdUnit.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UrlChannel :
sig
  type t = {
    id : string;
    (** Unique identifier of this URL channel. This should be considered an opaque identifier; it is not safe to rely on it being in any particular format. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#urlChannel. *)
    urlPattern : string;
    (** URL Pattern of this URL channel. Does not include "http://" or "https://". Example: www.example.com/home *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val urlPattern : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdClient :
sig
  type t = {
    id : string;
    (** Unique identifier of this ad client. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#adClient. *)
    productCode : string;
    (** This ad client's product code, which corresponds to the PRODUCT_CODE report dimension. *)
    supportsReporting : bool;
    (** Whether this ad client supports being reported on. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val productCode : (t, string) GapiLens.t
  val supportsReporting : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdClients :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : AdClient.t list;
    (** The ad clients returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#adClients. *)
    nextPageToken : string;
    (** Continuation token used to page through ad clients. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, AdClient.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Account :
sig
  type t = {
    id : string;
    (** Unique identifier of this account. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#account. *)
    name : string;
    (** Name of this account. *)
    subAccounts : t list;
    (** Sub accounts of the this account. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val subAccounts : (t, t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UrlChannels :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : UrlChannel.t list;
    (** The URL channels returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#urlChannels. *)
    nextPageToken : string;
    (** Continuation token used to page through URL channels. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, UrlChannel.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdsenseReportsGenerateResponse :
sig
  module Headers :
  sig
    type t = {
      currency : string;
      (** The currency of this column. Only present if the header type is METRIC_CURRENCY. *)
      name : string;
      (** The name of the header. *)
      _type : string;
      (** The type of the header; one of DIMENSION, METRIC_TALLY, METRIC_RATIO, or METRIC_CURRENCY. *)
      
    }
    
    val currency : (t, string) GapiLens.t
    val name : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    averages : string list;
    (** The averages of the report. This is the same length as any other row in the report; cells corresponding to dimension columns are empty. *)
    headers : Headers.t list;
    (** The header information of the columns requested in the report. This is a list of headers; one for each dimension in the request, followed by one for each metric in the request. *)
    kind : string;
    (** Kind this is, in this case adsense#report. *)
    rows : string list list;
    (** The output rows of the report. Each row is a list of cells; one for each dimension in the request, followed by one for each metric in the request. The dimension cells contain strings, and the metric cells contain numbers. *)
    totalMatchedRows : int64;
    (** The total number of rows matched by the report request. Fewer rows may be returned in the response due to being limited by the row count requested or the report row limit. *)
    totals : string list;
    (** The totals of the report. This is the same length as any other row in the report; cells corresponding to dimension columns are empty. *)
    warnings : string list;
    (** Any warnings associated with generation of the report. *)
    
  }
  
  val averages : (t, string list) GapiLens.t
  val headers : (t, Headers.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val rows : (t, string list list) GapiLens.t
  val totalMatchedRows : (t, int64) GapiLens.t
  val totals : (t, string list) GapiLens.t
  val warnings : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomChannels :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : CustomChannel.t list;
    (** The custom channels returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#customChannels. *)
    nextPageToken : string;
    (** Continuation token used to page through custom channels. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, CustomChannel.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Accounts :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : Account.t list;
    (** The accounts returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#accounts. *)
    nextPageToken : string;
    (** Continuation token used to page through accounts. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Account.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

