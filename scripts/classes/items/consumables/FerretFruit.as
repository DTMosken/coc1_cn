package classes.items.consumables
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Butt;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class FerretFruit extends Consumable
   {
      
      public function FerretFruit()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Frrtfrt","Ferret Fruit","a ferret fruit",6,"This fruit is curved oddly, just like the tree it came from. The skin is fuzzy and brown, much like the skin of a peach.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc4_:* = null as Player;
         var _loc5_:* = null as Hips;
         var _loc6_:* = null as Hips;
         var _loc7_:* = null as Butt;
         var _loc8_:* = null as Butt;
         var _loc9_:* = null as BreastRow;
         var _loc10_:* = null as Cock;
         var _loc11_:* = null as Cock;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as String;
         var _loc16_:* = null as Array;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc1_:String = "ferretTF";
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         get_mutations().initTransformation([2,2,3]);
         outputText("你感到口干舌燥，毫不犹豫地狼吞虎咽吃下了这颗水果。尽管果皮像桃子一样毛茸茸的，但果肉却相对较硬，味道让你想起了苹果。它甚至还有一个像苹果一样的果核。吃完后，你把果核扔到了一边。");
         if(Utils.rand(100) == 0)
         {
            outputText("[pg]似乎没有发生其他事情。这水果坏了吗？");
            return false;
         }
         if(get_player().face.type == 18 && get_player().ears.type == 13 && get_player().tail.type == 17 && get_player().lowerBody.type == 20 && get_player().hasFur() && !get_player().isTFResistant())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1043) == 0)
            {
               outputText("[pg]你发现自己凝视着远方，漫不经心地幻想着在兔子洞里追逐兔子。你摇了摇头，回到了现实。<b>也许你应该少吃点雪貂果了？</b>");
               _loc4_ = get_player();
               _loc4_.set_inte(_loc4_.get_inte() - (5 + Utils.rand(3)));
               if(get_player().get_inte() < 5)
               {
                  get_player().set_inte(5);
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1043,1);
            }
            else if(Utils.rand(3) == 0)
            {
               outputText("[pg]当你吞下这颗水果时，你开始感到内心一阵温暖和毛茸茸的感觉。你仰面躺下，急不可耐地脱掉衣服。你晕乎乎地笑着，只想在草地上快乐地打滚。终于折腾完后，你试图站起来，但感觉有些……不一样了。无论你怎么努力，你发现自己完全无法长时间直立。你只能四肢着地才能舒服地移动。你的身体现在看起来就像一只普通的雪貂。这可不妙！当你试图理解自己的处境时，你发现自己越来越无法集中注意力思考这个问题。你的注意力最终飘向了远处的一只兔子。你舔了舔嘴唇。管他呢，你还有兔子洞要去扫荡！");
               get_game().gameOver();
               return false;
            }
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1043,0);
         }
         if(get_player().thickness > 15 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]每一个动作都感觉比上一个稍微轻松了一点。你是不是变瘦了！？(+2 纤瘦)");
            var _temp_1:* = get_player();
            _temp_1.thickness = _temp_1.thickness - 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().get_spe100() < 100 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]在水果的作用下，你的肌肉开始快速抽搐，但这种感觉并不完全令人不快。事实上，你觉得现在跑起来会轻松得多。");
            dynStats(DynStat.Spe(2 + Utils.rand(2)));
         }
         if(get_player().hips.rating > (get_player().isFemaleOrHerm() ? 6 : 4) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的[hips]升起一种温暖、刺痛的感觉。你立刻担心地伸手去摸。你能感觉到你的一小部分[hips]在你的手下逐渐缩小。看来，对于你现在流线型的身材来说，更丰满的资产会显得累赘。");
            _loc5_ = get_player().hips;
            --_loc5_.rating;
            if(get_player().hips.rating > 10)
            {
               _loc6_ = get_player().hips;
               --_loc6_.rating;
            }
            if(get_player().hips.rating > 15)
            {
               _loc6_ = get_player().hips;
               --_loc6_.rating;
            }
            if(get_player().hips.rating > 20)
            {
               _loc6_ = get_player().hips;
               --_loc6_.rating;
            }
            if(get_player().hips.rating > 23)
            {
               _loc6_ = get_player().hips;
               --_loc6_.rating;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().butt.rating > 6 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]当你的[butt]开始感到不舒服的紧绷时，你退缩了。一旦这种感觉过去，你回头看了一眼，检查自己。看来你的屁股变小了。虽然有点失望，但至少失去多余的质量会让你变得更轻、更快。");
            _loc7_ = get_player().butt;
            --_loc7_.rating;
            if(get_player().butt.rating > 10)
            {
               _loc8_ = get_player().butt;
               --_loc8_.rating;
            }
            if(get_player().butt.rating > 15)
            {
               _loc8_ = get_player().butt;
               --_loc8_.rating;
            }
            if(get_player().butt.rating > 20)
            {
               _loc8_ = get_player().butt;
               --_loc8_.rating;
            }
            if(get_player().butt.rating > 23)
            {
               _loc8_ = get_player().butt;
               --_loc8_.rating;
            }
            set_changes(get_changes() + 1);
         }
         if(!get_hyper() && (get_player().biggestTitSize() > 2 || get_player().hasCock() && get_player().biggestTitSize() >= 1) && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你托住你的乳房，因为它们开始奇怪地刺痛。你甚至能感觉到它们在你的手中变小！");
            _loc3_ = 0;
            while(_loc3_ < get_player().bRows())
            {
               if(get_player().breastRows[_loc3_].breastRating > 2 || get_player().hasCock() && get_player().breastRows[_loc3_].breastRating >= 1)
               {
                  _loc9_ = get_player().breastRows[_loc3_];
                  --_loc9_.breastRating;
               }
               _loc3_++;
            }
            set_changes(get_changes() + 1);
         }
         if(int(get_player().cocks.length) > 1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_player().removeCock(1,1);
            outputText("[pg]你的胯部传来一阵酥麻，让你有一种奇怪的感觉。解开你的[armor]，<b>你发现你的一根肉棒完全消失了！</b>");
            set_changes(get_changes() + 1);
         }
         if((get_player().balls > 0 || get_player().hasStatusEffect(StatusEffects.Uniball)) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().ballSize > 2)
            {
               if(get_player().ballSize > 5)
               {
                  var _temp_2:* = get_player();
                  _temp_2.ballSize = _temp_2.ballSize - (1 + Utils.rand(3));
               }
               var _temp_3:* = get_player();
               _temp_3.ballSize = _temp_3.ballSize - 1;
               outputText("[pg]你的阴囊慢慢收缩，变得更小了。<b>你的[balls]");
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
               outputText("[pg]你的阴囊慢慢收缩，直到似乎恢复了正常大小。<b>你能感觉到多余的蛋蛋好像融合在了一起，只留下了一对蛋蛋。</b>");
               set_changes(get_changes() + 1);
            }
            else if(get_player().balls == 1 || get_player().hasStatusEffect(StatusEffects.Uniball))
            {
               get_player().balls = 2;
               if(get_player().hasStatusEffect(StatusEffects.Uniball))
               {
                  get_player().removeStatusEffect(StatusEffects.Uniball);
               }
               outputText("[pg]你的阴囊慢慢缩小，你感觉到腹股沟处释放了巨大的压力。<b>你的单睾丸已经裂开，留下了一对睾丸。</b>");
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().hasCock())
         {
            _loc2_ = -1;
            _loc3_ = 0;
            while(_loc3_ < get_player().cockTotal())
            {
               if(_loc2_ == -1 || get_player().cocks[_loc3_].cockLength > get_player().cocks[_loc2_].cockLength)
               {
                  _loc2_ = _loc3_;
               }
               _loc3_++;
            }
            if(_loc2_ >= 0 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
            {
               if(get_player().cocks[_loc2_].cockLength > 6 && !get_hyper())
               {
                  outputText("[pg]一阵刺痛感席卷了你整个" + get_player().cockDescript(_loc2_) + "。片刻之后，这种感觉消失了，但它似乎变小了。");
                  _loc10_ = get_player().cocks[_loc2_];
                  --_loc10_.cockLength;
                  if(Utils.rand(2) == 0)
                  {
                     _loc11_ = get_player().cocks[_loc2_];
                     --_loc11_.cockLength;
                  }
                  if(get_player().cocks[_loc2_].cockLength >= 9)
                  {
                     var _temp_4:* = get_player().cocks[_loc2_];
                     _temp_4.cockLength = _temp_4.cockLength - (Utils.rand(3) + 1);
                  }
                  if(get_player().cocks[_loc2_].cockLength / 6 >= get_player().cocks[_loc2_].cockThickness)
                  {
                     outputText("幸运的是，它似乎并没有失去以前的粗细。");
                  }
                  else
                  {
                     get_player().cocks[_loc2_].cockThickness = get_player().cocks[_loc2_].cockLength / 6;
                  }
                  set_changes(get_changes() + 1);
               }
            }
         }
         if(get_player().hasCock() && get_player().cocks[0].get_cockType() != CockTypesEnum.FERRET && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你阴茎周围的皮肤折叠起来，将其包裹并变成了一个保护性的阴茎鞘。<b>你现在有一根雪貂鸡巴了！</b>");
            get_player().cocks[0].set_cockType(CockTypesEnum.FERRET);
            set_changes(get_changes() + 1);
         }
         if(get_player().averageNipplesPerBreast() > 1 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的乳头产生一阵紧绷感，每个乳房上的四个乳头中有三个完全消退，剩下的乳头移到了乳房中间。看来水果中的鼬科基因与这么多的乳头不兼容，所以<b>你每个乳房上只剩下一个乳头了。</b>");
            _loc3_ = 0;
            while(_loc3_ < get_player().bRows())
            {
               get_player().breastRows[_loc3_].nipplesPerBreast = 1;
               _loc3_++;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().hasGills() && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         var _loc12_:int = get_player().hair.type;
         var _loc13_:Boolean = ColorLists.FERRET_HAIR.indexOf(get_player().hair.color) != -1;
         if((get_player().hair.type != 0 || !_loc13_ || get_player().hair.length <= 0) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(!_loc13_)
            {
               _loc14_ = ColorLists.FERRET_HAIR;
               _loc15_ = _loc14_[Utils.rand(int(_loc14_.length))];
               get_player().hair.color = _loc15_;
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
            get_player().hair.type = 0;
            if(get_player().hair.length <= 0)
            {
               get_player().hair.length = 1;
               outputText("[pg]熟悉的头发触感回到了你的头上。在溪流边照了照自己后，你确认原本光秃秃的脑袋现在长出了正常的[hairColor]短发。");
            }
            else if(_loc12_ == 0 && !_loc13_)
            {
               outputText("[pg]头皮上的一阵轻微刺痛让你在溪流边检查自己。看来这次果实改变了你的头发，把它变成了[hair]。");
            }
            else
            {
               switch(_loc12_)
               {
                  case 1:
                     outputText("[pg]果实的余味还在嘴里萦绕，你开始感到头皮有一阵奇怪的瘙痒。当你抓挠时，你看到你的羽毛头发开始脱落，绒羽从头上掉落，直到你变成了光头。幸运的是，这并没有持续多久，因为你感觉到头发从头皮上长了出来。在附近的河边检查变化时，你瞥见你新的[hairColor]头发开始迅速生长。<b>你现在有了[hair]！</b>");
                     break;
                  case 3:
                     get_player().hair.length = 1;
                     outputText("[pg]吞下最后一点果实后，一缕粘液头发垂到了你的额头上。当你试图检查它时，那团粘液掉在地上蒸发了。当你歪着头看发生了什么时，越来越多的粘液块开始从你的头上掉落，并以同样的速度在地上消失。很快，你的头皮上没有任何粘液了，尽管完全秃了。");
                     outputText("[pg]似乎没过多久，片刻之后，熟悉的头发触感又回到了你的头上。在溪流边照了照自己后，你确认原本光秃秃的脑袋现在长出了正常的[hairColor]短发。");
                     break;
                  default:
                     outputText("[pg]头皮上的一阵轻微刺痛让你在溪流边检查自己。看来这次果实改变了你的头发，把它变成了[hair]。");
               }
            }
            set_changes(get_changes() + 1);
         }
         if((get_player().eyes.type == 1 || get_player().eyes.count > 2) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的视线变黑了，迫使你僵在原地，因为突如其来的失明让你有撞到危险物品的危险。感谢玛莱，没过多久你的视力就恢复了正常，只是有一点小变化。随着你的视野感觉发生了奇怪的变化，你检查了你面容的变化，注意到你头上的眼睛数量已经下降到了平均的一对！<b>你又有了正常的人类眼睛！</b>");
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().goIntoHeat(true))
            {
               set_changes(get_changes() + 1);
            }
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
         if(get_mutations().tfNoFur() && get_player().face.type == 17 && get_player().hasFur() && get_player().ears.type == 13 && get_player().tail.type == 17 && get_player().lowerBody.type == 20 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的下半张脸感到麻木，而头部的其他部分则被一种刺痛感所占据。你脸上的每一块肌肉都在紧绷和移动，骨骼和组织在重新排列，彻底改变了你头部的形状。当变化到达你的鼻子时，你呼吸困难，但你设法看到它变成了一个动物的口鼻。在它的顶部，你的鼻子呈现出三角形，这是雪貂特有的形状，还有可爱的粉红色。你的下巴也加入了进来，你的牙齿变尖了，重塑成属于小食肉动物的样子，尽管看起来并不具有威胁性或令人生畏。");
            outputText("[pg]一旦你的脸和下巴重塑完成，毛皮就覆盖了你的整个头部。柔软的感觉非常令人愉快。它有[furColor]的颜色，在你的口鼻、脸颊和耳朵处变成白色。你眼睛周围变黑的皮肤也发生了变化，变成了一个由同样柔软的毛皮组成的面具，颜色是较深的[furColor]。好吧，看来<b>你现在有一张动物般的雪貂脸了！</b>");
            get_player().face.type = 18;
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type == 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的眼睛周围突然开始发痒。你烦躁地咕哝着，疯狂地揉搓着受影响的区域。一旦这种感觉过去，你就会走到最近的反光表面，看看是否发生了什么变化。在那里，你的怀疑得到了证实。你眼睛周围的[skinFurScales]变黑了。<b>你现在有了一个雪貂面具！</b>");
            get_player().face.type = 17;
            set_changes(get_changes() + 1);
         }
         if([0,17,18].indexOf(get_player().face.type) == -1 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]当[face]上的骨头开始重组时，你不舒服地呻吟起来。你双手抱住头，揉着太阳穴试图缓解疼痛。当变化停止时，你疯狂地摸着自己的脸。那种熟悉的感觉是错不了的。<b>你的脸又变回人类了！</b>");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().skin.type == 1 && get_player().underBody.type != 3 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            _loc14_ = ColorLists.FERRET_FUR;
            _loc16_ = _loc14_[Utils.rand(int(_loc14_.length))];
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.furColor = _loc16_[0];
            get_player().underBody.type = 3;
            _loc15_ = _loc16_[1];
            get_player().copySkinToUnderBody({"furColor":_loc15_});
            set_changes(get_changes() + 1);
            outputText("[pg]看来，这颗果实改变了你的毛色。<b>你现在从头到脚都覆盖着[furColor]的皮毛，而你的腹部则是[underBody.furColor]的皮毛！</b>");
         }
         if(get_mutations().tfNoFur() && !get_player().hasFur() && get_player().ears.type == 13 && get_player().tail.type == 17 && get_player().lowerBody.type == 20 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            _loc17_ = get_player().skin.type;
            if(["latex","rubber"].indexOf(get_player().skin.adj) != -1)
            {
               _loc17_ = -99;
            }
            _loc14_ = ColorLists.FERRET_FUR;
            _loc16_ = _loc14_[Utils.rand(int(_loc14_.length))];
            get_player().skin.type = 1;
            get_player().skin.adj = "";
            get_player().skin.desc = "fur";
            get_player().skin.furColor = _loc16_[0];
            get_player().underBody.type = 3;
            _loc15_ = _loc16_[1];
            get_player().copySkinToUnderBody({"furColor":_loc15_});
            set_changes(get_changes() + 1);
            _loc18_ = _loc17_;
            if(_loc18_ == -99)
            {
               outputText("[pg]你那通常油滑且富有弹性的橡胶皮肤突然感觉有点干燥。心想也许是因为废土干燥的天气，你冲向溪流，在清凉的水中清洗皮肤。");
               outputText("[pg]这产生了与你预期相反的效果，你眼睁睁地看着一层[skinTone]色的粘稠橡胶从你的手臂上脱落。很快，你手臂上所有的橡胶都融化脱落了，留下了一层健康、正常的[skin]。这个过程在你身体的其他部位继续进行，还没等你反应过来，你的身体就被一层崭新的[skin]所覆盖，那种奇怪的感觉也随之消退。");
               outputText("[pg]然而好景不长，一阵令人不适的瘙痒感席卷了你。这感觉相当烦人，就像被虫子咬过之后一样，只不过是全身同时发作。");
            }
            else
            {
               while(true)
               {
                  if(_loc18_ != 2)
                  {
                     if(_loc18_ != 5)
                     {
                        if(_loc18_ != 6)
                        {
                           if(_loc18_ == 3)
                           {
                              outputText("[pg]你平时湿润粘稠的皮肤突然变得有点干燥。想着原因可能是废土干燥的天气，你冲向溪流，在清爽的水中清洗你的皮肤。");
                              outputText("[pg]这产生了与你预期相反的效果，你看着一层[skinTone]颜色的史莱姆从你的手臂上掉落……你惊慌失措地试图把它放回去，但无济于事。很快，你手臂上的所有粘液都滑落了，留下了一层健康、正常的[skin]。这个过程在你的身体其余部分继续，在你反应过来之前，你的身体已经被一层全新的[skin]覆盖，随着你的核心从你现在完全坚实的身体中排出，那种奇怪的感觉也消退了。");
                              outputText("[pg]但这并没有持续多久，一阵令人不适的瘙痒感席卷了你。这非常烦人，就像被虫子咬过之后的感觉，只不过是全身同时发作。");
                              break;
                           }
                           if(_loc18_ == 7)
                           {
                              outputText("[pg]一阵令人不适的瘙痒感席卷了你，你开始抓挠自己羊毛般的皮毛。这非常烦人，就像被虫子咬过之后的感觉，只不过是全身同时发作，而且瘙痒感不是来自皮肤，而是源于你的羊毛。");
                              break;
                           }
                           if(_loc18_ == 8)
                           {
                              outputText("[pg]一阵令人不适的瘙痒感席卷了你，你开始抓挠自己的羽毛。这非常烦人，就像被虫子咬过之后的感觉，只不过是全身同时发作，而且瘙痒感不是来自皮肤，而是源于你的羽毛。");
                              break;
                           }
                           outputText("[pg]一阵令人不适的瘙痒感席卷了你，你开始抓挠你的[skin]。这感觉相当烦人，就像被虫子咬过之后一样，只不过是全身同时发作。");
                           break;
                        }
                     }
                  }
                  outputText("[pg]覆盖在你身上的鳞片有一瞬间感觉很奇怪，看起来几乎像是在自己移动，就在那时你意识到它们正在改变！");
                  outputText("[pg]这种感觉很奇特，从它们与你皮肤相连的地方传来一阵瘙痒，随着它们变形的推进，这种瘙痒很快变得更加剧烈。然后一堆[skinTone]的鳞片从你的手臂上掉落。很快，你手臂上的所有鳞片都脱落了，留下了一层健康、正常的[skin]。这个过程在你的身体其余部分继续，不久之后你就被一层[skin]覆盖了。");
                  outputText("[pg]不过这并没有持续多久，因为一阵令人不适的瘙痒感席卷了你。这很烦人，就像被虫子咬了之后的余波，只是同时发生在你全身。");
                  break;
               }
            }
            switch(_loc17_)
            {
               case 7:
                  outputText("[pg]你揉搓着手臂以缓解瘙痒，看到一些羊毛掉落时有些惊慌，但很快就松了一口气，因为你发现它们只是在发生变化，留下了一片[furColor]的毛发，短得多，但仍然很毛茸茸。类似的变化也发生在你腿部、胸部和背部，没有一寸羊毛能幸免。随着羊毛的掉落，毛发在你的身体上生长，孤立的斑块随着羊毛层的消失而连接闭合，在几秒钟内，你的整个身体就被一层可爱的标准绒毛所覆盖。柔软蓬松的感觉摸起来非常舒服。\n<b>看来你现在从头到脚都覆盖着[furColor]的毛发，腹部则是[underBody.furColor]的毛发！</b>");
                  break;
               case 8:
                  outputText("[pg]你揉搓着手臂以缓解瘙痒，看到一些羽毛掉落时有些惊慌，但很快就松了一口气，因为你发现它们只是在发生变化，留下了一片[furColor]的毛发。类似的变化也发生在你腿部、胸部和背部，没有一寸羽毛能幸免。随着羽毛的掉落，毛发在你的身体上生长，孤立的斑块随着羽毛层的消失而连接闭合，在几秒钟内，你的整个身体就被一层可爱的厚实毛发所覆盖。柔软蓬松的感觉摸起来非常舒服。\n<b>看来你现在从头到脚都覆盖着[furColor]的毛发，腹部则是[underBody.furColor]的毛发！</b>");
                  break;
               default:
                  outputText("[pg]很快你意识到这种感觉是从皮肤下传来的。你烦躁地揉了揉一只手臂后，感觉到了一些不同，当你把目光投向那里时，你发现皮肤上长出了一片毛发。然后你发现腿部、胸部和背部也有类似的斑块。毛发在你的身体上生长，斑块在你的皮肤上连接闭合，在几秒钟内，你的整个身体就被一层可爱的厚实毛发所覆盖。柔软蓬松的感觉摸起来非常舒服。\n<b>看来你现在从头到脚都覆盖着[furColor]的毛发，腹部则是[underBody.furColor]的毛发！</b>");
            }
         }
         if(get_player().tail.type != 17 && get_player().ears.type == 13 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            switch(get_player().tail.type)
            {
               case 0:
                  outputText("[pg]感觉到臀部有一种不舒服的感觉，你伸展了一下身体，把它归咎于坐在粗糙的表面上。一种烦人的感觉传遍你的全身，迫使你坐下。当它转移到你的背部时，你的注意力集中在从你臀部爆发出来的一团绒毛上。在你还没来得及仔细检查之前，它似乎自己动了起来，跟随着现在在你的脊柱中跳动的奇怪感觉，一旦它扭动的感觉停止，附肢本身就变成了一根长长的、毛茸茸的管子。[if (hasArmor) {幸运的是，这种变形的爆发似乎并没有损坏你的[armor]。}]");
                  outputText("[pg]不久之后，果实的残余效果再次显现，这次的变化集中在你的尾巴上。它剧烈地抖动着，同时变长、变得更加蓬松。很快，它就变得几乎和你一样长了。几秒钟内，一层非常厚实、柔软、蓬松的毛发覆盖了它。似乎当你感到兴奋或紧张时，你会下意识地让它也兴奋或紧张地摆动，就像雪貂一样。");
                  break;
               case 5:
               case 6:
                  outputText("[pg]你圆润的腹部摸起来异常发热。几秒钟内，体内的热量蔓延到你身体的其他部位，你琢磨着自己是不是发烧了。突如其来的虚弱让你不得不把过热的身体靠在附近的一块岩石上。但是，热量来得快去得也快。");
                  outputText("[pg]看来它并不是单独消失的，因为当你瞥向身后时，你注意到原本巨大的昆虫腹部[if (hasOvipositor) {和产卵管}]已经不见了，取而代之的是一对正常的人类臀部，上面覆盖着[skinfurScales]。");
                  outputText("[pg]然后，一秒钟后，一种恼人的感觉流遍全身，迫使你坐了下来。当这种感觉转移到你的背部时，你的注意力被一团从你身后爆发出来的绒毛所吸引。还没等你仔细检查，它似乎就自己动了起来，跟随着现在在你的脊椎中跳动的奇怪感觉，当它扭动的感觉停止时，这个附肢本身已经变成了一根长长的、毛茸茸的管子。");
                  outputText("[pg]不久之后，果实的残余效果再次显现，这次的变化集中在你的尾巴上。它剧烈地抖动着，同时变长、变得更加蓬松。很快，它就变得几乎和你一样长了。几秒钟内，一层非常厚实、柔软、蓬松的毛发覆盖了它。似乎当你感到兴奋或紧张时，你会下意识地让它也兴奋或紧张地摆动，就像雪貂一样。");
                  break;
               default:
                  if(get_player().tail.type == 13 && get_player().tail.venom > 1)
                  {
                     outputText("[pg]你的尾巴似乎在自己动，纠缠成一团。在你感觉到发生什么之前，你意识到它们正在融合！一种介于轻微恶心和纯粹头晕之间的奇怪感觉传遍你的全身，当这种感觉消退后，你意识到你现在只有一条尾巴了。");
                     outputText("[pg]不过，变化过程并没有就此停止，果实的残余效果再次显现，这次的变化集中在你的尾巴上。它剧烈地抖动着，同时变长、变得更加蓬松。很快，它就变得几乎和你一样长了。几秒钟内，一层非常厚实、柔软、蓬松的毛发覆盖了它。似乎当你感到兴奋或紧张时，你会下意识地让它也兴奋或紧张地摆动，就像雪貂一样。");
                  }
                  else
                  {
                     outputText("[pg]果实的残余效果再次显现，这次的变化集中在你的尾巴上。它剧烈地抖动着，同时变长、变得更加蓬松。很快，它就变得几乎和你一样长了。几秒钟内，一层非常厚实、柔软、蓬松的毛发覆盖了它。似乎当你感到兴奋或紧张时，你会下意识地让它也兴奋或紧张地摆动，就像雪貂一样。");
                  }
            }
            outputText("[pg]当效果最终消退时，你决定测试一下这条尾巴，让它盘绕在你的身体上，很快你意识到你可以轻松地控制它的动作，而且它的毛发摸起来感觉棒极了。不管怎样，<b>你现在有了一条长长的、蓬松的雪貂尾巴！</b>");
            get_player().tail.restore();
            get_player().tail.type = 17;
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.type != 20 && get_player().ears.type == 13 && get_player().tail.type == 17 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().isTaur())
            {
               outputText("[pg]你的双腿颤抖着，迫使你躺在地上，因为它们似乎不再听从你的使唤。你最后记得的是腿部传来的一阵灼烧感，随后便短暂地失去了意识。当灼烧感消退，你终于醒来时，你再次看向双腿，却发现自己只剩下了一对趾行的腿，以及一个更接近人形的臀部。很快，重塑的双腿恢复了知觉，随之而来的是一阵瘙痒。一层厚厚的[if (hasFurryUnderBody) {[underBody.furColor]|黑褐色}]毛发从腿上长出。摸起来柔软蓬松。可爱的粉色肉垫完成了这次转变。<b>看来你长出了一对雪貂爪子！</b>");
            }
            else
            {
               switch(get_player().lowerBody.type)
               {
                  case 3:
                  case 32:
                     outputText("[pg]尾巴里传来一阵奇怪的感觉，让你不得不躺在地上。接着，这种感觉变得更加强烈，你感到盘绕的尾巴中间越来越痛。你盯着它们看了一会儿，才发现它们正在分裂！几秒钟内，它们就重塑成了一对更传统的腿，奇特之处在于它们的形状完全是趾行的。很快，腿上的鳞片全部脱落，露出了柔软的[skin]。但这并没有持续多久，因为很快一层厚厚的[if (hasFurryUnderBody) {[underBody.furColor]|黑褐色}]毛发就覆盖了它们。摸起来柔软蓬松。可爱的粉色肉垫完成了这次转变。<b>看来你长出了一对雪貂爪子！</b>");
                     break;
                  case 8:
                     outputText("[pg]你平时流动的史莱姆附肢变得异常僵硬，迫使你保持静止。然后，在你眼前，你看到上面的粘液聚集并塑造成两条腿的常见形状。比你能想象的还要快，流体变成了坚固的骨骼，瞬间被组织、神经和肌肉包裹，最后覆盖上一层柔软的、看起来像人类的皮肤。你试了试重新获得的双脚，微笑着发现你可以像以前一样毫无问题地使用它们。");
                     outputText("[pg]接着，一阵不安的感觉迫使你坐在附近的一块石头上，你感觉到你的[feet]里有什么东西正在发生变化。麻木感席卷了它们，肌肉和骨骼发生改变，轻柔地移动、融合并重新排列。几分钟后，你获得了一对带有粉色肉垫的趾行腿，末端长着短短的黑色爪子，并覆盖着一层厚厚的皮毛。摸起来非常柔软蓬松。<b>你获得了一对雪貂爪！</b>");
                     break;
                  case 16:
                     outputText("[pg]你那八条蜘蛛般的腿颤抖着，迫使你躺在地上，因为它们似乎不再听从你的使唤。你最后记得的是腿部传来的一阵灼烧感，随后便短暂地失去了意识。当灼烧感消退，你终于醒来时，你再次看向双腿，却发现自己只剩下了一对趾行的腿。很快，重塑的双腿恢复了知觉，随之而来的是一阵瘙痒。一层厚厚的[if (hasFurryUnderBody) {[underBody.furColor]|黑褐色}]毛发从腿上长出。摸起来柔软蓬松。可爱的粉色肉垫完成了这次转变。<b>看来你长出了一对雪貂爪子！</b>");
                     break;
                  default:
                     outputText("[pg]一种不安的感觉迫使你坐在附近的一块石头上，你感觉到[feet]里有什么东西正在发生变化。麻木感袭来，肌肉和骨骼在改变，轻柔地变移、融合并重新排列。几分钟后，你长出了一对趾行的腿，带有粉色的肉垫，末端是黑色的短爪，上面覆盖着一层厚厚的[if (hasFurryUnderBody) {[underBody.furColor]|黑褐色}]毛发。摸起来非常柔软蓬松。<b>你长出了一对雪貂爪子！</b>");
               }
            }
            set_changes(get_changes() + 1);
            get_player().lowerBody.type = 20;
            get_player().lowerBody.legCount = 2;
         }
         if(get_player().arms.type != 9 && get_player().tail.type == 17 && get_player().lowerBody.type == 20 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的手臂感到一阵无力，无论你怎么做，都无法使出一点力气来抬起或移动它们。难道这水果有什么类似药物的副作用？你坐在地上，等待着这种无力感过去。在此期间，你发现手部的骨骼以及手臂上的肌肉正在发生变化。很快，从肩膀到指尖，它们都被一层柔软蓬松的[if (hasFurryUnderBody) {[underBody.furColor]|黑褐色}]毛发所覆盖。你的手掌变成了带有粉色肉垫的爪子，指甲变成了短爪，虽然不够锋利撕裂血肉，但足够灵活，让攀爬和探索变得更加容易。<b>你的手臂变得像雪貂一样了！</b>");
            get_player().arms.setType(9);
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 13 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]在水果变形效果的作用下，你的耳朵抽动着，在它们发生变化时，你的听力会暂时减弱。虽然很不舒服，但幸运的是，这个过程并没有花太长时间。你耳朵上的血肉移动并融合成了两个小巧圆润的耳朵。然后，[furColor]的毛发在上面长出，它们位于你头部的两侧，随时准备探测附近的任何声音。最后，你留下了一对雪貂耳朵，形状和外观都非常具有动物特征。<b>你长出了雪貂耳朵！</b>");
            get_player().ears.type = 13;
            set_changes(get_changes() + 1);
         }
         if(get_player().hasInsectAntennae() && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]分开你头发的触角突然变得麻木，毫无疑问是因为水果的效果，它们变得越来越细。当它们几乎只有头发那么细时，上面剩余的血肉被重新吸收到你的头上。看来<b>你的触角消失了</b>。");
            get_player().antennae.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]你的眼睛睁大了。吃下水果后，你感觉精力充沛了许多。你现在完全清醒了！");
            get_player().changeFatigue(-20);
         }
         get_player().refillHunger(20);
         var _loc19_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc19_,2077,FlagDict_Impl_.arrayReadInt(_loc19_,2077) + get_changes());
         return false;
      }
   }
}

