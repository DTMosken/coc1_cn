package classes.scenes.areas.forest._KitsuneScene
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
      
      public var statueLocation:String;
      
      public var statueDay:int;
      
      public var hadVision:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:String = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         statueDay = 0;
         statueLocation = "";
         hadVision = false;
         if(param1 != null)
         {
            hadVision = param1;
         }
         if(param2 != null)
         {
            statueLocation = param2;
         }
         if(param3 != null)
         {
            statueDay = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("hadVision","",new BoolComponent(hadVision,function(param1:Boolean):Boolean
         {
            return _gthis.hadVision = param1;
         })),new DebugComp("statueLocation","",new Combo(statueLocation,function(param1:String):String
         {
            return _gthis.statueLocation = param1;
         },{
            "label":"默认",
            "value":""
         },{
            "label":"书桌",
            "value":"desk"
         },{
            "label":"书架",
            "value":"bookshelf"
         },{
            "label":"桌子",
            "value":"table"
         },{
            "label":"床头柜",
            "value":"nightstand"
         },{
            "label":"梳妆台",
            "value":"dresser"
         },{
            "label":"角落",
            "value":"corner"
         })),new DebugComp("statueDay","",new IntComponent(statueDay,function(param1:int):int
         {
            return _gthis.statueDay = param1;
         }))];
      }
   }
}

