package classes.scenes.npcs._IsabellaFollowerScene
{
   import coc.view.selfDebug.ArrayComponent_Int;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var oviElixirAmount:int;
      
      public var ghostJudged:Boolean;
      
      public var babyNotVirgin:Array;
      
      public function SaveContent(param1:Object = undefined, param2:Array = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ghostJudged = false;
         babyNotVirgin = [];
         oviElixirAmount = 0;
         if(param1 != null)
         {
            oviElixirAmount = param1;
         }
         if(param2 != null)
         {
            babyNotVirgin = param2;
         }
         if(param3 != null)
         {
            ghostJudged = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("oviElixirAmount","",new IntComponent(oviElixirAmount,function(param1:int):int
         {
            return _gthis.oviElixirAmount = param1;
         })),new DebugComp("babyNotVirgin","",new ArrayComponent_Int(babyNotVirgin,function(param1:Array):Array
         {
            return _gthis.babyNotVirgin = param1;
         })),new DebugComp("ghostJudged","",new BoolComponent(ghostJudged,function(param1:Boolean):Boolean
         {
            return _gthis.ghostJudged = param1;
         }))];
      }
   }
}

