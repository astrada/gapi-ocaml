(* Warning! This file is generated. Modify at your own risk.
        *)

open GapiUtils.Infix
open GapiSheetsV4Model

module Scope =
struct
  let drive_readonly = "https://www.googleapis.com/auth/drive.readonly"
  
  let drive = "https://www.googleapis.com/auth/drive"
  
  let spreadsheets = "https://www.googleapis.com/auth/spreadsheets"
  
  let drive_file = "https://www.googleapis.com/auth/drive.file"
  
  let spreadsheets_readonly = "https://www.googleapis.com/auth/spreadsheets.readonly"
  
  
end

module SpreadsheetsResource =
struct
  module Sheets =
  struct
    let copyTo
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          ~sheetId
          copySheetToAnotherSpreadsheetRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "sheets";
        (string_of_int sheetId ^ ":copyTo")] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json CopySheetToAnotherSpreadsheetRequest.to_data_model)
        ~data:copySheetToAnotherSpreadsheetRequest full_url
        (GapiJson.parse_json_response SheetProperties.of_data_model) session 
      
    
  end
  
  module DeveloperMetadata =
  struct
    let search
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          searchDeveloperMetadataRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "developerMetadata:search"] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json SearchDeveloperMetadataRequest.to_data_model)
        ~data:searchDeveloperMetadataRequest full_url
        (GapiJson.parse_json_response SearchDeveloperMetadataResponse.of_data_model)
        session 
      
    let get
          ?(base_url = "https://sheets.googleapis.com/")
          ?etag
          ?std_params
          ?custom_headers
          ~spreadsheetId
          ~metadataId
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "developerMetadata";
        (string_of_int metadataId)] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag ?custom_headers full_url
        (GapiJson.parse_json_response DeveloperMetadata.of_data_model)
        session 
      
    
  end
  
  module Values =
  struct
    module DateTimeRenderOption =
    struct
      type t =
        | Default
        | SERIAL_NUMBER
        | FORMATTED_STRING
        
      let to_string = function
        | Default -> ""
        | SERIAL_NUMBER -> "SERIAL_NUMBER"
        | FORMATTED_STRING -> "FORMATTED_STRING"
        
      let of_string = function
        | "" -> Default
        | "SERIAL_NUMBER" -> SERIAL_NUMBER
        | "FORMATTED_STRING" -> FORMATTED_STRING
        | s -> failwith ("Unexpected value for DateTimeRenderOption:" ^ s)
    
    end
    
    module InsertDataOption =
    struct
      type t =
        | Default
        | OVERWRITE
        | INSERT_ROWS
        
      let to_string = function
        | Default -> ""
        | OVERWRITE -> "OVERWRITE"
        | INSERT_ROWS -> "INSERT_ROWS"
        
      let of_string = function
        | "" -> Default
        | "OVERWRITE" -> OVERWRITE
        | "INSERT_ROWS" -> INSERT_ROWS
        | s -> failwith ("Unexpected value for InsertDataOption:" ^ s)
    
    end
    
    module MajorDimension =
    struct
      type t =
        | Default
        | DIMENSION_UNSPECIFIED
        | ROWS
        | COLUMNS
        
      let to_string = function
        | Default -> ""
        | DIMENSION_UNSPECIFIED -> "DIMENSION_UNSPECIFIED"
        | ROWS -> "ROWS"
        | COLUMNS -> "COLUMNS"
        
      let of_string = function
        | "" -> Default
        | "DIMENSION_UNSPECIFIED" -> DIMENSION_UNSPECIFIED
        | "ROWS" -> ROWS
        | "COLUMNS" -> COLUMNS
        | s -> failwith ("Unexpected value for MajorDimension:" ^ s)
    
    end
    
    module ResponseDateTimeRenderOption =
    struct
      type t =
        | Default
        | SERIAL_NUMBER
        | FORMATTED_STRING
        
      let to_string = function
        | Default -> ""
        | SERIAL_NUMBER -> "SERIAL_NUMBER"
        | FORMATTED_STRING -> "FORMATTED_STRING"
        
      let of_string = function
        | "" -> Default
        | "SERIAL_NUMBER" -> SERIAL_NUMBER
        | "FORMATTED_STRING" -> FORMATTED_STRING
        | s -> failwith ("Unexpected value for ResponseDateTimeRenderOption:" ^ s)
    
    end
    
    module ResponseValueRenderOption =
    struct
      type t =
        | Default
        | FORMATTED_VALUE
        | UNFORMATTED_VALUE
        | FORMULA
        
      let to_string = function
        | Default -> ""
        | FORMATTED_VALUE -> "FORMATTED_VALUE"
        | UNFORMATTED_VALUE -> "UNFORMATTED_VALUE"
        | FORMULA -> "FORMULA"
        
      let of_string = function
        | "" -> Default
        | "FORMATTED_VALUE" -> FORMATTED_VALUE
        | "UNFORMATTED_VALUE" -> UNFORMATTED_VALUE
        | "FORMULA" -> FORMULA
        | s -> failwith ("Unexpected value for ResponseValueRenderOption:" ^ s)
    
    end
    
    module ValueInputOption =
    struct
      type t =
        | Default
        | INPUT_VALUE_OPTION_UNSPECIFIED
        | RAW
        | USER_ENTERED
        
      let to_string = function
        | Default -> ""
        | INPUT_VALUE_OPTION_UNSPECIFIED -> "INPUT_VALUE_OPTION_UNSPECIFIED"
        | RAW -> "RAW"
        | USER_ENTERED -> "USER_ENTERED"
        
      let of_string = function
        | "" -> Default
        | "INPUT_VALUE_OPTION_UNSPECIFIED" -> INPUT_VALUE_OPTION_UNSPECIFIED
        | "RAW" -> RAW
        | "USER_ENTERED" -> USER_ENTERED
        | s -> failwith ("Unexpected value for ValueInputOption:" ^ s)
    
    end
    
    module ValueRenderOption =
    struct
      type t =
        | Default
        | FORMATTED_VALUE
        | UNFORMATTED_VALUE
        | FORMULA
        
      let to_string = function
        | Default -> ""
        | FORMATTED_VALUE -> "FORMATTED_VALUE"
        | UNFORMATTED_VALUE -> "UNFORMATTED_VALUE"
        | FORMULA -> "FORMULA"
        
      let of_string = function
        | "" -> Default
        | "FORMATTED_VALUE" -> FORMATTED_VALUE
        | "UNFORMATTED_VALUE" -> UNFORMATTED_VALUE
        | "FORMULA" -> FORMULA
        | s -> failwith ("Unexpected value for ValueRenderOption:" ^ s)
    
    end
    
    module ValuesParameters =
    struct
      type t = {
        (* Standard query parameters *)
        alt : string;
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* values-specific query parameters *)
        dateTimeRenderOption : DateTimeRenderOption.t;
        includeValuesInResponse : bool;
        insertDataOption : InsertDataOption.t;
        majorDimension : MajorDimension.t;
        ranges : string list;
        responseDateTimeRenderOption : ResponseDateTimeRenderOption.t;
        responseValueRenderOption : ResponseValueRenderOption.t;
        valueInputOption : ValueInputOption.t;
        valueRenderOption : ValueRenderOption.t;
        
      }
      
      let default = {
        alt = "";
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        dateTimeRenderOption = DateTimeRenderOption.Default;
        includeValuesInResponse = false;
        insertDataOption = InsertDataOption.Default;
        majorDimension = MajorDimension.Default;
        ranges = [];
        responseDateTimeRenderOption = ResponseDateTimeRenderOption.Default;
        responseValueRenderOption = ResponseValueRenderOption.Default;
        valueInputOption = ValueInputOption.Default;
        valueRenderOption = ValueRenderOption.Default;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.alt) (fun x -> x) "alt";
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.dateTimeRenderOption) DateTimeRenderOption.to_string "dateTimeRenderOption";
        param (fun p -> p.includeValuesInResponse) string_of_bool "includeValuesInResponse";
        param (fun p -> p.insertDataOption) InsertDataOption.to_string "insertDataOption";
        param (fun p -> p.majorDimension) MajorDimension.to_string "majorDimension";
        GapiService.build_params qp (fun p -> p.ranges) (fun x -> x) "ranges";
        param (fun p -> p.responseDateTimeRenderOption) ResponseDateTimeRenderOption.to_string "responseDateTimeRenderOption";
        param (fun p -> p.responseValueRenderOption) ResponseValueRenderOption.to_string "responseValueRenderOption";
        param (fun p -> p.valueInputOption) ValueInputOption.to_string "valueInputOption";
        param (fun p -> p.valueRenderOption) ValueRenderOption.to_string "valueRenderOption";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(dateTimeRenderOption = default.dateTimeRenderOption)
          ?(includeValuesInResponse = default.includeValuesInResponse)
          ?(insertDataOption = default.insertDataOption)
          ?(majorDimension = default.majorDimension)
          ?(ranges = default.ranges)
          ?(responseDateTimeRenderOption = default.responseDateTimeRenderOption)
          ?(responseValueRenderOption = default.responseValueRenderOption)
          ?(valueInputOption = default.valueInputOption)
          ?(valueRenderOption = default.valueRenderOption)
          () =
        let parameters = {
          alt = standard_parameters.GapiService.StandardParameters.alt;
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          dateTimeRenderOption;
          includeValuesInResponse;
          insertDataOption;
          majorDimension;
          ranges;
          responseDateTimeRenderOption;
          responseValueRenderOption;
          valueInputOption;
          valueRenderOption;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://sheets.googleapis.com/")
          ?etag
          ?std_params
          ?custom_headers
          ?dateTimeRenderOption
          ?majorDimension
          ?valueRenderOption
          ~spreadsheetId
          ~range
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values"; ((fun x -> x) range)]
        base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params ?dateTimeRenderOption ?majorDimension
        ?valueRenderOption () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag ?custom_headers full_url
        (GapiJson.parse_json_response ValueRange.of_data_model) session 
      
    let batchGetByDataFilter
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          batchGetValuesByDataFilterRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values:batchGetByDataFilter"] base_url
        in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json BatchGetValuesByDataFilterRequest.to_data_model)
        ~data:batchGetValuesByDataFilterRequest full_url
        (GapiJson.parse_json_response BatchGetValuesByDataFilterResponse.of_data_model)
        session 
      
    let batchUpdateByDataFilter
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          batchUpdateValuesByDataFilterRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values:batchUpdateByDataFilter"]
        base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json BatchUpdateValuesByDataFilterRequest.to_data_model)
        ~data:batchUpdateValuesByDataFilterRequest full_url
        (GapiJson.parse_json_response BatchUpdateValuesByDataFilterResponse.of_data_model)
        session 
      
    let update
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ?responseValueRenderOption
          ?includeValuesInResponse
          ?responseDateTimeRenderOption
          ?valueInputOption
          ~spreadsheetId
          ~range
          valueRange
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values"; ((fun x -> x) range)]
        base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params ?responseValueRenderOption
        ?includeValuesInResponse ?responseDateTimeRenderOption
        ?valueInputOption () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.put' ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json ValueRange.to_data_model)
        ~data:valueRange full_url
        (GapiJson.parse_json_response UpdateValuesResponse.of_data_model)
        session 
      
    let batchUpdate
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          batchUpdateValuesRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values:batchUpdate"] base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json BatchUpdateValuesRequest.to_data_model)
        ~data:batchUpdateValuesRequest full_url
        (GapiJson.parse_json_response BatchUpdateValuesResponse.of_data_model)
        session 
      
    let batchGet
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ?ranges
          ?majorDimension
          ?dateTimeRenderOption
          ?valueRenderOption
          ~spreadsheetId
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values:batchGet"] base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params ?ranges ?majorDimension
        ?dateTimeRenderOption ?valueRenderOption () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?custom_headers full_url
        (GapiJson.parse_json_response BatchGetValuesResponse.of_data_model)
        session 
      
    let clear
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          ~range
          clearValuesRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values";
        ((fun x -> x) range ^ ":clear")] base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json ClearValuesRequest.to_data_model)
        ~data:clearValuesRequest full_url
        (GapiJson.parse_json_response ClearValuesResponse.of_data_model)
        session 
      
    let append
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ?responseValueRenderOption
          ?includeValuesInResponse
          ?insertDataOption
          ?responseDateTimeRenderOption
          ?valueInputOption
          ~spreadsheetId
          ~range
          valueRange
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values";
        ((fun x -> x) range ^ ":append")] base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params ?responseValueRenderOption
        ?includeValuesInResponse ?insertDataOption
        ?responseDateTimeRenderOption ?valueInputOption () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json ValueRange.to_data_model)
        ~data:valueRange full_url
        (GapiJson.parse_json_response AppendValuesResponse.of_data_model)
        session 
      
    let batchClear
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          batchClearValuesRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values:batchClear"] base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json BatchClearValuesRequest.to_data_model)
        ~data:batchClearValuesRequest full_url
        (GapiJson.parse_json_response BatchClearValuesResponse.of_data_model)
        session 
      
    let batchClearByDataFilter
          ?(base_url = "https://sheets.googleapis.com/")
          ?std_params
          ?custom_headers
          ~spreadsheetId
          batchClearValuesByDataFilterRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
        ((fun x -> x) spreadsheetId); "values:batchClearByDataFilter"]
        base_url in
      let params = ValuesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = GapiOption.map
        ValuesParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?custom_headers
        ~data_to_post:(GapiJson.render_json BatchClearValuesByDataFilterRequest.to_data_model)
        ~data:batchClearValuesByDataFilterRequest full_url
        (GapiJson.parse_json_response BatchClearValuesByDataFilterResponse.of_data_model)
        session 
      
    
  end
  
  module SpreadsheetsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* spreadsheets-specific query parameters *)
      includeGridData : bool;
      ranges : string list;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeGridData = false;
      ranges = [];
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.alt) (fun x -> x) "alt";
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.includeGridData) string_of_bool "includeGridData";
      GapiService.build_params qp (fun p -> p.ranges) (fun x -> x) "ranges";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeGridData = default.includeGridData)
        ?(ranges = default.ranges)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeGridData;
        ranges;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://sheets.googleapis.com/")
        ?etag
        ?std_params
        ?custom_headers
        ?includeGridData
        ?ranges
        ~spreadsheetId
        session =
    let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
      ((fun x -> x) spreadsheetId)] base_url in
    let params = SpreadsheetsParameters.merge_parameters
      ?standard_parameters:std_params ?includeGridData ?ranges () in
    let query_parameters = GapiOption.map
      SpreadsheetsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Spreadsheet.of_data_model) session 
    
  let create
        ?(base_url = "https://sheets.googleapis.com/")
        ?std_params
        ?custom_headers
        spreadsheet
        session =
    let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets"] base_url
      in
    let params = SpreadsheetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      SpreadsheetsParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Spreadsheet.to_data_model)
      ~data:spreadsheet full_url
      (GapiJson.parse_json_response Spreadsheet.of_data_model) session 
    
  let getByDataFilter
        ?(base_url = "https://sheets.googleapis.com/")
        ?std_params
        ?custom_headers
        ~spreadsheetId
        getSpreadsheetByDataFilterRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
      ((fun x -> x) spreadsheetId ^ ":getByDataFilter")] base_url in
    let params = SpreadsheetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      SpreadsheetsParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json GetSpreadsheetByDataFilterRequest.to_data_model)
      ~data:getSpreadsheetByDataFilterRequest full_url
      (GapiJson.parse_json_response Spreadsheet.of_data_model) session 
    
  let batchUpdate
        ?(base_url = "https://sheets.googleapis.com/")
        ?std_params
        ?custom_headers
        ~spreadsheetId
        batchUpdateSpreadsheetRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["v4"; "spreadsheets";
      ((fun x -> x) spreadsheetId ^ ":batchUpdate")] base_url in
    let params = SpreadsheetsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      SpreadsheetsParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json BatchUpdateSpreadsheetRequest.to_data_model)
      ~data:batchUpdateSpreadsheetRequest full_url
      (GapiJson.parse_json_response BatchUpdateSpreadsheetResponse.of_data_model)
      session 
    
  
end

