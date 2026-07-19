package classes.scenes.api
{
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import flash.Boot;
   import haxe.ds.Either;
   
   public class EncounterDef
   {
      
      public var when:Function;
      
      public var name:String;
      
      public var mods:Array;
      
      public var chance:Function;
      
      public var call:Either;
      
      public function EncounterDef(param1:String = undefined, param2:Object = undefined, param3:Object = undefined, param4:Either = undefined, param5:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         mods = [];
         when = EncounterChance_Impl_.fromFloatConst(1);
         chance = EncounterChance_Impl_.fromFloatConst(1);
         name = "";
         if(param1 != null)
         {
            name = param1;
         }
         if(param2 != null)
         {
            chance = param2;
         }
         if(param3 != null)
         {
            when = param3;
         }
         call = param4;
         if(param5 != null)
         {
            mods = param5;
         }
      }
   }
}

