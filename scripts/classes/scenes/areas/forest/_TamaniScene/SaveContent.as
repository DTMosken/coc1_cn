package classes.scenes.areas.forest._TamaniScene
{
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesRidden:int;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         timesRidden = 0;
         if(param1 != null)
         {
            timesRidden = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("timesRidden","",new IntComponent(timesRidden,function(param1:int):int
         {
            return _gthis.timesRidden = param1;
         }))];
      }
   }
}

