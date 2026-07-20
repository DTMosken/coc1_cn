package classes.scenes.npcs
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.lake.GooGirl;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Valeria extends NPCAwareContent implements TimeAwareInterface
   {
      
      public static var GOOSTUFFED_EFFECT_MIN_DURATION:int = 10;
      
      public static var GOOSTUFFED_EFFECT_MAX_DURATION_DELTA:int = 300;
      
      public static var GOOSTUFFED_PREGNANCY_DURATION:int = 2147483647;
      
      public function Valeria()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function valeriaSpar() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         outputText("你问瓦莱丽娅是否愿意进行一点战斗练习。");
         outputText("[pg][say: 嘿，那太好了，搭档。毕竟如果我们想有机会对抗恶魔，就必须保持我们的技能敏锐！来吧。]");
         outputText("[pg]你把瓦莱丽娅带到营地边缘，准备好你的[weapon]，而她则在手中形成了一把黏液巨剑。");
         startCombat(new GooArmor());
         get_monster().createStatusEffect(StatusEffects.Spar,0,0,0,0);
         get_monster().set_gems(0);
      }
      
      public function valeriaSexDominated(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         get_images().showImage("valeria-sex-domination");
         outputText("你故意装作犹豫和紧张的样子，告诉瓦莱丽娅你希望她来主导。一个灿烂的笑容迅速在她少女般的脸庞上蔓延开来。[say: 嗯，今天想当受了，搭档？很好，很好……你就让瓦莱丽娅好好照顾你吧，" + get_player().mf("handsome","cutie") + "。]");
         outputText("[pg]瓦莱丽娅性感地扭动着臀部，拉近了你们之间的距离，将她的嘴唇贴在你的嘴唇上。她的一只手臂轻松地搂住你的脖子，把你拉近她，另一只手则像蛇一样钻进你的衣服里，挑逗和抚摸着你的大腿内侧。突然，瓦莱丽娅粗暴地推了你一把，把你推倒在地。她居高临下地看着你，舔了舔嘴唇，把她那黏糊糊的一只脚牢牢地踩在你的胸口。黏液从她的脚跟渗出，滑出来绑住你的手臂和[legs]，同时包裹住你的躯干。");
         outputText("[pg][say: 躺下乖乖顺从吧，搭档。这样会更好……]");
         if(get_player().hasVagina() && (!get_player().hasCock() || Utils.rand(2) == 0))
         {
            outputText("[pg]瓦莱丽娅开始用她的黏黏剥去你的衣服，很快就露出了你毫无防备的[vagina]。她故意舔了舔嘴唇，黏黏的触手渗入你的小穴，将你完全填满。你温顺地屈服于你那黏糊糊的俘获者，任由瓦莱丽娅对你为所欲为。看到你没有反抗，她微笑着，温柔地说你真是个好[boy]，同时慢慢地将自己从你的[vagina]中抽出。");
            outputText("[pg]你只有片刻的时间来弄清楚接下来会发生什么，然后她的黏黏——现在已经完美地塑造成了你小穴内部的形状——像一根坚硬的肉棒一样猛地插回你体内。你情不自禁地从嘴唇间溢出一声呻吟，在覆盖着你嘴巴的黏液中几乎听不见。");
            get_player().cuntChange(get_player().vaginalCapacity(),true,true,false);
            outputText("[pg][say: 哦，你喜欢这样，是吗？]盔甲史莱姆邪恶地笑着问。[say: 嗯，也许如果你是个好[boy]，我也会让你高潮的。]她仍然咧着嘴笑，开始用她那像肉棒一样的附肢猛烈地抽插你的小穴，用她的黏黏假阳具快速而用力地操你。");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("当她猛烈抽插你的小穴时，她的一些黏黏在你的[chest]周围盘旋，挤压和按摩着你的乳房。当她粗暴地挑逗你的乳房，捏着你的乳头，粗暴地挤压你娇嫩的肉体时，你扭动着身体。");
               if(get_player().lactationQ() > 0)
               {
                  outputText("令她高兴的是，一股温热的乳汁从你酸痛的乳头喷射而出，乳白色像油入水一样混入蓝色的黏黏中。[say: 嗯，真好吃！]她戏弄着，从你身上按摩出越来越多的乳汁。");
               }
            }
            outputText("[pg]她继续无情地捣着你的小穴，当你的汁液开始流出并融入她那黏糊糊的插入物时，她的笑容咧到了非人的宽度。她贪婪地吸收着你的女性润滑液，享受着这顿美餐，但她的抽插是无情的，直到你感觉到高潮即将来临。[saystart]哦，");
            if(get_player().get_tallness() > 60)
            {
               outputText("大");
            }
            else
            {
               outputText("小");
            }
            outputText("[boy]准备好高潮了吗？[sayend]她从你体内抽出，让你突然感到非常非常空虚。[say: 我还没说你可以高潮呢，荡妇！我还没玩够你呢。]");
            outputText("[pg]当瓦莱丽娅从你全身撤去黏黏时，你紧张地咽了口唾沫，除了她绑在你手腕上的束缚外，你一丝不挂。她粗暴地抓住你的[hips]把你翻过来，强迫你跪下。她咧着嘴笑，抓住你的头发，把你的脸按在泥土里，把你的脸颊在坚硬的地面上摩擦，同时她的臀部压在你的[butt]上。你感觉到一根温暖、光滑的肉棒扑通一声掉进你的屁股沟里，在它们之间摩擦；另一根跳了起来，缠绕着你，戳着你[vagina]的入口。");
            outputText("[pg]当瓦莱丽娅插入你体内时，你只能咬紧牙关，她倾身向前，将她的双头龙滑入你的小穴和屁眼，多亏了她黏糊糊的本性，没有遇到任何阻力");
            if(get_player().vaginalCapacity() > 80 || get_player().analCapacity() > 80)
            {
               outputText("以及你自己的接受能力");
            }
            outputText("。史莱姆娘从背后抱住你，抓住你的[chest]，揉捏着你的乳房，掐着你的乳头。[say: 给我叫，婊子，]瓦莱丽娅在你耳边低吼，特别用力地扯了一下你的[nipples]。你发出一声淫荡的呻吟。史莱姆娘咧嘴一笑，舌头伸出来舔你的耳朵，同时奖励你一次长长的深入，完全填满并撑开你的[vagina]和[asshole]，然后才拔出来。");
            outputText("[pg][say: 怎么？]她质问道，她的肉棒在你的洞口完全静止。[say: 在我让你高潮之前不准停止呻吟，听到了吗？]");
            outputText("[pg]你发出一声呜咽的呻吟，瓦莱丽娅立刻又猛地撞进你体内。你的呻吟变成了欢愉的尖叫，但你顺从地按照瓦莱丽娅的命令，在她拔出时呻吟。她又猛地插进你体内，把你撑得非常舒服。你陷入了快乐的节奏，在瓦莱丽娅粗暴地操你时呻吟喘息，用她的黏液塞满你的两个洞，蹂躏你的乳房，直到你的大脑被快感弄得一片模糊。");
            outputText("[pg][say: 来了……]瓦莱丽娅咕哝着，[say: 现在你可以高潮了。来吧，小婊子。喂饱我。]");
            outputText("[pg]你在她的命令下高潮了，淫液从你的[vagina]喷涌而出，流进塞在你小穴里的黏液肉棒里。你的两个洞都紧紧地收缩，夹紧了瓦莱丽娅的肉棒。史莱姆娘大笑着吸收你的淫液，随着你的喂食，她变得越来越大，直到她高高地耸立在你上方，她巨大的肉棒现在痛苦地撑开你的肉壁。[say: 哦，太棒了。好女孩，真乖。对，全射出来，就像这样……就像这样，]她轻声哄着，吸收着你的汁液，直到你的高潮终于过去。满足后，她从你体内拔出，让你站起来时，你的肚子里留下了一种明显的空虚感。");
            outputText("[pg][say: 嗯，不错嘛，搭档，]瓦莱丽娅拍着她饱满的肚子说道。你可以看到一点你的淫液");
            if(get_player().lactationQ() > 0)
            {
               outputText("和乳汁");
            }
            outputText("在她体内旋转。[say: 我们下次再来，]她补充道，眨了眨眼，走向营地的另一边。");
         }
         else
         {
            outputText("[pg]瓦莱丽娅开始用她的黏液剥去你的衣服，很快就露出了你毫无防备、半勃起的阴茎。她夸张地舔了舔嘴唇，黏液触手像温暖湿润的飞机杯一样紧紧缠绕住[eachCock]。你屈服于黏液的束缚，看到你没有反抗，瓦莱丽娅低头对你微笑，把你的[cocks]捏得更紧了。");
            outputText("[pg]当她开始抚弄[eachCock]时，你舒服地喘着气。她居高临下地看着你，邪恶地笑着，给你打飞机。[say: 哦，你喜欢这样，是吗？]盔甲史莱姆问道。[say: 那么，我也许会让你也爽一下……如果你是个乖[boy]的话。]她开始加快节奏，在你被她撸[cocks]时，你扭动挣扎着。她舔了舔嘴唇，看着小小的先列腺液气泡开始形成。");
            outputText("[pg]无助的你只能屈服，努力享受盔甲史莱姆继续榨取你的过程。她毫不留情地给你打飞机，当你的先列腺液开始流淌并进入她黏糊糊的“手”中时，她的笑容咧到了非人的宽度。她贪婪地吸收着你的先列腺液，享受着这顿美餐，但她的动作却毫不留情，直到你感觉到高潮逼近。[saystart]哦，");
            if(get_player().get_tallness() > 60)
            {
               outputText("大");
            }
            else
            {
               outputText("小");
            }
            outputText("[boy]准备好高潮了吗？那就来吧——我们还有时间再来一次。[sayend]");
            outputText("[pg]你高潮了，浓稠白色的精液从你的肉棒喷射而出，射进史莱姆娘等待的身体里。史莱姆娘大笑着吸收你的精液，随着你的喂食，她变得越来越大，直到她高高地耸立在你上方，她膨胀的乳房和肚子现在悬在你上方。[say: 哦，太棒了。好[boy]，真乖。对，全射出来，就像这样……就像这样，]她轻声哄着，吸收着你的精液，直到你的高潮终于过去。");
            outputText("[pg]然而，在你还能清醒思考之前，瓦莱丽娅就扑到了你身上，把自己插在[oneCock]上。当她包裹住你过度敏感的肉体，抚弄拉扯你的肉棒，强迫它在你的高潮后保持坚挺时，你尖叫起来。瓦莱丽娅跨坐在你无助的身体上，开始摇晃她的臀部，操弄你疲软的肉棒。");
            outputText("[pg][say: 怎么，你以为我吃了一口就会放过这么美味的点心吗？哦，不。不可能。]");
            outputText("[pg]当瓦莱丽娅在你的肉棒上转过身，用你的[feet]支撑自己时，你睁大了眼睛。现在瓦莱丽娅以反向女上位骑着你，抓住你的手放在她翘挺的臀部上，命令你在她第二次榨取你时玩弄她。你按照她的命令去做，手指陷入她黏糊糊的肉体中，直到女孩发出一声尖锐、愉悦的喘息。但你只能勉强集中注意力在你的任务上，你的大部分心思都锁定在埋在瓦莱丽娅体内的疲惫肉棒上。你可以透过她充满精液的身体看到你的[cock]，随着她的弹跳在她体内无力地上下摆动。");
            outputText("[pg]史莱姆娘用力地骑着你，在你的肉棒上弹跳，直到你的臀部和大腿上溅满了散落的黏液和精液。你不得不佩服她——在她粗暴的服侍下，你无法保持疲软，没过多久你就又硬如磐石了。瓦莱丽娅回头对你咧嘴一笑，但一刻也没有放松。你可以感觉到你的高潮再次升起，但就在你的肉棒开始跳动时，瓦莱丽娅以一个快速流畅的动作把自己从你身上抬起，留下你在空中无力地挺动臀部。由于你的双手被黏液牢牢束缚，你无法释放自己。");
            outputText("[pg][say: 哦，这么快就准备好再次高潮了吗？]她轻声哄着，双手牢牢地放在她宽大的臀部上，居高临下地看着你。[say: 但我还没说你可以高潮呢，小婊子。也许如果你求我，]她补充道，用她的大脚趾轻轻敲打你的[cock]，让狂喜的颤栗传遍你的脊背，[say: 也许那样我会让你高潮。]");
            outputText("[pg]绝望之下，你恳求瓦莱丽娅让你射出来。她咧嘴笑了笑，但什么也没做。你大声呼喊她的名字，求她帮你。你的爱人只做了最轻微的动作，用脚底在你的肉棒底部轻轻弹了一下。你感觉自己快要晕过去了。");
            outputText("[pg][say: 再说一次，荡妇，]她命令道，一动不动。[say: 求我。]");
            outputText("[pg]你求她了。你比世界上任何事情都想要它。只要你能射出来，恶魔把这个世界拿走都行！");
            outputText("[pg]瓦莱丽娅仰起头大笑，将你的肉棒没入她黏糊糊的脚中。包裹着你的紧致湿润的穴口实在太棒了，让人无法抗拒。你舒服地大叫着射了出来，看着浓稠的滚烫白浊喷射进瓦莱丽娅的腿里，与她体内已经四处飘荡的体液混合在一起。随着体液的涌入和你突然插入她的脚穴，瓦莱丽娅的笑声变成了狂喜的半哭泣声，这让她兴奋不已，黏糊糊的身体也随之颤抖起来。");
            outputText("[pg][say: 哦，太棒了……好[boy]，好。对，全都射出来，就像这样……就像这样，]她呻吟着，吸收着你的汁液，直到你的高潮终于过去。满足后，她从你的脚周围退开，留你在地上颤抖成一团。");
            outputText("[pg][say: 嗯，不错嘛，搭档，]瓦莱丽娅拍着圆鼓鼓的肚子说道。你可以看到一点你的精液在她体内打转。[say: 我们改天再来，]她补充道，眨了眨眼，走向营地的另一个地方。");
         }
         get_player().HPChange(25 + get_player().newGamePlusMod() * 15,false);
         feedValeria(Math.sqrt(get_player().cumQ()) + 5 + get_player().averageVaginalWetness() * 5);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         if(param1 || !get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function valeriaGooRapeII() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("刚才撞到你的那个肿块又一次撞上了");
         if(get_player().biggestTitSize() >= 3)
         {
            outputText("你乳沟的深谷");
         }
         else
         {
            outputText("你的胸部");
         }
         outputText("，这次你眼角余光瞥见了它。那是史莱姆娘的核心，被一只深蓝色的拳头紧紧握住。它被举在你面前时，发出微弱的脉动，而微妙的震动和温度变化提醒你，这两个女人之间正在进行某种秘密交流。她们到底在计划什么？");
         outputText("[pg]你得到了答案，那是一种突然的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1020) == 0)
         {
            outputText("、意想不到的");
         }
         else
         {
            outputText("却又是意料之中");
         }
         outputText("你的[asshole]感受到了压力。它是如此……如此滑腻，以至于你不得不怀疑它们是如何能够如此权威地推挤你最后面的孔洞，但它们还是做到了。你紧紧夹住以拒绝它们进入，把你的括约肌收得比锁上的门还紧。瓦莱丽娅咯咯笑的声音从下面某处传来，[say: 哦，别扫兴嘛。来吧，会很有趣的。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1020) == 0)
         {
            outputText("[pg]不管怎样，你还是紧紧夹住，至少直到她猛地掰开你的臀瓣，扭动着她试图塞进你体内的东西，用一种柔软的、有机的、类似肛门钻探的方式慢慢撑开你。");
         }
         else
         {
            outputText("你紧紧夹住，保持着你那虚假的抵抗，直到她猛地掰开你的臀瓣，把她那黏糊糊的扩孔工具扭成一个穿透括约肌的钻头。");
         }
         outputText("旋转得越来越快，那根入侵的圆柱形黏液在四五秒内就把你的[asshole]扩张到了最大，它的外部硬化成了一根塞满屁股的黏液管。你能感觉到它在你的肠道里蜿蜒前行，深入到你以前认为不可能的深度，然后停在了感觉像是大肠一半的地方。");
         get_player().buttChange(get_player().analCapacity() * 0.75,true,true,false);
         if(!get_player().isPregnant() && get_player().hasVagina())
         {
            if(get_silly())
            {
               outputText("[pg][say: 等等，还有更多！] 比利·梅斯宣布道。");
            }
            outputText("[pg]不久之后，一团同样大小的半液体物质在你的[vagina]上摩擦，拂开瓦莱丽娅羽毛般的挑逗，撑开你的阴唇包住那滑溜溜的气泡，让阵阵快感传遍你的全身。你试图移动，去摩擦那个乱糟糟的入侵者，但被束缚着的你，只能在束缚中颤抖，在任何旁观者都能看出的快感中震颤。这种插入也没有停止瓦莱丽娅的挑逗。这位才华横溢的女人继续在你的生殖器外部进行羽毛般的爱抚，同时把你撑得像你接受过的任何阴茎一样宽，直接挖出一条通向你子宫颈的隧道。");
            get_player().cuntChange(get_player().vaginalCapacity() * 0.75,true,true,false);
            outputText("[pg]在那里，蔚蓝色的柱体用力撞击着你子宫那狭窄的开口，用坚定的压力推挤着，直到一些黏液滚入你空荡荡的孕育室。你忍不住对这种极其彻底的双重填塞感大叫出声。你皱着眉头，忍受着内部通道被缓慢拉伸的感觉，一旦那钻洞的黏液在你子宫里建立了一条足够大的通道，外部就会像你屁股里的那个一样凝固。你的[clit]上开始产生吸力，以分散你对这感觉的注意力，而它的成功证明就是你的[vagina]喂给这些混合史莱姆娘的大量淫水。");
         }
         if(get_player().hasFuckableNipples() && get_player().biggestTitSize() >= 5)
         {
            outputText("[pg]你的[fullChest]被感觉像是瓦莱丽娅的手粗暴地挤压和抚摸着，被推到一起又拉开。有时她们甚至会拉扯它们，用力吸吮你的乳房，让它们暂时看起来更大。无论如何，那淫荡的爱抚总是会回到你的[nipples]上，挤压和拉扯着它们，直到你的欲望让它们变得像");
            if(get_player().hasVagina())
            {
               outputText("你的小穴一样湿润且汁液横流");
            }
            else
            {
               outputText("最淫荡的荡妇的小穴一样湿润且汁液横流");
            }
            outputText("。瓦莱丽娅把这当成了邀请，" + Utils.num2Text(get_player().totalNipples()) + " 个阴茎状的物体贪婪地推挤着你的乳头穴，急切地滑入你那欢迎它们的胸部小穴。低头看去，你可以看到那些阴茎状触手的深蓝色轮廓在它们深入时挥舞和扭动，将自己深深埋入那充满幸福的温暖之中。");
         }
         if(get_player().hasCock())
         {
            outputText("[pg]瓦莱丽娅的声音再次响起，[saystart]你不会以为我忘了");
            if(get_player().cockTotal() == 1)
            {
               outputText("这个小家伙");
            }
            else
            {
               outputText("这些小家伙");
            }
            outputText("了吧？");
            if(get_player().biggestCockArea() >= 50)
            {
               outputText("……也许大家伙更合适一点。随便啦。");
            }
            outputText("我只是把最好的留到最后。抓紧了，小老虎。[sayend]");
            outputText("[pg]包裹着[eachCock]的黏糊糊的狂喜套筒稍微收紧了一点，以固定住你那抽搐着、狂喜的勃起");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("，而比那滑溜溜的容器还要温暖的东西");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("推挤着你的龟头");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("，在你的尿道口打转");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("。你不经意间收紧了肌肉，让你的[cocks]变得异常肿胀，这反倒让这个凝胶恶魔更容易对你的马眼为所欲为");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("。你感觉到那温暖湿润的液体慢慢地将其剥开并推入其中。这完全不疼，但你的[cocks]被这样慢慢塞满感觉有点奇怪。那股暖流顺着你的阴茎一路向下");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("到达你的身体中段，你能感觉到它又往下走了一点，最后停在你的[balls]处。");
         }
         outputText("[pg]这个蓝宝石般的荡妇咯咯地笑着，做了一些动作，让包裹着你身体的球体微微颤动和收缩。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1020) > 0)
         {
            outputText("你满怀期待地咧嘴笑着，等待着你深知即将到来的液体洪流。不会太久的……你首先在屁股里感觉到了它。");
         }
         else
         {
            outputText("起初，你并没有意识到那是什么。你现在正处于一种性爱的迷茫中，几乎无法思考正在发生的事情，但无论那是什么，感觉都相当不错。你后庭蔓延的灼热感最终让你明白了正在发生什么。");
         }
         outputText("深深地泵入你的肠道，那根坚硬的突起物不再仅仅是塞满你。它正在将一些光滑、湿润、哦，如此粘稠的东西直接泵入你的[asshole]，以一种如此奇怪的方式填满你，除了……被这样塞满感觉有多好之外，你不知道该怎么想。");
         if(get_player().hasVagina())
         {
            outputText("[pg]天哪，这太棒了！你颤抖着，因为你小穴里的管子紧随那个痴迷于肛门的填臀器，将浓稠的凝胶状物质射入你张开的、易于接受的子宫中。你能感觉到渗出物的隆起使半固体的管子在你的通道中膨胀，在通过时按摩你的阴道壁和子宫颈。它们以一种迫使你脸颊泛起幸福的母性光辉的方式滚入你迅速被填满的子宫，让你的肚子圆润了不少。你神魂颠倒，");
            if(get_player().wetness() <= 2)
            {
               outputText("渗出");
            }
            else if(get_player().wetness() <= 3)
            {
               outputText("滴落");
            }
            else
            {
               outputText("喷射");
            }
            outputText("着你的淫水，在狂热的狂喜释放中，一次又一次地在这种变态的、双重的史莱姆膨胀中达到高潮。");
         }
         if(get_player().hasFuckableNipples() && get_player().biggestTitSize() >= 5)
         {
            outputText("[pg]你的乳房很快也经历了类似的事情，触手般的阴茎抽搐并喷射，将浓稠的滚烫物质直接射入你的乳房。你没有感觉到大量的粘液从你的入口流出，你只是变得越来越饱满，直到你看到你");
            if(get_player().bRows() > 1)
            {
               outputText("最上面一排乳房");
            }
            else
            {
               outputText("乳房");
            }
            outputText("的曲线从你的身体上拉开，在几秒钟内罩杯变大，你的皮肤在湿润的洪流下被拉紧。你的乳穴因喜悦而颤抖，除了淫秽的、不断增长的快感之外什么也感觉不到，直到它们紧紧挤压着那些湿滑的触手阴茎，榨取它们让它们射得更猛更快，这反过来又将你狂喜的乳房膨胀成幸福的、肿胀的球体。");
         }
         if(get_player().hasCock())
         {
            outputText("[pg]密封的、塞住阴茎的管子");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("在[eachCock]中");
            if(get_player().totalCocks() > 1)
            {
               outputText("没有");
            }
            else
            {
               outputText("并没有");
            }
            outputText("与瓦莱丽娅其他的液体服务有太大区别。");
            if(get_player().totalCocks() > 1)
            {
               outputText("它们开始");
            }
            else
            {
               outputText("它开始");
            }
            outputText("变厚，将你的精管撑得");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("像");
            if(get_player().totalCocks() > 1)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("在不引起疼痛的情况下所能达到的最宽程度一样，然后将浓稠的胶状物质滚入你的尿道");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("");
            outputText("。套管");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("挤压");
            if(get_player().totalCocks() == 1)
            {
               outputText("");
            }
            outputText("着你的长度");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("更用力了，开始以阴道不可能做到的方式滑动，你发现自己无可奈何地将精液直接射入阴茎结中");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("，喷射出的快感甚至无法从你的下体逃脱。你感觉到");
            if(get_player().balls == 0)
            {
               outputText("当你高潮时，有什么东西在膨胀，充满了精液或黏液，或者是两者的混合物");
            }
            else
            {
               outputText("你的[balls]在你高潮时膨胀，充满了精液或黏液，或者是两者的混合物，让你的阴囊越来越沉重。当你被完全填满时，温柔的舌头舔舐着表面");
            }
            outputText("。");
         }
         outputText("[pg]你在狂喜中呜咽，随着每一次填满屁股的抽插而呻吟，让你的注意力集中在被填满的感觉上。囚禁你的球体慢慢失去凝聚力，让你本能地揉搓你不断膨胀的肚子");
         if(get_player().biggestTitSize() >= 5 && get_player().hasFuckableNipples())
         {
            outputText("，停下来抚摸你沉甸甸、肿胀的乳房");
         }
         outputText("，随着瓦莱丽娅的形状逐渐在你周围重新凝聚，你呻吟着。史莱姆娘的核心从视线中消失，然后出现在南边，紧贴着你的[asshole]，因为把你填得满满的“管子”融化成了黏液。当它滑过你的括约肌时，你在肛门的狂喜中尖叫，牢牢地卡在你的屁股里，而里面的胶状块在抽搐，以所有正确的方式摩擦着你的肠壁，几乎就像它自己在经历高潮一样。");
         outputText("[pg]你在地上摇晃扭动，在高潮中挣扎，直到填满你身体的黏液稳定下来，让你能够评估自己的状况。瓦莱丽娅回到了原位，形成了她通常的保护层。");
         if(get_player().biggestTitSize() >= 5 && get_player().hasFuckableNipples())
         {
            _loc1_ = 0;
            while(_loc1_ < get_player().bRows())
            {
               var _temp_1:* = get_player().breastRows[_loc1_];
               _temp_1.breastRating = _temp_1.breastRating + (3 + Utils.rand(3));
               _loc1_++;
            }
            outputText("你的乳房变得更大了，至少有[breastcup]那么大。");
            get_player().orgasm("Tits",false);
         }
         if(get_player().hasCock() && get_player().balls > 0)
         {
            var _temp_2:* = get_player();
            _temp_2.ballSize = _temp_2.ballSize + (3 + Utils.rand(2));
            outputText("你的睾丸看起来肿胀得厉害，充满了淫液。");
         }
         outputText("你的肚子被塞得像个孕妇的滑稽模仿");
         if(get_player().hasVagina())
         {
            outputText("，两个洞都塞得如此饱满，即使是真正的母亲也会为你这淫猥的“怀孕”感到自愧不如。");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg]你摇摇晃晃地站起来，用你的[legs]蹒跚着走回营地，想知道你要带着这“两个人”的重量走多久……");
         get_player().refillHunger(100);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1020,FlagDict_Impl_.arrayReadInt(_loc2_,1020) + 1);
         get_player().orgasm("Anal");
         get_player().createStatusEffect(StatusEffects.GooStuffed,10 + Utils.rand(300),0,0,0);
         get_player().buttKnockUpForce(32,Valeria.GOOSTUFFED_PREGNANCY_DURATION);
         if(get_player().hasVagina())
         {
            get_player().changeStatusValue(StatusEffects.GooStuffed,3,1);
            get_player().knockUpForce(32,Valeria.GOOSTUFFED_PREGNANCY_DURATION);
         }
         if(get_player().hasCock())
         {
            if(get_player().balls > 0)
            {
               get_player().changeStatusValue(StatusEffects.GooStuffed,2,2);
            }
            else
            {
               get_player().changeStatusValue(StatusEffects.GooStuffed,2,1);
            }
         }
         if(get_player().biggestTitSize() >= 5 && get_player().hasFuckableNipples())
         {
            get_player().changeStatusValue(StatusEffects.GooStuffed,4,1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function valeriaGetFucked() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         get_images().showImage("valeria-sex-getfucked");
         outputText("你脱下衣服，");
         if(get_player().hasVagina())
         {
            outputText("抚摸着你[vagina]湿滑的阴唇，要求瓦莱丽娅操你。");
         }
         else
         {
            outputText("摆出诱人的姿势，要求瓦莱丽娅操你。");
         }
         outputText("[pg]她咧嘴一笑。[say:你就尽管躺下，一切都交给我吧，搭档。]你照她的话做，仰面躺倒");
         if(get_player().isBiped())
         {
            outputText("并张开你的双腿");
         }
         outputText("这时瓦莱丽娅");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,499) == 0)
         {
            outputText("凝聚出一根粗大黏糊的肉棒");
         }
         else
         {
            outputText("抓住她那根粗大黏糊的肉棒");
         }
         outputText("，并笼罩在你上方。");
         outputText("[pg]出乎意料的是，她跪在你的肩膀上，让她的阴茎翻转到你的下巴上。[say: 好了，准备一下。来吧。]");
         outputText("[pg]你刚想提醒她，她已经够湿了，但你一开口，她就把阴茎塞了进来。你扭动着身体咕哝着，但瓦莱丽娅只是抓住你的肩膀，把更多的她塞进你的嘴里，直到她黏糊糊的阴茎顺着你的喉咙流下去。你觉得反抗也没用，于是开始深喉她的阴茎，头部前后抽动，直到嘴唇贴在她的腹股沟上。由于它柔软可塑，你完全吞下她的肉棒没有任何问题，甚至还能用舌头刺穿它的底部，吸吮瓦莱丽娅阴茎的内部；你入侵的舌头因她柑橘般的味道而感到刺痛。");
         outputText("[pg]当你为她口交时，瓦莱丽娅发出一声长长低沉的呻吟，她的手穿过你的[hair]，催促你继续。你继续了几分钟，慢慢地让滑溜溜的阴茎在你的喉咙里进进出出，直到她最终把你的头推开并抽出身子，已经因为快感而喘息起来。[say: 够了，[name]。我想，是时候进入正戏了。]");
         outputText("[pg]她黏糊糊的阴茎顶端从你被充分使用的嘴里滑出，把粘稠的柑橘味残留物留在你的嘴唇上。瓦莱丽娅沿着你的胸部向后滑，");
         if(get_player().biggestTitSize() > 3)
         {
            outputText("撞过你的[chest]，停顿了片刻，用她黏糊糊的臀部逗弄你敏感的乳房，然后");
         }
         outputText("停在你的胯部上方。她把自己倾泻在你的腿上，");
         if(get_player().hasCock())
         {
            outputText("当她顺着你的肚子滑下时，她黏糊糊的屁股吞噬了你的[cock]");
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("并且");
         }
         if(get_player().hasVagina())
         {
            outputText("让她黏液身体的一部分滑入你湿润、等待着的[vagina]，极其轻微地剥开你的肉壁");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("用她的阴茎小心翼翼地、挑逗地戳着你的[asshole]");
         }
         outputText("。");
         outputText("[pg]她在你的腿上向后摇晃，把手臂贴在你的[legs]上作为支撑，同时把腿搭在你的肩膀上。她抓住自己的阴茎，性感地抚摸着");
         if(get_player().hasCock())
         {
            outputText("，同时她有节奏地收缩着臀部肌肉，在她的体内让流体在你的肉棒周围变移，感觉就像涂满乳液的手在温柔地抚摸你");
         }
         outputText("。");
         if(!get_player().hasCock() && get_player().hasVagina())
         {
            outputText("[pg]瓦莱丽娅对你微微一笑，仍然抓着她的阴茎，开始把它向下推。她的肉棒顺着她的身体向下滑动，这种方式只有史莱姆娘的附肢才能做到，它的根部顺着她的腹股沟向下移动，直到她的肉棒湿漉漉地落在你[vagina]的阴唇上。虽然她的阴茎整齐地停留在你的入口上方，但瓦莱丽娅只是对你微微一笑，再次向下推。她黏糊糊的阴茎向内折叠，用黏液涂满你的阴唇，她实际上把自己倾泻进你的体内，重组她的阴茎，完美地填满你渴望的[vagina]的每一个缝隙。");
            outputText("[pg]瓦莱丽娅坐在你的腿上，看似一动不动，但你能感觉到她的阴茎在你的阴户里进进出出，像任何坚硬的肉棒一样又快又狠地操你。当瓦莱丽娅完全填满你时，你的呼吸卡在喉咙里，用她巨大、可塑的阴茎撑开你的阴户，直到她威胁要撕裂你。她黏糊糊的阴茎猛烈地穿过你的子宫颈，撞击着你子宫的入口。如果她是实体的，你确信你会感到难以置信的痛苦；但由于如此柔软湿滑，当她填满又清空你时，你感觉到的只有快感。");
            outputText("[pg]瓦莱丽娅邪恶地笑着，把腿移近身体，在你的[chest]上滑动。当她柔软、粘稠的黏液滑过你敏感的肌肤时，你喘着粗气。她的脚正好停在你的[nipples]上方。");
            if(!get_player().hasFuckableNipples())
            {
               outputText("瓦莱丽娅的脚跟在你敏感的[nipples]周围旋转，让乳头滑入她黏糊糊的脚中。她的脚跟前后摇晃，让你的乳头在她黏糊糊的身体里进进出出，感觉就像在你毫无防备的肉体上轻轻捏和挤压。");
            }
            else
            {
               outputText("史莱姆娘仍然微笑着，把脚从你的胸口抬起。你只能眼睁睁地看着她娇小的双脚旋转弯曲，重组成一对巨大的、带有龟头冠状沟的马阴茎。你还没来得及惊呼，她就把两根野兽般的肉棒深深地插入你的[chest]。当史莱姆娘对你进行三重插入，将她的三根阴茎猛烈地插入你被撑开的阴户和你胸部的洞里时，你像个荡妇一样呻吟着。");
            }
            get_player().cuntChange(10,true,true,false);
            outputText("[pg]在瓦莱丽娅对你的[vagina]和[nipples]的三重攻击下，你坚持不了多久。你因快感而喘息，感觉到高潮正在逼近。但不甘示弱的，你黏糊糊的爱人也发出了她自己长长、响亮的呻吟，并猛烈地撞击她的阴茎");
            if(get_player().hasFuckableNipples())
            {
               outputText("");
            }
            outputText("比以往任何时候都更深地插入你的体内。当她高潮时，你感觉到一股股黏液涌入你的体内，将她的精华倾注进你的子宫");
            if(get_player().hasFuckableNipples())
            {
               outputText("和[chest]");
            }
            outputText("直到黏液从你体内溢出，在她的臀部下方汇聚成一滩。被填得超出了你的极限，你尖叫着享受快感并高潮了，紧紧夹住瓦莱丽娅的肉棒");
            if(get_player().hasFuckableNipples())
            {
               outputText("");
            }
            outputText("直到它们真正在你体内爆开，化作黏稠的条纹流淌出来。");
         }
         else if(get_player().hasCock())
         {
            outputText("[pg]随着你的肉棒塞进瓦莱丽娅温暖黏稠的体内，这个史莱姆娘开始在你的大腿上前后摇晃，把她的整个下半身当成一个湿透的小穴来骑乘你的肉棒。她手里握着自己的肉棒向下压，让肉棒的根部顺着她的身体向下移动，直到它弯曲绕过你的臀部，并在你的[butt]上方重新成型。你瞪大了眼睛，但当你试图惊呼时，瓦尔粗暴地把她的一只脚塞进了你的嘴里。[say:嘘，搭档，]她笑着，用她柔软、带有柑橘味的脚趾弹着你的舌头，[say:顺其自然吧……会很爽的，我保证。]");
            outputText("[pg]你无可奈何地任由这个史莱姆娘为所欲为。当她的黏液肉棒在你的臀瓣间滑动时，你尽力放松自己，她的肉棒保持着刚好足够的硬度，让她能在你的臀瓣间摩擦。但她并没有插入，反而似乎暂时满足于在你的大腿上摇晃臀部，骑乘着你的[cock]，用她自己的肉棒操弄你的臀瓣。当她骑乘你时，瓦莱丽娅把脚往你嘴里塞得更深了些，将她的腿倾注进你嘴里，直到你领会了她的暗示，开始吮吸她娇小的脚趾，轻松地将舌头滑入她柔软的身体，品尝她的内在。");
            outputText("[pg]正当你开始适应这个节奏时，你突然感觉到你的[asshole]传来一阵压力。哦，该死。你扭动着身体试图放松，但令人惊讶的是，你并没有感觉到肉棒插入时的那种坚硬的刺痛感。相反，瓦莱丽娅将自己的一小股细流倾注进你的肛门，缓慢而坚定地将你撑开，同时她的肉棒在你体内膨胀了一半。当她将你撑开并加快在你[cock]上的速度时，你舒服地呻吟起来");
            if(get_player().hasVagina())
            {
               get_player().cuntChange(10,true,true,false);
               outputText("，双重攻击带来的快感如此强烈，以至于你几乎没有注意到她在第一根肉棒上方制造了第二根肉棒，并将其倾注进你未被使用的[vagina]中，用一根坚挺、黏稠的肉棒填满了你最后一个洞");
            }
            outputText("。");
            get_player().buttChange(10,true,true,false);
            outputText("[pg]瓦莱丽娅开始在你的大腿上挺动臀部，填满你的洞");
            if(get_player().hasVagina())
            {
               outputText("");
            }
            outputText("并用流畅而充满激情的动作操弄你的[cock]。你们现在都在毫无顾忌地呻吟着，几乎被多重快感所淹没。你能感觉到即将到来的高潮正在攀升，而从瓦莱丽娅越来越高的呻吟声来看，她似乎也同样接近了边缘。");
            outputText("[pg]你高潮了，尖叫着将精液释放进瓦莱丽娅的深处。你可以看到你的精液喷射进她体内，在她色彩鲜艳、透明的身体里旋转跳跃。她回应着你的叫喊，你感觉到滚烫的黏液喷射进你体内，她的肉棒");
            if(get_player().hasVagina())
            {
               outputText("");
            }
            outputText("在她高潮时直接爆开，填满了你被撑开的屁股");
            if(get_player().hasVagina())
            {
               outputText("和小穴");
            }
            outputText("充满了温暖、黏稠的黏液。");
         }
         else
         {
            gooFlation(false);
         }
         outputText("[pg]你瘫倒在地，黏液从你被蹂躏的身体里自由地流淌。瓦莱丽娅大笑着从你的大腿上流下，");
         if(get_player().get_gender() > 0)
         {
            outputText("拍了拍她装满你体液的肚子，");
            feedValeria(Math.sqrt(get_player().cumQ()) + 5 + get_player().averageVaginalWetness() * 5);
         }
         outputText("然后俯视着你。[say:真好玩，搭档，]她说着，俯下身在你的脸颊上留下一个湿漉漉的吻。[say:我们很快再来一次，好吗？]");
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(-1));
         get_player().HPChange(25 + get_player().newGamePlusMod() * 15,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function valeriaFollowerMenu() : void
      {
         var _g1:Camp;
         var _g:Valeria;
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         if(get_player().get_armorName() == "goo armor")
         {
            outputText("你告诉瓦莱丽娅你想和她谈谈。在她不附身于你的情况下。");
            outputText("[pg][say: 当然，搭档，听起来不错。]");
            outputText("[pg]这个不寻常的史莱姆娘相当快地从你身上滑落，带走了她的盔甲。她看着你，变成了稍微亮一点的蓝色。");
            outputText("[pg][say: 那么，[name]，想要什么吗？]");
         }
         else
         {
            outputText("你走到瓦莱丽娅身边。看到你走近，盔甲史莱姆在她的盔甲板下变成了稍微亮一点的蓝色，并咧嘴笑了。");
            outputText("[pg][say: 嘿，搭档！我们在营地安全的时候需要什么吗？]");
         }
         menu();
         addButton(0,"外貌",valeriaAppearance).hint("检查瓦莱丽娅的外貌。");
         addButton(1,"交谈",talkWithValeria).hint("和瓦莱丽娅交谈。");
         _g = this;
         addButton(2,"做爱",function():void
         {
            _g.followersValeriaSex();
         }).hint("和盔甲史莱姆开始性爱时间。").sexButton();
         addButton(3,"切磋",valeriaSpar).hint("和瓦莱丽娅进行一场快速的战斗！").disableIf(get_player().get_armor().get_id() == get_armors().GOOARMR.get_id(),"你不能在穿着她的时候和她战斗。");
         if(get_player().get_armorName() != "goo armor")
         {
            addButton(5,"拿走",takeValeria).hint(get_armors().GOOARMR.get_description());
         }
         _g1 = get_camp();
         addButton(14,"返回",function():void
         {
            _g1.campFollowers();
         });
      }
      
      public function valeriaFollower() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) != 1)
         {
            return get_player().get_armor() == get_armors().GOOARMR;
         }
         return true;
      }
      
      public function valeriaFluidsEnabled() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) != 0 || get_hardcore() || get_realistic())
         {
            return valeriaFollower();
         }
         return false;
      }
      
      public function valeriaDickToggle() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,499) == 1)
         {
            outputText("在做任何事之前，你问瓦莱丽娅是否介意把她那根假鸡巴藏起来，至少在你们不做爱的时候。");
            outputText("[pg][say: 噢，]她抱怨道，[say: 我都开始习惯我那小兄弟了。不过，既然你这么想……我想我会照做的。]");
            outputText("[pg]看到她那根粗大黏糊的肉棒缩回并消散在她的腹股沟里，你感到很欣慰。");
            outputText("[pg][say: 现在好些了吗，搭档？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,499,0);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,499,1);
            outputText("你努力想找个不那么尴尬的说法，问瓦莱丽娅是否介意为你长出一个特定的额外器官。");
            if(!get_player().hasCock() || get_player().get_gender() == 3 && get_player().averageBreastSize() >= 2)
            {
               outputText("[pg]她对你挑了挑眉。[say: 你知道的，我挺喜欢做个女孩的……但为了你，搭档，我想我可以弄点额外的东西出来。]");
               outputText("[pg]你看着瓦莱丽娅闷哼一声，胯部开始膨胀。一根粗壮的十二英寸长、类似人类的肉棒从她黏糊糊的小穴上方长了出来，抽动着滴下黏稠的先列腺液。你的盔甲史莱姆微微颤抖着。");
               outputText("[pg][say: 好吧，这感觉会……很不一样。那么，我们是不是该好好利用一下我这第三条腿呢，嗯？]");
            }
            else
            {
               outputText("[pg]瓦莱丽娅对你挑了挑眉。[say: 老兄。你该不会是基佬吧？]");
               outputText("[pg]你对她怒目而视。");
               outputText("[pg][say: 靠，我就是一大坨黏液。我有什么资格评判呢？一根跳动的黏液棒，马上就来。]");
               outputText("[pg]你看着瓦莱丽娅闷哼一声，胯部开始膨胀。一根粗壮的十二英寸长、类似人类的肉棒从她黏糊糊的小穴上方长了出来，抽动着滴下黏稠的先列腺液。你的盔甲史莱姆微微颤抖着。");
               outputText("[pg][say: 好吧，这感觉会……很不一样。那么，我们是不是该好好利用一下我这第三条腿呢，嗯？]");
            }
         }
         doNext(valeriaFollowerMenu);
      }
      
      public function valeriaCampLines() : void
      {
         var _loc1_:* = null as Array;
         if(get_player().get_armor().get_id() == get_armors().GOOARMR.get_id())
         {
            return;
         }
         if(get_time().hours < 21)
         {
            outputText("史莱姆娘瓦莱丽娅目前正在营地里偷懒。当她注意到你看着她时，她从身体里伸出一条新的手臂，高兴地向你挥手。");
         }
         else
         {
            _loc1_ = ["一团蓝宝石色的黏液静静地待在你的营地里。","地上有一大团深蓝色的史莱姆。你认出那是正在睡觉的瓦莱丽娅。"];
            outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         }
         outputText("[pg]");
      }
      
      public function valeriaAppearance() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         get_images().showImage("monster-gooarmor");
         outputText("瓦莱丽娅是一个6英尺高的史莱姆娘，由粘稠的蓝色黏液组成。她目前穿着一套板甲，挥舞着她的黏液巨剑作为武器。她有一张美丽的女性面孔，五官轮廓分明，留着一头短短的黏液头发，刚好垂过脸颊。她的臀部大小适中，有着肌肉发达、手感极佳的屁股。与大多数黏液生物不同，瓦莱丽娅用她黏糊糊的下半身形成了两条正常的人类腿，末端是正常的人类脚。");
         outputText("[pg]她有一对C罩杯的乳房，每个乳房上都有一个0.5英寸的乳头。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,499) == 1)
         {
            outputText("[pg]当你需要时，她能在她的小穴上方形成一根令人印象深刻的人形肉棒，通常最长可达12英寸。尽管它是黏液做的，但它不断地滴下一点点黏液，就像先列腺液一样。");
         }
         outputText("[pg]她在双腿之间创造了一个容易拉伸的黏液小穴，带有一个0.2英寸的微小阴蒂。");
         outputText("[pg]她通常懒得弄出一个肛门，尽管你觉得要插入她那黏糊糊、手感极佳的屁股也不会太难。");
         doNext(valeriaFollowerMenu);
      }
      
      public function valeriaAndGooThreeStuff() : void
      {
         clearOutput();
         outputText("你在瓦莱丽娅的怂恿下小心翼翼地靠近，[say:我们要操她吗？我们要操她，对吧，[name]？]她深情地抚摸着你的");
         var _loc1_:Array = ["[hips]"];
         if(get_player().balls > 0)
         {
            _loc1_.push("[balls]");
         }
         if(get_player().totalCocks() > 0)
         {
            _loc1_.push("[multiCockDescriptLight]");
         }
         if(get_player().hasVagina())
         {
            _loc1_.push("[vagina]");
         }
         _loc1_.push("[asshole]");
         _loc1_.push("[nipples]");
         outputText(Utils.formatStringArray(_loc1_) + "，那液体般柔软的抚摸，几乎转瞬即逝，却又如此完美地占据了你的一切，用蓝色的黏液填满了你[skin]上的每一个微小瑕疵，并挑逗着她能触及的任何入口。");
         if(get_player().hasCock())
         {
            outputText("当[eachCock]完全勃起时，你叹了口气。蓝色的涂层");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("仅仅比拉伸的避孕套厚一点点");
            if(get_player().cockTotal() == 1)
            {
               outputText("es");
            }
            outputText("围绕着");
            if(get_player().cockTotal() == 1)
            {
               outputText("它，随着它的膨胀");
            }
            else
            {
               outputText("它们，随着它们的膨胀");
            }
            outputText("瓦莱丽娅那越来越液化的形态。从顶端滴落");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，蓝宝石般的黏液拉出长长的黏稠丝线，然而整个过程中，你感觉就像有十几只手拿着涂满润滑剂的羽毛，在你敏感器官的每一处滑过");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         else if(get_player().hasVagina())
         {
            outputText("当你的[vagina]被感觉像是几十根浸透了润滑剂的羽毛温柔地抚摸时，你叹了口气，这种对皮肤的挑逗让你的入口变得如此滚烫，以至于你怀疑瓦莱丽娅为什么没有被蒸发成水汽。覆盖在你阴阜上的气密密封层正在不断地移动，准备刺激你。有时，一条狭窄的半固体黏液带会像一条极细的丁字裤一样滑入你的阴唇之间，黏液与你突然大量分泌的爱液混合在一起，形成了一种淫荡的、几乎无法抑制的少女渴望之汤。她克制着自己，没有潜入你的入口……暂时没有。");
         }
         else
         {
            outputText("当你的[asshole]被感觉像是几十条非人类般长舌头温柔地舔舐和挑逗时，你叹了口气，它们在上面画着大圈涂抹，以至于你的臀瓣也受到了彻底的鞭打。像皮带一样坚固结实的带子滑入你的[butt]周围，将你完全撑开，其中一个细长的、由黏液构成的器官滑得更深，品尝着你的玫瑰花蕾，但始终没有完全推入。");
         }
         outputText("[pg]你的步伐立刻变得有些踉跄，当你靠近倒下的黏液时，你的臀部不由自主地摇晃和抽搐，无法抗拒那紧贴身体的黏液带来的性感抚摸。不知何故，即使你已经站在被击败的敌人上方，她依然保持着这种状态，在你检查战利品时，轻快地咯咯笑着。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1020) == 0)
         {
            outputText("[pg]对你来说不幸的是，这个渴望挨操的黏液荡妇打算在这里掌握主动权。");
         }
         else
         {
            outputText("[pg]就像上次一样，这个渴望挨操的黏液荡妇正在掌握主动权。");
         }
         outputText("她出人意料地从一个意想不到的角度施加压力，扭曲了你的身体，让你头朝下，径直摔向那个你刚刚才打败的、睁大眼睛的史莱姆娘！");
         outputText("[pg]你[face]朝下扑通一声栽进了一团柔软的、有弹性的黏液中，但惯性只让你部分进入了这个人形水坑。当你停下来时，一个半固体的肿块撞到了你的脸颊，你漂浮在一个" + get_monster().gooColor() + "的监狱里。你摇了摇头，试图看清你撞到了什么，但你只能看到一片模糊的薄膜，而且你也无法呼吸。你鼓起脸颊，挣扎着想要浮出水面。像往常一样，瓦莱丽娅在支持着你。她那毫不掩饰的慢吞吞的语调湿漉漉地在你的耳膜上震动，[say:我抓住你了，搭档，]同时你的身体被旋转，慢慢地把你的头推出" + get_monster().gooColor4() + "的表面，而你的身体则被黏液彻底包裹着。");
         outputText("[pg]无论你怎么尝试移动，你都无法动弹分毫！这两个流体女性的液体重量简直就像铁一样沉重；你挣扎得越厉害，她们的束缚力就越强。与此同时，那些促使你采取这种行动的折磨人的触摸又回来了，只是变得更加坚定和执着。");
         outputText("[pg]蓝色的");
         if(get_monster().skin.tone != "blue")
         {
            outputText("" + get_monster().gooColor6());
         }
         outputText("汁液慢慢融合在一起，直到你无法分辨彼此，它们凝固成一个半透明的平底球体，将你困在其中。你那堕落且无可救药的兴奋状态，任何路过的人都能看得一清二楚，深色的水流抚摸着你的");
         if(get_player().hasCock() || get_player().hasVagina())
         {
            outputText("生殖器");
         }
         else
         {
            outputText("[asshole]");
         }
         outputText("，罪恶地紧紧缠绕着。一阵不由自主的兴奋颤栗顺着你的脊椎蔓延，尽管你的身体在这晃荡的钳制中几乎完全无法动弹。");
         outputText("[pg]在你面前那蓝色的弧形场上，出现了一阵扭曲，慢慢地化作了瓦莱丽娅那熟悉、湿漉漉的面容。一秒钟后，另一张陌生的脸也跟着出现了，来到她身边，但一只蓝色的手平平地拍在那个新来者的头顶，把它压得粉碎，化为乌有。瓦莱丽娅说道，[say: 没门，小妞。让妈妈来说话……]");
         outputText("[pg]你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1020) == 0)
         {
            outputText("要求她放开你");
         }
         else
         {
            outputText("开玩笑地说她真的应该放开你");
         }
         outputText("，但那麻烦的液体盔甲却摇了摇头。");
         outputText("[pg][say: 你就乖乖坐好，[name]。我要给我妹妹一个有趣的新体验，让你充满快感，让你觉得你要爆炸了。] 还没等你回应，她就消失在蓝色的粘液块中。那渐渐消失的涟漪，在平息至无形时，几乎是在嘲笑你无法回答。");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         menu();
         addButton(0,"继续",valeriaGooRapeII);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(get_player().statusEffectv1(StatusEffects.GooStuffed) > 0)
         {
            get_player().addStatusValue(StatusEffects.GooStuffed,1,-1);
            if(get_player().statusEffectv1(StatusEffects.GooStuffed) <= 0)
            {
               get_valeria().birthOutDatGooSlut();
               return true;
            }
         }
         return false;
      }
      
      public function talkWithValeria() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         get_images().showImage("valeria-talk");
         outputText("你问瓦莱丽娅介不介意聊一会儿。");
         outputText("[pg][say: 我不知道，搭档，]她坐在你身边打趣道，[say: 这个要求可有点过分了。]");
         outputText("[pg]你翻了个白眼，在几句客套话之后，试探着问她……嗯，她到底是个什么东西。她一点也不像在玛瑞斯游荡的普通史莱姆娘。她会说话，用两条腿走路……");
         outputText("[pg]她像个小女孩一样笑了起来，摆摆手，好像你说了什么荒谬的话。[say: 我不是真正的黏液，你知道的。至少，我一开始不是这样的，]她补充道，指了指自己黏糊糊的蓝色身体。[saystart]不，我以前是个人类，就像你");
         if(get_player().get_race() != "human")
         {
            outputText("曾经一样");
         }
         outputText("。我只是，我不知道，改变了，我想。[sayend]");
         outputText("[pg]改变了？");
         outputText("[pg][say: 嗯，是的。恶魔刚来的时候。其中一个带走了我，然后……改变了我，]她轻声说道，迅速移开视线。[say: 我不知道那时候有没有真正的史莱姆娘或史莱姆。我想我算是个实验品——也许是个原型。不过，恶魔用在我身上的魔法和现在创造黏液的魔法不太一样。我的心智能力和以前一样，能说话，能用两条腿走路……一切都一样。最大的变化就是会发生这种破事，]她补充道，捡起附近的一块石头戳进自己的肚子里。石头在她体内无力地漂浮着，透过她黏糊糊的皮肤隐约可见。");
         outputText("[pg]你很快指出，对于一个遭受恶魔魔法的人来说，她似乎毫发无损。你以为大多数恶魔的受害者至少会因为欲望而发狂。");
         outputText("[pg]瓦莱丽娅苦笑了一下。[say: 嗯，我也不是完全没变，]她声音沙哑地低语道，凑近你，饥渴地看着你的胯部。[say: 毕竟，我现在有某些……胃口……你知道的。我并不为我的新需求感到自豪，但我恐怕无法忽视它们……]");
         menu();
         if(get_player().get_gender() > 0)
         {
            addButton(0,"调情",flirtWithValeria).hint("和瓦莱丽娅调情，并和她做爱。");
         }
         addButton(1,"接受",acceptValeriasNeeds).hint("告诉瓦莱丽娅你接受她的特殊需求。");
         addButton(2,"恶心",declineValeriasNeeds).hint("拒绝瓦莱丽娅的特殊需求。");
      }
      
      public function takeValeria() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id())
         {
            outputText(get_armors().VINARMR.saveContent.armorStage > 2 ? "[say:哇哦，]蓝宝石黏液举起双手说道。[say:我不确定我想躺在荆棘床上。]荆棘怎么会让无定形的黏液感到如此不适，这还是个谜，但她看起来确实很反感。[say:而且，那些藤蔓不会开始吸干我所有的体液吧？]" : "[say:那些藤蔓不会开始吸干我所有的体液吧？]]瓦莱丽娅担忧地问。你想，藤蔓并没有杀死你，所以应该没那么糟。[say:你不是史莱姆，搭档，你不是由纯粹的黏液营养组成的，不会被某种植物寄生虫吞噬。]");
            outputText("[pg]你唯一能做的就是叹口气，接受她的拒绝。");
            doNext(playerMenu);
            return;
         }
         get_images().showImage("valeria-take");
         get_armors().GOOARMR.useText();
         get_player().get_armor().removeText();
         var _loc1_:Armor = get_player().setArmor(get_armors().GOOARMR);
         if(_loc1_ == null)
         {
            doNext(playerMenu);
         }
         else
         {
            get_inventory().takeItem(_loc1_,playerMenu);
         }
      }
      
      public function penetrateValeria() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         get_images().showImage("valeria-sex-penetration");
         outputText("[say: 嗯，这根鸡巴看起来真美味，]当你脱下衣服，让你的[cock]自由垂下时，瓦莱丽娅说道。[say: 我可能得取个样本，]她轻笑着，在你面前蹲下，将你的肉棒握在手中。然而，这位史莱姆娘并没有给你一个简单的手淫，而是将她的手掌贴在你的龟头上，向前按压。");
         outputText("[pg]当她黏糊糊的皮肤分开，让你的[cock]滑入她体内时，你倒吸了一口凉气。她的手掌和前臂就像一个紧致、湿润的飞机杯，随着你齐根滑入她体内，它们变移并塑形，完美地贴合你的肉棒。她抬头对你咧嘴一笑，给了你一个只有史莱姆娘才能做到的手淫，用她那可穿透的手掌像小穴一样。当她移动手臂，在她体内慢慢抚弄你的鸡巴，偶尔改变动作，在你周围画大圈或左右移动时，你发出呻吟。");
         outputText("[pg]然而，还没等你觉得太舒服，瓦莱丽娅就向前挪动，伴随着一声湿润的“啵”声，将你的[cock]从她的手臂移到了她的乳房上。她挤压着她那盈盈一握的C罩杯，倾身向前，让你的鸡巴滑入它们之间，进入她黏糊糊的肉体中。当史莱姆娘开始用乳房操你，将她湿润的乳房沿着你肉棒的长度滑动，龟头在她那像小穴一样的内部进进出出时，你呻吟着，她内部那种令人愉悦的湿润和温暖又回来了。");
         outputText("[pg]你将手指陷入黏液的肩膀，开始引导她的速度，让她以你自己的节奏在你的鸡巴上前后移动，就像一个特别奢华的飞机杯。平时占据主导地位的瓦莱丽娅在你夺取控制权时，发出了一声惊讶而快乐的尖叫。当你把她当作你个人的性玩具，在你的肉棒上粗暴地前后猛撞，直到你感觉到高潮在你体内翻腾时，她加倍努力地用乳房操你的[cock]。");
         outputText("[pg]瓦莱丽娅似乎也感觉到了即将到来的高潮；她从你的抓握中融化，滑了回去，刚好在你的触及范围之外。[say: 啧，啧。我还没玩够呢，[name]，]她戏弄道，当你试图抓住她，渴望释放时，她向后滑行。她对你摇了摇手指，拒绝你接触她的身体，但她的脸上却浮现出“过来”的神情。你追逐着她，你那勃起的怒火需要她的安抚，但她巧妙地躲避着你，直到高潮的威胁过去。直到那时，史莱姆娘才慢下来，让你粗暴地抓住她的肩膀，把她扔到地上。");
         outputText("[pg][say: 哦，你想来点粗暴的，搭档？]她笑着，张开她黏糊糊的双腿，露出她小穴那湿滑的通道。[say: 那么，你还在等什么？快给我吧！]");
         outputText("[pg]你急切地满足了她，把她的腿搭在你的肩膀上，然后插了进去。当你滑入她体内，齐根没入时，瓦莱丽娅发出了一声愉悦的吼叫，她黏糊糊的内部完全贴合了你[cock]的形状，为你形成了一个完美的套子来操。你将指尖陷入她柔软的臀部，开始猛烈地操她，将你的鸡巴狠狠地撞入她体内，直到她的腹股沟开始失去其一致性，在你的臀部周围扭曲，直到她几乎将你整个吞没。");
         outputText("[pg]瓦莱丽娅大笑着，当你被她用双腿缠住背部拉近，将你的脸埋在她的乳房之间，将你的臀部和鸡巴深深地陷入她的胯部时，你大叫起来。她把你拉得更深，强迫你的脸进入并穿过她的皮肤，直到你几乎被史莱姆娘吞没，只有你挣扎的[legs]留在她体外。瓦莱丽娅咯咯笑着，拍了拍她的肚子，让你只能透过周围的黏液感觉到她手的触摸。");
         outputText("[pg]你试图在瓦莱丽娅体内挣扎，但当她抓住你的鸡巴，她的黏液从她的臀部突出，在你的长度周围形成一个紧密的鞘时，你发出了一声愉悦的叫喊。她只是咧嘴一笑，开始给你手淫，她的手轻松地在你黏糊糊的阴茎鞘上上下滑动。你在她体内扭动，被周围紧密的黏液身体和紧紧抓住你[cock]的手固定在原地。当她为你手淫时，她发出咕哝和呻吟，显然她和你一样享受这种感觉——甚至可能更多。");
         outputText("[pg]突然，你感觉到黏黏在你周围收紧，似乎要把你压碎。你挣扎得越厉害，瓦莱丽娅就越兴奋。她仰起头尖叫着，双手在你们共享的肉棒上快速套弄，随着她的高潮，黏黏从你的肉棒套顶端喷涌而出。感觉到她收缩并紧紧挤压着你的[cock]，你突然被一种不可避免的高潮感所袭击。");
         outputText("[pg]伴随着突然涌起的力量，你趁着瓦莱丽娅还在恍惚状态，翻身跪起，将上半身从她身上挣脱出来，只留下臀部和肉棒还在她迅速变形的身体里。你抓住她的乳房，像打桩机一样把肉棒狠狠地插进她体内，不断地抽插，直到你看到一丝丝先列腺液在她体内蠕动。你大笑着，放任自己射精，看着浓稠的精液射入她的深处，在她蓝色的身体里化作一团白雾。");
         outputText("[pg]伴随着一声如释重负、筋疲力尽的叹息，你向后倒去，伴随着湿润的吧唧声从瓦莱丽娅的身体里弹了出来。当你躺在背上，因为粗暴的性爱而喘息时，你注意到瓦莱丽娅正在将她的身体重组成正常的人类形态，一团精液的雾气在她饱满的肚子里欢快地翻滚着。她故意揉了揉肚子，然后走过来，一屁股坐在你身上，她那诱人的臀部轻轻压在你的肚子上。");
         outputText("[pg][say: 真好玩，搭档，]她笑着说。[say: 味道也不错，]她补充道，伸手进肚子里拉出一条你的精液。她把它吸了回去，还对你眨了眨眼。");
         outputText("[pg]当她消化她的美餐时，你的手沿着她的曲线游走，但最终你知道你需要继续你的职责。你把瓦莱丽娅从你身上推开，开始重新穿衣服。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(1));
         get_player().HPChange(25 + get_player().newGamePlusMod() * 15,false);
         feedValeria(Math.sqrt(get_player().cumQ()) + 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pcWinsValeriaSparDefeat(param1:Boolean = false) : void
      {
         var _g:Valeria;
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         if(!param1)
         {
            outputText("你倒下了，");
            if(get_player().get_HP() < 1)
            {
               outputText("痛苦难忍");
            }
            else
            {
               outputText("太兴奋了");
            }
            outputText("无法继续战斗了。瓦莱丽娅瞬间就压在了你身上，她那黏糊糊的巨剑抵住了你的喉咙。[pg]");
         }
         outputText("[say: 你投降吗？]她问道，活像个骑士。");
         outputText("[pg]你用力地点了点头。");
         outputText("[pg][say: 啧，]她叹了口气，摇了摇头。[say: 我跟着你的唯一原因，就是觉得你可能还有点胜算，勇者。如果你连我都打不过……哦，我该拿你怎么办才好呢？]她轻笑着");
         if((get_player().get_HP() < 1 || get_player().get_gender() == 0) && !param1)
         {
            outputText("，向你伸出一只手拉你起来。");
            outputText("[pg][say: 走吧，我们回营地去。]");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("。[say: 好吧，既然你这么……急不可耐……我不如就在这儿补充一下我今天的体液吧。]");
            _g = this;
            doNext(function():void
            {
               _g.valeriaSexDominated();
            });
         }
      }
      
      public function pcWinsValeriaSpar() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         outputText("[say: 呃！]瓦莱丽娅闷哼一声，摔在坚硬的泥地上时几乎失去了人形。[say: 好了，好了，你赢了！放轻松，搭档，]她笑着，让她的巨剑消散回她的身体里。");
         outputText("[pg]你主动提出扶她起来，但她轻松地重塑了站立的姿势，然后对你眨了眨眼。[say: 谢谢你把我揍了一顿，[name]，]她笑着说。[say: 来吧，我们回去吧。毕竟恶魔可不会自己打败自己。]");
         get_combat().cleanupAfterCombat();
      }
      
      public function isabellaAndValeriaSpar() : void
      {
         clearOutput();
         outputText("在你回家的路上，你听到伊莎贝拉在营地的那边发出一声烦躁的[say: 哞——！]。你挑了挑眉，走到那个忙碌的牛娘身边。伊莎贝拉现在正双臂交叉抱在丰满的胸前，她的盾牌插在身前的地上。站在她面前几英尺远的是瓦莱丽娅，她紧紧地穿着钢甲，手里紧紧握着巨剑。");
         outputText("[pg][say: 我只是说，伊兹，]瓦莱丽娅抱怨着，朝她那把黏糊糊的剑点了点头。[say: 你的战斗风格就是……有点欠缺，仅此而已。]");
         outputText("[pg][say: 我的战斗风格才没有欠缺！]伊莎贝拉气呼呼地说，双臂抱得太紧，以至于一小团牛奶从她的紧身胸衣里冒了出来。");
         outputText("[pg][say: 就是有！带着一面巨大的塔盾然后用拳头打人到底有什么意义？说真的，这是怎么回事；如果你只是买不起剑、锤子或者别的什么，我可以给你一些宝石。我的意思是……]");
         outputText("[pg][say: 闭嘴！]伊莎贝拉厉声说道，皱着眉头。[say: 这不是宝石的问题！我更喜欢用我的拳头，就是这样。]");
         outputText("[pg][say: 拜托——，至少试着用用剑吧。求你了？你可能会喜欢的……]");
         outputText("[pg][say: 不，伊莎贝拉不会用你的黏液武器来贬低她的手。]");
         outputText("[pg]瓦莱丽娅的肩膀耷拉下来。[say: 好吧，好吧。随便你。等你的手臂被恶魔撕下来的时候。看我管不管。我想我还是……自己去练习吧。]");
         outputText("[pg][say: 等等，我，]伊莎贝拉开口道，在瓦莱丽娅转身时抓住了她的肩膀。[say: 我想我可以……试着用用剑。]");
         outputText("[pg]瓦莱丽娅喜笑颜开，把那把黏糊糊的巨剑递给牛娘，催促她挥舞几下以适应它。");
         outputText("[pg]伊莎贝拉试探性地挥舞着巨剑，划出长而缓慢的弧线。她似乎掌握了窍门，挥舞得越来越快、越来越用力，还加上了简单的旋转和格挡……直到她用剑划出一个巨大的旋转弧线，正好砍在瓦莱丽娅的脖子上。");
         outputText("[pg]你" + (get_player().get_inte() > 80 ? "惊讶" : "惊恐") + "地看着盔甲史莱姆的头滚落到地上，被伊莎贝拉有力的一击直接砍了下来。[say: 我的上帝！]伊莎贝拉倒吸一口凉气，扔下剑，捂住胸口。");
         outputText("[pg][say: 哎哟。]瓦莱丽娅回答道，片刻之后她的头又重新出现在脖子上。当被砍下的头颅分解并被重新吸收到瓦莱丽娅的脚里时，牛娘吓得向后跳去。史莱姆娘转动着下巴，夸张地扭了扭脖子。[say: 嘿，挥得不错，伊兹。不过，呃，你可能得看着点你挥剑的方向。]");
         outputText("[pg][say: 我，啊，是的。我会的？]");
         outputText("[pg]瓦莱丽娅轻笑着，将巨剑重新吸收进体内。她挠了挠脖子，溜达回了营地，留下可怜的伊莎贝拉还在那儿惊魂未定。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2220,1);
         doNext(playerMenu);
      }
      
      public function gooFlation(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         if(param1)
         {
            clearOutput();
            outputText("[say:放松点，搭档，]她咧嘴笑着，伸出手穿过你的[hair]。[say:就让老瓦莱丽娅来处理一切吧……]");
            outputText("[pg]当你感觉到瓦莱丽娅的脚在你身后移动时，你咬住了嘴唇。突然，十根温暖的黏液触手像蛇一样缠绕在你的[butt]上，挠着痒痒，抚摸着你敏感的肌肤。");
         }
         else
         {
            outputText("[pg]瓦莱丽娅在你那平坦、没有生殖器的大腿上扭动着她黏糊糊的屁股，当她发现自己对你几乎没有产生任何影响时，终于放弃了。她停顿了片刻，暗自思忖，直到你看到一个主意在她的脸上闪过。伴随着一个咧嘴笑，盔甲史莱姆用她修长的双腿缠住你的[hips]，将她的双脚在你的背后锁在一起。");
         }
         get_images().showImage("valeria-sex-gooflation");
         outputText("[pg]瓦莱丽娅依然蜷缩在你的大腿上，只给了你一个可爱、无辜的小微笑。你感觉到她的脚趾在生长膨胀，变成了十根细长的触手，撬开你的臀瓣，寻找着进入你");
         if(!get_player().hasVagina())
         {
            outputText("那唯一孤单的");
         }
         outputText("洞口的通道。当触手交媾开始时，你咽了口唾沫。她长长的触须一根接一根地涌入你的[asshole]，每一根都如此细小柔软，轻易地滑入你的体内。一根叠着一根，随着她越来越多的部分滑入你体内，它们在你的肠壁上搔痒挑逗。");
         get_player().buttChange(30,true,true,false);
         outputText("[pg]当她最后一根脚趾触手刺穿你的括约肌，与它在你的屁股里的姐妹们汇合时，你发出闷哼和喘息。随着她将越来越多的阴茎脚趾触须倾注进你的体内，你开始看到瓦莱丽娅的身体在缩小和干瘪……哦，天哪……");
         outputText("[pg]她的肚子变得凹陷，然后是她的脸，直到她从你的身体上流下，环绕在你的腰间。你试图挣扎，但为时已晚。她涌上你的直肠，用她自己完全填满了你。你只能坐着看着你的肚子开始膨胀，危险地从你的肋骨处凸出，因为瓦莱丽娅最后的一点点也被吸进了你的屁股。");
         get_player().refillHunger(50);
         outputText("[pg][say: 瓦莱丽娅！]你大喊着，戳了戳你的肚子。你的肉体颤抖着，像一大碗黏液一样晃动。");
         outputText("[pg][say: 嘿，搭档，]你听到从你体内传来一阵笑声。还没等你对体内的史莱姆娘说些什么，你的肚子就咕噜作响。你弯下腰，一半是快感一半是痛苦，因为有什么东西在你体内猛烈地倾斜。你感觉到一股急流冲出你的结肠，你刚蹲下，瓦尔就伴随着一次巨大的推力从你的屁股里爆炸般地冲了出来。你高潮了，当瓦莱丽娅从你的屁股里弹出来，从你被撑开的括约肌里倾泻而出时，一次肛门高潮震撼了你的身体。");
         if(param1)
         {
            outputText("[pg]你瘫倒在地，黏液从你被蹂躏的身体里自由地流淌。瓦莱丽娅大笑着从你的大腿上流下，");
            if(get_player().get_gender() > 0)
            {
               outputText("拍了拍她装满你体液的肚子，");
            }
            outputText("然后俯视着你。[say: 真好玩，搭档，]她说着，俯下身在你的脸颊上留下一个湿漉漉的吻。[say: 我们很快再来一次，好吗？]");
            get_player().orgasm("Generic");
            dynStats(DynStat.Sens(1));
            get_player().HPChange(25 + get_player().newGamePlusMod() * 15,false);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function followersValeriaSex(param1:Boolean = true) : void
      {
         var _g1:Valeria;
         var _g:Valeria;
         spriteSelect(SpriteDb.get_s_valeria());
         if(param1)
         {
            clearOutput();
            outputText("你带着淫荡的笑容，问你这位黏糊糊的朋友是否");
            if(get_player().get_gender() > 0)
            {
               outputText("有兴趣来点体液交换");
            }
            else
            {
               outputText("介意帮你释放一下，尽管你没有性别特征");
            }
            outputText("。");
            outputText("[pg][say: 嗯……我想这可以安排。你有什么想法，搭档？]");
         }
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"插入她",penetrateValeria).hint("用你的阴茎操这个史莱姆女孩！");
         }
         addButton(1,"被操",valeriaGetFucked).hint(get_player().hasVagina() ? "让她插你的小穴。" : "让她插你的屁眼。");
         _g = this;
         addButton(2,"黏液膨胀",function():void
         {
            _g.gooFlation();
         }).hint("让她通过你的屁眼把你的肚子塞满！");
         if(get_player().get_gender() > 0)
         {
            _g1 = this;
            addButton(3,"被支配",function():void
            {
               _g1.valeriaSexDominated();
            }).hint("屈服于盔甲史莱姆，让她来主导。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,499) == 1)
         {
            addButton(4,"收起鸡巴",valeriaDickToggle).hint("让她把那根黏糊糊的鸡巴藏起来。");
         }
         else
         {
            addButton(4,"长出鸡巴",valeriaDickToggle).hint("让她长出一根黏糊糊的鸡巴。");
         }
         addButton(14,"返回",valeriaFollowerMenu);
      }
      
      public function flirtWithValeria() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         outputText("你伸出一只手臂揽住瓦莱丽娅纤细的肩膀，将她拉近。你拍了拍自己的裤裆，告诉她，对于像她这样的女孩来说，你简直就是个美食大厨。她咯咯地笑着，一只手轻松地滑进你的[armor]里，");
         if(get_player().hasCock())
         {
            outputText("顺着你迅速变硬的阴茎抚摸着");
         }
         else
         {
            outputText("用湿润温暖的指关节拂过你的[clit]");
         }
         outputText("。");
         outputText("[pg][say:嗯。我相信你是，搭档，]她靠在你的脖子上喃喃自语，用脸颊蹭着你。[say:那么，你觉得给我做顿小餐怎么样？]");
         followersValeriaSex(false);
      }
      
      public function feedValeria(param1:Number) : void
      {
         var _loc2_:* = null as IMap;
         if(valeriaFollower())
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2200,FlagDict_Impl_.arrayReadInt(_loc2_,2200) + int(Math.round(param1)));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) > 100)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2200,100);
            }
         }
      }
      
      public function declineValeriasNeeds() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         outputText("你皱起眉头，推开了这个史莱姆娘。你对她那堕落的“需求”毫无兴趣，尤其是看到她脸上那副表情。你推她时，她倒吸了一口凉气，差点摔倒；她稳住身子，愤怒地瞪着你。");
         outputText("[pg][say:好吧，去你的，[name]，]她气呼呼地说。[say:原谅我就是……我。]她扬起下巴，大摇大摆地走到营地里离你尽可能远的地方。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function birthOutDatGooSlut() : void
      {
         outputText("[pg]<b>发生了一些奇怪的事情……</b>");
         outputText("[pg]你的肠胃突然剧烈地翻腾，差点把你从[feet]上掀翻！在腹部的震颤把你掀翻之前，你把自己放低到地上，抱着你那被黏液胀大的肚子，想知道你是否终于能从带着一肚子黏液到处走的状态中解脱出来了。");
         if(get_player().statusEffectv4(StatusEffects.GooStuffed) > 0)
         {
            outputText("你的乳房甚至在狂野地摇晃，在你的[armor]里淫秽地抖动着，这让你的[nipples]漏出了不少液体。");
         }
         outputText("[pg]当你的[asshole]张开，露出史莱姆娘光滑的核心时，你得到了答案。当它逐渐滑过你被撑开的肛门并释放出奔流的黏液时，你被迫在狂喜中颤抖。你弯下腰，双手撑地，让它通过，在它离开你的身体时抚摸你的方式让你意外地高潮了，像个");
         if(get_player().hasFur())
         {
            outputText("毛茸茸的");
         }
         outputText("发情的母狗一样呻吟着。天哪，太多了！");
         if(get_player().statusEffectv4(StatusEffects.GooStuffed) > 0)
         {
            outputText("[pg]");
            if(!get_player().hasFuckableNipples())
            {
               outputText("僵硬起来");
            }
            else
            {
               outputText("张开");
            }
            outputText("，你的[nipples]突然喷涌出凝胶状的黏液河流，用颜色怪异的淫秽乳汁增加了下方不断扩大的水坑。你用一只手抓住一个并挤压，射出巨大的乳白色黏液流，直到你的乳房感到酸痛。你在另一边重复这个动作");
            if(get_player().bRows() > 1)
            {
               outputText("以及下一排");
            }
            if(get_player().bRows() > 2)
            {
               outputText("，以此类推");
            }
            outputText("，挤出每一滴浓稠的、填满身体的黏液，而你的屁股还在忙着排空。即使在它们排空之后，它们似乎也没有失去一点它们增加的尺寸……");
         }
         if(get_player().hasCock() && get_player().statusEffectv2(StatusEffects.GooStuffed) > 0)
         {
            outputText("[pg][EachCock]突然充满并抽搐着勃起，在完全没有预兆的高潮中爆发，喷出巨大的颜色怪异的精液流，落在");
            if(get_player().balls > 0)
            {
               outputText("紧缩着蛋蛋");
            }
            else
            {
               outputText("全身紧绷");
            }
            outputText("颤抖着享受这极乐。它太浓稠了，量也太多，你那充满幸福感的爆发很快就变成了一条不断流淌的射精狂喜之河。你用一只手抓住它，挤压着挤出最后一滴，即使排空后也依然在跳动。之后又流出几滴白色的黏液，但这就是你看到的全部正常的精液了。");
            if(get_player().statusEffectv2(StatusEffects.GooStuffed) >= 2)
            {
               outputText("你的蛋蛋保持着增大的尺寸。真奇怪。");
            }
         }
         if(get_player().hasVagina() && get_player().statusEffectv3(StatusEffects.GooStuffed) > 0)
         {
            outputText("[pg]你的[vagina]喷涌出一股黏液，在将这黏糊糊的包裹释放到下方凝结的水坑中时，几乎闪烁着快感的光芒。你的阴唇因为这次经历变得如此肿胀和敏感，以至于你的小穴看起来异常臃肿，就像被吸吮了几个小时一样，但它所做的只是在释放长期积压的负担时不停地高潮。");
         }
         outputText("[pg]你喘着粗气试图平复呼吸，这时液体在你身边聚集起来，长出了一张友善的笑脸。它给了你一个简单的微笑，在你的额头上吻了一下，然后留下你恢复体力，朝着湖的方向走去。[pg]");
         get_player().removeStatusEffect(StatusEffects.GooStuffed);
         get_player().knockUpForce();
         get_player().buttKnockUpForce();
         doNext(playerMenu);
      }
      
      public function acceptValeriasNeeds() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         outputText("你微笑着告诉瓦莱丽娅，你完全可以接受她的特殊需求");
         if(get_player().hasStatusEffect(StatusEffects.SlimeCraving))
         {
            outputText("毕竟，你也有同样的需求");
         }
         outputText("，只要它们不干扰你作为勇者的任务就行。");
         outputText("[pg][say:不会的，搭档，]瓦莱丽娅调皮地眨了眨眼。[say:我向你保证。]");
         outputText("[pg]你点点头，揉了揉她黏糊糊的头发，然后继续办正事。");
         doNext(valeriaFollowerMenu);
      }
   }
}

