(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Blogger API (v2).
  
  API for access to the data within Blogger..
  
  For more information about this service, see the
  {{:https://developers.google.com/blogger/docs/2.0/json/getting_started}API Documentation}.
  *)

module Scope :
sig
  val blogger : string
  (** Manage your Blogger account *)
  
  
end
(** Service Auth Scopes *)

module BlogsResource :
sig
  
  (** Gets one blog by id.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param blogId The ID of the blog to get.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    blogId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.Blog.t * GapiConversation.Session.t
  
  
end

module CommentsResource :
sig
  
  (** Gets one comment by id.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param blogId ID of the blog to containing the comment.
    @param postId ID of the post to fetch posts from.
    @param commentId The ID of the comment to get.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    blogId:string ->
    postId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.Comment.t * GapiConversation.Session.t
  
  (** Retrieves the comments for a blog, possibly filtered.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param std_params Optional standard parameters.
    @param fetchBodies Whether the body content of the comments is included.
    @param maxResults Maximum number of comments to include in the result.
    @param pageToken Continuation token if request is paged.
    @param startDate Earliest date of comment to fetch, a date-time with RFC 3339 formatting.
    @param blogId ID of the blog to fetch comments from.
    @param postId ID of the post to fetch posts from.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?fetchBodies:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?startDate:GapiDate.t ->
    blogId:string ->
    postId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.CommentList.t * GapiConversation.Session.t
  
  
end

module PagesResource :
sig
  
  (** Gets one blog page by id.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param blogId ID of the blog containing the page.
    @param pageId The ID of the page to get.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    blogId:string ->
    pageId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.Page.t * GapiConversation.Session.t
  
  (** Retrieves pages for a blog, possibly filtered.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param std_params Optional standard parameters.
    @param fetchBodies Whether to retrieve the Page bodies.
    @param blogId ID of the blog to fetch pages from.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?fetchBodies:bool ->
    blogId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.PageList.t * GapiConversation.Session.t
  
  
end

module PostsResource :
sig
  
  (** Get a post by id.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param blogId ID of the blog to fetch the post from.
    @param postId The ID of the post
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    blogId:string ->
    postId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.Post.t * GapiConversation.Session.t
  
  (** Retrieves a list of posts, possibly filtered.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param std_params Optional standard parameters.
    @param fetchBodies Whether the body content of posts is included.
    @param maxResults Maximum number of posts to fetch.
    @param pageToken Continuation token if the request is paged.
    @param startDate Earliest post date to fetch, a date-time with RFC 3339 formatting.
    @param blogId ID of the blog to fetch posts from.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?fetchBodies:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?startDate:GapiDate.t ->
    blogId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.PostList.t * GapiConversation.Session.t
  
  
end

module UsersResource :
sig
  module Blogs :
  sig
    
    (** Retrieves a list of blogs, possibly filtered.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
      @param std_params Optional standard parameters.
      @param userId ID of the user whose blogs are to be fetched. Either the word 'self' (sans quote marks) or the user's profile identifier.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiBloggerV2Model.BlogList.t * GapiConversation.Session.t
    
    
  end
  
  
  (** Gets one user by id.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/blogger/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param userId The ID of the user to get.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    userId:string ->
    GapiConversation.Session.t ->
    GapiBloggerV2Model.User.t * GapiConversation.Session.t
  
  
end


