package classes.bodyParts
{
   import flash.Boot;
   
   public class Beard
   {
      
      public static var NORMAL:int = 0;
      
      public static var GOATEE:int = 1;
      
      public static var CLEANCUT:int = 2;
      
      public static var MOUNTAINMAN:int = 3;
      
      public var style:int;
      
      public var length:Number;
      
      public function Beard()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         length = 0;
         style = 0;
      }
   }
}

