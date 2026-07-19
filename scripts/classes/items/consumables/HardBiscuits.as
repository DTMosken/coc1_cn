package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class HardBiscuits extends Consumable
   {
      
      public static var ITEM_VALUE:int = 5;
      
      public function HardBiscuits()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("H.Bisct","Hard Biscuits","a pack of hard biscuits",5,"These biscuits are tasteless, but they can stay edible for an exceedingly long time.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你吃下了淡而无味的饼干。它稍微缓解了你的饥饿，但也就仅此而已了。");
         get_player().refillHunger(15);
         return false;
      }
   }
}

