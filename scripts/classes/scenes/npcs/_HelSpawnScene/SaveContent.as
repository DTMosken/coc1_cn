package classes.scenes.npcs._HelSpawnScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var wakeUp:Boolean;
      
      public var timeTalkedIncest:int;
      
      public var surprised:Boolean;
      
      public var slutspawnLastTimeSex:int;
      
      public var sippedAnemone:Boolean;
      
      public var footjob:Boolean;
      
      public var fishing:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         slutspawnLastTimeSex = 0;
         timeTalkedIncest = 0;
         fishing = false;
         surprised = false;
         wakeUp = false;
         sippedAnemone = false;
         footjob = false;
         if(param1 != null)
         {
            footjob = param1;
         }
         if(param2 != null)
         {
            sippedAnemone = param2;
         }
         if(param3 != null)
         {
            wakeUp = param3;
         }
         if(param4 != null)
         {
            surprised = param4;
         }
         if(param5 != null)
         {
            fishing = param5;
         }
         if(param6 != null)
         {
            timeTalkedIncest = param6;
         }
         if(param7 != null)
         {
            slutspawnLastTimeSex = param7;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("footjob","",new BoolComponent(footjob,function(param1:Boolean):Boolean
         {
            return _gthis.footjob = param1;
         })),new DebugComp("sippedAnemone","",new BoolComponent(sippedAnemone,function(param1:Boolean):Boolean
         {
            return _gthis.sippedAnemone = param1;
         })),new DebugComp("wakeUp","",new BoolComponent(wakeUp,function(param1:Boolean):Boolean
         {
            return _gthis.wakeUp = param1;
         })),new DebugComp("surprised","",new BoolComponent(surprised,function(param1:Boolean):Boolean
         {
            return _gthis.surprised = param1;
         })),new DebugComp("fishing","",new BoolComponent(fishing,function(param1:Boolean):Boolean
         {
            return _gthis.fishing = param1;
         })),new DebugComp("timeTalkedIncest","",new IntComponent(timeTalkedIncest,function(param1:int):int
         {
            return _gthis.timeTalkedIncest = param1;
         })),new DebugComp("slutspawnLastTimeSex","",new IntComponent(slutspawnLastTimeSex,function(param1:int):int
         {
            return _gthis.slutspawnLastTimeSex = param1;
         }))];
      }
   }
}

