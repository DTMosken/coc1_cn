package classes.scenes.api._Encounters
{
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   
   public final class EncounterOrDef_Impl_
   {
      
      public function EncounterOrDef_Impl_()
      {
      }
      
      public static function _new(param1:Encounter) : Encounter
      {
         return param1;
      }
      
      public static function fromDef(param1:EncounterDef) : Encounter
      {
         return Encounters.build(param1);
      }
   }
}

