package classes.scenes.places._Farm
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var pureWhitneyStables:Boolean;
      
      public var gnoll:Boolean;
      
      public var firstEncounterNight:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         firstEncounterNight = false;
         gnoll = false;
         pureWhitneyStables = false;
         if(param1 != null)
         {
            pureWhitneyStables = param1;
         }
         if(param2 != null)
         {
            gnoll = param2;
         }
         if(param3 != null)
         {
            firstEncounterNight = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("pureWhitneyStables","",new BoolComponent(pureWhitneyStables,function(param1:Boolean):Boolean
         {
            return _gthis.pureWhitneyStables = param1;
         })),new DebugComp("gnoll","",new BoolComponent(gnoll,function(param1:Boolean):Boolean
         {
            return _gthis.gnoll = param1;
         })),new DebugComp("firstEncounterNight","",new BoolComponent(firstEncounterNight,function(param1:Boolean):Boolean
         {
            return _gthis.firstEncounterNight = param1;
         }))];
      }
   }
}

