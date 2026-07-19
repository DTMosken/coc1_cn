package classes.bodyParts
{
   import flash.Boot;
   
   public class Tail
   {
      
      public static var NONE:int = 0;
      
      public static var HORSE:int = 1;
      
      public static var DOG:int = 2;
      
      public static var DEMONIC:int = 3;
      
      public static var COW:int = 4;
      
      public static var SPIDER_ABDOMEN:int = 5;
      
      public static var BEE_ABDOMEN:int = 6;
      
      public static var SHARK:int = 7;
      
      public static var CAT:int = 8;
      
      public static var LIZARD:int = 9;
      
      public static var RABBIT:int = 10;
      
      public static var HARPY:int = 11;
      
      public static var KANGAROO:int = 12;
      
      public static var FOX:int = 13;
      
      public static var DRACONIC:int = 14;
      
      public static var RACCOON:int = 15;
      
      public static var MOUSE:int = 16;
      
      public static var FERRET:int = 17;
      
      public static var PIG:int = 19;
      
      public static var SCORPION:int = 20;
      
      public static var GOAT:int = 21;
      
      public static var RHINO:int = 22;
      
      public static var ECHIDNA:int = 23;
      
      public static var DEER:int = 24;
      
      public static var SALAMANDER:int = 25;
      
      public static var WOLF:int = 26;
      
      public static var SHEEP:int = 27;
      
      public static var IMP:int = 28;
      
      public static var COCKATRICE:int = 29;
      
      public static var RED_PANDA:int = 30;
      
      public static var GNOLL:int = 31;
      
      public var venom:Number;
      
      public var type:int;
      
      public var recharge:Number;
      
      public function Tail()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         recharge = 5;
         venom = 0;
         type = 0;
      }
      
      public function restore() : void
      {
         type = 0;
         venom = 0;
         recharge = 5;
      }
   }
}

