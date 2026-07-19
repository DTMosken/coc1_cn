package classes.scenes.camp._ImpGangBang
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var neverAsk:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         neverAsk = false;
         if(param1 != null)
         {
            neverAsk = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("neverAsk","",new BoolComponent(neverAsk,function(param1:Boolean):Boolean
         {
            return _gthis.neverAsk = param1;
         }))];
      }
   }
}

