package classes.scenes.areas.highMountains._IzumiScene
{
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var contestStage:Number;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         contestStage = 0;
         if(param1 != null)
         {
            contestStage = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("contestStage","",new Combo(contestStage,function(param1:Number):Number
         {
            return _gthis.contestStage = param1;
         },{
            "label":"",
            "value":0
         },{
            "label":"失败 1",
            "value":0.5
         },{
            "label":"通关 1",
            "value":1
         },{
            "label":"失败 2",
            "value":1.5
         },{
            "label":"通关 2",
            "value":2
         },{
            "label":"失败 3",
            "value":2.5
         },{
            "label":"通关 3",
            "value":3
         }))];
      }
   }
}

