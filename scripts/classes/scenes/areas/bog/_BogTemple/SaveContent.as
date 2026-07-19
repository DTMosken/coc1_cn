package classes.scenes.areas.bog._BogTemple
{
   import coc.view.selfDebug.BitflagComponent;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.FloatComponent;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var timesVisited:int;
      
      public var timesPrayed:int;
      
      public var timesBathed:int;
      
      public var shieldTaken:Boolean;
      
      public var seenBalcony:Boolean;
      
      public var inspection:int;
      
      public var foundTemple:Boolean;
      
      public var excludeExplore:Number;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         timesBathed = 0;
         timesPrayed = 0;
         timesVisited = 0;
         excludeExplore = 0;
         seenBalcony = false;
         inspection = 0;
         shieldTaken = false;
         foundTemple = false;
         if(param1 != null)
         {
            foundTemple = param1;
         }
         if(param2 != null)
         {
            shieldTaken = param2;
         }
         if(param3 != null)
         {
            inspection = param3;
         }
         if(param4 != null)
         {
            seenBalcony = param4;
         }
         if(param5 != null)
         {
            excludeExplore = param5;
         }
         if(param6 != null)
         {
            timesVisited = param6;
         }
         if(param7 != null)
         {
            timesPrayed = param7;
         }
         if(param8 != null)
         {
            timesBathed = param8;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("foundTemple","",new BoolComponent(foundTemple,function(param1:Boolean):Boolean
         {
            return _gthis.foundTemple = param1;
         })),new DebugComp("shieldTaken","",new BoolComponent(shieldTaken,function(param1:Boolean):Boolean
         {
            return _gthis.shieldTaken = param1;
         })),new DebugComp("inspection","你见过的检查选项",new BitflagComponent(inspection,function(param1:int):int
         {
            return _gthis.inspection = param1;
         },"未使用","雕塑","祭坛","小雕像","书籍","洞","水坑","阳台","入口")),new DebugComp("seenBalcony","你是否飞到了顶部",new BoolComponent(seenBalcony,function(param1:Boolean):Boolean
         {
            return _gthis.seenBalcony = param1;
         })),new DebugComp("excludeExplore","在这个总时间内无法遇到神庙",new FloatComponent(excludeExplore,function(param1:Number):Number
         {
            return _gthis.excludeExplore = param1;
         })),new DebugComp("timesVisited","总神庙遭遇次数",new IntComponent(timesVisited,function(param1:int):int
         {
            return _gthis.timesVisited = param1;
         })),new DebugComp("timesPrayed","",new IntComponent(timesPrayed,function(param1:int):int
         {
            return _gthis.timesPrayed = param1;
         })),new DebugComp("timesBathed","",new IntComponent(timesBathed,function(param1:int):int
         {
            return _gthis.timesBathed = param1;
         }))];
      }
   }
}

