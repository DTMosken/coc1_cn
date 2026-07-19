package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class FishFillet extends Consumable
   {
      
      public function FishFillet()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("FishFil","Fish Fillet","a fish fillet",6,"A perfectly cooked piece of fish. You\'re not sure what kind of fish it is, since you\'re fairly certain \"delicious\" is not a valid species.");
      }
      
      override public function useItem() : Boolean
      {
         if(!get_game().get_inCombat())
         {
            outputText("你坐下来，解开鱼排的包装。它的肉质完美地呈片状，让你能把它掰成一口大小的碎块。这顿咸香的一餐很快就被消灭了，你的肚子发出了满意的咕噜声。");
         }
         else
         {
            outputText("你从包里拿出鱼排。你没有像往常那样解开包装细细品味，而是连着包在外面的叶子一起咬了一大口。没过多久，这顿咸香的一餐就被消灭了，你的肚子发出了满意的咕噜声。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            dynStats(DynStat.Cor(0.5));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            dynStats(DynStat.Cor(-0.1));
         }
         dynStats(DynStat.Cor(0.1));
         get_player().HPChange(Math.round(get_player().maxHP() * 0.25),true);
         get_player().refillHunger(30);
         return false;
      }
   }
}

