package classes.scenes.areas.desert._OasisShamanScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var didEncounter:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         didEncounter = false;
         if(param1 != null)
         {
            didEncounter = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("didEncounter","",new BoolComponent(didEncounter,function(param1:Boolean):Boolean
         {
            return _gthis.didEncounter = param1;
         }))];
      }
   }
}

