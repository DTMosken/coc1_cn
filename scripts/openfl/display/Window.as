package openfl.display
{
   import flash.Boot;
   import flash.display.Stage;
   import lime.app.Application;
   import lime.ui.Window;
   import openfl.utils._internal.Lib;
   
   public class Window extends lime.ui.Window
   {
      
      public static var __meta__:* = {
         "obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "fields":{"_":{"SuppressWarnings":["checkstyle:Dynamic"]}}
      };
      
      public function Window(param1:lime.app.Application = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2);
         stage = Lib.current.stage;
      }
      
      override public function close() : void
      {
         super.close();
         if(onClose.canceled)
         {
            return;
         }
         if(stage == null)
         {
            return;
         }
         stage = null;
      }
   }
}

