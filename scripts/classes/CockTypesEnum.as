package classes
{
   import flash.Boot;
   
   public class CockTypesEnum
   {
      
      public static var init__:Boolean;
      
      public static var HUMAN:CockTypesEnum;
      
      public static var HORSE:CockTypesEnum;
      
      public static var DOG:CockTypesEnum;
      
      public static var DEMON:CockTypesEnum;
      
      public static var TENTACLE:CockTypesEnum;
      
      public static var CAT:CockTypesEnum;
      
      public static var LIZARD:CockTypesEnum;
      
      public static var ANEMONE:CockTypesEnum;
      
      public static var KANGAROO:CockTypesEnum;
      
      public static var DRAGON:CockTypesEnum;
      
      public static var DISPLACER:CockTypesEnum;
      
      public static var FOX:CockTypesEnum;
      
      public static var BEE:CockTypesEnum;
      
      public static var PIG:CockTypesEnum;
      
      public static var AVIAN:CockTypesEnum;
      
      public static var RHINO:CockTypesEnum;
      
      public static var ECHIDNA:CockTypesEnum;
      
      public static var WOLF:CockTypesEnum;
      
      public static var RED_PANDA:CockTypesEnum;
      
      public static var FERRET:CockTypesEnum;
      
      public static var GNOLL:CockTypesEnum;
      
      public static var UNDEFINED:CockTypesEnum;
      
      public static var _enumData:Array = [];
      
      public var _name:String;
      
      public var _index:int;
      
      public var _group:String;
      
      public function CockTypesEnum(param1:int = 0, param2:String = undefined, param3:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _group = param3;
         _index = param1;
         _name = param2;
         CockTypesEnum._enumData[param1] = this;
      }
      
      public static function ParseConstantByIndex(param1:int = 0) : CockTypesEnum
      {
         return CockTypesEnum._enumData[param1];
      }
      
      public function toString() : String
      {
         return _name;
      }
      
      public function get_Name() : String
      {
         return _name;
      }
      
      public function get_Index() : int
      {
         return _index;
      }
      
      public function get_Group() : String
      {
         return _group;
      }
   }
}

