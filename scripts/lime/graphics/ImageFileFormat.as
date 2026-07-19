package lime.graphics
{
   import flash.Boot;
   
   public final class ImageFileFormat
   {
      
      public static const __isenum:Boolean = true;
      
      public static var BMP:ImageFileFormat = new ImageFileFormat("BMP",0,null);
      
      public static var JPEG:ImageFileFormat = new ImageFileFormat("JPEG",1,null);
      
      public static var PNG:ImageFileFormat = new ImageFileFormat("PNG",2,null);
      
      public static var __constructs__:Array = ["BMP","JPEG","PNG"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ImageFileFormat(param1:String, param2:int, param3:Array)
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

