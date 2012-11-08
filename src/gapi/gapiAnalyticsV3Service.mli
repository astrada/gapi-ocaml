(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Google Analytics API (v3).
  
  View and manage your Google Analytics data.
  
  For more information about this service, see the
  {{:https://developers.google.com/analytics/}API Documentation}.
  *)

module Scope :
sig
  val analytics : string
  (** View and manage your Google Analytics data *)
  
  val analytics_readonly : string
  (** View your Google Analytics data *)
  
  
end
(** Service Auth Scopes *)

module DataResource :
sig
  module Mcf :
  sig
    
    (** Returns Analytics Multi-Channel Funnels data for a profile.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param dimensions A comma-separated list of Multi-Channel Funnels dimensions. E.g., 'mcf:source,mcf:medium'.
      @param filters A comma-separated list of dimension or metric filters to be applied to the Analytics data.
      @param max_results The maximum number of entries to include in this feed.
      @param sort A comma-separated list of dimensions or metrics that determine the sort order for the Analytics data.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param ids Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX, where XXXX is the Analytics profile ID.
      @param start_date Start date for fetching Analytics data. All requests should specify a start date formatted as YYYY-MM-DD.
      @param end_date End date for fetching Analytics data. All requests should specify an end date formatted as YYYY-MM-DD.
      @param metrics A comma-separated list of Multi-Channel Funnels metrics. E.g., 'mcf:totalConversions,mcf:totalConversionValue'. At least one metric must be specified.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?dimensions:string ->
      ?filters:string ->
      ?max_results:int ->
      ?sort:string ->
      ?start_index:int ->
      ids:string ->
      start_date:string ->
      end_date:string ->
      metrics:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.McfData.t * GapiConversation.Session.t
    
    
  end
  
  module Ga :
  sig
    
    (** Returns Analytics data for a profile.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param dimensions A comma-separated list of Analytics dimensions. E.g., 'ga:browser,ga:city'.
      @param filters A comma-separated list of dimension or metric filters to be applied to Analytics data.
      @param max_results The maximum number of entries to include in this feed.
      @param segment An Analytics advanced segment to be applied to data.
      @param sort A comma-separated list of dimensions or metrics that determine the sort order for Analytics data.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param ids Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX, where XXXX is the Analytics profile ID.
      @param start_date Start date for fetching Analytics data. All requests should specify a start date formatted as YYYY-MM-DD.
      @param end_date End date for fetching Analytics data. All requests should specify an end date formatted as YYYY-MM-DD.
      @param metrics A comma-separated list of Analytics metrics. E.g., 'ga:visits,ga:pageviews'. At least one metric must be specified.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?dimensions:string ->
      ?filters:string ->
      ?max_results:int ->
      ?segment:string ->
      ?sort:string ->
      ?start_index:int ->
      ids:string ->
      start_date:string ->
      end_date:string ->
      metrics:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.GaData.t * GapiConversation.Session.t
    
    
  end
  
  
  
end

module ManagementResource :
sig
  module Webproperties :
  sig
    
    (** Lists web properties to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of web properties to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve web properties for. Can either be a specific account ID or '~all', which refers to all the accounts that user has access to.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Webproperties.t * GapiConversation.Session.t
    
    
  end
  
  module Segments :
  sig
    
    (** Lists advanced segments to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of advanced segments to include in this response.
      @param start_index An index of the first advanced segment to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Segments.t * GapiConversation.Session.t
    
    
  end
  
  module Profiles :
  sig
    
    (** Lists profiles to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of profiles to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID for the profiles to retrieve. Can either be a specific account ID or '~all', which refers to all the accounts to which the user has access.
      @param webPropertyId Web property ID for the profiles to retrieve. Can either be a specific web property ID or '~all', which refers to all the web properties to which the user has access.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Profiles.t * GapiConversation.Session.t
    
    
  end
  
  module Goals :
  sig
    
    (** Lists goals to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of goals to include in this response.
      @param start_index An index of the first goal to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve goals for. Can either be a specific account ID or '~all', which refers to all the accounts that user has access to.
      @param webPropertyId Web property ID to retrieve goals for. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
      @param profileId Profile ID to retrieve goals for. Can either be a specific profile ID or '~all', which refers to all the profiles that user has access to.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Goals.t * GapiConversation.Session.t
    
    
  end
  
  module DailyUploads :
  sig
    
    module Type :
    sig
      type t =
        | Default
        | Cost
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Delete uploaded data for the given date.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account Id associated with daily upload delete.
      @param webPropertyId Web property Id associated with daily upload delete.
      @param customDataSourceId Custom data source Id associated with daily upload delete.
      @param date Date for which data is to be deleted. Date should be formatted as YYYY-MM-DD.
      @param _type Type of data for this delete.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      date:string ->
      _type:Type.t ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** List daily uploads to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of custom data sources to include in this response.
      @param start_index A 1-based index of the first daily upload to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account Id for the daily uploads to retrieve.
      @param webPropertyId Web property Id for the daily uploads to retrieve.
      @param customDataSourceId Custom data source Id for daily uploads to retrieve.
      @param start_date Start date of the form YYYY-MM-DD.
      @param end_date End date of the form YYYY-MM-DD.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      start_date:string ->
      end_date:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.DailyUploads.t * GapiConversation.Session.t
    
    (** Update/Overwrite data for a custom data source.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param reset Reset/Overwrite all previous appends for this date and start over with this file as the first upload.
      @param accountId Account Id associated with daily upload.
      @param webPropertyId Web property Id associated with daily upload.
      @param customDataSourceId Custom data source Id to which the data being uploaded belongs.
      @param date Date for which data is uploaded. Date should be formatted as YYYY-MM-DD.
      @param appendNumber Append number for this upload indexed from 1.
      @param _type Type of data for this upload.
      *)
    val upload :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      ?reset:bool ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      date:string ->
      appendNumber:int ->
      _type:Type.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.DailyUploadAppend.t * GapiConversation.Session.t
    
    
  end
  
  module CustomDataSources :
  sig
    
    (** List custom data sources to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of custom data sources to include in this response.
      @param start_index A 1-based index of the first custom data source to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account Id for the custom data sources to retrieve.
      @param webPropertyId Web property Id for the custom data sources to retrieve.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomDataSources.t * GapiConversation.Session.t
    
    
  end
  
  module Accounts :
  sig
    
    (** Lists all accounts to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of accounts to include in this response.
      @param start_index An index of the first account to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Accounts.t * GapiConversation.Session.t
    
    
  end
  
  
  
end


