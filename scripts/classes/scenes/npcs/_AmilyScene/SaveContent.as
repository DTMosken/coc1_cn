package classes.scenes.npcs._AmilyScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import coc.view.selfDebug.StringComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var ringType:String;
      
      public var pcKnowsAboutSkulls:Boolean;
      
      public var metKids:int;
      
      public var impSkullsCount:int;
      
      public var giftedCClothes:Boolean;
      
      public var amilyMorning:Boolean;
      
      public function SaveContent(param1:String = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         pcKnowsAboutSkulls = false;
         impSkullsCount = 0;
         giftedCClothes = false;
         metKids = 0;
         amilyMorning = false;
         ringType = "";
         if(param1 != null)
         {
            ringType = param1;
         }
         if(param2 != null)
         {
            amilyMorning = param2;
         }
         if(param3 != null)
         {
            metKids = param3;
         }
         if(param4 != null)
         {
            giftedCClothes = param4;
         }
         if(param5 != null)
         {
            impSkullsCount = param5;
         }
         if(param6 != null)
         {
            pcKnowsAboutSkulls = param6;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("ringType","",new StringComponent(ringType,function(param1:String):String
         {
            return _gthis.ringType = param1;
         })),new DebugComp("amilyMorning","",new BoolComponent(amilyMorning,function(param1:Boolean):Boolean
         {
            return _gthis.amilyMorning = param1;
         })),new DebugComp("metKids","",new Combo(metKids,function(param1:int):int
         {
            return _gthis.metKids = param1;
         },{
            "label":"",
            "value":0
         },{
            "label":"已遇见",
            "value":1
         },{
            "label":"已忽略",
            "value":-1
         })),new DebugComp("giftedCClothes","",new BoolComponent(giftedCClothes,function(param1:Boolean):Boolean
         {
            return _gthis.giftedCClothes = param1;
         })),new DebugComp("impSkullsCount","艾米莉添加到墙上的头骨数量。",new IntComponent(impSkullsCount,function(param1:int):int
         {
            return _gthis.impSkullsCount = param1;
         })),new DebugComp("pcKnowsAboutSkulls","艾米莉告诉了玩家关于头骨的事。",new BoolComponent(pcKnowsAboutSkulls,function(param1:Boolean):Boolean
         {
            return _gthis.pcKnowsAboutSkulls = param1;
         }))];
      }
   }
}

