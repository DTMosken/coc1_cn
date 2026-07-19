package classes.scenes.areas.mountain
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SettingsGlobalFetishes;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class WormsScene extends BaseContent
   {
      
      public function WormsScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function wormsRun() : void
      {
         clearOutput();
         if(get_player().get_spe() > Utils.rand(35))
         {
            outputText("你的本能压倒了你，你立刻转身朝相反的方向拼命逃跑。你回头看去，感觉心脏都要跳出来了，却发现那生物并没有跟上来。你花了一点时间喘口气，觉得自己很幸运。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你转身想跑，但还没等你的[feet]带你离开，蠕虫就扑到了你身上！你转过身面对它们，以免它们扑向你毫无防备的后背。");
            startCombat(new WormMass());
         }
      }
      
      public function wormsPartiallyOn() : void
      {
         clearOutput();
         outputText("你耸了耸肩，继续往前走，不确定自己对这个奇怪的标志有什么感觉。");
         outputText("[pg]<b>如果你改变主意，可以在游戏设置的性癖菜单中进行切换。</b>");
         get_fetishSettings().parasites = 1;
         get_game().saves.savePermObject();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wormsOn() : void
      {
         clearOutput();
         outputText("你其实觉得这是个挺色情的想法，并在返回营地的路上好奇这片土地上是否真的存在这种生物。");
         outputText("[pg]<b>如果你改变主意，可以在游戏设置的性癖菜单中进行切换。</b>");
         get_fetishSettings().parasites = 2;
         get_game().saves.savePermObject();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wormsOff() : void
      {
         clearOutput();
         outputText("你厌恶地打了个寒颤，认为这个标志是某人变态幻想的产物。");
         outputText("[pg]<b>如果你改变主意，可以在游戏设置的性癖菜单中进行切换。</b>");
         get_fetishSettings().parasites = 0;
         get_game().saves.savePermObject();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wormsDoNothing() : void
      {
         spriteSelect(SpriteDb.get_s_dickworms());
         clearOutput();
         outputText("你什么也没做，任由蠕虫进入战斗范围！");
         startCombat(new WormMass());
      }
      
      public function wormsConfront() : void
      {
         spriteSelect(SpriteDb.get_s_dickworms());
         clearOutput();
         outputText("你转身面对蠕虫，战斗开始了！");
         startCombat(new WormMass());
      }
      
      public function wormToggle() : void
      {
         spriteSelect(SpriteDb.get_s_dickworms());
         clearOutput();
         outputText("在漫游时，你偶然发现了一个画得很粗糙的标志。上面画着一只明显很不舒服的小恶魔，身上爬满了白色的小蠕虫。看起来甚至有一只蠕虫正爬进小恶魔的阴茎里！");
         outputText("[pg]你对寄生虫有什么感觉？");
         menu();
         addButton(0,"唤情",wormsOn).hint("说实话，这景象出奇地让人兴奋。你将开始看到蠕虫，甚至可能还有其他寄生虫。");
         addButton(1,"谁在乎？",wormsPartiallyOn).hint("呃。谁真的在乎呢？你仍然会遇到寄生虫，但频率会降低。");
         addButton(2,"恶心",wormsOff).hint("绝不可能。这景象让你恶心，你再也不想看到类似的东西了。");
      }
      
      public function wormEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_dickworms());
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.MetWorms))
         {
            outputText("当你在探索时，一股相当刺鼻的泥炭味扑鼻而来。你听到远处传来奇怪的沙沙声和不平衡的吧唧声。当你探索这个区域时，你看到了一个极其怪诞的景象。在你面前是一团蠕动、扭曲的蠕虫！虽然通常是独居生物，但这些似乎已经聚集成了一个巨大的活体群落！[pg]");
            outputText("你以前从未见过如此奇异的自然畸形。你看到这团环节动物在你的路径上爬行。它停下来，稍微向你的方向蔓延，然后停止了。这团东西的恶臭难以形容，形成这个群体的无数蠕虫中的每一条都覆盖着一层厚厚粘稠的粘液。[pg]");
            outputText("你停下脚步，想知道这群虫子会做什么。在几个紧张的时刻之后，这团东西向着与你和你当前路径相反的方向爬走了。你松了一口气，因为你确信面对这种动物学上的灾难绝对没有好下场。");
            dynStats(DynStat.Lust(-10));
            get_player().createStatusEffect(StatusEffects.MetWorms,0,0,0,0);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(get_player().hasCock())
         {
            outputText("你管好自己的事，穿过山脉，发现自己被另一团病态的蠕虫挡住了去路。这群虫子停了下来，显然感觉到了你的存在，并短暂地向你的方向退去。在几个紧张的时刻之后，这团东西又开始移动了……以惊人的速度径直向你冲来！[pg]");
            outputText("你该怎么办？");
            menu();
            addButton(0,"对峙",wormsConfront);
            addButton(1,"什么也不做",wormsDoNothing);
            addButton(2,"逃跑",wormsRun);
         }
         else
         {
            outputText("在前进的路上，你又偶然发现了一大团恶心的蠕虫。无数挣扎的生物挡住了你前面的路。你再次僵在原地，看着这恐怖的怪物在地上摸索。它似乎对你的存在没有真正的兴趣，它朝着与你相反的方向前进，这让你松了一口气。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function playerInfest() : void
      {
         var _loc1_:* = null as Monster;
         clearOutput();
         spriteSelect(SpriteDb.get_s_dickworms());
         if(get_player().get_fatigue() + get_player().physicalCost(40) > get_player().maxFatigue())
         {
            outputText("你试图召唤一次高潮，但你太累了，白白浪费了时间！");
            get_player().changeFatigue(100 - get_player().get_fatigue());
            get_combat().startMonsterTurn();
            return;
         }
         if(get_monster().get_short() == "Izma")
         {
            get_player().changeFatigue(40,2);
            outputText("伴随着巨大的挤压感，你用意念控制身体排出一股充满蠕虫的精液。伊兹玛震惊地睁大了眼睛，她潜水并翻滚着躲开了这股洪流。[say:搞什么鬼！]她大喊道。[say:那就是那股味道吗？太恶心了！离我远点，[name]，我不想染上你那玩意儿。只要你身上还有那些恶心的东西，就别再跟我说话！]伊兹玛双手抓起她的储物柜，涉水走进湖里，用尾巴游走，同时把书举出水面。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,230,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,233,1);
            get_game().set_inCombat(false);
            get_game().combat.clearStatuses();
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_monster().hasStatusEffect(StatusEffects.TwuWuv))
         {
            outputText("你暴露了自己，试图集中精力将你蠕动的宠物排向希拉，但当你想象从[eachCock]发射出洪水般的寄生虫时，她发送给你的幻想又回到了你的脑海中，打破了你的注意力！你的手自动飞向你的胯部，抚摸着[oneCock]，想象着射进她的小穴里……你费了好大劲才把手拿开！[pg]");
            outputText("[say:哦，天哪，]恶魔调侃道。[say:你不需要自己自慰，[name]……我很乐意为你代劳。][pg]");
            dynStats(DynStat.Lust(5 + get_player().sens / 10),DynStat.NoScale);
            get_combat().startMonsterTurn();
            return;
         }
         get_player().changeFatigue(40,2);
         outputText("伴随着巨大的挤压感，你控制身体推出一团充满蠕虫的精液。你舒服地呻吟着，释放出你的体液，射向你的敌人。蠕虫和精液在空中飞舞，试图用你的新宠物覆盖你的对手。");
         if(get_monster().get_short() == "minotaur" || get_monster().get_short() == "imp")
         {
            if(get_monster().get_lust100() > 70)
            {
               outputText("你的精液冲刷着" + Utils.cnName(get_monster().get_short()) + "，[monster.he]猛地停下脚步，因为[monster.he]被呛到了，正试图清理掉[monster.his]脸上和鼻子里的精液以便呼吸。" + Utils.cnName(get_monster().get_short()) + "踉跄着，试图在你刚射出的精液坑中站稳，却很快一屁股摔在地上。蠕虫迅速占据上风，蜂拥在" + Utils.cnName(get_monster().get_short()) + "的" + get_monster().cockDescriptShort(0) + "周围。带着狂野的饥饿感，蠕虫轻易地钻进" + Utils.cnName(get_monster().get_short()) + "的尿道，开始进入你受害者的身体。" + Utils.cnName(get_monster().get_short()) + "开始剧烈抽搐，因为[monster.his]身体开始对这些蠕动的入侵者产生反应。" + Utils.cnName(get_monster().get_short()) + "很快达到高潮，精液四处飞溅，还夹杂着一些蠕虫。你歇斯底里地大笑，因为" + Utils.cnName(get_monster().get_short()) + "现在必须忍受你的新宠物提供的无尽高潮。你选择在倒下的敌人身上卸下最后一批，以确保良好的感染，然后走开，留下[monster.short]在无尽快感的地狱中。[pg]");
               get_monster().set_lust(100);
               get_combat().cleanupAfterCombat();
               return;
            }
            outputText("怪物看着你的表演，一边躲开，对你的行为感到有些恶心。[pg]");
            _loc1_ = get_monster();
            _loc1_.set_lust(_loc1_.get_lust() + 5);
         }
         else if(get_monster().get_short() == "lizan rogue")
         {
            outputText("蜥蜴人没有试图躲避你充满蠕虫的攻击。蠕虫猛烈地撞击他，顺着他的身体滑落，消失在地下，甚至没有试图感染蜥蜴人。也许它们更喜欢哺乳动物……");
         }
         else if(get_monster().get_short() == "anemone")
         {
            outputText("白色的浊液正中海葵的躯干，离她蓝色肉棒最近的蠕虫们毫不迟疑地朝它爬去。你们俩好奇地看着领头的蠕虫爬上她的阴茎，却一头撞上触手，晕头转向地滑落下来。女孩眼睛闪闪发光，抓起一把还在她肚子上蠕动的精液，贪婪地吸溜下肚。她吧唧着嘴说，[say:真有嚼劲！][pg]");
            _loc1_ = get_monster();
            _loc1_.set_HP(_loc1_.get_HP() + 20);
         }
         else if(get_monster().get_short() == "Volcanic Golem")
         {
            outputText("蠕虫还没碰到魔像的外壳就被烧焦了，在极度的高温下化为乌有。");
         }
         else
         {
            outputText("虽然你的体液用咸湿的欲望沐浴了[monster.short]，但蠕虫对你的敌人毫无兴趣，纷纷逃窜。[pg]");
         }
         awardAchievement("精液加农炮",81);
         dynStats(DynStat.Lust(-20));
         get_combat().startMonsterTurn();
      }
      
      public function nightTimeInfestation() : void
      {
         outputText("[pg]<b><u>那天晚上发生了一些奇怪的事情……</u></b>[pg]");
         outputText("你梦见了你感染蠕虫的时候……它们舒适的体积沉甸甸地待在你的体内，让你时刻保持着发情和强健，在每一个火热的瞬间，精液和滑溜溜的白色寄生虫几乎要从你的马眼里滴落下来。让它们进来，让它们占有你，成为你注定要成为的蠕虫宿主，感觉真是太棒了。你现在还能回想起有一条蠕虫顺着你的尿道滑进去的感觉，它小小的身体拖着粘液，在你的肉棒里蠕动着向目标前进。");
         outputText("[pg]嗯……那条小环节动物摩擦你内脏的感觉真是太棒了，而且从那以后感觉越来越好。在你让它们在体内安顿下来后，你也变得非常饥渴，很容易就能高潮。你只要……想象着把蠕虫射进某个毫无防备的恶魔脆弱的洞里，你的小宠物们就会刺激你的[balls]达到高潮。它们让你射得又快又猛！你现在还能感觉到体内的蠕动，虽然它越来越深，越来越深，就像第一次一样……");
         outputText("[pg]等等！你从幻想中惊醒，感觉到成百上千条蠕虫在[eachCock]上蜂拥而至。你的尿道");
         if(get_player().cockTotal() > 1)
         {
            outputText("已经");
         }
         else
         {
            outputText("已经");
         }
         outputText("敞开着，在成堆渴望精液的寄生虫面前毫无防备，当你震惊地看着时，你看到其中四条滑进了你塞满蠕虫的通道");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，一条接一条！不！你伸手去抓你的[cock biggest]，试图阻止这场寄生，但这毫无用处。你[legs]上的虫堆和你整个人一样大。更糟的是，你怀疑自己根本无法把那些已经爬进去的虫子拔出来。");
         outputText("[pg]你双手紧紧抓住[oneCock]，手指捏住");
         if(get_player().cocks[get_player().biggestCockIndex()].cockThickness >= 6)
         {
            outputText("尽可能紧地环绕着它的周长");
         }
         else
         {
            outputText("紧紧地握住你的阴茎");
         }
         outputText("，希望能将这蠕动的威胁限制在你勃起的上半部分。");
         if(get_player().cockTotal() > 1)
         {
            outputText("这只是徒劳，因为你的其他阴茎");
            if(get_player().cockTotal() > 2)
            {
               outputText("已经");
            }
            else
            {
               outputText("已经");
            }
            outputText("变成了");
            if(get_player().cockTotal() == 2)
            {
               outputText("一条");
            }
            outputText("寄生虫的高速公路");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("。");
            if(get_player().cockTotal() == 2)
            {
               outputText("它的");
            }
            else
            {
               outputText("它们的");
            }
            outputText("内部");
            if(get_player().cockTotal() > 2)
            {
               outputText("已经");
            }
            else
            {
               outputText("已经");
            }
            outputText("被湿润的蠕虫塞得满满当当。");
         }
         outputText("你能感觉到狭窄、锥形的头部正在推挤你捏紧尿道的地方，它们一次又一次地试图强行钻进去，而更多的同类则在后面堆积。你坚定地努力防止即将到来的感染，捏得太用力以至于感到疼痛，并因此叫出声来。你[cock biggest]上的压力与你身体对其他感觉的反应交织在一起。当一条又大又肥的蠕虫停在你的[cockHead biggest]上，在它周围滑行，留下一条黏糊糊的痕迹，并伴随着一阵阵愉悦的刺痛感传遍你僵硬的肉棒时，你的[cock biggest]剧烈地痉挛起来。");
         outputText("[pg]血液涌入你勃起的阴茎，让你的握力稍微松动，一条——不，两条蠕虫滑了进去。哦，不！它们在你体内蠕动得更深，小尾巴抽打着你敏感的、最深处的肉壁，它们每一次的动作都在按摩着，瓦解你的注意力。你的握力完全失效了，寄生虫的洪流毫无阻碍地流过你因快感而无力的手指。它们穿过你的尿道，一秒比一秒深入。与此同时，那条又大又重的蠕虫，可以说是这个小群落的国王，将它粗大的白色头部推入你的尿道口。当你被这昆虫般的入侵撑开，被彻底穿透时，你那摇摇欲坠的决心彻底粉碎了。较小的蠕虫已经开始进入你的前列腺，一旦到了那里，它们就开始痉挛，每一条都一次又一次地用头和尾巴拍打着这个敏感的器官。");
         outputText("[pg]你呻吟着，看着那膨胀的凸起顺着你的[cock biggest]往下移动，当它消失在你的胯部时，微微地抽动着，一旦它离开你的视线，感觉就强烈得多。就是这样……你现在肯定被寄生了。蠕虫在你的体内，它们会让你高潮。你躺在地上，你的[hips]徒劳地向上抽动，你闭上眼睛，屈服于这个事实：很快，你就会成为另一个发情的蠕虫工厂，四处游荡，一有机会就把它们喷射出来。那团巨大、滑动的肉块加入了你前列腺中的其他蠕虫，危险地撑开它，它开始颤抖，敲打着你最深处器官的内壁。");
         outputText("[pg]痛苦的压力和色情的恐惧随着你生殖器官中痉挛的狂喜的冲击而上升，当那个巨大的入侵者完全依偎在你体内，挤压你的器官，直到你哀号着挺动臀部，在你高潮时将[eachCock]拍打在你的肚子上时，达到了顶峰。你射出的精液出乎意料地多，溅在你的[chest]和下巴上，滴落在地上，形成粘稠的溪流。剩下的蠕虫群反应迅速，挤在你喷射的勃起阴茎上");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("吸收这感官的营养。它们中的一些甚至从两侧滑落，追逐着滴落的白色液体，以便在它被脆弱、荒芜的土地吸收之前得到它。你射了又射，几乎没有尽头，然而每一股浓稠的精液都立刻被吸入那蠕动的肉块中，只留下寄生虫那透明的粘液。");
         outputText("[pg]那只最大的在你精液中沐浴，移动得越来越快，刺激你释放更多。闪闪发光的精液从你的顶端流出，混合着一些白色生物，直到[eachCock]紧贴着你抽搐，因快感而痉挛，却无法再漏出一滴。只有在你倾尽所有之后，内部的前列腺按摩才平息下来，那令人不适的重量变成了一种稳定的跳动。它们感觉太棒了，一股满足的热浪慢慢席卷全身。母性的骄傲油然而生——这些东西现在是你的一部分了，喂饱它们的感觉真好。");
         outputText("[pg]你在余韵中放松下来，思考着该如何应对这种持续不断的欲望，几乎没有注意到那群生物正悄悄溜走，它们刚刚被你的体液润滑过。你带着强烈的欲望沉沉睡去，心不在焉地抚摸着[oneCock]。");
         outputText("[pg]<b>你又被寄生了！</b>");
         if(!get_player().hasStatusEffect(StatusEffects.Infested))
         {
            get_player().createStatusEffect(StatusEffects.Infested,0,0,0,0);
            dynStats(DynStat.Cor(0));
         }
         if(get_player().cor < 25)
         {
            dynStats(DynStat.Cor(2));
            get_player().cor = 25;
         }
         doNext(playerMenu);
      }
      
      public function infestOrgasm() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_dickworms());
         outputText("不速之客无休止的蠕动让你的身体陷入阵发性的痉挛。你瘫倒在膝盖上，立刻开始将大量的精液排出体外。你感觉到骨盆和肉棒里有巨大的压力，你意识到你正在随着每一次精液的喷发将蠕虫排出体外！一股又一股的精液冲破你身体的牢笼，带着你体内的一些蠕虫一起喷出。一旦高潮过去，你瘫倒在地上，彻底精疲力竭。在你晕倒之前，你感觉到那只肥大蠕虫不幸的存在依然留在你的体内。");
         get_player().orgasm("Dick");
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            if(get_player().statusEffectv1(StatusEffects.Infested) < 5)
            {
               get_player().addStatusValue(StatusEffects.Infested,1,1);
               var _temp_1:* = get_player();
               _temp_1.cumMultiplier = _temp_1.cumMultiplier + 0.5;
               if(get_player().statusEffectv1(StatusEffects.Infested) == 5)
               {
                  if(get_player().balls == 0)
                  {
                     outputText("[pg]在你排空自己之后，你感觉到身体发生了变化。那条大蠕虫的存在不再让你感到不适。就好像你的精囊变大了，以容纳你体内的新事物。同样地，你的射精量变得极其惊人，排出的蠕虫数量也增加了。你意识到那条大蠕虫已经成为了你的一部分，你现在可以像自己被寄生时那样去<b>寄生</b>你的敌人了。你现在需要的只是找个可怜的傻瓜，用你的新“宠物”淹没他们。");
                  }
                  else
                  {
                     outputText("[pg]你感觉到前列腺有一种尴尬的感觉。你感觉到那只肥大的蠕虫在疯狂地蠕动，引发了多次、泥泞的高潮，让你把精液喷得到处都是。过了一会儿，高潮和蠕虫的抽动停止了。你感觉到前列腺里有[ballcount]种不同的感觉，并感觉到身体两侧都有压力。现实打击了你。那只肥大的蠕虫已经分裂成了[ballcount]只较小的蠕虫！每只蠕虫都找到了进入你精囊的路，并顺着两侧的输精管往下推。你感觉到每只蠕虫都挤进了你的睾丸，它们立刻开始肿胀到惊人的大小。你的骨盆肌肉开始熟悉的有节奏的挤压，你看到你的阴囊以它特有的方式上下浮动，预示着即将到来的高潮。你的肌肉绷紧，你现在巨大的阴囊像老虎钳一样紧紧抓住你肥大、被感染的睾丸，一股巨大的固体精液从你的肉棒中喷射而出。你完全惊呆了，因为你竟然连续射精了五分钟！当高潮消退时，你在你制造的巨大精液坑里看到了一小群蠕虫，它们很快就爬走了。你意识到这个生物现在是你的一部分，如果你学会控制你的射精，你可以在战斗中利用这一点。");
                     var _temp_2:* = get_player();
                     _temp_2.ballSize = _temp_2.ballSize + 2;
                     var _temp_3:* = get_player();
                     _temp_3.cumMultiplier = _temp_3.cumMultiplier + 1;
                  }
               }
            }
         }
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function infest1() : void
      {
         spriteSelect(SpriteDb.get_s_dickworms());
         outputText("被困在蠕虫群中，你完全无能为力。它们在你身上不断地蠕动，带来的只有不想要的刺激。你的肉棒不知好歹地挺立起来，在蠕虫群中形成了一个凸起。蠕虫们立刻意识到了发生在你身上的事。一只特别肥大的蠕虫爬到了你阴茎跳动的龟头上。你感觉到它在你的尿道口周围试探，并惊恐地意识到，你宝贵的阴茎完全暴露在成千上万能够入侵你身体的生物面前！还没等你反应过来或诅咒自己的命运，那只肥大的蠕虫就迅速强行撑开你的尿道，开始往你的肉棒里钻！[pg]");
         outputText("你震惊地大叫出声，感觉到那只肥大的蠕虫一寸一寸地挤进你的尿道。你的神经就像圣诞树一样亮了起来，每一个细胞都在告诉你这个生物的存在，以及它正在向你身体深处移动。这只肥大的野兽轻易地找到了进入你前列腺的路，并在里面安顿下来。安顿好后，它开始在你的性器官里乱窜。感觉从震惊变成了怪诞的快感，因为你的身体只感觉到了能引发高潮反应的刺激。由于体内积聚的精液和入侵者的存在，你的腹股沟迅速抽筋并肿胀起来。显然对你的体液很敏感，你感觉到蠕虫又挣扎了几下，导致你的身体产生更多的精液作为回应。这只翻腾的生物迅速瓦解了你仅存的任何高潮控制力，伴随着一声尖锐的大叫，你将精液如长矛般射向空中，在一种病态的强制快感中将黏液和蠕虫一起喷射出来。在你排空体内的精液后，剩下的蠕虫变得极具攻击性。[pg]");
         outputText("由于感受到你的体液，许多较小的蠕虫兴奋地挤进你的阴茎。你的肉棒膨胀起来，因为蠕虫们争先恐后地想钻进你的体内，寻找让它们如此兴奋的乳汁源头。你的前列腺很快就被这些蠕动的生物填满了。肿胀的肉棒带来的不适感和对器官无休止的刺激导致你的身体产生更多的精液。然而，你发现自己无法达到高潮，因为入侵者停留在你的体内，淹没在你咸咸的欲望中。其余的蠕虫群散去了，它们已经完成了感染你身体的真正目标。[pg]");
         if(get_player().cor < 25)
         {
            dynStats(DynStat.Cor(1));
            get_player().cor = 25;
         }
         if(!get_player().hasStatusEffect(StatusEffects.Infested))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,787) < 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,787,1);
            }
            get_player().createStatusEffect(StatusEffects.Infested,0,0,0,0);
            if(get_player().hasPerk(PerkLib.ParasiteMusk) || get_player().hasStatusEffect(StatusEffects.ParasiteSlug))
            {
               outputText("这些具有攻击性的蠕虫显然已经摧毁了寄生在你前列腺里的寄生虫。[pg]");
               get_player().removePerk(PerkLib.ParasiteMusk);
               get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
               get_player().removeStatusEffect(StatusEffects.ParasiteSlugReproduction);
            }
            dynStats(DynStat.Cor(0));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function eligibleForWormInfestation() : Boolean
      {
         var _loc1_:Boolean = true;
         if(!get_player().hasCock())
         {
            _loc1_ = false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0 && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "")
         {
            _loc1_ = false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,951) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2207) > 0)
         {
            _loc1_ = false;
         }
         if(get_camp().campGuarded())
         {
            _loc1_ = false;
         }
         return _loc1_;
      }
   }
}

