package classes
{
   import classes.globalFlags.KGAMECLASS;
   
   public class Measurements
   {
      
      public function Measurements()
      {
      }
      
      public static function footInchOrMetre(param1:Number, param2:int = 2) : String
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(KGAMECLASS.kGAMECLASS.get_metric())
         {
            _loc3_ = Math.pow(10,param2);
            _loc4_ = Math.round(_loc3_ * (Math.round(param1 * 2.54) / Math.pow(10,param2))) / _loc3_;
            return Std.string(_loc4_) + "米";
         }
         return Math.floor(param1 / 12) + "英尺" + int(Math.round(param1 % 12)) + "英寸";
      }
      
      public static function numInchesOrCentimetres(param1:Number) : String
      {
         if(param1 < 1)
         {
            return Measurements.inchesOrCentimetres(param1);
         }
         if(KGAMECLASS.kGAMECLASS.get_metric())
         {
            return Math.round(param1 * 2.54) + (param1 <= 0.39370078740157477 ? "厘米" : "厘米");
         }
         var _loc2_:int = int(Math.round(param1));
         if(int(_loc2_ % 12) == 0)
         {
            if(_loc2_ == 12)
            {
               return "英尺";
            }
            return _loc2_ / 12 + "英寸";
         }
         return _loc2_ + (_loc2_ == 1 ? "英寸" : "英寸");
      }
      
      public static function inchesOrCentimetres(param1:Number, param2:int = 1) : String
      {
         var _loc3_:Number = Math.round(Measurements.inchToCm(param1) * Math.pow(10,param2)) / Math.pow(10,param2);
         var _loc4_:String = "" + _loc3_ + (KGAMECLASS.kGAMECLASS.get_metric() ? "厘米" : "英寸");
         if(_loc3_ == 1)
         {
            return _loc4_;
         }
         return _loc4_ + (KGAMECLASS.kGAMECLASS.get_metric() ? "" : "");
      }
      
      public static function inchOrCentimetre(param1:Number, param2:int = 1) : String
      {
         var _loc3_:Number = Math.round(Measurements.inchToCm(param1) * Math.pow(10,param2)) / Math.pow(10,param2);
         return "" + _loc3_ + (KGAMECLASS.kGAMECLASS.get_metric() ? "厘米" : "英寸");
      }
      
      public static function shortSuffix(param1:Number, param2:int = 1) : String
      {
         var _loc3_:Number = Math.round(Measurements.inchToCm(param1) * Math.pow(10,param2)) / Math.pow(10,param2);
         return "" + _loc3_ + (KGAMECLASS.kGAMECLASS.get_metric() ? "厘米" : "英寸");
      }
      
      public static function inchToCm(param1:Number) : Number
      {
         if(KGAMECLASS.kGAMECLASS.get_metric())
         {
            return param1 * 2.54;
         }
         return param1;
      }
      
      public static function briefHeight(param1:Number) : String
      {
         var _loc2_:int = int(Math.round(param1));
         var _loc3_:String = "";
         if(KGAMECLASS.kGAMECLASS.get_metric())
         {
            _loc2_ = int(Math.round(param1 * 2.54));
            return _loc2_ + "厘米";
         }
         if(param1 >= 12)
         {
            _loc3_ += int(param1 / 12) + "英尺";
         }
         if(param1 % 12 > 0)
         {
            _loc3_ += int(param1 % 12) + "英寸";
         }
         return _loc3_;
      }
   }
}

