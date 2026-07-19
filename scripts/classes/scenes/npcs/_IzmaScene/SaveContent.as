package classes.scenes.npcs._IzmaScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.FloatComponent;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var tonguedButt:Boolean;
      
      public var tigersharksDeflowered:int;
      
      public var sparred:Boolean;
      
      public var sharkgirlsDeflowered:int;
      
      public var sharkManTalk:Boolean;
      
      public var previousVictoryTeased:Boolean;
      
      public var lezDemonstration:Boolean;
      
      public var lastNightmare:Number;
      
      public var kidDick:Boolean;
      
      public var izmaMorning:Boolean;
      
      public var gaveBooks:Boolean;
      
      public var daysSinceAneFight:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sharkManTalk = false;
         gaveBooks = false;
         izmaMorning = false;
         lastNightmare = 0;
         previousVictoryTeased = false;
         sparred = false;
         lezDemonstration = false;
         kidDick = false;
         tonguedButt = false;
         daysSinceAneFight = 0;
         tigersharksDeflowered = 0;
         sharkgirlsDeflowered = 0;
         if(param1 != null)
         {
            sharkgirlsDeflowered = param1;
         }
         if(param2 != null)
         {
            tigersharksDeflowered = param2;
         }
         if(param3 != null)
         {
            daysSinceAneFight = param3;
         }
         if(param4 != null)
         {
            tonguedButt = param4;
         }
         if(param5 != null)
         {
            kidDick = param5;
         }
         if(param6 != null)
         {
            lezDemonstration = param6;
         }
         if(param7 != null)
         {
            sparred = param7;
         }
         if(param8 != null)
         {
            previousVictoryTeased = param8;
         }
         if(param9 != null)
         {
            lastNightmare = param9;
         }
         if(param10 != null)
         {
            izmaMorning = param10;
         }
         if(param11 != null)
         {
            gaveBooks = param11;
         }
         if(param12 != null)
         {
            sharkManTalk = param12;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("sharkgirlsDeflowered","",new IntComponent(sharkgirlsDeflowered,function(param1:int):int
         {
            return _gthis.sharkgirlsDeflowered = param1;
         })),new DebugComp("tigersharksDeflowered","",new IntComponent(tigersharksDeflowered,function(param1:int):int
         {
            return _gthis.tigersharksDeflowered = param1;
         })),new DebugComp("daysSinceAneFight","",new IntComponent(daysSinceAneFight,function(param1:int):int
         {
            return _gthis.daysSinceAneFight = param1;
         })),new DebugComp("tonguedButt","",new BoolComponent(tonguedButt,function(param1:Boolean):Boolean
         {
            return _gthis.tonguedButt = param1;
         })),new DebugComp("kidDick","",new BoolComponent(kidDick,function(param1:Boolean):Boolean
         {
            return _gthis.kidDick = param1;
         })),new DebugComp("lezDemonstration","",new BoolComponent(lezDemonstration,function(param1:Boolean):Boolean
         {
            return _gthis.lezDemonstration = param1;
         })),new DebugComp("sparred","",new BoolComponent(sparred,function(param1:Boolean):Boolean
         {
            return _gthis.sparred = param1;
         })),new DebugComp("previousVictoryTeased","",new BoolComponent(previousVictoryTeased,function(param1:Boolean):Boolean
         {
            return _gthis.previousVictoryTeased = param1;
         })),new DebugComp("lastNightmare","",new FloatComponent(lastNightmare,function(param1:Number):Number
         {
            return _gthis.lastNightmare = param1;
         })),new DebugComp("izmaMorning","",new BoolComponent(izmaMorning,function(param1:Boolean):Boolean
         {
            return _gthis.izmaMorning = param1;
         })),new DebugComp("gaveBooks","",new BoolComponent(gaveBooks,function(param1:Boolean):Boolean
         {
            return _gthis.gaveBooks = param1;
         })),new DebugComp("sharkManTalk","",new BoolComponent(sharkManTalk,function(param1:Boolean):Boolean
         {
            return _gthis.sharkManTalk = param1;
         }))];
      }
   }
}

