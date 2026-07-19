package classes.scenes.npcs.pets._Akky
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var harpiesHarassed:Boolean;
      
      public var giftedBear:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         harpiesHarassed = false;
         giftedBear = false;
         if(param1 != null)
         {
            giftedBear = param1;
         }
         if(param2 != null)
         {
            harpiesHarassed = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("giftedBear","",new BoolComponent(giftedBear,function(param1:Boolean):Boolean
         {
            return _gthis.giftedBear = param1;
         })),new DebugComp("harpiesHarassed","",new BoolComponent(harpiesHarassed,function(param1:Boolean):Boolean
         {
            return _gthis.harpiesHarassed = param1;
         }))];
      }
   }
}

