package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class BreastStore implements SaveAwareInterface
   {
      
      public static var MAX_FLAG_VALUE:int = 2999;
      
      public static var BREAST_STORE_VERSION_1:String = "1";
      
      public static var LACTATION_BOOST:Array = [0,0,2,3,6,9,17];
      
      public static var LACTATION_DISABLED:int = 0;
      
      public static var LACTATION_NONE:int = 1;
      
      public static var LACTATION_LIGHT:int = 2;
      
      public static var LACTATION_MODERATE:int = 3;
      
      public static var LACTATION_STRONG:int = 4;
      
      public static var LACTATION_HEAVY:int = 5;
      
      public static var LACTATION_EPIC:int = 6;
      
      public var preventLactationIncrease:int;
      
      public var preventLactationDecrease:int;
      
      public var _timesMilked:int;
      
      public var _rows:int;
      
      public var _nippleLength:Number;
      
      public var _lactation:int;
      
      public var _fullness:int;
      
      public var _cupSize:int;
      
      public var _breastFlag:int;
      
      public function BreastStore(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         preventLactationDecrease = 0;
         preventLactationIncrease = 0;
         _rows = 0;
         _timesMilked = 0;
         _nippleLength = 0;
         _lactation = 0;
         _fullness = 0;
         _cupSize = 0;
         _breastFlag = param1;
      }
      
      public static function breastDescript(param1:int, param2:Number = 0) : String
      {
         if(param1 < 1)
         {
            return "平坦的乳房";
         }
         var _loc3_:String = Utils.rand(2) == 0 ? Appearance.breastSize(param1) : "";
         switch(Utils.rand(10))
         {
            case 1:
               if(param2 > 2)
               {
                  return _loc3_ + "产奶的乳房";
               }
               break;
            case 2:
               if(param2 > 1.5)
               {
                  _loc3_ += "乳白色的";
               }
               if(param1 > 4)
               {
                  return _loc3_ + "奶子";
               }
               break;
            case 4:
            case 5:
            case 6:
               return _loc3_ + "奶子";
            case 7:
               if(param2 >= 2.5)
               {
                  return _loc3_ + "奶袋";
               }
               if(param2 >= 1)
               {
                  _loc3_ += "产奶的";
               }
               return _loc3_ + "双峰";
               break;
            case 8:
               if(param1 > 6)
               {
                  return _loc3_ + "肉枕头";
               }
               return _loc3_ + "大奶子";
               break;
            case 9:
               if(param1 > 6)
               {
                  return _loc3_ + "奶子";
               }
         }
         return _loc3_ + "乳房";
      }
      
      public function updateBeforeSave(param1:CoC) : void
      {
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,_breastFlag,"1" + "^" + get_rows() + "^" + get_cupSize() + "^" + get_lactationLevel() + "^" + get_nippleLength() + "^" + _fullness + "^" + _timesMilked + "^" + preventLactationIncrease + "^" + preventLactationDecrease);
      }
      
      public function updateAfterLoad(param1:CoC) : void
      {
         var _loc2_:Array = FlagDict_Impl_.arrayReadString(KFLAGS.flags,_breastFlag).split("^");
         if(int(_loc2_.length) < 9)
         {
            return;
         }
         set_rows(Std.parseInt(_loc2_[1]));
         set_cupSize(Std.parseInt(_loc2_[2]));
         set_lactationLevel(Std.parseInt(_loc2_[3]));
         set_nippleLength(Std.parseFloat(_loc2_[4]));
         _fullness = Std.parseInt(_loc2_[5]);
         _timesMilked = Std.parseInt(_loc2_[6]);
         preventLactationIncrease = Std.parseInt(_loc2_[7]);
         preventLactationDecrease = Std.parseInt(_loc2_[8]);
      }
      
      public function set_rows(param1:int) : int
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         return _rows = param1;
      }
      
      public function set_nippleLength(param1:Number) : Number
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         _nippleLength = 0.1 * Math.round(10 * param1);
         return param1;
      }
      
      public function set_lactationLevel(param1:int) : int
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 6)
         {
            param1 = 6;
         }
         if(_lactation <= 1 && param1 >= 2)
         {
            _fullness = 0;
            _timesMilked = 0;
         }
         return _lactation = param1;
      }
      
      public function set_cupSize(param1:int) : int
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 99)
         {
            param1 = 99;
         }
         return _cupSize = param1;
      }
      
      public function nippleDescript(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "tiny";
         }
         if(param2 == null)
         {
            param2 = "prominent";
         }
         if(param3 == null)
         {
            param3 = "large";
         }
         if(param4 == null)
         {
            param4 = "elongated";
         }
         if(param5 == null)
         {
            param5 = "massive";
         }
         if(_nippleLength < 3)
         {
            return param1;
         }
         if(_nippleLength < 10)
         {
            return param2;
         }
         if(_nippleLength < 20)
         {
            return param3;
         }
         if(_nippleLength < 32)
         {
            return param4;
         }
         return param5;
      }
      
      public function milked() : Boolean
      {
         _fullness = 0;
         _timesMilked += 1;
         if(preventLactationIncrease == _lactation)
         {
            return false;
         }
         switch(_lactation)
         {
            case 1:
               if(_timesMilked < 12)
               {
                  return false;
               }
               break;
            case 2:
               if(_timesMilked < 10)
               {
                  return false;
               }
               break;
            case 3:
               if(_timesMilked < 12)
               {
                  return false;
               }
               break;
            case 4:
               if(_timesMilked < 20)
               {
                  return false;
               }
               break;
            case 5:
               if(_timesMilked < 15)
               {
                  return false;
               }
               break;
            default:
               return false;
         }
         _timesMilked = 5;
         set_lactationLevel(get_lactationLevel() + 1);
         return true;
      }
      
      public function milkQuantity() : Number
      {
         if(_lactation <= 1)
         {
            return 0;
         }
         return 0.01 * Math.max(100,2 * _fullness) * 20 * _rows * _cupSize * (_lactation - 1);
      }
      
      public function milkIsOverflowing() : Boolean
      {
         if(_lactation <= 1)
         {
            return false;
         }
         return _fullness >= 60 + 5 * int(BreastStore.LACTATION_BOOST[_lactation]);
      }
      
      public function milkIsFull() : Boolean
      {
         if(_lactation <= 1)
         {
            return false;
         }
         return _fullness >= 50;
      }
      
      public function lactating() : Boolean
      {
         return _lactation >= 2;
      }
      
      public function hasBreasts() : Boolean
      {
         return _cupSize != 0;
      }
      
      public function get_rows() : int
      {
         return _rows;
      }
      
      public function get_nippleLength() : Number
      {
         return _nippleLength;
      }
      
      public function get_lactationLevel() : int
      {
         return _lactation;
      }
      
      public function get_cupSize() : int
      {
         return _cupSize;
      }
      
      public function description(param1:Boolean = false, param2:Boolean = false) : String
      {
         if(_cupSize == 0)
         {
            return "flat" + (param2 ? " manly," : "") + " chest";
         }
         return (param1 ? adj() + "" : "") + cup() + "胸部";
      }
      
      public function cup() : String
      {
         return Appearance.breastCup(_cupSize);
      }
      
      public function canTitFuck() : Boolean
      {
         return _cupSize >= 3;
      }
      
      public function breastDesc() : String
      {
         return BreastStore.breastDescript(get_cupSize(),0.5 * get_lactationLevel());
      }
      
      public function advanceTime() : void
      {
         if(_lactation <= 1)
         {
            return;
         }
         _fullness += int(BreastStore.LACTATION_BOOST[_lactation]);
         if(_fullness > 60 + 20 * int(BreastStore.LACTATION_BOOST[_lactation]))
         {
            _fullness = 50;
            if(_timesMilked >= 5)
            {
               _timesMilked -= 5;
            }
            else if(preventLactationDecrease != _lactation)
            {
               --_lactation;
            }
         }
      }
      
      public function adj() : String
      {
         switch(_cupSize)
         {
            case 0:
               return "不存在";
            case 1:
               return "小巧";
            case 2:
            case 3:
               return "一手可握";
            case 4:
            case 5:
            case 6:
               return "可观";
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
               return "巨大";
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 24:
            case 25:
            case 26:
            case 27:
               return "硕大";
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 43:
            case 44:
            case 45:
               return "巨型";
            default:
               return "titanic";
         }
      }
   }
}

