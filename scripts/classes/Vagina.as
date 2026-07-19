package classes
{
   import classes.internals.Serializable;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Vagina implements Serializable
   {
      
      public static var SERIALIZATION_VERSION:int = 1;
      
      public static var HUMAN:int = 0;
      
      public static var EQUINE:int = 1;
      
      public static var BLACK_SAND_TRAP:int = 5;
      
      public static var WETNESS_DRY:int = 0;
      
      public static var WETNESS_NORMAL:int = 1;
      
      public static var WETNESS_WET:int = 2;
      
      public static var WETNESS_SLICK:int = 3;
      
      public static var WETNESS_DROOLING:int = 4;
      
      public static var WETNESS_SLAVERING:int = 5;
      
      public static var LOOSENESS_TIGHT:int = 0;
      
      public static var LOOSENESS_NORMAL:int = 1;
      
      public static var LOOSENESS_LOOSE:int = 2;
      
      public static var LOOSENESS_GAPING:int = 3;
      
      public static var LOOSENESS_GAPING_WIDE:int = 4;
      
      public static var LOOSENESS_LEVEL_CLOWN_CAR:int = 5;
      
      public static var DEFAULT_CLIT_LENGTH:Number = 0.5;
      
      public var virgin:Boolean;
      
      public var vaginalWetness:Number;
      
      public var vaginalLooseness:int;
      
      public var type:int;
      
      public var recoveryProgress:int;
      
      public var labiaPierced:Number;
      
      public var labiaPShort:String;
      
      public var labiaPLong:String;
      
      public var fullness:Number;
      
      public var clitPierced:Number;
      
      public var clitPShort:String;
      
      public var clitPLong:String;
      
      public var clitLength:Number;
      
      public function Vagina(param1:Number = 1, param2:int = 0, param3:Boolean = false, param4:Number = 0.5)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         recoveryProgress = 0;
         clitLength = Number(Math.NaN);
         clitPLong = "";
         clitPShort = "";
         clitPierced = 0;
         labiaPLong = "";
         labiaPShort = "";
         labiaPierced = 0;
         fullness = 0;
         virgin = true;
         type = 0;
         vaginalLooseness = 0;
         vaginalWetness = 1;
         virgin = param3;
         vaginalWetness = param1;
         vaginalLooseness = param2;
         clitLength = param4;
         recoveryProgress = 0;
      }
      
      public function willStretch(param1:Number, param2:Boolean = false, param3:Number = 0) : Boolean
      {
         if(param2 || vaginalLooseness > 1)
         {
            return false;
         }
         if(param1 >= capacity(param3))
         {
            return true;
         }
         if(param1 >= 0.9 * capacity(param3) && Utils.trueOnceInN(2))
         {
            return true;
         }
         if(param1 >= 0.75 * capacity(param3) && Utils.trueOnceInN(4))
         {
            return true;
         }
         return false;
      }
      
      public function wetnessFactor() : Number
      {
         return 1 + vaginalWetness / 10;
      }
      
      public function validate() : String
      {
         var _loc1_:String = "";
         _loc1_ += Utils.validateNonNegativeNumberFields(this,"Vagina.validate",["vaginalWetness","vaginalLooseness","type","fullness","labiaPierced","clitPierced","clitLength","recoveryProgress"]);
         if(labiaPierced != 0)
         {
            if(labiaPShort == "")
            {
               _loc1_ += "阴唇已穿孔，但 labiaPShort = \'\'。";
            }
            if(labiaPLong == "")
            {
               _loc1_ += "阴唇已穿孔，但 labiaPLong = \'\'。";
            }
         }
         else
         {
            if(labiaPShort != "")
            {
               _loc1_ += "阴唇未穿孔，但 labiaPShort = \'" + labiaPShort + "\'。";
            }
            if(labiaPLong != "")
            {
               _loc1_ += "阴唇未穿孔，但 labiaPLong = \'" + labiaPShort + "\'. ";
            }
         }
         if(clitPierced != 0)
         {
            if(clitPShort == "")
            {
               _loc1_ += "阴蒂已穿孔，但 labiaPShort = \'\'. ";
            }
            if(clitPLong == "")
            {
               _loc1_ += "阴蒂已穿孔，但 labiaPLong = \'\'. ";
            }
         }
         else
         {
            if(clitPShort != "")
            {
               _loc1_ += "阴蒂未穿孔，但 labiaPShort = \'" + labiaPShort + "\'. ";
            }
            if(clitPLong != "")
            {
               _loc1_ += "阴蒂未穿孔，但 labiaPLong = \'" + labiaPShort + "\'. ";
            }
         }
         return _loc1_;
      }
      
      public function stretch(param1:Number, param2:Boolean = false, param3:Number = 0) : Boolean
      {
         var _loc4_:Boolean = false;
         if(!param2 || vaginalLooseness <= 1)
         {
            if(param1 >= capacity(param3))
            {
               vaginalLooseness += 1;
               _loc4_ = true;
            }
            else if(param1 >= 0.9 * capacity(param3) && Utils.rand(2) == 0)
            {
               vaginalLooseness += 1;
               _loc4_ = true;
            }
            else if(param1 >= 0.75 * capacity(param3) && Utils.rand(4) == 0)
            {
               vaginalLooseness += 1;
               _loc4_ = true;
            }
         }
         if(vaginalLooseness > 5)
         {
            vaginalLooseness = 5;
         }
         if(param2 && vaginalLooseness > 1)
         {
            vaginalLooseness = 1;
         }
         if(virgin)
         {
            virgin = false;
         }
         return _loc4_;
      }
      
      public function serialize(param1:*) : void
      {
         param1.type = type;
         param1.vaginalWetness = vaginalWetness;
         param1.vaginalLooseness = vaginalLooseness;
         param1.fullness = fullness;
         param1.virgin = virgin;
         param1.labiaPierced = labiaPierced;
         param1.labiaPShort = labiaPShort;
         param1.labiaPLong = labiaPLong;
         param1.clitPierced = clitPierced;
         param1.clitPShort = clitPShort;
         param1.clitPLong = clitPLong;
         param1.clitLength = clitLength;
         param1.recoveryProgress = recoveryProgress;
      }
      
      public function resetRecoveryProgress() : void
      {
         recoveryProgress = 0;
      }
      
      public function deserialize(param1:*) : void
      {
         vaginalWetness = param1.vaginalWetness;
         vaginalLooseness = param1.vaginalLooseness;
         fullness = param1.fullness;
         virgin = param1.virgin;
         type = param1.type;
         labiaPierced = param1.labiaPierced;
         labiaPShort = param1.labiaPShort;
         labiaPLong = param1.labiaPLong;
         clitPierced = param1.clitPierced;
         clitPShort = param1.clitPShort;
         clitPLong = param1.clitPLong;
         clitLength = param1.clitLength;
         recoveryProgress = param1.recoveryProgress;
      }
      
      public function capacity(param1:Number = 0) : Number
      {
         return baseCapacity(param1) * wetnessFactor();
      }
      
      public function baseCapacity(param1:Number) : Number
      {
         return param1 + 8 * vaginalLooseness * vaginalLooseness;
      }
   }
}

