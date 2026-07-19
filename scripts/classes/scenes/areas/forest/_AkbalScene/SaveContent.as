package classes.scenes.areas.forest._AkbalScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesRaped:int;
      
      public var strayCat:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         strayCat = false;
         timesRaped = 0;
         if(param1 != null)
         {
            timesRaped = param1;
         }
         if(param2 != null)
         {
            strayCat = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("timesRaped","",new IntComponent(timesRaped,function(param1:int):int
         {
            return _gthis.timesRaped = param1;
         })),new DebugComp("strayCat","",new BoolComponent(strayCat,function(param1:Boolean):Boolean
         {
            return _gthis.strayCat = param1;
         }))];
      }
   }
}

