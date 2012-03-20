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
  
  module ImgColorType =
  struct
    type t =
      | Default
      | Color
      | Gray
      | Mono
      
    let to_string = function
      | Default -> ""
      | Color -> "color"
      | Gray -> "gray"
      | Mono -> "mono"
      
    let of_string = function
      | "" -> Default
      | "color" -> Color
      | "gray" -> Gray
      | "mono" -> Mono
      | s -> failwith ("Unexpected value for ImgColorType:" ^ s)
  
  end
  
  module ImgDominantColor =
  struct
    type t =
      | Default
      | Black
      | Blue
      | Brown
      | Gray
      | Green
      | Pink
      | Purple
      | Teal
      | White
      | Yellow
      
    let to_string = function
      | Default -> ""
      | Black -> "black"
      | Blue -> "blue"
      | Brown -> "brown"
      | Gray -> "gray"
      | Green -> "green"
      | Pink -> "pink"
      | Purple -> "purple"
      | Teal -> "teal"
      | White -> "white"
      | Yellow -> "yellow"
      
    let of_string = function
      | "" -> Default
      | "black" -> Black
      | "blue" -> Blue
      | "brown" -> Brown
      | "gray" -> Gray
      | "green" -> Green
      | "pink" -> Pink
      | "purple" -> Purple
      | "teal" -> Teal
      | "white" -> White
      | "yellow" -> Yellow
      | s -> failwith ("Unexpected value for ImgDominantColor:" ^ s)
  
  end
  
  module ImgSize =
  struct
    type t =
      | Default
      | Huge
      | Icon
      | Large
      | Medium
      | Small
      | Xlarge
      | Xxlarge
      
    let to_string = function
      | Default -> ""
      | Huge -> "huge"
      | Icon -> "icon"
      | Large -> "large"
      | Medium -> "medium"
      | Small -> "small"
      | Xlarge -> "xlarge"
      | Xxlarge -> "xxlarge"
      
    let of_string = function
      | "" -> Default
      | "huge" -> Huge
      | "icon" -> Icon
      | "large" -> Large
      | "medium" -> Medium
      | "small" -> Small
      | "xlarge" -> Xlarge
      | "xxlarge" -> Xxlarge
      | s -> failwith ("Unexpected value for ImgSize:" ^ s)
  
  end
  
  module ImgType =
  struct
    type t =
      | Default
      | Clipart
      | Face
      | Lineart
      | News
      | Photo
      
    let to_string = function
      | Default -> ""
      | Clipart -> "clipart"
      | Face -> "face"
      | Lineart -> "lineart"
      | News -> "news"
      | Photo -> "photo"
      
    let of_string = function
      | "" -> Default
      | "clipart" -> Clipart
      | "face" -> Face
      | "lineart" -> Lineart
      | "news" -> News
      | "photo" -> Photo
      | s -> failwith ("Unexpected value for ImgType:" ^ s)
  
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
  
  module SearchType =
  struct
    type t =
      | Default
      | Image
      
    let to_string = function
      | Default -> ""
      | Image -> "image"
      
    let of_string = function
      | "" -> Default
      | "image" -> Image
      | s -> failwith ("Unexpected value for SearchType:" ^ s)
  
  end
  
  module SiteSearchFilter =
  struct
    type t =
      | Default
      | E
      | I
      
    let to_string = function
      | Default -> ""
      | E -> "e"
      | I -> "i"
      
    let of_string = function
      | "" -> Default
      | "e" -> E
      | "i" -> I
      | s -> failwith ("Unexpected value for SiteSearchFilter:" ^ s)
  
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
      c2coff : string;
      cr : string;
      cref : string;
      cx : string;
      dateRestrict : string;
      exactTerms : string;
      excludeTerms : string;
      fileType : string;
      filter : Filter.t;
      gl : string;
      googlehost : string;
      highRange : string;
      hl : string;
      hq : string;
      imgColorType : ImgColorType.t;
      imgDominantColor : ImgDominantColor.t;
      imgSize : ImgSize.t;
      imgType : ImgType.t;
      linkSite : string;
      lowRange : string;
      lr : Lr.t;
      num : int;
      orTerms : string;
      q : string;
      relatedSite : string;
      rights : string;
      safe : Safe.t;
      searchType : SearchType.t;
      siteSearch : string;
      siteSearchFilter : SiteSearchFilter.t;
      sort : string;
      start : int;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      c2coff = "";
      cr = "";
      cref = "";
      cx = "";
      dateRestrict = "";
      exactTerms = "";
      excludeTerms = "";
      fileType = "";
      filter = Filter.Default;
      gl = "";
      googlehost = "";
      highRange = "";
      hl = "";
      hq = "";
      imgColorType = ImgColorType.Default;
      imgDominantColor = ImgDominantColor.Default;
      imgSize = ImgSize.Default;
      imgType = ImgType.Default;
      linkSite = "";
      lowRange = "";
      lr = Lr.Default;
      num = 10;
      orTerms = "";
      q = "";
      relatedSite = "";
      rights = "";
      safe = Safe.Default;
      searchType = SearchType.Default;
      siteSearch = "";
      siteSearchFilter = SiteSearchFilter.Default;
      sort = "";
      start = 0;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.c2coff) (fun x -> x) "c2coff";
      param (fun p -> p.cr) (fun x -> x) "cr";
      param (fun p -> p.cref) (fun x -> x) "cref";
      param (fun p -> p.cx) (fun x -> x) "cx";
      param (fun p -> p.dateRestrict) (fun x -> x) "dateRestrict";
      param (fun p -> p.exactTerms) (fun x -> x) "exactTerms";
      param (fun p -> p.excludeTerms) (fun x -> x) "excludeTerms";
      param (fun p -> p.fileType) (fun x -> x) "fileType";
      param (fun p -> p.filter) Filter.to_string "filter";
      param (fun p -> p.gl) (fun x -> x) "gl";
      param (fun p -> p.googlehost) (fun x -> x) "googlehost";
      param (fun p -> p.highRange) (fun x -> x) "highRange";
      param (fun p -> p.hl) (fun x -> x) "hl";
      param (fun p -> p.hq) (fun x -> x) "hq";
      param (fun p -> p.imgColorType) ImgColorType.to_string "imgColorType";
      param (fun p -> p.imgDominantColor) ImgDominantColor.to_string "imgDominantColor";
      param (fun p -> p.imgSize) ImgSize.to_string "imgSize";
      param (fun p -> p.imgType) ImgType.to_string "imgType";
      param (fun p -> p.linkSite) (fun x -> x) "linkSite";
      param (fun p -> p.lowRange) (fun x -> x) "lowRange";
      param (fun p -> p.lr) Lr.to_string "lr";
      param (fun p -> p.num) string_of_int "num";
      param (fun p -> p.orTerms) (fun x -> x) "orTerms";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.relatedSite) (fun x -> x) "relatedSite";
      param (fun p -> p.rights) (fun x -> x) "rights";
      param (fun p -> p.safe) Safe.to_string "safe";
      param (fun p -> p.searchType) SearchType.to_string "searchType";
      param (fun p -> p.siteSearch) (fun x -> x) "siteSearch";
      param (fun p -> p.siteSearchFilter) SiteSearchFilter.to_string "siteSearchFilter";
      param (fun p -> p.sort) (fun x -> x) "sort";
      param (fun p -> p.start) string_of_int "start";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(c2coff = default.c2coff)
        ?(cr = default.cr)
        ?(cref = default.cref)
        ?(cx = default.cx)
        ?(dateRestrict = default.dateRestrict)
        ?(exactTerms = default.exactTerms)
        ?(excludeTerms = default.excludeTerms)
        ?(fileType = default.fileType)
        ?(filter = default.filter)
        ?(gl = default.gl)
        ?(googlehost = default.googlehost)
        ?(highRange = default.highRange)
        ?(hl = default.hl)
        ?(hq = default.hq)
        ?(imgColorType = default.imgColorType)
        ?(imgDominantColor = default.imgDominantColor)
        ?(imgSize = default.imgSize)
        ?(imgType = default.imgType)
        ?(linkSite = default.linkSite)
        ?(lowRange = default.lowRange)
        ?(lr = default.lr)
        ?(num = default.num)
        ?(orTerms = default.orTerms)
        ?(q = default.q)
        ?(relatedSite = default.relatedSite)
        ?(rights = default.rights)
        ?(safe = default.safe)
        ?(searchType = default.searchType)
        ?(siteSearch = default.siteSearch)
        ?(siteSearchFilter = default.siteSearchFilter)
        ?(sort = default.sort)
        ?(start = default.start)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        c2coff;
        cr;
        cref;
        cx;
        dateRestrict;
        exactTerms;
        excludeTerms;
        fileType;
        filter;
        gl;
        googlehost;
        highRange;
        hl;
        hq;
        imgColorType;
        imgDominantColor;
        imgSize;
        imgType;
        linkSite;
        lowRange;
        lr;
        num;
        orTerms;
        q;
        relatedSite;
        rights;
        safe;
        searchType;
        siteSearch;
        siteSearchFilter;
        sort;
        start;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/customsearch/")
        ?std_params
        ?(num = 10)
        ?(safe = Safe.Default)
        ?c2coff
        ?cr
        ?cref
        ?cx
        ?dateRestrict
        ?exactTerms
        ?excludeTerms
        ?fileType
        ?filter
        ?gl
        ?googlehost
        ?highRange
        ?hl
        ?hq
        ?imgColorType
        ?imgDominantColor
        ?imgSize
        ?imgType
        ?linkSite
        ?lowRange
        ?lr
        ?orTerms
        ?relatedSite
        ?rights
        ?searchType
        ?siteSearch
        ?siteSearchFilter
        ?sort
        ?start
        ~q
        session =
    let full_url = GapiUtils.add_path_to_url ["v1"] base_url in
    let params = CseParameters.merge_parameters
      ?standard_parameters:std_params ?c2coff ?cr ?cref ?cx ?dateRestrict
      ?exactTerms ?excludeTerms ?fileType ?filter ?gl ?googlehost ?highRange
      ?hl ?hq ?imgColorType ?imgDominantColor ?imgSize ?imgType ?linkSite
      ?lowRange ?lr ~num ?orTerms ~q ?relatedSite ?rights ~safe ?searchType
      ?siteSearch ?siteSearchFilter ?sort ?start () in
    let query_parameters = Option.map CseParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Search.of_data_model) session 
    
  
end

