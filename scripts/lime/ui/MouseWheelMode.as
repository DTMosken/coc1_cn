package lime.ui
{
   import flash.Boot;
   
   public final class MouseWheelMode
   {
      
      public static const __isenum:Boolean = true;
      
      public static var LINES:MouseWheelMode = new MouseWheelMode("LINES",1,null);
      
      public static var PAGES:MouseWheelMode = new MouseWheelMode("PAGES",2,null);
      
      public static var PIXELS:MouseWheelMode = new MouseWheelMode("PIXELS",0,null);
      
      public static var UNKNOWN:MouseWheelMode = new MouseWheelMode("UNKNOWN",3,null);
      
      public static var __constructs__:Array = ["PIXELS","LINES","PAGES","UNKNOWN"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function MouseWheelMode(param1:String, param2:int, param3:Array)
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

