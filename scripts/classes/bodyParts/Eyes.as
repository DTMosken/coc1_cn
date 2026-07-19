package classes.bodyParts
{
   import flash.Boot;
   
   public class Eyes
   {
      
      public static var HUMAN:int = 0;
      
      public static var FOUR_SPIDER_EYES:int = 1;
      
      public static var BLACK_EYES_SAND_TRAP:int = 2;
      
      public static var LIZARD:int = 3;
      
      public static var DRAGON:int = 4;
      
      public static var BASILISK:int = 5;
      
      public static var WOLF:int = 6;
      
      public static var SPIDER:int = 7;
      
      public static var COCKATRICE:int = 8;
      
      public static var CAT:int = 9;
      
      public var type:int;
      
      public var count:int;
      
      public function Eyes()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         count = 2;
         type = 0;
      }
      
      public function setType(param1:int, param2:Object = undefined) : void
      {
         type = param1;
         if(param2 != null)
         {
            count = param2;
            return;
         }
         switch(param1)
         {
            case 1:
            case 7:
               type = 7;
               count = 4;
               break;
            default:
               count = 2;
         }
      }
      
      public function restore() : void
      {
         type = 0;
         count = 2;
      }
   }
}

