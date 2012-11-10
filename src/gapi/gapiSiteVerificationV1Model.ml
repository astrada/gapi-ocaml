(* Warning! This file is generated. Modify at your own risk. *)

module SiteVerificationWebResourceResource =
struct
  module Site =
  struct
    type t = {
      identifier : string;
      _type : string;
      
    }
    
    let identifier = {
      GapiLens.get = (fun x -> x.identifier);
      GapiLens.set = (fun v x -> { x with identifier = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      identifier = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "identifier" x.identifier;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "identifier"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with identifier = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiSiteVerificationV1Model.Site.parse" e x
    
  end
  
  type t = {
    id : string;
    owners : string list;
    site : Site.t;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let owners = {
    GapiLens.get = (fun x -> x.owners);
    GapiLens.set = (fun v x -> { x with owners = v });
  }
  let site = {
    GapiLens.get = (fun x -> x.site);
    GapiLens.set = (fun v x -> { x with site = v });
  }
  
  let empty = {
    id = "";
    owners = [];
    site = Site.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "owners" (GapiJson.render_string_value "") x.owners;
      (fun v -> GapiJson.render_object "site" (Site.render_content v)) x.site;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "owners"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.parse.parse_collection" e x')
        ""
        (fun v -> { x with owners = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "site"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Site.parse
        Site.empty
        (fun v -> { x with site = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSiteVerificationV1Model.SiteVerificationWebResourceResource.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SiteVerificationWebResourceGettokenResponse =
struct
  type t = {
    _method : string;
    token : string;
    
  }
  
  let _method = {
    GapiLens.get = (fun x -> x._method);
    GapiLens.set = (fun v x -> { x with _method = v });
  }
  let token = {
    GapiLens.get = (fun x -> x.token);
    GapiLens.set = (fun v x -> { x with token = v });
  }
  
  let empty = {
    _method = "";
    token = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "method" x._method;
      GapiJson.render_string_value "token" x.token;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "method"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _method = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "token"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with token = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSiteVerificationV1Model.SiteVerificationWebResourceGettokenResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SiteVerificationWebResourceListResponse =
struct
  type t = {
    items : SiteVerificationWebResourceResource.t list;
    
  }
  
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  
  let empty = {
    items = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" SiteVerificationWebResourceResource.render x.items;
      
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
              SiteVerificationWebResourceResource.parse
              SiteVerificationWebResourceResource.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSiteVerificationV1Model.SiteVerificationWebResourceListResponse.parse.parse_collection" e x')
        SiteVerificationWebResourceResource.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSiteVerificationV1Model.SiteVerificationWebResourceListResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SiteVerificationWebResourceGettokenRequest =
struct
  module Site =
  struct
    type t = {
      identifier : string;
      _type : string;
      
    }
    
    let identifier = {
      GapiLens.get = (fun x -> x.identifier);
      GapiLens.set = (fun v x -> { x with identifier = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      identifier = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "identifier" x.identifier;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "identifier"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with identifier = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiSiteVerificationV1Model.Site.parse" e x
    
  end
  
  type t = {
    site : Site.t;
    verificationMethod : string;
    
  }
  
  let site = {
    GapiLens.get = (fun x -> x.site);
    GapiLens.set = (fun v x -> { x with site = v });
  }
  let verificationMethod = {
    GapiLens.get = (fun x -> x.verificationMethod);
    GapiLens.set = (fun v x -> { x with verificationMethod = v });
  }
  
  let empty = {
    site = Site.empty;
    verificationMethod = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "site" (Site.render_content v)) x.site;
      GapiJson.render_string_value "verificationMethod" x.verificationMethod;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "site"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Site.parse
        Site.empty
        (fun v -> { x with site = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verificationMethod"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with verificationMethod = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSiteVerificationV1Model.SiteVerificationWebResourceGettokenRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

