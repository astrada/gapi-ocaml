(** Service definition for Plus (v1).
 
  The Google+ API enables developers to build on top of the Google+ platform.
 
  For more information about this service, see the
  {{:http://developers.google.com/+/api/}API Documentation}
 *)

(** OAuth 2.0 scope that allows you to identify who the authenticated user is. *)
val scope : string

(** The "activities" service. *)
module ActivitiesResource :
sig
  (** List all of the activities in the specified collection for a particular user.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/people"])
    @param parameters Optional standard parameters.
    @param userId The ID of the user to get activities for. The special value "me" can be used to indicate the authenticated user.
    @param collection The collection of activities to list.
    @param maxResults The maximum number of activities to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    *)
  val list :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?userId:string ->
    ?collection:string ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiPlus.ActivityFeed.t * GapiConversation.Session.t

  (** Get an activity.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters Optional standard parameters.
    @param activityId The ID of the activity to get.
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    activityId:string ->
    GapiConversation.Session.t ->
    GapiPlus.Activity.t * GapiConversation.Session.t

  (** Search public activities.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters Optional standard parameters.
    @param query Full-text search query string.
    @param language Specify the preferred language to search with. See search language codes for available values.
    @param maxResults The maximum number of activities to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param orderBy Specifies how to order search results.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    *)
  val search :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    query:string ->
    ?language:string ->
    ?maxResults:int ->
    ?orderBy:string ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiPlus.ActivityFeed.t * GapiConversation.Session.t

end

(** The "comments" service. *)
module CommentsResource :
sig
  (** List all of the comments for an activity.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters Optional standard parameters.
    @param activityId The ID of the activity to get comments for.
    @param maxResults The maximum number of comments to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    *)
  val list :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    activityId:string ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiPlus.CommentFeed.t * GapiConversation.Session.t

  (** Get a comment.
   
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/comments"])
    @param parameters Optional standard parameters.
    @param commentId The ID of the comment to get.
   *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiPlus.Comment.t * GapiConversation.Session.t

end

(** The "people" collection of methods. *)
module PeopleResource :
sig
  (**
    List all of the people in the specified collection for a particular activity.
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters Optional standard parameters.
    @param activityId The ID of the activity to get the list of people for.
    @param collection The collection of people to list.
    @param maxResults The maximum number of people to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    *)
  val listByActivity :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    activityId:string ->
    collection:string ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiPlus.PeopleFeed.t * GapiConversation.Session.t

  (** Search all public profiles.

    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/people"])
    @param parameters Optional standard parameters.
    @param query Full-text search query string.
    @param language Specify the preferred language to search with. See search language codes for available values.
    @param maxResults The maximum number of people to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
   *)
  val search :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    query:string ->
    ?language:string ->
    ?maxResults:int ->
    ?pageToken:string ->
    GapiConversation.Session.t ->
    GapiPlus.PeopleFeed.t * GapiConversation.Session.t

  (** Get a person's profile.
   
    @param url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/people"])
    @param parameters Optional standard parameters.
    @param userId The ID of the person to get the profile for. The special value "me" can be used to indicate the authenticated user.
   *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    userId:string ->
    GapiConversation.Session.t ->
    GapiPlus.Person.t * GapiConversation.Session.t

end

