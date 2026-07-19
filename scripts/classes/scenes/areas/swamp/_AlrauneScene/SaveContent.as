package classes.scenes.areas.swamp._AlrauneScene
{
   import coc.view.selfDebug.BitflagComponent;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var vinesTaken:Boolean;
      
      public var vineTimer:int;
      
      public var questAsked:int;
      
      public var metAlraune:Boolean;
      
      public var eatenAss:Boolean;
      
      public var alrauneKilled:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         vinesTaken = false;
         alrauneKilled = 0;
         vineTimer = 0;
         questAsked = 0;
         eatenAss = false;
         metAlraune = false;
         if(param1 != null)
         {
            metAlraune = param1;
         }
         if(param2 != null)
         {
            eatenAss = param2;
         }
         if(param3 != null)
         {
            questAsked = param3;
         }
         if(param4 != null)
         {
            vineTimer = param4;
         }
         if(param5 != null)
         {
            alrauneKilled = param5;
         }
         if(param6 != null)
         {
            vinesTaken = param6;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("metAlraune","",new BoolComponent(metAlraune,function(param1:Boolean):Boolean
         {
            return _gthis.metAlraune = param1;
         })),new DebugComp("eatenAss","",new BoolComponent(eatenAss,function(param1:Boolean):Boolean
         {
            return _gthis.eatenAss = param1;
         })),new DebugComp("questAsked","",new BitflagComponent(questAsked,function(param1:int):int
         {
            return _gthis.questAsked = param1;
         },"Alraune","Amily","Arian","Jojo","Kiha","Kitsune","Rathazul","Shouldra","Holli","Clue")),new DebugComp("vineTimer","",new IntComponent(vineTimer,function(param1:int):int
         {
            return _gthis.vineTimer = param1;
         })),new DebugComp("alrauneKilled","",new IntComponent(alrauneKilled,function(param1:int):int
         {
            return _gthis.alrauneKilled = param1;
         })),new DebugComp("vinesTaken","",new BoolComponent(vinesTaken,function(param1:Boolean):Boolean
         {
            return _gthis.vinesTaken = param1;
         }))];
      }
   }
}

