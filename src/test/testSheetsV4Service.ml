open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiSheetsV4Model
open GapiSheetsV4Service

let test_get () =
  let spreadsheetId = "insert here your spreadsheet id" in
  TestHelper.test_request TestHelper.build_oauth2_auth (fun session ->
      let spreadsheet, session =
        SpreadsheetsResource.get ~spreadsheetId session
      in
      assert_equal spreadsheetId spreadsheet.Spreadsheet.spreadsheetId)

let suite = "Sheets V4 service test" >::: [ "test_get" >:: test_get ]
