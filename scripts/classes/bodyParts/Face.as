package classes.bodyParts
{
   import classes.Creature;
   import flash.Boot;
   
   public class Face
   {
      
      public static var HUMAN:int = 0;
      
      public static var HORSE:int = 1;
      
      public static var DOG:int = 2;
      
      public static var COW_MINOTAUR:int = 3;
      
      public static var SHARK_TEETH:int = 4;
      
      public static var SNAKE_FANGS:int = 5;
      
      public static var CATGIRL:int = 6;
      
      public static var LIZARD:int = 7;
      
      public static var BUNNY:int = 8;
      
      public static var KANGAROO:int = 9;
      
      public static var SPIDER_FANGS:int = 10;
      
      public static var FOX:int = 11;
      
      public static var DRAGON:int = 12;
      
      public static var RACCOON_MASK:int = 13;
      
      public static var RACCOON:int = 14;
      
      public static var BUCKTEETH:int = 15;
      
      public static var MOUSE:int = 16;
      
      public static var FERRET_MASK:int = 17;
      
      public static var FERRET:int = 18;
      
      public static var PIG:int = 19;
      
      public static var BOAR:int = 20;
      
      public static var RHINO:int = 21;
      
      public static var ECHIDNA:int = 22;
      
      public static var DEER:int = 23;
      
      public static var WOLF:int = 24;
      
      public static var COCKATRICE:int = 25;
      
      public static var BEAK:int = 26;
      
      public static var RED_PANDA:int = 27;
      
      public static var CAT:int = 28;
      
      public static var GNOLL:int = 29;
      
      public static var BAT:int = 30;
      
      public var type:int;
      
      public var _creature:Creature;
      
      public function Face(param1:Creature = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = 0;
         _creature = param1;
      }
      
      public function setType(param1:int, param2:Object = undefined) : void
      {
         type = param1;
         if(_creature == null)
         {
            return;
         }
         if(param2 != null)
         {
            _creature.eyes.setType(param2);
            return;
         }
         switch(param1)
         {
            case 6:
            case 28:
               _creature.eyes.setType(9);
         }
      }
      
      public function restore() : void
      {
         type = 0;
      }
   }
}

