package classes.scenes.places.swim._SharkManScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var hasLost:Boolean;
      
      public var encountered:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         hasLost = false;
         encountered = false;
         if(param1 != null)
         {
            encountered = param1;
         }
         if(param2 != null)
         {
            hasLost = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("encountered","",new BoolComponent(encountered,function(param1:Boolean):Boolean
         {
            return _gthis.encountered = param1;
         })),new DebugComp("hasLost","",new BoolComponent(hasLost,function(param1:Boolean):Boolean
         {
            return _gthis.hasLost = param1;
         }))];
      }
   }
}

