package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public class TamanisDaughtersScene extends BaseContent implements TimeAwareInterface
   {
      
      public static var tamaniPresent:Boolean = false;
      
      public var pregnancy:PregnancyStore;
      
      public function TamanisDaughtersScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         pregnancy = new PregnancyStore(1205,57);
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         var _loc2_:int = 0;
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1204,FlagDict_Impl_.arrayReadInt(_loc1_,1204) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1206));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1206,0);
            pregnancy.knockUpForce();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,55) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) > 30)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1204,30);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) > 40 && get_game().time.hours > 23 && int(get_game().time.days % 4) == 0)
         {
            _loc2_ = 1204;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         return false;
      }
      
      public function tdCup() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) < 20)
         {
            return "C";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) < 30)
         {
            return "D";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) < 40)
         {
            return "DD";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) < 50)
         {
            return "E";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) < 60)
         {
            return "EE";
         }
         return "F";
      }
      
      public function tamanisDaughtersFillIndividuallyBADEND() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         clearOutput();
         outputText("[say: 真的吗？] 怀孕的地精问道，然后她惊呼道，[say: 你确实爱我们！哦，爸爸，等妈妈回家后，你会操我们所有人吗？我想感觉你在她看着的时候，和我湿漉漉的怀孕小穴做爱！][pg]");
         outputText("你同意了，");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每根");
         }
         outputText("你的[cocks]因为期待而完全硬了起来。你的女儿拍了拍");
         if(get_player().cockTotal() > 1)
         {
            outputText("其中一根");
         }
         else
         {
            outputText("它");
         }
         outputText("仿佛它是一个人，并在解开你椅子上的束缚时微笑着。她扶着你踉跄地站起[feet]，尽管她抚摸着");
         if(get_player().cockTotal() > 1)
         {
            outputText("一根");
         }
         else
         {
            outputText("你的");
         }
         outputText("[cock]的手让你很难站稳。你们俩深入洞穴，来到一个巨大的前厅，里面挤满了怀孕的地精。有些在吃东西，有些在桌边缝纫，摆弄机械，或者鼓捣炼金设备。当你们进入时，所有人都转过头来看你们。[pg]");
         outputText("你旁边那个身材丰满的地精宣布道：[say: 爸爸决定自愿留在这里，只要我们想，他就会操我们。给他拿点魅魔之悦来；等妈妈回家，我要她看着他填满我！][pg]");
         outputText("欢呼声在天花板上回荡，你的女儿们围着你，把她们丰满的胸部和圆润的臀部贴在你身上。你被带到一个僻静的角落，被喂食食物和奇怪的饮料，在等待塔玛尼回来的几个小时里，你一直保持着极度饥渴的状态。正如她所说，当氏族的女族长进入房间时，你的女儿立刻骑在你身上，你无能为力，只能屈服于她天鹅绒般的小穴。你大声而混乱地射精，把她的内壁涂满白浊，精液淹没了你周围的区域，而塔玛尼只能带着嫉妒的表情在一旁看着。[pg]");
         outputText("你的余生都在类似的方式中继续——你被数百名怀孕的妻子喂得饱饱的，享受着快乐，你的后宫也在不断扩大。多亏了你妻子们的炼金天赋，这里从不缺性爱，也不缺欲望。在一个月的时间里，你已经完全忘记了你的任务——除了和你的妻子女儿们拥抱，等待下一次做爱，你很难专注于任何事情。");
         get_game().gameOver();
      }
      
      public function tamaniDaughtersYesBadEndMePlease() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         clearOutput();
         outputText("[say: 太棒了！] 兴奋的怀孕荡妇叫道。她轻快地走回机器旁时，在你的脸颊上飞快地亲了一下。你满怀期待地做好准备，渴望在永恒的高潮中迷失自我。开关咔哒一声，刻度盘嗡嗡作响，调到了最大。泵入你后庭和直接进入你静脉的液体压力突然增加，痛苦地刺痛了片刻，然后快感又回来了。你的眼睛慢慢翻白，你的下巴松弛下来，你的[cocks]喷出");
         if(get_player().totalCocks() == 1)
         {
            outputText("");
         }
         outputText("射进管子里。[pg]");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            outputText("埃克斯加图安呻吟着，[say: 哦哦哦哦哦哦，耶耶耶耶耶耶……] 然后陷入了沉默。[pg]");
         }
         outputText("你的余生都困在高潮中，不断地为你成为玛瑞斯大陆上最大的地精部落的发展提供养分。即使她们每个人都怀孕了，她们也会让你享受你的奖励。随着时间的推移，你的记忆力、道德感或除了快感之外的任何其他感觉的能力都在减弱。被困在你选择的天堂里，你放弃了你曾经的一切，只为了永无止境的极乐。");
         get_game().gameOver();
      }
      
      public function tamaniDaughtersDeclineBadEnd() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         clearOutput();
         outputText("[say: 说真的！？] 怀孕的荡妇惊呼道，[say: 什么样的人会不想一直射精？操，光是想想就让我流水了！][pg]");
         outputText("她叹了口气，[say: 随便吧，爸爸。下次我们需要你的时候，我相信你会记得这有多有趣，然后跑回家的。][pg]");
         outputText("束缚立刻从你身上弹开，你把管子和静脉注射器从皮肤上拔下来。你不舒服地咕哝着，从[asshole]里拔出最后一根管子。爬下桌子，当你试图保持平衡时，你的[legs]摇晃不稳。地精说，[say: 回家吧，爸爸，趁我还没把你重新绑起来，教你享受我的礼物之前！][pg]");
         outputText("你羞怯地离开洞穴回家，很高兴能在你不断壮大的女儿部落决定永远榨干你之前离开那里。[pg]");
         get_combat().cleanupAfterCombat();
      }
      
      public function tamaniDaughtersCombatLossDrain() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,59,FlagDict_Impl_.arrayReadInt(_loc1_,59) + 1);
         clearOutput();
         var _loc2_:int = get_player().totalCocks();
         var _loc3_:Number = int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) / 2);
         outputText("你抵抗的努力是徒劳的——你那些淫荡的女儿实在太多了，根本无法击退。人群涌向你");
         if(get_player().get_HP() < 1)
         {
            outputText("被击败的");
         }
         else
         {
            outputText("因情欲而虚弱的");
         }
         outputText("身体，将你拉倒在地，抬起你的整个身体。");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("这并没有让你太困扰……她们一直在");
            if(get_player().balls > 0)
            {
               outputText("抚摸你的蛋蛋和");
            }
            outputText("抚摸你的肉棒，让你保持兴奋，在欲望中无助地扭动。");
         }
         else
         {
            outputText("你饱受摧残的身体在清醒和昏迷之间徘徊，但人群在行进中为你涂抹药膏，慢慢恢复你的体力。她们的手不断地抚摸你，尽管你拼命抵抗，但你发现自己很快就被唤醒并变得顺从。");
         }
         outputText("[pg]");
         outputText("大约一个小时后，你被拉进了一个洞穴。日光逐渐消失，取而代之的是几支火把和蜡烛摇曳的光芒。你的女儿们一边咯咯笑着，一边闲聊，带着你穿过她们的地下巢穴，把你带到更深的地方。不知过了多久，你听到开门的声音，然后被拉过一个入口，进入了一个类似房间的地方。你喘息着，呻吟着，因为塔玛尼最高大的一个女儿正尽力为你口交");
         if(_loc2_ > 1)
         {
            outputText("其中一根");
         }
         outputText("你的[cocks]，让你保持着极度兴奋的状态，足以配合她们的任何计划。[pg]");
         if(!get_player().isTaur())
         {
            outputText("抓住你的手慢慢将你放进一张感觉舒适的椅子里，将你的[legs]固定在紧紧绑住的脚蹬里。片刻之后，你的手也被绑在同样坚固的袖口里。到了这个时候，你那被欲望迟钝的大脑开始感到担忧，你开始挣扎，但绑着的皮带穿过你的胸部、腹部和大腿上部，然后紧紧地绑在椅子上，将你完全束缚住。也许唯一");
            if(_loc2_ > 1)
            {
               outputText("唯一没有被束缚的只有你的[cocks]，尽管身处困境，或者正因为如此，它依然挺立着。[pg]");
            }
            else
            {
               outputText("唯一没有被束缚的只有你的[cocks]，尽管身处困境，或者正因为如此，它依然挺立着。[pg]");
            }
         }
         else
         {
            outputText("抓住你的手慢慢将你仰面放下，引导你进入一个结合了椅子和挽具的装置，该装置旨在适应半人马的体型和形状。在你反应过来之前，带子将你的[legs]固定在紧紧绑住的束缚具中。片刻之后，你的手也被绑在同样坚固的袖口里。到了这个时候，你那被欲望迟钝的大脑开始感到担忧，你开始挣扎，但绑着的皮带穿过你的胸部、腹部和后躯，然后紧紧地绑在椅子上，将你完全束缚住。也许唯一");
            if(_loc2_ > 1)
            {
               outputText("唯一没有被束缚的只有你的[cocks]，尽管身处困境，或者正因为如此，它依然挺立着。[pg]");
            }
            else
            {
               outputText("唯一没有被束缚的只有你的[cocks]，尽管身处困境，或者正因为如此，它依然挺立着。[pg]");
            }
         }
         outputText("一个有着闪亮蓝发的地精拉动了椅子侧面的控制杆，改变了你的姿势，让你更加暴露。她保证道，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,58) == 0)
         {
            outputText("[say: 别担心。这是我在等妈妈给我带回更多你的精液时发明的，以防我们有机会抓到你。我保证，只要你尝过我这把椅子的滋味，你就再也不想离开了。][pg]");
         }
         else
         {
            outputText("[say: 别担心！我们都知道你喜欢我的小爱心座椅。只要躺下，不久你就会高潮得顾不上别的了。][pg]");
         }
         outputText("你听到旁边一阵骚动，伸长脖子看去。一群女孩围在一台机器旁。它大约有一个大梳妆台或橱柜那么大，只是它没有装衣服，而是布满了旋钮、控制杆和各种机械表盘。一个有着浅蓝色、几乎是银色头发的地精回头看着你，一边拉动控制杆一边向你飞吻。机械的嗡嗡声充满了房间，从天花板传来。你向后仰起头往上看，看到一个巨大的金属球从天花板上降下来。[pg]");
         outputText("这个地精制造的装置显然是用于性目的的。底部表面布满了数十个开口，每个开口里面都是某种粉红色内衬的洞，滴着润滑剂。最有趣的是，你意识到不同的洞都有不同的形状、图案和大小。有些很大，类似于怪物两腿之间的东西，而另一些则很小，几乎像精灵一样。金属球刚好停在你的胯部上方，几个窃笑的绿色荡妇将[eachcock]引导到一个尺寸完美的洞里。[pg]");
         outputText("当你的男根");
         if(_loc2_ > 1)
         {
            outputText("被");
         }
         else
         {
            outputText("被");
         }
         outputText("完全包裹在");
         if(_loc2_ == 1)
         {
            outputText("一个");
         }
         outputText("湿润的孔洞");
         if(_loc2_ > 1)
         {
            outputText("");
         }
         outputText("中时，你颤抖了一下。它们太冷了，以至于你不由自主地在束缚中发抖。蓝发女孩咆哮道，[saystart]嘿，婊子！快把这该死的机器开起来，别让爸爸的鸡巴");
         if(_loc2_ > 1)
         {
            outputText("");
         }
         outputText("枯萎！[sayend][pg]");
         outputText("随着一个看不见的地精照做，机器的嗡嗡声变得更大了。几十个人造嘴巴启动，房间里充满了嘈杂、湿润的吸吮声。包裹着你的湿滑物质立刻升温，直到感觉像少女的爱一样温暖，一股轻柔的吸力拉扯着");
         if(_loc2_ > 1)
         {
            outputText("你的每根");
         }
         outputText("[cocks]，直到它感觉比平时更硬更粗。你强忍住一声不由自主的呻吟，但未能向观众掩饰你充满欲望的喘息。一个大胆的女孩跳到你的");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("胸膛");
         }
         else
         {
            outputText(get_player().allBreastsDescript());
         }
         outputText("上，将一个正在泌乳的乳头塞进你的嘴里，命令道，[say:喝吧，你体液越多，就能为我们制造越多的精液！][pg]");
         outputText("由于无法以任何方式反抗，你耸了耸肩，开始吸吮那紫色的乳头，品尝着轻易填满你嘴巴的奶油般的地精奶。你大口吞下，在机械的吸精和温柔的喂奶之间慢慢放松下来。你的女儿说得对，这简直就像天堂。不幸的是，这种快感被某种探测你后庭的东西打断了。由于嘴里塞满了美味的乳房而无法查看，你只能发出咕噜声并流着口水抗议，因为一根润滑过的管子插入了你的[asshole]。[pg]");
         outputText("机器发明者熟悉的声音低语道，[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,58) == 0)
         {
            outputText("该吃药了！我们需要你射出足够我们每个人用的精液，也许还能剩下一点来玩，所以把药吸进去，好吗？放松，让它填满你，这样你就能给我们所有美味的精液了！[sayend][pg]");
         }
         else
         {
            outputText("放松，爸爸，我们只是在给你吃催精药。我知道你是个性感、精力充沛的" + get_player().mf("种马","荡妇") + "，但吃了药，你就会有足够多的精液给我们了！[sayend][pg]");
         }
         outputText("你脸红了，");
         if(get_game().ceraphScene.hasExhibition())
         {
            outputText("在自己一群饥渴的孩子面前，被这样的机器使用和虐待，让你产生了难以想象的性奋。");
         }
         else if(get_player().cor > 60)
         {
            outputText("被以如此淫秽的方式榨取，让你感到性奋。");
         }
         else
         {
            outputText("对这种情况感到恐惧，但在不断被吸吮和取悦时无法抗拒兴奋。");
         }
         outputText("[pg]");
         outputText("一股温暖的液体流入你的体内，你的皮肤立刻感到刺痛，因高温和渴望而燃烧。");
         if(get_player().balls > 0)
         {
            outputText("你的睾丸在阴囊内收紧，像海绵一样肿胀，随着你的欲望慢慢变大。");
         }
         else
         {
            outputText("你的身体感到紧绷和饥渴，你的肠胃收缩，因为你的身体正在适应它通过你的[asshole]轻易吸收的药物。");
         }
         outputText("随着你的身体吸收更多的药物，围绕着");
         if(_loc2_ > 1)
         {
            outputText("你的每根");
         }
         outputText("[cocks]的吸吮快感似乎在慢慢增加，直到挣脱束缚获得自由不再是你的顾虑。现在唯一重要的是挣脱束缚，这样你就可以操");
         if(_loc2_ == 1)
         {
            outputText("那个");
         }
         else
         {
            outputText("那些");
         }
         outputText("机械洞");
         if(_loc2_ > 1)
         {
            outputText("");
         }
         outputText("直到你感受到你所渴望的那种美妙、甘甜的释放。[pg]");
         outputText("地精们看到你神态的改变，开始相视而笑，互相祝贺她们的努力。控制台旁的女孩又扭动了几个拉杆，随着更多的药物被注入你被束缚的身体，你体内的温暖似乎翻了一倍。你开始" + get_player().mf("大笑","咯咯笑") + "，麻醉剂和快感淹没了你的思维过程，让你感觉自己像漂浮在天堂。在旁人看来，你在笑声中喘息和呻吟，口水流满了你嘴里那个分泌乳汁的地精乳房，而你的身体开始向阴茎榨乳器中喷射先列腺液。[pg]");
         outputText("离你高潮还有几秒钟，操作机器的地精做了一些调整，你感觉到流入你直肠的液体越来越强，直到你开始感到饱胀。你的身体屈服于快感，每一寸皮肤都在刺痛，因为你被迫达到高潮。");
         if(get_player().balls > 0)
         {
            outputText("紧绷和颤抖中，你的[balls]紧贴着你，感觉很紧，因为你的身体在挣扎着泵出它们产生的精液。");
         }
         else
         {
            outputText("紧绷和颤抖中，你的身体在努力度过高潮，因为它试图处理你的前列腺和腺体排出的所有精液。");
         }
         outputText("当你高潮时，药物和榨乳机发出嘎吱、吸吮和嗡嗡的声音，白色的液体淹没了机械阴道球上方的管子。[pg]");
         outputText("那个分泌乳汁的绿色女孩停止了对你的哺乳，从你身上爬下来，受够了你只顾着呻吟而不能好好吸吮。几个咯咯笑的地精扇了你的脸，当你甚至没有察觉到这些打击时，她们大笑起来。源源不断的高潮粘液从");
         if(_loc2_ > 1)
         {
            outputText("你的每根");
         }
         outputText("你的[cocks]中涌出，让你的大脑充满了快感，阻止了任何其他想法或感觉从这混乱的性爱泥潭中产生。[pg]");
         outputText("另一个声音加入了你狂喜的呻吟，从房间的另一边回荡过来。声音的来源是一个曲线优美的地精，一根软管猛地插入她闪闪发光的小穴，直没至柄。她的姐妹们在戏弄她，打开和关闭机器上的阀门，用你丰富的精液短促地填满她们的姐妹。她绝望地用假阳具形状的管尖呻吟着操自己，但她的同窝姐妹似乎有意错开精液的流动，以阻止她达到高潮。不到十几秒钟她就被填满了，她被拉开，哭泣着撅着嘴说她还没完。下一个女孩排队走进来，把涂满汁液的分配器猛地塞进自己体内，准备成为一个母亲……[pg]");
         outputText("被残酷的机器和源源不断的特制药物困在持续的高潮中，你开始无法控制地微笑。确实，此时你已经完全无法思考，但你的身心对这种情况太满意了，以至于无法不咧嘴笑。随着你的女儿们享受你的“牛奶”，场景角落里的情况一遍又一遍地重复。当她们吃饱后，她们倒在彼此身上，让房间里充满了狂欢的呻吟，任何秩序感都被女性情欲的浪潮吹散了。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,58) < 4)
         {
            outputText("在折磨了几个小时后，你失去了知觉，仍然在射精，没有停止的迹象，你的身体靠着倒入你背部的液体维持。梦境是不断袭来的性爱场景，在各种不协调的高潮行为之间掠过。如果你能理解你的处境，你可能甚至不想醒来。唉，快感确实结束了，你陷入了更深的沉睡。轻柔的摇晃和你胯部的疲惫让你酣睡了几个小时。[pg]");
            outputText("当你醒来时，你发现自己独自在森林的空地上，脸上贴着一张纸条：[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,58) == 0)
            {
               outputText("<i>" + get_player().mf("老公","宝贝") + "，\n");
               outputText("你知道塔玛尼一个人把你拖到这里有多难吗？如果你不是我最喜欢的种马，我就会让我的女儿们留着你。下次对那些小婊子强硬点，否则塔玛尼可能会在你被榨乳时视而不见！[pg]");
               outputText("抱抱和精液，\n");
               outputText("\t-塔玛尼</i>");
            }
            else
            {
               outputText("<i>说真的，这可不好笑。" + get_player().mf("像个男人一样","坚强点") + "，把那些小婊子打得落花流水，而不是任由她们强迫你。你知道把你拖出来有多难吗？如果你在床上没那么有趣，塔玛尼都想让她的女儿们把你留在她们的榨汁机里了。也许女孩们会给塔玛尼分一大杯羹，让她也加入这个行动？[pg]");
               outputText("爱与操，\n");
               outputText("\t-塔玛尼</i>");
            }
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("在折磨了几个小时后，你失去了意识，但仍然在射精，没有停止的迹象，你的身体靠着灌入你后庭的液体维持着。你的梦境中不断出现各种性爱场景，在各种不协调的高潮行为之间闪烁。如果你能理解你的处境，你可能都不想醒来。谢天谢地，你不想要的欲望变成了现实。");
            doNext(tamaniDaughtersBadEndChoice);
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,58,FlagDict_Impl_.arrayReadInt(_loc1_,58) + 1);
         knockUpDaughters();
         var _temp_1:* = get_player();
         _temp_1.cumMultiplier = _temp_1.cumMultiplier + 0.3;
         get_player().orgasm("Generic");
         dynStats(DynStat.Str(-0.5),DynStat.Inte(-0.5),DynStat.Lib(1),DynStat.Cor(1));
      }
      
      public function tamaniDaughtersBadEndChoice() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         outputText("第二天早上，你失焦的眼睛眨了眨，发现自己和以前一样。谢天谢地，你的高潮被允许结束了，尽管你仍然感到昏昏沉沉，无法集中注意力，不知道是什么东西流进了你的身体。你设法扭过头去，想更好地看看情况，发现你的手臂上插着一对静脉注射器。扭动身体，你意识到你仍然能感觉到插在[asshole]里的药物灌肠管。奇怪的是，你很难对这种情况感到担心或担忧。[pg]");
         outputText("一个地精俯身在你的脸上，将她摇晃的乳房紧贴着你，她滔滔不绝地说，[say: 太感谢你了，爸爸！你可能因为绑着你的带子看不见，但你让我和我的姐妹们完全怀孕了。你剩下的精液甚至足够让我们再怀孕几次！我们决定，即使我们现在不需要你射精，我们也会让你永远射精。你想要那样吗？][pg]");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            outputText("埃克斯加图安吠叫道，[say: 见鬼，我当然想！] 但地精只是低头冷笑了一下，然后回头看着你。[pg]");
         }
         outputText("（选项：是，否，我宁愿亲自一个个填满你们的小穴）");
         menu();
         addButton(0,"是",tamaniDaughtersYesBadEndMePlease);
         addButton(1,"否",tamaniDaughtersDeclineBadEnd);
         addButton(2,"亲自",tamanisDaughtersFillIndividuallyBADEND);
      }
      
      public function playDumbToTamanisDaughters() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         clearOutput();
         outputText("你耸了耸肩，问道：[say: 你们到底想要什么？我不确定你们找对了" + get_player().mf("guy","person") + "。][pg]");
         if(get_player().get_inte() / 2 + 25 > Utils.rand(75))
         {
            outputText("领头的上下打量了你一会儿。她的脸慢慢扭曲成困惑，然后是愤怒，[say: 塔米你个笨蛋！你不是说这是他的踪迹吗？走吧女孩们，我们还得去抓老爸呢。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,55) > 1)
            {
               outputText("她们肯定没怎么注意你的长相。");
            }
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("领头的气得直跺脚。如果她不是只有三英尺高的话，可能会更有气势一点……她的目光锁定在你的胯部，说道：[saystart]最后一次机会。无论用什么方法，我们都要怀上我们的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,55) == 1)
         {
            outputText("第一窝");
         }
         outputText("幼崽！[sayend][pg]");
         menu();
         addButton(0,"操她们",fuckYoDaughtersHomie);
         addButton(1,"战斗",fightTamanisDaughters);
         addButton(2,"随她们便",legTamanisDaughtersRAEPYou);
      }
      
      public function loseToDaughtersWithTamaniThere() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,59,FlagDict_Impl_.arrayReadInt(_loc1_,59) + 1);
         var _loc2_:int = get_player().cockThatFits(50);
         outputText("你试图抵抗的努力被证明是徒劳的，因为你的女儿们和她们曲线优美的母亲已经彻底击败了你。");
         if(get_player().get_HP() < 1)
         {
            outputText("躺在泥土中，伤得太重无法反击，你只能在期待中颤抖，不知道这次她们会强加给你什么快乐。");
         }
         else
         {
            outputText("躺在泥土中，你硬得无法反击。你抚摸着");
            if(get_player().totalCocks() > 1)
            {
               outputText("其中一根");
            }
            outputText("你颤抖的[cocks]，感觉到它流出先列腺液，期待着能让这些美丽的曲线女人怀孕。");
         }
         outputText("塔玛尼挤到队伍的最前面，她的女儿们看起来很失望，但暂时屈服于母亲的权威。她走到你身边，跨过你倒下的身体，拔开一瓶药水的塞子。当她把摇晃的屁股坐在你的");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("胸膛");
         }
         else
         {
            outputText(get_player().allBreastsDescript());
         }
         outputText("并说道，[say:好了老公，你让女儿们堂堂正正地打败了你，现在是时候吃药了，给她们变强的奖励。][pg]");
         outputText("塔玛尼强行掰开你的嘴，药水瓶成了你嘴里的塞子。她把瓶子向后倾斜，一只手按摩你的喉咙，强迫你咽下液体。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) < 2)
         {
            outputText("它尝起来像糖浆一样甜");
         }
         else
         {
            outputText("它有一种你无法确定的熟悉味道");
         }
         outputText("差点让你吐出来，但塔玛尼确保你喝下了每一滴。一种麻木感立刻从你的指尖开始蔓延全身。它慢慢爬上你的手臂，然后也从你的[feet]开始。没过多久，你就很难移动了，思考也变得困难。你的大脑感觉就像塞满了棉花糖，毛茸茸的粉红色东西不断阻碍你的思绪。[pg]");
         outputText("当你的[face]因担忧而皱起时，塔玛尼抚慰地揉着你的太阳穴并安慰你，[say: 别担心，这很快就会消退。这种药只是关闭了你的大脑，所以它会很好地接受暗示。你能感觉到思考有多难，不是吗？每次你鼓起一个想法，它就会被困在粉红色的小云里并被带走。别费心了，放松听塔玛尼的声音。][pg]");
         outputText("她把手伸进你的[armor]里揉搓");
         if(get_player().totalCocks() > 1)
         {
            outputText("其中一根");
         }
         outputText("你的[cocks]，漫不经心地抚摸着坚硬的肉棒，同时她转过身来解释道，[saystart]你为塔玛尼主人勃起得这么厉害，不是吗？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 10)
         {
            outputText("你的身体一定记得它有多喜欢做我渴望小穴的丈夫。");
         }
         else
         {
            outputText("那是因为你的身体知道塔玛尼的小穴有多热多湿，以及你有多想伺候它。");
         }
         outputText("[sayend][pg]");
         outputText("当然她是对的——你能感觉到她胸前的湿润，你想把脸埋进去，而她抚摸着你。塔玛尼看着你的眼睛，转过身给你一个更好的视野，展示她的私处，同时她向后靠抚摸你。她咯咯地笑，[say: 是的，好好看看你妻子的小穴。它看起来那么美味，那么温暖，那么诱人。你只想把你的肉棒或脸埋进去，不是吗？那是因为那是你妻子的小穴，而你是个好丈夫。][pg]");
         outputText("她的手开始更快地抚摸你，她的汁液开始顺着你的躯干两侧滴落");
         if(get_player().hasFur())
         {
            outputText("，使你的[furcolor]毛发缠结");
         }
         outputText("当她继续");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) < 10)
         {
            outputText("用真相填满你的大脑");
         }
         else
         {
            outputText("强化你作为顺从丈夫的自我形象");
         }
         outputText("，[say: 伺候你妻子渴望的小穴并用精液填满它感觉真好。你的肉棒知道这一点并且非常想要它，以至于每次你看到你的妻子塔玛尼，你都会为她勃起得如此厉害和火热，以至于你会忘记除了崇拜她的小穴之外的任何事情，不是吗？][pg]");
         outputText("当她说话时，你开始点头，你的眼睛从未离开几英寸外闪闪发光的操洞。你的妻子真聪明，虽然你不再听到那些话，但你知道她告诉你的一切都是真的。她光滑的手完美地抚摸着你，当它们被先列腺液弄滑时只会变得更好。塔玛尼的声音提高了，带着命令的语气，然后你顺从地为她喷射——一个好丈夫。[pg]");
         if(get_player().cumQ() < 50)
         {
            outputText("精液飞溅，顺着塔玛尼的手滴落，在你的胸口形成了一小滩水洼。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("精液飞溅在塔玛尼的手和前臂上，甚至溅到了她的屁股和臀部，在你的躯干上形成了一大滩浓稠的液体，滴落在地上。");
         }
         else if(get_player().cumQ() < 600)
         {
            outputText("精液如浓稠的波浪般喷涌而出，浸透了塔玛尼的手、前臂和臀部，形成了一滩滩浓稠的液体。它在你的肚子上积聚了片刻，然后滚落下来，在你不断喷射的过程中，在地上形成了一个小水坑。");
         }
         else
         {
            outputText("一股巨大的精液从你体内喷发而出，将塔玛尼从肩膀到膝盖都浸透在浓稠的黏液中。下一波喷射的力度减弱，在你的肚子上积聚，然后滚落到地上形成水坑。随着你高潮的持续，水坑变成了一大滩浓稠的液体。");
            if(get_player().cumQ() >= 2000)
            {
               outputText("最终它停了下来，但那时水池已经很大了，将近五英寸深。");
            }
         }
         outputText("当你意识到自己是一个多么好的丈夫时，自豪感油然而生。塔玛尼拍了拍你的头，低声说，[say:干得好，爱人]，随着脑海中的蜘蛛网慢慢散去。你记得你的妻子把一剂催情药倒进你的喉咙，给了你一生难忘的69式，但现在是时候做一个好丈夫和好父亲，也帮帮你的女儿们了。女孩们兴奋地咯咯笑着爬上前来，脱下她们身上仅有的一点衣物。[pg]");
         outputText("你张开双臂欢迎她们，而塔玛尼则带着一种奇怪的眼神退到一旁，把手上的精液揉进她的小穴里。药水被按在你的嘴唇上，你高兴地接受了女儿们的礼物，开心地大口喝下，并花时间称赞她们的炼金术，同时");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每根");
         }
         outputText("[cocks]都恢复了完全勃起，并因欲望而颤抖，准备好播种。女孩们");
         if(get_player().cockTotal() == 1)
         {
            outputText("抓住你的[cocks]，像她们的母亲一样，用长而缓慢的动作抚摸它。与她不同的是，她们似乎不满足于等待，几秒钟内，一条湿滑的裂缝就撑开来容纳你的龟头。[pg]");
         }
         else
         {
            outputText("每人抓住你的一根[cocks]，像她们的母亲一样，用长而缓慢的动作抚摸它。与她不同的是，她们似乎不满足于等待，几秒钟内，一条湿滑的裂缝就撑开来容纳每一个龟头。[pg]");
         }
         if(_loc2_ < 0)
         {
            outputText("可悲的是，你太大了，无法让你的女儿正常受孕，一阵担心自己可能是个坏父亲的忧虑刺痛了你。");
            if(get_player().cockTotal() == 1)
            {
               outputText("谢天谢地，你的女儿似乎并不介意。她转而继续抚摸你，尽管地精小穴湿润紧致的内壁尽可能地包裹着你的龟头。在药物、骑在你身上的性感女孩以及你想成为一个好族长的渴望的共同作用下，她们毫不费力地让你在她们等待着、肥沃的子宫里释放。你大叫着抽搐，把精液播种在女儿的子宫里，既然她已经长大了，你就把她当成她的母亲一样对待。");
               if(get_player().cumQ() > 700)
               {
                  outputText("即使你已经用精液填满了她的肚子，她的子宫也无法容纳你巨大的射精量，精液弄得到处都是。");
               }
               if(get_player().cumQ() > 2000)
               {
                  outputText("几秒钟后，之前的水坑变得更深了，你的女儿们好心地撑起你的头，以免你淹死在精液池里。");
               }
            }
            else
            {
               outputText("谢天谢地，你的女儿们似乎并不介意。她们转而继续抚摸你，尽管地精小穴湿润紧致的内壁尽可能地包裹着你的龟头。在药物、骑在你身上的性感女孩以及你想成为一个好族长的渴望的共同作用下，她们毫不费力地让你在她们等待着、肥沃的子宫里释放。你大叫着抽搐，把精液播种在女儿们的子宫里，既然她们已经长大了，你就把她们当成她们的母亲一样对待。");
               if(get_player().cumQ() > 700)
               {
                  outputText("即使你已经用精液填满了她们的肚子，她们的子宫也无法容纳你巨大的射精量，精液弄得到处都是。");
               }
               if(get_player().cumQ() > 2000)
               {
                  outputText("几秒钟后，之前的水坑变得更深了，你的女儿们好心地撑起你的头，以免你淹死在精液池里。");
               }
            }
            outputText("[pg]");
            outputText("在经历了两次惊人的高潮后，你精疲力尽，开始打瞌睡，但你很高兴，因为你知道她们会让你保持勃起并不断射精，直到每一个空虚的小穴都充满浓稠的造人奶油。");
         }
         else
         {
            outputText("谢天谢地，饥渴的地精小穴能够轻松吞下你的[cock]。那些柔软、被体液润滑的肉壁紧紧地包裹着你");
            if(get_player().biggestCockArea() < 30)
            {
               outputText("尽管她们通常能应付很大的尺寸。");
            }
            else
            {
               outputText("巨大的尺寸。");
            }
            if(get_player().totalCocks() > 1)
            {
               outputText("当你的女儿们开始在你的肉棒上上下滑动时，你高兴地咕哝着，她们流口水的小穴里发出的每一次湿润的吧唧声都伴随着淫荡的呻吟。多亏了药物的作用，你性感女儿们扭动的身躯，以及想要成为家庭好家长的渴望，你很快就高潮了。你大叫着抽搐，把精液播撒在女儿们的子宫里，既然她们都长大了，就应该像对待她们的母亲一样对待她们。");
               if(get_player().cumQ() > 700)
               {
                  outputText("由于她们的子宫无法容纳你巨大的射精量，精液到处都是，即使你已经用这东西把她们的肚子撑得鼓鼓的。");
               }
               if(get_player().cumQ() > 2000)
               {
                  outputText("几秒钟后，之前的水坑变得更深了，你的女儿们好心地托起你的头，以免你淹死在精液池里。");
               }
            }
            else
            {
               outputText("当你的女儿开始在你的肉棒上上下滑动时，你高兴地咕哝着，她流口水的小穴里发出的每一次湿润的吧唧声都伴随着淫荡的呻吟。多亏了药物的作用，你性感女儿扭动的身躯，以及想要成为家庭好家长的渴望，你很快就高潮了。你大叫着抽搐，把精液播撒在女儿的子宫里，既然她长大了，就应该像对待她的母亲一样对待她。");
               if(get_player().cumQ() > 700)
               {
                  outputText("由于她的子宫无法容纳你巨大的射精量，精液到处都是，即使你已经用这东西把她的肚子撑得鼓鼓的。");
               }
               if(get_player().cumQ() > 2000)
               {
                  outputText("几秒钟后，之前的水坑变得更深了，你的女儿们好心地托起你的头，以免你淹死在精液池里。");
               }
            }
            outputText("[pg]");
            outputText("在经历了两次惊人的高潮后，你精疲力尽，开始打瞌睡，但你很高兴，因为你知道她们会让你保持勃起并不断射精，直到每一个空虚的小穴都充满浓稠的造人奶油。");
         }
         knockUpDaughters();
         get_game().forest.tamaniScene.tamaniKnockUp();
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,56,FlagDict_Impl_.arrayReadInt(_loc1_,56) + 1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Str(-0.5),DynStat.Inte(-0.5),DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function loseToDaughters() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         if(get_player().get_lust() >= get_player().maxLust())
         {
            if(get_player().hasStatusEffect(StatusEffects.Infested))
            {
               get_game().mountain.wormsScene.infestOrgasm();
               outputText("[pg]地精们叹了口气说，[say: 爸爸，那太恶心了。别误会，我们还是会让你让我们怀孕的，但我讨厌那些蠕虫在我体内的感觉。]");
               get_player().orgasm("Dick");
            }
            outputText("[pg]你放弃了，你被这群性欲旺盛的变态们弄得太兴奋了，再也无法抗拒她们。你准备好操她们所有人了。");
            if(get_player().cockTotal() == 0)
            {
               outputText("性感的荡妇们撅起嘴，[say: 为什么你非得把你的鸡巴弄没！？] 接着有什么东西重重地砸在你的头上，把你敲晕了。");
               get_combat().cleanupAfterCombat();
               return;
            }
            if(TamanisDaughtersScene.tamaniPresent)
            {
               if(Utils.rand(2) == 0)
               {
                  doNext(loseToDaughtersWithTamaniThere);
               }
               else
               {
                  doNext(legTamanisDaughtersRAEPYou);
               }
               return;
            }
            if(Utils.rand(2) == 0)
            {
               doNext(tamaniDaughtersCombatLossDrain);
            }
            else
            {
               doNext(legTamanisDaughtersRAEPYou);
            }
            return;
         }
         outputText("[pg]伤势过重，你甚至无法尝试阻止地精大军……");
         if(get_player().cockTotal() == 0)
         {
            outputText("性感的荡妇们撅起嘴，[say: 为什么你非得把你的鸡巴弄没！？] 接着有什么东西重重地砸在你的头上，把你敲晕了。");
            get_combat().cleanupAfterCombat();
            return;
         }
         if(TamanisDaughtersScene.tamaniPresent)
         {
            doNext(loseToDaughtersWithTamaniThere);
            return;
         }
         if(Utils.rand(2) == 0)
         {
            doNext(tamaniDaughtersCombatLossDrain);
         }
         else
         {
            doNext(legTamanisDaughtersRAEPYou);
         }
      }
      
      public function legTamanisDaughtersRAEPYou() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,59,FlagDict_Impl_.arrayReadInt(_loc1_,59) + 1);
         var _loc2_:int = get_player().totalCocks();
         var _loc3_:Number = int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) / 2);
         var _loc4_:int = get_player().cockThatFits(50);
         clearOutput();
         outputText("你很清楚，一");
         if(_loc3_ > 20)
         {
            outputText("大");
         }
         outputText("群地精在你体内还有一滴精液的时候是绝不会放你离开的，于是你脱下衣服，走到她们中间，躺在一块柔软的苔藓上，将自己完全交给了她们。刹那间，你被淹没在柔软的绿色肉海中，全身上下都被抚摸着。这群地精中体型最大的那个正开心地抚摸着");
         if(_loc2_ > 1)
         {
            outputText("其中一根");
         }
         outputText("你的[cocks]，在它几乎瞬间勃起时挑逗着你，[say: 妈妈从没告诉过我你是个这么随便的" + get_player().mf("男","") + "荡妇。][pg]");
         outputText("一道湿滑的裂隙骑上了你的[face]，挡住了你的视线，除了一个可爱的肚脐什么也看不见，刺鼻的淫水流淌在你的嘴唇上。你无奈地叹了口气，张开嘴，将舌头埋进你众多女儿之一的小穴里。味道酸甜，比新鲜水果还要多汁。你听到的少女娇喘声让你知道你的舌头有多成功，你比以往任何时候都更加努力地亲吻和舔舐她湿滑的阴唇，只在将她小巧的阴蒂吸进嘴里时才停顿一下。[pg]");
         outputText("在整个过程中，其他的女孩们也没闲着，塔玛尼的大女儿吸引了你大部分的注意力，她继续为你套弄着。她揉捏抚摸着它，直到你的肉棒在她的手中颤抖，随时准备爆发。[pg]");
         if(_loc4_ >= 0)
         {
            outputText("她毫不费力地跨坐在你身上，引导着你整根肉棒进入她的蜜壶。令人惊讶的是，这个娇小的女孩能够将她的小穴撑开，形成一个紧密但不难受的贴合。");
            if(_loc2_ == 2)
            {
               outputText("另一双手抓住了你空闲的肉棒，强行坐了上去，与另一个幸运的荡妇背靠背坐着，将其一插到底。不知为何，你知道如果你能看穿闷在你脸上的紧致娇躯，看着你的女儿们一起做爱绝对会让你达到高潮的边缘。");
            }
            else if(_loc2_ > 2)
            {
               outputText("越来越多的手抓住了你剩下的[cocks]，将它们一根根引导进紧致的小穴里。如果你能绕过贴在你脸上的荡妇的紧致娇躯看一眼，你确信你胯下的场景绝对会让你达到高潮的边缘。");
            }
            else
            {
               outputText("你浑身一僵，一条舌头突然抵住你的[assholeorpussy]并滑入其中，让你肉棒上蔓延的快感不断加剧，直到你再也把持不住。");
            }
            outputText("[pg]");
            outputText("一股突如其来的淫液浸湿了你的[face]，顺着下巴滴落。骑在你脸上的地精像野马一样猛烈地扭动，差点撞断你的鼻子，随后她浑身脱力，滑落到泥土中，虚弱地喘息着。看到");
            if(_loc2_ > 2)
            {
               outputText("这么多女孩被你的肉棒贯穿");
            }
            else if(_loc2_ == 2)
            {
               outputText("你女儿们脸上淫荡的愉悦表情");
            }
            else
            {
               outputText("塔玛尼的大女儿骑在你的" + get_player().cockDescript(_loc4_) + "上时那撩人的目光");
            }
            outputText("，你除了射精什么也做不了。");
            if(_loc2_ > 1)
            {
               outputText("你的身体剧烈地抽搐着，将精液倾泻进这些紧致、肥沃的精液容器中，给了她们最想要的东西。");
            }
            else
            {
               outputText("你的身体剧烈地抽搐着，将精液倾泻进这个紧致、肥沃的精液容器中，给了她最想要的东西。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("你射出的那近乎超自然数量的精液轻易地胀大了");
               if(_loc2_ == 1)
               {
                  outputText("她的肚子，直到她看起来有点像怀孕了");
               }
               else
               {
                  outputText("她们每个人的子宫，直到她们看起来有点像怀孕了");
               }
               outputText("。");
            }
            if(_loc2_ == 1)
            {
               outputText("她从你疲软的阴茎上站起身，给了你一个飞吻，说道：[say:我想你让我怀孕了，爸爸！][pg]");
            }
            else
            {
               outputText("她们从你疲软的阴茎上站起身。大女儿给了你一个飞吻，说道：[say:我想你让我们怀孕了，爸爸！][pg]");
            }
            if(TamanisDaughtersScene.tamaniPresent)
            {
               outputText("塔玛尼把那些被精液填满的女孩们推开，带着鄙夷的神情低头看着你，[say:我发誓，亲爱的，看你这副德行，我觉得你的鸡巴已经是地精小穴的奴隶了。][pg]");
               outputText("她调皮地拍了一下");
               if(_loc2_ > 1)
               {
                  outputText("其中一根");
               }
               outputText("正在疲软的[cocks]，当它作为回应再次硬起来时，她坏笑起来，[say:说真的，你真是不知羞耻，这么单纯的触碰就能让你又硬了。我都不知道你这么想让我们的小家庭变得更大呢。][pg]");
               outputText("塔玛尼装模作样地叹了口气，用手指从你的");
               if(!get_player().hasSheath())
               {
                  outputText("根部");
               }
               else
               {
                  outputText("包皮");
               }
               outputText("一直划到龟头，当她的话语和抚摸让你完全准备好时，她开心地咯咯笑了起来。[pg]");
               outputText("[say:好吧，如果我不让你时不时地把压力发泄在我饥渴的小穴里，我就不是个好妻子了，对吧？来，喝了这个，它能保证我们会有很多女儿，]地精说着，把一个烧瓶塞进你手里。你点点头，地精对你腹股沟不断的抚摸和套弄让你变得顺从。饮料很顺滑地咽了下去，你从彩色玻璃瓶里快速喝了几口，它就消失在你的体内。它在你的肚子里安顿下来，散发出令人愉悦的温暖，渗入你的胯部，同时让你的大脑变得模糊。[pg]");
               outputText("塔玛尼按摩着你的");
               if(get_player().biggestTitSize() < 1)
               {
                  outputText("胸膛");
               }
               else
               {
                  outputText(get_player().allBreastsDescript());
               }
               outputText("当她骑上你时，");
               outputText("她那湿漉漉的小穴紧紧夹住你的" + get_player().cockDescript(_loc4_) + "。她一边抚摸着你的脸颊，一边解释道，而你已经开始流口水了，[say: 你看，[name]，这瓶药水很特别。你现在大概能感觉到了吧，它正在清空你的大脑，关闭你的思考能力。这就是它的作用。等我完事后，你什么都不会记得，除了我的小穴夹着你的" + get_player().cockDescript(_loc4_) + "有多舒服。][pg]");
               outputText("你流着口水，接受了这个事实。她说得太对了，你绝对忘不了那湿热的触感在你的肉棒上摩擦的感觉。塔玛尼继续说着，自信地骑着你，而你的大脑则吸收着她的指令，[say: 我火热的小穴需要被填满，你的肉棒知道这一点。它渴望着。]她向后仰去，让你瞥见那粉嫩的肉壁和黏糊糊的淫液，同时她挑逗着自己的阴蒂，[say: 光是看到我的小穴，就能让你硬起来，准备好。一想到那火热的洞穴骑在你身上，你所有的血液和意志力就会集中到你那根准备好操我的肉棒上。你无法抗拒我的小穴。][pg]");
               outputText("她说的那些话已经不重要了。唯一重要的是，你的肉棒是多么地臣服于那个紧致的小洞，而将自己完全交给它又是多么地舒服。你那渴望精液的妻子喋喋不休，而你只是躺在那里，平静地听着，随着高潮的临近，满足地在她身下抽搐。当你感觉到你的");
               if(get_player().balls > 0)
               {
                  outputText("蛋蛋");
               }
               else
               {
                  outputText("腹股沟");
               }
               outputText("因为情欲和渴望而翻腾，准备为你的女主人孕育下一批女儿时，一个幸福的微笑在你的脸上蔓延开来。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) < 10)
               {
                  outputText("“等等……妻子……女主人？”你的大脑在疑惑，排斥着这些陌生的想法。你抬头看着塔玛尼，有一瞬间感到困惑");
               }
               else
               {
                  outputText("是的，这听起来太对了——塔玛尼是你的妻子，让她怀孕是你作为丈夫的责任。你沉浸在这个想法中片刻");
               }
               outputText("，直到一阵高潮席卷了你的身体，打断了你的思绪，将其淹没在快感的海洋中。[pg]");
               outputText("当你体内的肌肉收缩，将浓稠的精液泵入地精的子宫时，她扭动着身体，发出呻吟。一种前所未有的满足感和愉悦感传遍全身。让塔玛尼怀孕的感觉太棒了，以至于你的高潮持续了很久，直到你感到空虚和精疲力竭。回想起来，你意识到与你在旅途中尝过的其他洞穴（甚至她女儿的）相比，她的小穴要舒服得多。当塔玛尼从你身上站起来，身上滴着精液时，除了性爱之外的所有记忆都慢慢溜走，只留下幸福和对下一次填满她的期待。[pg]");
               outputText("你的女主人走开了，她扭动着丰满的臀部，漫步穿过那群仍然饥渴的地精。你摇了摇头，感觉有些不适，但在你还没来得及弄清楚之前，");
               if(_loc3_ < 20)
               {
                  outputText("那一小群地精就扑向了你，强迫你喝下液体，让你用黏稠的精液填满一个又一个的小穴。");
               }
               else if(_loc3_ < 30)
               {
                  outputText("那群地精女儿扑向了你，强迫你喝下强效春药，你被轮奸了几个小时，被迫用精液填满一个又一个的小穴。");
               }
               else
               {
                  outputText("那大群地精压在你身上，不断地给你下药并强暴你，直到你经历了数十次高潮，并舔干净了几乎同样数量的被精液灌满的荡妇。");
               }
               outputText("当你躺在那里，被下药并被榨干时，你的女儿们排成一排，一个接一个地亲吻你，每个人都低声说着诸如[say: 谢谢爸爸，]或[say: 美味的精液，爸爸，]之类的甜言蜜语，然后蹦蹦跳跳地走开，踩着泥泞走进了树林。");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,56,FlagDict_Impl_.arrayReadInt(_loc1_,56) + 1);
               get_game().forest.tamaniScene.tamaniKnockUp();
            }
            else if(_loc3_ < 20)
            {
               outputText("体型较小的女孩们轮流上阵，一个接一个地骑上你沾满精液的肉棒，把她们饥渴的小穴当成吸精海绵，直到你的" + get_player().cockDescript(_loc4_) + "被女性的体液擦得锃亮，清除了所有残留的精液。在经历了这么多次反复骑乘后，你又硬了起来，准备再次射精，而这些发情的荡妇也知道这一点。你被重新塞进她们每一个人的体内，一个接一个地进行连珠炮般的快速抽插。每个女孩在你的肉棒上只待了几秒钟，就被同伴拉下来，换上另一个狂喜的地精。在等待下一轮的时候，空闲的女孩们挑逗着你，捏着你的[nipples]，舔着你的耳朵，低声说道：[say:别射给她，射在我热乎乎的小穴里会舒服得多，]或者，[say:你不会射给那个贱货的，对吧？把你的精液留给我！][pg]");
               outputText("令人惊讶的是，你又高潮了。你" + get_player().cockDescript(_loc4_) + "现在的主人发出了一声狂喜的尖叫，随后变成了喘息和倒吸冷气的声音");
               if(get_player().cumQ() < 100)
               {
                  outputText("你在她身下抽搐着，将最后一点精液排入她的体内。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("你在她身下抽搐着，将她灌满精液，用你的精种彻底播种她的子宫。");
               }
               else
               {
                  outputText("你在她身下剧烈地抽搐着，将大股的精液射入她饥渴的身体里，直到她的肚子被精液胀大，并且随着你每一次喷射，精液开始从结合处溢出。");
               }
               outputText("其他人意识到自己没有中“精液彩票”，发出了失望的呻吟。获胜者高兴地拍着肚子站了起来，空气中充满了响亮的“吧唧”声，她的小穴吵闹地释放了你的" + get_player().cockDescript(_loc4_) + "。");
               if(get_player().cumQ() >= 500)
               {
                  outputText("几个有进取心的地精聚集在周围，收集散落的精液，并把它们铲进她们的洞里。");
               }
               outputText("[pg]");
               outputText("经过这番性爱杂技般的折腾，你的女儿们疲惫地收拾起自己的东西开始散去，但还有几个留下来把你的" + get_player().cockDescript(_loc4_) + "舔干净，并给了你深深的法式热吻。你也精疲力竭，开始打起瞌睡，但在睡着前，一个少女般的声音在你耳边低语：[say:谢谢爸爸！等你的女儿们长大了，我会把她们带回来，这样你也能夺走她们的初夜了。][pg]");
            }
            else
            {
               outputText("体型较小的女孩们轮流上阵，一个接一个地骑上你沾满精液的肉棒，把她们饥渴的小穴当成吸精海绵，直到你的" + get_player().cockDescript(_loc4_) + "被女性的体液擦得锃亮，清除了所有残留的精液。在经历了这么多次反复骑乘后，你又硬了起来，准备再次射精，而这些发情的荡妇也知道这一点。你被重新塞进她们每一个人的体内，一个接一个地进行连珠炮般的快速抽插。每个女孩在你的肉棒上只待了几秒钟，就被同伴拉下来，换上另一个狂喜的地精。在等待下一轮的时候，空闲的女孩们挑逗着你，捏着你的[nipples]，舔着你的耳朵，低声说道：[say:别射给她，射在我热乎乎的小穴里会舒服得多，]或者，[say:你不会射给那个贱货的，对吧？把你的精液留给我！][pg]");
               outputText("令人惊讶的是，你再次高潮了。你[cock]当前的主人爆发出一声狂喜的尖叫，随后变成了断断续续的喘息和娇喘");
               if(get_player().cumQ() < 100)
               {
                  outputText("你在她身下抽搐着，将最后一点精液排入她的体内。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("你在她身下抽搐着，将她灌满精液，用你的精种彻底播种她的子宫。");
               }
               else
               {
                  outputText("你在她身下剧烈地抽搐着，将大股的精液射入她饥渴的身体里，直到她的肚子被精液胀大，并且随着你每一次喷射，精液开始从结合处溢出。");
               }
               outputText("其他人意识到自己没有中“精液彩票”，发出了失望的呻吟。获胜者高兴地拍着肚子站了起来，空气中充满了响亮的“吧唧”声，她的小穴吵闹地释放了你的" + get_player().cockDescript(_loc4_) + "。");
               if(get_player().cumQ() >= 500)
               {
                  outputText("几个积极的地精凑了过来，收集起散落的精液，并把它们塞进自己的小穴里。");
               }
               outputText("[pg]");
               outputText("你因为刚刚经历的性摧残而筋疲力尽，但这群咯咯笑的家伙不打算让你休息。几只小手撬开你的嘴，强行将一种冒着泡的混合物灌入你的唇间。另一只手按摩着你的喉咙，迫使你吞下这东西。药效强烈且立竿见影。你的");
               if(get_player().balls > 0)
               {
                  outputText("睾丸开始肿胀，颤抖着肉眼可见地膨胀起来，准备着大量的精液。");
               }
               else
               {
                  outputText("腹股沟不适地抽动着，颤抖着开始酝酿大量的精液。");
               }
               outputText("你的[cocks]痉挛着，抽搐着，不劳而获的快感充满了肉体，让你达到了高潮。[pg]");
               outputText("你闷哼一声，射出一长股精液，溅在你的肚子上。随之而来的是一种明显的如释重负感，尽管她们喂你的神秘药物立刻将这种放松感变回了令人不适的肿胀感。你的臀部抽搐着，试图发射下一发，但却被一个滑坐到你身上的、打着阴环的地精小穴给截胡了。那个地精捏着自己的乳头，在你一次又一次地将精液射进她体内时发出愉悦的娇喘，直到她大声高潮，而她那被灌满的小穴在你每次试图塞入更多精液时都会往外溢出。[pg]");
               outputText("被灌满的地精被她的姐妹们拉开，透过人工诱发的快感迷雾，你看到她看起来已经完全失去了知觉。她嘴里流着口水，翻着白眼，整个身体在姐妹们的怀里抽搐着，随后被放在草地上恢复。尽管暴露在空气中，你依然在猛烈地射精，几股精液溅在你的脖子和胸膛上，随后下一个地精女儿爬了上来。[pg]");
               outputText("这个地精以背向骑乘的姿势骑着你，上下研磨着，在被完全受精时回头越过肩膀给你抛来诱惑的微笑。她的双腿颤抖着，阴道肌肉包裹着你蠕动，收缩挤压着，直到很难再把更多的精液射进她体内。带着心满意足的微笑，她从你身上站起来，并帮她的下一个姐妹就位。[pg]");
               if(_loc3_ < 40)
               {
                  outputText("你陷入了无休止的高潮，被一个接一个的地精强暴。一排排紧致粉嫩的小穴和它们绿皮的主人从你身上碾过，一旦她们每个人都滴着白色的精液，她们就会花时间再来一次。当一切结束时，你已经皮开肉绽，酸痛不已，而且你的");
                  if(get_player().balls > 0)
                  {
                     outputText("[balls]疼得要命");
                  }
                  else
                  {
                     outputText("胯部疼得要命");
                  }
                  outputText("，因为你不得不产生如此荒谬数量的精液。现在她们得到了她们想要的东西，这群熙熙攘攘的地精似乎没那么疯狂了。你被这群感激的地精亲吻、舔舐和按摩，你失去了意识，仍然在滴着精液。");
               }
               else
               {
                  outputText("你陷入了无休止的高潮，被一个接一个的地精强暴。一排排紧致粉嫩的小穴和它们绿皮的主人从你身上碾过，一旦她们每个人都滴着白色的精液，她们就会花时间再来一次。你皮开肉绽，酸痛不已，并且正在失去意识，但这大群年轻的地精远没有放过你。当你失去意识时，她们强行把另一瓶药水灌进你的喉咙。你的梦里充满了疯狂的狂欢，你的阴茎被塞进一个接一个紧致的洞里，这是现实的残酷反映。当你醒来时，她们已经走了，你感到难以置信的酸痛，但不知为何仍然很饥渴。在这么短的时间内服用这么多地精药物可能不是一个好主意。");
                  dynStats(DynStat.Lib(1),DynStat.Cor(0.5));
                  var _temp_1:* = get_player();
                  _temp_1.cumMultiplier = _temp_1.cumMultiplier + 0.3;
               }
            }
         }
         else if(!TamanisDaughtersScene.tamaniPresent)
         {
            outputText("塔玛尼的女儿毫不费力地扑到你身上，跨坐在你身上，试图将你的[cock]塞进她紧致的裂缝里。无论她怎么努力，就是塞不进去。她困惑地抬头看着你，问道：[say: 玛莱的屄啊，我妈是怎么吃下这头野兽的？][pg]");
            outputText("她惊愕地皱起眉头，把它压在你的肚子上，坐在上面，尽可能地张开她的阴户，包住你[cock]下方尿道形成的凸起。虽然你看不见她，但她开始沿着你的长度滑动的触感却美妙无比。过了一会儿，你能感觉到她进入了状态，俯下身子，将她紧绷的身体和沉甸甸的乳房也压在你身上。被迫在脑海中勾勒出的画面让你极度兴奋，你开始攻击骑在你[face]上的阴户，狂热地舔舐着它。[pg]");
            outputText("一股突如其来的液体浸透了你的[face]，从你的下巴滴落。骑在你脸上的地精像野马一样猛烈地挣扎，差点弄断你的鼻子，然后她身体的力气被抽干，滑落到泥土里，虚弱地喘息着。现在从多汁的牢笼中解脱出来，你可以看到大女儿正挤压着你的[cock]，滑动着她的裂缝和");
            if(_loc3_ < 20)
            {
               outputText("挺拔的");
            }
            else if(_loc3_ > 40)
            {
               outputText("沉甸甸的");
            }
            outputText("乳房压在它的每一处。");
            if(_loc2_ == 2)
            {
               outputText("另一个娇小的荡妇爬上了你的" + get_player().cockDescript(1) + "，高兴地向她的姐妹尖叫，加入她一起骑乘你。");
            }
            if(_loc2_ > 2)
            {
               outputText("第三个，化着性感的粉色妆容，留着白金色的金发，躺在你的");
               if(_loc2_ > 3)
               {
                  outputText("剩下的[cocks]上");
               }
               else
               {
                  outputText(get_player().cockDescript(2));
               }
               outputText("。");
            }
            outputText("[pg]");
            outputText("她转过身，将她那流着淫液的湿润肉缝贴在你的" + get_player().cockHead() + "上，开始用力地为你手淫。她的屁股令人迷醉地在你的");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("胸膛");
            }
            else
            {
               outputText(get_player().allBreastsDescript());
            }
            outputText("上弹跳着，让一阵新的快感传遍你的[cocks]。另一个女孩俯身在你的[legs]之间，舔舐着你的");
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
               outputText("会阴");
            }
            outputText("，按摩着你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("胯部");
            }
            outputText("，以及你胯部周围敏感的[skindesc]。骑在你[cock]上的巨乳女孩挑逗道：[say: 来吧，全射出来吧，" + get_player().mf("种马","性感宝贝") + "。我受够了吃你二手的精液了，直接射进我火热的小穴里吧。][pg]");
            if(_loc2_ == 2)
            {
               outputText("她的姐妹附和道：[say: 是啊，我想感受滚烫的精液射进我的小穴里。用宝宝把我填满，让妈妈都嫉妒吧！][pg]");
            }
            else if(_loc2_ > 2)
            {
               outputText("她的姐妹们附和道：[say: 是啊，我们想感受滚烫的精液射进我们的小穴里！用宝宝把我们填满，让妈妈都嫉妒吧！][pg]");
            }
            outputText("你的身体屈服于她们的要求。当你因高潮而肌肉紧绷时，你[legs]间的女孩用力地舔舐着。");
            if(_loc2_ == 1)
            {
               outputText("随着精液在你的尿道里鼓胀，女儿咯咯笑着尖叫起来，在伴随着湿润水声射入她体内之前，明显地撑开了她紧致的身体。当你屈服于这群吞噬精液的女儿，满足她们对精子无底洞般的需求时，空气中充满了黏腻的咕叽声。快感冲击着你，直到");
               if(get_player().cumQ() < 100)
               {
                  outputText("你的高潮结束，在泥泞的地精肉体中微弱地跳动着。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("你的高潮还在继续，把这个荡妇灌得看起来像是微微怀孕了一样。");
               }
               else
               {
                  outputText("你的高潮还在继续，精液四处飞溅，你把这个女孩灌得看起来像是怀孕了一样。");
                  if(get_player().cumQ() > 1000)
                  {
                     outputText("精液从她的小穴里喷涌而出，实际上把地精推开了，你的高潮将精液溅到了草地上。");
                  }
                  if(get_player().cumQ() > 5000)
                  {
                     outputText("其他地精在精液中嬉戏，贪婪地用双手把精液铲进她们滴水的小穴里，而你则形成了一个小小的精液湖。");
                  }
               }
            }
            else
            {
               outputText("随着精液在你的尿道里鼓胀，女儿们咯咯笑着尖叫起来，在伴随着湿润水声射入她们体内之前，明显地撑开了她们紧致的身体。当你屈服于这群吞噬精液的女儿，满足她们对精子无底洞般的需求时，空气中充满了黏腻的咕叽声。快感冲击着你，直到");
               if(get_player().cumQ() < 100)
               {
                  outputText("你的高潮结束，在泥泞的地精肉体中微弱地跳动着。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("你的高潮还在继续，把这些荡妇灌得看起来像是微微怀孕了一样。");
               }
               else
               {
                  outputText("你的高潮还在继续，精液四处飞溅，你把这些女孩灌得看起来像是怀孕了一样。");
                  if(get_player().cumQ() > 1000)
                  {
                     outputText("种子从她们的开口喷涌而出，实际上把地精们推开了，因为你的高潮把精液溅到了草地上。");
                  }
                  if(get_player().cumQ() > 5000)
                  {
                     outputText("其他地精在精液中嬉戏，贪婪地用双手把精液铲进她们滴水的小穴里，而你则形成了一个小小的精液湖。");
                  }
               }
            }
            outputText("[pg]");
            outputText("精疲力竭的你躺在泥土里，虚弱地抽搐着，脸上挂着疲惫的笑容。一个舌头上打着长长舌钉的地精跪在你的脸旁，给了你一个长长的吻，她的舌头与你的舌头交缠在一起。她的唾液尝起来几乎是甜的，这个充满激情的舌吻让你在快要喘不过气来的时候又硬了起来。她停了下来，当你大口喘气时，她强行把一颗药丸塞进你的嘴里。你知道她们总有办法让你吞下去，于是你叹了口气，咽下了这颗陌生的药物。和你舌吻的那个地精舔了舔她那闪亮的、吸过鸡巴的嘴唇，说道：[say: 妈妈总是说你是个急色的家伙。我甚至从她那里偷了这颗药——它应该能让你射出足够塞满我们每一个人的精液！我等不及要用我紧致的小穴接住第一发了！][pg]");
            if(_loc2_ == 1)
            {
               outputText("你");
            }
            else
            {
               outputText("你的每一根");
            }
            outputText("[cocks]现在都硬如磐石，顶端渗出了先列腺液。");
            if(_loc2_ == 1)
            {
               outputText("那个紫唇的荡妇抓住你的[cock]，故意把滑溜溜的液体涂抹在你的肉棒上，一边润滑一边给你打飞机。她温暖的嘴唇紧紧地贴在你的" + get_player().cockHead() + "上，这个年轻的地精开始舔舐你的先列腺液，把它从你的尿道里吸出来。这感觉简直像在天堂，你的[hips]在空中虚弱地挺动着，本能地想要增强这种快感。");
            }
            else
            {
               outputText("那个紫唇的荡妇抓住你的一根[cocks]，故意把滑溜溜的液体涂抹在肉棒上，一边润滑一边开始给你打飞机。她的姐妹们见状，跨过其他已经满足的荡妇，抓住你的" + get_player().cockDescript(1) + "，充满爱意地抚摸着。");
               if(_loc2_ > 2)
               {
                  outputText("她们散开，直到你的每一根[cocks]上都至少挂着一个地精，抚摸着你，触碰着你。");
               }
               outputText("这感觉简直像在天堂，你的[hips]在空中虚弱地挺动着，本能地想要增强这种快感。");
            }
            outputText("[pg]");
            outputText("那个在双腿间服侍的地精爬回了原位，你意识到她一定是最年轻的，因此在地精的地位中也是最低的。她急切的舌头和几分钟前一样熟练，在她的服侍和舔舐你[cocks]的舌头之间，你流出了成串的淫液。双手抚摸着你的");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("胸膛");
            }
            else
            {
               outputText(get_player().allBreastsDescript());
            }
            outputText("，在你的乳头上画圈，按摩着你的胸部，同时一个少女般的声音在你耳边低语：[say: 现在就为我们射吧，爸爸，为了等你，我们都湿透了……][pg]");
            outputText("一阵阵痉挛般的快感席卷了你的中段，你感觉到高潮时肌肉的收缩仿佛要将你撕裂。你的");
            if(_loc2_ == 1)
            {
               outputText("[cock]直接将一股精液喷射到你那痴迷于鸡巴的女儿嘴里，淹没了她，直到她倒下，精液从她的鼻孔里滴落。你将一大股精液高高地喷向空中，好几个地精伸着舌头跑来跑去，试图用嘴接住它。每一波精液都比上一波更大，像间歇泉一样从你的[cock]中喷发出来。很快，每个人身上都溅满了一层精液，你那令人肠胃紧缩的高潮逐渐减弱为一种更合理、但持续不断的、缓慢流动的精液。你的每个女儿都走上前来，轮流将你的肉棒对准她等待着的小穴，让浓稠的液体将她填满，然后摇摇晃晃地走开。接着下一个女孩也这样做，然后是下一个，再下一个……");
            }
            else
            {
               outputText("[cocks]直接将一波波精液喷射到你那痴迷于鸡巴的女儿们嘴里，淹没了她们，直到她们倒下，精液从她们的鼻孔里滴落。你将大量的精液高高地喷向空中，好几个地精伸着舌头跑来跑去，试图用嘴接住精液。每一波都比上一波更大，像间歇泉一样从你的[cocks]中喷发出来。很快，每个人身上都覆盖了一层厚厚的精液，你那令人肠胃紧缩的高潮逐渐减弱为一种更合理、但持续不断的、缓慢流动的精液。你的每个女儿都走上前来，将一根肉棒引导进她等待着的小穴，用浓稠的液体将自己填满，然后摇摇晃晃地走开。接着下一组女孩也这样做，然后是下一组，再下一组……");
            }
            outputText("你因为过度劳累而筋疲力尽，很快就失去了意识。");
         }
         else
         {
            outputText("你右边的人群中爆发了一阵扭打，虽然你能听到声音，但你脸上那个地精荡妇晃动的屁股和美味的小穴让你根本看不清发生了什么。你做了任何一个发情的" + get_player().mf("男人","扶他") + "在你的位置上都会做的事——对着那个滑溜溜的小穴呻吟，不去理会它，专注于感受那双熟练的手抚摸着");
            if(_loc2_ > 1)
            {
               outputText("你的每根");
            }
            outputText("你的[cocks]。[pg]");
            outputText("尖锐的声音带着恳求的语气响起，紧接着是肉体碰撞的声音。一个性感、熟悉的声音清了清嗓子，问道：[say: 哦，原来你在这里。塔玛尼还以为她的丈夫会在他该在的地方——深深地埋在她的双腿之间，而不是在这里奖励她那些愚蠢女儿们的不良行为。][pg]");
            outputText("你对着那散发着香气的小穴叹了口气，温暖的气流让这个湿滑的肉洞变成了喷涌着高潮液体的喷泉。肉壁紧紧夹住你的舌头，从根部到舌尖进行着你已经非常熟悉的挤奶般的动作。一声尖锐的欢愉尖叫响起，然后戛然而止。高潮中的女孩被从你探索的舌头上扯开，你眨了眨眼，适应了突然爆发的光线，眼前出现了一群性感的身体和塔玛尼那了然于胸的坏笑。[pg]");
            outputText("[say: 母亲大人总是说，你必须把你的男人拴紧点，天哪，她真是说对了——你竟然背叛了塔玛尼！还是和你的亲生女儿们！] 你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) >= 10)
            {
               outputText("妻子");
            }
            else
            {
               outputText("\"妻子\"");
            }
            outputText("假装愤慨地惊呼道。她轻轻敲了敲下巴，无视了她的女儿们继续舔舐和抚摸");
            if(_loc2_ > 1)
            {
               outputText("你的每根");
            }
            outputText("[cocks]。当塔玛尼宣布时，你的眼睛在极乐中翻白：[say: 塔玛尼会照顾你的，丈夫。你要把精液射进这些女孩饥渴的小穴里，直到她们不得不蹒跚着走回家，然后你会记住，为什么塔玛尼的小穴永远拥有你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "。][pg]");
            outputText("塔玛尼拿出一个口塞，塞进你抗议的嘴里，并将带子牢牢地绑在你的脖子后面。你扭动着身体，她揉乱了你的[hair]，但这群地精很容易就制服了你，既然知道了母亲的计划，她们便开始协助她。你");
            if(get_player().cor > 66)
            {
               outputText("叹了口气，实际上很期待接下来会发生什么");
            }
            else if(get_player().cor > 33)
            {
               outputText("没有反抗，知道没有办法阻止即将发生的事情");
            }
            else
            {
               outputText("颤抖着，挣扎着想要挣脱");
            }
            outputText("，而塔玛尼拿出了半打药水和一把药丸。她把装满药物的胶囊扔进你的嘴里，然后一瓶接一瓶地倒进药水，把她调配的药剂冲下去。[pg]");
            outputText("[saystart]好了，女孩们，排好队；爸爸要开始为你们喷射了，所以抓住他那个怪物，把龟头抵在你们饥渴的小穴上，直到你们被填满。别贪心，一旦你们的小穴装满了精液，就蹒跚着回家去，");
            if(_loc3_ < 20)
            {
               outputText("还有其他女孩在等着呢");
            }
            else if(_loc3_ < 35)
            {
               outputText("我们还有很多女孩要填满呢");
            }
            else
            {
               outputText("你们这里有成吨的人，所以如果你们每个人都想轮到的话，就得动作快点");
            }
            outputText("，[sayend] 地精母亲命令道。[pg]");
            outputText("她的话简直是预言。当你看着这一切，呻吟着，翻腾、冒泡的温暖带着渴望淹没了你的胯部。你的背部弓起，眼睛因为药物引起的高潮而产生不由自主的反应，变成了斗鸡眼。你咕哝着，抽搐着，地精们排好队，最年长的女儿抓住了你那根开始喷发的、不断抽动的[cock]。奇怪的是，这并不是你习惯的那种脉动、喷射的高潮。相反，当女孩排好队时，一股稳定的精液流冲刷在她的腹部，最终她将湿润的小穴在你不堪重负的尿道上摩擦。她带着淫荡的愉悦咯咯地笑着，在肿胀的" + get_player().cockHead() + "上摩擦，她的子宫被泵满了精液。她的肚子很快就圆了起来，她被迫退开，让你浸泡在自己的肚皮上，而你的下一个女儿则就位了。[pg]");
            if(_loc2_ > 2)
            {
               outputText("与此同时，你其他的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "正把精液浪费在你的肚子上，所以几个等候的女孩抓住了它们，把它们拉到一边，将龟头深深地塞进她们那似乎深不见底的肉洞里。她们咯咯笑着，用修剪整齐的指甲划过你的");
               if(get_player().biggestTitSize() < 1)
               {
                  outputText("胸膛");
               }
               else
               {
                  outputText(get_player().allBreastsDescript());
               }
               outputText("，在敏感的乳头上打着圈");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("，随着它们开始");
                  if(get_player().biggestLactation() < 2)
                  {
                     outputText("渗出");
                  }
                  else if(get_player().biggestLactation() < 3)
                  {
                     outputText("滴下");
                  }
                  else if(get_player().biggestLactation() < 5)
                  {
                     outputText("喷出");
                  }
                  else
                  {
                     outputText("如泉涌般喷出");
                  }
                  outputText("奶水");
               }
               outputText("。这淫靡的场景似乎给你带来了更多的快感，你感觉到高潮的强度在增加，精液的流量也变得更加浓稠。[pg]");
            }
            else if(_loc2_ == 2)
            {
               outputText("与此同时，你另一根" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "正把精液浪费在你的肚子上，所以一个等候的女孩抓住了它，把它拉到一边，将龟头深深地塞进她那似乎深不见底的肉洞里。她咯咯笑着，用修剪整齐的指甲划过你的");
               if(get_player().biggestTitSize() < 1)
               {
                  outputText("胸膛");
               }
               else
               {
                  outputText(get_player().allBreastsDescript());
               }
               outputText("，在敏感的乳头上打着圈");
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("，随着它们开始");
                  if(get_player().biggestLactation() < 2)
                  {
                     outputText("渗出");
                  }
                  else if(get_player().biggestLactation() < 3)
                  {
                     outputText("滴下");
                  }
                  else if(get_player().biggestLactation() < 5)
                  {
                     outputText("喷出");
                  }
                  else
                  {
                     outputText("如泉涌般喷出");
                  }
                  outputText("奶水");
               }
               outputText("。这淫靡的场景似乎给你带来了更多的快感，你感觉到高潮的强度在增加，精液的流量也变得更加浓稠。[pg]");
            }
            outputText("下一个荡妇跨坐在你身上，双手抓住你的" + get_player().cockHead() + "，用力捏住，让你痛得倒吸一口凉气。白色的浊液被截断，在她调整姿势时痛苦地倒流。就在你快要哭出来的时候，她已经就位，松开了那过紧的抓握。你的身体用一股强大的精液回报了这个荡妇带来的痛苦，这股力量几乎把她从你的腹部掀翻，精液溅满了她的嘴唇。她强忍着高潮，任由你用更多的浓稠精液填满她的深处。令人惊讶的是，她竟然比她的姐姐能容纳更多，一直坚持到看起来像怀孕几个月一样。她摇摇晃晃地走开，大腿间滴落着精液，发出湿漉漉的声响。[pg]");
            outputText("当你继续让这些荡妇地精女孩受孕时，塔玛尼很好心地取下了你的口塞。可悲的是，你沉醉在快感和塔玛尼的化学物质中，除了喘气和流口水什么也做不了，但这是一个很好的姿态。");
            if(_loc3_ < 20)
            {
               outputText("女孩们不慌不忙，因为只剩下十几个需要填满了。她们长时间、用力地骑着你，把子宫塞得满满的，弄得一团糟。即使她们所有人都被填满了，塔玛尼强效的药物依然让你保持在高潮状态，到处滴落着惊人数量的精液。几个更大胆的后代轮流把龟头滑进她们紧致的屁眼，让你在药物最终开始失效时完全填满她们。[pg]");
            }
            else if(_loc3_ < 35)
            {
               outputText("这群女孩似乎永远也填不满。每当其中一个太投入时，她的母亲就会把她拉回来，引导下一个愿意的洞就位。尽管队伍井然有序，精液还是弄得到处都是，浸透了你的躯干，也给不少地精的大腿涂上了一层白色的釉。整个过程中，你一直处于持续的高潮中，不过当你用精液填满最后一个女孩时，随着药物的失效，流量正在减慢。[pg]");
            }
            else
            {
               outputText("庞大的人群被迫小心翼翼地分配你的精液，尽管它非常丰富。塔玛尼甚至不让女孩们完全被填满，而是强迫她们每个人只能得到你高潮中填满小穴的片刻。那些已经轮到的人在周围徘徊，舀起漏出的充满精子的液体，铲进她们渴望婴儿的身体里。整个过程中，你一直被锁定在令人难以置信的高潮中。如果你还有任何理智，你可能会觉得自己更像一个工具而不是一个[manboy]，但你大脑的突触正忙于传递这种感觉有多好，根本无暇思考。当最后一个女孩轮到时，你的高潮已经减弱为微弱的水流，所以她一直待在上面，直到药物最终失效。[pg]");
            }
            outputText("即将怀孕的地精们摇摇晃晃地走开了，有点罗圈腿，身上涂满了精液。你从高潮中恢复过来，虚弱地喘着气，浑身发抖。塔玛尼用双臂搂住你的头，把你深深地抱在令人难以置信的胸部。柔软的皮肤完全把你包裹在乳肉中，她甜美的水果香味随着你的每一次呼吸充满了你的肺部。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 10)
            {
               outputText("她是有史以来最好的妻子。你深深地依偎在她的乳沟里，幸福地叹息着。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 5)
            {
               outputText("她真的是一个好妻子……等等，妻子？你耸耸肩抛开这个想法，享受着慢慢地在她胸前洗面奶。");
            }
            else
            {
               outputText("她对你真的没那么坏，不是吗？你叹了口气，依偎在她那摇晃的爱之枕上。");
            }
            outputText("最终她把你拉回来，吻了你的嘴唇。[pg]");
            outputText("塔玛尼递给你一个水壶，你欣然接受了，在经历了这样一场打破物理定律的高潮后，你口渴难耐。水很凉，令人满足。你以创纪录的速度把它喝光，大口大口地灌下去，直到容器空了。满足后，你重新躺下。这种快感是短暂的，因为你意识到刚才喝的水有一种刺鼻的余味。你试图愤怒地瞪着");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 10)
            {
               outputText("你的妻子");
            }
            else
            {
               outputText("塔玛尼");
            }
            outputText("，但你的头感觉完全麻木了，看着她让世界天旋地转。[pg]");
            outputText("粉红色的薄雾挤走了你的思绪，你的怒视融化成愚蠢的困惑。塔玛尼咯咯地笑着说，[saystart]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) > 0)
            {
               outputText("你不记得我们上次这样做是什么时候了吗？当然不记得。[sayend] 你火辣的地精妻子指着你突然肿胀勃起的[cock]，继续说道，[say: 不过你的鸡巴记得我的特殊药水。现在，让我们继续教你那奇妙的精液喷口如何在它的妻子和女主人面前表现得规矩点。][pg]");
            }
            else
            {
               outputText("我在那杯饮料里混合了一种特殊的药水。它能关闭所有那些烦人的想法，这样你就会听你那好妻子的话，让她告诉你该怎么想、怎么感觉。[sayend] 她抚摸着你部分软化的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "，看着它为她变硬，咯咯地笑着，[say: 一旦药效过去，你就不会记得塔玛尼告诉你的话，但你的鸡巴永远不会忘记。][pg]");
            }
            outputText("塔玛尼将她那摇晃的身体滑到你身上，把她那湿透的小穴直接放在你的[cock]上方。她那温暖湿润的爱液慢慢滴落到你身上，直到你的整个表面都涂满了她那清澈的女性淫液，整个区域都弥漫着她小穴的气味。她颤抖着看着你的眼睛，对着你那茫然的表情微笑，同时教导道，[say:感觉到你的肉棒有多硬了吗？那是因为它闻到了我饥渴、湿润的小穴。它知道它想为我的小穴射精。你的肉棒只想触摸我的小穴，崇拜它，并用精液沐浴它。][pg]");
            outputText("她终于让那粉嫩的入口触碰到了你，在你的肉棒上前后滑动。当她滑到顶端时，你忍不住流下了口水。她向后仰去，向你展示她那闪闪发光的入口，同时说道：[say: 这就是你想要的，你需要的。光是看着它就让你欲火焚身，准备好做爱了。只要看一眼，你所有的烦恼都会融化成性欲，只想取悦你的地精妻子。][pg]");
            outputText("她完全是对的。你已经无法真正理解她的话语了，你只知道你的妻子让你的肉棒变得多么滚烫，它有多想射进她的身体里。塔玛尼会意地笑了笑，开始再次沿着敏感的肉棒滑动身体，用她那美妙的阴道慢慢地将你推向不可避免的高潮。她俯下身，低声说：[say: 你会做一个听话的好丈夫，操你的妻子，对吧？这是丈夫的责任——崇拜妻子美丽的阴道，用精液给它洗澡，并在她面前保持顺从。][pg]");
            outputText("她说的那些话已经不再重要了。重要的是你的肉棒有多么渴望那个美妙、湿润的裂口，以及将自己完全交给它的感觉有多棒。你那渴望精液的妻子喋喋不休，而你只是躺在那里，平静地听着，随着高潮的临近，满足地在她身上抽搐。当你感觉到你的");
            if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else
            {
               outputText("腹股沟");
            }
            outputText("因为情欲和渴望而翻腾，准备为你的女主人孕育下一批女儿时，一个幸福的微笑在你的脸上蔓延开来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) < 10)
            {
               outputText("“等等……妻子……女主人？”你的大脑在疑惑，排斥着这些陌生的想法。你抬头看着塔玛尼，有一瞬间感到困惑");
            }
            else
            {
               outputText("是的，这听起来太对了——塔玛尼是你的妻子，让她怀孕是你作为丈夫的责任。你沉浸在这个想法中片刻");
            }
            outputText("，直到一阵高潮席卷了你的身体，打断了你的思绪，将其淹没在快感的海洋中。她呻吟着滑下来，将入口紧贴着你的尿道，随着你体内肌肉的收缩，将浓稠的精液泵入地精的子宫。一种前所未有的满足感和快感传遍全身。让塔玛尼怀孕的感觉太棒了，你的高潮似乎持续了永远，直到你感到空虚和疲惫。回想起来，你意识到与你在旅途中品尝过的其他洞穴，甚至她女儿的洞穴相比，她的阴道能带来多大的快感。当塔玛尼从你身上站起来，滴着精液时，除了性爱之外的所有记忆都在慢慢溜走，只留下幸福和对下一次填满她的期待。[pg]");
            outputText("你的女主人走开了，她一边走一边摇晃着她那丰满的臀部。你摇了摇头，感觉有点不舒服，但还没等你弄明白，这次遭遇带来的疲惫感就压倒了你，让你失去了意识。");
            get_game().forest.tamaniScene.tamaniKnockUp();
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,56,FlagDict_Impl_.arrayReadInt(_loc1_,56) + 1);
         }
         get_player().orgasm("DickAndAnal");
         dynStats(DynStat.Str(-0.5),DynStat.Inte(-0.5),DynStat.Lib(1),DynStat.Cor(1));
         if(TamanisDaughtersScene.tamaniPresent)
         {
            get_game().forest.tamaniScene.tamaniKnockUp();
         }
         knockUpDaughters();
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function knockUpDaughters() : void
      {
         var _loc2_:* = null as IMap;
         if(pregnancy.get_isPregnant())
         {
            return;
         }
         pregnancy.knockUpForce(25,216);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1206,2);
         var _loc1_:Number = get_player().cumQ();
         if(get_player().hasPerk(PerkLib.MaraesGiftStud))
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 3);
         }
         if(_loc1_ >= 50 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
         if(_loc1_ >= 100 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
         if(_loc1_ >= 200 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
         if(_loc1_ >= 300 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
         if(_loc1_ >= 400 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
         if(_loc1_ >= 500 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
         if(_loc1_ >= 600 && Utils.rand(2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1206,FlagDict_Impl_.arrayReadInt(_loc2_,1206) + 1);
         }
      }
      
      public function fuckYoDaughtersHomie() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,59,FlagDict_Impl_.arrayReadInt(_loc1_,59) + 1);
         var _loc2_:int = get_player().totalCocks();
         var _loc3_:Number = int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) / 2);
         clearOutput();
         outputText("你脱下[armor]，一把抓住");
         if(_loc2_ == 1)
         {
            outputText("你的");
         }
         else
         {
            outputText("你的一根");
         }
         outputText("[cocks]，在它变硬时甩来甩去，挑逗着这群饥渴的婊子。[pg]");
         outputText("[say:来拿啊，]你大喊着，神气地向前走去。那些");
         if(_loc3_ < 12)
         {
            outputText("女孩们涌");
         }
         else
         {
            outputText("人群涌了上来");
         }
         outputText("向前涌来，从四面八方把你团团围住。");
         var _loc4_:int = get_player().cockThatFits(50);
         if(_loc4_ >= 0)
         {
            outputText("你从人群中随手挑出一个，让她被你的" + get_player().cockDescript(_loc4_) + "贯穿。其他人围拢过来，嫉妒这个被你选中的肉套。她抬头望着你，满脸陶醉地抱紧你，扭动紧致的身体向下磨蹭，用她处女的小穴强行套弄着你坚硬的" + get_player().cockDescript(_loc4_) + "。其他人则按摩着你的[legs]，舔舐、轻咬你的皮肤，争先恐后地诱惑你下一个选她们。");
            if(TamanisDaughtersScene.tamaniPresent)
            {
               outputText("塔玛尼推开那些较小的荡妇，然后");
               if(get_player().balls > 0)
               {
                  outputText("捧住你的[balls]。");
               }
               else
               {
                  outputText("舔舐你的会阴。");
               }
            }
            outputText("[pg]");
            outputText("没过多久，她那如老虎钳般紧致的阴道，以及夺走她初夜的快感，就让你突破了极限。你低吼着，将浓稠的精液深深地射进她那狭小的阴道里");
            if(get_player().cumQ() >= 500)
            {
               outputText("，把她的肚子灌得鼓胀起来，直到她在你身上咕噜作响、湿滑地瘫软着");
            }
            outputText("。她双眼发直地跌了下去，而她的姐妹们则争先恐后地抢着顶替她的位置。");
            if(TamanisDaughtersScene.tamaniPresent)
            {
               outputText("塔玛尼把其余的人推开，骑到了你身上，");
               if(get_player().get_tallness() >= 60)
               {
                  outputText("向上爬了爬，刚好能");
               }
               outputText("粗暴地吻上你的嘴唇，尝起来有樱桃和汗水的味道。你的身体变得瘫软，仰面躺下，任由你的绿色女主人摆布。[pg]");
            }
            else
            {
               outputText("另一个家伙骑上了你，她猛地扑向你，巨大的冲击力把你的[feet]撞离地面，让你仰面摔倒。一只手捂住你的嘴，往里面塞了什么东西，另一只手则顺着你的喉咙按摩，强迫你吞下去。麻木感流遍你的全身，夺走了你的力量和知觉，唯独一个地方例外……[pg]");
            }
            outputText("你躺在泥地里，被一群地精包围着，从头到脚都被年轻地精那性感的肉体覆盖着。你心里清楚自己正在被强暴，但你被下了药，除了试着去享受之外，真的什么也做不了。紧紧包裹着你肉棒的地精小穴拒绝让它变软，用紧绷的肌肉涟漪按摩着它。");
            if(TamanisDaughtersScene.tamaniPresent)
            {
               outputText("塔玛尼巨大的奶子贴在你的[breasts]上，弹跳晃动着。她双臂交叉托在胸前，吸吮着一根手指，带着几分戏谑与情欲观察着你的表情。她问道，[say: 那么你觉得你的女儿们怎么样，小甜心？她们正渴望尝尝爸爸的精液呢，要控制这么多精力旺盛的小荡妇可真不容易。][pg]");
            }
            else
            {
               outputText("塔玛尼的女儿抬头看着你，开心地咯咯笑着，腰胯却在猛烈地榨弄你。她问道，[say:你觉得我的小穴比妈妈的更紧吗？你肯定没想过，有一天会把自己的一个女儿干到怀孕吧？][pg]");
            }
            outputText("如此变态的想法，竟然来自你自己的女儿们。");
            if(get_player().cor < 33)
            {
               outputText("你本该拯救村子免受腐化，而不是繁育出一群小荡妇，让她们把村子占满…… y");
            }
            else if(get_player().cor < 66)
            {
               outputText("你来到这里是为了让大家的生活变得更好……好吧，至少你确实帮到了这些女孩。Y");
            }
            else
            {
               outputText("你来到这里是为了让事情变得更好，但你知道，只要一有机会，你还是会继续让塔玛尼怀孕。给这片绿色女孩的海洋再添新成员实在太有趣了，根本无法抗拒。你");
            }
            outputText("你呻吟起来，一只滴着淫液的绿色小穴压到你的[face]上，把你本可能发出的抗议全都闷了回去。你的舌头不停舔舐，尽力侍奉着你众多地精后代中的又一个。它深深探入，采撷她的蜜液，让她用淫液把你浸湿，像着了魔一样为她口交。你双眼发直，感觉释放感不断积蓄，如浪潮般涌上顶点，准备灌进你的");
            if(!TamanisDaughtersScene.tamaniPresent)
            {
               outputText("女儿");
            }
            else
            {
               outputText("最喜欢的地精熟女");
            }
            outputText("。[pg]");
            outputText("高潮的快感骤然冲上顶点，第一股精液喷射射向");
            if(!TamanisDaughtersScene.tamaniPresent)
            {
               outputText("你的地精女儿");
            }
            else
            {
               outputText("塔玛尼");
            }
            outputText("射进她等待已久的子宫里，把她的内壁染得一片雪白。一团接一团的精液混入她阴缝里翻涌的淫液中，直到开始往外滴落。骑在你脸上的地精也大声高潮了，用雌性的淫液灌满你的嘴。你别无选择，只能一边咽下去，一边让舌头继续努力取悦她。突然间，你的" + get_player().cockDescript(_loc4_) + "上传来的触感骤然消失，只剩冷空气袭来，同时你听见地精们吵嚷起来。转眼间，一个新的小穴便套住了你仍在射精的性器，紧紧夹住形成密不透风的封口，而你则向里面泵入更多饱含生殖力的精液。[pg]");
            if(_loc3_ > 10)
            {
               outputText("随着你的高潮逐渐消退，你那绿色的肉棒套被取了下来。你幸福地叹了口气，很高兴这场折磨结束了。你的[cock]还在继续跳动，你想知道还要等多久地精的药效才会过去。答案比你想象的来得要快，那是一大瓶味道甜美的液体。一只蓝绿色的手捏住你的鼻子，按摩你的喉咙，直到你把整瓶液体都吞下去。结果立竿见影。随着身体对腐化药物的反应，轻微的颤抖传遍了你的全身。");
               if(get_player().balls > 0)
               {
                  outputText("你的睾丸肉眼可见地鼓胀起来，里面晃荡着；你的一个女儿把玩着它们，让其中积蓄的精液比以往任何时候都多。");
               }
               else
               {
                  outputText("你的肠胃痛苦地绞紧，仿佛有什么东西在里面膨胀。压力在你的阴茎根部聚集，你意识到不知为何，你体内的精液比以往任何时候都要多。");
               }
               outputText("[pg]");
               if(TamanisDaughtersScene.tamaniPresent)
               {
                  outputText("塔玛尼把你脸上的那个荡妇推开，自己坐了上去，用精液和阴道分泌物的混合物涂满了你的[face]。");
                  if(get_game().forest.tamaniScene.pregnancy.get_isPregnant())
                  {
                     outputText("她抚摸着因怀孕而隆起的肚子");
                  }
                  else
                  {
                     outputText("她抚弄着自己的乳头");
                  }
                  outputText("她一边在你身上摩擦一边呻吟，[say: 啊，你会有更多女儿的！你该知道，如果你继续这样射进她们里面，我将永远无法约束她们所有人。所以如果你不想像这样被你的女儿们轮奸，你最好停止高潮，好吗？别再把精液射进那些滴着水的处女小穴里了。][pg]");
               }
               else
               {
                  outputText("第一个接纳你精液的女儿爬到你的脸上，一屁股坐了下来，用精液和阴道分泌物的混合物涂抹你的[face]。她捏着自己刚刚发育的胸部，在你身上摩擦着，问道：[say: 你知道我要怀孕了，对吧？我已经能感觉到你的小蝌蚪在挑逗我所有的卵子了。你能想象我几天后会是什么样子吗？胸部变大，漏出奶水，肚子里塞满了后代？就让你的老二来思考吧，继续射精，直到我们都被塞满，好吗？现在不要忍着了，我们渴望得到更多！][pg]");
               }
               outputText("那些变态的想法侵入了你的脑海，在你的体内蠕动，直到它们到达你的" + get_player().cockDescript(_loc4_) + "。它紧绷着，然后爆发了，把那个荡妇的子宫塞满了浓浆。她被她的姐妹们抬走，你的下一发喷射到了半空中，伴随着湿润的啪嗒声溅落在聚集的地精身上。许多地精把它收集起来，舔舐着，吸吮着，或者直接把它塞进她们饥渴的小穴里。另一个小穴被放在了你身上，新肉体接纳你的感觉让收缩感显得更加漫长。几分钟后，她踉跄着离开了，看起来已经怀孕了。这个循环不断重复，直到");
               if(_loc3_ < 20)
               {
                  outputText("大多数");
               }
               else
               {
                  outputText("一半");
               }
               outputText("女孩们的阴户上都沾满了精液，脸上挂着大大的笑容。[pg]");
               outputText("当你的");
               if(get_player().balls > 0)
               {
                  outputText("[balls]排空了");
               }
               else
               {
                  outputText("前列腺排空了");
               }
               outputText("，其中一个女孩走过来问道，[say:知道你的女儿怀了更多的孩子是什么感觉？这让你兴奋吗，<b>爸爸</b>？][pg]");
               if(_loc3_ > 20)
               {
                  outputText("你躺在那里，感觉自己就像一具空壳。人群开始散去");
                  if(TamanisDaughtersScene.tamaniPresent)
                  {
                     outputText("当塔玛尼走开时");
                  }
                  outputText("，但有几个小骚货看起来还不满足。她们围了过来。其中一个跨坐在你的胸口，开始跳起色情的舞蹈。不知怎么的，你的" + get_player().cockDescript(_loc4_) + "竟然还能微弱地抽动作为回应。另一个地精打开一个挎包，拿出一些水果和一个水壶。她小心翼翼地开始喂你，显然是想让你恢复体力。看来她们还没打算放过你。你喝下了感觉有几加仑的水，然后发现面前又多了一瓶粉红色的粘液。你耸了耸肩，心甘情愿地把它吞了下去，享受着你的[cock]重新膨胀到最大、最坚挺的尺寸的感觉。[pg]");
                  outputText("你幸福地叹了口气，躺在那里，任由剩下的女儿们将你占有，一个接一个地干你。整个过程中你都没有停止进食，将女孩们的所有口粮转化为成加仑的精液。你的女儿们似乎并不介意，她们轮流摆出性感的姿势喂你，同时轮流骑在你的肉棒上，直到她们肚子胀大，怀上身孕。当最后一个女儿颤抖着双腿站起来时，你已经筋疲力尽，双眼也快要闭上了。");
                  if(_loc3_ < 50)
                  {
                     outputText("随着人群慢慢散去，少女们的娇笑声伴你入眠。");
                  }
                  else
                  {
                     outputText("当你的身体因疲惫而垮掉时，少女们的咯咯笑声抚慰着你入睡。你听到的最后一件事是最大的女儿建议，[say:我们应该一直把爸爸留在身边……]");
                  }
               }
            }
            if(_loc3_ <= 20)
            {
               outputText("这场折磨让你筋疲力尽，惊魂未定，你躺在那里，看着女孩们重新聚集起来，将滴落的精液收集到瓶子里，或是塞进她们肿胀的小穴中。其中几个还向你飞吻");
               if(TamanisDaughtersScene.tamaniPresent)
               {
                  outputText("，塔玛尼热情地和你法式湿吻。");
               }
               else
               {
                  outputText("。");
               }
               outputText("她们中的一个舔了舔你酸痛的肉棒，说道，[say: 谢谢你的浓精！][pg]");
            }
         }
         else
         {
            outputText("你从人群中随便挑了一个女孩，其他人围了过来，嫉妒你选中的这个肉便器。然而，当你试图插进去时，她兴奋的叫声很快变成了痛苦的呻吟。她实在太小了，即使对地精来说也是如此。你失望地把她放下来，但随后她躺在草地上，大大地张开双腿。她说道：[say: 既然你对我们来说太大了，不如我们轮流躺在地上排好队，同时让几个人把你那黏糊糊的浓精吸出来怎么样？][pg]");
            outputText("这个主意听起来很棒。两个发情的荡妇已经爬上前来，而她们的姐妹们则躺在地上，掰开外阴，玩弄着她们那小小的绿色阴蒂。她们一定是双胞胎，因为除了发型大相径庭外，她们的五官完全一样。这对肉棒荡妇同时亲吻着你肿胀的" + get_player().cockHead() + "，然后用嘴唇和舌头舔舐着你的整根肉棒。起初她们的动作还很同步，但随着她们越来越卖力，她们渐渐失去了节奏，直到她们各自在你[cock]的不同部位上流着口水。[pg]");
            if(TamanisDaughtersScene.tamaniPresent)
            {
               outputText("塔玛尼走上前，把手伸进一个小袋子里。当她抽出手时，你第一次看到了她拿出的东西。那似乎是一根巨大的双头假阳具，粉红色，软趴趴的。一端是犬科动物的形状，带着一个巨大的肉结，而另一端则是马阴茎般膨大的龟头。塔玛尼闷哼一声，用尖锐的犬科那一端刺入自己，甚至把那巨大假阳具的肉结也硬塞了进去。她松开假阳具，马阴茎的那一半在她身前威风凛凛地晃动着，滴下粉红色的液体。她抬头对你咧嘴一笑，说道：[say:如果我的女儿们要榨干你所有的精液，我得确保你不会有所保留。你看到这东西上的肉结了吧？嗯，里面装满了催情剂，所以当我高潮并夹紧它的时候，你就会被迫把每一滴精液都射进我女儿们的体内。][pg]");
               outputText("她消失在你的身后，你本能地瑟缩了一下，知道接下来恐怕至少会有些不舒服。");
               if(get_player().get_tallness() > 48)
               {
                  outputText("你能听到她爬上了你身后的什么东西，以便达到合适的高度。");
               }
               outputText("当其中一个荡妇张大嘴巴，将你的" + get_player().cockHead() + "吸入口中时，你那轻蔑的表情瞬间瓦解。她的舌头滑过你的龟头，感觉简直爽上天了，而她的姐妹则在套弄着肉棒，快速地撸动着被唾液润滑的巨物。然而，后门突然传来的异物感打断了你的享受。橡胶材质的带冠状沟的马形玩具抵在你的[asshole]上，随着塔玛尼将其向前推进，一些奇怪的润滑液滴入了你的后门。当玩具被向前推时，一双小手抓住了你的" + get_player().assDescript() + "，你别无选择，只能放松身体任由它进入。[pg]");
               outputText("假阳具的头部一半滑入你的体内，接着是另一半，没过多久，塔玛尼就慢慢地把它硬塞进你的体内。只有一点点痛，但足以让你的臀部向前扭动，试图徒劳地逃离。含着你肉棒的地精因为这突如其来的变故差点被呛到，不过她的姐妹却对你露出邪恶的笑容，撸动得更用力了。伴随着塔玛尼的一声呻吟，一股暖流喷射进你的体内，突然间，你的身体在快感中爆发了。[pg]");
               outputText("精液从第一个地精的鼻子里冒出泡泡，她从你身上倒下，顺便被狠狠地颜射了一脸。她的双胞胎姐妹开心地给你撸动着，将你的肉棒对准下方那一排小穴。黏糊糊的精液飞溅进她们的穴里，黏稠的白浊涂满了她们紧致的腰腹和丰满的大腿，你简直就像某种受孕喷洒器一样被她们使用着。塔玛尼将她的假阳具更深地捅进你的后庭，不知怎的，你竟然又为她的女儿们挤出了几滴飞溅的白浊。[pg]");
               outputText("被榨干后，你的" + get_player().cockDescript(0) + "软了下来，无力地垂着，滴下最后的精液。不过塔玛尼似乎并没有注意到这一点，继续从后面侵犯你。你正准备伸手把这个娇小的强奸犯推开，又一股催情剂在你体内释放，黏液沾到了你的前列腺上。一股热血涌向你的[cock]，你突然又硬得发疼。");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]因过度负荷而酸痛，难以再榨出更多的精液。");
               }
               outputText("一滴先列腺液在龟头上渗出，你发现自己放松了下来，任由塔玛尼将她那沾满药物的马屌完全滑入你的体内。[pg]");
            }
            outputText("第三只地精突然袭击了你的会阴，舔舐着你的[asshole]和");
            if(get_player().balls > 0)
            {
               outputText(get_player().ballsDescriptLight());
            }
            else if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText("肉棒");
            }
            outputText("，同时将她坚挺的乳头紧贴着你的[legs]。");
            if(!TamanisDaughtersScene.tamaniPresent)
            {
               outputText("她把什么东西抵在你的后庭上，还没等你反应过来，某种湿热的东西就填满了你的[asshole]。你低头一看，只见她拔出一根残留着粉色液体的管子，并在燃烧的欲火中摇曳着身姿。[pg]");
            }
            else
            {
               outputText("塔玛尼的假阳具滑入你的体内，那凸起的纹理和龟头冠状沟的触感让你站立不稳，沉醉在它分泌的液体所引发的欲望之中。你带着燃烧的欲望前后摇摆，而那对双胞胎都在抚摸和套弄你的肉棒，尽可能地从中榨取快感。[pg]");
            }
            outputText("你爆发了，在抵住你前列腺的压力和药物作用下，你射得比以往任何时候都要猛烈。双胞胎中的一个等得不耐烦了，把你的" + get_player().cockDescript(0) + "拉过去，将你的龟头顶在她滑腻的阴唇上。你设法将一大股浓稠的精液泵入她的深处，然后她的姐妹一把将它抢走，用自己饥渴的小穴在你的肉棒上摩擦，直到她的整个腹股沟都被染成白色。她们互相瞪了一眼，但在似乎满足之后，她们又一起回去抚摸你的[cock]，像用水管一样用它把剩下的精液浇在她们微笑着的姐妹们身上。[pg]");
            if(TamanisDaughtersScene.tamaniPresent)
            {
               outputText("塔玛尼在你身后用力挺动并尖叫道，[say: 操，对，把她们的小穴都搞大肚子！哦哦哦哦……][pg]");
               outputText("随着高潮的到来，她的声音渐渐变成了无法辨认的胡言乱语。你能感觉到你屁股里那根马屌形状的假阳具正把掺药的液体喷射进你的体内，而塔玛尼的小穴则在另一端紧紧夹住它。突然，整个东西滑了出来，你听到塔玛尼瘫倒在草地上。当你的肉棒再次对药物产生反应时，你转过身，注意到她已经完全神志不清了，双手揉捏着自己的乳房，伴随着短暂的无意识肌肉痉挛而颤抖着。[pg]");
            }
            if(!TamanisDaughtersScene.tamaniPresent)
            {
               outputText("有人递给你另一瓶，当t");
            }
            else
            {
               outputText("女");
            }
            outputText("孩们变换了位置，重新排列，让那些得到最多爱液的人现在靠在你身边。");
            if(!TamanisDaughtersScene.tamaniPresent)
            {
               outputText("你耸耸肩，把它喝了下去，");
            }
            else
            {
               outputText("你开始");
            }
            outputText("感到越来越饥渴，就像你刚到这里时一样准备就绪。你的[cock]抽动着，宣告着它已经准备好重新涂满这些活生生的精液海绵。三条地精的舌头滑过你的肉棒，涂着唇彩的嘴唇膜拜着你这根赋予生命的肉棒的每一寸。其中一个胸部丰满的年长女孩停了下来，开始顺着你的身体往上爬。她一直爬到坐在你的肩膀上，把她那滚烫泥泞的小穴压在你的脸上才停下来。[pg]");
            outputText("其中一个在你[cock]上的女孩有了个主意，她一边舔弄抚摸你，一边把她的奶子挤压在上面。地精们的联合攻势再次达到了目的，你再次被推向了浑身颤抖的高潮。这群地精开心地咯咯笑着，把落下的精液收集到她们饥渴的小穴里。装不下的部分被她们吸溜干净，很快，你就给这群扭动着身躯、曲线丰满的绿皮女人们盖上了一层厚厚的精液。[pg]");
            outputText("你射精了，向后倒去，完全被榨干，失去了意识。");
            if(_loc3_ >= 20)
            {
               if(_loc3_ < 30)
               {
                  outputText("在你失去意识的时候，一个玻璃小瓶塞进了你的嘴里，你条件反射地咽了下去。你发誓你听到有人在说，[say:还没完呢，]但你还是晕了过去。你的梦境一点也不安宁，反而充满了快感。");
                  dynStats(DynStat.Tou(-0.5),DynStat.Inte(-0.5));
               }
               else
               {
                  outputText("一瓶接一瓶的液体被抵在你的嘴上倒进喉咙里。你的身体条件反射地吞咽着，性欲的急剧飙升让你没有完全昏死过去。在真正失去意识之前，你记不清太多东西了，但有一件事深深印在你的脑海里，那就是你的一些女儿在问：[say:为什么我们不直接把爸爸带回营地，这样我们想什么时候操他都可以？]");
                  outputText("[pg]你还没听到回答就晕了过去。");
                  dynStats(DynStat.Tou(-0.75),DynStat.Inte(-1),DynStat.Lib(0.5));
               }
            }
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Cor(1));
         if(TamanisDaughtersScene.tamaniPresent)
         {
            get_game().forest.tamaniScene.tamaniKnockUp();
         }
         knockUpDaughters();
         var _temp_1:* = get_player();
         _temp_1.cumMultiplier = _temp_1.cumMultiplier + 0.3;
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function fightTamanisDaughters() : void
      {
         var _loc1_:* = null as Monster;
         var _loc2_:* = null as Monster;
         var _loc3_:* = null as Monster;
         var _loc4_:* = null as Monster;
         var _loc5_:* = null as Monster;
         clearOutput();
         outputText("你充满威胁地转过身，打算让塔玛尼这群任性的女儿们认清自己的位置。[pg]");
         startCombat(new TamanisDaughters());
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         if(TamanisDaughtersScene.tamaniPresent)
         {
            _loc1_ = get_monster();
            _loc1_.set_str(_loc1_.get_str() + 5);
            _loc2_ = get_monster();
            _loc2_.set_tou(_loc2_.get_tou() + 5);
            _loc3_ = get_monster();
            _loc3_.set_HP(_loc3_.get_HP() + 10);
            _loc4_ = get_monster();
            _loc4_.set_lust(_loc4_.get_lust() - 20);
            _loc5_ = get_monster();
            _loc5_.set_long(_loc5_.get_long() + " <b>塔玛尼潜伏在人群后方，她的曲线比她的女儿们更加丰满，正带着好笑又恼火的复杂神情注视着这一切。她用手捋过粉黑相间的头发，等待着介入的机会……</b>");
         }
      }
      
      public function encounterTamanisDaughters() : void
      {
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,55,FlagDict_Impl_.arrayReadInt(_loc1_,55) + 1);
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,55) > 0 && Utils.rand(10) == 0)
         {
            TamanisDaughtersScene.tamaniPresent = true;
            outputText("在四处游荡时，你发现前方的道路被 " + Utils.num2Text(int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) / 4)) + " 只地精挡住了。走在人群最前面的是塔玛尼");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,56) >= 10)
            {
               outputText("，你的妻子");
            }
            outputText("。你现在意识到其他的地精一定都是你的女儿。另一群小个子女人从灌木丛中钻了出来，将你团团围住，断绝了任何逃跑的机会。年轻地精中体型最大的那个走上前来，她那 " + tdCup() + " 的乳房随着步伐晃动，身上绑着的拘束绳几乎包不住它们。她走到母亲身边停下，塔玛尼解释道，[say:我实在没法把她们发情的小穴关在家里了！她们现在已经是成熟的成年人了，想在真正的肉棒上积累点经验。我想你应该不介意稍微帮帮她们吧。]");
            outputText("[pg]你要怎么做？");
            menu();
            addButton(0,"战斗",fightTamanisDaughters);
            addButton(1,"操她们",fuckYoDaughtersHomie);
            addButton(2,"随她们便",legTamanisDaughtersRAEPYou);
            return;
         }
         TamanisDaughtersScene.tamaniPresent = false;
         outputText("在四处游荡时，你发现前方的道路被");
         outputText(Utils.num2Text(int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1204) / 4)) + " 只地精挡住了。你");
         if(get_player().get_weapon().isUnarmed())
         {
            outputText("准备好你的[weapon]");
         }
         else
         {
            outputText("拔出武器");
         }
         outputText("，环顾四周评估着你的选择。另一群小个子女人从灌木丛中钻了出来，将你团团围住，断绝了任何逃跑的机会。地精女人中体型最大的那个走上前来，她那 " + tdCup() + " 的乳房随着步伐晃动，身上绑着的拘束绳几乎包不住它们。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,59) == 0)
         {
            outputText("她大声喊道，[say:我们已经厌倦了吃剩饭，所以我们直接来找源头了。你要给我们想要的吗？][pg]");
            menu();
            addButton(0,"战斗",fightTamanisDaughters);
            addButton(1,"操她们",fuckYoDaughtersHomie);
            addButton(2,"随她们便",legTamanisDaughtersRAEPYou);
            addButton(3,"装傻",playDumbToTamanisDaughters);
         }
         else
         {
            outputText("她大声喊道，[say:我们回来要更多的奶油了！来吧，我们再做一次！]");
            outputText("[pg]看起来她们的字典里根本没有“不”这个字。你要怎么做？</i>");
            menu();
            addButton(0,"战斗",fightTamanisDaughters);
            addButton(1,"操她们",fuckYoDaughtersHomie);
            addButton(2,"随她们便",legTamanisDaughtersRAEPYou);
         }
      }
      
      public function combatWinAgainstDaughters() : void
      {
         var _g1:Combat;
         var _g:Combat;
         clearOutput();
         spriteSelect(SpriteDb.get_s_tamani_s_daughters());
         if(get_monster().get_HP() < 1)
         {
            outputText("看着你的女儿们倒下，无力继续战斗，你满意地笑了。");
            if(get_player().get_lust() >= 33 && get_player().cockTotal() > 0)
            {
               outputText("尽管受了伤，她们还是试图以尽可能淫荡的方式展示自己的身体。你仍然可以操她们，但事情可能会失控……");
               outputText("[pg]你要操她们吗？");
               addButton(0,"操她们",fuckYoDaughtersHomie);
               _g = get_combat();
               setSexLeaveButton(function():void
               {
                  _g.cleanupAfterCombat();
               });
            }
            else
            {
               get_combat().cleanupAfterCombat();
            }
            return;
         }
         outputText("看着你的女儿们瘫倒在地，陷入疯狂的群交，你满意地笑了。看来她们太分心了，无法继续战斗。她们正在上演一场精彩的表演……[pg]");
         dynStats(DynStat.Lust(5));
         if(get_player().get_lust() >= 33 && get_player().cockTotal() > 0)
         {
            outputText("你仍然可以操她们，但事情可能会失控……");
            outputText("[pg]你要操她们吗？");
            _g1 = get_combat();
            doYesNo(fuckYoDaughtersHomie,function():void
            {
               _g1.cleanupAfterCombat();
            });
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
   }
}

