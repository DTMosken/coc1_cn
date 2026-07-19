package classes.scenes.places._TelAdre
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var iceCreamed:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         iceCreamed = false;
         if(param1 != null)
         {
            iceCreamed = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("iceCreamed","",new BoolComponent(iceCreamed,function(param1:Boolean):Boolean
         {
            return _gthis.iceCreamed = param1;
         }))];
      }
   }
}

