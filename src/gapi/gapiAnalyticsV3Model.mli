(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Google Analytics API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/analytics/}API Documentation}.
  *)

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
      (** Link to the profile to which this goal belongs. *)
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
    (** Parent link for a goal. Points to the profile to which this goal belongs. *)
    profileId : string;
    (** Profile ID to which this goal belongs. *)
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

module Segment :
sig
  type t = {
    created : GapiDate.t;
    (** Time the advanced segment was created. *)
    definition : string;
    (** Advanced segment definition. *)
    id : string;
    (** Advanced segment ID. *)
    kind : string;
    (** Resource type for Analytics advanced segment. *)
    name : string;
    (** Advanced segment name. *)
    segmentId : string;
    (** Segment ID. Can be used with the 'segment' parameter in Data Feed. *)
    selfLink : string;
    (** Link for this advanced segment. *)
    updated : GapiDate.t;
    (** Time the advanced segment was last modified. *)
    
  }
  
  val created : (t, GapiDate.t) GapiLens.t
  val definition : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val segmentId : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
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
      (** Account ID to which this profile belongs. *)
      internalWebPropertyId : string;
      (** Internal ID for the web property to which this profile belongs. *)
      profileId : string;
      (** Profile ID. *)
      profileName : string;
      (** Profile name. *)
      tableId : string;
      (** Table ID for profile. *)
      webPropertyId : string;
      (** Web Property ID to which this profile belongs. *)
      
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
    containsSampledData : bool;
    (** Determines if Analytics data contains samples. *)
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
    (** Information for the profile, for which the Analytics data was requested. *)
    query : Query.t;
    (** Analytics data request query parameters. *)
    rows : string list list;
    (** Analytics data rows, where each row contains a list of dimension values followed by the metric values. The order of dimensions and metrics is same as specified in the request. *)
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

