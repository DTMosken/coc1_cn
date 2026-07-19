package classes.scenes.areas.mountain
{
   import classes.BaseContent;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class InfestedHellhoundScene extends BaseContent
   {
      
      public function InfestedHellhoundScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function infestedHellhoundLossRape() : void
      {
         clearOutput();
         if(get_player().totalCocks() > 0 && get_player().hasStatusEffect(StatusEffects.Infested))
         {
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("屈服于这种野兽的耻辱，也无法压倒你下体燃烧的欲望熔炉。");
               if(get_player().cor < 33)
               {
                  outputText("尽管你感到厌恶");
               }
               else if(get_player().cor < 66)
               {
                  outputText("尽管你理智上知道不该这样");
               }
               else
               {
                  outputText("带着一种变态的期待感");
               }
               outputText("你脱下你的[armor]，翻身仰躺，将脆弱的下体暴露在野兽面前。[pg]");
            }
            else
            {
               outputText("你伤得站不起来，为了不让自己倒在地上，你四肢着地。你意识到自己的错误时已经太晚了——那只咆哮的野兽就在你身后，它锋利的牙齿轻易地咬穿了你的[armor]，然后撕掉了那件碍事的盔甲，露出了你的" + get_player().assDescript() + "和[cocks]。一阵寒冷的山风吹过你现在暴露的[skindesc]，提醒你在这个共生怪物的异形欲望面前，你是多么的脆弱。它猛地一扑，把你从[feet]上撞倒，让你仰面朝天。[pg]");
            }
            get_images().showImage("hellhound-wormix");
            outputText("野兽在你的下体嗅了嗅，然后退了回去，看起来有些困惑。你低头一看，才意识到自己已经硬得不行了。几条蠕虫从你的[cock]的" + get_player().cockHead() + "处挂了下来，开始源源不断地流出。这种感觉好得有些不正常。地狱犬移动到你上方，一道阴影笼罩了你，它那两根粗壮的肉棒在你上方坚挺地跳动着。滚烫的精液滴落在你的胸膛上，野兽体内的蠕虫开始逃逸，连带着将浓稠的狗精液也挤了出来。[pg]");
            outputText("在蠕虫的控制下，你和野兽在没有任何外部刺激的情况下开始高潮。蠕虫和精液在你身上混合在一起，慢慢堆积成一个小丘，覆盖了你大半个躯干。精疲力竭的你们虚弱地喷射着，将最后几条最小的蠕虫排入那堆混合物中。当野兽和你躺在一起时，你闭上了眼睛，随着你们新诞生的蠕虫群蠕动着离开，你们俩一起失去了意识。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 0.5;
            get_combat().cleanupAfterCombat();
         }
         else if(!get_player().hasStatusEffect(StatusEffects.Infested) && get_player().biggestCockArea() >= 40 && get_player().hasCock())
         {
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("屈服于这种野兽的耻辱，也无法压倒你下体燃烧的欲望熔炉。");
               if(get_player().cor < 33)
               {
                  outputText("尽管你感到厌恶");
               }
               else if(get_player().cor < 66)
               {
                  outputText("尽管你理智上知道不该这样");
               }
               else
               {
                  outputText("带着一种变态的期待感");
               }
               outputText("你脱下你的[armor]，翻身仰躺，将脆弱的下体暴露在野兽面前。[pg]");
            }
            else
            {
               outputText("你伤得站不起来，为了不让自己倒在地上，你四肢着地。你意识到自己的错误时已经太晚了——那只咆哮的野兽就在你身后，它锋利如鲨的牙齿轻易地咬穿了你的[armor]，然后把它撕扯下来，露出了你的" + get_player().assDescript() + "和[cocks]。一阵寒冷的山风吹过你现在暴露的[skindesc]，提醒你在这个共生怪物的异形欲望面前，你是多么的脆弱。它猛地一扑，把你从[feet]上撞倒，让你仰面朝天。[pg]");
            }
            get_images().showImage("hellhound-infestation");
            if(get_player().totalCocks() > 1)
            {
               outputText("那只被寄生的猎犬调整了姿势，用它黑色的皮毛挡住了阳光，让你只能看到它毛茸茸的阴囊周围环绕的苍白火焰。它光滑舌头带来的温暖湿润感开始滑过");
               outputText("你的每一根[cocks]。这种感觉好得有些不正常。");
               outputText("你的每一根[cocks]都在这刺激下硬了起来，很高兴能得到如此好的待遇。[pg]");
               outputText("野兽停止了舔舐，开始向前挪动，沾满先列腺液的蠕虫从它的双头肉棒上掉落到你的肚子上。它们无力地爬行着，而野兽则努力调整自己的位置，虽然你不确定它到底想瞄准什么。当它那两根肉棒略微尖锐的顶端向前推进，撞击在你阴茎的冠状沟上时，你的疑问得到了解答。它带着一种强烈的谨慎向前推进，慢慢地将自己挤进你的尿道，将滚烫的精液直接滴入你的阴茎通道。[pg]");
               outputText("天哪，它把感染了的肉棒塞进了你的尿道！它想用那些蠕虫感染你！这只恶魔犬不断地向里推进，滑入你的深处，透过你[cocks]的皮肤，可以轻易地看到它肉棒的轮廓。这种感觉开始变得美妙起来，那长满寄生虫的肉棒开始进进出出，认真地操着你的尿道，将它们携带的蠕虫深深地留在你体内。[pg]");
               outputText("你的");
               if(get_player().balls > 0)
               {
                  outputText("[balls]颤抖着，滚烫的狗精液和蠕动的蠕虫被直接泵入其中。");
               }
               else
               {
                  outputText("身体感到不舒服的饱胀，滚烫的狗精液和蠕动的蠕虫被直接泵入你的前列腺。");
               }
               outputText("尽管情况诡异得离谱，但你发现自己竟然因为体内塞满了这么多蠕动的东西而感到兴奋。一个巨大的障碍物顺着你的尿道往下走，它的粗细让你无法释放高潮，但你依然能感受到那种快感和压力。你的身体在野兽身下紧绷、扭动，成为了被迫承受这邪恶快感的无助奴隶。[pg]");
               outputText("在用蠕虫和滚烫的精液填满你之后，这只恶魔犬带着似乎是咧嘴笑的表情退开了，你的尿道被撑开，滴落着白色的蠕动粘液。被推到了忍耐的极限，你开始失去意识，你最后的念头是哀叹自己将成为这些寄生虫的宿主，就像这只恶魔犬一样。");
            }
            else
            {
               outputText("那只被寄生的猎犬调整了姿势，用它黑色的皮毛挡住了阳光，让你只能看到它毛茸茸的阴囊周围环绕的苍白火焰。它光滑舌头带来的温暖湿润感开始滑过");
               outputText("你的[cocks]。感觉很舒服，甚至舒服得有些不合常理。");
               outputText("你的[cocks]在刺激下硬了起来，很享受这种优待。[pg]");
               outputText("野兽停止了舔舐，开始向前挪动，沾满先列腺液的蠕虫从它的双根肉棒里掉落到你的肚子上。它们无力地爬行着，而野兽则努力对准位置，虽然你不知道它到底在瞄准什么。当它那对肉棒中略微尖锐的顶端向前挤压，顶在你的" + get_player().cockHead() + "上时，你的疑问得到了解答。它带着一种强烈的谨慎向前推进，慢慢地强行挤进你的尿道，将滚烫的精液直接滴进你的阴茎通道，并把这些东西滴得你满裆都是。[pg]");
               outputText("天哪，它正把它那根被感染的肉棒塞进你的尿道！它想用那些蠕虫感染你！这只恶魔犬不断地向里推进，滑入你的深处，透过你[cocks]的皮肤可以轻易看到它肉棒的轮廓。感觉开始变得舒服起来，那根爬满寄生虫的肉棒开始进进出出，卖力地操着你的尿道，将它那满载蠕虫的货物卸在你的体内深处。[pg]");
               outputText("你的");
               if(get_player().balls > 0)
               {
                  outputText("[balls]颤抖着，滚烫的狗精和蠕动的虫子被直接泵入了其中。");
               }
               else
               {
                  outputText("身体感到一种不适的饱胀感，滚烫的狗精和蠕动的虫子被直接泵入了你的前列腺。");
               }
               outputText("尽管情况诡异到了极点，你却发现自己因为体内塞满了这么多蠕动的东西而兴奋起来。一个巨大的障碍物正在你的尿道里往下挤，它的粗壮让你无法达到高潮，但你依然能感受到那种快感和压迫感。你的身体在野兽身下紧绷扭动，沦为这被迫承受的邪恶快感的无助奴隶，与此同时，恶魔犬暴露在外的肉棒将一条巨大的蠕虫掉落在了你胯部湿润的水洼中。当你意识到一条类似的蠕虫现在肯定正在你体内钻行时，你感到一阵恐惧。[pg]");
               outputText("在用蠕虫和滚烫的精液填满你之后，这只恶魔犬退了开来，脸上似乎带着一丝狞笑，你的尿道被撑开，滴落着白色蠕动的粘液。被逼到了忍耐的极限，你开始失去意识，最后的念头是在哀叹自己将如何成为这些寄生虫的宿主，就像这只恶魔犬一样。");
            }
            get_player().createStatusEffect(StatusEffects.Infested,0,0,0,0);
            get_player().orgasm("Generic");
            if(get_player().hasPerk(PerkLib.ParasiteMusk))
            {
               outputText("这些极具攻击性的蠕虫显然已经消灭了寄生在你前列腺里的寄生虫。[pg]");
            }
            get_player().removePerk(PerkLib.ParasiteMusk);
            get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
            get_player().removeStatusEffect(StatusEffects.ParasiteSlugReproduction);
            dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
            var _temp_2:* = get_player();
            _temp_2.cumMultiplier = _temp_2.cumMultiplier + 0.2;
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,787) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,787,1);
               if(get_player().cor < 25)
               {
                  get_player().cor = 25;
               }
            }
            get_combat().cleanupAfterCombat();
         }
         else if(get_player().hasVagina() && get_player().biggestCockArea() < 40 && !get_player().hasTailInsteadOfLegs())
         {
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("屈服于这种野兽的耻辱，也无法压倒你下体燃烧的欲望熔炉。");
               if(get_player().cor < 33)
               {
                  outputText("尽管你感到厌恶");
               }
               else if(get_player().cor < 66)
               {
                  outputText("尽管你理智上知道不该这样");
               }
               else
               {
                  outputText("带着一种变态的期待感");
               }
               outputText("你脱下[armor]，四肢着地，模仿着你想象中狗的动作。[pg]");
            }
            else
            {
               outputText("你伤得太重无法站立，只能四肢着地以支撑身体。你意识到自己的错误时已经太晚了——那只咆哮的野兽就在你身后，它那如鲨鱼般锋利的牙齿轻易地咬穿了你的[armor]并将其撕碎，暴露出了你的" + get_player().assDescript() + "和" + get_player().vaginaDescript(0) + "。一阵冰冷的山风吹过你现在暴露在外的[skindesc]，提醒着你，你现在是多么彻底地暴露在这个共生怪物的异种性欲之下。[pg]");
            }
            outputText("地狱犬站了起来，有那么一瞬间看起来几乎是人形，然后它趴下，把爪子搭在你的肩膀上。");
            if(get_player().cor < 66)
            {
               outputText("你乞求道，[say:求求你，不要，不要！我不想让它们……进到我里面！][pg]");
            }
            else
            {
               outputText("你开始乞求它不要把它们放进你体内，但当你意识到它们在你体内蠕动会有多舒服时，你的抗议声便渐渐平息了。[pg]");
            }
            get_images().showImage("hellhound-loss-vag");
            outputText("恶魔犬试图同时插入你的两个洞，但它没有对准，结果只是撞到了你的会阴，并把它的主阴茎在你的阴唇上拖过。你痛苦地喘息着，暂时庆幸没有被这种野兽的器具刺穿，但你也清楚这短暂的喘息很快就会结束。仿佛能读懂你的心思，你身上的野兽调整了姿势，猛地向前一挺，这次成功地将它的两根狗屌对准了你的洞。它们感觉比看起来大得多，突然的胀痛感让你眼含泪水。");
            get_player().cuntChange(get_monster().cockArea(0),true);
            get_player().buttChange(get_monster().cockArea(0),true,false);
            outputText("[pg]难以置信的热量从你体内的两根肉棒中散发出来，让你全身冒冷汗，试图应对这种情况。随着野兽开始认真地操你，你被前后摇晃，它用野兽般的强度将长满毛的臀部撞击在你的" + get_player().assDescript() + "上。谢天谢地，这操弄并不那么痛苦，但这小小的仁慈被你感觉到开始涌入你体内的热液给毁了。[pg]");
            outputText("哦，天哪，不，你能感觉到有什么东西在你体内蠕动！它正在把蠕虫滴进你的肠道和小穴里！它滚烫的唾液滴在你的背上，它又硬又快地发情，喷射并滴落一小部分蠕虫货物到你体内。它们在扭动和蠕动，以一种极其淫秽的方式摩擦着你，尽管你内心深处正在滋生恐惧，但它们还是让你越来越接近高潮。你背上的野兽似乎对这一切都无动于衷，每一次抽插都更加粗暴地推入你的" + get_player().vaginaDescript(0) + "和[asshole]，直到伴随着一阵压力，他成功地同时将他那两根跳动的黑色肉棒插到底。[pg]");
            outputText("这太不对了……但也太火辣了。他正在用它们填满你！这只该死的地狱杂种正在射精，用它的寄生货物塞满你的两个洞！天哪，你体内充满了蠕动的蠕虫，它们在你娇嫩的阴道壁和直肠上扭动和挣扎。你变得越来越饱满，它们在其中游动的精液是如此他妈的烫，几乎要烧伤你。你高潮了，紧紧夹住入侵的阴茎，在痛苦和快感的交织中尖叫，被这种情况的荒谬和快感驱使，超越了理性的思考。[pg]");
            outputText("你再也支撑不住了，瘫倒在地，你的臀部被卡在你孔口里的一对恶魔般的黑色狗屌撑起。它们不断地射精，直到你的身体慢慢滑落到地上。你的眼睛闭上了，被塞满你两个洞的蠕动温暖哄着入睡。");
            if(get_player().hasStatusEffect(StatusEffects.WormPlugged))
            {
               get_player().addStatusValue(StatusEffects.WormPlugged,1,1 + Utils.rand(5));
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.WormPlugged,1 + Utils.rand(5),0,0,0);
            }
            get_player().knockUp(33,int(100 + get_player().statusEffectv1(StatusEffects.WormPlugged)),100,1);
            get_player().orgasm("VaginalAndAnal");
            dynStats(DynStat.Lib(1),DynStat.Cor(1));
            get_combat().cleanupAfterCombat();
         }
         else
         {
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("屈服于这种野兽的耻辱，也无法压倒你下体燃烧的欲望熔炉。");
               if(get_player().cor < 33)
               {
                  outputText("尽管你感到厌恶");
               }
               else if(get_player().cor < 66)
               {
                  outputText("尽管你理智上知道不该这样");
               }
               else
               {
                  outputText("带着一种变态的期待感");
               }
               outputText("你脱下你的[armor]，手肘撑地，模仿你认为狗会做的动作。[pg]");
            }
            else
            {
               outputText("你伤得太重站不起来，只好手肘撑地，以免趴在地上。你意识到自己的错误时已经太晚了——那只咆哮的野兽就在你身后，它那剃刀般锋利的牙齿轻松地咬穿了你的[armor]，然后将其撕下，露出了你的" + get_player().assDescript() + "。一阵冰冷的山风吹过你现在暴露在外的[skindesc]，提醒你，你现在完全暴露在这个共生怪物的异类欲望之下。[pg]");
            }
            outputText("地狱犬站了起来，有那么一瞬间看起来几乎是人形，然后它趴下，把爪子搭在你的肩膀上。");
            if(get_player().cor < 80)
            {
               outputText("你乞求道，[say: 求求你，不，不！我不想让它……进到我里面！][pg]");
            }
            else
            {
               outputText("你开始乞求它不要把它放进你体内，但当你意识到它们在你体内蠕动会有多舒服时，你的抗议声就变小了。[pg]");
            }
            get_images().showImage("hellhound-loss-butt");
            outputText("恶魔犬试图一次性插入你，但它没有对准，结果只是撞到了你的会阴，并把它的另一根阴茎在你的背上摩擦。你痛苦地喘息着，暂时庆幸没有被这种野兽的器具刺穿，但你也清楚这短暂的喘息很快就会结束。仿佛能读懂你的心思，恶魔犬调整了姿势，猛地向前一挺，这次成功地将它的狗屌对准了你的[asshole]。它感觉比看起来大得多，突然的胀痛感让你眼含泪水。");
            get_player().buttChange(get_monster().cockArea(0),true);
            outputText("[pg]难以置信的热量从你体内粗大的黑色肉棒中散发出来，让你全身冒冷汗，试图应对这种情况。随着野兽开始认真地操你，你被前后摇晃，它用野兽般的强度将长满毛的臀部撞击在你的" + get_player().assDescript() + "上。谢天谢地，这操弄并不那么痛苦，但这小小的仁慈被你感觉到开始涌入你[asshole]和背上的热液给毁了。[pg]");
            outputText("哦，天哪，不，你能感觉到有什么东西在你体内蠕动！它正在把蠕虫滴进你的肠道里！它滚烫的唾液和狗精滴在你的背上，它又硬又快地发情，喷射并滴落一小部分蠕虫货物到你体内。它们在扭动和蠕动，以一种极其淫秽的方式摩擦着你，尽管你内心深处正在滋生恐惧，但它们还是让你越来越接近高潮。你背上的野兽似乎对这一切都无动于衷，每一次抽插都更加粗暴地推入你的[asshole]，直到伴随着一阵压力，他成功地将他那根跳动的黑色肉棒插到底。[pg]");
            outputText("这太不对了……但也太火辣了。他正在用它们填满你！这只该死的地狱杂种正在射精，用它的寄生货物塞满你的洞，同时在你的背上涂抹更多的寄生虫！天哪，你体内充满了蠕动的蠕虫，它们在你的直肠上扭动和挣扎。你变得越来越饱满，它们在其中游动的精液是如此他妈的烫，几乎要烧伤你。你高潮了，紧紧夹住入侵的阴茎，在痛苦和快感的交织中尖叫，被这种情况的荒谬和快感驱使，超越了理性的思考。[pg]");
            outputText("你再也支撑不住了，瘫倒在地，你的臀部被卡在你孔口里的恶魔般的黑色狗屌撑起。它们不断地射精，直到你的身体慢慢滑落到地上。你的眼睛闭上了，被塞满你[asshole]和覆盖你背部的蠕动温暖哄着入睡。");
            get_player().orgasm("Anal");
            dynStats(DynStat.Lib(1),DynStat.Cor(1));
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function infestedHellhoundEncounter() : void
      {
         clearOutput();
         get_images().showImage("monster-infestedhellhound");
         outputText("一声低沉的咆哮震动着你的身体，");
         if(get_player().lowerBody.type == 8)
         {
            outputText("让你果冻般的身体随之颤动");
         }
         else
         {
            outputText("让你的牙齿打颤");
         }
         outputText("。你恐惧地越过肩膀偷看，只见一只长着黑毛的地狱犬从岩石后现身。它的眼睛眯了起来，目光锁定了你的[assholeorpussy]，一对黑亮发光的狗肉棒从它身下探出，自由地晃荡着。它的蛋蛋看起来肿胀不堪，周围的皮肤还在蠕动爬行。几条蠕虫从它那硕大的鸡巴上滴落，在这只被感染的野兽身下的地面上爬行着。[pg]");
         outputText("不知为何，你知道这东西不会让你就这么走掉。");
         unlockCodexEntry(2043);
         startCombat(new InfestedHellhound());
         spriteSelect(SpriteDb.get_s_hellhound());
      }
   }
}

