package classes.bodyParts
{
   import flash.Boot;
   
   public class Ears
   {
      
      public static var HUMAN:int = 0;
      
      public static var HORSE:int = 1;
      
      public static var DOG:int = 2;
      
      public static var COW:int = 3;
      
      public static var ELFIN:int = 4;
      
      public static var CAT:int = 5;
      
      public static var LIZARD:int = 6;
      
      public static var BUNNY:int = 7;
      
      public static var KANGAROO:int = 8;
      
      public static var FOX:int = 9;
      
      public static var DRAGON:int = 10;
      
      public static var RACCOON:int = 11;
      
      public static var MOUSE:int = 12;
      
      public static var FERRET:int = 13;
      
      public static var PIG:int = 14;
      
      public static var RHINO:int = 15;
      
      public static var ECHIDNA:int = 16;
      
      public static var DEER:int = 17;
      
      public static var WOLF:int = 18;
      
      public static var SHEEP:int = 19;
      
      public static var IMP:int = 20;
      
      public static var COCKATRICE:int = 21;
      
      public static var RED_PANDA:int = 22;
      
      public static var GNOLL:int = 23;
      
      public static var BAT:int = 24;
      
      public var value:Number;
      
      public var type:int;
      
      public function Ears()
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

