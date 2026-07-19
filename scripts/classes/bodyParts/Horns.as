package classes.bodyParts
{
   import flash.Boot;
   
   public class Horns
   {
      
      public static var NONE:int = 0;
      
      public static var DEMON:int = 1;
      
      public static var COW_MINOTAUR:int = 2;
      
      public static var DRACONIC_X2:int = 3;
      
      public static var DRACONIC_X4_12_INCH_LONG:int = 4;
      
      public static var ANTLERS:int = 5;
      
      public static var GOAT:int = 6;
      
      public static var UNICORN:int = 7;
      
      public static var RHINO:int = 8;
      
      public static var SHEEP:int = 9;
      
      public static var RAM:int = 10;
      
      public static var IMP:int = 11;
      
      public static var WOODEN:int = 12;
      
      public static var ANTELOPE:int = 13;
      
      public var value:Number;
      
      public var type:int;
      
      public function Horns()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         value = 0;
         type = 0;
      }
      
      public function restore() : void
      {
         type = 0;
         value = 0;
      }
   }
}

