package classes.scenes.areas.volcanicCrag
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.areas.volcanicCrag._HellmouthScene.SaveContent;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.Imp;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class HellmouthScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function HellmouthScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "hellmouth";
         saveContent = new SaveContent(null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.ambushed = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function loseToHellmouth() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_hellmouth());
         outputText("面对那锋利的牙齿和地狱般的吐息，这只怪物对现在的你来说实在难以招架。当地狱巨口最后一次张开大嘴时，你无力地瘫倒在地。");
         outputText("[pg]你的视线变暗，当她的大嘴吞没你的头部时，你感到脑袋被湿热的气息所包围。当你意识到她要做什么时，你的心沉了下去，但在你现在的状态下，你几乎无法反抗。");
         outputText("[pg]她眨眼间闭上了大嘴。你几乎没感觉到任何痛苦，她那剃刀般锋利的牙齿和强健的肌肉瞬间就终结了你。");
         get_game().gameOver();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function killHellmouth() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_hellmouth());
         if(get_player().get_weapon().isHolySword())
         {
            outputText("你揪住地狱之口的耳朵，疼得她大叫起来。她张开大嘴，成为了你的首选目标。你将[weapon]刺入她的喉咙，用神圣的能量焚烧了她食道的内壁。她只挣扎和尖叫了片刻，你纯洁的刀刃就将她从这个世界上清除了。");
         }
         else if(get_player().get_weapon().isScythe())
         {
            outputText("即使是地狱之口本身也无法逃脱死亡的化身。你以戏剧性的方式举起镰刀，像热刀切黄油一样切开恶魔的脖子，将其切开，以一种冷酷而高效的方式杀死了恶魔。");
         }
         else if(get_player().get_weapon().isStaff() && get_player().get_weapon().isChanneling())
         {
            outputText("你的[weapon]闪烁着空灵的光芒，准备好给予致命一击。你像挥舞棍棒一样将法杖砸向地狱巨口的前额，在光芒和碎肉的喷发中将其击碎。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你伸展四肢放松下来，做好了准备。高举起你的[weapon]，残忍地砸向地狱之口的头骨，将其砸得面目全非。");
         }
         else if(get_player().get_weapon().isKnife())
         {
            outputText("你用同样短小的工具迅速解决了这个恶魔小矮子，弯下腰将[weapon]刺入她的后颈。她尖叫了一声，随后你扭动刀刃，瞬间夺走了她的生命。");
         }
         else if((get_player().get_weapon().isAxe() || get_player().get_weapon().isLarge()) && get_player().get_weapon().isBladed())
         {
            outputText("你挥舞着[weapon]狠狠地砍向地狱之口的背部，斩断了她的脊椎，掏出了她的内脏。她绝对活不成了。");
         }
         else if(get_player().get_weapon().isStabby())
         {
            outputText("你走上前去，向下扭转你的[weapon]，将其刺穿恶魔的心脏。地狱之口尖叫着扭曲身体，但随着你的刀刃摧毁了她的重要器官，她的生命很快就消逝了。");
         }
         else if(get_player().get_weapon().isSpear())
         {
            outputText("你揪住恶魔的耳朵，强迫她站起来。虽然疲惫不堪，但她还是勉强站了起来。你紧紧握住[weapon]，向前猛冲，残忍地刺穿了地狱之口。");
         }
         else
         {
            outputText("你集中注意力，将手刀对准她的后颈。你动作迅猛而凌厉，力道刚好足以破坏她的脊髓。随着瘫痪和呼吸停止，这只地狱巨口的生命走到了尽头。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2724,FlagDict_Impl_.arrayReadInt(_loc1_,2724) + 1);
         if(get_player().cor < 25)
         {
            dynStats(DynStat.Cor(-0.5));
         }
         get_player().upgradeDeusVult();
         get_combat().cleanupAfterCombat();
      }
      
      public function hellmouthSixtyNine() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("俗话说，胜者为王。而你的奖励就是这个奇怪又可爱的小怪物。你用力把这个恶魔按在地上，让她仰面朝天[if (!isnaked) {并脱光自己的衣服}]，然后跨坐在她的脸上。你用坚定的语气告诉她，不要用那张嘴耍什么花招，只要用她的舌头在你的小穴上干活就行了。她发出一声听起来很顺从的呜咽，你很快就感觉到她巨大的舌尖在你的阴唇上令人愉悦地滑动。真是个配合的小东西。");
         outputText("[pg]坐在她的脸上，你认为这是探索她身体结构的一个绝佳机会。你移动你的[hands]去抚摸和挤压她相对较小的乳房，捏着她的乳头，让她在你身下微微扭动。很快，你顺着她的身体往下，抚摸着她柔软而胖乎乎的肚皮上灰白的皮肤，慢慢向下，最终到达她的胯部。当你这样做时，你感觉到她那可怕的舌头在你的私处来回摩擦，令人愉悦。那湿润的器官以令人愉悦的力度舔舐和摩擦着。这就对了。你俯下身，分开她粗壮的大腿，露出她流着口水的小穴。看来她并没有因为被人坐在脸上而感到扫兴。你把这看作是一个绝佳的机会，把你的头和嘴移到她的外阴。你把你的[tongue]伸向她湿润的私处，立刻开始快速地舔舐她，享受着她体液的味道，同时引得这个恶魔发出有些压抑的呻吟声，并让她加快了速度。");
         outputText("[pg]戏弄她固然有趣，但如果你能更进一步，她可能会更渴望取悦你。你用嘴唇包裹住她坚硬的阴蒂，用舌头在上面做圆周运动，用力压着它。这个胖乎乎的小女恶魔发出了一声愉悦的声音，你很快就感觉到她那巨大、湿润的舌头开始急切地探入你的[vagina]入口。起初，她只是用舌尖慢慢进入，在里面转了一会儿，但很快她就逐渐把那根又长又粗的器官越插越深。它深深地穿透了你，直到你勉强感觉到它擦过你的子宫颈才停下来，让你的小穴完全被填满。这绝对不是一种不愉快的感觉，所以你继续在她阴蒂上工作，吸吮和舔舐着那个僵硬的小豆豆。这个奇怪的生物发出了更多性愉悦的声音，并把腿向上移，用她粗壮的大腿紧紧夹住你的头，同时开始用她的舌头在你体内来回抽插。");
         outputText("[pg]她对这块过大的肌肉的控制出人意料地灵巧，能够以你绝对意想不到的速度将它几乎完全滑出，然后又完全滑入，同时还在你体内弹动它的尖端。她的舌头强有力而稳定地操着你，又硬又深，如果你不知情的话，你绝对想不到那是你体内的东西。你们俩躺在地上，悬崖上炎热的风吹拂着你们，每个人都在猛烈地取悦着对方。几分钟后，这个小恶魔大叫一声，她的小穴痉挛着喷出体液，同时在你身下扭动着达到了高潮。你以比以前更大的活力继续在她暂时过度敏感的阴蒂上工作，决心迫使她让你也达到高潮。没过多久，她就照做了。当她在你体内抽插她的器官时，热量[if (singleleg){在你的胯下|在你的双腿之间}]积聚，高潮的快感很快席卷了你的全身，你的阴道壁痉挛、抽搐，紧紧地挤压着她巨大的舌头。你随着她的节奏上下摇摆着身体，享受着这极致的快乐，直到你的高潮结束才停下来。");
         outputText("[pg]完事后，你站起身，感激地拍了拍这个胖乎乎的小恶魔的头，揉了揉她柔软如丝的头发[if (!isnaked) {，然后穿上衣服}]。她抬起头看着你，脸上带着微笑，眼中满是满足。这小东西不张开那张大嘴的时候其实挺可爱的。[if (silly) {就像一个患有可怕皮肤病的性感胖侏儒。}]你向地狱之口挥手告别，然后离开，继续你剩下的[day]。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function hellmouthPiss() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("这个可恶的小恶魔有一张多么可怕的地狱之口。在这个矮小的女恶魔处于毫无防备的状态下，这似乎是在她的伤口上撒盐的绝佳时机。也许还能在其中找点乐子。");
         outputText("[pg]你走到这个胖乎乎的小婊子面前，抓住她的头发把她的头拽了起来。你轻轻抚摸着她的脸颊，对她咧嘴一笑，告诉她你要让她看看你对她那张不自然的大嘴有什么看法。她只是困惑地呻吟着，还没有从战斗中恢复过来。你一个利落的动作，粗暴地把她推倒在地，让她仰面朝天。");
         outputText("[pg]当你低头看着她时" + (!get_player().isNaked() ? "，同时脱下你的[armor]" : "") + "，她带着些许困惑抬头看着你，她伸出舌头，好像在期待你让她用它来伺候你。这和你心里想的差不多，但不完全一样。你只是在她上方站了一会儿，感受着热风拂过你的感觉，然后你蹲在她的头上，迅速抓住她张开的大嘴里那条大舌头。你的小穴就在她的脸正上方，你用她的舌尖戏弄地挠着你的[clit]，告诉她只要躺着别动，一切很快就会结束。她微微点了点头，你便开始行动了。");
         outputText("[pg]你把她的舌尖从你的阴蒂上移开，而是把它滑进你的[vagina]入口。没有任何警告，你尽可能仔细地瞄准，向她那恶魔般的嘴巴打开了闸门。你立刻意识到你的瞄准有点偏差，因为你的尿液溅到了她的脸上，正中眉心。她厌恶地左右摇头，但在你紧紧抓住她舌头的情况下无法逃脱。你迅速纠正了瞄准，把尿液喷在她的脸上，喷向你的目的地。你确保尽可能慢地排泄，以延长她的屈辱，她持续的挣扎除了让她的脸颊和下巴也被浸湿之外，毫无作用。");
         outputText("[pg]虽然羞辱很有趣，但为自己弄点乐子肯定也不错。你猛地拉扯她的舌头，把它深深地压进你的体内，同时操纵着这个长长的器官，确保它的一部分压在你的尿道上，让你的尿液顺着她的舌头流下。当尿液直接流下她那可怕的器官时，她被这味道恶心得作呕，她更加用力地挣扎，在它还在你的[vagina]里时，她为了抵抗而甩动着它，这狂野而无意的动作增加了你的快感。随着你随心所欲地把她滑溜的器官深深地插进你的体内，而她在你体内猛烈地甩动着它，没过多久，你就感觉到高潮的狂热[if (haslegs) {在你的双腿之间|在你的胯下}]积聚。");
         outputText("[pg]当强烈的高潮冲击着你时，你的身体颤抖着，快感的浪潮震撼着你的全身，让你非常刻意地把膀胱里最后的液体挤出来。你故意把一大股液体喷在她的脸上，当她厌恶地在地上扭动时，你仍然在她的舌头上享受着高潮。冷却片刻后，你放开了她的器官，她非常迅速地把它缩回了她那可恶的大嘴里。当你准备" + (!get_player().isNaked() ? "重新穿好衣服" : "收拾你的东西") + "时，她试图擦去脸上的尿液，然后连滚带爬地逃离了你。这也许给了她一个教训。");
         outputText("[pg]" + (get_player().isNaked() ? "你花了一点时间喘口气" : "你穿好衣服，花了一点时间喘口气，") + "然后心满意足地回去了。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function hellmouthHairjob() : void
      {
         var _g:Combat;
         clearOutput();
         spriteSelect(SpriteDb.get_s_hellmouth());
         if(get_player().hasCock())
         {
            get_player().orgasm("Dick");
            outputText("绝对不能相信这该死的巨口。话虽如此，你仍然打算发泄一下，而且你已经有了一个主意。");
            outputText("[pg]当你露出你的[cock]时，地狱巨口茫然地看着。她猜到了你的意图，顺从地张开嘴，露出她的喉咙以及她那令人不安的牙齿。你合上她的下巴，坚持说你[i:绝对不会]把你的阴茎放进[i:那里。]头发，你告诉她。她将用她的头发来满足你。[pg][say: ……什么？]她说道，被这个命令搞得不知所措。你坚持她应该用这种方式取悦你。地狱巨口紧张地顺从了，将她长长的黑色秀发拉到你的肉棒上。丝般柔滑的头发带来一种柔软而愉悦的感觉。女恶魔抬头看着你，似乎在问她做得对不对。你向她保证她应该继续。她下定决心般地哼了一声，开始包裹你的[cock]，直到它被紧紧束缚。你给了她一个期待的点头，示意她还没完。");
            outputText("[pg]地狱巨口抓住你的阴茎开始套弄。一开始她最多只能算是笨手笨脚，但随着她继续，她变得更加自信，让你享受她天鹅绒般的秀发在你的肉棒上滑动的触感。任何生物怎么能拥有如此保养得当的头发，这真是一个谜。地狱巨口撸得更用力了，变得更加渴望看到你以这种新奇的方式发泄。她张开嘴准备接受即将到来的精液，但你阻止了她。这次她没有得到喂食。你把她的头固定在原位，和她一起握住你的阴茎，坚定而快速地套弄以达到高潮。你闷哼一声，将精液喷洒在她的头发和脸颊上。");
            outputText("[pg]你心满意足地叹了口气，穿好衣服回家。地狱巨口再次茫然地坐着，回味着她刚刚经历的一切。");
         }
         else
         {
            get_player().orgasm("Vaginal");
            outputText("绝对不能相信这该死的巨口。话虽如此，你仍然打算发泄一下，而且你已经有了一个主意。");
            outputText("[pg]当你露出那大得夸张的阴蒂时，这只地狱之口呆呆地看着。她似乎明白了你的意图，顺从地张开嘴，露出了她的喉咙以及那令人不安的一排排牙齿。你捏住她的下巴，坚持说你[i:不会]把自己的任何部位放进[i:那里]。你告诉她，用头发。她要用她的头发来满足你。");
            outputText("[pg][say:……什么？]她说道，被这个命令弄得有些不知所措。你坚持她应该用这种方式取悦你。地狱之口紧张地照做了，将她长长的黑发拉起，盖在你完全女性化的器官上。那如丝般顺滑的发丝带来一种柔软而愉悦的感觉。女恶魔抬头看着你，似乎在问她做得对不对。你向她保证，她应该继续。她下定决心般地呼出一口气，开始用头发包裹你的[clit]，直到它被松松地包住。你满怀期待地向她点了点头，示意她还没完。");
            outputText("[pg]地狱之口抓住你的假阳具开始套弄。一开始她动作很笨拙，但随着动作的继续，她变得更加自信，让你享受着她天鹅绒般的发丝滑过你跳动的阴蒂的感觉。任何生物怎么能拥有如此保养得当的头发，真是个谜。地狱之口轻柔而又强烈地套弄着你，变得越来越渴望看到你以这种新奇的方式高潮。她张开大嘴，试图把脸凑到你的[vagina]上，吞下任何喷涌而出的淫液，但你阻止了她。这次她吃不到。你把她的头按在你的胯下，让她和你一起握住你的阴蒂，坚定而快速地套弄，以达到高潮。你呻吟着，将女性的淫液喷洒在她的头发和脸颊上。");
            outputText("[pg]你心满意足地叹了口气，重新穿好衣服，准备回家。地狱之口再次呆坐在那里，回味着她刚刚经历的一切。");
         }
         dynStats(DynStat.Cor(0.5));
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function hellmouthCuddling() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("尽管这个女孩有着明显的恶魔特征——而且你绝对不想把身体的任何部位靠近她那长满利齿、吞噬一切的嘴——但你还是带着可耻的勉强走到了她身边，让你对陪伴的渴望战胜了[if (cor < 30) {你所坚持的一切|常理}]。当你[if (singleleg) {高耸|站立}]在她上方时，恐慌掠过她那不自然的红眼睛，不过当你[if (hasweapon) {收起你的[weapon]|放下拳头}]并向倒地的女孩低声安慰时，她似乎稍微平静了下来。你不想伤害她——至少在她乖乖听话的情况下——而且你非常清楚地表明她<i>必须</i>听话。");
         outputText("[pg]她紧张地点了点头，将几缕深渊般漆黑的头发从脸上拂开。仔细想想，这似乎是她身上唯一看起来健康的东西。她那如瀑布般柔顺——或者说你只能这么假设——的秀发，与她病态的灰色皮肤形成了鲜明对比。她的皮肤薄得甚至能让你看清每一滴被污染的血液的流向，这绝对很怪异，却又奇妙地引人入胜。当你[if (isnaked) {伸了个懒腰，|脱下你的[armor]，}]展露自己的身体时，她的眼中似乎闪烁起兴趣的光芒，[if (hascock) {立刻被你逐渐变硬的[cock]所吸引|目光在你那" + (get_player().get_race() != "human" && get_player().demonScore() >= 4 && get_player().goblinScore() < 4 ? "不" : "") + "熟悉的身体上游移[if (isgenderless) {，并在到达你毫无特征的下体时好奇地停了下来}]}].");
         outputText("[pg]但那不是你来这里的目的。你需要拥抱某个人，感受她那不自然的、如火般炽热的肌肤贴着" + (get_player().skin.desc == "skin" ? "你的皮肤" : "你的[skindesc]") + "，在这片荒凉的土地上寻找你能找到的些许慰藉。这是一种令人释然的希望：即使是两个迷失的灵魂，也能在彼此的怀抱中找到些什么，哪怕只是转瞬即逝的片刻。");
         outputText("[pg]当你的手指划过她柔软的肌肤，描摹着她静脉的纹路时，女恶魔颤抖了起来。也许她已经太久没有见过怜悯了，以至于即使是这样的举动对她来说也太过沉重，因为当你躺在她身边，温柔地将她拥入怀中紧紧抱住时，那双锐利的红眼睛一直注视着你的一举一动。当她的心脏在你的胸膛上跳动，并随着她在你怀里放松下来而逐渐平缓时，你甚至很难想起她不是人类。而她的头发，事实上，正如你想象的那样柔软，当你的手指穿梭其中并按摩她的头皮时，感觉奇妙地如丝般顺滑。");
         outputText("[pg]她一定很喜欢这样，当你把她抱得更紧，沉醉于她身体的火热与柔软时，她在你胸前发出了呜咽声。如果你闭上眼睛，忘记她的污染，忘记那张贪婪的大嘴，你几乎可以把她想象成你的恋人，当你抚摸她的头发时，她温暖而汗津津地贴着你。");
         outputText("[pg]你摇了摇头，试图理清思绪。不，[if (cor < 50) {那太过火了|你今天想来点不一样的}]。");
         outputText("[pg]然而，当你看着她平稳的呼吸，享受着每次你的手指在她的背上跳舞时她似乎更加放松的样子，她那灰白的皮肤" + (get_player().isFluffy() && get_player().skin.furColor == "gray" || !get_player().isFluffy() && (get_player().skin.tone == "ashen" || get_player().skin.tone == "gray" || get_player().skin.tone == "rough gray") ? "与你自己的[if (isfluffy) {皮毛}]完美地融合在一起" : "与你自己的[if (isfluffy) {皮毛}]形成了鲜明的对比") + "，你很难不去想象她曾经的样子，那个渴望有人能陪伴在她身边的人。");
         outputText("[pg]而你现在就在这里。当然，你很快就得离开，下次你们见面时，情况可能就不会这么和平了。但当她躺在你身边，在你的怀抱中柔软而温暖时，那感觉就像是永恒。也许她会想起她本可以拥有的一切，抛弃所有的暴力——那些咬牙切齿和内心的火焰——并在悬崖上为自己创造新的生活。");
         outputText("[pg]当你放开她时，她失望地嘟囔着，她那火红的眼睛恳求你不要走，她拼命地想依偎得更近，但你不能整天待在这里。你有你自己的" + (get_player().hasChildren() ? "家人" : (get_camp().followersCount() + get_camp().loversCount() > 0 ? "朋友" : "家")) + "要照顾，伴随着一声轻声的道别，你[if (hasarmor) {穿好衣服并}]回到了营地。");
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function hellmouthAmbushShut() : void
      {
         clearOutput();
         outputText("你反应迅速，扑向这个可怕的生物，用你光着的[hands]紧紧合上她的下巴。她呜咽着，小火苗从她的嘴唇间飘出，但她正在召唤的小恶魔似乎无法从里面打开她的大嘴。地狱之口呜咽着，可怜巴巴地盯着你。你似乎有充足的时间来考虑你的下一步行动。");
         menu();
         addNextButton("释放",hellmouthAmbushRelease).hint("威胁似乎已经消除了。");
         addNextButton("杀死",hellmouthAmbushKill).hint("你似乎把她置于一个脆弱的位置。利用这一点。");
      }
      
      public function hellmouthAmbushRelease() : void
      {
         clearOutput();
         outputText("那双悲伤的眼睛这次终于得到了怜悯。你放开了恶魔，让她踉跄着后退，同时她痛苦地皱着眉头，摇晃着脑袋。突然，她开始干呕，仿佛要吐出来一样，接着一只气喘吁吁的小恶魔从她的嘴里掉了出来。");
         outputText("[pg][say:操——操！我差点在里面憋死！]这个小混蛋大喊道。这段经历似乎让他受到了极大的惊吓，他看起来已经筋疲力尽，无力再战。那张地狱之口似乎也同样晕头转向。");
         beatHellmouth(false);
         addButton(14,"离开",hellmouthAmbushLeave);
      }
      
      public function hellmouthAmbushLeave() : void
      {
         clearOutput();
         outputText("虽然这段经历至少有些新奇，但你现在决定让这两个倒霉的恶魔自生自灭。对你来说，能毫发无损地从这里脱身就已经足够了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hellmouthAmbushKill() : void
      {
         clearOutput();
         outputText("当你尽可能用力地扭断她的脖子时，她那悲伤、可怜的眼睛变得空洞。伴随着一声清脆的断裂声和一种湿润的、吧唧吧唧的声音。地狱之口倒在了地上。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2724,FlagDict_Impl_.arrayReadInt(_loc1_,2724) + 1);
         if(get_player().cor < 25)
         {
            dynStats(DynStat.Cor(-0.5));
         }
         get_player().upgradeDeusVult();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hellmouthAmbushDodge() : void
      {
         var _g1:HellmouthScene;
         var _g:HellmouthScene;
         clearOutput();
         outputText("你反应迅速，向旁边一跃，成功躲开了从食道发射出来的小恶魔。虽然到目前为止你毫发无损，但你并没有被允许和平离开，因为这两个恶魔已经摆好了攻击的姿势。");
         var _loc1_:String = "这个恶魔站起来大约有地精那么高，然而，她没有张开的小穴，反而是她的嘴似乎能够张大以容纳任何东西。她的牙齿通常锋利而威严，有两对较长的犬齿引人注目。她的皮肤是浅灰色的，可以看到细细的静脉。她的胸部相当适中，与她宽阔的臀部形成对比。她的眼睛很大，在漆黑的瞳孔周围闪烁着深红色的光芒。如果她有虹膜，那它们和瞳孔一样漆黑。她的精灵耳朵每只至少有一英尺长，从她长长飘逸的黑发中探出，向两侧下垂。如果不是你从那张地狱般的嘴里感觉到即将到来的死亡，她也许会很可爱。";
         _g = this;
         var _loc2_:Function = function():void
         {
            _g.beatHellmouth();
         };
         _g1 = this;
         var _loc3_:Function = function():void
         {
            _g1.beatHellmouth();
         };
         startCombatMultiple(new Hellmouth(),new Imp(),null,null,_loc2_,loseToHellmouth,_loc3_,loseToHellmouth,_loc1_);
         get_monsterArray()[1].scaleToLevel(Utils.rand(3) + 5);
      }
      
      public function hellmouthAmbush() : void
      {
         spriteSelect(SpriteDb.get_s_hellmouth());
         clearOutput();
         outputText("你体内有什么东西在不安地翻腾，警告你某种危险。你不确定危险来自什么或哪里，但提高警惕的本能已经占据了上风。你小心翼翼地观察着周围的环境，同时向一些黑色的火山岩靠近以寻找掩护。");
         outputText("[pg]其中一块岩石转了过来，露出了她苍白的灰色皮肤和巨大的深红色巩膜。很明显，你刚才从后面看到的是一个地狱之口。她睁大眼睛，张开嘴，露出喉咙里升起的火焰和小恶魔的爪子。");
         saveContent.ambushed = true;
         menu();
         addNextButton("闪避",hellmouthAmbushDodge).hint("不惜一切代价避开。");
         addNextButton("闭嘴",hellmouthAmbushShut).hint("把那张嘴合上。");
      }
      
      public function get_debugName() : String
      {
         return "地狱口";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getLickedByHellmouth() : void
      {
         var _g:Combat;
         clearOutput();
         spriteSelect(SpriteDb.get_s_hellmouth());
         outputText("尽管她的嘴看起来像地狱一般，但她的舌头看起来非常有趣。这似乎是一个取悦自己的绝佳机会。");
         outputText("[pg]你[walk]向女恶魔，抓住她的脸，轻轻地捏着她的脸颊，露出微笑。她输了这场战斗，奖励胜利者是她的工作。你告诉她要好好利用那条舌头。她只是呻吟着回应，仍然因为战斗而头晕目眩。你更用力地捏她的脸，进一步强调她要用舌头取悦你。[pg]她撅起嘴，皱着脸，软绵绵地伸出舌头。这可能很有趣，但希望在你" + (!get_player().isNakedLower() ? "脱下衣服" : "开始") + "之后，她能更精力充沛一些。你松开地狱之口，露出你的[genitals][if (silly) {，并享受着这火山地狱般美好、清新、热得要命的风。|，向恶魔展示你自己。}]地狱之口似乎正在恢复镇定，爬了过来，舌头仍然悬在外面。");
         if(get_player().hasCock())
         {
            outputText("[pg]那条粗长、恶魔般的舌头开始卷绕在你的[cock]根部[if (hasknot) {，润滑着你的肉结}]。你的肉棒抽动着，回应着那滑溜溜的触手沿着它的长度滑动。地狱之口看起来可能有点吓人，但她相当擅长服务。本能地，你开始向前倾，微微摇晃你的臀部。你把手放在恶魔的头上作为支撑，抚摸着她如丝般顺滑的黑发。虽然不完全是故意的，但你的抚摸引起了她快乐的呼噜声。她喜欢这样。");
            outputText("[pg]地狱之口的舌头包裹着你的龟头，一边转动一边挤压。她伸长舌头，尽可能多地覆盖你的[cock]，形成一个火热且润滑良好的有机飞机杯。低头看去，你看到她那燃烧着红色的巩膜衬托着黑色的瞳孔，正抬头盯着你。她对着你的目光微笑，露出她那怪物般锋利的牙齿。她似乎想展示她取悦你的意愿，但你还是忍不住感到有些担忧。");
            outputText("[pg]为了分散自己对这地狱般画面的注意力，你抓住她头部的两侧，沿着她舌头的螺旋状褶皱抽插你的臀部。在寻找更好的抓握点时，你的手碰到了她长而柔软的精灵耳朵。抓住它们作为把手，你惊讶地听到她在呻吟。你的拇指沿着她的耳垂滑动，效果非常明显，你能感觉到她在颤抖。这额外的刺激非常有帮助，当她在你的[cock]上晃动舌头时，你发出了一声愉悦的叹息。");
            outputText("[pg]终于达到了极限，你呻吟着，射在了恶魔的脸和头发上。你用她的舌头把残留物擦干净，然后重新穿上你的[armor]。");
            get_player().orgasm("Dick");
         }
         else
         {
            get_player().orgasm("Vaginal");
            outputText("[pg]" + (get_player().hasTailInsteadOfLegs() ? "你降低蛇身，尽可能舒适地把小穴靠近她的脸。" : "你张开双腿，降低臀部，让爬行的女恶魔更容易够到你的小穴。") + "当地狱之口把脸贴在你身上时，她那又长又热的舌头让你感到一阵愉悦的颤栗。她灰色的小手抓住你的臀部作为支撑，同时把舌头伸上来舔舐。她似乎非常投入，比刚才热情得多。她舔舐着你流出的每一滴水珠，用她地狱般的唾液涂满你的阴唇。你发出一声满意的叹息。");
            outputText("[pg]然而，这个堕落的矮个子才刚刚开始，当她肉嘟嘟的器官开始滑入你的[vagina]，深深地潜入时，你感到一阵战栗");
            if(get_player().vaginas[0].vaginalLooseness < 2)
            {
               outputText("伴随着最轻柔的拉伸");
               if(get_player().hasVirginVagina())
               {
                  outputText("。当她舌头最粗的部分挑战着你纯洁小处女膜的极限，慢慢撕裂它时，会感到一阵刺痛。那温暖和柔软很好地抚慰了它造成的轻微疼痛。这比你预期的要拉伸得多，但作为失去“童贞”的方式，这并不算太令人不快。[pg]");
                  get_player().cuntChange(5,true);
               }
               else
               {
                  outputText("进入了你以为只有肉棒才能到达的地方。");
               }
            }
            else
            {
               outputText("进入了你以为只有肉棒才能到达的地方。");
            }
            outputText("当那肉质的尖端弹在你的子宫颈上时，你的体内在不适和变态的兴奋中颤抖。恶魔的舌头确实是一份礼物" + (get_player().tongue.type == 2 ? "，你很清楚" : "，你心想") + "。[pg]当她从你的深处退去时，你发出了一声呻吟，每一寸都是令人兴奋的刺激。她的舌头在前后移动时扭曲和转动，比任何阴茎都能更智能地控制。出于反射，你的骨盆紧绷起来，尽可能地禁止移动。这种压力似乎让你淫荡的猎物感到兴奋，她呜咽的呻吟声清楚地表明她有多喜欢这一刻。[pg]当你接近极限时，你的臀部在晃动，你的身体无法保持静止，因为一波波的快感让你失去了理智。地狱之口进行着更长、更慢的抽插，几乎完全退出，然后再次将舌头插入，带着故意的慵懒。无论是你的肢体语言还是味道，她都能感觉到你有多接近，并摩擦你的[clit]来进一步推动你。她并不粗暴；她温柔而从容。[pg]你的高潮如潮水般涌来，冲刷着你的[skin]，让你进入一个极乐世界，不断地喷涌而出，直到你将一股洪流喷入她贪婪的嘴里。地狱之口终于完全抽出了她的舌头。她擦了擦嘴，对整个过程感到满意，心满意足地躺了回去。");
            outputText("[pg]你伸了个懒腰，放松下来，重新穿好衣服，然后准备回家。");
         }
         dynStats(DynStat.Cor(1));
         _g = get_combat();
         doNext(function():void
         {
            _g.cleanupAfterCombatNewPage();
         });
      }
      
      public function encounterHellmouth() : void
      {
         spriteSelect(SpriteDb.get_s_hellmouth());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2712) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2712,1);
            clearOutput();
            outputText("在崎岖不平的岩地中跋涉一如既往地令人望而生畏，在这样的地方几乎找不到生命的迹象也就不足为奇了。你靠在一块巨石上，擦去额头的汗水，思考着这片火山荒原的本质。尽管你陷入了沉思，但你的感官依然敏锐，你很快注意到了你停下的岩石顶部的动静。");
            outputText("[pg]你抬起头，看到了一只疯狂生物张开的血盆大口。它的舌头又长又粗，在各种锋利且令人生畏的牙齿间滑动。在它的牙齿中，最突出的是两对长长的犬齿——一对在上，另一对在下。由于害怕最坏的情况发生，你立刻冲了出去，并在跑动时转身面向袭击者。");
            outputText("[pg]你现在正面对着这个恶魔，迅速打量着她那双发光的红色大眼睛。她闭上宽阔的下巴，在这个过程中，她的头似乎也缩小了。虽然现在看起来没那么大了，但她的嘴依然明显很宽。当她对你露出极其邪恶的笑容时，这一点就更加明显了。她还没有发动攻击，所以你利用这片刻的平静，更仔细地打量了她一番。");
            outputText("[pg]她的皮肤呈灰白色，有些地方可以看到各种静脉或毛细血管。她的身体又矮又宽，尤其是臀部。对于一个恶魔来说，她的胸部似乎相当适中，肚子上有一点赘肉。在她的头上，极长的黑色秀发披散着。在很大程度上，她的头发完全向后梳，包括刘海，露出了她的额头。她那精灵般的耳朵在长度上也同样引人注目，可能和她的头一样宽，在到达尖端时向下倾斜。");
            outputText("[pg]这个令人毛骨悚然的矮个子清了清嗓子，似乎已经厌倦了等你大饱眼福。");
            outputText("[pg]你防御性地举起你的[weapon]。恶魔漆黑的瞳孔因期待而放大。");
            outputText("[pg]你正在与一个地狱巨口战斗！");
         }
         else
         {
            outputText("你在岩地中的跋涉因听到沉重的呼吸声而停止。从一块岩石后面爬出来的是另一个地狱巨口，她睁大眼睛，牙齿间喷吐着火焰。你冲出道路，险险避开了她的火焰吐息。战斗开始了！");
         }
         unlockCodexEntry(2713);
         startCombat(new Hellmouth());
      }
      
      public function ears() : void
      {
         clearOutput();
         outputText("在你的欲望如此强烈的情况下，你无法[walk]开。当你靠近时，地狱之口可怜巴巴地抬起头，当你的[hands]伸出并抓住她头部的两侧时，她退缩了一下。当你的手掌滑过她的脸颊时，她的神经似乎放松了一点，但她看起来有些困惑你的意图是什么。你把手指移到她耳朵的根部，开始温柔地抚摸它们，用拇指揉搓她的耳垂。");
         outputText("[pg]当你按摩她时，地狱之口低声呢喃，脸上泛起红晕。虽然她那恶魔般畸形的同类不像典型的地精那样健谈，但她清楚地表达了她明显的享受。在你面前挺立的[if (isnakedlower) { [cock] dangling|ion pulsating in your [armor]}]同样无言地表达了你的享受，她也注意到了。也许如果她还有足够的理智，她会考虑跪下来为你口交，或者弯下腰被你操，但你的手已经放在了目标上。");
         outputText("[pg][if (isnakedlower) {Y|Unveiling your [cock], y}]ou 把她的头拉向你的腹股沟，把她的脸从你的生殖器上移开，这让她感到困惑。你的阴茎压在她那柔软的精灵耳朵上，你开始抚摸里面的轮廓。起初，她对这种奇怪的对待发出呜咽声，但笨拙地调整了自己，直到她在那个位置感到舒服。就像你用手指时一样，她开始叹息并享受这种温柔的刺激。然而，为了让你高潮，你需要更粗暴一点的。");
         outputText("[pg]在进行了足够的探索性抚摸后，你将手滑到她的耳后，沿着你的肉棒挤压它。[if (cockthickness <= 2) {The flesh fits snugly around your member, and|Though not quite enough to wrap all the way around your hefty package,}]你对这个动作越来越满意。这可能不如阴道那样光滑湿润，但这么长而尖的耳朵的可爱之处以它自己特殊的方式让你兴奋。你动作的节奏加快，开始让她的头来回摇晃，你本以为这会让她回到呜咽的状态，但她却在呻吟。令你惊讶的是，她开始投入其中了。");
         outputText("[pg]受到鼓舞，你更用力地沿着她的耳朵抽插并收紧握力，但似乎还差一点才能完成这次体验。地狱之口的一只手紧紧地夹在她柔软的大腿之间，性感地满足着她的需求，你突然有了一个主意，知道如何增强体验。你停止了手淫，拍了拍恶魔的肩膀，让她停下来看着你。你抓住她的手臂，把她从她的蜜壶中拉出来，看到她的手上沾满了女性的淫液。毫无疑问，她有地精的血统。你抓住她的手腕，把她湿滑的手指放在你的[cock]上，她本能地抚摸着你的长度。这提供了紧握的耳朵所缺乏的大量润滑，所以你推开她的手，把你的阴茎推回她耳朵的螺旋处，它属于那里。她因为突然的湿润而退缩，但当你恢复抽插时，她也小心翼翼地继续着自己的快乐。");
         outputText("[pg]终于能够以真正的热情强暴她的耳朵，你的肉棒在这个临时的自慰工具中愉快地滑动。空气能冷却的少量液体涂层被你嬉闹产生的热量所抵消。尽管摩擦消耗了你从恶魔那里借来的润滑液，但你现在流出了大量的先列腺液，以保持一切顺畅滑动。你任由你的需求接管，把地狱之口的头推到地上，你俯身在她身上无情地操弄。出于条件反射，每次你向她的眼睛抽插时，她都会闭上眼睛，但你知道她并不讨厌这样——她的手指正以狂喜的活力在她的小穴里抽插。");
         outputText("[pg]很快，一阵高潮的波浪穿过你，释放出[if (cumnormal) {tiny }]一股精液，高潮的狂喜紧随其后，释放出另一股，然后又是一股，你在这一切中喘着粗气，感到极大的解脱。你的一些精液溅在她的脸上，但大部分流过她耳朵的曲线，进入她柔滑的黑发中。");
         outputText("[pg]地狱之口抬起头，当精液从她的耳道滴落时，她做了个鬼脸[if (silly) {, but it\'s her fault for not avoiding it. After all, she definitely heard you cumming}]。你不受她不适的影响，重新振作起来，继续你的旅程。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.5));
         get_combat().cleanupAfterCombat();
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function beatHellmouth(param1:Boolean = true) : void
      {
         var _g:Combat;
         if(param1)
         {
            clearOutput();
            spriteSelect(SpriteDb.get_s_hellmouth());
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("地狱巨口因原始的欲望而颤抖和抽搐，她倒在地上，双腿摩擦着。");
            }
            else
            {
               outputText("地狱巨口被打得遍体鳞伤，倒在地上。然而，她的喘息表明她还活着。");
            }
         }
         menu();
         addButton(0,"舔舐",getLickedByHellmouth).hint("她的舌头可真不小。").disableIf(get_player().get_gender() == 0,"这个场景需要你有生殖器。");
         addButton(1,"69式",hellmouthSixtyNine).hint("品尝她恶魔般的小穴，同时享受深喉舌交。").sexButton(2);
         addButton(2,"发交",hellmouthHairjob).hint("还是别拿那些牙齿来考验命运了。").disableIf(!get_player().hasCock() && get_player().getClitLength() < 4,"这个场景需要你有阴茎或足够大的阴蒂。").sexButton(-1);
         addNextButton("耳朵",ears).hint("柔软灵活的耳朵，还有诱人的……耳轮。你怎么能无视呢？").sexButton(1);
         addNextButton("拥抱",hellmouthCuddling).hint("抱她一会儿。");
         if(get_watersportsEnabled())
         {
            addNextButton("水上运动",hellmouthPiss).sexButton(2);
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]给你梳理尾巴。").sexButton(-1);
         }
         addButton(10,"杀死",killHellmouth).hint("解决掉这个恶魔。");
         _g = get_combat();
         setSexLeaveButton(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
   }
}

