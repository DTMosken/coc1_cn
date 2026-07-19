package haxe.macro
{
   import flash.Boot;
   
   public class Printer
   {
      
      public var tabs:String;
      
      public var tabString:String;
      
      public function Printer(param1:String = undefined)
      {
         if(param1 == null)
         {
            param1 = "\t";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         tabs = "";
         tabString = param1;
      }
      
      public function printVar(param1:Object) : String
      {
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Function;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null;
         var _loc2_:String = param1.name + opt(param1.type,printComplexType,":") + opt(param1.expr,printExpr," = ");
         var _loc3_:Array = param1.meta;
         if(_loc3_ == null)
         {
            return _loc2_;
         }
         if(int(_loc3_.length) == 0)
         {
            return _loc2_;
         }
         _loc4_ = _loc3_;
         _loc5_ = printMetadata;
         _loc6_ = [];
         _loc7_ = 0;
         _loc8_ = _loc4_;
         while(_loc7_ < int(_loc8_.length))
         {
            _loc9_ = _loc8_[_loc7_];
            _loc7_++;
            _loc6_.push(_loc5_(_loc9_));
         }
         return _loc6_.join(" ") + " " + _loc2_;
      }
      
      public function printUnop(param1:Unop) : String
      {
         switch(param1.index)
         {
            case 0:
               return "++";
            case 1:
               return "--";
            case 2:
               return "!";
            case 3:
               return "-";
            case 4:
               return "~";
            case 5:
               return "...";
            default:
               return;
         }
      }
      
      public function printTypePath(param1:Object) : String
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Function;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as TypeParam;
         var _loc2_:String = (int(param1.pack.length) > 0 ? param1.pack.join(".") + "." : "") + param1.name + (param1.sub != null ? "." + param1.sub : "");
         if(param1.params == null)
         {
            _loc3_ = "";
         }
         else if(int(param1.params.length) > 0)
         {
            _loc4_ = printTypeParam;
            _loc5_ = [];
            _loc6_ = 0;
            _loc7_ = param1.params;
            while(_loc6_ < int(_loc7_.length))
            {
               _loc8_ = _loc7_[_loc6_];
               _loc6_++;
               _loc5_.push(_loc4_(_loc8_));
            }
            _loc3_ = "<" + _loc5_.join(", ") + ">";
         }
         else
         {
            _loc3_ = "";
         }
         return _loc2_ + _loc3_;
      }
      
      public function printTypeParamDecl(param1:Object) : String
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as Function;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null;
         var _loc9_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:* = null as ComplexType;
         if(param1.meta != null && int(param1.meta.length) > 0)
         {
            _loc3_ = printMetadata;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = param1.meta;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               _loc4_.push(_loc3_(_loc7_));
            }
            _loc2_ = _loc4_.join(" ") + " ";
         }
         else
         {
            _loc2_ = "";
         }
         var _loc8_:String = _loc2_ + param1.name;
         if(param1.params != null && int(param1.params.length) > 0)
         {
            _loc3_ = printTypeParamDecl;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = param1.params;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               _loc4_.push(_loc3_(_loc7_));
            }
            _loc9_ = "<" + _loc4_.join(", ") + ">";
         }
         else
         {
            _loc9_ = "";
         }
         var _loc10_:String = _loc8_ + _loc9_;
         if(param1.constraints != null && int(param1.constraints.length) > 0)
         {
            _loc3_ = printComplexType;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = param1.constraints;
            while(_loc5_ < int(_loc6_.length))
            {
               _loc12_ = _loc6_[_loc5_];
               _loc5_++;
               _loc4_.push(_loc3_(_loc12_));
            }
            _loc11_ = ":(" + _loc4_.join(", ") + ")";
         }
         else
         {
            _loc11_ = "";
         }
         return _loc10_ + _loc11_ + (param1.defaultType != null ? "=" + printComplexType(param1.defaultType) : "");
      }
      
      public function printTypeParam(param1:TypeParam) : String
      {
         var _loc2_:* = null as ComplexType;
         var _loc3_:* = null;
         switch(param1.index)
         {
            case 0:
               _loc2_ = param1.params[0];
               return printComplexType(_loc2_);
            case 1:
               _loc3_ = param1.params[0];
               return printExpr(_loc3_);
            default:
               return;
         }
      }
      
      public function printString(param1:String) : String
      {
         return escapeString(param1,"\"");
      }
      
      public function printObjectFieldKey(param1:Object) : String
      {
         var _loc2_:QuoteStatus = param1.quotes;
         if(_loc2_ == null)
         {
            return param1.field;
         }
         switch(_loc2_.index)
         {
            case 0:
               return param1.field;
            case 1:
               return "\"" + param1.field + "\"";
            default:
               return;
         }
      }
      
      public function printObjectField(param1:Object) : String
      {
         return "" + printObjectFieldKey(param1) + " : " + printExpr(param1.expr);
      }
      
      public function printMetadata(param1:Object) : String
      {
         return "@" + param1.name + (param1.params != null && int(param1.params.length) > 0 ? "(" + printExprs(param1.params,", ") + ")" : "");
      }
      
      public function printFunctionArg(param1:Object) : String
      {
         return (param1.opt ? "?" : "") + param1.name + opt(param1.type,printComplexType,":") + opt(param1.value,printExpr," = ");
      }
      
      public function printFunction(param1:Object, param2:FunctionKind = undefined) : String
      {
         var _loc3_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         var _loc8_:* = null as Object;
         var _loc9_:* = null;
         var _loc10_:* = null as Function;
         var _loc11_:int = 0;
         var _loc12_:* = null as Array;
         var _loc4_:Array = param1.args;
         if(int(_loc4_.length) == 1)
         {
            _loc5_ = _loc4_[0];
            _loc6_ = _loc5_.meta;
            _loc7_ = _loc5_.name;
            _loc8_ = _loc5_.opt;
            _loc9_ = _loc5_.value;
            _loc3_ = _loc5_.type == null && param2 == FunctionKind.FArrow;
         }
         else
         {
            _loc3_ = false;
         }
         if(param1.params == null)
         {
            _loc7_ = "";
         }
         else if(int(param1.params.length) > 0)
         {
            _loc10_ = printTypeParamDecl;
            _loc6_ = [];
            _loc11_ = 0;
            _loc12_ = param1.params;
            while(_loc11_ < int(_loc12_.length))
            {
               _loc5_ = _loc12_[_loc11_];
               _loc11_++;
               _loc6_.push(_loc10_(_loc5_));
            }
            _loc7_ = "<" + _loc6_.join(", ") + ">";
         }
         else
         {
            _loc7_ = "";
         }
         var _loc13_:String = _loc7_ + (_loc3_ ? "" : "(");
         _loc10_ = printFunctionArg;
         _loc6_ = [];
         _loc11_ = 0;
         _loc12_ = param1.args;
         while(_loc11_ < int(_loc12_.length))
         {
            _loc5_ = _loc12_[_loc11_];
            _loc11_++;
            _loc6_.push(_loc10_(_loc5_));
         }
         return _loc13_ + _loc6_.join(", ") + (_loc3_ ? "" : ")") + (param2 == FunctionKind.FArrow ? " ->" : "") + opt(param1.ret,printComplexType,":") + opt(param1.expr,printExpr," ");
      }
      
      public function printFormatString(param1:String) : String
      {
         return escapeString(param1,"\'");
      }
      
      public function printField(param1:Object) : String
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Function;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:* = null;
         var _loc10_:* = null as String;
         var _loc11_:* = null as Array;
         var _loc12_:* = null as Array;
         var _loc13_:* = null as Access;
         var _loc16_:* = null as String;
         var _loc17_:* = null as ComplexType;
         var _loc18_:* = null as String;
         var _loc19_:* = null as String;
         var _loc2_:String = param1.doc != null && param1.doc != "" ? "/**\n" + tabs + tabString + StringTools.replace(param1.doc,"\n","\n" + tabs + tabString) + "\n" + tabs + "**/\n" + tabs : "";
         if(param1.meta != null && int(param1.meta.length) > 0)
         {
            _loc4_ = printMetadata;
            _loc5_ = [];
            _loc6_ = 0;
            _loc7_ = param1.meta;
            while(_loc6_ < int(_loc7_.length))
            {
               _loc8_ = _loc7_[_loc6_];
               _loc6_++;
               _loc5_.push(_loc4_(_loc8_));
            }
            _loc3_ = _loc5_.join("\n" + tabs) + ("\n" + tabs);
         }
         else
         {
            _loc3_ = "";
         }
         var _loc9_:String = _loc2_ + _loc3_;
         if(param1.access != null && int(param1.access.length) > 0)
         {
            _loc5_ = param1.access;
            if(Lambda.has(_loc5_,Access.AFinal))
            {
               _loc11_ = [];
               _loc6_ = 0;
               _loc12_ = _loc5_;
               while(_loc6_ < int(_loc12_.length))
               {
                  _loc13_ = _loc12_[_loc6_];
                  _loc6_++;
                  if(_loc13_.index != 7)
                  {
                     _loc11_.push(_loc13_);
                  }
               }
               _loc7_ = _loc11_.concat([Access.AFinal]);
            }
            else
            {
               _loc7_ = _loc5_;
            }
            _loc4_ = printAccess;
            _loc11_ = [];
            _loc6_ = 0;
            _loc12_ = _loc7_;
            while(_loc6_ < int(_loc12_.length))
            {
               _loc13_ = _loc12_[_loc6_];
               _loc6_++;
               _loc11_.push(_loc4_(_loc13_));
            }
            _loc10_ = _loc11_.join(" ") + " ";
         }
         else
         {
            _loc10_ = "";
         }
         var _loc14_:String = _loc9_ + _loc10_;
         var _loc15_:FieldType = param1.kind;
         switch(_loc15_.index)
         {
            case 0:
               _loc17_ = _loc15_.params[0];
               _loc8_ = _loc15_.params[1];
               _loc16_ = (param1.access != null && Lambda.has(param1.access,Access.AFinal) ? "" : "var ") + ("" + param1.name) + opt(_loc17_,printComplexType," : ") + opt(_loc8_,printExpr," = ");
               break;
            case 1:
               _loc8_ = _loc15_.params[0];
               _loc16_ = "function " + param1.name + printFunction(_loc8_);
               break;
            case 2:
               _loc18_ = _loc15_.params[0];
               _loc19_ = _loc15_.params[1];
               _loc17_ = _loc15_.params[2];
               _loc8_ = _loc15_.params[3];
               _loc16_ = "var " + param1.name + "(" + _loc18_ + ", " + _loc19_ + ")" + opt(_loc17_,printComplexType," : ") + opt(_loc8_,printExpr," = ");
         }
         return _loc14_ + _loc16_;
      }
      
      public function printExprs(param1:Array, param2:String) : String
      {
         var _loc7_:* = null;
         var _loc3_:Function = printExpr;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = param1;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            _loc4_.push(_loc3_(_loc7_));
         }
         return _loc4_.join(param2);
      }
      
      public function printExpr(param1:Object) : String
      {
         var _loc3_:* = null as ExprDef;
         var _loc4_:* = null as Constant;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null as Binop;
         var _loc8_:* = null as String;
         var _loc9_:* = null as EFieldKind;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as Array;
         var _loc12_:int = 0;
         var _loc13_:* = null as Array;
         var _loc14_:* = null as Unop;
         var _loc15_:* = null as Unop;
         var _loc16_:* = null as Function;
         var _loc17_:* = null as Array;
         var _loc18_:* = null as FunctionKind;
         var _loc19_:* = null as FunctionKind;
         var _loc20_:* = null as Object;
         var _loc21_:* = null as String;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:* = null as String;
         var _loc27_:* = null as ComplexType;
         var _loc28_:* = null as DisplayKind;
         var _loc29_:* = null as ExprDef;
         var _loc2_:Printer = this;
         if(param1 == null)
         {
            return "#NULL";
         }
         _loc3_ = param1.expr;
         switch(_loc3_.index)
         {
            case 0:
               _loc4_ = _loc3_.params[0];
               return printConstant(_loc4_);
            case 1:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc3_.params[1];
               return "" + printExpr(_loc5_) + "[" + printExpr(_loc6_) + "]";
            case 2:
               _loc7_ = _loc3_.params[0];
               _loc5_ = _loc3_.params[1];
               _loc6_ = _loc3_.params[2];
               return "" + printExpr(_loc5_) + " " + printBinop(_loc7_) + " " + printExpr(_loc6_);
            case 3:
               _loc5_ = _loc3_.params[0];
               _loc8_ = _loc3_.params[1];
               _loc9_ = _loc3_.params[2];
               if(_loc9_ == EFieldKind.Safe)
               {
                  return "" + printExpr(_loc5_) + "?." + _loc8_;
               }
               return "" + printExpr(_loc5_) + "." + _loc8_;
               break;
            case 4:
               _loc5_ = _loc3_.params[0];
               return "(" + printExpr(_loc5_) + ")";
            case 5:
               _loc10_ = _loc3_.params[0];
               _loc11_ = [];
               _loc12_ = 0;
               _loc13_ = _loc10_;
               while(_loc12_ < int(_loc13_.length))
               {
                  _loc5_ = _loc13_[_loc12_];
                  _loc12_++;
                  _loc11_.push(_loc2_.printObjectField(_loc5_));
               }
               return "{ " + _loc11_.join(", ") + " }";
            case 6:
               _loc10_ = _loc3_.params[0];
               return "[" + printExprs(_loc10_,", ") + "]";
            case 7:
               _loc5_ = _loc3_.params[0];
               _loc10_ = _loc3_.params[1];
               return "" + printExpr(_loc5_) + "(" + printExprs(_loc10_,", ") + ")";
            case 8:
               _loc5_ = _loc3_.params[0];
               _loc10_ = _loc3_.params[1];
               return "new " + printTypePath(_loc5_) + "(" + printExprs(_loc10_,", ") + ")";
            case 9:
               _loc14_ = _loc3_.params[0];
               _loc5_ = _loc3_.params[2];
               if(Boolean(_loc3_.params[1]))
               {
                  _loc15_ = _loc14_;
                  _loc6_ = _loc5_;
                  return printExpr(_loc6_) + printUnop(_loc15_);
               }
               _loc15_ = _loc14_;
               _loc6_ = _loc5_;
               return printUnop(_loc15_) + printExpr(_loc6_);
               break;
            case 10:
               _loc10_ = _loc3_.params[0];
               if(int(_loc10_.length) == 0)
               {
                  return "var ";
               }
               _loc11_ = _loc10_;
               _loc8_ = (_loc11_[0].isStatic ? "static " : "") + (_loc11_[0].isFinal ? "final " : "var ");
               _loc16_ = printVar;
               _loc13_ = [];
               _loc12_ = 0;
               _loc17_ = _loc11_;
               while(_loc12_ < int(_loc17_.length))
               {
                  _loc5_ = _loc17_[_loc12_];
                  _loc12_++;
                  _loc13_.push(_loc16_(_loc5_));
               }
               return _loc8_ + _loc13_.join(", ");
               break;
            case 11:
               _loc18_ = _loc3_.params[0];
               _loc5_ = _loc3_.params[1];
               if(_loc18_ == null)
               {
                  _loc19_ = _loc18_;
                  _loc6_ = _loc5_;
                  return (_loc19_ != FunctionKind.FArrow ? "function" : "") + printFunction(_loc6_,_loc19_);
               }
               if(_loc18_.index == 1)
               {
                  _loc8_ = _loc18_.params[0];
                  _loc20_ = _loc18_.params[1];
                  _loc6_ = _loc5_;
                  return (_loc20_ ? "inline " : "") + ("function " + _loc8_) + printFunction(_loc6_);
               }
               _loc19_ = _loc18_;
               _loc6_ = _loc5_;
               return (_loc19_ != FunctionKind.FArrow ? "function" : "") + printFunction(_loc6_,_loc19_);
               break;
            case 12:
               _loc10_ = _loc3_.params[0];
               if(int(_loc10_.length) == 0)
               {
                  return "{ }";
               }
               _loc11_ = _loc10_;
               _loc8_ = tabs;
               tabs += tabString;
               _loc21_ = "{\n" + tabs + printExprs(_loc11_,";\n" + tabs);
               tabs = _loc8_;
               return _loc21_ + (";\n" + tabs + "}");
               break;
            case 13:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc3_.params[1];
               return "for (" + printExpr(_loc5_) + ") " + printExpr(_loc6_);
            case 14:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc3_.params[1];
               _loc22_ = _loc3_.params[2];
               if(_loc22_ == null)
               {
                  _loc23_ = _loc6_;
                  _loc24_ = _loc5_;
                  return "if (" + printExpr(_loc24_) + ") " + printExpr(_loc23_);
               }
               _loc23_ = _loc22_;
               _loc24_ = _loc6_;
               _loc25_ = _loc5_;
               return "if (" + printExpr(_loc25_) + ") " + printExpr(_loc24_) + " else " + printExpr(_loc23_);
               break;
            case 15:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc3_.params[1];
               if(Boolean(_loc3_.params[2]))
               {
                  _loc22_ = _loc6_;
                  _loc23_ = _loc5_;
                  return "while (" + printExpr(_loc23_) + ") " + printExpr(_loc22_);
               }
               _loc22_ = _loc6_;
               _loc23_ = _loc5_;
               return "do " + printExpr(_loc22_) + " while (" + printExpr(_loc23_) + ")";
               break;
            case 16:
               _loc5_ = _loc3_.params[0];
               _loc10_ = _loc3_.params[1];
               _loc6_ = _loc3_.params[2];
               _loc8_ = tabs;
               tabs += tabString;
               _loc21_ = "switch " + printExpr(_loc5_) + " {\n" + tabs;
               _loc11_ = [];
               _loc12_ = 0;
               _loc13_ = _loc10_;
               while(_loc12_ < int(_loc13_.length))
               {
                  _loc22_ = _loc13_[_loc12_];
                  _loc12_++;
                  _loc11_.push("case " + _loc2_.printExprs(_loc22_.values,", ") + (_loc22_.guard != null ? " if (" + _loc2_.printExpr(_loc22_.guard) + "):" : ":") + (_loc22_.expr != null ? _loc2_.opt(_loc22_.expr,_loc2_.printExpr) + ";" : ""));
               }
               _loc26_ = _loc21_ + _loc11_.join("\n" + tabs);
               if(_loc6_ != null)
               {
                  _loc26_ += "\n" + tabs + "default:" + (_loc6_.expr == null ? "" : printExpr(_loc6_) + ";");
               }
               tabs = _loc8_;
               return _loc26_ + ("\n" + tabs + "}");
            case 17:
               _loc5_ = _loc3_.params[0];
               _loc10_ = _loc3_.params[1];
               _loc8_ = "try " + printExpr(_loc5_);
               _loc11_ = [];
               _loc12_ = 0;
               _loc13_ = _loc10_;
               while(_loc12_ < int(_loc13_.length))
               {
                  _loc6_ = _loc13_[_loc12_];
                  _loc12_++;
                  _loc11_.push(" catch(" + _loc6_.name + (_loc6_.type == null ? "" : ":" + _loc2_.printComplexType(_loc6_.type)) + ") " + _loc2_.printExpr(_loc6_.expr));
               }
               return _loc8_ + _loc11_.join("");
            case 18:
               _loc5_ = _loc3_.params[0];
               return "return" + opt(_loc5_,printExpr," ");
            case 19:
               return "break";
            case 20:
               return "continue";
            case 21:
               _loc5_ = _loc3_.params[0];
               return "untyped " + printExpr(_loc5_);
            case 22:
               _loc5_ = _loc3_.params[0];
               return "throw " + printExpr(_loc5_);
            case 23:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc5_;
               _loc27_ = _loc3_.params[1];
               if(_loc27_ != null)
               {
                  return "cast(" + printExpr(_loc6_) + ", " + printComplexType(_loc27_) + ")";
               }
               _loc22_ = _loc5_;
               return "cast " + printExpr(_loc22_);
               break;
            case 24:
               _loc28_ = _loc3_.params[1];
               _loc5_ = _loc3_.params[0];
               return "#DISPLAY(" + printExpr(_loc5_) + ")";
            case 25:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc3_.params[1];
               _loc22_ = _loc3_.params[2];
               return "" + printExpr(_loc5_) + " ? " + printExpr(_loc6_) + " : " + printExpr(_loc22_);
            case 26:
               _loc5_ = _loc3_.params[0];
               _loc27_ = _loc3_.params[1];
               return "(" + printExpr(_loc5_) + " : " + printComplexType(_loc27_) + ")";
            case 27:
               _loc5_ = _loc3_.params[0];
               _loc6_ = _loc3_.params[1];
               _loc10_ = _loc5_.params;
               _loc22_ = _loc5_.pos;
               if(_loc5_.name == ":implicitReturn")
               {
                  _loc29_ = _loc6_.expr;
                  _loc23_ = _loc6_.pos;
                  if(_loc29_.index == 18)
                  {
                     _loc24_ = _loc29_.params[0];
                     return printExpr(_loc24_);
                  }
                  _loc24_ = _loc5_;
                  _loc25_ = _loc6_;
                  return printMetadata(_loc24_) + " " + printExpr(_loc25_);
               }
               _loc23_ = _loc5_;
               _loc24_ = _loc6_;
               return printMetadata(_loc23_) + " " + printExpr(_loc24_);
               break;
            case 28:
               _loc5_ = _loc3_.params[0];
               _loc27_ = _loc3_.params[1];
               return "" + printExpr(_loc5_) + " is " + printComplexType(_loc27_);
            default:
               return;
         }
      }
      
      public function printConstant(param1:Constant) : String
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as StringLiteralKind;
         switch(param1.index)
         {
            case 0:
               _loc2_ = param1.params[0];
               _loc3_ = param1.params[1];
               if(_loc3_ == null)
               {
                  return _loc2_;
               }
               _loc4_ = _loc3_;
               _loc5_ = _loc2_;
               return _loc5_ + _loc4_;
               break;
            case 1:
               _loc2_ = param1.params[0];
               _loc3_ = param1.params[1];
               if(_loc3_ == null)
               {
                  return _loc2_;
               }
               _loc4_ = _loc3_;
               _loc5_ = _loc2_;
               return _loc5_ + _loc4_;
               break;
            case 2:
               _loc2_ = param1.params[0];
               _loc6_ = param1.params[1];
               if(_loc6_ == null)
               {
                  _loc3_ = _loc2_;
                  return printString(_loc3_);
               }
               if(_loc6_.index == 1)
               {
                  _loc3_ = _loc2_;
                  return printFormatString(_loc3_);
               }
               _loc3_ = _loc2_;
               return printString(_loc3_);
               break;
            case 3:
               return param1.params[0];
            case 4:
               _loc2_ = param1.params[0];
               _loc3_ = param1.params[1];
               return "~/" + _loc2_ + "/" + _loc3_;
            default:
               return;
         }
      }
      
      public function printComplexType(param1:ComplexType) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as ComplexType;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as ComplexType;
         var _loc7_:* = null as ComplexType;
         var _loc8_:* = null as Function;
         var _loc9_:* = null as Array;
         var _loc10_:int = 0;
         var _loc11_:* = null as Array;
         var _loc12_:* = null as String;
         var _loc13_:* = null as String;
         var _loc14_:* = null as Array;
         switch(param1.index)
         {
            case 0:
               _loc2_ = param1.params[0];
               return printTypePath(_loc2_);
            case 1:
               _loc3_ = param1.params[0];
               _loc4_ = param1.params[1];
               if(int(_loc3_.length) == 1)
               {
                  _loc6_ = _loc3_[0];
                  switch(_loc6_.index)
                  {
                     case 0:
                        _loc2_ = _loc6_.params[0];
                        _loc5_ = false;
                        break;
                     case 3:
                        _loc7_ = _loc6_.params[0];
                        _loc5_ = false;
                        break;
                     case 5:
                        _loc7_ = _loc6_.params[0];
                        if(_loc7_.index == 0)
                        {
                           _loc2_ = _loc7_.params[0];
                           _loc5_ = false;
                           break;
                        }
                        _loc5_ = true;
                        break;
                     default:
                        _loc5_ = true;
                  }
               }
               else
               {
                  _loc5_ = true;
               }
               _loc8_ = printComplexType;
               _loc9_ = [];
               _loc10_ = 0;
               _loc11_ = _loc3_;
               while(_loc10_ < int(_loc11_.length))
               {
                  _loc6_ = _loc11_[_loc10_];
                  _loc10_++;
                  _loc9_.push(_loc8_(_loc6_));
               }
               _loc12_ = _loc9_.join(", ");
               if(_loc4_.index == 1)
               {
                  _loc11_ = _loc4_.params[0];
                  _loc6_ = _loc4_.params[1];
                  _loc13_ = "(" + printComplexType(_loc4_) + ")";
               }
               else
               {
                  _loc13_ = printComplexType(_loc4_);
               }
               return (_loc5_ ? "(" + _loc12_ + ")" : _loc12_) + " -> " + _loc13_;
            case 2:
               _loc3_ = param1.params[0];
               _loc9_ = [];
               _loc10_ = 0;
               while(_loc10_ < int(_loc3_.length))
               {
                  _loc2_ = _loc3_[_loc10_];
                  _loc10_++;
                  _loc9_.push(printField(_loc2_) + "; ");
               }
               return "{ " + _loc9_.join("") + "}";
            case 3:
               _loc4_ = param1.params[0];
               return "(" + printComplexType(_loc4_) + ")";
            case 4:
               _loc3_ = param1.params[0];
               _loc9_ = param1.params[1];
               _loc11_ = [];
               _loc10_ = 0;
               while(_loc10_ < int(_loc3_.length))
               {
                  _loc2_ = _loc3_[_loc10_];
                  _loc10_++;
                  _loc11_.push("> " + printTypePath(_loc2_) + ", ");
               }
               _loc12_ = _loc11_.join("");
               _loc14_ = [];
               _loc10_ = 0;
               while(_loc10_ < int(_loc9_.length))
               {
                  _loc2_ = _loc9_[_loc10_];
                  _loc10_++;
                  _loc14_.push(printField(_loc2_) + "; ");
               }
               _loc13_ = _loc14_.join("");
               return "{" + _loc12_ + _loc13_ + "}";
            case 5:
               _loc4_ = param1.params[0];
               return "?" + printComplexType(_loc4_);
            case 6:
               _loc12_ = param1.params[0];
               _loc4_ = param1.params[1];
               return _loc12_ + ":" + printComplexType(_loc4_);
            case 7:
               _loc3_ = param1.params[0];
               _loc8_ = printComplexType;
               _loc9_ = [];
               _loc10_ = 0;
               _loc11_ = _loc3_;
               while(_loc10_ < int(_loc11_.length))
               {
                  _loc4_ = _loc11_[_loc10_];
                  _loc10_++;
                  _loc9_.push(_loc8_(_loc4_));
               }
               return _loc9_.join(" & ");
            default:
               return;
         }
      }
      
      public function printBinop(param1:Binop) : String
      {
         var _loc2_:* = null as Binop;
         switch(param1.index)
         {
            case 0:
               return "+";
            case 1:
               return "*";
            case 2:
               return "/";
            case 3:
               return "-";
            case 4:
               return "=";
            case 5:
               return "==";
            case 6:
               return "!=";
            case 7:
               return ">";
            case 8:
               return ">=";
            case 9:
               return "<";
            case 10:
               return "<=";
            case 11:
               return "&";
            case 12:
               return "|";
            case 13:
               return "^";
            case 14:
               return "&&";
            case 15:
               return "||";
            case 16:
               return "<<";
            case 17:
               return ">>";
            case 18:
               return ">>>";
            case 19:
               return "%";
            case 20:
               _loc2_ = param1.params[0];
               return printBinop(_loc2_) + "=";
            case 21:
               return "...";
            case 22:
               return "=>";
            case 23:
               return "in";
            case 24:
               return "??";
            default:
               return;
         }
      }
      
      public function printAccess(param1:Access) : String
      {
         switch(param1.index)
         {
            case 0:
               return "public";
            case 1:
               return "private";
            case 2:
               return "static";
            case 3:
               return "override";
            case 4:
               return "dynamic";
            case 5:
               return "inline";
            case 6:
               return "macro";
            case 7:
               return "final";
            case 8:
               return "extern";
            case 9:
               return "abstract";
            case 10:
               return "overload";
            default:
               return;
         }
      }
      
      public function opt(param1:Object, param2:Function, param3:String = undefined) : String
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param1 == null)
         {
            return "";
         }
         return param3 + param2(param1);
      }
      
      public function escapeString(param1:String, param2:String) : String
      {
         return param2 + StringTools.replace(StringTools.replace(StringTools.replace(StringTools.replace(StringTools.replace(StringTools.replace(param1,"\\","\\\\"),"\n","\\n"),"\t","\\t"),"\r","\\r"),"\'","\\\'"),"\"","\\\"") + param2;
      }
   }
}

