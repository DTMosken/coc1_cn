package classes.bodyParts
{
   import flash.Boot;
   
   public class Hair
   {
      
      public static var NORMAL:int = 0;
      
      public static var FEATHER:int = 1;
      
      public static var GHOST:int = 2;
      
      public static var GOO:int = 3;
      
      public static var ANEMONE:int = 4;
      
      public static var QUILL:int = 5;
      
      public static var BASILISK_SPINES:int = 6;
      
      public static var BASILISK_PLUME:int = 7;
      
      public static var WOOL:int = 8;
      
      public static var VINE:int = 10;
      
      public var type:int;
      
      public var length:Number;
      
      public var flowerColor:String;
      
      public var color:String;
      
      public var adj:String;
      
      public function Hair()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         flowerColor = "";
         adj = "";
         length = 0;
         color = "no";
         type = 0;
      }
      
      public function restore() : void
      {
         type = 0;
         color = "no";
         length = 0;
         adj = "";
         flowerColor = "";
      }
      
      public function hasFlowers() : Boolean
      {
         return flowerColor != "";
      }
   }
}

