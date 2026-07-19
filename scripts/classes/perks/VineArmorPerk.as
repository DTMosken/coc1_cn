package classes.perks
{
   import classes.PerkType;
   import flash.Boot;
   
   public class VineArmorPerk extends PerkType
   {
      
      public function VineArmorPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Alraune Vines","Alraune Vines","Fire will exhaust you, though your living armor does grant some bonuses.");
      }
   }
}

