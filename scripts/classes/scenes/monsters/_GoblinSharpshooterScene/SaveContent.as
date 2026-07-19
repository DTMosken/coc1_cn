package classes.scenes.monsters._GoblinSharpshooterScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesEncountered:int;
      
      public var sawSmokeGrenade:Boolean;
      
      public var encounterCooldown:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         encounterCooldown = 0;
         sawSmokeGrenade = false;
         timesEncountered = 0;
         if(param1 != null)
         {
            timesEncountered = param1;
         }
         if(param2 != null)
         {
            sawSmokeGrenade = param2;
         }
         if(param3 != null)
         {
            encounterCooldown = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("timesEncountered","",new IntComponent(timesEncountered,function(param1:int):int
         {
            return _gthis.timesEncountered = param1;
         })),new DebugComp("sawSmokeGrenade","",new BoolComponent(sawSmokeGrenade,function(param1:Boolean):Boolean
         {
            return _gthis.sawSmokeGrenade = param1;
         })),new DebugComp("encounterCooldown","",new IntComponent(encounterCooldown,function(param1:int):int
         {
            return _gthis.encounterCooldown = param1;
         }))];
      }
   }
}

