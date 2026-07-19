package coc.script
{
   import coc.script._Eval.Expression_Impl_;
   import coc.script._Eval.Value_Impl_;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Eval
   {
      
      public static var init__:Boolean;
      
      public static var RX_FLOAT:EReg;
      
      public static var RX_INT:EReg;
      
      public static var LA_BLOCK_COMMENT:EReg;
      
      public static var LA_FLOAT:EReg;
      
      public static var LA_INT:EReg;
      
      public static var LA_ID:EReg;
      
      public static var LA_OPERATOR:EReg;
      
      public static var OP_PRIORITIES:IMap;
      
      public var scopes:Array;
      
      public var expr:String;
      
      public var _src:String;
      
      public function Eval(param1:* = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         scopes = [param1];
         _src = param2;
         expr = param2;
      }
      
      public static function eval(param1:*, param2:String) : VType
      {
         if(Eval.RX_INT.match(param2))
         {
            return Value_Impl_.fromInt(Std.parseInt(param2));
         }
         var _loc3_:EType = new Eval(param1,param2).evalUntil("");
         return Expression_Impl_.evaluate(_loc3_);
      }
      
      public static function error(param1:String, param2:String, param3:String, param4:Boolean = true) : Error
      {
         return new Error("在表达式中: " + param1 + "\n" + param3 + (param4 ? ": " + param2 : ""));
      }
      
      public static function escapeString(param1:String) : String
      {
         var _loc2_:EReg = new EReg("\n","g");
         var _loc3_:EReg = new EReg("\r","g");
         var _loc4_:EReg = new EReg("\'","g");
         var _loc5_:EReg = new EReg("\"","g");
         var _loc6_:EReg = new EReg("\\\\","g");
         param1 = _loc2_.replace(param1,"\\n");
         param1 = _loc3_.replace(param1,"\\r");
         param1 = _loc4_.replace(param1,"\\\'");
         param1 = _loc5_.replace(param1,"\\\"");
         return _loc6_.replace(param1,"\\\\");
      }
      
      public function unshift(param1:String) : void
      {
         expr = param1 + expr;
      }
      
      public function get_src() : String
      {
         return _src;
      }
      
      public function getMember(param1:*, param2:String) : EType
      {
         var _loc3_:* = Reflect.getProperty(param1,param2);
         if(Std.isOfType(_loc3_,Number))
         {
            return EType.ELiteral(VType.VFloat(Number(_loc3_)));
         }
         if(Std.isOfType(_loc3_,int))
         {
            return EType.ELiteral(VType.VInt(int(_loc3_)));
         }
         if(_loc3_ is String)
         {
            return EType.ELiteral(VType.VString(_loc3_));
         }
         if(Std.isOfType(_loc3_,Boolean))
         {
            return EType.ELiteral(VType.VBool(Boolean(_loc3_)));
         }
         return EType.ELiteral(VType.VNull);
      }
      
      public function evalUntil(param1:String) : EType
      {
         var _loc2_:EType = evalExpr(0);
         if(expr == param1 || expr.charAt(0) == param1)
         {
            return _loc2_;
         }
         if(param1 != null && param1 != "")
         {
            throw Eval.error(_src,expr,"Operator or " + param1 + "expected");
         }
         throw Eval.error(_src,expr,"预期为运算符");
      }
      
      public function evalStringLiteral(param1:String) : String
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc2_:String = "";
         var _loc3_:EReg = param1 == "\"" ? new EReg("^[^\"\\\\]*","") : new EReg("^[^\'\\\\]*","");
         while(true)
         {
            if(eatStr("\\"))
            {
               _loc4_ = eatN(1);
               if(_loc4_ == null)
               {
                  _loc4_ = "";
               }
               _loc6_ = _loc4_;
               if(_loc6_ == "\"")
               {
                  _loc5_ = "\"";
               }
               else if(_loc6_ == "\'")
               {
                  _loc5_ = "\'";
               }
               else if(_loc6_ == "n")
               {
                  _loc5_ = "\n";
               }
               else if(_loc6_ == "r")
               {
                  _loc5_ = "";
               }
               else if(_loc6_ == "t")
               {
                  _loc5_ = "\t";
               }
               else
               {
                  _loc5_ = "";
               }
               _loc2_ += _loc5_;
            }
            else
            {
               if(eatStr(param1))
               {
                  break;
               }
               if(!eat(_loc3_))
               {
                  throw Eval.error(_src,expr,"预期为文本");
               }
               _loc2_ += _loc3_.matched(0);
            }
         }
         return _loc2_;
      }
      
      public function evalPostExpr(param1:EType, param2:int) : EType
      {
         var _loc3_:* = null as EType;
         var _loc4_:* = null as EType;
         var _loc5_:* = null;
         var _loc6_:* = null as String;
         var _loc7_:* = null as StringMap;
         var _loc8_:int = 0;
         while(true)
         {
            eatWs();
            if(eatStr("()"))
            {
               throw new Error("Eval中未实现函数调用");
            }
            if(eatStr("("))
            {
               throw new Error("Eval中未实现函数调用");
            }
            if(eatStr("."))
            {
               if(!eat(Eval.LA_ID))
               {
                  throw Eval.error(_src,expr,"预期标识符");
               }
               if(param1.index != 0)
               {
                  throw new Error("Member access on non-object: " + Std.string(param1));
               }
               _loc5_ = param1.params[0];
               param1 = getMember(_loc5_,Eval.LA_ID.matched(0));
            }
            else
            {
               if(eatStr("["))
               {
                  throw new Error("Eval中未实现数组访问");
               }
               if(eatStr("?"))
               {
                  _loc3_ = evalUntil(":");
                  if(!eatStr(":"))
                  {
                     throw Eval.error(_src,expr,"预期为 \':\'");
                  }
                  _loc4_ = evalExpr(0);
                  param1 = EType.EConditional(param1,_loc3_,_loc4_);
               }
               else
               {
                  if(!eat(Eval.LA_OPERATOR))
                  {
                     break;
                  }
                  _loc6_ = Eval.LA_OPERATOR.matched(0);
                  _loc7_ = Eval.OP_PRIORITIES;
                  _loc8_ = int(_loc6_ in StringMap.reserved ? _loc7_.getReserved(_loc6_) : _loc7_.h[_loc6_]);
                  if(_loc8_ <= param2)
                  {
                     unshift(_loc6_);
                     break;
                  }
                  _loc3_ = evalExpr(_loc8_);
                  param1 = EType.EBinary(_loc6_,param1,_loc3_);
               }
            }
         }
         eatWs();
         return param1;
      }
      
      public function evalId(param1:String) : EType
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:String = param1;
         if(_loc2_ == "false")
         {
            return Expression_Impl_.fromBool(false);
         }
         if(_loc2_ != "null")
         {
            if(_loc2_ != "undefined")
            {
               if(_loc2_ == "true")
               {
                  return Expression_Impl_.fromBool(true);
               }
               _loc3_ = 0;
               _loc4_ = scopes;
               while(_loc3_ < int(_loc4_.length))
               {
                  _loc5_ = _loc4_[_loc3_];
                  _loc3_++;
                  _loc6_ = Reflect.getProperty(_loc5_,param1);
                  if(Std.isOfType(_loc6_,Number))
                  {
                     return EType.ELiteral(VType.VFloat(Number(_loc6_)));
                  }
                  if(Std.isOfType(_loc6_,int))
                  {
                     return EType.ELiteral(VType.VInt(int(_loc6_)));
                  }
                  if(_loc6_ is String)
                  {
                     return EType.ELiteral(VType.VString(_loc6_));
                  }
                  if(Std.isOfType(_loc6_,Boolean))
                  {
                     return EType.ELiteral(VType.VBool(Boolean(_loc6_)));
                  }
                  if(_loc6_ != null)
                  {
                     return EType.EObject(_loc6_);
                  }
               }
               return EType.ELiteral(VType.VNull);
            }
         }
         return EType.ELiteral(VType.VNull);
      }
      
      public function evalExpr(param1:int) : EType
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as EType;
         var _loc4_:EReg = new EReg("^[\'\"]","");
         eatWs();
         if(eatStr("("))
         {
            _loc3_ = evalUntil(")");
            eatStr(")");
         }
         else if(eatStr("!") || eat(new EReg("^not\\b","")))
         {
            _loc3_ = EType.EUnary("!",evalExpr(60));
         }
         else
         {
            if(eatStr("["))
            {
               throw new Error("Eval中未实现数组");
            }
            if(eatStr("{"))
            {
               throw new Error("Eval中未实现对象/映射字面量");
            }
            if(eat(Eval.LA_FLOAT))
            {
               _loc3_ = Expression_Impl_.fromFloat(Std.parseFloat(Eval.LA_FLOAT.matched(0)));
            }
            else if(eat(Eval.LA_INT))
            {
               _loc3_ = Expression_Impl_.fromInt(Std.parseInt(Eval.LA_INT.matched(0)));
            }
            else if(eat(_loc4_))
            {
               _loc2_ = _loc4_.matched(0);
               _loc3_ = Expression_Impl_.fromString(evalStringLiteral(_loc2_));
            }
            else
            {
               if(!eat(Eval.LA_ID))
               {
                  throw Eval.error(_src,expr,"不是子表达式");
               }
               _loc3_ = evalId(Eval.LA_ID.matched(0));
            }
         }
         return evalPostExpr(_loc3_,param1);
      }
      
      public function eatWs() : void
      {
         while(eat(new EReg("^\\s+","")) || eat(Eval.LA_BLOCK_COMMENT))
         {
         }
      }
      
      public function eatStr(param1:String) : Boolean
      {
         if(expr.substr(0,param1.length).indexOf(param1) == 0)
         {
            eatN(param1.length);
            return true;
         }
         return false;
      }
      
      public function eatN(param1:int) : String
      {
         var _loc2_:String = expr.substr(0,param1);
         expr = expr.substr(param1);
         return _loc2_;
      }
      
      public function eat(param1:EReg) : Boolean
      {
         if(param1.match(expr))
         {
            eatN(param1.matched(0).length);
            return true;
         }
         return false;
      }
   }
}

