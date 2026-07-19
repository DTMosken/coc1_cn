package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class PiercedFertitePerk extends PerkType
   {
      
      public function PiercedFertitePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Pierced: Fertite","Pierced: Fertite","You\'ve been pierced with Fertite and any male or female organs have become more fertile.");
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "精液产量提高 " + Math.round(2 * param1.value1) + "%，生育能力提高 " + Math.round(param1.value1) + "。";
      }
   }
}

