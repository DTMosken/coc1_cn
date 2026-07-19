package classes.scenes.areas.volcanicCrag
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs.pregnancies.PlayerCorruptedWitchPregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class CorruptedWitchScene extends BaseContent
   {
      
      public function CorruptedWitchScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         new PlayerCorruptedWitchPregnancy(param1);
      }
      
      public function startFight() : void
      {
         clearOutput();
         outputText("你告诉她，你不是那种随便和世界上任何一个人做爱的人。");
         if(get_player().lib > 70)
         {
            outputText("这有点像是在撒谎。");
         }
         outputText("你准备好武器，堕落魔女的双手亮起光芒，准备施展黑魔法。[say: 我不是在请求。我现在就要得到我需要的东西。]");
         startCombat(new CorruptedWitch());
      }
      
      public function mindControlBadEndVagina2() : void
      {
         clearOutput();
         get_player().vaginas[0].vaginalWetness = 5;
         outputText("一个月后，你从牢房中被释放，并被带到了繁育室。你的大脑一片空白，整个人极度沮丧。你已经太久没有怀孕了，你觉得你已经没有活下去的理由了。每一天，你的折磨者们都会用她们的肉棒挑逗你，但她们从未插入或让你受孕。你的[vagina]不断地收缩，喷出淫液，准备好榨干任何有幸进入其中的肉棒。你的整个身体都在燃烧，你不断地揉捏着自己的乳头，试图从你的处境中榨取一丝快感，尽管你不被允许高潮。");
         outputText("[pg]繁育室的门被打开了，里面有十一位正值青春年华、赤身裸体的女巫躺在床上，围成一个圆圈，她们的小穴闪烁着水光，流淌着渴望的淫液。圆圈中有一张空床。[say:很好，种马，]你的一位折磨者在你耳边低语。[say:你自由了。]");
         outputText("[pg]你几乎当场哭了出来，你冲向那张空床，躺了下来，为即将到来的受孕做准备。你抚摸着自己的全身，拼命地克制自己不去触碰那颤抖的小穴。你知道，如果你碰了，你就会被强行送回牢房，再被剥夺释放和受孕的机会一个月。");
         outputText("[pg]片刻之后，先列腺液和肉棒的美味气息钻入你的鼻腔，让你的小穴立刻喷出水来。另一名女巫走进了房间，她是个双性人，胯下长着一根八英寸长、滴着淫液的肉棒。另一名女巫在她耳边低语了几句，这名双性人便冲到了圆圈的中央。");
         outputText("[pg]她选择了你作为她的第一个伴侣。她粗暴地抓住你的[legs]，将你拉近，立刻将肉棒齐根没入你的体内。你的脑海中除了快感什么都不剩，几乎当场高潮。这个双性人开始像野兽一样发情，无情地捣弄着你，每一次抽插都让你喷出淫液，溅满她的腹股沟。你用力揉捏着自己的乳头，咬紧嘴唇，完全沉浸在这不可思议的操弄中。");
         outputText("[pg]她再次将肉棒深深插进你的体内，停止了抽插。仿佛出于条件反射，你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("缠绕上去，紧紧绞住女巫");
         }
         if(get_player().isGoo())
         {
            outputText("包裹住女巫");
         }
         else
         {
            outputText("用你的[legs]将女巫紧紧锁在身上");
         }
         outputText("，意识到她马上就要射精了。她将一股又一股的精液倾泻在你的子宫里，你的小穴在呻吟中不断收缩，榨干她那根美妙肉棒能提供的每一滴精液。在几次释放之后，你放开了她，精疲力尽。她开始去操其他幸运的女巫，而你躺在床上，脸上挂着微笑。");
         outputText("[pg]你知道你的子宫还没被填满，可能还不会怀孕。今天你还得被操好几次才能保证受孕。");
         outputText("[pg]你的小穴开始发痒，欲望再次流遍全身。当然，你不需要自慰。很快就会有另一个双性人女巫来享用你。你简直等不及了。这是你余生的第一天。");
         outputText("[pg]而且这正如你想象的那般美妙。");
         get_game().gameOver();
      }
      
      public function mindControlBadEndVagina() : void
      {
         clearOutput();
         outputText("当你醒来时，你跪在地上，双手被锁在地上。你抬起头，看到了你梦中的那位年长女巫。");
         outputText("[pg][say:又来了一个，]她说道。当她捧起你的头，将它转向两侧以充分审视你的容貌时，你发出了一声呜咽。[pg][say:[He]很有潜力。我将立刻开始对[his]转化。]");
         outputText("[pg]束缚你的手铐被解开了，但你却没有任何想要反抗或逃跑的冲动。你只是顺从地低下了头。[say:做得好，我的种马，]她说道。她的话语让你心中充满了喜悦。她将手伸向你的胸口，指尖燃起了一团透明的白色火焰。她用那火焰触碰你的胸膛，你呻吟出声，整个身体瞬间被情欲和渴望点燃。你的[vagina]不断地张开又收缩，流淌着淫液，乞求着肉棒的填满。[pg]");
         if(get_player().isPregnant())
         {
            outputText("[pg][say:我们知道，你已经怀孕了，]年长的女巫说道。[say:在我的影响下，你的孕期会迅速推进，你的孩子也会得到妥善照顾。然后，你将开始作为种马的训练。]听到她的话，一些淫液顺着你的[legs]流了下来。[say:这个集会的女巫们被诅咒了，无法生育。你的帮助对我们打破这个魔咒、壮大我们的队伍至关重要。][pg]");
         }
         else
         {
            outputText("[pg]你感到内心有一种令人沮丧的空虚。你的子宫需要被填满，你需要繁衍后代来实现你人生的目标。[say:这个集会的女巫们，]年长的女巫说道，[say:被诅咒了，无法生育。你的帮助对我们打破这个魔咒、壮大我们的队伍至关重要。][pg]");
         }
         outputText("[pg]你的欲望达到了顶峰，你把手伸向了你的[vagina]。女巫立刻拍开了你的手。[say:不许自慰。我们需要你对我们以及我们的事业绝对忠诚，]她说道，对你那压倒性的需求无动于衷。[pg][say:首先，一个月内不准高潮。]你的眼眶湿润了，对自己的命运感到绝望，却又无力反抗你的女主人。[say:每天会有两位我们的姐妹进入你的牢房，她们的职责就是不断地挑逗你，直到你濒临高潮的边缘。你接受这个安排，对吧，种马？]");
         outputText("[pg]你点了点头。你无法违抗她的意志。");
         doNext(mindControlBadEndVagina2);
      }
      
      public function mindControlBadEndCock2() : void
      {
         clearOutput();
         outputText("一个月后，你从牢房里被释放，并被带到了繁殖室。你的大脑一片空白，在两个折磨你的人的搀扶下，你慢慢地向目的地走去。你的" + (get_player().cockTotal() > 1 ? "[cocks]" : "[cock]") + "痛苦地勃起着，你每呼吸一次，先列腺液就会溅到你的腹部。[pg]");
         outputText("繁殖室的门打开了，里面有十几个年轻赤裸的女巫躺在床上，围成一圈，她们的小穴闪闪发光，流淌着渴望的液体。强烈的女性体液气味征服了你的鼻腔。[say: 很好，种马，]其中一个折磨你的人在你耳边低语。[say: 你自由了。]");
         outputText("[pg]你绝望地睁大眼睛，发出一声喉音般的咆哮。你冲向圆圈的中心，开始用野兽般的力量操其中一个心甘情愿的女巫，像一只没有思想的雄蜂一样抽插和活塞运动。她呻吟着，揉捏着自己挺拔的乳头，当你抽插时，女性的汁液溅满了你的胯部。无论它落在哪里，你都会感到皮肤刺痛，欲望加剧，促使你更加不顾一切地操她。在你的世界里，除了繁殖的欲望，什么都没有。");
         outputText("[pg]高潮降临，当你把精液如洪流般射入女巫的子宫时，她合拢双腿，榨干你的[onecock]。你在那里呆了一会儿，紧紧地夹住，一股又一股的精液射入她的体内，很快就溢出了她的子宫，导致一些精液喷射到地上。这次高潮最终彻底摧毁了你的理智，但你的性欲并没有动摇。你立刻转向下一个女巫。她向你张开流着口水的小穴，阴道肌肉紧缩，仿佛在挤奶一根看不见的肉棒。[pg]你沐浴在她的女性麝香中，你的勃起强度翻倍，导致你的[cockhead]疯狂地膨胀，并向你的下一个受害者喷射出几团先列腺液。当它落在她的胸部时，她呻吟着，把先列腺液涂抹在她的乳房和腹肌上。伴随着另一声咆哮，你又开始了你的发情。这是你余生的第一天。");
         outputText("[pg]而且这正如你想象的那般美妙。");
         get_game().gameOver();
      }
      
      public function mindControlBadEndCock() : void
      {
         clearOutput();
         outputText("当你跟着她时，你的视线变得模糊，你所能看到的只有女巫模糊的轮廓在引导着你。即使你闭上眼睛，她依然在那里，召唤你进入她那充满屈服的乐园。你睡着了。[pg]");
         outputText("当你醒来时，你跪在地上，双手被锁在地上。你抬起头，看到了你梦中的那位年长女巫。");
         outputText("[pg][say:又来了一个，]她说道。当她捧起你的头，将它转向两侧以充分审视你的容貌时，你发出了一声呜咽。[pg][say:[He]很有潜力。我将立刻开始对[his]转化。]");
         outputText("[pg]束缚你的镣铐被解开了，但你却没有任何反抗或逃跑的冲动。你只是顺从地低下了头。[say:做得好，我的种马，]她说道。她的话语让你充满了喜悦。她将手伸向你的胸膛，指尖燃起一团暗色透明的火焰。她用手指触碰你的胸膛，你的整个身体立刻被情欲和渴望点燃。在快感的冲击下，[eachcock]喷射出精液，你绝望地睁大眼睛，心中充满了想要与什么东西交配的难以忍受的渴望。");
         outputText("[pg]你伸手去抓[onecock]，但你的手被女主人拍开了。[say:我还不能让你高潮。我们需要知道你是否真的对我们，以及我们的事业忠诚，]她说道，对你压倒性的需求无动于衷。[pg][say:首先，一个月不准高潮。]你的眼眶湿润了，对自己的命运感到绝望，但又无法反抗你的女主人。[say:我们每天会有两位姐妹去你的牢房陪你，她们的任务就是不断地挑逗你，直到你高潮的边缘。你接受这个安排，对吧，种马？]");
         outputText("[pg]你点了点头。你无法违抗她的意志。");
         doNext(mindControlBadEndCock2);
      }
      
      public function mindControlBadEnd() : void
      {
         clearOutput();
         outputText("你在眨眼间被从恍惚中猛拉了出来。[say: 我不会射的，]你大声说道。现实击中了你，你看着那个面露胜利之色的女巫。[pg][say: 那好吧。我要走了，]她微笑着说道。");
         outputText("狂野的绝望阻止了你的动作。这一切怎么可能不是真的？你希望它是真的！它必须是真的！你需要屈服于女巫们，充当她们的配种机器！");
         outputText("[pg][say: 求求你，停下！]你大声说道。");
         outputText("[pg]女巫微笑着伸出手，示意你跟上。[pg]");
         if(get_player().hasCock())
         {
            doNext(mindControlBadEndCock);
            return;
         }
         if(get_player().hasVagina())
         {
            doNext(mindControlBadEndVagina);
            return;
         }
      }
      
      public function loseToWitch() : void
      {
         clearOutput();
         statScreenRefresh();
         if(get_player().hasCock())
         {
            get_player().orgasm("Dick");
         }
         else
         {
            get_player().orgasm("Vaginal");
         }
         if(get_player().get_HP() <= 0 && get_player().get_gender() != 0)
         {
            outputText("你因伤倒下，动弹不得，痛苦地呻吟着，意识逐渐模糊。");
            outputText("[pg][say: 噢，真抱歉把你伤得这么重。求你了，让我帮你吧，]她说着，拔开了一个装满浓稠粉色液体的烧瓶的塞子。她强行把液体喂给你，当她把这奇怪的液体灌进你嘴里时，你感觉伤口正在愈合。你感到体力恢复了，站起身来，准备再次与她战斗，或者干脆回营地去。");
            outputText("[pg]当注意到自己的皮肤变得更加敏感、因欲望而发痒时，你的计划很快就改变了。你开始漫不经心地抚摸自己的全身，无法抗拒这带来的快感。");
            if(get_player().hasCock())
            {
               outputText("站在原地，你能闻到小穴散发出的麝香味，这让你的思绪变得浑浊。你感到一种难以忍受的交配冲动，[eachCock]开始滴下淫液并跳动着，做好了准备。");
               get_player().goIntoRut(false,2);
            }
            if(get_player().hasVagina())
            {
               outputText("你的[vagina]变得湿润，随着阴蒂的肿胀，你能感觉到血液涌向阴唇。你的脑海中充满了幸福的幻想：被按倒在地粗暴地交配，被强行注入精液，然后生下好几个孩子。");
               get_player().goIntoHeat(false,2);
            }
            outputText("那烧瓶里到底装了什么鬼东西？");
            outputText("[pg][say: 你看起来精神多了！催情药水，只加了一点点牛头人的精液。能让任何人兴奋起来！]");
         }
         outputText("你因无法抑制的欲望而倒下，几乎无法控制自己不" + get_player().clothedOrNakedLower("撕下你的[armor]并") + "当场自慰。[pg]");
         outputText("[pg]女巫盘腿坐在附近的一块石头上，脸上带着邪恶的笑容。[say: 我还以为你不想做爱呢？我看你憋得挺难受的。]你用充满怒火的眼睛瞪着她，但当她松开双腿时，你隐约瞥见了她的下体，怒火瞬间化作了情欲。[pg]");
         outputText("[pg][say: 别担心，我会得到我想要的。但不会有性交，就像你希望的那样。双赢！]你不确定违抗她是不是个好主意。");
         outputText("[pg]她站起身，脱去衣物，你沐浴在她那汗津津、线条分明的雪白娇躯的光辉之中。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]开始变硬，乞求着品尝她的小穴。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]开始渗出淫液，渴望被填满。");
         }
         outputText("[pg][say:在我做任何事之前，向我证明你真的需要做爱。我还不确定。]");
         if(get_player().get_gender() == 3)
         {
            outputText("绝望而又心甘情愿地，你跪了下来" + get_player().clothedOrNakedLower("，脱下你的[armor]，") + "并开始自慰。你勤奋地套弄着[eachCock]，挑逗着你的[vagina]，同时揉搓着你的阴蒂。你的心跳和呼吸加快，你闭上眼睛，充分感受着这美妙的滋味。你的动作越来越快，你的小穴流着淫水，你的肉棒溢出了先列腺液，你扑倒在地上，想要完成你的工作。[pg]");
            outputText("[pg]突然，你感到身体僵硬，动弹不得。女巫对你施了法术！[say:抱歉，我还没被说服。]她用某种念力将你从地上抬起，直勾勾地看着你，你注意到她长出了一根20厘米长的肉棒。[say:我想你需要一些帮助。]经过一段简短的咒语，她将双手放在你的肚子上，你感到你的欲望更加强烈了。[Eachcock]变得肿胀，你的[vagina]现在喷出了淫水，你的呼吸急促，你的绝望感变得更加庞大。[pg]");
            outputText("你向她低声恳求，瘫痪使你无法正常说话。[say:什么？你想要什么？]女巫娇嗔地说着，同时开始移动你。你体内的热量加剧，你翻着白眼，在她的法术下悬在半空中颤抖。你拼命地想说出一句完整的话。[pg]");
            outputText("[pg]你还没说完，她突然迅速地将自己完全插入了你的[vagina]。你大声呻吟，庆幸她的折磨终于结束了。她抽插了几下，你在极乐的满足中微笑着。[pg]抽插了不到十几次，她停下来并抽出了肉棒，留下你的[vagina]夹着空气，同时流着男女的体液。你惊愕地睁大了眼睛，但你仍然发现自己无法正常说话。[pg][say:对不起，我就是做不到。我不喜欢操那些不想要的人。我还是自己自慰解决吧。][pg]");
            outputText("[pg]你从法术中解脱出来，倒在地上，对自己的处境感到困惑。女巫坐在一块石头上，开始抚摸她的肉棒，另一只手调皮地挑逗着她的阴蒂，夸张地呻吟着。你完全被她的肉棒、她的乳房、她美丽健美的身体的动作迷住了。你注意到她正在加快速度，她很快就会高潮。理智离开了你的大脑，你绝望地跑向她，在一个动作中，用力将她的肉棒塞进你的[vagina]，几乎当场高潮。[pg]");
            outputText("[pg][say:我开始觉得你想强奸我了！]她靠在石头上说道。意识到她不会开始抽插，你决定替你们俩完成这项工作。你疯狂地扭动着你的[hips]，用力夹紧她的肉棒，汗水从你的身体上滴落，你张着嘴，舌头伸出来喘着粗气。她的法术加上她不断的拒绝只会加剧你的欲望，此时此刻，你的脑海里除了你的小穴和她美丽的灰白色肉棒之外，什么都没有。");
            outputText("[pg]你感觉到她的身体紧绷起来，你意识到她的高潮即将来临。在你还没来得及从她身上拔出之前，她突然抓住了你的[hips]，将你紧紧地锁在她身上。她伸出手开始套弄[oneCock]，突然增强了你的快感，将你推向了高潮的边缘。");
            if(get_player().cumQ() < 100)
            {
               outputText("[pg]当她在你体内释放时，你也高潮了，在空中射出几股精液。你的[legs]无力地颤抖着，沉浸在她的肉棒用她的种子涂满你子宫的极乐感觉中。");
            }
            if(get_player().cumQ() >= 100 && get_player().cumQ() < 1000)
            {
               outputText("[pg]当她在你体内释放时，你也高潮了，在空中射出几股浓稠的精液。你的[legs]无力地颤抖着，沉浸在她的肉棒用她的种子涂满你子宫的极乐感觉中。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("[pg]当她在你体内释放时，你也高潮了，在空中射出一股浓稠的精液。你的[legs]无力地颤抖着，沉浸在她的肉棒涂满你子宫的极乐感觉中。");
            }
            if(get_player().vaginalCapacity() >= 100)
            {
               outputText("你的[vagina]和子宫愉快地接收了她所有的精液，在她射精结束后很久还在继续榨取她的肉棒，你的肚子因为装了这么多液体而胀了起来。");
            }
            if(get_player().vaginalCapacity() < 100 && get_player().vaginalCapacity() > 50)
            {
               outputText("你的[vagina]和子宫勉强接收了她的一大半精液，但有些喷了出来，无法容纳所有的东西。");
            }
            if(get_player().vaginalCapacity() <= 50)
            {
               outputText("你的[vagina]和子宫勉强容纳了最初的几下抽插，剩下的猛烈地喷了出来，落在地上，在炎热的土地上迅速干涸。[pg]");
            }
            outputText("[pg]在理智之外得到了满足，你倒在地上，几乎要昏睡过去。[say: 哎呀，你可真是个调皮鬼，竟然那样强暴我。不过别担心，如果你怀孕了，你可以指望我们，]她说道。你转头看着她，注意到你自己的精液正漂浮在空中，成了她念动力的目标。她将它引导进一个烧瓶，然后重新穿上她暴露的衣服。[pg]");
            outputText("[pg]她离开了，你睡着了。真是漫长的一天。[pg]");
            corrWitchPregChance();
            if(!get_player().isPregnant())
            {
               get_player().knockUp(38,240,120);
            }
         }
         if(get_player().get_gender() == 2)
         {
            get_player().cuntChange(8,true,true,false);
            outputText("绝望而又情愿，你跪了下来" + get_player().clothedOrNakedLower("，脱下你的[armor]，") + " 并开始自慰。你勤奋地挑逗你的[vagina]，同时揉搓你的阴蒂。你的心跳和呼吸加快，闭上眼睛充分体会这种感觉。你的节奏加快，你的小穴疯狂地流着淫水，你扑倒在地上完成你的工作。[pg]");
            outputText("[pg]突然，你感到身体僵硬，动弹不得。女巫对你施了法！[say:我还没被说服呢，抱歉。]她用某种念力将你从地上举起，直勾勾地看着你，你注意到她长出了一根20厘米长的肉棒。[say:我想你需要一点帮助。]经过短暂的咒语吟唱，她将双手覆在你的肚子上，你感到你的欲望更加强烈了。你的[vagina]现在正喷出淫液，你的呼吸急促，你的绝望感变得更加强烈。[pg]");
            outputText("你向她低声恳求，瘫痪使你无法正常说话。[say:什么？你想要什么？]女巫娇嗔地说着，同时开始移动你。你体内的热量加剧，你翻着白眼，在她的法术下悬在半空中颤抖。你拼命地想说出一句完整的话。[pg]");
            outputText("[pg]你还没说完，她突然迅速地将自己完全插入了你的[vagina]。你大声呻吟，庆幸她的折磨终于结束了。她抽插了几下，你在极乐的满足中微笑着。[pg]抽插了不到十几次，她停下来并抽出了肉棒，留下你的[vagina]夹着空气，同时流着男女的体液。你惊愕地睁大了眼睛，但你仍然发现自己无法正常说话。[pg][say:对不起，我就是做不到。我不喜欢操那些不想要的人。我还是自己自慰解决吧。][pg]");
            outputText("[pg]你从法术中解脱出来，倒在地上，对自己的处境感到困惑。女巫坐在一块石头上，开始抚摸她的肉棒，另一只手调皮地挑逗着她的阴蒂，夸张地呻吟着。你完全被她的肉棒、她的乳房、她美丽健美的身体的动作迷住了。你注意到她正在加快速度，她很快就会高潮。理智离开了你的大脑，你绝望地跑向她，在一个动作中，用力将她的肉棒塞进你的[vagina]，几乎当场高潮。[pg]");
            outputText("[pg][say:我开始觉得你想强奸我了！]她靠在石头上说道。意识到她不会开始抽插，你决定替你们俩完成这项工作。你疯狂地扭动着你的[hips]，用力夹紧她的肉棒，汗水从你的身体上滴落，你张着嘴，舌头伸出来喘着粗气。她的法术加上她不断的拒绝只会加剧你的欲望，此时此刻，你的脑海里除了你的小穴和她美丽的灰白色肉棒之外，什么都没有。");
            outputText("[pg]你感觉到她的身体紧绷，你意识到她的高潮即将来临。在你从她身上拔出之前，她突然抓住你的[hips]，将你紧紧地锁在她身上。[say:你很想要我的精液，不是吗？]她低语着，轻轻地吻了你的后颈。这让你达到了顶点，她高潮了。");
            if(get_player().vaginalCapacity() >= 100)
            {
               outputText("你的[vagina]和子宫愉快地接收了她所有的精液，在她射精结束后很久还在继续榨取她的肉棒，你的肚子因为装了这么多液体而胀了起来。");
            }
            if(get_player().vaginalCapacity() < 100 && get_player().vaginalCapacity() > 50)
            {
               outputText("你的[vagina]和子宫勉强接收了她的一大半精液，但有些喷了出来，无法容纳所有的东西。");
            }
            if(get_player().vaginalCapacity() <= 50)
            {
               outputText("你的[vagina]和子宫勉强容纳了最初的几下抽插，剩下的猛烈地喷了出来，落在地上，在炎热的土地上迅速干涸。[pg]");
            }
            outputText("[pg]在超越理智的满足中，你倒在地上，几乎昏昏欲睡。[say:哎呀，你真是个调皮的家伙，竟然这样强奸我。不过别担心，如果你怀孕了，你可以期待我们的到来，]她说着，然后穿上了她暴露的衣服。[pg]");
            outputText("[pg]她离开了，你睡着了。真是漫长的一天。[pg]");
            if(!get_player().isPregnant())
            {
               get_player().knockUp(38,240,120);
            }
         }
         if(get_player().get_gender() == 1)
         {
            outputText("绝望而又心甘情愿地，你跪了下来" + get_player().clothedOrNakedLower("，脱掉你的[armor]，") + "并开始自慰。你勤奋地抚摸着[eachCock]，每一次动作都会喷出先列腺液。你的心跳和呼吸加快，你闭上眼睛，充分体会这种感觉。你的速度加快，你的肉棒胀大，先列腺液溢出，你扑倒在地上完成你的工作。[pg]");
            outputText("[pg]突然，你感到身体僵硬，动弹不得。女巫对你施了法！[say:我还没被说服呢，抱歉。]她用某种念力将你从地上举起，直勾勾地看着你。[say:我想你需要一点帮助。]经过短暂的咒语吟唱，她将双手覆在你的肚子上，你感到你的欲望更加强烈了。[Eachcock]变得肿胀，你呼吸急促，绝望感在你体内变得更加强烈。[pg]");
            outputText("你向她低声恳求，瘫痪使你无法正常说话。[say:什么？你想要什么？]女巫娇嗔地说着，同时开始移动你。你体内的热量加剧，你翻着白眼，在她的法术下悬在半空中颤抖。你拼命地想说出一句完整的话。[pg]");
            outputText("[pg]你还没说完，她突然拉扯你的[cock]，快感让你结巴和呻吟。你试图清醒头脑，但每次你这样做，她都会再次拉扯和抚摸，让你呻吟和哀号。显然是觉得她已经挑逗够了，她开始轻柔地抚摸你的肉棒。她的手异常温暖，这只会增强感觉。她逐渐收紧并加快了速度，让你在极乐的解脱中呻吟，庆幸她停止了她的把戏。[Onecock]抽动着，你的身体紧绷。你的高潮很快就会到来。");
            outputText("[pg]突然，你从法术中解脱出来，倒在地上，对自己的处境感到困惑。[say:我做不到，对不起。我不能强迫给一个不想要的人打飞机。此外，我也有需求，而你不想满足我，对吧？]她说道。");
            outputText("[pg]女巫坐在一块石头上，开始挑逗她的小穴，偶尔将手指插进去，同时不断地抚摸她的阴蒂，夸张地呻吟着。你完全被她的乳房、她流着淫液的小穴和她美丽健美的身体迷住了。你注意到她正在加快速度，她很快就会高潮。理智离开了你的大脑，你绝望地跑向她，在一个动作中，你将脸埋进她的阴毛里，你的舌头深深地潜入她的体内。[pg]");
            outputText("[pg][say:我开始觉得你想强奸我了！]她轻声呻吟着，靠在石头上说道。意识到她不会开始摩擦，你决定替你们俩完成这项工作。你疯狂地舔舐她的淫液并用舌头操她，偶尔舔舐她的阴唇和阴蒂，汗水从你的身体上滴落，你的嘴里沾满了她的女性体液。她的法术，加上她不断的拒绝，只会加剧你的欲望，此时此刻，你的脑海里除了她的小穴和你那抽动着、渴望着的肉棒之外，什么都没有。[pg]");
            outputText("[pg]你感觉到她的身体紧绷，你意识到她的高潮即将来临。在你把嘴从她身上移开之前，她突然抓住你的头，将你紧紧地锁在她身上。她将大量的女性精液喷在你的脸上。这种物质很热，让你全身发麻，突然增强了你的快感，让你达到了顶点。[pg]");
            if(get_player().cumQ() < 100)
            {
               outputText("[pg]你射精了，在空中喷射出几股精液。你的[legs]虚弱地颤抖着，你陶醉在免提式高潮的极乐感觉中。");
            }
            if(get_player().cumQ() >= 100 && get_player().cumQ() < 1000)
            {
               outputText("[pg]你射精了，在空中射出几股浓稠的精液。你的[legs]无力地颤抖着，沉浸在免提式高潮的极乐感觉中。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("[pg]你射精了，在空中射出一股浓稠的精液。你的[legs]无力地颤抖着，沉浸在免提式高潮的极乐感觉中。");
            }
            outputText("[pg]在理智之外得到了满足，你倒在地上，几乎要昏睡过去。[say: 哎呀，你可真是个调皮鬼，竟然那样强暴我。也许下次你从一开始就会诚实点，不是吗？]她说道。你转头看着她，注意到你的精液正漂浮在空中，成了她念动力的目标。她将它引导进一个烧瓶，然后重新穿上她暴露的衣服。");
            outputText("[pg]她离开了，你睡着了。真是漫长的一天。[pg]");
            corrWitchPregChance();
            get_combat().cleanupAfterCombat();
         }
         if(get_player().get_gender() == 0)
         {
            outputText("注意到你没有任何生殖器，女巫嘲笑了一声，留下你自生自灭。");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function leaveWitch() : void
      {
         clearOutput();
         outputText("你留下魔女，让她自己处理伤口。");
         get_combat().cleanupAfterCombat();
      }
      
      public function giveBirthToWitches() : void
      {
         clearOutput();
         outputText("你子宫里的热量增长到了难以忍受的程度，你开始感到剧烈的绞痛。你绝对是要生了！");
         outputText("[pg]你冲到营地附近小溪的边缘蹲下。不久之后，你的羊水破了，你因为疼痛被迫倒在地上。");
         outputText("[pg]你试图用力，但灼热的温度让人难以忍受。这简直就像你的孩子血液里流淌着岩浆！");
         outputText("[pg]你躺在地上，担心你或你的孩子是否能活下来。突然，你注意到有五个身影正在靠近。她们是来自火山岩山的魔女。[pg]");
         outputText("[say: 别担心。你们俩都会活下来的。] 她们熟练地围在你身边，帮助你分娩。这给了你新的力量，你用力推挤，在助产士的安抚下忍受着疼痛。不久之后，你孩子的头露了出来，其中一个魔女熟练地帮助你把她拉了出来。这是一个漂亮的女婴，皮肤像灰烬一样灰白。");
         outputText("[pg]你还没来得及欣赏你孩子的美丽，她就被其中一个魔女带走了。你看着她，眼中充满了一半愤怒一半悲伤，但你太虚弱了，无法行动。[say: 我们知道这对你来说很难，但我们的集会需要保持团结。感谢你帮助我们补充人数。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2651,FlagDict_Impl_.arrayReadInt(_loc1_,2651) + 1);
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2651))
         {
            case 1:
               outputText("[pg][say: 很少有外来者能有足够的生育能力被我们受精。我们很感激，如果你能回到岩山再次献上你的身体，我们会更加感激。]");
               break;
            case 2:
               outputText("[pg][say: 你不止一次帮助我们增加人数。我们很感激，如果你能回到岩山再次献上你的身体，我们会更加感激。]");
               break;
            case 3:
               outputText("[pg][say: 你的生育能力绝对是独一无二的。我们要求你尽可能回到岩山。我们需要像你这样……有能力的人。]");
               break;
            case 5:
               outputText("[pg][say: 以前没有外来者送给我们这么多姐妹。尽可能带着空子宫回到岩山。我们有一份礼物要送给你。]");
               break;
            default:
               outputText("[pg][say: 我们再次感谢你的帮助。我们本不该要求，尤其是在你帮助了我们这么多之后，但如果你有能力，我们总是需要你的帮助。]");
         }
         outputText("[pg]就像她们神秘地出现一样，她们带着你的孩子消失了。刚生下孩子就失去了她，你的心被揪紧了，但你太累了，那些想法渐渐消失，取而代之的是平静的睡眠。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defeatWitch() : void
      {
         var _g:Combat;
         clearOutput();
         if(get_monster().get_HP() <= 0)
         {
            outputText("魔女跪倒在地，虚弱得无法继续战斗。");
         }
         else
         {
            outputText("魔女跪倒在地，发情得无法继续战斗。");
         }
         outputText("[pg][say: 该死……你打败我了。现在，离开吧。我允许了，]她抓着地面说道，对自己的失败感到愤怒。");
         menu();
         addButton(0,"小穴",corrWitchFuckHerVagina).hint("你可不打算就这么放过她。她会得到你的肉棒，但必须按你的规矩来。").disableIf(get_player().cockThatFits(get_monster().vaginalCapacity()) < 0,"你的肉棒太大了。").sexButton(1,false);
         addButton(1,"太大了！",corrWitchTOOBIGFuck).hint("你的肉棒对她的小穴来说太大了，但你确信她能找到解决办法。").disableIf(get_player().hasCockThatFits(get_monster().vaginalCapacity()),"你有一根尺寸合适的肉棒。").sexButton(1,false);
         addButton(2,"长出肉棒",corrWitchGrowaPenis).hint("她说她可以用你的小穴，但她并没有明显的肉棒。真奇怪。").sexButton(2,false);
         if(get_player().isGenderless())
         {
            _g = get_combat();
            addButton(3,"无性别",function():void
            {
               _g.cleanupAfterCombat();
            }).hint("你并没有任何生殖器供她使用。");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强行梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         setSexLeaveButton(leaveWitch,"离开",14,2);
      }
      
      public function corrWitchTrade() : void
      {
         var minocum:Number;
         var _g:CorruptedWitchScene;
         clearOutput();
         outputText("你问女巫是否愿意给你更多……实用的魔法知识。");
         outputText("[pg][say: 啊，你想要我们的战斗法术。它们是我们独有的；我们的法术是为了通过理智与欲望的平衡来增强而开发的。我们很高兴你对我们集会的贡献，但公开分享这些秘密不是我们能轻易做到的。]");
         outputText("[pg]你总不能把信息从她嘴里打出来。你正准备转身回营地，女巫叫住了你。[say: 考虑到这一点……我们一直在开发提高生育能力的新方法。我们总是需要其他物种的精液样本来进行分析和研究。我们做个交易吧。你给我们带来足够的精液样本，我们就给你魔法知识。三瓶就够了。]");
         var _loc1_:Number = get_player().itemCount(get_consumables().MINOCUM);
         if(_loc1_ > 3)
         {
            _loc1_ = 3;
         }
         menu();
         if(_loc1_ >= 3)
         {
            _g = this;
            minocum = _loc1_;
            addButton(0,"买书",function():void
            {
               _g.buyWitchBook(minocum);
            }).hint("购买一本灰魔法书。");
         }
         else
         {
            addButtonDisabled(0,"买书","你没有足够的物品来交换一本书。");
         }
         addButton(14,"返回",corrWitchIntro);
      }
      
      public function corrWitchTOOBIGFuckNoFight() : void
      {
         clearOutput();
         outputText("你脱下[armor]，[eachCock]因为充血而变得肿胀，并随着对即将到来的性爱的期待而变大。女巫看到你巨大的肉棒，眼睛睁得大大的，你注意到她正因为欲望而喘息着。");
         outputText("[pg][say: 虽然我很想，但我实在没法把那个怪物吞进体内，]她说着，内裤已经湿透了，双眼死死盯着你的肉棒。你显然有些失望。[pg][say: 噢，别露出那种表情。榨精的方法可不止一种哦。]她双手做出神秘的动作，在地上施放了一个法术，覆盖上一层闪烁的防护罩。[say: 我可不想烫伤我的膝盖，你知道的，]她边说边蹲下身子。毫无疑问，她是个老手。[pg]");
         if(get_player().isTaur())
         {
            outputText("女巫钻到你的身下，你感觉到她拉扯着你的阴茎，引得你倒吸一口凉气。她开始用异常温暖的舌头挑逗你的[cockhead]，舔舐着喷涌而出的所有先列腺液，同时也在取悦自己。她用空出的那只手抚摸着你的肉棒，你紧绷着身子作为回应，一滴先列腺液在女巫的脸上爆开。[pg]你看不见她的动作，这反而让一切变得更加色情，因为你根本不知道她接下来会用什么动作给你带来惊喜。她的技术极其高超，偶尔还会轻轻咬住你的[cockhead]，那一丝痛楚只会让你体验到的快感更加强烈。[pg]");
         }
         else
         {
            outputText("女巫跪在你的胯部旁边，拉扯着你的阴茎，引得你倒吸一口凉气。她开始用异常温暖的舌头挑逗你的[cockhead]，舔舐着喷涌而出的所有先列腺液，同时也在取悦自己。她用空出的那只手抚摸着你的肉棒，你紧绷着身子作为回应，一滴先列腺液在女巫的脸上爆开。她的技术极其高超，偶尔还会轻轻咬住你的[cockhead]，那一丝痛楚只会让你体验到的快感更加强烈。[pg]");
         }
         outputText("她自身的欲望达到了顶峰，暂时停止了对你[oneCock]的取悦。经过几个神秘的动作后，一颗光滑的黑色圆球从地上破土而出，滑入她流着淫液的阴道中，在她的体内抽插、震动和跳动。她带着焕发的活力重新开始对付你的阴茎，她小穴里的圆球让她充满了情欲。");
         outputText("[pg]她尽力将你的[cockhead]含进嘴里，一只手抚摸着你的肉棒，同时");
         if(get_player().balls == 0)
         {
            if(get_player().hasVagina())
            {
               outputText("抽插着你的[vagina]");
            }
            else
            {
               outputText("按摩着你的会阴");
            }
         }
         else
         {
            outputText("揉捏并按摩着你的[balls]");
         }
         outputText("用另一只手。");
         outputText("[pg]她加快了速度，大声地吸吮着你的[cockhead]，双手的动作也越来越快。似乎她小穴里的圆球也工作得更加卖力了，因为她的呼吸变得急促，开始大汗淋漓。你的[legs]在快感中发软，你大口地喘着粗气。你的高潮正在迅速逼近。");
         outputText("[pg]伴随着一声巨大的呻吟，你达到了高潮并射精了。");
         if(get_player().cumQ() < 100)
         {
            outputText("[pg]你开始在她体内释放，在她的嘴里喷射出几股精液。你试图在射精结束前拔出来，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住了你的后腿，" : "抓住了你的臀部，") + "粗暴地试图喝干它能提供的每一滴精液。你很快就被榨干了，她放开了你，那颗光滑的圆球从她的小穴里掉了出来，已经完全湿透了。她连眉头都没皱一下，就把你的精液全部吞了下去。[pg][say: 真是让人失望，]她边说边穿上她那暴露的衣服。[say: 等你下次来的时候，请尽量提高你的雄风。]你离开了，自尊心受到了一点伤害，但却感到深深的满足。[pg]");
         }
         if(get_player().cumQ() >= 100 && get_player().cumQ() < 1000)
         {
            outputText("[pg]你开始在她体内释放，在她的嘴里喷射出几股精液。你试图在射精结束前拔出来，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住了你的后腿，" : "抓住了你的臀部，") + "粗暴地试图喝干它能提供的每一滴精液。你很快就被榨干了，她放开了你，那颗光滑的圆球从她的小穴里掉了出来，已经完全湿透了。她吞下了一部分你的精液，把剩下的吐进了一个烧瓶里。[pg][say: 释放得还算可以，]她边说边穿上她那暴露的衣服。[say: 等你下次来的时候，请尽量提高你的雄风。]你离开了，虽然有些困惑，但却感到深深的满足。[pg]");
         }
         if(get_player().cumQ() >= 1000 && get_player().cumQ() < 5000)
         {
            outputText("[pg]你开始在她体内释放，在她的嘴里喷射出如洪流般的精液。你试图在射精结束前拔出来，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住了你的后腿，" : "抓住了你的臀部，") + "粗暴地试图喝干它能提供的每一滴精液。在你射完之前，她就松开了你的阴茎，被你那惊人的雄风所淹没，你继续在半空中射精。她使用某种念力在半空中捕捉你的精液，并将其塞进几个烧瓶中，一滴也没有浪费。她站了起来，那颗光滑的圆球从她的小穴里掉了出来，已经完全湿透了。[pg][say: 是的……这样就很好了。这大概足够了，]她边说边穿上她那暴露的衣服。[say: 你是个出色的种马。可惜你太不守规矩了，不能做一个专属的配种机器。]你离开了，感到自豪且深深的满足。[pg]");
         }
         if(get_player().cumQ() >= 5000)
         {
            outputText("[pg]你开始在她体内释放，在她饥渴的子宫里释放出如洪水般的精液。意识到自己产生的精液量有多么庞大，你试图在射精结束前拔出来，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住了你的后腿，" : "抓住了你的臀部，") + "粗暴地试图喝干它能提供的每一滴精液。她很快就被你那疯狂的雄风所淹没，被你射精的巨大力量从你的[cock]上震飞，摔倒在地上。你用精液涂满了她的皮肤和地面，无法停止高潮，她几乎被落在嘴里的精液量给呛到。她迅速恢复了镇定，使用某种念力在半空中捕捉你的一些精液，将其塞进几个烧瓶中，很大一部分都被浪费了。她站了起来，那颗光滑的圆球从她的小穴里掉了出来，已经完全湿透了。[pg][say: 太惊人了！看来关于精液产量的极限还有很多有待发现的地方，]她说着，舔掉脸上多余的精液，同时穿上她那暴露的衣服。[say: 你是个能力独特的种马。如果对你进行彻底的检查，我们能学到很多东西。可惜你太不守规矩了，不能做一个专属的配种机器。]你站了起来，对于被当成某种怪物感到有些冒犯，但却感到深深的满足。[pg]");
         }
         corrWitchPregChance();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function corrWitchTOOBIGFuck() : void
      {
         clearOutput();
         outputText("你脱下[armor]，[eachCock]因为充血而变得肿胀，并随着对即将到来的性爱的期待而变大。女巫看到你巨大的肉棒，眼睛睁得大大的，你注意到她正因为欲望而喘息着。");
         outputText("[pg][say: 虽然我很想，但我实在没法把那个怪物吞进体内，]她说着，内裤已经湿透了，双眼死死盯着你的肉棒。你显然有些失望。[pg][say: 噢，别露出那种表情。榨精的方法可不止一种哦。]她双手做出神秘的动作，在地上施放了一个法术，覆盖上一层闪烁的防护罩。[say: 我可不想烫伤我的膝盖，你知道的，]她边说边蹲下身子。毫无疑问，她是个老手。[pg]");
         if(get_player().isTaur())
         {
            outputText("女巫钻到你的身下，你感觉到她拉扯着你的阴茎，引得你倒吸一口凉气。她开始用异常温暖的舌头挑逗你的[cockhead]，舔舐着喷涌而出的所有先列腺液，同时也在取悦自己。她用空出的那只手抚摸着你的肉棒，你紧绷着身子作为回应，一滴先列腺液在女巫的脸上爆开。[pg]你看不见她的动作，这反而让一切变得更加色情，因为你根本不知道她接下来会用什么动作给你带来惊喜。她的技术极其高超，偶尔还会轻轻咬住你的[cockhead]，那一丝痛楚只会让你体验到的快感更加强烈。[pg]");
         }
         else
         {
            outputText("女巫跪在你的胯部旁边，拉扯着你的阴茎，引得你倒吸一口凉气。她开始用异常温暖的舌头挑逗你的[cockhead]，舔舐着喷涌而出的所有先列腺液，同时也在取悦自己。她用空出的那只手抚摸着你的肉棒，你紧绷着身子作为回应，一滴先列腺液在女巫的脸上爆开。她的技术极其高超，偶尔还会轻轻咬住你的[cockhead]，那一丝痛楚只会让你体验到的快感更加强烈。[pg]");
         }
         outputText("她自身的欲望达到了顶峰，暂时停止了对你[oneCock]的取悦。经过几个神秘的动作后，一颗光滑的黑色圆球从地上破土而出，滑入她流着淫液的阴道中，在她的体内抽插、震动和跳动。她带着焕发的活力重新开始对付你的阴茎，她小穴里的圆球让她充满了情欲。");
         outputText("[pg]她尽力将你的[cockhead]含进嘴里，一只手抚摸着你的肉棒，同时");
         if(get_player().balls == 0)
         {
            if(get_player().hasVagina())
            {
               outputText("抽插着你的[vagina]");
            }
            else
            {
               outputText("按摩着你的会阴");
            }
         }
         else
         {
            outputText("揉捏并按摩着你的[balls]");
         }
         outputText("用另一只手。");
         outputText("[pg]她加快了速度，大声地吸吮着你的[cockhead]，双手的动作也越来越快。似乎她小穴里的圆球也工作得更加卖力了，因为她的呼吸变得急促，开始大汗淋漓。你的[legs]在快感中发软，你大口地喘着粗气。你的高潮正在迅速逼近。");
         outputText("[pg]伴随着一声巨大的呻吟，你达到了高潮并射精了。");
         if(get_player().cumQ() < 100)
         {
            outputText("[pg]你开始在她体内释放，在她的嘴里喷射出几股精液。你试图在射精结束前拔出来，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住了你的后腿，" : "抓住了你的臀部，") + "粗暴地试图喝干它能提供的每一滴精液。你很快就被榨干了，她放开了你，那颗光滑的圆球从她的小穴里掉了出来，已经完全湿透了。她连眉头都没皱一下，就把你的精液全部吞了下去。[pg][say: 真是让人失望，]她边说边穿上她那暴露的衣服。[say: 等你下次来的时候，请尽量提高你的雄风。]你离开了，自尊心受到了一点伤害，但却感到深深的满足。[pg]");
         }
         if(get_player().cumQ() >= 100 && get_player().cumQ() < 1000)
         {
            outputText("[pg]你开始在她的嘴里释放，将几股精液注入她的口中。你试图在射精结束前拔出，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住你的后腿，" : "抓住你的臀部，") + "粗暴地试图喝下它能提供的每一滴精液。你很快就被榨干了，她放开了你，那个光滑的球从她的小穴里释放出来，完全湿透了。她吞下了一部分你的精液，把剩下的吐进了一个烧瓶里。[pg][say: 释放得还行，]她一边穿上暴露的衣服一边说道。[say: 等你下次来的时候，请尽量提高你的男子气概。]你离开了，虽然有些困惑，但却感到深深的满足。[pg]");
         }
         if(get_player().cumQ() >= 1000 && get_player().cumQ() < 5000)
         {
            outputText("[pg]你开始在她的嘴里释放，将一股精液洪流注入她的口中。你试图在射精结束前拔出，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住你的后腿，" : "抓住你的臀部，") + "粗暴地试图喝下它能提供的每一滴精液。在你结束之前，她松开了你的肉棒，被你丰富的男子气概所震撼，你继续在空气中高潮。她使用某种心灵感应在空气中捕捉你的精液，并将其塞进几个烧瓶中，一滴也没有浪费。当那个光滑的球从她的小穴里离开时，她站了起来，完全湿透了。[pg][say: 不错……这样很好。这很可能已经足够了，]她一边穿上暴露的衣服一边说道。[say: 你是个出色的种马。可惜你太不守规矩了，不能做一个专职的繁育者。]你离开了，感到自豪并且深深地满足。[pg]");
         }
         if(get_player().cumQ() >= 5000)
         {
            outputText("[pg]你开始在她体内释放，在她饥渴的子宫里释放出如洪水般的精液。意识到自己产生的精液量有多么庞大，你试图在射精结束前拔出来，但立刻遭到了拒绝，因为她" + (get_player().isTaur() ? "抓住了你的后腿，" : "抓住了你的臀部，") + "粗暴地试图喝干它能提供的每一滴精液。她很快就被你那疯狂的雄风所淹没，被你射精的巨大力量从你的[cock]上震飞，摔倒在地上。你用精液涂满了她的皮肤和地面，无法停止高潮，她几乎被落在嘴里的精液量给呛到。她迅速恢复了镇定，使用某种念力在半空中捕捉你的一些精液，将其塞进几个烧瓶中，很大一部分都被浪费了。她站了起来，那颗光滑的圆球从她的小穴里掉了出来，已经完全湿透了。[pg][say: 太惊人了！看来关于精液产量的极限还有很多有待发现的地方，]她说着，舔掉脸上多余的精液，同时穿上她那暴露的衣服。[say: 你是个能力独特的种马。如果对你进行彻底的检查，我们能学到很多东西。可惜你太不守规矩了，不能做一个专属的配种机器。]你站了起来，对于被当成某种怪物感到有些冒犯，但却感到深深的满足。[pg]");
         }
         corrWitchPregChance();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function corrWitchSexytime() : void
      {
         if(get_player().get_lust() < 33)
         {
            get_player().set_lust(33);
         }
         menu();
         addButton(0,"阴道",corrWitchFuckHerVagina).hint("使用你的阴茎。").disableIf(get_player().cockThatFits(108) < 0,"你的阴茎太大了。").sexButton(1);
         addButton(1,"太大！",corrWitchTOOBIGFuck).hint("你的阴茎对她的阴道来说太大了，但你确信她能找到解决办法。").disableIf(get_player().hasCockThatFits(108),"你有一根合适的阴茎。").sexButton(1);
         addButton(2,"长出阴茎",corrWitchGrowaPenis).hint("她说她可以使用你的阴道，但她没有可见的阴茎。真奇怪。").sexButton(2);
         if(get_player().isGenderless())
         {
            addButton(3,"无性别",corrWitchDisappointed).hint("你并没有任何生殖器供她使用。也许她可以使用你的屁股？").sexButton(0);
         }
      }
      
      public function corrWitchPregChance() : void
      {
         var _loc3_:* = null as IMap;
         var _loc1_:Boolean = false;
         var _loc2_:int = int(get_player().cumQ() / 500);
         if(_loc2_ > 5)
         {
            _loc2_ = 5;
         }
         _loc2_ += get_player().virilityQ() * 2;
         if(get_player().cumQ() > 250 && _loc2_ >= Utils.rand(100))
         {
            _loc1_ = true;
         }
         if(_loc1_)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2650,FlagDict_Impl_.arrayReadInt(_loc3_,2650) + 1);
         }
      }
      
      public function corrWitchMenu() : void
      {
         menu();
         addButton(0,"拒绝",startFight).hint("你可没那么容易被操。");
         addButton(1,"接受",corrWitchSexytime).hint("好吧，当然，为什么不呢？");
      }
      
      public function corrWitchIntro() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_corrwitchsprite());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2650) >= 5 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2651) >= 5)
         {
            outputText("走过贫瘠、闷热的土地，你看到了另一个堕落女巫。你准备好你的[weapon]并准备战斗，但当你注意到她没有处于通常的攻击姿态时，你感到很惊讶。[pg]");
            outputText("[say: 停下，旅行者。我不想再战斗了。你已经给了我们很多姐妹，如果战斗并意外杀死你，对我们的集会来说将是一个巨大的损失。] 你仍然有些怀疑，但你放下了戒备。[pg][say: 如果你不想" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2650) > 0 ? "让我受孕" : "被受孕") + "，我会允许你离开。]");
            menu();
            if(get_player().get_lust() >= 33)
            {
               addNextButton("性爱",corrWitchSexytime).hint("你还不如现在就操她。");
            }
            else
            {
               addNextButtonDisabled("性爱","你现在没有做爱的心情。");
            }
            addNextButton("知识",corrWitchTrade).hint("用东西交换更多的魔法知识。");
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TOLD_NAME) != 0)
            {
               addNextButton("喀耳刻",corrWitchCirce).hint("这些女巫一定知道一些关于喀耳刻的事情，对吧？");
            }
            if(get_player().balls == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2650) >= 5 && !get_player().hasPerk(PerkLib.PotentProstate) && get_player().hasCock())
            {
               outputText("[pg][say: 我们也知道，尽管你失去了器官，但你的男子气概依然令人难以置信。尽管如此，只要你保持……没有蛋蛋的状态，我们就可以利用我们的发现进一步提升你的效力。]");
               addNextButton("提升",corrWitchBlessing).hint("不需要蛋蛋就能产生更多的精液？这听起来很吸引人。");
            }
            if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2651) >= 5 && !get_player().isPregnant() && !get_player().hasPerk(PerkLib.PotentPregnancy))
            {
               outputText("[pg][say: 你的子宫有着不可思议的生育能力，我们无法做任何事情来提升它。然而，我们知道一种咒语，可以在你怀孕时给你额外的活力。我们使用它，这样我们怀孕的姐妹就可以在有障碍的情况下继续探索这片土地。]");
               addNextButton("活力",corrWitchBlessingWomb).hint("你肯定讨厌怀孕时那种迟钝的感觉。");
            }
            setExitButton().hint("你现在就离开。");
            return;
         }
         outputText("当你走过贫瘠、闷热的土地时，你看到一个类人生物正在靠近，它的轮廓被难以置信的高温扭曲了。");
         outputText("[pg]这是一个丰满的女人，虽然你无法判断她是否美丽，因为她头上戴着丝绸兜帽。[say: 你好，旅行者。我是目前正在进行重要研究的女巫集会的一员。我们需要你的协助。我们将使用你拥有的任何生殖器来推进我们的实验。]");
         outputText("[pg]这听起来不像是请求，你可以感觉到她体内堕落的污点。你是屈服于她的要求还是杀出一条血路？[pg]");
         corrWitchMenu();
      }
      
      public function corrWitchGrowaPenis() : void
      {
         clearOutput();
         outputText("你问她到底要怎么使用你的阴道。她坏笑着脱下衣服，露出完全赤裸的腹股沟和湿润的小穴。");
         outputText("[pg][say: 精液对我们来说太宝贵了，不能因为意外而浪费。] 她张开双手，手指分开，放在阴蒂上方。经过简短的咒语，她的呼吸加快，她呻吟着，突然一根20厘米长、粗壮的阴茎从她的腹股沟里爆发出来，导致她的小穴喷出液体。阴茎湿润，已经勃起并渗出先列腺液，女巫只撸了几下，它就向地上喷出了一团团液体。");
         if(get_player().isTaur())
         {
            outputText("这根阴茎还不错，但考虑到你的体格，你几乎感觉不到它。女巫注意到了你的失望。[pg][say: 嗯，我想你是个喜欢大尺寸的人，对吧？] 她再次把手放在腹股沟上，施展了另一个法术。她大声呻吟，她那神秘的阴茎突然急剧生长，变成了一个长60厘米、宽15厘米的肿胀怪物。[pg][say: 我想这个更适合你，对吧？] 她喘着气说，她那巨大的阴茎随着她的每一次呼吸喷出先列腺液。");
            if(get_player().lib > 70 || get_player().cor > 70)
            {
               outputText("你的[vagina]兴奋地刺痛，已经流着口水期待着即将到来的性爱。你的[legs]移动着，几乎无法控制自己现在就跳到那根阴茎上。[pg]");
            }
            else
            {
               outputText("如此色情的施法场面，让你不禁有些兴奋。这应该会是一次很棒的体验！[pg]");
            }
            outputText("[pg]意识到女巫的身高不合适，你" + get_player().clothedOrNakedLower("解开你的[armor]，") + "转过身躺在地上，向她露出你的[vagina]。女巫向你走来，双手抚摸着她那巨大的阴茎。她跪下来，把脸凑近你那马一般的阴部，尽情地吸入它散发出的麝香味。她舔了几下，舔舐着你分泌出的" + (get_player().wetness() > 3 ? "大量的" : "") + "淫液。你浑身颤抖" + (get_player().hasBreasts() ? "，开始揉捏自己的乳房，扭弄着乳头" : "") + "，因为她在你阴部上的动作而呻吟着。");
            outputText("[pg]这股麝香味让她头晕目眩，在最后一次深吸气后，她发出了一声幸福的叹息。[say:我闻到了你的潜力。半人马很少让人失望。]她将她那巨大的阴茎对准你的阴部，肿胀的龟头勉强分开了你的阴唇。她用龟头摩擦着你的阴唇和阴蒂，涂抹了一些她那丰富的先列腺液作为润滑。她开始极其缓慢地插入，挑逗着你的入口，导致你的阴户紧紧夹住，渴望着她的阴茎。她的龟头进入了你的阴部，你舒服地呼出了一口气。");
            outputText("[pg]随着她那巨大的肉棒滑入，你高兴地呻吟起来。这根阴茎绝对够大！女巫也在呻吟，显然没有用这么巨大的阴茎操过东西的经验。");
            outputText("[pg]在令人愉悦的漫长插入之后，她将自己完全没入你的体内。[say:我不习惯感觉到……有这么多的自己进入别人的身体。这太不可思议了！]她开始抽插，起初有些笨拙，但很快她就找到了节奏，无情地捣弄着你，你的大脑在你所承受的野兽般的性爱中变得模糊。");
            outputText("[pg]你正完全享受着她抽插带来的快感，这时你听到她发出一声呻吟。[say:我还能做得更多！这还不够！]她的话让你有些不安，但你已经被快感冲昏了头脑，无暇顾及。突然，你感觉到你的肉壁更紧地夹住了她的阴茎。你怀疑是不是你的阴道变紧了，但是，感觉到她的龟头随着每一次抽插都顶在你的子宫颈上，你恍然大悟：她又在让她的阴茎变大了！");
            outputText("[pg]你试图表达对她毫无根据的变大的担忧，但每次她用那根长得不可思议的阴茎捣弄你的子宫颈时，你的大脑就会一片空白，除了呻吟什么也做不了。她不应该在没有你允许的情况下这样做，但天哪，这感觉真好！");
            outputText("[pg]虽然你之前处于被动地位，但这次遭遇不断升级的快感促使你配合她的动作一起抽插。[say:是的！操，是的！这太难以置信了！]她的阴茎在你体内淫秽地肿胀起来，让你在痛苦和压倒性的快感中蜷缩起来，但也加剧了你身体的运动。她抓住了你的后腿。[say:我忍不住了，我要疯了！]她在你体内释放出大量的精液，精液异常灼热，导致你的内脏发麻，加剧了你感受到的快感。你也高潮了，大声尖叫着，你的[vagina]尽力榨取她那可怕的阴茎。在几次释放之后，她精疲力竭地把身体靠在你的身上。");
            outputText("[pg]在幸福的几秒钟后，你感觉到她的阴茎在你体内缩小并消失了，让你感到内心有一种奇怪的空虚感。她踉跄着后退，有些茫然。[say:我的姐妹们警告过我可能会发生这种事。我失去了控制，这太舒服了，无法保持理智。希望你不要介意。]好吧，你确实介意，但你那令人心碎的高潮足以证明你处理得很好。[say:谢谢你给我带来的……独特的体验。如果你怀孕了，期待我们的到来。现在，我要告辞了。我需要休息。]");
            outputText("[pg]在经历了那样一场性爱之后，你可能也需要休息一下。");
         }
         else
         {
            if(get_player().lib > 70 || get_player().cor > 70)
            {
               outputText("你流着口水，隔着[armor]揉弄着你的阴蒂，已经弄湿了腹股沟区域。那根阴茎看起来绝对美味。[pg]");
            }
            else
            {
               outputText("相当有趣的法术，看到阴茎那样爆发绝对会让你兴奋起来。[pg]");
            }
            outputText("[pg]你脱下你的[armor]，你注意到堕落的女巫在她旁边的地上施放了某种法术，在上面覆盖了一层闪烁的魔法。[pg][say:我不想在操你的时候我们被烧伤。]好吧，这绝对不是她第一次在这里做这种事。[pg]她躺在魔法地毯上，抚摸了几下她的阴茎。[say:嗯？你还在等什么？]她用性感的嗓音说道。你感觉到脸上开始发热。你漫步走到她的阴茎前，欣赏着它那抽搐的硬度，当你将自己端正地置于其上方时，轻柔地抚摸着那根奥术阴茎。[pg]");
            outputText("当你沉下身子时，它戳着你的外阴，你的呼吸变得急促起来。当你的阴部接触到她的龟头时，她的阴茎变得更硬了，促使她嘴里漏出几声呻吟。你伸出手，将自己拉开，尽可能地为她那美妙的阴茎张开。");
            outputText("她突然抓住你的臀部，猛地插入你的[vagina]，显然厌倦了挑逗，直接开始了性爱。这让你措手不及，但你没有时间抗议，因为女巫开始快速地将她的阴茎像活塞一样插入你的体内。");
            get_player().cuntChange(8,true,true,false);
            outputText("[pg]你对她的急切感到的愤怒很快消退并转化为快感，随着你的大脑变得模糊，你开始配合她的抽插移动，呻吟着，你的[vagina]紧紧夹住她那灰烬般的阴茎，品尝着它的每一寸。[say:告诉我你有多想要这些精液，你有多想让我把你的子宫涂成白色！]她在喘息间大喊道。[pg]你的呻吟足以作为回答，她抽插得更用力了，每一次动作都将自己没入，当她将阴茎完全埋入你的[vagina]时，她的大腿湿漉漉地拍打着你的大腿。");
            if(get_player().hasCock())
            {
               outputText("[pg]在无人看管的情况下，[eachCock]在空中沉重地摇晃着，勃起着，在女巫那健美的腹肌上滴落着先列腺液。[say:取悦一个双性人太难了，不是吗？]她让一只手离开你的臀部，开始用力地抚摸[oneCock]。你仰起头，张开嘴，流着口水，双重刺激太强烈了，难以忍受。你决心不先高潮，但越来越难以避免达到顶点。");
            }
            outputText("[pg]你注意到她的抽插变得不均匀，这标志着她即将高潮。你确信你赢得了这场比赛，但女巫让你大吃一惊。突然，她松开了你的" + (get_player().hasCock() ? "[cock]和臀部" : "臀部") + "，把你拉近她，紧紧地拥抱着你，温柔地亲吻你的嘴唇。这种突如其来的亲密感让你难以承受，当她高潮时，你也高潮了，当她卸货在你体内时，你的双腿颤抖着。");
            if(get_player().hasCock())
            {
               outputText("你的阴茎在你和女巫之间爆发，用粘稠的液体爱液涂满了你们俩的身体。");
            }
            outputText("[pg]你们俩都沉浸在高潮中，她的阴茎无情地将精液泵入你的子宫。");
            if(get_player().vaginalCapacity() >= 100)
            {
               outputText("你的[vagina]和子宫愉快地接收了她所有的精液，在她射精结束后很久还在继续榨取她的肉棒，你的肚子因为装了这么多液体而胀了起来。");
            }
            if(get_player().vaginalCapacity() < 100 && get_player().vaginalCapacity() > 50)
            {
               outputText("你的[vagina]和子宫勉强接收了她的一大半精液，但有些喷了出来，无法容纳所有的东西。");
            }
            if(get_player().vaginalCapacity() <= 50)
            {
               outputText("你的[vagina]和子宫勉强容纳了最初的几下抽插，剩下的猛烈地喷了出来，落在地上，在炎热的土地上迅速干涸。[pg]");
            }
            outputText("她高潮结束后，温柔地抚摸着你的头。[say: 你会给我生很多姐妹的，对吧？] 你们俩相拥而眠，依然紧紧连在一起。当你醒来时，她的肉棒已经消失了。你和她一起起身，在她穿衣服的时候穿上你的盔甲。[say: 如果你怀孕了，就等我们。我们不会让我们的姐妹孤单的。] 你点点头，有些困惑，然后回到了你的营地。");
         }
         if(!get_player().isPregnant())
         {
            get_player().knockUp(38,240,120);
         }
         dynStats(DynStat.Cor(5));
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function corrWitchFuckHerVagina() : void
      {
         clearOutput();
         outputText("你脱下[armor]，[eachCock]充血勃起，期待着即将到来的性爱。当你赤身裸体时，你注意到堕落魔女在她旁边的地上施放了某种法术，覆盖上了一层闪烁的魔法。");
         outputText("[pg][say: 我可不想我们被烧伤，种马。]好吧，她正在尽力挽回局面。");
         outputText("[pg]她躺在魔法毯上，小穴已经流出了淫液，灰白色的皮肤因炎热和情欲而流汗。她捏着自己的乳头，发出一声性感的呻吟。[say: 那么，你还在等什么？]她一边揉捏着乳房一边说道。等等，到底是谁在强奸谁？你抛开这个念头，跪在地上，把她健美的双腿放在你的肩膀上，将[oneCock]插入她的小穴。[pg]她立刻喷了，你感觉到你的[oneCock]和腹股沟因狂野的欲望而发热。你的呼吸变得急促，失去了控制，不顾一切地抽插着。魔女并不惊讶，继续呻吟和抚摸自己，偶尔把手伸向阴蒂揉搓以增强快感，每次这样做都会喷出一股淫液。[pg]");
         if(get_player().hasVagina())
         {
            outputText("[pg]随着你的抽插，你感觉到你的小穴因渴望而刺痛并流出淫液，你咬着嘴唇试图忽略它。魔女注意到了。[say: 很难满足一个扶他，不是吗？]她在呻吟间说道。她利用仅存的协调能力施放了一个法术，让一个光滑的石球从地下冒出来。它滑入你的[vagina]，在里面跳动和抽插，让你瞬间屏住了呼吸。你本想阻止它，但那根又粗又热的震动球感觉太好了，让你懒得去管。[pg]");
         }
         outputText("[pg]她的小穴开始更紧地夹住你勃起的肉棒，乞求着你的精液，这标志着她即将高潮。你咬着嘴唇，试图尽可能地延长这种美妙的快感。突然，魔女伸出双臂抓住你的头，在你的嘴唇上印下一个吻，她的舌头深深地探入你的嘴里。这让你越过了边缘，你高潮了。[pg]");
         if(get_player().cumQ() < 100)
         {
            outputText("[pg]你开始在她体内释放，在饥渴的子宫里射出几股精液。你试图在射精结束前拔出来，但立刻被拒绝了，她强壮的双腿锁住你的躯干，她的小穴挤压着[oneCock]，试图榨干它能提供的每一滴精液。你很快就被榨干了，她放开了你。[pg][say: 我怀疑这是否足够，但不管怎样，这是一次有趣的性爱，]她一边穿上暴露的衣服一边说道。[say: 当你回来时，请努力提高你的男子气概。]你站起身，自尊心受到了一点伤害，但内心深处却感到非常满足。[pg]");
         }
         if(get_player().cumQ() >= 100 && get_player().cumQ() < 1000)
         {
            outputText("[pg]你开始在她的体内释放，将几股精液注入她饥渴的子宫。你试图在射精结束前拔出，但立刻遭到了拒绝，她强壮的双腿锁住你的躯干，小穴紧紧夹住[oneCock]，试图榨干它能提供的每一滴精液。最终，你被榨干了，她放开了你，她紧致的小腹因为你的强力播种而微微鼓起。[pg][say: 分量还行。这应该够了，]她一边穿上暴露的衣服一边说道。[say: 等你下次来的时候，请尽量提高你的男子气概。]你站起身来，虽然有些困惑，但却感到深深的满足。[pg]");
         }
         if(get_player().cumQ() >= 1000 && get_player().cumQ() < 5000)
         {
            outputText("[pg]你开始在她的体内释放，将一股精液洪流注入她饥渴的子宫。你试图在射精结束前拔出，但立刻遭到了拒绝，她强壮的双腿锁住你的躯干，小穴紧紧夹住[oneCock]，试图榨干它能提供的每一滴精液。她紧致的小腹夸张地鼓了起来，尽管你试图在漫长的高潮中挣脱，但她依然紧紧锁住你，努力地榨取你的肉棒。过了一会儿，她放开了你，令人惊讶的是，你的精液一滴也没有漏出来。[pg][say: 不错……这样很好。这很可能已经足够了，]她一边穿上暴露的衣服一边说道。[say: 你是个出色的种马。可惜你太不守规矩了，不能做一个专职的繁育者。]你站起身来，感到自豪，并且深深地满足。[pg]");
         }
         if(get_player().cumQ() >= 5000)
         {
            outputText("[pg]你开始在她的体内释放，将如洪水般的精液注入她饥渴的子宫。意识到自己产生的精液量有多么庞大，你试图在射精结束前拔出，但立刻遭到了拒绝，她强壮的双腿锁住你的躯干，小穴紧紧夹住[oneCock]，试图榨干它能提供的每一滴精液。你疯狂地挣扎着，她紧致的小腹夸张地鼓了起来，但她依然紧紧锁住你，努力地榨取你的肉棒。最终，你对她来说实在太多了，她被迫放开了你，精液从她的小穴和你的肉棒中喷射而出，你漫长的高潮依然让几股精液浪费在焦土上，以及她的乳房和脸上……[pg][say: 太惊人了！看来关于精液产量的极限，还有很多有待发现的地方，]她一边舔掉脸上多余的精液，一边穿上暴露的衣服说道。[say: 你是一匹能力独特的种马。如果对你进行彻底的检查，我们能学到很多东西。可惜你太不守规矩了，不能做一个专职的繁育者。]你站起身来，因为被当成某种怪物而感到有些被冒犯，但内心却深深地满足。[pg]");
         }
         dynStats(DynStat.Cor(5));
         corrWitchPregChance();
         get_player().orgasm("Dick");
         if(get_combat().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function corrWitchDisappointed() : void
      {
         clearOutput();
         outputText("你告诉她并向她展示你没有任何生殖器，所以除了你的屁股，你没有什么可以提供给她的。");
         outputText("[pg][say: 你的屁股？荒谬。精液不能那样浪费。它必须用来维持我们自己或繁衍后代。很好，旅行者。你可以离开了。没有必要进行不必要的暴力。]");
         outputText("[pg]尽管她们堕落了，但这些魔女在性方面仍然保持着某种纪律。有趣。你转过身，让女巫听天由命。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corrWitchCirce() : void
      {
         clearOutput();
         outputText("你问女巫，她或她的任何姐妹以前是否听说过一个叫\"喀耳刻\"的人。");
         outputText("[pg]她把手放在嘴唇上，想了一会儿，试图回忆起来。由于她火红的头发和斗篷遮挡，你无法从她的表情中看出太多，但你觉得她正在努力回忆一些事情。");
         outputText("[pg]过了一会儿，她放弃了，摇了摇头。[say: 不，旅行者。我不知道。这个名字听起来确实很耳熟……但这可能只是我小时候读过的一本书里的名字。][pg]该死。你确信喀耳刻是她们中的一员。你问她是否听说过其他在峭壁上游荡的女巫，特别是长得像她们的女巫。[pg]她再次摇了摇头。[say: 不。我们是唯一在这片被诅咒的荒原上谋生的人。除了我们，只有扭曲的恶魔和憎恶。][pg]你摇摇头，告诉她她们不是该地区唯一的女巫。你曾亲自见过喀耳刻，但她的巢穴是隐藏的，她很少谈论自己。[pg]女巫摇了摇头。[say: 不，旅行者。我们了解峭壁的每一寸土地、岩石和裂缝。在这里生活了这么多年，没有哪个女巫或女巫能逃过我们的视线。我们不会允许这样的人进入我们的领地。]");
         outputText("[pg]你沮丧地叹了口气，开始解释你与喀耳刻的相遇。然而，女巫拒绝倾听，转过身背对着你走开了。没过多久，无处不在的火山灰风暴就把她从你的视线中隐藏了起来。");
         outputText("[pg]这些女巫还真是固执。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corrWitchBlessingWomb2() : void
      {
         clearOutput();
         outputText("你在肉体湿润地拍打肉体的声音中醒来" + (get_player().hasBreasts() ? "，你感觉到你的乳房前后晃动" : "") + "。你睁开眼睛，看着你的[legs]，注意到女巫正在勤奋地对你抽插。你的意识慢慢恢复。首先，你感觉到你的[vagina]里有一阵刺痛，然后是热量，然后是无法估量的快感。你大声呻吟，呼吸急促，女巫冷漠地继续着她的工作。");
         outputText("[pg]当你注意到她的抽插变得不均匀，她的肉棒紧绷起来时，你内心深处的某种本能爆发了；你极度渴望她的精液。你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("缠绕上去，紧紧绞住女巫");
         }
         if(get_player().isGoo())
         {
            outputText("包裹住女巫");
         }
         else
         {
            outputText("用你的[legs]将女巫紧紧锁在身上");
         }
         outputText("把她拉到你身边，深深地吻住她的嘴唇。这让她达到了顶点，当她在你体内释放时，你发出了一声幸福的呻吟。仅仅是感觉到她的精液涂满你的子宫，就足以引发小高潮，你抓挠着焦土，试图为你所感受到的难以置信的快感找到一个发泄口。");
         outputText("[pg]在你的快感高潮结束后，你放开了女巫，她站了起来。[say: 当我完成我的咒语时，我注意到你的小穴一直在收缩，索要我的精液。我照做了。别担心，我特别不孕。你可能没有怀孕。]");
         outputText("[pg]不知为何，这让你感到沮丧。你站起来，穿上你的盔甲，回到了你的营地。");
         outputText("[pg]<b>强效受孕</b> 特质已获得！");
         get_player().createPerk(PerkLib.PotentPregnancy,0,0,0,0);
         if(!get_player().isPregnant())
         {
            get_player().knockUp(38,240,170);
         }
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function corrWitchBlessingWomb() : void
      {
         clearOutput();
         outputText("你告诉她你对提升活力的法术感兴趣。她心领神会地点点头。");
         outputText("[pg][say: 我们的人数有限，所以很遗憾，我们无法让所有的姐妹在怀孕期间休息。有时，她们必须离开集会，去寻找补给和潜在的播种者。这个咒语能让她们无所畏惧地应对这片土地上的许多危险。]");
         outputText("她命令你脱掉衣服，你照做了。她从峭壁上抓起一撮焦土，双手合拢。[say: rlmarg arompha tramal，]她对着泥土低语。那撮尘土亮了起来。突然，她看向你，当你们的目光交汇时，你完全瘫痪了。她跪在你身边，将沾满附魔尘土的手伸向你的[vagina]。");
         outputText("[pg]她一个动作就把手臂伸了进去，" + (get_player().vaginalCapacity() > 50 ? "轻松地够到了你的子宫" : "有些费力地够到了你的子宫") + "。由于瘫痪，你无法做出任何反应，无论是积极的还是消极的。她用另一只手摸着你的腹部，粗暴地指着她另一只手所在的位置。");
         outputText("[pg]灼热的疼痛侵袭着你的子宫，就好像那些尘土变成了熔化的热玻璃。你试图跳开躲避女巫的动作，但瘫痪让你除了因疼痛而呜咽和流泪之外什么也做不了。[say: 疼痛很快就会消退。别担心，]女巫说着，一只手按着你的肚子，另一只手按摩着你的子宫内部。你几乎痛得晕过去，某种神秘的力量让你保持清醒。[pg]");
         outputText("[pg]在痛苦的几秒钟后，疼痛开始慢慢消退。它最终被一种令人愉悦的温暖所取代，然后是不断增长的渴望。你的呼吸变得急促，你的[vagina]开始夹紧女巫的手臂，很快你的嘴巴就张开了，流着口水，不是因为疼痛，而是因为欲望。你经历过的每一次怀孕的画面都在你的脑海中闪过，每一次痛苦的记忆都被难以置信的、高潮般的快感所取代。你感到空虚。不利用你的子宫来繁衍后代，这是多么大的罪过啊！给世界带来更多的生命是如此令人愉悦，你为什么不怀孕呢？这些新的想法侵入了你的大脑，取代了你对自己在这个世界上的功能的任何怀疑；那就是繁衍。");
         outputText("[pg]意识到你的情况，女巫放低了手臂，将一些尘土撒在你的阴道里，然后又把它插回你的子宫。你几乎被快感弄得晕过去，你的[vagina]");
         if(get_player().wetness() < 3)
         {
            outputText("滴落着");
         }
         if(get_player().wetness() < 5)
         {
            outputText("喷涌着");
         }
         else
         {
            outputText("飞溅着");
         }
         outputText("清澈的淫液在女巫的手上。");
         if(get_player().hasCock())
         {
            outputText("[pg]奇怪的是，[eachCock]" + (get_player().cockTotal() > 1 ? "并没有" : "并没有") + "勃起或流出先列腺液。这种快感本质上是女性的，所以" + (get_player().cockTotal() > 1 ? "它们" : "它") + "根本没有反应，只是随着女巫的抽插而弹跳。");
         }
         outputText("[pg]她加快了速度，快感达到了无法忍受的顶点。绝望中，你试图在响亮的呻吟声中请求她停下来，但瘫痪和快感让你无法组织连贯的语言。突然，她迅速将手臂从你的[vagina]中抽出，你晕了过去，高潮征服了你的意识。");
         doNext(corrWitchBlessingWomb2);
      }
      
      public function corrWitchBlessing2TOOBIG() : void
      {
         clearOutput();
         dynStats(DynStat.Cor(5));
         outputText("你在湿滑的唾液和贪婪的吮吸声中醒来。随着你的头脑和视线变得清晰，你注意到女巫正在勤奋地吮吸你的[oneCock]。当她舔舐和吮吸你的[cockhead]时，她的乳房包裹着你的阴茎，她的小穴流着口水，打湿了地面，以表达对你巨大阴茎的敬意。尽管你的意识正在衰退，你的[oneCock]仍然僵硬，静脉仍然淫秽地凸起，这是你新获得的男子气概的结果。这种情况带来的明显快感终于传到了你的脑海，当你把手放在性感的巫婆的头上，用你的肉棒操她的嘴时，你呻吟着。随着她开始呻吟并挑逗自己的阴蒂，节奏加快，很快你们俩都达到了高潮。她再次喝干了你[oneCock]所有的精液。她吮吸的压力加上她的法术造成的僵硬，让你确信你的阴茎会爆裂，但值得庆幸的是，一切都如预期般进行。");
         outputText("[pg][say: 当我看到你的阴茎时，我就知道我必须开始工作了。我们不能浪费任何精液。遗憾的是，几个小时后，法术的效果就没有这么好了。这么硬的阴茎吸起来绝对美味。] 当她转身离开时，你装备了你的[armor]。[say: 记得经常回到峭壁，我们需要你的精液，]女巫说道。在经历了刚才的事情之后，不回来将是一种罪过。[pg]");
         get_player().createPerk(PerkLib.PotentProstate,0,0,0,0);
         outputText("[pg]<b>强效前列腺</b> 特质已获得！");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corrWitchBlessing2() : void
      {
         clearOutput();
         dynStats(DynStat.Cor(5));
         outputText("你在肉体湿润拍打的独特声音中醒来。随着你的头脑和视线变得清晰，你注意到女巫正在勤奋地骑着你。她挺拔的乳房在你的脸上摇晃，她的小穴随着每一次抽插喷涌出液体。尽管你的意识正在衰退，你的[oneCock]仍然僵硬，静脉仍然淫秽地凸起，这是你新获得的男子气概的结果。这种情况带来的明显快感终于传到了你的脑海，当你把手放在性感的巫婆的臀部，帮助她在你的肉棒上抽插时，你呻吟着。随着她开始呻吟，节奏加快，很快你们俩都达到了高潮。她再次榨干了你[oneCock]所有的精液。她阴道肌肉的压力加上她的法术造成的僵硬，让你确信你的阴茎会爆裂，但值得庆幸的是，一切都如预期般进行。");
         outputText("[pg][say: 当我看到你的阴茎时，我就知道我必须开始工作了。我们不能浪费任何精液。遗憾的是，几个小时后，法术的效果就没有这么好了。这么硬的阴茎骑起来绝对美味。] 当她转身离开时，你装备了你的[armor]。[say: 记得经常回到峭壁，我们总是能用得上你的精液，]女巫说道。在经历了刚才的事情之后，不回来将是一种罪过。[pg]");
         get_player().createPerk(PerkLib.PotentProstate,0,0,0,0);
         outputText("[pg]<b>强效前列腺</b> 特质已获得！");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corrWitchBlessing() : void
      {
         clearOutput();
         outputText("你告诉她你对女巫们的发现很感兴趣。她点点头，仿佛在你开口之前她就已经知道了。[say: 力量是令人上瘾的，不是吗？一旦你开始试探男子气概的深浅，就很难抗拒抓住任何机会去增强它，]女巫一边说着，一边向你走来，臀部诱人地摇曳着。[EachCock]开始变硬作为回应，女巫笑了，她很清楚自己对你产生的影响。");
         outputText("[pg]女巫在手掌上变出一团黑色的火焰，并对着它低语着神秘的咒语。[say: CHMOR BROGH PHTREEA LROM. HA HASSA.] 火焰的强度增加了。她直视着你的眼睛，目光刺入你的脑海，你瘫痪了。[say: 我集会的女巫们，她们被不孕的诅咒所困扰，]她一边在火焰周围做着更多神秘的动作一边说道。[say: 我们已经为我们的姐妹们开发了成为双性人的方法，以对抗这种诅咒，但我们拒绝用恶心的睾丸玷污我们的身体。][pg][say: 尽管有这种缺陷，我们还是开发了增加男子气概的方法。] 随着她手的动作，你的[armor]神奇地从你身上脱落。你仍然被锁定在原地，无法动弹。她跪在[eachCock]旁边。[pg]");
         if(!get_player().hasVagina())
         {
            outputText("[pg][say: 看吧，我们研究的辛勤劳动成果，]她将拿着火焰的手指伸向你的会阴，并迅速刺入其中。[pg]你遭到灼痛的袭击，只是因为瘫痪才没有跳开。[say: 疼痛很快就会消退。别担心，]女巫一边按摩你的会阴一边说道。你咬紧牙关，尽力忽略疼痛，在痛苦的几秒钟后，它开始消退。");
            outputText("[pg]然后你感觉到一股令人愉悦的热量从你的下体散发出来。热量逐渐增强，你的呼吸加快。你能感觉到你的前列腺在跳动，变得更大更强壮，腹股沟处的压力急剧增加。[Eachcock]变得比你想象的更勃起、更肿胀，静脉淫秽地凸起，几乎要被血液撑破。[pg]你不由自主地收紧，将一团团先列腺液射在女巫的脸上。她勤奋地吞下所有的液体，同时继续在你的会阴上施展法术。快感达到顶峰，促使你呻吟和流口水，你的身体瘫痪，无法释放。[pg]你感觉到你的前列腺超负荷运转，精液溢出，其中一些从你的[cockhead]流出。这种快感令人发狂，你尽力恳求她停下来，你的瘫痪和快感使你无法形成连贯的句子。[say: 很快就会结束的，别担心。] 这种感觉对你的大脑来说太强烈了。[pg]突然，她把手指从你的会阴移开，瘫痪被打破了。你射精了。女巫立刻把嘴凑到你的[cockhead]上，打算吞下你所有的精液，她以不可思议的力量吮吸着，舔舐着你的龟头。你在高潮结束前晕了过去。[pg]");
         }
         else
         {
            outputText("[pg][say: 看吧，我们研究的辛勤劳动成果，]她将拿着火焰的手指伸向你的[vagina]，并迅速刺入其中。[pg]你遭到灼痛的袭击，只是因为瘫痪才没有跳开。[say: 疼痛很快就会消退。别担心，]女巫一边按摩你的内壁一边说道。你咬紧牙关，尽力忽略疼痛，在痛苦的几秒钟后，它开始消退。");
            outputText("[pg]然后你感觉到一股令人愉悦的热量从你的下体散发出来。热量逐渐增强，你的呼吸加快。你能感觉到你的前列腺在跳动，变得更大更强壮，腹股沟处的压力急剧增加。[Eachcock]变得比你想象的更勃起、更肿胀，静脉淫秽地凸起，几乎要被血液撑破，你的[vagina]");
            if(get_player().wetness() < 3)
            {
               outputText("滴落着");
            }
            if(get_player().wetness() < 5)
            {
               outputText("喷涌着");
            }
            else
            {
               outputText("飞溅着");
            }
            outputText("清澈的淫液在女巫的手上。");
            outputText("[pg]你不由自主地收紧，将一团团先列腺液射在女巫的脸上。她勤奋地吞下所有的液体，同时继续在你的会阴上施展法术。快感达到顶峰，促使你呻吟和流口水，你的身体瘫痪，无法释放。");
            outputText("[pg]你感觉到你的前列腺超负荷运转，精液溢出，其中一些从你的[cockhead]流出。这种快感令人发狂，你尽力恳求她停下来，你的瘫痪和快感使你无法形成连贯的句子。[say: 很快就会结束的，别担心。] 这种感觉对你的大脑来说太强烈了。[pg]突然，她把手指从你的[vagina]移开，瘫痪被打破了。你射精了。女巫立刻把嘴凑到你的[cockhead]上，打算吞下你所有的精液，她以不可思议的力量吮吸着，舔舐着你的龟头。你在高潮结束前晕了过去。[pg]");
         }
         get_player().orgasm("Vaginal");
         if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
         {
            doNext(corrWitchBlessing2);
         }
         else
         {
            doNext(corrWitchBlessing2TOOBIG);
         }
      }
      
      public function buyWitchBook(param1:Number) : void
      {
         clearOutput();
         get_player().destroyItems(get_consumables().MINOCUM,param1);
         outputText("你把瓶子递给她。她拔开每个瓶子的塞子闻了闻。[say: 是的。这些很好。你继续成为我们的巨大财富，旅行者。这是你应得的奖励。]");
         outputText("[pg]女巫把瓶子收进包里，然后从里面拿出一本完全空白、破旧不堪的书。她把手放在封面上，念诵了一系列神秘的咒语。");
         outputText("[pg]随着每一个字，书的外观都在改变，呈现出更加华丽和保存完好的样子。");
         outputText("几秒钟后，这本书恢复到了可读的状态，尽管封面上黑白相间的符文对你来说仍然是个谜。她微笑着把书递给你。");
         outputText("[pg][say: 祝你学习顺利。我的一些姐妹会因此诅咒我，但如果我们的集会遭遇了可怕的命运……总得有人让我们的知识传承下去。]");
         outputText("[pg]你接过书并向她道谢。你的武器库里又多了一件工具。");
         get_inventory().takeItem(get_consumables().G__BOOK,get_camp().returnToCampUseOneHour);
      }
   }
}

