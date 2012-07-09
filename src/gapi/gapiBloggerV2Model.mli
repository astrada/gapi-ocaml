(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Blogger API (v2).
  
  For more information about this data model, see the
  {{:https://developers.google.com/blogger/docs/2.0/json/getting_started}API Documentation}.
  *)

module Blog :
sig
  module Posts :
  sig
    type t = {
      selfLink : string;
      (** The URL of the container for posts in this blog. *)
      totalItems : int;
      (** The count of posts in this blog. *)
      
    }
    
    val selfLink : (t, string) GapiLens.t
    val totalItems : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Pages :
  sig
    type t = {
      selfLink : string;
      (** The URL of the container for pages in this blog. *)
      totalItems : int;
      (** The count of pages in this blog. *)
      
    }
    
    val selfLink : (t, string) GapiLens.t
    val totalItems : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Locale :
  sig
    type t = {
      country : string;
      (** The country this blog's locale is set to. *)
      language : string;
      (** The language this blog is authored in. *)
      variant : string;
      (** The language variant this blog is authored in. *)
      
    }
    
    val country : (t, string) GapiLens.t
    val language : (t, string) GapiLens.t
    val variant : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    description : string;
    (** The description of this blog. This is displayed underneath the title. *)
    id : int64;
    (** The identifier for this resource. *)
    kind : string;
    (** The kind of this entry. Always blogger#blog *)
    locale : Locale.t;
    (** The locale this Blog is set to. *)
    name : string;
    (** The name of this blog. This is displayed as the title. *)
    pages : Pages.t;
    (** The container of pages in this blog. *)
    posts : Posts.t;
    (** The container of posts in this blog. *)
    published : GapiDate.t;
    (** RFC 3339 date-time when this blog was published. *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    updated : GapiDate.t;
    (** RFC 3339 date-time when this blog was last updated. *)
    url : string;
    (** The URL where this blog is published. *)
    
  }
  
  val description : (t, string) GapiLens.t
  val id : (t, int64) GapiLens.t
  val kind : (t, string) GapiLens.t
  val locale : (t, Locale.t) GapiLens.t
  val name : (t, string) GapiLens.t
  val pages : (t, Pages.t) GapiLens.t
  val posts : (t, Posts.t) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val url : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BlogList :
sig
  type t = {
    items : Blog.t list;
    (** The list of Blogs this user has Authorship or Admin rights over. *)
    kind : string;
    (** The kind of this entity. Always blogger#blogList *)
    
  }
  
  val items : (t, Blog.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Post :
sig
  module Replies :
  sig
    type t = {
      selfLink : string;
      (** The URL of the comments on this post. *)
      totalItems : int64;
      (** The count of comments on this post. *)
      
    }
    
    val selfLink : (t, string) GapiLens.t
    val totalItems : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Blog :
  sig
    type t = {
      id : int64;
      (** The identifier of the Blog that contains this Post. *)
      
    }
    
    val id : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Author :
  sig
    module Image :
    sig
      type t = {
        url : string;
        (** The Post author's avatar URL. *)
        
      }
      
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      displayName : string;
      (** The display name. *)
      id : string;
      (** The identifier of the Post creator. *)
      image : Image.t;
      (** The Post author's avatar. *)
      url : string;
      (** The URL of the Post creator's Profile page. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, Image.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    author : Author.t;
    (** The author of this Post. *)
    blog : Blog.t;
    (** Data about the blog containing this Post. *)
    content : string;
    (** The content of the Post. May contain HTML markup. *)
    id : int64;
    (** The identifier of this Post. *)
    kind : string;
    (** The kind of this entity. Always blogger#post *)
    labels : string list;
    (** The list of labels this Post was tagged with. *)
    published : GapiDate.t;
    (** RFC 3339 date-time when this Post was published. *)
    replies : Replies.t;
    (** The container of comments on this Post. *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    title : string;
    (** The title of the Post. *)
    updated : GapiDate.t;
    (** RFC 3339 date-time when this Post was last updated. *)
    url : string;
    (** The URL where this Post is displayed. *)
    
  }
  
  val author : (t, Author.t) GapiLens.t
  val blog : (t, Blog.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val id : (t, int64) GapiLens.t
  val kind : (t, string) GapiLens.t
  val labels : (t, string list) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val replies : (t, Replies.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val url : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Comment :
sig
  module Post :
  sig
    type t = {
      id : int64;
      (** The identifier of the post containing this comment. *)
      
    }
    
    val id : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module InReplyTo :
  sig
    type t = {
      id : int64;
      (** The identified of the parent of this comment. *)
      
    }
    
    val id : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Blog :
  sig
    type t = {
      id : int64;
      (** The identifier of the blog containing this comment. *)
      
    }
    
    val id : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Author :
  sig
    module Image :
    sig
      type t = {
        url : string;
        (** The comment creator's avatar URL. *)
        
      }
      
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      displayName : string;
      (** The display name. *)
      id : string;
      (** The identifier of the Comment creator. *)
      image : Image.t;
      (** The comment creator's avatar. *)
      url : string;
      (** The URL of the Comment creator's Profile page. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, Image.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    author : Author.t;
    (** The author of this Comment. *)
    blog : Blog.t;
    (** Data about the blog containing this comment. *)
    content : string;
    (** The actual content of the comment. May include HTML markup. *)
    id : int64;
    (** The identifier for this resource. *)
    inReplyTo : InReplyTo.t;
    (** Data about the comment this is in reply to. *)
    kind : string;
    (** The kind of this entry. Always blogger#comment *)
    post : Post.t;
    (** Data about the post containing this comment. *)
    published : GapiDate.t;
    (** RFC 3339 date-time when this comment was published. *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    updated : GapiDate.t;
    (** RFC 3339 date-time when this comment was last updated. *)
    
  }
  
  val author : (t, Author.t) GapiLens.t
  val blog : (t, Blog.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val id : (t, int64) GapiLens.t
  val inReplyTo : (t, InReplyTo.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val post : (t, Post.t) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentList :
sig
  type t = {
    items : Comment.t list;
    (** The List of Comments for a Post. *)
    kind : string;
    (** The kind of this entry. Always blogger#commentList *)
    nextPageToken : string;
    (** Pagination token to fetch the next page, if one exists. *)
    prevPageToken : string;
    (** Pagination token to fetch the previous page, if one exists. *)
    
  }
  
  val items : (t, Comment.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val prevPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PostList :
sig
  type t = {
    items : Post.t list;
    (** The list of Posts for this Blog. *)
    kind : string;
    (** The kind of this entity. Always blogger#postList *)
    nextPageToken : string;
    (** Pagination token to fetch the next page, if one exists. *)
    prevPageToken : string;
    (** Pagination token to fetch the previous page, if one exists. *)
    
  }
  
  val items : (t, Post.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val prevPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Page :
sig
  module Blog :
  sig
    type t = {
      id : int64;
      (** The identifier of the blog containing this page. *)
      
    }
    
    val id : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Author :
  sig
    module Image :
    sig
      type t = {
        url : string;
        (** The page author's avatar URL. *)
        
      }
      
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      displayName : string;
      (** The display name. *)
      id : string;
      (** The identifier of the Page creator. *)
      image : Image.t;
      (** The page author's avatar. *)
      url : string;
      (** The URL of the Page creator's Profile page. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, Image.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    author : Author.t;
    (** The author of this Page. *)
    blog : Blog.t;
    (** Data about the blog containing this Page. *)
    content : string;
    (** The body content of this Page, in HTML. *)
    id : int64;
    (** The identifier for this resource. *)
    kind : string;
    (** The kind of this entity. Always blogger#page *)
    published : GapiDate.t;
    (** RFC 3339 date-time when this Page was published. *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    title : string;
    (** The title of this entity. This is the name displayed in the Admin user interface. *)
    updated : GapiDate.t;
    (** RFC 3339 date-time when this Page was last updated. *)
    url : string;
    (** The URL that this Page is displayed at. *)
    
  }
  
  val author : (t, Author.t) GapiLens.t
  val blog : (t, Blog.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val id : (t, int64) GapiLens.t
  val kind : (t, string) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val url : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PageList :
sig
  type t = {
    items : Page.t list;
    (** The list of Pages for a Blog. *)
    kind : string;
    (** The kind of this entity. Always blogger#pageList *)
    
  }
  
  val items : (t, Page.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module User :
sig
  module Locale :
  sig
    type t = {
      country : string;
      (** The user's country setting. *)
      language : string;
      (** The user's language setting. *)
      variant : string;
      (** The user's language variant setting. *)
      
    }
    
    val country : (t, string) GapiLens.t
    val language : (t, string) GapiLens.t
    val variant : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Blogs :
  sig
    type t = {
      selfLink : string;
      (** The URL of the Blogs for this user. *)
      
    }
    
    val selfLink : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    about : string;
    (** Profile summary information. *)
    blogs : Blogs.t;
    (** The container of blogs for this user. *)
    created : GapiDate.t;
    (** The timestamp of when this profile was created, in seconds since epoch. *)
    displayName : string;
    (** The display name. *)
    id : string;
    (** The identifier for this User. *)
    kind : string;
    (** The kind of this entity. Always blogger#user *)
    locale : Locale.t;
    (** This user's locale *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    url : string;
    (** The user's profile page. *)
    
  }
  
  val about : (t, string) GapiLens.t
  val blogs : (t, Blogs.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val locale : (t, Locale.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

