(* Warning! This file is generated. Modify at your own risk. *)

module Goal =
struct
  module VisitTimeOnSiteDetails =
  struct
    type t = {
      comparisonType : string;
      comparisonValue : int64;
      
    }
    
    let comparisonType = {
      GapiLens.get = (fun x -> x.comparisonType);
      GapiLens.set = (fun v x -> { x with comparisonType = v });
    }
    let comparisonValue = {
      GapiLens.get = (fun x -> x.comparisonValue);
      GapiLens.set = (fun v x -> { x with comparisonValue = v });
    }
    
    let empty = {
      comparisonType = "";
      comparisonValue = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "comparisonType" x.comparisonType;
        GapiJson.render_int64_value "comparisonValue" x.comparisonValue;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "comparisonType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with comparisonType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "comparisonValue"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with comparisonValue = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.VisitTimeOnSiteDetails.parse" e x
    
  end
  
  module VisitNumPagesDetails =
  struct
    type t = {
      comparisonType : string;
      comparisonValue : int64;
      
    }
    
    let comparisonType = {
      GapiLens.get = (fun x -> x.comparisonType);
      GapiLens.set = (fun v x -> { x with comparisonType = v });
    }
    let comparisonValue = {
      GapiLens.get = (fun x -> x.comparisonValue);
      GapiLens.set = (fun v x -> { x with comparisonValue = v });
    }
    
    let empty = {
      comparisonType = "";
      comparisonValue = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "comparisonType" x.comparisonType;
        GapiJson.render_int64_value "comparisonValue" x.comparisonValue;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "comparisonType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with comparisonType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "comparisonValue"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with comparisonValue = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.VisitNumPagesDetails.parse" e x
    
  end
  
  module UrlDestinationDetails =
  struct
    module Steps =
    struct
      type t = {
        name : string;
        number : int;
        url : string;
        
      }
      
      let name = {
        GapiLens.get = (fun x -> x.name);
        GapiLens.set = (fun v x -> { x with name = v });
      }
      let number = {
        GapiLens.get = (fun x -> x.number);
        GapiLens.set = (fun v x -> { x with number = v });
      }
      let url = {
        GapiLens.get = (fun x -> x.url);
        GapiLens.set = (fun v x -> { x with url = v });
      }
      
      let empty = {
        name = "";
        number = 0;
        url = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "name" x.name;
          GapiJson.render_int_value "number" x.number;
          GapiJson.render_string_value "url" x.url;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with name = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "number"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with number = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with url = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAnalyticsV3Model.Steps.parse" e x
      
    end
    
    type t = {
      caseSensitive : bool;
      firstStepRequired : bool;
      matchType : string;
      steps : Steps.t list;
      url : string;
      
    }
    
    let caseSensitive = {
      GapiLens.get = (fun x -> x.caseSensitive);
      GapiLens.set = (fun v x -> { x with caseSensitive = v });
    }
    let firstStepRequired = {
      GapiLens.get = (fun x -> x.firstStepRequired);
      GapiLens.set = (fun v x -> { x with firstStepRequired = v });
    }
    let matchType = {
      GapiLens.get = (fun x -> x.matchType);
      GapiLens.set = (fun v x -> { x with matchType = v });
    }
    let steps = {
      GapiLens.get = (fun x -> x.steps);
      GapiLens.set = (fun v x -> { x with steps = v });
    }
    let url = {
      GapiLens.get = (fun x -> x.url);
      GapiLens.set = (fun v x -> { x with url = v });
    }
    
    let empty = {
      caseSensitive = false;
      firstStepRequired = false;
      matchType = "";
      steps = [];
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "caseSensitive" x.caseSensitive;
        GapiJson.render_bool_value "firstStepRequired" x.firstStepRequired;
        GapiJson.render_string_value "matchType" x.matchType;
        GapiJson.render_array "steps" Steps.render x.steps;
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "caseSensitive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with caseSensitive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "firstStepRequired"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with firstStepRequired = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "matchType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with matchType = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "steps"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children Steps.parse Steps.empty (fun v -> v) cs
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.UrlDestinationDetails.parse.parse_collection" e x')
          Steps.empty
          (fun v -> { x with steps = v })
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
        GapiJson.unexpected "GapiAnalyticsV3Model.UrlDestinationDetails.parse" e x
    
  end
  
  module ParentLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ParentLink.parse" e x
    
  end
  
  module EventDetails =
  struct
    module EventConditions =
    struct
      type t = {
        comparisonType : string;
        comparisonValue : int64;
        expression : string;
        matchType : string;
        _type : string;
        
      }
      
      let comparisonType = {
        GapiLens.get = (fun x -> x.comparisonType);
        GapiLens.set = (fun v x -> { x with comparisonType = v });
      }
      let comparisonValue = {
        GapiLens.get = (fun x -> x.comparisonValue);
        GapiLens.set = (fun v x -> { x with comparisonValue = v });
      }
      let expression = {
        GapiLens.get = (fun x -> x.expression);
        GapiLens.set = (fun v x -> { x with expression = v });
      }
      let matchType = {
        GapiLens.get = (fun x -> x.matchType);
        GapiLens.set = (fun v x -> { x with matchType = v });
      }
      let _type = {
        GapiLens.get = (fun x -> x._type);
        GapiLens.set = (fun v x -> { x with _type = v });
      }
      
      let empty = {
        comparisonType = "";
        comparisonValue = 0L;
        expression = "";
        matchType = "";
        _type = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "comparisonType" x.comparisonType;
          GapiJson.render_int64_value "comparisonValue" x.comparisonValue;
          GapiJson.render_string_value "expression" x.expression;
          GapiJson.render_string_value "matchType" x.matchType;
          GapiJson.render_string_value "type" x._type;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "comparisonType"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with comparisonType = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "comparisonValue"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with comparisonValue = Int64.of_string v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "expression"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with expression = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "matchType"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with matchType = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with _type = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAnalyticsV3Model.EventConditions.parse" e x
      
    end
    
    type t = {
      eventConditions : EventConditions.t list;
      useEventValue : bool;
      
    }
    
    let eventConditions = {
      GapiLens.get = (fun x -> x.eventConditions);
      GapiLens.set = (fun v x -> { x with eventConditions = v });
    }
    let useEventValue = {
      GapiLens.get = (fun x -> x.useEventValue);
      GapiLens.set = (fun v x -> { x with useEventValue = v });
    }
    
    let empty = {
      eventConditions = [];
      useEventValue = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "eventConditions" EventConditions.render x.eventConditions;
        GapiJson.render_bool_value "useEventValue" x.useEventValue;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "eventConditions"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                EventConditions.parse
                EventConditions.empty
                (fun v -> v)
                cs
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.EventDetails.parse.parse_collection" e x')
          EventConditions.empty
          (fun v -> { x with eventConditions = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "useEventValue"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with useEventValue = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.EventDetails.parse" e x
    
  end
  
  type t = {
    accountId : string;
    active : bool;
    created : GapiDate.t;
    eventDetails : EventDetails.t;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    profileId : string;
    selfLink : string;
    _type : string;
    updated : GapiDate.t;
    urlDestinationDetails : UrlDestinationDetails.t;
    value : float;
    visitNumPagesDetails : VisitNumPagesDetails.t;
    visitTimeOnSiteDetails : VisitTimeOnSiteDetails.t;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let active = {
    GapiLens.get = (fun x -> x.active);
    GapiLens.set = (fun v x -> { x with active = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let eventDetails = {
    GapiLens.get = (fun x -> x.eventDetails);
    GapiLens.set = (fun v x -> { x with eventDetails = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let internalWebPropertyId = {
    GapiLens.get = (fun x -> x.internalWebPropertyId);
    GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let profileId = {
    GapiLens.get = (fun x -> x.profileId);
    GapiLens.set = (fun v x -> { x with profileId = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let urlDestinationDetails = {
    GapiLens.get = (fun x -> x.urlDestinationDetails);
    GapiLens.set = (fun v x -> { x with urlDestinationDetails = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  let visitNumPagesDetails = {
    GapiLens.get = (fun x -> x.visitNumPagesDetails);
    GapiLens.set = (fun v x -> { x with visitNumPagesDetails = v });
  }
  let visitTimeOnSiteDetails = {
    GapiLens.get = (fun x -> x.visitTimeOnSiteDetails);
    GapiLens.set = (fun v x -> { x with visitTimeOnSiteDetails = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    active = false;
    created = GapiDate.epoch;
    eventDetails = EventDetails.empty;
    id = "";
    internalWebPropertyId = "";
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    profileId = "";
    selfLink = "";
    _type = "";
    updated = GapiDate.epoch;
    urlDestinationDetails = UrlDestinationDetails.empty;
    value = 0.0;
    visitNumPagesDetails = VisitNumPagesDetails.empty;
    visitTimeOnSiteDetails = VisitTimeOnSiteDetails.empty;
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_bool_value "active" x.active;
      GapiJson.render_date_value "created" x.created;
      (fun v -> GapiJson.render_object "eventDetails" (EventDetails.render_content v)) x.eventDetails;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_string_value "profileId" x.profileId;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_date_value "updated" x.updated;
      (fun v -> GapiJson.render_object "urlDestinationDetails" (UrlDestinationDetails.render_content v)) x.urlDestinationDetails;
      GapiJson.render_float_value "value" x.value;
      (fun v -> GapiJson.render_object "visitNumPagesDetails" (VisitNumPagesDetails.render_content v)) x.visitNumPagesDetails;
      (fun v -> GapiJson.render_object "visitTimeOnSiteDetails" (VisitTimeOnSiteDetails.render_content v)) x.visitTimeOnSiteDetails;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "active"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with active = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "eventDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EventDetails.parse
        EventDetails.empty
        (fun v -> { x with eventDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with internalWebPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parentLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ParentLink.parse
        ParentLink.empty
        (fun v -> { x with parentLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "profileId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with profileId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "urlDestinationDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UrlDestinationDetails.parse
        UrlDestinationDetails.empty
        (fun v -> { x with urlDestinationDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with value = float_of_int v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visitNumPagesDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        VisitNumPagesDetails.parse
        VisitNumPagesDetails.empty
        (fun v -> { x with visitNumPagesDetails = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visitTimeOnSiteDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        VisitTimeOnSiteDetails.parse
        VisitTimeOnSiteDetails.empty
        (fun v -> { x with visitTimeOnSiteDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Goal.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Goals =
struct
  type t = {
    items : Goal.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Goal.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
            GapiJson.parse_children Goal.parse Goal.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Goals.parse.parse_collection" e x')
        Goal.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Goals.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Segment =
struct
  type t = {
    created : GapiDate.t;
    definition : string;
    id : string;
    kind : string;
    name : string;
    segmentId : string;
    selfLink : string;
    updated : GapiDate.t;
    
  }
  
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let definition = {
    GapiLens.get = (fun x -> x.definition);
    GapiLens.set = (fun v x -> { x with definition = v });
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
  let segmentId = {
    GapiLens.get = (fun x -> x.segmentId);
    GapiLens.set = (fun v x -> { x with segmentId = v });
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
    created = GapiDate.epoch;
    definition = "";
    id = "";
    kind = "";
    name = "";
    segmentId = "";
    selfLink = "";
    updated = GapiDate.epoch;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "definition" x.definition;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "segmentId" x.segmentId;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "definition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with definition = v }
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
        ({ GapiJson.name = "segmentId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with segmentId = v }
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
      GapiJson.unexpected "GapiAnalyticsV3Model.Segment.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GaData =
struct
  module Query =
  struct
    type t = {
      dimensions : string;
      end_date : string;
      filters : string;
      ids : string;
      max_results : int;
      metrics : string list;
      segment : string;
      sort : string list;
      start_date : string;
      start_index : int;
      
    }
    
    let dimensions = {
      GapiLens.get = (fun x -> x.dimensions);
      GapiLens.set = (fun v x -> { x with dimensions = v });
    }
    let end_date = {
      GapiLens.get = (fun x -> x.end_date);
      GapiLens.set = (fun v x -> { x with end_date = v });
    }
    let filters = {
      GapiLens.get = (fun x -> x.filters);
      GapiLens.set = (fun v x -> { x with filters = v });
    }
    let ids = {
      GapiLens.get = (fun x -> x.ids);
      GapiLens.set = (fun v x -> { x with ids = v });
    }
    let max_results = {
      GapiLens.get = (fun x -> x.max_results);
      GapiLens.set = (fun v x -> { x with max_results = v });
    }
    let metrics = {
      GapiLens.get = (fun x -> x.metrics);
      GapiLens.set = (fun v x -> { x with metrics = v });
    }
    let segment = {
      GapiLens.get = (fun x -> x.segment);
      GapiLens.set = (fun v x -> { x with segment = v });
    }
    let sort = {
      GapiLens.get = (fun x -> x.sort);
      GapiLens.set = (fun v x -> { x with sort = v });
    }
    let start_date = {
      GapiLens.get = (fun x -> x.start_date);
      GapiLens.set = (fun v x -> { x with start_date = v });
    }
    let start_index = {
      GapiLens.get = (fun x -> x.start_index);
      GapiLens.set = (fun v x -> { x with start_index = v });
    }
    
    let empty = {
      dimensions = "";
      end_date = "";
      filters = "";
      ids = "";
      max_results = 0;
      metrics = [];
      segment = "";
      sort = [];
      start_date = "";
      start_index = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "dimensions" x.dimensions;
        GapiJson.render_string_value "end-date" x.end_date;
        GapiJson.render_string_value "filters" x.filters;
        GapiJson.render_string_value "ids" x.ids;
        GapiJson.render_int_value "max-results" x.max_results;
        GapiJson.render_array "metrics" (GapiJson.render_string_value "") x.metrics;
        GapiJson.render_string_value "segment" x.segment;
        GapiJson.render_array "sort" (GapiJson.render_string_value "") x.sort;
        GapiJson.render_string_value "start-date" x.start_date;
        GapiJson.render_int_value "start-index" x.start_index;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "dimensions"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with dimensions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "end-date"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with end_date = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "filters"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with filters = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "ids"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with ids = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "max-results"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with max_results = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "metrics"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Query.parse.parse_collection" e x')
          ""
          (fun v -> { x with metrics = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "segment"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with segment = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "sort"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Query.parse.parse_collection" e x')
          ""
          (fun v -> { x with sort = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "start-date"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with start_date = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "start-index"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with start_index = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Query.parse" e x
    
  end
  
  module ProfileInfo =
  struct
    type t = {
      accountId : string;
      internalWebPropertyId : string;
      profileId : string;
      profileName : string;
      tableId : string;
      webPropertyId : string;
      
    }
    
    let accountId = {
      GapiLens.get = (fun x -> x.accountId);
      GapiLens.set = (fun v x -> { x with accountId = v });
    }
    let internalWebPropertyId = {
      GapiLens.get = (fun x -> x.internalWebPropertyId);
      GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
    }
    let profileId = {
      GapiLens.get = (fun x -> x.profileId);
      GapiLens.set = (fun v x -> { x with profileId = v });
    }
    let profileName = {
      GapiLens.get = (fun x -> x.profileName);
      GapiLens.set = (fun v x -> { x with profileName = v });
    }
    let tableId = {
      GapiLens.get = (fun x -> x.tableId);
      GapiLens.set = (fun v x -> { x with tableId = v });
    }
    let webPropertyId = {
      GapiLens.get = (fun x -> x.webPropertyId);
      GapiLens.set = (fun v x -> { x with webPropertyId = v });
    }
    
    let empty = {
      accountId = "";
      internalWebPropertyId = "";
      profileId = "";
      profileName = "";
      tableId = "";
      webPropertyId = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "accountId" x.accountId;
        GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
        GapiJson.render_string_value "profileId" x.profileId;
        GapiJson.render_string_value "profileName" x.profileName;
        GapiJson.render_string_value "tableId" x.tableId;
        GapiJson.render_string_value "webPropertyId" x.webPropertyId;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with accountId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with internalWebPropertyId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "profileId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with profileId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "profileName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with profileName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "tableId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with tableId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with webPropertyId = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ProfileInfo.parse" e x
    
  end
  
  module ColumnHeaders =
  struct
    type t = {
      columnType : string;
      dataType : string;
      name : string;
      
    }
    
    let columnType = {
      GapiLens.get = (fun x -> x.columnType);
      GapiLens.set = (fun v x -> { x with columnType = v });
    }
    let dataType = {
      GapiLens.get = (fun x -> x.dataType);
      GapiLens.set = (fun v x -> { x with dataType = v });
    }
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    
    let empty = {
      columnType = "";
      dataType = "";
      name = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "columnType" x.columnType;
        GapiJson.render_string_value "dataType" x.dataType;
        GapiJson.render_string_value "name" x.name;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "columnType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with columnType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "dataType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with dataType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ColumnHeaders.parse" e x
    
  end
  
  type t = {
    columnHeaders : ColumnHeaders.t list;
    containsSampledData : bool;
    id : string;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    profileInfo : ProfileInfo.t;
    query : Query.t;
    rows : string list list;
    selfLink : string;
    totalResults : int;
    totalsForAllResults : (string * string) list;
    
  }
  
  let columnHeaders = {
    GapiLens.get = (fun x -> x.columnHeaders);
    GapiLens.set = (fun v x -> { x with columnHeaders = v });
  }
  let containsSampledData = {
    GapiLens.get = (fun x -> x.containsSampledData);
    GapiLens.set = (fun v x -> { x with containsSampledData = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let itemsPerPage = {
    GapiLens.get = (fun x -> x.itemsPerPage);
    GapiLens.set = (fun v x -> { x with itemsPerPage = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let profileInfo = {
    GapiLens.get = (fun x -> x.profileInfo);
    GapiLens.set = (fun v x -> { x with profileInfo = v });
  }
  let query = {
    GapiLens.get = (fun x -> x.query);
    GapiLens.set = (fun v x -> { x with query = v });
  }
  let rows = {
    GapiLens.get = (fun x -> x.rows);
    GapiLens.set = (fun v x -> { x with rows = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let totalsForAllResults = {
    GapiLens.get = (fun x -> x.totalsForAllResults);
    GapiLens.set = (fun v x -> { x with totalsForAllResults = v });
  }
  
  let empty = {
    columnHeaders = [];
    containsSampledData = false;
    id = "";
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    profileInfo = ProfileInfo.empty;
    query = Query.empty;
    rows = [];
    selfLink = "";
    totalResults = 0;
    totalsForAllResults = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "columnHeaders" ColumnHeaders.render x.columnHeaders;
      GapiJson.render_bool_value "containsSampledData" x.containsSampledData;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      (fun v -> GapiJson.render_object "profileInfo" (ProfileInfo.render_content v)) x.profileInfo;
      (fun v -> GapiJson.render_object "query" (Query.render_content v)) x.query;
      GapiJson.render_array "rows" (GapiJson.render_array "" (GapiJson.render_string_value "")) x.rows;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_collection "totalsForAllResults" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x.totalsForAllResults;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnHeaders"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ColumnHeaders.parse
              ColumnHeaders.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.GaData.parse.parse_collection" e x')
        ColumnHeaders.empty
        (fun v -> { x with columnHeaders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "containsSampledData"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with containsSampledData = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "profileInfo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ProfileInfo.parse
        ProfileInfo.empty
        (fun v -> { x with profileInfo = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "query"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Query.parse
        Query.empty
        (fun v -> { x with query = v })
        cs
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
                  GapiJson.unexpected "GapiAnalyticsV3Model.GaData.parse.parse_collection" e x')
              ""
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.GaData.parse.parse_collection" e x')
        []
        (fun v -> { x with rows = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "totalsForAllResults"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.GaData.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with totalsForAllResults = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.GaData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Webproperty =
struct
  module ParentLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ParentLink.parse" e x
    
  end
  
  module ChildLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ChildLink.parse" e x
    
  end
  
  type t = {
    accountId : string;
    childLink : ChildLink.t;
    created : GapiDate.t;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    selfLink : string;
    updated : GapiDate.t;
    websiteUrl : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let childLink = {
    GapiLens.get = (fun x -> x.childLink);
    GapiLens.set = (fun v x -> { x with childLink = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let internalWebPropertyId = {
    GapiLens.get = (fun x -> x.internalWebPropertyId);
    GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let websiteUrl = {
    GapiLens.get = (fun x -> x.websiteUrl);
    GapiLens.set = (fun v x -> { x with websiteUrl = v });
  }
  
  let empty = {
    accountId = "";
    childLink = ChildLink.empty;
    created = GapiDate.epoch;
    id = "";
    internalWebPropertyId = "";
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    selfLink = "";
    updated = GapiDate.epoch;
    websiteUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "websiteUrl" x.websiteUrl;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "childLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChildLink.parse
        ChildLink.empty
        (fun v -> { x with childLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with internalWebPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parentLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ParentLink.parse
        ParentLink.empty
        (fun v -> { x with parentLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "websiteUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with websiteUrl = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Webproperty.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomDataSource =
struct
  module ParentLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ParentLink.parse" e x
    
  end
  
  module ChildLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ChildLink.parse" e x
    
  end
  
  type t = {
    accountId : string;
    childLink : ChildLink.t;
    created : GapiDate.t;
    description : string;
    id : string;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    profilesLinked : string list;
    selfLink : string;
    updated : GapiDate.t;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let childLink = {
    GapiLens.get = (fun x -> x.childLink);
    GapiLens.set = (fun v x -> { x with childLink = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
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
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let profilesLinked = {
    GapiLens.get = (fun x -> x.profilesLinked);
    GapiLens.set = (fun v x -> { x with profilesLinked = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    childLink = ChildLink.empty;
    created = GapiDate.epoch;
    description = "";
    id = "";
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    profilesLinked = [];
    selfLink = "";
    updated = GapiDate.epoch;
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_array "profilesLinked" (GapiJson.render_string_value "") x.profilesLinked;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "childLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChildLink.parse
        ChildLink.empty
        (fun v -> { x with childLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
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
        ({ GapiJson.name = "parentLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ParentLink.parse
        ParentLink.empty
        (fun v -> { x with parentLink = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "profilesLinked"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.CustomDataSource.parse.parse_collection" e x')
        ""
        (fun v -> { x with profilesLinked = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.CustomDataSource.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Profile =
struct
  module ParentLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ParentLink.parse" e x
    
  end
  
  module ChildLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ChildLink.parse" e x
    
  end
  
  type t = {
    accountId : string;
    childLink : ChildLink.t;
    created : GapiDate.t;
    currency : string;
    defaultPage : string;
    eCommerceTracking : bool;
    excludeQueryParameters : string;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    selfLink : string;
    siteSearchCategoryParameters : string;
    siteSearchQueryParameters : string;
    timezone : string;
    _type : string;
    updated : GapiDate.t;
    webPropertyId : string;
    websiteUrl : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let childLink = {
    GapiLens.get = (fun x -> x.childLink);
    GapiLens.set = (fun v x -> { x with childLink = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let currency = {
    GapiLens.get = (fun x -> x.currency);
    GapiLens.set = (fun v x -> { x with currency = v });
  }
  let defaultPage = {
    GapiLens.get = (fun x -> x.defaultPage);
    GapiLens.set = (fun v x -> { x with defaultPage = v });
  }
  let eCommerceTracking = {
    GapiLens.get = (fun x -> x.eCommerceTracking);
    GapiLens.set = (fun v x -> { x with eCommerceTracking = v });
  }
  let excludeQueryParameters = {
    GapiLens.get = (fun x -> x.excludeQueryParameters);
    GapiLens.set = (fun v x -> { x with excludeQueryParameters = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let internalWebPropertyId = {
    GapiLens.get = (fun x -> x.internalWebPropertyId);
    GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let siteSearchCategoryParameters = {
    GapiLens.get = (fun x -> x.siteSearchCategoryParameters);
    GapiLens.set = (fun v x -> { x with siteSearchCategoryParameters = v });
  }
  let siteSearchQueryParameters = {
    GapiLens.get = (fun x -> x.siteSearchQueryParameters);
    GapiLens.set = (fun v x -> { x with siteSearchQueryParameters = v });
  }
  let timezone = {
    GapiLens.get = (fun x -> x.timezone);
    GapiLens.set = (fun v x -> { x with timezone = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  let websiteUrl = {
    GapiLens.get = (fun x -> x.websiteUrl);
    GapiLens.set = (fun v x -> { x with websiteUrl = v });
  }
  
  let empty = {
    accountId = "";
    childLink = ChildLink.empty;
    created = GapiDate.epoch;
    currency = "";
    defaultPage = "";
    eCommerceTracking = false;
    excludeQueryParameters = "";
    id = "";
    internalWebPropertyId = "";
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    selfLink = "";
    siteSearchCategoryParameters = "";
    siteSearchQueryParameters = "";
    timezone = "";
    _type = "";
    updated = GapiDate.epoch;
    webPropertyId = "";
    websiteUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "currency" x.currency;
      GapiJson.render_string_value "defaultPage" x.defaultPage;
      GapiJson.render_bool_value "eCommerceTracking" x.eCommerceTracking;
      GapiJson.render_string_value "excludeQueryParameters" x.excludeQueryParameters;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "siteSearchCategoryParameters" x.siteSearchCategoryParameters;
      GapiJson.render_string_value "siteSearchQueryParameters" x.siteSearchQueryParameters;
      GapiJson.render_string_value "timezone" x.timezone;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      GapiJson.render_string_value "websiteUrl" x.websiteUrl;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "childLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChildLink.parse
        ChildLink.empty
        (fun v -> { x with childLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "currency"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with currency = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "defaultPage"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with defaultPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "eCommerceTracking"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with eCommerceTracking = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "excludeQueryParameters"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with excludeQueryParameters = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with internalWebPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parentLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ParentLink.parse
        ParentLink.empty
        (fun v -> { x with parentLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "siteSearchCategoryParameters"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with siteSearchCategoryParameters = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "siteSearchQueryParameters"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with siteSearchQueryParameters = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timezone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timezone = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "websiteUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with websiteUrl = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Profile.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Profiles =
struct
  type t = {
    items : Profile.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Profile.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
              Profile.parse
              Profile.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Profiles.parse.parse_collection" e x')
        Profile.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Profiles.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DailyUpload =
struct
  module RecentChanges =
  struct
    type t = {
      change : string;
      time : GapiDate.t;
      
    }
    
    let change = {
      GapiLens.get = (fun x -> x.change);
      GapiLens.set = (fun v x -> { x with change = v });
    }
    let time = {
      GapiLens.get = (fun x -> x.time);
      GapiLens.set = (fun v x -> { x with time = v });
    }
    
    let empty = {
      change = "";
      time = GapiDate.epoch;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "change" x.change;
        GapiJson.render_date_value "time" x.time;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "change"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with change = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "time"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with time = GapiDate.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.RecentChanges.parse" e x
    
  end
  
  module ParentLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ParentLink.parse" e x
    
  end
  
  type t = {
    accountId : string;
    appendCount : int;
    createdTime : GapiDate.t;
    customDataSourceId : string;
    date : string;
    kind : string;
    modifiedTime : GapiDate.t;
    parentLink : ParentLink.t;
    recentChanges : RecentChanges.t list;
    selfLink : string;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let appendCount = {
    GapiLens.get = (fun x -> x.appendCount);
    GapiLens.set = (fun v x -> { x with appendCount = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let customDataSourceId = {
    GapiLens.get = (fun x -> x.customDataSourceId);
    GapiLens.set = (fun v x -> { x with customDataSourceId = v });
  }
  let date = {
    GapiLens.get = (fun x -> x.date);
    GapiLens.set = (fun v x -> { x with date = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let recentChanges = {
    GapiLens.get = (fun x -> x.recentChanges);
    GapiLens.set = (fun v x -> { x with recentChanges = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    appendCount = 0;
    createdTime = GapiDate.epoch;
    customDataSourceId = "";
    date = "";
    kind = "";
    modifiedTime = GapiDate.epoch;
    parentLink = ParentLink.empty;
    recentChanges = [];
    selfLink = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_int_value "appendCount" x.appendCount;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_string_value "customDataSourceId" x.customDataSourceId;
      GapiJson.render_string_value "date" x.date;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_array "recentChanges" RecentChanges.render x.recentChanges;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "appendCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with appendCount = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "customDataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with customDataSourceId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "date"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with date = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parentLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ParentLink.parse
        ParentLink.empty
        (fun v -> { x with parentLink = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "recentChanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RecentChanges.parse
              RecentChanges.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.DailyUpload.parse.parse_collection" e x')
        RecentChanges.empty
        (fun v -> { x with recentChanges = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.DailyUpload.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DailyUploads =
struct
  type t = {
    items : DailyUpload.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" DailyUpload.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
              DailyUpload.parse
              DailyUpload.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.DailyUploads.parse.parse_collection" e x')
        DailyUpload.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.DailyUploads.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Webproperties =
struct
  type t = {
    items : Webproperty.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Webproperty.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
              Webproperty.parse
              Webproperty.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Webproperties.parse.parse_collection" e x')
        Webproperty.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Webproperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Account =
struct
  module ChildLink =
  struct
    type t = {
      href : string;
      _type : string;
      
    }
    
    let href = {
      GapiLens.get = (fun x -> x.href);
      GapiLens.set = (fun v x -> { x with href = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      href = "";
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "href" x.href;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ChildLink.parse" e x
    
  end
  
  type t = {
    childLink : ChildLink.t;
    created : GapiDate.t;
    id : string;
    kind : string;
    name : string;
    selfLink : string;
    updated : GapiDate.t;
    
  }
  
  let childLink = {
    GapiLens.get = (fun x -> x.childLink);
    GapiLens.set = (fun v x -> { x with childLink = v });
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
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
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
    childLink = ChildLink.empty;
    created = GapiDate.epoch;
    id = "";
    kind = "";
    name = "";
    selfLink = "";
    updated = GapiDate.epoch;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "childLink"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChildLink.parse
        ChildLink.empty
        (fun v -> { x with childLink = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
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
      GapiJson.unexpected "GapiAnalyticsV3Model.Account.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DailyUploadAppend =
struct
  type t = {
    accountId : string;
    appendNumber : int;
    customDataSourceId : string;
    date : string;
    kind : string;
    nextAppendLink : string;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let appendNumber = {
    GapiLens.get = (fun x -> x.appendNumber);
    GapiLens.set = (fun v x -> { x with appendNumber = v });
  }
  let customDataSourceId = {
    GapiLens.get = (fun x -> x.customDataSourceId);
    GapiLens.set = (fun v x -> { x with customDataSourceId = v });
  }
  let date = {
    GapiLens.get = (fun x -> x.date);
    GapiLens.set = (fun v x -> { x with date = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextAppendLink = {
    GapiLens.get = (fun x -> x.nextAppendLink);
    GapiLens.set = (fun v x -> { x with nextAppendLink = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    appendNumber = 0;
    customDataSourceId = "";
    date = "";
    kind = "";
    nextAppendLink = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_int_value "appendNumber" x.appendNumber;
      GapiJson.render_string_value "customDataSourceId" x.customDataSourceId;
      GapiJson.render_string_value "date" x.date;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextAppendLink" x.nextAppendLink;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "appendNumber"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with appendNumber = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "customDataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with customDataSourceId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "date"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with date = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextAppendLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextAppendLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.DailyUploadAppend.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Segments =
struct
  type t = {
    items : Segment.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Segment.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
              Segment.parse
              Segment.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Segments.parse.parse_collection" e x')
        Segment.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Segments.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module McfData =
struct
  module Rows =
  struct
    module ConversionPathValue =
    struct
      type t = {
        interactionType : string;
        nodeValue : string;
        
      }
      
      let interactionType = {
        GapiLens.get = (fun x -> x.interactionType);
        GapiLens.set = (fun v x -> { x with interactionType = v });
      }
      let nodeValue = {
        GapiLens.get = (fun x -> x.nodeValue);
        GapiLens.set = (fun v x -> { x with nodeValue = v });
      }
      
      let empty = {
        interactionType = "";
        nodeValue = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "interactionType" x.interactionType;
          GapiJson.render_string_value "nodeValue" x.nodeValue;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "interactionType"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with interactionType = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "nodeValue"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with nodeValue = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAnalyticsV3Model.ConversionPathValue.parse" e x
      
    end
    
    type t = {
      conversionPathValue : ConversionPathValue.t list;
      primitiveValue : string;
      
    }
    
    let conversionPathValue = {
      GapiLens.get = (fun x -> x.conversionPathValue);
      GapiLens.set = (fun v x -> { x with conversionPathValue = v });
    }
    let primitiveValue = {
      GapiLens.get = (fun x -> x.primitiveValue);
      GapiLens.set = (fun v x -> { x with primitiveValue = v });
    }
    
    let empty = {
      conversionPathValue = [];
      primitiveValue = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "conversionPathValue" ConversionPathValue.render x.conversionPathValue;
        GapiJson.render_string_value "primitiveValue" x.primitiveValue;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "conversionPathValue"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                ConversionPathValue.parse
                ConversionPathValue.empty
                (fun v -> v)
                cs
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Rows.parse.parse_collection" e x')
          ConversionPathValue.empty
          (fun v -> { x with conversionPathValue = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "primitiveValue"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with primitiveValue = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Rows.parse" e x
    
  end
  
  module Query =
  struct
    type t = {
      dimensions : string;
      end_date : string;
      filters : string;
      ids : string;
      max_results : int;
      metrics : string list;
      segment : string;
      sort : string list;
      start_date : string;
      start_index : int;
      
    }
    
    let dimensions = {
      GapiLens.get = (fun x -> x.dimensions);
      GapiLens.set = (fun v x -> { x with dimensions = v });
    }
    let end_date = {
      GapiLens.get = (fun x -> x.end_date);
      GapiLens.set = (fun v x -> { x with end_date = v });
    }
    let filters = {
      GapiLens.get = (fun x -> x.filters);
      GapiLens.set = (fun v x -> { x with filters = v });
    }
    let ids = {
      GapiLens.get = (fun x -> x.ids);
      GapiLens.set = (fun v x -> { x with ids = v });
    }
    let max_results = {
      GapiLens.get = (fun x -> x.max_results);
      GapiLens.set = (fun v x -> { x with max_results = v });
    }
    let metrics = {
      GapiLens.get = (fun x -> x.metrics);
      GapiLens.set = (fun v x -> { x with metrics = v });
    }
    let segment = {
      GapiLens.get = (fun x -> x.segment);
      GapiLens.set = (fun v x -> { x with segment = v });
    }
    let sort = {
      GapiLens.get = (fun x -> x.sort);
      GapiLens.set = (fun v x -> { x with sort = v });
    }
    let start_date = {
      GapiLens.get = (fun x -> x.start_date);
      GapiLens.set = (fun v x -> { x with start_date = v });
    }
    let start_index = {
      GapiLens.get = (fun x -> x.start_index);
      GapiLens.set = (fun v x -> { x with start_index = v });
    }
    
    let empty = {
      dimensions = "";
      end_date = "";
      filters = "";
      ids = "";
      max_results = 0;
      metrics = [];
      segment = "";
      sort = [];
      start_date = "";
      start_index = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "dimensions" x.dimensions;
        GapiJson.render_string_value "end-date" x.end_date;
        GapiJson.render_string_value "filters" x.filters;
        GapiJson.render_string_value "ids" x.ids;
        GapiJson.render_int_value "max-results" x.max_results;
        GapiJson.render_array "metrics" (GapiJson.render_string_value "") x.metrics;
        GapiJson.render_string_value "segment" x.segment;
        GapiJson.render_array "sort" (GapiJson.render_string_value "") x.sort;
        GapiJson.render_string_value "start-date" x.start_date;
        GapiJson.render_int_value "start-index" x.start_index;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "dimensions"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with dimensions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "end-date"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with end_date = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "filters"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with filters = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "ids"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with ids = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "max-results"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with max_results = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "metrics"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Query.parse.parse_collection" e x')
          ""
          (fun v -> { x with metrics = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "segment"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with segment = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "sort"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Query.parse.parse_collection" e x')
          ""
          (fun v -> { x with sort = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "start-date"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with start_date = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "start-index"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with start_index = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Query.parse" e x
    
  end
  
  module ProfileInfo =
  struct
    type t = {
      accountId : string;
      internalWebPropertyId : string;
      profileId : string;
      profileName : string;
      tableId : string;
      webPropertyId : string;
      
    }
    
    let accountId = {
      GapiLens.get = (fun x -> x.accountId);
      GapiLens.set = (fun v x -> { x with accountId = v });
    }
    let internalWebPropertyId = {
      GapiLens.get = (fun x -> x.internalWebPropertyId);
      GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
    }
    let profileId = {
      GapiLens.get = (fun x -> x.profileId);
      GapiLens.set = (fun v x -> { x with profileId = v });
    }
    let profileName = {
      GapiLens.get = (fun x -> x.profileName);
      GapiLens.set = (fun v x -> { x with profileName = v });
    }
    let tableId = {
      GapiLens.get = (fun x -> x.tableId);
      GapiLens.set = (fun v x -> { x with tableId = v });
    }
    let webPropertyId = {
      GapiLens.get = (fun x -> x.webPropertyId);
      GapiLens.set = (fun v x -> { x with webPropertyId = v });
    }
    
    let empty = {
      accountId = "";
      internalWebPropertyId = "";
      profileId = "";
      profileName = "";
      tableId = "";
      webPropertyId = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "accountId" x.accountId;
        GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
        GapiJson.render_string_value "profileId" x.profileId;
        GapiJson.render_string_value "profileName" x.profileName;
        GapiJson.render_string_value "tableId" x.tableId;
        GapiJson.render_string_value "webPropertyId" x.webPropertyId;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with accountId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with internalWebPropertyId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "profileId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with profileId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "profileName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with profileName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "tableId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with tableId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with webPropertyId = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ProfileInfo.parse" e x
    
  end
  
  module ColumnHeaders =
  struct
    type t = {
      columnType : string;
      dataType : string;
      name : string;
      
    }
    
    let columnType = {
      GapiLens.get = (fun x -> x.columnType);
      GapiLens.set = (fun v x -> { x with columnType = v });
    }
    let dataType = {
      GapiLens.get = (fun x -> x.dataType);
      GapiLens.set = (fun v x -> { x with dataType = v });
    }
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    
    let empty = {
      columnType = "";
      dataType = "";
      name = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "columnType" x.columnType;
        GapiJson.render_string_value "dataType" x.dataType;
        GapiJson.render_string_value "name" x.name;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "columnType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with columnType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "dataType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with dataType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.ColumnHeaders.parse" e x
    
  end
  
  type t = {
    columnHeaders : ColumnHeaders.t list;
    containsSampledData : bool;
    id : string;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    profileInfo : ProfileInfo.t;
    query : Query.t;
    rows : Rows.t list list;
    selfLink : string;
    totalResults : int;
    totalsForAllResults : (string * string) list;
    
  }
  
  let columnHeaders = {
    GapiLens.get = (fun x -> x.columnHeaders);
    GapiLens.set = (fun v x -> { x with columnHeaders = v });
  }
  let containsSampledData = {
    GapiLens.get = (fun x -> x.containsSampledData);
    GapiLens.set = (fun v x -> { x with containsSampledData = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let itemsPerPage = {
    GapiLens.get = (fun x -> x.itemsPerPage);
    GapiLens.set = (fun v x -> { x with itemsPerPage = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let profileInfo = {
    GapiLens.get = (fun x -> x.profileInfo);
    GapiLens.set = (fun v x -> { x with profileInfo = v });
  }
  let query = {
    GapiLens.get = (fun x -> x.query);
    GapiLens.set = (fun v x -> { x with query = v });
  }
  let rows = {
    GapiLens.get = (fun x -> x.rows);
    GapiLens.set = (fun v x -> { x with rows = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let totalsForAllResults = {
    GapiLens.get = (fun x -> x.totalsForAllResults);
    GapiLens.set = (fun v x -> { x with totalsForAllResults = v });
  }
  
  let empty = {
    columnHeaders = [];
    containsSampledData = false;
    id = "";
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    profileInfo = ProfileInfo.empty;
    query = Query.empty;
    rows = [];
    selfLink = "";
    totalResults = 0;
    totalsForAllResults = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "columnHeaders" ColumnHeaders.render x.columnHeaders;
      GapiJson.render_bool_value "containsSampledData" x.containsSampledData;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      (fun v -> GapiJson.render_object "profileInfo" (ProfileInfo.render_content v)) x.profileInfo;
      (fun v -> GapiJson.render_object "query" (Query.render_content v)) x.query;
      GapiJson.render_array "rows" (GapiJson.render_array "" Rows.render) x.rows;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_collection "totalsForAllResults" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x.totalsForAllResults;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnHeaders"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ColumnHeaders.parse
              ColumnHeaders.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.McfData.parse.parse_collection" e x')
        ColumnHeaders.empty
        (fun v -> { x with columnHeaders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "containsSampledData"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with containsSampledData = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "profileInfo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ProfileInfo.parse
        ProfileInfo.empty
        (fun v -> { x with profileInfo = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "query"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Query.parse
        Query.empty
        (fun v -> { x with query = v })
        cs
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
                | GapiCore.AnnotatedTree.Node
                    ({ GapiJson.name = ""; data_type = GapiJson.Object },
                    cs) ->
                  GapiJson.parse_children
                    Rows.parse
                    Rows.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiAnalyticsV3Model.McfData.parse.parse_collection" e x')
              Rows.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.McfData.parse.parse_collection" e x')
        []
        (fun v -> { x with rows = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "totalsForAllResults"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.McfData.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with totalsForAllResults = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.McfData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomDataSources =
struct
  type t = {
    items : CustomDataSource.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" CustomDataSource.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
              CustomDataSource.parse
              CustomDataSource.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.CustomDataSources.parse.parse_collection" e x')
        CustomDataSource.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.CustomDataSources.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Accounts =
struct
  type t = {
    items : Account.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    username : string;
    
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
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let previousLink = {
    GapiLens.get = (fun x -> x.previousLink);
    GapiLens.set = (fun v x -> { x with previousLink = v });
  }
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Account.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_string_value "username" x.username;
      
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
              Account.parse
              Account.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Accounts.parse.parse_collection" e x')
        Account.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "itemsPerPage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with itemsPerPage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "previousLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with previousLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Accounts.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

