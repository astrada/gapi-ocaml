(* Warning! This file is generated. Modify at your own risk. *)

module StringCount =
struct
  type t = {
    count : string;
    id : string;
    
  }
  
  let count = {
    GapiLens.get = (fun x -> x.count);
    GapiLens.set = (fun v x -> { x with count = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  
  let empty = {
    count = "";
    id = "";
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "count" x.count;
      GapiJson.render_string_value "id" x.id;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "count"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with count = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiUrlshortenerV1Model.StringCount.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AnalyticsSnapshot =
struct
  type t = {
    browsers : StringCount.t list;
    countries : StringCount.t list;
    longUrlClicks : string;
    platforms : StringCount.t list;
    referrers : StringCount.t list;
    shortUrlClicks : string;
    
  }
  
  let browsers = {
    GapiLens.get = (fun x -> x.browsers);
    GapiLens.set = (fun v x -> { x with browsers = v });
  }
  let countries = {
    GapiLens.get = (fun x -> x.countries);
    GapiLens.set = (fun v x -> { x with countries = v });
  }
  let longUrlClicks = {
    GapiLens.get = (fun x -> x.longUrlClicks);
    GapiLens.set = (fun v x -> { x with longUrlClicks = v });
  }
  let platforms = {
    GapiLens.get = (fun x -> x.platforms);
    GapiLens.set = (fun v x -> { x with platforms = v });
  }
  let referrers = {
    GapiLens.get = (fun x -> x.referrers);
    GapiLens.set = (fun v x -> { x with referrers = v });
  }
  let shortUrlClicks = {
    GapiLens.get = (fun x -> x.shortUrlClicks);
    GapiLens.set = (fun v x -> { x with shortUrlClicks = v });
  }
  
  let empty = {
    browsers = [];
    countries = [];
    longUrlClicks = "";
    platforms = [];
    referrers = [];
    shortUrlClicks = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "browsers" StringCount.render x.browsers;
      GapiJson.render_array "countries" StringCount.render x.countries;
      GapiJson.render_string_value "longUrlClicks" x.longUrlClicks;
      GapiJson.render_array "platforms" StringCount.render x.platforms;
      GapiJson.render_array "referrers" StringCount.render x.referrers;
      GapiJson.render_string_value "shortUrlClicks" x.shortUrlClicks;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "browsers"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              StringCount.parse
              StringCount.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiUrlshortenerV1Model.AnalyticsSnapshot.parse.parse_collection" e x')
        StringCount.empty
        (fun v -> { x with browsers = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "countries"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              StringCount.parse
              StringCount.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiUrlshortenerV1Model.AnalyticsSnapshot.parse.parse_collection" e x')
        StringCount.empty
        (fun v -> { x with countries = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "longUrlClicks"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with longUrlClicks = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "platforms"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              StringCount.parse
              StringCount.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiUrlshortenerV1Model.AnalyticsSnapshot.parse.parse_collection" e x')
        StringCount.empty
        (fun v -> { x with platforms = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "referrers"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              StringCount.parse
              StringCount.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiUrlshortenerV1Model.AnalyticsSnapshot.parse.parse_collection" e x')
        StringCount.empty
        (fun v -> { x with referrers = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shortUrlClicks"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with shortUrlClicks = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiUrlshortenerV1Model.AnalyticsSnapshot.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AnalyticsSummary =
struct
  type t = {
    allTime : AnalyticsSnapshot.t;
    day : AnalyticsSnapshot.t;
    month : AnalyticsSnapshot.t;
    twoHours : AnalyticsSnapshot.t;
    week : AnalyticsSnapshot.t;
    
  }
  
  let allTime = {
    GapiLens.get = (fun x -> x.allTime);
    GapiLens.set = (fun v x -> { x with allTime = v });
  }
  let day = {
    GapiLens.get = (fun x -> x.day);
    GapiLens.set = (fun v x -> { x with day = v });
  }
  let month = {
    GapiLens.get = (fun x -> x.month);
    GapiLens.set = (fun v x -> { x with month = v });
  }
  let twoHours = {
    GapiLens.get = (fun x -> x.twoHours);
    GapiLens.set = (fun v x -> { x with twoHours = v });
  }
  let week = {
    GapiLens.get = (fun x -> x.week);
    GapiLens.set = (fun v x -> { x with week = v });
  }
  
  let empty = {
    allTime = AnalyticsSnapshot.empty;
    day = AnalyticsSnapshot.empty;
    month = AnalyticsSnapshot.empty;
    twoHours = AnalyticsSnapshot.empty;
    week = AnalyticsSnapshot.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_object "allTime" (AnalyticsSnapshot.render_content x.allTime);
      GapiJson.render_object "day" (AnalyticsSnapshot.render_content x.day);
      GapiJson.render_object "month" (AnalyticsSnapshot.render_content x.month);
      GapiJson.render_object "twoHours" (AnalyticsSnapshot.render_content x.twoHours);
      GapiJson.render_object "week" (AnalyticsSnapshot.render_content x.week);
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "allTime"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnalyticsSnapshot.parse
        AnalyticsSnapshot.empty
        (fun v -> { x with allTime = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "day"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnalyticsSnapshot.parse
        AnalyticsSnapshot.empty
        (fun v -> { x with day = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "month"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnalyticsSnapshot.parse
        AnalyticsSnapshot.empty
        (fun v -> { x with month = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "twoHours"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnalyticsSnapshot.parse
        AnalyticsSnapshot.empty
        (fun v -> { x with twoHours = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "week"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnalyticsSnapshot.parse
        AnalyticsSnapshot.empty
        (fun v -> { x with week = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiUrlshortenerV1Model.AnalyticsSummary.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Url =
struct
  type t = {
    analytics : AnalyticsSummary.t;
    created : string;
    id : string;
    kind : string;
    longUrl : string;
    status : string;
    
  }
  
  let analytics = {
    GapiLens.get = (fun x -> x.analytics);
    GapiLens.set = (fun v x -> { x with analytics = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let longUrl = {
    GapiLens.get = (fun x -> x.longUrl);
    GapiLens.set = (fun v x -> { x with longUrl = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  
  let empty = {
    analytics = AnalyticsSummary.empty;
    created = "";
    id = "";
    kind = "";
    longUrl = "";
    status = "";
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_object "analytics" (AnalyticsSummary.render_content x.analytics);
      GapiJson.render_string_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "longUrl" x.longUrl;
      GapiJson.render_string_value "status" x.status;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "analytics"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnalyticsSummary.parse
        AnalyticsSummary.empty
        (fun v -> { x with analytics = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with created = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "longUrl"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with longUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiUrlshortenerV1Model.Url.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UrlHistory =
struct
  type t = {
    items : Url.t list;
    itemsPerPage : int;
    kind : string;
    nextPageToken : string;
    totalItems : int;
    
  }
  
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let itemsPerPage = {
    GapiLens.get = (fun x -> x.itemsPerPage);
    GapiLens.set = (fun v x -> { x with itemsPerPage = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let totalItems = {
    GapiLens.get = (fun x -> x.totalItems);
    GapiLens.set = (fun v x -> { x with totalItems = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextPageToken = "";
    totalItems = 0;
    
  }
  
  let rec render x = 
    GapiJson.render_object "" [
      GapiJson.render_array "items" Url.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_int_value "totalItems" x.totalItems;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Url.parse Url.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiUrlshortenerV1Model.UrlHistory.parse.parse_collection" e x')
        Url.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalItems"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with totalItems = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiUrlshortenerV1Model.UrlHistory.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

