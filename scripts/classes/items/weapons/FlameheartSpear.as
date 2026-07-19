package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class FlameheartSpear extends Weapon
   {
      
      public function FlameheartSpear()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("FlmHrtSpear","F.Heart Spear","flameheart spear","a flameheart spear",["stab"],15,1250,"This exquisite gold and black spear occasionally pulses with thin sprites of orange and red. This weapon deals more damage the closer you are to death.\n<i>Inquisitors fought a hopeless war, and were taught that valor and courage shines brightest against a backdrop of despair.</i> ",["Spear"],0.3);
      }
      
      override public function get_attack() : Number
      {
         var _loc1_:int = int(Math.round(30 * (1 - get_player().get_HP() / get_player().maxHP())));
         return 15 + _loc1_;
      }
   }
}

