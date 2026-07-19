package classes.scenes.npcs._CeraphFollowerScene
{
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var roleplayAsTellyCount:int;
      
      public var rapePlay:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         roleplayAsTellyCount = 0;
         rapePlay = 0;
         if(param1 != null)
         {
            rapePlay = param1;
         }
         if(param2 != null)
         {
            roleplayAsTellyCount = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("rapePlay","",new Combo(rapePlay,function(param1:int):int
         {
            return _gthis.rapePlay = param1;
         },{
            "label":"从未做过",
            "value":0
         },{
            "label":"有小恶魔",
            "value":1
         },{
            "label":"无小恶魔",
            "value":2
         })),new DebugComp("roleplayAsTellyCount","扮演特莉的次数",new IntComponent(roleplayAsTellyCount,function(param1:int):int
         {
            return _gthis.roleplayAsTellyCount = param1;
         }))];
      }
   }
}

