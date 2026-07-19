package classes.items.consumables
{
   import classes.Ass;
   import classes.BreastRow;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class SweetGossamer extends Consumable
   {
      
      public static var SPIDER:int = 0;
      
      public static var DRIDER:int = 1;
      
      public var type:int;
      
      public function SweetGossamer(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = 0;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         type = param1;
         switch(type)
         {
            case 0:
               _loc2_ = "S.Gossr";
               _loc3_ = "S. Gossamer";
               _loc4_ = "a bundle of pink, gossamer webbing";
               _loc5_ = "这些黏糊糊的粉色蛛丝似乎与蜘蛛人产生的普通丝线截然不同。它闻起来很甜，显然是可以食用的，但谁知道它会对你产生什么影响呢？";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "B.Gossr";
               _loc3_ = "B. Gossamer";
               _loc4_ = "a bundle of black, gossamer webbing";
               _loc5_ = "这些黏糊糊的黑色蛛丝似乎与蛛化精灵产生的普通丝线截然不同。它闻起来很甜，显然是可以食用的，但谁知道它会对你产生什么影响呢？";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Vagina;
         var _loc4_:* = null as Ass;
         var _loc5_:int = 0;
         var _loc1_:String = "sweetGossamer";
         if(type == 1)
         {
            _loc1_ += "-drider";
         }
         get_mutations().initTransformation([2,2]);
         if(type == 0)
         {
            outputText("你把甜甜的粉色蛛丝揉成一团吃掉，发现它美味又有嚼劲，简直就像口香糖。你大口咀嚼着，嘴里分泌出大量的唾液，直到你吃着这甜美的点心时，口水流得满身都是。");
         }
         else if(type == 1)
         {
            outputText("你把甜甜的黑色蛛丝揉成一团吃掉，发现它美味又有嚼劲，简直就像甘草糖。你大口咀嚼着，嘴里分泌出大量的唾液，直到你吃着这甜美的点心时，口水流得满身都是。");
         }
         if(get_player().get_spe100() < 70 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你感觉自己的反应快多了。你试探性地抓向附近石头上的一只苍蝇，迅速地把它从半空中抓了下来。一种想把它塞进嘴里吃掉的冲动浮现出来，但你克制住了这种奇怪的欲望。你为什么会想做这种事呢？");
            dynStats(DynStat.Spe(1.5));
         }
         if(get_player().get_spe100() > 80 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你觉得想在高高的树上休息，等着毫无防备的猎物在下面游荡，这样你就可以不费吹灰之力地抓住它们。多么奇怪的想法！");
            dynStats(DynStat.Spe(-1.5));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你手臂和腿上的汗毛直立了一会儿，探测着你周围的气流。从现在起，你的触觉似乎变得更加敏锐了。");
            dynStats(DynStat.Sens(1));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你突然觉得有些空虚，你的下半身在悄悄地提醒你，它们需要被照顾。余味在你的舌头和牙齿上萦绕。你真希望还能再多吃一点。");
            dynStats(DynStat.Lib(1));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().get_tou100() < 60)
         {
            outputText("[pg]你慵懒地伸了个懒腰，意识到自己感觉比以前更强壮了，就好像你有一层保护内脏的全身盔甲。真奇怪。你摸了摸自己，虽然你的[skinfurscales]感觉没什么不同，但下面的肉似乎确实更结实了。");
            dynStats(DynStat.Tou(1));
         }
         if(get_player().get_str100() > 70 && Utils.rand(3) == 0)
         {
            outputText("[pg]一种昏昏欲睡的感觉席卷全身，你揉了揉肌肉，叹了口气，心想既然你可以织一张漂亮的粘网来抓住敌人，为什么还需要强壮呢。");
            if(get_player().spiderScore() < 4)
            {
               outputText("等等，你又不是蜘蛛，这根本说不通！");
            }
            else
            {
               outputText("好吧，也许你应该让你那漂亮沉重的腹部发挥作用了。");
            }
            dynStats(DynStat.Str(-1));
         }
         if(get_player().tail.type == 5 && get_player().tail.recharge < 25 && get_changes() < get_changeLimit())
         {
            set_changes(get_changes() + 1);
            outputText("[pg]你腹部的吐丝器抽动着，滴下了一点蛛丝。它沉重的重量整体微微移动了一下，不知为何，你知道你现在产丝的速度会更快了。");
            var _temp_1:* = get_player().tail;
            _temp_1.recharge = _temp_1.recharge + 5;
         }
         if(get_player().hasVagina())
         {
            if(get_player().looseness() > 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你倒吸一口凉气，感觉到你的" + get_player().vaginaDescript(0) + "在收紧，让你漏出了黏糊糊的爱液。几秒钟后，这种感觉停止了，你兴奋地揉着你的" + get_player().vaginaDescript(0) + "。你迫不及待地想试试这个！");
               dynStats(DynStat.Lib(2),DynStat.Lust(25));
               set_changes(get_changes() + 1);
               _loc3_ = get_player().vaginas[0];
               --_loc3_.vaginalLooseness;
            }
         }
         if(get_player().ass.analLooseness > 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你发出一声小小的惊呼，你的[asshole]收缩了，变得更小更紧。当这一切结束时，你感觉更加饥渴，渴望再次把它撑开。");
            dynStats(DynStat.Lib(2),DynStat.Lust(25));
            set_changes(get_changes() + 1);
            _loc4_ = get_player().ass;
            --_loc4_.analLooseness;
         }
         if(get_player().hasCock() && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            _loc2_ = 0;
            _loc5_ = 0;
            while(_loc5_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc5_].cockThickness * 5.5 < get_player().cocks[_loc5_].cockLength)
               {
                  get_player().cocks[_loc5_].thickenCock(0.1);
                  _loc2_ = 1;
               }
               _loc5_++;
            }
            if(_loc2_ == 1)
            {
               outputText("[pg]你能感觉到你的[cocks]在你的[armor]里胀大。把");
               if(get_player().cockTotal() == 1)
               {
                  outputText("它");
               }
               else
               {
                  outputText("它们");
               }
               outputText("掏出来，你仔细地看了看。");
               if(get_player().cockTotal() == 1)
               {
                  outputText("它");
               }
               else
               {
                  outputText("它们");
               }
               outputText("绝对变粗了。");
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().smallestTitSize() < 6 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]吃下它后，你的胸部感到一阵刺痛和发麻，你不由自主地伸手去抓。你在心里默默祈祷自己对这东西不过敏。就在你开始抓挠你的" + get_player().breastDescript(get_player().smallestTitRow()) + "时，你的胸部突然微微隆起。");
            var _temp_2:* = get_player().breastRows[get_player().smallestTitRow()];
            _temp_2.breastRating = _temp_2.breastRating + 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().butt.rating < 11 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你回头看了看你的[ass]，却发现它只是微微变大了一点。你困惑地张大了嘴巴，然后又看了看手里剩下的丝。你还是把它吃完了。该死！");
            var _temp_3:* = get_player().butt;
            _temp_3.rating = _temp_3.rating + 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_player().ears.type != 0 && get_player().ears.type != 4 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的耳朵抽动了一次，两次，然后开始疯狂地颤抖。它们向后移动，回到了很久以前耳朵所在的位置，最终停了下来，然后扭曲、拉长，变成了<b>新的尖尖的精灵耳朵。</b>");
            get_player().ears.type = 4;
            set_changes(get_changes() + 1);
         }
         if(!get_player().hasPlainSkin() && (get_player().ears.type == 0 || get_player().ears.type == 4) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一种缓慢积聚的瘙痒感蔓延至你的全身，当你漫不经心地抓挠自己时，你发现你的[skinfurscales]");
            if(get_player().hasScales())
            {
               outputText("正在");
            }
            else
            {
               outputText("正在");
            }
            outputText("掉落到地上，露出下面完美无瑕、几乎呈珍珠白色的皮肤。<b>你现在拥有了苍白的皮肤。</b>");
            get_player().skin.tone = "苍白";
            get_player().skin.adj = "";
            get_player().skin.type = 0;
            get_player().skin.desc = "skin";
            get_player().underBody.restore();
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(get_player().hasPlainSkin() && (get_player().face.type != 10 && get_player().face.type != 0) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]在剧痛的折磨下，你的脸慢慢恢复成完美的人类形状。你对这种转变感到敬畏，用手指轻轻抚摸着新面孔，惊叹于这种变化。<b>你又拥有了一张人类的脸！</b>");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && get_player().bRows() > 2 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_player().averageNipplesPerBreast() > 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵寒意掠过你的" + get_player().allBreastsDescript() + "，然后消失了。你把手伸进[armor]里，发现你多余的乳头不见了！你现在每个");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("“乳房”。");
            }
            else
            {
               outputText("乳房上只有一个了。");
            }
            set_changes(get_changes() + 1);
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc2_].nipplesPerBreast = 1;
               _loc2_++;
            }
         }
         if(!get_player().hasStatusEffect(StatusEffects.BlackNipples) && Utils.rand(6) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一种痒痒的感觉在你的乳头上蔓延，你瑟缩了一下，努力不让自己咯咯笑出声来。低头一看，你刚好看到[nipples]上最后一点肉色消失。它们变成了玛瑙般的黑色！");
            get_player().createStatusEffect(StatusEffects.BlackNipples,0,0,0,0);
            set_changes(get_changes() + 1);
         }
         if(get_player().hasPlainSkin() && !get_player().hasSpiderEyes() && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你突然出现了非常奇怪的复视；你跌跌撞撞地眨着眼睛，捂住脸，但当你戳到自己的眼睛时，你把手缩了回来。等等，那些手指是在你的额头上！你试探性地用指尖划过额头，不太相信自己感觉到的东西。<b>现在你的额头上有一双眼睛，就在你正常的眼睛上方！</b>这需要一些时间来适应！");
            dynStats(DynStat.Inte(5));
            get_player().eyes.setType(7);
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type == 0 && get_player().hasPlainSkin() && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的上牙龈，就在犬齿上方，开始积聚张力。你张开嘴，戳了戳那个部位，手指被变尖的牙齿刺痛了。当你触摸它时，它向下滑动，拉长成针状的毒牙。你检查了另一侧，证实了你的怀疑。<b>你现在有了一对尖尖的蜘蛛毒牙，还带有毒液！</b>");
            get_player().face.type = 10;
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 2 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]");
            if(get_player().arms.type == 1)
            {
               outputText("覆盖你手臂的羽毛脱落了，让它们恢复了更像人类的外观。");
            }
            outputText("你着迷地看着你的前臂逐渐变得闪亮。你手臂的整个外部结构在分裂成几段时感到刺痛，<b>将[skinfurscales]变成了闪亮的黑色甲壳</b>。你触摸着玛瑙般的外骨骼，高兴地发现你仍然能像自己的皮肤一样自然地感觉到它。");
            get_player().arms.setType(2);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.type != 16 && get_player().lowerBody.type != 15)
         {
            get_mutations().restoreLegs(_loc1_);
         }
         if(type == 1 && !get_player().hasPerk(PerkLib.SpiderOvipositor) && get_player().isDrider() && get_player().tail.type == 5 && get_changes() < get_changeLimit() && Utils.rand(3) == 0 && (get_player().hasVagina() || Utils.rand(2) == 0))
         {
            outputText("[pg]一种奇怪的肿胀感淹没了你的蜘蛛半身。你把腹部卷到身下以便看得更清楚，当你认出你的新“装备”时，你倒吸了一口凉气！你与沼泽居民的半暴力冲突让你对这个新附肢<i>非常</i>熟悉。<b>这是一个蛛化精灵的产卵管！</b>轻轻戳了几下，证实它和你其他的性器官一样敏感。你漫不经心地想，用这东西产卵会是什么感觉……");
            outputText("[pg](<b>获得特质：蜘蛛产卵管 - 允许你在敌人体内产卵！</b>)");
            get_player().createPerk(PerkLib.SpiderOvipositor,0,0,0,0);
            set_changes(get_changes() + 1);
         }
         if((type == 1 && get_player().lowerBody.type != 16 && get_player().lowerBody.type != 15 || type != 1 && get_player().lowerBody.type != 15) && (!get_player().isGoo() && !get_player().hasTailInsteadOfLegs() && !get_player().isTaur()) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]从你的[feet]开始，一阵刺痛感顺着你的[legs]向上蔓延，直到大腿才停下。腰部以下的力量完全消失，让你重重地一[ass]跌坐在泥土中。无计可施的你低头看去，却被眼前的景象迷住了：黑色的外骨骼正顺着你那看起来完全像人类的小腿向上攀爬。它越过你的膝盖，用一层多面体的缟玛瑙涂层包裹住关节。然后，它继续缓慢向上爬行，直到用闪闪发光的午夜般黑色的外骨骼包裹住你的大腿才停下。从远处看，它几乎就像一双黑色的及大腿高的长靴，但你知道真相。<b>你现在拥有了覆盖着黑色蛛形怪物外骨骼的类人双腿。</b>");
            get_player().lowerBody.type = 15;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 5 && (get_player().lowerBody.type == 15 || get_player().lowerBody.type == 16) && get_player().arms.type == 2 && Utils.rand(4) == 0)
         {
            outputText("[pg]");
            if(get_player().tail.type > 0)
            {
               outputText("你的尾巴随着热流的涌动而颤抖，剧烈地抽搐着，直到感觉几乎像着火了一样。你因为" + get_player().buttDescript() + "传来的疼痛而跳了起来，并用手抓住了它。它很大……你能感觉到它在你的触摸下变硬，变得紧实，直到整条尾巴变得坚如磐石，呈球形。热量消退，留下一种温和的暖意，你意识到你的尾巴变成了一个蜘蛛的腹部！通过一次试探性的收缩，你甚至发现它可以从一些吐丝器中射出蛛丝，既有粘性的也有非粘性的。这可能会很有用。<b>你现在有一个蜘蛛的腹部悬挂在你的[ass]上方！</b>[pg]");
            }
            else
            {
               outputText("一阵剧痛击中了你" + get_player().buttDescript() + "上方的位置，伴随着灼热和压迫感。你能感觉到你的[skinfurscales]被撕裂，似乎有什么东西正强行从你体内钻出。你向后伸手，用手抓住了它。它很大……你能感觉到它在你的触摸下变硬，变得紧实，直到整个突出物变得坚如磐石，呈球形。热量消退，留下一种温和的暖意，你意识到你现在拥有了一个蜘蛛的腹部！通过一次试探性的收缩，你甚至发现它可以从一些吐丝器中射出蛛丝，既有粘性的也有非粘性的。这可能会很有用。<b>你现在有一个蜘蛛的腹部悬挂在你的[ass]上方！</b>");
            }
            get_player().tail.type = 5;
            get_player().tail.venom = 5;
            get_player().tail.recharge = 5;
            set_changes(get_changes() + 1);
         }
         if(type == 1 && get_player().lowerBody.type == 15 && Utils.rand(4) == 0 && get_player().tail.type == 5)
         {
            outputText("[pg]就像你的腿变成蜘蛛人那样，你发现自己腰部以下突然瘫痪了。你那深色反光的双腿向外张开，让你平躺在地上。还没等你坐起来，你就感觉到微小的痛感混合着温暖和刺痛在腿上蔓延。一想到可能正在摧残你身体的所有可怕变化，你就感到恐惧，你慢慢坐起来，以为自己腰部以下会变成某种无法理解的怪物。仿佛是为了证实你的怀疑，你首先看到的是你的腿已经变成了八条细长的腿。它们不再直接与你的臀部相连，而是连接在原本应该是腿部起点的地方长出的蜘蛛般的身体上。你的腹部也变得更大了。一旦力量回到你那全新的、八条腿的下半身，你挣扎着站到你那尖尖的“脚”上，摇摇晃晃地试图保持平衡。当你在适应新形态时，你发现你甚至能够将身体的蜘蛛部分向下扭转到双腿之间，模仿你以前的双足站立姿势。如果你想进行“正常”的性交姿势，这可能会很有用，特别是因为你的[ass]仍然位于你蛛形怪物下半身起点的正上方。<b>你现在是一个蛛化精灵了。</b>");
            get_player().lowerBody.type = 16;
            get_player().lowerBody.legCount = 8;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_changes() == 0)
         {
            outputText("[pg]甜美的蛛丝让你充满活力，感觉神清气爽。");
            get_player().changeFatigue(-33);
         }
         get_player().refillHunger(5);
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

