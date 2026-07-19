package classes.scenes.areas._Forest
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var foundFruit:Boolean;
      
      public var faerieXImp:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         faerieXImp = false;
         foundFruit = false;
         if(param1 != null)
         {
            foundFruit = param1;
         }
         if(param2 != null)
         {
            faerieXImp = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("foundFruit","",new BoolComponent(foundFruit,function(param1:Boolean):Boolean
         {
            return _gthis.foundFruit = param1;
         })),new DebugComp("faerieXImp","",new BoolComponent(faerieXImp,function(param1:Boolean):Boolean
         {
            return _gthis.faerieXImp = param1;
         }))];
      }
   }
}

