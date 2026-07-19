package lime.graphics
{
   import flash.Boot;
   
   public final class ImageType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var CANVAS:ImageType = new ImageType("CANVAS",0,null);
      
      public static var CUSTOM:ImageType = new ImageType("CUSTOM",3,null);
      
      public static var DATA:ImageType = new ImageType("DATA",1,null);
      
      public static var FLASH:ImageType = new ImageType("FLASH",2,null);
      
      public static var __constructs__:Array = ["CANVAS","DATA","FLASH","CUSTOM"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ImageType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

