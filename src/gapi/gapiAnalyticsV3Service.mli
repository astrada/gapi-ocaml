(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Google Analytics API (v3).
  
  View and manage your Google Analytics data.
  
  For more information about this service, see the
  {{:http://code.google.com/apis/analytics}API Documentation}.
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


