package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class Lactaid extends Consumable
   {
      
      public function Lactaid()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Lactaid","Lactaid","a pink bottle labeled \"Lactaid\"",6,"Judging by the name printed on this bottle, \'Lactaid\' probably has an effect on the ability to lactate, and you doubt that effect is a reduction.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as BreastRow;
         get_player().slimeFeed();
         outputText("你一口气喝下了那瓶催乳剂，轻松地吞下了乳白色的液体。");
         if(get_player().averageBreastSize() < 8)
         {
            outputText("[pg]");
            if(int(get_player().breastRows.length) == 1)
            {
               get_player().growTits(1 + Utils.rand(5),1,true,1);
            }
            else
            {
               get_player().growTits(1 + Utils.rand(2),int(get_player().breastRows.length),true,1);
            }
         }
         if(get_player().biggestLactation() < 1)
         {
            outputText("[pg]你感觉到你的[nipples]变得紧绷且充血。一滴乳汁从每个乳头溢出，顺着你乳房的曲线流下。<b>你现在开始泌乳了！</b>");
            _loc1_ = 0;
            _loc2_ = get_player().breastRows;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _loc3_.lactationMultiplier += 2;
            }
         }
         else
         {
            outputText("[pg]乳汁从你的[nipples]中呈粗线状漏出。你的泌乳量更大了！");
            _loc1_ = 0;
            _loc2_ = get_player().breastRows;
            while(_loc1_ < int(_loc2_.length))
            {
               _loc3_ = _loc2_[_loc1_];
               _loc1_++;
               _loc3_.lactationMultiplier += 1 + Utils.rand(10) / 10;
            }
         }
         dynStats(DynStat.Lust(10));
         if(Utils.rand(3) == 0)
         {
            outputText(get_player().modFem(95,1));
         }
         return false;
      }
   }
}

