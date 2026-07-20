package classes.scenes.areas.mountain
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.pregnancies.PlayerHellhoundPregnancy;
   import flash.Boot;
   import haxe.IMap;
   
   public class HellHoundScene extends BaseContent
   {
      
      public function HellHoundScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         new PlayerHellhoundPregnancy(param1);
      }
      
      public function hellhoundRapesPlayer() : void
      {
         clearOutput();
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("被性欲冲昏头脑的你，向这只饥渴的地狱犬屈服了。[pg]");
         }
         else
         {
            outputText("你虚弱得无法继续战斗，双膝一软跪倒在地。[pg]");
         }
         outputText("地狱犬满眼欲望地注视着你，步步逼近。当它站在你面前时，你看着它的装备，不禁瞪大了眼睛：那是两根八英寸长的黑色肉棒，一上一下排列着，下面还挂着一个囊袋，里面装着四颗燃烧着火焰的睾丸。随着这只恶犬大摇大摆地靠近，一想到那些燃烧的睾丸即将把什么东西注入你的体内，你咽了口唾沫。你无力反抗，任由地狱犬将你按倒在你的");
         if(get_player().lowerBody.type == 1)
         {
            outputText("飞节和膝盖上");
         }
         else
         {
            outputText("双手和双膝");
         }
         outputText("并站在你身后。他迅速骑上你，肌肉发达的身体将你压倒，轻松地将你固定在原地。这个强大的生物轻易地穿过了你的[armor]，你感觉到他的一根肉棒擦过你的[ass]。当他把两个头低到你头的两侧时，一阵战栗传遍你的全身，他灼热的犬类呼吸吹过你的耳朵。他在那里呆了一会儿，完全静止……然后突然把头向后拉，并且");
         if(get_player().hasVagina() && !get_player().hasTailInsteadOfLegs())
         {
            outputText("将他的两根阴茎猛地插入你的" + get_player().vaginaDescript(0) + "和你的[asshole]中。");
            get_player().cuntChange(get_monster().cockArea(0),true);
         }
         else
         {
            outputText("将他下面那根阴茎猛地插入你的[asshole]中，同时将另一根在你的[ass]瓣之间摩擦。");
         }
         get_player().buttChange(get_monster().cockArea(0),true,false);
         if(get_player().hasVagina() && !get_player().hasTailInsteadOfLegs())
         {
            get_images().showImage("hellhound-loss-vag");
            if(get_player().vaginalCapacity() < get_monster().cockArea(0))
            {
               outputText("你感觉到下半身传来一种强烈的混合感，你的[asshole]感觉像是被撕裂了，而你的" + get_player().vaginaDescript(0) + "则因为被这只生物巨大的阴茎填满而充满了强烈的快感。");
            }
            else
            {
               outputText("地狱犬强行插入的速度太快，无论是你的[asshole]还是" + get_player().vaginaDescript(0) + "都无法承受，下半身瞬间爆发出剧烈的疼痛。");
            }
            if(get_player().vaginas[0].virgin)
            {
               outputText("<b>你不再是处女了！</b>");
            }
            if(get_player().cuntChange(get_monster().cockArea(0),false))
            {
               outputText("当你的" + get_player().vaginaDescript(0) + "被撑开以容纳那根粗大的肉棒时，野兽发出了一声嚎叫。");
            }
            outputText("地狱犬喘息了几秒钟，然后继续动作。");
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("这短暂的停顿让你的" + get_player().vaginaDescript(0) + "有时间变得湿润，确保下一次抽插不会那么粗暴。");
            }
            outputText("这一次，野兽开始更加轻柔地抽插，每次只深入一小段距离，地狱犬继续喘息着。随着你[asshole]的疼痛消退，你开始感受到与从你的" + get_player().vaginaDescript(0) + "升起的感觉相匹配的快感。野兽双重阳具的每一次抽插都让你越来越接近高潮。[pg]");
            outputText("当你达到高潮时，野兽嚎叫起来，你感觉到它那不可思议的滚烫精液注入了你的体内。");
            if(get_player().cor < 40)
            {
               outputText("当你的体内开始发热时，你呻吟起来。随着越来越多火热的精液被泵入你的身体，那种令人不适的灼热感只会越来越强烈。在感觉像是过了一个世纪之后，野兽从你体内拔出。它用那长长的、像狗一样的舌头在你的" + get_player().vaginaDescript(0) + "和你的[asshole]上长长地舔了一下，然后跑出了你的视线。你体内的污秽热量证明太过强烈，你晕了过去。过了一段时间，你醒来发现体内的堕落温暖谢天谢地已经消退了。你能够再次站起来，但伤害已经造成，这生物的精液让你感到相当虚弱。");
            }
            else
            {
               outputText("他燃烧的精液带来了你未曾预料到的快感；你的体内感觉就像在燃烧着激情和力量。这是一次不可思议且火热的体验，如果你没有获得自从来到这里后得到的堕落力量，你认为自己是不可能拥有这种体验的。太快了，野兽从你体内拔出。他用那长长的、像狗一样的舌头在你的" + get_player().vaginaDescript(0) + "和你的[asshole]上长长地舔了一下，然后跑开了。你迅速看过去，在它从视线中消失之前，勉强瞥见了它的尾巴，就在你的身体陷入沉睡之前。当你醒来时，你仍然能感觉到体内滚烫精液的余韵。");
            }
            get_player().knockUp(6,352,101);
            get_player().orgasm("Vaginal",false);
         }
         else
         {
            get_images().showImage("hellhound-loss-butt");
            outputText("你的下半身爆发出剧痛，因为地狱犬强行进入的速度太快，你的" + get_player().assholeDescript() + "无法承受。他停顿了一下，喘息了几秒钟，但你几乎没有足够的时间喘口气，野兽又开始抽插起来。然而，这一次，野兽开始更加轻柔地抽插，每次只深入一小段距离，地狱犬继续喘息着。随着你[asshole]的疼痛消退，你开始从中感受到强烈的快感。野兽下方阳具的每一次抽插，加上上方阳具在上面挠痒和挑逗你的[ass]，都让你越来越接近高潮。[pg]");
            outputText("当你达到高潮时，野兽嚎叫起来，你感觉到它那不可思议的滚烫精液倾注进你的体内，也洒在你的背上。");
            if(get_player().cor < 40)
            {
               outputText("你呻吟着，试图挣脱以摆脱背上的灼热……但野兽紧紧抓住了你，越来越多的火热精液被泵入你的体内，也洒在你的身上。感觉过了漫长的一个世纪后，野兽才从你体内拔出。它用长长的、像狗一样的舌头在你的[asshole]上长长地舔了一下，然后跑得无影无踪。你终于能够打滚，摆脱背上的灼热，但你对体内那股被污染的温暖却无能为力。这股热量实在太强了，你晕了过去。过了一段时间，你醒来发现体内的火焰谢天谢地已经消退了。你又能站起来了，但伤害已经造成，这只生物的精液让你感到相当虚弱。");
            }
            else
            {
               outputText("它那燃烧的精液带来了一种你意想不到的快感；你的内脏感觉像是被激情和力量点燃了。你的背部也感受到了同样的愉悦，你的肌肉感觉像是在被热量按摩。这是一次不可思议的火热体验，你觉得如果不是因为你来到这里后获得的腐化力量，你是不可能拥有这种体验的。太快了，野兽从你体内拔出，用它长长的、像狗一样的舌头在你的[asshole]上长长地舔了一下，然后跑开了。你迅速看过去，在它消失在视线中之前，勉强瞥见了它的尾巴，就在你的身体陷入沉睡之前。当你醒来时，你仍然能感觉到体内燃烧精液的余韵。");
            }
         }
         get_player().slimeFeed();
         get_player().orgasm("Anal");
         if(get_player().cor < 40)
         {
            dynStats(DynStat.Tou(-2),DynStat.Cor(1));
         }
         else
         {
            dynStats(DynStat.Cor(1.5));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function hellhoundEncounter() : void
      {
         clearOutput();
         get_images().showImage("monster-hellhound");
         outputText("你听到一声充满烈焰气息的嚎叫，一只长着两个脑袋的恶魔犬跳到了你的面前！");
         unlockCodexEntry(2043);
         startCombat(new HellHound());
         spriteSelect(SpriteDb.get_s_hellhound());
      }
      
      public function hellHoundPropahRape() : void
      {
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("地狱犬身上的火焰黯淡下来，几颗脑袋发出一声呜咽，随后这头怪物便瘫倒在地，彻底落败，几乎失去了意识。在他身上费了这么大劲，你决定找点乐子作为补偿。[say:坏狗狗，打个滚！]你像使唤普通家犬一样命令着地狱犬。令你惊讶的是，这头怪物竟然真的照做了。他接受了你的胜利，翻过身来，露出肚皮和喉咙，以示臣服。你俯视着你的手下败将，充满情欲的目光落在了他的私处。你打量着那个长着四颗睾丸的奇特阴囊，但真正的宝藏还在后头。你拉开他的包皮，露出了他那对双管齐下的狗鸡巴。一个疯狂的念头涌上心头，你决定好好利用一下他这宏伟的工具。[pg]");
         }
         else
         {
            outputText("地狱犬不忍心再伤害你，他身上的火焰黯淡下来，停止了攻击。两颗脑袋看着你，发出哀怨的呜咽。在他身上费了这么大劲，你决定找点乐子作为补偿。[say:坏狗狗，打个滚！]你像使唤普通家犬一样命令着地狱犬。令你惊讶的是，这头怪物竟然真的照做了。他接受了你的胜利，翻过身来，露出肚皮和喉咙，以示臣服。你俯视着你的手下败将，充满情欲的目光落在了他的私处。你打量着那个长着四颗睾丸的奇特阴囊，但真正的宝藏就在它上方跳动。你拉开他的包皮，看着他那对双管齐下的肉棒因你的动作而抽动，你不禁露出了微笑。一个疯狂的念头涌上心头，你决定好好利用一下他这宏伟的工具。[pg]");
         }
         outputText("你开始抚摸他那对奇妙的犬类肉棒。虽然地狱犬已经神志不清，但他的鸡巴");
         if(get_monster().get_HP() < 1)
         {
            outputText("却精神抖擞，迅速从包皮里伸了出来。你试探性地轻轻舔了其中一根，得到了一滴先列腺液作为奖励。[pg]");
         }
         else
         {
            outputText("却依然能渗出大量滚烫的先列腺液，弄得他满肚子都是。你试探性地轻轻舔了其中一根，得到了一大口这种液体作为奖励。[pg]");
         }
         if(!get_player().isCorruptEnough(20))
         {
            outputText("这堕落的汁液在你的舌尖上灼烧，比你吃过的最辣的菜还要难受得多。你立刻从他的肉棒上退开，咒骂着这个违背自然的怪物。你把这只顺从的生物留在原地，径直返回了营地。");
            dynStats(DynStat.Lust(0,DynStatOp.Eq));
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("这股麝香味让快感传遍你的全身，湿润了你的" + get_player().vaginaDescript(0) + "。你决定前戏到此为止，脱下了你[armor]的下半部分。你抚摸着两根肉棒，让它们完全勃起，硬得发紫。你抓住其中一根，同时小心地将屁股对准第一根獒犬般的肉棒。它尖锐的顶端抵住了你的屁眼。你放松括约肌，滴着先列腺液的锥形肉棒轻松地滑入你的体内。当第一根肉棒有一半埋入你准备好的屁眼时，你停了下来。你努力保持平衡，抓住地狱犬另一根跳动的肉棒，引导它进入你现在湿透的阴道。你慢慢地坐下，将自己贯穿在他那华丽的双茎上。");
         get_player().cuntChange(get_monster().cockArea(0),true,false,true);
         get_player().buttChange(get_monster().cockArea(1),true,false,true);
         if(!get_player().isCorruptEnough(40) && !get_player().hasPerk(PerkLib.Masochist))
         {
            outputText("当你坐到底，碰到他的包皮时，你向前倾身，将他更多滚烫的肉棒吞入体内。地狱犬很享受你给他的服侍。结果，他眼睛和鼻子周围的火焰重新燃起。正当你变硬的阴蒂压在他阴囊顶部时，地狱犬天生的火焰舔舐过你的私处。这神奇的火焰让你欲火焚身，但也给你最敏感的部位带来了剧烈的疼痛。你几乎是从这堕落的生物身上跳了起来，以极快的速度将肉棒从你的洞里拔出。你几乎要被这种感觉痛晕过去，捂住被烧伤的阴蒂，不敢再碰它。你咒骂着这个生物，大声地对着地狱犬爆粗口。在愤怒中，你几乎没有注意到他看起来很失望，甚至有些抱歉。");
            get_player().takeDamage(20);
            dynStats(DynStat.Lust(-99));
            get_combat().cleanupAfterCombat();
            return;
         }
         get_images().showImage("hellhound-win-vag");
         outputText("他神奇的天然火焰让你的身体充满了强烈的温暖，进一步唤起了你的性欲。你抬起身子，让地狱犬的肉棒几乎从你的下体滑出，然后再次坐下，将这对狗肉棒吞没至根部。你抓住他的后腿，就像抓住健身器材的把手一样，摆好姿势准备大干一场。渐渐地，你加快了速度，上下摇晃着臀部，享受着这绝妙的双重插入。");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("你的[chest]随着你起伏研磨的动作，以美妙的幅度摇晃着。");
         }
         outputText("骑了这只猎犬几分钟后，你感觉到插在[asshole]里的阴茎在变长，把你的肠道撑得满满的。插在" + get_player().vaginaDescript(0) + "里的那根也一样，从你湿滑的缝隙中挤出越来越多的淫液，同时从内部刺激着你敏感的阴蒂。你向前倾身，双手穿过你这只性奴浓密的午夜黑毛，感受着他野兽般的体温。地狱犬在你身下呻吟喘息着，不知道是该害怕你，还是该享受你对他做的一切。[pg]");
         if(get_player().hasCock())
         {
            outputText("他插在你肛门里的犬类肉棒完美地刺激着你的前列腺。他那根奇特的黑色巨根压迫着你身体的某些部位，给你带来了意想不到的快感。");
            if(get_player().totalCocks() == 1)
            {
               outputText("很快你的[cock]也有了反应，迅速勃起，胀得发疼。你没有去管你的肉棒，在你骑乘地狱犬的时候，它不断地拍打着他的肚子。");
            }
            else
            {
               outputText("很快[eachcock]都有了反应，迅速勃起，胀得发疼。你没有去管你的肉棒，在你骑乘地狱犬的时候，它们不断地拍打着他的肚子。");
            }
         }
         if(get_player().balls > 0)
         {
            outputText("每当你把臀部压向你伴侣的肚子时，你的[balls]就会碰到他的。那神奇的火焰让你的阴囊充满了不自然的灼热感，但并不痛苦。你简直能感觉到你蛋蛋里的精液在向上沸腾，积聚起巨大的压力。");
         }
         outputText("[pg]");
         outputText("太快了，塞在你体内的两根狗鸡巴开始抽搐，将四颗睾丸分量的精液灌入你的体内。你的阴道和直肠中传来的双重喷发感棒极了，它们时而同步时而交错地跳动，一次又一次地将精液倾注进你的身体。地狱犬射精结束后，他的抽动逐渐减弱，但你还没有满足。你慢慢开始前后摆动臀部，继续猛烈地套弄着那根主要的肉棒，而另一根则几乎一动不动地停留在你的屁股里。很快，地狱犬因为他现在敏感的阴茎受到不想要的刺激而发出呜咽，但他已经筋疲力尽，无力挣扎。[pg]");
         outputText("缓慢但稳定地，你将自己推向了高潮的边缘。你身下的地狱犬扭动着试图挣脱，他的后腿在你背后的半空中乱蹬。你继续骑乘着他那宏伟的肉棒，在你湿润的穴肉中上下研磨。最后，你感觉到阴道壁传来熟悉的阵挛，榨取着他的鸡巴，让你的快感愈发强烈。你夹紧他的肉棒，继续转圈扭动着臀部，让你的阴蒂、阴道和屁股都得到同等的刺激。这股快感最终让你迎来了强烈的高潮，而地狱犬仍然膨胀的肉棒对你所有敏感部位施加了完美的压力，延长了你的极乐。");
         if(get_player().totalCocks() > 0)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("你的[cock]抽搐着，射出了黏糊糊的精液。");
            }
            else
            {
               outputText("你的[cocks]抽搐着，射出了黏糊糊的精液。");
            }
            outputText("保持着动作，你将精液洒满了地狱犬的身体和附近的地面。");
            if(get_player().cumQ() > 700)
            {
               outputText("随着高潮的持续，你几乎把地狱犬浸泡在你的精液里。一大股精液落在了他的鼻子上，那些脑袋贪婪地用犬舌舔舐着你的汁液。你伴侣的黑色皮毛被你的精液浸透了，他肯定要花些时间把自己舔干净了。");
            }
         }
         outputText("[pg]");
         outputText("忙于自己的高潮，你几乎没有注意到埋在你体内的两根肉棒的抽搐。地狱犬又迎来了几次高潮，他的肉棒渴望着平静，想要软下来，却被你的身体强迫着高潮。你收紧肌肉，将血液锁在跳动的肉棒里，试图永远保留这种感觉。[pg]");
         outputText("终于结束后，你放松了肛门括约肌，让他的肉棒离开你的肛门。他的肉棒因为感觉到他四个睾丸泵入你洞里的惊人精液喷涌而出冲刷着它们而勃起。地狱犬蜷缩起来，精疲力竭，尾巴遮住了他的私处。他的肉棒因为激烈的性交看起来有点红，你确信尽管他本性如火，但他正在经历的不仅仅是灼烧感。");
         get_player().orgasm("Vaginal");
         get_player().orgasm("Anal",false);
         if(!get_player().isCorruptEnough(40))
         {
            dynStats(DynStat.Tou(-2),DynStat.Cor(1));
         }
         else
         {
            dynStats(DynStat.Cor(1.5));
         }
         get_player().knockUp(6,352,101);
         get_combat().cleanupAfterCombat();
      }
      
      public function hellHoundGetsRaped() : void
      {
         clearOutput();
         if(get_player().get_gender() == 3)
         {
            get_images().showImage("hellhound-win-herm");
         }
         else if(get_player().get_gender() == 1)
         {
            get_images().showImage("hellhound-win-male");
         }
         else
         {
            get_images().showImage("hellhound-win-female");
         }
         if(int(get_player().cocks.length) == 1 && int(get_player().vaginas.length) == 0)
         {
            outputText("地狱犬的两个脑袋急切地舔舐着你的" + get_player().cockDescript(0) + "。那宽大扁平的舌头带给你一种相当奇特的感觉，但绝对有效。当你接近高潮时，其中一个脑袋试图将你的肉棒含入嘴里。但另一个脑袋似乎对此不太高兴，两个脑袋开始互相撕咬，试图争夺将你推向顶峰的权利。因为被忽视而感到恼火，你用手给了两个脑袋各一巴掌。退缩了片刻后，它们带着歉意低下头，然后继续舔舐。当你达到高潮时，两个脑袋向后退去，试图用嘴接住从你[cock]中喷发出的所有精液。两者之间激烈的竞争意味着大部分精液都落在了它们急切的嘴巴外面，但它们仍然很满足。伴随着两声欢快的吠叫，地狱犬转身跑开了。");
         }
         if(get_player().get_gender() == 2)
         {
            outputText("地狱犬的两个脑袋急切地舔舐着你的" + get_player().vaginaDescript(0) + "。那宽大扁平的舌头带给你一种相当奇特的感觉，但绝对有效。当你接近高潮时，其中一个脑袋试图把另一个挤开，将它的鼻子推入你的" + get_player().vaginaDescript(0) + "。但另一个脑袋似乎对此不太高兴，两个脑袋开始互相撕咬，试图争夺将你推向顶峰的权利。因为被忽视而感到恼火，你用手给了两个脑袋各一巴掌。退缩了片刻后，它们带着歉意低下头，然后继续舔舐。当你达到高潮时，两个脑袋又开始争吵，试图尽可能多地喝下从你" + get_player().vaginaDescript(0) + "流出的液体。你不知道哪个喝得最多，但没过多久，你的" + get_player().vaginaDescript(0) + "绝对变得非常干净。伴随着两声欢快的吠叫，地狱犬转身跑开了。");
         }
         if(get_player().get_gender() == 3 && int(get_player().cocks.length) == 1)
         {
            outputText("其中一颗头急不可耐地开始舔舐你的" + get_player().cockDescript(0) + "，而另一颗头则开始对付你的" + get_player().vaginaDescript(0) + "。那宽大平坦的舌头给你带来了一种相当奇特的感觉，但绝对非常有效。随着你接近高潮，那颗一直舔舐你[cock]的头突然将其含入口中，而另一颗头则将它的吻部顶进你的" + get_player().vaginaDescript(0) + "。这种新花样带来的快感迅速将你淹没，让你头晕目眩。当你恢复理智时，你抬起头，看到地狱犬的舌头在它们嘴边舔来舔去，显然非常满足。伴随着两声欢快的吠叫，地狱犬转身跑开了。");
         }
         if(int(get_player().cocks.length) > 1)
         {
            outputText("其中一颗头急不可耐地开始舔舐你的" + get_player().cockDescript(0) + "，而另一颗头则开始对付你的" + get_player().cockDescript(1) + "。那宽大平坦的舌头给你带来了一种相当奇特的感觉，但绝对非常有效。随着你接近高潮，两颗头迅速将你的[cock]和" + get_player().cockDescript(1) + "含入口中。这种新花样带来的快感迅速将你淹没，让你头晕目眩。当你恢复理智时，你抬起头，看到地狱犬的舌头在它们嘴边舔来舔去，显然非常满足。伴随着两声欢快的吠叫，地狱犬转身跑开了。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("那两颗脑袋盯着你空空如也的下半身看了几秒钟，然后悲伤地抬头看着你。伴随着一声呜咽，地狱犬走开了。你感到相当不满足，觉得也许应该解决一下自己缺少性“器官”的问题……");
         }
         else
         {
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(0.5));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function giveUpLethicite() : void
      {
         clearOutput();
         outputText("你再次让主人的意志充满你的身体，带你回到他的家。你再次穿过群山中众多的峭壁和关隘，来到了地狱犬山谷。这个地方和你上次来时一模一样，但你无心欣赏风景，你还有其他紧迫的事情要处理。你迅速穿过山谷，来到主人巢穴的入口。[pg]");
         outputText("另一只魅魔在入口处站岗，旁边还站着另一只地狱犬。她鄙夷地看了你一眼，然后她的猎犬走上前来。[say:我的女主人不喜欢和低等猎犬打交道。不过，大宗师会很高兴见到你的。请直接进去吧。]它的一个头发出低沉的声音，然后指引你进入堡垒。你毫不犹豫地冲了进去。[pg]");
         get_images().showImage("hellhound-master");
         outputText("你急于见到主人，几乎没有心思去想里面的情况。当你冲进房间时，主人看到你，眼睛一亮。[say:啊！是我最喜欢的粉丝。你给我带来我向你要的那块粉红水晶了吗？][pg]");
         menu();
         if(get_player().keyItemv2("Marae\'s Lethicite") == 0)
         {
            addButton(0,"全部给予",giveALLTHELETHICITES);
         }
         else
         {
            addButtonDisabled(0,"全部给予");
         }
         addButton(1,"给予部分",giveLethicitePiece);
      }
      
      public function giveLethicitePiece() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你拿出粉色水晶递给大师。当水晶触碰到他的手时，他发出一声愉悦的低吼，将水晶举到眼前。[say: 啊，是的，太棒了！非常感谢你带来这份美味的力量大餐。][pg]");
         if(get_player().keyItemv1("Marae\'s Lethicite") == 2)
         {
            outputText("他盯着水晶看了一会儿，然后咬下了一半，把另一半还给了你。[say: 我想，这足够用来生起地狱之火了。剩下的你留着吧，我最喜欢的粉丝！][pg]");
            get_player().addKeyValue("Marae\'s Lethicite",1,-1);
         }
         else
         {
            _loc1_ = 2019;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            get_player().addKeyValue("Marae\'s Lethicite",1,-1);
         }
         outputText("他把水晶在嘴里滚了几下，然后吞了下去。片刻之后，白色的火焰在他身体周围升起，他给了你一个邪恶的笑容。[say: 现在，让我给你承诺的贡品礼物。][pg]");
         outputText("他从王座上拿出一个特殊的杯子，开始用一只手抚摸他那两根10英寸长的尖锐阴茎。[say: 仔细看，我想让你看看这力量从何而来。] 随着他手部动作的加快，他开始喘息。同时，光环集中在他那对肉棒上，他把杯子拿到它们面前。他发出一声满足的呻吟，白热的精液喷洒在杯子周围，带着同样的火焰。显然他还没有结束，他把杯子拿到他的装备下面，接住从恶魔其他生殖器流出的不太男性化的液体喷雾。[pg]");
         outputText("之后，恶魔周围的地上有一大滩热液，但他似乎认为杯子里收集的已经足够了，微笑着递给你。[say: 喝吧，我特别的朋友，分享我的地狱之火。] 你把杯子放到唇边，喝下热液。片刻之间，你感觉到一股热流穿过你的身体，你的胃里充满了热量和力量。你释放出这股热流，发出一声堕落火焰的咆哮。主人伸出双臂，在恶魔之火的波浪掠过他时咧嘴笑了。[pg]");
         outputText("他喘着粗气，等了一会儿，回味着你的火焰带给他的感觉。[say:现在，我年轻的宠物，你拥有了我赐予我的地狱犬们最伟大的力量。好好享受这份礼物吧！]他在打发你上路前宣布道。过了一段时间，你发现自己来到了山脚下，你的意志再次属于你自己。你试探性地呼吸了几次，可以轻易地感觉到体内的火焰。看来你现在确实拥有了喷吐地狱犬火焰的力量。[pg]");
         get_images().showImage("hellhound-hellfire");
         outputText("过了一会儿，你注意到似乎还有些不对劲……世界似乎略微染上了一层红色。担心自己身上还发生了其他什么事，你找了些水来看看自己的倒影。在短暂的震惊之后，你稳住心神，慢慢地告诉自己，现在你的眼睛和嘴巴里都有了清晰可见的火焰。这需要一段时间来适应。[pg]");
         outputText("<b>你现在拥有了喷吐地狱火的力量！</b>（只要你保持至少50的腐化，这种力量就会一直可用。）");
         dynStats(DynStat.Lib(3),DynStat.Lust(30),DynStat.Cor(6));
         if(!get_player().hasPerk(PerkLib.Hellfire))
         {
            get_player().createPerk(PerkLib.Hellfire,0,0,0,0);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,141,FlagDict_Impl_.arrayReadInt(_loc2_,141) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveALLTHELETHICITES() : void
      {
         clearOutput();
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         outputText("你拿出了从玛莱那里偷来的巨大粉色水晶。一看到这颗宝石，恶魔的眼睛睁得老大，你几乎不敢相信眼珠子还能留在他的眼眶里。[say:这是我想的那个吗……是的，是的！你给我带来了一份了不起的奖品，我奇妙的模仿者！]他从你手中一把夺过水晶，在手里捧了一会儿，眼中流露出疯狂而饥渴的神色。你依然受他控制，只能眼睁睁地看着他手里拿着宝石狂喜了好几分钟。[pg]");
         outputText("[say:哼，哼，哼。]他轻笑着。[say:女神的水晶，这将会带来改变，哦，是的。]当他握紧水晶时，水晶闪烁起光芒。[say:而你，哦，为了这份礼物，你应得的远不止地狱火。来吧！]他大喊道。片刻之后，你见过的最大的地狱犬冲进了房间。[pg]");
         if(get_player().dogCocks() >= 2)
         {
            outputText("这只地狱犬很明显是个雌性，肿胀的乳头从她明显怀孕的腹部凸出，散发着强烈的力量气息。她的两个脑袋之一向疯狂的恶魔低语，[say: 您叫我，主人？] [say: 是的，我珍贵的克雷梅拉！立刻和这个冒牌货交配！[He]将成为你的第三个脑袋！][pg]");
            outputText("克雷梅拉立刻转过身，向你展示她那等待着的、湿漉漉的双重阴道。地狱犬之主走到你身后，拍了拍你的屁股。[say: 别让她久等了，] 他说着，你浑身一阵战栗，你的[armor]掉落在你周围的地上。[pg]");
            if(get_player().totalCocks() > 2 || get_player().cockThatFits(60) < 0)
            {
               outputText("然后他伸手环住你的腰，抓住了你的[cocks]。[say: 在我们开始之前，先确保你完全适合克雷梅拉。] 然后他重塑了你的身体，让你拥有了尺寸合适的双重狗鸡巴。[say: 现在开始吧。][pg]");
               get_player().cocks[0].set_cockType(CockTypesEnum.DOG);
               get_player().cocks[1].set_cockType(CockTypesEnum.DOG);
               get_player().cocks[0].cockThickness = 3;
               get_player().cocks[1].cockThickness = 3;
               get_player().cocks[0].cockLength = 14;
               get_player().cocks[1].cockLength = 14;
               while(int(get_player().cocks.length) > 2)
               {
                  get_player().removeCock(2,1);
               }
            }
            get_images().showImage("badend-hellhound-male");
            outputText("你没有犹豫。你扑向发情的巴盖斯特，毫不犹豫地将你的两根狗鸡巴猛地插入她的两个阴道中。这只母狗发出一声低吼作为回应，开始用她的后臀迎合你，而你则肆无忌惮地在她体内抽插。她体内的快感让你疯狂，这是你以前从未体验过的。她那流着淫水的阴道发出的巨大水声和刺激让你除了抽插和沉浸在快感中之外，什么也做不了。");
            outputText("[pg]没过多久，你就在她体内释放了自己，感觉到你的肉结膨胀，将你们两个锁结在一起。主人抚摸了一下你的头，然后在你耳边低语，[say: 通常情况下，狗的肉结是我唯一不喜欢普通老狗的地方，但对于这个来说，它很完美。] 他对你咧嘴一笑，举起一只闪烁着耀眼光芒的手，然后拍在你的" + get_player().assDescript() + "上。你感觉自己被迫更深地进入了克雷梅拉体内，并在快感的驱使下忍不住再次在她体内释放。[say: 还不够！] 恶魔大喊着，再次拍打你，将你推得更深。你甚至没有机会去想这到底是怎么回事，你被快感淹没了，但当你试图高潮时，你发现你做不到！你发出一声呜咽，但恶魔无视了你，再次拍打你，迫使你进入得更深。你因为无法高潮而大叫，但迎接你的只是又一次拍打，然后又一次，又一次……[pg]");
            outputText("感觉过了好几个小时，你又被拍打了一次，感觉自己完全穿透了克雷梅拉。你感觉到你的两根狗鸡巴挣脱出来，终于射了；它们感觉像是把你体内的一切都射了出来。你因为终于解脱而喘息着，低头看向身下。你眨了几下眼睛，将视线集中在自己的身体上。你所能看到的只有怀孕般隆起的肚子上肿胀的乳头，以及你那巨大的狗鸡巴，现在奇怪的是它们的肉结不见了，并且变成了黑色。它们下面似乎还长出了一袋四个睾丸。在你面前是一大滩冒着热气的白色液体，中间放着一块粉红色的水晶。[pg]");
            outputText("[say: 那么我的新宠物，你觉得怎么样？] 一个声音在你的脑海中响起。你向旁边看去，看到克雷梅拉的一个头在你的右边，另一个在你的左边。你的身体似乎在自己动，向后扭曲，这样左边的头就可以舔舐你的双茎。另一个声音在你的脑海中响起，[say: 它们太棒了，主人。][pg]");
         }
         else
         {
            outputText("这只猎犬很明显是雄性，带着一对15英寸长的黑色尖锐肉棒，以及一个装着四个哈密瓜大小睾丸的阴囊。他散发着强烈的力量光环。他的两个头中的一个向那个疯狂的恶魔沉声说道，[say: 您叫我，主人？] [say: 是的，我珍贵的西默！立刻和这个赝品做爱！[He]将成为你的第三个头！][pg]");
            outputText("西默立刻走到你身后，用后腿站立起来，他沉重的爪子抵在你的背上，两根狗鸡巴顶着你的屁股。主人走到你面前，把手放在你的下巴下。[say: 别让我的宠物失望，] 他说着，手顺着你的身体滑下，你的[armor]掉落在地。在西默有机会把你推倒之前，你弯下腰，准备用你的" + get_player().vaginaDescript(0) + "和你的[asshole]接纳他的性器。[say: 等等，最后做个准备……][pg]");
            outputText("他绕到你身后，你感觉有什么冰凉微小的东西被放进了你的[asshole]。它似乎在你体内延伸得更深，并四处蠕动。你的肠胃有一种奇怪的感觉，就像是被重新排列了一样。过了一会儿，那个物体被取出了，你注意到你的[ass]现在感觉非常像你的" + get_player().vaginaDescript(0) + "！[say: 你喜欢你的第二个新小穴吗？它对我宠物的肉棒来说再完美不过了，我甚至把肉结加回了他的鸡巴上。通常情况下，肉结是我对普通老狗唯一不喜欢的东西，但对于这个，它简直完美。][pg]");
            get_images().showImage("badend-hellhound-female");
            outputText("你还没反应过来他说完了话，就感觉整个下半身被一种难以想象的美妙方式填满了！[pg]");
            if(get_player().vaginalCapacity() < 45)
            {
               if(get_player().vaginas[0].virgin)
               {
                  outputText("一次挺进就夺走了你两个处女穴的贞操，你");
               }
               else
               {
                  outputText("你");
               }
               get_player().vaginas[0].vaginalLooseness = 3;
               outputText("的两个小穴迅速被撑开，以容纳这些入侵者。[pg]");
            }
            outputText("被填满的快感让你忍不住发出一声娇喘。这只猎犬毫不迟疑，肆无忌惮地在你体内抽插。你简直不敢相信这种狂野的感觉，更不敢相信你的两处女性象征竟然能如此轻易地吞下这两根肉棒，并紧紧地包裹住它们。[pg]");
            outputText("没过多久，你就感觉到西默的阴茎在你体内爆发，喷射出美妙滚烫的精液，他新长出的肉结也随之膨胀，将你们俩锁结在一起。然而，感觉有些不对劲，你自己并没有感觉到高潮！你发出一声呜咽，试图迎合西默插在你体内的那对狗鸡巴。突然传来一声响亮的拍打声，你感觉西默似乎被推进了你体内更深处！这是一种不可思议的感觉，几乎就像他要穿透你的" + get_player().buttDescript() + "一样，但你还是无法高潮！[say:这还不够！再深一点，再深一点！]你听到主人的大喊。你再次感觉到西默被强行塞进你体内越来越深的地方，伴随着响亮的拍打声。你再次发现自己无法获得甜蜜的释放，但你几乎没有时间去思考这些，因为又是一阵爆发和拍打，一次又一次。感觉就像你的[ass]正在被拍打……[pg]");
            outputText("在经历了感觉像是长达数小时没有释放的痛苦快感之后，你的屁股最后一次被拍打，感觉西默完全穿透了你的身体。这终于打开了闸门，你感觉自己正在以有史以来最强烈的高潮释放出体内的一切。你喘息了片刻，低头看向身前。你看到的不再是人形的身体，而是一具犬科动物的身体，肿胀的狗乳头覆盖着你怀孕的肚子。你还看到一包恶魔的鸡巴从你身前伸出，下面挂着四个滚烫的睾丸。在你面前是一大滩冒着热气的白色液体，中间放着一块粉红色的水晶。[pg]");
            outputText("[say:那么我的新宠物，你觉得怎么样？]一个声音在你的脑海中响起。你转头看向两边，看到西默的一个头在你的右边，另一个在你的左边。你的身体似乎在自己动，向后扭曲，让左边的头可以舔舐你的" + get_player().vaginaDescript(0) + "。另一个声音在你的脑海中响起，[say:它们太棒了，主人。][pg]");
         }
         doNext(badEndPartTwo);
      }
      
      public function declineGivingAwayLethicite() : void
      {
         clearOutput();
         outputText("你将那股存在感赶出脑海。也许以后你会去获取地狱火，但现在你宁愿保留莱希石。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function declineCrazyPresences() : void
      {
         clearOutput();
         outputText("你将那股意识强行赶出脑海。在它消失后，你几乎感到有些失落，但把自己的控制权交给外来者绝不是个好主意，不是吗？");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function badEndPartTwo() : void
      {
         clearOutput();
         get_images().showImage("badend-hellhound-cerberus");
         outputText("感受着新身体的美妙感觉，以及涌入体内的不可思议的力量，你也不禁表示赞同。你转过头去舔舐你的鸡巴和小穴，享受着它们的感觉以及其中蕴含的火焰。你喘息了片刻，张开嘴，一股热流从胸口升起，一团火焰从你口中喷涌而出。[pg]");
         outputText("一个强大的恶魔走到你面前，捡起了水晶。你能感觉到与他之间强烈的联系，你知道这就是你的主人。[say:好了，我想你现在需要一个新名字，以纪念你成为第一只三头地狱犬，以及成为那个将把世界献给我的人。]他毫不客气地把水晶放进嘴里吞了下去。[say:你的新名字是刻耳柏洛斯，你是我最棒的宠物。]他走近一步，注视着你中间那个头的眼睛片刻。[say:这可比当什么勇者好多了，不是吗？]你忍不住热切地点头表示同意。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(50),DynStat.Cor(100));
         get_game().gameOver();
      }
      
      public function acceptCrazyPresencesII() : void
      {
         clearOutput();
         outputText("堡垒的内部显然只是一个深入洞穴系统的更大建筑群的外部防御工事。当你继续往里走时，你发现自己停在了狗窝前。这些似乎是为最强壮的地狱犬准备的，以及那些有自己恶魔主人的地狱犬。你看到一些其他的梦魔和魅魔在和他们的地狱犬宠物玩耍。不过在大多数情况下，你并没有注意堡垒的细节。你太兴奋了，想去最深处见你的主人，所以你匆匆走过。[pg]");
         get_images().showImage("hellhound-master");
         outputText("你迅速穿过犬舍、享乐坑和实验室，来到了内部圣所。在里面，你发现了一个强大而俊美的男性恶魔。他看到你时咧嘴一笑，开始绕着你走动并打量着你。与此同时，你也有机会仔细观察他。他身高约七英尺，拥有雕塑般完美的肌肉和深色的皮肤。很明显，他很喜欢他的猎犬的外表，因为他化作的形态，体格与雄性猎犬非常接近。嗯，除了只有一个头，以及同时拥有两根肉棒和两个小穴。他可能经常“品尝”他的猎犬。一想到他也可能对你做同样的事，你就感到一阵难以抑制的兴奋。[pg]");
         outputText("在好好打量了你一番后，他开口了。[say: 哎呀呀，真有趣！看来你这么喜欢我的宠物，以至于自己也想变成一只，是吗？我真是受宠若惊！] 他后退一步，看了看你的全身。[say: 非常不错！没有我的帮助，你已经非常接近成为一只地狱犬了，但这还不够完美。如果我没看错的话，你还没有标志性的地狱火，对吧？] 他停顿了一下，一边敲着下巴，一边抚摸着自己的一根肉棒。[say: 这样吧，如果你能给我找来一块充满灵魂力量的粉色水晶，我就赐予你地狱火的力量。就这么简单！当你拿到它时，只要顺着我的呼唤，你就能找到回来的路，别担心。][pg]");
         outputText("过了一段时间，你发现自己来到了山脚下。你的心智再次属于你自己。片刻之后，你意识到自己仍然能感觉到脑海中地狱犬之主微弱的呼唤声，随后它便消失了。如果你直接回到山里，可能毫不费力就能再次找到它，但除非你有东西可以交换他提到的地狱火，否则这么做也没什么意义……");
         if(get_player().hasKeyItem("Marae\'s Lethicite") && get_player().keyItemv2("Marae\'s Lethicite") < 3)
         {
            outputText("你从你的[inv]中取出玛莱的莱希石，犹豫着是否真的要用它来交换他提供的地狱火。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,141,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function acceptCrazyPresences() : void
      {
         clearOutput();
         get_images().showImage("hellhound-crazyPresences");
         outputText("你放松心神，任由那股意识占据你的脑海。它控制了你的意识，引导着你的思绪。你觉得你应该回家了，你的主人可能想第一次见见你。你本能地在山脉中蜿蜒穿梭，这是一条你不记得的路，也没有心思去记住。一段时间后，你从峭壁和山口中走出，发现了一个精致的山谷，里面满是地狱犬。[pg]");
         outputText("看到你的兄弟们跑来跑去，互相玩耍，互相交配，你笑了。你可以看到许多暴力的双头双屌地狱犬雄性，以及更具诱惑力的双头双穴地狱犬雌性。也很容易看到那些凶恶的、明显怀有身孕的巴盖斯特，因为一旦雌性到了那个阶段，其他猎犬就会对它们敬而远之。这是一个相当大的族群，但你不能骄傲地看太久，你需要去见你的主人！[pg]");
         outputText("你继续向主人的家跋涉，你能感觉到你已经很近了。在山谷的后面，矗立着一个类似堡垒的建筑，前面是一大片悬崖。在入口处，站着一个迷人的靛蓝色魅魔，手里牵着一只非常大的地狱犬的皮带。她看到你走近，微笑着把你叫过去。你高兴地小跑到恶魔女主人身边，用头蹭她的的大腿。她用双手捧起你的头，调皮地揉了揉，说道：[say:啊，多可爱的一只迷路小狗。你是来见主人的吗？进去吧，他总是有时间陪他忠诚的猎犬的。你可能真的很孤独，我相信他能找到一个朋友来加入你那美丽的身体。]你急切地向她点点头，然后走了进去。[pg]");
         doNext(acceptCrazyPresencesII);
      }
      
      public function HellHoundMasterEncounter() : void
      {
         clearOutput();
         get_images().showImage("area-mountain");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,141) == 0)
         {
            outputText("当你在山中漫步时，你感觉到脑海深处有一种奇怪的存在。它向你呼唤，承诺给予你力量和安全，但你内心深处对于将自己交由它控制的想法感到有些忐忑。你要让这个存在接管你吗？");
            doYesNo(acceptCrazyPresences,declineCrazyPresences);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,141) == 1)
         {
            outputText("当你在山中漫步时，你再次感觉到脑海深处有一种奇怪的存在。你确信这又是那个地狱犬之主。你看着手中的粉色水晶，想知道是否应该用它来交换承诺中的地狱火。你要让这个存在接管你并交出魂晶吗？");
            doYesNo(giveUpLethicite,declineGivingAwayLethicite);
         }
      }
   }
}

