package classes.scenes.api
{
   import flash.Boot;
   
   public class SimpleEncounter implements Encounter
   {
      
      public var weight:Function;
      
      public var name:String;
      
      public var body:Function;
      
      public function SimpleEncounter(param1:String = undefined, param2:Function = undefined, param3:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         name = param1;
         weight = param2;
         body = param3;
      }
      
      public function execEncounter() : void
      {
         body();
      }
      
      public function encounterName() : String
      {
         return name;
      }
      
      public function encounterChance() : Number
      {
         return Number(weight());
      }
   }
}

