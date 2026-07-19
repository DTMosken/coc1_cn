package classes.bodyParts
{
   import flash.Boot;
   
   public class Antennae
   {
      
      public static var NONE:int = 0;
      
      public static var BEE:int = 2;
      
      public static var COCKATRICE:int = 3;
      
      public var type:int;
      
      public function Antennae()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = 0;
      }
   }
}

