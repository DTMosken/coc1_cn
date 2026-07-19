package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Consumable;
   import flash.Boot;
   import haxe.IMap;
   
   public class PumpkinSeed extends Consumable
   {
      
      public function PumpkinSeed()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PumpkinS","PumpkinSeed","a huge pumpkin seed",200,"A huge pumpkin seed. It appears safe enough to eat.");
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         outputText("你吃下了南瓜籽，连壳带肉。它出奇地嫩甜，味道在你的舌头上停留了很长时间。它巨大的尺寸使它成为一种非常好的零食。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2678,FlagDict_Impl_.arrayReadInt(_loc1_,2678) + 1);
         if(!(get_player().hasPerk(PerkLib.FerasBoonAlpha) || get_player().hasPerk(PerkLib.FerasBoonBreedingBitch) || get_player().hasPerk(PerkLib.FerasBoonMilkingTwat) || get_player().hasPerk(PerkLib.FerasBoonSeeder) || get_player().hasPerk(PerkLib.FerasBoonWideOpen)))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2678) == 1)
            {
               outputText("[pg]事实上，这是一种非常好的零食。你感觉棒极了！你应该找更多。绝对的。");
               dynStats(DynStat.Str(3),DynStat.Spe(3),DynStat.Inte(3),DynStat.Tou(3));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2678) == 2)
            {
               outputText("[pg]你感到一阵头晕，视线变得模糊。有那么一瞬间，你的脑海中浮现出一个愚蠢的幻象；一个巨大的南瓜。");
               outputText("[pg]幻象几乎立刻就消散了，快得让你怀疑它是否真的发生过。这并没有困扰你太久；种子那绝对神圣的味道在你的脑海中留下了更深刻的印记。你也许应该去找更多。");
               dynStats(DynStat.Str(2),DynStat.Spe(2),DynStat.Inte(2),DynStat.Tou(2));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2678) == 3)
            {
               outputText("[pg]吃完饭后，你又被那个愚蠢的幻象袭击了。这次持续的时间更长，让你更烦躁了。不过，尽管你很苦恼，这些种子的味道却越来越好！");
               dynStats(DynStat.Str(1),DynStat.Spe(1),DynStat.Inte(1),DynStat.Tou(1));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2678) == 4)
            {
               outputText("[pg]黑暗侵蚀了你的视线边缘，你晕厥了片刻。你再次看到了那个巨大的南瓜，而且这个奇怪的幻象清晰得多。");
               outputText("[pg]你可以看清场景的所有细节；巨大葫芦周围黑暗潮湿的森林，周围湿滑的藤蔓，地上的灌木丛和泥土斑块。你走向那个巨大的葫芦，心中充满了目标和渴望……");
               outputText("[pg]你醒了过来，浑身充满了能量。你从地上弹起来，开始烦躁不安，无法保持静止。每次你闭上眼睛，巨大南瓜的场景就会再次袭击你的大脑。它深深地埋在你的脑海里，你无法摆脱它。你的一部分在担心这些种子的影响，但寻找葫芦的冲动是如此原始，以至于你没有时间去关心。存在这种东西的想法很可笑，但你需要去寻找它。");
            }
         }
         get_player().changeFatigue(-10);
         get_player().refillHunger(20);
         return false;
      }
   }
}

