package classes.scenes.areas.lake
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.UseableLib;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class GreenSlimeScene extends AbstractLakeContent
   {
      
      public function GreenSlimeScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function turnIntoGreenSlime() : void
      {
         get_player().orgasm("Vaginal");
         outputText("你在史莱姆柔软但沉重的拳头下倒下，头晕目眩，迷失了方向。怪物以惊人的速度扑向你，抓住你的脚踝，将你拉向它。当它把你拉到它的躯干上时，你试图挣脱，一时间害怕它会试图吸收你。这种恐惧很快就消失了，因为一根巨大的人类肉棒从怪物的躯干上长了出来，取而代之的是一种完全不同的恐惧，因为你意识到它打算做什么。");
         outputText("[pg]史莱姆用手臂环住你的双腿，将它们挤压在它的肉棒周围。它来回移动了几次，让它的阴茎滑过你的皮肤，沿着你的[vagina]摩擦。它的皮肤柔软如天鹅绒，微微湿润，并在身后留下一道细细的绿色液体痕迹。");
         outputText("[pg]随着你的[vagina]变得湿润，你开始感觉到下体一阵刺痛。毫无预兆地，怪物掰开你的双腿，将它的阴茎沿着你的胯部向后拉，停顿了一下，将顶端靠在你的私处。你既兴奋又焦虑地看着它，当它在那里停留片刻时，你强作镇定。这东西慢慢地压向你准备插入，你抓住了身下的草地。" + (get_player().hasVirginVagina() ? " 当肉棒刺破你的处女膜时，你咬住下唇，弓起背，一阵剧痛传遍全身。" : " 当肉棒刺入你的[vagina]时，你咬住下唇，弓起背，一阵强烈的快感传遍全身。") + "[pg]当它深入你的身体，完美地填满你内部的轮廓时，你发出一声结巴的喘息。当它这样做时，它在你的体内涂上了一层令人刺痛、舒缓的液体，迅速将你可能感觉到的任何疼痛转化为奇妙的快感。当怪物最终在你体内触底时，它剩余的长度似乎滑回了怪物的体内。" + (get_player().hasVirginVagina() ? "<b>你的处女膜破裂了，夺走了你的童贞。</b>" : ""));
         outputText("[pg]当史莱姆开始移动，慢慢地抽插你的[vagina]时，你微微弓起背。随着它速度的加快，少量这种东西的绿色液体在你的下体周围积聚，让你的皮肤感到刺痛，并让你充满了一种不同寻常的兴奋。过了一小会儿，怪物再次完全插入你体内并停了下来，你意识到在某个时刻你已经开始随着它移动你的臀部。你惊讶地喘息着，因为史莱姆的肉棒开始在你体内搅动，以一种独特而令人愉悦的方式从内部按摩着你。");
         outputText("[pg]没过多久，你就达到了高潮。你的整个身体都在颤抖，当快感传遍全身时，你弓起背。怪物将你紧紧拉向它，当它在你体内的动作变慢并停止时，它微微膨胀，然后在释放出一股稀薄、冰凉的液体之前，它的顶端膨胀了一秒钟。");
         outputText("[pg]浑浊的精液淹没了你充满幸福感的身躯，让你的腹部、四肢和头部都充满了蔓延的绿色。你忍不住抚摸着自己扭曲的身体，因为你体内腐化的史莱姆开始对你的体型施加其男性的影响。你的曲线冒泡并坍塌，因为你最后一点[skintone]粘液被腐化的史莱姆精液所吞没。当一切结束时，你女性化的史莱姆身体已经被雕塑成一个略显柔弱的男性。一个凸起从你的双腿之间升起，滴落成一根新鲜的、黏糊糊的肉棒。");
         get_player().createCock(18,2,CockTypesEnum.HUMAN);
         get_player().skin.tone = "绿色的";
         get_player().hair.color = "green";
         get_player().removeVagina(0,1);
         get_player().modTone(50,20);
         get_player().modThickness(50,20);
         get_player().modFem(30,100);
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
            get_player().removeStatusEffect(StatusEffects.Feeder);
            get_player().removePerk(PerkLib.Feeder);
         }
         outputText("[pg]被这种变化所淹没，你开始用力地套弄你新的[cock]。当你感觉到自己达到高潮时，你加快了速度，将精液如洪流般射向高空。心满意足后，你沉沉睡去。<b>你变成了一只雄性绿色史莱姆！</b>");
      }
      
      public function slimeVictoryRape() : void
      {
         if(get_player().cor <= 33)
         {
            clearOutput();
            if(get_player().get_lust100() < 60)
            {
               serviceLowCorruption();
            }
            else
            {
               serviceLowCorruptionHighLust();
            }
         }
         else
         {
            clearOutput();
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
            {
               maleRapesOoze();
            }
            else if(get_player().get_gender() > 0)
            {
               femaleRapesOoze();
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function slimeVictory() : void
      {
         var _g2:NaughtyNunsHabit;
         var _g1:Combat;
         var _g:NaughtyNunsHabit;
         outputText("你满意地笑了，因为[monster.short]倒下了，无法继续战斗。");
         if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            if(get_player().get_lust() >= 33 && get_player().get_gender() > 0)
            {
               outputText("[pg]你现在欲火焚身，想要强暴它，不过你更想看看你能往它体内喷多少奶。你打算怎么做？");
               menu();
               addButton(0,"哺乳",rapeOozeWithMilk);
               addButton(1,"强暴",slimeVictoryRape);
               if(get_player().get_armor() is NaughtyNunsHabit)
               {
                  _g = get_player().get_armor();
                  addButton(2,"膜拜肉棒",function():void
                  {
                     _g.naughtyNunCockWorship();
                  }).hint("通过对这只生物的肉棒的奉献来赞美你的主。");
               }
               if(get_player().hasMultiTails())
               {
                  addNextButton("强行梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
               }
               setSexLeaveButton();
            }
            else
            {
               outputText("[pg]你的乳头隐隐作痛，渴望强行给这只凝胶状的野兽哺乳。你要这么做吗？");
               _g1 = get_combat();
               doYesNo(rapeOozeWithMilk,function():void
               {
                  _g1.cleanupAfterCombat();
               });
            }
         }
         else if(get_player().get_lust() >= 33 && get_player().get_gender() > 0)
         {
            outputText("遗憾的是，你意识到你自己的需求并没有得到满足。当然，你总是可以和这个可怜的小东西玩玩……你要强暴它吗？");
            addButton(0,"操它",slimeVictoryRape).hint("强暴史莱姆。");
            if(get_player().get_armor() is NaughtyNunsHabit)
            {
               _g2 = get_player().get_armor();
               addButton(1,"膜拜肉棒",function():void
               {
                  _g2.naughtyNunCockWorship();
               }).hint("通过对这只生物的肉棒的奉献来赞美你的主。");
            }
            setSexLeaveButton();
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function slimeLoss() : void
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,234) == get_useables().RBRBALL.get_id())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,"");
         }
         clearOutput();
         doNext(playerMenu);
         if(get_player().get_gender() == 2 && get_player().isGoo())
         {
            turnIntoGreenSlime();
         }
         else if(get_player().get_gender() == 2 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            _loc1_ = Utils.rand(3);
            if(_loc1_ == 0)
            {
               oozeRapesYouVaginally();
            }
            if(_loc1_ == 1)
            {
               oozeRapesYouOrally();
            }
            if(_loc1_ == 2)
            {
               oozeButtRapesYou();
            }
         }
         else
         {
            _loc1_ = Utils.rand(2);
            if(_loc1_ == 0)
            {
               oozeRapesYouOrally();
            }
            if(_loc1_ == 1)
            {
               oozeButtRapesYou();
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function serviceLowCorruptionHighLust() : void
      {
         var _loc1_:Boolean = false;
         get_player().slimeFeed();
         outputText("你发现自己无法将视线从这只生物身上移开，它在你面前几乎像催眠一样起伏，你胯下的热度不断上升。它中间那根坚硬的突起明显地跳动着，你带着一丝微笑走近这团粘液，脱下了衣服。[pg]");
         outputText("你跨坐在生物的胸前，调皮地用手抚摸它那没有特征的阴茎顶端，触感湿润而柔软。");
         if(get_player().get_tallness() >= 82)
         {
            outputText("你用一只大手紧紧握住阴茎的头部，用拇指挑逗了一会儿龟头，然后挤压并滑动你的手到它的根部。");
         }
         else
         {
            outputText("你用手指在生物的阴茎上上下滑动了几次，然后紧紧地用双手包裹住龟头，并滑到它的根部。");
         }
         outputText("勃起的肉棒触感柔软且有弹性，每一次跳动似乎都填满了你手指间的缝隙。[pg]");
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("当你抚摸生物的肉棒时，你脑海中闪过将这东西插入你" + get_player().vaginaDescript(0) + "的想法，你轻轻咬住嘴唇，稍微向前滑动，将自己摩擦在史莱姆的" + get_monster().cockDescriptShort(0) + "上。你呻吟了一声，迷失了片刻，在渴望");
            if(!get_player().vaginas[0].virgin)
            {
               outputText("那种熟悉的充实感");
            }
            outputText("和对让这只生物进入你体内的偏执恐惧之间徘徊。");
            if(get_player().vaginalCapacity() <= 18)
            {
               outputText("此外，你不确定这根粗大、长达一英尺半的附肢是否能塞进你体内。");
            }
            outputText("[pg]");
         }
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("你自己在工作时勃起的[cocks]摩擦着生物的阴茎，多少有些碍事。");
            }
            else if(get_player().cocks[0].cockThickness >= 36)
            {
               outputText("你自己在工作时勃起的[cock]摩擦着生物的阴茎，多少有些碍事。");
            }
            if(get_player().cockTotal() == 1)
            {
               outputText("你感觉到你的[cock]开始跳动，脑海中浮现出想要试着插入它的念头。你转过身，在怪物身上寻找着孔洞，却什么也没找到。经过片刻令人沮丧的寻找后，你放弃了，决定自己解决。");
            }
            else
            {
               outputText("你感觉到你的[cocks]开始跳动，脑海中浮现出想要试着插入它的念头。你转过身，在怪物身上寻找着孔洞，却什么也没找到。经过片刻令人沮丧的寻找后，你放弃了，决定自己解决。");
            }
            outputText("[pg]");
         }
         get_images().showImage("greenslime-oral");
         outputText("随着你继续揉捏怪物的身体，它勃起的部位变得越来越清晰，缓慢但坚定地变成了一根毫无疑问的人类阴茎。");
         if(get_player().get_tallness() < 82)
         {
            outputText("当你抚摸史莱姆的肉棒时，一种浅绿色的液体开始覆盖你的手，让你的手指感到温暖，并让一阵阵性奋的颤栗传遍你的全身。[pg]");
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
            {
               if(int(get_player().cocks.length) > 1)
               {
                  if(int(get_player().cocks.length) > 0)
                  {
                     outputText("最终，你自己的欲望变得难以忍受，你伸手去套弄你的一根" + get_player().multiCockDescriptLight() + "，用另一只手按摩着怪物肿胀、跳动的龟头。当你把手握住你的" + get_player().cockDescript(1) + "时，你微微喘息，怪物的液体让你变得异常敏感。你情不自禁地呻吟起来，开始用臀部迎合着你的拳头挺动，感觉到你自己和怪物都开始跳动得越来越厉害。没过多久，你就再也坚持不住了，感觉到身体因高潮的痉挛而颤抖，双手紧紧握住，你的[cocks]射出的精液覆盖了怪物。");
                  }
                  if(int(get_player().vaginas.length) > 0)
                  {
                     outputText("当你把身体在史莱姆身上摩擦时，你的" + get_player().vaginaDescript(0) + "颤抖着，分享着这种感觉。");
                  }
                  outputText("怪物也达到了高潮，一股浓稠、强劲的绿色液体从史莱姆的肉棒中射出，射入你等待的手掌中。你颤抖着，因为你的高潮似乎比平时持续得更久，你注意到史莱姆的身体在片刻间恢复了一些轮廓，然后它的肉棒迅速缩回了它的体内。");
               }
               else if(get_player().cocks[0].cockLength <= 30)
               {
                  outputText("最终，你自己的欲望变得难以忍受，你也伸手去套弄自己的" + get_player().cockDescript(0) + "，用另一只手按摩着怪物肿胀、跳动的龟头。当你把手握住你的[cock]时，你微微喘息，怪物的液体让你变得异常敏感。你情不自禁地呻吟起来，开始用臀部迎合着你的拳头挺动，感觉到你自己和怪物都开始跳动得越来越厉害。没过多久，你就再也坚持不住了，感觉到身体因高潮的痉挛而颤抖，双手紧紧握住，将精液射在了怪物身上。");
                  if(int(get_player().vaginas.length) > 0)
                  {
                     outputText("当你把身体在史莱姆身上摩擦时，你的" + get_player().vaginaDescript(0) + "颤抖着，分享着这种感觉。");
                  }
                  outputText("怪物也达到了高潮，一股浓稠、强劲的绿色液体从史莱姆的肉棒中射出，射入你等待的手掌中。你颤抖着，因为你的高潮似乎比平时持续得更久，你注意到史莱姆的身体在片刻间恢复了一些轮廓，然后它的肉棒迅速缩回了它的体内。");
               }
               else if(get_player().cocks[0].cockLength >= 31)
               {
                  outputText("最终，你自己的欲望变得难以忍受，你也伸手去摸索自己，用一只手揉捏着怪物肿胀、跳动的龟头。由于无法正确握住它，你微微呻吟着，将自己压在怪物的皮肤上，前后移动臀部来获得快感。当你手上覆盖的同样的绿色分泌物也开始覆盖你的[cock]时，你开始更大声地呻吟，让它跳动得比以前更厉害。没过多久，你在高潮时喘息着弯下腰，臀部颤抖着，射得怪物满身都是。");
                  if(int(get_player().vaginas.length) > 0)
                  {
                     outputText("当你把身体在史莱姆身上摩擦时，你的" + get_player().vaginaDescript(0) + "颤抖着，分享着这种感觉。");
                  }
                  outputText("你本能地抓住怪物自己的肉棒来支撑自己，随着最后一次强有力的脉动，它也射了，将它稀薄的绿色液体喷射到半空中。当你喘着粗气时，你感觉到它溅到了你的背上和[hair]上，然后随着野兽勃起的部位迅速缩回它自己的体内，你几乎要摔倒了。");
               }
               outputText("[pg]");
            }
            else if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
            {
               outputText("终于，你自身的欲火烧得再也无法忍耐。你任由一只手从那生物的昂扬之物上缓缓滑下，拂过它的身体，再沿着自己的大腿向上游走，嘴里不自觉地发出轻柔的哼吟——那生物一直在不住渗出的绿色黏液，沾到哪里，哪里就泛起一阵温热的酥麻感。你的手悄然爬进双腿之间，指尖抚过自己" + get_player().vaginaDescript(0) + "的阴唇时，不由得轻轻倒抽一口气，贪婪地品味着这触感，随后便开始尽情地抚慰自己。");
               if(get_player().getClitLength() >= 2)
               {
                  outputText("当你用拇指和食指夹住你的" + get_player().clitDescript() + "时，你呻吟着微微向后靠，当你用拇指摩擦你的[clit]时，你咬着嘴唇，感受着强烈的快感，并在期待和喜悦中颤抖。");
               }
               else
               {
                  outputText("当你开始弹拨你的[clit]时，你呻吟着微微向后靠，史莱姆的液体提供了极好的润滑，当你用手指在阴蒂周围打着小圈时，会产生一种奢华的温暖感。");
               }
               outputText("与此同时，你继续揉捏着你下方史莱姆的头部，慢慢地用手在它巨大勃起物的顶部扭动。没过多久，这团物质开始变细并凸起，变得更加清晰，然后呈现出人类阴茎的明显形象。看到它让你更加兴奋，你开始更用力地揉捏它，感觉到它在你的触摸下开始真正地跳动。");
               if(int(get_player().breastRows.length) > 0 && get_player().biggestTitSize() >= 1)
               {
                  outputText("当史莱姆巨大的手臂从你身后伸出，托住你的" + get_player().allBreastsDescript() + "时，你微微喘息，柔软的物质");
                  if(get_player().biggestTitSize() > 8)
                  {
                     outputText("几乎包不住它们。");
                  }
                  else if(get_player().biggestTitSize() > 3)
                  {
                     outputText("温柔地覆盖着它们。");
                  }
                  else
                  {
                     outputText("轻易地将它们包裹起来。");
                  }
                  outputText("你感觉到那东西在揉捏你的乳头，随着黏液开始轻柔而有节奏地按摩，挑逗着你的[nipple]，以恰到好处的方式摩擦着你，你忍不住发出轻声呻吟。让你有些惊讶的是，你注意到它的手似乎完全静止不动，所有的动作都来自于这生物在你周围改变形状。当你想象这头野兽在你的体内会是什么感觉时，你的性欲激增，并迅速开始攀升至顶峰。");
               }
               else
               {
                  outputText("当史莱姆粗壮的手臂突然抓住你的[hips]并将你压向它的身体时，你微微喘息着，另一个凸起从你的双腿间挤出，强行推开了你的手。然而，这生物并没有长出第二根阴茎，而是开始让你沿着它轻轻地前后摇晃，当柔软的物质令人愉悦地滑过你的下体时，你忍不住发出一声呻吟。这，加上它自然分泌物的催情效果，很快就让你达到了高潮。");
               }
               if(get_player().cockTotal() > 0)
               {
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("当史莱姆在你身上动作时，你感觉到你的[cocks]胀大到了极限。它们很快开始跳动，渴望着释放，而你想要被爱抚的欲望让这种需求变得更加迫切。");
                     if(get_player().biggestTitSize() == 0)
                     {
                        outputText("你小心翼翼地握住你其中一根阴茎的头部，你的手上沾满了你自己和那生物的体液。那生物的动作和你自己的动作结合在一起，很快就让你无法自拔。");
                     }
                  }
                  else
                  {
                     outputText("当史莱姆在你身上动作时，你感觉到你的[cock]胀大到了极限。它开始跳动，渴望着释放，而你想要被爱抚的欲望让这种需求变得更加迫切。");
                     if(get_player().biggestTitSize() == 0)
                     {
                        outputText("你小心翼翼地握住你[cock]的头部，你的手上沾满了你自己和那生物的体液。那生物的动作和你自己的动作结合在一起，很快就让你无法自拔。");
                     }
                  }
               }
               outputText("[pg]");
               outputText("最后，当你高潮时，你感觉到一阵快感如海啸般席卷全身，随着你整个身体的颤抖，你下意识地试图用双腿夹紧那生物。它微微后退，伴随着最后一次强有力的脉动，一股绿色的液体从它" + get_monster().cockDescriptShort(0) + "的顶端喷发出来，溅满了你的全身。液体触及的每一个地方似乎都燃起了快感的火焰，你本已晕眩的大脑几乎要崩溃了，你任由自己向后倒在史莱姆的身上，一波又一波的快感流遍你的全身。");
               if(get_player().cockTotal() > 0)
               {
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("你发出一声压抑的喘息，你那因劳累而紧绷的身体再次颤抖，你的" + get_player().multiCockDescript() + "在性高潮中爆发，将精液喷洒在你和那生物身上。");
                  }
                  else
                  {
                     outputText("你发出一声压抑的喘息，你那因劳累而紧绷的身体再次颤抖，你的[cock]在性高潮中爆发，将一股温热的精液喷射到空中。");
                  }
               }
               outputText("当你睁开眼睛时，你注意到那生物的勃起已经消失了，当你第一次遇到它时它所拥有的那种近乎掠食者的平静又回来了，尽管不知何故有些不同。");
               outputText("[pg]");
            }
            _loc1_ = get_player().get_gender() == 0;
            outputText("片刻之后，那生物从你身下滑出，当你从这场折磨中恢复过来时，它溜回了湖水中。当你恢复理智时，除了回到营地，无事可做。[pg]");
         }
         else if(get_player().get_tallness() >= 82)
         {
            outputText("当你抚摸史莱姆的阴茎时，一种浅绿色的液体开始覆盖你的手，让你的手指感到温暖，并让一阵阵性欲的战栗传遍你的全身。");
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("最终，你自己的性欲变得难以忍受，你也伸手去抚弄你[cocks]中的一根，同时继续用另一只手在那生物的长度上上下滑动。当你把手握住你的" + get_player().cockDescript(1) + "时，你微微喘息，那生物的体液让你变得异常敏感。你情不自禁地呻吟起来，开始用臀部迎合着你的拳头稍微挺动，从根部到顶部抚摸着你自己和那生物。那生物的勃起变得更加清晰，因为它开始跳动得更猛烈、更快，变成了一根明显的人类阴茎。");
               }
               else
               {
                  outputText("最终，你自己的性欲变得难以忍受，你也伸手去抚弄你自己的" + get_player().cockDescript(0) + "，同时继续用另一只手在那生物的长度上上下滑动。当你把手握住你的[cock]时，你微微喘息，那生物的体液让你变得异常敏感。你情不自禁地轻声呻吟起来，开始用臀部迎合着你的拳头稍微挺动，从根部到顶部抚摸着你自己和那生物。那生物的勃起变得更加清晰，因为它开始跳动得更猛烈、更快，变成了");
                  if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN)
                  {
                     outputText("一根几乎和你自己的[cock]一模一样的复制品！");
                  }
                  else
                  {
                     outputText("一根明显的人类阴茎。");
                  }
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("强烈的快感传遍你的全身，你的" + get_player().vaginaDescript(0) + "因性欲而变得湿润。你推着那生物，有节奏地前后滑动，它柔软、湿润的身体贴合着你的褶皱，创造出一种奇妙的、令人兴奋的感觉。");
                  outputText("[pg]没过多久，你就再也控制不住自己了，伴随着一声呻吟，你爆发了，当你的" + get_player().multiCockDescript() + "和" + get_player().vaginaDescript(0) + "同时在性高潮中爆发时，你的精液喷洒在那生物身上。黏液的阴茎似乎也肿胀起来，一股绿色的液体从顶端喷涌而出，形成了一个巨大的、湿滑的水坑，覆盖了你的下半身，并在你周围的地面上形成了一个小水坑，然后渗入泥土中。当你喘过气来时，那生物的阴茎开始失去轮廓，然后消退，那东西把自己缩回成一团，从你身下滑出，在你的注视下悄悄地逃进了附近的水中。当你站起来时，你注意到地上有一团仍然部分呈固态的绿色凝胶，你把它捡了起来。");
               }
               else
               {
                  outputText("[pg]没过多久，你就再也控制不住自己了，伴随着一声呻吟，你爆发了，将你的精液喷洒在那生物身上。黏液的阴茎似乎也肿胀起来，一股绿色的液体从顶端喷涌而出，形成了一个巨大的、湿滑的水坑，覆盖了你的下半身，并在你周围的地面上形成了一个小水坑，然后渗入泥土中。当你喘过气来时，那生物的阴茎开始失去轮廓，然后消退，那东西把自己缩回成一团，从你身下滑出，在你的注视下悄悄地逃进了附近的水中。");
               }
            }
            else if(get_player().get_gender() == 2 || get_player().get_gender() == 3)
            {
               outputText("最终，你自己的欲望变得难以忍受，你的另一只手摸向了你的");
               if(int(get_player().breastRows.length) > 0 && get_player().biggestTitSize() >= 1)
               {
                  outputText(get_player().allBreastsDescript() + "，你开始抚摸自己，同时握住怪物的肉棒，从冠状沟一直撸到根部。随着怪物身体的脉动变得更加明显，它的外观也变得更加清晰，呈现出人类阴茎的独特模样。你咧嘴一笑，把它拉近了一点，一只手快速地套弄着柱身，另一只手揉捏着龟头，让史莱姆微微抽动，在你的手中跳动。毫无预兆地，它宽大的手臂伸了上来，一只手搂住你的乳房，另一只手搭在你的大腿上，手伸向你的" + get_player().vaginaDescript(0) + "。");
                  if(get_player().biggestTitSize() > 8)
                  {
                     outputText("它的手膨胀起来，努力覆盖住你所有的" + get_player().allBreastsDescript() + "，");
                  }
                  else if(get_player().biggestTitSize() > 3)
                  {
                     outputText("它的手膨胀起来，轻轻地覆盖住你的" + get_player().allBreastsDescript() + "，");
                  }
                  else
                  {
                     outputText("它的手轻松地包裹住你的" + get_player().allBreastsDescript() + "，");
                  }
                  outputText("你停顿了一下，直到史莱姆捏了捏你的一个[nipple]，促使你再次开始揉搓它。放在你胸部的手熟练地按摩着它们，感觉就像有几十根手指一样，而另一只手则轻轻地用一根手指划过你的阴道。低头一看，你发现史莱姆似乎根本没有动——它在改变自己的质量来按摩你，创造出一种你从未体验过的感觉！");
                  outputText("就在你感觉到它撞击之前，你恍然大悟，这种惊讶让你不由自主地挤压和扭动史莱姆肉棒的头部。");
               }
               else
               {
                  outputText("迅速湿润的" + get_player().vaginaDescript(0) + "，你开始用手指沿着你的阴道滑动，同时握住怪物的肉棒，从冠状沟一直撸到根部。随着怪物身体的脉动变得更加明显，它的外观也变得更加清晰，呈现出人类阴茎的独特模样。你咧嘴一笑，把它拉近了一点，一只手快速地套弄着柱身，另一只手揉捏着龟头，让史莱姆微微抽动，在你的手中跳动。毫无预兆地，它的一只宽大的手臂伸了上来，搭在你的大腿上，手径直伸向你的" + get_player().vaginaDescript(0) + "。[pg]");
               }
               if(get_player().cockTotal() > 0)
               {
                  if(get_player().biggestTitSize() == 0 || int(get_player().breastRows.length) == 0)
                  {
                     outputText("当怪物摩擦你" + get_player().multiCockDescript() + "下方的" + get_player().vaginaDescript(0) + "时，你开始呻吟，它以令人难以置信的技巧挑逗着你，但可悲的是，它忽略了你饥渴的");
                     if(get_player().cockTotal() > 1)
                     {
                        outputText("肉棒们");
                     }
                     else
                     {
                        outputText("肉棒");
                     }
                     outputText("就在这时。接下来发生的事情完全出乎意料，让你下意识地拧紧了史莱姆肉棒的头部。");
                  }
                  outputText("怪物光滑的凝胶状身体包裹住你的[clit]并缓慢地脉动，同时从多个角度抚摸它，让你舒服得喘不过气来。你陷入了两难的境地，既想把臀部推向它以寻求更多的快感，又想从这种强烈的感官刺激中抽身，最终你只能无助地呻吟，你的手不假思索地收紧并挤压着怪物肉棒的头部，导致它释放出大量的绿色液体，喷洒在你的胸部和身体上。");
               }
               else
               {
                  if(get_player().biggestTitSize() == 0 || int(get_player().breastRows.length) == 0)
                  {
                     outputText("当怪物摩擦你的" + get_player().vaginaDescript(0) + "时，你开始呻吟，它以令人难以置信的技巧挑逗着你，但接下来发生的事情完全出乎意料，让你下意识地拧紧了史莱姆肉棒的头部。");
                  }
                  outputText("怪物光滑的凝胶状身体包裹住你的[clit]并缓慢地脉动，同时从多个角度抚摸它，让你舒服得喘不过气来。你陷入了两难的境地，既想把臀部推向它以寻求更多的快感，又想从这种强烈的感官刺激中抽身，最终你只能无助地呻吟，你的手不假思索地收紧并挤压着怪物肉棒的头部，导致它释放出大量的绿色液体，喷洒在你的胸部和身体上。");
               }
               outputText("[pg]");
               if(get_player().cockTotal() > 0)
               {
                  outputText("即使在这样做的时候，它仍然在熟练地挑逗着你的身体，用它的服侍让你处于边缘，并在那里停留了几分钟，这几分钟既痛苦又美妙，你几乎失去了对身体的控制。最终，怪物似乎同时拉扯着一切，终于让你在几乎尖叫的快感中达到了高潮。你的" + get_player().multiCockDescript() + "也爆发了，将浓稠的、冒着热气的精液喷射到空中，怪物也随之结束了对你的服侍。");
               }
               else
               {
                  outputText("即使在这样做的时候，它仍然在熟练地挑逗着你的身体，用它的服侍让你处于边缘，并在那里停留了几分钟，这几分钟既痛苦又美妙，你几乎失去了对身体的控制。最终，怪物似乎同时拉扯着一切，终于让你在几乎尖叫的快感中达到了高潮。");
               }
               outputText("你几乎没有注意到怪物的勃起消退，它从你身下溜走，让你感到无比满足。当你终于恢复理智时，你发现它没有留下任何其他痕迹。");
            }
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(3));
      }
      
      public function serviceLowCorruption() : void
      {
         outputText("你似乎无法将视线从这只生物身上移开，它现在的状态显然既无助又痛苦。你小心翼翼地走上前去，史莱姆似乎已经感觉不到你的存在了。它痛苦地扭曲了一下，你决定不能就这样把它丢在这里。");
         outputText("你在史莱姆旁边坐下，轻轻触摸它跳动的阴茎。表面的膜湿润且触感如天鹅绒般柔软，不完全光滑，但也不粗糙。你慢慢地顺着它的长度抚摸，同时瞥了一眼这只生物的脸。它似乎平静了一些，呼吸也更平稳了。[pg]");
         if(get_player().get_tallness() >= 82)
         {
            outputText("你试着用你那巨大的手轻轻包裹住它勃起的肉棒，然后挤压。");
         }
         else
         {
            outputText("你试着用一只手包裹住它勃起的肉棒，但最后不得不双手并用才能牢牢握住。");
         }
         outputText("尽管外表看起来如此，但这东西非常柔软且有弹性，尽管强烈的脉动周期性地让它在你的手中膨胀，挤进你手指间的缝隙。回头看着这东西的脸，你慢慢开始上下套弄这根巨大的肉棒，它变得湿润，然后随着生物渗出的一些稀薄的绿色液体流到你的手上，变得有些滑腻。你感到有些脸红，开始加快动作，史莱姆对你的服侍做出了积极的反应。它身体的其余部分似乎也在跳动，随着你的继续，它身体的轮廓逐渐恢复。它甚至开始配合你的节奏摆动臀部，它的面部特征慢慢变得越来越不明显，而它的勃起则变得更加清晰，明显形成了一根" + get_monster().cockDescriptShort(0) + "。[pg]");
         get_images().showImage("greenslime-oral");
         if(get_player().get_tallness() >= 82)
         {
            outputText("史莱姆那根" + get_monster().cockDescriptShort(0) + "的跳动越来越强烈，直到这只生物出乎意料地重新长出手臂，伸手抓住你，将你的手按在它的龟头上。片刻之后，这东西明显地将背部拱离地面，并在你的手掌中爆发，一股浓稠的绿色液体猛烈地溅在你的手上，顺着它的阴茎流下，浸湿了你的双手，甚至溅到了你附近的大腿上。你带着震惊和突然涌起的兴奋看着这只生物的脸，它的勃起和脸都变得光滑且没有特征，然后它的阴茎慢慢缩回体内。当你回过神来，看着自己沾满生物绿色液体的双手时，史莱姆慢慢开始撤退。当你再次抬起头时，这只生物已经不见了。[pg]");
         }
         else
         {
            outputText("史莱姆那根" + get_monster().cockDescriptShort(0) + "的跳动越来越强烈，直到这只生物出乎意料地重新长出手臂，在你抓住它时伸手抓住你，将你的双手按在它的龟头上。片刻之后，这东西明显地将背部拱离地面，并在你的手掌中爆发，一股浓稠的绿色液体猛烈地溅在你的双手上，顺着它的阴茎流下，浸湿了你的双手，甚至溅到了你附近的大腿上。你带着震惊和突然涌起的兴奋看着这只生物的脸，它的勃起和脸都变得光滑且没有特征，然后它的阴茎慢慢缩回体内。当你回过神来，看着自己沾满生物绿色液体的双手时，史莱姆慢慢开始撤退。当你再次抬起头时，这只生物已经不见了。[pg]");
         }
         get_player().slimeFeed();
         dynStats(DynStat.Sens(2));
      }
      
      public function rapeOozeWithMilk() : void
      {
         clearOutput();
         get_images().showImage("greenslime-rape-orally");
         outputText("你看着这滩软泥，想知道既然它已经失去了凝聚力，你该如何解决你需要哺乳的问题。在思考了一会儿之后，你决定随机应变，" + get_player().clothedOrNaked("脱下你的[armor]上衣，") + "将这团怪物压在你的" + get_player().breastDescript(0) + "上，并挤压它以将乳汁喂给它。史莱姆几乎立即做出了反应，从你的[breasts]底部向你的" + get_player().nippleDescript(0) + "施加压力，为你赢得了一股乳汁，让你感到极大的满足。当它照顾你的[nipple]时，它慢慢地顺着你的身体往下移动，几乎是充满爱意地");
         if(get_player().get_gender() == 1)
         {
            outputText("爱抚着你的[cocks]");
            if(get_player().balls > 0)
            {
               outputText("，并稍微向下滑动，将你的[balls]也吞没。");
            }
            else
            {
               outputText("。");
            }
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("玩弄着你的[clit]。");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("爱抚着你的[cocks]");
            if(get_player().balls > 0)
            {
               outputText("并稍微往下滑动，将你的[balls]也包裹起来。");
            }
            else
            {
               outputText("几乎滴落下来，覆盖在你的[clit]上，增加你的快感。");
            }
         }
         else
         {
            outputText("爱抚着你本该长着生殖器的空白处" + get_player().clothedOrNaked("，尽管你的[armor]还穿在身上") + "。");
            outputText("[pg]");
            outputText("一连串愉悦的感觉让你倒在你的[ass]上，沉浸在其中，你的双手");
         }
         if(get_player().get_gender() < 1)
         {
            outputText("紧紧抓住地面，因为史莱姆让你无事可做；把手加进去感觉是对这生物专业技巧的侮辱。");
         }
         else if(get_player().get_gender() == 1)
         {
            outputText("你的双手紧紧抓住地面，因为史莱姆让你无事可做；把手指加进去感觉是对这生物专业技巧的侮辱。");
         }
         else
         {
            outputText("你的双手飞快地伸向你的" + get_player().vaginaDescript(0) + "，疯狂地将手指抽插进出。你希望史莱姆也能把它吞没。");
         }
         outputText("你在那团物质里高潮了许多次，但这并不是你真正关心的。这是一个极其受欢迎、令人心神荡漾的额外奖励，但不是主要事件。真正重要的是，这团粘液正在为你缓慢而细致地同时吸干你两边[breasts]里的乳汁。感觉到它正在吸食你最后的乳汁，你催促着粘液，试图让它加快对你现在过度敏感的");
         if(get_player().get_gender() == 1)
         {
            outputText(get_player().multiCockDescriptLight());
            if(get_player().balls > 0)
            {
               outputText("和[ballsfull]");
            }
            outputText("和");
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("[clit]和");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText(get_player().multiCockDescriptLight());
            if(get_player().balls > 0)
            {
               outputText("，[balls]，");
            }
            outputText("和[clit]和");
         }
         outputText("[breasts]的工作。[pg]");
         outputText("不幸的是，你似乎在之前的战斗中对它造成了太多的伤害。粘液滑落下来，让你悬在即将高潮的边缘。你决定不能就这么算了，你舀起怪物留下的大部分粘液，把它当作自慰的辅助工具，通过");
         if(get_player().get_gender() == 1)
         {
            outputText("狂热地用它手淫来获得甜蜜的释放。它冰凉的触感形成了鲜明的对比，足以让你相对较快地达到高潮，你将精液射入其中。你丢掉了它的大部分体积");
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("用手指快速地将它在你的" + get_player().vaginaDescript(0) + "里抽插。它冰凉的触感形成了鲜明的对比，足以让你相对较快地达到高潮，你将淫液释放到里面。你把它从手指上弹开");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("你狂热地用它手淫，同时用手指快速地将它在你的" + get_player().vaginaDescript(0) + "里进进出出。它冰凉的触感形成了强烈的对比，让你很快就达到了高潮。你将精液射入其中，同时它也吸收了你" + get_player().vaginaDescript(0) + "里的淫液。你丢掉了它的大部分体积");
         }
         else
         {
            outputText("在你的[asshole]上摩擦。它冰凉的触感形成了强烈的对比，让你很快就达到了高潮。当你感觉到肌肉因幻影般的高潮而痉挛时，你丢下了它");
         }
         outputText("同时用剩下的部分涂抹你的[nipple]，以便将你最后的乳汁喂给它。[pg]");
         outputText("现在你被榨干了，你把软泥留在它所在的那堆东西里，然后走开了。虽然对这平淡无奇的结局感到有些失望，但总的来说，你对自己能够哺乳感到满意。[pg]");
         get_player().orgasm("Tits");
         dynStats(DynStat.Lib(0.2));
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function oozeRapesYouVaginally() : void
      {
         get_player().slimeFeed();
         outputText("你在史莱姆柔软但沉重的拳头的殴打下倒下，头晕目眩，迷失了方向。这只生物以惊人的速度向你扑来，抓住你的脚踝把你拉向它。当它把你拉到它的躯干上时，你试图挣脱，一时间害怕它会试图吸收你。");
         if(get_player().cor <= 20)
         {
            outputText("当一根巨大的人类肉棒从这只生物的躯干上长出来时，这种恐惧很快就消失了，取而代之的是一种完全不同的恐惧，因为你意识到了它的计划。史莱姆用手臂环绕着你的[legs]，并把它们挤压在它的肉棒周围。它来回移动了几次，让它的阴茎滑过你的[skindesc]并沿着你的" + get_player().vaginaDescript(0) + "滑动。它的皮肤柔软如天鹅绒，略带湿润，并在后面留下一道细细的绿色液体痕迹。[pg]");
            outputText("当你的" + get_player().vaginaDescript(0) + "变湿时，你开始感觉到下体一阵刺痛。毫无预兆地，这只生物拉开你的双腿，沿着你的胯部向后拉它的阴茎，停顿片刻，将尖端停在你的私处。你带着同等的兴奋和焦虑看着它，当它在那里停顿片刻时，你做好了准备。");
            if(get_player().vaginas[0].virgin)
            {
               outputText("这东西慢慢地压在你身上试图插入，你抓住身下的草，绝对确定它进不去。当肉棒刺破你的处女膜时，你咬住下唇，弓起背，一阵剧痛传遍全身。当它深入你的身体，完美地填满你内部的轮廓时，你发出了一声结结巴巴的喘息。当它这样做时，它在你的体内涂上了一层令人刺痛、舒缓的液体，这很快将你可能感觉到的任何疼痛转化为美妙的快感。当这只生物最终在你体内插到底时，它剩余的长度似乎滑回了这只生物的体内。[pg]");
            }
            else if(get_player().vaginalCapacity() < 18)
            {
               outputText("这东西慢慢地压在你身上试图插入，你抓住身下的草，几乎完全确定它进不去。当肉棒滑入你的" + get_player().vaginaDescript(0) + "时，你咬住下唇以忍住呻吟，它的周长缩小以舒适地滑入你体内。当它深入你的身体，完美地填满你内部的轮廓直到最终插到底时，你发出了一声愉悦的叹息。当它把你的臀部拉向它的躯干时，它剩余的长度似乎滑回了这只生物的体内。[pg]");
            }
            else if(get_player().vaginalCapacity() <= 30)
            {
               outputText("这东西慢慢地压在你身上试图插入，你抓住身下的草。当肉棒滑入你的" + get_player().vaginaDescript(0) + "时，一声轻柔的呻吟从你的唇间逸出，它的周长略微改变以几乎完美地适应你，将你撑开得恰到好处。当它深入你的身体，完美地填满你内部的轮廓直到你的臀部最终接触到它的躯干时，你的呻吟声变得更大了。有短暂的停顿，当史莱姆的阴茎在你体内生长，变长以完美地填满你的" + get_player().vaginaDescript(0) + "时，你喘着粗气。[pg]");
            }
            else
            {
               outputText("这东西慢慢地压在你身上试图插入，你抓住身下的草。当肉棒滑入你的" + get_player().vaginaDescript(0) + "时，一声轻柔的呻吟从你的唇间逸出，它的周长略微改变以几乎完美地适应你，将你撑开得恰到好处。当它深入你的身体，完美地填满你内部的轮廓直到你的臀部最终接触到它的躯干时，你的呻吟声变得更大了。有短暂的停顿，当史莱姆的阴茎在你体内生长，变长直到几乎填满你的" + get_player().vaginaDescript(0) + "时，你喘着粗气。[pg]");
            }
            get_player().cuntChange(get_monster().cockArea(0),true,false,true);
            get_images().showImage("greenslime-loss-vag");
            outputText("当史莱姆开始移动，慢慢地抽插你的" + get_player().vaginaDescript(0) + "时，你微微弓起背。随着它加快速度，少量这东西的绿色液体在你的下嘴周围积聚，让你的皮肤感到刺痛，并让你充满了一种不同寻常的性奋。[pg]");
            if(get_player().cockTotal() > 0)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的" + get_player().multiCockDescript() + "在这种攻势下迅速勃起并开始跳动。现在你已经完全释放了本能，你伸手去自慰，");
                  if(get_player().cockTotal() > 2)
                  {
                     outputText("在肉棒之间切换，随着生物的动作快速地抚摸自己。");
                  }
                  else
                  {
                     outputText("双手各快速抚摸一根肉棒，随着生物的动作配合着自己。");
                  }
               }
               else
               {
                  outputText("你的" + get_player().cockDescript(0) + "在这种攻势下迅速勃起并开始跳动。你现在已经完全屈服于本能，伸手开始自慰，随着怪物的动作快速套弄着你的[cock]。");
               }
            }
            outputText("过了一小会儿，这生物再次完全插入了你并停了下来，你意识到在某个时刻你已经开始随着它扭动臀部。你惊讶地喘息着，因为史莱姆的肉棒开始在你体内搅动，以一种独特而令人愉悦的方式从内部按摩着你。[pg]");
            outputText("没过多久，你就达到了高潮。你的整个身体都在颤抖，你弓起背，快感传遍全身。这生物将你紧紧拉向它，在你体内的动作减慢并停止时微微膨胀，然后在顶端膨胀了一秒钟，接着在你体内释放出大量稀薄凉爽的液体。它挤过这生物的肉棒，从你体内溢出。");
            if(get_player().cockTotal() > 0)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的" + get_player().multiCockDescript() + "也达到了高潮，将一股股滚烫浓稠的精液射在你的脸和胸膛上。");
               }
               else
               {
                  outputText("你的阴茎也达到了高潮，你用一只手捂住眼睛和脸，任由精液喷洒在自己身上。你的另一只手滑到[cock]的根部，用力挤压，将精液涂满你的胸膛。");
               }
            }
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(4));
         }
         else
         {
            outputText("这种恐惧很快就消失了，因为一根巨大的人类阴茎从怪物的躯干上长了出来，取而代之的是兴奋，因为你意识到它打算做什么。史莱姆用手臂环住你的双腿，将它们挤压在它的阴茎周围。当它来回移动几次，将它的阴茎在你的大腿之间和你的" + get_player().vaginaDescript(0) + "上滑动时，你轻声呻吟。它的皮肤感觉奇妙地柔软和天鹅绒般，略微湿润，并留下一丝绿色的液体。[pg]");
            outputText("你开始感觉到下体一阵刺痛，你的" + get_player().vaginaDescript(0) + "变得湿润。毫无预兆地，怪物掰开你的双腿，将它的阴茎沿着你的下体向后拉，停顿片刻，将龟头靠在你的私处。你不耐烦地向上推着它，因为期待而变得更加湿润。");
            if(get_player().vaginas[0].virgin)
            {
               outputText("那东西慢慢地压在你身上准备插入，你抓住身下的草，确信它进不去，但又为终于有了第一次性经历而感到兴奋。当阴茎刺破你的处女膜时，你咬住下唇，一阵剧痛传遍全身，你弓起了背。当它深入你的身体，完美地填满你内部的轮廓时，你发出一声结巴的喘息。当它这样做时，它在你的内部涂抹了一层令人刺痛的舒缓液体，迅速将你可能感觉到的任何疼痛转化为奇妙的快感。当怪物最终在你体内插到底时，它剩余的长度似乎滑回了怪物的体内。[pg]");
               get_player().cuntChange(15,true);
            }
            else if(get_player().vaginalCapacity() < 18)
            {
               outputText("它终于开始进入你，你抓紧身下的草地，既兴奋又焦虑地等待着它挤进你的身体。你咬住下唇，强忍住大声的呻吟，那根肉棒滑入你的" + get_player().vaginaDescript(0) + "，它的粗细收缩着，舒适地滑入你的体内。随着它深入你的身体，你发出一声愉悦的叹息，它完美地填满了你内部的轮廓，直到最终到底。当它把你的臀部拉向它的躯干时，它剩余的长度似乎滑回了生物的体内。[pg]");
            }
            else
            {
               outputText("它终于开始进入你，你抓紧身下的草地，高兴地发现它的肉棒似乎大到足以填满你");
               if(get_player().vaginalCapacity() >= 30)
               {
                  outputText("至少部分填满");
               }
               outputText("。一声低沉沙哑的呻吟从你唇间溢出，肉棒滑入你的" + get_player().vaginaDescript(0) + "，它的粗细微微变化，完美地贴合你，恰到好处地撑开你。随着它深入你的身体，你的呻吟声变得更大了，它完美地填满了你内部的轮廓，直到你的臀部最终触碰到它的躯干。短暂的停顿后，你发出一声愉悦的喘息，史莱姆的阴茎在你体内生长，变长以填满你的" + get_player().vaginaDescript(0));
               if(get_player().vaginalCapacity() >= 30)
               {
                  outputText("几乎完美地填满。[pg]");
               }
               else
               {
                  outputText("完美地。[pg]");
               }
            }
            get_images().showImage("greenslime-loss-vag");
            outputText("当史莱姆开始移动时，你舒服地弓起背，它慢慢地抽插着你湿润的" + get_player().vaginaDescript(0) + "。它的速度越来越快，一些绿色的液体聚集在你的下体周围，让你的皮肤感到刺痛，并让你充满了异常强烈的性欲。");
            if(get_player().cockTotal() > 0)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的" + get_player().multiCockDescript() + "在这种攻势下迅速勃起并开始跳动。现在你已经完全释放了本能，你伸手去自慰，");
                  if(get_player().cockTotal() > 2)
                  {
                     outputText("在肉棒之间切换，随着生物的动作快速地抚摸自己。");
                  }
                  else
                  {
                     outputText("双手各快速抚摸一根肉棒，随着生物的动作配合着自己。");
                  }
               }
               else
               {
                  outputText("你的" + get_player().cockDescript(0) + "在这种攻势下迅速勃起并开始跳动。你现在已经完全屈服于本能，伸手开始自慰，随着怪物的动作快速套弄着你的[cock]。");
               }
            }
            outputText("过了一小会儿，怪物再次完全插入你体内并停了下来，你继续挺动臀部迎合它，直到它抓住你的大腿，将你紧紧按在它身上，让你动弹不得。你紧贴着它颤抖着，发出渴望的呻吟，拼命地希望它能继续操你。你惊讶地喘息着，因为史莱姆的肉棒开始在你体内搅动，以一种独特而令人愉悦的方式从内部按摩着你。[pg]");
            outputText("没过多久，你就达到了高潮，你感觉到全身都在颤抖。当快感传遍全身时，你弓起背，整个身体都因为高潮的力量而紧绷起来。怪物将你紧紧拉向它，当它在你体内的动作变慢并停止时，它微微膨胀，然后在释放出一股稀薄、冰凉的液体之前，它的顶端膨胀了一秒钟。这种释放使你自己的高潮强度加倍，因为液体绕过怪物的肉棒，从你体内溢出。");
            if(get_player().cockTotal() > 0)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的" + get_player().multiCockDescript() + "也达到了高潮，你张开嘴，将一波又一波滚烫、浓稠的精液喷射到你的脸上和胸前。你享受着它咸咸的味道，即使在射精时也继续套弄着自己。");
               }
               else
               {
                  outputText("你自己的肉棒最终也达到了高潮，你张开嘴，精液喷射到你的脸上和胸前。你的手滑到[cock]的根部并用力挤压，释放出浓稠的精液，涂满你的脸和胸膛，你享受着它咸咸的味道。");
               }
            }
            outputText("你喘着粗气，怪物保持完全静止了一分钟，然后随着它的勃起从你体内滑出，慢慢地将你放下。当它的肉棒最后一部分终于拔出时，一股绿色的史莱姆液从你体内流出，流到地上。怪物留你独自恢复体力，自己退回了附近的水中。");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(4));
         }
      }
      
      public function oozeRapesYouOrally() : void
      {
         get_player().slimeFeed();
         outputText("你在史莱姆柔软但沉重的拳头下崩溃了，头晕目眩，迷失了方向。怪物向前涌动，覆盖住你，将你压在地上，它靠在你的肚子上，将它显然巨大的重量压在你身上，让你动弹不得。它向前倾斜，它巨大的上半身轻松地笼罩着你，并且");
         if(get_player().cor < 20)
         {
            outputText("你脸红了，因为");
         }
         outputText("在它的躯干底部形成了一个形状像人类阴茎的巨大勃起物。怪物向前挺动臀部，将这个新器官推向你的脸，它的意图非常明显。[pg]");
         get_images().showImage("greenslime-oral");
         if(get_player().cor >= 70)
         {
            outputText("你带着一丝愉悦舔了舔它的顶端，注意到怪物的皮肤有些天鹅绒般的感觉，还带着一丝薄荷味。当你用舌头挑逗它时，这个东西顺从地在你的脸上滑动，你享受着它温和的味道，因为它在你的脸上留下了绿色的液体痕迹。最终，野兽向后退去，将它的顶端靠在你的嘴唇上，推了你几次，让你张大嘴巴，然后推入你的嘴里。[pg]");
            outputText("当你在嘴里前后摇晃头部并吸吮它时，它在你的嘴里前后抽插着它的阴茎头。你的嘴里开始产生一种令人愉悦的刺痛感，这个东西将自己推到你的喉咙深处并停留在那里，让你在期待中扭动。它慢慢地向后拉，然后猛烈地向前冲刺。你感觉到它阴茎柔软的物质挤进你的喉咙，扭曲着完美地填满你，越来越深，直到它庞大的身体离你的脸只有几英寸远。[pg]");
            if(get_player().cockTotal() > 0)
            {
               if(get_player().get_lust100() > 40)
               {
                  outputText("当你为怪物服务时，你勃起的[cocks]跳动着，一股更强烈的性欲流遍你的全身。你感到几乎绝望地想要释放，甚至无力地将臀部推向空气，希望能得到某种形式的释放。你试图伸手去自慰，但发现自己无法绕过史莱姆庞大的身躯。");
               }
               else
               {
                  outputText("当你为怪物服务时，你感觉到你的[cocks]开始微微变硬，一股性欲流遍你的全身。");
               }
            }
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("你的" + get_player().vaginaDescript(0) + "");
               if(get_player().cockTotal() > 0)
               {
                  outputText("也");
               }
               outputText("当你为怪物服务时，变得湿润起来，一股性欲流遍你的全身。你摩擦着双腿，对着怪物的阴茎呻吟，渴望被什么东西触碰。");
               if(get_player().cockTotal() < 1 || get_player().get_lust100() <= 40)
               {
                  outputText("你试图伸手去自慰，但发现自己无法绕过史莱姆庞大的身躯。");
               }
            }
            outputText("史莱姆让自己在你的喉咙里停留了片刻，你享受着它压在你喉咙内侧的感觉，你的整个身体开始因性欲而刺痛。不久之后，你发现自己跟着怪物一起移动，不久之后，你把它的阴茎完全吞进了喉咙，你的鼻子紧紧贴着它，试图把它哄进你体内更深处。史莱姆加快了速度，开始在你体内跳动，它阴茎的每一次跳动都让你的喉咙感觉更紧，但绝不会痛。[pg]");
            outputText("伴随着最后一次强有力的冲刺，这个东西将你的脸撞向它的臀部，你感觉到一股液体顺着它的阴茎流下，在你的胃里爆炸。在它开始拔出之前，它向你的食道里释放了几股液体，将液体滴入你的喉咙。当它把阴茎头拉进你的嘴里时，它停顿了一下，释放出最后的一股液体，当它拔出时，你迅速吞下了它。当它开始撤退时，它在你的脸上释放了最后几股液体，你舔了舔嘴唇，开始将液体揉进你的皮肤。");
            if(get_player().get_lust100() > 40)
            {
               outputText("当你开始自慰时，怪物撤退了，你疯狂地自慰，达到了快速但强烈的高潮。当你恢复过来时，它早就消失了。");
               get_player().orgasm("Lips");
            }
            else
            {
               outputText("趁你分心时，这只生物撤退了，除了在你身上留下的痕迹外，没有留下任何它存在过的踪迹。");
            }
            get_player().refillHunger(35);
         }
         else if(get_player().cor >= 20)
         {
            outputText("当这只生物强行挤进你的双唇时，你只做了轻微的抵抗，虽然你对它的决定并不感到兴奋，但肯定很高兴它没有决定杀了你。它的阴茎在开始抽插你的嘴时，会挤压、变形并膨胀以适应你嘴巴的形状，每一次抽插都越来越深。当它在你的嘴唇处停顿片刻，然后慢慢地越来越深地推入你的嘴里，接着是你的喉咙时，你做好了准备。你几乎觉得自己要作呕了，但发现这只生物独特的材质帮助它避免了这种反应。这只生物继续推进，直到你的鼻子压在它的主体上并停顿片刻，它的肉棒完全填满了你的嘴和喉咙。[pg]");
            outputText("它突然拔出，让你喘着粗气，在它离开时在你的脸上留下了一道细细的绿色液体痕迹。它稍微改变了一下重心，开始用它的一只手探索你的嘴和嘴唇，你意识到这只生物尝起来有一点薄荷味。过了一会儿，它把肉棒放回你的嘴里，快速而深深地抽插，再次填满你的喉咙，这次开始认真地抽插你的脸。它开始在你的喉咙里跳动，以一种稳定且不断加快的节奏缓慢地膨胀和收缩。你能感觉到它的性奋随着每一次抽插而增长，尽管你不想，但还是陷入了这只生物的欲望之中。[pg]");
            outputText("毫无预兆地，这只生物向前倾身，抓住你的头，在抽插时向前拉，迫使你的脸埋进它柔软的身体里，同时它的肉棒尽可能深地插入。当你为即将发生的事情做好准备时，它的肉棒几乎在颤抖，但这只生物把你拉开了，一旦你的嘴空了，一股强大的稀薄绿色液体就喷到了你的脸上。你试图把头向前推，更多是出于本能而不是有意识的想法去接住这东西的精液，结果却被它拉住，因为它在你的脸上释放了几股强大的精液洪流。[pg]");
            outputText("野兽从你身上移开，你翻身四肢着地，咳嗽着吐出绿色液体，同时恢复了理智。当你完成后，你环顾四周寻找这只生物，但除了地上的液体和你嘴里淡淡的薄荷味外，没有发现它的任何踪迹。");
            get_player().refillHunger(15);
            get_player().orgasm("Lips",false);
         }
         else
         {
            outputText("当阴茎在你的脸上摩擦时，你紧紧地闭上嘴，柔软湿润的皮肤在你的嘴周围留下了绿色液体的痕迹。你试图转过身去，但这东西从胸前长出了第三只手臂，把它压在你的嘴上。");
            if(get_player().get_inte() > get_player().get_tou())
            {
               outputText("尽管缺乏空气，你还是强迫自己闭上嘴，尽可能地坚持下去。最终你变得头晕目眩，晕了过去。当你醒来时，除了覆盖在你嘴上、胸前和你周围地上的液体外，没有这只生物的任何踪迹。");
            }
            else
            {
               outputText("尽管缺乏空气，你还是强迫自己闭上嘴，尽可能地坚持下去。最终你变得头晕目眩，本能地张开嘴大口喘气。你一这样做，这只生物就把它的阴茎猛地塞进你的嘴里，谢天谢地，它在这样做的同时松开了对你脸的抓握。当野兽填满你的嘴时，你窒息了片刻，谢天谢地，它在你喘息时停顿了一下。[pg]");
               outputText("一旦你稳住自己，你就会感觉到这东西又开始移动了，它的肉棒慢慢地强行顺着你的喉咙往下走。尽管它看起来很大，但它很容易挤压以适应你的嘴和喉咙的大小和轮廓。当它滑得越来越深时，你的眼睛微微睁大，感觉喉咙发紧。你本能地伸手去摸你的脸和喉咙，却发现自己完全无法把它推开或阻止它强行深入。摸着你的喉咙，你有点震惊地意识到，它因为顺着你喉咙下去的肉棒而微微凸起。最终，你几乎把它的长达一英尺半的肉棒吞到了根部，然后它停了下来，接着在它强暴你的嘴和喉咙时开始向后拉。");
               outputText("当史莱姆开始越来越快地抽插时，你在它下面扭动，很快它的肉棒开始有力地跳动，甚至进一步压迫你的喉咙。最终，这东西在你的嘴里进行了最后一次有力的抽插，并弓起背，将一股强大的液体洪流直接释放到你的胃里。在几次强烈的喷射之后，这东西开始拔出，当它的龟头到达你的嘴时停顿了一下，用另一股强大的喷发填满它。你试图避免吞咽，但它的突然性和巨大的数量迫使一点点顺着你的喉咙咽了下去。这东西最终完全拔出，你咳嗽着吐出剩余的汁液。[pg]");
               outputText("野兽从你身上移开，你翻身四肢着地，咳嗽着吐出绿色液体，同时恢复了理智。当你完成后，你环顾四周寻找这只生物，但除了地上的液体和你嘴里淡淡的薄荷味外，没有发现它的任何踪迹。");
            }
            get_player().refillHunger(35);
            get_player().orgasm("Lips",false);
         }
         dynStats(DynStat.Lib(2),DynStat.Sens(2),DynStat.Lust(10));
      }
      
      public function oozeButtRapesYou() : void
      {
         get_player().slimeFeed();
         outputText("在史莱姆柔软却沉重的拳头下，你瘫倒在地，头晕目眩，分不清方向。你虚弱地试图反抗，但史莱姆将你翻转过来，让你趴在地上，然后抬起你的[ass]，自己则绕到你身后。它一只手将你的头按在地上，另一只手脱去你的衣服，将它的躯干压在你身上。它的皮肤柔软、如天鹅绒般光滑且紧实，但也极易变形。你感觉到有什么东西从它的身体里长了出来，几乎立刻就明白了发生了什么。史莱姆将它湿润的肉棒在你的臀瓣间摩擦了一会儿，然后向后退去。你带着一丝恐惧意识到，这个怪物的工具一定非常巨大——至少有一英尺长，几英寸宽！它用龟头滑过你的");
         if(int(get_player().vaginas.length) > 0)
         {
            outputText(get_player().vaginaDescript(0) + "和[asshole]");
         }
         else if(get_player().balls >= 2)
         {
            outputText("[asshole]和[ballsfull]");
         }
         else
         {
            outputText(get_player().assholeDescript());
         }
         outputText("然后停留在你的后庭入口处。");
         if(get_player().analCapacity() < 18 || get_player().ass.analLooseness == 0)
         {
            if(get_player().cor <= 50)
            {
               outputText("在怪物的重压下，你颤抖着，感到一丝恐惧，担心它巨大的尺寸会对你的屁股造成伤害。");
            }
            else if(get_player().cor < 100)
            {
               outputText("尽管你对怪物的尺寸感到担忧，但一想到这只野兽要从后面进入你，你还是忍不住感到一丝兴奋。");
            }
            else
            {
               outputText("你几乎是满怀期待地舔了舔嘴唇，贪婪地向后挺起臀部，渴望感受到怪物的肉棒将你的后庭撑开。");
            }
         }
         outputText("你微微皱眉，它推挤着你的括约肌，然后插了进去。你忍不住轻喘了一声，因为它的肉棒发生了变形，在不超出你极限的情况下撑开了你的屁股。它往你体内推进了几英寸就停了下来，让你喘口气，平复一下心情。");
         get_player().buttChange(get_monster().cockArea(0),true);
         outputText("[pg]");
         get_images().showImage("greenslime-loss-butt");
         outputText("史莱姆刻意放慢速度，从你体内抽出，然后再次插入，这一次比之前更深。它继续这样抽插着，你意识到这种插入完全没有痛苦，怪物柔软湿润的身体让它能轻易地滑入你体内。没过多久，你感觉到它在你体内触底，它柔软的阴茎完美地贴合着你的内脏弯曲，它的躯干紧紧贴着你的臀部。史莱姆开始用短促、轻浅的动作操你，随着怪物体液的积聚，你感觉到屁股里变得湿润起来。它开始加快并加深抽插，你感觉到体内升起一股热流，怪物的体液显然有催情的作用。[pg]");
         outputText("没过多久，你发现自己在野兽的攻击下呻吟起来，尽管你试图克制，但当它抽插你的屁股时，快感还是席卷了你的下体。");
         if(get_player().cockTotal() > 0)
         {
            outputText("当它的阴茎不断从内部摩擦你的前列腺，刺激着它时，你感到一阵阵快感流遍全身。");
         }
         outputText("它的肉棒微微移动，在持续、沉重的跳动中不断地微小地膨胀和收缩。");
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("在怪物的拥抱下，当它像活塞一样在你的屁股里抽插时，你很快就勃起了，没过多久，你就完全硬挺了。当它抽插你时，你虚弱地用一只手摩擦着自己，很快就接近了高潮。");
            }
            else
            {
               outputText("在怪物的拥抱下，当它像活塞一样在你的屁股里抽插时，你的" + get_player().multiCockDescript() + "很快就勃起了，没过多久，你就完全硬挺了。当它抽插你时，你虚弱地用两只手分别摩擦着不同的肉棒，很快就接近了高潮。");
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("随着怪物的持续侵犯，你的" + get_player().vaginaDescript(0) + "变得湿润起来，你的阴唇开始渴望温柔的抚摸。仿佛感知到了你的想法，怪物顺从地用一只手环绕着你的身体，开始在你的阴缝上滑动，并交替抚摸你的[clit]。");
         }
         outputText("[pg]");
         outputText("随着怪物的性欲不断高涨，它开始更加有力地跳动，你的性欲也随之增长，这种兴奋感既来自性欲，也来自恐惧。伴随着最后一次有力的冲刺，怪物将它的整个长度都塞进了你的体内，你感觉到一股液体流过它的整个阴茎，然后从顶端喷发出来。你张开嘴，无声地喊叫着，因为你暂时失去了声音，无法发出任何声响，液体像无尽的溪流一样涌入你的体内，它的阴茎也随之膨胀。");
         if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().cockTotal() > 0)
            {
               outputText("怪物终于将两根手指插入你的" + get_player().vaginaDescript(0) + "，再加上对你前列腺的额外压力，你终于高潮了，比以往任何时候都要强烈。当这种感觉席卷你的全身时，浓稠的精液喷洒在地上。");
            }
            else
            {
               outputText("怪物终于将两根手指插入你的" + get_player().vaginaDescript(0) + "，突如其来的刺激终于将你推向了高潮。");
            }
         }
         else if(get_player().cockTotal() > 0)
         {
            outputText("对你前列腺的额外压力终于将你推向了边缘，你猛烈地高潮了，将你的精液喷洒在地上。当这种感觉席卷你的全身时，浓稠的精液喷洒在地上。");
         }
         outputText("当怪物慢慢开始从你体内拔出时，你在它身下颤抖，这让你的嘴唇又发出一声呻吟。当它终于从你的身体里拔出来时，你感觉到一股液体从你的屁股里涌出，流到地上。当怪物退回水中时，你恢复了过来，只留下了一条通向水边的粘液痕迹。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(4));
      }
      
      public function maleRapesOoze() : void
      {
         var _loc1_:* = null as CockTypesEnum;
         outputText("注意到自己的勃起，你决定面前这个东西的异常性质充其量只是个小问题，并决定操它以满足自己的欲望。[pg]");
         outputText("你走近怪物并检查它，发现它并没有什么真正的孔洞。");
         if(Utils.rand(2) == 0)
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("你耸了耸肩，决定就近解决，于是走向它的头部。你花了一会儿时间决定用哪个器官来蹂躏这个生物，最终选择了最大的那个，");
            }
            else
            {
               outputText("你耸了耸肩，决定就近解决，于是走向它的头部，同时掏出你的[cock]。你跪在这个东西的头部上方，轻轻抚弄你的阴茎，确保它完全准备好，");
            }
            if(get_player().balls > 1)
            {
               outputText("同时用你的[sack]涂抹史莱姆的脸。[pg]");
            }
            else
            {
               outputText("用空着的手试探着这个生物的“嘴巴”。[pg]");
            }
            get_images().showImage("greenslime-rape-orally");
            outputText("你后退了一会儿，将阴茎向下瞄准，把");
            _loc1_ = get_player().cocks[0].get_cockType();
            if(_loc1_ == CockTypesEnum.DOG)
            {
               outputText("尖锐的顶端");
            }
            else if(_loc1_ == CockTypesEnum.HORSE)
            {
               outputText("膨大的龟头");
            }
            else if(_loc1_ == CockTypesEnum.HUMAN)
            {
               outputText("顶端");
            }
            else if(_loc1_ == CockTypesEnum.TENTACLE)
            {
               outputText("圆润的顶端");
            }
            else
            {
               outputText("顶端");
               CoC_Settings.error("错误：不支持的阴茎类型，默认为顶端。");
            }
            outputText("抵在它嘴巴的内侧并用力推。你感觉到材质的弹性，于是更加用力地推，覆盖在史莱姆外部的膜状物质顽固地拒绝屈服。最后，在经历了一些挫折后，你抓住这个生物大概是脖子的地方，试图把它拉向你的骨盆，同时向前挺进。它终于屈服了，你看到你的[cock]涌入它的嘴里");
            if(get_player().cocks[0].cockLength >= 12)
            {
               outputText("，顺着它的喉咙，");
            }
            if(get_player().cocks[0].cockLength >= 24)
            {
               outputText("进入它的躯干，");
            }
            if(get_player().cocks[0].cockLength >= 48)
            {
               outputText("一直穿透到它的臀部，");
            }
            outputText("并满意地咕哝了一声。你开始慢慢地拔出，然后再插进去，感觉到一阵湿润，某种液体包裹着你的阴茎。");
            if(get_player().cor >= 60)
            {
               outputText("你有一瞬间怀疑自己是不是弄破了这个生物的膜状皮肤，然后耸了耸肩，决定不去管它。");
            }
            else
            {
               outputText("你有一瞬间怀疑自己是不是弄破了这个生物的膜状皮肤，但这个生物持续跳动的勃起表明它并没有感到太大的痛苦。");
            }
            outputText("[pg]");
            outputText("你开始更加用力地抽插，直到你的臀部紧紧贴在软泥的皮肤上，你感觉到自己比平时更快地接近高潮，因为你的[cock]开始感到温暖且极其敏感。奇怪的是，当你在抽插这个生物的嘴巴时，它似乎恢复了一些之前坍塌时失去的轮廓，它双腿之间的突起成型为一根完全清晰的人类阴茎");
            if(get_player().balls > 1)
            {
               outputText("当你的[balls]拍打在它的脸上时");
            }
            outputText("它的一只手举起来，怯生生地揉搓着自己的勃起。你咧嘴一笑，这更加激起了你的欲望，你开始更用力地抽插。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("当你不断地将自己塞进这生物的喉咙时，你的" + get_player().vaginaDescript(0) + "开始变得湿润。你深深地抽插了一次，直达这生物的深处，将你湿润的女性部位贴着它柔软性感的脸庞摩擦。");
            }
            outputText("[pg]");
            outputText("没过多久，你发现自己大叫着将精液注入这生物体内，看着精液被看不见的水流卷走，散布在它的身体里。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("紧接着，你的下唇间一阵颤抖，你的" + get_player().vaginaDescript(0) + "随后也在高潮中颤抖起来。");
            }
            outputText("你慢慢地将你的[cock]从那东西的脸上拔出来，回味着那种感觉，当你的龟头最终离开那生物时，发出了一声清晰的*啵*声。你脸上浮现出满足的笑容，这只被打败的野兽的勃起缩了回去，然后滑落，回到了附近的水中。");
         }
         else
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("你对它没有明显的孔洞耸了耸肩，决定选择最常见的一个，挑了你");
               if(get_player().cockTotal() == 2)
               {
                  outputText("较大的");
               }
               else
               {
                  outputText("最大的");
               }
               outputText("[cocks]，你抓住史莱姆，粗暴地试图把它翻过来。令人惊讶的是，它保持了凝聚力，翻倒在一侧，它的勃起湿漉漉地拍在地上。[pg]");
            }
            else
            {
               outputText("你对它没有明显的孔洞耸了耸肩，决定选择最常见的一个，掏出你的[cock]，你抓住史莱姆，粗暴地试图把它翻过来。令人惊讶的是，它保持了凝聚力，翻倒在一侧，它的勃起湿漉漉地拍在地上。[pg]");
            }
            get_images().showImage("greenslime-rape-anally");
            outputText("你将你的阴茎对准你认为应该是屁眼的地方，然后推了进去，当你穿透薄膜，进入一个紧致深邃的洞穴时，你笑了。");
            if(get_player().cocks[0].cockLength >= 24)
            {
               outputText("当你最终插到底时，你的[cock]几乎穿过了它一半的躯干。");
            }
            else if(get_player().cocks[0].cockLength >= 48)
            {
               outputText("当你最终插到底时，你的[cock]几乎够到了史莱姆的脖子。");
            }
            else if(get_player().cocks[0].cockLength >= 60)
            {
               outputText("你的阴茎越插越深，穿过胸部、脖子和头部，最后将史莱姆撑到了能容纳你整个[cock]长度的程度。");
            }
            outputText("带着满意的微笑，你开始抽插，起初很慢，然后加快了速度。史莱姆的肛门感觉比你以前经历过的任何东西都要好，显然自带润滑，但仍然很紧，像一个量身定制的性玩具一样紧紧包裹着你的阴茎。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("当你操弄那东西的洞穴时，你的" + get_player().vaginaDescript(0) + "变得湿润，你的臀部每一次拍打那东西的屁股，都会让你的下体传来一阵快感。");
            }
            outputText("仅仅几分钟后，你意识到你坚持不了多久了，因为这生物体内的某些东西似乎让你格外敏感。你决定充分利用这一点，加快了一倍的速度，咬紧牙关，尽情享受史莱姆带来的快感，直到");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的[cocks]在高潮中爆发，你的精液填满了这生物体内的空间，并以浓稠的液流喷洒在它的背上。");
            }
            else
            {
               outputText("在它体内爆发，你的精液用白色的乳状液体填满了你阴茎周围的空间。");
            }
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("当你将精液注入这生物体内时，一股几乎像触电般的感觉流遍全身，从你的" + get_player().vaginaDescript(0) + "开始向外辐射。");
            }
            outputText("当你拔出时，这东西似乎把你夹得更紧了，你很享受这种感觉。它紧致的屁股让你的[cock]在事后几乎干干净净，当它变回原来那无定形的形态时，一团白浊仍然留在它体内。随着史莱姆溜走，云雾也散去了。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(3));
      }
      
      public function femaleRapesOoze() : void
      {
         get_player().slimeFeed();
         outputText("当你盯着史莱姆那根跳动的勃起物时，你感觉到自己女性的一面在躁动，于是决定利用它现在的状态来满足自己的欲望。你脱下衣服走上前去，跨坐在它的腿上，用手抚摸着它的阴茎。你把它拉近你的身体，抚摸着那柔软、天鹅绒般、微微湿润的肉棒，");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("你的" + get_player().vaginaDescript(0) + "变得湿润，你的[cock]也因为想象它进入你体内而变得坚挺。");
         }
         else
         {
            outputText("想象着它进入你体内，你变得湿润起来。");
         }
         if(get_player().biggestTitSize() > 8)
         {
            outputText("你咧嘴一笑，身体微微前倾，让你的" + get_player().allBreastsDescript() + "贴在它的阴茎上。你把它拉向前，夹在双乳之间，用胸部包裹着它，慢慢地按摩着那根肉棒。随着你的胸部开始感到湿滑，你感觉到它开始跳动和抽搐，于是你坐起身来，以防史莱姆过早射精。当你从它身上拉开时，你有些高兴地注意到，它原本模糊不清的肉棒现在变成了一根完美雕塑般的人类阴茎，足足有一英尺半长，而你的乳房现在覆盖着一种奇怪的绿色液体。[pg]");
         }
         else if(get_player().biggestTitSize() > 3)
         {
            outputText("你调皮地笑了笑，俯下身，将胸部压在它的阴茎上。你慢慢地开始前后移动，史莱姆也积极回应，随着你的身体节奏慢慢地摆动臀部，同时那根肉棒也在剧烈地跳动和抽搐。你睁大眼睛看着那根肉棒发生变化，变成了一根完美雕塑般的人类阴茎，足足有一英尺半长。感觉到这东西快要射了，你慢慢地从它身上移开并坐起身来，你的胸部现在覆盖着一种绿色的液体。[pg]");
         }
         else if(get_player().biggestTitSize() >= 0)
         {
            outputText("你将它的阴茎紧紧贴在你的身体上，双手顺着它的长度抚摸，在你的肚子上摩擦，那根肉棒在你的触摸下跳动和抽搐。你微微前倾，将它的顶端在你的" + get_player().allBreastsDescript() + "上摩擦，看着它留下一点绿色的液体，你笑了。在忍受了你短暂的服侍后，它开始随着你的节奏摆动臀部。你强忍着轻微的喘息，看着那根粘液肉棒发生变化，变成了一根完美雕塑般的人类阴茎，足足有一英尺半长。[pg]");
         }
         outputText("没过多久，你就无法抵挡诱惑，将臀部翘到半空中，轻声呻吟着，用它那根肉棒的顶端摩擦着你的" + get_player().vaginaDescript(0) + "。");
         if(get_player().vaginas[0].virgin)
         {
            if(get_player().cor <= 20)
            {
               outputText("当你悬停在它上方时，你犹豫了片刻，一阵突如其来的紧张感涌上心头。这可是只有一次的时刻。你让自己的重量将它推入你的体内，一开始很慢，然后强迫自己尽可能深地坐下去。你因为最初的疼痛而喘息，但随着它的液体用一种凉爽、舒缓的液体覆盖你的内部，疼痛很快就消散了。[pg]");
            }
            else
            {
               outputText("当你把自己撞向它，终于夺走自己的初夜时，你笑了。你很快开始移动，并发出一声愉悦的喘息，因为它的液体用一种凉爽、舒缓的液体覆盖了你的内部。[pg]");
            }
         }
         else if(get_player().vaginalCapacity() >= 18)
         {
            outputText("你热情地将自己降到史莱姆的阴茎上，当它滑入你体内时，你发出了一声小小的惊呼。它很快明白了你的意图，伸出双手，开始疯狂地抽插你。[pg]");
         }
         else
         {
            outputText("你对史莱姆阴茎的巨大尺寸感到犹豫，而它感觉到了你的犹豫，伸出强壮的手臂抓住你的屁股，强行将你推到它身上。[pg]");
         }
         get_images().showImage("greenslime-rape-vagoo");
         outputText("那东西的肉棒虽然坚硬，但不知为何却能根据需要挤压和膨胀，完美地贴合你的内部，在你骑乘它时轻松地适应你的" + get_player().vaginaDescript(0) + "。");
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("当你被插入时，你的[cock]变硬了，随着它控制着动作，你伸手下去给自己打飞机。");
            }
            else
            {
               outputText("当你被插入时，你的阴茎变硬了，随着它控制着动作，你伸手下去，每只手都撸动着不同的阴茎。");
            }
         }
         outputText("[pg]");
         outputText("史莱姆用力地抽插着你，引得你发出阵阵发情的呻吟，你向前倾身，终于屈服于本能。你发现当你靠在它的胸膛上时，它可以轻松支撑你的重量，你把它当作杠杆，用臀部顶撞它。过了一会儿，史莱姆开始对你的呻吟和喘息做出近乎完美的反应，改变它的节奏和大小，达到了令人难以置信的效果。在整个过程中，你感觉异常湿润，它的润滑液与你自己的混合在一起。它有一种催情的效果，增强了你的感觉，让你在操它时感觉你的" + get_player().vaginaDescript(0) + "很热。");
         outputText("没过多久，你彻底瘫软下来，将全身的重量都压在它身上，而它则将你的[hips]紧紧拉向它自己。当这东西开始在你体内搅动，用它的阴茎剧烈地按摩你的内部时，你发出了一声响亮的喘息。没过多久，这就把你推向了高潮的边缘，你紧紧抓住史莱姆，尽可能用力地将自己压在它身上。");
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("你的[cocks]同时爆发高潮，射出");
               outputText(Utils.num2Text(int(get_player().cocks.length)));
               outputText("浓稠的精液喷射在你和怪物身上，巨大的释放感让你的大脑一片空白。当你沉浸在快感中时，你隐约注意到你的精液渗入了怪物的身体并被吸收了。");
            }
            else
            {
               outputText("你的[cock]在高潮中爆发，将浓稠的精液喷射在你和怪物身上，释放的快感让你的大脑一片空白。当你沉浸在快感中时，你隐约注意到你的精液渗入了怪物的身体并被吸收了。");
            }
         }
         outputText("你感觉到一股液体涌入你的体内，");
         if(!get_player().vaginas[0].virgin)
         {
            outputText("不像精液那么浓稠，");
         }
         outputText("将你填得满满当当，顺着怪物的肉棒流出，让你的肚子微微隆起，身下的地上也积聚了一滩绿色的液体。你趴在怪物身上，喘着粗气，屏住呼吸，它抓着你的手慢慢松开。它的肉棒从你体内滑出，大量的液体从你的" + get_player().vaginaDescript(0) + "中涌出，开始从你身下漏出，它轻轻地将你放在地上。你在地上颤抖了一会儿，才回过神来，当你清醒过来时，你发现怪物已经离开了。除了通向附近水域的一条细细的绿色液体痕迹外，你找不到怪物存在过的任何痕迹。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(3));
      }
   }
}

