(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiCustomsearchV1Model

module CseResource =
struct
  module Filter =
  struct
    type t =
      | Default
      | V0
      | V1
      
    let to_string = function
      | Default -> ""
      | V0 -> "0"
      | V1 -> "1"
      
    let of_string = function
      | "" -> Default
      | "0" -> V0
      | "1" -> V1
      | s -> failwith ("Unexpected value for Filter:" ^ s)
  
  end
  
  module Lr =
  struct
    type t =
      | Default
      | Lang_ar
      | Lang_bg
      | Lang_ca
      | Lang_cs
      | Lang_da
      | Lang_de
      | Lang_el
      | Lang_en
      | Lang_es
      | Lang_et
      | Lang_fi
      | Lang_fr
      | Lang_hr
      | Lang_hu
      | Lang_id
      | Lang_is
      | Lang_it
      | Lang_iw
      | Lang_ja
      | Lang_ko
      | Lang_lt
      | Lang_lv
      | Lang_nl
      | Lang_no
      | Lang_pl
      | Lang_pt
      | Lang_ro
      | Lang_ru
      | Lang_sk
      | Lang_sl
      | Lang_sr
      | Lang_sv
      | Lang_tr
      | Lang_zh_CN
      | Lang_zh_TW
      
    let to_string = function
      | Default -> ""
      | Lang_ar -> "lang_ar"
      | Lang_bg -> "lang_bg"
      | Lang_ca -> "lang_ca"
      | Lang_cs -> "lang_cs"
      | Lang_da -> "lang_da"
      | Lang_de -> "lang_de"
      | Lang_el -> "lang_el"
      | Lang_en -> "lang_en"
      | Lang_es -> "lang_es"
      | Lang_et -> "lang_et"
      | Lang_fi -> "lang_fi"
      | Lang_fr -> "lang_fr"
      | Lang_hr -> "lang_hr"
      | Lang_hu -> "lang_hu"
      | Lang_id -> "lang_id"
      | Lang_is -> "lang_is"
      | Lang_it -> "lang_it"
      | Lang_iw -> "lang_iw"
      | Lang_ja -> "lang_ja"
      | Lang_ko -> "lang_ko"
      | Lang_lt -> "lang_lt"
      | Lang_lv -> "lang_lv"
      | Lang_nl -> "lang_nl"
      | Lang_no -> "lang_no"
      | Lang_pl -> "lang_pl"
      | Lang_pt -> "lang_pt"
      | Lang_ro -> "lang_ro"
      | Lang_ru -> "lang_ru"
      | Lang_sk -> "lang_sk"
      | Lang_sl -> "lang_sl"
      | Lang_sr -> "lang_sr"
      | Lang_sv -> "lang_sv"
      | Lang_tr -> "lang_tr"
      | Lang_zh_CN -> "lang_zh-CN"
      | Lang_zh_TW -> "lang_zh-TW"
      
    let of_string = function
      | "" -> Default
      | "lang_ar" -> Lang_ar
      | "lang_bg" -> Lang_bg
      | "lang_ca" -> Lang_ca
      | "lang_cs" -> Lang_cs
      | "lang_da" -> Lang_da
      | "lang_de" -> Lang_de
      | "lang_el" -> Lang_el
      | "lang_en" -> Lang_en
      | "lang_es" -> Lang_es
      | "lang_et" -> Lang_et
      | "lang_fi" -> Lang_fi
      | "lang_fr" -> Lang_fr
      | "lang_hr" -> Lang_hr
      | "lang_hu" -> Lang_hu
      | "lang_id" -> Lang_id
      | "lang_is" -> Lang_is
      | "lang_it" -> Lang_it
      | "lang_iw" -> Lang_iw
      | "lang_ja" -> Lang_ja
      | "lang_ko" -> Lang_ko
      | "lang_lt" -> Lang_lt
      | "lang_lv" -> Lang_lv
      | "lang_nl" -> Lang_nl
      | "lang_no" -> Lang_no
      | "lang_pl" -> Lang_pl
      | "lang_pt" -> Lang_pt
      | "lang_ro" -> Lang_ro
      | "lang_ru" -> Lang_ru
      | "lang_sk" -> Lang_sk
      | "lang_sl" -> Lang_sl
      | "lang_sr" -> Lang_sr
      | "lang_sv" -> Lang_sv
      | "lang_tr" -> Lang_tr
      | "lang_zh-CN" -> Lang_zh_CN
      | "lang_zh-TW" -> Lang_zh_TW
      | s -> failwith ("Unexpected value for Lr:" ^ s)
  
  end
  
  module Safe =
  struct
    type t =
      | Default
      | High
      | Medium
      | Off
      
    let to_string = function
      | Default -> ""
      | High -> "high"
      | Medium -> "medium"
      | Off -> "off"
      
    let of_string = function
      | "" -> Default
      | "high" -> High
      | "medium" -> Medium
      | "off" -> Off
      | s -> failwith ("Unexpected value for Safe:" ^ s)
  
  end
  
  module CseParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* cse-specific query parameters *)
      cr : string;
      cref : string;
      cx : string;
      filter : Filter.t;
      gl : string;
      googlehost : string;
      lr : Lr.t;
      num : string;
      q : string;
      safe : Safe.t;
      sort : string;
      start : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      cr = "";
      cref = "";
      cx = "";
      filter = Filter.Default;
      gl = "";
      googlehost = "";
      lr = Lr.Default;
      num = "10";
      q = "";
      safe = Safe.Default;
      sort = "";
      start = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.cr) (fun x -> x) "cr";
      param (fun p -> p.cref) (fun x -> x) "cref";
      param (fun p -> p.cx) (fun x -> x) "cx";
      param (fun p -> p.filter) Filter.to_string "filter";
      param (fun p -> p.gl) (fun x -> x) "gl";
      param (fun p -> p.googlehost) (fun x -> x) "googlehost";
      param (fun p -> p.lr) Lr.to_string "lr";
      param (fun p -> p.num) (fun x -> x) "num";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.safe) Safe.to_string "safe";
      param (fun p -> p.sort) (fun x -> x) "sort";
      param (fun p -> p.start) (fun x -> x) "start";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(cr = default.cr)
        ?(cref = default.cref)
        ?(cx = default.cx)
        ?(filter = default.filter)
        ?(gl = default.gl)
        ?(googlehost = default.googlehost)
        ?(lr = default.lr)
        ?(num = default.num)
        ?(q = default.q)
        ?(safe = default.safe)
        ?(sort = default.sort)
        ?(start = default.start)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        cr;
        cref;
        cx;
        filter;
        gl;
        googlehost;
        lr;
        num;
        q;
        safe;
        sort;
        start;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/customsearch/")
        ?std_params
        ?(num = "10")
        ?(safe = Safe.Default)
        ?cr
        ?cref
        ?cx
        ?filter
        ?gl
        ?googlehost
        ?lr
        ?sort
        ?start
        ~q
        session =
    let full_url = GapiUtils.add_path_to_url ["v1"] base_url in
    let params = CseParameters.merge_parameters
      ?standard_parameters:std_params ?cr ?cref ?cx ?filter ?gl ?googlehost
      ?lr ~num ~q ~safe ?sort ?start () in
    let query_parameters = Option.map CseParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Search.of_data_model) session 
    
  
end

