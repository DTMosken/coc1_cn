package classes.scenes.places._Owca
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var rebeccKilled:Boolean;
      
      public var lostPit:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         lostPit = false;
         rebeccKilled = false;
         if(param1 != null)
         {
            rebeccKilled = param1;
         }
         if(param2 != null)
         {
            lostPit = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("rebeccKilled","",new BoolComponent(rebeccKilled,function(param1:Boolean):Boolean
         {
            return _gthis.rebeccKilled = param1;
         })),new DebugComp("lostPit","",new BoolComponent(lostPit,function(param1:Boolean):Boolean
         {
            return _gthis.lostPit = param1;
         }))];
      }
   }
}

