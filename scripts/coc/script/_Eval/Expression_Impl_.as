package coc.script._Eval
{
   import coc.script.EType;
   import coc.script.VType;
   
   public final class Expression_Impl_
   {
      
      public function Expression_Impl_()
      {
      }
      
      public static function _new(param1:EType) : EType
      {
         return param1;
      }
      
      public static function fromInt(param1:int) : EType
      {
         return EType.ELiteral(VType.VInt(param1));
      }
      
      public static function fromFloat(param1:Number) : EType
      {
         return EType.ELiteral(VType.VFloat(param1));
      }
      
      public static function fromBool(param1:Boolean) : EType
      {
         return EType.ELiteral(VType.VBool(param1));
      }
      
      public static function fromString(param1:String) : EType
      {
         return EType.ELiteral(VType.VString(param1));
      }
      
      public static function evaluate(param1:EType) : VType
      {
         var _loc2_:* = null;
         var _loc3_:* = null as VType;
         var _loc4_:* = null as String;
         var _loc5_:* = null as EType;
         var _loc6_:* = null as EType;
         var _loc7_:* = null as VType;
         var _loc8_:* = null as EType;
         switch(param1.index)
         {
            case 0:
               _loc2_ = param1.params[0];
               throw new Error("Tried to evauate EObject " + (_loc2_ == null ? "null" : Std.string(_loc2_)));
            case 1:
               return param1.params[0];
            case 2:
               _loc4_ = param1.params[0];
               _loc5_ = param1.params[1];
               if(_loc4_ != "!")
               {
                  throw new Error("Unary operator " + _loc4_ + " not implemented");
               }
               return Value_Impl_.fromBool(!Value_Impl_.toBool(Expression_Impl_.evaluate(_loc5_)));
               break;
            case 3:
               _loc4_ = param1.params[0];
               _loc5_ = param1.params[1];
               _loc6_ = param1.params[2];
               _loc3_ = Expression_Impl_.evaluate(_loc5_);
               _loc7_ = Expression_Impl_.evaluate(_loc6_);
               return Expression_Impl_.calculateOp(_loc3_,_loc4_,_loc7_);
            case 4:
               _loc5_ = param1.params[0];
               _loc6_ = param1.params[1];
               _loc8_ = param1.params[2];
               if(Value_Impl_.toBool(Expression_Impl_.evaluate(_loc5_)))
               {
                  return Expression_Impl_.evaluate(_loc6_);
               }
               return Expression_Impl_.evaluate(_loc8_);
               break;
            default:
               return;
         }
      }
      
      public static function calculateOp(param1:VType, param2:String, param3:VType) : VType
      {
         var _loc4_:String = param2;
         if(_loc4_ != "!=")
         {
            if(_loc4_ != "!==")
            {
               if(_loc4_ != "ne")
               {
                  if(_loc4_ != "neq")
                  {
                     if(_loc4_ == "%")
                     {
                        return Value_Impl_.fromFloat(Value_Impl_.toFloat(param1) % Value_Impl_.toFloat(param3));
                     }
                     if(_loc4_ == "*")
                     {
                        return Value_Impl_.fromFloat(Value_Impl_.toFloat(param1) * Value_Impl_.toFloat(param3));
                     }
                     if(_loc4_ == "+")
                     {
                        return Value_Impl_.fromFloat(Value_Impl_.toFloat(param1) + Value_Impl_.toFloat(param3));
                     }
                     if(_loc4_ == "-")
                     {
                        return Value_Impl_.fromFloat(Value_Impl_.toFloat(param1) - Value_Impl_.toFloat(param3));
                     }
                     if(_loc4_ == "/")
                     {
                        return Value_Impl_.fromFloat(Value_Impl_.toFloat(param1) / Value_Impl_.toFloat(param3));
                     }
                     if(_loc4_ != "=")
                     {
                        if(_loc4_ != "==")
                        {
                           if(_loc4_ != "===")
                           {
                              if(_loc4_ != "eq")
                              {
                                 if(_loc4_ != "&&")
                                 {
                                    if(_loc4_ != "and")
                                    {
                                       if(_loc4_ != ">=")
                                       {
                                          if(_loc4_ != "ge")
                                          {
                                             if(_loc4_ != "gte")
                                             {
                                                if(_loc4_ != ">")
                                                {
                                                   if(_loc4_ != "gt")
                                                   {
                                                      if(_loc4_ != "<=")
                                                      {
                                                         if(_loc4_ != "le")
                                                         {
                                                            if(_loc4_ != "lte")
                                                            {
                                                               if(_loc4_ != "<")
                                                               {
                                                                  if(_loc4_ != "lt")
                                                                  {
                                                                     if(_loc4_ != "or")
                                                                     {
                                                                        if(_loc4_ != "||")
                                                                        {
                                                                           throw new Error("未注册的操作符 " + param2);
                                                                        }
                                                                     }
                                                                     return Value_Impl_.fromBool(Value_Impl_.toBool(param1) || Value_Impl_.toBool(param3));
                                                                  }
                                                               }
                                                               return Value_Impl_.fromBool(Value_Impl_.toFloat(param1) < Value_Impl_.toFloat(param3));
                                                            }
                                                         }
                                                      }
                                                      return Value_Impl_.fromBool(Value_Impl_.toFloat(param1) <= Value_Impl_.toFloat(param3));
                                                   }
                                                }
                                                return Value_Impl_.fromBool(Value_Impl_.toFloat(param1) > Value_Impl_.toFloat(param3));
                                             }
                                          }
                                       }
                                       return Value_Impl_.fromBool(Value_Impl_.toFloat(param1) >= Value_Impl_.toFloat(param3));
                                    }
                                 }
                                 return Value_Impl_.fromBool(Value_Impl_.toBool(param1) && Value_Impl_.toBool(param3));
                              }
                           }
                        }
                     }
                     return Value_Impl_.fromBool(Value_Impl_.equals(param1,param3));
                  }
               }
            }
         }
         return Value_Impl_.fromBool(!Value_Impl_.equals(param1,param3));
      }
   }
}

