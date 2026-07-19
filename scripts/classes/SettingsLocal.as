package classes
{
   import flash.Boot;
   
   public class SettingsLocal
   {
      
      public var npc:SettingsNPC;
      
      public var modes:SettingsModes;
      
      public var globalRef:SettingsGlobal;
      
      public function SettingsLocal(param1:SettingsModes = undefined, param2:SettingsNPC = undefined, param3:SettingsGlobal = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalRef = null;
         npc = new SettingsNPC(null,null,null,null,null,null);
         modes = new SettingsModes(null,null,null,null,null,null,null,null,null,null,null,null,null,null);
         if(param1 != null)
         {
            modes = param1;
         }
         if(param2 != null)
         {
            npc = param2;
         }
         if(param3 != null)
         {
            globalRef = param3;
         }
      }
   }
}

