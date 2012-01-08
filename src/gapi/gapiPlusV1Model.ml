(* Warning! This file is generated. Modify at your own risk. *)

module PlusAclentryResource =
struct
  type t = {
    id : string;
    _type : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    id = "";
    _type = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "type" x._type;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PlusAclentryResource.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ActivityObjectAttachmentsImageData =
struct
  type t = {
    height : int;
    _type : string;
    url : string;
    width : int;
    
  }
  
  let height = {
    GapiLens.get = (fun x -> x.height);
    GapiLens.set = (fun v x -> { x with height = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  let width = {
    GapiLens.get = (fun x -> x.width);
    GapiLens.set = (fun v x -> { x with width = v });
  }
  
  let empty = {
    height = 0;
    _type = "";
    url = "";
    width = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "height" x.height;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "url" x.url;
      GapiJson.render_int_value "width" x.width;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with height = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with width = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectAttachmentsImageData.parse" e
  
end

module ActivityObjectAttachmentsFullImageData =
struct
  type t = {
    height : int;
    _type : string;
    url : string;
    width : int;
    
  }
  
  let height = {
    GapiLens.get = (fun x -> x.height);
    GapiLens.set = (fun v x -> { x with height = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  let width = {
    GapiLens.get = (fun x -> x.width);
    GapiLens.set = (fun v x -> { x with width = v });
  }
  
  let empty = {
    height = 0;
    _type = "";
    url = "";
    width = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "height" x.height;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "url" x.url;
      GapiJson.render_int_value "width" x.width;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with height = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with width = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectAttachmentsFullImageData.parse" e
  
end

module CommentActorImageData =
struct
  type t = {
    url : string;
    
  }
  
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.CommentActorImageData.parse" e
  
end

module CommentActorData =
struct
  type t = {
    displayName : string;
    id : string;
    image : CommentActorImageData.t;
    url : string;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    displayName = "";
    id = "";
    image = CommentActorImageData.empty;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_object "image" (CommentActorImageData.render_content x.image);
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CommentActorImageData.parse
        CommentActorImageData.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.CommentActorData.parse" e
  
end

module CommentInReplyToData =
struct
  type t = {
    id : string;
    url : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    id = "";
    url = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.CommentInReplyToData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentObjectData =
struct
  type t = {
    content : string;
    objectType : string;
    
  }
  
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v });
  }
  
  let empty = {
    content = "";
    objectType = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_string_value "objectType" x.objectType;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectType"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with objectType = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.CommentObjectData.parse" e
  
end

module Comment =
struct
  type t = {
    actor : CommentActorData.t;
    etag : string;
    id : string;
    inReplyTo : CommentInReplyToData.t list;
    kind : string;
    _object : CommentObjectData.t;
    published : GapiDate.t;
    selfLink : string;
    updated : GapiDate.t;
    verb : string;
    
  }
  
  let actor = {
    GapiLens.get = (fun x -> x.actor);
    GapiLens.set = (fun v x -> { x with actor = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let inReplyTo = {
    GapiLens.get = (fun x -> x.inReplyTo);
    GapiLens.set = (fun v x -> { x with inReplyTo = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let _object = {
    GapiLens.get = (fun x -> x._object);
    GapiLens.set = (fun v x -> { x with _object = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let verb = {
    GapiLens.get = (fun x -> x.verb);
    GapiLens.set = (fun v x -> { x with verb = v });
  }
  
  let empty = {
    actor = CommentActorData.empty;
    etag = "";
    id = "";
    inReplyTo = [];
    kind = "";
    _object = CommentObjectData.empty;
    published = GapiDate.epoch;
    selfLink = "";
    updated = GapiDate.epoch;
    verb = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_object "actor" (CommentActorData.render_content x.actor);
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "inReplyTo" CommentInReplyToData.render x.inReplyTo;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_object "object" (CommentObjectData.render_content x._object);
      GapiJson.render_date_value "published" x.published;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "verb" x.verb;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "actor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CommentActorData.parse
        CommentActorData.empty
        (fun v -> { x with actor = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "inReplyTo"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        CommentInReplyToData.parse
        CommentInReplyToData.empty
        (fun xs -> { x with inReplyTo = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "object"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CommentObjectData.parse
        CommentObjectData.empty
        (fun v -> { x with _object = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with published = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verb"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with verb = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.Comment.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentFeed =
struct
  type t = {
    etag : string;
    id : string;
    items : Comment.t list;
    kind : string;
    nextLink : string;
    nextPageToken : string;
    title : string;
    updated : GapiDate.t;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  
  let empty = {
    etag = "";
    id = "";
    items = [];
    kind = "";
    nextLink = "";
    nextPageToken = "";
    title = "";
    updated = GapiDate.epoch;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "items" Comment.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Comment.parse
        Comment.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.CommentFeed.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ActivityObjectResharersData =
struct
  type t = {
    selfLink : string;
    totalItems : int;
    
  }
  
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let totalItems = {
    GapiLens.get = (fun x -> x.totalItems);
    GapiLens.set = (fun v x -> { x with totalItems = v });
  }
  
  let empty = {
    selfLink = "";
    totalItems = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalItems" x.totalItems;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with totalItems = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectResharersData.parse" e
  
end

module ActivityObjectAttachmentsEmbedData =
struct
  type t = {
    _type : string;
    url : string;
    
  }
  
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    _type = "";
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectAttachmentsEmbedData.parse" e
  
end

module ActivityObjectAttachmentsData =
struct
  type t = {
    content : string;
    displayName : string;
    embed : ActivityObjectAttachmentsEmbedData.t;
    fullImage : ActivityObjectAttachmentsFullImageData.t;
    id : string;
    image : ActivityObjectAttachmentsImageData.t;
    objectType : string;
    url : string;
    
  }
  
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let embed = {
    GapiLens.get = (fun x -> x.embed);
    GapiLens.set = (fun v x -> { x with embed = v });
  }
  let fullImage = {
    GapiLens.get = (fun x -> x.fullImage);
    GapiLens.set = (fun v x -> { x with fullImage = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    content = "";
    displayName = "";
    embed = ActivityObjectAttachmentsEmbedData.empty;
    fullImage = ActivityObjectAttachmentsFullImageData.empty;
    id = "";
    image = ActivityObjectAttachmentsImageData.empty;
    objectType = "";
    url = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_object "embed" (ActivityObjectAttachmentsEmbedData.render_content x.embed);
      GapiJson.render_object "fullImage" (ActivityObjectAttachmentsFullImageData.render_content x.fullImage);
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_object "image" (ActivityObjectAttachmentsImageData.render_content x.image);
      GapiJson.render_string_value "objectType" x.objectType;
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "embed"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectAttachmentsEmbedData.parse
        ActivityObjectAttachmentsEmbedData.empty
        (fun v -> { x with embed = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "fullImage"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectAttachmentsFullImageData.parse
        ActivityObjectAttachmentsFullImageData.empty
        (fun v -> { x with fullImage = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectAttachmentsImageData.parse
        ActivityObjectAttachmentsImageData.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectType"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with objectType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectAttachmentsData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Acl =
struct
  type t = {
    description : string;
    items : PlusAclentryResource.t list;
    kind : string;
    
  }
  
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    description = "";
    items = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_array "items" PlusAclentryResource.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        PlusAclentryResource.parse
        PlusAclentryResource.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.Acl.parse" e
  
end

module PersonOrganizationsData =
struct
  type t = {
    department : string;
    description : string;
    endDate : string;
    location : string;
    name : string;
    primary : bool;
    startDate : string;
    title : string;
    _type : string;
    
  }
  
  let department = {
    GapiLens.get = (fun x -> x.department);
    GapiLens.set = (fun v x -> { x with department = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let endDate = {
    GapiLens.get = (fun x -> x.endDate);
    GapiLens.set = (fun v x -> { x with endDate = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let primary = {
    GapiLens.get = (fun x -> x.primary);
    GapiLens.set = (fun v x -> { x with primary = v });
  }
  let startDate = {
    GapiLens.get = (fun x -> x.startDate);
    GapiLens.set = (fun v x -> { x with startDate = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    department = "";
    description = "";
    endDate = "";
    location = "";
    name = "";
    primary = false;
    startDate = "";
    title = "";
    _type = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "department" x.department;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "endDate" x.endDate;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_bool_value "primary" x.primary;
      GapiJson.render_string_value "startDate" x.startDate;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "type" x._type;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "department"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with department = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endDate"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with endDate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "primary"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with primary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startDate"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with startDate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PersonOrganizationsData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PersonImageData =
struct
  type t = {
    url : string;
    
  }
  
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PersonImageData.parse" e
  
end

module PersonEmailsData =
struct
  type t = {
    primary : bool;
    _type : string;
    value : string;
    
  }
  
  let primary = {
    GapiLens.get = (fun x -> x.primary);
    GapiLens.set = (fun v x -> { x with primary = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  
  let empty = {
    primary = false;
    _type = "";
    value = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_bool_value "primary" x.primary;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "value" x.value;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "primary"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with primary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PersonEmailsData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PersonNameData =
struct
  type t = {
    familyName : string;
    formatted : string;
    givenName : string;
    honorificPrefix : string;
    honorificSuffix : string;
    middleName : string;
    
  }
  
  let familyName = {
    GapiLens.get = (fun x -> x.familyName);
    GapiLens.set = (fun v x -> { x with familyName = v });
  }
  let formatted = {
    GapiLens.get = (fun x -> x.formatted);
    GapiLens.set = (fun v x -> { x with formatted = v });
  }
  let givenName = {
    GapiLens.get = (fun x -> x.givenName);
    GapiLens.set = (fun v x -> { x with givenName = v });
  }
  let honorificPrefix = {
    GapiLens.get = (fun x -> x.honorificPrefix);
    GapiLens.set = (fun v x -> { x with honorificPrefix = v });
  }
  let honorificSuffix = {
    GapiLens.get = (fun x -> x.honorificSuffix);
    GapiLens.set = (fun v x -> { x with honorificSuffix = v });
  }
  let middleName = {
    GapiLens.get = (fun x -> x.middleName);
    GapiLens.set = (fun v x -> { x with middleName = v });
  }
  
  let empty = {
    familyName = "";
    formatted = "";
    givenName = "";
    honorificPrefix = "";
    honorificSuffix = "";
    middleName = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "familyName" x.familyName;
      GapiJson.render_string_value "formatted" x.formatted;
      GapiJson.render_string_value "givenName" x.givenName;
      GapiJson.render_string_value "honorificPrefix" x.honorificPrefix;
      GapiJson.render_string_value "honorificSuffix" x.honorificSuffix;
      GapiJson.render_string_value "middleName" x.middleName;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "familyName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with familyName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formatted"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with formatted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "givenName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with givenName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "honorificPrefix"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with honorificPrefix = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "honorificSuffix"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with honorificSuffix = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "middleName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with middleName = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PersonNameData.parse" e
  
end

module PersonPlacesLivedData =
struct
  type t = {
    primary : bool;
    value : string;
    
  }
  
  let primary = {
    GapiLens.get = (fun x -> x.primary);
    GapiLens.set = (fun v x -> { x with primary = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  
  let empty = {
    primary = false;
    value = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_bool_value "primary" x.primary;
      GapiJson.render_string_value "value" x.value;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "primary"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with primary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PersonPlacesLivedData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PersonUrlsData =
struct
  type t = {
    primary : bool;
    _type : string;
    value : string;
    
  }
  
  let primary = {
    GapiLens.get = (fun x -> x.primary);
    GapiLens.set = (fun v x -> { x with primary = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  
  let empty = {
    primary = false;
    _type = "";
    value = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_bool_value "primary" x.primary;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "value" x.value;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "primary"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with primary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PersonUrlsData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Person =
struct
  type t = {
    aboutMe : string;
    birthday : string;
    currentLocation : string;
    displayName : string;
    emails : PersonEmailsData.t list;
    etag : string;
    gender : string;
    hasApp : bool;
    id : string;
    image : PersonImageData.t;
    kind : string;
    languagesSpoken : string list;
    name : PersonNameData.t;
    nickname : string;
    objectType : string;
    organizations : PersonOrganizationsData.t list;
    placesLived : PersonPlacesLivedData.t list;
    relationshipStatus : string;
    tagline : string;
    url : string;
    urls : PersonUrlsData.t list;
    
  }
  
  let aboutMe = {
    GapiLens.get = (fun x -> x.aboutMe);
    GapiLens.set = (fun v x -> { x with aboutMe = v });
  }
  let birthday = {
    GapiLens.get = (fun x -> x.birthday);
    GapiLens.set = (fun v x -> { x with birthday = v });
  }
  let currentLocation = {
    GapiLens.get = (fun x -> x.currentLocation);
    GapiLens.set = (fun v x -> { x with currentLocation = v });
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let emails = {
    GapiLens.get = (fun x -> x.emails);
    GapiLens.set = (fun v x -> { x with emails = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let gender = {
    GapiLens.get = (fun x -> x.gender);
    GapiLens.set = (fun v x -> { x with gender = v });
  }
  let hasApp = {
    GapiLens.get = (fun x -> x.hasApp);
    GapiLens.set = (fun v x -> { x with hasApp = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let languagesSpoken = {
    GapiLens.get = (fun x -> x.languagesSpoken);
    GapiLens.set = (fun v x -> { x with languagesSpoken = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let nickname = {
    GapiLens.get = (fun x -> x.nickname);
    GapiLens.set = (fun v x -> { x with nickname = v });
  }
  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v });
  }
  let organizations = {
    GapiLens.get = (fun x -> x.organizations);
    GapiLens.set = (fun v x -> { x with organizations = v });
  }
  let placesLived = {
    GapiLens.get = (fun x -> x.placesLived);
    GapiLens.set = (fun v x -> { x with placesLived = v });
  }
  let relationshipStatus = {
    GapiLens.get = (fun x -> x.relationshipStatus);
    GapiLens.set = (fun v x -> { x with relationshipStatus = v });
  }
  let tagline = {
    GapiLens.get = (fun x -> x.tagline);
    GapiLens.set = (fun v x -> { x with tagline = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  let urls = {
    GapiLens.get = (fun x -> x.urls);
    GapiLens.set = (fun v x -> { x with urls = v });
  }
  
  let empty = {
    aboutMe = "";
    birthday = "";
    currentLocation = "";
    displayName = "";
    emails = [];
    etag = "";
    gender = "";
    hasApp = false;
    id = "";
    image = PersonImageData.empty;
    kind = "";
    languagesSpoken = [];
    name = PersonNameData.empty;
    nickname = "";
    objectType = "";
    organizations = [];
    placesLived = [];
    relationshipStatus = "";
    tagline = "";
    url = "";
    urls = [];
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "aboutMe" x.aboutMe;
      GapiJson.render_string_value "birthday" x.birthday;
      GapiJson.render_string_value "currentLocation" x.currentLocation;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_array "emails" PersonEmailsData.render x.emails;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "gender" x.gender;
      GapiJson.render_bool_value "hasApp" x.hasApp;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_object "image" (PersonImageData.render_content x.image);
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "languagesSpoken" GapiJson.Array (GapiJson.render_string_value "") x.languagesSpoken;
      GapiJson.render_object "name" (PersonNameData.render_content x.name);
      GapiJson.render_string_value "nickname" x.nickname;
      GapiJson.render_string_value "objectType" x.objectType;
      GapiJson.render_array "organizations" PersonOrganizationsData.render x.organizations;
      GapiJson.render_array "placesLived" PersonPlacesLivedData.render x.placesLived;
      GapiJson.render_string_value "relationshipStatus" x.relationshipStatus;
      GapiJson.render_string_value "tagline" x.tagline;
      GapiJson.render_string_value "url" x.url;
      GapiJson.render_array "urls" PersonUrlsData.render x.urls;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "aboutMe"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with aboutMe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "birthday"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with birthday = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "currentLocation"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with currentLocation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "emails"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        PersonEmailsData.parse
        PersonEmailsData.empty
        (fun xs -> { x with emails = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "gender"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with gender = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasApp"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with hasApp = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PersonImageData.parse
        PersonImageData.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "languagesSpoken"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with languagesSpoken = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "name"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PersonNameData.parse
        PersonNameData.empty
        (fun v -> { x with name = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nickname"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nickname = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectType"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with objectType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "organizations"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        PersonOrganizationsData.parse
        PersonOrganizationsData.empty
        (fun xs -> { x with organizations = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "placesLived"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        PersonPlacesLivedData.parse
        PersonPlacesLivedData.empty
        (fun xs -> { x with placesLived = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "relationshipStatus"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with relationshipStatus = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "tagline"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with tagline = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "urls"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        PersonUrlsData.parse
        PersonUrlsData.empty
        (fun xs -> { x with urls = xs })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.Person.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ActivityObjectPlusonersData =
struct
  type t = {
    selfLink : string;
    totalItems : int;
    
  }
  
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let totalItems = {
    GapiLens.get = (fun x -> x.totalItems);
    GapiLens.set = (fun v x -> { x with totalItems = v });
  }
  
  let empty = {
    selfLink = "";
    totalItems = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalItems" x.totalItems;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with totalItems = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectPlusonersData.parse" e
  
end

module ActivityObjectRepliesData =
struct
  type t = {
    selfLink : string;
    totalItems : int;
    
  }
  
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let totalItems = {
    GapiLens.get = (fun x -> x.totalItems);
    GapiLens.set = (fun v x -> { x with totalItems = v });
  }
  
  let empty = {
    selfLink = "";
    totalItems = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalItems" x.totalItems;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with totalItems = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectRepliesData.parse" e
  
end

module ActivityActorImageData =
struct
  type t = {
    url : string;
    
  }
  
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityActorImageData.parse" e
  
end

module ActivityActorData =
struct
  type t = {
    displayName : string;
    id : string;
    image : ActivityActorImageData.t;
    url : string;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    displayName = "";
    id = "";
    image = ActivityActorImageData.empty;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_object "image" (ActivityActorImageData.render_content x.image);
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityActorImageData.parse
        ActivityActorImageData.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityActorData.parse" e
  
end

module ActivityObjectActorImageData =
struct
  type t = {
    url : string;
    
  }
  
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectActorImageData.parse" e
  
end

module ActivityObjectActorData =
struct
  type t = {
    displayName : string;
    id : string;
    image : ActivityObjectActorImageData.t;
    url : string;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    displayName = "";
    id = "";
    image = ActivityObjectActorImageData.empty;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_object "image" (ActivityObjectActorImageData.render_content x.image);
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectActorImageData.parse
        ActivityObjectActorImageData.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectActorData.parse" e
  
end

module ActivityObjectData =
struct
  type t = {
    actor : ActivityObjectActorData.t;
    attachments : ActivityObjectAttachmentsData.t list;
    content : string;
    id : string;
    objectType : string;
    originalContent : string;
    plusoners : ActivityObjectPlusonersData.t;
    replies : ActivityObjectRepliesData.t;
    resharers : ActivityObjectResharersData.t;
    url : string;
    
  }
  
  let actor = {
    GapiLens.get = (fun x -> x.actor);
    GapiLens.set = (fun v x -> { x with actor = v });
  }
  let attachments = {
    GapiLens.get = (fun x -> x.attachments);
    GapiLens.set = (fun v x -> { x with attachments = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v });
  }
  let originalContent = {
    GapiLens.get = (fun x -> x.originalContent);
    GapiLens.set = (fun v x -> { x with originalContent = v });
  }
  let plusoners = {
    GapiLens.get = (fun x -> x.plusoners);
    GapiLens.set = (fun v x -> { x with plusoners = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  let resharers = {
    GapiLens.get = (fun x -> x.resharers);
    GapiLens.set = (fun v x -> { x with resharers = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    actor = ActivityObjectActorData.empty;
    attachments = [];
    content = "";
    id = "";
    objectType = "";
    originalContent = "";
    plusoners = ActivityObjectPlusonersData.empty;
    replies = ActivityObjectRepliesData.empty;
    resharers = ActivityObjectResharersData.empty;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_object "actor" (ActivityObjectActorData.render_content x.actor);
      GapiJson.render_array "attachments" ActivityObjectAttachmentsData.render x.attachments;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "objectType" x.objectType;
      GapiJson.render_string_value "originalContent" x.originalContent;
      GapiJson.render_object "plusoners" (ActivityObjectPlusonersData.render_content x.plusoners);
      GapiJson.render_object "replies" (ActivityObjectRepliesData.render_content x.replies);
      GapiJson.render_object "resharers" (ActivityObjectResharersData.render_content x.resharers);
      GapiJson.render_string_value "url" x.url;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "actor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectActorData.parse
        ActivityObjectActorData.empty
        (fun v -> { x with actor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "attachments"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        ActivityObjectAttachmentsData.parse
        ActivityObjectAttachmentsData.empty
        (fun xs -> { x with attachments = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectType"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with objectType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalContent"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with originalContent = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "plusoners"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectPlusonersData.parse
        ActivityObjectPlusonersData.empty
        (fun v -> { x with plusoners = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "replies"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectRepliesData.parse
        ActivityObjectRepliesData.empty
        (fun v -> { x with replies = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "resharers"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectResharersData.parse
        ActivityObjectResharersData.empty
        (fun v -> { x with resharers = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityObjectData.parse" e
  
end

module ActivityProviderData =
struct
  type t = {
    title : string;
    
  }
  
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  
  let empty = {
    title = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "title" x.title;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityProviderData.parse" e
  
end

module Activity =
struct
  type t = {
    access : Acl.t;
    actor : ActivityActorData.t;
    address : string;
    annotation : string;
    crosspostSource : string;
    etag : string;
    geocode : string;
    id : string;
    kind : string;
    _object : ActivityObjectData.t;
    placeId : string;
    placeName : string;
    placeholder : bool;
    provider : ActivityProviderData.t;
    published : GapiDate.t;
    radius : string;
    title : string;
    updated : GapiDate.t;
    url : string;
    verb : string;
    
  }
  
  let access = {
    GapiLens.get = (fun x -> x.access);
    GapiLens.set = (fun v x -> { x with access = v });
  }
  let actor = {
    GapiLens.get = (fun x -> x.actor);
    GapiLens.set = (fun v x -> { x with actor = v });
  }
  let address = {
    GapiLens.get = (fun x -> x.address);
    GapiLens.set = (fun v x -> { x with address = v });
  }
  let annotation = {
    GapiLens.get = (fun x -> x.annotation);
    GapiLens.set = (fun v x -> { x with annotation = v });
  }
  let crosspostSource = {
    GapiLens.get = (fun x -> x.crosspostSource);
    GapiLens.set = (fun v x -> { x with crosspostSource = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let geocode = {
    GapiLens.get = (fun x -> x.geocode);
    GapiLens.set = (fun v x -> { x with geocode = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let _object = {
    GapiLens.get = (fun x -> x._object);
    GapiLens.set = (fun v x -> { x with _object = v });
  }
  let placeId = {
    GapiLens.get = (fun x -> x.placeId);
    GapiLens.set = (fun v x -> { x with placeId = v });
  }
  let placeName = {
    GapiLens.get = (fun x -> x.placeName);
    GapiLens.set = (fun v x -> { x with placeName = v });
  }
  let placeholder = {
    GapiLens.get = (fun x -> x.placeholder);
    GapiLens.set = (fun v x -> { x with placeholder = v });
  }
  let provider = {
    GapiLens.get = (fun x -> x.provider);
    GapiLens.set = (fun v x -> { x with provider = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
  }
  let radius = {
    GapiLens.get = (fun x -> x.radius);
    GapiLens.set = (fun v x -> { x with radius = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  let verb = {
    GapiLens.get = (fun x -> x.verb);
    GapiLens.set = (fun v x -> { x with verb = v });
  }
  
  let empty = {
    access = Acl.empty;
    actor = ActivityActorData.empty;
    address = "";
    annotation = "";
    crosspostSource = "";
    etag = "";
    geocode = "";
    id = "";
    kind = "";
    _object = ActivityObjectData.empty;
    placeId = "";
    placeName = "";
    placeholder = false;
    provider = ActivityProviderData.empty;
    published = GapiDate.epoch;
    radius = "";
    title = "";
    updated = GapiDate.epoch;
    url = "";
    verb = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_object "access" (Acl.render_content x.access);
      GapiJson.render_object "actor" (ActivityActorData.render_content x.actor);
      GapiJson.render_string_value "address" x.address;
      GapiJson.render_string_value "annotation" x.annotation;
      GapiJson.render_string_value "crosspostSource" x.crosspostSource;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "geocode" x.geocode;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_object "object" (ActivityObjectData.render_content x._object);
      GapiJson.render_string_value "placeId" x.placeId;
      GapiJson.render_string_value "placeName" x.placeName;
      GapiJson.render_bool_value "placeholder" x.placeholder;
      GapiJson.render_object "provider" (ActivityProviderData.render_content x.provider);
      GapiJson.render_date_value "published" x.published;
      GapiJson.render_string_value "radius" x.radius;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "url" x.url;
      GapiJson.render_string_value "verb" x.verb;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "access"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Acl.parse
        Acl.empty
        (fun v -> { x with access = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "actor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityActorData.parse
        ActivityActorData.empty
        (fun v -> { x with actor = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "address"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with address = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "annotation"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with annotation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "crosspostSource"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with crosspostSource = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "geocode"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with geocode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "object"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityObjectData.parse
        ActivityObjectData.empty
        (fun v -> { x with _object = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "placeId"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with placeId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "placeName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with placeName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "placeholder"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with placeholder = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "provider"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ActivityProviderData.parse
        ActivityProviderData.empty
        (fun v -> { x with provider = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with published = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "radius"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with radius = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verb"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with verb = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.Activity.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ActivityFeed =
struct
  type t = {
    etag : string;
    id : string;
    items : Activity.t list;
    kind : string;
    nextLink : string;
    nextPageToken : string;
    selfLink : string;
    title : string;
    updated : GapiDate.t;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  
  let empty = {
    etag = "";
    id = "";
    items = [];
    kind = "";
    nextLink = "";
    nextPageToken = "";
    selfLink = "";
    title = "";
    updated = GapiDate.epoch;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "items" Activity.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Activity.parse
        Activity.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.ActivityFeed.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PeopleFeed =
struct
  type t = {
    etag : string;
    items : Person.t list;
    kind : string;
    nextPageToken : string;
    selfLink : string;
    title : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    selfLink = "";
    title = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Person.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "title" x.title;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Person.parse
        Person.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPlusV1Model.PeopleFeed.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

