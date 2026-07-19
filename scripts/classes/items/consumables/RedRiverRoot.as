package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Butt;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class RedRiverRoot extends Consumable
   {
      
      public function RedRiverRoot()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("RdRRoot","River Root","a red river root",14,"A long, oddly shaped root. It smells spicy, but is surprisingly tasty. Eating this might alter your body.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Butt;
         var _loc4_:* = null as BreastRow;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as String;
         var _loc1_:String = "RedRiverRoot";
         get_player().slimeFeed();
         get_mutations().initTransformation([2,2,4]);
         outputText("在面包店买了那个看起来很奇怪的根茎后，你试着吃了一口，却只尝到了这种变形物微辣的味道。不过，它的味道和口感都很丰富，但很快这就不重要了，因为你意识到这种外来的根茎正在改变你的身体！");
         if(get_player().get_spe() < get_player().ngPlus(100) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]经过一阵短暂的眩晕后，你恢复了站姿，发现你的肌肉变得更加敏捷，随时准备奔跑。");
            if(get_player().get_spe() < get_player().ngPlus(50))
            {
               dynStats(DynStat.Spe(1));
            }
            if(get_player().get_spe() < get_player().ngPlus(75))
            {
               dynStats(DynStat.Spe(1));
            }
            dynStats(DynStat.Spe(1));
         }
         if(get_player().averageNipplesPerBreast() > 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵寒意掠过你的[allBreasts]，然后消失了。你把手伸进[armor]下面，发现你多余的乳头不见了！你现在每个[if (biggestTitSize < 1) {\'胸部\'|胸部}]只剩下一个乳头了。");
            set_changes(get_changes() + 1);
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc2_].nipplesPerBreast = 1;
               _loc2_++;
            }
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_player().butt.rating > 5 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            set_changes(get_changes() + 1);
            _loc3_ = get_player().butt;
            --_loc3_.rating;
            outputText("[pg]你的[butt]开始感到一阵紧绷，并逐渐加剧。这种感觉越来越强烈，随着它的变化，你的重心也发生了偏移。你向后伸手摸了摸自己，果然，你的[butt]正在缩小到一个更容易控制的尺寸。");
         }
         if(get_player().isFemaleOrHerm())
         {
            if(get_player().biggestTitSize() > 4 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               _loc2_ = 0;
               while(_loc2_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc2_].breastRating > 4)
                  {
                     var _temp_1:* = get_player().breastRows[_loc2_];
                     _temp_1.breastRating = _temp_1.breastRating - (1 + Utils.rand(3));
                  }
                  _loc2_++;
               }
               outputText("[pg]你的乳房感到紧绷[if (hasArmor) {，你胸前的[armor]感觉变松了}]。你震惊地看着你的乳房肉迅速减少，缩回你的胸腔。当它们达到[breastcup]大小时，它们终于停止了。你感觉轻盈了一些。");
               dynStats(DynStat.Spe(1));
               set_changes(get_changes() + 1);
            }
            if(get_player().smallestTitSize() < 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               _loc2_ = 0;
               while(_loc2_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc2_].breastRating < 2)
                  {
                     var _temp_2:* = get_player().breastRows[_loc2_];
                     _temp_2.breastRating = _temp_2.breastRating + 1;
                  }
                  _loc2_++;
               }
               outputText("[pg]你的乳房在衣服下感到紧绷和疼痛，因为它们每时每刻都在变大，最后在达到[breastcup]大小时停止。你揉了揉柔软的球体，以适应你更大的乳房肉。");
               dynStats(DynStat.Lib(1));
               set_changes(get_changes() + 1);
            }
            if(get_player().hips.rating > 12 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，因为你骨盆里的骨头痛苦地重新排列。你的臀部变窄了。");
               var _temp_3:* = get_player().hips;
               _temp_3.rating = _temp_3.rating - (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().hips.rating < 6 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，因为你感觉到臀部的骨头在摩擦，明显地扩大了你的臀部。");
               var _temp_4:* = get_player().hips;
               _temp_4.rating = _temp_4.rating + (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().nippleLength > 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]伴随着一阵突然的刺痛，你的[nipples]变得越来越小，当它们大约是之前大小的一半时停止了");
               var _temp_5:* = get_player();
               _temp_5.nippleLength = _temp_5.nippleLength / 2;
            }
            if(get_player().hasVagina() && get_player().vaginas[0].vaginalWetness < 3 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
            {
               outputText("[pg]你的[cunt]内壁感到一阵奇怪的紧绷感，然后转变为一种漫长的拉伸感，就像你是用油灰做的一样。你试探性地将几根手指滑入其中，发现自己变得更松弛、更柔软，准备好迎接那些怪物肉棒了。");
               var _temp_6:* = get_player().vaginas[0];
               _temp_6.vaginalWetness = _temp_6.vaginalWetness + 1;
               set_changes(get_changes() + 1);
            }
            if(get_player().tone < 65 && Utils.rand(3) == 0)
            {
               outputText(get_player().modTone(65,2));
            }
            if(get_player().thickness > 35 && Utils.rand(3) == 0)
            {
               outputText(get_player().modThickness(35,5));
            }
         }
         if(get_player().isMale())
         {
            if(get_player().biggestTitSize() > 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               _loc2_ = 0;
               while(_loc2_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc2_].breastRating > 2)
                  {
                     _loc4_ = get_player().breastRows[_loc2_];
                     --_loc4_.breastRating;
                  }
                  _loc2_++;
               }
               outputText("[pg]你的乳房感到紧绷[if (hasArmor) {，你胸前的[armor]感觉变松了}]。你震惊地看着你的乳房肉迅速减少，缩回你的胸腔。当它们达到[breastcup]大小时，它们终于停止了。你感觉轻盈了一些。");
               dynStats(DynStat.Spe(1));
               set_changes(get_changes() + 1);
            }
            if(get_player().nippleLength > 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]伴随着一阵突然的刺痛，你的[nipples]变得越来越小，当它们大约是之前大小的一半时停止了");
               var _temp_7:* = get_player();
               _temp_7.nippleLength = _temp_7.nippleLength / 2;
            }
            if(get_player().hips.rating > 10 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，因为你骨盆里的骨头痛苦地重新排列。你的臀部变窄了。");
               var _temp_8:* = get_player().hips;
               _temp_8.rating = _temp_8.rating - (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().hips.rating < 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，因为你感觉到臀部的骨头在摩擦，明显地扩大了你的臀部。");
               var _temp_9:* = get_player().hips;
               _temp_9.rating = _temp_9.rating + (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().tone < 70 && Utils.rand(3) == 0)
            {
               outputText(get_player().modTone(65,2));
            }
            if(get_player().thickness > 35 && Utils.rand(3) == 0)
            {
               outputText(get_player().modThickness(35,5));
            }
         }
         if(get_player().isMaleOrHerm())
         {
            if(get_player().hasCock() && get_player().cocks[0].get_cockType() != CockTypesEnum.RED_PANDA && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               outputText("[pg]你阴茎周围的皮肤折叠起来，将其包裹并变成一个保护性的包皮。<b>你现在有一根小熊猫肉棒了！</b>");
               get_player().cocks[0].set_cockType(CockTypesEnum.RED_PANDA);
               set_changes(get_changes() + 1);
            }
            if(get_player().shortestCockLength() < 6 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               _loc5_ = get_player().increaseCock(get_player().shortestCockIndex(),1 + Utils.rand(2));
               outputText("你的[if (cocks > 1) {最短的}]肉棒充血到正常大小，但并没有就此停止。你的肉棒感觉异常紧绷，似乎有几英寸的长度从你的胯部涌出。你的肉棒长了 " + _loc5_ + " 英寸。");
               set_changes(get_changes() + 1);
            }
            if(get_player().biggestCockLength() > 16 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               _loc6_ = get_player().biggestCockIndex();
               outputText("[pg]你感到腹股沟一阵紧绷，就像有人从你身后拉扯你的肉棒一样。一旦这种感觉消退，你检查了[if (hasLowerGarment) {你的[lowergarment]里面|你的[multicock]}]，发现你的[if (cocks > 1) {最大的}][cock]缩小到了稍微短一点的长度。");
               var _temp_10:* = get_player().cocks[_loc6_];
               _temp_10.cockLength = _temp_10.cockLength - (Utils.rand(10) + 5) / 10;
               if(get_player().cocks[_loc6_].cockThickness > 3)
               {
                  outputText("你的 " + get_player().cockDescript(_loc6_) + " 肯定也变细了一点。");
                  var _temp_11:* = get_player().cocks[_loc6_];
                  _temp_11.cockThickness = _temp_11.cockThickness - (Utils.rand(4) + 1) / 10;
               }
               set_changes(get_changes() + 1);
            }
            if(get_player().smallestCockArea() < 10 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               outputText("[if (cocks > 1) {你的一根肉棒|你的肉棒}]感觉肿胀沉重。轻轻地捏了一下，你证实了你的怀疑。它肯定变粗了。");
               get_player().cocks[get_player().thinnestCockIndex()].thickenCock(1.5);
               set_changes(get_changes() + 1);
            }
         }
         if(int(get_player().cocks.length) > 1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_player().removeCock(1,1);
            outputText("[pg]当你的胯部刺痛时，你有一种奇怪的感觉。解开你的[armor]，<b>你意识到你的一根肉棒完全消失了！</b>");
            set_changes(get_changes() + 1);
         }
         if((get_player().balls > 0 || get_player().hasStatusEffect(StatusEffects.Uniball)) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ballSize > 2)
            {
               if(get_player().ballSize > 5)
               {
                  var _temp_12:* = get_player();
                  _temp_12.ballSize = _temp_12.ballSize - (1 + Utils.rand(3));
               }
               var _temp_13:* = get_player();
               _temp_13.ballSize = _temp_13.ballSize - 1;
               outputText("[pg]你的阴囊慢慢缩小，稳定在一个较小的尺寸。<b>你的[balls]");
               if(get_player().balls == 1 || get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  outputText("现在变小了。</b>");
               }
               else
               {
                  outputText("现在变小了。</b>");
               }
               set_changes(get_changes() + 1);
            }
            else if(get_player().balls > 2)
            {
               get_player().balls = 2;
               if(get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  get_player().removeStatusEffect(StatusEffects.Uniball);
               }
               outputText("[pg]你的阴囊慢慢缩小，直到它们似乎达到了正常大小。<b>你能感觉到多余的睾丸融合在了一起，只留下了一对睾丸。</b>");
               set_changes(get_changes() + 1);
            }
            else if(get_player().balls == 1 || get_player().hasStatusEffect(StatusEffects.Uniball))
            {
               get_player().balls = 2;
               if(get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  get_player().removeStatusEffect(StatusEffects.Uniball);
               }
               outputText("[pg]你的阴囊慢慢缩小，你感到腹股沟的巨大压力得到了释放。<b>你的单睾丸分裂开了，留下了一对睾丸。</b>");
               set_changes(get_changes() + 1);
            }
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_player().ears.type != 22 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg][if (bakeryTalkedRoot) {之前警告过的眩晕感|一阵突如其来的眩晕感}]似乎占据了你的大脑。你的耳朵发麻，你确信能感觉到上面的血肉在变移，因为你渐渐听不清声音了。几分钟后，这种感觉停止了。出于对变化的好奇，你走到溪边检查自己，却发现它们变成了可爱的三角形耳朵，上面覆盖着白色的绒毛。<b>你长出了小熊猫的耳朵！</b>");
            get_player().ears.type = 22;
            set_changes(get_changes() + 1);
         }
         if(get_player().hasNonCockatriceAntennae() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]随着根茎发挥作用，你头顶的那对触角开始失去“感知”周围环境的能力。很快它们就缩回了你的头上，几秒钟后，看起来就像它们从未存在过一样。");
            get_player().antennae.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().eyes.count > 2 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你暂时失去了视力，呆在原地以防绊倒受伤。谢天谢地，你的视力很快就恢复了，只是感觉有些……不同。检查完自己的面容后，你注意到<b>你现在拥有了一双正常的人类眼睛！</b>");
            get_player().eyes.restore();
            set_changes(get_changes() + 1);
         }
         var _loc7_:Boolean = ColorLists.RED_PANDA_HAIR.indexOf(get_player().hair.color) != -1;
         var _loc8_:Boolean = get_player().hair.type == 0;
         _loc6_ = get_player().hair.type;
         if((!_loc8_ || get_player().hair.length == 0 || !_loc7_) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_player().hair.type = 0;
            if(!_loc7_)
            {
               _loc9_ = ColorLists.RED_PANDA_HAIR;
               _loc10_ = _loc9_[Utils.rand(int(_loc9_.length))];
               get_player().hair.color = _loc10_;
            }
            if(get_player().hair.length == 0)
            {
               get_player().hair.length = 1;
               outputText("[pg]熟悉的头发触感回到了你的头上。在溪边照了照自己后，你确认你曾经光秃秃的脑袋现在长出了正常的、短短的[hairColor]头发。");
            }
            else if(_loc8_ && !_loc7_)
            {
               outputText("[pg]头皮上轻微的刺痛感让你去溪边检查自己。看来这次根茎改变了你的头发，把它变成了[hair]。");
            }
            else
            {
               switch(_loc6_)
               {
                  case 1:
                     outputText("[pg]在它们的味道消退后不久，根茎似乎起作用了。你的头皮发痒，当你抓挠时，你看到你羽毛状的头发开始脱落，绒毛从你的头上掉下来，直到你变成光头。你对这种突然的变化感到惊恐，赶紧去附近的河里检查自己，当新的[hairColor]头发开始快速生长时，你很快松了一口气。<b>你现在有了[hair]</b>！");
                     break;
                  case 3:
                     get_player().hair.length = 1;
                     outputText("[pg]吃下根茎后，一缕黏糊糊的头发掉在了你的额头上。当你试图检查它时，那团黏液掉在地上蒸发了。当你歪着头看发生了什么事时，越来越多的黏液块开始从你的头上掉下来，以同样的速度在地上消失。很快，你的头皮上就没有任何黏液了，尽管完全秃了。");
                     outputText("[pg]似乎没过多久，片刻之后，熟悉的头发触感又回到了你的头上。在溪边照了照自己后，你确认<b>你曾经光秃秃的脑袋现在长出了正常的、短短的[hairColor]头发</b>。");
                     break;
                  default:
                     outputText("[pg]头皮上轻微的刺痛感让你去溪边检查自己。看来这次根茎改变了你的头发，<b>把它变成了[hair]</b>。");
               }
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().face.type != 27 && get_player().ears.type == 22 && get_player().hasFur() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的颧骨和下巴变得麻木，而你头部的其余部分则被一种刺痛感所淹没。你脸上的每一块肌肉都在紧绷和变移，骨骼和组织在重新排列，彻底改变了你头部的形状。当变化蔓延到你的鼻子时，你呼吸困难，但你设法看到它变成了一个动物的口鼻。你的下巴也加入了变化，牙齿变得有点尖锐，虽然不到真正具有威胁性的程度，但毫无疑问地呈现出属于小型食肉动物的形状。");
            outputText("[pg]一旦你的脸和下巴重塑完成，毛发就覆盖了你的整个头部。柔软的触感非常令人愉快。它呈赤褐色，在你的口鼻和脸颊处变成白色。小而圆的白色斑块覆盖了你眉毛所在的位置。<b>你现在有了一个小熊猫的脑袋！</b>");
            get_player().face.type = 27;
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 8 && get_player().ears.type == 22 && get_player().tail.type == 30 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的手臂感到无力，无论你怎么做，都无法鼓起力气抬起或移动它们。你叹了口气，把这归咎于吃了那种奇怪的根茎。你坐在地上，等待着这种无力感结束。在这个过程中，你意识到你手上的骨头正在发生变化，手臂上的肌肉也是如此。很快，从肩膀到指尖，它们就被一层柔软蓬松的黑褐色毛发覆盖了。你的手掌变成了粉红色的肉垫，指甲变成了短爪，虽然不够锋利，无法撕裂血肉，但足够灵活，让攀爬和探索变得容易得多。<b>你的手臂变得像小熊猫一样了！</b>");
            get_player().arms.setType(8,10);
         }
         if(get_player().lowerBody.type != 29 && get_player().arms.type == 8 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().isTaur())
            {
               outputText("[pg]你的双腿颤抖着，迫使你躺在地上，因为它们似乎不再听你的使唤了。在短暂昏迷之前，你最后记得的是腿上有一种灼热感。当这种感觉消退，你终于醒来时，你再次看向它们，却发现你只剩下了一对趾行的腿，以及一个更像人类的背面。很快，你重塑的腿恢复了知觉，随之而来的是一种瘙痒感。一层厚厚的黑褐色毛发从上面长了出来。摸起来柔软蓬松。可爱的粉红色肉垫完成了转变。看来<b>你获得了一对小熊猫的爪子！</b>");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]尾巴上一种奇怪的感觉让你不得不躺在地上。然后，这种感觉变得更加强烈，你感到盘绕的中间部位越来越痛。你盯着它们看了一秒钟，才意识到它们正在分裂！几秒钟内，它们就重塑成了一对更传统的腿，奇特之处在于它们的形状完全是趾行的。很快，上面的鳞片全部脱落，留下了柔软的[skin]。但这并没有持续多久，因为很快一层厚厚的黑褐色毛发就覆盖了它们。摸起来柔软蓬松。可爱的粉红色肉垫完成了转变。看来<b>你获得了一对小熊猫的爪子！</b>");
            }
            else if(get_player().isGoo())
            {
               outputText("[pg]构成你下半身的黏液在根茎的作用下突然变得僵硬，迫使你保持静止，直到转变结束。令人惊讶的是，曾经的黏液在短短几秒钟内就变成了血肉和皮肤，从而给你留下了一对非常像人类的腿和脚。");
               outputText("[pg]变化并没有就此停止，一种不适感迫使你坐在附近的一块石头上，你感觉到你新恢复的脚内有什么东西正在改变。麻木感笼罩了它们，肌肉和骨骼发生变化，轻柔地变移、融合和重新排列。有一瞬间，你觉得它们又变成了黏液，但几分钟后，它们给你留下了一对趾行的腿，带有粉红色的肉垫，末端是黑色的短爪，覆盖着一层厚厚的黑褐色毛发。感觉非常柔软蓬松。<b>你获得了一对小熊猫的爪子！</b>");
            }
            else
            {
               outputText("[pg]一种不适感迫使你坐在附近的一块石头上，你感觉到你的[feet]内有什么东西正在改变。麻木感笼罩了它们，肌肉和骨骼发生变化，轻柔地变移、融合和重新排列。几分钟后，它们给你留下了一对趾行的腿，带有粉红色的肉垫，末端是黑色的短爪，覆盖着一层厚厚的黑褐色毛发。感觉非常柔软蓬松。<b>你获得了一对小熊猫的爪子！</b>");
            }
            get_player().lowerBody.type = 29;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 30 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().hasMultiTails())
            {
               outputText("[pg]你的尾巴似乎在自己移动，纠缠成一团。在你感觉到它发生之前，你意识到它们正在融合！一种强烈的热感，就像根茎的味道一样，冲刷着你的身体，当它消退后，你意识到你现在只有一条尾巴了。");
               outputText("[pg]然而，变化并未就此停止。那种辛辣根茎的灼热感再次袭来，但这次只集中在你的尾巴上。尾巴疯狂地颤抖着，同时变得更长、更蓬松。很快，它就变得几乎和你一样长了。短短几秒钟内，一层非常厚实、柔软且蓬松的毛发覆盖了它，并呈现出红褐色与铜橙色相间的可爱环状花纹。");
               outputText("[pg]当效果最终消退时，你决定测试一下这条尾巴。你让它盘绕在身体上，很快发现自己能轻松控制它的动作，而且毛发摸起来手感极佳。不管怎样，<b>你现在拥有了一条长长、蓬松的小熊猫尾巴！</b>");
            }
            else if(get_player().tail.type == 0)
            {
               outputText("[pg]感觉到屁股上有一种不舒服的感觉，你伸展了一下身体，把它归咎于坐在粗糙的表面上。一种灼热的感觉流遍你的全身，类似于你吃下树根后的那种感觉。当它转移到你的背部时，你的注意力转移到从你背部爆发出来的一团绒毛上。在你能够正确检查它之前，它似乎在自己移动，跟随着现在在你体内跳动的灼热感，当灼热的脉动似乎停止时，它已经变成了一根长长的、毛茸茸的管子");
               outputText("[pg]没过多久，那种辛辣根茎的灼热感再次袭来，但这次只集中在你的尾巴上。尾巴疯狂地颤抖着，同时变得更长、更蓬松。很快，它就变得几乎和你一样长了。短短几秒钟内，一层非常厚实、柔软且蓬松的毛发覆盖了它，并呈现出红褐色与铜橙色相间的可爱环状花纹。");
               outputText("[pg]当效果最终消退时，你决定测试一下这条尾巴。你让它盘绕在身体上，很快发现自己能轻松控制它的动作，而且毛发摸起来手感极佳。不管怎样，<b>你现在拥有了一条长长、蓬松的小熊猫尾巴！</b>");
            }
            else if([6,5].indexOf(get_player().tail.type) != -1)
            {
               outputText("[pg]你那昆虫般的后部似乎受到了根茎特性的影响，毒液的分泌突然停止了。腹部内的血肉缩回了你的后部，覆盖的几丁质脱落，露出一层柔软、裸露的皮肤。当腹部消失时，你留下了一个滑稽的大屁股，但很快就恢复了正常大小。");
               outputText("[pg]根茎继续发挥着作用，你感到屁股上一阵不舒服。一股灼热感流遍全身，就像你吃下那根茎后感觉到的那样。当这股热流转移到你的背部时，你的注意力被一团从你背后冒出的绒毛吸引了。还没等你仔细查看，它似乎就自己动了起来，跟随着现在在你体内跳动的灼热感。当灼热的脉动似乎停止时，它已经变成了一根长长的、毛茸茸的管子，与你之前的腹部截然不同。");
               outputText("[pg]没过多久，那种辛辣根茎的灼热感再次袭来，但这次只集中在你的尾巴上。尾巴疯狂地颤抖着，同时变得更长、更蓬松。很快，它就变得几乎和你一样长了。短短几秒钟内，一层非常厚实、柔软且蓬松的毛发覆盖了它，并呈现出红褐色与铜橙色相间的可爱环状花纹。");
               outputText("[pg]当效果最终消退时，你决定测试一下这条尾巴。你让它盘绕在身体上，很快发现自己能轻松控制它的动作，而且毛发摸起来手感极佳。不管怎样，<b>你现在拥有了一条长长、蓬松的小熊猫尾巴！</b>");
            }
            else
            {
               outputText("[pg]那种辛辣根茎的灼热感再次袭来，但这次只集中在你的尾巴上。尾巴疯狂地颤抖着，同时变得更长、更蓬松。很快，它就变得几乎和你一样长了。短短几秒钟内，一层非常厚实、柔软且蓬松的毛发覆盖了它，并呈现出红褐色与铜橙色相间的可爱环状花纹。");
               outputText("[pg]当效果最终消退时，你决定测试一下这条尾巴。你让它盘绕在身体上，很快发现自己能轻松控制它的动作，而且毛发摸起来手感极佳。不管怎样，<b>你现在拥有了一条长长、蓬松的小熊猫尾巴！</b>");
            }
            get_player().tail.restore();
            get_player().tail.type = 30;
            set_changes(get_changes() + 1);
         }
         if(get_player().skin.type == 1 && get_player().underBody.type != 3 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]看来，这根茎改变了你的毛色。<b>你现在从头到脚都覆盖着红褐色的毛发，腹部则是黑色的！</b>");
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.furColor = "赤褐色的";
            get_player().underBody.type = 3;
            get_player().copySkinToUnderBody({"furColor":"黑色的"});
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().skin.type != 1 && get_player().arms.type == 8 && get_player().lowerBody.type == 29 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().hasPlainSkin())
            {
               if(["乳胶","橡胶"].indexOf(get_player().skin.adj) == -1)
               {
                  outputText("[pg]你开始抓挠你的[skin]，因为一阵令人不适的瘙痒感席卷了你。这非常烦人，就像被虫子咬了之后的余波，只不过是全身同时发作。");
               }
               else
               {
                  outputText("[pg]你平时油腻且有弹性的皮肤突然感觉有点干燥。你以为可能是废土干燥的天气所致，于是跑到溪边，在清凉的水中清洗皮肤。");
                  outputText("[pg]这产生了与你预期相反的效果，你看着一层[skinTone]色的黏稠橡胶从你的手臂上脱落。很快，你手臂上所有的橡胶都融化脱落了，留下了一层健康、正常的皮肤。这个过程在你身体的其他部位继续进行，还没等你反应过来，你的身体就被一层全新的[skinTone]皮肤覆盖了，那种奇怪的感觉也随之消退。");
                  outputText("[pg]然而好景不长，一阵令人不适的瘙痒感席卷了你。这非常烦人，就像被虫子咬了之后的余波，只不过是全身同时发作。");
               }
            }
            if(get_player().hasScales())
            {
               outputText("[pg]覆盖你身体的鳞片层感觉有些奇怪，看起来几乎像是在自己移动，这时你才意识到它们正在发生变化！");
               outputText("[pg]这种感觉非常奇特，它们与你皮肤连接的地方有点痒，随着转变的进行，这种瘙痒感迅速变得更加强烈。接着，一堆[skinTone]的鳞片从你的手臂上脱落。很快，你手臂上所有的鳞片都掉光了，留下了一层健康、正常的皮肤。这个过程在你身体的其他部位继续进行，没过多久，你就被一层[skinTone]的皮肤覆盖了。");
               outputText("[pg]然而好景不长，一阵令人不适的瘙痒感席卷了你。这非常烦人，就像被虫子咬了之后的余波，只不过是全身同时发作。");
            }
            if(get_player().hasGooSkin())
            {
               outputText("[pg]你平时湿润黏稠的皮肤突然感觉有点干燥。你以为可能是废土干燥的天气所致，于是跑到溪边，在清凉的水中清洗皮肤。");
               outputText("[pg]这产生了与你预期相反的效果，你眼睁睁地看着一层[skinTone]颜色的粘液从你的手臂上脱落。你惊慌失措地试图把它放回去，但无济于事。很快，你手臂上的粘液全部滑落，留下一层健康的、正常的皮肤。这个过程在你身体的其余部分继续进行，还没等你反应过来，你的身体就被一层全新的[skinTone]皮肤覆盖了，随着你的核心从现在完全固体的身体中排出，那种奇怪的感觉也消失了。");
               outputText("[pg]但这并没有持续多久，因为一种令人不舒服的瘙痒感席卷了你。这很烦人，就像被虫子咬了之后的后遗症，只不过是同时发生在你全身。");
            }
            outputText("[pg]很快你就意识到这种感觉来自你的皮肤底下。你烦躁地揉了揉一只手臂，感觉有些不同，当你把目光投向它时，你发现你的皮肤上长出了一块毛发。然后你在你的腿、胸部和背部发现了类似的斑块。毛发在你的身体上生长，斑块连接并覆盖在你的皮肤上，在几秒钟内，你的整个身体就被一层可爱的厚毛覆盖了。柔软蓬松的感觉摸起来很舒服。");
            outputText("\n<b>看来你现在从头到脚都覆盖着赤褐色的皮毛，而你的下腹部则是黑色的皮毛！</b>");
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.furColor = "赤褐色的";
            get_player().underBody.type = 3;
            get_player().copySkinToUnderBody({"furColor":"黑色的"});
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            if(Utils.rand(100) == 0)
            {
               outputText("[pg]似乎没有发生其他事情。也许根失去了它的作用？");
            }
            else
            {
               outputText("[pg]尽管它很辣，但这种根仍然很有营养，你可以通过感觉你的身体现在变得更加精力充沛来证实这一点。\n");
               get_player().HPChange(250,true);
               dynStats(DynStat.Lust(3));
            }
         }
         get_player().refillHunger(20);
         var _loc11_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc11_,2077,FlagDict_Impl_.arrayReadInt(_loc11_,2077) + get_changes());
         return false;
      }
   }
}

