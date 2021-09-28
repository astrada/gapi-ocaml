(* Warning! This file is generated. Modify at your own risk.
        *)

module DimensionRange =
struct
  type t = {
    startIndex : int;
    dimension : string;
    sheetId : int;
    endIndex : int;
    
  }
  
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let dimension = {
    GapiLens.get = (fun x -> x.dimension);
    GapiLens.set = (fun v x -> { x with dimension = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let endIndex = {
    GapiLens.get = (fun x -> x.endIndex);
    GapiLens.set = (fun v x -> { x with endIndex = v });
  }
  
  let empty = {
    startIndex = 0;
    dimension = "";
    sheetId = 0;
    endIndex = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "startIndex" x.startIndex;
      GapiJson.render_string_value "dimension" x.dimension;
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_int_value "endIndex" x.endIndex;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dimension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with endIndex = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DimensionRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeveloperMetadataLocation =
struct
  type t = {
    dimensionRange : DimensionRange.t;
    sheetId : int;
    locationType : string;
    spreadsheet : bool;
    
  }
  
  let dimensionRange = {
    GapiLens.get = (fun x -> x.dimensionRange);
    GapiLens.set = (fun v x -> { x with dimensionRange = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let locationType = {
    GapiLens.get = (fun x -> x.locationType);
    GapiLens.set = (fun v x -> { x with locationType = v });
  }
  let spreadsheet = {
    GapiLens.get = (fun x -> x.spreadsheet);
    GapiLens.set = (fun v x -> { x with spreadsheet = v });
  }
  
  let empty = {
    dimensionRange = DimensionRange.empty;
    sheetId = 0;
    locationType = "";
    spreadsheet = false;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dimensionRange" (DimensionRange.render_content v)) x.dimensionRange;
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_string_value "locationType" x.locationType;
      GapiJson.render_bool_value "spreadsheet" x.spreadsheet;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dimensionRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with dimensionRange = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "locationType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with locationType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheet"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with spreadsheet = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeveloperMetadataLocation.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeveloperMetadata =
struct
  type t = {
    metadataKey : string;
    metadataValue : string;
    metadataId : int;
    location : DeveloperMetadataLocation.t;
    visibility : string;
    
  }
  
  let metadataKey = {
    GapiLens.get = (fun x -> x.metadataKey);
    GapiLens.set = (fun v x -> { x with metadataKey = v });
  }
  let metadataValue = {
    GapiLens.get = (fun x -> x.metadataValue);
    GapiLens.set = (fun v x -> { x with metadataValue = v });
  }
  let metadataId = {
    GapiLens.get = (fun x -> x.metadataId);
    GapiLens.set = (fun v x -> { x with metadataId = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let visibility = {
    GapiLens.get = (fun x -> x.visibility);
    GapiLens.set = (fun v x -> { x with visibility = v });
  }
  
  let empty = {
    metadataKey = "";
    metadataValue = "";
    metadataId = 0;
    location = DeveloperMetadataLocation.empty;
    visibility = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "metadataKey" x.metadataKey;
      GapiJson.render_string_value "metadataValue" x.metadataValue;
      GapiJson.render_int_value "metadataId" x.metadataId;
      (fun v -> GapiJson.render_object "location" (DeveloperMetadataLocation.render_content v)) x.location;
      GapiJson.render_string_value "visibility" x.visibility;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metadataKey"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with metadataKey = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metadataValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with metadataValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metadataId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with metadataId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "location"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadataLocation.parse
        DeveloperMetadataLocation.empty
        (fun v -> { x with location = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "visibility"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with visibility = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeveloperMetadata.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateDeveloperMetadataResponse =
struct
  type t = {
    developerMetadata : DeveloperMetadata.t list;
    
  }
  
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  
  let empty = {
    developerMetadata = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "developerMetadata" DeveloperMetadata.render x.developerMetadata;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DeveloperMetadata.parse
              DeveloperMetadata.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.UpdateDeveloperMetadataResponse.parse.parse_collection" e x')
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateDeveloperMetadataResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataExecutionStatus =
struct
  type t = {
    errorCode : string;
    errorMessage : string;
    state : string;
    lastRefreshTime : string;
    
  }
  
  let errorCode = {
    GapiLens.get = (fun x -> x.errorCode);
    GapiLens.set = (fun v x -> { x with errorCode = v });
  }
  let errorMessage = {
    GapiLens.get = (fun x -> x.errorMessage);
    GapiLens.set = (fun v x -> { x with errorMessage = v });
  }
  let state = {
    GapiLens.get = (fun x -> x.state);
    GapiLens.set = (fun v x -> { x with state = v });
  }
  let lastRefreshTime = {
    GapiLens.get = (fun x -> x.lastRefreshTime);
    GapiLens.set = (fun v x -> { x with lastRefreshTime = v });
  }
  
  let empty = {
    errorCode = "";
    errorMessage = "";
    state = "";
    lastRefreshTime = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "errorCode" x.errorCode;
      GapiJson.render_string_value "errorMessage" x.errorMessage;
      GapiJson.render_string_value "state" x.state;
      GapiJson.render_string_value "lastRefreshTime" x.lastRefreshTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "errorCode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with errorCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "errorMessage"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with errorMessage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "state"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with state = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "lastRefreshTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with lastRefreshTime = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataExecutionStatus.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceColumnReference =
struct
  type t = {
    name : string;
    
  }
  
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  
  let empty = {
    name = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceColumnReference.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceColumn =
struct
  type t = {
    formula : string;
    reference : DataSourceColumnReference.t;
    
  }
  
  let formula = {
    GapiLens.get = (fun x -> x.formula);
    GapiLens.set = (fun v x -> { x with formula = v });
  }
  let reference = {
    GapiLens.get = (fun x -> x.reference);
    GapiLens.set = (fun v x -> { x with reference = v });
  }
  
  let empty = {
    formula = "";
    reference = DataSourceColumnReference.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "formula" x.formula;
      (fun v -> GapiJson.render_object "reference" (DataSourceColumnReference.render_content v)) x.reference;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formula"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with formula = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "reference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with reference = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceColumn.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceSheetProperties =
struct
  type t = {
    columns : DataSourceColumn.t list;
    dataExecutionStatus : DataExecutionStatus.t;
    dataSourceId : string;
    
  }
  
  let columns = {
    GapiLens.get = (fun x -> x.columns);
    GapiLens.set = (fun v x -> { x with columns = v });
  }
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  
  let empty = {
    columns = [];
    dataExecutionStatus = DataExecutionStatus.empty;
    dataSourceId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "columns" DataSourceColumn.render x.columns;
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columns"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceColumn.parse
              DataSourceColumn.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceSheetProperties.parse.parse_collection" e x')
        DataSourceColumn.empty
        (fun v -> { x with columns = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceSheetProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module LineStyle =
struct
  type t = {
    width : int;
    _type : string;
    
  }
  
  let width = {
    GapiLens.get = (fun x -> x.width);
    GapiLens.set = (fun v x -> { x with width = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    width = 0;
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "width" x.width;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with width = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.LineStyle.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Editors =
struct
  type t = {
    users : string list;
    domainUsersCanEdit : bool;
    groups : string list;
    
  }
  
  let users = {
    GapiLens.get = (fun x -> x.users);
    GapiLens.set = (fun v x -> { x with users = v });
  }
  let domainUsersCanEdit = {
    GapiLens.get = (fun x -> x.domainUsersCanEdit);
    GapiLens.set = (fun v x -> { x with domainUsersCanEdit = v });
  }
  let groups = {
    GapiLens.get = (fun x -> x.groups);
    GapiLens.set = (fun v x -> { x with groups = v });
  }
  
  let empty = {
    users = [];
    domainUsersCanEdit = false;
    groups = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "users" (GapiJson.render_string_value "") x.users;
      GapiJson.render_bool_value "domainUsersCanEdit" x.domainUsersCanEdit;
      GapiJson.render_array "groups" (GapiJson.render_string_value "") x.groups;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "users"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Editors.parse.parse_collection" e x')
        ""
        (fun v -> { x with users = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "domainUsersCanEdit"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with domainUsersCanEdit = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groups"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Editors.parse.parse_collection" e x')
        ""
        (fun v -> { x with groups = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Editors.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GridRange =
struct
  type t = {
    sheetId : int;
    endRowIndex : int;
    endColumnIndex : int;
    startColumnIndex : int;
    startRowIndex : int;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let endRowIndex = {
    GapiLens.get = (fun x -> x.endRowIndex);
    GapiLens.set = (fun v x -> { x with endRowIndex = v });
  }
  let endColumnIndex = {
    GapiLens.get = (fun x -> x.endColumnIndex);
    GapiLens.set = (fun v x -> { x with endColumnIndex = v });
  }
  let startColumnIndex = {
    GapiLens.get = (fun x -> x.startColumnIndex);
    GapiLens.set = (fun v x -> { x with startColumnIndex = v });
  }
  let startRowIndex = {
    GapiLens.get = (fun x -> x.startRowIndex);
    GapiLens.set = (fun v x -> { x with startRowIndex = v });
  }
  
  let empty = {
    sheetId = 0;
    endRowIndex = 0;
    endColumnIndex = 0;
    startColumnIndex = 0;
    startRowIndex = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_int_value "endRowIndex" x.endRowIndex;
      GapiJson.render_int_value "endColumnIndex" x.endColumnIndex;
      GapiJson.render_int_value "startColumnIndex" x.startColumnIndex;
      GapiJson.render_int_value "startRowIndex" x.startRowIndex;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endRowIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with endRowIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endColumnIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with endColumnIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startColumnIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startColumnIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startRowIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startRowIndex = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.GridRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ProtectedRange =
struct
  type t = {
    requestingUserCanEdit : bool;
    warningOnly : bool;
    description : string;
    range : GridRange.t;
    protectedRangeId : int;
    namedRangeId : string;
    editors : Editors.t;
    unprotectedRanges : GridRange.t list;
    
  }
  
  let requestingUserCanEdit = {
    GapiLens.get = (fun x -> x.requestingUserCanEdit);
    GapiLens.set = (fun v x -> { x with requestingUserCanEdit = v });
  }
  let warningOnly = {
    GapiLens.get = (fun x -> x.warningOnly);
    GapiLens.set = (fun v x -> { x with warningOnly = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let protectedRangeId = {
    GapiLens.get = (fun x -> x.protectedRangeId);
    GapiLens.set = (fun v x -> { x with protectedRangeId = v });
  }
  let namedRangeId = {
    GapiLens.get = (fun x -> x.namedRangeId);
    GapiLens.set = (fun v x -> { x with namedRangeId = v });
  }
  let editors = {
    GapiLens.get = (fun x -> x.editors);
    GapiLens.set = (fun v x -> { x with editors = v });
  }
  let unprotectedRanges = {
    GapiLens.get = (fun x -> x.unprotectedRanges);
    GapiLens.set = (fun v x -> { x with unprotectedRanges = v });
  }
  
  let empty = {
    requestingUserCanEdit = false;
    warningOnly = false;
    description = "";
    range = GridRange.empty;
    protectedRangeId = 0;
    namedRangeId = "";
    editors = Editors.empty;
    unprotectedRanges = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "requestingUserCanEdit" x.requestingUserCanEdit;
      GapiJson.render_bool_value "warningOnly" x.warningOnly;
      GapiJson.render_string_value "description" x.description;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_int_value "protectedRangeId" x.protectedRangeId;
      GapiJson.render_string_value "namedRangeId" x.namedRangeId;
      (fun v -> GapiJson.render_object "editors" (Editors.render_content v)) x.editors;
      GapiJson.render_array "unprotectedRanges" GridRange.render x.unprotectedRanges;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "requestingUserCanEdit"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with requestingUserCanEdit = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "warningOnly"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with warningOnly = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "protectedRangeId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with protectedRangeId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "namedRangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with namedRangeId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "editors"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Editors.parse
        Editors.empty
        (fun v -> { x with editors = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "unprotectedRanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              GridRange.parse
              GridRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ProtectedRange.parse.parse_collection" e x')
        GridRange.empty
        (fun v -> { x with unprotectedRanges = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ProtectedRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateProtectedRangeRequest =
struct
  type t = {
    protectedRange : ProtectedRange.t;
    fields : string;
    
  }
  
  let protectedRange = {
    GapiLens.get = (fun x -> x.protectedRange);
    GapiLens.set = (fun v x -> { x with protectedRange = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    protectedRange = ProtectedRange.empty;
    fields = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "protectedRange" (ProtectedRange.render_content v)) x.protectedRange;
      GapiJson.render_string_value "fields" x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "protectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ProtectedRange.parse
        ProtectedRange.empty
        (fun v -> { x with protectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateProtectedRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ValueRange =
struct
  type t = {
    values : string list list;
    majorDimension : string;
    range : string;
    
  }
  
  let values = {
    GapiLens.get = (fun x -> x.values);
    GapiLens.set = (fun v x -> { x with values = v });
  }
  let majorDimension = {
    GapiLens.get = (fun x -> x.majorDimension);
    GapiLens.set = (fun v x -> { x with majorDimension = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    values = [];
    majorDimension = "";
    range = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "values" (GapiJson.render_array "" (GapiJson.render_string_value "")) x.values;
      GapiJson.render_string_value "majorDimension" x.majorDimension;
      GapiJson.render_string_value "range" x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "values"; data_type = GapiJson.Array },
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
                  GapiJson.unexpected "GapiSheetsV4Model.ValueRange.parse.parse_collection" e x')
              ""
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ValueRange.parse.parse_collection" e x')
        []
        (fun v -> { x with values = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "majorDimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with majorDimension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "range"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with range = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ValueRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeveloperMetadataLookup =
struct
  type t = {
    metadataLocation : DeveloperMetadataLocation.t;
    locationType : string;
    metadataId : int;
    metadataKey : string;
    visibility : string;
    metadataValue : string;
    locationMatchingStrategy : string;
    
  }
  
  let metadataLocation = {
    GapiLens.get = (fun x -> x.metadataLocation);
    GapiLens.set = (fun v x -> { x with metadataLocation = v });
  }
  let locationType = {
    GapiLens.get = (fun x -> x.locationType);
    GapiLens.set = (fun v x -> { x with locationType = v });
  }
  let metadataId = {
    GapiLens.get = (fun x -> x.metadataId);
    GapiLens.set = (fun v x -> { x with metadataId = v });
  }
  let metadataKey = {
    GapiLens.get = (fun x -> x.metadataKey);
    GapiLens.set = (fun v x -> { x with metadataKey = v });
  }
  let visibility = {
    GapiLens.get = (fun x -> x.visibility);
    GapiLens.set = (fun v x -> { x with visibility = v });
  }
  let metadataValue = {
    GapiLens.get = (fun x -> x.metadataValue);
    GapiLens.set = (fun v x -> { x with metadataValue = v });
  }
  let locationMatchingStrategy = {
    GapiLens.get = (fun x -> x.locationMatchingStrategy);
    GapiLens.set = (fun v x -> { x with locationMatchingStrategy = v });
  }
  
  let empty = {
    metadataLocation = DeveloperMetadataLocation.empty;
    locationType = "";
    metadataId = 0;
    metadataKey = "";
    visibility = "";
    metadataValue = "";
    locationMatchingStrategy = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "metadataLocation" (DeveloperMetadataLocation.render_content v)) x.metadataLocation;
      GapiJson.render_string_value "locationType" x.locationType;
      GapiJson.render_int_value "metadataId" x.metadataId;
      GapiJson.render_string_value "metadataKey" x.metadataKey;
      GapiJson.render_string_value "visibility" x.visibility;
      GapiJson.render_string_value "metadataValue" x.metadataValue;
      GapiJson.render_string_value "locationMatchingStrategy" x.locationMatchingStrategy;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "metadataLocation"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadataLocation.parse
        DeveloperMetadataLocation.empty
        (fun v -> { x with metadataLocation = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "locationType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with locationType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metadataId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with metadataId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metadataKey"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with metadataKey = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "visibility"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with visibility = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "metadataValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with metadataValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "locationMatchingStrategy"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with locationMatchingStrategy = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeveloperMetadataLookup.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataFilter =
struct
  type t = {
    developerMetadataLookup : DeveloperMetadataLookup.t;
    gridRange : GridRange.t;
    a1Range : string;
    
  }
  
  let developerMetadataLookup = {
    GapiLens.get = (fun x -> x.developerMetadataLookup);
    GapiLens.set = (fun v x -> { x with developerMetadataLookup = v });
  }
  let gridRange = {
    GapiLens.get = (fun x -> x.gridRange);
    GapiLens.set = (fun v x -> { x with gridRange = v });
  }
  let a1Range = {
    GapiLens.get = (fun x -> x.a1Range);
    GapiLens.set = (fun v x -> { x with a1Range = v });
  }
  
  let empty = {
    developerMetadataLookup = DeveloperMetadataLookup.empty;
    gridRange = GridRange.empty;
    a1Range = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "developerMetadataLookup" (DeveloperMetadataLookup.render_content v)) x.developerMetadataLookup;
      (fun v -> GapiJson.render_object "gridRange" (GridRange.render_content v)) x.gridRange;
      GapiJson.render_string_value "a1Range" x.a1Range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadataLookup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadataLookup.parse
        DeveloperMetadataLookup.empty
        (fun v -> { x with developerMetadataLookup = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "gridRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with gridRange = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "a1Range"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with a1Range = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataFilter.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateValuesByDataFilterResponse =
struct
  type t = {
    updatedData : ValueRange.t;
    updatedRange : string;
    updatedColumns : int;
    dataFilter : DataFilter.t;
    updatedCells : int;
    updatedRows : int;
    
  }
  
  let updatedData = {
    GapiLens.get = (fun x -> x.updatedData);
    GapiLens.set = (fun v x -> { x with updatedData = v });
  }
  let updatedRange = {
    GapiLens.get = (fun x -> x.updatedRange);
    GapiLens.set = (fun v x -> { x with updatedRange = v });
  }
  let updatedColumns = {
    GapiLens.get = (fun x -> x.updatedColumns);
    GapiLens.set = (fun v x -> { x with updatedColumns = v });
  }
  let dataFilter = {
    GapiLens.get = (fun x -> x.dataFilter);
    GapiLens.set = (fun v x -> { x with dataFilter = v });
  }
  let updatedCells = {
    GapiLens.get = (fun x -> x.updatedCells);
    GapiLens.set = (fun v x -> { x with updatedCells = v });
  }
  let updatedRows = {
    GapiLens.get = (fun x -> x.updatedRows);
    GapiLens.set = (fun v x -> { x with updatedRows = v });
  }
  
  let empty = {
    updatedData = ValueRange.empty;
    updatedRange = "";
    updatedColumns = 0;
    dataFilter = DataFilter.empty;
    updatedCells = 0;
    updatedRows = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "updatedData" (ValueRange.render_content v)) x.updatedData;
      GapiJson.render_string_value "updatedRange" x.updatedRange;
      GapiJson.render_int_value "updatedColumns" x.updatedColumns;
      (fun v -> GapiJson.render_object "dataFilter" (DataFilter.render_content v)) x.dataFilter;
      GapiJson.render_int_value "updatedCells" x.updatedCells;
      GapiJson.render_int_value "updatedRows" x.updatedRows;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updatedData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ValueRange.parse
        ValueRange.empty
        (fun v -> { x with updatedData = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedRange"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updatedRange = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedColumns"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with updatedColumns = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataFilter.parse
        DataFilter.empty
        (fun v -> { x with dataFilter = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedCells"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with updatedCells = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedRows"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with updatedRows = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateValuesByDataFilterResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BatchUpdateValuesByDataFilterResponse =
struct
  type t = {
    responses : UpdateValuesByDataFilterResponse.t list;
    totalUpdatedColumns : int;
    totalUpdatedSheets : int;
    totalUpdatedRows : int;
    totalUpdatedCells : int;
    spreadsheetId : string;
    
  }
  
  let responses = {
    GapiLens.get = (fun x -> x.responses);
    GapiLens.set = (fun v x -> { x with responses = v });
  }
  let totalUpdatedColumns = {
    GapiLens.get = (fun x -> x.totalUpdatedColumns);
    GapiLens.set = (fun v x -> { x with totalUpdatedColumns = v });
  }
  let totalUpdatedSheets = {
    GapiLens.get = (fun x -> x.totalUpdatedSheets);
    GapiLens.set = (fun v x -> { x with totalUpdatedSheets = v });
  }
  let totalUpdatedRows = {
    GapiLens.get = (fun x -> x.totalUpdatedRows);
    GapiLens.set = (fun v x -> { x with totalUpdatedRows = v });
  }
  let totalUpdatedCells = {
    GapiLens.get = (fun x -> x.totalUpdatedCells);
    GapiLens.set = (fun v x -> { x with totalUpdatedCells = v });
  }
  let spreadsheetId = {
    GapiLens.get = (fun x -> x.spreadsheetId);
    GapiLens.set = (fun v x -> { x with spreadsheetId = v });
  }
  
  let empty = {
    responses = [];
    totalUpdatedColumns = 0;
    totalUpdatedSheets = 0;
    totalUpdatedRows = 0;
    totalUpdatedCells = 0;
    spreadsheetId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "responses" UpdateValuesByDataFilterResponse.render x.responses;
      GapiJson.render_int_value "totalUpdatedColumns" x.totalUpdatedColumns;
      GapiJson.render_int_value "totalUpdatedSheets" x.totalUpdatedSheets;
      GapiJson.render_int_value "totalUpdatedRows" x.totalUpdatedRows;
      GapiJson.render_int_value "totalUpdatedCells" x.totalUpdatedCells;
      GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "responses"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              UpdateValuesByDataFilterResponse.parse
              UpdateValuesByDataFilterResponse.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesByDataFilterResponse.parse.parse_collection" e x')
        UpdateValuesByDataFilterResponse.empty
        (fun v -> { x with responses = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalUpdatedColumns"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalUpdatedColumns = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalUpdatedSheets"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalUpdatedSheets = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalUpdatedRows"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalUpdatedRows = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "totalUpdatedCells"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with totalUpdatedCells = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with spreadsheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesByDataFilterResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ConditionValue =
struct
  type t = {
    relativeDate : string;
    userEnteredValue : string;
    
  }
  
  let relativeDate = {
    GapiLens.get = (fun x -> x.relativeDate);
    GapiLens.set = (fun v x -> { x with relativeDate = v });
  }
  let userEnteredValue = {
    GapiLens.get = (fun x -> x.userEnteredValue);
    GapiLens.set = (fun v x -> { x with userEnteredValue = v });
  }
  
  let empty = {
    relativeDate = "";
    userEnteredValue = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "relativeDate" x.relativeDate;
      GapiJson.render_string_value "userEnteredValue" x.userEnteredValue;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "relativeDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with relativeDate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "userEnteredValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with userEnteredValue = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ConditionValue.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BooleanCondition =
struct
  type t = {
    _type : string;
    values : ConditionValue.t list;
    
  }
  
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let values = {
    GapiLens.get = (fun x -> x.values);
    GapiLens.set = (fun v x -> { x with values = v });
  }
  
  let empty = {
    _type = "";
    values = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_array "values" ConditionValue.render x.values;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "values"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ConditionValue.parse
              ConditionValue.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BooleanCondition.parse.parse_collection" e x')
        ConditionValue.empty
        (fun v -> { x with values = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BooleanCondition.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotFilterCriteria =
struct
  type t = {
    visibleValues : string list;
    condition : BooleanCondition.t;
    visibleByDefault : bool;
    
  }
  
  let visibleValues = {
    GapiLens.get = (fun x -> x.visibleValues);
    GapiLens.set = (fun v x -> { x with visibleValues = v });
  }
  let condition = {
    GapiLens.get = (fun x -> x.condition);
    GapiLens.set = (fun v x -> { x with condition = v });
  }
  let visibleByDefault = {
    GapiLens.get = (fun x -> x.visibleByDefault);
    GapiLens.set = (fun v x -> { x with visibleByDefault = v });
  }
  
  let empty = {
    visibleValues = [];
    condition = BooleanCondition.empty;
    visibleByDefault = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "visibleValues" (GapiJson.render_string_value "") x.visibleValues;
      (fun v -> GapiJson.render_object "condition" (BooleanCondition.render_content v)) x.condition;
      GapiJson.render_bool_value "visibleByDefault" x.visibleByDefault;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visibleValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotFilterCriteria.parse.parse_collection" e x')
        ""
        (fun v -> { x with visibleValues = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "condition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BooleanCondition.parse
        BooleanCondition.empty
        (fun v -> { x with condition = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "visibleByDefault"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with visibleByDefault = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotFilterCriteria.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotFilterSpec =
struct
  type t = {
    columnOffsetIndex : int;
    filterCriteria : PivotFilterCriteria.t;
    dataSourceColumnReference : DataSourceColumnReference.t;
    
  }
  
  let columnOffsetIndex = {
    GapiLens.get = (fun x -> x.columnOffsetIndex);
    GapiLens.set = (fun v x -> { x with columnOffsetIndex = v });
  }
  let filterCriteria = {
    GapiLens.get = (fun x -> x.filterCriteria);
    GapiLens.set = (fun v x -> { x with filterCriteria = v });
  }
  let dataSourceColumnReference = {
    GapiLens.get = (fun x -> x.dataSourceColumnReference);
    GapiLens.set = (fun v x -> { x with dataSourceColumnReference = v });
  }
  
  let empty = {
    columnOffsetIndex = 0;
    filterCriteria = PivotFilterCriteria.empty;
    dataSourceColumnReference = DataSourceColumnReference.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "columnOffsetIndex" x.columnOffsetIndex;
      (fun v -> GapiJson.render_object "filterCriteria" (PivotFilterCriteria.render_content v)) x.filterCriteria;
      (fun v -> GapiJson.render_object "dataSourceColumnReference" (DataSourceColumnReference.render_content v)) x.dataSourceColumnReference;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnOffsetIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with columnOffsetIndex = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterCriteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PivotFilterCriteria.parse
        PivotFilterCriteria.empty
        (fun v -> { x with filterCriteria = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceColumnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with dataSourceColumnReference = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotFilterSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Color =
struct
  type t = {
    blue : float;
    green : float;
    red : float;
    alpha : float;
    
  }
  
  let blue = {
    GapiLens.get = (fun x -> x.blue);
    GapiLens.set = (fun v x -> { x with blue = v });
  }
  let green = {
    GapiLens.get = (fun x -> x.green);
    GapiLens.set = (fun v x -> { x with green = v });
  }
  let red = {
    GapiLens.get = (fun x -> x.red);
    GapiLens.set = (fun v x -> { x with red = v });
  }
  let alpha = {
    GapiLens.get = (fun x -> x.alpha);
    GapiLens.set = (fun v x -> { x with alpha = v });
  }
  
  let empty = {
    blue = 0.0;
    green = 0.0;
    red = 0.0;
    alpha = 0.0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_float_value "blue" x.blue;
      GapiJson.render_float_value "green" x.green;
      GapiJson.render_float_value "red" x.red;
      GapiJson.render_float_value "alpha" x.alpha;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "blue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with blue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "blue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with blue = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "green"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with green = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "green"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with green = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "red"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with red = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "red"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with red = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "alpha"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with alpha = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "alpha"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with alpha = float_of_int v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Color.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ColorStyle =
struct
  type t = {
    rgbColor : Color.t;
    themeColor : string;
    
  }
  
  let rgbColor = {
    GapiLens.get = (fun x -> x.rgbColor);
    GapiLens.set = (fun v x -> { x with rgbColor = v });
  }
  let themeColor = {
    GapiLens.get = (fun x -> x.themeColor);
    GapiLens.set = (fun v x -> { x with themeColor = v });
  }
  
  let empty = {
    rgbColor = Color.empty;
    themeColor = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "rgbColor" (Color.render_content v)) x.rgbColor;
      GapiJson.render_string_value "themeColor" x.themeColor;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rgbColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with rgbColor = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "themeColor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with themeColor = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ColorStyle.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GridProperties =
struct
  type t = {
    columnGroupControlAfter : bool;
    rowGroupControlAfter : bool;
    hideGridlines : bool;
    columnCount : int;
    frozenRowCount : int;
    rowCount : int;
    frozenColumnCount : int;
    
  }
  
  let columnGroupControlAfter = {
    GapiLens.get = (fun x -> x.columnGroupControlAfter);
    GapiLens.set = (fun v x -> { x with columnGroupControlAfter = v });
  }
  let rowGroupControlAfter = {
    GapiLens.get = (fun x -> x.rowGroupControlAfter);
    GapiLens.set = (fun v x -> { x with rowGroupControlAfter = v });
  }
  let hideGridlines = {
    GapiLens.get = (fun x -> x.hideGridlines);
    GapiLens.set = (fun v x -> { x with hideGridlines = v });
  }
  let columnCount = {
    GapiLens.get = (fun x -> x.columnCount);
    GapiLens.set = (fun v x -> { x with columnCount = v });
  }
  let frozenRowCount = {
    GapiLens.get = (fun x -> x.frozenRowCount);
    GapiLens.set = (fun v x -> { x with frozenRowCount = v });
  }
  let rowCount = {
    GapiLens.get = (fun x -> x.rowCount);
    GapiLens.set = (fun v x -> { x with rowCount = v });
  }
  let frozenColumnCount = {
    GapiLens.get = (fun x -> x.frozenColumnCount);
    GapiLens.set = (fun v x -> { x with frozenColumnCount = v });
  }
  
  let empty = {
    columnGroupControlAfter = false;
    rowGroupControlAfter = false;
    hideGridlines = false;
    columnCount = 0;
    frozenRowCount = 0;
    rowCount = 0;
    frozenColumnCount = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "columnGroupControlAfter" x.columnGroupControlAfter;
      GapiJson.render_bool_value "rowGroupControlAfter" x.rowGroupControlAfter;
      GapiJson.render_bool_value "hideGridlines" x.hideGridlines;
      GapiJson.render_int_value "columnCount" x.columnCount;
      GapiJson.render_int_value "frozenRowCount" x.frozenRowCount;
      GapiJson.render_int_value "rowCount" x.rowCount;
      GapiJson.render_int_value "frozenColumnCount" x.frozenColumnCount;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnGroupControlAfter"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with columnGroupControlAfter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rowGroupControlAfter"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with rowGroupControlAfter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hideGridlines"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hideGridlines = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with columnCount = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "frozenRowCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with frozenRowCount = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rowCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with rowCount = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "frozenColumnCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with frozenColumnCount = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.GridProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SheetProperties =
struct
  type t = {
    sheetType : string;
    dataSourceSheetProperties : DataSourceSheetProperties.t;
    hidden : bool;
    tabColor : Color.t;
    rightToLeft : bool;
    tabColorStyle : ColorStyle.t;
    title : string;
    sheetId : int;
    index : int;
    gridProperties : GridProperties.t;
    
  }
  
  let sheetType = {
    GapiLens.get = (fun x -> x.sheetType);
    GapiLens.set = (fun v x -> { x with sheetType = v });
  }
  let dataSourceSheetProperties = {
    GapiLens.get = (fun x -> x.dataSourceSheetProperties);
    GapiLens.set = (fun v x -> { x with dataSourceSheetProperties = v });
  }
  let hidden = {
    GapiLens.get = (fun x -> x.hidden);
    GapiLens.set = (fun v x -> { x with hidden = v });
  }
  let tabColor = {
    GapiLens.get = (fun x -> x.tabColor);
    GapiLens.set = (fun v x -> { x with tabColor = v });
  }
  let rightToLeft = {
    GapiLens.get = (fun x -> x.rightToLeft);
    GapiLens.set = (fun v x -> { x with rightToLeft = v });
  }
  let tabColorStyle = {
    GapiLens.get = (fun x -> x.tabColorStyle);
    GapiLens.set = (fun v x -> { x with tabColorStyle = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
  }
  let gridProperties = {
    GapiLens.get = (fun x -> x.gridProperties);
    GapiLens.set = (fun v x -> { x with gridProperties = v });
  }
  
  let empty = {
    sheetType = "";
    dataSourceSheetProperties = DataSourceSheetProperties.empty;
    hidden = false;
    tabColor = Color.empty;
    rightToLeft = false;
    tabColorStyle = ColorStyle.empty;
    title = "";
    sheetId = 0;
    index = 0;
    gridProperties = GridProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "sheetType" x.sheetType;
      (fun v -> GapiJson.render_object "dataSourceSheetProperties" (DataSourceSheetProperties.render_content v)) x.dataSourceSheetProperties;
      GapiJson.render_bool_value "hidden" x.hidden;
      (fun v -> GapiJson.render_object "tabColor" (Color.render_content v)) x.tabColor;
      GapiJson.render_bool_value "rightToLeft" x.rightToLeft;
      (fun v -> GapiJson.render_object "tabColorStyle" (ColorStyle.render_content v)) x.tabColorStyle;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_int_value "index" x.index;
      (fun v -> GapiJson.render_object "gridProperties" (GridProperties.render_content v)) x.gridProperties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sheetType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceSheetProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceSheetProperties.parse
        DataSourceSheetProperties.empty
        (fun v -> { x with dataSourceSheetProperties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hidden"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hidden = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "tabColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with tabColor = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rightToLeft"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with rightToLeft = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "tabColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with tabColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "gridProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridProperties.parse
        GridProperties.empty
        (fun v -> { x with gridProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SheetProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddSheetResponse =
struct
  type t = {
    properties : SheetProperties.t;
    
  }
  
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  
  let empty = {
    properties = SheetProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "properties" (SheetProperties.render_content v)) x.properties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SheetProperties.parse
        SheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddSheetResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GridCoordinate =
struct
  type t = {
    columnIndex : int;
    rowIndex : int;
    sheetId : int;
    
  }
  
  let columnIndex = {
    GapiLens.get = (fun x -> x.columnIndex);
    GapiLens.set = (fun v x -> { x with columnIndex = v });
  }
  let rowIndex = {
    GapiLens.get = (fun x -> x.rowIndex);
    GapiLens.set = (fun v x -> { x with rowIndex = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  
  let empty = {
    columnIndex = 0;
    rowIndex = 0;
    sheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "columnIndex" x.columnIndex;
      GapiJson.render_int_value "rowIndex" x.rowIndex;
      GapiJson.render_int_value "sheetId" x.sheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with columnIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rowIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with rowIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.GridCoordinate.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module OverlayPosition =
struct
  type t = {
    offsetXPixels : int;
    offsetYPixels : int;
    anchorCell : GridCoordinate.t;
    heightPixels : int;
    widthPixels : int;
    
  }
  
  let offsetXPixels = {
    GapiLens.get = (fun x -> x.offsetXPixels);
    GapiLens.set = (fun v x -> { x with offsetXPixels = v });
  }
  let offsetYPixels = {
    GapiLens.get = (fun x -> x.offsetYPixels);
    GapiLens.set = (fun v x -> { x with offsetYPixels = v });
  }
  let anchorCell = {
    GapiLens.get = (fun x -> x.anchorCell);
    GapiLens.set = (fun v x -> { x with anchorCell = v });
  }
  let heightPixels = {
    GapiLens.get = (fun x -> x.heightPixels);
    GapiLens.set = (fun v x -> { x with heightPixels = v });
  }
  let widthPixels = {
    GapiLens.get = (fun x -> x.widthPixels);
    GapiLens.set = (fun v x -> { x with widthPixels = v });
  }
  
  let empty = {
    offsetXPixels = 0;
    offsetYPixels = 0;
    anchorCell = GridCoordinate.empty;
    heightPixels = 0;
    widthPixels = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "offsetXPixels" x.offsetXPixels;
      GapiJson.render_int_value "offsetYPixels" x.offsetYPixels;
      (fun v -> GapiJson.render_object "anchorCell" (GridCoordinate.render_content v)) x.anchorCell;
      GapiJson.render_int_value "heightPixels" x.heightPixels;
      GapiJson.render_int_value "widthPixels" x.widthPixels;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "offsetXPixels"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with offsetXPixels = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "offsetYPixels"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with offsetYPixels = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "anchorCell"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with anchorCell = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "heightPixels"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with heightPixels = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "widthPixels"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with widthPixels = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.OverlayPosition.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EmbeddedObjectPosition =
struct
  type t = {
    sheetId : int;
    overlayPosition : OverlayPosition.t;
    newSheet : bool;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let overlayPosition = {
    GapiLens.get = (fun x -> x.overlayPosition);
    GapiLens.set = (fun v x -> { x with overlayPosition = v });
  }
  let newSheet = {
    GapiLens.get = (fun x -> x.newSheet);
    GapiLens.set = (fun v x -> { x with newSheet = v });
  }
  
  let empty = {
    sheetId = 0;
    overlayPosition = OverlayPosition.empty;
    newSheet = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      (fun v -> GapiJson.render_object "overlayPosition" (OverlayPosition.render_content v)) x.overlayPosition;
      GapiJson.render_bool_value "newSheet" x.newSheet;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "overlayPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        OverlayPosition.parse
        OverlayPosition.empty
        (fun v -> { x with overlayPosition = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newSheet"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with newSheet = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.EmbeddedObjectPosition.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EmbeddedObjectBorder =
struct
  type t = {
    colorStyle : ColorStyle.t;
    color : Color.t;
    
  }
  
  let colorStyle = {
    GapiLens.get = (fun x -> x.colorStyle);
    GapiLens.set = (fun v x -> { x with colorStyle = v });
  }
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  
  let empty = {
    colorStyle = ColorStyle.empty;
    color = Color.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "colorStyle" (ColorStyle.render_content v)) x.colorStyle;
      (fun v -> GapiJson.render_object "color" (Color.render_content v)) x.color;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with colorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.EmbeddedObjectBorder.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceChartProperties =
struct
  type t = {
    dataExecutionStatus : DataExecutionStatus.t;
    dataSourceId : string;
    
  }
  
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  
  let empty = {
    dataExecutionStatus = DataExecutionStatus.empty;
    dataSourceId = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceChartProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartDateTimeRule =
struct
  type t = {
    _type : string;
    
  }
  
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartDateTimeRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartHistogramRule =
struct
  type t = {
    intervalSize : float;
    maxValue : float;
    minValue : float;
    
  }
  
  let intervalSize = {
    GapiLens.get = (fun x -> x.intervalSize);
    GapiLens.set = (fun v x -> { x with intervalSize = v });
  }
  let maxValue = {
    GapiLens.get = (fun x -> x.maxValue);
    GapiLens.set = (fun v x -> { x with maxValue = v });
  }
  let minValue = {
    GapiLens.get = (fun x -> x.minValue);
    GapiLens.set = (fun v x -> { x with minValue = v });
  }
  
  let empty = {
    intervalSize = 0.0;
    maxValue = 0.0;
    minValue = 0.0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_float_value "intervalSize" x.intervalSize;
      GapiJson.render_float_value "maxValue" x.maxValue;
      GapiJson.render_float_value "minValue" x.minValue;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "intervalSize"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with intervalSize = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "intervalSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with intervalSize = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxValue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with maxValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxValue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with maxValue = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minValue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with minValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minValue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with minValue = float_of_int v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartHistogramRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartGroupRule =
struct
  type t = {
    dateTimeRule : ChartDateTimeRule.t;
    histogramRule : ChartHistogramRule.t;
    
  }
  
  let dateTimeRule = {
    GapiLens.get = (fun x -> x.dateTimeRule);
    GapiLens.set = (fun v x -> { x with dateTimeRule = v });
  }
  let histogramRule = {
    GapiLens.get = (fun x -> x.histogramRule);
    GapiLens.set = (fun v x -> { x with histogramRule = v });
  }
  
  let empty = {
    dateTimeRule = ChartDateTimeRule.empty;
    histogramRule = ChartHistogramRule.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dateTimeRule" (ChartDateTimeRule.render_content v)) x.dateTimeRule;
      (fun v -> GapiJson.render_object "histogramRule" (ChartHistogramRule.render_content v)) x.histogramRule;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dateTimeRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartDateTimeRule.parse
        ChartDateTimeRule.empty
        (fun v -> { x with dateTimeRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "histogramRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartHistogramRule.parse
        ChartHistogramRule.empty
        (fun v -> { x with histogramRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartGroupRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartSourceRange =
struct
  type t = {
    sources : GridRange.t list;
    
  }
  
  let sources = {
    GapiLens.get = (fun x -> x.sources);
    GapiLens.set = (fun v x -> { x with sources = v });
  }
  
  let empty = {
    sources = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "sources" GridRange.render x.sources;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sources"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              GridRange.parse
              GridRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ChartSourceRange.parse.parse_collection" e x')
        GridRange.empty
        (fun v -> { x with sources = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartSourceRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartData =
struct
  type t = {
    groupRule : ChartGroupRule.t;
    columnReference : DataSourceColumnReference.t;
    aggregateType : string;
    sourceRange : ChartSourceRange.t;
    
  }
  
  let groupRule = {
    GapiLens.get = (fun x -> x.groupRule);
    GapiLens.set = (fun v x -> { x with groupRule = v });
  }
  let columnReference = {
    GapiLens.get = (fun x -> x.columnReference);
    GapiLens.set = (fun v x -> { x with columnReference = v });
  }
  let aggregateType = {
    GapiLens.get = (fun x -> x.aggregateType);
    GapiLens.set = (fun v x -> { x with aggregateType = v });
  }
  let sourceRange = {
    GapiLens.get = (fun x -> x.sourceRange);
    GapiLens.set = (fun v x -> { x with sourceRange = v });
  }
  
  let empty = {
    groupRule = ChartGroupRule.empty;
    columnReference = DataSourceColumnReference.empty;
    aggregateType = "";
    sourceRange = ChartSourceRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "groupRule" (ChartGroupRule.render_content v)) x.groupRule;
      (fun v -> GapiJson.render_object "columnReference" (DataSourceColumnReference.render_content v)) x.columnReference;
      GapiJson.render_string_value "aggregateType" x.aggregateType;
      (fun v -> GapiJson.render_object "sourceRange" (ChartSourceRange.render_content v)) x.sourceRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groupRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartGroupRule.parse
        ChartGroupRule.empty
        (fun v -> { x with groupRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with columnReference = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "aggregateType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with aggregateType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sourceRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartSourceRange.parse
        ChartSourceRange.empty
        (fun v -> { x with sourceRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Link =
struct
  type t = {
    uri : string;
    
  }
  
  let uri = {
    GapiLens.get = (fun x -> x.uri);
    GapiLens.set = (fun v x -> { x with uri = v });
  }
  
  let empty = {
    uri = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "uri" x.uri;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "uri"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with uri = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Link.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TextFormat =
struct
  type t = {
    bold : bool;
    foregroundColor : Color.t;
    underline : bool;
    strikethrough : bool;
    fontSize : int;
    fontFamily : string;
    italic : bool;
    link : Link.t;
    foregroundColorStyle : ColorStyle.t;
    
  }
  
  let bold = {
    GapiLens.get = (fun x -> x.bold);
    GapiLens.set = (fun v x -> { x with bold = v });
  }
  let foregroundColor = {
    GapiLens.get = (fun x -> x.foregroundColor);
    GapiLens.set = (fun v x -> { x with foregroundColor = v });
  }
  let underline = {
    GapiLens.get = (fun x -> x.underline);
    GapiLens.set = (fun v x -> { x with underline = v });
  }
  let strikethrough = {
    GapiLens.get = (fun x -> x.strikethrough);
    GapiLens.set = (fun v x -> { x with strikethrough = v });
  }
  let fontSize = {
    GapiLens.get = (fun x -> x.fontSize);
    GapiLens.set = (fun v x -> { x with fontSize = v });
  }
  let fontFamily = {
    GapiLens.get = (fun x -> x.fontFamily);
    GapiLens.set = (fun v x -> { x with fontFamily = v });
  }
  let italic = {
    GapiLens.get = (fun x -> x.italic);
    GapiLens.set = (fun v x -> { x with italic = v });
  }
  let link = {
    GapiLens.get = (fun x -> x.link);
    GapiLens.set = (fun v x -> { x with link = v });
  }
  let foregroundColorStyle = {
    GapiLens.get = (fun x -> x.foregroundColorStyle);
    GapiLens.set = (fun v x -> { x with foregroundColorStyle = v });
  }
  
  let empty = {
    bold = false;
    foregroundColor = Color.empty;
    underline = false;
    strikethrough = false;
    fontSize = 0;
    fontFamily = "";
    italic = false;
    link = Link.empty;
    foregroundColorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "bold" x.bold;
      (fun v -> GapiJson.render_object "foregroundColor" (Color.render_content v)) x.foregroundColor;
      GapiJson.render_bool_value "underline" x.underline;
      GapiJson.render_bool_value "strikethrough" x.strikethrough;
      GapiJson.render_int_value "fontSize" x.fontSize;
      GapiJson.render_string_value "fontFamily" x.fontFamily;
      GapiJson.render_bool_value "italic" x.italic;
      (fun v -> GapiJson.render_object "link" (Link.render_content v)) x.link;
      (fun v -> GapiJson.render_object "foregroundColorStyle" (ColorStyle.render_content v)) x.foregroundColorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bold"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with bold = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "foregroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with foregroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "underline"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with underline = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "strikethrough"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with strikethrough = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fontSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with fontSize = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fontFamily"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fontFamily = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "italic"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with italic = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "link"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Link.parse
        Link.empty
        (fun v -> { x with link = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "foregroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with foregroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TextFormat.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataLabel =
struct
  type t = {
    _type : string;
    textFormat : TextFormat.t;
    customLabelData : ChartData.t;
    placement : string;
    
  }
  
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let textFormat = {
    GapiLens.get = (fun x -> x.textFormat);
    GapiLens.set = (fun v x -> { x with textFormat = v });
  }
  let customLabelData = {
    GapiLens.get = (fun x -> x.customLabelData);
    GapiLens.set = (fun v x -> { x with customLabelData = v });
  }
  let placement = {
    GapiLens.get = (fun x -> x.placement);
    GapiLens.set = (fun v x -> { x with placement = v });
  }
  
  let empty = {
    _type = "";
    textFormat = TextFormat.empty;
    customLabelData = ChartData.empty;
    placement = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "type" x._type;
      (fun v -> GapiJson.render_object "textFormat" (TextFormat.render_content v)) x.textFormat;
      (fun v -> GapiJson.render_object "customLabelData" (ChartData.render_content v)) x.customLabelData;
      GapiJson.render_string_value "placement" x.placement;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with textFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "customLabelData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with customLabelData = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "placement"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with placement = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataLabel.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WaterfallChartDomain =
struct
  type t = {
    data : ChartData.t;
    reversed : bool;
    
  }
  
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let reversed = {
    GapiLens.get = (fun x -> x.reversed);
    GapiLens.set = (fun v x -> { x with reversed = v });
  }
  
  let empty = {
    data = ChartData.empty;
    reversed = false;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "data" (ChartData.render_content v)) x.data;
      GapiJson.render_bool_value "reversed" x.reversed;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "reversed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with reversed = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartDomain.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WaterfallChartColumnStyle =
struct
  type t = {
    label : string;
    color : Color.t;
    colorStyle : ColorStyle.t;
    
  }
  
  let label = {
    GapiLens.get = (fun x -> x.label);
    GapiLens.set = (fun v x -> { x with label = v });
  }
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  let colorStyle = {
    GapiLens.get = (fun x -> x.colorStyle);
    GapiLens.set = (fun v x -> { x with colorStyle = v });
  }
  
  let empty = {
    label = "";
    color = Color.empty;
    colorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "label" x.label;
      (fun v -> GapiJson.render_object "color" (Color.render_content v)) x.color;
      (fun v -> GapiJson.render_object "colorStyle" (ColorStyle.render_content v)) x.colorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with label = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with colorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartColumnStyle.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WaterfallChartCustomSubtotal =
struct
  type t = {
    dataIsSubtotal : bool;
    label : string;
    subtotalIndex : int;
    
  }
  
  let dataIsSubtotal = {
    GapiLens.get = (fun x -> x.dataIsSubtotal);
    GapiLens.set = (fun v x -> { x with dataIsSubtotal = v });
  }
  let label = {
    GapiLens.get = (fun x -> x.label);
    GapiLens.set = (fun v x -> { x with label = v });
  }
  let subtotalIndex = {
    GapiLens.get = (fun x -> x.subtotalIndex);
    GapiLens.set = (fun v x -> { x with subtotalIndex = v });
  }
  
  let empty = {
    dataIsSubtotal = false;
    label = "";
    subtotalIndex = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "dataIsSubtotal" x.dataIsSubtotal;
      GapiJson.render_string_value "label" x.label;
      GapiJson.render_int_value "subtotalIndex" x.subtotalIndex;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataIsSubtotal"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with dataIsSubtotal = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with label = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "subtotalIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with subtotalIndex = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartCustomSubtotal.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WaterfallChartSeries =
struct
  type t = {
    negativeColumnsStyle : WaterfallChartColumnStyle.t;
    dataLabel : DataLabel.t;
    hideTrailingSubtotal : bool;
    subtotalColumnsStyle : WaterfallChartColumnStyle.t;
    positiveColumnsStyle : WaterfallChartColumnStyle.t;
    data : ChartData.t;
    customSubtotals : WaterfallChartCustomSubtotal.t list;
    
  }
  
  let negativeColumnsStyle = {
    GapiLens.get = (fun x -> x.negativeColumnsStyle);
    GapiLens.set = (fun v x -> { x with negativeColumnsStyle = v });
  }
  let dataLabel = {
    GapiLens.get = (fun x -> x.dataLabel);
    GapiLens.set = (fun v x -> { x with dataLabel = v });
  }
  let hideTrailingSubtotal = {
    GapiLens.get = (fun x -> x.hideTrailingSubtotal);
    GapiLens.set = (fun v x -> { x with hideTrailingSubtotal = v });
  }
  let subtotalColumnsStyle = {
    GapiLens.get = (fun x -> x.subtotalColumnsStyle);
    GapiLens.set = (fun v x -> { x with subtotalColumnsStyle = v });
  }
  let positiveColumnsStyle = {
    GapiLens.get = (fun x -> x.positiveColumnsStyle);
    GapiLens.set = (fun v x -> { x with positiveColumnsStyle = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let customSubtotals = {
    GapiLens.get = (fun x -> x.customSubtotals);
    GapiLens.set = (fun v x -> { x with customSubtotals = v });
  }
  
  let empty = {
    negativeColumnsStyle = WaterfallChartColumnStyle.empty;
    dataLabel = DataLabel.empty;
    hideTrailingSubtotal = false;
    subtotalColumnsStyle = WaterfallChartColumnStyle.empty;
    positiveColumnsStyle = WaterfallChartColumnStyle.empty;
    data = ChartData.empty;
    customSubtotals = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "negativeColumnsStyle" (WaterfallChartColumnStyle.render_content v)) x.negativeColumnsStyle;
      (fun v -> GapiJson.render_object "dataLabel" (DataLabel.render_content v)) x.dataLabel;
      GapiJson.render_bool_value "hideTrailingSubtotal" x.hideTrailingSubtotal;
      (fun v -> GapiJson.render_object "subtotalColumnsStyle" (WaterfallChartColumnStyle.render_content v)) x.subtotalColumnsStyle;
      (fun v -> GapiJson.render_object "positiveColumnsStyle" (WaterfallChartColumnStyle.render_content v)) x.positiveColumnsStyle;
      (fun v -> GapiJson.render_object "data" (ChartData.render_content v)) x.data;
      GapiJson.render_array "customSubtotals" WaterfallChartCustomSubtotal.render x.customSubtotals;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "negativeColumnsStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        WaterfallChartColumnStyle.parse
        WaterfallChartColumnStyle.empty
        (fun v -> { x with negativeColumnsStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataLabel"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataLabel.parse
        DataLabel.empty
        (fun v -> { x with dataLabel = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hideTrailingSubtotal"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hideTrailingSubtotal = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "subtotalColumnsStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        WaterfallChartColumnStyle.parse
        WaterfallChartColumnStyle.empty
        (fun v -> { x with subtotalColumnsStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "positiveColumnsStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        WaterfallChartColumnStyle.parse
        WaterfallChartColumnStyle.empty
        (fun v -> { x with positiveColumnsStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "customSubtotals"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              WaterfallChartCustomSubtotal.parse
              WaterfallChartCustomSubtotal.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartSeries.parse.parse_collection" e x')
        WaterfallChartCustomSubtotal.empty
        (fun v -> { x with customSubtotals = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartSeries.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WaterfallChartSpec =
struct
  type t = {
    connectorLineStyle : LineStyle.t;
    totalDataLabel : DataLabel.t;
    domain : WaterfallChartDomain.t;
    firstValueIsTotal : bool;
    stackedType : string;
    hideConnectorLines : bool;
    series : WaterfallChartSeries.t list;
    
  }
  
  let connectorLineStyle = {
    GapiLens.get = (fun x -> x.connectorLineStyle);
    GapiLens.set = (fun v x -> { x with connectorLineStyle = v });
  }
  let totalDataLabel = {
    GapiLens.get = (fun x -> x.totalDataLabel);
    GapiLens.set = (fun v x -> { x with totalDataLabel = v });
  }
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  let firstValueIsTotal = {
    GapiLens.get = (fun x -> x.firstValueIsTotal);
    GapiLens.set = (fun v x -> { x with firstValueIsTotal = v });
  }
  let stackedType = {
    GapiLens.get = (fun x -> x.stackedType);
    GapiLens.set = (fun v x -> { x with stackedType = v });
  }
  let hideConnectorLines = {
    GapiLens.get = (fun x -> x.hideConnectorLines);
    GapiLens.set = (fun v x -> { x with hideConnectorLines = v });
  }
  let series = {
    GapiLens.get = (fun x -> x.series);
    GapiLens.set = (fun v x -> { x with series = v });
  }
  
  let empty = {
    connectorLineStyle = LineStyle.empty;
    totalDataLabel = DataLabel.empty;
    domain = WaterfallChartDomain.empty;
    firstValueIsTotal = false;
    stackedType = "";
    hideConnectorLines = false;
    series = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "connectorLineStyle" (LineStyle.render_content v)) x.connectorLineStyle;
      (fun v -> GapiJson.render_object "totalDataLabel" (DataLabel.render_content v)) x.totalDataLabel;
      (fun v -> GapiJson.render_object "domain" (WaterfallChartDomain.render_content v)) x.domain;
      GapiJson.render_bool_value "firstValueIsTotal" x.firstValueIsTotal;
      GapiJson.render_string_value "stackedType" x.stackedType;
      GapiJson.render_bool_value "hideConnectorLines" x.hideConnectorLines;
      GapiJson.render_array "series" WaterfallChartSeries.render x.series;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "connectorLineStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        LineStyle.parse
        LineStyle.empty
        (fun v -> { x with connectorLineStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "totalDataLabel"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataLabel.parse
        DataLabel.empty
        (fun v -> { x with totalDataLabel = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "domain"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        WaterfallChartDomain.parse
        WaterfallChartDomain.empty
        (fun v -> { x with domain = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "firstValueIsTotal"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with firstValueIsTotal = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "stackedType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with stackedType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hideConnectorLines"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hideConnectorLines = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "series"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              WaterfallChartSeries.parse
              WaterfallChartSeries.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartSpec.parse.parse_collection" e x')
        WaterfallChartSeries.empty
        (fun v -> { x with series = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.WaterfallChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TextPosition =
struct
  type t = {
    horizontalAlignment : string;
    
  }
  
  let horizontalAlignment = {
    GapiLens.get = (fun x -> x.horizontalAlignment);
    GapiLens.set = (fun v x -> { x with horizontalAlignment = v });
  }
  
  let empty = {
    horizontalAlignment = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "horizontalAlignment" x.horizontalAlignment;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "horizontalAlignment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with horizontalAlignment = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TextPosition.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartAxisViewWindowOptions =
struct
  type t = {
    viewWindowMax : float;
    viewWindowMin : float;
    viewWindowMode : string;
    
  }
  
  let viewWindowMax = {
    GapiLens.get = (fun x -> x.viewWindowMax);
    GapiLens.set = (fun v x -> { x with viewWindowMax = v });
  }
  let viewWindowMin = {
    GapiLens.get = (fun x -> x.viewWindowMin);
    GapiLens.set = (fun v x -> { x with viewWindowMin = v });
  }
  let viewWindowMode = {
    GapiLens.get = (fun x -> x.viewWindowMode);
    GapiLens.set = (fun v x -> { x with viewWindowMode = v });
  }
  
  let empty = {
    viewWindowMax = 0.0;
    viewWindowMin = 0.0;
    viewWindowMode = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_float_value "viewWindowMax" x.viewWindowMax;
      GapiJson.render_float_value "viewWindowMin" x.viewWindowMin;
      GapiJson.render_string_value "viewWindowMode" x.viewWindowMode;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewWindowMax"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with viewWindowMax = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewWindowMax"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with viewWindowMax = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewWindowMin"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with viewWindowMin = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewWindowMin"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with viewWindowMin = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewWindowMode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with viewWindowMode = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartAxisViewWindowOptions.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BasicChartAxis =
struct
  type t = {
    titleTextPosition : TextPosition.t;
    position : string;
    format : TextFormat.t;
    title : string;
    viewWindowOptions : ChartAxisViewWindowOptions.t;
    
  }
  
  let titleTextPosition = {
    GapiLens.get = (fun x -> x.titleTextPosition);
    GapiLens.set = (fun v x -> { x with titleTextPosition = v });
  }
  let position = {
    GapiLens.get = (fun x -> x.position);
    GapiLens.set = (fun v x -> { x with position = v });
  }
  let format = {
    GapiLens.get = (fun x -> x.format);
    GapiLens.set = (fun v x -> { x with format = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let viewWindowOptions = {
    GapiLens.get = (fun x -> x.viewWindowOptions);
    GapiLens.set = (fun v x -> { x with viewWindowOptions = v });
  }
  
  let empty = {
    titleTextPosition = TextPosition.empty;
    position = "";
    format = TextFormat.empty;
    title = "";
    viewWindowOptions = ChartAxisViewWindowOptions.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "titleTextPosition" (TextPosition.render_content v)) x.titleTextPosition;
      GapiJson.render_string_value "position" x.position;
      (fun v -> GapiJson.render_object "format" (TextFormat.render_content v)) x.format;
      GapiJson.render_string_value "title" x.title;
      (fun v -> GapiJson.render_object "viewWindowOptions" (ChartAxisViewWindowOptions.render_content v)) x.viewWindowOptions;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "titleTextPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextPosition.parse
        TextPosition.empty
        (fun v -> { x with titleTextPosition = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "position"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with position = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "format"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with format = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "viewWindowOptions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartAxisViewWindowOptions.parse
        ChartAxisViewWindowOptions.empty
        (fun v -> { x with viewWindowOptions = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BasicChartAxis.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BasicChartDomain =
struct
  type t = {
    reversed : bool;
    domain : ChartData.t;
    
  }
  
  let reversed = {
    GapiLens.get = (fun x -> x.reversed);
    GapiLens.set = (fun v x -> { x with reversed = v });
  }
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  
  let empty = {
    reversed = false;
    domain = ChartData.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "reversed" x.reversed;
      (fun v -> GapiJson.render_object "domain" (ChartData.render_content v)) x.domain;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "reversed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with reversed = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "domain"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with domain = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BasicChartDomain.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PointStyle =
struct
  type t = {
    shape : string;
    size : float;
    
  }
  
  let shape = {
    GapiLens.get = (fun x -> x.shape);
    GapiLens.set = (fun v x -> { x with shape = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  
  let empty = {
    shape = "";
    size = 0.0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "shape" x.shape;
      GapiJson.render_float_value "size" x.size;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shape"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with shape = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with size = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with size = float_of_int v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PointStyle.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BasicSeriesDataPointStyleOverride =
struct
  type t = {
    colorStyle : ColorStyle.t;
    pointStyle : PointStyle.t;
    color : Color.t;
    index : int;
    
  }
  
  let colorStyle = {
    GapiLens.get = (fun x -> x.colorStyle);
    GapiLens.set = (fun v x -> { x with colorStyle = v });
  }
  let pointStyle = {
    GapiLens.get = (fun x -> x.pointStyle);
    GapiLens.set = (fun v x -> { x with pointStyle = v });
  }
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
  }
  
  let empty = {
    colorStyle = ColorStyle.empty;
    pointStyle = PointStyle.empty;
    color = Color.empty;
    index = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "colorStyle" (ColorStyle.render_content v)) x.colorStyle;
      (fun v -> GapiJson.render_object "pointStyle" (PointStyle.render_content v)) x.pointStyle;
      (fun v -> GapiJson.render_object "color" (Color.render_content v)) x.color;
      GapiJson.render_int_value "index" x.index;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with colorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pointStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PointStyle.parse
        PointStyle.empty
        (fun v -> { x with pointStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BasicSeriesDataPointStyleOverride.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BasicChartSeries =
struct
  type t = {
    dataLabel : DataLabel.t;
    styleOverrides : BasicSeriesDataPointStyleOverride.t list;
    pointStyle : PointStyle.t;
    _type : string;
    color : Color.t;
    colorStyle : ColorStyle.t;
    series : ChartData.t;
    lineStyle : LineStyle.t;
    targetAxis : string;
    
  }
  
  let dataLabel = {
    GapiLens.get = (fun x -> x.dataLabel);
    GapiLens.set = (fun v x -> { x with dataLabel = v });
  }
  let styleOverrides = {
    GapiLens.get = (fun x -> x.styleOverrides);
    GapiLens.set = (fun v x -> { x with styleOverrides = v });
  }
  let pointStyle = {
    GapiLens.get = (fun x -> x.pointStyle);
    GapiLens.set = (fun v x -> { x with pointStyle = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  let colorStyle = {
    GapiLens.get = (fun x -> x.colorStyle);
    GapiLens.set = (fun v x -> { x with colorStyle = v });
  }
  let series = {
    GapiLens.get = (fun x -> x.series);
    GapiLens.set = (fun v x -> { x with series = v });
  }
  let lineStyle = {
    GapiLens.get = (fun x -> x.lineStyle);
    GapiLens.set = (fun v x -> { x with lineStyle = v });
  }
  let targetAxis = {
    GapiLens.get = (fun x -> x.targetAxis);
    GapiLens.set = (fun v x -> { x with targetAxis = v });
  }
  
  let empty = {
    dataLabel = DataLabel.empty;
    styleOverrides = [];
    pointStyle = PointStyle.empty;
    _type = "";
    color = Color.empty;
    colorStyle = ColorStyle.empty;
    series = ChartData.empty;
    lineStyle = LineStyle.empty;
    targetAxis = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataLabel" (DataLabel.render_content v)) x.dataLabel;
      GapiJson.render_array "styleOverrides" BasicSeriesDataPointStyleOverride.render x.styleOverrides;
      (fun v -> GapiJson.render_object "pointStyle" (PointStyle.render_content v)) x.pointStyle;
      GapiJson.render_string_value "type" x._type;
      (fun v -> GapiJson.render_object "color" (Color.render_content v)) x.color;
      (fun v -> GapiJson.render_object "colorStyle" (ColorStyle.render_content v)) x.colorStyle;
      (fun v -> GapiJson.render_object "series" (ChartData.render_content v)) x.series;
      (fun v -> GapiJson.render_object "lineStyle" (LineStyle.render_content v)) x.lineStyle;
      GapiJson.render_string_value "targetAxis" x.targetAxis;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataLabel"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataLabel.parse
        DataLabel.empty
        (fun v -> { x with dataLabel = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "styleOverrides"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              BasicSeriesDataPointStyleOverride.parse
              BasicSeriesDataPointStyleOverride.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicChartSeries.parse.parse_collection" e x')
        BasicSeriesDataPointStyleOverride.empty
        (fun v -> { x with styleOverrides = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pointStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PointStyle.parse
        PointStyle.empty
        (fun v -> { x with pointStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with colorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "series"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with series = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lineStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        LineStyle.parse
        LineStyle.empty
        (fun v -> { x with lineStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "targetAxis"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with targetAxis = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BasicChartSeries.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BasicChartSpec =
struct
  type t = {
    legendPosition : string;
    stackedType : string;
    domains : BasicChartDomain.t list;
    threeDimensional : bool;
    interpolateNulls : bool;
    headerCount : int;
    totalDataLabel : DataLabel.t;
    lineSmoothing : bool;
    compareMode : string;
    series : BasicChartSeries.t list;
    axis : BasicChartAxis.t list;
    chartType : string;
    
  }
  
  let legendPosition = {
    GapiLens.get = (fun x -> x.legendPosition);
    GapiLens.set = (fun v x -> { x with legendPosition = v });
  }
  let stackedType = {
    GapiLens.get = (fun x -> x.stackedType);
    GapiLens.set = (fun v x -> { x with stackedType = v });
  }
  let domains = {
    GapiLens.get = (fun x -> x.domains);
    GapiLens.set = (fun v x -> { x with domains = v });
  }
  let threeDimensional = {
    GapiLens.get = (fun x -> x.threeDimensional);
    GapiLens.set = (fun v x -> { x with threeDimensional = v });
  }
  let interpolateNulls = {
    GapiLens.get = (fun x -> x.interpolateNulls);
    GapiLens.set = (fun v x -> { x with interpolateNulls = v });
  }
  let headerCount = {
    GapiLens.get = (fun x -> x.headerCount);
    GapiLens.set = (fun v x -> { x with headerCount = v });
  }
  let totalDataLabel = {
    GapiLens.get = (fun x -> x.totalDataLabel);
    GapiLens.set = (fun v x -> { x with totalDataLabel = v });
  }
  let lineSmoothing = {
    GapiLens.get = (fun x -> x.lineSmoothing);
    GapiLens.set = (fun v x -> { x with lineSmoothing = v });
  }
  let compareMode = {
    GapiLens.get = (fun x -> x.compareMode);
    GapiLens.set = (fun v x -> { x with compareMode = v });
  }
  let series = {
    GapiLens.get = (fun x -> x.series);
    GapiLens.set = (fun v x -> { x with series = v });
  }
  let axis = {
    GapiLens.get = (fun x -> x.axis);
    GapiLens.set = (fun v x -> { x with axis = v });
  }
  let chartType = {
    GapiLens.get = (fun x -> x.chartType);
    GapiLens.set = (fun v x -> { x with chartType = v });
  }
  
  let empty = {
    legendPosition = "";
    stackedType = "";
    domains = [];
    threeDimensional = false;
    interpolateNulls = false;
    headerCount = 0;
    totalDataLabel = DataLabel.empty;
    lineSmoothing = false;
    compareMode = "";
    series = [];
    axis = [];
    chartType = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "legendPosition" x.legendPosition;
      GapiJson.render_string_value "stackedType" x.stackedType;
      GapiJson.render_array "domains" BasicChartDomain.render x.domains;
      GapiJson.render_bool_value "threeDimensional" x.threeDimensional;
      GapiJson.render_bool_value "interpolateNulls" x.interpolateNulls;
      GapiJson.render_int_value "headerCount" x.headerCount;
      (fun v -> GapiJson.render_object "totalDataLabel" (DataLabel.render_content v)) x.totalDataLabel;
      GapiJson.render_bool_value "lineSmoothing" x.lineSmoothing;
      GapiJson.render_string_value "compareMode" x.compareMode;
      GapiJson.render_array "series" BasicChartSeries.render x.series;
      GapiJson.render_array "axis" BasicChartAxis.render x.axis;
      GapiJson.render_string_value "chartType" x.chartType;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "legendPosition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with legendPosition = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "stackedType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with stackedType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "domains"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              BasicChartDomain.parse
              BasicChartDomain.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicChartSpec.parse.parse_collection" e x')
        BasicChartDomain.empty
        (fun v -> { x with domains = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "threeDimensional"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with threeDimensional = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "interpolateNulls"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with interpolateNulls = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "headerCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with headerCount = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "totalDataLabel"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataLabel.parse
        DataLabel.empty
        (fun v -> { x with totalDataLabel = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "lineSmoothing"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with lineSmoothing = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "compareMode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with compareMode = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "series"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              BasicChartSeries.parse
              BasicChartSeries.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicChartSpec.parse.parse_collection" e x')
        BasicChartSeries.empty
        (fun v -> { x with series = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "axis"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              BasicChartAxis.parse
              BasicChartAxis.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicChartSpec.parse.parse_collection" e x')
        BasicChartAxis.empty
        (fun v -> { x with axis = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "chartType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with chartType = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BasicChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module OrgChartSpec =
struct
  type t = {
    selectedNodeColor : Color.t;
    nodeColor : Color.t;
    nodeColorStyle : ColorStyle.t;
    parentLabels : ChartData.t;
    nodeSize : string;
    tooltips : ChartData.t;
    labels : ChartData.t;
    selectedNodeColorStyle : ColorStyle.t;
    
  }
  
  let selectedNodeColor = {
    GapiLens.get = (fun x -> x.selectedNodeColor);
    GapiLens.set = (fun v x -> { x with selectedNodeColor = v });
  }
  let nodeColor = {
    GapiLens.get = (fun x -> x.nodeColor);
    GapiLens.set = (fun v x -> { x with nodeColor = v });
  }
  let nodeColorStyle = {
    GapiLens.get = (fun x -> x.nodeColorStyle);
    GapiLens.set = (fun v x -> { x with nodeColorStyle = v });
  }
  let parentLabels = {
    GapiLens.get = (fun x -> x.parentLabels);
    GapiLens.set = (fun v x -> { x with parentLabels = v });
  }
  let nodeSize = {
    GapiLens.get = (fun x -> x.nodeSize);
    GapiLens.set = (fun v x -> { x with nodeSize = v });
  }
  let tooltips = {
    GapiLens.get = (fun x -> x.tooltips);
    GapiLens.set = (fun v x -> { x with tooltips = v });
  }
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let selectedNodeColorStyle = {
    GapiLens.get = (fun x -> x.selectedNodeColorStyle);
    GapiLens.set = (fun v x -> { x with selectedNodeColorStyle = v });
  }
  
  let empty = {
    selectedNodeColor = Color.empty;
    nodeColor = Color.empty;
    nodeColorStyle = ColorStyle.empty;
    parentLabels = ChartData.empty;
    nodeSize = "";
    tooltips = ChartData.empty;
    labels = ChartData.empty;
    selectedNodeColorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "selectedNodeColor" (Color.render_content v)) x.selectedNodeColor;
      (fun v -> GapiJson.render_object "nodeColor" (Color.render_content v)) x.nodeColor;
      (fun v -> GapiJson.render_object "nodeColorStyle" (ColorStyle.render_content v)) x.nodeColorStyle;
      (fun v -> GapiJson.render_object "parentLabels" (ChartData.render_content v)) x.parentLabels;
      GapiJson.render_string_value "nodeSize" x.nodeSize;
      (fun v -> GapiJson.render_object "tooltips" (ChartData.render_content v)) x.tooltips;
      (fun v -> GapiJson.render_object "labels" (ChartData.render_content v)) x.labels;
      (fun v -> GapiJson.render_object "selectedNodeColorStyle" (ColorStyle.render_content v)) x.selectedNodeColorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "selectedNodeColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with selectedNodeColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "nodeColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with nodeColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "nodeColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with nodeColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parentLabels"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with parentLabels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nodeSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nodeSize = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "tooltips"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with tooltips = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "selectedNodeColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with selectedNodeColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.OrgChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FilterCriteria =
struct
  type t = {
    visibleForegroundColorStyle : ColorStyle.t;
    hiddenValues : string list;
    visibleBackgroundColor : Color.t;
    condition : BooleanCondition.t;
    visibleForegroundColor : Color.t;
    visibleBackgroundColorStyle : ColorStyle.t;
    
  }
  
  let visibleForegroundColorStyle = {
    GapiLens.get = (fun x -> x.visibleForegroundColorStyle);
    GapiLens.set = (fun v x -> { x with visibleForegroundColorStyle = v });
  }
  let hiddenValues = {
    GapiLens.get = (fun x -> x.hiddenValues);
    GapiLens.set = (fun v x -> { x with hiddenValues = v });
  }
  let visibleBackgroundColor = {
    GapiLens.get = (fun x -> x.visibleBackgroundColor);
    GapiLens.set = (fun v x -> { x with visibleBackgroundColor = v });
  }
  let condition = {
    GapiLens.get = (fun x -> x.condition);
    GapiLens.set = (fun v x -> { x with condition = v });
  }
  let visibleForegroundColor = {
    GapiLens.get = (fun x -> x.visibleForegroundColor);
    GapiLens.set = (fun v x -> { x with visibleForegroundColor = v });
  }
  let visibleBackgroundColorStyle = {
    GapiLens.get = (fun x -> x.visibleBackgroundColorStyle);
    GapiLens.set = (fun v x -> { x with visibleBackgroundColorStyle = v });
  }
  
  let empty = {
    visibleForegroundColorStyle = ColorStyle.empty;
    hiddenValues = [];
    visibleBackgroundColor = Color.empty;
    condition = BooleanCondition.empty;
    visibleForegroundColor = Color.empty;
    visibleBackgroundColorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "visibleForegroundColorStyle" (ColorStyle.render_content v)) x.visibleForegroundColorStyle;
      GapiJson.render_array "hiddenValues" (GapiJson.render_string_value "") x.hiddenValues;
      (fun v -> GapiJson.render_object "visibleBackgroundColor" (Color.render_content v)) x.visibleBackgroundColor;
      (fun v -> GapiJson.render_object "condition" (BooleanCondition.render_content v)) x.condition;
      (fun v -> GapiJson.render_object "visibleForegroundColor" (Color.render_content v)) x.visibleForegroundColor;
      (fun v -> GapiJson.render_object "visibleBackgroundColorStyle" (ColorStyle.render_content v)) x.visibleBackgroundColorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visibleForegroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with visibleForegroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "hiddenValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.FilterCriteria.parse.parse_collection" e x')
        ""
        (fun v -> { x with hiddenValues = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visibleBackgroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with visibleBackgroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "condition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BooleanCondition.parse
        BooleanCondition.empty
        (fun v -> { x with condition = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visibleForegroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with visibleForegroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "visibleBackgroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with visibleBackgroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.FilterCriteria.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FilterSpec =
struct
  type t = {
    columnIndex : int;
    dataSourceColumnReference : DataSourceColumnReference.t;
    filterCriteria : FilterCriteria.t;
    
  }
  
  let columnIndex = {
    GapiLens.get = (fun x -> x.columnIndex);
    GapiLens.set = (fun v x -> { x with columnIndex = v });
  }
  let dataSourceColumnReference = {
    GapiLens.get = (fun x -> x.dataSourceColumnReference);
    GapiLens.set = (fun v x -> { x with dataSourceColumnReference = v });
  }
  let filterCriteria = {
    GapiLens.get = (fun x -> x.filterCriteria);
    GapiLens.set = (fun v x -> { x with filterCriteria = v });
  }
  
  let empty = {
    columnIndex = 0;
    dataSourceColumnReference = DataSourceColumnReference.empty;
    filterCriteria = FilterCriteria.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "columnIndex" x.columnIndex;
      (fun v -> GapiJson.render_object "dataSourceColumnReference" (DataSourceColumnReference.render_content v)) x.dataSourceColumnReference;
      (fun v -> GapiJson.render_object "filterCriteria" (FilterCriteria.render_content v)) x.filterCriteria;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with columnIndex = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceColumnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with dataSourceColumnReference = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterCriteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterCriteria.parse
        FilterCriteria.empty
        (fun v -> { x with filterCriteria = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.FilterSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BubbleChartSpec =
struct
  type t = {
    bubbleSizes : ChartData.t;
    legendPosition : string;
    groupIds : ChartData.t;
    domain : ChartData.t;
    bubbleBorderColor : Color.t;
    bubbleBorderColorStyle : ColorStyle.t;
    bubbleLabels : ChartData.t;
    bubbleMinRadiusSize : int;
    series : ChartData.t;
    bubbleTextStyle : TextFormat.t;
    bubbleMaxRadiusSize : int;
    bubbleOpacity : float;
    
  }
  
  let bubbleSizes = {
    GapiLens.get = (fun x -> x.bubbleSizes);
    GapiLens.set = (fun v x -> { x with bubbleSizes = v });
  }
  let legendPosition = {
    GapiLens.get = (fun x -> x.legendPosition);
    GapiLens.set = (fun v x -> { x with legendPosition = v });
  }
  let groupIds = {
    GapiLens.get = (fun x -> x.groupIds);
    GapiLens.set = (fun v x -> { x with groupIds = v });
  }
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  let bubbleBorderColor = {
    GapiLens.get = (fun x -> x.bubbleBorderColor);
    GapiLens.set = (fun v x -> { x with bubbleBorderColor = v });
  }
  let bubbleBorderColorStyle = {
    GapiLens.get = (fun x -> x.bubbleBorderColorStyle);
    GapiLens.set = (fun v x -> { x with bubbleBorderColorStyle = v });
  }
  let bubbleLabels = {
    GapiLens.get = (fun x -> x.bubbleLabels);
    GapiLens.set = (fun v x -> { x with bubbleLabels = v });
  }
  let bubbleMinRadiusSize = {
    GapiLens.get = (fun x -> x.bubbleMinRadiusSize);
    GapiLens.set = (fun v x -> { x with bubbleMinRadiusSize = v });
  }
  let series = {
    GapiLens.get = (fun x -> x.series);
    GapiLens.set = (fun v x -> { x with series = v });
  }
  let bubbleTextStyle = {
    GapiLens.get = (fun x -> x.bubbleTextStyle);
    GapiLens.set = (fun v x -> { x with bubbleTextStyle = v });
  }
  let bubbleMaxRadiusSize = {
    GapiLens.get = (fun x -> x.bubbleMaxRadiusSize);
    GapiLens.set = (fun v x -> { x with bubbleMaxRadiusSize = v });
  }
  let bubbleOpacity = {
    GapiLens.get = (fun x -> x.bubbleOpacity);
    GapiLens.set = (fun v x -> { x with bubbleOpacity = v });
  }
  
  let empty = {
    bubbleSizes = ChartData.empty;
    legendPosition = "";
    groupIds = ChartData.empty;
    domain = ChartData.empty;
    bubbleBorderColor = Color.empty;
    bubbleBorderColorStyle = ColorStyle.empty;
    bubbleLabels = ChartData.empty;
    bubbleMinRadiusSize = 0;
    series = ChartData.empty;
    bubbleTextStyle = TextFormat.empty;
    bubbleMaxRadiusSize = 0;
    bubbleOpacity = 0.0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "bubbleSizes" (ChartData.render_content v)) x.bubbleSizes;
      GapiJson.render_string_value "legendPosition" x.legendPosition;
      (fun v -> GapiJson.render_object "groupIds" (ChartData.render_content v)) x.groupIds;
      (fun v -> GapiJson.render_object "domain" (ChartData.render_content v)) x.domain;
      (fun v -> GapiJson.render_object "bubbleBorderColor" (Color.render_content v)) x.bubbleBorderColor;
      (fun v -> GapiJson.render_object "bubbleBorderColorStyle" (ColorStyle.render_content v)) x.bubbleBorderColorStyle;
      (fun v -> GapiJson.render_object "bubbleLabels" (ChartData.render_content v)) x.bubbleLabels;
      GapiJson.render_int_value "bubbleMinRadiusSize" x.bubbleMinRadiusSize;
      (fun v -> GapiJson.render_object "series" (ChartData.render_content v)) x.series;
      (fun v -> GapiJson.render_object "bubbleTextStyle" (TextFormat.render_content v)) x.bubbleTextStyle;
      GapiJson.render_int_value "bubbleMaxRadiusSize" x.bubbleMaxRadiusSize;
      GapiJson.render_float_value "bubbleOpacity" x.bubbleOpacity;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bubbleSizes"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with bubbleSizes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "legendPosition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with legendPosition = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groupIds"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with groupIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "domain"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with domain = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bubbleBorderColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with bubbleBorderColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bubbleBorderColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with bubbleBorderColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bubbleLabels"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with bubbleLabels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bubbleMinRadiusSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bubbleMinRadiusSize = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "series"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with series = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bubbleTextStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with bubbleTextStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bubbleMaxRadiusSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bubbleMaxRadiusSize = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bubbleOpacity"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with bubbleOpacity = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bubbleOpacity"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bubbleOpacity = float_of_int v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BubbleChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CandlestickSeries =
struct
  type t = {
    data : ChartData.t;
    
  }
  
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  
  let empty = {
    data = ChartData.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "data" (ChartData.render_content v)) x.data;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CandlestickSeries.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CandlestickData =
struct
  type t = {
    highSeries : CandlestickSeries.t;
    lowSeries : CandlestickSeries.t;
    openSeries : CandlestickSeries.t;
    closeSeries : CandlestickSeries.t;
    
  }
  
  let highSeries = {
    GapiLens.get = (fun x -> x.highSeries);
    GapiLens.set = (fun v x -> { x with highSeries = v });
  }
  let lowSeries = {
    GapiLens.get = (fun x -> x.lowSeries);
    GapiLens.set = (fun v x -> { x with lowSeries = v });
  }
  let openSeries = {
    GapiLens.get = (fun x -> x.openSeries);
    GapiLens.set = (fun v x -> { x with openSeries = v });
  }
  let closeSeries = {
    GapiLens.get = (fun x -> x.closeSeries);
    GapiLens.set = (fun v x -> { x with closeSeries = v });
  }
  
  let empty = {
    highSeries = CandlestickSeries.empty;
    lowSeries = CandlestickSeries.empty;
    openSeries = CandlestickSeries.empty;
    closeSeries = CandlestickSeries.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "highSeries" (CandlestickSeries.render_content v)) x.highSeries;
      (fun v -> GapiJson.render_object "lowSeries" (CandlestickSeries.render_content v)) x.lowSeries;
      (fun v -> GapiJson.render_object "openSeries" (CandlestickSeries.render_content v)) x.openSeries;
      (fun v -> GapiJson.render_object "closeSeries" (CandlestickSeries.render_content v)) x.closeSeries;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "highSeries"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CandlestickSeries.parse
        CandlestickSeries.empty
        (fun v -> { x with highSeries = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lowSeries"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CandlestickSeries.parse
        CandlestickSeries.empty
        (fun v -> { x with lowSeries = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "openSeries"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CandlestickSeries.parse
        CandlestickSeries.empty
        (fun v -> { x with openSeries = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "closeSeries"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CandlestickSeries.parse
        CandlestickSeries.empty
        (fun v -> { x with closeSeries = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CandlestickData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CandlestickDomain =
struct
  type t = {
    reversed : bool;
    data : ChartData.t;
    
  }
  
  let reversed = {
    GapiLens.get = (fun x -> x.reversed);
    GapiLens.set = (fun v x -> { x with reversed = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  
  let empty = {
    reversed = false;
    data = ChartData.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "reversed" x.reversed;
      (fun v -> GapiJson.render_object "data" (ChartData.render_content v)) x.data;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "reversed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with reversed = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CandlestickDomain.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CandlestickChartSpec =
struct
  type t = {
    data : CandlestickData.t list;
    domain : CandlestickDomain.t;
    
  }
  
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  
  let empty = {
    data = [];
    domain = CandlestickDomain.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "data" CandlestickData.render x.data;
      (fun v -> GapiJson.render_object "domain" (CandlestickDomain.render_content v)) x.domain;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              CandlestickData.parse
              CandlestickData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.CandlestickChartSpec.parse.parse_collection" e x')
        CandlestickData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "domain"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CandlestickDomain.parse
        CandlestickDomain.empty
        (fun v -> { x with domain = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CandlestickChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistogramSeries =
struct
  type t = {
    barColorStyle : ColorStyle.t;
    data : ChartData.t;
    barColor : Color.t;
    
  }
  
  let barColorStyle = {
    GapiLens.get = (fun x -> x.barColorStyle);
    GapiLens.set = (fun v x -> { x with barColorStyle = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let barColor = {
    GapiLens.get = (fun x -> x.barColor);
    GapiLens.set = (fun v x -> { x with barColor = v });
  }
  
  let empty = {
    barColorStyle = ColorStyle.empty;
    data = ChartData.empty;
    barColor = Color.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "barColorStyle" (ColorStyle.render_content v)) x.barColorStyle;
      (fun v -> GapiJson.render_object "data" (ChartData.render_content v)) x.data;
      (fun v -> GapiJson.render_object "barColor" (Color.render_content v)) x.barColor;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "barColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with barColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "barColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with barColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.HistogramSeries.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistogramChartSpec =
struct
  type t = {
    bucketSize : float;
    showItemDividers : bool;
    outlierPercentile : float;
    series : HistogramSeries.t list;
    legendPosition : string;
    
  }
  
  let bucketSize = {
    GapiLens.get = (fun x -> x.bucketSize);
    GapiLens.set = (fun v x -> { x with bucketSize = v });
  }
  let showItemDividers = {
    GapiLens.get = (fun x -> x.showItemDividers);
    GapiLens.set = (fun v x -> { x with showItemDividers = v });
  }
  let outlierPercentile = {
    GapiLens.get = (fun x -> x.outlierPercentile);
    GapiLens.set = (fun v x -> { x with outlierPercentile = v });
  }
  let series = {
    GapiLens.get = (fun x -> x.series);
    GapiLens.set = (fun v x -> { x with series = v });
  }
  let legendPosition = {
    GapiLens.get = (fun x -> x.legendPosition);
    GapiLens.set = (fun v x -> { x with legendPosition = v });
  }
  
  let empty = {
    bucketSize = 0.0;
    showItemDividers = false;
    outlierPercentile = 0.0;
    series = [];
    legendPosition = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_float_value "bucketSize" x.bucketSize;
      GapiJson.render_bool_value "showItemDividers" x.showItemDividers;
      GapiJson.render_float_value "outlierPercentile" x.outlierPercentile;
      GapiJson.render_array "series" HistogramSeries.render x.series;
      GapiJson.render_string_value "legendPosition" x.legendPosition;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bucketSize"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with bucketSize = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bucketSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bucketSize = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "showItemDividers"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with showItemDividers = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outlierPercentile"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with outlierPercentile = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "outlierPercentile"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with outlierPercentile = float_of_int v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "series"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              HistogramSeries.parse
              HistogramSeries.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.HistogramChartSpec.parse.parse_collection" e x')
        HistogramSeries.empty
        (fun v -> { x with series = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "legendPosition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with legendPosition = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.HistogramChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BaselineValueFormat =
struct
  type t = {
    description : string;
    negativeColor : Color.t;
    negativeColorStyle : ColorStyle.t;
    comparisonType : string;
    positiveColor : Color.t;
    positiveColorStyle : ColorStyle.t;
    textFormat : TextFormat.t;
    position : TextPosition.t;
    
  }
  
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let negativeColor = {
    GapiLens.get = (fun x -> x.negativeColor);
    GapiLens.set = (fun v x -> { x with negativeColor = v });
  }
  let negativeColorStyle = {
    GapiLens.get = (fun x -> x.negativeColorStyle);
    GapiLens.set = (fun v x -> { x with negativeColorStyle = v });
  }
  let comparisonType = {
    GapiLens.get = (fun x -> x.comparisonType);
    GapiLens.set = (fun v x -> { x with comparisonType = v });
  }
  let positiveColor = {
    GapiLens.get = (fun x -> x.positiveColor);
    GapiLens.set = (fun v x -> { x with positiveColor = v });
  }
  let positiveColorStyle = {
    GapiLens.get = (fun x -> x.positiveColorStyle);
    GapiLens.set = (fun v x -> { x with positiveColorStyle = v });
  }
  let textFormat = {
    GapiLens.get = (fun x -> x.textFormat);
    GapiLens.set = (fun v x -> { x with textFormat = v });
  }
  let position = {
    GapiLens.get = (fun x -> x.position);
    GapiLens.set = (fun v x -> { x with position = v });
  }
  
  let empty = {
    description = "";
    negativeColor = Color.empty;
    negativeColorStyle = ColorStyle.empty;
    comparisonType = "";
    positiveColor = Color.empty;
    positiveColorStyle = ColorStyle.empty;
    textFormat = TextFormat.empty;
    position = TextPosition.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "description" x.description;
      (fun v -> GapiJson.render_object "negativeColor" (Color.render_content v)) x.negativeColor;
      (fun v -> GapiJson.render_object "negativeColorStyle" (ColorStyle.render_content v)) x.negativeColorStyle;
      GapiJson.render_string_value "comparisonType" x.comparisonType;
      (fun v -> GapiJson.render_object "positiveColor" (Color.render_content v)) x.positiveColor;
      (fun v -> GapiJson.render_object "positiveColorStyle" (ColorStyle.render_content v)) x.positiveColorStyle;
      (fun v -> GapiJson.render_object "textFormat" (TextFormat.render_content v)) x.textFormat;
      (fun v -> GapiJson.render_object "position" (TextPosition.render_content v)) x.position;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "negativeColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with negativeColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "negativeColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with negativeColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "comparisonType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with comparisonType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "positiveColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with positiveColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "positiveColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with positiveColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with textFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "position"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextPosition.parse
        TextPosition.empty
        (fun v -> { x with position = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BaselineValueFormat.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartCustomNumberFormatOptions =
struct
  type t = {
    prefix : string;
    suffix : string;
    
  }
  
  let prefix = {
    GapiLens.get = (fun x -> x.prefix);
    GapiLens.set = (fun v x -> { x with prefix = v });
  }
  let suffix = {
    GapiLens.get = (fun x -> x.suffix);
    GapiLens.set = (fun v x -> { x with suffix = v });
  }
  
  let empty = {
    prefix = "";
    suffix = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "prefix" x.prefix;
      GapiJson.render_string_value "suffix" x.suffix;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "prefix"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with prefix = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "suffix"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with suffix = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartCustomNumberFormatOptions.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module KeyValueFormat =
struct
  type t = {
    textFormat : TextFormat.t;
    position : TextPosition.t;
    
  }
  
  let textFormat = {
    GapiLens.get = (fun x -> x.textFormat);
    GapiLens.set = (fun v x -> { x with textFormat = v });
  }
  let position = {
    GapiLens.get = (fun x -> x.position);
    GapiLens.set = (fun v x -> { x with position = v });
  }
  
  let empty = {
    textFormat = TextFormat.empty;
    position = TextPosition.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "textFormat" (TextFormat.render_content v)) x.textFormat;
      (fun v -> GapiJson.render_object "position" (TextPosition.render_content v)) x.position;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with textFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "position"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextPosition.parse
        TextPosition.empty
        (fun v -> { x with position = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.KeyValueFormat.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ScorecardChartSpec =
struct
  type t = {
    baselineValueFormat : BaselineValueFormat.t;
    customFormatOptions : ChartCustomNumberFormatOptions.t;
    numberFormatSource : string;
    aggregateType : string;
    baselineValueData : ChartData.t;
    keyValueFormat : KeyValueFormat.t;
    scaleFactor : float;
    keyValueData : ChartData.t;
    
  }
  
  let baselineValueFormat = {
    GapiLens.get = (fun x -> x.baselineValueFormat);
    GapiLens.set = (fun v x -> { x with baselineValueFormat = v });
  }
  let customFormatOptions = {
    GapiLens.get = (fun x -> x.customFormatOptions);
    GapiLens.set = (fun v x -> { x with customFormatOptions = v });
  }
  let numberFormatSource = {
    GapiLens.get = (fun x -> x.numberFormatSource);
    GapiLens.set = (fun v x -> { x with numberFormatSource = v });
  }
  let aggregateType = {
    GapiLens.get = (fun x -> x.aggregateType);
    GapiLens.set = (fun v x -> { x with aggregateType = v });
  }
  let baselineValueData = {
    GapiLens.get = (fun x -> x.baselineValueData);
    GapiLens.set = (fun v x -> { x with baselineValueData = v });
  }
  let keyValueFormat = {
    GapiLens.get = (fun x -> x.keyValueFormat);
    GapiLens.set = (fun v x -> { x with keyValueFormat = v });
  }
  let scaleFactor = {
    GapiLens.get = (fun x -> x.scaleFactor);
    GapiLens.set = (fun v x -> { x with scaleFactor = v });
  }
  let keyValueData = {
    GapiLens.get = (fun x -> x.keyValueData);
    GapiLens.set = (fun v x -> { x with keyValueData = v });
  }
  
  let empty = {
    baselineValueFormat = BaselineValueFormat.empty;
    customFormatOptions = ChartCustomNumberFormatOptions.empty;
    numberFormatSource = "";
    aggregateType = "";
    baselineValueData = ChartData.empty;
    keyValueFormat = KeyValueFormat.empty;
    scaleFactor = 0.0;
    keyValueData = ChartData.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "baselineValueFormat" (BaselineValueFormat.render_content v)) x.baselineValueFormat;
      (fun v -> GapiJson.render_object "customFormatOptions" (ChartCustomNumberFormatOptions.render_content v)) x.customFormatOptions;
      GapiJson.render_string_value "numberFormatSource" x.numberFormatSource;
      GapiJson.render_string_value "aggregateType" x.aggregateType;
      (fun v -> GapiJson.render_object "baselineValueData" (ChartData.render_content v)) x.baselineValueData;
      (fun v -> GapiJson.render_object "keyValueFormat" (KeyValueFormat.render_content v)) x.keyValueFormat;
      GapiJson.render_float_value "scaleFactor" x.scaleFactor;
      (fun v -> GapiJson.render_object "keyValueData" (ChartData.render_content v)) x.keyValueData;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "baselineValueFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BaselineValueFormat.parse
        BaselineValueFormat.empty
        (fun v -> { x with baselineValueFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "customFormatOptions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartCustomNumberFormatOptions.parse
        ChartCustomNumberFormatOptions.empty
        (fun v -> { x with customFormatOptions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "numberFormatSource"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with numberFormatSource = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "aggregateType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with aggregateType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "baselineValueData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with baselineValueData = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "keyValueFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        KeyValueFormat.parse
        KeyValueFormat.empty
        (fun v -> { x with keyValueFormat = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "scaleFactor"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with scaleFactor = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "scaleFactor"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with scaleFactor = float_of_int v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "keyValueData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with keyValueData = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ScorecardChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SortSpec =
struct
  type t = {
    foregroundColorStyle : ColorStyle.t;
    foregroundColor : Color.t;
    backgroundColor : Color.t;
    dataSourceColumnReference : DataSourceColumnReference.t;
    sortOrder : string;
    dimensionIndex : int;
    backgroundColorStyle : ColorStyle.t;
    
  }
  
  let foregroundColorStyle = {
    GapiLens.get = (fun x -> x.foregroundColorStyle);
    GapiLens.set = (fun v x -> { x with foregroundColorStyle = v });
  }
  let foregroundColor = {
    GapiLens.get = (fun x -> x.foregroundColor);
    GapiLens.set = (fun v x -> { x with foregroundColor = v });
  }
  let backgroundColor = {
    GapiLens.get = (fun x -> x.backgroundColor);
    GapiLens.set = (fun v x -> { x with backgroundColor = v });
  }
  let dataSourceColumnReference = {
    GapiLens.get = (fun x -> x.dataSourceColumnReference);
    GapiLens.set = (fun v x -> { x with dataSourceColumnReference = v });
  }
  let sortOrder = {
    GapiLens.get = (fun x -> x.sortOrder);
    GapiLens.set = (fun v x -> { x with sortOrder = v });
  }
  let dimensionIndex = {
    GapiLens.get = (fun x -> x.dimensionIndex);
    GapiLens.set = (fun v x -> { x with dimensionIndex = v });
  }
  let backgroundColorStyle = {
    GapiLens.get = (fun x -> x.backgroundColorStyle);
    GapiLens.set = (fun v x -> { x with backgroundColorStyle = v });
  }
  
  let empty = {
    foregroundColorStyle = ColorStyle.empty;
    foregroundColor = Color.empty;
    backgroundColor = Color.empty;
    dataSourceColumnReference = DataSourceColumnReference.empty;
    sortOrder = "";
    dimensionIndex = 0;
    backgroundColorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "foregroundColorStyle" (ColorStyle.render_content v)) x.foregroundColorStyle;
      (fun v -> GapiJson.render_object "foregroundColor" (Color.render_content v)) x.foregroundColor;
      (fun v -> GapiJson.render_object "backgroundColor" (Color.render_content v)) x.backgroundColor;
      (fun v -> GapiJson.render_object "dataSourceColumnReference" (DataSourceColumnReference.render_content v)) x.dataSourceColumnReference;
      GapiJson.render_string_value "sortOrder" x.sortOrder;
      GapiJson.render_int_value "dimensionIndex" x.dimensionIndex;
      (fun v -> GapiJson.render_object "backgroundColorStyle" (ColorStyle.render_content v)) x.backgroundColorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "foregroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with foregroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "foregroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with foregroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with backgroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceColumnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with dataSourceColumnReference = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sortOrder"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sortOrder = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dimensionIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with dimensionIndex = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with backgroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SortSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TreemapChartColorScale =
struct
  type t = {
    midValueColor : Color.t;
    maxValueColor : Color.t;
    minValueColor : Color.t;
    noDataColor : Color.t;
    noDataColorStyle : ColorStyle.t;
    midValueColorStyle : ColorStyle.t;
    maxValueColorStyle : ColorStyle.t;
    minValueColorStyle : ColorStyle.t;
    
  }
  
  let midValueColor = {
    GapiLens.get = (fun x -> x.midValueColor);
    GapiLens.set = (fun v x -> { x with midValueColor = v });
  }
  let maxValueColor = {
    GapiLens.get = (fun x -> x.maxValueColor);
    GapiLens.set = (fun v x -> { x with maxValueColor = v });
  }
  let minValueColor = {
    GapiLens.get = (fun x -> x.minValueColor);
    GapiLens.set = (fun v x -> { x with minValueColor = v });
  }
  let noDataColor = {
    GapiLens.get = (fun x -> x.noDataColor);
    GapiLens.set = (fun v x -> { x with noDataColor = v });
  }
  let noDataColorStyle = {
    GapiLens.get = (fun x -> x.noDataColorStyle);
    GapiLens.set = (fun v x -> { x with noDataColorStyle = v });
  }
  let midValueColorStyle = {
    GapiLens.get = (fun x -> x.midValueColorStyle);
    GapiLens.set = (fun v x -> { x with midValueColorStyle = v });
  }
  let maxValueColorStyle = {
    GapiLens.get = (fun x -> x.maxValueColorStyle);
    GapiLens.set = (fun v x -> { x with maxValueColorStyle = v });
  }
  let minValueColorStyle = {
    GapiLens.get = (fun x -> x.minValueColorStyle);
    GapiLens.set = (fun v x -> { x with minValueColorStyle = v });
  }
  
  let empty = {
    midValueColor = Color.empty;
    maxValueColor = Color.empty;
    minValueColor = Color.empty;
    noDataColor = Color.empty;
    noDataColorStyle = ColorStyle.empty;
    midValueColorStyle = ColorStyle.empty;
    maxValueColorStyle = ColorStyle.empty;
    minValueColorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "midValueColor" (Color.render_content v)) x.midValueColor;
      (fun v -> GapiJson.render_object "maxValueColor" (Color.render_content v)) x.maxValueColor;
      (fun v -> GapiJson.render_object "minValueColor" (Color.render_content v)) x.minValueColor;
      (fun v -> GapiJson.render_object "noDataColor" (Color.render_content v)) x.noDataColor;
      (fun v -> GapiJson.render_object "noDataColorStyle" (ColorStyle.render_content v)) x.noDataColorStyle;
      (fun v -> GapiJson.render_object "midValueColorStyle" (ColorStyle.render_content v)) x.midValueColorStyle;
      (fun v -> GapiJson.render_object "maxValueColorStyle" (ColorStyle.render_content v)) x.maxValueColorStyle;
      (fun v -> GapiJson.render_object "minValueColorStyle" (ColorStyle.render_content v)) x.minValueColorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "midValueColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with midValueColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "maxValueColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with maxValueColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "minValueColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with minValueColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "noDataColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with noDataColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "noDataColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with noDataColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "midValueColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with midValueColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "maxValueColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with maxValueColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "minValueColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with minValueColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TreemapChartColorScale.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TreemapChartSpec =
struct
  type t = {
    labels : ChartData.t;
    sizeData : ChartData.t;
    headerColor : Color.t;
    parentLabels : ChartData.t;
    minValue : float;
    hintedLevels : int;
    headerColorStyle : ColorStyle.t;
    colorScale : TreemapChartColorScale.t;
    levels : int;
    hideTooltips : bool;
    textFormat : TextFormat.t;
    maxValue : float;
    colorData : ChartData.t;
    
  }
  
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let sizeData = {
    GapiLens.get = (fun x -> x.sizeData);
    GapiLens.set = (fun v x -> { x with sizeData = v });
  }
  let headerColor = {
    GapiLens.get = (fun x -> x.headerColor);
    GapiLens.set = (fun v x -> { x with headerColor = v });
  }
  let parentLabels = {
    GapiLens.get = (fun x -> x.parentLabels);
    GapiLens.set = (fun v x -> { x with parentLabels = v });
  }
  let minValue = {
    GapiLens.get = (fun x -> x.minValue);
    GapiLens.set = (fun v x -> { x with minValue = v });
  }
  let hintedLevels = {
    GapiLens.get = (fun x -> x.hintedLevels);
    GapiLens.set = (fun v x -> { x with hintedLevels = v });
  }
  let headerColorStyle = {
    GapiLens.get = (fun x -> x.headerColorStyle);
    GapiLens.set = (fun v x -> { x with headerColorStyle = v });
  }
  let colorScale = {
    GapiLens.get = (fun x -> x.colorScale);
    GapiLens.set = (fun v x -> { x with colorScale = v });
  }
  let levels = {
    GapiLens.get = (fun x -> x.levels);
    GapiLens.set = (fun v x -> { x with levels = v });
  }
  let hideTooltips = {
    GapiLens.get = (fun x -> x.hideTooltips);
    GapiLens.set = (fun v x -> { x with hideTooltips = v });
  }
  let textFormat = {
    GapiLens.get = (fun x -> x.textFormat);
    GapiLens.set = (fun v x -> { x with textFormat = v });
  }
  let maxValue = {
    GapiLens.get = (fun x -> x.maxValue);
    GapiLens.set = (fun v x -> { x with maxValue = v });
  }
  let colorData = {
    GapiLens.get = (fun x -> x.colorData);
    GapiLens.set = (fun v x -> { x with colorData = v });
  }
  
  let empty = {
    labels = ChartData.empty;
    sizeData = ChartData.empty;
    headerColor = Color.empty;
    parentLabels = ChartData.empty;
    minValue = 0.0;
    hintedLevels = 0;
    headerColorStyle = ColorStyle.empty;
    colorScale = TreemapChartColorScale.empty;
    levels = 0;
    hideTooltips = false;
    textFormat = TextFormat.empty;
    maxValue = 0.0;
    colorData = ChartData.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "labels" (ChartData.render_content v)) x.labels;
      (fun v -> GapiJson.render_object "sizeData" (ChartData.render_content v)) x.sizeData;
      (fun v -> GapiJson.render_object "headerColor" (Color.render_content v)) x.headerColor;
      (fun v -> GapiJson.render_object "parentLabels" (ChartData.render_content v)) x.parentLabels;
      GapiJson.render_float_value "minValue" x.minValue;
      GapiJson.render_int_value "hintedLevels" x.hintedLevels;
      (fun v -> GapiJson.render_object "headerColorStyle" (ColorStyle.render_content v)) x.headerColorStyle;
      (fun v -> GapiJson.render_object "colorScale" (TreemapChartColorScale.render_content v)) x.colorScale;
      GapiJson.render_int_value "levels" x.levels;
      GapiJson.render_bool_value "hideTooltips" x.hideTooltips;
      (fun v -> GapiJson.render_object "textFormat" (TextFormat.render_content v)) x.textFormat;
      GapiJson.render_float_value "maxValue" x.maxValue;
      (fun v -> GapiJson.render_object "colorData" (ChartData.render_content v)) x.colorData;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sizeData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with sizeData = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headerColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with headerColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parentLabels"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with parentLabels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minValue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with minValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minValue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with minValue = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hintedLevels"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with hintedLevels = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headerColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with headerColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorScale"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TreemapChartColorScale.parse
        TreemapChartColorScale.empty
        (fun v -> { x with colorScale = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "levels"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with levels = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hideTooltips"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hideTooltips = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with textFormat = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxValue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with maxValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxValue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with maxValue = float_of_int v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with colorData = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TreemapChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PieChartSpec =
struct
  type t = {
    domain : ChartData.t;
    pieHole : float;
    threeDimensional : bool;
    legendPosition : string;
    series : ChartData.t;
    
  }
  
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  let pieHole = {
    GapiLens.get = (fun x -> x.pieHole);
    GapiLens.set = (fun v x -> { x with pieHole = v });
  }
  let threeDimensional = {
    GapiLens.get = (fun x -> x.threeDimensional);
    GapiLens.set = (fun v x -> { x with threeDimensional = v });
  }
  let legendPosition = {
    GapiLens.get = (fun x -> x.legendPosition);
    GapiLens.set = (fun v x -> { x with legendPosition = v });
  }
  let series = {
    GapiLens.get = (fun x -> x.series);
    GapiLens.set = (fun v x -> { x with series = v });
  }
  
  let empty = {
    domain = ChartData.empty;
    pieHole = 0.0;
    threeDimensional = false;
    legendPosition = "";
    series = ChartData.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "domain" (ChartData.render_content v)) x.domain;
      GapiJson.render_float_value "pieHole" x.pieHole;
      GapiJson.render_bool_value "threeDimensional" x.threeDimensional;
      GapiJson.render_string_value "legendPosition" x.legendPosition;
      (fun v -> GapiJson.render_object "series" (ChartData.render_content v)) x.series;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "domain"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with domain = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pieHole"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with pieHole = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pieHole"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with pieHole = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "threeDimensional"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with threeDimensional = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "legendPosition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with legendPosition = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "series"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartData.parse
        ChartData.empty
        (fun v -> { x with series = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PieChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChartSpec =
struct
  type t = {
    subtitleTextFormat : TextFormat.t;
    candlestickChart : CandlestickChartSpec.t;
    bubbleChart : BubbleChartSpec.t;
    subtitle : string;
    filterSpecs : FilterSpec.t list;
    histogramChart : HistogramChartSpec.t;
    backgroundColor : Color.t;
    title : string;
    hiddenDimensionStrategy : string;
    altText : string;
    orgChart : OrgChartSpec.t;
    scorecardChart : ScorecardChartSpec.t;
    basicChart : BasicChartSpec.t;
    sortSpecs : SortSpec.t list;
    titleTextFormat : TextFormat.t;
    subtitleTextPosition : TextPosition.t;
    waterfallChart : WaterfallChartSpec.t;
    treemapChart : TreemapChartSpec.t;
    maximized : bool;
    pieChart : PieChartSpec.t;
    backgroundColorStyle : ColorStyle.t;
    titleTextPosition : TextPosition.t;
    dataSourceChartProperties : DataSourceChartProperties.t;
    fontName : string;
    
  }
  
  let subtitleTextFormat = {
    GapiLens.get = (fun x -> x.subtitleTextFormat);
    GapiLens.set = (fun v x -> { x with subtitleTextFormat = v });
  }
  let candlestickChart = {
    GapiLens.get = (fun x -> x.candlestickChart);
    GapiLens.set = (fun v x -> { x with candlestickChart = v });
  }
  let bubbleChart = {
    GapiLens.get = (fun x -> x.bubbleChart);
    GapiLens.set = (fun v x -> { x with bubbleChart = v });
  }
  let subtitle = {
    GapiLens.get = (fun x -> x.subtitle);
    GapiLens.set = (fun v x -> { x with subtitle = v });
  }
  let filterSpecs = {
    GapiLens.get = (fun x -> x.filterSpecs);
    GapiLens.set = (fun v x -> { x with filterSpecs = v });
  }
  let histogramChart = {
    GapiLens.get = (fun x -> x.histogramChart);
    GapiLens.set = (fun v x -> { x with histogramChart = v });
  }
  let backgroundColor = {
    GapiLens.get = (fun x -> x.backgroundColor);
    GapiLens.set = (fun v x -> { x with backgroundColor = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let hiddenDimensionStrategy = {
    GapiLens.get = (fun x -> x.hiddenDimensionStrategy);
    GapiLens.set = (fun v x -> { x with hiddenDimensionStrategy = v });
  }
  let altText = {
    GapiLens.get = (fun x -> x.altText);
    GapiLens.set = (fun v x -> { x with altText = v });
  }
  let orgChart = {
    GapiLens.get = (fun x -> x.orgChart);
    GapiLens.set = (fun v x -> { x with orgChart = v });
  }
  let scorecardChart = {
    GapiLens.get = (fun x -> x.scorecardChart);
    GapiLens.set = (fun v x -> { x with scorecardChart = v });
  }
  let basicChart = {
    GapiLens.get = (fun x -> x.basicChart);
    GapiLens.set = (fun v x -> { x with basicChart = v });
  }
  let sortSpecs = {
    GapiLens.get = (fun x -> x.sortSpecs);
    GapiLens.set = (fun v x -> { x with sortSpecs = v });
  }
  let titleTextFormat = {
    GapiLens.get = (fun x -> x.titleTextFormat);
    GapiLens.set = (fun v x -> { x with titleTextFormat = v });
  }
  let subtitleTextPosition = {
    GapiLens.get = (fun x -> x.subtitleTextPosition);
    GapiLens.set = (fun v x -> { x with subtitleTextPosition = v });
  }
  let waterfallChart = {
    GapiLens.get = (fun x -> x.waterfallChart);
    GapiLens.set = (fun v x -> { x with waterfallChart = v });
  }
  let treemapChart = {
    GapiLens.get = (fun x -> x.treemapChart);
    GapiLens.set = (fun v x -> { x with treemapChart = v });
  }
  let maximized = {
    GapiLens.get = (fun x -> x.maximized);
    GapiLens.set = (fun v x -> { x with maximized = v });
  }
  let pieChart = {
    GapiLens.get = (fun x -> x.pieChart);
    GapiLens.set = (fun v x -> { x with pieChart = v });
  }
  let backgroundColorStyle = {
    GapiLens.get = (fun x -> x.backgroundColorStyle);
    GapiLens.set = (fun v x -> { x with backgroundColorStyle = v });
  }
  let titleTextPosition = {
    GapiLens.get = (fun x -> x.titleTextPosition);
    GapiLens.set = (fun v x -> { x with titleTextPosition = v });
  }
  let dataSourceChartProperties = {
    GapiLens.get = (fun x -> x.dataSourceChartProperties);
    GapiLens.set = (fun v x -> { x with dataSourceChartProperties = v });
  }
  let fontName = {
    GapiLens.get = (fun x -> x.fontName);
    GapiLens.set = (fun v x -> { x with fontName = v });
  }
  
  let empty = {
    subtitleTextFormat = TextFormat.empty;
    candlestickChart = CandlestickChartSpec.empty;
    bubbleChart = BubbleChartSpec.empty;
    subtitle = "";
    filterSpecs = [];
    histogramChart = HistogramChartSpec.empty;
    backgroundColor = Color.empty;
    title = "";
    hiddenDimensionStrategy = "";
    altText = "";
    orgChart = OrgChartSpec.empty;
    scorecardChart = ScorecardChartSpec.empty;
    basicChart = BasicChartSpec.empty;
    sortSpecs = [];
    titleTextFormat = TextFormat.empty;
    subtitleTextPosition = TextPosition.empty;
    waterfallChart = WaterfallChartSpec.empty;
    treemapChart = TreemapChartSpec.empty;
    maximized = false;
    pieChart = PieChartSpec.empty;
    backgroundColorStyle = ColorStyle.empty;
    titleTextPosition = TextPosition.empty;
    dataSourceChartProperties = DataSourceChartProperties.empty;
    fontName = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "subtitleTextFormat" (TextFormat.render_content v)) x.subtitleTextFormat;
      (fun v -> GapiJson.render_object "candlestickChart" (CandlestickChartSpec.render_content v)) x.candlestickChart;
      (fun v -> GapiJson.render_object "bubbleChart" (BubbleChartSpec.render_content v)) x.bubbleChart;
      GapiJson.render_string_value "subtitle" x.subtitle;
      GapiJson.render_array "filterSpecs" FilterSpec.render x.filterSpecs;
      (fun v -> GapiJson.render_object "histogramChart" (HistogramChartSpec.render_content v)) x.histogramChart;
      (fun v -> GapiJson.render_object "backgroundColor" (Color.render_content v)) x.backgroundColor;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "hiddenDimensionStrategy" x.hiddenDimensionStrategy;
      GapiJson.render_string_value "altText" x.altText;
      (fun v -> GapiJson.render_object "orgChart" (OrgChartSpec.render_content v)) x.orgChart;
      (fun v -> GapiJson.render_object "scorecardChart" (ScorecardChartSpec.render_content v)) x.scorecardChart;
      (fun v -> GapiJson.render_object "basicChart" (BasicChartSpec.render_content v)) x.basicChart;
      GapiJson.render_array "sortSpecs" SortSpec.render x.sortSpecs;
      (fun v -> GapiJson.render_object "titleTextFormat" (TextFormat.render_content v)) x.titleTextFormat;
      (fun v -> GapiJson.render_object "subtitleTextPosition" (TextPosition.render_content v)) x.subtitleTextPosition;
      (fun v -> GapiJson.render_object "waterfallChart" (WaterfallChartSpec.render_content v)) x.waterfallChart;
      (fun v -> GapiJson.render_object "treemapChart" (TreemapChartSpec.render_content v)) x.treemapChart;
      GapiJson.render_bool_value "maximized" x.maximized;
      (fun v -> GapiJson.render_object "pieChart" (PieChartSpec.render_content v)) x.pieChart;
      (fun v -> GapiJson.render_object "backgroundColorStyle" (ColorStyle.render_content v)) x.backgroundColorStyle;
      (fun v -> GapiJson.render_object "titleTextPosition" (TextPosition.render_content v)) x.titleTextPosition;
      (fun v -> GapiJson.render_object "dataSourceChartProperties" (DataSourceChartProperties.render_content v)) x.dataSourceChartProperties;
      GapiJson.render_string_value "fontName" x.fontName;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "subtitleTextFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with subtitleTextFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "candlestickChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CandlestickChartSpec.parse
        CandlestickChartSpec.empty
        (fun v -> { x with candlestickChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bubbleChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BubbleChartSpec.parse
        BubbleChartSpec.empty
        (fun v -> { x with bubbleChart = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "subtitle"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with subtitle = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterSpec.parse
              FilterSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ChartSpec.parse.parse_collection" e x')
        FilterSpec.empty
        (fun v -> { x with filterSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "histogramChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        HistogramChartSpec.parse
        HistogramChartSpec.empty
        (fun v -> { x with histogramChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with backgroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hiddenDimensionStrategy"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hiddenDimensionStrategy = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "altText"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with altText = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "orgChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        OrgChartSpec.parse
        OrgChartSpec.empty
        (fun v -> { x with orgChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scorecardChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ScorecardChartSpec.parse
        ScorecardChartSpec.empty
        (fun v -> { x with scorecardChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "basicChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BasicChartSpec.parse
        BasicChartSpec.empty
        (fun v -> { x with basicChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sortSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SortSpec.parse
              SortSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ChartSpec.parse.parse_collection" e x')
        SortSpec.empty
        (fun v -> { x with sortSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "titleTextFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with titleTextFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "subtitleTextPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextPosition.parse
        TextPosition.empty
        (fun v -> { x with subtitleTextPosition = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "waterfallChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        WaterfallChartSpec.parse
        WaterfallChartSpec.empty
        (fun v -> { x with waterfallChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "treemapChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TreemapChartSpec.parse
        TreemapChartSpec.empty
        (fun v -> { x with treemapChart = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maximized"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with maximized = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pieChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PieChartSpec.parse
        PieChartSpec.empty
        (fun v -> { x with pieChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with backgroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "titleTextPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextPosition.parse
        TextPosition.empty
        (fun v -> { x with titleTextPosition = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceChartProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceChartProperties.parse
        DataSourceChartProperties.empty
        (fun v -> { x with dataSourceChartProperties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fontName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fontName = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ChartSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EmbeddedChart =
struct
  type t = {
    border : EmbeddedObjectBorder.t;
    chartId : int;
    position : EmbeddedObjectPosition.t;
    spec : ChartSpec.t;
    
  }
  
  let border = {
    GapiLens.get = (fun x -> x.border);
    GapiLens.set = (fun v x -> { x with border = v });
  }
  let chartId = {
    GapiLens.get = (fun x -> x.chartId);
    GapiLens.set = (fun v x -> { x with chartId = v });
  }
  let position = {
    GapiLens.get = (fun x -> x.position);
    GapiLens.set = (fun v x -> { x with position = v });
  }
  let spec = {
    GapiLens.get = (fun x -> x.spec);
    GapiLens.set = (fun v x -> { x with spec = v });
  }
  
  let empty = {
    border = EmbeddedObjectBorder.empty;
    chartId = 0;
    position = EmbeddedObjectPosition.empty;
    spec = ChartSpec.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "border" (EmbeddedObjectBorder.render_content v)) x.border;
      GapiJson.render_int_value "chartId" x.chartId;
      (fun v -> GapiJson.render_object "position" (EmbeddedObjectPosition.render_content v)) x.position;
      (fun v -> GapiJson.render_object "spec" (ChartSpec.render_content v)) x.spec;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "border"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedObjectBorder.parse
        EmbeddedObjectBorder.empty
        (fun v -> { x with border = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "chartId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with chartId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "position"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedObjectPosition.parse
        EmbeddedObjectPosition.empty
        (fun v -> { x with position = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartSpec.parse
        ChartSpec.empty
        (fun v -> { x with spec = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.EmbeddedChart.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddChartResponse =
struct
  type t = {
    chart : EmbeddedChart.t;
    
  }
  
  let chart = {
    GapiLens.get = (fun x -> x.chart);
    GapiLens.set = (fun v x -> { x with chart = v });
  }
  
  let empty = {
    chart = EmbeddedChart.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "chart" (EmbeddedChart.render_content v)) x.chart;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "chart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedChart.parse
        EmbeddedChart.empty
        (fun v -> { x with chart = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddChartResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TrimWhitespaceResponse =
struct
  type t = {
    cellsChangedCount : int;
    
  }
  
  let cellsChangedCount = {
    GapiLens.get = (fun x -> x.cellsChangedCount);
    GapiLens.set = (fun v x -> { x with cellsChangedCount = v });
  }
  
  let empty = {
    cellsChangedCount = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "cellsChangedCount" x.cellsChangedCount;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "cellsChangedCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with cellsChangedCount = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TrimWhitespaceResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DimensionGroup =
struct
  type t = {
    range : DimensionRange.t;
    collapsed : bool;
    depth : int;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let collapsed = {
    GapiLens.get = (fun x -> x.collapsed);
    GapiLens.set = (fun v x -> { x with collapsed = v });
  }
  let depth = {
    GapiLens.get = (fun x -> x.depth);
    GapiLens.set = (fun v x -> { x with depth = v });
  }
  
  let empty = {
    range = DimensionRange.empty;
    collapsed = false;
    depth = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (DimensionRange.render_content v)) x.range;
      GapiJson.render_bool_value "collapsed" x.collapsed;
      GapiJson.render_int_value "depth" x.depth;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "collapsed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with collapsed = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "depth"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with depth = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DimensionGroup.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddDimensionGroupResponse =
struct
  type t = {
    dimensionGroups : DimensionGroup.t list;
    
  }
  
  let dimensionGroups = {
    GapiLens.get = (fun x -> x.dimensionGroups);
    GapiLens.set = (fun v x -> { x with dimensionGroups = v });
  }
  
  let empty = {
    dimensionGroups = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "dimensionGroups" DimensionGroup.render x.dimensionGroups;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dimensionGroups"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionGroup.parse
              DimensionGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.AddDimensionGroupResponse.parse.parse_collection" e x')
        DimensionGroup.empty
        (fun v -> { x with dimensionGroups = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddDimensionGroupResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BandingProperties =
struct
  type t = {
    headerColorStyle : ColorStyle.t;
    footerColor : Color.t;
    secondBandColor : Color.t;
    headerColor : Color.t;
    secondBandColorStyle : ColorStyle.t;
    firstBandColor : Color.t;
    footerColorStyle : ColorStyle.t;
    firstBandColorStyle : ColorStyle.t;
    
  }
  
  let headerColorStyle = {
    GapiLens.get = (fun x -> x.headerColorStyle);
    GapiLens.set = (fun v x -> { x with headerColorStyle = v });
  }
  let footerColor = {
    GapiLens.get = (fun x -> x.footerColor);
    GapiLens.set = (fun v x -> { x with footerColor = v });
  }
  let secondBandColor = {
    GapiLens.get = (fun x -> x.secondBandColor);
    GapiLens.set = (fun v x -> { x with secondBandColor = v });
  }
  let headerColor = {
    GapiLens.get = (fun x -> x.headerColor);
    GapiLens.set = (fun v x -> { x with headerColor = v });
  }
  let secondBandColorStyle = {
    GapiLens.get = (fun x -> x.secondBandColorStyle);
    GapiLens.set = (fun v x -> { x with secondBandColorStyle = v });
  }
  let firstBandColor = {
    GapiLens.get = (fun x -> x.firstBandColor);
    GapiLens.set = (fun v x -> { x with firstBandColor = v });
  }
  let footerColorStyle = {
    GapiLens.get = (fun x -> x.footerColorStyle);
    GapiLens.set = (fun v x -> { x with footerColorStyle = v });
  }
  let firstBandColorStyle = {
    GapiLens.get = (fun x -> x.firstBandColorStyle);
    GapiLens.set = (fun v x -> { x with firstBandColorStyle = v });
  }
  
  let empty = {
    headerColorStyle = ColorStyle.empty;
    footerColor = Color.empty;
    secondBandColor = Color.empty;
    headerColor = Color.empty;
    secondBandColorStyle = ColorStyle.empty;
    firstBandColor = Color.empty;
    footerColorStyle = ColorStyle.empty;
    firstBandColorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "headerColorStyle" (ColorStyle.render_content v)) x.headerColorStyle;
      (fun v -> GapiJson.render_object "footerColor" (Color.render_content v)) x.footerColor;
      (fun v -> GapiJson.render_object "secondBandColor" (Color.render_content v)) x.secondBandColor;
      (fun v -> GapiJson.render_object "headerColor" (Color.render_content v)) x.headerColor;
      (fun v -> GapiJson.render_object "secondBandColorStyle" (ColorStyle.render_content v)) x.secondBandColorStyle;
      (fun v -> GapiJson.render_object "firstBandColor" (Color.render_content v)) x.firstBandColor;
      (fun v -> GapiJson.render_object "footerColorStyle" (ColorStyle.render_content v)) x.footerColorStyle;
      (fun v -> GapiJson.render_object "firstBandColorStyle" (ColorStyle.render_content v)) x.firstBandColorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headerColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with headerColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "footerColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with footerColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "secondBandColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with secondBandColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headerColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with headerColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "secondBandColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with secondBandColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "firstBandColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with firstBandColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "footerColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with footerColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "firstBandColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with firstBandColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BandingProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BandedRange =
struct
  type t = {
    columnProperties : BandingProperties.t;
    bandedRangeId : int;
    range : GridRange.t;
    rowProperties : BandingProperties.t;
    
  }
  
  let columnProperties = {
    GapiLens.get = (fun x -> x.columnProperties);
    GapiLens.set = (fun v x -> { x with columnProperties = v });
  }
  let bandedRangeId = {
    GapiLens.get = (fun x -> x.bandedRangeId);
    GapiLens.set = (fun v x -> { x with bandedRangeId = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let rowProperties = {
    GapiLens.get = (fun x -> x.rowProperties);
    GapiLens.set = (fun v x -> { x with rowProperties = v });
  }
  
  let empty = {
    columnProperties = BandingProperties.empty;
    bandedRangeId = 0;
    range = GridRange.empty;
    rowProperties = BandingProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "columnProperties" (BandingProperties.render_content v)) x.columnProperties;
      GapiJson.render_int_value "bandedRangeId" x.bandedRangeId;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      (fun v -> GapiJson.render_object "rowProperties" (BandingProperties.render_content v)) x.rowProperties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BandingProperties.parse
        BandingProperties.empty
        (fun v -> { x with columnProperties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bandedRangeId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bandedRangeId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rowProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BandingProperties.parse
        BandingProperties.empty
        (fun v -> { x with rowProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BandedRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddBandingResponse =
struct
  type t = {
    bandedRange : BandedRange.t;
    
  }
  
  let bandedRange = {
    GapiLens.get = (fun x -> x.bandedRange);
    GapiLens.set = (fun v x -> { x with bandedRange = v });
  }
  
  let empty = {
    bandedRange = BandedRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "bandedRange" (BandedRange.render_content v)) x.bandedRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bandedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BandedRange.parse
        BandedRange.empty
        (fun v -> { x with bandedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddBandingResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceParameter =
struct
  type t = {
    namedRangeId : string;
    name : string;
    range : GridRange.t;
    
  }
  
  let namedRangeId = {
    GapiLens.get = (fun x -> x.namedRangeId);
    GapiLens.set = (fun v x -> { x with namedRangeId = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    namedRangeId = "";
    name = "";
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "namedRangeId" x.namedRangeId;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "namedRangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with namedRangeId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceParameter.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BigQueryTableSpec =
struct
  type t = {
    tableProjectId : string;
    datasetId : string;
    tableId : string;
    
  }
  
  let tableProjectId = {
    GapiLens.get = (fun x -> x.tableProjectId);
    GapiLens.set = (fun v x -> { x with tableProjectId = v });
  }
  let datasetId = {
    GapiLens.get = (fun x -> x.datasetId);
    GapiLens.set = (fun v x -> { x with datasetId = v });
  }
  let tableId = {
    GapiLens.get = (fun x -> x.tableId);
    GapiLens.set = (fun v x -> { x with tableId = v });
  }
  
  let empty = {
    tableProjectId = "";
    datasetId = "";
    tableId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "tableProjectId" x.tableProjectId;
      GapiJson.render_string_value "datasetId" x.datasetId;
      GapiJson.render_string_value "tableId" x.tableId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "tableProjectId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with tableProjectId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "datasetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with datasetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "tableId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with tableId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BigQueryTableSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BigQueryQuerySpec =
struct
  type t = {
    rawQuery : string;
    
  }
  
  let rawQuery = {
    GapiLens.get = (fun x -> x.rawQuery);
    GapiLens.set = (fun v x -> { x with rawQuery = v });
  }
  
  let empty = {
    rawQuery = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "rawQuery" x.rawQuery;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rawQuery"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with rawQuery = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BigQueryQuerySpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BigQueryDataSourceSpec =
struct
  type t = {
    tableSpec : BigQueryTableSpec.t;
    projectId : string;
    querySpec : BigQueryQuerySpec.t;
    
  }
  
  let tableSpec = {
    GapiLens.get = (fun x -> x.tableSpec);
    GapiLens.set = (fun v x -> { x with tableSpec = v });
  }
  let projectId = {
    GapiLens.get = (fun x -> x.projectId);
    GapiLens.set = (fun v x -> { x with projectId = v });
  }
  let querySpec = {
    GapiLens.get = (fun x -> x.querySpec);
    GapiLens.set = (fun v x -> { x with querySpec = v });
  }
  
  let empty = {
    tableSpec = BigQueryTableSpec.empty;
    projectId = "";
    querySpec = BigQueryQuerySpec.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "tableSpec" (BigQueryTableSpec.render_content v)) x.tableSpec;
      GapiJson.render_string_value "projectId" x.projectId;
      (fun v -> GapiJson.render_object "querySpec" (BigQueryQuerySpec.render_content v)) x.querySpec;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "tableSpec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BigQueryTableSpec.parse
        BigQueryTableSpec.empty
        (fun v -> { x with tableSpec = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "projectId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with projectId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "querySpec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BigQueryQuerySpec.parse
        BigQueryQuerySpec.empty
        (fun v -> { x with querySpec = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BigQueryDataSourceSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceSpec =
struct
  type t = {
    parameters : DataSourceParameter.t list;
    bigQuery : BigQueryDataSourceSpec.t;
    
  }
  
  let parameters = {
    GapiLens.get = (fun x -> x.parameters);
    GapiLens.set = (fun v x -> { x with parameters = v });
  }
  let bigQuery = {
    GapiLens.get = (fun x -> x.bigQuery);
    GapiLens.set = (fun v x -> { x with bigQuery = v });
  }
  
  let empty = {
    parameters = [];
    bigQuery = BigQueryDataSourceSpec.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "parameters" DataSourceParameter.render x.parameters;
      (fun v -> GapiJson.render_object "bigQuery" (BigQueryDataSourceSpec.render_content v)) x.bigQuery;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameters"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceParameter.parse
              DataSourceParameter.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceSpec.parse.parse_collection" e x')
        DataSourceParameter.empty
        (fun v -> { x with parameters = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bigQuery"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BigQueryDataSourceSpec.parse
        BigQueryDataSourceSpec.empty
        (fun v -> { x with bigQuery = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSource =
struct
  type t = {
    sheetId : int;
    spec : DataSourceSpec.t;
    dataSourceId : string;
    calculatedColumns : DataSourceColumn.t list;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let spec = {
    GapiLens.get = (fun x -> x.spec);
    GapiLens.set = (fun v x -> { x with spec = v });
  }
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  let calculatedColumns = {
    GapiLens.get = (fun x -> x.calculatedColumns);
    GapiLens.set = (fun v x -> { x with calculatedColumns = v });
  }
  
  let empty = {
    sheetId = 0;
    spec = DataSourceSpec.empty;
    dataSourceId = "";
    calculatedColumns = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      (fun v -> GapiJson.render_object "spec" (DataSourceSpec.render_content v)) x.spec;
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      GapiJson.render_array "calculatedColumns" DataSourceColumn.render x.calculatedColumns;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceSpec.parse
        DataSourceSpec.empty
        (fun v -> { x with spec = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calculatedColumns"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceColumn.parse
              DataSourceColumn.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSource.parse.parse_collection" e x')
        DataSourceColumn.empty
        (fun v -> { x with calculatedColumns = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSource.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddDataSourceResponse =
struct
  type t = {
    dataExecutionStatus : DataExecutionStatus.t;
    dataSource : DataSource.t;
    
  }
  
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  let dataSource = {
    GapiLens.get = (fun x -> x.dataSource);
    GapiLens.set = (fun v x -> { x with dataSource = v });
  }
  
  let empty = {
    dataExecutionStatus = DataExecutionStatus.empty;
    dataSource = DataSource.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      (fun v -> GapiJson.render_object "dataSource" (DataSource.render_content v)) x.dataSource;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSource.parse
        DataSource.empty
        (fun v -> { x with dataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddDataSourceResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SlicerSpec =
struct
  type t = {
    columnIndex : int;
    applyToPivotTables : bool;
    filterCriteria : FilterCriteria.t;
    textFormat : TextFormat.t;
    backgroundColorStyle : ColorStyle.t;
    title : string;
    dataRange : GridRange.t;
    horizontalAlignment : string;
    backgroundColor : Color.t;
    
  }
  
  let columnIndex = {
    GapiLens.get = (fun x -> x.columnIndex);
    GapiLens.set = (fun v x -> { x with columnIndex = v });
  }
  let applyToPivotTables = {
    GapiLens.get = (fun x -> x.applyToPivotTables);
    GapiLens.set = (fun v x -> { x with applyToPivotTables = v });
  }
  let filterCriteria = {
    GapiLens.get = (fun x -> x.filterCriteria);
    GapiLens.set = (fun v x -> { x with filterCriteria = v });
  }
  let textFormat = {
    GapiLens.get = (fun x -> x.textFormat);
    GapiLens.set = (fun v x -> { x with textFormat = v });
  }
  let backgroundColorStyle = {
    GapiLens.get = (fun x -> x.backgroundColorStyle);
    GapiLens.set = (fun v x -> { x with backgroundColorStyle = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let dataRange = {
    GapiLens.get = (fun x -> x.dataRange);
    GapiLens.set = (fun v x -> { x with dataRange = v });
  }
  let horizontalAlignment = {
    GapiLens.get = (fun x -> x.horizontalAlignment);
    GapiLens.set = (fun v x -> { x with horizontalAlignment = v });
  }
  let backgroundColor = {
    GapiLens.get = (fun x -> x.backgroundColor);
    GapiLens.set = (fun v x -> { x with backgroundColor = v });
  }
  
  let empty = {
    columnIndex = 0;
    applyToPivotTables = false;
    filterCriteria = FilterCriteria.empty;
    textFormat = TextFormat.empty;
    backgroundColorStyle = ColorStyle.empty;
    title = "";
    dataRange = GridRange.empty;
    horizontalAlignment = "";
    backgroundColor = Color.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "columnIndex" x.columnIndex;
      GapiJson.render_bool_value "applyToPivotTables" x.applyToPivotTables;
      (fun v -> GapiJson.render_object "filterCriteria" (FilterCriteria.render_content v)) x.filterCriteria;
      (fun v -> GapiJson.render_object "textFormat" (TextFormat.render_content v)) x.textFormat;
      (fun v -> GapiJson.render_object "backgroundColorStyle" (ColorStyle.render_content v)) x.backgroundColorStyle;
      GapiJson.render_string_value "title" x.title;
      (fun v -> GapiJson.render_object "dataRange" (GridRange.render_content v)) x.dataRange;
      GapiJson.render_string_value "horizontalAlignment" x.horizontalAlignment;
      (fun v -> GapiJson.render_object "backgroundColor" (Color.render_content v)) x.backgroundColor;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with columnIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "applyToPivotTables"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with applyToPivotTables = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterCriteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterCriteria.parse
        FilterCriteria.empty
        (fun v -> { x with filterCriteria = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with textFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with backgroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with dataRange = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "horizontalAlignment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with horizontalAlignment = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with backgroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SlicerSpec.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Slicer =
struct
  type t = {
    position : EmbeddedObjectPosition.t;
    spec : SlicerSpec.t;
    slicerId : int;
    
  }
  
  let position = {
    GapiLens.get = (fun x -> x.position);
    GapiLens.set = (fun v x -> { x with position = v });
  }
  let spec = {
    GapiLens.get = (fun x -> x.spec);
    GapiLens.set = (fun v x -> { x with spec = v });
  }
  let slicerId = {
    GapiLens.get = (fun x -> x.slicerId);
    GapiLens.set = (fun v x -> { x with slicerId = v });
  }
  
  let empty = {
    position = EmbeddedObjectPosition.empty;
    spec = SlicerSpec.empty;
    slicerId = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "position" (EmbeddedObjectPosition.render_content v)) x.position;
      (fun v -> GapiJson.render_object "spec" (SlicerSpec.render_content v)) x.spec;
      GapiJson.render_int_value "slicerId" x.slicerId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "position"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedObjectPosition.parse
        EmbeddedObjectPosition.empty
        (fun v -> { x with position = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SlicerSpec.parse
        SlicerSpec.empty
        (fun v -> { x with spec = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "slicerId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with slicerId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Slicer.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddSlicerResponse =
struct
  type t = {
    slicer : Slicer.t;
    
  }
  
  let slicer = {
    GapiLens.get = (fun x -> x.slicer);
    GapiLens.set = (fun v x -> { x with slicer = v });
  }
  
  let empty = {
    slicer = Slicer.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "slicer" (Slicer.render_content v)) x.slicer;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "slicer"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Slicer.parse
        Slicer.empty
        (fun v -> { x with slicer = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddSlicerResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FindReplaceResponse =
struct
  type t = {
    rowsChanged : int;
    occurrencesChanged : int;
    formulasChanged : int;
    sheetsChanged : int;
    valuesChanged : int;
    
  }
  
  let rowsChanged = {
    GapiLens.get = (fun x -> x.rowsChanged);
    GapiLens.set = (fun v x -> { x with rowsChanged = v });
  }
  let occurrencesChanged = {
    GapiLens.get = (fun x -> x.occurrencesChanged);
    GapiLens.set = (fun v x -> { x with occurrencesChanged = v });
  }
  let formulasChanged = {
    GapiLens.get = (fun x -> x.formulasChanged);
    GapiLens.set = (fun v x -> { x with formulasChanged = v });
  }
  let sheetsChanged = {
    GapiLens.get = (fun x -> x.sheetsChanged);
    GapiLens.set = (fun v x -> { x with sheetsChanged = v });
  }
  let valuesChanged = {
    GapiLens.get = (fun x -> x.valuesChanged);
    GapiLens.set = (fun v x -> { x with valuesChanged = v });
  }
  
  let empty = {
    rowsChanged = 0;
    occurrencesChanged = 0;
    formulasChanged = 0;
    sheetsChanged = 0;
    valuesChanged = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "rowsChanged" x.rowsChanged;
      GapiJson.render_int_value "occurrencesChanged" x.occurrencesChanged;
      GapiJson.render_int_value "formulasChanged" x.formulasChanged;
      GapiJson.render_int_value "sheetsChanged" x.sheetsChanged;
      GapiJson.render_int_value "valuesChanged" x.valuesChanged;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rowsChanged"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with rowsChanged = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "occurrencesChanged"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with occurrencesChanged = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formulasChanged"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with formulasChanged = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetsChanged"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetsChanged = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "valuesChanged"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with valuesChanged = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.FindReplaceResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceObjectReference =
struct
  type t = {
    chartId : int;
    sheetId : string;
    dataSourceTableAnchorCell : GridCoordinate.t;
    dataSourceFormulaCell : GridCoordinate.t;
    dataSourcePivotTableAnchorCell : GridCoordinate.t;
    
  }
  
  let chartId = {
    GapiLens.get = (fun x -> x.chartId);
    GapiLens.set = (fun v x -> { x with chartId = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let dataSourceTableAnchorCell = {
    GapiLens.get = (fun x -> x.dataSourceTableAnchorCell);
    GapiLens.set = (fun v x -> { x with dataSourceTableAnchorCell = v });
  }
  let dataSourceFormulaCell = {
    GapiLens.get = (fun x -> x.dataSourceFormulaCell);
    GapiLens.set = (fun v x -> { x with dataSourceFormulaCell = v });
  }
  let dataSourcePivotTableAnchorCell = {
    GapiLens.get = (fun x -> x.dataSourcePivotTableAnchorCell);
    GapiLens.set = (fun v x -> { x with dataSourcePivotTableAnchorCell = v });
  }
  
  let empty = {
    chartId = 0;
    sheetId = "";
    dataSourceTableAnchorCell = GridCoordinate.empty;
    dataSourceFormulaCell = GridCoordinate.empty;
    dataSourcePivotTableAnchorCell = GridCoordinate.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "chartId" x.chartId;
      GapiJson.render_string_value "sheetId" x.sheetId;
      (fun v -> GapiJson.render_object "dataSourceTableAnchorCell" (GridCoordinate.render_content v)) x.dataSourceTableAnchorCell;
      (fun v -> GapiJson.render_object "dataSourceFormulaCell" (GridCoordinate.render_content v)) x.dataSourceFormulaCell;
      (fun v -> GapiJson.render_object "dataSourcePivotTableAnchorCell" (GridCoordinate.render_content v)) x.dataSourcePivotTableAnchorCell;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "chartId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with chartId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceTableAnchorCell"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with dataSourceTableAnchorCell = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceFormulaCell"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with dataSourceFormulaCell = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourcePivotTableAnchorCell"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with dataSourcePivotTableAnchorCell = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceObjectReference.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RefreshDataSourceObjectExecutionStatus =
struct
  type t = {
    reference : DataSourceObjectReference.t;
    dataExecutionStatus : DataExecutionStatus.t;
    
  }
  
  let reference = {
    GapiLens.get = (fun x -> x.reference);
    GapiLens.set = (fun v x -> { x with reference = v });
  }
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  
  let empty = {
    reference = DataSourceObjectReference.empty;
    dataExecutionStatus = DataExecutionStatus.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "reference" (DataSourceObjectReference.render_content v)) x.reference;
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "reference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceObjectReference.parse
        DataSourceObjectReference.empty
        (fun v -> { x with reference = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.RefreshDataSourceObjectExecutionStatus.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RefreshDataSourceResponse =
struct
  type t = {
    statuses : RefreshDataSourceObjectExecutionStatus.t list;
    
  }
  
  let statuses = {
    GapiLens.get = (fun x -> x.statuses);
    GapiLens.set = (fun v x -> { x with statuses = v });
  }
  
  let empty = {
    statuses = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "statuses" RefreshDataSourceObjectExecutionStatus.render x.statuses;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "statuses"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RefreshDataSourceObjectExecutionStatus.parse
              RefreshDataSourceObjectExecutionStatus.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.RefreshDataSourceResponse.parse.parse_collection" e x')
        RefreshDataSourceObjectExecutionStatus.empty
        (fun v -> { x with statuses = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.RefreshDataSourceResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module NamedRange =
struct
  type t = {
    range : GridRange.t;
    namedRangeId : string;
    name : string;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let namedRangeId = {
    GapiLens.get = (fun x -> x.namedRangeId);
    GapiLens.set = (fun v x -> { x with namedRangeId = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  
  let empty = {
    range = GridRange.empty;
    namedRangeId = "";
    name = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_string_value "namedRangeId" x.namedRangeId;
      GapiJson.render_string_value "name" x.name;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "namedRangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with namedRangeId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.NamedRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddNamedRangeResponse =
struct
  type t = {
    namedRange : NamedRange.t;
    
  }
  
  let namedRange = {
    GapiLens.get = (fun x -> x.namedRange);
    GapiLens.set = (fun v x -> { x with namedRange = v });
  }
  
  let empty = {
    namedRange = NamedRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "namedRange" (NamedRange.render_content v)) x.namedRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "namedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        NamedRange.parse
        NamedRange.empty
        (fun v -> { x with namedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddNamedRangeResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateDataSourceResponse =
struct
  type t = {
    dataSource : DataSource.t;
    dataExecutionStatus : DataExecutionStatus.t;
    
  }
  
  let dataSource = {
    GapiLens.get = (fun x -> x.dataSource);
    GapiLens.set = (fun v x -> { x with dataSource = v });
  }
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  
  let empty = {
    dataSource = DataSource.empty;
    dataExecutionStatus = DataExecutionStatus.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataSource" (DataSource.render_content v)) x.dataSource;
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSource.parse
        DataSource.empty
        (fun v -> { x with dataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateDataSourceResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FilterView =
struct
  type t = {
    filterViewId : int;
    title : string;
    sortSpecs : SortSpec.t list;
    range : GridRange.t;
    filterSpecs : FilterSpec.t list;
    namedRangeId : string;
    criteria : (string * FilterCriteria.t) list;
    
  }
  
  let filterViewId = {
    GapiLens.get = (fun x -> x.filterViewId);
    GapiLens.set = (fun v x -> { x with filterViewId = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let sortSpecs = {
    GapiLens.get = (fun x -> x.sortSpecs);
    GapiLens.set = (fun v x -> { x with sortSpecs = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let filterSpecs = {
    GapiLens.get = (fun x -> x.filterSpecs);
    GapiLens.set = (fun v x -> { x with filterSpecs = v });
  }
  let namedRangeId = {
    GapiLens.get = (fun x -> x.namedRangeId);
    GapiLens.set = (fun v x -> { x with namedRangeId = v });
  }
  let criteria = {
    GapiLens.get = (fun x -> x.criteria);
    GapiLens.set = (fun v x -> { x with criteria = v });
  }
  
  let empty = {
    filterViewId = 0;
    title = "";
    sortSpecs = [];
    range = GridRange.empty;
    filterSpecs = [];
    namedRangeId = "";
    criteria = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "filterViewId" x.filterViewId;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_array "sortSpecs" SortSpec.render x.sortSpecs;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_array "filterSpecs" FilterSpec.render x.filterSpecs;
      GapiJson.render_string_value "namedRangeId" x.namedRangeId;
      GapiJson.render_collection "criteria" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (FilterCriteria.render_content v)) v) x.criteria;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filterViewId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with filterViewId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sortSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SortSpec.parse
              SortSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.FilterView.parse.parse_collection" e x')
        SortSpec.empty
        (fun v -> { x with sortSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterSpec.parse
              FilterSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.FilterView.parse.parse_collection" e x')
        FilterSpec.empty
        (fun v -> { x with filterSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "namedRangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with namedRangeId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "criteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterCriteria.parse
              FilterCriteria.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.FilterView.parse.parse_dictionary" e x')
        ("", FilterCriteria.empty)
        (fun v -> { x with criteria = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.FilterView.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddFilterViewResponse =
struct
  type t = {
    filter : FilterView.t;
    
  }
  
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  
  let empty = {
    filter = FilterView.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "filter" (FilterView.render_content v)) x.filter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterView.parse
        FilterView.empty
        (fun v -> { x with filter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddFilterViewResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module InterpolationPoint =
struct
  type t = {
    value : string;
    color : Color.t;
    colorStyle : ColorStyle.t;
    _type : string;
    
  }
  
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  let colorStyle = {
    GapiLens.get = (fun x -> x.colorStyle);
    GapiLens.set = (fun v x -> { x with colorStyle = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    value = "";
    color = Color.empty;
    colorStyle = ColorStyle.empty;
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "value" x.value;
      (fun v -> GapiJson.render_object "color" (Color.render_content v)) x.color;
      (fun v -> GapiJson.render_object "colorStyle" (ColorStyle.render_content v)) x.colorStyle;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with colorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.InterpolationPoint.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GradientRule =
struct
  type t = {
    maxpoint : InterpolationPoint.t;
    minpoint : InterpolationPoint.t;
    midpoint : InterpolationPoint.t;
    
  }
  
  let maxpoint = {
    GapiLens.get = (fun x -> x.maxpoint);
    GapiLens.set = (fun v x -> { x with maxpoint = v });
  }
  let minpoint = {
    GapiLens.get = (fun x -> x.minpoint);
    GapiLens.set = (fun v x -> { x with minpoint = v });
  }
  let midpoint = {
    GapiLens.get = (fun x -> x.midpoint);
    GapiLens.set = (fun v x -> { x with midpoint = v });
  }
  
  let empty = {
    maxpoint = InterpolationPoint.empty;
    minpoint = InterpolationPoint.empty;
    midpoint = InterpolationPoint.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "maxpoint" (InterpolationPoint.render_content v)) x.maxpoint;
      (fun v -> GapiJson.render_object "minpoint" (InterpolationPoint.render_content v)) x.minpoint;
      (fun v -> GapiJson.render_object "midpoint" (InterpolationPoint.render_content v)) x.midpoint;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "maxpoint"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        InterpolationPoint.parse
        InterpolationPoint.empty
        (fun v -> { x with maxpoint = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "minpoint"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        InterpolationPoint.parse
        InterpolationPoint.empty
        (fun v -> { x with minpoint = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "midpoint"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        InterpolationPoint.parse
        InterpolationPoint.empty
        (fun v -> { x with midpoint = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.GradientRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TextRotation =
struct
  type t = {
    angle : int;
    vertical : bool;
    
  }
  
  let angle = {
    GapiLens.get = (fun x -> x.angle);
    GapiLens.set = (fun v x -> { x with angle = v });
  }
  let vertical = {
    GapiLens.get = (fun x -> x.vertical);
    GapiLens.set = (fun v x -> { x with vertical = v });
  }
  
  let empty = {
    angle = 0;
    vertical = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "angle" x.angle;
      GapiJson.render_bool_value "vertical" x.vertical;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "angle"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with angle = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "vertical"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with vertical = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TextRotation.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module NumberFormat =
struct
  type t = {
    _type : string;
    pattern : string;
    
  }
  
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let pattern = {
    GapiLens.get = (fun x -> x.pattern);
    GapiLens.set = (fun v x -> { x with pattern = v });
  }
  
  let empty = {
    _type = "";
    pattern = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "pattern" x.pattern;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pattern"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pattern = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.NumberFormat.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Padding =
struct
  type t = {
    top : int;
    bottom : int;
    right : int;
    left : int;
    
  }
  
  let top = {
    GapiLens.get = (fun x -> x.top);
    GapiLens.set = (fun v x -> { x with top = v });
  }
  let bottom = {
    GapiLens.get = (fun x -> x.bottom);
    GapiLens.set = (fun v x -> { x with bottom = v });
  }
  let right = {
    GapiLens.get = (fun x -> x.right);
    GapiLens.set = (fun v x -> { x with right = v });
  }
  let left = {
    GapiLens.get = (fun x -> x.left);
    GapiLens.set = (fun v x -> { x with left = v });
  }
  
  let empty = {
    top = 0;
    bottom = 0;
    right = 0;
    left = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "top" x.top;
      GapiJson.render_int_value "bottom" x.bottom;
      GapiJson.render_int_value "right" x.right;
      GapiJson.render_int_value "left" x.left;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "top"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with top = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bottom"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bottom = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "right"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with right = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "left"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with left = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Padding.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Border =
struct
  type t = {
    style : string;
    color : Color.t;
    width : int;
    colorStyle : ColorStyle.t;
    
  }
  
  let style = {
    GapiLens.get = (fun x -> x.style);
    GapiLens.set = (fun v x -> { x with style = v });
  }
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  let width = {
    GapiLens.get = (fun x -> x.width);
    GapiLens.set = (fun v x -> { x with width = v });
  }
  let colorStyle = {
    GapiLens.get = (fun x -> x.colorStyle);
    GapiLens.set = (fun v x -> { x with colorStyle = v });
  }
  
  let empty = {
    style = "";
    color = Color.empty;
    width = 0;
    colorStyle = ColorStyle.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "style" x.style;
      (fun v -> GapiJson.render_object "color" (Color.render_content v)) x.color;
      GapiJson.render_int_value "width" x.width;
      (fun v -> GapiJson.render_object "colorStyle" (ColorStyle.render_content v)) x.colorStyle;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "style"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with style = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with width = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "colorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with colorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Border.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Borders =
struct
  type t = {
    bottom : Border.t;
    right : Border.t;
    left : Border.t;
    top : Border.t;
    
  }
  
  let bottom = {
    GapiLens.get = (fun x -> x.bottom);
    GapiLens.set = (fun v x -> { x with bottom = v });
  }
  let right = {
    GapiLens.get = (fun x -> x.right);
    GapiLens.set = (fun v x -> { x with right = v });
  }
  let left = {
    GapiLens.get = (fun x -> x.left);
    GapiLens.set = (fun v x -> { x with left = v });
  }
  let top = {
    GapiLens.get = (fun x -> x.top);
    GapiLens.set = (fun v x -> { x with top = v });
  }
  
  let empty = {
    bottom = Border.empty;
    right = Border.empty;
    left = Border.empty;
    top = Border.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "bottom" (Border.render_content v)) x.bottom;
      (fun v -> GapiJson.render_object "right" (Border.render_content v)) x.right;
      (fun v -> GapiJson.render_object "left" (Border.render_content v)) x.left;
      (fun v -> GapiJson.render_object "top" (Border.render_content v)) x.top;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bottom"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with bottom = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "right"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with right = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "left"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with left = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "top"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with top = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Borders.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CellFormat =
struct
  type t = {
    padding : Padding.t;
    wrapStrategy : string;
    backgroundColorStyle : ColorStyle.t;
    textFormat : TextFormat.t;
    numberFormat : NumberFormat.t;
    horizontalAlignment : string;
    textDirection : string;
    backgroundColor : Color.t;
    textRotation : TextRotation.t;
    borders : Borders.t;
    hyperlinkDisplayType : string;
    verticalAlignment : string;
    
  }
  
  let padding = {
    GapiLens.get = (fun x -> x.padding);
    GapiLens.set = (fun v x -> { x with padding = v });
  }
  let wrapStrategy = {
    GapiLens.get = (fun x -> x.wrapStrategy);
    GapiLens.set = (fun v x -> { x with wrapStrategy = v });
  }
  let backgroundColorStyle = {
    GapiLens.get = (fun x -> x.backgroundColorStyle);
    GapiLens.set = (fun v x -> { x with backgroundColorStyle = v });
  }
  let textFormat = {
    GapiLens.get = (fun x -> x.textFormat);
    GapiLens.set = (fun v x -> { x with textFormat = v });
  }
  let numberFormat = {
    GapiLens.get = (fun x -> x.numberFormat);
    GapiLens.set = (fun v x -> { x with numberFormat = v });
  }
  let horizontalAlignment = {
    GapiLens.get = (fun x -> x.horizontalAlignment);
    GapiLens.set = (fun v x -> { x with horizontalAlignment = v });
  }
  let textDirection = {
    GapiLens.get = (fun x -> x.textDirection);
    GapiLens.set = (fun v x -> { x with textDirection = v });
  }
  let backgroundColor = {
    GapiLens.get = (fun x -> x.backgroundColor);
    GapiLens.set = (fun v x -> { x with backgroundColor = v });
  }
  let textRotation = {
    GapiLens.get = (fun x -> x.textRotation);
    GapiLens.set = (fun v x -> { x with textRotation = v });
  }
  let borders = {
    GapiLens.get = (fun x -> x.borders);
    GapiLens.set = (fun v x -> { x with borders = v });
  }
  let hyperlinkDisplayType = {
    GapiLens.get = (fun x -> x.hyperlinkDisplayType);
    GapiLens.set = (fun v x -> { x with hyperlinkDisplayType = v });
  }
  let verticalAlignment = {
    GapiLens.get = (fun x -> x.verticalAlignment);
    GapiLens.set = (fun v x -> { x with verticalAlignment = v });
  }
  
  let empty = {
    padding = Padding.empty;
    wrapStrategy = "";
    backgroundColorStyle = ColorStyle.empty;
    textFormat = TextFormat.empty;
    numberFormat = NumberFormat.empty;
    horizontalAlignment = "";
    textDirection = "";
    backgroundColor = Color.empty;
    textRotation = TextRotation.empty;
    borders = Borders.empty;
    hyperlinkDisplayType = "";
    verticalAlignment = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "padding" (Padding.render_content v)) x.padding;
      GapiJson.render_string_value "wrapStrategy" x.wrapStrategy;
      (fun v -> GapiJson.render_object "backgroundColorStyle" (ColorStyle.render_content v)) x.backgroundColorStyle;
      (fun v -> GapiJson.render_object "textFormat" (TextFormat.render_content v)) x.textFormat;
      (fun v -> GapiJson.render_object "numberFormat" (NumberFormat.render_content v)) x.numberFormat;
      GapiJson.render_string_value "horizontalAlignment" x.horizontalAlignment;
      GapiJson.render_string_value "textDirection" x.textDirection;
      (fun v -> GapiJson.render_object "backgroundColor" (Color.render_content v)) x.backgroundColor;
      (fun v -> GapiJson.render_object "textRotation" (TextRotation.render_content v)) x.textRotation;
      (fun v -> GapiJson.render_object "borders" (Borders.render_content v)) x.borders;
      GapiJson.render_string_value "hyperlinkDisplayType" x.hyperlinkDisplayType;
      GapiJson.render_string_value "verticalAlignment" x.verticalAlignment;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "padding"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Padding.parse
        Padding.empty
        (fun v -> { x with padding = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "wrapStrategy"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with wrapStrategy = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColorStyle"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with backgroundColorStyle = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with textFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "numberFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        NumberFormat.parse
        NumberFormat.empty
        (fun v -> { x with numberFormat = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "horizontalAlignment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with horizontalAlignment = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "textDirection"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with textDirection = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundColor"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Color.parse
        Color.empty
        (fun v -> { x with backgroundColor = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textRotation"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextRotation.parse
        TextRotation.empty
        (fun v -> { x with textRotation = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "borders"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Borders.parse
        Borders.empty
        (fun v -> { x with borders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hyperlinkDisplayType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hyperlinkDisplayType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verticalAlignment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with verticalAlignment = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CellFormat.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BooleanRule =
struct
  type t = {
    condition : BooleanCondition.t;
    format : CellFormat.t;
    
  }
  
  let condition = {
    GapiLens.get = (fun x -> x.condition);
    GapiLens.set = (fun v x -> { x with condition = v });
  }
  let format = {
    GapiLens.get = (fun x -> x.format);
    GapiLens.set = (fun v x -> { x with format = v });
  }
  
  let empty = {
    condition = BooleanCondition.empty;
    format = CellFormat.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "condition" (BooleanCondition.render_content v)) x.condition;
      (fun v -> GapiJson.render_object "format" (CellFormat.render_content v)) x.format;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "condition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BooleanCondition.parse
        BooleanCondition.empty
        (fun v -> { x with condition = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "format"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CellFormat.parse
        CellFormat.empty
        (fun v -> { x with format = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BooleanRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ConditionalFormatRule =
struct
  type t = {
    ranges : GridRange.t list;
    gradientRule : GradientRule.t;
    booleanRule : BooleanRule.t;
    
  }
  
  let ranges = {
    GapiLens.get = (fun x -> x.ranges);
    GapiLens.set = (fun v x -> { x with ranges = v });
  }
  let gradientRule = {
    GapiLens.get = (fun x -> x.gradientRule);
    GapiLens.set = (fun v x -> { x with gradientRule = v });
  }
  let booleanRule = {
    GapiLens.get = (fun x -> x.booleanRule);
    GapiLens.set = (fun v x -> { x with booleanRule = v });
  }
  
  let empty = {
    ranges = [];
    gradientRule = GradientRule.empty;
    booleanRule = BooleanRule.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "ranges" GridRange.render x.ranges;
      (fun v -> GapiJson.render_object "gradientRule" (GradientRule.render_content v)) x.gradientRule;
      (fun v -> GapiJson.render_object "booleanRule" (BooleanRule.render_content v)) x.booleanRule;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "ranges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              GridRange.parse
              GridRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ConditionalFormatRule.parse.parse_collection" e x')
        GridRange.empty
        (fun v -> { x with ranges = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "gradientRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GradientRule.parse
        GradientRule.empty
        (fun v -> { x with gradientRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "booleanRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BooleanRule.parse
        BooleanRule.empty
        (fun v -> { x with booleanRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ConditionalFormatRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteConditionalFormatRuleResponse =
struct
  type t = {
    rule : ConditionalFormatRule.t;
    
  }
  
  let rule = {
    GapiLens.get = (fun x -> x.rule);
    GapiLens.set = (fun v x -> { x with rule = v });
  }
  
  let empty = {
    rule = ConditionalFormatRule.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "rule" (ConditionalFormatRule.render_content v)) x.rule;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ConditionalFormatRule.parse
        ConditionalFormatRule.empty
        (fun v -> { x with rule = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteConditionalFormatRuleResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DuplicateFilterViewResponse =
struct
  type t = {
    filter : FilterView.t;
    
  }
  
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  
  let empty = {
    filter = FilterView.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "filter" (FilterView.render_content v)) x.filter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterView.parse
        FilterView.empty
        (fun v -> { x with filter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DuplicateFilterViewResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddProtectedRangeResponse =
struct
  type t = {
    protectedRange : ProtectedRange.t;
    
  }
  
  let protectedRange = {
    GapiLens.get = (fun x -> x.protectedRange);
    GapiLens.set = (fun v x -> { x with protectedRange = v });
  }
  
  let empty = {
    protectedRange = ProtectedRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "protectedRange" (ProtectedRange.render_content v)) x.protectedRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "protectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ProtectedRange.parse
        ProtectedRange.empty
        (fun v -> { x with protectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddProtectedRangeResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CreateDeveloperMetadataResponse =
struct
  type t = {
    developerMetadata : DeveloperMetadata.t;
    
  }
  
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  
  let empty = {
    developerMetadata = DeveloperMetadata.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "developerMetadata" (DeveloperMetadata.render_content v)) x.developerMetadata;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadata.parse
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CreateDeveloperMetadataResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateEmbeddedObjectPositionResponse =
struct
  type t = {
    position : EmbeddedObjectPosition.t;
    
  }
  
  let position = {
    GapiLens.get = (fun x -> x.position);
    GapiLens.set = (fun v x -> { x with position = v });
  }
  
  let empty = {
    position = EmbeddedObjectPosition.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "position" (EmbeddedObjectPosition.render_content v)) x.position;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "position"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedObjectPosition.parse
        EmbeddedObjectPosition.empty
        (fun v -> { x with position = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateEmbeddedObjectPositionResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDeveloperMetadataResponse =
struct
  type t = {
    deletedDeveloperMetadata : DeveloperMetadata.t list;
    
  }
  
  let deletedDeveloperMetadata = {
    GapiLens.get = (fun x -> x.deletedDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with deletedDeveloperMetadata = v });
  }
  
  let empty = {
    deletedDeveloperMetadata = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "deletedDeveloperMetadata" DeveloperMetadata.render x.deletedDeveloperMetadata;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deletedDeveloperMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DeveloperMetadata.parse
              DeveloperMetadata.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DeleteDeveloperMetadataResponse.parse.parse_collection" e x')
        DeveloperMetadata.empty
        (fun v -> { x with deletedDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDeveloperMetadataResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateConditionalFormatRuleResponse =
struct
  type t = {
    newIndex : int;
    newRule : ConditionalFormatRule.t;
    oldRule : ConditionalFormatRule.t;
    oldIndex : int;
    
  }
  
  let newIndex = {
    GapiLens.get = (fun x -> x.newIndex);
    GapiLens.set = (fun v x -> { x with newIndex = v });
  }
  let newRule = {
    GapiLens.get = (fun x -> x.newRule);
    GapiLens.set = (fun v x -> { x with newRule = v });
  }
  let oldRule = {
    GapiLens.get = (fun x -> x.oldRule);
    GapiLens.set = (fun v x -> { x with oldRule = v });
  }
  let oldIndex = {
    GapiLens.get = (fun x -> x.oldIndex);
    GapiLens.set = (fun v x -> { x with oldIndex = v });
  }
  
  let empty = {
    newIndex = 0;
    newRule = ConditionalFormatRule.empty;
    oldRule = ConditionalFormatRule.empty;
    oldIndex = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "newIndex" x.newIndex;
      (fun v -> GapiJson.render_object "newRule" (ConditionalFormatRule.render_content v)) x.newRule;
      (fun v -> GapiJson.render_object "oldRule" (ConditionalFormatRule.render_content v)) x.oldRule;
      GapiJson.render_int_value "oldIndex" x.oldIndex;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with newIndex = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "newRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ConditionalFormatRule.parse
        ConditionalFormatRule.empty
        (fun v -> { x with newRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "oldRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ConditionalFormatRule.parse
        ConditionalFormatRule.empty
        (fun v -> { x with oldRule = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "oldIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with oldIndex = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateConditionalFormatRuleResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDuplicatesResponse =
struct
  type t = {
    duplicatesRemovedCount : int;
    
  }
  
  let duplicatesRemovedCount = {
    GapiLens.get = (fun x -> x.duplicatesRemovedCount);
    GapiLens.set = (fun v x -> { x with duplicatesRemovedCount = v });
  }
  
  let empty = {
    duplicatesRemovedCount = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "duplicatesRemovedCount" x.duplicatesRemovedCount;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "duplicatesRemovedCount"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with duplicatesRemovedCount = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDuplicatesResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDimensionGroupResponse =
struct
  type t = {
    dimensionGroups : DimensionGroup.t list;
    
  }
  
  let dimensionGroups = {
    GapiLens.get = (fun x -> x.dimensionGroups);
    GapiLens.set = (fun v x -> { x with dimensionGroups = v });
  }
  
  let empty = {
    dimensionGroups = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "dimensionGroups" DimensionGroup.render x.dimensionGroups;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dimensionGroups"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionGroup.parse
              DimensionGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DeleteDimensionGroupResponse.parse.parse_collection" e x')
        DimensionGroup.empty
        (fun v -> { x with dimensionGroups = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDimensionGroupResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DuplicateSheetResponse =
struct
  type t = {
    properties : SheetProperties.t;
    
  }
  
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  
  let empty = {
    properties = SheetProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "properties" (SheetProperties.render_content v)) x.properties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SheetProperties.parse
        SheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DuplicateSheetResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Response =
struct
  type t = {
    addFilterView : AddFilterViewResponse.t;
    updateDataSource : UpdateDataSourceResponse.t;
    deleteConditionalFormatRule : DeleteConditionalFormatRuleResponse.t;
    addNamedRange : AddNamedRangeResponse.t;
    duplicateFilterView : DuplicateFilterViewResponse.t;
    refreshDataSource : RefreshDataSourceResponse.t;
    addProtectedRange : AddProtectedRangeResponse.t;
    findReplace : FindReplaceResponse.t;
    createDeveloperMetadata : CreateDeveloperMetadataResponse.t;
    addSlicer : AddSlicerResponse.t;
    updateEmbeddedObjectPosition : UpdateEmbeddedObjectPositionResponse.t;
    addDataSource : AddDataSourceResponse.t;
    deleteDeveloperMetadata : DeleteDeveloperMetadataResponse.t;
    addBanding : AddBandingResponse.t;
    updateConditionalFormatRule : UpdateConditionalFormatRuleResponse.t;
    addDimensionGroup : AddDimensionGroupResponse.t;
    updateDeveloperMetadata : UpdateDeveloperMetadataResponse.t;
    trimWhitespace : TrimWhitespaceResponse.t;
    deleteDuplicates : DeleteDuplicatesResponse.t;
    addChart : AddChartResponse.t;
    deleteDimensionGroup : DeleteDimensionGroupResponse.t;
    addSheet : AddSheetResponse.t;
    duplicateSheet : DuplicateSheetResponse.t;
    
  }
  
  let addFilterView = {
    GapiLens.get = (fun x -> x.addFilterView);
    GapiLens.set = (fun v x -> { x with addFilterView = v });
  }
  let updateDataSource = {
    GapiLens.get = (fun x -> x.updateDataSource);
    GapiLens.set = (fun v x -> { x with updateDataSource = v });
  }
  let deleteConditionalFormatRule = {
    GapiLens.get = (fun x -> x.deleteConditionalFormatRule);
    GapiLens.set = (fun v x -> { x with deleteConditionalFormatRule = v });
  }
  let addNamedRange = {
    GapiLens.get = (fun x -> x.addNamedRange);
    GapiLens.set = (fun v x -> { x with addNamedRange = v });
  }
  let duplicateFilterView = {
    GapiLens.get = (fun x -> x.duplicateFilterView);
    GapiLens.set = (fun v x -> { x with duplicateFilterView = v });
  }
  let refreshDataSource = {
    GapiLens.get = (fun x -> x.refreshDataSource);
    GapiLens.set = (fun v x -> { x with refreshDataSource = v });
  }
  let addProtectedRange = {
    GapiLens.get = (fun x -> x.addProtectedRange);
    GapiLens.set = (fun v x -> { x with addProtectedRange = v });
  }
  let findReplace = {
    GapiLens.get = (fun x -> x.findReplace);
    GapiLens.set = (fun v x -> { x with findReplace = v });
  }
  let createDeveloperMetadata = {
    GapiLens.get = (fun x -> x.createDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with createDeveloperMetadata = v });
  }
  let addSlicer = {
    GapiLens.get = (fun x -> x.addSlicer);
    GapiLens.set = (fun v x -> { x with addSlicer = v });
  }
  let updateEmbeddedObjectPosition = {
    GapiLens.get = (fun x -> x.updateEmbeddedObjectPosition);
    GapiLens.set = (fun v x -> { x with updateEmbeddedObjectPosition = v });
  }
  let addDataSource = {
    GapiLens.get = (fun x -> x.addDataSource);
    GapiLens.set = (fun v x -> { x with addDataSource = v });
  }
  let deleteDeveloperMetadata = {
    GapiLens.get = (fun x -> x.deleteDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with deleteDeveloperMetadata = v });
  }
  let addBanding = {
    GapiLens.get = (fun x -> x.addBanding);
    GapiLens.set = (fun v x -> { x with addBanding = v });
  }
  let updateConditionalFormatRule = {
    GapiLens.get = (fun x -> x.updateConditionalFormatRule);
    GapiLens.set = (fun v x -> { x with updateConditionalFormatRule = v });
  }
  let addDimensionGroup = {
    GapiLens.get = (fun x -> x.addDimensionGroup);
    GapiLens.set = (fun v x -> { x with addDimensionGroup = v });
  }
  let updateDeveloperMetadata = {
    GapiLens.get = (fun x -> x.updateDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with updateDeveloperMetadata = v });
  }
  let trimWhitespace = {
    GapiLens.get = (fun x -> x.trimWhitespace);
    GapiLens.set = (fun v x -> { x with trimWhitespace = v });
  }
  let deleteDuplicates = {
    GapiLens.get = (fun x -> x.deleteDuplicates);
    GapiLens.set = (fun v x -> { x with deleteDuplicates = v });
  }
  let addChart = {
    GapiLens.get = (fun x -> x.addChart);
    GapiLens.set = (fun v x -> { x with addChart = v });
  }
  let deleteDimensionGroup = {
    GapiLens.get = (fun x -> x.deleteDimensionGroup);
    GapiLens.set = (fun v x -> { x with deleteDimensionGroup = v });
  }
  let addSheet = {
    GapiLens.get = (fun x -> x.addSheet);
    GapiLens.set = (fun v x -> { x with addSheet = v });
  }
  let duplicateSheet = {
    GapiLens.get = (fun x -> x.duplicateSheet);
    GapiLens.set = (fun v x -> { x with duplicateSheet = v });
  }
  
  let empty = {
    addFilterView = AddFilterViewResponse.empty;
    updateDataSource = UpdateDataSourceResponse.empty;
    deleteConditionalFormatRule = DeleteConditionalFormatRuleResponse.empty;
    addNamedRange = AddNamedRangeResponse.empty;
    duplicateFilterView = DuplicateFilterViewResponse.empty;
    refreshDataSource = RefreshDataSourceResponse.empty;
    addProtectedRange = AddProtectedRangeResponse.empty;
    findReplace = FindReplaceResponse.empty;
    createDeveloperMetadata = CreateDeveloperMetadataResponse.empty;
    addSlicer = AddSlicerResponse.empty;
    updateEmbeddedObjectPosition = UpdateEmbeddedObjectPositionResponse.empty;
    addDataSource = AddDataSourceResponse.empty;
    deleteDeveloperMetadata = DeleteDeveloperMetadataResponse.empty;
    addBanding = AddBandingResponse.empty;
    updateConditionalFormatRule = UpdateConditionalFormatRuleResponse.empty;
    addDimensionGroup = AddDimensionGroupResponse.empty;
    updateDeveloperMetadata = UpdateDeveloperMetadataResponse.empty;
    trimWhitespace = TrimWhitespaceResponse.empty;
    deleteDuplicates = DeleteDuplicatesResponse.empty;
    addChart = AddChartResponse.empty;
    deleteDimensionGroup = DeleteDimensionGroupResponse.empty;
    addSheet = AddSheetResponse.empty;
    duplicateSheet = DuplicateSheetResponse.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "addFilterView" (AddFilterViewResponse.render_content v)) x.addFilterView;
      (fun v -> GapiJson.render_object "updateDataSource" (UpdateDataSourceResponse.render_content v)) x.updateDataSource;
      (fun v -> GapiJson.render_object "deleteConditionalFormatRule" (DeleteConditionalFormatRuleResponse.render_content v)) x.deleteConditionalFormatRule;
      (fun v -> GapiJson.render_object "addNamedRange" (AddNamedRangeResponse.render_content v)) x.addNamedRange;
      (fun v -> GapiJson.render_object "duplicateFilterView" (DuplicateFilterViewResponse.render_content v)) x.duplicateFilterView;
      (fun v -> GapiJson.render_object "refreshDataSource" (RefreshDataSourceResponse.render_content v)) x.refreshDataSource;
      (fun v -> GapiJson.render_object "addProtectedRange" (AddProtectedRangeResponse.render_content v)) x.addProtectedRange;
      (fun v -> GapiJson.render_object "findReplace" (FindReplaceResponse.render_content v)) x.findReplace;
      (fun v -> GapiJson.render_object "createDeveloperMetadata" (CreateDeveloperMetadataResponse.render_content v)) x.createDeveloperMetadata;
      (fun v -> GapiJson.render_object "addSlicer" (AddSlicerResponse.render_content v)) x.addSlicer;
      (fun v -> GapiJson.render_object "updateEmbeddedObjectPosition" (UpdateEmbeddedObjectPositionResponse.render_content v)) x.updateEmbeddedObjectPosition;
      (fun v -> GapiJson.render_object "addDataSource" (AddDataSourceResponse.render_content v)) x.addDataSource;
      (fun v -> GapiJson.render_object "deleteDeveloperMetadata" (DeleteDeveloperMetadataResponse.render_content v)) x.deleteDeveloperMetadata;
      (fun v -> GapiJson.render_object "addBanding" (AddBandingResponse.render_content v)) x.addBanding;
      (fun v -> GapiJson.render_object "updateConditionalFormatRule" (UpdateConditionalFormatRuleResponse.render_content v)) x.updateConditionalFormatRule;
      (fun v -> GapiJson.render_object "addDimensionGroup" (AddDimensionGroupResponse.render_content v)) x.addDimensionGroup;
      (fun v -> GapiJson.render_object "updateDeveloperMetadata" (UpdateDeveloperMetadataResponse.render_content v)) x.updateDeveloperMetadata;
      (fun v -> GapiJson.render_object "trimWhitespace" (TrimWhitespaceResponse.render_content v)) x.trimWhitespace;
      (fun v -> GapiJson.render_object "deleteDuplicates" (DeleteDuplicatesResponse.render_content v)) x.deleteDuplicates;
      (fun v -> GapiJson.render_object "addChart" (AddChartResponse.render_content v)) x.addChart;
      (fun v -> GapiJson.render_object "deleteDimensionGroup" (DeleteDimensionGroupResponse.render_content v)) x.deleteDimensionGroup;
      (fun v -> GapiJson.render_object "addSheet" (AddSheetResponse.render_content v)) x.addSheet;
      (fun v -> GapiJson.render_object "duplicateSheet" (DuplicateSheetResponse.render_content v)) x.duplicateSheet;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addFilterView"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddFilterViewResponse.parse
        AddFilterViewResponse.empty
        (fun v -> { x with addFilterView = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateDataSourceResponse.parse
        UpdateDataSourceResponse.empty
        (fun v -> { x with updateDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteConditionalFormatRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteConditionalFormatRuleResponse.parse
        DeleteConditionalFormatRuleResponse.empty
        (fun v -> { x with deleteConditionalFormatRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addNamedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddNamedRangeResponse.parse
        AddNamedRangeResponse.empty
        (fun v -> { x with addNamedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "duplicateFilterView"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DuplicateFilterViewResponse.parse
        DuplicateFilterViewResponse.empty
        (fun v -> { x with duplicateFilterView = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "refreshDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RefreshDataSourceResponse.parse
        RefreshDataSourceResponse.empty
        (fun v -> { x with refreshDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addProtectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddProtectedRangeResponse.parse
        AddProtectedRangeResponse.empty
        (fun v -> { x with addProtectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "findReplace"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FindReplaceResponse.parse
        FindReplaceResponse.empty
        (fun v -> { x with findReplace = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "createDeveloperMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CreateDeveloperMetadataResponse.parse
        CreateDeveloperMetadataResponse.empty
        (fun v -> { x with createDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addSlicer"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddSlicerResponse.parse
        AddSlicerResponse.empty
        (fun v -> { x with addSlicer = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateEmbeddedObjectPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateEmbeddedObjectPositionResponse.parse
        UpdateEmbeddedObjectPositionResponse.empty
        (fun v -> { x with updateEmbeddedObjectPosition = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddDataSourceResponse.parse
        AddDataSourceResponse.empty
        (fun v -> { x with addDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDeveloperMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDeveloperMetadataResponse.parse
        DeleteDeveloperMetadataResponse.empty
        (fun v -> { x with deleteDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addBanding"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddBandingResponse.parse
        AddBandingResponse.empty
        (fun v -> { x with addBanding = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateConditionalFormatRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateConditionalFormatRuleResponse.parse
        UpdateConditionalFormatRuleResponse.empty
        (fun v -> { x with updateConditionalFormatRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addDimensionGroup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddDimensionGroupResponse.parse
        AddDimensionGroupResponse.empty
        (fun v -> { x with addDimensionGroup = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateDeveloperMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateDeveloperMetadataResponse.parse
        UpdateDeveloperMetadataResponse.empty
        (fun v -> { x with updateDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "trimWhitespace"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TrimWhitespaceResponse.parse
        TrimWhitespaceResponse.empty
        (fun v -> { x with trimWhitespace = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDuplicates"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDuplicatesResponse.parse
        DeleteDuplicatesResponse.empty
        (fun v -> { x with deleteDuplicates = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddChartResponse.parse
        AddChartResponse.empty
        (fun v -> { x with addChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDimensionGroup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDimensionGroupResponse.parse
        DeleteDimensionGroupResponse.empty
        (fun v -> { x with deleteDimensionGroup = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addSheet"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddSheetResponse.parse
        AddSheetResponse.empty
        (fun v -> { x with addSheet = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "duplicateSheet"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DuplicateSheetResponse.parse
        DuplicateSheetResponse.empty
        (fun v -> { x with duplicateSheet = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Response.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DimensionProperties =
struct
  type t = {
    pixelSize : int;
    hiddenByUser : bool;
    developerMetadata : DeveloperMetadata.t list;
    hiddenByFilter : bool;
    dataSourceColumnReference : DataSourceColumnReference.t;
    
  }
  
  let pixelSize = {
    GapiLens.get = (fun x -> x.pixelSize);
    GapiLens.set = (fun v x -> { x with pixelSize = v });
  }
  let hiddenByUser = {
    GapiLens.get = (fun x -> x.hiddenByUser);
    GapiLens.set = (fun v x -> { x with hiddenByUser = v });
  }
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  let hiddenByFilter = {
    GapiLens.get = (fun x -> x.hiddenByFilter);
    GapiLens.set = (fun v x -> { x with hiddenByFilter = v });
  }
  let dataSourceColumnReference = {
    GapiLens.get = (fun x -> x.dataSourceColumnReference);
    GapiLens.set = (fun v x -> { x with dataSourceColumnReference = v });
  }
  
  let empty = {
    pixelSize = 0;
    hiddenByUser = false;
    developerMetadata = [];
    hiddenByFilter = false;
    dataSourceColumnReference = DataSourceColumnReference.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "pixelSize" x.pixelSize;
      GapiJson.render_bool_value "hiddenByUser" x.hiddenByUser;
      GapiJson.render_array "developerMetadata" DeveloperMetadata.render x.developerMetadata;
      GapiJson.render_bool_value "hiddenByFilter" x.hiddenByFilter;
      (fun v -> GapiJson.render_object "dataSourceColumnReference" (DataSourceColumnReference.render_content v)) x.dataSourceColumnReference;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pixelSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with pixelSize = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hiddenByUser"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hiddenByUser = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DeveloperMetadata.parse
              DeveloperMetadata.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DimensionProperties.parse.parse_collection" e x')
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hiddenByFilter"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hiddenByFilter = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceColumnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with dataSourceColumnReference = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DimensionProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceFormula =
struct
  type t = {
    dataSourceId : string;
    dataExecutionStatus : DataExecutionStatus.t;
    
  }
  
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  
  let empty = {
    dataSourceId = "";
    dataExecutionStatus = DataExecutionStatus.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceFormula.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotValue =
struct
  type t = {
    dataSourceColumnReference : DataSourceColumnReference.t;
    sourceColumnOffset : int;
    calculatedDisplayType : string;
    name : string;
    formula : string;
    summarizeFunction : string;
    
  }
  
  let dataSourceColumnReference = {
    GapiLens.get = (fun x -> x.dataSourceColumnReference);
    GapiLens.set = (fun v x -> { x with dataSourceColumnReference = v });
  }
  let sourceColumnOffset = {
    GapiLens.get = (fun x -> x.sourceColumnOffset);
    GapiLens.set = (fun v x -> { x with sourceColumnOffset = v });
  }
  let calculatedDisplayType = {
    GapiLens.get = (fun x -> x.calculatedDisplayType);
    GapiLens.set = (fun v x -> { x with calculatedDisplayType = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let formula = {
    GapiLens.get = (fun x -> x.formula);
    GapiLens.set = (fun v x -> { x with formula = v });
  }
  let summarizeFunction = {
    GapiLens.get = (fun x -> x.summarizeFunction);
    GapiLens.set = (fun v x -> { x with summarizeFunction = v });
  }
  
  let empty = {
    dataSourceColumnReference = DataSourceColumnReference.empty;
    sourceColumnOffset = 0;
    calculatedDisplayType = "";
    name = "";
    formula = "";
    summarizeFunction = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataSourceColumnReference" (DataSourceColumnReference.render_content v)) x.dataSourceColumnReference;
      GapiJson.render_int_value "sourceColumnOffset" x.sourceColumnOffset;
      GapiJson.render_string_value "calculatedDisplayType" x.calculatedDisplayType;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "formula" x.formula;
      GapiJson.render_string_value "summarizeFunction" x.summarizeFunction;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceColumnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with dataSourceColumnReference = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sourceColumnOffset"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sourceColumnOffset = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "calculatedDisplayType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with calculatedDisplayType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formula"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with formula = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summarizeFunction"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with summarizeFunction = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotValue.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ErrorValue =
struct
  type t = {
    message : string;
    _type : string;
    
  }
  
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    message = "";
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "message" x.message;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "message"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with message = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ErrorValue.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ExtendedValue =
struct
  type t = {
    boolValue : bool;
    numberValue : float;
    formulaValue : string;
    errorValue : ErrorValue.t;
    stringValue : string;
    
  }
  
  let boolValue = {
    GapiLens.get = (fun x -> x.boolValue);
    GapiLens.set = (fun v x -> { x with boolValue = v });
  }
  let numberValue = {
    GapiLens.get = (fun x -> x.numberValue);
    GapiLens.set = (fun v x -> { x with numberValue = v });
  }
  let formulaValue = {
    GapiLens.get = (fun x -> x.formulaValue);
    GapiLens.set = (fun v x -> { x with formulaValue = v });
  }
  let errorValue = {
    GapiLens.get = (fun x -> x.errorValue);
    GapiLens.set = (fun v x -> { x with errorValue = v });
  }
  let stringValue = {
    GapiLens.get = (fun x -> x.stringValue);
    GapiLens.set = (fun v x -> { x with stringValue = v });
  }
  
  let empty = {
    boolValue = false;
    numberValue = 0.0;
    formulaValue = "";
    errorValue = ErrorValue.empty;
    stringValue = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "boolValue" x.boolValue;
      GapiJson.render_float_value "numberValue" x.numberValue;
      GapiJson.render_string_value "formulaValue" x.formulaValue;
      (fun v -> GapiJson.render_object "errorValue" (ErrorValue.render_content v)) x.errorValue;
      GapiJson.render_string_value "stringValue" x.stringValue;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "boolValue"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with boolValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "numberValue"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with numberValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "numberValue"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with numberValue = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formulaValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with formulaValue = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errorValue"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ErrorValue.parse
        ErrorValue.empty
        (fun v -> { x with errorValue = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "stringValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with stringValue = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ExtendedValue.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotGroupValueMetadata =
struct
  type t = {
    value : ExtendedValue.t;
    collapsed : bool;
    
  }
  
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  let collapsed = {
    GapiLens.get = (fun x -> x.collapsed);
    GapiLens.set = (fun v x -> { x with collapsed = v });
  }
  
  let empty = {
    value = ExtendedValue.empty;
    collapsed = false;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "value" (ExtendedValue.render_content v)) x.value;
      GapiJson.render_bool_value "collapsed" x.collapsed;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "value"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ExtendedValue.parse
        ExtendedValue.empty
        (fun v -> { x with value = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "collapsed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with collapsed = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotGroupValueMetadata.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotGroupSortValueBucket =
struct
  type t = {
    buckets : ExtendedValue.t list;
    valuesIndex : int;
    
  }
  
  let buckets = {
    GapiLens.get = (fun x -> x.buckets);
    GapiLens.set = (fun v x -> { x with buckets = v });
  }
  let valuesIndex = {
    GapiLens.get = (fun x -> x.valuesIndex);
    GapiLens.set = (fun v x -> { x with valuesIndex = v });
  }
  
  let empty = {
    buckets = [];
    valuesIndex = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "buckets" ExtendedValue.render x.buckets;
      GapiJson.render_int_value "valuesIndex" x.valuesIndex;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "buckets"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ExtendedValue.parse
              ExtendedValue.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotGroupSortValueBucket.parse.parse_collection" e x')
        ExtendedValue.empty
        (fun v -> { x with buckets = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "valuesIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with valuesIndex = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotGroupSortValueBucket.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DateTimeRule =
struct
  type t = {
    _type : string;
    
  }
  
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DateTimeRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistogramRule =
struct
  type t = {
    interval : float;
    _end : float;
    start : float;
    
  }
  
  let interval = {
    GapiLens.get = (fun x -> x.interval);
    GapiLens.set = (fun v x -> { x with interval = v });
  }
  let _end = {
    GapiLens.get = (fun x -> x._end);
    GapiLens.set = (fun v x -> { x with _end = v });
  }
  let start = {
    GapiLens.get = (fun x -> x.start);
    GapiLens.set = (fun v x -> { x with start = v });
  }
  
  let empty = {
    interval = 0.0;
    _end = 0.0;
    start = 0.0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_float_value "interval" x.interval;
      GapiJson.render_float_value "end" x._end;
      GapiJson.render_float_value "start" x.start;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "interval"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with interval = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "interval"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with interval = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "end"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with _end = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "end"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with _end = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "start"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with start = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "start"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with start = float_of_int v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.HistogramRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ManualRuleGroup =
struct
  type t = {
    groupName : ExtendedValue.t;
    items : ExtendedValue.t list;
    
  }
  
  let groupName = {
    GapiLens.get = (fun x -> x.groupName);
    GapiLens.set = (fun v x -> { x with groupName = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  
  let empty = {
    groupName = ExtendedValue.empty;
    items = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "groupName" (ExtendedValue.render_content v)) x.groupName;
      GapiJson.render_array "items" ExtendedValue.render x.items;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groupName"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ExtendedValue.parse
        ExtendedValue.empty
        (fun v -> { x with groupName = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ExtendedValue.parse
              ExtendedValue.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ManualRuleGroup.parse.parse_collection" e x')
        ExtendedValue.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ManualRuleGroup.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ManualRule =
struct
  type t = {
    groups : ManualRuleGroup.t list;
    
  }
  
  let groups = {
    GapiLens.get = (fun x -> x.groups);
    GapiLens.set = (fun v x -> { x with groups = v });
  }
  
  let empty = {
    groups = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "groups" ManualRuleGroup.render x.groups;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groups"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ManualRuleGroup.parse
              ManualRuleGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.ManualRule.parse.parse_collection" e x')
        ManualRuleGroup.empty
        (fun v -> { x with groups = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ManualRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotGroupRule =
struct
  type t = {
    histogramRule : HistogramRule.t;
    dateTimeRule : DateTimeRule.t;
    manualRule : ManualRule.t;
    
  }
  
  let histogramRule = {
    GapiLens.get = (fun x -> x.histogramRule);
    GapiLens.set = (fun v x -> { x with histogramRule = v });
  }
  let dateTimeRule = {
    GapiLens.get = (fun x -> x.dateTimeRule);
    GapiLens.set = (fun v x -> { x with dateTimeRule = v });
  }
  let manualRule = {
    GapiLens.get = (fun x -> x.manualRule);
    GapiLens.set = (fun v x -> { x with manualRule = v });
  }
  
  let empty = {
    histogramRule = HistogramRule.empty;
    dateTimeRule = DateTimeRule.empty;
    manualRule = ManualRule.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "histogramRule" (HistogramRule.render_content v)) x.histogramRule;
      (fun v -> GapiJson.render_object "dateTimeRule" (DateTimeRule.render_content v)) x.dateTimeRule;
      (fun v -> GapiJson.render_object "manualRule" (ManualRule.render_content v)) x.manualRule;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "histogramRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        HistogramRule.parse
        HistogramRule.empty
        (fun v -> { x with histogramRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dateTimeRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DateTimeRule.parse
        DateTimeRule.empty
        (fun v -> { x with dateTimeRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "manualRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ManualRule.parse
        ManualRule.empty
        (fun v -> { x with manualRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotGroupRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotGroupLimit =
struct
  type t = {
    countLimit : int;
    applyOrder : int;
    
  }
  
  let countLimit = {
    GapiLens.get = (fun x -> x.countLimit);
    GapiLens.set = (fun v x -> { x with countLimit = v });
  }
  let applyOrder = {
    GapiLens.get = (fun x -> x.applyOrder);
    GapiLens.set = (fun v x -> { x with applyOrder = v });
  }
  
  let empty = {
    countLimit = 0;
    applyOrder = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "countLimit" x.countLimit;
      GapiJson.render_int_value "applyOrder" x.applyOrder;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "countLimit"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with countLimit = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "applyOrder"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with applyOrder = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotGroupLimit.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotGroup =
struct
  type t = {
    sortOrder : string;
    repeatHeadings : bool;
    groupRule : PivotGroupRule.t;
    sourceColumnOffset : int;
    showTotals : bool;
    label : string;
    valueBucket : PivotGroupSortValueBucket.t;
    dataSourceColumnReference : DataSourceColumnReference.t;
    valueMetadata : PivotGroupValueMetadata.t list;
    groupLimit : PivotGroupLimit.t;
    
  }
  
  let sortOrder = {
    GapiLens.get = (fun x -> x.sortOrder);
    GapiLens.set = (fun v x -> { x with sortOrder = v });
  }
  let repeatHeadings = {
    GapiLens.get = (fun x -> x.repeatHeadings);
    GapiLens.set = (fun v x -> { x with repeatHeadings = v });
  }
  let groupRule = {
    GapiLens.get = (fun x -> x.groupRule);
    GapiLens.set = (fun v x -> { x with groupRule = v });
  }
  let sourceColumnOffset = {
    GapiLens.get = (fun x -> x.sourceColumnOffset);
    GapiLens.set = (fun v x -> { x with sourceColumnOffset = v });
  }
  let showTotals = {
    GapiLens.get = (fun x -> x.showTotals);
    GapiLens.set = (fun v x -> { x with showTotals = v });
  }
  let label = {
    GapiLens.get = (fun x -> x.label);
    GapiLens.set = (fun v x -> { x with label = v });
  }
  let valueBucket = {
    GapiLens.get = (fun x -> x.valueBucket);
    GapiLens.set = (fun v x -> { x with valueBucket = v });
  }
  let dataSourceColumnReference = {
    GapiLens.get = (fun x -> x.dataSourceColumnReference);
    GapiLens.set = (fun v x -> { x with dataSourceColumnReference = v });
  }
  let valueMetadata = {
    GapiLens.get = (fun x -> x.valueMetadata);
    GapiLens.set = (fun v x -> { x with valueMetadata = v });
  }
  let groupLimit = {
    GapiLens.get = (fun x -> x.groupLimit);
    GapiLens.set = (fun v x -> { x with groupLimit = v });
  }
  
  let empty = {
    sortOrder = "";
    repeatHeadings = false;
    groupRule = PivotGroupRule.empty;
    sourceColumnOffset = 0;
    showTotals = false;
    label = "";
    valueBucket = PivotGroupSortValueBucket.empty;
    dataSourceColumnReference = DataSourceColumnReference.empty;
    valueMetadata = [];
    groupLimit = PivotGroupLimit.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "sortOrder" x.sortOrder;
      GapiJson.render_bool_value "repeatHeadings" x.repeatHeadings;
      (fun v -> GapiJson.render_object "groupRule" (PivotGroupRule.render_content v)) x.groupRule;
      GapiJson.render_int_value "sourceColumnOffset" x.sourceColumnOffset;
      GapiJson.render_bool_value "showTotals" x.showTotals;
      GapiJson.render_string_value "label" x.label;
      (fun v -> GapiJson.render_object "valueBucket" (PivotGroupSortValueBucket.render_content v)) x.valueBucket;
      (fun v -> GapiJson.render_object "dataSourceColumnReference" (DataSourceColumnReference.render_content v)) x.dataSourceColumnReference;
      GapiJson.render_array "valueMetadata" PivotGroupValueMetadata.render x.valueMetadata;
      (fun v -> GapiJson.render_object "groupLimit" (PivotGroupLimit.render_content v)) x.groupLimit;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sortOrder"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sortOrder = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "repeatHeadings"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with repeatHeadings = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groupRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PivotGroupRule.parse
        PivotGroupRule.empty
        (fun v -> { x with groupRule = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sourceColumnOffset"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sourceColumnOffset = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "showTotals"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with showTotals = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "label"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with label = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "valueBucket"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PivotGroupSortValueBucket.parse
        PivotGroupSortValueBucket.empty
        (fun v -> { x with valueBucket = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceColumnReference"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceColumnReference.parse
        DataSourceColumnReference.empty
        (fun v -> { x with dataSourceColumnReference = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "valueMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PivotGroupValueMetadata.parse
              PivotGroupValueMetadata.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotGroup.parse.parse_collection" e x')
        PivotGroupValueMetadata.empty
        (fun v -> { x with valueMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groupLimit"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PivotGroupLimit.parse
        PivotGroupLimit.empty
        (fun v -> { x with groupLimit = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotGroup.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PivotTable =
struct
  type t = {
    dataSourceId : string;
    dataExecutionStatus : DataExecutionStatus.t;
    filterSpecs : PivotFilterSpec.t list;
    rows : PivotGroup.t list;
    valueLayout : string;
    criteria : (string * PivotFilterCriteria.t) list;
    values : PivotValue.t list;
    source : GridRange.t;
    columns : PivotGroup.t list;
    
  }
  
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  let filterSpecs = {
    GapiLens.get = (fun x -> x.filterSpecs);
    GapiLens.set = (fun v x -> { x with filterSpecs = v });
  }
  let rows = {
    GapiLens.get = (fun x -> x.rows);
    GapiLens.set = (fun v x -> { x with rows = v });
  }
  let valueLayout = {
    GapiLens.get = (fun x -> x.valueLayout);
    GapiLens.set = (fun v x -> { x with valueLayout = v });
  }
  let criteria = {
    GapiLens.get = (fun x -> x.criteria);
    GapiLens.set = (fun v x -> { x with criteria = v });
  }
  let values = {
    GapiLens.get = (fun x -> x.values);
    GapiLens.set = (fun v x -> { x with values = v });
  }
  let source = {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }
  let columns = {
    GapiLens.get = (fun x -> x.columns);
    GapiLens.set = (fun v x -> { x with columns = v });
  }
  
  let empty = {
    dataSourceId = "";
    dataExecutionStatus = DataExecutionStatus.empty;
    filterSpecs = [];
    rows = [];
    valueLayout = "";
    criteria = [];
    values = [];
    source = GridRange.empty;
    columns = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      GapiJson.render_array "filterSpecs" PivotFilterSpec.render x.filterSpecs;
      GapiJson.render_array "rows" PivotGroup.render x.rows;
      GapiJson.render_string_value "valueLayout" x.valueLayout;
      GapiJson.render_collection "criteria" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (PivotFilterCriteria.render_content v)) v) x.criteria;
      GapiJson.render_array "values" PivotValue.render x.values;
      (fun v -> GapiJson.render_object "source" (GridRange.render_content v)) x.source;
      GapiJson.render_array "columns" PivotGroup.render x.columns;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PivotFilterSpec.parse
              PivotFilterSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotTable.parse.parse_collection" e x')
        PivotFilterSpec.empty
        (fun v -> { x with filterSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rows"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PivotGroup.parse
              PivotGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotTable.parse.parse_collection" e x')
        PivotGroup.empty
        (fun v -> { x with rows = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "valueLayout"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with valueLayout = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "criteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PivotFilterCriteria.parse
              PivotFilterCriteria.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotTable.parse.parse_dictionary" e x')
        ("", PivotFilterCriteria.empty)
        (fun v -> { x with criteria = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "values"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PivotValue.parse
              PivotValue.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotTable.parse.parse_collection" e x')
        PivotValue.empty
        (fun v -> { x with values = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "source"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with source = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columns"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PivotGroup.parse
              PivotGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.PivotTable.parse.parse_collection" e x')
        PivotGroup.empty
        (fun v -> { x with columns = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PivotTable.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataValidationRule =
struct
  type t = {
    inputMessage : string;
    showCustomUi : bool;
    strict : bool;
    condition : BooleanCondition.t;
    
  }
  
  let inputMessage = {
    GapiLens.get = (fun x -> x.inputMessage);
    GapiLens.set = (fun v x -> { x with inputMessage = v });
  }
  let showCustomUi = {
    GapiLens.get = (fun x -> x.showCustomUi);
    GapiLens.set = (fun v x -> { x with showCustomUi = v });
  }
  let strict = {
    GapiLens.get = (fun x -> x.strict);
    GapiLens.set = (fun v x -> { x with strict = v });
  }
  let condition = {
    GapiLens.get = (fun x -> x.condition);
    GapiLens.set = (fun v x -> { x with condition = v });
  }
  
  let empty = {
    inputMessage = "";
    showCustomUi = false;
    strict = false;
    condition = BooleanCondition.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "inputMessage" x.inputMessage;
      GapiJson.render_bool_value "showCustomUi" x.showCustomUi;
      GapiJson.render_bool_value "strict" x.strict;
      (fun v -> GapiJson.render_object "condition" (BooleanCondition.render_content v)) x.condition;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "inputMessage"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with inputMessage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "showCustomUi"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with showCustomUi = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "strict"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with strict = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "condition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BooleanCondition.parse
        BooleanCondition.empty
        (fun v -> { x with condition = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataValidationRule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceTable =
struct
  type t = {
    columns : DataSourceColumnReference.t list;
    filterSpecs : FilterSpec.t list;
    sortSpecs : SortSpec.t list;
    dataExecutionStatus : DataExecutionStatus.t;
    rowLimit : int;
    columnSelectionType : string;
    dataSourceId : string;
    
  }
  
  let columns = {
    GapiLens.get = (fun x -> x.columns);
    GapiLens.set = (fun v x -> { x with columns = v });
  }
  let filterSpecs = {
    GapiLens.get = (fun x -> x.filterSpecs);
    GapiLens.set = (fun v x -> { x with filterSpecs = v });
  }
  let sortSpecs = {
    GapiLens.get = (fun x -> x.sortSpecs);
    GapiLens.set = (fun v x -> { x with sortSpecs = v });
  }
  let dataExecutionStatus = {
    GapiLens.get = (fun x -> x.dataExecutionStatus);
    GapiLens.set = (fun v x -> { x with dataExecutionStatus = v });
  }
  let rowLimit = {
    GapiLens.get = (fun x -> x.rowLimit);
    GapiLens.set = (fun v x -> { x with rowLimit = v });
  }
  let columnSelectionType = {
    GapiLens.get = (fun x -> x.columnSelectionType);
    GapiLens.set = (fun v x -> { x with columnSelectionType = v });
  }
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  
  let empty = {
    columns = [];
    filterSpecs = [];
    sortSpecs = [];
    dataExecutionStatus = DataExecutionStatus.empty;
    rowLimit = 0;
    columnSelectionType = "";
    dataSourceId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "columns" DataSourceColumnReference.render x.columns;
      GapiJson.render_array "filterSpecs" FilterSpec.render x.filterSpecs;
      GapiJson.render_array "sortSpecs" SortSpec.render x.sortSpecs;
      (fun v -> GapiJson.render_object "dataExecutionStatus" (DataExecutionStatus.render_content v)) x.dataExecutionStatus;
      GapiJson.render_int_value "rowLimit" x.rowLimit;
      GapiJson.render_string_value "columnSelectionType" x.columnSelectionType;
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columns"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceColumnReference.parse
              DataSourceColumnReference.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceTable.parse.parse_collection" e x')
        DataSourceColumnReference.empty
        (fun v -> { x with columns = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterSpec.parse
              FilterSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceTable.parse.parse_collection" e x')
        FilterSpec.empty
        (fun v -> { x with filterSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sortSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SortSpec.parse
              SortSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceTable.parse.parse_collection" e x')
        SortSpec.empty
        (fun v -> { x with sortSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataExecutionStatus"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataExecutionStatus.parse
        DataExecutionStatus.empty
        (fun v -> { x with dataExecutionStatus = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rowLimit"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with rowLimit = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "columnSelectionType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with columnSelectionType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceTable.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TextFormatRun =
struct
  type t = {
    startIndex : int;
    format : TextFormat.t;
    
  }
  
  let startIndex = {
    GapiLens.get = (fun x -> x.startIndex);
    GapiLens.set = (fun v x -> { x with startIndex = v });
  }
  let format = {
    GapiLens.get = (fun x -> x.format);
    GapiLens.set = (fun v x -> { x with format = v });
  }
  
  let empty = {
    startIndex = 0;
    format = TextFormat.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "startIndex" x.startIndex;
      (fun v -> GapiJson.render_object "format" (TextFormat.render_content v)) x.format;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startIndex = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "format"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextFormat.parse
        TextFormat.empty
        (fun v -> { x with format = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TextFormatRun.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CellData =
struct
  type t = {
    note : string;
    userEnteredValue : ExtendedValue.t;
    userEnteredFormat : CellFormat.t;
    effectiveValue : ExtendedValue.t;
    formattedValue : string;
    hyperlink : string;
    effectiveFormat : CellFormat.t;
    dataValidation : DataValidationRule.t;
    pivotTable : PivotTable.t;
    dataSourceTable : DataSourceTable.t;
    dataSourceFormula : DataSourceFormula.t;
    textFormatRuns : TextFormatRun.t list;
    
  }
  
  let note = {
    GapiLens.get = (fun x -> x.note);
    GapiLens.set = (fun v x -> { x with note = v });
  }
  let userEnteredValue = {
    GapiLens.get = (fun x -> x.userEnteredValue);
    GapiLens.set = (fun v x -> { x with userEnteredValue = v });
  }
  let userEnteredFormat = {
    GapiLens.get = (fun x -> x.userEnteredFormat);
    GapiLens.set = (fun v x -> { x with userEnteredFormat = v });
  }
  let effectiveValue = {
    GapiLens.get = (fun x -> x.effectiveValue);
    GapiLens.set = (fun v x -> { x with effectiveValue = v });
  }
  let formattedValue = {
    GapiLens.get = (fun x -> x.formattedValue);
    GapiLens.set = (fun v x -> { x with formattedValue = v });
  }
  let hyperlink = {
    GapiLens.get = (fun x -> x.hyperlink);
    GapiLens.set = (fun v x -> { x with hyperlink = v });
  }
  let effectiveFormat = {
    GapiLens.get = (fun x -> x.effectiveFormat);
    GapiLens.set = (fun v x -> { x with effectiveFormat = v });
  }
  let dataValidation = {
    GapiLens.get = (fun x -> x.dataValidation);
    GapiLens.set = (fun v x -> { x with dataValidation = v });
  }
  let pivotTable = {
    GapiLens.get = (fun x -> x.pivotTable);
    GapiLens.set = (fun v x -> { x with pivotTable = v });
  }
  let dataSourceTable = {
    GapiLens.get = (fun x -> x.dataSourceTable);
    GapiLens.set = (fun v x -> { x with dataSourceTable = v });
  }
  let dataSourceFormula = {
    GapiLens.get = (fun x -> x.dataSourceFormula);
    GapiLens.set = (fun v x -> { x with dataSourceFormula = v });
  }
  let textFormatRuns = {
    GapiLens.get = (fun x -> x.textFormatRuns);
    GapiLens.set = (fun v x -> { x with textFormatRuns = v });
  }
  
  let empty = {
    note = "";
    userEnteredValue = ExtendedValue.empty;
    userEnteredFormat = CellFormat.empty;
    effectiveValue = ExtendedValue.empty;
    formattedValue = "";
    hyperlink = "";
    effectiveFormat = CellFormat.empty;
    dataValidation = DataValidationRule.empty;
    pivotTable = PivotTable.empty;
    dataSourceTable = DataSourceTable.empty;
    dataSourceFormula = DataSourceFormula.empty;
    textFormatRuns = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "note" x.note;
      (fun v -> GapiJson.render_object "userEnteredValue" (ExtendedValue.render_content v)) x.userEnteredValue;
      (fun v -> GapiJson.render_object "userEnteredFormat" (CellFormat.render_content v)) x.userEnteredFormat;
      (fun v -> GapiJson.render_object "effectiveValue" (ExtendedValue.render_content v)) x.effectiveValue;
      GapiJson.render_string_value "formattedValue" x.formattedValue;
      GapiJson.render_string_value "hyperlink" x.hyperlink;
      (fun v -> GapiJson.render_object "effectiveFormat" (CellFormat.render_content v)) x.effectiveFormat;
      (fun v -> GapiJson.render_object "dataValidation" (DataValidationRule.render_content v)) x.dataValidation;
      (fun v -> GapiJson.render_object "pivotTable" (PivotTable.render_content v)) x.pivotTable;
      (fun v -> GapiJson.render_object "dataSourceTable" (DataSourceTable.render_content v)) x.dataSourceTable;
      (fun v -> GapiJson.render_object "dataSourceFormula" (DataSourceFormula.render_content v)) x.dataSourceFormula;
      GapiJson.render_array "textFormatRuns" TextFormatRun.render x.textFormatRuns;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "note"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with note = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "userEnteredValue"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ExtendedValue.parse
        ExtendedValue.empty
        (fun v -> { x with userEnteredValue = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "userEnteredFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CellFormat.parse
        CellFormat.empty
        (fun v -> { x with userEnteredFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "effectiveValue"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ExtendedValue.parse
        ExtendedValue.empty
        (fun v -> { x with effectiveValue = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "formattedValue"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with formattedValue = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hyperlink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hyperlink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "effectiveFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CellFormat.parse
        CellFormat.empty
        (fun v -> { x with effectiveFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataValidation"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataValidationRule.parse
        DataValidationRule.empty
        (fun v -> { x with dataValidation = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pivotTable"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PivotTable.parse
        PivotTable.empty
        (fun v -> { x with pivotTable = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceTable"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceTable.parse
        DataSourceTable.empty
        (fun v -> { x with dataSourceTable = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceFormula"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceFormula.parse
        DataSourceFormula.empty
        (fun v -> { x with dataSourceFormula = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textFormatRuns"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              TextFormatRun.parse
              TextFormatRun.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.CellData.parse.parse_collection" e x')
        TextFormatRun.empty
        (fun v -> { x with textFormatRuns = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CellData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RowData =
struct
  type t = {
    values : CellData.t list;
    
  }
  
  let values = {
    GapiLens.get = (fun x -> x.values);
    GapiLens.set = (fun v x -> { x with values = v });
  }
  
  let empty = {
    values = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "values" CellData.render x.values;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "values"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              CellData.parse
              CellData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.RowData.parse.parse_collection" e x')
        CellData.empty
        (fun v -> { x with values = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.RowData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GridData =
struct
  type t = {
    rowData : RowData.t list;
    columnMetadata : DimensionProperties.t list;
    startRow : int;
    rowMetadata : DimensionProperties.t list;
    startColumn : int;
    
  }
  
  let rowData = {
    GapiLens.get = (fun x -> x.rowData);
    GapiLens.set = (fun v x -> { x with rowData = v });
  }
  let columnMetadata = {
    GapiLens.get = (fun x -> x.columnMetadata);
    GapiLens.set = (fun v x -> { x with columnMetadata = v });
  }
  let startRow = {
    GapiLens.get = (fun x -> x.startRow);
    GapiLens.set = (fun v x -> { x with startRow = v });
  }
  let rowMetadata = {
    GapiLens.get = (fun x -> x.rowMetadata);
    GapiLens.set = (fun v x -> { x with rowMetadata = v });
  }
  let startColumn = {
    GapiLens.get = (fun x -> x.startColumn);
    GapiLens.set = (fun v x -> { x with startColumn = v });
  }
  
  let empty = {
    rowData = [];
    columnMetadata = [];
    startRow = 0;
    rowMetadata = [];
    startColumn = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "rowData" RowData.render x.rowData;
      GapiJson.render_array "columnMetadata" DimensionProperties.render x.columnMetadata;
      GapiJson.render_int_value "startRow" x.startRow;
      GapiJson.render_array "rowMetadata" DimensionProperties.render x.rowMetadata;
      GapiJson.render_int_value "startColumn" x.startColumn;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rowData"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RowData.parse
              RowData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.GridData.parse.parse_collection" e x')
        RowData.empty
        (fun v -> { x with rowData = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionProperties.parse
              DimensionProperties.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.GridData.parse.parse_collection" e x')
        DimensionProperties.empty
        (fun v -> { x with columnMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startRow"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startRow = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rowMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionProperties.parse
              DimensionProperties.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.GridData.parse.parse_collection" e x')
        DimensionProperties.empty
        (fun v -> { x with rowMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startColumn"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with startColumn = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.GridData.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BasicFilter =
struct
  type t = {
    filterSpecs : FilterSpec.t list;
    sortSpecs : SortSpec.t list;
    range : GridRange.t;
    criteria : (string * FilterCriteria.t) list;
    
  }
  
  let filterSpecs = {
    GapiLens.get = (fun x -> x.filterSpecs);
    GapiLens.set = (fun v x -> { x with filterSpecs = v });
  }
  let sortSpecs = {
    GapiLens.get = (fun x -> x.sortSpecs);
    GapiLens.set = (fun v x -> { x with sortSpecs = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let criteria = {
    GapiLens.get = (fun x -> x.criteria);
    GapiLens.set = (fun v x -> { x with criteria = v });
  }
  
  let empty = {
    filterSpecs = [];
    sortSpecs = [];
    range = GridRange.empty;
    criteria = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "filterSpecs" FilterSpec.render x.filterSpecs;
      GapiJson.render_array "sortSpecs" SortSpec.render x.sortSpecs;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_collection "criteria" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (FilterCriteria.render_content v)) v) x.criteria;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterSpec.parse
              FilterSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicFilter.parse.parse_collection" e x')
        FilterSpec.empty
        (fun v -> { x with filterSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sortSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SortSpec.parse
              SortSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicFilter.parse.parse_collection" e x')
        SortSpec.empty
        (fun v -> { x with sortSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "criteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterCriteria.parse
              FilterCriteria.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BasicFilter.parse.parse_dictionary" e x')
        ("", FilterCriteria.empty)
        (fun v -> { x with criteria = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BasicFilter.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Sheet =
struct
  type t = {
    basicFilter : BasicFilter.t;
    filterViews : FilterView.t list;
    slicers : Slicer.t list;
    conditionalFormats : ConditionalFormatRule.t list;
    merges : GridRange.t list;
    data : GridData.t list;
    developerMetadata : DeveloperMetadata.t list;
    charts : EmbeddedChart.t list;
    bandedRanges : BandedRange.t list;
    protectedRanges : ProtectedRange.t list;
    columnGroups : DimensionGroup.t list;
    rowGroups : DimensionGroup.t list;
    properties : SheetProperties.t;
    
  }
  
  let basicFilter = {
    GapiLens.get = (fun x -> x.basicFilter);
    GapiLens.set = (fun v x -> { x with basicFilter = v });
  }
  let filterViews = {
    GapiLens.get = (fun x -> x.filterViews);
    GapiLens.set = (fun v x -> { x with filterViews = v });
  }
  let slicers = {
    GapiLens.get = (fun x -> x.slicers);
    GapiLens.set = (fun v x -> { x with slicers = v });
  }
  let conditionalFormats = {
    GapiLens.get = (fun x -> x.conditionalFormats);
    GapiLens.set = (fun v x -> { x with conditionalFormats = v });
  }
  let merges = {
    GapiLens.get = (fun x -> x.merges);
    GapiLens.set = (fun v x -> { x with merges = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  let charts = {
    GapiLens.get = (fun x -> x.charts);
    GapiLens.set = (fun v x -> { x with charts = v });
  }
  let bandedRanges = {
    GapiLens.get = (fun x -> x.bandedRanges);
    GapiLens.set = (fun v x -> { x with bandedRanges = v });
  }
  let protectedRanges = {
    GapiLens.get = (fun x -> x.protectedRanges);
    GapiLens.set = (fun v x -> { x with protectedRanges = v });
  }
  let columnGroups = {
    GapiLens.get = (fun x -> x.columnGroups);
    GapiLens.set = (fun v x -> { x with columnGroups = v });
  }
  let rowGroups = {
    GapiLens.get = (fun x -> x.rowGroups);
    GapiLens.set = (fun v x -> { x with rowGroups = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  
  let empty = {
    basicFilter = BasicFilter.empty;
    filterViews = [];
    slicers = [];
    conditionalFormats = [];
    merges = [];
    data = [];
    developerMetadata = [];
    charts = [];
    bandedRanges = [];
    protectedRanges = [];
    columnGroups = [];
    rowGroups = [];
    properties = SheetProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "basicFilter" (BasicFilter.render_content v)) x.basicFilter;
      GapiJson.render_array "filterViews" FilterView.render x.filterViews;
      GapiJson.render_array "slicers" Slicer.render x.slicers;
      GapiJson.render_array "conditionalFormats" ConditionalFormatRule.render x.conditionalFormats;
      GapiJson.render_array "merges" GridRange.render x.merges;
      GapiJson.render_array "data" GridData.render x.data;
      GapiJson.render_array "developerMetadata" DeveloperMetadata.render x.developerMetadata;
      GapiJson.render_array "charts" EmbeddedChart.render x.charts;
      GapiJson.render_array "bandedRanges" BandedRange.render x.bandedRanges;
      GapiJson.render_array "protectedRanges" ProtectedRange.render x.protectedRanges;
      GapiJson.render_array "columnGroups" DimensionGroup.render x.columnGroups;
      GapiJson.render_array "rowGroups" DimensionGroup.render x.rowGroups;
      (fun v -> GapiJson.render_object "properties" (SheetProperties.render_content v)) x.properties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "basicFilter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BasicFilter.parse
        BasicFilter.empty
        (fun v -> { x with basicFilter = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filterViews"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FilterView.parse
              FilterView.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        FilterView.empty
        (fun v -> { x with filterViews = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "slicers"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Slicer.parse Slicer.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        Slicer.empty
        (fun v -> { x with slicers = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "conditionalFormats"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ConditionalFormatRule.parse
              ConditionalFormatRule.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        ConditionalFormatRule.empty
        (fun v -> { x with conditionalFormats = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "merges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              GridRange.parse
              GridRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        GridRange.empty
        (fun v -> { x with merges = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              GridData.parse
              GridData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        GridData.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DeveloperMetadata.parse
              DeveloperMetadata.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "charts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              EmbeddedChart.parse
              EmbeddedChart.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        EmbeddedChart.empty
        (fun v -> { x with charts = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bandedRanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              BandedRange.parse
              BandedRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        BandedRange.empty
        (fun v -> { x with bandedRanges = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "protectedRanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ProtectedRange.parse
              ProtectedRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        ProtectedRange.empty
        (fun v -> { x with protectedRanges = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnGroups"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionGroup.parse
              DimensionGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        DimensionGroup.empty
        (fun v -> { x with columnGroups = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rowGroups"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionGroup.parse
              DimensionGroup.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse.parse_collection" e x')
        DimensionGroup.empty
        (fun v -> { x with rowGroups = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SheetProperties.parse
        SheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Sheet.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TimeOfDay =
struct
  type t = {
    nanos : int;
    minutes : int;
    hours : int;
    seconds : int;
    
  }
  
  let nanos = {
    GapiLens.get = (fun x -> x.nanos);
    GapiLens.set = (fun v x -> { x with nanos = v });
  }
  let minutes = {
    GapiLens.get = (fun x -> x.minutes);
    GapiLens.set = (fun v x -> { x with minutes = v });
  }
  let hours = {
    GapiLens.get = (fun x -> x.hours);
    GapiLens.set = (fun v x -> { x with hours = v });
  }
  let seconds = {
    GapiLens.get = (fun x -> x.seconds);
    GapiLens.set = (fun v x -> { x with seconds = v });
  }
  
  let empty = {
    nanos = 0;
    minutes = 0;
    hours = 0;
    seconds = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "nanos" x.nanos;
      GapiJson.render_int_value "minutes" x.minutes;
      GapiJson.render_int_value "hours" x.hours;
      GapiJson.render_int_value "seconds" x.seconds;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nanos"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with nanos = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minutes"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with minutes = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hours"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with hours = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "seconds"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with seconds = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TimeOfDay.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceRefreshDailySchedule =
struct
  type t = {
    startTime : TimeOfDay.t;
    
  }
  
  let startTime = {
    GapiLens.get = (fun x -> x.startTime);
    GapiLens.set = (fun v x -> { x with startTime = v });
  }
  
  let empty = {
    startTime = TimeOfDay.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "startTime" (TimeOfDay.render_content v)) x.startTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "startTime"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TimeOfDay.parse
        TimeOfDay.empty
        (fun v -> { x with startTime = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceRefreshDailySchedule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Interval =
struct
  type t = {
    endTime : string;
    startTime : string;
    
  }
  
  let endTime = {
    GapiLens.get = (fun x -> x.endTime);
    GapiLens.set = (fun v x -> { x with endTime = v });
  }
  let startTime = {
    GapiLens.get = (fun x -> x.startTime);
    GapiLens.set = (fun v x -> { x with startTime = v });
  }
  
  let empty = {
    endTime = "";
    startTime = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "endTime" x.endTime;
      GapiJson.render_string_value "startTime" x.startTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with endTime = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with startTime = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Interval.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceRefreshWeeklySchedule =
struct
  type t = {
    daysOfWeek : string list;
    startTime : TimeOfDay.t;
    
  }
  
  let daysOfWeek = {
    GapiLens.get = (fun x -> x.daysOfWeek);
    GapiLens.set = (fun v x -> { x with daysOfWeek = v });
  }
  let startTime = {
    GapiLens.get = (fun x -> x.startTime);
    GapiLens.set = (fun v x -> { x with startTime = v });
  }
  
  let empty = {
    daysOfWeek = [];
    startTime = TimeOfDay.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "daysOfWeek" (GapiJson.render_string_value "") x.daysOfWeek;
      (fun v -> GapiJson.render_object "startTime" (TimeOfDay.render_content v)) x.startTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "daysOfWeek"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceRefreshWeeklySchedule.parse.parse_collection" e x')
        ""
        (fun v -> { x with daysOfWeek = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "startTime"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TimeOfDay.parse
        TimeOfDay.empty
        (fun v -> { x with startTime = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceRefreshWeeklySchedule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceRefreshMonthlySchedule =
struct
  type t = {
    startTime : TimeOfDay.t;
    daysOfMonth : int list;
    
  }
  
  let startTime = {
    GapiLens.get = (fun x -> x.startTime);
    GapiLens.set = (fun v x -> { x with startTime = v });
  }
  let daysOfMonth = {
    GapiLens.get = (fun x -> x.daysOfMonth);
    GapiLens.set = (fun v x -> { x with daysOfMonth = v });
  }
  
  let empty = {
    startTime = TimeOfDay.empty;
    daysOfMonth = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "startTime" (TimeOfDay.render_content v)) x.startTime;
      GapiJson.render_array "daysOfMonth" (GapiJson.render_int_value "") x.daysOfMonth;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "startTime"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TimeOfDay.parse
        TimeOfDay.empty
        (fun v -> { x with startTime = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "daysOfMonth"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `Int v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceRefreshMonthlySchedule.parse.parse_collection" e x')
        0
        (fun v -> { x with daysOfMonth = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceRefreshMonthlySchedule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceRefreshSchedule =
struct
  type t = {
    nextRun : Interval.t;
    weeklySchedule : DataSourceRefreshWeeklySchedule.t;
    dailySchedule : DataSourceRefreshDailySchedule.t;
    monthlySchedule : DataSourceRefreshMonthlySchedule.t;
    refreshScope : string;
    enabled : bool;
    
  }
  
  let nextRun = {
    GapiLens.get = (fun x -> x.nextRun);
    GapiLens.set = (fun v x -> { x with nextRun = v });
  }
  let weeklySchedule = {
    GapiLens.get = (fun x -> x.weeklySchedule);
    GapiLens.set = (fun v x -> { x with weeklySchedule = v });
  }
  let dailySchedule = {
    GapiLens.get = (fun x -> x.dailySchedule);
    GapiLens.set = (fun v x -> { x with dailySchedule = v });
  }
  let monthlySchedule = {
    GapiLens.get = (fun x -> x.monthlySchedule);
    GapiLens.set = (fun v x -> { x with monthlySchedule = v });
  }
  let refreshScope = {
    GapiLens.get = (fun x -> x.refreshScope);
    GapiLens.set = (fun v x -> { x with refreshScope = v });
  }
  let enabled = {
    GapiLens.get = (fun x -> x.enabled);
    GapiLens.set = (fun v x -> { x with enabled = v });
  }
  
  let empty = {
    nextRun = Interval.empty;
    weeklySchedule = DataSourceRefreshWeeklySchedule.empty;
    dailySchedule = DataSourceRefreshDailySchedule.empty;
    monthlySchedule = DataSourceRefreshMonthlySchedule.empty;
    refreshScope = "";
    enabled = false;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "nextRun" (Interval.render_content v)) x.nextRun;
      (fun v -> GapiJson.render_object "weeklySchedule" (DataSourceRefreshWeeklySchedule.render_content v)) x.weeklySchedule;
      (fun v -> GapiJson.render_object "dailySchedule" (DataSourceRefreshDailySchedule.render_content v)) x.dailySchedule;
      (fun v -> GapiJson.render_object "monthlySchedule" (DataSourceRefreshMonthlySchedule.render_content v)) x.monthlySchedule;
      GapiJson.render_string_value "refreshScope" x.refreshScope;
      GapiJson.render_bool_value "enabled" x.enabled;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "nextRun"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Interval.parse
        Interval.empty
        (fun v -> { x with nextRun = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "weeklySchedule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceRefreshWeeklySchedule.parse
        DataSourceRefreshWeeklySchedule.empty
        (fun v -> { x with weeklySchedule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dailySchedule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceRefreshDailySchedule.parse
        DataSourceRefreshDailySchedule.empty
        (fun v -> { x with dailySchedule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "monthlySchedule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceRefreshMonthlySchedule.parse
        DataSourceRefreshMonthlySchedule.empty
        (fun v -> { x with monthlySchedule = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "refreshScope"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with refreshScope = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "enabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with enabled = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceRefreshSchedule.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ThemeColorPair =
struct
  type t = {
    color : ColorStyle.t;
    colorType : string;
    
  }
  
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
  }
  let colorType = {
    GapiLens.get = (fun x -> x.colorType);
    GapiLens.set = (fun v x -> { x with colorType = v });
  }
  
  let empty = {
    color = ColorStyle.empty;
    colorType = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "color" (ColorStyle.render_content v)) x.color;
      GapiJson.render_string_value "colorType" x.colorType;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ColorStyle.parse
        ColorStyle.empty
        (fun v -> { x with color = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorType = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ThemeColorPair.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SpreadsheetTheme =
struct
  type t = {
    themeColors : ThemeColorPair.t list;
    primaryFontFamily : string;
    
  }
  
  let themeColors = {
    GapiLens.get = (fun x -> x.themeColors);
    GapiLens.set = (fun v x -> { x with themeColors = v });
  }
  let primaryFontFamily = {
    GapiLens.get = (fun x -> x.primaryFontFamily);
    GapiLens.set = (fun v x -> { x with primaryFontFamily = v });
  }
  
  let empty = {
    themeColors = [];
    primaryFontFamily = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "themeColors" ThemeColorPair.render x.themeColors;
      GapiJson.render_string_value "primaryFontFamily" x.primaryFontFamily;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "themeColors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ThemeColorPair.parse
              ThemeColorPair.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.SpreadsheetTheme.parse.parse_collection" e x')
        ThemeColorPair.empty
        (fun v -> { x with themeColors = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "primaryFontFamily"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with primaryFontFamily = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SpreadsheetTheme.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module IterativeCalculationSettings =
struct
  type t = {
    convergenceThreshold : float;
    maxIterations : int;
    
  }
  
  let convergenceThreshold = {
    GapiLens.get = (fun x -> x.convergenceThreshold);
    GapiLens.set = (fun v x -> { x with convergenceThreshold = v });
  }
  let maxIterations = {
    GapiLens.get = (fun x -> x.maxIterations);
    GapiLens.set = (fun v x -> { x with maxIterations = v });
  }
  
  let empty = {
    convergenceThreshold = 0.0;
    maxIterations = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_float_value "convergenceThreshold" x.convergenceThreshold;
      GapiJson.render_int_value "maxIterations" x.maxIterations;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "convergenceThreshold"; data_type = GapiJson.Scalar },
        `Float v) ->
      { x with convergenceThreshold = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "convergenceThreshold"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with convergenceThreshold = float_of_int v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxIterations"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with maxIterations = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.IterativeCalculationSettings.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SpreadsheetProperties =
struct
  type t = {
    locale : string;
    spreadsheetTheme : SpreadsheetTheme.t;
    iterativeCalculationSettings : IterativeCalculationSettings.t;
    title : string;
    timeZone : string;
    autoRecalc : string;
    defaultFormat : CellFormat.t;
    
  }
  
  let locale = {
    GapiLens.get = (fun x -> x.locale);
    GapiLens.set = (fun v x -> { x with locale = v });
  }
  let spreadsheetTheme = {
    GapiLens.get = (fun x -> x.spreadsheetTheme);
    GapiLens.set = (fun v x -> { x with spreadsheetTheme = v });
  }
  let iterativeCalculationSettings = {
    GapiLens.get = (fun x -> x.iterativeCalculationSettings);
    GapiLens.set = (fun v x -> { x with iterativeCalculationSettings = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v });
  }
  let autoRecalc = {
    GapiLens.get = (fun x -> x.autoRecalc);
    GapiLens.set = (fun v x -> { x with autoRecalc = v });
  }
  let defaultFormat = {
    GapiLens.get = (fun x -> x.defaultFormat);
    GapiLens.set = (fun v x -> { x with defaultFormat = v });
  }
  
  let empty = {
    locale = "";
    spreadsheetTheme = SpreadsheetTheme.empty;
    iterativeCalculationSettings = IterativeCalculationSettings.empty;
    title = "";
    timeZone = "";
    autoRecalc = "";
    defaultFormat = CellFormat.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "locale" x.locale;
      (fun v -> GapiJson.render_object "spreadsheetTheme" (SpreadsheetTheme.render_content v)) x.spreadsheetTheme;
      (fun v -> GapiJson.render_object "iterativeCalculationSettings" (IterativeCalculationSettings.render_content v)) x.iterativeCalculationSettings;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "timeZone" x.timeZone;
      GapiJson.render_string_value "autoRecalc" x.autoRecalc;
      (fun v -> GapiJson.render_object "defaultFormat" (CellFormat.render_content v)) x.defaultFormat;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "locale"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with locale = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spreadsheetTheme"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SpreadsheetTheme.parse
        SpreadsheetTheme.empty
        (fun v -> { x with spreadsheetTheme = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "iterativeCalculationSettings"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        IterativeCalculationSettings.parse
        IterativeCalculationSettings.empty
        (fun v -> { x with iterativeCalculationSettings = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "autoRecalc"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with autoRecalc = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "defaultFormat"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CellFormat.parse
        CellFormat.empty
        (fun v -> { x with defaultFormat = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SpreadsheetProperties.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Spreadsheet =
struct
  type t = {
    properties : SpreadsheetProperties.t;
    spreadsheetUrl : string;
    developerMetadata : DeveloperMetadata.t list;
    dataSources : DataSource.t list;
    dataSourceSchedules : DataSourceRefreshSchedule.t list;
    namedRanges : NamedRange.t list;
    sheets : Sheet.t list;
    spreadsheetId : string;
    
  }
  
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  let spreadsheetUrl = {
    GapiLens.get = (fun x -> x.spreadsheetUrl);
    GapiLens.set = (fun v x -> { x with spreadsheetUrl = v });
  }
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  let dataSources = {
    GapiLens.get = (fun x -> x.dataSources);
    GapiLens.set = (fun v x -> { x with dataSources = v });
  }
  let dataSourceSchedules = {
    GapiLens.get = (fun x -> x.dataSourceSchedules);
    GapiLens.set = (fun v x -> { x with dataSourceSchedules = v });
  }
  let namedRanges = {
    GapiLens.get = (fun x -> x.namedRanges);
    GapiLens.set = (fun v x -> { x with namedRanges = v });
  }
  let sheets = {
    GapiLens.get = (fun x -> x.sheets);
    GapiLens.set = (fun v x -> { x with sheets = v });
  }
  let spreadsheetId = {
    GapiLens.get = (fun x -> x.spreadsheetId);
    GapiLens.set = (fun v x -> { x with spreadsheetId = v });
  }
  
  let empty = {
    properties = SpreadsheetProperties.empty;
    spreadsheetUrl = "";
    developerMetadata = [];
    dataSources = [];
    dataSourceSchedules = [];
    namedRanges = [];
    sheets = [];
    spreadsheetId = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "properties" (SpreadsheetProperties.render_content v)) x.properties;
      GapiJson.render_string_value "spreadsheetUrl" x.spreadsheetUrl;
      GapiJson.render_array "developerMetadata" DeveloperMetadata.render x.developerMetadata;
      GapiJson.render_array "dataSources" DataSource.render x.dataSources;
      GapiJson.render_array "dataSourceSchedules" DataSourceRefreshSchedule.render x.dataSourceSchedules;
      GapiJson.render_array "namedRanges" NamedRange.render x.namedRanges;
      GapiJson.render_array "sheets" Sheet.render x.sheets;
      GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SpreadsheetProperties.parse
        SpreadsheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheetUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with spreadsheetUrl = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DeveloperMetadata.parse
              DeveloperMetadata.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Spreadsheet.parse.parse_collection" e x')
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSources"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSource.parse
              DataSource.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Spreadsheet.parse.parse_collection" e x')
        DataSource.empty
        (fun v -> { x with dataSources = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceSchedules"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceRefreshSchedule.parse
              DataSourceRefreshSchedule.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Spreadsheet.parse.parse_collection" e x')
        DataSourceRefreshSchedule.empty
        (fun v -> { x with dataSourceSchedules = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "namedRanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              NamedRange.parse
              NamedRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Spreadsheet.parse.parse_collection" e x')
        NamedRange.empty
        (fun v -> { x with namedRanges = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sheets"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Sheet.parse Sheet.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.Spreadsheet.parse.parse_collection" e x')
        Sheet.empty
        (fun v -> { x with sheets = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with spreadsheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Spreadsheet.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BatchUpdateSpreadsheetResponse =
struct
  type t = {
    replies : Response.t list;
    spreadsheetId : string;
    updatedSpreadsheet : Spreadsheet.t;
    
  }
  
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  let spreadsheetId = {
    GapiLens.get = (fun x -> x.spreadsheetId);
    GapiLens.set = (fun v x -> { x with spreadsheetId = v });
  }
  let updatedSpreadsheet = {
    GapiLens.get = (fun x -> x.updatedSpreadsheet);
    GapiLens.set = (fun v x -> { x with updatedSpreadsheet = v });
  }
  
  let empty = {
    replies = [];
    spreadsheetId = "";
    updatedSpreadsheet = Spreadsheet.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "replies" Response.render x.replies;
      GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
      (fun v -> GapiJson.render_object "updatedSpreadsheet" (Spreadsheet.render_content v)) x.updatedSpreadsheet;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "replies"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Response.parse
              Response.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateSpreadsheetResponse.parse.parse_collection" e x')
        Response.empty
        (fun v -> { x with replies = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with spreadsheetId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updatedSpreadsheet"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Spreadsheet.parse
        Spreadsheet.empty
        (fun v -> { x with updatedSpreadsheet = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateSpreadsheetResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceObjectReferences =
struct
  type t = {
    references : DataSourceObjectReference.t list;
    
  }
  
  let references = {
    GapiLens.get = (fun x -> x.references);
    GapiLens.set = (fun v x -> { x with references = v });
  }
  
  let empty = {
    references = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "references" DataSourceObjectReference.render x.references;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "references"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceObjectReference.parse
              DataSourceObjectReference.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceObjectReferences.parse.parse_collection" e x')
        DataSourceObjectReference.empty
        (fun v -> { x with references = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceObjectReferences.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateCellsRequest =
struct
  type t = {
    fields : string;
    range : GridRange.t;
    rows : RowData.t list;
    start : GridCoordinate.t;
    
  }
  
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let rows = {
    GapiLens.get = (fun x -> x.rows);
    GapiLens.set = (fun v x -> { x with rows = v });
  }
  let start = {
    GapiLens.get = (fun x -> x.start);
    GapiLens.set = (fun v x -> { x with start = v });
  }
  
  let empty = {
    fields = "";
    range = GridRange.empty;
    rows = [];
    start = GridCoordinate.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_array "rows" RowData.render x.rows;
      (fun v -> GapiJson.render_object "start" (GridCoordinate.render_content v)) x.start;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rows"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RowData.parse
              RowData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.UpdateCellsRequest.parse.parse_collection" e x')
        RowData.empty
        (fun v -> { x with rows = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "start"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with start = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateCellsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CopySheetToAnotherSpreadsheetRequest =
struct
  type t = {
    destinationSpreadsheetId : string;
    
  }
  
  let destinationSpreadsheetId = {
    GapiLens.get = (fun x -> x.destinationSpreadsheetId);
    GapiLens.set = (fun v x -> { x with destinationSpreadsheetId = v });
  }
  
  let empty = {
    destinationSpreadsheetId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "destinationSpreadsheetId" x.destinationSpreadsheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "destinationSpreadsheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with destinationSpreadsheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CopySheetToAnotherSpreadsheetRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDeveloperMetadataRequest =
struct
  type t = {
    dataFilter : DataFilter.t;
    
  }
  
  let dataFilter = {
    GapiLens.get = (fun x -> x.dataFilter);
    GapiLens.set = (fun v x -> { x with dataFilter = v });
  }
  
  let empty = {
    dataFilter = DataFilter.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataFilter" (DataFilter.render_content v)) x.dataFilter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataFilter.parse
        DataFilter.empty
        (fun v -> { x with dataFilter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDeveloperMetadataRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module MatchedValueRange =
struct
  type t = {
    dataFilters : DataFilter.t list;
    valueRange : ValueRange.t;
    
  }
  
  let dataFilters = {
    GapiLens.get = (fun x -> x.dataFilters);
    GapiLens.set = (fun v x -> { x with dataFilters = v });
  }
  let valueRange = {
    GapiLens.get = (fun x -> x.valueRange);
    GapiLens.set = (fun v x -> { x with valueRange = v });
  }
  
  let empty = {
    dataFilters = [];
    valueRange = ValueRange.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
      (fun v -> GapiJson.render_object "valueRange" (ValueRange.render_content v)) x.valueRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataFilter.parse
              DataFilter.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.MatchedValueRange.parse.parse_collection" e x')
        DataFilter.empty
        (fun v -> { x with dataFilters = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "valueRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ValueRange.parse
        ValueRange.empty
        (fun v -> { x with valueRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.MatchedValueRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TextToColumnsRequest =
struct
  type t = {
    delimiter : string;
    delimiterType : string;
    source : GridRange.t;
    
  }
  
  let delimiter = {
    GapiLens.get = (fun x -> x.delimiter);
    GapiLens.set = (fun v x -> { x with delimiter = v });
  }
  let delimiterType = {
    GapiLens.get = (fun x -> x.delimiterType);
    GapiLens.set = (fun v x -> { x with delimiterType = v });
  }
  let source = {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }
  
  let empty = {
    delimiter = "";
    delimiterType = "";
    source = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "delimiter" x.delimiter;
      GapiJson.render_string_value "delimiterType" x.delimiterType;
      (fun v -> GapiJson.render_object "source" (GridRange.render_content v)) x.source;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "delimiter"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with delimiter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "delimiterType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with delimiterType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "source"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with source = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TextToColumnsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ClearBasicFilterRequest =
struct
  type t = {
    sheetId : int;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  
  let empty = {
    sheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.ClearBasicFilterRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataFilterValueRange =
struct
  type t = {
    values : string list list;
    dataFilter : DataFilter.t;
    majorDimension : string;
    
  }
  
  let values = {
    GapiLens.get = (fun x -> x.values);
    GapiLens.set = (fun v x -> { x with values = v });
  }
  let dataFilter = {
    GapiLens.get = (fun x -> x.dataFilter);
    GapiLens.set = (fun v x -> { x with dataFilter = v });
  }
  let majorDimension = {
    GapiLens.get = (fun x -> x.majorDimension);
    GapiLens.set = (fun v x -> { x with majorDimension = v });
  }
  
  let empty = {
    values = [];
    dataFilter = DataFilter.empty;
    majorDimension = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "values" (GapiJson.render_array "" (GapiJson.render_string_value "")) x.values;
      (fun v -> GapiJson.render_object "dataFilter" (DataFilter.render_content v)) x.dataFilter;
      GapiJson.render_string_value "majorDimension" x.majorDimension;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "values"; data_type = GapiJson.Array },
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
                  GapiJson.unexpected "GapiSheetsV4Model.DataFilterValueRange.parse.parse_collection" e x')
              ""
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataFilterValueRange.parse.parse_collection" e x')
        []
        (fun v -> { x with values = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataFilter.parse
        DataFilter.empty
        (fun v -> { x with dataFilter = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "majorDimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with majorDimension = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataFilterValueRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateChartSpecRequest =
struct
  type t = {
    spec : ChartSpec.t;
    chartId : int;
    
  }
  
  let spec = {
    GapiLens.get = (fun x -> x.spec);
    GapiLens.set = (fun v x -> { x with spec = v });
  }
  let chartId = {
    GapiLens.get = (fun x -> x.chartId);
    GapiLens.set = (fun v x -> { x with chartId = v });
  }
  
  let empty = {
    spec = ChartSpec.empty;
    chartId = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "spec" (ChartSpec.render_content v)) x.spec;
      GapiJson.render_int_value "chartId" x.chartId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ChartSpec.parse
        ChartSpec.empty
        (fun v -> { x with spec = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "chartId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with chartId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateChartSpecRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteNamedRangeRequest =
struct
  type t = {
    namedRangeId : string;
    
  }
  
  let namedRangeId = {
    GapiLens.get = (fun x -> x.namedRangeId);
    GapiLens.set = (fun v x -> { x with namedRangeId = v });
  }
  
  let empty = {
    namedRangeId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "namedRangeId" x.namedRangeId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "namedRangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with namedRangeId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteNamedRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CopyPasteRequest =
struct
  type t = {
    pasteOrientation : string;
    pasteType : string;
    destination : GridRange.t;
    source : GridRange.t;
    
  }
  
  let pasteOrientation = {
    GapiLens.get = (fun x -> x.pasteOrientation);
    GapiLens.set = (fun v x -> { x with pasteOrientation = v });
  }
  let pasteType = {
    GapiLens.get = (fun x -> x.pasteType);
    GapiLens.set = (fun v x -> { x with pasteType = v });
  }
  let destination = {
    GapiLens.get = (fun x -> x.destination);
    GapiLens.set = (fun v x -> { x with destination = v });
  }
  let source = {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }
  
  let empty = {
    pasteOrientation = "";
    pasteType = "";
    destination = GridRange.empty;
    source = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "pasteOrientation" x.pasteOrientation;
      GapiJson.render_string_value "pasteType" x.pasteType;
      (fun v -> GapiJson.render_object "destination" (GridRange.render_content v)) x.destination;
      (fun v -> GapiJson.render_object "source" (GridRange.render_content v)) x.source;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pasteOrientation"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pasteOrientation = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pasteType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pasteType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "destination"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with destination = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "source"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with source = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CopyPasteRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteRangeRequest =
struct
  type t = {
    shiftDimension : string;
    range : GridRange.t;
    
  }
  
  let shiftDimension = {
    GapiLens.get = (fun x -> x.shiftDimension);
    GapiLens.set = (fun v x -> { x with shiftDimension = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    shiftDimension = "";
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "shiftDimension" x.shiftDimension;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shiftDimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with shiftDimension = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SourceAndDestination =
struct
  type t = {
    source : GridRange.t;
    dimension : string;
    fillLength : int;
    
  }
  
  let source = {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }
  let dimension = {
    GapiLens.get = (fun x -> x.dimension);
    GapiLens.set = (fun v x -> { x with dimension = v });
  }
  let fillLength = {
    GapiLens.get = (fun x -> x.fillLength);
    GapiLens.set = (fun v x -> { x with fillLength = v });
  }
  
  let empty = {
    source = GridRange.empty;
    dimension = "";
    fillLength = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "source" (GridRange.render_content v)) x.source;
      GapiJson.render_string_value "dimension" x.dimension;
      GapiJson.render_int_value "fillLength" x.fillLength;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "source"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with source = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dimension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fillLength"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with fillLength = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SourceAndDestination.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AutoFillRequest =
struct
  type t = {
    useAlternateSeries : bool;
    range : GridRange.t;
    sourceAndDestination : SourceAndDestination.t;
    
  }
  
  let useAlternateSeries = {
    GapiLens.get = (fun x -> x.useAlternateSeries);
    GapiLens.set = (fun v x -> { x with useAlternateSeries = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let sourceAndDestination = {
    GapiLens.get = (fun x -> x.sourceAndDestination);
    GapiLens.set = (fun v x -> { x with sourceAndDestination = v });
  }
  
  let empty = {
    useAlternateSeries = false;
    range = GridRange.empty;
    sourceAndDestination = SourceAndDestination.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "useAlternateSeries" x.useAlternateSeries;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      (fun v -> GapiJson.render_object "sourceAndDestination" (SourceAndDestination.render_content v)) x.sourceAndDestination;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "useAlternateSeries"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with useAlternateSeries = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sourceAndDestination"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SourceAndDestination.parse
        SourceAndDestination.empty
        (fun v -> { x with sourceAndDestination = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AutoFillRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module MoveDimensionRequest =
struct
  type t = {
    source : DimensionRange.t;
    destinationIndex : int;
    
  }
  
  let source = {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }
  let destinationIndex = {
    GapiLens.get = (fun x -> x.destinationIndex);
    GapiLens.set = (fun v x -> { x with destinationIndex = v });
  }
  
  let empty = {
    source = DimensionRange.empty;
    destinationIndex = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "source" (DimensionRange.render_content v)) x.source;
      GapiJson.render_int_value "destinationIndex" x.destinationIndex;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "source"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with source = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "destinationIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with destinationIndex = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.MoveDimensionRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BatchClearValuesResponse =
struct
  type t = {
    clearedRanges : string list;
    spreadsheetId : string;
    
  }
  
  let clearedRanges = {
    GapiLens.get = (fun x -> x.clearedRanges);
    GapiLens.set = (fun v x -> { x with clearedRanges = v });
  }
  let spreadsheetId = {
    GapiLens.get = (fun x -> x.spreadsheetId);
    GapiLens.set = (fun v x -> { x with spreadsheetId = v });
  }
  
  let empty = {
    clearedRanges = [];
    spreadsheetId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "clearedRanges" (GapiJson.render_string_value "") x.clearedRanges;
      GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "clearedRanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesResponse.parse.parse_collection" e x')
        ""
        (fun v -> { x with clearedRanges = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with spreadsheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BatchUpdateValuesRequest =
struct
  type t = {
    responseValueRenderOption : string;
    valueInputOption : string;
    includeValuesInResponse : bool;
    responseDateTimeRenderOption : string;
    data : ValueRange.t list;
    
  }
  
  let responseValueRenderOption = {
    GapiLens.get = (fun x -> x.responseValueRenderOption);
    GapiLens.set = (fun v x -> { x with responseValueRenderOption = v });
  }
  let valueInputOption = {
    GapiLens.get = (fun x -> x.valueInputOption);
    GapiLens.set = (fun v x -> { x with valueInputOption = v });
  }
  let includeValuesInResponse = {
    GapiLens.get = (fun x -> x.includeValuesInResponse);
    GapiLens.set = (fun v x -> { x with includeValuesInResponse = v });
  }
  let responseDateTimeRenderOption = {
    GapiLens.get = (fun x -> x.responseDateTimeRenderOption);
    GapiLens.set = (fun v x -> { x with responseDateTimeRenderOption = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  
  let empty = {
    responseValueRenderOption = "";
    valueInputOption = "";
    includeValuesInResponse = false;
    responseDateTimeRenderOption = "";
    data = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "responseValueRenderOption" x.responseValueRenderOption;
      GapiJson.render_string_value "valueInputOption" x.valueInputOption;
      GapiJson.render_bool_value "includeValuesInResponse" x.includeValuesInResponse;
      GapiJson.render_string_value "responseDateTimeRenderOption" x.responseDateTimeRenderOption;
      GapiJson.render_array "data" ValueRange.render x.data;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseValueRenderOption"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with responseValueRenderOption = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "valueInputOption"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with valueInputOption = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "includeValuesInResponse"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with includeValuesInResponse = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseDateTimeRenderOption"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with responseDateTimeRenderOption = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "data"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ValueRange.parse
              ValueRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesRequest.parse.parse_collection" e x')
        ValueRange.empty
        (fun v -> { x with data = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddDimensionGroupRequest =
struct
  type t = {
    range : DimensionRange.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    range = DimensionRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (DimensionRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddDimensionGroupRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GetSpreadsheetByDataFilterRequest =
struct
  type t = {
    includeGridData : bool;
    dataFilters : DataFilter.t list;
    
  }
  
  let includeGridData = {
    GapiLens.get = (fun x -> x.includeGridData);
    GapiLens.set = (fun v x -> { x with includeGridData = v });
  }
  let dataFilters = {
    GapiLens.get = (fun x -> x.dataFilters);
    GapiLens.set = (fun v x -> { x with dataFilters = v });
  }
  
  let empty = {
    includeGridData = false;
    dataFilters = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "includeGridData" x.includeGridData;
      GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "includeGridData"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with includeGridData = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataFilter.parse
              DataFilter.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.GetSpreadsheetByDataFilterRequest.parse.parse_collection" e x')
        DataFilter.empty
        (fun v -> { x with dataFilters = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.GetSpreadsheetByDataFilterRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateSpreadsheetPropertiesRequest =
struct
  type t = {
    properties : SpreadsheetProperties.t;
    fields : string;
    
  }
  
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    properties = SpreadsheetProperties.empty;
    fields = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "properties" (SpreadsheetProperties.render_content v)) x.properties;
      GapiJson.render_string_value "fields" x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SpreadsheetProperties.parse
        SpreadsheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateSpreadsheetPropertiesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RandomizeRangeRequest =
struct
  type t = {
    range : GridRange.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.RandomizeRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateBordersRequest =
struct
  type t = {
    range : GridRange.t;
    right : Border.t;
    innerHorizontal : Border.t;
    innerVertical : Border.t;
    top : Border.t;
    left : Border.t;
    bottom : Border.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let right = {
    GapiLens.get = (fun x -> x.right);
    GapiLens.set = (fun v x -> { x with right = v });
  }
  let innerHorizontal = {
    GapiLens.get = (fun x -> x.innerHorizontal);
    GapiLens.set = (fun v x -> { x with innerHorizontal = v });
  }
  let innerVertical = {
    GapiLens.get = (fun x -> x.innerVertical);
    GapiLens.set = (fun v x -> { x with innerVertical = v });
  }
  let top = {
    GapiLens.get = (fun x -> x.top);
    GapiLens.set = (fun v x -> { x with top = v });
  }
  let left = {
    GapiLens.get = (fun x -> x.left);
    GapiLens.set = (fun v x -> { x with left = v });
  }
  let bottom = {
    GapiLens.get = (fun x -> x.bottom);
    GapiLens.set = (fun v x -> { x with bottom = v });
  }
  
  let empty = {
    range = GridRange.empty;
    right = Border.empty;
    innerHorizontal = Border.empty;
    innerVertical = Border.empty;
    top = Border.empty;
    left = Border.empty;
    bottom = Border.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      (fun v -> GapiJson.render_object "right" (Border.render_content v)) x.right;
      (fun v -> GapiJson.render_object "innerHorizontal" (Border.render_content v)) x.innerHorizontal;
      (fun v -> GapiJson.render_object "innerVertical" (Border.render_content v)) x.innerVertical;
      (fun v -> GapiJson.render_object "top" (Border.render_content v)) x.top;
      (fun v -> GapiJson.render_object "left" (Border.render_content v)) x.left;
      (fun v -> GapiJson.render_object "bottom" (Border.render_content v)) x.bottom;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "right"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with right = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "innerHorizontal"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with innerHorizontal = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "innerVertical"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with innerVertical = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "top"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with top = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "left"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with left = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bottom"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Border.parse
        Border.empty
        (fun v -> { x with bottom = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateBordersRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteEmbeddedObjectRequest =
struct
  type t = {
    objectId : int;
    
  }
  
  let objectId = {
    GapiLens.get = (fun x -> x.objectId);
    GapiLens.set = (fun v x -> { x with objectId = v });
  }
  
  let empty = {
    objectId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "objectId" x.objectId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with objectId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteEmbeddedObjectRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateConditionalFormatRuleRequest =
struct
  type t = {
    rule : ConditionalFormatRule.t;
    newIndex : int;
    sheetId : int;
    index : int;
    
  }
  
  let rule = {
    GapiLens.get = (fun x -> x.rule);
    GapiLens.set = (fun v x -> { x with rule = v });
  }
  let newIndex = {
    GapiLens.get = (fun x -> x.newIndex);
    GapiLens.set = (fun v x -> { x with newIndex = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
  }
  
  let empty = {
    rule = ConditionalFormatRule.empty;
    newIndex = 0;
    sheetId = 0;
    index = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "rule" (ConditionalFormatRule.render_content v)) x.rule;
      GapiJson.render_int_value "newIndex" x.newIndex;
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_int_value "index" x.index;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ConditionalFormatRule.parse
        ConditionalFormatRule.empty
        (fun v -> { x with rule = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with newIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateConditionalFormatRuleRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDimensionRequest =
struct
  type t = {
    range : DimensionRange.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    range = DimensionRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (DimensionRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDimensionRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddNamedRangeRequest =
struct
  type t = {
    namedRange : NamedRange.t;
    
  }
  
  let namedRange = {
    GapiLens.get = (fun x -> x.namedRange);
    GapiLens.set = (fun v x -> { x with namedRange = v });
  }
  
  let empty = {
    namedRange = NamedRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "namedRange" (NamedRange.render_content v)) x.namedRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "namedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        NamedRange.parse
        NamedRange.empty
        (fun v -> { x with namedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddNamedRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module InsertDimensionRequest =
struct
  type t = {
    range : DimensionRange.t;
    inheritFromBefore : bool;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let inheritFromBefore = {
    GapiLens.get = (fun x -> x.inheritFromBefore);
    GapiLens.set = (fun v x -> { x with inheritFromBefore = v });
  }
  
  let empty = {
    range = DimensionRange.empty;
    inheritFromBefore = false;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (DimensionRange.render_content v)) x.range;
      GapiJson.render_bool_value "inheritFromBefore" x.inheritFromBefore;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "inheritFromBefore"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with inheritFromBefore = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.InsertDimensionRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDataSourceRequest =
struct
  type t = {
    dataSourceId : string;
    
  }
  
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  
  let empty = {
    dataSourceId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDataSourceRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DataSourceSheetDimensionRange =
struct
  type t = {
    columnReferences : DataSourceColumnReference.t list;
    sheetId : int;
    
  }
  
  let columnReferences = {
    GapiLens.get = (fun x -> x.columnReferences);
    GapiLens.set = (fun v x -> { x with columnReferences = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  
  let empty = {
    columnReferences = [];
    sheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "columnReferences" DataSourceColumnReference.render x.columnReferences;
      GapiJson.render_int_value "sheetId" x.sheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "columnReferences"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataSourceColumnReference.parse
              DataSourceColumnReference.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DataSourceSheetDimensionRange.parse.parse_collection" e x')
        DataSourceColumnReference.empty
        (fun v -> { x with columnReferences = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DataSourceSheetDimensionRange.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AutoResizeDimensionsRequest =
struct
  type t = {
    dataSourceSheetDimensions : DataSourceSheetDimensionRange.t;
    dimensions : DimensionRange.t;
    
  }
  
  let dataSourceSheetDimensions = {
    GapiLens.get = (fun x -> x.dataSourceSheetDimensions);
    GapiLens.set = (fun v x -> { x with dataSourceSheetDimensions = v });
  }
  let dimensions = {
    GapiLens.get = (fun x -> x.dimensions);
    GapiLens.set = (fun v x -> { x with dimensions = v });
  }
  
  let empty = {
    dataSourceSheetDimensions = DataSourceSheetDimensionRange.empty;
    dimensions = DimensionRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataSourceSheetDimensions" (DataSourceSheetDimensionRange.render_content v)) x.dataSourceSheetDimensions;
      (fun v -> GapiJson.render_object "dimensions" (DimensionRange.render_content v)) x.dimensions;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceSheetDimensions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceSheetDimensionRange.parse
        DataSourceSheetDimensionRange.empty
        (fun v -> { x with dataSourceSheetDimensions = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dimensions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with dimensions = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AutoResizeDimensionsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateDataSourceRequest =
struct
  type t = {
    fields : string;
    dataSource : DataSource.t;
    
  }
  
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let dataSource = {
    GapiLens.get = (fun x -> x.dataSource);
    GapiLens.set = (fun v x -> { x with dataSource = v });
  }
  
  let empty = {
    fields = "";
    dataSource = DataSource.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "dataSource" (DataSource.render_content v)) x.dataSource;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSource.parse
        DataSource.empty
        (fun v -> { x with dataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateDataSourceRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateDeveloperMetadataRequest =
struct
  type t = {
    dataFilters : DataFilter.t list;
    fields : string;
    developerMetadata : DeveloperMetadata.t;
    
  }
  
  let dataFilters = {
    GapiLens.get = (fun x -> x.dataFilters);
    GapiLens.set = (fun v x -> { x with dataFilters = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  
  let empty = {
    dataFilters = [];
    fields = "";
    developerMetadata = DeveloperMetadata.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "developerMetadata" (DeveloperMetadata.render_content v)) x.developerMetadata;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataFilter.parse
              DataFilter.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.UpdateDeveloperMetadataRequest.parse.parse_collection" e x')
        DataFilter.empty
        (fun v -> { x with dataFilters = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadata.parse
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateDeveloperMetadataRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RepeatCellRequest =
struct
  type t = {
    cell : CellData.t;
    fields : string;
    range : GridRange.t;
    
  }
  
  let cell = {
    GapiLens.get = (fun x -> x.cell);
    GapiLens.set = (fun v x -> { x with cell = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    cell = CellData.empty;
    fields = "";
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "cell" (CellData.render_content v)) x.cell;
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "cell"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CellData.parse
        CellData.empty
        (fun v -> { x with cell = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.RepeatCellRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateNamedRangeRequest =
struct
  type t = {
    namedRange : NamedRange.t;
    fields : string;
    
  }
  
  let namedRange = {
    GapiLens.get = (fun x -> x.namedRange);
    GapiLens.set = (fun v x -> { x with namedRange = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    namedRange = NamedRange.empty;
    fields = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "namedRange" (NamedRange.render_content v)) x.namedRange;
      GapiJson.render_string_value "fields" x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "namedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        NamedRange.parse
        NamedRange.empty
        (fun v -> { x with namedRange = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateNamedRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateDimensionGroupRequest =
struct
  type t = {
    dimensionGroup : DimensionGroup.t;
    fields : string;
    
  }
  
  let dimensionGroup = {
    GapiLens.get = (fun x -> x.dimensionGroup);
    GapiLens.set = (fun v x -> { x with dimensionGroup = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    dimensionGroup = DimensionGroup.empty;
    fields = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dimensionGroup" (DimensionGroup.render_content v)) x.dimensionGroup;
      GapiJson.render_string_value "fields" x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dimensionGroup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionGroup.parse
        DimensionGroup.empty
        (fun v -> { x with dimensionGroup = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateDimensionGroupRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AppendDimensionRequest =
struct
  type t = {
    dimension : string;
    length : int;
    sheetId : int;
    
  }
  
  let dimension = {
    GapiLens.get = (fun x -> x.dimension);
    GapiLens.set = (fun v x -> { x with dimension = v });
  }
  let length = {
    GapiLens.get = (fun x -> x.length);
    GapiLens.set = (fun v x -> { x with length = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  
  let empty = {
    dimension = "";
    length = 0;
    sheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "dimension" x.dimension;
      GapiJson.render_int_value "length" x.length;
      GapiJson.render_int_value "sheetId" x.sheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dimension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "length"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with length = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AppendDimensionRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateEmbeddedObjectBorderRequest =
struct
  type t = {
    fields : string;
    border : EmbeddedObjectBorder.t;
    objectId : int;
    
  }
  
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let border = {
    GapiLens.get = (fun x -> x.border);
    GapiLens.set = (fun v x -> { x with border = v });
  }
  let objectId = {
    GapiLens.get = (fun x -> x.objectId);
    GapiLens.set = (fun v x -> { x with objectId = v });
  }
  
  let empty = {
    fields = "";
    border = EmbeddedObjectBorder.empty;
    objectId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "border" (EmbeddedObjectBorder.render_content v)) x.border;
      GapiJson.render_int_value "objectId" x.objectId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "border"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedObjectBorder.parse
        EmbeddedObjectBorder.empty
        (fun v -> { x with border = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with objectId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateEmbeddedObjectBorderRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateBandingRequest =
struct
  type t = {
    bandedRange : BandedRange.t;
    fields : string;
    
  }
  
  let bandedRange = {
    GapiLens.get = (fun x -> x.bandedRange);
    GapiLens.set = (fun v x -> { x with bandedRange = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    bandedRange = BandedRange.empty;
    fields = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "bandedRange" (BandedRange.render_content v)) x.bandedRange;
      GapiJson.render_string_value "fields" x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bandedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BandedRange.parse
        BandedRange.empty
        (fun v -> { x with bandedRange = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateBandingRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateEmbeddedObjectPositionRequest =
struct
  type t = {
    fields : string;
    newPosition : EmbeddedObjectPosition.t;
    objectId : int;
    
  }
  
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let newPosition = {
    GapiLens.get = (fun x -> x.newPosition);
    GapiLens.set = (fun v x -> { x with newPosition = v });
  }
  let objectId = {
    GapiLens.get = (fun x -> x.objectId);
    GapiLens.set = (fun v x -> { x with objectId = v });
  }
  
  let empty = {
    fields = "";
    newPosition = EmbeddedObjectPosition.empty;
    objectId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "newPosition" (EmbeddedObjectPosition.render_content v)) x.newPosition;
      GapiJson.render_int_value "objectId" x.objectId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "newPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedObjectPosition.parse
        EmbeddedObjectPosition.empty
        (fun v -> { x with newPosition = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with objectId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateEmbeddedObjectPositionRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteFilterViewRequest =
struct
  type t = {
    filterId : int;
    
  }
  
  let filterId = {
    GapiLens.get = (fun x -> x.filterId);
    GapiLens.set = (fun v x -> { x with filterId = v });
  }
  
  let empty = {
    filterId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "filterId" x.filterId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filterId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with filterId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteFilterViewRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PasteDataRequest =
struct
  type t = {
    delimiter : string;
    data : string;
    html : bool;
    _type : string;
    coordinate : GridCoordinate.t;
    
  }
  
  let delimiter = {
    GapiLens.get = (fun x -> x.delimiter);
    GapiLens.set = (fun v x -> { x with delimiter = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let html = {
    GapiLens.get = (fun x -> x.html);
    GapiLens.set = (fun v x -> { x with html = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let coordinate = {
    GapiLens.get = (fun x -> x.coordinate);
    GapiLens.set = (fun v x -> { x with coordinate = v });
  }
  
  let empty = {
    delimiter = "";
    data = "";
    html = false;
    _type = "";
    coordinate = GridCoordinate.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "delimiter" x.delimiter;
      GapiJson.render_string_value "data" x.data;
      GapiJson.render_bool_value "html" x.html;
      GapiJson.render_string_value "type" x._type;
      (fun v -> GapiJson.render_object "coordinate" (GridCoordinate.render_content v)) x.coordinate;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "delimiter"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with delimiter = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "data"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with data = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "html"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with html = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "coordinate"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with coordinate = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.PasteDataRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module MergeCellsRequest =
struct
  type t = {
    range : GridRange.t;
    mergeType : string;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let mergeType = {
    GapiLens.get = (fun x -> x.mergeType);
    GapiLens.set = (fun v x -> { x with mergeType = v });
  }
  
  let empty = {
    range = GridRange.empty;
    mergeType = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_string_value "mergeType" x.mergeType;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mergeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mergeType = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.MergeCellsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddProtectedRangeRequest =
struct
  type t = {
    protectedRange : ProtectedRange.t;
    
  }
  
  let protectedRange = {
    GapiLens.get = (fun x -> x.protectedRange);
    GapiLens.set = (fun v x -> { x with protectedRange = v });
  }
  
  let empty = {
    protectedRange = ProtectedRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "protectedRange" (ProtectedRange.render_content v)) x.protectedRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "protectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ProtectedRange.parse
        ProtectedRange.empty
        (fun v -> { x with protectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddProtectedRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CreateDeveloperMetadataRequest =
struct
  type t = {
    developerMetadata : DeveloperMetadata.t;
    
  }
  
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  
  let empty = {
    developerMetadata = DeveloperMetadata.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "developerMetadata" (DeveloperMetadata.render_content v)) x.developerMetadata;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadata.parse
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CreateDeveloperMetadataRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddSlicerRequest =
struct
  type t = {
    slicer : Slicer.t;
    
  }
  
  let slicer = {
    GapiLens.get = (fun x -> x.slicer);
    GapiLens.set = (fun v x -> { x with slicer = v });
  }
  
  let empty = {
    slicer = Slicer.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "slicer" (Slicer.render_content v)) x.slicer;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "slicer"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Slicer.parse
        Slicer.empty
        (fun v -> { x with slicer = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddSlicerRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DuplicateSheetRequest =
struct
  type t = {
    sourceSheetId : int;
    newSheetName : string;
    insertSheetIndex : int;
    newSheetId : int;
    
  }
  
  let sourceSheetId = {
    GapiLens.get = (fun x -> x.sourceSheetId);
    GapiLens.set = (fun v x -> { x with sourceSheetId = v });
  }
  let newSheetName = {
    GapiLens.get = (fun x -> x.newSheetName);
    GapiLens.set = (fun v x -> { x with newSheetName = v });
  }
  let insertSheetIndex = {
    GapiLens.get = (fun x -> x.insertSheetIndex);
    GapiLens.set = (fun v x -> { x with insertSheetIndex = v });
  }
  let newSheetId = {
    GapiLens.get = (fun x -> x.newSheetId);
    GapiLens.set = (fun v x -> { x with newSheetId = v });
  }
  
  let empty = {
    sourceSheetId = 0;
    newSheetName = "";
    insertSheetIndex = 0;
    newSheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sourceSheetId" x.sourceSheetId;
      GapiJson.render_string_value "newSheetName" x.newSheetName;
      GapiJson.render_int_value "insertSheetIndex" x.insertSheetIndex;
      GapiJson.render_int_value "newSheetId" x.newSheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sourceSheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sourceSheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newSheetName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with newSheetName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "insertSheetIndex"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with insertSheetIndex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newSheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with newSheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DuplicateSheetRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateFilterViewRequest =
struct
  type t = {
    fields : string;
    filter : FilterView.t;
    
  }
  
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  
  let empty = {
    fields = "";
    filter = FilterView.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "filter" (FilterView.render_content v)) x.filter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterView.parse
        FilterView.empty
        (fun v -> { x with filter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateFilterViewRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TrimWhitespaceRequest =
struct
  type t = {
    range : GridRange.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.TrimWhitespaceRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateDimensionPropertiesRequest =
struct
  type t = {
    dataSourceSheetRange : DataSourceSheetDimensionRange.t;
    range : DimensionRange.t;
    properties : DimensionProperties.t;
    fields : string;
    
  }
  
  let dataSourceSheetRange = {
    GapiLens.get = (fun x -> x.dataSourceSheetRange);
    GapiLens.set = (fun v x -> { x with dataSourceSheetRange = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    dataSourceSheetRange = DataSourceSheetDimensionRange.empty;
    range = DimensionRange.empty;
    properties = DimensionProperties.empty;
    fields = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataSourceSheetRange" (DataSourceSheetDimensionRange.render_content v)) x.dataSourceSheetRange;
      (fun v -> GapiJson.render_object "range" (DimensionRange.render_content v)) x.range;
      (fun v -> GapiJson.render_object "properties" (DimensionProperties.render_content v)) x.properties;
      GapiJson.render_string_value "fields" x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSourceSheetRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceSheetDimensionRange.parse
        DataSourceSheetDimensionRange.empty
        (fun v -> { x with dataSourceSheetRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionProperties.parse
        DimensionProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateDimensionPropertiesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DuplicateFilterViewRequest =
struct
  type t = {
    filterId : int;
    
  }
  
  let filterId = {
    GapiLens.get = (fun x -> x.filterId);
    GapiLens.set = (fun v x -> { x with filterId = v });
  }
  
  let empty = {
    filterId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "filterId" x.filterId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filterId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with filterId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DuplicateFilterViewRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteConditionalFormatRuleRequest =
struct
  type t = {
    sheetId : int;
    index : int;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
  }
  
  let empty = {
    sheetId = 0;
    index = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_int_value "index" x.index;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteConditionalFormatRuleRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SetBasicFilterRequest =
struct
  type t = {
    filter : BasicFilter.t;
    
  }
  
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  
  let empty = {
    filter = BasicFilter.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "filter" (BasicFilter.render_content v)) x.filter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BasicFilter.parse
        BasicFilter.empty
        (fun v -> { x with filter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SetBasicFilterRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CutPasteRequest =
struct
  type t = {
    source : GridRange.t;
    pasteType : string;
    destination : GridCoordinate.t;
    
  }
  
  let source = {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }
  let pasteType = {
    GapiLens.get = (fun x -> x.pasteType);
    GapiLens.set = (fun v x -> { x with pasteType = v });
  }
  let destination = {
    GapiLens.get = (fun x -> x.destination);
    GapiLens.set = (fun v x -> { x with destination = v });
  }
  
  let empty = {
    source = GridRange.empty;
    pasteType = "";
    destination = GridCoordinate.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "source" (GridRange.render_content v)) x.source;
      GapiJson.render_string_value "pasteType" x.pasteType;
      (fun v -> GapiJson.render_object "destination" (GridCoordinate.render_content v)) x.destination;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "source"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with source = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pasteType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pasteType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "destination"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridCoordinate.parse
        GridCoordinate.empty
        (fun v -> { x with destination = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.CutPasteRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDuplicatesRequest =
struct
  type t = {
    range : GridRange.t;
    comparisonColumns : DimensionRange.t list;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let comparisonColumns = {
    GapiLens.get = (fun x -> x.comparisonColumns);
    GapiLens.set = (fun v x -> { x with comparisonColumns = v });
  }
  
  let empty = {
    range = GridRange.empty;
    comparisonColumns = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_array "comparisonColumns" DimensionRange.render x.comparisonColumns;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "comparisonColumns"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DimensionRange.parse
              DimensionRange.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.DeleteDuplicatesRequest.parse.parse_collection" e x')
        DimensionRange.empty
        (fun v -> { x with comparisonColumns = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDuplicatesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UnmergeCellsRequest =
struct
  type t = {
    range : GridRange.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UnmergeCellsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddDataSourceRequest =
struct
  type t = {
    dataSource : DataSource.t;
    
  }
  
  let dataSource = {
    GapiLens.get = (fun x -> x.dataSource);
    GapiLens.set = (fun v x -> { x with dataSource = v });
  }
  
  let empty = {
    dataSource = DataSource.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "dataSource" (DataSource.render_content v)) x.dataSource;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSource.parse
        DataSource.empty
        (fun v -> { x with dataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddDataSourceRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SortRangeRequest =
struct
  type t = {
    range : GridRange.t;
    sortSpecs : SortSpec.t list;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let sortSpecs = {
    GapiLens.get = (fun x -> x.sortSpecs);
    GapiLens.set = (fun v x -> { x with sortSpecs = v });
  }
  
  let empty = {
    range = GridRange.empty;
    sortSpecs = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_array "sortSpecs" SortSpec.render x.sortSpecs;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sortSpecs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SortSpec.parse
              SortSpec.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.SortRangeRequest.parse.parse_collection" e x')
        SortSpec.empty
        (fun v -> { x with sortSpecs = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SortRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddChartRequest =
struct
  type t = {
    chart : EmbeddedChart.t;
    
  }
  
  let chart = {
    GapiLens.get = (fun x -> x.chart);
    GapiLens.set = (fun v x -> { x with chart = v });
  }
  
  let empty = {
    chart = EmbeddedChart.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "chart" (EmbeddedChart.render_content v)) x.chart;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "chart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EmbeddedChart.parse
        EmbeddedChart.empty
        (fun v -> { x with chart = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddChartRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RefreshDataSourceRequest =
struct
  type t = {
    isAll : bool;
    dataSourceId : string;
    references : DataSourceObjectReferences.t;
    force : bool;
    
  }
  
  let isAll = {
    GapiLens.get = (fun x -> x.isAll);
    GapiLens.set = (fun v x -> { x with isAll = v });
  }
  let dataSourceId = {
    GapiLens.get = (fun x -> x.dataSourceId);
    GapiLens.set = (fun v x -> { x with dataSourceId = v });
  }
  let references = {
    GapiLens.get = (fun x -> x.references);
    GapiLens.set = (fun v x -> { x with references = v });
  }
  let force = {
    GapiLens.get = (fun x -> x.force);
    GapiLens.set = (fun v x -> { x with force = v });
  }
  
  let empty = {
    isAll = false;
    dataSourceId = "";
    references = DataSourceObjectReferences.empty;
    force = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "isAll" x.isAll;
      GapiJson.render_string_value "dataSourceId" x.dataSourceId;
      (fun v -> GapiJson.render_object "references" (DataSourceObjectReferences.render_content v)) x.references;
      GapiJson.render_bool_value "force" x.force;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isAll"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isAll = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dataSourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dataSourceId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "references"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataSourceObjectReferences.parse
        DataSourceObjectReferences.empty
        (fun v -> { x with references = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "force"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with force = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.RefreshDataSourceRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteSheetRequest =
struct
  type t = {
    sheetId : int;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  
  let empty = {
    sheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteSheetRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateSheetPropertiesRequest =
struct
  type t = {
    fields : string;
    properties : SheetProperties.t;
    
  }
  
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  
  let empty = {
    fields = "";
    properties = SheetProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "properties" (SheetProperties.render_content v)) x.properties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SheetProperties.parse
        SheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateSheetPropertiesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module InsertRangeRequest =
struct
  type t = {
    shiftDimension : string;
    range : GridRange.t;
    
  }
  
  let shiftDimension = {
    GapiLens.get = (fun x -> x.shiftDimension);
    GapiLens.set = (fun v x -> { x with shiftDimension = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    shiftDimension = "";
    range = GridRange.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "shiftDimension" x.shiftDimension;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shiftDimension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with shiftDimension = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.InsertRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FindReplaceRequest =
struct
  type t = {
    replacement : string;
    matchCase : bool;
    find : string;
    matchEntireCell : bool;
    searchByRegex : bool;
    allSheets : bool;
    range : GridRange.t;
    includeFormulas : bool;
    sheetId : int;
    
  }
  
  let replacement = {
    GapiLens.get = (fun x -> x.replacement);
    GapiLens.set = (fun v x -> { x with replacement = v });
  }
  let matchCase = {
    GapiLens.get = (fun x -> x.matchCase);
    GapiLens.set = (fun v x -> { x with matchCase = v });
  }
  let find = {
    GapiLens.get = (fun x -> x.find);
    GapiLens.set = (fun v x -> { x with find = v });
  }
  let matchEntireCell = {
    GapiLens.get = (fun x -> x.matchEntireCell);
    GapiLens.set = (fun v x -> { x with matchEntireCell = v });
  }
  let searchByRegex = {
    GapiLens.get = (fun x -> x.searchByRegex);
    GapiLens.set = (fun v x -> { x with searchByRegex = v });
  }
  let allSheets = {
    GapiLens.get = (fun x -> x.allSheets);
    GapiLens.set = (fun v x -> { x with allSheets = v });
  }
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let includeFormulas = {
    GapiLens.get = (fun x -> x.includeFormulas);
    GapiLens.set = (fun v x -> { x with includeFormulas = v });
  }
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  
  let empty = {
    replacement = "";
    matchCase = false;
    find = "";
    matchEntireCell = false;
    searchByRegex = false;
    allSheets = false;
    range = GridRange.empty;
    includeFormulas = false;
    sheetId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "replacement" x.replacement;
      GapiJson.render_bool_value "matchCase" x.matchCase;
      GapiJson.render_string_value "find" x.find;
      GapiJson.render_bool_value "matchEntireCell" x.matchEntireCell;
      GapiJson.render_bool_value "searchByRegex" x.searchByRegex;
      GapiJson.render_bool_value "allSheets" x.allSheets;
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      GapiJson.render_bool_value "includeFormulas" x.includeFormulas;
      GapiJson.render_int_value "sheetId" x.sheetId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "replacement"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with replacement = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "matchCase"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with matchCase = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "find"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with find = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "matchEntireCell"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with matchEntireCell = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "searchByRegex"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with searchByRegex = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "allSheets"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with allSheets = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "includeFormulas"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with includeFormulas = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.FindReplaceRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AppendCellsRequest =
struct
  type t = {
    sheetId : int;
    fields : string;
    rows : RowData.t list;
    
  }
  
  let sheetId = {
    GapiLens.get = (fun x -> x.sheetId);
    GapiLens.set = (fun v x -> { x with sheetId = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let rows = {
    GapiLens.get = (fun x -> x.rows);
    GapiLens.set = (fun v x -> { x with rows = v });
  }
  
  let empty = {
    sheetId = 0;
    fields = "";
    rows = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "sheetId" x.sheetId;
      GapiJson.render_string_value "fields" x.fields;
      GapiJson.render_array "rows" RowData.render x.rows;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sheetId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rows"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RowData.parse
              RowData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.AppendCellsRequest.parse.parse_collection" e x')
        RowData.empty
        (fun v -> { x with rows = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AppendCellsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddConditionalFormatRuleRequest =
struct
  type t = {
    rule : ConditionalFormatRule.t;
    index : int;
    
  }
  
  let rule = {
    GapiLens.get = (fun x -> x.rule);
    GapiLens.set = (fun v x -> { x with rule = v });
  }
  let index = {
    GapiLens.get = (fun x -> x.index);
    GapiLens.set = (fun v x -> { x with index = v });
  }
  
  let empty = {
    rule = ConditionalFormatRule.empty;
    index = 0;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "rule" (ConditionalFormatRule.render_content v)) x.rule;
      GapiJson.render_int_value "index" x.index;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ConditionalFormatRule.parse
        ConditionalFormatRule.empty
        (fun v -> { x with rule = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "index"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with index = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddConditionalFormatRuleRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddBandingRequest =
struct
  type t = {
    bandedRange : BandedRange.t;
    
  }
  
  let bandedRange = {
    GapiLens.get = (fun x -> x.bandedRange);
    GapiLens.set = (fun v x -> { x with bandedRange = v });
  }
  
  let empty = {
    bandedRange = BandedRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "bandedRange" (BandedRange.render_content v)) x.bandedRange;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "bandedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BandedRange.parse
        BandedRange.empty
        (fun v -> { x with bandedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddBandingRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SetDataValidationRequest =
struct
  type t = {
    range : GridRange.t;
    rule : DataValidationRule.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  let rule = {
    GapiLens.get = (fun x -> x.rule);
    GapiLens.set = (fun v x -> { x with rule = v });
  }
  
  let empty = {
    range = GridRange.empty;
    rule = DataValidationRule.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (GridRange.render_content v)) x.range;
      (fun v -> GapiJson.render_object "rule" (DataValidationRule.render_content v)) x.rule;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GridRange.parse
        GridRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DataValidationRule.parse
        DataValidationRule.empty
        (fun v -> { x with rule = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.SetDataValidationRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteProtectedRangeRequest =
struct
  type t = {
    protectedRangeId : int;
    
  }
  
  let protectedRangeId = {
    GapiLens.get = (fun x -> x.protectedRangeId);
    GapiLens.set = (fun v x -> { x with protectedRangeId = v });
  }
  
  let empty = {
    protectedRangeId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "protectedRangeId" x.protectedRangeId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "protectedRangeId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with protectedRangeId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteProtectedRangeRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteDimensionGroupRequest =
struct
  type t = {
    range : DimensionRange.t;
    
  }
  
  let range = {
    GapiLens.get = (fun x -> x.range);
    GapiLens.set = (fun v x -> { x with range = v });
  }
  
  let empty = {
    range = DimensionRange.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "range" (DimensionRange.render_content v)) x.range;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "range"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DimensionRange.parse
        DimensionRange.empty
        (fun v -> { x with range = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteDimensionGroupRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateSlicerSpecRequest =
struct
  type t = {
    slicerId : int;
    fields : string;
    spec : SlicerSpec.t;
    
  }
  
  let slicerId = {
    GapiLens.get = (fun x -> x.slicerId);
    GapiLens.set = (fun v x -> { x with slicerId = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  let spec = {
    GapiLens.get = (fun x -> x.spec);
    GapiLens.set = (fun v x -> { x with spec = v });
  }
  
  let empty = {
    slicerId = 0;
    fields = "";
    spec = SlicerSpec.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "slicerId" x.slicerId;
      GapiJson.render_string_value "fields" x.fields;
      (fun v -> GapiJson.render_object "spec" (SlicerSpec.render_content v)) x.spec;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "slicerId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with slicerId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fields"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fields = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SlicerSpec.parse
        SlicerSpec.empty
        (fun v -> { x with spec = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateSlicerSpecRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DeleteBandingRequest =
struct
  type t = {
    bandedRangeId : int;
    
  }
  
  let bandedRangeId = {
    GapiLens.get = (fun x -> x.bandedRangeId);
    GapiLens.set = (fun v x -> { x with bandedRangeId = v });
  }
  
  let empty = {
    bandedRangeId = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "bandedRangeId" x.bandedRangeId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "bandedRangeId"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with bandedRangeId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.DeleteBandingRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddSheetRequest =
struct
  type t = {
    properties : SheetProperties.t;
    
  }
  
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  
  let empty = {
    properties = SheetProperties.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "properties" (SheetProperties.render_content v)) x.properties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SheetProperties.parse
        SheetProperties.empty
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddSheetRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AddFilterViewRequest =
struct
  type t = {
    filter : FilterView.t;
    
  }
  
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  
  let empty = {
    filter = FilterView.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "filter" (FilterView.render_content v)) x.filter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterView.parse
        FilterView.empty
        (fun v -> { x with filter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.AddFilterViewRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Request =
struct
  type t = {
    addDimensionGroup : AddDimensionGroupRequest.t;
    deleteConditionalFormatRule : DeleteConditionalFormatRuleRequest.t;
    setBasicFilter : SetBasicFilterRequest.t;
    duplicateFilterView : DuplicateFilterViewRequest.t;
    clearBasicFilter : ClearBasicFilterRequest.t;
    updateDimensionProperties : UpdateDimensionPropertiesRequest.t;
    cutPaste : CutPasteRequest.t;
    deleteNamedRange : DeleteNamedRangeRequest.t;
    updateChartSpec : UpdateChartSpecRequest.t;
    trimWhitespace : TrimWhitespaceRequest.t;
    updateBorders : UpdateBordersRequest.t;
    autoFill : AutoFillRequest.t;
    deleteDuplicates : DeleteDuplicatesRequest.t;
    updateFilterView : UpdateFilterViewRequest.t;
    unmergeCells : UnmergeCellsRequest.t;
    duplicateSheet : DuplicateSheetRequest.t;
    addDataSource : AddDataSourceRequest.t;
    addSlicer : AddSlicerRequest.t;
    moveDimension : MoveDimensionRequest.t;
    createDeveloperMetadata : CreateDeveloperMetadataRequest.t;
    updateSpreadsheetProperties : UpdateSpreadsheetPropertiesRequest.t;
    addProtectedRange : AddProtectedRangeRequest.t;
    sortRange : SortRangeRequest.t;
    mergeCells : MergeCellsRequest.t;
    addChart : AddChartRequest.t;
    pasteData : PasteDataRequest.t;
    refreshDataSource : RefreshDataSourceRequest.t;
    addNamedRange : AddNamedRangeRequest.t;
    deleteSheet : DeleteSheetRequest.t;
    insertDimension : InsertDimensionRequest.t;
    updateSheetProperties : UpdateSheetPropertiesRequest.t;
    deleteFilterView : DeleteFilterViewRequest.t;
    insertRange : InsertRangeRequest.t;
    updateEmbeddedObjectPosition : UpdateEmbeddedObjectPositionRequest.t;
    findReplace : FindReplaceRequest.t;
    updateBanding : UpdateBandingRequest.t;
    appendCells : AppendCellsRequest.t;
    updateCells : UpdateCellsRequest.t;
    deleteRange : DeleteRangeRequest.t;
    updateEmbeddedObjectBorder : UpdateEmbeddedObjectBorderRequest.t;
    addConditionalFormatRule : AddConditionalFormatRuleRequest.t;
    appendDimension : AppendDimensionRequest.t;
    textToColumns : TextToColumnsRequest.t;
    updateConditionalFormatRule : UpdateConditionalFormatRuleRequest.t;
    addBanding : AddBandingRequest.t;
    updateDimensionGroup : UpdateDimensionGroupRequest.t;
    deleteDeveloperMetadata : DeleteDeveloperMetadataRequest.t;
    updateProtectedRange : UpdateProtectedRangeRequest.t;
    setDataValidation : SetDataValidationRequest.t;
    copyPaste : CopyPasteRequest.t;
    deleteProtectedRange : DeleteProtectedRangeRequest.t;
    updateNamedRange : UpdateNamedRangeRequest.t;
    deleteDimensionGroup : DeleteDimensionGroupRequest.t;
    repeatCell : RepeatCellRequest.t;
    updateSlicerSpec : UpdateSlicerSpecRequest.t;
    updateDeveloperMetadata : UpdateDeveloperMetadataRequest.t;
    deleteBanding : DeleteBandingRequest.t;
    updateDataSource : UpdateDataSourceRequest.t;
    randomizeRange : RandomizeRangeRequest.t;
    deleteDimension : DeleteDimensionRequest.t;
    deleteEmbeddedObject : DeleteEmbeddedObjectRequest.t;
    autoResizeDimensions : AutoResizeDimensionsRequest.t;
    addSheet : AddSheetRequest.t;
    deleteDataSource : DeleteDataSourceRequest.t;
    addFilterView : AddFilterViewRequest.t;
    
  }
  
  let addDimensionGroup = {
    GapiLens.get = (fun x -> x.addDimensionGroup);
    GapiLens.set = (fun v x -> { x with addDimensionGroup = v });
  }
  let deleteConditionalFormatRule = {
    GapiLens.get = (fun x -> x.deleteConditionalFormatRule);
    GapiLens.set = (fun v x -> { x with deleteConditionalFormatRule = v });
  }
  let setBasicFilter = {
    GapiLens.get = (fun x -> x.setBasicFilter);
    GapiLens.set = (fun v x -> { x with setBasicFilter = v });
  }
  let duplicateFilterView = {
    GapiLens.get = (fun x -> x.duplicateFilterView);
    GapiLens.set = (fun v x -> { x with duplicateFilterView = v });
  }
  let clearBasicFilter = {
    GapiLens.get = (fun x -> x.clearBasicFilter);
    GapiLens.set = (fun v x -> { x with clearBasicFilter = v });
  }
  let updateDimensionProperties = {
    GapiLens.get = (fun x -> x.updateDimensionProperties);
    GapiLens.set = (fun v x -> { x with updateDimensionProperties = v });
  }
  let cutPaste = {
    GapiLens.get = (fun x -> x.cutPaste);
    GapiLens.set = (fun v x -> { x with cutPaste = v });
  }
  let deleteNamedRange = {
    GapiLens.get = (fun x -> x.deleteNamedRange);
    GapiLens.set = (fun v x -> { x with deleteNamedRange = v });
  }
  let updateChartSpec = {
    GapiLens.get = (fun x -> x.updateChartSpec);
    GapiLens.set = (fun v x -> { x with updateChartSpec = v });
  }
  let trimWhitespace = {
    GapiLens.get = (fun x -> x.trimWhitespace);
    GapiLens.set = (fun v x -> { x with trimWhitespace = v });
  }
  let updateBorders = {
    GapiLens.get = (fun x -> x.updateBorders);
    GapiLens.set = (fun v x -> { x with updateBorders = v });
  }
  let autoFill = {
    GapiLens.get = (fun x -> x.autoFill);
    GapiLens.set = (fun v x -> { x with autoFill = v });
  }
  let deleteDuplicates = {
    GapiLens.get = (fun x -> x.deleteDuplicates);
    GapiLens.set = (fun v x -> { x with deleteDuplicates = v });
  }
  let updateFilterView = {
    GapiLens.get = (fun x -> x.updateFilterView);
    GapiLens.set = (fun v x -> { x with updateFilterView = v });
  }
  let unmergeCells = {
    GapiLens.get = (fun x -> x.unmergeCells);
    GapiLens.set = (fun v x -> { x with unmergeCells = v });
  }
  let duplicateSheet = {
    GapiLens.get = (fun x -> x.duplicateSheet);
    GapiLens.set = (fun v x -> { x with duplicateSheet = v });
  }
  let addDataSource = {
    GapiLens.get = (fun x -> x.addDataSource);
    GapiLens.set = (fun v x -> { x with addDataSource = v });
  }
  let addSlicer = {
    GapiLens.get = (fun x -> x.addSlicer);
    GapiLens.set = (fun v x -> { x with addSlicer = v });
  }
  let moveDimension = {
    GapiLens.get = (fun x -> x.moveDimension);
    GapiLens.set = (fun v x -> { x with moveDimension = v });
  }
  let createDeveloperMetadata = {
    GapiLens.get = (fun x -> x.createDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with createDeveloperMetadata = v });
  }
  let updateSpreadsheetProperties = {
    GapiLens.get = (fun x -> x.updateSpreadsheetProperties);
    GapiLens.set = (fun v x -> { x with updateSpreadsheetProperties = v });
  }
  let addProtectedRange = {
    GapiLens.get = (fun x -> x.addProtectedRange);
    GapiLens.set = (fun v x -> { x with addProtectedRange = v });
  }
  let sortRange = {
    GapiLens.get = (fun x -> x.sortRange);
    GapiLens.set = (fun v x -> { x with sortRange = v });
  }
  let mergeCells = {
    GapiLens.get = (fun x -> x.mergeCells);
    GapiLens.set = (fun v x -> { x with mergeCells = v });
  }
  let addChart = {
    GapiLens.get = (fun x -> x.addChart);
    GapiLens.set = (fun v x -> { x with addChart = v });
  }
  let pasteData = {
    GapiLens.get = (fun x -> x.pasteData);
    GapiLens.set = (fun v x -> { x with pasteData = v });
  }
  let refreshDataSource = {
    GapiLens.get = (fun x -> x.refreshDataSource);
    GapiLens.set = (fun v x -> { x with refreshDataSource = v });
  }
  let addNamedRange = {
    GapiLens.get = (fun x -> x.addNamedRange);
    GapiLens.set = (fun v x -> { x with addNamedRange = v });
  }
  let deleteSheet = {
    GapiLens.get = (fun x -> x.deleteSheet);
    GapiLens.set = (fun v x -> { x with deleteSheet = v });
  }
  let insertDimension = {
    GapiLens.get = (fun x -> x.insertDimension);
    GapiLens.set = (fun v x -> { x with insertDimension = v });
  }
  let updateSheetProperties = {
    GapiLens.get = (fun x -> x.updateSheetProperties);
    GapiLens.set = (fun v x -> { x with updateSheetProperties = v });
  }
  let deleteFilterView = {
    GapiLens.get = (fun x -> x.deleteFilterView);
    GapiLens.set = (fun v x -> { x with deleteFilterView = v });
  }
  let insertRange = {
    GapiLens.get = (fun x -> x.insertRange);
    GapiLens.set = (fun v x -> { x with insertRange = v });
  }
  let updateEmbeddedObjectPosition = {
    GapiLens.get = (fun x -> x.updateEmbeddedObjectPosition);
    GapiLens.set = (fun v x -> { x with updateEmbeddedObjectPosition = v });
  }
  let findReplace = {
    GapiLens.get = (fun x -> x.findReplace);
    GapiLens.set = (fun v x -> { x with findReplace = v });
  }
  let updateBanding = {
    GapiLens.get = (fun x -> x.updateBanding);
    GapiLens.set = (fun v x -> { x with updateBanding = v });
  }
  let appendCells = {
    GapiLens.get = (fun x -> x.appendCells);
    GapiLens.set = (fun v x -> { x with appendCells = v });
  }
  let updateCells = {
    GapiLens.get = (fun x -> x.updateCells);
    GapiLens.set = (fun v x -> { x with updateCells = v });
  }
  let deleteRange = {
    GapiLens.get = (fun x -> x.deleteRange);
    GapiLens.set = (fun v x -> { x with deleteRange = v });
  }
  let updateEmbeddedObjectBorder = {
    GapiLens.get = (fun x -> x.updateEmbeddedObjectBorder);
    GapiLens.set = (fun v x -> { x with updateEmbeddedObjectBorder = v });
  }
  let addConditionalFormatRule = {
    GapiLens.get = (fun x -> x.addConditionalFormatRule);
    GapiLens.set = (fun v x -> { x with addConditionalFormatRule = v });
  }
  let appendDimension = {
    GapiLens.get = (fun x -> x.appendDimension);
    GapiLens.set = (fun v x -> { x with appendDimension = v });
  }
  let textToColumns = {
    GapiLens.get = (fun x -> x.textToColumns);
    GapiLens.set = (fun v x -> { x with textToColumns = v });
  }
  let updateConditionalFormatRule = {
    GapiLens.get = (fun x -> x.updateConditionalFormatRule);
    GapiLens.set = (fun v x -> { x with updateConditionalFormatRule = v });
  }
  let addBanding = {
    GapiLens.get = (fun x -> x.addBanding);
    GapiLens.set = (fun v x -> { x with addBanding = v });
  }
  let updateDimensionGroup = {
    GapiLens.get = (fun x -> x.updateDimensionGroup);
    GapiLens.set = (fun v x -> { x with updateDimensionGroup = v });
  }
  let deleteDeveloperMetadata = {
    GapiLens.get = (fun x -> x.deleteDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with deleteDeveloperMetadata = v });
  }
  let updateProtectedRange = {
    GapiLens.get = (fun x -> x.updateProtectedRange);
    GapiLens.set = (fun v x -> { x with updateProtectedRange = v });
  }
  let setDataValidation = {
    GapiLens.get = (fun x -> x.setDataValidation);
    GapiLens.set = (fun v x -> { x with setDataValidation = v });
  }
  let copyPaste = {
    GapiLens.get = (fun x -> x.copyPaste);
    GapiLens.set = (fun v x -> { x with copyPaste = v });
  }
  let deleteProtectedRange = {
    GapiLens.get = (fun x -> x.deleteProtectedRange);
    GapiLens.set = (fun v x -> { x with deleteProtectedRange = v });
  }
  let updateNamedRange = {
    GapiLens.get = (fun x -> x.updateNamedRange);
    GapiLens.set = (fun v x -> { x with updateNamedRange = v });
  }
  let deleteDimensionGroup = {
    GapiLens.get = (fun x -> x.deleteDimensionGroup);
    GapiLens.set = (fun v x -> { x with deleteDimensionGroup = v });
  }
  let repeatCell = {
    GapiLens.get = (fun x -> x.repeatCell);
    GapiLens.set = (fun v x -> { x with repeatCell = v });
  }
  let updateSlicerSpec = {
    GapiLens.get = (fun x -> x.updateSlicerSpec);
    GapiLens.set = (fun v x -> { x with updateSlicerSpec = v });
  }
  let updateDeveloperMetadata = {
    GapiLens.get = (fun x -> x.updateDeveloperMetadata);
    GapiLens.set = (fun v x -> { x with updateDeveloperMetadata = v });
  }
  let deleteBanding = {
    GapiLens.get = (fun x -> x.deleteBanding);
    GapiLens.set = (fun v x -> { x with deleteBanding = v });
  }
  let updateDataSource = {
    GapiLens.get = (fun x -> x.updateDataSource);
    GapiLens.set = (fun v x -> { x with updateDataSource = v });
  }
  let randomizeRange = {
    GapiLens.get = (fun x -> x.randomizeRange);
    GapiLens.set = (fun v x -> { x with randomizeRange = v });
  }
  let deleteDimension = {
    GapiLens.get = (fun x -> x.deleteDimension);
    GapiLens.set = (fun v x -> { x with deleteDimension = v });
  }
  let deleteEmbeddedObject = {
    GapiLens.get = (fun x -> x.deleteEmbeddedObject);
    GapiLens.set = (fun v x -> { x with deleteEmbeddedObject = v });
  }
  let autoResizeDimensions = {
    GapiLens.get = (fun x -> x.autoResizeDimensions);
    GapiLens.set = (fun v x -> { x with autoResizeDimensions = v });
  }
  let addSheet = {
    GapiLens.get = (fun x -> x.addSheet);
    GapiLens.set = (fun v x -> { x with addSheet = v });
  }
  let deleteDataSource = {
    GapiLens.get = (fun x -> x.deleteDataSource);
    GapiLens.set = (fun v x -> { x with deleteDataSource = v });
  }
  let addFilterView = {
    GapiLens.get = (fun x -> x.addFilterView);
    GapiLens.set = (fun v x -> { x with addFilterView = v });
  }
  
  let empty = {
    addDimensionGroup = AddDimensionGroupRequest.empty;
    deleteConditionalFormatRule = DeleteConditionalFormatRuleRequest.empty;
    setBasicFilter = SetBasicFilterRequest.empty;
    duplicateFilterView = DuplicateFilterViewRequest.empty;
    clearBasicFilter = ClearBasicFilterRequest.empty;
    updateDimensionProperties = UpdateDimensionPropertiesRequest.empty;
    cutPaste = CutPasteRequest.empty;
    deleteNamedRange = DeleteNamedRangeRequest.empty;
    updateChartSpec = UpdateChartSpecRequest.empty;
    trimWhitespace = TrimWhitespaceRequest.empty;
    updateBorders = UpdateBordersRequest.empty;
    autoFill = AutoFillRequest.empty;
    deleteDuplicates = DeleteDuplicatesRequest.empty;
    updateFilterView = UpdateFilterViewRequest.empty;
    unmergeCells = UnmergeCellsRequest.empty;
    duplicateSheet = DuplicateSheetRequest.empty;
    addDataSource = AddDataSourceRequest.empty;
    addSlicer = AddSlicerRequest.empty;
    moveDimension = MoveDimensionRequest.empty;
    createDeveloperMetadata = CreateDeveloperMetadataRequest.empty;
    updateSpreadsheetProperties = UpdateSpreadsheetPropertiesRequest.empty;
    addProtectedRange = AddProtectedRangeRequest.empty;
    sortRange = SortRangeRequest.empty;
    mergeCells = MergeCellsRequest.empty;
    addChart = AddChartRequest.empty;
    pasteData = PasteDataRequest.empty;
    refreshDataSource = RefreshDataSourceRequest.empty;
    addNamedRange = AddNamedRangeRequest.empty;
    deleteSheet = DeleteSheetRequest.empty;
    insertDimension = InsertDimensionRequest.empty;
    updateSheetProperties = UpdateSheetPropertiesRequest.empty;
    deleteFilterView = DeleteFilterViewRequest.empty;
    insertRange = InsertRangeRequest.empty;
    updateEmbeddedObjectPosition = UpdateEmbeddedObjectPositionRequest.empty;
    findReplace = FindReplaceRequest.empty;
    updateBanding = UpdateBandingRequest.empty;
    appendCells = AppendCellsRequest.empty;
    updateCells = UpdateCellsRequest.empty;
    deleteRange = DeleteRangeRequest.empty;
    updateEmbeddedObjectBorder = UpdateEmbeddedObjectBorderRequest.empty;
    addConditionalFormatRule = AddConditionalFormatRuleRequest.empty;
    appendDimension = AppendDimensionRequest.empty;
    textToColumns = TextToColumnsRequest.empty;
    updateConditionalFormatRule = UpdateConditionalFormatRuleRequest.empty;
    addBanding = AddBandingRequest.empty;
    updateDimensionGroup = UpdateDimensionGroupRequest.empty;
    deleteDeveloperMetadata = DeleteDeveloperMetadataRequest.empty;
    updateProtectedRange = UpdateProtectedRangeRequest.empty;
    setDataValidation = SetDataValidationRequest.empty;
    copyPaste = CopyPasteRequest.empty;
    deleteProtectedRange = DeleteProtectedRangeRequest.empty;
    updateNamedRange = UpdateNamedRangeRequest.empty;
    deleteDimensionGroup = DeleteDimensionGroupRequest.empty;
    repeatCell = RepeatCellRequest.empty;
    updateSlicerSpec = UpdateSlicerSpecRequest.empty;
    updateDeveloperMetadata = UpdateDeveloperMetadataRequest.empty;
    deleteBanding = DeleteBandingRequest.empty;
    updateDataSource = UpdateDataSourceRequest.empty;
    randomizeRange = RandomizeRangeRequest.empty;
    deleteDimension = DeleteDimensionRequest.empty;
    deleteEmbeddedObject = DeleteEmbeddedObjectRequest.empty;
    autoResizeDimensions = AutoResizeDimensionsRequest.empty;
    addSheet = AddSheetRequest.empty;
    deleteDataSource = DeleteDataSourceRequest.empty;
    addFilterView = AddFilterViewRequest.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "addDimensionGroup" (AddDimensionGroupRequest.render_content v)) x.addDimensionGroup;
      (fun v -> GapiJson.render_object "deleteConditionalFormatRule" (DeleteConditionalFormatRuleRequest.render_content v)) x.deleteConditionalFormatRule;
      (fun v -> GapiJson.render_object "setBasicFilter" (SetBasicFilterRequest.render_content v)) x.setBasicFilter;
      (fun v -> GapiJson.render_object "duplicateFilterView" (DuplicateFilterViewRequest.render_content v)) x.duplicateFilterView;
      (fun v -> GapiJson.render_object "clearBasicFilter" (ClearBasicFilterRequest.render_content v)) x.clearBasicFilter;
      (fun v -> GapiJson.render_object "updateDimensionProperties" (UpdateDimensionPropertiesRequest.render_content v)) x.updateDimensionProperties;
      (fun v -> GapiJson.render_object "cutPaste" (CutPasteRequest.render_content v)) x.cutPaste;
      (fun v -> GapiJson.render_object "deleteNamedRange" (DeleteNamedRangeRequest.render_content v)) x.deleteNamedRange;
      (fun v -> GapiJson.render_object "updateChartSpec" (UpdateChartSpecRequest.render_content v)) x.updateChartSpec;
      (fun v -> GapiJson.render_object "trimWhitespace" (TrimWhitespaceRequest.render_content v)) x.trimWhitespace;
      (fun v -> GapiJson.render_object "updateBorders" (UpdateBordersRequest.render_content v)) x.updateBorders;
      (fun v -> GapiJson.render_object "autoFill" (AutoFillRequest.render_content v)) x.autoFill;
      (fun v -> GapiJson.render_object "deleteDuplicates" (DeleteDuplicatesRequest.render_content v)) x.deleteDuplicates;
      (fun v -> GapiJson.render_object "updateFilterView" (UpdateFilterViewRequest.render_content v)) x.updateFilterView;
      (fun v -> GapiJson.render_object "unmergeCells" (UnmergeCellsRequest.render_content v)) x.unmergeCells;
      (fun v -> GapiJson.render_object "duplicateSheet" (DuplicateSheetRequest.render_content v)) x.duplicateSheet;
      (fun v -> GapiJson.render_object "addDataSource" (AddDataSourceRequest.render_content v)) x.addDataSource;
      (fun v -> GapiJson.render_object "addSlicer" (AddSlicerRequest.render_content v)) x.addSlicer;
      (fun v -> GapiJson.render_object "moveDimension" (MoveDimensionRequest.render_content v)) x.moveDimension;
      (fun v -> GapiJson.render_object "createDeveloperMetadata" (CreateDeveloperMetadataRequest.render_content v)) x.createDeveloperMetadata;
      (fun v -> GapiJson.render_object "updateSpreadsheetProperties" (UpdateSpreadsheetPropertiesRequest.render_content v)) x.updateSpreadsheetProperties;
      (fun v -> GapiJson.render_object "addProtectedRange" (AddProtectedRangeRequest.render_content v)) x.addProtectedRange;
      (fun v -> GapiJson.render_object "sortRange" (SortRangeRequest.render_content v)) x.sortRange;
      (fun v -> GapiJson.render_object "mergeCells" (MergeCellsRequest.render_content v)) x.mergeCells;
      (fun v -> GapiJson.render_object "addChart" (AddChartRequest.render_content v)) x.addChart;
      (fun v -> GapiJson.render_object "pasteData" (PasteDataRequest.render_content v)) x.pasteData;
      (fun v -> GapiJson.render_object "refreshDataSource" (RefreshDataSourceRequest.render_content v)) x.refreshDataSource;
      (fun v -> GapiJson.render_object "addNamedRange" (AddNamedRangeRequest.render_content v)) x.addNamedRange;
      (fun v -> GapiJson.render_object "deleteSheet" (DeleteSheetRequest.render_content v)) x.deleteSheet;
      (fun v -> GapiJson.render_object "insertDimension" (InsertDimensionRequest.render_content v)) x.insertDimension;
      (fun v -> GapiJson.render_object "updateSheetProperties" (UpdateSheetPropertiesRequest.render_content v)) x.updateSheetProperties;
      (fun v -> GapiJson.render_object "deleteFilterView" (DeleteFilterViewRequest.render_content v)) x.deleteFilterView;
      (fun v -> GapiJson.render_object "insertRange" (InsertRangeRequest.render_content v)) x.insertRange;
      (fun v -> GapiJson.render_object "updateEmbeddedObjectPosition" (UpdateEmbeddedObjectPositionRequest.render_content v)) x.updateEmbeddedObjectPosition;
      (fun v -> GapiJson.render_object "findReplace" (FindReplaceRequest.render_content v)) x.findReplace;
      (fun v -> GapiJson.render_object "updateBanding" (UpdateBandingRequest.render_content v)) x.updateBanding;
      (fun v -> GapiJson.render_object "appendCells" (AppendCellsRequest.render_content v)) x.appendCells;
      (fun v -> GapiJson.render_object "updateCells" (UpdateCellsRequest.render_content v)) x.updateCells;
      (fun v -> GapiJson.render_object "deleteRange" (DeleteRangeRequest.render_content v)) x.deleteRange;
      (fun v -> GapiJson.render_object "updateEmbeddedObjectBorder" (UpdateEmbeddedObjectBorderRequest.render_content v)) x.updateEmbeddedObjectBorder;
      (fun v -> GapiJson.render_object "addConditionalFormatRule" (AddConditionalFormatRuleRequest.render_content v)) x.addConditionalFormatRule;
      (fun v -> GapiJson.render_object "appendDimension" (AppendDimensionRequest.render_content v)) x.appendDimension;
      (fun v -> GapiJson.render_object "textToColumns" (TextToColumnsRequest.render_content v)) x.textToColumns;
      (fun v -> GapiJson.render_object "updateConditionalFormatRule" (UpdateConditionalFormatRuleRequest.render_content v)) x.updateConditionalFormatRule;
      (fun v -> GapiJson.render_object "addBanding" (AddBandingRequest.render_content v)) x.addBanding;
      (fun v -> GapiJson.render_object "updateDimensionGroup" (UpdateDimensionGroupRequest.render_content v)) x.updateDimensionGroup;
      (fun v -> GapiJson.render_object "deleteDeveloperMetadata" (DeleteDeveloperMetadataRequest.render_content v)) x.deleteDeveloperMetadata;
      (fun v -> GapiJson.render_object "updateProtectedRange" (UpdateProtectedRangeRequest.render_content v)) x.updateProtectedRange;
      (fun v -> GapiJson.render_object "setDataValidation" (SetDataValidationRequest.render_content v)) x.setDataValidation;
      (fun v -> GapiJson.render_object "copyPaste" (CopyPasteRequest.render_content v)) x.copyPaste;
      (fun v -> GapiJson.render_object "deleteProtectedRange" (DeleteProtectedRangeRequest.render_content v)) x.deleteProtectedRange;
      (fun v -> GapiJson.render_object "updateNamedRange" (UpdateNamedRangeRequest.render_content v)) x.updateNamedRange;
      (fun v -> GapiJson.render_object "deleteDimensionGroup" (DeleteDimensionGroupRequest.render_content v)) x.deleteDimensionGroup;
      (fun v -> GapiJson.render_object "repeatCell" (RepeatCellRequest.render_content v)) x.repeatCell;
      (fun v -> GapiJson.render_object "updateSlicerSpec" (UpdateSlicerSpecRequest.render_content v)) x.updateSlicerSpec;
      (fun v -> GapiJson.render_object "updateDeveloperMetadata" (UpdateDeveloperMetadataRequest.render_content v)) x.updateDeveloperMetadata;
      (fun v -> GapiJson.render_object "deleteBanding" (DeleteBandingRequest.render_content v)) x.deleteBanding;
      (fun v -> GapiJson.render_object "updateDataSource" (UpdateDataSourceRequest.render_content v)) x.updateDataSource;
      (fun v -> GapiJson.render_object "randomizeRange" (RandomizeRangeRequest.render_content v)) x.randomizeRange;
      (fun v -> GapiJson.render_object "deleteDimension" (DeleteDimensionRequest.render_content v)) x.deleteDimension;
      (fun v -> GapiJson.render_object "deleteEmbeddedObject" (DeleteEmbeddedObjectRequest.render_content v)) x.deleteEmbeddedObject;
      (fun v -> GapiJson.render_object "autoResizeDimensions" (AutoResizeDimensionsRequest.render_content v)) x.autoResizeDimensions;
      (fun v -> GapiJson.render_object "addSheet" (AddSheetRequest.render_content v)) x.addSheet;
      (fun v -> GapiJson.render_object "deleteDataSource" (DeleteDataSourceRequest.render_content v)) x.deleteDataSource;
      (fun v -> GapiJson.render_object "addFilterView" (AddFilterViewRequest.render_content v)) x.addFilterView;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addDimensionGroup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddDimensionGroupRequest.parse
        AddDimensionGroupRequest.empty
        (fun v -> { x with addDimensionGroup = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteConditionalFormatRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteConditionalFormatRuleRequest.parse
        DeleteConditionalFormatRuleRequest.empty
        (fun v -> { x with deleteConditionalFormatRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setBasicFilter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SetBasicFilterRequest.parse
        SetBasicFilterRequest.empty
        (fun v -> { x with setBasicFilter = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "duplicateFilterView"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DuplicateFilterViewRequest.parse
        DuplicateFilterViewRequest.empty
        (fun v -> { x with duplicateFilterView = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "clearBasicFilter"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ClearBasicFilterRequest.parse
        ClearBasicFilterRequest.empty
        (fun v -> { x with clearBasicFilter = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateDimensionProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateDimensionPropertiesRequest.parse
        UpdateDimensionPropertiesRequest.empty
        (fun v -> { x with updateDimensionProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "cutPaste"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CutPasteRequest.parse
        CutPasteRequest.empty
        (fun v -> { x with cutPaste = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteNamedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteNamedRangeRequest.parse
        DeleteNamedRangeRequest.empty
        (fun v -> { x with deleteNamedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateChartSpec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateChartSpecRequest.parse
        UpdateChartSpecRequest.empty
        (fun v -> { x with updateChartSpec = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "trimWhitespace"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TrimWhitespaceRequest.parse
        TrimWhitespaceRequest.empty
        (fun v -> { x with trimWhitespace = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateBorders"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateBordersRequest.parse
        UpdateBordersRequest.empty
        (fun v -> { x with updateBorders = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "autoFill"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AutoFillRequest.parse
        AutoFillRequest.empty
        (fun v -> { x with autoFill = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDuplicates"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDuplicatesRequest.parse
        DeleteDuplicatesRequest.empty
        (fun v -> { x with deleteDuplicates = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateFilterView"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateFilterViewRequest.parse
        UpdateFilterViewRequest.empty
        (fun v -> { x with updateFilterView = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "unmergeCells"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UnmergeCellsRequest.parse
        UnmergeCellsRequest.empty
        (fun v -> { x with unmergeCells = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "duplicateSheet"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DuplicateSheetRequest.parse
        DuplicateSheetRequest.empty
        (fun v -> { x with duplicateSheet = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddDataSourceRequest.parse
        AddDataSourceRequest.empty
        (fun v -> { x with addDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addSlicer"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddSlicerRequest.parse
        AddSlicerRequest.empty
        (fun v -> { x with addSlicer = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "moveDimension"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MoveDimensionRequest.parse
        MoveDimensionRequest.empty
        (fun v -> { x with moveDimension = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "createDeveloperMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CreateDeveloperMetadataRequest.parse
        CreateDeveloperMetadataRequest.empty
        (fun v -> { x with createDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateSpreadsheetProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateSpreadsheetPropertiesRequest.parse
        UpdateSpreadsheetPropertiesRequest.empty
        (fun v -> { x with updateSpreadsheetProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addProtectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddProtectedRangeRequest.parse
        AddProtectedRangeRequest.empty
        (fun v -> { x with addProtectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sortRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SortRangeRequest.parse
        SortRangeRequest.empty
        (fun v -> { x with sortRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "mergeCells"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MergeCellsRequest.parse
        MergeCellsRequest.empty
        (fun v -> { x with mergeCells = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addChart"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddChartRequest.parse
        AddChartRequest.empty
        (fun v -> { x with addChart = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pasteData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PasteDataRequest.parse
        PasteDataRequest.empty
        (fun v -> { x with pasteData = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "refreshDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RefreshDataSourceRequest.parse
        RefreshDataSourceRequest.empty
        (fun v -> { x with refreshDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addNamedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddNamedRangeRequest.parse
        AddNamedRangeRequest.empty
        (fun v -> { x with addNamedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteSheet"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteSheetRequest.parse
        DeleteSheetRequest.empty
        (fun v -> { x with deleteSheet = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "insertDimension"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        InsertDimensionRequest.parse
        InsertDimensionRequest.empty
        (fun v -> { x with insertDimension = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateSheetProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateSheetPropertiesRequest.parse
        UpdateSheetPropertiesRequest.empty
        (fun v -> { x with updateSheetProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteFilterView"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteFilterViewRequest.parse
        DeleteFilterViewRequest.empty
        (fun v -> { x with deleteFilterView = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "insertRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        InsertRangeRequest.parse
        InsertRangeRequest.empty
        (fun v -> { x with insertRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateEmbeddedObjectPosition"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateEmbeddedObjectPositionRequest.parse
        UpdateEmbeddedObjectPositionRequest.empty
        (fun v -> { x with updateEmbeddedObjectPosition = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "findReplace"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FindReplaceRequest.parse
        FindReplaceRequest.empty
        (fun v -> { x with findReplace = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateBanding"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateBandingRequest.parse
        UpdateBandingRequest.empty
        (fun v -> { x with updateBanding = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "appendCells"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AppendCellsRequest.parse
        AppendCellsRequest.empty
        (fun v -> { x with appendCells = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateCells"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateCellsRequest.parse
        UpdateCellsRequest.empty
        (fun v -> { x with updateCells = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteRangeRequest.parse
        DeleteRangeRequest.empty
        (fun v -> { x with deleteRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateEmbeddedObjectBorder"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateEmbeddedObjectBorderRequest.parse
        UpdateEmbeddedObjectBorderRequest.empty
        (fun v -> { x with updateEmbeddedObjectBorder = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addConditionalFormatRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddConditionalFormatRuleRequest.parse
        AddConditionalFormatRuleRequest.empty
        (fun v -> { x with addConditionalFormatRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "appendDimension"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AppendDimensionRequest.parse
        AppendDimensionRequest.empty
        (fun v -> { x with appendDimension = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "textToColumns"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TextToColumnsRequest.parse
        TextToColumnsRequest.empty
        (fun v -> { x with textToColumns = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateConditionalFormatRule"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateConditionalFormatRuleRequest.parse
        UpdateConditionalFormatRuleRequest.empty
        (fun v -> { x with updateConditionalFormatRule = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addBanding"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddBandingRequest.parse
        AddBandingRequest.empty
        (fun v -> { x with addBanding = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateDimensionGroup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateDimensionGroupRequest.parse
        UpdateDimensionGroupRequest.empty
        (fun v -> { x with updateDimensionGroup = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDeveloperMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDeveloperMetadataRequest.parse
        DeleteDeveloperMetadataRequest.empty
        (fun v -> { x with deleteDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateProtectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateProtectedRangeRequest.parse
        UpdateProtectedRangeRequest.empty
        (fun v -> { x with updateProtectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setDataValidation"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SetDataValidationRequest.parse
        SetDataValidationRequest.empty
        (fun v -> { x with setDataValidation = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "copyPaste"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CopyPasteRequest.parse
        CopyPasteRequest.empty
        (fun v -> { x with copyPaste = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteProtectedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteProtectedRangeRequest.parse
        DeleteProtectedRangeRequest.empty
        (fun v -> { x with deleteProtectedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateNamedRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateNamedRangeRequest.parse
        UpdateNamedRangeRequest.empty
        (fun v -> { x with updateNamedRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDimensionGroup"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDimensionGroupRequest.parse
        DeleteDimensionGroupRequest.empty
        (fun v -> { x with deleteDimensionGroup = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "repeatCell"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RepeatCellRequest.parse
        RepeatCellRequest.empty
        (fun v -> { x with repeatCell = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateSlicerSpec"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateSlicerSpecRequest.parse
        UpdateSlicerSpecRequest.empty
        (fun v -> { x with updateSlicerSpec = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateDeveloperMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateDeveloperMetadataRequest.parse
        UpdateDeveloperMetadataRequest.empty
        (fun v -> { x with updateDeveloperMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteBanding"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteBandingRequest.parse
        DeleteBandingRequest.empty
        (fun v -> { x with deleteBanding = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updateDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        UpdateDataSourceRequest.parse
        UpdateDataSourceRequest.empty
        (fun v -> { x with updateDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "randomizeRange"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RandomizeRangeRequest.parse
        RandomizeRangeRequest.empty
        (fun v -> { x with randomizeRange = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDimension"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDimensionRequest.parse
        DeleteDimensionRequest.empty
        (fun v -> { x with deleteDimension = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteEmbeddedObject"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteEmbeddedObjectRequest.parse
        DeleteEmbeddedObjectRequest.empty
        (fun v -> { x with deleteEmbeddedObject = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "autoResizeDimensions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AutoResizeDimensionsRequest.parse
        AutoResizeDimensionsRequest.empty
        (fun v -> { x with autoResizeDimensions = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addSheet"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddSheetRequest.parse
        AddSheetRequest.empty
        (fun v -> { x with addSheet = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "deleteDataSource"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeleteDataSourceRequest.parse
        DeleteDataSourceRequest.empty
        (fun v -> { x with deleteDataSource = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addFilterView"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AddFilterViewRequest.parse
        AddFilterViewRequest.empty
        (fun v -> { x with addFilterView = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.Request.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module BatchUpdateSpreadsheetRequest =
struct
  type t = {
    includeSpreadsheetInResponse : bool;
    requests : Request.t list;
    responseIncludeGridData : bool;
    responseRanges : string list;
    
  }
  
  let includeSpreadsheetInResponse = {
    GapiLens.get = (fun x -> x.includeSpreadsheetInResponse);
    GapiLens.set = (fun v x -> { x with includeSpreadsheetInResponse = v });
  }
  let requests = {
    GapiLens.get = (fun x -> x.requests);
    GapiLens.set = (fun v x -> { x with requests = v });
  }
  let responseIncludeGridData = {
    GapiLens.get = (fun x -> x.responseIncludeGridData);
    GapiLens.set = (fun v x -> { x with responseIncludeGridData = v });
  }
  let responseRanges = {
    GapiLens.get = (fun x -> x.responseRanges);
    GapiLens.set = (fun v x -> { x with responseRanges = v });
  }
  
  let empty = {
    includeSpreadsheetInResponse = false;
    requests = [];
    responseIncludeGridData = false;
    responseRanges = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "includeSpreadsheetInResponse" x.includeSpreadsheetInResponse;
      GapiJson.render_array "requests" Request.render x.requests;
      GapiJson.render_bool_value "responseIncludeGridData" x.responseIncludeGridData;
      GapiJson.render_array "responseRanges" (GapiJson.render_string_value "") x.responseRanges;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "includeSpreadsheetInResponse"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with includeSpreadsheetInResponse = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "requests"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Request.parse
              Request.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateSpreadsheetRequest.parse.parse_collection" e x')
        Request.empty
        (fun v -> { x with requests = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseIncludeGridData"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with responseIncludeGridData = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "responseRanges"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateSpreadsheetRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with responseRanges = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateSpreadsheetRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module MatchedDeveloperMetadata =
struct
  type t = {
    dataFilters : DataFilter.t list;
    developerMetadata : DeveloperMetadata.t;
    
  }
  
  let dataFilters = {
    GapiLens.get = (fun x -> x.dataFilters);
    GapiLens.set = (fun v x -> { x with dataFilters = v });
  }
  let developerMetadata = {
    GapiLens.get = (fun x -> x.developerMetadata);
    GapiLens.set = (fun v x -> { x with developerMetadata = v });
  }
  
  let empty = {
    dataFilters = [];
    developerMetadata = DeveloperMetadata.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
      (fun v -> GapiJson.render_object "developerMetadata" (DeveloperMetadata.render_content v)) x.developerMetadata;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DataFilter.parse
              DataFilter.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiSheetsV4Model.MatchedDeveloperMetadata.parse.parse_collection" e x')
        DataFilter.empty
        (fun v -> { x with dataFilters = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "developerMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DeveloperMetadata.parse
        DeveloperMetadata.empty
        (fun v -> { x with developerMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.MatchedDeveloperMetadata.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module UpdateValuesResponse =
struct
  type t = {
    updatedRows : int;
    updatedColumns : int;
    updatedRange : string;
    updatedData : ValueRange.t;
    spreadsheetId : string;
    updatedCells : int;
    
  }
  
  let updatedRows = {
    GapiLens.get = (fun x -> x.updatedRows);
    GapiLens.set = (fun v x -> { x with updatedRows = v });
  }
  let updatedColumns = {
    GapiLens.get = (fun x -> x.updatedColumns);
    GapiLens.set = (fun v x -> { x with updatedColumns = v });
  }
  let updatedRange = {
    GapiLens.get = (fun x -> x.updatedRange);
    GapiLens.set = (fun v x -> { x with updatedRange = v });
  }
  let updatedData = {
    GapiLens.get = (fun x -> x.updatedData);
    GapiLens.set = (fun v x -> { x with updatedData = v });
  }
  let spreadsheetId = {
    GapiLens.get = (fun x -> x.spreadsheetId);
    GapiLens.set = (fun v x -> { x with spreadsheetId = v });
  }
  let updatedCells = {
    GapiLens.get = (fun x -> x.updatedCells);
    GapiLens.set = (fun v x -> { x with updatedCells = v });
  }
  
  let empty = {
    updatedRows = 0;
    updatedColumns = 0;
    updatedRange = "";
    updatedData = ValueRange.empty;
    spreadsheetId = "";
    updatedCells = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "updatedRows" x.updatedRows;
      GapiJson.render_int_value "updatedColumns" x.updatedColumns;
      GapiJson.render_string_value "updatedRange" x.updatedRange;
      (fun v -> GapiJson.render_object "updatedData" (ValueRange.render_content v)) x.updatedData;
      GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
      GapiJson.render_int_value "updatedCells" x.updatedCells;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedRows"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with updatedRows = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedColumns"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with updatedColumns = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedRange"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updatedRange = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "updatedData"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ValueRange.parse
        ValueRange.empty
        (fun v -> { x with updatedData = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with spreadsheetId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updatedCells"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with updatedCells = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiSheetsV4Model.UpdateValuesResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ClearValuesRequest =
struct
  type t = unit
    
    
    let empty = ()
      
      let rec render_content x = 
         [
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.ClearValuesRequest.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchClearValuesByDataFilterResponse =
    struct
      type t = {
        spreadsheetId : string;
        clearedRanges : string list;
        
      }
      
      let spreadsheetId = {
        GapiLens.get = (fun x -> x.spreadsheetId);
        GapiLens.set = (fun v x -> { x with spreadsheetId = v });
      }
      let clearedRanges = {
        GapiLens.get = (fun x -> x.clearedRanges);
        GapiLens.set = (fun v x -> { x with clearedRanges = v });
      }
      
      let empty = {
        spreadsheetId = "";
        clearedRanges = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
          GapiJson.render_array "clearedRanges" (GapiJson.render_string_value "") x.clearedRanges;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with spreadsheetId = v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "clearedRanges"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                  `String v) ->
                v
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesByDataFilterResponse.parse.parse_collection" e x')
            ""
            (fun v -> { x with clearedRanges = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesByDataFilterResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchGetValuesByDataFilterRequest =
    struct
      type t = {
        valueRenderOption : string;
        dataFilters : DataFilter.t list;
        dateTimeRenderOption : string;
        majorDimension : string;
        
      }
      
      let valueRenderOption = {
        GapiLens.get = (fun x -> x.valueRenderOption);
        GapiLens.set = (fun v x -> { x with valueRenderOption = v });
      }
      let dataFilters = {
        GapiLens.get = (fun x -> x.dataFilters);
        GapiLens.set = (fun v x -> { x with dataFilters = v });
      }
      let dateTimeRenderOption = {
        GapiLens.get = (fun x -> x.dateTimeRenderOption);
        GapiLens.set = (fun v x -> { x with dateTimeRenderOption = v });
      }
      let majorDimension = {
        GapiLens.get = (fun x -> x.majorDimension);
        GapiLens.set = (fun v x -> { x with majorDimension = v });
      }
      
      let empty = {
        valueRenderOption = "";
        dataFilters = [];
        dateTimeRenderOption = "";
        majorDimension = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "valueRenderOption" x.valueRenderOption;
          GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
          GapiJson.render_string_value "dateTimeRenderOption" x.dateTimeRenderOption;
          GapiJson.render_string_value "majorDimension" x.majorDimension;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "valueRenderOption"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with valueRenderOption = v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  DataFilter.parse
                  DataFilter.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchGetValuesByDataFilterRequest.parse.parse_collection" e x')
            DataFilter.empty
            (fun v -> { x with dataFilters = v })
            cs
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "dateTimeRenderOption"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with dateTimeRenderOption = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "majorDimension"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with majorDimension = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchGetValuesByDataFilterRequest.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module ClearValuesResponse =
    struct
      type t = {
        clearedRange : string;
        spreadsheetId : string;
        
      }
      
      let clearedRange = {
        GapiLens.get = (fun x -> x.clearedRange);
        GapiLens.set = (fun v x -> { x with clearedRange = v });
      }
      let spreadsheetId = {
        GapiLens.get = (fun x -> x.spreadsheetId);
        GapiLens.set = (fun v x -> { x with spreadsheetId = v });
      }
      
      let empty = {
        clearedRange = "";
        spreadsheetId = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "clearedRange" x.clearedRange;
          GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "clearedRange"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with clearedRange = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with spreadsheetId = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.ClearValuesResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchGetValuesByDataFilterResponse =
    struct
      type t = {
        spreadsheetId : string;
        valueRanges : MatchedValueRange.t list;
        
      }
      
      let spreadsheetId = {
        GapiLens.get = (fun x -> x.spreadsheetId);
        GapiLens.set = (fun v x -> { x with spreadsheetId = v });
      }
      let valueRanges = {
        GapiLens.get = (fun x -> x.valueRanges);
        GapiLens.set = (fun v x -> { x with valueRanges = v });
      }
      
      let empty = {
        spreadsheetId = "";
        valueRanges = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
          GapiJson.render_array "valueRanges" MatchedValueRange.render x.valueRanges;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with spreadsheetId = v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "valueRanges"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  MatchedValueRange.parse
                  MatchedValueRange.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchGetValuesByDataFilterResponse.parse.parse_collection" e x')
            MatchedValueRange.empty
            (fun v -> { x with valueRanges = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchGetValuesByDataFilterResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module SearchDeveloperMetadataRequest =
    struct
      type t = {
        dataFilters : DataFilter.t list;
        
      }
      
      let dataFilters = {
        GapiLens.get = (fun x -> x.dataFilters);
        GapiLens.set = (fun v x -> { x with dataFilters = v });
      }
      
      let empty = {
        dataFilters = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  DataFilter.parse
                  DataFilter.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.SearchDeveloperMetadataRequest.parse.parse_collection" e x')
            DataFilter.empty
            (fun v -> { x with dataFilters = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.SearchDeveloperMetadataRequest.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchClearValuesRequest =
    struct
      type t = {
        ranges : string list;
        
      }
      
      let ranges = {
        GapiLens.get = (fun x -> x.ranges);
        GapiLens.set = (fun v x -> { x with ranges = v });
      }
      
      let empty = {
        ranges = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "ranges" (GapiJson.render_string_value "") x.ranges;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "ranges"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                  `String v) ->
                v
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesRequest.parse.parse_collection" e x')
            ""
            (fun v -> { x with ranges = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesRequest.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module AppendValuesResponse =
    struct
      type t = {
        updates : UpdateValuesResponse.t;
        spreadsheetId : string;
        tableRange : string;
        
      }
      
      let updates = {
        GapiLens.get = (fun x -> x.updates);
        GapiLens.set = (fun v x -> { x with updates = v });
      }
      let spreadsheetId = {
        GapiLens.get = (fun x -> x.spreadsheetId);
        GapiLens.set = (fun v x -> { x with spreadsheetId = v });
      }
      let tableRange = {
        GapiLens.get = (fun x -> x.tableRange);
        GapiLens.set = (fun v x -> { x with tableRange = v });
      }
      
      let empty = {
        updates = UpdateValuesResponse.empty;
        spreadsheetId = "";
        tableRange = "";
        
      }
      
      let rec render_content x = 
         [
          (fun v -> GapiJson.render_object "updates" (UpdateValuesResponse.render_content v)) x.updates;
          GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
          GapiJson.render_string_value "tableRange" x.tableRange;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "updates"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            UpdateValuesResponse.parse
            UpdateValuesResponse.empty
            (fun v -> { x with updates = v })
            cs
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with spreadsheetId = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "tableRange"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with tableRange = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.AppendValuesResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchUpdateValuesResponse =
    struct
      type t = {
        totalUpdatedCells : int;
        responses : UpdateValuesResponse.t list;
        spreadsheetId : string;
        totalUpdatedColumns : int;
        totalUpdatedSheets : int;
        totalUpdatedRows : int;
        
      }
      
      let totalUpdatedCells = {
        GapiLens.get = (fun x -> x.totalUpdatedCells);
        GapiLens.set = (fun v x -> { x with totalUpdatedCells = v });
      }
      let responses = {
        GapiLens.get = (fun x -> x.responses);
        GapiLens.set = (fun v x -> { x with responses = v });
      }
      let spreadsheetId = {
        GapiLens.get = (fun x -> x.spreadsheetId);
        GapiLens.set = (fun v x -> { x with spreadsheetId = v });
      }
      let totalUpdatedColumns = {
        GapiLens.get = (fun x -> x.totalUpdatedColumns);
        GapiLens.set = (fun v x -> { x with totalUpdatedColumns = v });
      }
      let totalUpdatedSheets = {
        GapiLens.get = (fun x -> x.totalUpdatedSheets);
        GapiLens.set = (fun v x -> { x with totalUpdatedSheets = v });
      }
      let totalUpdatedRows = {
        GapiLens.get = (fun x -> x.totalUpdatedRows);
        GapiLens.set = (fun v x -> { x with totalUpdatedRows = v });
      }
      
      let empty = {
        totalUpdatedCells = 0;
        responses = [];
        spreadsheetId = "";
        totalUpdatedColumns = 0;
        totalUpdatedSheets = 0;
        totalUpdatedRows = 0;
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_int_value "totalUpdatedCells" x.totalUpdatedCells;
          GapiJson.render_array "responses" UpdateValuesResponse.render x.responses;
          GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
          GapiJson.render_int_value "totalUpdatedColumns" x.totalUpdatedColumns;
          GapiJson.render_int_value "totalUpdatedSheets" x.totalUpdatedSheets;
          GapiJson.render_int_value "totalUpdatedRows" x.totalUpdatedRows;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "totalUpdatedCells"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with totalUpdatedCells = v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "responses"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  UpdateValuesResponse.parse
                  UpdateValuesResponse.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesResponse.parse.parse_collection" e x')
            UpdateValuesResponse.empty
            (fun v -> { x with responses = v })
            cs
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with spreadsheetId = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "totalUpdatedColumns"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with totalUpdatedColumns = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "totalUpdatedSheets"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with totalUpdatedSheets = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "totalUpdatedRows"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with totalUpdatedRows = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchClearValuesByDataFilterRequest =
    struct
      type t = {
        dataFilters : DataFilter.t list;
        
      }
      
      let dataFilters = {
        GapiLens.get = (fun x -> x.dataFilters);
        GapiLens.set = (fun v x -> { x with dataFilters = v });
      }
      
      let empty = {
        dataFilters = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "dataFilters" DataFilter.render x.dataFilters;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "dataFilters"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  DataFilter.parse
                  DataFilter.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesByDataFilterRequest.parse.parse_collection" e x')
            DataFilter.empty
            (fun v -> { x with dataFilters = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchClearValuesByDataFilterRequest.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchUpdateValuesByDataFilterRequest =
    struct
      type t = {
        responseDateTimeRenderOption : string;
        responseValueRenderOption : string;
        valueInputOption : string;
        includeValuesInResponse : bool;
        data : DataFilterValueRange.t list;
        
      }
      
      let responseDateTimeRenderOption = {
        GapiLens.get = (fun x -> x.responseDateTimeRenderOption);
        GapiLens.set = (fun v x -> { x with responseDateTimeRenderOption = v });
      }
      let responseValueRenderOption = {
        GapiLens.get = (fun x -> x.responseValueRenderOption);
        GapiLens.set = (fun v x -> { x with responseValueRenderOption = v });
      }
      let valueInputOption = {
        GapiLens.get = (fun x -> x.valueInputOption);
        GapiLens.set = (fun v x -> { x with valueInputOption = v });
      }
      let includeValuesInResponse = {
        GapiLens.get = (fun x -> x.includeValuesInResponse);
        GapiLens.set = (fun v x -> { x with includeValuesInResponse = v });
      }
      let data = {
        GapiLens.get = (fun x -> x.data);
        GapiLens.set = (fun v x -> { x with data = v });
      }
      
      let empty = {
        responseDateTimeRenderOption = "";
        responseValueRenderOption = "";
        valueInputOption = "";
        includeValuesInResponse = false;
        data = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "responseDateTimeRenderOption" x.responseDateTimeRenderOption;
          GapiJson.render_string_value "responseValueRenderOption" x.responseValueRenderOption;
          GapiJson.render_string_value "valueInputOption" x.valueInputOption;
          GapiJson.render_bool_value "includeValuesInResponse" x.includeValuesInResponse;
          GapiJson.render_array "data" DataFilterValueRange.render x.data;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "responseDateTimeRenderOption"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with responseDateTimeRenderOption = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "responseValueRenderOption"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with responseValueRenderOption = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "valueInputOption"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with valueInputOption = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "includeValuesInResponse"; data_type = GapiJson.Scalar },
            `Bool v) ->
          { x with includeValuesInResponse = v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "data"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  DataFilterValueRange.parse
                  DataFilterValueRange.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesByDataFilterRequest.parse.parse_collection" e x')
            DataFilterValueRange.empty
            (fun v -> { x with data = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchUpdateValuesByDataFilterRequest.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module BatchGetValuesResponse =
    struct
      type t = {
        valueRanges : ValueRange.t list;
        spreadsheetId : string;
        
      }
      
      let valueRanges = {
        GapiLens.get = (fun x -> x.valueRanges);
        GapiLens.set = (fun v x -> { x with valueRanges = v });
      }
      let spreadsheetId = {
        GapiLens.get = (fun x -> x.spreadsheetId);
        GapiLens.set = (fun v x -> { x with spreadsheetId = v });
      }
      
      let empty = {
        valueRanges = [];
        spreadsheetId = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "valueRanges" ValueRange.render x.valueRanges;
          GapiJson.render_string_value "spreadsheetId" x.spreadsheetId;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "valueRanges"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  ValueRange.parse
                  ValueRange.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.BatchGetValuesResponse.parse.parse_collection" e x')
            ValueRange.empty
            (fun v -> { x with valueRanges = v })
            cs
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "spreadsheetId"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with spreadsheetId = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.BatchGetValuesResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    module SearchDeveloperMetadataResponse =
    struct
      type t = {
        matchedDeveloperMetadata : MatchedDeveloperMetadata.t list;
        
      }
      
      let matchedDeveloperMetadata = {
        GapiLens.get = (fun x -> x.matchedDeveloperMetadata);
        GapiLens.set = (fun v x -> { x with matchedDeveloperMetadata = v });
      }
      
      let empty = {
        matchedDeveloperMetadata = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "matchedDeveloperMetadata" MatchedDeveloperMetadata.render x.matchedDeveloperMetadata;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "matchedDeveloperMetadata"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  MatchedDeveloperMetadata.parse
                  MatchedDeveloperMetadata.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiSheetsV4Model.SearchDeveloperMetadataResponse.parse.parse_collection" e x')
            MatchedDeveloperMetadata.empty
            (fun v -> { x with matchedDeveloperMetadata = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiSheetsV4Model.SearchDeveloperMetadataResponse.parse" e x
      
      let to_data_model = GapiJson.render_root render
      
      let of_data_model = GapiJson.parse_root parse empty
      
    end
    
    