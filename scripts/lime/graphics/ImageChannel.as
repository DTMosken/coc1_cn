package lime.graphics
{
   import flash.Boot;
   
   public final class ImageChannel
   {
      
      public static const __isenum:Boolean = true;
      
      public static var ALPHA:ImageChannel = new ImageChannel("ALPHA",3,null);
      
      public static var BLUE:ImageChannel = new ImageChannel("BLUE",2,null);
      
      public static var GREEN:ImageChannel = new ImageChannel("GREEN",1,null);
      
      public static var RED:ImageChannel = new ImageChannel("RED",0,null);
      
      public static var __constructs__:Array = ["RED","GREEN","BLUE","ALPHA"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ImageChannel(param1:String, param2:int, param3:Array)
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

