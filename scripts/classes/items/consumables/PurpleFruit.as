package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PurpleFruit extends Consumable
   {
      
      public function PurpleFruit()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PrFruit","Purple Fruit","a purple fruit",6,"This sweet-smelling produce looks like an eggplant, but feels almost squishy, and rubbery to the touch. Holding it to your ear, you think you can hear some fluid sloshing around inside.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as BreastRow;
         get_player().slimeFeed();
         outputText("你毫不犹豫地咬了一口埃斯蕾尔给你的水果。它非常甜，口感相当有嚼劲。果汁是像糖果一样的葡萄糖浆，充满了你的口腔，顺着你的喉咙流下，液体的量远远超过了这种植物的大小所能容纳的。你急忙把整个水果吞了下去，一旦开始就无法停止。");
         outputText("[pg]一种刺痛的温暖在你的血管中变成了咆哮的炼狱，你的心率突然飙升。这种强烈的程度几乎让你的身体感觉要融化了！但是，这种感觉来得快去得也快，很快就消退成一种令人愉悦的温暖，停留在你的胸口。");
         if(get_player().averageNipplesPerBreast() < 4)
         {
            outputText("起初你以为没有任何变化，但再看一眼，你发现你的乳房现在长出了和那个牛娘植物娘一样的四个像牛一样的乳头。");
            if(get_player().nippleLength < 4)
            {
               get_player().nippleLength = 4;
            }
            _loc1_ = 0;
            _loc2_ = get_player().breastRows;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _loc3_.nipplesPerBreast = 4;
            }
         }
         dynStats(DynStat.Lib(5));
         get_player().boostLactation(3 * get_player().bRows());
         get_player().refillHunger(30);
         return false;
      }
   }
}

