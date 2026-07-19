package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class RaphaelsRapier extends Weapon
   {
      
      public function RaphaelsRapier()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("RRapier","Raphael\'sRapier","vulpine rapier","Raphael\'s vulpine rapier",["slash"],8,1000,"A rapier originally belonging to Raphael. He\'s bound it with his red sash around the length like a ribbon, as though he has now gifted it to you. Perhaps it is his way of congratulating you.",["1H Sword"],0.7);
      }
      
      override public function get_attack() : Number
      {
         return 8 + get_player().rapierTrainingBoost();
      }
   }
}

