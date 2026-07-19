package classes.scenes.areas.volcanicCrag._CorruptedCoven
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var sippedWineWithCirce:Boolean;
      
      public var metCirceAsGrossInsectPerson:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sippedWineWithCirce = false;
         metCirceAsGrossInsectPerson = false;
         if(param1 != null)
         {
            metCirceAsGrossInsectPerson = param1;
         }
         if(param2 != null)
         {
            sippedWineWithCirce = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("metCirceAsGrossInsectPerson","",new BoolComponent(metCirceAsGrossInsectPerson,function(param1:Boolean):Boolean
         {
            return _gthis.metCirceAsGrossInsectPerson = param1;
         })),new DebugComp("sippedWineWithCirce","",new BoolComponent(sippedWineWithCirce,function(param1:Boolean):Boolean
         {
            return _gthis.sippedWineWithCirce = param1;
         }))];
      }
   }
}

