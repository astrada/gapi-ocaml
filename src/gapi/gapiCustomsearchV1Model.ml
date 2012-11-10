(* Warning! This file is generated. Modify at your own risk. *)

module Promotion =
struct
  module Image =
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
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "source"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with source = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.Image.parse" e x
    
  end
  
  module BodyLines =
  struct
    type t = {
      htmlTitle : string;
      link : string;
      title : string;
      url : string;
      
    }
    
    let htmlTitle = {
      GapiLens.get = (fun x -> x.htmlTitle);
      GapiLens.set = (fun v x -> { x with htmlTitle = v });
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
      htmlTitle = "";
      link = "";
      title = "";
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "htmlTitle" x.htmlTitle;
        GapiJson.render_string_value "link" x.link;
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "htmlTitle"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with htmlTitle = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with link = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.BodyLines.parse" e x
    
  end
  
  type t = {
    bodyLines : BodyLines.t list;
    displayLink : string;
    htmlTitle : string;
    image : Image.t;
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
  let htmlTitle = {
    GapiLens.get = (fun x -> x.htmlTitle);
    GapiLens.set = (fun v x -> { x with htmlTitle = v });
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
    htmlTitle = "";
    image = Image.empty;
    link = "";
    title = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "bodyLines" BodyLines.render x.bodyLines;
      GapiJson.render_string_value "displayLink" x.displayLink;
      GapiJson.render_string_value "htmlTitle" x.htmlTitle;
      (fun v -> GapiJson.render_object "image" (Image.render_content v)) x.image;
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
              BodyLines.parse
              BodyLines.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Promotion.parse.parse_collection" e x')
        BodyLines.empty
        (fun v -> { x with bodyLines = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlTitle"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlTitle = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Image.parse
        Image.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with link = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
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
    dateRestrict : string;
    disableCnTwTranslation : string;
    exactTerms : string;
    excludeTerms : string;
    fileType : string;
    filter : string;
    gl : string;
    googleHost : string;
    highRange : string;
    hl : string;
    hq : string;
    imgColorType : string;
    imgDominantColor : string;
    imgSize : string;
    imgType : string;
    inputEncoding : string;
    language : string;
    linkSite : string;
    lowRange : string;
    orTerms : string;
    outputEncoding : string;
    relatedSite : string;
    rights : string;
    safe : string;
    searchTerms : string;
    searchType : string;
    siteSearch : string;
    siteSearchFilter : string;
    sort : string;
    startIndex : int;
    startPage : int;
    title : string;
    totalResults : int64;
    
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
  let dateRestrict = {
    GapiLens.get = (fun x -> x.dateRestrict);
    GapiLens.set = (fun v x -> { x with dateRestrict = v });
  }
  let disableCnTwTranslation = {
    GapiLens.get = (fun x -> x.disableCnTwTranslation);
    GapiLens.set = (fun v x -> { x with disableCnTwTranslation = v });
  }
  let exactTerms = {
    GapiLens.get = (fun x -> x.exactTerms);
    GapiLens.set = (fun v x -> { x with exactTerms = v });
  }
  let excludeTerms = {
    GapiLens.get = (fun x -> x.excludeTerms);
    GapiLens.set = (fun v x -> { x with excludeTerms = v });
  }
  let fileType = {
    GapiLens.get = (fun x -> x.fileType);
    GapiLens.set = (fun v x -> { x with fileType = v });
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
  let highRange = {
    GapiLens.get = (fun x -> x.highRange);
    GapiLens.set = (fun v x -> { x with highRange = v });
  }
  let hl = {
    GapiLens.get = (fun x -> x.hl);
    GapiLens.set = (fun v x -> { x with hl = v });
  }
  let hq = {
    GapiLens.get = (fun x -> x.hq);
    GapiLens.set = (fun v x -> { x with hq = v });
  }
  let imgColorType = {
    GapiLens.get = (fun x -> x.imgColorType);
    GapiLens.set = (fun v x -> { x with imgColorType = v });
  }
  let imgDominantColor = {
    GapiLens.get = (fun x -> x.imgDominantColor);
    GapiLens.set = (fun v x -> { x with imgDominantColor = v });
  }
  let imgSize = {
    GapiLens.get = (fun x -> x.imgSize);
    GapiLens.set = (fun v x -> { x with imgSize = v });
  }
  let imgType = {
    GapiLens.get = (fun x -> x.imgType);
    GapiLens.set = (fun v x -> { x with imgType = v });
  }
  let inputEncoding = {
    GapiLens.get = (fun x -> x.inputEncoding);
    GapiLens.set = (fun v x -> { x with inputEncoding = v });
  }
  let language = {
    GapiLens.get = (fun x -> x.language);
    GapiLens.set = (fun v x -> { x with language = v });
  }
  let linkSite = {
    GapiLens.get = (fun x -> x.linkSite);
    GapiLens.set = (fun v x -> { x with linkSite = v });
  }
  let lowRange = {
    GapiLens.get = (fun x -> x.lowRange);
    GapiLens.set = (fun v x -> { x with lowRange = v });
  }
  let orTerms = {
    GapiLens.get = (fun x -> x.orTerms);
    GapiLens.set = (fun v x -> { x with orTerms = v });
  }
  let outputEncoding = {
    GapiLens.get = (fun x -> x.outputEncoding);
    GapiLens.set = (fun v x -> { x with outputEncoding = v });
  }
  let relatedSite = {
    GapiLens.get = (fun x -> x.relatedSite);
    GapiLens.set = (fun v x -> { x with relatedSite = v });
  }
  let rights = {
    GapiLens.get = (fun x -> x.rights);
    GapiLens.set = (fun v x -> { x with rights = v });
  }
  let safe = {
    GapiLens.get = (fun x -> x.safe);
    GapiLens.set = (fun v x -> { x with safe = v });
  }
  let searchTerms = {
    GapiLens.get = (fun x -> x.searchTerms);
    GapiLens.set = (fun v x -> { x with searchTerms = v });
  }
  let searchType = {
    GapiLens.get = (fun x -> x.searchType);
    GapiLens.set = (fun v x -> { x with searchType = v });
  }
  let siteSearch = {
    GapiLens.get = (fun x -> x.siteSearch);
    GapiLens.set = (fun v x -> { x with siteSearch = v });
  }
  let siteSearchFilter = {
    GapiLens.get = (fun x -> x.siteSearchFilter);
    GapiLens.set = (fun v x -> { x with siteSearchFilter = v });
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
    dateRestrict = "";
    disableCnTwTranslation = "";
    exactTerms = "";
    excludeTerms = "";
    fileType = "";
    filter = "";
    gl = "";
    googleHost = "";
    highRange = "";
    hl = "";
    hq = "";
    imgColorType = "";
    imgDominantColor = "";
    imgSize = "";
    imgType = "";
    inputEncoding = "";
    language = "";
    linkSite = "";
    lowRange = "";
    orTerms = "";
    outputEncoding = "";
    relatedSite = "";
    rights = "";
    safe = "";
    searchTerms = "";
    searchType = "";
    siteSearch = "";
    siteSearchFilter = "";
    sort = "";
    startIndex = 0;
    startPage = 0;
    title = "";
    totalResults = 0L;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "count" x.count;
      GapiJson.render_string_value "cr" x.cr;
      GapiJson.render_string_value "cref" x.cref;
      GapiJson.render_string_value "cx" x.cx;
      GapiJson.render_string_value "dateRestrict" x.dateRestrict;
      GapiJson.render_string_value "disableCnTwTranslation" x.disableCnTwTranslation;
      GapiJson.render_string_value "exactTerms" x.exactTerms;
      GapiJson.render_string_value "excludeTerms" x.excludeTerms;
      GapiJson.render_string_value "fileType" x.fileType;
      GapiJson.render_string_value "filter" x.filter;
      GapiJson.render_string_value "gl" x.gl;
      GapiJson.render_string_value "googleHost" x.googleHost;
      GapiJson.render_string_value "highRange" x.highRange;
      GapiJson.render_string_value "hl" x.hl;
      GapiJson.render_string_value "hq" x.hq;
      GapiJson.render_string_value "imgColorType" x.imgColorType;
      GapiJson.render_string_value "imgDominantColor" x.imgDominantColor;
      GapiJson.render_string_value "imgSize" x.imgSize;
      GapiJson.render_string_value "imgType" x.imgType;
      GapiJson.render_string_value "inputEncoding" x.inputEncoding;
      GapiJson.render_string_value "language" x.language;
      GapiJson.render_string_value "linkSite" x.linkSite;
      GapiJson.render_string_value "lowRange" x.lowRange;
      GapiJson.render_string_value "orTerms" x.orTerms;
      GapiJson.render_string_value "outputEncoding" x.outputEncoding;
      GapiJson.render_string_value "relatedSite" x.relatedSite;
      GapiJson.render_string_value "rights" x.rights;
      GapiJson.render_string_value "safe" x.safe;
      GapiJson.render_string_value "searchTerms" x.searchTerms;
      GapiJson.render_string_value "searchType" x.searchType;
      GapiJson.render_string_value "siteSearch" x.siteSearch;
      GapiJson.render_string_value "siteSearchFilter" x.siteSearchFilter;
      GapiJson.render_string_value "sort" x.sort;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "startPage" x.startPage;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_int64_value "totalResults" x.totalResults;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with count = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cr"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with cr = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cref"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with cref = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cx"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with cx = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dateRestrict"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dateRestrict = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "disableCnTwTranslation"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with disableCnTwTranslation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "exactTerms"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with exactTerms = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "excludeTerms"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with excludeTerms = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filter"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with filter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "gl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with gl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "googleHost"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with googleHost = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "highRange"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with highRange = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hq"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hq = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "imgColorType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with imgColorType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "imgDominantColor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with imgDominantColor = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "imgSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with imgSize = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "imgType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with imgType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "inputEncoding"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with inputEncoding = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "language"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with language = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "linkSite"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with linkSite = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "lowRange"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with lowRange = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "orTerms"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with orTerms = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outputEncoding"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with outputEncoding = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "relatedSite"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with relatedSite = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rights"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with rights = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "safe"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with safe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "searchTerms"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with searchTerms = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "searchType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with searchType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "siteSearch"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with siteSearch = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "siteSearchFilter"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with siteSearchFilter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sort"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sort = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with totalResults = Int64.of_string v }
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
  module Facets =
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
          `String v) ->
        { x with anchor = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with label = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.Facets.parse" e x
    
  end
  
  type t = {
    facets : Facets.t list list;
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
      GapiJson.render_array "facets" (GapiJson.render_array "" Facets.render) x.facets;
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
                    Facets.parse
                    Facets.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiCustomsearchV1Model.Context.parse.parse_collection" e x')
              Facets.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Context.parse.parse_collection" e x')
        []
        (fun v -> { x with facets = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
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
  module Labels =
  struct
    type t = {
      displayName : string;
      name : string;
      
    }
    
    let displayName = {
      GapiLens.get = (fun x -> x.displayName);
      GapiLens.set = (fun v x -> { x with displayName = v });
    }
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    
    let empty = {
      displayName = "";
      name = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "name" x.name;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.Labels.parse" e x
    
  end
  
  module Image =
  struct
    type t = {
      byteSize : int;
      contextLink : string;
      height : int;
      thumbnailHeight : int;
      thumbnailLink : string;
      thumbnailWidth : int;
      width : int;
      
    }
    
    let byteSize = {
      GapiLens.get = (fun x -> x.byteSize);
      GapiLens.set = (fun v x -> { x with byteSize = v });
    }
    let contextLink = {
      GapiLens.get = (fun x -> x.contextLink);
      GapiLens.set = (fun v x -> { x with contextLink = v });
    }
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let thumbnailHeight = {
      GapiLens.get = (fun x -> x.thumbnailHeight);
      GapiLens.set = (fun v x -> { x with thumbnailHeight = v });
    }
    let thumbnailLink = {
      GapiLens.get = (fun x -> x.thumbnailLink);
      GapiLens.set = (fun v x -> { x with thumbnailLink = v });
    }
    let thumbnailWidth = {
      GapiLens.get = (fun x -> x.thumbnailWidth);
      GapiLens.set = (fun v x -> { x with thumbnailWidth = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      byteSize = 0;
      contextLink = "";
      height = 0;
      thumbnailHeight = 0;
      thumbnailLink = "";
      thumbnailWidth = 0;
      width = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int_value "byteSize" x.byteSize;
        GapiJson.render_string_value "contextLink" x.contextLink;
        GapiJson.render_int_value "height" x.height;
        GapiJson.render_int_value "thumbnailHeight" x.thumbnailHeight;
        GapiJson.render_string_value "thumbnailLink" x.thumbnailLink;
        GapiJson.render_int_value "thumbnailWidth" x.thumbnailWidth;
        GapiJson.render_int_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "byteSize"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with byteSize = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "contextLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with contextLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "thumbnailHeight"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with thumbnailHeight = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "thumbnailLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with thumbnailLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "thumbnailWidth"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with thumbnailWidth = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.Image.parse" e x
    
  end
  
  type t = {
    cacheId : string;
    displayLink : string;
    fileFormat : string;
    formattedUrl : string;
    htmlFormattedUrl : string;
    htmlSnippet : string;
    htmlTitle : string;
    image : Image.t;
    kind : string;
    labels : Labels.t list;
    link : string;
    mime : string;
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
  let fileFormat = {
    GapiLens.get = (fun x -> x.fileFormat);
    GapiLens.set = (fun v x -> { x with fileFormat = v });
  }
  let formattedUrl = {
    GapiLens.get = (fun x -> x.formattedUrl);
    GapiLens.set = (fun v x -> { x with formattedUrl = v });
  }
  let htmlFormattedUrl = {
    GapiLens.get = (fun x -> x.htmlFormattedUrl);
    GapiLens.set = (fun v x -> { x with htmlFormattedUrl = v });
  }
  let htmlSnippet = {
    GapiLens.get = (fun x -> x.htmlSnippet);
    GapiLens.set = (fun v x -> { x with htmlSnippet = v });
  }
  let htmlTitle = {
    GapiLens.get = (fun x -> x.htmlTitle);
    GapiLens.set = (fun v x -> { x with htmlTitle = v });
  }
  let image = {
    GapiLens.get = (fun x -> x.image);
    GapiLens.set = (fun v x -> { x with image = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let link = {
    GapiLens.get = (fun x -> x.link);
    GapiLens.set = (fun v x -> { x with link = v });
  }
  let mime = {
    GapiLens.get = (fun x -> x.mime);
    GapiLens.set = (fun v x -> { x with mime = v });
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
    fileFormat = "";
    formattedUrl = "";
    htmlFormattedUrl = "";
    htmlSnippet = "";
    htmlTitle = "";
    image = Image.empty;
    kind = "";
    labels = [];
    link = "";
    mime = "";
    pagemap = [];
    snippet = "";
    title = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "cacheId" x.cacheId;
      GapiJson.render_string_value "displayLink" x.displayLink;
      GapiJson.render_string_value "fileFormat" x.fileFormat;
      GapiJson.render_string_value "formattedUrl" x.formattedUrl;
      GapiJson.render_string_value "htmlFormattedUrl" x.htmlFormattedUrl;
      GapiJson.render_string_value "htmlSnippet" x.htmlSnippet;
      GapiJson.render_string_value "htmlTitle" x.htmlTitle;
      (fun v -> GapiJson.render_object "image" (Image.render_content v)) x.image;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "labels" Labels.render x.labels;
      GapiJson.render_string_value "link" x.link;
      GapiJson.render_string_value "mime" x.mime;
      GapiJson.render_collection "pagemap" GapiJson.Object (fun (id, v) -> GapiJson.render_array id (GapiJson.render_collection "" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v)) v) x.pagemap;
      GapiJson.render_string_value "snippet" x.snippet;
      GapiJson.render_string_value "title" x.title;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cacheId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with cacheId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileFormat"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileFormat = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formattedUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with formattedUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlFormattedUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlFormattedUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlSnippet"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlSnippet = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlTitle"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlTitle = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "image"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Image.parse
        Image.empty
        (fun v -> { x with image = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Labels.parse Labels.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiCustomsearchV1Model.Result.parse.parse_collection" e x')
        Labels.empty
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with link = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mime = v }
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
                          `String v) ->
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
        `String v) ->
      { x with snippet = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
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
  module Url =
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
          `String v) ->
        { x with template = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.Url.parse" e x
    
  end
  
  module Spelling =
  struct
    type t = {
      correctedQuery : string;
      htmlCorrectedQuery : string;
      
    }
    
    let correctedQuery = {
      GapiLens.get = (fun x -> x.correctedQuery);
      GapiLens.set = (fun v x -> { x with correctedQuery = v });
    }
    let htmlCorrectedQuery = {
      GapiLens.get = (fun x -> x.htmlCorrectedQuery);
      GapiLens.set = (fun v x -> { x with htmlCorrectedQuery = v });
    }
    
    let empty = {
      correctedQuery = "";
      htmlCorrectedQuery = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "correctedQuery" x.correctedQuery;
        GapiJson.render_string_value "htmlCorrectedQuery" x.htmlCorrectedQuery;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "correctedQuery"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with correctedQuery = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "htmlCorrectedQuery"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with htmlCorrectedQuery = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.Spelling.parse" e x
    
  end
  
  module SearchInformation =
  struct
    type t = {
      formattedSearchTime : string;
      formattedTotalResults : string;
      searchTime : float;
      totalResults : int64;
      
    }
    
    let formattedSearchTime = {
      GapiLens.get = (fun x -> x.formattedSearchTime);
      GapiLens.set = (fun v x -> { x with formattedSearchTime = v });
    }
    let formattedTotalResults = {
      GapiLens.get = (fun x -> x.formattedTotalResults);
      GapiLens.set = (fun v x -> { x with formattedTotalResults = v });
    }
    let searchTime = {
      GapiLens.get = (fun x -> x.searchTime);
      GapiLens.set = (fun v x -> { x with searchTime = v });
    }
    let totalResults = {
      GapiLens.get = (fun x -> x.totalResults);
      GapiLens.set = (fun v x -> { x with totalResults = v });
    }
    
    let empty = {
      formattedSearchTime = "";
      formattedTotalResults = "";
      searchTime = 0.0;
      totalResults = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "formattedSearchTime" x.formattedSearchTime;
        GapiJson.render_string_value "formattedTotalResults" x.formattedTotalResults;
        GapiJson.render_float_value "searchTime" x.searchTime;
        GapiJson.render_int64_value "totalResults" x.totalResults;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "formattedSearchTime"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with formattedSearchTime = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "formattedTotalResults"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with formattedTotalResults = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "searchTime"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with searchTime = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "searchTime"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with searchTime = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with totalResults = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCustomsearchV1Model.SearchInformation.parse" e x
    
  end
  
  type t = {
    context : Context.t;
    items : Result.t list;
    kind : string;
    promotions : Promotion.t list;
    queries : (string * Query.t list) list;
    searchInformation : SearchInformation.t;
    spelling : Spelling.t;
    url : Url.t;
    
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
  let searchInformation = {
    GapiLens.get = (fun x -> x.searchInformation);
    GapiLens.set = (fun v x -> { x with searchInformation = v });
  }
  let spelling = {
    GapiLens.get = (fun x -> x.spelling);
    GapiLens.set = (fun v x -> { x with spelling = v });
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
    searchInformation = SearchInformation.empty;
    spelling = Spelling.empty;
    url = Url.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "context" (Context.render_content v)) x.context;
      GapiJson.render_array "items" Result.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "promotions" Promotion.render x.promotions;
      GapiJson.render_collection "queries" GapiJson.Object (fun (id, v) -> GapiJson.render_array id Query.render v) x.queries;
      (fun v -> GapiJson.render_object "searchInformation" (SearchInformation.render_content v)) x.searchInformation;
      (fun v -> GapiJson.render_object "spelling" (Spelling.render_content v)) x.spelling;
      (fun v -> GapiJson.render_object "url" (Url.render_content v)) x.url;
      
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
        `String v) ->
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
        ({ GapiJson.name = "searchInformation"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SearchInformation.parse
        SearchInformation.empty
        (fun v -> { x with searchInformation = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spelling"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Spelling.parse
        Spelling.empty
        (fun v -> { x with spelling = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "url"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Url.parse
        Url.empty
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

