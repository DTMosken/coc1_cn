package classes.bodyParts
{
   import classes.Creature;
   import flash.Boot;
   
   public class Claws
   {
      
      public static var NORMAL:int = 0;
      
      public static var LIZARD:int = 1;
      
      public static var DRAGON:int = 2;
      
      public static var SALAMANDER:int = 3;
      
      public static var CAT:int = 4;
      
      public static var DOG:int = 5;
      
      public static var FOX:int = 6;
      
      public static var MANTIS:int = 7;
      
      public static var IMP:int = 8;
      
      public static var COCKATRICE:int = 9;
      
      public static var RED_PANDA:int = 10;
      
      public static var FERRET:int = 11;
      
      public static var WOLF:int = 12;
      
      public var type:int;
      
      public var tone:String;
      
      public var _creature:Creature;
      
      public function Claws()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tone = "";
         type = 0;
      }
      
      public function set_type(param1:int) : int
      {
         type = param1;
         if(_creature != null)
         {
            _creature.updateUnarmed();
         }
         return type;
      }
      
      public function setCreature(param1:Creature) : void
      {
         _creature = param1;
      }
      
      public function restore() : void
      {
         set_type(0);
         tone = "";
      }
   }
}

