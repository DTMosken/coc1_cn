package classes.items.consumables
{
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class HerbalContraceptive extends Consumable
   {
      
      public function HerbalContraceptive()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("HrblCnt","H.Contracep.","a bundle of verdant green leaves",6,"A small bundle of verdant green leaves. These herbs should prevent the person taking them from becoming pregnant. The effects usually last for around two days.");
         _headerName = "草药避孕药";
      }
      
      override public function useItem() : Boolean
      {
         outputText("你尽可能快地咀嚼着这些苦得要命的叶子，然后把它们吞了下去。");
         get_player().createStatusEffect(StatusEffects.Contraceptives,1,48,0,0);
         return false;
      }
   }
}

