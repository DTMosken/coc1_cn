package classes.scenes.areas.forest._LumberjackScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var freedSucc:Boolean;
      
      public var executed:Boolean;
      
      public var encountered:Boolean;
      
      public var aggressive:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         executed = false;
         freedSucc = false;
         aggressive = false;
         encountered = false;
         if(param1 != null)
         {
            encountered = param1;
         }
         if(param2 != null)
         {
            aggressive = param2;
         }
         if(param3 != null)
         {
            freedSucc = param3;
         }
         if(param4 != null)
         {
            executed = param4;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("encountered","",new BoolComponent(encountered,function(param1:Boolean):Boolean
         {
            return _gthis.encountered = param1;
         })),new DebugComp("aggressive","",new BoolComponent(aggressive,function(param1:Boolean):Boolean
         {
            return _gthis.aggressive = param1;
         })),new DebugComp("freedSucc","",new BoolComponent(freedSucc,function(param1:Boolean):Boolean
         {
            return _gthis.freedSucc = param1;
         })),new DebugComp("executed","",new BoolComponent(executed,function(param1:Boolean):Boolean
         {
            return _gthis.executed = param1;
         }))];
      }
   }
}

