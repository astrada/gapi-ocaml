open GapiUtils.Infix
open GapiCore
open GapiJson

(* Activities *)

module PlusAclentryResource =
struct
  type t = {
    _type : string;
    id : string
  }

  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }

  let empty = {
    _type = "";
    id = ""
  }

  let render x =
    render_object ""
      [render_string_value "type" x._type;
       render_string_value "id" x.id]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.PlusAclentryResource.parse" e

end

module Acl =
struct
  type t = {
    kind : string;
    description : string;
    items : PlusAclentryResource.t list
  }
             
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v })
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v })
  }

  let empty = {
    kind = "";
    description = "";
    items = []
  }

  let render x =
    render_object "access"
      [render_string_value "kind" x.kind;
       render_string_value "description" x.description;
       render_array "items" PlusAclentryResource.render x.items]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            PlusAclentryResource.parse
            PlusAclentryResource.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiPlus.Acl.parse" e

end

module ImageData =
struct
  type t = {
    url : string
  }

  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v _ -> { url = v })
  }

  let empty = {
    url = ""
  }

  let render x =
    render_object "image"
      [render_string_value "url" x.url]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { url = v }
      | e ->
          unexpected "GapiPlus.ImageData.parse" e

end

module ActorData =
struct
  type t = {
    id : string;
    displayName : string;
    url : string;
    image : ImageData.t
  }

  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v })
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v })
  }

  let empty = {
    id = "";
    displayName = "";
    url = "";
    image = ImageData.empty
  }

  let render x =
    render_object "actor"
      [render_string_value "id" x.id;
       render_string_value "displayName" x.displayName;
       render_string_value "url" x.url;
       ImageData.render x.image]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "displayName"; data_type = Scalar },
           Json_type.String v) ->
          { x with displayName = v }
      | AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Node
          ({ name = "image"; data_type = Object },
           cs) ->
          parse_children
            ImageData.parse
            ImageData.empty
            (fun s -> { x with image = s })
            cs
      (*| AnnotatedTree.Node
          ({ name = "actor"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs*)
      | e ->
          unexpected "GapiPlus.ActorData.parse" e

end

module EmbedData =
struct
  type t = {
    url : string;
    _type : string
  }

  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v })
  }

  let empty = {
    url = "";
    _type = ""
  }

  let render x =
    render_object "embed"
      [render_string_value "url" x.url;
       render_string_value "type" x._type]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      (*| AnnotatedTree.Node
          ({ name = "embed"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs*)
      | e ->
          unexpected "GapiPlus.EmbedData.parse" e

end

module AttachmentImageData =
struct
  type t = {
    url : string;
    _type : string;
    height : int;
    width : int
  }

  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v })
  }
  let height = {
    GapiLens.get = (fun x -> x.height);
    GapiLens.set = (fun v x -> { x with height = v })
  }
  let width = {
    GapiLens.get = (fun x -> x.width);
    GapiLens.set = (fun v x -> { x with width = v })
  }

  let empty = {
    url = "";
    _type = "";
    height = 0;
    width = 0
  }

  let render x =
    [render_string_value "url" x.url;
     render_string_value "type" x._type;
     render_int_value "height" x.height;
     render_int_value "width" x.width]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "height"; data_type = Scalar },
           Json_type.Int v) ->
          { x with height = v }
      | AnnotatedTree.Leaf
          ({ name = "width"; data_type = Scalar },
           Json_type.Int v) ->
          { x with width = v }
      | e ->
          unexpected "GapiPlus.AttachmentImageData.parse" e

end

