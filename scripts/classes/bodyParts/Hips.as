package classes.bodyParts
{
   import flash.Boot;
   
   public class Hips
   {
      
      public static var RATING_BOYISH:int = 0;
      
      public static var RATING_SLENDER:int = 2;
      
      public static var RATING_AVERAGE:int = 4;
      
      public static var RATING_AMPLE:int = 6;
      
      public static var RATING_CURVY:int = 10;
      
      public static var RATING_FERTILE:int = 15;
      
      public static var RATING_INHUMANLY_WIDE:int = 20;
      
      public var rating:Number;
      
      public function Hips()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         rating = 0;
      }
   }
}

