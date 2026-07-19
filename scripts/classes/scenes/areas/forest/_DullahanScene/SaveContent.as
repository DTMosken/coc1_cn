package classes.scenes.areas.forest._DullahanScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var talkedAboutCurse:Boolean;
      
      public var seenBody:Boolean;
      
      public var rimmingProgress:int;
      
      public var encounterDay:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         talkedAboutCurse = false;
         encounterDay = -1;
         seenBody = false;
         rimmingProgress = 0;
         if(param1 != null)
         {
            rimmingProgress = param1;
         }
         if(param2 != null)
         {
            seenBody = param2;
         }
         if(param3 != null)
         {
            encounterDay = param3;
         }
         if(param4 != null)
         {
            talkedAboutCurse = param4;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("rimmingProgress","",new Combo(rimmingProgress,function(param1:int):int
         {
            return _gthis.rimmingProgress = param1;
         },{
            "label":"不可用",
            "value":0
         },{
            "label":"可用",
            "value":1
         },{
            "label":"确定",
            "value":2
         })),new DebugComp("seenBody","",new BoolComponent(seenBody,function(param1:Boolean):Boolean
         {
            return _gthis.seenBody = param1;
         })),new DebugComp("encounterDay","",new IntComponent(encounterDay,function(param1:int):int
         {
            return _gthis.encounterDay = param1;
         })),new DebugComp("talkedAboutCurse","",new BoolComponent(talkedAboutCurse,function(param1:Boolean):Boolean
         {
            return _gthis.talkedAboutCurse = param1;
         }))];
      }
   }
}

