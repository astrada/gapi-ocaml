(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for AdSense Management API (v1.1).
  
  Gives AdSense publishers access to their inventory and the ability to generate reports.
  
  For more information about this service, see the
  {{:https://developers.google.com/adsense/management/}API Documentation}.
  *)

module Scope :
sig
  val adsense : string
  (** View and manage your AdSense data *)
  
  val adsense_readonly : string
  (** View your AdSense data *)
  
  
end
(** Service Auth Scopes *)

module AccountsResource :
sig
  module Urlchannels :
  sig
    
    (** List all URL channels in the specified ad client for the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param maxResults The maximum number of URL channels to include in the response, used for paging.
      @param pageToken A continuation token, used to page through URL channels. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
      @param accountId Account to which the ad client belongs.
      @param adClientId Ad client for which to list URL channels.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?pageToken:string ->
      accountId:string ->
      adClientId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.UrlChannels.t * GapiConversation.Session.t
    
    
  end
  
  module Reports :
  sig
    
    (** Generate an AdSense report based on the report request sent in the query parameters. Returns the result as JSON; to retrieve output in CSV format specify "alt=csv" as a query parameter.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param currency Optional currency to use when reporting on monetary metrics. Defaults to the account's currency if not set.
      @param dimension Dimensions to base the report on.
      @param filter Filters to be run on the report.
      @param locale Optional locale to use for translating report output to a local language. Defaults to "en_US" if not specified.
      @param maxResults The maximum number of rows of report data to return.
      @param metric Numeric columns to include in the report.
      @param sort The name of a dimension or metric to sort the resulting report on, optionally prefixed with "+" to sort ascending or "-" to sort descending. If no prefix is specified, the column is sorted ascending.
      @param startIndex Index of the first row of report data to return.
      @param accountId Account upon which to report.
      @param startDate Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
      @param endDate End of the date range to report on in "YYYY-MM-DD" format, inclusive.
      *)
    val generate :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?currency:string ->
      ?dimension:string list ->
      ?filter:string list ->
      ?locale:string ->
      ?maxResults:int ->
      ?metric:string list ->
      ?sort:string list ->
      ?startIndex:int ->
      accountId:string ->
      startDate:string ->
      endDate:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.AdsenseReportsGenerateResponse.t * GapiConversation.Session.t
    
    
  end
  
  module Customchannels :
  sig
    module Adunits :
    sig
      
      (** List all ad units in the specified custom channel.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
        @param std_params Optional standard parameters.
        @param includeInactive Whether to include inactive ad units. Default: true.
        @param maxResults The maximum number of ad units to include in the response, used for paging.
        @param pageToken A continuation token, used to page through ad units. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
        @param accountId Account to which the ad client belongs.
        @param adClientId Ad client which contains the custom channel.
        @param customChannelId Custom channel for which to list ad units.
        *)
      val list :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        ?includeInactive:bool ->
        ?maxResults:int ->
        ?pageToken:string ->
        accountId:string ->
        adClientId:string ->
        customChannelId:string ->
        GapiConversation.Session.t ->
        GapiAdsenseV1_1Model.AdUnits.t * GapiConversation.Session.t
      
      
    end
    
    
    (** Get the specified custom channel from the specified ad client for the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account to which the ad client belongs.
      @param adClientId Ad client which contains the custom channel.
      @param customChannelId Custom channel to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      adClientId:string ->
      customChannelId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.CustomChannel.t * GapiConversation.Session.t
    
    (** List all custom channels in the specified ad client for the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param maxResults The maximum number of custom channels to include in the response, used for paging.
      @param pageToken A continuation token, used to page through custom channels. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
      @param accountId Account to which the ad client belongs.
      @param adClientId Ad client for which to list custom channels.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?pageToken:string ->
      accountId:string ->
      adClientId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.CustomChannels.t * GapiConversation.Session.t
    
    
  end
  
  module Adunits :
  sig
    module Customchannels :
    sig
      
      (** List all custom channels which the specified ad unit belongs to.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
        @param std_params Optional standard parameters.
        @param maxResults The maximum number of custom channels to include in the response, used for paging.
        @param pageToken A continuation token, used to page through custom channels. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
        @param accountId Account to which the ad client belongs.
        @param adClientId Ad client which contains the ad unit.
        @param adUnitId Ad unit for which to list custom channels.
        *)
      val list :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        ?maxResults:int ->
        ?pageToken:string ->
        accountId:string ->
        adClientId:string ->
        adUnitId:string ->
        GapiConversation.Session.t ->
        GapiAdsenseV1_1Model.CustomChannels.t * GapiConversation.Session.t
      
      
    end
    
    
    (** Gets the specified ad unit in the specified ad client for the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account to which the ad client belongs.
      @param adClientId Ad client for which to get the ad unit.
      @param adUnitId Ad unit to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      adClientId:string ->
      adUnitId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.AdUnit.t * GapiConversation.Session.t
    
    (** List all ad units in the specified ad client for the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param includeInactive Whether to include inactive ad units. Default: true.
      @param maxResults The maximum number of ad units to include in the response, used for paging.
      @param pageToken A continuation token, used to page through ad units. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
      @param accountId Account to which the ad client belongs.
      @param adClientId Ad client for which to list ad units.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?includeInactive:bool ->
      ?maxResults:int ->
      ?pageToken:string ->
      accountId:string ->
      adClientId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.AdUnits.t * GapiConversation.Session.t
    
    
  end
  
  module Adclients :
  sig
    
    (** List all ad clients in the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param maxResults The maximum number of ad clients to include in the response, used for paging.
      @param pageToken A continuation token, used to page through ad clients. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
      @param accountId Account for which to list ad clients.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?pageToken:string ->
      accountId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.AdClients.t * GapiConversation.Session.t
    
    
  end
  
  
  (** Get information about the selected AdSense account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param tree Whether the tree of sub accounts should be returned.
    @param accountId Account to get information about.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?tree:bool ->
    accountId:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.Account.t * GapiConversation.Session.t
  
  (** List all accounts available to this AdSense account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of accounts to include in the response, used for paging.
    @param pageToken A continuation token, used to page through accounts. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.Accounts.t * GapiConversation.Session.t
  
  
end

module AdclientsResource :
sig
  
  (** List all ad clients in this AdSense account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of ad clients to include in the response, used for paging.
    @param pageToken A continuation token, used to page through ad clients. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.AdClients.t * GapiConversation.Session.t
  
  
end

module AdunitsResource :
sig
  module Customchannels :
  sig
    
    (** List all custom channels which the specified ad unit belongs to.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param maxResults The maximum number of custom channels to include in the response, used for paging.
      @param pageToken A continuation token, used to page through custom channels. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
      @param adClientId Ad client which contains the ad unit.
      @param adUnitId Ad unit for which to list custom channels.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?pageToken:string ->
      adClientId:string ->
      adUnitId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.CustomChannels.t * GapiConversation.Session.t
    
    
  end
  
  
  (** Gets the specified ad unit in the specified ad client.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param adClientId Ad client for which to get the ad unit.
    @param adUnitId Ad unit to retrieve.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    adClientId:string ->
    adUnitId:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.AdUnit.t * GapiConversation.Session.t
  
  (** List all ad units in the specified ad client for this AdSense account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param std_params Optional standard parameters.
    @param includeInactive Whether to include inactive ad units. Default: true.
    @param maxResults The maximum number of ad units to include in the response, used for paging.
    @param pageToken A continuation token, used to page through ad units. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
    @param adClientId Ad client for which to list ad units.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeInactive:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    adClientId:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.AdUnits.t * GapiConversation.Session.t
  
  
end

module CustomchannelsResource :
sig
  module Adunits :
  sig
    
    (** List all ad units in the specified custom channel.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
      @param std_params Optional standard parameters.
      @param includeInactive Whether to include inactive ad units. Default: true.
      @param maxResults The maximum number of ad units to include in the response, used for paging.
      @param pageToken A continuation token, used to page through ad units. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
      @param adClientId Ad client which contains the custom channel.
      @param customChannelId Custom channel for which to list ad units.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?includeInactive:bool ->
      ?maxResults:int ->
      ?pageToken:string ->
      adClientId:string ->
      customChannelId:string ->
      GapiConversation.Session.t ->
      GapiAdsenseV1_1Model.AdUnits.t * GapiConversation.Session.t
    
    
  end
  
  
  (** Get the specified custom channel from the specified ad client.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param adClientId Ad client which contains the custom channel.
    @param customChannelId Custom channel to retrieve.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    adClientId:string ->
    customChannelId:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.CustomChannel.t * GapiConversation.Session.t
  
  (** List all custom channels in the specified ad client for this AdSense account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of custom channels to include in the response, used for paging.
    @param pageToken A continuation token, used to page through custom channels. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
    @param adClientId Ad client for which to list custom channels.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    adClientId:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.CustomChannels.t * GapiConversation.Session.t
  
  
end

module ReportsResource :
sig
  
  (** Generate an AdSense report based on the report request sent in the query parameters. Returns the result as JSON; to retrieve output in CSV format specify "alt=csv" as a query parameter.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param std_params Optional standard parameters.
    @param accountId Accounts upon which to report.
    @param currency Optional currency to use when reporting on monetary metrics. Defaults to the account's currency if not set.
    @param dimension Dimensions to base the report on.
    @param filter Filters to be run on the report.
    @param locale Optional locale to use for translating report output to a local language. Defaults to "en_US" if not specified.
    @param maxResults The maximum number of rows of report data to return.
    @param metric Numeric columns to include in the report.
    @param sort The name of a dimension or metric to sort the resulting report on, optionally prefixed with "+" to sort ascending or "-" to sort descending. If no prefix is specified, the column is sorted ascending.
    @param startIndex Index of the first row of report data to return.
    @param startDate Start of the date range to report on in "YYYY-MM-DD" format, inclusive.
    @param endDate End of the date range to report on in "YYYY-MM-DD" format, inclusive.
    *)
  val generate :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?accountId:string list ->
    ?currency:string ->
    ?dimension:string list ->
    ?filter:string list ->
    ?locale:string ->
    ?maxResults:int ->
    ?metric:string list ->
    ?sort:string list ->
    ?startIndex:int ->
    startDate:string ->
    endDate:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.AdsenseReportsGenerateResponse.t * GapiConversation.Session.t
  
  
end

module UrlchannelsResource :
sig
  
  (** List all URL channels in the specified ad client for this AdSense account.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/adsense/v1.1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of URL channels to include in the response, used for paging.
    @param pageToken A continuation token, used to page through URL channels. To retrieve the next page, set this parameter to the value of "nextPageToken" from the previous response.
    @param adClientId Ad client for which to list URL channels.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    adClientId:string ->
    GapiConversation.Session.t ->
    GapiAdsenseV1_1Model.UrlChannels.t * GapiConversation.Session.t
  
  
end


