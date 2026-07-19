package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class SpringWater extends Consumable
   {
      
      public function SpringWater()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("S.Water","Spring Water","a waterskin filled with spring water",6,"A waterskin full of water from Minerva\'s spring. It\'s clean and clear, with a faint sweet scent to it. You\'re sure it would be a very refreshing drink.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("水清凉甘甜，每一口都让你感到更加平静、洁净和清爽。你喝到解渴为止，感觉身心都变得更加纯粹。");
         get_player().changeFatigue(-10);
         dynStats(DynStat.Lust(-25),DynStat.Cor(-3 - Utils.rand(2)),DynStat.NoScale);
         get_player().HPChange(20 + 5 * get_player().level + Utils.rand(5 * get_player().level),true);
         get_player().refillHunger(10);
         if(get_player().cor > 50)
         {
            dynStats(DynStat.Cor(-1));
         }
         if(get_player().cor > 75)
         {
            dynStats(DynStat.Cor(-1));
         }
         return false;
      }
   }
}

