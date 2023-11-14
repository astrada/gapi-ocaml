(* Warning! This file is generated. Modify at your own risk.
        *)

(** Data definition for Google Sheets API (v4).
  
  For more information about this data model, see the
  {{:https://developers.google.com/sheets/}API Documentation}.
  *)

module DimensionRange :
sig
  type t = {
    startIndex : int;
    (** The start (inclusive) of the span, or not set if unbounded. *)
    dimension : string;
    (** The dimension of the span. *)
    sheetId : int;
    (** The sheet this span is on. *)
    endIndex : int;
    (** The end (exclusive) of the span, or not set if unbounded. *)
    
  }
  
  val startIndex : (t, int) GapiLens.t
  val dimension : (t, string) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  val endIndex : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeveloperMetadataLocation :
sig
  type t = {
    dimensionRange : DimensionRange.t;
    (** Represents the row or column when metadata is associated with a dimension. The specified DimensionRange must represent a single row or column; it cannot be unbounded or span multiple rows or columns. *)
    sheetId : int;
    (** The ID of the sheet when metadata is associated with an entire sheet. *)
    locationType : string;
    (** The type of location this object represents. This field is read-only. *)
    spreadsheet : bool;
    (** True when metadata is associated with an entire spreadsheet. *)
    
  }
  
  val dimensionRange : (t, DimensionRange.t) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  val locationType : (t, string) GapiLens.t
  val spreadsheet : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeveloperMetadata :
sig
  type t = {
    metadataKey : string;
    (** The metadata key. There may be multiple metadata in a spreadsheet with the same key. Developer metadata must always have a key specified. *)
    metadataValue : string;
    (** Data associated with the metadata's key. *)
    metadataId : int;
    (** The spreadsheet-scoped unique ID that identifies the metadata. IDs may be specified when metadata is created, otherwise one will be randomly generated and assigned. Must be positive. *)
    location : DeveloperMetadataLocation.t;
    (** The location where the metadata is associated. *)
    visibility : string;
    (** The metadata visibility. Developer metadata must always have a visibility specified. *)
    
  }
  
  val metadataKey : (t, string) GapiLens.t
  val metadataValue : (t, string) GapiLens.t
  val metadataId : (t, int) GapiLens.t
  val location : (t, DeveloperMetadataLocation.t) GapiLens.t
  val visibility : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateDeveloperMetadataResponse :
sig
  type t = {
    developerMetadata : DeveloperMetadata.t list;
    (** The updated developer metadata. *)
    
  }
  
  val developerMetadata : (t, DeveloperMetadata.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataExecutionStatus :
sig
  type t = {
    errorCode : string;
    (** The error code. *)
    errorMessage : string;
    (** The error message, which may be empty. *)
    state : string;
    (** The state of the data execution. *)
    lastRefreshTime : string;
    (** Gets the time the data last successfully refreshed. *)
    
  }
  
  val errorCode : (t, string) GapiLens.t
  val errorMessage : (t, string) GapiLens.t
  val state : (t, string) GapiLens.t
  val lastRefreshTime : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceColumnReference :
sig
  type t = {
    name : string;
    (** The display name of the column. It should be unique within a data source. *)
    
  }
  
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceColumn :
sig
  type t = {
    formula : string;
    (** The formula of the calculated column. *)
    reference : DataSourceColumnReference.t;
    (** The column reference. *)
    
  }
  
  val formula : (t, string) GapiLens.t
  val reference : (t, DataSourceColumnReference.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceSheetProperties :
sig
  type t = {
    columns : DataSourceColumn.t list;
    (** The columns displayed on the sheet, corresponding to the values in RowData. *)
    dataExecutionStatus : DataExecutionStatus.t;
    (** The data execution status. *)
    dataSourceId : string;
    (** ID of the DataSource the sheet is connected to. *)
    
  }
  
  val columns : (t, DataSourceColumn.t list) GapiLens.t
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  val dataSourceId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module LineStyle :
sig
  type t = {
    width : int;
    (** The thickness of the line, in px. *)
    _type : string;
    (** The dash type of the line. *)
    
  }
  
  val width : (t, int) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Editors :
sig
  type t = {
    users : string list;
    (** The email addresses of users with edit access to the protected range. *)
    domainUsersCanEdit : bool;
    (** True if anyone in the document's domain has edit access to the protected range. Domain protection is only supported on documents within a domain. *)
    groups : string list;
    (** The email addresses of groups with edit access to the protected range. *)
    
  }
  
  val users : (t, string list) GapiLens.t
  val domainUsersCanEdit : (t, bool) GapiLens.t
  val groups : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GridRange :
sig
  type t = {
    sheetId : int;
    (** The sheet this range is on. *)
    endRowIndex : int;
    (** The end row (exclusive) of the range, or not set if unbounded. *)
    endColumnIndex : int;
    (** The end column (exclusive) of the range, or not set if unbounded. *)
    startColumnIndex : int;
    (** The start column (inclusive) of the range, or not set if unbounded. *)
    startRowIndex : int;
    (** The start row (inclusive) of the range, or not set if unbounded. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  val endRowIndex : (t, int) GapiLens.t
  val endColumnIndex : (t, int) GapiLens.t
  val startColumnIndex : (t, int) GapiLens.t
  val startRowIndex : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ProtectedRange :
sig
  type t = {
    requestingUserCanEdit : bool;
    (** True if the user who requested this protected range can edit the protected area. This field is read-only. *)
    warningOnly : bool;
    (** True if this protected range will show a warning when editing. Warning-based protection means that every user can edit data in the protected range, except editing will prompt a warning asking the user to confirm the edit. When writing: if this field is true, then editors is ignored. Additionally, if this field is changed from true to false and the `editors` field is not set (nor included in the field mask), then the editors will be set to all the editors in the document. *)
    description : string;
    (** The description of this protected range. *)
    range : GridRange.t;
    (** The range that is being protected. The range may be fully unbounded, in which case this is considered a protected sheet. When writing, only one of range or named_range_id may be set. *)
    protectedRangeId : int;
    (** The ID of the protected range. This field is read-only. *)
    namedRangeId : string;
    (** The named range this protected range is backed by, if any. When writing, only one of range or named_range_id may be set. *)
    editors : Editors.t;
    (** The users and groups with edit access to the protected range. This field is only visible to users with edit access to the protected range and the document. Editors are not supported with warning_only protection. *)
    unprotectedRanges : GridRange.t list;
    (** The list of unprotected ranges within a protected sheet. Unprotected ranges are only supported on protected sheets. *)
    
  }
  
  val requestingUserCanEdit : (t, bool) GapiLens.t
  val warningOnly : (t, bool) GapiLens.t
  val description : (t, string) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val protectedRangeId : (t, int) GapiLens.t
  val namedRangeId : (t, string) GapiLens.t
  val editors : (t, Editors.t) GapiLens.t
  val unprotectedRanges : (t, GridRange.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateProtectedRangeRequest :
sig
  type t = {
    protectedRange : ProtectedRange.t;
    (** The protected range to update with the new properties. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `protectedRange` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    
  }
  
  val protectedRange : (t, ProtectedRange.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ValueRange :
sig
  type t = {
    values : string list list;
    (** The data that was read or to be written. This is an array of arrays, the outer array representing all the data and each inner array representing a major dimension. Each item in the inner array corresponds with one cell. For output, empty trailing rows and columns will not be included. For input, supported value types are: bool, string, and double. Null values will be skipped. To set a cell to an empty value, set the string value to an empty string. *)
    majorDimension : string;
    (** The major dimension of the values. For output, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then requesting `range=A1:B2,majorDimension=ROWS` will return `\[\[1,2\],\[3,4\]\]`, whereas requesting `range=A1:B2,majorDimension=COLUMNS` will return `\[\[1,3\],\[2,4\]\]`. For input, with `range=A1:B2,majorDimension=ROWS` then `\[\[1,2\],\[3,4\]\]` will set `A1=1,B1=2,A2=3,B2=4`. With `range=A1:B2,majorDimension=COLUMNS` then `\[\[1,2\],\[3,4\]\]` will set `A1=1,B1=3,A2=2,B2=4`. When writing, if this field is not set, it defaults to ROWS. *)
    range : string;
    (** The range the values cover, in A1 notation. For output, this range indicates the entire requested range, even though the values will exclude trailing rows and columns. When appending values, this field represents the range to search for a table, after which values will be appended. *)
    
  }
  
  val values : (t, string list list) GapiLens.t
  val majorDimension : (t, string) GapiLens.t
  val range : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeveloperMetadataLookup :
sig
  type t = {
    metadataLocation : DeveloperMetadataLocation.t;
    (** Limits the selected developer metadata to those entries associated with the specified location. This field either matches exact locations or all intersecting locations according the specified locationMatchingStrategy. *)
    locationType : string;
    (** Limits the selected developer metadata to those entries which are associated with locations of the specified type. For example, when this field is specified as ROW this lookup only considers developer metadata associated on rows. If the field is left unspecified, all location types are considered. This field cannot be specified as SPREADSHEET when the locationMatchingStrategy is specified as INTERSECTING or when the metadataLocation is specified as a non-spreadsheet location: spreadsheet metadata cannot intersect any other developer metadata location. This field also must be left unspecified when the locationMatchingStrategy is specified as EXACT. *)
    metadataId : int;
    (** Limits the selected developer metadata to that which has a matching DeveloperMetadata.metadata_id. *)
    metadataKey : string;
    (** Limits the selected developer metadata to that which has a matching DeveloperMetadata.metadata_key. *)
    visibility : string;
    (** Limits the selected developer metadata to that which has a matching DeveloperMetadata.visibility. If left unspecified, all developer metadata visibile to the requesting project is considered. *)
    metadataValue : string;
    (** Limits the selected developer metadata to that which has a matching DeveloperMetadata.metadata_value. *)
    locationMatchingStrategy : string;
    (** Determines how this lookup matches the location. If this field is specified as EXACT, only developer metadata associated on the exact location specified is matched. If this field is specified to INTERSECTING, developer metadata associated on intersecting locations is also matched. If left unspecified, this field assumes a default value of INTERSECTING. If this field is specified, a metadataLocation must also be specified. *)
    
  }
  
  val metadataLocation : (t, DeveloperMetadataLocation.t) GapiLens.t
  val locationType : (t, string) GapiLens.t
  val metadataId : (t, int) GapiLens.t
  val metadataKey : (t, string) GapiLens.t
  val visibility : (t, string) GapiLens.t
  val metadataValue : (t, string) GapiLens.t
  val locationMatchingStrategy : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataFilter :
sig
  type t = {
    developerMetadataLookup : DeveloperMetadataLookup.t;
    (** Selects data associated with the developer metadata matching the criteria described by this DeveloperMetadataLookup. *)
    gridRange : GridRange.t;
    (** Selects data that matches the range described by the GridRange. *)
    a1Range : string;
    (** Selects data that matches the specified A1 range. *)
    
  }
  
  val developerMetadataLookup : (t, DeveloperMetadataLookup.t) GapiLens.t
  val gridRange : (t, GridRange.t) GapiLens.t
  val a1Range : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateValuesByDataFilterResponse :
sig
  type t = {
    updatedData : ValueRange.t;
    (** The values of the cells in the range matched by the dataFilter after all updates were applied. This is only included if the request's `includeValuesInResponse` field was `true`. *)
    updatedRange : string;
    (** The range (in A1 notation) that updates were applied to. *)
    updatedColumns : int;
    (** The number of columns where at least one cell in the column was updated. *)
    dataFilter : DataFilter.t;
    (** The data filter that selected the range that was updated. *)
    updatedCells : int;
    (** The number of cells updated. *)
    updatedRows : int;
    (** The number of rows where at least one cell in the row was updated. *)
    
  }
  
  val updatedData : (t, ValueRange.t) GapiLens.t
  val updatedRange : (t, string) GapiLens.t
  val updatedColumns : (t, int) GapiLens.t
  val dataFilter : (t, DataFilter.t) GapiLens.t
  val updatedCells : (t, int) GapiLens.t
  val updatedRows : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BatchUpdateValuesByDataFilterResponse :
sig
  type t = {
    responses : UpdateValuesByDataFilterResponse.t list;
    (** The response for each range updated. *)
    totalUpdatedColumns : int;
    (** The total number of columns where at least one cell in the column was updated. *)
    totalUpdatedSheets : int;
    (** The total number of sheets where at least one cell in the sheet was updated. *)
    totalUpdatedRows : int;
    (** The total number of rows where at least one cell in the row was updated. *)
    totalUpdatedCells : int;
    (** The total number of cells updated. *)
    spreadsheetId : string;
    (** The spreadsheet the updates were applied to. *)
    
  }
  
  val responses : (t, UpdateValuesByDataFilterResponse.t list) GapiLens.t
  val totalUpdatedColumns : (t, int) GapiLens.t
  val totalUpdatedSheets : (t, int) GapiLens.t
  val totalUpdatedRows : (t, int) GapiLens.t
  val totalUpdatedCells : (t, int) GapiLens.t
  val spreadsheetId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConditionValue :
sig
  type t = {
    relativeDate : string;
    (** A relative date (based on the current date). Valid only if the type is DATE_BEFORE, DATE_AFTER, DATE_ON_OR_BEFORE or DATE_ON_OR_AFTER. Relative dates are not supported in data validation. They are supported only in conditional formatting and conditional filters. *)
    userEnteredValue : string;
    (** A value the condition is based on. The value is parsed as if the user typed into a cell. Formulas are supported (and must begin with an `=` or a '+'). *)
    
  }
  
  val relativeDate : (t, string) GapiLens.t
  val userEnteredValue : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BooleanCondition :
sig
  type t = {
    _type : string;
    (** The type of condition. *)
    values : ConditionValue.t list;
    (** The values of the condition. The number of supported values depends on the condition type. Some support zero values, others one or two values, and ConditionType.ONE_OF_LIST supports an arbitrary number of values. *)
    
  }
  
  val _type : (t, string) GapiLens.t
  val values : (t, ConditionValue.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotFilterCriteria :
sig
  type t = {
    visibleValues : string list;
    (** Values that should be included. Values not listed here are excluded. *)
    condition : BooleanCondition.t;
    (** A condition that must be true for values to be shown. (`visibleValues` does not override this -- even if a value is listed there, it is still hidden if it does not meet the condition.) Condition values that refer to ranges in A1-notation are evaluated relative to the pivot table sheet. References are treated absolutely, so are not filled down the pivot table. For example, a condition value of `=A1` on "Pivot Table 1" is treated as `'Pivot Table 1'!$A$1`. The source data of the pivot table can be referenced by column header name. For example, if the source data has columns named "Revenue" and "Cost" and a condition is applied to the "Revenue" column with type `NUMBER_GREATER` and value `=Cost`, then only columns where "Revenue" > "Cost" are included. *)
    visibleByDefault : bool;
    (** Whether values are visible by default. If true, the visible_values are ignored, all values that meet condition (if specified) are shown. If false, values that are both in visible_values and meet condition are shown. *)
    
  }
  
  val visibleValues : (t, string list) GapiLens.t
  val condition : (t, BooleanCondition.t) GapiLens.t
  val visibleByDefault : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotFilterSpec :
sig
  type t = {
    columnOffsetIndex : int;
    (** The column offset of the source range. *)
    filterCriteria : PivotFilterCriteria.t;
    (** The criteria for the column. *)
    dataSourceColumnReference : DataSourceColumnReference.t;
    (** The reference to the data source column. *)
    
  }
  
  val columnOffsetIndex : (t, int) GapiLens.t
  val filterCriteria : (t, PivotFilterCriteria.t) GapiLens.t
  val dataSourceColumnReference : (t, DataSourceColumnReference.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Color :
sig
  type t = {
    blue : float;
    (** The amount of blue in the color as a value in the interval \[0, 1\]. *)
    green : float;
    (** The amount of green in the color as a value in the interval \[0, 1\]. *)
    red : float;
    (** The amount of red in the color as a value in the interval \[0, 1\]. *)
    alpha : float;
    (** The fraction of this color that should be applied to the pixel. That is, the final pixel color is defined by the equation: `pixel color = alpha * (this color) + (1.0 - alpha) * (background color)` This means that a value of 1.0 corresponds to a solid color, whereas a value of 0.0 corresponds to a completely transparent color. This uses a wrapper message rather than a simple float scalar so that it is possible to distinguish between a default value and the value being unset. If omitted, this color object is rendered as a solid color (as if the alpha value had been explicitly given a value of 1.0). *)
    
  }
  
  val blue : (t, float) GapiLens.t
  val green : (t, float) GapiLens.t
  val red : (t, float) GapiLens.t
  val alpha : (t, float) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ColorStyle :
sig
  type t = {
    rgbColor : Color.t;
    (** RGB color. *)
    themeColor : string;
    (** Theme color. *)
    
  }
  
  val rgbColor : (t, Color.t) GapiLens.t
  val themeColor : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GridProperties :
sig
  type t = {
    columnGroupControlAfter : bool;
    (** True if the column grouping control toggle is shown after the group. *)
    rowGroupControlAfter : bool;
    (** True if the row grouping control toggle is shown after the group. *)
    hideGridlines : bool;
    (** True if the grid isn't showing gridlines in the UI. *)
    columnCount : int;
    (** The number of columns in the grid. *)
    frozenRowCount : int;
    (** The number of rows that are frozen in the grid. *)
    rowCount : int;
    (** The number of rows in the grid. *)
    frozenColumnCount : int;
    (** The number of columns that are frozen in the grid. *)
    
  }
  
  val columnGroupControlAfter : (t, bool) GapiLens.t
  val rowGroupControlAfter : (t, bool) GapiLens.t
  val hideGridlines : (t, bool) GapiLens.t
  val columnCount : (t, int) GapiLens.t
  val frozenRowCount : (t, int) GapiLens.t
  val rowCount : (t, int) GapiLens.t
  val frozenColumnCount : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SheetProperties :
sig
  type t = {
    sheetType : string;
    (** The type of sheet. Defaults to GRID. This field cannot be changed once set. *)
    dataSourceSheetProperties : DataSourceSheetProperties.t;
    (** Output only. If present, the field contains DATA_SOURCE sheet specific properties. *)
    hidden : bool;
    (** True if the sheet is hidden in the UI, false if it's visible. *)
    tabColor : Color.t;
    (** The color of the tab in the UI. *)
    rightToLeft : bool;
    (** True if the sheet is an RTL sheet instead of an LTR sheet. *)
    tabColorStyle : ColorStyle.t;
    (** The color of the tab in the UI. If tab_color is also set, this field takes precedence. *)
    title : string;
    (** The name of the sheet. *)
    sheetId : int;
    (** The ID of the sheet. Must be non-negative. This field cannot be changed once set. *)
    index : int;
    (** The index of the sheet within the spreadsheet. When adding or updating sheet properties, if this field is excluded then the sheet is added or moved to the end of the sheet list. When updating sheet indices or inserting sheets, movement is considered in "before the move" indexes. For example, if there were 3 sheets (S1, S2, S3) in order to move S1 ahead of S2 the index would have to be set to 2. A sheet index update request is ignored if the requested index is identical to the sheets current index or if the requested new index is equal to the current sheet index + 1. *)
    gridProperties : GridProperties.t;
    (** Additional properties of the sheet if this sheet is a grid. (If the sheet is an object sheet, containing a chart or image, then this field will be absent.) When writing it is an error to set any grid properties on non-grid sheets. If this sheet is a DATA_SOURCE sheet, this field is output only but contains the properties that reflect how a data source sheet is rendered in the UI, e.g. row_count. *)
    
  }
  
  val sheetType : (t, string) GapiLens.t
  val dataSourceSheetProperties : (t, DataSourceSheetProperties.t) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val tabColor : (t, Color.t) GapiLens.t
  val rightToLeft : (t, bool) GapiLens.t
  val tabColorStyle : (t, ColorStyle.t) GapiLens.t
  val title : (t, string) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  val index : (t, int) GapiLens.t
  val gridProperties : (t, GridProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddSheetResponse :
sig
  type t = {
    properties : SheetProperties.t;
    (** The properties of the newly added sheet. *)
    
  }
  
  val properties : (t, SheetProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GridCoordinate :
sig
  type t = {
    columnIndex : int;
    (** The column index of the coordinate. *)
    rowIndex : int;
    (** The row index of the coordinate. *)
    sheetId : int;
    (** The sheet this coordinate is on. *)
    
  }
  
  val columnIndex : (t, int) GapiLens.t
  val rowIndex : (t, int) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module OverlayPosition :
sig
  type t = {
    offsetXPixels : int;
    (** The horizontal offset, in pixels, that the object is offset from the anchor cell. *)
    offsetYPixels : int;
    (** The vertical offset, in pixels, that the object is offset from the anchor cell. *)
    anchorCell : GridCoordinate.t;
    (** The cell the object is anchored to. *)
    heightPixels : int;
    (** The height of the object, in pixels. Defaults to 371. *)
    widthPixels : int;
    (** The width of the object, in pixels. Defaults to 600. *)
    
  }
  
  val offsetXPixels : (t, int) GapiLens.t
  val offsetYPixels : (t, int) GapiLens.t
  val anchorCell : (t, GridCoordinate.t) GapiLens.t
  val heightPixels : (t, int) GapiLens.t
  val widthPixels : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EmbeddedObjectPosition :
sig
  type t = {
    sheetId : int;
    (** The sheet this is on. Set only if the embedded object is on its own sheet. Must be non-negative. *)
    overlayPosition : OverlayPosition.t;
    (** The position at which the object is overlaid on top of a grid. *)
    newSheet : bool;
    (** If true, the embedded object is put on a new sheet whose ID is chosen for you. Used only when writing. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  val overlayPosition : (t, OverlayPosition.t) GapiLens.t
  val newSheet : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EmbeddedObjectBorder :
sig
  type t = {
    colorStyle : ColorStyle.t;
    (** The color of the border. If color is also set, this field takes precedence. *)
    color : Color.t;
    (** The color of the border. *)
    
  }
  
  val colorStyle : (t, ColorStyle.t) GapiLens.t
  val color : (t, Color.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceChartProperties :
sig
  type t = {
    dataExecutionStatus : DataExecutionStatus.t;
    (** Output only. The data execution status. *)
    dataSourceId : string;
    (** ID of the data source that the chart is associated with. *)
    
  }
  
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  val dataSourceId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartDateTimeRule :
sig
  type t = {
    _type : string;
    (** The type of date-time grouping to apply. *)
    
  }
  
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartHistogramRule :
sig
  type t = {
    intervalSize : float;
    (** The size of the buckets that are created. Must be positive. *)
    maxValue : float;
    (** The maximum value at which items are placed into buckets. Values greater than the maximum are grouped into a single bucket. If omitted, it is determined by the maximum item value. *)
    minValue : float;
    (** The minimum value at which items are placed into buckets. Values that are less than the minimum are grouped into a single bucket. If omitted, it is determined by the minimum item value. *)
    
  }
  
  val intervalSize : (t, float) GapiLens.t
  val maxValue : (t, float) GapiLens.t
  val minValue : (t, float) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartGroupRule :
sig
  type t = {
    dateTimeRule : ChartDateTimeRule.t;
    (** A ChartDateTimeRule. *)
    histogramRule : ChartHistogramRule.t;
    (** A ChartHistogramRule *)
    
  }
  
  val dateTimeRule : (t, ChartDateTimeRule.t) GapiLens.t
  val histogramRule : (t, ChartHistogramRule.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartSourceRange :
sig
  type t = {
    sources : GridRange.t list;
    (** The ranges of data for a series or domain. Exactly one dimension must have a length of 1, and all sources in the list must have the same dimension with length 1. The domain (if it exists) & all series must have the same number of source ranges. If using more than one source range, then the source range at a given offset must be in order and contiguous across the domain and series. For example, these are valid configurations: domain sources: A1:A5 series1 sources: B1:B5 series2 sources: D6:D10 domain sources: A1:A5, C10:C12 series1 sources: B1:B5, D10:D12 series2 sources: C1:C5, E10:E12 *)
    
  }
  
  val sources : (t, GridRange.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartData :
sig
  type t = {
    groupRule : ChartGroupRule.t;
    (** The rule to group the data by if the ChartData backs the domain of a data source chart. Only supported for data source charts. *)
    columnReference : DataSourceColumnReference.t;
    (** The reference to the data source column that the data reads from. *)
    aggregateType : string;
    (** The aggregation type for the series of a data source chart. Only supported for data source charts. *)
    sourceRange : ChartSourceRange.t;
    (** The source ranges of the data. *)
    
  }
  
  val groupRule : (t, ChartGroupRule.t) GapiLens.t
  val columnReference : (t, DataSourceColumnReference.t) GapiLens.t
  val aggregateType : (t, string) GapiLens.t
  val sourceRange : (t, ChartSourceRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Link :
sig
  type t = {
    uri : string;
    (** The link identifier. *)
    
  }
  
  val uri : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TextFormat :
sig
  type t = {
    bold : bool;
    (** True if the text is bold. *)
    foregroundColor : Color.t;
    (** The foreground color of the text. *)
    underline : bool;
    (** True if the text is underlined. *)
    strikethrough : bool;
    (** True if the text has a strikethrough. *)
    fontSize : int;
    (** The size of the font. *)
    fontFamily : string;
    (** The font family. *)
    italic : bool;
    (** True if the text is italicized. *)
    link : Link.t;
    (** The link destination of the text, if any. Setting the link field in a TextFormatRun will clear the cell's existing links or a cell-level link set in the same request. When a link is set, the text foreground color will be set to the default link color and the text will be underlined. If these fields are modified in the same request, those values will be used instead of the link defaults. *)
    foregroundColorStyle : ColorStyle.t;
    (** The foreground color of the text. If foreground_color is also set, this field takes precedence. *)
    
  }
  
  val bold : (t, bool) GapiLens.t
  val foregroundColor : (t, Color.t) GapiLens.t
  val underline : (t, bool) GapiLens.t
  val strikethrough : (t, bool) GapiLens.t
  val fontSize : (t, int) GapiLens.t
  val fontFamily : (t, string) GapiLens.t
  val italic : (t, bool) GapiLens.t
  val link : (t, Link.t) GapiLens.t
  val foregroundColorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataLabel :
sig
  type t = {
    _type : string;
    (** The type of the data label. *)
    textFormat : TextFormat.t;
    (** The text format used for the data label. The link field is not supported. *)
    customLabelData : ChartData.t;
    (** Data to use for custom labels. Only used if type is set to CUSTOM. This data must be the same length as the series or other element this data label is applied to. In addition, if the series is split into multiple source ranges, this source data must come from the next column in the source data. For example, if the series is B2:B4,E6:E8 then this data must come from C2:C4,F6:F8. *)
    placement : string;
    (** The placement of the data label relative to the labeled data. *)
    
  }
  
  val _type : (t, string) GapiLens.t
  val textFormat : (t, TextFormat.t) GapiLens.t
  val customLabelData : (t, ChartData.t) GapiLens.t
  val placement : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WaterfallChartDomain :
sig
  type t = {
    data : ChartData.t;
    (** The data of the WaterfallChartDomain. *)
    reversed : bool;
    (** True to reverse the order of the domain values (horizontal axis). *)
    
  }
  
  val data : (t, ChartData.t) GapiLens.t
  val reversed : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WaterfallChartColumnStyle :
sig
  type t = {
    label : string;
    (** The label of the column's legend. *)
    color : Color.t;
    (** The color of the column. *)
    colorStyle : ColorStyle.t;
    (** The color of the column. If color is also set, this field takes precedence. *)
    
  }
  
  val label : (t, string) GapiLens.t
  val color : (t, Color.t) GapiLens.t
  val colorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WaterfallChartCustomSubtotal :
sig
  type t = {
    dataIsSubtotal : bool;
    (** True if the data point at subtotal_index is the subtotal. If false, the subtotal will be computed and appear after the data point. *)
    label : string;
    (** A label for the subtotal column. *)
    subtotalIndex : int;
    (** The 0-based index of a data point within the series. If data_is_subtotal is true, the data point at this index is the subtotal. Otherwise, the subtotal appears after the data point with this index. A series can have multiple subtotals at arbitrary indices, but subtotals do not affect the indices of the data points. For example, if a series has three data points, their indices will always be 0, 1, and 2, regardless of how many subtotals exist on the series or what data points they are associated with. *)
    
  }
  
  val dataIsSubtotal : (t, bool) GapiLens.t
  val label : (t, string) GapiLens.t
  val subtotalIndex : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WaterfallChartSeries :
sig
  type t = {
    negativeColumnsStyle : WaterfallChartColumnStyle.t;
    (** Styles for all columns in this series with negative values. *)
    dataLabel : DataLabel.t;
    (** Information about the data labels for this series. *)
    hideTrailingSubtotal : bool;
    (** True to hide the subtotal column from the end of the series. By default, a subtotal column will appear at the end of each series. Setting this field to true will hide that subtotal column for this series. *)
    subtotalColumnsStyle : WaterfallChartColumnStyle.t;
    (** Styles for all subtotal columns in this series. *)
    positiveColumnsStyle : WaterfallChartColumnStyle.t;
    (** Styles for all columns in this series with positive values. *)
    data : ChartData.t;
    (** The data being visualized in this series. *)
    customSubtotals : WaterfallChartCustomSubtotal.t list;
    (** Custom subtotal columns appearing in this series. The order in which subtotals are defined is not significant. Only one subtotal may be defined for each data point. *)
    
  }
  
  val negativeColumnsStyle : (t, WaterfallChartColumnStyle.t) GapiLens.t
  val dataLabel : (t, DataLabel.t) GapiLens.t
  val hideTrailingSubtotal : (t, bool) GapiLens.t
  val subtotalColumnsStyle : (t, WaterfallChartColumnStyle.t) GapiLens.t
  val positiveColumnsStyle : (t, WaterfallChartColumnStyle.t) GapiLens.t
  val data : (t, ChartData.t) GapiLens.t
  val customSubtotals : (t, WaterfallChartCustomSubtotal.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WaterfallChartSpec :
sig
  type t = {
    connectorLineStyle : LineStyle.t;
    (** The line style for the connector lines. *)
    totalDataLabel : DataLabel.t;
    (** Controls whether to display additional data labels on stacked charts which sum the total value of all stacked values at each value along the domain axis. stacked_type must be STACKED and neither CUSTOM nor placement can be set on the total_data_label. *)
    domain : WaterfallChartDomain.t;
    (** The domain data (horizontal axis) for the waterfall chart. *)
    firstValueIsTotal : bool;
    (** True to interpret the first value as a total. *)
    stackedType : string;
    (** The stacked type. *)
    hideConnectorLines : bool;
    (** True to hide connector lines between columns. *)
    series : WaterfallChartSeries.t list;
    (** The data this waterfall chart is visualizing. *)
    
  }
  
  val connectorLineStyle : (t, LineStyle.t) GapiLens.t
  val totalDataLabel : (t, DataLabel.t) GapiLens.t
  val domain : (t, WaterfallChartDomain.t) GapiLens.t
  val firstValueIsTotal : (t, bool) GapiLens.t
  val stackedType : (t, string) GapiLens.t
  val hideConnectorLines : (t, bool) GapiLens.t
  val series : (t, WaterfallChartSeries.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TextPosition :
sig
  type t = {
    horizontalAlignment : string;
    (** Horizontal alignment setting for the piece of text. *)
    
  }
  
  val horizontalAlignment : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartAxisViewWindowOptions :
sig
  type t = {
    viewWindowMax : float;
    (** The maximum numeric value to be shown in this view window. If unset, will automatically determine a maximum value that looks good for the data. *)
    viewWindowMin : float;
    (** The minimum numeric value to be shown in this view window. If unset, will automatically determine a minimum value that looks good for the data. *)
    viewWindowMode : string;
    (** The view window's mode. *)
    
  }
  
  val viewWindowMax : (t, float) GapiLens.t
  val viewWindowMin : (t, float) GapiLens.t
  val viewWindowMode : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BasicChartAxis :
sig
  type t = {
    titleTextPosition : TextPosition.t;
    (** The axis title text position. *)
    position : string;
    (** The position of this axis. *)
    format : TextFormat.t;
    (** The format of the title. Only valid if the axis is not associated with the domain. The link field is not supported. *)
    title : string;
    (** The title of this axis. If set, this overrides any title inferred from headers of the data. *)
    viewWindowOptions : ChartAxisViewWindowOptions.t;
    (** The view window options for this axis. *)
    
  }
  
  val titleTextPosition : (t, TextPosition.t) GapiLens.t
  val position : (t, string) GapiLens.t
  val format : (t, TextFormat.t) GapiLens.t
  val title : (t, string) GapiLens.t
  val viewWindowOptions : (t, ChartAxisViewWindowOptions.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BasicChartDomain :
sig
  type t = {
    reversed : bool;
    (** True to reverse the order of the domain values (horizontal axis). *)
    domain : ChartData.t;
    (** The data of the domain. For example, if charting stock prices over time, this is the data representing the dates. *)
    
  }
  
  val reversed : (t, bool) GapiLens.t
  val domain : (t, ChartData.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PointStyle :
sig
  type t = {
    shape : string;
    (** The point shape. If empty or unspecified, a default shape is used. *)
    size : float;
    (** The point size. If empty, a default size is used. *)
    
  }
  
  val shape : (t, string) GapiLens.t
  val size : (t, float) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BasicSeriesDataPointStyleOverride :
sig
  type t = {
    colorStyle : ColorStyle.t;
    (** Color of the series data point. If empty, the series default is used. If color is also set, this field takes precedence. *)
    pointStyle : PointStyle.t;
    (** Point style of the series data point. Valid only if the chartType is AREA, LINE, or SCATTER. COMBO charts are also supported if the series chart type is AREA, LINE, or SCATTER. If empty, the series default is used. *)
    color : Color.t;
    (** Color of the series data point. If empty, the series default is used. *)
    index : int;
    (** Zero based index of the series data point. *)
    
  }
  
  val colorStyle : (t, ColorStyle.t) GapiLens.t
  val pointStyle : (t, PointStyle.t) GapiLens.t
  val color : (t, Color.t) GapiLens.t
  val index : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BasicChartSeries :
sig
  type t = {
    dataLabel : DataLabel.t;
    (** Information about the data labels for this series. *)
    styleOverrides : BasicSeriesDataPointStyleOverride.t list;
    (** Style override settings for series data points. *)
    pointStyle : PointStyle.t;
    (** The style for points associated with this series. Valid only if the chartType is AREA, LINE, or SCATTER. COMBO charts are also supported if the series chart type is AREA, LINE, or SCATTER. If empty, a default point style is used. *)
    _type : string;
    (** The type of this series. Valid only if the chartType is COMBO. Different types will change the way the series is visualized. Only LINE, AREA, and COLUMN are supported. *)
    color : Color.t;
    (** The color for elements (such as bars, lines, and points) associated with this series. If empty, a default color is used. *)
    colorStyle : ColorStyle.t;
    (** The color for elements (such as bars, lines, and points) associated with this series. If empty, a default color is used. If color is also set, this field takes precedence. *)
    series : ChartData.t;
    (** The data being visualized in this chart series. *)
    lineStyle : LineStyle.t;
    (** The line style of this series. Valid only if the chartType is AREA, LINE, or SCATTER. COMBO charts are also supported if the series chart type is AREA or LINE. *)
    targetAxis : string;
    (** The minor axis that will specify the range of values for this series. For example, if charting stocks over time, the "Volume" series may want to be pinned to the right with the prices pinned to the left, because the scale of trading volume is different than the scale of prices. It is an error to specify an axis that isn't a valid minor axis for the chart's type. *)
    
  }
  
  val dataLabel : (t, DataLabel.t) GapiLens.t
  val styleOverrides : (t, BasicSeriesDataPointStyleOverride.t list) GapiLens.t
  val pointStyle : (t, PointStyle.t) GapiLens.t
  val _type : (t, string) GapiLens.t
  val color : (t, Color.t) GapiLens.t
  val colorStyle : (t, ColorStyle.t) GapiLens.t
  val series : (t, ChartData.t) GapiLens.t
  val lineStyle : (t, LineStyle.t) GapiLens.t
  val targetAxis : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BasicChartSpec :
sig
  type t = {
    legendPosition : string;
    (** The position of the chart legend. *)
    stackedType : string;
    (** The stacked type for charts that support vertical stacking. Applies to Area, Bar, Column, Combo, and Stepped Area charts. *)
    domains : BasicChartDomain.t list;
    (** The domain of data this is charting. Only a single domain is supported. *)
    threeDimensional : bool;
    (** True to make the chart 3D. Applies to Bar and Column charts. *)
    interpolateNulls : bool;
    (** If some values in a series are missing, gaps may appear in the chart (e.g, segments of lines in a line chart will be missing). To eliminate these gaps set this to true. Applies to Line, Area, and Combo charts. *)
    headerCount : int;
    (** The number of rows or columns in the data that are "headers". If not set, Google Sheets will guess how many rows are headers based on the data. (Note that BasicChartAxis.title may override the axis title inferred from the header values.) *)
    totalDataLabel : DataLabel.t;
    (** Controls whether to display additional data labels on stacked charts which sum the total value of all stacked values at each value along the domain axis. These data labels can only be set when chart_type is one of AREA, BAR, COLUMN, COMBO or STEPPED_AREA and stacked_type is either STACKED or PERCENT_STACKED. In addition, for COMBO, this will only be supported if there is only one type of stackable series type or one type has more series than the others and each of the other types have no more than one series. For example, if a chart has two stacked bar series and one area series, the total data labels will be supported. If it has three bar series and two area series, total data labels are not allowed. Neither CUSTOM nor placement can be set on the total_data_label. *)
    lineSmoothing : bool;
    (** Gets whether all lines should be rendered smooth or straight by default. Applies to Line charts. *)
    compareMode : string;
    (** The behavior of tooltips and data highlighting when hovering on data and chart area. *)
    series : BasicChartSeries.t list;
    (** The data this chart is visualizing. *)
    axis : BasicChartAxis.t list;
    (** The axis on the chart. *)
    chartType : string;
    (** The type of the chart. *)
    
  }
  
  val legendPosition : (t, string) GapiLens.t
  val stackedType : (t, string) GapiLens.t
  val domains : (t, BasicChartDomain.t list) GapiLens.t
  val threeDimensional : (t, bool) GapiLens.t
  val interpolateNulls : (t, bool) GapiLens.t
  val headerCount : (t, int) GapiLens.t
  val totalDataLabel : (t, DataLabel.t) GapiLens.t
  val lineSmoothing : (t, bool) GapiLens.t
  val compareMode : (t, string) GapiLens.t
  val series : (t, BasicChartSeries.t list) GapiLens.t
  val axis : (t, BasicChartAxis.t list) GapiLens.t
  val chartType : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module OrgChartSpec :
sig
  type t = {
    selectedNodeColor : Color.t;
    (** The color of the selected org chart nodes. *)
    nodeColor : Color.t;
    (** The color of the org chart nodes. *)
    nodeColorStyle : ColorStyle.t;
    (** The color of the org chart nodes. If node_color is also set, this field takes precedence. *)
    parentLabels : ChartData.t;
    (** The data containing the label of the parent for the corresponding node. A blank value indicates that the node has no parent and is a top-level node. This field is optional. *)
    nodeSize : string;
    (** The size of the org chart nodes. *)
    tooltips : ChartData.t;
    (** The data containing the tooltip for the corresponding node. A blank value results in no tooltip being displayed for the node. This field is optional. *)
    labels : ChartData.t;
    (** The data containing the labels for all the nodes in the chart. Labels must be unique. *)
    selectedNodeColorStyle : ColorStyle.t;
    (** The color of the selected org chart nodes. If selected_node_color is also set, this field takes precedence. *)
    
  }
  
  val selectedNodeColor : (t, Color.t) GapiLens.t
  val nodeColor : (t, Color.t) GapiLens.t
  val nodeColorStyle : (t, ColorStyle.t) GapiLens.t
  val parentLabels : (t, ChartData.t) GapiLens.t
  val nodeSize : (t, string) GapiLens.t
  val tooltips : (t, ChartData.t) GapiLens.t
  val labels : (t, ChartData.t) GapiLens.t
  val selectedNodeColorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FilterCriteria :
sig
  type t = {
    visibleForegroundColorStyle : ColorStyle.t;
    (** The foreground color to filter by; only cells with this foreground color are shown. This field is mutually exclusive with visible_background_color, and must be set to an RGB-type color. If visible_foreground_color is also set, this field takes precedence. *)
    hiddenValues : string list;
    (** Values that should be hidden. *)
    visibleBackgroundColor : Color.t;
    (** The background fill color to filter by; only cells with this fill color are shown. Mutually exclusive with visible_foreground_color. *)
    condition : BooleanCondition.t;
    (** A condition that must be true for values to be shown. (This does not override hidden_values -- if a value is listed there, it will still be hidden.) *)
    visibleForegroundColor : Color.t;
    (** The foreground color to filter by; only cells with this foreground color are shown. Mutually exclusive with visible_background_color. *)
    visibleBackgroundColorStyle : ColorStyle.t;
    (** The background fill color to filter by; only cells with this fill color are shown. This field is mutually exclusive with visible_foreground_color, and must be set to an RGB-type color. If visible_background_color is also set, this field takes precedence. *)
    
  }
  
  val visibleForegroundColorStyle : (t, ColorStyle.t) GapiLens.t
  val hiddenValues : (t, string list) GapiLens.t
  val visibleBackgroundColor : (t, Color.t) GapiLens.t
  val condition : (t, BooleanCondition.t) GapiLens.t
  val visibleForegroundColor : (t, Color.t) GapiLens.t
  val visibleBackgroundColorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FilterSpec :
sig
  type t = {
    columnIndex : int;
    (** The column index. *)
    dataSourceColumnReference : DataSourceColumnReference.t;
    (** Reference to a data source column. *)
    filterCriteria : FilterCriteria.t;
    (** The criteria for the column. *)
    
  }
  
  val columnIndex : (t, int) GapiLens.t
  val dataSourceColumnReference : (t, DataSourceColumnReference.t) GapiLens.t
  val filterCriteria : (t, FilterCriteria.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BubbleChartSpec :
sig
  type t = {
    bubbleSizes : ChartData.t;
    (** The data containing the bubble sizes. Bubble sizes are used to draw the bubbles at different sizes relative to each other. If specified, group_ids must also be specified. This field is optional. *)
    legendPosition : string;
    (** Where the legend of the chart should be drawn. *)
    groupIds : ChartData.t;
    (** The data containing the bubble group IDs. All bubbles with the same group ID are drawn in the same color. If bubble_sizes is specified then this field must also be specified but may contain blank values. This field is optional. *)
    domain : ChartData.t;
    (** The data containing the bubble x-values. These values locate the bubbles in the chart horizontally. *)
    bubbleBorderColor : Color.t;
    (** The bubble border color. *)
    bubbleBorderColorStyle : ColorStyle.t;
    (** The bubble border color. If bubble_border_color is also set, this field takes precedence. *)
    bubbleLabels : ChartData.t;
    (** The data containing the bubble labels. These do not need to be unique. *)
    bubbleMinRadiusSize : int;
    (** The minimum radius size of the bubbles, in pixels. If specific, the field must be a positive value. *)
    series : ChartData.t;
    (** The data containing the bubble y-values. These values locate the bubbles in the chart vertically. *)
    bubbleTextStyle : TextFormat.t;
    (** The format of the text inside the bubbles. Strikethrough, underline, and link are not supported. *)
    bubbleMaxRadiusSize : int;
    (** The max radius size of the bubbles, in pixels. If specified, the field must be a positive value. *)
    bubbleOpacity : float;
    (** The opacity of the bubbles between 0 and 1.0. 0 is fully transparent and 1 is fully opaque. *)
    
  }
  
  val bubbleSizes : (t, ChartData.t) GapiLens.t
  val legendPosition : (t, string) GapiLens.t
  val groupIds : (t, ChartData.t) GapiLens.t
  val domain : (t, ChartData.t) GapiLens.t
  val bubbleBorderColor : (t, Color.t) GapiLens.t
  val bubbleBorderColorStyle : (t, ColorStyle.t) GapiLens.t
  val bubbleLabels : (t, ChartData.t) GapiLens.t
  val bubbleMinRadiusSize : (t, int) GapiLens.t
  val series : (t, ChartData.t) GapiLens.t
  val bubbleTextStyle : (t, TextFormat.t) GapiLens.t
  val bubbleMaxRadiusSize : (t, int) GapiLens.t
  val bubbleOpacity : (t, float) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CandlestickSeries :
sig
  type t = {
    data : ChartData.t;
    (** The data of the CandlestickSeries. *)
    
  }
  
  val data : (t, ChartData.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CandlestickData :
sig
  type t = {
    highSeries : CandlestickSeries.t;
    (** The range data (vertical axis) for the high/maximum value for each candle. This is the top of the candle's center line. *)
    lowSeries : CandlestickSeries.t;
    (** The range data (vertical axis) for the low/minimum value for each candle. This is the bottom of the candle's center line. *)
    openSeries : CandlestickSeries.t;
    (** The range data (vertical axis) for the open/initial value for each candle. This is the bottom of the candle body. If less than the close value the candle will be filled. Otherwise the candle will be hollow. *)
    closeSeries : CandlestickSeries.t;
    (** The range data (vertical axis) for the close/final value for each candle. This is the top of the candle body. If greater than the open value the candle will be filled. Otherwise the candle will be hollow. *)
    
  }
  
  val highSeries : (t, CandlestickSeries.t) GapiLens.t
  val lowSeries : (t, CandlestickSeries.t) GapiLens.t
  val openSeries : (t, CandlestickSeries.t) GapiLens.t
  val closeSeries : (t, CandlestickSeries.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CandlestickDomain :
sig
  type t = {
    reversed : bool;
    (** True to reverse the order of the domain values (horizontal axis). *)
    data : ChartData.t;
    (** The data of the CandlestickDomain. *)
    
  }
  
  val reversed : (t, bool) GapiLens.t
  val data : (t, ChartData.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CandlestickChartSpec :
sig
  type t = {
    data : CandlestickData.t list;
    (** The Candlestick chart data. Only one CandlestickData is supported. *)
    domain : CandlestickDomain.t;
    (** The domain data (horizontal axis) for the candlestick chart. String data will be treated as discrete labels, other data will be treated as continuous values. *)
    
  }
  
  val data : (t, CandlestickData.t list) GapiLens.t
  val domain : (t, CandlestickDomain.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module HistogramSeries :
sig
  type t = {
    barColorStyle : ColorStyle.t;
    (** The color of the column representing this series in each bucket. This field is optional. If bar_color is also set, this field takes precedence. *)
    data : ChartData.t;
    (** The data for this histogram series. *)
    barColor : Color.t;
    (** The color of the column representing this series in each bucket. This field is optional. *)
    
  }
  
  val barColorStyle : (t, ColorStyle.t) GapiLens.t
  val data : (t, ChartData.t) GapiLens.t
  val barColor : (t, Color.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module HistogramChartSpec :
sig
  type t = {
    bucketSize : float;
    (** By default the bucket size (the range of values stacked in a single column) is chosen automatically, but it may be overridden here. E.g., A bucket size of 1.5 results in buckets from 0 - 1.5, 1.5 - 3.0, etc. Cannot be negative. This field is optional. *)
    showItemDividers : bool;
    (** Whether horizontal divider lines should be displayed between items in each column. *)
    outlierPercentile : float;
    (** The outlier percentile is used to ensure that outliers do not adversely affect the calculation of bucket sizes. For example, setting an outlier percentile of 0.05 indicates that the top and bottom 5% of values when calculating buckets. The values are still included in the chart, they will be added to the first or last buckets instead of their own buckets. Must be between 0.0 and 0.5. *)
    series : HistogramSeries.t list;
    (** The series for a histogram may be either a single series of values to be bucketed or multiple series, each of the same length, containing the name of the series followed by the values to be bucketed for that series. *)
    legendPosition : string;
    (** The position of the chart legend. *)
    
  }
  
  val bucketSize : (t, float) GapiLens.t
  val showItemDividers : (t, bool) GapiLens.t
  val outlierPercentile : (t, float) GapiLens.t
  val series : (t, HistogramSeries.t list) GapiLens.t
  val legendPosition : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BaselineValueFormat :
sig
  type t = {
    description : string;
    (** Description which is appended after the baseline value. This field is optional. *)
    negativeColor : Color.t;
    (** Color to be used, in case baseline value represents a negative change for key value. This field is optional. *)
    negativeColorStyle : ColorStyle.t;
    (** Color to be used, in case baseline value represents a negative change for key value. This field is optional. If negative_color is also set, this field takes precedence. *)
    comparisonType : string;
    (** The comparison type of key value with baseline value. *)
    positiveColor : Color.t;
    (** Color to be used, in case baseline value represents a positive change for key value. This field is optional. *)
    positiveColorStyle : ColorStyle.t;
    (** Color to be used, in case baseline value represents a positive change for key value. This field is optional. If positive_color is also set, this field takes precedence. *)
    textFormat : TextFormat.t;
    (** Text formatting options for baseline value. The link field is not supported. *)
    position : TextPosition.t;
    (** Specifies the horizontal text positioning of baseline value. This field is optional. If not specified, default positioning is used. *)
    
  }
  
  val description : (t, string) GapiLens.t
  val negativeColor : (t, Color.t) GapiLens.t
  val negativeColorStyle : (t, ColorStyle.t) GapiLens.t
  val comparisonType : (t, string) GapiLens.t
  val positiveColor : (t, Color.t) GapiLens.t
  val positiveColorStyle : (t, ColorStyle.t) GapiLens.t
  val textFormat : (t, TextFormat.t) GapiLens.t
  val position : (t, TextPosition.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartCustomNumberFormatOptions :
sig
  type t = {
    prefix : string;
    (** Custom prefix to be prepended to the chart attribute. This field is optional. *)
    suffix : string;
    (** Custom suffix to be appended to the chart attribute. This field is optional. *)
    
  }
  
  val prefix : (t, string) GapiLens.t
  val suffix : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module KeyValueFormat :
sig
  type t = {
    textFormat : TextFormat.t;
    (** Text formatting options for key value. The link field is not supported. *)
    position : TextPosition.t;
    (** Specifies the horizontal text positioning of key value. This field is optional. If not specified, default positioning is used. *)
    
  }
  
  val textFormat : (t, TextFormat.t) GapiLens.t
  val position : (t, TextPosition.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ScorecardChartSpec :
sig
  type t = {
    baselineValueFormat : BaselineValueFormat.t;
    (** Formatting options for baseline value. This field is needed only if baseline_value_data is specified. *)
    customFormatOptions : ChartCustomNumberFormatOptions.t;
    (** Custom formatting options for numeric key/baseline values in scorecard chart. This field is used only when number_format_source is set to CUSTOM. This field is optional. *)
    numberFormatSource : string;
    (** The number format source used in the scorecard chart. This field is optional. *)
    aggregateType : string;
    (** The aggregation type for key and baseline chart data in scorecard chart. This field is not supported for data source charts. Use the ChartData.aggregateType field of the key_value_data or baseline_value_data instead for data source charts. This field is optional. *)
    baselineValueData : ChartData.t;
    (** The data for scorecard baseline value. This field is optional. *)
    keyValueFormat : KeyValueFormat.t;
    (** Formatting options for key value. *)
    scaleFactor : float;
    (** Value to scale scorecard key and baseline value. For example, a factor of 10 can be used to divide all values in the chart by 10. This field is optional. *)
    keyValueData : ChartData.t;
    (** The data for scorecard key value. *)
    
  }
  
  val baselineValueFormat : (t, BaselineValueFormat.t) GapiLens.t
  val customFormatOptions : (t, ChartCustomNumberFormatOptions.t) GapiLens.t
  val numberFormatSource : (t, string) GapiLens.t
  val aggregateType : (t, string) GapiLens.t
  val baselineValueData : (t, ChartData.t) GapiLens.t
  val keyValueFormat : (t, KeyValueFormat.t) GapiLens.t
  val scaleFactor : (t, float) GapiLens.t
  val keyValueData : (t, ChartData.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SortSpec :
sig
  type t = {
    foregroundColorStyle : ColorStyle.t;
    (** The foreground color to sort by; cells with this foreground color are sorted to the top. Mutually exclusive with background_color, and must be an RGB-type color. If foreground_color is also set, this field takes precedence. *)
    foregroundColor : Color.t;
    (** The foreground color to sort by; cells with this foreground color are sorted to the top. Mutually exclusive with background_color. *)
    backgroundColor : Color.t;
    (** The background fill color to sort by; cells with this fill color are sorted to the top. Mutually exclusive with foreground_color. *)
    dataSourceColumnReference : DataSourceColumnReference.t;
    (** Reference to a data source column. *)
    sortOrder : string;
    (** The order data should be sorted. *)
    dimensionIndex : int;
    (** The dimension the sort should be applied to. *)
    backgroundColorStyle : ColorStyle.t;
    (** The background fill color to sort by; cells with this fill color are sorted to the top. Mutually exclusive with foreground_color, and must be an RGB-type color. If background_color is also set, this field takes precedence. *)
    
  }
  
  val foregroundColorStyle : (t, ColorStyle.t) GapiLens.t
  val foregroundColor : (t, Color.t) GapiLens.t
  val backgroundColor : (t, Color.t) GapiLens.t
  val dataSourceColumnReference : (t, DataSourceColumnReference.t) GapiLens.t
  val sortOrder : (t, string) GapiLens.t
  val dimensionIndex : (t, int) GapiLens.t
  val backgroundColorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TreemapChartColorScale :
sig
  type t = {
    midValueColor : Color.t;
    (** The background color for cells with a color value at the midpoint between minValue and maxValue. Defaults to #efe6dc if not specified. *)
    maxValueColor : Color.t;
    (** The background color for cells with a color value greater than or equal to maxValue. Defaults to #109618 if not specified. *)
    minValueColor : Color.t;
    (** The background color for cells with a color value less than or equal to minValue. Defaults to #dc3912 if not specified. *)
    noDataColor : Color.t;
    (** The background color for cells that have no color data associated with them. Defaults to #000000 if not specified. *)
    noDataColorStyle : ColorStyle.t;
    (** The background color for cells that have no color data associated with them. Defaults to #000000 if not specified. If no_data_color is also set, this field takes precedence. *)
    midValueColorStyle : ColorStyle.t;
    (** The background color for cells with a color value at the midpoint between minValue and maxValue. Defaults to #efe6dc if not specified. If mid_value_color is also set, this field takes precedence. *)
    maxValueColorStyle : ColorStyle.t;
    (** The background color for cells with a color value greater than or equal to maxValue. Defaults to #109618 if not specified. If max_value_color is also set, this field takes precedence. *)
    minValueColorStyle : ColorStyle.t;
    (** The background color for cells with a color value less than or equal to minValue. Defaults to #dc3912 if not specified. If min_value_color is also set, this field takes precedence. *)
    
  }
  
  val midValueColor : (t, Color.t) GapiLens.t
  val maxValueColor : (t, Color.t) GapiLens.t
  val minValueColor : (t, Color.t) GapiLens.t
  val noDataColor : (t, Color.t) GapiLens.t
  val noDataColorStyle : (t, ColorStyle.t) GapiLens.t
  val midValueColorStyle : (t, ColorStyle.t) GapiLens.t
  val maxValueColorStyle : (t, ColorStyle.t) GapiLens.t
  val minValueColorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TreemapChartSpec :
sig
  type t = {
    labels : ChartData.t;
    (** The data that contains the treemap cell labels. *)
    sizeData : ChartData.t;
    (** The data that determines the size of each treemap data cell. This data is expected to be numeric. The cells corresponding to non-numeric or missing data will not be rendered. If color_data is not specified, this data is used to determine data cell background colors as well. *)
    headerColor : Color.t;
    (** The background color for header cells. *)
    parentLabels : ChartData.t;
    (** The data the contains the treemap cells' parent labels. *)
    minValue : float;
    (** The minimum possible data value. Cells with values less than this will have the same color as cells with this value. If not specified, defaults to the actual minimum value from color_data, or the minimum value from size_data if color_data is not specified. *)
    hintedLevels : int;
    (** The number of additional data levels beyond the labeled levels to be shown on the treemap chart. These levels are not interactive and are shown without their labels. Defaults to 0 if not specified. *)
    headerColorStyle : ColorStyle.t;
    (** The background color for header cells. If header_color is also set, this field takes precedence. *)
    colorScale : TreemapChartColorScale.t;
    (** The color scale for data cells in the treemap chart. Data cells are assigned colors based on their color values. These color values come from color_data, or from size_data if color_data is not specified. Cells with color values less than or equal to min_value will have minValueColor as their background color. Cells with color values greater than or equal to max_value will have maxValueColor as their background color. Cells with color values between min_value and max_value will have background colors on a gradient between minValueColor and maxValueColor, the midpoint of the gradient being midValueColor. Cells with missing or non-numeric color values will have noDataColor as their background color. *)
    levels : int;
    (** The number of data levels to show on the treemap chart. These levels are interactive and are shown with their labels. Defaults to 2 if not specified. *)
    hideTooltips : bool;
    (** True to hide tooltips. *)
    textFormat : TextFormat.t;
    (** The text format for all labels on the chart. The link field is not supported. *)
    maxValue : float;
    (** The maximum possible data value. Cells with values greater than this will have the same color as cells with this value. If not specified, defaults to the actual maximum value from color_data, or the maximum value from size_data if color_data is not specified. *)
    colorData : ChartData.t;
    (** The data that determines the background color of each treemap data cell. This field is optional. If not specified, size_data is used to determine background colors. If specified, the data is expected to be numeric. color_scale will determine how the values in this data map to data cell background colors. *)
    
  }
  
  val labels : (t, ChartData.t) GapiLens.t
  val sizeData : (t, ChartData.t) GapiLens.t
  val headerColor : (t, Color.t) GapiLens.t
  val parentLabels : (t, ChartData.t) GapiLens.t
  val minValue : (t, float) GapiLens.t
  val hintedLevels : (t, int) GapiLens.t
  val headerColorStyle : (t, ColorStyle.t) GapiLens.t
  val colorScale : (t, TreemapChartColorScale.t) GapiLens.t
  val levels : (t, int) GapiLens.t
  val hideTooltips : (t, bool) GapiLens.t
  val textFormat : (t, TextFormat.t) GapiLens.t
  val maxValue : (t, float) GapiLens.t
  val colorData : (t, ChartData.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PieChartSpec :
sig
  type t = {
    domain : ChartData.t;
    (** The data that covers the domain of the pie chart. *)
    pieHole : float;
    (** The size of the hole in the pie chart. *)
    threeDimensional : bool;
    (** True if the pie is three dimensional. *)
    legendPosition : string;
    (** Where the legend of the pie chart should be drawn. *)
    series : ChartData.t;
    (** The data that covers the one and only series of the pie chart. *)
    
  }
  
  val domain : (t, ChartData.t) GapiLens.t
  val pieHole : (t, float) GapiLens.t
  val threeDimensional : (t, bool) GapiLens.t
  val legendPosition : (t, string) GapiLens.t
  val series : (t, ChartData.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChartSpec :
sig
  type t = {
    subtitleTextFormat : TextFormat.t;
    (** The subtitle text format. Strikethrough, underline, and link are not supported. *)
    candlestickChart : CandlestickChartSpec.t;
    (** A candlestick chart specification. *)
    bubbleChart : BubbleChartSpec.t;
    (** A bubble chart specification. *)
    subtitle : string;
    (** The subtitle of the chart. *)
    filterSpecs : FilterSpec.t list;
    (** The filters applied to the source data of the chart. Only supported for data source charts. *)
    histogramChart : HistogramChartSpec.t;
    (** A histogram chart specification. *)
    backgroundColor : Color.t;
    (** The background color of the entire chart. Not applicable to Org charts. *)
    title : string;
    (** The title of the chart. *)
    hiddenDimensionStrategy : string;
    (** Determines how the charts will use hidden rows or columns. *)
    altText : string;
    (** The alternative text that describes the chart. This is often used for accessibility. *)
    orgChart : OrgChartSpec.t;
    (** An org chart specification. *)
    scorecardChart : ScorecardChartSpec.t;
    (** A scorecard chart specification. *)
    basicChart : BasicChartSpec.t;
    (** A basic chart specification, can be one of many kinds of charts. See BasicChartType for the list of all charts this supports. *)
    sortSpecs : SortSpec.t list;
    (** The order to sort the chart data by. Only a single sort spec is supported. Only supported for data source charts. *)
    titleTextFormat : TextFormat.t;
    (** The title text format. Strikethrough, underline, and link are not supported. *)
    subtitleTextPosition : TextPosition.t;
    (** The subtitle text position. This field is optional. *)
    waterfallChart : WaterfallChartSpec.t;
    (** A waterfall chart specification. *)
    treemapChart : TreemapChartSpec.t;
    (** A treemap chart specification. *)
    maximized : bool;
    (** True to make a chart fill the entire space in which it's rendered with minimum padding. False to use the default padding. (Not applicable to Geo and Org charts.) *)
    pieChart : PieChartSpec.t;
    (** A pie chart specification. *)
    backgroundColorStyle : ColorStyle.t;
    (** The background color of the entire chart. Not applicable to Org charts. If background_color is also set, this field takes precedence. *)
    titleTextPosition : TextPosition.t;
    (** The title text position. This field is optional. *)
    dataSourceChartProperties : DataSourceChartProperties.t;
    (** If present, the field contains data source chart specific properties. *)
    fontName : string;
    (** The name of the font to use by default for all chart text (e.g. title, axis labels, legend). If a font is specified for a specific part of the chart it will override this font name. *)
    
  }
  
  val subtitleTextFormat : (t, TextFormat.t) GapiLens.t
  val candlestickChart : (t, CandlestickChartSpec.t) GapiLens.t
  val bubbleChart : (t, BubbleChartSpec.t) GapiLens.t
  val subtitle : (t, string) GapiLens.t
  val filterSpecs : (t, FilterSpec.t list) GapiLens.t
  val histogramChart : (t, HistogramChartSpec.t) GapiLens.t
  val backgroundColor : (t, Color.t) GapiLens.t
  val title : (t, string) GapiLens.t
  val hiddenDimensionStrategy : (t, string) GapiLens.t
  val altText : (t, string) GapiLens.t
  val orgChart : (t, OrgChartSpec.t) GapiLens.t
  val scorecardChart : (t, ScorecardChartSpec.t) GapiLens.t
  val basicChart : (t, BasicChartSpec.t) GapiLens.t
  val sortSpecs : (t, SortSpec.t list) GapiLens.t
  val titleTextFormat : (t, TextFormat.t) GapiLens.t
  val subtitleTextPosition : (t, TextPosition.t) GapiLens.t
  val waterfallChart : (t, WaterfallChartSpec.t) GapiLens.t
  val treemapChart : (t, TreemapChartSpec.t) GapiLens.t
  val maximized : (t, bool) GapiLens.t
  val pieChart : (t, PieChartSpec.t) GapiLens.t
  val backgroundColorStyle : (t, ColorStyle.t) GapiLens.t
  val titleTextPosition : (t, TextPosition.t) GapiLens.t
  val dataSourceChartProperties : (t, DataSourceChartProperties.t) GapiLens.t
  val fontName : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module EmbeddedChart :
sig
  type t = {
    border : EmbeddedObjectBorder.t;
    (** The border of the chart. *)
    chartId : int;
    (** The ID of the chart. *)
    position : EmbeddedObjectPosition.t;
    (** The position of the chart. *)
    spec : ChartSpec.t;
    (** The specification of the chart. *)
    
  }
  
  val border : (t, EmbeddedObjectBorder.t) GapiLens.t
  val chartId : (t, int) GapiLens.t
  val position : (t, EmbeddedObjectPosition.t) GapiLens.t
  val spec : (t, ChartSpec.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddChartResponse :
sig
  type t = {
    chart : EmbeddedChart.t;
    (** The newly added chart. *)
    
  }
  
  val chart : (t, EmbeddedChart.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TrimWhitespaceResponse :
sig
  type t = {
    cellsChangedCount : int;
    (** The number of cells that were trimmed of whitespace. *)
    
  }
  
  val cellsChangedCount : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DimensionGroup :
sig
  type t = {
    range : DimensionRange.t;
    (** The range over which this group exists. *)
    collapsed : bool;
    (** This field is true if this group is collapsed. A collapsed group remains collapsed if an overlapping group at a shallower depth is expanded. A true value does not imply that all dimensions within the group are hidden, since a dimension's visibility can change independently from this group property. However, when this property is updated, all dimensions within it are set to hidden if this field is true, or set to visible if this field is false. *)
    depth : int;
    (** The depth of the group, representing how many groups have a range that wholly contains the range of this group. *)
    
  }
  
  val range : (t, DimensionRange.t) GapiLens.t
  val collapsed : (t, bool) GapiLens.t
  val depth : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddDimensionGroupResponse :
sig
  type t = {
    dimensionGroups : DimensionGroup.t list;
    (** All groups of a dimension after adding a group to that dimension. *)
    
  }
  
  val dimensionGroups : (t, DimensionGroup.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BandingProperties :
sig
  type t = {
    headerColorStyle : ColorStyle.t;
    (** The color of the first row or column. If this field is set, the first row or column is filled with this color and the colors alternate between first_band_color and second_band_color starting from the second row or column. Otherwise, the first row or column is filled with first_band_color and the colors proceed to alternate as they normally would. If header_color is also set, this field takes precedence. *)
    footerColor : Color.t;
    (** The color of the last row or column. If this field is not set, the last row or column is filled with either first_band_color or second_band_color, depending on the color of the previous row or column. *)
    secondBandColor : Color.t;
    (** The second color that is alternating. (Required) *)
    headerColor : Color.t;
    (** The color of the first row or column. If this field is set, the first row or column is filled with this color and the colors alternate between first_band_color and second_band_color starting from the second row or column. Otherwise, the first row or column is filled with first_band_color and the colors proceed to alternate as they normally would. *)
    secondBandColorStyle : ColorStyle.t;
    (** The second color that is alternating. (Required) If second_band_color is also set, this field takes precedence. *)
    firstBandColor : Color.t;
    (** The first color that is alternating. (Required) *)
    footerColorStyle : ColorStyle.t;
    (** The color of the last row or column. If this field is not set, the last row or column is filled with either first_band_color or second_band_color, depending on the color of the previous row or column. If footer_color is also set, this field takes precedence. *)
    firstBandColorStyle : ColorStyle.t;
    (** The first color that is alternating. (Required) If first_band_color is also set, this field takes precedence. *)
    
  }
  
  val headerColorStyle : (t, ColorStyle.t) GapiLens.t
  val footerColor : (t, Color.t) GapiLens.t
  val secondBandColor : (t, Color.t) GapiLens.t
  val headerColor : (t, Color.t) GapiLens.t
  val secondBandColorStyle : (t, ColorStyle.t) GapiLens.t
  val firstBandColor : (t, Color.t) GapiLens.t
  val footerColorStyle : (t, ColorStyle.t) GapiLens.t
  val firstBandColorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BandedRange :
sig
  type t = {
    columnProperties : BandingProperties.t;
    (** Properties for column bands. These properties are applied on a column- by-column basis throughout all the columns in the range. At least one of row_properties or column_properties must be specified. *)
    bandedRangeId : int;
    (** The id of the banded range. *)
    range : GridRange.t;
    (** The range over which these properties are applied. *)
    rowProperties : BandingProperties.t;
    (** Properties for row bands. These properties are applied on a row-by-row basis throughout all the rows in the range. At least one of row_properties or column_properties must be specified. *)
    
  }
  
  val columnProperties : (t, BandingProperties.t) GapiLens.t
  val bandedRangeId : (t, int) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val rowProperties : (t, BandingProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddBandingResponse :
sig
  type t = {
    bandedRange : BandedRange.t;
    (** The banded range that was added. *)
    
  }
  
  val bandedRange : (t, BandedRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceParameter :
sig
  type t = {
    namedRangeId : string;
    (** ID of a NamedRange. Its size must be 1x1. *)
    name : string;
    (** Named parameter. Must be a legitimate identifier for the DataSource that supports it. For example, \[BigQuery identifier\](https://cloud.google.com/bigquery/docs/reference/standard-sql/lexical#identifiers). *)
    range : GridRange.t;
    (** A range that contains the value of the parameter. Its size must be 1x1. *)
    
  }
  
  val namedRangeId : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BigQueryTableSpec :
sig
  type t = {
    tableProjectId : string;
    (** The ID of a BigQuery project the table belongs to. If not specified, the project_id is assumed. *)
    datasetId : string;
    (** The BigQuery dataset id. *)
    tableId : string;
    (** The BigQuery table id. *)
    
  }
  
  val tableProjectId : (t, string) GapiLens.t
  val datasetId : (t, string) GapiLens.t
  val tableId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BigQueryQuerySpec :
sig
  type t = {
    rawQuery : string;
    (** The raw query string. *)
    
  }
  
  val rawQuery : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BigQueryDataSourceSpec :
sig
  type t = {
    tableSpec : BigQueryTableSpec.t;
    (** A BigQueryTableSpec. *)
    projectId : string;
    (** The ID of a BigQuery enabled GCP project with a billing account attached. For any queries executed against the data source, the project is charged. *)
    querySpec : BigQueryQuerySpec.t;
    (** A BigQueryQuerySpec. *)
    
  }
  
  val tableSpec : (t, BigQueryTableSpec.t) GapiLens.t
  val projectId : (t, string) GapiLens.t
  val querySpec : (t, BigQueryQuerySpec.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceSpec :
sig
  type t = {
    parameters : DataSourceParameter.t list;
    (** The parameters of the data source, used when querying the data source. *)
    bigQuery : BigQueryDataSourceSpec.t;
    (** A BigQueryDataSourceSpec. *)
    
  }
  
  val parameters : (t, DataSourceParameter.t list) GapiLens.t
  val bigQuery : (t, BigQueryDataSourceSpec.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSource :
sig
  type t = {
    sheetId : int;
    (** The ID of the Sheet connected with the data source. The field cannot be changed once set. When creating a data source, an associated DATA_SOURCE sheet is also created, if the field is not specified, the ID of the created sheet will be randomly generated. *)
    spec : DataSourceSpec.t;
    (** The DataSourceSpec for the data source connected with this spreadsheet. *)
    dataSourceId : string;
    (** The spreadsheet-scoped unique ID that identifies the data source. Example: 1080547365. *)
    calculatedColumns : DataSourceColumn.t list;
    (** All calculated columns in the data source. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  val spec : (t, DataSourceSpec.t) GapiLens.t
  val dataSourceId : (t, string) GapiLens.t
  val calculatedColumns : (t, DataSourceColumn.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddDataSourceResponse :
sig
  type t = {
    dataExecutionStatus : DataExecutionStatus.t;
    (** The data execution status. *)
    dataSource : DataSource.t;
    (** The data source that was created. *)
    
  }
  
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  val dataSource : (t, DataSource.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SlicerSpec :
sig
  type t = {
    columnIndex : int;
    (** The column index in the data table on which the filter is applied to. *)
    applyToPivotTables : bool;
    (** True if the filter should apply to pivot tables. If not set, default to `True`. *)
    filterCriteria : FilterCriteria.t;
    (** The filtering criteria of the slicer. *)
    textFormat : TextFormat.t;
    (** The text format of title in the slicer. The link field is not supported. *)
    backgroundColorStyle : ColorStyle.t;
    (** The background color of the slicer. If background_color is also set, this field takes precedence. *)
    title : string;
    (** The title of the slicer. *)
    dataRange : GridRange.t;
    (** The data range of the slicer. *)
    horizontalAlignment : string;
    (** The horizontal alignment of title in the slicer. If unspecified, defaults to `LEFT` *)
    backgroundColor : Color.t;
    (** The background color of the slicer. *)
    
  }
  
  val columnIndex : (t, int) GapiLens.t
  val applyToPivotTables : (t, bool) GapiLens.t
  val filterCriteria : (t, FilterCriteria.t) GapiLens.t
  val textFormat : (t, TextFormat.t) GapiLens.t
  val backgroundColorStyle : (t, ColorStyle.t) GapiLens.t
  val title : (t, string) GapiLens.t
  val dataRange : (t, GridRange.t) GapiLens.t
  val horizontalAlignment : (t, string) GapiLens.t
  val backgroundColor : (t, Color.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Slicer :
sig
  type t = {
    position : EmbeddedObjectPosition.t;
    (** The position of the slicer. Note that slicer can be positioned only on existing sheet. Also, width and height of slicer can be automatically adjusted to keep it within permitted limits. *)
    spec : SlicerSpec.t;
    (** The specification of the slicer. *)
    slicerId : int;
    (** The ID of the slicer. *)
    
  }
  
  val position : (t, EmbeddedObjectPosition.t) GapiLens.t
  val spec : (t, SlicerSpec.t) GapiLens.t
  val slicerId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddSlicerResponse :
sig
  type t = {
    slicer : Slicer.t;
    (** The newly added slicer. *)
    
  }
  
  val slicer : (t, Slicer.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FindReplaceResponse :
sig
  type t = {
    rowsChanged : int;
    (** The number of rows changed. *)
    occurrencesChanged : int;
    (** The number of occurrences (possibly multiple within a cell) changed. For example, if replacing `"e"` with `"o"` in `"Google Sheets"`, this would be `"3"` because `"Google Sheets"` -> `"Googlo Shoots"`. *)
    formulasChanged : int;
    (** The number of formula cells changed. *)
    sheetsChanged : int;
    (** The number of sheets changed. *)
    valuesChanged : int;
    (** The number of non-formula cells changed. *)
    
  }
  
  val rowsChanged : (t, int) GapiLens.t
  val occurrencesChanged : (t, int) GapiLens.t
  val formulasChanged : (t, int) GapiLens.t
  val sheetsChanged : (t, int) GapiLens.t
  val valuesChanged : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceObjectReference :
sig
  type t = {
    chartId : int;
    (** References to a data source chart. *)
    sheetId : string;
    (** References to a DATA_SOURCE sheet. *)
    dataSourceTableAnchorCell : GridCoordinate.t;
    (** References to a DataSourceTable anchored at the cell. *)
    dataSourceFormulaCell : GridCoordinate.t;
    (** References to a cell containing DataSourceFormula. *)
    dataSourcePivotTableAnchorCell : GridCoordinate.t;
    (** References to a data source PivotTable anchored at the cell. *)
    
  }
  
  val chartId : (t, int) GapiLens.t
  val sheetId : (t, string) GapiLens.t
  val dataSourceTableAnchorCell : (t, GridCoordinate.t) GapiLens.t
  val dataSourceFormulaCell : (t, GridCoordinate.t) GapiLens.t
  val dataSourcePivotTableAnchorCell : (t, GridCoordinate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RefreshDataSourceObjectExecutionStatus :
sig
  type t = {
    reference : DataSourceObjectReference.t;
    (** Reference to a data source object being refreshed. *)
    dataExecutionStatus : DataExecutionStatus.t;
    (** The data execution status. *)
    
  }
  
  val reference : (t, DataSourceObjectReference.t) GapiLens.t
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RefreshDataSourceResponse :
sig
  type t = {
    statuses : RefreshDataSourceObjectExecutionStatus.t list;
    (** All the refresh status for the data source object references specified in the request. If is_all is specified, the field contains only those in failure status. *)
    
  }
  
  val statuses : (t, RefreshDataSourceObjectExecutionStatus.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module NamedRange :
sig
  type t = {
    range : GridRange.t;
    (** The range this represents. *)
    namedRangeId : string;
    (** The ID of the named range. *)
    name : string;
    (** The name of the named range. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  val namedRangeId : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddNamedRangeResponse :
sig
  type t = {
    namedRange : NamedRange.t;
    (** The named range to add. *)
    
  }
  
  val namedRange : (t, NamedRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateDataSourceResponse :
sig
  type t = {
    dataSource : DataSource.t;
    (** The updated data source. *)
    dataExecutionStatus : DataExecutionStatus.t;
    (** The data execution status. *)
    
  }
  
  val dataSource : (t, DataSource.t) GapiLens.t
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FilterView :
sig
  type t = {
    filterViewId : int;
    (** The ID of the filter view. *)
    title : string;
    (** The name of the filter view. *)
    sortSpecs : SortSpec.t list;
    (** The sort order per column. Later specifications are used when values are equal in the earlier specifications. *)
    range : GridRange.t;
    (** The range this filter view covers. When writing, only one of range or named_range_id may be set. *)
    filterSpecs : FilterSpec.t list;
    (** The filter criteria for showing/hiding values per column. Both criteria and filter_specs are populated in responses. If both fields are specified in an update request, this field takes precedence. *)
    namedRangeId : string;
    (** The named range this filter view is backed by, if any. When writing, only one of range or named_range_id may be set. *)
    criteria : (string * FilterCriteria.t) list;
    (** The criteria for showing/hiding values per column. The map's key is the column index, and the value is the criteria for that column. This field is deprecated in favor of filter_specs. *)
    
  }
  
  val filterViewId : (t, int) GapiLens.t
  val title : (t, string) GapiLens.t
  val sortSpecs : (t, SortSpec.t list) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val filterSpecs : (t, FilterSpec.t list) GapiLens.t
  val namedRangeId : (t, string) GapiLens.t
  val criteria : (t, (string * FilterCriteria.t) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddFilterViewResponse :
sig
  type t = {
    filter : FilterView.t;
    (** The newly added filter view. *)
    
  }
  
  val filter : (t, FilterView.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module InterpolationPoint :
sig
  type t = {
    value : string;
    (** The value this interpolation point uses. May be a formula. Unused if type is MIN or MAX. *)
    color : Color.t;
    (** The color this interpolation point should use. *)
    colorStyle : ColorStyle.t;
    (** The color this interpolation point should use. If color is also set, this field takes precedence. *)
    _type : string;
    (** How the value should be interpreted. *)
    
  }
  
  val value : (t, string) GapiLens.t
  val color : (t, Color.t) GapiLens.t
  val colorStyle : (t, ColorStyle.t) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GradientRule :
sig
  type t = {
    maxpoint : InterpolationPoint.t;
    (** The final interpolation point. *)
    minpoint : InterpolationPoint.t;
    (** The starting interpolation point. *)
    midpoint : InterpolationPoint.t;
    (** An optional midway interpolation point. *)
    
  }
  
  val maxpoint : (t, InterpolationPoint.t) GapiLens.t
  val minpoint : (t, InterpolationPoint.t) GapiLens.t
  val midpoint : (t, InterpolationPoint.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TextRotation :
sig
  type t = {
    angle : int;
    (** The angle between the standard orientation and the desired orientation. Measured in degrees. Valid values are between -90 and 90. Positive angles are angled upwards, negative are angled downwards. Note: For LTR text direction positive angles are in the counterclockwise direction, whereas for RTL they are in the clockwise direction *)
    vertical : bool;
    (** If true, text reads top to bottom, but the orientation of individual characters is unchanged. For example: | V | | e | | r | | t | | i | | c | | a | | l | *)
    
  }
  
  val angle : (t, int) GapiLens.t
  val vertical : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module NumberFormat :
sig
  type t = {
    _type : string;
    (** The type of the number format. When writing, this field must be set. *)
    pattern : string;
    (** Pattern string used for formatting. If not set, a default pattern based on the user's locale will be used if necessary for the given type. See the \[Date and Number Formats guide\](/sheets/api/guides/formats) for more information about the supported patterns. *)
    
  }
  
  val _type : (t, string) GapiLens.t
  val pattern : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Padding :
sig
  type t = {
    top : int;
    (** The top padding of the cell. *)
    bottom : int;
    (** The bottom padding of the cell. *)
    right : int;
    (** The right padding of the cell. *)
    left : int;
    (** The left padding of the cell. *)
    
  }
  
  val top : (t, int) GapiLens.t
  val bottom : (t, int) GapiLens.t
  val right : (t, int) GapiLens.t
  val left : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Border :
sig
  type t = {
    style : string;
    (** The style of the border. *)
    color : Color.t;
    (** The color of the border. *)
    width : int;
    (** The width of the border, in pixels. Deprecated; the width is determined by the "style" field. *)
    colorStyle : ColorStyle.t;
    (** The color of the border. If color is also set, this field takes precedence. *)
    
  }
  
  val style : (t, string) GapiLens.t
  val color : (t, Color.t) GapiLens.t
  val width : (t, int) GapiLens.t
  val colorStyle : (t, ColorStyle.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Borders :
sig
  type t = {
    bottom : Border.t;
    (** The bottom border of the cell. *)
    right : Border.t;
    (** The right border of the cell. *)
    left : Border.t;
    (** The left border of the cell. *)
    top : Border.t;
    (** The top border of the cell. *)
    
  }
  
  val bottom : (t, Border.t) GapiLens.t
  val right : (t, Border.t) GapiLens.t
  val left : (t, Border.t) GapiLens.t
  val top : (t, Border.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CellFormat :
sig
  type t = {
    padding : Padding.t;
    (** The padding of the cell. *)
    wrapStrategy : string;
    (** The wrap strategy for the value in the cell. *)
    backgroundColorStyle : ColorStyle.t;
    (** The background color of the cell. If background_color is also set, this field takes precedence. *)
    textFormat : TextFormat.t;
    (** The format of the text in the cell (unless overridden by a format run). Setting a cell-level link here will clear the cell's existing links. Setting the link field in a TextFormatRun will take precedence over the cell-level link. *)
    numberFormat : NumberFormat.t;
    (** A format describing how number values should be represented to the user. *)
    horizontalAlignment : string;
    (** The horizontal alignment of the value in the cell. *)
    textDirection : string;
    (** The direction of the text in the cell. *)
    backgroundColor : Color.t;
    (** The background color of the cell. *)
    textRotation : TextRotation.t;
    (** The rotation applied to text in a cell *)
    borders : Borders.t;
    (** The borders of the cell. *)
    hyperlinkDisplayType : string;
    (** How a hyperlink, if it exists, should be displayed in the cell. *)
    verticalAlignment : string;
    (** The vertical alignment of the value in the cell. *)
    
  }
  
  val padding : (t, Padding.t) GapiLens.t
  val wrapStrategy : (t, string) GapiLens.t
  val backgroundColorStyle : (t, ColorStyle.t) GapiLens.t
  val textFormat : (t, TextFormat.t) GapiLens.t
  val numberFormat : (t, NumberFormat.t) GapiLens.t
  val horizontalAlignment : (t, string) GapiLens.t
  val textDirection : (t, string) GapiLens.t
  val backgroundColor : (t, Color.t) GapiLens.t
  val textRotation : (t, TextRotation.t) GapiLens.t
  val borders : (t, Borders.t) GapiLens.t
  val hyperlinkDisplayType : (t, string) GapiLens.t
  val verticalAlignment : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BooleanRule :
sig
  type t = {
    condition : BooleanCondition.t;
    (** The condition of the rule. If the condition evaluates to true, the format is applied. *)
    format : CellFormat.t;
    (** The format to apply. Conditional formatting can only apply a subset of formatting: bold, italic, strikethrough, foreground color & background color. *)
    
  }
  
  val condition : (t, BooleanCondition.t) GapiLens.t
  val format : (t, CellFormat.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ConditionalFormatRule :
sig
  type t = {
    ranges : GridRange.t list;
    (** The ranges that are formatted if the condition is true. All the ranges must be on the same grid. *)
    gradientRule : GradientRule.t;
    (** The formatting will vary based on the gradients in the rule. *)
    booleanRule : BooleanRule.t;
    (** The formatting is either "on" or "off" according to the rule. *)
    
  }
  
  val ranges : (t, GridRange.t list) GapiLens.t
  val gradientRule : (t, GradientRule.t) GapiLens.t
  val booleanRule : (t, BooleanRule.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteConditionalFormatRuleResponse :
sig
  type t = {
    rule : ConditionalFormatRule.t;
    (** The rule that was deleted. *)
    
  }
  
  val rule : (t, ConditionalFormatRule.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DuplicateFilterViewResponse :
sig
  type t = {
    filter : FilterView.t;
    (** The newly created filter. *)
    
  }
  
  val filter : (t, FilterView.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddProtectedRangeResponse :
sig
  type t = {
    protectedRange : ProtectedRange.t;
    (** The newly added protected range. *)
    
  }
  
  val protectedRange : (t, ProtectedRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CreateDeveloperMetadataResponse :
sig
  type t = {
    developerMetadata : DeveloperMetadata.t;
    (** The developer metadata that was created. *)
    
  }
  
  val developerMetadata : (t, DeveloperMetadata.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateEmbeddedObjectPositionResponse :
sig
  type t = {
    position : EmbeddedObjectPosition.t;
    (** The new position of the embedded object. *)
    
  }
  
  val position : (t, EmbeddedObjectPosition.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDeveloperMetadataResponse :
sig
  type t = {
    deletedDeveloperMetadata : DeveloperMetadata.t list;
    (** The metadata that was deleted. *)
    
  }
  
  val deletedDeveloperMetadata : (t, DeveloperMetadata.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateConditionalFormatRuleResponse :
sig
  type t = {
    newIndex : int;
    (** The index of the new rule. *)
    newRule : ConditionalFormatRule.t;
    (** The new rule that replaced the old rule (if replacing), or the rule that was moved (if moved) *)
    oldRule : ConditionalFormatRule.t;
    (** The old (deleted) rule. Not set if a rule was moved (because it is the same as new_rule). *)
    oldIndex : int;
    (** The old index of the rule. Not set if a rule was replaced (because it is the same as new_index). *)
    
  }
  
  val newIndex : (t, int) GapiLens.t
  val newRule : (t, ConditionalFormatRule.t) GapiLens.t
  val oldRule : (t, ConditionalFormatRule.t) GapiLens.t
  val oldIndex : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDuplicatesResponse :
sig
  type t = {
    duplicatesRemovedCount : int;
    (** The number of duplicate rows removed. *)
    
  }
  
  val duplicatesRemovedCount : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDimensionGroupResponse :
sig
  type t = {
    dimensionGroups : DimensionGroup.t list;
    (** All groups of a dimension after deleting a group from that dimension. *)
    
  }
  
  val dimensionGroups : (t, DimensionGroup.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DuplicateSheetResponse :
sig
  type t = {
    properties : SheetProperties.t;
    (** The properties of the duplicate sheet. *)
    
  }
  
  val properties : (t, SheetProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Response :
sig
  type t = {
    addFilterView : AddFilterViewResponse.t;
    (** A reply from adding a filter view. *)
    updateDataSource : UpdateDataSourceResponse.t;
    (** A reply from updating a data source. *)
    deleteConditionalFormatRule : DeleteConditionalFormatRuleResponse.t;
    (** A reply from deleting a conditional format rule. *)
    addNamedRange : AddNamedRangeResponse.t;
    (** A reply from adding a named range. *)
    duplicateFilterView : DuplicateFilterViewResponse.t;
    (** A reply from duplicating a filter view. *)
    refreshDataSource : RefreshDataSourceResponse.t;
    (** A reply from refreshing data source objects. *)
    addProtectedRange : AddProtectedRangeResponse.t;
    (** A reply from adding a protected range. *)
    findReplace : FindReplaceResponse.t;
    (** A reply from doing a find/replace. *)
    createDeveloperMetadata : CreateDeveloperMetadataResponse.t;
    (** A reply from creating a developer metadata entry. *)
    addSlicer : AddSlicerResponse.t;
    (** A reply from adding a slicer. *)
    updateEmbeddedObjectPosition : UpdateEmbeddedObjectPositionResponse.t;
    (** A reply from updating an embedded object's position. *)
    addDataSource : AddDataSourceResponse.t;
    (** A reply from adding a data source. *)
    deleteDeveloperMetadata : DeleteDeveloperMetadataResponse.t;
    (** A reply from deleting a developer metadata entry. *)
    addBanding : AddBandingResponse.t;
    (** A reply from adding a banded range. *)
    updateConditionalFormatRule : UpdateConditionalFormatRuleResponse.t;
    (** A reply from updating a conditional format rule. *)
    addDimensionGroup : AddDimensionGroupResponse.t;
    (** A reply from adding a dimension group. *)
    updateDeveloperMetadata : UpdateDeveloperMetadataResponse.t;
    (** A reply from updating a developer metadata entry. *)
    trimWhitespace : TrimWhitespaceResponse.t;
    (** A reply from trimming whitespace. *)
    deleteDuplicates : DeleteDuplicatesResponse.t;
    (** A reply from removing rows containing duplicate values. *)
    addChart : AddChartResponse.t;
    (** A reply from adding a chart. *)
    deleteDimensionGroup : DeleteDimensionGroupResponse.t;
    (** A reply from deleting a dimension group. *)
    addSheet : AddSheetResponse.t;
    (** A reply from adding a sheet. *)
    duplicateSheet : DuplicateSheetResponse.t;
    (** A reply from duplicating a sheet. *)
    
  }
  
  val addFilterView : (t, AddFilterViewResponse.t) GapiLens.t
  val updateDataSource : (t, UpdateDataSourceResponse.t) GapiLens.t
  val deleteConditionalFormatRule : (t, DeleteConditionalFormatRuleResponse.t) GapiLens.t
  val addNamedRange : (t, AddNamedRangeResponse.t) GapiLens.t
  val duplicateFilterView : (t, DuplicateFilterViewResponse.t) GapiLens.t
  val refreshDataSource : (t, RefreshDataSourceResponse.t) GapiLens.t
  val addProtectedRange : (t, AddProtectedRangeResponse.t) GapiLens.t
  val findReplace : (t, FindReplaceResponse.t) GapiLens.t
  val createDeveloperMetadata : (t, CreateDeveloperMetadataResponse.t) GapiLens.t
  val addSlicer : (t, AddSlicerResponse.t) GapiLens.t
  val updateEmbeddedObjectPosition : (t, UpdateEmbeddedObjectPositionResponse.t) GapiLens.t
  val addDataSource : (t, AddDataSourceResponse.t) GapiLens.t
  val deleteDeveloperMetadata : (t, DeleteDeveloperMetadataResponse.t) GapiLens.t
  val addBanding : (t, AddBandingResponse.t) GapiLens.t
  val updateConditionalFormatRule : (t, UpdateConditionalFormatRuleResponse.t) GapiLens.t
  val addDimensionGroup : (t, AddDimensionGroupResponse.t) GapiLens.t
  val updateDeveloperMetadata : (t, UpdateDeveloperMetadataResponse.t) GapiLens.t
  val trimWhitespace : (t, TrimWhitespaceResponse.t) GapiLens.t
  val deleteDuplicates : (t, DeleteDuplicatesResponse.t) GapiLens.t
  val addChart : (t, AddChartResponse.t) GapiLens.t
  val deleteDimensionGroup : (t, DeleteDimensionGroupResponse.t) GapiLens.t
  val addSheet : (t, AddSheetResponse.t) GapiLens.t
  val duplicateSheet : (t, DuplicateSheetResponse.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DimensionProperties :
sig
  type t = {
    pixelSize : int;
    (** The height (if a row) or width (if a column) of the dimension in pixels. *)
    hiddenByUser : bool;
    (** True if this dimension is explicitly hidden. *)
    developerMetadata : DeveloperMetadata.t list;
    (** The developer metadata associated with a single row or column. *)
    hiddenByFilter : bool;
    (** True if this dimension is being filtered. This field is read-only. *)
    dataSourceColumnReference : DataSourceColumnReference.t;
    (** Output only. If set, this is a column in a data source sheet. *)
    
  }
  
  val pixelSize : (t, int) GapiLens.t
  val hiddenByUser : (t, bool) GapiLens.t
  val developerMetadata : (t, DeveloperMetadata.t list) GapiLens.t
  val hiddenByFilter : (t, bool) GapiLens.t
  val dataSourceColumnReference : (t, DataSourceColumnReference.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceFormula :
sig
  type t = {
    dataSourceId : string;
    (** The ID of the data source the formula is associated with. *)
    dataExecutionStatus : DataExecutionStatus.t;
    (** Output only. The data execution status. *)
    
  }
  
  val dataSourceId : (t, string) GapiLens.t
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotValue :
sig
  type t = {
    dataSourceColumnReference : DataSourceColumnReference.t;
    (** The reference to the data source column that this value reads from. *)
    sourceColumnOffset : int;
    (** The column offset of the source range that this value reads from. For example, if the source was `C10:E15`, a `sourceColumnOffset` of `0` means this value refers to column `C`, whereas the offset `1` would refer to column `D`. *)
    calculatedDisplayType : string;
    (** If specified, indicates that pivot values should be displayed as the result of a calculation with another pivot value. For example, if calculated_display_type is specified as PERCENT_OF_GRAND_TOTAL, all the pivot values are displayed as the percentage of the grand total. In the Sheets editor, this is referred to as "Show As" in the value section of a pivot table. *)
    name : string;
    (** A name to use for the value. *)
    formula : string;
    (** A custom formula to calculate the value. The formula must start with an `=` character. *)
    summarizeFunction : string;
    (** A function to summarize the value. If formula is set, the only supported values are SUM and CUSTOM. If sourceColumnOffset is set, then `CUSTOM` is not supported. *)
    
  }
  
  val dataSourceColumnReference : (t, DataSourceColumnReference.t) GapiLens.t
  val sourceColumnOffset : (t, int) GapiLens.t
  val calculatedDisplayType : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val formula : (t, string) GapiLens.t
  val summarizeFunction : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ErrorValue :
sig
  type t = {
    message : string;
    (** A message with more information about the error (in the spreadsheet's locale). *)
    _type : string;
    (** The type of error. *)
    
  }
  
  val message : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ExtendedValue :
sig
  type t = {
    boolValue : bool;
    (** Represents a boolean value. *)
    numberValue : float;
    (** Represents a double value. Note: Dates, Times and DateTimes are represented as doubles in SERIAL_NUMBER format. *)
    formulaValue : string;
    (** Represents a formula. *)
    errorValue : ErrorValue.t;
    (** Represents an error. This field is read-only. *)
    stringValue : string;
    (** Represents a string value. Leading single quotes are not included. For example, if the user typed `'123` into the UI, this would be represented as a `stringValue` of `"123"`. *)
    
  }
  
  val boolValue : (t, bool) GapiLens.t
  val numberValue : (t, float) GapiLens.t
  val formulaValue : (t, string) GapiLens.t
  val errorValue : (t, ErrorValue.t) GapiLens.t
  val stringValue : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotGroupValueMetadata :
sig
  type t = {
    value : ExtendedValue.t;
    (** The calculated value the metadata corresponds to. (Note that formulaValue is not valid, because the values will be calculated.) *)
    collapsed : bool;
    (** True if the data corresponding to the value is collapsed. *)
    
  }
  
  val value : (t, ExtendedValue.t) GapiLens.t
  val collapsed : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotGroupSortValueBucket :
sig
  type t = {
    buckets : ExtendedValue.t list;
    (** Determines the bucket from which values are chosen to sort. For example, in a pivot table with one row group & two column groups, the row group can list up to two values. The first value corresponds to a value within the first column group, and the second value corresponds to a value in the second column group. If no values are listed, this would indicate that the row should be sorted according to the "Grand Total" over the column groups. If a single value is listed, this would correspond to using the "Total" of that bucket. *)
    valuesIndex : int;
    (** The offset in the PivotTable.values list which the values in this grouping should be sorted by. *)
    
  }
  
  val buckets : (t, ExtendedValue.t list) GapiLens.t
  val valuesIndex : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DateTimeRule :
sig
  type t = {
    _type : string;
    (** The type of date-time grouping to apply. *)
    
  }
  
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module HistogramRule :
sig
  type t = {
    interval : float;
    (** The size of the buckets that are created. Must be positive. *)
    _end : float;
    (** The maximum value at which items are placed into buckets of constant size. Values above end are lumped into a single bucket. This field is optional. *)
    start : float;
    (** The minimum value at which items are placed into buckets of constant size. Values below start are lumped into a single bucket. This field is optional. *)
    
  }
  
  val interval : (t, float) GapiLens.t
  val _end : (t, float) GapiLens.t
  val start : (t, float) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ManualRuleGroup :
sig
  type t = {
    groupName : ExtendedValue.t;
    (** The group name, which must be a string. Each group in a given ManualRule must have a unique group name. *)
    items : ExtendedValue.t list;
    (** The items in the source data that should be placed into this group. Each item may be a string, number, or boolean. Items may appear in at most one group within a given ManualRule. Items that do not appear in any group will appear on their own. *)
    
  }
  
  val groupName : (t, ExtendedValue.t) GapiLens.t
  val items : (t, ExtendedValue.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ManualRule :
sig
  type t = {
    groups : ManualRuleGroup.t list;
    (** The list of group names and the corresponding items from the source data that map to each group name. *)
    
  }
  
  val groups : (t, ManualRuleGroup.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotGroupRule :
sig
  type t = {
    histogramRule : HistogramRule.t;
    (** A HistogramRule. *)
    dateTimeRule : DateTimeRule.t;
    (** A DateTimeRule. *)
    manualRule : ManualRule.t;
    (** A ManualRule. *)
    
  }
  
  val histogramRule : (t, HistogramRule.t) GapiLens.t
  val dateTimeRule : (t, DateTimeRule.t) GapiLens.t
  val manualRule : (t, ManualRule.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotGroupLimit :
sig
  type t = {
    countLimit : int;
    (** The count limit. *)
    applyOrder : int;
    (** The order in which the group limit is applied to the pivot table. Pivot group limits are applied from lower to higher order number. Order numbers are normalized to consecutive integers from 0. For write request, to fully customize the applying orders, all pivot group limits should have this field set with an unique number. Otherwise, the order is determined by the index in the PivotTable.rows list and then the PivotTable.columns list. *)
    
  }
  
  val countLimit : (t, int) GapiLens.t
  val applyOrder : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotGroup :
sig
  type t = {
    sortOrder : string;
    (** The order the values in this group should be sorted. *)
    repeatHeadings : bool;
    (** True if the headings in this pivot group should be repeated. This is only valid for row groupings and is ignored by columns. By default, we minimize repetition of headings by not showing higher level headings where they are the same. For example, even though the third row below corresponds to "Q1 Mar", "Q1" is not shown because it is redundant with previous rows. Setting repeat_headings to true would cause "Q1" to be repeated for "Feb" and "Mar". +--------------+ | Q1 | Jan | | | Feb | | | Mar | +--------+-----+ | Q1 Total | +--------------+ *)
    groupRule : PivotGroupRule.t;
    (** The group rule to apply to this row/column group. *)
    sourceColumnOffset : int;
    (** The column offset of the source range that this grouping is based on. For example, if the source was `C10:E15`, a `sourceColumnOffset` of `0` means this group refers to column `C`, whereas the offset `1` would refer to column `D`. *)
    showTotals : bool;
    (** True if the pivot table should include the totals for this grouping. *)
    label : string;
    (** The labels to use for the row/column groups which can be customized. For example, in the following pivot table, the row label is `Region` (which could be renamed to `State`) and the column label is `Product` (which could be renamed `Item`). Pivot tables created before December 2017 do not have header labels. If you'd like to add header labels to an existing pivot table, please delete the existing pivot table and then create a new pivot table with same parameters. +--------------+---------+-------+ | SUM of Units | Product | | | Region | Pen | Paper | +--------------+---------+-------+ | New York | 345 | 98 | | Oregon | 234 | 123 | | Tennessee | 531 | 415 | +--------------+---------+-------+ | Grand Total | 1110 | 636 | +--------------+---------+-------+ *)
    valueBucket : PivotGroupSortValueBucket.t;
    (** The bucket of the opposite pivot group to sort by. If not specified, sorting is alphabetical by this group's values. *)
    dataSourceColumnReference : DataSourceColumnReference.t;
    (** The reference to the data source column this grouping is based on. *)
    valueMetadata : PivotGroupValueMetadata.t list;
    (** Metadata about values in the grouping. *)
    groupLimit : PivotGroupLimit.t;
    (** The count limit on rows or columns to apply to this pivot group. *)
    
  }
  
  val sortOrder : (t, string) GapiLens.t
  val repeatHeadings : (t, bool) GapiLens.t
  val groupRule : (t, PivotGroupRule.t) GapiLens.t
  val sourceColumnOffset : (t, int) GapiLens.t
  val showTotals : (t, bool) GapiLens.t
  val label : (t, string) GapiLens.t
  val valueBucket : (t, PivotGroupSortValueBucket.t) GapiLens.t
  val dataSourceColumnReference : (t, DataSourceColumnReference.t) GapiLens.t
  val valueMetadata : (t, PivotGroupValueMetadata.t list) GapiLens.t
  val groupLimit : (t, PivotGroupLimit.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PivotTable :
sig
  type t = {
    dataSourceId : string;
    (** The ID of the data source the pivot table is reading data from. *)
    dataExecutionStatus : DataExecutionStatus.t;
    (** Output only. The data execution status for data source pivot tables. *)
    filterSpecs : PivotFilterSpec.t list;
    (** The filters applied to the source columns before aggregating data for the pivot table. Both criteria and filter_specs are populated in responses. If both fields are specified in an update request, this field takes precedence. *)
    rows : PivotGroup.t list;
    (** Each row grouping in the pivot table. *)
    valueLayout : string;
    (** Whether values should be listed horizontally (as columns) or vertically (as rows). *)
    criteria : (string * PivotFilterCriteria.t) list;
    (** An optional mapping of filters per source column offset. The filters are applied before aggregating data into the pivot table. The map's key is the column offset of the source range that you want to filter, and the value is the criteria for that column. For example, if the source was `C10:E15`, a key of `0` will have the filter for column `C`, whereas the key `1` is for column `D`. This field is deprecated in favor of filter_specs. *)
    values : PivotValue.t list;
    (** A list of values to include in the pivot table. *)
    source : GridRange.t;
    (** The range the pivot table is reading data from. *)
    columns : PivotGroup.t list;
    (** Each column grouping in the pivot table. *)
    
  }
  
  val dataSourceId : (t, string) GapiLens.t
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  val filterSpecs : (t, PivotFilterSpec.t list) GapiLens.t
  val rows : (t, PivotGroup.t list) GapiLens.t
  val valueLayout : (t, string) GapiLens.t
  val criteria : (t, (string * PivotFilterCriteria.t) list) GapiLens.t
  val values : (t, PivotValue.t list) GapiLens.t
  val source : (t, GridRange.t) GapiLens.t
  val columns : (t, PivotGroup.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataValidationRule :
sig
  type t = {
    inputMessage : string;
    (** A message to show the user when adding data to the cell. *)
    showCustomUi : bool;
    (** True if the UI should be customized based on the kind of condition. If true, "List" conditions will show a dropdown. *)
    strict : bool;
    (** True if invalid data should be rejected. *)
    condition : BooleanCondition.t;
    (** The condition that data in the cell must match. *)
    
  }
  
  val inputMessage : (t, string) GapiLens.t
  val showCustomUi : (t, bool) GapiLens.t
  val strict : (t, bool) GapiLens.t
  val condition : (t, BooleanCondition.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceTable :
sig
  type t = {
    columns : DataSourceColumnReference.t list;
    (** Columns selected for the data source table. The column_selection_type must be SELECTED. *)
    filterSpecs : FilterSpec.t list;
    (** Filter specifications in the data source table. *)
    sortSpecs : SortSpec.t list;
    (** Sort specifications in the data source table. The result of the data source table is sorted based on the sort specifications in order. *)
    dataExecutionStatus : DataExecutionStatus.t;
    (** Output only. The data execution status. *)
    rowLimit : int;
    (** The limit of rows to return. If not set, a default limit is applied. Please refer to the Sheets editor for the default and max limit. *)
    columnSelectionType : string;
    (** The type to select columns for the data source table. Defaults to SELECTED. *)
    dataSourceId : string;
    (** The ID of the data source the data source table is associated with. *)
    
  }
  
  val columns : (t, DataSourceColumnReference.t list) GapiLens.t
  val filterSpecs : (t, FilterSpec.t list) GapiLens.t
  val sortSpecs : (t, SortSpec.t list) GapiLens.t
  val dataExecutionStatus : (t, DataExecutionStatus.t) GapiLens.t
  val rowLimit : (t, int) GapiLens.t
  val columnSelectionType : (t, string) GapiLens.t
  val dataSourceId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TextFormatRun :
sig
  type t = {
    startIndex : int;
    (** The character index where this run starts. *)
    format : TextFormat.t;
    (** The format of this run. Absent values inherit the cell's format. *)
    
  }
  
  val startIndex : (t, int) GapiLens.t
  val format : (t, TextFormat.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CellData :
sig
  type t = {
    note : string;
    (** Any note on the cell. *)
    userEnteredValue : ExtendedValue.t;
    (** The value the user entered in the cell. e.g, `1234`, `'Hello'`, or `=NOW()` Note: Dates, Times and DateTimes are represented as doubles in serial number format. *)
    userEnteredFormat : CellFormat.t;
    (** The format the user entered for the cell. When writing, the new format will be merged with the existing format. *)
    effectiveValue : ExtendedValue.t;
    (** The effective value of the cell. For cells with formulas, this is the calculated value. For cells with literals, this is the same as the user_entered_value. This field is read-only. *)
    formattedValue : string;
    (** The formatted value of the cell. This is the value as it's shown to the user. This field is read-only. *)
    hyperlink : string;
    (** A hyperlink this cell points to, if any. If the cell contains multiple hyperlinks, this field will be empty. This field is read-only. To set it, use a `=HYPERLINK` formula in the userEnteredValue.formulaValue field. A cell-level link can also be set from the userEnteredFormat.textFormat field. Alternatively, set a hyperlink in the textFormatRun.format.link field that spans the entire cell. *)
    effectiveFormat : CellFormat.t;
    (** The effective format being used by the cell. This includes the results of applying any conditional formatting and, if the cell contains a formula, the computed number format. If the effective format is the default format, effective format will not be written. This field is read-only. *)
    dataValidation : DataValidationRule.t;
    (** A data validation rule on the cell, if any. When writing, the new data validation rule will overwrite any prior rule. *)
    pivotTable : PivotTable.t;
    (** A pivot table anchored at this cell. The size of pivot table itself is computed dynamically based on its data, grouping, filters, values, etc. Only the top-left cell of the pivot table contains the pivot table definition. The other cells will contain the calculated values of the results of the pivot in their effective_value fields. *)
    dataSourceTable : DataSourceTable.t;
    (** A data source table anchored at this cell. The size of data source table itself is computed dynamically based on its configuration. Only the first cell of the data source table contains the data source table definition. The other cells will contain the display values of the data source table result in their effective_value fields. *)
    dataSourceFormula : DataSourceFormula.t;
    (** Output only. Information about a data source formula on the cell. The field is set if user_entered_value is a formula referencing some DATA_SOURCE sheet, e.g. `=SUM(DataSheet!Column)`. *)
    textFormatRuns : TextFormatRun.t list;
    (** Runs of rich text applied to subsections of the cell. Runs are only valid on user entered strings, not formulas, bools, or numbers. Properties of a run start at a specific index in the text and continue until the next run. Runs will inherit the properties of the cell unless explicitly changed. When writing, the new runs will overwrite any prior runs. When writing a new user_entered_value, previous runs are erased. *)
    
  }
  
  val note : (t, string) GapiLens.t
  val userEnteredValue : (t, ExtendedValue.t) GapiLens.t
  val userEnteredFormat : (t, CellFormat.t) GapiLens.t
  val effectiveValue : (t, ExtendedValue.t) GapiLens.t
  val formattedValue : (t, string) GapiLens.t
  val hyperlink : (t, string) GapiLens.t
  val effectiveFormat : (t, CellFormat.t) GapiLens.t
  val dataValidation : (t, DataValidationRule.t) GapiLens.t
  val pivotTable : (t, PivotTable.t) GapiLens.t
  val dataSourceTable : (t, DataSourceTable.t) GapiLens.t
  val dataSourceFormula : (t, DataSourceFormula.t) GapiLens.t
  val textFormatRuns : (t, TextFormatRun.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RowData :
sig
  type t = {
    values : CellData.t list;
    (** The values in the row, one per column. *)
    
  }
  
  val values : (t, CellData.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GridData :
sig
  type t = {
    rowData : RowData.t list;
    (** The data in the grid, one entry per row, starting with the row in startRow. The values in RowData will correspond to columns starting at start_column. *)
    columnMetadata : DimensionProperties.t list;
    (** Metadata about the requested columns in the grid, starting with the column in start_column. *)
    startRow : int;
    (** The first row this GridData refers to, zero-based. *)
    rowMetadata : DimensionProperties.t list;
    (** Metadata about the requested rows in the grid, starting with the row in start_row. *)
    startColumn : int;
    (** The first column this GridData refers to, zero-based. *)
    
  }
  
  val rowData : (t, RowData.t list) GapiLens.t
  val columnMetadata : (t, DimensionProperties.t list) GapiLens.t
  val startRow : (t, int) GapiLens.t
  val rowMetadata : (t, DimensionProperties.t list) GapiLens.t
  val startColumn : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BasicFilter :
sig
  type t = {
    filterSpecs : FilterSpec.t list;
    (** The filter criteria per column. Both criteria and filter_specs are populated in responses. If both fields are specified in an update request, this field takes precedence. *)
    sortSpecs : SortSpec.t list;
    (** The sort order per column. Later specifications are used when values are equal in the earlier specifications. *)
    range : GridRange.t;
    (** The range the filter covers. *)
    criteria : (string * FilterCriteria.t) list;
    (** The criteria for showing/hiding values per column. The map's key is the column index, and the value is the criteria for that column. This field is deprecated in favor of filter_specs. *)
    
  }
  
  val filterSpecs : (t, FilterSpec.t list) GapiLens.t
  val sortSpecs : (t, SortSpec.t list) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val criteria : (t, (string * FilterCriteria.t) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Sheet :
sig
  type t = {
    basicFilter : BasicFilter.t;
    (** The filter on this sheet, if any. *)
    filterViews : FilterView.t list;
    (** The filter views in this sheet. *)
    slicers : Slicer.t list;
    (** The slicers on this sheet. *)
    conditionalFormats : ConditionalFormatRule.t list;
    (** The conditional format rules in this sheet. *)
    merges : GridRange.t list;
    (** The ranges that are merged together. *)
    data : GridData.t list;
    (** Data in the grid, if this is a grid sheet. The number of GridData objects returned is dependent on the number of ranges requested on this sheet. For example, if this is representing `Sheet1`, and the spreadsheet was requested with ranges `Sheet1!A1:C10` and `Sheet1!D15:E20`, then the first GridData will have a startRow/startColumn of `0`, while the second one will have `startRow 14` (zero-based row 15), and `startColumn 3` (zero-based column D). For a DATA_SOURCE sheet, you can not request a specific range, the GridData contains all the values. *)
    developerMetadata : DeveloperMetadata.t list;
    (** The developer metadata associated with a sheet. *)
    charts : EmbeddedChart.t list;
    (** The specifications of every chart on this sheet. *)
    bandedRanges : BandedRange.t list;
    (** The banded (alternating colors) ranges on this sheet. *)
    protectedRanges : ProtectedRange.t list;
    (** The protected ranges in this sheet. *)
    columnGroups : DimensionGroup.t list;
    (** All column groups on this sheet, ordered by increasing range start index, then by group depth. *)
    rowGroups : DimensionGroup.t list;
    (** All row groups on this sheet, ordered by increasing range start index, then by group depth. *)
    properties : SheetProperties.t;
    (** The properties of the sheet. *)
    
  }
  
  val basicFilter : (t, BasicFilter.t) GapiLens.t
  val filterViews : (t, FilterView.t list) GapiLens.t
  val slicers : (t, Slicer.t list) GapiLens.t
  val conditionalFormats : (t, ConditionalFormatRule.t list) GapiLens.t
  val merges : (t, GridRange.t list) GapiLens.t
  val data : (t, GridData.t list) GapiLens.t
  val developerMetadata : (t, DeveloperMetadata.t list) GapiLens.t
  val charts : (t, EmbeddedChart.t list) GapiLens.t
  val bandedRanges : (t, BandedRange.t list) GapiLens.t
  val protectedRanges : (t, ProtectedRange.t list) GapiLens.t
  val columnGroups : (t, DimensionGroup.t list) GapiLens.t
  val rowGroups : (t, DimensionGroup.t list) GapiLens.t
  val properties : (t, SheetProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TimeOfDay :
sig
  type t = {
    nanos : int;
    (** Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. *)
    minutes : int;
    (** Minutes of hour of day. Must be from 0 to 59. *)
    hours : int;
    (** Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. *)
    seconds : int;
    (** Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. *)
    
  }
  
  val nanos : (t, int) GapiLens.t
  val minutes : (t, int) GapiLens.t
  val hours : (t, int) GapiLens.t
  val seconds : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceRefreshDailySchedule :
sig
  type t = {
    startTime : TimeOfDay.t;
    (** The start time of a time interval in which a data source refresh is scheduled. Only `hours` part is used. The time interval size defaults to that in the Sheets editor. *)
    
  }
  
  val startTime : (t, TimeOfDay.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Interval :
sig
  type t = {
    endTime : string;
    (** Optional. Exclusive end of the interval. If specified, a Timestamp matching this interval will have to be before the end. *)
    startTime : string;
    (** Optional. Inclusive start of the interval. If specified, a Timestamp matching this interval will have to be the same or after the start. *)
    
  }
  
  val endTime : (t, string) GapiLens.t
  val startTime : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceRefreshWeeklySchedule :
sig
  type t = {
    daysOfWeek : string list;
    (** Days of the week to refresh. At least one day must be specified. *)
    startTime : TimeOfDay.t;
    (** The start time of a time interval in which a data source refresh is scheduled. Only `hours` part is used. The time interval size defaults to that in the Sheets editor. *)
    
  }
  
  val daysOfWeek : (t, string list) GapiLens.t
  val startTime : (t, TimeOfDay.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceRefreshMonthlySchedule :
sig
  type t = {
    startTime : TimeOfDay.t;
    (** The start time of a time interval in which a data source refresh is scheduled. Only `hours` part is used. The time interval size defaults to that in the Sheets editor. *)
    daysOfMonth : int list;
    (** Days of the month to refresh. Only 1-28 are supported, mapping to the 1st to the 28th day. At lesat one day must be specified. *)
    
  }
  
  val startTime : (t, TimeOfDay.t) GapiLens.t
  val daysOfMonth : (t, int list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceRefreshSchedule :
sig
  type t = {
    nextRun : Interval.t;
    (** Output only. The time interval of the next run. *)
    weeklySchedule : DataSourceRefreshWeeklySchedule.t;
    (** Weekly refresh schedule. *)
    dailySchedule : DataSourceRefreshDailySchedule.t;
    (** Daily refresh schedule. *)
    monthlySchedule : DataSourceRefreshMonthlySchedule.t;
    (** Monthly refresh schedule. *)
    refreshScope : string;
    (** The scope of the refresh. Must be ALL_DATA_SOURCES. *)
    enabled : bool;
    (** True if the refresh schedule is enabled, or false otherwise. *)
    
  }
  
  val nextRun : (t, Interval.t) GapiLens.t
  val weeklySchedule : (t, DataSourceRefreshWeeklySchedule.t) GapiLens.t
  val dailySchedule : (t, DataSourceRefreshDailySchedule.t) GapiLens.t
  val monthlySchedule : (t, DataSourceRefreshMonthlySchedule.t) GapiLens.t
  val refreshScope : (t, string) GapiLens.t
  val enabled : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ThemeColorPair :
sig
  type t = {
    color : ColorStyle.t;
    (** The concrete color corresponding to the theme color type. *)
    colorType : string;
    (** The type of the spreadsheet theme color. *)
    
  }
  
  val color : (t, ColorStyle.t) GapiLens.t
  val colorType : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SpreadsheetTheme :
sig
  type t = {
    themeColors : ThemeColorPair.t list;
    (** The spreadsheet theme color pairs. To update you must provide all theme color pairs. *)
    primaryFontFamily : string;
    (** Name of the primary font family. *)
    
  }
  
  val themeColors : (t, ThemeColorPair.t list) GapiLens.t
  val primaryFontFamily : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module IterativeCalculationSettings :
sig
  type t = {
    convergenceThreshold : float;
    (** When iterative calculation is enabled and successive results differ by less than this threshold value, the calculation rounds stop. *)
    maxIterations : int;
    (** When iterative calculation is enabled, the maximum number of calculation rounds to perform. *)
    
  }
  
  val convergenceThreshold : (t, float) GapiLens.t
  val maxIterations : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SpreadsheetProperties :
sig
  type t = {
    locale : string;
    (** The locale of the spreadsheet in one of the following formats: * an ISO 639-1 language code such as `en` * an ISO 639-2 language code such as `fil`, if no 639-1 code exists * a combination of the ISO language code and country code, such as `en_US` Note: when updating this field, not all locales/languages are supported. *)
    spreadsheetTheme : SpreadsheetTheme.t;
    (** Theme applied to the spreadsheet. *)
    iterativeCalculationSettings : IterativeCalculationSettings.t;
    (** Determines whether and how circular references are resolved with iterative calculation. Absence of this field means that circular references result in calculation errors. *)
    title : string;
    (** The title of the spreadsheet. *)
    timeZone : string;
    (** The time zone of the spreadsheet, in CLDR format such as `America/New_York`. If the time zone isn't recognized, this may be a custom time zone such as `GMT-07:00`. *)
    autoRecalc : string;
    (** The amount of time to wait before volatile functions are recalculated. *)
    defaultFormat : CellFormat.t;
    (** The default format of all cells in the spreadsheet. CellData.effectiveFormat will not be set if the cell's format is equal to this default format. This field is read-only. *)
    
  }
  
  val locale : (t, string) GapiLens.t
  val spreadsheetTheme : (t, SpreadsheetTheme.t) GapiLens.t
  val iterativeCalculationSettings : (t, IterativeCalculationSettings.t) GapiLens.t
  val title : (t, string) GapiLens.t
  val timeZone : (t, string) GapiLens.t
  val autoRecalc : (t, string) GapiLens.t
  val defaultFormat : (t, CellFormat.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Spreadsheet :
sig
  type t = {
    properties : SpreadsheetProperties.t;
    (** Overall properties of a spreadsheet. *)
    spreadsheetUrl : string;
    (** The url of the spreadsheet. This field is read-only. *)
    developerMetadata : DeveloperMetadata.t list;
    (** The developer metadata associated with a spreadsheet. *)
    dataSources : DataSource.t list;
    (** A list of external data sources connected with the spreadsheet. *)
    dataSourceSchedules : DataSourceRefreshSchedule.t list;
    (** Output only. A list of data source refresh schedules. *)
    namedRanges : NamedRange.t list;
    (** The named ranges defined in a spreadsheet. *)
    sheets : Sheet.t list;
    (** The sheets that are part of a spreadsheet. *)
    spreadsheetId : string;
    (** The ID of the spreadsheet. This field is read-only. *)
    
  }
  
  val properties : (t, SpreadsheetProperties.t) GapiLens.t
  val spreadsheetUrl : (t, string) GapiLens.t
  val developerMetadata : (t, DeveloperMetadata.t list) GapiLens.t
  val dataSources : (t, DataSource.t list) GapiLens.t
  val dataSourceSchedules : (t, DataSourceRefreshSchedule.t list) GapiLens.t
  val namedRanges : (t, NamedRange.t list) GapiLens.t
  val sheets : (t, Sheet.t list) GapiLens.t
  val spreadsheetId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BatchUpdateSpreadsheetResponse :
sig
  type t = {
    replies : Response.t list;
    (** The reply of the updates. This maps 1:1 with the updates, although replies to some requests may be empty. *)
    spreadsheetId : string;
    (** The spreadsheet the updates were applied to. *)
    updatedSpreadsheet : Spreadsheet.t;
    (** The spreadsheet after updates were applied. This is only set if BatchUpdateSpreadsheetRequest.include_spreadsheet_in_response is `true`. *)
    
  }
  
  val replies : (t, Response.t list) GapiLens.t
  val spreadsheetId : (t, string) GapiLens.t
  val updatedSpreadsheet : (t, Spreadsheet.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceObjectReferences :
sig
  type t = {
    references : DataSourceObjectReference.t list;
    (** The references. *)
    
  }
  
  val references : (t, DataSourceObjectReference.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateCellsRequest :
sig
  type t = {
    fields : string;
    (** The fields of CellData that should be updated. At least one field must be specified. The root is the CellData; 'row.values.' should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    range : GridRange.t;
    (** The range to write data to. If the data in rows does not cover the entire requested range, the fields matching those set in fields will be cleared. *)
    rows : RowData.t list;
    (** The data to write. *)
    start : GridCoordinate.t;
    (** The coordinate to start writing data at. Any number of rows and columns (including a different number of columns per row) may be written. *)
    
  }
  
  val fields : (t, string) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val rows : (t, RowData.t list) GapiLens.t
  val start : (t, GridCoordinate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CopySheetToAnotherSpreadsheetRequest :
sig
  type t = {
    destinationSpreadsheetId : string;
    (** The ID of the spreadsheet to copy the sheet to. *)
    
  }
  
  val destinationSpreadsheetId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDeveloperMetadataRequest :
sig
  type t = {
    dataFilter : DataFilter.t;
    (** The data filter describing the criteria used to select which developer metadata entry to delete. *)
    
  }
  
  val dataFilter : (t, DataFilter.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MatchedValueRange :
sig
  type t = {
    dataFilters : DataFilter.t list;
    (** The DataFilters from the request that matched the range of values. *)
    valueRange : ValueRange.t;
    (** The values matched by the DataFilter. *)
    
  }
  
  val dataFilters : (t, DataFilter.t list) GapiLens.t
  val valueRange : (t, ValueRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TextToColumnsRequest :
sig
  type t = {
    delimiter : string;
    (** The delimiter to use. Used only if delimiterType is CUSTOM. *)
    delimiterType : string;
    (** The delimiter type to use. *)
    source : GridRange.t;
    (** The source data range. This must span exactly one column. *)
    
  }
  
  val delimiter : (t, string) GapiLens.t
  val delimiterType : (t, string) GapiLens.t
  val source : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ClearBasicFilterRequest :
sig
  type t = {
    sheetId : int;
    (** The sheet ID on which the basic filter should be cleared. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataFilterValueRange :
sig
  type t = {
    values : string list list;
    (** The data to be written. If the provided values exceed any of the ranges matched by the data filter then the request fails. If the provided values are less than the matched ranges only the specified values are written, existing values in the matched ranges remain unaffected. *)
    dataFilter : DataFilter.t;
    (** The data filter describing the location of the values in the spreadsheet. *)
    majorDimension : string;
    (** The major dimension of the values. *)
    
  }
  
  val values : (t, string list list) GapiLens.t
  val dataFilter : (t, DataFilter.t) GapiLens.t
  val majorDimension : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateChartSpecRequest :
sig
  type t = {
    spec : ChartSpec.t;
    (** The specification to apply to the chart. *)
    chartId : int;
    (** The ID of the chart to update. *)
    
  }
  
  val spec : (t, ChartSpec.t) GapiLens.t
  val chartId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteNamedRangeRequest :
sig
  type t = {
    namedRangeId : string;
    (** The ID of the named range to delete. *)
    
  }
  
  val namedRangeId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CopyPasteRequest :
sig
  type t = {
    pasteOrientation : string;
    (** How that data should be oriented when pasting. *)
    pasteType : string;
    (** What kind of data to paste. *)
    destination : GridRange.t;
    (** The location to paste to. If the range covers a span that's a multiple of the source's height or width, then the data will be repeated to fill in the destination range. If the range is smaller than the source range, the entire source data will still be copied (beyond the end of the destination range). *)
    source : GridRange.t;
    (** The source range to copy. *)
    
  }
  
  val pasteOrientation : (t, string) GapiLens.t
  val pasteType : (t, string) GapiLens.t
  val destination : (t, GridRange.t) GapiLens.t
  val source : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteRangeRequest :
sig
  type t = {
    shiftDimension : string;
    (** The dimension from which deleted cells will be replaced with. If ROWS, existing cells will be shifted upward to replace the deleted cells. If COLUMNS, existing cells will be shifted left to replace the deleted cells. *)
    range : GridRange.t;
    (** The range of cells to delete. *)
    
  }
  
  val shiftDimension : (t, string) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SourceAndDestination :
sig
  type t = {
    source : GridRange.t;
    (** The location of the data to use as the source of the autofill. *)
    dimension : string;
    (** The dimension that data should be filled into. *)
    fillLength : int;
    (** The number of rows or columns that data should be filled into. Positive numbers expand beyond the last row or last column of the source. Negative numbers expand before the first row or first column of the source. *)
    
  }
  
  val source : (t, GridRange.t) GapiLens.t
  val dimension : (t, string) GapiLens.t
  val fillLength : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AutoFillRequest :
sig
  type t = {
    useAlternateSeries : bool;
    (** True if we should generate data with the "alternate" series. This differs based on the type and amount of source data. *)
    range : GridRange.t;
    (** The range to autofill. This will examine the range and detect the location that has data and automatically fill that data in to the rest of the range. *)
    sourceAndDestination : SourceAndDestination.t;
    (** The source and destination areas to autofill. This explicitly lists the source of the autofill and where to extend that data. *)
    
  }
  
  val useAlternateSeries : (t, bool) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val sourceAndDestination : (t, SourceAndDestination.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MoveDimensionRequest :
sig
  type t = {
    source : DimensionRange.t;
    (** The source dimensions to move. *)
    destinationIndex : int;
    (** The zero-based start index of where to move the source data to, based on the coordinates *before* the source data is removed from the grid. Existing data will be shifted down or right (depending on the dimension) to make room for the moved dimensions. The source dimensions are removed from the grid, so the the data may end up in a different index than specified. For example, given `A1..A5` of `0, 1, 2, 3, 4` and wanting to move `"1"` and `"2"` to between `"3"` and `"4"`, the source would be `ROWS \[1..3)`,and the destination index would be `"4"` (the zero-based index of row 5). The end result would be `A1..A5` of `0, 3, 1, 2, 4`. *)
    
  }
  
  val source : (t, DimensionRange.t) GapiLens.t
  val destinationIndex : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BatchClearValuesResponse :
sig
  type t = {
    clearedRanges : string list;
    (** The ranges that were cleared, in A1 notation. If the requests are for an unbounded range or a ranger larger than the bounds of the sheet, this is the actual ranges that were cleared, bounded to the sheet's limits. *)
    spreadsheetId : string;
    (** The spreadsheet the updates were applied to. *)
    
  }
  
  val clearedRanges : (t, string list) GapiLens.t
  val spreadsheetId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BatchUpdateValuesRequest :
sig
  type t = {
    responseValueRenderOption : string;
    (** Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE. *)
    valueInputOption : string;
    (** How the input data should be interpreted. *)
    includeValuesInResponse : bool;
    (** Determines if the update response should include the values of the cells that were updated. By default, responses do not include the updated values. The `updatedData` field within each of the BatchUpdateValuesResponse.responses contains the updated values. If the range to write was larger than the range actually written, the response includes all values in the requested range (excluding trailing empty rows and columns). *)
    responseDateTimeRenderOption : string;
    (** Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER. *)
    data : ValueRange.t list;
    (** The new values to apply to the spreadsheet. *)
    
  }
  
  val responseValueRenderOption : (t, string) GapiLens.t
  val valueInputOption : (t, string) GapiLens.t
  val includeValuesInResponse : (t, bool) GapiLens.t
  val responseDateTimeRenderOption : (t, string) GapiLens.t
  val data : (t, ValueRange.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddDimensionGroupRequest :
sig
  type t = {
    range : DimensionRange.t;
    (** The range over which to create a group. *)
    
  }
  
  val range : (t, DimensionRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GetSpreadsheetByDataFilterRequest :
sig
  type t = {
    includeGridData : bool;
    (** True if grid data should be returned. This parameter is ignored if a field mask was set in the request. *)
    dataFilters : DataFilter.t list;
    (** The DataFilters used to select which ranges to retrieve from the spreadsheet. *)
    
  }
  
  val includeGridData : (t, bool) GapiLens.t
  val dataFilters : (t, DataFilter.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateSpreadsheetPropertiesRequest :
sig
  type t = {
    properties : SpreadsheetProperties.t;
    (** The properties to update. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root 'properties' is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    
  }
  
  val properties : (t, SpreadsheetProperties.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RandomizeRangeRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range to randomize. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateBordersRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range whose borders should be updated. *)
    right : Border.t;
    (** The border to put at the right of the range. *)
    innerHorizontal : Border.t;
    (** The horizontal border to put within the range. *)
    innerVertical : Border.t;
    (** The vertical border to put within the range. *)
    top : Border.t;
    (** The border to put at the top of the range. *)
    left : Border.t;
    (** The border to put at the left of the range. *)
    bottom : Border.t;
    (** The border to put at the bottom of the range. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  val right : (t, Border.t) GapiLens.t
  val innerHorizontal : (t, Border.t) GapiLens.t
  val innerVertical : (t, Border.t) GapiLens.t
  val top : (t, Border.t) GapiLens.t
  val left : (t, Border.t) GapiLens.t
  val bottom : (t, Border.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteEmbeddedObjectRequest :
sig
  type t = {
    objectId : int;
    (** The ID of the embedded object to delete. *)
    
  }
  
  val objectId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateConditionalFormatRuleRequest :
sig
  type t = {
    rule : ConditionalFormatRule.t;
    (** The rule that should replace the rule at the given index. *)
    newIndex : int;
    (** The zero-based new index the rule should end up at. *)
    sheetId : int;
    (** The sheet of the rule to move. Required if new_index is set, unused otherwise. *)
    index : int;
    (** The zero-based index of the rule that should be replaced or moved. *)
    
  }
  
  val rule : (t, ConditionalFormatRule.t) GapiLens.t
  val newIndex : (t, int) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  val index : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDimensionRequest :
sig
  type t = {
    range : DimensionRange.t;
    (** The dimensions to delete from the sheet. *)
    
  }
  
  val range : (t, DimensionRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddNamedRangeRequest :
sig
  type t = {
    namedRange : NamedRange.t;
    (** The named range to add. The namedRangeId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a range that already exists.) *)
    
  }
  
  val namedRange : (t, NamedRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module InsertDimensionRequest :
sig
  type t = {
    range : DimensionRange.t;
    (** The dimensions to insert. Both the start and end indexes must be bounded. *)
    inheritFromBefore : bool;
    (** Whether dimension properties should be extended from the dimensions before or after the newly inserted dimensions. True to inherit from the dimensions before (in which case the start index must be greater than 0), and false to inherit from the dimensions after. For example, if row index 0 has red background and row index 1 has a green background, then inserting 2 rows at index 1 can inherit either the green or red background. If `inheritFromBefore` is true, the two new rows will be red (because the row before the insertion point was red), whereas if `inheritFromBefore` is false, the two new rows will be green (because the row after the insertion point was green). *)
    
  }
  
  val range : (t, DimensionRange.t) GapiLens.t
  val inheritFromBefore : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDataSourceRequest :
sig
  type t = {
    dataSourceId : string;
    (** The ID of the data source to delete. *)
    
  }
  
  val dataSourceId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DataSourceSheetDimensionRange :
sig
  type t = {
    columnReferences : DataSourceColumnReference.t list;
    (** The columns on the data source sheet. *)
    sheetId : int;
    (** The ID of the data source sheet the range is on. *)
    
  }
  
  val columnReferences : (t, DataSourceColumnReference.t list) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AutoResizeDimensionsRequest :
sig
  type t = {
    dataSourceSheetDimensions : DataSourceSheetDimensionRange.t;
    (** The dimensions on a data source sheet to automatically resize. *)
    dimensions : DimensionRange.t;
    (** The dimensions to automatically resize. *)
    
  }
  
  val dataSourceSheetDimensions : (t, DataSourceSheetDimensionRange.t) GapiLens.t
  val dimensions : (t, DimensionRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateDataSourceRequest :
sig
  type t = {
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `dataSource` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    dataSource : DataSource.t;
    (** The data source to update. *)
    
  }
  
  val fields : (t, string) GapiLens.t
  val dataSource : (t, DataSource.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateDeveloperMetadataRequest :
sig
  type t = {
    dataFilters : DataFilter.t list;
    (** The filters matching the developer metadata entries to update. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `developerMetadata` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    developerMetadata : DeveloperMetadata.t;
    (** The value that all metadata matched by the data filters will be updated to. *)
    
  }
  
  val dataFilters : (t, DataFilter.t list) GapiLens.t
  val fields : (t, string) GapiLens.t
  val developerMetadata : (t, DeveloperMetadata.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RepeatCellRequest :
sig
  type t = {
    cell : CellData.t;
    (** The data to write. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `cell` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    range : GridRange.t;
    (** The range to repeat the cell in. *)
    
  }
  
  val cell : (t, CellData.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateNamedRangeRequest :
sig
  type t = {
    namedRange : NamedRange.t;
    (** The named range to update with the new properties. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `namedRange` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    
  }
  
  val namedRange : (t, NamedRange.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateDimensionGroupRequest :
sig
  type t = {
    dimensionGroup : DimensionGroup.t;
    (** The group whose state should be updated. The range and depth of the group should specify a valid group on the sheet, and all other fields updated. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `dimensionGroup` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    
  }
  
  val dimensionGroup : (t, DimensionGroup.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AppendDimensionRequest :
sig
  type t = {
    dimension : string;
    (** Whether rows or columns should be appended. *)
    length : int;
    (** The number of rows or columns to append. *)
    sheetId : int;
    (** The sheet to append rows or columns to. *)
    
  }
  
  val dimension : (t, string) GapiLens.t
  val length : (t, int) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateEmbeddedObjectBorderRequest :
sig
  type t = {
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `border` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    border : EmbeddedObjectBorder.t;
    (** The border that applies to the embedded object. *)
    objectId : int;
    (** The ID of the embedded object to update. *)
    
  }
  
  val fields : (t, string) GapiLens.t
  val border : (t, EmbeddedObjectBorder.t) GapiLens.t
  val objectId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateBandingRequest :
sig
  type t = {
    bandedRange : BandedRange.t;
    (** The banded range to update with the new properties. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `bandedRange` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    
  }
  
  val bandedRange : (t, BandedRange.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateEmbeddedObjectPositionRequest :
sig
  type t = {
    fields : string;
    (** The fields of OverlayPosition that should be updated when setting a new position. Used only if newPosition.overlayPosition is set, in which case at least one field must be specified. The root `newPosition.overlayPosition` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    newPosition : EmbeddedObjectPosition.t;
    (** An explicit position to move the embedded object to. If newPosition.sheetId is set, a new sheet with that ID will be created. If newPosition.newSheet is set to true, a new sheet will be created with an ID that will be chosen for you. *)
    objectId : int;
    (** The ID of the object to moved. *)
    
  }
  
  val fields : (t, string) GapiLens.t
  val newPosition : (t, EmbeddedObjectPosition.t) GapiLens.t
  val objectId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteFilterViewRequest :
sig
  type t = {
    filterId : int;
    (** The ID of the filter to delete. *)
    
  }
  
  val filterId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PasteDataRequest :
sig
  type t = {
    delimiter : string;
    (** The delimiter in the data. *)
    data : string;
    (** The data to insert. *)
    html : bool;
    (** True if the data is HTML. *)
    _type : string;
    (** How the data should be pasted. *)
    coordinate : GridCoordinate.t;
    (** The coordinate at which the data should start being inserted. *)
    
  }
  
  val delimiter : (t, string) GapiLens.t
  val data : (t, string) GapiLens.t
  val html : (t, bool) GapiLens.t
  val _type : (t, string) GapiLens.t
  val coordinate : (t, GridCoordinate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MergeCellsRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range of cells to merge. *)
    mergeType : string;
    (** How the cells should be merged. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  val mergeType : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddProtectedRangeRequest :
sig
  type t = {
    protectedRange : ProtectedRange.t;
    (** The protected range to be added. The protectedRangeId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a range that already exists.) *)
    
  }
  
  val protectedRange : (t, ProtectedRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CreateDeveloperMetadataRequest :
sig
  type t = {
    developerMetadata : DeveloperMetadata.t;
    (** The developer metadata to create. *)
    
  }
  
  val developerMetadata : (t, DeveloperMetadata.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddSlicerRequest :
sig
  type t = {
    slicer : Slicer.t;
    (** The slicer that should be added to the spreadsheet, including the position where it should be placed. The slicerId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a slicer that already exists.) *)
    
  }
  
  val slicer : (t, Slicer.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DuplicateSheetRequest :
sig
  type t = {
    sourceSheetId : int;
    (** The sheet to duplicate. If the source sheet is of DATA_SOURCE type, its backing DataSource is also duplicated and associated with the new copy of the sheet. No data execution is triggered, the grid data of this sheet is also copied over but only available after the batch request completes. *)
    newSheetName : string;
    (** The name of the new sheet. If empty, a new name is chosen for you. *)
    insertSheetIndex : int;
    (** The zero-based index where the new sheet should be inserted. The index of all sheets after this are incremented. *)
    newSheetId : int;
    (** If set, the ID of the new sheet. If not set, an ID is chosen. If set, the ID must not conflict with any existing sheet ID. If set, it must be non-negative. *)
    
  }
  
  val sourceSheetId : (t, int) GapiLens.t
  val newSheetName : (t, string) GapiLens.t
  val insertSheetIndex : (t, int) GapiLens.t
  val newSheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateFilterViewRequest :
sig
  type t = {
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `filter` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    filter : FilterView.t;
    (** The new properties of the filter view. *)
    
  }
  
  val fields : (t, string) GapiLens.t
  val filter : (t, FilterView.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TrimWhitespaceRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range whose cells to trim. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateDimensionPropertiesRequest :
sig
  type t = {
    dataSourceSheetRange : DataSourceSheetDimensionRange.t;
    (** The columns on a data source sheet to update. *)
    range : DimensionRange.t;
    (** The rows or columns to update. *)
    properties : DimensionProperties.t;
    (** Properties to update. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `properties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    
  }
  
  val dataSourceSheetRange : (t, DataSourceSheetDimensionRange.t) GapiLens.t
  val range : (t, DimensionRange.t) GapiLens.t
  val properties : (t, DimensionProperties.t) GapiLens.t
  val fields : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DuplicateFilterViewRequest :
sig
  type t = {
    filterId : int;
    (** The ID of the filter being duplicated. *)
    
  }
  
  val filterId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteConditionalFormatRuleRequest :
sig
  type t = {
    sheetId : int;
    (** The sheet the rule is being deleted from. *)
    index : int;
    (** The zero-based index of the rule to be deleted. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  val index : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SetBasicFilterRequest :
sig
  type t = {
    filter : BasicFilter.t;
    (** The filter to set. *)
    
  }
  
  val filter : (t, BasicFilter.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CutPasteRequest :
sig
  type t = {
    source : GridRange.t;
    (** The source data to cut. *)
    pasteType : string;
    (** What kind of data to paste. All the source data will be cut, regardless of what is pasted. *)
    destination : GridCoordinate.t;
    (** The top-left coordinate where the data should be pasted. *)
    
  }
  
  val source : (t, GridRange.t) GapiLens.t
  val pasteType : (t, string) GapiLens.t
  val destination : (t, GridCoordinate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDuplicatesRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range to remove duplicates rows from. *)
    comparisonColumns : DimensionRange.t list;
    (** The columns in the range to analyze for duplicate values. If no columns are selected then all columns are analyzed for duplicates. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  val comparisonColumns : (t, DimensionRange.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UnmergeCellsRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range within which all cells should be unmerged. If the range spans multiple merges, all will be unmerged. The range must not partially span any merge. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddDataSourceRequest :
sig
  type t = {
    dataSource : DataSource.t;
    (** The data source to add. *)
    
  }
  
  val dataSource : (t, DataSource.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SortRangeRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range to sort. *)
    sortSpecs : SortSpec.t list;
    (** The sort order per column. Later specifications are used when values are equal in the earlier specifications. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  val sortSpecs : (t, SortSpec.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddChartRequest :
sig
  type t = {
    chart : EmbeddedChart.t;
    (** The chart that should be added to the spreadsheet, including the position where it should be placed. The chartId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of an embedded object that already exists.) *)
    
  }
  
  val chart : (t, EmbeddedChart.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RefreshDataSourceRequest :
sig
  type t = {
    isAll : bool;
    (** Refreshes all existing data source objects in the spreadsheet. *)
    dataSourceId : string;
    (** Reference to a DataSource. If specified, refreshes all associated data source objects for the data source. *)
    references : DataSourceObjectReferences.t;
    (** References to data source objects to refresh. *)
    force : bool;
    (** Refreshes the data source objects regardless of the current state. If not set and a referenced data source object was in error state, the refresh will fail immediately. *)
    
  }
  
  val isAll : (t, bool) GapiLens.t
  val dataSourceId : (t, string) GapiLens.t
  val references : (t, DataSourceObjectReferences.t) GapiLens.t
  val force : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteSheetRequest :
sig
  type t = {
    sheetId : int;
    (** The ID of the sheet to delete. If the sheet is of DATA_SOURCE type, the associated DataSource is also deleted. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateSheetPropertiesRequest :
sig
  type t = {
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `properties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    properties : SheetProperties.t;
    (** The properties to update. *)
    
  }
  
  val fields : (t, string) GapiLens.t
  val properties : (t, SheetProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module InsertRangeRequest :
sig
  type t = {
    shiftDimension : string;
    (** The dimension which will be shifted when inserting cells. If ROWS, existing cells will be shifted down. If COLUMNS, existing cells will be shifted right. *)
    range : GridRange.t;
    (** The range to insert new cells into. *)
    
  }
  
  val shiftDimension : (t, string) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FindReplaceRequest :
sig
  type t = {
    replacement : string;
    (** The value to use as the replacement. *)
    matchCase : bool;
    (** True if the search is case sensitive. *)
    find : string;
    (** The value to search. *)
    matchEntireCell : bool;
    (** True if the find value should match the entire cell. *)
    searchByRegex : bool;
    (** True if the find value is a regex. The regular expression and replacement should follow Java regex rules at https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html. The replacement string is allowed to refer to capturing groups. For example, if one cell has the contents `"Google Sheets"` and another has `"Google Docs"`, then searching for `"o.* (.*)"` with a replacement of `"$1 Rocks"` would change the contents of the cells to `"GSheets Rocks"` and `"GDocs Rocks"` respectively. *)
    allSheets : bool;
    (** True to find/replace over all sheets. *)
    range : GridRange.t;
    (** The range to find/replace over. *)
    includeFormulas : bool;
    (** True if the search should include cells with formulas. False to skip cells with formulas. *)
    sheetId : int;
    (** The sheet to find/replace over. *)
    
  }
  
  val replacement : (t, string) GapiLens.t
  val matchCase : (t, bool) GapiLens.t
  val find : (t, string) GapiLens.t
  val matchEntireCell : (t, bool) GapiLens.t
  val searchByRegex : (t, bool) GapiLens.t
  val allSheets : (t, bool) GapiLens.t
  val range : (t, GridRange.t) GapiLens.t
  val includeFormulas : (t, bool) GapiLens.t
  val sheetId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AppendCellsRequest :
sig
  type t = {
    sheetId : int;
    (** The sheet ID to append the data to. *)
    fields : string;
    (** The fields of CellData that should be updated. At least one field must be specified. The root is the CellData; 'row.values.' should not be specified. A single `"*"` can be used as short-hand for listing every field. *)
    rows : RowData.t list;
    (** The data to append. *)
    
  }
  
  val sheetId : (t, int) GapiLens.t
  val fields : (t, string) GapiLens.t
  val rows : (t, RowData.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddConditionalFormatRuleRequest :
sig
  type t = {
    rule : ConditionalFormatRule.t;
    (** The rule to add. *)
    index : int;
    (** The zero-based index where the rule should be inserted. *)
    
  }
  
  val rule : (t, ConditionalFormatRule.t) GapiLens.t
  val index : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddBandingRequest :
sig
  type t = {
    bandedRange : BandedRange.t;
    (** The banded range to add. The bandedRangeId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a range that already exists.) *)
    
  }
  
  val bandedRange : (t, BandedRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SetDataValidationRequest :
sig
  type t = {
    range : GridRange.t;
    (** The range the data validation rule should apply to. *)
    rule : DataValidationRule.t;
    (** The data validation rule to set on each cell in the range, or empty to clear the data validation in the range. *)
    
  }
  
  val range : (t, GridRange.t) GapiLens.t
  val rule : (t, DataValidationRule.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteProtectedRangeRequest :
sig
  type t = {
    protectedRangeId : int;
    (** The ID of the protected range to delete. *)
    
  }
  
  val protectedRangeId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteDimensionGroupRequest :
sig
  type t = {
    range : DimensionRange.t;
    (** The range of the group to be deleted. *)
    
  }
  
  val range : (t, DimensionRange.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateSlicerSpecRequest :
sig
  type t = {
    slicerId : int;
    (** The id of the slicer to update. *)
    fields : string;
    (** The fields that should be updated. At least one field must be specified. The root `SlicerSpec` is implied and should not be specified. A single "*"` can be used as short-hand for listing every field. *)
    spec : SlicerSpec.t;
    (** The specification to apply to the slicer. *)
    
  }
  
  val slicerId : (t, int) GapiLens.t
  val fields : (t, string) GapiLens.t
  val spec : (t, SlicerSpec.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DeleteBandingRequest :
sig
  type t = {
    bandedRangeId : int;
    (** The ID of the banded range to delete. *)
    
  }
  
  val bandedRangeId : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddSheetRequest :
sig
  type t = {
    properties : SheetProperties.t;
    (** The properties the new sheet should have. All properties are optional. The sheetId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a sheet that already exists.) *)
    
  }
  
  val properties : (t, SheetProperties.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AddFilterViewRequest :
sig
  type t = {
    filter : FilterView.t;
    (** The filter to add. The filterViewId field is optional; if one is not set, an id will be randomly generated. (It is an error to specify the ID of a filter that already exists.) *)
    
  }
  
  val filter : (t, FilterView.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Request :
sig
  type t = {
    addDimensionGroup : AddDimensionGroupRequest.t;
    (** Creates a group over the specified range. *)
    deleteConditionalFormatRule : DeleteConditionalFormatRuleRequest.t;
    (** Deletes an existing conditional format rule. *)
    setBasicFilter : SetBasicFilterRequest.t;
    (** Sets the basic filter on a sheet. *)
    duplicateFilterView : DuplicateFilterViewRequest.t;
    (** Duplicates a filter view. *)
    clearBasicFilter : ClearBasicFilterRequest.t;
    (** Clears the basic filter on a sheet. *)
    updateDimensionProperties : UpdateDimensionPropertiesRequest.t;
    (** Updates dimensions' properties. *)
    cutPaste : CutPasteRequest.t;
    (** Cuts data from one area and pastes it to another. *)
    deleteNamedRange : DeleteNamedRangeRequest.t;
    (** Deletes a named range. *)
    updateChartSpec : UpdateChartSpecRequest.t;
    (** Updates a chart's specifications. *)
    trimWhitespace : TrimWhitespaceRequest.t;
    (** Trims cells of whitespace (such as spaces, tabs, or new lines). *)
    updateBorders : UpdateBordersRequest.t;
    (** Updates the borders in a range of cells. *)
    autoFill : AutoFillRequest.t;
    (** Automatically fills in more data based on existing data. *)
    deleteDuplicates : DeleteDuplicatesRequest.t;
    (** Removes rows containing duplicate values in specified columns of a cell range. *)
    updateFilterView : UpdateFilterViewRequest.t;
    (** Updates the properties of a filter view. *)
    unmergeCells : UnmergeCellsRequest.t;
    (** Unmerges merged cells. *)
    duplicateSheet : DuplicateSheetRequest.t;
    (** Duplicates a sheet. *)
    addDataSource : AddDataSourceRequest.t;
    (** Adds a data source. *)
    addSlicer : AddSlicerRequest.t;
    (** Adds a slicer. *)
    moveDimension : MoveDimensionRequest.t;
    (** Moves rows or columns to another location in a sheet. *)
    createDeveloperMetadata : CreateDeveloperMetadataRequest.t;
    (** Creates new developer metadata *)
    updateSpreadsheetProperties : UpdateSpreadsheetPropertiesRequest.t;
    (** Updates the spreadsheet's properties. *)
    addProtectedRange : AddProtectedRangeRequest.t;
    (** Adds a protected range. *)
    sortRange : SortRangeRequest.t;
    (** Sorts data in a range. *)
    mergeCells : MergeCellsRequest.t;
    (** Merges cells together. *)
    addChart : AddChartRequest.t;
    (** Adds a chart. *)
    pasteData : PasteDataRequest.t;
    (** Pastes data (HTML or delimited) into a sheet. *)
    refreshDataSource : RefreshDataSourceRequest.t;
    (** Refreshs one or multiple data sources and associated dbobjects. *)
    addNamedRange : AddNamedRangeRequest.t;
    (** Adds a named range. *)
    deleteSheet : DeleteSheetRequest.t;
    (** Deletes a sheet. *)
    insertDimension : InsertDimensionRequest.t;
    (** Inserts new rows or columns in a sheet. *)
    updateSheetProperties : UpdateSheetPropertiesRequest.t;
    (** Updates a sheet's properties. *)
    deleteFilterView : DeleteFilterViewRequest.t;
    (** Deletes a filter view from a sheet. *)
    insertRange : InsertRangeRequest.t;
    (** Inserts new cells in a sheet, shifting the existing cells. *)
    updateEmbeddedObjectPosition : UpdateEmbeddedObjectPositionRequest.t;
    (** Updates an embedded object's (e.g. chart, image) position. *)
    findReplace : FindReplaceRequest.t;
    (** Finds and replaces occurrences of some text with other text. *)
    updateBanding : UpdateBandingRequest.t;
    (** Updates a banded range *)
    appendCells : AppendCellsRequest.t;
    (** Appends cells after the last row with data in a sheet. *)
    updateCells : UpdateCellsRequest.t;
    (** Updates many cells at once. *)
    deleteRange : DeleteRangeRequest.t;
    (** Deletes a range of cells from a sheet, shifting the remaining cells. *)
    updateEmbeddedObjectBorder : UpdateEmbeddedObjectBorderRequest.t;
    (** Updates an embedded object's border. *)
    addConditionalFormatRule : AddConditionalFormatRuleRequest.t;
    (** Adds a new conditional format rule. *)
    appendDimension : AppendDimensionRequest.t;
    (** Appends dimensions to the end of a sheet. *)
    textToColumns : TextToColumnsRequest.t;
    (** Converts a column of text into many columns of text. *)
    updateConditionalFormatRule : UpdateConditionalFormatRuleRequest.t;
    (** Updates an existing conditional format rule. *)
    addBanding : AddBandingRequest.t;
    (** Adds a new banded range *)
    updateDimensionGroup : UpdateDimensionGroupRequest.t;
    (** Updates the state of the specified group. *)
    deleteDeveloperMetadata : DeleteDeveloperMetadataRequest.t;
    (** Deletes developer metadata *)
    updateProtectedRange : UpdateProtectedRangeRequest.t;
    (** Updates a protected range. *)
    setDataValidation : SetDataValidationRequest.t;
    (** Sets data validation for one or more cells. *)
    copyPaste : CopyPasteRequest.t;
    (** Copies data from one area and pastes it to another. *)
    deleteProtectedRange : DeleteProtectedRangeRequest.t;
    (** Deletes a protected range. *)
    updateNamedRange : UpdateNamedRangeRequest.t;
    (** Updates a named range. *)
    deleteDimensionGroup : DeleteDimensionGroupRequest.t;
    (** Deletes a group over the specified range. *)
    repeatCell : RepeatCellRequest.t;
    (** Repeats a single cell across a range. *)
    updateSlicerSpec : UpdateSlicerSpecRequest.t;
    (** Updates a slicer's specifications. *)
    updateDeveloperMetadata : UpdateDeveloperMetadataRequest.t;
    (** Updates an existing developer metadata entry *)
    deleteBanding : DeleteBandingRequest.t;
    (** Removes a banded range *)
    updateDataSource : UpdateDataSourceRequest.t;
    (** Updates a data source. *)
    randomizeRange : RandomizeRangeRequest.t;
    (** Randomizes the order of the rows in a range. *)
    deleteDimension : DeleteDimensionRequest.t;
    (** Deletes rows or columns in a sheet. *)
    deleteEmbeddedObject : DeleteEmbeddedObjectRequest.t;
    (** Deletes an embedded object (e.g, chart, image) in a sheet. *)
    autoResizeDimensions : AutoResizeDimensionsRequest.t;
    (** Automatically resizes one or more dimensions based on the contents of the cells in that dimension. *)
    addSheet : AddSheetRequest.t;
    (** Adds a sheet. *)
    deleteDataSource : DeleteDataSourceRequest.t;
    (** Deletes a data source. *)
    addFilterView : AddFilterViewRequest.t;
    (** Adds a filter view. *)
    
  }
  
  val addDimensionGroup : (t, AddDimensionGroupRequest.t) GapiLens.t
  val deleteConditionalFormatRule : (t, DeleteConditionalFormatRuleRequest.t) GapiLens.t
  val setBasicFilter : (t, SetBasicFilterRequest.t) GapiLens.t
  val duplicateFilterView : (t, DuplicateFilterViewRequest.t) GapiLens.t
  val clearBasicFilter : (t, ClearBasicFilterRequest.t) GapiLens.t
  val updateDimensionProperties : (t, UpdateDimensionPropertiesRequest.t) GapiLens.t
  val cutPaste : (t, CutPasteRequest.t) GapiLens.t
  val deleteNamedRange : (t, DeleteNamedRangeRequest.t) GapiLens.t
  val updateChartSpec : (t, UpdateChartSpecRequest.t) GapiLens.t
  val trimWhitespace : (t, TrimWhitespaceRequest.t) GapiLens.t
  val updateBorders : (t, UpdateBordersRequest.t) GapiLens.t
  val autoFill : (t, AutoFillRequest.t) GapiLens.t
  val deleteDuplicates : (t, DeleteDuplicatesRequest.t) GapiLens.t
  val updateFilterView : (t, UpdateFilterViewRequest.t) GapiLens.t
  val unmergeCells : (t, UnmergeCellsRequest.t) GapiLens.t
  val duplicateSheet : (t, DuplicateSheetRequest.t) GapiLens.t
  val addDataSource : (t, AddDataSourceRequest.t) GapiLens.t
  val addSlicer : (t, AddSlicerRequest.t) GapiLens.t
  val moveDimension : (t, MoveDimensionRequest.t) GapiLens.t
  val createDeveloperMetadata : (t, CreateDeveloperMetadataRequest.t) GapiLens.t
  val updateSpreadsheetProperties : (t, UpdateSpreadsheetPropertiesRequest.t) GapiLens.t
  val addProtectedRange : (t, AddProtectedRangeRequest.t) GapiLens.t
  val sortRange : (t, SortRangeRequest.t) GapiLens.t
  val mergeCells : (t, MergeCellsRequest.t) GapiLens.t
  val addChart : (t, AddChartRequest.t) GapiLens.t
  val pasteData : (t, PasteDataRequest.t) GapiLens.t
  val refreshDataSource : (t, RefreshDataSourceRequest.t) GapiLens.t
  val addNamedRange : (t, AddNamedRangeRequest.t) GapiLens.t
  val deleteSheet : (t, DeleteSheetRequest.t) GapiLens.t
  val insertDimension : (t, InsertDimensionRequest.t) GapiLens.t
  val updateSheetProperties : (t, UpdateSheetPropertiesRequest.t) GapiLens.t
  val deleteFilterView : (t, DeleteFilterViewRequest.t) GapiLens.t
  val insertRange : (t, InsertRangeRequest.t) GapiLens.t
  val updateEmbeddedObjectPosition : (t, UpdateEmbeddedObjectPositionRequest.t) GapiLens.t
  val findReplace : (t, FindReplaceRequest.t) GapiLens.t
  val updateBanding : (t, UpdateBandingRequest.t) GapiLens.t
  val appendCells : (t, AppendCellsRequest.t) GapiLens.t
  val updateCells : (t, UpdateCellsRequest.t) GapiLens.t
  val deleteRange : (t, DeleteRangeRequest.t) GapiLens.t
  val updateEmbeddedObjectBorder : (t, UpdateEmbeddedObjectBorderRequest.t) GapiLens.t
  val addConditionalFormatRule : (t, AddConditionalFormatRuleRequest.t) GapiLens.t
  val appendDimension : (t, AppendDimensionRequest.t) GapiLens.t
  val textToColumns : (t, TextToColumnsRequest.t) GapiLens.t
  val updateConditionalFormatRule : (t, UpdateConditionalFormatRuleRequest.t) GapiLens.t
  val addBanding : (t, AddBandingRequest.t) GapiLens.t
  val updateDimensionGroup : (t, UpdateDimensionGroupRequest.t) GapiLens.t
  val deleteDeveloperMetadata : (t, DeleteDeveloperMetadataRequest.t) GapiLens.t
  val updateProtectedRange : (t, UpdateProtectedRangeRequest.t) GapiLens.t
  val setDataValidation : (t, SetDataValidationRequest.t) GapiLens.t
  val copyPaste : (t, CopyPasteRequest.t) GapiLens.t
  val deleteProtectedRange : (t, DeleteProtectedRangeRequest.t) GapiLens.t
  val updateNamedRange : (t, UpdateNamedRangeRequest.t) GapiLens.t
  val deleteDimensionGroup : (t, DeleteDimensionGroupRequest.t) GapiLens.t
  val repeatCell : (t, RepeatCellRequest.t) GapiLens.t
  val updateSlicerSpec : (t, UpdateSlicerSpecRequest.t) GapiLens.t
  val updateDeveloperMetadata : (t, UpdateDeveloperMetadataRequest.t) GapiLens.t
  val deleteBanding : (t, DeleteBandingRequest.t) GapiLens.t
  val updateDataSource : (t, UpdateDataSourceRequest.t) GapiLens.t
  val randomizeRange : (t, RandomizeRangeRequest.t) GapiLens.t
  val deleteDimension : (t, DeleteDimensionRequest.t) GapiLens.t
  val deleteEmbeddedObject : (t, DeleteEmbeddedObjectRequest.t) GapiLens.t
  val autoResizeDimensions : (t, AutoResizeDimensionsRequest.t) GapiLens.t
  val addSheet : (t, AddSheetRequest.t) GapiLens.t
  val deleteDataSource : (t, DeleteDataSourceRequest.t) GapiLens.t
  val addFilterView : (t, AddFilterViewRequest.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module BatchUpdateSpreadsheetRequest :
sig
  type t = {
    includeSpreadsheetInResponse : bool;
    (** Determines if the update response should include the spreadsheet resource. *)
    requests : Request.t list;
    (** A list of updates to apply to the spreadsheet. Requests will be applied in the order they are specified. If any request is not valid, no requests will be applied. *)
    responseIncludeGridData : bool;
    (** True if grid data should be returned. Meaningful only if include_spreadsheet_in_response is 'true'. This parameter is ignored if a field mask was set in the request. *)
    responseRanges : string list;
    (** Limits the ranges included in the response spreadsheet. Meaningful only if include_spreadsheet_in_response is 'true'. *)
    
  }
  
  val includeSpreadsheetInResponse : (t, bool) GapiLens.t
  val requests : (t, Request.t list) GapiLens.t
  val responseIncludeGridData : (t, bool) GapiLens.t
  val responseRanges : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MatchedDeveloperMetadata :
sig
  type t = {
    dataFilters : DataFilter.t list;
    (** All filters matching the returned developer metadata. *)
    developerMetadata : DeveloperMetadata.t;
    (** The developer metadata matching the specified filters. *)
    
  }
  
  val dataFilters : (t, DataFilter.t list) GapiLens.t
  val developerMetadata : (t, DeveloperMetadata.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module UpdateValuesResponse :
sig
  type t = {
    updatedRows : int;
    (** The number of rows where at least one cell in the row was updated. *)
    updatedColumns : int;
    (** The number of columns where at least one cell in the column was updated. *)
    updatedRange : string;
    (** The range (in A1 notation) that updates were applied to. *)
    updatedData : ValueRange.t;
    (** The values of the cells after updates were applied. This is only included if the request's `includeValuesInResponse` field was `true`. *)
    spreadsheetId : string;
    (** The spreadsheet the updates were applied to. *)
    updatedCells : int;
    (** The number of cells updated. *)
    
  }
  
  val updatedRows : (t, int) GapiLens.t
  val updatedColumns : (t, int) GapiLens.t
  val updatedRange : (t, string) GapiLens.t
  val updatedData : (t, ValueRange.t) GapiLens.t
  val spreadsheetId : (t, string) GapiLens.t
  val updatedCells : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ClearValuesRequest :
sig
  type t = unit
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchClearValuesByDataFilterResponse :
  sig
    type t = {
      spreadsheetId : string;
      (** The spreadsheet the updates were applied to. *)
      clearedRanges : string list;
      (** The ranges that were cleared, in A1 notation. If the requests are for an unbounded range or a ranger larger than the bounds of the sheet, this is the actual ranges that were cleared, bounded to the sheet's limits. *)
      
    }
    
    val spreadsheetId : (t, string) GapiLens.t
    val clearedRanges : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchGetValuesByDataFilterRequest :
  sig
    type t = {
      valueRenderOption : string;
      (** How values should be represented in the output. The default render option is FORMATTED_VALUE. *)
      dataFilters : DataFilter.t list;
      (** The data filters used to match the ranges of values to retrieve. Ranges that match any of the specified data filters are included in the response. *)
      dateTimeRenderOption : string;
      (** How dates, times, and durations should be represented in the output. This is ignored if value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER. *)
      majorDimension : string;
      (** The major dimension that results should use. For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then a request that selects that range and sets `majorDimension=ROWS` returns `\[\[1,2\],\[3,4\]\]`, whereas a request that sets `majorDimension=COLUMNS` returns `\[\[1,3\],\[2,4\]\]`. *)
      
    }
    
    val valueRenderOption : (t, string) GapiLens.t
    val dataFilters : (t, DataFilter.t list) GapiLens.t
    val dateTimeRenderOption : (t, string) GapiLens.t
    val majorDimension : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module ClearValuesResponse :
  sig
    type t = {
      clearedRange : string;
      (** The range (in A1 notation) that was cleared. (If the request was for an unbounded range or a ranger larger than the bounds of the sheet, this will be the actual range that was cleared, bounded to the sheet's limits.) *)
      spreadsheetId : string;
      (** The spreadsheet the updates were applied to. *)
      
    }
    
    val clearedRange : (t, string) GapiLens.t
    val spreadsheetId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchGetValuesByDataFilterResponse :
  sig
    type t = {
      spreadsheetId : string;
      (** The ID of the spreadsheet the data was retrieved from. *)
      valueRanges : MatchedValueRange.t list;
      (** The requested values with the list of data filters that matched them. *)
      
    }
    
    val spreadsheetId : (t, string) GapiLens.t
    val valueRanges : (t, MatchedValueRange.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module SearchDeveloperMetadataRequest :
  sig
    type t = {
      dataFilters : DataFilter.t list;
      (** The data filters describing the criteria used to determine which DeveloperMetadata entries to return. DeveloperMetadata matching any of the specified filters are included in the response. *)
      
    }
    
    val dataFilters : (t, DataFilter.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchClearValuesRequest :
  sig
    type t = {
      ranges : string list;
      (** The ranges to clear, in A1 or R1C1 notation. *)
      
    }
    
    val ranges : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module AppendValuesResponse :
  sig
    type t = {
      updates : UpdateValuesResponse.t;
      (** Information about the updates that were applied. *)
      spreadsheetId : string;
      (** The spreadsheet the updates were applied to. *)
      tableRange : string;
      (** The range (in A1 notation) of the table that values are being appended to (before the values were appended). Empty if no table was found. *)
      
    }
    
    val updates : (t, UpdateValuesResponse.t) GapiLens.t
    val spreadsheetId : (t, string) GapiLens.t
    val tableRange : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchUpdateValuesResponse :
  sig
    type t = {
      totalUpdatedCells : int;
      (** The total number of cells updated. *)
      responses : UpdateValuesResponse.t list;
      (** One UpdateValuesResponse per requested range, in the same order as the requests appeared. *)
      spreadsheetId : string;
      (** The spreadsheet the updates were applied to. *)
      totalUpdatedColumns : int;
      (** The total number of columns where at least one cell in the column was updated. *)
      totalUpdatedSheets : int;
      (** The total number of sheets where at least one cell in the sheet was updated. *)
      totalUpdatedRows : int;
      (** The total number of rows where at least one cell in the row was updated. *)
      
    }
    
    val totalUpdatedCells : (t, int) GapiLens.t
    val responses : (t, UpdateValuesResponse.t list) GapiLens.t
    val spreadsheetId : (t, string) GapiLens.t
    val totalUpdatedColumns : (t, int) GapiLens.t
    val totalUpdatedSheets : (t, int) GapiLens.t
    val totalUpdatedRows : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchClearValuesByDataFilterRequest :
  sig
    type t = {
      dataFilters : DataFilter.t list;
      (** The DataFilters used to determine which ranges to clear. *)
      
    }
    
    val dataFilters : (t, DataFilter.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchUpdateValuesByDataFilterRequest :
  sig
    type t = {
      responseDateTimeRenderOption : string;
      (** Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER. *)
      responseValueRenderOption : string;
      (** Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE. *)
      valueInputOption : string;
      (** How the input data should be interpreted. *)
      includeValuesInResponse : bool;
      (** Determines if the update response should include the values of the cells that were updated. By default, responses do not include the updated values. The `updatedData` field within each of the BatchUpdateValuesResponse.responses contains the updated values. If the range to write was larger than the range actually written, the response includes all values in the requested range (excluding trailing empty rows and columns). *)
      data : DataFilterValueRange.t list;
      (** The new values to apply to the spreadsheet. If more than one range is matched by the specified DataFilter the specified values are applied to all of those ranges. *)
      
    }
    
    val responseDateTimeRenderOption : (t, string) GapiLens.t
    val responseValueRenderOption : (t, string) GapiLens.t
    val valueInputOption : (t, string) GapiLens.t
    val includeValuesInResponse : (t, bool) GapiLens.t
    val data : (t, DataFilterValueRange.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module BatchGetValuesResponse :
  sig
    type t = {
      valueRanges : ValueRange.t list;
      (** The requested values. The order of the ValueRanges is the same as the order of the requested ranges. *)
      spreadsheetId : string;
      (** The ID of the spreadsheet the data was retrieved from. *)
      
    }
    
    val valueRanges : (t, ValueRange.t list) GapiLens.t
    val spreadsheetId : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  module SearchDeveloperMetadataResponse :
  sig
    type t = {
      matchedDeveloperMetadata : MatchedDeveloperMetadata.t list;
      (** The metadata matching the criteria of the search request. *)
      
    }
    
    val matchedDeveloperMetadata : (t, MatchedDeveloperMetadata.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
    val to_data_model : t -> GapiJson.json_data_model
    
    val of_data_model : GapiJson.json_data_model -> t
    
  end
  
  