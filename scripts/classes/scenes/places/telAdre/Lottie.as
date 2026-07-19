package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.SettingsNPC;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class Lottie extends TelAdreAbstractContent
   {
      
      public function Lottie()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function waitAndShowLottieYourPoolBoner() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你觉得让[eachcock]飞一会儿也没什么坏处，所以你决定顺其自然，甚至向后靠，以突出那坚硬的长度。没过多久，洛蒂就注意到了，当她观察你的");
         if(get_player().biggestCockArea() >= 15)
         {
            outputText("骄傲与喜悦");
         }
         else if(get_player().biggestCockArea() < 5)
         {
            outputText("秘密的耻辱");
         }
         else
         {
            outputText("痛苦的普通阴茎");
         }
         outputText("。你几乎从现在极其尴尬的沉默中感到一丝后悔，但当你感觉到一只柔软的手抓住你悸动的阴茎时，这种感觉就被抛到九霄云外了。抬起头，洛蒂的脸已经红透了，但她的好奇心战胜了她的羞耻感，她开始慢慢地按摩你，直到你完全勃起。[say:我……是我弄的？]她问道，用睁大的、充满疑惑的眼睛看着你。你咧嘴笑着点点头，握住她的手，帮她进一步抚弄，结果却被她在手腕上拍了一下，她松开了手。你抬起头，皱着眉头，洛蒂却对这种情况笑了起来。[say:我——很高兴知道有人喜欢我。]她结结巴巴地说，羞怯地笑着。[say:但是，嗯，我们是来锻炼的，" + get_player().mf("大个子","宝贝") + "。我们应该锻炼。]你对这突如其来的扫兴感到不满，但你也没法反驳。她拉着你的手，带你走进水里，但在那之前，你调皮地抓了一把她那柔软的屁股。[pg]");
         outputText("过了一会儿，你们俩都在游泳池里游完了几圈，因为你们的进展而筋疲力尽。洛蒂在你们分道扬镳之前给了你一个大大的微笑，让你对刚才的经历仍然有些兴奋。");
         outputText(get_player().modTone(100,2));
         dynStats(DynStat.Lust(80));
         lottieTone(2);
         lottieMorale(2);
         get_player().changeFatigue(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function trainWithLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对她可怜的尝试轻笑一声，拿起她旁边的一个小杠铃，这让洛蒂和旁边观看的其他成员都大吃一惊。她对你笑了笑，尽力去举，尽管她并不擅长。你一口气做了好几次，直到自己累了，而洛蒂为了打破你的记录，还在继续。最终，她举的次数接近你的成绩，然后疲惫地把杠铃扔到了地上。[pg]");
         outputText("在又尝试了几次举重之后，你们都觉得已经练够了，于是分道扬镳，在离开健身房时挥手告别。");
         dynStats(DynStat.Str(0.1));
         lottieMorale(2);
         lottieTone(2);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function trainWithFitLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对她的努力微笑，并拉起一个适合你水平的杠铃。你们互相看了一眼对方杠铃的大小，对这明显的差异轻笑起来。你们一致决定举行一场比赛，看谁一次能做最多次数，尽管显然较大的杠铃处于更大的劣势。你尝试着一口气做了好几次，直到自己累了，而洛蒂为了打破你的记录，还在继续。最终，她举的次数接近你的成绩，然后疲惫地把杠铃扔到了地上。[pg]");
         outputText("在又尝试了几次举重之后，你们都觉得已经练够了，于是分道扬镳，在离开健身房时挥手告别。");
         dynStats(DynStat.Str(0.1));
         lottieMorale(2);
         lottieTone(2);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function togetherLottieYoga() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你拿着垫子，走向那个面带微笑的猪女孩，在她旁边坐下，开始做伸展运动。洛蒂平躺在她柔软的肚子上，从后面拉起双腿，伸展背部，沉甸甸的乳房在汗湿的衣服下被挤压得凸显出来。她的眼睛紧紧盯着教室中间的教练，你趁机凝视着她泛红的身体，目光从她线条分明的背部扫过她丰满的臀部和红润的大腿。意识到你一直坐得很尴尬，你伸展双臂，仰面躺下，和班上其他人一起模仿瑜伽教练的姿势。直到你转过头看洛蒂，你才尴尬地发现她正盯着你的胯部——你那谨慎的凝视让你憋出了一个即将爆发的高潮。当洛蒂继续盯着你紧绷的勃起时，你紧张地笑了起来");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，而你则暗自庆幸自己在教室的最后面。[say:那……那是因为我吗？]洛蒂低声问道，毫不避讳地直接指着你的[cocks]。你点点头作为回应，洛蒂对你对她身体的兴奋反应咯咯地笑了起来。她调皮地拍了拍你僵硬的肉棒，然后继续做伸展运动。你呻吟了一声，换了一个更轻松、不那么暴露的姿势。[pg]");
         outputText("过了一会儿，课程结束了，当你走出健身房时，洛蒂继续戏弄你。你在心里暗暗记下，以后一定要报复她，但现在你已经筋疲力尽了。");
         lottieMorale(4);
         lottieTone(1);
         get_player().changeFatigue(5);
         dynStats(DynStat.Lust(80));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tentaDickLottieButtFuckbuttFuckButtFUCKBUTTFUCKBUTTFUCK() : void
      {
         clearOutput();
         get_images().showImage("lottie-fuck-her-with-tentacle-dick");
         var _loc1_:int = -1;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         var _loc8_:int = -1;
         var _loc9_:int = -1;
         var _loc10_:int = -1;
         var _loc11_:int = 0;
         while(_loc11_ < get_player().cockTotal())
         {
            if(get_player().cocks[_loc11_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               if(_loc1_ == -1)
               {
                  _loc1_ = _loc11_;
               }
               else if(_loc2_ == -1)
               {
                  _loc2_ = _loc11_;
               }
               else if(_loc3_ == -1)
               {
                  _loc3_ = _loc11_;
               }
               else if(_loc4_ == -1)
               {
                  _loc4_ = _loc11_;
               }
               else if(_loc5_ == -1)
               {
                  _loc5_ = _loc11_;
               }
               else if(_loc6_ == -1)
               {
                  _loc6_ = _loc11_;
               }
               else if(_loc7_ == -1)
               {
                  _loc7_ = _loc11_;
               }
               else if(_loc8_ == -1)
               {
                  _loc8_ = _loc11_;
               }
               else if(_loc9_ == -1)
               {
                  _loc9_ = _loc11_;
               }
               else if(_loc10_ == -1)
               {
                  _loc10_ = _loc11_;
               }
            }
            _loc11_++;
         }
         outputText("没过多久，你就把洛蒂带到了健身房后面的棚屋里。由于健身房平时人来人往，这里的器材似乎大部分都被搬走了，只剩下空荡荡的架子，以及铺满备用健身垫的宽大水泥地。[pg]");
         outputText("猪娘在你一进房间就主动出击，脱光衣服，把她那肉乎乎的屁股坐在你面前的一堆垫子上。[say: 我们在这里要做什么，宝贝？]她问道，翻身趴在她柔软的肚子上打滚，用各种旧的薄床垫把自己盖起来。[say: 嘿，我是个裹在毯子里的猪猪，]她哼唧着，完全没注意到你正慢慢向她走去，你的手正紧紧地抚摸着你的[cocks]。你心想，游戏的时间结束了，是时候向你这好奇的粉色荡妇释放你那无数蠕动的藤蔓野兽了。[pg]");
         outputText("脱下你的[armor]，你让你的" + get_player().multiCockDescriptLight() + "自然垂下，一根藤蔓伸出，拍打在洛蒂的屁股上，提醒你为什么会在这里。她尖叫起来，被困在床垫堆下，对她现在的处境无能为力。[say: 嘿，呃，我好像遇到了一点小麻烦，" + get_player().mf("大个子","亲爱的") + "——你能帮我一把吗？]洛蒂轻笑着，扭动着身体试图从床垫堆里挣脱出来，但不可避免地失败了。你走近她，移开几块床垫，解放了她的四肢。当你掀起最后一块床垫时，她歉意地笑了笑，刚从垫子堆里爬出来，却又尖叫了一声——你把最小但也最重的一块垫子压在了她的背上，让她无法再动弹，脸被埋在下面的床垫里，丰满的屁股直直地撅在半空中。这个尴尬的姿势限制了她除了前臂和脖子以外的任何活动，背上的大部分重量将她的胸部压向膝盖，让她无法伸展。洛蒂把头转向一边，给自己时间呼吸并评估情况。她注意到你一丝不挂，目光被吸引到她面前的[cocks]上。");
         if(lottieMorale() <= 30)
         {
            outputText("她幽怨地瞪了你一眼，然后重新低下头埋进床垫里，显然已经认命了");
         }
         else
         {
            outputText("她挑了挑眉，但没有继续追问");
         }
         outputText("。[pg]");
         outputText("你抓住你" + get_player().cockDescript(_loc1_) + "的根部，它向前伸展，轻轻抚摸着洛蒂的脸庞，然后探索她身体的其他部位，漫不经心地抚摸着她臀部光滑的曲线，或是擦过她变硬的乳头。这只猪娘在轻柔的抚摸下发出微弱的呻吟，而她柔软肌肤的触感也让你那逐渐变硬的肉棒兴奋不已，提醒着你真正的意图。你走到她身后，避开洛蒂的余光，蹲下来欣赏她那完美圆润、恰好翘在空中的屁股。" + get_player().SMultiCockDesc() + "焦躁地抽动着，渴望耕耘困在你面前的这个胖乎乎的荡妇——而你也不打算让它失望。[pg]");
         outputText("你紧紧握住你的");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
         {
            outputText("第一根");
         }
         outputText("扭动的肉棒，它向前伸展，像蛇一样蜿蜒向洛蒂的下体，试探着她湿润的阴唇。你那藤蔓般的肉棒顶端沿着她渴望的小穴垂直蠕动，在她变硬的阴蒂上震动，让这个流汗的猪婊子舒服地发出猪叫声。她挣扎着想把手臂伸向她那渴望的部位，拼命想从抵在她湿滑小穴上的那根粗壮、伸展的蛇形肉棒中解脱出来。没有任何警告，这根坚硬的触手将其光滑的侧面紧紧压在她的入口处，然后向后一抽，猛地插入她火热的小穴。[pg]");
         outputText("当你那粗壮如蛇般的阴茎在她体内跳动，被她紧致的子宫壁紧紧包裹时，洛蒂发出了愉悦的呻吟。你强迫那兽性的长物向外卷曲，然后以惊人的力量抽插回去——狂热地耕耘着你的女孩，而那贪得无厌的藤蔓则将她的脸压在浸满她口水的床垫上。[pg]");
         if(_loc2_ >= 0)
         {
            outputText("看到你还有多余的家伙没用上，而她也还有空着的洞，你迅速解决了这个棘手的问题；引导着你的" + get_player().cockDescript(_loc2_) + "靠近她湿润的后庭，你将那树状巨兽的顶端压在她丰满的臀部上，简直是用你的阴茎植物刺穿她的肉体。这个肛交荡妇似乎并不在意：如果说有什么不同的话，那就是她扭动得更厉害了，肉眼可见地兴奋起来。她的屁股似乎在自行扩张，为即将到来的后庭蹂躏做准备。你很欢迎洛蒂为了满足你的肛交需求所做的努力，只需一次挺进，你就推入了");
            if(get_player().cockArea(_loc2_) <= 80)
            {
               outputText("你整个" + get_player().cockDescript(_loc2_));
            }
            else
            {
               outputText("你尽可能多的" + get_player().cockDescript(_loc2_));
            }
            outputText("，当你的巨物为自己腾出空间时，撕裂了她的内脏。猪女孩尖叫起来，强烈而粗暴的摩擦对她敏感的肛门感受器来说太过刺激了。你继续推进，确保她的结肠完全被藤蔓状的阴茎塞满。你在那里停了一会儿，任由洛蒂疯狂地挣扎，徒劳地试图适应填满她体内的野兽。感觉很好，但你很快失去了耐心，开始将你那橡胶般的肉棒在她的后庭里抽插，用你自己的先列腺液涂抹她的肛门入口，让接下来的抽插变得更容易、更快。你操着这个猪女孩的屁股，直到她的肛门壁因为这粗暴的侵犯而感到麻木，然后你又多操了她一会儿。[pg]");
            if(_loc3_ >= 0)
            {
               outputText("她不断的呻吟和尖叫提醒着你，她至少还有一个洞没有被利用。当她看到你的" + get_player().cockDescript(_loc3_) + "无情地向她等待的嘴巴移动时，她敬畏地睁大了眼睛，嘴唇张成一个大大的O型，仿佛在迎接你的触手肉棒。你一言不发，将你的野兽插入她的嘴里，把你的肉棒埋进去，直到她快要窒息。幸运的是，她习惯了口交，你毫不费力地将相当长的一段塞进她的喉咙。你可以看到她的脖子因为这淫秽的侵入而鼓起，你的" + get_player().cockDescript(_loc3_) + "的顶端膨胀，直到她的气管看起来快要爆炸了。她什么也说不出来，但她盯着你看的眼神比任何语言都能告诉你她的感受。");
               if(lottieMorale() < 40)
               {
                  outputText("这个母猪荡妇真的喜欢被这样使用！");
               }
               else
               {
                  outputText("你的猪情人真的很喜欢你对她做的事！");
               }
               outputText("一堆紧致的操洞，每一个都以自己的方式照顾着你的触手肉棒，各不相同，但都如此美妙！一个发情的女孩乞求着在她的每一个洞里都被肉棒猛插……你几乎为把她当成一个坏掉的性玩具而感到内疚，但她显然是自找的。当你野蛮地对她进行三重插入时，她不断地向各个方向扭动，她无声的愉悦呻吟被塞在她嘴里的野兽所掩盖。[pg]");
               if(_loc4_ >= 0)
               {
                  outputText("她的阴户肯定还有空间容纳更多的肉棒吧？在你想到这一点之前，你空闲的触手肉棒已经蠕动着向小猪的爱之隧道进发，试图在它的同伴无情地猛插她的操洞时挤进去。当你把你的" + get_player().cockDescript(_loc4_) + "的顶端压在她的阴唇之间时，你感觉到她的整个身体都在收紧，随着你不断向前推，把它们撑得超出了正常的容量。如果她的嘴里没有塞满肉棒，你肯定她会像发情的鹰身女妖一样尖叫。一旦顶端成功穿过她紧致的阴道口，剩下的部分就很容易跟进了，你毫不费力地将你的肉棒滑入她现在大张的阴户。你同步你的肉棒向她的阴户插入，用你的生殖器在她的体内猛干，简直是在蹂躏她的小穴。[pg]");
                  if(_loc5_ >= 0)
                  {
                     outputText("既然她那湿漉漉的小穴还能吃下更多肉棒，为什么不试试她的后面呢？你的" + get_player().cockDescript(_loc5_) + "欢快地扭动着，缠绕在洛蒂丰满的臀部上，准备测试她的后庭容量。幸运的是，它橡胶般的质地让它在摩擦你的" + get_player().cockDescript(_loc2_) + "时能够被压缩，滑向猪娘湿润的肛门。你那植物般的肉棒在她的入口处弹回了无数次，但你知道每一次尝试都在把她撑得更开。你不知道你用" + get_player().cockDescript(_loc5_) + "勃起的顶端戳了她的菊门多少次，你也无法想象这种挑逗性的刺激对这个被你触手拥抱的可怜囚徒来说是什么感觉。最后，伴随着一次粗暴的挺进，你灵活的肉棒不知怎么地为额外的后庭插入开辟出了一条路。你那两根勃起的肉棒不可思议地挤压着她紧致的肠壁，她的身体几乎要被从四面八方同时刺入的肉棒撕成两半。但这并不能阻止你在她的肠道里非常小心地前后抽插，而且绝不完全拔出。[pg]");
                     if(_loc6_ >= 0)
                     {
                        outputText("无论你多么努力，你都无法在玩具般的身体里塞进更多的肉棒了。你的" + get_player().cockDescript(_loc6_) + "正因沮丧而颤抖，直到你注意到当你无情地捣弄她的每一个洞时，她胸前那两团肉球在不断地上下跳动。这或许是个享受乳交的好机会：你的" + get_player().cockDescript(_loc6_) + "缓慢地沿着她汗津津的身体滑行，滑入她那巨大的肉垫之间；虽然这种感觉不像从捣弄她屁股的肉棒那里传来的尖锐快感那样火辣和惊人的粗暴，但你的肉棒正被她柔软的肉体微妙地挑逗和戏弄着。由于彻底的多重插入，你已经兴奋起来，开始在她整个躯干上滴下先列腺液，用你的汁液涂抹她的全身。这让她的乳房变得更加光滑湿润，不用说，你的" + get_player().cockDescript(_loc6_) + "也感受到了这种感觉；它似乎变得更大了，并呈现出粉红色，这突然的颜色变化暴露了它的兴奋。你继续操弄她的乳房，直到它们被你洒在上面的汁液弄得闪闪发光。[pg]");
                        if(_loc7_ >= 0)
                        {
                           outputText("当你漫不经心地用你所有的家伙在洛蒂的身体里抽插时，你在脑海中盘算着她的身体还能被怎么使用，因为你还剩下一些触手肉棒。嘴巴、小穴、屁股、奶子……等等！她的手还空着！从它们痉挛般抽搐的样子，你可以清楚地看出它们渴望着能握住一些肉棒。你宽宏大量地满足了她对肉棒的需求，把你的" + get_player().cockDescript(_loc7_) + "塞进她的手掌，在上面涂满你的先列腺液。她本能地紧紧抓住你的肉棒，仿佛她的生命都依赖于此，并开始为你打飞机，凶猛地摩擦着你的肉棒，用她的汗水和你的先列腺液的混合物作为润滑剂。");
                           if(_loc8_ >= 0)
                           {
                              outputText("看到你的家伙对她产生的影响，你把你的" + get_player().cockDescript(_loc8_) + "移到她剩下的那只手上，她也同样握住了它。");
                           }
                           outputText("她继续强迫性地抚摸着你，她的双手显然是在她强烈的性欲驱使下行动的。");
                           outputText("[pg]");
                           if(_loc9_ >= 0)
                           {
                              outputText("由于还有一根肉棒没有得到满足，你把你那粗壮的触手肉棒贴在洛蒂屁股柔软的肉上，来回抽插，她那丰满肉体的触感让你发狂。[pg]");
                           }
                        }
                     }
                  }
               }
            }
         }
         outputText("你继续把你的家伙塞进面前这个坏掉的荡妇体内，她汗津津的曲线随着你猛烈抽插的力量而晃动。洛蒂在极度的兴奋中扭动翻滚，无法承受你在她体内的感觉。没过多久，这个绝望的猪娘浑身发抖，瘫倒在沉重的垫子上，伸展着身体，在深沉的高潮中抽搐着，而你则继续以强烈的动作在她体内抽插。你向后伸展身体，一边向前走一边将自己更深地刺入，洛蒂翻着白眼，舌头无力地挂在嘴外，无法控制你弥漫在她内心的狂野感觉。不可避免地，你加快了抽插的速度，开始感觉到自己正朝着更强烈的高潮迈进。你的肉棒变粗了，挤压着洛蒂的肉壁，导致你深深的抽插把洛蒂推向了房间的另一边。片刻之后，你的触手肉棒在高潮中爆发，将你白色的浓稠精液泵入这个猪排荡妇的体内，精液珠汇聚在下面的垫子上。[pg]");
         if(get_player().cumQ() >= 1500)
         {
            outputText("从你体内喷涌而出的温暖精液继续积聚，开始用你浓稠液体的气味堵塞洛蒂的孔口。你射精的无情推进似乎没有停止的迹象，而猪娘则在她的内脏被你的精液翻搅时恢复了意识。她绝望地尖叫着，对突然感到的饱胀感感到不知所措，而她的肚子开始因你的精液而膨胀。洛蒂白费力气地试图挤出充满她体内的精液流，收紧她柔软的腹部试图将其推出，同时又在你仍在她体内的肉棒的压力下屈服。伴随着最后一次爆发，你的精液在她体内掀起最后一波狂潮，将她再次击晕，抽出的同时将滚烫的精液喷射在她的背部和丰满的屁股上。你的精液源源不断地流出，最终让洛蒂恢复了原来的体重。[pg]");
         }
         else
         {
            outputText("你筋疲力尽地站着，因高潮的余韵而微微颤抖，而你那树木般的家伙也放慢了动作。收回你的" + get_player().cockDescript(_loc1_) + "，你慢慢地换回你的[armor]，而洛蒂也醒了过来。她迷迷糊糊地睁开眼睛，空气中弥漫着滚烫精液的味道，她撑起身子，回想起导致她现在所处境地的一系列事件。[say: 呃-啊？[name]……]女孩喃喃自语，挣扎着想要离开，却发现自己仍然被压在沉重的小垫子下面。[say: 嘿-嘿！我还被卡着呢！][pg]");
         }
         if(lottieMorale() >= 99)
         {
            outputText("你看着你的爱人试图四处移动，忍不住笑了起来，然后移开重物，把洛蒂扶起来。她轻轻地按摩着她那柔软的乳房，在整个过程中她一直压在上面。你问她是否想再来一回合，她的回应是鼓起脸颊，把你推倒在垫子上。你们一起走出棚屋，向附近经营小食品车的、一脸茫然的蜘蛛人挥手致意。");
            if(get_silly())
            {
               outputText("离开之前，你确保从店员那里拿了一杯培根奶昔，和她击掌后，后空翻回到了营地。");
            }
            outputText("[pg]");
         }
         else
         {
            outputText("你转过头，看着你的荡妇试图四处移动，然后哼了一声，走出棚屋，朝着你营地的方向走去。附近摊位上一个看起来很面熟的蜘蛛人注意到你独自一人在外面，正朝着棚屋的方向走去。不过，在她追上你之前，你早就走远了。");
            if(get_silly())
            {
               outputText("对蜘蛛人店员来说不幸的是，你在离开时洗劫了她车上的培根奶昔。你试图后空翻回营地，结果不小心把大部分奶昔掉在了地上，最终决定正常走回去——你紧紧握着最后一杯幸存的饮料。");
            }
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToPigSlut() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,306) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,306,2);
            outputText("看到你渴望交谈，她的耳朵竖了起来，但你能看出她情绪低落。你问她怎么了。[say: 这么明显吗？] 洛蒂低头看着桌子。[say: 你看，" + get_player().mf("大个子","宝贝") + "，自从我……你知道的，我实际上——我长胖了！] 她站了起来，胖乎乎的脸颊因为沮丧而鼓了起来。[say: 我的意思是，我、我也不是不喜欢，但是……这似乎和我想要的效果完全相反！] 她显然很烦躁，但你把手放在她的肩膀上。你是鼓励她，还是觉得这是她自己的错？");
            menu();
            addButton(0,"鼓励",firstOralReactionChooseEncourage);
            addButton(1,"辱骂",firstOralReactionChooseAbuse);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,307) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,307,2);
            outputText("看到你这么想聊天，她的耳朵竖了起来，似乎对某件事感到非常兴奋。你问她在想什么。[say:这么明显吗？]洛蒂抬头看着你，咧嘴笑了。[say:你看，" + get_player().mf("大个子","宝贝") + "，自从我们……你知道的，我其实——我瘦了！]她站起来，在空中挥舞着拳头，扭动着丰满的屁股。[say:我的意思是，我知道变化不大，但这仍然是个成果！这太棒了！]她显然对自己很满意。你把手放在她的肩膀上，她对你灿烂地笑着。你是鼓励她，还是告诉她坏消息？");
            menu();
            addButton(0,"鼓励",firstAnalReactionChooseEncourage);
            addButton(1,"辱骂",firstAnalReactionChooseAbuse);
         }
         else if(lottieMorale() <= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) - 5 > lottieTone())
         {
            outputText("你告诉她你想谈谈，但女孩只是畏缩地回应，躲避着你严厉的目光。这个紧张的母猪婊子从经验中知道，你大多数的“谈话”通常是如何结束的——以一只抽泣、悲惨的小猪收场。你用你能装出的最甜美的声音，问你最喜欢的女孩最近怎么样。洛蒂犹豫了一下才再次面对你——你知道她讨厌你用那种声音，而且她现在显然在隐瞒什么。你让她说出心里的想法。[say:嗯……你看……]洛蒂吱吱地叫着，手指笨拙地摸索着，鼓起勇气开口。[say:你看，[sir]，自从我们上次见、见面以来，我其实——我其实……]她嘟囔着说完了剩下的句子，但你要求她重复一遍。[say:……我长、长胖了。]女孩立刻退缩了，随时准备迎接你的强烈反应。没过多久，她慢慢抬起头，发现你正盯着她。你捏住她的下巴，女孩在你的触碰下呻吟起来。你是祝贺她，还是告诉她坏消息？");
            menu();
            addButton(0,"鼓励",lottieLowMoraleWeightGainEncourage);
            addButton(1,"辱骂",lottieLowMorealeWeightGainAbuse);
         }
         else if(lottieMorale() <= 70 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) - 5 > lottieTone())
         {
            outputText("看到你这么想聊天，她的耳朵竖了起来，但你能看出她情绪低落。你问她怎么了。[say:这么明显吗？]洛蒂低头看着桌子。[say:你看，" + get_player().mf("大个子","宝贝") + "，自从我们上次见面以来，我其实——我长胖了！]她站起来，胖乎乎的脸颊因沮丧而鼓了起来。[say:我的意思是，我、我不是生你的气或什么的，但是……我只是有点沮丧，仅此而已。]她显然不只是有点沮丧，但你把手放在她的肩膀上。你是鼓励她，还是觉得这是她自己的错？");
            menu();
            addButton(0,"鼓励",lottieMediumMoraleWeightGainEncourage);
            addButton(1,"辱骂",lottieMediumMorealeWeightGainAbuse);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) - 5 > lottieTone() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,297) == 1)
         {
            outputText("看到你这么想聊天，她的耳朵竖了起来，尽管她似乎被什么事情分散了注意力。你问她怎么了。[say:哦，宝贝，真的没什么……]洛蒂抬起头笑了笑，但你询问的目光得到了另一个回答。[say:该死，你看，" + get_player().mf("大个子","宝贝") + "，自从我们上次见面以来，我又长胖了一点……]她坐在椅子上，把脸埋在双臂之间，胖乎乎的脸颊因沮丧而鼓了起来。[say:我的意思是，我爱我的身体，我也爱你，但是……有时候这让我很难受，你知道吗？]她显然不只是有点沮丧，但你把手放在她的肩膀上，轻轻地揉了揉。你是鼓励她，还是觉得这是她自己的错？");
            menu();
            addButton(0,"鼓励",lottieHighMoraleWeightGainFATTYLOVESIT);
            addButton(1,"辱骂",lottieHighMoraleWeightGainFATTYLOVESABUSE);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) - 5 > lottieTone())
         {
            outputText("看到你这么想聊天，她的耳朵竖了起来，尽管她似乎被什么事情分散了注意力。你问她怎么了。[say:哦，宝贝，真的没什么……]洛蒂抬起头笑了笑，但你询问的目光得到了另一个回答。[say:该死，好吧，你看，" + get_player().mf("大个子","宝贝") + "，自从我们上次见面以来，我又长胖了！]她站起来，胖乎乎的脸颊因沮丧而鼓了起来。[say:我的意思是，我、我不是生你的气或什么的，但是……我只是有点沮丧，仅此而已。]她显然不只是有点沮丧，但你把手放在她的肩膀上。你是鼓励她，还是觉得这是她自己的错？");
            menu();
            addButton(0,"鼓励",lottieHighMoraleWeightGainEncourage);
            addButton(1,"辱骂",lottieHighMoraleWeightGainAbuse);
         }
         else if(lottieMorale() <= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) < lottieTone() - 5)
         {
            outputText("你告诉她你想谈谈，但女孩只是畏缩地回应，躲避着你严厉的目光。这个紧张的母猪婊子从经验中知道，你大多数的“谈话”通常是如何结束的——以一只抽泣、悲惨的小猪收场。你用你能装出的最甜美的声音，问你最喜欢的女孩最近怎么样。洛蒂犹豫了一下才再次面对你——你知道她讨厌你用那种声音，但她似乎也对某件事隐约感到兴奋。你让她说出心里的想法。[say:嗯……你看……]洛蒂抬头看着你，勉强挤出一丝微笑。[say:你看，[sir]，自从我们上次见、见面以来，我其实——我瘦了！]她微小的表情变成了一个灿烂的笑容，但当她意识到自己做了什么时，笑容立刻消失了。[say:不，我——对不起，我没有……我又得意忘形了，我太蠢了，我——]你把手指放在她的嘴唇上打断了她。她在你的触碰下呻吟起来，尽管对你的意图发出尖叫。你是祝贺她，还是告诉她坏消息？");
            menu();
            addButton(0,"鼓励",lottieLowMoraleWeightLossEncourage);
            addButton(1,"辱骂",lottieLowMoraleWeightLossAbuse);
         }
         else if(lottieMorale() <= 70 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) < lottieTone() - 5)
         {
            outputText("看到你渴望交谈，她的耳朵竖了起来；她似乎对某事感到非常兴奋。你问她在想什么。[say: 这么明显吗？] 洛蒂抬头看着你，咧嘴笑了。[say: 你看宝贝，自从我们上次见面后，我实际上——我瘦了！] 她站了起来，在空中挥舞着拳头，扭动着丰满的屁股。[say: 我的意思是，我知道这变化不大，但这仍然是一个成果！这太棒了！] 她显然对自己很满意。你把手放在她的肩膀上，她对你灿烂地笑了。你是鼓励她，还是告诉她坏消息？[pg]");
            menu();
            addButton(0,"鼓励",lottieMediumMoraleWeightLossEncourage);
            addButton(1,"辱骂",lottieMediumMoraleWeightLossAbuse);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) < lottieTone() - 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,297) == 1)
         {
            outputText("看到你渴望交谈，她的耳朵竖了起来；她似乎在担心什么。你问她在想什么。[say: 哈哈，这么明显吗，宝贝？] 洛蒂抬头看着你，礼貌地笑了笑。[say: 你看宝贝，自从我们上次见面后，我实际上——我瘦了。] 她坐下，用手指卷着一缕头发。[say: 我的意思是，我喜欢我现在的身体，而且……而且我不想改变它，你知道吗？特别是如果这意味着会失去你。] 她显然很担心你的反应。你把手放在她的肩膀上，她叹了口气。你介意吗，还是决定告诉她坏消息？");
            menu();
            addButton(0,"鼓励",lottieHighMoraleWeightLossFATTYLOVESIT);
            addButton(1,"辱骂",lottieHighMoraleWeightLossFATTYLOVESABUSE);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) < lottieTone() - 5)
         {
            outputText("看到你渴望交谈，她的耳朵竖了起来；她似乎对某事感到非常兴奋。你问她在想什么。[say: 这么明显吗？] 洛蒂抬头看着你，咧嘴笑了。[say: 你看宝贝，自从我们上次见面后，我实际上——我瘦了！] 她站了起来，在空中挥舞着拳头，扭动着丰满的屁股。[say: 我的意思是，我知道这变化不大，但这仍然是一个成果！这太棒了！] 她显然对自己很满意。你把手放在她的肩膀上，她对你灿烂地笑了。你是鼓励她，还是告诉她坏消息？[pg]");
            menu();
            addButton(0,"鼓励",lottieHighMoraleWeightLossEncourage);
            addButton(1,"虐待",lottieHighMoraleWeightLossAbuse);
         }
         else if(lottieMorale() == 0 && lottieTone() == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,309) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,309,1);
            outputText("你告诉洛蒂你想和她谈谈，不过这女孩似乎也迫不及待地想解释她的心事。她看起来快要哭了，直到你问她到底在想什么，她才终于崩溃，抽泣起来。[say:我……*嗝*我真的很抱歉，[name]！我只是不知道哪里出了问题！]她哭喊着，把脸埋在双手里。咖啡馆里有几个人似乎朝你们这边看了一眼，但都默默地移开了视线，显然不想多管闲事。[say:我浪费了你的时间，我——我浪费了我的时间，而且……哦，天哪，求求你，求求你原谅我变成这样！]女孩抬头看着你，满是泪痕的脸上写满了极度的痛苦。你看了你的母猪一眼，然后平静地告诉她，你觉得再试下去也没什么意义了。事实上，你现在为什么还要待在这里？你还不如走人，反正她也不可能变得更糟了。[say:我什么都愿意做！]她绝望地脱口而出，在你试图离开时紧紧抱住你的手臂。[say:我……只要你想要，我什么都愿意做。]你对她的热情笑了笑。你想要的东西有很多。但是你想从她那里……得到什么呢？");
            menu();
            addButton(0,"操她",lottieFatLoserCulminationFuckChoice);
            addButton(1,"羞辱她",lottieFatLoserCulminationHumiliationChoice);
            if(get_silly())
            {
               addButton(2,"离开",lottieFatLoserCulminationLeaveComedyChoice);
            }
         }
         else if(lottieMorale() == 100 && lottieTone() == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,312) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,312,1);
            outputText("听到你渴望交谈，她的耳朵竖了起来，尽管她似乎被什么事情严重分心了——甚至可以说是担忧。你向她表达了你的关心，然后问她你是否能做些什么。[say:哦，亲爱的，这真的……我不知道。也许没什么。]洛蒂抬起头笑了笑，但她那遥远的目光似乎暗示着她的思绪正被比“没什么”大得多的事情占据着。你不接受这个答案，继续追问她。[say:我想什么都瞒不过你，对吧？]她皱起眉头——你可能踩到地雷了。不过，你还是担心有什么事情让她心烦意乱，所以你觉得刺激她一下可能是必要的。洛蒂沮丧地皱起脸，深吸了一口气，大声叹息。[say:[name]。我很感激你为我做的一切。]她开始说道。[say:事实上，我很感激你这么久了还在这里。即使在你的指导下，我也没有瘦下来。事实上，我知道我比以前胖得更多了。我只是……我觉得自己不再漂亮了。我做不到。不能像这样。]女孩用深邃的翠绿色眼睛盯着你，眼角开始泛起泪花。[say:我不知道该怎么办。我不想失去你——不想失去作为朋友的你，或者……更多。但我内心知道，我——我永远配不上像你这么棒的人。]你对她的坦白感到明显惊讶。你完全清楚她对你的感情——事实上；你确信现在咖啡馆里的每个人都知道了。不过，你仍然感到困惑。她……配不上你？你很清楚洛蒂一直对自己的外貌不太满意，但在你看来，她对自己身体的看法似乎取决于你的看法。你把她的手握在自己手里，看着洛蒂的眼睛，然后告诉她你的感受。[pg]");
            menu();
            addButton(0,"爱自己",lottieHighMoraleFatLoveSelfOneTimeEvent);
            addButton(1,"坚持下去",lottieHighMoraleFatYoullGetThereOneTimeEvent);
            if(get_silly())
            {
               addButton(2,"呃洛蒂不要",ewLottieNo);
            }
         }
         else if(lottieMorale() == 0 && lottieTone() == 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,315) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,315,1);
            outputText("你告诉洛蒂你想谈谈，但女孩似乎在烦躁不安——似乎有什么重要的事情占据了她的心思。她出了一身汗，紧张的情绪占据了上风，然后她决定吐露心声。[say:我不想让你离开我！]她哭喊着，声音大到足以引起几个咖啡馆顾客的注意，他们朝你们这边看过来，但又默默地忽略了这件显然不关他们事的事情。[say:我花了这么多时间……花了你这么多时间才变成这样，我-我以为一旦我看起来更好，事情就会变得更好，但是……！]女孩抬头看着你，沮丧得快要哭出来了。你告诉她你不太明白，这时她迅速把你从座位上拉起来，跑向瑜伽室。在里面，一个女孩独自坐在垫子上，漫无目的地伸展着双腿，当她看到你们俩时，害羞地挥了挥手。[say:[name]……这是艾尔。她……她是我的朋友。]你静静地站着，盯着面前这位古铜色肌肤的美女。她天生比洛蒂看起来更有运动感，体型更瘦，胸部更小——尽管她宽阔的臀部绝对不容小觑。然而，你更专注于盯着她最显眼的特征。这位古铜色皮肤的女孩长着四只手臂，每只手臂的末端都是覆盖着甲壳的手，给人一种戴着黑色短手套的错觉。两只蜘蛛般的手臂明显地从她的背部伸出来，尽管它们看起来装饰性大于实用性。她整洁的淡金发扎成一个侧马尾，衬托着她柔软的脸庞。她的眼睛两侧各有两个黑点，虽然你不确定它们是用来增强视力还是作为装饰的。[pg]");
            outputText("蜘蛛娘注意到了你好奇的目光，礼貌地笑了笑。你正纳闷她为什么不自我介绍，只见她用两只手迅速而熟练地在指间织出了一张小网，上面清晰地拼出了一句话。“你好！”上面写着。[say:艾尔是个哑巴，所以她用蜘蛛网来织句子。]洛蒂解释道。你暗自轻笑，明白了为什么这么有魅力的女孩能和胆小的猪娘交上朋友。在蜘蛛朋友的陪伴下，她似乎很放松，于是你决定问问她之前为什么那么沮丧。洛蒂抬头看了你一眼，又看了看艾尔，艾尔点点头站起身，向你们俩走来。[say:我……我以为你玩腻了就会抛弃我。]洛蒂慢慢脱下上衣，她那柔软的双乳从布料中弹了出来。[say:我想对你有点价值，所以……我在努力让自己变得有价值。]她脱下紧身短裤，而你转头看向蜘蛛娘，她那古铜色、苗条的身体已经一丝不挂了。她动作真快，你心想。[say:起……起初，艾尔不想这么做。她根本不认识你，而且……而且和别人分享我也会很奇怪。]这句话在你的脑海中回放。分享……洛蒂会很奇怪？这是怎么回事？[say:但……但最终我还是说服了她……因为她爱我，就像我爱你一样。]然后你恍然大悟。有人爱上了你的猪荡妇，而她利用了对方的感情，说服她来和你做爱。只是为了不让你离开她。[pg]");
            outputText("你还不如接纳你们团队的新成员。");
            menu();
            addButton(0,"三人行",lottieElleThreesomeFirstTime);
            addButton(1,"只要艾尔",fuckElleInsteadOfThatFatSlutFirstTime);
            if(get_silly())
            {
               addButton(2,"哦，我懂了！",charlottesWebComedyBullshit);
            }
         }
         else if(lottieMorale() == 100 && lottieTone() == 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,318) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,318,1);
            outputText("你告诉洛蒂你想谈谈，尽管这女孩似乎被其他事情分散了注意力。她抬头看着你，从她兴奋的颤抖和灿烂的笑容来看，这女孩似乎快要高兴得爆炸了。你咧嘴一笑，谨慎地问她是不是有什么心事。[say:哦，宝贝！]她大喊一声，从座位上跳起来，把你扑倒在地，在你的脸上印满了吻。咖啡馆里的一些人似乎朝你们这边看过来，对洛蒂令人尴尬的爆发轻笑出声。[say:刚认识你的时候，我给自己定了一个无形的目标，要在你在这里的时候实现。]她微笑着，跨坐在地上的你身上，而你则无奈地点头。[say:我今天早上刚称了体重，然后……然后我……]猪女孩抬头看着你，然后直接在你的嘴唇上亲了一下。你问是不是发生了什么好事，她爽朗地笑了起来。[say:哦，宝贝，发生了一件惊人的事！我已经超过了我的目标！太棒了，我只是……如果没有你，我永远也做不到。]你安慰她，只要有足够的时间，她会做到的，但你很高兴她有这种感觉。[say:事实上，]洛蒂狡黠地笑了笑，从你身上离开，而你则从地上爬起来。[say:我想好好感谢你。]洛蒂伸出手，托住[onecock]并轻轻挤压，唤醒了里面的野兽。[say:在瑜伽室等我，]她发出咕噜声，然后走出了咖啡馆。");
            menu();
            addButton(0,"瑜伽室",lottieSuccessOneShot);
            addButton(1,"离开",leaveLottieInsteadOfYogaSex);
         }
         else if(lottieMorale() <= 30)
         {
            outputText("你告诉她你想谈谈，但女孩只是畏缩地回应，躲避你严厉的目光。这个紧张的母猪婊子从经验中知道，你大多数的“谈话”通常是如何结束的——以一只抽泣、悲惨的小猪告终。你用你能装出的最甜美的声音问她，你最喜欢的女孩最近怎么样。洛蒂犹豫了一下才再次面对你——你知道她讨厌你用那种声音，但她似乎没有什么重要的事情要说。无论如何，你告诉她把心里的想法说出来。[say:嗯，你看……]洛蒂抬头看着你，勉强挤出一丝微笑。[say:你看，[sir]，自从我们上次见面以来，真的什么也没发生……]她似乎对缺乏消息感到抱歉，喋喋不休地说她今天会尽力而为。");
            outputText("[pg]没有太多线索，你真的无法评论她的进展。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(lottieMorale() <= 70)
         {
            outputText("看到你渴望交谈，她竖起了耳朵，尽管她似乎没有太多心事。无论如何，你问她最近怎么样。[say:哈哈，有点好奇，是吗？]洛蒂抬头看着你，咧嘴一笑。[say:嗯，恐怕自从我们上次见面以来真的什么也没发生，你知道吗？也许今天我们能取得一些成果！]她站起来，在空中挥舞着拳头，扭动着丰满的屁股。[say:如果你想……我们可以去做些瑜伽，呃……]她显然很焦躁。你对她的话轻笑出声，尽管你感觉到腹股沟里有一种熟悉的冲动。");
            dynStats(DynStat.Lust(2));
            outputText("没有太多线索，你真的无法评论她的进展。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(lottieMorale() <= 100000)
         {
            outputText("看到你渴望交谈，她竖起了耳朵，尽管她似乎没有太多心事。无论如何，你问她最近怎么样。[say:哈哈，你真的对我那么感兴趣吗，宝贝？]洛蒂抬头看着你，咧嘴一笑。[say:嗯，恐怕自从我们上次见面以来真的什么也没发生，你知道吗？我不介意，但是嘿——你得到你应得的！]她站起来，狡黠地咧嘴一笑，然后转过身，对着你扭动着丰满的屁股。[say:如果你想……我们可以去做些瑜伽，呃……]她显然很焦躁。你伸出手，拍了拍她弹跳的屁股，洛蒂回报以尖叫。你们俩都对她的话轻笑出声，尽管你感觉到腹股沟里有一种熟悉的冲动。[pg]");
            dynStats(DynStat.Lust(2));
            outputText("没有太多线索，你真的无法评论她的进展。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("<b>妈的，出bug了，孩子。</b>");
            doNext(get_camp().returnToCampUseOneHour);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,308,lottieTone());
      }
      
      public function stayLottieBuds4Evah() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉她，你觉得还是做朋友比较舒服，把关系变成性关系可能会带来不必要的麻烦。洛蒂点点头，表示理解，但也对你的决定感到有些失望。[say: 我明白了……你完全正确！你绝对——这是我今天听过的最正确的话了，你知道吗？]她勉强地笑了笑，但你只能对她试图逃避这种情况感到皱眉。你告诉她你很抱歉，但你们没有理由不能继续做健身伙伴。你越是拒绝她，洛蒂就越显得沮丧。最后，她似乎快要哭了。[say: 我……对不起，我只是……我以为……]你拿起她的水杯，把洛蒂带出健身房，来到草地跑道上坐下。现在这里空无一人，夜晚的宁静让她平静下来。你告诉她放松，你受宠若惊，你觉得她依然很美——任何能让她现在感觉好点的话。你没想到她被拒绝做爱会有这么强烈的反应，但这就是洛蒂——她像桃子一样敏感。也许这对她来说很重要？你琢磨了一会儿，洛蒂坐在你旁边，已经很累了。你最后看了她一眼，然后用手臂搂住她的肩膀，把她拉近你，说她能主动问你已经很勇敢了——没几个人能这么直接。女孩保持沉默，但靠得更近了，把头靠在你的胸前。让她靠得这么近是个坏主意，但你知道她现在需要这样。你继续说着话，你声音的震动让洛蒂进入了梦乡。[pg]");
         outputText("过了一会儿，你们俩坐在健身房门口，洛蒂已经平静了许多。[say: 谢谢，[name]，我知道我反应过度了，但是……]她叹了口气。[say: 我不知道。我不知道没有你我该怎么办，" + get_player().mf("大个子","宝贝") + "。]你在分别前给了她最后一个拥抱。她明天早上就会好的。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sprintAndLeaveLottieBehind() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你不想失去目前建立起来的节奏，所以你决定全力以赴，在跑道上飞奔，把洛蒂远远甩在后面。[say:哇——嘿！等等；别丢下我，求你了！]她大喊着，迈着胖乎乎的腿拼命跑。当你到达跑道尽头时，洛蒂已经放弃了，在健身房门口等你跑完。你向她竖起大拇指，然后继续跑下一圈。[pg]");
         outputText("几圈之后，你已经筋疲力尽，所以决定回家。你注意到洛蒂不见了踪影，但那是她的损失——不是你的。");
         dynStats(DynStat.Tou(0.2),DynStat.Spe(0.25));
         lottieMorale(-3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sprintAndLeaveFitLottieBehind() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你不想失去目前建立起来的节奏，所以你决定全力以赴，在跑道上飞奔，把洛蒂远远甩在后面。[say:哇——嘿！你搞什么鬼？！]她大喊着，试图追上你。当你到达跑道尽头时，洛蒂已经远远落后了，尽管你能看到她还在努力追赶。你向她竖起大拇指，然后继续跑下一圈。[pg]");
         outputText("几圈之后，你已经筋疲力尽，所以决定回家。你注意到洛蒂不见了踪影，但那是她的损失——不是你的。");
         dynStats(DynStat.Tou(0.2),DynStat.Spe(0.25));
         lottieMorale(-3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottiesThirtyMinutePigGasm() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("[say: 嘿，宝贝！] 洛蒂用她一贯的开朗方式向你打招呼。虽然她的笑容洋溢着自信，但她的眼神却诉说着不同的故事。她的眼神悲伤而充满依赖。她很仰慕你！话又说回来，她为什么不呢？毕竟你是她的私人教练。[pg]");
         outputText("你微笑着回以热情的问候。寒暄过后，你告诉她该做些锻炼前的拉伸了。洛蒂总是渴望取悦你，她开始了动作。她尽可能地张开双腿，然后弯下腰试图触摸脚趾。当她弯腰时，你瞥见了她宽阔的臀部。这屁股真大！当她努力去够脚趾时，她那丰满的屁股扭动摇晃着；这简直就是[say: 肉多好办事]的完美定义。你越看，越多的血液涌向你的" + get_player().cockDescript(_loc1_) + "。你咬着嘴唇，汗珠在皮肤上渗出；你必须驯服那对屁股！[pg]");
         outputText("洛蒂完全没有意识到你正在色眯眯地盯着她丰满的臀部。她因为用力而满脸沮丧。然后……胜利了！她成功地摸到了脚趾！一个如释重负的微笑掠过她的脸庞，直到……啪！洛蒂因为臀部突然传来的刺痛而疼得缩了一下。她试图直起身，但你强有力的左手把她按在原地。她尽可能地回头看，首先注意到你脱下的[armor]，然后是你勃起、跳动的肉棒。她有些忐忑不安地微微发抖，试图问个问题，但嘴里只发出语无伦次的结巴声。[pg]");
         outputText("[say:是时候干这婊子了！]你得意洋洋地喊道。你用力扯下那条勉强遮住她丰满臀部的暴露底裤。你淫笑着，把[onecock]夹在她粉嫩的双丘之间。现在你紧紧抓住她的臀部，在中间抽插着你的阳具。洛蒂甚至没有反抗。相反，她像只母猪一样颤抖着，发出哼哼唧唧的声音。[pg]");
         outputText("你用极其邪恶的眼神低头看着她，立刻停止了在她丰满双臀间的抽插。你毫无预兆地将你的" + get_player().cockDescript(_loc1_) + "猛地插入她如母猪般深邃的穴中，强行分开了她的阴唇。洛蒂因为这突如其来的冲击而尖叫，她的阴道肌肉紧紧包裹着你，给你带来无与伦比的快感。她气喘吁吁，只是站在那里承受着。她满脸通红，舌头伸出嘴外，但她是否享受对你来说并不重要。操！她的穴天生就是榨精机。它翻腾着、挤压着你的" + get_player().cockDescript(_loc1_) + "，鼓励你狠狠地干她，而你也很乐意效劳。你抓住她的臀部借力，猛烈地抽插她那肥美的肉穴好几分钟，直到你的下体喷射出一股浓稠的精液，将她的体内完全涂成白色。[pg]");
         outputText("你以胜利者的姿态站着，试图拔出来，但你做不到。她的肉穴紧紧地夹着你，让你无法抽出。不过你并不着急。你的肉棒依然坚挺，她的身体也十分温暖。你坏笑着，只是站着享受她子宫的感觉。突然，洛蒂声嘶力竭地大叫起来。你试图拔出的动作似乎引发了她的高潮。一股如瀑布般的淫液从她的穴中倾泻而出。她喷了又喷，喷了又喷……五分钟后，她的高潮依然没有停止！由于她不断喷出的淫水，你们俩站立的地面看起来像个小水坑。十分钟了，她还是没有停下来！什么时候才是个头？为什么这只母猪这么兴奋？老兄，发生什么事了？洛蒂大口喘着气，尽可能大声地哼哼着。你既疲惫又沮丧，只能站在那里，任由她的高潮持续不断。又过了大约二十分钟，洛蒂丰满的肉穴终于松开了你，她向前扑倒在充满淫液的水坑里，双眼翻白，脸上绽放出灿烂的笑容。[pg]");
         outputText("该死！这只母猪真的高潮了半个小时吗？你都有点嫉妒了。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieYogaAlone() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你拿着垫子，走向那个四臂瑜伽教练，在离她那晒黑的肌肉躯体只有一两米远的地方坐下。在你的眼角余光中，你可以看到洛蒂明显有些沮丧，因为她看着你盯着面前那个身材健美的焦糖色女人。当你摆好姿势时，一股强烈的咖啡和沙漠花朵的气味扑鼻而来，教练仰面躺下，将双腿拉起，让你清楚地看到她粗壮的大腿和饱满的阴阜。你发誓你可以看到她在微笑，周围的其他成员开始模仿她的姿势。为了不让人失望，你坐在臀部上，头向后仰，面对着另一双举在空中的腿。你可以看到洛蒂试图做同样的姿势，结果却向右倾斜摔倒了，惹得旁边的人不耐烦地瞪了她一眼。[pg]");
         outputText("你继续模仿着那位运动型瑜伽老师略带性暗示的姿势，不知不觉中这节课就结束了。汗水和信息素的气味让你的头感到奇怪的眩晕，你独自走回家，完全忘记了洛蒂。");
         outputText(get_player().modThickness(30,1));
         outputText(get_player().modTone(60,1));
         lottieMorale(-2);
         get_player().changeFatigue(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieYoga() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你知道洛蒂对瑜伽很感兴趣，所以你决定走进泳池尽头那间光线昏暗的房间。她高兴地跟在你身后，当你拿出两张垫子时，她一蹦一跳地跟在你身边。一节课已经开始了，你可以看到许多人围着一个晒黑的四臂女人做热身运动。你知道在他们开始做更复杂的伸展运动之前，你们还有一点时间；你环顾四周，寻找最佳的座位，既能看清四臂教练，又不会被挡住视线。当你找遍整个房间时，又有几个人占了大部分空位。你转过头，看到洛蒂已经趴在垫子上了——她看着你，咯咯地笑着，然后拍了拍她旁边空着的地方。你回以一个微笑，同时也注意到老师旁边有一小块空地——如果你一个人去的话，你就能占到那个位置。你是应该一个人去，还是和洛蒂一起做伸展运动？");
         menu();
         addButton(0,"独自一人",lottieYogaAlone);
         addButton(1,"一起",togetherLottieYoga);
      }
      
      public function lottieWeights() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         if(lottieTone() <= 70)
         {
            outputText("当你告诉洛蒂今天决定做点举重时，她紧张地看着你。显然她并没有这个打算，但她还是听从了你的建议，小跑着走向举重区，迎上了几个肌肉发达得多的成员的目光。她紧张地沿着器材墙走着，拿起了一个最小的哑铃，开始拼命地举起来，勉强做了几次，发出了清晰可闻的咕哝声。你不想被比下去，于是跟着她走到举重器材前——当你站在较小的哑铃附近时，许多其他举重者已经在窃笑了。洛蒂紧张地看着你，不想让自己难堪。你也不想感到尴尬。你是应该挑一个大点的哑铃炫耀一下你的技巧，还是无视那些举重者，和洛蒂一起训练？");
            menu();
            addButton(0,"炫耀",boastAtLottie);
            addButton(1,"训练",trainWithLottie);
            if(lottieMorale() <= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,206) > 0 && get_player().get_str() >= 75 && get_player().tone >= 60 && get_player().cumQ() >= 1000)
            {
               addButton(2,"NTR举重",ifrisAndLottieGetsNTRedLiftingWeights);
            }
            else
            {
               addButtonDisabled(2,"NTR举重");
            }
         }
         else
         {
            outputText("听到你建议今天做点举重，洛蒂在空中挥舞着拳头。虽然她还没达到你的水平，但她的技术足以让她在器材墙周围其他更熟练的健身房成员面前不至于出丑。洛蒂在举重区走了一圈，注意了一下哑铃的尺寸，然后选择了一个适合自己水平的，以缓慢的节奏举起，并确保调整好呼吸。你不想被比下去，于是跟着她走到举重器材前——当你站在较小的哑铃附近时，许多其他举重者已经在窃笑了。洛蒂紧张地看着你，不想让自己难堪。你也不想感到尴尬。你是应该挑一个大点的哑铃炫耀一下你的技巧，还是无视那些举重者，和洛蒂一起训练？");
            menu();
            addButton(0,"炫耀",boastAtFitLottie);
            addButton(1,"训练",trainWithFitLottie);
         }
      }
      
      public function lottieTone(param1:int = 0) : int
      {
         if(param1 == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279);
         }
         if(get_debug())
         {
            outputText("[pg]<b>(调试：洛蒂的语气改变了 " + param1 + "！)</b>[pg]");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,279,FlagDict_Impl_.arrayReadInt(_loc2_,279) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,279,100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,279,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,306) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,306,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,307) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,307,0);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279);
      }
      
      public function lottieSuccessOneShot() : void
      {
         var _loc2_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(get_player().tone > 30 || get_player().thickness < 70)
         {
            outputText("你走进瑜伽区，迎面扑来的是弥漫在房间里的汗水和花香。你望向空地中央，发现洛蒂正弯着腰，她那被紧身热裤挤压着的屁股正对着你的方向。听到你进来的声音，她猛地抬起头，看向你——你注意到她已经脱掉了上衣。[say:喜欢你看到的吗，宝贝？]她咧嘴笑着，用手掌托起她那沉甸甸的乳房之一。[say:我花了一些时间在瑜伽室练习一些……姿势。我想你可能会想试试。]猪娘滑倒在地板上，尝试着劈叉，她的双腿向不同的方向分开。这女孩真他妈的灵活，你心想。[pg]");
            outputText("洛蒂温柔地要求你平躺下来，你很轻松地照做了。你很舒服，双手交叉放在脑后，给你提供支撑，看着你的爱人慢慢走向你，脱下她的短裤。洛蒂转过身，她粗壮的大腿跨坐在你身上，背对着你坐在你的腹股沟上，让你完美地看到她曲线优美的身体和丰满的屁股。你的" + get_player().cockDescript(_loc1_) + "温柔地依偎在她玫瑰色的脸颊之间，随着女孩抓住她的臀部开始用她的屁股取悦你，它带着色情的意图跳动着。房间里的寂静被你狂热的喘息和咕哝声打破，洛蒂熟练的乳交让你陷入狂喜，她臀部的每一道曲线都在你那根火热的肉棒上摇晃。当她在你身上弹跳时，她的速度加快了，挤压和揉捏着她完美的屁股，直到最后一次在空中抬起，她将你的长度插入她火热的内部。你那滚烫的肉棒进入她小穴的感觉立刻让洛蒂陷入了性高潮的极乐之中，强烈的热量让猪娘充满了快感。她试图继续下去的努力被你的" + get_player().cockDescript(_loc1_) + "刮擦她内壁的感觉所阻挠，她粗壮的大腿紧紧夹在一起，同时在你身上缓慢地上下移动。决定自己掌握主动权，你向上挺进，几乎用你的力量把女孩推开，当你开始捣弄她那不可抗拒的洞口时，洛蒂尖叫起来。她丰满的臀瓣随着你的每一个动作而摇晃，她身体的起伏完全按照你的意愿进行。你进进出出，在这个浑身发热、焦躁不安的女人体内保持着稳定的节奏。[pg]");
            outputText("不可避免地，你能感觉到你的释放正在逼近，伴随着最后一次推力，你抓住猪娘紧致的屁股，猛烈地撞击她，将你的精液直接泵入她紧闭的小穴，你的" + get_player().cockDescript(_loc1_) + "抽搐着，一串串精液涂满了她的体内。洛蒂发出一声尖叫，瘫倒在地板上，充满了你滚烫的种子。你顺着她的臀沟擦拭你的鸡巴，把她留在地板上，变成一个汗津津、充满精液的烂摊子。走出去时，你确保顺手拿了一杯");
            if(get_silly())
            {
               outputText("培根");
            }
            outputText("奶昔。味道好极了。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,320,1);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
            outputText("(<i>\'反骑乘\'</i> 已在洛蒂的性爱菜单中解锁</i>)");
         }
         else
         {
            outputText("你走进瑜伽区，迎面扑来的是弥漫在房间里的汗水和花香。你环顾四周，找不到你的爱人，直到——砰！一个重物砸在你的头上，把你砸倒在地，让你失去了意识，一切都陷入了黑暗。");
            outputText("[pg]你醒来时头晕目眩，额头隐隐作痛——你还全身赤裸，但除此之外没有受伤。然而，当你试图移动时，你发现自己无法改变姿势——你似乎被绑在椅子上，双手背在身后，双腿被绑在座椅的腿上。你观察周围的环境，注意到健身房设备棚里熟悉的砖墙和堆满物品的架子。这个地方的熟悉感让你松了一口气——至少你知道自己在哪里。");
            outputText("[pg]一记响亮的耳光让你把注意力集中在面前这个苗条的猪娘身上。由于房间里缺乏阳光，她的身形有些模糊，但你可以看出她几乎全裸，只有一条黑色的丁字裤遮住了她的下体。她似乎还穿着黑色的过膝长靴，以及同样颜色的长及腋窝的手套。她的表情充满了强烈的欲望，在打量你的身体时苦笑着。[say:你变大了。]她笑着，靠在你身上，让她沉甸甸的乳房闷住你的脸。你舔了一下她的一个乳头，然后她猛地后退，又打了你一下。[say:哈哈哈，今天不行，猪。你长这么多肉都是因为你管不住自己的嘴。]她啐了一口，抓住了你柔软的");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("奶子");
            }
            else
            {
               outputText("肚子");
            }
            outputText("并捏了捏，仿佛在玩腻子。[say:我已经达到了我的目标，但看来你需要一点帮助才能达到你的目标。如果你不介意的话，我想我今天会做你的私人教练。]这个饥渴的猪荡妇抓住了你的" + get_player().cockDescript(_loc1_) + "，紧紧握住你的阴茎，毫不费力地给你打飞机。[say:我想我会释放出你藏在肥大阴茎里的所有浓稠、粘稠的精液。]");
            outputText("[pg]她戴着手套的天鹅绒般的双手给你的身体带来了一阵阵快感，她的技巧笨拙但有效。洛蒂开始玩弄她多汁的乳头，扭动和摩擦它们，同时她玩弄着你的长度。你浑身发抖，低头发现她的嘴离你的" + get_player().cockDescript(_loc1_) + "只有几英寸远，她灼热的呼吸包围着你的龟头。她舔了一下你的龟头，你已经感觉到一阵刺痛，因为你开始高潮了——她是不是吃了什么东西才导致这样的？不管怎样，你盲目地在她的手中抽插，寻找释放，这时洛蒂紧紧抓住你的阴茎，堵住了你的精液，让你发出拒绝的咕哝声。[pg]");
            if(get_player().cumQ() < 500)
            {
               outputText("[say:嗯。你的老二好像在抽搐。你……你是想为我高潮吗？]你狂热地点头，只要能让她松手，你什么都愿意做。[say:不行。不能在这里。要射在里面。]她跨坐在你身上，将你的" + get_player().cockDescript(_loc1_) + "插入她的深处，并以稳定的节奏弹跳着，她丰满的屁股拍打着你的腹股沟。[say:嗯……你喜欢我操你肥大的屁股吗，猪？]她尖叫着，紧紧抱住你庞大的身躯，而你则躺在那里，享受着服务。[say:操-操！填满我，宝贝！]你咕哝着，她内壁像老虎钳一样的紧握力紧紧夹住你的肉棒。伴随着一次稳定的挺进，你在她体内爆发了，用你浓稠的精液填满了她。[say:哦，天哪，把你的精液都给我！]她尖叫着，肚子里装满了你滚烫的液体。洛蒂站起身来，你的" + get_player().cockDescript(_loc1_) + "滴落下来，在你身下留下了一滩水迹。[say:哈-哈，你-你真是头猪！]她结结巴巴地说，显然是因为做爱而慌乱，但仍试图保持一种强势的姿态。你轻松地解开绑带，走到她身边，在她的脸颊上印下一个吻，然后穿过棚屋的门离开。[say:你……你一直都能逃脱？]她尖叫道，你唯一的回答是竖起大拇指，然后转身离开。在你出去的路上，一个卖奶昔的小贩向你挥手——是咖啡馆里的那个人。");
               if(get_silly())
               {
                  outputText("你买了一杯培根奶昔，然后决定回家。你他妈的太喜欢培根奶昔了。[pg]");
               }
               else
               {
                  outputText("[pg]");
               }
            }
            else
            {
               outputText("对她来说不幸的是，你积攒了太多，现在停不下来了。随着另一次抽插，你的" + get_player().cockDescript(_loc1_) + "在喜悦中跳动，在高潮中爆发，成股的精液溅在洛蒂的脸和奶子上。女孩喘着粗气，你大量的精液把她染成了白色。[say:不-不，停下！哦，天哪！]她尖叫着，然后她的嘴里充满了你滚烫的精华。她强迫自己咽下去，咳嗽着，而你对着这个被击败的荡妇咧嘴笑。[say:好-好吧，你-你赢了，[name]，]她抬头看着你笑了笑，然后解开你的绑带，放你自由。[say:但你必须承认，这很有趣，对吧？]你对她竖起大拇指，然后走出大门，留下她清理你浓稠的烂摊子。在出去的路上，一个卖奶昔的小贩向你挥手——是咖啡馆里的那个人。你买了一杯");
            }
            if(get_silly())
            {
               outputText("培根");
            }
            outputText("奶昔，然后决定回家。");
            if(get_silly())
            {
               outputText("你他妈的爱死培根奶昔了。");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,319,1);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
            outputText("(<i>\'女上位\'</i> 已在洛蒂的性爱菜单中解锁</i>)");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatWalkies() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-fuck-her-in-public-repeat");
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("几分钟后，你带着你的婊子走出了健身房，绕到了后面，那里有一个设备棚正在等着你们。你用附近的一根金属杆迅速砸开了锁。你们俩慢慢走进去，洛蒂在你身后停下脚步，凝视着散落在墙上的工具和运动器材。很快，你就找到了你想要的东西。你从来不是一个会评判别人性癖的人，但你在心里默默记下，要感谢那个无法控制自己欲望的人。一条连着皮带的单层皮革项圈静静地挂在棚子墙壁上的钩子上。你咧嘴一笑，把它取下来，调整了一下绳子的长度，然后递给洛蒂。[say: 这、这是干什么用的，[sir]？]她嘟囔着，但你没有理会她的疑问，而是松开项圈，把它套在女孩的脖子上，在她抗议之前收紧。[say: 不、不要！你在干——！]啪！你一巴掌扇在她柔软的脸颊上，导致她猛地扯动绳子，痛苦而可怜地摔倒在地。你的荡妇眼泪汪汪地慢慢抬头看着你，一只手捂着脸以缓解刺痛感。[say: 我……我明白了，]她小声嘀咕着，捡起皮带放在你手里，然后双膝跪地，在你面前摆出乞求的姿势。当女孩伸出她的小舌头，不情愿地舔舐你的腹股沟以满足你衣服下的野兽时，你发出一声闷哼。就像一个婊子一样，以为你来这里就是为了这个。你走开，不理会她试图为你口交的举动，拉着皮带，把你的女孩往前拽。她站起身，开始跟在你身后走到阳光下——你想让全世界都知道你把你的胖小猪训练得有多好。[pg]");
         outputText("你回头看了看棚子，看看有没有遗漏什么东西。哑铃、粗大的杆子、鞭子、一些绳子，还有——啊对，钢环口交球。“有鞭子的地方，就有办法”，你一边轻笑着，一边拿起带子走向洛蒂。你的母猪荡妇赤身裸体，准备就绪，等待着你的命令。你拿出环形装置，将带子拉过她的头顶，把金属环塞进她嘴里，强迫这个苍白的荡妇用嘴唇做出一个永久的“O”形。你收紧口交球，洛蒂不舒服地咳嗽起来，口水在她的嘴角积聚。你拉着皮带，把洛蒂拖离棚子，她那巨大的屁股在她试图追赶你时不停地晃动。你打算带她去特尔阿德雷的后街——你想让人们看到你的艺术品，但你知道只有这座城市的人渣才会真正欣赏她的本质。你拉着皮带，带领洛蒂穿过一条小巷，进入沙漠城市中一个更小、更脏的区域，这是一个封闭的区域，周围散落着几个食品摊。大多数下层市民在这些地方游荡，他们一边讨价还价、争吵和偷窃，一边拖着脚步走来走去——这在贫民窟是司空见惯的。大多数人都注意到了跟在你身后小跑的猪女孩，但很少有人多看一眼。当你展示你的战利品时，大多数人都站在那里盯着看——一些更勇敢的人甚至公然对着这个场景自慰，而更勇敢的人则走上前去，在你的母猪屁股上拍了一巴掌，引来一声尖叫或呻吟。你决定在穿过公共厅时加大赌注，把一只手放在洛蒂苍白的大腿之间，将两根手指插入她的小穴，当你无耻地指奸这个可怜的女孩时，热量包裹着你的手指。[pg]");
         if(get_npcSettings().urtaDisabled)
         {
            outputText("在散步时，你发现自己来到了一个熟悉的地方——湿身婊酒馆的后巷。觉得把你的荡妇带进去也无妨；你猛地把手往前一伸，强迫洛蒂走向门口——这时你注意到一个正在疯狂自慰的醉汉。那人一边看着你，一边无情地抽插着他粗大的肉棒，并对你现在用皮带拴着的母猪荡妇眨了眨眼。");
            if(get_silly())
            {
               outputText("[say: 培根 培根 培根 培根 培根 培根！我要吃培根！]");
            }
            else
            {
               outputText("[say: 嘿嘿 *嗝* 伙计，她是你 *嗝* 性奴还是什么人？]");
            }
            outputText("你决定给这个醉汉一点甜头。把滑溜溜的手指从她的小穴里抽出来，你把洛蒂推向那个肮脏的流浪汉，拉着皮带把她猛地向后拽倒在地。当她试图站起来时，男人的巨大阴茎拍打在洛蒂的鼻子上，女孩发出一声尖叫。你掏出自己的" + get_player().cockDescript(_loc1_) + "，冲她吼叫，让她保持四肢着地——只要你拥有她的后半身，你才不在乎那个老头对她的脸做什么。他开始用他那根肉棒的头部摩擦你荡妇丰满的嘴唇，他先列腺液的气味诱惑着洛蒂在湿润的顶端轻轻舔舐。你不想被冷落，用力抓住她的臀部，将你的" + get_player().cockDescript(_loc1_) + "径直滑入荡妇温暖的洞穴，当你感觉到她的肉壁紧紧包裹着你时，你发出一声闷哼。当她的臀部突然向后猛推时，你猛地一抽，你瞥了一眼，发现那个醉汉正尽可能多地把他粗大的肉棒埋进女孩的嘴里。你们俩对视了一眼，互相点了点头，然后你们俩都把自己的肉棒插入这个抽泣的猪婊子体内，前后摇晃着。男人一边呻吟，一边用一只手抓住洛蒂的后脑勺，另一只手把啤酒草率地倒进自己嘴里。在你的奴隶的另一端，你无情地操着，紧紧抓住她肥大的屁股，因为它们拍打你腹股沟带来的快感而大口喘气。男人发出一声响亮的呻吟，然后尽可能多地把洛蒂的脸按进他的腹股沟，他的睾丸跳动着，准备填满荡妇的喉咙。你也感觉自己快要爆炸了，在女孩体内进行了更长时间、更深的抽插，最后向前猛推，用你的精液填满了她，对面的陌生人也把抽搐的阴茎塞进洛蒂的喉咙里，做了同样的事情。你们俩慢慢地从你们的战利品中抽身，那个苍白、出汗的女孩现在躺在地板上，浓稠的精液从两端漏出。伴随着最后一声闷哼，你把剩下的精液卸在她丰满的屁股上，而醉汉则把精液涂满了她的脸。[pg]");
            outputText("你决定把洛蒂留在那里，让流浪汉对着她的嘴再打一发手枪，然后回到健身房去拿一杯");
         }
         else
         {
            outputText("在散步时，你发现自己来到了一个熟悉的地方——湿身婊酒馆的后巷。觉得把你的荡妇带进去也无妨；你猛地把手往前一伸，强迫洛蒂走向门口——这时你认出了一张正在疯狂自慰的双性狐狸兽人的脸。乌尔塔一边看着你，一边无情地抽插着她粗大的马鸡巴，并对你现在用皮带拴着的母猪荡妇眨了眨眼。她似乎又认不出你了，这要么意味着她不知怎么地患上了严重的失忆症，要么就是她比平时醉得厉害得多。");
            if(!get_silly())
            {
               outputText("[say: 嘿嘿，她是你 *嗝* 性奴还是什么人？]");
            }
            else
            {
               outputText("[say: 嘿嘿，我闻到培根味了吗？我真他妈喜欢培根！培根 培根 培根！]");
            }
            outputText("你决定给这只喝醉的母狐狸一点甜头。把滑溜溜的手指从她的小穴里抽出来，你把洛蒂推向那个灰" + (get_noFur() ? "发" : "") + "狐狸女人，拉着皮带把她猛地向后拽倒在地。当她试图站起来时，乌尔塔巨大的马阴茎拍打在洛蒂的鼻子上，女孩发出一声尖叫。你掏出自己的" + get_player().cockDescript(_loc1_) + "，冲她吼叫，让她保持四肢着地——只要你拥有她的后半身，你才不在乎那个双性狐狸兽人对她的脸做什么。乌尔塔开始用她那根肉棒平坦的头部摩擦你荡妇丰满的嘴唇，她令人陶醉的先列腺液的气味诱惑着洛蒂在湿润的顶端轻轻舔舐。你不想被冷落，用力抓住她的臀部，将你的" + get_player().cockDescript(_loc1_) + "径直滑入荡妇温暖的洞穴，当你感觉到她的肉壁紧紧包裹着你时，你发出一声闷哼。当她的臀部突然向后猛推时，你猛地一抽，你瞥了一眼，发现乌尔塔正尽可能多地把她粗大的肉棒埋进女孩的嘴里。你们俩对视了一眼，互相点了点头，然后你们俩都把自己的肉棒插入这个抽泣的猪婊子体内，前后摇晃着。乌尔塔一边呻吟，一边用一只手抓住洛蒂的后脑勺，另一只手抚摸着自己的乳房。在你的奴隶的另一端，你无情地操着，紧紧抓住她肥大的屁股，因为它们拍打你腹股沟带来的快感而大口喘气。双性狐狸兽人发出一声响亮的呻吟，然后尽可能多地把洛蒂的脸按进她的腹股沟，她的睾丸变大，准备填满荡妇的喉咙。你也感觉自己快要爆炸了，在女孩体内进行了更长时间、更深的抽插，最后向前猛推，用你的精液填满了她，对面的狐狸女人也把她抽搐的、充满兽性的阴茎塞进洛蒂的喉咙里，做了同样的事情。你们俩慢慢地从你们的战利品中抽身，那个苍白、出汗的女孩现在躺在地板上，浓稠的精液从两端漏出。伴随着最后一声闷哼，你把剩下的精液卸在她丰满的屁股上，而乌尔塔则把精液涂满了她的脸。[pg]");
            outputText("你决定把洛蒂留在那里，让乌尔塔对着她的嘴再打一发手枪，然后回到健身房去拿一杯");
         }
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。");
         if(get_silly())
         {
            outputText("你确实喜欢烤乳猪，但没有什么能比得上一杯培根奶昔。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatThreesome() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-fuck-her-threesome-repeat");
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你们俩走到瑜伽室，发现艾尔正在空地上拉伸。她看到了你们俩，挥手打招呼——但你们心里都有其他更下流的打算。艾尔脱下衣服，她那挺拔的双乳弹跳着释放出来。你在你那赤裸而渴望的后宫面前脱衣服时，发出恶魔般的轻笑。两个女孩盯着你的" + get_player().cockDescript(_loc1_) + "时，都紧张地红了脸——尽管她们眼中的饥渴表明她们绝非焦虑。你仰面躺下，示意女孩们过来。洛蒂热情地小跑向你，躺在你的肉棒前，将龟头含进她丰满的双唇中，用她灵活的舌头在周围打转。蜘蛛娘变得更加热情，跳到后面躺在洛蒂旁边，将她火热的小嘴贴在你肉棒的根部，轻柔地舔舐着。她用舌头顺着你的长度舔舐，而洛蒂则饥渴地吸吮着你的龟头，吸溜着先列腺液的珠滴，不时停下来将嘴唇贴在她的蜘蛛朋友身上，交换着唾液和你鸡巴的味道。当你让女孩们在你光滑的肉棒上忙活时，这个蜘蛛荡妇移开身子，跨坐在你的脸上，她湿润的小穴距离你饥渴的嘴巴只有几英寸。洛蒂开始在你的肉棒上忙活，而艾尔则向前倾身，将它深深地塞进嘴里，用力而快速地吸吮着。她伴随着湿润的“啵”声松开你的龟头，当你把舌头伸进她火热的小穴里，品尝着她的淫液并轻柔地吸吮她坚硬的阴蒂时，她发出呻吟。洛蒂移动到你的肉棒上方，慢慢地降低身子，直到你向上挺动，将你的" + get_player().cockDescript(_loc1_) + "直接猛插进她的体内。两个女孩从两端发出尖叫和呻吟，艾尔粗壮的大腿夹在你头部的两侧，同时她试图把你拉得更深。洛蒂柔软的双乳随着她在你身上弹跳而起伏，她俯身向蜘蛛娘，两人深情拥吻。艾尔多出来的手揉捏着洛蒂的乳房，而她主要的两只手则抓住自己的臀部，在你的脸上摩擦，同时你吸吮着她甜美的花蜜。你的技巧似乎奏效了，蜘蛛娘在性高潮中颤抖，她汗津津的大腿紧紧夹住你，在狂喜中颤抖。洛蒂不久后也达到了高潮，她抱住艾尔的头，女孩轻柔地吸吮着她柔软的乳头，她的内壁紧紧地裹住你。当你感觉到自己即将释放时，你命令你的荡妇们从你身上下来，她们照做了。几秒钟内，你抓住了蜘蛛娘，强迫她张开双腿，将你的" + get_player().cockDescript(_loc1_) + "插进去，喷射出你滚烫的精液。洛蒂将自己摆在女孩的上面，让她们的小穴紧贴在一起，在欲望中摩擦。一旦你完成了对蜘蛛荡妇的灌注，你便挺进猪娘体内，一串串精液溅在她的内壁上。你继续在她们俩体内抽插了几分钟，然后让每个女孩吸吮你的鸡巴作为结束。[say:很满意，]你嘟囔着，重新穿好衣服走向门口，确保顺手拿了一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("你只需要其中一个就能满足你。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatSUPERNEATORARES() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你们俩走到瑜伽室，发现艾尔正在空地上拉伸。她看到了你们俩，挥手打招呼——但你们心里都有其他更下流的打算。艾尔脱下衣服，她那挺拔的双乳释放出来。你在你那赤裸而渴望的后宫面前脱衣服时，发出恶魔般的轻笑——但你眼中只有一个女孩。你指着蜘蛛娘，告诉她们俩你只打算操她。洛蒂可能以为她能用另一个荡妇来赢得你的欢心，但你觉得你应该给她一个教训，让她知道对你想要的东西太过自以为是是不对的。艾尔向你走来，她那适合生育的臀部催眠般地摇摆着，同时她");
         if(get_player().cockTotal() == 1)
         {
            outputText("开始用她的两只手抚摸你的" + get_player().cockDescript(_loc1_) + "，而另一只手则开始按摩你的");
            if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("屁股");
            }
         }
         else
         {
            outputText("用她的四只手来处理[eachcock]，轻松地撸动着每一根");
         }
         outputText("。洛蒂站在你们俩旁边，一边看着这色情的画面自慰，一边小声抽泣着。你决定进一步戏弄洛蒂，绕过蜘蛛娘，用你的手指享受她湿滑的小穴，并在她为你打飞机时，将你自己的嘴唇贴在她的嘴唇上。你抱起蜘蛛娘，一个利落的动作将她刺穿在你的" + get_player().cockDescript(_loc1_) + "上，抓住她充满女人味的大腿，用你的肉棒抽插她。当你在这个运动型女人身上释放时，她的四只手臂紧紧地抱住你，她肩膀上的吐丝器无所事事地悬挂着，却因跳动的需求而勃起。它们会是……？你迅速打消了这个念头，继续你野蛮的欲望展示，用舌头探索女孩的嘴巴，不时瞥一眼洛蒂，确保她目睹了每一次抽插。猪娘不知羞耻地四肢张开躺在地板上，一边呻吟一边疯狂地自慰，看着她最好的朋友被她的爱人无休止地耕耘。洛蒂将她汗津津的大腿紧紧夹在一起，发出一声尖叫，在性高潮中颤抖。被击败的她躺在地上，痛苦不堪。这给了你一个主意。你把艾尔紧紧抱在怀里，走向那个猪荡妇，将自己摆在她上面，而她最好的朋友则在你的鸡巴上弹跳。洛蒂睁开眼睛，看到这位古铜色美人的紧致屁股拍打着你的腹股沟，你们混合的体液从她被蹂躏的洞里漏出来。[say:为——为什么……]猪娘在抽泣中哽咽着，但随着你感觉到自己的释放正在积聚，你只是加快了速度。你继续毫不费力地猛烈撞击你的新妓女，精液在你的腹股沟里冒泡，直到你迈出最后一步，深深地插进她的体内。一串串精液溅在她的内壁上，漏出来，涂满了你下方无助的猪娘。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你多出来的鸡巴");
            if(get_player().cockTotal() == 2)
            {
               outputText("跳动着，将它的精华洒在地板上和洛蒂身上。");
            }
            else
            {
               outputText("跳动着，将它们的精华洒在地板上和洛蒂身上。");
            }
         }
         outputText("艾尔也紧随其后，在达到她自己的顶峰时发出愉悦的呻吟，她的洞紧紧裹住你的长度，将你剩余的精液困在里面。她肩膀上的吐丝器在性高潮中脉动，喷射出黏糊糊的、看起来像是丝线的东西到半空中，然后落回到猪娘身上，精液在她的乳沟周围汇聚。你们俩都放松下来，让蜘蛛娘从你身上下来，瘫倒在地板上。你弯下腰，看着洛蒂，然后将你的" + get_player().cockDescript(_loc1_) + "插进她体内，让最后的一股精液填满她。[say:很满意。]你嘟囔着，重新穿好衣服走向门口，确保顺手拿了一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("你只需要其中一个就能满足你。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatQuickie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你跟着洛蒂来到泳池区，等她走进更衣室换衣服。然而，当她出来时，你惊讶地发现她什么都没换——事实上，她把衣服全脱了！[pg]");
         outputText("赤裸的猪娘站在你面前，在你饥渴的注视下涨红了脸。[say:你能操、操我的小穴吗，[name]？][pg]");
         outputText("你立刻脱下衣服扑向这只小猪，掏出你的" + get_player().cockDescript(_loc1_) + "抵住洛蒂湿润的缝隙，猪娘仰面躺着，双腿搭在你的肩膀上。你用力一挺，将自己送入她的体内，用你的肉棒操弄她的内里，引得她大声呻吟。当你弯下腰色情地抓住她的双峰，吸吮着她的乳头并捏住另一个时，她粗壮的大腿拍打着你，她甜美的味道包围了你的嘴。洛蒂将你埋在她的乳沟里，当你将她紧致的小穴操得服服帖帖时，她大叫起来——但你还有更多花样。把她翻过来，洛蒂脸朝下趴着，柔软的屁股翘在半空中，你持续不断的抽插让她发狂。你继续抓住她的奶子，同时猛烈地撞击她的肉体，每一次抽插都伴随着她愉悦的咕哝声。你来回骑乘着她，直到你下体熟悉的感觉得到了释放的信号。你加快了速度，猛烈地操着她的小穴，直到你向后仰起头，在她的内壁射精，每隔几秒钟就伴随着每一次喷发更用力地撞击。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的另一根肉棒");
            if(get_player().cockTotal() == 2)
            {
               outputText("抽搐着");
            }
            else
            {
               outputText("抽搐着");
            }
            outputText("在狂喜中，将精液释放到她丰满的屁股上。");
         }
         outputText("[pg]");
         outputText("洛蒂大汗淋漓地喘着粗气，躺在地板上，筋疲力尽，体内充满了你的精液。你拍了拍她摇晃的屁股，然后走出泳池区，出去的时候一定要拿一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("真他妈的好吃。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatFEMDOMFEMFDOM() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你们俩走进瑜伽区，扑面而来的是弥漫在房间里的汗水和花香。你环顾四周，找不到你的爱人，直到——砰！一个重物砸在你的头上，把你拉倒在地，随着一切褪成黑色，你失去了意识。");
         outputText("[pg]你醒来时头晕目眩，额头隐隐作痛——你还全身赤裸，但除此之外没有受伤。然而，当你试图移动时，你发现自己无法改变姿势——你似乎被绑在椅子上，双手背在身后，双腿被绑在座椅的腿上。你观察周围的环境，注意到健身房设备棚里熟悉的砖墙和堆满物品的架子。这个地方的熟悉感让你松了一口气——至少你知道自己在哪里。");
         outputText("[pg]一记响亮的耳光将你的注意力拉回到了面前这个苗条的猪女身上。由于房间里缺乏阳光，她的身形有些模糊，但你可以看出她几乎全裸，除了遮挡下体的一条黑色小丁字裤。她似乎还穿着黑色的过膝长靴，以及同样颜色的长及腋窝的手套。她的表情充满了强烈的欲望，在打量你的身体时苦笑着。[say:你变大了。]她微笑着，靠在你身上，让她沉重的乳房闷住你的脸。你舔了舔她的一个乳头，然后她猛地后退，又打了你一下。[say:哈哈哈，今天不行，猪。所有这些额外的体重都是因为你管不住自己的嘴。]她吐了口唾沫，抓住你柔软的");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("奶子");
         }
         else
         {
            outputText("肚子");
         }
         outputText("并捏了捏，仿佛在玩腻子。[say:我已经达到了我的目标，但看来你需要一点帮助才能达到你的目标。如果你不介意的话，我想我今天会做你的私人教练。]这个饥渴的猪荡妇抓住了你的" + get_player().cockDescript(_loc1_) + "，紧紧握住你的阴茎，毫不费力地给你打飞机。[say:我想我会释放出你藏在肥大阴茎里的所有浓稠、粘稠的精液。]");
         outputText("[pg]她戴着手套的天鹅绒般的双手给你的身体带来了一阵阵快感，她的技巧笨拙但有效。洛蒂开始玩弄她多汁的乳头，扭动和摩擦它们，同时她玩弄着你的长度。你浑身发抖，低头发现她的嘴离你的" + get_player().cockDescript(_loc1_) + "只有几英寸远，她灼热的呼吸包围着你的龟头。她舔了一下你的龟头，你已经感觉到一阵刺痛，因为你开始高潮了——她是不是吃了什么东西才导致这样的？不管怎样，你盲目地在她的手中抽插，寻找释放，这时洛蒂紧紧抓住你的阴茎，堵住了你的精液，让你发出拒绝的咕哝声。[pg]");
         if(get_player().cumQ() <= 500)
         {
            outputText("[say:嗯。你的鸡巴好像在抽搐。你……你是要为我射精吗？]你狂热地点头，只要能让她松开手，什么都行。[say:不。不是在这里。在我的里面。]她跨坐在你身上，将你的" + get_player().cockDescript(_loc1_) + "插入她的深处，并以稳定的节奏弹跳，她丰满的屁股拍打着你的腹股沟。[say:嗯……你喜欢我操你肥大的屁股吗，猪？]她尖叫着，紧紧抱住你庞大的身体，而你躺在那里，享受着服务。[say:操-操！把我填满，宝贝！]你咕哝着，她阴道壁像老虎钳一样的抓地力紧紧贴着你的阴茎。随着一次稳定的推力，你在她体内爆发，用你浓稠的精液填满了她。[say:哦，天哪，把你所有的精液都给我！]她尖叫着，她的肚子里充满了你熔融的液体。洛蒂站起身来，你的" + get_player().cockDescript(_loc1_) + "滴落出来，在你身下留下了一滩水。[say:哈-哈，你-你真是一头猪！]她结结巴巴地说，显然是因为做爱而慌乱，但仍然试图保持一种占主导地位的表象。你轻松地解开绑带，走到她身边，在她的脸颊上印下一个吻，然后从棚门离开。[say:你……你一直都能逃脱？]她尖叫着，你唯一的回答是竖起大拇指，然后走开。在你出去的路上，一个卖奶昔的小贩向你挥手——是咖啡馆里的那个人。你买了一杯");
            if(get_silly())
            {
               outputText("培根");
            }
            outputText("奶昔，然后决定回家。");
            if(get_silly())
            {
               outputText("你他妈的爱死培根奶昔了。");
            }
         }
         else
         {
            outputText("对她来说不幸的是，你积攒了太多，现在停不下来了。随着另一次抽插，你的" + get_player().cockDescript(_loc1_) + "在喜悦中跳动，在高潮中爆发，成股的精液溅在洛蒂的脸和奶子上。女孩喘着粗气，你大量的精液把她染成了白色。[say:不-不，停下！哦，天哪！]她尖叫着，然后她的嘴里充满了你滚烫的精华。她强迫自己咽下去，咳嗽着，而你对着这个被击败的荡妇咧嘴笑。[say:好-好吧，你-你赢了，[name]，]她抬头看着你笑了笑，然后解开你的绑带，放你自由。[say:但你必须承认，这很有趣，对吧？]你对她竖起大拇指，然后走出大门，留下她清理你浓稠的烂摊子。在出去的路上，一个卖奶昔的小贩向你挥手——是咖啡馆里的那个人。你买了一杯");
            if(get_silly())
            {
               outputText("培根");
            }
            outputText("奶昔，然后决定回家。");
            if(get_silly())
            {
               outputText("你他妈的爱死培根奶昔了。");
            }
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatDoggieStyle() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-fuck-her-doggie-style-repeat");
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("几分钟后，你把你的婊子带到了洗手间。墙壁两侧排列着镜子，让会员们可以观察自己已经走了多远，还有多远要走。今晚这里空无一人，不过为了以防万一，你还是锁上了门。你转过身，看到洛蒂蜷缩在角落里。她知道你想要什么——你向玛瑞斯那巨大的树奶发誓，你一定会得到它的。洛蒂赤裸的身体完全暴露在外，她悄悄地趴在地上，四肢着地，屁股对着你。她回头看到你那勃起的" + get_player().cockDescript(_loc1_) + "完全暴露在外，立刻尖叫着转过头去。你咧嘴一笑，抚摸着自己直到完全勃起，走过去站在洛蒂丰满的臀部后面。[say: [name]？]她轻轻地抽泣着，[say: 求、求你别这样。]说完，你抓住她丰满的大腿，向前挺进，将你的" + get_player().cockDescript(_loc1_) + "径直插入她紧绷湿润的小穴中。[pg]");
         outputText("当你感觉到她紧致的肉壁包裹着你的阴茎时，你呻吟出声，而洛蒂则因为感觉到你侵入她的私处而尖叫起来。你继续无情地挺进，一边享受地咕哝着，一边操着你的婊子，骂她是一头毫无价值的肥猪，并拍打着她的屁股，而她则尖叫和呻吟着。你看着你的荡妇，她拼命地想闭上眼睛，逃避发生在她身上的现实，但你的" + get_player().cockDescript(_loc1_) + "在她温暖的深处每一次抽插都在提醒她身在何处。洛蒂绝望地哭泣着，起初是求你停下来，后来是求救。对你来说幸运的是，洗手间的墙壁出奇地隔音，任何敲门声一出现就消失了。当你操着你的战利品时，你弯下腰，将身体压在这个胖乎乎的女孩身上，一只手绕过去挤压她柔软的乳房，另一只手支撑着你的体重。当你将" + get_player().cockDescript(_loc1_) + "插入她体内时，洛蒂不情愿地呻吟着，感觉你的坚硬在她的内壁上移动。她一直低着头看着地板，眼角余光看到她沉甸甸的乳房被你的双手挤压和拉扯。随着你更用力地操她，洛蒂的哭声和尖叫声变得越来越小，她的淫液润滑着你饥渴的肉棒。最终，你厌倦了让她四肢着地，一个利落的翻身，你把她翻转过来仰面躺着，向你展示她苍白的身躯。猪女孩尖叫着，用双手捂住脸，不想看到你操她湿透的小穴。你不是一个爱抱怨的人，而是专注于吸吮她的一个乳房，你的手揉捏着另一个。[pg]");
         outputText("随着你加快速度挺进洛蒂的小穴，你感到一种熟悉的感觉，你更用力地吸吮着，让自己越来越接近高潮的边缘。伴随着最后一次深深地挺进她的子宫，你向后仰去，将滚烫的精液释放在她体内，而她则拼命挣扎，大声抗议。在狂喜中，你抓住洛蒂的肩膀，把她拉到你身上，你的" + get_player().cockDescript(_loc1_) + "仍在她体内喷射着精液。你们俩躺在那里，洛蒂已经彻底崩溃，而你则抓住她那颤动的屁股，继续抽插了几分钟，享受着纯粹的极乐。[pg]");
         outputText("当你终于筋疲力尽时，你把洛蒂留在地板上。你的精液从她体内流出，而她躺在那里流着口水，对周围的环境毫无反应。你拍了拍她的屁股，开始走出健身房，并确保顺手拿走了一块");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("你他妈的爱死培根奶昔了。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatCowGirl() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-fuck-her-cowgirl-repeat");
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("几分钟后，你们俩都去了瑜伽室——在等洛蒂换衣服的时候，你已经铺好了一张垫子。你那红润的爱人蹦蹦跳跳地走进空荡荡、光线昏暗的房间，她丰满的大腿从一条超紧身短裤里挤出来，而她的乳房则溢出了运动内衣。你立刻被这极其色情的展示激起了性欲，洛蒂闻到了你越来越硬的阴茎的气味，咯咯地笑着，同时在你面前把她的乳房挤在一起。[say: 我猜你喜欢你看到的？]她发出满足的呼噜声，走到你身边，把你推倒在健身垫上。洛蒂迅速脱下你的下半身衣服，你的" + get_player().cockDescript(_loc1_) + "弹了出来，立正站好，她急忙抓住它，开始为你手淫。猪女孩把你的阴茎压在她湿润的裂缝上，来回摩擦，她的呻吟声充满了空荡荡的房间。你舒服地闷哼了一声，稍微扭动了一下臀部来帮助这个过程，作为回应，她弯下腰，把她溢出的乳房压在你的胸膛上。你伸出双手，拍打在她的屁股上，在她向你呻吟时摸索和挤压。女孩在极乐中颤抖，摩擦让她提前达到了高潮。[say: 我……我有个更好的东西给你，宝贝……]她喘着粗气，拉开短裤的开口，露出她泛红的小穴。洛蒂紧紧抓住你的" + get_player().cockDescript(_loc1_) + "，抬起身体，慢慢地把它降在上面，你的顶端分开了她的褶皱，进入了她火热的体内。当你感觉到她的内壁紧紧挤压着你的阴茎时，你发出一声闷哼，");
         if(get_player().cockArea(_loc1_) <= 40)
         {
            outputText("当你插到底时，她丰满的屁股贴在你的腹股沟上");
         }
         else
         {
            outputText("虽然你只能插到这么深，因为你的长度已经完全填满了她");
         }
         outputText("。你决定自己动手，抓住她粗壮的臀部向上猛顶，当你开始在她体内抽插时，洛蒂尖叫起来。猪女孩奶油般的乳房从内衣里弹出来，随着你的抽插而跳动，她肥胖的双腿夹在两边，在你身上弹跳。[say: 天哪，我-我爱你！嗯，我觉得好热，宝贝！]当你热情地操着你的爱人时，她大喊道。她丰满的屁股拍打你腹股沟的啪啪声弥漫在空气中，你的闷哼声伴随着洛蒂高潮的呻吟声。[pg]");
         outputText("当你感觉自己快要爆炸时，你紧紧抓住她的臀部，然后向前猛推，用你滚烫的精液填满她的体内。洛蒂在高潮中颤抖，你的精液在她体内的感觉把她推向了顶峰。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的另一根肉棒");
            if(get_player().cockTotal() == 2)
            {
               outputText("没有");
            }
            else
            {
               outputText("没有");
            }
            outputText("让你失望，将你的精华喷洒在猪娘身上。");
         }
         outputText("你们俩躺在垫子上，在狂喜中喘息，而你的" + get_player().cockDescript(_loc1_) + "继续在她的体内射精。[pg]");
         outputText("过了一会儿，你们互道晚安。在离开之前，你一定要去咖啡馆给自己买一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。");
         if(get_silly())
         {
            outputText("你喜欢培根奶昔。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieRepeatBackwardsAssCowgirl() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你们俩走进瑜伽区，迎面扑来的是弥漫在房间里的汗水和花香。洛蒂温柔地要求你仰面躺下，你很轻易地答应了。你很舒服，双手交叉放在脑后作为支撑，看着你的爱人慢慢向你走来。洛蒂转过身，粗壮的大腿跨坐在你身上，背对着你坐在你的腹股沟上，让你完美地欣赏到她曲线优美的身体和丰满的屁股。你的" + get_player().cockDescript(_loc1_) + "温柔地依偎在她玫瑰色的脸颊之间，随着女孩抓住她的臀部开始通过她的屁股取悦你，带着色情的意图跳动着。房间里的寂静被你狂热的喘息和咕哝声打破，洛蒂熟练的臀交让你陷入狂喜，她臀部的每一道曲线都在你肉棒的灼热下颤动。当她在你身上弹跳时，她的速度加快了，挤压和揉捏着她完美的屁股，直到最后一次在空中的抬起，她将你的长度深深地插进她火热的体内。你滚烫的鸡巴在她小穴里的感觉立刻让洛蒂陷入了性高潮的狂喜，强烈的热量让猪娘充满了快感。她试图继续的努力被你的" + get_player().cockDescript(_loc1_) + "刮擦着她的内壁所阻挠，她粗壮的大腿紧紧夹在一起，同时她在你身上缓慢地上下移动。决定自己掌握主动权，你向上挺动，几乎用你的力量把女孩推开，当你开始猛烈撞击她那不可抗拒的洞时，洛蒂发出了尖叫。她丰满的臀瓣随着你的每一个动作而颤动，她身体的起伏完全按照你的意愿移动。你抽插着，在这个火热而烦躁的女人体内保持着稳定的节奏。[pg]");
         outputText("不可避免地，你能感觉到你的释放正在逼近，伴随着最后一次推力，你抓住猪娘紧致的屁股，猛烈地撞击她，将你的精液直接泵入她紧闭的小穴，你的" + get_player().cockDescript(_loc1_) + "抽搐着，一串串精液涂满了她的体内。洛蒂发出一声尖叫，瘫倒在地板上，充满了你滚烫的种子。你顺着她的臀沟擦拭你的鸡巴，把她留在地板上，变成一个汗津津、充满精液的烂摊子。走出去时，你确保顺手拿了一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。味道棒极了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottiePool() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你经常在泳池边看到洛蒂，所以很自然地认为她可能对游泳很在行。你向这个猪女孩提起游泳，一想到要下水，她的耳朵就竖了起来。[say:当、当然！我去准备一下！]你不知道她是什么意思，在泳池边等着，双腿浸入凉爽湛蓝的水中。不久之后，洛蒂跑了出来，穿着你第一次见她时穿的那件大胆的黑色比基尼。她那晃动的乳房从布料中挤了出来，而她丰满的臀部和大腿则紧紧地贴着下半身的泳衣。感觉到腹股沟处一阵熟悉的拉伸感，你低头一看，发现你的[cocks]已经完全勃起，在你的[armor]下显得格外显眼。你脑海中闪过一个掩饰的念头，但还没等你开始思考这个想法，这个蹦蹦跳跳的女孩就一屁股坐在了你旁边。你想知道是直接跳进泳池比较容易，还是等它消退比较好——见鬼，她甚至可能会因为你的反应而感到受宠若惊。");
         menu();
         addButton(0,"跳水",jumpInPoolBeforeLottieSeesYourWingWang);
         addButton(1,"等待",waitAndShowLottieYourPoolBoner);
      }
      
      public function lottieMorale(param1:int = 0) : int
      {
         if(param1 == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280);
         }
         if(get_debug())
         {
            outputText("[pg]<b>(调试：洛蒂的士气改变了 " + param1 + "！)</b>[pg]");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,280,FlagDict_Impl_.arrayReadInt(_loc2_,280) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,280,100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,280,0);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280);
      }
      
      public function lottieMediumMorealeWeightGainAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉洛蒂你的方法从不失败，如果发生了不该发生的事情，那就是她的错。她抬起头看着你，对你的爆发感到震惊。她一时语塞，眼眶开始湿润。[say: 我……天哪，我太蠢了！当然是我！总是我！] 她暗自轻声哭泣，推开你放在她肩膀上的手，把头埋在臂弯里。[say: 我浪费了你的时间！我……我……] 在她说完之前，你离开了咖啡馆，对自己的所作所为感到满意。直到你离开健身房，返回营地，你都能听到她呜咽的声音——你感到一种莫名的满足。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieMediumMoraleWeightLossEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你祝贺她的成功，你很自豪她能这么快取得成果。洛蒂对你露出灿烂的笑容，显然也对这个消息感到兴奋。你问她是否想在桑拿房和你见面做些“拉伸”——你重重地强调了最后两个字，同时用手指做出了夸张的引号手势。[say:哈哈，对不起[name]，但说实话，上次我们拉伸后我的身体还在疼。我们，呃，现在做些常规运动可以吗？]你们俩都笑了，尽管你完全是认真的想在桑拿房里干她。无论如何，你决定先放一放，告诉她你要去跑道，如果她愿意加入你的话。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(4);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieMediumMoraleWeightLossAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对洛蒂冷笑，严厉地提醒她，她现在的样子离她的目标还差得远——而且几磅的体重改变不了任何事情。事实上，她可能只是在早上量了体重，而且像她这样的猪，很可能根本没有减掉任何体重。洛蒂似乎无话可说。她盯着你，想知道这一切是从哪里来的。几秒钟的沉默后，她开始抽泣，从椅子上站起来，跑出了健身房。不过你知道她会回来的。决定在这里结束，你返回了营地——感到一种奇怪的满足感。[pg]");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieMediumMoraleWeightGainEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉她这不是她的错；这些事情总是因为各种原因发生。她的体重偶尔会有波动，这完全是正常的。她抬起头看着你，眼眶微微湿润。[say: 真的吗？这完全正常吗？] 你点点头。[say: 我很高兴。我太高兴了。] 她吸了吸鼻子，擦去眼泪，深吸了一口气。当她把手放在你的手上时，你揉了揉她的肩膀。洛蒂继续谈论她的一天，几分钟后你们决定去跑道上锻炼。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieLowMorealeWeightGainAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你加重了捏住洛蒂脸颊的力道，一边低吼一边将她拉向你。她尖叫起来，为自己的无能一遍又一遍地道歉——但这还不够。永远都不够。你松开捏住她下巴的手，她退缩了一下，试图揉搓以缓解疼痛。你环顾四周，看看有没有好奇的人在看你，但据你所知，这个时候整个咖啡馆里唯一的人就是那个谢天谢地正在休息的店员。在没有目击者的情况下，你离开座位走向洛蒂，她迅速从座位上跳起来，向后退去。你低吼着让她过来，但她只是畏缩着作为回应。你迅速冲到她身边，抓住她的手臂。她随时都可能大叫，但你知道她不会——她很软弱，很依赖你。你是唯一能把她从这具身体里拯救出来的人。而现在，你打算告诉她，拒绝你会有什么下场。啪！你反手扇这个母猪婊子耳光的声音响彻整个咖啡馆，尽管洛蒂瘫倒在地上抽泣成一团，却没有一个人看到。你低吼着让她站起来，她照做了。你还有些锻炼要补上。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(-10);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieLowMoraleWeightLossEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你祝贺她的成功，事实上——你几乎可以说你对她的结果非常满意。洛蒂明显感到困惑，没想到你会作何反应。不管怎样，她接受了你的赞美，开心地尖叫起来，把你的手指放进她温暖的嘴里轻轻吮吸。你抽出手，轻轻拍了拍她的头。[say: 谢、谢谢……谢谢你，[name]。] 你们相视一笑，洛蒂对你异常热情的态度感到放松。你站起来，告诉她你要去跑道上锻炼，问她是否愿意加入——当然，洛蒂急切地跟了上来。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieLowMoraleWeightLossAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对洛蒂冷笑，提醒她为减掉一点体重而兴奋是个糟糕的主意——这会让她变得懒惰。你讨厌懒惰的人。洛蒂的脸痛苦地皱了起来，她自责着，并向你发出无用的道歉呻吟。但你告诉她，这根本不够。你决定亲自动手，你走过去，洛蒂已经预料到接下来会发生什么，在座位上缩成一团。你迅速抓住她的头，把它扭向你的方向，导致洛蒂无助地大叫作为回应——尽管你立刻用一个吻封住了她的嘴。她惊呆了，对你的举动感到惊讶，这给了你足够的时间用手背把她打出座位。当你走出咖啡馆准备返回营地时，她大声抽泣着——而你却感到一种奇怪的满足感。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieLowMoraleWeightGainEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉她不应该哭泣，也不用担心——有时候，这种事情是会发生的；效果不可能在最初的几周就奇迹般地显现，对吧？她的体重难免会有所波动，这完全是自然现象。她抬起头看着你，对你的语气感到困惑，但同时又松了一口气。[say:我……好吧。谢……谢谢你，[name]。]你点点头，微笑着摆摆手表示没什么。她吸了吸鼻子，擦去眼泪，深吸了一口气。你松开捏着她下巴的手，她明显放松了许多。洛蒂继续保持放松的状态几分钟后，你们决定去跑道上锻炼。[pg]");
         outputText("<b>...</b>在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightLossFATTYLOVESIT() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你揉了揉她的肩膀，告诉她不应该为自己的身体感到羞耻——无论她是胖是瘦，你都会爱她本来的样子，她也应该如此。洛蒂轻笑了一声，然后把手放在你的手上。[say:你知道，你真的很知道如何让一个女孩对她自己感觉更好，[name]。即使只是一两句话，我——它真的很有帮助。谢谢。]你点头同意，然后在她的额头上啄了一下，带她去了跑道。你觉得稍微锻炼一下有助于理清她的思绪。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(4);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightLossFATTYLOVESABUSE() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对洛蒂皱起眉头，显然对她突然的体重减轻感到不舒服。你收紧了抓着她肩膀的手，然后她退缩并甩开了你。[say:是……有什么不对吗，[name]？]她站起来面对你问道。她担忧地皱起眉头——她显然是想告诉你这些以获得一些支持，但这正是你无法原谅的。你告诉她，你花了一些时间才爱上她现在的样子，如果她突然决定改变自己的身体，那么你不确定她想要什么。洛蒂看起来很震惊，但突然反驳道。[say:听着，我没有——我只是想让你接受我现在的样子……以及我可能成为的样子。没有别的——如果你对我现在的样子不满意，那么……那么……]你打断了她，只是抓住她的耳朵，把她拉得足够近，让她听到你的耳语。如果你对她现在的样子不满意，你告诉她，那么你不确定你会做什么。她瘫坐在椅子上，然后你咆哮着说你需要做些运动。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightLossEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你祝贺她的成功，你很自豪她真的习惯了持续的锻炼。洛蒂对你露出灿烂的笑容，显然也对这个消息感到兴奋。你问她是否想在桑拿房和你见面做些“拉伸”——你重重地强调了最后两个字，同时用手指做出了夸张的引号手势。[say:哈哈，对不起[name]，但说实话，上次我们拉伸后我的身体还在疼。我们，呃，现在做些常规运动可以吗？]你们俩都笑了，尽管你完全是认真的想在桑拿房里干她。无论如何，你决定先放一放，告诉她你要去跑道，如果她愿意加入你的话。[pg]");
         outputText("<b>...</b>在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(4);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightLossAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对洛蒂皱起眉头，显然对她对结果的急切反应感到不舒服。你收紧了抓着她肩膀的手，然后她退缩并甩开了你。[say:是……有什么不对吗，[name]？]她站起来面对你问道。她担忧地皱起眉头——你难道不应该高兴吗？但你就是不高兴。你告诉她，对结果感到轻松只会导致一个方向——懒惰。而你讨厌懒惰。尽管如此，洛蒂继续为她的立场辩护。[say:听着，我不知道你怎么了，但是……但是我很满意。如果你不满意，那——那对你来说太糟糕了！]太糟糕了，你想，同时你一拳打在洛蒂的肚子上，导致她痛苦地倒退。你告诉她，感情会阻碍进步，如果她不能控制自己的情绪——那对她来说就太糟糕了。[pg]");
         outputText("决定在这里结束，你返回了营地——感到一种奇怪的满足感。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightGainFATTYLOVESIT() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉她，这种事情从来都不是她的错；即使偶尔感到沮丧也没关系，但让事情影响到她只会带来更多问题，而不是解决问题。她的体重永远不应该是个问题——即使它确实有波动，那又怎样？你依然爱她。她抬起头看着你，当你提到“爱”这个词时，她脸红了。[say: [name]，我……我也爱你，宝贝！] 她喊道，跳起来拥抱你，在你的嘴唇上印下重重的一吻。你笑着点头表示同意，尽管你觉得相当尴尬。[say: 我很高兴。我太高兴了。] 她叹了口气，深吸了一口气。你们拥抱了几秒钟才坐下。洛蒂继续谈论她的一天，几分钟后你们决定去跑道上锻炼。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightGainFATTYLOVESABUSE() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你皱起眉头，加重了捏住她肩膀的力道。[say: 嘿、嘿，你这是干什么？] 她问道，拂开你的手，站起来面对你。[say: 我知道你可能和我一样烦躁，但没理由开始耍混蛋，你知道吗？] 但你确实知道，你告诉她，对她的爆发咬牙切齿。你知道如果没有适当的纪律，这只会导致一种结果。她艰难地咽了口唾沫，想知道你打算把谈话引向什么方向。但你没打算再多说。你动作敏捷地向前猛扑，一拳直接打在洛蒂的肚子上，让她喘不过气来，这个猪女孩痛苦地倒在地上扭动着。你告诉她，你喜欢操她多汁的猪脂肪，但如果她识相的话，她会停止继续长胖。她对着你默默地抽泣。[pg]");
         outputText("决定在这里结束，你返回了营地——感到一种奇怪的满足感。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightGainEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉她，这种事情从来都不是她的错；感到沮丧是完全可以的——只要这不影响她的主要目标。她的体重偶尔会有波动，这完全是正常的。她抬起头看着你，因为你友善的话语而笑容满面。[say: [name]，你真的很知道怎么让人感觉好点，你知道吗？] 你点头表示同意——你当然知道。[say: 我很高兴。我太高兴了。] 她叹了口气，深吸了一口气。当她把手放在你的手上时，你揉了揉她的肩膀。洛蒂继续谈论她的一天，几分钟后你们决定去跑道上锻炼。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleWeightGainAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你皱起眉头，加重了捏住她肩膀的力道。[say: 嘿、嘿，你这是干什么？] 她问道，拂开你的手，站起来面对你。[say: 我知道你可能和我一样烦躁，但没理由开始耍混蛋，你知道吗？] 但你确实知道，你告诉她，对她的爆发咬牙切齿。你知道如果没有适当的纪律，这只会导致一种结果。她艰难地咽了口唾沫，想知道你打算把谈话引向什么方向。但你没打算再多说。你动作敏捷地向前猛扑，一拳直接打在洛蒂的肚子上，让她喘不过气来，这个猪女孩痛苦地倒在地上扭动着。你告诉她，如果她识相的话，就别再长胖了。她对着你默默地抽泣。[pg]");
         outputText("决定在这里结束，你返回了营地——感到一种奇怪的满足感。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleFatYoullGetThereOneTimeEvent() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你告诉洛蒂，她现在的样子不应该影响她对自己的感觉——她的价值不是由她的体重决定的，永远也不会。你拍了拍她的手，然后对她竖起大拇指。你相信她，你也相信她的目标，无论这是否会让她更好地欣赏自己或她的身体。她被你的话安抚了，轻轻地抚摸着你的手。你向女孩明确表示，你不会因为她的长相而离开她，因为她在重要的地方很美。洛蒂融化了，因为你的赞美而脸红。[say: 哦，" + get_player().get_short() + "，有时我希望我能像你一样勇敢，你知道吗？] 她惊呼道，礼貌地叹了口气。继续你的长篇大论，你解释了她所需要的只是一点自信来让她前进——她不能害怕跳入深渊去得到她想要的东西，对吧？她对你的热情咯咯地笑，但也考虑了你的话。[say: 自信，嗯？] 洛蒂喃喃自语。[say: [name]……你能跟我来一下吗？][pg]");
         outputText("你跟着洛蒂来到泳池区，等她走进更衣室换衣服。然而，当她出来时，你惊讶地发现她什么都没换——事实上，她把衣服全脱了！[pg]");
         outputText("赤身裸体的猪娘站在你面前，面对你饥渴的目光，她的脸涨得通红。[say: 我对自己的身体还是不太自信，但是……如果自信是得到我想要的东西的关键，那么……你会操我吗，[name]？][pg]");
         outputText("仅仅几秒钟，你就脱光了衣服扑向这只小猪，掏出你的" + get_player().cockDescript(_loc1_) + "，顶在洛蒂湿润的缝隙上。猪娘仰面躺着，双腿搭在你的肩膀上。你用力一挺，将自己送入她的体内，用你的肉棒在她的体内翻江倒海，惹得她发出一声大声的娇喘。当你弯下腰，色眯眯地抓住她的双峰，吸吮着她的一侧乳头，捏着另一侧时，她粗壮的大腿拍打着你，她甜美的味道包围了你的口腔。洛蒂将你埋在她的乳沟里，当你把她紧致的小穴操得服服帖帖时，她尖叫起来——但你还有更多花样。你把她翻过身来，洛蒂趴在地上，柔软的屁股撅在半空中，你坚持不懈的抽插让她发狂。你继续抓着她的奶子，同时猛烈地撞击她的肉体，每一次抽插都伴随着她愉悦的娇喘。你来回地骑弄着她，直到你下体熟悉的肿胀感预示着你的释放。你加快了速度，猛烈地捣弄着她的小穴，直到你向后仰起头，射在她的内壁上，每隔几秒钟就伴随着每一次爆发，更用力地撞击进去。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的另一根肉棒");
            if(get_player().cockTotal() == 2)
            {
               outputText("抽搐着");
            }
            else
            {
               outputText("抽搐着");
            }
            outputText("在狂喜中，将精液释放到她丰满的屁股上。");
         }
         outputText("[pg]");
         outputText("洛蒂大汗淋漓地喘着粗气，躺在地板上，筋疲力尽，体内充满了你的精液。你拍了拍她摇晃的屁股，然后走出泳池区，出去的时候一定要拿一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("真他妈的好吃。");
         }
         outputText("[pg]");
         outputText("(<i>\'快餐\'已在洛蒂的性爱菜单中解锁。</i>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,314,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3),DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieHighMoraleFatLoveSelfOneTimeEvent() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你开始讲述你的故事，你是如何来到玛瑞斯的，以及你是如何走到今天这一步的。你遇到过恶心的事情，你也见过人们自己变成恶心的东西。你也知道从那以后你已经改变了。你变成了你一百万年也想不到自己会变成的人——而这是好是坏，由你自己决定。你知道你经历过艰难的时期，但你从未后悔过你所做的决定——因为它们把你引向了她。引向了洛蒂。听到你的告白，女孩开始流泪。[say: 哦，[name]，我……] 但你继续你的故事。你告诉她，无论她长什么样，无论发生什么——你都会永远爱她本来的样子。但最重要的事情，她绝对需要记住的最重要的事情，是她需要爱自己——因为只要她爱自己，你就永远不会停止爱她。此时，洛蒂喜极而泣，满是泪痕的脸上绽放出笑容。[say: 你这个笨蛋！你这个大笨蛋！] 她笑着，从座位上跑出来，在你的嘴唇上印下一个吻，并把你拉进怀里。[say: 我也爱你，] 她发出咕噜声，依偎在你温暖的怀抱中，这个拥抱似乎持续了一个小时。你不确定你是否完全帮助她克服了自我意识，但从她的反应来看，你似乎极大地改善了她的情绪。你们俩在咖啡馆里聊了一会儿，然后决定去瑜伽室伸展一下——你铺好垫子等洛蒂换衣服，这时女孩走进来，给了你一个惊喜。[pg]");
         outputText("你那红润的爱人蹦蹦跳跳地走进空荡荡、灯光昏暗的房间，她丰满的大腿从一条超紧身短裤里挤出来，而她的乳房则溢出了运动内衣。你立刻被这极其色情的展示激起了性欲，洛蒂闻到了你越来越硬的阴茎的气味，咯咯地笑着，同时在你面前把她的乳房挤在一起。[say: 我猜你喜欢你看到的？] 她发出咕噜声，走到你身边，把你推倒在健身垫上。洛蒂迅速脱下你的下装，你的" + get_player().cockDescript(_loc1_) + "弹了出来，立正站好，她急忙抓住它，开始为你手淫。猪女孩把你的阴茎压在她湿润的裂缝上，来回摩擦，她的呻吟声充满了空荡荡的房间。你舒服地咕哝着，稍微扭动臀部来帮助这个过程，作为回应，她弯下腰，把她溢出的乳房压在你的胸膛上。你伸出手，拍打在她的屁股上，摸索和挤压，而她则在你身上呻吟。女孩在幸福中颤抖，因为摩擦让她提前达到了高潮。[say: 我……我有更好的东西给你，宝贝……] 她喘息着，拉开短裤的开口，露出她泛红的小穴。洛蒂紧紧抓住你的" + get_player().cockDescript(_loc1_) + "，抬起自己，慢慢地把身体降在上面，你的龟头分开她的褶皱，进入她火热的体内。你因为她的内壁紧紧挤压你的阴茎的感觉而咕哝，");
         if(get_player().cockArea(_loc1_) <= 40)
         {
            outputText("当你插到底时，她丰满的屁股贴在你的腹股沟上");
         }
         else
         {
            outputText("虽然你只能插到这么深，因为你的长度已经完全填满了她");
         }
         outputText("。你决定自己动手，抓住她粗壮的臀部向上猛顶，当你开始在她体内抽插时，洛蒂尖叫起来。猪女孩奶油般的乳房从内衣里弹出来，随着你的抽插而跳动，她肥胖的双腿夹在两边，在你身上弹跳。[say: 天哪，我-我爱你！嗯，我觉得好热，宝贝！]当你热情地操着你的爱人时，她大喊道。她丰满的屁股拍打你腹股沟的啪啪声弥漫在空气中，你的闷哼声伴随着洛蒂高潮的呻吟声。[pg]");
         outputText("当你感觉自己快要爆炸时，你紧紧抓住她的臀部，然后向前猛推，用你滚烫的精液填满她的体内。洛蒂在高潮中颤抖，你的精液在她体内的感觉把她推向了顶峰。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的另一根肉棒");
            if(get_player().cockTotal() == 2)
            {
               outputText("没有");
            }
            else
            {
               outputText("没有");
            }
            outputText("让你失望，将你的精华喷洒在猪娘身上。");
         }
         outputText("你们俩躺在垫子上，在狂喜中喘息，而你的" + get_player().cockDescript(_loc1_) + "继续在她的体内射精。[pg]");
         outputText("过了一会儿，你们俩都互道了晚安。");
         if(get_silly())
         {
            outputText("在你离开之前，你确保去咖啡馆给自己买了一杯培根奶昔。你喜欢培根奶昔。[pg]");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("(<i>从洛蒂的性爱菜单中解锁了“女上位”。</i>)");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3),DynStat.Cor(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,313,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieFuck() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         if(lottieMorale() <= 40)
         {
            outputText("你握住洛蒂的手，但女孩似乎对你的触碰感到退缩。[say:我……我做错什么了吗？]她问道，慢慢地缩回座位里。你选择不回答，尽管你们都知道接下来会发生什么。你默默地加重了握住洛蒂的力道，把她从座位上拉起来，带到泳池区，检查了一下有没有旁观者，然后把她带进一个空桑拿房。当你在她面前脱下衣服，掏出[onecock]轻轻抚弄时，洛蒂变得越来越焦虑。当你转向她，要求她也这么做时，她似乎退缩了。[say:求、求求你，" + get_player().get_short() + "……我……我喜欢我们正在做的事，但是，]她避开你渴望的目光，然后嘟囔道，[say:我想和一个特别的人做这种事。]你皱起眉头——看来你又得亲自动手了。你走向这个淫荡的猪娘，抓住她上衣的下摆往下拉，一把扯掉，露出她急忙用手臂遮挡的双乳。[say:不、不要！我……求求你，求求你别这样……]你抓住你的" + get_player().cockDescript(_loc1_) + "，走近她，近到她能感觉到你呼出的热气喷在她的皮肤上。你把" + get_player().cockDescript(_loc1_) + "的顶端在柔软的肉体上摩擦，随着你缓慢地抽插，先列腺液流到了她的肚子上。你天然的体味钻进洛蒂小巧的鼻子里，她越来越急促的呼吸向你发出信号，表明她已经准备好向你狂暴的欲望屈服了。[say:但是[name]，我……我爱……]一声响亮的巴掌声响起，你按压并把玩着她的臀部，在奶油般的大腿间摩擦着你的肉棒。[say:我……爱……]啪！你狠狠地打她的屁股，在她的双腿间用力抽插。[say:操、操！我太爱你了！]粉红色的婊子哭喊着，脱下短裤转过身来，抓住你的" + get_player().cockDescript(_loc1_) + "，在湿润的入口处摩擦。你对自己的成功咧嘴一笑，但你还不打算满足她的需求。你继续操弄她的大腿，时不时地拍打她丰满的臀部，换来一声声尖叫。你俯下身，抓住她起伏的乳房，粗暴地揉捏着，伴随着你的骨盆拍打在她肥胖双腿上的声音。你的" + get_player().cockDescript(_loc1_) + "被洛蒂的大腿夹紧的感觉几乎让你达到高潮，直到你想到一个更好的主意。[pg]");
            outputText("你把洛蒂转过来面对你，告诉她你决定带她做一次剧烈的运动。她只是满怀期待地喘息着。");
            menu();
            addButton(0,"肛交",analLottieMilkshake);
            addButton(1,"口交",getSuckedOffByAHamSandwich);
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,306) == 2)
            {
               addButton(2,"触手",tentaDickLottieButtFuckbuttFuckButtFUCKBUTTFUCKBUTTFUCK);
            }
            else
            {
               addButtonDisabled(2,"触手");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,310) > 0)
            {
               addButton(5,"后入",lottieRepeatDoggieStyle);
            }
            else
            {
               addButtonDisabled(5,"后入式");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,311) > 0)
            {
               addButton(6,"散步",lottieRepeatWalkies);
            }
            else
            {
               addButtonDisabled(6,"散步");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,316) > 0)
            {
               addButton(7,"三人行",lottieRepeatThreesome);
            }
            else
            {
               addButtonDisabled(7,"三人行");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,317) > 0)
            {
               addButton(8,"NTR",lottieRepeatSUPERNEATORARES);
            }
            else
            {
               addButtonDisabled(8,"NTR");
            }
            if(get_silly() && get_player().hasCock())
            {
               addButton(9,"30分钟",lottiesThirtyMinutePigGasm);
            }
         }
         else if(lottieMorale() <= 60)
         {
            outputText("你问洛蒂想不想来点“课外运动”，这让猪娘咯咯笑了起来，还歪了歪头。[say:你什么意思，" + get_player().mf("大个子","宝贝") + "？]她问道。你叹了口气，站起身来，露出你正在变硬的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。[say:我……哦。]你牵起洛蒂的手，迅速带她离开咖啡馆，来到泳池区，寻找一间空桑拿房溜进去。考虑到健身房的泳池只有少数半水生人形生物和偶尔出现的");
            if(get_silly())
            {
               outputText("街头");
            }
            outputText("鲨鱼使用，你们的寻找并不困难。跳进温暖的房间，你迅速脱下衣服，洛蒂仍然站在门口。[say:嘿、嘿，你知道的，我其实并没有同意这个或、或者其他什么……]她结结巴巴地说，紧张地摆弄着她的上衣。你毫不迟疑地走向她，在她丰满的嘴唇上印下一吻，用你急切的舌头探索她的口腔，品尝她的甜美。女孩在你的抚摸下融化了，热情地回应着你色情的举动，而你趁机脱下洛蒂的上衣，把手伸进她的短裤，在她丰满的臀部之间摸索。当你慢慢将两根手指推入她湿润的深处时，她呻吟起来，同时你掏出你的" + get_player().cockDescript(_loc1_) + "并将她推到墙上。洛蒂开始慢慢地为你手淫，一只手按摩着你" + get_player().cockDescript(_loc1_) + "的长度，另一只手则小心翼翼地轻抚你的龟头。你开始本能地在她的手中挺动，同时占据她的嘴，她甜美的舌头缠绕着你的舌头，让你们俩都陷入了渴求的欲望之中。你用手环抱住她，揉捏她胖乎乎的臀部，轻轻拍打它，同时一只手伸向她火热欲望的源泉。你的手在她的湿润处滑动，洛蒂在你的嘴里呻吟，而你努力让她早点达到高潮。然而，你的手在她阴阜上突然的粗暴动作只是让她快速地撸动你的" + get_player().cockDescript(_loc1_) + "，她柔软的手紧紧握住你的肉棒。你呻吟着回应，从她的嘴唇上移开，转而将自己的嘴唇贴在她挺立的乳头上，用力吸吮。这个猪荡妇抓住你的头，把你推向她起伏的胸膛，松开握住你阴茎的手，把你抱得更紧。[pg]");
            outputText("不想留下遗憾，你告诉她你决定带她做一次剧烈的运动。她只能充满期待地喘息着。");
            menu();
            addButton(0,"肛交",analLottieMilkshake);
            addButton(1,"口交",getSuckedOffByAHamSandwich);
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,306) == 2)
            {
               addButton(2,"触手",tentaDickLottieButtFuckbuttFuckButtFUCKBUTTFUCKBUTTFUCK);
            }
            else
            {
               addButtonDisabled(2,"触手");
            }
            if(get_silly() && get_player().hasCock())
            {
               addButton(3,"30分钟",lottiesThirtyMinutePigGasm);
            }
         }
         else
         {
            outputText("你握住洛蒂的手，这让她脸上泛起了一丝红晕。[say:[name]？]她刚开口，就被你在嘴唇上轻轻一啄打断了。洛蒂脸红了，微微咯咯笑着，环顾四周看有没有旁观者。[say:这是怎么了，宝贝？]她笑容满面，在你的手指间旋转抚摸着。你告诉她，你觉得她只是需要多一点“特殊运动”来帮助血液循环——并确保用夸张的空气引号强调[say:特殊运动]。她调皮地推开你愚蠢的手势，把你从座位上拉起来，带路走进泳池区，进入其中一间空桑拿房。锁上身后的门，她转过身来面对你和你正在变硬的胯部。[say:我觉得你有点太兴奋了，宝贝，]她发出咕噜声，她的自信占了上风，她向前迈了一步，但你才是掌控局势的人。抓住洛蒂的臀部，你把她转过去面对墙壁，用你正在变硬的长度摩擦");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("她丰满的臀瓣。[say:哇、哇！我……好吧，好的……]她呻吟着，向后伸手隔着衣服抚摸你的" + get_player().cockDescript(_loc1_) + "，而你抓起一把她红润的屁股，在你的手掌上拍打揉捏。你继续无情地在洛蒂紧身的短裤上摩擦，偶尔伸手去摸她火热的阴阜，让她撅起的嘴唇发出奇怪的尖叫或呻吟。最终决定衣服是洛蒂淫荡的身材和你自己的" + get_player().cockDescript(_loc1_) + "之间唯一的障碍，你同时脱下自己的衣服，撕下她汗湿的上衣，让她的乳房溢出到你急切摸索的手中。尽管你突然脱衣服，洛蒂还是立刻回到了位置，把你的阴茎放在她枕头般的臀瓣之间，一边呻吟一边让你弹拨和挑逗她肿胀的乳头，在你身上前后摇摆。[pg]");
            outputText("洛蒂在短促而灼热的呼吸间呜咽着，[say:你快把我逼疯了，宝贝……]你在她胖乎乎的屁股上狠狠地拍了一巴掌表示同意。洛蒂高兴地尖叫起来，当你的" + get_player().cockDescript(_loc1_) + "从她的屁股里探出头来时，她撸动着它。你的龟头摩擦着她天鹅绒般肌肤的感觉让你发狂。[pg]");
            outputText("你把洛蒂转过来面对你，告诉她你决定带她做一次剧烈的运动。[say:我会让你好好运动的，宝贝，]她呻吟着回应。");
            menu();
            addButton(0,"肛交",analLottieMilkshake);
            addButton(1,"口交",getSuckedOffByAHamSandwich);
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,306) == 2)
            {
               addButton(2,"触手",tentaDickLottieButtFuckbuttFuckButtFUCKBUTTFUCKBUTTFUCK);
            }
            else
            {
               addButtonDisabled(2,"触手");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,314) > 0)
            {
               addButton(3,"快餐",lottieRepeatQuickie);
            }
            else
            {
               addButtonDisabled(3,"快餐");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,313) > 0)
            {
               addButton(4,"女上位",lottieRepeatCowGirl);
            }
            else
            {
               addButtonDisabled(4,"女上位");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,320) > 0)
            {
               addButton(5,"R.Cowgirl",lottieRepeatBackwardsAssCowgirl);
            }
            else
            {
               addButtonDisabled(5,"R.Cowgirl");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,319) > 0)
            {
               addButton(6,"女上位",lottieRepeatFEMDOMFEMFDOM);
            }
            else
            {
               addButtonDisabled(6,"女上位");
            }
            if(get_silly() && get_player().hasCock())
            {
               addButton(7,"30分钟",lottiesThirtyMinutePigGasm);
            }
         }
         dynStats(DynStat.Lust(50));
      }
      
      public function lottieFatLoserCulminationLeaveComedyChoice() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你看了她一眼，然后提出了你的要求。你告诉她，你想让这个猪婊子离开健身房，永远不要回来。她盯着你，说不出话来，但立刻开始在你脚边大哭。你觉得待在这里很好——但你再也不想看到她的脸了。不管怎么说，当你把她抱起来带出健身房时，这个女孩出奇地轻。她浑身发抖，害怕没有你的生活——所以你会给她一些东西来记住你。现在洛蒂站了起来，流着泪可怜地走开了，但你已经追上了她，脱下裤子，摇摇晃晃地朝她的方向走去，你的[cock]来回摆动。在她注意到之前，你已经把你的整个包裹都塞进了她体内，尽可能多地塞进去，然后无情地抽插。她尖叫起来，引起了附近一个守夜警卫的注意——但你还没有结束。你拔出你湿润的阴茎，瞄准正在靠近的警卫。你皱起眉头，大喊出你最后的决心。[say: 接招吧——我的爱，我的愤怒，还有我所有的悲伤！精——液——加——农——炮！] 伴随着一声有力的挺进，你把你的家伙向前猛推，朝着那个男人的方向喷射出不可思议的粘稠精液，把他炸飞到空中，飞出了特尔阿德雷的城墙。[say: 冲！冲！冲！] 你大喊着，向敌人喷射你的精液，直到他最终像血腥的烟花一样爆裂成血肉模糊的碎片。你转过头，看到洛蒂蜷缩在地板上。你咧嘴一笑，最后一次插进她的小穴，射出少量极其强效的精液，然后走开，留下被虐待和崩溃的她，同时你向一面想象中的美国国旗敬礼。你流下了一滴眼泪。[pg]");
         outputText("很久以后你才发现她怀孕了，怀着你的孩子痛苦不堪。");
         outputText("[pg](<i>洛蒂不再可遭遇</i>。)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,278,1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(10));
         var _temp_1:* = get_player();
         _temp_1.cumMultiplier = _temp_1.cumMultiplier + 100;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieFatLoserCulminationHumiliationChoice() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("几分钟后，你把你的婊子带到了健身房外面，绕到了后面，那里有一个设备棚。你用附近的一根金属杆迅速砸开了锁。你们俩慢慢走进去，洛蒂在你身后停下，凝视着散落在墙上的工具和健身器材。很快，你找到了你要找的东西。你从来不是一个会评判别人性癖的人，但你在心里默默感谢那个无法控制自己欲望的人。一条连着牵引绳的皮项圈静静地挂在棚子墙上的钩子上。你咧嘴一笑，把它取下来，调整了一下绳子的长度，然后递给洛蒂。[say:这、这是干什么用的，[sir]？]她嘟囔着，但你没有理会她的疑问，而是松开项圈，把它套在女孩的脖子上，在她抗议之前收紧。[say:不、不要！你在干——！]啪！你一巴掌扇在她柔软的脸颊上，她猛地扯了一下绳子，摔倒在地，痛苦又可怜。你的荡妇慢慢抬起头看着你，眼里噙着泪水，一只手捂着脸，试图缓解刺痛感。[say:我……我明白了，]她小声嘟囔着，捡起牵引绳放在你手里，然后跪在地上，在你面前摆出乞求的姿势。你咕哝了一声，女孩伸出小舌头，不情愿地舔着你的腹股沟，试图满足你衣服后面的野兽。就像个婊子一样，以为你就是为了这个来的。你走开，不理会她试图给你口交的举动，拉着牵引绳，把你的女孩往前拽。她站起来，开始跟在你后面走到阳光下，然后你再次拦住她。不，你告诉她——她必须脱光衣服才能见人。你想让全世界都知道你把你的胖小猪训练得多好。[pg]");
         outputText("洛蒂怯生生地脱下上衣，丰满的乳房随之掉出，接着她弯下腰拉下紧身短裤，多汁的屁股从布料中挤了出来。在她脱衣服的时候，你回头看了看棚子，看看有没有漏掉什么。重物、长杆、鞭子、一些绳——等等，鞭子？你邪恶地笑着走过去想把它捡起来，却发现它被牢牢地粘在架子上。真奇怪。仔细一看，你发现旁边有一个奇特的装置。那似乎是一条连着金属环的带子——这让你有了一个主意。“有鞭子的地方，就有办法”，你暗自轻笑，拿起带子走到洛蒂身边。你的小母猪已经赤身裸体，准备就绪，等待着你的命令。你拿出那个环形装置，把带子套在她的头上，将金属环塞进她的嘴里，强迫这个苍白的荡妇用嘴唇做出一个永久的“O”形。你收紧口塞，导致洛蒂不舒服地咳嗽起来，口水在她的嘴底积聚。你拉着牵引绳，把洛蒂从棚子里拖出来，她的大屁股在试图追赶你时摇晃着。你打算带她去特尔阿德雷的后街——你想让人们看看你的艺术品，但你知道只有这个城市的渣滓才会真正欣赏她的本来面目。你拉着牵引绳，带领洛蒂穿过一条小巷，进入这个沙漠城市中一个更小、更脏的地方，这是一个封闭的区域，周围散落着几个食品摊。大多数下层市民都在这些地方游荡，他们一边讨价还价、争吵和偷窃，一边拖着脚步走来走去——这在贫民窟是司空见惯的。大多数人都注意到了跟在你后面的猪女孩，但很少有人多看一眼。当你展示你的战利品时，大多数人都站着盯着看——一些比较勇敢的人甚至公然对着这个场景自慰，而更勇敢的人则走上前去拍打你的猪的屁股，引来一阵尖叫或呻吟。你决定在穿过公共厅时加大赌注，把一只手放在洛蒂苍白的大腿之间，将两根手指插入她的小穴，当你不知羞耻地指奸这个可怜的女孩时，热量包围了你的手指。[pg]");
         if(get_npcSettings().urtaDisabled)
         {
            outputText("在散步时，你发现自己来到了一个熟悉的地方——湿身婊酒馆的后巷。觉得把你的荡妇带进去也无妨；你猛地把手往前一伸，强迫洛蒂走向门口——这时你注意到一个正在疯狂自慰的醉汉。那人一边看着你，一边无情地抽插着他粗大的肉棒，并对你现在用皮带拴着的母猪荡妇眨了眨眼。");
            if(get_silly())
            {
               outputText("[say: 培根 培根 培根 培根 培根 培根！我要吃培根！]");
            }
            else
            {
               outputText("[say: 嘿嘿 *嗝* 伙计，她是你 *嗝* 性奴还是什么人？]");
            }
            outputText("你觉得他说得对。你把沾满淫液的手指从她的小穴里抽出来，把洛蒂推向那个肮脏的流浪汉，拽着项圈把她往后拉，让她摔倒在地。当她试图爬起来时，男人的大肉棒拍打在她的鼻子上，女孩发出一声尖叫。你掏出自己的" + get_player().cockDescript(_loc1_) + "，命令她保持四肢着地——只要你占有她的后穴，你才不在乎那个老头对她的脸做什么。他开始用龟头摩擦你这个荡妇丰满的嘴唇，他先列腺液的气味诱惑着洛蒂，让她在湿润的顶端轻轻舔舐。你不想被冷落，用力抓住她的臀部，将你的" + get_player().cockDescript(_loc1_) + "径直滑入荡妇温暖的洞穴，当你感觉到她的肉壁紧紧包裹住你时，你发出一声呻吟。当她的臀部突然向后猛推时，你猛地抽动了一下，你瞥了一眼，发现那个醉汉正尽可能深地把粗大的肉棒埋进女孩的嘴里。你们俩对视了一眼，互相点了点头，然后你们俩都把肉棒插进这个抽泣的母猪婊子体内，前后摇晃。男人呻吟着，一手按住洛蒂的后脑勺，另一只手把啤酒胡乱地倒进自己嘴里。在你的奴隶的另一端，你紧紧抓住她肥大的屁股，无情地操着，因为它们拍打你腹股沟的快感而气喘吁吁。男人发出一声响亮的呻吟，然后尽可能地把洛蒂的脸按进他的腹股沟，他的睾丸跳动着，准备填满荡妇的喉咙。你感觉到自己也快要爆发了，在女孩体内进行更长、更深的抽插，最后向前一挺，用你的精液填满了她，对面的陌生人也把抽搐的肉棒强行塞进洛蒂的喉咙，做了同样的事。你们俩慢慢地从你们的战利品中抽身，这个苍白、出汗的女孩现在躺在地板上，浓稠的精液从两端漏出。伴随着最后一声咕哝，你把剩下的精液射在她丰满的屁股上，醉汉则把精液射在她的脸上。[pg]");
            outputText("你决定把洛蒂留在那里，让流浪汉对着她的嘴再打一发手枪，然后回到健身房去拿一杯");
         }
         else
         {
            outputText("在散步时，你发现自己来到了一个熟悉的地方——湿身婊酒馆的后巷。你觉得带你的荡妇进去也没什么坏处；你猛地把手往前一拉，强迫洛蒂走向门口——这时你认出了一张正在疯狂自慰的双性狐狸兽人的脸。乌尔塔看着你，一边无情地抽插着她粗大的马鸡巴，一边对你现在用皮带拴着的猪荡妇眨眼。她似乎一点也不认识你，这可能意味着她不知怎么地得了严重的失忆症，或者她比平时醉得多。");
            if(get_silly())
            {
               outputText("[say: 培根 培根 培根 培根 培根 培根！我要吃培根！]");
            }
            else
            {
               outputText("[say: 嘿嘿 *嗝* 伙计，她是你 *嗝* 性奴还是什么人？]");
            }
            outputText("你觉得她是对的。把滑溜溜的手指从她的小穴里抽出来，你把洛蒂推向那个灰" + (get_noFur() ? "发" : "色") + "的狐狸女人，拉着皮带把她向后猛拉到地板上。当她试图站起来时，乌尔塔巨大的马具拍打在洛蒂的鼻子上，女孩尖叫起来。你掏出你自己的" + get_player().cockDescript(_loc1_) + "，对她吼叫着让她保持四肢着地——只要你拥有她的后半身，你才不在乎那个双性狐狸兽人对她的脸做什么。乌尔塔开始用她那根平坦的龟头摩擦你荡妇丰满的嘴唇，她那令人陶醉的先列腺液的气味诱惑着洛蒂在湿润的顶端轻轻舔舐。不想被冷落，你用力抓住她的臀部，将你的" + get_player().cockDescript(_loc1_) + "径直滑入荡妇温暖的洞里，当你感觉到她的肉壁紧紧包裹着你时，你呻吟起来。当她的臀部突然向后猛推时，你猛地一震，你瞥了一眼，发现乌尔塔正尽可能地把她粗大的鸡巴埋进女孩的嘴里。你们俩互相看了一眼，点了点头，然后你们俩都把你们的长度插入了抽泣的猪婊子体内，前后摇晃。乌尔塔呻吟着，一只手抓住洛蒂的后脑勺，另一只手抚摸着自己的乳房。在你的奴隶的另一端，你无情地操着，紧紧抓住她肥大的屁股蛋，因为它们拍打你腹股沟的快感而大口喘气。双性狐狸兽人发出一声响亮的呻吟，然后尽可能地把洛蒂的脸推向她的腹股沟，她的睾丸变大，准备填满荡妇的喉咙。你感觉自己也快要爆发了，对女孩进行了更长、更深的抽插，最后向前推，用你的精液填满她，另一端的狐狸女人强迫她抽搐的、野兽般的阴茎进入洛蒂的喉咙，做着同样的事情。你们俩慢慢地从你们的战利品中抽离出来，那个苍白、出汗的女孩现在躺在地板上，浓稠的精液从两端漏出。伴随着最后一声咕哝，你把剩下的都卸在了她丰满的屁股上，乌尔塔则把精液涂满了她的脸。[pg]");
            outputText("你决定把洛蒂留在那里，让乌尔塔对着她的嘴再打一发手枪，然后回到健身房去拿一杯");
         }
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。你确实很喜欢烤猪，但没有什么能比得上一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,311,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
         outputText("[pg](<i>从洛蒂的性爱菜单中解锁了“散步”。</i>)");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1),DynStat.Cor(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieFatLoserCulminationFuckChoice() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你决定洛蒂现在只有一个用途。几分钟后，你把你的婊子带到了洗手间。墙壁两侧排列着镜子，让会员可以观察自己的体格。今晚这里空无一人，不过为了以防万一，你还是锁上了门。你转过身，看到洛蒂在角落里瑟瑟发抖。她知道你想要什么——你向玛瑞斯的巨树奶子发誓，你一定会得到它。走过去，你咆哮着命令洛蒂脱光衣服，四肢着地。她对你的命令发出呜咽，但完全知道如果她不照做你会怎么做。缓慢但肯定地，她拉下她的背心，露出她那从衣服里跳出来的乳白色的奶子。你又不是没见过，但她一边拼命试图脱下上衣一边又试图遮住奶子的不情愿，激起了你原始的反应。女孩试图尽快脱下她的短裤，但你对她咆哮，让她转过身弯下腰，让你好好看看她那向你翘起的丰满屁股。她慢慢地把紧身短裤从臀部剥下来，露出她粉红色、湿润的嘴唇——这个小荡妇发情了，你暗自发笑。随着她赤裸的身体完全展现出来，洛蒂静静地移到地上，四肢着地，屁股朝向你。她回头看到你勃起的" + get_player().cockDescript(_loc1_) + "完全展现出来，迅速尖叫着移开视线。你咧嘴一笑，一边把自己抚摸到完全勃起，一边走过去，站在洛蒂丰满的臀部后面。[say:[name]？]她轻轻地抽泣着，[say:求、求求你别这样。]说完，你抓住她丰满的大腿向前挺进，将你的" + get_player().cockDescript(_loc1_) + "直接插入她颤抖的湿润中。[pg]");
         outputText("当你感觉到她紧致的肉壁包裹着你的长度时，你发出一声呻吟，洛蒂感觉到你侵入她的私处时尖叫起来。你继续无情地推进，一边在快感中发出咕哝声一边猛干你的婊子，骂她是个毫无价值的胖猪，一边拍打她的屁股，一边听着她尖叫和呻吟。你看着你的荡妇拼命试图闭上眼睛逃避发生在她身上的现实，但你的" + get_player().cockDescript(_loc1_) + "在她温暖的深处每一次抽插都在提醒她身在何处。洛蒂绝望地哭泣着，起初是求你停下来，然后是求救。对你来说幸运的是，洗手间的墙壁奇特地隔音，任何敲门声一出现就消失了。当你干着你的战利品时，你弯下腰，把身体压在这个胖乎乎的女孩身上，伸手用一只手挤压她那柔软的胸部，另一只手支撑着你的重量。当你把你的" + get_player().cockDescript(_loc1_) + "插入她体内，感觉到你的坚硬沿着她的内壁移动时，洛蒂不情愿地呻吟着。她一直低着头看着地板，在她的余光中看到她沉重的乳房被你的手挤压和拉扯。随着你干得更用力，洛蒂的哭泣和尖叫声变得越来越小，她的汁液润滑着你饥渴的肉棒。最终，你厌倦了让她四肢着地，一个利落的翻身，你把她翻转过来仰面躺着，向你露出她苍白的身躯。猪女孩尖叫着，用手捂住脸，不想目睹你猛干她湿透的小穴。你不是一个会抱怨的人，而是专注于吸吮她的一个乳房，你的手揉捏着另一个。[pg]");
         outputText("当你更快地插入洛蒂的小穴时，你感觉到一种熟悉的快感，当你把自己推向边缘时，你吸吮得更用力了。随着最后一次插入她的子宫，你向后靠，将你滚烫的精液释放在她体内，而她则在反抗中挣扎和尖叫。在狂喜中，你抓住洛蒂的肩膀，把她拉到你身上，你的" + get_player().cockDescript(_loc1_) + "仍然在里面喷射着你的精液。你们俩躺在那里，洛蒂崩溃了，而你抓住她摇晃的屁股，在里面抽插了几个小时的纯粹的极乐。[pg]");
         outputText("当你终于筋疲力尽时，你把洛蒂留在地板上。你的精液从她体内流出，而她躺在那里流着口水，对周围的环境毫无反应。你拍了拍她的屁股，开始走出健身房，并确保顺手拿走了一块");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("你他妈的爱死培根奶昔了。");
         }
         outputText("[pg](<i>后入式已在洛蒂的性爱菜单中解锁。</i>)");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3),DynStat.Cor(3));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,310,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieExercise() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉洛蒂是时候去健身房了，她回应道");
         if(lottieMorale() >= 66)
         {
            outputText("热情地点了点头");
         }
         else if(lottieMorale() >= 33)
         {
            outputText("点头表示同意");
         }
         else
         {
            outputText("慢慢抬头看着你，点了点头");
         }
         outputText("。[say:今天想去哪儿，" + get_player().mf("guy","ma\'am") + "？]她回答道，你们俩穿过咖啡馆的入口，走向健身房的其他区域。一面摆满各种举重器材的墙傲然矗立在正在使用它们的市民中间。你看到了几条慢跑跑道，外面是一片宽阔的草地，主要被寻找夜跑的半人马占据——尽管其他两足的健身房成员试图和他们一起慢跑，但都不太成功。一扇隐蔽的大门隐藏着室内游泳池和桑拿区的入口，旁边是通往烛光瑜伽室的门。你想在哪里锻炼？");
         menu();
         addButton(0,"举重",lottieWeights);
         addButton(1,"慢跑",goJoggingWithLottie);
         addButton(2,"瑜伽",lottieYoga);
         addButton(3,"游泳池",lottiePool);
      }
      
      public function lottieElleThreesomeFirstTime() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("当你赤身裸体地在你饥渴的后宫面前脱衣服时，你邪恶地轻笑着。两个女孩都紧张地红着脸，盯着你的" + get_player().cockDescript(_loc1_) + "——尽管她们眼中的饥渴表明她们一点也不焦虑。你仰面躺下，示意女孩们过来。洛蒂热情地小跑向你，躺在[eachcock]前面，把龟头");
         if(get_player().cockTotal() > 1)
         {
            outputText("其中一根的");
         }
         outputText("塞进她丰满的嘴唇里，用她急切的舌头绕着它打转。蜘蛛娘变得更加热情，跳回来躺在洛蒂旁边，把她火热的嘴放在你肉棒的根部，轻柔地舔舐着。她用舌头舔舐着你的柱身，而洛蒂则饥渴地吸吮着你的龟头，吸溜着先列腺液的珠子，不时停下来把嘴唇贴在她的蜘蛛朋友身上，交换着唾液和你肉棒的味道。当你让女孩们在你光滑的阴茎上忙活时，蜘蛛荡妇移开身子，然后跨坐在你的脸上，她湿润的小穴距离你饥渴的嘴巴只有几英寸。洛蒂开始在你的柱身周围忙活，而艾尔则向前倾身，把它塞进嘴里，又重又快地吸吮着。她伴随着一声湿润的啵声松开了你的龟头，当你把舌头伸进她火热的阴户，品尝着她的汁液，轻柔地吸吮着她坚挺的阴蒂时，她呻吟起来。洛蒂移动到你的柱身上方，慢慢地降低自己，直到你向上挺身，将你的" + get_player().cockDescript(_loc1_) + "直接猛插进她的体内。两个女孩都从两端发出尖叫和呻吟，艾尔粗壮的大腿夹在你头部的两侧，同时她试图把你拉得更深。洛蒂柔软的乳房随着她在你身上弹跳而起伏，她俯身向蜘蛛娘，两人深情拥吻。艾尔多余的手揉捏着洛蒂的乳房，而她主要的两只手则抓住自己的臀部，在你的脸上摩擦，同时你吸吮着她甜美的花蜜。你的技巧似乎奏效了，蜘蛛娘在性高潮中颤抖，她汗津津的大腿夹紧你，在狂喜中颤抖。洛蒂紧随其后达到了高潮，她抱着艾尔的头，女孩轻柔地吸吮着她柔软的乳头，她的内壁紧紧地夹着你。当你感觉到自己即将释放时，你命令你的荡妇们从你身上下来，她们照做了。片刻之间，你抓住了蜘蛛娘，强迫她张开双腿，将你的" + get_player().cockDescript(_loc1_) + "插进去，喷射出你滚烫的精液。洛蒂骑在女孩身上，把她们的小穴贴在一起，在快感中摩擦。一旦你完成了对蜘蛛荡妇的灌溉，你就挺进猪娘体内，一串串精液溅满她的内壁。你继续在她们俩体内抽插了几分钟，最后让每个女孩吸吮你的肉棒来结束。[say: 令人满意。]你嘟囔着，穿上衣服走向门口，确保在出去的路上拿了一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         if(get_silly())
         {
            outputText("你只需要其中一个就能满足你。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         outputText("[pg](<i>\'三人行\'已在洛蒂的性爱菜单中解锁。</i>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,316,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lottieCup() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) >= 75)
         {
            return "D";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) >= 50)
         {
            return "E";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) >= 25)
         {
            return "F";
         }
         return "G";
      }
      
      public function lottieAppearance(param1:Boolean = true) : Object
      {
         if(!get_player().hasCock())
         {
            return null;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) <= 0)
         {
            return null;
         }
         if(get_game().time.hours >= 15 && get_game().time.hours <= 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) == 0)
            {
               if(param1)
               {
                  outputText("[pg]一个皮肤白皙的猪女从附近的池子里出来。当她抖落身上穿着比基尼的苍白身体上残留的水珠时，她粉灰色卷发上的小耳朵漫无目的地耷拉着——在这个过程中，她无意中抖动了她E罩杯的乳房和丰满的屁股。");
               }
               return encounterLottieCharge;
            }
            if(param1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) < 30 && Utils.rand(6) == 0)
               {
                  outputText("[pg]你发现洛蒂在桑拿房里哭泣。她经常独自来这里，想知道她的减肥计划到底出了什么问题。每次你撞见她，她都会求你不要像其他人一样离开她。你告诉她你不会的，只要她继续按你的指示去做。她一遍又一遍地感谢你，爬到你的腿边抽泣着，把她那迷人的乳房紧紧贴着你。你看着她慢慢地走向咖啡馆，满怀期待地等着你。");
                  if(get_silly())
                  {
                     outputText("你能说什么呢？你就是喜欢做培根。");
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) < 30 && Utils.rand(5) == 0)
               {
                  outputText("[pg]你发现洛蒂在咖啡馆里哭泣。她经常来这里等你，想知道她的减肥计划到底出了什么问题。每次你走近她，她都会求你不要像其他人一样离开她。你告诉她你不会的，只要她继续按你的指示去做。她一遍又一遍地感谢你，爬到你的腿边抽泣着，把她那迷人的乳房紧紧贴着你。你看着她慢慢地从你身边离开，坐回自己的座位上，满怀期待地等着。");
                  if(get_silly())
                  {
                     outputText("你能说什么呢？她的猪肉包子是最好的。");
                  }
               }
               else if(Utils.rand(2) == 0)
               {
                  outputText("[pg]你看到洛蒂从附近的瑜伽室出来，她的课程结束了。你忍不住注意到她今天穿的紧身蓝色背心和深色超短裤。这个");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 33)
                  {
                     outputText("丰满的");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 66)
                  {
                     outputText("丰满的");
                  }
                  else
                  {
                     outputText("曲线优美的");
                  }
                  outputText("猪女孩在原地慢跑来让自己清醒——在这个过程中，她无意中抖动了她" + lottieCup() + "罩杯的乳房和柔软的屁股。她走到附近的咖啡馆，坐在她那");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 33)
                  {
                     outputText("丰满的");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 66)
                  {
                     outputText("胖嘟嘟的");
                  }
                  else
                  {
                     outputText("可爱的");
                  }
                  outputText("屁股上。");
               }
               else
               {
                  outputText("[pg]你看到洛蒂从举重室走出来，身上闪烁着刚锻炼完的汗水。这似乎消耗了她很多体力，她的动作比平时更僵硬。这个活泼的粉红女孩做了几个简短的伸展动作来放松——在这个过程中，她无意中抖动了她" + lottieCup() + "罩杯的乳房和柔软的屁股。她走到附近的咖啡馆，坐在她那");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 33)
                  {
                     outputText("巨大的");
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 66)
                  {
                     outputText("胖嘟嘟的");
                  }
                  else
                  {
                     outputText("可爱的");
                  }
                  outputText("屁股上。");
               }
            }
            return encounterLottieCharge;
         }
         return null;
      }
      
      public function lottieAndIfrisNTREpilogue() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         outputText("一阵干燥的风吹过你的脸，把你从平静的睡眠中唤醒。看来你在特尔阿德雷的城墙外。你所有的装备都放在你的右边，当你收集你的装备堆时，你在下面发现了一张纸条。[pg]");
         outputText("[saystart]亲爱的[name]，[pg]睡得好吗？我希望如此，考虑到我发现你在两个性感的辣妹身上打呼噜。不要担心在健身房惹上麻烦。大多数员工和顾客都忙着自己解决，没空生气或被冒犯" + (get_urtaDisabled() ? "" : "，虽然我不得不承认我有点嫉妒。那只小猪和那个紧致的红屁股都安全地在她们的家里") + "。");
         if(!get_game().urta.urtaLove())
         {
            outputText("当然，我不得不因为你在公共场合猥亵而对你罚款——你真的应该注意你的行为，以免有人把你当成恶魔特工。下次，试着把它留在你的裤子里。");
            outputText("[pg]-" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "，守卫队长");
            if(get_player().get_gems() > 0)
            {
               _loc1_ = get_player();
               _loc1_.set_gems(_loc1_.get_gems() - 200);
               if(get_player().get_gems() < 0)
               {
                  get_player().set_gems(0);
               }
            }
         }
         else
         {
            outputText("我不得不做个样子，因为你在公共场合猥亵而对你罚款，但你会注意到你的钱都还在那里。有空还我，好吗，亲爱的？[pg]-永远为你准备着，乌尔塔");
         }
         outputText("[sayend][pg]");
         outputText("满意地，你穿好衣服，大摇大摆地走向营地。");
         if(get_silly())
         {
            outputText("你明天一定要给" + (get_urtaDisabled() ? "队长" : "乌尔塔") + "买一杯培根奶昔。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lotteryAppearance() : void
      {
         var _g:Lottie;
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-examine-appearance");
         if(lottieTone() <= 20)
         {
            outputText("她身高大约4英尺8英寸，平均来说相当矮，");
            if(get_player().get_tallness() > 60)
            {
               outputText("并且比你矮");
            }
            else if(get_player().get_tallness() > 53)
            {
               outputText("但你也没资格评判，毕竟你们差不多高");
            }
            else
            {
               outputText("比你高");
            }
            outputText("。体格方面，洛蒂非常丰满，乍一看，大多数人会认为她很胖，或者至少相当肥胖。你的努力绝对得到了回报。在你见过的特尔阿德雷周围为数不多的猪人中，她绝对能融入其中。她的大部分体重集中在她丰满的G罩杯、适合生育的臀部和巨大的屁股上，她那打破游戏平衡的大肚腩也相当圆润，以支撑她上半身的重量。她心形的脸庞配上她的小巧鼻子和柔软的嘴唇，粉灰色的头发在发尾卷曲着，勾勒出她的脸庞。一条小巧的卷尾巴停留在她的臀部上方。");
         }
         else if(lottieTone() <= 40)
         {
            outputText("她身高大约4英尺8英寸，平均来说相当矮，");
            if(get_player().get_tallness() > 60)
            {
               outputText("并且比你矮");
            }
            else if(get_player().get_tallness() > 53)
            {
               outputText("但你也没资格评判，毕竟你们差不多高");
            }
            else
            {
               outputText("比你高");
            }
            outputText("。体格方面，洛蒂绝对算得上丰满，虽然你不会说她胖。你的努力绝对取得了成果。在你见过的特尔阿德雷周围为数不多的猪人中，她绝对比大多数人都瘦。她的大部分体重集中在她柔软的F罩杯、丰满的大腿和圆润的屁股上，尽管她的肚子圆润得恰到好处，以支撑她上半身的重量。她心形的脸庞配上她的小巧鼻子和柔软的嘴唇，齐肩的粉灰色头发在发尾卷曲着，勾勒出她的脸庞。一条小巧的卷尾巴停留在她的臀部上方。");
         }
         else if(lottieTone() <= 60)
         {
            outputText("她身高大约4英尺8英寸，平均来说算矮的，");
            if(get_player().get_tallness() > 60)
            {
               outputText("并且比你矮");
            }
            else if(get_player().get_tallness() > 53)
            {
               outputText("但你也没资格评判，毕竟你们差不多高");
            }
            else
            {
               outputText("比你高");
            }
            outputText("。体型方面，洛蒂绝对比大多数女孩丰满一些，虽然你不能说她胖——在你见过的特尔阿德雷周围为数不多的猪人中，她绝对是“最瘦的”。她的大部分体重集中在她那柔软的乳房、丰满的大腿和硕大的屁股上，不过她的肚子也圆润得恰到好处，足以支撑她上半身的重量。她那心形的脸庞配上小巧的鼻子和柔软的嘴唇，被她那粉灰色的头发所环绕，发尾带着小卷。一条小巧的卷尾巴搭在她的臀部上方。");
         }
         else if(lottieTone() <= 80)
         {
            outputText("她身高大约4英尺8英寸，平均来说相当矮，");
            if(get_player().get_tallness() > 60)
            {
               outputText("并且比你矮");
            }
            else if(get_player().get_tallness() > 53)
            {
               outputText("但你也没资格评判，毕竟你们差不多高");
            }
            else
            {
               outputText("比你高");
            }
            outputText("。体型方面，洛蒂身上有点肉肉的，但除此之外，她的身材相当不错。她的努力显然取得了成果。你不能说她胖——在你见过的特尔阿德雷的少数几个猪人中，她绝对是最瘦的。她的大部分体重都集中在她那柔软的乳房、粗壮的大腿和丰满的屁股上，不过她的肚子圆润得恰到好处，足以支撑上半身的重量。她心形的脸庞配上小巧的鼻子和柔软的嘴唇，粉灰色的头发在发尾卷起小卷，更是衬托出她的可爱。一条盘绕的小尾巴搭在她的臀部上方。");
         }
         else
         {
            outputText("她身高大约4英尺8英寸，平均来说相当矮，");
            if(get_player().get_tallness() > 60)
            {
               outputText("并且比你矮");
            }
            else if(get_player().get_tallness() > 53)
            {
               outputText("但你也没资格评判，毕竟你们差不多高");
            }
            else
            {
               outputText("比你高");
            }
            outputText("。体型方面，洛蒂的身材极佳，她那曲线优美的身姿吸引了附近许多男性的目光。她的努力绝对没有白费。在你见过的特尔阿德雷的少数几个猪人中，她绝对是迄今为止最符合大众审美的。她身上仅有的一点脂肪都集中在她那挺拔的D罩杯、充满少女感的大腿和可爱的屁股上，她平坦的腹部展现出匀称的腹肌，足以支撑上半身的重量。她心形的脸庞配上小巧的鼻子和柔软的嘴唇，粉灰色的头发在发尾卷起小卷，更是衬托出她的美丽。一条盘绕的小尾巴搭在她的臀部上方。");
         }
         _g = this;
         doNext(function():void
         {
            _g.encounterLottie();
         });
      }
      
      public function leaveLottieInsteadOfYogaSex() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("尽管你很兴奋，但你的理智告诉你该离开了。在幸福的无知中，你走出咖啡馆的门，穿过游泳池区，进入主健身房，然后走出正门。一旦到了外面，你觉得现在是散步回营地的好时机。[pg]");
         outputText("在你回家的路上，你有一种奇怪的感觉，你错过了一场极其性感的性爱。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function jumpInPoolBeforeLottieSeesYourWingWang() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你不能冒这个险，所以你决定跳进水里——一开始很冷，但你很快就暖和起来了。洛蒂把你的回避放在心上，看起来明显很沮丧，不过你想知道如果你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("决定打个招呼，她会有什么反应。不用说，你决定还是一个人游泳比较好——偶尔有个丰臀荡妇在旁边晃悠也没什么不好，但不能分心确实很痛苦。洛蒂在泳池的另一端涉水，偶尔做个伸展运动，然后开始游圈。你学着她的样子，开始在两端来回游，尽量不盯着洛蒂那巨大的胸部看，因为她每次划水后，胸部都会在空中弹跳。过了很长一段时间，你们俩都比以前更累了。自从你最初对她的身体做出反应后，她似乎轻松了许多，所以你耸耸肩，回家了。");
         outputText(get_player().modTone(100,2));
         dynStats(DynStat.Lust(40));
         lottieTone(2);
         lottieMorale(-1);
         get_player().changeFatigue(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function jogWithLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你觉得冲刺对你们俩都没什么好处，不过稍微快一点也无妨。你把快走升级为慢跑，然后提醒洛蒂尽量放轻松——这不是比赛。洛蒂很快明白了你的意思，开始进一步逼迫自己，尽力跟上你，同时在跑道上保持稳定的节奏。你们俩花了大半个晚上的时间慢跑了很长一段距离，然后决定休息。你们都很累，但对今天的努力感到满意。[pg]");
         dynStats(DynStat.Tou(0.1),DynStat.Spe(0.1));
         lottieMorale(2);
         lottieTone(2);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function jogWithFitLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你觉得冲刺既浪费时间又浪费精力，不过稍微快一点也无妨。你放弃了快走，开始小跑，调皮地对洛蒂吐了吐舌头——示意比赛开始。她很快明白了你的意思，开始追赶你，她那挺拔的双乳随着她试图超越你而上下跳动。你们俩花了大半个晚上的时间跑了很长一段距离，然后决定休息。你们都很累，但对今天的努力感到满意。[pg]");
         lottieMorale(2);
         lottieTone(2);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ifrisAndLottieGetsNTRedLiftingWeights() : void
      {
         clearOutput();
         get_images().showImage("lottie-ifris-threesome");
         outputText("[say: 我们要把那些肥肉烧掉，猪猪小姐，]你回答道。你大摇大摆地走向举重器械，决心再次羞辱你的锻炼伙伴，在路上你看到了一抹熟悉的深红色。是洛蒂！这位肌肉爱好者的身体完美地凸显了所有恰到好处的紧致，没有洛蒂身上堆积的脂肪。当你坐在长椅上，握住最重的一组哑铃时，伊弗里斯发出了她标志性的掌声。带着一个邪恶的想法，你向这位身材健美的诱惑者招手，她高兴地照做了。[pg]");
         outputText("当伊弗里斯摇曳生姿地走到你身边，摆出她平时盘旋在你头顶的姿势时，洛蒂注意到了。当她意识到发生了什么事时，她呜咽着说，[say: 我-我以为</i>我们<i>要一起锻炼的，勇者。]伊弗里斯发出一声悦耳的轻笑，把一只手放在洛蒂粉红色的肩膀上。[pg]");
         outputText("[say: 他对你来说有点高不可攀，你不觉得吗？]这位苗条的红发女郎将目光从洛蒂身上收回，深情地靠在你结实的胸膛上。她的双臂环绕着你的身体，开始慢慢地为你脱衣服。一旦你的上半身裸露出来，伊弗里斯就发出满足的呼噜声，[say: 多么完美的标本；[he]真的值得一些特别的关注。]伊弗里斯把头低到刚好在腰围上方，把你的[armor]下摆拉下几英寸。为了给这个恶魔提供充足的动力，你开始举重。她的第一个吻直接落在你的肚脐下方，她的舌头在肚脐周围游走。你每一块坚硬的腹肌都得到了一个湿润的亲吻。她在你的胸骨正下方徘徊，抬起眼睛看着你。知道她的下一个目的地在更高的地方，你举起哑铃直到手臂伸直，尽可能地炫耀。她的眼睛亮了起来，继续她的旅程。当你头顶上的负担占据了你相当少的注意力时，伊弗里斯深吸了一口气，用鼻子蹭着你宽阔、雕塑般的躯干。她倾听着你的心跳，感受着你胸腔里的跳动。洛蒂标志性的抽泣声打断了你的幸福。你暗自发笑，自夸道，[say: 妈的，有这么可爱的人表现出如此的尊重，感觉真好。当一个女人靠近我时，我不会感到恶心，这让人很欣慰。]你甚至懒得看那头猪一眼；她语无伦次的胡言乱语已经足够令人满意了。无论是伊弗里斯的奉献还是洛蒂的屈辱，都让你的肉棒充满了生机；你的下半身明显鼓了起来，有撑破的危险。[pg]");
         outputText("你开始迅速地举重，以理清思绪，并刺激你的恶魔情人。伊弗里斯把下巴搁在你宽厚的胸膛上，抬头看着你，同时她那乌黑的舌头在她柔软的乳房上游走。她的眼睛因欲望而变得迷离，开始把手滑向你的凸起。[pg]");
         outputText("你让她停下来，迅速补充道，[say: 我有人来处理那个；你只要陪着我直到它出来就行了。]你把哑铃放在架子上，把目光从伊弗里斯身上移到洛蒂身上。不出所料，她眼里含着泪水，但却愣在原地。你抛弃了对伊弗里斯表现出的温柔，命令这头猪脱掉你的裤子。她点点头，迟疑地向你走来，然后解除了你老二周围的牢笼。[pg]");
         outputText("终于逃脱了束缚，[eachcock]得意洋洋地直指天空。你松了一口气，闭上眼睛，继续锻炼。你几乎是事后才想起来，补充道，[say: 伊弗里斯，亲爱的，继续吧。小胖子，你别插手。我们都知道当你那贪婪的脸包住我的肉棒时会发生什么。]一声相当大的抽泣迫使你睁开一只眼睛，冷冷地盯着洛蒂。她的脸上混合着嫉妒、愤怒和羞愧，泪水从她绿色的眼睛里滑落。你唯一的回答是不屑地哼了一声。[pg]");
         outputText("伊弗里斯在给了你的身体这么多关注之后，显然非常兴奋。她半闭着眼睛，当她的嘴在你敏感的顶端盘旋时，她开始喘息。她平息了呼吸，闭上了嘴。在相当长的一段令人揪心的时间里，她只是低着头，她那午夜般的嘴唇紧闭着，从她鼻孔里呼出的热气拂过你的胯部。一种越来越强烈的不安在你的胸腔里积聚，你瞥了一眼洛蒂，她也困惑地盯着伊弗里斯，眨着眼睛试图把眼泪挤掉。幸运的是，情况发生了转变。伊弗里斯张开嘴唇，将倾盆大雨般的唾液倾泻在你仍然坚挺的肉棒上。当温暖的物质冲刷过你肉棒的每一寸，让它沉浸在一种美妙的感觉中时，你的大脑一阵眩晕。当你的阴茎涌动着更多的生机时，她短暂地向你眨了眨她长长的睫毛，她那双红色的眼睛沉醉在激情中。伊弗里斯尽可能地张大嘴巴，伸出舌头，稍微向后拉了一点，然后猛地把自己套在你的肉棒上。[pg]");
         outputText("她早先分泌的润滑液让你毫不费力地滑到了她的喉咙深处，你这顺从的容器没有发出一丝抗拒的呢喃。当她紧闭双唇，用嘴唇和舌头施加压力，挤压你的肉棒时，情况突然发生了变化。当那条黑色的舌头和相配的嘴唇在你的肉棒上吸吮时，你发出了无意识的呻吟。当她把紧致的小嘴拖到你的龟头时，她经过的每一寸皮肤都在快乐地跳动。渐渐地，你没有肉可以给她吸了，伊弗里斯现在正在吸吮你敏感的龟头。每次她用吸力拉扯你跳动的龟头时，令人难以忍受的极乐之箭就会穿过你的神经。你想象着她舌头滑过你马眼时发出的吧唧声，那是一种湿润、绝望的声音，在你的脑海中回荡。[pg]");
         outputText("声音实际上加快了，而且……少女高亢的呻吟声充满了你的耳朵？瞥了一眼伊弗里斯，很明显她的嘴正专注于为你服务。更不用说她的声音与那更柔和的尖叫声不符了。一个词在你的脑海中翻滚。尖叫。你不想费心起身，但你决心找到引起骚动的调皮母猪。把头转向一边，你找到了所有噪音的来源。洛蒂已经爬得离你非常近，离你的头只有大约一英尺远。她跪在地上，一只手深深地埋在她的健身短裤里，这解释了那摩擦的声音。她的另一只手包围着她沉重的乳房，厚实的肉从她的手掌中溢出。注意到你的目光，洛蒂迅速抓住一个乳头，认真地拉扯着。她丰满的乳房被拉长，她的手在她的阴部里更加努力地工作。她试图用她不断的扭动向你炫耀，一边拉扯一边呻吟。显然是击中了深处一个特别敏感的部位，洛蒂喘着粗气，松开了乳头，释放出一阵诱人的、摇晃的、弹跳的乳房瀑布。空闲的手加入了她腹股沟的另一只手，很快，一滩淫荡的汁液就在她胖乎乎的屁股周围形成。[pg]");
         outputText("有这么一个饥渴的受试者看着，你决定结束这个练习。伊弗里斯仍在你的肉棒上上下下地套弄。你耐心地等待她到达顶端，然后抓住她可爱的小脑袋。手指滑过她浓密的头发，你几乎对你接下来打算做的事情感到一丝羞愧……几乎。[pg]");
         outputText("你站起来，离开长凳，抱着伊弗里斯，让她的嘴仍然含着你的龟头。你随意地把头转向洛蒂，吸引了她的注意力，并要求道，[say: 别再把手指塞进你那肥胖的小穴里了，注意看。][pg]");
         outputText("她顺从了，脸红了。[say: 现在就看看这个！]你继续说道，[say: 在我们的训练过程中，你一直是个好女孩。我认为你值得奖励。]你嘲弄的笑容消失了，取而代之的是咆哮。你那双有力的手紧紧抓住伊弗里斯的头，让她睁大了眼睛。鼓起你剩下的所有力量，你忍住了威胁要从你蛋蛋里爆炸出来的沸腾高潮。你把伊弗里斯猛地按到你肉棒的最底部，把她的头埋在你的腹股沟里，紧接着，你的臀部向前猛冲，让它沿着你的肉棒飞上去。[pg]");
         outputText("伊弗里斯发出嘈杂的干呕声，有时会让小声的快乐尖叫从她的嘴唇里逃出来。她的头被像排球一样来回拍打。青筋暴起的手把她的头砸向你的骨盆。钢铁般挺进的臀部撞击着她的头骨，让它再次向上飞去。你所有的精力和注意力都集中在操这个恶魔的脸上，就像她是你的私人奴隶一样。");
         if(get_player().balls > 0)
         {
            outputText("你的步伐没有减慢，即使你肿胀的蛋蛋大声地拍打着她的下巴。");
         }
         outputText("看到伊弗里斯被扔来扔去，你发出一声疯狂的轻笑");
         if(get_player().balls > 0)
         {
            outputText("，出汗的睾丸撞击着她");
         }
         outputText("。洛蒂在你旁边狂喜地哭喊着。她恳求你让她成为你的下一个性玩具。你囊袋中积聚的压力终于达到了顶峰。你放弃了所有控制的错觉，屈服于已经升起的原始欲望。[pg]");
         outputText("你的[legs]发软，你的手臂感觉像烂泥一样，你最后一次把伊弗里斯一直推下去。第一股精液喷泉让这位漂亮的红发健身爱好者超载了。她几乎被你第一发的冲力推离了你的肉棒。没有力气了，你松开她丝滑的头发，让她瘫倒在地板上。她的喉咙鼓起，精液从她的嘴里滴落。第二波高潮席卷了你，你把地板涂满了精液。你几乎没有意识到自己抓住了洛蒂的手臂，把她拖到了伊弗里斯身边。两个女人仍在用手指抠弄她们滴水的阴部，而你准备了最后一次爆发。黑暗爬进你的视野，你把你的肉棒对准两个荡妇。你的尿道扩张，释放出一阵种子；伊弗里斯和洛蒂被厚厚的精液绳索覆盖。她们在奶油雨中拥抱，把彼此湿透的身体揉捏在一起。[pg]");
         outputText("只摇晃了几秒钟，你就倒在两个女人身上，晕了过去。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Cor(5));
         doNext(lottieAndIfrisNTREpilogue);
      }
      
      public function hugTheShitOutOfYourHam() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你站起来，叫洛蒂过来。她犹豫了一下，不确定你心里在想什么，但还是照做了。很快，这个红润的猪女站在你面前，用灰绿色的眼睛好奇地看着你。你突然向她伸出手，洛蒂退缩了一下，本能地试图躲开——但太晚了。[say:大熊抱！]你尖叫着，双臂环抱住这个矮小、尖叫的猪女。[say:吼吼，拥抱开始！]你开始摇晃，带着洛蒂一起，试图用灰熊般的拥抱来抱住她。此时，洛蒂的尖叫声变成了咯咯的笑声，一边笑一边摇晃，同时假装试图从你的掌控中逃脱。[say:停-停下，宝贝！不！]她哭喊着，无助地挥舞着手臂。当你把她放下时，你们俩都笑了，洛蒂假装打你的肚子，而你假装痛苦地摇晃。毫无疑问，你的熊抱简直是最棒的。[pg]");
         if(lottieMorale() < 70)
         {
            lottieMorale(1);
         }
         if(lottieMorale() <= 30 && !get_player().isPureEnough(75))
         {
            outputText("你叫洛蒂醒来，拍打她的脸让她恢复意识。她痛得尖叫起来，从幻想中惊醒时，一缕口水飞溅出来。她静静地吸了吸鼻子，把想法藏在心里。[say:什么样的没用的荡妇会做白日梦？]你假笑了一下。[pg]");
            outputText("那种希望有一天她的生活会改变的人，洛蒂回想道。");
            lottieMorale(-4);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hamSammitchTimeBIATCH() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,324) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,324,FlagDict_Impl_.arrayReadInt(_loc1_,324) + 1);
            outputText("你走到咖啡馆，洛蒂看着你从菜单上点了一个三明治。几秒钟后，那个长得像牧羊犬的店员从玻璃展示柜里拿出一个递给你");
            if(get_silly())
            {
               outputText("，嘴里还嘟囔着什么终身会员可以免费获得猪肉相关的食物");
            }
            outputText("。你们相视一笑，然后你走回桌边，把这份湿润的食物递给洛蒂，解释说你前几天看到了这个火腿三明治，觉得她可能会喜欢。洛蒂把它扔在了地上。[say:你到底有什么毛病？][pg]");
            outputText("你伸出手想击掌，但没人理你。");
         }
         else if(get_player().isCorruptEnough(75))
         {
            outputText("你走到咖啡馆，洛蒂看着你从菜单上点了一个三明治。几秒钟后，那个长得像牧羊犬的店员从玻璃展示柜里拿出一个递给你，嘴里还嘟囔着什么给猪娘吃火腿三明治真是个他妈的蠢主意。你们相视一笑，然后你迅速走出咖啡馆，来到目前空无一人的泳池区。你急忙脱下[armor]，掏出[cock]，直接插进三明治里，无情地操弄着它。不一会儿，你就在天鹅绒般的火腿片之间射了精，在里面留下了一大滩，剩下的精液从后面漏出来，在地上积成一滩。你穿好衣服，走回桌边，把这份湿润得不可思议的食物递给洛蒂，解释说你前几天看到了这个火腿三明治，觉得她可能会喜欢——而且你还特意加了你自己的“特制蛋黄酱”。洛蒂把它扔在了地上。[say:别在火腿三明治里射精，混蛋！][pg]");
            outputText("你伸出手想击掌，但没人理你。");
            get_player().orgasm("Dick");
         }
         else
         {
            outputText("你走到咖啡馆，洛蒂看着你从菜单上点了一个三明治。几秒钟后，那个长得像牧羊犬的店员从玻璃展示柜里拿出一个递给你，嘴里还嘟囔着什么给猪娘吃火腿三明治真是个他妈的蠢主意。你们相视一笑，然后你走回桌边，把这份湿润的食物递给洛蒂，解释说你前几天看到了这个火腿三明治，觉得她可能会喜欢。洛蒂把它扔在了地上。[say:别再给我火腿三明治了，混蛋！][pg]");
            outputText("你伸出手想击掌，但没人理你。");
         }
         dynStats(DynStat.Cor(1));
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,321,FlagDict_Impl_.arrayReadInt(_loc1_,321) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gotInShapeComedyDeclineLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("哈哈，你他妈当然不是，你为什么要当真？洛蒂盯着你，眼泪在眼眶里打转。哦，哎呀——你肯定是把那句话说出声了。你完全不在乎眼前这个嚎啕大哭的猪母狗，狠狠地捏了一把她柔软的奶子，然后掏出你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "，用它扇了她一巴掌。[say: 为、为、为什么……你为什么要……*抽泣* 求、求你了……！] 猪女孩在抽泣中哽咽着。这几乎让你勃起了——几乎。你最后向后退了一步，然后大声向咖啡馆里的其他人宣布你要打出一个本垒打。洛蒂尖叫了一声，然后你拿着你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "朝她的脸挥去，正中目标，并在她刚受洗的脸颊上留下了一点先列腺液。你得意洋洋地站在你最新的艺术品前，不过洛蒂似乎有别的想法，她带着先列腺液，无比痛苦地跑出了门。你决定最好也回家，于是朝营地走去——但在那之前，你花了一个小时左右的时间追赶洛蒂，并抓了一把她丰满的屁股。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,278,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gotInShapeButTurnedDownLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         outputText("[say: 哦、哦，嗯……好吧。我明白了！你可能忙着举重呢，哈哈！] 猪女孩紧张地轻笑着，挪动毛巾遮住更多柔软的乳沟。[say: 我呃——那我就不打扰你了。我家里还有点事要做。] 你看着她慢跑出门，裹着毛巾跑进了特尔阿德雷。你决定最好也回家，于是朝营地走去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,278,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gotInShapeAcceptTrainingOffer() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,299,1);
         clearOutput();
         outputText("[say: 啊、啊，真的吗？你是认真的吗？这不是什么恶作剧之类的吧？你不会打算放我鸽子吧？] 你向她保证，如果她是认真的，你也是认真的，不过你在心里暗想，考虑到她的黑历史，她放鸽子的可能性比你大。[say: 呀！谢谢你，" + get_player().mf("大个子","宝贝") + "——我等不及要开始了！] 你轻声笑了笑，评论了她的热情。[say: 好吧，[name]，我很兴奋，因为我觉得我们俩马上就要变得超级亲密了！你感觉到了吗？感觉到了吗？] 洛蒂兴奋地扭动着身体，松开了本就暴露的毛巾，露出了她挺拔的乳头。你绝对感觉到了什么，那是肯定的。她顺着你的目光往下看，看到了自己的乳房，脸红了，赶紧尽可能地遮住自己——结果只是让她枕头般的乳房挤压在毛巾上，加深了她的乳沟。[pg]");
         outputText("你趁机好好打量了一下洛蒂。她身高大约 4 英尺 8 英寸，平均来说相当矮，");
         if(get_player().get_tallness() > 60)
         {
            outputText("并且比你矮");
         }
         else if(get_player().get_tallness() > 53)
         {
            outputText("但你也没资格评判，毕竟你们差不多高");
         }
         else
         {
            outputText("比你高");
         }
         outputText("。体格方面，洛蒂绝对比大多数女孩都要丰满一些，虽然你不能说她胖——在你见过的特尔阿德雷的少数猪人中，她绝对是“最瘦”的。她的大部分体重都集中在柔软的乳房、丰满的大腿和硕大的屁股上，不过她的肚子也圆润得恰到好处，以支撑上半身的重量。她心形的脸庞配上小巧的鼻子和柔软的嘴唇，粉灰色的头发在发尾卷曲着，衬托着她的脸庞。一条盘绕的小尾巴搭在她的臀部上方，不知不觉地把毛巾撩得很高，让她苍白的大腿一览无余。她转过身，发现你正盯着她的屁股看。[say: 总、总之，在我们开始之前，我得先去冲个澡，好吗？待会儿见！] 她转过身朝浴室走去，你的眼睛被她摇晃的屁股迷住了。[pg]");
         outputText("...[pg]");
         outputText("半小时后，你和洛蒂都在跑道上跑步。她显然专注于跟上你的速度，但几分钟后她就累坏了，开始慢跑。你放慢速度，等她追上你，然后在接下来的一圈左右和她一起快走，尽可能地闲聊。又跑了一圈后，你们决定休息一下，洛蒂为她今天的进步高兴地蹦蹦跳跳。你坐在长椅上，伸手去拿你为自己和洛蒂倒的一杯水，这时你发现另一只杯子里装满了粉红色起泡的液体。颜色本身并不那么诱人，但你的好奇心还是被激起了。这是能量饮料吗？你用空闲的手拿起杯子，闻了闻里面的东西。它有一种甜美醉人的香味，类似于草莓或泡泡糖。你立刻开始感到头晕。你知道这不是普通的蛋白奶昔。你回头看了看你的水。你真的很渴……你是为了安全起见喝水，还是喝那杯诱人又奇特的奶昔？");
         menu();
         addButton(0,"水",drinkWaterWithYourHamhock);
         addButton(1,"奶昔",drinkLustWithYourHamhock);
      }
      
      public function goJoggingWithLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         if(lottieTone() <= 70)
         {
            outputText("你告诉洛蒂你决定去慢跑，她点了点头——跑步从来不是她的强项，但只要付出足够的努力，她还是能做到的。你走向跑道，注意到有几个人在跑步。一个猎豹" + (get_noFur() ? "女孩" : "形态的人") + "相当轻松地在跑道上冲刺，而一个矮小的、像哈巴狗一样的男人只是非常满足地慢跑着。一上跑道，你决定先快走，洛蒂紧随其后，她可爱的身体随着每一个动作微微颤动。你注意到她跟上你毫无困难，所以你觉得应该加快步伐。你知道如果保持慢跑对她最好，但你自己的锻炼效果就会大打折扣。是更强烈的锻炼对你们俩都有好处，还是慢慢来更好？[pg]");
            menu();
            addButton(0,"冲刺",sprintAndLeaveLottieBehind);
            addButton(1,"慢跑",jogWithLottie);
         }
         else
         {
            outputText("你告诉洛蒂你决定去慢跑，她高兴地同意了——她现在对跑步非常满意，不像以前那么容易累了。你走向跑道，注意到有几个人在跑步。一个猎豹" + (get_noFur() ? "女孩" : "形态的人") + "相当轻松地在跑道上冲刺，而一个矮小的、像哈巴狗一样的男人只是非常满足地慢跑着。一上跑道，你决定先快走，洛蒂紧随其后。你注意到她跟上你毫无困难，所以你觉得应该加快步伐。你知道她快跑也没问题，但你自己的锻炼效果可能会大打折扣。是通过全力冲刺来专注于自己的体型更容易，还是帮助洛蒂锻炼更好？");
            menu();
            addButton(0,"冲刺",sprintAndLeaveFitLottieBehind);
            addButton(1,"慢跑",jogWithFitLottie);
         }
      }
      
      public function giveLottieReducto() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,323) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,323,FlagDict_Impl_.arrayReadInt(_loc1_,323) + 1);
            outputText("你拿出药管递给洛蒂，她注意到了侧面标着的“Reducto”字样。[say:你确定这没问题吗，[name]？]她问道，显然对把自己的减肥大计交给一小管奇怪的药膏感到怀疑。你自己也相当不确定，考虑到药膏本身的效果非常强，可能会把她涂抹的任何部位缩小到原来的一半。在解释了你对其效果的看法后，洛蒂仅存的热情现在进一步减退了。你仍然支持这个想法，不过建议她注意药膏的使用量。她含糊不清地嘟囔着，然后打开药膏，露出从尖端漏出的一点点浅色混合物。洛蒂叹了口气。[say:好吧……豁出去了。]她拿起药膏，在手指上挤了一小点，涂抹在她玫瑰色的乳房周围，确保将这种凉爽的混合物揉进她苍白的皮肤里。她把剩下的药膏用在她胖乎乎的肚子和柔软的大腿上，按摩进去。片刻之后，这三个部位都缩小了——但让你和洛蒂都松了一口气的是，效果虽然明显，但很轻微。看起来她好像瘦了一点。[pg]");
            outputText("洛蒂静静地坐着，对结果的便利性感到不确定，但很高兴你帮了忙。");
         }
         else
         {
            outputText("你拿出药管递给洛蒂，她认出了侧面标着的“Reducto”字样，抬头看着你。[say:你确定这没问题吗，[name]？]她问道，显然对把自己的减肥大计交给一小管奇怪的药膏感到怀疑。你自己一直也相当不确定，考虑到药膏本身的效果非常强，可能会把她涂抹的任何部位缩小到原来的一半。在解释了你对其效果的看法后，洛蒂仅存的热情现在进一步减退了。你仍然支持这个想法，因为到目前为止它还没有产生适得其反的效果，不过你建议她注意药膏的使用量。她含糊不清地嘟囔着，然后打开药膏，露出从尖端漏出的一点点浅色混合物。洛蒂叹了口气。[say:好吧……豁出去了。]她拿起药膏，在手指上挤了一小点，涂抹在她玫瑰色的乳房周围，确保将这种凉爽的混合物揉进她苍白的皮肤里。她把剩下的药膏用在她胖乎乎的肚子和柔软的大腿上，按摩进去。片刻之后，这三个部位都缩小了——但让你和洛蒂都松了一口气的是，效果虽然明显，但很轻微。看起来她好像瘦了一点。[pg]");
            outputText("洛蒂静静地坐着，对结果的便利性感到不确定。但很高兴你帮了忙。");
         }
         lottieTone(10);
         get_player().consumeItem(get_consumables().REDUCTO);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,321,FlagDict_Impl_.arrayReadInt(_loc1_,321) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveLottieGroPlus() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你拿出装满Gro+的针管，小心翼翼地弹了弹，以去除可能残留在这种奇怪蓝色液体中的任何气泡。洛蒂一看到这个尖锐的物体就脸色苍白，连连摇头，然后往后退。[say:不行，]她开始说道，[say:我绝不可能把那东西扎进任何地方，听见了吗？]你觉得要说服她接受这根针管需要费很大力气。[pg]");
         if(get_player().get_inte() >= 80)
         {
            outputText("你拉起洛蒂的手，用你温文尔雅的举动让她吃了一惊。你花了几分钟时间，向她讲述了你所陷入的许多困境，以及它们似乎都没有给你带来什么好报——直到你接手了那个恶魔工厂。当你描述你冒险的细节时，这位猪娘被你的每一句话深深吸引，当你提到被奴役的人类时，她感到悲伤，而当你（略微夸张地）讲述你与双性魅魔的遭遇时，她又感到钦佩。你把那根现在看来有些亵渎神明的针管举到她面前，作为你史诗般故事的结尾。你告诉她，这就是你的奖励。洛蒂看都没看第二眼，一把抓起针管，扎进了她柔软的乳房里，既没有察觉到疼痛，也没有意识到你根本没提注射器的实际效果。她满怀激动地等待着反应开始，却惊讶地发现她的胸部变得比以前更大了。她扔下针管，看着你，眼泪开始在眼眶里打转，然后跑出了咖啡馆。如果她能看到你眼中的闪光，她也许就能理解你的意图了。");
            lottieTone(-20);
            lottieMorale(-1);
            get_player().consumeItem(get_consumables().GROPLUS);
         }
         else
         {
            outputText("你抓住洛蒂的肩膀，你突然的举动让她吃了一惊。她迅速甩开你，严厉地看着你的眼睛。[say:对不起，但我真的不习惯打针，好吗？]这女孩看起来比平时严肃得多——也许她以前在减肥计划中遇到过打针？不管怎样，你告诉她，一根针管对她的身材不会有太大影响——事实上，你甚至不确定它是否有效！你得意地笑了笑，但洛蒂继续盯着你。[say:那你为什么要给我？]她从你手里夺过针管，走到垃圾桶旁把它扔了进去。你的脸扭曲成一个痛苦的表情——那根针管可是独一无二的。你站起身，走到这个猪娘婊子面前，紧紧抓住她的手臂。她恼怒地迅速转身，但一看到你愤怒的样子，立刻脸色苍白。你高高举起手，告诉她你要给她上一课，让她知道东西的价值。那根针管抵得上十亿个她。她睁大了眼睛，空着的那只手拼命地想把你推开。你挥下手，她退缩了——但你停了下来。洛蒂慢慢睁开眼睛，看到你的手停在离她脸只有几英寸的地方。当你松开手时，她尖叫着瘫倒在地，在她原本光滑的手臂上留下了一小块瘀伤。你在她低声啜泣的声音中走开，确保在出去的时候带上了那根Gro+针管。它完好无损——虽然你不能对你身后那个哭泣的婊子说同样的话。");
            lottieMorale(-5);
         }
         dynStats(DynStat.Cor(1));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,321,FlagDict_Impl_.arrayReadInt(_loc1_,321) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveLottieAnItem() : void
      {
         var _g:Lottie;
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         menu();
         addButtonDisabled(0,"咖啡馆");
         if(get_player().hasItem(get_consumables().LABOVA_))
         {
            addButton(1,"拉波娃",feedLottieLaBova);
         }
         else
         {
            addButtonDisabled(1,"拉波娃");
         }
         if(get_player().hasItem(get_consumables().GROPLUS) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0)
         {
            addButton(2,"Gro+",giveLottieGroPlus);
         }
         else
         {
            addButtonDisabled(2,"Gro+");
         }
         if(get_player().hasItem(get_consumables().REDUCTO))
         {
            addButton(3,"缩形膏",giveLottieReducto);
         }
         else
         {
            addButtonDisabled(3,"缩形膏");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,321) == 0)
         {
            outputText("你告诉洛蒂，你对减肥辅助品做了一些研究，发现了几样东西，如果她愿意尝试的话，可能会对她的身材产生影响。洛蒂点了点头，尽管有些犹豫——她以前提到过她尝试节食减肥失败的经历，所以你也不能怪她。然而，你继续推销这个想法——尝试一下也没什么坏处，而且，说不定她不知不觉就变瘦了呢！洛蒂很容易就被你的甜言蜜语打动了，并热切地同意了这个想法。你查看了一下你的物品栏——这些东西里肯定有一个能起作用，对吧？");
         }
         else
         {
            outputText("你告诉洛蒂，你可能还有一些其他物品会对她的身材产生影响，如果她愿意尝试的话。这位猪娘点了点头，尽管有些犹豫——上次你给她尝试的东西，确实改变了她的身材——但到底是变好了还是变坏了，在洛蒂的脑海里仍然是个未知数。然而，你继续推销这个想法——尝试一下也没什么坏处，而且，说不定其中任何一个都能给她带来完美的身材！再一次，洛蒂很容易就在你的巧舌如簧下融化了，热切地同意了这个想法。你查看了一下你的物品栏——这些东西里肯定有一个能起作用，对吧？");
            addButton(0,"咖啡馆",feedLottieAWholeCafe);
            if(get_silly())
            {
               addButton(4,"火腿三明治",hamSammitchTimeBIATCH);
            }
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.encounterLottie();
         });
      }
      
      public function getSuckedOffByAHamSandwich() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-gives-you-a-blowjob");
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你抓住洛蒂的肩膀，用力把她按向你的胯部。她跪了下来，面对着你的" + get_player().cockDescript(_loc1_) + "。感受着她喷吐在你[skinfurscales]上的热气，你命令她给你口交。[pg]");
         if(get_player().cocks[_loc1_].cockLength <= 4)
         {
            outputText("她盯着你的" + get_player().cockDescript(_loc1_) + "，然后抬头看着你。[say:我……哦，好吧，我想这没问题。]她慵懒地将你的肉棒吸进嘴里，尝到你" + get_player().cockDescript(_loc1_) + "的味道时发出一声呻吟。她灵活的舌头舔过你的整根肉棒，温柔地舔舐着你敏感的龟头和肉棒。你的" + get_player().cockDescript(_loc1_) + "舒服地待在她温暖的嘴里，沾满了她的唾液");
            if(get_player().cockTotal() > 1)
            {
               outputText("而你的另一根肉棒");
               if(get_player().cockTotal() == 2)
               {
                  outputText("戳着");
               }
               else
               {
                  outputText("戳着");
               }
               outputText("她的下巴");
            }
            outputText("。[pg]");
         }
         else if(get_player().cocks[_loc1_].cockLength <= 12)
         {
            outputText("她目不转睛地盯着你的" + get_player().cockDescript(_loc1_) + "，眼中充满渴望。当她向前移动时，少量的口水从她性感的嘴唇中流出，轻轻地吻着你的");
            if(get_player().cockTotal() > 1)
            {
               outputText("最大的龟头");
            }
            else
            {
               outputText("龟头");
            }
            outputText("。她的唾液滴在你的" + get_player().cockDescript(_loc1_) + "上，不过她很快就把它舔干净了，同时她的舌头在你的肉棒周围游走");
            if(get_player().cockTotal() > 1)
            {
               outputText("，用双手套弄着你的" + get_player().cockDescript(get_player().biggestCockIndex2()) + "");
            }
            outputText("。她在你的龟头上轻轻地舔了几下，然后饥渴地一口吞下你剩下的肉棒。[pg]");
         }
         else
         {
            outputText("当你抬起你的" + get_player().cockDescript(_loc1_) + "拍打她的脸时，她倒吸了一口凉气。[say:这……哇，[name]！]你咧嘴一笑，然后用你");
            if(get_player().cockTotal() > 1)
            {
               outputText("最大的勃起");
            }
            else
            {
               outputText("勃起");
            }
            outputText("的顶端戳了戳她胖乎乎的脸颊。当她向前移动时，少量的口水从她性感的嘴唇中流出，轻轻地吻着你的龟头。她的唾液滴在你的" + get_player().cockDescript(_loc1_) + "上，不过她很快就把它舔干净了，同时她的舌头在你长长的肉棒周围游走");
            if(get_player().cockTotal() > 1)
            {
               outputText("——用她的双手按摩你剩下的" + get_player().cockDescript(get_player().biggestCockIndex2()));
            }
            outputText("。她在你的龟头上轻轻地舔了几下，然后毫无预兆地把你的粗大肉棒尽可能多地塞进嘴里，在你的" + get_player().cockDescript(_loc1_) + "周围咳嗽着。[pg]");
         }
         outputText("她以惊人的速度开始吮吸你的肉棒，用力将你的" + get_player().cockDescript(_loc1_));
         if(get_player().balls > 0)
         {
            outputText("，你的阴囊拍打着她的下巴");
         }
         else if(get_player().biggestTitSize() > 2)
         {
            outputText("你一边玩弄着自己的" + get_player().biggestBreastSizeDescript());
         }
         outputText("。你调侃她一定是个贪吃的小母猪，胖女孩则以呻吟回应，那震动按摩着你的阴茎。享受着你的" + get_player().cockDescript(_loc1_) + "在她饥渴的双唇间的感觉，你开始向她温暖的口腔里挺进，抓住她的头，把她的脸按在你的腹股沟上。");
         if(get_player().cockTotal() > 1)
         {
            if(get_player().cockTotal() == 2)
            {
               outputText("你多余的阴茎狂乱地甩动着，拍打着她的脸颊。");
            }
            else if(get_player().cockTotal() > 2)
            {
               outputText("你多余的阴茎狂乱地甩动着，拍打着她的脸颊。");
            }
         }
         outputText("当你无情地在她的嘴里进进出出时，洛蒂滑溜溜的舌头拼命地缠绕着你的阴茎，口水开始从她嘴里漏出来。她");
         if(get_player().cockTotal() > 1)
         {
            outputText("停止摩擦你的" + get_player().cockDescript(_loc1_) + "，转而");
         }
         else
         {
            outputText("伸手探向她滴水的阴户；将两根手指插入她的湿润处，同时用另一只手");
         }
         if(get_player().balls > 0)
         {
            outputText("揉捏你的[balls]");
         }
         else
         {
            outputText("绕到后面捏住你的[ass]");
         }
         outputText("。你抓住她的后脑勺，把她拉得更近，当她吸吮你的肉棒时，让她的头上下摆动。这种刺激几乎让你当场爆发，但她跳动的乳房给了你一个主意。[pg]");
         outputText("你慢慢地把你的" + get_player().cockDescript(_loc1_) + "从她火热的嘴里抽出来，伴随着一声轻微的*啵*声打破了寂静，它离开了她丰满、撅起的嘴唇。你双手抓住她的一只大奶子，把你的龟头在她挺立的乳头上摩擦，引得这个汗流浃背的荡妇发出一声轻微的呻吟。你把你的" + get_player().cockDescript(_loc1_) + "在她汗湿的胸前拍打了几下，然后把它埋在她的乳沟里，");
         if(get_player().cocks[_loc1_].cockLength > 12)
         {
            outputText("你敏感的龟头擦过她渴望的嘴巴");
         }
         else
         {
            outputText("舒适地躺在她柔软的乳房之间");
         }
         outputText("。洛蒂用她的奶子包裹住你的阴茎，开始努力取悦你的每一寸肌肤。[pg]");
         if(get_player().cocks[_loc1_].cockLength > 12)
         {
            outputText("洛蒂舔着你的龟头，把她的乳房挤压在你的阴茎上，确保舔掉从你龟头喷出的零星先列腺液。享受着你的" + get_player().cockDescript(_loc1_) + "在她嘴里的味道，她开始吸吮你的龟头，用舌头在你的尿道周围弹动，并把丰满的嘴唇压在上面，在你的阴茎周围创造了一个充满快感的真空。[pg]");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("你决定利用");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的");
            }
            else
            {
               outputText("一根");
            }
            outputText("多余的阴茎，你把它推入她撅起的嘴唇之间，当她试图用乳房夹住你的主阴茎时，她的脸擦过它。洛蒂抬头看着你，俯下身开始为你口交" + get_player().cockDescript(get_player().biggestCockIndex2()) + "，同时不忘把她肥大的奶子揉进你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         }
         outputText("看着她上下起伏着身体，你注视着这个母猪荡妇用她的双乳紧紧地按摩着你的肉棒，而你则在她的乳沟间穿插，微微挺动以配合她的动作。[say:[name]，求、求你射在我身上，天哪——我需要这个！]她呻吟着，口水润滑着她的胸部，同时她在她的双峰之间套弄着你的阴茎");
         if(get_player().cockTotal() > 1)
         {
            outputText("并且被你的肉棒呛到了");
         }
         outputText("。你在她火热的肉体上跳动，感觉到你的精液在体内沸腾。你仰起头，做最后一次冲刺，然后拔出，在你柔软的荡妇身上爆发，");
         if(get_player().cumQ() < 500)
         {
            outputText("浓稠的精液溅了她一脸，并在她的双乳之间汇聚");
         }
         else
         {
            outputText("大量的精液溅了她一脸，涂满了她的双乳");
         }
         outputText("。她继续在双乳之间的粗大肉棒上上下移动，决心榨干你的精液。她把你从她的胸部拔出，然后把你的阴茎塞回她的嘴里，吸吮着任何残留的乳汁。过了一会儿，当她把你吐出来时，你呻吟着，她收集了");
         if(get_player().cumQ() > 500)
         {
            outputText("难以置信的大量");
         }
         outputText("你涂抹在她肉体上的精液，并将其全部吞下。[say:谢谢你的精液，" + get_player().mf("大个子","宝贝") + "，]她说道，轻轻地吸吮着她的手指。[say:我……我会再见到你的，嘿！]你拍了拍她的头，开始走出健身房，确保在出去的路上拿一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         lottieTone(-1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,306) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,306,1);
         }
         outputText(get_player().modTone(100,1));
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckElleInsteadOfThatFatSlutFirstTime() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你在赤裸而饥渴的后宫面前脱下衣服，发出邪恶的轻笑——但你的眼中只有一个女孩。你指着蜘蛛娘，告诉她们俩你只打算操她。洛蒂可能以为她能用另一个荡妇来讨好你，但你觉得你应该给她一个教训，让她知道不要对你的需求太过自以为是。艾尔向你走来，她那好生养的臀部以一种催眠般的节奏摇曳着，同时她");
         if(get_player().cockTotal() == 1)
         {
            outputText("开始用两只手抚摸你的" + get_player().cockDescript(_loc1_) + "，而另一只手则开始");
            if(get_player().balls > 0)
            {
               outputText("按摩你的蛋蛋");
            }
            else if(get_player().hasVagina())
            {
               outputText("按摩你的小穴");
            }
            else
            {
               outputText("按摩你的屁股");
            }
         }
         else
         {
            outputText("用她的四只手握住你的[cocks]，轻松地套弄着每一根");
         }
         outputText("。洛蒂站在你们俩旁边，一边看着这色情的画面自慰，一边小声啜泣着。你决定进一步戏弄洛蒂，你绕过蜘蛛娘，用手指享受她湿滑的小穴，并在她为你打飞机时，将自己的嘴唇贴在她的嘴唇上。你抱起蜘蛛娘，一个利落的动作，将她刺穿在你的" + get_player().cockDescript(_loc1_) + "上，抓住她充满女人味的大腿，用你的肉棒抽插着她。当你在这个健美的女人身上尽情发泄时，她的四只手臂紧紧地抱住你，她肩膀上的吐丝器无力地悬垂着，却又因为悸动的需求而勃起。难道它们是……？你迅速打消了这个念头，继续你野蛮的欲望展示，用舌头探索着女孩的口腔，时不时瞥一眼洛蒂，确保她目睹了每一次抽插。猪娘不知羞耻地四仰八叉躺在地板上，一边呻吟一边疯狂地自慰，看着她最好的朋友被她的爱人无休止地耕耘。洛蒂将出汗的大腿紧紧夹在一起，尖叫一声，在性高潮中颤抖。她被打败了，痛苦地躺在地上。这给了你一个主意。你紧紧抱住艾尔，走向那个淫荡的猪娘，将自己置于她的上方，而她最好的朋友则在你的肉棒上弹跳。洛蒂睁开眼睛，看到这位古铜色美人的紧致屁股拍打着你的腹股沟，你们混合的体液从她被蹂躏的洞口漏出。[say:为……为什么……]猪娘在啜泣中哽咽着，但随着你感觉到自己释放的欲望越来越强烈，你只是加快了速度。你继续毫不费力地捣弄着你的新婊子，精液在你的腹股沟里翻滚，直到你迈出最后一步，深深地刺入她的体内。你的精液像绳索一样溅在她的内壁上，漏出来，涂满了你身下无助的猪娘。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你多出来的鸡巴");
            if(get_player().cockTotal() == 2)
            {
               outputText("跳动着，将它的精华洒在地板上和洛蒂身上。");
            }
            else
            {
               outputText("跳动着，将它们的精华洒在地板上和洛蒂身上。");
            }
         }
         outputText("艾尔也紧随其后，在达到自己的顶峰时发出愉悦的呻吟，她的小穴收紧，包裹着你的长度，将你剩下的精液困在里面。她肩膀上的吐丝器在性高潮中跳动，喷出黏糊糊的、看起来像丝线一样的团块，喷向空中，然后落回到猪娘身上，精液在她的乳沟周围汇聚。你们俩都放松下来，让蜘蛛娘从你身上下来，瘫倒在地板上。你弯下腰，看着洛蒂，然后将你的" + get_player().cockDescript(_loc1_) + "塞进她体内，让最后的一股精液填满她。[say:令人满意，]你嘟囔着，重新穿好衣服，走向门口");
         if(get_silly())
         {
            outputText("，确保在出去的路上拿一杯培根奶昔。你只需要一杯就能满足了");
         }
         outputText("。");
         outputText("[pg](<i>在洛蒂的性爱菜单中解锁了“艾尔”。</i>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,317,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,298,FlagDict_Impl_.arrayReadInt(_loc2_,298) + 1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(2),DynStat.Cor(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fourthMeetingChooseSexWithLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,298,FlagDict_Impl_.arrayReadInt(_loc1_,298) + 1);
         var _loc2_:int = get_player().cockThatFits(40);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         outputText("你告诉她，只要她愿意听你的，你完全不介意。[say: 哇，你真的想……和我？好的，当然，让我呃，等一下……]她手忙脚乱地脱衣服，显然是想在你阻止她之前在公共场合脱光——明明有更好的地方可以做这种事。你牵着她的手，把她带进一间空桑拿房，你的勃起在裤子里蠢蠢欲动，你越来越渴望占有她。[say: [name]……我——我真的不知道从哪里开始，嘿。]她不安地看了你一眼，她沉重的呼吸和渴望的眼神表明她希望你来主导。你当然不会让她失望，你抓住她的臀部，把她按在墙上，撕开她的衣服，露出她天鹅绒般的肌肤。你伸手抓住她丰满的屁股，轻轻地揉捏拍打。洛蒂在你的肩膀上呻吟着，伸手摸向你的腹股沟，脱下你的[armor]。她开始轻轻地抚摸你的" + get_player().cockDescript(_loc2_) + "，随着你继续揉捏她挺翘的臀部，她的动作也越来越快。你忍不住对她丰满的身材垂涎三尺，一只手紧紧抓住她柔软的双峰，另一只手伸向她闪闪发光的小穴。你的手在她柔软的胸部上游走，然后把头埋进她的胸膛，急切地吸吮着她的一颗乳头，用拇指和食指抚摸着另一颗。你的另一只手已经开始快速地动作，用手指抽插她滚烫的小穴。你能感觉到她的双腿快要支撑不住自己的重量了。洛蒂在短促而灼热的呼吸间呻吟着，[say: 你……真的很棒，" + get_player().mf("帅哥","美女") + "。]你用力拍了一下她胖乎乎的屁股表示赞同。洛蒂高兴地尖叫起来，撸动着你的" + get_player().cockDescript(_loc2_) + "，让它戳进她柔软的肚子。你的龟头摩擦着她天鹅绒般的肌肤，这种感觉让你发狂。[pg]");
         outputText("你告诉洛蒂你决定带她进行一次剧烈的锻炼。她只能满怀期待地喘息着。[pg]");
         menu();
         addButton(0,"口交",getSuckedOffByAHamSandwich);
         addButton(1,"肛交",analLottieMilkshake);
      }
      
      public function firstOralReactionChooseEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉她这不是她的错；结果不会在最初的几周内奇迹般地出现。她的体重现在肯定会波动，这完全是自然的。她抬头看着你，眼睛微微湿润。[say:真的吗？这完全是自然的？]你点点头。[say:我很高兴。我太高兴了。]她吸了吸鼻子，擦去眼泪，深吸了一口气。当她把手放在你的手上时，你揉了揉她的肩膀。洛蒂继续谈论她的一天几分钟，然后你们俩决定去跑道。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function firstOralReactionChooseAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你告诉洛蒂你的方法从不失败，如果发生了不该发生的事情，那就是她的错。她抬起头看着你，对你的爆发感到震惊。她一时语塞，眼眶开始湿润。[say: 我……天哪，我太蠢了！当然是我！总是我！] 她暗自轻声哭泣，推开你放在她肩膀上的手，把头埋在臂弯里。[say: 我浪费了你的时间！我……我……] 在她说完之前，你离开了咖啡馆，对自己的所作所为感到满意。直到你离开健身房，返回营地，你都能听到她呜咽的声音——你感到一种莫名的满足。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function firstAnalReactionChooseEncourage() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你祝贺她的成功；你很自豪她决定坚持到底。洛蒂对你微笑，显然很高兴再次和你在一起。你问她是否想在桑拿房里见你，做一些“伸展运动”——重读最后一个词，同时用手指做出夸张的引号。[say:哈哈，对不起，[name]，但说实话，我的屁股从我们上次伸展以来还在疼。如果我们，呃，现在做一些常规运动可以吗？]你们俩都轻笑出声，尽管你完全是认真地想在桑拿房里干她。无论如何，你决定让它休息一下，并告诉她你要去跑道，如果她愿意加入你的话。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]在进行了一次充分的锻炼后，你决定疲惫地返回营地。");
         lottieMorale(3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function firstAnalReactionChooseAbuse() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你对洛蒂冷笑，严厉地提醒她，她现在的样子离她的目标还差得远——几磅的重量不会改变任何事情。事实上，她可能只是在早上量了量自己，而且很可能她根本没有减肥，因为她是一头猪。洛蒂似乎无话可说。她盯着你，想知道这一切是从哪里来的。几秒钟的沉默后，她开始抽泣，从椅子上站起来，跑出了健身房。不过你知道她会回来的。决定你在这里的事情已经结束，你返回营地——感到一种奇怪的满足感。");
         lottieMorale(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedLottieLaBova() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,322) == 0)
         {
            outputText("你拿起那瓶拉波娃，在递给洛蒂之前，确保偷偷撕掉了上面那个大胸牛娘的标签。[say:这能帮我减肥？你确定吗？]她说着，观察着玻璃瓶里旋转的雾状液体。你热切地点头，提到你见过它能收紧腰部和锻炼大腿。[say:哦！好吧……既然你这么说，]洛蒂说道，被能拥有更苗条身材的保证说服了。[say:豁出去了！]猪娘惊呼一声，然后一口气喝下了这种颗粒状的混合物，并称赞它甜甜的牛奶味。她低头看着自己的身体，渴望观察到预期会发生的瞬间变化。[say:咦？我……我觉得有点奇怪，亲爱的，]洛蒂嘟囔着，迅速看向你，然后尖叫起来，刚好及时低头看到她的乳房和臀部变得比以前稍微大了一些。[say:呃-咦？！怎么回事？你给我吃了什么，[name]？为什么会……为-为……]现在变得更胖的女孩惊得说不出话来，瘫倒在地，无法理解你的行为。你对她的新身材笑了笑，蹲下来好好捏了捏她那乳白色的奶子。[say:我-我不明白……]她呜咽着，在你的触碰下退缩了。她可能需要一段时间才能接受你给的任何其他东西，但你忍不住觉得你做了一件好事。她迟早会明白的。");
         }
         else
         {
            outputText("你拿起那瓶拉波娃，偷偷地把里面的东西倒进一个不透明的容器里，然后再递给洛蒂，掩盖了它乳白色的内容物。[say:这-这有什么用？你知道吗？]她问道，试图往瓶子里看，但没成功——里面太暗了，看不清里面装的雾状药剂。你告诉她你不确定它的确切效果，但它确实提到了关于改变你的胸部和厚度的东西。[say:哦！好吧……既然你这么说，]洛蒂说道，被能拥有更苗条身材的明显保证说服了。[say:豁出去了！]猪娘惊呼一声，然后一口气喝下了这种颗粒状的混合物，停下来品味它那熟悉的甜味。她低头看着自己的身体，渴望观察到预期会发生的瞬间变化。[say:嘿，亲爱的，我……我又有了那种感觉。]洛蒂嘟囔着，迅速看向你，然后尖叫起来，刚好及时低头看到她的乳房和臀部变得比以前稍微大了一些。[say:呃-咦？！但我以为——你给我吃了什么，[name]？为什么会……为-为……]现在变得更胖的女孩惊得说不出话来，瘫倒在地，无法理解你的行为。你对她的新身材笑了笑，蹲下来好好捏了捏她那乳白色的奶子。[say:我-我不明白……]她呜咽着，在你的触碰下退缩了。她可能需要一段时间才能接受你给的任何其他东西，但你忍不住觉得你做了一件好事。她迟早会明白的。");
         }
         get_player().consumeItem(get_consumables().LABOVA_);
         lottieTone(-10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,322,40);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,321,FlagDict_Impl_.arrayReadInt(_loc1_,321) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function feedLottieAWholeCafe() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你决定最好在咖啡馆找点东西喂这女孩，虽然你知道洛蒂不太愿意吃她知道会让她变胖的东西。不管怎样，你告诉她你没吃早餐，而且你已经饿了一整天了。洛蒂关切地建议你买点吃的，但你告诉她，如果洛蒂必须留下来看着你吃，你会觉得过意不去。她不介意，但你进一步坚持。最终，她让步了，并告诉你如果你买，她也会买点吃的。你微笑着走到咖啡馆，问店员他们是否有面包房的存货。他微笑着递给你某种泡芙糕点，同时你为这件物品以及从玻璃展示柜里随便挑的一个三明治支付了相应的宝石。坐回座位后，你把点心递给洛蒂，同时自己也狼吞虎咽地吃起了自己的饭。[say:这……这个可以吃吗？]她问道，打量着你给她买的裹着巧克力的美味。没等你回答，洛蒂就咬了一口巧克力，随着蓬松的奶油内馅喷涌而出，她尖叫起来。[say:这-这太好吃了！我的天哪！]没过多久，这贪婪的猪娘就色情地吞噬了这块巧克力甜点，然后她内疚地抬头看着你。[say:我希望那对我没什么坏处……]她叹了口气。你耸了耸肩，告诉她这可能对她的体重一点影响都没有。[pg]");
         outputText("你心里清楚这肯定会有影响的。");
         lottieTone(-5);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,321,FlagDict_Impl_.arrayReadInt(_loc1_,321) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ewLottieNo() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你开始讲述你的故事，讲述你是如何来到玛瑞斯的，以及你是如何走到今天这一步的。你遇到过恶心的事情，你也见过人们自己变成恶心的怪物。你也知道从那以后你已经改变了。你变成了一个你一百万年也没想到自己会变成的人——至于这是好是坏，由你自己决定。你知道你经历过艰难的时期，但你从来没有后悔过你所做的决定——因为它们把你引向了她。引向了洛蒂。女孩听到你的告白，开始流泪。[say: 哦，[name]，我……]但随后你笑了。你笑得比你来到这个地狱洞穴以来的任何时候都要大声。事实上，你敢打赌这是你在玛瑞斯第一次笑。洛蒂的脸立刻皱了起来，开始嚎啕大哭，但你根本不在乎，你站起来指着那个猪头荡妇，咖啡馆里的顾客都好奇地看着你们俩。[say: 注意了，毛茸茸的混蛋们]你大喊道，这让盯着你们看的拟人化动物人们感到非常厌恶。[say: 这个荡妇——]你指着洛蒂。[say: ——不吃我的火腿三明治。]从越来越多的人群中传来清晰可闻的倒吸冷气声。洛蒂把头埋在手里，但你的长篇大论还在继续。走到柜台前，你看了那个毛茸茸的店员一眼，然后他点点头，递给你前面提到的三明治。奇怪，你不记得他毛茸茸的——你真的需要在这个沙坑里找副他妈的眼镜。不管怎样，你大步走到猪娘面前，把她从座位上拉起来，强行把肉食塞进她的喉咙。她干呕了一秒钟，然后不情愿地吞下了她自己的同类。你抓住她的脸颊，把她的脸拉向你几英寸。[say: 你让我恶心。]你告诉她，然后掏出你的[cock]，操她塞满火腿和面包的嘴。]蛋黄酱列车来啦！]你大喊着，直接射进她的食道和她松弛的深渊里。[pg]");
         outputText("几个小时以来，人们轮流把他们的种子泵入洛蒂体内，而你则赤身裸体地围着她跳舞，对着周围模糊的人群高呼淫秽的话语。[pg]");
         outputText("你真的需要眼镜。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,278,1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encounterLottieCharge() : void
      {
         encounterLottie(true);
      }
      
      public function encounterLottie(param1:Boolean = false) : void
      {
         var _loc2_:* = null as Player;
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-encounter");
         if(param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
            {
               outputText("在门口工作的半人马娘走上前来收取费用，你把10颗宝石放在她手里，作为在健身房锻炼一小时的费用。[pg]");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() - 10);
               statScreenRefresh();
            }
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,281,FlagDict_Impl_.arrayReadInt(_loc3_,281) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,279,50);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,280,50);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,50);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,308,50);
            outputText("你走向那个猪娘，她正用毛巾紧紧裹住自己，凸显出她丰满的身材。她的眼睛四处张望，寻找可能在看她的人，当她看到你朝她走来时，她尖叫了一声，显然在像你这样身材健美的人面前对自己的身体感到尴尬。这位慌乱的女士迅速将注意力转移到别处，开始快步朝相反的方向走去，结果却和一堵墙撞了个正着。她转过身朝你走来，脸颊明显比刚才更红了。[pg]");
            outputText("[say:啊！你好，我刚才没看到你！哦呵呵！]她脱口而出，尴尬地伸出手臂，似乎是想握手。你在心里祝贺她试图把过去几秒钟的事情掩盖过去的尝试，并回握了她的手，这让她松了一口气。你确信如果你不这么做，她会尴尬死的。她深深地叹了口气，微笑着迎上你的目光。你推断这多半是她第一次来这里，所以才会这么紧张。[say:我想你抓到我的现行了，是吧？我尝试减肥好几年了，但总是失去动力。]女孩解释道。[say:你知道他们怎么说的——万事开头难。]你们一起走出泳池区时，你点头表示同意。[pg]");
            outputText("猪娘开始喋喋不休地谈论她过去减肥的尝试，从吃奇怪的药丸到主要吃鸡蛋——大部分都和吃有关。你问她以前是否锻炼过。面对突如其来的询问，她看起来明显受到了伤害，但还是继续说下去。[say:说实话，我从来没去过健身房——我总是停在门口。我以前因为新陈代谢快，想吃什么就吃什么，但现在报应来了。我现在挺胖的！]她被自己的笑话逗笑了，尽管她显然因为意识到这一点而感到悲伤。你告诉她，不管怎么说，她看起来还是很棒。[pg]");
            if(!get_player().hasTailInsteadOfLegs() && !get_player().isTaur() && get_player().tone >= 50)
            {
               outputText("[say:真、真的吗？你这么认为？]她脸红了，低头看着自己的脚。[say:你知道，当我和你在一起时，我忍不住感到非常自信——这可能和你那些大肌肉有关！]她调皮地戳了戳你的二头肌。[say:嘿，我在想……你喜欢，想做健身伙伴吗？我非常需要减肥，而且我想——我知道如果我和像你这样的人在一起，我能做到。][pg]");
               doYesNo(acceptBeingLottiesHamSandwich,declineBeingLottiesGymHamsandwich);
            }
            else
            {
               outputText("[say:哦，呃……谢谢！嘿，听着——我现在得去上瑜伽课了，但能和你倾诉这一切感觉很棒。我们有时间应该再见一面！]女孩咧嘴一笑，慢跑向淋浴间。[say:顺便说一句，我叫洛蒂！][pg]");
               outputText("你在这里也没什么别的事可做，所以你决定回家。");
               doNext(get_camp().returnToCampUseOneHour);
            }
            return;
         }
         outputText("你走向那个猪娘");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) >= 50)
         {
            outputText("放松地");
         }
         else
         {
            outputText("胆怯地坐在");
         }
         outputText("桌子旁，穿着低胸上衣和超短裤，凸显出她");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 50)
         {
            outputText("丰满的");
         }
         else
         {
            outputText("曲线优美的");
         }
         outputText("身材。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,297) == 0)
         {
            outputText("轻轻地抿着");
         }
         else
         {
            outputText("大口吸溜着");
         }
         outputText("看起来像是");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,297) == 0)
         {
            outputText("一些果汁");
         }
         else
         {
            outputText("一杯奶昔");
         }
         outputText("，当她看到你时，她的目光在房间里游移，并向你挥手");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) >= 70)
         {
            outputText("兴奋地");
         }
         outputText("。你走到她身边坐下，听洛蒂向你汇报她的进展。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,299) == 0 && (get_player().hasTailInsteadOfLegs() || get_player().isTaur() || get_player().tone < 50))
         {
            outputText("[say: 嘿，[name]！我……我真的很高兴能和你谈论我自己，你真的是个很棒的朋友，你知道的。我真的觉得这次如果我努力的话，一定能取得一些成就！]你微笑着告诉她，你很高兴她能这么做。洛蒂露出高兴的表情，继续说道。[say: 无论如何，我一直在尝试找一个私人教练，但这有点困难，呵。我的意思是……我确定这里有很多教练，但我——我更喜欢我认识的人，对吧？]她满怀期待地看着你，但随后又看向地板。[say: 但我想我们不能总是得到我们想要的。][pg]");
            menu();
            addButton(0,"离开",get_telAdre().gym.gymDesc);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,299) == 0)
         {
            outputText("[say: 嘿，[name]！我只是……我……]洛蒂似乎不知道该说什么，目瞪口呆地看着你那崭新、轮廓分明的体格。你微笑着告诉她，你很高兴她能这么做，虽然她还没找到私人教练有点遗憾。洛蒂露出迷茫的表情，张着嘴回应。[say: 是-是的……真遗憾……]她开始说道，直到从发呆中回过神来，兴奋地抬头看着你。[say: 我-你知道，我不知道你最近对自己做了什么，但是……你看起来……你现在真的很棒，" + get_player().mf("大个子","宝贝") + "！]当你向她展示肌肉时，她尖叫起来，对你明目张胆的炫耀咯咯地笑。你从来没把她当成一个懂得欣赏肌肉的人，但你觉得她对完美身材的痴迷可能也会延伸到其他人身上。你严厉地看了一眼面前这个胖乎乎的猪女孩，咧嘴一笑，问她是否想让你做她的私人教练。她似乎对你的提议感到震惊。[say: 你……你是认真的吗？][pg]");
            outputText("那么，你是认真的吗？");
            menu();
            addButton(0,"是",gotInShapeAcceptTrainingOffer);
            addButton(1,"否",gotInShapeButTurnedDownLottie);
            if(get_silly() && (get_player().isCorruptEnough(80) || get_player().hasPerk(PerkLib.Sadist)))
            {
               addButton(2,"绝对不行",gotInShapeComedyDeclineLottie);
            }
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,298) > 0)
         {
            outputText("[say: 嘿，[name]！我……我真的很喜欢我们做的事。天哪，如果这就是变健康所需要的，我不会介意的！我想我已经爱上你了，哈哈！]她在最后一句话时强颜欢笑，尽管显得相当紧张。你挑了挑眉，但决定不再追问。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) == 2)
         {
            outputText("[say: 嘿，[name]！我……我真的很高兴我们能这么做，你知道吗？我真的觉得这次如果我努力的话，一定能取得一些成就——如果你和我一起努力的话！]你微笑着告诉她，你很高兴她能这么做。当你们俩恢复正常交谈时，洛蒂露出了高兴的表情。");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) == 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,298) == 0)
            {
               outputText("[say: 嘿，[name]，很高兴再次见到你。嗯，我……如果你不介意的话，我有件事想问你。]你抬头看着洛蒂，好奇心被激起了。[say: 嗯，呃！昨晚我在酒吧，有位女士告诉我，呃……你看，有这么一种，嗯，一种技巧。有一种技巧。一种性爱技巧。]你对她明显的尴尬微笑，而她的脸变得比平时更粉红。你不否认像洛蒂这样的女孩在性方面可能有一些经验，但她显然对这个问题感到不舒服。尽管如此，她还是继续说道。[say: 我只是听说，嗯，这种性爱技巧，它能帮你减肥，你知道吗？我在想，我们做了那么多运动……那性爱呢？]洛蒂身子前倾，把乳房压在桌子上，试图从你那里得到答案。如果说有什么的话，她那笨拙的直率很可爱。");
               outputText("[pg]你是接受她的提议，还是觉得只做运动伙伴更容易？");
               menu();
               addButton(0,"性爱",fourthMeetingChooseSexWithLottie);
               addButton(1,"伙伴",stayLottieBuds4Evah);
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,301) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,300) > 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) <= 30)
            {
               outputText("[say: 嘿，[name]，我……我真的不知道你最近怎么了。求求你，求求你别再这么凶了，宝——我是说，[sir]。求求你别这样。]她在最后一句话时强颜欢笑，尽管你能看出她非常紧张。你挑了挑眉，但决定不再追问。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,301,1);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280));
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,301) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,300) > 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) <= 30)
            {
               outputText("[say: 嗨-嗨，[name]……我注意到你……你-你的表现就像我做错事时一样。我做错什么了吗？求-求求你，我真的不喜欢看到你这么凶。请别这样。]她在最后一句话时强颜欢笑，尽管你能看出她非常紧张。你挑了挑眉，但决定不再追问。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280));
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,300) <= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) > 30)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280));
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,302) == 0)
               {
                  outputText("[say: 嗨、嗨，[name]！我……我真的很高兴你又变好了。说实话，当你生气的时候，那——我真的很害怕，你知道吗？但我很高兴，即使我们只是这样。]她向你露出一个真诚的微笑，她相信你不会再虐待她了。你回以微笑，默默地向她保证，今天不会了。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,302,1);
               }
               else
               {
                  outputText("[say: 嗨、嗨，[name]。谢、谢谢你开、开朗了一点，你刚才……我有一阵子真的很害怕。我知道你是为我好，但有时候……好吧，现在都过去了，哈哈！]她向你露出一个真诚的微笑，她相信你不会再虐待她了。你回以微笑，默默地向她保证，今天不会了。");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,300) > 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) <= 80)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280));
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,303) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,303,1);
                  outputText("[say: 嘿，[name]……有什么不对劲吗？是不是……是不是和我有关？我知道我有时会说很多蠢话，但看到你这么残忍……我……我不知道。我只是以为我们可能更亲近了。我、我想我错了，哈哈。]她勉强笑了笑，不知道该如何理解你最近的举动。你面无表情地坐着，对她的指责毫无反应，这只会让她变得更加不舒服。空气中弥漫着沉重的沉默。");
               }
               else
               {
                  outputText("[say: 嘿，[name]。我不知道你有什么大主意，但是……你真的必须停止现在的样子，你知道吗？我……我不知道这是不是我的错，但这并不意味着我们不能谈谈。这绝对不能成为你当混蛋并玩弄……玩弄我感情的借口。好吧，不管怎样。]她皱起眉头，不知道该如何理解你最近的举动。你面无表情地坐着，对她的指责毫无反应，这只会让她变得更加不舒服。空气中弥漫着沉重的沉默。");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,300) <= 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) > 80)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280));
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,304) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,304,1);
                  outputText("洛蒂看起来比平时紧张得多，她把头发卷在手指上，摆弄着手里的茶杯。[say: 嗨、嗨……嗨 " + get_player().get_short() + "，]她尖叫着，在自己施加的巨大压力下无法组织语言。你把手放在她的手上以缓解她的压力，但这似乎让她更加紧张。[say: 哦！我……天哪，" + get_player().get_short() + "，我不知道该说什么！]洛蒂摇了好几次头，嘟囔着“振作起来，夏洛特！”然后重新开始。[say: 我喜欢你！我真的、真的喜欢你，[name]！]她扯着嗓子尖叫，兴奋地跳了起来，然后立刻用手捂住嘴，因为她意识到自己引起了整个咖啡馆的注意。你默默地走到她身边，把她的手放下来，然后把她拉进一个温暖的拥抱。[say: 我……我……]你低下头，拨开她眼前的头发，在她的额头上轻轻吻了一下，让她平静了许多。[say: 你也喜欢我吗？]她问。你笑了，比以前抱得更紧了，空气中弥漫着黑樱桃和玫瑰的香味。当你拥抱这个女孩时，她的声音在你的脑海中回荡。你也喜欢我吗？[pg]");
                  outputText("你不知道答案。");
               }
               else
               {
                  outputText("[say: 嘿，[name]。谢谢你……又变好了。有时候我真的很担心你，但是……好吧；我很乐意把那件事抛在脑后。我很高兴，你知道吗？]她向你微笑，相信你不会再虐待她了。你回以微笑，默默地向她保证，今天不会了。");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) >= 60)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,297) == 0)
               {
                  outputText("[say: 哦，[name]！今天我们要尽力而为，我真的很想减掉那些肉！我知道和你在一起的时候我能做到最好！]洛蒂笑容满面，她巨大的乳房压在桌子上。她似乎对你今天准备的东西感到兴奋。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 20)
               {
                  outputText("[say: 嘿，" + get_player().mf("帅哥","小可爱") + "！你不应该让像我这样的大女孩久等；除非你想被这些压扁！]洛蒂咧嘴一笑，紧紧抓住她丰满的乳房，当她注意到你现在全神贯注时，她咯咯地笑了起来。她似乎对你今天准备的东西感到兴奋。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 40 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,297) == 0)
               {
                  outputText("[say: 啊，[name]！我们可能应该尽快开始；我今天要把自己推向极限！]洛蒂双臂交叉在胸前，下意识地试图掩饰她的紧张，尽管在这个过程中挤压了她柔软的乳房。她似乎对你今天准备的东西感到兴奋。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 40)
               {
                  outputText("[say: 嘿，" + get_player().mf("帅哥","小可爱") + "！你不应该让我久等；我现在唯一失去的就是我的耐心！]洛蒂咧嘴一笑，调皮地捶了你的手臂一拳，当你试图反击时，她尖叫起来。她似乎对你今天准备的东西感到兴奋。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 60)
               {
                  outputText("[say: 嘿！我早些时候在找你，你知道吗？我等不及要开始了。]看到你来了，她看起来很高兴。洛蒂俯身去拿她的饮料，让你能清楚地看到她柔软的双峰。她似乎对你今天准备的东西感到兴奋。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 80)
               {
                  outputText("[say: 哟，" + get_player().mf("大个子","宝贝") + "！我一直在等你，所以你最好兴奋起来！准备好开始了吗？]洛蒂俯身，她白嫩的乳房压在桌子上。她似乎对你今天准备的东西感到兴奋。");
               }
               else
               {
                  outputText("[say: 嘿，" + get_player().mf("帅哥","小可爱") + "！你不应该让我久等，否则我会让你加倍努力！准备好了吗？]洛蒂向你眨眨眼，调皮地捶了你的手臂一拳。她似乎对你今天准备的东西感到兴奋。");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,280) >= 30)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 20)
               {
                  outputText("[say: 哦，[name]，嘿。我想我们今天应该试着进入状态。我觉得我上次不够努力，你知道吗？]洛蒂俯身去拿她的饮料，她巨大的乳房压在桌子上。她似乎打算今天尽力而为。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 40)
               {
                  outputText("[say: 啊、啊，[name]！我们可能应该尽快开始；我……我今天想把自己推向极限！]洛蒂双臂交叉在胸前，下意识地试图掩饰她的紧张，尽管在这个过程中挤压了她柔软的乳房。她似乎对你们俩今天打算做什么感到好奇。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 60)
               {
                  outputText("[say: 嘿、嘿！我早些时候在找你，你知道吗？我等不及要开始了。]既然你来了，她看起来很放松。洛蒂俯身去拿她的饮料，让你能清楚地看到她柔软的双峰。她似乎对你们俩今天打算做什么感到好奇。");
               }
               else
               {
                  outputText("[say: 你好[name]！我……我一直在等你，所以你最好准备好，嘿！别退缩！]洛蒂俯身，她白嫩的乳房压在桌子上。她似乎对你今天准备的东西感到兴奋。");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,279) <= 70)
            {
               outputText("[say: 哦，[name]……我知道我没有按照你想要的方式努力。我——我昨晚狠狠地惩罚了自己！求你了，让我今天再试一次！]洛蒂俯身绝望地看着你，她白嫩的乳房压在桌子上。你可以看到它们比以前更红了。她是不是想把脂肪拍掉？你转过头去，不给她看你脸的乐趣。你同意帮助她——但如果这种情况继续下去，别指望唯一能忍受你的人会看着你。洛蒂尖叫起来，设法脱口而出一句“谢、谢谢你！”作为回应。");
            }
            else
            {
               outputText("[say: [name]！我知道你不喜欢看着我，但我……我今天为你减掉了一些体重！]洛蒂脱掉上衣，露出她曲线优美的身体，丰满的乳房一览无余。你盯着她看，她勉强笑了笑，感谢你的耐心。她等待你的回应，但你转过头去，告诉她遮住她恶心的身体。[say: 但是我——哦天哪，对不起，我真的很抱歉，我今天会加倍努力，我会非常非常努力的……]当你走到柜台给自己点食物时，她喋喋不休地说着。");
            }
         }
         menu();
         addButton(0,"外貌",lotteryAppearance);
         addButton(1,"交谈",talkToPigSlut);
         addButton(2,"锻炼",lottieExercise);
         addButton(3,"赠送物品",giveLottieAnItem);
         if(get_player().get_lust() >= 33)
         {
            addButton(4,"性爱",lottieFuck);
         }
         else
         {
            addButtonDisabled(4,"性爱");
         }
         addButton(5,"拥抱",hugTheShitOutOfYourHam);
         addButton(14,"离开",get_telAdre().gym.gymDesc);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,300,lottieMorale());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,308) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,308,lottieTone());
         }
      }
      
      public function drinkWaterWithYourHamhock() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你决定喝下这种神秘的、冒着泡的混合物绝对不是什么好主意——玛瑞斯有足够多的证据表明了这一点。为了安全起见，你拿起水喝了下去，清凉的液体顺着喉咙流下，解了你的渴。你转向洛蒂，她微笑着回应，开始为下一轮慢跑做拉伸。[say: 准备好再来一次了吗？] 她问道，弯下腰按摩脚部，无意中展示了她丰满的臀部。你跳起来，跑回跑道，提醒自己晚点对着洛蒂屁股的画面打飞机。[pg]");
         outputText("<b>...</b>[pg]");
         outputText("你和洛蒂都坐下来放松，选择在健身房的咖啡馆里待一会儿，因为刚才的锻炼已经筋疲力尽了。猪女孩喋喋不休地谈论着她的身材，列举了如果有机会她会毫不犹豫地改变的身体部位——对于一个大半天都在谈论自己对身体有多么不自信的女孩来说，她当然喜欢提起这个话题。你从思绪中回过神来，看向洛蒂，发现她正倾身直勾勾地盯着你，两只沉甸甸的乳房挤在双臂之间，炫耀着她傲人的乳沟。[say: 嗯，[name]？我问它们好不好……] 她结结巴巴地说，对自己的问题感到尴尬。这是一对很棒的奶子，你漫不经心地回答，告诉这个猪女孩她应该为它们感到非常自豪——不过从她涨得通红的脸来看，很明显她问的不是这个。[say: 那、那不是我问的问题！] 她重申道，用手捂住胸口。[say: 我、我只是想知道这里的瑜伽课好不好！] 你为这个误会暗自发笑，不过从洛蒂尴尬的眼神来看，她觉得这个情况并不那么好笑。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,176) == 0)
         {
            outputText("你从未亲身体验过瑜伽课，但你告诉");
         }
         else
         {
            outputText("你体验过瑜伽课，所以你告诉");
         }
         outputText("洛蒂这是个结识新朋友的好方法。[pg]");
         outputText("听到你的回答，她似乎放松了下来，最终又恢复了她那友好，尽管极其天真的举止。不久后，你们俩一起从健身房的正门离开——此时天色已经很暗了。不过，在你转身回家之前，洛蒂叫住了你。[say:嘿，你知道吗，我……我真的玩得很开心。我以前都不知道健身房能这么棒！]她满面笑容，轻轻捶了一下你的肩膀，然后因为轻微的疼痛缩回了手。你决定给她竖个大拇指，露出一个灿烂的笑容，然后转身走入夜色中，为交到了新朋友而感到高兴。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkLustWithYourHamhock() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你决定喝下这杯粉红色的液体，品味着它顺着喉咙流下时的甜美滋味。解渴后，你开始往回走，突然，一股暖流涌上心头，一直蔓延到你的腹股沟。" + get_player().SMultiCockDesc() + "在你的" + Utils.cnName(get_player().get_armorName()) + "下蠢蠢欲动——你需要操点什么，而且要快。[say:呃，怎么了？]洛蒂看向你，注意到了你裤裆里紧绷着" + Utils.cnName(get_player().get_armorName()) + "的凸起。她抬头看着你的脸，担心你的身体状况。你咧嘴一笑，告诉她你已经跑够了。洛蒂一脸困惑，问你是什么意思。你解释说，你知道一种更有效的减肥和保持身材的方法——事实上，你就是靠这个才变成现在这样的。你可以看到洛蒂听到这种方法时眼睛都睁大了，尤其是考虑到你那肌肉发达的体格。[say:洗耳恭听！是什么方法？]她问道。显然她还没搞清楚状况，你抓起她的手放在你的胯部。洛蒂小声尖叫了一下，环顾四周看看有没有人注意到，然后又看向你。[say:哦，嗯，我不知道——我不知道这个，[name]……]她嘟囔着，手依然放在你越来越硬的阴茎上。没问题的——你谎称自己已经和几百个人这样训练过了。洛蒂咽了口唾沫，听到“几百个”这个词时低下了头。她不是那种会质疑你方法的人，于是开始隔着你的[armor]抚摸你变硬的肉棒，用手掌按摩你的柱身");
         if(get_player().balls > 0)
         {
            outputText("同时她的手指紧张地在你的蛋蛋周围游走");
         }
         outputText("。你暂时制止了她，不过在她的手抚摸你粗壮的肉棒时，你轻轻捏了捏她的手。你告诉她，你知道你们俩可以去哪里“锻炼”。她点点头，眼睛死死盯着你的勃起。[pg]");
         outputText("你牵着她的手，把她带进一间空桑拿房。[say:[name]……]你抓住她的臀部，让她靠在墙上，扯下她的毛巾，露出下面天鹅绒般的肌肤。你伸手抓了一把她那丰满的屁股，轻轻揉捏拍打着。洛蒂靠在你的肩膀上呻吟着，伸手探向你的腹股沟，脱下了你的[armor]。她开始轻轻抚摸[onecock]，随着你继续揉捏她挺翘的臀部，她的动作也加快了。你忍不住对她丰满的身材产生欲望，一只手紧紧抓住她那柔软的乳房，另一只手伸向她闪闪发光的小穴。你的手在她柔软的胸部游走，然后把头埋进她的胸膛，急切地吸吮着她的一颗乳头，用拇指和食指抚弄着另一颗。你的另一只手已经开始快速动作，用手指抠弄她火热的小穴。你能感觉到她的双腿快要支撑不住自己的重量了。洛蒂在短促而灼热的呼吸间呻吟着，[say:你……真的很棒，" + get_player().mf("guy","lady") + "。]你用力拍了一下她胖乎乎的屁股表示赞同。洛蒂高兴地尖叫起来，撸动着你的[cock]，让它戳进她柔软的肚子。你的龟头摩擦着她天鹅绒般肌肤的感觉让你发狂。[pg]");
         outputText("你告诉洛蒂，你决定带她进行一次剧烈的锻炼。她只能充满期待地喘息着。");
         dynStats(DynStat.Lust(99));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,298,FlagDict_Impl_.arrayReadInt(_loc1_,298) + 1);
         menu();
         addButton(0,"口交",getSuckedOffByAHamSandwich);
         addButton(1,"肛交",analLottieMilkshake);
      }
      
      public function declineBeingLottiesGymHamsandwich() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("[say: 哦，嗯……好的。我理解！你可能忙着举重呢，哈哈！]猪女孩紧张地笑了笑，拉了拉毛巾，遮住更多柔软的乳沟。[say: 我呃——那我就不打扰你了。我家里还有些事要做。]你看着她裹着毛巾小跑着穿过门，跑进特尔阿德雷。你决定最好也回家，于是向营地走去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,278,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function charlottesWebComedyBullshit() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你指着面前的两个女孩，高兴地拍打着你的" + get_player().cockDescript(_loc1_) + "。[say:哦，我现在明白了。]你得意洋洋地大喊，你对农场动物虚构故事的知识终于派上了用场。[say:你们这些混蛋就像夏洛特的网。]她们俩都疑惑地歪着头，不确定你刚才开的那个绝妙的参考笑话是什么意思——但你还是继续说了下去。[say:不，因为就像——有一只叫夏洛特的蜘蛛和一只叫威尔伯的猪，蜘蛛通过结网来说话，而且……呃，算了。]你决定这些淫荡的动物变形者不值得你浪费时间，沮丧地跺着脚走了。[say:等……等等！[name]，别离开我！]洛蒂一边朝你跑来一边大喊，但已经太迟了。你他妈的受够了——直到你撞上了一只年迈的白老鼠。[say:BIMBO MARBLE不存在的奶子啊，这不是E.B.怀特吗！]你大喊着，因为你的大脑被这种参考幽默弄得超载，直接在裤子里射了。他微笑着，礼貌地问你是否想去太空旅行。你急切地同意了，跟着老人走进一条黑暗的小巷，兴奋地去进行一生难忘的冒险。[pg]");
         outputText("<b>...</b>");
         outputText("[pg]几个小时后你醒来，发现丢了几颗宝石。你的屁眼现在成了斯图尔特小鼠。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,278,1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function boastAtLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你笑着拿起一个较大的哑铃，毫不留情地举了起来，满怀期待地看着她，仿佛她是因为懒惰才失败的。她更加努力地想把重物举过头顶，但最终她开始发抖并松开了手，重物掉在沙地上，发出一声");
         if(get_silly())
         {
            outputText("巨大的*砰 =3*");
         }
         else
         {
            outputText("响亮的哐当声");
         }
         outputText("她抬头看着你，吸了吸鼻子，但你只是咕哝了一声作为回应，对她的努力感到失望。她叹了口气，尽力再试一次。[pg]");
         outputText("在又尝试了几次举重之后，她最终在压力下屈服并放弃了，独自走回家。你哼了一声，又做了几次应得的重复动作，然后才放下杠铃，为今晚补充体力。");
         get_player().changeFatigue(10);
         dynStats(DynStat.Str(0.25));
         lottieMorale(-3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function boastAtFitLottie() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         outputText("你笑着拿起一个较大的杠铃，毫不留情地举着，满怀期待地看着她，仿佛她也应该把自己逼到极限。她扔下正在用的杠铃，拿起一个和你差不多大小的，试图跟上你的速度和力量，但不可避免地失败了。她抬头看着你，吸了吸鼻子，但你只是咕哝了一声作为回应，对她的努力感到失望。她叹了口气，尽力再试一次。[pg]");
         outputText("在又尝试了几次举重之后，她最终在压力下屈服并放弃了，独自走回家。你哼了一声，又做了几次应得的重复动作，然后才放下杠铃，为今晚补充体力。");
         dynStats(DynStat.Str(0.25));
         lottieMorale(-3);
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function analLottieMilkshake() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         get_images().showImage("lottie-fuck-her-in-teh-butzor");
         var _loc1_:int = get_player().cockThatFits(40);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你拂开她握住[onecock]的手，把她转过身来，将你粗壮的肉棒塞进她宽大的臀瓣之间");
         if(get_player().totalCocks() == 2)
         {
            outputText("，设法把你的另一根肉棒也一起塞了进去");
         }
         else if(get_player().totalCocks() > 2)
         {
            outputText("，你剩下的肉棒则戳刺着她柔软的肌肤");
         }
         outputText("。[say:你真的很喜欢我的屁股，是吧？]她轻声咯咯笑着，对自己至少有一部分脂肪派上了用场感到满意。当她开始扭动丰满的臀部，用她那颤动的臀肉按摩你的" + get_player().cockDescript(_loc1_) + "时，你发出了一声呻吟。你的龟头擦过她的肛门，把先列腺液涂满了那火热的入口。洛蒂开始向后迎合你的肉棒，显然已经被欲望淹没。你等了几秒钟，任由她漫无目的地在你身上摩擦，然后你掰开她的臀瓣，将你的" + get_player().cockDescript(_loc1_) + "插入她紧致的后庭。当你填满她的肚子，开始无情地抽插时，洛蒂靠在墙上发出愉悦的尖叫，她那巨大的乳房有节奏地弹跳着。她继续将自己推向你，她紧致火热的内壁挤压着你的肉棒，而你则看着她沉甸甸的屁股随着每一次抽插泛起肉波。[pg]");
         outputText("洛蒂完全乱了套，在你深入她体内时，她在你身下喘息痉挛着。她张大嘴巴，抓住自己的一团柔软乳房，用空出的手抚慰自己。你抓住她丰满的臀瓣，将肉棒深深插入，直抵她火热肠道的尽头。你停留在她体内，开始扭动臀部，摩擦着她紧致的内壁。她的双腿在你身下瘫软，你用一只手环住她圆滚滚的肚子固定住她，继续抽插。[pg]");
         outputText("[say:啊——啊——啊，我——我……啊！]洛蒂大声地发出猪叫声，双眼翻白，粗壮的大腿拍打着你的大腿，将你的" + get_player().cockDescript(_loc1_) + "吸得更深。她在高潮中颤抖着");
         if(get_player().balls > 0)
         {
            outputText("，她湿透的小穴摩擦着你的蛋蛋");
         }
         outputText("。[pg]");
         if(get_player().cockTotal() > 1)
         {
            outputText("你觉得还没玩够她那弹性十足的屁股，于是你拿出");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根肉棒");
            }
            else
            {
               outputText("你的一根肉棒");
            }
            outputText("并把它推向她那紧缩的洞口。[say: 嘿，等一下——哦！] 你慢慢地把自己重新塞进她体内，伴随着");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的两根");
            }
            else
            {
               outputText("你的两根");
            }
            outputText("跳动的肉棒深深埋入她的直肠中。你的火热肉棒感受到了巨大的压力，但你继续缓慢地抽插着她汗津津的屁股，享受着她那肉感十足的屁股肉垫按摩你肉棒的感觉");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。[pg]");
         }
         if(get_player().balls > 0)
         {
            outputText("你的[sack]开始肿胀");
         }
         else
         {
            outputText("你感觉自己快要爆炸了");
         }
         outputText("，你准备了大量的精液来涂满她的内壁。随着你感觉到自己即将达到高潮，你毫不留情的抽插加快了速度。洛蒂柔软的肉体开始颤抖，标志着她的第二次高潮。你把洛蒂丰满的身体拉直紧贴着你，大声呻吟着并用力挺进，这个吵闹的女人");
         if(get_player().cumQ() >= 1000)
         {
            outputText("满溢着");
         }
         else if(get_player().cumQ() >= 500)
         {
            outputText("滴落着");
         }
         else
         {
            outputText("充满了");
         }
         outputText("你滚烫浓稠的精液。当你带她达到高潮时，她再次尖叫起来，用力撞向你，尽可能多地收集你的精液。你继续猛烈地撞击她弹性十足的臀部，将剩下的精液全部释放在她的体内");
         if(get_player().cumQ() >= 500)
         {
            outputText("，大量的精液从她的屁股里漏了出来");
         }
         outputText("。你把自己拔了出来，在她柔软的屁股上擦了擦，最后拍了一下，然后走出了桑拿房。[say: 我——我们还会再见的，对吧？]洛蒂瘫倒在地板上，汗水和口水混作一团，向你问道。你对她竖起大拇指，然后转身离开健身房，走之前还不忘拿一杯");
         if(get_silly())
         {
            outputText("培根");
         }
         outputText("奶昔。它们真他妈的好吃。");
         lottieTone(1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,307) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,307,1);
         }
         outputText(get_player().modTone(100,1));
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function acceptBeingLottiesHamSandwich() : void
      {
         spriteSelect(SpriteDb.get_s_lottie());
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,299,1);
         outputText("[say: 啊，真的吗？你是认真的吗？这不是什么恶作剧吧？你不会打算放我鸽子吧？]你向她保证，如果她是认真的，你也是认真的，不过你在心里暗想，考虑到她的过去，她放你鸽子的可能性比你大。[say: 呀！谢谢，" + get_player().mf("大个子","宝贝") + "——我等不及要开始了！顺便说一下，我叫洛蒂。你呢？]你告诉她你的名字，并对她的热情发表了评论。[say: " + get_player().get_short() + "，是吗？好吧，[name]，我很兴奋，因为我觉得我们俩马上就要变得超级亲密了！你感觉到了吗？感觉到了吗？]洛蒂兴奋地扭动着，松开了本来就很少的毛巾，露出了她的一颗挺立的乳头。你绝对感觉到了什么，这是肯定的。她顺着你的目光往下看，脸红了，因为她试图尽可能地遮住自己——结果只是让她柔软的乳房挤在毛巾上，加深了她的乳沟。[pg]");
         outputText("你借此机会好好打量了一下洛蒂。她身高大约4英尺8英寸，比平均身高矮得多，");
         if(get_player().get_tallness() > 60)
         {
            outputText("并且比你矮");
         }
         else if(get_player().get_tallness() > 53)
         {
            outputText("但你也没资格评判，毕竟你们差不多高");
         }
         else
         {
            outputText("比你高");
         }
         outputText("。体格方面，洛蒂绝对比大多数女孩都要丰满一些，虽然你不能说她胖——在你见过的特尔阿德雷的少数猪人中，她绝对是“最瘦”的。她的大部分体重都集中在柔软的乳房、丰满的大腿和硕大的屁股上，不过她的肚子也圆润得恰到好处。她心形的脸庞配上小巧的鼻子和柔软的嘴唇，粉灰色的头发在发尾卷曲着，衬托着她的脸庞。一条盘绕的小尾巴搭在她的臀部上方，不知不觉地把毛巾撩得很高，让她苍白的大腿一览无余。她转过身，发现你正盯着她的屁股看。[say: 总、总之，在我们开始之前，我得先去冲个澡，好吗？待会儿见！] 她转过身朝浴室走去，你的眼睛被她摇晃的屁股迷住了。[pg]");
         outputText("<b>...</b>[pg]");
         outputText("一小时后，你和洛蒂都在跑道上跑步。她显然专注于跟上你的速度，但几分钟后她就累坏了，开始慢跑。你放慢速度，等她追上你，然后在接下来的一圈左右和她一起快走，尽可能地闲聊。又跑了一圈后，你们决定休息一下，洛蒂为她今天的进步高兴地蹦蹦跳跳。你坐在长椅上，伸手去拿你为自己和洛蒂倒的一杯水，这时你发现另一只杯子里装满了粉红色起泡的液体。颜色本身并不那么诱人，但你的好奇心还是被激起了。这是能量饮料吗？你用空闲的手拿起杯子，闻了闻里面的东西。它有一种甜美醉人的香味，类似于草莓或泡泡糖。你立刻开始感到头晕。你知道这不是普通的蛋白奶昔。你回头看了看你的水。你真的很渴……你是为了安全起见喝水，还是喝那杯诱人又奇特的奶昔？");
         menu();
         addButton(0,"水",drinkWaterWithYourHamhock);
         addButton(1,"奶昔",drinkLustWithYourHamhock);
      }
   }
}

