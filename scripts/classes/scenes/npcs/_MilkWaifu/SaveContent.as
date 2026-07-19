package classes.scenes.npcs._MilkWaifu
{
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var talkedSlut:int;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         talkedSlut = 0;
         if(param1 != null)
         {
            talkedSlut = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("talkedSlut","",new Combo(talkedSlut,function(param1:int):int
         {
            return _gthis.talkedSlut = param1;
         },{
            "label":"0",
            "value":0
         },{
            "label":"1",
            "value":1
         },{
            "label":"2",
            "value":2
         },{
            "label":"3",
            "value":3
         }))];
      }
   }
}

