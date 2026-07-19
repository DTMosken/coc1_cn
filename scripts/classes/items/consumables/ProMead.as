package classes.items.consumables
{
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class ProMead extends Consumable
   {
      
      public function ProMead()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("ProMead","PremiumMead","a pint of premium god\'s mead",6,null);
         _headerName = "优质神之蜜酒";
      }
      
      override public function useItem() : Boolean
      {
         outputText("你痛快地喝了一大口蜂蜜酒，品味着舌尖上那甜美的味道。在第一口的鼓舞下，你一口气喝光了角杯里剩下的酒。你满意地擦了擦嘴唇，把空角杯扔到一边。");
         dynStats(DynStat.Lib(1),DynStat.Cor(-1));
         outputText("[pg]这烈酒让你顿时感到精神焕发，仿佛你能单挑一大群野蛮人或巨人并取得胜利！");
         get_player().HPChange(Math.round(get_player().maxHP()),false);
         dynStats(DynStat.Lust(20 + Utils.rand(6),DynStatOp.Eq));
         if(Utils.rand(3) == 0)
         {
            outputText("[pg]酒精让你的四肢充满了力量，让你觉得仅凭双拳就能对抗整个世界！");
            if(get_silly())
            {
               outputText("也许你应该光着膀子到处跑、喝酒、打架！萨克斯顿·海尔会为你感到骄傲的。");
            }
            dynStats(DynStat.Str(1));
         }
         else
         {
            outputText("[pg]你捶了捶胸口，咧嘴一笑——在液体勇气的加持下，你的敌人们想打倒你可就更难了。");
            dynStats(DynStat.Tou(1));
         }
         return false;
      }
      
      override public function getMaxStackSize() : int
      {
         return 5;
      }
   }
}

