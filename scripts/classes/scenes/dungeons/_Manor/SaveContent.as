package classes.scenes.dungeons._Manor
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var wineDrunk:int;
      
      public var lethiciteTaken:int;
      
      public var booksTaken:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         booksTaken = false;
         lethiciteTaken = 0;
         wineDrunk = 0;
         if(param1 != null)
         {
            wineDrunk = param1;
         }
         if(param2 != null)
         {
            lethiciteTaken = param2;
         }
         if(param3 != null)
         {
            booksTaken = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("wineDrunk","",new IntComponent(wineDrunk,function(param1:int):int
         {
            return _gthis.wineDrunk = param1;
         })),new DebugComp("lethiciteTaken","",new IntComponent(lethiciteTaken,function(param1:int):int
         {
            return _gthis.lethiciteTaken = param1;
         })),new DebugComp("booksTaken","",new BoolComponent(booksTaken,function(param1:Boolean):Boolean
         {
            return _gthis.booksTaken = param1;
         }))];
      }
   }
}

