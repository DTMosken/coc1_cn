package classes.scenes.areas._Desert
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var foundMirage:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         foundMirage = false;
         if(param1 != null)
         {
            foundMirage = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("foundMirage","",new BoolComponent(foundMirage,function(param1:Boolean):Boolean
         {
            return _gthis.foundMirage = param1;
         }))];
      }
   }
}