module Webproperty :
sig
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
      (** Link to the list of profiles for this web property. *)
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
    (** Child link for this web property. Points to the list of profiles for this web property. *)
    created : GapiDate.t;
    (** Time this web property was created. *)
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
    profileCount : int;
    (** Profile count for this web property. *)
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
  val id : (t, string) GapiLens.t
  val industryVertical : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val level : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
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
      (** Link to the profile to which this experiment belongs. This field is read-only. *)
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
    editableInGaUi : string;
    (** If true, the end user will be able to edit the experiment via the Google Analytics user interface. *)
    endTime : GapiDate.t;
    (** The ending time of the experiment (the time the status changed from RUNNING to ENDED). This field is present only if the experiment has ended. This field is read-only. *)
    id : string;
    (** Experiment ID. Required for patch and update. Disallowed for create. *)
    internalWebPropertyId : string;
    (** Internal ID for the web property to which this experiment belongs. This field is read-only. *)
    kind : string;
    (** Resource type for an Analytics experiment. This field is read-only. *)
    minimumExperimentLengthInDays : int;
    (** Specifies the minimum length of the experiment. Can be changed for a running experiment. This field may not be changed for an experiments whose status is ENDED. *)
    name : string;
    (** Experiment name. This field may not be changed for an experiment whose status is ENDED. This field is required when creating an experiment. *)
    objectiveMetric : string;
    (** The metric that the experiment is optimizing. Valid values: "ga:goal(n)Completions", "ga:bounces", "ga:pageviews", "ga:timeOnSite", "ga:transactions", "ga:transactionRevenue". This field is required if status is "RUNNING" and servingFramework is one of "REDIRECT" or "API". *)
    optimizationType : string;
    (** Whether the objectiveMetric should be minimized or maximized. Possible values: "MAXIMUM", "MINIMUM". Optional--defaults to "MAXIMUM". Cannot be specified without objectiveMetric. Cannot be modified when status is "RUNNING" or "ENDED". *)
    parentLink : ParentLink.t;
    (** Parent link for an experiment. Points to the profile to which this experiment belongs. *)
    profileId : string;
    (** Profile ID to which this experiment belongs. This field is read-only. *)
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
  val editableInGaUi : (t, string) GapiLens.t
  val endTime : (t, GapiDate.t) GapiLens.t
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
      (** Link to the list of daily uploads for this custom data source. *)
      _type : string;
      (** Value is "analytics#dailyUploads". *)
      
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
    (** Child link for this custom data source. Points to the list of daily uploads for this custom data source. *)
    created : GapiDate.t;
    (** Time this custom data source was created. *)
    description : string;
    (** Description of custom data source. *)
    id : string;
    (** Custom data source ID. *)
    kind : string;
    (** Resource type for Analytics custom data source. *)
    name : string;
    (** Name of this custom data source. *)
    parentLink : ParentLink.t;
    (** Parent link for this custom data source. Points to the web property to which this custom data source belongs. *)
    profilesLinked : string list;
    (** IDs of profiles linked to the custom data source. *)
    selfLink : string;
    (** Link for this Analytics custom data source. *)
    updated : GapiDate.t;
    (** Time this custom data source was last modified. *)
    webPropertyId : string;
    (** Web property ID of the form UA-XXXXX-YY to which this custom data source belongs. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val childLink : (t, ChildLink.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val profilesLinked : (t, string list) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Profile :
sig
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the web property to which this profile belongs. *)
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
      (** Link to the list of goals for this profile. *)
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
    (** Account ID to which this profile belongs. *)
    childLink : ChildLink.t;
    (** Child link for this profile. Points to the list of goals for this profile. *)
    created : GapiDate.t;
    (** Time this profile was created. *)
    currency : string;
    (** The currency type associated with this profile. *)
    defaultPage : string;
    (** Default page for this profile. *)
    eCommerceTracking : bool;
    (** Indicates whether ecommerce tracking is enabled for this profile. *)
    excludeQueryParameters : string;
    (** The query parameters that are excluded from this profile. *)
    id : string;
    (** Profile ID. *)
    internalWebPropertyId : string;
    (** Internal ID for the web property to which this profile belongs. *)
    kind : string;
    (** Resource type for Analytics profile. *)
    name : string;
    (** Name of this profile. *)
    parentLink : ParentLink.t;
    (** Parent link for this profile. Points to the web property to which this profile belongs. *)
    selfLink : string;
    (** Link for this profile. *)
    siteSearchCategoryParameters : string;
    (** Site search category parameters for this profile. *)
    siteSearchQueryParameters : string;
    (** The site search query parameters for this profile. *)
    timezone : string;
    (** Time zone for which this profile has been configured. *)
    _type : string;
    (** Profile type. Supported types: WEB or APP. *)
    updated : GapiDate.t;
    (** Time this profile was last modified. *)
    webPropertyId : string;
    (** Web property ID of the form UA-XXXXX-YY to which this profile belongs. *)
    websiteUrl : string;
    (** Website URL for this profile. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val childLink : (t, ChildLink.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val currency : (t, string) GapiLens.t
  val defaultPage : (t, string) GapiLens.t
  val eCommerceTracking : (t, bool) GapiLens.t
  val excludeQueryParameters : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalWebPropertyId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val siteSearchCategoryParameters : (t, string) GapiLens.t
  val siteSearchQueryParameters : (t, string) GapiLens.t
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

module Profiles :
sig
  type t = {
    items : Profile.t list;
    (** A list of profiles. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. *)
    nextLink : string;
    (** Link to next page for this profile collection. *)
    previousLink : string;
    (** Link to previous page for this profile collection. *)
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

module DailyUpload :
sig
  module RecentChanges :
  sig
    type t = {
      change : string;
      (** The type of change: APPEND, RESET, or DELETE. *)
      time : GapiDate.t;
      (** The time when the change occurred. *)
      
    }
    
    val change : (t, string) GapiLens.t
    val time : (t, GapiDate.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ParentLink :
  sig
    type t = {
      href : string;
      (** Link to the custom data source to which this daily upload belongs. *)
      _type : string;
      (** Value is "analytics#customDataSource". *)
      
    }
    
    val href : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    accountId : string;
    (** Account ID to which this daily upload belongs. *)
    appendCount : int;
    (** Number of appends for this date. *)
    createdTime : GapiDate.t;
    (** Time this daily upload was created. *)
    customDataSourceId : string;
    (** Custom data source ID to which this daily upload belongs. *)
    date : string;
    (** Date associated with daily upload. *)
    kind : string;
    (** Resource type for Analytics daily upload. *)
    modifiedTime : GapiDate.t;
    (** Time this daily upload was last modified. *)
    parentLink : ParentLink.t;
    (** Parent link for a daily upload. Points to the custom data source to which this daily upload belongs. *)
    recentChanges : RecentChanges.t list;
    (** Change log for last 10 changes in chronological order. *)
    selfLink : string;
    (** Link for this daily upload. *)
    webPropertyId : string;
    (** Web property ID of the form UA-XXXXX-YY to which this daily upload belongs. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val appendCount : (t, int) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val customDataSourceId : (t, string) GapiLens.t
  val date : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val parentLink : (t, ParentLink.t) GapiLens.t
  val recentChanges : (t, RecentChanges.t list) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DailyUploads :
sig
  type t = {
    items : DailyUpload.t list;
    (** A collection of daily uploads. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type. Value is analytics#dailyUploads. *)
    nextLink : string;
    (** Link to next page for this daily upload collection. *)
    previousLink : string;
    (** Link to previous page for this daily upload collection. *)
    startIndex : int;
    (** The starting index of the resources, which is 1 by default or otherwise specified by the start-index query parameter. *)
    totalResults : int;
    (** The total number of results for the query, regardless of the number of results in the response. *)
    username : string;
    (** Email ID of the authenticated user *)
    
  }
  
  val items : (t, DailyUpload.t list) GapiLens.t
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

module Account :
sig
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
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DailyUploadAppend :
sig
  type t = {
    accountId : string;
    (** Account Id to which this daily upload append belongs. *)
    appendNumber : int;
    (** Append number. *)
    customDataSourceId : string;
    (** Custom data source Id to which this daily upload append belongs. *)
    date : string;
    (** Date associated with daily upload append. *)
    kind : string;
    (** Resource type for Analytics daily upload append. *)
    nextAppendLink : string;
    (**  *)
    webPropertyId : string;
    (** Web property Id of the form UA-XXXXX-YY to which this daily upload append belongs. *)
    
  }
  
  val accountId : (t, string) GapiLens.t
  val appendNumber : (t, int) GapiLens.t
  val customDataSourceId : (t, string) GapiLens.t
  val date : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextAppendLink : (t, string) GapiLens.t
  val webPropertyId : (t, string) GapiLens.t
  
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
    (** A list of advanced segments. *)
    itemsPerPage : int;
    (** The maximum number of resources the response can contain, regardless of the actual number of resources returned. Its value ranges from 1 to 1000 with a value of 1000 by default, or otherwise specified by the max-results query parameter. *)
    kind : string;
    (** Collection type for advanced segments. *)
    nextLink : string;
    (** Link to next page for this advanced segment collection. *)
    previousLink : string;
    (** Link to previous page for this advanced segment collection. *)
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
      (** Account ID to which this profile belongs. *)
      internalWebPropertyId : string;
      (** Internal ID for the web property to which this profile belongs. *)
      profileId : string;
      (** Profile ID. *)
      profileName : string;
      (** Profile name. *)
      tableId : string;
      (** Table ID for profile. *)
      webPropertyId : string;
      (** Web Property ID to which this profile belongs. *)
      
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
    (** Information for the profile, for which the Analytics data was requested. *)
    query : Query.t;
    (** Analytics data request query parameters. *)
    rows : Rows.t list list;
    (** Analytics data rows, where each row contains a list of dimension values followed by the metric values. The order of dimensions and metrics is same as specified in the request. *)
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
  val selfLink : (t, string) GapiLens.t
  val totalResults : (t, int) GapiLens.t
  val totalsForAllResults : (t, (string * string) list) GapiLens.t
  
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

