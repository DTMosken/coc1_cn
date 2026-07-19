package classes.scenes.places.telAdre._Rubi
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var hadSex:Boolean;
      
      public function SaveContent(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         hadSex = false;
         if(param1 != null)
         {
            hadSex = param1;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("hadSex","",new BoolComponent(hadSex,function(param1:Boolean):Boolean
         {
            return _gthis.hadSex = param1;
         }))];
      }
   }
}

