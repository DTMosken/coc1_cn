package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PurityPeach extends Consumable
   {
      
      public static var ITEM_VALUE:int = 10;
      
      public function PurityPeach()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PurPeac","Pure Peach","a pure peach",10,"This is a peach from Minerva\'s spring, yellowy-orange with red stripes all over it.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你咬了一口香甜多汁的桃子，感觉到一股能量席卷了你的四肢和头脑。你感到恢复了活力，精神焕发，而且不知何故被净化了。");
         get_player().changeFatigue(-15);
         get_player().HPChange(Math.round(get_player().maxHP() * 0.25),true);
         get_player().refillHunger(25);
         return false;
      }
   }
}

