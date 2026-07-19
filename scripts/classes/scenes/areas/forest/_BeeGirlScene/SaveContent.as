package classes.scenes.areas.forest._BeeGirlScene
{
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesEgged:int;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         timesEgged = 0;
         if(param1 != null)
         {
            timesEgged = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("timesEgged","",new IntComponent(timesEgged,function(param1:int):int
         {
            return _gthis.timesEgged = param1;
         }))];
      }
   }
}

