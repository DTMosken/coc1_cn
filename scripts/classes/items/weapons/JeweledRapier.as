package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class JeweledRapier extends Weapon
   {
      
      public function JeweledRapier()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("JRapier","Jeweled Rapier","jeweled rapier","a jeweled rapier",["slash"],13,1400,"This jeweled rapier is ancient but untarnished. The hilt is wonderfully made, and fits your hand like a tailored glove. The blade is shiny and perfectly designed for stabbing.",["1H Sword"],0.7);
      }
      
      override public function get_attack() : Number
      {
         return 13 + get_player().rapierTrainingBoost();
      }
   }
}

