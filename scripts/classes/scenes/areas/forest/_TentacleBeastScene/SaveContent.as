package classes.scenes.areas.forest._TentacleBeastScene
{
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesLost:int;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         timesLost = 0;
         if(param1 != null)
         {
            timesLost = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("timesLost","",new IntComponent(timesLost,function(param1:int):int
         {
            return _gthis.timesLost = param1;
         }))];
      }
   }
}

