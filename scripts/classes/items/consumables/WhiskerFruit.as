package classes.items.consumables
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class WhiskerFruit extends Consumable
   {
      
      public function WhiskerFruit()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("W.Fruit","Whisker Fruit","a piece of whisker-fruit",6,"This small, peach-sized fruit has tiny whisker-like protrusions growing from the sides.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = "catTransformation";
         if(get_player().hasReptileScales() && get_player().hasDragonWings() && get_player().tongue.type == 3)
         {
            _loc4_ = "catTransformation-dragonne";
         }
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         get_mutations().initTransformation([2,2,3]);
         outputText("你咬了一口水果，咽了下去。它又厚又多汁，有一种几乎令人难以抗拒的甜味。尽管如此，它还是很美味，你当然可以吃一顿。你吞噬了水果，直到剩下坚硬的、有小结节的核才停下来；你把它扔到一边。");
         if(get_player().get_spe100() < 75 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_spe100() <= 30)
            {
               outputText("[pg]你感觉……更平衡了，步伐更稳了。你确信你变得快了一点。");
               dynStats(DynStat.Spe(2));
            }
            else if(get_player().get_spe100() <= 60)
            {
               outputText("[pg]你改变姿势时绊了一下，对你移动的速度感到惊讶。在迷失方向一两分钟后，你调整了过来。你确信你现在跑得更快了。");
               dynStats(DynStat.Spe(1));
            }
            else
            {
               outputText("[pg]你走到一半停下来蹲下。你的腿部肌肉像疯了一样抽筋。过了一会儿，疼痛过去了，你感觉你可以追上任何东西。");
               dynStats(DynStat.Spe(0.5));
            }
         }
         if(get_player().get_str100() < 40 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(Utils.rand(2) == 0)
            {
               outputText("[pg]你的肌肉感觉紧绷，就像盘绕的弹簧，而且有点紧张。");
            }
            else
            {
               outputText("[pg]当你的肌肉痛苦地收紧时，你弓起背。抽筋很快就过去了，让你感觉自己变强了一点。");
            }
            dynStats(DynStat.Str(1));
         }
         else if(get_player().get_str100() > 60 && Utils.rand(2) == 0)
         {
            outputText("[pg]从头到脚一阵颤抖，让你感到虚弱。看看你自己，你的肌肉似乎失去了一些体积。");
            dynStats(DynStat.Str(-2));
         }
         if(get_player().get_tou100() > 50 && Utils.rand(2) == 0)
         {
            outputText("[pg]你的身体似乎暂时压缩了，变得更瘦，明显不那么坚韧了。");
            dynStats(DynStat.Tou(-2));
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_inte100() < 15)
            {
               outputText("[pg]你感觉有什么东西正在离你而去，但又弄不清楚到底发生了什么。你皱起[face]，试图理解现在的状况。还没等你得出任何结论，远处有什么东西闪闪发光，分散了你脆弱的注意力，让你完全忘记了这个问题。");
            }
            else if(get_player().get_inte100() < 50)
            {
               outputText("[pg]你的大脑感觉有些迟钝，你寻思着是不是该找个地方躺下");
               if(Utils.rand(2) == 0)
               {
                  outputText("然后");
                  _loc3_ = Utils.rand(3);
                  if(_loc3_ == 0)
                  {
                     outputText("扔个球玩玩什么的");
                  }
                  else if(_loc3_ == 1)
                  {
                     outputText("玩玩毛线球");
                  }
                  else if(_loc3_ == 2)
                  {
                     outputText("睡个午觉，别再操心了");
                  }
               }
               else
               {
                  outputText("晒晒太阳，把烦恼抛到九霄云外");
               }
               outputText("。");
            }
            else
            {
               outputText("[pg]你开始觉得有点头晕，但这种感觉很快就过去了。你仔细想了想，在脑海中拂去那种似乎弥漫在脑海中的模糊感，并断定这种水果可能真的让你变笨了。最好不要吃太多。");
            }
            dynStats(DynStat.Inte(-1));
         }
         if(get_player().get_lib100() < 80 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().countCocksOfType(CockTypesEnum.CAT) > 0)
            {
               _loc3_ = get_player().findFirstCockType(CockTypesEnum.CAT);
               outputText("[pg]你感觉到你的" + get_player().cockDescript(_loc3_) + "变硬了，倒刺变得更加敏感。你轻轻地抚摸着它们，想象着拔出时刮擦小穴内部的感觉。幻想还在继续，在射精并听到雌性愉悦的嚎叫后，你摇了摇头，试图驱散这个画面。");
               if(get_player().cor < 33)
               {
                  outputText("你需要更好地控制自己。");
               }
               else if(get_player().cor < 66)
               {
                  outputText("你不确定自己对这个幻想有什么感觉。");
               }
               else
               {
                  outputText("你希望能找到一个愿意的伴侣来实现这个幻想。");
               }
            }
            else
            {
               outputText("[pg]当你的身体消化水果时，一阵刺痛的温暖传遍全身。你能感觉到血液在四肢中泵动，让它们感觉敏感，甚至出奇地性感。你很难抗拒变得");
               if(get_player().get_lust100() > 60)
               {
                  outputText("更加");
               }
               outputText("兴奋。");
            }
            dynStats(DynStat.Lib(1),DynStat.Sens(0.25));
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            _loc7_ = get_player().get_inHeat();
            if(get_player().goIntoHeat(false))
            {
               if(_loc7_)
               {
                  if(Utils.rand(2) == 0)
                  {
                     outputText("[pg]你" + get_player().vaginaDescript(0) + "里的瘙痒感越来越强烈，你拼命想找一根好鸡巴来按摩里面。");
                  }
                  else
                  {
                     outputText("[pg]你" + get_player().vaginaDescript(0) + "里的需求变得更加强烈。你迫切需要找个伴侣来“止痒”，用小猫填满你的子宫。你很难不去想一根鸡巴滑进你湿润的肉洞里，现在你很难拒绝任何靠近你的雄性。");
                  }
               }
               else
               {
                  outputText("[pg]你的" + get_player().vaginaDescript(0) + "内部紧紧收缩，伴随着反射性的、隐隐作痛的渴望而挤压着。你的皮肤泛起潮红");
                  if(get_player().hasFur())
                  {
                     outputText("在你的皮毛下");
                  }
                  outputText("随着画面和幻想");
                  if(get_player().cor < 50)
                  {
                     outputText("侵袭着");
                  }
                  else
                  {
                     outputText("填满了");
                  }
                  outputText("你的脑海。身姿矫健的猫娘们排在你身后，她们那长满倒刺的完美阴茎正对着你，而你弯下腰，向她们展示你那饥渴的小穴。你颤抖着，渴望感受到她们柔软的倒刺摩擦你内壁的异国情调，在受孕时用她们的精液涂抹你的" + get_player().vaginaDescript(0) + "。你颤抖着从幻想中恢复过来，把手指从你兴奋的下体中抽出来。<b>看来你发情了！</b>");
               }
               set_changes(get_changes() + 1);
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && !get_hyper())
         {
            _loc5_ = 0;
            _loc6_ = 0;
            if(!get_player().hasVagina() && get_player().biggestTitSize() > 2)
            {
               _loc5_ = 2;
            }
            else if(get_player().biggestTitSize() > 4)
            {
               _loc5_ = 4;
            }
            if(_loc5_ > 0)
            {
               _loc6_ = 0;
               _loc8_ = 0;
               while(_loc8_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc8_].breastRating > _loc5_)
                  {
                     if(get_player().breastRows[_loc8_].breastRating > 10)
                     {
                        var _temp_1:* = get_player().breastRows[_loc8_];
                        _temp_1.breastRating = _temp_1.breastRating - (2 + Utils.rand(3));
                        if(_loc6_ == 0)
                        {
                           outputText("[pg]你胸前的[breasts]晃动了一下，然后紧缩起来，在这个过程中失去了好几个罩杯的大小！");
                        }
                        else
                        {
                           outputText("变化向下蔓延到你" + Utils.num2TextOrdinal(_loc8_ + 1) + "排的[breasts]。它们大幅度缩小，失去了几个罩杯的大小。");
                        }
                     }
                     else
                     {
                        var _temp_2:* = get_player().breastRows[_loc8_];
                        _temp_2.breastRating = _temp_2.breastRating - 1;
                        if(_loc6_ == 0)
                        {
                           outputText("[pg]突然间，你的重心发生了变化。你的背部感到一阵轻松，你花了一会儿才意识到你的" + get_player().breastDescript(_loc8_) + "缩小了！");
                        }
                        else
                        {
                           outputText("你" + Utils.num2TextOrdinal(_loc8_ + 1) + "排的" + get_player().breastDescript(_loc8_) + "在缩小时微微颤动，失去了一些质量。");
                        }
                     }
                     _loc6_++;
                  }
                  _loc8_++;
               }
            }
            if(_loc6_ > 0)
            {
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().cockTotal() > 0 && get_player().countCocksOfType(CockTypesEnum.CAT) < get_player().cockTotal() && (get_player().ears.type == 5 || Utils.rand(3) > 0) && (get_player().tail.type == 8 || Utils.rand(3) > 0) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < get_player().cockTotal() && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.CAT)
            {
               _loc2_++;
            }
            outputText("[pg]你的" + get_player().cockDescript(_loc2_) + "因近乎痛苦的兴奋而肿胀，并开始变形。它变成粉红色，并开始变窄，直到尖端刚好能容纳你的尿道。倒刺开始从它的肉中长出来，如果你能把那些小小的肉质突起称为倒刺的话。它们在你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "根部很粗，向尖端缩小。最小的几乎看不见。<b>你新的猫科动物阴茎有力地跳动着</b>，并喷出几滴精液。");
            if(!get_player().hasSheath())
            {
               outputText("然后，它开始缩小并把自己吸进你的身体里。没过多久，一个肉质的包皮就形成了。");
               if(get_player().balls > 0)
               {
                  outputText("值得庆幸的是，你的睾丸似乎没有受到影响。");
               }
            }
            else
            {
               outputText("然后，它又消失在你的包皮里。");
            }
            get_player().cocks[_loc2_].set_cockType(CockTypesEnum.CAT);
            set_changes(get_changes() + 1);
         }
         if(get_player().countCocksOfType(CockTypesEnum.CAT) > 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit() && !get_hyper())
         {
            _loc3_ = 0;
            _loc1_ = 0;
            while(_loc1_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT && get_player().cocks[_loc1_].cockLength > 6)
               {
                  _loc3_ = 1;
                  break;
               }
               _loc1_++;
            }
            if(_loc3_ == 1)
            {
               if(get_player().cocks[_loc1_].cockLength > 16)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc1_) + "感到刺痛，让你的包皮感觉不那么紧了。它的尺寸缩小了，失去了整整三分之一的长度和一点粗细，然后变化终于停止了。");
                  var _temp_3:* = get_player().cocks[_loc1_];
                  _temp_3.cockLength = _temp_3.cockLength * 0.66;
               }
               else if(get_player().cocks[_loc1_].cockLength > 6)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc1_) + "感到刺痛，并进一步缩回你的包皮中。如果你必须猜测的话，你会说你失去了大约两英寸的总长度，也许还有一些粗细。");
                  var _temp_4:* = get_player().cocks[_loc1_];
                  _temp_4.cockLength = _temp_4.cockLength - 2;
               }
               if(get_player().cocks[_loc1_].cockLength / 5 < get_player().cocks[_loc1_].cockThickness && get_player().cocks[_loc1_].cockThickness > 1.25)
               {
                  get_player().cocks[_loc1_].cockThickness = get_player().cocks[_loc1_].cockLength / 6;
               }
               _loc5_ = 0;
               _loc1_++;
               while(_loc1_ < int(get_player().cocks.length))
               {
                  if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT)
                  {
                     if(get_player().cocks[_loc1_].cockLength > 6)
                     {
                        if(get_player().cocks[_loc1_].cockLength > 16)
                        {
                           var _temp_5:* = get_player().cocks[_loc1_];
                           _temp_5.cockLength = _temp_5.cockLength * 0.66;
                        }
                        else if(get_player().cocks[_loc1_].cockLength > 6)
                        {
                           var _temp_6:* = get_player().cocks[_loc1_];
                           _temp_6.cockLength = _temp_6.cockLength - 2;
                        }
                        if(get_player().cocks[_loc1_].cockLength / 5 < get_player().cocks[_loc1_].cockThickness && get_player().cocks[_loc1_].cockThickness > 1.25)
                        {
                           get_player().cocks[_loc1_].cockThickness = get_player().cocks[_loc1_].cockLength / 6;
                        }
                        _loc5_ = 1;
                     }
                  }
                  _loc1_++;
               }
               outputText("虽然包裹变小了，但感觉更敏感了——就好像它在较小的形态下保留了较大尺寸的所有感觉。");
               dynStats(DynStat.Sens(5));
               if(_loc5_ == 1)
               {
                  outputText("进一步检查后，你所有的" + Appearance.cockNoun(CockTypesEnum.CAT) + "都缩小了！");
               }
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc4_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc4_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc4_);
         }
         if(get_mutations().tfNoFur() && get_player().face.type == 6 && get_player().tongue.type == 6 && get_player().ears.type == 5 && get_player().tail.type == 8 && get_player().lowerBody.type == 9 && get_player().arms.type == 10 && get_player().hasFur() && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]当你感觉到你的面部骨骼在重新排列时，令人麻木的疼痛流遍全身。你痛苦地抓住你的脸，因为你的皮肤在爬行和移动，你的面容正在重塑，用猫科动物的特征取代了你的面部特征，还有一个口鼻，一个可爱的猫鼻子和胡须。");
            outputText("\n<b>你现在有一张猫脸了。</b>");
            get_player().face.type = 28;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 5 && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ears.type == 0)
            {
               if(Utils.rand(2) == 0)
               {
                  outputText("[pg]你脸两侧的皮肤痛苦地拉伸着，因为你的耳朵向上移动，向头顶移动。它们移动并拉长了一点，上面长出了毛发，因为它们本质上变成了猫科动物。<b>你现在有猫耳了。</b>");
               }
               else
               {
                  outputText("[pg]你的耳朵开始刺痛。你伸出一只手轻轻地揉了揉它们。它们似乎长出了毛发。没过多久，它们就移到了你的头顶，并且变大了。刺痛感停止了，你发现自己以一种全新的方式听到声音。<b>你现在有猫耳了。</b>");
               }
            }
            else if(Utils.rand(2) == 0)
            {
               outputText("[pg]你的耳朵改变了形状，变成了尖尖的猫科动物耳朵！当你适应它们时，它们会反射性地旋转。<b>你现在有猫耳了。</b>");
            }
            else
            {
               outputText("[pg]你的耳朵感到一阵刺痛，并开始改变形状。没过多久，它们就变得又长又像猫耳。多亏了这对毛茸茸的新器官，你发现自己能听到以前忽略的声音了。<b>你现在有了猫耳。</b>");
            }
            get_player().ears.type = 5;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 8 && get_player().ears.type == 5 && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().tail.type == 0)
            {
               _loc3_ = Utils.rand(3);
               if(_loc3_ == 0)
               {
                  outputText("[pg]你的后背感到一阵压力。你摸了摸[armor]下面，发现了一个奇怪的凸起，似乎还在不断变大。几秒钟后，它穿过你的手指，从衣服后面破茧而出，一直长到快要触及地面。一层厚厚的皮毛迅速长出，覆盖了你的新尾巴。你本能地不断调整它以保持平衡。<b>你现在有了一条猫尾巴。</b>");
               }
               if(_loc3_ == 1)
               {
                  outputText("[pg]你感觉到你的后背在移动和改变，血肉重塑并移位成一条长而灵活的尾巴！<b>你现在有了一条猫尾巴。</b>");
               }
               if(_loc3_ == 2)
               {
                  outputText("[pg]你感到脊椎有一阵奇怪的刺痛，尾骨开始跳动并肿胀。没过多久，它开始生长，在你的脊椎上增加了新的骨头。不知不觉中，你长出了一条尾巴。就在你以为一切都结束的时候，尾巴开始长出柔软、有光泽的[furcolor]皮毛。<b>你现在有了一条猫尾巴。</b>");
               }
            }
            else
            {
               outputText("[pg]你停下来，歪着头……感觉有些不对劲。啊，原来是这样；你转过身，低头看着你的尾巴开始改变形状，变窄并长出有光泽的皮毛。<b>你现在有了一条猫尾巴。</b>");
            }
            get_player().tail.type = 8;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type == 8 && get_player().ears.type == 5 && Utils.rand(5) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.type != 9)
         {
            if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你感觉你的蹄子突然裂开，长成了五个独特的脚趾。当你的蹄子重塑成毛茸茸的猫爪时，它们的肉变软了。<b>你现在有了猫爪。</b>");
               if(get_player().isTaur())
               {
                  outputText("你感到头晕目眩，倒在了一边。当你醒来时，你不再是半人马了，你的身体已经恢复了人形。");
               }
            }
            else if(get_player().lowerBody.type == 8)
            {
               outputText("[pg]你的下半身向内收缩，塑造成两条腿状的形状，并逐渐变硬。片刻之后，它们凝固成了趾行腿，并配有柔软的肉垫猫爪。<b>你现在有了猫爪！</b>");
            }
            else
            {
               outputText("[pg]你痛苦地尖叫起来，因为你感觉到[feet]里的骨头断裂并开始重新排列。当疼痛消退时，你感觉平衡感出奇地好。<b>你现在有了猫爪。</b>");
            }
            get_player().lowerBody.type = 9;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().tail.type == 8 && get_player().ears.type == 5 && Utils.rand(5) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.type == 9 && !get_player().hasFur())
         {
            outputText("[pg]你的[skindesc]开始刺痛，然后发痒。");
            get_player().skin.type = 1;
            get_player().skin.desc = "fur";
            get_player().setFurColor(OneOf_Impl_.fromB(ColorLists.CAT_FUR),3);
            outputText("你心不在焉地伸手去抓手臂，把手指拿开时，发现了几缕[furcolor]的皮毛。等等，皮毛？刚才发生了什么？！你花了一点时间检查自己，发现<b>你现在全身覆盖着有光泽、柔软的皮毛。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().hasCatFace() && !get_player().hasCatEyes() && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]有一瞬间，你的视线发生了变化，周围的光线突然变得极其明亮，几乎让你失明。你迷失了方向，四处走动，直到亮度恢复正常。你跑到水坑边检查自己的倒影，很快发现你的瞳孔变得像猫一样。");
            outputText("\n<b>你现在有了猫眼！</b>");
            get_player().eyes.setType(9);
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().tail.type == 8 && get_player().ears.type == 5 && get_player().lowerBody.type == 9 && !get_player().hasCatFace() && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉到你的犬齿在发生变化，拉长成锋利的匕首状牙齿，能够造成严重的伤害。有趣的是，即使在改变之后，你的脸仍然相对像人类。你对这种变化发出呼噜声，让你看起来很可爱。");
            if(!get_player().hasCatEyes())
            {
               outputText("[pg]有一瞬间，你的视线发生了变化，周围的光线突然变得极其明亮，几乎让你失明。你迷失了方向，四处走动，直到亮度恢复正常。你跑到水坑边检查自己的倒影，很快发现你的瞳孔变得像猫一样。");
            }
            outputText("\n<b>你现在有了一张猫[boy]的脸！</b>");
            get_player().face.setType(6);
            set_changes(get_changes() + 1);
         }
         if(get_player().hasCatFace() && get_player().tongue.type != 6 && Utils.rand(5) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的舌头突然感觉很奇怪。你试着伸出舌头看看发生了什么，发现它变得像猫的舌头。至少你将能够用<b>你的新猫舌头</b>好好梳理自己了。");
            get_player().tongue.type = 6;
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 10 && get_player().isFurry() && get_player().tail.type == 8 && get_player().lowerBody.type == 9 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的手臂感到无力，无论你怎么做，都无法鼓起力气举起或移动它们。这水果有类似药物的作用吗？你坐在地上，等待着无力感结束。当你这样做的时候，你意识到你手上的骨头正在发生变化，手臂上的肌肉也是如此。它们很快就被一层柔软、蓬松的[if (hasFurryUnderBody) {[underBody.furColor]|[furColor]}]皮毛覆盖，从肩膀一直到指尖。你的手掌曾经所在的地方长出了粉红色的肉垫爪子，你的指甲变成了又长又细、弯曲的爪子，锋利得足以撕裂血肉，灵活得足以让攀爬和探索变得更容易。<b>你的手臂变得像猫一样了！</b>");
            get_player().arms.setType(10);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_changes() == 0)
         {
            outputText("[pg]非人的活力传遍你的全身，让你精神焕发！\n");
            get_player().HPChange(50,true);
            dynStats(DynStat.Lust(3));
         }
         if(get_changes() < get_changeLimit())
         {
            if(Utils.rand(2) == 0)
            {
               outputText(get_player().modThickness(5,2));
            }
            if(Utils.rand(2) == 0)
            {
               outputText(get_player().modTone(76,2));
            }
            if(get_player().get_gender() < 2)
            {
               if(Utils.rand(2) == 0)
               {
                  outputText(get_player().modFem(65,1));
               }
               else
               {
                  outputText(get_player().modFem(85,2));
               }
            }
         }
         get_player().refillHunger(20);
         var _loc9_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc9_,2077,FlagDict_Impl_.arrayReadInt(_loc9_,2077) + get_changes());
         return false;
      }
   }
}

