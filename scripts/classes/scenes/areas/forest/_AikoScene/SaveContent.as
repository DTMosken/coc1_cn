package classes.scenes.areas.forest._AikoScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var akbalDone:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         akbalDone = false;
         if(param1 != null)
         {
            akbalDone = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("akbalDone","",new BoolComponent(akbalDone,function(param1:Boolean):Boolean
         {
            return _gthis.akbalDone = param1;
         }))];
      }
   }
}

