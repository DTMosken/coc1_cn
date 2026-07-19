package lime.system
{
   import lime.math.Rectangle;
   
   public class Display
   {
      
      public var supportedModes:Array;
      
      public var safeArea:Rectangle;
      
      public var orientation:int;
      
      public var name:String;
      
      public var id:int;
      
      public var dpi:Number;
      
      public var currentMode:DisplayMode;
      
      public var bounds:Rectangle;
      
      public function Display()
      {
      }
   }
}

