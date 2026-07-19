package lime._internal.backend.flash
{
   import flash.Boot;
   import flash.ui.Multitouch;
   import lime.app.Application;
   import lime.media.AudioManager;
   
   public class FlashApplication
   {
      
      public static var createFirstWindow:Boolean;
      
      public var requestedWindow:Boolean;
      
      public var parent:Application;
      
      public function FlashApplication(param1:Application = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         parent = param1;
         AudioManager.init();
         FlashApplication.createFirstWindow = true;
         param1.createWindow({});
         FlashApplication.createFirstWindow = false;
      }
      
      public function getDeviceOrientation() : int
      {
         return 0;
      }
      
      public function exit() : void
      {
      }
      
      public function exec() : int
      {
         Multitouch.inputMode = "touchPoint";
         return 0;
      }
   }
}

