package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
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
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.UseableLib;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class GoblinAssassinScene extends BaseContent
   {
      
      public function GoblinAssassinScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function rapeAGoblinCorruptTooBig() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         spriteSelect(SpriteDb.get_s_goblin());
         get_images().showImage("goblin-win-male-corruptedfuck");
         outputText("你开始脱下你的[armor]，饥渴地舔着嘴唇，低头看着你那无助的、原本想袭击你、现在却即将成为你受害者的猎物。你的[cocks]");
         if(get_player().cockTotal() == 1)
         {
            outputText("是");
         }
         else
         {
            outputText("全都是");
         }
         outputText("远比她更清楚现在的状况，你弯下腰，剥去她身上本就少得可怜的衣物。当你打量她时，");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的一根[cocks]停在了她的身上，而它");
         }
         else
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "停在了她的身上，而它");
         }
         if(get_player().cocks[0].cockLength < 20)
         {
            outputText("几乎和她的整个躯干一样长");
         }
         else
         {
            outputText("比她还要大");
         }
         outputText("这让你产生了一个邪恶的念头。[pg]");
         outputText("你双腿大张地坐在地上，抓着这个小地精婊子，让她那相对微小的肉缝抵在你" + get_player().cockDescript(_loc1_) + "的顶端。她终于从昏迷中清醒过来，脸上闪过极度纠结的神情，她对肉棒和精液的渴望与她的求生本能展开了激烈的交锋。就在即将落败的边缘，当她感觉到你" + get_player().cockDescript(_loc1_) + "的" + get_player().cockHead(_loc1_) + "开始撑开她的" + get_monster().vaginaDescript() + "所带来的疼痛时，那些本能突然重整旗鼓，击退了她的欲望。她拼尽全力抵抗，但在你这样抓着她的情况下，这不过是徒劳地胡乱挥舞，用脚蹬着你的" + get_player().cockDescript(_loc1_) + "，简直就像在爬树干一样——从她的角度来看，那肯定就像一根树干。[pg]");
         outputText("你们俩都因为各自的用力而汗流浃背，你慢慢开始意识到，她拼命的挣扎和她" + get_monster().vaginaDescript() + "的紧致结合在一起，会让你无法进行你一直期待的插入。然而，当你开始考虑射在她的喉咙里时，一股黑暗的冲动涌上心头，另一个主意在你的脑海中闪过。[pg]");
         outputText("当地精感觉到你不再把她往下压向你的" + get_player().cockDescript(_loc1_) + "时，她稍微放松了一点。当你把她的小穴凑到唇边开始品尝时，她绝对兴奋到了极点。你的舌头在她" + get_monster().vaginaDescript() + "的内外游走，直到你把她的小肉核从藏身处哄了出来。你用嘴唇包裹住它，开始施展你的腐化之力。当你把这个地精荡妇推向高潮时，你用一种在恶魔军团之外罕见的专业技巧挑逗着她的阴蒂，腐化的能量从你的舌头传出，穿过她的阴蒂，深入她的核心。当她尖叫着高潮时，你从她身上移开，欣赏着你恶魔般杰作的外在迹象。原本普通大小的爱之蕾已经肿胀到了原来的五倍，变成了一颗骄傲、充血的阴蒂……而且，你放大的可不止这一个地方。[pg]");
         outputText("你重新摆弄你的性玩具，让她背对着你，再次将你的" + get_player().cockDescript(_loc1_) + "抵在她的" + get_monster().vaginaDescript() + "上。她再次挣扎，但在高潮之后，她已经没有力气进行像样的反抗了；现在她是在对抗不可避免的命运，她所有的抵抗只会让你更加兴奋。你开始把她往下压向你自己。[pg]");
         outputText("[say: 太大了……]她虚弱地说。龟头挤了进去。[pg]");
         outputText("[say: 你会杀了我的……]她恳求道。剩下的龟头也跟着进去了。[pg]");
         outputText("[say: 停下……]她哀求着。肉棒开始沉入。[pg]");
         outputText("[say: 不要……]更多的肉棒进入了她娇小的身体。[pg]");
         outputText("[say: 求你……] 她被填满了。[pg]");
         outputText("[say: 求你……] 甚至超出了极限。[pg]");
         outputText("[say: ……操我。][pg]");
         outputText("你将留在外面的那截" + get_player().cockDescript(_loc1_) + "狠狠地捅进了你新收的肉便器体内。这足以让这个婊子高潮，而你甚至还没真正开始。你");
         if(get_player().cocks[0].cockLength < 20)
         {
            outputText("能感觉到她腹部巨大的凸起");
         }
         else
         {
            outputText("把她撑得太满，以至于你从这个角度都能看到凸起");
         }
         outputText("，这让你的欲望更加高涨。你从洞里抽出的肉棒比这个饥渴荡妇的身体还要长，当她的" + get_monster().vaginaDescript() + "紧紧夹住你时，她翻着白眼再次高潮了。每一次你拔出或狠狠捅入都会让她爽到极点，以至于当你们俩都四肢着地，像一对野兽一样交配时，她只能躺在那里，大张着嘴，几乎要口吐白沫");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，她的头靠在你的[breasts]之间");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("，而你的[nipple]");
               if(get_player().biggestLactation() < 2)
               {
                  outputText("偶尔会滴下乳白色的泪珠落在她的脸上");
               }
               if(get_player().biggestLactation() < 3)
               {
                  outputText("流下股股乳汁洒在她的面庞上");
               }
               else
               {
                  outputText("喷出大量的液体糊了她一脸");
               }
            }
         }
         outputText("。她的头发被");
         if(get_player().biggestLactation() >= 1)
         {
            outputText("乳汁和");
         }
         outputText("你们俩的汗水黏在一起，她唯一发出的声音就是每隔几次高潮后偶尔发出的狂喜的咕噜声。[pg]");
         outputText("[say: 好了，婊子。你想要我的孩子？给。你。射。满！]你大喊道。然而，");
         if(get_player().hasVagina())
         {
            outputText("当你的" + get_player().vaginaDescript(0) + "");
            if(get_player().vaginas[0].vaginalWetness <= 3)
            {
               outputText("流出淫液");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("泛滥成灾");
            }
            else
            {
               outputText("喷发而出");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("，而你其余的[cocks]将她浇透时，");
            }
         }
         else if(get_player().cockTotal() > 1)
         {
            outputText("而你另一根" + Appearance.cockNoun(CockTypesEnum.HUMAN));
            if(get_player().cockTotal() > 2)
            {
               outputText("将她浸透，");
            }
            else
            {
               outputText("将她浸透，");
            }
         }
         outputText("这婊子太紧了！简直就像天然的阴茎环！");
         if(get_player().balls >= 2)
         {
            outputText("你的[balls]正努力着，但她");
         }
         else
         {
            outputText("她");
         }
         outputText("痉挛的" + get_monster().vaginaDescript() + "紧紧夹住你的" + get_player().cockDescript(_loc1_) + "，让你无法释放。[pg]");
         outputText("高潮的瞬间过去了，你却没有得到满足。这只会让你更加火大，因为你的精液容器没能尽到她唯一的责任。然而，你并没有气馁。事实上，你加倍了努力。如果这个喜欢大尺寸的荡妇想在自己爽的同时拒绝给你回报，好吧，你只能在下一回合把她操到失去意识了。[pg]");
         outputText("在接下来的几个小时里，你几乎把她那颗绿色小脑袋里的脑浆都给操出来了，让自己再次回到了高潮的边缘。你考虑过这次要不要拔出来，但还是决定不拔。至少两发的量一次性射进去；这会有用的，而且这婊子也是自找的。[pg]");
         outputText("[say: 让我们。再。试。一次！]你大喊着，把你们俩拉回坐姿，并让你们俩都弓起背。[pg]");
         outputText("你的" + get_player().cockDescript(_loc1_) + "紧紧地贴着她的皮肤，以至于你可以看到精液顺着你的肉棒向上涌出，仅仅第一发就让你的地精玩具胀大了起来。");
         if(get_player().cockTotal() > 2)
         {
            outputText("你剩下的[cocks]向空中喷射出精液的间歇泉，把你们俩都涂满了你的精液。");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("你剩下的阴茎向空中喷射出精液的间歇泉，把你们俩都涂满了精液。");
         }
         outputText("第一次阻止你射精的那种紧致感，现在确保了你射入她体内的大量精液在你拔出之前一滴也不会漏出来。幸好你的腐化如此有效，因为她现在看起来已经像怀了一个沙滩排球那么大了。[pg]");
         outputText("最后，你把最后一发精液射进了这个新搞到手的屁股里，把她从你的" + get_player().cockDescript(_loc1_) + "上推开，让她摔在地上。撞击让她体内的精液如洪流般涌出。[pg]");
         outputText("你站起身准备离开，低头看着你刚刚完事的地精荡妇。[pg]");
         outputText("[say: 我希望我的女儿们比她们的婊子母亲更好操，]你说。[say: 告诉她们，如果她们也想被劈成两半，就来找我。]");
         outputText("[pg]她绝对会的。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function manRapesGoblinTooBig() : void
      {
         clearOutput();
         get_images().showImage("goblin-win-male-corruptedbj");
         var _loc1_:int = get_player().biggestCockIndex();
         spriteSelect(SpriteDb.get_s_goblin());
         outputText("你掏出你正在变硬的雄风，展示出它");
         if(get_player().cockArea(_loc1_) < 80)
         {
            outputText("几乎");
         }
         outputText("荒谬的尺寸。地精女孩震惊地看着眼前的景象，眼睛瞪得像餐盘一样大。知道你无论尺寸是否匹配都会尝试，她张开双腿，让自己在地上躺得更舒服些。[pg]");
         outputText("你");
         if(get_player().cor < 50)
         {
            outputText("耸耸肩，心想既然她准备好了，你也不妨试一试");
         }
         else
         {
            outputText("咧嘴一笑，很乐意尝试用你的尺寸撑开她");
         }
         outputText("。那");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("龟头冠状沟");
         }
         else
         {
            outputText("龟头");
         }
         outputText("，连同你的" + get_player().cockDescript(_loc1_) + "在兴奋中明显地跳动着，你将它擦过她已经湿滑的肉褶。她在你身下扭动，显然很享受你抵住她穴口的感觉。你以极其缓慢的速度开始向前推进，感受着她的身体被你的");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("龟头冠状沟");
         }
         else
         {
            outputText("龟头");
         }
         outputText("，但经过片刻的努力后，那狭小的通道便无法再扩张了，你确信如果再强行塞入，一定会弄伤她。[pg]");
         outputText("不满于这种挑逗，你拔了出来，将它滑到她的躯干上，把她压在你的" + get_player().cockDescript(_loc1_) + "下面，把她的汁液涂在她的脸和身体上。她的乳房被挤压得刚好让她那勃起的紫色小乳头从两边露出来。这个小荡妇看起来松了一口气，而且被挑逗得不轻。她舔了舔嘴唇，高兴地说，[say:谢谢你，亲爱的，我想你差点把我撕成两半！别担心，我非常乐意被你的精液浸透，]说着，她用手臂和双腿缠住了你");
         if(get_player().hasKnot(0))
         {
            outputText("用脚跟勾住你肉结后方");
         }
         outputText("。[pg]");
         outputText("[say:她很擅长这个，]你暗自思忖。她开始在你身下摩擦，用双腿像活塞一样带动整个身体在你的肉棒上下套弄，她的手臂和双手以惊人的热情抚摸和爱抚着你。这种感觉非常强烈——这些地精确实知道如何取悦一个");
         if(get_player().get_gender() == 3)
         {
            outputText("扶他");
         }
         else
         {
            outputText("男人");
         }
         outputText("，这是肯定的！你兴奋得开始滴水，一滴调皮的液体溅到了地精的脸上。当她眨眼将其抹去时，她的笑容反而更灿烂了。一道温暖湿润的痕迹舔舐着你的龟头，地精开始贪婪地吞咽你的先列腺液，甚至直接从你的尿道口舔舐。你的[hips]抽搐着，当她紧紧抱住你的阴茎时，甚至将她从地上抬了起来。[pg]");
         outputText("你绝不会想到这样的行为会如此令人愉悦，但这感觉实在太棒了。你失去了控制，将一股滚烫的精液喷射在地精的脸上。她语无伦次地嘟囔着，试图擦去眼睛上的精液，这时你的下一股精液正中她的额头，让这个活泼的女人失去了平衡。她松开了紧握着你痉挛的" + get_player().cockDescript(_loc1_) + "的手，重重地摔在地上。你向后退了一步，随着高潮的结束，你的肉棒在空中晃动着，");
         if(get_player().cumQ() < 75)
         {
            outputText("又将浓稠的精液溅了她几下。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("给她涂上了一层厚厚的精液。");
         }
         else
         {
            outputText("把她浸透，让她躺在一滩浓稠的精液中。");
         }
         outputText("这个绿皮荡妇似乎应对得很好，甚至还把你的精液舀起来，在自慰时揉进她的小穴里。她看着你重新穿好衣服，舔了舔嘴唇，沾满精液的脸上挂着性感的微笑，[say:你的味道和我预想的一样好，猛男！也许下次把那个坏小子缩小点，再来找我好好玩玩，好吗？希望到那时，我塞进小穴里的这些精液能让我挺起个大肚子给你摸！][pg]");
         outputText("你摇了摇头，转身离开，这次经历让你感到有些精疲力尽，但也松了一口气。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function laySomeDriderEggsInGobboTwat() : void
      {
         clearOutput();
         get_images().showImage("goblin-win-drider-egged");
         outputText("这个可怜的绿皮小生物试图从你身边爬走时可怜的挣扎，让你相当清楚地看到了她流口水的小穴。当你感觉到自己");
         if(get_player().hasCock())
         {
            outputText("变硬");
         }
         else if(get_player().hasVagina())
         {
            outputText("变湿");
         }
         else
         {
            outputText("抽搐");
         }
         outputText("稍微有点，你忍不住注意到了你蜘蛛那一半越来越重的重量。再次低头看着地精，你决定也许你们都能得到一些……<i>类似于</i>你想要的东西。");
         outputText("[pg]你迅速脱下衣服，爬向那个抽泣的荡妇，伸手把她拉起来，让她面对着你。你一只手臂穿过她的腋下，用空着的手戳了戳她柔软的肚子，询问她孩子的情况。");
         if(get_player().get_femininity() > 50)
         {
            outputText("[pg][say: 什-什么？你- 我没有孩子，你这个蠢货！这就是你觉得好玩的事吗，混蛋？落井下石？！]");
         }
         else
         {
            outputText("[pg][say: 什-什么？你- 我没有孩子，你这个混蛋！这就是你觉得好玩的事吗，混蛋？落井下石？！]");
         }
         outputText("她用脚踢你，但毫无力气，随着眼角开始聚集泪水，她撅起的嘴唇更加明显了。");
         outputText("[pg][say: 放开我，放开我！]她扭动着身体，你把另一只手滑到她的腋下，帮着按住她。你把她推得离你远一点，开始把你的蜘蛛腹部卷到身下。你已经可以看到你的产卵管从甲壳里探出头来，随着你的心跳抽动着，绿色的润滑液滴得你下盘到处都是。");
         outputText("[pg]你的地精玩物安静了下来，盯着你众多腿之间那根越来越粗的肉棒。");
         outputText("[pg][say: 什么？那是什么？那是干什么用的？]她紧张的语气掩盖不住顺着大腿流下的兴趣。你把她拉近，把她举在你的产卵管上方，亲吻她的额头，向她保证她会得到她梦寐以求的所有孩子。她矛盾的笑容和沉重的喘息让你的心跳加快了一点，当你用滑溜溜的肉棒刺穿这个紫发女人的时候，所有的回答都被打断了。");
         outputText("[pg]当你像对待一个活生生的性玩具一样上下操弄她，尽可能多地把你自己塞进她体内时，她压抑的喘息和呻吟从唇间溢出。你的地精妓女脸上泛起深深的红晕；她的一只手扭动拉扯着自己的乳头，咬着嘴唇，而另一只空闲的手则兴奋地按摩着你每次抽插造成的凸起。你的甲壳上沾满了她的体液和你缓慢渗出的蛛形纲动物卵润滑液的混合物。");
         outputText("[pg]你终于插到底了，把这个绿色的精液套一直往下推，直到你感觉到你的粗壮擦过她的子宫颈。你把手从她的腋下抽出来，重新放在她的肩膀上，把她固定在原地，迎接即将到来的事情。当第一波润滑液强行进入她体内时，她的肚子微微凸起，她幸福地喘息着，双手抚摸着她的“孕肚”。当你感觉到你的下半身收紧颤抖时，你自己的笑容也变得更灿烂了，因为第一批卵正强行顺着你的产卵管往上爬。");
         outputText("[pg]你感觉到它缓慢地进入地精体内，你的产卵管在它周围张开，直到它停在她的子宫口前。她从肚子上抬起头，睁大眼睛盯着你，只看了一秒钟，一阵强烈的痉挛就迫使卵穿过了她紧闭的子宫颈。这个微型的妓女抽搐着，翻着白眼，舌头耷拉着，高潮迭起，一股女孩的精液喷洒在你的甲壳上。");
         if(get_player().hasCock())
         {
            outputText("你自己的高潮也同样强烈，[eachCock]有力地喷洒在你的躯干上");
            if(get_player().hasVagina())
            {
               outputText("和");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]与她同步收紧，你丰富的体液浸透了你的蜘蛛下半身。");
         }
         outputText("[pg]然后下一个卵滚上前来，接着是下一个，再下一个……");
         outputText("[pg]你把她按在你的身体上，把她填满，一次一颗，每一颗球都让被撑开的肚子稍微膨胀一点，直到她被填得满满的，你可以透过她紧绷的肚皮感觉到你的卵。地精几乎失去了知觉，无意识地发出咕噜声，瞬间怀孕的快感麻木了她的大脑。伴随着一声响亮湿润的“噗”声，你把她拔了出来，她抽搐的小穴流出源源不断的透明体液，以及一串粘稠的绿色卵液。");
         outputText("[pg]把她放在阴凉处，你穿上衣服，很高兴摆脱了额外的重量，准备继续你的冒险。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function goblinCondomed(param1:Number = 0) : void
      {
         spriteSelect(SpriteDb.get_s_goblin());
         var _loc2_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         clearOutput();
         get_images().showImage("goblin-win-male-goblincondomed");
         outputText("战败后，地精女孩双膝一软，向后瘫倒在地，她仰面躺着，翠绿色的脚踝悬在头顶。[say: 用我吧，]她乞求道，[say: 羞辱我，贬低我，践踏我！不管你做什么，只要填满我就行！]当你脱下[armor]时，她尽可能地张开双腿，这个放荡的女孩向你展示着她流着口水的小穴，肿胀的绿色阴唇上已经滴落着焦急的汗珠和渴望的爱液。她在泥土中扭动着，双手抓着自己丰满的臀部，满怀希望地为你把屁股翘到半空中。你几乎能感觉到这个小荡妇渴望精液的阴道散发出的热量，发情的狂热让她的眼神变得呆滞而迷离。站在她上方，很明显她现在唯一能意识到的，只有她双腿间跳动的小穴和你那勃起的肉棒。[pg]");
         outputText("她不耐烦地伸出双腿，用脚趾勾住你的下半身，试图把你拉近，同时仍然保持她那饥渴的洞口敞开。她橄榄色的双脚紧紧夹住你的肉体，坚实有力的脚底在你的[skinfurscales]上摩擦，沿着你的[hips]外侧上下滑动。地精的脚跟滑过你的大腿，将双脚并拢在你的" + get_player().cockDescript(_loc2_) + "两侧，她那翡翠般肌肤的脚掌抵着");
         if(get_player().balls > 0)
         {
            outputText("你那跳动的阴囊");
         }
         else
         {
            outputText("你肉棒的根部");
         }
         outputText("而她的脚趾则像粗壮的手指一样卷曲着包住你的阴茎。起初她只是缓慢地抚摸着你，随后这个石灰色的女孩加快了节奏，交替着用脚背和小腿之间柔软丝滑的肌肤拥抱你，利用脚踝的紧实感按摩你的肉棒，直到它完全勃起。在她的双脚间颤抖着，一滴滴先列腺液开始从你的顶端渗出，几乎透明的液滴顺着你的龟头滚落。地精用她的大脚趾虔诚地收集起这些温暖的液体，让它们欢快地在每个脚趾间流淌，然后用坚定的抚摸将它们重新涂抹在你的肉棒上，像抹油一样将这些无籽的精液揉进你的肉体，她的双脚在你的体液下闪烁着海蓝宝石般的光泽。[pg]");
         outputText("此时，一滩过度刺激产生的淫液已经在那个淫荡的女孩身下汇聚成湖。她淫荡地呻吟着，手指依然抠着自己的臀瓣，你意识到地精仅仅是给你做足交就已经高潮了。她太需要你的肉棒了，简直到了可悲的地步，一个邪恶的念头在你的脑海中闪过。你抓住她沾满先列腺液的滑溜双脚，手指沿着她被精液软化的肌肤滑动，挠痒并摩擦着她的脚底，直到女孩在狂喜中尖叫起来，紧闭双眼，她那气喘吁吁的欲望变得如此强烈，以至于她再也无法将手从自己的小穴上移开。伴随着溢出的淫液温暖的飞溅声，她将右手的指头抠进她那翠绿色的裂隙中，左手则以越来越大的圆圈快速揉搓着她那翡翠般的阴蒂，震动让她的屁股在森林地表被她弄成的泥泞中剧烈晃动。趁她分心的时候，");
         if(param1 == 0)
         {
            outputText("你运转起你的吐丝器，这个精巧的器官编织出一个细密蜘蛛丝制成的细长护套，你小心翼翼地将粘性股线留在柔韧避孕套的惰性层之间。把它滑到你的" + get_player().cockDescript(_loc2_) + "上，你惊叹于它是如此轻盈！你甚至能感觉到微风吹过这层丝质覆盖物。");
         }
         else
         {
            get_player().destroyItems(get_useables().CONDOM,1);
            outputText("你撕开包装，将乳胶避孕套滑到你的" + get_player().cockDescript(_loc2_) + "上，惊叹于它是如此透明和闪亮。你觉得地精直到为时已晚才会注意到它！");
         }
         outputText("是时候给地精她所要求的了，即使那不是她想要的。[pg]");
         outputText("你依然抓着她扭动的双脚，弯下腰，尽可能地将她的双腿拉开，肌肉被拉伸得越来越宽，她的大腿内侧紧紧抵抗着这股拉力。增加的压力加上她自己疯狂的自慰，让女孩迎来了又一次高潮，这一次她喷涌的爱液化作堕落欲望的水晶溪流向上喷射，温暖地拍打在你的腹部。她的双臂垂在身体两侧，手心向上，手指抽搐着，为你那" + get_player().cockDescript(_loc2_) + "清理出了一条通往她为你精心准备的颤抖绿色小穴的道路。推开她肿胀的阴唇，你发现她是如此湿润，以至于你几乎是直接滑了进去，当你用坚挺的男子气概填满她时，她那因高潮而饱受折磨的肌肉不规则地痉挛着。[say: 哦，是的，你终于找到你的肉棒了，]她喘息着，嘴里冒着口水泡。[say: 像恨我一样抽插我，你这混蛋，]她要求道，你抓住她的脚踝把她往上拉，把她进一步拉到你跳动的肉棒上，当她深绿色的内褶在你突进的长度前分开时，她那滴水的小穴吸吮着你的肉棒。[say: 我不是玻璃娃娃，你这胆小鬼，就他妈的插进来！]她尖叫着，手指抓挠着地面，向上挺动着身体，想让你更多地进入她体内。[pg]");
         outputText("这个嘴碎的婊子显然忘了是谁输了战斗，看来，你决定提醒她一下。你把她的腿当作杠杆，把她在你的肉棒上扭转过来，让她旋转了180度，让她趴在自己的奶子上，屁股翘起，同时你把肉棒剩下的部分狠狠地插进这个橄榄色皮肤的慕男狂体内。她闷哼了一声，刚想再说点什么，但你向前一推，把她的脸按进了泥里，让她还没来得及说出口，嘴里就塞满了她自己爱液浸透的泥土，发出一声狂喜的咕噜声。她的双腿挣扎着反抗你的抓握，向各个方向抽动着，她滑溜溜的双脚几乎要从你手中滑落。你咬紧牙关，开始尽可能用力地操她那流着口水的小穴，渴望驯服这个女孩那狂躁的阴道。把她汗水浸透的大腿猛烈地撞击在你的[hips]上，你的抽插变得近乎野蛮，当你把她的私处拍打在你的腹股沟上时，她的臀部泛起了深深的红晕，那个秘密的避孕套完美地发挥了作用，在你的" + get_player().cockDescript(_loc2_) + "上薄如蝉翼。[pg]");
         outputText("浑身是汗和泥土，这个翡翠色的女孩扭动着翻过身来，当她戳着自己腹部的凸起时，脸上露出了困惑的表情。[say: 怎么……感觉不对劲，]她嘟囔着，双手按压着自己的皮肤。用一根长长的中指检查着她的小穴，她把它拔出来时干干净净，没有她预期的象牙色奶油。[say: 搞什么鬼？避孕套？]她尖叫道。[say: 你这混蛋！]她以越来越疯狂的动作按压着自己的肚子，当那个装满精液的气球完好无损地弹回来时，她张大了嘴巴。[say: 为什么它不破？]她质问道。");
         if(param1 == 0)
         {
            outputText("你礼貌地告诉她，蜘蛛丝非常结实，而且非常粘。她把手指伸进裂隙，试图把它拉出来，当她感觉到内壁被粘稠的蛛网拉扯时，她倒吸了一口凉气。尽管她尽了最大努力，那个丝质气泡依然停留在你留下的地方，被你那具有束缚力的蛛网紧紧地粘在原处。你大笑着祝她好运，然后收拾好衣服走开了。地精女孩充满了精液，却无法让任何一滴进入她的子宫，她无助地呻吟着，绝望地抠弄着自己，仿佛她的高潮能把留在她体内的宝藏排出体外。");
         }
         else
         {
            outputText("你礼貌地告诉她，乳胶很结实，能有效避孕。你大笑着祝她好运，然后收拾好衣服走开了。地精女孩充满了精液，却无法让任何一滴进入她的子宫，她无助地呻吟着，绝望地抠弄着自己，仿佛她的高潮能把留在她体内的宝藏排出体外。");
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function goblinAssassinEncounter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_goblin());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1035) == 0)
         {
            outputText("一根针在空中呼啸而过，落在你的脚边。玻璃管侧面精细的工艺只让你得出一个结论——它的主人拥有这片土地上罕见的精密机械和制造能力。");
            outputText("[pg]当针的主人现身时，你准备好你的[weapon]，她从高处跳到泥土中。那是一个地精，但带着一种自信和沉着的气质，显然是一个经验丰富的战士。无论你是否打算战斗，这个地精都不打算让你完好无损地离开。");
         }
         else
         {
            outputText("当一个模糊的黑影落在你面前时，一个熟悉的景象引起了你的注意——另一个地精刺客似乎在这些地方潜伏。当她系上一条装满各种针的腰带并摆出战斗姿态时，你准备好你的[weapon]。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1035,FlagDict_Impl_.arrayReadInt(_loc1_,1035) + 1);
         unlockCodexEntry(2040);
         startCombat(new GoblinAssassin());
      }
      
      public function gobboGetsRapedMaleFits() : void
      {
         spriteSelect(SpriteDb.get_s_goblin());
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         clearOutput();
         get_images().showImage("goblin-win-male-getridden");
         if(get_player().cockArea(_loc1_) > get_monster().vaginalCapacity() * 0.8)
         {
            outputText("你抱起被击败的地精，打量着她。她可怜巴巴地将双臂交叉在胸前，问道：[say:现在怎么办？] 她的眼睛在你以为没注意的时候往下瞟。看到你那" + get_player().cockDescript(_loc1_) + "的尺寸，她脸上短暂地闪过一丝痛苦的表情。你产生了一个想法，要给她塞进她无法承受的巨根，于是你把她放低，对准你的" + get_player().cockDescript(_loc1_) + "。龟头滑入她湿润的肉褶之间，撑开了她，同时也减轻了你手臂上的一些重量。她微微皱眉，尽可能地将双腿盘在你的[hips]上。[pg]");
            outputText("你开始走动，让你的动作配合重力，使你毫不费力地插入了她。当她滑下时，那肿胀湿润的肉壁紧紧地夹住了你，");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("痛苦地摩擦着你恶魔般的肉突");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("痛苦地撑开以容纳你的肉结");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE || get_player().cocks[0].get_cockType().get_Index() > 3)
            {
               outputText("紧紧地包裹着你，甚至有些胀痛");
            }
            outputText("。每动一下，她就向下滑得更深，将自己撑到了极限，直到她几乎完全被你贯穿地坐在你身上，抓住了你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText(get_player().allBreastsDescript());
            }
            else
            {
               outputText("躯干");
            }
            outputText("来支撑自己。随着这个绿皮女孩的呼吸，一阵稳定的脉动按摩着你。你意识到她的身体到底有多少空间是用来容纳这些巨大的肉棒的，难怪地精在战斗中如此脆弱！[pg]");
            outputText("她快乐地喘息着，舌头从嘴里伸了出来，感叹道：[say: 好满……] 尽管体内的巨物仍让她有些吃痛，但她开始为你加油打气：[say: 哦哦哦，快——啊——再快点！我想颠起来！][pg]");
            outputText("这就是你需要的全部鼓励，你开始奔跑起来，感受着她轻盈的身体在你的" + get_player().cockDescript(_loc1_) + "上颠簸，引出一阵阵混杂着快乐的哀号、呻吟和轻微痛呼的叫声。她的小拳头紧紧抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("奶子");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("，她紧紧抓着你，收紧身体，将丰满的乳房撞向你。你用力奔跑，感受着她的颠簸和扭动，她的小穴和急促的呼吸以前所未有的方式挤压、榨取着你。你确信，如果每次慢跑都能有这种感觉，你的身材一定会很棒。[pg]");
            outputText("[say: 哦，操，猛男，颠我！对，就是这样，]她呻吟着，[say: 你要射了吗？我的天，求你射出来，我需要你像这样把我填满！][pg]");
            outputText("即将高潮的熟悉紧绷感在你的腹股沟蔓延，随着你接近释放而收紧。你加快了步伐，全力冲刺，任由女孩紧紧抱住你时弹跳晃动，完全由你的" + get_player().cockDescript(_loc1_) + "支撑着。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]收紧，释放出高潮的种子。");
            }
            outputText("强烈高潮的嚎叫声充满你的耳朵，你的射精让这个绿色的小肉便器也达到了高潮。她的一只手松开，开始抚摸自己的肚子，同时亲吻和舔舐你的肚脐。");
            if(get_player().cumQ() >= 100)
            {
               outputText("你强化的身体轻松地将她填满精液，使她的肚子微微凸起，你的种子深深埋在她的子宫里无处可逃，她的小穴被你的" + get_player().cockDescript(_loc1_) + "紧紧堵住。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("这次高潮如此强烈，以至于当你平息下来时，她看起来就像怀了一个健身球那么大的孕肚。你的精液被困在她的体内，在她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间找不到任何缝隙。");
            }
            else if(get_player().cumQ() >= 250)
            {
               outputText("这次高潮如此猛烈，以至于当你平静下来时，她看起来就像是怀胎十月。你的精液被困在她的体内，无法在她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间找到任何缝隙流出。");
            }
            outputText("[pg]");
            outputText("你喘着气停下来，把被填满的地精从你身上拉下来放在地上，满意地微笑着，看着你的精液");
            if(get_player().cumQ() >= 250)
            {
               outputText("像河水一样涌出");
            }
            else
            {
               outputText("漏出");
            }
            outputText("从她现在大张的小穴里流出。她揉着肚子，向你飞吻，还在努力平复呼吸。你得意地笑了笑，开始穿衣服。穿好后，你转身离开，但她最后一次对你喊道：[say: 嗯嗯嗯，希望你不介意我再来找你。我需要更多你的精液，这样我才能给你生很多漂亮的小骚货操！][pg]");
            if(get_player().cor > 50)
            {
               outputText("轻笑");
            }
            else
            {
               outputText("颤抖着");
            }
            outputText("，你心满意足地回到了营地。");
         }
         else
         {
            outputText("你抱起被打败的地精，打量着她。她可怜巴巴地将双臂交叉在胸前，问道：[say: 现在怎么办？] 当她以为你没注意时，她的眼睛向下瞟去。你暗自思忖“英雄所见略同”，然后把她放低，靠近你的" + get_player().cockDescript(_loc1_) + "。龟头滑入她湿润分开的肉褶之间，擦过她的入口，为你分担了她的一些重量。她变成了斗鸡眼，开心地笑着，双腿尽可能地缠绕在你的[hips]上。[pg]");
            outputText("你开始走动，让动作配合重力，让你毫不费力地插入她。当她滑下时，那肿胀湿润的肉壁紧紧地夹住你");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("完美地摩擦着你的恶魔凸起");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("紧紧地撑开包裹住你的肉结");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE || get_player().cocks[0].get_cockType().get_Index() > 3)
            {
               outputText("感觉完美地包裹着你");
            }
            outputText("。你每走一步，她就向下滑动得更深，直到她完全被你刺穿，抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText(get_player().allBreastsDescript());
            }
            else
            {
               outputText("躯干");
            }
            outputText("来支撑自己。随着绿皮女孩的呼吸，一阵稳定的脉动按摩着你，让你意识到她的身体有多少是为了容纳巨大的阴茎而生的。[pg]");
            outputText("她开心地喘着气，舌头从嘴里伸出来，为你加油打气，[say:哦，快——啊——再快点！我想弹起来！][pg]");
            outputText("这就是你需要的全部鼓励，你开始奔跑，感觉她轻盈的身体在你的" + get_player().cockDescript(_loc1_) + "上弹跳，引出一阵阵快乐的哀嚎和呻吟。她的小拳头紧紧抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("奶子");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("她紧紧地挂在你身上，丰满的乳房紧贴着你。你奋力奔跑，感受着她的弹跳和扭动，她的小穴和急促的呼吸开始以前所未有的方式挤压和榨取你。你确信，如果每次慢跑都能有这种感觉，你的身材一定会很棒。[pg]");
            outputText("[say:哦，操，种马，让我弹起来！对，就是这样，]她呻吟着，[say:你要射了吗？哦，天哪，求你射吧，我需要你这样填满我！][pg]");
            outputText("高潮即将来临的熟悉紧绷感在你的腹股沟蔓延，随着你接近释放而越发强烈。你加快了速度，全力冲刺，让女孩在你身上颠簸摇晃，她紧紧地攀附着你，完全由你的" + get_player().cockDescript(_loc1_) + "支撑着。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]收紧，释放出高潮的种子。");
            }
            outputText("强烈高潮的嚎叫声充满你的耳朵，你的射精让这个绿色的小肉便器也达到了高潮。她的一只手松开，开始抚摸自己的肚子，同时亲吻和舔舐你的肚脐。");
            if(get_player().cumQ() >= 250)
            {
               outputText("你强化的身体轻松地将她填满精液，让她的肚子微微凸起，并滴落在你的");
               if(get_player().balls > 0)
               {
                  outputText(get_player().ballsDescriptLight());
               }
               else
               {
                  outputText("腿上");
               }
               outputText("。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("这次高潮如此猛烈，以至于当你平静下来时，她看起来就像是怀胎十月，你的精液从她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间能找到的任何缝隙中喷射而出。");
            }
            outputText("[pg]");
            outputText("你喘着气停下来，把被填满的地精从你身上拉下来放在地上，满意地微笑着，看着你的精液");
            if(get_player().cumQ() >= 250)
            {
               outputText("像河水一样涌出");
            }
            else
            {
               outputText("漏出");
            }
            outputText("从她现在大张的阴户中流出。她抚摸着肚子，向你飞吻，仍在努力平复呼吸。你得意地笑了笑，开始穿衣服。穿好后，你转身离开，但她最后一次对你喊道，[say:嗯，希望你不介意我再去找你。我需要更多你的精液，这样我才能给你生很多漂亮的小荡妇来操！][pg]");
            if(get_player().cor > 50)
            {
               outputText("轻笑");
            }
            else
            {
               outputText("颤抖着");
            }
            outputText("，你心满意足地回到了营地。");
         }
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
      }
      
      public function gobboGetsRapedFem() : void
      {
         spriteSelect(SpriteDb.get_s_goblin());
         clearOutput();
         if(get_player().isTaur())
         {
            get_images().showImage("goblin-win-female-taur-rapedfem");
            outputText("你把地精抱起来，用手臂紧紧地夹在身侧。你从她那淫荡的衣服上撕下一块柔软的皮革，把她的双手绑在背后，以防万一。她抬头看着你，眼睛睁得大大的，一想到要任由一个比她大得多的生物摆布，她就感到害怕。尽管如此，如果沾染在你侧腹上的淫液能说明什么的话，她似乎还是有点兴奋的。你低头看着她，说道：[say:原来这小婊子还有受虐倾向啊？][pg]");
            outputText("她脸红了，随着她的点头，女性液体的流动变得更加浓稠。你知道她可能会喜欢你对她做的任何性行为，所以你还不如给她个惊喜。一个残忍的想法在你的脑海中形成——报复她试图给你下药。你轻松地从她的腰带上扯下腰包，随机拿出几个瓶子。地精明白了你的意图，开始挣扎着想要挣脱，但你轻松地制服了这个较小的女人，强迫她把药水一瓶接一瓶地喝下去。当她试图吐出来时，你按摩她的喉咙，触发她吞咽的本能。[pg]");
            outputText("到了第三瓶，她已经放弃了挣扎，转而试图寻找你身体的某个部位来摩擦。她张大嘴巴，整张脸都因为欲望而涨得紫红。你强行喂完剩下的瓶子，然后放开她，在她落地前抓住了她的脚踝。她发情的味道以及所有药物和催情剂的蒸汽让你有点“接触性兴奋”，至少在某种意义上，你的" + get_player().vaginaDescript(0) + "滴下了女性的淫液。你的性欲可以等等。这个荡妇需要受到惩罚。[pg]");
            outputText("你把这个生物翻转回你的臂弯里，这次让她面向相反的方向。*啪！*你的手拍在她圆润的屁股上。你收回手，感觉到她突出的阴唇带来的湿润。这个小婊子的阴道因为需求而发炎，以至于仅仅是打一下屁股她就几乎要喷水了。你又拍了她一下，看着她全身紧绷，感觉到她的体液溅到你身上。[say:你把我弄湿了，你这个婊子！！坏婊子！]你骂道，打得更重了。[pg]");
            outputText("地精尖叫起来，虽然你无法确定那是出于快乐还是痛苦。你开始越来越用力地打她的屁股，在反复的虐待下，她的屁股从绿色变成了红色。她的整个身体开始抽搐并喷水，把她的蜜汁溅到了你的手臂上。她居然高潮了！好吧，在看了这种表演之后，她也得让你高潮——否则有她好看的！[pg]");
            outputText("这次你真的把她扔了下去，但不给她站起来的机会，粗暴地把你的" + get_player().vaginaDescript(0) + "推到她身上。她对着你挣扎，太沉迷于自己的快感而没有意识到发生了什么。她的小拳头无力地打在你的大腿上，感觉出奇的好，你允许它继续一段时间，直到你有了足够的“前戏”，开始粗暴地用你的阴部摩擦她的脸，让她的舌头滑进你的阴唇。[pg]");
            outputText("你看不见她在做什么，但她的挣扎很快就停止了，因为味道和气味触发了她去舔。你颤抖着；感觉比应该的要好得多。也许她的一些药水在她的嘴唇和舌头上留下了残留物，但你不在乎。当你后腿因为快感而发软时，你把相当大的重量压在这个小荡妇身上。她的反应是把手滑上来，敲打你的[clit]，试图让你从她身上下来。[pg]");
            outputText("她的努力得到了回报，你射在这个被下药的绿色婊子身上，在她的舌头上留下了阴道的味道。她的脸上带着一种奇怪的呆滞的微笑，她看起来处于某种介于清醒和睡眠之间的奇怪状态。你看着她在地上抽搐和扭动，大口喘气，不断高潮。虽然一开始你很担心，但抽搐开始减慢；这个小逼应该没事。[pg]");
            outputText("你随意地穿上衣服，无视了那个沉浸在极乐中的地精的喘息和呻吟，准备离开。你最后回头看了一眼，发现她的体液已经汇聚成了一个比她还大的水坑。她醒来后可能会有严重的宿醉。你叹了口气，小跑着离开了，对做得太过火感到有点内疚。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
         else if(get_player().isNaga())
         {
            get_images().showImage("goblin-win-female-naga-rapedfem");
            outputText("你滑行到无助的地精身边，她半是恐惧、半是好奇地看着你。");
            if(get_player().face.type == 5)
            {
               outputText("你对她露出獠牙，好奇心消失了。她转身想跑，但你的尾巴比她快。");
            }
            else
            {
               outputText("你对她微笑，恐惧消失了。不过她仍然很警惕，你确保在她改变对你的看法之前用尾巴抓住她。");
            }
            outputText("[pg]");
            outputText("你紧紧地缠绕着挣扎的猎物，在这个过程中脱掉了她淫荡的“衣服”。失去行动能力的地精哀怨地对你呜咽，你的回应是用手拍打她的阴部。把手拿开，你惊讶于它有多湿。你在她脸上擦干，把头低到她耳边。[pg]");
            if(get_player().cor > 60)
            {
               outputText("你对这个惊恐的女人发出嘶嘶声，她开始在你的抓握中颤抖。你笑着，手指滑进她的嘴里，她开始吸吮它们，试图安抚你。她的小舌头感觉棒极了；显然她在这方面非常有经验。");
               outputText("你用手指掰开她的嘴。她一脸困惑，但当你摆弄身旁的东西时，她根本无法反抗。当她意识到即将发生什么时，已经太迟了，你从她的腰包里掏出几个闪亮的烧瓶。作为她试图毒害你的惩罚，你开始把一瓶又一瓶的药水倒进她的嘴里，抚摸着她的喉咙，强迫她吞下去。[pg]");
            }
            else
            {
               outputText("你的手指在她的脸上滑动，问她是否为试图毒害你而感到抱歉。她拼命地向你点头，被勒得太紧或者太害怕而不敢回答。你对她愉快地笑了笑，感觉到她的身体在你的掌控中稍微放松了一些。你的手指滑进她的嘴里，她急切地吸吮着，显然不想惹怒你。她的舌头很灵巧，你享受了一会儿这种体验，直到你觉得已经把她玩够了。[pg]");
               outputText("你张开手指，撑开她的嘴，不让她闭上。困惑的地精试图看清你在她身边做什么，但却看不到。然而，当你从她的腰包里拿出一把闪亮的烧瓶时，她的身体再次紧绷起来，向你发出呜咽声。[pg]");
               outputText("你对这个生物的怜悯还不足以让你放弃惩罚她，你从那堆药水里挑出了一些看起来药效没那么猛的混合物。你一边温柔地抚摸她的喉咙以确保她吞咽，一边将一瓶又一瓶的药水倒进去。[pg]");
            }
            outputText("药效很快就显现出来了，没过多久，这个荡妇的皮肤就变成了紫红色，拼命地想在你的蛇尾上摩擦。她沮丧地喘息和呻吟着，因为她那滴着淫液的小穴无法从你光滑的下腹获得足够的快感，而你则在一旁等待，享受着这种感觉。[pg]");
            outputText("你将尾巴滑到她的小穴处，用尾尖捏了捏她的阴蒂。她立刻喷出一股液体，将你原本就湿滑黏稠的蛇尾彻底涂满了她的淫水。你在她面前摇了摇手指，警告她；你还没玩够呢。[pg]");
            outputText("你的尾巴顺滑地滑入她的体内，让她舒服地呻吟起来，并挺起臀部。你在她体内扭动，把她撑得那么大，你怀疑她会合不拢腿好一阵子。你的尾尖触到了她爱道的尽头，你惊讶地发现她的子宫在跳动，试图抓住一些不存在的东西。出于好奇，你将尾巴移到子宫口，它抓住了你，把你拖进了她的子宫。你对着这个快感超载的地精笑了笑，开始抚摸她的肉壁。她紧紧地夹住你，在狂喜中尖叫出声，双眼翻白。[pg]");
            outputText("毫无预兆地，你把整根尾巴拔了出来，感觉到一股巨大的液体从你身后滑落。地精几乎失去了意识，所以你在她的腰包里到处翻找，希望能找到点有用的东西。不过，似乎没有什么东西能帮上忙，你开始后悔自己太恶毒了，就在这时，你注意到在最底部有一个特别小的烧瓶。[pg]");
            outputText("你把它拿出来仔细检查。它只有一厘米多长，里面装满了白色的液体。上面有一个标签，但字太小了，根本看不清。你觉得你能认出[say:醒醒]这个词，但不太确定。[pg]");
            outputText("你耸耸肩，把里面的东西倒进地精的嘴里，只有一滴多一点，很快就被她的舌头吸收了。一开始什么也没发生，然后这个小小的身影开始剧烈地颤抖。你不知道该怎么办，只能保持原样，紧紧地抱着她。颤抖像开始时一样突然停止了，你觉得你可能杀了她。[pg]");
            outputText("不过，这很快就被证明是错的，因为她猛地睁开眼睛，大喊一声[say:呜呼——！]你被她态度的突然转变吓了一跳，但决定顺其自然，把你的" + get_player().vaginaDescript(0) + "塞进这个显然精力充沛的小家伙嘴里。[pg]");
            outputText("你听到一声含糊不清的叫喊[say:交给我吧，老板！]，她开始舔舐并轻轻咀嚼你。这种感觉太棒了，你忍不住想知道那个小瓶里装的是什么，但当你高潮时，这个念头就从你的脑海中消失了，你喷了她一身。[pg]");
            outputText("你一次又一次地高潮，地精不知疲倦，你倒进她嘴里的各种物质的残留物仍然涂在她的嘴唇和舌头上，让你不想停下来。最后你累了，把地精从你的蛇尾中释放出来。她双脚落地，做了一个脚尖旋转，在空地上跑了一会儿（一直像个疯女人一样咯咯地笑），然后脸朝下倒在她的“衣服”上。[pg]");
            outputText("你对刚才发生的事情感到彻底的困惑，决定不拿命运开玩笑，不留在这个被严重下药的生物附近，一拿好东西就立刻回营地。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
         else
         {
            get_images().showImage("goblin-win-female-rapedfem");
            outputText("你抱起地精，让她坐在你的膝盖上，用左手将她的双臂反绑在背后。你从她那荡妇般的衣服上撕下一块柔软的皮革，用来绑住她的手臂。她抬起头看着你，眼睛睁得大大的，一想到要任由一个更大的生物摆布就感到害怕。尽管如此，如果弄脏你膝盖的淫液能说明什么的话，她似乎被激起了不小的性欲。你低头看着她，说道：[say:看来这个小荡妇有受虐倾向啊？][pg]");
            outputText("她脸红了，随着她的点头，女性液体的流动变得更加浓稠。你知道她可能会喜欢你对她做的任何性行为，所以你还不如给她个惊喜。一个残忍的想法在你的脑海中形成——报复她试图给你下药。你轻松地从她的腰带上扯下腰包，随机拿出几个瓶子。地精明白了你的意图，开始挣扎着想要挣脱，但你轻松地制服了这个较小的女人，强迫她把药水一瓶接一瓶地喝下去。当她试图吐出来时，你按摩她的喉咙，触发她吞咽的本能。[pg]");
            outputText("喝到第三瓶时，她已经放弃了挣扎，转而试图把她的小穴在你的膝盖上摩擦。她的嘴巴张得大大的，整张脸因为欲望而涨成了紫红色。你强行喂她喝完剩下的几瓶，然后推了她一把，抓住她的脚踝，把她按在你的腿上，屁股撅在半空中。她发情的味道以及所有药物和催情剂散发出的蒸汽让你有点“接触性兴奋”，至少在某种意义上，你的" + get_player().vaginaDescript(0) + "");
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("变得肿胀湿润");
            }
            else if(get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("滴下女性的淫液");
            }
            else if(get_player().vaginas[0].vaginalWetness < 5)
            {
               outputText("慢慢开始浸湿你的大腿");
            }
            else
            {
               outputText("因渴望而流口水，在你身下积成一滩");
            }
            outputText("。你的性欲可以等等。这个荡妇需要被惩罚。[pg]");
            outputText("*<b>啪</b>！* 你的手拍在她圆润的屁股上。你收回手，感觉到她突出的阴唇带来的湿润。这个小婊子的小穴因为渴望而发炎，仅仅是打一下屁股，她就几乎要喷水了。你又拍了她一下，看着她全身紧绷，感觉到她的体液溅到你身上。[pg]");
            outputText("[say: 你把我弄湿了，你这个婊子！！坏婊子！] 你骂道，打得更用力了。[pg]");
            outputText("地精尖叫起来，虽然你无法确定那是出于快乐还是痛苦。你开始越来越用力地打她的屁股，在反复的虐待下，她的屁股从绿色变成了红色。她的整个身体开始抽搐并喷水，把她的蜜汁溅到了你的手臂上。她居然高潮了！好吧，在看了这种表演之后，她也得让你高潮——否则有她好看的！[pg]");
            outputText("你把她从你的腿上拉开，把她的脸按进你的" + get_player().vaginaDescript(0) + "里。她对着你挣扎，太沉迷于自己的快感而没有意识到发生了什么。你强行把她丰满的小嘴唇贴在你的私处上摩擦，让她的舌头滑进你的肉褶里。她的眼睛眯成了一条白缝，瞳孔向上翻得看不见了，但那里还有足够的东西让她的舌头认出味道并开始舔舐。你颤抖起来；这感觉比预想的要好得多。也许她的一些药水在她的嘴唇和舌头上留下了残留物，但你不在乎。[pg]");
            outputText("你在这个被下药的绿色婊子身上高潮了，");
            if(get_player().vaginas[0].vaginalWetness > 4)
            {
               outputText("把你的体液溅了她一身");
            }
            else if(get_player().vaginas[0].vaginalWetness > 3)
            {
               outputText("用你欢愉的证明涂满了她的脸");
            }
            else if(get_player().vaginas[0].vaginalWetness > 2)
            {
               outputText("让她沾满了你黏糊糊的下体汁液");
            }
            else
            {
               outputText("在她的舌头上留下了小穴的味道");
            }
            outputText("。");
            if(get_player().biggestLactation() >= 3.5)
            {
               outputText("乳汁从你的乳头喷涌而出，浸透了这个娇小的荡妇。");
            }
            else if(get_player().biggestLactation() > 2)
            {
               outputText("两股乳汁浸透了荡妇的头发，像白色的眼泪一样顺着她的脸流下来。");
            }
            else if(get_player().biggestLactation() >= 1)
            {
               outputText("乳汁从你的乳头滴落，掉进小荡妇的头发里。");
            }
            outputText("她的脸上挂着一种奇怪的呆滞笑容，看起来像是处于某种介于清醒和睡眠之间的奇怪状态。你抓住她的头发，把她扔在地上，看着她的身体随着高潮继续折磨她而抽搐和跳动。看起来它开始慢下来了，这个小骚货应该没事了。[pg]");
            outputText("你随意地穿好衣服，无视了那个爽翻了的地精的喘息和呻吟，准备离开。你回头看最后一眼，发现她的体液已经汇成了一个比她还大的水坑。她醒来时可能会有严重的宿醉。你");
            if(get_player().cor > 50)
            {
               outputText("得意地笑了笑");
            }
            else
            {
               outputText("叹了口气");
            }
            outputText("，然后漫步离开，感觉");
            if(get_player().cor < 50)
            {
               outputText("对做得太过火感到有些内疚。");
            }
            else
            {
               outputText("对你的复仇感到非常满意。");
            }
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
      }
      
      public function gobboButtSecks() : void
      {
         spriteSelect(SpriteDb.get_s_goblin());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         get_images().showImage("goblin-win-male-buttsex");
         outputText("像往常一样，你轻松击败了另一个淫荡的地精。你对自己的能力有过怀疑吗？知道接下来会发生什么，地精为不可避免的事情做好了准备。她舔着嘴唇，脸上因兴奋而泛红。为了进一步刺激你，她张开双腿，露出更多她湿透的小穴。[pg]");
         outputText("[say: 操我，种马！]她乞求道。虽然被打败了，但她还是有胆量提出要求。[say: 把你的精液射满我！]她的失败似乎并没有让她的嘴巴安静下来。[pg]");
         outputText("你感到被侮辱了。谁在之前的战斗中获胜了？如果你自己不是那么饥渴的话，你本可以把她留在那里，让她在自己的汁液里打滚。那么你该怎么做呢？在默默思考了一番之后，你产生了一个极其邪恶的想法。[pg]");
         outputText("快速脱下你的[armor]后，你撕掉了这个绿皮女人身上仅有的一点衣服。你轻松地把她从地上举起来，让她跨坐在你的" + get_player().cockDescript(_loc1_) + "上。这个小地精婊子被你迷住了，她的身体因兴奋而颤抖。[pg]");
         outputText("你冷笑着，用你" + get_player().cockDescript(_loc1_) + "的龟头顶住的不是她湿透的阴唇，而是她的屁眼！[pg]");
         outputText("[say: 不是那里！]她乞求着，嘴唇颤抖，眼泪汪汪。[say: 我需要你的精液来建立我自己的部落！]她解释道。[pg]");
         outputText("你对你手中颤抖的女人什么也没说。没有任何语言可以描述你粉碎她梦想时感到的快乐。老天爷啊，这个世界真的腐化了你，而你喜欢这样！[pg]");
         outputText("你毫不犹豫地把这个地精婊子猛地按在你的" + get_player().cockDescript(_loc1_) + "上，几乎把她刺穿了！她屁眼立刻传来的紧致感几乎让你高潮！她越是扭动，她的臀部肌肉就越紧紧地挤压着你。你在狂喜中僵立了片刻，舌头从嘴里垂下来，眼睛翻白。[pg]");
         outputText("地精抗议着，扭动得更厉害了，甚至用拳头捶打你的胸膛；她现在太虚弱了，她的捶打实际上像是在挠痒痒。她微弱的攻击足以让你从肉欲的迷茫中清醒过来。你狂热地咧嘴笑着，抓住她纤细的腰肢，狠狠地操她！当你插得更深更用力时，你的" + get_player().cockDescript(_loc1_) + "很快就适应了她被撑开的屁眼！[pg]");
         outputText("[say:这不是我想要的！]她哭喊着，[say:这不是我想要的！]如果你的" + get_player().cockDescript(_loc1_) + "撑开她的屁股还不够，她还能感觉到你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().sackDescript());
         }
         else
         {
            outputText(get_player().hipDescript());
         }
         outputText("随着每一次抽插拍打着她丰满的臀部，仿佛在戏弄她。[pg]");
         outputText("地精紧致的屁眼让你难以忍受。你的身体剧烈地抽搐着，在她体内释放出大量的精液。发泄完后，你把这个小婊子扔到地上；你现在对她已经没有用了。[pg]");
         outputText("当你捡起你的[armor]开始穿衣服时，你瞥了地精一眼。她的手开始在她现在被撑大的肛门里挖，拼命地想收集你射在她体内的精液。你得意地笑了笑，若无其事地走开了，对自己非常满意。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
      }
      
      public function gobboAssassinRapeIntro() : void
      {
         var mode1:Number;
         var _g1:GoblinAssassinScene;
         var mode:Number;
         var _g:GoblinAssassinScene;
         spriteSelect(SpriteDb.get_s_goblin());
         clearOutput();
         outputText("刺客瘫倒在地，拼命想要恢复镇定，但最终还是屈服于战败的疲惫。曾经缠绕在她柔软双乳上的皮带现在松松垮垮地挂在腰间，曾经装饰在上面的注射器现在散落一地。她身边一根破碎的针管散发出甜美的蒸汽，很快就飘到了她的鼻子里，随着情欲开始占据她的感官，女孩的脸猛地红了。");
         dynStats(DynStat.Lust(20));
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]<b>你还不够饥渴，无法强暴她。</b>");
         }
         addButtonDisabled(0,"肉棒操","这个场景需要你有一根尺寸合适的肉棒。","肉棒操");
         addButtonDisabled(1,"肉棒太大","这个场景需要你有一根过大的肉棒。","肉棒太大");
         addButtonDisabled(2,"堕落肉棒","这个场景需要你有一根过大的肉棒和高腐化。","堕落巨大");
         addButtonDisabled(3,"肉棒插屁股","这个场景需要你有一根肉棒和高腐化。","肉棒插屁股");
         addButtonDisabled(4,"颠簸操","这个场景需要你有一根尺寸合适的肉棒。","颠簸操");
         addButtonDisabled(5,"哺乳","这个场景需要你有足够的乳汁。","哺乳");
         addButtonDisabled(6,"使用避孕套","这个场景需要你有避孕套，或者有蜘蛛腹部和尺寸合适的肉棒。","使用避孕套");
         addButtonDisabled(7,"小穴","这个场景需要你有一个阴道。","小穴");
         addButtonDisabled(8,"产卵","这个场景需要你有一个蛛化精灵产卵管和一些卵。","产卵");
         if(get_goreEnabled())
         {
            addButtonDisabled(10,"子宫操","这个场景需要你有一根尺寸合适的肉棒。","子宫操");
         }
         if(get_player().hasVagina() && get_player().get_lust() >= 33)
         {
            if(get_player().isLoli())
            {
               addButton(7,"小穴",get_game().goblinScene.goblinLoliScene);
            }
            else
            {
               addButton(7,"小穴",gobboGetsRapedFem);
            }
         }
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            if(get_player().cockArea(get_player().biggestCockIndex()) > get_monster().vaginalCapacity() && (get_player().isCorruptEnough(80) || get_player().hasPerk(PerkLib.Sadist)))
            {
               addButton(2,"堕落肉棒",rapeAGoblinCorruptTooBig);
            }
            if(get_player().cockArea(get_player().biggestCockIndex()) > get_monster().vaginalCapacity())
            {
               addButton(1,"肉棒太大",manRapesGoblinTooBig);
            }
            if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
            {
               addButton(0,"肉棒操",gatsGoblinBoners);
               addButton(4,"慢跑操",gobboGetsRapedMaleFits);
               if(get_goreEnabled())
               {
                  addButton(10,"操子宫",get_game().goblinScene.gobboWombFuck).hint("把地精的子宫切下来，狠狠地操一顿。");
               }
            }
            if(get_player().hasCockThatFits(get_monster().analCapacity()) && (get_player().isCorruptEnough(70) || get_player().hasPerk(PerkLib.Sadist)))
            {
               addButton(3,"鸡巴插屁眼",gobboButtSecks);
            }
            if(get_player().tail.type == 5 && get_player().hasCockThatFits(get_monster().vaginalCapacity()))
            {
               _g = this;
               mode = 0;
               addButton(6,"蛛网避孕套",function():void
               {
                  _g.goblinCondomed(mode);
               });
            }
            else if(get_player().hasItem(get_useables().CONDOM) && get_player().hasCockThatFits(get_monster().vaginalCapacity()))
            {
               _g1 = this;
               mode1 = 1;
               addButton(6,"使用避孕套",function():void
               {
                  _g1.goblinCondomed(mode1);
               });
            }
            if(get_watersportsEnabled() && get_player().hasCockThatFits(60))
            {
               addButton(9,"颜射与撒尿",get_game().goblinScene.facefuckPiss).hint("颜射地精。然后释放自己");
            }
         }
         if(get_player().canOvipositSpider())
         {
            addButton(8,"产卵",laySomeDriderEggsInGobboTwat);
         }
         if(get_player().lactationQ() >= 500 || get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            addButton(5,"母乳喂养",giveGoblinAMilkMustache);
         }
         setSexLeaveButton();
      }
      
      public function gobboAssassinBeatYaUp() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(get_player().isShota() && get_player().hasCockThatFits(get_monster().vaginalCapacity()))
         {
            get_game().goblinScene.gobboShotaRape();
            return;
         }
         if(get_player().get_lust100() <= 99)
         {
            outputText("你倒下了，被彻底击败。为了确保你更容易对付，胜利的刺客漫步走过来，手里拿着两根装满液体的针。她把它们扎进你的[legs]，在你还没来得及结结巴巴地抗议之前，就把里面的东西清空到你体内。燃烧的欲望不由自主地涌遍你的全身，你大声呻吟着，因为化学物质像地精很快就会做的那样轻易地控制了你。[pg]");
         }
         if(get_player().hasCockThatFits(get_monster().vaginalCapacity()) && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            _loc1_ = get_player().cockThatFits(get_monster().vaginalCapacity());
            if(_loc1_ < 0)
            {
               _loc1_ = get_player().smallestCockIndex();
            }
            outputText("你急忙撕开你的[armor]，不顾一切地想把[eachCock]从地狱般的禁锢中释放出来。你太兴奋了，太饥渴了。任何闪过的矜持念头都被立刻抛弃和遗忘，在你的手指滑向[oneCock]并开始玩弄这根肿胀的工具时，被你那吞噬一切的欲望浪潮冲刷得一干二净。你立刻因那难以置信的、压抑已久的渴望而挺动，几乎当场就要射出来。抬起头，你恳求地迎上那个绿肤女人的目光。");
            outputText("[pg]地精刺客冷漠地看了一会儿，但随着你的需求加剧，她的态度软化了，而你的阴茎却更硬了。[saystart]哦，我想我会后悔的，但是");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个东西");
            }
            else
            {
               outputText("那些东西");
            }
            outputText("看起来非常美味。你不介意我稍微品尝一下你的精液吧？[sayend] 这位蓝发美人跪在你身边，让她那纤细娇小的手指在[oneCock]的下侧舞动，引得你发出一声淫荡的呻吟，她大声地自言自语道，[saystart]我没听到你说不，" + get_player().mf("种马","性感宝贝") + "。很好……我只取一点点精液……就射几下。像你这样");
            if(get_player().get_tallness() >= 60)
            {
               outputText("巨大的，");
            }
            outputText("" + get_player().mf("强壮的年轻男人","性感的繁育者") + "肯定有足够的精液来支付[his]擅闯的罚款吧？[sayend]");
            outputText("那些令人愉悦、跳跃的手指旋转着向下，来到你的");
            if(get_player().balls > 0)
            {
               outputText("[sack]，轻轻抚摸了一下便消失了。");
            }
            else if(get_player().hasVagina())
            {
               outputText("[vagina]，指尖只在湿透的阴阜上留下了最轻微的触感。");
            }
            else
            {
               outputText("会阴，指尖只在敏感的皮肤上留下了最轻微的触感。");
            }
            outputText("[pg]她解释道，[say: 在你给我答案之前，我不会帮你的。对自己诚实点——你根本不在乎其他女孩。你来这里只是为了操一个地精刺客。我说得对吗？]");
            outputText("[pg]你试图回答“不”，但声音渐渐弱了下去，变成了一声微弱的，");
            if(get_player().get_femininity() < 40)
            {
               outputText("几乎");
            }
            outputText("像女孩一样的呻吟。在[eachCock]中跳动的渴望在告诉你——不，是在命令你——按照她说的做，操她。像发情的野兽一样，你呻吟着。你看着这个矮小但丰满的袭击者那双水汪汪的蓝色大眼睛，做出了一个完全被你疼痛的、药物驱动的需求所合理化的决定。你仍然像着了魔一样套弄着你的肉棒，呜咽着说，[say: 是的……我……我来这里是为了和你做爱。]");
            outputText("[pg]翠绿色的皮肤在你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("上方抚摸了片刻，但在你从中获得任何满足感之前就消失了。[say: 抱歉，太慢了，]这个娇小的战士戏弄道，随后她将两根针管猛地扎进你的[legs]。[EachCock]勃起并立刻喷出一股白色的先列腺液，无法抵抗涌入你血液中的强效化学混合物，这种混合物完美地为你量身定制，点燃了你超越理智的激情。你没有注意到用过的注射器被拔出，但你绝对注意到了那个轻盈的绿肤女人试探性抚摸的回归。她低语道，[say: 现在告诉我其他女孩怎么就不重要了。这一切都只是为了得到一些绿色的爱而耍的把戏，不是吗？]");
            outputText("[pg]你的回应既迅速又热情。你告诉她她想听的一切，甚至更多，当刺客灵巧的手指挠着你那根胀满的、硬得发疼的操逼工具的每一寸时，你喘息着、呻吟着。它又喷出了一股浓稠洁白的先列腺液，简直和真精液没什么两样，你哀求道，[say: 是的，我来这里就是为了你那美味多汁的小穴。求求你，操我的鸡巴。我太需要了！我什么都愿意做！]");
            outputText("[pg][say: 哎呀，你已经为我流水了。我只希望剩下的还够付你的罚款。如果不够，我总能在这些针里加点魅魔的欢愉，] 翡翠色的荡妇沉思着。她跨过你，那颤动、圆润的臀部曲线在你上方悬停了片刻，然后她将那散发着麝香、湿漉漉的肉穴径直压在你的鼻子和嘴唇上。当这只地精将她肿胀的阴阜在你身上摩擦时，几滴淫液顺着你的脸颊滑落，她那芬芳的小穴让你那被冷落的肉棒");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("渴望得发狂。谢天谢地，就在你屈服于她肿胀的阴阜并舔了一口时，一双柔软、布满皱纹的脚缠住了你的" + get_player().cockDescript(_loc1_) + "，引出了一股浓稠的先列腺液。");
            outputText("[pg]脚趾将你的先列腺液涂抹在你的" + get_player().cockHead(_loc1_) + "周围，然后温暖的脚底顺着你" + Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸长的肉棒向下滑动，用混合着地精汗水和你个人体液的液体涂抹你的" + get_player().cockDescript(_loc1_) + "。你愉悦地呻吟着，你狂喜的声音被那遮住你嘴巴的肿胀、湿透的阴唇所掩盖，你的肉棒顺从地在她脚上喷射出无助的白色痕迹。你嘴唇的每一次摩擦都会得到地精小脚趾的抚摸作为奖励。每一次舔舐都会让那双挤压着、沾满精液的脚上下滑动。每一次吸吮她的阴蒂都会让她加快速度。在这样的鼓励下，你无法控制自己不去侍奉地精那如糖浆般的小穴，像奴隶在光荣神明的祭坛前一样膜拜她的女性特征。");
            outputText("[pg]这个矮小丰满的女人移动双腿，将你的肉棒放在她的左脚上，同时她的右脚整个压在你" + get_player().cockDescript(_loc1_) + "的底部，从顶端的马眼挤出一股浓稠的积蓄精液。她的脚底在你的肉棒上上下摇晃，将一团又一团的精液挤到地精的脚趾上。过了一会儿，她换了换腿，让她现在已经湿透的脚来完成剩下的挤压工作。你快乐地喷射和扭动，像筛子一样滴水，但还没有达到真正的释放。地精没有这样的问题，在你身上大声高潮了无数次。每一次喷射出的淫液都比上一次更多地浸透了你的脸，当她结束时，你的[hair]已经被它弄得黏糊糊的，半埋在一滩地精的欲望中。你已经很接近了。非常接近。再来一点点……再抽插几下。");
            outputText("[pg][saystart]");
            if(get_silly())
            {
               outputText("停在那儿，犯罪人渣。");
            }
            else
            {
               outputText("别急。");
            }
            outputText("[sayend] 翡翠色的刺客回头看了你一眼，催促道：[saystart]来吧。填满我。把你积攒的精液都释放出来");
            if(get_player().balls > 0)
            {
               outputText("在你的蛋蛋里");
            }
            else
            {
               outputText("在你体内");
            }
            outputText("。付清你的“罚款”，我或许会放你走。[sayend]");
            if(get_player().balls > 0)
            {
               outputText("一只手鼓励地挤压着你的[sack]");
            }
            else
            {
               outputText("几只手鼓励地挤压着你的[butt]");
            }
            outputText("随着地精伴随着一声湿滑的吧唧声将自己完全刺穿。你高潮了，在她体内狠狠地射精。你的背部弓起，身体紧绷，一波又一波的精液喷射进地精渴望婴儿的子宫里。她的小穴似乎把它喝了下去，以你排出的速度将精液从你身上吸走。");
            if(get_player().cumQ() >= 750)
            {
               outputText("即使是她近乎超自然的生育能力也无法跟上你惊人的男子气概，很快地精的肚子上就鼓起了一个小包。");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("当你结束时，它膨胀成一个圆润的、怀孕般的圆顶。");
               }
            }
            outputText("你所有的激情都在这光荣的高潮中耗尽，让你感觉自己像一个空虚、废弃的躯壳。");
            outputText("[pg]地精站起身来，你的白色黏液从她的下体滴落，她对你眨了眨眼，消失在拐角处，留下你独自沉睡。");
         }
         else if(get_player().biggestCockArea() > get_monster().vaginalCapacity() && get_player().hasCock() && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            _loc1_ = get_player().biggestCockIndex();
            outputText("你急忙撕开你的[armor]，不顾一切地想把[eachCock]从地狱般的禁锢中释放出来。你太兴奋了，太饥渴了。任何闪过的矜持念头都被立刻抛弃和遗忘，在你的手指滑向[oneCock]并开始玩弄这根肿胀的工具时，被你那吞噬一切的欲望浪潮冲刷得一干二净。你立刻因那难以置信的、压抑已久的渴望而挺动，几乎当场就要射出来。抬起头，你恳求地迎上那个绿肤女人的目光。");
            outputText("[pg]刺客叹了口气，嘟囔着：[say: 又是一个长着树干一样粗的肉棒的家伙。] 她不情愿地解开带子，挺拔的深绿色乳头从束缚中挣脱出来，骄傲地挺立在胸前。[say: 做地精的坏处，] 这位运动型的绿肤美女解释道，[say: 就是面对这样一根肉棒……这样一根起伏、跳动的肉棒塔……我就是忍不住想试试。] 现在赤身裸体，你的俘虏者漫步走来，宽阔的臀部随着每一步左右摇摆。[say: 做一个尺寸控真是受罪，] 她带着苦笑说完。");
            outputText("[pg]你困惑而冷漠地看着她的长篇大论，除了这个娇小的荡妇想要骑上你的肉棒之外，你几乎什么都没听懂。你的手抚摸着你" + get_player().cockDescript(_loc1_) + "上跳动的青筋，你的身体继续处于自动驾驶状态，当这位翠绿色的美人爬上你的身体时，你为她用力而快速地自慰。当这只地精坐到你身上时，她多汁的裂口在你的尿道隆起处张开，她的双腿淫秽地向两侧叉开。她命令道，[say: 把手拿开，伙计。你输给了一只地精，这意味着你要当爸爸了，不管你愿不愿意。]");
            outputText("[pg]肿胀的翠绿色肉帘用充满弹性的地精小穴包裹着你的肉棒，并拂开了你狂热抽插的手指。你的俘虏开始在你巨大的肉棒上研磨，将深色的生殖器在你巨大的肉棒上来回拖动，嘴里发出一声淫荡的呻吟。一颗坚挺的小阴蒂从地精闪闪发光的阴唇顶部探出，明显地抽搐着，显示出极大的享受。在你自身贪得无厌的欲望驱使下，你在她身下移动，试图让你的" + get_player().cockDescript(_loc1_) + "在她的阴道里滑动得更快。");
            if(get_player().biggestCockLength() > get_player().get_tallness() / 2)
            {
               outputText("你那长得令人难以置信的阴茎挡住了你视线，让你看不见那只性感的的地精，你也根本没看到那一击。");
            }
            outputText("一记毫不留情的重击打在了你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText("肉棒");
            }
            outputText("地精咕哝着，[say: 别乱动！]");
            outputText("[pg]你犹豫地服从了，突如其来的疼痛让你不敢再冒险乱动。你只能等着这个矮小丰满的女人玩够了，放你一马。");
            outputText("[pg][say: 哦，你终于明白了？对我来说，你只是牲畜——只是一个供我玩弄的精液喷嘴，直到我玩腻了把你关进围栏里。也许如果你的精液够浓，我会把你带回去，和我们其他的动物拴在一起。当然，如果我那样做，你就得榨出足够的精液，让几十个主母怀孕，] 这个翠绿色的荡妇一边说着，一边用她灵活的小穴在你的肉棒上发出淫荡的吧唧声。不……如果她把你带回去，你就永远无法完成你来这里的目的了！她拖着身体向前，直到她");
            if(get_player().biggestCockLength() < get_player().get_tallness() / 2)
            {
               outputText("坐在你的脸上，你那" + get_player().cockHead(_loc1_) + "顶着她流着口水的嘴唇。");
            }
            else
            {
               outputText("坐在你“上方”的地上，从你的感觉来看，你的" + get_player().cockHead(_loc1_) + "一直向上伸，刺穿了她湿润的小穴。");
            }
            outputText("[pg]她柔软的双脚从两侧夹住你的肉棒，展现出你意想不到的柔韧性。柔软的脚底在你的肉棒上滑动抚摸。她的脚趾卷曲着，抚摸着你敏感的尿道隆起。甚至她坚硬的脚后跟也托着你的" + get_player().cockDescript(_loc1_) + "底部，用脚为你手淫。");
            outputText("[pg]在大量阴道分泌物的润滑下，这个刺客的双脚轻而易举地将你推向高潮的边缘。她每走一步，那柔软细腻的触感都让你离高潮越来越近，很快你就在她那被汗水和淫液润滑的脚底板下颤抖起来。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("多亏了你惊人的男子气概，你喷出了大团的先列腺液，射入她饥渴的小穴中，但这只是即将到来的高潮的前奏。");
            }
            else if(get_player().cumQ() >= 250)
            {
               outputText("你源源不断地流出先列腺液，滴入她饥渴的小穴中，但这只是即将到来的高潮的前奏。");
            }
            outputText("[say: 快了。是啊，我是个刺客，但我也很注重保养。我把这双小脚保养得水润润的，就是为了以防万一，需要用它们来对付像你这样的怪物肉棒。]");
            outputText("[pg]你试图咕哝着抗议，但声音被你的");
            if(get_player().biggestCockLength() >= get_player().get_tallness() / 2)
            {
               outputText("跳动着、坚硬如铁的肉棒");
            }
            else
            {
               outputText("俘虏者柔软的屁股蛋");
            }
            outputText("闷住了。地精用脚使劲拉扯，她那湿滑、被撑开的小穴勉强吞下了你整个" + get_player().cockHead(_loc1_) + "。紧紧箍住你阳具的钳子般的握力让你舒服得直打颤，当这个绿色的小妖精设法又吞进一英寸时，你几乎要爽得爆发了。她颤抖着，双脚突然在你的肉棒上疯狂地摩擦。地精柔软的脚底在你的" + get_player().cockDescript(_loc1_) + "上涂抹着，像一个沉迷于快感的人一样狂野地放纵着，当她达到高潮时，汁液从她的缝隙中喷涌而出。这连番的触摸对你紧绷的阴茎来说太过刺激，伴随着一阵紧致火热的收缩，你感觉到即将释放。你的肉棒根部鼓起一个大包，伴随着体内爆发出一股温暖的快感。它从你的根部一直传到龟头，然后伴随着撑开小穴的喷射，消失在地精体内。她大声呻吟着，显然很享受被精液填满的感觉，当你的肉棒完成抽插时，你们俩一起叹息着");
            if(get_player().cumQ() <= 10)
            {
               outputText("滴落");
            }
            else if(get_player().cumQ() <= 100)
            {
               outputText("喷射");
            }
            else if(get_player().cumQ() <= 250)
            {
               outputText("浓稠地射");
            }
            else if(get_player().cumQ() <= 1750)
            {
               outputText("如潮水般涌出");
            }
            else
            {
               outputText("如江河般喷涌");
            }
            outputText("进地精的小穴里。");
            if(get_player().cumQ() >= 2500)
            {
               outputText("她的肚子在你大量的灌溉下明显圆润了起来。");
            }
            outputText("[pg]绿皮女孩在松开你之前，最后充满爱意地捏了几下你的" + get_player().cockDescript(_loc1_) + "。你瘫倒在地，依然感到有些兴奋，于是又开始自慰。地精大笑着说，[say: 再来几次这样的表现，我可能就不得不把你留下来了。] 你一直玩弄自己直到睡着，甚至在梦中，你还能感觉到那丝滑的小穴套在你的鸡巴上。");
         }
         else
         {
            outputText("被你自己的需求打败，你的手指飞快地伸向你的[armor]，急切地将其脱下，好让地精看到你那酸痛、娇嫩的小穴。刺客用一种不以为然、困惑的表情看着你，尽管她依然站在原地，但当你在欲望中沦陷时，她的目光紧紧锁定在你身上。知道有观众在看，你扭动着身体，向这个娇小的绿皮怪物展示你的[chest]和[vagina]。闪闪发光的水珠在你暴露的下体阴唇上形成，诱惑着你将手指滑入那湿滑温暖的深处。就好像你能抵抗得了一样。");
            outputText("[pg]你开始自慰，狂暴而毫不掩饰地蹂躏着自己的身体，完全忘记了是谁让你变成这样的。用探索的手指分开你湿滑的肉体，你迷失在每一次抚摸蜜壶时神经中传来的愉悦、温暖的爆炸感中。与此同时，你空闲那只手的手指");
            if(get_player().hasFuckableNipples())
            {
               outputText("在你的[nipple]里像活塞一样进进出出，像玩弄真家伙一样用力地自慰着。");
            }
            else
            {
               outputText("捏住一颗紧绷的乳头，下意识地扭动拉扯着。");
            }
            outputText("你自慰的狂想被手腕上突如其来的撞击打断了。");
            outputText("[pg]你困惑地看着，只能眼睁睁地看着地精跨过你，骑在你俯卧的身体上，轻松地打掉你每一次试图触摸自己的尝试。她扯下她的针带，漫不经心地从内衬里取出一套小皮带。她熟练地用一根细皮带把你的双手绑在一起。你没有反抗，以为这个变态的绿皮婊子打算玩什么变态的性游戏，好让你们俩都更爽。她低头冷笑，说道，[say: 我看不出操你这种不值钱的逼有什么意义，但你让我发情了，所以以莉希丝那滴水的奶子发誓，你要让我爽。]");
            outputText("[pg]还没等你嘟囔着抗议，地精就转过身，一屁股坐在你的脸上，用她湿润的裂缝堵住了你的嘴。麝香般的雌性淫液流过你的脸颊，流到你的后颈，滴在地上。地精发出一声轻微的、赞赏的呻吟，微微摇晃着臀部，将她阴蒂的凸起拖过你微张的嘴唇。她根本没有满足你的需求！你试图抗议，但换来的只是满嘴的淫液，尽管它可能很刺鼻，很诱人。当你试图把手指抽回酸痛的小穴时，绑住你双手的皮带绷紧了，但在你处于劣势的位置，你无法鼓起力量去制服这个娇小、霸道的荡妇。");
            outputText("[pg][say: 哦，你也想高潮？那你最好舔快点，荡妇。在我爽之前你什么都得不到，] 骑在你脸上的小穴主人嘲讽道。为了说服她照顾你，你闭上嘴，藏起舌头，用你唯一还能控制的东西讨价还价。");
            outputText("[pg]一记恼怒的耳光狠狠地抽在你的[chest]的[skin]上，带来一阵刺痛。剧痛让你被情欲蒙蔽的双眼直冒金星，但你强忍着，只发出一声微弱的闷哼。地精叹了口气，摆弄着她的弹药带。你看不见她在做什么，但你知道她没安好心！你的手臂传来一阵短暂的刺痛，紧接着是一阵狂喜、燃烧般的快感。你的[vagina]分泌出汁液，你无法控制地呻吟起来。欲望在你的血管中跳动。渴望攀升到了新的高度。你无法抗拒这种感觉……再也不能了。你张大嘴巴开始舔舐，用舌头攻击那片茂盛的绿色小穴，只要能让她高潮，给你带来你渴望的解脱，你什么都愿意做。");
            outputText("[pg]你的另一只手臂传来一阵短暂的疼痛，紧接着是一阵眩晕。随之而来的是，你的性欲似乎翻了一倍，攀升得如此之高，以至于你之前的性需求相比之下显得微不足道。你的[hips]不由自主地从地上抬起，微风拂过你肿胀的阴阜带来的电流感太过美妙，让你无法抗拒。地精显然很享受你的努力，评论道，[say: 哦天哪，你在操空气吗？你真的是因为感觉到微风吹过你赤裸、暴露的小穴而高潮吗？而且你下面好湿啊！亲爱的，我可是个地精，但你现在让我自愧不如。]");
            outputText("[pg]你吸吮着她的阴蒂让她闭嘴，同时让你的[butt]在地上滑动。每一次耸动，每一次移动，每一次对你那虚幻情人的毫无意义的起伏，似乎都比上一次更加狂热和绝望。你身下的泥土已经变成了芬芳、粘稠的泥浆。你的屁股被泥浆染成了棕色，当你在泥坑里拖动屁股时发出的湿润的吧唧声，只会让你和你的俘虏更加兴奋。她呻吟着，[say: 还想要吗？嗯……我不认为你现在这样就能高潮。]");
            outputText("[pg]对着地精那绿色、漏水的小穴喘着粗气，你什么也做不了，只能贴着她的嘴唇哼哼，用舌头在她的阴蒂上画圈。你太兴奋了，感觉自己能感觉到高潮就在眼前，潜伏在一座你无法翻越的山丘上。你绝望、淫秽的动作给你带来了快感，但这还不够，即使有大量该死的地精药物涌入你的系统。");
            outputText("[pg]你那娇嫩、肿胀的乳头传来一阵刺痛，这是新一波麻醉催情剂侵袭你身体前的唯一警告。你的肌肉紧绷，小穴仿佛活了过来，几乎像喷泉一样涌出淫液。你身下的水坑已经没过了你的肩膀，但你完全沉浸在性爱的幻想和脸上那美味的小穴中，根本无暇顾及。地精那粗壮圆润的大腿夹紧了你的头，她开始喘息，[say: 操，对，就舔那里，你这饥渴的荡妇，舔我的产道，你这微不足道的舌交荡妇。我真该把你带进我们的城市。我相信我们可以把你关在隔间里，也许把你除了嘴以外的所有部位都锁在墙后，让你连续舔几十个怀孕的绿色小穴，直到你只能靠黏糊糊、甜丝丝的女孩淫液为生。]");
            outputText("[pg]你翻起了白眼，反正除了那曲线优美的翠绿色臀部，你也没什么可看的。你的舌头完全疯了，在滴入你那张开的、呻吟着的嘴里的淫液帘幕中来回抽打。地精在你身上摩擦，在达到高潮时大声呻吟，几乎不在乎你的快感。谢天谢地，随着最新一次的注射，你的[vagina]变得如此敏感，以至于拂过你红肿阴唇的每一丝微风都像是一条独立的舌头。你扭动着，完全无法抗拒的渴望控制了你腰部以下的身体。突然填满你嘴巴的女人淫液让你吃了一惊，紧接着你也高潮了，你的[vagina]仅仅因为微弱的气流就达到了顶点。");
            outputText("[pg]你在混合着体液的水坑中晕了过去，几乎没有注意到地精的离开。");
         }
         get_combat().cleanupAfterCombat();
         dynStats(DynStat.Lust(-100));
      }
      
      public function giveGoblinAMilkMustache() : void
      {
         clearOutput();
         outputText("你慢慢走向倒下的地精，温柔地告诉她现在一切都会好起来的。她有些怀疑地看着你，张开双腿，显然希望你能满足她的欲望。你对她摇摇头，双手托起你那" + get_player().biggestBreastSizeDescript() + "，告诉她现在是喂奶时间。地精恼火地看着你，说道：[say: 我不要你的乳房！我要你的下半身！]你嘲笑她，抓住她的手臂，把它们拉到她的脑后。[pg]");
         outputText("她挣扎着想挣脱你的控制，大喊着[say: 来吧，" + get_player().mf("荡妇","种马") + "，你知道你想——唔！]同时试图把任何东西塞进她饥渴的小穴里。你把她的嘴按在你的" + get_player().nippleDescript(0) + "上，打断了她的话。她不由自主地喘着气，嘴里充满了你的乳汁。她瞬间僵住了，然后慢慢咽下嘴里的奶水。片刻之后，她在你怀里放松下来，温柔地吸吮着你的乳头。她以前那种充满欲望的样子消失了，取而代之的是一个顺从的女孩，现在除了你的乳汁什么都不想要。你慢慢放下手，开始摩擦她仍然湿滑的小穴。作为回应，她把手放在你的另一个[nipple]上，把玩着它，挑逗着你。[pg]");
         outputText("过了一会儿，你感觉到地精在你怀里睡着了。即使在那时，她仍然继续温柔地吸吮着你的[nipple]。你满意地笑了笑，轻轻地把地精从你的胸前抱起。你轻轻拍了拍她的肩膀，她又醒了过来。她有些茫然地看了你一眼，然后你轻轻推了她一下，她开始带着空洞、流口水的眼神走开了。");
         dynStats(DynStat.Lib(0.2),DynStat.Lust(-50));
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function gatsGoblinBoners() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         get_images().showImage("goblin-win-male-goblinboners");
         outputText("地精趴在地上，因战斗而筋疲力尽。她丰满的双腿无意间张开，屁股翘在半空中，让你能清楚地看到她湿润的小穴，而她正试图让自己高潮。看来这个绿皮荡妇已经把你给忘了——太多次徒劳的遭遇可能让她放弃了寻找一个能把她灌满精液的强壮雄性的希望。[pg]");
         outputText("对她来说幸运的是，你完全打算改变这一点。[pg]");
         outputText("你开始抚摸你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("当你走向那个毫无防备的地精女孩时，欣赏着她那完美圆润的臀瓣随着她匆忙的动作而晃动，她柔软的大腿紧紧夹住双腿间那只急切的手。你弯下腰，迅速抓住地精丰满的臀部，女孩惊讶地尖叫了一声，转过身来，看到了你勃起的长度");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。[pg]");
         outputText("[say: 哇——哇！嘿，帅哥，你觉得你在后面干什么呢？]她尖叫道，对你的突然出现感到惊讶多于害怕。你没有回答，而是决定抓住你的阴茎");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("并拍打");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("在她光秃秃的屁股上，而你的受害者则焦急地等待着你的下一步动作。你花时间用双手按摩地精淫荡的屁股，然后将你的" + get_player().cockDescript(_loc1_) + "滑入她柔软的臀瓣之间。你饥渴的受害者显得很不耐烦，试图在你身上摩擦，同时张开她湿润的阴唇，热情地发现有人愿意和她交配。你用力拍打她的屁股，加快了抽插的速度——几秒钟后终于插入");
         if(get_player().cockTotal() == 1)
         {
            outputText("你的阴茎进入气喘吁吁的荡妇体内，当你进入她紧致的小穴时，猛烈地将她向前推");
         }
         else if(get_player().cockTotal() == 2)
         {
            outputText("你的两根阴茎都进入了气喘吁吁的荡妇体内，当你进入她紧致的小穴和屁眼时，猛烈地将她向前推");
         }
         else
         {
            outputText("你的两根阴茎进入了气喘吁吁的荡妇体内，当你进入她紧致的小穴和屁眼时，猛烈地将她向前推——你的另一根阴茎");
            if(get_player().cockTotal() >= 4)
            {
               outputText("");
            }
            outputText("仍然夹在她的臀瓣之间");
         }
         outputText("。[pg]");
         outputText("你粗暴地捣弄着地精女孩，紧紧抓住她的臀部，而她则高兴地尖叫着。你腹股沟拍打她的声音在整个区域回荡，紧接着是你咕哝声和地精狂喜的呻吟声。你的受害者挣扎着想用手臂支撑起自己，却因为你侵入她体内的感觉而再次瘫倒。[pg]");
         outputText("最终你开始感觉到自己即将达到高潮，你的动作越来越快，为释放做准备。你身下的地精已经迷失在你" + get_player().cockDescript(_loc1_) + "带来的快感中，她的眼睛向上翻，舌头从嘴里流出口水，而她淫荡的脸则在你目前正在捣弄她的地面上摩擦。伴随着最后一次抽插，你的臀部向前倾，用你浓稠的精液涂满她的体内，享受着你的射精将她填满并堵住她入口的感觉");
         if(get_player().cockTotal() == 2)
         {
            outputText("");
         }
         outputText("。你慢慢地从她紧致的身体中释放自己，最后用剩下的精液覆盖她弯曲的背部和翘起的臀部。[pg]");
         outputText("你重新站起来，慢慢地自慰，精液从你的" + get_player().cockDescript(_loc1_) + "滴落到地精瘫倒的身体上。她需要一段时间才能恢复意识，但你确信当她醒来时，她会对性有更好的欣赏。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
   }
}

