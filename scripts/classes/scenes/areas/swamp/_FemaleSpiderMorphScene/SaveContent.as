package classes.scenes.areas.swamp._FemaleSpiderMorphScene
{
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var spidersKilled:int;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         spidersKilled = 0;
         if(param1 != null)
         {
            spidersKilled = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("spidersKilled","",new IntComponent(spidersKilled,function(param1:int):int
         {
            return _gthis.spidersKilled = param1;
         }))];
      }
   }
}

