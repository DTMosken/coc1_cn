package classes.items.consumables
{
   import classes.BreastRow;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class MilkPotion extends Consumable
   {
      
      public static var ITEM_VALUE:int = 120;
      
      public function MilkPotion()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("MilkPtn","ProLactaid","a bottle labeled \"Pro Lactaid\"",120,"A bottle filled with white liquid which is distilled from Lactaid and LaBova. Rathazul mentioned that this potion will greatly improve your lactation. There\'s the possibility of permanently lactating, even if you\'re a male.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as BreastRow;
         get_player().slimeFeed();
         var _loc1_:Number = 0;
         outputText("你喝下了牛奶药水。不出所料，它尝起来像牛奶。");
         if(get_player().biggestLactation() < 1)
         {
            outputText("[pg]");
            outputText("你感觉到你的[nipples]变得紧绷和充血。一滴牛奶从每个乳头溢出，顺着你乳房的曲线滚落。<b>你现在开始泌乳了！</b>");
            _loc2_ = 0;
            _loc3_ = get_player().breastRows;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc4_ = _loc3_[_loc2_];
               _loc2_++;
               _loc4_.lactationMultiplier += 5;
            }
         }
         else
         {
            outputText("[pg]");
            outputText("牛奶从你的[nipples]中以粗流漏出。你分泌的乳汁更多了！");
            _loc2_ = 0;
            _loc3_ = get_player().breastRows;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc4_ = _loc3_[_loc2_];
               _loc2_++;
               _loc4_.lactationMultiplier += 2 + Utils.rand(30) / 10;
            }
         }
         if(Utils.rand(2) == 0 && !get_player().hasPerk(PerkLib.MilkMaid))
         {
            outputText("[pg]");
            outputText("你能感觉到你的[chest]里有什么东西，因为它们感觉更致密了。你的整个身体都有一种奇怪的刺痛感。不知怎么的，你知道你将无法停止泌乳。\n");
            outputText("<b>获得特质：挤奶女工！（你的产奶量增加200毫升，并且你不会停止泌乳。）</b>");
            get_player().createPerk(PerkLib.MilkMaid,1,0,0,0);
         }
         else if(Utils.rand(get_player().perkv1(PerkLib.MilkMaid)) == 0 && get_player().perkv1(PerkLib.MilkMaid) < 10)
         {
            outputText("[pg]");
            outputText("你能感觉到你的[chest]里有什么东西，因为它们感觉更加致密了。你的整个身体都有一种奇怪的刺痛感。看来你要分泌更多的乳汁了。\n");
            outputText("<b>特质升级：挤奶女工！（你的产奶量额外增加100毫升。）</b>");
            get_player().addPerkValue(PerkLib.MilkMaid,1,1);
         }
         else if(get_player().perkv1(PerkLib.MilkMaid) >= 10)
         {
            outputText("[pg]");
            outputText("你能感觉到你的[chest]里有什么东西在刺痛，但并没有发生什么特别的事情。<b>也许你已经达到了永久提升泌乳量的上限？</b>\n");
         }
         return false;
      }
   }
}

