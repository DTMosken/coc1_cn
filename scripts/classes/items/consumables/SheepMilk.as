package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class SheepMilk extends Consumable
   {
      
      public function SheepMilk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SheepMk","Sheep Milk","a bottle of sheep milk",6,"This bottle of sheep milk is said to have corruption-fighting properties. It may be useful.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你大口喝下瓶里的东西，它甜美的味道立刻让你精神焕发，让你感到平静和专注");
         get_player().changeFatigue(-30);
         dynStats(DynStat.Lib(-0.25),DynStat.Lust(-10),DynStat.Cor(-0.5));
         get_player().refillHunger(20);
         return false;
      }
   }
}

