package classes.scenes.areas.swamp
{
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.ConsumableLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class Rogar extends BaseContent
   {
      
      public function Rogar()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function waitForChunkyOrcLoe() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) == 0)
         {
            outputText("感觉过了好几个小时，罗加还是没有出现，但你决定继续等，并用仅有的一点布料把自己擦干净。终于，你听到了沉重而缓慢的脚步声，罗加带着笑容出现在视线中，手里拿着一个水桶和一条毛巾。他走近时放下了冒着热气的水桶。[say:来吧！]他咕哝着，把毛巾浸入水桶中。他用毛巾擦拭你的身体，帮你擦去泥巴，似乎没有意识到——或者也许并不介意——这个举动的亲密性。[pg]");
            if(get_player().lib < 50)
            {
               outputText("这个魁梧的兽人在给你清洗时出奇地温柔，就像[if (ischild) {你是他自己的|一个年幼的}]孩子一样。温暖的水和小心翼翼的触摸舒缓了你疲惫的肌肉。当水滴顺着你的身体滚落，污垢被冲洗到下面的水中时，你的皮肤上泛起了鸡皮疙瘩。你发现自己在这种待遇下放松地叹了口气。你低头看着罗加，嘴角勾起一抹微笑，他也回以一个满意的露齿笑。[pg]");
            }
            else
            {
               outputText("这个粗犷的兽人用温水给你擦身，不知为何让你感到兴奋。");
               if(get_player().hasVagina())
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "开始颤抖，当温水流过它的嘴唇时，在强壮双手的摩擦下因兴奋而变得湿润。你的胸膛起伏着，在他的触摸下放松下来，你的[nipples]在他的摩擦下变得坚挺。");
                  outputText("当你闻到罗加靠近时散发的汗水和麝香味时，甚至你的[feet]和手指都蜷缩起来，那野兽般的气味让你兴奋不已。");
               }
               else if(get_player().hasCock())
               {
                  outputText("" + get_player().SMultiCockDesc() + "苏醒过来，明显地表现出你有多享受这种擦拭，然后开始因欲望而流下口水。透过半闭的眼睛，你隐约看到罗加的露齿笑变成了一个饥渴的笑容。");
               }
               dynStats(DynStat.Lust(5 + get_player().lib / 20 + get_player().sens / 20));
               outputText("[pg]");
            }
            outputText("[say:干干净净。]罗加轻笑着，把毛巾扑通一声扔进水桶里。他看着你，脸上洋溢着对自己作品的自豪，胸膛挺得高高的。他又上下打量了你一番，你好奇的眼神只让他窃笑。[say:在这附近碰不到太多友善的人，但能有个" + get_player().mf("小伙子","姑娘") + "聊聊天也不错。]在口袋里尴尬地摸索了一会儿后，他掏出一张揉皱的纸递给你。[say:这是为了让你能找到我。]罗加咧嘴一笑，笑容一直咧到尖尖的耳朵。你展开纸，看到一张画得很粗糙的地图，模糊地说明了如何去罗加的小屋。你想知道画这张地图是不是他花了这么长时间的原因。[say:保重啊，听见没！]他大喊着，干脆地转身走开，在穿过他的自然栖息地时，越过肩膀向你挥手。你走回营地，想着是否应该再见他。[pg]");
            outputText("<b>你现在在沼泽中游荡时，偶尔能找到罗加的小屋了！</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,1);
            doNext(get_camp().returnToCampUseTwoHours);
         }
      }
      
      public function takeDatBroBrewFromDaBigMeanOlOrc() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,1);
         get_player().consumeItem(get_consumables().BROBREW);
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("伸手去拿罐子并坚持要他归还你的财产只会让事情变得更糟，你听到了罐子打开时发出的那种熟悉的嘶嘶声。[say: 等会儿你得从我肚子里拿了，]罗加咕哝着，把罐子凑到他张开的大嘴边准备喝。你采取了极端的措施，在罗加的腰间扭动你的手指！当你挠他痒痒时，他被酒呛到了，当他把液体咳在裸露的胸膛上时，他爆发出阵阵笑声。饮料从他的胸肌滴落，流下他的腹肌，让他浑身湿透，闻起来像麦芽饮料。[say: 停、停下！]他在咯咯的笑声中咆哮道。你发现自己被液体如何流过罗加的身体并勾勒出他的肌肉所吸引。当你有了一个主意时，你的脸上露出了微笑。[pg]");
         outputText("你猛地低下头，用舌头舔过罗加湿透的胸膛，沿着胸肌的曲线将他兽人的乳头舔得干干净净。罗加发出一声惊讶的喘息，当你滚烫的舌头舔过他的身体时，他咕哝了一声，随着冰凉的液体被卷起，温度交融在一起。当你的嘴在兽人的身体上游走时，你的手静静地放在罗加的身体两侧以保持平衡。气味很诱人；麝香和饮料的混合物，粘液、汗水和啤酒混合成一种散发着睾酮气味的肌肉男浆液。罗加站得很稳，尽管他的腿慢慢弯曲，他倒在了地板上。当你的舌头挑逗和品尝他时，他张开的双腿之间的凸起迅速膨胀。[say: 好吧，" + get_player().get_short() + "，你赢了。我不喝了……但</i>你<i>得喝。]他狡猾地咧嘴一笑，慢慢倾斜罐子，让细小的酒流顺着他起伏的胸膛流下。你移动着去接住每一滴，当你亲吻和吸吮他的肉体时，你的嘴不让任何一滴逃过你渴望的嘴唇。你的手从他的身体两侧垂下，抚摸着肿胀的凸起，手指弯曲在被困住的兽人肉棒上，隔着他短裤潮湿的布料，将手掌压在坚硬的肉棒上。伴随着一声尖锐的咕哝，罗加将一大波酒洒在自己身上。饮料冲刷过你的嘴，浸透了他腹股沟上的布料。潮湿的布料现在紧贴着他坚硬的兽人肉棒，在液体的重量下变得半透明且贴身。[say: 操，[name]……]罗加呻吟着，将他的胯部在你的手上摩擦。你把它移开，迅速用你的嘴代替。[pg]");
         outputText("你的脸压在罗加浸满啤酒的胯部，当你从布料上吸吮啤酒和先列腺液的混合物时，你的嘴唇包裹着肉棒。" + get_player().SMultiCockDesc() + "在你的衣服里已经变硬了，当你感觉到品尝涂满油的皮肤带来的强烈热量时。你在罗加被束缚的勃起上喘息，你的身体抽搐和痉挛，而[eachcock]因充血而肿胀。你的肌肉开始在皮肤下膨胀；发出一声低沉的咕哝，你感觉自己变得更有男子气概，因为你的头脑被欲望和……其他东西笼罩。它短暂地让你感到沮丧，尽管你很快就忘记了神秘的阴霾，拉开了兽人短裤的拉链。[say: 现在一滴也别浪费……]罗加发出呼噜声，他粗大的肉棒暴露在你面前。你立刻用嘴唇包裹住龟头，急切地吸吮着绿色的长度。罗加仰起头咆哮，他的手将更多的酒倒在他的肉棒上，浸湿你的嘴唇和他的睾丸。你暗自微笑，想着你有多喜欢肉棒。你的肉棒，其他男人的肉棒，你兄弟的肉棒。对你来说都无所谓，因为它们吸起来都那么爽。你的嘴松开，包裹住罗加丰满的阴囊，里面装满了沉甸甸的精液球。一边吸吮你兄弟睾丸上的酒，一边抚摸你自己的肉棒，感觉棒极了。其他一切对你来说都不重要了。你无法理解你的头脑和身体有多么混乱，当你抚摸你突然变得大得多的[cocks]时，你迷失在欲望的感觉中。当你的头在罗加粗壮的兽人肉棒上上下摆动时，你从你兄弟巨大的肉棒上喝着你的兄弟特酿。这就像是你能想到的最性感的事情。当然，不是同性恋。唯一能让它变得更好的事情是……当罗加的手抓住你的头，用力将他的臀部挺进你湿润的嘴里并发出嘶嘶声时，你失去了你容易脱轨的思路。[say: 张大嘴！]伴随着一声巨大的呻吟，他将他巨大的精液倾泻在你的喉咙里。你心里想，这太甜了，你像喝烈酒一样大口吞下浓稠的精液。你感觉到你兄弟的精液随着每一次射精填满你的肠道，喝下所有的精液并品尝着味道，当他射完的肉棒从你的嘴里滑落之前，你挤出了最后一滴。[pg]");
         outputText("站起身来，你用舌头舔去嘴唇上残留的精液和酒。你称赞罗加的精液，同时称他为“兄弟”。罗加看起来有点困惑，但给了你一个灿烂的笑容。[say: 你要是还有那些，就该带过来。我们会为这个场合“喝一杯”。]他用一个让你咧嘴笑的眨眼结束了他的句子。身体前倾，你把嘴唇贴在他的嘴唇上。他的舌头推着你的舌头，它们互相纠缠。你吻了一个男人，而且你喜欢这样。是的，同性恋。[pg]");
         outputText("离开罗加的公寓，你漫步在街道上。");
         if(!get_player().hasPerk(PerkLib.BroBody))
         {
            if(get_player().balls == 0)
            {
               get_player().balls = 2;
               get_player().ballSize = 3;
            }
            if(get_player().get_inte() > 35)
            {
               get_player().set_inte(35);
               dynStats(DynStat.Inte(-0.1));
            }
            if(get_player().lib < 50)
            {
               get_player().lib = 50;
               dynStats(DynStat.Lib(0.1));
            }
            outputText("[pg]");
            if(get_player().biggestTitSize() >= 1)
            {
               if(int(get_player().breastRows.length) > 1)
               {
                  while(int(get_player().breastRows.length) > 1)
                  {
                     get_player().removeBreastRow(int(get_player().breastRows.length) - 1,1);
                  }
               }
               get_player().breastRows[0].breastRating = 0;
               get_player().breastRows[0].nipplesPerBreast = 1;
               get_player().breastRows[0].fuckable = false;
               if(get_player().nippleLength > 0.5)
               {
                  get_player().nippleLength = 0.25;
               }
               get_player().breastRows[0].lactationMultiplier = 0;
            }
            if(get_player().hasCock())
            {
               if(get_player().cocks[0].cockLength < 10)
               {
                  if(get_player().cocks[0].cockThickness < 2.75)
                  {
                     get_player().cocks[0].cockThickness = 2.75;
                  }
                  _loc2_ = true;
                  get_player().cocks[0].cockLength = 10;
               }
               if(get_player().balls == 0)
               {
                  get_player().balls = 2;
                  get_player().ballSize = 3;
               }
            }
            if(get_player().hasVagina())
            {
               get_player().removeVagina(0,1);
            }
            if(get_player().get_femininity() > 0)
            {
               get_player().modFem(0,100);
            }
            if(get_player().tone < 100)
            {
               get_player().modTone(100,100);
            }
            if(get_player().thickness < 100)
            {
               get_player().modThickness(100,50);
            }
            if(get_player().get_inte() > 21)
            {
               get_player().set_inte(21);
            }
            dynStats(DynStat.Str(33),DynStat.Tou(33),DynStat.Inte(-1),DynStat.Lib(4),DynStat.Lust(40));
            _loc1_ = true;
            get_player().removePerk(PerkLib.Feeder);
         }
         if(_loc1_)
         {
            outputText("你意识到你看起来更强壮、更大、更性感了");
            if(_loc2_)
            {
               outputText("，你暗自微笑，因为你现在更大的天赋" + (get_player().armorDescript() != "gear" ? " 摩擦着不适合它的衣服" : " 在空气中自由晃动") + "");
            }
            outputText("。反正谁需要书本知识呢？书呆子。");
            get_player().createPerk(PerkLib.BroBrains,0,0,0,0);
            get_player().createPerk(PerkLib.BroBody,0,0,0,0);
            outputText("<b>(获得特质：兄弟体格！)\n");
            outputText("(获得特质：兄弟大脑！)</b>\n");
            if(get_player().hasPerk(PerkLib.Feeder))
            {
               outputText("<b>(失去特质：喂食者！)</b>\n");
               get_player().removePerk(PerkLib.Feeder);
            }
         }
         get_player().orgasm("Dick");
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sexyOrcPitsAreSexy() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你被罗加的腋窝所诱惑，倾身向前。当你的舌头陷入他那散发着麝香气味的汗液中心时，他嘴角的笑容变得更灿烂了。当你用舌头舔舐那湿润的橄榄色皮肤时，你能感觉到他肥大的兽人肉棒正流出先列腺液。[pg]");
         outputText("[say: 噢噢噢，你一点也不怕弄脏。这是你最棒的品质之一。] 罗加向后靠去，任由你尽情发挥，你用嘴彻底清洗了他的腋窝。你的嘴唇亲吻着他的皮肤，将你的唾液与汗水和雄性麝香混合在一起。你爱人身上那股强烈而压倒性的气味淹没了你的鼻子，当你用嘴品尝时，他那充满男子气概的刺激味道从你嘴里滴落。[pg]");
         outputText("你歪着头，将嘴唇贴在罗加的嘴唇上。他张开双唇迎接你，你的舌头与他的舌头共舞，他的手抚摸着你的腰侧，同时发出一声低沉而充满渴望的咆哮。他火热的嘴唇和舌头紧紧地贴着你的。他试图支配你的嘴，他的舌头与你的舌头纠缠，想把它推向他想要的地方。他的牙齿咬住你的下唇，发出一声低沉而占有欲极强的咆哮。[pg]");
         outputText("[say: 你的嘴和手这么熟练，想不想给我来个痛快的收尾？我一定会给你小费的。] 他调皮地眨了眨眼。你脸上带着微笑，稍微后退了一点，将你的" + get_player().multiCockDescriptLight() + "拖过他的肉棒。罗加突然发出一声呻吟，当他那根肥大的绿色肉棒摩擦着你的[cocks]时，他的呼吸变得急促起来。你脑海中浮现出一个新主意，你回敬着他的摩擦，让这个兽人男性在咕哝和喘息中陷入疯狂。他那沾满粘液和精油的身体疯狂地摩擦着你的身体。他变成了一团喘息和呻吟的肌肉和兽人肉体，在你身下扭动着，他的嘴张开，发出渴望的呻吟，绝望地渴望着你的触摸、你的温暖、你的身体。[pg]");
         outputText("在制造了一滩混合着你自己的兽人先列腺液后，这泥浆般的液体从罗加的肚子上滴落，你又开始向后移动。罗加那根跳动的兽人男子气概之柱就在你面前，你的双手让它高高挺立。当你用手套弄他那根肥大的肉棒时，你的兽人爱人喘不过气来，它们仍然沾满了油和粘液。等待你的奖励是大量的浓稠兽人先列腺液，滴落在你的手指和手掌上。滚烫的液体在他那颜色较深的龟头上结成珠状，你的嘴唇在爱人那根巨大的肉棒顶端印下一个吻。他那气味强烈的精液涂抹在你的嘴唇上，正好让你的舌头伸出来收集，而罗加则用充满情欲的眼睛注视着。[pg]");
         outputText("当一只手套弄着罗加巨大的肉棒时，你将嘴唇贴在他沉甸甸的阴囊上，你的舌头在他充满精液的球体上倾注着温暖湿滑的爱意。当你让他发狂时，你能听到他的身体在颤抖，你空闲的手抚摸着他起皱的后庭，同时用手和嘴取悦他的男子气概。伴随着湿润的吸溜声，你吸入了一大口你兽人爱人沉甸甸的阴囊，当你吸吮他的宝贝时，他麝香的刺激味道淹没了你的舌头。不久之后，你将一根手指滑入罗加的后庭，这根湿滑的手指扭动着穿过兽人的阻力，稍微撑开了紧致的肉壁。[pg]");
         outputText("[say: [name] 你真是……太棒了……] 当你用舌头沿着他那根肥大的绿色肉棒向上舔舐时，罗加几乎说不出话来。你毫不犹豫地用嘴唇包裹住他那渴望的龟头，流出的先列腺液在你的舌头上滚烫，你直接从源头饮下他的精液。你的兽人爱人躺在床上，双腿张开，他的下体赤裸着，任由你无情地挑逗触摸。很快，你的头就沿着罗加的兽人肉棒上下摆动，第二根手指滑入罗加的屁眼。你将嘴部的动作与头部的摆动同步。当你深喉这根兽人男子气概时，整根肉棒没入你的嘴里，你空闲的手按摩着罗加的蛋蛋，同时你强行将第三根手指插入罗加的后庭。[pg]");
         outputText("[say: 呃啊……] 罗加的脸绷得紧紧的，当你感觉到他沉重的蛋蛋收紧时，你就知道为什么了。你迅速将头向后拉，准备迎接你丰厚的小费。罗加在快感中咆哮出声，他那根肥大的肉棒将你嘴里射满了滚烫的兽人精液。浓稠的精液从他的龟头喷涌而出，飞溅并填满你的嘴，尽管你努力跟上，但还是从你的嘴唇溢出。当你吞下这奶油般的精液时，你能感觉到兽人的精液顺着你的下巴滴落。你继续吸吮着罗加巨大的兽人肉棒，直到它变软，清理掉附着在上面的浓稠精液，直到它疲软并耗尽。[pg]");
         outputText("[say: 过来你……] 罗加弯下腰，将你拉进他温暖的怀抱。[say: 你太擅长这个了……根本坚持不了多久。你让我的耐力相形见绌了，[name]，] 当你把他抱在怀里时，他发出咕噜声。当你靠在他温暖的身体上时，你轻笑并微笑着，你们俩躺在柔软的床单上。他似乎把你抱得很紧，即使你扭动也几乎不愿意放开你。你决定就和你的兽人爱人躺在一起闭目养神。罗加隆隆的鼾声让你眨了眨眼，然后窃笑起来。他这么容易激动，没过多久就睡着了，这太像他了。他的手臂紧紧地抱着你，依偎着你，仿佛你是他珍贵的毛绒玩具，这可能让他放松下来，直到他睡着……精油可能也有帮助。打了个哈欠，你决定自己也休息一下，闭上眼睛，在兽人爱人毯子般温暖的爱意包围下进入梦乡。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(2));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sexyChoices() : void
      {
         spriteSelect(SpriteDb.get_s_rogar());
         menu();
         addButton(0,"恶心",ewwwRogarIsGay);
         addButton(1,"不用了兄弟",noSlowBroIDontWantPokeSex);
         addButton(2,"舔干净",okayBroLetsHaveAGayCarwash);
      }
      
      public function rubdubWithDaOrcWithoutDucky() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("当你走到罗加身边时，他已经到了他的卧室，他的短裤掉在地板上。你打量着他橄榄绿色的皮肤，他的一切都赤裸裸地展现在你面前，包括他那根悬挂在沉甸甸的阴囊上的疲软的兽人肉棒。[pg]");
         outputText("[say:我买了这些精油，是为了在健身房待了这么长时间后放松肌肉。]你的兽人情人指了指他床头柜上的几瓶精油。[say:不如你来帮我一把……或者两把。]罗加对你咧嘴一笑，他的眉毛充满暗示地挑动着。你不需要更多的挑逗，你脱下你的[armor]，让它掉在地板上堆成一堆，然后走向瓶子。罗加咧嘴一笑，翻身趴在床上。[pg]");
         outputText("瓶子很容易就打开了，你在手上倒了大量的精油，甚至在罗加的背上倒了更多。感觉到冰凉的液体顺着他的脊椎流下，他倒吸了一口凉气。不过没过多久，你就用双手温暖了他的皮肤。你的手指张开，将精油涂抹在他潮湿的皮肤上。你爬上去跨坐在罗加的臀部上，坐在他肌肉发达的屁股上，开始揉搓精油。[pg]");
         outputText("罗加在你指尖下的皮肤感觉很僵硬，他的肌肉在抵抗你坚持不懈的触摸。慢慢地，你能感觉到它们放松下来，在你的手掌下变得平滑并变暖。没过多久，罗加就发出了你能听到的呼噜声。伴随着满意的低吼，罗加在你的身下短暂地挪动了一下，然后让你继续。[pg]");
         outputText("[say:就是那里。]当你用拇指揉捏他肩膀附近的某个部位时，罗加咕哝着。你用手指环住他宽阔的肩膀，轻轻地拉伸肌肉，使其远离颈部。罗加的头倒在床单上，嘴里发出一声呻吟。精油与兽人皮肤分泌的奇怪液体混合在一起，形成了一种奇妙的混合物。你能感觉到你的手变得如此温暖和舒缓，手部的肌肉也得到了放松和安慰。当你看着罗加闪闪发光的背部时，你想知道如果这么大面积的皮肤都涂满这种混合物会是什么感觉。[pg]");
         outputText("你从他的臀部下来去拿更多的精油，并让罗加翻个身。当你转过身时，你的兽人爱人已经仰面躺好了。你的目光扫过为你躺好的肌肉发达的爱人，他肌肉发达的四肢因期待而隆起，他肿胀的阴茎在你眼前变得更大。当你把精油倒在他的胸膛上时，他对着你咧嘴一笑，冰凉的液体顺着他的身体中心滴落，让他打了个寒颤。清澈的精油在他的胸肌之间爬行，顺着他的腹毛向下，滴入他的肚脐，然后填满他腹肌的缝隙。[pg]");
         outputText("你毫不犹豫地再次跨坐在兽人的臀部上，他肿胀的兽人阴茎摩擦着你" + get_player().buttDescript() + "裸露的皮肤。你的手开始在罗加的身体上涂抹令人放松的精油。当你按摩他隆起的胸肌，用手指挑逗他颜色变深的乳头时，兽人用一种色眯眯的眼神盯着你。你咧嘴一笑，感觉到罗加粗壮的阴茎更加紧贴着你的" + get_player().buttDescript() + "，而他的胸膛在你的手下隆隆作响。[pg]");
         outputText("[say:你很擅长这个，[name]，你以前做过吗？]当你在他的腹肌上按摩，用指尖描摹每一个缝隙时，罗加发出满足的呼噜声，精油在你爱人的身体上闪闪发光。罗加的臀部轻轻地挺动，用他跳动的阴茎轻撞你的" + get_player().buttDescript() + "，伴随着一声轻笑，他的嘴角勾起一抹娇羞的微笑。你看着罗加把手臂伸向脑后，把头枕在手上，露出他的腋下和腋窝。[pg]");
         menu();
         addButton(0,"玩弄腋窝",sexyOrcPitsAreSexy);
         addButton(1,"无视腋下",lickSomeMoreOrcButNoPits);
      }
      
      public function rogarThirdPhase() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         if(get_player().biggestTitSize() >= 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,409) == 0)
            {
               outputText("根据斗篷被撑得多么有压迫感来判断这位顾客的身材，他或她显然肌肉非常发达。你看到一只绿色的手伸向一个罐子，一阵认出的火花击中了你。你完全不知道该如何打破僵局，但还是扯了扯斗篷的下摆。那个人影转向你，迎接你的是沼泽里的兽人罗加绿色的、露齿的微笑！[say: 你好，[name]！我很惊讶在这里看到你……][pg]");
               unlockCodexEntry(2050,false,true);
               outputText("你热情地向他打招呼，但他似乎对你有些紧张。[say: 那个……听你讲了那么多冒险经历后，我，呃，觉得我也该自己上路了。所以你就在这儿找到我了。很高兴再次见到你，但我得在走之前把这杯喝完。] 说完，他仰起头把罐子里的东西一饮而尽，向你露出他标志性的笑容，然后离开了。他似乎对你有些不安。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,409,1);
            }
            else
            {
               outputText("兽人罗加又在这里喝酒了，但当你和他目光交汇时，他脸上闪过一丝痛苦的表情。很明显，他现在并不想和你说话，但以他的性格，他太有礼貌了，说不出口。你的热情瞬间被浇灭，原本想好的开场白也抛到了九霄云外——你只能无奈地看了他一眼作为回应。他给了你一个勉强的微笑，然后继续喝他的酒。[pg]");
            }
            doNext(get_telAdre().barTelAdre);
         }
         else
         {
            outputText("花了几秒钟打量了一下这件熟悉的斗篷布料后，你的嘴角泛起了一丝微笑。你悄悄地走上前去，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,409) >= 1)
            {
               outputText("你拍了拍他的肩膀。他转过身来，然后露出了愉快的微笑。[say: 哟，你好。请问你是哪位？] 你一时有些困惑，但很快就想起来，你现在的样子和以前见面时大不相同了；你微微鞠了一躬，重新介绍了一下自己。[say: 哇哦。[name]，你看起来和以前完全不一样了！] 你点点头，因为自己的变化引起了这么多关注而感到有些不好意思，并指出这个世界会对人产生一些不寻常的影响。他急切地点点头。[say: 哎呀，你看起来棒极了。要不要坐下来陪我聊会儿天？][pg]");
            }
            else if(get_player().get_tallness() >= 60)
            {
               outputText("你小心翼翼地用双臂环住他的头，用手蒙住他的眼睛。你调皮地咯咯笑着，低声让他[say: 猜猜我是谁。] 一个熟悉的声音低吼了一声，但当兽人的手覆在你的手上时，他很快就放松了下来。[say: 见鬼，[name]，别这么偷偷摸摸地吓唬人。] 罗加低沉的声音传入你的耳中，他转过身来，脸上带着灿烂的笑容。[pg]");
            }
            else
            {
               outputText("你轻轻地扯了扯他身上的斗篷，大声说，看来你缝补的手艺还不错，斗篷撑得挺好的。他的背猛地挺直了，传来一阵低沉的窃笑声。[say: 你干得漂亮极了，[name]。我一直在等你呢。] 罗加转过身，对你咧嘴一笑。[pg]");
            }
            unlockCodexEntry(2050,false,true);
            outputText("你也对他报以微笑，在罗加旁边坐下。[say: 一路跋涉到这里可真不容易，但我估计这很值得。] 他那低沉、熟悉的声音抚慰着你的心灵。罗加从吧台上抓起罐子，大口喝了起来，然后大声呼出一口气，把罐子放在吧台上，发出一声闷响。[say: 要不是有这件斗篷，我早就被那太阳晒干了。] 他转过头，从兜帽下露出一个笑容。你小心翼翼地伸出手想把兜帽拉开，想看看他的脸。罗加的脸涨成了石灰绿，他转过头去，用长满老茧的手指挠了挠脸颊。");
            if(get_player().skin.tone == "green")
            {
               outputText("[say: 嘿……你有没有遇到过有人突然跑过来，让你“Waaagh！”？] 他小声嘟囔着。你困惑地看着他。兽人满不在乎地笑着化解了你的困惑。[say: 没什么，没什么。]");
            }
            outputText("[pg]");
            outputText("[say: 自从我到了这里，一切都好极了，] 他继续说道，生硬地转移了话题。[say: 我有了自己的住处，一直在拼命工作……更别提健身房了。我不在这里喝酒的时候，就会去那里锻炼。] 他把斗篷往后一撩，开始向你展示他的肌肉，对自己的身材充满自信。当他展示肌肉时，很明显他比在沼泽里时更强壮了。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,408) == 0)
            {
               outputText("你们又聊了一会儿才分开。罗加让你保证下次再来陪他喝酒，然后带着他标志性的笑容向你挥手告别。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,4);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,409,0);
               doNext(get_camp().returnToCampUseOneHour);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,408) == 1)
            {
               outputText("罗加满意地呼出一口气，放松了身体，又从罐子里喝了一口。[say: 自从我认识你以来，你对我一直很好，" + get_player().get_short() + "。我只帮了你一次忙，从那以后你就一直是个真正的朋友。] 罗加的语气变得更低沉、更严肃，长满老茧的手指在潮湿的罐子上摩擦着。你把手臂靠在吧台抛光的木头上，静静地听着。[say: 你对我来说很特别，] 他小声嘟囔着，声音刚好能让你听到。你温暖地笑了笑，把手放在他的手臂上，哄他转过头来看看你。[say: 给，我给你带了点东西。] 罗加在裤兜里掏了掏，拿出一个锡罐。他把你的手拉近，把罐子放在你的手掌里，对你咧嘴大笑。[say: 这就是我现在喝的。] 他敲了敲他的罐子。[say: 我最喜欢的饮料之一。谢谢你，[name]。你随时都可以来找我喝酒。] 你们俩在吧台度过了一段时光，一边喝酒一边大笑，直到把杯子里的酒喝光。最后你们分道扬镳，你漫步回到了城里。[pg]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,4);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,409,0);
               get_inventory().takeItem(get_consumables().BROBREW,get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("当你意识到他带兜帽的斗篷下只穿着那条破烂的短裤时，你的心怦怦直跳，你的目光在他展示肌肉时扫过他的身体。[say: 你和我什么时候去澡堂看看怎么样？] 罗加羞涩地问道，放松了身体，又喝了一口酒。[say: 自从我认识你以来，你对我一直很好，[name]。我只帮了你一次忙，从那以后你就一直是个真正的朋友。] 罗加的语气变得更低沉、更严肃，长满老茧的手指在潮湿的罐子上摩擦着。你把手臂靠在吧台抛光的木头上，静静地听着。[say: 你对我来说很特别，] 他小声嘟囔着，声音刚好能让你听到。你温暖地笑了笑，把手放在他的手臂上，哄他转过头来看看你。他的舌头滑过嘴唇，用诱惑的眼神看着你，手伸向了你的双腿之间。");
               if(get_player().get_gender() == 2 || get_player().get_gender() == 0)
               {
                  outputText("他的手停在了你光秃秃的阴阜上，罗加的眼睛睁得大大的。[say: 什、什么……这里什么都没有！] 你红着脸点了点头。他张着嘴愣了好一会儿，然后才控制住自己。[say: 那个……我，呃，很高兴再次见到你……] 他结结巴巴地说。[say: 嘿，我肯定你还有事要做，所以我就不耽误你了。] 当你试图抗议时，他一口气喝光了酒，故意把罐子重重地、吵闹地砸在吧台上。他向你点了点头，把斗篷拉过头顶，离开了酒吧。显然，这对他来说是个不小的打击。你想知道他以后会不会躲着你……");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,410,1);
                  doNext(get_camp().returnToCampUseOneHour);
               }
               else
               {
                  outputText("你的" + get_player().SMultiCockDesc() + "在他探索时得到了他的爱抚，被刺激得微微勃起。[say: [name]，] 他咕哝着。[say: 我希望我能多见见你。] 罗加打破了接触，仰起头喝光了剩下的酒，而你");
                  if(get_player().cor < 50)
                  {
                     outputText("脸红了");
                  }
                  else
                  {
                     outputText("幻想着那双强壮的手抚摸你身体的每一个部位");
                  }
                  outputText("。我不工作或者不锻炼的时候就会在这里喝酒。我会等你的。[sayend] 他向你暗示性地垂下眼睑，然后站起身来；当他离开酒吧时，你傻傻地笑着，看着他离去，脸颊上泛起红晕");
                  if(get_player().hasLongTail() && get_player().hasTailInsteadOfLegs())
                  {
                     outputText("，你感觉到你的尾巴兴奋地快速甩动着");
                  }
                  outputText("。[pg]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,4);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,409,0);
                  dynStats(DynStat.Lust(30));
                  doNext(get_camp().returnToCampUseOneHour);
               }
            }
         }
      }
      
      public function rogarPhaseFour() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         if(get_player().biggestTitSize() >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,409) == 0)
         {
            outputText("兽人罗加又在酒吧喝酒了，他那半空的易拉罐旁边放着两个被捏扁的空罐子。酒保烦躁地瞥了它们一眼，似乎想把它们扔掉，但又不敢从这个魁梧的兽人手里拿走，直到他喝完或者离开。你在他旁边坐下时扯了扯他的斗篷，他转过头，对你露出一个露齿的微笑。当他打量你时，那个微笑渐渐变成了皱眉，目光停留在你脸上那充满女人味的轮廓上");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("和你的[chest]上");
            }
            outputText("。 [say: 哎呀，你看起来……不一样了。尝过当地的食物了吧，嗯？]你谨慎地表示同意，他向酒保招手，给你买了一杯酒。[say: 我只是出于礼貌，因为我们是朋友，]兽人试探着说。[say: 你可以下次再还我。]你点点头，抿了一口酒，和他矜持地聊了一会儿，然后就离开了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,409,1);
            unlockCodexEntry(2050);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(get_player().biggestTitSize() >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,409) == 1)
         {
            outputText("兽人罗加又在这里喝酒了，但当你和他目光交汇时，他打量着你的身形，脸上闪过一丝痛苦的表情。很明显，他现在并不想和你说话，但了解他的人都知道，他太有礼貌了，不会直接说出来。");
            addNextButton("调情",rogarBarFlirt).hint("你对眼前这个高大强壮的男人相当有感觉。");
            addNextButton("闲聊",rogarBarChat).hint("打破沉默，放松一下。");
            addNextButton("离开",rogarLeaveBar).hint("暂时让他一个人待着吧。");
         }
         else
         {
            outputText("罗加正仰头喝酒，看到你时，向你招了招手。[saystart]啊，很高兴见到你，[name]！");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,409) == 1)
            {
               outputText("你今天看起来好多了；你锻炼过了吗？[sayend] 你对他的赞美报以微笑，然后");
            }
            else
            {
               outputText("[sayend] 你");
            }
            outputText("向酒保招手，再来一轮。[say: 那么，]当你们喝完酒，酒保走远后，他开始说道，[say: 我在想你晚点想不想去我家玩？虽然不是什么好地方，但比这里……私密得多。]他微微脸红，对你挑了挑眉，然后把手滑向你的腹股沟。");
            if(get_player().get_gender() == 2 || get_player().get_gender() == 0)
            {
               outputText("他的手毫无阻碍地摸到了中间，罗加的脸更红了。[say: 呃……算了，]他嘟囔着。[say: 我不是故意对你不规矩的，小姐。]他向你点点头，在你从惊讶中恢复过来之前迅速离开了。");
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("" + get_player().SMultiCockDesc() + " 在他强有力的触摸下颤抖着，他加大了力度，意味深长地看着你的眼睛。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,408) == 1)
               {
                  outputText("[say: 我知道你可能从来没想过和我这样的家伙一起出去玩，但是……我今晚真的很需要人陪。]");
               }
               outputText("他显然有心情找点乐子；你想回他家做点什么吗？");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,409,0);
               rogarFuckMenu();
               dynStats(DynStat.Lust(10));
            }
         }
      }
      
      public function rogarLeaveBar() : void
      {
         clearOutput();
         outputText("经过一番轻松随意的交谈后，你让这个魁梧的男人自己待着。罗加给了你一个虚弱的微笑，然后继续喝酒。");
         doNext(get_telAdre().barTelAdre);
      }
      
      public function rogarIsDumb() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你微笑着放弃了罐子，狡黠地告诉罗加他可以拿走，然后无辜地把手背在身后。他眯起眼睛，然后把目光转移到罐子上。经过仔细检查，他把罐子推向你。[say: 我不要。你这狡猾的家伙，肯定在里面放了傻妞利口酒之类的东西。][pg]");
         outputText("嬉闹的气氛被打破了，你们闲逛了一会儿，吹了吹牛，然后就回去了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rogarFuckMenu() : void
      {
         spriteSelect(SpriteDb.get_s_rogar());
         var _loc1_:Boolean = get_player().hasCock();
         menu();
         addButton(0,"被肛",loseButtGinity).disableIf(!_loc1_);
         addButton(1,"肛他",fuckRogarsButtPussyBoyCuntManMoundSissySlitQueerQuim).disableIf(!_loc1_);
         addButton(2,"摩擦",frotWithRogar).disableIf(!_loc1_);
         addButton(3,"兄弟共饮",brobrobrobro).disableIf(!get_player().hasItem(get_consumables().BROBREW));
         addButton(4,"被绑着肛",kinkyWithDaOrc).disableIf(!_loc1_);
         addButton(5,"兽人按摩",rubdubWithDaOrcWithoutDucky).disableIf(!_loc1_);
         addButton(6,"不用了，谢谢",noTHanksRogarIAintGayDudeIjustLickedThatMudToBeNice);
      }
      
      public function rogarBarFlirtTrickHimPt2() : void
      {
         clearOutput();
         var _loc1_:Boolean = true;
         var _loc2_:Boolean = false;
         if(get_player().hasVagina())
         {
            _loc1_ = get_player().hasVirginVagina();
            _loc2_ = get_player().cuntChangeNoDisplay(25);
         }
         else
         {
            _loc1_ = get_player().buttVirgin();
            _loc2_ = get_player().buttChangeNoDisplay(25);
         }
         registerTag("didStretch",TagFun_Impl_.fromBool(_loc2_));
         registerTag("wasVirgin",TagFun_Impl_.fromBool(_loc1_));
         outputText("尽管有他醉醺醺的“指路”，你还是设法找到了他的公寓。即使他有着如此强大的力量和身材，他们提供给他的住所，你也只能假设和这个城市里任何一个有贡献的成员得到的一样多，但当你帮助罗加跌跌撞撞地躺到床上时，这里似乎还算舒适。");
         outputText("[pg]兽人翻身仰面躺下，伸展四肢放松，然后抬起头看到你也在“放松”。[say: 你在干什么？]他问道。你打量着他，毫不掩饰脸上的欲望。[if (isnaked) {我|你开始一点一点地脱掉身上的衣物；如}]果他不能通过[if (hasCock) {你那明目张胆的勃起[if (multicock) {}]|[if (hasVagina) {你下唇的闪烁|你的动作}]}]看出接下来会发生什么，那他比你想象的还要醉。[say: 我-我得睡觉了，]当你爬上床垫时，他紧张地说。他的肌肉轮廓在你的指尖下感觉诱人地清晰，乞求着从罗加朴素的衣服下暴露出来。[say: 嘿，停下！别把我扒光，]他徒劳地抗议着。");
         outputText("[pg]布料很容易就被脱掉了。他那滚烫的橄榄绿肌肤异常紧实，却又柔软，你满心欢喜地抚摸着它，因为你把这个轮廓分明的男人掌握在手中，他在你熟练的按摩下融化了。虽然他抽搐着、扭动着，但他的短裤却因为阴茎勃起充血的压力而变得紧绷。[if (!isfeminine) {他不知道什么是真正的男人，竟然拒绝了你|他不是同性恋。没有哪个男人[if (wasVirgin) {在像你这样的美人面前|在体验过你的手段之后}]还能保持同性恋}]。沉浸在胜利的喜悦中，你褪下他的短裤，几乎带着一丝敬畏地握住那根粗壮的、充满男子气概的肉棒，然后扑上去亲吻。兽人不由自主地呻吟起来。");
         outputText("[pg][say: 停下，[name]，滚开，我……]你没有等他想起他还想说什么，而是向他强调了他那正在膨胀的勃起。[say: 这只是因为你在摸我之类的，这不是我的选择。]你张开嘴，吞下了肉棒的一部分，向他展示他的身体对你的需求，这个动作引出了他的一声呻吟。味道有点油腻，他龟头柔软的边缘似乎紧贴着你的喉咙，好像要把它堵住。它越来越深，他的[if (silly) {大鸟|肉棒}]很快就到达了最深处。你[tongue]的蠕动让罗加舒服得发抖，但你不会把整个晚上都花在用你的口交技巧给他留下深刻印象上。");
         outputText("[pg]把自己拉起来后，你向床的更上方爬去，将你的[vagORass]对准他那根光滑、润滑的鸡巴。[if (istaur) {虽然你的下半身很大，但当你停在他身上时，兽人毫不费力地支撑住了它|[if (isdrider) {如果不是因为兽人对沼泽很熟悉，你那蜘蛛身体的构造可能会让人感到害怕，或者也许他天生的恐惧只是无法阻止他的下半身对降临在他身上的性刺激做出反应|[if (tailLeg) {[if (!hasVagina) {你不想失去目睹兽人在不情愿地插入你时脸上的表情的机会，你将你那[if (isnaga) {蛇形|[if (ismer) {鱼尾|细长}]}]的身体滑入并缠绕在他的肚子上，当你盯着这个[if (silly) {基佬|假正经}]不安的表情时，让它避开你那急切的屁股|你那[if (isnaga) {蛇形|[if (ismer) {鱼尾|细长}]}]的身体平躺在他身上，你调皮地将末端卷在[if ((isNaga && height < 66) || (height < 72)) {他的其中一条}]腿上}]|当你的大腿压在他的阴茎上时，这让你更加期待，提醒着你它的粗壮}]}]}]。你用一种持久的、渴望的目光盯着你的猎物，看着他那全神贯注的痛苦表情，盯着[if (istaur) {他所能看到的}]你们即将结合的地方。");
         outputText("[pg][say: 这是一场噩梦，]他难以置信地含糊不清地说。他痛苦地闭上眼睛，头向后仰，做好了准备。");
         outputText("[pg]几个令人痛苦的悬念时刻过去了。[say: 我醒了吗？]他睁开眼睛问道。当他再次向下看时，你终于放低了你的[if (istaur) {侧腹|[hips]}]，发出一声满足的喘息，因为那根粗壮的兽人鸡巴[if (hasVagina) {[if (wasVirgin) {劈开了你那特别的、未受污染的嘴唇，撑开了里面的血肉，以一种变态的方式不可挽回地改变了它[if (haslostvirginity) {，就像它之前的那个一样}]。|[if (didStretch) {突破了你身体所能承受的极限。你那可怜的洞穴被剥夺了这个领域里天赋异禀的野兽太久了，让你几乎无法接受他的工具；然而，这种压力增加了它自己那种幸福的成就感|填满了你那饥渴的深处[if (vaginallooseness >= 2) {，尽管与你能承受的相比，它短得几乎有些可怜。尽管他只是在正常人类的尺度上显得巨大，但在他反抗之后，你还是忍不住享受它|几乎完美地填满了，就好像你已经为他的男子气概塑造好了一样}]。}]}]罗加不由自主地在快感中呻吟，无法否认一个[if (!isfeminine) {小穴|[if (isUnderage) {女孩|女人}]}]是多么适合这个|[if (wasVirgin) {痛苦地挤进你那缺乏经验的屁股里——[b:牺牲你的童贞]是值得的，只是为了报复他没有像你应得的那样渴望你|[if (didStretch) {迫使你的洞穴扩张以容纳他。当你被填满到超出你身体准备好的程度时，这种狂喜席卷了你，当你沉下去时，把他吃得更深的压力让你感到头晕目眩|逐渐滑入你的体内，让你充满热量[if (anallooseness >= 2) {和对更大东西的渴望——虽然如果你不承认他早些时候的拒绝让这个战利品比某个随机怪物的巨大工具更甜美，那你就是在说谎|。他的工具简直就是为了完美填满你的屁股而量身定制的}]}]}]。罗加不由自主地在快感中呻吟，无法否认你就是他一直以来在不知不觉中渴望的}]；他对男人的品味仅仅是因为缺乏了解。兽人的肉棒在你[if (!istaur) {的肚子里}]抽动，给你的心脏带来一阵令人眼花缭乱的震颤。当你让现实沉淀下来时，又是一阵沉默。");
         outputText("[pg][say: 这不对，]罗加气喘吁吁地说。[say: 把你的朋友灌醉，然后……]");
         outputText("[pg]你站起身，让他阴茎除了龟头以外的所有部分再次感受到新鲜空气，然后慢慢地只绕着龟头旋转你的入口，享受着穿透他思绪的喘息和颤抖。你轻轻地再次压下，只包裹住了一点点。他无法抗拒你；你理应听到他乞求你继续下去。");
         outputText("[pg]你身下肌肉发达的男人喘着粗气。[say: 我不想这样——]你猛地坐下，直接将他吞没到底。他宽大的手按在你的[chest]上，无力地推拒着，但因为喝得太醉，根本使不上劲。罗加试图坐起来，你却一把将他推回床上，利用他烂醉如泥的状态，毫不费力地保持在上位。[say: 停下，我——]你突然的动作打断了他，猛地挺动你的[if (istaur) {rear }]臀部，快速而浅浅地操他，然后放慢速度，开始画圈研磨[if (hasVagina) {，这让你的阴蒂在狂喜中颤抖}]。这个健身狂魔的每一寸肉棒现在都属于你，他应该心存感激。如果他连你提供的绝妙性爱都承受不了，那他简直太弱了——弱得丢人！你一边骑乘他一边这么告诉他，看着他脸上的表情无法掩饰挫败和羞耻。");
         outputText("[pg][say: 好吧！]他咆哮道。他的骨盆用尽全力向上挺动，猛烈地撞击[if (hasVagina) {你的子宫颈，猝不及防。你的大脑仿佛瞬间短路，然后你瘫倒在他强壮的身体上[if (sensitivity > 33) {，度过了一次猛烈而愉悦的高潮}]，随后才恢复了镇定|[if (sensitivity > 50) {，让你越过地平线，迎来了一次令人感激的高潮，尽管}]这股力量几乎要让你的[ass]瘀伤[if (hasgooskin) {，如果不是因为你那富有弹性、黏糊糊的体质，你肯定会受伤}]}]。虽然这可能对你的身体造成了冲击，但之后什么也没发生。罗加的腹肌紧绷着，无力地挣扎着。[say: 我……输给你了，伙计。]");
         outputText("[pg]疲惫而挫败的兽人已经向你的情色技巧屈服了。你得意洋洋地继续骑乘他；然而，在他头晕目眩、醉醺醺的状态下，他变得更像是一个自慰辅助工具，而不是一个真正的性伴侣。短暂的咕哝声在空气中回荡，温暖的液体喷洒在你的体内，罗加就这样昏睡了过去。[if ((hasVagina and sensitivity < 34) or (!hasVagina and sensitivity < 51)) {因为没有高潮而感到失望|仅仅一次粗暴而突然的高潮让你感到不满足}]，你继续在这个活体假阳具上弹跳，至少在他抽搐的脸上找到了快感，因为他那无疑敏感的肉棒把你的内脏摩擦得破烂不堪。尽管如此，你寻求释放的努力还是落空了：罗加的肉棒在你的深处变软并萎缩了。几分钟安静地过去，你休息着。");
         outputText("[pg]当你终于从那个傻大个身上爬下来时，你发现自己对这次经历非常满意。当他晚上不知道喝了多少杯酒时，他可能不是一个伟大的情人，但一个更大的男人身上的一根大鸡巴很难说是在浪费时间。当然，如果他醒来时还能记得那个晚上的话，他很难告诉任何人他不喜欢它。[if (isnaked) {在这里完成了你的工作，你大摇大摆地走出公寓，自由地展示你的身体，让所有人都希望他们也能被认为有资格体验它|准备回家，你收拾好你的东西，穿好衣服，然后走出公寓，迎着那些还没有幸运到让你认为他们有资格的人的淫荡目光}]。");
         dynStats(DynStat.Cor(10));
         get_player().orgasm("VaginalAnal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rogarBarFlirtTrickHim() : void
      {
         clearOutput();
         outputText("你绝不会试图去强迫一个不愿意的人，或者至少在罗加看来，在你安抚了他的担忧并回到更随意的讨论之后，他是这么认为的。你在脑海中盘算着，考虑试着把他灌醉，然而他庞大的身躯会让你在时间和金钱上付出巨大的代价。你调整了姿势，向兽人靠近，采取了诱惑的策略，近到足以在他喋喋不休时闻到他呼吸中的啤酒味。");
         outputText("[pg][say: 健身房的小伙子们——啊哈哈——他们知道没人能打败兽人！]罗加吹嘘道。当他看着你的[eyes]时，他安静了下来。在你那充满诱惑的目光下，他的神经紧绷起来，他很快就把剩下的酒一饮而尽，以此来压制这种感觉。[say: 再来一杯，]他对酒保说。[say: [Name]，你靠得有点近了。]");
         outputText("[pg]你无视了他的话，并称赞他的口才；你被他积极的态度和轻松的故事迷住了。虽然他似乎有些不确定，但兽人还是拿起了他的下一杯酒，猛灌了一口，然后继续交谈。也许单凭你的魅力就能让他免费喝醉。他仅仅因为你不是[if (!isfeminine) {他心目中的}]男人就拒绝你，这绝对是他罪有应得。而看到这座肌肉山因为你的魅力而焦虑不安地扭动，你所获得的满足感也是极其美妙的。");
         outputText("[pg]在聊天的过程中，罗加醉得越厉害，你的举动就越肆无忌惮，时间也过得比你预期的要快。这个口齿不清的男人反过来靠在[i:你]身上，带着迄今为止最浓烈的啤酒味靠近你。[say: 必须在这里停下，不然我明天就没法去上班了。得……去干点活或者什么的……]在冒着被这个大笨蛋压扁的风险之前，你站起来把他从凳子上拉下来，解释说一个好朋友是不会让他醉倒在酒吧里的。罗加发出一声高兴的笑声，并在你的背上调皮地拍了一下。[say: 你真是个好朋友！]");
         doNext(rogarBarFlirtTrickHimPt2);
      }
      
      public function rogarBarFlirtDropIt() : void
      {
         clearOutput();
         outputText("再逼问下去也没什么好处，所以你让步了，并接受了你不符合他生理欲望的事实。罗加长舒了一口气，看到你很好地接受了他的话，他的紧张感也随之消失。如果没别的，你们俩作为普通朋友相处得还算融洽。");
         doNext(get_telAdre().barTelAdre);
      }
      
      public function rogarBarFlirt() : void
      {
         clearOutput();
         outputText("不言而喻，一个高大健壮的男人能够引起你的兴趣，但他明显的惶恐不安暗示着直接的搭讪可能会显得过于强势。尽管如此，当你从最初的闲聊转向一些哪怕只是轻微的色情话题时，这[if (metric) {两米多|七英尺左右}]高的肌肉男明显地退缩了。");
         outputText("[pg]罗加尴尬地咳了一声。[say: 我真的不感兴趣，姑娘。]他微微瘫倒，低着头，但随后又把目光转向你。[say: 不-不是你有什么问题——我是说，不是你这个人的问题，只是[b:你]是什么的问题。我……]兽人的声音渐渐变小，他的眼睛转动着，似乎在寻找合适的词语。[say: 我喜欢男人。]");
         addNextButton("放弃",rogarBarFlirtDropIt).hint("没必要强求。");
         addNextButton("欺骗他",rogarBarFlirtTrickHim).hint("不管怎样，他都会把那根鸡巴给你的。").disableIf(get_player().cor < 35,"你需要更加堕落");
      }
      
      public function rogarBarChat() : void
      {
         clearOutput();
         outputText("你没有被他明显的不适感所吓倒，而是走到这个魁梧的男人身边，开始轻松的交谈。很快，罗加就放松了紧张的情绪，并以同样的方式回应了你。[if (ischild) {[say: 你确定你被允许进这里吗，还是说你比看起来要老？]兽人笑着说，然后在座位上尴尬地动了动。他低声嘟囔着，[say: 只希望我不会因为表现得友好而招来什么怀疑的目光。]|[say: 没必要来查我的岗，]兽人用愉快的语气说。[say: 但能有个朋友惦记着我，感觉真好！]}]经过简短而愉快的闲聊后，你们分道扬镳了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,410,1);
         doNext(get_telAdre().barTelAdre);
      }
      
      public function okayBroLetsHaveAGayCarwash() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你急忙从房间角落拿来水桶和毛巾。你毫不耽搁地将毛巾浸入清澈的水中，然后在兽人的身体上擦拭。罗加完全向后靠去，躺在床上。他向上伸出双臂，将它们塞在脑后，双手就像脑下的大枕头，他目不转睛地看着你。罗加橄榄色的皮肤上结满了沼泽的污垢，但当你用湿毛巾拖过他的身体时，污垢很容易就被洗掉了。当你在他的腹肌上擦拭时，他的胸腔里发出低沉、满足的呼噜声。在他轮廓分明的六块腹肌的凹陷处和胸肌的乳沟之间，你可以看到清澈的水珠在聚集。你咽了口唾沫，克制住想要倾身向前，舔舐他现在干净的皮肤上滴落的水珠的诱惑。[say: 小心点，别碰我的皮肤太多了……]罗加在你工作时低声说道。你困惑地眨了眨眼，问为什么，你的手不由自主地用毛巾摩擦着他的一块胸肌。他的胸部在你彻底的抚摸下明显地紧绷和弯曲。[say: 你真的没见过多少沼泽里的人。水里有些东西，如果你像我一样在里面待太久，它就会开始改变你的身体。你的皮肤会开始渗出这种粘液。这东西很强。]你开始在罗加的手臂上擦拭，更加注意你触摸他的地方，尽管你腹股沟处坚硬的突起让你很难集中注意力在除了触摸他之外的任何事情上。[say: 别担心。这不危险。只是……嗯，实际上，我让你尝尝怎么样？]罗加低头看着你，他蓝色的眼睛毫无疑问地充满掠夺性。[pg]");
         outputText("你放下毛巾，罗加干净、光滑的身体呈现在你面前。当你看着水滴滑过他雕塑般的身体时，你低下头想看得更清楚些。近距离看，可以看到他的毛孔在皮肤上分泌出一种油状液体。你舔了舔嘴唇，在他绿色的皮肤上敷衍地吻了一下。他的体味很重，当你的舌头滑过他的肉体，品尝着充满信息素的油时，只会让你更加兴奋。当热量冲击你的嘴巴时，你睁大了眼睛，让你喘着粗气；你感觉皮肤刺痛，汗毛直立。很快，它就冲击了你的下半身，你能感觉到自己变得痛苦地兴奋" + (get_player().armorDescript() != "gear" ? "在你的衣服下面" : "") + "。罗加给了你一个会意的笑容。[say: 继续，这种感觉还有很多。]他弓起背，让他的肚子更多地擦过你的[face]，粘液粘在你的皮肤上，导致它因发热而变红。你发出一声呻吟，感受到了它的效果，并因全身感觉的增加而无法控制地颤抖。所有这一切都在你内心深处激起了一种饥渴，你倾身用舌头舔舐他的腹肌，引得上面的兽人发出低沉的呻吟。你的嘴唇抚摸并亲吻着他光滑的皮肤，你的舌头描摹着每一块抽动的肌肉。你不知道界限，舌头在每一个坚硬的凸起之间挖掘。你的手伸过去按压他的皮肤，当你摩擦他健壮的身体时，感受着指尖下的热量。唾液在你的舌头留下的痕迹中在他的皮肤上闪闪发光，沿着他的核心滑向他的胸肌。你饥渴地舔舐着他弯曲的乳房之间，双手捧着每一个，在你的手指下按摩它们。当你亲吻着每一块抽动的肌肉时，罗加用低沉、喉音的呻吟催促你。你吸吮并舔舐着他的乳头，导致它在你的关注下变硬。[say: 操——操，是的。让它发光，肮脏的婊子，]当你瞥见他短裤里肿胀的凸起时，罗加咆哮道。你交替着舔舐一个乳头，用手指弹击和捏另一个，让你身下的兽人发狂。抬头看着他充满欲望的脸让你傻笑。看到他暴露的手臂和腋窝让你更加兴奋，你爬过去把脸埋进他的腋窝，开始舔舐周围。罗加发出一声惊讶的喘息，很快他的嘴唇卷成一个邪恶的笑容。[say: 肮脏的小猪，给我出汗的腋窝洗个大大的舌头浴。]每一次呼吸都是对他腋窝的呻吟，你的嘴和舌头尽职尽责地照顾着罗加的身体，舔掉你能找到的所有咸咸的汗水和粘液。罗加的手从脑后滑落，抓住你的后脑勺，依偎在你的[hair]里。[pg]");
         outputText("[say: 你漏掉了一个地方。]他把你的头按下去，让你的" + get_player().faceDescript() + "在他的腹股沟上摩擦，他那像帐篷一样的短裤压在你的脸颊上，你一边呻吟一边舔舐着那个凸起。每一次舔舐都会带来罗加又一声渴望的呻吟，直到最后他的耐心耗尽。[say: 是时候把你弄脏了，猪，]他咆哮着，空出的手猛地拉下他的短裤，把它们踢掉，暴露了自己。他巨大的绿色粗壮物拍打在你的[face]上。那根肥大的阴茎很粗，很容易就有十英寸长。他握住他巨大肉棒的根部，开始用他的勃起拍打你的脸颊。[say: 小猪没有做好他的工作。必须把我身上的每一寸都清理干净，]他戏弄道，把他流着口水的龟头涂抹在你的脸颊上，你的舌头伸出来接住滴落的长度。当你追逐罗加的兽人鸡巴时，你忍不住觉得自己像个饥渴的荡妇。");
         if(get_player().hasLongTail() || get_player().hasTailInsteadOfLegs())
         {
            outputText("你的尾巴急切地刷过罗加的腿，当你为他服务时，挠着他的大腿。");
         }
         outputText("罗加将他肥大的长度压在你的嘴唇上，你立刻扑了上去，舔舐着未割包皮的龟头，亲吻着粗壮的肉棒。你将舌头滑入他球状的龟头和折叠的包皮之间，收集聚集在那里的咸咸的先列腺液，然后向下舔舐罗加沉重而肿胀的精液工厂。当你感觉到先列腺液滴落在你的[face]上时，你用嘴温暖它们。你将舌头滑到罗加鸡巴的顶端，把它含在嘴里吸吮。随着咸咸的先列腺液开始充满你的嘴，越来越多的液体流过你的嘴唇。[say: 嗯，操，]当你的嘴顺着他肉肉的长度往下走时，罗加发出嘶嘶声。他牢牢地固定住你的头，移动他的臀部并向上推，开始操你的脸，用他压抑的囊袋拍打你的下巴。他无情地刺入你的嘴里，你所能做的就是让你的嘴唇紧紧地包裹住他的肉棒。你伸手去摸自己" + (get_player().armorDescript() != "gear" ? "在你的衣服下面" : "") + "，摩擦着");
         if(get_player().hasCock())
         {
            outputText(get_player().sMultiCockDesc());
         }
         else if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0));
         }
         else
         {
            outputText("你的[asshole]");
         }
         outputText("当罗加穿透你的嘴时。很快，兽人发出一声低沉的呻吟，将他的鸡巴猛地塞进你的喉咙，让你被这个绿色的怪物刺穿，他开始给你注入浓稠的精液。你能感觉到沉重的精液滑下你的喉咙，他每一次泵入你体内的精液都填满了你的胃。最终，他的阴茎从你湿透的嘴里滑了出来，把最后几股绳索喷在你的[face]上，正如他承诺的那样，用淀粉状的负荷“弄脏”了你。[pg]");
         outputText("[say: 操——操，你太棒了，[name]！]罗加闭着眼睛躺在床上，大口喘着粗气。你的舌头弹出来，抵住他用过的兽人鸡巴，尽可能地舔干净，然后你擦掉[face]上的精液块，然后把沾满精液的手指一根一根地塞进嘴里。你在吞咽前让精液在嘴里打转，浓稠精液的味道萦绕在你的舌头上。在你清理完自己和罗加弄得一团糟之后，你注意到兽人在打呼噜。你轻笑了一声，意识到他一定有多累。");
         if(get_player().get_inte() < 30)
         {
            outputText("他和对手之间的战斗持续了很长时间，所以这也有点道理。");
         }
         outputText("你温暖地笑了笑，在罗加的额头上印下了一个沾满精液的吻，决定让他休息，而你则收拾东西回营地。你渴望的");
         if(get_player().hasCock())
         {
            outputText("勃起");
         }
         else if(get_player().hasVagina())
         {
            outputText("小穴");
         }
         else
         {
            outputText("屁股");
         }
         outputText("隐隐作痛，每走一步都在摩擦敏感的");
         if(get_player().get_gender() > 0)
         {
            outputText("，流着口水的");
         }
         outputText("部位，摩擦着" + (get_player().armorDescript() != "gear" ? "你衣服的布料" : "你的手") + "。[pg]");
         get_player().slimeFeed();
         dynStats(DynStat.Lust(40));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,408,2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,2);
         if(get_player().get_inte() < 30)
         {
            doNext(get_camp().returnToCampUseTwoHours);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function noTHanksRogarIAintGayDudeIjustLickedThatMudToBeNice() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你对兽人笑了笑，但告诉他你现在真的没心情出去玩。他看起来很沮丧，但还是对你点了点头。[say:好吧，我明白。那我们回头见。]");
         doNext(get_telAdre().barTelAdre);
      }
      
      public function noSlowBroIDontWantPokeSex() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你紧张地轻笑了一声，礼貌地拒绝了。当你解释他不是你喜欢的类型时，罗加的脸突然因失望而耷拉下来。[say: 没关系。]在罗加对你露出露齿的笑容之前，你们俩度过了一个尴尬的时刻。[say: 如果你想的话，随时欢迎你来聊天喝酒。]你回以微笑，你们俩一边聊天一边享受着第二轮饮品。时间流逝，你决定离开。当你跋涉穿过沼泽回到营地时，罗加向你挥手告别。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,408,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,2);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function loseButtGinity() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         if(get_player().ass.analLooseness == 0)
         {
            outputText("你急切地点点头，兽人则用又一次抚摸作为奖励。[say:那好……我们走吧，]他说道。你们俩沿着沙漠城市的街道走着，直到来到一栋隐蔽偏僻的建筑前，上面写着“钢铁霍根公寓”。[say:这就是我住的地方，]罗加说着，牵着你走进大门。他带着你穿过走廊来到他的住处，然后为你推开门；你");
            if(get_player().cor < 33)
            {
               outputText("羞涩地");
            }
            else if(get_player().cor > 66)
            {
               outputText("急切地");
            }
            outputText("跨过门槛，然后环顾公寓。他指了指小厨房区，然后有些不好意思地指了指卧室。你正在打量的时候，有什么东西引起了你的注意……[pg]");
            outputText("你俯身在床上，抓起一个躺在柔软床单上的小瓶子。把它翻过来，你歪着头看着标签。这是……一瓶润滑剂。突然，你身后传来砰的一声闷响，瓶子从你手中掉落，你的上半身被压在柔软的床面上。有什么东西顶住了你的后背。[say:抓到你了……]那个熟悉的声音在你耳边窃笑。罗加的头探过你的肩膀，一条长长的兽人舌头舔了舔你的脸颊。[say:我等这个很久了……]他低声咕哝着；他低沉的嗓音在你耳边回荡。罗加轻笑着，抓住了你的手腕。[say:既然你来了，是时候用我从在沼泽里给你洗澡时就一直渴望的东西，来给这张新床开个光了，男孩。]罗加的语气突然变得强硬，发出嘶嘶的声音。他说话时，舌头在你的耳朵上轻弹。你的皮肤开始起鸡皮疙瘩，一阵战栗顺着脊背爬下。[pg]");
            outputText("他把你的手腕猛地拉到背后，无视你微弱的喘息。伴随着布料的摩擦声，你的手腕被紧紧地绑在背后；你的手指摸索着绑带，但你徒劳地挣扎着。你困惑地回头看着罗加，只看到他充满欲望的脸低下来吻你的嘴唇。他的獠牙带着强硬的咆哮压在你的脸颊上，舌头伸进你的嘴里；你的[ass]挨了一巴掌，迫使你叫出声来。他的舌头迅速入侵，他空出的手解开你的[armor]，强行剥光你的衣服。粗糙长满老茧的手指在你的身体上游走，捏住你的[nipples]，每一次捏弄都从你的喉咙里引出呻吟。你愉悦的声音被罗加的嘴巴捂住，他的舌头和嘴唇让你每一次的呜咽和喘息都安静下来。一个赤裸、结实的胸膛压在你暴露的背上，你喘息着，他身体的热量灼烧着你，他皮肤上薄薄的一层油更是加剧了这种感觉。罗加蓝色的眼睛像捕食者一样注视着你，你的脸红了。他结束了亲吻，双手捧起你的下巴，固定住你的脸。[say:你现在的表情真漂亮，[name]。你看着我，就像个十足的荡妇，看到你这么渴望被播种，让我硬得不行，]他喉咙里发出低吼，嘴巴在你的脖子上啃咬，他的獠牙摩擦你的皮肤，留下红色的印记。你能感觉到油和汗水涂抹在你的背上，你的感官变得疯狂。房间里很快充满了你渴望的呜咽声，[eachcock]在床单上渗出液体并跳动着，让布料被你的欲望弄湿。[pg]");
            outputText("伴随着一声突兀的咕哝，你感觉到一双手抓住你的[hips]，把你的屁股拉到半空中，让你用脸和膝盖保持平衡。罗加开始玩弄你的[ass]；每只手都在他的手指间按摩着一侧臀瓣，挤压并揉捏它们。一根手指在敏感的入口处摩擦，你轻轻地颤抖着。兽人用手指测试着它的阻力，压进去并威胁要插入，在紧绷、起皱的肉周围更用力地摩擦。你处子小穴紧绷的肉对罗加手指的各种哄骗都保持着抵抗。[say:该死，[name]。你太紧了……]你感觉到你的脸颊泛起鲜艳的红晕，你低声承认你从来没有让任何人进入过你的身体。[pg]");
            outputText("时间仿佛静止了：一切都停了下来，包括你昔日的情人。房间里唯一的声音是你自己的呼吸声，持续了近半分钟，直到罗加抓住你的[hips]把你翻过来，迫使你的身体平躺在背上。兽人的脸靠得足够近，你能感觉到他的呼吸拂过你的皮肤。[say:你是认真的？]他带着你从未见过的渴望问道。你猝不及防，只是点了点头，他的眼睛睁得大大的。伴随着撕裂声，你听到短裤从罗加身上撕下来的声音。你感觉到他滚烫、跳动的长度在你的" + get_player().buttDescript() + "上摩擦，然后你看到了它，深绿色的龟头气势汹汹地耸立在你的腹股沟上，每根血管都在跳动，巨大的肉棒喷出先列腺液，顺着兽人的肉棒流下。你的皮肤很快就被他喷出的液体弄得湿滑，他呻吟出声。[say:哦，操……一个货真价实的处子屁股。纯洁无瑕，等着被采摘……或者被操。]罗加的呼吸变得沉重，他气喘吁吁，充满渴望，他绿色的长度在你的处子花蕾上摩擦，让你在过度的感觉中呻吟出声。他的双手紧紧地掰开你的臀瓣，你开始把自己的先列腺液漏到肚子上。");
            if(get_player().balls > 0)
            {
               outputText("罗加深绿色的龟头在你的[balls]上摩擦，用他那充满麝香的粘液涂满你丰满的阴囊，就像一个阿尔法雄性在标记他的领地。");
            }
            outputText("[pg]");
            outputText("兽人发出低沉、喉音浓重的嘶嘶声。[say:放轻松，伙计……]罗加嘟囔着，试图克制自己不用他肥大的肉棒把你撕裂。他俯下身，温柔地吻了你一下，然后继续。[say:我会给你一个合适的第一次，像个绅士一样。]他调皮地眨了眨眼，跪了下来，蹲在床尾。他的手把你的[hips]举到他的嘴边。你能感觉到他亲吻你紧致的后庭，很快一股温暖的感觉顺着你的脊柱窜上来，让你呻吟出声。他滚烫、湿滑的舌头在你起皱的肉上打转，在你的小穴上涂抹，同时他的獠牙在你的臀瓣上摩擦。罗加在你的处子肛门上忙碌着，他的舌头轻轻地让你紧绷的肉环张开，你只能喘着粗气，发出渴望的呼吸。这种愉悦让你的双腿在他的肩膀上变得柔软，你的眼睛在幸福的恍惚中闭上。罗加湿润的吸吮声和低吼声让你的耳朵抽动，你感觉到他用兽人的舌头慢慢地压进去，开始用力地舌交你的入口。在耐心的作用下，你的后庭在罗加的触摸下屈服了，他的舌头滑进了你未被触碰过的深处。你猛地倒吸一口凉气，这种奇怪的感觉淹没了你，你猛地睁开眼睛。你的[ass]在他的舌头周围愉悦地扭动着，兽人发出一声满意的咕哝，他的舌头在你的内壁上打转，滑出来把你的青柠味吸进嘴里，然后又粗暴地插回去。你弓起背，发出一声惊讶的呻吟。");
            if(get_player().hasLongTail() || get_player().hasTailInsteadOfLegs())
            {
               outputText("你的尾巴缠绕在罗加的手臂上，似乎是为了寻求某种稳定，尾尖慵懒地甩动着，紧紧缠绕并挤压着他的二头肌。");
            }
            outputText("[pg]");
            outputText("罗加发出刺耳的咆哮，急切地舌交你，他的嘴唇在你的屁股上忙碌着，把你吃干抹净。他的手指粗暴地抓住你的[hips]，以一种超出你最疯狂梦想的方式蹂躏你的小穴。你听到拍打声，那是罗加的臀部不由自主地撞击床沿的声音。他疼痛的勃起在床单上滴下大团浓稠的粘液，几乎无法克制把你操到失去理智的欲望。[say:放松！]罗加用一种让你震惊的命令语气吼道。你试图顺从地呜咽着，感觉到有什么东西压在你身上。罗加粗大的手指戳着你被口水弄得湿滑的后庭，伴随着湿润的摩擦声滑了进去。当他的手指带着一些阻力滑入你的身体时，你颤抖着，但他无情的手指在你的内壁上摩擦，他开始拉开你的边缘，强行把另一根手指插进去，刺痛的感觉让你咬住了嘴唇。他把两根手指一起在你体内活动，慢慢地把它们分开，把你的小穴撑得大大的。");
            outputText("随着罗加稳健的诱导，你那未曾被触碰过的男孩小穴被强行撑开，手指和[feet]因快感而蜷缩起来。");
            outputText("你听到软木塞拔出的声音，很快，冰凉滑腻的润滑液便倒在了你紧闭的入口和会阴处。在两根手指将你扩张得足够松弛后，第三根手指滑了进去，三根手指加快了速度，越插越深，将你完全撑开。这种奇怪的感觉让你陷入了莫名的疯狂。这感觉太棒了，太新奇了，你的精液在肚子上汇聚，顺着身体两侧流下，弄脏了下面的床单。罗加在床上直起身子，笼罩着你发情的身体，手指继续在你体内抽插。你透过快感的迷雾向下瞥去，看到了他巨大的勃起。它似乎比你记忆中的还要大，龟头不断渗出精液，暗示着他惊人的产量。[say:准备好破处了吗，男孩？我已经把你完全撑开了。]蓝色的眼睛注视着你发情的样子，在他的注视下，你只能颤抖。[say:我看你挺享受的嘛，]他低吼着说道，继续用欲望和新奇的感觉让你陷入疯狂。[say:我可是等了很久了，现在我要夺走你的初夜，而且我要品尝每一滴，直到你崩溃。][pg]");
            outputText("当他的手指从你的小穴中滑出时，你忍不住呻吟出声。他强壮的双手托起你的臀部，将你润滑过的后庭抬高到合适的位置；你完全暴露在他面前，他调整着臀部，对准了你那处女般紧致的小穴。他那根巨大肉棒的龟头抵着你松开的男孩小穴，滴落着渴望的汁液，稳稳地强行挤入紧致的洞口。当他用自己的长度将你撑开时，你咬紧了牙关，但他毫不犹豫地继续挺进。终于，当那球状的龟头挤进你狭小的洞口时，你因刺痛而哭喊出声，但这哭喊却被罗加无视了，他只是因为你那处女般的紧致而发出一声低吼。");
            get_player().buttChange(25,true,true,false);
            outputText("当你感觉到兽人巨大的肉棒将你撑得比他的舌头或手指还要开时，你再次发出一声呜咽。尽管很痛，但你的身体别无选择地屈服在这根粗壮的肉棒下，很快，你那曾经如处女般紧致的洞口就被撑得足够大，足以容纳接下来的事情。[say:等我干完你，你就会变成一个合格的肉便器了，男孩。非常适合给我配种。]他轻笑着，用温暖的舌头舔舐你的脸颊。罗加将大部分粗壮的肉棒埋入你体内，然后拔出到龟头处，再次猛地插进去，稳稳地将自己越来越多的部分挤入你体内。你的呜咽声开始减弱，刺痛感也随之消退。他滴落的精液带来的热量和感觉，在你内壁上温暖地蔓延，开始让你无法自拔。感觉到他占有了你未曾被触碰过的内部，你发出了幸福的呻吟。[pg]");
            outputText("你的脑海中回荡着罗加的话语，因为它们似乎正在成真。你忍不住将注意力集中在罗加的肉棒在你体内跳动的奇妙感觉上。也许这就是你的归宿？用你紧致的屁股被罗加巨大的工具刺穿？当罗加加快速度时，你大声呻吟，他的臀部猛烈地撞击着你，力道之大甚至让你的身体在床单上移动。他真的开始用粗重的喘息和呻吟声来开垦你的洞口，直没至柄；他的龟头随着每一次抽插都顶弄着你的前列腺，让你像触电一样脊背发麻，忍不住大叫出声。你全身的每一根神经都像圣诞树一样亮了起来，让你的整个身体都在快感中扭动。你感觉到精液开始从你的[cocks]中渗出，用先列腺液给你的肚子涂上了一层釉。");
            if(get_player().hasLongTail() || get_player().hasTailInsteadOfLegs())
            {
               outputText("你的尾巴仍然紧紧抓着罗加的手臂，用力收紧。");
            }
            if(get_player().balls > 0)
            {
               outputText("当你感觉到高潮临近时，你的[balls]猛地收紧。[say:找到你的开关了，男孩，]罗加窃笑着，用他的肉棒摩擦着你的前列腺，那根火热的肉棒以你从未体验过的方式在你体内肆虐。你感觉自己完全任由这个高大的兽人摆布。[say:为我射出来吧，]他低吼着，嘴唇压在你的嘴唇上，强行撬开你的嘴，舌头长驱直入，与他的肉棒同步抽插。他的臀部猛烈地撞击着你，随着每一次抽插，阴囊拍打着你翘起的臀瓣，一次又一次地撞击着你的敏感点。你在兽人的嘴里呻吟着，将自己的精液涂满全身，大脑因那幸福、黏糊糊的高潮而变得一片模糊。你的身前滴落着你的精液，而罗加则继续蹂躏着你那被开垦过的男孩小穴。[pg]");
            }
            outputText("[say:真他妈紧……]罗加在接近极限时咆哮道。[say:是时候进行你第一次真正的配种了，男孩！]他的声音让他的胸腔发出隆隆的共鸣，他喘着粗气，热气拂过你的脸颊。肉体拍打的声音在你耳边回荡，你短暂地注意到你的[ass]因为罗加臀部的撞击而感到红肿和酸痛，然后你闭上眼睛，迎接另一次令人愉悦的抽插。伴随着一声粗糙的咆哮，他的下巴占有欲极强地咬住你的肩膀，同时他肿胀的阴囊收紧了。很快，你的下半身就被一种你从未感受过的温暖所淹没。罗加的精液完全填满了你，那充满麝香气味的浓浊液体涂满并弄脏了你曾经纯洁的洞口。一种压力在你体内积聚，湿润的精液从你的边缘喷涌而出，顺着你翘起的臀瓣滴落。罗加咬紧牙关，喘着粗气，度过了他的高潮，在你体内又抽插了几次，直到他将沉重睾丸里的最后一滴精液都注入你体内。[pg]");
            outputText("伴随着一声疲惫的叹息，他的下巴从你的肩膀上松开，躺在了你旁边的床上。你们俩花了一点时间来喘口气。你只能听到沉重的呼吸声，直到罗加坐起身来。你听到附近传来咔哒一声，抬起头看到罗加正在喝一个锡罐里的饮料。你坐起身来，罗加转过头来与你对视。[say:你什么都不用说。我一遇到这种事就容易得意忘形。听到你还是个处子……呼-喂！]他紧张地轻笑了一声，你则用疲惫的笑容回应。他解开你手上的绳子，又喝了一口饮料。[say:那么，呃……你——]你的一个充满爱意的吻打断了他的问题，你先是吻了他的獠牙，然后是他的嘴唇。[say:好吧，]他笑着，然后用手揉了揉后颈。[say:那就没必要说那些肉麻的话了。你得走了。别担心，我明白。]罗加帮你站起来，把你在他狂热中匆忙散落的装备收拾好。他跟着你走到门口。[say:保重啊，听见没？还有，[name]……有空常来看看我，好吗？]罗加站在门口微笑着挥了挥手，目送你离开。你疲惫地走回了城市。[pg]");
         }
         else
         {
            outputText("你急切地点了点头，兽人奖励了你又一次抚摸。[say:那好……我们走吧，]他说。你们俩沿着沙漠城市的街道走着，直到来到一栋隐蔽、偏僻的建筑前，上面写着“钢铁霍根公寓”。[say:是时候跟我回家了，[name]。]他推开门走了进去，消失在走廊里。[say:你过来坐下怎么样？]他喊道，你循着他的声音走去。他的一只大手放在腿上，那条腿与另一条腿分开，将你的视线吸引到它们之间。兽人已经脱掉了他的小短裤，赤裸的身体窝在沙发里，向你招手。他暴露的器官无力地悬挂在他那令人印象深刻的阴囊上。你抿起嘴唇陷入沉思，感觉到下体升起一股暖意。[pg]");
            outputText("当你靠近时，你忍不住感到犹豫，但你的欲望却不愿意拒绝这个提议。你跨坐在罗加的腿上，大腿夹住他那强壮的肌肉。罗加用一只手臂环住你的腰，把你拉得更近，让你紧贴着他的胸膛。[say:真是个好男孩。现在来个吻怎么样？]他轻笑着，伸手托起你的下巴，让你的脸迎向他。");
            if(get_player().get_tallness() >= 84)
            {
               outputText("当罗加仰起头时，你俯下身，你们的嘴唇贴在一起，双唇微启，让舌头互相纠缠。");
            }
            if(get_player().get_tallness() < 84)
            {
               outputText("你仰起头迎合罗加的嘴，他的手抚摸着你的脸颊。");
            }
            outputText("你能感觉到他霸道的舌头挤进你的嘴里，从你那放荡的入口诱哄出呻吟。他的手顺着你的腰滑下，用强有力的手掌握住你的[ass]。罗加带着邪恶的笑容结束了这个吻。" + (get_player().armorDescript() != "gear" ? "[say:让我们把这些衣服脱掉。]他的声音在胸腔深处隆隆作响，共鸣在你的皮肤上震动。他主动脱下了你的衣服，让你一丝不挂地坐在他的腿上。" : "") + "兽人的一只手在你的身体上游走，玩弄着你的乳头，另一只手则向你的[cocks]滑去。罗加的头埋在你的后颈处，轻轻地咬着你的皮肤，带来一阵轻微的刺痛，让皮肤泛红。在他咬过的地方，他立刻用温暖的舌头温柔地舔舐着那被蹂躏的肌肤，光滑的獠牙在你身上摩擦，让你的身体微微颤抖。[pg]");
            outputText("罗加不断的挑逗让你气喘吁吁，他那稀薄的油脂涂抹在你的皮肤上，让你感觉浑身像着了火一样。你淫荡地在罗加的腿上张开双腿，血液向下涌去，你感觉到自己变得僵硬并跳动起来——尽管你不是唯一一个勃起的人，因为你很快就感觉到罗加火热的男子气概紧贴着你的身体。他在你肩膀上呻吟着，挺动臀部摩擦着你的肉体。先列腺液从罗加肿胀的龟头上滴落，带着他的渴望涂抹在你身上。[say:过来，]他直接在你耳边低语。他的双手抓住你的臀部，把你拉近面向他。当你跨坐在罗加的臀部时，你的胸膛紧贴着他的胸膛。罗加那根跳动的十英寸大肉棒塞进了你" + get_player().buttDescript() + "的臀瓣之间。他调皮地对你眨了眨眼，挺动臀部让你在他的腿上弹跳。他那火热、粗壮的长度在你的[asshole]上摩擦，并用大量的先列腺液将其弄湿，这种感觉让你像发情的母狗一样喘息。滴落的兽人精液在你的臀瓣之间蜿蜒流下，你感觉到自己的身体因期待而颤抖；罗加任由液体倾泻在他自己坚硬的肉棒上。[say:我最喜欢的男孩准备好迎接他生命中最刺激的骑乘了吗？]他像小恶魔一样咧嘴笑着，握住他那根粗壮、未割包皮的兽人肉棒的龟头，将其抵在你的男孩小穴上。你发出一声愉悦的喘息，双手紧紧抓住罗加的肩膀，扭动着你的[ass]准备迎接这漫长的征途。[pg]");
            outputText("随着罗加臀部的一阵挺动，他那滑溜溜的龟头滑进了你的[asshole]。你的双唇微启，当他埋入你体内时，你发出一声尖锐的喘息。[say:骑上来，男孩！]他吠叫着，在你的[ass]上狠狠地拍了一巴掌。你因为这粗暴的对待而惊叫出声，慢慢地坐下去，让罗加坚硬的肉体滑入你体内更深处，随着那根跳动的肉棒将你撑开，你感觉到自己变得更加坚硬。" + get_player().SMultiCockDesc() + "因充血而肿胀，它刷过罗加的肚子，敏感的尿道沾上了他皮肤上的一层薄薄的粘液，让你因敏感而燃烧。你的臀部更加贴近罗加的身体，将你的[cocks]紧紧地摩擦着他。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的勃起画出了一道道先列腺液的痕迹，当你顺着罗加的肉棒上下起伏时，这些液体与罗加身上的汗水和油脂混合在一起。");
            }
            outputText("你的精液滴落在罗加绿色的皮肤上，汇聚在他的肚脐里，同时他的嘴对你的脖子发起了一阵啃咬和舔舐的攻势，每一次轻咬都让他的獠牙摩擦着你敏感的皮肤。他的双手粗暴地抓住你的" + get_player().buttDescript() + "，用手将你的臀瓣掰开，像揉面团一样揉捏着那里的肉。他用臀部霸道地顶弄着你，诱哄你动得更快，他的肉棒在你体内每一次抽插都伴随着低沉的咆哮。滚烫的液体粘在你的内壁上，性唤起让你无助地挺动臀部，随着每一次抽插，你变得越来越敏感。你很快就在罗加的肉棒上上下弹跳起来，为了让你这狂野的骑乘更进一步，罗加开始向上挺动臀部来迎合你的[ass]。[pg]");
            if(get_player().thickness >= 75 && get_player().tone < 33 || get_player().tone >= 75)
            {
               outputText("你尽可能快地骑乘着罗加坚硬的肉棒，让这个兽人男人因渴望而发狂。他粗壮的尺寸将你的" + get_player().assholeDescript() + "撑得大大的，让你成为他兽人肉棒的绝佳肉便器。他直没至柄地插在你体内，当他的龟头撞击你的前列腺时，你发出了愉悦的叫声。当罗加听到你像发情的母狗一样叫唤时，他从你手中夺回了控制权。他强壮的双手抓住你的[hips]将你固定在原地，同时他猛烈地捣弄着你的[asshole]，以粗暴的力量撞击着你，让你大声呻吟，声音都变得有些沙哑。" + get_player().SMultiCockDesc() + "因为你的敏感点受到蹂躏而抽搐着");
               if(get_player().balls > 0)
               {
                  outputText("当你感觉到自己达到极限时，你的[balls]紧紧地收缩起来");
               }
               outputText("。");
               outputText("当罗加将你推向高潮的边缘时，你因极度的快感而蜷缩起手指和[feet]。");
               outputText("你的抽插变得断断续续，兽人接管了主动权，随着[eachcock]的抽动和痉挛，射出无数股粘稠的精液，喷洒在闪闪发光的绿色皮肤上，用你的欲望将兽人染成白色。伴随着低沉浑厚的嗓音，罗加发出一声呻吟，你感觉到他的温暖席卷了你的下半身，让你充满了他的男性精华。罗加继续操着你，但力度逐渐减弱，最后停了下来，他那精疲力尽的肉棒从你流着口水的后穴中滑出。他的精液从你被填满的男孩小穴中涌出，顺着罗加半硬的肉棒流下，淫荡地滴在地板上。[pg]");
            }
            else
            {
               outputText("[say: 别闹了。] 罗加咆哮着，双臂迅速向后一拉，从你的双腿下穿过，站起身来将你举起。当他伴随着吃力的咕哝声将你举起时，你紧紧抓住他的肩膀。当他开始把你顶向空中，每一次肉棒的撞击都让你从他的臀部弹起，你发出尖锐而短促的呻吟，享受着这种快感。罗加慢慢地走向墙壁，小心翼翼地确保不会把你掉下来，很快你就感觉到冰凉的墙面贴在了你的背上。被夹在肉棒和坚硬的墙壁之间，你盯着罗加充满掠夺性的目光，他把你举在半空中并固定住，让你感到无比脆弱。兽人趁机开始蹂躏你的[asshole]，让你不由自主地仰起头，无助地呻吟出声。");
               outputText("" + get_player().SMultiCockDesc() + " 贴在你的胸膛上，先列腺液滴落在你的皮肤上，你在欲望中把自己的躯干弄得一团糟。");
               if(get_player().hasLongTail() || get_player().hasTailInsteadOfLegs())
               {
                  outputText("你的尾巴在身下无助地甩动着，急切地缠绕住罗加的大腿，试图将他拉得更深。");
               }
               outputText("当罗加找到你的敏感点时，你大叫出声。[say: 现在我抓住你的弱点了，男孩，] 他窃笑着，带着他一贯的掠夺性笑容，锋利参差的牙齿完全暴露出来，而你则在对你[ass]的无情猛攻下颤抖。肉体拍打肉体的声音在你耳边回荡，你在罗加的肉棒下扭动着。每一次抽插都让你在快感中发狂，当你的前列腺被戳刺时，你的大脑陷入了欲望的迷雾中。");
               if(get_player().balls > 0)
               {
                  outputText("你感觉到你的[balls]在阴囊里紧紧收缩，你气喘吁吁，呼吸变得沉重。");
               }
               outputText("罗加继续他野蛮的抽插，将他的长度完全刺入你的体内；很快你就在狂喜中大叫出声，他急促的猛攻让你达到了高潮，将你浓稠的精液喷洒在自己身上。你的胸膛很快就被你自己的精液覆盖，像一层美味的糖霜一样涂抹在你的躯干上，让人忍不住想要舔舐。你的高潮刺激了他，罗加每一次有力的抽插都将你挤压在他和墙壁之间。他咬紧牙关呼吸，发出一声疯狂的嘶嘶声，用臀部狠狠地撞击你的屁股，将你刺穿，当你突然被精液淹没时，兽人发出了咆哮。他似乎射了整整一个世纪，每一次急促的抽插都将一桶精液泵入你的屁股。当精液开始溢出，从你的屁股流下，滴在兽人跳动的肥大睾丸上，在地板上汇成一滩时，你的肚子胀了起来。当他把种子播撒在你体内时，你疲惫地呻吟着。[pg]");
            }
            outputText("除了你和罗加疲惫的喘息声，周围一片寂静，你花了几分钟时间来平复呼吸。罗加深情地蹭了蹭你，然后让你站起来，一直扶着你直到确定你能站稳。你们俩交换了一个心照不宣的眼神，罗加对你咧嘴一笑。[say: 你太棒了，[name]。随时欢迎你来。] 当你收拾好东西，迈着摇晃的双腿走向门口时，他给了你一个温柔的拥抱，你仍然感觉到精液顺着你的腿流下来" + (get_player().armorDescript() != "gear" ? " 在你的衣服下面" : "") + "。兽人挥了挥手，露出满口牙齿的笑容目送你离开。[pg]");
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(2));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lickSomeMoreOrcButNoPits() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你歪着头，将嘴唇贴在罗加的嘴唇上。他张开双唇迎接你，你的舌头与他的舌头共舞，他的手抚摸着你的腰侧，同时发出一声低沉而充满渴望的咆哮。他火热的嘴唇和舌头紧紧地贴着你的。他试图支配你的嘴，他的舌头与你的舌头纠缠，想把它推向他想要的地方。他的牙齿咬住你的下唇，发出一声低沉而占有欲极强的咆哮。[pg]");
         outputText("[say: 你的嘴和手这么熟练，想不想给我来个痛快的收尾？我一定会给你小费的。] 他调皮地眨了眨眼。你脸上带着微笑，稍微后退了一点，将你的" + get_player().multiCockDescriptLight() + "拖过他的肉棒。罗加突然发出一声呻吟，当他那根肥大的绿色肉棒摩擦着你的[cocks]时，他的呼吸变得急促起来。你脑海中浮现出一个新主意，你回敬着他的摩擦，让这个兽人男性在咕哝和喘息中陷入疯狂。他那沾满粘液和精油的身体疯狂地摩擦着你的身体。他变成了一团喘息和呻吟的肌肉和兽人肉体，在你身下扭动着，他的嘴张开，发出渴望的呻吟，绝望地渴望着你的触摸、你的温暖、你的身体。[pg]");
         outputText("在制造了一滩混合着你自己的兽人先列腺液后，这泥浆般的液体从罗加的肚子上滴落，你又开始向后移动。罗加那根跳动的兽人男子气概之柱就在你面前，你的双手让它高高挺立。当你用手套弄他那根肥大的肉棒时，你的兽人爱人喘不过气来，它们仍然沾满了油和粘液。等待你的奖励是大量的浓稠兽人先列腺液，滴落在你的手指和手掌上。滚烫的液体在他那颜色较深的龟头上结成珠状，你的嘴唇在爱人那根巨大的肉棒顶端印下一个吻。他那气味强烈的精液涂抹在你的嘴唇上，正好让你的舌头伸出来收集，而罗加则用充满情欲的眼睛注视着。[pg]");
         outputText("当一只手套弄着罗加巨大的肉棒时，你将嘴唇贴在他沉甸甸的阴囊上，你的舌头在他充满精液的球体上倾注着温暖湿滑的爱意。当你让他发狂时，你能听到他的身体在颤抖，你空闲的手抚摸着他起皱的后庭，同时用手和嘴取悦他的男子气概。伴随着湿润的吸溜声，你吸入了一大口你兽人爱人沉甸甸的阴囊，当你吸吮他的宝贝时，他麝香的刺激味道淹没了你的舌头。不久之后，你将一根手指滑入罗加的后庭，这根湿滑的手指扭动着穿过兽人的阻力，稍微撑开了紧致的肉壁。[pg]");
         outputText("[say: [name] 你真是……太棒了……] 当你用舌头沿着他那根肥大的绿色肉棒向上舔舐时，罗加几乎说不出话来。你毫不犹豫地用嘴唇包裹住他那渴望的龟头，流出的先列腺液在你的舌头上滚烫，你直接从源头饮下他的精液。你的兽人爱人躺在床上，双腿张开，他的下体赤裸着，任由你无情地挑逗触摸。很快，你的头就沿着罗加的兽人肉棒上下摆动，第二根手指滑入罗加的屁眼。你将嘴部的动作与头部的摆动同步。当你深喉这根兽人男子气概时，整根肉棒没入你的嘴里，你空闲的手按摩着罗加的蛋蛋，同时你强行将第三根手指插入罗加的后庭。[pg]");
         outputText("[say: 呃啊……] 罗加的脸绷得紧紧的，当你感觉到他沉重的蛋蛋收紧时，你就知道为什么了。你迅速将头向后拉，准备迎接你丰厚的小费。罗加在快感中咆哮出声，他那根肥大的肉棒将你嘴里射满了滚烫的兽人精液。浓稠的精液从他的龟头喷涌而出，飞溅并填满你的嘴，尽管你努力跟上，但还是从你的嘴唇溢出。当你吞下这奶油般的精液时，你能感觉到兽人的精液顺着你的下巴滴落。你继续吸吮着罗加巨大的兽人肉棒，直到它变软，清理掉附着在上面的浓稠精液，直到它疲软并耗尽。[pg]");
         outputText("[say: 过来你……] 罗加弯下腰，将你拉进他温暖的怀抱。[say: 你太擅长这个了……根本坚持不了多久。你让我的耐力相形见绌了，[name]，] 当你把他抱在怀里时，他发出咕噜声。当你靠在他温暖的身体上时，你轻笑并微笑着，你们俩躺在柔软的床单上。他似乎把你抱得很紧，即使你扭动也几乎不愿意放开你。你决定就和你的兽人爱人躺在一起闭目养神。罗加隆隆的鼾声让你眨了眨眼，然后窃笑起来。他这么容易激动，没过多久就睡着了，这太像他了。他的手臂紧紧地抱着你，依偎着你，仿佛你是他珍贵的毛绒玩具，这可能让他放松下来，直到他睡着……精油可能也有帮助。打了个哈欠，你决定自己也休息一下，闭上眼睛，在兽人爱人毯子般温暖的爱意包围下进入梦乡。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(2));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kinkyWithDaOrc() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你急切地点点头，兽人则用又一次抚摸作为奖励。[say:那好……我们走吧，]他说道。你们俩沿着沙漠城市的街道走着，直到来到一栋隐蔽偏僻的建筑前，上面写着“钢铁霍根公寓”。[say:这就是我住的地方，]罗加说着，牵着你走进大门。他带着你穿过走廊来到他的住处，然后为你推开门；你");
         if(get_player().cor < 33)
         {
            outputText("羞涩地");
         }
         else if(get_player().cor > 66)
         {
            outputText("急切地");
         }
         outputText("跨过门槛，然后环顾公寓。他指了指小厨房区，然后有些不好意思地指了指卧室。你正在打量的时候，有什么东西引起了你的注意……[pg]");
         outputText("你俯身在床上，抓起一个躺在柔软床单上的小瓶子。把它翻过来，你歪着头看着标签。这是……一瓶润滑剂。突然，你身后传来砰的一声闷响，瓶子从你手中掉落，你的上半身被压在柔软的床面上。有什么东西顶住了你的后背。[say:抓到你了……]那个熟悉的声音在你耳边窃笑。罗加的头探过你的肩膀，一条长长的兽人舌头舔了舔你的脸颊。[say:我等这个很久了……]他低声咕哝着；他低沉的嗓音在你耳边回荡。罗加轻笑着，抓住了你的手腕。[say:既然你来了，是时候用我从在沼泽里给你洗澡时就一直渴望的东西，来给这张新床开个光了，男孩。]罗加的语气突然变得强硬，发出嘶嘶的声音。他说话时，舌头在你的耳朵上轻弹。你的皮肤开始起鸡皮疙瘩，一阵战栗顺着脊背爬下。[pg]");
         outputText("他无视你微弱的喘息，将你的手腕猛地拉到背后。伴随着布料的摩擦声，你的手腕被紧紧地绑在背后；你的手指摸索着束缚，但你的挣扎只是徒劳。你转过头，带着");
         if(get_player().lib < 33)
         {
            outputText("假装的困惑");
         }
         else if(get_player().lib > 66)
         {
            outputText("明显的欲望");
         }
         outputText("看向罗加，你只看到他那充满情欲的脸庞俯下来亲吻你的嘴唇。他的獠牙伴随着霸道的低吼抵住你的脸颊，舌头长驱直入；你的[ass]挨了一巴掌，疼得你叫出声来。他的舌头迅速入侵，腾出的手解开你的[armor]，强行将你剥光。粗糙长满老茧的手指在你的身体上游走，捏住你的[nipples]，每一次揉捏都引得你喉咙里发出呻吟。你愉悦的声音被罗加的嘴堵住，他的唇舌吞没了你的每一次呜咽和喘息。赤裸结实的胸膛紧贴着你暴露的后背，他身上散发的热量灼烧着你，皮肤上那层薄薄的油更是加剧了这种感觉，让你不禁喘息起来。罗加蓝色的眼睛像捕食者一样注视着你泛红的脸颊。他结束了亲吻，双手捧起你的下巴固定住你的脸。[say: 你这副表情真漂亮，[name]。你看着我的样子就像个十足的荡妇，看你这么渴望被配种，我都硬了，]他喉咙里发出低吼，嘴巴在你的脖子上啃咬，獠牙摩擦过的地方在你的皮肤上留下了红色的印记。你能感觉到汗水和油脂涂抹在你的背上，你的感官开始变得狂野。房间里很快充满了你难耐的呜咽声，[eachcock]在床单上渗出液体并跳动着，用你的淫液弄湿了布料。[pg]");
         outputText("伴随着一声突如其来的闷哼，你感觉到一双手抓住了你的[hips]，将你的臀部拉向空中，让你只能靠脸和膝盖保持平衡。罗加开始把玩你的[ass]；他的双手在指间揉捏着你的臀瓣，将它们挤压、揉开。一根手指在敏感的入口处摩擦，你轻轻地颤抖起来。兽人用手指试探着它的阻力，向内按压，作势要插进去，在紧致起皱的软肉周围更用力地摩擦。在罗加手指的百般挑逗下，你像个发情的荡妇一样呻吟起来。");
         if(get_player().ass.analLooseness < 3)
         {
            outputText("[say: 该死，[name]。你真紧……][pg]");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("[say: 我最喜欢的男孩准备好迎接他生命中最刺激的旅程了吗？][pg]");
         }
         outputText("罗加抓住你的[hips]把你翻转过来，强迫你仰面躺下。兽人的脸靠得很近，你能感觉到他的呼吸拂过你的皮肤。伴随着撕裂声，你听到罗加身上的短裤被扯了下来。你还没看到，就感觉到他那根滚烫、跳动的肉棒在你的" + get_player().buttDescript() + "上摩擦，深绿色的龟头在你的腹股沟上方充满威胁地高耸着，每一根青筋都在跳动，巨大的阴茎喷吐出先列腺液，顺着兽人的肉棒流下。随着他发出一声呻吟，你的皮肤很快就被他喷出的先列腺液弄得湿滑。[say: 这样好多了。] 罗加的呼吸变得沉重，他急促而渴望地喘息着，他绿色的肉棒在你的后庭上摩擦，让你在过度的快感中呻吟出声。他的双手紧紧地掰开你的臀瓣，而你自己的先列腺液也开始流到你的肚子上。");
         if(get_player().balls > 0)
         {
            outputText("罗加深绿色的龟头在你的[balls]上摩擦，用他那充满麝香的粘液涂满你丰满的阴囊，就像一个阿尔法雄性在标记他的领地。");
         }
         outputText("[pg]");
         outputText("兽人发出低沉、喉音浓重的嘶嘶声。[say: 慢点，伙计……] 罗加嘟囔着，试图克制自己不用他那粗大的肉棒把你撕裂。他俯下身，温柔地吻了你一下，然后继续说道。[say: 我会给你一次终生难忘的变态乐趣。] 他调皮地眨了眨眼，跪在床尾蹲下。他的手把你的[hips]抬到他的嘴边。你能感觉到他亲吻你紧致的后穴，很快一股温暖的感觉顺着你的脊椎蔓延开来，让你忍不住呻吟。他火热、湿滑的舌头在你皱褶的血肉上打转，在你的穴口涂满唾液，同时他的獠牙在你的臀瓣上摩擦。当罗加在你的肛门上忙活时，你只能喘着粗气，发出渴望的喘息，他的舌头温柔地让你紧致的肉环放松。这种快感让你的双腿无力地搭在他的肩膀上，你闭上眼睛，陷入幸福的迷乱中。罗加湿润的吸吮声和低吼声让你的耳朵抽动，你感觉到他慢慢地用他兽人的舌头探入，开始用力地舌交你的入口。在耐心的安抚下，你的后穴在罗加的触碰下屈服了，他的舌头滑入了你未被触碰过的深处。你猛地倒吸一口凉气，这种奇怪的感觉淹没了你，你猛地睁开眼睛。你的[ass]在他的舌头周围愉悦地扭动着，兽人发出一声满意的咕哝，他的舌头在你的内壁上打转，滑出来把你的味道吸进嘴里，然后又粗暴地插进去。你弓起背，发出一声惊讶的呻吟。");
         if(get_player().hasLongTail() || get_player().hasTailInsteadOfLegs())
         {
            outputText("你的尾巴缠绕在罗加的手臂上，似乎是为了寻求某种稳定，尾尖慵懒地甩动着，紧紧缠绕并挤压着他的二头肌。");
         }
         outputText("[pg]");
         outputText("罗加发出粗哑的低吼，急不可耐地用舌头操弄着你，他的嘴唇在你的屁股上游走，贪婪地品尝着你。他的手指粗暴地抓住你的[hips]，以一种超乎你想象的方式蹂躏着你的小穴。你听到啪啪的声响，那是罗加的臀部不由自主地撞击床沿发出的声音。他那胀痛的勃起在床单上滴下大团浓稠的黏液，几乎无法克制想要把你操到失去理智的欲望。[say:放松！]罗加用一种命令的口吻吼道，让你浑身一震。你呜咽着试图顺从，感觉到有什么东西压在了你身上。罗加粗大的手指戳弄着你沾满唾液的穴口，伴随着湿润的噗嗤声滑了进去。当他的手指滑入你的体内时，你忍不住颤抖起来");
         if(get_player().ass.analLooseness < 3)
         {
            outputText("遇到了一些阻力，但那根无情的手指在你的内壁上摩擦，他开始拉开你的穴口，强行塞入第二根手指，刺痛感让你咬紧了嘴唇。他在你体内同时转动两根手指，慢慢地将它们分开，把你的小穴撑得大大的。");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("并在你的内壁上摩擦，他拉开你的穴口，强行塞入第二根手指，让你像发情的母狗一样呻吟起来。他在你体内同时转动两根手指，慢慢地将它们分开，把你的小穴撑得大大的。");
         }
         outputText("当你的男孩小穴在罗加稳健的诱导下被迫张开时，你的手指和[feet]都因快感而蜷缩起来。");
         outputText("你听到软木塞拔出的声音，很快，冰凉滑腻的润滑液便倒在了你紧缩的入口和会阴处。在两根手指将你扩张得足够松弛后，第三根手指滑了进来，三根手指加快了速度，越插越深，将你完全撑开。这种奇妙的感觉让你发狂。这感觉太棒了，太对了，你的精液在肚子上汇聚，顺着身体两侧流下，弄脏了身下的床单。罗加爬上床，高大的身躯笼罩着你发情的身体，手指继续在你体内抽插。你透过快感的迷雾向下瞥去，看到了他巨大的勃起。它似乎比你记忆中的还要大，龟头不断渗出精液，暗示着他惊人的产量。[say:准备好兜风了吗，男孩？我已经把你扩张得很好了。]蓝色的眼睛注视着你的情态，在他的注视下，你只能颤抖。[say:我看你挺享受的嘛，]他低吼着说，继续用欲望和刺激的感觉让你发狂。[say:我一直在等待时机，但我会细细品味每一滴，直到你爆发。][pg]");
         outputText("当他的手指从你的穴口抽出时，你忍不住呻吟出声。他强壮的双手抬起你的臀部，将你润滑过的穴口抬高到合适的位置；你完全暴露在他面前，他扭动臀部，将自己对准你的穴口。他那根巨大肉棒的龟头压在你松弛的男孩小穴上，滴落着渴望的液体，他稳稳地强行进入");
         if(get_player().ass.analLooseness < 3)
         {
            outputText("紧致的穴口。当他用自己的粗长将你撑开时，你咬紧牙关，但他没有丝毫犹豫继续挺进，最后，当那球状的龟头挤进你狭小的穴口时，你痛得大叫起来，但这叫声却如泥牛入海，罗加只是因为你的紧致而闷哼了一声。");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("你那久经沙场的穴口。当他用自己的粗长将你撑开时，你渴望地呻吟着，他毫不犹豫地继续挺进，直到完全进入。");
         }
         get_player().buttChange(25,true,true,false);
         outputText("当你感觉到兽人巨大的肉棒将你撑得如此之大时，你又发出了一声呜咽。[say:你真是个合格的肉便器，男孩。太适合给我配种了。]他轻笑着，用温暖的舌头舔舐你的脸颊。罗加将大部分粗长的肉棒埋入你体内后，拔出到只剩龟头，然后再次猛插进去，稳稳地将自己越来越多的部分送入你体内。他滴落的精液带来的热量和触感，在你肠壁上温暖地蔓延，开始让你无法招架。感觉到他占据了你的内里，让你在极乐中呻吟出声。[pg]");
         outputText("你忍不住将注意力集中在罗加的肉棒在你体内跳动的奇妙感觉上。也许这就是你的归宿？让你的屁股被罗加巨大的工具刺穿？当罗加加快速度时，你大声呻吟，他的臀部撞击你的力量大到让你的身体在床单上移动。他真的开始猛烈地捣弄你的小穴，伴随着粗重的喘息和呻吟，他将肉棒完全没入你的体内；他的龟头每次抽插都会顶到你的前列腺，让你因为电流般的快感窜上脊背而叫出声来。你身体里的每一根神经都像圣诞树一样亮了起来，让你的整个身体都在快感中扭动。你感觉到精液开始从你的[cocks]中喷涌而出，先列腺液涂满了你的肚子。");
         if(get_player().hasLongTail() || get_player().hasTailInsteadOfLegs())
         {
            outputText("你的尾巴仍然紧紧抓着罗加的手臂，用力收紧。");
         }
         if(get_player().balls > 0)
         {
            outputText("当你感觉到高潮临近时，你的[balls]猛地收紧。[say:找到你的敏感点了，男孩，]罗加窃笑着，用他的肉棒摩擦你的前列腺，那根滚烫的肉棒以你喜欢的方式在你的身体里运作。你感觉自己完全任由这个高大的兽人摆布。[say:为我射出来，]他咆哮着，嘴唇压在你的嘴唇上，撬开你的嘴，舌头和他的肉棒一起侵入你的口腔。他的臀部撞击着你，阴囊随着每一次抽插拍打着你翘起的臀瓣，他一次又一次地撞击着你的敏感点。你在兽人的嘴里呻吟，用你自己的精液涂满自己，你的大脑因为这充满快感、汁水四溢的高潮而变得模糊。你的身前滴满了你的精液，而罗加继续蹂躏着你的男孩小穴。[pg]");
         }
         if(get_player().ass.analLooseness < 3)
         {
            outputText("[say:真他妈紧……]罗加在接近极限时咆哮道。");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("[say:是时候给你好好配种了，男孩！]他的声音让他的胸膛隆隆作响，他喘着粗气，热气抚摸着你的脸。皮肤拍打的声音在你的耳边回响，你短暂地注意到你的[ass]因为罗加的臀部撞击而感到红肿和疼痛，然后闭上眼睛迎接另一次令人愉悦的抽插。伴随着一声严厉的咆哮，他的下巴占有欲极强地咬住你的肩膀，肿胀的阴囊收紧。很快，你的下半身就被你逐渐喜欢上的温暖所淹没。罗加的种子完全填满了你，麝香般的精液涂满并弄脏了你的小穴。你体内积聚起一股压力，湿润的精液从你的穴口喷出，顺着你翘起的臀瓣滴落。罗加咬紧牙关喘着粗气，度过了他的高潮，又在你体内抽插了几次，直到他把沉甸甸的睾丸里的最后一滴精液都排空。[pg]");
         }
         outputText("他疲惫地叹了口气，松开了咬着你肩膀的下巴，躺在你身边的床上。你们俩花了一点时间来平复呼吸。除了沉重的喘息声，你什么也听不见，直到罗加坐起身来。伴随着你们两人疲惫的喘息声，你花了几分钟来平复呼吸。罗加深情地蹭了蹭你，然后让你站起来，扶着你直到他确定你能站稳。你们俩交换了一个心照不宣的眼神，罗加对你咧嘴一笑。[say:你太棒了，[name]。随时欢迎你来。]当你收拾好东西，迈着摇晃的双腿走向门口时，他给了你一个温柔的拥抱，你仍然能感觉到精液顺着你的腿流下来" + (get_player().armorDescript() != "gear" ? "，在你的衣服下面" : "") + "。兽人挥手向你告别，露出满口牙齿的笑容。[pg]");
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(2));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_telAdre() : TelAdre
      {
         return get_game().telAdre;
      }
      
      public function fuckRogarsButtPussyBoyCuntManMoundSissySlitQueerQuim() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你急切地点点头，兽人又抚摸了你一下作为奖励。[say: 那么……我们走吧，] 他说道。你们俩沿着沙漠城市的街道走着，直到来到一栋隐蔽、偏僻的建筑前，上面写着“钢铁霍根公寓”，罗加带你上了他的房间。他打开门为你留着，但你做了一个手势，让他先进去。当他走进去时，你猛地把门关上。伴随着身后的关门声和魁梧兽人惊讶的表情，你盯着他，告诉他是时候让他知道在这段关系中谁才是真正的男孩了。罗加脸上露出了困惑的表情。");
         if(get_player().get_tallness() < 72)
         {
            outputText("你伸出一只手托住他的下巴，粗暴地将它拉向你的脸，同时在它的嘴唇上印下一个吻。");
         }
         else if(get_player().get_tallness() > 84)
         {
            outputText("你伸出手托住罗加的下巴，粗暴地将它拉起，让他的嘴唇撞上你的嘴唇。");
         }
         outputText("你的舌头固执地压在他的嘴唇上，兽人呻吟着，催促你更进一步，你将空出的手滑下去摸索他的腹股沟，毫不羞耻地抚摸着他的凸起。罗加因为你的直接而脸颊泛起石灰绿色的红晕。[say: [name]……] 罗加打断了吻，用你听过的最温顺的声音低语，尽管你用手指按住他的嘴唇让他安静。你把手伸进罗加的短裤里，淫荡地抚摸着罗加的肉棒和睾丸，感觉到那根绿色的怪物在你的手下开始肿胀。但你的目标在更低的地方，当你把手滑到罗加沉重的阴囊下和他的双腿之间时，你找到了他紧致的兽人小穴。你用指尖在上面摩擦，发出一声响亮的低吼，同时你的吻变得更加粗暴。当你急切地用手指按压那个洞时，你咬住了他的下唇；兽人在你的触摸下颤抖着。你慢慢地把他推到卧室，两人迅速脱掉衣服。[say: 我从来没见过你这样……] 罗加说着，但你用一声有力的咕哝打断了他，把他推倒在床上。[pg]");
         outputText("把手按在罗加的身体上，感觉到指尖下的粘液在皮肤上燃烧，你爬过俯卧的兽人，坐在他的胸膛上，将你的腹股沟对准他的脸。你抓住他光滑的后脑勺，把他的脸按在你张开的双腿之间，发出一声响亮而满足的呻吟。[pg]");
         if(get_player().cor > 70 && get_player().hasVagina())
         {
            outputText("罗加将舌头伸向你的[cocks]，但你有一个更好的主意，将他往下推，引导他来到你的[vagina]。他困惑地抬头看着你。从他把嘴移开的方式，你可以看出他宁愿不把脸埋在那里，但你催促他；告诉他开始舔，你把臀部压在他的脸上。他的头被夹在你的双腿和床之间，他的嘴别无选择地贴在你的" + get_player().vaginaDescript(0) + "上。他不满的呜咽声让你脸上露出了笑容，你用你的下体嘴唇在他的嘴上摩擦。他不情愿地伸出舌头舔舐你的阴阜。你因为这种关注而颤抖，变得湿润光滑，滴落在罗加的嘴上。当你粗鲁地强迫他取悦你的小穴时，兽人发出一声厌恶的呜咽，而当他不情愿的舔舐让你兴奋时，你发出一声响亮的呻吟；兴奋之余，你抚摸着你的[cock]。罗加把注意力集中在那上面，看着你变得僵硬肿胀，他的眼睛跟着你抽动的手。你慷慨地将光滑、流着口水的先列腺液涂抹在[eachcock]上，当你取悦自己时，你的阴道壁紧紧夹住他的舌头，用手将粘液涂抹在你的肉体上。你低下头，对他露出恶魔般的笑容。[pg]");
         }
         else if(get_player().cor > 70)
         {
            outputText("罗加用舌头舔舐你的" + get_player().multiCockDescriptLight() + "，但你有一个更好的主意，将他往下推，引导他来到你的" + get_player().assholeDescript() + "。伴随着充满欲望的低吼，罗加袭击了你的后穴，舌头在表面盘旋，从你的嘴唇中哄出愉悦的呻吟。你因兴奋而变得僵硬，将手顺着你的肉棒滑下，用几次挑逗的抚摸来回应你燃烧的欲望。当你用手动作时，你将从[cocks]中流出的先列腺液涂抹成一层均匀的精液。罗加看着那只抽动的手，很快就从他的工作中分心了，他的舌头慵懒地贴在你的[asshole]上。你低下头，对他露出恶魔般的笑容。[pg]");
         }
         outputText("从罗加的脸上退开，你感觉到整个身体都在期待中抽搐。你将[hips]贴在他肌肉发达的屁股上，将你勃起的肉棒对准他紧致的后庭，同时你的手在坚实的肌肉脸颊上摸索，急切地将它们分开。[pg]");
         if(get_player().longestCockLength() < 4)
         {
            outputText("[say: 你认真的？] 罗加挑起一根眉毛问道。当他突然站起来盯着你的眼睛时，你眨了眨眼。[say: 不是我想无礼，[name]，但我什么感觉都不会有。] 你忍不住感到有点被冒犯，说了些关于大片水域运动的话。罗加似乎并不相信，他把额头埋在手掌里。[say: 听着，现在不是做这个的好时机。我已经失去兴致了。你下次再来，好吗？] 说完，你被尽可能礼貌地请了出去。当你走在城市街道上时，你忍不住感到有点尴尬，就好像这是一种耻辱游行。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().shortestCockLength() > 18)
         {
            outputText("[say: 慢、慢点……] 罗加居然结巴了，担忧地看着你。对他来说你太大了，尽管你巨大的龟头在罗加绿色的洞口上摩擦着先列腺液，但就是进不去。你发出一声恼怒的咕哝，开始在罗加的身体和兽人肉棒上摩擦你的长度。伴随着充满欲望的咕哝声，罗加将他的臀部顶向你的[cocks]，将僵硬的肉棒摩擦在一起，它们互相泄漏、流口水。[pg]");
            if(get_player().cockTotal() > 1)
            {
               outputText(get_player().SMultiCockDesc() + "在罗加的胸前每一寸肌肤上摩擦，他深橄榄色的皮肤浸透了你闪闪发光的体液。罗加的阴茎迷失在你肉棒的丛林中。他的绿色巨兽受到多角度的攻击，并且在尺寸上相形见绌，他轻声呜咽着。[say: 从来没感觉过这种东西。简直就像在操一根鸡巴。]");
            }
            else
            {
               outputText("你的" + get_player().multiCockDescriptLight() + "顶撞着罗加作为兽人的骄傲。两根坚硬的肉棒紧紧贴在一起，你的尺寸让罗加相形见绌。你用你的[cocks]摩擦他的兽人阴茎，并用力发出咕噜声；你的手伸下去紧紧抓住这两根阴茎，用力挤压并快速套弄着。");
            }
            if(get_player().balls > 0)
            {
               outputText("罗加在你身下扭动，他的胸膛因呼吸困难而起伏，而他充满麝香的阴囊紧紧贴着你的阴囊。");
            }
            outputText("他伸出手，汗湿的手掌包裹住他肉乎乎的阴茎，粗暴地掐住它，然后匆忙地沿着他的阴茎套弄，他呻吟着，精液溢出[eachcock]，让它被滚烫的精液浸透。你自己的手将罗加气味浓烈的精液涂抹在自己身上，用他的欲望包裹你的[cocks]。看到身下起伏的兽人，你被推向了边缘，你压抑已久的精液飞溅在罗加汗湿的身体上，用你浓稠的精液覆盖了兽人。");
            outputText("[pg]");
         }
         else
         {
            outputText("[say: 慢、慢点。] 罗加竟然结巴了，担忧地看着你。当你粗暴地压入罗加皱缩的小穴时，你的嘴唇卷起一抹邪恶的笑容。你伴随着一声突兀的咕噜声滑入，无视罗加因突然进入而发出的痛苦叫喊，并推断这应该不会太痛，因为你的[cock]实际上已经涂满了先列腺液。但你仍然觉得按下兽人的按钮让他扭动一次很有趣。滑入更深，你将自己埋入罗加的小穴中，直到他呻吟出声，并过早地将更多兽人精液喷射到他的肚子上。");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("你在他的绿色小穴中摩擦，倒刺在罗加的内壁上起作用。[say: 什、什么鬼？] 罗加咕噜着，你看着他在你身下扭动。你挺动臀部，每次抽插都更深地刺入兽人的肉体，他的肌肉臀部随着你臀部的每次撞击而紧绷。");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("你[cock]膨大的龟头冠状沟依偎在罗加的小穴中。当你推入时，他的呼吸加快，粗大、膨大的龟头冠状沟不可思议地撑开了罗加的内壁。你只是挺动臀部，在绿色小穴中深入，每次都迫使你长长的肉棒更多地穿过那朵橄榄色的玫瑰花蕾。[pg]");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("你尖锐的顶端轻松滑入，你开始深入罗加的深处，魁梧的兽人发出满足的咕噜声，他强壮的手伸下去抚摸自己。你开始填满他的兽人小穴，预先润滑的肉棒作为润滑工具，你开始在罗加体内建立一个良好的节奏。随着高潮的临近，你的肉结膨胀起来，并开始撞击罗加的绿色小穴，紧致的圆环无法让你进入，因为你肿胀得越来越大。");
            }
            else
            {
               outputText("撑开罗加的兽人小穴，你深深地刺入他火热、紧致的深处。魁梧的兽人喘着粗气，湿润的空气从他长着獠牙的嘴里飘出。他肌肉发达的腹部起伏着，每一次呼吸都突出了你臀部的抽插。你粗暴地操着他的屁股，拔出直到只有龟头留在他体内，然后再比以前更深地刺入。随着每一次进展，罗加在胸腔里发出低沉的咕噜声，他强壮、长满老茧的手抚摸着他流着口水的阴茎。[say: 嗯，[name]，] 当你最终将自己完全埋入他体内时，他呻吟着。");
            }
            outputText("[pg]你抓住他的臀部，开始保持稳定的节奏，肉体响亮地拍打着他肌肉发达的屁股。当你捣入他的兽人小穴时，他粗壮有力的双腿在空中抽搐，随着你对他进行的每一次残酷抽插，兽人的脚趾都明显地卷曲起来。你呻吟着，因为他的麝香让你的[cocks]在他体内跳动得更加厉害。为了进一步羞辱他，你在他尖尖的耳边低语，他包裹着你的肉棒感觉有多好。他羞得满脸通红，然后你在他屁股上粗暴地拍了一下，让他呻吟出你的名字。");
            if(get_player().cockTotal() > 2)
            {
               outputText("你的其他肉棒在那结实的兽人臀部上摩擦，在他的皮肤上流下口水，让他的后庭闪烁着你性爱的光芒。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("你的另一根肉棒在那结实的兽人臀部上摩擦，在他的皮肤上流下口水，让他的后庭闪烁着你性爱的光芒。");
            }
            outputText("你决定看看你能让他叫得多大声，并开始在他体内深深地撞击。抽插的力度大到足以让罗加的背部拱起，你球状的龟头每次没入都会戳到他深埋的前列腺。他的大手疯狂地拍打着他巨大的兽人阴茎，发出紧张的呻吟声，他沉重的阴囊紧紧地贴在他绿色肉棒的根部。兽人的精液飞溅到他的胸前，打在他的下巴上，溅在他起伏的胸肌上。他的精液聚集在他隆起的肌肉之间，溅在他的头上。当你加快粗暴操弄的步伐时，罗加的肛门壁紧紧地夹住你；你的[cock]被用力地榨取，你感觉到你的高潮正在迅速逼近。汗水从你的身体滴落到罗加的皮肤上，你终于感觉到自己到达了边缘。伴随着一阵狂喜，你完全没入你的兽人性玩具中。");
            if(get_player().hasKnot(0))
            {
               outputText("你的肉结强行穿过罗加紧致的肛门环，在他体内跳动，将你们俩结合在一起。");
            }
            if(get_player().balls > 0)
            {
               outputText("伴随着臀部短促的抽动，你开始将你积蓄的精液卸入兽人的体内。");
            }
            outputText("一波又一波浓稠的精液从你的肉棒溢出进入罗加体内，他的头因这种幸福的感觉而后仰。");
            if(get_player().cockTotal() > 1)
            {
               outputText("外面摩擦着他橄榄色皮肤的其他肉体增加了精液的涂层，把罗加的身体弄得一团糟。几秒钟内，他在你的[cocks]下就像一个高薪的妓女。");
            }
            outputText("[pg]");
         }
         outputText("罗加涂满精液的身体在你身下喘息着。你慢慢变软，无力地躺在他橄榄色的皮肤上，然后拉开距离，把自己清理干净。罗加慢慢地动了动，只坐了起来" + (get_player().armorDescript() != "gear" ? " 当你穿好衣服的时候" : "") + "。[say: 那真是……太棒了。我真的不知道你怎么了，[name]，但你真的知道怎么给伙计一个惊喜。] 你带着狡黠的笑容说这是他自找的" + (get_player().armorDescript() != "gear" ? " 然后穿好衣服" : "") + "，然后走过去用手拍打罗加涂满精液的屁股。这个巨大的兽人愣了一下，然后露出了顽皮的笑容。[say: 活泼，不是吗？] 他在隆隆作响的胸腔里低声窃笑，然后站起来向你挥手告别，但你已经走出门，带着轻快的步伐回到了城市。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function frotWithRogar() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,411,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你任由自己被领进罗加的公寓，环顾四周布置简朴的休息室。罗加在软垫椅上坐下。[say: 谢谢你来。我想你了，]他窃笑着，你靠得更近了。他长满老茧的手伸下来托住你的[ass]。他对着你傻笑，这个活泼的兽人低沉地笑着，紧紧地捏着。你以在罗加肌肉发达的臀部上狠狠地打了一巴掌作为报复。他低声咆哮，回应了挑战，将他的嘴唇撞向你的嘴唇。当你们互相脱衣服时，你们俩都发出了沉闷的咕哝和呻吟。很快你们就赤身裸体地站着，罗加粗大的肉棒压在你的[cocks]上。[pg]");
         if(get_player().cockTotal() > 1)
         {
            outputText("感觉到你的长度在罗加坚硬的绿色怪物上变硬，你顶撞着罗加坚硬的渴望，用你的肉棒包裹它，诱哄兽人发出淫荡的呻吟。罗加感觉到他的兽人长度被包围，他绿色的阴茎被你从多个方向的先列腺液涂抹，他咆哮着。他的手臂环绕着你，当他操你的" + get_player().multiCockDescriptLight() + "时，将他的兽人肉棒在你所有的长度之间摩擦；他将他的獠牙压在你的脖子上吸吮，牙齿摩擦着肉体，而他的舌头滑过它们留下的凹痕。罗加让你后退，你感觉到身后有一堵坚硬的墙。他涂满油的身体在你的身体上摩擦，涂抹在你的胸部、手臂和臀部。当你的" + get_player().multiCockDescriptLight() + "在他身上摩擦时，你的手紧紧抓住罗加的背。罗加伸出手，用手指包裹住他的长度和离它最近的肉棒，然后慢慢地抚摸它们。当他深深地凝视着你的眼睛时，热气扑面而来，深蓝色的水池被欲望笼罩，当你们互相操着对方的下体时。你们两人的身体混合着汗水和先列腺液，很快你们的腹股沟就变得粘稠而有光泽。你们把肉棒操在一起，强烈的男人麝香气味充满了你的鼻子，让你的脊背发抖，腹股沟一阵战栗。罗加突然呻吟起来，他的兽人肉棒夹在你的" + get_player().multiCockDescriptLight() + "之间，当他在你的胸膛上卸下时。他沉重的阴囊在他的肉棒下紧紧收缩，当他将浓稠的精液洒在你身上时，用他无数的绳索覆盖着你。当你达到极限时，热量温暖了你的皮肤；你的每一个[cocks]都在抽搐，滚烫粘稠的精液溅在罗加橄榄色的皮肤上。[pg]");
         }
         else
         {
            outputText("你的肉棒紧紧压在罗加粗大的兽人肉棒上。当他在你身上摩擦时，他低声咆哮，他浓稠的、成团的先列腺液滴在你的[cocks]上。当你粗暴地吻他时，罗加的嘴里发出了沉闷的呻吟，舌头一直锁在扭动的战斗中。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]拍打在罗加沉重的绿色阴囊上，发出清晰可闻的声音。");
            }
            outputText("每一次抽插都比上一次更顺滑、更好，因为你们的龟头在彼此的长度上滴下大量的先列腺液，两个男子汉气概在狂野的野兽般的发情中滑溜溜地向对方挺进。罗加让你后退，你感觉到身后有一堵坚硬的墙。他油腻的身体在你的身体上摩擦，涂抹在你的胸部、手臂和臀部，当你在兽人身上摩擦时，你的手紧紧抓住罗加的背。罗加伸出手，用手指包裹住他的长度和你的长度。他用粗糙、长满老茧的手抚摸着它们，当他深深地凝视着你的眼睛时，热气扑面而来。深蓝色的水池被欲望笼罩，当你们互相操着对方的下体时。你们两人的身体混合着汗水和先列腺液，很快你们的腹股沟就变得粘稠而有光泽。你们把肉棒操在一起，强烈的男人麝香气味充满了你的鼻子。罗加突然呻吟起来，他的兽人肉棒紧贴着你，当他在你的胸膛上卸下时。他沉重的阴囊在他的肉棒下紧紧收缩，当他洒下浓稠的精液时，用他无数的精液绳索覆盖着你。当你达到极限时，热量温暖了你的皮肤；你的[cocks]抽搐着，滚烫粘稠的精液溅在罗加橄榄色的皮肤上。[pg]");
         }
         outputText("你们俩靠在墙上喘着粗气。你设法抬起头对兽人微笑，抚摸罗加沾满精液的胸膛，用手指涂抹你自己的精液；兽人也用他胸膛上的精液对你做同样的事。你将沾满精液的手指浸入他的嘴里，他也对你做同样的动作，然后陷入了一场由欲望驱动的、带有精液和唾液味道的亲热中。当你打破这个湿漉漉的吻时，你可以感觉到你们光滑、沾满精液、疲软的肉棒紧紧贴在一起。伴随着一声大笑，你打破了拥抱。当你们穿好衣服准备离开时，愉快的笑容在你们之间闪烁。罗加保持赤裸，在门口向你挥手告别，身上仍然沾满精液。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lust(20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ewwwRogarIsGay() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你简短地拒绝了，站起身走向门口，尽力无视罗加失望的表情。他在你身后呼喊，但你充耳不闻，迅速关上门，双腿在沼泽中飞奔，用尽全力奔跑。直到回到营地，你才意识到你弄丢了那张粗糙的地图……要么掉在罗加的小屋里，要么掉在无迹可寻的沼泽里了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,410,1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function encounterRogarSwamp() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) == 0)
         {
            outputText("在沼泽中漫步时，你踩到了一块松软的地面；你努力保持平衡，但还是摔倒了，脸朝下栽进了湿透的泥炭里，陷了进去。伴随着不满的咕哝声，你设法在污泥中挣扎着站了起来，你沾满泥巴的头和手臂再次露出了厚重的黏液表面。" + (get_player().armorDescript() != "gear" ? "你能感觉到湿气渗透了你的衣服，让布料紧紧贴在你的身上。" : "") + " 还没等你擦去眼睛上的污垢，在泥泞中吧唧吧唧的脚步声就靠近了，很快，一只粗糙的绿色大手抓住了你的肩膀，把你从沼泽里拉了出来。你咳嗽着，吐出嘴里的污垢，一只大手拍着你的背帮你顺气。在咳嗽的间隙，你擦了擦眼睛，勉强看清了你的“救命恩人”。站在那里的是一个有着橄榄绿皮肤的庞然大物；他肯定有七英尺多高，他那光秃秃的脸正饶有兴趣地上下打量着你。[say: 哎呀，看看你。不喜欢吃土吗？] 男人咧嘴笑着打趣你，露出一排排锋利的牙齿，上唇还突出了小獠牙。尽管他咧嘴笑着，还用手拍着你的背，但他给人的感觉远比迷人要吓人得多。他那强壮的大手叉在破烂的短裤上方，骄傲地挺起赤裸的胸膛。你的目光从他的笑容下移，掠过他隆起的胸肌和紧绷的肌肉腹，他凸起的腹肌就像在绿色皮肤的海洋下游泳的肥鱼。你继续往下看，目光顺着他的身体游走。甚至他赤裸的双腿也长满了肌肉，当你的目光扫过他的小腿时，男人胸腔深处传来了隆隆的声音。[say: 以前没见过兽人吗？] 甚至随后的笑声也充满了男子气概。[say: 我是罗加，就住在这片沼泽里。我大半辈子都住在这儿。以前我经常和短吻鳄摔跤，后来它们就越来越难找了。][pg]");
            unlockCodexEntry(2050,false,true);
            if(get_player().sexOrientation < 50 ? get_player().lib + get_player().cor > 120 : get_player().lib + get_player().cor > 50)
            {
               outputText("你向他点点头，擦去身上的污泥，然后皱着眉头看着自己。罗加若有所思地咕哝着，再次打量着你。[say: 我的房子就在那边。这附近除了我没别人，但我能给你找点东西擦擦脸。] 罗加再次露出友好的微笑，但他那排可怕的牙齿却破坏了这种姿态。尽管徒劳，你还是试图无视那些牙齿，对他的慷慨报以微笑。罗加粗壮的手指指着地面。[say: 你就在这儿等着，我马上回来，] 他说着转过身，随意地在泥泞中小跑着。你真的应该等他吗？[pg]");
            }
            else
            {
               outputText("你透过脸上的污泥甜甜地笑着，向他靠近。兽人顺着你的视线看去，露出了困惑的表情。你忍不住注意到他那同样可怕的隆起，把破烂的短裤撑得不成样子。很容易看出他现在还是疲软状态，因为粗壮的肉棒在湿漉漉的布料下，弯曲在肿胀的阴囊的黑色阴影上。罗加不自在地揉了揉脖子后面，尽管交流很尴尬，但他短裤里的轮廓在他说话时开始变长变粗。[say: 听着……你脏得很，我想如果你在这儿等的话，我能给你找点东西清理一下。] 罗加的手指指着你站的地面。[say: 我马上回来。你就在这儿等着。] 他转过身，迅速离开了。");
               if(get_player().hasTailInsteadOfLegs() || get_player().tail.type > 0)
               {
                  outputText("你的尾巴高兴地甩来甩去。");
               }
               outputText("你真的应该等他吗？");
            }
            doYesNo(waitForChunkyOrcLoe,dontWaitForRogar);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) == 1)
         {
            outputText("你手里拿着地图，在沼泽里转了很长时间，眯着眼睛看着罗加为你画的粗糙涂鸦。你忍不住停下来挠挠头，开始怀疑自己是不是彻底迷路了。[pg]");
            if(get_player().get_inte() <= 30)
            {
               outputText("几个小时过去了，持续的努力依然没有结果，很明显，你确实完全迷路了。当你在一些较深的水域中跋涉时，巨大的水花声和咕哝声越来越大。暴力的声音让你毛骨悚然。你来到沼泽中的一片空地，当你绕过一个巨大的树干时，你看到两个男人在沼泽水中扭打。两人都浑身是泥，泥水滴落在他们身体的每一寸肌肤上。其中一个用手臂锁住另一个的脖子，被压制的人咆哮着挣扎着想要挣脱。你睁大眼睛看着两人摔跤。在比赛过程中，你可以清楚地看到他们为了让对方屈服而使用的野兽般的力量。水让两人粗壮的身体变得光滑，你的眼睛忍不住追踪着从他们的二头肌、紧绷的腹肌之间，以及宽阔背部的肌肉群上滑落的每一道水流。当他们咕哝着挣扎着把对方压倒时，他们巨大的肌肉紧绷着。[pg]");
               outputText("最终其中一个占据了上风，将另一个压在身下，强迫他躺下并保持不动。当被制服的男人筋疲力尽的身体最终向胜利者屈服时，他们喘着粗气。胜利者发出一声恶毒的咆哮，抓住战败者的身体，将他扔出几英尺远，扑通一声落在泥里。战败的男人慢慢挣扎着站起来，而胜利者则指着他，威严地大喊。[pg]");
               outputText("[say: 滚！][pg]");
               outputText("你睁大眼睛，因为你认出了那个声音！你从藏身处走出来，想靠近一点。你一边靠近一边呼喊，但滑倒在一根湿漉漉的树根上，向前踉跄了一下。在你感受到泥土湿润的拥抱之前，一双强壮的手抓住了你的胸膛，让你站稳了。[pg]");
               outputText("[say: 慢点。] 罗加窃笑着，等你站稳后放开了你。[say: 你呃……都看到了？] 他问道，声音中带着一丝羞涩。你点点头，目光顺着他的身体向下扫去，刚好看到了一些让你的脸涨得通红的东西。罗加显然很享受摔跤，以至于他的短裤因为他巨大而饱满的勃起而搭起了帐篷，湿透的布料被撑得很薄，你可以看出他橄榄色的肉棒在短裤里痛苦地弯曲着。你一定盯着看了太久，因为罗加用力咳嗽了一声，把你的注意力拉了回来。[say: 只是……领地事务。] 他咕哝着，给了你一个露齿的安慰微笑。[say: 你是来找我的吗？][pg]");
               outputText("你点点头，解释了你的情况。罗加发出一阵爽朗的笑声，肚子也跟着笑得发抖。[say: 可怜的家伙。那走吧。这边。] 他带着你朝可能是他小屋的方向走去。不幸的是，他那明显的勃起在路上消退了。当你们俩到达他的小屋时，你注意到他的短裤又变得宽松多了。[pg]");
            }
            else
            {
               outputText("花了一些时间，你终于在沼泽深处找到了一个隐藏的小屋。当你仔细观察它时，你会发现它使用了一些基本的伪装来躲避潜伏在沼泽中的其他野兽。如果你没有地图知道它在这里，你很容易就会错过它，继续徘徊几个小时。你走近小屋，用指关节敲打着似乎是入口的简陋木门。过了一会儿没人回答，你好奇地试着推开门。令你惊讶的是，门竟然开了！[pg]");
               outputText("罗加？你对着小屋里喊道，慢慢走进去，并确保关上身后的门。尽管位于沼泽中心，小屋内却有一种家庭般的温暖感。总而言之，很舒适。小屋里配有基本的木制家具，如桌子、椅子和床。虽然这些陈设做工粗糙，但看起来确实很结实。当你把这里当成自己家时，你走过桌子，用手抚摸着它光滑的表面，闻到油灯燃烧的烟味弥漫在空气中，照亮了房间。当你走近查看床铺时，你发现上面铺着粗糙的布。它看起来很舒服，虽然明显很脏。床边散落着精液的污渍，结成了厚厚的干涸精斑。你仍然能闻到最近射出的精液的腥臭味。");
               if(get_player().lib >= 50)
               {
                  outputText("你的下体燃烧起来");
               }
               else
               {
                  outputText("你皱起鼻子");
               }
               outputText("看着罗加欢愉后的残留物，你在心里暗想，这个兽人一定很孤独。你猜想有人很多个夜晚都在这里独自娱乐自己。[pg]");
               outputText("你身后的门砰的一声开了。伴随着一声惊呼，你转过身，面对着门口非常愤怒的罗加。兽人朝你的方向咆哮。[say: 谁——哦！是你！] 当他认出你时，他的声音慢慢低了下来。[say: 你……你来了？] 他问道，听起来很震惊。你用惊恐的声音解释了你是怎么来到这里的，但在罗加身边待得越久，你就觉得越舒服。当你解释完时，罗加咧嘴笑了。[say: 对我的把戏来说太聪明了，不是吗？很高兴再次见到你。][pg]");
            }
            outputText("[say:欢迎来到我的小避风港。]罗加在小屋里张开双臂欢迎你。你微笑着，礼貌地称赞罗加舒适的住所。兽人高兴地咧嘴一笑，然后伸出强壮的双手抓住你的肩膀。[say:随便坐。]还没等你抗议，他就拉出一把椅子，把你按在上面。等你坐稳后，兽人转身在小桌子的另一边翻找东西。[say:在这儿呢……]他低沉的声音隆隆作响，拿出一大瓶深色液体和两个杯子。他砰的一声把它们放在桌子上，拔掉瓶塞，倒了两大杯，然后把其中一杯推向你。[say:不是最好的，但我只有这个了。]他紧张地笑着，手里拿着自己的杯子看着你。[if (ischild) {你脸上闪过一丝怀疑，罗加突然在椅子上震了一下。[say:哦，你不是兽人！我呃，我觉得其他种族的年轻人酒量没那么好，如果你受不了这玩意儿，你可以拒绝。] }]不管是出于礼貌，还是因为你突然想起自己口渴了，你拿起杯子喝了一口。强烈的味道刺激着你的舌头，灼烧着你的喉咙。你强忍着咳嗽，喘着粗气咽了下去。罗加咧嘴一笑，轻松地干了自己那杯，然后走过来坐在床沿上面对着你。[say:我突然想起来，我还不知道你的名字。这么久了，我都忘了问你。]你告诉了他，他露齿一笑。[say:[name]，是吧？很高兴认识你。][pg]");
            if(get_player().biggestTitSize() >= 2 && get_player().lib >= 50)
            {
               outputText("随着你喝得越来越多，你的思绪开始飘忽不定。");
               if(get_player().get_inte() <= 30)
               {
                  outputText("回想起罗加之前那副欲火焚身的样子，你感觉到下体升起一股热流。");
                  if(get_player().hasVagina())
                  {
                     outputText("当你目睹他仅凭力量就让另一只野兽屈服时，你的[vagina]在比赛中产生了一种强烈的渴求，而现在的回忆也起到了同样的作用。");
                  }
                  if(get_player().hasCock())
                  {
                     outputText("当你回想起在树后你硬得有多厉害时，你感觉到[eachcock]在抽动，你发现自己正心不在焉地用张开的手掌抚摸着自己，先列腺液已经浸透了你的衣服。");
                  }
                  outputText("当两人战斗的记忆在你的脑海中燃烧时，你开始谨慎地取悦自己，尽量不让自己扭动得太明显。[say:抱歉让你看到刚才那一幕。]罗加的脸涨成了黄绿色，你心不在焉地对他微笑着。[say:他靠得太近了，所以我不得不让他退后。]罗加又喝了一口杯子里的酒，你安慰他，从椅子上滑下来，把杯子放在桌子上。你的嘴唇卷起一抹坏笑，要求进行一场私人的较量……[pg]");
               }
               else
               {
                  outputText("从你坐的地方，你可以看到床上干涸的精液污渍。它们厚厚地结在布料上，只有那种巨大、乳白色的精液团才能留下这样的痕迹，那种你在一次火热、漫长的口交后能感觉到滑下喉咙的精液。[say:你来找我之前没看到什么吧？]罗加慢慢地问，蓝色的眼睛探究地看着你。你的目光扫过肮脏的床单，咧嘴一笑，他喝到一半的酒呛得咳嗽起来。[say:一直想洗来着……]他尴尬地说。你慢慢地摇了摇头，从椅子上站起来，坐在他旁边，靠得更近，一只手沿着他强壮的腿滑动。带着狡黠的笑容，你问罗加他能不能也把你弄脏。[pg]");
               }
               outputText("罗加看着你，眨了眨眼。他把杯子放在一边，笑了。[say:抱歉，亲爱的，但你不是我喜欢的类型。不过你人真好。]你因为他的拒绝而失望地皱起眉头。[say:你不是那种能喝酒的人，对吧？]他继续说道。[say:早该知道这酒对你来说太烈了。抱歉。你应该睡一觉醒醒酒。]眨眼间，你发现自己被温柔但迅速地请出了罗加的小屋。门在你身后关上，伴随着一句[say:保重，]你被留在沼泽里，脸上带着困惑的表情。也许你真的喝多了。你在回营地的路上跌跌撞撞，又吃了一嘴泥，带着满心的失望。[pg]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,2);
               dynStats(DynStat.Lust(30));
               doNext(get_camp().returnToCampUseTwoHours);
               return;
            }
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你一边漫不经心地和罗加聊天，一边咧嘴笑着。");
               if(get_player().get_inte() < 30)
               {
                  outputText("罗加为在你面前为了领地而摔跤道歉。");
               }
               else
               {
                  outputText("罗加为他的小屋有多乱而道歉。");
               }
               outputText("你只是咧嘴一笑，对他的礼貌摇了摇头。[say:我已经很久没和正经人说过话了。]罗加笑着说。很快你们俩的杯子都空了。你坐在那里忍不住因为酒精而摇晃，这酒比你以前喝过的任何东西都要烈。罗加对你发出一阵爽朗的大笑，显然很享受你喝醉的样子。[say:你看起来不像酒量很大的人。]罗加看着你摇晃的样子，得意地笑了。你皱着眉头，向他保证你能应付，同时在句子中夹杂着小小的打嗝声，这让你们俩都大笑起来。[say:你知道吗，我在这片沼泽里待了太久了。我开始渴望去外面的世界看看，寻找更绿的草地，你懂我的意思吧。听你讲你旅行的故事也一点帮助都没有。]他的语气很遥远，听起来几乎是对自己感到失望。他咕哝了一声，站了起来。[say:你看起来需要睡一觉了。]他扶你站起来；你设法保持平衡，走到门口。[say:你没事吧？]他打量着你问道。你带着傻笑向他保证你没事。[say:那好吧。]当你转身离开时，罗加对你点了点头。[say:保重。]他眼中带着关切看着你走远，但你顺利地回到了营地。[pg]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,2);
               doNext(get_camp().returnToCampUseTwoHours);
               return;
            }
            if(get_player().lib < 50)
            {
               outputText("你一边漫不经心地和罗加聊天，一边咧嘴笑着。");
               if(get_player().get_inte() < 30)
               {
                  outputText("罗加为在你面前为了领地而摔跤道歉。");
               }
               else
               {
                  outputText("罗加为他的小屋有多乱而道歉。");
               }
               outputText("你只是咧嘴一笑，对他的礼貌摇了摇头。[say:我已经很久没和正经人说过话了。]罗加笑着说。很快你们俩的杯子都空了。你坐在那里忍不住因为酒精而摇晃，这酒比你以前喝过的任何东西都要烈。罗加对你发出一阵爽朗的大笑，显然很享受你喝醉的样子。[say:你看起来不像酒量很大的人。]罗加看着你摇晃的样子，得意地笑了。你皱着眉头，向他保证你能应付，同时在句子中夹杂着小小的打嗝声，这让你们俩都大笑起来。[say:你知道吗，我在这片沼泽里待了太久了。我开始渴望去外面的世界看看，寻找更绿的草地，你懂我的意思吧。听你讲你旅行的故事也一点帮助都没有。]罗加向后靠在床上，放松地躺着。[pg]");
               outputText("当你环顾小屋时，你注意到了一些以前没见过的东西。地板角落里塞着一个水桶和一条毛巾。这让你想起了你们的第一次相遇，你转向罗加，感谢他之前帮助了你，这让他也咧嘴笑了。[say:没问题。在这片沼泽里很容易把自己弄得一团糟。]罗加轻声轻笑。你的目光游移在他皮肤上结块的污垢上；");
               if(get_player().get_inte() < 30)
               {
                  outputText("那场在沼泽里的战斗留下的痕迹依然残留在他的身上。");
               }
               else
               {
                  outputText("这让你想知道罗加在忙些什么。");
               }
               outputText("罗加顺着你的目光看去，然后他的眼睛[if (ischild) {露出惊恐的神色，然后|闪烁着异样的光芒，}]他窃笑起来。[say:想不想……还个人情？]他[if (ischild) {尴尬地|狡黠地}]对你眨了眨眼，目光在水桶和你之间来回扫视。");
            }
            else
            {
               outputText("随着你喝得越来越多，你的思绪开始飘忽不定。");
               if(get_player().get_inte() < 30)
               {
                  outputText("回想起罗加之前那副欲火焚身的样子，你感觉到下体升起一股热流。");
                  if(get_player().hasVagina())
                  {
                     outputText("当你目睹他仅凭力量就让另一只野兽屈服时，你的[vagina]在比赛中产生了一种强烈的渴求，而现在的回忆也起到了同样的作用。");
                  }
                  if(get_player().hasCock())
                  {
                     outputText("当你回想起在树后你硬得有多厉害时，你感觉到[eachcock]在抽动，你发现自己正心不在焉地用张开的手掌抚摸着自己，先列腺液已经浸透了你的衣服。");
                  }
                  outputText("随着两人战斗的记忆在你的脑海中燃烧，你开始谨慎地取悦自己，尽量不让自己扭动得太明显。[say:抱歉，之前让你看到那场面了。] 当你心不在焉地对他微笑时，罗加的脸涨成了黄绿色。[say:他靠得太近了，所以我不得不让他退后。] 罗加又从他的杯子里喝了一口，你解释说没关系，并在把杯子放在桌子上之前在椅子上挪动了一下。[say:不如你给我按摩一下，然后我给你来一场你自己的“私人比赛”？] 罗加用一个古怪的笑容和胸腔里的隆隆声来强调这个奇怪的请求。[pg]");
               }
               else
               {
                  outputText("从你坐的地方，你可以看到床上干涸的精液污渍。它们在布料上很厚，厚到只能是巨大、浓稠的精液团留下的，那种在一次火热、漫长的口交后，你能感觉到滑下喉咙的精液。[say:你在我之前来的时候，没看到什么吧？] 罗加慢慢地问，他蓝色的眼睛探寻地看着你。当你咧嘴笑时，你的目光扫向了肮脏的床单，他喝饮料喝到一半咳嗽了起来。[say:一直想洗洗它们的……] 他尴尬地说。你慢慢地摇了摇头，安慰他，这似乎给了他足够的勇气提出下一个建议。[say:你帮我清理一下，然后我把你弄脏怎么样？] 罗加长长的兽人舌头诱人地舔过他的嘴唇。[pg]");
               }
            }
            sexyChoices();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) == 2)
         {
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你再次使用地图前往罗加的棚屋，之前那次旅行的记忆让这次的路程顺畅了许多。然而，当你敲门时，却没有得到任何回应。事实上，棚屋里静得可怕。试着转动把手，你发现门没有锁。你往里看，发现不仅安静黑暗，而且少了很多东西。罗加不见踪影，他大部分的随身物品也不见了。环顾四周，你没有发现任何遇险或挣扎的迹象。似乎他没有发生任何事。也许他搬走了？不管怎样，他现在不在这里，而且看起来他短期内也不会回来了。当你走回营地时，你想知道是否还能再见到他。");
               doNext(get_camp().returnToCampUseOneHour);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,3);
            }
            else
            {
               outputText("凭着记忆，你来到了罗加的门前。你用拳头轻轻敲了敲，很快你就听到了粗糙的门另一边传来的脚步声。门“啪”的一声开了，迎接你的是一个露出参差不齐、剃刀般锋利牙齿的灿烂笑容。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,408) == 2)
               {
                  outputText("[say:[name]，你跑得可真快，] 他窃笑着说。这个笑话并不好笑，当你茫然地盯着他时，这个兽人似乎脸红成了黄绿色。在继续说之前，他用手揉了揉脖子后面。[say:抱歉。那之后我真是累坏了。][pg]");
               }
               outputText("[say:进来吧。] 罗加伸出一只手，欢迎你进去。你迅速坐下，双臂交叉");
               if(get_player().lib > 50)
               {
                  outputText("放在你那散发着麝香、不断胀大的");
                  if(get_player().hasCock())
                  {
                     outputText("隆起");
                  }
                  else
                  {
                     outputText("乳头");
                  }
               }
               outputText("上。[say:我一直想跟你谈谈，] 罗加从桌子对面开始说。他把双臂放在桌子上，转过头看着你，然后继续说。[say:我计划离开这个地方已经有一段时间了，我想如果你没来，我可能就毫无头绪地离开了。] 他叹了口气，然后继续说。[say:我一直在找一个地方安顿下来，周围都是能接受我这种人的人。你找到过这样的地方吗？] 罗加转过整个身子面对你，眼中带着期待的神情。[pg]");
               if(!get_game().telAdre.isAllowedInto())
               {
                  outputText("你向罗加道歉；你的脑海中对这个问题一片空白。兽人失望地撅起了嘴。[say:我想我可以一直流浪，直到找到一个地方……] 你摇了摇头，建议他留在他已经安顿好的这里，但承诺你会留意任何可能适合他的地方。罗加对这个保证露出了笑容，他撅起的嘴变成了一个咧嘴笑。[say:你真是太好了！] 他粗壮的双臂隔着桌子给了你一个熊抱。你在剩下的时间里都在和这个魁梧的兽人聊天，小心翼翼地避开任何可能激起他流浪欲望的话题。[pg]");
                  doNext(get_camp().returnToCampUseOneHour);
               }
               else
               {
                  outputText("你提到了你以前去过的一座城市，你认为像罗加这样的大个子会很适合那里。当你向他描述特尔阿德雷城时，他的脸变得更加沉思，一只大手摸着下巴。[say:听起来你去的那个地方挺不错的，不过那里水不多，是吧？] 你点了点头，对这个问题感到有些不安。这座城市位于沙漠中央，尽管他的眼神很坚定，但这显然让他感到困扰。[say:你觉得我能走完这趟旅程吗？][pg]");
                  if(get_player().get_inte() >= 30)
                  {
                     outputText("经过片刻的头脑风暴，你突然想到了一个帮他穿越沙漠的主意。你解释了那些比较敏感的当地人是如何穿戴带兜帽的斗篷来保护自己免受烈日暴晒的。[say:太聪明了！] 罗加大声说道，站起身来，用他巨大的双臂紧紧地给了你一个熊抱。当他兴奋地挤压你时，你发出了一声轻微的喘息。他最终放开了你，尽管你的脊背因为麝香汗味而感到刺痛。[pg]");
                     dynStats(DynStat.Lust(15));
                  }
                  else
                  {
                     outputText("发现自己想不出好主意，你皱起了眉头。罗加咕哝了一声，手指若有所思地耙过他光滑的脑袋。[say:如果我能避开太阳就好了……] 他的双臂交叉在胸前，粗壮的二头肌因为沮丧而弯曲。突然，你用张开的手掌拍了一下额头，一个主意浮现在脑海中！你建议罗加只在夜间旅行，以避开烈日。兽人皱着眉头看着你，看起来几乎认为你很愚蠢。[say:我不知道在没有阳光的情况下，我能不能在天亮前找到那座城市……我不能穿点什么来遮阳吗？] 好吧，你确实见过一些城市居民穿着宽松的带兜帽的斗篷，你接下来建议了这一点。[pg]");
                  }
                  outputText("[say:那我就给自己做一件吧。呃……] 他从椅子上站起来，在棚屋里走动，翻找着他的随身物品。[say:我想我可以用这个做点什么……] 他拿出一条备用的床单，开始用刀粗糙地裁剪起来。你想知道他是故意把所有东西都做得这么粗糙，还是他没有灵巧的双手来制作任何赏心悦目的东西。[say:该死的布料……能帮我一把吗？] 兽人说道，向你露出羞涩的笑容。你帮了他一段时间，经过大量的缝纫、裁剪和戏弄，你们俩为罗加庞大的身躯制作了一件足够大的带兜帽的斗篷。[say:我看起来怎么样？] 他试穿时摆了个姿势，站在那里展示着他的肌肉。尽管罗加的模特步很滑稽，但这件粗糙的斗篷让他在这块布料下显得很神秘，兜帽刚好遮住他的眼睛，在人群中很难将他分辨出来。当你盯着他看时，这个大兽人轻笑了起来，很快你们俩都笑了起来。[pg]");
                  outputText("[say:你会来找我的，对吧？我到了那里之后？] 罗加把手放在你的肩膀上问道。你迅速点了点头。[say:好，那我们就在那里见。][pg]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,408) == 1)
                  {
                     outputText("你暂时留下罗加，让他继续收拾东西。");
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,3);
                     doNext(get_camp().returnToCampUseOneHour);
                  }
                  else
                  {
                     outputText("当你走出门口时，突然感觉到手腕被紧紧抓住，迫使你转过身来。");
                     if(get_player().get_tallness() < 48)
                     {
                        outputText("一双手勾住你的腋下，轻轻地将你举起。");
                     }
                     if(get_player().get_tallness() >= 84)
                     {
                        outputText("一只手搭在你的肩膀上，拉着你低下头。");
                     }
                     outputText("嘴唇贴上你的，你尝到了罗加长长的兽人舌头在弹动，试图哄骗着进入你的嘴里。伴随着一声微弱的呻吟，你张大嘴巴，与他唇齿相依，双眼在幸福中闭上。你双臂环抱住兽人的脖子，双手蜷缩着抱紧他。他那双强壮的手小心翼翼地放在你的[hips]上，指尖用力按压着你的[ass]。两条舌头在你的嘴里纠缠，然后罗加慢慢退开。[say:谢谢你做的一切，[name]。保重。我会一直留意你的。]他带着一如既往的露齿笑容向你挥手告别。[pg]");
                     outputText("你穿过沼泽向营地走去，一路上除了下体的燥热外，没有遇到任何问题。");
                     dynStats(DynStat.Lust(30));
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,407,3);
                     doNext(get_camp().returnToCampUseOneHour);
                  }
               }
            }
         }
      }
      
      public function dontWaitForRogar() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("时间流逝，罗加依然没有出现。你觉得坐着等他纯属浪费时间，于是决定出发，希望能找到些有趣的东西。[pg]");
         outputText("然而，你只找到了更多的泥巴。你回到了营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,410,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function brobrobrobro() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rogar());
         outputText("你跟着罗加回家，走进公寓，把手臂搭在兽人男子的肩膀上紧紧拥抱。[say: 很高兴见到你。你拿的是什么？] 罗加看着你[inv]里的罐子。[say: 兄弟特酿！我喜欢这东西。那是给我的吗？] 他窃笑着，在你反对之前抢走了它，然后和你玩起了躲猫猫，把罐子拽到够不着的地方。你想留着它吗？他危险而顽皮的表情表明，如果你试图抓住它，他打算对你恶作剧，它可能会洒出来——洒在你身上！[pg]");
         menu();
         addButton(0,"他妈的拿走",takeDatBroBrewFromDaBigMeanOlOrc);
         addButton(1,"逆反心理",rogarIsDumb);
      }
   }
}

