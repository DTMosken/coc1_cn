package classes
{
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Ass
   {
      
      public static var SERIALIZATION_VERSION:int = 1;
      
      public static var WETNESS_DRY:int = 0;
      
      public static var WETNESS_NORMAL:int = 1;
      
      public static var WETNESS_MOIST:int = 2;
      
      public static var WETNESS_SLIMY:int = 3;
      
      public static var WETNESS_DROOLING:int = 4;
      
      public static var WETNESS_SLIME_DROOLING:int = 5;
      
      public static var LOOSENESS_VIRGIN:int = 0;
      
      public static var LOOSENESS_TIGHT:int = 1;
      
      public static var LOOSENESS_NORMAL:int = 2;
      
      public static var LOOSENESS_LOOSE:int = 3;
      
      public static var LOOSENESS_STRETCHED:int = 4;
      
      public static var LOOSENESS_GAPING:int = 5;
      
      public var virgin:Boolean;
      
      public var fullness:int;
      
      public var analWetness:int;
      
      public var analLooseness:int;
      
      public function Ass()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         virgin = true;
         fullness = 0;
         analLooseness = 0;
         analWetness = 0;
      }
      
      public function validate() : String
      {
         var _loc1_:String = "";
         return _loc1_ + Utils.validateNonNegativeNumberFields(this,"Ass.validate",["analWetness","analLooseness","fullness"]);
      }
   }
}

