package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class IsabellaMilk extends Consumable
   {
      
      public function IsabellaMilk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("IzyMilk","Isabella Milk","a bottle of Isabella\'s milk",6,"A bottle of Isabella\'s milk. Isabella seems fairly certain it will invigorate you.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你咽下了这瓶伊莎贝拉的奶。");
         if(get_player().get_fatigue() > 0)
         {
            outputText("你感觉没那么累了！(-33疲劳)");
         }
         get_player().changeFatigue(-33);
         get_player().refillHunger(20);
         return false;
      }
   }
}

