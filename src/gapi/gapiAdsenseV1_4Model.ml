(* Warning! This file is generated. Modify at your own risk. *)

module Payment =
struct
  type t = {
    id : string;
    kind : string;
    paymentAmount : string;
    paymentAmountCurrencyCode : string;
    paymentDate : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let paymentAmount = {
    GapiLens.get = (fun x -> x.paymentAmount);
    GapiLens.set = (fun v x -> { x with paymentAmount = v });
  }
  let paymentAmountCurrencyCode = {
    GapiLens.get = (fun x -> x.paymentAmountCurrencyCode);
    GapiLens.set = (fun v x -> { x with paymentAmountCurrencyCode = v });
  }
  let paymentDate = {
    GapiLens.get = (fun x -> x.paymentDate);
    GapiLens.set = (fun v x -> { x with paymentDate = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    paymentAmount = "";
    paymentAmountCurrencyCode = "";
    paymentDate = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "paymentAmount" x.paymentAmount;
      GapiJson.render_string_value "paymentAmountCurrencyCode" x.paymentAmountCurrencyCode;
      GapiJson.render_string_value "paymentDate" x.paymentDate;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "paymentAmount"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with paymentAmount = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "paymentAmountCurrencyCode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with paymentAmountCurrencyCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "paymentDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with paymentDate = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.Payment.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Payments =
struct
  type t = {
    items : Payment.t list;
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
      GapiJson.render_array "items" Payment.render x.items;
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
            GapiJson.parse_children
              Payment.parse
              Payment.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.Payments.parse.parse_collection" e x')
        Payment.empty
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
      GapiJson.unexpected "GapiAdsenseV1_4Model.Payments.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SavedReport =
struct
  type t = {
    id : string;
    kind : string;
    name : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    name = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.SavedReport.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SavedReports =
struct
  type t = {
    etag : string;
    items : SavedReport.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" SavedReport.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SavedReport.parse
              SavedReport.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.SavedReports.parse.parse_collection" e x')
        SavedReport.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.SavedReports.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdStyle =
struct
  module Font =
  struct
    type t = {
      family : string;
      size : string;
      
    }
    
    let family = {
      GapiLens.get = (fun x -> x.family);
      GapiLens.set = (fun v x -> { x with family = v });
    }
    let size = {
      GapiLens.get = (fun x -> x.size);
      GapiLens.set = (fun v x -> { x with size = v });
    }
    
    let empty = {
      family = "";
      size = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "family" x.family;
        GapiJson.render_string_value "size" x.size;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "family"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with family = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with size = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_4Model.Font.parse" e x
    
  end
  
  module Colors =
  struct
    type t = {
      background : string;
      border : string;
      text : string;
      title : string;
      url : string;
      
    }
    
    let background = {
      GapiLens.get = (fun x -> x.background);
      GapiLens.set = (fun v x -> { x with background = v });
    }
    let border = {
      GapiLens.get = (fun x -> x.border);
      GapiLens.set = (fun v x -> { x with border = v });
    }
    let text = {
      GapiLens.get = (fun x -> x.text);
      GapiLens.set = (fun v x -> { x with text = v });
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
      background = "";
      border = "";
      text = "";
      title = "";
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "background" x.background;
        GapiJson.render_string_value "border" x.border;
        GapiJson.render_string_value "text" x.text;
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "background"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with background = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "border"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with border = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "text"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with text = v }
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
        GapiJson.unexpected "GapiAdsenseV1_4Model.Colors.parse" e x
    
  end
  
  type t = {
    colors : Colors.t;
    corners : string;
    font : Font.t;
    kind : string;
    
  }
  
  let colors = {
    GapiLens.get = (fun x -> x.colors);
    GapiLens.set = (fun v x -> { x with colors = v });
  }
  let corners = {
    GapiLens.get = (fun x -> x.corners);
    GapiLens.set = (fun v x -> { x with corners = v });
  }
  let font = {
    GapiLens.get = (fun x -> x.font);
    GapiLens.set = (fun v x -> { x with font = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    colors = Colors.empty;
    corners = "";
    font = Font.empty;
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "colors" (Colors.render_content v)) x.colors;
      GapiJson.render_string_value "corners" x.corners;
      (fun v -> GapiJson.render_object "font" (Font.render_content v)) x.font;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colors"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Colors.parse
        Colors.empty
        (fun v -> { x with colors = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "corners"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with corners = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "font"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Font.parse
        Font.empty
        (fun v -> { x with font = v })
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
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdStyle.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SavedAdStyle =
struct
  type t = {
    adStyle : AdStyle.t;
    id : string;
    kind : string;
    name : string;
    
  }
  
  let adStyle = {
    GapiLens.get = (fun x -> x.adStyle);
    GapiLens.set = (fun v x -> { x with adStyle = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  
  let empty = {
    adStyle = AdStyle.empty;
    id = "";
    kind = "";
    name = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "adStyle" (AdStyle.render_content v)) x.adStyle;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "adStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AdStyle.parse
        AdStyle.empty
        (fun v -> { x with adStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.SavedAdStyle.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SavedAdStyles =
struct
  type t = {
    etag : string;
    items : SavedAdStyle.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" SavedAdStyle.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SavedAdStyle.parse
              SavedAdStyle.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.SavedAdStyles.parse.parse_collection" e x')
        SavedAdStyle.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.SavedAdStyles.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdCode =
struct
  type t = {
    adCode : string;
    ampBody : string;
    ampHead : string;
    kind : string;
    
  }
  
  let adCode = {
    GapiLens.get = (fun x -> x.adCode);
    GapiLens.set = (fun v x -> { x with adCode = v });
  }
  let ampBody = {
    GapiLens.get = (fun x -> x.ampBody);
    GapiLens.set = (fun v x -> { x with ampBody = v });
  }
  let ampHead = {
    GapiLens.get = (fun x -> x.ampHead);
    GapiLens.set = (fun v x -> { x with ampHead = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    adCode = "";
    ampBody = "";
    ampHead = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "adCode" x.adCode;
      GapiJson.render_string_value "ampBody" x.ampBody;
      GapiJson.render_string_value "ampHead" x.ampHead;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "adCode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with adCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ampBody"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with ampBody = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ampHead"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with ampHead = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdCode.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdClient =
struct
  type t = {
    arcOptIn : bool;
    id : string;
    kind : string;
    productCode : string;
    supportsReporting : bool;
    
  }
  
  let arcOptIn = {
    GapiLens.get = (fun x -> x.arcOptIn);
    GapiLens.set = (fun v x -> { x with arcOptIn = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let productCode = {
    GapiLens.get = (fun x -> x.productCode);
    GapiLens.set = (fun v x -> { x with productCode = v });
  }
  let supportsReporting = {
    GapiLens.get = (fun x -> x.supportsReporting);
    GapiLens.set = (fun v x -> { x with supportsReporting = v });
  }
  
  let empty = {
    arcOptIn = false;
    id = "";
    kind = "";
    productCode = "";
    supportsReporting = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "arcOptIn" x.arcOptIn;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "productCode" x.productCode;
      GapiJson.render_bool_value "supportsReporting" x.supportsReporting;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "arcOptIn"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with arcOptIn = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "productCode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with productCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsReporting"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsReporting = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdClient.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdClients =
struct
  type t = {
    etag : string;
    items : AdClient.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" AdClient.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AdClient.parse
              AdClient.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdClients.parse.parse_collection" e x')
        AdClient.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdClients.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdUnit =
struct
  module MobileContentAdsSettings =
  struct
    type t = {
      markupLanguage : string;
      scriptingLanguage : string;
      size : string;
      _type : string;
      
    }
    
    let markupLanguage = {
      GapiLens.get = (fun x -> x.markupLanguage);
      GapiLens.set = (fun v x -> { x with markupLanguage = v });
    }
    let scriptingLanguage = {
      GapiLens.get = (fun x -> x.scriptingLanguage);
      GapiLens.set = (fun v x -> { x with scriptingLanguage = v });
    }
    let size = {
      GapiLens.get = (fun x -> x.size);
      GapiLens.set = (fun v x -> { x with size = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      markupLanguage = "";
      scriptingLanguage = "";
      size = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "markupLanguage" x.markupLanguage;
        GapiJson.render_string_value "scriptingLanguage" x.scriptingLanguage;
        GapiJson.render_string_value "size" x.size;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "markupLanguage"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with markupLanguage = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "scriptingLanguage"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with scriptingLanguage = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with size = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_4Model.MobileContentAdsSettings.parse" e x
    
  end
  
  module FeedAdsSettings =
  struct
    type t = {
      adPosition : string;
      frequency : int;
      minimumWordCount : int;
      _type : string;
      
    }
    
    let adPosition = {
      GapiLens.get = (fun x -> x.adPosition);
      GapiLens.set = (fun v x -> { x with adPosition = v });
    }
    let frequency = {
      GapiLens.get = (fun x -> x.frequency);
      GapiLens.set = (fun v x -> { x with frequency = v });
    }
    let minimumWordCount = {
      GapiLens.get = (fun x -> x.minimumWordCount);
      GapiLens.set = (fun v x -> { x with minimumWordCount = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      adPosition = "";
      frequency = 0;
      minimumWordCount = 0;
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "adPosition" x.adPosition;
        GapiJson.render_int_value "frequency" x.frequency;
        GapiJson.render_int_value "minimumWordCount" x.minimumWordCount;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adPosition"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with adPosition = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "frequency"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with frequency = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "minimumWordCount"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with minimumWordCount = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_4Model.FeedAdsSettings.parse" e x
    
  end
  
  module ContentAdsSettings =
  struct
    module BackupOption =
    struct
      type t = {
        color : string;
        _type : string;
        url : string;
        
      }
      
      let color = {
        GapiLens.get = (fun x -> x.color);
        GapiLens.set = (fun v x -> { x with color = v });
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
        color = "";
        _type = "";
        url = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "color" x.color;
          GapiJson.render_string_value "type" x._type;
          GapiJson.render_string_value "url" x.url;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "color"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with color = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with _type = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with url = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAdsenseV1_4Model.BackupOption.parse" e x
      
    end
    
    type t = {
      backupOption : BackupOption.t;
      size : string;
      _type : string;
      
    }
    
    let backupOption = {
      GapiLens.get = (fun x -> x.backupOption);
      GapiLens.set = (fun v x -> { x with backupOption = v });
    }
    let size = {
      GapiLens.get = (fun x -> x.size);
      GapiLens.set = (fun v x -> { x with size = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      backupOption = BackupOption.empty;
      size = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "backupOption" (BackupOption.render_content v)) x.backupOption;
        GapiJson.render_string_value "size" x.size;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "backupOption"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          BackupOption.parse
          BackupOption.empty
          (fun v -> { x with backupOption = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with size = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_4Model.ContentAdsSettings.parse" e x
    
  end
  
  type t = {
    code : string;
    contentAdsSettings : ContentAdsSettings.t;
    customStyle : AdStyle.t;
    feedAdsSettings : FeedAdsSettings.t;
    id : string;
    kind : string;
    mobileContentAdsSettings : MobileContentAdsSettings.t;
    name : string;
    savedStyleId : string;
    status : string;
    
  }
  
  let code = {
    GapiLens.get = (fun x -> x.code);
    GapiLens.set = (fun v x -> { x with code = v });
  }
  let contentAdsSettings = {
    GapiLens.get = (fun x -> x.contentAdsSettings);
    GapiLens.set = (fun v x -> { x with contentAdsSettings = v });
  }
  let customStyle = {
    GapiLens.get = (fun x -> x.customStyle);
    GapiLens.set = (fun v x -> { x with customStyle = v });
  }
  let feedAdsSettings = {
    GapiLens.get = (fun x -> x.feedAdsSettings);
    GapiLens.set = (fun v x -> { x with feedAdsSettings = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let mobileContentAdsSettings = {
    GapiLens.get = (fun x -> x.mobileContentAdsSettings);
    GapiLens.set = (fun v x -> { x with mobileContentAdsSettings = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let savedStyleId = {
    GapiLens.get = (fun x -> x.savedStyleId);
    GapiLens.set = (fun v x -> { x with savedStyleId = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  
  let empty = {
    code = "";
    contentAdsSettings = ContentAdsSettings.empty;
    customStyle = AdStyle.empty;
    feedAdsSettings = FeedAdsSettings.empty;
    id = "";
    kind = "";
    mobileContentAdsSettings = MobileContentAdsSettings.empty;
    name = "";
    savedStyleId = "";
    status = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "code" x.code;
      (fun v -> GapiJson.render_object "contentAdsSettings" (ContentAdsSettings.render_content v)) x.contentAdsSettings;
      (fun v -> GapiJson.render_object "customStyle" (AdStyle.render_content v)) x.customStyle;
      (fun v -> GapiJson.render_object "feedAdsSettings" (FeedAdsSettings.render_content v)) x.feedAdsSettings;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "mobileContentAdsSettings" (MobileContentAdsSettings.render_content v)) x.mobileContentAdsSettings;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "savedStyleId" x.savedStyleId;
      GapiJson.render_string_value "status" x.status;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "code"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with code = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "contentAdsSettings"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ContentAdsSettings.parse
        ContentAdsSettings.empty
        (fun v -> { x with contentAdsSettings = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "customStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AdStyle.parse
        AdStyle.empty
        (fun v -> { x with customStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "feedAdsSettings"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FeedAdsSettings.parse
        FeedAdsSettings.empty
        (fun v -> { x with feedAdsSettings = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "mobileContentAdsSettings"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MobileContentAdsSettings.parse
        MobileContentAdsSettings.empty
        (fun v -> { x with mobileContentAdsSettings = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "savedStyleId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with savedStyleId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdUnit.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdUnits =
struct
  type t = {
    etag : string;
    items : AdUnit.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" AdUnit.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children AdUnit.parse AdUnit.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdUnits.parse.parse_collection" e x')
        AdUnit.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdUnits.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomChannel =
struct
  module TargetingInfo =
  struct
    type t = {
      adsAppearOn : string;
      description : string;
      location : string;
      siteLanguage : string;
      
    }
    
    let adsAppearOn = {
      GapiLens.get = (fun x -> x.adsAppearOn);
      GapiLens.set = (fun v x -> { x with adsAppearOn = v });
    }
    let description = {
      GapiLens.get = (fun x -> x.description);
      GapiLens.set = (fun v x -> { x with description = v });
    }
    let location = {
      GapiLens.get = (fun x -> x.location);
      GapiLens.set = (fun v x -> { x with location = v });
    }
    let siteLanguage = {
      GapiLens.get = (fun x -> x.siteLanguage);
      GapiLens.set = (fun v x -> { x with siteLanguage = v });
    }
    
    let empty = {
      adsAppearOn = "";
      description = "";
      location = "";
      siteLanguage = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "adsAppearOn" x.adsAppearOn;
        GapiJson.render_string_value "description" x.description;
        GapiJson.render_string_value "location" x.location;
        GapiJson.render_string_value "siteLanguage" x.siteLanguage;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adsAppearOn"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with adsAppearOn = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with description = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with location = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "siteLanguage"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with siteLanguage = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_4Model.TargetingInfo.parse" e x
    
  end
  
  type t = {
    code : string;
    id : string;
    kind : string;
    name : string;
    targetingInfo : TargetingInfo.t;
    
  }
  
  let code = {
    GapiLens.get = (fun x -> x.code);
    GapiLens.set = (fun v x -> { x with code = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let targetingInfo = {
    GapiLens.get = (fun x -> x.targetingInfo);
    GapiLens.set = (fun v x -> { x with targetingInfo = v });
  }
  
  let empty = {
    code = "";
    id = "";
    kind = "";
    name = "";
    targetingInfo = TargetingInfo.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "code" x.code;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "targetingInfo" (TargetingInfo.render_content v)) x.targetingInfo;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "code"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with code = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "targetingInfo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TargetingInfo.parse
        TargetingInfo.empty
        (fun v -> { x with targetingInfo = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.CustomChannel.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Alert =
struct
  type t = {
    id : string;
    isDismissible : bool;
    kind : string;
    message : string;
    severity : string;
    _type : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let isDismissible = {
    GapiLens.get = (fun x -> x.isDismissible);
    GapiLens.set = (fun v x -> { x with isDismissible = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  let severity = {
    GapiLens.get = (fun x -> x.severity);
    GapiLens.set = (fun v x -> { x with severity = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    id = "";
    isDismissible = false;
    kind = "";
    message = "";
    severity = "";
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "isDismissible" x.isDismissible;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "message" x.message;
      GapiJson.render_string_value "severity" x.severity;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isDismissible"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isDismissible = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "message"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with message = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "severity"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with severity = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.Alert.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Alerts =
struct
  type t = {
    items : Alert.t list;
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
      GapiJson.render_array "items" Alert.render x.items;
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
            GapiJson.parse_children Alert.parse Alert.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.Alerts.parse.parse_collection" e x')
        Alert.empty
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
      GapiJson.unexpected "GapiAdsenseV1_4Model.Alerts.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UrlChannel =
struct
  type t = {
    id : string;
    kind : string;
    urlPattern : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let urlPattern = {
    GapiLens.get = (fun x -> x.urlPattern);
    GapiLens.set = (fun v x -> { x with urlPattern = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    urlPattern = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "urlPattern" x.urlPattern;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "urlPattern"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with urlPattern = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.UrlChannel.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Account =
struct
  type t = {
    creation_time : int64;
    id : string;
    kind : string;
    name : string;
    premium : bool;
    subAccounts : t list;
    timezone : string;
    
  }
  
  let creation_time = {
    GapiLens.get = (fun x -> x.creation_time);
    GapiLens.set = (fun v x -> { x with creation_time = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let premium = {
    GapiLens.get = (fun x -> x.premium);
    GapiLens.set = (fun v x -> { x with premium = v });
  }
  let subAccounts = {
    GapiLens.get = (fun x -> x.subAccounts);
    GapiLens.set = (fun v x -> { x with subAccounts = v });
  }
  let timezone = {
    GapiLens.get = (fun x -> x.timezone);
    GapiLens.set = (fun v x -> { x with timezone = v });
  }
  
  let empty = {
    creation_time = 0L;
    id = "";
    kind = "";
    name = "";
    premium = false;
    subAccounts = [];
    timezone = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int64_value "creation_time" x.creation_time;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_bool_value "premium" x.premium;
      GapiJson.render_array "subAccounts" render x.subAccounts;
      GapiJson.render_string_value "timezone" x.timezone;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "creation_time"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with creation_time = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "premium"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with premium = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "subAccounts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children parse empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.Account.parse.parse_collection" e x')
        empty
        (fun v -> { x with subAccounts = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timezone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timezone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.Account.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomChannels =
struct
  type t = {
    etag : string;
    items : CustomChannel.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" CustomChannel.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              CustomChannel.parse
              CustomChannel.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.CustomChannels.parse.parse_collection" e x')
        CustomChannel.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.CustomChannels.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ReportingMetadataEntry =
struct
  type t = {
    compatibleDimensions : string list;
    compatibleMetrics : string list;
    id : string;
    kind : string;
    requiredDimensions : string list;
    requiredMetrics : string list;
    supportedProducts : string list;
    
  }
  
  let compatibleDimensions = {
    GapiLens.get = (fun x -> x.compatibleDimensions);
    GapiLens.set = (fun v x -> { x with compatibleDimensions = v });
  }
  let compatibleMetrics = {
    GapiLens.get = (fun x -> x.compatibleMetrics);
    GapiLens.set = (fun v x -> { x with compatibleMetrics = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let requiredDimensions = {
    GapiLens.get = (fun x -> x.requiredDimensions);
    GapiLens.set = (fun v x -> { x with requiredDimensions = v });
  }
  let requiredMetrics = {
    GapiLens.get = (fun x -> x.requiredMetrics);
    GapiLens.set = (fun v x -> { x with requiredMetrics = v });
  }
  let supportedProducts = {
    GapiLens.get = (fun x -> x.supportedProducts);
    GapiLens.set = (fun v x -> { x with supportedProducts = v });
  }
  
  let empty = {
    compatibleDimensions = [];
    compatibleMetrics = [];
    id = "";
    kind = "";
    requiredDimensions = [];
    requiredMetrics = [];
    supportedProducts = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "compatibleDimensions" (GapiJson.render_string_value "") x.compatibleDimensions;
      GapiJson.render_array "compatibleMetrics" (GapiJson.render_string_value "") x.compatibleMetrics;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "requiredDimensions" (GapiJson.render_string_value "") x.requiredDimensions;
      GapiJson.render_array "requiredMetrics" (GapiJson.render_string_value "") x.requiredMetrics;
      GapiJson.render_array "supportedProducts" (GapiJson.render_string_value "") x.supportedProducts;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "compatibleDimensions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.ReportingMetadataEntry.parse.parse_collection" e x')
        ""
        (fun v -> { x with compatibleDimensions = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "compatibleMetrics"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.ReportingMetadataEntry.parse.parse_collection" e x')
        ""
        (fun v -> { x with compatibleMetrics = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "requiredDimensions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.ReportingMetadataEntry.parse.parse_collection" e x')
        ""
        (fun v -> { x with requiredDimensions = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "requiredMetrics"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.ReportingMetadataEntry.parse.parse_collection" e x')
        ""
        (fun v -> { x with requiredMetrics = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "supportedProducts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.ReportingMetadataEntry.parse.parse_collection" e x')
        ""
        (fun v -> { x with supportedProducts = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.ReportingMetadataEntry.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Accounts =
struct
  type t = {
    etag : string;
    items : Account.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Account.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Account.parse
              Account.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.Accounts.parse.parse_collection" e x')
        Account.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.Accounts.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdsenseReportsGenerateResponse =
struct
  module Headers =
  struct
    type t = {
      currency : string;
      name : string;
      _type : string;
      
    }
    
    let currency = {
      GapiLens.get = (fun x -> x.currency);
      GapiLens.set = (fun v x -> { x with currency = v });
    }
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      currency = "";
      name = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "currency" x.currency;
        GapiJson.render_string_value "name" x.name;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "currency"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with currency = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_4Model.Headers.parse" e x
    
  end
  
  type t = {
    averages : string list;
    endDate : string;
    headers : Headers.t list;
    kind : string;
    rows : string list list;
    startDate : string;
    totalMatchedRows : int64;
    totals : string list;
    warnings : string list;
    
  }
  
  let averages = {
    GapiLens.get = (fun x -> x.averages);
    GapiLens.set = (fun v x -> { x with averages = v });
  }
  let endDate = {
    GapiLens.get = (fun x -> x.endDate);
    GapiLens.set = (fun v x -> { x with endDate = v });
  }
  let headers = {
    GapiLens.get = (fun x -> x.headers);
    GapiLens.set = (fun v x -> { x with headers = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let rows = {
    GapiLens.get = (fun x -> x.rows);
    GapiLens.set = (fun v x -> { x with rows = v });
  }
  let startDate = {
    GapiLens.get = (fun x -> x.startDate);
    GapiLens.set = (fun v x -> { x with startDate = v });
  }
  let totalMatchedRows = {
    GapiLens.get = (fun x -> x.totalMatchedRows);
    GapiLens.set = (fun v x -> { x with totalMatchedRows = v });
  }
  let totals = {
    GapiLens.get = (fun x -> x.totals);
    GapiLens.set = (fun v x -> { x with totals = v });
  }
  let warnings = {
    GapiLens.get = (fun x -> x.warnings);
    GapiLens.set = (fun v x -> { x with warnings = v });
  }
  
  let empty = {
    averages = [];
    endDate = "";
    headers = [];
    kind = "";
    rows = [];
    startDate = "";
    totalMatchedRows = 0L;
    totals = [];
    warnings = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "averages" (GapiJson.render_string_value "") x.averages;
      GapiJson.render_string_value "endDate" x.endDate;
      GapiJson.render_array "headers" Headers.render x.headers;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "rows" (GapiJson.render_array "" (GapiJson.render_string_value "")) x.rows;
      GapiJson.render_string_value "startDate" x.startDate;
      GapiJson.render_int64_value "totalMatchedRows" x.totalMatchedRows;
      GapiJson.render_array "totals" (GapiJson.render_string_value "") x.totals;
      GapiJson.render_array "warnings" (GapiJson.render_string_value "") x.warnings;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "averages"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
        ""
        (fun v -> { x with averages = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with endDate = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headers"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Headers.parse
              Headers.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
        Headers.empty
        (fun v -> { x with headers = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rows"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                    `String v) ->
                  v
                | e ->
                  GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
              ""
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
        []
        (fun v -> { x with rows = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with startDate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalMatchedRows"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with totalMatchedRows = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "totals"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
        ""
        (fun v -> { x with totals = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "warnings"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
        ""
        (fun v -> { x with warnings = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.AdsenseReportsGenerateResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UrlChannels =
struct
  type t = {
    etag : string;
    items : UrlChannel.t list;
    kind : string;
    nextPageToken : string;
    
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
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" UrlChannel.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              UrlChannel.parse
              UrlChannel.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.UrlChannels.parse.parse_collection" e x')
        UrlChannel.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_4Model.UrlChannels.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Metadata =
struct
  type t = {
    items : ReportingMetadataEntry.t list;
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
      GapiJson.render_array "items" ReportingMetadataEntry.render x.items;
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
            GapiJson.parse_children
              ReportingMetadataEntry.parse
              ReportingMetadataEntry.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_4Model.Metadata.parse.parse_collection" e x')
        ReportingMetadataEntry.empty
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
      GapiJson.unexpected "GapiAdsenseV1_4Model.Metadata.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

