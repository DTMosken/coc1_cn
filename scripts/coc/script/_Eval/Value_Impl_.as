package coc.script._Eval
{
   import coc.script.VType;
   
   public final class Value_Impl_
   {
      
      public function Value_Impl_()
      {
      }
      
      public static function _new(param1:VType) : VType
      {
         return param1;
      }
      
      public static function fromInt(param1:int) : VType
      {
         return VType.VInt(param1);
      }
      
      public static function fromFloat(param1:Number) : VType
      {
         return VType.VFloat(param1);
      }
      
      public static function fromBool(param1:Boolean) : VType
      {
         return VType.VBool(param1);
      }
      
      public static function fromString(param1:String) : VType
      {
         return VType.VString(param1);
      }
      
      public static function toBool(param1:VType) : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as String;
         switch(param1.index)
         {
            case 0:
               _loc2_ = Number(param1.params[0]);
               if(_loc2_ != 0)
               {
                  return !Boolean(Math.isNaN(_loc2_));
               }
               return false;
               break;
            case 1:
               _loc3_ = int(param1.params[0]);
               return _loc3_ != 0;
            case 2:
               return Boolean(param1.params[0]);
            case 3:
               _loc5_ = param1.params[0];
               return _loc5_ != "";
            case 4:
               return false;
            default:
               return;
         }
      }
      
      public static function toFloat(param1:VType) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as String;
         switch(param1.index)
         {
            case 0:
               return Number(param1.params[0]);
            case 1:
               return int(param1.params[0]);
            case 2:
               _loc4_ = Boolean(param1.params[0]);
               throw new Error("布尔值转浮点数");
            case 3:
               _loc5_ = param1.params[0];
               throw new Error("字符串转浮点数");
            case 4:
               throw new Error("空值转浮点数");
            default:
               return;
         }
      }
      
      public static function toInt(param1:VType) : int
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as String;
         switch(param1.index)
         {
            case 0:
               _loc2_ = Number(param1.params[0]);
               return int(_loc2_);
            case 1:
               return int(param1.params[0]);
            case 2:
               _loc4_ = Boolean(param1.params[0]);
               throw new Error("布尔值转整数");
            case 3:
               _loc5_ = param1.params[0];
               throw new Error("字符串转整数");
            case 4:
               throw new Error("空值转整数");
            default:
               return;
         }
      }
      
      public static function toString(param1:VType) : String
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as String;
         switch(param1.index)
         {
            case 0:
               _loc2_ = Number(param1.params[0]);
               return "" + _loc2_;
            case 1:
               _loc3_ = int(param1.params[0]);
               return "" + _loc3_;
            case 2:
               _loc4_ = Boolean(param1.params[0]);
               return "" + _loc4_;
            case 3:
               return param1.params[0];
            case 4:
               return Std.string(null);
            default:
               return;
         }
      }
      
      public static function equals(param1:VType, param2:VType) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:* = null as String;
         var _loc12_:* = null as String;
         switch(param1.index)
         {
            case 0:
               _loc3_ = Number(param1.params[0]);
               switch(param2.index)
               {
                  case 0:
                     _loc4_ = Number(param2.params[0]);
                     _loc5_ = _loc3_;
                     return _loc5_ == _loc4_;
                  case 1:
                     _loc6_ = int(param2.params[0]);
                     _loc4_ = _loc3_;
                     return _loc4_ == _loc6_;
                  default:
                     return false;
               }
               break;
            case 1:
               _loc6_ = int(param1.params[0]);
               switch(param2.index)
               {
                  case 0:
                     _loc3_ = Number(param2.params[0]);
                     _loc7_ = _loc6_;
                     return _loc7_ == int(_loc3_);
                  case 1:
                     _loc7_ = int(param2.params[0]);
                     _loc8_ = _loc6_;
                     return _loc8_ == _loc7_;
                  default:
                     return false;
               }
               break;
            case 2:
               if(param2.index == 2)
               {
                  _loc9_ = Boolean(param2.params[0]);
                  _loc10_ = Boolean(param1.params[0]);
                  return _loc10_ == _loc9_;
               }
               return false;
               break;
            case 3:
               if(param2.index == 3)
               {
                  _loc11_ = param2.params[0];
                  _loc12_ = param1.params[0];
                  return _loc12_ == _loc11_;
               }
               return false;
               break;
            case 4:
               if(param2.index == 4)
               {
                  return true;
               }
               return false;
               break;
            default:
               return;
         }
      }
   }
}

