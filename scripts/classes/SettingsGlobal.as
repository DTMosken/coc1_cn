package classes
{
   import flash.Boot;
   
   public class SettingsGlobal
   {
      
      public var misc:SettingsGlobalMisc;
      
      public var gameplay:SettingsGlobalGameplay;
      
      public var fetishes:SettingsGlobalFetishes;
      
      public var display:SettingsGlobalDisplay;
      
      public function SettingsGlobal(param1:SettingsGlobalGameplay = undefined, param2:SettingsGlobalDisplay = undefined, param3:SettingsGlobalFetishes = undefined, param4:SettingsGlobalMisc = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         misc = new SettingsGlobalMisc(null,null,null);
         fetishes = new SettingsGlobalFetishes(null,null,null,null,null,null,null,null);
         display = new SettingsGlobalDisplay(null,null,null,null,null,null,null,null,null,null,null);
         gameplay = new SettingsGlobalGameplay(null,null,null,null,null,null);
         if(param1 != null)
         {
            gameplay = param1;
         }
         if(param2 != null)
         {
            display = param2;
         }
         if(param3 != null)
         {
            fetishes = param3;
         }
         if(param4 != null)
         {
            misc = param4;
         }
      }
   }
}