module AttachmentsData =
struct
  type t = {
    objectType : string;
    displayName : string;
    id : string;
    content : string;
    url : string;
    image : AttachmentImageData.t;
    fullImage : AttachmentImageData.t;
    embed : EmbedData.t
  }

  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v })
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v })
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v })
  }
  let fullImage = {
    GapiLens.get = (fun x -> x.fullImage);
    GapiLens.set = (fun v x -> { x with fullImage = v })
  }
  let embed = {
    GapiLens.get = (fun x -> x.embed);
    GapiLens.set = (fun v x -> { x with embed = v })
  }

  let empty = {
    objectType = "";
    displayName = "";
    id = "";
    content = "";
    url = "";
    image = AttachmentImageData.empty;
    fullImage = AttachmentImageData.empty;
    embed = EmbedData.empty
  }

  let render x =
    render_object ""
      [render_string_value "objectType" x.objectType;
       render_string_value "displayName" x.displayName;
       render_string_value "id" x.id;
       render_string_value "content" x.content;
       render_string_value "url" x.url;
       render_object "image" (AttachmentImageData.render x.image);
       render_object "fullImage" (AttachmentImageData.render x.fullImage);
       EmbedData.render x.embed]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "objectType"; data_type = Scalar },
           Json_type.String v) ->
          { x with objectType = v }
      | AnnotatedTree.Leaf
          ({ name = "displayName"; data_type = Scalar },
           Json_type.String v) ->
          { x with displayName = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "content"; data_type = Scalar },
           Json_type.String v) ->
          { x with content = v }
      | AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Node
          ({ name = "image"; data_type = Object },
           cs) ->
          parse_children
            AttachmentImageData.parse
            AttachmentImageData.empty
            (fun s -> { x with image = s })
            cs
      | AnnotatedTree.Node
          ({ name = "fullImage"; data_type = Object },
           cs) ->
          parse_children
            AttachmentImageData.parse
            AttachmentImageData.empty
            (fun s -> { x with fullImage = s })
            cs
      | AnnotatedTree.Node
          ({ name = "embed"; data_type = Object },
           cs) ->
          parse_children
            EmbedData.parse
            EmbedData.empty
            (fun s -> { x with embed = s })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.AttachmentsData.parse" e

end

module ActionData =
struct
  type t = {
    totalItems : int;
    selfLink : string
  }

  let totalItems = {
    GapiLens.get = (fun x -> x.totalItems);
    GapiLens.set = (fun v x -> { x with totalItems = v })
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v })
  }

  let empty = {
    totalItems = 0;
    selfLink = ""
  }

  let render x =
    [render_int_value "totalItems" x.totalItems;
     render_string_value "selfLink" x.selfLink]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "totalItems"; data_type = Scalar },
           Json_type.Int v) ->
          { x with totalItems = v }
      | AnnotatedTree.Leaf
          ({ name = "selfLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with selfLink = v }
      | e ->
          unexpected "GapiPlus.ActionData.parse" e

end

module ProviderData =
struct
  type t = {
    title : string
  }

  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v _ -> { title = v })
  }

  let empty = {
    title = ""
  }

  let render x =
    render_object "provider"
      [render_string_value "title" x.title]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { title = v }
      | e ->
          unexpected "GapiPlus.ProviderData.parse" e

end

