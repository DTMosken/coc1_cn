package classes.scenes.areas.desert
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class Oasis extends BaseContent
   {
      
      public function Oasis()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function oasisTalkDecline() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         clearOutput();
         outputText("你考虑了一下这个邀请，但还是尽力礼貌地拒绝了。这引起了队伍后面一个小恶魔般生物的咯咯轻笑，让你脊背发凉。你转身准备离开，但就在这时，你迎上了首领的目光。他的笑容变大了，仿佛他知道一些你不知道的事情。他故意放慢速度，开始轻笑起来，当你听到“愚蠢的生物。盛宴的邀请是不容拒绝的。把它活捉过来。”这句话时，你最坏的恐惧被证实了。[pg]");
         outputText("恶魔们开始充满威胁地围拢过来，你别无选择，只能准备自卫。");
         startCombat(new DemonPack());
      }
      
      public function oasisTalkAccept() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         clearOutput();
         outputText("首领露出了由衷的喜悦笑容，恶魔群中也响起了兴奋的叽叽喳喳声。“太棒了。距离上次有你这样的同类加入我们已经过去很久了。”在他身后，恶魔们开始脱下他们破烂的衣服，身体变硬，变得湿润，并舔着嘴唇。当首领走上前抚摸你身体的曲线和棱角时，你开始怀疑这场盛宴要满足的饥饿感并不是为了食物，但当恶魔们无声地蜂拥而至，你踉跄着退到滚烫的沙子上时，这一切都被抛到了脑后，");
         if(get_player().isTaur())
         {
            outputText("你的后腿失去平衡，重重地摔在侧腹上。");
         }
         else
         {
            outputText("双腿在这个过程中张开了。");
         }
         outputText("突然，一声尖锐刺耳的笑声打破了沉默，接着是一声嚎叫，恶魔们的动作开始加快。恶魔首领低沉的笑声如海浪般向你袭来，恶魔们发出狂热的尖叫，在绿洲的沙地上将你按倒。");
         if(!get_player().hasStatusEffect(StatusEffects.VoluntaryDemonpack))
         {
            get_player().createStatusEffect(StatusEffects.VoluntaryDemonpack,0,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.VoluntaryDemonpack,1,1);
         }
         doNext(oasisSexing);
      }
      
      public function oasisTalk() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         clearOutput();
         outputText("你小心翼翼地从那丛稀疏的小灌木阴影中站起身，打量着眼前排列整齐的恶魔们。你短暂地思考了一下在沙漠绿洲里该如何开启对话，最后决定用“今天天气真不错”作为开场白。恶魔们的反应各不相同。有的在笑，有的则是一脸茫然。那个穿着蛇皮斗篷、身材魁梧得有些夸张的首领仰起头，发出一阵低沉如雷鸣般的笑声。当他恢复平静后，他转过头，朝你露出了一个充满尖牙的致命微笑。“是的，”他说，“……很不错。”[pg]");
         outputText("到这里，你关于沙漠话题的储备已经耗尽，你突然意识到，也许在能结冰的地方破冰会更容易些。就在气氛即将滑向尴尬的沉默时，首领开口了。“你能在我们准备休息和享用盛宴的时候来到这里，真是太幸运了。也许你愿意和我们一起分享？”一阵恐慌闪过你的脑海，你在心里反复咀嚼着这句话。几秒钟后，你得出结论，“和我们一起分享”真的不可能是“成为一道美味的主菜”，于是你开始考虑留下来参加盛宴。仿佛察觉到了你的犹豫，首领再次开口。[say:我们已经很久没有举行过盛宴了，我们非常渴望。这次的盛宴规模宏大，如果你错过了这样的机会，那真是太可惜了。][pg]");
         outputText("<b>你是留下还是尝试离开？</b>");
         menu();
         addButton(0,"留下",oasisTalkAccept);
         addButton(14,"离开",oasisTalkDecline);
      }
      
      public function oasisSexing() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         get_player().slimeFeed();
         clearOutput();
         if(int(get_player().cocks.length) > 0)
         {
            outputText("你感觉到长着爪子的手抓住了");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的每一根");
            }
            outputText("你的[cocks]并开始上下套弄，随后另一个恶魔将它们推开，你");
            if(get_player().cocks[0].cockLength > 25)
            {
               outputText("感觉到你的" + get_player().cockDescript(0) + "滑进了一个地狱女孩湿滑的小穴里。当你的[cock]在她的阴道里插到底时，女恶魔舒服地呻吟喘息着，她开始像个一动不动的婊子一样骑在你身上，她那巨大的乳房随着她在你鸡巴上大幅度上下滑动而摇晃，仿佛要将你砸晕，她渴望填满她那如洞穴般的小穴。");
            }
            else
            {
               outputText("看到一个更小、更年轻的恶魔将她非常紧致的小穴降到你的[cock]上。虽然很紧，但她那几乎还是处女的小穴却湿得滴水。她的小穴插到底了");
               if(get_player().cocks[0].cockLength > 17)
               {
                  outputText("几乎没有多少插进她体内");
               }
               else if(get_player().cocks[0].cockLength > 12)
               {
                  outputText("大约插到了你[cock]的一半");
               }
               else if(get_player().cocks[0].cockLength > 6)
               {
                  outputText("几乎全部插进了她体内");
               }
               else if(get_player().cocks[0].cockLength <= 6)
               {
                  outputText("当她的小穴嘴唇碰到你[cock]的根部时");
               }
               outputText("并开始在你的肉棒上上下滑动，完全沉浸在狂喜中，像个廉价婊子一样呻吟着。对于这个领域的居民来说，她似乎相对未受腐化，身体紧致、结实，而且没有毛发。只有一对角暴露了她的污秽。想到你可能是她最初的几根鸡巴之一，你的脊背就一阵发麻。");
               if(get_player().cocks[0].cockLength > 6)
               {
                  outputText("意识到她的小穴正在你的[cock]上慢慢被撑开，这给你带来了一种只能用极其邪恶来形容的快感。");
                  dynStats(DynStat.Cor(1));
               }
               outputText("很快，这个苗条的肉便器开始高潮，迎来了她接连几次颤抖高潮中的第一次。当她在你的[cock]上高潮时，你邪恶地笑了，当她的眼睛翻白时，你知道好戏还在后头。");
            }
            outputText("很快，你颤抖着将精液泵入她的小穴深处，她尖叫着迎来了她众多高潮中的一次，而你也是第一次在她体内深处射精。");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("当你躺在那个饥渴的恶魔身下时，你的其他");
               if(int(get_player().cocks.length) == 2)
               {
                  outputText(get_player().cockDescript(1) + "是");
               }
               else
               {
                  outputText("肉棒被");
               }
               outputText("其他的手和急切的小穴接管了，这些小穴有的紧得让人发疼，有的像小孩子一样紧致，有的则大得离谱！");
            }
            outputText("[pg]");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().get_gender() == 3)
            {
               outputText("从你的肉棒往下，在你的双腿之间只有很短的一段距离，恶魔们就发现了新的玩具。");
            }
            else
            {
               outputText("恶魔们很快发现了你的" + get_player().vaginaDescript(0) + "，并急切地在你的入口处争夺位置，起初是用手，然后是各种各样的恶魔肉棒。");
            }
            if(get_player().vaginas[0].vaginalLooseness >= 5)
            {
               outputText("然而，所有这些争夺位置的努力都是徒劳的，因为那个长着巨大肉棒的首领已经把你标记为他的专属。这个宽阔的恶魔一看到你那大得离谱的小穴，就粗暴地把较小的恶魔推到一边，小心翼翼地将他那巨大的肉棒降到你那巨大的肉洞入口处。首领毫不迟疑，也没有任何仪式，直接将他那巨大的阳具插入你的体内，尽管这需要他全身的肌肉力量，但他开始前后抽插，填满你" + get_player().vaginaDescript(0) + "的每一[if (metric) {厘米|英寸}]。你感到一种久违的奇特疼痛，并意识到你的" + get_player().vaginaDescript(0) + "正在被他那简直令人恐惧的工具撑开。当他抽出时，肉壁带着一种奇特的弹性弹回，你突然想到，也许实际上不可能再有任何永久性的扩张了。没过多久，巨大的恶魔开始颤抖，然后射精了。他那沉甸甸的三颗睾丸将一波又一波的精液泵入你等待的阴户，直到你的肚子鼓起来，精液开始从你的小穴里喷涌而出，因为注入你体内的精液实在太多了。");
            }
            else
            {
               outputText("最终，其中一个恶魔胜出，将他那粗壮的狗鸡巴顶端抵在你小穴的入口处。他猛地一挺，将他的阴茎插入你的" + get_player().vaginaDescript(0) + "，开始在你的阴户里抽插。然而，其他恶魔也不甘示弱。你感觉到阴唇处传来一阵压力，毫无预兆地，第二根稍小一点的肉棒挤进了你已经被塞满的" + get_player().vaginaDescript(0) + "。");
               get_player().cuntChange(40,true);
               outputText("两根肉棒用力地抽插着你，直到你感觉到其中一根将滚烫的恶魔精液射满你的" + get_player().vaginaDescript(0) + "。最终，两根肉棒都在你体内释放，然后一前一后地滑出，但每次都有另一根肉棒取代它们的位置，所以你的小穴从来没有空过。");
            }
            outputText("[pg]随着涌入你" + get_player().vaginaDescript(0) + "的精液填满了任何没有被肉棒占据的缝隙，那种极度饱满的感觉越来越强烈。现在你已经完全无法控制自己，当你感觉到你" + get_player().vaginaDescript(0) + "的肌肉开始一次又一次地夹紧你体内的那团东西时，你差一点就晕过去了。最终，世界开始再次变得清晰，当你从无意识的边缘回来时，你带着一种极大的喜悦发现自己仍然完全被恶魔的肉棒填满，预示着还会有更多这种质量的高潮。");
            outputText("[pg]");
            get_player().knockUp(1,432,90);
         }
         if(get_player().get_gender() == 3)
         {
            get_images().showImage("demonmob-surround-herm");
         }
         else if(get_player().get_gender() == 2)
         {
            get_images().showImage("demonmob-surround-female");
         }
         else
         {
            get_images().showImage("demonmob-surround-male");
         }
         if(get_player().get_gender() > 0)
         {
            outputText("然而，恶魔们对你的每一个部位都感兴趣，不仅仅是你的胯部。");
         }
         outputText("很快，你感觉到手和肉棒在抓捏和戳刺你的[ass]，一点一点地向内移动并争夺位置，一根滑溜溜的肉棒停在你的[asshole]开口处。它停顿了一秒钟，然后直接潜入你等待的屁眼。");
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("你感觉到你屁股和小穴里的肉棒互相摩擦，你的下半身变成了一座摩擦的神庙。被这么多恶魔尽可能塞满的感觉几乎无法忍受，当你再次高潮时，你离晕厥只有[if (metric) {一掌之宽|几英寸的距离}]。");
         }
         outputText("肉棒又快又狠地操了你十几下，然后你感觉到它开始把精液泵入你被塞满的屁股，直到再也射不出为止。它从你的[ass]里滑出，很快被另一根取代，另一根射精后又被取代，这似乎成了一个无休止的循环。");
         get_player().buttChange(get_monster().cockArea(0),true);
         outputText("在你周围，你看到恶魔们陷入了他们所陷入的疯狂交配中。没有一个洞是空的，没有一根肉棒没有沉入某个生物的肉体中。呻吟声和尖叫声几乎具有传染性，你感觉到它们蒙蔽了你的大脑，让你想要更多、更猛烈。");
         dynStats(DynStat.Inte(-1),DynStat.Lib(1));
         if(int(get_player().breastRows.length) > 0)
         {
            if(get_player().biggestTitSize() > 1)
            {
               outputText("恶魔的手抓捏着你的" + get_player().allBreastsDescript() + "，嘴唇含住你的[nipple]，开始像没有明天一样舔舐和吸吮。");
            }
         }
         outputText("[pg]很快，连你的嘴也被一个女恶魔占据了，她把她那湿滑的蜜壶降到你的嘴唇上。你舔舐和吸吮着，而她在你的头顶上像个婊子一样呻吟。根本数不清她高潮了多少次，所以你只是放松地进入舔舐和吸吮的节奏，只有当你自己那令人骨头嘎吱作响的高潮打断时才会停下，因为恶魔对你身体其他部位的关注一次又一次地把你推向边缘。");
         if(get_player().get_pregnancyIncubation() == 0 && get_player().get_gender() > 1)
         {
            outputText("[pg]");
            outputText("你尽力在脑海中保持一个模糊的目录，记录什么东西进过哪里，但最终你根本无法记住填满你精液的恶魔肉棒的类型或数量。你屁股下面的沙子被从你溢出的" + get_player().vaginaDescript(0) + "中流出的精液弄湿了，而且有各种迹象表明还会有更多。[pg]");
         }
         if((get_monster().get_HP() < 1 || get_monster().get_lust() >= get_monster().maxLust()) && get_game().get_inCombat())
         {
            outputText("你操啊操，直到没有一个恶魔能满足你的需求。他们呻吟着、喘息着躺在绿洲的边缘，无法动弹。你带着一丝骄傲和极大的满足感审视着这些倒下的恶魔，你的身体因为耐力锻炼而感觉更强壮了。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(1.5));
            return;
         }
         if((get_player().get_HP() < 1 || get_player().get_lust() >= get_player().maxLust()) && get_game().get_inCombat())
         {
            if(get_game().desert.antsScene.playingHero)
            {
               outputText("你试图从强奸中救出蚁女，但环顾四周，你却找不到她的踪影。她一定已经安全逃脱了。任务……完成了？等等，那个忘恩负义的小婊砸居然把你留下来替她受罪！你的屁股会痛上一阵子，但更痛的恐怕是你的自尊心……");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,467,1);
               get_game().desert.antsScene.playingHero = false;
            }
            outputText("恶魔们像野兽一样操你，直到你再也射不出来。你身上的每一个孔洞都被填满，你一次又一次地高潮，直到在这般蹂躏下失去意识。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Generic");
            dynStats(DynStat.Tou(0.5),DynStat.Cor(3));
            return;
         }
         if(get_player().statusEffectv1(StatusEffects.VoluntaryDemonpack) >= 6 && get_player().hasVagina())
         {
            doNext(oasisBadEnd);
            return;
         }
         outputText("你和恶魔们“狂欢”了几个小时。痛苦、快感和疲惫交织在一起，无论你多么努力地想要保持清醒，你都无法集中注意力。你似乎在悬崖边缘徘徊了永恒那么久，直到一次比以往任何时候都要强烈的高潮像一堵坚实的墙一样击中你，你失去了意识。有一段时间，你在现实与虚幻中游离，发现自己的身体仍然是恶魔们关注的焦点，直到最后你醒来，发现那似乎永无止境的高潮终于停止了。环顾四周，你看到剩下的恶魔们只顾着互相操弄。你的身体因为被蹂躏而酸痛不已，仍然难以集中注意力，你收拾好衣服，悄悄溜走，留下他们继续这场狂欢的尾声。事后，你感觉自己就像刚跑完一场耐力赛，但你那被粗暴操弄过的身体上被磨破皮的敏感部位却在诉说着另一个故事。");
         get_player().orgasm("All");
         dynStats(DynStat.Tou(0.5),DynStat.Sens(0.5),DynStat.Cor(4));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(playerMenu);
         }
      }
      
      public function oasisRunAway() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         if(get_player().get_spe() > 15 && get_player().get_spe() / 2 > Utils.rand(40))
         {
            clearOutput();
            outputText("你从灌木丛下冲出来，在沙地上连滚带爬地逃跑。没过多久，追赶的沙沙声就消失了，回头一看，你看到那几个有胆量追你的恶魔正步履蹒跚地走回绿洲。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            clearOutput();
            outputText("你连滚带爬地想逃离恶魔，但太迟了。一个长着犬类" + (get_noFur() ? "耳朵" : "特征") + "的敏捷恶魔将你扑倒在地。幸运的是，当你滚到沙地上时，他松开了手，你滑了出来，站起身，转过身来面对那群带着恶意开始逼近的、面露淫笑的恶魔。");
            startCombat(new DemonPack());
         }
      }
      
      public function oasisEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         clearOutput();
         outputText("你在沙漠里徘徊了似乎好几个小时，在酷热中大汗淋漓。终于，你发现了一个被灌木丛和矮树包围的小水坑。如果不抓住这个机会喝点水、梳洗一下，在清凉的水里泡泡你的[legs]，那就太傻了，所以你在能找到的一点点阴凉处安顿下来，准备稍作休息。[pg]");
         outputText("在绿洲周围一丛灌木提供的稀疏阴凉处坐了一会儿后，你看到沙漠中隐约出现了几个身影。你注视着这些身影，它们变得越来越清晰，数量也越来越多，直到最后，一群隐约呈人形的轮廓从热浪中浮现出来。这些身影越走越近，细节也越来越清晰，当它们靠近你所在的小绿洲边缘时，你已经能看清它们的大部分特征了。[pg]");
         outputText("这群人大约由二十个棕褐色皮肤的恶魔组成，大部分是人形，群体中有着许多各种各样的腐化特征。你看到了恶魔的高跟鞋、扭曲的角和各种形状大小的摇晃着的鸡巴。甚至好像还有一个牛头混在里面。你还看到了许多乳房，从很小的到需要第二个人帮忙托着的都有，伴随着这些乳房的还有各种各样的阴户，有的湿润，有的干燥，有时还依偎在某种形式的恶魔鸡巴下面。这个小部落没有携带任何武器，他们穿的仅有的一点衣服也破烂不堪，除了一个强壮的男性，他宽阔的肩膀上披着一件似乎是蛇皮做的斗篷。从他的衣着和装备的大小来看，你猜测这个男性就是首领。他和其他人一样，精神状态很好，看起来都没有什么威胁性，尽管你已经学会了在这个地方不要相信任何看起来没有威胁性的东西。特别是如果它能把自己的鸡巴扛在肩上的话。[pg]");
         outputText("恶魔们直到靠得很近才注意到你，周围沙子的反光让你在灌木丛的阴影中很难被发现。他们无视了你，一心只想着绿洲里清凉的水，但你不可能永远躲着。一个小个子、目光敏锐的恶魔终于发现了你，发出一声警报，把你指给其他人看。现在，比二十个脑袋本应拥有的还要多的眼睛正直勾勾地盯着你。");
         outputText("[pg]<b>你该怎么做？</b>");
         menu();
         addButton(0,"交谈",oasisTalk);
         addButton(1,"战斗",chooseToFight);
         addButton(14,"离开",oasisRunAway);
      }
      
      public function oasisBadEndEpilogue() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         clearOutput();
         get_images().showImage("badend-demonmob");
         outputText("一年后");
         if(get_player().get_gender() <= 1)
         {
            outputText("和几剂发酵的魅魔乳汁");
         }
         outputText("...[pg]");
         outputText("自从你成为奴隶的那天起，已经过去了一年。你发现自己坐在主人的脚边，脖子上除了一个黑色的项圈外什么都没穿。你的肚子在身前高高隆起，里面装满了主人的孩子。你微笑着，很高兴能在这里取悦你的主人，并怀上他的骨肉，而关于你过去和任务的记忆则深深地褪色在你的脑海深处。你现在生活中唯一的任务就是毫无疑问、毫不犹豫地为你的主人和部落的其他成员提供他们所要求的任何服务。当部落准备下一次“盛宴”时，营地另一边的骚动引起了你的注意。守卫们带来了一个他们在绿洲里发现的游荡的人类俘虏，当你看着主人邀请这个陌生人加入他们的盛宴时，你黯然地笑了笑……");
         get_game().gameOver();
      }
      
      public function oasisBadEnd() : void
      {
         spriteSelect(SpriteDb.get_s_oasis_demons());
         clearOutput();
         get_images().showImage("demonmob-end");
         outputText("你和恶魔们“狂欢”了几个小时。痛苦、快感和疲惫交织在一起；无论你多么努力地想要保持清醒，你都无法集中足够的注意力来做到这一点。你似乎在悬崖边缘徘徊了永恒那么久，直到一次比以往任何时候都要强烈的高潮像一堵坚实的墙一样击中你。你失去了意识……[pg]");
         outputText("在与沙漠部落的最新一场狂欢中昏迷过去后，你醒来发现自己仍然赤身裸体地仰面躺着。");
         if(!get_player().isTaur())
         {
            outputText("你的双脚被镣铐锁住，不过链条足够长，让你有空间移动或行走而不会有任何问题。");
         }
         if(get_player().isTaur())
         {
            outputText("你的四条腿被镣铐锁住，不过链条足够长，让你有空间移动或行走而不会有任何问题。");
         }
         outputText("你的双臂也被绑在背后，不舒服地靠在炎热的沙漠沙子上。你可以看到部落正在收拾东西准备继续前进，你挣扎着想要坐起来，对抗着身上的束缚。[pg]");
         outputText("[say:我看到你醒了，奴隶，]首领在看着你站起来后说道，他嘴角挂着邪恶的冷笑，向你走近。他低头看着你，脸上带着满意的神情。[say:以为你会及时醒来再次偷偷溜走，是吗？好吧，那不会再发生了。][pg]");
         outputText("[say:你到底在说什么？我不是任何人的奴隶！]你愤怒地大喊，但当部落首领的手挥下来，狠狠地扇了你一巴掌时，你痛苦地叫了出来。你的头因为这一击的力量向后猛仰，成功地让你闭了嘴。[pg]");
         outputText("[say:以后不许再顶嘴了，奴隶。至于我在说什么……在经历了我们与你的所有遭遇之后，我的族人和我做出了一个决定。]首领的冷笑加深了，他弯下腰，紧紧抓住你的脸，强迫你抬头看着他。他用评估的目光打量着你，同时拿出一个带有一条长链条的黑色项圈，把它系在你的脖子上。他的另一只手伸向你的一个[nipples]，粗暴地抓住它，用力捏了一下，让你发出一声痛苦而愉悦的轻哼。他松开手，绕着你走，不断地打量你，从各个角度仔细审视你的身体。[say:我们决定，你会成为我们群体中极好的一员，并宣布你为我们的性奴隶……可以被我们以任何方式使用。]他在你面前停下来，继续说道，[say:我们很幸运能在你还昏迷的时候抓住你，在你偷偷溜走之前。我会亲自享受将你用于我自己的目的。也许一旦你被彻底驯服，我甚至会用你来怀我的孩子。][pg]");
         if(get_player().get_gender() == 3)
         {
            if(get_player().isTaur())
            {
               outputText("[say:每个人都会很乐意和你玩的，]首领说道，他盯着你的半人马身体，冷笑得更厉害了。他伸出手，狠狠地拍了一下你的[ass]，让你惊叫一声，迅速站了起来。当你站起来时，你的腿在镣铐的拉扯下有些踉跄。毫无预兆地，他把手指伸进你的[asshole]里，把它撑开，同时他空闲的手伸到你的双腿之间，玩弄着你的" + get_player().vaginaDescript(0) + "和[cock]。当你的肉棒在他的手中勃起时，你喘息着，愉悦地呻吟起来。他笑着松开手，退回到你面前。[say:而且我们可以像用驮兽一样用你来搬运我们的重物。你有完美的身体来做这件事。][pg]");
            }
            else
            {
               outputText("当他低头看着你那毫无遮掩的" + get_player().cockDescript(0) + "疲软地躺在双腿之间，贴着炎热的沙漠沙子时，他的冷笑加深了。你惊讶地喘息着，因为他突然弯下腰，紧紧抓住了你的[cock]。他抚摸着它，粗暴地捏了一下，当它在他的手中完全勃起时，你发出了性感的呜咽声。他笑着松开手，[say:我们的女孩们肯定会和你玩得很开心的，奴隶。][pg]");
            }
         }
         outputText("你恐惧地抬头看着首领，意识到目前你无能为力。你无法逃跑，因为你被锁住了，而且考虑到你根本看不到你的武器，战斗也是不可能的。有这么多恶魔在这里，你无论如何也跑不远。但即使在你考虑逃跑方法的时候，你内心的一小部分也对留在部落里，被他们尽可能久地使用和虐待感到兴奋。[pg]");
         outputText("[say:起来，开始走，我们现在就离开。别对你的处境表现得那么不高兴，奴隶，]首领说道，他低头看着你，冷笑加深了。");
         if(get_player().get_gender() >= 2)
         {
            outputText("他弯下腰抓住你的头发，把你拉起来，让你因为这猛烈的一拉而痛苦地叫了出来。");
         }
         outputText("他猛地拉了一下系在你脖子上的链条，强迫你跟在他后面走。当部落带着你开始向下一个目的地前进时，首领转向你。[say:你可能会发现成为奴隶比你想象的要好。如果你不渴望我们能提供的更多东西，你为什么还要不断回到我们身边并加入我们的狂欢呢？][pg]");
         outputText("你的脸因为他的话而羞得通红，你不情愿地顺从地跟在首领和部落其他人的后面。你在脑海中反复思考首领刚才说的话，不禁想知道如果你留在他们身边，你的未来会是什么样子。");
         doNext(oasisBadEndEpilogue);
      }
      
      public function chooseToFight() : void
      {
         startCombatImmediate(new DemonPack());
         spriteSelect(SpriteDb.get_s_oasis_demons());
      }
   }
}

