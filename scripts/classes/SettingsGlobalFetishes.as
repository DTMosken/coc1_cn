package classes
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SettingsGlobalFetishes implements DebuggableSave
   {
      
      public var watersports:Boolean;
      
      public var underage:int;
      
      public var parasites:int;
      
      public var nephila:Boolean;
      
      public var gore:Boolean;
      
      public var furry:Boolean;
      
      public var filth:Boolean;
      
      public var addiction:Boolean;
      
      public function SettingsGlobalFetishes(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         nephila = false;
         underage = 1;
         parasites = -1;
         filth = true;
         gore = false;
         watersports = false;
         furry = false;
         addiction = true;
         if(param1 != null)
         {
            addiction = param1;
         }
         if(param2 != null)
         {
            furry = param2;
         }
         if(param3 != null)
         {
            watersports = param3;
         }
         if(param4 != null)
         {
            gore = param4;
         }
         if(param5 != null)
         {
            filth = param5;
         }
         if(param6 != null)
         {
            parasites = param6;
         }
         if(param7 != null)
         {
            underage = param7;
         }
         if(param8 != null)
         {
            nephila = param8;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SettingsGlobalFetishes = this;
         return [new DebugComp("nephila","质量极低、破坏设定的内容，完全不符合本模组的标准，但最终还是成了漏网之鱼。将其保留在游戏中仅出于历史原因，且默认处于禁用状态。\n\n包含寄生虫、超级怀孕、恶搞内容、大量拼写错误、语法问题以及可能的漏洞。不应被视为正典。启用时需要同时启用寄生虫内容。\n\n不建议启用此项。",new BoolComponent(nephila,function(param1:Boolean):Boolean
         {
            return _gthis.nephila = param1;
         }))];
      }
   }
}

