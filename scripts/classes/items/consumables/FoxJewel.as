package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class FoxJewel extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var MYSTIC:int = 1;
      
      public var mystic:Boolean;
      
      public function FoxJewel(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         mystic = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         mystic = param1 == 1;
         switch(param1)
         {
            case 0:
               _loc2_ = "FoxJewl";
               _loc3_ = "Fox Jewel";
               _loc4_ = "a fox jewel";
               _loc5_ = "一颗闪闪发光的泪滴状宝珠。表面下跳动着诡异的蓝色火焰。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "MystJwl";
               _loc3_ = "Mystic Jewel";
               _loc4_ = "a mystic jewel";
               _loc5_ = "这颗宝珠内的火焰比以前更亮了，并且呈现出一种邪恶的紫色。它被强化了，效力大增，能让你更容易变形，但也可能会有一些奇怪的副作用……";
               _loc6_ = 20;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Hips;
         var _loc4_:* = null as Hips;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:* = null as Array;
         var _loc8_:* = null as String;
         var _loc1_:String = "foxJewel";
         if(mystic)
         {
            _loc1_ += "-mystic";
         }
         var _loc2_:int = mystic ? 3 : 1;
         get_mutations().initTransformation([2,2,3],_loc2_);
         if(mystic)
         {
            outputText("你稍微检查了一下这颗宝石，在手中把玩着，思索着它的奥秘。你带着着迷的好奇心将它举向光线，注视着里面跳动的诡异紫火。毫无预兆地，宝石从中间裂开，在你的手中化为乌有。当淡紫色的火焰在你周围盘旋时，空气中弥漫着一种甜腻的气味，其中夹杂着甘草的苦涩香气，让你感到一种不祥的温暖。");
         }
         else
         {
            outputText("你稍微检查了一下这颗宝石，在手中把玩着，思索着它的奥秘。你带着着迷的好奇心将它举向光线，注视着里面跳动的诡异蓝火。毫无预兆地，宝石从中间裂开，在你的手中化为乌有。当淡蓝色的火焰在你周围盘旋时，空气中弥漫着一种甜美的气味，其中夹杂着冬青的香气，让你的脊背发凉。");
         }
         if(get_player().get_inte100() < 100 && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(4) == 0))
         {
            outputText("[pg]你闭上眼睛，狡黠地暗自坏笑，因为你突然想到了几个可以在对手身上尝试的新把戏；你感觉自己变得更加狡猾了。脑海中浮现出他们在你的聪明才智面前无助的画面，这让你微微颤抖，你舔了舔嘴唇，抚摸着自己，感觉到皮肤因不由自主的兴奋而微微发麻。");
            dynStats(DynStat.Inte(2),DynStat.Lib(1),DynStat.Sens(2),DynStat.Lust(10));
         }
         if(get_player().get_str100() > 15 && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0))
         {
            outputText("[pg]你能感觉到你的肌肉在慢慢放松时变得柔软，比以前稍微虚弱了一些。当你能用诡计和恶作剧智取敌人时，谁还需要体力呢？你微微歪了歪头，想知道这个想法是从哪里来的。");
            dynStats(DynStat.Str(-1));
            if(get_player().get_str100() > 70)
            {
               dynStats(DynStat.Str(-1));
            }
            if(get_player().get_str100() > 50)
            {
               dynStats(DynStat.Str(-1));
            }
            if(get_player().get_str100() > 30)
            {
               dynStats(DynStat.Str(-1));
            }
         }
         if(get_player().get_tou100() > 20 && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0))
         {
            if(get_player().get_tou100() <= 66)
            {
               outputText("[pg]你感觉到你的" + get_player().skinFurScales() + "变得明显柔软了。在手臂上轻轻捏了一下证实了这一点——你的[skinfurscales]无法为你提供太多保护。");
            }
            else
            {
               outputText("[pg]你感觉你的[skinfurscales]变得明显柔软了。在手臂上轻轻捏了一下，证实了这一点——你的皮肤不再像以前那么坚韧了。");
            }
            dynStats(DynStat.Tou(-1));
            if(get_player().get_tou100() > 66)
            {
               dynStats(DynStat.Tou(-1));
            }
         }
         if(mystic && get_changes() < get_changeLimit() && Utils.rand(2) == 0 && get_player().cor < 100)
         {
            if(get_player().cor < 33)
            {
               outputText("[pg]一种肮脏的感觉涌上心头，就好像这颗宝石的魔法正在对你做一些变态的不轨之事。");
            }
            else if(get_player().cor < 66)
            {
               outputText("[pg]一阵刺痛感传遍全身，但你不知道到底发生了什么变化。肯定不是什么重要的事情。");
            }
            else
            {
               outputText("[pg]恶作剧的念头在你的意识中翻滚，不受良心或对他人的关心的束缚。你真该找点乐子——谁在乎会伤害到谁呢，对吧？");
            }
            dynStats(DynStat.Cor(1));
         }
         if((mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(4) == 0) && get_changes() < get_changeLimit() && get_player().get_femininity() != 50)
         {
            outputText(get_player().modFem(50,2));
            set_changes(get_changes() + 1);
         }
         if(get_player().tone >= 40 && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(4) == 0))
         {
            outputText("[pg]动起来时，你感觉到身体比平时多了一点晃动。你似乎没有变胖，但肌肉变得不那么明显了，身体的各个部位也变得更加柔软宜人。");
            var _temp_1:* = get_player();
            _temp_1.tone = _temp_1.tone - (2 + Utils.rand(3));
            set_changes(get_changes() + 1);
         }
         if(get_player().hips.rating < 10 && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0) && get_changes() < get_changeLimit())
         {
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + 1;
            if(get_player().hips.rating < 7)
            {
               var _temp_3:* = get_player().hips;
               _temp_3.rating = _temp_3.rating + 1;
            }
            if(get_player().hips.rating < 4)
            {
               var _temp_4:* = get_player().hips;
               _temp_4.rating = _temp_4.rating + 1;
            }
            outputText("[pg]随着骨盆的骨骼痛苦地重新排列，你踉跄了一下。你的臀部变宽了，曲线变得更加优美！");
            set_changes(get_changes() + 1);
         }
         if(get_player().hips.rating > 10 && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0) && get_changes() < get_changeLimit())
         {
            _loc3_ = get_player().hips;
            --_loc3_.rating;
            if(get_player().hips.rating > 14)
            {
               _loc4_ = get_player().hips;
               --_loc4_.rating;
            }
            if(get_player().hips.rating > 19)
            {
               _loc4_ = get_player().hips;
               --_loc4_.rating;
            }
            if(get_player().hips.rating > 24)
            {
               _loc4_ = get_player().hips;
               --_loc4_.rating;
            }
            outputText("[pg]随着骨盆的骨骼痛苦地重新排列，你踉跄了一下。你的臀部变窄了。");
            set_changes(get_changes() + 1);
         }
         if((get_player().hair.length < 16 || get_player().hair.length > 26) && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0) && get_changes() < get_changeLimit())
         {
            if(get_player().hair.length < 16)
            {
               var _temp_5:* = get_player().hair;
               _temp_5.length = _temp_5.length + (3 + Utils.rand(3));
               outputText("[pg]你的头皮感到一阵刺痛。你觉得有点失去平衡，随后发现你的头发变长了，变成了[hair]。");
            }
            else
            {
               var _temp_6:* = get_player().hair;
               _temp_6.length = _temp_6.length - (3 + Utils.rand(3));
               outputText("[pg]你的头皮感到一阵刺痛。你觉得有点失去平衡，随后发现你的头发变短了一些，变成了[hair]。");
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().hasVagina() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0) && get_player().statusEffectv1(StatusEffects.BonusVCapacity) < 200 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的腹部发出一阵咕噜声，随着一阵颤抖的涟漪穿过你的子宫，你弯下了腰。你的胃部肌肉翻滚着，内脏开始移动，当这种感觉终于过去时，你本能地意识到你的" + get_player().vaginaDescript(0) + "比以前更深了一点。");
            if(!get_player().hasStatusEffect(StatusEffects.BonusVCapacity))
            {
               get_player().createStatusEffect(StatusEffects.BonusVCapacity,0,0,0,0);
            }
            get_player().addStatusValue(StatusEffects.BonusVCapacity,1,10 + Utils.rand(10));
            set_changes(get_changes() + 1);
         }
         else if((mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0) && get_player().statusEffectv1(StatusEffects.BonusACapacity) < 150 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉……不知怎么的，自己变得更能包容了。你的[asshole]有点刺痛，虽然它似乎没有变松，但变得更有弹性了。");
            if(!get_player().hasStatusEffect(StatusEffects.BonusACapacity))
            {
               get_player().createStatusEffect(StatusEffects.BonusACapacity,0,0,0,0);
            }
            get_player().addStatusValue(StatusEffects.BonusACapacity,1,10 + Utils.rand(10));
            set_changes(get_changes() + 1);
         }
         else if(get_player().hasVagina() && (mystic || !mystic && Utils.rand(5) == 0) && get_player().statusEffectv1(StatusEffects.BonusVCapacity) >= 200 && get_player().statusEffectv1(StatusEffects.BonusVCapacity) < 8000 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你用双手捂住肚子，痛苦地倒在地上，你的内脏开始在体内剧烈地扭曲和移动。当你痛苦地紧闭双眼时，你突然感到一阵平静。腹部的疼痛消退了，你感觉自己与宇宙深不可测的无限融为一体，温暖从你子宫内包含的广阔旋转的宇宙中辐射到你全身。");
            if(get_silly())
            {
               outputText("<b>你的阴道已经变成了一个独立的宇宙，能够容纳超出人类理解范围的巨大插入物！</b>");
            }
            else
            {
               outputText("<b>你的阴道现在能够容纳甚至是最荒谬尺寸的插入物，而不会产生任何不良影响。</b>");
            }
            get_player().changeStatusValue(StatusEffects.BonusVCapacity,1,8000);
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
         if(get_player().tail.type != 13 && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(4) == 0))
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你的后背下方感到一阵压力。你摸了摸[armor]下面，发现那里长出了一个奇怪的结节，而且似乎每秒都在变大。伴随着一阵突然的动作，它猛地长成了一条毛茸茸的长尾巴，像是有自己的意识一样，带着催眠般的节奏摇摆着。<b>你现在有了一条狐狸尾巴。</b>");
            }
            else if(get_player().tail.type != 13)
            {
               outputText("[pg]当你的尾巴剧烈地扭动和抽搐时，一阵刺痛穿透了你的下背部。伴随着最后一次异常的抽搐，它蓬松成了一条毛茸茸的狐狸长尾，以一种几乎令人催眠的方式甩动着。<b>你现在有了一条狐狸尾巴。</b>");
            }
            get_player().tail.type = 13;
            get_player().tail.venom = 1;
            set_changes(get_changes() + 1);
         }
         if(!mystic && get_player().ears.type == 9 && get_player().tail.type == 13 && get_player().tail.venom == 8 && Utils.rand(3) == 0)
         {
            outputText("[pg]你有一种感觉，如果你能长出第九条尾巴，你会变得强大得多，但你需要找到一种方法来强化这些宝石中的一颗，或者带着它冥想，才有机会解锁你的全部潜能。");
         }
         else if(get_player().tail.type == 13 && get_player().tail.venom < 8 && get_player().tail.venom + 1 <= get_player().level && get_player().tail.venom + 1 <= get_player().get_inte() / 10 && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0))
         {
            if(get_player().tail.venom == 1)
            {
               outputText("[pg]你的后背下方积聚起一阵刺痛的压力，你毛茸茸的尾巴开始发出诡异幽灵般的光芒。伴随着电能的噼啪声，你的尾巴一分为二！<b>你现在有了一对狐狸尾巴。</b>");
            }
            else
            {
               outputText("[pg]你的后背下方积聚起一阵刺痛的压力，你毛茸茸的尾巴开始发出诡异幽灵般的光芒。伴随着电能的噼啪声，你的一条尾巴一分为二，让你拥有了" + Utils.num2Text(get_player().tail.venom + 1) + "条尾巴！<b>你现在有了一簇共" + Utils.num2Text(get_player().tail.venom + 1) + "条狐狸尾巴。</b>");
            }
            var _temp_7:* = get_player().tail;
            _temp_7.venom = _temp_7.venom + 1;
            set_changes(get_changes() + 1);
         }
         else if(mystic && Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().tail.type == 13 && get_player().tail.venom == 8 && get_player().level >= 9 && get_player().ears.type == 9 && get_player().get_inte() >= 90 && (!get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().perkv4(PerkLib.CorruptedNinetails) > 0) && (!get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().perkv4(PerkLib.EnlightenedNinetails) > 0))
         {
            outputText("[pg]你毛茸茸的尾巴开始闪烁着诡异的幽光，伴随着一阵电光噼啪作响，分裂成了九条尾巴。<b>你现在是九尾了！但有些不对劲……从你体内散发出的宇宙力量感觉……不知为何被污染了。从你身上倾泻而出的腐化气息感觉……很舒服。</b>");
            outputText("[pg]你产生了一种莫名其妙的冲动，想要放火烧掉这个世界，只为了看着它燃烧。凭借你新获得的力量，这个目标触手可及。");
            outputText("[pg](获得特质：腐化九尾 - 赋予两次魔法特殊攻击。)");
            get_player().createPerkIfNotHasPerk(PerkLib.CorruptedNinetails,0,0,0,0);
            dynStats(DynStat.Lib(2),DynStat.Lust(10),DynStat.Cor(10));
            get_player().tail.venom = 9;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type == 13 && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(4) == 0) && get_player().ears.type != 9 && get_changes() < get_changeLimit())
         {
            if(get_player().ears.type == 0)
            {
               outputText("[pg]你脸颊两侧痛苦地拉伸，你的耳朵开始变形，并向上移动，越过发际线，来到头顶。它们变长了，变成了覆盖着浓密毛发的大型狐狸三角形耳朵。你现在有狐狸耳朵了。");
            }
            else
            {
               outputText("[pg]你的耳朵改变了形状，从现在的形状变成了狐狸的形状。你现在有狐狸耳朵了。");
            }
            get_player().ears.type = 9;
            set_changes(get_changes() + 1);
         }
         if((mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(4) == 0) && get_changes() < get_changeLimit() && (!Boolean(ColorLists.BASIC_KITSUNE_HAIR.contains(get_player().hair.color)) || get_player().tail.venom == 9) && !Boolean(ColorLists.ELDER_KITSUNE.contains(get_player().hair.color)))
         {
            if(get_player().isNineTails())
            {
               _loc5_ = ColorLists.ELDER_KITSUNE;
               _loc6_ = _loc5_[Utils.rand(int(_loc5_.length))];
               get_player().hair.color = _loc6_;
            }
            else
            {
               _loc5_ = ColorLists.BASIC_KITSUNE_HAIR;
               _loc6_ = _loc5_[Utils.rand(int(_loc5_.length))];
               get_player().hair.color = _loc6_;
            }
            outputText("[pg]你的头皮开始发麻，你轻轻抓起一缕头发，拉到面前查看。你的头发变成了和狐妖一样的[haircolor]！");
            set_changes(get_changes() + 1);
         }
         _loc5_ = mystic ? ColorLists.KITSUNE_SKIN_MYSTIC : ColorLists.KITSUNE_SKIN;
         _loc6_ = get_player().skin.furColor;
         if(get_player().hasFur() && get_player().underBody.type == 3 && get_player().skin.furColor != get_player().underBody.skin.furColor)
         {
            _loc6_ = get_player().skin.furColor + " and " + get_player().underBody.skin.furColor;
         }
         if(get_player().hasFur() && get_player().face.type != 11 && !Boolean(ColorLists.BASIC_KITSUNE_OUTER_FUR.contains(_loc6_)) && !Boolean(ColorLists.ELDER_KITSUNE.contains(_loc6_)) && !Boolean(["orange and white","black and white","red and white","tan","brown"].contains(_loc6_)) || get_player().hasScales() && (mystic || !mystic && Utils.rand(2) == 0))
         {
            outputText("[pg]你全身的[skin]开始发麻，一开始是一种凉爽舒适的感觉，但渐渐变得越来越糟，直到你全身都奇痒无比。");
            if(get_player().hasFur())
            {
               outputText("当你把手指抽开，发现手里抓着一把[furcolor]的毛发时，你惊恐地瞪大了眼睛！你的毛发大把大把地从身上脱落，露出下面大片光秃秃的[skintone]皮肤。");
            }
            else if(get_player().hasScales())
            {
               outputText("你惊恐地盯着自己的手，发现手指上抓着一把干瘪的鳞片！你的鳞片继续大片大片地剥落，露出下面娇嫩的[skintone]皮肤。");
            }
            outputText("在你剧烈的抓挠下，你的皮肤慢慢变得红肿破皮，刺痛感让你全身起鸡皮疙瘩。随着时间的推移，瘙痒感逐渐消退，你发红的皮肤恢复成看起来很自然的");
            get_player().skin.type = 0;
            get_player().skin.adj = "";
            get_player().skin.desc = "skin";
            get_player().underBody.restore();
            if(!Boolean(_loc5_.contains(get_player().skin.tone)))
            {
               _loc7_ = _loc5_;
               _loc8_ = _loc7_[Utils.rand(int(_loc7_.length))];
               get_player().skin.tone = _loc8_;
            }
            outputText("[skintone]肤色。");
            outputText("<b>你现在拥有[skin]！</b>");
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         else if(!_loc5_.contains(get_player().skin.tone) && get_changes() < get_changeLimit() && (mystic && Utils.rand(2) == 0 || !mystic && Utils.rand(3) == 0))
         {
            outputText("[pg]你感觉到皮肤表面有一种爬行的感觉，从你的后腰开始，蔓延到你的四肢，最后到达你的脸。把手臂举到面前，你发现<b>你现在有了");
            _loc7_ = _loc5_;
            _loc8_ = _loc7_[Utils.rand(int(_loc7_.length))];
            get_player().skin.tone = _loc8_;
            outputText("[skin]！</b>");
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(!get_player().hasFur() && get_player().hasStatusEffect(StatusEffects.BlackNipples) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().removeBlackNipples(_loc1_);
         }
         if(!get_player().hasFur() && get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().vaginaType() == 5 && get_player().hasVagina())
         {
            outputText("[pg]有什么看不见的东西拂过你的下体，让你感到一阵刺痛。解开衣服，你看了看你的阴道，发现它已经恢复了自然的肉色。");
            get_player().vaginaType(0);
            set_changes(get_changes() + 1);
         }
         if(get_player().hasPlainSkin() && Utils.rand(4) == 0)
         {
            get_mutations().restoreArms(_loc1_);
         }
         if(get_player().hasPlainSkin() && Utils.rand(4) == 0)
         {
            get_mutations().restoreLegs(_loc1_);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]奇怪。你没觉得有什么不同。");
         }
         var _loc9_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc9_,2077,FlagDict_Impl_.arrayReadInt(_loc9_,2077) + get_changes());
         return false;
      }
   }
}

