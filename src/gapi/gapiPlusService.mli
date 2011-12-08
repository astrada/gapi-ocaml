(** Service definition for Plus (v1).
 
  The Google+ API enables developers to build on top of the Google+ platform.
 
  For more information about this service, see the
  {{:http://developers.google.com/+/api/}API Documentation}
 *)

(** The query parameters you can use with the Google+ API. *)
module PlusParameters :
sig
  type t = {
    fields : string;
    (** Selector specifying which fields to include in a partial response. *)
    prettyPrint : bool;
    (** Returns response with indentations and line breaks. *)
    quotaUser : string;
    (** Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. Overrides [userIp] if both are provided. *)
    userIp : string;
    (** IP address of the end user for whom the API call is being made. *)
    query : string;
    (** Full-text search query string. *)
    language : string;
    (** Specify the preferred language to search with. See search language codes for available values. *)
    maxResults : int;
    (** The maximum number of activities to include in the response, used for paging. For any response, the actual number returned may be less than the specified maxResults. *) 
    orderBy : string;
    (** Specifies how to order search results.

      Acceptable values are:
      - ["best"] - Sort activities by relevance to the user, most relevant first.
      - ["recent"] - Sort activities by published date, most recent first. (default) *)
    pageToken : string
    (** The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of [nextPageToken] from the previous response. This token may be of any length. *)
  }

  val default : t

  val to_key_value_list : t -> (string * string) list

end

(** The "activities" service. *)
module ActivitiesResource :
sig
  (** List all of the activities in the specified collection for a particular user.

    Usage: [list session] where [session] is the current session.

    @param user_id The ID of the user to get activities for. The special value ["me"] can be used to indicate the authenticated user. Defaults to ["me"].
    @param collection The collection of activities to list. Defaults to ["public"].
    @param url the service endpoint (defaults to ["https://www.googleapis.com/plus/v1/people"])
    @param parameters request parameters
    *)
  val list :
    ?url:string ->
    ?parameters:PlusParameters.t ->
    ?user_id:string ->
    ?collection:string ->
    GapiConversation.Session.t ->
    GapiPlus.ActivityFeed.t * GapiConversation.Session.t

  (** Get an activity.

    Usage: [get activity_id session] where [activity_id] is the ID of the activity to get, and [session] is the current session.

    @param url the service endpoint (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters request parameters
    *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    GapiPlus.Activity.t * GapiConversation.Session.t

  (** Search public activities.

    Usage: [search parameters session] where [parameters] specify the query parameters, and [session] is the current session.

    @param url the service endpoint (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters request parameters
    *)
  val search :
    ?url:string ->
    PlusParameters.t ->
    GapiConversation.Session.t ->
    GapiPlus.ActivityFeed.t * GapiConversation.Session.t

end

(** The "comments" service. *)
module CommentsResource :
sig
  (** List all of the comments for an activity.

    Usage: [list activity_id session] where [activity_id] is the ID of the activity to get comments for, and [session] is the current session.

    @param url the service endpoint (defaults to ["https://www.googleapis.com/plus/v1/activities"])
    @param parameters request parameters
    *)
  val list :
    ?url:string ->
    ?parameters:PlusParameters.t ->
    string ->
    GapiConversation.Session.t ->
    GapiPlus.CommentFeed.t * GapiConversation.Session.t

  (** Get a comment.
   
    @param url the service endpoint (defaults to ["https://www.googleapis.com/plus/v1/comments"])
    @param parameters request parameters
   *)
  val get :
    ?url:string ->
    ?parameters:GapiService.StandardParameters.t ->
    ?container_id:string ->
    string ->
    GapiConversation.Session.t ->
    GapiPlus.Comment.t * GapiConversation.Session.t

end

