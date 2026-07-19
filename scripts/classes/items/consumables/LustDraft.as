package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class LustDraft extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var ENHANCED:int = 1;
      
      public var fuck:Boolean;
      
      public function LustDraft(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         fuck = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         fuck = param1 == 1;
         switch(param1)
         {
            case 0:
               _loc2_ = "L.Draft";
               _loc3_ = "Lust Draft";
               _loc4_ = "a vial of roiling bubble-gum pink fluid";
               _loc5_ = "这瓶亮粉色的液体在玻璃瓶内不断冒泡，似乎急于逃脱。" + "它闻起来非常甜，瓶身侧面刻着“催情”字样。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "F.Draft";
               _loc3_ = "Fuck Draft";
               _loc4_ = "a vial of roiling red fluid labeled \"Fuck Draft\"";
               _loc5_ = "这瓶红色液体在玻璃瓶内不断冒泡，仿佛急于逃离。" + "它散发着非常强烈的气味，尽管很难辨认出具体是什么味道。" + "瓶身侧面刻着“干”字。";
               _loc6_ = 20;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你喝下了 " + (fuck ? "红色" : "粉色") + " 药水，它那不自然的温暖立刻流向了你的腹股沟。");
         dynStats(DynStat.Lust(30 + Utils.rand(get_player().lib / 10)),DynStat.NoScale);
         if(fuck)
         {
            get_player().goIntoHeat(true,2);
            get_player().goIntoRut(true);
         }
         if(get_player().get_lust() >= get_player().maxLust() && !get_game().get_inCombat())
         {
            outputText("[pg]药水带来的性奋感淹没了你的感官，导致你自发地高潮。你扯下你的[armor]并向下看，你的[if (hasCock) {[cocks]在你面前爆发[if (cocks == 1) {}]，大量地喷洒在你周围的地上。[if (hasVagina) {同时你的}]}] [if (hasVagina) {[vagina]浸湿了你的大腿。}] [if (isGenderless) {身体开始因高潮的狂喜而颤抖。}]一旦你有机会平静下来，你就会注意到你刚刚经历的快感爆炸已经震撼了你的核心。你比以前更饥渴了。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(2),DynStat.Sens(1));
         }
         if(get_player().get_lust() > get_player().maxLust())
         {
            get_player().set_lust(get_player().maxLust());
         }
         outputText("[pg]");
         get_player().refillHunger(5);
         return false;
      }
   }
}

