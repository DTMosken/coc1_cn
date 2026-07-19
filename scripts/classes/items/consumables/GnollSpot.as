package classes.items.consumables
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class GnollSpot extends Consumable
   {
      
      public function GnollSpot()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("GnollSpot","Gnoll Spot","a bag of Gnoll Spots",6,"A handful of dark chocolate drops. They have a spicy and slightly musky aroma that brings to mind a sunset on the savannah and passionate, wild rutting. These tiny treats seem to be a favourite of the gnolls of the plains.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Player;
         var _loc4_:* = null as WeightedChoice;
         var _loc5_:* = null as String;
         var _loc1_:String = "gnollSpot";
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,3,3]);
         outputText("你把巧克力豆塞进嘴里，对它浓郁的味道和顺滑的口感感到惊讶。你" + (get_player().gnollScore() > 3 ? "发出一阵咯咯的笑声，" : "") + "感觉到一股能量涌遍全身，伴随着伏击你的" + (get_player().gnollScore() > 3 ? "猎物的欲望。" : "敌人的欲望。"));
         if(changeRoll() && get_player().get_spe100() < 100)
         {
            outputText("[pg]你感觉自己变快了，准备好以猎人般的速度伏击你的下一个交配对象。");
            dynStats(DynStat.Spe(1));
         }
         if(changeRoll() && get_player().get_lib100() < 50)
         {
            outputText("[pg]你感到一阵欲望涌遍全身，让你想要把最近的伴侣按倒在地，像骑着顺从的母狗一样骑他们[if (ismale) {，或者更好的是，屈服于他们支配的意志}]。");
            dynStats(DynStat.Lib(2));
         }
         if(changeRoll() && (get_player().isFemaleOrHerm() && get_player().tone < 80 || get_player().isMale() && get_player().tone < 25))
         {
            outputText("[pg]你的肌肉燃烧发热，变得更加紧实，让你感觉自己更加健壮。");
            var _temp_1:* = get_player();
            _temp_1.tone = _temp_1.tone + 5;
         }
         if(changeRoll() && get_player().thickness < 25)
         {
            outputText("[pg]你感觉自己的身躯似乎多了一点摇晃的肉感。更加丰满的外表让你看起来更柔软了。");
            var _temp_2:* = get_player();
            _temp_2.thickness = _temp_2.thickness + 5;
         }
         if(Utils.randomChance(50))
         {
            outputText("[pg]你沉浸在巧克力略带辛辣的余味中，享受着它唤起的关于发情与繁衍的原始幻想。情欲涌遍全身，让你比之前更加兴奋。");
            dynStats(DynStat.Lust(15));
         }
         if(changeRoll() && get_player().butt.rating > 6 && get_player().isFemaleOrHerm())
         {
            outputText("[pg]你的[butt]似乎变得更小、更紧致了。希望它还能一样性感。");
            var _temp_3:* = get_player().butt;
            _temp_3.rating = _temp_3.rating - 2;
         }
         if(changeRoll() && get_player().butt.rating > 10 && get_player().isMale())
         {
            outputText("[pg]你的[butt]似乎变得更小、更紧致了。希望它看起来还能一样好。");
            var _temp_4:* = get_player().butt;
            _temp_4.rating = _temp_4.rating - 2;
         }
         if(changeRoll() && get_player().hips.rating > 8)
         {
            outputText("[pg]你的[hips]似乎稍微变窄了，你的步态也随之改变，直到你习惯了它们更纤细的尺寸。");
            var _temp_5:* = get_player().hips;
            _temp_5.rating = _temp_5.rating - 2;
         }
         if(changeRoll() && get_player().get_tallness() != 60)
         {
            if(get_player().get_tallness() > 60)
            {
               outputText("[pg]你呻吟着，感觉自己变矮了，你的身体向下压缩，直到地面比以前更近了一些。");
               _loc3_ = get_player();
               _loc3_.set_tallness(_loc3_.get_tallness() - 1);
            }
            else
            {
               outputText("[pg]你感到头晕和轻微的不适，但很快意识到这是由于身高突然增加造成的。");
               _loc3_ = get_player();
               _loc3_.set_tallness(_loc3_.get_tallness() + 1);
            }
         }
         if(changeRoll())
         {
            _loc4_ = new WeightedChoice().add("black",75).add("dusky brown",25);
            _loc5_ = _loc4_.choose();
            if(get_player().isGoo())
            {
               outputText("[pg]你感到一阵紧绷，仿佛有一层膜包裹住了你液态般的身体。当你看着你的[skin]时，你发现自己正在凝固！起初你变得更像一块宝石，身体坚硬而闪亮，随着你史莱姆外表鲜艳的颜色褪去，你甚至觉得难以动弹。没过多久，你又变得柔软而充满肉感，在作为结构如此灵活的史莱姆度过了一段时间后，这种感觉对你来说有些陌生。当你新的人类形态完成转变时，你注意到你的");
               if(ColorLists.GNOLL_SKIN.indexOf(get_player().skin.tone) == -1)
               {
                  outputText("皮肤颜色和以前不一样了。你现在拥有了" + _loc5_ + "的皮肤！");
                  get_player().skin.tone = _loc5_;
               }
               else
               {
                  outputText("身体构造和以前不一样了！");
               }
               outputText("[pg]你现在拥有了人类的双腿！");
               get_player().skin.restore();
               set_changes(get_changes() + 1);
            }
            else if(ColorLists.GNOLL_SKIN.indexOf(get_player().skin.tone) == -1)
            {
               outputText("[pg]你震惊地看着手臂上出现了一块" + _loc5_ + "的斑点，并且每秒都在变大。它成片地蔓延到你的全身，直到你原本[skintone]的皮肤变成统一的颜色。你的皮肤现在是" + _loc5_ + "的了！");
               get_player().skin.tone = _loc5_;
               set_changes(get_changes() + 1);
            }
         }
         if(changeRoll() && get_player().ears.type != 23)
         {
            if([4,0].indexOf(get_player().ears.type) == 1)
            {
               outputText("[pg]你脸颊两侧的皮肤痛苦地拉伸着，你的耳朵向上移动，移向你的头顶。");
            }
            else
            {
               outputText("[pg]你的耳朵突然感觉发热，仿佛正在改变形状。");
            }
            outputText("它们变移并拉长，然后稍微变圆。[if (hasfurryears) {它们的毛发变移，变得又黑又粗|黑色的毛发迅速覆盖了它们}]，当它们稳定下来时，你的新耳朵比以前更大、更敏感。你敢打赌，用这双耳朵你能听到几英里外的猎物！你现在有了豺狼人的耳朵！");
            get_player().ears.type = 23;
            set_changes(get_changes() + 1);
         }
         if(changeRoll() && get_player().tail.type != 31)
         {
            if(get_player().hasTail())
            {
               outputText("[pg]当你的尾巴改变形状时，你感到一种奇怪的感觉。当你伸手去摸它时，指尖传来了粗糙毛发的感觉。当你转头看去，你发现自己现在有了一条一英尺长的犬科尾巴，上面覆盖着粗糙的黄褐色毛发。沿着尾巴散布着[skintone]的斑点。你现在有了一条豺狼人的尾巴！");
            }
            else
            {
               outputText("[pg]你的背部感到一阵压力。你摸了摸[if (!isnakedlower) {衣服下面|你的[butt]上方}]，发现了一个奇怪的凸起，似乎正在变大。几秒钟内，它穿过你的手指，[if (!isnakedlower) {撑破了你衣服的后背，}]并长到了大约一英尺长。一层粗糙的斑点毛发长出来覆盖了你的新尾巴。你现在有了一条豺狼人尾巴！");
            }
            get_player().tail.type = 31;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type == 31 && get_player().ears.type == 23)
         {
            if(changeRoll() && get_player().lowerBody.type != 31)
            {
               outputText("[pg]当你感觉到腿部的骨头在断裂重组时，你发出了一声尖叫。当疼痛消退后，你低头一看，发现自己现在有了趾行的双脚，末端是长有肉垫的爪子，尖端带着锋利的黑色利爪。随着黄褐色的毛发迅速覆盖它们，从你的大腿往下也出现了[skintone]的斑点。你拥有了像豺狼人一样的双脚！");
               get_player().lowerBody.type = 31;
               set_changes(get_changes() + 1);
            }
            if(changeRoll() && get_player().arms.type != 15)
            {
               outputText("[pg]你心不在焉地抓着二头肌，但无论你怎么努力，都无法消除那种瘙痒感。在忽略了它好一会儿之后，你终于烦躁地低头看去，却发现你的手臂现在覆盖着斑点毛发！进一步检查后，你发现你的双手现在有了柔软的黑色肉垫和锋利的爪子。你现在拥有了像豺狼人一样的手臂！");
               get_player().arms.set_type(15);
               set_changes(get_changes() + 1);
            }
            if(get_player().arms.type == 15 && get_player().lowerBody.type == 31)
            {
               if(changeRoll() && get_player().face.type != 29)
               {
                  outputText("[pg]你的脸被疼痛折磨着。你仰起头痛苦地尖叫，你的颧骨断裂并移位，重塑成某种……不同的东西。你感觉到一个口鼻部成型，一个湿润的鼻子贴在你探索的双手上。当疼痛消退后，好奇心开始萌芽。你找了个水坑看自己的倒影……你的脸现在就像鬣狗一样，嘴唇上挂着永远的坏笑，而锋利的掠食者獠牙则提醒着别人你才是这里的首领。前提是你那火红的橙色眼睛还没让他们屈服的话。你现在有了一张豺狼人的脸！");
                  get_player().face.type = 29;
                  set_changes(get_changes() + 1);
               }
               if(changeRoll() && get_player().skin.type != 1 && get_player().face.type == 29)
               {
                  outputText("[pg]你的皮肤奇痒无比。你低头看去，越来越多的毛发从皮肤中钻出，很快就变成了一层短而蓬松的毛皮。[pg]你现在从头到脚都覆盖着一层粗糙的黄褐色毛皮。一层[skintone]斑点点缀着你的新毛皮。");
                  get_player().skin.type = 1;
                  get_player().skin.furColor = get_player().skin.tone;
                  set_changes(get_changes() + 1);
               }
            }
         }
         if(changeRoll(50) && get_player().hasGills())
         {
            outputText("[pg]你突然感到呼吸困难，脖子周围有种被捏住的感觉。当你大口喘气时，你意识到了原因。你的鳃已经闭合消失了，只留下了你的[skin]。");
            get_player().gills.type = 0;
            set_changes(get_changes() + 1);
         }
         if(changeRoll(50) && get_player().eyes.count > 2)
         {
            outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感似乎要把你的[feet]从你身下抽走。当你稳住自己并睁开眼睛时，你意识到有些不同。你的视力不知怎么改变了。你多余的眼睛不见了！");
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().isMale())
         {
            tfGrowGnollCock();
            tfCumChange();
            tfKnotGrow();
            tfCockSizeChange(3,8);
            if(changeRoll() && get_player().hasBalls() && get_player().ballSize > 1)
            {
               outputText("[pg]你感觉到你的[balls]周围有一种微妙的紧绷感。这种在你解剖学上最敏感部位的感觉并不痛苦，但你的蛋蛋变小的感觉非常强烈，以至于你很难抑制住自己，只能深吸一口气。");
               var _temp_6:* = get_player();
               _temp_6.ballSize = _temp_6.ballSize - 0.5;
               if(get_player().ballSize <= 1)
               {
                  outputText("[pg]你呜咽了一声，因为你的蛋蛋再次收紧缩小。当你感觉到睾丸的重量轻轻压在你的[thighs]上时，你睁大了眼睛，犹豫地摆动了几下屁股，你确认了你的感觉——你的蛋蛋收得太紧了，它们不再悬挂在你的[cock]下面，而是俏皮地向上挤压。伴随着耳边的嗡嗡作响，你用手小心翼翼地探索着你的新阴囊。你非常庆幸自己显然没有被阉割，但你发现，虽然你仍然有[ballcount]，但你的蛋蛋现在看起来和感觉起来就像一个：一个可爱、紧致的小伪娘包裹，它温暖、持续地向上压在你的大腿根部，无时无刻不在提醒着你它的存在。");
                  get_player().createStatusEffect(StatusEffects.Uniball);
               }
               set_changes(get_changes() + 1);
            }
            tfBreastChange("B","B");
            tfRemoveBreastRows();
            tfTurnNipplesBlack();
            tfCockRemoval();
         }
         else if(get_player().isFemale())
         {
            tfTurnVaginaBlack();
            tfTurnNipplesBlack();
            tfBreastChange("F","D");
            tfRemoveBreastRows();
            tfClitIncrease();
         }
         else if(get_player().isHerm())
         {
            tfTurnVaginaBlack();
            tfGrowGnollCock();
            tfCumChange();
            tfKnotGrow();
            tfCockSizeChange(12,15);
            tfBreastChange("E","D");
            tfRemoveBreastRows();
            tfTurnNipplesBlack();
            tfCockRemoval();
         }
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
      
      public function tfTurnVaginaBlack() : void
      {
         if(changeRoll() && get_player().vaginaType() != 5)
         {
            outputText("[pg]你的[pussy]感觉……很奇怪。你解开衣服，小心翼翼地检查你的下半身。你性器官娇嫩的粉红色已经消失了，取而代之的是从阴唇开始向内蔓延的光滑如大理石般的黑色。在小心翼翼地触摸了几次之后，你觉得感觉上并没有什么不同——不过看起来确实很奇怪。你的阴道现在变成了乌木色。");
            get_player().vaginaType(5);
            set_changes(get_changes() + 1);
         }
      }
      
      public function tfTurnNipplesBlack() : void
      {
         if(changeRoll() && !get_player().hasStatusEffect(StatusEffects.BlackNipples))
         {
            get_player().createStatusEffect(StatusEffects.BlackNipples);
            outputText("[pg]一种发痒的感觉拨弄着你的乳头，让你蜷缩起来，努力不让自己咯咯笑出声。低头看去，你刚好看到你[nipples]上最后一点肉色消失。它们变成了玛瑙般的黑色！");
            set_changes(get_changes() + 1);
         }
      }
      
      public function tfRemoveBreastRows() : void
      {
         if(changeRoll() && int(get_player().breastRows.length) > 1)
         {
            get_mutations().removeExtraBreastRow("tfSource");
         }
      }
      
      public function tfKnotGrow() : void
      {
         var _loc4_:* = null as Cock;
         if(Utils.randomChance(50))
         {
            return;
         }
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = get_player().cocks;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.knotMultiplier > 1 && _loc4_.knotMultiplier < 3)
            {
               _loc1_.push(_loc4_);
            }
         }
         if(int(_loc1_.length) <= 0)
         {
            return;
         }
         _loc3_ = _loc1_;
         _loc4_ = _loc3_[Utils.rand(int(_loc3_.length))];
         _loc2_ = get_player().cocks.indexOf(_loc4_) + 1;
         outputText("[pg]随着你的阴茎结变大，你的[cock " + _loc2_ + "]感觉异常紧绷" + (_loc4_.hasSheath() ? "在你的阴茎鞘里" : "") + "。");
         _loc4_.knotMultiplier = Math.min(3,_loc4_.knotMultiplier + 0.5);
         set_changes(get_changes() + 1);
      }
      
      public function tfGrowGnollCock() : void
      {
         var _loc1_:int = 0;
         if(changeRoll() && get_player().hasCockNotOfType(CockTypesEnum.GNOLL))
         {
            _loc1_ = get_player().findFirstCockNotOfType(CockTypesEnum.GNOLL);
            outputText("[pg]你的[cock " + (_loc1_ + 1) + "]痛苦地紧绷着，变得酸痛而悸动地勃起。");
            if(!get_player().cocks[_loc1_].hasSheath())
            {
               outputText("一种紧绷感似乎挤压着根部，当你看到你的皮肤和血肉向前移动，变成一个看起来像犬类的阴茎鞘时，你疼得皱起了眉头。");
            }
            outputText("当你的肉棒冠部重塑成尖端时，你浑身颤抖，这种感觉几乎让你无法承受。随着变形的完成，你仰起头，你那豺狼人形状的阴茎比以前粗壮得多。你现在拥有了一根黑色的、带有阴茎结的豺狼人肉棒。");
            get_player().cocks[_loc1_].set_cockType(CockTypesEnum.GNOLL);
            get_player().cocks[_loc1_].thickenCock(1.5);
            get_player().cocks[_loc1_].knotMultiplier = 1.5;
            set_changes(get_changes() + 1);
         }
      }
      
      public function tfCumChange() : void
      {
         if(changeRoll(50) && get_player().hasCock() && get_player().cumMultiplier < 10)
         {
            if(get_player().hasBalls())
            {
               outputText("[pg]你感觉到你的[balls]里一阵翻腾。它很快就平息了，让它们感觉更紧实了一些。一点乳白色的预精从你的[cock]滴落，这是被变化挤出来的。");
            }
            else
            {
               outputText("[pg]你感觉到你的肠胃里一阵翻腾。一点乳白色的预精从你的[cock]滴落，这是被你体内的变化挤出来的。");
            }
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 1;
            set_changes(get_changes() + 1);
         }
      }
      
      public function tfCockSizeChange(param1:int, param2:int) : void
      {
         if(int(get_player().cocks.length) != 1)
         {
            return;
         }
         if(changeRoll() && get_player().cocks[0].cockLength < param1)
         {
            outputText("[pg]你的[cock]突然变硬，在达到最大长度时滴下先列腺液。突然的勃起就像它到来时一样迅速消退，给你留下了一根略微光滑的阴茎，你[if (isNaked) {把它擦干净。|在把它放回你的[lowergarment]之前把它擦干净。}]现在你看着它，它似乎比以前大了一点。");
            get_player().increaseCock(0,1);
            set_changes(get_changes() + 1);
         }
         if(changeRoll() && get_player().cocks[0].cockLength > param2)
         {
            outputText("[pg]你痛得弯下腰[if (isNaked) {，扯下你的[lowergarment]}]，你感觉到你的[cock]发生了什么事。你的肉棒硬得发痛，你抓住它，带着一种狂热的冲动把自己弄到高潮。当你射出你的精液时，强有力的精液喷射在地上，你阴茎紧绷的感觉消退了。你小心翼翼地清理干净自己，很快意识到你的[cock]似乎变短了。");
            var _temp_1:* = get_player().cocks[0];
            _temp_1.cockLength = _temp_1.cockLength - 2;
            set_changes(get_changes() + 1);
         }
      }
      
      public function tfCockRemoval() : void
      {
         var _loc1_:int = 0;
         if(changeRoll() && int(get_player().cocks.length) > 1)
         {
            _loc1_ = get_player().smallestCockIndex();
            if(get_player().cocks[_loc1_].cockLength <= 4)
            {
               outputText("[pg]你痛得弯下腰[if (!isnakedlower) {，扯下你的[armor]}]，你感觉到你的[cock " + (_loc1_ + 1) + "]发生了什么变化。你握住你的肉棒，看着它变小，但无论你怎么试图让它停下来，变形都在继续。你的男子气概缩回了你的身体，完全消失了。你现在有 " + Utils.numberOfThings(int(get_player().cocks.length) - 1,"cock.","cocks."));
               get_player().removeCock(_loc1_,1);
            }
            else
            {
               var _temp_1:* = get_player().cocks[_loc1_];
               _temp_1.cockLength = _temp_1.cockLength - 2;
               outputText("[pg]你感到腹股沟一阵紧绷，就像有人从后面拉扯你的肉棒一样。当这种感觉消退后，你检查了[if (!isnakedlower) {一下你的[armor]里面|一下到底发生了什么]，发现你的[cock " + (_loc1_ + 1) + "]缩短了一点。");
            }
         }
      }
      
      public function tfClitIncrease() : void
      {
         if(changeRoll() && get_player().getClitLength() < 8)
         {
            get_player().changeClitLength(1);
            outputText("[pg]随着热流涌向你的腹股沟，你的心跳开始越来越快。你感觉到你的阴蒂从包皮下探出头来，随着充血越来越多，它变得越来越大、越来越长。最终它缩了回去，但似乎保留了一点体积。");
            set_changes(get_changes() + 1);
         }
      }
      
      public function tfBreastChange(param1:String, param2:String) : void
      {
         var _loc3_:int = 0;
         if(changeRoll())
         {
            _loc3_ = get_player().biggestTitRow();
            if(get_player().biggestTitSize() > Appearance.breastCupInverse(param1))
            {
               var _temp_1:* = get_player().breastRows[_loc3_];
               _temp_1.breastRating = _temp_1.breastRating - 1;
               outputText("[pg]你的乳房感觉很紧，[if (!isnakedupper) {你的[armor]似乎在你的上半身周围变松了。|就好像你的[skin]在紧紧地挤压它们。}]你震惊地看着你的乳房肉迅速减少，缩进你的胸部。当它们达到 " + Appearance.breastCup(get_player().breastRows[_loc3_].breastRating) + " 罩杯大小时，它终于停止了。你感觉轻了一点。");
               set_changes(get_changes() + 1);
            }
            else if(get_player().biggestTitSize() != Appearance.breastCupInverse(param2))
            {
               var _temp_2:* = get_player().breastRows[_loc3_];
               _temp_2.breastRating = _temp_2.breastRating + 1;
               outputText("[pg]你的乳房感到柔软，在变大的过程中充满了柔软的热量，当它们达到" + Appearance.breastCup(get_player().breastRows[_loc3_].breastRating) + "罩杯大小时终于停止了生长。你揉捏着敏感的双球，逐渐适应了现在更大更重的胸部。");
               set_changes(get_changes() + 1);
            }
         }
      }
      
      public function changeRoll(param1:Number = 33.333) : Boolean
      {
         if(get_changes() < get_changeLimit())
         {
            return Utils.randomChance(param1);
         }
         return false;
      }
   }
}

