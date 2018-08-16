(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for AdSense Management API (v1.4).
  
  For more information about this data model, see the
  {{:https://developers.google.com/adsense/management/}API Documentation}.
  *)

module Payment :
sig
  type t = {
    id : string;
    (** Unique identifier of this Payment. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#payment. *)
    paymentAmount : string;
    (** The amount to be paid. *)
    paymentAmountCurrencyCode : string;
    (** The currency code for the amount to be paid. *)
    paymentDate : string;
    (** The date this payment was/will be credited to the user, or none if the payment threshold has not been met. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val paymentAmount : (t, string) GapiLens.t
  val paymentAmountCurrencyCode : (t, string) GapiLens.t
  val paymentDate : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Payments :
sig
  type t = {
    items : Payment.t list;
    (** The list of Payments for the account. One or both of a) the account's most recent payment; and b) the account's upcoming payment. *)
    kind : string;
    (** Kind of list this is, in this case adsense#payments. *)
    
  }
  
  val items : (t, Payment.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SavedReport :
sig
  type t = {
    id : string;
    (** Unique identifier of this saved report. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#savedReport. *)
    name : string;
    (** This saved report's name. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SavedReports :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : SavedReport.t list;
    (** The saved reports returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#savedReports. *)
    nextPageToken : string;
    (** Continuation token used to page through saved reports. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, SavedReport.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdStyle :
sig
  module Font :
  sig
    type t = {
      family : string;
      (** The family of the font. *)
      size : string;
      (** The size of the font. *)
      
    }
    
    val family : (t, string) GapiLens.t
    val size : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Colors :
  sig
    type t = {
      background : string;
      (** The color of the ad background. *)
      border : string;
      (** The color of the ad border. *)
      text : string;
      (** The color of the ad text. *)
      title : string;
      (** The color of the ad title. *)
      url : string;
      (** The color of the ad url. *)
      
    }
    
    val background : (t, string) GapiLens.t
    val border : (t, string) GapiLens.t
    val text : (t, string) GapiLens.t
    val title : (t, string) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    colors : Colors.t;
    (** The colors which are included in the style. These are represented as six hexadecimal characters, similar to HTML color codes, but without the leading hash. *)
    corners : string;
    (** The style of the corners in the ad (deprecated: never populated, ignored). *)
    font : Font.t;
    (** The font which is included in the style. *)
    kind : string;
    (** Kind this is, in this case adsense#adStyle. *)
    
  }
  
  val colors : (t, Colors.t) GapiLens.t
  val corners : (t, string) GapiLens.t
  val font : (t, Font.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SavedAdStyle :
sig
  type t = {
    adStyle : AdStyle.t;
    (** The AdStyle itself. *)
    id : string;
    (** Unique identifier of this saved ad style. This should be considered an opaque identifier; it is not safe to rely on it being in any particular format. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#savedAdStyle. *)
    name : string;
    (** The user selected name of this SavedAdStyle. *)
    
  }
  
  val adStyle : (t, AdStyle.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SavedAdStyles :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : SavedAdStyle.t list;
    (** The saved ad styles returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#savedAdStyles. *)
    nextPageToken : string;
    (** Continuation token used to page through ad units. To retrieve the next page of results, set the next request's "pageToken" value to this. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, SavedAdStyle.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdCode :
sig
  type t = {
    adCode : string;
    (** The Auto ad code snippet. The ad code snippet. *)
    ampBody : string;
    (** The AMP Auto ad code snippet that goes in the body of an AMP page. *)
    ampHead : string;
    (** The AMP Auto ad code snippet that goes in the head of an AMP page. *)
    kind : string;
    (** Kind this is, in this case adsense#adCode. *)
    
  }
  
  val adCode : (t, string) GapiLens.t
  val ampBody : (t, string) GapiLens.t
  val ampHead : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdClient :
sig
  type t = {
    arcOptIn : bool;
    (** Whether this ad client is opted in to ARC. *)
    id : string;
    (** Unique identifier of this ad client. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#adClient. *)
    productCode : string;
    (** This ad client's product code, which corresponds to the PRODUCT_CODE report dimension. *)
    supportsReporting : bool;
    (** Whether this ad client supports being reported on. *)
    
  }
  
  val arcOptIn : (t, bool) GapiLens.t
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

module AdUnit :
sig
  module MobileContentAdsSettings :
  sig
    type t = {
      markupLanguage : string;
      (** The markup language to use for this ad unit. *)
      scriptingLanguage : string;
      (** The scripting language to use for this ad unit. *)
      size : string;
      (** Size of this ad unit. *)
      _type : string;
      (** Type of this ad unit. *)
      
    }
    
    val markupLanguage : (t, string) GapiLens.t
    val scriptingLanguage : (t, string) GapiLens.t
    val size : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module FeedAdsSettings :
  sig
    type t = {
      adPosition : string;
      (** The position of the ads relative to the feed entries. *)
      frequency : int;
      (** The frequency at which ads should appear in the feed (i.e. every N entries). *)
      minimumWordCount : int;
      (** The minimum length an entry should be in order to have attached ads. *)
      _type : string;
      (** The type of ads which should appear. *)
      
    }
    
    val adPosition : (t, string) GapiLens.t
    val frequency : (t, int) GapiLens.t
    val minimumWordCount : (t, int) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ContentAdsSettings :
  sig
    module BackupOption :
    sig
      type t = {
        color : string;
        (** Color to use when type is set to COLOR. *)
        _type : string;
        (** Type of the backup option. Possible values are BLANK, COLOR and URL. *)
        url : string;
        (** URL to use when type is set to URL. *)
        
      }
      
      val color : (t, string) GapiLens.t
      val _type : (t, string) GapiLens.t
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      backupOption : BackupOption.t;
      (** The backup option to be used in instances where no ad is available. *)
      size : string;
      (** Size of this ad unit. *)
      _type : string;
      (** Type of this ad unit. *)
      
    }
    
    val backupOption : (t, BackupOption.t) GapiLens.t
    val size : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    code : string;
    (** Identity code of this ad unit, not necessarily unique across ad clients. *)
    contentAdsSettings : ContentAdsSettings.t;
    (** Settings specific to content ads (AFC) and highend mobile content ads (AFMC - deprecated). *)
    customStyle : AdStyle.t;
    (** Custom style information specific to this ad unit. *)
    feedAdsSettings : FeedAdsSettings.t;
    (** Settings specific to feed ads (AFF) - deprecated. *)
    id : string;
    (** Unique identifier of this ad unit. This should be considered an opaque identifier; it is not safe to rely on it being in any particular format. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#adUnit. *)
    mobileContentAdsSettings : MobileContentAdsSettings.t;
    (** Settings specific to WAP mobile content ads (AFMC) - deprecated. *)
    name : string;
    (** Name of this ad unit. *)
    savedStyleId : string;
    (** ID of the saved ad style which holds this ad unit's style information. *)
    status : string;
    (** Status of this ad unit. Possible values are:
NEW: Indicates that the ad unit was created within the last seven days and does not yet have any activity associated with it.

ACTIVE: Indicates that there has been activity on this ad unit in the last seven days.

INACTIVE: Indicates that there has been no activity on this ad unit in the last seven days. *)
    
  }
  
  val code : (t, string) GapiLens.t
  val contentAdsSettings : (t, ContentAdsSettings.t) GapiLens.t
  val customStyle : (t, AdStyle.t) GapiLens.t
  val feedAdsSettings : (t, FeedAdsSettings.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val mobileContentAdsSettings : (t, MobileContentAdsSettings.t) GapiLens.t
  val name : (t, string) GapiLens.t
  val savedStyleId : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  
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
      (** The locations in which ads appear. (Only valid for content and mobile content ads (deprecated)). Acceptable values for content ads are: TOP_LEFT, TOP_CENTER, TOP_RIGHT, MIDDLE_LEFT, MIDDLE_CENTER, MIDDLE_RIGHT, BOTTOM_LEFT, BOTTOM_CENTER, BOTTOM_RIGHT, MULTIPLE_LOCATIONS. Acceptable values for mobile content ads (deprecated) are: TOP, MIDDLE, BOTTOM, MULTIPLE_LOCATIONS. *)
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

module Alert :
sig
  type t = {
    id : string;
    (** Unique identifier of this alert. This should be considered an opaque identifier; it is not safe to rely on it being in any particular format. *)
    isDismissible : bool;
    (** Whether this alert can be dismissed. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#alert. *)
    message : string;
    (** The localized alert message. *)
    severity : string;
    (** Severity of this alert. Possible values: INFO, WARNING, SEVERE. *)
    _type : string;
    (** Type of this alert. Possible values: SELF_HOLD, MIGRATED_TO_BILLING3, ADDRESS_PIN_VERIFICATION, PHONE_PIN_VERIFICATION, CORPORATE_ENTITY, GRAYLISTED_PUBLISHER, API_HOLD. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val isDismissible : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val message : (t, string) GapiLens.t
  val severity : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Alerts :
sig
  type t = {
    items : Alert.t list;
    (** The alerts returned in this list response. *)
    kind : string;
    (** Kind of list this is, in this case adsense#alerts. *)
    
  }
  
  val items : (t, Alert.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
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

module Account :
sig
  type t = {
    creation_time : int64;
    (**  *)
    id : string;
    (** Unique identifier of this account. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#account. *)
    name : string;
    (** Name of this account. *)
    premium : bool;
    (** Whether this account is premium. *)
    subAccounts : t list;
    (** Sub accounts of the this account. *)
    timezone : string;
    (** AdSense timezone of this account. *)
    
  }
  
  val creation_time : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val premium : (t, bool) GapiLens.t
  val subAccounts : (t, t list) GapiLens.t
  val timezone : (t, string) GapiLens.t
  
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

module ReportingMetadataEntry :
sig
  type t = {
    compatibleDimensions : string list;
    (** For metrics this is a list of dimension IDs which the metric is compatible with, for dimensions it is a list of compatibility groups the dimension belongs to. *)
    compatibleMetrics : string list;
    (** The names of the metrics the dimension or metric this reporting metadata entry describes is compatible with. *)
    id : string;
    (** Unique identifier of this reporting metadata entry, corresponding to the name of the appropriate dimension or metric. *)
    kind : string;
    (** Kind of resource this is, in this case adsense#reportingMetadataEntry. *)
    requiredDimensions : string list;
    (** The names of the dimensions which the dimension or metric this reporting metadata entry describes requires to also be present in order for the report to be valid. Omitting these will not cause an error or warning, but may result in data which cannot be correctly interpreted. *)
    requiredMetrics : string list;
    (** The names of the metrics which the dimension or metric this reporting metadata entry describes requires to also be present in order for the report to be valid. Omitting these will not cause an error or warning, but may result in data which cannot be correctly interpreted. *)
    supportedProducts : string list;
    (** The codes of the projects supported by the dimension or metric this reporting metadata entry describes. *)
    
  }
  
  val compatibleDimensions : (t, string list) GapiLens.t
  val compatibleMetrics : (t, string list) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val requiredDimensions : (t, string list) GapiLens.t
  val requiredMetrics : (t, string list) GapiLens.t
  val supportedProducts : (t, string list) GapiLens.t
  
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
    endDate : string;
    (** The requested end date in yyyy-mm-dd format. *)
    headers : Headers.t list;
    (** The header information of the columns requested in the report. This is a list of headers; one for each dimension in the request, followed by one for each metric in the request. *)
    kind : string;
    (** Kind this is, in this case adsense#report. *)
    rows : string list list;
    (** The output rows of the report. Each row is a list of cells; one for each dimension in the request, followed by one for each metric in the request. The dimension cells contain strings, and the metric cells contain numbers. *)
    startDate : string;
    (** The requested start date in yyyy-mm-dd format. *)
    totalMatchedRows : int64;
    (** The total number of rows matched by the report request. Fewer rows may be returned in the response due to being limited by the row count requested or the report row limit. *)
    totals : string list;
    (** The totals of the report. This is the same length as any other row in the report; cells corresponding to dimension columns are empty. *)
    warnings : string list;
    (** Any warnings associated with generation of the report. *)
    
  }
  
  val averages : (t, string list) GapiLens.t
  val endDate : (t, string) GapiLens.t
  val headers : (t, Headers.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val rows : (t, string list list) GapiLens.t
  val startDate : (t, string) GapiLens.t
  val totalMatchedRows : (t, int64) GapiLens.t
  val totals : (t, string list) GapiLens.t
  val warnings : (t, string list) GapiLens.t
  
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

module Metadata :
sig
  type t = {
    items : ReportingMetadataEntry.t list;
    (**  *)
    kind : string;
    (** Kind of list this is, in this case adsense#metadata. *)
    
  }
  
  val items : (t, ReportingMetadataEntry.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

