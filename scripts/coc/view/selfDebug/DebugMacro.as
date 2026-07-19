package coc.view.selfDebug
{
   import haxe.macro.Binop;
   import haxe.macro.ComplexType;
   import haxe.macro.Constant;
   import haxe.macro.ExprDef;
   import haxe.macro.ExprTools;
   import haxe.macro.FunctionKind;
   
   public class DebugMacro
   {
      
      public function DebugMacro()
      {
      }
      
      public static function toStringExpr(param1:Object) : Object
      {
         return {
            "expr":ExprDef.EConst(Constant.CString(ExprTools.toString(param1))),
            "pos":param1.pos
         };
      }
      
      public static function buildComp(param1:Object, param2:Object, param3:Object) : Object
      {
         var _loc4_:* = DebugMacro.toStringExpr(param2);
         return {
            "expr":ExprDef.ENew({
               "name":"DebugComp",
               "params":[],
               "pack":["coc","view","selfDebug"]
            },[_loc4_,param3,param1]),
            "pos":param1.pos
         };
      }
      
      public static function simpleExpr(param1:Object, param2:Object = undefined) : Object
      {
         var _loc3_:* = {
            "expr":ExprDef.EFunction(FunctionKind.FArrow,{
               "args":[{
                  "name":"value",
                  "opt":false,
                  "type":null
               }],
               "ret":null,
               "expr":{
                  "expr":ExprDef.EMeta({
                     "name":":implicitReturn",
                     "params":[],
                     "pos":{
                        "file":"?",
                        "min":-1,
                        "max":-1
                     }
                  },{
                     "expr":ExprDef.EReturn({
                        "expr":ExprDef.EBinop(Binop.OpAssign,param1,{
                           "expr":ExprDef.EConst(Constant.CIdent("value")),
                           "pos":{
                              "file":"src/coc/view/selfDebug/DebugMacro.hx",
                              "min":721,
                              "max":726
                           }
                        }),
                        "pos":{
                           "file":"src/coc/view/selfDebug/DebugMacro.hx",
                           "min":716,
                           "max":726
                        }
                     }),
                     "pos":{
                        "file":"src/coc/view/selfDebug/DebugMacro.hx",
                        "min":716,
                        "max":726
                     }
                  }),
                  "pos":{
                     "file":"src/coc/view/selfDebug/DebugMacro.hx",
                     "min":716,
                     "max":726
                  }
               },
               "params":[]
            }),
            "pos":{
               "file":"src/coc/view/selfDebug/DebugMacro.hx",
               "min":707,
               "max":726
            }
         };
         var _loc4_:* = {
            "expr":ExprDef.ENew({
               "name":"ActualComponent",
               "params":[],
               "pack":["coc","view","selfDebug"]
            },[param1,_loc3_]),
            "pos":param1.pos
         };
         if(param2 == null)
         {
            param2 = {
               "expr":ExprDef.EConst(Constant.CString("")),
               "pos":param1.pos
            };
         }
         return DebugMacro.buildComp(_loc4_,param1,param2);
      }
   }
}

