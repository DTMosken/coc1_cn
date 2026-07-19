package classes.items.jewelries
{
   import classes.PerkLib;
   import classes.Player;
   import classes.items.Equippable;
   import classes.items.Jewelry;
   import flash.Boot;
   
   public class RingOfPatience extends Jewelry
   {
      
      public function RingOfPatience()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PatienceRing","Patience Ring","Ring of Patience","a silver ring shaped like overlapping knots",0,0,1,"An enchanted silver ring, shaped like two knots interlocking in a circle. The finishing on it is rough, as if crafted by a skilled artisan with poor tools. It soothes the mind and allows its wearer to act with patience and wisdom. ","Ring");
      }
      
      override public function playerRemove() : Equippable
      {
         if(get_player().hasPerk(PerkLib.Patience))
         {
            get_player().removePerk(PerkLib.Patience);
         }
         return super.playerRemove();
      }
      
      override public function playerEquip() : Equippable
      {
         if(!get_player().hasPerk(PerkLib.Patience))
         {
            get_player().createPerk(PerkLib.Patience);
         }
         return super.playerEquip();
      }
   }
}

