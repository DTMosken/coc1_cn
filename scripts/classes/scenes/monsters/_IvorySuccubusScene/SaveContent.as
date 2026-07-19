package classes.scenes.monsters._IvorySuccubusScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesLost:int;
      
      public var met:Boolean;
      
      public var deadHookers:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         timesLost = 0;
         deadHookers = 0;
         met = false;
         if(param1 != null)
         {
            met = param1;
         }
         if(param2 != null)
         {
            deadHookers = param2;
         }
         if(param3 != null)
         {
            timesLost = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("met","",new BoolComponent(met,function(param1:Boolean):Boolean
         {
            return _gthis.met = param1;
         })),new DebugComp("deadHookers","",new IntComponent(deadHookers,function(param1:int):int
         {
            return _gthis.deadHookers = param1;
         })),new DebugComp("timesLost","",new IntComponent(timesLost,function(param1:int):int
         {
            return _gthis.timesLost = param1;
         }))];
      }
   }
}

