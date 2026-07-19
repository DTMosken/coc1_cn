package classes
{
   import flash.Boot;
   
   public class SettingsGlobalGameplay
   {
      
      public var quicksaveConfirm:Boolean;
      
      public var quickloadConfirm:Boolean;
      
      public var quickloadAnywhere:Boolean;
      
      public var preloadPath:String;
      
      public var preload:int;
      
      public var autoLevel:Boolean;
      
      public function SettingsGlobalGameplay(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         preloadPath = "";
         preload = 1;
         quickloadConfirm = true;
         quicksaveConfirm = true;
         quickloadAnywhere = false;
         autoLevel = false;
         if(param1 != null)
         {
            autoLevel = param1;
         }
         if(param2 != null)
         {
            quickloadAnywhere = param2;
         }
         if(param3 != null)
         {
            quicksaveConfirm = param3;
         }
         if(param4 != null)
         {
            quickloadConfirm = param4;
         }
         if(param5 != null)
         {
            preload = param5;
         }
         if(param6 != null)
         {
            preloadPath = param6;
         }
      }
   }
}

