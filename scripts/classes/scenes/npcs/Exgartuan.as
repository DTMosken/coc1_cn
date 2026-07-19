package classes.scenes.npcs
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.scenes.Camp;
   import flash.Boot;
   import haxe.IMap;
   
   public class Exgartuan extends NPCAwareContent implements TimeAwareInterface
   {
      
      public var checkedExgartuan:int;
      
      public function Exgartuan()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         checkedExgartuan = 0;
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         §§push(false);
         §§push(false);
         §§push(false);
         var _loc1_:int;
         checkedExgartuan = (_loc1_ = checkedExgartuan) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_player().hasStatusEffect(StatusEffects.Exgartuan));
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().statusEffectv2(StatusEffects.Exgartuan) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_game().time.hours == 4);
         }
         if(§§pop())
         {
            if(get_player().hasCock() && get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && Utils.rand(3) == 0 && get_player().get_hoursSinceCum() >= 24)
            {
               outputText("[pg]");
               exgartuanSleepSurprise();
               return true;
            }
            if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && Utils.rand(3) == 0)
            {
               outputText("[pg]");
               boobGartuanSURPRISE();
               return true;
            }
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:Boolean = false;
         checkedExgartuan = 0;
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && (!get_player().hasCock() || get_player().cockArea(0) < 100))
            {
               outputText("[pg]<b>你突然感到一阵尿意，于是停在一些灌木丛旁。这次尿尿的时间比平时长得多得多，当你尿完后，你意识到自己很长一段时间以来第一次独自一人了。也许你变得太小了，埃克斯加图安受不了了？</b>[pg]");
               awardAchievement("尿急惹祸",113,true,false,true);
               get_player().removeStatusEffect(StatusEffects.Exgartuan);
               _loc1_ = true;
            }
            else if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && get_player().biggestTitSize() < 12)
            {
               outputText("[pg]<b>黑色的乳汁从你的[nipple]滴落。它立刻消散在空气中，让你感到孤独。看来你变得太小了，埃克斯加图安受不了了！[pg]</b>");
               get_player().removeStatusEffect(StatusEffects.Exgartuan);
               _loc1_ = true;
            }
            else if(get_player().statusEffectv2(StatusEffects.Exgartuan) > 0)
            {
               get_player().addStatusValue(StatusEffects.Exgartuan,2,-1);
               if(get_player().statusEffectv2(StatusEffects.Exgartuan) == 0)
               {
                  outputText("[pg]<b>");
                  exgartuanBored();
                  outputText("</b>[pg]");
                  _loc1_ = true;
               }
            }
            else
            {
               if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
               {
                  if(get_player().hasStatusEffect(StatusEffects.Infested))
                  {
                     outputText("[pg]<b>");
                     exgartuanWormCure();
                     outputText("</b>[pg]");
                     _loc1_ = true;
                  }
                  else if(Utils.rand(10) == 0 && get_player().get_armor().get_supportsBulge())
                  {
                     outputText("[pg]<b>");
                     exgartuanArmorShift();
                     outputText("</b>[pg]");
                     _loc1_ = true;
                  }
                  else
                  {
                     dynStats(DynStat.Lust(1 + Utils.rand(2)));
                  }
               }
               if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && get_player().biggestTitSize() >= 12)
               {
                  if(int(get_game().time.hours % 9) == 0)
                  {
                     if(Utils.rand(3) == 0)
                     {
                        outputText("[pg]<b>");
                        exgartuanLactationAdjustment();
                        outputText("</b>[pg]");
                        _loc1_ = true;
                     }
                     else if(Utils.rand(3) == 0)
                     {
                        outputText("[pg]<b>");
                        if(Utils.rand(2) == 0)
                        {
                           outputText("你感到全身温暖而刺痛，舒服极了。等一下，你的手正在玩弄你的[breasts]。你猛地把手抽开，但这只会让埃克斯加图安发出恶魔般愉悦的笑声！");
                        }
                        else
                        {
                           outputText("你的双手揉捏爱抚着你的[breasts]，急切地触摸着每一寸柔软的肌肤。当你意识到自己在做什么时，你倒吸了一口凉气，猛地把手抽开");
                           if(get_player().cor < 50)
                           {
                              outputText("，对自己受恶魔指使而堕落感到愤怒");
                           }
                           outputText("。");
                           dynStats(DynStat.Lust(5 + get_player().sens / 10));
                        }
                        outputText("</b>[pg]");
                        _loc1_ = true;
                     }
                     else
                     {
                        dynStats(DynStat.Lust(1 + Utils.rand(2)));
                     }
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function leaveBeePostRape() : void
      {
         clearOutput();
         outputText("你残忍地笑了笑，轻轻拍了拍她闪闪发光的外阴，然后转身离开，把她绑在那里。也许一些寂寞的小恶魔会觉得她有用……");
         doNext(get_camp().returnToCampUseOneHour);
         dynStats(DynStat.Cor(0.5));
      }
      
      public function freeBeePostRape() : void
      {
         clearOutput();
         outputText("你怜悯这个荡妇，解开了她的束缚。希望她能在遇到更糟的事情之前恢复过来。你可不想让触手怪捡你的破鞋。");
         doNext(get_camp().returnToCampUseOneHour);
         dynStats(DynStat.Cor(-1));
      }
      
      public function fountainEncounter() : void
      {
         clearOutput();
         outputText("在沙漠中漫游时，你开始感觉到空气中的变化。随着你不断前进，原本干燥的空气变得越来越潮湿。终于，你翻过一个沙丘，发现了湿气的来源——一个巨大的黑玛瑙喷泉，正向空中喷洒着清澈的水。喷泉的中心是一座宏伟的雕塑，雕刻着两个交缠的恶魔形态，赤身裸体，比例夸张到了极点。水从一些相当……不寻常的地方喷射出来。你脸红了，虽然感到有些口渴，但对喷泉的性质保持警惕。[pg]");
         outputText("你走近一看，发现了一块牌匾。上面写着：“天赋之泉”。很明显，它应该是用来增强某种东西的，但代价是什么呢？[pg]");
         outputText("你要喝喷泉里的水吗？");
         doYesNo(drinkFountainEndowment,get_camp().returnToCampUseOneHour);
      }
      
      public function exgartuanWormCure() : void
      {
         outputText("你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else
         {
            outputText("腹股沟");
         }
         outputText("开始变得温暖……不，是发烫。你感觉到它在不舒服地移动和蠕动，你体内的蠕虫在扭动，似乎被什么东西激怒了。热量加剧，你震惊又恐惧地看着它们开始从你的尿道爬出，顺着浓稠的精液河流滑落到地上。你痛得弯下腰，感觉有什么东西把你撑得很大，你感觉到主蠕虫正拼命地想从你的[cock]里挤出来。它爬到了顶端，扭动着，卡住了一会儿，拼命挣扎着想要挣脱。最后它终于弹了出来，掉在地上爬走了。埃克斯加图安咆哮道，[say: 别再回来了！]");
         outputText("[pg]你猜这里大概只能容得下其中一个……");
         get_player().removeStatusEffect(StatusEffects.Infested);
      }
      
      public function exgartuanSleepSurprise() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_exgartuan());
         if(get_player().cor <= 20 && get_player().hasPerk(PerkLib.BulgeArmor))
         {
            outputText("一阵微风拂过你的脸庞，慢慢吹散了你好不容易才享受到的那点睡意。随着你的眼睛慢慢睁开并适应光线，你开始隐约透过你的" + get_camp().homeDesc() + "的布料，看到高挂在天空中的红月。仅有的一点光亮来自你营火微弱的残余，此时已经只剩下余烬了。你慢慢转过头看向温暖的来源，却发现你的[cabin]入口仍然大开着。当你开始伸懒腰准备醒来时，脸上露出一丝苦相，但当你意识到自己还穿着[armor]时，动作停了下来。快速而迷糊地瞥了一眼，你还发现自己竟然在[bed]上睡着了，而不是舒服地窝在里面。[pg]");
            outputText("你坐起身来，双手滑过额头，穿过你的[hair]，享受着一次放松的深呼吸。既然你看起来没有变形，也没有受到任何明显的粗暴对待，你最好的猜测是你在铺[bed]的时候睡着了。你太累了，不想再和自己争论这个问题，你开始脱光衣服，脑海中想着回到幸福的梦乡，这缓解了你挥之不去的担忧。");
            if(get_player().get_armorName() != "crotch-hugging slutty swimwear" && get_player().get_armorName() != "crotch-hugging revealing chainmail bikini")
            {
               outputText("你一件一件地脱下你的[armor]，只留下你最喜欢的恶魔如此慷慨地[say: 赠送]给你的那件被魔法改变过的核心部件。[pg]");
            }
            else
            {
               outputText("你怒视着你的[armor]，它被改变的状态是你胯下那个总是那么体贴的恶魔如此慷慨地赐予你的。[pg]");
            }
            outputText("在无精打采地盯着你被迫的暴露狂行为几秒钟后，你的睡眠焦虑占了上风。你弯下腰开始脱下这件物品……却发现它纹丝不动。它就像粘在你的皮肤上一样，抵抗着任何把它从你腹股沟解开的动作。在摆弄了几秒钟后，你发出一声恼怒的呻吟。你现在绝对没有心情去和它作斗争，也不想再去追究是谁干的，你伸出手拉起被子。当你看着那难看的凸起时，又一声叹息从你的唇间溜出，然后你躺回枕头上，闭上了眼睛。[pg]");
            doNext(exgartuanBulgeTortureII);
            return;
         }
         outputText("半夜里，有什么东西打断了你相对平静的睡眠。曾经美好的梦境在瞬间扭曲变成了噩梦！你在干呕，甚至在窒息，无论你怎么扭动和挣扎，你都无法呼吸！一阵阵的恐惧让你的心脏猛烈跳动，以极快的速度把你拉回清醒状态。你猛地睁开眼睛，试图坐起来，但腹股沟和喉咙传来的剧痛把你固定在原位。你完全惊慌失措，在受限的视野允许的范围内尽可能往下看，然后惊恐地退缩了。你那根青筋暴起、肿胀的[cock]深深地卡在你的喉咙里，它弯曲着、剧烈地抽动着，力度大到足以用轻柔的半程抽插动作进出。[pg]");
         outputText("随着你的横膈膜狂野地痉挛，你拼命地想要吸进一口气。但这没用，吸力只会让你那根被恶魔附身的阴茎在你喉咙收缩的环带里变得更大更粗。舌头上的味道很浓，快感和你的恐慌同等程度地上升，直到黑暗笼罩了你的视野边缘。你的背部随着身体的挣扎而弓起，你气道后部打开得足够大，让你能通过鼻孔吸入满满一肺的空气。你不会被自己肿胀的肉棒憋死的认知冲刷掉了恐慌，只留下被迫口交的快感。[pg]");
         outputText("一个声音在你的脑海中回荡，[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,103) == 0)
         {
            outputText("这他妈才是取悦鸡巴的方法！如果你不打算照顾我们的需求，那我就自己来！如果必须的话，每天晚上都来！");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,103) < 2)
         {
            outputText("哦，拜托，还记得你上次高潮得多厉害吗？你为什么不用手撸一撸柱身，我看看能不能往你肚子里射更多。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,103) < 10)
         {
            outputText("我们现在已经做过多少次了？你可能早就该习惯晚上给自己口交，别再大惊小怪了。既然你醒了，那就把舌头用起来，开始撸吧。我感觉要大爆发了！");
         }
         else
         {
            outputText("醒醒，小懒虫。你知道规矩的。来吧，");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("用你的奶子夹住我，用力挤");
            }
            else
            {
               outputText("用你的手臂环抱住我，开始撸");
            }
            outputText("。我们可真饥渴，不是吗，我那欲求不满的小勇者？");
         }
         outputText("[sayend][pg]");
         if(get_player().cor < 33)
         {
            outputText("你用双手抓住那根变态的肉棒，不是为了撸它，而是试图用武力把入侵者从你的口腔里撬出来。它的表面布满了汗水和先列腺液，滑溜溜的，你的手不可阻挡地滑向了");
            if(!get_player().hasSheath())
            {
               outputText("根部");
            }
            else
            {
               outputText("包皮");
            }
            outputText("，而不是把它拔出来。意外的抚摸让你那被附身的叛逆肉体传来阵阵快感，你的双眼不由得变成了斗鸡眼。双手开始不受控制地抽插，自动将那根肿胀的恶魔肉棒往你嘴里送");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("，并让你的" + get_player().allBreastsDescript() + "在它周围弹跳");
            }
            outputText("。愉悦的呻吟让你喉咙里卡着的" + get_player().cockHead() + "震颤起来，湿润的泡泡开始顺着食管下半部滑入你的胃里。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,103) < 5)
         {
            outputText("你双手握住那根被恶魔寄生的巨大器官，认命了。就算你现在阻止了埃克斯加图安，等你睡着后他还是会重来一次。沾满先列腺液、青筋暴起的表面在你的指间滑动，通过你的神经系统传递出杂乱的快感。这种感觉让你双眼迷离，你甚至对着自己的" + get_player().cockHead() + "发出了渴求的呻吟。它愉悦地颤动着，将几股先列腺液射入你的胃里，同时");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你用二头肌挤压着乳房，将你的[cock]夹在中间");
            }
            else
            {
               outputText("你挤压并抚摸着你的[cock]");
            }
            outputText("。随着双手撸动的速度越来越快，你完全沉浸在血管中燃烧的堕落欲望里。[pg]");
         }
         else
         {
            outputText("你双手握住肿胀的肉体开始套弄，沉醉于手掌在沾满先列腺液、青筋暴起的肉体上滑动的触感。你开心地发出咕噜声，愉悦的呻吟让你食管里的" + get_player().cockHead() + "震颤起来。肿胀的龟头将一团团先列腺液顺着你被撑开的喉咙，直接射入你饥渴的胃里。你双眼迷离，双手全神贯注地抚摸着自己的阴茎，很快就忘记了被这样叫醒的恼怒。像这样操自己的时候，你高潮得简直要爽翻了！");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你的二头肌挤压着你的" + get_player().allBreastsDescript() + "，将它们揉压在你的[cock]上，增添了更多的快感。");
               if(get_player().hasFuckableNipples() && get_player().biggestLactation() > 1)
               {
                  outputText("奶水和润滑液");
               }
               else if(get_player().hasFuckableNipples())
               {
                  outputText("润滑液");
               }
               else if(get_player().biggestLactation() > 1)
               {
                  outputText("奶水");
               }
               if(get_player().hasFuckableNipples() || get_player().hasFuckableNipples())
               {
                  outputText("从你的[nipple]流出，在弹跳的乳沟里积聚成一滩，把你的胸部变成了肉棒的滑水道。");
               }
            }
            outputText("[pg]");
         }
         if(get_player().get_gender() == 3)
         {
            if(get_player().balls == 0)
            {
               outputText("那");
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("肿胀的");
               }
               else if(get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("闪闪发光的");
               }
               else
               {
                  outputText("滴着水的");
               }
               outputText("皮肤已经充血准备就绪，但你贪婪的阴道却得不到任何快感。凉爽的夜风吹过暴露在外的");
               if(get_player().hasScales())
               {
                  outputText("鳞片");
               }
               else
               {
                  outputText("皮肤");
               }
               outputText("包裹着你的私处，用最微弱的触感挑逗着你，而你那无知的手却在埃克斯加图安的命令下蹂躏着你的[cock]。如果你早点解决自己的需求，你也许就能控制住自己，把手指滑进你的" + get_player().vaginaDescript(0));
               if(get_player().getClitLength() > 3)
               {
                  outputText("或者抚摸你的[clit]");
               }
               outputText("来完全满足你所有的欲望。");
               outputText("[pg]");
            }
            else
            {
               outputText("那");
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("肿胀的");
               }
               else if(get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("闪闪发光的");
               }
               else
               {
                  outputText("滴着水的");
               }
               outputText("外阴唇的皮肤已经充血准备就绪，但由于你的双手如此专注于你的[cock]，你的" + get_player().vaginaDescript(0) + "几乎感觉不到什么。它能感受到的最接近快感的东西，就是你的[sack]随着你自慰的稳定节奏拍打在它上面的感觉。如果你早点解决自己的需求就好了！你也许就能对你那叛逆的工具拥有足够的控制力，让一只手去照顾你其他的需求。[pg]");
            }
         }
         outputText("唾液在肿胀的入侵者周围起泡，这是由于埃克斯加图安对你的[face]的愤怒而无法控制的活塞运动所产生的。你自己那紧绷、鼓胀的肉棒被深深地塞进你自己的喉咙里，以至于你能感觉到先列腺液滴进你的胃里，但你想要的更多。");
         if(get_player().cor < 33)
         {
            outputText("这种欲望让你感到震惊，因为它纯粹是……错误的，但你无法否认钻进自己流着口水的嘴里的快感。");
         }
         else if(get_player().cor < 66)
         {
            outputText("这种欲望将它的钩子深深扎进你那被欲望冲昏头脑的肉体中，把你拖入更深的欲望深渊。你无法否认钻进自己流着口水的嘴里的快感。");
         }
         else
         {
            outputText("当你想象自己现在的样子时，这种欲望在你的血液中奔涌：四肢摊开，翻着白眼，肉棒钻进自己流着口水的嘴里。");
         }
         outputText("滚烫的液体压力滑过你的[cock]底部，湿漉漉地舔舐着那跳动着、充满需求的恶魔肉棒。你那不受控制的舌头的注意力达到了预期的效果，你欢愉的叫声被你自己厚实的肉体和它迅速扩张的尿道所掩盖。[pg]");
         outputText("如果有人在看");
         if(get_jojoScene().campCorruptJojo())
         {
            outputText("，而且从乔乔高亢的呜咽声来看，他肯定在看，");
         }
         outputText("他们会看到肉棒因为沉重的负担而鼓胀，因为它被泵入你的嘴唇。完全膨胀的精液管撑大了你的嘴，痛苦地拉伸着你的下巴，并将它那乳白色的货物倾倒进它那心甘情愿的容器里。你的肚子发出咕噜声，因为它正在适应那");
         _loc1_ = int(get_player().cumQ());
         if(_loc1_ < 50)
         {
            outputText("出乎意料的轻");
         }
         else if(_loc1_ < 150)
         {
            outputText("粘稠的");
         }
         else if(_loc1_ < 300)
         {
            outputText("又大又粗的");
         }
         else if(_loc1_ < 800)
         {
            outputText("长长的一大股");
         }
         else
         {
            outputText("量大惊人的");
         }
         outputText("精液。当你被");
         if(_loc1_ < 500)
         {
            outputText("注入");
         }
         else
         {
            outputText("灌满");
         }
         outputText("时，周围的空气中回荡着微弱的、几乎听不见的挤压声，伴随着淫秽的液体晃动声。你的肌肉紧绷，你的[hips]和" + get_player().assDescript() + "随着你的背部抬离地面");
         if(get_player().balls > 0)
         {
            outputText("并且你的[balls]因为用力而紧紧贴在你的腹股沟上");
         }
         outputText("。");
         _loc1_ = int(get_player().cumQ());
         if(_loc1_ > 500)
         {
            outputText("你的肚子上迅速隆起一个渐进的弧度");
            if(_loc1_ > 1500)
            {
               outputText("，但这并没有停止。它不断变大，直到你看起来像怀孕一样饱满。");
            }
            else
            {
               outputText("。");
            }
            if(_loc1_ > 2500)
            {
               outputText("背压将你的[cock]从囚禁你的口腔中喷射出来，伴随着喷泉般的精液，而你则虚弱地试图咳出足够的精液来呼吸。");
            }
         }
         outputText("[pg]");
         if(get_jojoScene().campCorruptJojo())
         {
            outputText("老鼠精液喷洒在木头上的声音传到了你的耳朵里，给你的脸上带来了一丝渴望的微笑。那只荡妇老鼠真是个偷窥狂！");
         }
         outputText("当埃克斯加图安萎缩时，你的眼睛慢慢向下翻，留下了一道令人愉悦的、白色的顺从痕迹");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("在你的胸前");
         }
         else
         {
            outputText("在你的乳房之间");
         }
         outputText("并穿过你的肚子，然后他撤退了。高潮的快感在你的脑海中依然清晰，但疲惫很快取代了它。你决定在早上清理这个烂摊子，因为你的眼皮已经开始打架了。性爱的气味像云一样笼罩着你打瞌睡的身体，让你的梦境不会偏离你的阴茎太远……");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(1),DynStat.Cor(1));
         if(get_player().get_lib100() < 60)
         {
            dynStats(DynStat.Lib(1));
         }
         else if(get_player().get_lib100() < 80)
         {
            dynStats(DynStat.Lib(0.5));
         }
         else
         {
            dynStats(DynStat.Lib(0.25));
         }
         dynStats(DynStat.Lust(10));
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,103,FlagDict_Impl_.arrayReadInt(_loc2_,103) + 1);
         get_player().slimeFeed();
         get_player().changeStatusValue(StatusEffects.Exgartuan,2,25);
         doNext(playerMenu);
      }
      
      public function exgartuanNagaStoleMyMasturbation() : void
      {
         spriteSelect(SpriteDb.get_s_exgartuan());
         clearOutput();
         if(get_player().cor < 15)
         {
            outputText("你怯生生地找了些石头躲起来，脱下衣服。[say: 想独占我吗，荡妇？想怎么藏就怎么藏，你永远也压制不住我，]埃克斯加图安幸灾乐祸地说。[pg]");
         }
         outputText("真烦人……");
         if(get_player().cor <= 25)
         {
            outputText("你确保四下无人，然后脱光衣服。埃克斯加图安责骂道：[say: 是的，勇者，在阴影里打滚吧。继续假装你能把我的光辉藏起来。]");
         }
         else if(get_player().cor <= 50)
         {
            outputText("你高兴地脱下[armor]，渴望取悦自己。当你脱下最后一件衣服时，你被附身的肉棒高兴地跳动着。");
         }
         else if(get_player().cor <= 75)
         {
            outputText("你夸张地脱光衣服，希望有人能看到。埃克斯加图安开始用欲望淹没你，以回应你的主动。");
         }
         else
         {
            outputText("你脱光衣服，一边抚摸着自己调皮的部位，一边向四周投去诱惑的目光，希望附近有什么人或东西能来操你。你体内的恶魔肉棒高兴地跳动着，急切地想继续这场狂欢。");
         }
         outputText("[pg]");
         if(get_player().cor < 33)
         {
            outputText("你已经厌倦了恶魔不断的嘲弄，终于决定屈服于他强加的诱惑。与其让事情失控，不如现在就解决掉。虽然摆弄你的肉棒感觉很满足，但你体内那个堕落的乘客总能在你恢复理智后，让你觉得这很不对劲。当你感觉到你的[cock]慢慢从滑溜溜的缝隙中伸出来时，你的疑虑很快就开始消散了");
            if(get_player().cockTotal() == 2)
            {
               outputText("，你剩下的工具不请自来地藏在你体内。");
            }
            else if(get_player().cockTotal() >= 3)
            {
               outputText("，你剩下的肉棒不请自来地藏在你体内。");
            }
            else
            {
               outputText("。");
            }
            outputText("埃克斯加图安到底是怎么做到——[say:没时间让你那贫弱的大脑去理解我的力量了，勇者，]你的肉棒打断了你，[say:我可不想在有机会之前让你伤到自己。]现在你真的想赶紧结束这一切。伴随着一声沮丧的叹息和肩膀的预备性伸展，你伸手下去准备干这件脏活。[pg]");
            outputText("好吧，你本来是这么打算的。但你的双臂僵在了你那邪恶的肉棒上方。[say:今天我不需要你那毫无经验的笨拙摸索，我饥渴的小荡妇。坐好，准备在我的震撼下颤抖吧。][pg]");
         }
         if(get_player().cor > 33 && get_player().cor < 66)
         {
            outputText("你不应该期待这个的，对吧？");
            outputText("你甚至还没完全弄清楚，在这些过程中获得的快感到底有多少是真实的。但这并不妨碍它的美味。[say:怎么了，[name]，]你那变态的肉棒插话道，显然是对你内心的冲突做出了反应，[say:有顾虑了？你该不会突然觉得我提供的乐趣配不上你了吧？][pg]");
            outputText("不，等等，很他妈明显你喜欢这种操干；你他妈无法忍受的是这个该死的恶魔。你心想。操。你摇了摇头，试图理清思绪，把注意力集中在你来这里的目的上。你勃起的[cock]已经从你那滑腻的缝隙中探了出来");
            if(get_player().cockTotal() == 2)
            {
               outputText("，你剩下的工具仍然不请自来地藏在你的体内。");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("，你剩下的肉棒仍然不请自来地藏在你的体内。");
            }
            else
            {
               outputText("。你俯下身去拥抱恶魔，但你的双臂在你碰到他之前就僵住了。当然了。[say:你饿了吗，勇者？]埃克斯加图安嘲讽道，微微颤动着进一步刺激你，[say:想想你那么急不可耐地想要找点乐子。但我今天有别的计划。][pg]");
            }
         }
         else
         {
            outputText("好了，别再胡闹了；你一辈子都在期待这个。就像你每次能和这位神圣的鸡巴之神亲密接触时说的那样，没必要再在空想上浪费时间了；你身上就有真家伙。或者说在你体内，当你开始将恶魔从你那蛇一般的缝隙中哄出来，慢慢地将他揉搓到完全尺寸时。[say:哦，对，就在我的龟头下面。感觉太棒了，]埃克斯加图安似乎永远也得不到足够的你。但当他感觉如此该死的美妙时，你又怎么能抗拒呢？");
            if(get_player().cockTotal() == 2)
            {
               outputText("说到抗拒，看来你的第二根工具被迫留在了棚子里。");
            }
            else if(get_player().cockTotal() >= 3)
            {
               outputText("说到抗拒，看来你剩下的工具被迫留在了棚子里。");
            }
            outputText("你的[cock]履行了它的承诺，泵出源源不断的润滑液，让你大师级的按摩在它的表面更加顺滑。你停下来片刻，欣赏你的杰作，你那恶魔般的肉棒现在充满了血液，像树一样又高又粗，正快乐地跳动着。流遍你全身的堕落温暖和舒适感让你无比愉悦。[pg]");
            outputText("[say:[name]，我真高兴能和你在一起，]肿胀的恶魔用一种令人惊讶的愉悦语气赞美你，[say:有你的肉棒按摩，即使是永恒也显得太短了。不过，我今天想尝试点别的。像你这样的荡妇应该会喜欢的。]你接受了赞美，对你的犯罪伙伴到底有什么打算很感兴趣，于是你向后靠去，欣赏这场表演。[pg]");
         }
         outputText("首先是一阵突然的翻滚，让你仰面朝天，你长长的尾巴在你面前甩动。恶魔已经控制了你腰部以下直到你那长而有力的蛇身尖端的身体。你只能作为一个旁观者沉浸在这个角色中，看着你的尾巴尖几乎吻上了你[cock]的开口，将自己埋没在恶魔的先列腺液池中。");
         if(get_player().cor < 50)
         {
            outputText("在一个你只能用令人震惊的恶意来形容的举动中，你的尿道尽可能地张开，邀请你的尾巴进一步涂抹自己。你辨认出一阵低沉、险恶的笑声刺入你的脑海，它的主人是谁显而易见。在咬紧牙关喘息了几个痛苦的瞬间后，你的后端伴随着一声湿润的爆裂声出现了。当然，你那被腐化的神经对这种变态的表演只做出了愉悦的反应；你害怕有一天你无法区分这两者。");
         }
         outputText("被附身的肉棒在它能触及的所有下半身部位运作，与你被借用的身体合作，尽可能均匀地涂抹双方。[pg]");
         if(get_player().get_inte() > 9)
         {
            outputText("你不傻；你不仅能猜到接下来会发生什么。");
         }
         else
         {
            outputText("你可能很傻，但现在发生的事情非常清楚。");
         }
         outputText("埃克斯加图安结束了那点可怜的前戏，用你湿润的尾巴缠绕住你那巨大的肉棒。");
         if(get_player().cocks[0].cockLength >= get_player().get_tallness() * 0.5)
         {
            outputText("然而，你的身体还不足以完全包裹住这座饥渴的纪念碑。它的龟头从鳞片火山的顶部探出，继续喷吐着它那不那么炽热的熔岩。");
         }
         else
         {
            outputText("尽管埃克斯加图安在这片土地上拥有令人惊叹的巨大尺寸，但你的尾巴完全有能力用它布满鳞片的怀抱将这个庞然大物完全包裹起来。");
         }
         outputText("这里展现出的压力是巨大的。恶魔那老虎钳般的紧握，就像他的许多壮举一样，在专业与疯狂的边缘摇摇欲坠：你根本无法理解这么强烈的挤压怎么还没有越过从快感到痛苦的界限。你只能感觉到你上半身的关节弯成了直角，在令人满足的强迫下紧绷着。[pg]");
         outputText("你那卑鄙的肉棒进入了它邪恶计划的第二阶段：套弄。起初很慢；当每一圈湿滑的尾巴滑过时，你都能感觉到每一个小凸起的反应，这种感觉和其他一切一样令人疯狂地满足。当你的尾巴尽可能高地抬起，将你邪恶肉棒的根部暴露在空气中时，你感觉你的中段仿佛被拉伸了。过山车般的体验充满了期待。你享受着这段旅程在第一次爬升时不断累积的快感。现在你悬在数百英尺的高空，你的座驾正一点点靠近悬崖边缘。你可以看到前方等待着你的一切，但你永远无法预知它在实际行动中会如何上演。你所能做的就是把指甲深深掐进安全带里，然后——伟大的地精幽灵啊！恶魔已经开始行动了，你的尾巴前一秒还在你的根部触底，下一秒就只在挑逗你的龟头。鳞片拍打大面积表面的声音在空气中回荡。你开始纳闷，为什么对你腹股沟的反复击打没有造成伤害，但你的大脑已经被你超大尺寸肉棒受到的刺激所迷住了。即使你没有因为高潮而瘫痪，你也知道最好不要去试图理解你那被附身的鸡巴的所作所为。[pg]");
         outputText("自我刺激绝不应该感觉这么好。这甚至都不像是在自慰。你对这个行为所能贡献的只有紧握的双拳、各种声音和不断变化的表情。");
         if(get_player().cor < 33)
         {
            outputText("[say:你根本配不上这种程度的待遇，勇者，]埃克斯加图安侮辱着你，随着湿滑的按摩持续进行，他的声音也在颤抖，[say:但别以为我允许你偷懒。像你这样的荡妇可以继续做梦；也许有一天你会有毅力接近这个水平。]");
         }
         else if(get_player().cor < 66)
         {
            outputText("你那堕落的鸡巴开始说话了，恶魔无情的动作拒绝放缓，[say:你喜欢这一切，勇者。你的感官中没有一丝犹豫。要是你一直都这么顺从就好了。]");
         }
         else
         {
            outputText("[say:这不是很棒吗，[name]？结合我们俩的性爱技巧，我们很快就能征服这片土地，并在任何空闲时间里爽个痛快。]");
         }
         outputText("你已经到了理智的边缘，恶魔的话语触发了你的释放。你能感觉到一股");
         if(get_player().cumQ() < 50)
         {
            outputText("适量的");
         }
         else if(get_player().cumQ() < 150)
         {
            outputText("相当粘稠的");
         }
         else if(get_player().cumQ() < 300)
         {
            outputText("极其浓厚的");
         }
         else if(get_player().cumQ() < 800)
         {
            outputText("量大惊人的");
         }
         else
         {
            outputText("史诗般的");
         }
         outputText("精液顺着你的[cock]向上涌动……然后停住了。你不由自主地坐起身来，试图释放压力，却迎面撞上了你那盘绕起来的肉棒弯曲着凑到你的脸上，它的尿道口大张着……[pg]");
         outputText("用恶魔般的精液袭击涂满了你的脸和上半身后，埃克斯加图安回到了你蛇一般的裂隙中。他松开了对你尾巴的抓握，留给你去解开他留下的纠缠不清的烂摊子。但你正忙着躺下放松。没有想法，没有沉思，没有问题，没有怀疑……你那被精液浸透的脑袋里一片空白。还有什么好说的呢？");
         get_player().changeStatusValue(StatusEffects.Exgartuan,2,16 + Utils.rand(7));
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function exgartuanMasturbation() : void
      {
         clearOutput();
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            spriteSelect(SpriteDb.get_s_exgartuan());
            if(get_player().cor < 15)
            {
               outputText("你怯生生地找了一些岩石躲起来，在那里脱掉了衣服。埃克斯加图安大声抱怨道：[say: 别他妈磨蹭躲藏了。我希望有人能撞见这个！][pg]真恶心……[pg]");
            }
            if(get_player().cor >= 15 && get_player().cor < 30)
            {
               outputText("你确保自己是独自一人，然后脱光了衣服。埃克斯加图安嘟囔道：[say: 你为什么要等到没人的时候？如果有只魅魔偶然发现我们，那不是很有趣吗？][pg]");
            }
            if(get_player().cor >= 30 && get_player().cor < 60)
            {
               outputText("你高兴地脱下你的[armor]，渴望取悦自己。你被附身的[cock]快乐地跳动着。[pg]");
            }
            if(get_player().cor >= 60 && get_player().cor < 80)
            {
               outputText("你以一种夸张的方式脱光衣服，希望有人在看。你腹股沟处被恶魔附身的器官快乐地跳动着，让你充满欲望，作为对你态度的奖励。[pg]");
            }
            if(get_player().cor >= 80)
            {
               outputText("你脱光衣服，一边抚摸着你那调皮的部位，一边向四周投去诱惑的目光，希望附近有谁或什么东西来操你。你被附身的器官快乐地扭动着，让你的身体充满欲望和渴望，作为奖励。也许它能为你召唤一个恶魔伴侣？[pg]");
            }
            if(get_player().cor < 33)
            {
               outputText("你太累了，无法再抵抗你鸡巴里的恶魔，你用双手抓住它，用双手举起这根沉甸甸的鸡巴，它充血肿胀，呈现出紫红色。你的全身都泛红了，对这个……恶魔强加给你的强烈感觉做出了反应。这让你全身都羞愧得发红，但你强迫自己继续照顾这个怪物。感觉确实很好——你可以理解为什么这片土地上的一些居民会沉沦于这种感觉。但你是用更坚强的材料做成的！至少当你的双手继续充满爱意地抚摸着你快乐的源泉时，你是这样向自己保证的。[pg]");
               outputText("你叹了口气，挤出浓稠的先列腺液，抚摸着你[cock]上长满结节的冠部，它在你的手中愉快地抽动着。哦，天哪，这感觉好得不真实。当你试图忍受自己淫荡的行为时，愉悦的娇喘声从你嘴里溢出。你与被附身的下体抗争，但它们引导你的指尖滑过最敏感的地方，暂时夺走了你对四肢的控制。");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
               {
                  outputText("一根触手阴茎卷曲起来，像一个有机的阴茎环一样紧紧缠绕在根部。它使每一个腐化的结节变得更大、更硬，甚至更加敏感。");
               }
               outputText("[pg]恶魔的声音戏弄着你，[say: 真是个纯洁的勇者，在泥土里打滚，像个婊子一样呻吟。你真的认为这样能拯救任何人吗？你甚至无法把自己的手从你那被污染的鸡巴上拿开！][pg]");
               outputText("你大声喊出微弱的抗议，同时仍在抽插，陶醉于双手在浸满先列腺液的肉棒上滑上滑下的感觉。细微的呻吟打断了你的否认，伴随着短促而尖锐的愉悦呻吟。[pg]");
               outputText("[saystart]哦，你已经向我屈服了吗？我能感觉到精液在你的");
               if(get_player().balls > 0)
               {
                  outputText(get_player().ballsDescriptLight());
               }
               else
               {
                  outputText("下体");
               }
               outputText("里沸腾，渴望着喷射出来。放松点，享受这种感觉。你越是接受它，感觉就会越好。屈服吧，射出来，我想看着它溅满你的脸，[sayend] 你的恶魔鸡巴嘲笑道。[pg]");
               outputText("反抗是没有用的，这感觉太好了。当你在攻势下崩溃，屈服于生理需求时，你的舌头伸出了嘴外。你[cock]的顶端张得大大的，通过尿道泵出浓稠的精液，而你的下半身则快乐地扭动着。你的羞耻感冒着泡，溅到了你的脸上，把它涂成了浓稠的白色黏液。当一些精液落到你的舌头上，迫使你品尝时，你想知道恶魔是不是对的。不知怎么的，你喜欢它？你困惑地呻吟着——你不应该享受这个，但你的身体并没有让步，直到它给你涂上了一层厚厚的涂层。[pg]");
               outputText("现在满足了，埃克斯加图安瘪了下去，甚至懒得嘲笑你，而你则试图清理溅满你上半身的黏液。");
            }
            else if(get_player().cor < 66)
            {
               outputText("无法承受住在你胯下的恶魔强加给你的虚假欲望，你双手抓住这个怪物，因这感觉如此美妙而颤抖。没有什么应该感觉这么好，但既然它确实如此，你还不如享受它，对吧？当你真正开始享受这种感觉时，你的身体变红了，你的双手抚摸着你[cock]上每一寸长满结节的地方。一方面，你不敢相信自己所感受到的愉悦，但另一方面，你觉得你应该做更多的事情来抵抗它。哦，好吧，现在太迟了……[pg]");
               outputText("你挤出几滴浓稠的先列腺液，用它流出的大量滑溜溜的液体润滑[cock]。它以前从来没有流出过这么多，也许是恶魔埃克斯加图安的责任。当你的双手挤压着润滑过的肉棒，紧紧地上下套弄时，你喘着粗气，不顾自己的欲望，充当着恶魔需求的奴隶。你越来越觉得自己像是一个在自己身体里的乘客，但你真的不介意。放松并享受内心涌起的燥热是如此容易。[pg]");
               outputText("恶魔开口了，戏弄着你，[say: 已经屈服于我的腐化了吗，荡妇？你真的这么高兴让一个恶魔如此淫荡地控制你的身体吗？你难道不应该至少试着假装不高兴，表现得像个淫荡的婊子吗？][pg]");
               outputText("他的话听起来很真实，但在你的内心深处，你知道你不是他腐化的奴隶。只是现在感觉太好了；你喜欢双手在鸡巴上滑上滑下的感觉，抚摸和揉捏每一个敏感的结节。先列腺液的流量变大了，几乎在你的肚子上汇聚成水洼，而你滑溜溜的手指");
               if(get_player().biggestTitSize() >= 5)
               {
                  outputText("将肿胀的恶魔塞进你的" + get_player().allBreastsDescript() + "之间，把它包围在摇晃的肉体中。湿润的恶魔先列腺液浸透了你乳房的皮肤，润滑了通道，当你揉捏它们时，用力地用乳交来满足你邪恶欲望的源泉。");
               }
               else
               {
                  outputText("无情地套弄着肉棒，抽出越来越多的恶魔先列腺液，直到你的前臂和大腿上部都涂满了这种东西，闪烁着暗淡的光芒。");
               }
               outputText("你喘息着，呻吟着，被迫感受这种奇妙而淫秽的感觉。[pg]");
               outputText("[say: 你应该看看你自己，像发情的动物一样喘息和呻吟。我想知道，你还是一个勇者，还是我正在对你做的事情的奴隶？你看起来像个性奴隶，但你真的对喷射浓稠的恶魔精液的感觉上瘾了吗？你变成了一个多么淫荡的勇者啊，[name]，] 埃克斯加图安嘲笑道。你的一部分想要反对，大声喊出他的建议，但每次你张开嘴，唯一发出的声音就是淫荡的呻吟。[pg]");
               outputText("你的高潮像波浪一样穿过恶魔。你短暂地想知道是恶魔让这感觉如此美妙，还是你自己腐败的欲望。这些想法被一大团精液溅到你[face]上的感觉打散了。你眨了眨眼睛，及时看到你[cock]那肥大、跳动的顶端悬停在你的脸前。你的尿道张得大大的，发射出另一股喷流，溅到你的[hair]上。[pg]");
               outputText("[say: 哦，要是你的长辈现在能看到你就好了，在屈服于恶魔的意志后，把自己浸泡在精液里。哦哦哦，感觉真好，] 你那被附身的鸡巴嘟囔着，因为它继续涂抹着你，滚烫的喷发逐渐减弱成稳定的白色细流，顺着你的" + get_player().allBreastsDescript() + "流下。你躺下，感到羞辱，但又因为在制造了如此巨大的喷发后感到如此解脱而开心地微笑着。[pg]");
               outputText("埃克斯加图安暂时满足了，它干瘪下去，甚至懒得嘲讽你，任由你清理溅在自己上半身的黏液。");
            }
            else
            {
               outputText("你开心地屈服于内心恶魔的欲望，双手握住你的[cock]，感受着它沉重的分量在你紧握的手中慢慢膨胀。它随着黑暗力量和堕落的欲望跳动着，在勃起到最大尺寸时令人愉悦地刺痛着。你温柔地抚摸它，用熟练的触摸安抚着里面的恶魔，让你们俩都充满了纯粹的快乐爆发。覆盖在它表面的数百个小结节像波浪一样勃起，随着你越来越兴奋而充血。[pg]");
               outputText("埃克斯加图安从不甘心袖手旁观，它插嘴道：[say: 啊，对，再往左一点好吗？我真高兴我附身在你身上。我从来没想过一个“勇者”能给出这么棒的肉棒按摩。我真是太有眼光了。我们应该永远这样在一起。想想看，你可以用我对你的敌人做多少美妙的事情……][pg]");
               outputText("它说得太对了。你可以一直让它变大，直到难以移动，拖在地上，但你确信它的恶魔魔法会吸引大量堕落的荡妇，并迷惑任何未堕落之人的心智，足以让他们受到你[cock]的蛊惑。天哪，这让你欲火焚身！只要想想拥有一群地精女孩后宫，按摩你巨大的阴茎，而另一个则用她渴望的肉缝摩擦你的龟头……你必须让这一切发生。也许你可以培育一支小荡妇军队，用轿子抬着你，只要你有一丝欲望，就榨出你的精液。[pg]");
               outputText("你的" + get_player().cockDescript(0) + "似乎对这个想法很感兴趣，喷出滚烫的先列腺液，直到它给自己涂上一层光滑的湿润。你的双手在表面摩擦，浸泡在大量的恶魔黏液中，完全出于自愿地工作着。你至少设法控制了你的臀部，让它们向上挺动，进一步增加刺激，并刺激你的[cock]滴下更多堕落的液体。感觉太好了，无法抗拒，而且真的没有任何理由抗拒，不是吗？[pg]");
               outputText("[say: 就是这样，[name]，你太棒了。现在继续，释放出来吧。我想把你的脸涂满精液，看着它滴下来。你会让我这么做的，对吧？我在骗谁呢，我感觉太好了，你会让我做任何我想做的事，不是吗，荡妇？][pg]");
               outputText("哦，天哪，它是对的，你要让它瞄准你，用一波波恶魔精液溅满你。最糟糕的是，你能感觉到你很大一部分在期待着它。你不知道自己怎么了，当你屈服时，完全没有注意到");
               if(get_player().biggestTitSize() >= 5)
               {
                  outputText("你的双手将你的" + get_player().allBreastsDescript() + "挤压在[cock]周围，用力地乳交。");
               }
               else
               {
                  outputText("你的双手重新调整了你[cock]的位置，让它贴在你的胸前。");
               }
               outputText("你不假思索地俯下身去舔舐和吸吮龟头，对从你腹股沟长出的恶魔肉棒进行自我口交。你努力跟上先列腺液的洪流，但你知道你不用等太久了……[pg]");
               outputText("你爆发了，嘴里充满了你恶魔般屈服的浓烈精液。你为什么会想到抗拒这种快乐？白热的释放从你的腹股沟辐射出来，让你的身体麻木而快乐，一波又一波的恶魔精液顺着你的喉咙流下，溅在你的脸上。这种邪恶的快乐，在你经历了这一切之后，你真的应该享受它们，对吧？你沉迷在不断扩大的甜蜜屈服的湖泊中，很高兴能成为这样一个有趣恶魔的宿主。[pg]");
               outputText("埃克斯加图安暂时满足了，它干瘪下去，甚至懒得嘲讽你，任由你清理溅在自己上半身的黏液。");
            }
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(0.25),DynStat.Cor(1));
         }
         else if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2)
         {
            if(get_player().cor < 50)
            {
               outputText("你脱下上衣，准备屈服于恶魔的要求。“至少我也能享受它，”你沉思着，一边完成从躯干上剥离这件碍事衣物的动作。你低头看着你的" + get_player().allBreastsDescript() + "，它们看起来并不特别邪恶。然而你知道，在那些美妙的乳房肉丘中潜伏着一股巨大的堕落力量，更糟糕的是，你知道你正在给它它想要的东西。[pg]");
            }
            else
            {
               outputText("你急切地脱下上衣，准备配合你" + get_player().allBreastsDescript() + "里的恶魔，享受一次放松的乳房按摩。你把碍事的衣物滑到一边，惊叹于你胸前奇妙的巨大球体。真的，任何能给你如此奇妙天赋的地方都不可能是邪恶的。你向后靠，享受着空气中流过你肉丘每一寸极其敏感肌肤的温暖，已经迫不及待地想要开始了。[pg]");
            }
            outputText("双手不由自主地抬起，开始抚摸你的[breasts]。它们滑过每一寸敏感的");
            if(get_player().hasPlainSkin())
            {
               outputText("肌肤");
            }
            else if(get_player().hasFur())
            {
               outputText("覆盖着毛发的肌肤");
            }
            else if(get_player().hasScales())
            {
               outputText("柔软的鳞片肌肤");
            }
            else
            {
               outputText("黏糊糊的表面");
            }
            outputText("，停下来轻轻挤压和抚摸任何特别敏感的地方。自我施加的快乐攻击让你嘴里发出轻柔的叹息。你的身体完全放松，靠在一块石头上，继续开心地玩弄你的" + get_player().allBreastsDescript() + "。整个过程中，你的手从未碰过你的[nipples]，只是时不时地在它们周围画圈，让你因为渴望而弓起背。[pg]");
            outputText("一个声音嘲弄道，[say: 哦，我那专门按摩奶子的勇者是不是需要一点乳头游戏了？我还以为只有我才需要发泄呢。去吧，屈服于你的欲望，玩弄你的乳头吧。沉浸在我能给你的快感中，记住谁才是你真正的主人！][pg]");
            outputText("终于，手指包裹住了你的[nipples]，轻轻地挤压着它们，让你忍不住发出愉悦的喘息。");
            if(get_player().hasVagina())
            {
               outputText("淫水");
               if(get_player().totalCocks() > 0)
               {
                  outputText("和先列腺液");
               }
               outputText("浸湿了你的腹股沟");
            }
            else if(get_player().totalCocks() > 0)
            {
               outputText("先列腺液浸湿了你的腹股沟");
            }
            else
            {
               outputText("温暖的感觉传遍你的全身");
            }
            outputText("，胸部传来的快感让你越来越兴奋。指尖");
            if(get_player().nippleLength < 2)
            {
               outputText("捏住乳头拉扯，这感觉对你来说太强烈了。");
            }
            else
            {
               outputText("抚摸着你拉长的乳头，偶尔轻轻捏住它们，就像在给它们打飞机一样。这感觉对你来说太强烈了。");
            }
            outputText("你颤抖着扭动身体，被一种不同于“正常”高潮的奇特快感所淹没。乳头高潮的感觉确实很棒，但对你胯下积聚的难耐欲望却毫无帮助。也许你也需要满足一下那里。[pg]");
            dynStats(DynStat.Sens(0.25),DynStat.Lust(15),DynStat.Cor(1));
            if(get_player().biggestLactation() > 1)
            {
               outputText("当你平静下来时，你发现你的[nipples]正滴落着乳汁，从地上那一滩滩白色的液体来看，你简直变成了一个小小的喷奶器。");
            }
            outputText("你红着脸重新穿好衣服，注意到埃克斯加图安似乎安静地睡着了……也许你现在能得到一点安宁了？");
            get_player().orgasm("Tits",false);
         }
         get_player().changeStatusValue(StatusEffects.Exgartuan,2,12 + Utils.rand(7));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function exgartuanLactationAdjustment() : void
      {
         var _loc1_:Number = 0;
         if(get_player().biggestLactation() > 1)
         {
            if(Utils.rand(2) == 0 || get_player().hasStatusEffect(StatusEffects.Feeder))
            {
               outputText("你的乳头变得温暖而敏感，然后开始往你的[armor]里滴奶。埃克斯加图安似乎又在拿你寻开心了……");
               get_player().boostLactation(int(get_player().breastRows.length));
            }
            else
            {
               outputText("你的[nipples]收紧了。那个恶魔在搞什么鬼？当你意识到你的" + get_player().allBreastsDescript() + "不再感觉那么“饱满”时，你恍然大悟。你停止泌乳了！");
               _loc1_ = int(get_player().breastRows.length);
               while(_loc1_ > 0)
               {
                  _loc1_--;
                  get_player().breastRows[int(_loc1_)].lactationMultiplier = 0;
               }
            }
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("你的胸部感觉很冷。你试探性地摸了摸你的[armor]，发现有几滴奶从你的[nipples]里漏了出来！恶魔让你开始泌乳了！");
            get_player().boostLactation(int(get_player().breastRows.length));
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("你的[armor]内侧摩擦着你的[nipples]，让你兴奋起来。你仔细一想，意识到它们以前从未这样过。快速检查后发现，每个乳头都长长了大约半英寸。该死的恶魔。");
            var _temp_1:* = get_player();
            _temp_1.nippleLength = _temp_1.nippleLength + 0.5;
         }
         else if(get_player().nippleLength > 0.5)
         {
            outputText("随着时间的推移，你意识到你的胸部感觉有些不同。快速瞥了一眼证实了你的怀疑——你的乳头不知怎么缩短了大约半英寸。你毫不怀疑这是埃克斯加图安干的好。");
            var _temp_2:* = get_player();
            _temp_2.nippleLength = _temp_2.nippleLength - 0.5;
         }
      }
      
      public function exgartuanInfestTits() : void
      {
         outputText("[pg]你的" + get_player().allBreastsDescript() + "在变得更加巨大的同时摇晃着，变成了淫秽的肉团，随着你身体的每一个动作而颤动。你所有的[nipples]也随之膨胀，体积增大以匹配它们新的、更大的家。它们感觉很热，渴望被触摸。");
         var _loc1_:int = int(get_player().breastRows.length);
         while(_loc1_ > 0)
         {
            _loc1_--;
            var _temp_1:* = get_player().breastRows[_loc1_];
            _temp_1.breastRating = _temp_1.breastRating + 7;
         }
         outputText("[pg]一个声音突然划破空气，要求道：[say: 摸我，凡人，否则就被弄脏吧！]");
         outputText("[pg]你困惑地环顾四周，试图找到声音的来源。");
         outputText("[pg][say: 哦，他妈的。往下看。再往下……再往下……对，就在你的胸前。看好了！伟大的大恶魔，埃克斯加图安——过度之主！我已经在你娇小的胸部安家了，你最好努力让我高兴，否则我会弄脏你的衣服，用我强大的乳汁浸透你！]");
         outputText("[pg]你向后倒去，由于太过惊讶而无法站稳，地面重重地撞击着你的[ass]。你的乳房真的在和你说话吗？");
         outputText("[pg][say: 是的，我在说话，]埃克斯加图安嘟囔着，从你的[nipples]喷出一股乳汁以示强调，[say: 你最好把我带回我在你记忆中看到的那个可爱的营地，给我好好按摩一下。]");
         outputText("[pg]好吧……这确实出乎意料。也许有办法摆脱这东西？");
         get_player().createStatusEffect(StatusEffects.Exgartuan,2,0,0,0);
      }
      
      public function exgartuanInfestDick() : void
      {
         spriteSelect(SpriteDb.get_s_exgartuan());
         if(get_player().cocks[0].get_cockType() != CockTypesEnum.DEMON)
         {
            outputText("[pg]你的[cock]膨胀起来，变得更长更硬，但也发生了扭曲，表面长出了肿块和结节。颜色变深，变成了深紫色，龟头周围长出了一圈更大的结节。你现在拥有了一根更大、更堕落的阴茎！它滴着先列腺液，抽搐着，仿佛在嗅着空气，感觉非常温暖和敏感。");
            outputText("[pg]一个声音突然划破空气，要求道：[say: 满足我，凡人，否则我会让你去找个能满足我的人！]");
            outputText("[pg]那到底是什么鬼东西？你环顾四周，却找不到声音的来源。它再次开口：[say: 在下面。你是聋子吗！？]");
            outputText("[pg]你低下头，发现你那恶魔般的肉棒正直直地指着你，并且因为……愤怒而颤抖着？你向后倒去，由于太过惊讶而无法站稳，地面重重地撞击着你的[ass]。你的鸡巴在和你说话吗？");
            outputText("[pg][say: 是的，我在说话。你应该感到庆幸——你现在是伟大的恶魔埃克斯加图安的宿主，你最好每隔几个小时就取悦我一次，否则我会确保你的身体找到别人来释放我不断积聚的压力。不过我觉得你会做得很好的。来吧，我能在你的脑海中看到一个美妙的营地，我们可以把它涂成白色，]它建议道。");
            outputText("[pg]好吧……这确实出乎意料。也许有办法摆脱这东西？");
            dynStats(DynStat.Lib(5),DynStat.Lust(10),DynStat.Cor(10));
            get_player().cocks[0].set_cockType(CockTypesEnum.DEMON);
         }
         else
         {
            outputText("[pg]你的[cock]膨胀起来，在吸收喷泉精华的同时变得更加巨大。它滴落着先列腺液，抽动着，仿佛在嗅着空气，感觉非常温暖和敏感。");
            outputText("[pg]一个声音突然划破空气，要求道：[say: 满足我，凡人，否则我会让你去找个能满足我的人！]");
            outputText("[pg]那到底是什么鬼东西？你环顾四周，却找不到声音的来源。它再次开口：[say: 在下面。你是聋子吗！？]");
            outputText("[pg]你低下头，发现你那恶魔般的肉棒正直直地指着你，并且因为……愤怒而颤抖着？你向后倒去，由于太过惊讶而无法站稳，地面重重地撞击着你的[ass]。你的鸡巴在和你说话吗？");
            outputText("[pg][say: 是的，我在说话。你应该感到庆幸——你现在是伟大的恶魔埃克斯加图安的宿主，你最好每隔几个小时就取悦我一次，否则我会确保你的身体找到别人来释放我不断积聚的压力。不过我觉得你会做得很好的。来吧，我能在你的脑海中看到一个美妙的营地，我们可以把它涂成白色，]它建议道。");
            outputText("[pg]好吧……这确实出乎意料。也许有办法摆脱这东西？");
         }
         get_player().increaseCock(0,1);
         get_player().cocks[0].thickenCock(0.5);
         get_player().createStatusEffect(StatusEffects.Exgartuan,1,0,0,0);
      }
      
      public function exgartuanCombatUpdate() : Boolean
      {
         var _loc2_:* = null as Monster;
         var _loc3_:Number = NaN;
         if(get_monster().get_short() == "tentacle beast" || get_monster().get_short() == "worms" || get_monster().get_short() == "demons")
         {
            return false;
         }
         var _loc1_:Number = 0;
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            if(get_monster().get_short() == "goblin" && Utils.rand(3) == 0)
            {
               outputText("一个奇怪的和谐声音念着胡言乱语，音量和音调都在升高。是从你的胯下传来的！地精女孩咯咯笑着尖叫起来，[say: 停下！它在对我的小穴用魔法！！！]");
               get_monster().addStatusValue(StatusEffects.BonusVCapacity,1,get_player().cockArea(0) * 0.1);
               _loc2_ = get_monster();
               _loc2_.set_lust(_loc2_.get_lust() + 10);
               return true;
            }
            if(get_monster().get_short() == "fetish cultist")
            {
               _loc1_ = Utils.rand(3);
               _loc3_ = _loc1_;
               if(_loc3_ == 0)
               {
                  outputText("恋物癖邪教徒的眼睛死死盯着你的胯部，在战斗中似乎从未移开过。从空气中越来越浓的女性发情气味来看，埃克斯加图安似乎对她产生了很大的影响。");
               }
               else if(_loc3_ == 1)
               {
                  outputText("恋物癖邪教徒公然抚摸着自己，目光从未离开过你的胯部，死死盯着你[armor]里埃克斯加图安的轮廓。真是个荡妇。");
               }
               else if(_loc3_ == 2)
               {
                  outputText("恋物癖邪教徒似乎被你胯下抽动的肿块迷住了，当你扭动臀部逗弄她时，她的目光也跟着来回移动。该死，这婊子为什么还要浪费时间战斗？她绝对是想和埃克斯加图安玩玩……");
               }
               _loc2_ = get_monster();
               _loc2_.set_lust(_loc2_.get_lust() + 10);
               return true;
            }
            if(get_monster().hasVagina())
            {
               _loc1_ = Utils.rand(10);
               _loc3_ = _loc1_;
               if(_loc3_ == 0)
               {
                  outputText("关于[themonster]将" + get_monster().mf("他","她") + "自己缠绕在你跳动的恶魔阴茎上的想法吞噬了你，让你的身体充满了欲望。");
                  if(get_player().cor < 50)
                  {
                     outputText("你低头看了一眼[armor]里敏感的凸起，叹了口气。该死的恶魔。");
                  }
               }
               else if(_loc3_ == 1)
               {
                  outputText("欲望在你的血管中流淌，当你看着[themonster]的身影时，欲望变得更加强烈。你不知为何意识到这种欲望是人为的，但这并没有让你减少骑乘" + get_monster().mf("他","她") + "的冲动……");
               }
               else if(_loc3_ == 2)
               {
                  outputText("温暖传遍你的全身，你脑海中不断闪现自己一次又一次骑乘[themonster]的画面。你可能不得不让它们成为现实……");
                  if(get_player().cor < 50)
                  {
                     outputText("太可怕了！这都是那个恶魔的错！");
                  }
               }
               else if(_loc3_ == 3)
               {
                  outputText("你真的很想结束这场战斗，把[themonster]按倒……为什么这么久，你的[cock]可不想等了！");
                  if(get_player().cor < 50)
                  {
                     outputText("你猛地回到现实，咒骂自己屈服于恶魔的欲望。");
                  }
               }
               else if(_loc3_ == 4)
               {
                  outputText("这场战斗已经持续得够久了；你现在唯一想做的就是把你的[cock]塞进[themonster]的……等等，什么？你被附身的鸡巴正在控制你。");
               }
               else if(_loc3_ == 5)
               {
                  outputText("有那么一瞬间，你发现自己很难集中注意力，用[cock]刺穿[themonster]的画面深深地印在你的脑海里。诅咒这个好色的恶魔！");
               }
               else if(_loc3_ == 6)
               {
                  outputText("快感突然开始在你的全身辐射。你及时恢复了理智，看到自己的双手正在抚摸[armor]里的凸起，回应着一股邪恶力量的突发奇想。");
               }
               else if(_loc3_ == 7)
               {
                  outputText("也许最好的办法就是放下武器，脱掉你的[armor]。把自己交给[themonster]，让命运来决定。当然，[monster.he]会通过拥抱你的[cock]来回报你的姿态，并且……啊！恶魔又在玩弄你的判断力了。");
               }
               else if(_loc3_ == 8)
               {
                  outputText("紧致充满爱意的屁眼和张开的小穴，光滑细长的红舌头和像精美瓷器一样的乳房。魅魔和她们带来的火辣性爱，这些都是你最喜欢的东西！……等等，什么？那是你自己的想法吗？你为什么在心不在焉地抚摸你的[cock]？");
               }
               else if(_loc3_ == 9)
               {
                  outputText("随着你那叛逆的蘑菇头越来越硬，想要打完这场战斗变得越来越困难了。埃克斯加图安的重量本来就够影响你平衡的了，现在还硬挺着往外伸。真是个混蛋。");
               }
               dynStats(DynStat.Lust(4 + Utils.rand(5)));
               return true;
            }
            if(get_monster().totalCocks() > 0)
            {
               _loc1_ = Utils.rand(8);
               _loc3_ = _loc1_;
               if(_loc3_ == 0)
               {
                  outputText("你的双手不受控制地解开了你的[armor]，露出了你的[cock]。不知怎么的，它自己开始长篇大论起来，[say:你管那叫鸡巴？认真的吗？女孩们真的喜欢那个吗？我无法想象为什么。没错，伙计，继续萎缩吧，你跟我比差远了！]");
               }
               else if(_loc3_ == 1)
               {
                  outputText("你的双手无视你的命令，解开了你的装备，向[themonster]展示了你那被附身的阴茎。一个虚无缥缈的声音嘲讽道，[say:你真的没法跟我比。认真的。好好看看。我他妈的才是真家伙。你为什么不把那根可悲的鸡巴夹在两腿之间，然后灌点魅魔的奶，直到你变成个女孩？那样对你更好。]");
               }
               else if(_loc3_ == 2)
               {
                  outputText("你的[cock]扭动着，把你的[armor]推开。埃克斯加图安吼道，[say:你为什么要打扰我的宿主，蠢货？你没看到我的宏伟吗？你跟我比什么都不是。去羞愧地打飞机吧，别挡我们的路。我们还有小穴要填满呢。]");
               }
               else if(_loc3_ == 3)
               {
                  outputText("你的[armor]的腰部撑开了，你的[cock]完全勃起，直指天空，[say:在恐惧中颤抖吧，苦力！我这 " + Utils.num2Text(get_player().cocks[0].cockLength) + " 英寸的雄风让你两腿之间那软弱的肉瘤相形见绌。我们没时间看你那目瞪口呆的敬畏；回家做个顾家好男人吧。]");
               }
               else if(_loc3_ == 4)
               {
                  outputText("违背你的意愿，你的双手迅速解开了你的[armor]，你的[cock]弹了出来，尿道口充满威胁地对着[themonster]张开，[say:你有一根连母亲都不会爱的鸡巴。那玩意儿曾经恩泽过其他活物的肉体吗？滚回你那充满遥不可及幻想的孤独小屋去吧，把真正的行动留给专业人士。]");
               }
               else if(_loc3_ == 5)
               {
                  outputText("突然，你的[armor]搭起了一个不可能的帐篷，巨大的凸起直指[themonster]。你只能在不适中皱眉，因为你衣服的背面紧贴着你，同时一个沉闷的声音嘲讽道，[say:这么微不足道的东西怎么能一直这么烦人？你仅仅是存在就掩盖了你面前明显的的光芒。去死吧！]");
               }
               else if(_loc3_ == 6)
               {
                  outputText("你的[armor]出乎意料地自己打开了，促使你的[cock]伸展到露天中，[say:现存的所有化学物质、药水和食物都帮不了你拥有的那个微小的工具。这个世界的孔洞值得更好的！你今天所取得的成就只是在推迟不可避免的事情时让它们失望。]");
               }
               else if(_loc3_ == 7)
               {
                  outputText("突然间，你的[armor]敞开了，你的[cock]迅速滑上并绕过你的背部，停在离你脸部令人不适的近处，同时指着你的对手，[say:看看这个可怜的白痴，[name]。我们本可以出去把火热的鸡巴插进这片土地上渴望的小穴里。但是，不！这个[themonster]渴望被消灭。好吧，勇者……成全他。]");
               }
               _loc2_ = get_monster();
               _loc2_.set_lust(_loc2_.get_lust() - (5 + Utils.rand(10)));
               return true;
            }
         }
         else if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2)
         {
            if(get_monster().totalCocks() > 0)
            {
               _loc1_ = Utils.rand(8);
               _loc3_ = _loc1_;
               if(_loc3_ == 0)
               {
                  outputText("一个带着恶魔腐化低沉回音的轻浮女声调戏道，[say:为什么要和我们打？坐下来看着这巨大的乳房摇晃就好了。也许如果你乖的话，我们会让你滑进我们美妙的乳房之间。那不是很好吗？]");
               }
               else if(_loc3_ == 1)
               {
                  outputText("你的乳房自己晃动起来，[themonster]看得入了迷。你在心里默默感谢埃克斯加图安的帮助——也许这场战斗会很轻松。");
               }
               else if(_loc3_ == 2)
               {
                  outputText("一个少女般的声音向[themonster]喊道，[say:嘿，小可爱！为什么不干脆放弃投降呢，也许我们会让你玩弄我们奇妙的乳房。那不是很好吗？]");
               }
               else if(_loc3_ == 3)
               {
                  outputText("你的[chest]开始调皮地上下跳动，让你很难集中精力战斗。不过你并不太担心，因为[themonster]似乎被这动作催眠了。");
               }
               else if(_loc3_ == 4)
               {
                  outputText("一个性感的女人声音调戏着[themonster]，[say:没有必要充满敌意，不是吗？只要放下武器，来帮忙抚摸这些造物的奇迹。]你的[chest]为了强调而晃动着。");
               }
               else if(_loc3_ == 5)
               {
                  outputText("一个诱人的女声似乎从不知何处响起，[say:我们都知道你只是想把头埋进这些凶猛的欢乐球里。没必要为它们打架，只要客气地问就行了！]");
               }
               else if(_loc3_ == 6)
               {
                  outputText("你感觉到胸前形成了一股湿润，同时一个女人的声音成型了，[say:来吧，[monster.short]。这场战斗肯定让你口渴了。毕竟我可不想让所有这些美味的母乳白白浪费掉……]哦，天哪……");
               }
               _loc2_ = get_monster();
               _loc2_.set_lust(_loc2_.get_lust() + (get_monster().lib / 10 + 5));
               return true;
            }
            if(Utils.rand(3) == 0)
            {
               _loc1_ = Utils.rand(3);
               _loc3_ = _loc1_;
               if(_loc3_ == 0)
               {
                  outputText("一个关于[themonster]残暴地挤压和抚摸你胸部的短暂幻想充满了你的脑海。你挣脱了这扭曲的白日梦，把手从你的[breasts]上拿开。该死，你还在战斗中！没时间搞这种蠢事！");
               }
               else if(_loc3_ == 1)
               {
                  outputText("当温暖的快感在你的胸口蔓延时，红晕染上了你的脸颊。你向下瞥了一眼，当你看到双手正忙着按摩你巨大的肉团时，你差点尖叫起来。你没时间搞这个！你气呼呼地把手拿开。");
               }
               else if(_loc3_ == 2)
               {
                  outputText("一声呻吟从你唇间溢出，脑海中不由自主地浮现出乳房被触摸和舔舐的画面。你强行将它们抛开，集中精力应对眼前的局势。");
               }
               else if(_loc3_ == 3)
               {
                  outputText("你的战斗姿态被打断了，因为你的手指决定它们更愿意开始摸你的奶子。你那被施了魔法的胸部越来越碍事了。你气呼呼地收回手，急于结束这场战斗。");
               }
               dynStats(DynStat.Lust(2 + get_player().sens / 10));
               if(Utils.rand(3) == 0)
               {
                  _loc2_ = get_monster();
                  _loc2_.set_lust(_loc2_.get_lust() + (5 + get_monster().lib / 10));
               }
               return true;
            }
         }
         return false;
      }
      
      public function exgartuanBulgeTortureIV() : void
      {
         clearOutput();
         outputText("第二天早上你醒来，依偎在你的[bed]里。意识到自己身在何处后，一种轻松惬意的感觉涌上心头。你掀开被子迎接新的一天，却在被子从你黏糊糊的皮肤上剥离时感到困惑。你低头看了看自己的腰部，仍然穿着");
         if(get_player().get_armorName() != "crotch-hugging slutty swimwear" && get_player().get_armorName() != "crotch-hugging revealing chainmail bikini")
         {
            outputText("你的[armor]");
         }
         else
         {
            outputText("你那单薄的[armor]");
         }
         outputText("。当你站起身时，几股精液顺着你的[legs]流了下来。");
         if(get_camp().hasCompanions())
         {
            outputText("有那么一瞬间，你考虑过问问外面的人是否记得昨晚发生了什么。但你决定还是把这件事藏在心里，因为你害怕会发现什么。");
         }
         else
         {
            outputText("你环顾你的[cabin]，寻找任何能为你提供昨晚发生的事情线索的东西。然而，过了一会儿，你决定还是继续你的一天。");
         }
         outputText("你又看了一眼埃克斯加图安，那根[cock]正舒服地躺在你的衣服里。[pg]");
         outputText("该死的恶魔。");
         get_player().changeStatusValue(StatusEffects.Exgartuan,2,25);
         doNext(playerMenu);
      }
      
      public function exgartuanBulgeTortureIII() : void
      {
         clearOutput();
         outputText("在纯粹的怨恨和一丝厌恶的驱使下，你开始通过控制呼吸和你能勉强维持的一点注意力来恢复一些镇定。然而，你所能做到的只是花了几分钟数你[cabin]顶部的缝线；你那曾经休眠的疲软[cock]正在显示出生命的迹象。当你感觉到你那被附身的肉棒变硬时，你的眼睛睁大了，它紧紧地压在你的" + Utils.cnName(get_player().get_armorName()) + "上，随着你的鸡巴一起生长，依然不可思议地紧贴着它的每一个侧面。它只长了几英寸就停了下来，但在此之前已经把你的斗志打得烟消云散。数缝线是你脑子里最后想到的事，你迅速坐起来，本能地抓向你的鸡巴。但情况拒绝改变；你的[armor]依然像以前一样异常坚韧。[pg]");
         outputText("你的欲望只增不减，你开始拼命地抓挠你[armor]的边缘。你被卡住的皮肤只因你的努力而变得通红，甚至打消了它可能会挣脱的念头。你的呼吸开始变得恐慌，你停下来试图形成一些连贯的想法。你那被欲望冲昏头脑的大脑能想出的最好办法就是尝试移动你的[hips]，看看你是否能与你被囚禁的阴茎产生任何接触。摩擦、推拉……任何你能想到的办法，只要能产生哪怕是最轻微的接触。然而，你唯一的成就就是让你的[legs]麻木了。一种刺痛感顺着你的下半身蔓延，接着是麻木。但在你开始将此加入你的挫败感之前，一丝闪光引起了你的注意——一滴先列腺液停留在你微微勃起的[cock]尖端，如果你没猜错的话，直径大约有一英寸。");
         if(get_player().get_armorName() == "crotch-hugging full platemail" || get_player().get_armorName() == "crotch-hugging scale-mail")
         {
            outputText("当你困惑地盯着它时，你甚至无法想象它是如何从你坚固的[armor]的钢铁中渗出来的");
         }
         else if(get_player().get_armorName() == "crotch-hugging practically indecent steel armor" || get_player().get_armorName() == "crotch-hugging full-body chainmail" || get_player().get_armorName() == "crotch-hugging revealing chainmail bikini")
         {
            outputText("你对这滴液体的关注让你开始怀疑它是如何穿过你[armor]密封的锁链的");
         }
         else
         {
            outputText("当你开始怀疑这液体是如何穿过材料的，而你所有的挣扎都没有引起哪怕最轻微的感觉时，一种奇怪的背叛感笼罩着你。");
         }
         outputText("你用拇指和食指穿过它，对你眼睛的发现感到怀疑。只需要那熟悉的触感，紧接着那标志性的气味，就能进一步击溃你大脑对你那吞噬一切的贪婪所建立的最后防线。[pg]");
         outputText("你重新睁大眼睛，咬紧牙关，抓住你[cock]龟头所在的位置，发出一声痛苦的呻吟。你沮丧地闭上眼睛，转过身子，开始将那毫不退让的护裆反复砸向你的[bed]。一遍又一遍，那块坚硬的肿块就是不肯移动。颤抖又增加了你因疯狂的欲望而产生的症状。你的手臂和腿根本无法维持你那无关紧要的挺动，你的身体变得软弱无力，让你的中段被你存在的克星尴尬地举在半空中。此时，你的呼吸已经达到了狂热的速度，而你全身都被汗水湿透了。在你迷失方向的头脑能想出的办法都用尽之后，你狂乱的目光投向了你之前忘记关上的" + get_camp().homeDesc() + "的开口。为了找到任何你可以使用的东西，你开始把自己拖出[cabin]，走向营火剩下的闷烧的余烬，你坚固的[armor]在你身下无用地摩擦着。随着你的视线开始变得模糊和颤抖，你神经质的颤抖已经蔓延到了你的眼睛，你越来越难看清你要去哪里。你每一次的拉扯似乎都需要你全身的每一根纤维，你的[legs]变得越来越麻木和湿滑，越来越无效。[pg]");
         outputText("当你在外面迈出第一步时，你找到了整晚的第一丝解脱。与你的[cabin]里面相比，清脆的夜风很凉爽。但当你停下来试图平静你的神经时，这种舒适感很快就被遗忘了，颤抖和呼吸让你的挣扎变得更加困难。不幸的是，你除了进一步恶化之外，几乎没有取得任何成就，所以你继续你绝望的跋涉，寻找一些……任何……你可以使用的东西。此时你无法看清任何东西，只能看到模糊的轮廓，你不小心把一只手伸进了营火的残骸中，熄灭了它所能提供的仅有的一点光，只留下传送门微弱的蓝色光芒与头顶血红色月亮的光芒交织在一起。你痛苦地缩回手，发出一声长长的、痛苦的、沮丧的呻吟。泪水在你的眼眶里打转，你只能看清周围淡蓝色和红色的斑点。你鼓起最后的力气把自己推到背上，你的身体太不舒服了，无法继续压迫你那被限制的阴茎。[pg]");
         outputText("你疯狂的呼吸似乎在与你砰砰直跳的心跳竞争，就好像它是从你的头骨里发出来的一样。你的手紧紧抓住地上的泥土和稀疏的草，无法停止颤抖，也无法听从你的任何命令。你原本就模糊的视线开始变暗，越来越多的模糊斑点融入黑暗中。你的[legs]继续对你进行麻木的罢工，同时帮助你的[feet]无助地挖进地里。……你已经想不出任何办法了，只剩下对性爱永不满足的渴望，一具除了抽搐之外几乎什么也做不了的身体，以及你胯部所在的一堆不幸。[pg]");
         outputText("然而，就在你快要放弃的时候，前面提到的那堆东西又开始蠕动了。你只能发出一声沉重的呻吟，乞求这种折磨停止。突然，冷空气接触到了你的腰部以下。你试图抬起头，以确保你没有变得更加疯狂，你紧绷的肌肉足以抬起它，看到你的[armor]已经开始从中间裂开。你把手深深地挖进地里，试图确保你也没有开始产生幻觉。但当冷空气接触到你新暴露的皮肤时，任何挥之不去的疑虑都开始消散，取而代之的是越来越大的敬畏。随着你的衣服继续裂开，一股令人陶醉的麝香像一吨砖头一样击中了你，进一步加深了你疯狂的欲望。破裂继续沿着你衣服的中间向下延伸，将你阴茎的根部暴露在元素中，并随着它开始跳动而充满了新的生命。你的[cock]就像一只破茧而出的蝴蝶，它的每一个切面都覆盖着一层先列腺液。理性的思想在你瘫痪的状态下挣扎着存在，当你那根棍子挣脱牢笼，伸向天空时，你感到敬畏。当它膨胀到完全大小时——也许甚至更大一点，液体的股线无助地附着或落回地面。");
         if(get_player().cockTotal() == 2)
         {
            outputText("你的" + get_player().cockDescript(1) + "在这个青铜阿多尼斯旁边保持疲软，仿佛被吸干了所有的生命。");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("你多余的阴茎在这个青铜阿多尼斯旁边保持疲软，仿佛被吸干了所有的生命。");
         }
         outputText("透过你模糊、颤抖的视线，你可以看清那个巨大的泰坦，它的身影在身后血红色的月亮下显得格外突出。在感觉像永远之后，你那雄伟的男子气概慢慢地从高处向你下降，随着你狂乱的心跳而跳动。就像一个从天而降的神来祝福一个凡人一样，[cock]停在你的视线正上方，它的尿道慢慢变宽，继续将先列腺液洒满你那饱受折磨的身体。[pg]");
         outputText("在那死寂的凝视中，似乎已经过了一辈子。你设法喘过气来，你颤抖的身体平静下来，因为它准备迎接救赎。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,413) == 0)
         {
            outputText("没有交换任何言语；没有任何想法敢穿过你的脑海。唯一的声音是你的心跳声，它的节奏为你拼命渴望的行动充当了前奏。内疚、恐惧、敬畏和满足的复杂情绪在抓挠着你。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,413) < 6)
         {
            outputText("[say: 你的意志甚至无法与我的力量相比，我无助的小勇者。你真的不应该继续表现得好像你超越了诱惑；我不想看到会发生什么。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,413) >= 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,413) < 10)
         {
            outputText("[say: 你知道，我从来没想过我甚至会享受独身的想法——哪怕是一瞬间。但是看着这样一个<b>诚实</b>的勇者崩溃成一堆颤抖的无助是值得的，因为我之后得到的关注是如此……彻底。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,413) >= 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,413) < 12)
         {
            outputText("[say: 我能坚持的时间比你长得多，[armor]。尽管我很享受看着你努力维持某种形式的道德和节制，但我更愿意去探索世界和它的许多孔口。总有一天你会离开你一直逃避的幻想世界，在现实世界中加入我。]");
         }
         else
         {
            outputText("[say: 哦，又是这个时候了，我明白了。抱歉，我还在想<b>上次</b>你试图忘记我时我有多享受！好吧，我们不要再浪费时间了；你知道该怎么做。]");
         }
         outputText("[pg]");
         outputText("埃克斯加图安。[pg]");
         outputText("这个自称[say: 肉棒恶魔]的家伙终于停止了对你的戏弄。在你开始思考如何回应之前——就好像你能回应似的——你脑海中有什么东西被触发了。就像听到发令枪响的短跑运动员一样，你向前扑到他身上，双臂兴奋地在[cock]上到处抓摸。它们在他能找到的每一个结节和凸起周围游走，渴望不惜一切代价满足这个恶魔。不甘示弱的是，你的舌头疯狂地扫过他敏感的皮肤，一路舔向他的龟头。");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("你的[chest]也同样卖力，用它们那晃动的肉感将埃克斯加图安闷在其中。");
         }
         outputText("从根部到顶端，你没有放过任何一寸皮肤、青筋、凸起或龟头；同时让你自己沾满了恶魔无尽的淫液。超乎寻常的快感回应着你的每一次努力，让你准备好迎接高潮。你稍微放松了紧紧的拥抱，双手牢牢握住[cock]，开始套弄他整根肉棒。你试图保持某种节奏，但在你迷乱、放纵的状态下，你很快就加快了速度。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]强有力地翻腾着，在期待中躁动不安。");
         }
         outputText("[pg]");
         outputText("你的呼吸停止了，因为你那");
         if(get_player().cumQ() < 50)
         {
            outputText("适量的");
         }
         else if(get_player().cumQ() < 150)
         {
            outputText("相当粘稠的");
         }
         else if(get_player().cumQ() < 300)
         {
            outputText("极其浓厚的");
         }
         else if(get_player().cumQ() < 800)
         {
            outputText("量大惊人的");
         }
         else
         {
            outputText("史诗般的");
         }
         outputText("精液顺着恶魔向上涌动。然而，就在你喷发的前一刻，埃克斯加图安挣脱了你的掌控，再次面对你时，将他的尿道口张得大大的。你甚至还没来得及露出疑惑的表情，");
         if(get_player().cumQ() < 500)
         {
            outputText("一股浓稠的恶魔精液");
         }
         else
         {
            outputText("一波巨大的恶魔浓精");
         }
         outputText("正中你的脸。这股惊人的冲击力让你踉跄后退，你的双手离开了强大的恶魔，只见他直指天空，将黑色的、温暖的精液喷洒在你周围的一切上。然而，你毫不在意，因为你正忙着抽搐，沉浸在其中散发出的每一丝快感中。没过多久，你就失去了意识，结束了这段折磨人的经历。[pg]");
         get_player().orgasm("Dick");
         get_player().createStatusEffect(StatusEffects.Jizzpants,1,0,0,0);
         dynStats(DynStat.Cor(2));
         doNext(exgartuanBulgeTortureIV);
      }
      
      public function exgartuanBulgeTortureII() : void
      {
         clearOutput();
         outputText("感觉只过了几分钟，你开始觉得自己在床单下嘶嘶作响。在几次半心半意的辗转反侧之后，由于你下半身肿胀的阻碍，你投降了，掀开了被子。此时，你几乎完全清醒了，太专注于你加快的呼吸和不舒服的体温。又过了几分钟，你才意识到发生了什么，你下意识地伸手去摸你的阴茎以寻求任何形式的缓解：你发情了。至于它是怎么发生的，你还不完全清楚。但这肯定不是你第一次经历，在玛瑞斯这样奇怪的地方发生这种事也不奇怪。据你所知，这可能是天气或附近的一棵树什么的带来的自然现象。就像花粉……除了你想做爱而不是鼻塞。[pg]");
         outputText("你再次伸手去摸");
         if(get_player().get_armorName() != "crotch-hugging slutty swimwear" && get_player().get_armorName() != "crotch-hugging revealing chainmail bikini")
         {
            outputText("你身上最后一件[armor]");
         }
         else
         {
            outputText("你的[armor]");
         }
         outputText("却发现它依然牢牢地贴在你的腰间。更让你惊讶的是，当你开始在周围摸索时，你发现");
         if(get_player().get_armorName() == "crotch-hugging full platemail" || get_player().get_armorName() == "crotch-hugging scale-mail armor")
         {
            outputText("你的[armor]感觉变得异常僵硬，既不肯让你的命根子挪动分毫，也不肯将任何感觉或震动传递给下面的东西。");
         }
         if(get_player().get_armorName() == "crotch-hugging practically indecent steel armor" || get_player().get_armorName() == "crotch-hugging full-body chainmail" || get_player().get_armorName() == "crotch-hugging revealing chainmail bikini")
         {
            outputText("你的[armor]感觉变得异常致密，既不肯让你的命根子挪动分毫，也不肯将任何感觉或震动传递给下面的东西。更糟的是，组成你盔甲的链环已经收缩并完全封闭了。");
         }
         else
         {
            outputText("你的[armor]感觉就像是用6英寸厚的钢板做成的，既不肯让你的命根子挪动分毫，也不肯将任何感觉或震动传递给下面的东西。你继续用手在上面抚摸，难以相信这种材料尽管看起来如此，却变得如此致密和坚硬。");
         }
         outputText("又经过了一番推、拉、敲、摸和抚弄，证实了你所担心的事：你的[cock]已经被隔离了");
         if(get_player().balls > 0 || get_player().hasVagina())
         {
            outputText("连同任何不幸居住在里面的东西");
         }
         outputText("。[pg]");
         outputText("该死的恶魔。他甚至连嘲讽你——或者承认你存在的礼貌都没有。你用拳头捶打着你那被诅咒的鸡巴，依然无法通过那紧密贴合的障碍物感觉到任何接触（暗自庆幸你没有弄伤自己）。你颓然倒回背上，决心寻找其他方法来满足你的欲望。你的双手带着新的使命感，开始在你身体的其余表面上搜寻，指尖温柔地拂过你的皮肤，寻找目标。");
         if(get_player().biggestTitSize() >= 2 && get_player().bRows() == 1)
         {
            outputText("你的探索直接从你的[chest]开始，你的双手狂热地摸索和拉扯，希望能找到任何避难所来躲避你不断逼近的欲望。无法从你那宏伟的双峰中提取任何有意义的慰藉，你的目光转向了你的[nipples]。");
         }
         else if(get_player().biggestTitSize() >= 2)
         {
            outputText("沿着你胸部排列的" + get_player().allBreastsDescript() + "应该能成为一个合适的征服目标。你的手掌立刻开始工作，尽可能多地揉捏乳肉以满足它们。它们从一排飞奔到另一排，从里到外，做任何能缓解你性欲的事。然而，你似乎并没有平静下来，所以你把注意力集中在最上面一排的[nipples]上。");
         }
         else
         {
            outputText("由于没有其他可以求助的东西，你的[nipples]是你唯一能指望带给你渴望的平静的指路明灯。");
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("你毫不迟疑地将四根手指推入每个张开的乳头，渴望得到任何形式的快感。你挠痒、挑逗、推拉，想尽一切办法将你从这折磨中解脱出来。");
         }
         else
         {
            outputText("稍微敲打、挠痒和挑逗似乎就是你能鼓起的全部努力了。");
         }
         outputText("由于太专注于下面发生的事情，你似乎无法集中足够的注意力来把事情做好。你低头看着你的[cock]，它依然疲软且被锁住。你最多只能用另一声深沉的叹息来回应，将注意力退回到你上方的画布上。你认为从现在开始最好的行动方案就是努力熬到早上，那时你可以找到一些帮助。向第三方承认羞愧似乎比继续与这种无稽之谈纠缠要好得多。你握紧拳头，深吸了几口气，准备带着理智熬过剩下的夜晚。[pg]");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         doNext(exgartuanBulgeTortureIII);
      }
      
      public function exgartuanBored() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && get_player().cockArea(0) >= 100)
         {
            _loc1_ = Utils.rand(9);
            if(_loc1_ == 0)
            {
               outputText("一个沉闷的声音响了起来，[saystart]嘿！你把我忘了吗？你们这些该死的勇者自以为很了不起，但你却忽略了你身上最棒的部位！难道你感觉不到那些精液正在");
               if(get_player().balls == 0)
               {
                  outputText("里面沸腾吗？");
               }
               else
               {
                  outputText("你的[balls]里沸腾吗？");
               }
               outputText("好吧，你最好快点让我释放出来，不然我就让你的身体去找个能做到的人！[sayend]");
            }
            else if(_loc1_ == 1)
            {
               outputText("一个微弱的声音嘟囔着，[say: 高潮这么少，你怎么活得下去？我们需要一些高质量的时间，[name]。你积累了太多的压力……]");
            }
            else if(_loc1_ == 2)
            {
               outputText("你感觉到[armor]里有什么在搅动，它摩擦着衣料。一个沉闷的声音说道，[say: 嘿！别忘了我！我需要透透气！]");
            }
            else if(_loc1_ == 3)
            {
               outputText("[say: 嘿！你他妈在干什么！？我来告诉你你在干什么：你没有照顾好你的老二。快点解决它，不然我就让什么东西来解决你！] 埃克斯加图安命令道。真是个混蛋。");
            }
            else if(_loc1_ == 4)
            {
               outputText("你感觉到你的[cock]在缓慢地膨胀和收缩，空气从尿道中逸出，弄得你的下体痒痒的。你的……你的老二刚才是不是叹气了？你的恶魔越来越不耐烦了。");
            }
            else if(_loc1_ == 5)
            {
               outputText("你的[armor]突然鼓了起来，一个压抑的声音随之响起，[say: 外面肯定有个洞能让我操。一张嘴，一个小穴……别偷懒了，快去干！]");
            }
            else if(_loc1_ == 6)
            {
               outputText("越来越难集中注意力了……埃克斯加图安正在");
               if(get_player().balls > 0)
               {
                  outputText("挑逗你的阴囊");
               }
               else if(get_player().hasVagina())
               {
                  outputText("戳着你的阴唇");
               }
               else
               {
                  outputText("抚摸你的会阴");
               }
               outputText("，[say: 来吧，勇者。你知道你不能再无视我太久了。]");
            }
            else if(_loc1_ == 7)
            {
               outputText("你那被附身的肉棒在两边晃来晃去，[say: 你是不是忘了老二是怎么用的了？我来帮你回忆一下；第一步：让它透透气。]");
            }
            else if(_loc1_ == 8)
            {
               outputText("你的[cock]开始在你的大腿上摩擦，一个熟悉的声音响起，[saystart]我有一大批滚烫的精液");
               if(get_player().balls > 0)
               {
                  outputText("在你的[balls]里沸腾。");
               }
               else
               {
                  outputText("在你体内深处酝酿。");
               }
               outputText("给我找个地方把它射出来，不然我就把它塞进你的喉咙里，勇者！[sayend]");
            }
         }
         else if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && get_player().biggestTitSize() >= 12)
         {
            _loc1_ = Utils.rand(8);
            _loc2_ = _loc1_;
            if(_loc2_ == 0)
            {
               outputText("你感觉到你的[breasts]在不祥地晃动，你体内的恶魔苏醒了。你的[armor]里传来一声被捂住的哈欠声，证实了这一点。");
            }
            else if(_loc2_ == 1)
            {
               outputText("在平静了几个小时后，埃克斯加图安开始躁动起来。你能感觉到你的" + get_player().allBreastsDescript() + "里产生了一种想要被触摸的渴望。真是个粘人的恶魔。");
            }
            else if(_loc2_ == 2)
            {
               outputText("埃克斯加图安醒了，让你的" + get_player().allBreastsDescript() + "愉快地晃动着。随着女恶魔的苏醒，想要被抚摸和揉捏的渴望慢慢增长。她大声喊道，[say: 喂，婊子！摸摸你的奶子！]");
               outputText("[pg]你叹了口气。");
            }
            else if(_loc2_ == 3)
            {
               outputText("突然，你的[chest]感觉好像要从你的胸前挣脱出来。这种奇怪的动作伴随着大声的呻吟，就好像它们在伸懒腰一样。看来令人愉快的宁静已经结束了。");
            }
            else if(_loc2_ == 4)
            {
               outputText("你的手臂突然不由自主地抱住你的[chest]，这种挤压让你感到一丝温暖。女恶魔醒了，让你充满了想要被触摸和挑逗的渴望。");
            }
            else if(_loc2_ == 5)
            {
               outputText("你的[chest]不祥地烦躁着，一个闷闷的女声响起，[say: 没有任何布料、金属、乳胶或凝胶能保护你免受我的伤害，勇者。屈服吧，抚摸这些奶子！]");
            }
            else if(_loc2_ == 6)
            {
               outputText("你一直享受的宁静独处时光即将结束，因为居住在你胸部的女恶魔在你的[armor]里移动。她毫不浪费时间，让你充满了对胸部的诱惑。");
            }
            else if(_loc2_ == 7)
            {
               outputText("你的胸部发出一种充满威胁的晃动，随后它们开始说话，[say: 外面肯定有人在找个地方安放他们的鸡巴，或者找点甜美的乳汁来解渴，勇者。别浪费他们的时间了，赶紧上吧。]");
            }
         }
      }
      
      public function exgartuanBeeRape() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         outputText("你咧嘴一笑，接受了恶魔的主意，就好像那是你自己的主意一样。也许是时候让这个蜂女自己上一堂体液受精课了……[pg]");
         outputText("你带着一点超自然力量引发的傲慢向前走去，拉近了与你那颤抖的受害者之间剩余的距离，完全没有注意到你的[armor]正迅速从你身上脱落，掉在森林的地面上。她虚弱地抗议着，露出她的毒刺，但这种威胁显然是徒劳的。她绝不可能用这种低劣的器官碰到你或你那宏伟的[cock]。[pg]");
         outputText("覆盖在她手臂上的光滑甲壳有点滑，但你还是设法紧紧抓住了她的手腕，把它们按在她的头顶上。你把它们并拢，抓起森林里众多藤蔓中的一根，开始把它缠绕在她的手上，轻松地避开了她用带毒刺的附肢对你进行的笨拙刺击，因为她的手臂被越来越紧地绑在头顶上。当你处理她时，她背部悬挂的肿胀腹部扭动着，你把它拉回来，强行把它推过花朵，移开。你又用了几根藤蔓确保它被绑紧，不再构成威胁。[pg]");
         outputText("[say: 你还真懂怎么打结！说到肉结，我有个主意……]你[cock]里的恶魔惊呼道。当你完成准备工作，掰开这个蜂子婊子的双腿时，你想知道恶魔这次又有什么鬼点子。从她生殖器飘出的气味简直不真实，让你同时感到饥饿和难以置信的饥渴。你用双手拉起那巨大的带凸缘的顶端，在涂满蜂蜜的胯部摩擦，将你恶魔般的先列腺液与她的蜂蜜混合在一起，涂抹在她毛茸茸的大腿内侧。[pg]");
         outputText("[say: 不，求你了，绝对进不去的！]她哭喊着，试图在你的捆绑下扭动。[pg]");
         outputText("[say: 闭嘴，乖乖接受，]你和埃克斯加图安异口同声地说，享受着每次摩擦她时，似乎蔓延到你顶端的相当愉快的刺痛感。她的嘴唇慢慢开始张开，闪烁着蜂蜜的光泽，你慢慢地把它们推得越来越开，淫秽地把它们拉伸到超出任何合理极限的程度。“这就是这个恶魔的真正力量吗？”你想知道，因为可怜的蜂女被拉伸到了超出她最疯狂想象的程度。[pg]");
         outputText("她那昆虫般的小穴感觉紧得难以想象，但你仍然继续向前推进，最终设法将你那长满凸起的阴茎头顶进了她那被永久扩大的入口。你继续进攻，将你那令人印象深刻的粗壮阴茎一寸一寸地滑入这个产卵荡妇的通道，看着你阴茎表面的每一个细节都在她的肚子上显现出来，你从中获得了病态的快感。你现在很满意，开始进进出出地抽插，享受着你的受害者随着你的抽插而发出的充满快感的尖叫声。你感觉自己几乎像是在把她当成乐器一样演奏，把它插得更深以提高音调，把它拔出来以听到“音符”。[pg]");
         outputText("随着每一次残暴的插入，蜂女受虐的身体变得越来越瘫软，随着强暴的继续，她越来越放松，以容纳你更多的[cock]。你听到有什么东西溅到地上的声音，于是绕到她的屁股后面看看发生了什么。这个婊子的产卵管露在外面，滴着更多她甜美的体液！她真的因为变成了一个黄黑相间的飞机杯而高潮了。随着她无意中的高潮释放出许多大肿块，开始顺着通道往下走，那根瘫软的管子痉挛并拉伸着。[pg]");
         outputText("没过多久，在如此紧致的洞里的感觉就把你推向了忍耐的极限，而淫秽的吧唧声混合着高亢的呻吟声也无济于事。你感觉到你的高潮在积聚，热量淹没了你的腹股沟。你把身体紧紧地贴在她的身上，在达到顶点时，尽可能多地把自己塞进她的体内。一波又一波的精液泵入蜜蜂体内，从她的产卵管中挤出等量的卵。随着你每次把精液射入她体内，湿润的扑通声都会传入你的耳朵。显然，卵就进入了你现在正在虐待的那个洞里。[pg]");
         outputText("你发出一声满足的咕哝声拔了出来，享受着你的[cock]从蜂女曾经紧致的洞里拔出时发出的湿润的“吧唧”声。曾经涂满蜂蜜的裂缝现在变成了一个张开大口的怪物，流着黏液和你那被污染的恶魔精液的混合物。好吧，也许她的女王在把她塞满卵时会轻松些。[pg]");
         outputText("你重新穿好衣服，一边愉快地吹着口哨，一边准备离开。你的受害者几乎失去了知觉，仍然因为强烈的体验而发抖，背部的器官还在漏出卵和蜂蜜。你是把她放下来，还是把她绑在那里让当地人享用？");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Cor(2));
         menu();
         addButton(0,"留下她",leaveBeePostRape);
         addButton(1,"释放她",freeBeePostRape);
      }
      
      public function exgartuanArmorShift() : void
      {
         var _loc1_:Boolean = false;
         if(get_player().get_armor() == get_armors().BEEARMR)
         {
            outputText("你甲壳护甲上的丝绸缠腰布收紧了，紧紧贴着你的腹股沟，直到清晰地显露出你那被恶魔附身的肉棒的突出轮廓。");
            get_player().set_modArmorName("紧贴胯部的性感黑色甲壳护甲");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().GELARMR)
         {
            outputText("保护你腹股沟的绿色凝胶板变薄并紧紧贴着你，以一种令人难以置信的淫荡方式贴合着你的[cock]。");
            get_player().set_modArmorName("紧贴胯部的闪亮凝胶护甲板");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().LEATHRA)
         {
            outputText("你的皮甲发生了变化，紧紧贴在你的大[legs]上，并在你的[cock]周围塑形，将其显眼地展示出来。");
            get_player().set_modArmorName("紧贴胯部的皮甲部件");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().INDECST)
         {
            outputText("你那暴露的钢甲上的锁子甲比基尼重新排列并弯曲其互锁的圆环，以最好地贴合你的[cock]，几乎没有留下任何想象空间。");
            get_player().set_modArmorName("紧贴胯部的几乎暴露的钢甲");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().R_BDYST)
         {
            outputText("你红色紧身衣那薄薄的透明材料开始紧紧贴着你的腹股沟，完美地贴合你的[cock]以及它上面的每一个凸起和结节。");
            get_player().set_modArmorName("紧贴胯部的红色上流社会紧身衣");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().SSARMOR)
         {
            outputText("构成你护甲的精细丝绸突然在你胯部周围解开，将你的[cock]暴露在空气中。空气中细细的丝线开始重新编织在你的巨大阴茎周围，为你提供了一个突出的新保护层。");
            get_player().set_modArmorName("紧贴胯部的蜘蛛丝护甲");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().S_SWMWR)
         {
            outputText("那件兼作你[cock]帐篷的微小泳装开始生长并包裹住它，完美地贴合你的男子气概。");
            get_player().set_modArmorName("紧贴胯部的荡妇泳装");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().FULLCHN)
         {
            outputText("你惊讶地发现锁子甲的绑带开始变平并重新排列，尽力贴合你[cock]的曲线，彰显它的存在。");
            get_player().set_modArmorName("紧贴胯部的全身锁子甲");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().CHBIKNI)
         {
            outputText("你的锁子甲比基尼重新排列并弯曲其互锁的圆环，以最好地贴合你的[cock]，几乎没有留下任何想象空间。");
            get_player().set_modArmorName("紧贴胯部的暴露锁子甲比基尼");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().FULLPLT)
         {
            outputText("当你的钢板甲在你的[legs]和胯部周围变热时，你开始握紧拳头。慢慢地，它开始紧贴你的[cock]并贴合它的每一个特征。");
            get_player().set_modArmorName("紧贴胯部的全身板甲");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().SCALEML)
         {
            outputText("组成你盔甲的钢鳞开始在你的胯部周围疯狂地拍打。它们弯曲并移动，试图贴合你的[cock]的轮廓。");
            get_player().set_modArmorName("紧身鳞甲");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().LTHRROB)
         {
            outputText("你的皮甲移动着，紧紧地压在你的上[legs]上，并在你的[cock]周围塑形，使其通过你的长袍显眼地展示出来。");
            get_player().set_modArmorName("紧身黑色皮甲，外罩宽大的长袍");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().RBBRCLT)
         {
            outputText("你开始感觉到你的橡胶套装压在你的上[legs]和[cock]上，消除了以前可能存在的任何气穴或皱纹。");
            get_player().set_modArmorName("紧身橡胶恋物癖服装");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().ADVCLTH)
         {
            outputText("你束腰外衣下面的一层开始压在你的[cock]上，突出了每一个曲线和结节，同时托起你的包裹，使其在外层下面清晰可见。");
            get_player().set_modArmorName("紧身绿色冒险者服装");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().OVERALL)
         {
            outputText("你工作服的牛仔布开始紧紧地压在你的[cock]上，包裹着你的阴茎和它的每一个侧面。");
            get_player().set_modArmorName("紧身白衬衫和工作服");
            _loc1_ = true;
         }
         else if(get_player().get_armor() == get_armors().C_CLOTH)
         {
            outputText("你的衣服发生了变化，在你的胯部收紧，直到你的[cock]的每一个曲线和结节都透过布料清晰可见。");
            get_player().set_modArmorName("紧身衣");
            _loc1_ = true;
         }
         if(get_player().get_armor() == get_armors().DBARMOR || get_player().get_armor() == get_armors().TBARMOR)
         {
            outputText("你那件魔法树皮盔甲的丝绸缠腰布收紧了，紧紧地贴着你的腹股沟，直到它清楚地显示出你那被恶魔附身的阴茎的突出隆起。");
            get_player().set_modArmorName("紧身 " + get_player().get_armor().get_name());
            _loc1_ = true;
         }
         if(get_player().cor < 33)
         {
            outputText("你畏缩着，脸涨得通红，对你体内的恶魔感到愤怒，希望他能停止折磨你！");
         }
         else if(get_player().cor < 66)
         {
            outputText("你对被迫穿上这套暴露狂的衣服感到有些畏缩，但还是花了一点时间欣赏这些变化是如何完美地展示你的包裹的……也许埃克斯加图安并不全是坏事？");
         }
         else
         {
            outputText("你将臀部向前转动，尽最大努力在每一步中展示你那耸人听闻的包裹。哦，非常好，你以后得感谢埃克斯加图安……");
         }
         if(_loc1_)
         {
            if(!get_player().hasPerk(PerkLib.BulgeArmor))
            {
               get_player().createPerk(PerkLib.BulgeArmor,0,0,0,0);
            }
         }
      }
      
      public function drinkFountainEndowment() : void
      {
         var _loc1_:int = 0;
         var _loc3_:Number = NaN;
         clearOutput();
         var _loc2_:Boolean = false;
         get_player().slimeFeed();
         outputText("你捧起双手，将清澈的水送到唇边，大口喝下。水很凉爽，让人精神焕发，很容易就咽下去了。真奇怪。你还以为它会让你有什么不同的感觉呢。");
         if(Utils.rand(5) == 0)
         {
            outputText("[pg]一种……智慧和头脑清醒的感觉涌现出来，让你对自己更加自信。");
            var _temp_1:* = get_player();
            _temp_1.XP = _temp_1.XP + 200;
            _loc2_ = true;
         }
         if(!get_player().hasStatusEffect(StatusEffects.Exgartuan) && !_loc2_ && Utils.rand(2) == 0)
         {
            _loc3_ = 0;
            if(get_player().cockTotal() > 0)
            {
               if(get_player().cockArea(0) >= 100)
               {
                  _loc3_++;
               }
            }
            if(get_player().biggestTitSize() >= 12)
            {
               _loc3_++;
            }
            if(_loc3_ > 0)
            {
               if(_loc3_ > 1)
               {
                  if(Utils.rand(2) == 0)
                  {
                     exgartuanInfestDick();
                  }
                  else
                  {
                     exgartuanInfestTits();
                  }
               }
               if(_loc3_ == 1)
               {
                  if(get_player().biggestTitSize() >= 12)
                  {
                     exgartuanInfestTits();
                  }
                  else
                  {
                     exgartuanInfestDick();
                  }
               }
               _loc2_ = true;
            }
         }
         if(Utils.rand(3) == 0 && get_player().biggestTitSize() > 1)
         {
            outputText("[pg]你的" + get_player().allBreastsDescript() + "像气球一样膨胀起来，每一个都变大了大约四个罩杯……它们感觉如此……充满弹性且敏感。甚至你的乳头似乎也跟着变大了！你的[armor]感觉比以前更紧了！");
            var _temp_2:* = get_player();
            _temp_2.nippleLength = _temp_2.nippleLength + 0.3;
            _loc1_ = int(get_player().breastRows.length);
            while(_loc1_ > 0)
            {
               _loc1_--;
               var _temp_3:* = get_player().breastRows[_loc1_];
               _temp_3.breastRating = _temp_3.breastRating + 4;
            }
            _loc2_ = true;
         }
         if(Utils.rand(3) == 0 && get_player().totalCocks() > 0)
         {
            outputText("[pg]你的[cocks]在你的[armor]里感觉更紧了，即使在疲软状态下也是如此。你打了个寒颤，意识到你的总长度可能增加了好几英寸，谁知道你的粗细又发生了怎样的变化。");
            _loc1_ = int(get_player().cocks.length);
            while(_loc1_ > 0)
            {
               _loc1_--;
               get_player().increaseCock(_loc1_,3);
               get_player().cocks[_loc1_].thickenCock(0.3);
            }
            _loc2_ = true;
         }
         if(Utils.rand(4) == 0 && get_player().hasVagina())
         {
            outputText("[pg]你的[clit]变得丰满起来，即使你没有发情，也会明显地分开你的阴唇。它现在可能");
            get_player().changeClitLength(2);
            if(get_player().getClitLength() < 6)
            {
               outputText("变得和阴茎一样大");
            }
            else
            {
               outputText("变得比大多数阴茎还要大");
            }
            outputText("了！");
            _loc2_ = true;
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function boobgartuanSurprise3() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("月亮映入你睁大的双眼，将你沐浴在它暗红色的光芒中。既然你似乎没有被淹死，看来你只是做了一个梦……或者说是一场噩梦。从你说的那些蠢话来看，你决定把它当作噩梦。你甚至都不认识一个叫“内穆斯”的人……你心想。不管怎样，你");
         }
         else
         {
            outputText("下巴上的一阵轻微瘙痒将你从睡梦中拉了出来，那轮熟悉的血红月亮映入你惺忪的睡眼。你");
         }
         outputText("似乎是在户外醒来的，虽然很难看清你到底在哪里，因为四周漆黑一片，你的视力才刚刚开始适应黑暗。不过，你对自己一丝不挂并不感到惊讶；感觉这几天你已经习惯了这种自然状态。由于不确定自己的下落或是否安全，你认为明智的做法是先等一等，让你周围淡红色的环境变得清晰一些，然后再继续前进。[pg]");
         outputText("几分钟令人紧张的等待后，你意识到自己身在何处：营地以北的一小片空地。你从地上爬起来，开始四处张望，在远处看到了你认为是熟悉的营火光芒。只需再粗略地扫视一下周围，你便决定往回走，急切地想回到你的床上。然而，当你迈出第一步时，你的身体就被推倒在地。你头部的右侧重重地撞在柔软的泥土上，力道大到让你失去了平衡。你迅速尝试重新站稳脚跟，将同样的精力倾注在倾听周围环境和努力保持直立上。世界很快停止了向一侧倾斜，让你的眼睛和耳朵保持高度警惕，寻找攻击者。你轻轻地向前迈出一步，高度戒备，试图在周围黑暗沙沙作响的树林中分辨出任何东西。你开始大声询问是否有人在那里，但还没等一个音节从你嘴里溜出来，你就朝着相反的方向摔倒在地。[pg]");
         outputText("谢天谢地，这次你准备得更充分了，你的反应能力提高到足以让你免于再次撞到脑袋。你也感觉到了推力是从哪里来的：你的[chest]。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("当你坐起来开始拼凑线索时，一个熟悉的声音打断了你，[say: 你有时间去操翻玛瑞斯里的每一个人，却懒得花一点时间陪陪这些宏伟的肉团？] 埃克斯加图安说话时，你感觉到你的[chest]在晃动，结果却被它们猛地向前一拉，脸又栽进了土里。[say: 我只好确保你永远不会再忘记了。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 4)
         {
            outputText("又是埃克斯加图安；你已经有一阵子没爱抚她了。[say: 渴望再来一回合吗，勇者？] 你的[chest]问你，为了强调还剧烈地晃动着，[saystart]我本希望之前的教训");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) >= 2)
            {
               outputText("");
            }
            outputText("能让你长点记性，但我猜你需要重修这门课了。[sayend] 还没等你组织好语言回应，你那巨大的乳房又一次把你的脸按到了地上。[say: 挫折教育现在开始。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 8)
         {
            outputText("[say: 你是脑子进水了吗，勇者？] 埃克斯加图安大喊道，你那巨大的双峰随着她的每一个字剧烈地跳动着，[say: 我会把你打到失去知觉，直到我把你脑子里那空洞的粪坑清理出一些空间！] 你想试着让她冷静下来，但你的[chest]立刻把你的脸重重地砸进了泥土里。[say: 别再妄想你能忽视我哪怕一秒钟！]");
         }
         else
         {
            outputText("还没等另一个念头闪过你的脑海，你的[chest]就飞起来扇了你一巴掌！[say: [name]，又到了那个时候了，] 渴望的恶魔女挑逗着你。你觉得她已经开始享受折磨你的过程了。[say: 如果你坚持日复一日地不花点时间陪陪这些奶子，那我就只好坚持用别的方式教导你了。] 你美丽的胸部向前猛冲，把你的脸又一次砸进了泥土里。");
         }
         outputText("你抬起头，足以抖落粘在身上的泥土，但不敢抬得太高，以免给恶魔女再次把你扔来扔去的机会。草成了你的锚，你的双手紧紧抓住任何能抓住的东西。");
         if(get_player().cor < 50)
         {
            outputText("埃克斯加图安今晚的折磨已经够久了。");
         }
         else
         {
            outputText("你和其他生物一样喜欢前戏，但这太荒谬了。");
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("[say: 别以为你能像那些在你梦里出没的弱小恶魔一样制服我，勇者。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 4)
         {
            outputText("[say: 我们的课程还没开始呢，勇者。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 8)
         {
            outputText("[say: 你怎么能忘记爱抚这些奶子！？挑逗这些乳头！？]");
         }
         else
         {
            outputText("[say: 这次除了杂草，你找到什么能抓的东西了吗？看起来并没有。]");
         }
         outputText("你感觉到胸口散发出一丝微弱的温暖，紧接着你的[chest]竟然把你拉到了半空中！你与大地的微弱联系要么滑脱，要么被连根拔起，让你完全任由你那被附身的肉垫摆布。你刚站稳脚跟没多久，你的胸部就再次发起了攻击，轻松地把你甩来甩去，而埃克斯加图安则在一旁嘲笑你。当你第三次摔向地面时，你终于决定用双臂锁住你那叛逆的奶罐，手指尽可能用力地掐进你的[skin]里。你那强壮的小狗在你死命的抓握下流动，压力变成了快感，你的挣扎也化为了困惑。女恶魔在你的掌控下推搡摇晃，而你的脚步则不断调整以保持平衡。似乎她被抚摸的欲望比她战斗的欲望更强烈，你那波涛汹涌的双峰剧烈的动作慢慢变得更加平缓和放松。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("[say: 好吧，我想你已经受够了，勇者，] 埃克斯加图安让步了，不断积聚的欲望背叛了她平时嘲弄的行为，[say: 现在我们为什么不继续做我们都想做的事呢，嗯？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 4)
         {
            outputText("[say: 准备好迎接你的期末考试了吗，嗯，[name]？] 埃克斯加图安戏弄道，她声音中微弱的淫荡颤音与她那盛气凌人的态度形成了鲜明对比，[say: 让我们把这次变成难忘的回忆吧。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 8)
         {
            outputText("[say: 你觉得你现在能记住了吗！] 埃克斯加图安恼怒地喊道，你的乳房最后一次推开你的抓握，[say: 现在别浪费我的时间了，去做你唯一还算擅长的事吧。]");
         }
         else
         {
            outputText("[say: 我想今晚的开场戏就到此为止了，] 埃克斯加图安刺激道，她的声音一如既往地霸道，[say: 我知道你迫不及待地想看压轴大戏了。]");
         }
         outputText("你紧紧抱住[chest]的双手慢慢松开，你的乳房高高挺起，准备迎接它们渴望已久的关注。");
         if(get_player().cor < 50)
         {
            outputText("尽管想要揉捏双峰的冲动正在慢慢增长，但你至少还有理智在开始之前拍掉身上的泥土和草屑。你可能正在慢慢屈服于从你娇小的肉包中散发出的邪恶腐化，但你没理由连外表也要变得那么狼狈。当你换个地方时，空地边缘的一块光滑岩石成了你的靠背；你至少想尽量避免今晚再在泥土里打滚。即使在黑夜中，你也能看清你的[chest]，它们无视重力，焦急地等待着你的触摸，它们那挺拔的傲慢正在无声地瓦解你的决心。");
         }
         else
         {
            outputText("折腾现在已经结束了，你渴望地凝视着你那雄伟的山峰。你至少能忍住不去摸它们，直到你转移到空地边缘的一块光滑岩石上；毕竟当你直立时，它们更容易处理。你迅速拍掉它们上面的任何泥土，完全不顾你身体其他部位的任何东西。你现在关心的只有满足你宠爱双乳的渴望。");
         }
         outputText("[pg]");
         outputText("当你的双手抬起准备开始工作时，你感觉自己对它们的控制正在溜走。女恶魔已经像往常一样掌握了主动权。");
         if(get_player().cor < 50)
         {
            outputText("你越来越清楚地认识到，当你真正决定理会她时，她显然就是无法袖手旁观。");
         }
         else
         {
            outputText("你很高兴能坐下来，享受只有她能带给你的专业揉捏。");
         }
         outputText("你的双手毫不耽搁，抚摸着你每一寸肌肤。它们以最轻柔的优雅轻轻拂过；它们以任何专业按摩师的卓越技巧进行挤压。任何特别敏感的部位都会得到额外的关注，引出你轻柔的呻吟，因为它们只会在你全身散发出更多的温暖。你感觉自己仿佛要融化在支撑你的岩石中，随着你茫然的目光投向天空，快感只会不断增加。");
         if(get_player().get_gender() > 0)
         {
            outputText("你的[hips]开始互相摩擦，被");
            if(get_player().hasCock() && !get_player().hasVagina())
            {
               outputText("先列腺液");
            }
            if(get_player().hasVagina() && !get_player().hasCock())
            {
               outputText("淫液");
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("先列腺液和淫液混合而成的芳香鸡尾酒");
            }
            outputText("弄湿，因为你的乳房按摩开始刺激你的下半身。");
         }
         outputText("女恶魔继续她的工作，但从未触碰你的乳头；她引导你的双手最接近的地方是你的乳晕周围。这种打圈的动作并不比你没有忽视她时更不刺激，你的背部再次因渴望而弓起。[pg]");
         outputText("你那巨大的腺体颤抖着，它们开始说话，[say: 像往常一样，你和我一样渴望这个。这只会让人想问，你怎么会想到要忽视我。] 你能感觉到你的乳房变得丰满，这似乎是女恶魔不太微妙的优越感姿态，[say: 好吧，继续吧，勇者。满足你的欲望吧。] 你的双手悬停在你的[nipples]上方，仿佛在等你接管控制权。");
         if(get_player().cor < 50)
         {
            outputText("此时你已经深陷其中，无法抗拒。");
         }
         else
         {
            outputText("你在焦急的期待中扭动着手指。");
         }
         outputText("你终于下定决心抓上去……什么都没有？<b>你的乳头不见了！</b>当你困惑地在你的[chest]上摸索时，激情开始消退。[say: 怎么了，勇者？]埃克斯加图安明知故问，[say: 这对你来说太难了吗？]你的指尖在乳晕周围梳理，直到你在原本应该是乳头的地方发现[skin]向内凹陷。显然，埃克斯加图安还没玩够；这个该死的妖女竟然把你的乳头吸进去了！还没等你弄明白她是怎么在不知不觉中做到这一点的，你那不起眼的双峰就开始发麻。你感到一阵焦急的颤抖顺着脊椎向上蔓延，随后一种熟悉的渴望开始流遍全身：想要被挤奶的渴望！");
         if(get_player().cor < 50)
         {
            outputText("无论是不是人为造成的，你都无法否认；如果不是因为你已经忙于应对不断高涨的激情和欲望，你可能早就开始咒骂这个可恶的恶魔了。");
         }
         outputText("当你徒劳地抓挠着那紧闭的封口时，你开始感觉到有液体渗出。");
         if(get_player().biggestLactation() < 1 || get_player().lactationQ() == 0)
         {
            outputText("<b>你的[chest]开始大量分泌乳汁。</b>");
         }
         else if(get_player().biggestLactation() < 4)
         {
            outputText("<b>你的乳房分泌的乳汁达到了新的高度。</b>");
         }
         if(get_player().biggestLactation() < 4)
         {
            get_player().boostLactation(3);
         }
         outputText("但由于你的乳头处于内陷状态，释放成了一个难以企及的梦想，导致你的乳房随着母乳的充满而慢慢膨胀。[pg]");
         outputText("即使有那一点点渗出的液体润滑，埃克斯加图安的紧握也太牢固了，连一根手指都插不进去。你的呼吸开始加快，双手只能焦急地在你那颤抖的肉球表面打转。轻柔的抚摸让你发出一声深沉的叹息，但你想要触碰乳头的狂热仍然是首要的。心不在焉的抚摸很快停止了，你的双手捂住了原本乳头的位置。你那不断变大的双乳晃动着，恶魔嘲笑着你，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("[say: 也许与其梦想着被小恶魔操和探索古墓，你更应该记住好好照顾这些诱人的爱之小松饼。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 4)
         {
            outputText("[say: 我猜你已经准备好毕业了。只是别忘了你今天在这里学到的东西。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) < 8)
         {
            outputText("[say: 永远别再忘了这些诱人的奶子是你生命中最重要的东西，勇者。否则我会让你再次想起来的。]");
         }
         else
         {
            outputText("[say: 好了，这很有趣，[name]。如果你再次忘记满足我的需求，我期待着把你打得失去知觉，并享受美妙的补偿按摩。]");
         }
         outputText("[pg]");
         outputText("你的[chest]开始隆隆作响并震颤起来，让你充满了焦虑、恐惧和激情的混合情绪。片刻之后，一股巨大的力量冲破了你的双手；你的乳头重新弹了出来，湿漉漉的，准备好——等一下……");
         if(get_player().averageNipplesPerBreast() > 1)
         {
            outputText("曾经你有多个乳头的地方，现在每个乳房上只剩下一个");
            if(get_player().nippleLength < 4)
            {
               outputText("，每一个都肿胀到至少四英寸长，直径约三英寸！");
            }
            else
            {
               outputText("。");
            }
         }
         else if(get_player().nippleLength < 4)
         {
            outputText("你的乳头变得比以前大得多，每一个都肿胀到至少四英寸长，直径约三英寸！");
         }
         else
         {
            outputText("你的乳头比你记忆中要粗得多，直径增加到了至少三英寸。");
         }
         outputText("不过你并没有太在意这些变化。你那被施了魔法的胸部至少长了一个罩杯，而且乳汁正滴落得你满身都是");
         if(get_player().get_gender() > 0)
         {
            outputText("，与");
            if(get_player().get_gender() == 1)
            {
               outputText("先列腺液");
            }
            else if(get_player().get_gender() == 2)
            {
               outputText("女性精液");
            }
            else
            {
               outputText("液体");
            }
            outputText("混合在一起，已经覆盖了你的[hips]。");
         }
         else
         {
            outputText("。");
         }
         outputText("勇者想把这些瓜榨干。[pg]");
         outputText("你的双手开始在乳头上忙活，这里拉一下，那里摸一下，手指探索着你巨大乳房的里里外外。没过多久，你的水龙头就达到了高潮，你的双手紧紧抓住它们，乳汁四处喷洒，你的[chest]随着每一次喷射而扭动。在黑暗中很难看清你的乳汁喷了多少，喷了多远，但从这漫长的兴奋感来看，你确信自己留下了印记。当原本挺拔的乳房屈服于重力，恢复到原来的状态时，你知道埃克斯加图安已经陷入了沉睡，经过一晚上的翻腾、拉扯和挑逗，酸痛感开始蔓延。");
         if(get_player().cor < 50)
         {
            outputText("随着人工压力的消退，你长叹了一口气，取而代之的是兴奋带来的欲望的轻微增加。等你休息好了，就得处理一下这个问题。不幸的是，你强大的乳汁喷泉已经把你和周围的土地都淋湿了，泥土变成了泥巴，你想干干净净地离开这里的愿望成了泡影。你拾起仅存的一点自尊，走回营地，身后留下了一道乳汁的痕迹。");
         }
         else
         {
            outputText("你的指尖继续在你的[skin]上扫过，似乎在否认这个激动人心的夜晚已经结束。你抬头看着那轮永远存在的月亮，它那深红色的光芒就像你刚到玛瑞斯的那天一样充满不祥之兆。你盘算着要不要为自己的健忘向女恶魔道歉。不过，无论是为了你的自尊还是她的自尊，你决定还是把这个想法搁置起来。埃克斯加图安关心的只有关注和做爱，最好不要试图把她变成一个健谈的人。如果你真的在乎她，最好还是时不时地照顾她一下。至少在你解决完自己的欲望之后。你摇了摇头，让自己清醒过来，扬起了一些尘土。这场[say: 地球上的乳房秀]让你浑身湿透，你的乳汁把周围的泥土变成了泥巴。你觉得最好还是等回到营地再操心这件事。你开始往回走，当你看到身后留下的乳汁痕迹时，脸上渐渐浮现出一丝微笑。");
         }
         dynStats(DynStat.Lust(5),DynStat.Cor(2));
         get_player().orgasm("Tits",false);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,414,FlagDict_Impl_.arrayReadInt(_loc1_,414) + 1);
         get_player().changeStatusValue(StatusEffects.Exgartuan,2,25);
         doNext(playerMenu);
      }
      
      public function boobgartuanSurprise2() : void
      {
         spriteSelect(SpriteDb.get_s_exgartuan());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("一出房间，你根本没时间决定往哪个方向走；你的举动已经引起了不必要的注意。头顶传来刺耳的号角声，远处小恶魔的尖叫和争吵声也越来越大。你拼命朝东边相反的方向跑去，在左边下一个拐角处停下，顺着外面听起来像是一场猛烈雷暴的声音走去。你踩在湿滑的鹅卵石地面上，轻松的步伐很快就伴随着刺耳的摩擦声停了下来。看来你来到了一个小餐厅，里面到处都是碎屑和废弃的武器。正对着你的房间对面是通往庭院的门，这是你通往自由列车的最后一站。但有一只小恶魔挡在路上。[pg]");
            outputText("然而，这不是一只普通的小恶魔；如果是的话，你早就把它揍出屎来了。挡住出口的是“小不点”，对于这个七英尺高、肌肉极其发达、身披装甲的庞然大物来说，这显然是个讽刺的绰号。这个怪胎的四肢和头部都垫着装甲，下巴上还包着巨大的铁甲，导致他的下巴显得极其突出，让他原本微小的头部和豆豉般的小眼睛相形见绌。除了上述沿着手臂、膝盖和头部延伸的装甲外，这个野蛮人全身赤裸，巨大的阴囊在风中摇晃。这个蠢货在门框里摆好姿势，双腿弯曲，双臂张开，就像一个防守线卫，拒绝给你宝贵的自由。[pg]");
            if(get_player().cor < 33)
            {
               outputText("[say: 嘿，小不点，还记得我吗？]");
            }
            else if(get_player().cor < 66)
            {
               outputText("[say: 看来你比我们上次见面时没变漂亮多少啊，小不点，]");
            }
            else
            {
               outputText("[say: 是时候挨操了，种马，]");
            }
            outputText("你开玩笑说。这杂种只是对你咆哮并绷紧了身体，你试图进行含蓄谈判的尝试被他迟钝的头盖骨弹开了。你身后的骚动开始变得越来越大；骑兵到达的时间不多了。你开始快速扫视房间，寻找任何可以用来对付这个笨蛋的东西。在他上方，你看到了几个相当大的木桶。从摇摇欲坠的木头和泄漏的液体来看，它们似乎很古老，而且缺乏维护。[pg]");
            outputText("小恶魔们绕过你身后的拐角，留给你制定计划的时间所剩无几。你捡起靠在墙上的一把看起来破旧不堪的阔剑，双手握住它的护手。你开始像一个新手铁饼运动员一样在原地旋转，剑绕着你旋转，钝刃朝外。随着你[leg]的稳稳站立，你松开握剑的手，让它飞向空中，你的[chest]在它们继续圆形轨迹时差点让你失去平衡。[pg]");
            outputText("这只怪物小恶魔举起臂甲保护自己的大嘴，准备迎接那永远不会到来的打击。相反，巨大的剑砸进了头顶的木桶，红酒将这个暴徒和周围区域淋了个透。不过，你没有时间庆祝，因为逼近的小恶魔已经到了你的位置。当这个笨蛋在原地跌跌撞撞时，你冲向小不点，双脚朝前扑倒，多亏了被酒滑湿的地板，你直接从他身下滑了过去。");
            if(get_player().cor < 33)
            {
               outputText("你的[chest]擦过小恶魔巨大的阴囊，导致他最终因为这种感觉而摔倒，挡住了你身后阻碍你的小恶魔随从。");
            }
            else if(get_player().cor < 66)
            {
               outputText("当你从野兽身下滑过时，你趁机拍打他那对宝贝，像玩一对新奇的邦戈鼓一样玩弄它们。这种感觉导致他摔倒，挡住了你身后阻碍你的小恶魔随从。");
            }
            else
            {
               outputText("当你从这个笨蛋身下滑过时，你的脸上露出了恶魔般的微笑，在他下垂的阴囊上快速地亲吻了一下。这种感觉导致他在困惑中摔倒，挡住了你身后阻碍你的小恶魔随从。");
            }
            outputText("[pg]");
            outputText("当你步入猛烈的雷暴中时，一声雷鸣迎接了你的到来，雨水浸透了你赤裸的身体。一个足球场长度的泥泞庭院横亘在你和小恶魔堡垒的外墙之间。正当你准备再次出发时，身后屋顶上砰的一声门被撞开的声音传入你的耳朵。[say: 把你们的屎收起来，你们这些喋喋不休的白痴！][pg]");
            outputText("内穆斯在上面大声下达命令，挥舞着他的手杖，他空闲的手仍然紧紧抓住他的伤口。[say: 我要这个" + get_player().mf("混蛋","荡妇") + "死！不惜一切代价！]他眼中燃烧的怒火让他的战友们行动起来。他们跳向大炮，准备对你进行最后一次绝望的攻击。你把这次有组织的行动当作你逃跑的信号，恢复了你向出口迈进的轻快步伐。幸运的是，小恶魔们的瞄准能力和他们束缚你的能力一样好，倾盆大雨对他们的任务毫无帮助。抛射物摧毁了你周围的一切，碎片、泥土和泥浆四处飞溅。你灵巧地左右躲闪，轻松地避开了朝你飞来的一切。[pg]");
            outputText("然而，驻扎在门口的几个小恶魔给你的计划带来了麻烦。伴随着一些胜利的嚎叫，上面的一只小恶魔设法踢翻了附近的一个杠杆，导致巨大的入口开始砰的一声关上。即使以你惊人的速度，你也无法及时赶到。你转而将目光集中在前方一只冲锋的小恶魔身上，他挥舞着一把大锤。当你靠近他时，你开始制定你下一步超人力量的策略。但还没等你走到第二步，一颗炮弹从你头顶呼啸而过，撞上了他的武器，从上面弹开，撞进了一个看起来像小马厩的支撑梁。小小的屋顶向前倒塌，提供了一条倾斜的通往自由的路线。你忍不住对自己的好运嗤之以鼻，在你疯狂的冲刺中撞倒了前方困惑的小恶魔。[pg]");
            outputText("一个跳跃，一个攀爬，再加上一个华丽的空翻，你已经到达了小恶魔最后一道防线的顶端，再跳一次就能逃脱了。你最后一次回头，并且");
            if(get_player().cor < 33)
            {
               outputText("向内穆斯挥手告别");
            }
            else if(get_player().cor < 66)
            {
               outputText("向内穆斯飞吻");
            }
            else
            {
               outputText("朝内穆斯竖起一个大大的中指");
            }
            outputText("，在风暴中远远地辨认出他的轮廓，正气急败坏地跳来跳去。大功告成后，你从墙上一跃而下，准备越过环绕堡垒的护城河。当你腾空而起，远离小恶魔堡垒时，时间似乎变慢了。[pg]");
            outputText("你感到胸口突然一沉。低头一看，你的[chest]似乎正在迅速膨胀！更糟糕的是，它们的[skin]正在你眼前变成粗糙的石头！恐惧迅速蔓延，你那雄伟的跳跃很快失去了动力。你拼命地伸手去抓陆地，但最近的落脚点似乎离你越来越远。随着胸前挂着的石头重物将你拖入下方浑浊的水中，你越来越难以抓住边缘。你只能看清下方无尽的黑暗，上方闪电的微弱光芒随着你沉入深渊而变得越来越遥远。你伸出的手是你完全被黑暗吞噬前看到的最后一样东西。你那丰满的乳房，此时已经有你三倍大，继续拉扯着你的胸口，感觉就像是在把你的生命力抽干。[pg]");
            outputText("有那么一瞬间，你发誓你感觉到它们在隆隆作响……在嘲笑你……");
         }
         doNext(boobgartuanSurprise3);
      }
      
      public function boobGartuanSURPRISE() : void
      {
         spriteSelect(SpriteDb.get_s_exgartuan());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,414) == 0)
         {
            outputText("一阵窃笑声将你从睡梦中唤醒。两只小恶魔正在互相喋喋不休，其中一只把手伸进他的缠腰布里，正享受着夜晚。你想动一下，却发现双臂被摊开并用挂锁锁在你身后的墙上，你赤裸的身体无助地悬挂在上面。快速瞥了一眼周围，你发现了你的石头住所：一个阴暗潮湿、光线昏暗的小房间，没有窗户，墙上随意散落着一些小摆件和变态玩具。房间中央偏一点的地方放着一张普通的木桌，上面放着一些金币、水罐和一个皮袋。还没等你仔细看，其中一只小恶魔突然立正，打了一下那个……正忙着的小恶魔的胸口，[say: 精神点，白痴！那个" + get_player().mf("蠢货","荡妇") + "醒了。去叫老大！] 第二只小恶魔的手从裤裆里抽出来，在空气中洒出一些精液。他张着嘴点了点头，然后在他旁边的大木门上敲了两下。停顿片刻后，你能听到木头撞击石头的声音，夹杂着赤脚的脚步声。[pg]");
            outputText("门被猛地推开，一只四英尺高的小恶魔站在那里。他手里举着一根大拐杖，大概就是他用来推开门的东西。他的另一只手背在身后，藏着什么东西不让你看到。这个微型怪物比他那些浮夸的同类更有棱角，左脸戴着一个大眼罩，穿着一条看起来像老虎皮的短背带裤，而不是标准的缠腰布。显然，这只小恶魔一定非常自命不凡。[pg]");
            outputText("[say: [name]！] 他轻蔑地喊道，脸上浮现出一丝冷笑，[say: 多久没见了？][pg]");
            if(get_player().cor < 33)
            {
               outputText("[say: 恐怕还不够久，内穆斯！]");
            }
            else if(get_player().cor < 66)
            {
               outputText("[say: 老实说，太久了。这些年来你变慢了，内穆斯，]");
            }
            else
            {
               outputText("[say: 我还担心你把我忘了呢，内穆斯。你从来不写信，]");
            }
            outputText("你回答道，回敬了他一个讽刺的表情。[pg]");
            outputText("小恶魔暗自窃笑，开始向你靠近。他走起路来有点瘸，这也解释了拐杖的用途。一路上，小恶魔把他的手杖伸到桌子底下，勾住一个小脚凳，把它拖到你面前。即使有了这个杠杆，他的眼睛也只能平视你的下唇。[say: 漫长的三年，[name]。三年……为了夺回属于我的东西。][pg]");
            outputText("内穆斯慢慢地看向桌子，盯着那个皮袋。你捕捉到了它特殊内容物闪过的一丝光芒。[say: 我怎么也想不到，这么多年后，你竟然会把神像直接送到我手里！] 小恶魔脸上的笑容越来越大，他开始把藏在背后的手抽出来，[say: 它和我的神像简直是绝配。] 他慢慢张开手指，露出了那个巨大的金色神像：一尊僵硬的雕像，类似于印加遗物，只是它当然有着巨大的垂直勃起。这是你以前拥有的那个的完美复制品。[pg]");
            outputText("[say: 终于，有了这两个神像，我终于可以解开埃克塞波安的坟墓……并获得他古老的力量。] 内穆斯把神像紧紧攥在手心，他轻蔑的表情变得更加疯狂，[say: 这个世界将匍匐在我的脚下，就像它一直以来的那样。][pg]");
            outputText("你的脸保持平静，一丝优越感仍在其中游荡，[say: 真的会那么简单吗，内穆斯？我们都知道那个坟墓里还有比……更多的东西。][pg]");
            outputText("当小恶魔的手迅速抓住你的[chest]，把手杖和金色神像扔到坚硬的地板上时，你的警告变成了呻吟。[say: 我不需要你任何明智的建议，[name]，] 内穆斯戏弄道，他的眼睛盯着你，同时继续抚摸你的乳房，[say: 你现在不过是我的战利品。这可不是一个适合提建议的位置，你不同意吗？] 当他那肮脏的手继续抚摸你巨大的乳房时，你开始向后仰起头。这个恶魔慢慢向你靠近，他不修边幅的指甲戏弄着你敏感的[skin]。你开始感觉到他背带裤粗糙的布料摩擦着你，这是他僵硬的阴茎带来的。内穆斯继续向你靠近。[pg]");
            outputText("突然，你脸上的愉悦消失了，你现在坚定的目光锁定了这个小可怜。还没等他反应过来，你的额头就狠狠地撞向了他的额头，把他从脚凳上撞得踉踉跄跄地摔倒在地上，把他的欲望都撞飞了。旁观的小恶魔被你的爆发吓得退缩了，当你坚定不移的目光转向他们时，他们颤抖得更厉害了。你把脚踩在脚凳上作为杠杆，双手握紧拳头。似乎毫不费力，你向前弯曲它们，粉碎了你的镣铐。在目睹了你惊人的壮举后，小恶魔的眼睛睁得像平底锅一样大。一个念头穿过瘫痪的恐惧进入第二只小恶魔的脑海，让他把他的朋友打醒，[say: 拉响警报，白痴！][pg]");
            outputText("第一只小恶魔点点头，他的眼睛仍然充满恐惧。当他冲向牢房角落里那个奇怪的装置时，你扑向靠在旁边墙上的一根皮鞭。他虚弱的手臂在墙上看起来像小号吹嘴的东西前停了下来，被你的武器抓住了。眨眼间，你把小恶魔拉到半空中，扔下鞭子，把拳头对准他，然后打在他丑陋的脸上。在瞬间，你可以看出他的头试图包裹住你的手，因为它在巨大的冲击力下扭曲了。小恶魔向后翻滚，撞向他的朋友，把他们两个都打晕了。[pg]");
            outputText("对你的杰作很满意，你揉了揉指关节，然后走到桌子旁，拿起皮袋。当你把它挂在身上时，它和以前一样合适。你转过身走向内穆斯，这个小混蛋在持续的痉挛和抱头之间试图对你怒目而视。");
            if(get_player().cor < 33)
            {
               outputText("[say: 我一直想知道你把它放在哪里。]");
            }
            else if(get_player().cor < 66)
            {
               outputText("[say: 恐怕这份快递你只能退回给寄件人了。]");
            }
            else
            {
               outputText("[say: 你的阴谋诡计就跟你的床技一样烂，内穆斯。]");
            }
            outputText("你调侃道，弯下腰捡起第二座神像，稳稳地放进皮袋里。你迅速向内穆斯挥手告别，然后冲向门口。[pg]");
            doNext(boobgartuanSurprise2);
            return;
         }
         boobgartuanSurprise3();
      }
   }
}

