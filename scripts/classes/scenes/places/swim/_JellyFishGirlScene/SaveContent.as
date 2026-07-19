package classes.scenes.places.swim._JellyFishGirlScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var encountered:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         encountered = false;
         if(param1 != null)
         {
            encountered = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("encountered","",new BoolComponent(encountered,function(param1:Boolean):Boolean
         {
            return _gthis.encountered = param1;
         }))];
      }
   }
}

