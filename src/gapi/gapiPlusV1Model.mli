(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Google+ API (v1).
  
  For more information about this data model, see the
  {{:https://developers.google.com/+/api/}API Documentation}.
  *)

module PlusAclentryResource :
sig
  type t = {
    displayName : string;
    (** A descriptive name for this entry. Suitable for display. *)
    id : string;
    (** The ID of the entry. For entries of type "person" or "circle", this is the ID of the resource. For other types, this property is not set. *)
    _type : string;
    (** The type of entry describing to whom access is granted. Possible values are:  
- "person" - Access to an individual. 
- "circle" - Access to members of a circle. 
- "myCircles" - Access to members of all the person's circles. 
- "extendedCircles" - Access to members of everyone in a person's circles, plus all of the people in their circles. 
- "public" - Access to anyone on the web. *)
    
  }
  
  val displayName : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ItemScope :
sig
  type t = {
    about : t option;
    (** The subject matter of the content. *)
    additionalName : string list;
    (** An additional name for a Person, can be used for a middle name. *)
    address : t option;
    (** Postal address. *)
    addressCountry : string;
    (** Address country. *)
    addressLocality : string;
    (** Address locality. *)
    addressRegion : string;
    (** Address region. *)
    associated_media : t list;
    (** The encoding. *)
    attendeeCount : int;
    (** Number of attendees. *)
    attendees : t list;
    (** A person attending the event. *)
    audio : t option;
    (** From http://schema.org/MusicRecording, the audio file. *)
    author : t list;
    (** The person or persons who created this result. In the example of restaurant reviews, this might be the reviewer's name. *)
    bestRating : string;
    (** Best possible rating value that a result might obtain. This property defines the upper bound for the ratingValue. For example, you might have a 5 star rating scale, you would provide 5 as the value for this property. *)
    birthDate : string;
    (** Date of birth. *)
    byArtist : t option;
    (** From http://schema.org/MusicRecording, the artist that performed this recording. *)
    caption : string;
    (** The caption for this object. *)
    contentSize : string;
    (** File size in (mega/kilo) bytes. *)
    contentUrl : string;
    (** Actual bytes of the media object, for example the image file or video file. *)
    contributor : t list;
    (** A list of contributors to this result. *)
    dateCreated : string;
    (** The date the result was created such as the date that a review was first created. *)
    dateModified : string;
    (** The date the result was last modified such as the date that a review was last edited. *)
    datePublished : string;
    (** The initial date that the result was published. For example, a user writes a comment on a blog, which has a result.dateCreated of when they submit it. If the blog users comment moderation, the result.datePublished value would match the date when the owner approved the message. *)
    description : string;
    (** The string that describes the content of the result. *)
    duration : string;
    (** The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format. *)
    embedUrl : string;
    (** A URL pointing to a player for a specific video. In general, this is the information in the src element of an embed tag and should not be the same as the content of the loc tag. *)
    endDate : string;
    (** The end date and time of the event (in ISO 8601 date format). *)
    familyName : string;
    (** Family name. This property can be used with givenName instead of the name property. *)
    gender : string;
    (** Gender of the person. *)
    geo : t option;
    (** Geo coordinates. *)
    givenName : string;
    (** Given name. This property can be used with familyName instead of the name property. *)
    height : string;
    (** The height of the media object. *)
    id : string;
    (** An identifier for the target. Your app can choose how to identify targets. The target.id is required if you are writing an activity that does not have a corresponding web page or target.url property. *)
    image : string;
    (** A URL to the image that represents this result. For example, if a user writes a review of a restaurant and attaches a photo of their meal, you might use that photo as the result.image. *)
    inAlbum : t option;
    (** From http://schema.org/MusicRecording, which album a song is in. *)
    kind : string;
    (** Identifies this resource as an itemScope. *)
    latitude : float;
    (** Latitude. *)
    location : t option;
    (** The location of the event or organization. *)
    longitude : float;
    (** Longitude. *)
    name : string;
    (** The name of the result. In the example of a restaurant review, this might be the summary the user gave their review such as "Great ambiance, but overpriced." *)
    partOfTVSeries : t option;
    (** Property of http://schema.org/TVEpisode indicating which series the episode belongs to. *)
    performers : t list;
    (** The main performer or performers of the event-for example, a presenter, musician, or actor. *)
    playerType : string;
    (** Player type that is required. For example: Flash or Silverlight. *)
    postOfficeBoxNumber : string;
    (** Post office box number. *)
    postalCode : string;
    (** Postal code. *)
    ratingValue : string;
    (** Rating value. *)
    reviewRating : t option;
    (** Review rating. *)
    startDate : string;
    (** The start date and time of the event (in ISO 8601 date format). *)
    streetAddress : string;
    (** Street address. *)
    text : string;
    (** The text that is the result of the app activity. For example, if a user leaves a review of a restaurant, this might be the text of the review. *)
    thumbnail : t option;
    (** Thumbnail image for an image or video. *)
    thumbnailUrl : string;
    (** A URL to a thumbnail image that represents this result. *)
    tickerSymbol : string;
    (** The exchange traded instrument associated with a Corporation object. The tickerSymbol is expressed as an exchange and an instrument name separated by a space character. For the exchange component of the tickerSymbol attribute, we reccommend using the controlled vocaulary of Market Identifier Codes (MIC) specified in ISO15022. *)
    _type : string;
    (** The schema.org URL that best describes the referenced target and matches the type of moment. *)
    url : string;
    (** The URL that points to the result object. For example, a permalink directly to a restaurant reviewer's comment. *)
    width : string;
    (** The width of the media object. *)
    worstRating : string;
    (** Worst possible rating value that a result might obtain. This property defines the lower bound for the ratingValue. *)
    
  }
  
  val about : (t, t option) GapiLens.t
  val additionalName : (t, string list) GapiLens.t
  val address : (t, t option) GapiLens.t
  val addressCountry : (t, string) GapiLens.t
  val addressLocality : (t, string) GapiLens.t
  val addressRegion : (t, string) GapiLens.t
  val associated_media : (t, t list) GapiLens.t
  val attendeeCount : (t, int) GapiLens.t
  val attendees : (t, t list) GapiLens.t
  val audio : (t, t option) GapiLens.t
  val author : (t, t list) GapiLens.t
  val bestRating : (t, string) GapiLens.t
  val birthDate : (t, string) GapiLens.t
  val byArtist : (t, t option) GapiLens.t
  val caption : (t, string) GapiLens.t
  val contentSize : (t, string) GapiLens.t
  val contentUrl : (t, string) GapiLens.t
  val contributor : (t, t list) GapiLens.t
  val dateCreated : (t, string) GapiLens.t
  val dateModified : (t, string) GapiLens.t
  val datePublished : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val duration : (t, string) GapiLens.t
  val embedUrl : (t, string) GapiLens.t
  val endDate : (t, string) GapiLens.t
  val familyName : (t, string) GapiLens.t
  val gender : (t, string) GapiLens.t
  val geo : (t, t option) GapiLens.t
  val givenName : (t, string) GapiLens.t
  val height : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val image : (t, string) GapiLens.t
  val inAlbum : (t, t option) GapiLens.t
  val kind : (t, string) GapiLens.t
  val latitude : (t, float) GapiLens.t
  val location : (t, t option) GapiLens.t
  val longitude : (t, float) GapiLens.t
  val name : (t, string) GapiLens.t
  val partOfTVSeries : (t, t option) GapiLens.t
  val performers : (t, t list) GapiLens.t
  val playerType : (t, string) GapiLens.t
  val postOfficeBoxNumber : (t, string) GapiLens.t
  val postalCode : (t, string) GapiLens.t
  val ratingValue : (t, string) GapiLens.t
  val reviewRating : (t, t option) GapiLens.t
  val startDate : (t, string) GapiLens.t
  val streetAddress : (t, string) GapiLens.t
  val text : (t, string) GapiLens.t
  val thumbnail : (t, t option) GapiLens.t
  val thumbnailUrl : (t, string) GapiLens.t
  val tickerSymbol : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val width : (t, string) GapiLens.t
  val worstRating : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Moment :
sig
  type t = {
    id : string;
    (** The moment ID. *)
    kind : string;
    (** Identifies this resource as a moment. *)
    result : ItemScope.t;
    (** The object generated by performing the action on the target. For example, a user writes a review of a restaurant, the target is the restaurant and the result is the review. *)
    startDate : GapiDate.t;
    (** Time stamp of when the action occurred in RFC3339 format. *)
    target : ItemScope.t;
    (** The object on which the action was performed. *)
    _type : string;
    (** The Google schema for the type of moment to write. For example, http://schemas.google.com/AddActivity. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val result : (t, ItemScope.t) GapiLens.t
  val startDate : (t, GapiDate.t) GapiLens.t
  val target : (t, ItemScope.t) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MomentsFeed :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : Moment.t list;
    (** The moments in this page of results. *)
    kind : string;
    (** Identifies this resource as a collection of moments. Value: "plus#momentsFeed". *)
    nextLink : string;
    (** Link to the next page of moments. *)
    nextPageToken : string;
    (** The continuation token, which is used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    selfLink : string;
    (** Link to this page of moments. *)
    title : string;
    (** The title of this collection of moments. *)
    updated : GapiDate.t;
    (** The RFC 339 timestamp for when this collection of moments was last updated. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Moment.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Comment :
sig
  module Plusoners :
  sig
    type t = {
      totalItems : int;
      (** Total number of people who +1'd this comment. *)
      
    }
    
    val totalItems : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Object :
  sig
    type t = {
      content : string;
      (** The HTML-formatted content, suitable for display. *)
      objectType : string;
      (** The object type of this comment. Possible values are:  
- "comment" - A comment in reply to an activity. *)
      originalContent : string;
      (** The content (text) as provided by the author, stored without any HTML formatting. When creating or updating a comment, this value must be supplied as plain text in the request. *)
      
    }
    
    val content : (t, string) GapiLens.t
    val objectType : (t, string) GapiLens.t
    val originalContent : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module InReplyTo :
  sig
    type t = {
      id : string;
      (** The ID of the activity. *)
      url : string;
      (** The URL of the activity. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Actor :
  sig
    module Image :
    sig
      type t = {
        url : string;
        (** The URL of the actor's profile photo. To re-size the image and crop it to a square, append the query string ?sz=x, where x is the dimension in pixels of each side. *)
        
      }
      
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      displayName : string;
      (** The name of this actor, suitable for display. *)
      id : string;
      (** The ID of the actor. *)
      image : Image.t;
      (** The image representation of this actor. *)
      url : string;
      (** A link to the person resource for this actor. *)
      
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
    actor : Actor.t;
    (** The person who posted this comment. *)
    etag : string;
    (** ETag of this response for caching purposes. *)
    id : string;
    (** The ID of this comment. *)
    inReplyTo : InReplyTo.t list;
    (** The activity this comment replied to. *)
    kind : string;
    (** Identifies this resource as a comment. Value: "plus#comment". *)
    _object : Object.t;
    (** The object of this comment. *)
    plusoners : Plusoners.t;
    (** People who +1'd this comment. *)
    published : GapiDate.t;
    (** The time at which this comment was initially published. Formatted as an RFC 3339 timestamp. *)
    selfLink : string;
    (** Link to this comment resource. *)
    updated : GapiDate.t;
    (** The time at which this comment was last updated. Formatted as an RFC 3339 timestamp. *)
    verb : string;
    (** This comment's verb, indicating what action was performed. Possible values are:  
- "post" - Publish content to the stream. *)
    
  }
  
  val actor : (t, Actor.t) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val inReplyTo : (t, InReplyTo.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val _object : (t, Object.t) GapiLens.t
  val plusoners : (t, Plusoners.t) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val verb : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentFeed :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    id : string;
    (** The ID of this collection of comments. *)
    items : Comment.t list;
    (** The comments in this page of results. *)
    kind : string;
    (** Identifies this resource as a collection of comments. Value: "plus#commentFeed". *)
    nextLink : string;
    (** Link to the next page of activities. *)
    nextPageToken : string;
    (** The continuation token, which is used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    title : string;
    (** The title of this collection of comments. *)
    updated : GapiDate.t;
    (** The time at which this collection of comments was last updated. Formatted as an RFC 3339 timestamp. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val items : (t, Comment.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Acl :
sig
  type t = {
    description : string;
    (** Description of the access granted, suitable for display. *)
    items : PlusAclentryResource.t list;
    (** The list of access entries. *)
    kind : string;
    (** Identifies this resource as a collection of access controls. Value: "plus#acl". *)
    
  }
  
  val description : (t, string) GapiLens.t
  val items : (t, PlusAclentryResource.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Person :
sig
  module Urls :
  sig
    type t = {
      primary : bool;
      (** If "true", this URL is the person's primary URL. *)
      _type : string;
      (** The type of URL. Possible values are:  
- "home" - URL for home. 
- "work" - URL for work. 
- "blog" - URL for blog. 
- "profile" - URL for profile. 
- "other" - Other. *)
      value : string;
      (** The URL value. *)
      
    }
    
    val primary : (t, bool) GapiLens.t
    val _type : (t, string) GapiLens.t
    val value : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module PlacesLived :
  sig
    type t = {
      primary : bool;
      (** If "true", this place of residence is this person's primary residence. *)
      value : string;
      (** A place where this person has lived. For example: "Seattle, WA", "Near Toronto". *)
      
    }
    
    val primary : (t, bool) GapiLens.t
    val value : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Organizations :
  sig
    type t = {
      department : string;
      (** The department within the organization. Deprecated. *)
      description : string;
      (** A short description of the person's role in this organization. Deprecated. *)
      endDate : string;
      (** The date the person left this organization. *)
      location : string;
      (** The location of this organization. Deprecated. *)
      name : string;
      (** The name of the organization. *)
      primary : bool;
      (** If "true", indicates this organization is the person's primary one (typically interpreted as current one). *)
      startDate : string;
      (** The date the person joined this organization. *)
      title : string;
      (** The person's job title or role within the organization. *)
      _type : string;
      (** The type of organization. Possible values are:  
- "work" - Work. 
- "school" - School. *)
      
    }
    
    val department : (t, string) GapiLens.t
    val description : (t, string) GapiLens.t
    val endDate : (t, string) GapiLens.t
    val location : (t, string) GapiLens.t
    val name : (t, string) GapiLens.t
    val primary : (t, bool) GapiLens.t
    val startDate : (t, string) GapiLens.t
    val title : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Name :
  sig
    type t = {
      familyName : string;
      (** The family name (last name) of this person. *)
      formatted : string;
      (** The full name of this person, including middle names, suffixes, etc. *)
      givenName : string;
      (** The given name (first name) of this person. *)
      honorificPrefix : string;
      (** The honorific prefixes (such as "Dr." or "Mrs.") for this person. *)
      honorificSuffix : string;
      (** The honorific suffixes (such as "Jr.") for this person. *)
      middleName : string;
      (** The middle name of this person. *)
      
    }
    
    val familyName : (t, string) GapiLens.t
    val formatted : (t, string) GapiLens.t
    val givenName : (t, string) GapiLens.t
    val honorificPrefix : (t, string) GapiLens.t
    val honorificSuffix : (t, string) GapiLens.t
    val middleName : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Image :
  sig
    type t = {
      url : string;
      (** The URL of the person's profile photo. To re-size the image and crop it to a square, append the query string ?sz=x, where x is the dimension in pixels of each side. *)
      
    }
    
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Emails :
  sig
    type t = {
      primary : bool;
      (** If "true", indicates this email address is the person's primary one. *)
      _type : string;
      (** The type of address. Possible values are:  
- "home" - Home email address. 
- "work" - Work email address. 
- "other" - Other. *)
      value : string;
      (** The email address. *)
      
    }
    
    val primary : (t, bool) GapiLens.t
    val _type : (t, string) GapiLens.t
    val value : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Cover :
  sig
    module CoverPhoto :
    sig
      type t = {
        height : int;
        (** The height to the image. *)
        url : string;
        (** The url to the image. *)
        width : int;
        (** The width to the image. *)
        
      }
      
      val height : (t, int) GapiLens.t
      val url : (t, string) GapiLens.t
      val width : (t, int) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module CoverInfo :
    sig
      type t = {
        leftImageOffset : int;
        (** The difference between the left position of the image cover and the actual displayed cover image. Only valid for BANNER layout. *)
        topImageOffset : int;
        (** The difference between the top position of the image cover and the actual displayed cover image. Only valid for BANNER layout. *)
        
      }
      
      val leftImageOffset : (t, int) GapiLens.t
      val topImageOffset : (t, int) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      coverInfo : CoverInfo.t;
      (** Extra information about the cover photo. *)
      coverPhoto : CoverPhoto.t;
      (** The person's primary cover image. *)
      layout : string;
      (** The layout of the cover art. Possible values are:  
- "banner" - One large image banner. *)
      
    }
    
    val coverInfo : (t, CoverInfo.t) GapiLens.t
    val coverPhoto : (t, CoverPhoto.t) GapiLens.t
    val layout : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module AgeRange :
  sig
    type t = {
      max : int;
      (** The age range's upper bound, if any. *)
      min : int;
      (** The age range's lower bound, if any. *)
      
    }
    
    val max : (t, int) GapiLens.t
    val min : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    aboutMe : string;
    (** A short biography for this person. *)
    ageRange : AgeRange.t;
    (** The age range of the person. *)
    birthday : string;
    (** The person's date of birth, represented as YYYY-MM-DD. *)
    braggingRights : string;
    (** The "bragging rights" line of this person. *)
    circledByCount : int;
    (** If a Google+ Page and for followers who are visible, the number of people who have added this page to a circle. *)
    cover : Cover.t;
    (** The cover photo content. *)
    currentLocation : string;
    (** The current location for this person. *)
    displayName : string;
    (** The name of this person, suitable for display. *)
    emails : Emails.t list;
    (** A list of email addresses that this person has set to public on their Google+ profile. You can also use the userinfo.email scope to retrieve an authenticated user's email address. *)
    etag : string;
    (** ETag of this response for caching purposes. *)
    gender : string;
    (** The person's gender. Possible values are:  
- "male" - Male gender. 
- "female" - Female gender. 
- "other" - Other. *)
    hasApp : bool;
    (** If "true", indicates that the person has installed the app that is making the request and has chosen to expose this install state to the caller. A value of "false" indicates that the install state cannot be determined (it is either not installed or the person has chosen to keep this information private). *)
    id : string;
    (** The ID of this person. *)
    image : Image.t;
    (** The representation of the person's profile photo. *)
    isPlusUser : bool;
    (** Whether this user has signed up for Google+. *)
    kind : string;
    (** Identifies this resource as a person. Value: "plus#person". *)
    language : string;
    (** The user's preferred language for rendering. *)
    name : Name.t;
    (** An object representation of the individual components of a person's name. *)
    nickname : string;
    (** The nickname of this person. *)
    objectType : string;
    (** Type of person within Google+. Possible values are:  
- "person" - represents an actual person. 
- "page" - represents a page. *)
    organizations : Organizations.t list;
    (** A list of current or past organizations with which this person is associated. *)
    placesLived : PlacesLived.t list;
    (** A list of places where this person has lived. *)
    plusOneCount : int;
    (** If a Google+ Page, the number of people who have +1'ed this page. *)
    relationshipStatus : string;
    (** The person's relationship status. Possible values are:  
- "single" - Person is single. 
- "in_a_relationship" - Person is in a relationship. 
- "engaged" - Person is engaged. 
- "married" - Person is married. 
- "its_complicated" - The relationship is complicated. 
- "open_relationship" - Person is in an open relationship. 
- "widowed" - Person is widowed. 
- "in_domestic_partnership" - Person is in a domestic partnership. 
- "in_civil_union" - Person is in a civil union. *)
    tagline : string;
    (** The brief description (tagline) of this person. *)
    url : string;
    (** The URL of this person's profile. *)
    urls : Urls.t list;
    (** A list of URLs for this person. *)
    verified : bool;
    (** Whether the person or Google+ Page has been verified. *)
    
  }
  
  val aboutMe : (t, string) GapiLens.t
  val ageRange : (t, AgeRange.t) GapiLens.t
  val birthday : (t, string) GapiLens.t
  val braggingRights : (t, string) GapiLens.t
  val circledByCount : (t, int) GapiLens.t
  val cover : (t, Cover.t) GapiLens.t
  val currentLocation : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val emails : (t, Emails.t list) GapiLens.t
  val etag : (t, string) GapiLens.t
  val gender : (t, string) GapiLens.t
  val hasApp : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val image : (t, Image.t) GapiLens.t
  val isPlusUser : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val language : (t, string) GapiLens.t
  val name : (t, Name.t) GapiLens.t
  val nickname : (t, string) GapiLens.t
  val objectType : (t, string) GapiLens.t
  val organizations : (t, Organizations.t list) GapiLens.t
  val placesLived : (t, PlacesLived.t list) GapiLens.t
  val plusOneCount : (t, int) GapiLens.t
  val relationshipStatus : (t, string) GapiLens.t
  val tagline : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val urls : (t, Urls.t list) GapiLens.t
  val verified : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Activity :
sig
  module Provider :
  sig
    type t = {
      title : string;
      (** Name of the service provider. *)
      
    }
    
    val title : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Object :
  sig
    module Resharers :
    sig
      type t = {
        selfLink : string;
        (** The URL for the collection of resharers. *)
        totalItems : int;
        (** Total number of people who reshared this activity. *)
        
      }
      
      val selfLink : (t, string) GapiLens.t
      val totalItems : (t, int) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module Replies :
    sig
      type t = {
        selfLink : string;
        (** The URL for the collection of comments in reply to this activity. *)
        totalItems : int;
        (** Total number of comments on this activity. *)
        
      }
      
      val selfLink : (t, string) GapiLens.t
      val totalItems : (t, int) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module Plusoners :
    sig
      type t = {
        selfLink : string;
        (** The URL for the collection of people who +1'd this activity. *)
        totalItems : int;
        (** Total number of people who +1'd this activity. *)
        
      }
      
      val selfLink : (t, string) GapiLens.t
      val totalItems : (t, int) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module Attachments :
    sig
      module Thumbnails :
      sig
        module Image :
        sig
          type t = {
            height : int;
            (** The height, in pixels, of the linked resource. *)
            _type : string;
            (** Media type of the link. *)
            url : string;
            (** Image url. *)
            width : int;
            (** The width, in pixels, of the linked resource. *)
            
          }
          
          val height : (t, int) GapiLens.t
          val _type : (t, string) GapiLens.t
          val url : (t, string) GapiLens.t
          val width : (t, int) GapiLens.t
          
          val empty : t
          
          val render : t -> GapiJson.json_data_model list
          
          val parse : t -> GapiJson.json_data_model -> t
          
        end
        
        type t = {
          description : string;
          (** Potential name of the thumbnail. *)
          image : Image.t;
          (** Image resource. *)
          url : string;
          (** URL to the webpage containing the image. *)
          
        }
        
        val description : (t, string) GapiLens.t
        val image : (t, Image.t) GapiLens.t
        val url : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      module Image :
      sig
        type t = {
          height : int;
          (** The height, in pixels, of the linked resource. *)
          _type : string;
          (** Media type of the link. *)
          url : string;
          (** Image url. *)
          width : int;
          (** The width, in pixels, of the linked resource. *)
          
        }
        
        val height : (t, int) GapiLens.t
        val _type : (t, string) GapiLens.t
        val url : (t, string) GapiLens.t
        val width : (t, int) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      module FullImage :
      sig
        type t = {
          height : int;
          (** The height, in pixels, of the linked resource. *)
          _type : string;
          (** Media type of the link. *)
          url : string;
          (** URL to the image. *)
          width : int;
          (** The width, in pixels, of the linked resource. *)
          
        }
        
        val height : (t, int) GapiLens.t
        val _type : (t, string) GapiLens.t
        val url : (t, string) GapiLens.t
        val width : (t, int) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      module Embed :
      sig
        type t = {
          _type : string;
          (** Media type of the link. *)
          url : string;
          (** URL of the link. *)
          
        }
        
        val _type : (t, string) GapiLens.t
        val url : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      type t = {
        content : string;
        (** If the attachment is an article, this property contains a snippet of text from the article. It can also include descriptions for other types. *)
        displayName : string;
        (** The title of the attachment (such as a photo caption or an article title). *)
        embed : Embed.t;
        (** If the attachment is a video, the embeddable link. *)
        fullImage : FullImage.t;
        (** The full image URL for photo attachments. *)
        id : string;
        (** The ID of the attachment. *)
        image : Image.t;
        (** The preview image for photos or videos. *)
        objectType : string;
        (** The type of media object. Possible values are:  
- "photo" - A photo. 
- "album" - A photo album. 
- "video" - A video. 
- "article" - An article, specified by a link. *)
        thumbnails : Thumbnails.t list;
        (** If the attachment is an album, potential additional thumbnails from the album. *)
        url : string;
        (** The link to the attachment, should be of type text/html. *)
        
      }
      
      val content : (t, string) GapiLens.t
      val displayName : (t, string) GapiLens.t
      val embed : (t, Embed.t) GapiLens.t
      val fullImage : (t, FullImage.t) GapiLens.t
      val id : (t, string) GapiLens.t
      val image : (t, Image.t) GapiLens.t
      val objectType : (t, string) GapiLens.t
      val thumbnails : (t, Thumbnails.t list) GapiLens.t
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module Actor :
    sig
      module Image :
      sig
        type t = {
          url : string;
          (** A URL that points to a thumbnail photo of the original actor. *)
          
        }
        
        val url : (t, string) GapiLens.t
        
        val empty : t
        
        val render : t -> GapiJson.json_data_model list
        
        val parse : t -> GapiJson.json_data_model -> t
        
      end
      
      type t = {
        displayName : string;
        (** The original actor's name, suitable for display. *)
        id : string;
        (** ID of the original actor. *)
        image : Image.t;
        (** The image representation of the original actor. *)
        url : string;
        (** A link to the original actor's Google profile. *)
        
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
      actor : Actor.t;
      (** If this activity's object is itself another activity (for example, when a person reshares an activity), this property specifies the original activity's actor. *)
      attachments : Attachments.t list;
      (** The media objects attached to this activity. *)
      content : string;
      (** The HTML-formatted content, suitable for display. *)
      id : string;
      (** The ID of the object. When resharing an activity, this is the ID of the activity being reshared. *)
      objectType : string;
      (** The type of the object. Possible values are:  
- "note" - Textual content. 
- "activity" - A Google+ activity. *)
      originalContent : string;
      (** The content (text) as provided by the author, stored without any HTML formatting. When creating or updating an activity, this value must be supplied as plain text in the request. *)
      plusoners : Plusoners.t;
      (** People who +1'd this activity. *)
      replies : Replies.t;
      (** Comments in reply to this activity. *)
      resharers : Resharers.t;
      (** People who reshared this activity. *)
      url : string;
      (** The URL that points to the linked resource. *)
      
    }
    
    val actor : (t, Actor.t) GapiLens.t
    val attachments : (t, Attachments.t list) GapiLens.t
    val content : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val objectType : (t, string) GapiLens.t
    val originalContent : (t, string) GapiLens.t
    val plusoners : (t, Plusoners.t) GapiLens.t
    val replies : (t, Replies.t) GapiLens.t
    val resharers : (t, Resharers.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Actor :
  sig
    module Name :
    sig
      type t = {
        familyName : string;
        (** The family name (last name) of the actor. *)
        givenName : string;
        (** The given name (first name) of the actor. *)
        
      }
      
      val familyName : (t, string) GapiLens.t
      val givenName : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    module Image :
    sig
      type t = {
        url : string;
        (** The URL of the actor's profile photo. To re-size the image and crop it to a square, append the query string ?sz=x, where x is the dimension in pixels of each side. *)
        
      }
      
      val url : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      displayName : string;
      (** The name of the actor, suitable for display. *)
      id : string;
      (** The ID of the actor's person resource. *)
      image : Image.t;
      (** The image representation of the actor. *)
      name : Name.t;
      (** An object representation of the individual components of name. *)
      url : string;
      (** The link to the actor's Google profile. *)
      
    }
    
    val displayName : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    val image : (t, Image.t) GapiLens.t
    val name : (t, Name.t) GapiLens.t
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    access : Acl.t;
    (** Identifies who has access to see this activity. *)
    actor : Actor.t;
    (** The person who performed this activity. *)
    address : string;
    (** Street address where this activity occurred. *)
    annotation : string;
    (** Additional content added by the person who shared this activity, applicable only when resharing an activity. *)
    crosspostSource : string;
    (** If this activity is a crosspost from another system, this property specifies the ID of the original activity. *)
    etag : string;
    (** ETag of this response for caching purposes. *)
    geocode : string;
    (** Latitude and longitude where this activity occurred. Format is latitude followed by longitude, space separated. *)
    id : string;
    (** The ID of this activity. *)
    kind : string;
    (** Identifies this resource as an activity. Value: "plus#activity". *)
    _object : Object.t;
    (** The object of this activity. *)
    placeId : string;
    (** ID of the place where this activity occurred. *)
    placeName : string;
    (** Name of the place where this activity occurred. *)
    provider : Provider.t;
    (** The service provider that initially published this activity. *)
    published : GapiDate.t;
    (** The time at which this activity was initially published. Formatted as an RFC 3339 timestamp. *)
    radius : string;
    (** Radius, in meters, of the region where this activity occurred, centered at the latitude and longitude identified in geocode. *)
    title : string;
    (** Title of this activity. *)
    updated : GapiDate.t;
    (** The time at which this activity was last updated. Formatted as an RFC 3339 timestamp. *)
    url : string;
    (** The link to this activity. *)
    verb : string;
    (** This activity's verb, indicating what action was performed. Possible values are:  
- "post" - Publish content to the stream. 
- "share" - Reshare an activity. *)
    
  }
  
  val access : (t, Acl.t) GapiLens.t
  val actor : (t, Actor.t) GapiLens.t
  val address : (t, string) GapiLens.t
  val annotation : (t, string) GapiLens.t
  val crosspostSource : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val geocode : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val _object : (t, Object.t) GapiLens.t
  val placeId : (t, string) GapiLens.t
  val placeName : (t, string) GapiLens.t
  val provider : (t, Provider.t) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val radius : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val url : (t, string) GapiLens.t
  val verb : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ActivityFeed :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    id : string;
    (** The ID of this collection of activities. Deprecated. *)
    items : Activity.t list;
    (** The activities in this page of results. *)
    kind : string;
    (** Identifies this resource as a collection of activities. Value: "plus#activityFeed". *)
    nextLink : string;
    (** Link to the next page of activities. *)
    nextPageToken : string;
    (** The continuation token, which is used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    selfLink : string;
    (** Link to this activity resource. *)
    title : string;
    (** The title of this collection of activities. *)
    updated : GapiDate.t;
    (** The time at which this collection of activities was last updated. Formatted as an RFC 3339 timestamp. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val items : (t, Activity.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PeopleFeed :
sig
  type t = {
    etag : string;
    (** ETag of this response for caching purposes. *)
    items : Person.t list;
    (** The people in this page of results. Each item includes the id, displayName, image, and url for the person. To retrieve additional profile data, see the people.get method. *)
    kind : string;
    (** Identifies this resource as a collection of people. Value: "plus#peopleFeed". *)
    nextPageToken : string;
    (** The continuation token, which is used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    selfLink : string;
    (** Link to this resource. *)
    title : string;
    (** The title of this collection of people. *)
    totalItems : int;
    (** The total number of people available in this list. The number of people in a response might be smaller due to paging. This might not be set for all collections. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Person.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val totalItems : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

