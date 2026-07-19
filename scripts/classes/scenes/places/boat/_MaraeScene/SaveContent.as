package classes.scenes.places.boat._MaraeScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var feraMet:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         feraMet = false;
         if(param1 != null)
         {
            feraMet = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("feraMet","",new BoolComponent(feraMet,function(param1:Boolean):Boolean
         {
            return _gthis.feraMet = param1;
         }))];
      }
   }
}

