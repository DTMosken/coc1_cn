package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class TrailMix extends Consumable
   {
      
      public static var ITEM_VALUE:int = 20;
      
      public function TrailMix()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("TrailMx","Trail Mix","a pack of trail mix",20,"This mix of nuts, dried fruits, and berries is lightweight, easy to store and very nutritious.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你吃下了混合干果。你从中获得了能量提升！");
         get_player().refillHunger(30);
         get_player().changeFatigue(-20);
         get_player().HPChange(Math.round(get_player().maxHP() * 0.1),true);
         return false;
      }
   }
}

