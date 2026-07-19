package classes.scenes.places.bazaar._Lilium
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var learnedName:Boolean;
      
      public var hasPaid:Boolean;
      
      public var hasMet:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         learnedName = false;
         hasPaid = false;
         hasMet = false;
         if(param1 != null)
         {
            hasMet = param1;
         }
         if(param2 != null)
         {
            hasPaid = param2;
         }
         if(param3 != null)
         {
            learnedName = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("hasMet","",new BoolComponent(hasMet,function(param1:Boolean):Boolean
         {
            return _gthis.hasMet = param1;
         })),new DebugComp("hasPaid","",new BoolComponent(hasPaid,function(param1:Boolean):Boolean
         {
            return _gthis.hasPaid = param1;
         })),new DebugComp("learnedName","",new BoolComponent(learnedName,function(param1:Boolean):Boolean
         {
            return _gthis.learnedName = param1;
         }))];
      }
   }
}

