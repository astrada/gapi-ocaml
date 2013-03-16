(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Google+ API (v1).
  
  The Google+ API enables developers to build on top of the Google+ platform..
  
  For more information about this service, see the
  {{:https://developers.google.com/+/api/}API Documentation}.
  *)

module Scope :
sig
  val plus_login : string
  (** Know your name, basic info, and list of people you're connected to on Google+ *)
  
  val plus_me : string
  (** Know who you are on Google *)
  
  
end
(** Service Auth Scopes *)

module ActivitiesResource :
sig
  
  module OrderBy :
  sig
    type t =
      | Default
      | Best (** Sort activities by relevance to the user, most relevant first. *)
      | Recent (** Sort activities by published date, most recent first. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Collection :
  sig
    type t =
      | Default
      | Public (** All public activities created by the specified user. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Get an activity.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param activityId The ID of the activity to get.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    activityId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Activity.t * GapiConversation.Session.t
  
  (** List all of the activities in the specified collection for a particular user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of activities to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param userId The ID of the user to get activities for. The special value "me" can be used to indicate the authenticated user.
    @param collection The collection of activities to list.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    userId:string ->
    collection:Collection.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.ActivityFeed.t * GapiConversation.Session.t
  
  (** Search public activities.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param language Specify the preferred language to search with. See search language codes for available values.
    @param maxResults The maximum number of activities to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param orderBy Specifies how to order search results.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response. This token can be of any length.
    @param query Full-text search query string.
    *)
  val search :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?language:string ->
    ?maxResults:int ->
    ?orderBy:OrderBy.t ->
    ?pageToken:string ->
    query:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.ActivityFeed.t * GapiConversation.Session.t
  
  
end

module CommentsResource :
sig
  
  module SortOrder :
  sig
    type t =
      | Default
      | Ascending (** Sort oldest comments first. *)
      | Descending (** Sort newest comments first. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Get a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param commentId The ID of the comment to get.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Comment.t * GapiConversation.Session.t
  
  (** List all of the comments for an activity.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of comments to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param sortOrder The order in which to sort the list of comments.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param activityId The ID of the activity to get comments for.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?sortOrder:SortOrder.t ->
    ?pageToken:string ->
    activityId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.CommentFeed.t * GapiConversation.Session.t
  
  
end

module MomentsResource :
sig
  
  module Collection :
  sig
    type t =
      | Default
      | Vault (** The default collection for writing new moments. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Record a moment representing a user's activity such as making a purchase or commenting on a blog.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param debug Return the moment as written. Should be used only for debugging.
    @param userId The ID of the user to record activities for. The only valid values are "me" and the ID of the authenticated user.
    @param collection The collection to which to write moments.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?debug:bool ->
    userId:string ->
    collection:Collection.t ->
    GapiPlusV1Model.Moment.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Moment.t * GapiConversation.Session.t
  
  (** List all of the moments for a particular user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of moments to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param targetUrl Only moments containing this targetUrl will be returned.
    @param _type Only moments of this type will be returned.
    @param userId The ID of the user to get moments for. The special value "me" can be used to indicate the authenticated user.
    @param collection The collection of moments to list.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?targetUrl:string ->
    ?_type:string ->
    userId:string ->
    collection:Collection.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.MomentsFeed.t * GapiConversation.Session.t
  
  (** Delete a moment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param id The ID of the moment to delete.
    *)
  val remove :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    id:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  
end

module PeopleResource :
sig
  
  module OrderBy :
  sig
    type t =
      | Default
      | Alphabetical (** Order the people by their display name. *)
      | Best (** Order people based on the relevence to the viewer. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  module Collection :
  sig
    type t =
      | Default
      | Visible (** The list of people who this user has added to one or more circles, limited to the circles visible to the requesting application. *)
      | Plusoners (** List all people who have +1'd this activity. *)
      | Resharers (** List all people who have reshared this activity. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Get a person's profile. If your app uses scope https://www.googleapis.com/auth/plus.login, this method is guaranteed to return ageRange and language.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param userId The ID of the person to get the profile for. The special value "me" can be used to indicate the authenticated user.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    userId:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.Person.t * GapiConversation.Session.t
  
  (** List all of the people in the specified collection.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of people to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param orderBy The order to return people in.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param userId Get the collection of people for the person identified. Use "me" to indicate the authenticated user.
    @param collection The collection of people to list.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?orderBy:OrderBy.t ->
    ?pageToken:string ->
    userId:string ->
    collection:Collection.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.PeopleFeed.t * GapiConversation.Session.t
  
  (** List all of the people in the specified collection for a particular activity.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param maxResults The maximum number of people to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param activityId The ID of the activity to get the list of people for.
    @param collection The collection of people to list.
    *)
  val listByActivity :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    activityId:string ->
    collection:Collection.t ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.PeopleFeed.t * GapiConversation.Session.t
  
  (** Search all public profiles.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/plus/v1/"]).
    @param std_params Optional standard parameters.
    @param language Specify the preferred language to search with. See search language codes for available values.
    @param maxResults The maximum number of people to include in the response, which is used for paging. For any response, the actual number returned might be less than the specified maxResults.
    @param pageToken The continuation token, which is used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response. This token can be of any length.
    @param query Specify a query string for full text search of public text in all profiles.
    *)
  val search :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?language:string ->
    ?maxResults:int ->
    ?pageToken:string ->
    query:string ->
    GapiConversation.Session.t ->
    GapiPlusV1Model.PeopleFeed.t * GapiConversation.Session.t
  
  
end


