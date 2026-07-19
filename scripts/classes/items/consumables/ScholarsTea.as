package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class ScholarsTea extends Consumable
   {
      
      public static var ITEM_VALUE:int = 15;
      
      public function ScholarsTea()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Smart T","Scholar Tea","a cup of scholar\'s tea",15,"This powerful brew supposedly has mind-strengthening effects.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你按照商人的指示，泡好并喝下了这杯茶。它那强烈的味道刺激着你的味蕾，不一会儿，你发现自己变得更加清醒和敏锐。当你的思绪漫游时，一个充满创意，甚至有些下流的故事浮现在脑海中。可惜你没有书写工具，否则你觉得你可以靠你构思的故事赚上几枚硬币。那个奇怪的卖家并没有在茶的功效上撒谎。");
         if(Utils.rand(3) == 0)
         {
            outputText(get_player().modTone(15,1));
         }
         if(get_player().get_inte100() < 40)
         {
            dynStats(DynStat.Inte(1.5 + Utils.rand(4)));
         }
         else if(get_player().get_inte100() < 60)
         {
            dynStats(DynStat.Inte(1 + Utils.rand(3)));
         }
         else if(get_player().get_inte100() < 80)
         {
            dynStats(DynStat.Inte(0.5 + Utils.rand(2)));
         }
         else
         {
            dynStats(DynStat.Inte(0.2 + Utils.rand(2)));
         }
         get_player().refillHunger(10);
         return false;
      }
   }
}

