(* Warning! This file is generated. Modify at your own risk. *)

module AdUnit =
struct
  type t = {
    code : string;
    id : string;
    kind : string;
    name : string;
    status : string;
    
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
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  
  let empty = {
    code = "";
    id = "";
    kind = "";
    name = "";
    status = "";
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "code" x.code;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "status" x.status;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "code"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with code = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.AdUnit.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomChannel =
struct
  module TargetingInfoData =
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
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adsAppearOn"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with adsAppearOn = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with description = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with location = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "siteLanguage"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with siteLanguage = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_1Model.TargetingInfoData.parse" e x
    
  end
  
  type t = {
    code : string;
    id : string;
    kind : string;
    name : string;
    targetingInfo : TargetingInfoData.t;
    
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
    targetingInfo = TargetingInfoData.empty;
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "code" x.code;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_object "targetingInfo" (TargetingInfoData.render_content x.targetingInfo);
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "code"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with code = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "targetingInfo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TargetingInfoData.parse
        TargetingInfoData.empty
        (fun v -> { x with targetingInfo = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.CustomChannel.parse" e x
  
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
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" AdUnit.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
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
        AdUnit.parse
        AdUnit.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.AdUnits.parse" e x
  
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
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "urlPattern" x.urlPattern;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "urlPattern"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with urlPattern = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.UrlChannel.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdClient =
struct
  type t = {
    id : string;
    kind : string;
    productCode : string;
    supportsReporting : bool;
    
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
    id = "";
    kind = "";
    productCode = "";
    supportsReporting = false;
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "productCode" x.productCode;
      GapiJson.render_bool_value "supportsReporting" x.supportsReporting;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "productCode"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with productCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsReporting"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with supportsReporting = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.AdClient.parse" e x
  
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
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" AdClient.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
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
        AdClient.parse
        AdClient.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.AdClients.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Account =
struct
  type t = {
    id : string;
    kind : string;
    name : string;
    subAccounts : t list;
    
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
  let subAccounts = {
    GapiLens.get = (fun x -> x.subAccounts);
    GapiLens.set = (fun v x -> { x with subAccounts = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    name = "";
    subAccounts = [];
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_array "subAccounts" render x.subAccounts;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "subAccounts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        parse
        empty
        (fun xs -> { x with subAccounts = xs })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.Account.parse" e x
  
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
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" UrlChannel.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
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
        UrlChannel.parse
        UrlChannel.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.UrlChannels.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdsenseReportsGenerateResponse =
struct
  module HeadersData =
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
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "currency"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with currency = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAdsenseV1_1Model.HeadersData.parse" e x
    
  end
  
  type t = {
    averages : string list;
    headers : HeadersData.t list;
    kind : string;
    rows : string list list;
    totalMatchedRows : string;
    totals : string list;
    warnings : string list;
    
  }
  
  let averages = {
    GapiLens.get = (fun x -> x.averages);
    GapiLens.set = (fun v x -> { x with averages = v });
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
    headers = [];
    kind = "";
    rows = [];
    totalMatchedRows = "";
    totals = [];
    warnings = [];
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_collection "averages" GapiJson.Array (GapiJson.render_string_value "") x.averages;
      GapiJson.render_array "headers" HeadersData.render x.headers;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "rows" GapiJson.Array (GapiJson.render_collection "" GapiJson.Array (GapiJson.render_string_value "")) x.rows;
      GapiJson.render_string_value "totalMatchedRows" x.totalMatchedRows;
      GapiJson.render_collection "totals" GapiJson.Array (GapiJson.render_string_value "") x.totals;
      GapiJson.render_collection "warnings" GapiJson.Array (GapiJson.render_string_value "") x.warnings;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "averages"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with averages = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headers"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        HeadersData.parse
        HeadersData.empty
        (fun xs -> { x with headers = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
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
              GapiJson.parse_string_element
              ""
              (fun x -> x)
              cs
          | e ->
            GapiJson.unexpected "GapiAdsenseV1_1Model.AdsenseReportsGenerateResponse.parse.parse_collection" e x')
        []
        (fun xs -> { x with rows = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalMatchedRows"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with totalMatchedRows = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "totals"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with totals = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "warnings"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with warnings = xs })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.AdsenseReportsGenerateResponse.parse" e x
  
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
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" CustomChannel.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
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
        CustomChannel.parse
        CustomChannel.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.CustomChannels.parse" e x
  
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
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Account.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
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
        Account.parse
        Account.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAdsenseV1_1Model.Accounts.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

