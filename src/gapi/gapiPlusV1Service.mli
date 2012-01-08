(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Google+ API (v1).
  
  The Google+ API enables developers to build on top of the Google+ platform..
  
  For more information about this service, see the
  {{:http://developers.google.com/+/api/}API Documentation}.
  *)

(** Know who you are on Google *)
val scope_me : string
(** View your email address *)
val scope_email : string
module ActivitiesResource :
sig
  
  module OrderBy :
  sig
    type t =
      | Default
      | Best
      | Recent
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Collection :
  sig
    type t =
      | Default
      | Public
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Alt :
  sig
    type t =
      | Default
      | Json
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  (** Get an activity.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param alt Specifies an alternative representation type.
    @param activityId The ID of the activity to get.
    *)
  val get :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?alt:Alt.t ->
    activityId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Activity.t * GapiConversation.Session.t
  
  (** List all of the activities in the specified collection for a particular user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param alt Specifies an alternative representation type.
    @param maxResults The maximum number of activities to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param userId The ID of the user to get activities for. The special value "me" can be used to indicate the authenticated user.
    @param collection The collection of activities to list.
    *)
  val list :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?alt:Alt.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    userId:string ->
    collection:Collection.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.ActivityFeed.t * GapiConversation.Session.t
  
  (** Search public activities.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param maxResults The maximum number of activities to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param orderBy Specifies how to order search results.
    @param language Specify the preferred language to search with. See search language codes for available values.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response. This token may be of any length.
    @param query Full-text search query string.
    *)
  val search :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?orderBy:OrderBy.t ->
    ?language:string ->
    ?pageToken:string ->
    query:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.ActivityFeed.t * GapiConversation.Session.t
  
  
end

module CommentsResource :
sig
  
  module Alt :
  sig
    type t =
      | Default
      | Json
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  (** Get a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param commentId The ID of the comment to get.
    *)
  val get :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Comment.t * GapiConversation.Session.t
  
  (** List all of the comments for an activity.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param alt Specifies an alternative representation type.
    @param maxResults The maximum number of comments to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param activityId The ID of the activity to get comments for.
    *)
  val list :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?alt:Alt.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    activityId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.CommentFeed.t * GapiConversation.Session.t
  
  
end

module PeopleResource :
sig
  
  module Collection :
  sig
    type t =
      | Default
      | Plusoners
      | Resharers
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  (** Get a person's profile.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param userId The ID of the person to get the profile for. The special value "me" can be used to indicate the authenticated user.
    *)
  val get :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    userId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Person.t * GapiConversation.Session.t
  
  (** List all of the people in the specified collection for a particular activity.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param maxResults The maximum number of people to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param activityId The ID of the activity to get the list of people for.
    @param collection The collection of people to list.
    *)
  val listByActivity :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    activityId:string ->
    collection:Collection.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.PeopleFeed.t * GapiConversation.Session.t
  
  (** Search all public profiles.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param parameters Optional standard parameters.
    @param maxResults The maximum number of people to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param language Specify the preferred language to search with. See search language codes for available values.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response. This token may be of any length.
    @param query Full-text search query string.
    *)
  val search :
    ?base_url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?language:string ->
    ?pageToken:string ->
    query:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.PeopleFeed.t * GapiConversation.Session.t
  
  
end

