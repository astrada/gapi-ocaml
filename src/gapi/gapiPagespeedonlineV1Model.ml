(* Warning! This file is generated. Modify at your own risk. *)

module Result =
struct
  module VersionData =
  struct
    type t = {
      major : int;
      minor : int;
      
    }
    
    let major = {
      GapiLens.get = (fun x -> x.major);
      GapiLens.set = (fun v x -> { x with major = v });
    }
    let minor = {
      GapiLens.get = (fun x -> x.minor);
      GapiLens.set = (fun v x -> { x with minor = v });
    }
    
    let empty = {
      major = 0;
      minor = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int_value "major" x.major;
        GapiJson.render_int_value "minor" x.minor;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "major"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with major = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "minor"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with minor = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPagespeedonlineV1Model.VersionData.parse" e x
    
  end
  
  module PageStatsData =
  struct
    type t = {
      cssResponseBytes : string;
      flashResponseBytes : string;
      htmlResponseBytes : string;
      imageResponseBytes : string;
      javascriptResponseBytes : string;
      numberCssResources : int;
      numberHosts : int;
      numberJsResources : int;
      numberResources : int;
      numberStaticResources : int;
      otherResponseBytes : string;
      textResponseBytes : string;
      totalRequestBytes : string;
      
    }
    
    let cssResponseBytes = {
      GapiLens.get = (fun x -> x.cssResponseBytes);
      GapiLens.set = (fun v x -> { x with cssResponseBytes = v });
    }
    let flashResponseBytes = {
      GapiLens.get = (fun x -> x.flashResponseBytes);
      GapiLens.set = (fun v x -> { x with flashResponseBytes = v });
    }
    let htmlResponseBytes = {
      GapiLens.get = (fun x -> x.htmlResponseBytes);
      GapiLens.set = (fun v x -> { x with htmlResponseBytes = v });
    }
    let imageResponseBytes = {
      GapiLens.get = (fun x -> x.imageResponseBytes);
      GapiLens.set = (fun v x -> { x with imageResponseBytes = v });
    }
    let javascriptResponseBytes = {
      GapiLens.get = (fun x -> x.javascriptResponseBytes);
      GapiLens.set = (fun v x -> { x with javascriptResponseBytes = v });
    }
    let numberCssResources = {
      GapiLens.get = (fun x -> x.numberCssResources);
      GapiLens.set = (fun v x -> { x with numberCssResources = v });
    }
    let numberHosts = {
      GapiLens.get = (fun x -> x.numberHosts);
      GapiLens.set = (fun v x -> { x with numberHosts = v });
    }
    let numberJsResources = {
      GapiLens.get = (fun x -> x.numberJsResources);
      GapiLens.set = (fun v x -> { x with numberJsResources = v });
    }
    let numberResources = {
      GapiLens.get = (fun x -> x.numberResources);
      GapiLens.set = (fun v x -> { x with numberResources = v });
    }
    let numberStaticResources = {
      GapiLens.get = (fun x -> x.numberStaticResources);
      GapiLens.set = (fun v x -> { x with numberStaticResources = v });
    }
    let otherResponseBytes = {
      GapiLens.get = (fun x -> x.otherResponseBytes);
      GapiLens.set = (fun v x -> { x with otherResponseBytes = v });
    }
    let textResponseBytes = {
      GapiLens.get = (fun x -> x.textResponseBytes);
      GapiLens.set = (fun v x -> { x with textResponseBytes = v });
    }
    let totalRequestBytes = {
      GapiLens.get = (fun x -> x.totalRequestBytes);
      GapiLens.set = (fun v x -> { x with totalRequestBytes = v });
    }
    
    let empty = {
      cssResponseBytes = "";
      flashResponseBytes = "";
      htmlResponseBytes = "";
      imageResponseBytes = "";
      javascriptResponseBytes = "";
      numberCssResources = 0;
      numberHosts = 0;
      numberJsResources = 0;
      numberResources = 0;
      numberStaticResources = 0;
      otherResponseBytes = "";
      textResponseBytes = "";
      totalRequestBytes = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "cssResponseBytes" x.cssResponseBytes;
        GapiJson.render_string_value "flashResponseBytes" x.flashResponseBytes;
        GapiJson.render_string_value "htmlResponseBytes" x.htmlResponseBytes;
        GapiJson.render_string_value "imageResponseBytes" x.imageResponseBytes;
        GapiJson.render_string_value "javascriptResponseBytes" x.javascriptResponseBytes;
        GapiJson.render_int_value "numberCssResources" x.numberCssResources;
        GapiJson.render_int_value "numberHosts" x.numberHosts;
        GapiJson.render_int_value "numberJsResources" x.numberJsResources;
        GapiJson.render_int_value "numberResources" x.numberResources;
        GapiJson.render_int_value "numberStaticResources" x.numberStaticResources;
        GapiJson.render_string_value "otherResponseBytes" x.otherResponseBytes;
        GapiJson.render_string_value "textResponseBytes" x.textResponseBytes;
        GapiJson.render_string_value "totalRequestBytes" x.totalRequestBytes;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "cssResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with cssResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "flashResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with flashResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "htmlResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with htmlResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "imageResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with imageResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "javascriptResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with javascriptResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberCssResources"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with numberCssResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberHosts"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with numberHosts = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberJsResources"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with numberJsResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberResources"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with numberResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberStaticResources"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with numberStaticResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "otherResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with otherResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "textResponseBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with textResponseBytes = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "totalRequestBytes"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with totalRequestBytes = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPagespeedonlineV1Model.PageStatsData.parse" e x
    
  end
  
  module FormattedResultsData =
  struct
    module RuleResultsData =
    struct
      module UrlBlocksData =
      struct
        module UrlsData =
        struct
          module ResultData =
          struct
            module ArgsData =
            struct
              type t = {
                _type : string;
                value : string;
                
              }
              
              let _type = {
                GapiLens.get = (fun x -> x._type);
                GapiLens.set = (fun v x -> { x with _type = v });
              }
              let value = {
                GapiLens.get = (fun x -> x.value);
                GapiLens.set = (fun v x -> { x with value = v });
              }
              
              let empty = {
                _type = "";
                value = "";
                
              }
              
              let rec render_content x = 
                 [
                  GapiJson.render_string_value "type" x._type;
                  GapiJson.render_string_value "value" x.value;
                  
                ]
              and render x = 
                GapiJson.render_object "" (render_content x)
              
              let rec parse x = function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
                    Json_type.String v) ->
                  { x with _type = v }
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                    Json_type.String v) ->
                  { x with value = v }
                | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                  GapiJson.parse_children parse empty (fun x -> x) cs
                | e ->
                  GapiJson.unexpected "GapiPagespeedonlineV1Model.ArgsData.parse" e x
              
            end
            
            type t = {
              args : ArgsData.t list;
              format : string;
              
            }
            
            let args = {
              GapiLens.get = (fun x -> x.args);
              GapiLens.set = (fun v x -> { x with args = v });
            }
            let format = {
              GapiLens.get = (fun x -> x.format);
              GapiLens.set = (fun v x -> { x with format = v });
            }
            
            let empty = {
              args = [];
              format = "";
              
            }
            
            let rec render_content x = 
               [
                GapiJson.render_array "args" ArgsData.render x.args;
                GapiJson.render_string_value "format" x.format;
                
              ]
            and render x = 
              GapiJson.render_object "" (render_content x)
            
            let rec parse x = function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = "args"; data_type = GapiJson.Array },
                  cs) ->
                GapiJson.parse_collection
                  (fun x' -> function
                    | GapiCore.AnnotatedTree.Node
                        ({ GapiJson.name = ""; data_type = GapiJson.Object },
                        cs) ->
                      GapiJson.parse_children
                        ArgsData.parse
                        ArgsData.empty
                        (fun v -> v)
                        cs
                    | e ->
                      GapiJson.unexpected "GapiPagespeedonlineV1Model.ResultData.parse.parse_collection" e x')
                  ArgsData.empty
                  (fun v -> { x with args = v })
                  cs
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
                  Json_type.String v) ->
                { x with format = v }
              | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
                GapiJson.parse_children parse empty (fun x -> x) cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.ResultData.parse" e x
            
          end
          
          module DetailsData =
          struct
            module ArgsData =
            struct
              type t = {
                _type : string;
                value : string;
                
              }
              
              let _type = {
                GapiLens.get = (fun x -> x._type);
                GapiLens.set = (fun v x -> { x with _type = v });
              }
              let value = {
                GapiLens.get = (fun x -> x.value);
                GapiLens.set = (fun v x -> { x with value = v });
              }
              
              let empty = {
                _type = "";
                value = "";
                
              }
              
              let rec render_content x = 
                 [
                  GapiJson.render_string_value "type" x._type;
                  GapiJson.render_string_value "value" x.value;
                  
                ]
              and render x = 
                GapiJson.render_object "" (render_content x)
              
              let rec parse x = function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
                    Json_type.String v) ->
                  { x with _type = v }
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                    Json_type.String v) ->
                  { x with value = v }
                | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                  GapiJson.parse_children parse empty (fun x -> x) cs
                | e ->
                  GapiJson.unexpected "GapiPagespeedonlineV1Model.ArgsData.parse" e x
              
            end
            
            type t = {
              args : ArgsData.t list;
              format : string;
              
            }
            
            let args = {
              GapiLens.get = (fun x -> x.args);
              GapiLens.set = (fun v x -> { x with args = v });
            }
            let format = {
              GapiLens.get = (fun x -> x.format);
              GapiLens.set = (fun v x -> { x with format = v });
            }
            
            let empty = {
              args = [];
              format = "";
              
            }
            
            let rec render_content x = 
               [
                GapiJson.render_array "args" ArgsData.render x.args;
                GapiJson.render_string_value "format" x.format;
                
              ]
            and render x = 
              GapiJson.render_object "" (render_content x)
            
            let rec parse x = function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = "args"; data_type = GapiJson.Array },
                  cs) ->
                GapiJson.parse_collection
                  (fun x' -> function
                    | GapiCore.AnnotatedTree.Node
                        ({ GapiJson.name = ""; data_type = GapiJson.Object },
                        cs) ->
                      GapiJson.parse_children
                        ArgsData.parse
                        ArgsData.empty
                        (fun v -> v)
                        cs
                    | e ->
                      GapiJson.unexpected "GapiPagespeedonlineV1Model.DetailsData.parse.parse_collection" e x')
                  ArgsData.empty
                  (fun v -> { x with args = v })
                  cs
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
                  Json_type.String v) ->
                { x with format = v }
              | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
                GapiJson.parse_children parse empty (fun x -> x) cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.DetailsData.parse" e x
            
          end
          
          type t = {
            details : DetailsData.t list;
            result : ResultData.t;
            
          }
          
          let details = {
            GapiLens.get = (fun x -> x.details);
            GapiLens.set = (fun v x -> { x with details = v });
          }
          let result = {
            GapiLens.get = (fun x -> x.result);
            GapiLens.set = (fun v x -> { x with result = v });
          }
          
          let empty = {
            details = [];
            result = ResultData.empty;
            
          }
          
          let rec render_content x = 
             [
              GapiJson.render_array "details" DetailsData.render x.details;
              (fun v -> GapiJson.render_object "result" (ResultData.render_content v)) x.result;
              
            ]
          and render x = 
            GapiJson.render_object "" (render_content x)
          
          let rec parse x = function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = "details"; data_type = GapiJson.Array },
                cs) ->
              GapiJson.parse_collection
                (fun x' -> function
                  | GapiCore.AnnotatedTree.Node
                      ({ GapiJson.name = ""; data_type = GapiJson.Object },
                      cs) ->
                    GapiJson.parse_children
                      DetailsData.parse
                      DetailsData.empty
                      (fun v -> v)
                      cs
                  | e ->
                    GapiJson.unexpected "GapiPagespeedonlineV1Model.UrlsData.parse.parse_collection" e x')
                DetailsData.empty
                (fun v -> { x with details = v })
                cs
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = "result"; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                ResultData.parse
                ResultData.empty
                (fun v -> { x with result = v })
                cs
            | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
              GapiJson.parse_children parse empty (fun x -> x) cs
            | e ->
              GapiJson.unexpected "GapiPagespeedonlineV1Model.UrlsData.parse" e x
          
        end
        
        module HeaderData =
        struct
          module ArgsData =
          struct
            type t = {
              _type : string;
              value : string;
              
            }
            
            let _type = {
              GapiLens.get = (fun x -> x._type);
              GapiLens.set = (fun v x -> { x with _type = v });
            }
            let value = {
              GapiLens.get = (fun x -> x.value);
              GapiLens.set = (fun v x -> { x with value = v });
            }
            
            let empty = {
              _type = "";
              value = "";
              
            }
            
            let rec render_content x = 
               [
                GapiJson.render_string_value "type" x._type;
                GapiJson.render_string_value "value" x.value;
                
              ]
            and render x = 
              GapiJson.render_object "" (render_content x)
            
            let rec parse x = function
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
                  Json_type.String v) ->
                { x with _type = v }
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                  Json_type.String v) ->
                { x with value = v }
              | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
                GapiJson.parse_children parse empty (fun x -> x) cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.ArgsData.parse" e x
            
          end
          
          type t = {
            args : ArgsData.t list;
            format : string;
            
          }
          
          let args = {
            GapiLens.get = (fun x -> x.args);
            GapiLens.set = (fun v x -> { x with args = v });
          }
          let format = {
            GapiLens.get = (fun x -> x.format);
            GapiLens.set = (fun v x -> { x with format = v });
          }
          
          let empty = {
            args = [];
            format = "";
            
          }
          
          let rec render_content x = 
             [
              GapiJson.render_array "args" ArgsData.render x.args;
              GapiJson.render_string_value "format" x.format;
              
            ]
          and render x = 
            GapiJson.render_object "" (render_content x)
          
          let rec parse x = function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = "args"; data_type = GapiJson.Array },
                cs) ->
              GapiJson.parse_collection
                (fun x' -> function
                  | GapiCore.AnnotatedTree.Node
                      ({ GapiJson.name = ""; data_type = GapiJson.Object },
                      cs) ->
                    GapiJson.parse_children
                      ArgsData.parse
                      ArgsData.empty
                      (fun v -> v)
                      cs
                  | e ->
                    GapiJson.unexpected "GapiPagespeedonlineV1Model.HeaderData.parse.parse_collection" e x')
                ArgsData.empty
                (fun v -> { x with args = v })
                cs
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
                Json_type.String v) ->
              { x with format = v }
            | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
              GapiJson.parse_children parse empty (fun x -> x) cs
            | e ->
              GapiJson.unexpected "GapiPagespeedonlineV1Model.HeaderData.parse" e x
          
        end
        
        type t = {
          header : HeaderData.t;
          urls : UrlsData.t list;
          
        }
        
        let header = {
          GapiLens.get = (fun x -> x.header);
          GapiLens.set = (fun v x -> { x with header = v });
        }
        let urls = {
          GapiLens.get = (fun x -> x.urls);
          GapiLens.set = (fun v x -> { x with urls = v });
        }
        
        let empty = {
          header = HeaderData.empty;
          urls = [];
          
        }
        
        let rec render_content x = 
           [
            (fun v -> GapiJson.render_object "header" (HeaderData.render_content v)) x.header;
            GapiJson.render_array "urls" UrlsData.render x.urls;
            
          ]
        and render x = 
          GapiJson.render_object "" (render_content x)
        
        let rec parse x = function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = "header"; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              HeaderData.parse
              HeaderData.empty
              (fun v -> { x with header = v })
              cs
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = "urls"; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Node
                    ({ GapiJson.name = ""; data_type = GapiJson.Object },
                    cs) ->
                  GapiJson.parse_children
                    UrlsData.parse
                    UrlsData.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiPagespeedonlineV1Model.UrlBlocksData.parse.parse_collection" e x')
              UrlsData.empty
              (fun v -> { x with urls = v })
              cs
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPagespeedonlineV1Model.UrlBlocksData.parse" e x
        
      end
      
      type t = {
        localizedRuleName : string;
        ruleImpact : float;
        ruleScore : int;
        urlBlocks : UrlBlocksData.t list;
        
      }
      
      let localizedRuleName = {
        GapiLens.get = (fun x -> x.localizedRuleName);
        GapiLens.set = (fun v x -> { x with localizedRuleName = v });
      }
      let ruleImpact = {
        GapiLens.get = (fun x -> x.ruleImpact);
        GapiLens.set = (fun v x -> { x with ruleImpact = v });
      }
      let ruleScore = {
        GapiLens.get = (fun x -> x.ruleScore);
        GapiLens.set = (fun v x -> { x with ruleScore = v });
      }
      let urlBlocks = {
        GapiLens.get = (fun x -> x.urlBlocks);
        GapiLens.set = (fun v x -> { x with urlBlocks = v });
      }
      
      let empty = {
        localizedRuleName = "";
        ruleImpact = 0.0;
        ruleScore = 0;
        urlBlocks = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "localizedRuleName" x.localizedRuleName;
          GapiJson.render_float_value "ruleImpact" x.ruleImpact;
          GapiJson.render_int_value "ruleScore" x.ruleScore;
          GapiJson.render_array "urlBlocks" UrlBlocksData.render x.urlBlocks;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "localizedRuleName"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with localizedRuleName = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "ruleImpact"; data_type = GapiJson.Scalar },
            Json_type.Float v) ->
          { x with ruleImpact = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "ruleImpact"; data_type = GapiJson.Scalar },
            Json_type.Int v) ->
          { x with ruleImpact = float_of_int v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "ruleScore"; data_type = GapiJson.Scalar },
            Json_type.Int v) ->
          { x with ruleScore = v }
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "urlBlocks"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  UrlBlocksData.parse
                  UrlBlocksData.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.RuleResultsData.parse.parse_collection" e x')
            UrlBlocksData.empty
            (fun v -> { x with urlBlocks = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiPagespeedonlineV1Model.RuleResultsData.parse" e x
      
    end
    
    type t = {
      locale : string;
      ruleResults : (string * RuleResultsData.t) list;
      
    }
    
    let locale = {
      GapiLens.get = (fun x -> x.locale);
      GapiLens.set = (fun v x -> { x with locale = v });
    }
    let ruleResults = {
      GapiLens.get = (fun x -> x.ruleResults);
      GapiLens.set = (fun v x -> { x with ruleResults = v });
    }
    
    let empty = {
      locale = "";
      ruleResults = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "locale" x.locale;
        GapiJson.render_collection "ruleResults" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RuleResultsData.render_content v)) v) x.ruleResults;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "locale"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with locale = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "ruleResults"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = n; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                RuleResultsData.parse
                RuleResultsData.empty
                (fun v -> (n, v))
                cs
            | e ->
              GapiJson.unexpected "GapiPagespeedonlineV1Model.FormattedResultsData.parse.parse_dictionary" e x')
          ("", RuleResultsData.empty)
          (fun v -> { x with ruleResults = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPagespeedonlineV1Model.FormattedResultsData.parse" e x
    
  end
  
  type t = {
    formattedResults : FormattedResultsData.t;
    id : string;
    invalidRules : string list;
    kind : string;
    pageStats : PageStatsData.t;
    responseCode : int;
    score : int;
    title : string;
    version : VersionData.t;
    
  }
  
  let formattedResults = {
    GapiLens.get = (fun x -> x.formattedResults);
    GapiLens.set = (fun v x -> { x with formattedResults = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let invalidRules = {
    GapiLens.get = (fun x -> x.invalidRules);
    GapiLens.set = (fun v x -> { x with invalidRules = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let pageStats = {
    GapiLens.get = (fun x -> x.pageStats);
    GapiLens.set = (fun v x -> { x with pageStats = v });
  }
  let responseCode = {
    GapiLens.get = (fun x -> x.responseCode);
    GapiLens.set = (fun v x -> { x with responseCode = v });
  }
  let score = {
    GapiLens.get = (fun x -> x.score);
    GapiLens.set = (fun v x -> { x with score = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let version = {
    GapiLens.get = (fun x -> x.version);
    GapiLens.set = (fun v x -> { x with version = v });
  }
  
  let empty = {
    formattedResults = FormattedResultsData.empty;
    id = "";
    invalidRules = [];
    kind = "";
    pageStats = PageStatsData.empty;
    responseCode = 0;
    score = 0;
    title = "";
    version = VersionData.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "formattedResults" (FormattedResultsData.render_content v)) x.formattedResults;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "invalidRules" (GapiJson.render_string_value "") x.invalidRules;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "pageStats" (PageStatsData.render_content v)) x.pageStats;
      GapiJson.render_int_value "responseCode" x.responseCode;
      GapiJson.render_int_value "score" x.score;
      GapiJson.render_string_value "title" x.title;
      (fun v -> GapiJson.render_object "version" (VersionData.render_content v)) x.version;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "formattedResults"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FormattedResultsData.parse
        FormattedResultsData.empty
        (fun v -> { x with formattedResults = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "invalidRules"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiPagespeedonlineV1Model.Result.parse.parse_collection" e x')
        ""
        (fun v -> { x with invalidRules = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pageStats"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PageStatsData.parse
        PageStatsData.empty
        (fun v -> { x with pageStats = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseCode"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with responseCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "score"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with score = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "version"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        VersionData.parse
        VersionData.empty
        (fun v -> { x with version = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiPagespeedonlineV1Model.Result.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

