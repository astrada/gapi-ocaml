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
  
  val analytics_edit : string
  (** Edit Google Analytics management entities *)
  
  val analytics_manage_users : string
  (** Manage Google Analytics Account users by email address *)
  
  val analytics_manage_users_readonly : string
  (** View Google Analytics user permissions *)
  
  val analytics_provision : string
  (** Create a new Google Analytics account along with its default property and view *)
  
  val analytics_readonly : string
  (** View your Google Analytics data *)
  
  
end
(** Service Auth Scopes *)

module DataResource :
sig
  module Realtime :
  sig
    
    (** Returns real time data for a view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param dimensions A comma-separated list of real time dimensions. E.g., 'rt:medium,rt:city'.
      @param filters A comma-separated list of dimension or metric filters to be applied to real time data.
      @param max_results The maximum number of entries to include in this feed.
      @param sort A comma-separated list of dimensions or metrics that determine the sort order for real time data.
      @param ids Unique table ID for retrieving real time data. Table ID is of the form ga:XXXX, where XXXX is the Analytics view (profile) ID.
      @param metrics A comma-separated list of real time metrics. E.g., 'rt:activeUsers'. At least one metric must be specified.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?dimensions:string ->
      ?filters:string ->
      ?max_results:int ->
      ?sort:string ->
      ids:string ->
      metrics:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.RealtimeData.t * GapiConversation.Session.t
    
    
  end
  
  module Mcf :
  sig
    
    module SamplingLevel :
    sig
      type t =
        | Default
        | DEFAULT (** Returns response with a sample size that balances speed and accuracy. *)
        | FASTER (** Returns a fast response with a smaller sample size. *)
        | HIGHER_PRECISION (** Returns a more accurate response using a large sample size, but this may result in the response being slower. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Returns Analytics Multi-Channel Funnels data for a view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param dimensions A comma-separated list of Multi-Channel Funnels dimensions. E.g., 'mcf:source,mcf:medium'.
      @param filters A comma-separated list of dimension or metric filters to be applied to the Analytics data.
      @param max_results The maximum number of entries to include in this feed.
      @param samplingLevel The desired sampling level.
      @param sort A comma-separated list of dimensions or metrics that determine the sort order for the Analytics data.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param ids Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX, where XXXX is the Analytics view (profile) ID.
      @param start_date Start date for fetching Analytics data. Requests can specify a start date formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or 7daysAgo). The default value is 7daysAgo.
      @param end_date End date for fetching Analytics data. Requests can specify a start date formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or 7daysAgo). The default value is 7daysAgo.
      @param metrics A comma-separated list of Multi-Channel Funnels metrics. E.g., 'mcf:totalConversions,mcf:totalConversionValue'. At least one metric must be specified.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?dimensions:string ->
      ?filters:string ->
      ?max_results:int ->
      ?samplingLevel:SamplingLevel.t ->
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
    
    module SamplingLevel :
    sig
      type t =
        | Default
        | DEFAULT (** Returns response with a sample size that balances speed and accuracy. *)
        | FASTER (** Returns a fast response with a smaller sample size. *)
        | HIGHER_PRECISION (** Returns a more accurate response using a large sample size, but this may result in the response being slower. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module Output :
    sig
      type t =
        | Default
        | DataTable (** Returns the response in Google Charts Data Table format. This is useful in creating visualization using Google Charts. *)
        | Json (** Returns the response in standard JSON format. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Returns Analytics data for a view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param dimensions A comma-separated list of Analytics dimensions. E.g., 'ga:browser,ga:city'.
      @param filters A comma-separated list of dimension or metric filters to be applied to Analytics data.
      @param include_empty_rows The response will include empty rows if this parameter is set to true, the default is true
      @param max_results The maximum number of entries to include in this feed.
      @param output The selected format for the response. Default format is JSON.
      @param samplingLevel The desired sampling level.
      @param segment An Analytics segment to be applied to data.
      @param sort A comma-separated list of dimensions or metrics that determine the sort order for Analytics data.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param ids Unique table ID for retrieving Analytics data. Table ID is of the form ga:XXXX, where XXXX is the Analytics view (profile) ID.
      @param start_date Start date for fetching Analytics data. Requests can specify a start date formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or 7daysAgo). The default value is 7daysAgo.
      @param end_date End date for fetching Analytics data. Request can should specify an end date formatted as YYYY-MM-DD, or as a relative date (e.g., today, yesterday, or 7daysAgo). The default value is yesterday.
      @param metrics A comma-separated list of Analytics metrics. E.g., 'ga:sessions,ga:pageviews'. At least one metric must be specified.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?dimensions:string ->
      ?filters:string ->
      ?include_empty_rows:bool ->
      ?max_results:int ->
      ?output:Output.t ->
      ?samplingLevel:SamplingLevel.t ->
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
  module WebpropertyUserLinks :
  sig
    
    (** Removes a user from the given web property.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to delete the user link for.
      @param webPropertyId Web Property ID to delete the user link for.
      @param linkId Link ID to delete the user link for.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      linkId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Adds a new user to the given web property.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the user link for.
      @param webPropertyId Web Property ID to create the user link for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.EntityUserLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLink.t * GapiConversation.Session.t
    
    (** Lists webProperty-user links for a given web property.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of webProperty-user Links to include in this response.
      @param start_index An index of the first webProperty-user link to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID which the given web property belongs to.
      @param webPropertyId Web Property ID for the webProperty-user links to retrieve. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLinks.t * GapiConversation.Session.t
    
    (** Updates permissions for an existing user on the given web property.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to update the account-user link for.
      @param webPropertyId Web property ID to update the account-user link for.
      @param linkId Link ID to update the account-user link for.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      linkId:string ->
      GapiAnalyticsV3Model.EntityUserLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLink.t * GapiConversation.Session.t
    
    
  end
  
  module Webproperties :
  sig
    
    (** Gets a web property to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve the web property for.
      @param webPropertyId ID to retrieve the web property for.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Webproperty.t * GapiConversation.Session.t
    
    (** Create a new property if the account has fewer than 20 properties. Web properties are visible in the Google Analytics interface only if they have at least one profile.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the web property for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      GapiAnalyticsV3Model.Webproperty.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Webproperty.t * GapiConversation.Session.t
    
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
    
    (** Updates an existing web property. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the web property belongs
      @param webPropertyId Web property ID
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.Webproperty.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Webproperty.t * GapiConversation.Session.t
    
    (** Updates an existing web property.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the web property belongs
      @param webPropertyId Web property ID
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.Webproperty.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Webproperty.t * GapiConversation.Session.t
    
    
  end
  
  module WebPropertyAdWordsLinks :
  sig
    
    (** Deletes a web property-AdWords link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId ID of the account which the given web property belongs to.
      @param webPropertyId Web property ID to delete the AdWords link for.
      @param webPropertyAdWordsLinkId Web property AdWords link ID.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      webPropertyAdWordsLinkId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Returns a web property-AdWords link to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId ID of the account which the given web property belongs to.
      @param webPropertyId Web property ID to retrieve the AdWords link for.
      @param webPropertyAdWordsLinkId Web property-AdWords link ID.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      webPropertyAdWordsLinkId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t * GapiConversation.Session.t
    
    (** Creates a webProperty-AdWords link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId ID of the Google Analytics account to create the link for.
      @param webPropertyId Web property ID to create the link for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t * GapiConversation.Session.t
    
    (** Lists webProperty-AdWords links for a given web property.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of webProperty-AdWords links to include in this response.
      @param start_index An index of the first webProperty-AdWords link to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId ID of the account which the given web property belongs to.
      @param webPropertyId Web property ID to retrieve the AdWords links for.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityAdWordsLinks.t * GapiConversation.Session.t
    
    (** Updates an existing webProperty-AdWords link. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId ID of the account which the given web property belongs to.
      @param webPropertyId Web property ID to retrieve the AdWords link for.
      @param webPropertyAdWordsLinkId Web property-AdWords link ID.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      webPropertyAdWordsLinkId:string ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t * GapiConversation.Session.t
    
    (** Updates an existing webProperty-AdWords link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId ID of the account which the given web property belongs to.
      @param webPropertyId Web property ID to retrieve the AdWords link for.
      @param webPropertyAdWordsLinkId Web property-AdWords link ID.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      webPropertyAdWordsLinkId:string ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityAdWordsLink.t * GapiConversation.Session.t
    
    
  end
  
  module Uploads :
  sig
    
    (** Delete data associated with a previous upload.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account Id for the uploads to be deleted.
      @param webPropertyId Web property Id for the uploads to be deleted.
      @param customDataSourceId Custom data source Id for the uploads to be deleted.
      *)
    val deleteUploadData :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      GapiAnalyticsV3Model.AnalyticsDataimportDeleteUploadDataRequest.t ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** List uploads to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account Id for the upload to retrieve.
      @param webPropertyId Web property Id for the upload to retrieve.
      @param customDataSourceId Custom data source Id for upload to retrieve.
      @param uploadId Upload Id to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      uploadId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Upload.t * GapiConversation.Session.t
    
    (** List uploads to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of uploads to include in this response.
      @param start_index A 1-based index of the first upload to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account Id for the uploads to retrieve.
      @param webPropertyId Web property Id for the uploads to retrieve.
      @param customDataSourceId Custom data source Id for uploads to retrieve.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Uploads.t * GapiConversation.Session.t
    
    (** Upload data for a custom data source.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account Id associated with the upload.
      @param webPropertyId Web property UA-string associated with the upload.
      @param customDataSourceId Custom data source Id to which the data being uploaded belongs.
      *)
    val uploadData :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      accountId:string ->
      webPropertyId:string ->
      customDataSourceId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Upload.t * GapiConversation.Session.t
    
    
  end
  
  module UnsampledReports :
  sig
    
    (** Returns a single unsampled report.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve unsampled report for.
      @param webPropertyId Web property ID to retrieve unsampled reports for.
      @param profileId View (Profile) ID to retrieve unsampled report for.
      @param unsampledReportId ID of the unsampled report to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      unsampledReportId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.UnsampledReport.t * GapiConversation.Session.t
    
    (** Create a new unsampled report.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the unsampled report for.
      @param webPropertyId Web property ID to create the unsampled report for.
      @param profileId View (Profile) ID to create the unsampled report for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.UnsampledReport.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.UnsampledReport.t * GapiConversation.Session.t
    
    (** Lists unsampled reports to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of unsampled reports to include in this response.
      @param start_index An index of the first unsampled report to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve unsampled reports for. Must be a specific account ID, ~all is not supported.
      @param webPropertyId Web property ID to retrieve unsampled reports for. Must be a specific web property ID, ~all is not supported.
      @param profileId View (Profile) ID to retrieve unsampled reports for. Must be a specific view (profile) ID, ~all is not supported.
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
      GapiAnalyticsV3Model.UnsampledReports.t * GapiConversation.Session.t
    
    
  end
  
  module Segments :
  sig
    
    (** Lists segments to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of segments to include in this response.
      @param start_index An index of the first segment to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
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
    
    (** Deletes a view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to delete the view (profile) for.
      @param webPropertyId Web property ID to delete the view (profile) for.
      @param profileId ID of the view (profile) to be deleted.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Gets a view (profile) to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve the goal for.
      @param webPropertyId Web property ID to retrieve the goal for.
      @param profileId View (Profile) ID to retrieve the goal for.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Profile.t * GapiConversation.Session.t
    
    (** Create a new view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the view (profile) for.
      @param webPropertyId Web property ID to create the view (profile) for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.Profile.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Profile.t * GapiConversation.Session.t
    
    (** Lists views (profiles) to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of views (profiles) to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID for the view (profiles) to retrieve. Can either be a specific account ID or '~all', which refers to all the accounts to which the user has access.
      @param webPropertyId Web property ID for the views (profiles) to retrieve. Can either be a specific web property ID or '~all', which refers to all the web properties to which the user has access.
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
    
    (** Updates an existing view (profile). This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the view (profile) belongs
      @param webPropertyId Web property ID to which the view (profile) belongs
      @param profileId ID of the view (profile) to be updated.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.Profile.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Profile.t * GapiConversation.Session.t
    
    (** Updates an existing view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the view (profile) belongs
      @param webPropertyId Web property ID to which the view (profile) belongs
      @param profileId ID of the view (profile) to be updated.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.Profile.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Profile.t * GapiConversation.Session.t
    
    
  end
  
  module ProfileUserLinks :
  sig
    
    (** Removes a user from the given view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to delete the user link for.
      @param webPropertyId Web Property ID to delete the user link for.
      @param profileId View (Profile) ID to delete the user link for.
      @param linkId Link ID to delete the user link for.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      linkId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Adds a new user to the given view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the user link for.
      @param webPropertyId Web Property ID to create the user link for.
      @param profileId View (Profile) ID to create the user link for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.EntityUserLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLink.t * GapiConversation.Session.t
    
    (** Lists profile-user links for a given view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of profile-user links to include in this response.
      @param start_index An index of the first profile-user link to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID which the given view (profile) belongs to.
      @param webPropertyId Web Property ID which the given view (profile) belongs to. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
      @param profileId View (Profile) ID to retrieve the profile-user links for. Can either be a specific profile ID or '~all', which refers to all the profiles that user has access to.
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
      GapiAnalyticsV3Model.EntityUserLinks.t * GapiConversation.Session.t
    
    (** Updates permissions for an existing user on the given view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to update the user link for.
      @param webPropertyId Web Property ID to update the user link for.
      @param profileId View (Profile ID) to update the user link for.
      @param linkId Link ID to update the user link for.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      linkId:string ->
      GapiAnalyticsV3Model.EntityUserLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLink.t * GapiConversation.Session.t
    
    
  end
  
  module ProfileFilterLinks :
  sig
    
    (** Delete a profile filter link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the profile filter link belongs.
      @param webPropertyId Web property Id to which the profile filter link belongs.
      @param profileId Profile ID to which the filter link belongs.
      @param linkId ID of the profile filter link to delete.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      linkId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Returns a single profile filter link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve profile filter link for.
      @param webPropertyId Web property Id to retrieve profile filter link for.
      @param profileId Profile ID to retrieve filter link for.
      @param linkId ID of the profile filter link.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      linkId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.ProfileFilterLink.t * GapiConversation.Session.t
    
    (** Create a new profile filter link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create profile filter link for.
      @param webPropertyId Web property Id to create profile filter link for.
      @param profileId Profile ID to create filter link for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.ProfileFilterLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.ProfileFilterLink.t * GapiConversation.Session.t
    
    (** Lists all profile filter links for a profile.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of profile filter links to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve profile filter links for.
      @param webPropertyId Web property Id for profile filter links for. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
      @param profileId Profile ID to retrieve filter links for. Can either be a specific profile ID or '~all', which refers to all the profiles that user has access to.
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
      GapiAnalyticsV3Model.ProfileFilterLinks.t * GapiConversation.Session.t
    
    (** Update an existing profile filter link. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which profile filter link belongs.
      @param webPropertyId Web property Id to which profile filter link belongs
      @param profileId Profile ID to which filter link belongs
      @param linkId ID of the profile filter link to be updated.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      linkId:string ->
      GapiAnalyticsV3Model.ProfileFilterLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.ProfileFilterLink.t * GapiConversation.Session.t
    
    (** Update an existing profile filter link.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which profile filter link belongs.
      @param webPropertyId Web property Id to which profile filter link belongs
      @param profileId Profile ID to which filter link belongs
      @param linkId ID of the profile filter link to be updated.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      linkId:string ->
      GapiAnalyticsV3Model.ProfileFilterLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.ProfileFilterLink.t * GapiConversation.Session.t
    
    
  end
  
  module Goals :
  sig
    
    (** Gets a goal to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve the goal for.
      @param webPropertyId Web property ID to retrieve the goal for.
      @param profileId View (Profile) ID to retrieve the goal for.
      @param goalId Goal ID to retrieve the goal for.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      goalId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Goal.t * GapiConversation.Session.t
    
    (** Create a new goal.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the goal for.
      @param webPropertyId Web property ID to create the goal for.
      @param profileId View (Profile) ID to create the goal for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.Goal.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Goal.t * GapiConversation.Session.t
    
    (** Lists goals to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of goals to include in this response.
      @param start_index An index of the first goal to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve goals for. Can either be a specific account ID or '~all', which refers to all the accounts that user has access to.
      @param webPropertyId Web property ID to retrieve goals for. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
      @param profileId View (Profile) ID to retrieve goals for. Can either be a specific view (profile) ID or '~all', which refers to all the views (profiles) that user has access to.
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
    
    (** Updates an existing view (profile). This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to update the goal.
      @param webPropertyId Web property ID to update the goal.
      @param profileId View (Profile) ID to update the goal.
      @param goalId Index of the goal to be updated.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      goalId:string ->
      GapiAnalyticsV3Model.Goal.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Goal.t * GapiConversation.Session.t
    
    (** Updates an existing view (profile).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to update the goal.
      @param webPropertyId Web property ID to update the goal.
      @param profileId View (Profile) ID to update the goal.
      @param goalId Index of the goal to be updated.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      goalId:string ->
      GapiAnalyticsV3Model.Goal.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Goal.t * GapiConversation.Session.t
    
    
  end
  
  module Filters :
  sig
    
    (** Delete a filter.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to delete the filter for.
      @param filterId ID of the filter to be deleted.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      filterId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Filter.t * GapiConversation.Session.t
    
    (** Returns a filters to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve filters for.
      @param filterId Filter ID to retrieve filters for.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      filterId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Filter.t * GapiConversation.Session.t
    
    (** Create a new filter.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create filter for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      GapiAnalyticsV3Model.Filter.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Filter.t * GapiConversation.Session.t
    
    (** Lists all filters for an account
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of filters to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve filters for.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Filters.t * GapiConversation.Session.t
    
    (** Updates an existing filter. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the filter belongs.
      @param filterId ID of the filter to be updated.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      filterId:string ->
      GapiAnalyticsV3Model.Filter.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Filter.t * GapiConversation.Session.t
    
    (** Updates an existing filter.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the filter belongs.
      @param filterId ID of the filter to be updated.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      filterId:string ->
      GapiAnalyticsV3Model.Filter.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Filter.t * GapiConversation.Session.t
    
    
  end
  
  module Experiments :
  sig
    
    (** Delete an experiment.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to which the experiment belongs
      @param webPropertyId Web property ID to which the experiment belongs
      @param profileId View (Profile) ID to which the experiment belongs
      @param experimentId ID of the experiment to delete
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      experimentId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Returns an experiment to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID to retrieve the experiment for.
      @param webPropertyId Web property ID to retrieve the experiment for.
      @param profileId View (Profile) ID to retrieve the experiment for.
      @param experimentId Experiment ID to retrieve the experiment for.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      experimentId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Experiment.t * GapiConversation.Session.t
    
    (** Create a new experiment.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the experiment for.
      @param webPropertyId Web property ID to create the experiment for.
      @param profileId View (Profile) ID to create the experiment for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      GapiAnalyticsV3Model.Experiment.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Experiment.t * GapiConversation.Session.t
    
    (** Lists experiments to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of experiments to include in this response.
      @param start_index An index of the first experiment to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve experiments for.
      @param webPropertyId Web property ID to retrieve experiments for.
      @param profileId View (Profile) ID to retrieve experiments for.
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
      GapiAnalyticsV3Model.Experiments.t * GapiConversation.Session.t
    
    (** Update an existing experiment. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID of the experiment to update.
      @param webPropertyId Web property ID of the experiment to update.
      @param profileId View (Profile) ID of the experiment to update.
      @param experimentId Experiment ID of the experiment to update.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      experimentId:string ->
      GapiAnalyticsV3Model.Experiment.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Experiment.t * GapiConversation.Session.t
    
    (** Update an existing experiment.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID of the experiment to update.
      @param webPropertyId Web property ID of the experiment to update.
      @param profileId View (Profile) ID of the experiment to update.
      @param experimentId Experiment ID of the experiment to update.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      profileId:string ->
      experimentId:string ->
      GapiAnalyticsV3Model.Experiment.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Experiment.t * GapiConversation.Session.t
    
    
  end
  
  module CustomMetrics :
  sig
    
    (** Get a custom metric to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID for the custom metric to retrieve.
      @param webPropertyId Web property ID for the custom metric to retrieve.
      @param customMetricId The ID of the custom metric to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      customMetricId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomMetric.t * GapiConversation.Session.t
    
    (** Create a new custom metric.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID for the custom metric to create.
      @param webPropertyId Web property ID for the custom dimension to create.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.CustomMetric.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomMetric.t * GapiConversation.Session.t
    
    (** Lists custom metrics to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of custom metrics to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID for the custom metrics to retrieve.
      @param webPropertyId Web property ID for the custom metrics to retrieve.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomMetrics.t * GapiConversation.Session.t
    
    (** Updates an existing custom metric. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param ignoreCustomDataSourceLinks Force the update and ignore any warnings related to the custom metric being linked to a custom data source / data set.
      @param accountId Account ID for the custom metric to update.
      @param webPropertyId Web property ID for the custom metric to update.
      @param customMetricId Custom metric ID for the custom metric to update.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?ignoreCustomDataSourceLinks:bool ->
      accountId:string ->
      webPropertyId:string ->
      customMetricId:string ->
      GapiAnalyticsV3Model.CustomMetric.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomMetric.t * GapiConversation.Session.t
    
    (** Updates an existing custom metric.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param ignoreCustomDataSourceLinks Force the update and ignore any warnings related to the custom metric being linked to a custom data source / data set.
      @param accountId Account ID for the custom metric to update.
      @param webPropertyId Web property ID for the custom metric to update.
      @param customMetricId Custom metric ID for the custom metric to update.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?ignoreCustomDataSourceLinks:bool ->
      accountId:string ->
      webPropertyId:string ->
      customMetricId:string ->
      GapiAnalyticsV3Model.CustomMetric.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomMetric.t * GapiConversation.Session.t
    
    
  end
  
  module CustomDimensions :
  sig
    
    (** Get a custom dimension to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param accountId Account ID for the custom dimension to retrieve.
      @param webPropertyId Web property ID for the custom dimension to retrieve.
      @param customDimensionId The ID of the custom dimension to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      customDimensionId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomDimension.t * GapiConversation.Session.t
    
    (** Create a new custom dimension.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID for the custom dimension to create.
      @param webPropertyId Web property ID for the custom dimension to create.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      webPropertyId:string ->
      GapiAnalyticsV3Model.CustomDimension.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomDimension.t * GapiConversation.Session.t
    
    (** Lists custom dimensions to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of custom dimensions to include in this response.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID for the custom dimensions to retrieve.
      @param webPropertyId Web property ID for the custom dimensions to retrieve.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      webPropertyId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomDimensions.t * GapiConversation.Session.t
    
    (** Updates an existing custom dimension. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param ignoreCustomDataSourceLinks Force the update and ignore any warnings related to the custom dimension being linked to a custom data source / data set.
      @param accountId Account ID for the custom dimension to update.
      @param webPropertyId Web property ID for the custom dimension to update.
      @param customDimensionId Custom dimension ID for the custom dimension to update.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?ignoreCustomDataSourceLinks:bool ->
      accountId:string ->
      webPropertyId:string ->
      customDimensionId:string ->
      GapiAnalyticsV3Model.CustomDimension.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomDimension.t * GapiConversation.Session.t
    
    (** Updates an existing custom dimension.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param ignoreCustomDataSourceLinks Force the update and ignore any warnings related to the custom dimension being linked to a custom data source / data set.
      @param accountId Account ID for the custom dimension to update.
      @param webPropertyId Web property ID for the custom dimension to update.
      @param customDimensionId Custom dimension ID for the custom dimension to update.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?ignoreCustomDataSourceLinks:bool ->
      accountId:string ->
      webPropertyId:string ->
      customDimensionId:string ->
      GapiAnalyticsV3Model.CustomDimension.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.CustomDimension.t * GapiConversation.Session.t
    
    
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
  
  module AccountUserLinks :
  sig
    
    (** Removes a user from the given account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to delete the user link for.
      @param linkId Link ID to delete the user link for.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      linkId:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Adds a new user to the given account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to create the user link for.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      GapiAnalyticsV3Model.EntityUserLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLink.t * GapiConversation.Session.t
    
    (** Lists account-user links for a given account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of account-user links to include in this response.
      @param start_index An index of the first account-user link to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      @param accountId Account ID to retrieve the user links for.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      accountId:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLinks.t * GapiConversation.Session.t
    
    (** Updates permissions for an existing user on the given account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param accountId Account ID to update the account-user link for.
      @param linkId Link ID to update the account-user link for.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      accountId:string ->
      linkId:string ->
      GapiAnalyticsV3Model.EntityUserLink.t ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.EntityUserLink.t * GapiConversation.Session.t
    
    
  end
  
  module AccountSummaries :
  sig
    
    (** Lists account summaries (lightweight tree comprised of accounts/properties/profiles) to which the user has access.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param max_results The maximum number of account summaries to include in this response, where the largest acceptable value is 1000.
      @param start_index An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?max_results:int ->
      ?start_index:int ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.AccountSummaries.t * GapiConversation.Session.t
    
    
  end
  
  
  
end

module MetadataResource :
sig
  module Columns :
  sig
    
    (** Lists all columns for a report type
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
      @param std_params Optional standard parameters.
      @param reportType Report type. Allowed Values: 'ga'. Where 'ga' corresponds to the Core Reporting API
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      reportType:string ->
      GapiConversation.Session.t ->
      GapiAnalyticsV3Model.Columns.t * GapiConversation.Session.t
    
    
  end
  
  
  
end

module ProvisioningResource :
sig
  
  (** Creates an account ticket.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/analytics/v3/"]).
    @param std_params Optional standard parameters.
    *)
  val createAccountTicket :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiAnalyticsV3Model.AccountTicket.t ->
    GapiConversation.Session.t ->
    GapiAnalyticsV3Model.AccountTicket.t * GapiConversation.Session.t
  
  
end


