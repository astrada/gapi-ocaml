(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Google Analytics API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/analytics/}API Documentation}.
  *)

module UnsampledReport :
sig
  module DriveDownloadDetails :
  sig
    type t = {
      documentId : string;
      (** Id of the document/file containing the report data. *)
      
    }
    
    val documentId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module CloudStorageDownloadDetails :
  sig
    type t = {
      bucketId : string;
      (** Id of the bucket the file object is stored in. *)
      objectId : string;
      (** Id of the file object containing the report data. *)
      
    }
    
    val bucketId : (t, string) GapiLens.t
    val objectId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this unsampled report belongs. *)
    cloudStorageDownloadDetails : CloudStorageDownloadDetails.t;
    (** Download details for a file stored in Google Cloud Storage. *)
    created : GapiDate.t;
    (** Time this unsampled report was created. *)
    dimensions : string;
    (** The dimensions for the unsampled report. *)
    downloadType : string;
    (** The type of download you need to use for the report data file. *)
    driveDownloadDetails : DriveDownloadDetails.t;
    (** Download details for a file stored in Google Drive. *)
    end_date : string;
    (** The end date for the unsampled report. *)
    filters : string;
    (** The filters for the unsampled report. *)
    id : string;
    (** Unsampled report ID. *)
    kind : string;
    (** Resource type for an Analytics unsampled report. *)
    metrics : string;
    (** The metrics for the unsampled report. *)
    profileId : string;
    (** View (Profile) ID to which this unsampled report belongs. *)
    segment : string;
    (** The segment for the unsampled report. *)
    selfLink : string;
    (** Link for this unsampled report. *)
    start_date : string;
    (** The start date for the unsampled report. *)
    status : string;
    (** Status of this unsampled report. Possible values are PENDING, COMPLETED, or FAILED. *)
    title : string;
    (** Title of the unsampled report. *)
    updated : GapiDate.t;
    (** Time this unsampled report was last modified. *)
    webPropertyId : string;
    (** Web property ID to which this unsampled report belongs. The web property ID is of the form UA-XXXXX-YY. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val cloudStorageDownloadDetails : (t, CloudStorageDownloadDetails.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val dimensions : (t, string) GapiLens.t
  val downloadType : (t, string) GapiLens.t
  val driveDownloadDetails : (t, DriveDownloadDetails.t) GapiLens.t
  val end_date : (t, string) GapiLens.t
  val filters : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val metrics : (t, string) GapiLens.t
  val profileId : (t, string) GapiLens.t
  val segment : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val start_date : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomDimension :
sig
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the property to which the custom dimension belongs. *)
      _type : string;
      (** Type of the parent link. Set to "analytics#webproperty". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID. *)
    active : bool;
    (** Boolean indicating whether the custom dimension is active. *)
    created : GapiDate.t;
    (** Time the custom dimension was created. *)
    id : string;
    (** Custom dimension ID. *)
    index : int;
    (** Index of the custom dimension. *)
    kind : string;
    (** Kind value for a custom dimension. Set to "analytics#customDimension". It is a read-only field. *)
    name : string;
    (** Name of the custom dimension. *)
    parentLink : ParentLink.t;
    (** Parent link for the custom dimension. Points to the property to which the custom dimension belongs. *)
    scope : string;
    (** Scope of the custom dimension: HIT, SESSION, USER or PRODUCT. *)
    selfLink : string;
    (** Link for the custom dimension *)
    updated : GapiDate.t;
    (** Time the custom dimension was last modified. *)
    webPropertyId : string;
    (** Property ID. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val active : (t, bool) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val index : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val scope : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomDimensions :
sig
  type t = {
    items : CustomDimension.t list;
    (** Collection of custom dimensions. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this custom dimension collection. *)
    previousLink : string;
    (** Link to previous page for this custom dimension collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, CustomDimension.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProfileSummary :
sig
  type t = {
    id : string;
    (** View (profile) ID. *)
    kind : string;
    (** Resource type for Analytics ProfileSummary. *)
    name : string;
    (** View (profile) name. *)
    _type : string;
    (** View (Profile) type. Supported types: WEB or APP. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Column :
sig
  type t = {
    attributes : (string * string) list;
    (** Map of attribute name and value for this column. *)
    id : string;
    (** Column id. *)
    kind : string;
    (** Resource type for Analytics column. *)
    
  }
  
  val attributes : (t, (string * string) list) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Columns :
sig
  type t = {
    attributeNames : string list;
    (** List of attributes names returned by columns. *)
    etag : string;
    (** Etag of collection. This etag can be compared with the last response etag to check if response has changed. *)
    items : Column.t list;
    (** List of columns for a report type. *)
    kind : string;
    (** Collection type. *)
    totalResults : int;
    (** Total number of columns returned in the response. *)
    
  }
  
  val attributeNames : (t, string list) GapiLens.t
  val etag : (t, string) GapiLens.t
  val items : (t, Column.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WebPropertyRef :
sig
  type t = {
    accountId : string;
    (** Account ID to which this web property belongs. *)
    href : string;
    (** Link for this web property. *)
    id : string;
    (** Web property ID of the form UA-XXXXX-YY. *)
    internalWebPropertyId : string;
    (** Internal ID for this web property. *)
    kind : string;
    (** Analytics web property reference. *)
    name : string;
    (** Name of this web property. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val href : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AdWordsAccount :
sig
  type t = {
    autoTaggingEnabled : bool;
    (** True if auto-tagging is enabled on the AdWords account. Read-only after the insert operation. *)
    customerId : string;
    (** Customer ID. This field is required when creating an AdWords link. *)
    kind : string;
    (** Resource type for AdWords account. *)
    
  }
  
  val autoTaggingEnabled : (t, bool) GapiLens.t
  val customerId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EntityAdWordsLink :
sig
  module Entity :
  sig
    type t = {
      webPropertyRef : WebPropertyRef.t;
      (**  *)
      
    }
    
    val webPropertyRef : (t, WebPropertyRef.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    adWordsAccounts : AdWordsAccount.t list;
    (** A list of AdWords client accounts. These cannot be MCC accounts. This field is required when creating an AdWords link. It cannot be empty. *)
    entity : Entity.t;
    (** Web property being linked. *)
    id : string;
    (** Entity AdWords link ID *)
    kind : string;
    (** Resource type for entity AdWords link. *)
    name : string;
    (** Name of the link. This field is required when creating an AdWords link. *)
    profileIds : string list;
    (** IDs of linked Views (Profiles) represented as strings. *)
    selfLink : string;
    (** URL link for this Google Analytics - Google AdWords link. *)
    
  }
  
  val adWordsAccounts : (t, AdWordsAccount.t list) GapiLens.t
  val entity : (t, Entity.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val profileIds : (t, string list) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EntityAdWordsLinks :
sig
  type t = {
    items : EntityAdWordsLink.t list;
    (** A list of entity AdWords links. *)
    itemsPerPage : int;
    (** The maximum number of entries the response can contain, regardless of the actual number of entries returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Next link for this AdWords link collection. *)
    previousLink : string;
    (** Previous link for this AdWords link collection. *)
    startIndex : int;
    (** The starting index of the entries, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    
  }
  
  val items : (t, EntityAdWordsLink.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Segment :
sig
  type t = {
    created : GapiDate.t;
    (** Time the segment was created. *)
    definition : string;
    (** Segment definition. *)
    id : string;
    (** Segment ID. *)
    kind : string;
    (** Resource type for Analytics segment. *)
    name : string;
    (** Segment name. *)
    segmentId : string;
    (** Segment ID. Can be used with the 'segment' parameter in Core Reporting API. *)
    selfLink : string;
    (** Link for this segment. *)
    _type : string;
    (** Type for a segment. Possible values are "BUILT_IN" or "CUSTOM". *)
    updated : GapiDate.t;
    (** Time the segment was last modified. *)
    
  }
  
  val created : (t, GapiDate.t) GapiLens.t
  val definition : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val segmentId : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Experiment :
sig
  module Variations :
  sig
    type t = {
      name : string;
      (** The name of the variation. This field is required when creating an experiment. This field may not be changed for an experiment whose status is ENDED. *)
      status : string;
      (** Status of the variation. Possible values: "ACTIVE", "INACTIVE". INACTIVE variations are not served. This field may not be changed for an experiment whose status is ENDED. *)
      url : string;
      (** The URL of the variation. This field may not be changed for an experiment whose status is RUNNING or ENDED. *)
      weight : float;
      (** Weight that this variation should receive. Only present if the experiment is running. This field is read-only. *)
      won : bool;
      (** True if the experiment has ended and this variation performed (statistically) significantly better than the original. This field is read-only. *)
      
    }
    
    val name : (t, string) GapiLens.t
    val status : (t, string) GapiLens.t
    val url : (t, string) GapiLens.t
    val weight : (t, float) GapiLens.t
    val won : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the view (profile) to which this experiment belongs. This field is read-only. *)
      _type : string;
      (** Value is "analytics#profile". This field is read-only. *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this experiment belongs. This field is read-only. *)
    created : GapiDate.t;
    (** Time the experiment was created. This field is read-only. *)
    description : string;
    (** Notes about this experiment. *)
    editableInGaUi : bool;
    (** If true, the end user will be able to edit the experiment via the Google Analytics user interface. *)
    endTime : GapiDate.t;
    (** The ending time of the experiment (the time the status changed from RUNNING to ENDED). This field is present only if the experiment has ended. This field is read-only. *)
    equalWeighting : bool;
    (** Boolean specifying whether to distribute traffic evenly across all variations. If the value is False, content experiments follows the default behavior of adjusting traffic dynamically based on variation performance. Optional -- defaults to False. This field may not be changed for an experiment whose status is ENDED. *)
    id : string;
    (** Experiment ID. Required for patch and update. Disallowed for create. *)
    internalWebPropertyId : string;
    (** Internal ID for the web property to which this experiment belongs. This field is read-only. *)
    kind : string;
    (** Resource type for an Analytics experiment. This field is read-only. *)
    minimumExperimentLengthInDays : int;
    (** An integer number in [3, 90]. Specifies the minimum length of the experiment. Can be changed for a running experiment. This field may not be changed for an experiments whose status is ENDED. *)
    name : string;
    (** Experiment name. This field may not be changed for an experiment whose status is ENDED. This field is required when creating an experiment. *)
    objectiveMetric : string;
    (** The metric that the experiment is optimizing. Valid values: "ga:goal(n)Completions", "ga:adsenseAdsClicks", "ga:adsenseAdsViewed", "ga:adsenseRevenue", "ga:bounces", "ga:pageviews", "ga:sessionDuration", "ga:transactions", "ga:transactionRevenue". This field is required if status is "RUNNING" and servingFramework is one of "REDIRECT" or "API". *)
    optimizationType : string;
    (** Whether the objectiveMetric should be minimized or maximized. Possible values: "MAXIMUM", "MINIMUM". Optional--defaults to "MAXIMUM". Cannot be specified without objectiveMetric. Cannot be modified when status is "RUNNING" or "ENDED". *)
    parentLink : ParentLink.t;
    (** Parent link for an experiment. Points to the view (profile) to which this experiment belongs. *)
    profileId : string;
    (** View (Profile) ID to which this experiment belongs. This field is read-only. *)
    reasonExperimentEnded : string;
    (** Why the experiment ended. Possible values: "STOPPED_BY_USER", "WINNER_FOUND", "EXPERIMENT_EXPIRED", "ENDED_WITH_NO_WINNER", "GOAL_OBJECTIVE_CHANGED". "ENDED_WITH_NO_WINNER" means that the experiment didn't expire but no winner was projected to be found. If the experiment status is changed via the API to ENDED this field is set to STOPPED_BY_USER. This field is read-only. *)
    rewriteVariationUrlsAsOriginal : bool;
    (** Boolean specifying whether variations URLS are rewritten to match those of the original. This field may not be changed for an experiments whose status is ENDED. *)
    selfLink : string;
    (** Link for this experiment. This field is read-only. *)
    servingFramework : string;
    (** The framework used to serve the experiment variations and evaluate the results. One of:  
- REDIRECT: Google Analytics redirects traffic to different variation pages, reports the chosen variation and evaluates the results.
- API: Google Analytics chooses and reports the variation to serve and evaluates the results; the caller is responsible for serving the selected variation.
- EXTERNAL: The variations will be served externally and the chosen variation reported to Google Analytics. The caller is responsible for serving the selected variation and evaluating the results. *)
    snippet : string;
    (** The snippet of code to include on the control page(s). This field is read-only. *)
    startTime : GapiDate.t;
    (** The starting time of the experiment (the time the status changed from READY_TO_RUN to RUNNING). This field is present only if the experiment has started. This field is read-only. *)
    status : string;
    (** Experiment status. Possible values: "DRAFT", "READY_TO_RUN", "RUNNING", "ENDED". Experiments can be created in the "DRAFT", "READY_TO_RUN" or "RUNNING" state. This field is required when creating an experiment. *)
    trafficCoverage : float;
    (** A floating-point number between 0 and 1. Specifies the fraction of the traffic that participates in the experiment. Can be changed for a running experiment. This field may not be changed for an experiments whose status is ENDED. *)
    updated : GapiDate.t;
    (** Time the experiment was last modified. This field is read-only. *)
    variations : Variations.t list;
    (** Array of variations. The first variation in the array is the original. The number of variations may not change once an experiment is in the RUNNING state. At least two variations are required before status can be set to RUNNING. *)
    webPropertyId : string;
    (** Web property ID to which this experiment belongs. The web property ID is of the form UA-XXXXX-YY. This field is read-only. *)
    winnerConfidenceLevel : float;
    (** A floating-point number between 0 and 1. Specifies the necessary confidence level to choose a winner. This field may not be changed for an experiments whose status is ENDED. *)
    winnerFound : bool;
    (** Boolean specifying whether a winner has been found for this experiment. This field is read-only. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val editableInGaUi : (t, bool) GapiLens.t
  val endTime : (t, GapiDate.t) GapiLens.t
  val equalWeighting : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val minimumExperimentLengthInDays : (t, int) GapiLens.t
  val name : (t, string) GapiLens.t
  val objectiveMetric : (t, string) GapiLens.t
  val optimizationType : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val profileId : (t, string) GapiLens.t
  val reasonExperimentEnded : (t, string) GapiLens.t
  val rewriteVariationUrlsAsOriginal : (t, bool) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val servingFramework : (t, string) GapiLens.t
  val snippet : (t, string) GapiLens.t
  val startTime : (t, GapiDate.t) GapiLens.t
  val status : (t, string) GapiLens.t
  val trafficCoverage : (t, float) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val variations : (t, Variations.t list) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  val winnerConfidenceLevel : (t, float) GapiLens.t
  val winnerFound : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WebPropertySummary :
sig
  type t = {
    id : string;
    (** Web property ID of the form UA-XXXXX-YY. *)
    internalWebPropertyId : string;
    (** Internal ID for this web property. *)
    kind : string;
    (** Resource type for Analytics WebPropertySummary. *)
    level : string;
    (** Level for this web property. Possible values are STANDARD or PREMIUM. *)
    name : string;
    (** Web property name. *)
    profiles : ProfileSummary.t list;
    (** List of profiles under this web property. *)
    websiteUrl : string;
    (** Website url for this web property. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val level : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val profiles : (t, ProfileSummary.t list) GapiLens.t
  val websiteUrl : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Experiments :
sig
  type t = {
    items : Experiment.t list;
    (** A list of experiments. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this experiment collection. *)
    previousLink : string;
    (** Link to previous page for this experiment collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of resources in the result. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Experiment.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Profile :
sig
  module Permissions :
  sig
    type t = {
      effective : string list;
      (** All the permissions that the user has for this view (profile). These include any implied permissions (e.g., EDIT implies VIEW) or inherited permissions from the parent web property. *)
      
    }
    
    val effective : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the web property to which this view (profile) belongs. *)
      _type : string;
      (** Value is "analytics#webproperty". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ChildLink :
  sig
    type t = {
      href : string;
      (** Link to the list of goals for this view (profile). *)
      _type : string;
      (** Value is "analytics#goals". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this view (profile) belongs. *)
    childLink : ChildLink.t;
    (** Child link for this view (profile). Points to the list of goals for this view (profile). *)
    created : GapiDate.t;
    (** Time this view (profile) was created. *)
    currency : string;
    (** The currency type associated with this view (profile). The supported values are:
ARS, AUD, BGN, BRL, CAD, CHF, CNY, CZK, DKK, EUR, GBP, HKD, HUF, IDR, INR, JPY, KRW, LTL, MXN, NOK, NZD, PHP, PLN, RUB, SEK, THB, TRY, TWD, USD, VND, ZAR *)
    defaultPage : string;
    (** Default page for this view (profile). *)
    eCommerceTracking : bool;
    (** Indicates whether ecommerce tracking is enabled for this view (profile). *)
    enhancedECommerceTracking : bool;
    (** Indicates whether enhanced ecommerce tracking is enabled for this view (profile). This property can only be enabled if ecommerce tracking is enabled. *)
    excludeQueryParameters : string;
    (** The query parameters that are excluded from this view (profile). *)
    id : string;
    (** View (Profile) ID. *)
    internalWebPropertyId : string;
    (** Internal ID for the web property to which this view (profile) belongs. *)
    kind : string;
    (** Resource type for Analytics view (profile). *)
    name : string;
    (** Name of this view (profile). *)
    parentLink : ParentLink.t;
    (** Parent link for this view (profile). Points to the web property to which this view (profile) belongs. *)
    permissions : Permissions.t;
    (** Permissions the user has for this view (profile). *)
    selfLink : string;
    (** Link for this view (profile). *)
    siteSearchCategoryParameters : string;
    (** Site search category parameters for this view (profile). *)
    siteSearchQueryParameters : string;
    (** The site search query parameters for this view (profile). *)
    stripSiteSearchCategoryParameters : bool;
    (** Whether or not Analytics will strip search category parameters from the URLs in your reports. *)
    stripSiteSearchQueryParameters : bool;
    (** Whether or not Analytics will strip search query parameters from the URLs in your reports. *)
    timezone : string;
    (** Time zone for which this view (profile) has been configured. Time zones are identified by strings from the TZ database. *)
    _type : string;
    (** View (Profile) type. Supported types: WEB or APP. *)
    updated : GapiDate.t;
    (** Time this view (profile) was last modified. *)
    webPropertyId : string;
    (** Web property ID of the form UA-XXXXX-YY to which this view (profile) belongs. *)
    websiteUrl : string;
    (** Website URL for this view (profile). *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val childLink : (t, ChildLink.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val currency : (t, string) GapiLens.t
  val defaultPage : (t, string) GapiLens.t
  val eCommerceTracking : (t, bool) GapiLens.t
  val enhancedECommerceTracking : (t, bool) GapiLens.t
  val excludeQueryParameters : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val permissions : (t, Permissions.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val siteSearchCategoryParameters : (t, string) GapiLens.t
  val siteSearchQueryParameters : (t, string) GapiLens.t
  val stripSiteSearchCategoryParameters : (t, bool) GapiLens.t
  val stripSiteSearchQueryParameters : (t, bool) GapiLens.t
  val timezone : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  val websiteUrl : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Webproperty :
sig
  module Permissions :
  sig
    type t = {
      effective : string list;
      (** All the permissions that the user has for this web property. These include any implied permissions (e.g., EDIT implies VIEW) or inherited permissions from the parent account. *)
      
    }
    
    val effective : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the account for this web property. *)
      _type : string;
      (** Type of the parent link. Its value is "analytics#account". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ChildLink :
  sig
    type t = {
      href : string;
      (** Link to the list of views (profiles) for this web property. *)
      _type : string;
      (** Type of the parent link. Its value is "analytics#profiles". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this web property belongs. *)
    childLink : ChildLink.t;
    (** Child link for this web property. Points to the list of views (profiles) for this web property. *)
    created : GapiDate.t;
    (** Time this web property was created. *)
    defaultProfileId : int64;
    (** Default view (profile) ID. *)
    id : string;
    (** Web property ID of the form UA-XXXXX-YY. *)
    industryVertical : string;
    (** The industry vertical/category selected for this web property. *)
    internalWebPropertyId : string;
    (** Internal ID for this web property. *)
    kind : string;
    (** Resource type for Analytics WebProperty. *)
    level : string;
    (** Level for this web property. Possible values are STANDARD or PREMIUM. *)
    name : string;
    (** Name of this web property. *)
    parentLink : ParentLink.t;
    (** Parent link for this web property. Points to the account to which this web property belongs. *)
    permissions : Permissions.t;
    (** Permissions the user has for this web property. *)
    profileCount : int;
    (** View (Profile) count for this web property. *)
    selfLink : string;
    (** Link for this web property. *)
    updated : GapiDate.t;
    (** Time this web property was last modified. *)
    websiteUrl : string;
    (** Website url for this web property. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val childLink : (t, ChildLink.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val defaultProfileId : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  val industryVertical : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val level : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val permissions : (t, Permissions.t) GapiLens.t
  val profileCount : (t, int) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val websiteUrl : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Webproperties :
sig
  type t = {
    items : Webproperty.t list;
    (** A list of web properties. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this web property collection. *)
    previousLink : string;
    (** Link to previous page for this web property collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Webproperty.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AccountRef :
sig
  type t = {
    href : string;
    (** Link for this account. *)
    id : string;
    (** Account ID. *)
    kind : string;
    (** Analytics account reference. *)
    name : string;
    (** Account name. *)
    
  }
  
  val href : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProfileRef :
sig
  type t = {
    accountId : string;
    (** Account ID to which this view (profile) belongs. *)
    href : string;
    (** Link for this view (profile). *)
    id : string;
    (** View (Profile) ID. *)
    internalWebPropertyId : string;
    (** Internal ID for the web property to which this view (profile) belongs. *)
    kind : string;
    (** Analytics view (profile) reference. *)
    name : string;
    (** Name of this view (profile). *)
    webPropertyId : string;
    (** Web property ID of the form UA-XXXXX-YY to which this view (profile) belongs. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val href : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UserRef :
sig
  type t = {
    email : string;
    (** Email ID of this user. *)
    id : string;
    (** User ID. *)
    kind : string;
    (**  *)
    
  }
  
  val email : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EntityUserLink :
sig
  module Permissions :
  sig
    type t = {
      effective : string list;
      (** Effective permissions represent all the permissions that a user has for this entity. These include any implied permissions (e.g., EDIT implies VIEW) or inherited permissions from the parent entity. Effective permissions are read-only. *)
      local : string list;
      (** Permissions that a user has been assigned at this very level. Does not include any implied or inherited permissions. Local permissions are modifiable. *)
      
    }
    
    val effective : (t, string list) GapiLens.t
    val local : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Entity :
  sig
    type t = {
      accountRef : AccountRef.t;
      (** Account for this link. *)
      profileRef : ProfileRef.t;
      (** View (Profile) for this link. *)
      webPropertyRef : WebPropertyRef.t;
      (** Web property for this link. *)
      
    }
    
    val accountRef : (t, AccountRef.t) GapiLens.t
    val profileRef : (t, ProfileRef.t) GapiLens.t
    val webPropertyRef : (t, WebPropertyRef.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    entity : Entity.t;
    (** Entity for this link. It can be an account, a web property, or a view (profile). *)
    id : string;
    (** Entity user link ID *)
    kind : string;
    (** Resource type for entity user link. *)
    permissions : Permissions.t;
    (** Permissions the user has for this entity. *)
    selfLink : string;
    (** Self link for this resource. *)
    userRef : UserRef.t;
    (** User reference. *)
    
  }
  
  val entity : (t, Entity.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val permissions : (t, Permissions.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val userRef : (t, UserRef.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Segments :
sig
  type t = {
    items : Segment.t list;
    (** A list of segments. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type for segments. *)
    nextLink : string;
    (** Link to next page for this segment collection. *)
    previousLink : string;
    (** Link to previous page for this segment collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Segment.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Upload :
sig
  type t = {
    accountId : int64;
    (** Account Id to which this upload belongs. *)
    customDataSourceId : string;
    (** Custom data source Id to which this data import belongs. *)
    errors : string list;
    (** Data import errors collection. *)
    id : string;
    (** A unique ID for this upload. *)
    kind : string;
    (** Resource type for Analytics upload. *)
    status : string;
    (** Upload status. Possible values: PENDING, COMPLETED, FAILED, DELETING, DELETED. *)
    
  }
  
  val accountId : (t, int64) GapiLens.t
  val customDataSourceId : (t, string) GapiLens.t
  val errors : (t, string list) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Account :
sig
  module Permissions :
  sig
    type t = {
      effective : string list;
      (** All the permissions that the user has for this account. These include any implied permissions (e.g., EDIT implies VIEW). *)
      
    }
    
    val effective : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ChildLink :
  sig
    type t = {
      href : string;
      (** Link to the list of web properties for this account. *)
      _type : string;
      (** Type of the child link. Its value is "analytics#webproperties". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    childLink : ChildLink.t;
    (** Child link for an account entry. Points to the list of web properties for this account. *)
    created : GapiDate.t;
    (** Time the account was created. *)
    id : string;
    (** Account ID. *)
    kind : string;
    (** Resource type for Analytics account. *)
    name : string;
    (** Account name. *)
    permissions : Permissions.t;
    (** Permissions the user has for this account. *)
    selfLink : string;
    (** Link for this account. *)
    updated : GapiDate.t;
    (** Time the account was last modified. *)
    
  }
  
  val childLink : (t, ChildLink.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val permissions : (t, Permissions.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AccountTicket :
sig
  type t = {
    account : Account.t;
    (** Account for this ticket. *)
    id : string;
    (** Account ticket ID used to access the account ticket. *)
    kind : string;
    (** Resource type for account ticket. *)
    profile : Profile.t;
    (** View (Profile) for the account. *)
    redirectUri : string;
    (** Redirect URI where the user will be sent after accepting Terms of Service. Must be configured in APIs console as a callback URL. *)
    webproperty : Webproperty.t;
    (** Web property for the account. *)
    
  }
  
  val account : (t, Account.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val profile : (t, Profile.t) GapiLens.t
  val redirectUri : (t, string) GapiLens.t
  val webproperty : (t, Webproperty.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomDataSource :
sig
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the web property to which this custom data source belongs. *)
      _type : string;
      (** Value is "analytics#webproperty". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ChildLink :
  sig
    type t = {
      href : string;
      (** Link to the list of daily uploads for this custom data source. Link to the list of uploads for this custom data source. *)
      _type : string;
      (** Value is "analytics#dailyUploads". Value is "analytics#uploads". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this custom data source belongs. *)
    childLink : ChildLink.t;
    (**  *)
    created : GapiDate.t;
    (** Time this custom data source was created. *)
    description : string;
    (** Description of custom data source. *)
    id : string;
    (** Custom data source ID. *)
    importBehavior : string;
    (**  *)
    kind : string;
    (** Resource type for Analytics custom data source. *)
    name : string;
    (** Name of this custom data source. *)
    parentLink : ParentLink.t;
    (** Parent link for this custom data source. Points to the web property to which this custom data source belongs. *)
    profilesLinked : string list;
    (** IDs of views (profiles) linked to the custom data source. *)
    selfLink : string;
    (** Link for this Analytics custom data source. *)
    _type : string;
    (** Type of the custom data source. *)
    updated : GapiDate.t;
    (** Time this custom data source was last modified. *)
    uploadType : string;
    (**  *)
    webPropertyId : string;
    (** Web property ID of the form UA-XXXXX-YY to which this custom data source belongs. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val childLink : (t, ChildLink.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val importBehavior : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val profilesLinked : (t, string list) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val uploadType : (t, string) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomDataSources :
sig
  type t = {
    items : CustomDataSource.t list;
    (** Collection of custom data sources. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this custom data source collection. *)
    previousLink : string;
    (** Link to previous page for this custom data source collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, CustomDataSource.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AnalyticsDataimportDeleteUploadDataRequest :
sig
  type t = {
    customDataImportUids : string list;
    (** A list of upload UIDs. *)
    
  }
  
  val customDataImportUids : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Goal :
sig
  module VisitTimeOnSiteDetails :
  sig
    type t = {
      comparisonType : string;
      (** Type of comparison. Possible values are LESS_THAN or GREATER_THAN. *)
      comparisonValue : int64;
      (** Value used for this comparison. *)
      
    }
    
    val comparisonType : (t, string) GapiLens.t
    val comparisonValue : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module VisitNumPagesDetails :
  sig
    type t = {
      comparisonType : string;
      (** Type of comparison. Possible values are LESS_THAN, GREATER_THAN, or EQUAL. *)
      comparisonValue : int64;
      (** Value used for this comparison. *)
      
    }
    
    val comparisonType : (t, string) GapiLens.t
    val comparisonValue : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module UrlDestinationDetails :
  sig
    module Steps :
    sig
      type t = {
        name : string;
        (** Step name. *)
        number : int;
        (** Step number. *)
        url : string;
        (** URL for this step. *)
        
      }
      
      val name : (t, string) GapiLens.t
      val number : (t, int) GapiLens.t
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      caseSensitive : bool;
      (** Determines if the goal URL must exactly match the capitalization of visited URLs. *)
      firstStepRequired : bool;
      (** Determines if the first step in this goal is required. *)
      matchType : string;
      (** Match type for the goal URL. Possible values are HEAD, EXACT, or REGEX. *)
      steps : Steps.t list;
      (** List of steps configured for this goal funnel. *)
      url : string;
      (** URL for this goal. *)
      
    }
    
    val caseSensitive : (t, bool) GapiLens.t
    val firstStepRequired : (t, bool) GapiLens.t
    val matchType : (t, string) GapiLens.t
    val steps : (t, Steps.t list) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the view (profile) to which this goal belongs. *)
      _type : string;
      (** Value is "analytics#profile". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module EventDetails :
  sig
    module EventConditions :
    sig
      type t = {
        comparisonType : string;
        (** Type of comparison. Possible values are LESS_THAN, GREATER_THAN or EQUAL. *)
        comparisonValue : int64;
        (** Value used for this comparison. *)
        expression : string;
        (** Expression used for this match. *)
        matchType : string;
        (** Type of the match to be performed. Possible values are REGEXP, BEGINS_WITH, or EXACT. *)
        _type : string;
        (** Type of this event condition. Possible values are CATEGORY, ACTION, LABEL, or VALUE. *)
        
      }
      
      val comparisonType : (t, string) GapiLens.t
      val comparisonValue : (t, int64) GapiLens.t
      val expression : (t, string) GapiLens.t
      val matchType : (t, string) GapiLens.t
      val _type : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      eventConditions : EventConditions.t list;
      (** List of event conditions. *)
      useEventValue : bool;
      (** Determines if the event value should be used as the value for this goal. *)
      
    }
    
    val eventConditions : (t, EventConditions.t list) GapiLens.t
    val useEventValue : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this goal belongs. *)
    active : bool;
    (** Determines whether this goal is active. *)
    created : GapiDate.t;
    (** Time this goal was created. *)
    eventDetails : EventDetails.t;
    (** Details for the goal of the type EVENT. *)
    id : string;
    (** Goal ID. *)
    internalWebPropertyId : string;
    (** Internal ID for the web property to which this goal belongs. *)
    kind : string;
    (** Resource type for an Analytics goal. *)
    name : string;
    (** Goal name. *)
    parentLink : ParentLink.t;
    (** Parent link for a goal. Points to the view (profile) to which this goal belongs. *)
    profileId : string;
    (** View (Profile) ID to which this goal belongs. *)
    selfLink : string;
    (** Link for this goal. *)
    _type : string;
    (** Goal type. Possible values are URL_DESTINATION, VISIT_TIME_ON_SITE, VISIT_NUM_PAGES, AND EVENT. *)
    updated : GapiDate.t;
    (** Time this goal was last modified. *)
    urlDestinationDetails : UrlDestinationDetails.t;
    (** Details for the goal of the type URL_DESTINATION. *)
    value : float;
    (** Goal value. *)
    visitNumPagesDetails : VisitNumPagesDetails.t;
    (** Details for the goal of the type VISIT_NUM_PAGES. *)
    visitTimeOnSiteDetails : VisitTimeOnSiteDetails.t;
    (** Details for the goal of the type VISIT_TIME_ON_SITE. *)
    webPropertyId : string;
    (** Web property ID to which this goal belongs. The web property ID is of the form UA-XXXXX-YY. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val active : (t, bool) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val eventDetails : (t, EventDetails.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val profileId : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val urlDestinationDetails : (t, UrlDestinationDetails.t) GapiLens.t
  val value : (t, float) GapiLens.t
  val visitNumPagesDetails : (t, VisitNumPagesDetails.t) GapiLens.t
  val visitTimeOnSiteDetails : (t, VisitTimeOnSiteDetails.t) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AccountSummary :
sig
  type t = {
    id : string;
    (** Account ID. *)
    kind : string;
    (** Resource type for Analytics AccountSummary. *)
    name : string;
    (** Account name. *)
    webProperties : WebPropertySummary.t list;
    (** List of web properties under this account. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val webProperties : (t, WebPropertySummary.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Goals :
sig
  type t = {
    items : Goal.t list;
    (** A list of goals. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this goal collection. *)
    previousLink : string;
    (** Link to previous page for this goal collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of resources in the result. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Goal.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FilterRef :
sig
  type t = {
    accountId : string;
    (** Account ID to which this filter belongs. *)
    href : string;
    (** Link for this filter. *)
    id : string;
    (** Filter ID. *)
    kind : string;
    (** Kind value for filter reference. *)
    name : string;
    (** Name of this filter. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val href : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UnsampledReports :
sig
  type t = {
    items : UnsampledReport.t list;
    (** A list of unsampled reports. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this unsampled report collection. *)
    previousLink : string;
    (** Link to previous page for this unsampled report collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of resources in the result. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, UnsampledReport.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomMetric :
sig
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the property to which the custom metric belongs. *)
      _type : string;
      (** Type of the parent link. Set to "analytics#webproperty". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID. *)
    active : bool;
    (** Boolean indicating whether the custom metric is active. *)
    created : GapiDate.t;
    (** Time the custom metric was created. *)
    id : string;
    (** Custom metric ID. *)
    index : int;
    (** Index of the custom metric. *)
    kind : string;
    (** Kind value for a custom metric. Set to "analytics#customMetric". It is a read-only field. *)
    max_value : string;
    (** Max value of custom metric. *)
    min_value : string;
    (** Min value of custom metric. *)
    name : string;
    (** Name of the custom metric. *)
    parentLink : ParentLink.t;
    (** Parent link for the custom metric. Points to the property to which the custom metric belongs. *)
    scope : string;
    (** Scope of the custom metric: HIT or PRODUCT. *)
    selfLink : string;
    (** Link for the custom metric *)
    _type : string;
    (** Data type of custom metric. *)
    updated : GapiDate.t;
    (** Time the custom metric was last modified. *)
    webPropertyId : string;
    (** Property ID. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val active : (t, bool) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val index : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val max_value : (t, string) GapiLens.t
  val min_value : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val scope : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CustomMetrics :
sig
  type t = {
    items : CustomMetric.t list;
    (** Collection of custom metrics. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this custom metric collection. *)
    previousLink : string;
    (** Link to previous page for this custom metric collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, CustomMetric.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Uploads :
sig
  type t = {
    items : Upload.t list;
    (** A list of uploads. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this upload collection. *)
    previousLink : string;
    (** Link to previous page for this upload collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of resources in the result. *)
    
  }
  
  val items : (t, Upload.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AccountSummaries :
sig
  type t = {
    items : AccountSummary.t list;
    (** A list of AccountSummaries. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this AccountSummary collection. *)
    previousLink : string;
    (** Link to previous page for this AccountSummary collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, AccountSummary.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProfileFilterLink :
sig
  type t = {
    filterRef : FilterRef.t;
    (** Filter for this link. *)
    id : string;
    (** Profile filter link ID. *)
    kind : string;
    (** Resource type for Analytics filter. *)
    profileRef : ProfileRef.t;
    (** View (Profile) for this link. *)
    rank : int;
    (** The rank of this profile filter link relative to the other filters linked to the same profile.
For readonly (i.e., list and get) operations, the rank always starts at 1.
For write (i.e., create, update, or delete) operations, you may specify a value between 0 and 255 inclusively, [0, 255]. In order to insert a link at the end of the list, either don't specify a rank or set a rank to a number greater than the largest rank in the list. In order to insert a link to the beginning of the list specify a rank that is less than or equal to 1. The new link will move all existing filters with the same or lower rank down the list. After the link is inserted/updated/deleted all profile filter links will be renumbered starting at 1. *)
    selfLink : string;
    (** Link for this profile filter link. *)
    
  }
  
  val filterRef : (t, FilterRef.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val profileRef : (t, ProfileRef.t) GapiLens.t
  val rank : (t, int) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module McfData :
sig
  module Rows :
  sig
    module ConversionPathValue :
    sig
      type t = {
        interactionType : string;
        (** Type of an interaction on conversion path. Such as CLICK, IMPRESSION etc. *)
        nodeValue : string;
        (** Node value of an interaction on conversion path. Such as source, medium etc. *)
        
      }
      
      val interactionType : (t, string) GapiLens.t
      val nodeValue : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      conversionPathValue : ConversionPathValue.t list;
      (** A conversion path dimension value, containing a list of interactions with their attributes. *)
      primitiveValue : string;
      (** A primitive dimension value. A primitive metric value. *)
      
    }
    
    val conversionPathValue : (t, ConversionPathValue.t list) GapiLens.t
    val primitiveValue : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Query :
  sig
    type t = {
      dimensions : string;
      (** List of analytics dimensions. *)
      end_date : string;
      (** End date. *)
      filters : string;
      (** Comma-separated list of dimension or metric filters. *)
      ids : string;
      (** Unique table ID. *)
      max_results : int;
      (** Maximum results per page. *)
      metrics : string list;
      (** List of analytics metrics. *)
      samplingLevel : string;
      (** Desired sampling level *)
      segment : string;
      (** Analytics advanced segment. *)
      sort : string list;
      (** List of dimensions or metrics based on which Analytics data is sorted. *)
      start_date : string;
      (** Start date. *)
      start_index : int;
      (** Start index. *)
      
    }
    
    val dimensions : (t, string) GapiLens.t
    val end_date : (t, string) GapiLens.t
    val filters : (t, string) GapiLens.t
    val ids : (t, string) GapiLens.t
    val max_results : (t, int) GapiLens.t
    val metrics : (t, string list) GapiLens.t
    val samplingLevel : (t, string) GapiLens.t
    val segment : (t, string) GapiLens.t
    val sort : (t, string list) GapiLens.t
    val start_date : (t, string) GapiLens.t
    val start_index : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ProfileInfo :
  sig
    type t = {
      accountId : string;
      (** Account ID to which this view (profile) belongs. *)
      internalWebPropertyId : string;
      (** Internal ID for the web property to which this view (profile) belongs. *)
      profileId : string;
      (** View (Profile) ID. *)
      profileName : string;
      (** View (Profile) name. *)
      tableId : string;
      (** Table ID for view (profile). *)
      webPropertyId : string;
      (** Web Property ID to which this view (profile) belongs. *)
      
    }
    
    val accountId : (t, string) GapiLens.t
    val internalWebPropertyId : (t, string) GapiLens.t
    val profileId : (t, string) GapiLens.t
    val profileName : (t, string) GapiLens.t
    val tableId : (t, string) GapiLens.t
    val webPropertyId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ColumnHeaders :
  sig
    type t = {
      columnType : string;
      (** Column Type. Either DIMENSION or METRIC. *)
      dataType : string;
      (** Data type. Dimension and metric values data types such as INTEGER, DOUBLE, CURRENCY, MCF_SEQUENCE etc. *)
      name : string;
      (** Column name. *)
      
    }
    
    val columnType : (t, string) GapiLens.t
    val dataType : (t, string) GapiLens.t
    val name : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    columnHeaders : ColumnHeaders.t list;
    (** Column headers that list dimension names followed by the metric names. The order of dimensions and metrics is same as specified in the request. *)
    containsSampledData : bool;
    (** Determines if the Analytics data contains sampled data. *)
    id : string;
    (** Unique ID for this data response. *)
    itemsPerPage : int;
    (** The maximum number of rows the response can contain, regardless of the actual number of rows returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Resource type. *)
    nextLink : string;
    (** Link to next page for this Analytics data query. *)
    previousLink : string;
    (** Link to previous page for this Analytics data query. *)
    profileInfo : ProfileInfo.t;
    (** Information for the view (profile), for which the Analytics data was requested. *)
    query : Query.t;
    (** Analytics data request query parameters. *)
    rows : Rows.t list list;
    (** Analytics data rows, where each row contains a list of dimension values followed by the metric values. The order of dimensions and metrics is same as specified in the request. *)
    sampleSize : int64;
    (** The number of samples used to calculate the result. *)
    sampleSpace : int64;
    (** Total size of the sample space from which the samples were selected. *)
    selfLink : string;
    (** Link to this page. *)
    totalResults : int;
    (** The total number of rows for the query, regardless of the number of rows in the response. *)
    totalsForAllResults : (string * string) list;
    (** Total values for the requested metrics over all the results, not just the results returned in this response. The order of the metric totals is same as the metric order specified in the request. *)
    
  }
  
  val columnHeaders : (t, ColumnHeaders.t list) GapiLens.t
  val containsSampledData : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val profileInfo : (t, ProfileInfo.t) GapiLens.t
  val query : (t, Query.t) GapiLens.t
  val rows : (t, Rows.t list list) GapiLens.t
  val sampleSize : (t, int64) GapiLens.t
  val sampleSpace : (t, int64) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val totalsForAllResults : (t, (string * string) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RealtimeData :
sig
  module Query :
  sig
    type t = {
      dimensions : string;
      (** List of real time dimensions. *)
      filters : string;
      (** Comma-separated list of dimension or metric filters. *)
      ids : string;
      (** Unique table ID. *)
      max_results : int;
      (** Maximum results per page. *)
      metrics : string list;
      (** List of real time metrics. *)
      sort : string list;
      (** List of dimensions or metrics based on which real time data is sorted. *)
      
    }
    
    val dimensions : (t, string) GapiLens.t
    val filters : (t, string) GapiLens.t
    val ids : (t, string) GapiLens.t
    val max_results : (t, int) GapiLens.t
    val metrics : (t, string list) GapiLens.t
    val sort : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ProfileInfo :
  sig
    type t = {
      accountId : string;
      (** Account ID to which this view (profile) belongs. *)
      internalWebPropertyId : string;
      (** Internal ID for the web property to which this view (profile) belongs. *)
      profileId : string;
      (** View (Profile) ID. *)
      profileName : string;
      (** View (Profile) name. *)
      tableId : string;
      (** Table ID for view (profile). *)
      webPropertyId : string;
      (** Web Property ID to which this view (profile) belongs. *)
      
    }
    
    val accountId : (t, string) GapiLens.t
    val internalWebPropertyId : (t, string) GapiLens.t
    val profileId : (t, string) GapiLens.t
    val profileName : (t, string) GapiLens.t
    val tableId : (t, string) GapiLens.t
    val webPropertyId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ColumnHeaders :
  sig
    type t = {
      columnType : string;
      (** Column Type. Either DIMENSION or METRIC. *)
      dataType : string;
      (** Data type. Dimension column headers have only STRING as the data type. Metric column headers have data types for metric values such as INTEGER, DOUBLE, CURRENCY etc. *)
      name : string;
      (** Column name. *)
      
    }
    
    val columnType : (t, string) GapiLens.t
    val dataType : (t, string) GapiLens.t
    val name : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    columnHeaders : ColumnHeaders.t list;
    (** Column headers that list dimension names followed by the metric names. The order of dimensions and metrics is same as specified in the request. *)
    id : string;
    (** Unique ID for this data response. *)
    kind : string;
    (** Resource type. *)
    profileInfo : ProfileInfo.t;
    (** Information for the view (profile), for which the real time data was requested. *)
    query : Query.t;
    (** Real time data request query parameters. *)
    rows : string list list;
    (** Real time data rows, where each row contains a list of dimension values followed by the metric values. The order of dimensions and metrics is same as specified in the request. *)
    selfLink : string;
    (** Link to this page. *)
    totalResults : int;
    (** The total number of rows for the query, regardless of the number of rows in the response. *)
    totalsForAllResults : (string * string) list;
    (** Total values for the requested metrics over all the results, not just the results returned in this response. The order of the metric totals is same as the metric order specified in the request. *)
    
  }
  
  val columnHeaders : (t, ColumnHeaders.t list) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val profileInfo : (t, ProfileInfo.t) GapiLens.t
  val query : (t, Query.t) GapiLens.t
  val rows : (t, string list list) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val totalsForAllResults : (t, (string * string) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FilterExpression :
sig
  type t = {
    caseSensitive : bool;
    (** Determines if the filter is case sensitive. *)
    expressionValue : string;
    (** Filter expression value *)
    field : string;
    (** Field to filter. Possible values:  
- Content and Traffic  
- PAGE_REQUEST_URI, 
- PAGE_HOSTNAME, 
- PAGE_TITLE, 
- REFERRAL, 
- COST_DATA_URI (Campaign target URL), 
- HIT_TYPE, 
- INTERNAL_SEARCH_TERM, 
- INTERNAL_SEARCH_TYPE, 
- SOURCE_PROPERTY_TRACKING_ID,   
- Campaign or AdGroup  
- CAMPAIGN_SOURCE, 
- CAMPAIGN_MEDIUM, 
- CAMPAIGN_NAME, 
- CAMPAIGN_AD_GROUP, 
- CAMPAIGN_TERM, 
- CAMPAIGN_CONTENT, 
- CAMPAIGN_CODE, 
- CAMPAIGN_REFERRAL_PATH,   
- E-Commerce  
- TRANSACTION_COUNTRY, 
- TRANSACTION_REGION, 
- TRANSACTION_CITY, 
- TRANSACTION_AFFILIATION (Store or order location), 
- ITEM_NAME, 
- ITEM_CODE, 
- ITEM_VARIATION, 
- TRANSACTION_ID, 
- TRANSACTION_CURRENCY_CODE, 
- PRODUCT_ACTION_TYPE,   
- Audience/Users  
- BROWSER, 
- BROWSER_VERSION, 
- BROWSER_SIZE, 
- PLATFORM, 
- PLATFORM_VERSION, 
- LANGUAGE, 
- SCREEN_RESOLUTION, 
- SCREEN_COLORS, 
- JAVA_ENABLED (Boolean Field), 
- FLASH_VERSION, 
- GEO_SPEED (Connection speed), 
- VISITOR_TYPE, 
- GEO_ORGANIZATION (ISP organization), 
- GEO_DOMAIN, 
- GEO_IP_ADDRESS, 
- GEO_IP_VERSION,   
- Location  
- GEO_COUNTRY, 
- GEO_REGION, 
- GEO_CITY,   
- Event  
- EVENT_CATEGORY, 
- EVENT_ACTION, 
- EVENT_LABEL,   
- Other  
- CUSTOM_FIELD_1, 
- CUSTOM_FIELD_2, 
- USER_DEFINED_VALUE,   
- Application  
- APP_ID, 
- APP_INSTALLER_ID, 
- APP_NAME, 
- APP_VERSION, 
- SCREEN, 
- IS_APP (Boolean Field), 
- IS_FATAL_EXCEPTION (Boolean Field), 
- EXCEPTION_DESCRIPTION,   
- Mobile device  
- IS_MOBILE (Boolean Field, Deprecated. Use DEVICE_CATEGORY=mobile), 
- IS_TABLET (Boolean Field, Deprecated. Use DEVICE_CATEGORY=tablet), 
- DEVICE_CATEGORY, 
- MOBILE_HAS_QWERTY_KEYBOARD (Boolean Field), 
- MOBILE_HAS_NFC_SUPPORT (Boolean Field), 
- MOBILE_HAS_CELLULAR_RADIO (Boolean Field), 
- MOBILE_HAS_WIFI_SUPPORT (Boolean Field), 
- MOBILE_BRAND_NAME, 
- MOBILE_MODEL_NAME, 
- MOBILE_MARKETING_NAME, 
- MOBILE_POINTING_METHOD,   
- Social  
- SOCIAL_NETWORK, 
- SOCIAL_ACTION, 
- SOCIAL_ACTION_TARGET, *)
    kind : string;
    (** Kind value for filter expression *)
    matchType : string;
    (** Match type for this filter. Possible values are BEGINS_WITH, EQUAL, ENDS_WITH, CONTAINS, MATCHES. Include and Exclude filters can use any match type. Match type is not applicable to Upper case and Lower case filters. Search and Replace expressions in the Search and Replace filter and all filter expressions in the Advanced filter default to MATCHES. User should not set match type for those filters. *)
    
  }
  
  val caseSensitive : (t, bool) GapiLens.t
  val expressionValue : (t, string) GapiLens.t
  val field : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val matchType : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GaData :
sig
  module Query :
  sig
    type t = {
      dimensions : string;
      (** List of analytics dimensions. *)
      end_date : string;
      (** End date. *)
      filters : string;
      (** Comma-separated list of dimension or metric filters. *)
      ids : string;
      (** Unique table ID. *)
      max_results : int;
      (** Maximum results per page. *)
      metrics : string list;
      (** List of analytics metrics. *)
      samplingLevel : string;
      (** Desired sampling level *)
      segment : string;
      (** Analytics advanced segment. *)
      sort : string list;
      (** List of dimensions or metrics based on which Analytics data is sorted. *)
      start_date : string;
      (** Start date. *)
      start_index : int;
      (** Start index. *)
      
    }
    
    val dimensions : (t, string) GapiLens.t
    val end_date : (t, string) GapiLens.t
    val filters : (t, string) GapiLens.t
    val ids : (t, string) GapiLens.t
    val max_results : (t, int) GapiLens.t
    val metrics : (t, string list) GapiLens.t
    val samplingLevel : (t, string) GapiLens.t
    val segment : (t, string) GapiLens.t
    val sort : (t, string list) GapiLens.t
    val start_date : (t, string) GapiLens.t
    val start_index : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ProfileInfo :
  sig
    type t = {
      accountId : string;
      (** Account ID to which this view (profile) belongs. *)
      internalWebPropertyId : string;
      (** Internal ID for the web property to which this view (profile) belongs. *)
      profileId : string;
      (** View (Profile) ID. *)
      profileName : string;
      (** View (Profile) name. *)
      tableId : string;
      (** Table ID for view (profile). *)
      webPropertyId : string;
      (** Web Property ID to which this view (profile) belongs. *)
      
    }
    
    val accountId : (t, string) GapiLens.t
    val internalWebPropertyId : (t, string) GapiLens.t
    val profileId : (t, string) GapiLens.t
    val profileName : (t, string) GapiLens.t
    val tableId : (t, string) GapiLens.t
    val webPropertyId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module DataTable :
  sig
    module Rows :
    sig
      module C :
      sig
        type t = {
          v : string;
          (**  *)
          
        }
        
        val v : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      type t = {
        c : C.t list;
        (**  *)
        
      }
      
      val c : (t, C.t list) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module Cols :
    sig
      type t = {
        id : string;
        (**  *)
        label : string;
        (**  *)
        _type : string;
        (**  *)
        
      }
      
      val id : (t, string) GapiLens.t
      val label : (t, string) GapiLens.t
      val _type : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      cols : Cols.t list;
      (**  *)
      rows : Rows.t list;
      (**  *)
      
    }
    
    val cols : (t, Cols.t list) GapiLens.t
    val rows : (t, Rows.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ColumnHeaders :
  sig
    type t = {
      columnType : string;
      (** Column Type. Either DIMENSION or METRIC. *)
      dataType : string;
      (** Data type. Dimension column headers have only STRING as the data type. Metric column headers have data types for metric values such as INTEGER, DOUBLE, CURRENCY etc. *)
      name : string;
      (** Column name. *)
      
    }
    
    val columnType : (t, string) GapiLens.t
    val dataType : (t, string) GapiLens.t
    val name : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    columnHeaders : ColumnHeaders.t list;
    (** Column headers that list dimension names followed by the metric names. The order of dimensions and metrics is same as specified in the request. *)
    containsSampledData : bool;
    (** Determines if Analytics data contains samples. *)
    dataTable : DataTable.t;
    (**  *)
    id : string;
    (** Unique ID for this data response. *)
    itemsPerPage : int;
    (** The maximum number of rows the response can contain, regardless of the actual number of rows returned. Its value ranges from 1 to 10,000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Resource type. *)
    nextLink : string;
    (** Link to next page for this Analytics data query. *)
    previousLink : string;
    (** Link to previous page for this Analytics data query. *)
    profileInfo : ProfileInfo.t;
    (** Information for the view (profile), for which the Analytics data was requested. *)
    query : Query.t;
    (** Analytics data request query parameters. *)
    rows : string list list;
    (** Analytics data rows, where each row contains a list of dimension values followed by the metric values. The order of dimensions and metrics is same as specified in the request. *)
    sampleSize : int64;
    (** The number of samples used to calculate the result. *)
    sampleSpace : int64;
    (** Total size of the sample space from which the samples were selected. *)
    selfLink : string;
    (** Link to this page. *)
    totalResults : int;
    (** The total number of rows for the query, regardless of the number of rows in the response. *)
    totalsForAllResults : (string * string) list;
    (** Total values for the requested metrics over all the results, not just the results returned in this response. The order of the metric totals is same as the metric order specified in the request. *)
    
  }
  
  val columnHeaders : (t, ColumnHeaders.t list) GapiLens.t
  val containsSampledData : (t, bool) GapiLens.t
  val dataTable : (t, DataTable.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val profileInfo : (t, ProfileInfo.t) GapiLens.t
  val query : (t, Query.t) GapiLens.t
  val rows : (t, string list list) GapiLens.t
  val sampleSize : (t, int64) GapiLens.t
  val sampleSpace : (t, int64) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val totalsForAllResults : (t, (string * string) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProfileFilterLinks :
sig
  type t = {
    items : ProfileFilterLink.t list;
    (** A list of profile filter links. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1,000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this profile filter link collection. *)
    previousLink : string;
    (** Link to previous page for this profile filter link collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, ProfileFilterLink.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Accounts :
sig
  type t = {
    items : Account.t list;
    (** A list of accounts. *)
    itemsPerPage : int;
    (** The maximum number of entries the response can contain, regardless of the actual number of entries returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Next link for this account collection. *)
    previousLink : string;
    (** Previous link for this account collection. *)
    startIndex : int;
    (** The starting index of the entries, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Account.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EntityUserLinks :
sig
  type t = {
    items : EntityUserLink.t list;
    (** A list of entity user links. *)
    itemsPerPage : int;
    (** The maximum number of entries the response can contain, regardless of the actual number of entries returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Next link for this account collection. *)
    previousLink : string;
    (** Previous link for this account collection. *)
    startIndex : int;
    (** The starting index of the entries, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    
  }
  
  val items : (t, EntityUserLink.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Profiles :
sig
  type t = {
    items : Profile.t list;
    (** A list of views (profiles). *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this view (profile) collection. *)
    previousLink : string;
    (** Link to previous page for this view (profile) collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Profile.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Filter :
sig
  module UppercaseDetails :
  sig
    type t = {
      field : string;
      (** Field to use in the filter. *)
      
    }
    
    val field : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module SearchAndReplaceDetails :
  sig
    type t = {
      caseSensitive : bool;
      (** Determines if the filter is case sensitive. *)
      field : string;
      (** Field to use in the filter. *)
      replaceString : string;
      (** Term to replace the search term with. *)
      searchString : string;
      (** Term to search. *)
      
    }
    
    val caseSensitive : (t, bool) GapiLens.t
    val field : (t, string) GapiLens.t
    val replaceString : (t, string) GapiLens.t
    val searchString : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the account to which this filter belongs. *)
      _type : string;
      (** Value is "analytics#account". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module LowercaseDetails :
  sig
    type t = {
      field : string;
      (** Field to use in the filter. *)
      
    }
    
    val field : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module AdvancedDetails :
  sig
    type t = {
      caseSensitive : bool;
      (** Indicates if the filter expressions are case sensitive. *)
      extractA : string;
      (** Expression to extract from field A. *)
      extractB : string;
      (** Expression to extract from field B. *)
      fieldA : string;
      (** Field A. *)
      fieldARequired : bool;
      (** Indicates if field A is required to match. *)
      fieldB : string;
      (** Field B. *)
      fieldBRequired : bool;
      (** Indicates if field B is required to match. *)
      outputConstructor : string;
      (** Expression used to construct the output value. *)
      outputToField : string;
      (** Output field. *)
      overrideOutputField : bool;
      (** Indicates if the existing value of the output field, if any, should be overridden by the output expression. *)
      
    }
    
    val caseSensitive : (t, bool) GapiLens.t
    val extractA : (t, string) GapiLens.t
    val extractB : (t, string) GapiLens.t
    val fieldA : (t, string) GapiLens.t
    val fieldARequired : (t, bool) GapiLens.t
    val fieldB : (t, string) GapiLens.t
    val fieldBRequired : (t, bool) GapiLens.t
    val outputConstructor : (t, string) GapiLens.t
    val outputToField : (t, string) GapiLens.t
    val overrideOutputField : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this filter belongs. *)
    advancedDetails : AdvancedDetails.t;
    (** Details for the filter of the type ADVANCED. *)
    created : GapiDate.t;
    (** Time this filter was created. *)
    excludeDetails : FilterExpression.t;
    (** Details for the filter of the type EXCLUDE. *)
    id : string;
    (** Filter ID. *)
    includeDetails : FilterExpression.t;
    (** Details for the filter of the type INCLUDE. *)
    kind : string;
    (** Resource type for Analytics filter. *)
    lowercaseDetails : LowercaseDetails.t;
    (** Details for the filter of the type LOWER. *)
    name : string;
    (** Name of this filter. *)
    parentLink : ParentLink.t;
    (** Parent link for this filter. Points to the account to which this filter belongs. *)
    searchAndReplaceDetails : SearchAndReplaceDetails.t;
    (** Details for the filter of the type SEARCH_AND_REPLACE. *)
    selfLink : string;
    (** Link for this filter. *)
    _type : string;
    (** Type of this filter. Possible values are INCLUDE, EXCLUDE, LOWERCASE, UPPERCASE, SEARCH_AND_REPLACE and ADVANCED. *)
    updated : GapiDate.t;
    (** Time this filter was last modified. *)
    uppercaseDetails : UppercaseDetails.t;
    (** Details for the filter of the type UPPER. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val advancedDetails : (t, AdvancedDetails.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val excludeDetails : (t, FilterExpression.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val includeDetails : (t, FilterExpression.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lowercaseDetails : (t, LowercaseDetails.t) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val searchAndReplaceDetails : (t, SearchAndReplaceDetails.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val uppercaseDetails : (t, UppercaseDetails.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Filters :
sig
  type t = {
    items : Filter.t list;
    (** A list of filters. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1,000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this filter collection. *)
    previousLink : string;
    (** Link to previous page for this filter collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, Filter.t list) GapiLens.t
  val itemsPerPage : (t, int) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val previousLink : (t, string) GapiLens.t
  val startIndex : (t, int) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

