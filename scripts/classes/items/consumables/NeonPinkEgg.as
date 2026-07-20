package classes.items.consumables
{
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.BodyPartLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class NeonPinkEgg extends Consumable
   {
      
      public function NeonPinkEgg()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("NPnkEgg","N.Pink Egg","a neon pink egg",6,"A small egg with an unnatural neon-pink coloration. It tingles in your hand with odd energies that make you feel as if you could jump straight into the sky.");
         addTags("Egg");
      }
      
      override public function useItem() : Boolean
      {
         return applyEffect(get_player());
      }
      
      public function applyEffect(param1:Player, param2:Boolean = false) : Boolean
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as Vagina;
         var _loc3_:String = "neonPinkEgg";
         get_mutations().initTransformation([2,2]);
         if(!param2)
         {
            clearOutput();
            outputText("你吃下了这颗霓虹粉蛋，令你高兴的是，它尝起来很甜，就像糖果一样。几秒钟内你就把它整个吞了下去，你把手指舔干净后才意识到你连蛋壳也吃掉了——而且它尝起来还是像糖果。");
         }
         else
         {
            set_changeLimit(1);
            outputText("\n<b>你那塞满蛋的");
            if(param1.get_pregnancyType() == 9)
            {
               outputText("子宫");
               if(param1.get_buttPregnancyType() == 9)
               {
                  outputText("和");
               }
            }
            if(param1.get_buttPregnancyType() == 9)
            {
               outputText("后穴");
            }
            if(param1.get_buttPregnancyType() == 9 && param1.get_pregnancyType() == 9)
            {
               outputText("翻腾");
            }
            else
            {
               outputText("翻腾");
            }
            outputText("得有些奇怪，你有一种预感，有什么东西要改变了</b>。");
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && param1.get_spe100() < 80)
         {
            if(param1.get_spe100() < 30)
            {
               outputText("[pg]一阵刺痛流遍你的肌肉，你接下来的几个动作似乎出乎意料地快。这颗蛋不知怎么地让你变快了！");
            }
            else if(param1.get_spe100() < 50)
            {
               outputText("[pg]你感到一阵刺痛流遍全身，片刻之后，很明显你变得更快了。");
            }
            else if(param1.get_spe100() < 65)
            {
               outputText("[pg]你已经习惯的那种紧绷、蓄势待发的感觉似乎加剧了，你在潜意识里知道自己变得更快了。");
            }
            else
            {
               outputText("[pg]你的体格发生了一些变化，你咕哝了一声，试探性地在空中挥舞了一下手臂。你似乎比以前移动得更快了，这证实了你的怀疑。");
            }
            dynStats(DynStat.Spe(param1.get_spe100() < 35 ? 2 : 1));
         }
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            dynStats(DynStat.Lib(1),DynStat.Lust(5 + param1.lib / 7));
            if(param1.get_lib100() < 30)
            {
               dynStats(DynStat.Lib(1));
            }
            if(param1.get_lib100() < 40)
            {
               dynStats(DynStat.Lib(1));
            }
            if(param1.get_lib100() < 60)
            {
               dynStats(DynStat.Lib(1));
            }
            if(param1.get_lib100() < 60)
            {
               if(!param1.hasCock() || param1.get_gender() == 3 && Utils.rand(2) == 0)
               {
                  if(param1.get_lib100() >= 30)
                  {
                     outputText("[pg]你张开嘴，开始因为欲望而喘息。天气变热了吗？你的手伸向你的[assholeOrPussy]，你突然感觉到它是如此的空虚。想要被填满的渴望，不是被手或手指，而是被一个强壮的男性，像波浪一样席卷了你，不断增加你对性的渴望。");
                  }
                  else
                  {
                     outputText("[pg]你扭动了一下，发现自己的目光向下瞥向了腹股沟。奇怪的想法涌上心头，你想知道一直交配直到你肿胀怀孕会是什么感觉。");
                     if(param1.cor < 25)
                     {
                        outputText("你对这种可耻的想法感到厌恶。");
                     }
                     else if(param1.cor < 60)
                     {
                        outputText("你担心这个地方真的在影响你。");
                     }
                     else if(param1.cor < 90)
                     {
                        outputText("你喘息着，想知道最近的能生育的男性在哪里。");
                     }
                     else
                     {
                        outputText("你因欲求不满而发出难耐的呻吟。你该尽快找人配种了！");
                     }
                  }
               }
               if(param1.hasCock())
               {
                  if(param1.get_lib100() >= 30)
                  {
                     outputText("[pg]你张开嘴，开始因欲望而喘息。天气变热了吗？你的手伸向[eachcock]，你因为它的紧绷和坚硬而呻吟。想要挤压它的欲望，不是用你的手，而是用紧致的小穴或起皱的屁眼，像波浪一样穿过你的身体，不断增加你对性的渴望。");
                  }
                  else
                  {
                     outputText("[pg]你不安地扭动着身子，视线不由自主地向下瞥向自己的胯部。奇怪的念头涌上心头，你想知道操一只");
                     if(Utils.rand(2) == 0)
                     {
                        outputText("母野兔，直到她被满肚子的卵塞得动弹不得会是什么感觉。");
                     }
                     else
                     {
                        outputText("双性兔子，直到她的阴囊肿胀到只能靠一遍又一遍地自慰来恢复行动能力会是什么感觉。");
                     }
                     if(param1.cor < 25)
                     {
                        outputText("你对这种可耻的想法感到厌恶。");
                     }
                     else if(param1.cor < 50)
                     {
                        outputText("你担心这个地方真的在影响你。");
                     }
                     else if(param1.cor < 75)
                     {
                        outputText("你微微喘息着，想知道最近的能生育的雌性在哪里。");
                     }
                     else
                     {
                        outputText("你因欲望和失望而咕哝呻吟。天哪，你需要做爱！");
                     }
                  }
               }
            }
            else if(param1.get_lib100() < 80)
            {
               outputText("[pg]你扇着脖子，开始喘息，你[skinTone]的皮肤开始因发热而泛红[if (hasPlainSkin == false) {，透过你的[skinDesc]都能看出来}]。");
               switch(param1.get_gender())
               {
                  case 0:
                     outputText("性饥渴似乎在啃噬着你的[asshole]，叫嚣着要被填满，但你努力抵抗着高涨的性欲。这真的、真的太难了。");
                     break;
                  case 1:
                     outputText("当[eachcock]在你的[armor]下紧绷时，压迫感随之收紧。你努力压抑着高涨的性欲，但这很难——真的太难了。");
                     break;
                  case 2:
                     outputText("你迅速充血的外阴间泛起湿意，让你在试图压抑高涨的性欲时忍不住扭动摩擦，但这很难——真的太难了。");
                     break;
                  case 3:
                     outputText("当[eachcock]开始在你的[armor]下紧绷时，湿热感和紧绷的压迫感在你的腹股沟处争夺着你的注意力。你的外阴充血肿胀，变得越来越湿滑。你拼命想要压抑高涨的性欲，但这真的、真的太难了。交配的冲动在你的脑海中挥之不去，随时可能爆发。");
               }
            }
            else
            {
               outputText("[pg]甜美而无法满足的欲望在你体内不断攀升，直到你越来越难以将其压抑。一个微弱却喋喋不休的声音在质问你，为什么非要压抑它呢。屈服于欲望去交配的感觉是如此美妙，以至于你几乎当场就要向这个诱人的想法妥协。生活开始变得越来越像是在情欲的迷雾中不断地做爱或自慰，而你越来越觉得这也没什么不好的。");
               if(param1.cor < 33)
               {
                  outputText("你叹了口气，试图不让自己完全屈服。");
               }
               else if(param1.cor < 66)
               {
                  outputText("你喘息着呻吟，不确定自己还能抵抗多久，甚至不知道自己是否还想抵抗。");
               }
               else
               {
                  outputText("你微笑着，想知道自己是否能");
                  if(param1.get_lib100() < 100)
                  {
                     outputText("让你的性欲变得更高。");
                  }
                  else
                  {
                     outputText("现在就找个人干一炮。");
                  }
               }
            }
         }
         if(param1.get_sens100() < 60 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]");
            if(Utils.rand(3) != 2)
            {
               outputText("微风吹过你[skinDesc]的感觉变得更强烈了一些。真奇怪。你掐了自己一下，结果比想象中要疼得多，让你差点跳起来。你变得更敏感了！");
               dynStats(DynStat.Sens(5));
            }
            else
            {
               dynStats(DynStat.Sens(15));
               outputText("你身体的每一个动作似乎都带来了更强烈的快感，让你感到头晕目眩。你的[armor]美妙地摩擦着你的[nipples][if (hasnipplecunts) {，紧贴着[if (biggestLactation > 2) {漏奶的乳头小穴|滑溜溜的乳头小穴}]|[if (biggestLactation > 2) {，轻松地滑过漏奶的乳头|不断地刮擦着每一个坚硬的凸起}]}]。与此同时，你的胯部……你的胯部充满了天堂般的快感，这感觉来自");
               switch(param1.get_gender())
               {
                  case 0:
                     outputText("你的[asshole]");
                     break;
                  case 1:
                     outputText("[eachcock]和你的[if (hasBalls) {[balls]|[asshole]}]");
                     break;
                  case 2:
                     outputText("你的[cunt]和[clit]");
                     break;
                  case 3:
                     outputText("[eachcock]、[if (hasBalls) {[balls]、}][cunt]和[clit]");
               }
               outputText("以至于你不得不一动不动地站着，以免自己倒在地上当场自慰。谢天谢地，这种触觉上的狂欢在一分钟后消退了，但你仍然觉得比以前敏感得多。这需要一些时间来适应！");
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0)
         {
            _loc4_ = "";
            _loc4_ += param1.modFem(param1.isFemaleOrHerm() ? 90 : 61,4);
            if(_loc4_ != "")
            {
               outputText(_loc4_);
               set_changes(get_changes() + 1);
            }
         }
         if(param1.wetness() > 3 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(param1.hasVagina())
            {
               outputText("[pg]从你的[cunt]中不断流出的液体减慢了速度，让你感觉自己不再像个湿滑的性爱滑水道了。");
               _loc5_ = param1.vaginas[0];
               --_loc5_.vaginalWetness;
               set_changes(get_changes() + 1);
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && param1.fertility < 50 && param1.hasVagina())
         {
            param1.fertility += 2 + Utils.rand(5);
            set_changes(get_changes() + 1);
            outputText("[pg]你感觉有些奇怪。不知怎么的……感觉自己变得更容易受孕了。你不知道还能怎么形容，但你知道你的身体正渴望着怀孕和生子。");
         }
         if(param1.neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc3_);
         }
         if(param1.hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc3_);
         }
         if(Utils.rand(4) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc3_);
         }
         if(param1.hasVagina() && !param1.hasPerk(PerkLib.BunnyEggs) && get_changes() < get_changeLimit() && Utils.rand(4) == 0 && param1.bunnyScore() > 3)
         {
            outputText("[pg]在你的身体深处发生了一些变化。这让你感到有些头晕，但很快就过去了。除此之外，你不确定到底发生了什么，但你确信这种感觉源自你的子宫。[pg]");
            outputText("(<b>获得专长：兔蛋</b>)");
            param1.createPerk(PerkLib.BunnyEggs,0,0,0,0);
            set_changes(get_changes() + 1);
         }
         if(param1.balls > 0 && param1.ballSize > 5 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(param1.ballSize < 10)
            {
               outputText("[pg]随着你的[balls]直径缩小了大约一英寸，你的腹股沟感到一阵轻松。");
               --param1.ballSize;
            }
            else if(param1.ballSize < 25)
            {
               outputText("[pg]随着你的[balls]直径缩小了几英寸，你的腹股沟感到一阵轻松。哇，感觉动起来容易多了！");
               param1.ballSize -= 2 + Utils.rand(3);
            }
            else
            {
               outputText("[pg]随着你的[balls]直径缩小了至少六英寸，你的腹股沟感到一阵轻松。哇，感觉动起来太太太容易了！");
               param1.ballSize -= 6 + Utils.rand(3);
            }
            set_changes(get_changes() + 1);
         }
         if(param1.balls > 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]你的[sack]一阵紧缩，感觉越来越强烈，直到你弯下腰喘着粗气。当这种感觉过去后，你伸手往下摸，发现<b>你的两颗睾丸不见了。</b>");
            param1.balls -= 2;
         }
         if((param1.balls > 0 || param1.hasCock()) && param1.cumQ() < 3000 && Utils.rand(3) == 0 && get_changeLimit() > 1)
         {
            set_changes(get_changes() + 1);
            param1.cumMultiplier += 3 + Utils.rand(7);
            if(param1.cumQ() >= 250)
            {
               dynStats(DynStat.Lust(3));
            }
            if(param1.cumQ() >= 750)
            {
               dynStats(DynStat.Lust(4));
            }
            if(param1.cumQ() >= 2000)
            {
               dynStats(DynStat.Lust(5));
            }
            if(param1.balls > 0)
            {
               if(param1.cumQ() < 50)
               {
                  outputText("[pg]你的[balls]闪过一丝不适，但很快就消失了。你掂了掂你的蛋蛋，但它们的大小并没有改变——只是感觉更紧实了一点。");
               }
               else if(param1.cumQ() < 250)
               {
                  outputText("[pg]你的[balls]泛起一阵不适，但很快就消退成一种令人愉悦的酥麻感。你伸手往下试探性地掂了掂蛋蛋，但它们似乎并没有变大。");
                  if(param1.hasCock())
                  {
                     outputText("在这个过程中，你擦过[eachcock]，发现顶端渗出了一滴先列腺液。");
                  }
               }
               else if(param1.cumQ() < 750)
               {
                  outputText("[pg]你的[sack]传来一阵强烈的收缩，剧烈的程度几乎让你感到疼痛。");
                  if(param1.hasCock())
                  {
                     outputText("随着你身体的精液产量进一步提高，[Eachcock]渗出并滴落先列腺液，顺着你的[legs]流下。");
                  }
                  else
                  {
                     outputText("你皱了皱眉，感觉欲火焚身却又无法释放。你现在真希望自己有根肉棒。");
                  }
               }
               else if(param1.cumQ() < 2000)
               {
                  outputText("[pg]一阵高潮般的收缩席卷了你的[balls]，在这强力的球体中颤抖着，又像它来时一样迅速消散。");
                  if(param1.hasCock())
                  {
                     outputText("一条浓稠的黏液从[eachcock]顺着你的[leg]流下，在你身下汇聚成一滩。");
                  }
                  else
                  {
                     outputText("你闷哼了一声，感觉欲火焚身，急需释放。也许你应该弄根阴茎来配这些蛋蛋……");
                  }
                  outputText("很明显，你的精液产量又增加了。");
               }
               else
               {
                  outputText("[pg]一阵剧烈的收缩感传遍你的[balls]，随之而来的是身体精液分泌激增所带来的高潮般的快感。");
                  if(param1.hasCock())
                  {
                     outputText("先列腺液从[eachcock]中喷涌而出，顺着你的[leg]流下，溅落成一滩滩足以让普通[malespersons]的高潮自愧不如的水洼。你揉弄了自己几下，几乎就要当场自慰起来，但你控制住了自己，暂时忍耐了下来。");
                  }
                  else
                  {
                     outputText("你喘息着呻吟，但快感却变成了痛苦。你憋得太厉害了——要是能有什么办法把你所有的精液都发泄出来就好了！");
                  }
               }
            }
            else if(param1.cumQ() < 50)
            {
               outputText("[pg]一阵轻微的不适感传遍全身，但还没等你弄清楚到底是怎么回事，它就消失了。");
            }
            else if(param1.cumQ() < 250)
            {
               outputText("[pg]一阵不适感传遍全身，但随后化作一阵令人愉悦的酥麻感，直冲[eachcock]。你伸手试探性地掂了掂自己，看到先列腺液从你的雄性象征中渗出时，你露出了微笑。你的精液产量增加了！");
            }
            else if(param1.cumQ() < 750)
            {
               outputText("[pg]一阵强烈的收缩感传遍全身，强烈的程度几乎让你感到疼痛。[Eachcock]流出先列腺液，顺着你的[legs]滴落，你身体的精液产量变得更高了！哇，感觉有点……爽。");
            }
            else if(param1.cumQ() < 2000)
            {
               outputText("[pg]一阵高潮般的收缩折磨着你的腹部，颤抖着穿过你的中段，向下延伸到你的腹股沟。一条浓稠的粘液从[eachcock]流出，顺着你的[leg]流下，在你身下汇聚成一滩。很明显，你的身体现在正在产生更多的精液。");
            }
            else
            {
               outputText("[pg]一阵撕心裂肺的收缩在你的肠胃里回荡，随之而来的是你的身体进入精液生产超载状态的高潮感。先列腺液从[eachcock]中喷涌而出，顺着你的[legs]流下，溅落成一滩滩足以让那些低等[malespersons]的高潮相形见绌的水洼。你揉了自己几下，几乎要在原地开始自慰，但你控制住了自己，暂时忍住了。");
            }
         }
         if(param1.lowerBody.type != 12 && get_changes() < get_changeLimit() && Utils.rand(5) == 0 && param1.ears.type == 7)
         {
            if(param1.isTaur())
            {
               outputText("[pg]你四足的后半身突然抽搐，让你惊讶的前半身失去平衡，导致你踉跄着摔倒在一侧。疼痛蔓延全身，将你的身体扭曲成一个紧紧攥成一团的痛苦之球，肌腱融化，骨骼断裂、融化并重新生长。当它终于停止时，<b>你低头看到了你那双长满绒毛的新兔子脚</b>！");
            }
            else
            {
               outputText("[pg]麻木感包裹着你的[legs]，它们变得越来越紧。你失去平衡，一屁股跌坐在你的[ass]上[if (hasTail) {，差点把你的尾巴压扁|，摔得生疼}]，而变化正在你体内发生。当它完成后，<b>你发现你现在拥有了毛茸茸的兔子脚和腿</b>！");
            }
            set_changes(get_changes() + 1);
            param1.lowerBody.type = 12;
            param1.lowerBody.legCount = 2;
         }
         if(get_mutations().tfNoFur() && param1.ears.type == 7 && param1.face.type != 8 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]");
            set_changes(get_changes() + 1);
            if(BodyPartLists.HUMANISH_FACES.indexOf(param1.face.type) != -1)
            {
               outputText("你发现你的鼻子在视野边缘不受控制地抽动着，但当你把注意力集中在它上面时，它又停了下来。片刻之后，你的一些牙齿感到一阵刺痛，随后擦过你的嘴唇，露出一对白色的龅牙！<b>你的脸已经带上了一些兔子的特征！</b>");
            }
            else
            {
               outputText("当你的[face]扭曲重塑时，你忍不住闷哼出声。甚至连你的牙齿都在隐隐作痛，它们的位置被重新排列，以适应某种未知的全新秩序。当这个过程结束时，<b>除了不断抽动的鼻子和突出的龅牙外，你的脸看起来完全就是人类的模样。</b>");
            }
            param1.face.type = 8;
         }
         if(param1.ears.type != 7 && get_changes() < get_changeLimit() && Utils.rand(3) == 0 && param1.tail.type == 10)
         {
            outputText("[pg]你的耳朵抽动着向内卷曲，在头部的皮肉上滑动。它们变得越来越热，直到最后停留在你的头顶，并展开成一对毛茸茸的长兔耳。<b>你现在有了一对兔耳。</b>");
            param1.ears.type = 7;
            set_changes(get_changes() + 1);
         }
         if(param1.tail.type != 10 && Utils.rand(2) == 0 && get_changes() < get_changeLimit())
         {
            if(param1.hasTail())
            {
               outputText("[pg]你的尾巴在缩小的时候感到一阵灼热，它越来越紧地贴在你的臀部，直到只剩下一点点肉桩的痕迹。紧接着，白色的蓬松毛发从里面爆发出来。<b>你长出了一条白色的兔尾巴！甚至在你没注意的时候它还会自己抽动。</b>");
            }
            else
            {
               outputText("[pg]一股灼热的压力在你的脊椎处聚集，随后在一阵轻松感中消散。你向后摸去，发现了一条肉乎乎的小尾巴，上面正迅速长出长长、蓬松的毛发。<b>你长出了一条兔尾巴！</b>");
            }
            param1.tail.type = 10;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && param1.hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(param1.antennae.type != 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().removeAntennae();
         }
         if((param1.wings.type != 0 || param1.rearBody.type == 3) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().removeWings(_loc3_);
         }
         if(get_changes() == 0)
         {
            if(param1.get_lib100() < 100)
            {
               set_changes(get_changes() + 1);
            }
            dynStats(DynStat.Lib(1),DynStat.Lust(5 + param1.lib / 7));
            if(param1.get_lib100() < 30)
            {
               dynStats(DynStat.Lib(1));
            }
            if(param1.get_lib100() < 40)
            {
               dynStats(DynStat.Lib(1));
            }
            if(param1.get_lib100() < 60)
            {
               dynStats(DynStat.Lib(1));
            }
            if(param1.get_lib100() < 60)
            {
               if(!param1.hasCock() || param1.get_gender() == 3 && Utils.rand(2) == 0)
               {
                  if(param1.get_lib100() >= 30)
                  {
                     outputText("[pg]你张开嘴，开始因为欲望而喘息。天气变热了吗？你的手伸向你的[assholeOrPussy]，你突然感觉到它是如此的空虚。想要被填满的渴望，不是被手或手指，而是被一个强壮的男性，像波浪一样席卷了你，不断增加你对性的渴望。");
                  }
                  else
                  {
                     outputText("[pg]你扭动了一下，发现自己的目光向下瞥向了腹股沟。奇怪的想法涌上心头，你想知道一直交配直到你肿胀怀孕会是什么感觉。");
                     if(param1.cor < 25)
                     {
                        outputText("你对这种可耻的想法感到厌恶。");
                     }
                     else if(param1.cor < 60)
                     {
                        outputText("你担心这个地方真的在影响你。");
                     }
                     else if(param1.cor < 90)
                     {
                        outputText("你喘息着，想知道最近的能生育的男性在哪里。");
                     }
                     else
                     {
                        outputText("你因欲求不满而发出难耐的呻吟。你该尽快找人配种了！");
                     }
                  }
               }
               else if(param1.get_lib100() >= 30)
               {
                  outputText("[pg]你微张着嘴，因情欲而开始喘息。周围变热了吗？你的手不由自主地伸向[eachcock]，它紧绷而坚硬的触感让你忍不住呻吟出声。想要被紧紧包裹的渴望——不是用手，而是用紧致的小穴或收缩的后庭——如潮水般席卷全身，让你的性欲不断高涨。");
               }
               else
               {
                  outputText("[pg]你不安地扭动着身子，视线不由自主地向下瞥向自己的胯部。奇怪的念头涌上心头，你想知道操一只");
                  if(Utils.rand(2) == 0)
                  {
                     outputText("母野兔，直到她被满肚子的卵塞得动弹不得会是什么感觉。");
                  }
                  else
                  {
                     outputText("双性兔子，直到她的阴囊肿胀到只能靠一遍又一遍地自慰来恢复行动能力会是什么感觉。");
                  }
                  if(param1.cor < 25)
                  {
                     outputText("你对这种可耻的想法感到厌恶。");
                  }
                  else if(param1.cor < 50)
                  {
                     outputText("你担心这个地方真的在影响你。");
                  }
                  else if(param1.cor < 75)
                  {
                     outputText("你微微喘息着，想知道最近的能生育的雌性在哪里。");
                  }
                  else
                  {
                     outputText("你因欲望和失望而咕哝呻吟。天哪，你需要做爱！");
                  }
               }
            }
            else if(param1.get_lib100() < 80)
            {
               outputText("[pg]你扇着脖子，开始喘息，你[skinTone]的皮肤开始因发热而泛红[if (hasPlainSkin == false) {，透过你的[skinDesc]都能看出来}]。");
               switch(param1.get_gender())
               {
                  case 0:
                     outputText("性饥渴似乎在啃噬着你的[asshole]，叫嚣着要被填满，但你努力抵抗着高涨的性欲。这真的、真的太难了。");
                     break;
                  case 1:
                     outputText("当[eachcock]在你的[armor]下紧绷时，压迫感随之收紧。你努力压抑着高涨的性欲，但这很难——真的太难了。");
                     break;
                  case 2:
                     outputText("你迅速充血的外阴间泛起湿意，让你在试图压抑高涨的性欲时忍不住扭动摩擦，但这很难——真的太难了。");
                     break;
                  case 3:
                     outputText("当[eachcock]开始在你的[armor]下紧绷时，湿热感和紧绷的压迫感在你的腹股沟处争夺着你的注意力。你的外阴充血肿胀，变得越来越湿滑。你拼命想要压抑高涨的性欲，但这真的、真的太难了。交配的冲动在你的脑海中挥之不去，随时可能爆发。");
               }
            }
            else
            {
               outputText("[pg]甜美而无法满足的欲望在你体内不断攀升，直到你越来越难以将其压抑。一个微弱却喋喋不休的声音在质问你，为什么非要压抑它呢。屈服于欲望去交配的感觉是如此美妙，以至于你几乎当场就要向这个诱人的想法妥协。生活开始变得越来越像是在情欲的迷雾中不断地做爱或自慰，而你越来越觉得这也没什么不好的。");
               if(param1.cor < 33)
               {
                  outputText("你叹了口气，试图不让自己完全屈服。");
               }
               else if(param1.cor < 66)
               {
                  outputText("你喘息着呻吟，不确定自己还能抵抗多久，甚至不知道自己是否还想抵抗。");
               }
               else
               {
                  outputText("你微笑着，想知道自己是否能");
                  if(param1.get_lib100() < 100)
                  {
                     outputText("让你的性欲变得更高。");
                  }
                  else
                  {
                     outputText("现在就找个人干一炮。");
                  }
               }
            }
         }
         param1.refillHunger(20);
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,2077,FlagDict_Impl_.arrayReadInt(_loc6_,2077) + get_changes());
         return false;
      }
   }
}

