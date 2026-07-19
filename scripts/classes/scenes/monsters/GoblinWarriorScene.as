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
   
   public class GoblinWarriorScene extends BaseContent
   {
      
      public function GoblinWarriorScene()
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
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         get_images().showImage("goblin-win-male-corruptedfuck");
         outputText("你开始脱下你的[armor]，低头看着你那无助的准袭击者兼即将成为受害者的人，饥渴地舔着嘴唇。你的[cocks]");
         if(get_player().cockTotal() == 1)
         {
            outputText("是");
         }
         else
         {
            outputText("都");
         }
         outputText("比她更清楚现在的状况。你弯下腰，剥去她身上每一寸本就稀少的衣物。当你打量她时，");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的一根[cocks]停留在她身上，而且它");
         }
         else
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "停留在她身上，而且它");
         }
         if(get_player().cocks[0].cockLength < 20)
         {
            outputText("几乎和她的整个躯干一样长");
         }
         else
         {
            outputText("比她还要大");
         }
         outputText("这给了你一个邪恶的主意。[pg]");
         outputText("你双腿大张地坐在地上，抓着这个小地精婊子，让她相对微小的缝隙贴在你" + get_player().cockDescript(_loc1_) + "的顶端。她终于从昏迷中清醒过来，脸上闪过极度矛盾的神情，她对肉棒和精液的渴望与她的求生本能展开了交战。在即将落败的边缘，当她感觉到仅仅是你" + get_player().cockDescript(_loc1_) + "的" + get_player().cockHead(_loc1_) + "开始撑开她的" + get_monster().vaginaDescript() + "所带来的痛苦时，那些本能突然重振旗鼓，击退了她的欲望。她竭尽全力反抗，但在你这样抓着她的情况下，这只不过是胡乱挥舞，用脚抵着你的" + get_player().cockDescript(_loc1_) + "，简直就像在爬树干一样——从她的角度来看，那肯定像是一根树干。[pg]");
         outputText("你们俩都因为各自的用力而汗流浃背，你慢慢开始意识到，她拼命的挣扎和她" + get_monster().vaginaDescript() + "的紧致结合在一起，将使你无法进行你如此期待的插入。然而，当你开始考虑在她的喉咙里解决时，一股黑暗涌动，另一个主意闪过你的脑海。[pg]");
         outputText("当地精感觉到你不再把她压在你的" + get_player().cockDescript(_loc1_) + "上时，她稍微放松了一点。当你把她的小穴凑到唇边开始品尝时，她绝对是兴奋极了。你的舌头在她" + get_monster().vaginaDescript() + "的内外游走，直到你把她的小肉核从藏身处哄出来。你用嘴唇包裹住它，开始施展你的腐化之力。当你把这个地精荡妇推向高潮，用一种在恶魔军团之外罕见的专业技巧刺激她的阴蒂时，腐化的能量束从你的舌头传出，穿过她的阴蒂，深入她的核心。当她尖叫着高潮时，你从她身上移开，欣赏着你恶魔般杰作的外在迹象。原本普通大小的爱之按钮已经肿胀到原来的五倍，变成了一个骄傲、充血的阴蒂……而且你放大的还不止这些。[pg]");
         outputText("你重新摆弄你的性玩具，让她现在背对着你，再次将你的" + get_player().cockDescript(_loc1_) + "与她的" + get_monster().vaginaDescript() + "接触。她再次挣扎，但在高潮之后，她已经没有力气进行像样的反抗了；现在她是在与不可避免的事情作斗争，她所有的抵抗只会让你更加兴奋。你开始把她压向自己。[pg]");
         outputText("[say:太大了……]她虚弱地说。龟头顶端挤了进去。[pg]");
         outputText("[say:你会杀了我……]她恳求道。剩下的龟头也跟着进去了。[pg]");
         outputText("[say: 停下...]她乞求道。肉棒开始没入。[pg]");
         outputText("[say: 不要……] 更多精液进入了她娇小的身体。[pg]");
         outputText("[say: 求你……] 她被填满了。[pg]");
         outputText("[say: 求你……] 甚至溢出来了。[pg]");
         outputText("[say: ……操我。][pg]");
         outputText("你将留在你新上任的肉便器体外的" + get_player().cockDescript(_loc1_) + "剩余部分狠狠地捅了进去。这足以让这个婊子高潮，而你甚至还没开始发力。你");
         if(get_player().cocks[0].cockLength < 20)
         {
            outputText("能感觉到她腹部巨大的凸起");
         }
         else
         {
            outputText("把她撑得太满，以至于你从这个角度都能看到凸起");
         }
         outputText("，这让你的欲望更加高涨。你从洞里抽出的肉棒长度甚至超过了你这个渴望精液的荡妇的身体长度，导致她翻起白眼，她的" + get_monster().vaginaDescript() + "紧紧夹住你，再次高潮。每一次你拔出或狠狠捣入都会让她爽到极点，以至于当你们俩都四肢着地，像一对野兽一样发情交配时，她只能躺在那里，大张着嘴，几乎要口吐白沫");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，她的头靠在你的[breasts]之间");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("，而你的[nipple]");
               if(get_player().biggestLactation() < 2)
               {
                  outputText("偶尔滴下乳白色的泪珠落在她的脸上");
               }
               if(get_player().biggestLactation() < 3)
               {
                  outputText("在她的脸上流下乳汁的溪流");
               }
               else
               {
                  outputText("用大量的液体糊满她");
               }
            }
         }
         outputText("。她的头发被");
         if(get_player().biggestLactation() >= 1)
         {
            outputText("乳汁和");
         }
         outputText("你们俩的汗水黏在一起，她唯一发出的声音就是每隔几次高潮时偶尔发出的狂喜的咕噜声。[pg]");
         outputText("[say: 好了，婊子。你想要我的孩子？它。们。来。了！]你大喊道。然而，");
         if(get_player().hasVagina())
         {
            outputText("当你的" + get_player().vaginaDescript(0) + "");
            if(get_player().vaginas[0].vaginalWetness <= 3)
            {
               outputText("渗出淫液");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("泛滥成灾");
            }
            else
            {
               outputText("喷涌而出");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("并且你其余的[cocks]将她浸透时，");
            }
         }
         else if(get_player().cockTotal() > 1)
         {
            outputText("而你其他的" + Appearance.cockNoun(CockTypesEnum.HUMAN));
            if(get_player().cockTotal() > 2)
            {
               outputText("浸透了她，");
            }
            else
            {
               outputText("浸透了她，");
            }
         }
         outputText("这婊子太紧了！简直就像个天然的阴茎环！");
         if(get_player().balls >= 2)
         {
            outputText("你的[balls]正在努力，但是，h");
         }
         else
         {
            outputText("她");
         }
         outputText("痉挛的" + get_monster().vaginaDescript() + "死死地夹住你的" + get_player().cockDescript(_loc1_) + "，让你根本无法释放。[pg]");
         outputText("高潮的瞬间过去了，你却感到欲求不满。这只会让你感到恼火，因为你的精液容器连她唯一的职责都没能履行。然而，你并没有气馁。事实上，你加倍了努力。如果这个喜欢大尺寸的荡妇想在自己爽的同时拒绝给你回报，好吧，那下一次你只能把她射到失去意识了。[pg]");
         outputText("在似乎长达几个小时的时间里，你几乎把她那绿色小脑袋里的脑浆都给操出来了，让自己再次回到了高潮的边缘。你考虑这次要不要拔出来，但决定不这么做。至少要一次性射出两发的量；这会奏效的，而且这婊子也是罪有应得。[pg]");
         outputText("[say: 让我们。再。试。一次！]你大喊着，把你们俩拉回坐姿，并让你们的背都弓了起来。[pg]");
         outputText("你的" + get_player().cockDescript(_loc1_) + "紧紧地贴着她的皮肤，以至于你可以看到精液顺着你的肉棒向上涌出，仅仅第一发就把你的地精玩具给撑胀了。");
         if(get_player().cockTotal() > 2)
         {
            outputText("你剩下的[cocks]像间歇泉一样喷射到空中，把你们俩都涂满了精液。");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("你剩下的阴茎像间歇泉一样喷射到空中，把你们俩都涂满了精液。");
         }
         outputText("正是那种第一次阻止你射精的紧致感，现在确保了在你拔出来之前，你射入她体内的大量精液一滴也不会漏出来。幸好你的腐化如此有效，因为她现在看起来就像怀了一个沙滩排球那么大。[pg]");
         outputText("最后，你把最后一股精液射进这个新搞到手的屁股里，把她从你的" + get_player().cockDescript(_loc1_) + "上推开，让她摔在地上。撞击的力道让精液如洪流般从她体内涌出。[pg]");
         outputText("你站起身准备离开，低头看着这个你刚刚完事的地精荡妇。[pg]");
         outputText("[say: 我希望我的女儿们比她们的婊子母亲更好操，]你说。[say: 告诉她们，如果她们也想被像劈柴一样劈开，就来找我。]");
         outputText("[pg]她绝对会的。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function manRapesGoblinTooBig() : void
      {
         clearOutput();
         get_images().showImage("goblin-win-male-corruptedbj");
         var _loc1_:int = get_player().biggestCockIndex();
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         outputText("你掏出正在变硬的阳具，向你的受害者展现出它");
         if(get_player().cockArea(_loc1_) < 80)
         {
            outputText("近乎");
         }
         outputText("荒谬的尺寸。地精女孩震惊地看着这一幕，眼睛瞪得像餐盘一样大。知道你不管尺寸差多少都会硬上，她张开双腿，在地上找了个更舒服的姿势。[pg]");
         outputText("你");
         if(get_player().cor < 50)
         {
            outputText("耸了耸肩，心想既然她准备好了，你也不妨试一试");
         }
         else
         {
            outputText("咧嘴一笑，很乐意试着把她撑开");
         }
         outputText("。这只");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("龟头冠状沟");
         }
         else
         {
            outputText("龟头");
         }
         outputText("当你用你的" + get_player().cockDescript(_loc1_) + "摩擦她已经湿润的阴唇时，它兴奋地跳动着。她在你身下扭动，显然很享受你顶着她阴道口的感觉。你以痛苦的缓慢速度开始向前推进，感觉到她的身体在你的");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("龟头冠状沟");
         }
         else
         {
            outputText("冠状沟");
         }
         outputText("周围被撑开，但前进了一两下之后，那狭小的通道就再也撑不开了，你确信如果再强行进入就会弄伤她。[pg]");
         outputText("你对这种挑逗感到不满，于是拔出来，把它滑到她的躯干上，把她压在你的" + get_player().cockDescript(_loc1_) + "下面，把她的汁液涂满她的脸和身体。她的乳房被压扁了，以至于她勃起的紫色小乳头几乎从两边露出来。这个小荡妇看起来松了一口气，而且有点兴奋。她舔了舔嘴唇，高兴地说，[say:谢谢你，亲爱的，我想你刚才差点把我撕成两半！别担心，我很乐意被你的精液浸透，]说着，她用双臂和双腿缠住你");
         if(get_player().hasKnot(0))
         {
            outputText("把她的脚跟勾在你的肉结后面");
         }
         outputText(".[pg]");
         outputText("[say:她很擅长这个，]你沉思着，因为她开始在你身下摩擦，用她的腿像活塞一样在你的长度上上下移动她的整个身体，她的手臂和手以令人惊讶的激情摩擦和抚摸着你。这种感觉很强烈——这些地精知道如何取悦一个");
         if(get_player().get_gender() == 3)
         {
            outputText("扶他");
         }
         else
         {
            outputText("男人");
         }
         outputText("，这是肯定的！你开始兴奋地滴下液体，一滴迷路的液体浸湿了地精的脸。当她眨眼把它弄掉时，她的笑容更灿烂了。一道温暖湿润的痕迹舔上你的顶端，地精贪婪地开始吞噬你的先列腺液，甚至从你的尿道里舔它。你的[hips]抽搐着，当她紧紧抓住你的阴茎时，把她从地上抬了起来。[pg]");
         outputText("你从来没有想过这样的行为会如此令人愉快，但这实在是太棒了。你失去了控制，把一团滚烫的精液喷在地精的脸上。她语无伦次，试图擦去眼睛里的精液，这时你的下一次喷射正好击中她的额头，让这个活泼的女人失去了平衡。在失去了对你痉挛的" + get_player().cockDescript(_loc1_) + "的抓握后，她重重地摔在地上。你后退一步，随着高潮的结束，你的阴茎在空中上下摆动，");
         if(get_player().cumQ() < 75)
         {
            outputText("又用强效的精液溅了她几次。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("给她涂上了一层厚厚的精液。");
         }
         else
         {
            outputText("把她弄得浑身湿透，让她躺在一大滩浓稠的精液中。");
         }
         outputText("这个绿皮荡妇似乎适应得很好，甚至还把你的精液捞起来，一边自慰一边抹进她的小穴里。她看着你穿衣服，舔了舔嘴唇，沾满精液的脸上挂着风骚的笑容，[say: 你的味道和我预想的一样好，猛男！也许下次把那个坏小子弄小点，再来找我好好玩玩，好吗？希望到那时，我塞进小穴里的这些精液能让我有个大肚子给你摸！][pg]");
         outputText("你摇了摇头，然后离开了，这次经历让你感到有些精疲力尽，但也得到了释放。");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function laySomeDriderEggsInGobboTwat() : void
      {
         clearOutput();
         get_images().showImage("goblin-win-drider-egged");
         outputText("这个可怜的绿皮小生物试图从你身边爬走时可怜的挣扎，让你相当慷慨地看到了她流口水的小穴。虽然你感觉到自己");
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
         outputText("了一点，但你还是忍不住注意到了你蜘蛛下半身日益增加的重量。再次低头看着地精，你决定也许你们都能得到一些……<i>类似</i>你们想要的东西。");
         outputText("[pg]你迅速脱下衣服，爬向那个抽泣的荡妇，弯下腰把她拉起来，并让她转过身来面对你。你用一只手臂环绕在她的腋下，用空闲的手戳了戳她柔软的肚子，询问她孩子的情况。");
         if(get_player().get_femininity() > 50)
         {
            outputText("[pg][say: 什——什么？你——我根本没有孩子，你这蠢货！这就是你的乐趣吗，混蛋？落井下石？！]");
         }
         else
         {
            outputText("[pg][say: 什——什么？你——我根本没有孩子，你这蠢货！这就是你的乐趣吗，混蛋？落井下石？！]");
         }
         outputText("她用脚踢你，但毫无力气，随着眼角开始泛起泪花，她撅起的嘴唇更明显了。");
         outputText("[pg][say: 放开我，放开我！] 她扭动着身体，你把另一只手滑到她的腋下，帮着按住她。你把她推得离你远一点，同时开始把你的蜘蛛腹部蜷缩在身下。你已经能看到你的产卵管从甲壳中探出，随着你的心跳抽动着，绿色的润滑液滴满了你的下盘。");
         outputText("[pg]你的地精玩物安静了下来，盯着你众多腿之间那根越来越粗的肉棒。");
         outputText("[pg][say: 什么？那是什么？那是用来干什么的？] 她紧张的语气丝毫掩饰不住顺着大腿滑落的兴趣。你把她拉近，把她举在你的产卵管上方，亲吻她的额头，向她保证她会拥有她梦寐以求的所有孩子。她矛盾的笑容和沉重的喘息让你的心跳稍微加快了一点，当你用滑溜溜的肉棒刺穿这个紫发女人时，任何回答都被打断了。");
         outputText("[pg]当你像对待一个活生生的性玩具一样上下抽插她，尽可能多地把你自己塞进她体内时，她压抑的喘息和咕哝声从唇间溢出。一抹深红蔓延过你地精婊子的脸颊；她的一只手扭动拉扯着自己的乳头，咬着嘴唇，而另一只空闲的手则兴奋地按摩着你每次抽插造成的凸起。你的甲壳上沾满了她的体液和你蜘蛛卵润滑液缓慢渗出的混合物。");
         outputText("[pg]你终于插到底了，把这个绿色的精液套筒一直插到底，你感觉到你的粗壮擦过她的子宫颈。你把手从她的腋下抽出，重新放在她的肩膀上，把她固定在原地，准备迎接即将到来的事情。当第一波润滑液强行进入她体内时，她的肚子微微凸起，她幸福地喘息着，双手抚摸着她的“孕肚”。当你感觉到你的下半身收紧颤抖，第一颗卵强行顺着你的产卵管向上移动时，你自己的笑容也变得更灿烂了。");
         outputText("[pg]你感觉到它缓慢地向上进入地精体内，你的产卵管在它周围张开，直到它停在她的子宫入口前。她从肚子上抬起头，睁大眼睛盯着你，仅仅一秒钟后，一阵强烈的痉挛迫使卵穿过她紧闭的子宫颈。这个微型的婊子抽搐着，翻着白眼，舌头耷拉着，高潮迭起，一股淫液喷洒在你的甲壳上。");
         if(get_player().hasCock())
         {
            outputText("你自己的高潮也同样强烈，[eachCock]强有力地喷洒在你的躯干上");
            if(get_player().hasVagina())
            {
               outputText("并且你");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你");
         }
         if(get_player().hasVagina())
         {
            outputText("的[vagina]与她同步收紧，你丰富的体液浸透了你的蜘蛛半身。");
         }
         outputText("[pg]然后下一颗卵滚上前来，接着是下一颗，再下一颗……");
         outputText("[pg]当你把她填满时，你一直把她按在你的身体上，一次一颗卵，每一颗卵都让她被撑开的肚子稍微膨胀一点，直到她被填得满满的，你可以透过她紧绷的肚皮感觉到你的卵。地精几乎失去了知觉，毫无意识地咕噜着，因为瞬间怀孕的快感麻痹了她的神经。你伴随着一声响亮的湿润的扑通声把她拔了出来，她抽搐的小穴流出源源不断的清澈体液，以及一串粘稠的绿色卵粘液。");
         outputText("[pg]把她放在阴凉处躺下，你穿上衣服，很高兴能摆脱额外的重量，准备继续你的冒险。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function goblinWarriorRapeIntro() : void
      {
         var mode1:Number;
         var _g1:GoblinWarriorScene;
         var mode:Number;
         var _g:GoblinWarriorScene;
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         clearOutput();
         outputText("女战士跌倒在地，她的乳房重重地撞在胸甲的束缚上。她抬起头看着你，抽泣着。");
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]<b>你还没饥渴到要去强奸她。</b>");
         }
         addButtonDisabled(0,"鸡巴操","这个场景需要你有一根尺寸合适的鸡巴。","鸡巴操");
         addButtonDisabled(1,"鸡巴太大","这个场景需要你有一根过大的鸡巴。","鸡巴太大");
         addButtonDisabled(2,"堕落肉棒","这个场景需要你有一根过大的肉棒和高腐化。","堕落巨大");
         addButtonDisabled(3,"肉棒插屁股","这个场景需要你有一根肉棒和高腐化。","肉棒插屁股");
         addButtonDisabled(4,"慢跑操","这个场景需要你有一根尺寸合适的鸡巴。","慢跑操");
         addButtonDisabled(5,"母乳喂养","这个场景需要你有足够的乳汁。","母乳喂养");
         addButtonDisabled(6,"使用避孕套","这个场景需要你有避孕套或者蜘蛛腹部以及尺寸合适的鸡巴。","使用避孕套");
         addButtonDisabled(7,"小穴","这个场景需要你有一个阴道。","小穴");
         addButtonDisabled(8,"产卵","这个场景需要你有一个蛛化精灵产卵管和一些卵。","产卵");
         if(get_goreEnabled())
         {
            addButtonDisabled(10,"子宫操","这个场景需要你有一根尺寸合适的鸡巴。","子宫操");
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
               addButton(2,"堕落大鸡巴",rapeAGoblinCorruptTooBig);
            }
            if(get_player().cockArea(get_player().biggestCockIndex()) > get_monster().vaginalCapacity())
            {
               addButton(1,"鸡巴太大",manRapesGoblinTooBig);
            }
            if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
            {
               addButton(0,"鸡巴操",gatsGoblinBoners);
               addButton(4,"慢跑操",gobboGetsRapedMaleFits);
               if(get_goreEnabled())
               {
                  addButton(10,"子宫交",get_game().goblinScene.gobboWombFuck).hint("切出地精的子宫，狠狠地干它。");
               }
            }
            if(get_player().cockThatFits(get_monster().analCapacity()) >= 0 && (get_player().isCorruptEnough(70) || get_player().hasPerk(PerkLib.Sadist)))
            {
               addButton(3,"肛交",gobboButtSecks);
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
            if(get_watersportsEnabled() && get_player().cockThatFits(60) >= 0)
            {
               addButton(9,"口交与排尿",get_game().goblinScene.facefuckPiss).hint("让地精给你口交。顺便释放一下自己");
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
      
      public function goblinWarriorEncounter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2117) == 0)
         {
            outputText("当你散步时，一个地精从附近的灌木丛中跳了出来！与你迄今为止看到的大多数地精不同，这个地精穿着盔甲。她右手拿着剑，左手拿着盾。");
            outputText("[pg][say: 我要打败你，就为了能操你，] 她说。");
         }
         else
         {
            outputText("当你走着，一个熟悉的穿着盔甲的地精映入眼帘。你准备好你的[weapon]准备战斗！");
            outputText("[pg][say: 我要打败你，就为了能操你，] 她说。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2117,FlagDict_Impl_.arrayReadInt(_loc1_,2117) + 1);
         unlockCodexEntry(2040);
         startCombat(new GoblinWarrior());
      }
      
      public function goblinCondomed(param1:Number = 0) : void
      {
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         var _loc2_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         clearOutput();
         get_images().showImage("goblin-win-male-goblincondomed");
         outputText("战败后，地精女孩双膝一软，向后倒去，仰面躺在地上，翠绿色的脚踝悬在头顶。[say: 用我吧，]她乞求道，[say: 羞辱我，贬低我，践踏我！不管你做什么，填满我就行！]当你脱下[armor]时，她尽可能地张开双腿，这个放荡的女孩向你展示着她流着淫水的阴部，肿胀的绿色阴唇上已经滴落着焦急的汗珠和渴望的爱液。她在泥土中扭动着，双手抓着丰满的臀部，充满期待地把屁股翘到半空中。你几乎能感觉到这个小荡妇渴望精液的小穴散发出的热量，发情的热度让她的眼神变得迷离而涣散。站在她上方，很明显她唯一能意识到的只有她双腿间跳动的阴部和你那勃起的肉棒。[pg]");
         outputText("她不耐烦地伸出双腿，脚趾勾住你的下半身，试图把你拉近，同时仍然保持她那饥渴的小穴可以进入。她橄榄色的双脚紧紧夹住你的肉体，当她在你的[hips]外侧上下滑动时，她那结实有力的脚底摩擦着你的[skinfurscales]。地精女孩的脚跟划过你的大腿，将双脚并拢在你的" + get_player().cockDescript(_loc2_) + "两侧，她那玉色肌肤的脚掌压在");
         if(get_player().balls > 0)
         {
            outputText("你那跳动的囊袋上");
         }
         else
         {
            outputText("你肉棒的根部");
         }
         outputText("，同时她的脚趾像粗壮的手指一样卷曲着包住你的阴茎。起初她只是缓慢地抚摸着你，随后这个青柠色肌肤的女孩加快了节奏，交替使用脚背和小腿之间丝滑肌肤的柔软拥抱，利用脚踝的紧致感将你的肉棒按摩至完全勃起。在她的双脚间颤抖着，一滴滴先列腺液开始从你的龟头渗出，近乎透明的液滴顺着你的龟头滚落。地精女孩用她的大脚趾虔诚地收集起这些温暖的液体，让它们在每个脚趾间欢快地流淌，然后用有力的爱抚将它们重新涂抹在你的肉棒上，像涂抹精油一样将这些无籽的精液揉进你的肉体，她的双脚在你的体液润滑下闪烁着海绿色绿柱石般的光泽。[pg]");
         outputText("此时，一滩因过度刺激而分泌的淫水已经在这个淫荡女孩的身下汇聚成湖。她淫荡地呻吟着，手指仍然深深地抠进她的臀瓣，你意识到地精女孩仅仅是给你足交就已经高潮了。她如此渴望你的肉棒，简直到了可悲的地步，一个邪恶的念头在你的脑海中闪过。你抓住她沾满先列腺液的滑腻双脚，手指顺着她被精液软化的肌肤滑动，挠痒并揉搓着她的脚底，直到女孩在狂喜中尖叫起来，紧闭双眼，她那气喘吁吁的欲望变得如此强烈，以至于她再也无法将双手从自己的阴部移开。伴随着一股溢出的温暖淫水，她将右手的指头抠进她那翠绿色的裂隙中，左手则以越来越大的圆圈快速揉搓着她那玉色的阴蒂，震动让她的屁股在森林地面的泥潭中剧烈摇晃。趁她分心的时候，");
         if(param1 == 0)
         {
            outputText("你启动了吐丝器，这个精巧的器官编织出一个由细密蛛丝构成的细长护套，并小心翼翼地在柔韧避孕套的惰性层之间留下了粘性的蛛丝。将它滑过你的" + get_player().cockDescript(_loc2_) + "，你惊叹于它是如此轻薄！你甚至能感觉到微风吹过这层丝质的覆盖物。");
         }
         else
         {
            get_player().destroyItems(get_useables().CONDOM,1);
            outputText("你撕开包装，将乳胶避孕套滑过你的" + get_player().cockDescript(_loc2_) + "，惊叹于它是如此透明和闪亮。你觉得地精女孩在为时已晚之前是不会注意到它的！");
         }
         outputText("是时候给这个地精女孩她所要求的了，即使那不是她想要的。[pg]");
         outputText("你依然抓着她扭动的双脚，弯下腰，尽可能地将她的双腿拉开，随着她大腿内侧肌肉对抗着拉扯，肌肉被拉伸得越来越开。增加的压力加上她自己疯狂的自慰，让女孩迎来了又一次高潮，这一次，她喷涌的爱液化作堕落欲望的水晶溪流向上喷射，温暖地拍打在你的腹部。她的双臂垂在身体两侧，手心向上，手指抽搐着，为你那" + get_player().cockDescript(_loc2_) + "扫清了通往她为你精心准备的颤抖的绿色小穴的道路。推开她肿胀的阴唇，你发现她湿得一塌糊涂，你几乎是直接滑了进去，当你用坚挺的肉棒填满她时，她那因高潮而紧绷的肌肉不规则地痉挛着。[say: 哦，是的，你终于找到你的肉棒了，]她喘息着，嘴里冒着口水泡。[say: 像恨我一样操我，你这混蛋，]她要求道，你抓住她的脚踝把她向上拉，把她进一步拉到你跳动的肉棒上，当她深绿色的内部褶皱在你抽插的长度前分开时，她那滴水的阴部吸吮着你的肉棒。[say: 我不是玻璃娃娃，你这怂包，就他妈的用力插进来！]她尖叫着，手指抓挠着地面，向上挺动着身体，想让你更多地进入她的体内。[pg]");
         outputText("这个嘴贱的婊子显然忘了是谁输了这场战斗，看来你得提醒她一下。你把她的双腿当成杠杆，让她在你的肉棒上扭转，把她转了180度，让她趴在自己的奶子上，屁股高高撅起，同时你把肉棒剩下的部分狠狠地撞进这个橄榄色皮肤的色情狂体内。她闷哼了一声，刚想再说点什么，但你向前一推，把她的脸按进泥里，没等她开口，她的嘴里就塞满了被她自己的爱液浸透的泥土，发出一声狂喜的咕噜声。她的双腿挣扎着反抗你的抓握，东倒西歪地抽动着，滑腻的双脚几乎要从你手中滑落。你咬紧牙关，开始尽可能用力地操她那流着口水的小穴，渴望驯服这个女孩狂躁的阴部。将她汗水浸透的大腿狠狠地撞击在你的[hips]上，你的抽插变得近乎野蛮，当你把她的阴部拍打在你的腹股沟上时，她的臀部泛起了深深的红晕，那个秘密的避孕套完美地发挥了作用，就像你" + get_player().cockDescript(_loc2_) + "上的一层皮肤一样薄。[pg]");
         outputText("这个翠绿色的女孩满身汗水和泥土，扭动着翻过身来，当她戳着自己腹部的凸起时，脸上露出了困惑的表情。[say: 什么……感觉不对劲，]她嘟囔着，双手按压着自己的皮肤。她用一根长长的中指检查自己的阴部，拔出来时却干干净净，没有她期待的象牙色精液。[say: 操？避孕套？]她尖叫起来。[say: 你这混蛋！]她以越来越疯狂的动作按压着自己的肚子，当那个装满精液的气球完好无损地弹回来时，她张大了嘴巴。[say: 为什么它不破？]她质问道。");
         if(param1 == 0)
         {
            outputText("你礼貌地告诉她，蛛丝非常结实，而且非常粘。她把手指伸进裂隙，试图把它拉出来，当她感觉到内壁被黏糊糊的蛛网拉扯时，她倒吸了一口凉气。尽管她拼尽全力，那个丝质气泡依然停留在你留下的地方，被你那束缚性的蛛网牢牢地粘在原处。你大笑着祝她好运，然后收拾好衣服转身离开。地精女孩体内装满了精液，却无法让任何一滴进入她的子宫，她无助地呻吟着，绝望地用手指抠弄着自己，仿佛她的高潮能把你在她体内留下的宝藏排出来似的。");
         }
         else
         {
            outputText("你礼貌地告诉她，乳胶很结实，能有效避孕。你大笑着祝她好运，然后收拾好衣服转身离开。地精女孩体内装满了精液，却无法让任何一滴进入她的子宫，她无助地呻吟着，绝望地用手指抠弄着自己，仿佛她的高潮能把你在她体内留下的宝藏排出来似的。");
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function gobboWarriorBeatYaUp() : void
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
            outputText("你倒下了，被彻底打败了。为了确保你更容易对付，胜利的战士大摇大摆地走过来，手里拿着两瓶装满液体的药水。她强行把催情剂塞进你嘴里，在你还没来得及结结巴巴地抗议之前就把里面的东西倒进了你体内。燃烧的欲望不请自来地涌入你的血管，你大声呻吟着，化学物质轻易地控制了你，就像地精很快也会控制你一样。[pg]");
         }
         if(get_player().hasCockThatFits(get_monster().vaginalCapacity()) && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            _loc1_ = get_player().cockThatFits(get_monster().vaginalCapacity());
            if(_loc1_ < 0)
            {
               _loc1_ = get_player().smallestCockIndex();
            }
            outputText("你急忙撕开你的[armor]，不顾一切地想把[eachCock]从地狱般的禁锢中释放出来。你太兴奋了，太饥渴了。任何关于羞耻心的念头都被立刻抛弃和遗忘，被你吞噬一切的情欲浪潮冲刷殆尽，你的手指滑到[oneCock]周围，开始把玩这根肿胀的工具。你立刻因为难以置信的、压抑已久的渴望而挺动起来，几乎当场就要射精。你抬起头，恳求地迎上那个绿皮肤女人的目光。");
            outputText("[pg]地精战士冷漠地看了一会儿，但随着你欲望的加剧，她的态度软化了，而你的阴茎却硬了起来。[saystart]哦，我想我会后悔的，但是");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个东西");
            }
            else
            {
               outputText("那些东西");
            }
            outputText("看起来非常美味。你不介意我尝一点你的精液吧？[sayend] 这位有着深红色鬃毛的美女跪在你身边，让她那娇小精致的手指在[oneCock]的下方跳舞，当她大声说出她的想法时，你的嘴唇发出了一声诱人的呻吟，[saystart]我没有听到拒绝，" + get_player().mf("种马","性感宝贝") + "。很好……我只取一点点精液……就射几下。当然，一个");
            if(get_player().get_tallness() >= 60)
            {
               outputText("大的，");
            }
            outputText(get_player().mf("强壮的小伙子","性感的母猪") + "应该有足够的精液来偿还[his]的冒犯吧？[sayend]");
            outputText("那些令人愉悦、跳跃的手指像芭蕾舞一样滑落到你的");
            if(get_player().balls > 0)
            {
               outputText("[sack]，在消失之前给它一个温柔的抚摸。");
            }
            else if(get_player().hasVagina())
            {
               outputText("[vagina]，指尖只给你湿润的阴阜留下一丝若有若无的触感。");
            }
            else
            {
               outputText("会阴，指尖只给你敏感的皮肤留下一丝若有若无的触感。");
            }
            outputText("[pg]她解释道，[say: 在你给我答案之前，我不会帮你的。对自己诚实点——你根本不在乎其他女孩。你来这里只是为了操一个地精战士。我说的对吗？]");
            outputText("[pg]你试图回答“不”，但声音却渐渐微弱，");
            if(get_player().get_femininity() < 40)
            {
               outputText("几乎");
            }
            outputText("像女孩一样的呻吟。在[eachCock]中跳动的需求告诉你——不，是要求——你按照她说的做，操她。像发情的野兽一样，你呻吟着。你看着这个矮小但丰满的侵略者那双水汪汪的大蓝眼睛，做出了一个完全由你疼痛的、被药物驱使的需求所合理化的决定。你仍然像着了魔一样抽插着你的肉棒，呜咽着，[say: 是的……我……我来是为了和你做爱。]");
            outputText("[pg]翠绿色的皮肤抚摸着你");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("上方片刻，但在你能从中获得任何满足感之前就消失了。[say: 抱歉，太慢了，]这个矮小的战士戏弄道，片刻之后，她又把一瓶催情剂塞进你的嘴里。[EachCock]勃起并立即喷出一股白色的先列腺液，无法抵抗涌入你血液的强效化学混合物，它是如此完美地为你量身定制，以至于点燃了你超越理智的激情。你没有注意到用过的注射器被拔出，但你绝对注意到了那个轻盈的绿色女人试探性抚摸的回归。她低语道，[say: 现在告诉我其他女孩怎么不重要了。这都只是为了得到你一些绿色的爱而耍的把戏，不是吗？]");
            outputText("[pg]你的回应既迅速又热情。你准确地告诉了她她想听的话，甚至更多，当战士灵活的手指抚摸你那根过度充血的操逼工具的每一寸坚硬时，你喘息着呻吟着。当你结束时，它喷出了另一股又浓又白的先列腺液，简直就像真的一样，你乞求道，[say: 是的，我来这里是为了你那美味多汁的小穴。求你了，操我的鸡巴。我太需要了！我什么都愿意做！]");
            outputText("[pg][say: 哇哦，你已经为我喷水了。我只希望剩下的足够支付你的罚款。如果没有，我总是可以在这些药水里加点魅魔的欢愉，]这位翠绿色的荡妇若有所思地说。她跨过你，她那摇晃的、圆润的屁股曲线在你上方悬挂了片刻，然后她把她那充满麝香味的、湿漉漉的小穴直接压在你的鼻子和嘴唇上。当地精把她肿胀的阴阜在你身上摩擦时，母精的液滴顺着你的脸颊滚落，她芬芳的小穴驱使着你被忽视的阴茎");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("疯狂地渴求着。谢天谢地，就在你屈服于她肿胀的阴阜并舔了一口时，一双柔软、布满皱纹的脚缠绕住了你的" + get_player().cockDescript(_loc1_) + "，引出了一股浓稠的先列腺液。");
            outputText("[pg]脚趾在你的" + get_player().cockHead(_loc1_) + "周围涂抹着你的先列腺液，然后温暖的脚底顺着你" + Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸长的肉棒向下滑动，将地精的汗水和你自己的体液混合在一起，涂抹在你的" + get_player().cockDescript(_loc1_) + "上。你舒服地呻吟着，你狂喜的声音被遮住你嘴巴的肿胀、湿透的阴唇所掩盖，你的肉棒顺从地在她脚上喷射出无助的白色轨迹。你嘴唇的每一次摩擦都会得到地精小脚趾的抚摸作为奖励。每一次舔舐都会让那双挤压着、沾满精液的脚上下滑动。每一次吸吮她的阴蒂都会让她加快速度。在这样的鼓励下，你无法阻止自己去侍奉地精那糖浆般的肉匣，像奴隶在光荣的神明祭坛前一样膜拜她的女性特征。");
            outputText("[pg]这个矮小丰满的女人移动双腿，将你的肉棒放在她的左脚上，同时她的右脚整个压在你的" + get_player().cockDescript(_loc1_) + "的下方，从顶端的马眼挤出一股浓稠的、压抑已久的精液。她的脚底在你的肉棒上前后摇晃，将一团又一团的精液挤到地精的脚趾上。过了一会儿，她换了换腿，让她现在湿透的脚来完成剩下的挤压工作。你快乐地喷射和扭动，像筛子一样滴水，但还没有达到真正的释放。地精没有这样的问题，她在你身上大声高潮了无数次。每一次连续喷射的女性体液都比上一次更多地浸湿了你的脸，当她结束时，你的[hair]已经被它粘住了，半埋在地精情欲的水坑里。你离高潮很近了。非常近。再多一点……再抽插几下。");
            outputText("[pg][saystart]");
            if(get_silly())
            {
               outputText("停在那儿，犯罪的人渣。");
            }
            else
            {
               outputText("等一下。");
            }
            outputText("[sayend] 翡翠战士回头看了你一眼，催促道，[saystart]来吧。填满我。释放出我让你积攒的所有精液");
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
            outputText("随着地精伴随着一声泥泞的吧唧声将自己刺入到底。你高潮了，在她体内猛烈地射精。你的背部拱起，身体紧绷，一波又一波的种子喷射进地精渴望婴儿的子宫里。她的小穴似乎把它喝了下去，以你射出的速度将精液从你身上吸走。");
            if(get_player().cumQ() >= 750)
            {
               outputText("即使是她近乎超自然的生育能力也无法跟上你惊人的男子气概，很快地精的肚子上就出现了一个小肿块。");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("当你结束时，它膨胀成一个圆润的、怀孕的圆顶。");
               }
            }
            outputText("你所有的激情都在这辉煌的高潮中消耗殆尽，让你感觉自己像一个空虚、废弃的躯壳。");
            outputText("[pg]地精站起身来，下体滴落着你的白色粘液，她向你眨了眨眼，消失在一个拐角处，留下你独自沉睡。");
         }
         else if(get_player().biggestCockArea() > get_monster().vaginalCapacity() && get_player().hasCock() && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            _loc1_ = get_player().biggestCockIndex();
            outputText("你急忙撕开你的[armor]，不顾一切地想把[eachCock]从地狱般的禁锢中释放出来。你太兴奋了，太饥渴了。任何关于羞耻心的念头都被立刻抛弃和遗忘，被你吞噬一切的情欲浪潮冲刷殆尽，你的手指滑到[oneCock]周围，开始把玩这根肿胀的工具。你立刻因为难以置信的、压抑已久的渴望而挺动起来，几乎当场就要射精。你抬起头，恳求地迎上那个绿皮肤女人的目光。");
            outputText("[pg]战士叹了口气，嘟囔道，[say: 又是一个长着他妈的树干一样粗的肉棒的家伙。] 她不情愿地解开带子，挺拔的深绿色乳头从束缚中挣脱出来，骄傲地挺立在胸前。[say: 做地精的缺点，] 这位运动型的绿皮肤美女解释道，[say: 就是遇到这样的肉棒……这样一根起伏、跳动的肉棒塔……我就是忍不住想试试。] 现在赤身裸体，你的俘虏者漫步走来，宽阔的臀部随着每一步左右摇摆。[say: 做一个尺寸控真是受罪，] 她带着苦笑说完。");
            outputText("[pg]你带着困惑的冷漠看着她的长篇大论，除了这个娇小的荡妇想要骑上你的肉棒之外，你几乎什么都不懂。你的手在你的" + get_player().cockDescript(_loc1_) + "上跳动的静脉上游走，你的身体继续处于自动驾驶状态，为这位翡翠美女快速而用力地自慰，而她则爬到你身上。当地精坐到你身上时，她多汁的裂口在你的尿道隆起处张开，她的双腿淫秽地向两侧分开。她命令道，[say: 把手拿开，伙计。你输给了一个地精，这意味着你得当爸爸了，不管你愿不愿意。]");
            outputText("[pg]丰满的翠绿色阴唇像帘子一样包裹住你的阴茎，将你狂热抽插的手指推开。你的俘虏发出一声淫荡的呻吟，开始在你巨大的肉棒上摩擦，将深色的生殖器在你粗壮的阴茎上来回拖拽。一颗挺拔坚硬的小阴蒂从地精闪闪发光的阴唇褶皱中探出头来，明显地抽动着，显示出极度的享受。在你自身贪得无厌的欲望驱使下，你在她身下扭动，试图让你的" + get_player().cockDescript(_loc1_) + "在她的阴道里滑动得更快。");
            if(get_player().biggestCockLength() > get_player().get_tallness() / 2)
            {
               outputText("你那长得不可思议的阴茎挡住了你视线，让你看不见那个风骚的地精，也完全没预料到即将到来的打击。");
            }
            outputText("毫不留情的一巴掌拍在了你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText("阴茎");
            }
            outputText("上，地精咕哝道，[say: 别乱动！]");
            outputText("[pg]你犹豫着服从了，突如其来的疼痛让你不敢再冒险乱动。你只能等待这个矮小丰满的女人玩够了，决定放过你。");
            outputText("[pg][say: 哦，你终于明白了？对我来说，你只是牲畜——只是一个供我玩弄的精液喷嘴，直到我玩腻了把你关进围栏里。也许如果你的精液足够浓稠，我会把你带回去，和我们其他的动物拴在一起。当然，如果我那样做，你就得射出足够的精液，让几十个主母怀孕，]这个翠绿色的荡妇在你阴茎上灵活的阴道发出淫荡的吧唧声中说道。不……如果她把你带回去，你就永远无法完成你来这里的目的了！她向前挪动身体，直到她");
            if(get_player().biggestCockLength() < get_player().get_tallness() / 2)
            {
               outputText("坐在你的脸上，你男性特征的" + get_player().cockHead(_loc1_) + "顶着她流口水的嘴唇。");
            }
            else
            {
               outputText("坐在你“上方”的地上，从你的感觉来看，你的" + get_player().cockHead(_loc1_) + "一直向上延伸，刺穿了她湿润的阴户。");
            }
            outputText("[pg]她柔软的双脚从两侧夹住你的阴茎，展现出你意想不到的柔韧性。柔软的脚底在你的阴茎上滑动抚摸。她的脚趾卷曲着，抚摸着你尿道隆起处敏感的两侧。甚至她脚后跟坚硬的突起也托着你" + get_player().cockDescript(_loc1_) + "的底部，用双脚为你手淫。");
            outputText("[pg]在大量阴道分泌物的润滑下，这位战士的双脚轻而易举地将你推向高潮的边缘。她每一次柔软细腻的踩踏都让你越来越近，很快你就在她被汗水和女性精液润滑的脚底颤抖起来。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("多亏了你惊人的男子气概，你向她等待的阴户中喷射出大团的先列腺液，但这只是即将到来的高潮的预兆。");
            }
            else if(get_player().cumQ() >= 250)
            {
               outputText("你向她等待的阴户中流出稳定的先列腺液，但这只是即将到来的高潮的预兆。");
            }
            outputText("[say: 很快就好了。是的，我是一名战士，但我也很注重保养。我把这些小宝贝保养得很好，很滋润，以防我需要用它们来对付像你这样的怪物阴茎。]");
            outputText("[pg]你试图咕哝着抗议，但声音被你的");
            if(get_player().biggestCockLength() >= get_player().get_tallness() / 2)
            {
               outputText("跳动着、坚硬如铁的阴茎");
            }
            else
            {
               outputText("俘虏柔软的臀部");
            }
            outputText("给闷住了。地精用脚用力拉扯，她那湿滑、被撑开的阴户勉强吞下了你整个" + get_player().cockHead(_loc1_) + "。你因为紧紧夹住你男性特征的钳子般的握力而高兴地颤抖，当这个绿色的小妖精设法再往里吞进一英寸时，你几乎要因为这种感觉而爆发了。她颤抖着，双脚突然在你的阴茎上疯狂地摩擦。地精柔软的脚底在你" + get_player().cockDescript(_loc1_) + "上涂抹，带着一种沉迷于快感的狂野，当她达到高潮时，汁液从她的裂口喷涌而出。这种猛烈的触摸对你紧绷的阴茎来说太过强烈，伴随着一阵紧致、火热的收缩，你感觉到即将到来的释放已经降临。你的阴茎根部出现了一个巨大的隆起，伴随着体内爆发出的温暖快感。它从你的根部一直传到顶端，然后伴随着撑开阴户的喷射消失在地精体内。她大声呻吟着，显然很享受被精液填满的感觉，你们俩一起叹息，而你的阴茎完成了最后的抽动，喷出");
            if(get_player().cumQ() <= 10)
            {
               outputText("几滴");
            }
            else if(get_player().cumQ() <= 100)
            {
               outputText("喷射");
            }
            else if(get_player().cumQ() <= 250)
            {
               outputText("浓稠的精液");
            }
            else if(get_player().cumQ() <= 1750)
            {
               outputText("一波又一波黏糊糊的精液");
            }
            else
            {
               outputText("精液的长河");
            }
            outputText("射进地精的小穴里。");
            if(get_player().cumQ() >= 2500)
            {
               outputText("在你大量的灌注下，她的肚子圆润地鼓了起来。");
            }
            outputText("[pg]这个绿皮女孩在从你身上离开之前，最后充满爱意地捏了几下你的" + get_player().cockDescript(_loc1_) + "。你瘫倒在地，依然感到有些兴奋，于是又开始自慰。地精笑着说，[say:再来几次这样的表现，我可能就不得不把你留下来了。]你一直玩弄着自己直到睡着，甚至在梦里，你还能感觉到那丝滑的小穴套在你的鸡巴上。");
         }
         else
         {
            outputText("被你自身的欲望所击败，你的手指飞快地伸向你的[armor]，急切地将其脱下，好把你那酸痛、娇嫩的小穴暴露在地精的视线中。这名战士用一种不以为然、困惑的表情看着你，尽管她依然站在原地，但当你在欲望中沉沦时，她的目光紧紧锁定着你。知道有观众在看，你扭曲着身体，向这个娇小的绿皮怪物展示你的[chest]和[vagina]。闪闪发光的水珠在你暴露的阴唇上形成，诱惑着你将手指滑入那湿滑的温暖之中。就好像你能抗拒得了似的。");
            outputText("[pg]你开始自慰，狂暴而毫不掩饰地蹂躏着自己的身体，完全忘记了是谁让你变成这副模样的。用探索的手指分开你湿滑的肉体，你迷失在每一次抚摸蜜壶时神经中传来的愉悦、温暖的爆炸感中。与此同时，你空闲那只手的手指");
            if(get_player().hasFuckableNipples())
            {
               outputText("在你的[nipple]里进进出出，像对待真家伙一样用力地自慰着。");
            }
            else
            {
               outputText("紧紧捏住一颗坚挺的乳头，下意识地扭动和拉扯着它。");
            }
            outputText("你的自慰幻想被双腕突然受到的撞击打断了。");
            outputText("[pg]你困惑地看着，只能眼睁睁地看着地精跨过你，骑在你俯卧的身体上，轻松地打掉你每一次试图触摸自己的尝试。她小心翼翼地挪开皮带，露出她的小穴。她甚至都不需要脱下盔甲。她熟练地用一根窄窄的皮带把你的双手绑在一起。你没有反抗，以为这个变态的绿皮婊子打算玩什么下流的性游戏，好让你们俩都爽上天。她低头冷笑着说，[say:我看不出操你这种不值钱的贱货有什么意义，但你让我发情了，所以以莉希丝那滴水的奶子起誓，你要让我爽上天。]");
            outputText("[pg]还没等你嘟囔着抗议，地精就转过身，一屁股坐在你的脸上，用她湿润的裂口堵住了你的嘴。麝香般的淫水顺着你的脸颊滑落，流到你的后颈，滴在地上。地精发出一声微弱、满足的呻吟，微微摇晃着臀部，将她阴蒂的凸起拖过你微张的嘴唇。她根本不顾及你的需求！你试图抗议，但换来的只是满嘴的黏液，尽管那味道刺鼻又令人兴奋。当你试图把手指抽回酸痛的小穴时，绑住你双手的皮带绷紧了，但在你受制于人的姿势下，你无法鼓起力量去制服这个娇小、强势的荡妇。");
            outputText("[pg][say:哦，你也想高潮吗？那就舔快点，荡妇。除非你让我爽了，否则你什么也得不到，]这个骑脸小穴的主人嘲讽道。为了说服她照顾你，你闭上嘴，藏起舌头，用你唯一还能控制的东西讨价还价。");
            outputText("[pg]一记恼怒的耳光狠狠地抽在你的[chest]的[skin]上，带来一阵刺痛。剧痛让你被欲望蒙蔽的视线中冒出金星，但你依然坚持着，只发出一声微弱的闷哼。地精叹了口气，摆弄着她的弹药带。你看不见她在做什么，但你知道她没安好心！你的手臂传来一阵短暂的刺痛，紧接着是一阵狂喜、燃烧般的快感。你的[vagina]分泌出汁液，你无法控制地呻吟起来。欲望在你的血管中跳动。渴望攀升到了新的高度。你无法抗拒这种感觉……再也无法抗拒了。你张大嘴巴开始舔舐，用舌头攻击那片茂盛的绿色小穴，只要能让她高潮，给你带来你渴望的解脱，你什么都愿意做。");
            outputText("[pg]你的另一只手臂传来一阵短暂的刺痛，紧接着是一阵眩晕。随之而来的是，你的性唤起似乎翻了一倍，攀升得如此之高，以至于你之前的性需求水平相比之下显得微不足道。你的[hips]不由自主地从地上抬起，每一丝空气拂过你肿胀的阴阜时带来的电流感都太美妙了，让你无法抗拒。地精显然很享受你的努力，评论道，[say:哦天哪，你在操空气吗？你真的是在享受微风吹过你裸露小穴的感觉吗？而且你下面湿透了！亲爱的，我可是个地精，但你现在让我都自愧不如了。]");
            outputText("[pg]你吸吮着她的阴蒂让她闭嘴，同时在地上滑动你的[butt]。每一次挺动，每一次移动，以及每一次对着你那虚幻情人的无意义起伏，似乎都比上一次更加狂热和绝望。你身下的泥土已经变成了散发着香气的泥浆。你的屁股被染成了棕色，当你在泥坑里拖动屁股时发出的湿润吧唧声，只会进一步激起你和你的俘获者的性欲。她呻吟着，[say:还想要更多吗？嗯……我觉得你现在这样是没法高潮的。]");
            outputText("[pg]你在地精那绿色、流着水的小穴里喘息着，除了在她的嘴唇上哼哼，用舌头在她的阴蒂上画圈之外，你什么也做不了。你太兴奋了，以至于你感觉自己能感觉到高潮，它潜伏在一座你无法翻越的山丘上。你绝望、下流的动作给你带来了快感，但这还不够，即使有大量该死的地精药物涌入你的系统。");
            outputText("[pg]你娇嫩、肿胀的乳头上的一阵刺痛是你得到的唯一警告，随后又一波麻醉催情剂袭击了你的系统。你的肌肉僵硬了，你的小穴似乎活了过来，简直像喷泉一样喷出淫水。你身下的水坑已经淹到了你的肩膀，但你太沉迷于性幻想和脸上的美味小穴了，根本不在乎。地精粗壮、圆润的大腿夹紧你的头，她开始喘息，[say:操，对，舔那里，你这个饥渴的荡妇，舔我的产道，你这个微不足道的舌头荡妇。我应该把你带进我们的城市。我相信我们可以把你关在一个隔间里，也许除了你的嘴，把其他地方都锁在墙后，让你不停地舔几十个怀孕的绿色小穴，直到你只能靠黏糊糊、甜腻腻的女孩精液为生。]");
            outputText("[pg]你的双眼翻白，除了那曲线优美的翠绿臀部，你也看不到别的什么了。你的舌头完全陷入了疯狂，在那些滴入你大张着、呻吟着的嘴里的粘液帘幕中来回抽打。地精在你身上摩擦着，大声呻吟着达到了她自己的高潮，几乎不在乎你的快感。谢天谢地，随着最后一次注射，你的[vagina]变得如此敏感，以至于拂过你红肿阴唇的每一丝微风都感觉像是一条独立的舌头。你扭动着，完全无法抗拒的渴望控制了你腰部以下的身体。突然灌满你嘴巴的雌性精液让你吃了一惊，然后你也高潮了，你的[vagina]仅仅因为微弱的气流就达到了顶点。");
            outputText("[pg]你在混合着各种体液的水坑中昏了过去，几乎没有注意到地精的离开。");
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function gobboGetsRapedMaleFits() : void
      {
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         clearOutput();
         get_images().showImage("goblin-win-male-getridden");
         if(get_player().cockArea(_loc1_) > get_monster().vaginalCapacity() * 0.8)
         {
            outputText("你把被打败的地精抱了起来，打量着她。她可怜巴巴地把双臂交叉在胸前，问道：[say: 现在怎么办？] 当她以为你没注意时，眼睛却往下瞟。看到你" + get_player().cockDescript(_loc1_) + "的尺寸，她的脸上短暂地闪过一丝痛苦的表情。你产生了一个想法，要给她塞进她无法承受的巨大肉棒，于是你把她放低，对准你的" + get_player().cockDescript(_loc1_) + "。龟头滑入她湿润的肉褶之间，撑开了她，也减轻了你手臂上的一些重量。她微微皱眉，双腿尽可能地缠绕在你的[hips]上。[pg]");
            outputText("你开始走动，让你的动作配合重力，让你毫不费力地插进她体内。当她滑下来时，那肿胀湿润的肉壁紧紧地夹住了你，");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("痛苦地摩擦着你的恶魔肉突");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("痛苦地撑开以容纳你的肉结");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE || get_player().cocks[0].get_cockType().get_Index() > 3)
            {
               outputText("感觉紧紧地包裹着你，甚至有些发疼");
            }
            outputText("。随着你的每一步，她都滑得更深，将她撑到了极限，直到她几乎完全被你刺穿，她抓住了你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText(get_player().allBreastsDescript());
            }
            else
            {
               outputText("躯干");
            }
            outputText("来支撑自己。随着这个绿皮女孩的呼吸，一股稳定的律动按摩着你。你意识到她的身体有多大一部分是为了容纳怪物的性器官而存在的，难怪地精在战斗中如此脆弱！[pg]");
            outputText("她开心地喘着气，舌头从嘴里伸了出来，评论道：[say: 好满……] 尽管体内的怪物仍让她感到有些痛苦，但她开始为你加油打气：[say: 哦哦，快——啊——点！我想颠起来！][pg]");
            outputText("这就是你需要的全部鼓励，你开始跑起来，感觉她轻盈的身体在你的" + get_player().cockDescript(_loc1_) + "上颠簸，引出一阵阵夹杂着快乐的哀号、呻吟和轻微痛苦尖叫的混杂叫声。她的小拳头紧紧抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("乳房");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("，她紧紧地挂在你身上，丰满的乳房紧贴并撞击着你。你用力奔跑，感受着她的颠簸和扭动，她的小穴和急促的呼吸以前所未有的方式挤压和榨取着你。你确信，如果每次慢跑都能有这种感觉，你的身材一定会棒极了。[pg]");
            outputText("[say: 哦，操，猛男，颠死我！对，就是这样，] 她呻吟着，[say: 你要射了吗？我的天，求你射吧，我需要你像这样把我填满！][pg]");
            outputText("高潮即将来临的熟悉紧绷感在你的腹股沟中蔓延，随着你接近释放，这种感觉越来越强烈。你加快了步伐，全力冲刺，让女孩在你身上弹跳晃动，她紧紧地攀附着你，完全靠你的" + get_player().cockDescript(_loc1_) + "支撑着。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]收紧，释放出高潮的种子。");
            }
            outputText("强力高潮的嚎叫声充满了你的耳朵，你的射精让这个绿色的小肉便器也达到了高潮。她的一只手松开，开始抚摸她的肚子，同时亲吻和舔舐你的肚脐。");
            if(get_player().cumQ() >= 100)
            {
               outputText("你强化的身体轻松地将她填满了浓精，让她的肚子微微凸起，你的种子深深地埋在她的子宫里，无处可逃，她的小穴被你的" + get_player().cockDescript(_loc1_) + "紧紧地堵住。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("高潮如此猛烈，以至于当你平静下来时，她看起来就像怀了一个健身球那么大的孕肚。你的精液被困在她的体内，无法在她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间找到任何缝隙流出。");
            }
            else if(get_player().cumQ() >= 250)
            {
               outputText("高潮如此猛烈，以至于当你平静下来时，她看起来就像快要临盆了。你的精液无法在她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间找到任何缝隙流出。");
            }
            outputText("[pg]");
            outputText("你喘着粗气停下来，把塞满的地精从你身上拉下来，放在地上，满意地微笑着，看着你的精液");
            if(get_player().cumQ() >= 250)
            {
               outputText("像河水一样涌出");
            }
            else
            {
               outputText("漏出");
            }
            outputText("从她现在大张的阴户里流出。她揉着肚子，向你飞吻，仍在努力平复呼吸。你得意地笑了笑，开始穿衣服。穿好后，你转身离开，但她最后一次向你喊道，[say: 嗯嗯，希望你不介意我再去找你。我需要更多你的精液，这样我才能给你生很多漂亮的小骚货来操！][pg]");
            if(get_player().cor > 50)
            {
               outputText("轻笑");
            }
            else
            {
               outputText("颤抖");
            }
            outputText("，你心满意足地回到了营地。");
         }
         else
         {
            outputText("你抱起被击败的地精，打量着她。她可怜巴巴地双臂抱胸，问道：[say: 现在怎么办？] 当她以为你没注意时，眼神却向下瞟去。你暗自思忖“英雄所见略同”，然后把她放低，对准你的" + get_player().cockDescript(_loc1_) + "。龟头滑入她湿润微张的阴唇之间，擦过她的入口，为你分担了她的一些重量。她变成了斗鸡眼，幸福地微笑着，双腿尽可能地缠绕在你的[hips]上。[pg]");
            outputText("你开始走动，让动作配合重力，让你毫不费力地插入她。当她滑下时，那些肿胀湿润的肉壁紧紧地夹住了你");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("完美地摩擦着你的恶魔肉刺");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("紧紧地撑开包裹住你的肉结");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE || get_player().cocks[0].get_cockType().get_Index() > 3)
            {
               outputText("感觉完美地包裹着你");
            }
            outputText("。你每走一步，她就向下滑得更深，直到她完全被你刺穿，抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText(get_player().allBreastsDescript());
            }
            else
            {
               outputText("躯干");
            }
            outputText("来支撑自己。随着这个绿色女孩的呼吸，一阵稳定的律动按摩着你，让你意识到她身体的很大一部分一定是为了容纳怪物的性器官而存在的。[pg]");
            outputText("她开心地喘息着，舌头从嘴里伸出来，为你加油打气，[say: 哦哦哦，快——啊——再快点！我想弹起来！][pg]");
            outputText("这就是你需要的全部鼓励，你开始奔跑，感觉到她轻盈的身体在你的" + get_player().cockDescript(_loc1_) + "上弹跳，引出一阵阵快乐的哀嚎和呻吟。她的小拳头紧紧抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("乳房");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("，她紧紧地挂在你身上，用她丰满的乳房挤压和撞击着你。你用力奔跑，感觉到她的弹跳和扭动，她的小穴和急促的呼吸开始以前所未有的方式挤压和榨取你。你确信，如果每次慢跑都能有这种感觉，你的身材一定会很棒。[pg]");
            outputText("[say: 哦，操，猛男，让我弹起来！对，就是这样，]她呻吟着，[say: 你要射了吗？我的天啊，求你射吧，我需要你这样填满我！][pg]");
            outputText("高潮即将来临的熟悉紧绷感在你的腹股沟中蔓延，随着你接近释放，这种感觉越来越强烈。你加快了步伐，全力冲刺，让女孩在你身上弹跳晃动，她紧紧地攀附着你，完全靠你的" + get_player().cockDescript(_loc1_) + "支撑着。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]收紧，释放出高潮的种子。");
            }
            outputText("强力高潮的嚎叫声充满了你的耳朵，你的射精让这个绿色的小肉便器也达到了高潮。她的一只手松开，开始抚摸她的肚子，同时亲吻和舔舐你的肚脐。");
            if(get_player().cumQ() >= 250)
            {
               outputText("你强化的身体轻松地将她填满了白浊，让她的肚子微微凸起，并顺着你的");
               if(get_player().balls > 0)
               {
                  outputText(get_player().ballsDescriptLight());
               }
               else
               {
                  outputText("腿");
               }
               outputText("。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("这次高潮如此强烈，以至于当你平息下来时，她看起来已经大腹便便，你的精液从她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间能找到的任何缝隙中喷射出来。");
            }
            outputText("[pg]");
            outputText("你喘着粗气停下来，把塞满的地精从你身上拉下来，放在地上，满意地微笑着，看着你的精液");
            if(get_player().cumQ() >= 250)
            {
               outputText("像河水一样涌出");
            }
            else
            {
               outputText("漏出");
            }
            outputText("从她现在大张的阴户中流出。她揉着肚子，向你飞吻，仍在努力平复呼吸。你得意地笑了笑，开始重新穿衣。完成后，你开始走开，但她最后一次向你喊道，[say: 嗯，我希望你不介意我再去找你。我需要更多你的精液，这样我才能给你生很多漂亮的荡妇让你操！][pg]");
            if(get_player().cor > 50)
            {
               outputText("轻笑");
            }
            else
            {
               outputText("颤抖");
            }
            outputText("，你心满意足地回到了营地。");
         }
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Generic");
      }
      
      public function gobboGetsRapedFem() : void
      {
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         clearOutput();
         if(get_player().isTaur())
         {
            get_images().showImage("goblin-win-female-taur-rapedfem");
            outputText("你抓起地精，用手臂将她紧紧夹在身侧。你从她那身放荡的衣服上撕下一块柔软的皮革，把她的双手反绑在背后，以防她耍什么花招。她抬头看着你，眼睛睁得大大的，一想到要任凭一个比她大得多的生物摆布，她就感到害怕。尽管如此，从你侧腹沾染的淫液来看，她似乎被挑起了性欲。你低头看着她，说道：[say: 看来这个小骚货还有受虐倾向啊？][pg]");
            outputText("她羞红了脸，随着她的点头，女性体液的流量变大了。你知道她可能会享受你能和她做的任何性行为，所以你不如给她个惊喜。一个残忍的想法在你的脑海深处形成——报复她试图给你下药。你轻松地从她的腰带上扯下小袋子，随机拿出几个瓶子。地精明白了你的意图，开始挣扎着想要挣脱，但你轻松地制服了这个娇小的女人，强行把药剂一个接一个地塞进她嘴里。当她试图把它们吐出来时，你按摩她的喉咙，触发她吞咽的本能。[pg]");
            outputText("灌到第三瓶时，她已经放弃了挣扎，转而试图在你的身体上寻找可以摩擦的地方。她张大嘴巴，整张脸因为欲望而涨得紫红。你强行喂完剩下的瓶子，然后松开她，在她落地前抓住了她的脚踝。她发情的味道以及所有药物和催情剂散发出的气味让你产生了一点“接触性兴奋”，至少你的" + get_player().vaginaDescript(0) + "已经滴下了淫液。你的欲望可以等一下。这个荡妇需要受到惩罚。[pg]");
            outputText("你把这个生物翻转过来，重新夹在臂弯里，这次让她面向相反的方向。*啪！* 你的手拍在她圆润的屁股上。你把手收回来，感觉到了她那突出的阴唇带来的湿润。这个小婊子的小穴因为渴望而发炎，仅仅是简单的打屁股就让她几乎要喷水了。你又拍了她一下，看着她全身紧绷，感觉到她的体液溅到了你身上。[say: 你把我弄湿了，你个贱人！！坏婊子！]你骂道，打得更用力了。[pg]");
            outputText("地精尖叫起来，虽然你无法确定是高兴还是痛苦。你开始越来越用力地打她的屁股，反复的虐待让她的屁股从绿色变成了红色。她全身开始抽搐和喷水，把你的手臂溅满了她的蜜汁。她高潮了！好吧，在看了那样的表演之后，她也会让你高潮的——否则！[pg]");
            outputText("这次你真的把她放下了，但不给她站起来的机会，粗暴地把你的" + get_player().vaginaDescript(0) + "压在她身上。她对着你乱踢乱打，沉浸在自己的快感中，根本不知道发生了什么。她的小拳头无力地捶打着你的臀部，感觉出奇的好，你让她继续了一会儿，直到你觉得“前戏”够了，开始粗暴地把你的小穴在她的脸上摩擦，让她的舌头滑进你的肉褶里。[pg]");
            outputText("你看不见她在做什么，但她的挣扎很快就停止了，因为味道和气味促使她开始舔舐。你颤抖着；感觉比想象中好太多了。也许她的一些药水在她的嘴唇和舌头上留下了残留物，但你不在乎。随着你的后腿因为快感而发软，你把更多的重量压在这个小荡妇身上。她的反应是把手滑上来，捶打你的[clit]，试图把你从她身上弄下去。[pg]");
            outputText("她的努力得到了回报，你在这个被下药的绿色婊子身上高潮了，在她的舌头上留下了小穴的味道。她的脸上带着一种奇怪的呆滞笑容，看起来处于一种介于清醒和睡眠之间的奇怪状态。你看着她在地上抽搐扭动，大口喘气，不断地高潮。虽然一开始你很担心，但抽搐开始减慢；这个小逼应该没事了。[pg]");
            outputText("你随意地穿上衣服，无视了那个沉浸在极乐中的地精的喘息和呻吟，准备离开。你最后回头看了一眼，发现她的体液已经汇聚成了一个比她还大的水坑。她醒来时可能会有严重的宿醉。你叹了口气，小跑着离开了，对自己做得太过火感到有些内疚。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
         else if(get_player().isNaga())
         {
            get_images().showImage("goblin-win-female-naga-rapedfem");
            outputText("你滑行到无助的地精身边，她半是恐惧半是好奇地看着你。");
            if(get_player().face.type == 5)
            {
               outputText("你对她露出獠牙，她的好奇心消失了。她转身想跑，但你的尾巴比她快。");
            }
            else
            {
               outputText("你对她笑了笑，她的恐惧消失了。不过她仍然很警惕，你确保在改变主意之前用尾巴抓住了她。");
            }
            outputText("[pg]");
            outputText("你紧紧地缠住挣扎的猎物，在这个过程中脱掉了她那身放荡的“衣服”。失去行动能力的地精哀怨地向你呜咽，你的回应是用手拍打她的小穴。把手抽回来时，你惊讶地发现它有多湿。你在她脸上擦干手，把头凑到她耳边。[pg]");
            if(get_player().cor > 60)
            {
               outputText("你对这个吓坏了的女人发出了一些语无伦次的嘶嘶声，她在你的抓握中开始发抖。你笑着把手指滑进她的嘴里，她开始吸吮它们，试图安抚你。她的小舌头感觉棒极了；显然她在这方面非常有经验。");
               outputText("你用手指掰开她的嘴。她很困惑，但当你摆弄身边的东西时，她无法反抗。她意识到即将发生什么时已经太晚了，你从她的小袋子里拿出了几个闪亮的瓶子。作为试图毒害你的惩罚，你开始把一瓶又一瓶的药水倒进她的嘴里，抚摸她的喉咙，强迫她喝下去。[pg]");
            }
            else
            {
               outputText("你的手指在她的脸上滑动，问她是否为试图毒害你而感到抱歉。她拼命地向你点头，因为被勒得太紧或者太害怕而无法回答。你愉快地对她微笑，感觉到她的身体在你的掌控中稍微放松了一点。你的手指滑进她的嘴里，她急切地吸吮着，显然不想激怒你。她的舌头很灵巧，你享受了一会儿这种体验，直到你觉得已经把她玩够了。[pg]");
               outputText("你张开手指，撑开她的嘴，不让她闭上。困惑的地精试图看清你在她身边做什么，但却看不到。然而，当你从她的袋子里拿出一把闪亮的烧瓶时，她的身体再次紧绷起来，向你发出呜咽声。[pg]");
               outputText("不过，你对这个生物的怜悯还不足以让你放弃惩罚她，你从这堆药剂中挑出了一些看起来药效较弱的。你一边轻轻抚摸她的喉咙以确保她吞咽下去，一边将一瓶又一瓶的药剂灌入她口中。[pg]");
            }
            outputText("药效很快就显现出来了，没过多久，这个荡妇的皮肤就呈现出紫红色，并拼命地想在你的蛇尾上摩擦。她沮丧地喘息和呻吟着，因为她那滴着淫液的小穴无法从你光滑的腹部获得足够的快感，而你则在一旁等待，享受着这种感觉。[pg]");
            outputText("你将尾巴滑到她的小穴处，用尾尖挑逗她的阴蒂。她立刻喷出一股体液，将你原本就湿滑粘稠的蛇尾彻底涂满了她的淫水。你在她面前摇了摇手指，示意她停下；你还没玩够呢。[pg]");
            outputText("伴随着一个流畅的动作，你的尾巴滑入她的体内，让她舒服地呻吟起来，并挺起臀部。你在她体内蠕动，把她撑得那么大，你怀疑她会合不拢腿好一阵子。你的尾尖触碰到了她爱之通道的尽头，你惊讶地发现她的子宫正在跳动，试图抓住一些不存在的东西。出于好奇，你将尾巴移到开口处，它抓住了你，将你拖入她的子宫。你对着这个快感超载的地精微笑，开始摩擦她的肉壁。她紧紧地夹住你，在狂喜中尖叫出声，双眼翻白。[pg]");
            outputText("毫无预兆地，你拔出了整根尾巴，感觉到一股巨大的液体从你身后滑落。地精几乎失去了意识，所以你在她的袋子里四处寻找能帮忙的东西。不过，似乎没有什么东西能帮上忙，你开始后悔自己太残忍了，就在这时，你注意到最底部有一个特别小的烧瓶。[pg]");
            outputText("你把它拿出来仔细端详。它只有一厘米多长，里面装满了白色的液体。上面有个标签，但字太小了，根本看不清。你觉得你能认出[say:醒醒]这个词，但也不完全确定。[pg]");
            outputText("你耸了耸肩，把里面的东西倒进地精的嘴里，只有一滴左右，很快就被她的舌头吸收了。起初什么也没发生，然后这个小小的身影开始剧烈地颤抖。你不知道该怎么办，只好保持原样，紧紧地抱着她。颤抖像开始时一样突然停止了，你以为你可能把她弄死了。[pg]");
            outputText("不过，片刻之后，这就证明是大错特错了，因为她猛地睁开眼睛，大喊一声[say:呜呼！]你被她这突如其来的态度转变吓了一跳，但决定顺其自然，把你的" + get_player().vaginaDescript(0) + "塞进这个显然精力充沛的小生物嘴里。[pg]");
            outputText("你听到一声含糊不清的大喊[say:交给我吧，老大！]，然后她开始舔舐并轻轻咀嚼你。这种感觉太棒了，你忍不住想知道那个小瓶里装的是什么，但当你高潮时，这个念头就从你脑海中抹去了，你喷了她一身。[pg]");
            outputText("你一次又一次地高潮，地精不知疲倦，你灌进她体内的各种物质的残留物仍然涂在她的嘴唇和舌头上，让你不想停下来。最终你累了，把地精从你的蛇尾中释放出来。她双脚着地，做了一个脚尖旋转，在空地上跑了一会儿（一直像个疯女人一样咯咯地笑），然后脸朝下倒在她的“衣服”上。[pg]");
            outputText("你对刚才发生的事情感到彻底困惑，决定不拿命运开玩笑，不再在这个被下了重药的生物附近逗留，一拿好东西就回营地去了。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
         else
         {
            get_images().showImage("goblin-win-female-rapedfem");
            outputText("你抱起地精，让她坐在你的膝盖上，用左手将她的双臂反绑在背后。你从她那荡妇般的衣服上撕下一块柔软的皮革，用来绑住她的手臂。她抬头看着你，眼睛睁得大大的，一想到要任由一个体型更大的生物摆布就感到害怕。尽管如此，如果弄脏你膝盖的汁液能说明什么的话，她似乎被激起了不小的性欲。你低头看着她，说道，[say:看来这个小荡妇有受虐倾向啊？][pg]");
            outputText("她羞红了脸，随着她的点头，女性体液的流量变大了。你知道她可能会享受你能和她做的任何性行为，所以你不如给她个惊喜。一个残忍的想法在你的脑海深处形成——报复她试图给你下药。你轻松地从她的腰带上扯下小袋子，随机拿出几个瓶子。地精明白了你的意图，开始挣扎着想要挣脱，但你轻松地制服了这个娇小的女人，强行把药剂一个接一个地塞进她嘴里。当她试图把它们吐出来时，你按摩她的喉咙，触发她吞咽的本能。[pg]");
            outputText("到了第三瓶，她已经放弃了挣扎，转而试图把她的小穴在你的膝盖上摩擦。她的嘴巴张得大大的，整张脸因为欲望而涨得紫红。你强行喂她喝完剩下的几瓶，然后推了她一把，抓住她的脚踝，把她按在你的腿上，屁股撅在空中。她发情的气味以及所有药物和催情剂散发出的蒸汽让你有点“接触性兴奋”，至少在某种意义上，你的" + get_player().vaginaDescript(0) + "");
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
               outputText("慢慢浸湿了你的大腿");
            }
            else
            {
               outputText("因渴望而流下淫水，在你身下积成一滩");
            }
            outputText("。你的欲望可以等等。这个荡妇需要被惩罚。[pg]");
            outputText("*<b>啪</b>！* 你的手狠狠地打在她圆润的屁股上。你收回手，感觉到几滴湿润，这多亏了她突出的阴唇。这个小婊子的阴户因为渴望而发炎，仅仅是打屁股就让她几乎喷水了。你又打了一巴掌，看着她全身紧绷，感觉到她的体液溅到了你身上。[pg]");
            outputText("[say:你把我弄湿了，你这个婊子！！坏婊子！]你骂道，打得更用力了。[pg]");
            outputText("地精尖叫起来，虽然你无法确定是高兴还是痛苦。你开始越来越用力地打她的屁股，反复的虐待让她的屁股从绿色变成了红色。她全身开始抽搐和喷水，把你的手臂溅满了她的蜜汁。她高潮了！好吧，在看了那样的表演之后，她也会让你高潮的——否则！[pg]");
            outputText("你把她从你的腿上拉开，把她的脸推到你的" + get_player().vaginaDescript(0) + "上。她挣扎着，太沉迷于自己的快感而没有意识到发生了什么。你强行把她丰满的小嘴唇贴在你的小穴上，然后摩擦，让她的舌头滑进你的褶皱里。她的眼睛变成了白色的小缝，瞳孔向上翻，但里面似乎有什么东西让她的舌头认出了味道并开始舔舐。你颤抖着；感觉比应该的要好得多。也许她的一些药水在她的嘴唇和舌头上留下了残留物，但你不在乎。[pg]");
            outputText("你在这个被下药的绿色婊子身上高潮了，");
            if(get_player().vaginas[0].vaginalWetness > 4)
            {
               outputText("把你的体液溅到她身上");
            }
            else if(get_player().vaginas[0].vaginalWetness > 3)
            {
               outputText("用你快感的证明涂满她的脸");
            }
            else if(get_player().vaginas[0].vaginalWetness > 2)
            {
               outputText("让她沾满你的下体汁液");
            }
            else
            {
               outputText("在她的舌头上留下小穴的味道");
            }
            outputText("。");
            if(get_player().biggestLactation() >= 3.5)
            {
               outputText("乳汁从你的乳头喷出，浸湿了这个娇小的荡妇。");
            }
            else if(get_player().biggestLactation() > 2)
            {
               outputText("两股乳汁浸湿了荡妇的头发，像白色的眼泪一样顺着她的脸流下来。");
            }
            else if(get_player().biggestLactation() >= 1)
            {
               outputText("乳汁从你的乳头滴下，落在这个小荡妇的头发上。");
            }
            outputText("她的脸上带着一种奇怪的呆滞笑容，看起来像是处于某种介于清醒和睡眠之间的奇怪状态。你抓住她的头发把她扔在地上，看着她的身体抽搐和跳动，因为她的高潮继续折磨着她的身体。看起来它开始减慢了，这个小婊子应该会没事的。[pg]");
            outputText("你随意地穿上衣服，无视了那个沉浸在极乐中的地精的喘息和呻吟，准备离开。最后回头看了一眼，你发现她的体液已经积成了一个比她还大的水坑。她醒来时可能会有严重的宿醉。你");
            if(get_player().cor > 50)
            {
               outputText("假笑");
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
         spriteSelect(SpriteDb.get_s_goblinWarrior());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         get_images().showImage("goblin-win-male-buttsex");
         outputText("像往常一样，你轻松击败了另一个淫荡的地精。你对自己的能力有什么怀疑吗？知道接下来会发生什么，地精为不可避免的事情做好了准备。她舔着嘴唇，脸上因兴奋而泛红。为了进一步刺激你，她张开双腿，露出更多她湿透的小穴。[pg]");
         outputText("[say: 操我，种马！]她恳求道。虽然被打败了，但她还是有胆量提出要求。[say: 把你的精液灌满我！]她的失败似乎并没有让她的嘴巴安静下来。[pg]");
         outputText("你感到被侮辱了。谁在之前的战斗中获胜了？如果你自己不是那么饥渴的话，你本可以把她留在那里，让她在自己的汁液中打滚。那么你该怎么做呢？经过一番默默的思考，你产生了一个极其邪恶的想法。[pg]");
         outputText("快速脱下你的[armor]后，你撕掉了这个绿皮女人身上仅有的一点衣服。你轻松地把她从地上举起来，让她跨坐在你的" + get_player().cockDescript(_loc1_) + "上。这个小地精婊子被你迷住了，她的身体因兴奋而颤抖。[pg]");
         outputText("你带着冷笑，拿起你的" + get_player().cockDescript(_loc1_) + "的龟头，把它压在她的屁眼上，而不是她湿透的阴唇上！[pg]");
         outputText("[say: 不是那里！]她恳求道，嘴唇颤抖，眼泪汪汪。[say: 我需要你的精液来建立我自己的部落！]她解释道。[pg]");
         outputText("你对你手中颤抖的女人什么也没说。没有任何语言可以描述你粉碎她的梦想所感受到的快乐。以长者之名，这个世界真的腐化了你，而你喜欢这样！[pg]");
         outputText("你毫不留情地将这个地精婊子按在你的" + get_player().cockDescript(_loc1_) + "上，几乎要把她刺穿了！她后庭瞬间传来的紧致感几乎让你爽上天！她越是挣扎，她臀部的肌肉就把你夹得越紧。你沉浸在狂喜中，一时僵在原地，舌头耷拉在嘴边，双眼翻白。[pg]");
         outputText("地精抗议着，挣扎得更厉害了，甚至用拳头捶打你的胸口；但她现在太虚弱了，她的捶打简直就像在挠痒痒。她这微不足道的攻击足以让你从肉欲的迷醉中清醒过来。你狂热地咧嘴笑着，抓住她纤细的腰肢，狠狠地操干她！随着你越插越深、越插越猛，你的" + get_player().cockDescript(_loc1_) + "很快就适应了她被撑开的后庭！[pg]");
         outputText("[say:这不是我想要的！]她哭喊着，[say:这不是我想要的！]如果你的" + get_player().cockDescript(_loc1_) + "撑开她的屁股还不够的话，她还能感觉到你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().sackDescript());
         }
         else
         {
            outputText(get_player().hipDescript());
         }
         outputText("随着每一次抽插拍打着她丰满的臀部，仿佛在挑逗她。[pg]");
         outputText("地精紧致的后穴让你难以把持。你的身体剧烈抽搐，将大量的精液射入她的体内。发泄完后，你把这个小婊子扔到地上；你现在对她已经没有兴趣了。[pg]");
         outputText("当你捡起你的[armor]开始穿衣服时，你瞥了一眼那个地精。她的手开始在她那被撑开的肛门里抠挖，拼命地想把你射进她体内的精液收集起来。你得意地笑了笑，若无其事地走开了，对自己非常满意。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
      }
      
      public function giveGoblinAMilkMustache() : void
      {
         clearOutput();
         outputText("你慢慢走向倒地的地精，温柔地告诉她现在一切都会好起来的。她有点怀疑地看着你，张开双腿，显然希望你能满足她的欲望。你对她摇了摇头，双手托起你的" + get_player().biggestBreastSizeDescript() + "，告诉她喂食时间到了。地精恼火地看着你，说道：[say: 我不想要你的奶子！我想要你的下面！]你嘲笑她，抓住她的手臂，把它们拉到她的脑后。[pg]");
         outputText("她挣扎着，试图挣脱你的控制，想要把什么东西，任何东西塞进她饥渴的小穴里，同时大喊[say: 来吧，" + get_player().mf("荡妇","种马") + "，你知道你想要的——唔！]你把她的嘴按在你的" + get_player().nippleDescript(0) + "上，打断了她的话。她不由自主地喘着气，嘴里灌满了你的乳汁。瞬间她僵住了，然后慢慢咽下嘴里的奶水。片刻之后，她在你怀里放松下来，温柔地吸吮着你的乳头。她以前充满欲望的样子不见了，取而代之的是一个现在只想要你的奶水的顺从女孩。你慢慢放下手，开始揉搓她仍然湿滑的小穴。作为回应，她把手放在你的另一个[nipple]上，玩弄着它，挑逗着你。[pg]");
         outputText("过了一会儿，你感觉到地精在你怀里睡着了。即使这样，她仍然继续温柔地吸吮着你的[nipple]。你满意地笑了笑，轻轻地把地精从你的胸前抱起。你轻轻拍了拍她的肩膀，她又醒了过来。她给了你一个有点茫然的眼神，然后你轻轻推了她一下，她开始带着空洞、流口水的眼神走开了。");
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
         outputText("地精趴在地上，在战斗后筋疲力尽。她丰满的双腿无意间张开，屁股翘在半空中，让你清楚地看到她湿润的小穴，而她正试图让自己高潮。看来这个绿皮荡妇已经把你忘了——太多次徒劳的遭遇可能让她放弃了寻找一个强壮的雄性来把她灌满精液的希望。[pg]");
         outputText("对她来说幸运的是，你完全打算改变这一点。[pg]");
         outputText("你开始抚摸你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("当你走向毫无防备的地精女孩时，你欣赏着她那完美圆润的臀瓣随着她急促的动作而晃动，她柔软的大腿紧紧夹住双腿间那只急切的手。你弯下腰，迅速抓住地精宽大的臀部，女孩惊讶地尖叫了一声，转过身来，看到了你勃起的长度");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText(".[pg]");
         outputText("[say: 哇——哇！嘿，帅哥，你觉得你在后面干什么？]她惊叫道，对你的突然出现感到惊讶多于害怕。你没有回答，而是决定抓住你的肉棒");
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
         outputText("在她光溜溜的屁股上，而你的受害者正焦急地等待着你的下一步动作。你花时间用双手按摩着地精那淫荡的屁股，然后将你的" + get_player().cockDescript(_loc1_) + "滑入她柔软的臀瓣之间。你那发情的受害者显得很不耐烦，试图在你身上摩擦，同时张开她湿润的阴唇，热情地发现有人愿意和她交配。你用力拍打她的屁股，加快了抽插的速度——就在你终于将");
         if(get_player().cockTotal() == 1)
         {
            outputText("你的阴茎插入这个喘息的荡妇体内，在你进入她紧致的小穴时猛烈地将她向前推");
         }
         else if(get_player().cockTotal() == 2)
         {
            outputText("你的两根阴茎都插入了这个喘息的荡妇体内，在你进入她紧致的小穴和屁眼时猛烈地将她向前推");
         }
         else
         {
            outputText("你的两根阴茎插入了这个喘息的荡妇体内，在你进入她紧致的小穴和屁眼时猛烈地将她向前推——你的另一根肉棒");
            if(get_player().cockTotal() >= 4)
            {
               outputText("");
            }
            outputText("仍然夹在她的臀瓣之间");
         }
         outputText(".[pg]");
         outputText("你粗暴地捣弄着地精女孩，紧紧抓住她的臀部，而她则高兴地尖叫着。你的腹股沟拍打她的声音在整个区域回荡，紧接着是你粗重的喘息声和地精狂喜的呻吟声。你的受害者挣扎着想用手臂撑起身体，却因为你侵入她体内的感觉而再次瘫倒。[pg]");
         outputText("最终，你开始感觉到自己即将达到高潮，你的动作越来越快，为释放做准备。你身下的地精已经沉迷于你的" + get_player().cockDescript(_loc1_) + "带来的快感中，她的眼睛向上翻，舌头从嘴里流出口水，而她淫荡的脸则在你目前正捣弄她的地面上摩擦。伴随着最后一次抽插，你的臀部向前猛挺，用你浓稠的精液涂满她的体内，享受着你的射精将她填满并堵住她入口的感觉");
         if(get_player().cockTotal() == 2)
         {
            outputText("");
         }
         outputText("。你慢慢地从她紧致的身体中抽出，最后用剩下的精液覆盖了她弯曲的背部和挺翘的臀部。[pg]");
         outputText("你重新站起来，慢慢地撸动自己，精液从你的" + get_player().cockDescript(_loc1_) + "滴落到地精瘫倒的身体上。她需要一段时间才能恢复意识，但你确信当她醒来时，她会更好地欣赏性爱。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
   }
}

