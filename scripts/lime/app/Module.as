package lime.app
{
   import flash.Boot;
   
   public class Module implements IModule
   {
      
      public var onExit:_Event_Int_Void;
      
      public function Module()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         onExit = new _Event_Int_Void();
      }
      
      public function __unregisterLimeModule(param1:Application) : void
      {
      }
      
      public function __registerLimeModule(param1:Application) : void
      {
      }
   }
}

