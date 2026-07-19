package classes.scenes.npcs._SylviaScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.FloatComponent;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var unlockedOyakodon:Boolean;
      
      public var timeSinceVisit:int;
      
      public var talkedMoths:Boolean;
      
      public var sylviaStalking:int;
      
      public var sylviaProgress:int;
      
      public var sylviaGiftedDress:Boolean;
      
      public var sylviaFertile:int;
      
      public var sylviaDominance:int;
      
      public var sylviaClothes:int;
      
      public var sylviaCapstoneCounter:int;
      
      public var sylviaAffection:int;
      
      public var encounterDisabled:Number;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         unlockedOyakodon = false;
         sylviaGiftedDress = false;
         talkedMoths = false;
         encounterDisabled = 0;
         timeSinceVisit = 0;
         sylviaClothes = 0;
         sylviaCapstoneCounter = 0;
         sylviaFertile = 0;
         sylviaStalking = 0;
         sylviaDominance = 0;
         sylviaAffection = 0;
         sylviaProgress = 0;
         if(param1 != null)
         {
            sylviaProgress = param1;
         }
         if(param2 != null)
         {
            sylviaAffection = param2;
         }
         if(param3 != null)
         {
            sylviaDominance = param3;
         }
         if(param4 != null)
         {
            sylviaStalking = param4;
         }
         if(param5 != null)
         {
            sylviaFertile = param5;
         }
         if(param6 != null)
         {
            sylviaCapstoneCounter = param6;
         }
         if(param7 != null)
         {
            sylviaClothes = param7;
         }
         if(param8 != null)
         {
            timeSinceVisit = param8;
         }
         if(param9 != null)
         {
            encounterDisabled = param9;
         }
         if(param10 != null)
         {
            talkedMoths = param10;
         }
         if(param11 != null)
         {
            sylviaGiftedDress = param11;
         }
         if(param12 != null)
         {
            unlockedOyakodon = param12;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("sylviaProgress","追踪整体场景进度",new Combo(sylviaProgress,function(param1:int):int
         {
            return _gthis.sylviaProgress = param1;
         },{
            "label":"禁用",
            "value":-1
         },{
            "label":"未遭遇",
            "value":0
         },{
            "label":"已遭遇",
            "value":1
         },{
            "label":"得知姓名",
            "value":2
         },{
            "label":"跟踪中",
            "value":3
         },{
            "label":"洞穴",
            "value":4
         },{
            "label":"终章",
            "value":5
         })),new DebugComp("sylviaAffection","西尔维娅的好感度",new IntComponent(sylviaAffection,function(param1:int):int
         {
            return _gthis.sylviaAffection = param1;
         })),new DebugComp("sylviaDominance","西尔维娅对玩家的支配度",new IntComponent(sylviaDominance,function(param1:int):int
         {
            return _gthis.sylviaDominance = param1;
         })),new DebugComp("sylviaStalking","记录你是否允许她继续跟踪你/跟踪场景的进展",new Combo(sylviaStalking,function(param1:int):int
         {
            return _gthis.sylviaStalking = param1;
         },{
            "label":"禁用",
            "value":-1
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"启用",
            "value":1
         },{
            "label":"遭遇 1",
            "value":2
         },{
            "label":"遭遇 2",
            "value":3
         },{
            "label":"遭遇 3",
            "value":4
         })),new DebugComp("sylviaFertile","记录她是否可以怀孕",new Combo(sylviaFertile,function(param1:int):int
         {
            return _gthis.sylviaFertile = param1;
         },{
            "label":"禁用",
            "value":-1
         },{
            "label":"未决定",
            "value":0
         },{
            "label":"启用",
            "value":1
         })),new DebugComp("sylviaCapstoneCounter","记录通往终章场景的进度",new Combo(sylviaCapstoneCounter,function(param1:int):int
         {
            return _gthis.sylviaCapstoneCounter = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"第一",
            "value":1
         },{
            "label":"第二",
            "value":2
         },{
            "label":"第三",
            "value":3
         })),new DebugComp("sylviaClothes","记录你是否已解锁捐赠衣物/你已经捐赠了多少",new IntComponent(sylviaClothes,function(param1:int):int
         {
            return _gthis.sylviaClothes = param1;
         })),new DebugComp("timeSinceVisit","记录距离你上次拜访西尔维娅已经过去了多少小时",new IntComponent(timeSinceVisit,function(param1:int):int
         {
            return _gthis.timeSinceVisit = param1;
         })),new DebugComp("encounterDisabled","防止在已经过的总小时数达到该数值时触发遭遇",new FloatComponent(encounterDisabled,function(param1:Number):Number
         {
            return _gthis.encounterDisabled = param1;
         })),new DebugComp("talkedMoths","记录你是否谈论过蛾女",new BoolComponent(talkedMoths,function(param1:Boolean):Boolean
         {
            return _gthis.talkedMoths = param1;
         })),new DebugComp("sylviaGiftedDress","记录你是否制作并把那件连衣裙送给了她",new BoolComponent(sylviaGiftedDress,function(param1:Boolean):Boolean
         {
            return _gthis.sylviaGiftedDress = param1;
         })),new DebugComp("unlockedOyakodon","记录你是否解锁了与多洛雷斯的三人行",new BoolComponent(unlockedOyakodon,function(param1:Boolean):Boolean
         {
            return _gthis.unlockedOyakodon = param1;
         }))];
      }
   }
}

