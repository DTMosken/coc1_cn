package classes.bodyParts
{
   import flash.Boot;
   
   public class Gills
   {
      
      public static var NONE:int = 0;
      
      public static var ANEMONE:int = 1;
      
      public static var FISH:int = 2;
      
      public static var MERMAID:int = 3;
      
      public var type:Number;
      
      public function Gills()
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