module ObjectData =
struct
  type t = {
    objectType : string;
    id : string;
    actor : ActorData.t;
    content : string;
    originalContent : string;
    url : string;
    replies : ActionData.t;
    plusoners : ActionData.t;
    resharers :  ActionData.t;
    attachments : AttachmentsData.t list
  }

  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let actor = {
    GapiLens.get = (fun x -> x.actor);
    GapiLens.set = (fun v x -> { x with actor = v })
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v })
  }
  let originalContent = {
    GapiLens.get = (fun x -> x.originalContent);
    GapiLens.set = (fun v x -> { x with originalContent = v })
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v })
  }
  let plusoners = {
    GapiLens.get = (fun x -> x.plusoners);
    GapiLens.set = (fun v x -> { x with plusoners = v })
  }
  let resharers = {
    GapiLens.get = (fun x -> x.resharers);
    GapiLens.set = (fun v x -> { x with resharers = v })
  }
  let attachments = {
    GapiLens.get = (fun x -> x.attachments);
    GapiLens.set = (fun v x -> { x with attachments = v })
  }

  let empty = {
    objectType = "";
    id = "";
    actor = ActorData.empty;
    content = "";
    originalContent = "";
    url = "";
    replies = ActionData.empty;
    plusoners = ActionData.empty;
    resharers = ActionData.empty;
    attachments = []
  }

  let render x =
    render_object "object"
      [render_string_value "objectType" x.objectType;
       render_string_value "id" x.id;
       ActorData.render x.actor;
       render_string_value "content" x.content;
       render_string_value "originalContent" x.originalContent;
       render_string_value "url" x.url;
       render_object "replies" (ActionData.render x.replies);
       render_object "plusoners" (ActionData.render x.plusoners);
       render_object "resharers" (ActionData.render x.resharers);
       render_array "attachments" AttachmentsData.render x.attachments]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "objectType"; data_type = Scalar },
           Json_type.String v) ->
          { x with objectType = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Node
          ({ name = "actor"; data_type = Object },
           cs) ->
          parse_children
            ActorData.parse
            ActorData.empty
            (fun s -> { x with actor = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "content"; data_type = Scalar },
           Json_type.String v) ->
          { x with content = v }
      | AnnotatedTree.Leaf
          ({ name = "originalContent"; data_type = Scalar },
           Json_type.String v) ->
          { x with originalContent = v }
      | AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Node
          ({ name = "replies"; data_type = Object },
           cs) ->
          parse_children
            ActionData.parse
            ActionData.empty
            (fun s -> { x with replies = s })
            cs
      | AnnotatedTree.Node
          ({ name = "plusoners"; data_type = Object },
           cs) ->
          parse_children
            ActionData.parse
            ActionData.empty
            (fun s -> { x with plusoners = s })
            cs
      | AnnotatedTree.Node
          ({ name = "resharers"; data_type = Object },
           cs) ->
          parse_children
            ActionData.parse
            ActionData.empty
            (fun s -> { x with resharers = s })
            cs
      | AnnotatedTree.Node
          ({ name = "attachments"; data_type = Array },
           cs) ->
          parse_collection
            AttachmentsData.parse
            AttachmentsData.empty
            (fun xs -> { x with attachments = xs })
            cs
      | e ->
          unexpected "GapiPlus.ObjectData.parse" e

end

module Activity =
struct
  type t = {
    kind : string;
    placeholder : bool;
    title : string;
    published : GapiDate.t;
    updated : GapiDate.t;
    id : string;
    url : string;
    actor : ActorData.t;
    verb : string;
    _object : ObjectData.t;
    annotation : string;
    crosspostSource : string;
    provider : ProviderData.t;
    access : Acl.t;
    geocode : string;
    address : string;
    radius : string;
    placeId : string;
    placeName : string
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let placeholder = {
    GapiLens.get = (fun x -> x.placeholder);
    GapiLens.set = (fun v x -> { x with placeholder = v })
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v })
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v })
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let actor = {
    GapiLens.get = (fun x -> x.actor);
    GapiLens.set = (fun v x -> { x with actor = v })
  }
  let verb = {
    GapiLens.get = (fun x -> x.verb);
    GapiLens.set = (fun v x -> { x with verb = v })
  }
  let _object = {
    GapiLens.get = (fun x -> x._object);
    GapiLens.set = (fun v x -> { x with _object = v })
  }
  let annotation = {
    GapiLens.get = (fun x -> x.annotation);
    GapiLens.set = (fun v x -> { x with annotation = v })
  }
  let crosspostSource = {
    GapiLens.get = (fun x -> x.crosspostSource);
    GapiLens.set = (fun v x -> { x with crosspostSource = v })
  }
  let provider = {
    GapiLens.get = (fun x -> x.provider);
    GapiLens.set = (fun v x -> { x with provider = v })
  }
  let access = {
    GapiLens.get = (fun x -> x.access);
    GapiLens.set = (fun v x -> { x with access = v })
  }
  let geocode = {
    GapiLens.get = (fun x -> x.geocode);
    GapiLens.set = (fun v x -> { x with geocode = v })
  }
  let address = {
    GapiLens.get = (fun x -> x.address);
    GapiLens.set = (fun v x -> { x with address = v })
  }
  let radius = {
    GapiLens.get = (fun x -> x.radius);
    GapiLens.set = (fun v x -> { x with radius = v })
  }
  let placeId = {
    GapiLens.get = (fun x -> x.placeId);
    GapiLens.set = (fun v x -> { x with placeId = v })
  }
  let placeName = {
    GapiLens.get = (fun x -> x.placeName);
    GapiLens.set = (fun v x -> { x with placeName = v })
  }

  let empty = {
    kind = "";
    placeholder = false;
    title = "";
    published = GapiDate.epoch;
    updated = GapiDate.epoch;
    id = "";
    url = "";
    actor = ActorData.empty;
    verb = "";
    _object = ObjectData.empty;
    annotation = "";
    crosspostSource = "";
    provider = ProviderData.empty;
    access = Acl.empty;
    geocode = "";
    address = "";
    radius = "";
    placeId = "";
    placeName = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_bool_value "placeholder" x.placeholder;
       render_string_value "title" x.title;
       render_date_value "published" x.published;
       render_date_value "updated" x.updated;
       render_string_value "id" x.id;
       render_string_value "url" x.url;
       ActorData.render x.actor;
       render_string_value "verb" x.verb;
       ObjectData.render x._object;
       render_string_value "annotation" x.annotation;
       render_string_value "crosspostSource" x.crosspostSource;
       ProviderData.render x.provider;
       Acl.render x.access;
       render_string_value "geocode" x.geocode;
       render_string_value "address" x.address;
       render_string_value "radius" x.radius;
       render_string_value "placeId" x.placeId;
       render_string_value "placeName" x.placeName]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "placeholder"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with placeholder = v }
      | AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ name = "published"; data_type = Scalar },
           Json_type.String v) ->
          { x with published = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Node
          ({ name = "actor"; data_type = Object },
           cs) ->
          parse_children
            ActorData.parse
            ActorData.empty
            (fun s -> { x with actor = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "verb"; data_type = Scalar },
           Json_type.String v) ->
          { x with verb = v }
      | AnnotatedTree.Node
          ({ name = "object"; data_type = Object },
           cs) ->
          parse_children
            ObjectData.parse
            ObjectData.empty
            (fun s -> { x with _object = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "annotation"; data_type = Scalar },
           Json_type.String v) ->
          { x with annotation = v }
      | AnnotatedTree.Leaf
          ({ name = "crosspostSource"; data_type = Scalar },
           Json_type.String v) ->
          { x with crosspostSource = v }
      | AnnotatedTree.Node
          ({ name = "provider"; data_type = Object },
           cs) ->
          parse_children
            ProviderData.parse
            ProviderData.empty
            (fun s -> { x with provider = s })
            cs
      | AnnotatedTree.Node
          ({ name = "access"; data_type = Object },
           cs) ->
          parse_children
            Acl.parse
            Acl.empty
            (fun s -> { x with access = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "geocode"; data_type = Scalar },
           Json_type.String v) ->
          { x with geocode = v }
      | AnnotatedTree.Leaf
          ({ name = "address"; data_type = Scalar },
           Json_type.String v) ->
          { x with address = v }
      | AnnotatedTree.Leaf
          ({ name = "radius"; data_type = Scalar },
           Json_type.String v) ->
          { x with radius = v }
      | AnnotatedTree.Leaf
          ({ name = "placeId"; data_type = Scalar },
           Json_type.String v) ->
          { x with placeId = v }
      | AnnotatedTree.Leaf
          ({ name = "placeName"; data_type = Scalar },
           Json_type.String v) ->
          { x with placeName = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.Activity.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module ActivityFeed =
struct
  type t = {
    kind : string;
    nextPageToken : string;
    selfLink : string;
    nextLink : string;
    title : string;
    updated : GapiDate.t;
    id : string;
    items : Activity.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v })
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v })
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v })
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v })
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v })
  }

  let empty = {
    kind = "";
    nextPageToken = "";
    selfLink = "";
    nextLink = "";
    title = "";
    updated = GapiDate.epoch;
    id = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "nextPageToken" x.nextPageToken;
       render_string_value "selfLink" x.selfLink;
       render_string_value "nextLink" x.nextLink;
       render_string_value "title" x.title;
       render_date_value "updated" x.updated;
       render_string_value "id" x.id;
       render_array "items" Activity.render x.items]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Leaf
          ({ name = "selfLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with selfLink = v }
      | AnnotatedTree.Leaf
          ({ name = "nextLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextLink = v }
      | AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            Activity.parse
            Activity.empty
            (fun xs -> { x with items = xs })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.ActivityFeed.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Comments *)

module InReplyToData =
struct
  type t = {
    id : string;
    url : string
  }

  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }

  let empty = {
    id = "";
    url = ""
  }

  let render x =
    render_object ""
      [render_string_value "id" x.id;
       render_string_value "url" x.url]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.InReplyToData.parse" e

end

module CommentObjectData =
struct
  type t = {
    objectType : string;
    content : string
  }

  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v })
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v })
  }

  let empty = {
    objectType = "";
    content = ""
  }

  let render x =
    render_object "object"
      [render_string_value "objectType" x.objectType;
       render_string_value "content" x.content]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "objectType"; data_type = Scalar },
           Json_type.String v) ->
          { x with objectType = v }
      | AnnotatedTree.Leaf
          ({ name = "content"; data_type = Scalar },
           Json_type.String v) ->
          { x with content = v }
      | AnnotatedTree.Node
          ({ name = "object"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.CommentObjectData.parse" e

end

module Comment =
struct
  type t = {
    kind : string;
    id : string;
    published : GapiDate.t;
    updated : GapiDate.t;
    actor : ActorData.t;
    verb : string;
    _object : CommentObjectData.t;
    selfLink : string;
    inReplyTo : InReplyToData.t list
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let published = {
		GapiLens.get = (fun x -> x.published);
		GapiLens.set = (fun v x -> { x with published = v })
	}
	let updated = {
		GapiLens.get = (fun x -> x.updated);
		GapiLens.set = (fun v x -> { x with updated = v })
	}
	let actor = {
		GapiLens.get = (fun x -> x.actor);
		GapiLens.set = (fun v x -> { x with actor = v })
	}
	let verb = {
		GapiLens.get = (fun x -> x.verb);
		GapiLens.set = (fun v x -> { x with verb = v })
	}
	let _object = {
		GapiLens.get = (fun x -> x._object);
		GapiLens.set = (fun v x -> { x with _object = v })
	}
	let selfLink = {
		GapiLens.get = (fun x -> x.selfLink);
		GapiLens.set = (fun v x -> { x with selfLink = v })
	}
	let inReplyTo = {
		GapiLens.get = (fun x -> x.inReplyTo);
		GapiLens.set = (fun v x -> { x with inReplyTo = v })
	}

  let empty = {
    kind = "";
    id = "";
    published = GapiDate.epoch;
    updated = GapiDate.epoch;
    actor = ActorData.empty;
    verb = "";
    _object = CommentObjectData.empty;
    selfLink = "";
    inReplyTo = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "id" x.id;
       render_date_value "published" x.published;
       render_date_value "updated" x.updated;
       ActorData.render x.actor;
       render_string_value "verb" x.verb;
       CommentObjectData.render x._object;
       render_string_value "selfLink" x.selfLink;
       render_array "inReplyTo" InReplyToData.render x.inReplyTo]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "published"; data_type = Scalar },
           Json_type.String v) ->
          { x with published = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
      | AnnotatedTree.Node
          ({ name = "actor"; data_type = Object },
           cs) ->
          parse_children
            ActorData.parse
            ActorData.empty
            (fun s -> { x with actor = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "verb"; data_type = Scalar },
           Json_type.String v) ->
          { x with verb = v }
      | AnnotatedTree.Node
          ({ name = "object"; data_type = Object },
           cs) ->
          parse_children
            CommentObjectData.parse
            CommentObjectData.empty
            (fun s -> { x with _object = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "selfLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with selfLink = v }
      | AnnotatedTree.Node
          ({ name = "inReplyTo"; data_type = Array },
           cs) ->
          parse_collection
            InReplyToData.parse
            InReplyToData.empty
            (fun s -> { x with inReplyTo = s })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.Comment.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module CommentFeed =
struct
  type t = {
    kind : string;
    nextPageToken : string;
    nextLink : string;
    title : string;
    updated : GapiDate.t;
    id : string;
    items : Comment.t list
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let nextPageToken = {
		GapiLens.get = (fun x -> x.nextPageToken);
		GapiLens.set = (fun v x -> { x with nextPageToken = v })
	}
	let nextLink = {
		GapiLens.get = (fun x -> x.nextLink);
		GapiLens.set = (fun v x -> { x with nextLink = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let updated = {
		GapiLens.get = (fun x -> x.updated);
		GapiLens.set = (fun v x -> { x with updated = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let items = {
		GapiLens.get = (fun x -> x.items);
		GapiLens.set = (fun v x -> { x with items = v })
	}

  let empty = {
    kind = "";
    nextPageToken = "";
    nextLink = "";
    title = "";
    updated = GapiDate.epoch;
    id = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "nextPageToken" x.nextPageToken;
       render_string_value "nextLink" x.nextLink;
       render_string_value "title" x.title;
       render_date_value "updated" x.updated;
       render_string_value "id" x.id;
       render_array "items" Comment.render x.items]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Leaf
          ({ name = "nextLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextLink = v }
      | AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            Comment.parse
            Comment.empty
            (fun xs -> { x with items = xs })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.CommentFeed.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* People *)

module EmailsData =
struct
  type t = {
    value : string;
    _type : string;
    primary : bool
  }

	let value = {
		GapiLens.get = (fun x -> x.value);
		GapiLens.set = (fun v x -> { x with value = v })
	}
	let _type = {
		GapiLens.get = (fun x -> x._type);
		GapiLens.set = (fun v x -> { x with _type = v })
	}
	let primary = {
		GapiLens.get = (fun x -> x.primary);
		GapiLens.set = (fun v x -> { x with primary = v })
	}

  let empty = {
    value = "";
    _type = "";
    primary = false
  }

  let render x =
    render_object ""
      [render_string_value "value" x.value;
       render_string_value "type" x._type;
       render_bool_value "primary" x.primary]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "value"; data_type = Scalar },
           Json_type.String v) ->
          { x with value = v }
      | AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "primary"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with primary = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.EmailsData.parse" e
end

module NameData =
struct
  type t = {
    formatted : string;
    familyName : string;
    givenName : string;
    middleName : string;
    honorificPrefix : string;
    honorificSuffix : string
  }

	let formatted = {
		GapiLens.get = (fun x -> x.formatted);
		GapiLens.set = (fun v x -> { x with formatted = v })
	}
	let familyName = {
		GapiLens.get = (fun x -> x.familyName);
		GapiLens.set = (fun v x -> { x with familyName = v })
	}
	let givenName = {
		GapiLens.get = (fun x -> x.givenName);
		GapiLens.set = (fun v x -> { x with givenName = v })
	}
	let middleName = {
		GapiLens.get = (fun x -> x.middleName);
		GapiLens.set = (fun v x -> { x with middleName = v })
	}
	let honorificPrefix = {
		GapiLens.get = (fun x -> x.honorificPrefix);
		GapiLens.set = (fun v x -> { x with honorificPrefix = v })
	}
	let honorificSuffix = {
		GapiLens.get = (fun x -> x.honorificSuffix);
		GapiLens.set = (fun v x -> { x with honorificSuffix = v })
	}

  let empty = {
    formatted = "";
    familyName = "";
    givenName = "";
    middleName = "";
    honorificPrefix = "";
    honorificSuffix = ""
  }

  let render x =
    render_object "name"
      [render_string_value "formatted" x.formatted;
       render_string_value "familyName" x.familyName;
       render_string_value "givenName" x.givenName;
       render_string_value "middleName" x.middleName;
       render_string_value "honorificPrefix" x.honorificPrefix;
       render_string_value "honorificSuffix" x.honorificSuffix]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "formatted"; data_type = Scalar },
           Json_type.String v) ->
          { x with formatted = v }
      | AnnotatedTree.Leaf
          ({ name = "familyName"; data_type = Scalar },
           Json_type.String v) ->
          { x with familyName = v }
      | AnnotatedTree.Leaf
          ({ name = "givenName"; data_type = Scalar },
           Json_type.String v) ->
          { x with givenName = v }
      | AnnotatedTree.Leaf
          ({ name = "middleName"; data_type = Scalar },
           Json_type.String v) ->
          { x with middleName = v }
      | AnnotatedTree.Leaf
          ({ name = "honorificPrefix"; data_type = Scalar },
           Json_type.String v) ->
          { x with honorificPrefix = v }
      | AnnotatedTree.Leaf
          ({ name = "honorificSuffix"; data_type = Scalar },
           Json_type.String v) ->
          { x with honorificSuffix = v }
      | AnnotatedTree.Node
          ({ name = "name"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.NameData.parse" e

end

module OrganizationsData =
struct
  type t = {
    name : string;
    department : string;
    title : string;
    _type : string;
    startDate : string;
    endDate : string;
    location : string;
    description : string;
    primary : bool
  }

	let name = {
		GapiLens.get = (fun x -> x.name);
		GapiLens.set = (fun v x -> { x with name = v })
	}
	let department = {
		GapiLens.get = (fun x -> x.department);
		GapiLens.set = (fun v x -> { x with department = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let _type = {
		GapiLens.get = (fun x -> x._type);
		GapiLens.set = (fun v x -> { x with _type = v })
	}
	let startDate = {
		GapiLens.get = (fun x -> x.startDate);
		GapiLens.set = (fun v x -> { x with startDate = v })
	}
	let endDate = {
		GapiLens.get = (fun x -> x.endDate);
		GapiLens.set = (fun v x -> { x with endDate = v })
	}
	let location = {
		GapiLens.get = (fun x -> x.location);
		GapiLens.set = (fun v x -> { x with location = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
	}
	let primary = {
		GapiLens.get = (fun x -> x.primary);
		GapiLens.set = (fun v x -> { x with primary = v })
	}

  let empty = {
    name = "";
    department = "";
    title = "";
    _type = "";
    startDate = "";
    endDate = "";
    location = "";
    description = "";
    primary = false
  }

  let render x =
    render_object ""
      [render_string_value "name" x.name;
       render_string_value "department" x.department;
       render_string_value "title" x.title;
       render_string_value "type" x._type;
       render_string_value "startDate" x.startDate;
       render_string_value "endDate" x.endDate;
       render_string_value "location" x.location;
       render_string_value "description" x.description;
       render_bool_value "primary" x.primary]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = Scalar },
           Json_type.String v) ->
          { x with name = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "department"; data_type = Scalar },
           Json_type.String v) ->
          { x with department = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "startDate"; data_type = Scalar },
           Json_type.String v) ->
          { x with startDate = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "endDate"; data_type = Scalar },
           Json_type.String v) ->
          { x with endDate = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "location"; data_type = Scalar },
           Json_type.String v) ->
          { x with location = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "primary"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with primary = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.OrganizationsData.parse" e

end

module PlaceLivedData =
struct
  type t = {
    value : string;
    primary : bool
  }

	let value = {
		GapiLens.get = (fun x -> x.value);
		GapiLens.set = (fun v x -> { x with value = v })
	}
	let primary = {
		GapiLens.get = (fun x -> x.primary);
		GapiLens.set = (fun v x -> { x with primary = v })
	}

  let empty = {
    value = "";
    primary = false
  }

  let render x =
    render_object ""
      [render_string_value "value" x.value;
       render_bool_value "primary" x.primary]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "value"; data_type = Scalar },
           Json_type.String v) ->
          { x with value = v }
      | AnnotatedTree.Leaf
          ({ name = "primary"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with primary = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.PlaceLivedData.parse" e

end

module UrlsData =
struct
  type t = {
    value : string;
    _type : string;
    primary : bool
  }

	let value = {
		GapiLens.get = (fun x -> x.value);
		GapiLens.set = (fun v x -> { x with value = v })
	}
	let _type = {
		GapiLens.get = (fun x -> x._type);
		GapiLens.set = (fun v x -> { x with _type = v })
	}
	let primary = {
		GapiLens.get = (fun x -> x.primary);
		GapiLens.set = (fun v x -> { x with primary = v })
	}

  let empty = {
    value = "";
    _type = "";
    primary = false
  }

  let render x =
    render_object ""
      [render_string_value "value" x.value;
       render_string_value "type" x._type;
       render_bool_value "primary" x.primary]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "value"; data_type = Scalar },
           Json_type.String v) ->
          { x with value = v }
      | AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "primary"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with primary = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.UrlsData.parse" e

end

module Person =
struct
  type t = {
    kind : string;
    objectType : string;
    id : string;
    displayName : string;
    name : NameData.t;
    nickname : string;
    tagline : string;
    birthday : string;
    gender : string;
    aboutMe : string;
    currentLocation : string;
    relationshipStatus : string;
    url : string;
    image : ImageData.t;
    emails : EmailsData.t list;
    urls : UrlsData.t list;
    organizations : OrganizationsData.t list;
    placesLived : PlaceLivedData.t list;
    languagesSpoken : string list;
    hasApp : bool
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let objectType = {
		GapiLens.get = (fun x -> x.objectType);
		GapiLens.set = (fun v x -> { x with objectType = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let displayName = {
		GapiLens.get = (fun x -> x.displayName);
		GapiLens.set = (fun v x -> { x with displayName = v })
	}
	let name = {
		GapiLens.get = (fun x -> x.name);
		GapiLens.set = (fun v x -> { x with name = v })
	}
	let nickname = {
		GapiLens.get = (fun x -> x.nickname);
		GapiLens.set = (fun v x -> { x with nickname = v })
	}
	let tagline = {
		GapiLens.get = (fun x -> x.tagline);
		GapiLens.set = (fun v x -> { x with tagline = v })
	}
	let birthday = {
		GapiLens.get = (fun x -> x.birthday);
		GapiLens.set = (fun v x -> { x with birthday = v })
	}
	let gender = {
		GapiLens.get = (fun x -> x.gender);
		GapiLens.set = (fun v x -> { x with gender = v })
	}
	let aboutMe = {
		GapiLens.get = (fun x -> x.aboutMe);
		GapiLens.set = (fun v x -> { x with aboutMe = v })
	}
	let currentLocation = {
		GapiLens.get = (fun x -> x.currentLocation);
		GapiLens.set = (fun v x -> { x with currentLocation = v })
	}
	let relationshipStatus = {
		GapiLens.get = (fun x -> x.relationshipStatus);
		GapiLens.set = (fun v x -> { x with relationshipStatus = v })
	}
	let url = {
		GapiLens.get = (fun x -> x.url);
		GapiLens.set = (fun v x -> { x with url = v })
	}
	let image = {
		GapiLens.get = (fun x -> x.image);
		GapiLens.set = (fun v x -> { x with image = v })
	}
	let emails = {
		GapiLens.get = (fun x -> x.emails);
		GapiLens.set = (fun v x -> { x with emails = v })
	}
	let urls = {
		GapiLens.get = (fun x -> x.urls);
		GapiLens.set = (fun v x -> { x with urls = v })
	}
	let organizations = {
		GapiLens.get = (fun x -> x.organizations);
		GapiLens.set = (fun v x -> { x with organizations = v })
	}
	let placesLived = {
		GapiLens.get = (fun x -> x.placesLived);
		GapiLens.set = (fun v x -> { x with placesLived = v })
	}
	let languagesSpoken = {
		GapiLens.get = (fun x -> x.languagesSpoken);
		GapiLens.set = (fun v x -> { x with languagesSpoken = v })
	}
	let hasApp = {
		GapiLens.get = (fun x -> x.hasApp);
		GapiLens.set = (fun v x -> { x with hasApp = v })
	}

  let empty = {
    kind = "";
    objectType = "";
    id = "";
    displayName = "";
    name = NameData.empty;
    nickname = "";
    tagline = "";
    birthday = "";
    gender = "";
    aboutMe = "";
    currentLocation = "";
    relationshipStatus = "";
    url = "";
    image = ImageData.empty;
    emails = [];
    urls = [];
    organizations = [];
    placesLived = [];
    languagesSpoken = [];
    hasApp = false
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "objectType" x.objectType;
       render_string_value "id" x.id;
       render_string_value "displayName" x.displayName;
       NameData.render x.name;
       render_string_value "nickname" x.nickname;
       render_string_value "tagline" x.tagline;
       render_string_value "birthday" x.birthday;
       render_string_value "gender" x.gender;
       render_string_value "aboutMe" x.aboutMe;
       render_string_value "currentLocation" x.currentLocation;
       render_string_value "relationshipStatus" x.relationshipStatus;
       render_string_value "url" x.url;
       ImageData.render x.image;
       render_array "emails" EmailsData.render x.emails;
       render_array "urls" UrlsData.render x.urls;
       render_array "organizations" OrganizationsData.render x.organizations;
       render_array "placesLived" PlaceLivedData.render x.placesLived;
       render_array "languagesSpoken" (render_string_value "") x.languagesSpoken;
       render_bool_value "hasApp" x.hasApp]

  let parse_languageSpoken _ = function
      AnnotatedTree.Leaf
        ({ GapiJson.name = ""; data_type = Scalar },
         Json_type.String v) ->
        v
    | e ->
        unexpected "GapiPlus.Person.parse_languagesSpoken" e

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ GapiJson.name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "objectType"; data_type = Scalar },
           Json_type.String v) ->
          { x with objectType = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = Scalar },
           Json_type.String v) ->
          { x with displayName = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "name"; data_type = Object },
           cs) ->
          parse_children
            NameData.parse
            NameData.empty
            (fun xs -> { x with name = xs })
            cs
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "nickname"; data_type = Scalar },
           Json_type.String v) ->
          { x with nickname = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "tagline"; data_type = Scalar },
           Json_type.String v) ->
          { x with tagline = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "birthday"; data_type = Scalar },
           Json_type.String v) ->
          { x with birthday = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "gender"; data_type = Scalar },
           Json_type.String v) ->
          { x with gender = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "aboutMe"; data_type = Scalar },
           Json_type.String v) ->
          { x with aboutMe = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "currentLocation"; data_type = Scalar },
           Json_type.String v) ->
          { x with currentLocation = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "relationshipStatus"; data_type = Scalar },
           Json_type.String v) ->
          { x with relationshipStatus = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = Scalar },
           Json_type.String v) ->
          { x with url = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "image"; data_type = Object },
           cs) ->
          parse_children
            ImageData.parse
            ImageData.empty
            (fun xs -> { x with image = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "emails"; data_type = Array },
           cs) ->
          parse_collection
            EmailsData.parse
            EmailsData.empty
            (fun xs -> { x with emails = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "urls"; data_type = Array },
           cs) ->
          parse_collection
            UrlsData.parse
            UrlsData.empty
            (fun xs -> { x with urls = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "organizations"; data_type = Array },
           cs) ->
          parse_collection
            OrganizationsData.parse
            OrganizationsData.empty
            (fun xs -> { x with organizations = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "placesLived"; data_type = Array },
           cs) ->
          parse_collection
            PlaceLivedData.parse
            PlaceLivedData.empty
            (fun xs -> { x with placesLived = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "languagesSpoken"; data_type = Array },
           cs) ->
          parse_collection
            parse_languageSpoken
            ""
            (fun xs -> { x with languagesSpoken = xs })
            cs
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "hasApp"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with hasApp = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.Person.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module PeopleFeed =
struct
  type t = {
    kind : string;
    selfLink : string;
    title : string;
    nextPageToken : string;
    items : Person.t list
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let selfLink = {
		GapiLens.get = (fun x -> x.selfLink);
		GapiLens.set = (fun v x -> { x with selfLink = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let nextPageToken = {
		GapiLens.get = (fun x -> x.nextPageToken);
		GapiLens.set = (fun v x -> { x with nextPageToken = v })
	}
	let items = {
		GapiLens.get = (fun x -> x.items);
		GapiLens.set = (fun v x -> { x with items = v })
	}

  let empty = {
    kind = "";
    selfLink = "";
    title = "";
    nextPageToken = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "selfLink" x.selfLink;
       render_string_value "title" x.title;
       render_string_value "nextPageToken" x.nextPageToken;
       render_array "items" Person.render x.items]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "selfLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with selfLink = v }
      | AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            Person.parse
            Person.empty
            (fun xs -> { x with items = xs })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiPlus.PeopleFeed.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

