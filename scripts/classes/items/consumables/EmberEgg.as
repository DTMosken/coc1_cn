package classes.items.consumables
{
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class EmberEgg extends Consumable
   {
      
      public function EmberEgg()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("DrgnEgg","Dragon Egg","an unfertilized dragon egg",6,"A large, solid egg, easily the size of your clenched fist. Its shell color is reddish-white, with blue splotches.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你轻松敲开蛋壳，吞下巨大的蛋黄和大量的蛋清——蛋黄是蓝色的，而其余部分则带有深红色调。它的味道像……嗯，你觉得主要像是加了香料的薄荷味。");
         if(get_player().hasPerk(PerkLib.Dragonfire))
         {
            if(get_player().hasStatusEffect(StatusEffects.DragonBreathCooldown))
            {
               get_player().removeStatusEffect(StatusEffects.DragonBreathCooldown);
            }
            else if(!get_player().hasStatusEffect(StatusEffects.DragonBreathBoost))
            {
               get_player().createStatusEffect(StatusEffects.DragonBreathBoost,0,0,0,0);
            }
            outputText("[pg]一股能量突然涌遍全身，你感觉自己只需一口气就能将任何东西轰成原子，就像传说中强大的巨龙一样。");
         }
         get_player().changeFatigue(-20);
         get_player().refillHunger(50);
         return false;
      }
      
      override public function getMaxStackSize() : int
      {
         return 5;
      }
   }
}

