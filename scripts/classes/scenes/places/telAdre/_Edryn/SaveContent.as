package classes.scenes.places.telAdre._Edryn
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var kidMet:Boolean;
      
      public var herms:int;
      
      public var girls:int;
      
      public var boys:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         kidMet = false;
         herms = 0;
         girls = 0;
         boys = 0;
         if(param1 != null)
         {
            boys = param1;
         }
         if(param2 != null)
         {
            girls = param2;
         }
         if(param3 != null)
         {
            herms = param3;
         }
         if(param4 != null)
         {
            kidMet = param4;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("boys","",new IntComponent(boys,function(param1:int):int
         {
            return _gthis.boys = param1;
         })),new DebugComp("girls","",new IntComponent(girls,function(param1:int):int
         {
            return _gthis.girls = param1;
         })),new DebugComp("herms","",new IntComponent(herms,function(param1:int):int
         {
            return _gthis.herms = param1;
         })),new DebugComp("kidMet","",new BoolComponent(kidMet,function(param1:Boolean):Boolean
         {
            return _gthis.kidMet = param1;
         }))];
      }
   }
}

