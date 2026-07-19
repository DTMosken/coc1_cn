package classes.items.consumables
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
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
   
   public class Equinum extends Consumable
   {
      
      public function Equinum()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Equinum","Equinum","a vial of Equinum",6,"This is a long flared vial with a small label that reads, \"Equinum\". It is likely this potion is tied to horses in some way.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc6_:* = null as BreastRow;
         var _loc7_:* = null as BreastRow;
         var _loc1_:String = "equinum";
         get_player().slimeFeed();
         var _loc2_:int = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         get_mutations().initTransformation([2,3]);
         outputText("你喝下药剂，因为强烈的味道而皱起眉头。");
         if(get_player().hasFur() && get_player().face.type == 1 && get_player().tail.type == 1 && get_player().lowerBody.type == 1)
         {
            if(get_player().hasStatusEffect(StatusEffects.HorseWarning) && Utils.rand(3) == 0)
            {
               if(get_player().statusEffectv1(StatusEffects.HorseWarning) == 0)
               {
                  outputText("[pg][b:你感到一阵寒意爬上脊背，全身颤抖，仿佛在排斥某种外来物。也许你应该少喝点马化药剂了。]");
               }
               if(get_player().statusEffectv1(StatusEffects.HorseWarning) > 0)
               {
                  outputText("[pg][b:你想知道在变成马之前，你还能喝多少这种药剂……]");
               }
               get_player().addStatusValue(StatusEffects.HorseWarning,1,1);
            }
            if(!get_player().hasStatusEffect(StatusEffects.HorseWarning))
            {
               outputText("[pg][b:当你喝下这美味的药剂时，你意识到自己已经有多像马了，并想知道这药剂还能改变什么……]");
               get_player().createStatusEffect(StatusEffects.HorseWarning,0,0,0,0);
            }
            if(Utils.rand(4) == 0 && get_player().hasStatusEffect(StatusEffects.HorseWarning) && !get_player().isTFResistant())
            {
               if(get_player().statusEffectv1(StatusEffects.HorseWarning) > 0)
               {
                  if(get_player().cockTotal() <= 0)
                  {
                     outputText("[pg]喝下马化药剂后不久，你的胸口就充满了灼热感。你喝了太多这种药剂，过量的药剂开始引起你身体的剧烈变化。你突然倒下，在痛苦中抽搐，你身体里所有的骨头和肌肉都在断裂和重组。最终，你因为承受不住压力而晕了过去。");
                     outputText("[pg]几分钟后你醒了过来。当你站起身时，心中充满了疑惑。你冲到附近的一个池塘边往下看，差点被水中的倒影吓了一跳，一匹");
                     if(get_player().get_gender() == 0 || get_player().get_gender() == 3)
                     {
                        outputText("马");
                     }
                     if(get_player().get_gender() == 1)
                     {
                        outputText("公马");
                     }
                     if(get_player().get_gender() == 2)
                     {
                        outputText("母马");
                     }
                     outputText("正回望着你，全身覆盖着美丽的[haircolor] [skindesc]。那就是你，然而你心中的疑惑依然存在。奇怪的画面涌入你的脑海。你觉得你似乎并不一直是一匹马，而是一种用两条腿站立的滑稽无毛生物。但你马族的思维迅速将这种疑惑当作白日梦抛之脑后，你小跑着离开了，完全忘记了自己曾经是谁。[pg]");
                     outputText("<b>一年后……</b>");
                     outputText("[pg]当你在已成为你家园的开阔平原上啃食小草时，你听到右侧传来一阵声响。你抬起头查看声音的来源，准备逃离潜在的捕食者，却看到一个奇怪的生物。它用两只脚站立，衣服下露出无毛的粉色皮肤。");
                     if(get_player().get_gender() == 0 || get_player().get_gender() == 1)
                     {
                        outputText("他显然是个雄性，但你有些困惑，因为你看到他本该是命根子的地方不是一个，而是三个凸起。[pg]");
                     }
                     if(get_player().get_gender() == 2)
                     {
                        outputText("她显然是个雌性，因为你可以看到她向你走来时六个乳房在晃动，衬衫上乳头的位置出现了小污渍。[pg]");
                     }
                     if(get_player().get_gender() == 3)
                     {
                        outputText("你有些困惑，因为你可以看到她大腿附近有一个凸起，但她走路时巨大的乳房也在晃动，你无法判断她是雄性还是雌性。[pg]");
                     }
                     outputText("你一看到这个生物，一股怀旧之情就涌上心头。不知为何，看着这个生物让你感到悲伤，仿佛你忘记了什么重要的事情。");
                     outputText("[pg][say: 在这里看到一匹孤零零的马真是奇怪，]这个生物沉思着，[say: 无论如何，你仍然是我在这里遇到的最不奇怪的生物了。更不用说你是唯一一个没有试图强暴我的，]它叹了口气说道。[pg]你发出一声疑问的嘶鸣作为回答。[pg][say: 嘿，我有个主意。我带你回营地。我喂你，作为回报，你可以帮我完成我的任务。你觉得怎么样？]");
                     outputText("[pg]本能地，你发出了一声高兴且赞同的嘶鸣。");
                     outputText("[pg]你的任务失败了，失去了目标，更重要的是，失去了自我。但是，即便如此，你还是找到了生活的新意义，并有了一个新的机会去实现你曾经失败的事情。");
                     get_game().gameOver();
                     return false;
                  }
                  if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
                  {
                     outputText("[pg]喝下马化药剂后不久，你的胸口充满了一种灼烧感。你喝了太多的药剂，过量服用开始在你的身体里引发剧烈的变化。你突然倒下，在痛苦中抽搐，全身的骨骼和肌肉都在断裂并重组。最终，你因为承受不住这种压力而昏了过去。");
                     outputText("[pg]几分钟后你醒了过来。当你站起身时，心中充满了疑惑。你冲到附近的一个池塘边往下看，差点被水中的倒影吓了一跳，一匹");
                     if(get_player().get_gender() == 0 || get_player().get_gender() == 3)
                     {
                        outputText("马");
                     }
                     if(get_player().get_gender() == 1)
                     {
                        outputText("公马");
                     }
                     if(get_player().get_gender() == 2)
                     {
                        outputText("母马");
                     }
                     outputText("，身上覆盖着美丽的[haircolor][skindesc]，正回望着你。那就是你，然而你心中的疑惑依然存在。奇怪的画面充斥着你的脑海，你感觉自己似乎并不一直是一匹马，而是某种用两条腿站立的滑稽无毛生物。然而，你那马族的头脑很快就把这种疑惑当作白日梦抛诸脑后，你小跑着离开了，完全忘记了自己曾经是谁。[pg]");
                     outputText("<b>一年后……</b>");
                     outputText("[pg]当你在家乡开阔平原上啃食着覆盖地表的矮小植物时，你听到右侧传来一阵声响。你抬起头查看声音的来源，准备逃离潜在的捕食者，却看到一个奇怪的生物。它用两只脚站立，衣服下露出无毛的粉色皮肤。你猛地一惊，意识到自己竟然能辨认出这个奇怪生物的性别。");
                     if(get_player().get_gender() == 0 || get_player().get_gender() == 1)
                     {
                        outputText("他显然是个雄性，但你有些困惑，因为你看到他本该是命根子的地方不是一个，而是三个凸起。[pg]");
                     }
                     if(get_player().get_gender() == 2)
                     {
                        outputText("她显然是个雌性，因为你可以看到她向你走来时六个乳房在晃动，衬衫上乳头的位置出现了小污渍。[pg]");
                     }
                     if(get_player().get_gender() == 3)
                     {
                        outputText("你有些困惑，因为你可以看到她大腿附近有一个凸起，但她走路时巨大的乳房也在晃动，你无法判断她是雄性还是雌性。[pg]");
                     }
                     outputText("你一看到这个生物，一股怀旧之情就涌上心头。不知为何，看着这个生物让你感到悲伤，仿佛你忘记了什么重要的事情。");
                     outputText("[pg][say: 在这里看到一匹孤零零的马真是奇怪，] 那个生物若有所思地说，[say: 无论如何，你仍然是我在这里遇到过的最不奇怪的生物。更不用说你是唯一一个没有试图强奸我的了，] 它叹了口气说道。[pg]你发出一声疑问的嘶鸣作为回答。[pg][say: 嘿，我有个主意。我带你回营地。我喂你，作为回报，你可以帮我完成我的任务。你觉得怎么样？]");
                     outputText("[pg]出于本能，你发出了一声快乐而赞同的嘶鸣。");
                     outputText("[pg]你在任务中失败了，失去了注意力，更重要的是，失去了自我。但是，即便如此，你还是找到了生活的新意义，并有了新的机会在你曾经失败的地方取得成功。");
                     get_game().gameOver();
                     return false;
                  }
               }
            }
         }
         if(Utils.rand(2) == 0)
         {
            if(get_player().get_str100() >= 60)
            {
               outputText("[pg]你感觉自己强壮得足以独自拉动一辆满载的马车。");
            }
            else
            {
               dynStats(DynStat.Str(1));
               outputText("[pg]你的肌肉紧绷并隆起，让你感觉自己力大如牛。");
            }
         }
         if(Utils.rand(2) == 0)
         {
            if(get_player().get_tou100() >= 75)
            {
               outputText("[pg]你的身体变得像");
               if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
               {
                  outputText("种马一样坚韧结实。");
               }
               else
               {
                  outputText("母马一样坚韧结实。");
               }
            }
            else
            {
               dynStats(DynStat.Tou(1.25));
               outputText("[pg]你的身体突然感觉更加坚韧和富有弹性。");
            }
         }
         if(Utils.rand(3) == 0)
         {
            if(get_player().get_inte100() <= 5)
            {
               outputText("[pg]当你的动物本能占据上风时，你发出了一声沙哑的“咴咴”马鸣。");
            }
            if(get_player().get_inte100() < 10 && get_player().get_inte100() > 5)
            {
               dynStats(DynStat.Inte(-1));
               outputText("[pg]喝下药水时你茫然地微笑着，知道自己只是个喜欢操逼的蠢笨大野兽。");
            }
            if(get_player().get_inte100() <= 20 && get_player().get_inte100() >= 10)
            {
               dynStats(DynStat.Inte(-2));
               outputText("[pg]你发现自己低头看着手中的空瓶子，并意识到自从喝下第一口后，你就什么都没想过。");
            }
            if(get_player().get_inte100() <= 30 && get_player().get_inte100() > 20)
            {
               dynStats(DynStat.Inte(-3));
               outputText("[pg]当你的烦恼似乎烟消云散时，你咧嘴笑了。你心里有一小部分在担心自己是不是变蠢了。");
            }
            if(get_player().get_inte100() <= 50 && get_player().get_inte100() > 30)
            {
               dynStats(DynStat.Inte(-4));
               outputText("[pg]随着智力的下降，你变得越来越难以集中注意力。");
            }
            if(get_player().get_inte100() > 50)
            {
               dynStats(DynStat.Inte(-5));
               outputText("[pg]你平时聪明的头脑感觉迟钝了许多。");
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
         if(Utils.rand(4) == 0)
         {
            get_mutations().restoreArms(_loc1_);
         }
         get_mutations().removeFeatheryHair();
         if((get_player().get_gender() == 1 || get_player().get_gender() == 3) && Utils.rand(1.5) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().countCocksOfType(CockTypesEnum.HORSE) + get_player().countCocksOfType(CockTypesEnum.DEMON) < int(get_player().cocks.length))
            {
               if(int(get_player().cocks.length) == 1)
               {
                  _loc2_ = 0;
                  _loc4_ = 0;
                  if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN)
                  {
                     outputText("[pg]你的[cock]开始感觉有些奇怪……你拉下裤子查看，看到它颜色变深，同时你感觉到根部附近有一种紧绷感，那里的皮肤似乎在聚拢。一个阴茎鞘开始在你的阴茎根部形成，收紧并将你的阴茎拉入其深处。一种灼热的感觉包围了你的阴茎，它突然长成了一根马的阴茎，使它原来的尺寸相形见绌。皮肤呈现出棕黑相间的斑驳，感觉比平时更敏感。你的手不可抗拒地被它吸引，你开始自慰，以强烈的原力喷射出精液。");
                     _loc2_ = get_player().addHorseCock();
                     _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(4) + 4);
                     _loc4_ = 1;
                     dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
                  }
                  if(get_player().cocks[0].get_cockType() == CockTypesEnum.DOG)
                  {
                     _loc2_ = get_player().addHorseCock();
                     outputText("[pg]你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "开始感觉有些奇怪……你拉下衣服查看，看到它颜色变深。你感觉到你的" + Appearance.cockNoun(CockTypesEnum.DOG) + "的顶端越来越紧，因为它变平了，向外张开。你的阴茎从阴茎鞘中推出，一寸又一寸的兽肉长得超出了它传统的尺寸。你注意到你的阴茎结消失了，多余的肉将更多的马阴茎从你的阴茎鞘中推出。你的手被这根奇怪的新" + Appearance.cockNoun(CockTypesEnum.HORSE) + "所吸引，你开始自慰，以强烈的原力喷射出浓稠的精液。");
                     _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(4) + 4);
                     _loc4_ = 1;
                     dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
                  }
                  if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
                  {
                     _loc2_ = get_player().addHorseCock();
                     outputText("[pg]你的" + get_player().cockDescript(0) + "开始感觉有些奇怪……你拉下衣服查看，看到它颜色变深。你感觉到你的[cock]的顶端越来越紧，因为它变平了，向外张开。你的皮肤在根部折叠并聚拢，形成了一个兽性的阴茎鞘。你最近拥有的光滑的非人质感褪去，呈现出一种更像皮革的质感。你的手被这根奇怪的新" + Appearance.cockNoun(CockTypesEnum.HORSE) + "所吸引，你开始自慰，以强烈的原力喷射出浓稠的精液。");
                     _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(4) + 4);
                     _loc4_ = 1;
                     dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
                  }
                  if(get_player().cocks[0].get_cockType().get_Index() > 4)
                  {
                     outputText("[pg]你的" + get_player().cockDescript(0) + "开始感觉有些奇怪……你拉下衣服查看，看到它颜色变深。你感觉到你的[cock]的顶端越来越紧，因为它变平了，向外张开。你的皮肤在根部折叠并聚拢，形成了一个兽性的阴茎鞘。你最近拥有的光滑的非人质感褪去，呈现出一种更像皮革的质感。你的手被这根奇怪的新" + Appearance.cockNoun(CockTypesEnum.HORSE) + "所吸引，你开始自慰，以强烈的原力喷射出浓稠的精液。");
                     _loc2_ = get_player().addHorseCock();
                     _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(4) + 4);
                     _loc4_ = 1;
                     dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
                  }
                  if(_loc4_ == 1)
                  {
                     outputText("<b>你的阴茎变成了马的阴茎！</b>");
                  }
               }
               else
               {
                  dynStats(DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35));
                  _loc2_ = get_player().addHorseCock();
                  outputText("[pg]你的其中一根阴茎开始感觉有些奇怪。你拉下衣服查看，发现你的" + get_player().cockDescript(_loc2_) + "的皮肤正在变暗，呈现出斑驳的棕黑色图案。");
                  if(_loc2_ == -1)
                  {
                     CoC_Settings.error("");
                     clearOutput();
                     outputText("操操操，错误：没有阴茎变形");
                  }
                  if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 1 || get_player().dogCocks() > 0)
                  {
                     outputText("你的阴茎鞘感到一阵刺痛，并开始变大，同时阴茎的根部也随之移动，缩入其中。");
                  }
                  else
                  {
                     outputText("你感觉到根部附近一阵紧绷，那里的皮肤似乎正在聚拢。一个阴茎鞘开始在你的" + get_player().cockDescript(_loc2_) + "根部形成，不断收紧并将你的" + get_player().cockDescript(_loc2_) + "拉入其深处。");
                  }
                  _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(4) + 4);
                  outputText("阴茎突然剧烈地蠕动起来，变得更长，并长出了一个粗大的伞状龟头，不断渗出动物的精液。");
                  outputText("<b>你现在拥有了一根马阴茎。</b>");
               }
               if(get_player().cocks[_loc2_].cockThickness <= 2)
               {
                  get_player().cocks[_loc2_].thickenCock(1);
               }
               set_changes(get_changes() + 1);
            }
            else
            {
               if(int(get_player().cocks.length) == 1)
               {
                  _loc3_ = get_player().increaseCock(0,Utils.rand(3) + 1);
                  _loc2_ = 0;
                  dynStats(DynStat.Sens(1),DynStat.Lust(10));
               }
               else
               {
                  _loc4_ = int(get_player().cocks.length);
                  _loc2_ = 0;
                  while(_loc4_ > 0)
                  {
                     _loc4_--;
                     if(get_player().cocks[_loc2_].cockLength > get_player().cocks[_loc4_].cockLength)
                     {
                        _loc3_ = get_player().cocks[_loc4_].cockLength;
                        _loc2_ = _loc4_;
                     }
                  }
                  _loc3_ = get_player().increaseCock(_loc2_,Utils.rand(4) + 1);
                  dynStats(DynStat.Sens(1),DynStat.Lust(10));
               }
               outputText("[pg]");
               if(_loc3_ > 2)
               {
                  outputText("你的" + get_player().cockDescript(_loc2_) + "痛苦地紧绷着，随着它变得更长，几英寸紧绷的马肉从你的阴茎鞘中涌出。浓稠的动物预精在伞状龟头处形成，这是由变化的快感引出的。");
               }
               if(_loc3_ > 1 && _loc3_ <= 2)
               {
                  outputText("阴茎鞘内积聚着疼痛的压力，突然释放出来，一英寸或更多的额外阴茎肉溢出。由于生长的快感，一滴预精在你变大的" + get_player().cockDescript(_loc2_) + "的龟头上形成。");
               }
               if(_loc3_ <= 1)
               {
                  outputText("随着你的" + get_player().cockDescript(_loc2_) + "从阴茎鞘中进一步顶出，一种轻微的压力感逐渐积聚然后释放。");
               }
               set_changes(get_changes() + 1);
            }
            if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
            {
               get_player().cocks[get_player().thinnestCockIndex()].thickenCock(0.5);
               outputText("[pg]你的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "在阴茎鞘内变粗，随着静脉血管的增粗而变得更大更粗壮，也更加显眼。这感觉很对");
               if(get_player().cor + get_player().lib < 50)
               {
                  outputText("，拥有如此出色的工具。你漫不经心地幻想着各种小穴和逼，你的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "无情地耕耘着它们，用精液把它们灌满直到怀孕。");
               }
               if(get_player().cor + get_player().lib >= 50 && get_player().cor + get_player().lib < 75)
               {
                  outputText("，就该是这样……你呼吸着强烈的野兽气味，幻想着日日夜夜操半人马，直到她们的肚子里晃荡着你的精液。");
               }
               if(get_player().cor + get_player().lib >= 75 && get_player().cor + get_player().lib <= 125)
               {
                  outputText("，成为一匹发情的种马。你渴望找到一匹母马或半人马进行交配。期盼着把夜晚花在将" + Appearance.cockNoun(CockTypesEnum.HORSE) + "深深插入她们充满麝香的通道中，把一发又一发浓稠的兽精排入她们体内。只要能早中晚不停地操马逼，你就会很开心。也许在某个地方，有一个农场正需要一个配种员……");
               }
               if(get_player().cor + get_player().lib > 125)
               {
                  outputText("像发情的公马一样大声嘶鸣。你的" + Appearance.cockNoun(CockTypesEnum.HORSE) + "简直是为操半人马和母马而生的。你想象着深深地耕耘一个马族小穴的感觉，直捣黄龙，将黏糊糊的马精射进它肥沃的子宫里。你的手不由自主地抚摸着你的马屌，每一次套弄都有麝香般的预精从伞状龟头滴落。你的思绪飘到了你拥有一群怀孕半人马后宫的画面上。");
               }
               if(get_player().cor < 30)
               {
                  outputText("你对这些奇怪的想法感到厌恶，浑身发抖，发誓要更好地控制自己。");
               }
               if(get_player().cor >= 30 && get_player().cor < 60)
               {
                  outputText("你想知道为什么自己会有这么奇怪的想法，但它们确实有一种奇特的吸引力。");
               }
               if(get_player().cor >= 60 && get_player().cor < 90)
               {
                  outputText("你沉浸在自己扭曲的幻想中，希望能再次梦到它们。");
               }
               if(get_player().cor >= 90)
               {
                  outputText("你满脸通红，露出扭曲的笑容，决心找一个合适的目标来强暴，重温你的幻想。");
               }
               dynStats(DynStat.Lib(0.5),DynStat.Lust(10));
            }
            if(Utils.rand(2) == 0 && get_changes() < get_changeLimit() && get_player().ballSize <= 3 && get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
            {
               if(get_player().balls == 0)
               {
                  get_player().balls = 2;
                  get_player().ballSize = 1;
                  outputText("[pg]一股令人作呕的压力在你男性根部的正下方形成。伴随着剧烈的疼痛，那里的血肉膨胀凸起，推出了一块圆形的肉疙瘩，你认出那是一颗睾丸！片刻之后，当第二颗睾丸落入你新形成的阴囊时，如释重负的感觉淹没了你。");
                  dynStats(DynStat.Lib(2),DynStat.Lust(5));
               }
               else
               {
                  var _temp_1:* = get_player();
                  _temp_1.ballSize = _temp_1.ballSize + 1;
                  if(get_player().ballSize <= 2)
                  {
                     outputText("[pg]一阵暖流穿过你的身体，你的腹股沟突然产生了一种沉重感。你停下来检查这些变化，你游移的手指发现你的" + get_player().simpleBallsDescript() + "变得比人类的还要大。");
                  }
                  if(get_player().ballSize > 2)
                  {
                     outputText("[pg]一阵突如其来的热量包裹了你的腹股沟，集中在你的[sack]上。当你发现你的" + get_player().simpleBallsDescript() + "再次变大时，走路都变得困难了。");
                  }
                  dynStats(DynStat.Lib(1),DynStat.Lust(3));
               }
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
         {
            if(int(get_player().vaginas.length) == 1)
            {
               if(get_player().vaginas[0].vaginalLooseness <= 3 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
               {
                  outputText("[pg]当你感觉到你的器官在微微移动时，你痛苦地捂住肚子。当压力过去后，你意识到你的" + get_player().vaginaDescript(0) + "变得更大了，无论是深度还是尺寸。");
                  var _temp_2:* = get_player().vaginas[0];
                  _temp_2.vaginalLooseness = _temp_2.vaginalLooseness + 1;
                  set_changes(get_changes() + 1);
               }
               if(get_player().vaginas[0].vaginalWetness <= 1 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
               {
                  outputText("[pg]你的" + get_player().vaginaDescript(0) + "明显变得湿润，散发出一种野兽般的气味。");
                  var _temp_3:* = get_player().vaginas[0];
                  _temp_3.vaginalWetness = _temp_3.vaginalWetness + 1;
                  set_changes(get_changes() + 1);
               }
            }
            else
            {
               _loc2_ = 0;
               _loc3_ = get_player().vaginas[_loc2_].vaginalWetness;
               _loc4_ = int(get_player().vaginas.length);
               while(_loc4_ > 0)
               {
                  _loc4_--;
                  if(_loc3_ > get_player().vaginas[_loc4_].vaginalWetness)
                  {
                     _loc2_ = _loc4_;
                     _loc3_ = get_player().vaginas[_loc2_].vaginalWetness;
                  }
               }
               if(get_player().vaginas[_loc2_].vaginalWetness <= 1 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
               {
                  outputText("[pg]你的" + get_player().vaginaDescript(_loc2_) + "之一明显湿润了，散发出一种野兽般的气味。");
                  var _temp_4:* = get_player().vaginas[_loc2_];
                  _temp_4.vaginalWetness = _temp_4.vaginalWetness + 1;
                  set_changes(get_changes() + 1);
               }
               _loc2_ = 0;
               _loc3_ = get_player().vaginas[_loc2_].vaginalLooseness;
               _loc4_ = int(get_player().vaginas.length);
               while(_loc4_ > 0)
               {
                  _loc4_--;
                  if(_loc3_ > get_player().vaginas[_loc4_].vaginalLooseness)
                  {
                     _loc2_ = _loc4_;
                     _loc3_ = get_player().vaginas[_loc2_].vaginalLooseness;
                  }
               }
               if(get_player().vaginas[0].vaginalLooseness <= 3 && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
               {
                  outputText("[pg]你痛苦地捂住肚子，感觉到你的器官在微微移动。当压力过去后，你意识到你的" + get_player().vaginaDescript(_loc2_) + "之一变大了，无论是深度还是大小。");
                  var _temp_5:* = get_player().vaginas[_loc2_];
                  _temp_5.vaginalLooseness = _temp_5.vaginalLooseness + 1;
                  set_changes(get_changes() + 1);
               }
            }
            if(get_player().statusEffectv2(StatusEffects.Heat) < 30 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
            {
               if(get_player().goIntoHeat(true))
               {
                  set_changes(get_changes() + 1);
               }
            }
            if(!get_hyper())
            {
               if(Utils.rand(2) == 0 && get_changes() < get_changeLimit())
               {
                  if(int(get_player().breastRows.length) == 1)
                  {
                     if(get_player().breastRows[0].breastRating > 3)
                     {
                        _loc2_ = 1;
                        _loc6_ = get_player().breastRows[0];
                        --_loc6_.breastRating;
                        if(get_player().breastRows[0].breastRating > 8)
                        {
                           _loc2_++;
                           _loc7_ = get_player().breastRows[0];
                           --_loc7_.breastRating;
                        }
                        if(_loc2_ == 1)
                        {
                           outputText("[pg]你感觉如释重负，并意识到你的[breasts]已经缩小到了[breastcup]。");
                        }
                        if(_loc2_ == 2)
                        {
                           outputText("[pg]你感觉轻了许多。低头一看，你意识到你的乳房变小了许多，缩小到了[breastcup]。");
                        }
                        set_changes(get_changes() + 1);
                     }
                  }
                  else
                  {
                     _loc3_ = 0;
                     _loc4_ = int(get_player().breastRows.length);
                     if(get_player().biggestTitSize() > 3)
                     {
                        outputText("\n");
                     }
                     while(_loc4_ > 0)
                     {
                        _loc4_--;
                        if(get_player().breastRows[_loc4_].breastRating > 3)
                        {
                           _loc6_ = get_player().breastRows[_loc4_];
                           --_loc6_.breastRating;
                           _loc3_++;
                           outputText("\n");
                           if(_loc4_ < int(get_player().breastRows.length) - 1)
                           {
                              outputText("……并且你");
                           }
                           else
                           {
                              outputText("你");
                           }
                           outputText("的" + get_player().breastDescript(_loc4_) + "缩小了，降到了" + get_player().breastCup(_loc4_) + "罩杯。");
                        }
                     }
                     if(_loc3_ == 2)
                     {
                        outputText("\n变化之后，你感觉轻盈了许多。");
                     }
                     if(_loc3_ == 3)
                     {
                        outputText("\n没有了额外的重量，你感到格外轻盈。");
                     }
                     if(_loc3_ >= 4)
                     {
                        outputText("\n感觉就像世界从你的肩膀上卸下了重担，或者在这个情况下，是从你的胸前卸下了重担。");
                     }
                     if(_loc3_ > 0)
                     {
                        set_changes(get_changes() + 1);
                     }
                  }
               }
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0 && get_player().eyes.type > 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你的眼睛感到一阵刺痛，你眨了眨眼。感觉就像黑色的白内障刚刚从你身上脱落，你不需要看自己的倒影就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感差点让你站不稳[feet]。当你站稳并睁开眼睛时，你意识到似乎有些不同。你的视力不知怎么改变了。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蜘蛛眼不见了！</b>");
               }
               outputText("<b>你重新拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().face.type != 1 && get_player().hasFur() && get_changes() < get_changeLimit() && Utils.rand(5) == 0 && get_player().ears.type == 1)
         {
            if(get_player().face.type == 2)
            {
               outputText("[pg]当你感觉到面部骨骼在重新排列时，一阵令人麻木的剧痛席卷全身。你痛苦地捂住脸，感觉皮肤在蠕动和变化，你的面貌正在重塑，用马的特征取代了原本像狗一样的特征。<b>你现在长着一张马脸。</b>");
            }
            else
            {
               outputText("[pg]当你感觉到面部骨骼在断裂和移位时，一阵令人麻木的剧痛席卷全身。你痛苦地捂住自己，感觉皮肤在手指下蠕动并拉长。最终疼痛消退了，留给你一张完美融合了人类和马族特征的脸。<b>你有一张非常像马族的脸。</b>");
            }
            set_changes(get_changes() + 1);
            get_player().face.type = 1;
         }
         if(get_mutations().tfNoFur() && !get_player().hasFur() && get_changes() < get_changeLimit() && Utils.rand(4) == 0 && get_player().tail.type == 1)
         {
            get_player().setFurColor(OneOf_Impl_.fromA(ColorLists.HORSE_FUR));
            if(get_player().hasPlainSkin())
            {
               outputText("[pg]每一寸皮肤都涌起一阵瘙痒感。当你疯狂地抓挠自己时，你感觉到毛发从皮肤里长出来，直到<b>你披上了一层漂亮的[furcolor]色皮毛。</b>");
            }
            if(get_player().hasScales())
            {
               get_player().skin.desc = "fur";
               outputText("[pg]你那[skintone]的鳞片开始奇痒无比。你条件反射地抓挠起来，引发了一场脱落鳞片的雪崩。随着你疯狂地抓挠和撕扯，痒感加剧，露出了一层" + get_player().skin.furColor + "色的[skindesc]。最后，痒感停止了，<b>你从新长出的[furcolor]色皮毛上刷掉了几片松动的鳞片。</b>");
            }
            set_changes(get_changes() + 1);
            get_player().skin.type = 1;
            get_player().skin.desc = "fur";
            get_player().underBody.restore();
         }
         if(get_player().lowerBody.type != 1 && get_player().tail.type == 1 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            set_changes(get_changes() + 1);
            if(get_player().lowerBody.type == 0)
            {
               outputText("[pg]当你的双脚发生变化时，你踉跄了一下，它们蜷缩成红肿疼痛的肉块。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
            }
            else if(get_player().lowerBody.type == 2)
            {
               outputText("[pg]当你的爪子发生变化时，你踉跄了一下，它们蜷缩成红肿疼痛的肉块。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你瘫倒在地，你那蜿蜒的[if (isNaga) {蛇}]尾撕裂成两半，变成了腿。疼痛是巨大的，尤其是你的新脚，它们向内卷曲并变成了蹄子！");
            }
            else if(get_player().lowerBody.type > 3)
            {
               outputText("[pg]当你的[feet]发生变化时，你踉跄了一下，它们卷曲成痛苦而愤怒的肉块。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
            }
            else if(!get_player().hasFur())
            {
               outputText("你的腰部以下长出了一层细细的绒毛，在长满时短暂地发痒。");
            }
            outputText("<b> 你的脚现在变成了蹄子！</b>");
            get_player().lowerBody.type = 1;
            get_player().lowerBody.legCount = 2;
            dynStats(DynStat.Spe(1));
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 1 && get_player().tail.type == 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().ears.type == -1)
            {
               outputText("[pg]你的头顶长出两个痛苦的肿块，形成水滴状的耳朵，上面覆盖着短毛。");
            }
            if(get_player().ears.type == 0)
            {
               outputText("[pg]你的耳朵在开始变化时痛苦地拉扯着你的脸，向上移动到你的头顶，并变成直立的兽耳。");
            }
            if(get_player().ears.type == 2)
            {
               outputText("[pg]你的耳朵改变了形状，从狗耳变成了马族的耳朵！");
            }
            if(get_player().ears.type > 2)
            {
               outputText("[pg]你的耳朵改变了形状，变成了水滴状的马耳！");
            }
            get_player().ears.type = 1;
            outputText("<b>你现在长着马耳。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 1 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你的屁股上突然传来一阵瘙痒，你发现自己长出了一条闪亮的长马尾，颜色和你头发一样的[haircolor]色。");
            }
            if(get_player().tail.type > 1 && get_player().tail.type <= 4)
            {
               outputText("[pg]当你的尾巴令人作呕地扭曲变形时，一阵剧痛刺穿了你的[asshole]。伴随着最后一波痛苦，它分裂成数百根细小的丝线，变成了一条马尾。");
            }
            if(get_player().tail.type > 4 && get_player().tail.type < 7)
            {
               outputText("[pg]你那昆虫般的腹部开始收缩，外骨骼像蛇蜕皮一样剥落。它不断收缩，直到变得像网球一样小，然后向外爆发，长成野兽般的尾巴形状。片刻之后，它在痛苦中爆发成丝状，分裂成数百根发丝，变成了一条闪亮的马尾。");
            }
            if(get_player().tail.type >= 7)
            {
               outputText("[pg]当你的尾巴令人作呕地扭曲变形时，一阵剧痛刺穿了你的[asshole]。伴随着最后一波痛苦，它分裂成数百根细小的丝线，变成了一条马尾。");
            }
            outputText("<b>你现在有了一条马尾。</b>");
            get_player().tail.type = 1;
            get_player().tail.venom = 0;
            get_player().tail.recharge = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(Utils.rand(3) == 0)
         {
            outputText(get_player().modTone(60,1));
         }
         if(get_changes() == 0)
         {
            outputText("[pg]非人的活力蔓延全身，让你精神焕发！\n");
            get_player().HPChange(20,true);
            dynStats(DynStat.Lust(3));
         }
         get_player().refillHunger(15);
         var _loc8_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc8_,2077,FlagDict_Impl_.arrayReadInt(_loc8_,2077) + get_changes());
         return false;
      }
   }
}

