package classes.scenes.npcs._HelFollower
{
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var lastTimeSex:int;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         lastTimeSex = 0;
         if(param1 != null)
         {
            lastTimeSex = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("lastTimeSex","",new IntComponent(lastTimeSex,function(param1:int):int
         {
            return _gthis.lastTimeSex = param1;
         }))];
      }
   }
}

