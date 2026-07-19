package classes.scenes.npcs._ShouldraFollower
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var mastIntro:Boolean;
      
      public var frustrationKnown:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         frustrationKnown = false;
         mastIntro = false;
         if(param1 != null)
         {
            mastIntro = param1;
         }
         if(param2 != null)
         {
            frustrationKnown = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("mastIntro","",new BoolComponent(mastIntro,function(param1:Boolean):Boolean
         {
            return _gthis.mastIntro = param1;
         })),new DebugComp("frustrationKnown","",new BoolComponent(frustrationKnown,function(param1:Boolean):Boolean
         {
            return _gthis.frustrationKnown = param1;
         }))];
      }
   }
}

