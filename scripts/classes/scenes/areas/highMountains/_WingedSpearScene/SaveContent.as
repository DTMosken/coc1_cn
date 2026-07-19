package classes.scenes.areas.highMountains._WingedSpearScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var takenSpear:Boolean;
      
      public var examined:Boolean;
      
      public var encountered:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         takenSpear = false;
         examined = false;
         encountered = false;
         if(param1 != null)
         {
            encountered = param1;
         }
         if(param2 != null)
         {
            examined = param2;
         }
         if(param3 != null)
         {
            takenSpear = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("encountered","",new BoolComponent(encountered,function(param1:Boolean):Boolean
         {
            return _gthis.encountered = param1;
         })),new DebugComp("examined","",new BoolComponent(examined,function(param1:Boolean):Boolean
         {
            return _gthis.examined = param1;
         })),new DebugComp("takenSpear","",new BoolComponent(takenSpear,function(param1:Boolean):Boolean
         {
            return _gthis.takenSpear = param1;
         }))];
      }
   }
}

