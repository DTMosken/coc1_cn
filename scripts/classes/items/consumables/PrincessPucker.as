package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PrincessPucker extends Consumable
   {
      
      public function PrincessPucker()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PrnsPkr","Princess P.","a vial of pinkish fluid",6,"A vial filled with a viscous pink liquid. A label reads \"Princess Pucker\".");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你拔开瓶塞，试探性地闻了闻。液体呈淡粉色，里面漂浮着金色的斑点，散发着淡淡的覆盆子香味。格温公主说这东西能喝。[pg]");
         outputText("你一口气喝下瓶子里的液体，因为那糖浆般甜腻的覆盆子味道打了个嗝。紧随甜味之后的是一阵酸味，就像酸橙一样刺鼻。你撅起嘴唇，感觉强烈的味道让你的头脑清醒了一些。你想知道格温是用什么做成这个的。[pg]");
         outputText("与头部的感觉相呼应，你的身体也传来一阵刺痛感。柑橘类酸味的突然冲击让你做爱的欲望稍微降低了一些，让你能更专注于当前的首要任务。[pg]");
         if(Utils.rand(2) == 0)
         {
            dynStats(DynStat.Lust(-20),DynStat.Lib(-2));
         }
         else
         {
            dynStats(DynStat.Lust(-20),DynStat.Sens(-2));
         }
         if(get_player().hair.color != "pink")
         {
            if(Utils.rand(5) == 0)
            {
               outputText("头皮上的一阵轻微刺痛感将你的注意力吸引到了头发上。你头发的[haircolor]正在染上明显的粉红，从发根开始飞速变化着！[pg]");
               get_player().hair.color = "pink";
            }
         }
         get_player().refillHunger(15);
         return false;
      }
   }
}

