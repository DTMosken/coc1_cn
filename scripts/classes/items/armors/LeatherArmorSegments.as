package classes.items.armors
{
   import classes.CoC;
   import classes.items.Armor;
   import classes.items.Equippable;
   import flash.Boot;
   
   public class LeatherArmorSegments extends Armor
   {
      
      public function LeatherArmorSegments()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("UrtaLta","Urta\'s Armor","leather armor segments","leather armor segments",5,76,"The leather armor segments that Urta wears.","Light",true);
      }
      
      override public function removeText() : void
      {
         outputText("你还剩下你那套旧的" + get_game().armors.LEATHRA.get_longName() + "。");
      }
      
      override public function playerRemove() : Equippable
      {
         super.playerRemove();
         return get_game().armors.LEATHRA;
      }
   }
}

