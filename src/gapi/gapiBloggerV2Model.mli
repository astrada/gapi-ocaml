(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Blogger API (v2).
  
  For more information about this data model, see the
  {{:https://code.google.com/apis/blogger/docs/2.0/json/getting_started.html}API Documentation}.
  *)

module Blog :
sig
  module PostsData :
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
  
  module PagesData :
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
  
  module LocaleData :
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
    id : string;
    (** The identifier for this resource. *)
    kind : string;
    (** The kind of this entry. Always blogger#blog *)
    locale : LocaleData.t;
    (** The locale this Blog is set to. *)
    name : string;
    (** The name of this blog. This is displayed as the title. *)
    pages : PagesData.t;
    (** The container of pages in this blog. *)
    posts : PostsData.t;
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
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val locale : (t, LocaleData.t) GapiLens.t
  val name : (t, string) GapiLens.t
  val pages : (t, PagesData.t) GapiLens.t
  val posts : (t, PostsData.t) GapiLens.t
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
  module RepliesData :
  sig
    type t = {
      selfLink : string;
      (** The URL of the comments on this post. *)
      totalItems : string;
      (** The count of comments on this post. *)
      
    }
    
    val selfLink : (t, string) GapiLens.t
    val totalItems : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BlogData :
  sig
    type t = {
      id : string;
      (** The identifier of the Blog that contains this Post. *)
      
    }
    
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module AuthorData :
  sig
    module ImageData :
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
      image : ImageData.t;
      (** The Post author's avatar. *)
      url : string;
      (** The URL of the Post creator's Profile page. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, ImageData.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    author : AuthorData.t;
    (** The author of this Post. *)
    blog : BlogData.t;
    (** Data about the blog containing this Post. *)
    content : string;
    (** The content of the Post. May contain HTML markup. *)
    id : string;
    (** The identifier of this Post. *)
    kind : string;
    (** The kind of this entity. Always blogger#post *)
    labels : string list;
    (** The list of labels this Post was tagged with. *)
    published : GapiDate.t;
    (** RFC 3339 date-time when this Post was published. *)
    replies : RepliesData.t;
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
  
  val author : (t, AuthorData.t) GapiLens.t
  val blog : (t, BlogData.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val labels : (t, string list) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val replies : (t, RepliesData.t) GapiLens.t
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
  module PostData :
  sig
    type t = {
      id : string;
      (** The identifier of the post containing this comment. *)
      
    }
    
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module InReplyToData :
  sig
    type t = {
      id : string;
      (** The identified of the parent of this comment. *)
      
    }
    
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BlogData :
  sig
    type t = {
      id : string;
      (** The identifier of the blog containing this comment. *)
      
    }
    
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module AuthorData :
  sig
    module ImageData :
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
      image : ImageData.t;
      (** The comment creator's avatar. *)
      url : string;
      (** The URL of the Comment creator's Profile page. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, ImageData.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    author : AuthorData.t;
    (** The author of this Comment. *)
    blog : BlogData.t;
    (** Data about the blog containing this comment. *)
    content : string;
    (** The actual content of the comment. May include HTML markup. *)
    id : string;
    (** The identifier for this resource. *)
    inReplyTo : InReplyToData.t;
    (** Data about the comment this is in reply to. *)
    kind : string;
    (** The kind of this entry. Always blogger#comment *)
    post : PostData.t;
    (** Data about the post containing this comment. *)
    published : GapiDate.t;
    (** RFC 3339 date-time when this comment was published. *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    updated : GapiDate.t;
    (** RFC 3339 date-time when this comment was last updated. *)
    
  }
  
  val author : (t, AuthorData.t) GapiLens.t
  val blog : (t, BlogData.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val inReplyTo : (t, InReplyToData.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val post : (t, PostData.t) GapiLens.t
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
  module BlogData :
  sig
    type t = {
      id : string;
      (** The identifier of the blog containing this page. *)
      
    }
    
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module AuthorData :
  sig
    module ImageData :
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
      image : ImageData.t;
      (** The page author's avatar. *)
      url : string;
      (** The URL of the Page creator's Profile page. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, ImageData.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    author : AuthorData.t;
    (** The author of this Page. *)
    blog : BlogData.t;
    (** Data about the blog containing this Page. *)
    content : string;
    (** The body content of this Page, in HTML. *)
    id : string;
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
  
  val author : (t, AuthorData.t) GapiLens.t
  val blog : (t, BlogData.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
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
  module LocaleData :
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
  
  module BlogsData :
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
    blogs : BlogsData.t;
    (** The container of blogs for this user. *)
    created : GapiDate.t;
    (** The timestamp of when this profile was created, in seconds since epoch. *)
    displayName : string;
    (** The display name. *)
    id : string;
    (** The identifier for this User. *)
    kind : string;
    (** The kind of this entity. Always blogger#user *)
    locale : LocaleData.t;
    (** This user's locale *)
    selfLink : string;
    (** The API REST URL to fetch this resource from. *)
    url : string;
    (** The user's profile page. *)
    
  }
  
  val about : (t, string) GapiLens.t
  val blogs : (t, BlogsData.t) GapiLens.t
  val created : (t, GapiDate.t) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val locale : (t, LocaleData.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

