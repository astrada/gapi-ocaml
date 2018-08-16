(* Warning! This file is generated. Modify at your own risk. *)

module UnsampledReport =
struct
  module DriveDownloadDetails =
  struct
    type t = {
      documentId : string;
      
    }
    
    let documentId = {
      GapiLens.get = (fun x -> x.documentId);
      GapiLens.set = (fun v x -> { x with documentId = v });
    }
    
    let empty = {
      documentId = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "documentId" x.documentId;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "documentId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with documentId = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.DriveDownloadDetails.parse" e x
    
  end
  
  module CloudStorageDownloadDetails =
  struct
    type t = {
      bucketId : string;
      objectId : string;
      
    }
    
    let bucketId = {
      GapiLens.get = (fun x -> x.bucketId);
      GapiLens.set = (fun v x -> { x with bucketId = v });
    }
    let objectId = {
      GapiLens.get = (fun x -> x.objectId);
      GapiLens.set = (fun v x -> { x with objectId = v });
    }
    
    let empty = {
      bucketId = "";
      objectId = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "bucketId" x.bucketId;
        GapiJson.render_string_value "objectId" x.objectId;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "bucketId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with bucketId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "objectId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with objectId = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.CloudStorageDownloadDetails.parse" e x
    
  end
  
  type t = {
    accountId : string;
    cloudStorageDownloadDetails : CloudStorageDownloadDetails.t;
    created : GapiDate.t;
    dimensions : string;
    downloadType : string;
    driveDownloadDetails : DriveDownloadDetails.t;
    end_date : string;
    filters : string;
    id : string;
    kind : string;
    metrics : string;
    profileId : string;
    segment : string;
    selfLink : string;
    start_date : string;
    status : string;
    title : string;
    updated : GapiDate.t;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let cloudStorageDownloadDetails = {
    GapiLens.get = (fun x -> x.cloudStorageDownloadDetails);
    GapiLens.set = (fun v x -> { x with cloudStorageDownloadDetails = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let dimensions = {
    GapiLens.get = (fun x -> x.dimensions);
    GapiLens.set = (fun v x -> { x with dimensions = v });
  }
  let downloadType = {
    GapiLens.get = (fun x -> x.downloadType);
    GapiLens.set = (fun v x -> { x with downloadType = v });
  }
  let driveDownloadDetails = {
    GapiLens.get = (fun x -> x.driveDownloadDetails);
    GapiLens.set = (fun v x -> { x with driveDownloadDetails = v });
  }
  let end_date = {
    GapiLens.get = (fun x -> x.end_date);
    GapiLens.set = (fun v x -> { x with end_date = v });
  }
  let filters = {
    GapiLens.get = (fun x -> x.filters);
    GapiLens.set = (fun v x -> { x with filters = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let metrics = {
    GapiLens.get = (fun x -> x.metrics);
    GapiLens.set = (fun v x -> { x with metrics = v });
  }
  let profileId = {
    GapiLens.get = (fun x -> x.profileId);
    GapiLens.set = (fun v x -> { x with profileId = v });
  }
  let segment = {
    GapiLens.get = (fun x -> x.segment);
    GapiLens.set = (fun v x -> { x with segment = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let start_date = {
    GapiLens.get = (fun x -> x.start_date);
    GapiLens.set = (fun v x -> { x with start_date = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
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
    cloudStorageDownloadDetails = CloudStorageDownloadDetails.empty;
    created = GapiDate.epoch;
    dimensions = "";
    downloadType = "";
    driveDownloadDetails = DriveDownloadDetails.empty;
    end_date = "";
    filters = "";
    id = "";
    kind = "";
    metrics = "";
    profileId = "";
    segment = "";
    selfLink = "";
    start_date = "";
    status = "";
    title = "";
    updated = GapiDate.epoch;
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "cloudStorageDownloadDetails" (CloudStorageDownloadDetails.render_content v)) x.cloudStorageDownloadDetails;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "dimensions" x.dimensions;
      GapiJson.render_string_value "downloadType" x.downloadType;
      (fun v -> GapiJson.render_object "driveDownloadDetails" (DriveDownloadDetails.render_content v)) x.driveDownloadDetails;
      GapiJson.render_string_value "end-date" x.end_date;
      GapiJson.render_string_value "filters" x.filters;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "metrics" x.metrics;
      GapiJson.render_string_value "profileId" x.profileId;
      GapiJson.render_string_value "segment" x.segment;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "start-date" x.start_date;
      GapiJson.render_string_value "status" x.status;
      GapiJson.render_string_value "title" x.title;
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
        ({ GapiJson.name = "cloudStorageDownloadDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CloudStorageDownloadDetails.parse
        CloudStorageDownloadDetails.empty
        (fun v -> { x with cloudStorageDownloadDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dimensions"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dimensions = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "downloadType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with downloadType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "driveDownloadDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DriveDownloadDetails.parse
        DriveDownloadDetails.empty
        (fun v -> { x with driveDownloadDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "end-date"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with end_date = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filters"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with filters = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metrics"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with metrics = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "profileId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with profileId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "segment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with segment = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "start-date"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with start_date = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
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
      GapiJson.unexpected "GapiAnalyticsV3Model.UnsampledReport.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomDimension =
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
  
  type t = {
    accountId : string;
    active : bool;
    created : GapiDate.t;
    id : string;
    index : int;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    scope : string;
    selfLink : string;
    updated : GapiDate.t;
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
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
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
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v });
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
    active = false;
    created = GapiDate.epoch;
    id = "";
    index = 0;
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    scope = "";
    selfLink = "";
    updated = GapiDate.epoch;
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_bool_value "active" x.active;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_int_value "index" x.index;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_string_value "scope" x.scope;
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "active"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with active = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
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
        ({ GapiJson.name = "scope"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with scope = v }
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
      GapiJson.unexpected "GapiAnalyticsV3Model.CustomDimension.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomDimensions =
struct
  type t = {
    items : CustomDimension.t list;
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
      GapiJson.render_array "items" CustomDimension.render x.items;
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
              CustomDimension.parse
              CustomDimension.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.CustomDimensions.parse.parse_collection" e x')
        CustomDimension.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.CustomDimensions.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ProfileSummary =
struct
  type t = {
    id : string;
    kind : string;
    name : string;
    starred : bool;
    _type : string;
    
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
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    name = "";
    starred = false;
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_bool_value "starred" x.starred;
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
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.ProfileSummary.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Column =
struct
  type t = {
    attributes : (string * string) list;
    id : string;
    kind : string;
    
  }
  
  let attributes = {
    GapiLens.get = (fun x -> x.attributes);
    GapiLens.set = (fun v x -> { x with attributes = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    attributes = [];
    id = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "attributes" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.attributes;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "attributes"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Column.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with attributes = v })
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
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Column.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Columns =
struct
  type t = {
    attributeNames : string list;
    etag : string;
    items : Column.t list;
    kind : string;
    totalResults : int;
    
  }
  
  let attributeNames = {
    GapiLens.get = (fun x -> x.attributeNames);
    GapiLens.set = (fun v x -> { x with attributeNames = v });
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
  let totalResults = {
    GapiLens.get = (fun x -> x.totalResults);
    GapiLens.set = (fun v x -> { x with totalResults = v });
  }
  
  let empty = {
    attributeNames = [];
    etag = "";
    items = [];
    kind = "";
    totalResults = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "attributeNames" (GapiJson.render_string_value "") x.attributeNames;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Column.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_int_value "totalResults" x.totalResults;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "attributeNames"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Columns.parse.parse_collection" e x')
        ""
        (fun v -> { x with attributeNames = v })
        cs
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
            GapiJson.parse_children Column.parse Column.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Columns.parse.parse_collection" e x')
        Column.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalResults"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalResults = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Columns.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WebPropertyRef =
struct
  type t = {
    accountId : string;
    href : string;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    name : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let href = {
    GapiLens.get = (fun x -> x.href);
    GapiLens.set = (fun v x -> { x with href = v });
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
  
  let empty = {
    accountId = "";
    href = "";
    id = "";
    internalWebPropertyId = "";
    kind = "";
    name = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_string_value "href" x.href;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with href = v }
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
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.WebPropertyRef.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AdWordsAccount =
struct
  type t = {
    autoTaggingEnabled : bool;
    customerId : string;
    kind : string;
    
  }
  
  let autoTaggingEnabled = {
    GapiLens.get = (fun x -> x.autoTaggingEnabled);
    GapiLens.set = (fun v x -> { x with autoTaggingEnabled = v });
  }
  let customerId = {
    GapiLens.get = (fun x -> x.customerId);
    GapiLens.set = (fun v x -> { x with customerId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    autoTaggingEnabled = false;
    customerId = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "autoTaggingEnabled" x.autoTaggingEnabled;
      GapiJson.render_string_value "customerId" x.customerId;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "autoTaggingEnabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with autoTaggingEnabled = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "customerId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with customerId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.AdWordsAccount.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EntityAdWordsLink =
struct
  module Entity =
  struct
    type t = {
      webPropertyRef : WebPropertyRef.t;
      
    }
    
    let webPropertyRef = {
      GapiLens.get = (fun x -> x.webPropertyRef);
      GapiLens.set = (fun v x -> { x with webPropertyRef = v });
    }
    
    let empty = {
      webPropertyRef = WebPropertyRef.empty;
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "webPropertyRef" (WebPropertyRef.render_content v)) x.webPropertyRef;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "webPropertyRef"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          WebPropertyRef.parse
          WebPropertyRef.empty
          (fun v -> { x with webPropertyRef = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Entity.parse" e x
    
  end
  
  type t = {
    adWordsAccounts : AdWordsAccount.t list;
    entity : Entity.t;
    id : string;
    kind : string;
    name : string;
    profileIds : string list;
    selfLink : string;
    
  }
  
  let adWordsAccounts = {
    GapiLens.get = (fun x -> x.adWordsAccounts);
    GapiLens.set = (fun v x -> { x with adWordsAccounts = v });
  }
  let entity = {
    GapiLens.get = (fun x -> x.entity);
    GapiLens.set = (fun v x -> { x with entity = v });
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
  let profileIds = {
    GapiLens.get = (fun x -> x.profileIds);
    GapiLens.set = (fun v x -> { x with profileIds = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    adWordsAccounts = [];
    entity = Entity.empty;
    id = "";
    kind = "";
    name = "";
    profileIds = [];
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "adWordsAccounts" AdWordsAccount.render x.adWordsAccounts;
      (fun v -> GapiJson.render_object "entity" (Entity.render_content v)) x.entity;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_array "profileIds" (GapiJson.render_string_value "") x.profileIds;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "adWordsAccounts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AdWordsAccount.parse
              AdWordsAccount.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.EntityAdWordsLink.parse.parse_collection" e x')
        AdWordsAccount.empty
        (fun v -> { x with adWordsAccounts = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "entity"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Entity.parse
        Entity.empty
        (fun v -> { x with entity = v })
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
        ({ GapiJson.name = "profileIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.EntityAdWordsLink.parse.parse_collection" e x')
        ""
        (fun v -> { x with profileIds = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.EntityAdWordsLink.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EntityAdWordsLinks =
struct
  type t = {
    items : EntityAdWordsLink.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    
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
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" EntityAdWordsLink.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      
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
              EntityAdWordsLink.parse
              EntityAdWordsLink.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.EntityAdWordsLinks.parse.parse_collection" e x')
        EntityAdWordsLink.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.EntityAdWordsLinks.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module LinkedForeignAccount =
struct
  type t = {
    accountId : string;
    eligibleForSearch : bool;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    linkedAccountId : string;
    remarketingAudienceId : string;
    status : string;
    _type : string;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let eligibleForSearch = {
    GapiLens.get = (fun x -> x.eligibleForSearch);
    GapiLens.set = (fun v x -> { x with eligibleForSearch = v });
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
  let linkedAccountId = {
    GapiLens.get = (fun x -> x.linkedAccountId);
    GapiLens.set = (fun v x -> { x with linkedAccountId = v });
  }
  let remarketingAudienceId = {
    GapiLens.get = (fun x -> x.remarketingAudienceId);
    GapiLens.set = (fun v x -> { x with remarketingAudienceId = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    eligibleForSearch = false;
    id = "";
    internalWebPropertyId = "";
    kind = "";
    linkedAccountId = "";
    remarketingAudienceId = "";
    status = "";
    _type = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_bool_value "eligibleForSearch" x.eligibleForSearch;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "linkedAccountId" x.linkedAccountId;
      GapiJson.render_string_value "remarketingAudienceId" x.remarketingAudienceId;
      GapiJson.render_string_value "status" x.status;
      GapiJson.render_string_value "type" x._type;
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
        ({ GapiJson.name = "eligibleForSearch"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with eligibleForSearch = v }
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
        ({ GapiJson.name = "linkedAccountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with linkedAccountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "remarketingAudienceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with remarketingAudienceId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.LinkedForeignAccount.parse" e x
  
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
    _type : string;
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
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
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
    _type = "";
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
      GapiJson.render_string_value "type" x._type;
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
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
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

module Experiment =
struct
  module Variations =
  struct
    type t = {
      name : string;
      status : string;
      url : string;
      weight : float;
      won : bool;
      
    }
    
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    let status = {
      GapiLens.get = (fun x -> x.status);
      GapiLens.set = (fun v x -> { x with status = v });
    }
    let url = {
      GapiLens.get = (fun x -> x.url);
      GapiLens.set = (fun v x -> { x with url = v });
    }
    let weight = {
      GapiLens.get = (fun x -> x.weight);
      GapiLens.set = (fun v x -> { x with weight = v });
    }
    let won = {
      GapiLens.get = (fun x -> x.won);
      GapiLens.set = (fun v x -> { x with won = v });
    }
    
    let empty = {
      name = "";
      status = "";
      url = "";
      weight = 0.0;
      won = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "name" x.name;
        GapiJson.render_string_value "status" x.status;
        GapiJson.render_string_value "url" x.url;
        GapiJson.render_float_value "weight" x.weight;
        GapiJson.render_bool_value "won" x.won;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with status = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "weight"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with weight = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "weight"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with weight = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "won"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with won = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Variations.parse" e x
    
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
    created : GapiDate.t;
    description : string;
    editableInGaUi : bool;
    endTime : GapiDate.t;
    equalWeighting : bool;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    minimumExperimentLengthInDays : int;
    name : string;
    objectiveMetric : string;
    optimizationType : string;
    parentLink : ParentLink.t;
    profileId : string;
    reasonExperimentEnded : string;
    rewriteVariationUrlsAsOriginal : bool;
    selfLink : string;
    servingFramework : string;
    snippet : string;
    startTime : GapiDate.t;
    status : string;
    trafficCoverage : float;
    updated : GapiDate.t;
    variations : Variations.t list;
    webPropertyId : string;
    winnerConfidenceLevel : float;
    winnerFound : bool;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let editableInGaUi = {
    GapiLens.get = (fun x -> x.editableInGaUi);
    GapiLens.set = (fun v x -> { x with editableInGaUi = v });
  }
  let endTime = {
    GapiLens.get = (fun x -> x.endTime);
    GapiLens.set = (fun v x -> { x with endTime = v });
  }
  let equalWeighting = {
    GapiLens.get = (fun x -> x.equalWeighting);
    GapiLens.set = (fun v x -> { x with equalWeighting = v });
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
  let minimumExperimentLengthInDays = {
    GapiLens.get = (fun x -> x.minimumExperimentLengthInDays);
    GapiLens.set = (fun v x -> { x with minimumExperimentLengthInDays = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let objectiveMetric = {
    GapiLens.get = (fun x -> x.objectiveMetric);
    GapiLens.set = (fun v x -> { x with objectiveMetric = v });
  }
  let optimizationType = {
    GapiLens.get = (fun x -> x.optimizationType);
    GapiLens.set = (fun v x -> { x with optimizationType = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let profileId = {
    GapiLens.get = (fun x -> x.profileId);
    GapiLens.set = (fun v x -> { x with profileId = v });
  }
  let reasonExperimentEnded = {
    GapiLens.get = (fun x -> x.reasonExperimentEnded);
    GapiLens.set = (fun v x -> { x with reasonExperimentEnded = v });
  }
  let rewriteVariationUrlsAsOriginal = {
    GapiLens.get = (fun x -> x.rewriteVariationUrlsAsOriginal);
    GapiLens.set = (fun v x -> { x with rewriteVariationUrlsAsOriginal = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let servingFramework = {
    GapiLens.get = (fun x -> x.servingFramework);
    GapiLens.set = (fun v x -> { x with servingFramework = v });
  }
  let snippet = {
    GapiLens.get = (fun x -> x.snippet);
    GapiLens.set = (fun v x -> { x with snippet = v });
  }
  let startTime = {
    GapiLens.get = (fun x -> x.startTime);
    GapiLens.set = (fun v x -> { x with startTime = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  let trafficCoverage = {
    GapiLens.get = (fun x -> x.trafficCoverage);
    GapiLens.set = (fun v x -> { x with trafficCoverage = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let variations = {
    GapiLens.get = (fun x -> x.variations);
    GapiLens.set = (fun v x -> { x with variations = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  let winnerConfidenceLevel = {
    GapiLens.get = (fun x -> x.winnerConfidenceLevel);
    GapiLens.set = (fun v x -> { x with winnerConfidenceLevel = v });
  }
  let winnerFound = {
    GapiLens.get = (fun x -> x.winnerFound);
    GapiLens.set = (fun v x -> { x with winnerFound = v });
  }
  
  let empty = {
    accountId = "";
    created = GapiDate.epoch;
    description = "";
    editableInGaUi = false;
    endTime = GapiDate.epoch;
    equalWeighting = false;
    id = "";
    internalWebPropertyId = "";
    kind = "";
    minimumExperimentLengthInDays = 0;
    name = "";
    objectiveMetric = "";
    optimizationType = "";
    parentLink = ParentLink.empty;
    profileId = "";
    reasonExperimentEnded = "";
    rewriteVariationUrlsAsOriginal = false;
    selfLink = "";
    servingFramework = "";
    snippet = "";
    startTime = GapiDate.epoch;
    status = "";
    trafficCoverage = 0.0;
    updated = GapiDate.epoch;
    variations = [];
    webPropertyId = "";
    winnerConfidenceLevel = 0.0;
    winnerFound = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_bool_value "editableInGaUi" x.editableInGaUi;
      GapiJson.render_date_value "endTime" x.endTime;
      GapiJson.render_bool_value "equalWeighting" x.equalWeighting;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_int_value "minimumExperimentLengthInDays" x.minimumExperimentLengthInDays;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "objectiveMetric" x.objectiveMetric;
      GapiJson.render_string_value "optimizationType" x.optimizationType;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_string_value "profileId" x.profileId;
      GapiJson.render_string_value "reasonExperimentEnded" x.reasonExperimentEnded;
      GapiJson.render_bool_value "rewriteVariationUrlsAsOriginal" x.rewriteVariationUrlsAsOriginal;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "servingFramework" x.servingFramework;
      GapiJson.render_string_value "snippet" x.snippet;
      GapiJson.render_date_value "startTime" x.startTime;
      GapiJson.render_string_value "status" x.status;
      GapiJson.render_float_value "trafficCoverage" x.trafficCoverage;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_array "variations" Variations.render x.variations;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      GapiJson.render_float_value "winnerConfidenceLevel" x.winnerConfidenceLevel;
      GapiJson.render_bool_value "winnerFound" x.winnerFound;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "editableInGaUi"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with editableInGaUi = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with endTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "equalWeighting"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with equalWeighting = v }
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
        ({ GapiJson.name = "minimumExperimentLengthInDays"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with minimumExperimentLengthInDays = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectiveMetric"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with objectiveMetric = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "optimizationType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with optimizationType = v }
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
        ({ GapiJson.name = "reasonExperimentEnded"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with reasonExperimentEnded = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rewriteVariationUrlsAsOriginal"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with rewriteVariationUrlsAsOriginal = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "servingFramework"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with servingFramework = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "snippet"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with snippet = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with startTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trafficCoverage"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with trafficCoverage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trafficCoverage"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with trafficCoverage = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "variations"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Variations.parse
              Variations.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Experiment.parse.parse_collection" e x')
        Variations.empty
        (fun v -> { x with variations = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "winnerConfidenceLevel"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with winnerConfidenceLevel = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "winnerConfidenceLevel"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with winnerConfidenceLevel = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "winnerFound"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with winnerFound = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Experiment.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WebPropertySummary =
struct
  type t = {
    id : string;
    internalWebPropertyId : string;
    kind : string;
    level : string;
    name : string;
    profiles : ProfileSummary.t list;
    starred : bool;
    websiteUrl : string;
    
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
  let level = {
    GapiLens.get = (fun x -> x.level);
    GapiLens.set = (fun v x -> { x with level = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let profiles = {
    GapiLens.get = (fun x -> x.profiles);
    GapiLens.set = (fun v x -> { x with profiles = v });
  }
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
  }
  let websiteUrl = {
    GapiLens.get = (fun x -> x.websiteUrl);
    GapiLens.set = (fun v x -> { x with websiteUrl = v });
  }
  
  let empty = {
    id = "";
    internalWebPropertyId = "";
    kind = "";
    level = "";
    name = "";
    profiles = [];
    starred = false;
    websiteUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "level" x.level;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_array "profiles" ProfileSummary.render x.profiles;
      GapiJson.render_bool_value "starred" x.starred;
      GapiJson.render_string_value "websiteUrl" x.websiteUrl;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
        ({ GapiJson.name = "level"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with level = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "profiles"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ProfileSummary.parse
              ProfileSummary.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.WebPropertySummary.parse.parse_collection" e x')
        ProfileSummary.empty
        (fun v -> { x with profiles = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "websiteUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with websiteUrl = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.WebPropertySummary.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AccountTreeRequest =
struct
  module AccountSettings =
  struct
    type t = {
      shareAnonymouslyWithOthers : bool;
      shareWithGoogleProducts : bool;
      shareWithSpecialists : bool;
      shareWithSupport : bool;
      
    }
    
    let shareAnonymouslyWithOthers = {
      GapiLens.get = (fun x -> x.shareAnonymouslyWithOthers);
      GapiLens.set = (fun v x -> { x with shareAnonymouslyWithOthers = v });
    }
    let shareWithGoogleProducts = {
      GapiLens.get = (fun x -> x.shareWithGoogleProducts);
      GapiLens.set = (fun v x -> { x with shareWithGoogleProducts = v });
    }
    let shareWithSpecialists = {
      GapiLens.get = (fun x -> x.shareWithSpecialists);
      GapiLens.set = (fun v x -> { x with shareWithSpecialists = v });
    }
    let shareWithSupport = {
      GapiLens.get = (fun x -> x.shareWithSupport);
      GapiLens.set = (fun v x -> { x with shareWithSupport = v });
    }
    
    let empty = {
      shareAnonymouslyWithOthers = false;
      shareWithGoogleProducts = false;
      shareWithSpecialists = false;
      shareWithSupport = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "shareAnonymouslyWithOthers" x.shareAnonymouslyWithOthers;
        GapiJson.render_bool_value "shareWithGoogleProducts" x.shareWithGoogleProducts;
        GapiJson.render_bool_value "shareWithSpecialists" x.shareWithSpecialists;
        GapiJson.render_bool_value "shareWithSupport" x.shareWithSupport;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareAnonymouslyWithOthers"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareAnonymouslyWithOthers = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareWithGoogleProducts"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareWithGoogleProducts = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareWithSpecialists"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareWithSpecialists = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareWithSupport"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareWithSupport = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.AccountSettings.parse" e x
    
  end
  
  type t = {
    accountName : string;
    accountSettings : AccountSettings.t;
    kind : string;
    profileName : string;
    timezone : string;
    webpropertyName : string;
    websiteUrl : string;
    
  }
  
  let accountName = {
    GapiLens.get = (fun x -> x.accountName);
    GapiLens.set = (fun v x -> { x with accountName = v });
  }
  let accountSettings = {
    GapiLens.get = (fun x -> x.accountSettings);
    GapiLens.set = (fun v x -> { x with accountSettings = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let profileName = {
    GapiLens.get = (fun x -> x.profileName);
    GapiLens.set = (fun v x -> { x with profileName = v });
  }
  let timezone = {
    GapiLens.get = (fun x -> x.timezone);
    GapiLens.set = (fun v x -> { x with timezone = v });
  }
  let webpropertyName = {
    GapiLens.get = (fun x -> x.webpropertyName);
    GapiLens.set = (fun v x -> { x with webpropertyName = v });
  }
  let websiteUrl = {
    GapiLens.get = (fun x -> x.websiteUrl);
    GapiLens.set = (fun v x -> { x with websiteUrl = v });
  }
  
  let empty = {
    accountName = "";
    accountSettings = AccountSettings.empty;
    kind = "";
    profileName = "";
    timezone = "";
    webpropertyName = "";
    websiteUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountName" x.accountName;
      (fun v -> GapiJson.render_object "accountSettings" (AccountSettings.render_content v)) x.accountSettings;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "profileName" x.profileName;
      GapiJson.render_string_value "timezone" x.timezone;
      GapiJson.render_string_value "webpropertyName" x.webpropertyName;
      GapiJson.render_string_value "websiteUrl" x.websiteUrl;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountName = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "accountSettings"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AccountSettings.parse
        AccountSettings.empty
        (fun v -> { x with accountSettings = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "profileName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with profileName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timezone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timezone = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webpropertyName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webpropertyName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "websiteUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with websiteUrl = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.AccountTreeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Experiments =
struct
  type t = {
    items : Experiment.t list;
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
      GapiJson.render_array "items" Experiment.render x.items;
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
              Experiment.parse
              Experiment.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Experiments.parse.parse_collection" e x')
        Experiment.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.Experiments.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Profile =
struct
  module Permissions =
  struct
    type t = {
      effective : string list;
      
    }
    
    let effective = {
      GapiLens.get = (fun x -> x.effective);
      GapiLens.set = (fun v x -> { x with effective = v });
    }
    
    let empty = {
      effective = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "effective" (GapiJson.render_string_value "") x.effective;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "effective"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse.parse_collection" e x')
          ""
          (fun v -> { x with effective = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse" e x
    
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
    botFilteringEnabled : bool;
    childLink : ChildLink.t;
    created : GapiDate.t;
    currency : string;
    defaultPage : string;
    eCommerceTracking : bool;
    enhancedECommerceTracking : bool;
    excludeQueryParameters : string;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    permissions : Permissions.t;
    selfLink : string;
    siteSearchCategoryParameters : string;
    siteSearchQueryParameters : string;
    starred : bool;
    stripSiteSearchCategoryParameters : bool;
    stripSiteSearchQueryParameters : bool;
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
  let botFilteringEnabled = {
    GapiLens.get = (fun x -> x.botFilteringEnabled);
    GapiLens.set = (fun v x -> { x with botFilteringEnabled = v });
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
  let enhancedECommerceTracking = {
    GapiLens.get = (fun x -> x.enhancedECommerceTracking);
    GapiLens.set = (fun v x -> { x with enhancedECommerceTracking = v });
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
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
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
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
  }
  let stripSiteSearchCategoryParameters = {
    GapiLens.get = (fun x -> x.stripSiteSearchCategoryParameters);
    GapiLens.set = (fun v x -> { x with stripSiteSearchCategoryParameters = v });
  }
  let stripSiteSearchQueryParameters = {
    GapiLens.get = (fun x -> x.stripSiteSearchQueryParameters);
    GapiLens.set = (fun v x -> { x with stripSiteSearchQueryParameters = v });
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
    botFilteringEnabled = false;
    childLink = ChildLink.empty;
    created = GapiDate.epoch;
    currency = "";
    defaultPage = "";
    eCommerceTracking = false;
    enhancedECommerceTracking = false;
    excludeQueryParameters = "";
    id = "";
    internalWebPropertyId = "";
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    permissions = Permissions.empty;
    selfLink = "";
    siteSearchCategoryParameters = "";
    siteSearchQueryParameters = "";
    starred = false;
    stripSiteSearchCategoryParameters = false;
    stripSiteSearchQueryParameters = false;
    timezone = "";
    _type = "";
    updated = GapiDate.epoch;
    webPropertyId = "";
    websiteUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_bool_value "botFilteringEnabled" x.botFilteringEnabled;
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "currency" x.currency;
      GapiJson.render_string_value "defaultPage" x.defaultPage;
      GapiJson.render_bool_value "eCommerceTracking" x.eCommerceTracking;
      GapiJson.render_bool_value "enhancedECommerceTracking" x.enhancedECommerceTracking;
      GapiJson.render_string_value "excludeQueryParameters" x.excludeQueryParameters;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      (fun v -> GapiJson.render_object "permissions" (Permissions.render_content v)) x.permissions;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "siteSearchCategoryParameters" x.siteSearchCategoryParameters;
      GapiJson.render_string_value "siteSearchQueryParameters" x.siteSearchQueryParameters;
      GapiJson.render_bool_value "starred" x.starred;
      GapiJson.render_bool_value "stripSiteSearchCategoryParameters" x.stripSiteSearchCategoryParameters;
      GapiJson.render_bool_value "stripSiteSearchQueryParameters" x.stripSiteSearchQueryParameters;
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "botFilteringEnabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with botFilteringEnabled = v }
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
        ({ GapiJson.name = "enhancedECommerceTracking"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with enhancedECommerceTracking = v }
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "permissions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Permissions.parse
        Permissions.empty
        (fun v -> { x with permissions = v })
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
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "stripSiteSearchCategoryParameters"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with stripSiteSearchCategoryParameters = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "stripSiteSearchQueryParameters"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with stripSiteSearchQueryParameters = v }
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

module Webproperty =
struct
  module Permissions =
  struct
    type t = {
      effective : string list;
      
    }
    
    let effective = {
      GapiLens.get = (fun x -> x.effective);
      GapiLens.set = (fun v x -> { x with effective = v });
    }
    
    let empty = {
      effective = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "effective" (GapiJson.render_string_value "") x.effective;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "effective"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse.parse_collection" e x')
          ""
          (fun v -> { x with effective = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse" e x
    
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
    dataRetentionResetOnNewActivity : bool;
    dataRetentionTtl : string;
    defaultProfileId : int64;
    id : string;
    industryVertical : string;
    internalWebPropertyId : string;
    kind : string;
    level : string;
    name : string;
    parentLink : ParentLink.t;
    permissions : Permissions.t;
    profileCount : int;
    selfLink : string;
    starred : bool;
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
  let dataRetentionResetOnNewActivity = {
    GapiLens.get = (fun x -> x.dataRetentionResetOnNewActivity);
    GapiLens.set = (fun v x -> { x with dataRetentionResetOnNewActivity = v });
  }
  let dataRetentionTtl = {
    GapiLens.get = (fun x -> x.dataRetentionTtl);
    GapiLens.set = (fun v x -> { x with dataRetentionTtl = v });
  }
  let defaultProfileId = {
    GapiLens.get = (fun x -> x.defaultProfileId);
    GapiLens.set = (fun v x -> { x with defaultProfileId = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let industryVertical = {
    GapiLens.get = (fun x -> x.industryVertical);
    GapiLens.set = (fun v x -> { x with industryVertical = v });
  }
  let internalWebPropertyId = {
    GapiLens.get = (fun x -> x.internalWebPropertyId);
    GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let level = {
    GapiLens.get = (fun x -> x.level);
    GapiLens.set = (fun v x -> { x with level = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  let profileCount = {
    GapiLens.get = (fun x -> x.profileCount);
    GapiLens.set = (fun v x -> { x with profileCount = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
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
    dataRetentionResetOnNewActivity = false;
    dataRetentionTtl = "";
    defaultProfileId = 0L;
    id = "";
    industryVertical = "";
    internalWebPropertyId = "";
    kind = "";
    level = "";
    name = "";
    parentLink = ParentLink.empty;
    permissions = Permissions.empty;
    profileCount = 0;
    selfLink = "";
    starred = false;
    updated = GapiDate.epoch;
    websiteUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_bool_value "dataRetentionResetOnNewActivity" x.dataRetentionResetOnNewActivity;
      GapiJson.render_string_value "dataRetentionTtl" x.dataRetentionTtl;
      GapiJson.render_int64_value "defaultProfileId" x.defaultProfileId;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "industryVertical" x.industryVertical;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "level" x.level;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      (fun v -> GapiJson.render_object "permissions" (Permissions.render_content v)) x.permissions;
      GapiJson.render_int_value "profileCount" x.profileCount;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_bool_value "starred" x.starred;
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
        ({ GapiJson.name = "dataRetentionResetOnNewActivity"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with dataRetentionResetOnNewActivity = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataRetentionTtl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataRetentionTtl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "defaultProfileId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with defaultProfileId = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "industryVertical"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with industryVertical = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with internalWebPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "level"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with level = v }
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
        ({ GapiJson.name = "permissions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Permissions.parse
        Permissions.empty
        (fun v -> { x with permissions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "profileCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with profileCount = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
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

module AccountRef =
struct
  type t = {
    href : string;
    id : string;
    kind : string;
    name : string;
    
  }
  
  let href = {
    GapiLens.get = (fun x -> x.href);
    GapiLens.set = (fun v x -> { x with href = v });
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
    href = "";
    id = "";
    kind = "";
    name = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "href" x.href;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with href = v }
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
      GapiJson.unexpected "GapiAnalyticsV3Model.AccountRef.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ProfileRef =
struct
  type t = {
    accountId : string;
    href : string;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    name : string;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let href = {
    GapiLens.get = (fun x -> x.href);
    GapiLens.set = (fun v x -> { x with href = v });
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
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    href = "";
    id = "";
    internalWebPropertyId = "";
    kind = "";
    name = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_string_value "href" x.href;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
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
        ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with href = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.ProfileRef.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UserRef =
struct
  type t = {
    email : string;
    id : string;
    kind : string;
    
  }
  
  let email = {
    GapiLens.get = (fun x -> x.email);
    GapiLens.set = (fun v x -> { x with email = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    email = "";
    id = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "email" x.email;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with email = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.UserRef.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EntityUserLink =
struct
  module Permissions =
  struct
    type t = {
      effective : string list;
      local : string list;
      
    }
    
    let effective = {
      GapiLens.get = (fun x -> x.effective);
      GapiLens.set = (fun v x -> { x with effective = v });
    }
    let local = {
      GapiLens.get = (fun x -> x.local);
      GapiLens.set = (fun v x -> { x with local = v });
    }
    
    let empty = {
      effective = [];
      local = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "effective" (GapiJson.render_string_value "") x.effective;
        GapiJson.render_array "local" (GapiJson.render_string_value "") x.local;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "effective"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse.parse_collection" e x')
          ""
          (fun v -> { x with effective = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "local"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse.parse_collection" e x')
          ""
          (fun v -> { x with local = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse" e x
    
  end
  
  module Entity =
  struct
    type t = {
      accountRef : AccountRef.t;
      profileRef : ProfileRef.t;
      webPropertyRef : WebPropertyRef.t;
      
    }
    
    let accountRef = {
      GapiLens.get = (fun x -> x.accountRef);
      GapiLens.set = (fun v x -> { x with accountRef = v });
    }
    let profileRef = {
      GapiLens.get = (fun x -> x.profileRef);
      GapiLens.set = (fun v x -> { x with profileRef = v });
    }
    let webPropertyRef = {
      GapiLens.get = (fun x -> x.webPropertyRef);
      GapiLens.set = (fun v x -> { x with webPropertyRef = v });
    }
    
    let empty = {
      accountRef = AccountRef.empty;
      profileRef = ProfileRef.empty;
      webPropertyRef = WebPropertyRef.empty;
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "accountRef" (AccountRef.render_content v)) x.accountRef;
        (fun v -> GapiJson.render_object "profileRef" (ProfileRef.render_content v)) x.profileRef;
        (fun v -> GapiJson.render_object "webPropertyRef" (WebPropertyRef.render_content v)) x.webPropertyRef;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "accountRef"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          AccountRef.parse
          AccountRef.empty
          (fun v -> { x with accountRef = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "profileRef"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          ProfileRef.parse
          ProfileRef.empty
          (fun v -> { x with profileRef = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "webPropertyRef"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          WebPropertyRef.parse
          WebPropertyRef.empty
          (fun v -> { x with webPropertyRef = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Entity.parse" e x
    
  end
  
  type t = {
    entity : Entity.t;
    id : string;
    kind : string;
    permissions : Permissions.t;
    selfLink : string;
    userRef : UserRef.t;
    
  }
  
  let entity = {
    GapiLens.get = (fun x -> x.entity);
    GapiLens.set = (fun v x -> { x with entity = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let userRef = {
    GapiLens.get = (fun x -> x.userRef);
    GapiLens.set = (fun v x -> { x with userRef = v });
  }
  
  let empty = {
    entity = Entity.empty;
    id = "";
    kind = "";
    permissions = Permissions.empty;
    selfLink = "";
    userRef = UserRef.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "entity" (Entity.render_content v)) x.entity;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "permissions" (Permissions.render_content v)) x.permissions;
      GapiJson.render_string_value "selfLink" x.selfLink;
      (fun v -> GapiJson.render_object "userRef" (UserRef.render_content v)) x.userRef;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "entity"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Entity.parse
        Entity.empty
        (fun v -> { x with entity = v })
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
        ({ GapiJson.name = "permissions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Permissions.parse
        Permissions.empty
        (fun v -> { x with permissions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "userRef"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UserRef.parse
        UserRef.empty
        (fun v -> { x with userRef = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.EntityUserLink.parse" e x
  
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

module Upload =
struct
  type t = {
    accountId : int64;
    customDataSourceId : string;
    errors : string list;
    id : string;
    kind : string;
    status : string;
    uploadTime : GapiDate.t;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let customDataSourceId = {
    GapiLens.get = (fun x -> x.customDataSourceId);
    GapiLens.set = (fun v x -> { x with customDataSourceId = v });
  }
  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  let uploadTime = {
    GapiLens.get = (fun x -> x.uploadTime);
    GapiLens.set = (fun v x -> { x with uploadTime = v });
  }
  
  let empty = {
    accountId = 0L;
    customDataSourceId = "";
    errors = [];
    id = "";
    kind = "";
    status = "";
    uploadTime = GapiDate.epoch;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int64_value "accountId" x.accountId;
      GapiJson.render_string_value "customDataSourceId" x.customDataSourceId;
      GapiJson.render_array "errors" (GapiJson.render_string_value "") x.errors;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "status" x.status;
      GapiJson.render_date_value "uploadTime" x.uploadTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "customDataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with customDataSourceId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Upload.parse.parse_collection" e x')
        ""
        (fun v -> { x with errors = v })
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
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "uploadTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with uploadTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Upload.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Account =
struct
  module Permissions =
  struct
    type t = {
      effective : string list;
      
    }
    
    let effective = {
      GapiLens.get = (fun x -> x.effective);
      GapiLens.set = (fun v x -> { x with effective = v });
    }
    
    let empty = {
      effective = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "effective" (GapiJson.render_string_value "") x.effective;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "effective"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse.parse_collection" e x')
          ""
          (fun v -> { x with effective = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Permissions.parse" e x
    
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
    childLink : ChildLink.t;
    created : GapiDate.t;
    id : string;
    kind : string;
    name : string;
    permissions : Permissions.t;
    selfLink : string;
    starred : bool;
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
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
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
    permissions = Permissions.empty;
    selfLink = "";
    starred = false;
    updated = GapiDate.epoch;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "permissions" (Permissions.render_content v)) x.permissions;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_bool_value "starred" x.starred;
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "permissions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Permissions.parse
        Permissions.empty
        (fun v -> { x with permissions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
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

module AccountTreeResponse =
struct
  module AccountSettings =
  struct
    type t = {
      shareAnonymouslyWithOthers : bool;
      shareWithGoogleProducts : bool;
      shareWithSpecialists : bool;
      shareWithSupport : bool;
      
    }
    
    let shareAnonymouslyWithOthers = {
      GapiLens.get = (fun x -> x.shareAnonymouslyWithOthers);
      GapiLens.set = (fun v x -> { x with shareAnonymouslyWithOthers = v });
    }
    let shareWithGoogleProducts = {
      GapiLens.get = (fun x -> x.shareWithGoogleProducts);
      GapiLens.set = (fun v x -> { x with shareWithGoogleProducts = v });
    }
    let shareWithSpecialists = {
      GapiLens.get = (fun x -> x.shareWithSpecialists);
      GapiLens.set = (fun v x -> { x with shareWithSpecialists = v });
    }
    let shareWithSupport = {
      GapiLens.get = (fun x -> x.shareWithSupport);
      GapiLens.set = (fun v x -> { x with shareWithSupport = v });
    }
    
    let empty = {
      shareAnonymouslyWithOthers = false;
      shareWithGoogleProducts = false;
      shareWithSpecialists = false;
      shareWithSupport = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "shareAnonymouslyWithOthers" x.shareAnonymouslyWithOthers;
        GapiJson.render_bool_value "shareWithGoogleProducts" x.shareWithGoogleProducts;
        GapiJson.render_bool_value "shareWithSpecialists" x.shareWithSpecialists;
        GapiJson.render_bool_value "shareWithSupport" x.shareWithSupport;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareAnonymouslyWithOthers"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareAnonymouslyWithOthers = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareWithGoogleProducts"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareWithGoogleProducts = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareWithSpecialists"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareWithSpecialists = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "shareWithSupport"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with shareWithSupport = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.AccountSettings.parse" e x
    
  end
  
  type t = {
    account : Account.t;
    accountSettings : AccountSettings.t;
    kind : string;
    profile : Profile.t;
    webproperty : Webproperty.t;
    
  }
  
  let account = {
    GapiLens.get = (fun x -> x.account);
    GapiLens.set = (fun v x -> { x with account = v });
  }
  let accountSettings = {
    GapiLens.get = (fun x -> x.accountSettings);
    GapiLens.set = (fun v x -> { x with accountSettings = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let profile = {
    GapiLens.get = (fun x -> x.profile);
    GapiLens.set = (fun v x -> { x with profile = v });
  }
  let webproperty = {
    GapiLens.get = (fun x -> x.webproperty);
    GapiLens.set = (fun v x -> { x with webproperty = v });
  }
  
  let empty = {
    account = Account.empty;
    accountSettings = AccountSettings.empty;
    kind = "";
    profile = Profile.empty;
    webproperty = Webproperty.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "account" (Account.render_content v)) x.account;
      (fun v -> GapiJson.render_object "accountSettings" (AccountSettings.render_content v)) x.accountSettings;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "profile" (Profile.render_content v)) x.profile;
      (fun v -> GapiJson.render_object "webproperty" (Webproperty.render_content v)) x.webproperty;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "account"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Account.parse
        Account.empty
        (fun v -> { x with account = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "accountSettings"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AccountSettings.parse
        AccountSettings.empty
        (fun v -> { x with accountSettings = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "profile"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Profile.parse
        Profile.empty
        (fun v -> { x with profile = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "webproperty"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Webproperty.parse
        Webproperty.empty
        (fun v -> { x with webproperty = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.AccountTreeResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AccountTicket =
struct
  type t = {
    account : Account.t;
    id : string;
    kind : string;
    profile : Profile.t;
    redirectUri : string;
    webproperty : Webproperty.t;
    
  }
  
  let account = {
    GapiLens.get = (fun x -> x.account);
    GapiLens.set = (fun v x -> { x with account = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let profile = {
    GapiLens.get = (fun x -> x.profile);
    GapiLens.set = (fun v x -> { x with profile = v });
  }
  let redirectUri = {
    GapiLens.get = (fun x -> x.redirectUri);
    GapiLens.set = (fun v x -> { x with redirectUri = v });
  }
  let webproperty = {
    GapiLens.get = (fun x -> x.webproperty);
    GapiLens.set = (fun v x -> { x with webproperty = v });
  }
  
  let empty = {
    account = Account.empty;
    id = "";
    kind = "";
    profile = Profile.empty;
    redirectUri = "";
    webproperty = Webproperty.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "account" (Account.render_content v)) x.account;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "profile" (Profile.render_content v)) x.profile;
      GapiJson.render_string_value "redirectUri" x.redirectUri;
      (fun v -> GapiJson.render_object "webproperty" (Webproperty.render_content v)) x.webproperty;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "account"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Account.parse
        Account.empty
        (fun v -> { x with account = v })
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
        ({ GapiJson.name = "profile"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Profile.parse
        Profile.empty
        (fun v -> { x with profile = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "redirectUri"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with redirectUri = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "webproperty"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Webproperty.parse
        Webproperty.empty
        (fun v -> { x with webproperty = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.AccountTicket.parse" e x
  
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
    importBehavior : string;
    kind : string;
    name : string;
    parentLink : ParentLink.t;
    profilesLinked : string list;
    schema : string list;
    selfLink : string;
    _type : string;
    updated : GapiDate.t;
    uploadType : string;
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
  let importBehavior = {
    GapiLens.get = (fun x -> x.importBehavior);
    GapiLens.set = (fun v x -> { x with importBehavior = v });
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
  let schema = {
    GapiLens.get = (fun x -> x.schema);
    GapiLens.set = (fun v x -> { x with schema = v });
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
  let uploadType = {
    GapiLens.get = (fun x -> x.uploadType);
    GapiLens.set = (fun v x -> { x with uploadType = v });
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
    importBehavior = "";
    kind = "";
    name = "";
    parentLink = ParentLink.empty;
    profilesLinked = [];
    schema = [];
    selfLink = "";
    _type = "";
    updated = GapiDate.epoch;
    uploadType = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "childLink" (ChildLink.render_content v)) x.childLink;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "importBehavior" x.importBehavior;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_array "profilesLinked" (GapiJson.render_string_value "") x.profilesLinked;
      GapiJson.render_array "schema" (GapiJson.render_string_value "") x.schema;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "uploadType" x.uploadType;
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
        ({ GapiJson.name = "importBehavior"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with importBehavior = v }
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "schema"; data_type = GapiJson.Array },
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
        (fun v -> { x with schema = v })
        cs
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "uploadType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with uploadType = v }
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

module AnalyticsDataimportDeleteUploadDataRequest =
struct
  type t = {
    customDataImportUids : string list;
    
  }
  
  let customDataImportUids = {
    GapiLens.get = (fun x -> x.customDataImportUids);
    GapiLens.set = (fun v x -> { x with customDataImportUids = v });
  }
  
  let empty = {
    customDataImportUids = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "customDataImportUids" (GapiJson.render_string_value "") x.customDataImportUids;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "customDataImportUids"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.AnalyticsDataimportDeleteUploadDataRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with customDataImportUids = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.AnalyticsDataimportDeleteUploadDataRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

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

module AccountSummary =
struct
  type t = {
    id : string;
    kind : string;
    name : string;
    starred : bool;
    webProperties : WebPropertySummary.t list;
    
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
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
  }
  let webProperties = {
    GapiLens.get = (fun x -> x.webProperties);
    GapiLens.set = (fun v x -> { x with webProperties = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    name = "";
    starred = false;
    webProperties = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_bool_value "starred" x.starred;
      GapiJson.render_array "webProperties" WebPropertySummary.render x.webProperties;
      
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "webProperties"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              WebPropertySummary.parse
              WebPropertySummary.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.AccountSummary.parse.parse_collection" e x')
        WebPropertySummary.empty
        (fun v -> { x with webProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.AccountSummary.parse" e x
  
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

module HashClientIdResponse =
struct
  type t = {
    clientId : string;
    hashedClientId : string;
    kind : string;
    webPropertyId : string;
    
  }
  
  let clientId = {
    GapiLens.get = (fun x -> x.clientId);
    GapiLens.set = (fun v x -> { x with clientId = v });
  }
  let hashedClientId = {
    GapiLens.get = (fun x -> x.hashedClientId);
    GapiLens.set = (fun v x -> { x with hashedClientId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    clientId = "";
    hashedClientId = "";
    kind = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "clientId" x.clientId;
      GapiJson.render_string_value "hashedClientId" x.hashedClientId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "clientId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with clientId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hashedClientId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hashedClientId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.HashClientIdResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FilterRef =
struct
  type t = {
    accountId : string;
    href : string;
    id : string;
    kind : string;
    name : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let href = {
    GapiLens.get = (fun x -> x.href);
    GapiLens.set = (fun v x -> { x with href = v });
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
    accountId = "";
    href = "";
    id = "";
    kind = "";
    name = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_string_value "href" x.href;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "href"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with href = v }
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
      GapiJson.unexpected "GapiAnalyticsV3Model.FilterRef.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UnsampledReports =
struct
  type t = {
    items : UnsampledReport.t list;
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
      GapiJson.render_array "items" UnsampledReport.render x.items;
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
              UnsampledReport.parse
              UnsampledReport.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.UnsampledReports.parse.parse_collection" e x')
        UnsampledReport.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.UnsampledReports.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomMetric =
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
  
  type t = {
    accountId : string;
    active : bool;
    created : GapiDate.t;
    id : string;
    index : int;
    kind : string;
    max_value : string;
    min_value : string;
    name : string;
    parentLink : ParentLink.t;
    scope : string;
    selfLink : string;
    _type : string;
    updated : GapiDate.t;
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
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let max_value = {
    GapiLens.get = (fun x -> x.max_value);
    GapiLens.set = (fun v x -> { x with max_value = v });
  }
  let min_value = {
    GapiLens.get = (fun x -> x.min_value);
    GapiLens.set = (fun v x -> { x with min_value = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v });
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
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    accountId = "";
    active = false;
    created = GapiDate.epoch;
    id = "";
    index = 0;
    kind = "";
    max_value = "";
    min_value = "";
    name = "";
    parentLink = ParentLink.empty;
    scope = "";
    selfLink = "";
    _type = "";
    updated = GapiDate.epoch;
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      GapiJson.render_bool_value "active" x.active;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_int_value "index" x.index;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "max_value" x.max_value;
      GapiJson.render_string_value "min_value" x.min_value;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      GapiJson.render_string_value "scope" x.scope;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "type" x._type;
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "active"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with active = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "max_value"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with max_value = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "min_value"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with min_value = v }
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
        ({ GapiJson.name = "scope"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with scope = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.CustomMetric.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CustomMetrics =
struct
  type t = {
    items : CustomMetric.t list;
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
      GapiJson.render_array "items" CustomMetric.render x.items;
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
              CustomMetric.parse
              CustomMetric.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.CustomMetrics.parse.parse_collection" e x')
        CustomMetric.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.CustomMetrics.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Uploads =
struct
  type t = {
    items : Upload.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    
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
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Upload.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      
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
            GapiJson.parse_children Upload.parse Upload.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Uploads.parse.parse_collection" e x')
        Upload.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Uploads.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UserDeletionRequest =
struct
  module Id =
  struct
    type t = {
      _type : string;
      userId : string;
      
    }
    
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    let userId = {
      GapiLens.get = (fun x -> x.userId);
      GapiLens.set = (fun v x -> { x with userId = v });
    }
    
    let empty = {
      _type = "";
      userId = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "type" x._type;
        GapiJson.render_string_value "userId" x.userId;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "userId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with userId = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.Id.parse" e x
    
  end
  
  type t = {
    deletionRequestTime : GapiDate.t;
    firebaseProjectId : string;
    id : Id.t;
    kind : string;
    webPropertyId : string;
    
  }
  
  let deletionRequestTime = {
    GapiLens.get = (fun x -> x.deletionRequestTime);
    GapiLens.set = (fun v x -> { x with deletionRequestTime = v });
  }
  let firebaseProjectId = {
    GapiLens.get = (fun x -> x.firebaseProjectId);
    GapiLens.set = (fun v x -> { x with firebaseProjectId = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    deletionRequestTime = GapiDate.epoch;
    firebaseProjectId = "";
    id = Id.empty;
    kind = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_date_value "deletionRequestTime" x.deletionRequestTime;
      GapiJson.render_string_value "firebaseProjectId" x.firebaseProjectId;
      (fun v -> GapiJson.render_object "id" (Id.render_content v)) x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deletionRequestTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with deletionRequestTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "firebaseProjectId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with firebaseProjectId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "id"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Id.parse
        Id.empty
        (fun v -> { x with id = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.UserDeletionRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AccountSummaries =
struct
  type t = {
    items : AccountSummary.t list;
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
      GapiJson.render_array "items" AccountSummary.render x.items;
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
              AccountSummary.parse
              AccountSummary.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.AccountSummaries.parse.parse_collection" e x')
        AccountSummary.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.AccountSummaries.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module IncludeConditions =
struct
  type t = {
    daysToLookBack : int;
    isSmartList : bool;
    kind : string;
    membershipDurationDays : int;
    segment : string;
    
  }
  
  let daysToLookBack = {
    GapiLens.get = (fun x -> x.daysToLookBack);
    GapiLens.set = (fun v x -> { x with daysToLookBack = v });
  }
  let isSmartList = {
    GapiLens.get = (fun x -> x.isSmartList);
    GapiLens.set = (fun v x -> { x with isSmartList = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let membershipDurationDays = {
    GapiLens.get = (fun x -> x.membershipDurationDays);
    GapiLens.set = (fun v x -> { x with membershipDurationDays = v });
  }
  let segment = {
    GapiLens.get = (fun x -> x.segment);
    GapiLens.set = (fun v x -> { x with segment = v });
  }
  
  let empty = {
    daysToLookBack = 0;
    isSmartList = false;
    kind = "";
    membershipDurationDays = 0;
    segment = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "daysToLookBack" x.daysToLookBack;
      GapiJson.render_bool_value "isSmartList" x.isSmartList;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_int_value "membershipDurationDays" x.membershipDurationDays;
      GapiJson.render_string_value "segment" x.segment;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "daysToLookBack"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with daysToLookBack = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isSmartList"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isSmartList = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "membershipDurationDays"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with membershipDurationDays = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "segment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with segment = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.IncludeConditions.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ProfileFilterLink =
struct
  type t = {
    filterRef : FilterRef.t;
    id : string;
    kind : string;
    profileRef : ProfileRef.t;
    rank : int;
    selfLink : string;
    
  }
  
  let filterRef = {
    GapiLens.get = (fun x -> x.filterRef);
    GapiLens.set = (fun v x -> { x with filterRef = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let profileRef = {
    GapiLens.get = (fun x -> x.profileRef);
    GapiLens.set = (fun v x -> { x with profileRef = v });
  }
  let rank = {
    GapiLens.get = (fun x -> x.rank);
    GapiLens.set = (fun v x -> { x with rank = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    filterRef = FilterRef.empty;
    id = "";
    kind = "";
    profileRef = ProfileRef.empty;
    rank = 0;
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "filterRef" (FilterRef.render_content v)) x.filterRef;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "profileRef" (ProfileRef.render_content v)) x.profileRef;
      GapiJson.render_int_value "rank" x.rank;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterRef"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterRef.parse
        FilterRef.empty
        (fun v -> { x with filterRef = v })
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
        ({ GapiJson.name = "profileRef"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ProfileRef.parse
        ProfileRef.empty
        (fun v -> { x with profileRef = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rank"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with rank = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.ProfileFilterLink.parse" e x
  
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
      samplingLevel : string;
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
    let samplingLevel = {
      GapiLens.get = (fun x -> x.samplingLevel);
      GapiLens.set = (fun v x -> { x with samplingLevel = v });
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
      samplingLevel = "";
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
        GapiJson.render_string_value "samplingLevel" x.samplingLevel;
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
          ({ GapiJson.name = "samplingLevel"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with samplingLevel = v }
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
    sampleSize : int64;
    sampleSpace : int64;
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
  let sampleSize = {
    GapiLens.get = (fun x -> x.sampleSize);
    GapiLens.set = (fun v x -> { x with sampleSize = v });
  }
  let sampleSpace = {
    GapiLens.get = (fun x -> x.sampleSpace);
    GapiLens.set = (fun v x -> { x with sampleSpace = v });
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
    sampleSize = 0L;
    sampleSpace = 0L;
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
      GapiJson.render_int64_value "sampleSize" x.sampleSize;
      GapiJson.render_int64_value "sampleSpace" x.sampleSpace;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_collection "totalsForAllResults" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.totalsForAllResults;
      
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
        ({ GapiJson.name = "sampleSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sampleSize = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sampleSpace"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sampleSpace = Int64.of_string v }
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

module RemarketingAudience =
struct
  module StateBasedAudienceDefinition =
  struct
    module ExcludeConditions =
    struct
      type t = {
        exclusionDuration : string;
        segment : string;
        
      }
      
      let exclusionDuration = {
        GapiLens.get = (fun x -> x.exclusionDuration);
        GapiLens.set = (fun v x -> { x with exclusionDuration = v });
      }
      let segment = {
        GapiLens.get = (fun x -> x.segment);
        GapiLens.set = (fun v x -> { x with segment = v });
      }
      
      let empty = {
        exclusionDuration = "";
        segment = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "exclusionDuration" x.exclusionDuration;
          GapiJson.render_string_value "segment" x.segment;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "exclusionDuration"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with exclusionDuration = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "segment"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with segment = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAnalyticsV3Model.ExcludeConditions.parse" e x
      
    end
    
    type t = {
      excludeConditions : ExcludeConditions.t;
      includeConditions : IncludeConditions.t;
      
    }
    
    let excludeConditions = {
      GapiLens.get = (fun x -> x.excludeConditions);
      GapiLens.set = (fun v x -> { x with excludeConditions = v });
    }
    let includeConditions = {
      GapiLens.get = (fun x -> x.includeConditions);
      GapiLens.set = (fun v x -> { x with includeConditions = v });
    }
    
    let empty = {
      excludeConditions = ExcludeConditions.empty;
      includeConditions = IncludeConditions.empty;
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "excludeConditions" (ExcludeConditions.render_content v)) x.excludeConditions;
        (fun v -> GapiJson.render_object "includeConditions" (IncludeConditions.render_content v)) x.includeConditions;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "excludeConditions"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          ExcludeConditions.parse
          ExcludeConditions.empty
          (fun v -> { x with excludeConditions = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "includeConditions"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          IncludeConditions.parse
          IncludeConditions.empty
          (fun v -> { x with includeConditions = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.StateBasedAudienceDefinition.parse" e x
    
  end
  
  module AudienceDefinition =
  struct
    type t = {
      includeConditions : IncludeConditions.t;
      
    }
    
    let includeConditions = {
      GapiLens.get = (fun x -> x.includeConditions);
      GapiLens.set = (fun v x -> { x with includeConditions = v });
    }
    
    let empty = {
      includeConditions = IncludeConditions.empty;
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "includeConditions" (IncludeConditions.render_content v)) x.includeConditions;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "includeConditions"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          IncludeConditions.parse
          IncludeConditions.empty
          (fun v -> { x with includeConditions = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.AudienceDefinition.parse" e x
    
  end
  
  type t = {
    accountId : string;
    audienceDefinition : AudienceDefinition.t;
    audienceType : string;
    created : GapiDate.t;
    description : string;
    id : string;
    internalWebPropertyId : string;
    kind : string;
    linkedAdAccounts : LinkedForeignAccount.t list;
    linkedViews : string list;
    name : string;
    stateBasedAudienceDefinition : StateBasedAudienceDefinition.t;
    updated : GapiDate.t;
    webPropertyId : string;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let audienceDefinition = {
    GapiLens.get = (fun x -> x.audienceDefinition);
    GapiLens.set = (fun v x -> { x with audienceDefinition = v });
  }
  let audienceType = {
    GapiLens.get = (fun x -> x.audienceType);
    GapiLens.set = (fun v x -> { x with audienceType = v });
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
  let internalWebPropertyId = {
    GapiLens.get = (fun x -> x.internalWebPropertyId);
    GapiLens.set = (fun v x -> { x with internalWebPropertyId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let linkedAdAccounts = {
    GapiLens.get = (fun x -> x.linkedAdAccounts);
    GapiLens.set = (fun v x -> { x with linkedAdAccounts = v });
  }
  let linkedViews = {
    GapiLens.get = (fun x -> x.linkedViews);
    GapiLens.set = (fun v x -> { x with linkedViews = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let stateBasedAudienceDefinition = {
    GapiLens.get = (fun x -> x.stateBasedAudienceDefinition);
    GapiLens.set = (fun v x -> { x with stateBasedAudienceDefinition = v });
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
    audienceDefinition = AudienceDefinition.empty;
    audienceType = "";
    created = GapiDate.epoch;
    description = "";
    id = "";
    internalWebPropertyId = "";
    kind = "";
    linkedAdAccounts = [];
    linkedViews = [];
    name = "";
    stateBasedAudienceDefinition = StateBasedAudienceDefinition.empty;
    updated = GapiDate.epoch;
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "audienceDefinition" (AudienceDefinition.render_content v)) x.audienceDefinition;
      GapiJson.render_string_value "audienceType" x.audienceType;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "internalWebPropertyId" x.internalWebPropertyId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "linkedAdAccounts" LinkedForeignAccount.render x.linkedAdAccounts;
      GapiJson.render_array "linkedViews" (GapiJson.render_string_value "") x.linkedViews;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "stateBasedAudienceDefinition" (StateBasedAudienceDefinition.render_content v)) x.stateBasedAudienceDefinition;
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
        ({ GapiJson.name = "audienceDefinition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AudienceDefinition.parse
        AudienceDefinition.empty
        (fun v -> { x with audienceDefinition = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "audienceType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with audienceType = v }
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
        ({ GapiJson.name = "internalWebPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with internalWebPropertyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "linkedAdAccounts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              LinkedForeignAccount.parse
              LinkedForeignAccount.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.RemarketingAudience.parse.parse_collection" e x')
        LinkedForeignAccount.empty
        (fun v -> { x with linkedAdAccounts = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "linkedViews"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.RemarketingAudience.parse.parse_collection" e x')
        ""
        (fun v -> { x with linkedViews = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "stateBasedAudienceDefinition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        StateBasedAudienceDefinition.parse
        StateBasedAudienceDefinition.empty
        (fun v -> { x with stateBasedAudienceDefinition = v })
        cs
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
      GapiJson.unexpected "GapiAnalyticsV3Model.RemarketingAudience.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RealtimeData =
struct
  module Query =
  struct
    type t = {
      dimensions : string;
      filters : string;
      ids : string;
      max_results : int;
      metrics : string list;
      sort : string list;
      
    }
    
    let dimensions = {
      GapiLens.get = (fun x -> x.dimensions);
      GapiLens.set = (fun v x -> { x with dimensions = v });
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
    let sort = {
      GapiLens.get = (fun x -> x.sort);
      GapiLens.set = (fun v x -> { x with sort = v });
    }
    
    let empty = {
      dimensions = "";
      filters = "";
      ids = "";
      max_results = 0;
      metrics = [];
      sort = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "dimensions" x.dimensions;
        GapiJson.render_string_value "filters" x.filters;
        GapiJson.render_string_value "ids" x.ids;
        GapiJson.render_int_value "max-results" x.max_results;
        GapiJson.render_array "metrics" (GapiJson.render_string_value "") x.metrics;
        GapiJson.render_array "sort" (GapiJson.render_string_value "") x.sort;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "dimensions"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with dimensions = v }
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
    id : string;
    kind : string;
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
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
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
    id = "";
    kind = "";
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
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "profileInfo" (ProfileInfo.render_content v)) x.profileInfo;
      (fun v -> GapiJson.render_object "query" (Query.render_content v)) x.query;
      GapiJson.render_array "rows" (GapiJson.render_array "" (GapiJson.render_string_value "")) x.rows;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_collection "totalsForAllResults" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.totalsForAllResults;
      
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
            GapiJson.unexpected "GapiAnalyticsV3Model.RealtimeData.parse.parse_collection" e x')
        ColumnHeaders.empty
        (fun v -> { x with columnHeaders = v })
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
                  GapiJson.unexpected "GapiAnalyticsV3Model.RealtimeData.parse.parse_collection" e x')
              ""
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.RealtimeData.parse.parse_collection" e x')
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
            GapiJson.unexpected "GapiAnalyticsV3Model.RealtimeData.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with totalsForAllResults = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.RealtimeData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FilterExpression =
struct
  type t = {
    caseSensitive : bool;
    expressionValue : string;
    field : string;
    fieldIndex : int;
    kind : string;
    matchType : string;
    
  }
  
  let caseSensitive = {
    GapiLens.get = (fun x -> x.caseSensitive);
    GapiLens.set = (fun v x -> { x with caseSensitive = v });
  }
  let expressionValue = {
    GapiLens.get = (fun x -> x.expressionValue);
    GapiLens.set = (fun v x -> { x with expressionValue = v });
  }
  let field = {
    GapiLens.get = (fun x -> x.field);
    GapiLens.set = (fun v x -> { x with field = v });
  }
  let fieldIndex = {
    GapiLens.get = (fun x -> x.fieldIndex);
    GapiLens.set = (fun v x -> { x with fieldIndex = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let matchType = {
    GapiLens.get = (fun x -> x.matchType);
    GapiLens.set = (fun v x -> { x with matchType = v });
  }
  
  let empty = {
    caseSensitive = false;
    expressionValue = "";
    field = "";
    fieldIndex = 0;
    kind = "";
    matchType = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "caseSensitive" x.caseSensitive;
      GapiJson.render_string_value "expressionValue" x.expressionValue;
      GapiJson.render_string_value "field" x.field;
      GapiJson.render_int_value "fieldIndex" x.fieldIndex;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "matchType" x.matchType;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "caseSensitive"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with caseSensitive = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expressionValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expressionValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "field"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with field = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fieldIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with fieldIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "matchType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with matchType = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.FilterExpression.parse" e x
  
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
      samplingLevel : string;
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
    let samplingLevel = {
      GapiLens.get = (fun x -> x.samplingLevel);
      GapiLens.set = (fun v x -> { x with samplingLevel = v });
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
      samplingLevel = "";
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
        GapiJson.render_string_value "samplingLevel" x.samplingLevel;
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
          ({ GapiJson.name = "samplingLevel"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with samplingLevel = v }
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
  
  module DataTable =
  struct
    module Rows =
    struct
      module C =
      struct
        type t = {
          v : string;
          
        }
        
        let v = {
          GapiLens.get = (fun x -> x.v);
          GapiLens.set = (fun v x -> { x with v = v });
        }
        
        let empty = {
          v = "";
          
        }
        
        let rec render_content x = 
           [
            GapiJson.render_string_value "v" x.v;
            
          ]
        and render x = 
          GapiJson.render_object "" (render_content x)
        
        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "v"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with v = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.C.parse" e x
        
      end
      
      type t = {
        c : C.t list;
        
      }
      
      let c = {
        GapiLens.get = (fun x -> x.c);
        GapiLens.set = (fun v x -> { x with c = v });
      }
      
      let empty = {
        c = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "c" C.render x.c;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "c"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children C.parse C.empty (fun v -> v) cs
              | e ->
                GapiJson.unexpected "GapiAnalyticsV3Model.Rows.parse.parse_collection" e x')
            C.empty
            (fun v -> { x with c = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAnalyticsV3Model.Rows.parse" e x
      
    end
    
    module Cols =
    struct
      type t = {
        id : string;
        label : string;
        _type : string;
        
      }
      
      let id = {
        GapiLens.get = (fun x -> x.id);
        GapiLens.set = (fun v x -> { x with id = v });
      }
      let label = {
        GapiLens.get = (fun x -> x.label);
        GapiLens.set = (fun v x -> { x with label = v });
      }
      let _type = {
        GapiLens.get = (fun x -> x._type);
        GapiLens.set = (fun v x -> { x with _type = v });
      }
      
      let empty = {
        id = "";
        label = "";
        _type = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "id" x.id;
          GapiJson.render_string_value "label" x.label;
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
            ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with label = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with _type = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiAnalyticsV3Model.Cols.parse" e x
      
    end
    
    type t = {
      cols : Cols.t list;
      rows : Rows.t list;
      
    }
    
    let cols = {
      GapiLens.get = (fun x -> x.cols);
      GapiLens.set = (fun v x -> { x with cols = v });
    }
    let rows = {
      GapiLens.get = (fun x -> x.rows);
      GapiLens.set = (fun v x -> { x with rows = v });
    }
    
    let empty = {
      cols = [];
      rows = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "cols" Cols.render x.cols;
        GapiJson.render_array "rows" Rows.render x.rows;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "cols"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children Cols.parse Cols.empty (fun v -> v) cs
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.DataTable.parse.parse_collection" e x')
          Cols.empty
          (fun v -> { x with cols = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "rows"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children Rows.parse Rows.empty (fun v -> v) cs
            | e ->
              GapiJson.unexpected "GapiAnalyticsV3Model.DataTable.parse.parse_collection" e x')
          Rows.empty
          (fun v -> { x with rows = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.DataTable.parse" e x
    
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
    dataLastRefreshed : int64;
    dataTable : DataTable.t;
    id : string;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    profileInfo : ProfileInfo.t;
    query : Query.t;
    rows : string list list;
    sampleSize : int64;
    sampleSpace : int64;
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
  let dataLastRefreshed = {
    GapiLens.get = (fun x -> x.dataLastRefreshed);
    GapiLens.set = (fun v x -> { x with dataLastRefreshed = v });
  }
  let dataTable = {
    GapiLens.get = (fun x -> x.dataTable);
    GapiLens.set = (fun v x -> { x with dataTable = v });
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
  let sampleSize = {
    GapiLens.get = (fun x -> x.sampleSize);
    GapiLens.set = (fun v x -> { x with sampleSize = v });
  }
  let sampleSpace = {
    GapiLens.get = (fun x -> x.sampleSpace);
    GapiLens.set = (fun v x -> { x with sampleSpace = v });
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
    dataLastRefreshed = 0L;
    dataTable = DataTable.empty;
    id = "";
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    profileInfo = ProfileInfo.empty;
    query = Query.empty;
    rows = [];
    sampleSize = 0L;
    sampleSpace = 0L;
    selfLink = "";
    totalResults = 0;
    totalsForAllResults = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "columnHeaders" ColumnHeaders.render x.columnHeaders;
      GapiJson.render_bool_value "containsSampledData" x.containsSampledData;
      GapiJson.render_int64_value "dataLastRefreshed" x.dataLastRefreshed;
      (fun v -> GapiJson.render_object "dataTable" (DataTable.render_content v)) x.dataTable;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      (fun v -> GapiJson.render_object "profileInfo" (ProfileInfo.render_content v)) x.profileInfo;
      (fun v -> GapiJson.render_object "query" (Query.render_content v)) x.query;
      GapiJson.render_array "rows" (GapiJson.render_array "" (GapiJson.render_string_value "")) x.rows;
      GapiJson.render_int64_value "sampleSize" x.sampleSize;
      GapiJson.render_int64_value "sampleSpace" x.sampleSpace;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_int_value "totalResults" x.totalResults;
      GapiJson.render_collection "totalsForAllResults" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.totalsForAllResults;
      
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
        ({ GapiJson.name = "dataLastRefreshed"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataLastRefreshed = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataTable"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataTable.parse
        DataTable.empty
        (fun v -> { x with dataTable = v })
        cs
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
        ({ GapiJson.name = "sampleSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sampleSize = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sampleSpace"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sampleSpace = Int64.of_string v }
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

module ProfileFilterLinks =
struct
  type t = {
    items : ProfileFilterLink.t list;
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
      GapiJson.render_array "items" ProfileFilterLink.render x.items;
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
              ProfileFilterLink.parse
              ProfileFilterLink.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.ProfileFilterLinks.parse.parse_collection" e x')
        ProfileFilterLink.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.ProfileFilterLinks.parse" e x
  
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

module EntityUserLinks =
struct
  type t = {
    items : EntityUserLink.t list;
    itemsPerPage : int;
    kind : string;
    nextLink : string;
    previousLink : string;
    startIndex : int;
    totalResults : int;
    
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
  
  let empty = {
    items = [];
    itemsPerPage = 0;
    kind = "";
    nextLink = "";
    previousLink = "";
    startIndex = 0;
    totalResults = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" EntityUserLink.render x.items;
      GapiJson.render_int_value "itemsPerPage" x.itemsPerPage;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "previousLink" x.previousLink;
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_int_value "totalResults" x.totalResults;
      
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
              EntityUserLink.parse
              EntityUserLink.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.EntityUserLinks.parse.parse_collection" e x')
        EntityUserLink.empty
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.EntityUserLinks.parse" e x
  
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

module RemarketingAudiences =
struct
  type t = {
    items : RemarketingAudience.t list;
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
      GapiJson.render_array "items" RemarketingAudience.render x.items;
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
              RemarketingAudience.parse
              RemarketingAudience.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.RemarketingAudiences.parse.parse_collection" e x')
        RemarketingAudience.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.RemarketingAudiences.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Filter =
struct
  module UppercaseDetails =
  struct
    type t = {
      field : string;
      fieldIndex : int;
      
    }
    
    let field = {
      GapiLens.get = (fun x -> x.field);
      GapiLens.set = (fun v x -> { x with field = v });
    }
    let fieldIndex = {
      GapiLens.get = (fun x -> x.fieldIndex);
      GapiLens.set = (fun v x -> { x with fieldIndex = v });
    }
    
    let empty = {
      field = "";
      fieldIndex = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "field" x.field;
        GapiJson.render_int_value "fieldIndex" x.fieldIndex;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "field"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with field = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldIndex"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with fieldIndex = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.UppercaseDetails.parse" e x
    
  end
  
  module SearchAndReplaceDetails =
  struct
    type t = {
      caseSensitive : bool;
      field : string;
      fieldIndex : int;
      replaceString : string;
      searchString : string;
      
    }
    
    let caseSensitive = {
      GapiLens.get = (fun x -> x.caseSensitive);
      GapiLens.set = (fun v x -> { x with caseSensitive = v });
    }
    let field = {
      GapiLens.get = (fun x -> x.field);
      GapiLens.set = (fun v x -> { x with field = v });
    }
    let fieldIndex = {
      GapiLens.get = (fun x -> x.fieldIndex);
      GapiLens.set = (fun v x -> { x with fieldIndex = v });
    }
    let replaceString = {
      GapiLens.get = (fun x -> x.replaceString);
      GapiLens.set = (fun v x -> { x with replaceString = v });
    }
    let searchString = {
      GapiLens.get = (fun x -> x.searchString);
      GapiLens.set = (fun v x -> { x with searchString = v });
    }
    
    let empty = {
      caseSensitive = false;
      field = "";
      fieldIndex = 0;
      replaceString = "";
      searchString = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "caseSensitive" x.caseSensitive;
        GapiJson.render_string_value "field" x.field;
        GapiJson.render_int_value "fieldIndex" x.fieldIndex;
        GapiJson.render_string_value "replaceString" x.replaceString;
        GapiJson.render_string_value "searchString" x.searchString;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "caseSensitive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with caseSensitive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "field"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with field = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldIndex"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with fieldIndex = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "replaceString"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with replaceString = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "searchString"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with searchString = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.SearchAndReplaceDetails.parse" e x
    
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
  
  module LowercaseDetails =
  struct
    type t = {
      field : string;
      fieldIndex : int;
      
    }
    
    let field = {
      GapiLens.get = (fun x -> x.field);
      GapiLens.set = (fun v x -> { x with field = v });
    }
    let fieldIndex = {
      GapiLens.get = (fun x -> x.fieldIndex);
      GapiLens.set = (fun v x -> { x with fieldIndex = v });
    }
    
    let empty = {
      field = "";
      fieldIndex = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "field" x.field;
        GapiJson.render_int_value "fieldIndex" x.fieldIndex;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "field"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with field = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldIndex"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with fieldIndex = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.LowercaseDetails.parse" e x
    
  end
  
  module AdvancedDetails =
  struct
    type t = {
      caseSensitive : bool;
      extractA : string;
      extractB : string;
      fieldA : string;
      fieldAIndex : int;
      fieldARequired : bool;
      fieldB : string;
      fieldBIndex : int;
      fieldBRequired : bool;
      outputConstructor : string;
      outputToField : string;
      outputToFieldIndex : int;
      overrideOutputField : bool;
      
    }
    
    let caseSensitive = {
      GapiLens.get = (fun x -> x.caseSensitive);
      GapiLens.set = (fun v x -> { x with caseSensitive = v });
    }
    let extractA = {
      GapiLens.get = (fun x -> x.extractA);
      GapiLens.set = (fun v x -> { x with extractA = v });
    }
    let extractB = {
      GapiLens.get = (fun x -> x.extractB);
      GapiLens.set = (fun v x -> { x with extractB = v });
    }
    let fieldA = {
      GapiLens.get = (fun x -> x.fieldA);
      GapiLens.set = (fun v x -> { x with fieldA = v });
    }
    let fieldAIndex = {
      GapiLens.get = (fun x -> x.fieldAIndex);
      GapiLens.set = (fun v x -> { x with fieldAIndex = v });
    }
    let fieldARequired = {
      GapiLens.get = (fun x -> x.fieldARequired);
      GapiLens.set = (fun v x -> { x with fieldARequired = v });
    }
    let fieldB = {
      GapiLens.get = (fun x -> x.fieldB);
      GapiLens.set = (fun v x -> { x with fieldB = v });
    }
    let fieldBIndex = {
      GapiLens.get = (fun x -> x.fieldBIndex);
      GapiLens.set = (fun v x -> { x with fieldBIndex = v });
    }
    let fieldBRequired = {
      GapiLens.get = (fun x -> x.fieldBRequired);
      GapiLens.set = (fun v x -> { x with fieldBRequired = v });
    }
    let outputConstructor = {
      GapiLens.get = (fun x -> x.outputConstructor);
      GapiLens.set = (fun v x -> { x with outputConstructor = v });
    }
    let outputToField = {
      GapiLens.get = (fun x -> x.outputToField);
      GapiLens.set = (fun v x -> { x with outputToField = v });
    }
    let outputToFieldIndex = {
      GapiLens.get = (fun x -> x.outputToFieldIndex);
      GapiLens.set = (fun v x -> { x with outputToFieldIndex = v });
    }
    let overrideOutputField = {
      GapiLens.get = (fun x -> x.overrideOutputField);
      GapiLens.set = (fun v x -> { x with overrideOutputField = v });
    }
    
    let empty = {
      caseSensitive = false;
      extractA = "";
      extractB = "";
      fieldA = "";
      fieldAIndex = 0;
      fieldARequired = false;
      fieldB = "";
      fieldBIndex = 0;
      fieldBRequired = false;
      outputConstructor = "";
      outputToField = "";
      outputToFieldIndex = 0;
      overrideOutputField = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "caseSensitive" x.caseSensitive;
        GapiJson.render_string_value "extractA" x.extractA;
        GapiJson.render_string_value "extractB" x.extractB;
        GapiJson.render_string_value "fieldA" x.fieldA;
        GapiJson.render_int_value "fieldAIndex" x.fieldAIndex;
        GapiJson.render_bool_value "fieldARequired" x.fieldARequired;
        GapiJson.render_string_value "fieldB" x.fieldB;
        GapiJson.render_int_value "fieldBIndex" x.fieldBIndex;
        GapiJson.render_bool_value "fieldBRequired" x.fieldBRequired;
        GapiJson.render_string_value "outputConstructor" x.outputConstructor;
        GapiJson.render_string_value "outputToField" x.outputToField;
        GapiJson.render_int_value "outputToFieldIndex" x.outputToFieldIndex;
        GapiJson.render_bool_value "overrideOutputField" x.overrideOutputField;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "caseSensitive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with caseSensitive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "extractA"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with extractA = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "extractB"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with extractB = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldA"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with fieldA = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldAIndex"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with fieldAIndex = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldARequired"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with fieldARequired = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldB"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with fieldB = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldBIndex"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with fieldBIndex = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "fieldBRequired"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with fieldBRequired = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "outputConstructor"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with outputConstructor = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "outputToField"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with outputToField = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "outputToFieldIndex"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with outputToFieldIndex = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "overrideOutputField"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with overrideOutputField = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiAnalyticsV3Model.AdvancedDetails.parse" e x
    
  end
  
  type t = {
    accountId : string;
    advancedDetails : AdvancedDetails.t;
    created : GapiDate.t;
    excludeDetails : FilterExpression.t;
    id : string;
    includeDetails : FilterExpression.t;
    kind : string;
    lowercaseDetails : LowercaseDetails.t;
    name : string;
    parentLink : ParentLink.t;
    searchAndReplaceDetails : SearchAndReplaceDetails.t;
    selfLink : string;
    _type : string;
    updated : GapiDate.t;
    uppercaseDetails : UppercaseDetails.t;
    
  }
  
  let accountId = {
    GapiLens.get = (fun x -> x.accountId);
    GapiLens.set = (fun v x -> { x with accountId = v });
  }
  let advancedDetails = {
    GapiLens.get = (fun x -> x.advancedDetails);
    GapiLens.set = (fun v x -> { x with advancedDetails = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let excludeDetails = {
    GapiLens.get = (fun x -> x.excludeDetails);
    GapiLens.set = (fun v x -> { x with excludeDetails = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let includeDetails = {
    GapiLens.get = (fun x -> x.includeDetails);
    GapiLens.set = (fun v x -> { x with includeDetails = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let lowercaseDetails = {
    GapiLens.get = (fun x -> x.lowercaseDetails);
    GapiLens.set = (fun v x -> { x with lowercaseDetails = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let searchAndReplaceDetails = {
    GapiLens.get = (fun x -> x.searchAndReplaceDetails);
    GapiLens.set = (fun v x -> { x with searchAndReplaceDetails = v });
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
  let uppercaseDetails = {
    GapiLens.get = (fun x -> x.uppercaseDetails);
    GapiLens.set = (fun v x -> { x with uppercaseDetails = v });
  }
  
  let empty = {
    accountId = "";
    advancedDetails = AdvancedDetails.empty;
    created = GapiDate.epoch;
    excludeDetails = FilterExpression.empty;
    id = "";
    includeDetails = FilterExpression.empty;
    kind = "";
    lowercaseDetails = LowercaseDetails.empty;
    name = "";
    parentLink = ParentLink.empty;
    searchAndReplaceDetails = SearchAndReplaceDetails.empty;
    selfLink = "";
    _type = "";
    updated = GapiDate.epoch;
    uppercaseDetails = UppercaseDetails.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accountId" x.accountId;
      (fun v -> GapiJson.render_object "advancedDetails" (AdvancedDetails.render_content v)) x.advancedDetails;
      GapiJson.render_date_value "created" x.created;
      (fun v -> GapiJson.render_object "excludeDetails" (FilterExpression.render_content v)) x.excludeDetails;
      GapiJson.render_string_value "id" x.id;
      (fun v -> GapiJson.render_object "includeDetails" (FilterExpression.render_content v)) x.includeDetails;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "lowercaseDetails" (LowercaseDetails.render_content v)) x.lowercaseDetails;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "parentLink" (ParentLink.render_content v)) x.parentLink;
      (fun v -> GapiJson.render_object "searchAndReplaceDetails" (SearchAndReplaceDetails.render_content v)) x.searchAndReplaceDetails;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_date_value "updated" x.updated;
      (fun v -> GapiJson.render_object "uppercaseDetails" (UppercaseDetails.render_content v)) x.uppercaseDetails;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accountId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accountId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "advancedDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AdvancedDetails.parse
        AdvancedDetails.empty
        (fun v -> { x with advancedDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "excludeDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterExpression.parse
        FilterExpression.empty
        (fun v -> { x with excludeDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "includeDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterExpression.parse
        FilterExpression.empty
        (fun v -> { x with includeDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lowercaseDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        LowercaseDetails.parse
        LowercaseDetails.empty
        (fun v -> { x with lowercaseDetails = v })
        cs
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
        ({ GapiJson.name = "searchAndReplaceDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SearchAndReplaceDetails.parse
        SearchAndReplaceDetails.empty
        (fun v -> { x with searchAndReplaceDetails = v })
        cs
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
        ({ GapiJson.name = "uppercaseDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UppercaseDetails.parse
        UppercaseDetails.empty
        (fun v -> { x with uppercaseDetails = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.Filter.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Filters =
struct
  type t = {
    items : Filter.t list;
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
      GapiJson.render_array "items" Filter.render x.items;
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
            GapiJson.parse_children Filter.parse Filter.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiAnalyticsV3Model.Filters.parse.parse_collection" e x')
        Filter.empty
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
      GapiJson.unexpected "GapiAnalyticsV3Model.Filters.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HashClientIdRequest =
struct
  type t = {
    clientId : string;
    kind : string;
    webPropertyId : string;
    
  }
  
  let clientId = {
    GapiLens.get = (fun x -> x.clientId);
    GapiLens.set = (fun v x -> { x with clientId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let webPropertyId = {
    GapiLens.get = (fun x -> x.webPropertyId);
    GapiLens.set = (fun v x -> { x with webPropertyId = v });
  }
  
  let empty = {
    clientId = "";
    kind = "";
    webPropertyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "clientId" x.clientId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "webPropertyId" x.webPropertyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "clientId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with clientId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webPropertyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webPropertyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiAnalyticsV3Model.HashClientIdRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

