package lime.graphics
{
   import flash.display.Sprite;
   import lime.graphics.cairo.Cairo;
   import lime.ui.Window;
   
   public class RenderContext
   {
      
      public var window:Window;
      
      public var webgl2:*;
      
      public var webgl:*;
      
      public var version:String;
      
      public var type:String;
      
      public var gles3:*;
      
      public var gles2:*;
      
      public var gl:*;
      
      public var flash:Sprite;
      
      public var dom:*;
      
      public var canvas2D:*;
      
      public var cairo:Cairo;
      
      public var attributes:Object;
      
      public function RenderContext()
      {
      }
   }
}

