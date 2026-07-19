package classes.scenes.npcs._SophieBimbo
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public static var __meta__:* = {"fields":{
         "daughterRocked":{"hint":["记录你哄鹰身女妖女儿入睡的日期"]},
         "daughterMarried":{"hint":["记录你最近一次进行过家家结婚的女儿"]}
      }};
      
      public var daughterRocked:int;
      
      public var daughterMarried:int;
      
      public var cuddlingDaughter:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         daughterMarried = 0;
         daughterRocked = 0;
         cuddlingDaughter = false;
         if(param1 != null)
         {
            cuddlingDaughter = param1;
         }
         if(param2 != null)
         {
            daughterRocked = param2;
         }
         if(param3 != null)
         {
            daughterMarried = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("cuddlingDaughter","",new BoolComponent(cuddlingDaughter,function(param1:Boolean):Boolean
         {
            return _gthis.cuddlingDaughter = param1;
         })),new DebugComp("daughterRocked","记录你哄鹰身女妖女儿入睡的日期",new IntComponent(daughterRocked,function(param1:int):int
         {
            return _gthis.daughterRocked = param1;
         })),new DebugComp("daughterMarried","记录你最近一次进行过家家结婚的女儿",new IntComponent(daughterMarried,function(param1:int):int
         {
            return _gthis.daughterMarried = param1;
         }))];
      }
   }
}

