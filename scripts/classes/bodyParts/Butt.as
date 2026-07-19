package classes.bodyParts
{
   import flash.Boot;
   
   public class Butt
   {
      
      public static var RATING_BUTTLESS:int = 0;
      
      public static var RATING_TIGHT:int = 2;
      
      public static var RATING_AVERAGE:int = 4;
      
      public static var RATING_NOTICEABLE:int = 6;
      
      public static var RATING_LARGE:int = 8;
      
      public static var RATING_JIGGLY:int = 10;
      
      public static var RATING_EXPANSIVE:int = 13;
      
      public static var RATING_HUGE:int = 16;
      
      public static var RATING_INCONCEIVABLY_BIG:int = 20;
      
      public var rating:Number;
      
      public function Butt()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         rating = 0;
      }
   }
}

