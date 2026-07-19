package classes.scenes.areas.volcanicCrag._HellmouthScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var ambushed:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ambushed = false;
         if(param1 != null)
         {
            ambushed = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("ambushed","",new BoolComponent(ambushed,function(param1:Boolean):Boolean
         {
            return _gthis.ambushed = param1;
         }))];
      }
   }
}

