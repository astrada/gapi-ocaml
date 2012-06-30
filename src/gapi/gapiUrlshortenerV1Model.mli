(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for URL Shortener API (v1).
  
  For more information about this data model, see the
  {{:http://code.google.com/apis/urlshortener/v1/getting_started.html}API Documentation}.
  *)

module StringCount :
sig
  type t = {
    count : int64;
    (** Number of clicks for this top entry, e.g. for this particular country or browser. *)
    id : string;
    (** Label assigned to this top entry, e.g. "US" or "Chrome". *)
    
  }
  
  val count : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AnalyticsSnapshot :
sig
  type t = {
    browsers : StringCount.t list;
    (** Top browsers, e.g. "Chrome"; sorted by (descending) click counts. Only present if this data is available. *)
    countries : StringCount.t list;
    (** Top countries (expressed as country codes), e.g. "US" or "DE"; sorted by (descending) click counts. Only present if this data is available. *)
    longUrlClicks : int64;
    (** Number of clicks on all goo.gl short URLs pointing to this long URL. *)
    platforms : StringCount.t list;
    (** Top platforms or OSes, e.g. "Windows"; sorted by (descending) click counts. Only present if this data is available. *)
    referrers : StringCount.t list;
    (** Top referring hosts, e.g. "www.google.com"; sorted by (descending) click counts. Only present if this data is available. *)
    shortUrlClicks : int64;
    (** Number of clicks on this short URL. *)
    
  }
  
  val browsers : (t, StringCount.t list) GapiLens.t
  val countries : (t, StringCount.t list) GapiLens.t
  val longUrlClicks : (t, int64) GapiLens.t
  val platforms : (t, StringCount.t list) GapiLens.t
  val referrers : (t, StringCount.t list) GapiLens.t
  val shortUrlClicks : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AnalyticsSummary :
sig
  type t = {
    allTime : AnalyticsSnapshot.t;
    (** Click analytics over all time. *)
    day : AnalyticsSnapshot.t;
    (** Click analytics over the last day. *)
    month : AnalyticsSnapshot.t;
    (** Click analytics over the last month. *)
    twoHours : AnalyticsSnapshot.t;
    (** Click analytics over the last two hours. *)
    week : AnalyticsSnapshot.t;
    (** Click analytics over the last week. *)
    
  }
  
  val allTime : (t, AnalyticsSnapshot.t) GapiLens.t
  val day : (t, AnalyticsSnapshot.t) GapiLens.t
  val month : (t, AnalyticsSnapshot.t) GapiLens.t
  val twoHours : (t, AnalyticsSnapshot.t) GapiLens.t
  val week : (t, AnalyticsSnapshot.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Url :
sig
  type t = {
    analytics : AnalyticsSummary.t;
    (** A summary of the click analytics for the short and long URL. Might not be present if not requested or currently unavailable. *)
    created : string;
    (** Time the short URL was created; ISO 8601 representation using the yyyy-MM-dd'T'HH:mm:ss.SSSZZ format, e.g. "2010-10-14T19:01:24.944+00:00". *)
    id : string;
    (** Short URL, e.g. "http://goo.gl/l6MS". *)
    kind : string;
    (** The fixed string "urlshortener#url". *)
    longUrl : string;
    (** Long URL, e.g. "http://www.google.com/". Might not be present if the status is "REMOVED". *)
    status : string;
    (** Status of the target URL. Possible values: "OK", "MALWARE", "PHISHING", or "REMOVED". A URL might be marked "REMOVED" if it was flagged as spam, for example. *)
    
  }
  
  val analytics : (t, AnalyticsSummary.t) GapiLens.t
  val created : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val longUrl : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UrlHistory :
sig
  type t = {
    items : Url.t list;
    (** A list of URL resources. *)
    itemsPerPage : int;
    (** Number of items returned with each full "page" of results. Note that the last page could have fewer items than the "itemsPerPage" value. *)
    kind : string;
    (** The fixed string "urlshortener#urlHistory". *)
    nextPageToken : string;
    (** A token to provide to get the next page of results. *)
    totalItems : int;
    (** Total number of short URLs associated with this user (may be approximate). *)
    
  }
  
  val items : (t, Url.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val totalItems : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

