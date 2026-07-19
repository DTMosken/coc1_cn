package lime.ui
{
   import flash.Boot;
   
   public final class MouseCursor
   {
      
      public static const __isenum:Boolean = true;
      
      public static var ARROW:MouseCursor = new MouseCursor("ARROW",0,null);
      
      public static var CROSSHAIR:MouseCursor = new MouseCursor("CROSSHAIR",1,null);
      
      public static var CUSTOM:MouseCursor = new MouseCursor("CUSTOM",12,null);
      
      public static var DEFAULT:MouseCursor = new MouseCursor("DEFAULT",2,null);
      
      public static var MOVE:MouseCursor = new MouseCursor("MOVE",3,null);
      
      public static var POINTER:MouseCursor = new MouseCursor("POINTER",4,null);
      
      public static var RESIZE_NESW:MouseCursor = new MouseCursor("RESIZE_NESW",5,null);
      
      public static var RESIZE_NS:MouseCursor = new MouseCursor("RESIZE_NS",6,null);
      
      public static var RESIZE_NWSE:MouseCursor = new MouseCursor("RESIZE_NWSE",7,null);
      
      public static var RESIZE_WE:MouseCursor = new MouseCursor("RESIZE_WE",8,null);
      
      public static var TEXT:MouseCursor = new MouseCursor("TEXT",9,null);
      
      public static var WAIT:MouseCursor = new MouseCursor("WAIT",10,null);
      
      public static var WAIT_ARROW:MouseCursor = new MouseCursor("WAIT_ARROW",11,null);
      
      public static var __constructs__:Array = ["ARROW","CROSSHAIR","DEFAULT","MOVE","POINTER","RESIZE_NESW","RESIZE_NS","RESIZE_NWSE","RESIZE_WE","TEXT","WAIT","WAIT_ARROW","CUSTOM"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function MouseCursor(param1:String, param2:int, param3:Array)
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

