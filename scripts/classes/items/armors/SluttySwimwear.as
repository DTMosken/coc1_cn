package classes.items.armors
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class SluttySwimwear extends Armor
   {
      
      public function SluttySwimwear()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("S.Swmwr","Skimpy Bikini","slutty swimwear","a skimpy black bikini",0,6,"An impossibly skimpy black bikini. You feel dirty just looking at it... and a little aroused, actually.","Light");
         boost("挑逗伤害",NumberFunc_Impl_.fromInt(6),false);
         boost("挑逗几率",NumberFunc_Impl_.fromInt(6),false);
      }
      
      override public function useText() : void
      {
         dynStats(DynStat.Lust(5));
         if(get_player().biggestTitSize() < 1)
         {
            outputText("像这样穿上上半部分让你觉得有点蠢，但你愿意忍受。它绝对能很好地分散注意力。");
         }
         else
         {
            outputText("比基尼上衣紧紧贴着你的胸部，让你的身体一阵愉悦的颤栗。它能很好地挑起你的性欲。");
            dynStats(DynStat.Lust(5));
         }
         if(get_player().totalCocks() == 0)
         {
            outputText("丁字裤滑过你光滑的腹股沟，完美地贴合在你的臀部上。");
            if(get_player().balls > 0)
            {
               if(get_player().ballSize > 5)
               {
                  outputText("你尽力穿上这条丁字裤，虽然材料非常有弹性，但它根本无法遮住所有东西，你的[balls]挂在两侧，暴露在外。也许如果你把你的男性部位缩小一点……");
               }
               else
               {
                  outputText("然而，你的睾丸确实让你感到不适，它们撑开了布料，在两侧微微凸起。");
               }
            }
         }
         else
         {
            if(get_player().totalCocks() == 1)
            {
               outputText("你不舒服地闷哼了一声，你的[cock]从丁字裤的束缚中挣脱出来。紧绷的布料摩擦着你的肉棒，确实让你有些兴奋。");
            }
            else
            {
               outputText("你不舒服地闷哼了一声，你的[cocks]从丁字裤的束缚中挣脱出来。紧绷的布料摩擦着你的肉棒，确实让你有些兴奋。");
            }
            dynStats(DynStat.Lust(5));
            if(get_player().biggestCockArea() >= 20)
            {
               outputText("你尽力穿上这条丁字裤，虽然材料非常有弹性，但它根本无法遮住所有东西，你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "从顶部弹了出来，完全暴露在外。也许如果你把你的男性部位缩小一点……");
            }
            else if(get_player().ballSize > 5)
            {
               outputText("你尽力穿上这条丁字裤，虽然材料非常有弹性，但它根本无法遮住所有东西，你的[balls]挂在两侧，暴露在外。也许如果你把你的男性部位缩小一点……");
            }
         }
         outputText("[pg]");
      }
   }
}

