package classes.scenes.monsters._PlagueRatScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var ratsKilled:int;
      
      public var metRat:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ratsKilled = 0;
         metRat = false;
         if(param1 != null)
         {
            metRat = param1;
         }
         if(param2 != null)
         {
            ratsKilled = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("metRat","",new BoolComponent(metRat,function(param1:Boolean):Boolean
         {
            return _gthis.metRat = param1;
         })),new DebugComp("ratsKilled","",new IntComponent(ratsKilled,function(param1:int):int
         {
            return _gthis.ratsKilled = param1;
         }))];
      }
   }
}

