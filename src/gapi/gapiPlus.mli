(** Data definition for Google+ (v1).
  
  For more information about this data model, see the
  {{:http://developers.google.com/+/api/}API Documentation}

  *)

module PlusAclentryResource :
sig
  type t = {
    _type : string;
    (** The type of entry describing to whom access is granted. Possible values are:  
    - ["person"] - Access to an individual. 
    - ["circle"] - Access to members of a circle. 
    - ["myCircles"] - Access to members of all the person's circles. 
    - ["extendedCircles"] - Access to members of everyone in a person's circles, plus all of the people in their circles. 
    - ["public"] - Access to anyone on the web. *)
    id : string
    (** The ID of the entry. For entries of type ["person"] or ["circle"], this is the ID of the resource. For other types, this property is not set. *)
  }

  val _type : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module Acl :
sig
  type t = {
    kind : string;
    (** Identifies this resource as a collection of access controls. Value: ["plus#acl"] *)
    description : string;
    (** Description of the access granted, suitable for display *)
    items : PlusAclentryResource.t list
    (** The list of access entries. *)
  }

  val kind : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val items : (t, PlusAclentryResource.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module ImageData :
sig
  type t = {
    url : string
    (** The URL of the person's profile photo. To re-size the image and crop it to a square, append the query string ?sz=x, where x is the dimension in pixels of each side. *)
  }

  val url : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : 'a -> GapiJson.json_data_model -> t

end

module ActorData :
sig
  type t = {
    id : string;
    (** The ID of the actor's person resource. *)
    displayName : string;
    (** The name of the actor, suitable for display. *)
    url : string;
    (** The link to the actor's Google profile. *)
    image : ImageData.t
    (** The image representation of the actor. *)
  }

  val id : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val image : (t, ImageData.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

(** If the attachment is a video, the embeddable link. *)
module EmbedData :
sig
  type t = {
    url : string;
    (** URL of the link. *)
    _type : string
    (** Media type of the link. *)
  }

  val url : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module AttachmentImageData :
sig
  type t = {
    url : string;
    (** URL of the link. *)
    _type : string;
    (** Media type of the link. *)
    height : int;
    (** The height, in pixels, of the linked resource. *)
    width : int
    (** The width, in pixels, of the linked resource. *)
  }

  val url : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val height : (t, int) GapiLens.t
  val width : (t, int) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module AttachmentsData :
sig
  type t = {
    objectType : string;
    (** The type of media object. Possible values are:  
    - ["photo"] - A photo. 
    - ["video"] - A video. 
    - ["article"] - An article, specified by a link. *)
    displayName : string;
    (** The title of the attachment (such as a photo caption or an article title). *)
    id : string;
    (** The ID of the media object's resource. *)
    content : string;
    (** If the attachment is an article, this property contains a snippet of text from the article. *)
    url : string;
    (** The link to the attachment, should be of type text/html. *)
    image : AttachmentImageData.t;
    (** The preview image for photos or videos. *)
    fullImage : AttachmentImageData.t;
    (** The full image url for photo attachments. *)
    embed : EmbedData.t
    (** If the attachment is a video, the embeddable link. *)
  }

  val objectType : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val content : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val image : (t, AttachmentImageData.t) GapiLens.t
  val fullImage : (t, AttachmentImageData.t) GapiLens.t
  val embed : (t, EmbedData.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module ActionData :
sig
  type t = {
    totalItems : int;
    (** Total number of people who performed this action. *)
    selfLink : string
    (** The URL for the collection of people who performed this action. *)
  }

  val totalItems : (t, int) GapiLens.t
  val selfLink : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

(** The service provider that initially published this activity. *)
module ProviderData :
sig
  type t = {
    title : string
    (** Name of the service provider. *)
  }

  val title : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : 'a -> GapiJson.json_data_model -> t

end

(** The object of this activity. *)
module ObjectData :
sig
  type t = {
    objectType : string;
    (** The type of the object. Possible values are:  
    - ["note"] - Textual content. 
    - ["activity"] - A Google+ activity. *)
    id : string;
    (** The ID of the object. When resharing an activity, this is the ID of the activity being reshared. *)
    actor : ActorData.t;
    (** If this activity's object is itself another activity (for example, when a person reshares an activity), this property specifies the original activity's actor. *)
    content : string;
    (** The HTML-formatted content, suitable for display. When creating or updating an activity, this value must be supplied as plain text in the request. If successful, the response will contain the HTML-formatted content. When updating an activity, use originalContent as the starting value, then assign the updated text to this property. *)
    originalContent : string;
    (** The content (text) as provided by the author, stored without any HTML formatting. When updating an activity's content, use the value of originalContent as the starting point from which to make edits. *)
    url : string;
    (** The URL that points to the linked resource. *)
    replies : ActionData.t;
    (** Comments in reply to this activity. *)
    plusoners : ActionData.t;
    (** People who +1'd this activity. *)
    resharers :  ActionData.t;
    (** People who reshared this activity. *)
    attachments : AttachmentsData.t list
    (** The media objects attached to this activity. *)
  }

  val objectType : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val actor : (t, ActorData.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val originalContent : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val replies : (t, ActionData.t) GapiLens.t
  val plusoners : (t, ActionData.t) GapiLens.t
  val resharers : (t, ActionData.t) GapiLens.t
  val attachments : (t, AttachmentsData.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module Activity :
sig
  type t = {
    kind : string;
    (** Identifies this resource as an activity. Value: ["plus#activity"]. *)
    placeholder : bool;
    (** [true] if this activity is a placeholder. *)
    title : string;
    (** Title of this activity. *)
    published : GapiDate.t;
    (** The time at which this activity was initially published. Formatted as an RFC 3339 timestamp. *)
    updated : GapiDate.t;
    (** The time at which this activity was last updated. Formatted as an RFC 3339 timestamp. *)
    id : string;
    (** The ID of this activity. *)
    url : string;
    (** The link to this activity. *)
    actor : ActorData.t;
    (** The person who performed this activity. *)
    verb : string;
    (** This activity's verb, indicating what action was performed. Possible values are:  
    - ["post"] - Publish content to the stream. 
    - ["checkin"] - Check in to a location. 
    - ["share"] - Reshare an activity. *)
    _object : ObjectData.t;
    (** The object of this activity. *)
    annotation : string;
    (** Additional content added by the person who shared this activity, applicable only when resharing an activity. *)
    crosspostSource : string;
    (** If this activity is a crosspost from another system, this property specifies the ID of the original activity. *)
    provider : ProviderData.t;
    (** The service provider that initially published this activity. *)
    access : Acl.t;
    geocode : string;
    (** Latitude and longitude where this activity occurred. Format is latitude followed by longitude, space separated. *)
    address : string;
    (** Street address where this activity occurred. *)
    radius : string;
    (** Radius, in meters, of the region where this activity occurred, centered at the latitude and longitude identified in geocode. *)
    placeId : string;
    (** ID of the place where this activity occurred. *)
    placeName : string
    (** Name of the place where this activity occurred. *)
  }

  val kind : (t, string) GapiLens.t
  val placeholder : (t, bool) GapiLens.t
  val title : (t, string) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val actor : (t, ActorData.t) GapiLens.t
  val verb : (t, string) GapiLens.t
  val _object : (t, ObjectData.t) GapiLens.t
  val annotation : (t, string) GapiLens.t
  val crosspostSource : (t, string) GapiLens.t
  val provider : (t, ProviderData.t) GapiLens.t
  val access : (t, Acl.t) GapiLens.t
  val geocode : (t, string) GapiLens.t
  val address : (t, string) GapiLens.t
  val radius : (t, string) GapiLens.t
  val placeId : (t, string) GapiLens.t
  val placeName : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module ActivityFeed :
sig
  type t = {
    kind : string;
    (** Identifies this resource as a collection of activities. Value: ["plus#activityFeed"]. *)
    nextPageToken : string;
    (** The continuation token, used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    selfLink : string;
    (** Link to this activity resource. *)
    nextLink : string;
    (** Link to the next page of activities. *)
    title : string;
    (** The title of this collection of activities. *)
    updated : GapiDate.t;
    (** The time at which this collection of activities was last updated. Formatted as an RFC 3339 timestamp. *)
    id : string;
    (** The ID of this collection of activities. *)
    items : Activity.t list
    (** The activities in this page of results. *)
  }

  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val items : (t, Activity.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module InReplyToData :
sig
  type t = {
    id : string;
    (** The id of the activity. *)
    url : string
    (** The url of the activity. *)
  }

  val id : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module CommentObjectData :
sig
  type t = {
    objectType : string;
    (** The object type of this comment. Possible values are:  
    - ["comment"] - A comment in reply to an activity. *)
    content : string
    (** The content of this comment. *)
  }

  val objectType : (t, string) GapiLens.t
  val content : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module Comment :
sig
  type t = {
    kind : string;
    (** Identifies this resource as a comment. Value: ["plus#comment"]. *)
    id : string;
    (** The ID of this comment. *)
    published : GapiDate.t;
    (** The time at which this comment was initially published. Formatted as an RFC 3339 timestamp. *)
    updated : GapiDate.t;
    (** The time at which this comment was last updated. Formatted as an RFC 3339 timestamp. *)
    actor : ActorData.t;
    (** The person who posted this comment. *)
    verb : string;
    (** This comment's verb, indicating what action was performed. Possible values are:  
    - ["post"] - Publish content to the stream. *)
    _object : CommentObjectData.t;
    (** The object of this comment. *)
    selfLink : string;
    (** Link to this comment resource. *)
    inReplyTo : InReplyToData.t list
    (** The activity this comment replied to. *)
  }

  val kind : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val published : (t, GapiDate.t) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val actor : (t, ActorData.t) GapiLens.t
  val verb : (t, string) GapiLens.t
  val _object : (t, CommentObjectData.t) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val inReplyTo : (t, InReplyToData.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module CommentFeed :
sig
  type t = {
    kind : string;
    (** Identifies this resource as a collection of comments. Value: ["plus#commentFeed"]. *)
    nextPageToken : string;
    (** The continuation token, used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    nextLink : string;
    (** Link to the next page of activities. *)
    title : string;
    (** The title of this collection of comments. *)
    updated : GapiDate.t;
    (** The time at which this collection of comments was last updated. Formatted as an RFC 3339 timestamp. *)
    id : string;
    (** The ID of this collection of comments. *)
    items : Comment.t list
    (** The comments in this page of results. *)
  }

  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val updated : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val items : (t, Comment.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module EmailsData :
sig
  type t = {
    value : string;
    (** The email address. *)
    _type : string;
    (** The type of address. Possible values are:  
    - ["home"] - Home email address. 
    - ["work"] - Work email address. 
    - ["other"] - Other. *)
    primary : bool
    (** If [true], indicates this email address is the person's primary one. *)
  }

  val value : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val primary : (t, bool) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

(** An object representation of the individual components of a person's name. *)
module NameData :
sig
  type t = {
    formatted : string;
    (** The full name of this person, including middle names, suffixes, etc. *)
    familyName : string;
    (** The family name (last name) of this person. *)
    givenName : string;
    (** The given name (first name) of this person. *)
    middleName : string;
    (** The middle name of this person. *)
    honorificPrefix : string;
    (** The honorific prefixes (such as ["Dr."] or ["Mrs."]) for this person. *)
    honorificSuffix : string
    (** The honorific suffixes (such as ["Jr."]) for this person. *)
  }

  val formatted : (t, string) GapiLens.t
  val familyName : (t, string) GapiLens.t
  val givenName : (t, string) GapiLens.t
  val middleName : (t, string) GapiLens.t
  val honorificPrefix : (t, string) GapiLens.t
  val honorificSuffix : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module OrganizationsData :
sig
  type t = {
    name : string;
    (** The name of the organization. *)
    department : string;
    (** The department within the organization. *)
    title : string;
    (** The person's job title or role within the organization. *)
    _type : string;
    (** The type of organization. Possible values are:  
    - ["work"] - Work. 
    - ["school"] - School. *)
    startDate : string;
    (** The date the person joined this organization. *)
    endDate : string;
    (** The date the person left this organization. *)
    location : string;
    (** The location of this organization. *)
    description : string;
    (** A short description of the person's role in this organization. *)
    primary : bool
    (** If [true], indicates this organization is the person's primary one (typically interpreted as current one). *)
  }

  val name : (t, string) GapiLens.t
  val department : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val startDate : (t, string) GapiLens.t
  val endDate : (t, string) GapiLens.t
  val location : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val primary : (t, bool) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module PlaceLivedData :
sig
  type t = {
    value : string;
    (** A place where this person has lived. For example: ["Seattle, WA"], ["Near Toronto"]. *)
    primary : bool
    (** If [true], this place of residence is this person's primary residence. *)
  }

  val value : (t, string) GapiLens.t
  val primary : (t, bool) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module UrlsData :
sig
  type t = {
    value : string;
    (** The URL value. *)
    _type : string;
    (** The type of URL. Possible values are:  
    - ["home"] - URL for home. 
    - ["work"] - URL for work. 
    - ["blog"] - URL for blog. 
    - ["profile"] - URL for profile. 
    - ["other"] - Other. *)
    primary : bool
    (** If [true], this URL is the person's primary URL. *)
  }

  val value : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val primary : (t, bool) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module Person :
sig
  type t = {
    kind : string;
    (** Identifies this resource as a person. Value: ["plus#person"]. *)
    objectType : string;
    (** Type of person within Google+. Possible values are:  
    - ["person"] - represents an actual person. 
    - ["page"] - represents a page. *)
    id : string;
    (** The ID of this person. *)
    displayName : string;
    (** The name of this person, suitable for display. *)
    name : NameData.t;
    (** An object representation of the individual components of a person's name. *)
    nickname : string;
    (** The nickname of this person. *)
    tagline : string;
    (** The brief description (tagline) of this person. *)
    birthday : string;
    (** The person's date of birth, represented as YYYY-MM-DD. *)
    gender : string;
    (** The person's gender. Possible values are:  
    - ["male"] - Male gender. 
    - ["female"] - Female gender. 
    - ["other"] - Other. *)
    aboutMe : string;
    (** A short biography for this person. *)
    currentLocation : string;
    (** The current location for this person. *)
    relationshipStatus : string;
    (** The person's relationship status. Possible values are:  
    - ["single"] - Person is single. 
    - ["in_a_relationship"] - Person is in a relationship. 
    - ["engaged"] - Person is engaged. 
    - ["married"] - Person is married. 
    - ["its_complicated"] - The relationship is complicated. 
    - ["open_relationship"] - Person is in an open relationship. 
    - ["widowed"] - Person is widowed. 
    - ["in_domestic_partnership"] - Person is in a domestic partnership. 
    - ["in_civil_union"] - Person is in a civil union. *)
    url : string;
    (** The URL of this person's profile. *)
    image : ImageData.t;
    (** The representation of the person's profile photo. *)
    emails : EmailsData.t list;
    (** A list of email addresses for this person. *)
    urls : UrlsData.t list;
    (** A list of URLs for this person. *)
    organizations : OrganizationsData.t list;
    (** A list of current or past organizations with which this person is associated. *)
    placesLived : PlaceLivedData.t list;
    (** A list of places where this person has lived. *)
    languagesSpoken : string list;
    (** The languages spoken by this person. *)
    hasApp : bool
    (** If [true], indicates that the person has installed the app that is making the request and has chosen to expose this install state to the caller. A value of [false] indicates that the install state cannot be determined (it is either not installed or the person has chosen to keep this information private). *)
  }

  val kind : (t, string) GapiLens.t
  val objectType : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val name : (t, NameData.t) GapiLens.t
  val nickname : (t, string) GapiLens.t
  val tagline : (t, string) GapiLens.t
  val birthday : (t, string) GapiLens.t
  val gender : (t, string) GapiLens.t
  val aboutMe : (t, string) GapiLens.t
  val currentLocation : (t, string) GapiLens.t
  val relationshipStatus : (t, string) GapiLens.t
  val url : (t, string) GapiLens.t
  val image : (t, ImageData.t) GapiLens.t
  val emails : (t, EmailsData.t list) GapiLens.t
  val urls : (t, UrlsData.t list) GapiLens.t
  val organizations : (t, OrganizationsData.t list) GapiLens.t
  val placesLived : (t, PlaceLivedData.t list) GapiLens.t
  val languagesSpoken : (t, string list) GapiLens.t
  val hasApp : (t, bool) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse_languageSpoken : 'a -> GapiJson.json_data_model -> string

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module PeopleFeed :
sig
  type t = {
    kind : string;
    (** Identifies this resource as a collection of people. Value: ["plus#peopleFeed"]. *)
    selfLink : string;
    (** Link to this resource. *)
    title : string;
    (** The title of this collection of people. *)
    nextPageToken : string;
    (** The continuation token, used to page through large result sets. Provide this value in a subsequent request to return the next page of results. *)
    items : Person.t list
    (** The people in this page of results. Each item will include the id, displayName, image, and url for the person. To retrieve additional profile data, see the people.get method. *)
  }

  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, Person.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

