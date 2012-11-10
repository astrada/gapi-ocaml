(* Warning! This file is generated. Modify at your own risk. *)

module Result =
struct
  module Version =
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
          `Int v) ->
        { x with major = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "minor"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with minor = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPagespeedonlineV1Model.Version.parse" e x
    
  end
  
  module PageStats =
  struct
    type t = {
      cssResponseBytes : int64;
      flashResponseBytes : int64;
      htmlResponseBytes : int64;
      imageResponseBytes : int64;
      javascriptResponseBytes : int64;
      numberCssResources : int;
      numberHosts : int;
      numberJsResources : int;
      numberResources : int;
      numberStaticResources : int;
      otherResponseBytes : int64;
      textResponseBytes : int64;
      totalRequestBytes : int64;
      
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
      cssResponseBytes = 0L;
      flashResponseBytes = 0L;
      htmlResponseBytes = 0L;
      imageResponseBytes = 0L;
      javascriptResponseBytes = 0L;
      numberCssResources = 0;
      numberHosts = 0;
      numberJsResources = 0;
      numberResources = 0;
      numberStaticResources = 0;
      otherResponseBytes = 0L;
      textResponseBytes = 0L;
      totalRequestBytes = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "cssResponseBytes" x.cssResponseBytes;
        GapiJson.render_int64_value "flashResponseBytes" x.flashResponseBytes;
        GapiJson.render_int64_value "htmlResponseBytes" x.htmlResponseBytes;
        GapiJson.render_int64_value "imageResponseBytes" x.imageResponseBytes;
        GapiJson.render_int64_value "javascriptResponseBytes" x.javascriptResponseBytes;
        GapiJson.render_int_value "numberCssResources" x.numberCssResources;
        GapiJson.render_int_value "numberHosts" x.numberHosts;
        GapiJson.render_int_value "numberJsResources" x.numberJsResources;
        GapiJson.render_int_value "numberResources" x.numberResources;
        GapiJson.render_int_value "numberStaticResources" x.numberStaticResources;
        GapiJson.render_int64_value "otherResponseBytes" x.otherResponseBytes;
        GapiJson.render_int64_value "textResponseBytes" x.textResponseBytes;
        GapiJson.render_int64_value "totalRequestBytes" x.totalRequestBytes;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "cssResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with cssResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "flashResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with flashResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "htmlResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with htmlResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "imageResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with imageResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "javascriptResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with javascriptResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberCssResources"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with numberCssResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberHosts"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with numberHosts = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberJsResources"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with numberJsResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberResources"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with numberResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "numberStaticResources"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with numberStaticResources = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "otherResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with otherResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "textResponseBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with textResponseBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "totalRequestBytes"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with totalRequestBytes = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPagespeedonlineV1Model.PageStats.parse" e x
    
  end
  
  module FormattedResults =
  struct
    module RuleResults =
    struct
      module UrlBlocks =
      struct
        module Urls =
        struct
          module Result =
          struct
            module Args =
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
                    `String v) ->
                  { x with _type = v }
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                    `String v) ->
                  { x with value = v }
                | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                  GapiJson.parse_children parse empty (fun x -> x) cs
                | e ->
                  GapiJson.unexpected "GapiPagespeedonlineV1Model.Args.parse" e x
              
            end
            
            type t = {
              args : Args.t list;
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
                GapiJson.render_array "args" Args.render x.args;
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
                        Args.parse
                        Args.empty
                        (fun v -> v)
                        cs
                    | e ->
                      GapiJson.unexpected "GapiPagespeedonlineV1Model.Result.parse.parse_collection" e x')
                  Args.empty
                  (fun v -> { x with args = v })
                  cs
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
                  `String v) ->
                { x with format = v }
              | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
                GapiJson.parse_children parse empty (fun x -> x) cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.Result.parse" e x
            
          end
          
          module Details =
          struct
            module Args =
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
                    `String v) ->
                  { x with _type = v }
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                    `String v) ->
                  { x with value = v }
                | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = ""; data_type = GapiJson.Object },
                  cs) ->
                  GapiJson.parse_children parse empty (fun x -> x) cs
                | e ->
                  GapiJson.unexpected "GapiPagespeedonlineV1Model.Args.parse" e x
              
            end
            
            type t = {
              args : Args.t list;
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
                GapiJson.render_array "args" Args.render x.args;
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
                        Args.parse
                        Args.empty
                        (fun v -> v)
                        cs
                    | e ->
                      GapiJson.unexpected "GapiPagespeedonlineV1Model.Details.parse.parse_collection" e x')
                  Args.empty
                  (fun v -> { x with args = v })
                  cs
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
                  `String v) ->
                { x with format = v }
              | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
                GapiJson.parse_children parse empty (fun x -> x) cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.Details.parse" e x
            
          end
          
          type t = {
            details : Details.t list;
            result : Result.t;
            
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
            result = Result.empty;
            
          }
          
          let rec render_content x = 
             [
              GapiJson.render_array "details" Details.render x.details;
              (fun v -> GapiJson.render_object "result" (Result.render_content v)) x.result;
              
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
                      Details.parse
                      Details.empty
                      (fun v -> v)
                      cs
                  | e ->
                    GapiJson.unexpected "GapiPagespeedonlineV1Model.Urls.parse.parse_collection" e x')
                Details.empty
                (fun v -> { x with details = v })
                cs
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = "result"; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                Result.parse
                Result.empty
                (fun v -> { x with result = v })
                cs
            | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
              GapiJson.parse_children parse empty (fun x -> x) cs
            | e ->
              GapiJson.unexpected "GapiPagespeedonlineV1Model.Urls.parse" e x
          
        end
        
        module Header =
        struct
          module Args =
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
                  `String v) ->
                { x with _type = v }
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
                  `String v) ->
                { x with value = v }
              | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
                GapiJson.parse_children parse empty (fun x -> x) cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.Args.parse" e x
            
          end
          
          type t = {
            args : Args.t list;
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
              GapiJson.render_array "args" Args.render x.args;
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
                      Args.parse
                      Args.empty
                      (fun v -> v)
                      cs
                  | e ->
                    GapiJson.unexpected "GapiPagespeedonlineV1Model.Header.parse.parse_collection" e x')
                Args.empty
                (fun v -> { x with args = v })
                cs
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
                `String v) ->
              { x with format = v }
            | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
              GapiJson.parse_children parse empty (fun x -> x) cs
            | e ->
              GapiJson.unexpected "GapiPagespeedonlineV1Model.Header.parse" e x
          
        end
        
        type t = {
          header : Header.t;
          urls : Urls.t list;
          
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
          header = Header.empty;
          urls = [];
          
        }
        
        let rec render_content x = 
           [
            (fun v -> GapiJson.render_object "header" (Header.render_content v)) x.header;
            GapiJson.render_array "urls" Urls.render x.urls;
            
          ]
        and render x = 
          GapiJson.render_object "" (render_content x)
        
        let rec parse x = function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = "header"; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Header.parse
              Header.empty
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
                    Urls.parse
                    Urls.empty
                    (fun v -> v)
                    cs
                | e ->
                  GapiJson.unexpected "GapiPagespeedonlineV1Model.UrlBlocks.parse.parse_collection" e x')
              Urls.empty
              (fun v -> { x with urls = v })
              cs
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiPagespeedonlineV1Model.UrlBlocks.parse" e x
        
      end
      
      type t = {
        localizedRuleName : string;
        ruleImpact : float;
        ruleScore : int;
        urlBlocks : UrlBlocks.t list;
        
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
          GapiJson.render_array "urlBlocks" UrlBlocks.render x.urlBlocks;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "localizedRuleName"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with localizedRuleName = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "ruleImpact"; data_type = GapiJson.Scalar },
            `Float v) ->
          { x with ruleImpact = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "ruleImpact"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with ruleImpact = float_of_int v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "ruleScore"; data_type = GapiJson.Scalar },
            `Int v) ->
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
                  UrlBlocks.parse
                  UrlBlocks.empty
                  (fun v -> v)
                  cs
              | e ->
                GapiJson.unexpected "GapiPagespeedonlineV1Model.RuleResults.parse.parse_collection" e x')
            UrlBlocks.empty
            (fun v -> { x with urlBlocks = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiPagespeedonlineV1Model.RuleResults.parse" e x
      
    end
    
    type t = {
      locale : string;
      ruleResults : (string * RuleResults.t) list;
      
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
        GapiJson.render_collection "ruleResults" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RuleResults.render_content v)) v) x.ruleResults;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "locale"; data_type = GapiJson.Scalar },
          `String v) ->
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
                RuleResults.parse
                RuleResults.empty
                (fun v -> (n, v))
                cs
            | e ->
              GapiJson.unexpected "GapiPagespeedonlineV1Model.FormattedResults.parse.parse_dictionary" e x')
          ("", RuleResults.empty)
          (fun v -> { x with ruleResults = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiPagespeedonlineV1Model.FormattedResults.parse" e x
    
  end
  
  type t = {
    formattedResults : FormattedResults.t;
    id : string;
    invalidRules : string list;
    kind : string;
    pageStats : PageStats.t;
    responseCode : int;
    score : int;
    title : string;
    version : Version.t;
    
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
    formattedResults = FormattedResults.empty;
    id = "";
    invalidRules = [];
    kind = "";
    pageStats = PageStats.empty;
    responseCode = 0;
    score = 0;
    title = "";
    version = Version.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "formattedResults" (FormattedResults.render_content v)) x.formattedResults;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "invalidRules" (GapiJson.render_string_value "") x.invalidRules;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "pageStats" (PageStats.render_content v)) x.pageStats;
      GapiJson.render_int_value "responseCode" x.responseCode;
      GapiJson.render_int_value "score" x.score;
      GapiJson.render_string_value "title" x.title;
      (fun v -> GapiJson.render_object "version" (Version.render_content v)) x.version;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "formattedResults"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FormattedResults.parse
        FormattedResults.empty
        (fun v -> { x with formattedResults = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "invalidRules"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiPagespeedonlineV1Model.Result.parse.parse_collection" e x')
        ""
        (fun v -> { x with invalidRules = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "pageStats"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        PageStats.parse
        PageStats.empty
        (fun v -> { x with pageStats = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseCode"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with responseCode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "score"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with score = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "version"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Version.parse
        Version.empty
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

