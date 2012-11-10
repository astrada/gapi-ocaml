(* Warning! This file is generated. Modify at your own risk. *)

module Blog =
struct
  module Posts =
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
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with selfLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with totalItems = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Posts.parse" e x
    
  end
  
  module Pages =
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
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with selfLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with totalItems = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Pages.parse" e x
    
  end
  
  module Locale =
  struct
    type t = {
      country : string;
      language : string;
      variant : string;
      
    }
    
    let country = {
      GapiLens.get = (fun x -> x.country);
      GapiLens.set = (fun v x -> { x with country = v });
    }
    let language = {
      GapiLens.get = (fun x -> x.language);
      GapiLens.set = (fun v x -> { x with language = v });
    }
    let variant = {
      GapiLens.get = (fun x -> x.variant);
      GapiLens.set = (fun v x -> { x with variant = v });
    }
    
    let empty = {
      country = "";
      language = "";
      variant = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "country" x.country;
        GapiJson.render_string_value "language" x.language;
        GapiJson.render_string_value "variant" x.variant;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "country"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with country = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "language"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with language = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "variant"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with variant = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Locale.parse" e x
    
  end
  
  type t = {
    description : string;
    id : int64;
    kind : string;
    locale : Locale.t;
    name : string;
    pages : Pages.t;
    posts : Posts.t;
    published : GapiDate.t;
    selfLink : string;
    updated : GapiDate.t;
    url : string;
    
  }
  
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let locale = {
    GapiLens.get = (fun x -> x.locale);
    GapiLens.set = (fun v x -> { x with locale = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let pages = {
    GapiLens.get = (fun x -> x.pages);
    GapiLens.set = (fun v x -> { x with pages = v });
  }
  let posts = {
    GapiLens.get = (fun x -> x.posts);
    GapiLens.set = (fun v x -> { x with posts = v });
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
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    description = "";
    id = 0L;
    kind = "";
    locale = Locale.empty;
    name = "";
    pages = Pages.empty;
    posts = Posts.empty;
    published = GapiDate.epoch;
    selfLink = "";
    updated = GapiDate.epoch;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_int64_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "locale" (Locale.render_content v)) x.locale;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "pages" (Pages.render_content v)) x.pages;
      (fun v -> GapiJson.render_object "posts" (Posts.render_content v)) x.posts;
      GapiJson.render_date_value "published" x.published;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "url" x.url;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "locale"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Locale.parse
        Locale.empty
        (fun v -> { x with locale = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pages"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Pages.parse
        Pages.empty
        (fun v -> { x with pages = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "posts"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Posts.parse
        Posts.empty
        (fun v -> { x with posts = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with published = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.Blog.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BlogList =
struct
  type t = {
    items : Blog.t list;
    kind : string;
    
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
    items = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Blog.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Blog.parse Blog.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiBloggerV2Model.BlogList.parse.parse_collection" e x')
        Blog.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.BlogList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Post =
struct
  module Replies =
  struct
    type t = {
      selfLink : string;
      totalItems : int64;
      
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
      totalItems = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "selfLink" x.selfLink;
        GapiJson.render_int64_value "totalItems" x.totalItems;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with selfLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with totalItems = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Replies.parse" e x
    
  end
  
  module Blog =
  struct
    type t = {
      id : int64;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      id = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Blog.parse" e x
    
  end
  
  module Author =
  struct
    module Image =
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
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with url = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiBloggerV2Model.Image.parse" e x
      
    end
    
    type t = {
      displayName : string;
      id : string;
      image : Image.t;
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
      image = Image.empty;
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "id" x.id;
        (fun v -> GapiJson.render_object "image" (Image.render_content v)) x.image;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "image"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Image.parse
          Image.empty
          (fun v -> { x with image = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Author.parse" e x
    
  end
  
  type t = {
    author : Author.t;
    blog : Blog.t;
    content : string;
    id : int64;
    kind : string;
    labels : string list;
    published : GapiDate.t;
    replies : Replies.t;
    selfLink : string;
    title : string;
    updated : GapiDate.t;
    url : string;
    
  }
  
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let blog = {
    GapiLens.get = (fun x -> x.blog);
    GapiLens.set = (fun v x -> { x with blog = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
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
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    author = Author.empty;
    blog = Blog.empty;
    content = "";
    id = 0L;
    kind = "";
    labels = [];
    published = GapiDate.epoch;
    replies = Replies.empty;
    selfLink = "";
    title = "";
    updated = GapiDate.epoch;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "author" (Author.render_content v)) x.author;
      (fun v -> GapiJson.render_object "blog" (Blog.render_content v)) x.blog;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_int64_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "labels" (GapiJson.render_string_value "") x.labels;
      GapiJson.render_date_value "published" x.published;
      (fun v -> GapiJson.render_object "replies" (Replies.render_content v)) x.replies;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "url" x.url;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "author"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Author.parse
        Author.empty
        (fun v -> { x with author = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "blog"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Blog.parse
        Blog.empty
        (fun v -> { x with blog = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiBloggerV2Model.Post.parse.parse_collection" e x')
        ""
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with published = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "replies"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Replies.parse
        Replies.empty
        (fun v -> { x with replies = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.Post.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Comment =
struct
  module Post =
  struct
    type t = {
      id : int64;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      id = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Post.parse" e x
    
  end
  
  module InReplyTo =
  struct
    type t = {
      id : int64;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      id = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.InReplyTo.parse" e x
    
  end
  
  module Blog =
  struct
    type t = {
      id : int64;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      id = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Blog.parse" e x
    
  end
  
  module Author =
  struct
    module Image =
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
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with url = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiBloggerV2Model.Image.parse" e x
      
    end
    
    type t = {
      displayName : string;
      id : string;
      image : Image.t;
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
      image = Image.empty;
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "id" x.id;
        (fun v -> GapiJson.render_object "image" (Image.render_content v)) x.image;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "image"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Image.parse
          Image.empty
          (fun v -> { x with image = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Author.parse" e x
    
  end
  
  type t = {
    author : Author.t;
    blog : Blog.t;
    content : string;
    id : int64;
    inReplyTo : InReplyTo.t;
    kind : string;
    post : Post.t;
    published : GapiDate.t;
    selfLink : string;
    updated : GapiDate.t;
    
  }
  
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let blog = {
    GapiLens.get = (fun x -> x.blog);
    GapiLens.set = (fun v x -> { x with blog = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
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
  let post = {
    GapiLens.get = (fun x -> x.post);
    GapiLens.set = (fun v x -> { x with post = v });
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
  
  let empty = {
    author = Author.empty;
    blog = Blog.empty;
    content = "";
    id = 0L;
    inReplyTo = InReplyTo.empty;
    kind = "";
    post = Post.empty;
    published = GapiDate.epoch;
    selfLink = "";
    updated = GapiDate.epoch;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "author" (Author.render_content v)) x.author;
      (fun v -> GapiJson.render_object "blog" (Blog.render_content v)) x.blog;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_int64_value "id" x.id;
      (fun v -> GapiJson.render_object "inReplyTo" (InReplyTo.render_content v)) x.inReplyTo;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "post" (Post.render_content v)) x.post;
      GapiJson.render_date_value "published" x.published;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "author"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Author.parse
        Author.empty
        (fun v -> { x with author = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "blog"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Blog.parse
        Blog.empty
        (fun v -> { x with blog = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "inReplyTo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        InReplyTo.parse
        InReplyTo.empty
        (fun v -> { x with inReplyTo = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "post"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Post.parse
        Post.empty
        (fun v -> { x with post = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with published = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.Comment.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentList =
struct
  type t = {
    items : Comment.t list;
    kind : string;
    nextPageToken : string;
    prevPageToken : string;
    
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
  let prevPageToken = {
    GapiLens.get = (fun x -> x.prevPageToken);
    GapiLens.set = (fun v x -> { x with prevPageToken = v });
  }
  
  let empty = {
    items = [];
    kind = "";
    nextPageToken = "";
    prevPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Comment.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "prevPageToken" x.prevPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Comment.parse
              Comment.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiBloggerV2Model.CommentList.parse.parse_collection" e x')
        Comment.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "prevPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with prevPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.CommentList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PostList =
struct
  type t = {
    items : Post.t list;
    kind : string;
    nextPageToken : string;
    prevPageToken : string;
    
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
  let prevPageToken = {
    GapiLens.get = (fun x -> x.prevPageToken);
    GapiLens.set = (fun v x -> { x with prevPageToken = v });
  }
  
  let empty = {
    items = [];
    kind = "";
    nextPageToken = "";
    prevPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Post.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "prevPageToken" x.prevPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Post.parse Post.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiBloggerV2Model.PostList.parse.parse_collection" e x')
        Post.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "prevPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with prevPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.PostList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Page =
struct
  module Blog =
  struct
    type t = {
      id : int64;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      id = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Blog.parse" e x
    
  end
  
  module Author =
  struct
    module Image =
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
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with url = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiBloggerV2Model.Image.parse" e x
      
    end
    
    type t = {
      displayName : string;
      id : string;
      image : Image.t;
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
      image = Image.empty;
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "id" x.id;
        (fun v -> GapiJson.render_object "image" (Image.render_content v)) x.image;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "image"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Image.parse
          Image.empty
          (fun v -> { x with image = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Author.parse" e x
    
  end
  
  type t = {
    author : Author.t;
    blog : Blog.t;
    content : string;
    id : int64;
    kind : string;
    published : GapiDate.t;
    selfLink : string;
    title : string;
    updated : GapiDate.t;
    url : string;
    
  }
  
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let blog = {
    GapiLens.get = (fun x -> x.blog);
    GapiLens.set = (fun v x -> { x with blog = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
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
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    author = Author.empty;
    blog = Blog.empty;
    content = "";
    id = 0L;
    kind = "";
    published = GapiDate.epoch;
    selfLink = "";
    title = "";
    updated = GapiDate.epoch;
    url = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "author" (Author.render_content v)) x.author;
      (fun v -> GapiJson.render_object "blog" (Blog.render_content v)) x.blog;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_int64_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "published" x.published;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "url" x.url;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "author"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Author.parse
        Author.empty
        (fun v -> { x with author = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "blog"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Blog.parse
        Blog.empty
        (fun v -> { x with blog = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with published = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.Page.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PageList =
struct
  type t = {
    items : Page.t list;
    kind : string;
    
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
    items = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Page.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Page.parse Page.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiBloggerV2Model.PageList.parse.parse_collection" e x')
        Page.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.PageList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module User =
struct
  module Locale =
  struct
    type t = {
      country : string;
      language : string;
      variant : string;
      
    }
    
    let country = {
      GapiLens.get = (fun x -> x.country);
      GapiLens.set = (fun v x -> { x with country = v });
    }
    let language = {
      GapiLens.get = (fun x -> x.language);
      GapiLens.set = (fun v x -> { x with language = v });
    }
    let variant = {
      GapiLens.get = (fun x -> x.variant);
      GapiLens.set = (fun v x -> { x with variant = v });
    }
    
    let empty = {
      country = "";
      language = "";
      variant = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "country" x.country;
        GapiJson.render_string_value "language" x.language;
        GapiJson.render_string_value "variant" x.variant;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "country"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with country = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "language"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with language = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "variant"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with variant = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Locale.parse" e x
    
  end
  
  module Blogs =
  struct
    type t = {
      selfLink : string;
      
    }
    
    let selfLink = {
      GapiLens.get = (fun x -> x.selfLink);
      GapiLens.set = (fun v x -> { x with selfLink = v });
    }
    
    let empty = {
      selfLink = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "selfLink" x.selfLink;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with selfLink = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiBloggerV2Model.Blogs.parse" e x
    
  end
  
  type t = {
    about : string;
    blogs : Blogs.t;
    created : GapiDate.t;
    displayName : string;
    id : string;
    kind : string;
    locale : Locale.t;
    selfLink : string;
    url : string;
    
  }
  
  let about = {
    GapiLens.get = (fun x -> x.about);
    GapiLens.set = (fun v x -> { x with about = v });
  }
  let blogs = {
    GapiLens.get = (fun x -> x.blogs);
    GapiLens.set = (fun v x -> { x with blogs = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let locale = {
    GapiLens.get = (fun x -> x.locale);
    GapiLens.set = (fun v x -> { x with locale = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    about = "";
    blogs = Blogs.empty;
    created = GapiDate.epoch;
    displayName = "";
    id = "";
    kind = "";
    locale = Locale.empty;
    selfLink = "";
    url = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "about" x.about;
      (fun v -> GapiJson.render_object "blogs" (Blogs.render_content v)) x.blogs;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "locale" (Locale.render_content v)) x.locale;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "url" x.url;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "about"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with about = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "blogs"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Blogs.parse
        Blogs.empty
        (fun v -> { x with blogs = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "locale"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Locale.parse
        Locale.empty
        (fun v -> { x with locale = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with url = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiBloggerV2Model.User.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

