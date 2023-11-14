(* Warning! This file is generated. Modify at your own risk.
        *)

(** Service definition for Google Sheets API (v4).
  
  Reads and writes Google Sheets..
  
  For more information about this service, see the
  {{:https://developers.google.com/sheets/}API Documentation}.
  *)

module Scope :
sig
  val drive_readonly : string
  (** See and download all your Google Drive files *)
  
  val drive : string
  (** See, edit, create, and delete all of your Google Drive files *)
  
  val spreadsheets : string
  (** See, edit, create, and delete all your Google Sheets spreadsheets *)
  
  val drive_file : string
  (** See, edit, create, and delete only the specific Google Drive files you use with this app *)
  
  val spreadsheets_readonly : string
  (** See all your Google Sheets spreadsheets *)
  
  
end
(** Service Auth Scopes *)

module SpreadsheetsResource :
sig
  module Values :
  sig
    
    module ValueRenderOption :
    sig
      type t =
        | Default
        | FORMATTED_VALUE (** Values will be calculated & formatted in the reply according to the cell's formatting. Formatting is based on the spreadsheet's locale, not the requesting user's locale. For example, if `A1` is `1.23` and `A2` is `=A1` and formatted as currency, then `A2` would return `"$1.23"`. *)
        | UNFORMATTED_VALUE (** Values will be calculated, but not formatted in the reply. For example, if `A1` is `1.23` and `A2` is `=A1` and formatted as currency, then `A2` would return the number `1.23`. *)
        | FORMULA (** Values will not be calculated. The reply will include the formulas. For example, if `A1` is `1.23` and `A2` is `=A1` and formatted as currency, then A2 would return `"=A1"`. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module ValueInputOption :
    sig
      type t =
        | Default
        | INPUT_VALUE_OPTION_UNSPECIFIED (** Default input value. This value must not be used. *)
        | RAW (** The values the user has entered will not be parsed and will be stored as-is. *)
        | USER_ENTERED (** The values will be parsed as if the user typed them into the UI. Numbers will stay as numbers, but strings may be converted to numbers, dates, etc. following the same rules that are applied when entering text into a cell via the Google Sheets UI. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module ResponseValueRenderOption :
    sig
      type t =
        | Default
        | FORMATTED_VALUE (** Values will be calculated & formatted in the reply according to the cell's formatting. Formatting is based on the spreadsheet's locale, not the requesting user's locale. For example, if `A1` is `1.23` and `A2` is `=A1` and formatted as currency, then `A2` would return `"$1.23"`. *)
        | UNFORMATTED_VALUE (** Values will be calculated, but not formatted in the reply. For example, if `A1` is `1.23` and `A2` is `=A1` and formatted as currency, then `A2` would return the number `1.23`. *)
        | FORMULA (** Values will not be calculated. The reply will include the formulas. For example, if `A1` is `1.23` and `A2` is `=A1` and formatted as currency, then A2 would return `"=A1"`. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module ResponseDateTimeRenderOption :
    sig
      type t =
        | Default
        | SERIAL_NUMBER (** Instructs date, time, datetime, and duration fields to be output as doubles in "serial number" format, as popularized by Lotus 1-2-3. The whole number portion of the value (left of the decimal) counts the days since December 30th 1899. The fractional portion (right of the decimal) counts the time as a fraction of the day. For example, January 1st 1900 at noon would be 2.5, 2 because it's 2 days after December 30st 1899, and .5 because noon is half a day. February 1st 1900 at 3pm would be 33.625. This correctly treats the year 1900 as not a leap year. *)
        | FORMATTED_STRING (** Instructs date, time, datetime, and duration fields to be output as strings in their given number format (which is dependent on the spreadsheet locale). *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module MajorDimension :
    sig
      type t =
        | Default
        | DIMENSION_UNSPECIFIED (** The default value, do not use. *)
        | ROWS (** Operates on the rows of a sheet. *)
        | COLUMNS (** Operates on the columns of a sheet. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module InsertDataOption :
    sig
      type t =
        | Default
        | OVERWRITE (** The new data overwrites existing data in the areas it is written. (Note: adding data to the end of the sheet will still insert new rows or columns so the data can be written.) *)
        | INSERT_ROWS (** Rows are inserted for the new data. *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module DateTimeRenderOption :
    sig
      type t =
        | Default
        | SERIAL_NUMBER (** Instructs date, time, datetime, and duration fields to be output as doubles in "serial number" format, as popularized by Lotus 1-2-3. The whole number portion of the value (left of the decimal) counts the days since December 30th 1899. The fractional portion (right of the decimal) counts the time as a fraction of the day. For example, January 1st 1900 at noon would be 2.5, 2 because it's 2 days after December 30st 1899, and .5 because noon is half a day. February 1st 1900 at 3pm would be 33.625. This correctly treats the year 1900 as not a leap year. *)
        | FORMATTED_STRING (** Instructs date, time, datetime, and duration fields to be output as strings in their given number format (which is dependent on the spreadsheet locale). *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Returns a range of values from a spreadsheet. The caller must specify the spreadsheet ID and a range.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param dateTimeRenderOption How dates, times, and durations should be represented in the output. This is ignored if value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
      @param majorDimension The major dimension that results should use. For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then requesting `range=A1:B2,majorDimension=ROWS` returns `[[1,2],[3,4]]`, whereas requesting `range=A1:B2,majorDimension=COLUMNS` returns `[[1,3],[2,4]]`.
      @param valueRenderOption How values should be represented in the output. The default render option is FORMATTED_VALUE.
      @param spreadsheetId The ID of the spreadsheet to retrieve data from.
      @param range The A1 notation or R1C1 notation of the range to retrieve values from.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      ?dateTimeRenderOption:DateTimeRenderOption.t ->
      ?majorDimension:MajorDimension.t ->
      ?valueRenderOption:ValueRenderOption.t ->
      spreadsheetId:string ->
      range:string ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.ValueRange.t * GapiConversation.Session.t
    
    (** Returns one or more ranges of values that match the specified data filters. The caller must specify the spreadsheet ID and one or more DataFilters. Ranges that match any of the data filters in the request will be returned.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to retrieve data from.
      *)
    val batchGetByDataFilter :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      GapiSheetsV4Model.BatchGetValuesByDataFilterRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.BatchGetValuesByDataFilterResponse.t * GapiConversation.Session.t
    
    (** Sets values in one or more ranges of a spreadsheet. The caller must specify the spreadsheet ID, a valueInputOption, and one or more DataFilterValueRanges.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to update.
      *)
    val batchUpdateByDataFilter :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      GapiSheetsV4Model.BatchUpdateValuesByDataFilterRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.BatchUpdateValuesByDataFilterResponse.t * GapiConversation.Session.t
    
    (** Sets values in a range of a spreadsheet. The caller must specify the spreadsheet ID, range, and a valueInputOption.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param responseValueRenderOption Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE.
      @param includeValuesInResponse Determines if the update response should include the values of the cells that were updated. By default, responses do not include the updated values. If the range to write was larger than the range actually written, the response includes all values in the requested range (excluding trailing empty rows and columns).
      @param responseDateTimeRenderOption Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
      @param valueInputOption How the input data should be interpreted.
      @param spreadsheetId The ID of the spreadsheet to update.
      @param range The A1 notation of the values to update.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      ?responseValueRenderOption:ResponseValueRenderOption.t ->
      ?includeValuesInResponse:bool ->
      ?responseDateTimeRenderOption:ResponseDateTimeRenderOption.t ->
      ?valueInputOption:ValueInputOption.t ->
      spreadsheetId:string ->
      range:string ->
      GapiSheetsV4Model.ValueRange.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.UpdateValuesResponse.t * GapiConversation.Session.t
    
    (** Sets values in one or more ranges of a spreadsheet. The caller must specify the spreadsheet ID, a valueInputOption, and one or more ValueRanges.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to update.
      *)
    val batchUpdate :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      GapiSheetsV4Model.BatchUpdateValuesRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.BatchUpdateValuesResponse.t * GapiConversation.Session.t
    
    (** Returns one or more ranges of values from a spreadsheet. The caller must specify the spreadsheet ID and one or more ranges.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param ranges The A1 notation or R1C1 notation of the range to retrieve values from.
      @param majorDimension The major dimension that results should use. For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`, then requesting `range=A1:B2,majorDimension=ROWS` returns `[[1,2],[3,4]]`, whereas requesting `range=A1:B2,majorDimension=COLUMNS` returns `[[1,3],[2,4]]`.
      @param dateTimeRenderOption How dates, times, and durations should be represented in the output. This is ignored if value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
      @param valueRenderOption How values should be represented in the output. The default render option is ValueRenderOption.FORMATTED_VALUE.
      @param spreadsheetId The ID of the spreadsheet to retrieve data from.
      *)
    val batchGet :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      ?ranges:string list ->
      ?majorDimension:MajorDimension.t ->
      ?dateTimeRenderOption:DateTimeRenderOption.t ->
      ?valueRenderOption:ValueRenderOption.t ->
      spreadsheetId:string ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.BatchGetValuesResponse.t * GapiConversation.Session.t
    
    (** Clears values from a spreadsheet. The caller must specify the spreadsheet ID and range. Only values are cleared -- all other properties of the cell (such as formatting, data validation, etc..) are kept.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to update.
      @param range The A1 notation or R1C1 notation of the values to clear.
      *)
    val clear :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      range:string ->
      GapiSheetsV4Model.ClearValuesRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.ClearValuesResponse.t * GapiConversation.Session.t
    
    (** Appends values to a spreadsheet. The input range is used to search for existing data and find a "table" within that range. Values will be appended to the next row of the table, starting with the first column of the table. See the \[guide\](/sheets/api/guides/values#appending_values) and \[sample code\](/sheets/api/samples/writing#append_values) for specific details of how tables are detected and data is appended. The caller must specify the spreadsheet ID, range, and a valueInputOption. The `valueInputOption` only controls how the input data will be added to the sheet (column-wise or row-wise), it does not influence what cell the data starts being written to.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param responseValueRenderOption Determines how values in the response should be rendered. The default render option is FORMATTED_VALUE.
      @param includeValuesInResponse Determines if the update response should include the values of the cells that were appended. By default, responses do not include the updated values.
      @param insertDataOption How the input data should be inserted.
      @param responseDateTimeRenderOption Determines how dates, times, and durations in the response should be rendered. This is ignored if response_value_render_option is FORMATTED_VALUE. The default dateTime render option is SERIAL_NUMBER.
      @param valueInputOption How the input data should be interpreted.
      @param spreadsheetId The ID of the spreadsheet to update.
      @param range The A1 notation of a range to search for a logical table of data. Values are appended after the last row of the table.
      *)
    val append :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      ?responseValueRenderOption:ResponseValueRenderOption.t ->
      ?includeValuesInResponse:bool ->
      ?insertDataOption:InsertDataOption.t ->
      ?responseDateTimeRenderOption:ResponseDateTimeRenderOption.t ->
      ?valueInputOption:ValueInputOption.t ->
      spreadsheetId:string ->
      range:string ->
      GapiSheetsV4Model.ValueRange.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.AppendValuesResponse.t * GapiConversation.Session.t
    
    (** Clears one or more ranges of values from a spreadsheet. The caller must specify the spreadsheet ID and one or more ranges. Only values are cleared -- all other properties of the cell (such as formatting, data validation, etc..) are kept.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to update.
      *)
    val batchClear :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      GapiSheetsV4Model.BatchClearValuesRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.BatchClearValuesResponse.t * GapiConversation.Session.t
    
    (** Clears one or more ranges of values from a spreadsheet. The caller must specify the spreadsheet ID and one or more DataFilters. Ranges matching any of the specified data filters will be cleared. Only values are cleared -- all other properties of the cell (such as formatting, data validation, etc..) are kept.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to update.
      *)
    val batchClearByDataFilter :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      GapiSheetsV4Model.BatchClearValuesByDataFilterRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.BatchClearValuesByDataFilterResponse.t * GapiConversation.Session.t
    
    
  end
  
  module DeveloperMetadata :
  sig
    
    (** Returns all developer metadata matching the specified DataFilter. If the provided DataFilter represents a DeveloperMetadataLookup object, this will return all DeveloperMetadata entries selected by it. If the DataFilter represents a location in a spreadsheet, this will return all developer metadata associated with locations intersecting that region.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to retrieve metadata from.
      *)
    val search :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      GapiSheetsV4Model.SearchDeveloperMetadataRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.SearchDeveloperMetadataResponse.t * GapiConversation.Session.t
    
    (** Returns the developer metadata with the specified ID. The caller must specify the spreadsheet ID and the developer metadata's unique metadataId.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet to retrieve metadata from.
      @param metadataId The ID of the developer metadata to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      metadataId:int ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.DeveloperMetadata.t * GapiConversation.Session.t
    
    
  end
  
  module Sheets :
  sig
    
    (** Copies a single sheet from a spreadsheet to another spreadsheet. Returns the properties of the newly created sheet.
      
      @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
      @param std_params Optional standard parameters.
      @param custom_headers Optional HTTP custom headers.
      @param spreadsheetId The ID of the spreadsheet containing the sheet to copy.
      @param sheetId The ID of the sheet to copy.
      *)
    val copyTo :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?custom_headers:GapiCore.Header.t list ->
      spreadsheetId:string ->
      sheetId:int ->
      GapiSheetsV4Model.CopySheetToAnotherSpreadsheetRequest.t ->
      GapiConversation.Session.t ->
      GapiSheetsV4Model.SheetProperties.t * GapiConversation.Session.t
    
    
  end
  
  
  (** Returns the spreadsheet at the given ID. The caller must specify the spreadsheet ID. By default, data within grids will not be returned. You can include grid data one of two ways: * Specify a field mask listing your desired fields using the `fields` URL parameter in HTTP * Set the includeGridData URL parameter to true. If a field mask is set, the `includeGridData` parameter is ignored For large spreadsheets, it is recommended to retrieve only the specific fields of the spreadsheet that you want. To retrieve only subsets of the spreadsheet, use the ranges URL parameter. Multiple ranges can be specified. Limiting the range will return only the portions of the spreadsheet that intersect the requested ranges. Ranges are specified using A1 notation.
    
    @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeGridData True if grid data should be returned. This parameter is ignored if a field mask was set in the request.
    @param ranges The ranges to retrieve from the spreadsheet.
    @param spreadsheetId The spreadsheet to request.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?includeGridData:bool ->
    ?ranges:string list ->
    spreadsheetId:string ->
    GapiConversation.Session.t ->
    GapiSheetsV4Model.Spreadsheet.t * GapiConversation.Session.t
  
  (** Creates a spreadsheet, returning the newly created spreadsheet.
    
    @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiSheetsV4Model.Spreadsheet.t ->
    GapiConversation.Session.t ->
    GapiSheetsV4Model.Spreadsheet.t * GapiConversation.Session.t
  
  (** Returns the spreadsheet at the given ID. The caller must specify the spreadsheet ID. This method differs from GetSpreadsheet in that it allows selecting which subsets of spreadsheet data to return by specifying a dataFilters parameter. Multiple DataFilters can be specified. Specifying one or more data filters will return the portions of the spreadsheet that intersect ranges matched by any of the filters. By default, data within grids will not be returned. You can include grid data one of two ways: * Specify a field mask listing your desired fields using the `fields` URL parameter in HTTP * Set the includeGridData parameter to true. If a field mask is set, the `includeGridData` parameter is ignored For large spreadsheets, it is recommended to retrieve only the specific fields of the spreadsheet that you want.
    
    @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param spreadsheetId The spreadsheet to request.
    *)
  val getByDataFilter :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    spreadsheetId:string ->
    GapiSheetsV4Model.GetSpreadsheetByDataFilterRequest.t ->
    GapiConversation.Session.t ->
    GapiSheetsV4Model.Spreadsheet.t * GapiConversation.Session.t
  
  (** Applies one or more updates to the spreadsheet. Each request is validated before being applied. If any request is not valid then the entire request will fail and nothing will be applied. Some requests have replies to give you some information about how they are applied. The replies will mirror the requests. For example, if you applied 4 updates and the 3rd one had a reply, then the response will have 2 empty replies, the actual reply, and another empty reply, in that order. Due to the collaborative nature of spreadsheets, it is not guaranteed that the spreadsheet will reflect exactly your changes after this completes, however it is guaranteed that the updates in the request will be applied together atomically. Your changes may be altered with respect to collaborator changes. If there are no collaborators, the spreadsheet should reflect your changes.
    
    @param base_url Service endpoint base URL (defaults to ["https://sheets.googleapis.com/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param spreadsheetId The spreadsheet to apply the updates to.
    *)
  val batchUpdate :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    spreadsheetId:string ->
    GapiSheetsV4Model.BatchUpdateSpreadsheetRequest.t ->
    GapiConversation.Session.t ->
    GapiSheetsV4Model.BatchUpdateSpreadsheetResponse.t * GapiConversation.Session.t
  
  
end


