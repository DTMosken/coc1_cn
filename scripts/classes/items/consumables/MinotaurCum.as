package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class MinotaurCum extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var PURIFIED:int = 1;
      
      public var purified:Boolean;
      
      public function MinotaurCum(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         purified = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         purified = param1 == 1;
         switch(param1)
         {
            case 0:
               _loc2_ = "MinoCum";
               _loc3_ = "Mino Cum";
               _loc4_ = "a sealed bottle of minotaur cum";
               _loc5_ = "这瓶牛头人精液看起来浓稠又粘滑。你知道它有麻醉作用，但除此之外，它的效果还相对未知。";
               _loc6_ = 60;
               break;
            case 1:
               _loc2_ = "P.M.Cum";
               _loc3_ = "P. Mino Cum";
               _loc4_ = "a sealed bottle of purified minotaur cum";
               _loc5_ = "这瓶牛头人精液看起来浓稠又粘滑。你知道它有麻醉作用，但除此之外，它的效果还相对未知。拉萨祖尔已经将其提纯，去除了它的腐化和成瘾特性。";
               _loc6_ = 30;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         get_player().slimeFeed();
         if(!purified)
         {
            get_player().minoCumAddiction(7);
         }
         else
         {
            get_player().minoCumAddiction(-2);
         }
         outputText("当你打开装有白色液体的瓶子的密封时，一股");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 0 && !get_player().hasPerk(PerkLib.MinotaurCumResistance))
         {
            outputText("强烈的麝香味扑面而来。");
         }
         else
         {
            outputText("天堂般的香味充满了你的鼻腔。");
         }
         if(!purified)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) < 50)
            {
               outputText("它让你感到头晕目眩、神志不清、平静安详。");
            }
            else
            {
               outputText("它让你感到欣快、快乐，并愿意做任何事情来保持这种感觉。");
            }
         }
         else
         {
            outputText("你知道这瓶子是经过净化的，你确信你不会对这瓶子上瘾。");
         }
         outputText("你的手不由自主地把瓶子送到唇边，当你痉挛地吞下整瓶液体时，令人陶醉的味道充满了你的口腔。");
         dynStats(DynStat.Sens(1),DynStat.Lust(10));
         if(!purified)
         {
            if(get_player().cor < 50)
            {
               dynStats(DynStat.Cor(1));
            }
            else if(get_player().cor < 75)
            {
               dynStats(DynStat.Cor(0.5));
            }
            else
            {
               dynStats(DynStat.Cor(0.25));
            }
         }
         outputText("[pg]一阵阵的麻木感席卷你的全身，变成一种温暖的刺痛感，让你感到全身敏感。温暖流遍你的全身，汇聚在你的下体，并冒出欲望的泡泡。");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("");
            if(get_player().cockTotal() == 1)
            {
               outputText("你");
            }
            else
            {
               outputText("你的每一根");
            }
            outputText("[cocks]都在隐隐作痛，充血直到肿胀颤抖。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[clit]充血，");
            if(get_player().getClitLength() < 3)
            {
               outputText("分开你的阴唇。");
            }
            else
            {
               outputText("冲破了你的嘴唇，在自身的重量下晃动着。");
            }
            if(get_player().vaginas[0].vaginalWetness <= 1)
            {
               outputText("你的" + get_player().vaginaDescript(0) + "感到一阵刺痛，渴望被填满，体内的湿润感不断增加。");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 3)
            {
               outputText("你的身体对内心燃烧的欲望做出了反应，一丝湿润从你的" + get_player().vaginaDescript(0) + "中流出。");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("你的身体对这种新的刺激做出了反应，湿润的液体顺着你的大腿流下。");
            }
            else
            {
               outputText("你的身体对这种新的刺激做出了反应，滑腻的液体浸透了你的大腿。");
            }
         }
         if(!get_game().get_inCombat() && Utils.rand(10) == 1 && (!purified && !get_player().hasPerk(PerkLib.MinotaurCumResistance)))
         {
            outputText("[pg]你的眼睛闭上了一秒钟，一个幻想侵入了你的脑海。你跪在地上，在一个牛头怪面前匍匐着。它那令人迷醉的气味弥漫在你的周围，你前后摇晃着，肚子里已经装满了精液，发出晃动的声音。它那像马一样的阴茎在你的脸上摩擦，你向这只野兽屈服，张大嘴巴，将它那出汗的、闪闪发光的粗大阴茎吞入体内。你的舌头高兴地颤抖着，开始吸吮和发出啧啧声，吞下你从这根野兽般的勃起中诱出的每一滴先列腺液。你高兴地咕噜咕噜叫着，把自己交给这个非人的主人，以换取一个吞咽进入无意识的极乐的机会。");
            dynStats(DynStat.Lib(1),DynStat.Lust(Utils.rand(5) + get_player().cor / 20 + FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) / 5));
         }
         if(get_player().get_HP() < get_player().maxHP() && get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            outputText("[pg]你被唤起的欲火吞噬了你的身体，留下了活力。你感觉好多了！");
            get_player().HPChange(int(get_player().maxHP() / 4),false);
         }
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,21) <= 0 && !purified)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,21,3 + Utils.rand(2));
            outputText("[pg]<b>你的身体感觉如此奇妙和敏感。你试探性地掐了自己一下，发现即使是疼痛也能让你兴奋！</b>");
         }
         if(purified && (get_player().hasPerk(PerkLib.MinotaurCumAddict) || FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) >= 40))
         {
            outputText("[pg]仅仅是喝了纯净的牛头怪精液，你的头脑就感觉清醒了一些。也许如果你多喝一些，你就能摆脱你的瘾了？");
            if(get_player().hasPerk(PerkLib.MinotaurCumAddict) && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) <= 50)
            {
               outputText("突然，你眼前一黑，脑海中闪过被牛头怪绑架的画面，以及你放弃了你的任务，最终导致莉希丝成功占领玛瑞斯。不，这不可能！你醒了过来，从昏厥中恢复，惊恐地发现如果你和牛头怪度过余生，到底会发生什么！你摇了摇头，意识到你不再依赖精液了。");
               outputText("\n<b>(失去特质：牛头怪精液成瘾！)</b>");
               get_player().removePerk(PerkLib.MinotaurCumAddict);
            }
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) >= 100 && !get_player().hasPerk(PerkLib.MinotaurCumResistance) && !get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            get_player().createPerk(PerkLib.MinotaurCumAddict,0,0,0,0);
            outputText("<b>你现在是一个牛头怪精液成瘾者</b> (瓶装牛头怪精液现在可以恢复你25%的生命值，但会在几个小时内造成生命值伤害以提升欲望。)[pg]");
         }
         get_player().refillHunger(25);
         return false;
      }
   }
}

