package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class GodMead extends Consumable
   {
      
      public function GodMead()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("GodMead","God\'s Mead","a pint of god\'s mead",6,"A horn of potent, honey-colored mead. A single whiff makes your head swim and your thoughts turn to violence and heroism.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你痛快地喝了一大口蜜酒，品味着舌尖上蜂蜜的甜美。在第一口的壮胆下，你立刻将角杯里剩下的酒一饮而尽。你满意地擦了擦嘴唇，将空角杯扔到一边。");
         dynStats(DynStat.Lib(1),DynStat.Cor(-1));
         outputText("[pg]你突然感到被这烈酒注入了活力，感觉自己能单挑一整群野蛮人或巨人并取得胜利！");
         get_player().HPChange(Math.round(get_player().maxHP() * 0.33),true);
         if(Utils.rand(3) == 0)
         {
            outputText("[pg]酒精让你的四肢充满活力，让你觉得仅凭双拳就能对抗整个世界！");
            if(get_silly())
            {
               outputText("也许你应该光着膀子到处跑，喝酒，打架！萨克斯顿·海尔会为你感到骄傲的。");
            }
            dynStats(DynStat.Str(1));
         }
         else
         {
            outputText("[pg]你捶着胸口咧嘴一笑——在“液体勇气”的强化下，你的敌人将更难击倒你。");
            dynStats(DynStat.Tou(1));
         }
         if(Utils.rand(6) == 0 && get_player().beard.length < 4)
         {
            if(get_player().beard.length <= 0)
            {
               outputText("下巴突然传来一阵刺痛。你用手摸了摸，发现下半张脸覆盖着一层薄薄的胡茬。<b>你现在留着漂亮的[haircolor]胡子！</b>");
            }
            else
            {
               outputText("[pg]下巴突然传来一阵刺痛。你骄傲地抚摸着胡须，它正慢慢变得更长、更有光泽。");
            }
            var _temp_1:* = get_player().beard;
            _temp_1.length = _temp_1.length + 0.5;
         }
         get_player().refillHunger(20);
         return false;
      }
      
      override public function getMaxStackSize() : int
      {
         return 5;
      }
   }
}

