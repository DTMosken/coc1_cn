package classes.bodyParts
{
   import flash.Boot;
   
   public class Tongue
   {
      
      public static var HUMAN:int = 0;
      
      public static var SNAKE:int = 1;
      
      public static var DEMONIC:int = 2;
      
      public static var DRACONIC:int = 3;
      
      public static var ECHIDNA:int = 4;
      
      public static var LIZARD:int = 5;
      
      public static var CAT:int = 6;
      
      public var type:int;
      
      public function Tongue()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = 0;
      }
      
      public function restore() : void
      {
         type = 0;
      }
   }
}

