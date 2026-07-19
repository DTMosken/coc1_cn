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
   
   public class GoblinShamanScene extends BaseContent
   {
      
      public function GoblinShamanScene()
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
         spriteSelect(SpriteDb.get_s_goblinShaman());
         get_images().showImage("goblin-win-male-corruptedfuck");
         outputText("你开始脱下你的[armor]，低头看着你无助的准袭击者和即将成为受害者的人，饥渴地舔着嘴唇。你的[cocks]");
         if(get_player().cockTotal() == 1)
         {
            outputText("是");
         }
         else
         {
            outputText("都是");
         }
         outputText("远比她更清楚情况，当你弯下腰，剥去她身上每一寸本来就少得可怜的衣服时。当你打量她时，");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的一根[cocks]停留在她身上，而它");
         }
         else
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "停留在她身上，而它");
         }
         if(get_player().cocks[0].cockLength < 20)
         {
            outputText("几乎和她的整个躯干一样长");
         }
         else
         {
            outputText("比她还大");
         }
         outputText("给了你一个邪恶的主意。[pg]");
         outputText("你双腿大张地坐在地上，握住这个小地精婊子，让她相对娇小的缝隙抵在你" + get_player().cockDescript(_loc1_) + "的顶端。她终于从昏迷中清醒过来，脸上闪过极度纠结的神情，对肉棒和精液的渴望与她的求生本能展开了激烈的交锋。就在即将落败之际，当她感觉到你" + get_player().cockDescript(_loc1_) + "的" + get_player().cockHead(_loc1_) + "开始撑开她的" + get_monster().vaginaDescript() + "时，求生本能突然重振旗鼓，击退了她的欲望。她拼尽全力抵抗，但在你这样的钳制下，她只能胡乱挣扎，用脚蹬着你的" + get_player().cockDescript(_loc1_) + "，简直就像在爬树干一样——从她的角度来看，那一定就像树干一样粗壮。[pg]");
         outputText("你们俩都因为各自的剧烈运动而汗流浃背，你慢慢开始意识到，她疯狂的挣扎和她" + get_monster().vaginaDescript() + "的紧致程度结合在一起，将使你无法实现你一直期待的插入。然而，正当你开始考虑在她的喉咙里射精时，一股黑暗的冲动涌上心头，另一个念头闪过你的脑海。[pg]");
         outputText("当地精感觉到你不再把她按在你的" + get_player().cockDescript(_loc1_) + "上时，她稍微放松了一点。当你把她娇小的小穴凑到唇边开始品尝时，她兴奋到了极点。你的舌头在她的" + get_monster().vaginaDescript() + "内外游走，直到你把她隐藏起来的小肉核哄出来。你用嘴唇包裹住它，开始施展你的腐化之力。当你把这个地精荡妇推向高潮，用一种在恶魔行列之外罕见的专业技巧刺激她的阴蒂时，腐化的能量从你的舌头传导到她的阴蒂，深入她的核心。当她尖叫着高潮时，你从她身上移开，欣赏着你恶魔般杰作的外在迹象。以前那个普通大小的爱之按钮已经肿胀了五倍，变成了一个骄傲、充血的阴蒂……而且你放大的不仅仅是这个。[pg]");
         outputText("你重新调整了你的性玩具的位置，让她现在背对着你，再次让你的" + get_player().cockDescript(_loc1_) + "接触她的" + get_monster().vaginaDescript() + "。她再次挣扎，但在高潮之后，她已经没有力气进行像样的抵抗了；现在她正在对抗不可避免的事情，她所有的抵抗只会让你更加兴奋。你开始把她按向你自己。[pg]");
         outputText("[say: 太大了……]她虚弱地说。龟头顶端挤了进去。[pg]");
         outputText("[say: 你会弄死我的……]她哀求道。剩下的龟头也跟着挤了进去。[pg]");
         outputText("[say: 停下……]她乞求着。柱身开始没入其中。[pg]");
         outputText("[say: 不要……]更多的部分进入了她娇小的身体。[pg]");
         outputText("[say: 求求你……]她被彻底填满了。[pg]");
         outputText("[say: 求求你……]甚至超出了极限。[pg]");
         outputText("[say: ……操我。][pg]");
         outputText("你将留在你刚上任的肉便器外面的那部分" + get_player().cockDescript(_loc1_) + "猛地插到底。这足以让这婊子高潮了，而你甚至还没开始发力。你");
         if(get_player().cocks[0].cockLength < 20)
         {
            outputText("能感觉到她腹部巨大的凸起");
         }
         else
         {
            outputText("把她撑得太大了，以至于你从这个角度都能看到凸起");
         }
         outputText("，这让你的欲望更加高涨。你从洞里抽出的肉棒长度甚至超过了这个缺精荡妇的身体，导致她双眼翻白，她的" + get_monster().vaginaDescript() + "紧紧夹住你，再次高潮。每一次你拔出或狠狠捣入都会让她爽到极点，以至于当你们俩都四肢着地，像一对野兽一样交配时，她只能躺在那里，大张着嘴，几乎要口吐白沫");
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
                  outputText("流下股股乳汁，洒在她的脸上");
               }
               else
               {
                  outputText("喷出大量液体涂满她");
               }
            }
         }
         outputText("。她的头发因为");
         if(get_player().biggestLactation() >= 1)
         {
            outputText("乳汁和");
         }
         outputText("你们俩的汗水而黏结在一起，她发出的唯一声音就是每隔几次高潮时偶尔发出的狂喜的咕噜声。[pg]");
         outputText("[say: 好了，婊子。你想要我的孩子？精。来。了！]你大喊道。然而，");
         if(get_player().hasVagina())
         {
            outputText("同时你的" + get_player().vaginaDescript(0) + "");
            if(get_player().vaginas[0].vaginalWetness <= 3)
            {
               outputText("流出淫水");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("泛滥成灾");
            }
            else
            {
               outputText("喷发");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("，而你其余的[cocks]将她浸透时，");
            }
         }
         else if(get_player().cockTotal() > 1)
         {
            outputText("而你其他的" + Appearance.cockNoun(CockTypesEnum.HUMAN));
            if(get_player().cockTotal() > 2)
            {
               outputText("将她浸透时，");
            }
            else
            {
               outputText("将她浸透时，");
            }
         }
         outputText("这婊子太紧了！简直就像个天然的屌环！");
         if(get_player().balls >= 2)
         {
            outputText("你的[balls]正努力着，但，她");
         }
         else
         {
            outputText("她");
         }
         outputText("她痉挛的" + get_monster().vaginaDescript() + "死死夹住了你的" + get_player().cockDescript(_loc1_) + "，让你根本无法释放。[pg]");
         outputText("高潮的瞬间过去了，你却感到欲求不满。这只会让你更加火大，因为你的精液容器连这唯一的职责都没尽到。然而，你并没有气馁。事实上，你加倍了努力。如果这个大屌控荡妇想在自己爽的同时拒绝给你回报，好吧，你只能在下一回合把她操到失去意识了。[pg]");
         outputText("在接下来的几个小时里，你几乎把她那绿色小脑袋里的脑浆都给操出来了，让自己再次濒临高潮。你考虑过这次拔出来，但还是决定不这么做。至少两发的量一次性射进去；这肯定管用，而且这婊子也是自找的。[pg]");
         outputText("[say: 让我们。再。试。一次！]你大喊着，把你们俩拉回坐姿，并让你们的背部都弓了起来。[pg]");
         outputText("你的" + get_player().cockDescript(_loc1_) + "紧紧地贴着她的皮肤，以至于你可以看到精液顺着你的肉棒向上涌出，仅仅第一发就让你的地精玩具膨胀了起来。");
         if(get_player().cockTotal() > 2)
         {
            outputText("你剩下的[cocks]像间歇泉一样喷射到空中，把你们俩都涂满了精液。");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("你剩下的阴茎像间歇泉一样喷射到空中，把你们俩都涂满了精液。");
         }
         outputText("正是那种阻止你第一次射精的紧致感，现在确保了你射入她体内的大量精液在你拔出之前一滴也不会漏出来。幸好你的腐化如此有效，因为她现在看起来已经怀孕得像抱了个沙滩排球一样了。[pg]");
         outputText("最后，你把最后一发精液射进了这个新搞到手的屁股里，把她从你的" + get_player().cockDescript(_loc1_) + "上推开，让她摔在地上。撞击让她体内的精液如洪流般涌出。[pg]");
         outputText("你站起身准备离开，低头看着你刚刚干完的地精荡妇。[pg]");
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
         spriteSelect(SpriteDb.get_s_goblinShaman());
         outputText("你掏出你那坚挺的雄性象征，向你的受害者展示它那");
         if(get_player().cockArea(_loc1_) < 80)
         {
            outputText("近乎");
         }
         outputText("荒谬的尺寸。地精女孩震惊地看着这一幕，眼睛瞪得像餐盘一样大。知道你不管尺寸差异都会尝试，她张开双腿，在地上找了个更舒服的姿势。[pg]");
         outputText("你");
         if(get_player().cor < 50)
         {
            outputText("耸耸肩，心想既然她准备好了，你也不妨试试");
         }
         else
         {
            outputText("咧嘴一笑，很乐意用自己的尺寸把她撑开");
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
         outputText("——你那" + get_player().cockDescript(_loc1_) + "的前端，当你将其擦过她已经湿滑的肉褶时，正兴奋得明显跳动着。她在你身下扭动着，显然很享受你抵住她穴口的感觉。你极其缓慢地开始向前推进，感受着她的身体被撑开，紧紧包裹住你的");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("龟头冠状沟");
         }
         else
         {
            outputText("冠部");
         }
         outputText("，但没过多久，那狭小的通道就再也无法扩张了，你确信如果再强行塞入，一定会弄伤她。[pg]");
         outputText("你对这种挑逗感到不满，于是拔了出来，将它滑到她的躯干上，把她压在你的" + get_player().cockDescript(_loc1_) + "下面，把她的淫液涂满她的脸和身体。她的乳房被压扁了，以至于她那挺立的紫色小乳头勉强从两边露出来。这个小荡妇看起来松了一口气，而且被挑逗得不轻。她舔了舔嘴唇，高兴地说，[say: 谢谢你，亲爱的，我觉得你差点把我撕成两半！别担心，我非常乐意被你的精液浸透，]说着，她用双臂和双腿缠住你");
         if(get_player().hasKnot(0))
         {
            outputText("把脚跟勾在你的肉结后面");
         }
         outputText("。 [pg]");
         outputText("[say: 她很擅长这个，]你暗想，她开始在你身下摩擦，用她的腿带动整个身体在你的肉棒上下活塞运动，她的手臂和双手以惊人的热情抚摸着你。这种感觉非常强烈——这些地精知道如何取悦一个");
         if(get_player().get_gender() == 3)
         {
            outputText("扶他");
         }
         else
         {
            outputText("男人");
         }
         outputText("，这是肯定的！你兴奋得开始滴水，一滴调皮的液体浸湿了地精的脸。当她眨眼把它弄掉时，她的笑容更灿烂了。一道温暖湿润的痕迹顺着你的龟头舔上来，地精贪婪地开始吞咽你的先列腺液，甚至从你的尿道里舔舐。你的[hips]抽搐着，当她紧紧抱住你的阴茎时，把她从地上抬了起来。[pg]");
         outputText("你从没想过这样的行为会如此令人愉悦，但这实在是太棒了。你失去了控制，把一股滚烫的精液射在地精的脸上。她语无伦次，试图擦去眼睛里的精液，这时你的下一股精液正中她的额头，让这个活泼的女人失去了平衡。她失去了对你痉挛的" + get_player().cockDescript(_loc1_) + "的抓握，重重地摔在地上。你后退一步，随着高潮的结束，肉棒在空中摇晃，");
         if(get_player().cumQ() < 75)
         {
            outputText("用强效的精液又溅了她几次。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("给她涂上了一层厚厚的精液。");
         }
         else
         {
            outputText("把她浸透，让她躺在一滩厚厚的精液里。");
         }
         outputText("这个绿色的荡妇似乎处理得很好，甚至在自慰时把你的精液舀起来揉进她的小穴里。她看着你穿好衣服，舔了舔嘴唇，涂满精液的脸上挂着性感的微笑，[say: 你的味道和我预想的一样好，种马！也许下次把那个坏家伙缩小点，再来找我好好玩玩，好吗？希望到那时，我塞进小穴里的这些精液能让我有个大肚子给你摸！][pg]");
         outputText("你摇了摇头，离开了，这次经历让你感到有些疲惫，但也有些释然。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function laySomeDriderEggsInGobboTwat() : void
      {
         clearOutput();
         get_images().showImage("goblin-win-drider-egged");
         outputText("这个可怜的绿皮小生物试图从你身边爬走时那可怜的挣扎，让你能相当清楚地看到她流着淫水的阴户。虽然你感觉到自己");
         if(get_player().hasCock())
         {
            outputText("变硬了");
         }
         else if(get_player().hasVagina())
         {
            outputText("湿润了");
         }
         else
         {
            outputText("抽搐了");
         }
         outputText("一点，但你还是忍不住注意到了你蜘蛛下半身越来越重的重量。再次低头看着地精，你决定也许你们都能得到一些……<i>类似于</i>你们想要的东西。");
         outputText("[pg]你迅速脱下衣服，爬向那个抽泣的荡妇，弯腰把她拉起来，并让她转过身来面对你。你用一只手臂穿过她的腋下，用空出的手戳了戳她柔软的肚子，询问她孩子的情况。");
         if(get_player().get_femininity() > 50)
         {
            outputText("[pg][say: 什-什么？你——我没有孩子，你这个蠢货！这就是你觉得好玩的事吗，混蛋？落井下石？！]");
         }
         else
         {
            outputText("[pg][say: 什-什么？你- 我什么都没有，你这个愚蠢的混蛋！这就是你所谓的乐趣吗，蠢货？落井下石？！]");
         }
         outputText("她用脚踢打着，但毫无力气，随着眼角开始泛起泪花，她撅起的嘴也越发明显了。");
         outputText("[pg][say: 放开我，放开我！] 她扭动着身体，你把另一只手滑到她腋下，帮着制服她。你把她举得离你更远些，同时开始把你的蜘蛛腹部卷到身下。你已经能看到你的产卵管从甲壳里探出头来，随着你的心跳抽动着，绿色的润滑液滴得你下盘到处都是。");
         outputText("[pg]你的地精玩物安静了下来，盯着你众多腿之间那根越来越粗的肉棒。");
         outputText("[pg][say: 什么？那是什么？那是干什么用的？] 她紧张的语气丝毫掩饰不住顺着大腿流下的兴趣。你把她拉近，让她悬在你的产卵管上方，亲吻她的额头，向她保证会给她所有她梦寐以求的孩子。她矛盾的笑容和沉重的喘息让你的心跳加快了一点，当你把这根滑溜溜的肉棒刺入这个紫发女人的身体时，任何回答都被打断了。");
         outputText("[pg]当你像对待一个活生生的性玩具一样上下抽插她，尽可能多地把你自己塞进她体内时，她嘴里漏出了压抑的喘息和闷哼。你这个地精婊子的脸上泛起了一层深深的红晕；她的一只手扭捏着拉扯着自己的乳头，同时咬着嘴唇，而她空闲的手则兴奋地按摩着你每次抽插时顶起的凸起。你的甲壳上沾满了她的体液和你蜘蛛卵润滑液缓慢渗出的混合物，变得滑溜溜的。");
         outputText("[pg]你终于插到底了，把这个绿色的精液套管一直插到底，你感觉到你的粗壮擦过了她的子宫颈。你把手从她腋下抽出来，重新放在她的肩膀上，把她按在原地，准备迎接即将到来的事情。当第一波润滑液强行进入她体内时，她的肚子微微凸起，她幸福地喘息着，双手抚摸着她的“孕肚”。当你感觉到你的下半身收紧并颤抖，当第一批卵中的第一个强行顺着你的产卵管向上移动时，你自己的笑容也变得更灿烂了。");
         outputText("[pg]你感觉到它缓慢地向上进入地精体内，你的产卵管在它周围扩张，直到它停在她子宫口前。她从肚子上抬起头，睁大眼睛盯着你，只看了一秒钟，一阵强烈的痉挛就迫使卵穿过了她紧闭的子宫颈。这个迷你的婊子抽搐着，翻着白眼，舌头耷拉着，高潮迭起，一股股淫液喷洒在你的甲壳上。");
         if(get_player().hasCock())
         {
            outputText("你自己的高潮也同样强烈，[eachCock]有力地喷洒在你的躯干上");
            if(get_player().hasVagina())
            {
               outputText("和你的");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你的");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]与她同步收紧，你大量的体液浸透了你的蜘蛛半身。");
         }
         outputText("[pg]然后下一个卵滚上前来，接着是下一个，再下一个……");
         outputText("[pg]你把她按在你的身上，一边把她填满，一次一颗，每一颗球体都让被撑开的肚子更胀大一点，直到她被填得满满的，你甚至能透过她紧绷的肚皮摸到你的卵。地精几乎失去了意识，毫无知觉地发出咕噜声，瞬间怀孕的快感麻痹了她的大脑。你伴随着一声响亮湿润的“噗”声把她拔了出来，她抽搐的小穴里流出了一股源源不断的清澈体液，以及一串粘稠的绿色卵液。");
         outputText("[pg]把她放在阴凉处躺下，你穿上衣服，很高兴摆脱了额外的重量，准备继续你的冒险。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function goblinShamanRapeIntro() : void
      {
         var mode1:Number;
         var _g1:GoblinShamanScene;
         var mode:Number;
         var _g:GoblinShamanScene;
         spriteSelect(SpriteDb.get_s_goblinShaman());
         clearOutput();
         outputText("萨满扑倒在地，乳房重重地砸在地上。她抬起头看着你，抽泣着。");
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]<b>你还不够饥渴，无法强暴她。</b>");
         }
         addButtonDisabled(0,"肉棒操","这个场景需要你有一根尺寸合适的肉棒。","肉棒操");
         addButtonDisabled(1,"肉棒太大","这个场景需要你有一根过大的肉棒。","肉棒太大");
         addButtonDisabled(2,"堕落肉棒","这个场景需要你有一根过大的肉棒和较高的腐化。","堕落大肉棒");
         addButtonDisabled(3,"肉棒插屁股","这个场景需要你有一根肉棒和高腐化。","肉棒插屁股");
         addButtonDisabled(4,"颠簸操","这个场景需要你有一根尺寸合适的肉棒。","颠簸操");
         addButtonDisabled(5,"喂奶","这个场景需要你有足够的乳汁。","喂奶");
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
               addButton(4,"颠簸操",gobboGetsRapedMaleFits);
               if(get_goreEnabled())
               {
                  addButton(10,"子宫操",get_game().goblinScene.gobboWombFuck).hint("切开地精的子宫，狠狠地捣弄一番。");
               }
            }
            if(get_player().cockThatFits(get_monster().analCapacity()) >= 0 && (get_player().isCorruptEnough(70) || get_player().hasPerk(PerkLib.Sadist)))
            {
               addButton(3,"肉棒插屁股",gobboButtSecks);
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
               addButton(9,"骑脸撒尿",get_game().goblinScene.facefuckPiss).hint("骑在地精脸上。并且释放自己");
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
      
      public function goblinShamanEncounter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_goblinShaman());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2118) == 0)
         {
            outputText("当你散步时，一只地精从附近的灌木丛中跳了出来！与你迄今为止看到的大多数地精不同，这只地精穿着缠腰布，戴着一条似乎是用鲨鱼牙齿制成的项链。她挥舞着一根木制法杖。她显然是个萨满！");
            outputText("[pg][say:我要施法让你屈服，]她说道。");
         }
         else
         {
            outputText("当你走着的时候，一个熟悉的神秘地精映入眼帘。你又遇到了那个地精萨满！你准备好你的[weapon]准备战斗！");
            outputText("[pg][say:我要施法让你屈服，]她说道。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2118,FlagDict_Impl_.arrayReadInt(_loc1_,2118) + 1);
         unlockCodexEntry(2040);
         startCombat(new GoblinShaman());
      }
      
      public function goblinShamanBeatYaUp() : void
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
            outputText("你倒下了，被彻底击败了。为了确保你更容易对付，胜利的萨满漫步走来，她的左手闪烁着粉红色的催情火焰。她暴露了你的下体，并将粉红色的火焰直接扔进了你的腹股沟！你无法反击。[pg]");
         }
         if(get_player().hasCockThatFits(get_monster().vaginalCapacity()) && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            _loc1_ = get_player().cockThatFits(get_monster().vaginalCapacity());
            if(_loc1_ < 0)
            {
               _loc1_ = get_player().smallestCockIndex();
            }
            outputText("你太兴奋了，太饥渴了。任何关于羞耻的念头都被立刻抛弃和遗忘，在吞噬一切的欲望浪潮中被冲刷殆尽，你的手指滑到[oneCock]周围，开始把玩这根肿胀的工具。你立刻因为这种难以置信的、压抑已久的渴望而挺起腰，几乎当场就要射出来。你抬起头，恳求地迎上那个绿皮肤女人的目光。");
            outputText("[pg]地精萨满冷漠地看了一会儿，但随着你渴望的加剧，她的态度软化了，而你的肉棒却变硬了。[saystart]哦，我想我会后悔的，但是");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个东西");
            }
            else
            {
               outputText("那些东西");
            }
            outputText("看起来非常美味。你不介意我稍微品尝一下你的种子吧？[sayend] 这位红发美人跪在你旁边，让她纤细娇小的手指在[oneCock]下方跳舞，引得你发出一声淫靡的呻吟，她大声地自言自语，[saystart]我没听到你说不，" + get_player().mf("种马","性感宝贝") + "。很好……我只取一点点精液……就射几股。像你这样");
            if(get_player().get_tallness() >= 60)
            {
               outputText("巨大的，");
            }
            outputText("" + get_player().mf("强壮的年轻小伙子","性感的肉便器") + "肯定有足够的精液来支付[his]擅闯的代价吧？[sayend]");
            outputText("那些令人愉悦的、跳舞般的手指一路向下，在你的");
            if(get_player().balls > 0)
            {
               outputText("[sack]上轻轻抚摸了一下，然后消失了。");
            }
            else if(get_player().hasVagina())
            {
               outputText("[vagina]上，指尖只在你湿润的阴阜上留下了最轻微的触感。");
            }
            else
            {
               outputText("会阴上，指尖只在你敏感的皮肤上留下了最轻微的触感。");
            }
            outputText("[pg]她解释道，[say: 在你给我答案之前，我不会帮你的。对自己诚实点——你根本不在乎其他女孩。你来这里只是为了操一个地精萨满。我说的对吗？]");
            outputText("[pg]你试图回答“不”，但声音却渐渐弱了下去，变成了一声微弱的，");
            if(get_player().get_femininity() < 40)
            {
               outputText("几乎像");
            }
            outputText("女孩般的呻吟。在[eachCock]中跳动的渴望正在告诉你——不，是要求你——按照她说的做，操她。像发情的野兽一样，你呻吟着。你看着这位矮小但丰满的侵略者那双水汪汪的蓝色大眼睛，做出了一个完全被你疼痛的、药物驱动的欲望所合理化的决定。你仍然像着了魔一样抽插着你的肉棒，呜咽着，[say: 是的……我……我是来和你做爱的。]");
            outputText("[pg]翠绿色的皮肤在你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("上方抚摸了片刻，但在你从中获得任何满足感之前就消失了。[say: 抱歉，太慢了，]这个娇小的施法者戏弄道，片刻之后，她又向你的下体施放了一个唤情法术。[EachCock]勃起，立刻喷出一股白色的先列腺液，无法抵抗这扰乱你心智的强大法术，它是如此完美地为你量身定制，将你的激情点燃到失去理智的地步。你没有注意到用过的皮搋子被移除了，但你绝对注意到了那个轻盈的绿皮肤女人试探性抚摸的回归。她低语道，[say: 现在告诉我其他女孩怎么不重要了。这一切都只是为了让你得到一些绿色的爱而耍的把戏，不是吗？]");
            outputText("[pg]你的回应既迅速又热情。你准确地告诉了她想听的话，甚至更多，当萨满灵活的手指挠着你那胀满的操逼工具每一寸坚硬跳动的部位时，你喘息着、呻吟着。当你结束时，它又喷出了一股浓稠洁白的先列腺液，简直和真精液没什么两样，你乞求道，[say: 是的，我来这里是为了你美味多汁的小穴。求你了，操我的鸡巴。我太需要了！我什么都愿意做！]");
            outputText("[pg][say: 噢，你已经为我喷水了。我只希望剩下的足够支付你的罚款。如果不够，我总是可以施放更多这种唤情法术，]这个翠绿色的荡妇沉思着。她跨过你，她那摇晃的、圆润的屁股在你上方悬停了片刻，然后她把遮阴布扔到一边，把她那散发着麝香、湿漉漉的穴口直接压在你的鼻子和嘴唇上。当地精将她肿胀的阴阜在你身上摩擦时，雌性的淫液顺着你的脸颊流下，她芬芳的小穴让你被忽视的肉棒");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("因渴望而发狂。谢天谢地，当你屈服于她肿胀的阴阜并舔了一下时，一双柔软、布满皱纹的脚包裹住了你的" + get_player().cockDescript(_loc1_) + "，引出了一股浓稠的先列腺液。");
            outputText("[pg]脚趾将你的先列腺液涂抹在你的" + get_player().cockHead(_loc1_) + "周围，然后温暖的脚底沿着你" + Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸长的肉棒向下滑动，将你的" + get_player().cockDescript(_loc1_) + "浸泡在地精汗水和你个人体液的混合物中。你愉悦地呻吟着，你狂喜的声音被遮住你嘴巴的肿胀湿润的阴唇所掩盖，你的肉棒顺从地在她脚上喷出无助的白色痕迹。你嘴唇的每一次摩擦都会得到地精小脚趾抚摸的奖励。每一次舔舐都会让那双挤压着、涂满精液的脚上下滑动。每一次吸吮她的阴蒂都会让她加快速度。在这样的鼓励下，你无法阻止自己侍奉地精那糖浆般的穴口，像奴隶在光荣神明的祭坛前一样崇拜她的女性特征。");
            outputText("[pg]这个矮小丰满的女人移动双腿，将你的肉棒放在她的左脚上，而她的整个右脚则压在你的" + get_player().cockDescript(_loc1_) + "下方，从顶端的马眼挤出一股浓稠的精液。她的脚底在你的肉棒上上下摩擦，将一团又一团的精液挤到地精的脚趾上。过了一会儿，她换了换腿，让她那只已经湿透的脚来完成剩下的挤压工作。你快乐地喷射着，扭动着，像个筛子一样滴着精液，但还没有达到真正的释放。地精没有这样的问题，她在你身上大声地高潮了好几次。每一次喷出的淫液都比上一次更多地浸湿了你的脸，当她完事时，你的[hair]已经黏糊糊的，半埋在地精情欲的水坑里。你离高潮那么近了。非常近。就差一点点……再来几下。");
            outputText("[pg][saystart]");
            if(get_silly())
            {
               outputText("停在那儿，犯罪的人渣。");
            }
            else
            {
               outputText("慢着。");
            }
            outputText("[sayend] 翡翠萨满回头看了你一眼，催促道：[saystart]来吧。填满我。把你积攒的精液都释放出来");
            if(get_player().balls > 0)
            {
               outputText("在你的蛋蛋里");
            }
            else
            {
               outputText("在你的体内");
            }
            outputText("。付清你的“罚款”，我或许会放你走。[sayend]");
            if(get_player().balls > 0)
            {
               outputText("一只手鼓励地捏了捏你的[sack]");
            }
            else
            {
               outputText("几只手鼓励地捏了捏你的[butt]");
            }
            outputText("随着地精伴随着一声黏糊糊的吧唧声将自己完全插到底。你高潮了，在她的体内猛烈地射精。你的背部弓起，身体紧绷，一波又一波的精液喷洒在地精渴望受孕的子宫里。她的小穴似乎把它们都喝了下去，吸收精液的速度和你射出的速度一样快。");
            if(get_player().cumQ() >= 750)
            {
               outputText("即使是她近乎超自然的生育能力也跟不上你惊人的生殖力，很快地精的肚子上就鼓起了一个小包。");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("当你结束时，它已经膨胀成一个圆润的孕肚。");
               }
            }
            outputText("你所有的激情都在这辉煌的高潮中消耗殆尽，让你感觉自己像一个空虚、废弃的躯壳。");
            outputText("[pg]地精站起身来，下体滴落着你白色的黏液，她对你眨了眨眼，消失在拐角处，留下你独自沉睡。");
         }
         else if(get_player().biggestCockArea() > get_monster().vaginalCapacity() && get_player().hasCock() && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            _loc1_ = get_player().biggestCockIndex();
            outputText("你急忙撕开你的[armor]，不顾一切地想把[eachCock]从地狱般的束缚中释放出来。你太兴奋了，太饥渴了。任何关于矜持的念头都被立刻抛弃和遗忘，在吞噬一切的欲望浪潮中被冲刷殆尽，你的手指滑向[oneCock]并开始玩弄这根肿胀的工具。你立刻因为这种难以置信的、压抑已久的渴望而挺动起来，几乎当场就要射精。你抬起头，恳求地看着那个绿皮肤女人的眼睛。");
            outputText("[pg]萨满叹了口气，嘟囔着：[say: 又是一个长着树干一样粗的鸡巴的家伙。] 她不情愿地解开带子，挺拔的深绿色乳头从束缚中挣脱出来，骄傲地挺立在胸前。[say: 做地精的缺点，] 这位运动型的绿皮肤美女解释道，[say: 就是遇到这样的鸡巴……这样一根起伏、跳动的肉柱……我就是忍不住想试一试。] 现在，你的俘虏者赤身裸体地漫步走来，宽大的臀部随着每一步左右摇摆。[say: 作为一个尺寸控是很痛苦的，] 她带着苦笑说完。");
            outputText("[pg]你带着困惑的冷漠看着她的长篇大论，除了这个娇小的荡妇想要骑上你的肉棒的渴望之外，你几乎什么也没听懂。你的手在你的" + get_player().cockDescript(_loc1_) + "上跳动的静脉上游走，你的身体继续处于自动驾驶状态，当这位翡翠美女爬到你身上时，你为她快速而用力地自慰。当她跨坐在你身上时，她多汁的裂口在你的尿道口上展开，她的双腿淫秽地向两侧张开。她命令道：[say: 把手拿开，伙计。你输给了一个地精，这意味着你要当爸爸了，不管你愿不愿意。]");
            outputText("[pg]肿胀的翡翠色肉帘用充满弹性的地精小穴包裹住你的肉棒，并拂开了你狂热抽动的手指。你的俘虏者发出一声淫荡的呻吟，开始在你巨大的肉柱上摩擦，将深色的生殖器在你巨大的肉棒上前后拖拽。一颗挺拔坚硬的小阴蒂从地精闪闪发光的小穴褶皱顶部探出，明显地抽动着，展示着极度的享受。在你自身贪得无厌的欲望驱使下，你在她身下移动，试图让你的" + get_player().cockDescript(_loc1_) + "更快地在她的阴道里滑动。");
            if(get_player().biggestCockLength() > get_player().get_tallness() / 2)
            {
               outputText("你那长得令人难以置信的肉棒挡住了你视线，让你看不到那个性感的妖精，你根本没看到那一下打击。");
            }
            outputText("一记毫不温柔的巴掌拍在了你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText("肉棒");
            }
            outputText("上，地精咕哝着，[say: 别乱动！]");
            outputText("[pg]你犹豫地服从了，被突如其来的疼痛吓了一跳，不敢再冒险乱动。你只能等待这个矮小丰满的女人玩够了，决定放你走。");
            outputText("[pg][say: 哦，你终于明白了？对我来说，你只是牲畜——只是一个让我玩弄的精液喷嘴，直到我厌倦了你，把你关进围栏里。也许如果你的精液足够浓稠，我会把你带回去，和我们其他的动物拴在一起。当然，如果我那样做，你就必须榨出足够的精液，让几十个主母怀孕，]这个翠绿色的荡妇在她的灵活小穴在你的肉棒上发出淫荡的吧唧声之间说道。不……如果她把你带回去，你就永远无法完成你来这里的目的了！她拖着自己向前，直到她");
            if(get_player().biggestCockLength() < get_player().get_tallness() / 2)
            {
               outputText("坐在你的脸上，你那" + get_player().cockHead(_loc1_) + "的男性象征顶着她流着口水的嘴唇。");
            }
            else
            {
               outputText("坐在你“上方”的地上，你的" + get_player().cockHead(_loc1_) + "一直向上伸去，刺穿了她湿润的肉匣，至少从你的感觉来看是这样的。");
            }
            outputText("[pg]她柔软的双脚从两侧夹住你的肉棒，展现出你意想不到的灵活性。柔软的脚底在你的肉棒上滑动、爱抚。她的脚趾卷曲起来，抚摸着你尿道隆起处敏感的两侧。甚至她脚后跟坚硬的突起也托住了你" + get_player().cockDescript(_loc1_) + "的底部，用她的脚为你手淫。");
            outputText("[pg]在大量淫液的润滑下，萨满的双脚轻而易举地将你推向了高潮的边缘。她每一次柔软、细腻的踩踏都让你离高潮越来越近，很快你就在她被汗水和淫液润滑的脚底板下颤抖起来。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("多亏了你惊人的男子气概，你向她那饥渴的小穴中喷射出大团大团的先列腺液，但这仅仅是即将到来的高潮的前奏。");
            }
            else if(get_player().cumQ() >= 250)
            {
               outputText("你向她那饥渴的小穴中源源不断地流出先列腺液，但这仅仅是即将到来的高潮的前奏。");
            }
            outputText("[say: 快了。是啊，我是个萨满，但我也很注重保养自己。我把这双小脚保养得很好，以防我需要用它们来对付像你这样的怪物肉棒。]");
            outputText("[pg]你试图发出抗议的咕哝声，但声音却被你的");
            if(get_player().biggestCockLength() >= get_player().get_tallness() / 2)
            {
               outputText("跳动着、坚硬如铁的肉棒");
            }
            else
            {
               outputText("俘虏者柔软的屁股蛋");
            }
            outputText("给闷住了。地精用脚使劲拉扯，她那湿滑、被撑开的小穴勉强吞下了你整个" + get_player().cockHead(_loc1_) + "。你因紧紧箍住你男性象征的钳子般的握力而愉悦地颤抖，当这个绿色的小妖精设法将你再拉进一英寸时，你几乎要被这种感觉爽得爆发了。她颤抖着，双脚突然在你的肉棒上疯狂地摩擦。地精柔软的脚底板在你的" + get_player().cockDescript(_loc1_) + "上涂抹着，像一个沉迷于快感的人一样狂野不羁，当她高潮时，汁液从她的缝隙中喷涌而出。这种猛烈的触碰对你紧绷的肉棒来说太刺激了，伴随着一阵紧致、火热的收缩，你感觉到你即将释放。你的肉棒根部出现了一个巨大的凸起，伴随着体内爆发出的温暖快感。它从你的根部一直传到顶端，然后伴随着撑开小穴的喷射消失在地精体内。她大声呻吟着，显然很享受被精液填满的感觉，当你的肉棒完成最后的抽插时，你们俩一起叹了口气");
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
               outputText("浓稠的精液");
            }
            else if(get_player().cumQ() <= 1750)
            {
               outputText("黏糊糊的精液波浪");
            }
            else
            {
               outputText("精液河流");
            }
            outputText("进地精的小穴里。");
            if(get_player().cumQ() >= 2500)
            {
               outputText("在你大量的灌溉下，她的肚子圆滚滚的。");
            }
            outputText("[pg]这个绿皮女孩在从你身上解脱出来之前，深情地捏了捏你的" + get_player().cockDescript(_loc1_) + "。你瘫倒在地，仍然感觉有些兴奋，于是又开始自慰。地精笑着说，[say: 再来几次这样的表现，我可能就不得不把你留下来了。]你一直玩弄自己直到睡着，即使在梦里，你也能感觉到那丝滑的小穴再次套在你的肉棒上。");
         }
         else
         {
            outputText("被你自己的需求所打败，你的手指飞快地伸向你的[armor]，迅速地解开它，急于将你那酸痛、娇嫩的小穴暴露在地精的眼前。萨满用一种不以为然、困惑的表情看着你，尽管她仍然站在原地，当你在欲望中沦陷时，她的目光紧紧地锁定着你。知道有观众在看，你扭曲着身体，向这个娇小的绿皮展示你的[chest]和[vagina]。闪闪发光的湿气在你暴露的阴唇上形成，诱惑着你将手指滑入它们湿滑的温暖中。就好像你能抗拒似的。");
            outputText("[pg]你开始自慰，狂暴而毫不掩饰地蹂躏着自己的身体，完全忘记了是谁让你变成这样的。用探索的手指分开你湿滑的血肉，你迷失在每一次抚摸你的蜜壶时神经中爆发出的令人愉悦的温暖中。同时，你空闲的手指");
            if(get_player().hasFuckableNipples())
            {
               outputText("在你的[nipple]里进进出出，像真正的肉棒一样用力地自慰。");
            }
            else
            {
               outputText("挤压着紧绷的乳头，不假思索地扭动和拉扯着它。");
            }
            outputText("你的自慰幻想被手腕上突如其来的撞击打断了。");
            outputText("[pg]你困惑地看着，只能眼睁睁地看着地精跨过你，骑在你俯卧的身体上，轻松地打掉你每一次试图抚摸自己的尝试。她小心翼翼地挪开她的毛皮缠腰布，露出她的小穴。她熟练地用一条窄窄的皮带把你的双手绑在一起。你没有反抗，以为这个变态的绿皮婊子正计划着某种变态的性游戏，好让你们俩都爽上天。她低头坏笑着说，[say: 我觉得操你这种不值钱的烂货没什么意义，但你把我弄发情了，所以以莉希丝那滴着奶水的奶子发誓，你要让我爽。]");
            outputText("[pg]还没等你嘟囔着抗议，地精就转过身，一屁股坐在你的脸上，用她湿润的裂口堵住了你的嘴。麝香般的雌性淫液滑过你的脸颊，流到你的后颈，滴在地上。地精发出一声轻柔、享受的呻吟，微微摇晃着臀部，将她阴蒂的凸起拖过你微张的嘴唇。她根本不顾及你的需求！你试图抗议，但换来的只是满嘴的黏液，尽管那味道浓烈又让人兴奋。当你试图把手指抽回你那渴望的阴道时，绑着你双手的毛皮缠腰布绷紧了，但在你受制于人的姿势下，你无法鼓起力量去制服这个娇小、霸道的骚货。");
            outputText("[pg][say: 哦，你也想高潮？那你最好舔快点，荡妇。在我爽之前，你什么也得不到，]这个骑脸的逼的主人嘲讽道。为了说服她照顾你，你闭上嘴，藏起舌头，用你唯一还能控制的东西来讨价还价。");
            outputText("[pg]一记恼怒的耳光带着刺痛的力量抽在你的[chest]的[skin]上。剧痛让你被阴道蒙蔽的视线中冒出金星，但你坚持住了，只发出一声微弱的不适的闷哼。地精叹了口气，摆弄着她的弹药带。你看不见她在做什么，但你知道她没安好心！你的手臂传来一阵短暂的刺痛，紧接着是一阵狂喜、燃烧的快感。你的[vagina]分泌出汁液，你无法控制地呻吟起来。欲望在你的血管中跳动。渴望攀升到了新的高度。你无法抗拒这个……再也不能了。你张大嘴巴开始舔舐，用舌头攻击那片茂盛的绿色小穴，只要能让她高潮，给你带来你渴望的解脱，做什么都行。");
            outputText("[pg]你的另一只手臂传来一阵短暂的疼痛，紧接着是一阵眩晕。随之而来的是，你的性唤起似乎翻了一倍，攀升得如此之高，以至于你之前的性需求水平相比之下显得微不足道。你的[hips]不由自主地从地上抬起，每一丝气流拂过你肿胀的阴阜带来的电流般的触感，都美妙得让人无法抗拒。地精显然很享受你的努力，评论道，[say: 哦天哪，你在操空气吗？你真的是靠感受微风吹过你赤裸、暴露的小穴来获得快感的吗？而且你下面湿透了！亲爱的，我他妈是个地精，但你现在让我自愧不如。]");
            outputText("[pg]你吸吮着她的阴蒂让她闭嘴，同时在地上滑动你的[butt]。每一次挺动，每一次移动，以及每一次对着你幻影情人的无意义的起伏，似乎都比上一次更加狂热和绝望。你身下的泥土已经变成了芬芳、浓稠的泥浆。你的屁股被泥浆染成了棕色，当你拖着屁股穿过泥坑时发出的湿润的吧唧声，只会进一步唤起你和你的俘虏。她呻吟着，[say: 还想要更多吗？嗯……我觉得你现在这样是没法高潮的。]");
            outputText("[pg]你对着地精那绿色、漏水的小穴喘着粗气，除了在她的嘴唇上哼哼，用舌头在她的阴蒂上画圈之外，你什么也做不了。你太兴奋了，感觉自己能感觉到高潮，潜伏在一座你无法攀登的山丘上。你绝望、淫秽的动作给你带来了快感，但这还不够，即使有大量该死的地精药物涌入你的系统。");
            outputText("[pg]你那娇嫩、肿胀的乳头上的一阵刺痛是你唯一的警告，随后又一波麻醉催情剂袭击了你的系统。你的肌肉锁紧了，你的小穴似乎活了过来，简直像喷泉一样喷出雌性黏液。你身下的水坑已经没过了你的肩膀，但你太沉迷于性幻想和脸上的美味小穴，根本不在乎。地精粗壮、圆润的大腿挤压着你的头，她开始喘息，[say: 操，是的，舔那里，你这个饥渴的荡妇，舔我的产道，你这个微不足道的舔阴荡妇。我应该把你带进我们的城市。我相信我们可以把你关在隔间里，也许除了你的嘴，把其他一切都锁在墙后，让你不停地舔几十个怀孕的绿色小穴，直到你只能靠黏糊糊的甜美女孩精液生存。]");
            outputText("[pg]你翻着白眼，虽然除了曲线优美的绿色臀部之外，你也没什么可看的，你的舌头完全疯了，在滴入你张开的、呻吟的嘴里的黏液帘幕中来回抽打。地精在你身上摩擦，大声呻吟着，她达到了自己的顶峰，几乎不在乎你的快感。值得庆幸的是，随着最近一次注射，你的[vagina]变得如此敏感，以至于每一丝拂过你红色、肿胀的褶皱的空气都感觉像是一条单独的舌头。你扭动着，完全、不可抗拒的需求控制着你腰部以下的身体。突然充满你嘴里的女人精液的洪流让你吃了一惊，然后你也高潮了，你的[vagina]仅仅因为微弱的气流就达到了高潮。");
            outputText("[pg]你在混合汁液的水坑中昏了过去，几乎没有注意到地精的离开。");
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function goblinCondomed(param1:Number = 0) : void
      {
         spriteSelect(SpriteDb.get_s_goblinShaman());
         var _loc2_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         clearOutput();
         get_images().showImage("goblin-win-male-goblincondomed");
         outputText("被打败后，地精女孩双膝一软，向后倒去，仰面躺着，翠绿色的脚踝悬在头顶。[say: 使用我吧，]她乞求道，[say: 羞辱我，贬低我，践踏我！不管你做什么，只要填满我就行！]当你脱下[armor]时，她解开缠腰布，尽可能地张开双腿，这个放荡的女孩向你展示着她流着淫水的阴户，肿胀的绿色阴唇上已经滴落着焦急的汗水和渴望的爱液。她在泥土中扭动着，双手抓住丰满的臀部，满怀希望地将屁股撅向空中。你几乎能感觉到这个小荡妇渴望精液的小穴散发出的热量，发情期让她的眼神变得呆滞而迷离。站在她上方，很明显她现在唯一意识到的只有她双腿间跳动的阴户和你正在勃起的阴茎。[pg]");
         outputText("她不耐烦地伸出双腿，用脚趾勾住你的下半身，试图把你拉近，同时仍然保持她那饥渴的小穴可以触及。她橄榄色的双脚紧紧夹住你的肉体，脚底结实有力，在你的[skinfurscales]上摩擦，沿着你的[hips]外侧上下滑动。地精的脚跟在你的大腿上拖拽，双脚在你的" + get_player().cockDescript(_loc2_) + "两侧并拢，她那翡翠般肌肤的脚掌压在");
         if(get_player().balls > 0)
         {
            outputText("你那跳动的囊袋上");
         }
         else
         {
            outputText("你肉棒的根部");
         }
         outputText("而她的脚趾像粗壮的手指一样卷曲着包住你的阴茎。起初，这名青柠色肌肤的女孩只是缓慢地抚摸着你，随后加快了节奏，交替使用脚背和小腿之间丝滑肌肤的柔软拥抱，利用脚踝的紧致感将你的肉棒按摩至完全勃起。在她的双脚间颤抖着，几滴先列腺液开始从你的顶端渗出，近乎透明的液滴顺着你的龟头滚落。地精用她的大脚趾虔诚地收集起这些温暖的液体，让它们在每个脚趾间欢快地流淌，然后用有力的抚摸将它们重新涂抹在你的肉棒上，像涂抹精油一样将这些无籽的淫液揉进你的肉体，她的双脚在你的体液滋润下闪烁着如海绿色绿柱石般的光泽。[pg]");
         outputText("此时，一滩因过度刺激而溢出的淫液已经在这个淫荡的女孩身下汇聚成湖。她淫荡地呻吟着，手指仍然深深地抠进她的臀瓣，你意识到这个地精仅仅是给你做足交就已经高潮了。她如此渴望你的肉棒，简直到了可悲的地步，一个邪恶的念头在你的脑海中闪过。你抓住她沾满先列腺液的湿滑双脚，手指沿着她被淫液软化的肌肤滑动，挠痒并揉搓着她的脚底，直到女孩在狂喜中尖叫起来，紧闭双眼，她那气喘吁吁的欲望已经让她无法再将双手从自己的小穴上移开。伴随着一股溢出的温暖淫液，她将右手的指头抠进她那翠绿的裂隙中，左手则以越来越大的圆圈快速揉搓着她那翡翠般的阴蒂，震动让她那在森林泥地上蹭出的泥泞中的屁股也跟着晃动起来。趁她分心的时候，");
         if(param1 == 0)
         {
            outputText("你运转起你的吐丝器，这个精巧的器官编织出一个细长、由细密蛛丝网构成的护套，你小心翼翼地在柔韧避孕套的惰性层之间留下了粘性的丝线。将它滑过你的" + get_player().cockDescript(_loc2_) + "，你惊叹于它是如此轻盈！你甚至能感觉到微风穿过这层丝质的覆盖物。");
         }
         else
         {
            get_player().destroyItems(get_useables().CONDOM,1);
            outputText("你撕开包装，将乳胶避孕套滑过你的" + get_player().cockDescript(_loc2_) + "，惊叹于它是如此透明和闪亮。你觉得地精在为时已晚之前是不会注意到它的！");
         }
         outputText("是时候给这个地精她所要求的了，即使那不是她真正想要的。[pg]");
         outputText("你依然抓着她扭动的双脚，弯下腰，尽可能地将她的双腿拉开，肌肉被拉伸得越来越宽，而她的大腿内侧则紧紧对抗着这股拉力。增加的压力加上她自己疯狂的自慰，让女孩迎来了又一次高潮，这一次，她喷涌而出的淫液化作堕落欲望的水晶水柱向上喷射，温暖地拍打在你的腹部。她的双臂垂在身体两侧，手心向上，手指抽搐着，为你那" + get_player().cockDescript(_loc2_) + "扫清了通往她为你精心准备的、颤抖着的绿色小穴的道路。推开她肿胀的阴唇，你发现她湿得一塌糊涂，你几乎是直接滑了进去，当你用坚挺的肉棒填满她时，她那因高潮而紧绷的肌肉不规则地痉挛着。[say: 哦，是的，你终于找到你的肉棒了，]她喘息着，口水在嘴里冒着泡。[say: 像恨我一样狠狠地操我，你这混蛋，]她要求道，你抓住她的脚踝将她向上拉，把她进一步拉到你跳动的肉棒上，随着你挺进的长度，她深绿色的内褶分开，她那滴着淫液的小穴吸吮着你的肉棒。[say: 我不是玻璃娃娃，你这胆小鬼，就他妈的给我插进来！]她尖叫着，手指抓挠着地面，向上挺动着身体，想让你更多地进入她体内。[pg]");
         outputText("这个嘴碎的婊子显然忘记了是谁输了这场战斗，看来你得提醒她一下。你把她的腿当作杠杆，将她在你的肉棒上扭转了180度，让她趴在自己的奶子上，屁股高高撅起，同时你将肉棒剩下的部分狠狠地插进这个橄榄色皮肤的色情狂体内。她闷哼了一声，刚想再说些什么，但你向前一推，把她的脸按进了泥里，让她没能说出口，她的嘴里塞满了被她自己的淫液浸透的泥土，发出一声狂喜的咕噜声。她的双腿挣扎着反抗你的抓握，东拉西扯，她湿滑的双脚几乎要从你手中滑落。你咬紧牙关，开始尽可能用力地操弄她那流着口水的小穴，渴望驯服这个女孩那狂乱的小穴。将她被汗水浸透的大腿猛烈地撞击在你的[hips]上，你的抽插变得近乎野蛮，当你用腹股沟拍打她的小穴时，她的臀部泛起了深深的红晕，那个秘密的避孕套完美地发挥了作用，在你的" + get_player().cockDescript(_loc2_) + "上薄如蝉翼。[pg]");
         outputText("这个翡翠色的女孩在汗水和泥土的覆盖下扭动着翻过身来，当她戳向自己腹部的凸起时，脸上露出了困惑的表情。[say: 什么……感觉不对劲，]她嘟囔着，用双手按压着自己的皮肤。她用一根长长的中指检查自己的小穴，拔出来时却干干净净，没有她期待的象牙色浓精。[say: 搞什么？避孕套？]她尖叫起来。[say: 你这混蛋！]她以越来越疯狂的动作按压着自己的肚子，当那个装满精液的气球完好无损地弹回来时，她惊讶地张大了嘴巴。[say: 为什么它不破？]她质问道。");
         if(param1 == 0)
         {
            outputText("你礼貌地告诉她，蛛丝非常坚韧，而且非常粘。她把手指伸进裂隙，试图把它拉出来，但当她感觉到内壁被粘稠的蛛网拉扯时，她倒吸了一口凉气。尽管她拼尽全力，那个丝质气泡依然停留在你留下的地方，被你那束缚性的蛛网牢牢地粘在原处。你大笑着祝她好运，希望她能把它弄出来，然后你收拾好衣服转身离开。地精女孩体内充满了精液，却无法让任何一滴进入她的子宫，她无助地呻吟着，绝望地用手指抠弄着自己，仿佛她的高潮能把你在她体内留下的宝藏排出来似的。");
         }
         else
         {
            outputText("你礼貌地告诉她，乳胶很结实，能有效避孕。你大笑着祝她好运，希望她能把它弄出来，然后你收拾好衣服转身离开。地精女孩体内充满了精液，却无法让任何一滴进入她的子宫，她无助地呻吟着，绝望地用手指抠弄着自己，仿佛她的高潮能把你在她体内留下的宝藏排出来似的。");
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function gobboGetsRapedMaleFits() : void
      {
         spriteSelect(SpriteDb.get_s_goblinShaman());
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         clearOutput();
         get_images().showImage("goblin-win-male-getridden");
         if(get_player().cockArea(_loc1_) > get_monster().vaginalCapacity() * 0.8)
         {
            outputText("你抱起被打败的地精，打量着她。她可怜巴巴地把双臂交叉在胸前，问道：[say: 现在怎么办？] 当她以为你没注意时，她的眼睛向下瞟去。看到你那" + get_player().cockDescript(_loc1_) + "的尺寸，她的脸上短暂地闪过一丝痛苦的表情。你产生了一个想法，想给她塞入她无法承受的巨大肉棒，于是你把她放低，靠近你的" + get_player().cockDescript(_loc1_) + "。龟头滑入她湿润的褶皱之间，撑开了她，也减轻了你手臂上的一些重量。她微微皱眉，尽可能地把双腿缠在你的[hips]上。[pg]");
            outputText("你开始走动，让你的动作配合重力，让你毫不费力地插入她。当她向下滑动时，那些肿胀湿润的肉壁紧紧地夹住你，");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("痛苦地摩擦着你恶魔般的肉突");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("痛苦地撑开，包裹着你的肉结");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE || get_player().cocks[0].get_cockType().get_Index() > 3)
            {
               outputText("感觉紧紧地包裹着你，有些痛苦");
            }
            outputText("。随着你的每一步，她滑得更深，将她撑到了极限，直到她几乎完全被你刺穿，她抓住你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText(get_player().allBreastsDescript());
            }
            else
            {
               outputText("躯干");
            }
            outputText("来支撑自己。随着这个绿皮女孩的呼吸，一阵稳定的脉动按摩着你。你意识到她身体的很大一部分一定是为了容纳巨大的阴茎而存在的，难怪地精在战斗中如此脆弱！[pg]");
            outputText("她开心地喘着气，舌头从嘴里伸出来，评论道：[say: 好满……] 尽管她还在因为体内的巨物而皱眉，但她开始为你加油：[say: 哦哦，快——啊——点！我想颠起来！][pg]");
            outputText("这就是你需要的全部鼓励，你开始奔跑，感觉她轻盈的身体在你的" + get_player().cockDescript(_loc1_) + "上弹跳，发出一阵阵夹杂着快乐的哀号、呻吟和轻微痛苦的叫声。她的小拳头紧紧地抓着你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("乳房");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("，她紧紧地挂在你身上，用她丰满的乳房挤压和撞击着你。你用力奔跑，感觉她弹跳和扭动，她的小穴和急促的呼吸以前所未有的方式挤压和榨取着你。你确信，如果每次慢跑都能有这种感觉，你的身材一定会很好。[pg]");
            outputText("[say: 哦，操，猛男，让我颠起来！对，就是这样，]她呻吟着，[say: 你要射了吗？我的天啊，求求你射吧，我需要你像这样把我填满！][pg]");
            outputText("即将高潮的熟悉紧绷感在你的腹股沟蔓延，随着你接近释放而越来越紧。你加快了步伐，全力冲刺，让女孩紧紧抱住你时上下颠簸摇晃，完全由你的" + get_player().cockDescript(_loc1_) + "支撑着。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]收紧，释放出高潮的种子。");
            }
            outputText("当你射精引发了这个绿色小肉便器的高潮时，震耳欲聋的嚎叫声充斥着你的耳朵。她的一只手松开，开始抚摸自己的肚子，同时亲吻和舔舐你的肚脐。");
            if(get_player().cumQ() >= 100)
            {
               outputText("你强化的身体轻松地将她填满浓精，让她的肚子微微凸起，你的种子深深埋在她的子宫里，无处可逃，她的小穴被你的" + get_player().cockDescript(_loc1_) + "紧紧堵住。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("这次高潮如此强烈，以至于当你平息下来时，她看起来就像怀了一个健身球那么大的孕肚。你的精液被困在她的体内，无法在她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间找到任何缝隙。");
            }
            else if(get_player().cumQ() >= 250)
            {
               outputText("这次高潮如此强烈，以至于当你平息下来时，她看起来已经大腹便便了。你的精液无法在她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间找到任何缝隙。");
            }
            outputText("[pg]");
            outputText("你喘着粗气停了下来，把被填满的地精从你身上拉下来，放在地上，满意地微笑着，看着你的精液");
            if(get_player().cumQ() >= 250)
            {
               outputText("如河流般倾泻而出");
            }
            else
            {
               outputText("漏出");
            }
            outputText("从她现在大张的阴户里流出。她揉着肚子，给你飞吻，还在努力平复呼吸。你得意地笑了笑，开始穿衣服。穿好后，你开始走开，但她最后一次对你喊道：[say: 嗯嗯，我希望你不介意我再来找你。我需要更多你的精液，这样我才能给你生很多漂亮的小骚货操！][pg]");
            if(get_player().cor > 50)
            {
               outputText("轻笑着");
            }
            else
            {
               outputText("颤抖着");
            }
            outputText("，你心满意足地回到了营地。");
         }
         else
         {
            outputText("你抱起被打败的地精，打量着她。她可怜巴巴地把双臂交叉在胸前，问道：[say: 现在怎么办？] 当她以为你不会注意到时，她的眼睛向下瞟去。你暗自思忖“英雄所见略同”，然后把她放低，靠近你的" + get_player().cockDescript(_loc1_) + "。龟头滑入她湿润而分开的肉褶之间，擦过她的入口，为你分担了她的一些重量。她变成了斗鸡眼，开心地笑着，双腿尽可能地缠绕在你的[hips]上。[pg]");
            outputText("你开始走动，让动作配合重力，让你毫不费力地插入她。当她向下滑动时，那些肿胀湿润的肉壁紧紧地夹住你");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("完美地摩擦着你恶魔般的肉突");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("紧紧地撑开包裹着你的肉结");
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
            outputText("来支撑自己。随着这个绿皮肤女孩的呼吸，一阵稳定的脉动按摩着你，让你意识到她身体的很大一部分一定是为了容纳巨大的阴茎而存在的。[pg]");
            outputText("她开心地喘着气，舌头从嘴里伸出来，为你加油打气：[say: 哦哦，快——啊——点！我想颠起来！][pg]");
            outputText("这就是你所需要的所有鼓励，你开始跑起来，感觉她轻盈的身体在你的" + get_player().cockDescript(_loc1_) + "上弹跳，引出一阵阵快乐的哀号和呻吟。她的小拳头陷入你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("乳房");
            }
            else
            {
               outputText("皮肤");
            }
            outputText("紧紧地挂在你身上，用她丰满的乳房挤压、摩擦着你。你奋力奔跑，感受着她的弹跳和扭动，她的小穴和急促的呼吸开始以前所未有的方式挤压、榨取你。你确信，如果每次慢跑都能有这种感觉，你的身材一定会棒极了。[pg]");
            outputText("[say: 哦，操，种马，让我弹起来！对，就是这样，]她呻吟着，[say: 你要射了吗？我的天，求你射吧，我需要你这样填满我！][pg]");
            outputText("即将高潮的熟悉紧绷感在你的腹股沟蔓延，随着你接近释放而越发紧绷。你加快了步伐，全力冲刺，让女孩紧紧抱住你，完全由你的" + get_player().cockDescript(_loc1_) + "支撑着，随着你的动作弹跳摇晃。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]收紧，释放出高潮的种子。");
            }
            outputText("当你射精引发了这个绿色小肉便器的高潮时，震耳欲聋的嚎叫声充斥着你的耳朵。她的一只手松开，开始抚摸自己的肚子，同时亲吻和舔舐你的肚脐。");
            if(get_player().cumQ() >= 250)
            {
               outputText("你强化的身体轻松地用精液填满了她，让她的肚子微微凸起，精液顺着你的");
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
               outputText("这次高潮如此强烈，以至于当你平息下来时，她看起来已经大腹便便了，你的精液从她的肉壁和你的" + get_player().cockDescript(_loc1_) + "之间能找到的任何缝隙中喷射出来。");
            }
            outputText("[pg]");
            outputText("你喘着粗气停了下来，把被填满的地精从你身上拉下来，放在地上，满意地微笑着，看着你的精液");
            if(get_player().cumQ() >= 250)
            {
               outputText("如河流般倾泻而出");
            }
            else
            {
               outputText("漏出");
            }
            outputText("从她现在大张的阴户中流出。她抚摸着肚子，向你飞吻，仍在努力平复呼吸。你得意地笑了笑，开始重新穿衣。穿好后，你转身离开，但她最后一次向你喊道：[say: 嗯，希望你不介意我再来找你。我需要更多你的精液，这样我才能给你生很多漂亮的小骚货让你操！][pg]");
            if(get_player().cor > 50)
            {
               outputText("轻笑着");
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
         spriteSelect(SpriteDb.get_s_goblinShaman());
         clearOutput();
         if(get_player().isTaur())
         {
            get_images().showImage("goblin-win-female-taur-rapedfem");
            outputText("你抓起地精，用手臂将她紧紧地夹在身侧。你从她那淫荡的衣服上撕下一块柔软的皮革，用来把她的双手绑在背后，以确保她无法反抗。她抬头看着你，眼睛睁得大大的，一想到要任由一个比她大得多的生物摆布，她就感到害怕。尽管如此，从你侧腹沾染的淫液来看，她似乎被激起了不少性欲。你低头看着她，说道：[say:看来你这个小骚货还有受虐倾向啊？][pg]");
            outputText("她羞红了脸，随着她的点头，女性液体的流动变得更加浓稠。你知道她可能会喜欢你对她做的任何性行为，所以你还不如给她个惊喜。一个残忍的想法在你的脑海深处形成——报复她试图给你下药。你轻松地从她的腰带上扯下小袋，随意抽出几个瓶子。地精明白了你的意图，开始挣扎着想要挣脱，但你轻松地制服了这个小个子女人，把药强行塞进她的嘴里，一瓶接一瓶。当她试图把药吐出来时，你按摩她的喉咙，触发她吞咽的本能。[pg]");
            outputText("灌到第三瓶时，她已经放弃了挣扎，转而试图寻找你身体的某个部位来摩擦。她的嘴巴张得大大的，整张脸因为欲望而涨成了紫红色。你强行喂完剩下的瓶子，然后松开她，在她落地前抓住了她的脚踝。她发情的味道以及所有药物和催情剂散发出的气味让你产生了一点“接触性快感”，至少你的" + get_player().vaginaDescript(0) + "滴下了女性的淫液。你的欲望可以等一等。这个荡妇需要受到惩罚。[pg]");
            outputText("你把这个生物翻转回你的臂弯里，这次让她面向相反的方向。*啪！* 你的手拍在她那圆润的屁股上。你把手收回来，感觉到了一些湿润，这多亏了她那突出的阴唇。这个小婊子的小穴被欲望点燃了，仅仅是打一下屁股，她就几乎要喷水了。你又拍了她一下，看着她全身紧绷，感觉到她的淫液溅到了你身上。[say:你把我弄湿了，你这个婊子！！坏女孩！]你骂道，打得更用力了。[pg]");
            outputText("地精尖叫起来，虽然你不知道是因为高兴还是痛苦。你开始越来越用力地打她的屁股，在反复的虐待下，她的屁股从绿色变成了红色。她的整个身体开始抽搐并喷水，把她的蜜汁溅到了你的手臂上。她高潮了！好吧，在看了那样的表演之后，她也要让你高潮——否则！[pg]");
            outputText("这次你真的把她放下了，但没有给她站起来的机会，粗暴地把你的" + get_player().vaginaDescript(0) + "压在她身上。她在你身下挣扎，沉浸在自己的快感中，没有意识到发生了什么。她那小小的拳头无力地捶打着你的大腿，感觉出奇的好，你允许她继续这样下去，直到你觉得“前戏”够了，开始粗暴地把你的阴部在她的脸上摩擦，让她的舌头滑进你的阴唇。[pg]");
            outputText("你看不见她在做什么，但她的挣扎很快就停止了，因为味道和气味触发了她舔舐的本能。你颤抖着；这感觉比预期的要好得多。也许她的一些药水在她的嘴唇和舌头上留下了残留物，但你不在乎。当你后腿因快感而发软时，你把更多的重量压在这个小荡妇身上。她的反应是把手滑上来，捶打你的[clit]，试图把你从她身上弄下来。[pg]");
            outputText("她的努力得到了回报，你在这个被下药的绿色婊子身上高潮了，在她的舌头上留下了小穴的味道。她的脸上带着一种奇怪的呆滞笑容，看起来处于一种介于清醒和睡眠之间的奇怪状态。你看着她在地上抽搐和扭动，大口喘气，不断地高潮。虽然一开始你很担心，但抽搐开始减慢；这个小逼应该没事。[pg]");
            outputText("你漫不经心地穿上衣服，无视了那个沉浸在极乐中的地精的喘息和呻吟，准备离开。你最后回头看了一眼，发现她的淫液已经汇聚成了一个比她还大的水坑。她醒来时可能会有严重的宿醉。你叹了口气，小跑着离开了，对做得太过火感到有点内疚。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
         else if(get_player().isNaga())
         {
            get_images().showImage("goblin-win-female-naga-rapedfem");
            outputText("你滑行到那个无助的地精身边，她一半恐惧一半好奇地看着你。");
            if(get_player().face.type == 5)
            {
               outputText("你对她露出獠牙，她的好奇心消失了。她转身想跑，但你的尾巴比她快。");
            }
            else
            {
               outputText("你对她微笑，她的恐惧消失了。不过她仍然很警惕，你确保在她改变对你的看法之前用尾巴抓住她。");
            }
            outputText("[pg]");
            outputText("你将自己紧紧地缠绕在挣扎的猎物身上，在这个过程中脱掉了她那淫荡的“衣服”。失去行动能力的地精哀怨地向你呜咽，你作为回应，用手拍打她的小穴。把手拿开时，你惊讶地发现它有多湿。你在她的脸上擦干，然后把头低到她的耳边。[pg]");
            if(get_player().cor > 60)
            {
               outputText("你向这个惊恐的女人发出语无伦次的嘶嘶声，她在你的抓握中开始颤抖。你笑着把手指滑进她的嘴里，她开始吸吮它们，试图安抚你。她那小小的舌头感觉棒极了；显然她在这方面非常有经验。");
               outputText("你用手指撑开她的嘴。她很困惑，但当你摆弄身边的东西时，她无法反抗。她意识到即将发生的事情时已经太晚了，你从她的小袋子里拿出了几个闪亮的烧瓶。作为她试图毒害你的惩罚，你开始把一瓶接一瓶的药水倒进她的嘴里，抚摸她的喉咙，强迫她喝下去。[pg]");
            }
            else
            {
               outputText("当你的手指在她的脸上滑动时，你问她是否为试图毒害你而感到抱歉。她向你猛烈地点头，因为被勒得太紧或太害怕而无法回答。你对她愉快地微笑，感觉到她的身体在你的抓握中放松了一点。你的手指滑进她的嘴里，她急切地吸吮着，显然不想激怒你。她的舌头很灵巧，你享受了一会儿这种体验，直到你决定你已经把玩够了。[pg]");
               outputText("张开手指，你撑开她的嘴，不让它闭上。困惑的地精试图看看你在她身边做什么，但看不到。然而，当你从她的小袋子里拿出一把闪亮的烧瓶时，她的身体再次紧绷，向你呜咽。[pg]");
               outputText("不过，你对这个生物的怜悯还不足以阻止你惩罚她，你从那堆药剂中挑出了一些看起来不太强效的。你一边轻轻抚摸她的喉咙以确保她咽下去，一边一瓶接一瓶地倒进去。[pg]");
            }
            outputText("效果没过多久就显现出来了，很快这个荡妇就变成了紫红色，拼命地想在你的盘绕上摩擦。她沮丧地喘息和呻吟着，因为她滴水的小穴无法从你光滑的下腹部获得足够的快感，而你则在一旁等待，享受着这种感觉。[pg]");
            outputText("你将尾巴滑到她的小穴上，用尾尖捏了捏她的阴蒂。她立刻喷出一股液体，将你本来就光滑黏稠的盘绕彻底涂满了她的淫水。你在她面前摇了摇手指，告诉她；你还没玩够呢。[pg]");
            outputText("你的尾巴顺滑地滑入她的体内，让她舒服地呻吟起来，并挺起臀部。你在她体内扭动，把她撑得那么大，你怀疑她会合不拢腿好一阵子。你的尾尖触到了她爱道的尽头，你惊讶地发现她的子宫在跳动，试图抓住一些不存在的东西。出于好奇，你将尾巴移到开口处，它抓住了你，把你拖进了她的子宫。你对着快感超载的地精微笑，开始抚摸肉壁。她紧紧地夹住你，在狂喜中尖叫，眼睛翻白。[pg]");
            outputText("毫无预兆地，你拔出了整条尾巴，感觉到一股巨大的液体从你身后滑出。地精几乎失去了意识，所以你在她的袋子里四处寻找能帮忙的东西。不过，似乎没有什么看起来能帮上忙，你开始后悔自己太残忍了，这时你注意到最底部有一个特别小的瓶子。[pg]");
            outputText("你把它拿出来检查。它只有一厘米多长，里面装满了白色的液体。上面有标签，但字太小了，看不清。你觉得你能认出[say: 醒来]这个词，但不太确定。[pg]");
            outputText("你耸耸肩，把里面的东西倒进地精的嘴里，只有一滴，很快就被她的舌头吸收了。有一会儿什么也没发生，然后这个小小的身影开始剧烈地颤抖。你不知道该怎么办，只能保持原样，紧紧地抱着她。颤抖像开始时一样突然停止了，你觉得你可能杀了她。[pg]");
            outputText("不过，这很快就被证明是错的，因为她猛地睁开眼睛，大喊[say: 呜呼！]你对她举止的突然改变感到惊讶，但决定顺其自然，把你的" + get_player().vaginaDescript(0) + "塞进这个显然精力充沛的小生物体内。[pg]");
            outputText("你听到一声闷响，[say: 遵命，老板！]，然后她开始舔舐并轻轻啃咬你。这种感觉美妙极了，你忍不住想知道那瓶子里装的是什么，但当你高潮时，这个念头就从你的脑海中消失了，你把淫水喷了她一身。[pg]");
            outputText("你一次又一次地高潮，地精不知疲倦，你倒进她嘴里的各种物质的残留物仍然覆盖着她的嘴唇和舌头，让你不想停下来。最后你累了，把地精从你的缠绕中释放出来。她双脚落地，做了一个脚尖旋转，在空地上跑了一会儿（一直像个疯女人一样咯咯地笑），然后脸朝下倒在她的“衣服”上。[pg]");
            outputText("你对刚才发生的事情感到彻底的困惑，决定不拿命运开玩笑，不要在这个被下了重药的生物附近逗留，一拿好东西就立刻回营地。");
            get_combat().cleanupAfterCombat();
            get_player().orgasm("Vaginal");
         }
         else
         {
            get_images().showImage("goblin-win-female-rapedfem");
            outputText("你抱起地精，让她坐在你的膝盖上，用左手将她的双臂反绑在背后。你从她那荡妇般的衣服上撕下一块柔软的皮革，用来绑住她的手臂。她抬头看着你，眼睛睁得大大的，一想到要任由一个比她大的生物摆布，她就感到害怕。尽管如此，如果弄脏你膝盖的汁液能说明什么的话，她似乎被激起了不小的性欲。你低头看着她，说道，[say: 看来这小荡妇有受虐倾向，是吧？][pg]");
            outputText("她羞红了脸，随着她的点头，女性液体的流动变得更加浓稠。你知道她可能会喜欢你对她做的任何性行为，所以你还不如给她个惊喜。一个残忍的想法在你的脑海深处形成——报复她试图给你下药。你轻松地从她的腰带上扯下小袋，随意抽出几个瓶子。地精明白了你的意图，开始挣扎着想要挣脱，但你轻松地制服了这个小个子女人，把药强行塞进她的嘴里，一瓶接一瓶。当她试图把药吐出来时，你按摩她的喉咙，触发她吞咽的本能。[pg]");
            outputText("喝到第三瓶时，她已经放弃了挣扎，转而试图把她的阴部在你的膝盖上摩擦。她的嘴巴张得大大的，整张脸因为欲望而涨成了紫红色。你强行喂她喝完剩下的瓶子，然后推了她一把，抓住她的脚踝，把她按在你的腿上，屁股翘在半空中。她发情的味道和所有药物及催情剂散发出的蒸汽让你有点“接触性兴奋”，至少在某种意义上，你的" + get_player().vaginaDescript(0) + "");
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("变得肿胀湿润");
            }
            else if(get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("滴下女性的湿润");
            }
            else if(get_player().vaginas[0].vaginalWetness < 5)
            {
               outputText("慢慢开始浸湿你的大腿");
            }
            else
            {
               outputText("因需求而流口水，在你身下积成一滩");
            }
            outputText("。你的性欲可以等等。这个荡妇需要被惩罚。[pg]");
            outputText("*<b>啪</b>！* 你的手狠狠地打在她圆润的屁股上。你收回手，感觉到几滴湿润，这多亏了她突出的阴唇。这小婊子的阴部因为需求而发炎，以至于仅仅是打一下屁股她就几乎要喷水了。你又打了一巴掌，看着她整个身体紧绷，感觉到她的体液溅到了你身上。[pg]");
            outputText("[say: 你把我弄湿了，你这贱货！！坏婊子！]你骂道，打得更用力了。[pg]");
            outputText("地精尖叫起来，虽然你不知道是因为高兴还是痛苦。你开始越来越用力地打她的屁股，在反复的虐待下，她的屁股从绿色变成了红色。她的整个身体开始抽搐并喷水，把她的蜜汁溅到了你的手臂上。她高潮了！好吧，在看了那样的表演之后，她也要让你高潮——否则！[pg]");
            outputText("你把她从你的腿上拉下来，把她的脸推到你的" + get_player().vaginaDescript(0) + "里。她在你身上挣扎，太沉迷于自己的快感而没有意识到发生了什么。你强行把她丰满的小嘴唇贴在你的阴部上摩擦，让她的舌头滑进你的褶皱里。她的眼睛变成了白色的小缝，瞳孔向上翻得看不见，但里面有足够的东西让她的舌头认出了味道并开始舔舐。你颤抖着；感觉比应该的要好得多。也许她的一些药水在她的嘴唇和舌头上留下了残留物，但你不在乎。[pg]");
            outputText("你射在这个被下了药的绿色婊子身上，");
            if(get_player().vaginas[0].vaginalWetness > 4)
            {
               outputText("用你的体液溅了她一身");
            }
            else if(get_player().vaginas[0].vaginalWetness > 3)
            {
               outputText("用你快乐的证明覆盖了她的脸");
            }
            else if(get_player().vaginas[0].vaginalWetness > 2)
            {
               outputText("让她沾满了你的下体汁液");
            }
            else
            {
               outputText("在她的舌头上留下了阴部的味道");
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
               outputText("乳汁从你的乳头滴落，落入小荡妇的头发里。");
            }
            outputText("她的脸上挂着一种奇怪的呆滞笑容，看起来像是处于某种介于清醒和睡眠之间的奇怪状态。你抓住她的头发，把她扔在地上，看着她的身体抽搐和跳动，因为她的高潮继续折磨着她的身体。看起来它开始减慢了，这个小逼应该会没事的。[pg]");
            outputText("你随意地穿好衣服，无视了那个沉浸在极乐中的地精的喘息和呻吟，准备离开。你最后回头看了一眼，发现她的体液已经汇聚成了一个比她还大的水坑。她醒来时可能会有严重的宿醉感。你");
            if(get_player().cor > 50)
            {
               outputText("得意地笑了笑");
            }
            else
            {
               outputText("叹了口气");
            }
            outputText("然后漫步离开，感觉");
            if(get_player().cor < 50)
            {
               outputText("对做得太过火感到有点内疚。");
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
         spriteSelect(SpriteDb.get_s_goblinShaman());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         get_images().showImage("goblin-win-male-buttsex");
         outputText("像往常一样，你轻松地击败了另一个淫荡的地精。你对自己的实力还有什么怀疑吗？知道接下来会发生什么，地精为不可避免的事情做好了准备。她舔着嘴唇，脸上因兴奋而泛红。为了进一步刺激你，她张开双腿，露出更多她那湿透的阴部。[pg]");
         outputText("[say:操我，种马！]她乞求道。虽然被击败了，但她还是有胆量提出要求。[say:把你的精液射满我里面！]她的失败似乎并没有让她的嘴巴安静下来。[pg]");
         outputText("你感到受到了侮辱。谁在之前的战斗中取得了胜利？如果你自己不是那么饥渴的话，你本可以把她留在那里，让她在自己的体液中打滚。那么你该怎么做呢？在默默思考了一会儿之后，你产生了一个极其邪恶的想法。[pg]");
         outputText("快速脱下你的[armor]后，你撕下了这个绿皮女人身上仅有的一点衣服。你轻松地把她从地上举起来，把她放在你的" + get_player().cockDescript(_loc1_) + "上。这个小地精荡妇被你迷住了，她的身体因兴奋而颤抖。[pg]");
         outputText("你冷笑一声，用你" + get_player().cockDescript(_loc1_) + "的龟头顶住的不是她湿透的阴唇，而是她的屁眼！[pg]");
         outputText("[say:不要那里！]她乞求道，嘴唇颤抖，眼泪汪汪。[say:我需要你的精液来建立我自己的部落！]她解释道。[pg]");
         outputText("你对你手中颤抖的女人一言不发。没有任何语言可以描述你粉碎她梦想时感到的快乐。天哪，这个世界真的腐化了你，而你喜欢这样！[pg]");
         outputText("你毫不犹豫地把地精荡妇猛地按在你的" + get_player().cockDescript(_loc1_) + "上，几乎把她刺穿了！她屁眼瞬间的紧致感几乎让你崩溃！她越是扭动，她的臀部肌肉就越紧紧地挤压你。你在狂喜中僵住了一会儿，舌头从嘴里垂下来，眼睛翻白。[pg]");
         outputText("地精抗议着，扭动得更厉害了，甚至用拳头捶打你的胸膛；她现在太虚弱了，她的攻击实际上只是在给你挠痒痒。她微弱的攻击足以让你从肉欲的迷茫中清醒过来。你狂热地咧嘴笑着，抓住她纤细的腰肢，狠狠地操她！随着你越来越用力、越来越深地抽插，你的" + get_player().cockDescript(_loc1_) + "很快就适应了她被撑开的屁眼！[pg]");
         outputText("[say:这不是我想要的！]她哭喊着，[say:这不是我想要的！]如果你的" + get_player().cockDescript(_loc1_) + "撑开她的屁股还不够的话，她还能感觉到你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().sackDescript());
         }
         else
         {
            outputText(get_player().hipDescript());
         }
         outputText("随着每一次抽插，你都会拍打她丰满的臀部，仿佛在戏弄她。[pg]");
         outputText("地精那紧致的后庭让你难以把持。你的身体剧烈地抽搐着，将大量的精液射入她的体内。发泄完毕后，你把这个小婊子扔到了地上；你现在对她已经没有兴趣了。[pg]");
         outputText("当你捡起你的[armor]开始穿衣服时，你瞥了一眼那个地精。她的双手开始在她那被撑开的肛门里抠挖，拼命地想要收集你射在里面的精液。你得意地笑了笑，若无其事地走开了，对自己非常满意。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
      }
      
      public function giveGoblinAMilkMustache() : void
      {
         clearOutput();
         outputText("你慢慢走向倒地的地精，温柔地告诉她现在一切都会好起来的。她有些怀疑地看着你，张开双腿，显然希望你能满足她的欲望。你对她摇摇头，双手托起你那" + get_player().biggestBreastSizeDescript() + "，告诉她现在是喂奶时间。地精有些恼火地看着你，说道：[say:我才不要你的奶子！我要你的下半身！]你笑着抓住她的手臂，把它们拉到她的脑后。[pg]");
         outputText("她挣扎着，试图把什么东西，任何东西塞进她那饥渴的小穴里，同时大喊：[say:来吧，" + get_player().mf("荡妇","种马") + "，你知道你想要的——唔！]你把她的嘴按在你的" + get_player().nippleDescript(0) + "上，打断了她的话。她不由自主地喘息着，嘴里充满了你的乳汁。一瞬间，她僵住了，然后慢慢咽下嘴里的奶水。片刻之后，她在你怀里放松下来，温柔地吮吸着你的乳头。她以前那充满欲望的样子不见了，取而代之的是一个顺从的女孩，现在除了你的奶水什么都不想要。你慢慢放下手，开始揉搓她仍然湿润的小穴。作为回应，她把手放在你的另一个[nipple]上，把玩着它，挑逗着你。[pg]");
         outputText("过了一会儿，你感觉到地精在你怀里睡着了。即使这样，她仍然继续温柔地吮吸着你的[nipple]。你满意地笑了笑，轻轻地把地精从你的胸前抱起。你轻轻拍了拍她的肩膀，她又醒了过来。她有些茫然地看着你，你轻轻推了她一下，她便带着空洞、流着口水的眼神走开了。");
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
         outputText("地精趴在地上，因战斗而筋疲力尽。她丰满的双腿无意间张开，屁股高高撅起，让你清楚地看到她湿润的小穴，而她正试图让自己高潮。看来这个绿皮荡妇已经把你给忘了——太多次徒劳的遭遇可能已经让她放弃了寻找一个强壮的雄性来用精液填满她的希望。[pg]");
         outputText("对她来说幸运的是，你完全打算改变这一点。[pg]");
         outputText("你开始抚摸你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("当你走向那个毫无防备的地精女孩时，你欣赏着她那完美的圆臀随着她急促的动作而晃动的景象，她柔软的大腿紧紧夹着那只在它们之间急切动作的手。你弯下腰，迅速抓住地精宽大的臀部，女孩惊讶地尖叫了一声，转过身来，看到了你勃起的长度");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。 [pg]");
         outputText("[say: 哇-哇哦！嘿，帅哥，你觉得你在后面干什么呢？]她叫喊着，对你的突然出现感到惊讶多于害怕。你没有回答，而是决定抓住你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("然后拍打");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("拍打在她光裸的屁股上，而你的受害者正焦急地等待着你的下一步动作。你花时间用双手按摩着地精淫荡的屁股，然后将你的" + get_player().cockDescript(_loc1_) + "滑入她柔软的双丘之间。你饥渴的受害者显得很不耐烦，试图在你身上摩擦，同时张开她湿润的阴唇，热情地迎接找到了一个愿意和她交配的人。你用力拍打她的屁股，加快了抽插的速度——就在你终于将");
         if(get_player().cockTotal() == 1)
         {
            outputText("你的肉棒插入这个喘息的荡妇体内，猛烈地将她向前推，进入她紧致的阴道");
         }
         else if(get_player().cockTotal() == 2)
         {
            outputText("你的两根肉棒同时插入这个喘息的荡妇体内，猛烈地将她向前推，进入她紧致的阴道和屁眼");
         }
         else
         {
            outputText("你的两根肉棒插入这个喘息的荡妇体内，猛烈地将她向前推，进入她紧致的阴道和屁眼——而你的另一根肉棒");
            if(get_player().cockTotal() >= 4)
            {
               outputText("");
            }
            outputText("则夹在她的屁股瓣之间");
         }
         outputText("。 [pg]");
         outputText("你粗暴地操弄着这个地精女孩，紧紧抓住她的臀部，而她则发出愉悦的尖叫。你的腹股沟拍打在她身上的声音在整个区域回荡，伴随着你的闷哼和地精狂喜的呻吟。你的受害者挣扎着想用手臂撑起身体，却又因为你侵入她体内的感觉而瘫倒下去。[pg]");
         outputText("最终，你开始感觉到自己即将达到高潮，你的动作越来越快，为释放积蓄力量。你身下的地精已经迷失在你" + get_player().cockDescript(_loc1_) + "带来的快感中，她翻着白眼，舌头从嘴里伸出流着口水，淫荡的脸庞在你正操弄她的地面上摩擦。伴随着最后一次冲刺，你的臀部向前猛挺，用浓稠的精液涂满了她的体内，享受着你的射精将她填满并堵住她入口的感觉");
         if(get_player().cockTotal() == 2)
         {
            outputText("");
         }
         outputText("。你慢慢地从她紧致的身体中抽出，最后将剩余的精液覆盖在她曲线优美的背部和挺翘的臀部上。[pg]");
         outputText("你站起身来，慢慢地撸动着自己，精液从你的" + get_player().cockDescript(_loc1_) + "滴落到瘫倒的地精身上。她还需要一段时间才能恢复意识，但你确信当她醒来时，她会对性有更好的体会。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
   }
}

