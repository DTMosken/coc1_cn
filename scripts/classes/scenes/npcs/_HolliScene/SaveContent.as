package classes.scenes.npcs._HolliScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var growingGlades:Boolean;
      
      public var fruitsEaten:int;
      
      public var askedGlades:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         fruitsEaten = 0;
         growingGlades = false;
         askedGlades = false;
         if(param1 != null)
         {
            askedGlades = param1;
         }
         if(param2 != null)
         {
            growingGlades = param2;
         }
         if(param3 != null)
         {
            fruitsEaten = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("askedGlades","",new BoolComponent(askedGlades,function(param1:Boolean):Boolean
         {
            return _gthis.askedGlades = param1;
         })),new DebugComp("growingGlades","",new BoolComponent(growingGlades,function(param1:Boolean):Boolean
         {
            return _gthis.growingGlades = param1;
         })),new DebugComp("fruitsEaten","",new IntComponent(fruitsEaten,function(param1:int):int
         {
            return _gthis.fruitsEaten = param1;
         }))];
      }
   }
}

