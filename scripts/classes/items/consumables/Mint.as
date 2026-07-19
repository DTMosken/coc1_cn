package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class Mint extends Consumable
   {
      
      public function Mint()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("C. Mint","Calming Mint","a calming mint",6,"A sprig of silver-colored mint. Its strong scent makes you feel calmer and less lustful.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("吃下这根生薄荷枝有点勉强，但你还是设法吞了下去。当强烈的薄荷味席卷你的味蕾时，你的头脑感到更加平静，一种放松的感觉蔓延全身。");
         dynStats(DynStat.Lib(-1),DynStat.Lust(-10),DynStat.Inte(0.5),DynStat.NoScale);
         get_player().refillHunger(5);
         return false;
      }
   }
}

