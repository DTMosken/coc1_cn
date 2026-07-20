package classes.scenes.places.mothCave._DoloresScene
{
   import coc.view.selfDebug.BitflagComponent;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var hikkiQuest:int;
      
      public var doloresTimesLeft:int;
      
      public var doloresTimeSinceEvent:int;
      
      public var doloresSex:int;
      
      public var doloresProgress:int;
      
      public var doloresFinal:int;
      
      public var doloresDecision:int;
      
      public var doloresBooks:Boolean;
      
      public var doloresBlowjob:Boolean;
      
      public var doloresAngry:Boolean;
      
      public var doloresAmbitions:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         doloresBooks = false;
         doloresBlowjob = false;
         doloresAngry = false;
         doloresTimesLeft = 0;
         doloresSex = 0;
         hikkiQuest = 0;
         doloresFinal = 0;
         doloresAmbitions = 0;
         doloresDecision = 0;
         doloresTimeSinceEvent = 0;
         doloresProgress = 0;
         if(param1 != null)
         {
            doloresProgress = param1;
         }
         if(param2 != null)
         {
            doloresTimeSinceEvent = param2;
         }
         if(param3 != null)
         {
            doloresDecision = param3;
         }
         if(param4 != null)
         {
            doloresAmbitions = param4;
         }
         if(param5 != null)
         {
            doloresFinal = param5;
         }
         if(param6 != null)
         {
            hikkiQuest = param6;
         }
         if(param7 != null)
         {
            doloresSex = param7;
         }
         if(param8 != null)
         {
            doloresTimesLeft = param8;
         }
         if(param9 != null)
         {
            doloresAngry = param9;
         }
         if(param10 != null)
         {
            doloresBlowjob = param10;
         }
         if(param11 != null)
         {
            doloresBooks = param11;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("doloresProgress","跟踪多洛雷斯的整体进度",new Combo(doloresProgress,function(param1:int):int
         {
            return _gthis.doloresProgress = param1;
         },{
            "label":"未出生",
            "value":0
         },{
            "label":"已出生",
            "value":1
         },{
            "label":"出生后",
            "value":2
         },{
            "label":"玩具",
            "value":3
         },{
            "label":"对话",
            "value":4
         },{
            "label":"魔法",
            "value":5
         },{
            "label":"逃跑",
            "value":6
         },{
            "label":"结茧",
            "value":7
         },{
            "label":"茧中",
            "value":8
         },{
            "label":"孵化",
            "value":9
         },{
            "label":"翅膀",
            "value":10
         },{
            "label":"担忧",
            "value":11
         },{
            "label":"召唤",
            "value":12
         },{
            "label":"汇报",
            "value":13
         },{
            "label":"素描",
            "value":14
         },{
            "label":"织锦",
            "value":15
         },{
            "label":"希奇任务",
            "value":16
         },{
            "label":"希奇完成",
            "value":17
         })),new DebugComp("doloresTimeSinceEvent","追踪自事件触发以来经过了多少小时",new IntComponent(doloresTimeSinceEvent,function(param1:int):int
         {
            return _gthis.doloresTimeSinceEvent = param1;
         })),new DebugComp("doloresDecision","跟踪你是否让她保留那本书",new Combo(doloresDecision,function(param1:int):int
         {
            return _gthis.doloresDecision = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"保留",
            "value":1
         },{
            "label":"拿走",
            "value":2
         },{
            "label":"等待",
            "value":3
         })),new DebugComp("doloresAmbitions","追踪一些与主线平行的进度",new Combo(doloresAmbitions,function(param1:int):int
         {
            return _gthis.doloresAmbitions = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"魔法谈话",
            "value":1
         },{
            "label":"野心",
            "value":2
         })),new DebugComp("doloresFinal","记录她最终场景的结果",new IntComponent(doloresFinal,function(param1:int):int
         {
            return _gthis.doloresFinal = param1;
         })),new DebugComp("hikkiQuest","追踪她个人任务的进度",new BitflagComponent(hikkiQuest,function(param1:int):int
         {
            return _gthis.hikkiQuest = param1;
         },"营地","玛丽埃尔","集市","图书馆","喀耳刻","做爱","完成","买长袍","释放她","解开谜语","杀死恶魔")),new DebugComp("doloresSex","追踪你是否解锁了与她的性爱和/或安抚",new Combo(doloresSex,function(param1:int):int
         {
            return _gthis.doloresSex = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"已解锁",
            "value":1
         },{
            "label":"已安慰",
            "value":2
         },{
            "label":"未安慰",
            "value":3
         },{
            "label":"安慰后做爱",
            "value":4
         })),new DebugComp("doloresTimesLeft","记录你当了多少次不负责任的[dad]",new IntComponent(doloresTimesLeft,function(param1:int):int
         {
            return _gthis.doloresTimesLeft = param1;
         })),new DebugComp("doloresAngry","记录你是否以某种方式惹恼了她，在当前遭遇中禁用她",new BoolComponent(doloresAngry,function(param1:Boolean):Boolean
         {
            return _gthis.doloresAngry = param1;
         })),new DebugComp("doloresBlowjob","记录你是否被口交过",new BoolComponent(doloresBlowjob,function(param1:Boolean):Boolean
         {
            return _gthis.doloresBlowjob = param1;
         })),new DebugComp("doloresBooks","记录你是否从庄园给她带了书",new BoolComponent(doloresBooks,function(param1:Boolean):Boolean
         {
            return _gthis.doloresBooks = param1;
         }))];
      }
   }
}

