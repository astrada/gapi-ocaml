(* Warning! This file is generated. Modify at your own risk. *)

module Promotion =
struct
  module ImageData =
  struct
    type t = {
      height : int;
      source : string;
      width : int;
      
    }
    
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let source = {
      GapiLens.get = (fun x -> x.source);
      GapiLens.set = (fun v x -> { x with source = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      height = 0;
      source = "";
      width = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int_value "height" x.height;
        GapiJson.render_string_value "source" x.source;
        GapiJson.render_int_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "source"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with source = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.ImageData.parse" e x
    
  end
  
  module BodyLinesData =
  struct
    type t = {
      link : string;
      title : string;
      url : string;
      
    }
    
    let link = {
      GapiLens.get = (fun x -> x.link);
      GapiLens.set = (fun v x -> { x with link = v });
    }
    let title = {
      GapiLens.get = (fun x -> x.title);
      GapiLens.set = (fun v x -> { x with title = v });
    }
    let url = {
      GapiLens.get = (fun x -> x.url);
      GapiLens.set = (fun v x -> { x with url = v });
    }
    
    let empty = {
      link = "";
      title = "";
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "link" x.link;
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with link = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.BodyLinesData.parse" e x
    
  end
  
  type t = {
    bodyLines : BodyLinesData.t list;
    displayLink : string;
    image : ImageData.t;
    link : string;
    title : string;
    
  }
  
  let bodyLines = {
    GapiLens.get = (fun x -> x.bodyLines);
    GapiLens.set = (fun v x -> { x with bodyLines = v });
  }
  let displayLink = {
    GapiLens.get = (fun x -> x.displayLink);
    GapiLens.set = (fun v x -> { x with displayLink = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let link = {
    GapiLens.get = (fun x -> x.link);
    GapiLens.set = (fun v x -> { x with link = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  
  let empty = {
    bodyLines = [];
    displayLink = "";
    image = ImageData.empty;
    link = "";
    title = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "bodyLines" BodyLinesData.render x.bodyLines;
      GapiJson.render_string_value "displayLink" x.displayLink;
      (fun v -> GapiJson.render_object "image" (ImageData.render_content v)) x.image;
      GapiJson.render_string_value "link" x.link;
      GapiJson.render_string_value "title" x.title;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bodyLines"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              BodyLinesData.parse
              BodyLinesData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Promotion.parse.parse_collection" e x')
        BodyLinesData.empty
        (fun v -> { x with bodyLines = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ImageData.parse
        ImageData.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with link = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCustomsearchV1Model.Promotion.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Query =
struct
  type t = {
    count : int;
    cr : string;
    cref : string;
    cx : string;
    filter : string;
    gl : string;
    googleHost : string;
    inputEncoding : string;
    language : string;
    outputEncoding : string;
    safe : string;
    searchTerms : string;
    sort : string;
    startIndex : int;
    startPage : int;
    title : string;
    totalResults : string;
    
  }
  
  let count = {
    GapiLens.get = (fun x -> x.count);
    GapiLens.set = (fun v x -> { x with count = v });
  }
  let cr = {
    GapiLens.get = (fun x -> x.cr);
    GapiLens.set = (fun v x -> { x with cr = v });
  }
  let cref = {
    GapiLens.get = (fun x -> x.cref);
    GapiLens.set = (fun v x -> { x with cref = v });
  }
  let cx = {
    GapiLens.get = (fun x -> x.cx);
    GapiLens.set = (fun v x -> { x with cx = v });
  }
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  let gl = {
    GapiLens.get = (fun x -> x.gl);
    GapiLens.set = (fun v x -> { x with gl = v });
  }
  let googleHost = {
    GapiLens.get = (fun x -> x.googleHost);
    GapiLens.set = (fun v x -> { x with googleHost = v });
  }
  let inputEncoding = {
    GapiLens.get = (fun x -> x.inputEncoding);
    GapiLens.set = (fun v x -> { x with inputEncoding = v });
  }
  let language = {
    GapiLens.get = (fun x -> x.language);
    GapiLens.set = (fun v x -> { x with language = v });
  }
  let outputEncoding = {
    GapiLens.get = (fun x -> x.outputEncoding);
    GapiLens.set = (fun v x -> { x with outputEncoding = v });
  }
  let safe = {
    GapiLens.get = (fun x -> x.safe);
    GapiLens.set = (fun v x -> { x with safe = v });
  }
  let searchTerms = {
    GapiLens.get = (fun x -> x.searchTerms);
    GapiLens.set = (fun v x -> { x with searchTerms = v });
  }
  let sort = {
    GapiLens.get = (fun x -> x.sort);
    GapiLens.set = (fun v x -> { x with sort = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let startPage = {
    GapiLens.get = (fun x -> x.startPage);
    GapiLens.set = (fun v x -> { x with startPage = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  
  let empty = {
    count = 0;
    cr = "";
    cref = "";
    cx = "";
    filter = "";
    gl = "";
    googleHost = "";
    inputEncoding = "";
    language = "";
    outputEncoding = "";
    safe = "";
    searchTerms = "";
    sort = "";
    startIndex = 0;
    startPage = 0;
    title = "";
    totalResults = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "count" x.count;
      GapiJson.render_string_value "cr" x.cr;
      GapiJson.render_string_value "cref" x.cref;
      GapiJson.render_string_value "cx" x.cx;
      GapiJson.render_string_value "filter" x.filter;
      GapiJson.render_string_value "gl" x.gl;
      GapiJson.render_string_value "googleHost" x.googleHost;
      GapiJson.render_string_value "inputEncoding" x.inputEncoding;
      GapiJson.render_string_value "language" x.language;
      GapiJson.render_string_value "outputEncoding" x.outputEncoding;
      GapiJson.render_string_value "safe" x.safe;
      GapiJson.render_string_value "searchTerms" x.searchTerms;
      GapiJson.render_string_value "sort" x.sort;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "startPage" x.startPage;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "totalResults" x.totalResults;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with count = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cr"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with cr = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cref"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with cref = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cx"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with cx = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filter"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with filter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "gl"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with gl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "googleHost"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with googleHost = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "inputEncoding"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with inputEncoding = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "language"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with language = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outputEncoding"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with outputEncoding = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "safe"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with safe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "searchTerms"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with searchTerms = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sort"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with sort = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startPage"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with startPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCustomsearchV1Model.Query.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Context =
struct
  module FacetsData =
  struct
    type t = {
      anchor : string;
      label : string;
      
    }
    
    let anchor = {
      GapiLens.get = (fun x -> x.anchor);
      GapiLens.set = (fun v x -> { x with anchor = v });
    }
    let label = {
      GapiLens.get = (fun x -> x.label);
      GapiLens.set = (fun v x -> { x with label = v });
    }
    
    let empty = {
      anchor = "";
      label = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "anchor" x.anchor;
        GapiJson.render_string_value "label" x.label;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "anchor"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with anchor = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with label = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.FacetsData.parse" e x
    
  end
  
  type t = {
    facets : FacetsData.t list list;
    title : string;
    
  }
  
  let facets = {
    GapiLens.get = (fun x -> x.facets);
    GapiLens.set = (fun v x -> { x with facets = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  
  let empty = {
    facets = [];
    title = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "facets" (GapiJson.render_array "" FacetsData.render) x.facets;
      GapiJson.render_string_value "title" x.title;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "facets"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Node
                    ({ GapiJson.name = ""; data_type = GapiJson.Object },
                    cs) ->
                  GapiJson.parse_children
                    FacetsData.parse
                    FacetsData.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiCustomsearchV1Model.Context.parse.parse_collection" e x')
              FacetsData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Context.parse.parse_collection" e x')
        []
        (fun v -> { x with facets = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCustomsearchV1Model.Context.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Result =
struct
  type t = {
    cacheId : string;
    displayLink : string;
    htmlSnippet : string;
    htmlTitle : string;
    kind : string;
    link : string;
    pagemap : (string * (string * string) list list) list;
    snippet : string;
    title : string;
    
  }
  
  let cacheId = {
    GapiLens.get = (fun x -> x.cacheId);
    GapiLens.set = (fun v x -> { x with cacheId = v });
  }
  let displayLink = {
    GapiLens.get = (fun x -> x.displayLink);
    GapiLens.set = (fun v x -> { x with displayLink = v });
  }
  let htmlSnippet = {
    GapiLens.get = (fun x -> x.htmlSnippet);
    GapiLens.set = (fun v x -> { x with htmlSnippet = v });
  }
  let htmlTitle = {
    GapiLens.get = (fun x -> x.htmlTitle);
    GapiLens.set = (fun v x -> { x with htmlTitle = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let link = {
    GapiLens.get = (fun x -> x.link);
    GapiLens.set = (fun v x -> { x with link = v });
  }
  let pagemap = {
    GapiLens.get = (fun x -> x.pagemap);
    GapiLens.set = (fun v x -> { x with pagemap = v });
  }
  let snippet = {
    GapiLens.get = (fun x -> x.snippet);
    GapiLens.set = (fun v x -> { x with snippet = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  
  let empty = {
    cacheId = "";
    displayLink = "";
    htmlSnippet = "";
    htmlTitle = "";
    kind = "";
    link = "";
    pagemap = [];
    snippet = "";
    title = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "cacheId" x.cacheId;
      GapiJson.render_string_value "displayLink" x.displayLink;
      GapiJson.render_string_value "htmlSnippet" x.htmlSnippet;
      GapiJson.render_string_value "htmlTitle" x.htmlTitle;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "link" x.link;
      GapiJson.render_collection "pagemap" GapiJson.Object (fun (id, v) -> GapiJson.render_array id (GapiJson.render_collection "" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v)) v) x.pagemap;
      GapiJson.render_string_value "snippet" x.snippet;
      GapiJson.render_string_value "title" x.title;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cacheId"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with cacheId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlSnippet"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with htmlSnippet = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlTitle"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with htmlTitle = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with link = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pagemap"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Node
                    ({ GapiJson.name = ""; data_type = GapiJson.Object },
                    cs) ->
                  GapiJson.parse_collection
                    (fun x' -> function
                      | GapiCore.AnnotatedTree.Leaf
                          ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                          Json_type.String v) ->
                        (n, v)
                      | e ->
                        GapiJson.unexpected "GapiCustomsearchV1Model.Result.parse.parse_dictionary" e x')
                    ("", "")
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiCustomsearchV1Model.Result.parse.parse_collection" e x')
              []
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Result.parse.parse_dictionary" e x')
        ("", [])
        (fun v -> { x with pagemap = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "snippet"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with snippet = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCustomsearchV1Model.Result.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Search =
struct
  module UrlData =
  struct
    type t = {
      template : string;
      _type : string;
      
    }
    
    let template = {
      GapiLens.get = (fun x -> x.template);
      GapiLens.set = (fun v x -> { x with template = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      template = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "template" x.template;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "template"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with template = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.UrlData.parse" e x
    
  end
  
  type t = {
    context : Context.t;
    items : Result.t list;
    kind : string;
    promotions : Promotion.t list;
    queries : (string * Query.t list) list;
    url : UrlData.t;
    
  }
  
  let context = {
    GapiLens.get = (fun x -> x.context);
    GapiLens.set = (fun v x -> { x with context = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let promotions = {
    GapiLens.get = (fun x -> x.promotions);
    GapiLens.set = (fun v x -> { x with promotions = v });
  }
  let queries = {
    GapiLens.get = (fun x -> x.queries);
    GapiLens.set = (fun v x -> { x with queries = v });
  }
  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v });
  }
  
  let empty = {
    context = Context.empty;
    items = [];
    kind = "";
    promotions = [];
    queries = [];
    url = UrlData.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "context" (Context.render_content v)) x.context;
      GapiJson.render_array "items" Result.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "promotions" Promotion.render x.promotions;
      GapiJson.render_collection "queries" GapiJson.Object (fun (id, v) -> GapiJson.render_array id Query.render v) x.queries;
      (fun v -> GapiJson.render_object "url" (UrlData.render_content v)) x.url;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "context"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Context.parse
        Context.empty
        (fun v -> { x with context = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Result.parse Result.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Search.parse.parse_collection" e x')
        Result.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "promotions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Promotion.parse
              Promotion.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Search.parse.parse_collection" e x')
        Promotion.empty
        (fun v -> { x with promotions = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "queries"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Node
                    ({ GapiJson.name = ""; data_type = GapiJson.Object },
                    cs) ->
                  GapiJson.parse_children
                    Query.parse
                    Query.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiCustomsearchV1Model.Search.parse.parse_collection" e x')
              Query.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Search.parse.parse_dictionary" e x')
        ("", [])
        (fun v -> { x with queries = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "url"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UrlData.parse
        UrlData.empty
        (fun v -> { x with url = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCustomsearchV1Model.Search.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

