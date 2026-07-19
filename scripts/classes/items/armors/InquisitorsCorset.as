package classes.items.armors
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.items.Equippable;
   import flash.Boot;
   
   public final class InquisitorsCorset extends Armor
   {
      
      public function InquisitorsCorset()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("I.Corst","InquisitorCorset","inquisitor\'s corset","an inquisitor\'s corset",4,2000,"A sexualized and feminine red and gold ensemble carrying with it the hopes of a shamed sorcerer. Wearing it will cause spells to tax your health instead of exhausting you.","Light",false,false);
         boost("挑逗几率",NumberFunc_Impl_.fromInt(10),false);
      }
      
      override public function useText() : void
      {
         outputText("你拿出了在沼泽地下室得到的衣服。这件衣服的色情本质让你有些兴奋，而且你知道它在战斗中也很实用。[if (hasarmor) { 你迫不及待地脱下衣服，想要试穿一下。}][pg]");
         outputText("你检查了一下姿势项圈是否可以从袖子上拆下来，却发现根本没有办法。你耸耸肩，将手臂滑入袖子，将中指穿过延伸的末端。袖子上的金色刺绣包含了一些你见过的最华丽、最风格化的鸡巴图案，最后在你的手掌中散开大量的金线，象征着射精。你抬起下巴，将姿势项圈戴好，从后面系上带子，将你的脖子完全隐藏起来。深红色与你[skintone]的[skindesc]很相配。当你意识到这个项圈不像真正的姿势项圈那样死板，允许你舒适地活动时，你感到一丝喜悦——尽管你短暂地想过，如果它不能活动，战斗会是什么样子。[pg]");
         outputText("接下来你穿上束腰，把它裹在你的腰部和胸部，将你的[nipples]隐藏在更多的红色和金色装饰之下。当你系上束腰的带子时，你意识到你原本以为在罩杯之间升起的一把风格化的剑，其实更像是一根阴茎。好吧。腰带几乎贴在束腰上，仿佛它们本来就是一件衣服，扣在一组高度风格化的金色线条下方，你怀疑这些线条是想表现一张正在祈祷或口交，或者两者兼而有之的脸。[pg]");
         outputText("之前对裙子的怀疑被证明是正确的——它根本起不到任何遮挡作用。它遮住了右侧的一些皮肤，主要是在后面，但你的正面却完全暴露在世人面前。这条裙子感觉更应该穿在跳舞的歌舞女郎身上，而不是审判官身上，但你既然做出了选择，结果<i>确实</i>很诱人。随着靠近裙摆，金色的滚边呈现出挥舞扭曲的触手形状，看起来就像要从布料中爆裂出来，猥亵它的穿着者。[pg]");
         if(get_player().isBiped())
         {
            outputText("最后，你把双腿伸进靴子里。鞋跟本身是中空的，以适应穿着者脚上任何天然的骨刺，而靴子的其余部分似乎出奇地贴合你的尺寸。在某种程度上，当你穿进去时，感觉它好像在重塑自身——最初感觉紧绷的部分在几分钟内就变松了，就好像靴子在自我磨合。如果纸条上说的是真的，这套盔甲会适应找到它的人，那么如果在制造时注入了足够的魔力，也许连蹄子和爪子都能穿得下。每只靴子的侧面都有系带，一直延伸到你的大腿，类似于与它们搭配的紧身胸衣。它们的正面带有金色的符号，类似于密室正面的符号。根据你之前的破译，它们的意思介于祈祷和对肉棒的赞美之间。穿着它们站起来，当你感觉到你的[ass]在它们的影响下翘起时，你笑了。");
         }
         else
         {
            outputText("这套衣服的最后一部分是一双高跟系带靴，虽然上面装饰着华丽的金色符号，拼写出似乎是对性爱的赞美诗，但在你目前的状态下似乎……没法穿。你把它们收在一个安全的地方，以防你再次变成两足生物，然后站直身子打量自己。");
         }
         outputText("[pg]");
         outputText("你感到性感……而且虔诚。");
         outputText("[pg](<b>获得特质：血法师</b>：法术消耗生命值（至少5点）而不是疲劳值！)[pg]");
         dynStats(DynStat.Lust(5));
      }
      
      override public function playerRemove() : Equippable
      {
         get_player().removePerk(PerkLib.BloodMage);
         return super.playerRemove();
      }
      
      override public function playerEquip() : Equippable
      {
         get_player().createPerk(PerkLib.BloodMage);
         return super.playerEquip();
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = super.get_description();
         return _loc1_ + "\n特殊：血法师";
      }
   }
}

