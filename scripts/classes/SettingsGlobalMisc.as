package classes
{
   import flash.Boot;
   
   public class SettingsGlobalMisc
   {
      
      public var lastFileSaveTime:Number;
      
      public var lastFileSaveName:String;
      
      public var hermUnlocked:Boolean;
      
      public function SettingsGlobalMisc(param1:Object = undefined, param2:String = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         lastFileSaveTime = 0;
         lastFileSaveName = "";
         hermUnlocked = false;
         if(param1 != null)
         {
            hermUnlocked = param1;
         }
         if(param2 != null)
         {
            lastFileSaveName = param2;
         }
         if(param3 != null)
         {
            lastFileSaveTime = param3;
         }
      }
   }
}

