package classes.items.consumables
{
   import classes.Appearance;
   import classes.Ass;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
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
   
   public class MinotaurBlood extends Consumable
   {
      
      public function MinotaurBlood()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("MinoBlo","Mino Blood","a vial of minotaur blood",6,"A scratched-up looking vial full of bright red minotaur blood. Any time you move it around it seems to froth up, as if eager to escape.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc5_:* = null as Vagina;
         var _loc6_:Number = NaN;
         var _loc7_:* = null as BreastRow;
         var _loc8_:* = null as BreastRow;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null as Player;
         var _loc12_:* = null as Ass;
         var _loc13_:* = null as Ass;
         var _loc1_:String = "minotaurBlood";
         get_player().slimeFeed();
         get_mutations().initTransformation([2,3,3],1,2);
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         outputText("你喝下了冒泡的红色液体，尝到了刺鼻的铁锈余味。");
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_str100() <= 50)
            {
               outputText("[pg]痛苦的酸痛感在你的身体里荡漾，当你的肌肉弯曲和膨胀时，你被痛苦淹没，变得更加强壮和轮廓分明。");
               if(get_player().get_str100() <= 20)
               {
                  dynStats(DynStat.Str(3));
               }
               else
               {
                  dynStats(DynStat.Str(2));
               }
            }
            else
            {
               if(get_player().get_str100() >= 75)
               {
                  dynStats(DynStat.Str(0.5));
               }
               else
               {
                  dynStats(DynStat.Str(1));
               }
               outputText("[pg]你的肌肉变得更紧实了，强有力地向外凸起，因为你变得更强壮了！");
            }
            if(Utils.rand(2) == 0 && get_player().get_str100() > 50)
            {
               outputText("[pg]你开始感觉到你的肌肉大小开始让你慢下来了。");
               dynStats(DynStat.Spe(-1));
            }
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_tou100() <= 50)
            {
               outputText("[pg]你的兽皮……皮肤……不管是什么……你能感觉到它在明显变厚的同时变得更坚韧了。");
               if(get_player().get_tou100() <= 20)
               {
                  dynStats(DynStat.Tou(3));
               }
               else
               {
                  dynStats(DynStat.Tou(2));
               }
            }
            else
            {
               if(get_player().get_tou100() >= 75)
               {
                  dynStats(DynStat.Tou(0.5));
               }
               else
               {
                  dynStats(DynStat.Tou(1));
               }
               outputText("[pg]你坚韧的兽皮变得稍微厚了一些。");
            }
            if(Utils.rand(2) == 0 && get_player().get_sens100() > 10)
            {
               if(get_player().get_tou100() > 75)
               {
                  outputText("[pg]透过你皮革般的皮肤，你变得更难感觉到任何东西了。");
                  dynStats(DynStat.Sens(-3));
               }
               if(get_player().get_tou100() <= 75 && get_player().get_tou100() > 50)
               {
                  outputText("[pg]你皮肤的触觉水平明显下降了。");
                  dynStats(DynStat.Sens(-2));
               }
               if(get_player().get_tou100() <= 50)
               {
                  outputText("[pg]由于你更坚韧的兽皮，你的触觉减弱了。");
                  dynStats(DynStat.Sens(-3));
               }
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && get_player().ballSize <= 5 && get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
         {
            if(get_player().balls == 0)
            {
               get_player().balls = 2;
               get_player().ballSize = 1;
               outputText("[pg]一种令人作呕的压力在你的男性器官根部下方形成。伴随着极度的痛苦，那里的血肉膨胀并凸起，推出一个圆形的肉块，你认出那是一个睾丸！片刻之后，当第二个睾丸落入你新形成的阴囊时，解脱感淹没了你。");
               dynStats(DynStat.Lib(2),DynStat.Lust(5));
            }
            else
            {
               var _temp_1:* = get_player();
               _temp_1.ballSize = _temp_1.ballSize + 1;
               if(get_player().ballSize <= 2)
               {
                  outputText("[pg]一阵温暖闪过你的身体，你的腹股沟突然变得沉重起来。你停下来检查这些变化，你游移的手指发现你的" + get_player().simpleBallsDescript() + "长得比人类的还要大。");
               }
               if(get_player().ballSize > 2)
               {
                  outputText("[pg]一阵突如其来的热量包围了你的腹股沟，集中在你的[sack]上。当你发现你的" + get_player().simpleBallsDescript() + "再次变大时，走路变得困难起来。");
               }
               dynStats(DynStat.Lib(1),DynStat.Lust(3));
            }
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
         if(Utils.rand(4) == 0)
         {
            get_mutations().restoreArms(_loc1_);
         }
         if(get_player().lowerBody.type != 1)
         {
            if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               if(get_player().lowerBody.type == 0)
               {
                  outputText("[pg]当你的脚发生变化时，你摇摇晃晃地卷曲成痛苦愤怒的肉块。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
               }
               else if(get_player().lowerBody.type == 2)
               {
                  outputText("[pg]当你的爪子发生变化时，你摇摇晃晃地卷曲成痛苦愤怒的肉块。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
               }
               else if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("[pg]当你的蜿蜒的[if (isNaga) {蛇}]尾巴撕裂成两半，变成腿时，你崩溃了。疼痛是巨大的，特别是当你新长出的脚向内卷曲并变成蹄子时！");
               }
               else if(get_player().lowerBody.type > 3)
               {
                  outputText("[pg]当你的[feet]发生变化时，你摇摇晃晃地卷曲成痛苦愤怒的肉块。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
               }
               else if(!get_player().hasFur())
               {
                  outputText("一层细细的绒毛从你的腰部以下长出来，在它长满时短暂地发痒。");
               }
               outputText("<b> 你现在用蹄子代替了你的脚！</b>");
               get_player().lowerBody.type = 1;
               get_player().lowerBody.legCount = 2;
               dynStats(DynStat.Spe(1));
               set_changes(get_changes() + 1);
            }
         }
         if(!get_hyper())
         {
            if(int(get_player().vaginas.length) > 0)
            {
               if(get_player().vaginas[0].vaginalLooseness > 0)
               {
                  outputText("[pg]你的" + get_player().vaginaDescript(0) + "痛苦地收缩着，变得更小、更紧。");
                  _loc5_ = get_player().vaginas[0];
                  --_loc5_.vaginalLooseness;
               }
               else
               {
                  outputText("[pg]腹股沟处的一阵紧绷感是你得到的唯一警告，随后你的<b>" + get_player().vaginaDescript(0) + "永远消失了</b>！");
                  if(int(get_player().cocks.length) == 0)
                  {
                     outputText("奇怪的是，你的阴蒂似乎抵挡住了这种变化，并且正在迅速变大……变成了一根带有螺纹的、类似牛头人的小阴茎！<b>你现在拥有了一根马鸡巴！</b>");
                     get_player().createCock();
                     _loc6_ = get_player().getClitLength();
                     get_player().cocks[0].cockLength = _loc6_ + 2;
                     get_player().cocks[0].cockThickness = 1;
                     get_player().cocks[0].set_cockType(CockTypesEnum.HORSE);
                     get_player().setClitLength(0.25);
                  }
                  get_player().removeVagina(0,1);
               }
               set_changes(get_changes() + 1);
            }
            if(get_changes() < get_changeLimit() && get_player().bRows() > 1 && Utils.rand(3) == 0)
            {
               get_mutations().removeExtraBreastRow(_loc1_);
            }
            else if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 0)
            {
               if(int(get_player().breastRows.length) == 1)
               {
                  if(get_player().breastRows[0].breastRating >= 1)
                  {
                     _loc2_ = 1;
                     _loc7_ = get_player().breastRows[0];
                     --_loc7_.breastRating;
                     if(get_player().breastRows[0].breastRating > 8)
                     {
                        _loc2_++;
                        _loc8_ = get_player().breastRows[0];
                        --_loc8_.breastRating;
                     }
                     if(_loc2_ == 1)
                     {
                        outputText("[pg]你感觉身上的重担减轻了，并意识到你的[breasts]已经缩小到了[breastcup]罩杯。");
                     }
                     if(_loc2_ == 2)
                     {
                        outputText("[pg]你感觉轻盈了许多。低头一看，你发现你的乳房小了非常多，降到了[breastcup]罩杯。");
                     }
                     set_changes(get_changes() + 1);
                  }
               }
               else
               {
                  _loc2_ = 0;
                  _loc3_ = 0;
                  _loc4_ = 0;
                  if(get_player().biggestTitSize() >= 1)
                  {
                     outputText("\n");
                  }
                  while(_loc4_ < int(get_player().breastRows.length))
                  {
                     if(get_player().breastRows[_loc4_].breastRating >= 1)
                     {
                        _loc7_ = get_player().breastRows[_loc4_];
                        --_loc7_.breastRating;
                        _loc3_++;
                        outputText("\n");
                        if(_loc3_ > 1)
                        {
                           outputText("……而且你");
                        }
                        else
                        {
                           outputText("你");
                        }
                        outputText("的" + get_player().breastDescript(_loc4_) + "缩小了，降到了" + get_player().breastCup(_loc4_) + "罩杯。");
                     }
                     _loc4_++;
                  }
                  if(_loc3_ == 2)
                  {
                     outputText("\n变化之后，你感觉轻盈了许多。");
                  }
                  if(_loc3_ == 3)
                  {
                     outputText("\n没有了额外的重量，你感觉格外灵活。");
                  }
                  if(_loc3_ >= 4)
                  {
                     outputText("\n感觉就像是卸下了肩上的重担，或者在这个情况下，是胸前的重担。");
                  }
                  if(_loc3_ > 0)
                  {
                     set_changes(get_changes() + 1);
                  }
               }
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && int(get_player().cocks.length) > 0)
         {
            _loc9_ = -1;
            _loc10_ = 0;
            while(_loc10_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc10_].get_cockType() == CockTypesEnum.HORSE && (get_player().cocks[_loc10_].cockLength < 36 || get_player().cocks[_loc10_].cockThickness < 5))
               {
                  _loc9_ = _loc10_;
                  break;
               }
               _loc10_++;
            }
            if(_loc9_ != -1)
            {
               if(get_player().cocks[_loc9_].cockThickness < 5)
               {
                  _loc2_ = get_player().increaseCock(_loc9_,2 + Utils.rand(8));
                  _loc2_ += get_player().cocks[_loc9_].thickenCock(1);
                  if(_loc2_ > 6)
                  {
                     outputText("[pg]你在突如其来的快感中喘息着，你的" + get_player().cockDescript(_loc9_) + "从包皮中挣脱出来，长出了半英尺多的新肉。");
                  }
                  if(_loc2_ <= 6 && _loc2_ >= 3)
                  {
                     outputText("[pg]你高兴地喘息着，几英寸长的" + get_player().cockDescript(_loc9_) + "从你的包皮中弹了出来，粗壮的新马肉依然光滑敏感。");
                  }
                  if(_loc2_ < 3)
                  {
                     outputText("[pg]你轻声呻吟着，感觉到腹股沟处发生了令人愉悦的变化。低头一看，你看到[oneCock]稍微变长了一些。");
                  }
                  outputText("让你又惊又喜的是，你发现它也稍微变粗了一些！");
               }
               else
               {
                  _loc2_ = get_player().increaseCock(_loc9_,2 + Utils.rand(8));
                  if(_loc2_ > 6)
                  {
                     outputText("[pg]你在突如其来的快感中喘息着，你的" + get_player().cockDescript(_loc9_) + "从包皮中挣脱出来，长出了半英尺多的新肉。");
                  }
                  if(_loc2_ <= 6 && _loc2_ >= 3)
                  {
                     outputText("[pg]你高兴地喘息着，几英寸长的" + get_player().cockDescript(_loc9_) + "从你的包皮中弹了出来，粗壮的新马肉依然光滑敏感。");
                  }
                  if(_loc2_ < 3)
                  {
                     outputText("[pg]你轻声呻吟着，感觉到腹股沟处发生了令人愉悦的变化。低头一看，你看到[oneCock]稍微变长了一些。");
                  }
               }
               set_changes(get_changes() + 1);
            }
         }
         if(int(get_player().cocks.length) > 0 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            _loc9_ = -1;
            _loc10_ = 0;
            while(_loc10_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc10_].get_cockType() != CockTypesEnum.HORSE)
               {
                  _loc9_ = _loc10_;
                  break;
               }
               _loc10_++;
            }
            if(_loc9_ != -1)
            {
               if(get_player().cocks[_loc9_].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[_loc9_].get_cockType().get_Index() > 2)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc9_) + "开始感觉有些奇怪……你拉下裤子查看，发现它颜色变深了，根部传来一阵紧绷感，皮肤似乎在那里聚拢。一个包皮开始在你的阴茎根部形成，收紧并将你的阴茎拉入深处。一股热流包裹住你的肉棒，它突然长成了一根马屌，让它原来的尺寸相形见绌。皮肤呈棕黑斑驳的颜色，感觉比平时更敏感。你的手不由自主地伸向它，你开始自慰，用力地喷射出精液。");
               }
               if(get_player().cocks[_loc9_].get_cockType() == CockTypesEnum.DOG)
               {
                  outputText("[pg]你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "开始感觉有些奇怪……你拉下衣服查看，发现它颜色变深了。你感觉到" + Appearance.cockNoun(CockTypesEnum.DOG) + "的顶端越来越紧，因为它变平了，向外张开。你的阴茎从包皮中推出，一寸又一寸的兽肉生长得超出了它传统的尺寸。你注意到你的肉结消失了，多余的肉将更多新鲜的马屌从你的包皮中推出。<b>你的手不由自主地伸向这根奇怪的新" + Appearance.cockNoun(CockTypesEnum.HORSE) + "</b>，你开始自慰，用力地喷射出浓稠的精液。");
               }
               get_player().cocks[_loc9_].set_cockType(CockTypesEnum.HORSE);
               get_player().increaseCock(_loc9_,4);
               dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
               outputText("<b>你现在有了一根");
               if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 1)
               {
                  outputText("额外的");
               }
               outputText("马屌。</b>");
               set_changes(get_changes() + 1);
            }
         }
         if(Utils.rand(4) == 0)
         {
            get_player().goIntoRut(true);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && !get_player().hasStatusEffect(StatusEffects.Dysfunction))
         {
            if(int(get_player().cocks.length) > 0)
            {
               outputText("[pg]你的[cock]突然一阵刺痛，然后停止了。你担心地伸手去检查，却发现它感觉……麻木了。这样很难自慰了。");
            }
            else if(get_player().hasVagina())
            {
               outputText("[pg]你的" + get_player().vaginaDescript(0) + "突然一阵刺痛，然后停止了。你担心地伸手去检查，却发现它感觉……麻木了。这样很难自慰了。");
            }
            if(int(get_player().cocks.length) > 0 || get_player().hasVagina())
            {
               get_player().createStatusEffect(StatusEffects.Dysfunction,96,0,0,0);
               set_changes(get_changes() + 1);
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(1.7) == 0 && get_player().get_tallness() < 108)
         {
            _loc2_ = Utils.rand(5) + 3;
            if(get_player().get_tallness() > 90)
            {
               _loc2_ = Math.floor(_loc2_ / 2);
            }
            if(_loc2_ == 0)
            {
               _loc2_ = 1;
            }
            if(_loc2_ < 5)
            {
               outputText("[pg]你不安地挪动着身体，因为你意识到自己失去了平衡。低头一看，你发现自己长高了[i:slightly]。");
            }
            if(_loc2_ >= 5 && _loc2_ < 7)
            {
               outputText("[pg]你感到头晕目眩，有些不舒服，但很快意识到这是由于身高突然增加造成的。");
            }
            if(_loc2_ == 7)
            {
               outputText("[pg]你踉跄着向前走，头晕目眩地抓着头。你花了一会儿时间恢复平衡，站起来，感觉明显长高了。");
            }
            _loc11_ = get_player();
            _loc11_.set_tallness(_loc11_.get_tallness() + _loc2_);
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().ears.type == 3 && get_player().lowerBody.type == 1 && get_player().get_tallness() >= 90 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().face.type != 3)
            {
               outputText("[pg]骨骼痛苦地移动扭曲，你的面容扭曲变形，变得像你现在喝下其血液的野兽。<b>你现在有了一张类似牛头人的脸。</b>");
               set_changes(get_changes() + 1);
               get_player().face.type = 3;
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().ears.type == 3 && get_player().tail.type == 4)
         {
            _loc2_ = 1;
            if(get_player().horns.type == 2 || get_player().horns.type == 0)
            {
               if(get_player().horns.type == 2)
               {
                  if(int(get_player().vaginas.length) > 0)
                  {
                     if(get_player().horns.value > 4)
                     {
                        outputText("[pg]你感觉到头部角周围有压力，但它们并没有长得更大。");
                        outputText("你的头痛消失了，取而代之的是一种不自然的欲望。你感觉自己好像几个月没高潮过了。");
                        _loc11_ = get_player();
                        _loc11_.set_hoursSinceCum(_loc11_.get_hoursSinceCum() + 200);
                        dynStats(DynStat.Lust(20));
                     }
                     else
                     {
                        outputText("[pg]你的小角变大了一点，停留在中等大小的凸起。");
                        var _temp_2:* = get_player().horns;
                        _temp_2.value = _temp_2.value + 3;
                     }
                     set_changes(get_changes() + 1);
                  }
                  else
                  {
                     _loc2_ = 1 + Utils.rand(3);
                     var _temp_3:* = get_player().horns;
                     _temp_3.value = _temp_3.value + _loc2_;
                     if(_loc2_ == 0)
                     {
                        set_changes(get_changes() - 1);
                     }
                     if(_loc2_ == 1)
                     {
                        outputText("[pg]你的太阳穴传来一阵隐痛，你感觉到你的角从头骨中又长出了一英寸。");
                     }
                     if(_loc2_ == 2)
                     {
                        outputText("[pg]一阵剧烈的头痛让你瞬间弯下腰。伴随着痛苦的缓慢，你感觉到你的角从额头又长出了两英寸，在生长的过程中逐渐变粗。");
                     }
                     if(_loc2_ == 3)
                     {
                        outputText("[pg]一阵极其强烈的头痛席卷了你的头骨，痛苦淹没了你。你痛得闭上眼睛，但这无济于事。折磨加剧了，最后终于减弱，你感觉到一两英寸的新角从你的额头挤了出来。尽管如此，头痛依然存在，为了寻求缓解，你抓住你的角用力拉，又拉出了一英寸的新角。最后疼痛消退了，给你留下了明显增强的头刺。");
                     }
                     if(get_player().horns.value < 3)
                     {
                        outputText("它们只有小凸起那么大。");
                     }
                     if(get_player().horns.value >= 3 && get_player().horns.value < 6)
                     {
                        outputText("它们类似于你在小公牛身上看到的角。");
                     }
                     if(get_player().horns.value >= 6 && get_player().horns.value < 12)
                     {
                        outputText("它们看起来像成年公牛的角，足够大，也足够危险，能造成一些伤害。");
                     }
                     if(get_player().horns.value >= 12 && get_player().horns.value < 20)
                     {
                        outputText("它们又大又邪恶。");
                     }
                     if(get_player().horns.value >= 20)
                     {
                        outputText("它们巨大、沉重，尖端危险。");
                     }
                     if(Utils.rand(2) == 0 && get_changes() < get_changeLimit())
                     {
                        outputText("你的头痛消失了，取而代之的是一种不自然的欲望。你感觉自己好像几个月没射过了一样。");
                        _loc11_ = get_player();
                        _loc11_.set_hoursSinceCum(_loc11_.get_hoursSinceCum() + 200);
                        dynStats(DynStat.Lust(20));
                     }
                     set_changes(get_changes() + 1);
                  }
               }
               else
               {
                  outputText("[pg]伴随着痛苦的压力，你额头上的皮肤裂开，长出两个小小的肉包状的角，就像你家乡的牛一样。");
                  get_player().horns.type = 2;
                  get_player().horns.value = 2;
                  set_changes(get_changes() + 1);
               }
            }
            if(get_player().horns.type == 1 || get_player().horns.type > 2)
            {
               outputText("[pg]你的角震动着，像粘土一样变形，重新塑造成两个牛角状的角。");
               get_player().horns.type = 2;
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().ears.type != 3 && get_changes() < get_changeLimit() && get_player().tail.type == 4 && Utils.rand(2) == 0)
         {
            outputText("[pg]你感觉到你的耳朵在头皮上拉扯，改变形状，变成长方形，像牛一样。<b>你现在有牛耳朵了。</b>");
            get_player().ears.type = 3;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && get_player().tail.type != 4)
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你感觉到[ass]上方的肉在打结生长。它扭曲着，缠绕着，然后直直地垂下来，现在变成了明显的牛的形状。你有一条<b>牛尾巴</b>。");
            }
            else
            {
               if(get_player().tail.type < 5 || get_player().tail.type > 6)
               {
                  outputText("[pg]你的尾巴不舒服地聚拢在一起，扭曲着，缠绕着，然后直直地垂下来，现在变成了明显的牛的形状。你有一条<b>牛尾巴</b>。");
               }
               if(get_player().tail.type == 5 || get_player().tail.type == 6)
               {
                  outputText("[pg]你那昆虫般的腹部令人愉悦地刺痛着，因为它开始缩小和变软，几丁质变形和重塑，直到它看起来完全像一条<b>牛尾巴</b>。");
               }
            }
            get_player().tail.type = 4;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && (get_player().ass.analWetness > 0 && !get_player().hasPerk(PerkLib.MaraesGiftButtslut) || get_player().ass.analWetness > 1))
         {
            outputText("[pg]你感觉到结肠收紧，你的[asshole]吸入体内。起初你感到剧烈的疼痛，但谢天谢地，疼痛消退了。你的屁股似乎变干并收紧了。");
            _loc12_ = get_player().ass;
            --_loc12_.analWetness;
            if(get_player().ass.analLooseness > 1)
            {
               _loc13_ = get_player().ass;
               --_loc13_.analLooseness;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0)
         {
            outputText(get_player().modFem(5,10));
         }
         if(Utils.rand(4) == 0)
         {
            outputText(get_player().modTone(85,3));
         }
         if(Utils.rand(4) == 0)
         {
            outputText(get_player().modThickness(70,4));
         }
         if(get_changes() == 0)
         {
            outputText("[pg]牛头怪般的活力涌遍你的全身，让你充满活力并唤起你的欲望！\n");
            if(get_player().balls > 0)
            {
               outputText("你的蛋蛋感觉好像因为更多的精子而变得更重了。\n");
               _loc11_ = get_player();
               _loc11_.set_hoursSinceCum(_loc11_.get_hoursSinceCum() + 200);
            }
            get_player().HPChange(50,true);
            dynStats(DynStat.Lust(50));
         }
         get_player().refillHunger(25);
         var _loc14_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc14_,2077,FlagDict_Impl_.arrayReadInt(_loc14_,2077) + get_changes());
         return false;
      }
   }
}

