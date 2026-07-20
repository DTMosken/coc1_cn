package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.forest._TamaniScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class TamaniScene extends BaseContent implements Encounter, TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var tamaniDaughtersScene:TamanisDaughtersScene;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var globalSave:Boolean;
      
      public function TamaniScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "tamani";
         saveContent = new SaveContent(null);
         tamaniDaughtersScene = new TamanisDaughtersScene();
         super();
         pregnancy = new PregnancyStore(1199,1200);
         pregnancy.addPregnancyEventSet(25,[96,48]);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            tamaniGivesBirth();
         }
         return false;
      }
      
      public function tamaniVictoryMenu() : void
      {
         var _g1:TamaniScene;
         var _g:Combat;
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2274,FlagDict_Impl_.arrayReadInt(_loc1_,2274) + 1);
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2274) >= 4)
         {
            outputText("如果你厌倦了塔玛尼总是试图强迫你，你可以决定再也不去见她了。");
            addButton(10,"受够了！",killTamaniChoice);
         }
         _g = get_combat();
         setSexLeaveButton(function():void
         {
            _g.cleanupAfterCombat();
         });
         addButtonDisabled(0,"操","这个场景需要你拥有阴茎并有足够的性欲。");
         addButtonDisabled(1,"肛交","这个场景需要你有一个合适的阴茎和足够的欲望。");
         addButtonDisabled(2,"产卵","这个场景需要你拥有蜘蛛产卵管和足够的卵。她不能处于怀孕状态。");
         if(get_player().get_lust() >= 33 && get_player().hasCock())
         {
            outputText("你可以操她，但如果只是为了这个，你干嘛还要费劲和她打架呢？");
            _g1 = this;
            addButton(0,"操",function():void
            {
               _g1.tamaniSexWon();
            });
            if(get_player().hasCockThatFits(get_monster().analCapacity()))
            {
               addButton(1,"肛交",tamaniAnalShits);
            }
         }
         if(!pregnancy.get_isPregnant() && get_player().canOvipositSpider())
         {
            addButton(2,"产卵",tamaniBeaten);
         }
         if(!get_player().hasKeyItem("Deluxe Dildo"))
         {
            addButton(3,"拿走假阳具",tamaniStealDildo).hint("这个坏女孩不配拥有这么好的玩具。");
         }
      }
      
      public function tamaniStealDildo() : void
      {
         clearOutput();
         get_images().showImage("item-dDildo");
         outputText("胜者为王，败者为寇。你打开她的背包，往里面看了一眼。");
         outputText("[pg]<b>(你发现了一个制作精良的粉色假阳具！)</b>");
         get_player().createKeyItem("Deluxe Dildo",0,0,0,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function tamaniStartFight() : void
      {
         clearOutput();
         outputText("塔玛尼摆出战斗姿势，说道：[say: 如果必须的话，我会把你体内的孩子们打出来！]");
         startCombat(new Tamani());
      }
      
      public function tamaniSexWon(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         tamaniKnockUp();
         var _loc2_:int = get_player().cockThatFits(90);
         if(_loc2_ == -1)
         {
            _loc2_ = get_player().biggestCockIndex();
         }
         clearOutput();
         get_images().showImage("tamani-win-fuck");
         if(get_player().cockArea(_loc2_) <= 90)
         {
            if(param1)
            {
               outputText("你抓住那个失去知觉的地精染成粉红色的头发，把她推到泥里，对她不断的要求和强奸企图感到恼火。这个饥渴的荡妇甚至没有为自己的失败感到羞耻的觉悟。她只是躺在泥里，在空中来回扭动着她暴露的屁股，试图用它来诱惑你。[pg]");
            }
            else
            {
               outputText("你抓住那个失去知觉的地精染成粉红色的头发，把她推到泥里。这个饥渴的荡妇只是躺在泥里，在空中来回扭动着她暴露的屁股，试图用它来诱惑你。[pg]");
            }
            outputText("这个目标太诱人了，让人无法抗拒。你解开你的[armor]，让你的[cocks]自由地垂下来。你已经因为这诱人的展示而勃起了，片刻之后，你就压在了她那被欲望浸湿的小穴上");
            if(get_player().totalCocks() > 1)
            {
               outputText("和紧致的屁眼");
            }
            outputText("。你不给她任何发言权，向前推进，感觉小女孩的肉体在");
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每一根");
            }
            outputText("粗壮的肉棒");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("周围退让。她高兴地尖叫着，显然得到了她想要的东西。有那么一瞬间，你对自己感到失望，但她紧致的洞口");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("紧紧夹住并挤压你的感觉很快就冲刷掉了这种感觉。[pg]");
            outputText("你有节奏地前后摇摆，把塔玛尼当成一个紧致的飞机杯。这个地精荡妇的双手揉着她的肚子，甚至没有试图把她的脸从泥里拔出来，她像个妓女一样呻吟和咯咯地笑着。你继续操弄着她的小穴，就像一个");
            if(get_player().get_gender() == 1)
            {
               outputText("男人");
            }
            else
            {
               outputText("扶他");
            }
            outputText("着了魔一样，以残酷的效率进进出出，荡妇汁液湿润的吧唧声驱使你以更大的力量像活塞一样前后运动。她高兴地咯咯笑着，她的");
            if(get_player().totalCocks() == 1)
            {
               outputText("小穴紧紧地挤压着，因为她高潮了。[pg]");
            }
            else
            {
               outputText("洞口紧紧地挤压着，因为她高潮了。[pg]");
            }
            if(get_player().totalCocks() > 1)
            {
               outputText("你的每一根[cocks]都在跳动，在你的地精肉体监狱里痉挛，向这个快乐的荡妇喷洒出一点粘稠的液体。你能听到她语无伦次地嘟囔着，沉醉在快感中，在你周围颤抖，[say: 操，是的！射——啊——射进我里面！操操操操操操，太爽了！哦，就是这样，把我按在泥里，让我看看谁才是老大！]这些话似乎达到了预期的效果，帮助你把每一滴精液都射进这个荡妇紧致的洞里。");
               if(get_player().cumQ() >= 250)
               {
                  outputText("她喘着粗气，在泥泞中转过头，看着自己的肚子肉眼可见地膨胀起来，被精液完全塞满。");
               }
               if(get_player().cumQ() >= 500)
               {
                  outputText("没过多久，一条精液汇成的河流从她体内涌出，在下方汇聚成一滩，因为你注入的精液已经超出了她身体的容纳极限。");
               }
            }
            else
            {
               outputText("你的[cocks]在你的地精肉体牢笼中脉动、痉挛，将一点黏糊糊的液体喷洒进这个快乐的荡妇体内。你能听到她语无伦次地嘟囔着，沉醉在快感中，在你周围颤抖，[say: 操，爽！射——啊——射进我里面！操操操操操操操爽死了！哦哦哦，就是这样，把我按在泥里，让我知道谁才是老大！] 这些话似乎达到了预期的效果，帮助你将每一滴精液都清空到这个荡妇紧致的小穴里。");
               if(get_player().cumQ() >= 250)
               {
                  outputText("她喘着粗气，在泥泞中转过头，看着自己的肚子肉眼可见地膨胀起来，被精液完全塞满。");
               }
               if(get_player().cumQ() >= 500)
               {
                  outputText("没过多久，一条精液汇成的河流从她体内涌出，在下方汇聚成一滩，因为你注入的精液已经超出了她身体的容纳极限。");
               }
            }
            outputText("[pg]塔玛尼眨了眨眼，一边吮吸着手指一边踉跄着站起来。她娇嗔道：[saystart]嗯……塔玛尼最喜欢被她的" + get_player().mf("性感爱人","种马") + "支配了。你觉得你的");
            if(get_player().balls > 0)
            {
               outputText("性感的蛋蛋里还有");
            }
            else
            {
               outputText("甜美的肉棒里");
            }
            outputText("还有多余的奶油可以给我吗？[sayend][pg]");
            outputText("她没有给你回答的机会，摇摇晃晃地走开了，身上该有肉的地方都在诱人地晃动着，[say:你当然有。我晚点再来要剩下的！][pg]");
            get_player().orgasm("Dick");
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("你把塔玛尼按倒在地上，你已经被欲望冲昏了头脑，根本不在乎这个小荡妇的感受。她绝对不可能吃得下");
            if(get_player().totalCocks() > 1)
            {
               outputText("你任何一根巨大的肉棒");
            }
            else
            {
               outputText("你巨大的肉棒");
            }
            outputText("，所以你抓住她的脚踝，用她柔软的脚底包裹住你自己。你开始自慰，把塔玛尼当成一个可爱但可有可无的自慰工具。她咬着指甲，一边看着你，一边揉捏着她的" + tamaniChest() + "，尽力为你表演。这个小荡妇似乎很喜欢这样。[pg]");
            outputText("她的脚开始被你的汗水和先列腺液弄得湿滑，随着你继续将自己推向高潮，她的脚毫不费力地在你的肉棒上滑动。你看着塔玛尼将手指伸进她饥渴小穴湿滑的褶皱中，因为被这样变态地使用而兴奋不已。她娇喘着，[say: 我的脚感觉怎么样，" + get_player().mf("stud","slut") + "？当它们在你的肉棒上滑动时，是不是又软又滑？你要为塔玛尼射精，把她涂成白色吗？你会的。你知道你会的。为塔玛尼射精吧。][pg]");
            outputText("哦，天哪，你真是……只要把精液全都射在她紧致娇小的身体上，把她从头到脚淋个透，那该多容易啊。你知道她会喜欢的。见鬼，你也会喜欢的，但你想让她等着。你的双手不停地滑动、揉捏，用越来越快的速度撸动她现在滑溜溜的脚底。忍住实在太难了！你需要释放——当你的身体开始达到高潮，感觉到胯部积聚的热量时，你紧紧地捏住，这个小荡妇的话应验了。[pg]");
            outputText("塔玛尼舔了舔嘴唇，双腿用力，配合着你用她的双脚给自己榨精，挤出了第一股滚烫的地精美食。精液溅在绿皮女孩的额头上，流进了她粉色的挑染头发里。她张大嘴巴，伸长脖子，用涂着脏兮兮口红的嘴接住下一股咸涩的精液。她像个老手一样吞咽着，身子探得更高，让你把白浊涂满她的乳房。");
            if(get_player().cumQ() >= 250)
            {
               outputText("你继续用她柔软的双脚撸动你的" + get_player().cockDescript(_loc2_) + "，看着你滴落的精液起泡翻滚，同时你继续把更多的精液喷在这个放肆的娘们身上。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("她咳嗽着，吹掉脸上结块的精液，好让自己能喘口气。当你继续把精液射满她全身时，这个荡妇把这些黏糊糊的东西聚拢起来，一边用嘴吞咽，一边大把大把地将滴着精液的黏液塞进她饥渴的小穴里。");
            }
            outputText("[pg]");
            outputText("塔玛尼眨了眨眼，挤出眼里的精液。你完事后，松开了她沾满精液的身体。她娇嗔道，[saystart]嗯……塔玛尼最喜欢你这样支配她了，" + get_player().mf("种马","性感宝贝") + "。你觉得你的");
            if(get_player().balls > 0)
            {
               outputText("性感的蛋蛋里还有");
            }
            else
            {
               outputText("甜美的肉棒里还有");
            }
            outputText("还有多余的精液能给我吗？[sayend][pg]");
            outputText("她没有给你回答的机会，摇摇晃晃地站起来，摆出一个性感的姿势，[say:你当然有。我晚点再来要剩下的！][pg]");
            outputText("塔玛尼离开时，用最性感的方式扭动着身体，再次唤醒了你的欲望……");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lust(35));
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
      }
      
      public function tamaniSexLost() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         tamaniKnockUp();
         clearOutput();
         outputText("当你");
         if(get_player().get_HP() < 1)
         {
            outputText("躺在那里，无力反抗时，塔玛尼给了你一个会意的微笑。");
         }
         else
         {
            outputText("抚摸着自己，屈服于小地精繁殖的欲望时，塔玛尼给了你一个会意的微笑。");
         }
         outputText("她走上前，赤脚踩在泥土上，在一个褪色的皮袋里翻找着什么。当她找到她要找的东西时，眼睛亮了起来。她手里拿着一个带肋的银色戒指，表面刻满了无数的符文。你呜咽着后退，知道她打算把它套在你的[cock]上，但塔玛尼只是“啧啧”两声，摇了摇头。[pg]");
         outputText("[say: 你真是个调皮的男孩，用那根多汁的肉棒挑逗我，然后又装作不想要这个。我不得不惩罚你的不乖，仅此而已，]她解释道，推开你的手，把戒指套在你的龟头冠状沟上。");
         if(get_player().cocks[0].cockThickness >= 5)
         {
            outputText("不可思议的是，尽管你的尺寸巨大，戒指不知怎么地膨胀开来，紧紧地套在你身上，虽然紧得令人痛苦。[pg]");
         }
         else
         {
            outputText("不知怎么的，这个环完美地套在了你的身上，就好像它是专门为你的[cock]量身定做的一样，尽管它仍然紧得让人发痛。[pg]");
         }
         outputText("[say: 别发愁，" + get_player().mf("种马","亲爱的") + "。等我觉得你吸取了教训，我还是会让你射出来的，]她说着，另一只手拿出一个空的大牛奶瓶。[say: 当然，我得给自己收集一些，]她说道，[say: 既然你欲擒故纵，那你就没机会感受我多汁的小穴了！]一提到这个，你的目光就锁定了她的双腿之间，死死盯着她肿胀充血的阴唇。你为什么不马上屈服，让她得到你的精液呢？[pg]");
         outputText("她将圆环强行套入你的整根肉棒，直到抵住你腹股沟的皮肉才停下。作为回应，这个明显带有魔力的圆环收得更紧了，并开始缓慢地震动，在提供快感的同时，却剥夺了你高潮的能力。塔玛尼一只手握住你紧绷而敏感的肉棒，又捏又拉，用这种不适感引导你四肢着地。当她把你摆弄到她想要的位置后，她减轻了力道，让你感受到了一丝快感。你低头看向双臂之间");
         if(get_player().biggestTitSize() >= 6)
         {
            outputText("却无法透过那堵肉墙看到你肿胀的肉棒。[pg]");
         }
         else
         {
            outputText("看着你肿胀的肉棒，紧绷的环迫使血液涌入其中，看起来几乎要被撑爆了。[pg]");
         }
         outputText("<b>*啪*</b> 塔玛尼的手狠狠地打在你的[ass]上，让你猛地一颤，强忍住一声痛呼。[say: 坏男孩要受惩罚！]她大喊着，再次挥下手，扇了你另一边屁股。你确信肯定已经形成了两个小小的红色手印。她击打的动能穿透你的臀部，传递到你敏感的[cock]上，并与魔力环共同作用，在你的肉棒上蔓延着同等程度的痛苦与快感。[pg]");
         outputText("打屁股一直持续到你的屁股变得樱桃红且敏感为止。塔玛尼轻轻拍了拍它，让你不悦地皱起眉头，她却得意地咯咯笑了起来，[say: 呵呵，你觉得我惩罚够了吗？我肯定你觉得够了，但我真正想知道的是——你吸取教训了吗？我得确保你会是个好男孩，下次我要求的时候，你会直接跳进我的蜜罐里。我讨厌浪费时间打架，我们本可以做爱繁衍后代的。][pg]");
         outputText("塔玛尼在你受虐的背部倒上油，让它浸透并开始麻痹疼痛。她在手上倒了另一种完全不同的油，开始为你按摩，让炼金混合物使你的皮肤产生刺痛感，增强快感，同时麻痹你肉棒被紧紧束缚的痛苦。你的手臂和[legs]因为以如此尴尬的角度支撑身体而颤抖，努力不让自己在突如其来的快感中放松下来。这种感觉将你推向边缘，你感觉到体内的肌肉在收缩，但紧绷震动的环阻挡了你的精液和高潮，让你憋得难受，绝望不已。[pg]");
         outputText("你的地精女主人");
         if(get_player().balls > 0)
         {
            outputText("紧紧地捧住你的[balls]");
         }
         else
         {
            outputText("在环周围抚摸你");
         }
         outputText("并问道，[say: 那么，你为让我等我的奶油而感到抱歉吗，" + get_player().mf("种马","荡妇") + "？如果你觉得抱歉，就说<b>对不起，塔玛尼女主人，请随时榨干我的肉棒</b>，然后求我让你射出来。][pg]");
         get_images().showImage("tamani-loss-fuck");
         outputText("你*需要*射精。她的手……它们不断地抚摸你，每次你的身体开始高潮时，它都会被抑制住，痛苦地困在你的体内。");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋变得非常肿胀和敏感。");
         }
         else
         {
            outputText("你的身体内部隐隐作痛，感觉肿胀得快要爆开了。");
         }
         if(get_player().cor < 50)
         {
            outputText("你别无选择，你会说她想让你说的话。[pg]");
         }
         else
         {
            outputText("像这样被拒绝虽然有点好玩，但你现在*真的*需要射出来，所以你会说她想让你说的话。[pg]");
         }
         outputText("[say: 塔玛尼女主人，我非常抱歉！请随时榨干我的肉棒！求求求求求求你让我射吧！求你了，我他妈的太饥渴了，我会做你想做的事，只要让我释放！]你乞求着，");
         if(get_player().cor > 50)
         {
            outputText("脸涨得通红，尽力让自己看起来像个顺从的玩具。[pg]");
         }
         else
         {
            outputText("羞愧难当，满脸通红，但字字发自肺腑。[pg]");
         }
         outputText("她接过空瓶子，把它压在你的" + get_player().cockHead() + "上，空出的那只手充满爱意地抚摸着你的肉棒，回答道：[say: 虽说不完全是我让你说的话，但听起来确实是发自内心的。现在让我们把那些憋着的精液都释放出来吧，嗯？]她空出的那只手摸了摸戒指，你感觉到压力稍微放松了一点——仍然紧得足以让你保持勃起，但也松得足以让你射精。她抚摸着、挤压着，你被堵住的高潮慢慢流入瓶中，看着它变得浓稠，并在快感淹没你时开始喷涌，她微笑着。你四肢着地，屁股通红，顺从地让你的地精女主人榨干你最后的精液。");
         if(get_player().cumQ() >= 250)
         {
            outputText("瓶子很快就溢出来了，但塔玛尼高兴地把它放在一边，把她自己的小穴滑到你身下，让你把剩下的精液注入她肥沃的子宫里。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("当你仍然设法将足够的精液注入她体内，使她的肚子胀大时，她高兴地咕咕叫着，但即使你有着惊人的生育能力，高潮也总有结束的时候。");
         }
         outputText("[pg]");
         outputText("你射完后，塔玛尼取下了戒指。她封好瓶子，把它放进她的袋子里，而你则筋疲力尽地倒在地上。你所能做的就是看着她走开，她的屁股自信地左右摇摆着。你昏过去前的最后一个念头是，如果只是操她的话，事情会简单得多。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-1),DynStat.Cor(0.5));
         get_combat().cleanupAfterCombat();
      }
      
      public function tamaniSexLetHer() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_tamani());
         tamaniKnockUp();
         clearOutput();
         get_images().showImage("tamani-letHer-fuck");
         if(get_game().get_inCombat())
         {
            if(get_player().isTaur())
            {
               if(get_player().get_HP() < 1)
               {
                  outputText("你踉跄了一下，双腿像喝醉了似的发软，试图站稳脚跟。");
               }
               else
               {
                  outputText("你踉跄了一下，双腿像喝醉了似的发软，[eachcock]因为渴望而隐隐作痛，滴下淫液。");
               }
               outputText("塔玛尼凑到你身边，拍了拍你的侧腹，柔声说道：[say: 乖狗狗，一切都会好起来的。塔玛尼妈妈会好好照顾你的。] 还没等你反应过来，你的[armor]就已经掉在地上，而那个地精则钻到了你的身下，爬向你的胯部。[pg]");
            }
            else
            {
               if(get_player().get_HP() < 1)
               {
                  outputText("你瘫倒在地，再也无力反抗。塔玛尼对这个结果似乎有些失望，但尽管你看起来很可怜，她还是走向了你俯卧的身体。");
               }
               else
               {
                  outputText("你在欲望的狂热中撕下衣服，踉踉跄跄地走向塔玛尼，毫不掩饰地抚摸着自己的腹股沟。她得意地笑了笑，用力推了你一把，让你失去平衡，仰面摔倒。");
               }
               outputText("她扭动着她的" + tamaniChest() + "，尽管你努力控制自己的身体，");
               if(get_player().cockTotal() == 1)
               {
                  outputText("勃起的阴茎还是冒了出来");
               }
               else
               {
                  outputText("勃起的阴茎像杂草一样冒了出来");
               }
               outputText("。她扒光了你的衣服，得意地笑着对你说：[say: 乖乖躺着，宝贝，我会拿走我需要的东西。][pg]");
            }
         }
         else if(get_player().isTaur())
         {
            outputText("你顺从地脱下衣服，问塔玛尼今天想怎么要你。她咯咯地笑着，慢慢地绕着你走，不慌不忙地打量着你那可怕的野兽身躯和你的[cocks]。[say: 这一切，都是为了我这个小可怜，]她轻声说道。听起来她更多的是被诱惑，而不是被吓倒。[say: 给我站好，小马驹，]她命令道。由于你的侧腹挡住了视线，你再也看不到她，只能照她说的做。你感觉到一双小手放在你的后大腿上，然后一个虽小但很沉的重量稳稳地向你的腹股沟爬去。你强忍住笑意，因为那种感觉实在太痒了。[pg]");
         }
         else
         {
            outputText("你顺从地脱下衣服，问塔玛尼今天想怎么要你。她咯咯地笑着，在你的");
            _loc1_ = Utils.rand(3);
            switch(_loc1_)
            {
               case 0:
                  outputText(get_player().cockDescript(0));
                  break;
               case 1:
                  outputText("肚脐");
                  break;
               case 2:
                  outputText(get_player().nippleDescript(0));
            }
            outputText("上飞快地亲了一下，然后用力推你，把你推倒在地，并露出灿烂的笑容。[pg]");
            outputText("[say: 乖乖躺着享受吧，" + get_player().mf("种马","荡妇") + "，]她命令道。[pg]");
         }
         if(get_player().isTaur())
         {
            outputText("由于你相对庞大的身躯完全遮挡了视线，你根本看不到塔玛尼在做什么，只能感觉到。也许是意识到了这一点，塔玛尼似乎下定决心要让你感觉到很多。一只手抓住了你的侧腹，你感觉到她靠向你的腹股沟，开始用唾液涂抹她能接触到的你的" + get_player().cockDescript(0) + "的每一个部位。地精的口红发挥了它传统的作用，没过多久，你的[cock]就紧绷起来，变成了一个坚硬颤抖的快感中心。你听到身下某处传来戏谑的咯咯笑声，然后你倒吸一口凉气，因为塔玛尼爬上了你的腹股沟，双手抓住你柔软的下腹部，她的大部分重量都由你肿胀的阴茎支撑着。[pg]");
            outputText("你如此兴奋，发现自己可以轻松地支撑住她，但这种感觉让你不禁畏缩，尤其是当塔玛尼开始认真工作时。她挂在你的肚子上，用心地涂抹着你的龟头，她那令人发麻的嘴唇和湿润的舌头舔遍了你的顶端，直到你几乎无法忍受，将先列腺液滴入她饥渴的嘴里。[pg]");
            if(get_player().cocks[0].cockLength <= 18)
            {
               outputText("还没等你走得太远，她就停了下来，痛苦地转移了注意力；你感觉到她把重量转移到手上，然后她那粗糙但柔软的脚底顺着你的" + get_player().cockDescript(0) + "滑向另一端，压在你的大腿内侧。她那湿润如天鹅绒般的小穴包裹住你的龟头，然后慢慢地顺着你的肉棒滑下。还没等她到底，塔玛尼就停了下来，戏谑地慢慢抽出，直到你的龟头再次压在她湿透的入口处。她开始扭动大腿，将自己贴在你紧绷的阴茎末端，越来越急促，直到她尖叫着高潮，将她的汁液涂抹在你的顶端。然后，伴随着一声叹息和窃笑，她再次以令人痛苦的缓慢速度，将自己套弄在你的[cock]上。");
               if(get_player().balls == 0)
               {
                  outputText("你发现自己隐约在想，一个地精是在哪里学到这种体操的。[pg]");
               }
               else
               {
                  outputText("你隐约地想知道，一个地精是从哪里学来这种体操的，然后这个地精就把她柔软的脚底踩在你的[balls]上，把所有的想法都赶出了你的脑海。[pg]");
               }
               outputText("塔玛尼就这样对你为所欲为，似乎过了好几个小时，她一次又一次地尖叫着高潮，直到你的下腹部被她的汁液浸透，但每次你快要释放时，她都会抽身离开，像拉奏世界上最敏感的小提琴一样玩弄你，直到你人类的那一半身体被汗水浸透。你极度焦躁地跺着后蹄，森林里回荡着你震耳欲聋的吼声。你无能为力；她牢牢地附着在你的下半身，即使你想，你也够不到她，或者把她打下来。显然，她很享受每一分钟，每次成功地让你尖叫，她都会残忍地大笑，这促使她发明一些新的方法来折磨你可怜的阴茎。这种情况让你发狂；你对一个比你小很多倍的生物对你做的事情无能为力，而且你心甘情愿地让它发生，这是一种令人羞耻的强烈感觉。[pg]");
               outputText("[say:那就来吧，]她终于喘着气说道。[say:我想你已经受够了。为女主人塔玛尼射出来吧，" + get_player().mf("种马","荡妇") + "。把我填得满满的。]说完，她终于把自己一直挪到了你肉棒的底部，用惊人的力量抓住你的肚子，开始用她丰满的臀部越来越用力地撞击你的大腿内侧。[pg]");
               outputText("你不需要进一步的邀请，伴随着一声沙哑而幸福的叹息，你猛烈地高潮了，眼前甚至冒出了金星。塔玛尼用她的四肢紧紧抱住你，熟练地榨取你，你一发接一发地射进她那火热、饥渴的小穴里。她一直没有停止摩擦你，直到你能感觉到精液从她体内滴落，并听到它轻轻溅在地上的声音。[pg]");
               outputText("当你结束后，随着塔玛尼终于松开你的下半身并落到地上，你感到了一阵强烈的解脱。她开心地摇摇晃晃地转过身来面对你，她的小穴里滴着你的精液。[say:谁知道骑马会这么有趣！我们下次还得再来一次，种马。下次我可能会让它变成疾驰而不是慢跑。那不是很好吗？下次见，大[boy]。]她大摇大摆地走了，留下你怀疑自己是否还能恢复到足够好的状态，让她再次靠近你的肉棒，以及最近的一加仑水在哪里。[pg]");
            }
            else
            {
               outputText("在你走得太远之前，她停了下来，并令人痛苦地转移了注意力；你感觉到她粗糙但柔软的脚底顺着你的[cock]滑到了另一端。她挂在你阴茎的根部，开始用她丰满、娇小的身体沿着底部摩擦，她的乳房和大腿抚摸着你的长度。");
               if(get_player().balls == 0)
               {
                  outputText("你发现自己隐约在想，一个地精是在哪里学到这种体操的。[pg]");
               }
               else
               {
                  outputText("你发现自己隐约在想，一个地精是在哪里学到这种体操的，然后这个地精开始把她柔软的脚底揉进你的[balls]，把所有的想法都赶出了你的脑海。[pg]");
               }
               outputText("塔玛尼就这样对你为所欲为，似乎过了好几个小时，在你巨大的肉棒上爬上爬下");
               if(get_player().balls > 0)
               {
                  outputText("和[balls]");
               }
               outputText("，以可怕的精准度吸吮、舔舐、抚摸和用脚摩擦你，拍打着你，并在她一次又一次地高潮时尖叫，直到你的下半身被她的淫液浸透，但每次你接近自己的释放时，她都会抽身离开，像演奏世界上最敏感的小提琴一样玩弄你，直到你的人类半身被汗水浸透。你极度焦躁地跺着后蹄，让森林里充满了咆哮的喊叫声。你无能为力；她牢牢地附着在你的下半身，即使你想，你也够不到她，或者用其他方式把她打下来。她显然很享受每一分钟，每次成功地让你尖叫时，她都会残忍地大笑，这促使她发明一些新的方法来折磨你可怜的肉棒。这种情况有些让你发狂；对于一个比你小很多倍的生物对你做的事情，你无能为力，而且你心甘情愿地让它发生，这是一种令人羞耻的强烈感觉。[pg]");
               outputText("[say:那就来吧，]她终于喘着气说道。[say:我想你已经受够了。为女主人塔玛尼射出来吧，" + get_player().mf("种马","荡妇") + "。把我从头到脚都盖住。]当她这么说时，她的手顺着你的肚子往下走，把自己定位在你的正上方，用她自己的润滑液疯狂地用脚摩擦你的[cock]，然后，伴随着最后一声邪恶的咯咯笑，把她的舌头直接伸进了你的尿道。[pg]");
               if(get_player().cumQ() < 1200)
               {
                  outputText("伴随着一声沙哑的叹息，你达到了顶峰。你的第一股精液直接射进了塔玛尼的嘴里，但你感觉到地精敏捷而匆忙地改变了她的位置，这样你[cock]的最顶端就能感觉到她湿润的小穴。被挑逗了这么久，这种感觉令人难以置信，感觉好像过了好几分钟，你站在那里，汗水从你身上滴落，你一次又一次地射精，直到你的肉棒除了无意识地抽动之外什么也做不了。[pg]");
                  outputText("当你结束后，随着塔玛尼终于松开你的下半身并落到地上，你感到了一阵强烈的解脱感。她开心地用爪子擦掉覆盖在她脸上的精液，并在她摇摇晃晃地转过身来面对你时，试图把更多的精液塞进她滴水的小穴里。[say:谁知道骑马会这么有趣！我们下次还得再来一次，种马。下次我可能会让它变成疾驰而不是慢跑。那不是很好吗？下次见，大[boy]。]她大摇大摆地走了，留下你怀疑自己是否还能恢复到足够好的状态，让她再次靠近你的肉棒，以及最近的一加仑水在哪里。[pg]");
               }
               else
               {
                  outputText("伴随着一声咆哮，你以令人震惊的力量射精了。你翻滚的睾丸喷射出一条粘稠液体的河流，第一道光荣的弧线直接飞过你的人类前胸，涂满了你面前的树。完全失去知觉，你整整几分钟什么也做不了，只能站在那里射精，一次又一次，汗水从你的身体上滴落，直到你下方的整个区域都被你的精液覆盖。[pg]");
                  outputText("当你终于恢复理智时，你疲惫但带着强烈的满足感，哒哒地走来走去，欣赏你创造的精液湖。");
                  if(get_player().balls > 0)
                  {
                     outputText("你的[balls]很痛，你确实感到非常渴。");
                  }
                  else
                  {
                     outputText("你确实感到非常渴。");
                  }
                  outputText("直到你设法把你的心思从你自己的匮乏中拉回来，你才突然想知道塔玛尼去哪了。她不是还附着在你身上吧？就在那时，你面前巨大水坑中心的一个小肿块站了起来，开始开心地擦拭自己，小心翼翼地把尽可能多的涂在她身上的精液塞进自己体内。[pg]");
                  outputText("[say:哇哦哦哦哦，]她咧嘴笑着说，笑容几乎把她的脸劈成两半。[say:谁知道骑马会这么有趣！我们下次还得再来一次，种马。下次我可能会让它变成疾驰而不是慢跑。那不是很好吗？下次见，大[boy]。]她大摇大摆地走了，留下你怀疑自己是否还能恢复到足够好的状态，让她再次靠近你的肉棒，以及最近的一加仑水在哪里。[pg]");
               }
            }
            outputText("过了一会儿，你重新穿好衣服，但发情的地精的气味在你身上停留了几个小时。");
            if(get_game().get_inCombat())
            {
               outputText("在经历了一场失败的战斗的压力和紧张，以及你的精液被如此熟练地偷走的压力之后，你侧躺下来，睡着了。");
               get_combat().cleanupAfterCombat();
               get_player().orgasm("Dick");
            }
            else
            {
               get_player().orgasm("Dick");
               dynStats(DynStat.Lust(10));
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("她四肢着地，顺着你的双腿爬上来，直到她涂满唇彩的嘴唇够到你的[cocks]。当这个地精荡妇用她的唾液把你弄得又滑又湿时，温暖的湿润感顺着你的阴茎滑过。这对你产生了很大的影响，让你的[cock]变成了一个坚硬颤抖的快感中心。你叹了口气，享受着她的关注，但更准备好将你压抑的性需求释放到这个心甘情愿的女孩身上。[pg]");
            if(get_player().cockArea(0) <= 90)
            {
               outputText("塔玛尼转过身，将她湿润的裂口拖过你的身体，让你清楚地看到她丰满的臀部。当她把你举起来时，她手掌柔软的皮肤挤压着你，将你的" + get_player().cockDescript(0) + "对准她的女性私处。她在你的" + get_player().cockHead() + "上摩擦，她的褶皱慢慢分开以接纳你。一寸又一寸的肉棒沉入她那惊人有弹性却又紧致的小穴中。");
               if(get_player().cocks[0].cockLength >= 12)
               {
                  outputText("她的身体明显地被你撑开，你在心里默默感谢那些让地精能够胜任这个角色的神明或恶魔。");
               }
               outputText("她像个妓女一样呻吟着，轻松地滑到底，将她湿透的肉洞插到了最深处。[pg]");
               outputText("当塔玛尼捏住并拉扯你的");
               if(get_player().totalNipples() == 2)
               {
                  outputText("两个");
               }
               else
               {
                  outputText("所有");
               }
               outputText("[nipples]时，你痛得倒吸一口凉气。当她看到你有多痛时，她稍微放松了抓握，但并没有放开。她的小穴操你的嘈杂水声将你的注意力拉回了你的腹股沟。你的身体开始向上挺动以迎合她，终于明白自己正处于一场充满激情的性爱的接受端。");
               if(get_player().biggestTitSize() >= 2)
               {
                  outputText("当这个地精扭动和拉扯，虐待你的乳头时，你的" + get_player().allBreastsDescript() + "淫秽地弹跳和晃动。");
               }
               else
               {
                  outputText("当这个地精扭动和拉扯你的[nipples]，虐待它们时，它们痛得像火烧一样。快感和痛苦混合在一起，淹没了你，让你的世界缩小到只剩下生殖器拍打生殖器的声音，以及发生在你胸部的痛苦折磨。[pg]");
               }
               outputText("塔玛尼像拉小提琴一样玩弄着你的身体，让你保持在边缘，同时她一次又一次地在你的肉棒上大声高潮。你能看出她开始累了，所以她给了你一个温柔的眼神，开始加快节奏。她轻声低语，[say: 来吧，把我的蜜罐灌满，直到我几乎走不动路。][pg]");
               outputText("这就是你所需要的所有鼓励。");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]有力地抽搐着，排空里面的东西，向地精体内射出一股滚烫的精液。");
               }
               else
               {
                  outputText("你体内的肌肉抽搐着，向地精体内射出一股滚烫的精液。");
               }
               outputText("塔玛尼开心地扭动着，最后捏了一下你的乳头，然后放开它们去玩弄她自己的。一波又一波粘稠的精液涂满了她的阴道内壁，而这个快乐的荡妇整个过程中只乞求更多。");
               if(get_player().cumQ() >= 250)
               {
                  outputText("过了一会儿，你能感觉到她体内的压力在增加，开始让她有点小肚子。塔玛尼揉着它乞求道，[say: 还要！]");
               }
               if(get_player().cumQ() >= 500)
               {
                  outputText("你的身体满足了她的要求，甚至更多，把她塞得满满的，直到她看起来完全像怀孕了一样，你的精液随着每一波粘稠的喷射从她的入口喷涌而出。");
               }
               else
               {
                  outputText("可悲的是，在你的高潮结束之前，你只勉强多射了几股。");
               }
               outputText("[pg]一阵冷风吹过你突然释放的阴茎，让你打了个寒颤。你看着塔玛尼，看着你的精液顺着她的大腿流下，同时她整理着头发，快速补了个妆。她弄完后给你飞吻，向你告别，[saystart]如果这次没怀上，我会回来要更多的");
               if(get_player().cumQ() < 250)
               {
                  outputText("。我真的很享受我们的性爱，" + get_player().mf("种马","亲爱的") + "，我迫不及待地想再次“撞见”你。");
               }
               else
               {
                  outputText("。你一定要确保让你的");
                  if(get_player().balls > 0)
                  {
                     outputText("[balls]重新充满精液，好吗？");
                  }
                  else
                  {
                     outputText("[cock]重新充满精液，好吗？");
                  }
               }
               outputText("[sayend][pg]");
               if(get_game().get_inCombat())
               {
                  outputText("你晕了过去，在折磨中筋疲力尽。");
                  get_combat().cleanupAfterCombat();
                  get_player().orgasm("Dick");
               }
               else
               {
                  outputText("你躺在那里，从激烈的性爱中恢复过来。过了一会儿，你勉强站起来重新穿好衣服，但发情的地精气味在你身上停留了几个小时。");
                  get_player().orgasm("Dick");
                  dynStats(DynStat.Lust(10));
                  doNext(get_camp().returnToCampUseOneHour);
               }
            }
            else
            {
               outputText("塔玛尼转过身，将她湿润的肉缝在你身上摩擦，让你能清楚地看到她丰满的臀瓣。她回头看着你，吸吮着她的一根涂了指甲油的手指，看起来既调皮又性感。你在她身下摇晃着臀部，直到她给了你的");
               if(get_player().balls > 0)
               {
                  outputText(get_player().ballsDescriptLight());
               }
               else
               {
                  outputText(get_player().cockDescript(0));
               }
               outputText("狠狠一巴掌。你呜咽了一声，停下了不安分的臀部，任由她像弹奏世界上最敏感的小提琴一样玩弄你。塔玛尼拉起你的" + get_player().cockHead() + "，在上面摇晃着身体，当你把先列腺液滴进她湿透的肉缝时，她毫不掩饰地呻吟着。[pg]");
               outputText("[say: 噢，你对我这个小可怜来说太大了，]地精呻吟着，稍微退后了一点，[say: 但我有个东西可能会让你射得一样爽。我一定会用我的小穴接住你所有的精液！]她拿出一根亮粉色的假阳具舔了舔。你惊恐地看着一滴浓稠的液体从顶端漏出。毫无疑问，塔玛尼打算让你以某种方式把整个东西都吃下去。[pg]");
               outputText("你撅起嘴，在她");
               if(get_player().balls > 0)
               {
                  outputText("抬起你的[balls]");
               }
               else
               {
                  outputText("身体前倾，看向你的双腿之间");
               }
               outputText("时，微弱地抗议着，并将假阳具漏液的顶端抵在你的[assholeorpussy]上。你感觉到它撑开了你，与你身体的体液发生反应，像变态的气球一样在你体内膨胀，而塔玛尼则把它越推越深。");
               if(get_player().hasVagina())
               {
                  outputText("");
                  get_player().cuntChange(get_player().vaginalCapacity() * 0.95,true);
                  outputText("你的内壁紧紧地挤压着它，在无意识的挤奶动作中，你的身体对它的反应就像它是一根真正的鸡巴一样。");
               }
               else
               {
                  get_player().buttChange(get_player().analCapacity() * 0.95,true);
                  outputText("你的身体紧紧夹住它，抵抗着这种奇怪的入侵，因为它膨胀起来填满了你，紧紧地压在你的前列腺上。");
               }
               outputText("一股灼热的温度辐射遍布你的全身，让你的[nipple]刺痛，变得越来越敏感。[pg]");
               outputText("塔玛尼前后摇晃，在你的" + get_player().cockDescript(0) + "上滑动，淫荡地抽插着，你的青筋摩擦着她坚硬的阴蒂小结节。她喘着粗气，确保回头给你抛媚眼，舔着她光泽的嘴唇，残忍地挑逗你。你能感觉到她在摩擦时一次又一次地高潮，在你的肉棒上滑动得越来越快。就你而言，你的[cock]开始在你的肚子上留下一滩先列腺液，因为假阳具那像毒品一样的精液影响了你，让你感到饥渴和燥热。[pg]");
               outputText("骑在你[cock]上的变态地精女王进一步向前倾，将你[assholeorpussy]里的假阳具向上倾斜，挤压你的");
               if(get_player().hasVagina())
               {
                  outputText("阴茎根部");
               }
               else
               {
                  outputText("前列腺");
               }
               outputText("带来美妙的刺激。你在她身下颤抖，喘息着呻吟，完全屈服于这个小女孩，她正在给你的身体进行一生难忘的性爱锻炼。她向后滑动，小穴在你的龟头上挤压摩擦，让你发狂。她柔声说道，[say: 射出来吧，种马，]同时挤压着你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋");
               }
               else
               {
                  outputText("胯部");
               }
               outputText("，[say: 把那些滚烫粘稠的精液都射给女主人塔玛尼吧。][pg]");
               outputText("你的身体立刻愉快地顺从了，喷射出一股浓稠的白色精液，溅在地精摇晃的屁股上。她滑下来，将她的小穴对准你肿胀的龟头，在摩擦你的同时，直接用双唇接住了下一股喷射。塔玛尼轻轻拍打着你[assholeorpussy]里的假阳具，在把你撑得更宽的同时，挤出了一股极其浓稠的精液。");
               if(get_player().cumQ() >= 250)
               {
                  outputText("你射得越来越猛烈，把她往后推了一点，在她肚子上溅满了白色的奶油。她呻吟着，把它揉进她的皮肤和小穴里");
                  if(get_player().cumQ() >= 500)
                  {
                     outputText("当你继续射精，溅满她的乳房和脸庞，浸透了这个小地精荡妇");
                  }
                  outputText("。");
               }
               outputText("假阳具从你被蹂躏的[assholeorpussy]里滑落，在你们做爱的狂热中被遗忘，漏出粉红色的粘液。[pg]");
               outputText("塔玛尼从你身上起来，滴落着混合的性液，伸展着身体，仿佛刚完成了一场漫长的锻炼。这个荡妇地精对你眨眨眼，挥手道，[say: 谢谢你的精液。记得花点时间补充一下。下次我还想被浸透！][pg]");
               if(get_game().get_inCombat())
               {
                  outputText("你晕了过去，在折磨中筋疲力尽。");
                  get_combat().cleanupAfterCombat();
                  get_player().orgasm("Dick");
                  get_player().orgasm("VaginalAnal");
               }
               else
               {
                  outputText("你躺在那里，从激烈的性爱中恢复过来。过了一会儿，你勉强站起来重新穿好衣服，但发情的地精气味在你身上停留了几个小时。");
                  get_player().orgasm("Dick");
                  get_player().orgasm("VaginalAnal");
                  dynStats(DynStat.Lust(10));
                  doNext(get_camp().returnToCampUseOneHour);
               }
            }
         }
      }
      
      public function tamaniSecondRefusal() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         outputText("地精撅起嘴，愤怒笼罩了她可爱的小脸。她转过身，气冲冲地走开了，显然对你很生气，[say: 考虑一下吧。下次那根鸡巴最好为我而痛，否则我会让你想要的。][pg]");
         outputText("……什么？");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniPregnantRefusal() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         outputText("她突然泪流满面，哭着蹒跚离去。你不确定自己是否应该感到内疚。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniPregnantFuck() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         outputText("塔玛尼的眼睛亮了起来，她扑向你，尽管怀着沉重的身孕，她还是设法跳起来并抱住了你的胸膛。你们俩失去了平衡，她的重量把你压倒在地，让你平躺在地上。你的[ass]因为撞击有点疼，但这已经是你最不关心的事情了。更重要的是那对滴着奶水的双峰紧紧地压在你的");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText(get_player().allBreastsDescript());
         }
         else
         {
            outputText("胸膛上");
         }
         outputText("。[pg]");
         outputText("你抓住她的腋下把她举起来，检查她那充满乳汁的乳头。它们闪烁着湿润的光泽，简直是在乞求被吸吮。你蹭了蹭它们，轻轻地把其中一个含进嘴里，喝下这营养丰富的饮料。塔玛尼把她的臀部在你的一个[nipples]上摩擦，同时在你耳边轻声呻吟，光是被吸吮就几乎要在你身上高潮了。当她的乳汁流速减慢时，你停下来休息一下，把另一个含进嘴里，挤压着她的" + tamaniChest() + "，享受着怀孕给她带来的更加饱满的感觉。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1202) > 6)
         {
            outputText("它们大得你几乎无法掌握；这大概会让这可怜的女孩连走路都很困难。");
         }
         outputText("[pg]");
         outputText("厌倦了这种挑逗，塔玛尼把她的乳头从你嘴里猛地抽出来，然后猛烈地吻了你。她的嘴唇滚烫，几乎像发烧一样，尝起来有甜樱桃的味道。火热的温暖流遍你的全身，随着她的舌头缠绕着你的舌头，汇聚在你的腹股沟。她吸吮着你的下唇，然后退后，给了你一个心领神会的微笑。你的[cock]变得越来越硬，紧绷得几乎发痛。当塔玛尼用脚缠住它，用赤裸的脚底抚摸着它，同时将自己拉下时，你发出了轻柔的呜咽。[pg]");
         outputText("她因怀孕而肿胀的肚子和不断变大的乳房在你的肉棒上摩擦，同时她亲吻并挤压着它。你兴奋得发痛，你清楚地知道这绝对是因为她这次在口红里加了什么东西。你求她快点，赶紧操你！[pg]");
         get_images().showImage("tamani-preggo-fuck");
         if(get_player().cockArea(0) <= 50)
         {
            outputText("塔玛尼站起身来，双手抓住你的[cock]，引导它滑向她那滴着水的阴户。她蹲下来，一个快速的挺进就吞下了整根。她咯咯笑着，开始在你身上无情地弹跳，挑逗着她的乳头，全程对你说着下流话，[say:来吧种马，操你怀孕的地精老婆。我想在接下来的一整天里都挺着大肚子，滴着你的精液到处走。如果你真的把我填满，我可以把它带回去和我家里其他人分享，你觉得怎么样？我几十个火辣的小妹妹和女儿都怀上你的孩子？][pg]");
            outputText("你以近乎痛苦的强度高潮了。塔玛尼实际上被你射精的力量顶了起来。当她滑落下来时，精液从她被蹂躏的肉洞里喷射而出，她双手抚摸着肚子，像个小女孩一样咯咯笑着。你射出的精液量似乎远远超出了你平时的能力，你试图瞪她一眼，责怪她，但她只是舔了舔嘴唇，在性高潮的呻吟中眨了眨眼。精液从她体内喷出，顺着她的大腿流下，在你的[ass]下汇成一滩。最后你结束了，让她看起来比以前怀孕更明显了。你的");
            if(get_player().balls > 0)
            {
               outputText(get_player().ballsDescriptLight());
            }
            else
            {
               outputText("生殖器");
            }
            outputText("因为这爆炸性的射精而隐隐作痛，让你感到酸痛和疲惫。[pg]");
            outputText("至于塔玛尼，她摇摇晃晃地站了起来，让你无力地瘫倒在地。你射出的精液像河水一样从她双腿间流下，浸透了你的下半身。她醉生梦死般地摇晃到你面前，俯下身又给了你一个湿漉漉的吻。[pg]");
            outputText("[say: 谢谢你这顿美妙的操弄，" + get_player().mf("种马","爱人") + "，]她说道，残酷地微笑着，因为你发现自己又因为她那掺了药的吻而硬了起来。不过塔玛尼并没有留下来帮忙；她摇摇晃晃地走开了，双手托着肚子，脸上挂着微笑。[pg]");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lust(25));
         }
         else
         {
            outputText("[say: 抱歉，" + get_player().mf("种马","爱人") + "，你对我来说实在太大太<b>硬</b>了。别担心，我会帮你把所有东西都直接卸在我的甜美小穴里，]她道着歉，");
            if(get_player().balls > 0)
            {
               outputText("用脚按摩着你的蛋蛋");
            }
            else
            {
               outputText("用脚套弄着你[cock]的根部");
            }
            outputText("同时她的手还在抚摸和挑逗你。塔玛尼将自己往下拉，把" + get_player().cockHead() + "压进她流着淫水的穴里。她用力地在你的龟头上摩擦，几乎让你爽得发疯。她抓住她的" + tamaniChest() + "挤压着，在你身上溅了一层厚厚的乳汁，然后又继续用她的手脚套弄你。[pg]");
            outputText("你以近乎痛苦的强度射了。塔玛尼实际上被你的第一发喷射推得后退了一点，当精液试图从她突然充满液体的阴道中溢出时，她从胸部往下都被溅到了。她向前扑去，将她因怀孕而肿胀的身体在你的肉棒上摩擦，用她的手臂和腿像紧绷的阴茎环一样箍着你。她的阴户和坚硬的小阴蒂散发着芳香的湿润，她和你一起高潮，感受着你的每一波精液从她身下流过。由于没有容器，你最终被浸泡在一滩精液中。虽然它最终结束了，但你酸痛的身体清楚地表明，她口红里的某种药物可能帮助你排出了如此惊人的量。[pg]");
            outputText("塔玛尼在你身上又磨蹭了一会儿，然后摇摇晃晃地站起身伸了个懒腰。她停下动作，拿出一个细长的瓶子，突然把瓶口塞进你的尿道。她动作熟练地从根部到顶端挤压你的[cock]，把最后一点精液挤进容器里。她拔出瓶子，塞上木塞，放进口袋。她拍了拍口袋解释道，[say: 家里还有几个女孩没怀孕，我想你可能会乐意为当地的荡妇人口做点贡献。不过别担心，宝贝，你的肉棒永远是我的。][pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1204,FlagDict_Impl_.arrayReadInt(_loc1_,1204) + 3);
            outputText("塔玛尼走到你面前，给了你一个湿漉漉的告别之吻，让你的胯下立刻变得坚挺，涌起一阵强烈的欲望。她回过头咯咯地笑着，然后摇摇晃晃地走开了，拍了拍她的袋子，身上还滴着你的精液。");
            get_player().orgasm("Dick");
         }
         get_player().refillHunger(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniPregnantEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         get_images().showImage("tamani-preggo-encounter");
         outputText("塔玛尼从一块巨石后漫步而出，哇哦，她怀孕的样子可真明显。当她与你目光交汇时，这并没有减弱她眼中的情欲，但她的双手确实一直在抚摸着她那隆起的肚子，只有在挤出乳头上的几滴乳汁时才会停下。她的皮带似乎比以前更合身了，突显了她不断膨胀的曲线，在她怀孕的身躯上看起来棒极了。[pg]");
         outputText("她分开双腿，揉搓着下体的阴唇，同时向你乞求道：[say:求你操我！怀孕让我好饥渴，我都等不及要给你生女儿了，这样你就能再次让我怀孕了！]");
         menu();
         addButton(0,"操她",tamaniPregnantFuck);
         addButton(1,"拒绝",tamaniPregnantRefusal);
      }
      
      public function tamaniPoopsOutBabies() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         get_images().showImage("tamani-encounter-preggo");
         outputText("你在探索时听到远处传来淫靡的尖叫声。你转身前去调查，随着你的靠近，声音变得更加响亮，音调也越来越高。你爬上一个土坡，发现塔玛尼");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) > 0)
         {
            outputText("和她的女儿们在一起，");
         }
         outputText("她靠在一棵灌木树上，双腿大张，身下有一小滩水迹。她的" + tamaniChest() + "随着深呼吸而起伏，她用力挤压，将阴户撑得大大的。她翻着白眼，一个绿色的身影滑落出来，露出一只小地精，她立刻用摇晃的双腿站了起来。小女孩转过身，咬住母亲肿胀的乳头，与此同时，另一个孩子也滑落出来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1201) > 2)
         {
            outputText("片刻之后，第三个出现了");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1201) > 3)
            {
               outputText("，第四个");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1201) == 5)
               {
                  outputText("，第五个");
               }
               else
               {
                  outputText("，多到你数不清");
               }
            }
            outputText("。");
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1201) == 2)
         {
            outputText("双胞胎大口大口地喝着，在你眼前越长越高，而塔玛尼也从怀孕引起的高潮中恢复过来。");
         }
         else
         {
            outputText("地精孩子们大口大口地喝着，争抢着吸吮乳头的机会，而她们的母亲则从分娩引起的高潮中恢复过来。");
         }
         outputText("她抬头看着你，气喘吁吁地低语道：[say:晚点来操我吧，我会给你生更多漂亮的小女孩。这" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1201)) + "个孩子一两周后就会完全长大，出去猎艳了，但我保证，她们谁也比不上我能让你爽。][pg]");
         outputText("塔玛尼叹了口气，放松下来，享受着哺乳的过程，并挥手让你离开。你耸了耸肩，回到了营地，心里感到十分兴奋。");
         dynStats(DynStat.Lust(get_player().lib / 10 + get_player().cor / 10));
         tamaniGivesBirth();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniMaleRepeatEncounter() : void
      {
         var postFight:Boolean;
         var _g:TamaniScene;
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         get_images().showImage("tamani-encounter");
         if(pregnancy.get_isPregnant() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) > 0)
         {
            outputText("在探索时，你被大腿内侧被小手抚摸的感觉吓了一跳。你低头一看，发现塔玛尼在那里，像狼一样咧嘴笑着，[say: 准备好再来一发了吗，大[boy]？][pg]");
         }
         else
         {
            outputText("在探索时，你被大腿内侧被小手抚摸的感觉吓了一跳。你低头一看，发现地精塔玛尼在那里，带着欲望咧嘴笑着，[say: 准备好用精液填满我了吗？这次我可不接受拒绝。][pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 19 && Utils.rand(2) == 0)
         {
            getRapedByTamaniYouHypnoSlut();
            return;
         }
         dynStats(DynStat.Lust(get_player().sens / 10));
         menu();
         _g = this;
         postFight = false;
         addButton(0,"上她",function():void
         {
            _g.tamaniSexWon(postFight);
         });
         addButton(1,"随她",tamaniSexLetHer);
         addButton(2,"拒绝",tamaniStartFight);
      }
      
      public function tamaniMaleFirstEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1203,1);
         clearOutput();
         get_images().showImage("tamani-encounter");
         outputText("一个地精从岩石露头后面跳了出来。对于这么小的生物来说，她的曲线相当丰满。她向你走来，用一种充满暗示的方式扭动着臀部，立刻让你的血液涌向胯部。这个小东西只有大约四英尺高，粉色和黑色相间的头发剪成了一个可爱的小发型。她乳房上灰绿色的皮肤随着每一步愉快地晃动着，由几根皮带支撑着，放大了她的乳沟。她的阴唇上打了好几个洞，红肿着，微微张开。她身上真的没有任何衣服可以遮挡它们，只有更多无处不在的皮带缠绕在她的腿上。[pg]");
         outputText("地精向你提出了一个难以拒绝的提议，[say: 嘿，种马，想把我操怀孕吗？我保证我的小穴会把你的鸡巴榨干。就让塔玛尼来照顾你所有的勃起吧，好吗？]");
         menu();
         addButton(0,"操她",tamaniFirstTimeConsentual);
         addButton(1,"拒绝",tamaniFirstTimeRefusal);
      }
      
      public function tamaniKnockUp() : void
      {
         var _loc2_:* = null as IMap;
         if(pregnancy.get_isPregnant())
         {
            return;
         }
         pregnancy.knockUpForce(25,216);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1201,2);
         var _loc1_:Number = get_player().cumQ();
         if(get_player().hasPerk(PerkLib.MaraesGiftStud))
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 3);
         }
         if(_loc1_ >= 50 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
         if(_loc1_ >= 100 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
         if(_loc1_ >= 200 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
         if(_loc1_ >= 300 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
         if(_loc1_ >= 400 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
         if(_loc1_ >= 500 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
         if(_loc1_ >= 600 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1201,FlagDict_Impl_.arrayReadInt(_loc2_,1201) + 1);
         }
      }
      
      public function tamaniGivesBirth() : void
      {
         var _loc1_:* = null as IMap;
         if(pregnancy.get_type() == 25)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1204,FlagDict_Impl_.arrayReadInt(_loc1_,1204) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1201));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1201,0);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1202,FlagDict_Impl_.arrayReadInt(_loc1_,1202) + 1);
         }
         pregnancy.knockUpForce();
      }
      
      public function tamaniFirstTimeRefusal() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         outputText("塔玛尼惊讶地睁大了眼睛，[say: 别被尺寸骗了，大[boy]。我能承受的比你想象的要多，]她一边说着，双手一边开始玩弄自己的小穴，[say: 你确定不想稍微发泄一下吗？][pg]");
         menu();
         addButton(0,"操她",tamaniFirstTimeConsentual);
         addButton(1,"拒绝",tamaniSecondRefusal);
         dynStats(DynStat.Lust(5));
      }
      
      public function tamaniFirstTimeConsentual() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         tamaniKnockUp();
         clearOutput();
         get_images().showImage("tamani-fuck");
         outputText("你简直不敢相信自己的好运。你终于遇到了一个愿意交谈而不是直接发动暴力强奸的生物。她直接的挑逗是如此粗俗和公然的性暗示，以至于在她完成提议之前，你就感觉到自己硬了起来。你的决定是由你[armor]里的帐篷做出的。你会给塔玛尼你们俩都想要的东西。[pg]");
         outputText("她的臀部诱人地摇摆着，走近时，她的右手伸进了她性器官湿润的蜜罐里。你脱下衣服，把你的[armor]扔到一边，然后你弯下腰把她抱起来，把她曲线优美的身体压在你的");
         if(get_player().biggestTitSize() > 1)
         {
            outputText(get_player().allBreastsDescript());
         }
         else
         {
            outputText("胸膛上");
         }
         outputText("。她用细小的手臂搂住你的脖子，热情地吻你，让她的舌头滑过你的嘴唇。你们俩激烈地法式热吻，简直就是在用舌头互相操弄。[pg]");
         outputText("她结束了亲吻，微笑着，舔了舔她涂着的闪亮紫色口红，并在你耳边低语，[say: 嗯哼，我就知道你多汁的鸡巴无法抗拒像我这样湿润准备就绪的小穴。我还确保在我的口红里掺入了增强生育能力的化学物质，所以我们会弄得一团糟。][pg]");
         outputText("仿佛为了强调她的观点，她用脚趾卷住你的[cock]，在你的长度上上下滑动时挤压着，挤出了几大滴先列腺液。你呻吟着再次吻了她——你太兴奋了，根本不在乎掺了药的口红是否会把你的高潮变成导致怀孕的洪水。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]因为精液而肿胀，将你的欲望推向了新的高度。");
         }
         else
         {
            outputText("你体内的某种东西因为精液而肿胀，将你的欲望推向了新的高度。");
         }
         outputText("你需要把她的小穴填满——就现在。[pg]");
         if(get_player().cockArea(0) <= 90)
         {
            outputText("塔玛尼结束了亲吻，给了你一个娇羞的微笑，顺着你的身体滑下，将她湿润的小穴贴在你的[cock]的" + get_player().cockHead() + "上。她扭动着臀部画着小圈，用她湿润的入口挑逗着你，你那被药物增强的先列腺液在她的阴唇周围冒泡、流淌，与她自己丰富的体液混合，顺着你的肉棒流下");
            if(get_player().balls > 0)
            {
               outputText("并从你的[balls]滴落");
            }
            outputText("。她停下来挑逗道，[say: 准备好用你的奶油填满我了吗？我就是知道，有这么完美的伴侣，我一定会怀孕的。][pg]");
            outputText("塔玛尼没有等待回答——她停顿了一下，直到你正要回答时，她猛地坐下，将自己完全刺穿，把你刚要说出口的话变成了一阵含糊的呻吟。她把脚踩在你的大腿上，双臂环抱你的背部，开始快速地上下弹跳，挤压、收缩，用她紧致湿润的肉壁不断地榨取你的[cock]。你的腹部内层肌肉开始收紧、挤压，一股热流穿过你的腹股沟，你的精液开始向地精的子宫进发。[pg]");
            outputText("你用双手抓住她，猛地将她按下，直插到底");
            if(get_player().cockArea(0) > 30)
            {
               outputText("看着她的肚子因为你的尺寸而鼓起");
            }
            outputText("。她剧烈地扭动着，几乎在你的怀里挣扎，精液开始涌入她的子宫，让她的肚子开始膨胀。随着每一次精液的喷发，地精都会发出语无伦次的嘟囔声，她的小穴努力地想要留住每一滴精液，把你缠得越来越紧。她的肚子又膨胀了一些，直到压力大到无法承受，精液开始从她的入口喷涌而出，在地上溅成一滩。[pg]");
            outputText("美好的事物终有结束的时候，伴随着一声叹息，你把这个失去知觉的地精荡妇从你的[cock]上拔了出来，看着一条白色的河流从她的大腿间流出。你把她放下，流出的精液突然停止了，剩下的部分被某种反射留在了体内。塔玛尼咯咯地笑着，拍了拍她仍然像怀孕一样鼓起的肚子，[say: 样品不错吧？等你的鸡巴恢复了再来找我，我们可以一次又一次地做。你几乎已经上瘾了，不是吗，" + get_player().mf("种马","亲爱的") + "？][pg]");
            outputText("你花了一会儿时间重新穿上你的[armor]准备离开，但不知为何，你知道这不会是你最后一次见到这个地精。");
            if(get_player().cor > 66)
            {
               outputText("你的[cock]一想到这里就抽动起来，准备好并渴望着更多。");
            }
         }
         else
         {
            outputText("塔玛尼结束了你们湿吻，顺着你的身体滑下，紧紧抓住你的[cock]和[skindesc]，在你的腹股沟处蹲下。这个地精不知怎么地转过身来，倒挂着，手脚紧紧抱住你的阴茎，而她的舌头");
            if(get_player().hasSheath())
            {
               outputText("舔舐着你包皮的边缘");
               if(get_player().balls > 0)
               {
                  outputText("和蛋蛋");
               }
            }
            else if(get_player().balls > 0)
            {
               outputText("舔遍你的蛋蛋");
            }
            else if(get_player().hasVagina())
            {
               outputText("钻进你的褶皱之间，挑逗你现在已经变硬的阴蒂");
            }
            else
            {
               outputText("舔舐着你大腿内侧敏感的[skintone][skindesc]");
            }
            outputText("[pg]");
            outputText("她的小穴在你的龟头上摩擦，涂抹着流口水的小穴润滑液和你自己滴落的先列腺液的混合物。随着你的鸡巴变得光滑湿润，她手脚缠绕着你的感觉越来越好。她甚至像阴茎环一样紧紧地用双臂抱住你，让你的鸡巴跳动并充血几秒钟，然后才松开。你的腹部内层肌肉开始收紧、挤压，一股热流穿过你的腹股沟，你的精液开始踏上自由的旅程。[pg]");
            outputText("她感觉到它穿过了她按在阴户上的手指，然后以令人惊讶的运动能力，地精撑起身体，将她湿润的阴户裂口直接落在了你那过大的尿道口上。当第一团精液从你的体内喷涌而出，将她那相当有弹性的爱之通道填满浓稠的精液时，你呻吟出声。几股精液从不完美的密封边缘喷射出来，而她的双手则从下到上在你的[cock]上撸动，试图挤出更多的精液。[pg]");
            outputText("当你把越来越多的精液塞进她饥渴的子宫时，塔玛尼的身体开始膨胀。她的肚子鼓了起来，越来越多的精液从她湿润的嘴唇周围溢出，再也无法装下更多。地精被你喷发的冲击力震得摇晃，然后向后倒下，平躺在地上。尽管如此，你的身体还在不断地泵出更多");
            if(get_player().balls > 0 && get_player().get_hoursSinceCum() > 200)
            {
               outputText("，肉眼可见地将你的[balls]排空到正常大小");
            }
            outputText("，而塔玛尼则尽力用她的嘴和湿透的阴户接住它。[pg]");
            outputText("你抖落最后几滴精液，任由它们滴落在她的头发上。你低头看着这个心满意足的地精女孩，她说道：[say: 我的免费试用不错吧？等你的鸡巴恢复了再来找我，我们可以一次又一次地做。你实际上已经上瘾了，不是吗，" + get_player().mf("种马","亲爱的") + "？][pg]");
            outputText("你花了一会儿时间重新穿上你的[armor]准备离开，但不知为何，你知道这不会是你最后一次见到这个地精。");
            if(get_player().cor > 66)
            {
               outputText("你的[cock]一想到这里就抽动起来，准备好并渴望着更多。");
            }
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-1),DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniFemaleYes() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         get_images().showImage("tamani-dDildo");
         outputText("[say: 我就说嘛，]地精一边在她的袋子里摸索一边说，[say: 但我也不残忍，我会把我最好的假阳具给你，这样你就可以一直把你那火热的小穴塞得满满的了。][pg]");
         outputText("她掏出一根长长的粉色鸡巴扔给你。你接住它，它在你手里甩来甩去，差点打到你的脸颊。");
         if(get_player().cor < 50)
         {
            outputText("真恶心。[pg]");
         }
         else
         {
            outputText("被鸡巴打脸其实还挺性感的……[pg]");
         }
         outputText("地精留下一句警告，[say: 小心点，这玩意儿会疯狂漏催情剂。相信我，对那玩意儿上瘾可是很有趣的。哦，还有，记住——塔玛尼拥有这附近所有的鸡巴，所以如果你长了一根，记得来交保护费！][pg]");
         get_images().showImage("item-dDildo");
         outputText("(<b>获得豪华假阳具！</b>)");
         get_player().createKeyItem("Deluxe Dildo",0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniFemaleNo() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         outputText("地精哼了一声，[say: 走着瞧吧，你这个荡妇。我会怀上这座山这边所有怪物和种马的孩子。见鬼，只要你长出一根鸡巴，看看塔玛尼的腿多快就会缠上你！][pg]");
         outputText("她气冲冲地走了，显然打算在回家的路上操翻所有能产生精子的东西。");
         if(get_player().cor < 33)
         {
            outputText("真是个荡妇。");
         }
         else if(get_player().cor < 66)
         {
            outputText("真奇怪。");
         }
         else
         {
            outputText("你希望她能漏掉几个。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniFemaleEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         get_images().showImage("tamani-encounter");
         outputText("一个地精从岩石露头后面跳了出来。她双臂交叉抱在" + tamaniChest() + "前，怒视着你。这个小家伙只有大约四英尺高，染着粉黑相间的头发，剪成了一个可爱的小发型。她乳房上灰绿色的皮肤在双臂周围鼓起，由几根皮带支撑着，挤出了深深的乳沟。她的阴唇上打了好几个洞，有些发炎，微微张开。她身上真的没有任何衣服来遮挡它们，只有更多无处不在的皮带缠绕在她的腿上。[pg]");
         outputText("她说，[say: 这里的鸡巴就那么多，我全包了，懂吗，小婊砸？][pg]");
         menu();
         addButton(0,"呃，好吧？",tamaniFemaleYes);
         addButton(1,"不行",tamaniFemaleNo);
         addButton(2,"更喜欢女孩",preferTamaniFemdom);
      }
      
      public function tamaniFacesitPush() : void
      {
         clearOutput();
         outputText("你对她到底为你准备了什么不感兴趣，而且从她双腿的轻微颤抖中你可以看出，她还没有从那次高潮中完全恢复过来。你只需伸出手，抓住她的臀部，把这只地精猛地拉到一边，让她从你身上摔下来。");
         outputText("[pg]她痛苦地\"哎哟\"一声摔在地上，躺在那里愣了一会儿，然后才回过神来。[say: 好痛，你这个无脑花瓶！][if (isbimbo) {她说的，好像，也[i: 没错]，但是，好像，她也没必要这么刻薄吧|好吧，不管她现在看起来有多可爱，你都不打算留下来听更多的侮辱了}]。你站起身，收拾好东西，继续上路，留下那个被抛弃的地精。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniFacesitContinue() : void
      {
         clearOutput();
         outputText("无论她为你准备了什么，一想到要被这个绿色的小荡妇伺候，你就兴奋得不行，甚至你那泛滥的淫液已经清楚地表明了你对此的感受。");
         outputText("[pg]塔玛尼没有征求你的同意，就开始[if (singleleg) {抚摸你[if (isgoo) {凝胶状的下半身|的尾巴}]|掰开你的双腿}]。你看不清她到底在做什么，你的视线目前被她那宽大的屁股挡住了，所以当你感觉到有什么冰凉、光滑又坚硬的东西擦过你的大腿时，你吓了一跳，浑身打了个冷颤。");
         outputText("[pg][say: 既然你对我来说是个这么乖的婊子，而且我现在心情很慷慨]——她突然弹了一下你的阴蒂来强调这句话，让你在她身下扭动起来——[say: 我决定让你爽一爽。]她轻轻抚摸你的[if (singleleg) {[if (tailLeg) {尾巴|下半身}]|大腿内侧}]，引得你娇喘连连，随后她突然变成粗暴的掐捏。[say: 但是！别以为你除了是我的玩具之外还能是什么，荡妇。]");
         outputText("[pg]她以拍打你的侧腹开始她的把戏，但紧接着又是更加温柔的抚摸，向你展示她既能残忍也能温柔。每次她的手缩回去，你都会因欲望而颤抖，你的整个身体都紧绷着渴望接触，同时你的脑海开始胡思乱想，担忧她的手指接下来会落在哪里。最后，你感觉到她的器具轻轻地压在了你的阴唇上。");
         outputText("[pg][say: 你真该庆幸我居然会考虑这么做，]她说道，不过考虑到你已经给她舔过多少次了，你对她这番话的真实感受有些怀疑。不管怎样，她还是插了进来。之前所有的兴奋，加上她现在的爱抚，已经让你湿得足以让假阳具毫无阻碍地滑入，没过多久她就开始轻快地抽插起来。");
         outputText("[pg]你忍不住呻吟出声，但看到你毫无动作，塔玛尼猛地把臀部压了下来，明确表示她想要些回报。在她贪婪的性欲驱使下，你急切地埋下头，深深地吸吮着她抽搐的穴口。为了奖励你重新燃起的奉献精神，她开始变换动作，扭动并调整假阳具的角度，以击中所有最敏感的部位。你们俩现在都因渴望而喘息着，淫液肆意流淌，双双冲向即将到来的高潮。");
         outputText("[pg][say: 噢，操——嗯……咿咿呃哦-噢噢-噢！]");
         outputText("[pg]尽管她极力想保持冷漠，但随着她的舌头变得像果冻一样软，她的话语开始含糊不清。这只贪婪的地精抓住你的腰部来稳住自己，她的核心力量显然已经无法支撑她了，她发出一声响亮的呻吟，不再试图掩饰自己的快感。从她在你舌头周围跳动的方式，你可以看出她又高潮了，而且这次她没有停下来的迹象，随着她体验到持续的极乐，她的整个身体开始颤抖。看到这样一个强势的伴侣像这样迷失自我，真是非常迷人，你沉浸在这小小的胜利中。");
         outputText("[pg]让你非常惊讶的是，突然之间，你体内的紧绷感聚集起来，然后爆发，让你在意想不到的高潮中颤抖。塔玛尼要么是做不到，要么是对让你高潮没兴趣，所以你的肉褶只能在你体内那个毫无生气的玩具周围蠕动。但同样地，一种强烈的满足感传遍你的全身，渗入你的[if (isgoo) {粘液|骨髓}]中，让你感到完全的平静。");
         outputText("[pg]当你终于觉得可以再次动弹时，你注意到上方传来微弱的打呼声。你试探性地戳了戳她以确认，看起来塔玛尼确实在你身上睡着了。然而，她矮小的身材让你[if (str > 30) {毫不费力地|更容易}]把她抱下来，然后轻轻地把她放在森林的地面上。");
         outputText("[pg]你稍微想了一下如果让她毫无防备地留在这里会发生什么，但随后你意识到无论如何她可能都会很享受，所以你动身返回营地，在经历了如此愉快的体验后，你的[if (singleleg) {身体|双腿}]仍然有些发软。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tamaniChest() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1202);
         while(true)
         {
            if(_loc2_ != -1)
            {
               if(_loc2_ != 0)
               {
                  if(_loc2_ != 1)
                  {
                     if(_loc2_ != 2)
                     {
                        if(_loc2_ != 3)
                        {
                           if(_loc2_ != 4)
                           {
                              if(_loc2_ != 5)
                              {
                                 if(_loc2_ != 6)
                                 {
                                    if(_loc2_ != 7)
                                    {
                                       if(_loc2_ != 8)
                                       {
                                          if(_loc2_ != 9)
                                          {
                                             if(_loc2_ != 10)
                                             {
                                                _loc1_ = Utils.rand(2) == 0 ? "巨大的" : "庞大的";
                                                break;
                                             }
                                          }
                                       }
                                    }
                                    _loc1_ = Utils.rand(2) == 0 ? "比例夸张的" : "超大号的";
                                    break;
                                 }
                              }
                           }
                           _loc1_ = Utils.rand(2) == 0 ? "晃荡的" : "令人印象深刻的";
                           break;
                        }
                     }
                  }
                  _loc1_ = Utils.rand(2) == 0 ? "硕大的" : "摇晃的";
                  break;
               }
            }
            _loc1_ = Utils.rand(2) == 0 ? "丰满的" : "盈盈一握的";
            break;
         }
         switch(Utils.rand(11))
         {
            case 0:
            case 1:
            case 2:
               return _loc1_ + "奶子";
            case 3:
               return _loc1_ + "肉球";
            case 4:
               return _loc1_ + "双峰";
            case 5:
               return _loc1_ + "小笼包";
            case 6:
               return _loc1_ + "巨乳";
            case 7:
               return _loc1_ + "爱之枕";
            default:
               return _loc1_ + "乳房";
         }
      }
      
      public function tamaniBeaten() : void
      {
         clearOutput();
         outputText("打败地精后，你终于可以自由地满足身体真正的渴望了，哪怕这渴望与地精一心想要挑起的欲望截然不同。你像脱去第二层皮肤一样褪下[armor]，轻松地摆脱了这些碍事的衣物。随着你赤裸的身体显露出来，塔玛尼");
         if(get_player().hasCock())
         {
            outputText("满怀期待地舔了舔嘴唇，双眼紧盯着[eachCock]");
         }
         else
         {
            outputText("不满地皱起眉头，注意到你没有阴茎");
         }
         outputText("。她对你蜘蛛下半身下方逐渐变大的器官一无所知，那是你通常隐藏起来的蛛化精灵的秘密宝藏。一滴绿色的粘液从半硬器官的顶端滴落，依然瞒过了这位地精主母。");
         outputText("[pg]你迅速爬到她面前，平静地说：[say: 弯下腰。我想用我的蜘蛛下半身占有你。]");
         outputText("[pg]这个急不可耐的荡妇得意地笑了笑，轻声说道：[saystart]都听你的，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,581) == 0)
         {
            outputText("我的孩子" + get_player().mf("他爹","他娘"));
         }
         else
         {
            outputText("我那痴迷于卵的蜘蛛爱好者");
         }
         outputText("。[sayend] 很快，这个紫发荡妇就摆好了姿势，尽管她还厚颜无耻地回头舔了舔嘴唇。她那炽热的目光分明是在渴求着肉棒，但在这种情况下，她只能用你的产卵管将就一下了。你将目光从她饥渴的眼神移开，看向那绿色的翘臀，欣赏着她饱满的臀瓣、紧缩的肛门，以及最棒的——她那湿透了的下体。[pg]");
         get_images().showImage("goblinelder-win-drider-egged");
         outputText("塔玛尼呼出一口气，[say: 眼睛看上面，" + get_player().mf("种马","繁育者") + "。我想看着你的脸操我，] 她的语气中承诺着超乎想象的快感。[saystart]把它插进我的小穴里，给我你的孩子。没有什么比操一个愿意把你的肉棒直接吞进子宫，让你用精液沐浴她的卵的女人更爽的了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,581) > 0)
         {
            outputText("，或者在你的情况下，是更多的卵");
         }
         outputText("。[sayend] 她一边说着，一边用娇小的双手揉捏着自己因情欲而挺立的乳头，并朝你的方向扭动着她那弹性十足的屁股。");
         outputText("[pg]当你向这个趴在地上、渴望怀孕的地精逼近时，你坚硬的腿发出嘈杂的咔嗒声。你弯曲着陌生的肌肉，压低腹部，将肿胀的器官对准了地精那汁水四溢的阴唇。她那闪闪发光的通道为你那雄性的产卵管敞开，让滴着粘液的管子轻松地滑入她的通道。很快，你的甲壳就摩擦着她那颤动的绿色臀部，产卵管被地精贪婪的小穴完全吞没。她那起伏的通道轻轻地挤压着它，仿佛在说“你好”。你的蛛化精灵本能以一股浓稠的绿色粘液作为回应。");
         outputText("[pg]塔玛尼开心地咯咯笑着问：[say: 今天有点心急啊，" + get_player().mf("种马","宝贝") + "？你的蜘蛛棒就这么喜欢体验地精的爱吗？] 她兴高采烈地开始自己动起来，像骑着一匹狂奔的表演马一样骑着你的蜘蛛工具。你呻吟了一声，享受了片刻，然后想起你刚刚才打败了这个傲慢、渴望肉棒的荡妇。你把手放在她的肩膀上，把她按下去，一边填满她，一边把她压在泥土上，这才是她该待的地方。地精被牢牢地钉在地上，你收缩并释放出你的第一颗卵；只要你让一颗卵顺着你肉质的管子滚下去，下一颗就会紧随其后。");
         outputText("[pg][say: 什……什么……哦哦哦。真舒服，] 塔玛尼叹息着，试图与你对视。你戏谑地对她笑了笑，伸手去玩弄她的" + tamaniChest() + "，粗暴地揉捏着，而你的卵则畅通无阻地滚入她那心甘情愿、富有弹性的子宫。绿色的女孩颤抖着呻吟道：[say: 是的！填满我！把我填满！]");
         outputText("[pg]你依然紧紧地抓着她，只是单纯地享受着这种感觉，慢慢地用圆球和粘稠的绿色缓冲物填满塔玛尼的子宫。一丝多余的粘液从这个曲线优美的荡妇的大腿间流出，与她自己清澈的汁液混合在一起。它在她的身下形成了一滩粘稠的水洼，随着地精肚子的胀大，水洼也越来越大。乳汁突然从她变暗的乳头中喷涌而出，弄湿了你的手指，于是你更加用力地挤压，像挤奶牛一样挤着这个小荡妇的奶。她大喊道：[say: 操，太爽了！让我怀上你的孩子，让奶水喷得到处都是！天哪……好……好有怀孕的感觉……]");
         outputText("[pg]塔玛尼的双手开始在她那因怀孕而紧绷的圆滚滚的肚子上游走，肚子还在不断胀大。伴随着一声欢呼的尖叫，她达到了高潮，将带着绿色的淫液呈扇形喷洒在身下。她在你的掌控中瘫软下来，尽管她的乳汁依然畅通无阻地流淌着。你放开了她，尽管她依然被最后几颗进入她那富有弹性、肥沃子宫的卵的压力固定在你的管子上。你开心地哼着歌，感到完全的释然，无比的慵懒和满足。");
         if(get_player().hasCock())
         {
            outputText("白色的液体覆盖了地精的肩膀以上，这是你雄性满足的唯一证据。你太专注于受孕的过程以及它所提供的独特快感，以至于几乎没有注意到[eachCock]在共鸣的快感中爆发。");
         }
         outputText("[pg]最后，这个肚子胀鼓鼓的婊子扑通一声滑进了那滩绿色的粘液中，让你的产卵管得以缩回。她立刻开始打呼噜，显然和你一样满足。真是个奇怪的生物。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,581,FlagDict_Impl_.arrayReadInt(_loc1_,581) + 1);
         if(get_player().fertilizedEggs() == 0)
         {
            pregnancy.knockUpForce(15,72);
         }
         get_player().dumpEggs();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function tamaniAnalShits() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         clearOutput();
         get_images().showImage("tamani-fuck");
         outputText("你抓住那个失去知觉的地精染成粉红色的头发，把她推到泥里，对她不断的要求和强奸企图感到恼火。这个饥渴的荡妇甚至没有为自己的失败感到羞耻的觉悟。她只是躺在泥里，在空中来回扭动着她暴露的屁股，试图用它来诱惑你。[pg]");
         outputText("这个目标太诱人了，让人无法抗拒。你解开[armor]，让你的肉棒弹出来。你已经被这诱人的景象弄得硬邦邦的，再也无法抗拒，你抓住她的臀部，把她丰满的屁股拉向你。当她在地上被拖拽时，她喘着粗气，试图伸长脖子看着你。[say: 嘿，嘿，种马，]塔玛尼结结巴巴地说，突然变得紧张起来，[say: 你不会是想——]你把她拉近，将你的" + get_player().cockDescript(_loc1_) + "的顶端抵在她紧致的屁眼上。[say: 嘿！]她大声喊道，威胁地瞪着你。[say: 你最好别这样，我需要把那些精液射在我的子宫里，而不是我的屁股里！][pg]");
         outputText("然而，你那充满威胁的笑容并没有流露出对地精的怜悯。你慢慢地挺进她的身体，随着她紧致的后庭包裹住你，她的脸因痛苦而扭曲。当你完全没入她体内时，她闷哼了一声，双手紧握成拳。[say:求你了，]她哀求着，眼中闪烁着痛苦和挫败的泪光，[say:我需要你插进我的小穴里！它……我不想——呃！]你开始用力地抽插你的肉棒，每一次挺进都让她的丰臀重重地撞击在你身上。从她包裹你的感觉来看，你可以断定她对这种方式并不怎么有经验。[pg]");
         outputText("不过，随着你的" + get_player().cockDescript(_loc1_) + "不断撑开她紧致的后庭，她似乎也越来越适应了。虽然她仍在闷哼间微弱地抗议，但偶尔也会爆发出一声呻吟，其中蕴含的激情告诉你，她开始喜欢上这种感觉了。最终，她在你的掌控下放松下来，任由你像对待廉价玩具一样蹂躏她的屁股。她的一只手甚至悄悄伸向了自己湿润的小穴，探了进去。她的臀部也开始不受你控制地微微扭动，前后摇摆着，而你则越来越用力地撞击她。很明显，她喜欢这种感觉，即使她知道这不会让她怀孕。[pg]");
         outputText("随着快感将她淹没，这个淫荡生物的呻吟变成了大喊，她疯狂地向后顶撞着你，脸依旧埋在泥土里，舌头伸出嘴外。[say:哦，操，对，再用力点，再用力点！]她疯狂地爆发出来。你顺从了她的意愿，加快了速度，用你的" + get_player().cockDescript(_loc1_) + "的抽插动作彻底蹂躏着她紧致的后庭。当她的脸在泥地里摩擦时，她在你身下某处尖叫着。你猛烈地撞击她，让她整个身体前后摇晃，沉浸在当你进出她几英寸时，她紧致的后庭挤压你肉棒的感觉中。[pg]");
         outputText("你能感觉到精液在你体内积聚，你知道自己坚持不了多久了。低头看去，你可以看到塔玛尼也快要高潮了。她的手指在小穴里快速地进出，脸上露出一种毫无杂念的极乐神情。就在你射精的时候，她浑身一颤，在你的掌控中瘫软下来，你的精液涂满了她的肠壁。当你把疲软的肉棒从她屁股里拔出来时，她的眼睛仍然翻白着。你松开她，让她的双腿砰的一声落回地面。她翻过身，侧躺着抬头看着你。在筋疲力尽的喘息间，她勉强说道：[say:别……以为我……很享受……什么的……我会回来找你的，你最好别……]话还没说完，她就晕了过去。你摇了摇头，嘲笑这个固执的小荡妇，然后把[eachcock]塞回[armor]里，回到了营地。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function spareTamani() : void
      {
         clearOutput();
         outputText("你告诉她，如果你们再见面，她会很惨的。[say: 是的……] 塔玛尼抽泣着，眼泪在脸上打转。她站起来，把挎包留在地上，然后跑进了树丛，再也没有出现过。[pg]");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2275,0.5);
         postTamaniRemoval();
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function satchelTakeItem(param1:ItemType, param2:int) : void
      {
         get_player().addKeyValue("Tamani\'s Satchel",param2,-1);
         get_inventory().takeItem(param1,openTamanisSatchel);
      }
      
      public function satchelTakeGems() : void
      {
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() + 100);
         get_player().addKeyValue("Tamani\'s Satchel",4,-100);
         statScreenRefresh();
         openTamanisSatchel();
      }
      
      public function reset() : void
      {
         saveContent.timesRidden = 0;
      }
      
      public function preferTamaniFemdom() : void
      {
         clearOutput();
         outputText("[say: 你喜欢女孩，是吧？] 塔玛尼笑着转过身，调皮地拍了拍她肥大的屁股。你看着她又拍了一次，现在她更多的是在嘲笑你，而不是<i>和你一起</i>笑，然后她又转过身来。[say: 告诉你吧，荡妇！我今天运气太差了，没找到好种马，所以我跟你做个交易。]");
         outputText("[pg]塔玛尼走近了一些，带着小恶魔般的坏笑直视你的眼睛。[say: 如果你发誓离</i>我的<i>鸡巴远点，我就让你爽一爽。成交吗？]");
         menu();
         addButton(0,"接受",acceptTamaniFacesits);
         addButton(1,"拒绝",declineZeFacesits);
      }
      
      public function postTamaniRemoval() : void
      {
         get_images().showImage("tamani-satchel");
         outputText("塔玛尼已经不在了，你拿走她的挎包，回到了你的营地。");
         var _temp_1:* = get_monster();
         _temp_1.XP = _temp_1.XP + 100;
         get_player().createKeyItem("Tamani\'s Satchel",2,1,1,100);
         if(pregnancy.get_isPregnant())
         {
            pregnancy.knockUpForce();
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function openTamanisSatchel() : void
      {
         var _g4:Inventory;
         var countOnly:Boolean;
         var _g3:Inventory;
         var keyValue2:int;
         var item2:ItemType;
         var _g2:TamaniScene;
         var keyValue1:int;
         var item1:ItemType;
         var _g1:TamaniScene;
         var keyValue:int;
         var item:ItemType;
         var _g:TamaniScene;
         var _loc2_:* = null as String;
         clearOutput();
         var _loc1_:Boolean = true;
         outputText("你打开从塔玛尼那里拿来的挎包，看了看里面。");
         if(!get_player().hasKeyItem("Deluxe Dildo"))
         {
            get_images().showImage("item-dDildo");
            outputText("[pg]<b>(你在里面发现了一个制作精良的粉色假阳具！如果你愿意，还有其他东西可以拿。)</b>");
            get_player().createKeyItem("Deluxe Dildo",0,0,0,0);
         }
         menu();
         if(get_player().keyItemv1("Tamani\'s Satchel") > 0)
         {
            get_images().showImage("item-reducto");
            outputText("\n这里有" + (get_player().keyItemv1("Tamani\'s Satchel") == 1 ? "一个容器" : "两个容器") + "，里面装着一种糊状物质，标签上写着“缩形膏”。");
            _loc2_ = get_consumables().REDUCTO.get_shortName();
            _g = this;
            item = get_consumables().REDUCTO;
            keyValue = 1;
            addButton(0,_loc2_,function():void
            {
               _g.satchelTakeItem(item,keyValue);
            });
            _loc1_ = false;
         }
         if(get_player().keyItemv2("Tamani\'s Satchel") > 0)
         {
            get_images().showImage("item-dye");
            outputText("\n里面有一瓶粉色的染发剂。");
            _loc2_ = get_consumables().PINKDYE.get_shortName();
            _g1 = this;
            item1 = get_consumables().PINKDYE;
            keyValue1 = 2;
            addButton(1,_loc2_,function():void
            {
               _g1.satchelTakeItem(item1,keyValue1);
            });
            _loc1_ = false;
         }
         if(get_player().keyItemv3("Tamani\'s Satchel") > 0)
         {
            get_images().showImage("item-lDraft");
            outputText("\n里面" + (get_player().keyItemv3("Tamani\'s Satchel") == 1 ? "有一瓶" : "有两瓶") + "粉色的液体，标签上写着“催情剂”。");
            _loc2_ = get_consumables().L_DRAFT.get_shortName();
            _g2 = this;
            item2 = get_consumables().L_DRAFT;
            keyValue2 = 3;
            addButton(2,_loc2_,function():void
            {
               _g2.satchelTakeItem(item2,keyValue2);
            });
            _loc1_ = false;
         }
         if(get_player().keyItemv4("Tamani\'s Satchel") > 0)
         {
            get_images().showImage("item-gems");
            outputText("\n挎包里有100颗宝石。如果你想的话可以拿走。");
            addButton(3,"宝石",satchelTakeGems);
            _loc1_ = false;
         }
         outputText("[pg]");
         _g3 = get_inventory();
         countOnly = false;
         addButton(14,"关闭",function():Boolean
         {
            return _g3.checkKeyItems(countOnly);
         });
         if(_loc1_)
         {
            clearOutput();
            outputText("挎包里的东西已经空了。你丢弃了空挎包。");
            get_player().removeKeyItem("Tamani\'s Satchel");
            _g4 = get_inventory();
            doNext(function():Boolean
            {
               return _g4.checkKeyItems();
            });
         }
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function killTamaniChoice() : void
      {
         clearOutput();
         outputText("塔玛尼真的惹恼了你，你厌倦了她强迫你。你踢了塔玛尼一脚，她痛苦地扭动着。[say: 看来你不再想要我了？] 塔玛尼抽泣着。");
         outputText("");
         menu();
         if(get_silly())
         {
            addButton(0,"FIGHT",killTamani);
            addButton(1,"MERCY",spareTamani);
         }
         else
         {
            addButton(0,"杀了她",killTamani);
            addButton(1,"饶了她",spareTamani);
         }
      }
      
      public function killTamani() : void
      {
         clearOutput();
         outputText("你走过去抓住她的头。[say: 不！] 塔玛尼大叫。你告诉她，她不该强迫你。你扭断了她的脖子，把她毫无生气的尸体扔在地上。");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2275,1);
         postTamaniRemoval();
      }
      
      public function get_debugName() : String
      {
         return "Tamani";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getRapedByTamaniYouHypnoSlut() : void
      {
         spriteSelect(SpriteDb.get_s_tamani());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(65);
         var _loc2_:Number = 0;
         var _loc3_:int = get_player().totalCocks();
         outputText("塔玛尼勾了勾手指，你便跑了过去，已经感觉到自己在[armor]里紧绷着，渴望着能有机会操你的妻子兼情妇。她咯咯地笑着，[say: 噢，多甜啊，你已经准备好履行你的职责了。][pg]");
         outputText("地精的手指在你" + Utils.cnName(get_player().get_armorName()) + "的凸起处划过，然后伸进去温柔地捏了捏。你叹了口气，很高兴能从你可爱的妻子那里得到如此温柔的对待。你的双手不由自主地解开你的[armor]，脱掉这件碍事的衣服，以免妨碍你们做爱。塔玛尼又捏了你一下，戏谑道，[say: 哦，宝贝，你迷上塔玛尼的小穴了，是不是？我看得出来，你简直在发抖。让塔玛尼帮你解决吧。][pg]");
         outputText("她得意地笑了笑，弯下腰，从双腿间回头看着你。她提议道，[say: 来吧，插进来。像你这样饥渴的" + get_player().mf("boy","herm") + "，需要把你那根美味的鸡巴插进像我这样紧致的好妻子体内。][pg]");
         get_images().showImage("tamani-willing-sex");
         if(_loc1_ >= 0)
         {
            outputText("塔玛尼说得完全正确。你抓住她的屁股，感觉到手指陷入了她柔软的肉里，你把她拉向你的");
            if(_loc3_ > 0)
            {
               outputText("主");
            }
            outputText("[cock]。她的温暖慢慢蔓延到你的" + get_player().cockHead(_loc1_) + "上，让你抽搐着在她体内滴下液体，用更多的滑液润滑她已经湿透的通道。你用力一挺，插进她的体内，感觉自己深深地穿透了她，直达她肥沃的子宫。塔玛尼用手摩擦你的[legs]，在你顶到底时给你按摩，感觉她的汁液弄脏了你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("胯部");
            }
            outputText("[pg]");
            outputText("你等了一秒钟，适应着被这样一个温暖潮湿的洞完全包裹的感觉，然后慢慢地把她推开。当你把她拉回来时，她通道光滑的内壁紧紧地夹住你，按摩着你仍在她体内的部分。");
            if(_loc3_ > 1)
            {
               if(_loc1_ > 0)
               {
                  _loc2_ = 0;
               }
               else
               {
                  _loc2_ = 1;
               }
               outputText("她呻吟着，将你的" + get_player().cockDescript(int(_loc2_)) + "含入嘴里，用舌头舔舐着顶端，手掌在底部滑动。");
            }
            else
            {
               outputText("她呻吟着，喘息着，不停地嘟囔着你对她有多好。");
            }
            outputText("你一直没有停下，直到你的" + get_player().cockHead(_loc1_) + "完全没入她的体内。[pg]");
            outputText("第二次抽插的感觉甚至比第一次还要好。湿滑、火热、充满激情，任何放慢速度或停下来的想法都是不可想象的。塔玛尼随着每一次抽插喘息着，用空闲的手抓揉着她那跳动的乳房，捏住其中一个乳头，大声呻吟着");
            if(_loc3_ > 0)
            {
               outputText("紧紧包裹着你的" + get_player().cockDescript(int(_loc2_)));
            }
            outputText("。她娇小的身躯颤动着，");
            if(get_player().get_tallness() > 55)
            {
               outputText("随着你的动作双脚离地，你将自己的身体完全交给了她的肉欲。");
            }
            else
            {
               outputText("当你沉浸在与她的交欢中时，几乎要摔倒了。");
            }
            outputText("她肉眼可见地高潮了，从头到脚都在颤抖，她的小穴榨取着你的" + get_player().cockDescript(_loc1_) + "。虽然这感觉就像在天堂一样，但只持续了几秒钟，随后她的身体便瘫软下来。[pg]");
            outputText("你抓住这个机会，加快了速度，以一种近乎凶狠的活力在她体内进进出出。你的汁液发出湿润的拍打声——");
            if(get_player().hasFur())
            {
               outputText("湿结的");
            }
            else
            {
               outputText("湿滑的");
            }
            outputText("[skindesc]拍打她屁股的湿润啪嗒声在空气中回荡。你每一次抽插都更加用力、更加快速地操着你的妻子，你知道自己撑不过几次抽插，就会把她的子宫涂成白色。你的妻子已经被操得高潮连连，无暇顾及或回应，");
            if(_loc3_ == 1)
            {
               outputText("她吐着舌头，喘息着发出毫无意义的欢愉声。");
            }
            else
            {
               outputText("而且她的嘴里塞满了" + get_player().cockDescript(int(_loc2_)) + "，除了发出毫无意义的欢愉咕噜声外，什么也做不了。");
            }
            outputText("你的" + get_player().cockDescript(_loc1_) + "在湿润的穴内胀得更粗，一阵酥麻和紧绷感袭来，即将爆发。[pg]");
            outputText("强烈的快感席卷全身，让你的身体紧绷起来，你将你的" + get_player().cockDescript(_loc1_) + "像活塞一样向前挺进，深深地埋进这个地精形状的精液容器里。");
            if(get_player().hasKnot(_loc1_))
            {
               outputText("你的肉结在她体内膨胀，将她锁在原地");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("你的龟头冠状沟变宽，竟然卡在了塔玛尼的子宫里");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("你" + get_player().cockDescript(_loc1_) + "上的腐化结节以波浪般的动作跳动着，按摩着塔玛尼小穴的内部");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("你的触手鸡巴顶端变宽，在塔玛尼的子宫里变得像蘑菇一样");
            }
            else
            {
               outputText("你敏感的龟头随着高潮的收缩而微微肿胀");
            }
            outputText("，同时你开始用精液填满你妻子的子宫。高潮很强烈");
            if(get_player().cumQ() < 50)
            {
               outputText("，但很短暂，在片刻的痉挛快感之后，喷涌的精液减缓成了细流。");
            }
            else if(get_player().cumQ() < 300)
            {
               outputText("且量大，将越来越多的精液强行注入塔玛尼的子宫，直到她随着每一次新的喷射发出水声。在漫长的痉挛快感之后，喷涌的精液减缓成了细流。");
            }
            else
            {
               outputText("且量极大，将浓稠的精液直接喷射进塔玛尼等待着的子宫里，直到每一次新的精液爆发都让她发出水声。她呻吟着，肚子微微胀起，直到再也容纳不下。");
               if(get_player().cumQ() < 1000)
               {
                  outputText("虽然你的高潮逐渐平息，但多余的精液从她的大腿间溢出，顺着流下，变成缓慢滴落的粘稠白色液体。");
               }
               else
               {
                  outputText("你被困在她的体内，高潮如潮水般涌来，你不断向地精体内注入精液，直到你的种子从她的阴道中涌出，在你们周围的地上汇聚成一滩。");
               }
               if(get_player().cumQ() >= 1000 && get_player().cumQ() < 4000)
               {
                  outputText("高潮最终还是结束了，但在你们俩之间已经形成了一大滩精液。");
               }
               else
               {
                  outputText("这似乎持续了永远，当你结束时，你们俩已经站在了几英寸深的精液坑里。");
               }
            }
            if(_loc3_ > 1)
            {
               outputText("在整个过程中，塔玛尼的喉咙不断吞咽着每一滴精液");
               if(get_player().cumQ() > 300)
               {
                  outputText("，但没过多久她就咽不下了，精液从她的嘴角漏了出来。");
                  if(get_player().cumQ() > 600)
                  {
                     outputText("几秒钟后，她咳嗽着退开，这个活泼的地精用脸接下了你剩下的精液。");
                  }
               }
               else
               {
                  outputText("。");
               }
            }
            outputText("[pg]");
            outputText("你们俩紧紧贴在一起，勉强保持着站立，互相倚靠着对方");
            if(get_player().get_tallness() > 55)
            {
               outputText("尽管身高有差距");
            }
            outputText("。塔玛尼恢复了理智，将你推开，在经历了激烈的性爱后，她走起路来有些摇晃。白色的精液和清澈的女性体液顺着她的大腿流下，你的女主人高兴极了。她深情地抚摸着你还在滴水的" + get_player().cockDescript(_loc1_) + "，说道：[say:你真是个好丈夫。我迫不及待想看看你和你的新女儿们相处得怎么样了！][pg]");
            outputText("听到她的赞美，你心中涌起一阵自豪感。你俯下身，给了你的妻子一个长长的法式热吻，然后才动身返回营地。在回去的路上，你的头脑慢慢清醒过来，你开始纳闷刚才到底是怎么回事？！");
            tamaniKnockUp();
            get_player().orgasm("Dick");
            dynStats(DynStat.Inte(-0.5),DynStat.Sens(-1));
         }
         else
         {
            outputText("塔玛尼说得完全正确。你抓住她的屁股，感觉到手指陷入了她柔软的肉里，你把她拉向你的");
            if(_loc3_ > 1)
            {
               outputText("主");
            }
            outputText("[cock]。她的温暖蔓延到你[cock]的" + get_player().cockHead() + "上，但无法再深入了。你用力拉扯她那弹性的臀部，但你实在太大了，根本塞不进你妻子美丽的阴道里。她转过身，把一只小手放在");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("你的胸前");
            }
            else
            {
               outputText("在你的[breasts]之间");
            }
            outputText("并命令道，[say:停下，你太大了，塔玛尼没法用老办法来做。][pg]");
            outputText("虽然有些不满，但你还是乖乖听话，停止了对她小穴的攻势并放开了你的妻子。看来她有别的办法让你那胀痛的[cock]履行它的职责。塔玛尼转过身，拿出一根透明的管子，以及一个柔软灵活的套子，同时解释道，[say:我只能用这个让你射出来，然后把你所有的宝宝都泵进我体内了！][pg]");
            outputText("她那灵巧的小手包裹住你上半截的");
            if(_loc3_ > 1)
            {
               outputText("主要的");
            }
            outputText("[cock]被套进了护套里，紧紧地包裹在透明的材质中。你叹了口气，忍受着这种待遇，有些失望不能在将精液注入她肥沃的子宫时感受到她的紧致。她完成了准备工作，慢慢地将管子推入她那美丽、充满女性魅力的洞穴中，直到你确信它会将你珍贵的货物存放在她最深处。塔玛尼兴奋地拍着手，[say: 在你之前，我还没遇到过大到能用这个的男人。哦，老公，你会喜欢这个的，只要为塔玛尼躺好就行了，好吗？][pg]");
            outputText("你像个好丈夫一样照做了，塔玛尼靠得很近，通过一根柔软的人造脐带与你相连。她坐在你旁边，把脚搭在你的[cock]上。这个地精绿色的脚上没有穿鞋，尽管生活条件艰苦，但它们比她的手还要柔软，而且几乎一样灵巧。你看着她，起初带着疑问，但当她开始用左脚在你的肉棒上上下摩擦时，疑问变成了困惑的喜悦。你的妻子将右腿移到你身下，脚趾卷曲着与左脚交织在一起。[pg]");
            outputText("她的双脚锁在一起，包裹住你敏感的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "的大部分并沿着它滑动，你娇小的妻子开始给你带来一生难忘的足交。尴尬的姿势和强烈的欲望让你们俩都出了一身汗，没过多久，她滑溜溜的脚就润滑得足以让她加快节奏了。你在她的脚底摩擦着，深情地凝视着她的眼睛，她抚摸着自己的阴蒂，给了你一个变态的眨眼。塔玛尼惊呼道，[saystart]哦，我能感觉到你在我的脚趾下抽动！塔玛尼的小脚在她的");
            if(get_player().get_tallness() > 60)
            {
               outputText("大");
            }
            outputText(get_player().mf("强壮男人的","性感爱人的") + "" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "上感觉好吗？[sayend][pg]");
            outputText("你向她保证它们确实很喜欢她正在做的事——非常喜欢——并且");
            if(get_player().cor < 33)
            {
               outputText("乞求");
            }
            else if(get_player().cor < 66)
            {
               outputText("要求");
            }
            else
            {
               outputText("命令");
            }
            outputText("她不要停下来。塔玛尼开始咯咯笑，但当她的手指滑过她那清晰可见的阴蒂时，笑声变成了一声呻吟。她喘息着，[say:快点为了塔玛尼射出来吧，宝贝，我想感觉你把精液泵进我体内！][pg]");
            outputText("你顺从到了最后，听从了你娇小女主人的命令，达到了高潮。你大声喘息着，在她的双脚间抽搐，精液慢慢从你体内涌出。塔玛尼着迷地看着你的尿道膨胀，甚至挪动了双脚的位置，为你的精液腾出空间。白色的粘液从你的尿道喷射而出，通过管子泵入你妻子等待着的阴道。她尖叫着，管子下方滴落着清澈的液体，她竟然从被受孕的感觉中获得了快感。");
            if(get_player().cumQ() > 250)
            {
               outputText("没过多久，你就把她填满了，白色的精液与从地精小穴里滴落的透明淫液混合在一起。");
            }
            if(get_player().cumQ() > 700)
            {
               outputText("又射了几发后，她的肚子明显胀了起来，塔玛尼把手从她的小穴上移开，抚摸着她腹部慢慢变圆的隆起。");
            }
            if(get_player().cumQ() > 1500)
            {
               outputText("你还在不断地射精，迫使精液从管子周围喷射出来，在地上积成一滩");
               if(get_player().cumQ() > 3000)
               {
                  outputText("，等你射完的时候，你们俩都躺在了一滩浓稠的精液里");
               }
               outputText("。");
            }
            if(_loc3_ > 1)
            {
               if(_loc3_ == 2)
               {
                  outputText("你另一根" + get_player().cockDescript(1));
               }
               else
               {
                  outputText("你其他的每根[cocks]");
               }
               outputText("都到处喷洒着高潮的汁液，把周围弄得一团糟，但你们俩似乎都不介意。");
            }
            outputText("[pg]");
            outputText("塔玛尼微笑着拔出管子站了起来。白色的精液和清澈的爱液顺着她的大腿流下，你的女主人高兴极了。她把你那还在滴着精液的[cock]上的装置剥下来，亲昵地拍了拍它，说道：[say:你真是个好丈夫。我等不及想看看你和你的新女儿们相处得怎么样了！][pg]");
            outputText("听到她的赞美，你心中涌起一阵自豪。你站起身，给了妻子一个长长的法式湿吻，然后才动身返回营地。在回去的路上，你的头脑慢慢清醒过来，你开始纳闷刚才到底是怎么回事？！");
            tamaniKnockUp();
            get_player().orgasm("Dick");
            dynStats(DynStat.Inte(-0.5),DynStat.Sens(-1));
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function execEncounter() : void
      {
         if(get_player().totalCocks() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,57) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) >= 24)
         {
            tamaniDaughtersScene.encounterTamanisDaughters();
         }
         else
         {
            encounterTamani();
         }
      }
      
      public function encounterTamani() : void
      {
         if(get_player().totalCocks() <= 0)
         {
            tamaniFemaleEncounter();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1203) == 0)
         {
            tamaniMaleFirstEncounter();
         }
         else
         {
            switch(pregnancy.get_event())
            {
               case 2:
                  tamaniPregnantEncounter();
                  break;
               case 3:
                  tamaniPoopsOutBabies();
                  break;
               default:
                  tamaniMaleRepeatEncounter();
            }
         }
      }
      
      public function encounterName() : String
      {
         return "tamani";
      }
      
      public function encounterChance() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,580) == 0 && get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2275) == 0 && (get_player().totalCocks() > 0 || !get_player().hasKeyItem("Deluxe Dildo")))
         {
            return 1;
         }
         return 0;
      }
      
      public function declineZeFacesits() : void
      {
         clearOutput();
         outputText("你告诉她你不感兴趣。");
         outputText("[pg]这个曲线优美的地精咆哮着踢了你一脚，让你本能地抓住一条[leg]，用另一条腿单脚跳着——直到她也踢了那条腿，把你击倒。[say: 好吧，婊子。随你的便。但如果我发现你再抢<b>我的</b>鸡巴，你就有麻烦了！] 她没等你插话就跑开了，留下你一个人。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function acceptTamaniFacesits() : void
      {
         clearOutput();
         get_images().showImage("tamani-fuck");
         outputText("你再次打量着地精宽阔的臀部，然后点了点头，期待着这个主意。");
         outputText("[pg]塔玛尼小恶魔般的坏笑绽放成一个大大的笑容，小地精轻轻推了你一下。[say: 那就躺下吧！] 她对你说。你决定顺从，伸手去拿你的[armor]——但她拦住了你的手。[say: 没必要脱衣服，荡妇。躺下就行，] 她说着，又推了你一下。你耸耸肩，顺从了她的要求，在地上找了个舒服的地方躺下，然后看着她。");
         outputText("[pg]她从披在身上的布条上扯下一个小瓶，拔掉塞子；她把小瓶里紫色的液体倒在一只手上，看都不看你一眼，然后把它们涂满她的阴部。当地精的手指挖进去时，她发出一声充满情欲的呻吟，膝盖颤抖着自慰，当你看着她高潮时，你的双腿之间开始积聚热量。正当你的手准备向下移动，给自己来点小小的自我安慰时，塔玛尼开始向你走来，她肿胀的绿色阴部滴着她的汁液，而不是她刚刚涂满的液体。");
         outputText("[pg][say: 一点小保险。] 塔玛尼解释道。[say: 我知道</i>你<i>会喜欢让我高潮的，荡妇。我想确保我也能同样享受，] 她把一条腿跨过你的头，放在你脖子的两侧——然后慢慢坐下。[say: 我们开始吧~] 她用唱歌般的语调轻声说道。");
         outputText("[pg]你的视野已经被她巨大的绿色屁股占据了，当她蹲下来时，她那厚实的臀瓣还在晃动——她的淫液滴满了你的嘴，这个绿色的小婊子用这些液体来对准位置。随着她的屁股一下子完全落下，她的臀部径直压在你的[face]上，一阵气流突然涌来，她的阴唇以一种变态而湿润的“亲吻”方式紧紧压在你的嘴上。");
         outputText("[pg]你的鼻子最终卡在她的屁股瓣之间，你每一次呼吸都染上了地精屁股的气味，她多汁的臀部挡住了你大部分的视线，你能看到的大部分光线都来自它们之间的缝隙。[say: 舔我，婊子！] 她大喊着，左右扭动臀部，在这个过程中用她湿润的阴部摩擦你。");
         outputText("[pg]你试图呼吸——但发现很困难，你大部分的呼吸都被丰满的地精屁股挡住了，所以你伸出手，拨开柔软的屁股瓣，在呼吸时伸出舌头。你的舌头在地精的阴户上上下滑动，享受着她汁液那种奇怪的、略带奶油味的味道，她发出一声短促的呻吟。[say: 拜托，你可以做得更好！] 她抓住你的手，然后弹跳起来，让她的阴户重重地砸回你的舌头上——你的舌头滑进了她的外阴唇之间。");
         outputText("[pg][say: 操，太爽了！]她大叫着，在你的[face]上弹跳，用50磅重、滴着淫液的地精小穴和屁股把你捂得喘不过气来。你的舌头在她的蜜壶里进进出出，只要够得着，你就尽力去关照她的肉壁和阴唇，从这个淫荡的婊子身上吸出越来越多的淫液。[say: 对，操，操，继续舔！]你考虑伸出手抓住她的屁股，把她<i>按</i>在你的[face]上，但她不停的弹跳让你移动双手的努力起不到太大作用。");
         outputText("[pg]相反，她自己停了下来，转而把她的小穴在你身上摩擦，她湿透的阴部来回蹭着，把淫液涂满你的嘴，把你的[face]当成某种活体性玩具，然后停下来，把小穴对准你的嘴。[say: 把你的舌头伸进去！]她戏谑地命令你，身子前倾，让你从那厚实的绿色屁股蛋中稍微恢复了一点视野。");
         outputText("[pg]当地精终于安分下来，让你能真正试着让她高潮时，你拼尽全力才没发出一声沮丧的“终于”，而是成功地将舌头深深滑入她的肉褶之间。你舔舐着她的肉洞内部，发出几声压抑的呻吟和叹息，因为你自己的小穴也在下面滴着水，而她的淫液则不断流出作为回报。这个淫荡的地精自己也不断揉搓着乳房呻吟着来“帮忙”，而你则继续舔舐着她的体内。");
         outputText("[pg]你灵机一动，一只手滑到她前面，另一只手伸向她的大屁股——从两个角度同时攻击她，同时你的舌头在她的体内卷曲，舌尖抵住她的肉壁，一圈又一圈地打转。你的右手伸出去抓住地精肿胀的阴蒂，迫使她那淫荡的嘴唇发出一声尖锐的欢愉叫声，而你的左手则将两根手指滑入屁股蛋之间，刺入她的屁眼。");
         outputText("[pg][say: 哦——哦，操！]她大叫着，屁股蛋夹紧了你的手——但你可不吃这一套。你捏住她的阴蒂轻轻一拧，让她的臀部向前猛挺，双腿试图在身前并拢——然后迅速用手指抽插她的屁眼，用突如其来的刺激阻止了她的动作。你来回地取悦她，一直舔着她湿漉漉的小穴，而她在你身上猛烈挺动，在欢愉中大声叫喊。");
         outputText("[pg][say: 操——操，操，是——是——是——啊啊啊！]她尖叫着，捏着并扭动着自己的乳头。她的臀部扭动着，使得她的阴唇以一个奇怪的角度贴在你的嘴和探索的舌头上——你设法让舌头滑进去，摩擦着她体内一个感觉很奇怪的小点。瞬间，当你舔到她绿色小穴里那个肯定是敏感点的地方时，她全身都僵住了，你利用这个优势，用舌头猛烈地攻击它。");
         outputText("[pg]她那扭动的臀部和肥硕的屁股停止了动作，取而代之的是全身的颤抖，因为你在做这一切的同时，还用手指插她的屁股，并玩弄她的阴蒂，她试图再次说话。[say: 操——操——操……操——……操——操——操——操……]她所能做的就是发出高亢的、半尖叫的“操操操”声，就像她试图一遍又一遍地骂人却屡屡失败一样，然后你又捏了一次她的阴蒂。");
         outputText("[pg][say: 操操操操操操操操操操操操操操操！]这个绿色的荡妇大叫起来，她的大腿像老虎钳一样夹住你的头两侧。她的屁股紧紧夹住你入侵的手指，把它们固定在原位，她的小穴像活物一样在你的舌头周围起伏，随着这个小荡妇<b>猛烈</b>地高潮，越来越多的淫液喷涌而出，然后她就……瘫软了。");
         dynStats(DynStat.Lust(20 + get_player().lib / 20));
         if(saveContent.timesRidden + 1 < 3)
         {
            _temp_1.timesRidden += 1;
            outputText("[pg]你把手指从她的屁股里抽出来，松开她的阴蒂，这个绿色的小性爱娃娃倒了下去，摔在泥土里，语无伦次地嘟囔着什么。你坐起来看着，欣赏着她肥硕的绿色屁股翘在半空中，淫液还在顺着她的大腿往下滴的景象，决定离开这个显然已经失去意识的地精。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]然而，当你试图从精疲力尽的地精身下抽身时，你突然感觉到两只小手紧紧抓住了你的大腿。你很惊讶她还有力气做任何事，但当你试图转头想看清楚她时，塔玛尼用力把她的臀部压了回来，让你完全无法动弹。");
            outputText("[pg][say: 哦不，我们还没完呢，]她喘着气说道。你不太确定她打算做什么，而且你大概能很轻松地把她推开，但她那风骚的语调确实让你产生了兴趣……");
            menu();
            addNextButton("继续",tamaniFacesitContinue).hint("让塔玛尼对你为所欲为。");
            addNextButton("推开",tamaniFacesitPush).hint("她现在太虚弱了，留不住你。");
         }
      }
   }
}

