package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.npcs.MarbleScene;
   import flash.Boot;
   
   public class MarbleMilk extends Consumable
   {
      
      public function MarbleMilk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("M. Milk","Marble Milk","a clear bottle of milk from Marble",6,"A clear bottle of milk from Marble\'s breasts. It smells delicious.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         if(get_game().marbleScene.get_marbleAddiction() < 30 && get_game().marbleScene.get_knowAddiction() == 0)
         {
            outputText("你大口喝下瓶子里的东西；玛布尔产的奶味道真不错。[pg]");
         }
         else if(get_game().marbleScene.get_knowAddiction() <= 0)
         {
            outputText("你大口喝下瓶子里的东西；玛布尔产的奶味道真的非常棒。[pg]");
         }
         else if(get_game().marbleScene.get_knowAddiction() > 0)
         {
            if(get_player().hasPerk(PerkLib.MarblesMilk))
            {
               outputText("你大口喝下瓶子里的东西；虽然不能代替真正的奶，但也是个不错的提神饮料。[pg]");
            }
            else if(get_player().hasPerk(PerkLib.MarbleResistant))
            {
               outputText("你大口喝下瓶子里的东西；你小心翼翼地不让自己太迷恋这个味道。[pg]");
            }
            else
            {
               outputText("你大口喝下瓶子里的东西；你真的很需要这个。[pg]");
            }
         }
         var _loc1_:MarbleScene = get_game().marbleScene;
         _loc1_.set_marbleAddiction(_loc1_.get_marbleAddiction() + 5);
         if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            get_player().removeStatusEffect(StatusEffects.MarbleWithdrawl);
            dynStats(DynStat.Tou(5),DynStat.Inte(5));
            outputText("你不再感到戒断症状了。[pg]");
         }
         get_player().HPChange(70 + Utils.rand(31),true);
         get_player().changeFatigue(-25);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,6 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,12,0,0,0);
         }
         get_player().refillHunger(20);
         return false;
      }
   }
}

