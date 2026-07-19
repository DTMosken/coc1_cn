package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class FrothyBeer extends Consumable
   {
      
      public function FrothyBeer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Fr Beer","Frothy Beer","a tankard of frothy beer",6,"A tankard of beer from The Black Cock. There\'s a hinged lid to prevent spillage.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你觉得口干舌燥，按下酒杯盖的铰链，一饮而尽。");
         dynStats(DynStat.Lust(15));
         get_player().refillHunger(10,false);
         if(!get_player().hasStatusEffect(StatusEffects.Drunk))
         {
            get_player().createStatusEffect(StatusEffects.Drunk,2,1,1,0);
            dynStats(DynStat.Str(0.1));
            dynStats(DynStat.Inte(-0.5));
            dynStats(DynStat.Lib(0.25));
         }
         else
         {
            get_player().addStatusValue(StatusEffects.Drunk,2,1);
            if(get_player().statusEffectv1(StatusEffects.Drunk) < 2)
            {
               get_player().addStatusValue(StatusEffects.Drunk,1,1);
            }
            if(get_player().statusEffectv2(StatusEffects.Drunk) == 2)
            {
               outputText("[pg]<b>你感觉有点醉了。也许你应该少喝点啤酒？</b>");
            }
         }
         if(get_player().tone < 70)
         {
            get_player().modTone(70,Utils.rand(3));
         }
         if(get_player().get_femininity() > 30)
         {
            get_player().modFem(30,Utils.rand(3));
         }
         return false;
      }
   }
}

