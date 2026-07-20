package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.forest._BeeGirlScene.SaveContent;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.pregnancies.PlayerBeePregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class BeeGirlScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public static var BEE_GIRL_CONVERSATION:int = 2147418112;
      
      public static var BEE_GIRL_ATTITUDE:int = 65535;
      
      public static var BEE_GIRL_TALKED:int = 1;
      
      public static var BEE_GIRL_TALKED_AND_LEFT:int = 2;
      
      public static var BEE_GIRL_TALKED_AND_LEFT_TWICE:int = 3;
      
      public static var BEE_GIRL_PLAYER_AFRAID:int = 4;
      
      public static var BEE_GIRL_PLAYER_VOLUNTARY_EGGING:int = 5;
      
      public static var BEE_GIRL_PLAYER_DISGUSTED:int = 6;
      
      public static var BEE_GIRL_PLAYER_DUTY:int = 7;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function BeeGirlScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "beegirl";
         saveContent = new SaveContent(null);
         super();
         new PlayerBeePregnancy(param1);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function set_conversation(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1254,(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1254) & 0xFFFF) + (param1 << 16));
         return param1;
      }
      
      public function set_badEndWarning(param1:Boolean) : Boolean
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1254,(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1254) & 0x7FFFFFFF) + (param1 ? -2147483648 : 0));
         return param1;
      }
      
      public function set_attitude(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1254,(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1254) & 0x7FFF0000) + param1);
         return param1;
      }
      
      public function setTalked() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1254,1);
      }
      
      public function seduceBeeGirl() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         if(get_player().get_gender() == 3)
         {
            outputText("你气喘吁吁，情欲显露无遗，但你依然挑衅地站在蜂女面前。她疑惑地看着你，把头偏向一侧。你感觉到空气中的信息素变浓了，向她屈服的欲望在上升。你咬牙忍住，坚定自己的意志，你的意志力发挥了作用。令人惊讶的是，蜂女笑了。她的姿态变得放松，开始向你走来。你稍微改变了防御姿势，虽然有些紧张，但也放松了一些。");
            outputText("当她靠近时，你看到她对你微笑，你感受到了其中真挚的温暖。她把手放在你的脸颊上，轻轻抚摸着，然后倾身吻你。你完全放松下来，双手放在她的臀部，回应着这个吻。她结束了亲吻，依然微笑着。她的手顺着你的胸膛滑下，短暂地托起你的乳房，然后");
            if(get_player().isTaur())
            {
               outputText("俯身在你的双膝之间，去够你那鼓胀的阴茎。[pg]她跪倒在地，注视着你的[cock]，然后");
            }
            else
            {
               outputText("继续，滑到你的裤子前面，感受你鼓胀的阴茎。[pg]她跪倒在地，将你的阴茎滑出，然后");
            }
            outputText("用舌头舔舐着它的长度。她的嘴唇滑过龟头，轻轻吸吮，然后将它完全含入口中。你只能呻吟，双手紧紧抓住她的头，任由她吸吮舔舐。她的双手捏住你阴茎的根部，抚摸着它");
            if(get_player().balls > 0)
            {
               outputText("，向下滑过你的睾丸，");
            }
            outputText("直到她的手指开始把玩你阴户的嘴唇。当她将一根手指滑入其中时，你张开的嘴里发出一声呻吟，你的阴户紧紧收缩，汁液滴落在她的手上。[pg]");
            outputText("她向后退去，松开了你的" + get_player().cockDescript(0) + "，现在上面沾满了她的唾液。她仰面躺下，双腿大张，腹部平贴在地面上。她的双手催促你上前，你立刻照做。她的身体柔软而顺从，你迅速将[cock]的龟头滑入她的阴唇，你们俩同时发出一声呻吟。随着你进一步深入，蜂女用双臂环抱住你，将你紧紧贴向她，你开始抽插。每一次推进都让她变得更湿润，滑腻的感觉让你的阴茎滑动得越来越快。她弓起背，你感觉到她毒刺的尖端抵住了你的" + get_player().vaginaDescript(0) + "。还没等你抗议，它就轻轻但迅速地刺入，直到刺穿你的子宫颈。[pg]");
            outputText("当她将催情毒液直接释放到你最深处时，你大叫出声，温暖的感觉淹没了你。你亲吻她，你们的舌头交缠在一起，你加快了抽插的节奏，越来越深地推入她的体内。蜂女开始发出咕噜声和呻吟声，她的身体紧绷，脸上露出用力的表情。");
            outputText("你能感觉到一股压力从你阴茎的根部升起。你深深地抽插着，发出一声嚎叫，你高潮了，你的阴茎将黏稠的精液喷洒进她的体内，用你的体液将她的阴户填得满满当当。");
            outputText("你气喘吁吁地瘫倒在她身上，你的阴茎终于停止了抽动。蜂女再次亲吻你，从你身下滑出并站了起来。她捂着肚子，脸上挂着灿烂的笑容。你对她回以微笑，一种满足感席卷全身。你们分别时，你没有任何遗憾。");
            get_player().slimeFeed();
            get_player().orgasm("Generic");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.timesEgged = 0;
      }
      
      public function rapeTheBeeMultiCockStuff() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         if(get_player().cockTotal() >= 5 && get_player().biggestTitSize() > 2 && int(get_player().vaginas.length) > 0 && Utils.rand(2) == 0)
         {
            outputText("当你靠近时，她开始往后退，残破的翅膀徒劳地拍打着试图逃跑。你走到她面前，在她反抗之前抓住了她的手腕，随着她挣扎的加剧，你紧紧地捏住。你强迫她仰面躺下，一只手紧紧抓住她的手腕，以便脱下你的[armor]，释放出你的" + get_player().multiCockDescript() + "和" + get_player().vaginaDescript(0) + "。看到你那多个“毒刺”的奇异景象，她倒吸了一口凉气，而你则花了一点时间来决定什么东西要插进哪里。[pg]");
            outputText("你稍微向上移动了一下，你的[cocks]滑到了蜂女那湿滑的蜜壶上方。她松了一口气，但当你的两根肉棒同时压在她的前后穴上时，她又倒吸了一口凉气。[pg]");
            get_images().showImage("beegirl-win-male");
            outputText("你开始向前推进，让你的肉棒在她的阴户柔软的褶皱上滑动，并将龟头紧紧压在她颤抖的穴口上，她的呜咽声伴随着有节奏的喘息。当你用力一挺粗暴地插入她时，你的笑容变大了，蜂女的身体在你身下紧绷，嘴里发出一声尖叫。你的其他肉棒滑入她丰满的双乳之间，柔软的乳房包裹着你的肉棒。她放弃了抵抗，腹部僵在原处，因为她无法集中精力移动她的毒刺，完全被你塞满她屁股的肉棒的感觉所淹没。[pg]");
            outputText("毫无阻碍地，你开始操她。她的阴户收紧并痉挛着包裹住你的[cock]，她丰富的花蜜滴落到你最下面的肉棒上，在你每次刺入她紧致火热的屁股时增加了一点润滑。她的呜咽变成了呻吟，她的气味从恐惧变成了欲望，因为蜂女发现了同时被操两个洞的意外快感。你保持着平稳的呼吸，听着她的呻吟随着每一次抽插变得更加充满欲望，每一次你拔出准备下一次抽插时都变得更加渴求。很快，你把她所有抵抗的念头都操没了，取而代之的是每次你粗壮的肉棒更深地插入她紧致的蜜壶时，她都会发出欢快的尖叫。[pg]");
            outputText("你松开她的手臂，抓住她腹部的底部作为支撑，随着你速度的加快，让她的手臂和腿滑过你的身体。你教她如何将她的乳房挤压在你的[cock]上，她照做了，在你操她的时候来回摩擦着。随着你晃动的乳房加入其中，这变得更加令人愉悦，你的[breasts]与她的乳房摩擦着。从你巨大的乳房中漏出的乳汁流下你们的身体，进一步增加了在你们臀部之间形成的体液海洋。[pg]");
            outputText("你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "的龟头在蜂女的嘴唇和脸上来回摩擦，最后好奇心驱使她开始品尝，她那长得惊人的舌头套住并盘旋在她能触及的每一个龟头上，从一个跳到另一个，仿佛在品尝花朵，提供了一种几乎和她的阴户一样独特的体验。[pg]");
            outputText("当你挺进她体内时，你感觉到她的腹部压在你的后背上，随着她的阴户和屁股紧紧包裹着你，你腹股沟的压力不断增加。伴随着一声呻吟，你高潮了，你滚烫的精液交替着从你的每根肉棒中喷涌而出，射入她渴望的小洞里，而你紧致的阴户则分泌出你自己的花蜜。她紧紧地夹住你，当你把精液排空到她的阴户和屁股里时，她的肚子微微隆起，而她因为脸上沾满了精液再次尖叫起来。在战斗和性交中筋疲力尽后，她放松下来，瘫倒在地上，大口喘着粗气，半昏迷不醒。");
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().cockTotal() == 2 && Utils.rand(2) == 0)
         {
            outputText("蜂女转过身，在地板上飞奔试图逃跑。当你靠近你的猎物时，你可以感觉到你的[cocks]在看到她的身姿时变硬并勃起，你迅速抓住她的腹部并紧紧抱住。当你把她翻过来贪婪地看着她的身体时，她徒劳地尖叫着。[pg]");
            get_images().showImage("beegirl-win-male");
            outputText("你强迫她仰面躺下，一只手紧紧抓住她的手腕，以便脱下你的[armor]，释放出你的" + get_player().multiCockDescriptLight() + "。蜂女睁开眼睛看了片刻，意识到即将发生什么。她再次试图恳求你让她逃跑，而你的" + get_player().multiCockDescriptLight() + "在她沾满花蜜的阴唇上上下滑动。当你粗暴地一挺刺入她时，你的笑容变大了，用其中一根占有了她。蜂女尖叫着、扭动着挣扎。当你再次挺进时，你的右手撑住她拍打的手臂，将它们压在地上。为了让她知道在你的意志面前她有多么无力，你向前倾身，将她的手按在地上，舔着她的脸颊，同时你的[cocks]深深地推入她体内。看着她的眼睛，你看到了一丝微弱的反抗光芒，在你的身体下，你感觉到她微微移动，肌肉变得坚实紧绷。你意识到了这一点，并在她的毒刺接触到你之前设法躲开了。你移动膝盖，将她粗壮的");
            outputText("腹部压住，解除了威胁。你扇了她一巴掌，以惩罚她的反抗，重新确立你的统治地位，然后你再次向前挺进她体内。她微微呜咽，但随后她的脸又恢复了凶狠的面容，尽管随着你继续挺进，裂痕开始出现。尽管她想反抗，但快感正在增加，你打算完全巩固你对她的统治。[pg]");
            outputText("你决定是时候发挥你的另一项天赋了。在蜂女身上，你再次抽插了一下你的[cock]，然后你用空闲的手从她黑色的嘴唇滑过她的乳房和腹部，最后停在她的阴蒂上。你捏住她的敏感点，配合着你插入的肉棒的抽插，然后当她阴户中涌出的花蜜和淫液似乎足以应付时，你抓住你的另一根" + get_player().cockDescript(1) + "，用力将它猛地插入她的阴户，就在你第一次插入的下方。[pg]");
            outputText("这时，蜂女发出了极度幸福的尖叫，她的眼睛翻白，当你撑开她的阴唇时，她无法抗拒流遍全身的刺痛感。你松开她的手，带着满意的笑容看着她翻来覆去，紧紧抓住泥土，感受着粗暴的双插带来的痛苦与快感的丰富混合。突然，你有点措手不及，因为她向前推，几乎要把你扑倒。有一瞬间，你准备解决掉这个蜂女，但她眼中的欲望很容易读懂，她低下头，乞求被操、被填满。你抓住她的手臂作为支撑，吸吮着她丰满的乳房，一次又一次地将你的双棒强行插入她体内，而每次滑入她湿润的深处时，你的胯下都会形成一滩她的淫液和甜美的花蜜。当你把你坚硬如石的肉棒推入她湿滑的阴户时，这个蜂荡妇呻吟着，你刚好能看到你的龟头沿着她的肚子边缘移动时产生的明显凸起，但尽管你很强壮，当她的阴户肌肉紧紧夹住你的肉棒时，那种紧致感还是压倒性的。[pg]");
            outputText("蜂女松开你的手，向后仰去，张开嘴发出一声充满狂喜的尖叫，你确信这声音会吓跑任何听到这声音的野生动物或小恶魔。当她向后甩去时，你的身体紧绷，一阵白色的、温暖的精液风暴从你的龟头喷涌而出，射入她最深处的空间。无法应对流遍全身的感觉，蜂女几乎晕厥过去，靠在你的胸膛上休息。你喘了口气，最后几股精液被她仍在收缩的阴户榨取出来。你翻过身，将两根肉棒从她的肉洞中拔出，带着一丝满足感看着。堤坝决堤了，一片白色的海洋从她被撑开的、润滑良好的阴户中流出。对你最近在森林里的这次游荡感到满意，你收拾好装备出发了，留下被精液浸透的蜂女身上沾满了你的种子。");
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
            return;
         }
         beeAlternate();
      }
      
      public function rapeTheBeeGirlWithADick() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         var _loc2_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(get_player().isTaur())
         {
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("蜂女扑通一声坐在她的花朵上，双腿张开，让你清楚地看到她滴着蜜汁的蜜壶。当你靠近时，她紧张地看着你，让她的毒刺滑出，作为一种毫无意义的威胁。当你低头对她微笑时，她似乎吃了一惊，但也回以一个紧张的微笑。[pg]");
            }
            else
            {
               outputText("蜂女一屁股坐在她的花上，由于被你打败，她几乎失去了意识。她的双腿像喝醉了一样张开，让你清楚地看到她滴着蜜汁的蜜罐。当你靠近时，她透过沉重的眼皮看着你，让她的毒刺滑出，做出微弱的威胁。当你低头对她微笑时，她似乎吃了一惊，但也回以一个紧张、害怕的微笑。[pg]");
            }
            outputText("你伸出手抚摸她的头发。一开始她对你的手有些退缩，但随后意识到你真的没有恶意。当你俯身亲吻她时，她的手也顺着你的手臂滑了上来。她高兴地回吻你，她那又长又细、灵巧的舌头缠绕着你的舌头。[pg]");
            outputText("退后一步，你打量了她一会儿。她看着你脱下[armor]，看到你的[chest]时舔了舔嘴唇。一旦你的上半身自由了，你再次伸出手抱起蜂女。她出奇的轻，你轻松地举起她，当你拥抱和亲吻她时，感觉到她的双腿缠绕着你。[pg]");
            outputText("没过多久，她就开始用她的小穴轻轻地摩擦你的身体，你发现你的手顺着她的身前滑下，轻轻地滑入她粘稠的褶皱中。她在你嘴里呻吟着，身体颤抖着，一股小小的蜂蜜从她体内喷涌而出。你把手拿上来，你们俩用舌头把它舔干净。[pg]");
            outputText("这种甜美的物质让你的后半身发热。你感觉到你的[asshole]收缩，[eachcock]变大，滴着前列腺液到地上。同时，你的思绪开始变得模糊，你必须努力克制住把蜂女推倒并疯狂操她的冲动。[pg]");
            outputText("蜂蜜很快就没了，这让你很失望。你伸手去拿更多，但她的手阻止了你。[say:你不想要那个，你想要这个，]她说着，把你的手抬起来放在她的乳房上。[pg]");
            outputText("当你挤压和按摩那柔软的隆起时，蜂蜜的影响开始消退，至少在你的脑海中是这样。你的后部因欲望而隐隐作痛，你的尾巴甩来甩去，试图用你的气味诱惑不存在的母马。蜂女闻到了你强烈的麝香味，你感觉到一股新鲜的体液顺着你的前腿流下。[pg]");
            if(get_player().cockArea(_loc2_) <= get_monster().vaginalCapacity())
            {
               outputText("她从你的腋下看向你的男子气概，似乎对你的" + get_player().cockDescript(_loc2_) + "感到很高兴。在翅膀的帮助下，她的身体绕着你的躯干摆动，她顺着你的背爬向你的后部。你抬起尾巴，让蜂女检查你的[asshole]，她的手指在边缘滑动并挑逗着它。");
               if(get_player().balls > 0)
               {
                  outputText("她的另一只手滑下来，开始按摩你的[balls]，轻轻地挤压和拉扯你的阴囊。她的舌头也加入了进来，在你的屁股里滑进滑出，然后包裹住你的囊袋。你感觉棒极了，你的" + get_player().cockDescript(_loc2_) + "滴着前列腺液，在地上形成了一个水坑。");
               }
               else
               {
                  outputText("她的另一只手开始把它拉开，很快她的舌头也加入了进来，在你的屁股里精致地滑进滑出。你的" + get_player().cockDescript(_loc2_) + "因期待而颤抖，你高兴地甩着尾巴。");
               }
               outputText("[pg]");
               outputText("突然间，她的动作停止了，你回头看看到底发生了什么。她在你背上转过身，给了你一个完全无辜的眼神。无法抗拒如此可爱的眼神，你把头转回来，她的双腿顺势落在了你的侧腹上。[pg]");
               get_images().showImage("beegirl-win-male");
               outputText("你一开始以为她会像骑马一样骑你，但她没有。相反，你感觉到她的整个身体侧滑，翻转过来抓住你的肚子。你对她的力量感到惊讶，她仅用手臂和腿抓住你的身体就能相当有效地支撑住自己。不过她并不打算只依靠这个，因为她的腹部被轻轻地固定在你的后腿之间。你感觉到有什么东西锁住了你的[asshole]，但你无法做任何事情，甚至看不到那是什么。突然的变化令人惊讶，你忍不住想知道她打算做什么。[pg]");
               outputText("你得到了答案，一个湿热的虎口包裹住了你的" + get_player().cockDescript(_loc2_) + "，而你屁股里的东西稍微往里推了推。感觉很好，但你知道，即使她有惊人的力量，如果你试图挺进她体内，她也无法坚持住。考虑到这有点违背初衷，你正准备提议考虑其他安排时，她开始发出嗡嗡声。[pg]");
               outputText("一开始很轻柔，在你的耳朵里听起来和普通的蜜蜂没什么两样，但它慢慢地增强，增强，再增强；直到最后它变得如此响亮，你发现除了那奇怪的噪音，你很难去想任何事情。不过，噪音并不是唯一的东西，随着声音的增大，蜂女身体的振动也在增大。当嗡嗡声达到高潮时，你感觉整个肚子都要被震掉了。[pg]");
               outputText("这种感觉令人难以置信；她的肌肉痉挛并榨取你的" + get_player().cockDescript(_loc2_) + "，而你[asshole]里的物体（你认为可能是她的产卵管）开始向你体内泵入液体，同时你的生殖器不断地振动着。");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]感觉真的非常壮观，振动导致里面滚烫的精液翻滚。");
               }
               outputText("她火热的小穴紧紧收缩着包裹着你，她不断地高潮，将甜美的蜂蜜涂满你的后腿。[pg]");
               outputText("你发现越来越难以控制自己，因为你的马身要求你操点什么。这种不寻常的服侍非常壮观，但你的" + get_player().cockDescript(_loc2_) + "需要一匹母马。你用极大的努力克服了你的兽性欲望，沉浸在快感中，而没有感到压倒性的播种欲望。就在你庆祝这个个人胜利时，你感觉到腹股沟处熟悉的性高潮压力在积聚");
               if(get_player().balls > 0)
               {
                  outputText("，你的[balls]收缩了");
               }
               outputText(".[pg]");
               outputText("你的精液伴随着惊人的力量，从你跳动的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "中喷涌而出。");
               if(get_player().balls == 0)
               {
                  outputText("它滴入蜂女的体内，而她的花蜜也再次喷涌而出。极度的劳累让她的身体颤抖不已，她伴随着湿润的扑通声从你的肉棒上滑落，跌入她自己体液形成的泥潭中。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("它喷洒在蜂女的体内，而她的花蜜也再次喷涌而出。极度的劳累让她的身体颤抖不已，她伴随着湿润的扑通声从你的肉棒上滑落，跌入她自己体液形成的泥潭中，你的精液也滴落在她身上。");
               }
               else
               {
                  outputText("它喷洒在蜂女的体内，迅速将她填满，让她的肚子膨胀起来。突然增加的围度和极度的劳累让她失去了对你的抓握，她被从你身上推开，跌入一滩精液和花蜜的混合物中。你无法控制自己，你的[balls]继续泵出越来越多的液体，喷洒在疲惫的蜜蜂身上，并在她的花朵上涂上一层厚厚的粘液，导致它微微枯萎。最终它停了下来，只有周期性的喷涌。");
               }
               outputText("[pg]");
               outputText("当你从不可思议的高潮中平复下来后，你的注意力转移到了身下疲惫的蜂女身上。你怜悯她，尽可能温柔地抱起这只巨蜂。当你把她抱到她的花朵上，让她滑上去时，她在你怀里温柔地嗡嗡作响");
               if(get_player().cumQ() >= 500)
               {
                  outputText("看着她的下半身沉入你的精液中，就像在洗一个浓稠的白色浴");
               }
               outputText("。一旦她看起来舒服了，你便心满意足地返回营地。");
            }
            else
            {
               outputText("她从你的腋下看向你的男子气概，但似乎对你" + get_player().cockDescript(_loc2_) + "的巨大尺寸感到失望。在翅膀的帮助下，她的身体绕着你的躯干摆动，她顺着你的背爬向你的臀部。你抬起尾巴，让蜂女检查你的[asshole]，她的手指在边缘滑动并挑逗着它。她的舌头舔着你，但你能看出她心不在焉，你想知道问题出在哪里。[pg]");
               outputText("她突然咯咯地笑了起来，收回舌头，在你身上转过身来。她覆盖着甲壳的腿垂下来靠在你的侧腹上，你想知道她是否打算像骑马一样骑你。[pg]");
               outputText("但她并没有，伴随着嗡嗡声，她的身体在你身下摆动。当她侧向滑动时，一只手臂被拉开了一会儿，刚好足以将你的" + get_player().cockDescript(_loc2_) + "夹在她的身体和你自己的身体之间，然后抓住你的另一侧侧腹。她的腹部滑到你的后腿后面，你感觉到有什么东西锁住了你的[asshole]，但你无法做任何事情，甚至看不到那是什么。[pg]");
               outputText("对于这样一个看起来很脆弱的生物来说，她的抓握力出奇地强，但你认为她无法承受太多的运动。想到这在某种程度上违背了初衷，你正准备提议考虑其他安排时，她开始嗡嗡作响。[pg]");
               outputText("一开始很轻柔，在你的耳朵里听起来和普通的蜜蜂没什么两样，但它慢慢地增强，增强，再增强；直到最后它变得如此响亮，你发现除了那奇怪的噪音，你很难去想任何事情。不过，噪音并不是唯一的东西，随着声音的增大，蜂女身体的振动也在增大。当嗡嗡声达到高潮时，你感觉整个肚子都要被震掉了。[pg]");
               outputText("不过，你的" + get_player().cockDescript(_loc2_) + "感觉棒极了，泵出液体，并随着越来越多的血液而肿胀。");
               if(get_player().balls > 0)
               {
                  outputText("振动也对你的[balls]产生了影响，储存在里面的精液开始在里面摇晃跳舞。");
               }
               outputText("你[asshole]里的东西（你认为是她的产卵管）随着她一起振动，将液体泵入体内，你感觉到自己因快感而收缩。");
               if(get_player().get_tallness() * 0.8333333333333334 < get_player().cocks[get_player().longestCock()].cockLength)
               {
                  outputText("她的舌头缠绕着你的" + get_player().cockDescript(_loc2_) + "，开始套弄它能触及的一小部分。湿润的圆环感觉棒极了，你决定握住你肉棒的头部，自己玩弄它，以此来帮助她。不过很快，当熟悉的高潮感开始向你袭来时，你的肉棒颤抖了。");
               }
               else
               {
                  outputText("她的舌头缠绕着你的" + get_player().cockDescript(_loc2_) + "，在它能触及的一小块区域上下滑动，然后在你的尿道口周围弹动。她熟练的舔舐感觉棒极了，没过多久，你就感觉到熟悉的高潮感向你袭来。");
               }
               outputText("[pg]");
               outputText("在所有感觉的结合下，你的" + get_player().cockDescript(_loc2_) + "开始卸货。");
               if(get_player().balls > 0 && get_player().get_tallness() * 0.8333333333333334 < get_player().cocks[get_player().longestCock()].cockLength)
               {
                  outputText("你的[balls]收缩，将你的精液顺着你的肉棒推向新鲜的空气。它从你体内射出，击中了蜜蜂的花朵，在上面溅起一片白色。");
                  if(get_player().cumQ() >= 750)
                  {
                     outputText("但你并没有就此停下，你那如消防水龙带般的肉棒继续喷射，直到花朵因你精液的重量而下垂。");
                  }
               }
               else if(get_player().balls > 0)
               {
                  outputText("你的[balls]收缩，将你的精液顺着肉棒推向等待着的蜂女。精液从你体内射出，击中她的脸，溅起一片白浊。");
                  if(get_player().cumQ() >= 750)
                  {
                     outputText("但你并没有就此停下，你那如消防水龙带般的肉棒疯狂喷射，覆盖了她的头部和花朵，直到花朵因你精液的重量而下垂。");
                  }
               }
               else
               {
                  outputText("你的[asshole]不受控制地紧紧夹住入侵者，让那里的震动感变得更加强烈。你的肉棒随着高潮抽动，几滴精液落在了蜂女身上。");
               }
               outputText("[pg]她松开你，伴随着湿漉漉的沉闷声响落在地上。低头看去，你发现她在你" + get_player().cockDescript(_loc2_) + "上的震动摩擦足以让她高潮，而且是很多次。她躺在一滩混合着性液和蜂蜜的水洼中，在经历了对她来说肯定是极度消耗体力的运动后，失去了意识。");
               outputText("你对她心生怜悯，尽可能轻柔地抱起这只巨蜂。当你把她抱到她的花朵上，让她滑落进去时，她在你怀里轻轻地嗡嗡作响");
               if(get_player().cumQ() >= 750)
               {
                  outputText("看着她的下半身沉入你的精液中，就像在洗一个浓稠的白色浴");
               }
               outputText("。一旦她看起来舒服了，你便心满意足地返回营地。");
            }
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("你紧紧抓住她光滑甲壳和柔软皮肤交界处的大腿，强行将它们分开，露出了她那令人无法抗拒的香味的来源。她发出可怜的嗡嗡声以示抗议");
            if(get_player().isTaur())
            {
               outputText("随着你的" + get_player().cockDescript(_loc2_) + "在你的腹部下硬挺起来。");
            }
            else
            {
               outputText("当你脱下衣服，向她展示你的" + get_player().cockDescript(_loc2_) + "时。");
            }
            outputText("你毫不浪费时间，立刻开始");
            if(get_player().cockTotal() == 1)
            {
               outputText("插入她湿滑的小穴，强行推进[if (metric) {一厘米又一厘米|一英寸又一英寸}]。");
            }
            if(get_player().cockTotal() == 2)
            {
               outputText("将你的" + get_player().multiCockDescript() + "塞进她体内，用你的双根肉棒双重填满这个可怜的蜂女荡妇。");
            }
            if(get_player().cockTotal() >= 3)
            {
               outputText("将你的" + Utils.num2Text(get_player().cockTotal()) + "根" + get_player().multiCockDescript() + "中的两根塞进她体内，用双倍的肉棒双重填满这个可怜的蜂女荡妇。");
            }
            outputText("她晕了过去，向后倒下，双腿完全张开，脸上露出震惊的表情，仿佛无法理解为什么自己的身体不听使唤。[pg]");
            get_images().showImage("beegirl-win-male");
            outputText("你开始猛烈地抽插她，用你热情的操弄将蜂蜜溅满她的大腿。她的通道与你以前经历过的任何通道都不同。它很紧，但非常湿滑，上面布满小结节和凸起，以奇妙的方式挑逗和爱抚着你。她的肌肉紧紧夹住并挤压着她的阴道口，把它变成了一个有机的阴茎环。你保持不动，而她的小穴开始抽搐，并围绕着你的" + get_player().cockDescript(_loc2_) + "微微前后旋转。她的头向后仰去，你猜她是在高潮，她的手臂将乳房挤压在一起以获得更多的快感。随着她那起伏、挤压、扭动的小穴刺激着你过度充血的" + get_player().cockDescript(_loc2_) + "，你" + get_player().cockDescript(_loc2_) + "周围的真空密封变得越来越紧。[pg]");
            outputText("被逼到了极限，你失去了控制，感觉到高潮的紧绷和温暖在你的肉棒根部积聚。它不断积聚，被蜂女那如老虎钳般的小穴阻挡，其强烈的程度几乎变得痛苦。就在你以为自己无法承受更多压力时，你射了，非常猛烈。你的身体紧紧收缩，喷射出的每一波淫液都比上一波更有力。蜂蜜从蜂女荡妇的肉洞中喷出，用滑腻的甜蜜浸透了她大腿上的绒毛和你的双腿。她的小穴没有任何减缓的迹象，而你的身体也顺应了它，提供了比你想象中更多的精液。");
            if(get_player().get_gender() == 3 && !get_player().isTaur())
            {
               outputText("你伸手下去，粗暴地用手指抠弄你的" + get_player().vaginaDescript(0) + "，迷失在高潮的阵痛中。");
            }
            outputText("[pg]");
            outputText("终于，她颤抖的阴户松开了你酸痛的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。你踉跄着退开，惊叹于眼前的景象。蜂女就躺在那里，她那闪亮的黑色手指在湿透的小穴上打转，并捏着一个乳头。她闭着眼睛，在经历了这番折磨后筋疲力尽，估计一时半会儿是起不来了。[pg]");
            if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
            {
               outputText("你骄傲地微笑着，看着你的精液从她被蹂躏的小穴里源源不断地流出，在她身下汇聚成一滩。她的腹部甚至看起来被你的精液撑得鼓鼓的。");
            }
            if(get_player().cumQ() >= 500 && get_player().cumQ() < 1000)
            {
               outputText("你骄傲地微笑着看着你的杰作，注意到蜂女的腹部是多么的肿胀和膨大。它淫秽地凸起，几乎是之前大小的两倍。一条由你的精液汇聚成的小河从你的双腿间流下，但令人惊讶的是，她似乎能把你那过量的精液大部分都留在体内。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("你看着你可怜的受害者咯咯直笑。她真是一团糟。她的腹部和肚子都肿胀着，让她看起来无论是蜜蜂还是人类的那一半都像是怀孕了。一条由精液汇聚成的小河从她光滑的阴唇流下，在她身下汇聚成一滩。甚至她的产卵管也垂了下来，滴着你的精液，这是因为她体内携带的精液量太大，被硬生生从腹部挤出来的。它抽搐着，沿着它的长度隆起，最终无法将货物留在体内，将卵一颗接一颗地掉在地上。");
            }
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("当你靠近时，她开始往后退，她那破损的翅膀拍打着，试图徒劳地逃跑。你走到她面前，在她反击之前抓住她的手腕，随着她挣扎的加剧，你紧紧地捏住。你强迫她仰面躺下，用一只手紧紧抓住她的手腕，以便你脱下你的[armor]，释放出你勃起的阴茎。");
            outputText("你开始向前推进，将你的" + get_player().cockDescript(_loc2_) + "贴着她小穴柔软的褶皱滑动，她的呜咽声渐渐变成了呻吟。当你用力一挺粗暴地插入她时，你的笑容更大了，蜂女的身体在你身下紧绷，嘴里发出一声尖叫。看着她的眼睛，你看到了一丝微弱的反抗，在你的身体下面，你感觉到她微微移动，肌肉变得坚实紧绷。你意识到了这一点，并在她的毒刺接触到你之前设法躲开了。你移动膝盖，将她粗壮的腹部压住，解除了威胁。[pg]");
            get_images().showImage("beegirl-win-male");
            outputText("没有了阻碍，你开始操她。她的小穴收紧并痉挛着包裹住你的肉棒，被她的爱液和你的预精液弄得湿滑。你可以闻到空气中弥漫着花蜜、汗水和爱液混合在一起的病态气味。你的呼吸变得沉重，而她的呻吟变得更加深沉和充满情欲。她的不情愿烟消云散，她的挣扎变成了对你身体更顺从的动作，她的臀部随着每一次抽插迎合着你，迫使你的" + get_player().cockDescript(_loc2_) + "更深地进入她紧致的蜜壶。[pg]");
            outputText("你松开她的手臂，抓住她腹部的底部作为支撑点，随着你速度的加快，让她的手臂和腿环绕着你。当你冲刺时，你感觉到她的腹部压在你的臀部上，随着她的小穴紧紧包裹住你，你[balls]里的压力越来越大。伴随着一声呻吟，你射了，滚烫的精液喷涌进她的体内。她紧紧地夹住你，她的小穴榨取着你" + get_player().cockDescript(_loc2_) + "的每一滴精液，直到粘稠的白色液体从你的" + get_player().cockDescript(_loc2_) + "周围溢出。在经历了战斗和性交的疲惫后，她放松下来，瘫倒在地上，大口喘着粗气，半昏迷着。");
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function rapeABeeGirlWithYourVagina() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         if(get_player().isTaur())
         {
            outputText("蜂女扑通一声坐在她的花朵上，双腿张开，让你清楚地看到她滴着蜜汁的蜜壶。当你靠近时，她紧张地看着你，让她的毒刺滑出，作为一种毫无意义的威胁。当你低头对她微笑时，她似乎吃了一惊，但也回以一个紧张的微笑。[pg]");
            outputText("你通过从躯干上滑下[armor]并抚摸你的[chest]来表明你的意图。当你的手在胸前滑动并玩弄你的[nipples]时，你开始性感地呻吟。你自己的抚慰使你的" + get_player().vaginaDescript(0) + "发热，你感觉到少量的淫液慢慢顺着你的后腿滑落。回应着你的兴奋，你的尾巴开始自己摆动，散发出你麝香般的气味，你的[asshole]也开始一张一合。[pg]");
            outputText("蜂女起初对这意想不到的展示感到困惑，但视觉、听觉和嗅觉的结合很快就压倒了她的矜持。她把腿张得更开，让你看到更多她滴着蜜汁的小穴，同时她开始用手指抚慰自己。她自己的呻吟声越来越大，越来越快，伴随着少量粘稠液体的喷涌和强烈的甜味。它与你的麝香混合在一起，似乎被困在这个小空地里，越积越多，直到你们俩除了性什么都想不了。[pg]");
            outputText("但是当她能摸到自己时，你却不能。你后蹄周围的液体水坑继续扩大，因为你的" + get_player().vaginaDescript(0) + "变得更加渴望解脱，你[asshole]里的肌肉开始因为紧绷的力量而疼痛。你用力揉捏你的[chest]，渴望释放，但这还不够。");
            if(get_player().hasFuckableNipples())
            {
               outputText("即使反复穿透你的[nipples]似乎也不能带来你需要的解脱。");
            }
            outputText("[pg]");
            get_images().showImage("beegirl-win-female");
            outputText("尽管她能够摸到自己，但蜂女似乎也遇到了类似的问题，无法让自己高潮。随着她背部的拱起，她的手似乎因为摩擦的速度而变得模糊。她沮丧地大叫，开始猛烈地拍打翅膀，从花朵上飞了起来。[pg]");
            outputText("在性挫折的迷雾中，你向前跃起，抓住蜜蜂的臀部，将她湿透的小穴拉到你的唇边，吃着她。她的整个身体在你的怀里颤抖，但她没有试图阻止你，甚至把你的头推向她的胯部，并用双腿缠住你。你的手指找到了另一个洞并插了进去，以为那是她的肛门。不管是不是，你都得到了回报，当她大叫一声瘫软下来时，大量的蜂蜜喷涌而出，涂满了你的脸。[pg]");
            if(get_player().biggestTitSize() > 4)
            {
               outputText("她的腿松开了你的头，她向后倒去，撞到了你的" + get_player().allBreastsDescript() + "，导致它们淫荡地摇晃。你在她落地之前抓住了她，对她如此轻盈感到惊讶。");
            }
            else
            {
               outputText("她的腿松开了，她向后倒去，但你在她落地之前抓住了她，并对她如此轻盈感到惊讶。");
            }
            outputText("当她意识到自己的处境时，她的身体僵硬了，在你的帮助下，她设法站直了身体。现在你下半身的压力已经难以忍受，你喘着粗气。你的[nipples]和你的[asshole]一样疼");
            if(get_player().hasFuckableNipples() || get_player().lactationQ() >= 20)
            {
               outputText("并且不断地流出液体，顺着你的身前流下");
            }
            outputText("。蜂女显然明白你的处境，几乎在她站直的同时，就嗡嗡地飞到了你的背上。");
            outputText("她那覆盖着甲壳的附肢在你背上攀爬的奇特感觉，在你被欲望冲昏的头脑中消失了，但你的[asshole]突然被插入的感觉却绝对没有。你大叫出声，因为这微弱的接触足以让你高潮，在身下喷出滚烫的淫液。与此同时，你的舌头从嘴里伸出，你因几乎无法抑制的快感而颤抖。[pg]");
            outputText("不过她还没完，因为她的手指很快就被一条又长又湿的舌头取代了。它在你的体内扭动，而淫液继续从你的[vagina]喷出");
            if(get_player().hasLongTail())
            {
               outputText("，你那乱甩的尾巴被她的一只手牢牢按住");
            }
            outputText("。她的另一只手滑入你的[vagina]并在里面刮擦，让你体内爆发出一阵强烈的快感。你的爱道紧紧地夹住她，将她的手臂拉得更深，你那马一般的肌肉力量让她毫无抵抗之力。");
            if(get_player().ass.analLooseness >= 2)
            {
               outputText("她不想这样，试图用另一只手撑在你的" + get_player().assDescript() + "瓣之间，但你的[asshole]张开了，她滑了进去。她费了九牛二虎之力才从你的屁股里拔出来，这几乎把你推向了高潮的边缘，但卡在你阴道里的那只手臂却被死死夹住。");
            }
            outputText("没过多久，她的手就摸到了你的子宫并开始探索，将你推向了极限。[pg]");
            if(get_player().wetness() >= 5)
            {
               outputText("你的阴道剧烈地收缩蠕动着，这股力量足以让大多数普通的肉棒感到疼痛。不过她的外骨骼保护了她免受伤害，伴随着一大股喷涌而出的淫液，蜂女的手臂被你挤了出去。");
            }
            else
            {
               outputText("你的阴道剧烈地收缩着，其力度足以让大多数正常的阴茎感到疼痛。不过她的外骨骼保护了她免受伤害，在你高潮时，她将手臂从你体内抽了出来。");
            }
            outputText("在高潮后的余韵中，你感觉到有什么浓稠黏滑的东西从你背上滴落，那种感觉奇妙极了。你伸长脖子看去，发现蜂女在取悦你的同时，也一直在用她的私处摩擦着你。她自己的高潮，加上与你战斗和取悦你所消耗的精力，显然让这个看起来很脆弱的生物吃不消了，她已经趴在你身上晕了过去。[pg]");
            outputText("你小跑着来到花朵旁，将这个筋疲力尽的生物从你身上滑下来，然后帮她调整了一个更舒服的姿势。最后拍了拍她的头，收拾好你的东西，你迈着有些发软的双腿回到了营地。");
         }
         else
         {
            get_images().showImage("beegirl-win-female");
            outputText("你紧紧抓住她大腿上光滑甲壳与柔软肌肤交界的地方，强行将它们分开，露出了她那令人无法抗拒的香味的来源。当你脱下衣服，露出你的" + get_player().vaginaDescript(0));
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("和" + get_player().allBreastsDescript());
            }
            outputText("。你毫不犹豫地把她推倒，整个人趴在她的身上。你让准备好的下体蹭着她的下巴，同时把她的双腿分得更开，贪婪地嗅着她那属于女人的气味。你把你的" + get_player().vaginaDescript(0) + "贴在她的脸上，清楚地表明她该做什么，谢天谢地，这只蜂女明白了你的意思，开始舔舐。你舒服地娇喘着，对她舌头的长度和质感感到非常满意。");
            if(!get_player().isTaur())
            {
               outputText("你投桃报李，埋首于她的花丛中，亲吻舔舐着，作为对你的受害者相当熟练的技巧的奖励。[pg]");
               outputText("那味道既甜美又性感，你很快就忘了你的奖励计划，只是不停地舔舐和吸吮，尽可能多地品尝她的花蜜。");
            }
            else
            {
               outputText("[pg]");
            }
            if(get_player().vaginas[0].vaginalWetness < 3)
            {
               outputText("谢天谢地，她的舌头继续着它的攻势，卷住你的阴蒂，同时深入你的深处，让你保持湿润并在快感中扭动。");
            }
            if(get_player().vaginas[0].vaginalWetness >= 3 && get_player().vaginas[0].vaginalWetness < 5)
            {
               outputText("你的臀部在她的舌头上扭动着，她的舌头深入你湿滑的深处，紧紧卷住你的阴蒂，像撸管一样上下套弄。你的淫液浸透了她的下巴，在她取悦你时快乐地流淌着。");
            }
            if(get_player().vaginas[0].vaginalWetness >= 5)
            {
               outputText("你的臀部颤抖着，在她的脸上摩擦，她那异常长的舌头同时探索着你的深处，并挑逗着你的阴蒂，包裹着它，像撸管一样抽动着。在她熟练的攻势下，你不断地喷水和流口水，用你的淫液浸湿了她的脸和头发。");
            }
            if(get_player().getClitLength() > 3 && get_player().getClitLength() < 5)
            {
               outputText("你的臀部毫无预兆地将你巨大的阴蒂塞进她的嘴里，迫使她给你的阴蒂口交。她那光滑的黑色嘴唇立刻包裹住它，吸吮和舔舐着，让你的身体充满了欲望和快感。");
            }
            if(get_player().getClitLength() >= 5)
            {
               outputText("你的臀部毫无预兆地将你巨大的阴蒂塞进她的嘴里，撑开她光滑的嘴唇，包裹住你那非常不女性化的器官。她立刻做出反应，将它吸进嘴里和喉咙里。她的舌头卷住它，开始性感地抚摸它，同时让你在她的喉咙里进进出出。你本能地把脸埋进她甜美的阴户里，下半身完全失去控制，不顾一切地操着她的脸。");
            }
            if(get_player().isTaur())
            {
               outputText("你很快就高潮了，在这个过程中，你的淫水涂满了她的脸。作为对受害者熟练技巧的奖励，你投桃报李，一头扎进她的阴部，在上面印下亲吻和舔舐。那味道既甜美又性感，你很快就忘记了你的奖励计划，只是舔舐和吸吮，尽可能多地吸取她的花蜜，直到她也满足为止。");
            }
            else
            {
               outputText("没过多久，你们俩都高潮了，甜美的淫水涂满了你们俩的脸，你们带着欲望产生的绝望，互相玩弄着对方的小穴。");
            }
         }
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nagaRapesPt2TheExtremeContinuationOfAwesome() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(3) == 0)
         {
            outputText("现在");
            if(get_player().cockTotal() > 1)
            {
               outputText("每一个");
            }
            outputText("你的[cocks]");
            if(int(get_player().cocks.length) == 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("渴望释放，你及时撕下你的[armor]，当");
            if(get_player().totalCocks() > 1)
            {
               outputText("它们从");
            }
            else
            {
               outputText("它从");
            }
            outputText("你双腿间的缝隙中挣脱出来。不需要说一个字，信息通过某种未知的媒介传递：给我口交");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText(".[pg]");
            outputText("蜂女跪倒在地，茫然地抬头看着你。你的眼睛从未离开过她：当她用舌头缠住");
            if(get_player().totalCocks() > 1)
            {
               outputText("你的一个");
            }
            outputText("你的[cocks]，发出响亮的吸吮声，让你发狂；");
            if(get_player().balls > 0)
            {
               outputText("当她的双手捧着你的[sack]温柔地揉捏，让你充满释放的渴望时，也没有；");
            }
            else
            {
               outputText("没有");
            }
            outputText("甚至当她把你的" + get_player().cockDescript(0) + "吞到根部时，她的眼睛在眼眶里向上翻。你看着" + int(get_player().cocks[0].cockLength) + " [if (metric) {厘米|英寸}]的[cock]消失在她的嘴里，她喉咙里的震动告诉你，如果不是塞得太紧，你会听到她的咕咕声。[pg]");
            outputText("你爬得越来越高，你被催眠的侍女停止用嘴唇抚摸你，开始反复吞咽，榨取你所有的硬度。她的胸部开始收缩，从你的余光中可以看出，她正徒劳地试图吸入空气。收缩迫使她更多地榨取你；");
            if(get_player().balls > 0)
            {
               outputText("你的[sack]紧缩，因为");
            }
            outputText("你在她的胸腔里爆发了，");
            if(get_player().cumQ() < 50)
            {
               outputText("一股精液射入了她的腹部。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("一波又一波的精液射入她的腹部。");
            }
            else if(get_player().cumQ() < 2500)
            {
               outputText("一波又一波的精液泵入她的腹部，肉眼可见地将其撑起。");
            }
            else
            {
               outputText("无尽的精液涌入她的腹部，将其撑得极大。");
            }
            outputText("就在她开始翻白眼的时候，你拔了出来，伴随着她绝望的喘息声。[pg]");
            outputText("你检查了她倒在地上的失去意识的身体，寻找生命迹象。确认她还在呼吸后，你松了一口气，转身离开了。");
         }
         else if(get_player().get_gender() == 2 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            if(get_player().vaginas[0].vaginalWetness < 2)
            {
               outputText("潮湿的");
            }
            else if(get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("湿润的");
            }
            else if(get_player().vaginas[0].vaginalWetness < 5)
            {
               outputText("滴水的");
            }
            else
            {
               outputText("湿透的");
            }
            outputText("伴随着淫液，你要求得到满足。你一手指向你的" + get_player().vaginaDescript(0) + "，另一手打了个响指。你的猎物迈着悠闲的步子走到你面前，眼神空洞而遥远，顺从地开始脱下你的[armor]。当她完成时，你温柔地抚摸她的脸颊，看着一抹红晕染上她的肌肤。你被俘虏的侍女温柔地抚摸着你的身体，抚平你" + get_player().biggestBreastSizeDescript() + "的肌肤，让你喘息不已。你让自己短暂地享受这种感觉，就在你再次打响指之前，她自己跪了下去。[pg]");
            outputText("她的眼睑颤动着，即使她的目光仍然锁定着，她深深地吸入了你麝香和干燥的气味。在内心深处，你感受到了一种没有被你的面部特征所背叛的感情。当蜂女长长的舌头射入你的小穴时，你喘息着，并像它来时一样迅速缩回；一次，两次，一次又一次，撞击你的子宫颈并再次扭出。当她把舌头伸进伸出时，她的手紧紧抓住你长满鳞片的[hips]，用快感威胁着你凝视的固定。你在脑海中呻吟和尖叫，而你冷酷的表情什么也没暴露；除了那锁定的目光，让你的意志成为她自己的。蜂女的嘴巴包裹着你的[clit]，用她的上唇内侧隔着包皮摩擦它，直到它完全伸出。");
            if(get_player().getClitLength() > 1)
            {
               outputText("从它的鞘中出现，她用舌根作为下唇，开始像吸吮阴茎一样吸吮你，对你阴道内部的舌头攻击从未停止。");
            }
            outputText("[pg]");
            outputText("当她的舌头找到你的G点时，你大叫起来，几乎无法保持注意力。感觉到你的赞许，她开始探测同一个区域，直到你再次大叫，并开始敲击海绵状组织。[pg]");
            outputText("一种想尿尿的感觉压倒了你，迷失在快感中，你屈服了。");
            if(get_player().vaginas[0].vaginalWetness < 3)
            {
               outputText("几滴");
            }
            else if(get_player().vaginas[0].vaginalWetness < 4)
            {
               outputText("一股");
            }
            else if(get_player().vaginas[0].vaginalWetness < 5)
            {
               outputText("一波又一波");
            }
            else
            {
               outputText("大量的");
            }
            outputText("女性淫液顺着她的脸颊流下，她开心地咕哝着。她缩回舌头，把脸贴在你柔软的肉上，假装亲昵，但依然茫然地抬头看着你。[pg]");
            outputText("你眨了眨眼，打破了催眠的凝视，看着她恢复了生气。你亲昵地摸了摸她的头，向她道谢，留下她自己去拼凑刚才到底发生了什么鬼事。");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("当你脱下[armor]时，脑海中涌现出各种幻想，满脑子都是你可以用你那特殊的……天赋对你的精神奴隶做些什么。你舔了舔嘴唇，把手伸向蜂女的下巴，轻轻地把她漂亮的脸蛋从一边拨到另一边，用余光打量着她。即使你把她转来转去，她的眼睛也一直盯着你。你会很享受这一切的。[pg]");
            outputText("你把手放在蜂女的头顶上，看着她跪倒在地，伸长脖子继续仰视着你。你一手抓着她的一把头发，指了指她的手腕，弯曲手指做了一个“过来”的动作，然后指了指你那长满鳞片的小穴。像上发条一样，她抬起手臂，两根手指伸进你的体内，寻找并迅速找到了耻骨后上方那块海绵状组织。当她开始有节奏地动作时，你不由自主地喘息起来。你让她保持稳定的节奏，然后继续她的下一个任务。[pg]");
            outputText("你用一根食指轻轻触碰俘虏的下巴，用极轻的力道拉扯，看着她顺从地被拉向你的[cocks]，用她长长的、灵活的舌头上下舔弄");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的每一根肉棒");
            }
            else
            {
               outputText("你的肉棒");
            }
            outputText("。随着你体内脉动的节奏将你慢慢推向高潮，蜂女用另一只手将你的[cock]拉到一个角度，让它顺滑地滑进她的喉咙");
            if(get_player().cocks[0].cockLength > 12)
            {
               outputText("，它的弹性让你感到惊讶");
            }
            outputText("。");
            if(get_player().totalCocks() > 1)
            {
               outputText("一旦它完全塞进去，她就松开手，用空出的手抚摸你的另一根肉棒");
               if(get_player().cockTotal() > 2)
               {
                  outputText("，每根都套弄几下，然后再换下一根");
               }
               outputText("，把你推向越来越近的边缘。");
            }
            outputText("[pg]");
            outputText("吞咽着，啜饮着，");
            if(get_player().cockTotal() > 1)
            {
               outputText("套弄着，");
            }
            outputText("和指交同时进行，你忍不住赞叹这个脆弱的生物给你带来了如此难以言喻的快感。没过多久，这个顽强的美人就让你越过了边缘，当高潮从你的孔穴中爆发出来，浸透了她并射进她的喉咙时，你那令人着迷的凝视几乎被打破了。当她的胸膛因为缺氧而开始起伏时，你拔了出来，转身离开，把她瘫软地留在那里。[pg]");
         }
         else
         {
            outputText("被困在你的凝视中，你居高临下地看着你的俘虏，思考着接下来该怎么做。你没有生殖器，这需要你想出一些有创意的解决方案，你决定考验一下你的右脑。有一会儿，你们俩都一动不动，除了你偶尔甩动一下尾巴。就在那时，你有了个主意。[pg]");
            outputText("你把手掌平压在她的胸前，示意她躺下。她费了些力气，笨拙地趴下，扭动着自己的腹部，目光无法移开。你站在她的双腿之间，双手顺着她尾骨处突出的球状物摸下去；小心翼翼地，避开她的毒刺。你用手摸索着，在毒刺上方找到了一处褶皱，找到了你想要的东西后，你毫不犹豫地插入了一根手指。拔出来时，手指上沾满了一层光滑的黄色粘液，那味道和气味让你的感官愉悦。你再次伸出手；先是两根手指，然后是三根。一个长满凸起和肉结、顶端有孔的附属物开始显露出来，你知道你找到了目标。[pg]");
            outputText("蜂女的表情空洞茫然，但从她身上散发出的热量、新鲜的费洛蒙气味和她皮肤的红晕，你可以看出她很享受。你把手指并拢成一个尖，把拇指尽可能地塞进手掌，然后把拳头滑进她的产卵管里。[pg]");
            outputText("尽管蜂女处于催眠状态，但她的嘴巴还是张开了，呼吸也变得沉重起来。尽管遭到了侵犯，她的眼睛依然死死盯着你，毫无意识。温暖湿润的感觉首先包围了你的手指，你能感觉到那富有弹性的肉壁在你的指关节上紧绷着，然后伴随着令人满足的吧唧声让开了路。被挤出的蜂蜜顺着你的手腕渗出，然后是你的前臂，最后是你的手肘。有什么东西擦过了你的手指——是一枚卵！因为害怕伤到你娇弱的宿主，你不想再往深处推了，于是你往后退了几[if (metric) {厘米|英寸}]，把手握成拳头。[pg]");
            outputText("你把手臂抽回到手腕处，上面覆盖着一层厚厚的蜂女体液，然后小心翼翼地再次插进去，以免损坏任何卵。你觉得这是一个让她回到现实的有趣时刻，于是你打破了让你这个玩物全神贯注的凝视，开始用力地抽插。在刺激传导到她身上之前，有短暂的困惑，很快她就尖叫着挣扎起来，以至于你不得不用另一只手按住她的毒刺。你低下头靠近她的阴蒂，分叉的舌头只是一闪，就让她陷入了令人心神俱裂的高潮，把几英里外的鸟儿都吓跑了。[pg]");
            outputText("你把手抽出来，徒劳地想在附近的灌木丛上擦掉那些黏糊糊的东西。侍女瘫倒成一团，从她扩张的器官中排出卵，嘴里嘟囔着幸福而又语无伦次的胡话。你收拾好东西，滑行着离开了。");
         }
         if(get_player().get_gender() > 0)
         {
            get_player().orgasm("Generic");
         }
         doNext(get_camp().returnToCampUseOneHour);
         get_combat().cleanupAfterCombat();
      }
      
      public function milkAndHoneyAreKindaFunny() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         get_player().slimeFeed();
         outputText("你扶着蜂女坐起来；由于战斗，她有点头晕，头在打转。你亲吻她蜂蜜味的嘴唇，把舌头伸进她的嘴里，让她从恍惚中清醒过来。她对这种意想不到的感情流露感到惊讶，但了解了自己的处境后，她开始回吻你。你们的舌头互相摩擦滑动，偶尔还会探入对方的嘴里。你的手顺着她的大腿摸到了她的蜜壶。你把两根手指插进去，在里面打转。确保它们沾满了她甜蜜的爱之蜜后，你把两根手指拔出来举起。蜂女看到了你沾满蜂蜜的手指，慢慢地从亲吻中退缩。你吸掉食指上的蜂蜜，然后把中指指向她的嘴，向前推。她的嘴唇包裹住手指，把它吸进嘴里，舌头在上面舔舐，把上面的蜂蜜都清理干净。你把手指从她嘴里拿出来，检查她的工作成果。[pg]");
         outputText("[say: 你知道什么和蜂蜜最配吗？]你问。[pg]");
         outputText("蜂女思考着你的问题。[say: 是做爱吗？][pg]");
         outputText("你对她的回答轻笑出声。[say: 是的，但是牛奶和蜂蜜搭配也很棒。][pg]");
         outputText("[say: 牛奶是什么？]她问道。[pg]");
         outputText("你的笑声变得更大了。");
         outputText("[say: 你为什么不吸一下我的乳头自己找答案呢？]你一边问，一边脱下[armor]的上半部分。好奇心战胜了她，她挑了一个乳头吸了起来。她的好奇心得到了回报，一股牛奶涌入她的喉咙。她惊讶于有东西流出来，向后退缩。[pg]");
         outputText("蜂女问道，[say: 那是什么？][pg]");
         outputText("[say: 那是牛奶，好喝吗？]你逗弄道。[pg]");
         outputText("她恳求道，[say: 好喝，我还能再喝点吗？][pg]");
         outputText("[say: 当然，如果我能得到更多的蜂蜜。]你提议道。[pg]");
         outputText("蜂女点点头，回去继续吸吮乳头，而你则伸手去擦掉她花朵上的蜂蜜。当你把手指举起来清理时，手指上的蜂蜜并不多；你猜如果你想要更多的蜂蜜，你就必须刺激花朵的花蕾。你再次伸手下去，抚摸她的小阴蒂，她发出一声闷哼，震动传遍你的乳头和[breasts]。更多的蜂蜜在她的花朵上闪闪发光；你把能弄到的蜂蜜抹在手指上，然后吸掉，而蜂女则在享受她轻松的一餐。在这场交易中，她占了便宜，几乎不需要费什么力气就能吃到奶。你继续尽可能多地刮取蜂蜜，虽然随着你的继续，有更多的蜂蜜漏出来，但这不足以满足你对甜食的渴望或饥饿感。她看到她的蜜罐给的没有你的奶罐多。等她吃饱后，她递给你一个罐子并站了起来。[pg]");
         outputText("[say: 把这个罐子靠近我的小穴，用它接住蜂蜜。][pg]");
         outputText("她闪亮的黑色外阴因兴奋而变得粘稠肿胀，她迫不及待地想要高潮。她找到她的小快乐蕾，快速抚摸着已经肿胀的阴蒂。她向后仰起头，将骨盆向前推向罐子，将热蜂蜜喷入罐中。罐子很快就满了，多余的蜂蜜溢出到她的小穴和地上。她从罐子前退开，柔软的外阴上留下了罐子圆形的压痕。她递给你一个盖子，和你握手，并感谢你交换甜美的液体。[say: 也许我们下次再这样做。]");
         get_monster().setLoot(get_consumables().BEEHONY);
         dynStats(DynStat.Lib(0.2),DynStat.Lust(-50));
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveAfterDefeating(param1:Boolean) : void
      {
         var _loc2_:* = null as IMap;
         if(param1)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1256,FlagDict_Impl_.arrayReadInt(_loc2_,1256) + 1);
         }
         else
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,1255,FlagDict_Impl_.arrayReadInt(_loc2_,1255) + 1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function layEggsInABeeSpiderLike() : void
      {
         clearOutput();
         outputText("你站在被击败的蜜蜂上方，打量着你最新的猎物。当你的目光顺着她俯卧的身体滑下，扫过她身体的每一[if (metric) {厘米|英寸}]时，她恐惧地看着你。你的目光停留在她的腹部，因为你注意到女孩滴着液体的、几乎无法隐藏的产卵管。一个大大的");
         if(get_player().face.type == 5 || get_player().face.type == 10)
         {
            outputText("长着尖牙的");
         }
         outputText("笑容在你的脸上绽放，你的俘虏随之颤抖。她的目光从你的嘴唇移到你的蜘蛛下半身，再次打了个寒颤。");
         outputText("[pg]你将上半身压向她，靠得足够近，让她能感觉到你呼出的每一口气。她现在僵在原地，每一块肌肉都因恐惧而紧绷，当你用舌头舔舐她的脖子时，你细细品味着她的恐惧。你抓住这个昆虫女孩的肩膀把她提起来，在她的耳边发出一声满足的[say:嗯……]，然后把她翻转过来扔在地上，让这只蜜蜂脸朝下趴在泥土里。");
         outputText("[pg]你在她上方转过身，用你最后面的腿压住她挣扎的双手，同时你的吐丝器抽动了一下，喷出一大团粘稠的蛛丝，将她的四肢牢牢地固定在地上。转回身，你若有所思地歪着头，试图为这个颤抖的蜜蜂荡妇决定一个最好的“姿势”。你决定选择一个能让你最大程度接触到她的姿势，于是你推拉着她的臀部，直到她把屁股高高撅起；又喷射了一股蛛丝，确保她会保持这个姿势，直到你厌倦为止。当你退后一步欣赏你的杰作时，她将带条纹的腹部蜷缩在双腿之间，试图隐藏顺着大腿流下的湿滑痕迹的源头。");
         outputText("[pg]你再次走近，被困的昆虫越过肩膀投来的惊恐目光开始唤醒你内心深处的某种原始冲动。你轻轻地将她的昆虫下半身从她的臀部周围撬开，把它举过头顶，同时你靠得更近，让自己离她滴水的私处只有几厘米的距离。你又说了几句关于她看起来多么美味的尖锐评论，当你在她柔软的臀部上舔舐和轻咬时，她开始在束缚中挣扎。");
         outputText("[pg]你的目光集中在她紧致的后穴上，漫不经心地想知道蜜蜂在没有其他人可用时是如何处理她们的卵的，这迅速凝聚成一个行动计划，让你的笑容更加灿烂。你用手指试探性地戳了几下，发现那里紧得惊人；你肯定需要一些额外的润滑。多么幸运，你有一个<i>自愿</i>的来源……");
         outputText("[pg]你将尖牙刺入这个头顶触角的女孩柔软的脸颊，这让她立刻陷入了疯狂，她的翅膀疯狂地模糊起来，发出高亢的嗡嗡声。当你的毒液在她的血管中燃烧时，她全身颤抖，点燃了她的欲望，将她缓慢滴落的淫液变成了一股稳定的花蜜流。");
         outputText("[pg]你把蜜蜂散发着甜香的蜂蜜涂在一只手上，将手指一根接一根地探入她紧致的后穴，彻底润滑，当拔出手指时，那里微微张开。你重新直起身子，保持着对她甲壳质后半身的控制，同时调整你自己的姿势，将你滴水的产卵管对准她刚刚湿润的洞口。看到你不断变大的产卵管，她终于打破了沉默，但当你在第一次推进时就将将近[if (metric) {三分之一米|一英尺}]的长度强行塞入她体内时，她的恳求变成了一声压抑的呻吟。她沉重的喘息声伴随着你将产卵管在她颤抖的洞口进出抽插的拍打声，你试图尽可能多地塞进这个被束缚的蜂女体内。");
         outputText("[pg]伴随着一声响亮而湿润的拍打声，你深深地插到了她的最深处，当你产卵管在她体内深处膨胀，用浓稠的润滑液填满她的内脏时，你满足的呻吟声与她惊恐的喘息声交织在一起。");
         if(get_player().get_gender() > 0)
         {
            outputText("伴随着又一声淫靡的呻吟，你用双臂环抱住她的蜜蜂腹部，将");
            if(get_player().hasCock())
            {
               outputText("[eachCock]");
            }
            else
            {
               outputText("你的[vagina]");
            }
            outputText("紧紧贴在她身上摩擦，享受着这极乐的快感，在她那手感极佳的臀瓣上留下了一道黏糊糊的痕迹。");
         }
         outputText("当你感觉到第一枚卵从你的腹部滑出时，你因狂喜而颤抖，它在离她紧闭的后穴仅一步之遥的地方停了下来。更多的卵紧随其后，在她的后门外堆积起来，最终，你肉棒肌肉的收缩战胜了她疲惫的括约肌，卵如潮水般涌入她那等待着的温暖之中。");
         outputText("[pg]蜜蜂的呻吟声带上了明显的性高潮意味，她在你身下颤抖，四肢在束缚中变得无力，而她的肚子则因为你");
         if(get_player().fertilizedEggs() == 0)
         {
            outputText("未受精的");
         }
         else
         {
            outputText("受精的");
         }
         outputText("卵的重负而高高隆起。当最后一枚卵穿过你肿胀的肉柱时，她那鼓胀的肚子几乎要擦到地面了，你的卵的重量让她喘息不止，身体抽搐。");
         outputText("[pg]你迈着不稳的步伐将自己拔了出来，她那大张的穴口喷涌出翠绿色的润滑液，而她那甲壳质的腹部则无力地耷拉在她那装满卵的屁股上。你切断了黏糊糊的蛛网，将她释放，然后收拾好你的[armor]，步履蹒跚地走回营地。与此同时，她精疲力竭地瘫倒在一侧，双手紧紧抱住她那肿胀得惊人的腹部。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function get_debugName() : String
      {
         return "Bee Girl";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function get_conversation() : int
      {
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1254);
         return (_loc1_ & 0x7FFF0000) >> 16;
      }
      
      public function get_badEndWarning() : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1254) & -2147483648) != 0;
      }
      
      public function get_attitude() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1254) & 0xFFFF;
      }
      
      public function futaRapesBeeGirl() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         outputText("你紧紧抓住她光滑甲壳和柔软皮肤交界处的大腿，强行将它们分开，露出了她那令人无法抗拒的香味的来源。她发出可怜的嗡嗡声以示抗议");
         if(get_player().isTaur())
         {
            outputText("你漫不经心地抚摸着你的" + get_player().allBreastsDescript() + "，同时感觉到你充血的[cocks]在你的肚子下摇晃。");
         }
         else
         {
            outputText("你脱下衣服，露出你的" + get_player().allBreastsDescript() + "、" + get_player().vaginaDescript(0) + "和[cocks]。");
         }
         outputText("你走上前，跨坐在她身上，揉搓着你的外阴唇做准备。");
         if(get_player().vaginas[0].vaginalWetness <= 1)
         {
            outputText("你的" + get_player().vaginaDescript(0) + "因为兴奋而变得肿胀湿润，为你计划好的事情做好了准备。");
         }
         if(get_player().vaginas[0].vaginalWetness > 1 && get_player().vaginas[0].vaginalWetness < 4)
         {
            outputText("在你温柔的抚慰下，你的" + get_player().vaginaDescript(0) + "湿漉漉地发出吧唧声，你的外阴变得敏感而充血。");
         }
         if(get_player().vaginas[0].vaginalWetness >= 4)
         {
            outputText("你的" + get_player().vaginaDescript(0) + "喷涌而出作为回应，不断地滴在受害者的脸上，给她盖上了一层飞溅的淫水。");
         }
         outputText("[pg]毫无预兆地，你把胯部压在她的脸上，在她的嘴上旋转，而被击败的蜂女则在你身下挣扎。");
         if(get_player().balls >= 2)
         {
            if(get_player().ballSize < 5)
            {
               outputText("你的[balls]垂在她的眼睛上，既遮蔽了她的视线，又羞辱了她。");
            }
            else
            {
               outputText("你的[balls]遮住了她的大部分脸，让你很难看到她的反应，但她的嘴给了你所有需要的反馈。没过多久，她的挣扎就停止了，很快，她长长的昆虫舌头就钻进了你的" + get_player().vaginaDescript(0) + "。");
            }
         }
         outputText("对受害者的顺从感到满意，你更用力地在她的脸上摩擦。你让双手获得了一点自由，开始抚摸你已经勃起的[cock]");
         if(get_player().cumQ() < 75)
         {
            outputText("，享受着放纵和探索你男性一面的机会。");
         }
         if(get_player().cumQ() >= 75 && get_player().cumQ() < 500)
         {
            outputText("，将你坚硬的肉棒涂满大量的先兆液，并陶醉于它带给你的奇妙感觉。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("。几滴先兆液滴在她的脸上，与你小穴里的液体混合在一起。");
         }
         outputText("当她的舌头深深地探入，在一个滑溜的动作中压迫并穿透你的子宫颈时，你几乎惊恐地从她身上弹开。从里到外被舔舐让你发出惊奇和快乐参半的尖叫，作为回应，你将你的" + get_player().vaginaDescript(0) + "更用力地压向她。你的双手配合着她的舔舐自慰着你的[cocks]，速度逐渐加快，以跟上你不断增长的欲火。");
         if(get_player().cumQ() >= 100)
         {
            outputText("越来越多的先兆液开始从你的[cock]滴落，浸湿了你的");
            if(get_player().balls >= 2)
            {
               outputText("[balls]和");
            }
            outputText("那个蜂婊子的脸。");
         }
         if(int(get_player().breastRows.length) > 0)
         {
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你腾出一只手来照顾你的" + get_player().allBreastsDescript() + "和疼痛的乳头，交替着揉捏你的女性肉体和拉扯你勃起的乳头。");
            }
         }
         outputText("[pg]");
         outputText("你在狂喜中呻吟，你的" + get_player().vaginaDescript(0) + "像老虎钳一样夹住她的舌头和嘴唇。她作为回应，将舌头从你的子宫里抽出来，在你的" + get_player().vaginaDescript(0) + "里打转，刺激你颤抖的爱之通道的内壁。");
         if(int(get_player().breastRows.length) > 0)
         {
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你用力捏住一个乳头");
               if(get_player().biggestLactation() > 1 && get_player().biggestLactation() <= 2)
               {
                  outputText("，将乳汁喷射在蜂女的腹部。");
               }
               if(get_player().biggestLactation() > 2 && get_player().biggestLactation() <= 3)
               {
                  outputText("，将乳汁喷洒在你的蜂女婊子身上，用你乳白色的精华将她完全浸湿。");
               }
               if(get_player().biggestLactation() > 3)
               {
                  outputText("，将乳汁喷洒得到处都是，将蜂女完全浸湿。高潮的力量似乎在你的乳房中回荡，使它们分泌出比平时多得多的乳汁。");
               }
               if(get_player().biggestLactation() <= 1)
               {
                  outputText("。");
               }
            }
         }
         if(get_player().balls >= 2)
         {
            outputText("你的男性高潮带来的温暖和令人愉悦的压力在你的[balls]中积聚，随着它从你的腹股沟向上移动到你跳动的阴茎根部，变得越来越强烈。你紧紧地握住你的[cock]，试图再坚持一会儿，但在你体内蠕动的舌头实在太厉害了。");
         }
         if(get_player().isTaur())
         {
            outputText("就在你要爆发的时候，你邪恶地笑了，一个主意闪过你的脑海。你迅速转过身，留下她惊讶地保持着舔你小穴的姿势，她细长蠕动的舌头伸在外面，脸上沾满了你的淫液。");
         }
         if(get_player().cumQ() < 25)
         {
            outputText("你爆发了，你的[cock]跳动着，喷射出成股的精液。你用力地撸动着你的肉棒，手无情地上下抽动，试图挤出每一滴精液。你看着每一次喷发都溅在蜂女的头发上，残忍地笑着。");
            if(!get_player().isTaur())
            {
               outputText("终于发泄完了，你从她身上站起来，当她的舌头从你的女性器官中缩回时，你颤抖了一下。");
            }
         }
         if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
         {
            outputText("你爆发了，你的[cock]在你的手中跳动，喷射出浓稠的精液。你用力地撸动着你的肉棒，无情地抽动着它，因为它喷出了越来越多的精液。高潮持续了很久，你的精液用你粘稠的白色汁液浸透了你可怜的受害者的头发和额头。终于满足了，");
            if(get_player().balls >= 2)
            {
               outputText("带着空空的睾丸，");
            }
            if(!get_player().isTaur())
            {
               outputText("你从她身上爬起，当她那细长且蠕动的舌头从你的" + get_player().vaginaDescript(0) + "中缩回时，你浑身颤抖。");
            }
            else
            {
               outputText("你微笑着离开她，心满意足。");
            }
         }
         if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
         {
            outputText("你的[cock]爆发了，在你的手中因为高潮的力量而扭动，粗壮的精液绳索从你体内喷涌而出。每一次汁液的喷发似乎都持续了很久，每一次都几乎和一个正常男人的高潮一样长。低头看去，你看到蜂女的头发和脸完全被你的精液弄得黏糊糊的，她下面形成了一个水坑。");
            if(!get_player().isTaur())
            {
               outputText("你在高潮中从她身上站起来，瞄准更低的地方，用每一次喷射的精液涂抹她。");
            }
            else
            {
               outputText("你瞄准她椭圆形的脸庞，用每一次喷射的精液涂满她。");
            }
            outputText("你的[cock]随着每一次射精而强力收缩，直到你的受害者腰部以上都被浸透，她的乳房和脸上糊满了粘液。你满足地叹了口气，退后一步，看着蜂女用双手捧起你的遗留物，一只手送进嘴里，另一只手抹在她那甜美湿润的小穴上。你暗自咯咯笑着，心满意足地离开了。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("你的[cock]像火山一样爆发，射出一股持续不断的浓稠精液，随着你骨盆肌肉的每一次收缩而跳动。随着你的尿道试图处理你身体产生的巨大负荷，压力似乎只增不减。");
            if(!get_player().isTaur())
            {
               outputText("你从受害者身上站起来，让她的舌头从你湿透的阴唇中滑出，然后");
            }
            else
            {
               outputText("你");
            }
            outputText("将你的[cock]深深插入蜂女的嘴和喉咙，将精液直接泵入她的腹部。她在你身下扭动，随着你的精液淹没她的腹部，她的氧气供应被切断。她那非人的嘴唇紧紧包裹着你的根部，这种感觉只会让情况变得更糟，加剧了泵入她体内的精液的爆发。随着精液开始从她的鼻子里漏出，她的眼睛翻白，她的腹部开始看起来膨胀，因为你泵入的精液量而显得像怀孕了一样。确信她已经吃饱了，你拔了出来，惊叹于你最后的喷射让她看起来几乎像怀孕九个月一样。你注意到她已经晕过去了，但你的高潮还远未结束，所以你继续手淫，用浓稠的白色粘液把她从头到脚浇了个遍。");
            if(get_player().balls >= 2)
            {
               outputText("你的蛋蛋最终空了");
            }
            else
            {
               outputText("你身体的精液储备最终空了");
            }
            outputText("，你转过身，背对着你那湿透的、被精液胀满的战利品，以及那滩正迅速渗入地下的精液。");
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function freeHoneyEvent() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         get_player().slimeFeed();
         clearOutput();
         outputText("你仔细考虑了片刻她的提议，然后决定去品尝从她暴露的私处滴落的甜美花蜜。她向后靠在花朵里，淫荡地张开双腿，从地上的一个小包里拿出一个空的小瓶子。[pg]");
         outputText("[say: 给，拿着这个，]她说着，把水晶小瓶递给你，[say: 当我高潮的时候，你会想把多余的蜂蜜保存下来……等它冷却后，它能对……为你做一些神奇的事情。][pg]");
         outputText("你心不在焉地接过小瓶，跪在她的双腿之间，深吸着那气味。它那温暖和粘稠的甜味充满了你的大脑和腹股沟。你张开嘴唇，越来越靠近她娇嫩的花朵，因期待而紧绷。当你的舌头终于接触到她湿滑的阴户表面时，你陶醉了。这味道比你经历过的任何东西都要好——甜美、纯粹，却又完全充满情欲。你掠过她的阴蒂，得到了一阵天堂般的甜美作为回报。她那令人发狂的仙露味道渗入了你的血管——你还需要更多，你毫不留情地攻击她的蜜罐，直到最后她在高潮中尖叫，用她长满绒毛的大腿夹住你的头。[pg]");
         outputText("她高潮的力量将蜂蜜溅了你一身，远远超过了你所能舔舐的量。你隐约记得她给你的小瓶，把它稳稳地放在滴落的液体下面。你尽可能多地接住她的甜美，同时仍然把脸贴在她颤抖的阴户上。你仿佛置身天堂，但过了一会儿，她把你推开，满意地微笑着。她空出的手递给你一个小软木塞。你依依不舍地接过它，把纯净的蜂蜜盖好，留着以后用。[pg]");
         outputText("她挥挥手，伸了个懒腰，拿起她的包，嗡嗡地扇动翅膀起飞了。她越过肩膀送出一个飞吻，然后飞走了，留下你返回营地……");
         get_inventory().takeItem(get_consumables().PURHONY,get_camp().returnToCampUseOneHour);
      }
      
      public function fightTheBeeGirl() : void
      {
         clearOutput();
         outputText("你清醒了头脑，决心打败这个可怕的蜂女。");
         spriteSelect(SpriteDb.get_s_bee_girl());
         startCombat(new BeeGirl());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function corruptNagaBitchesRapeABee() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         outputText("现在蜂女无法扇动翅膀，发出那种似乎能夺走你理智的嗡嗡声，你终于看清了她的真面目：猎物。[pg]");
         outputText("她在你尾巴的缠绕中挣扎着，但她纤细的四肢根本无法与你下半身那波澜起伏的肌肉束相比。你能感觉到她的腹部在搏动，仿佛徒劳地想要蛰你，但你已将她完全制住了。[say: 求你了嗞，]她哀求道，[say: 别伤害我……我只是想为我的女王效忠嗞。][pg]");
         outputText("你用爬行动物般的目光盯着她的眼睛，吐出舌头作为回应，这既是为了增加她的焦虑，也是为了用你口腔顶部的犁鼻器品尝她的热度和恐惧。即使从这里，你也能尝到从她蜜罐里滴落并涂满你鳞片的芳香液体。虽然这很美妙，但你知道你完全掌握着控制权。[pg]");
         outputText("起初，她因为恐惧而闭上了眼睛。[say:求求你，]她继续为自己的生命求情，[say:别吃我！我还有孩子！成千上万个孩子！]你无视她的哭喊，无情地凝视着她——品味着她的绝望。随着时间的推移，她意识到自己还没有被吃掉。蜂女慢慢地睁开眼睛，一只接着一只——就在那一刻，你知道你已经抓住了她。[pg]");
         outputText("[say:什么……]她迷迷糊糊地问，[say:你在盯……着什么……]当你的目光与她交汇时，她的话语开始变弱，你催眠了她。你看着她的眼皮开始下垂，你能感觉到她在你盘绕的尾巴里肌肉变得松弛。你面无表情，却掩饰不住内心的狂喜。[pg]");
         outputText("这花了几分钟，但你享受着蜂女意识逐渐消失的每一秒。你松开缠绕在她身上的尾巴，一秒钟也没有移开视线。令你高兴的是，你的俘虏继续自愿地站着不动。");
         doNext(nagaRapesPt2TheExtremeContinuationOfAwesome);
      }
      
      public function beeTalk() : void
      {
         var _g1:BeeGirlScene;
         var _g:BeeGirlScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         if(get_attitude() < 1)
         {
            set_attitude(1);
            outputText("她停止了嗡嗡声，对你抵抗她的诱惑感到惊讶。[say: 你——你确定不想和我拥抱吗？]她结结巴巴地说，诱人地向前挺起她那充满异国情调的黑黄相间的乳房。你费了些力气才把目光移回她的脸上，问她为什么要试图诱惑你拥抱她。[pg]");
            outputText("她嗡嗡地笑了起来，[say: 那么我还能在哪里产卵呢？蜂群总是需要更多的工蜂，作为女王的侍女之一，我肚子里装满了卵……我保证如果你来找我，会让你感觉很舒服的。][pg]");
            if(get_player().cor < 33)
            {
               outputText("你确信这不会有什么好结果，但你的身体已经准备好答应了。");
            }
            if(get_player().cor >= 33 && get_player().cor <= 66)
            {
               outputText("她的提议引起了你的兴趣，她身上散发出的令人兴奋的甜香让你难以抗拒。");
            }
            if(get_player().cor > 66)
            {
               outputText("你用充满情欲的眼神看着她，确信她能兑现她的提议。单是靠近她的香气，就值得忍受几颗卵了……");
            }
            outputText("[pg]你接受她的提议吗？");
            menu();
            _g = this;
            addButton(0,"是",function():void
            {
               _g.beeEncounterClassic();
            });
            setSexLeaveButton(beeLeave,"离开",1,2,-10);
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("[say: 哎呀，看来你抓到我“没穿裤子”的时候了，]她咯咯笑着，[say: 我的卵全用光了。]她拍了拍变小了的腹部，思考了一会儿。[pg]她的眼睛亮了起来，似乎有了灵感，[say: 既然我还这么想要，你想要纯正的、未稀释的蜂蜜吗？非常美味的哦，]她说着，张开双腿，露出了散发香气的源头——她那肿胀的黑色阴户正滴落着粘稠的琥珀色液体。");
            outputText("[pg]你要收集她的蜂蜜吗？");
            menu();
            addButton(0,"是",freeHoneyEvent);
            setSexLeaveButton(get_camp().returnToCampUseOneHour,"否",1,2,10);
         }
         else
         {
            if(get_attitude() == 2)
            {
               outputText("[say: 你回来了！你肯定是来要卵和蜂蜜的，对吧？][pg]");
            }
            else
            {
               outputText("她歪着头问道：[say: 又是你？你肯定是来要更多我的蜂蜜和卵的，不是吗？]她轻轻抚摸着肿胀的腹部，你看到那滴着液体的肉结附肢开始从她的毒刺旁垂落下来。[pg]");
            }
            if(get_player().cor < 33)
            {
               outputText("你确信这绝对没好事，但你的身体却在催促你答应。");
            }
            if(get_player().cor >= 33 && get_player().cor <= 66)
            {
               outputText("她的提议引起了你的兴趣，她身上散发出的令人兴奋的甜香让你难以抗拒。");
            }
            if(get_player().cor > 66)
            {
               outputText("你用充满情欲的眼神看着她，确信她能兑现她的提议。单是靠近她的香气，就值得忍受几颗卵了……");
            }
            outputText("[pg]你接受她的提议吗？");
            menu();
            _g1 = this;
            addButton(0,"是",function():void
            {
               _g1.beeEncounterClassic();
            });
            setSexLeaveButton(beeEncounterRefusedHerEggs,"否",1,2,-20);
         }
      }
      
      public function beeSexForCocksPart2(param1:int) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("这就是侍女所需要的所有鼓励，她向前跃起，用双臂抱住你的" + get_player().cockDescript(param1) + "。她急切地开始用她那丰满的胸部在你的长度上摩擦，同时用手把玩着龟头，在上面到处游走。她喘着粗气，继续给你的" + get_player().cockDescript(param1) + "做全身按摩，给你带来难以置信的刺激。" + (get_player().cocks[param1].cockLength > 36 ? "甚至用她的下体嘴唇摩擦你那巨大阴茎的根部。" : "") + "她的身体开始感觉有点粘稠和光滑，有时会在某些地方卡住，给你带来更高层次的快感。[pg]");
         outputText("过了一会儿，蜂女从你那根巨物的侧面探出头来看着你，脸上带着假装严肃的表情。[say: 你到底在想什么嗞，到处乱跑还不带只蜜蜂就想着发泄？]她一边说一边对你摇着手指。[say: 这样不健康嗞，没有适当的释放你会憋死嗞。]她笑着绕到你肉棒的侧面，从她奇怪的蜂族阴道里舀出蜂蜜，涂抹到你那过于粗大的肉棒上。[say: 我说真的嗞，除了蜂后以外没人能承受得了这么大的东西嗞，]她一边轻声说着，一边将蜂蜜温柔地揉进你的皮肤里。[pg]");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
         {
            outputText("这是真的，你那巨大的蜜蜂阴茎的疼痛永远不会真正消失，除非你感觉到蜂蜜流过它。你需要蜜蜂提供给你的释放，才能真正摆脱你新阴茎的强烈需求。除非你能找到摆脱它的方法，否则你只能去找她的女王。这是你唯一能活下去的方法。[pg]");
            set_badEndWarning(true);
         }
         else
         {
            outputText("她涂抹在你" + get_player().cockDescript(param1) + "上的蜂蜜感觉非常舒缓，同时又带着极其强烈的性刺激。你觉得自己的男根从来没有像现在这样感受得如此清晰、如此美妙——就在她将蜂蜜揉进你身体的时候。[say: 想想看嗞，很快嗞这个就能变成一根真正的肉棒嗞，到时候你才知道什么才是真正的快感嗞，]她说着，对你抛来一个心照不宣的媚眼。[pg]");
         }
         get_images().showImage("beegirl-loss-male");
         outputText("这位昆虫阴茎狂热者对你那巨大的阴茎充分涂满了她甜美的体液感到满意，她退了回来，再次用双臂抱住你那巨大的阴茎。这一次，当她开始套弄你时，她用翅膀在你那巨大的长度上移动得更远。这样过了几分钟，你感觉到自己达到了顶峰，释放出一");
         if(get_player().cumQ() < 500)
         {
            outputText("股");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("波");
         }
         else
         {
            outputText("阵");
         }
         outputText("精液从你的" + get_player().cockDescript(param1) + "顶端喷涌而出。由于这只蜜蜂正处于她在你阴茎上上下骑乘的最高点，她被你的精液射了满脸。[pg]");
         outputText("你的第一次高潮并没有阻止侍女对你阴茎的无情套弄，她的蜂蜜确保你准备好马上再来一次。事实上，这只会鼓励她。接下来，她开始用她长长的舌头舔舐你龟头周围的体液，最后把它滑进裂缝里，品尝你流出的前列腺液。与此同时，她继续用身体在你肉棒的一侧摩擦，同时让手臂在另一侧游走。这种情况持续了几个小时，她继续套弄你，让你一次又一次地高潮。[pg]");
         outputText("最终这只蜂女耗尽了体力，气喘吁吁地松开了你高耸的肉棒。[say:你可真是个了不起的家伙，你知道吗？]她一边说着，一边伸手从她的蜜罐里拔出瓶子。她用软木塞塞住瓶口，而你感觉到你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "终于开始" + (int(get_player().cocks.length) == 1 && get_player().hasSheath() ? "缩回包皮里" : "变软") + "。");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
         {
            outputText("[say:你现在知道规矩了吧，]");
         }
         else if(get_player().get_race() == "bee-morph")
         {
            outputText("[say:你只要等这东西凝固一个小时后吃下去，你就会成为一个真正的男人！]");
         }
         else
         {
            outputText("[say:如果你吃下大量这种特制的蜂蜜，你就能成为一个真正的男人！]");
         }
         outputText("她眨了眨眼，把瓶子递给你。然后她擦掉脸上干涸的精液，拿起她的包，飞走了。就在她消失在视线中之前，她回头对你喊道：[say:我期待着很快能再次见到你！]射了这么多次，难怪你几个小时后才醒来，你已经不知不觉睡着了。[pg]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(2),DynStat.Sens(2),DynStat.Cor(-3));
         get_inventory().takeItem(get_consumables().SPHONEY,get_camp().returnToCampUseFourHours);
      }
      
      public function beeSexForCocks(param1:Boolean = true) : void
      {
         var giantCockIndex1:int;
         var _g:BeeGirlScene;
         if(param1)
         {
            clearOutput();
         }
         spriteSelect(SpriteDb.get_s_bee_girl());
         if(get_badEndWarning() == true && Utils.rand(2) == 0)
         {
            beeDroneBadEnd();
            return;
         }
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < int(get_player().cocks.length))
         {
            if(!(get_player().cocks[_loc3_].cockLength < 24 || get_player().cocks[_loc3_].cArea() < 100))
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != -1)
         {
            outputText("你冲上前去，你的" + get_player().cockDescript(_loc2_) + "已经从你的[armor]中挣脱出来，一想到她会如何对待它，它就变得坚挺起来。当你走到她面前并用双臂抱住她时，它那巨大的肉棒已经完全勃起，紧紧地夹在你们的身体之间。你深吸了一口气，闻到了昆虫少女甜美的气味，其中还夹杂着你那巨大阳具熟悉的味道。当你感觉到力量从身体中流失，思绪从脑海中飞走时，她看着你的表情咯咯地笑了起来。[pg]");
            outputText("她轻轻地把你放到你背后的花朵上，这样你就能舒服地坐着，你的[cocks]也能笔直地指向上方。你那混乱的头脑确实注意到，这只蜂女似乎在不断地瞥向你那巨大的勃起，并偷偷地抚摸它。不知为何，她似乎异常渴望，但又在克制自己。[pg]");
            outputText("她又恋恋不舍地看了你的肉体一眼，然后走到她的包里翻找起来。她掏出一个小瓶子，回头瞥了你一眼，随即将瓶子滑进了她那滴着蜜的蜜穴里。她直起身子，再次看向你，呼吸变得短促，用手指划过她黑色丰满的嘴唇。[say: 你可真是个超棒的大男孩嗞！]她惊叹道，[say: " + (get_player().cocks[0].get_cockType() == CockTypesEnum.BEE ? "继续喝你的特制蜂蜜嗞，很快你就会准备好嗞" : "有了这个特制蜂蜜嗞，你很快就会变得更棒嗞") + "。]鉴于你此刻的意识状态，你除了点头之外什么也做不了。[pg]");
            menu();
            _g = this;
            giantCockIndex1 = _loc2_;
            addButton(0,"继续",function():void
            {
               _g.beeSexForCocksPart2(giantCockIndex1);
            });
         }
         else
         {
            outputText("你扑进她的怀里，深吸了一口她那散发着甜味的蜂蜜。除了拥抱你的这具身体，其他一切都不重要了。很快，当你的[armor]从身上脱落时，你整个[skindesc]都能品尝到周围空气的味道。你的昆虫情人把你的身体转向她怀里的一侧，让你侧坐在她的腿上。[pg]");
            outputText("她用手指轻轻拂过你的[cocks]，轻柔地拨弄着龟头" + (int(get_player().cocks.length) > 1 ? "" : "") + "，直到你硬得像石头一样。她对自己看到的景象似乎有些奇怪的失望，轻轻敲着嘴唇。[say: 看起来嗞你需要一些特制蜂蜜嗞才能长得又大又壮嗞。]不过你也没法对她的话感到愤慨，毕竟她的气味和嗡嗡声已经把你的脑子搞得一团糟了。她一边心不在焉地继续抚摸着你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "，一边用空着的手伸进包里，掏出一个看起来普普通通的小瓶子，然后塞进了她的蜜穴里。[pg]");
            get_images().showImage("beegirl-loss-male");
            outputText("[say: 不过嗞，]她继续说道，[say: 在我为你酿蜜的时候，你也值得享受一下嗞。]然后她用灵巧的双手对你的[cocks]发起了更加猛烈的攻势。在她的服侍下，你不由自主地开始喘息起来。");
            if(int(get_player().cocks.length) == 1)
            {
               outputText("她一只手上下套弄着你的[cock]的茎身，另一只手则用手掌摩擦着龟头。[say: 啊，你喜欢这样嗞对吧？等着嗞，等它变得更大嗞，感觉会更爽嗞，]她在你耳边低语，开始用整只手撸动你的肉棒。感觉她几乎是想单靠套弄就把更多的长度给挤出来。与此同时，她的另一只手开始以越来越快的速度画着圈，迅速把你推向极限。[pg]");
            }
            else
            {
               outputText("先从你的[cock]开始，蜂女用一只手套弄着你的茎身，另一只手在龟头周围画着圈。不过她并不满足于只关照你的主力成员，她同样热切地想要给你的" + get_player().cockDescript(1) + "也来上同样的待遇。[say: 嗯，你这样的状态嗞，很难同时照顾好每一根嗞。等你只剩一根的时候嗞，会好得多嗞。]" + (int(get_player().cocks.length) > 2 ? "但这并没有阻止她对你的" + get_player().multiCockDescript() + "全都来上同样的服务，在你的每一根男根之间来回交替。" : "") + "她的双手开始加快刺激的频率，迅速把你推向极限。[pg]");
            }
            outputText("不一会儿，她的手上就沾满了你平时射出的精液，但这只得到了这位赐予你快乐的人的点头赞许。她轻轻地把你放到她身边，从下唇拔出瓶子，盖上软木塞，然后把它放在你的肚子上。[say:等它凝固一个小时后再吃，]她告诉你，然后拿起包飞走了。多亏了她气味的后遗症，你还没来得及反应，就昏睡了几个小时。[pg]");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(3),DynStat.Cor(-2));
            get_inventory().takeItem(get_consumables().SPHONEY,get_camp().returnToCampUseFourHours);
         }
      }
      
      public function beeRapesYou() : void
      {
         var _g:BeeGirlScene;
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1257,FlagDict_Impl_.arrayReadInt(_loc1_,1257) + 1);
         var _loc2_:Boolean = false;
         if(get_player().isTaur())
         {
            if(get_player().get_HP() < 1)
            {
               outputText("蜂女对你坏笑了一下，走了过来。她覆盖着甲壳的手滑过你的侧腹，你满怀期待地颤抖着。她重重地拍了一下你的臀部，你条件反射般地撅起屁股。她不悦地推了你一把，你撞到了一棵树上。一只沾满蜂蜜的手猛地插进了你的[asshole]，你抓住树干以求支撑。[pg]");
               outputText("她在你的屁股里试探了一会儿，然后把手臂抽了出来。她打断了你的后腿，你重重地摔在地上，你的前腿无法支撑重量，你抓着树干的手也太弱，无法提供太多帮助。[pg]");
               outputText("在你完全失去行动能力后，她走到你面前，在你的[chest]上涂抹蜂蜜。气味飘入你的鼻子，你的大脑开始变得一片空白。你的舌头试图去够那甜美的物质，但够不到。你向她呜咽，渴望尝到那能改变心智的蜂蜜。她满足了你，把一些蜂蜜泼在你的脸上，你立刻开始用舌头舔舐起来。[pg]");
               if(get_player().get_gender() == 1 && get_player().balls > 0)
               {
                  outputText("她回到你的后端，又评估了一番。她几乎是绝望地爬到你身上，用伸出的产卵管不断地刺你，导致[eachcock]变得坚硬如石。[pg]");
                  outputText("当然，她看不到这些，正忙着在你背上弄些什么。一阵响亮而令人不悦的嗡嗡声在空气中回荡，你终于挣脱了蜂蜜的控制，转过身来。[pg]");
                  outputText("当你看到又有四个蜂女从灌木丛中出现时，你的胃里一阵翻江倒海，她们的毒刺暴露在外，闪烁着透明的液体。你背上的蜜蜂用她自己的毒刺刺了你一下，你再次转过身去，拼命地舔着蜂蜜，试图应对下半身可怕的燥热。[pg]");
                  outputText("覆盖着甲壳的手臂开始抚摸和刮擦你，你尽可能紧紧地闭上眼睛，因为你脸上的蜂蜜已经让你麻木了。你充满痛苦和欲望的头脑想出了一个主意，你迅速采取行动；把粘糊糊的[chest]在树上摩擦，然后猛地低下头去啃咬它。[pg]");
                  outputText("这种感觉对你那极度肿胀的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "来说实在难以承受，你开始剧烈地颤抖。由于它被压在身下，加上蜂女们的重量让你无法借力去摩擦坚硬的地面，你根本无法触碰它。[pg]");
                  outputText("不过她们似乎明白了你的问题，与其说是为了满足你的需求，不如说是为了不被甩下去，她们开始用脚踢你的[balls]。[pg]");
                  outputText("随着痛苦的击打继续，你颤抖着，你的睾丸因积聚的精液而燃烧，你的阴茎在上面的重压下扭动着。当你感觉到你的睾丸释放了它们的负荷时，你松了一口气，但它无法逃脱：<b>你的尿道收缩得太紧了</b>！[pg]");
                  outputText("痛苦和混合的毒液完全淹没了你，你晕了过去，而你身上和周围的蜜蜂继续带着似乎是恶意的意图嗡嗡作响。[pg]");
                  if(get_player().cumQ() > 1500)
                  {
                     outputText("你在一个巨大的精液水坑中醒来，气味如此浓烈，几乎让你再次晕厥。你勉强保持清醒，踉跄地站稳蹄子，摇摇晃晃地走开，抓住树木来稳住自己。[pg]");
                     outputText("尽管发生了这一切，你发现自己感觉出奇的好；每次移动时，一种温暖的刺痛感都会传遍全身，而毒刺带来的疼痛似乎已经完全消失了。你带着微笑，有点希望下次遇到蜂女时你能获胜，这样你就能教教她如何正确地取悦你。");
                  }
                  else
                  {
                     outputText("你在精液的泥潭中醒来，那股气味飘进你的鼻腔，让你胃里一阵翻江倒海。你勉强压下恶心感，摇摇晃晃地站了起来，扶着树干跌跌撞撞地走开了。[pg]");
                     outputText("尽管发生了这一切，你发现自己感觉出奇的好；每次移动时，一种温暖的刺痛感都会传遍全身，而毒刺带来的疼痛似乎已经完全消失了。你带着微笑，有点希望下次遇到蜂女时你能获胜，这样你就能教教她如何正确地取悦你。");
                  }
                  get_player().orgasm("Dick");
                  dynStats(DynStat.Inte(-0.5));
               }
               else if(get_player().get_gender() == 1 && get_player().balls == 0)
               {
                  outputText("她回到你的后端，又评估了一番。她几乎是绝望地爬到你身上，用伸出的产卵管不断地刺你，导致[eachcock]变得坚硬如石。[pg]");
                  outputText("当然，她看不到这些，正忙着在你背上弄些什么。一阵响亮而令人不悦的嗡嗡声在空气中回荡，你终于挣脱了蜂蜜的控制，转过身来。[pg]");
                  outputText("当你看到又有四个蜂女从灌木丛中出现时，你的胃里一阵翻江倒海，她们的毒刺暴露在外，闪烁着透明的液体。你背上的蜜蜂用她自己的毒刺刺了你一下，你再次转过身去，拼命地舔着蜂蜜，试图应对下半身可怕的燥热。[pg]");
                  outputText("覆盖着甲壳的手臂开始抚摸和刮擦你，你尽可能紧紧地闭上眼睛，因为你脸上的蜂蜜已经让你麻木了。你充满痛苦和欲望的头脑想出了一个主意，你迅速采取行动；把粘糊糊的[chest]在树上摩擦，然后猛地低下头去啃咬它。[pg]");
                  outputText("这种感觉对你那极度肿胀的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "来说实在难以承受，你开始剧烈地颤抖。由于它被压在身下，加上蜂女们的重量让你无法借力去摩擦坚硬的地面，你根本无法触碰它。[pg]");
                  outputText("不过她们似乎明白了你的困境，与其说是为了满足你的需求，不如说是为了不被甩下去，她们开始用脚踢向你本该长着蛋蛋的地方。[pg]");
                  outputText("充满欲望的毒液、痛苦，以及对彻底失败和受辱的羞耻感交织在一起，让你眼前一黑，迎来了极乐的黑暗。[pg]");
                  outputText("当你醒来时，尽管发生了一切，你却发现自己感觉出奇的好；每次移动，一种温暖的刺痛感就会传遍全身，而蜂刺带来的疼痛似乎已经完全消失了。你带着微笑，有些期待下次遇到蜂女时能取得胜利，这样你就能教教她如何正确地取悦你了。");
                  dynStats(DynStat.Inte(-0.5),DynStat.Lust(100,DynStatOp.Eq));
               }
               else if(get_player().get_gender() == 2)
               {
                  outputText("她回到你的臀部，又打量了一番。她几乎是绝望地爬到你身上，用伸出的毒刺不断地戳你，导致你的" + get_player().vaginaDescript(0) + "向后喷出液体。[pg]");
                  outputText("但她并没有注意到这一点，而是忙着在你背上弄些什么。一阵响亮刺耳的嗡嗡声在空气中回荡，你终于挣脱了蜂蜜的控制，转过身来。[pg]");
                  outputText("当你看到又有四个蜂女从灌木丛中出现时，你的胃里一阵翻江倒海，她们的毒刺暴露在外，闪烁着透明的液体。你背上的蜜蜂用她自己的毒刺刺了你一下，你再次转过身去，拼命地舔着蜂蜜，试图应对下半身可怕的燥热。[pg]");
                  outputText("覆盖着甲壳的手臂开始抚摸和刮擦你，你尽可能紧紧地闭上眼睛，因为你脸上的蜂蜜已经让你麻木了。你充满痛苦和欲望的头脑想出了一个主意，你迅速采取行动；把粘糊糊的[chest]在树上摩擦，然后猛地低下头去啃咬它。[pg]");
                  outputText("这种感觉对你那极度肿胀的[clit]来说太强烈了，你开始剧烈地颤抖，无法触摸它，因为它被困在你的身下，而蜂女们的重量让你无法获得在坚硬的地面上摩擦所需的杠杆力。[pg]");
                  outputText("不过她们似乎明白了你的困境，与其说是为了帮你解决需求，不如说是为了不被甩下去，她们开始用脚踢你原本应该长着蛋蛋的地方。几下重击落在了你的[clit]上，你猛烈地高潮了，以惊人的力量向后喷射出淫液。[pg]");
                  outputText("然而，这些恶毒的蜂女继续着她们的服侍，对你身体的反应感到高兴。充满欲望的毒药、痛苦以及彻底失败和屈辱带来的羞耻感交织在一起，让你昏了过去，迎接那幸福的黑暗。[pg]");
                  if(get_player().wetness() == 5)
                  {
                     outputText("你在巨大的一滩淫液中醒来，气味浓烈得几乎让你再次晕厥。你勉强保持清醒，踉跄地站起来，摇摇晃晃地走开，抓着树干来稳住自己。[pg]");
                     outputText("尽管发生了这一切，你发现自己感觉出奇的好；每次移动时，一种温暖的刺痛感都会传遍全身，而毒刺带来的疼痛似乎已经完全消失了。你带着微笑，有点希望下次遇到蜂女时你能获胜，这样你就能教教她如何正确地取悦你。");
                  }
                  else
                  {
                     outputText("你在巨大的一滩淫液中醒来，气味飘散上来，让你的胃里一阵翻江倒海。你勉强平复下来，踉跄地站起来，摇摇晃晃地走开，抓着树干来稳住自己。[pg]");
                     outputText("尽管发生了这一切，你发现自己感觉出奇的好；每次移动时，一种温暖的刺痛感都会传遍全身，而毒刺带来的疼痛似乎已经完全消失了。你带着微笑，有点希望下次遇到蜂女时你能获胜，这样你就能教教她如何正确地取悦你。");
                  }
                  dynStats(DynStat.Inte(-0.5),DynStat.Lust(100,DynStatOp.Eq));
               }
               else if(get_player().get_gender() == 3)
               {
                  outputText("她回到你的身后，又打量了一番。她几乎是绝望地爬到你身上，用伸出的毒刺不断地刺你，导致[eachcock]变得坚硬如石，你的" + get_player().vaginaDescript(0) + "向后喷出液体。[pg]");
                  outputText("当然，她看不到你的肉棒，也没有理会你喷出的液体，而是忙着在你背上弄些什么。一阵响亮而令人不快的嗡嗡声充满了空气，你设法摆脱了蜂蜜的控制，转过身来。[pg]");
                  outputText("当你看到又有四个蜂女从灌木丛中出现时，你的胃里一阵翻江倒海，她们的毒刺暴露在外，闪烁着透明的液体。你背上的蜜蜂用她自己的毒刺刺了你一下，你再次转过身去，拼命地舔着蜂蜜，试图应对下半身可怕的燥热。[pg]");
                  outputText("覆盖着甲壳的手臂开始抚摸和刮擦你，你尽可能紧紧地闭上眼睛，因为你脸上的蜂蜜已经让你麻木了。你充满痛苦和欲望的头脑想出了一个主意，你迅速采取行动；把粘糊糊的[chest]在树上摩擦，然后猛地低下头去啃咬它。[pg]");
                  outputText("这种感觉对你那极度肿胀的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "和湿透的" + get_player().vaginaDescript(0) + "来说太强烈了，你开始剧烈地颤抖，无法触摸到它，因为一个被压在你的身下，蜂女的重量让你无法获得摩擦坚硬地面所需的杠杆力，而另一个则完全够不着。[pg]");
                  outputText("不过她们似乎明白了你的难处，开始对你的" + get_player().vaginaDescript(0));
                  if(get_player().balls > 0)
                  {
                     outputText("和[balls]");
                  }
                  outputText(".[pg]");
                  outputText("几下重击落在了你的[clit]上，你猛烈地高潮了，以惊人的力量向后喷射出淫液，把你的下半身溅满了精液。然而，这些恶毒的蜂女并没有停止她们的动作，反而对你身体的反应感到愉悦。充满欲望的毒液、疼痛，以及对彻底失败和屈辱的羞耻感交织在一起，让你失去了意识，迎来了幸福的黑暗。[pg]");
                  if(get_player().cumQ() > 1500 || get_player().wetness() >= 5)
                  {
                     outputText("你在巨大的一滩各种体液中醒来，气味浓烈得几乎让你再次晕厥。你勉强保持清醒，踉跄地站起来，摇摇晃晃地走开，抓着树干来稳住自己。[pg]");
                     outputText("尽管发生了这一切，你发现自己感觉出奇的好；每次移动时，一种温暖的刺痛感都会传遍全身，而毒刺带来的疼痛似乎已经完全消失了。你带着微笑，有点希望下次遇到蜂女时你能获胜，这样你就能教教她如何正确地取悦你。");
                  }
                  else
                  {
                     outputText("你在巨大的一滩各种体液中醒来，气味飘散上来，让你的胃里一阵翻江倒海。你勉强平复下来，踉跄地站起来，摇摇晃晃地走开，抓着树干来稳住自己。[pg]");
                     outputText("尽管发生了这一切，你发现自己感觉出奇的好；每次移动时，一种温暖的刺痛感都会传遍全身，而毒刺带来的疼痛似乎已经完全消失了。你带着微笑，有点希望下次遇到蜂女时你能获胜，这样你就能教教她如何正确地取悦你。");
                  }
                  dynStats(DynStat.Inte(-0.5),DynStat.Lust(100,DynStatOp.Eq));
               }
               else
               {
                  outputText("她回到你的后庭，又端详了一番。她几乎是拼命地爬到你身上，用伸出的尾针不断地戳刺你，让你的[asshole]不断收缩。[pg]");
                  outputText("当然，她看不到你的[asshole]，对你的爆发也毫不理会，而是忙着在你背上弄些什么。空气中充满了响亮而令人不快的嗡嗡声，你设法挣脱了蜂蜜的控制，转过身来。[pg]");
                  outputText("当你看到又有四个蜂女从灌木丛中出现时，你的胃里一阵翻江倒海，她们的毒刺暴露在外，闪烁着透明的液体。你背上的蜜蜂用她自己的毒刺刺了你一下，你再次转过身去，拼命地舔着蜂蜜，试图应对下半身可怕的燥热。[pg]");
                  outputText("覆盖着甲壳的手臂开始抚摸和刮擦你，你尽可能紧紧地闭上眼睛，因为你脸上的蜂蜜已经让你麻木了。你充满痛苦和欲望的头脑想出了一个主意，你迅速采取行动；把粘糊糊的[chest]在树上摩擦，然后猛地低下头去啃咬它。[pg]");
                  outputText("这种感觉让你无法承受，你开始剧烈地颤抖，无法缓解后庭那可怕的压力。[pg]");
                  outputText("不过她们似乎明白了你的问题，与其说是为了满足你的需求，不如说是为了不被甩下来，她们开始对你的" + get_player().assDescript() + "拳打脚踢。这阵猛烈的击打足以让你停止颤抖，但压力并没有消失。[pg]");
                  outputText("然而，这些恶毒的蜂女继续着她们的服侍，对你身体的反应感到高兴。充满欲望的毒药、痛苦以及彻底失败和屈辱带来的羞耻感交织在一起，让你昏了过去，迎接那幸福的黑暗。[pg]");
                  outputText("几个小时后你醒了过来，踉踉跄跄地站了起来，摇摇晃晃地走开，用树木来稳住自己。尽管发生了一切，你意识到你感觉出奇的好；每次你移动时，一种温暖的刺痛感都会传遍全身，毒刺带来的疼痛似乎完全消失了。你带着微笑，有点希望下次遇到蜂女时你能取得胜利，这样你就可以向她展示如何正确地取悦你。");
                  dynStats(DynStat.Inte(-0.5),DynStat.Lust(100,DynStatOp.Eq));
               }
            }
            else
            {
               outputText("蜂女对你微笑，走近时性感地扭动着臀部。她覆盖着甲壳的手滑过你的侧腹，你因期待而颤抖。她轻轻拍打你的后腿，你感觉到你的期待在增长。她满意地引导你走向一棵树，然后轻轻地将一只沾满蜂蜜的手滑入你的[asshole]，让你不得不抓住树来支撑。[pg]");
               outputText("她测试了一下你屁股的内部，然后抽出手臂，你的后腿开始颤抖，因为你的欲望没有得到满足。你感觉到她抚摸你的后躯，鼓励你躺下。你高兴地照做了，用树作为支撑。当你安全躺下后，她走到你面前，在你的[chest]上涂抹蜂蜜。气味飘到你的鼻子里，你的大脑开始变得空白。你的舌头试图够到那甜美的物质，但够不到。你向她呜咽，渴望尝到那能改变心智的蜂蜜。她满足了你，将一把浓稠的灵药举到你嘴边，你急切地舔舐着。一旦你消耗了相当多的量，她就会在你的脸上涂抹更多，当你伸出舌头舔它时，她会可爱地咯咯笑。[pg]");
               if(get_player().get_gender() == 1 && get_player().balls > 0)
               {
                  outputText("她回到你的后端，又评估了一番。她几乎是绝望地爬到你身上，用伸出的产卵管不断地刺你，导致[eachcock]变得坚硬如石。[pg]");
                  outputText("当然，她看不到这一点，而是忙着将她的产卵管插入你的[asshole]。它厚厚的润滑液让它能快速进入，很快她就把她的液体泵入你的肠道。这种感觉对你极度肿胀的[cocks]来说太强烈了，你开始剧烈地颤抖，无法触摸");
                  if(get_player().cockTotal() == 1)
                  {
                     outputText("它，因为它");
                  }
                  else
                  {
                     outputText("它们，因为它们");
                  }
                  outputText("被困在你的身下，蜂女的重量让你无法获得在坚硬的地面上摩擦所需的杠杆作用。[pg]");
                  outputText("不过她似乎明白了你的问题，想要帮助你满足需求，开始用她的“脚”按摩你的[balls]。当她这样做时，她开始哼唱，这种声音抹去了你仅存的几分理智，并导致她整个身体都在震动。[pg]");
                  outputText("这种奇特得令人惊叹的震动和出人意料的熟练按摩足以让你高潮，你猛烈地射精，溅满了你的下腹。[pg]");
                  if(get_player().cumQ() >= 1500)
                  {
                     outputText("你大量的精液很快让你躺在一大滩精液中，气味如此强烈，几乎足以盖过蜂蜜的气味，尽管蜂蜜涂满了你的脸。[pg]");
                  }
                  outputText("当你昏过去时，她继续向你体内泵入液体，[eachcock]和[balls]隐隐作痛。精液和蜂蜜混合的气味完全淹没了你。");
               }
               else if(get_player().get_gender() == 1)
               {
                  outputText("她回到你的后端，又评估了一番。她几乎是绝望地爬到你身上，用伸出的产卵管不断地刺你，导致[eachcock]变得坚硬如石。[pg]");
                  outputText("当然，她看不到这一点，而是忙着将她的产卵管插入你的[asshole]。它厚厚的润滑液让它能快速进入，很快她就把她的液体泵入你的肠道。这种感觉对你极度肿胀的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "来说太强烈了，你开始剧烈地颤抖，无法触摸它，因为它被困在你的身下，蜂女的重量让你无法获得在坚硬的地面上摩擦所需的杠杆作用。[pg]");
                  outputText("不过，她似乎明白你的困扰，为了满足你的需求，她开始用她的“脚”按摩你本该长着蛋蛋的地方。在按摩的同时，她开始哼唱，那声音抹去了你仅存的一丝理智，并使她的整个身体都震动起来，这足以让你猛烈地高潮。[pg]");
                  outputText("当你昏过去时，她还在继续向你体内注入液体，[eachcock]隐隐作痛，蜂蜜的香味将你淹没。[pg]");
               }
               else if(get_player().get_gender() == 2)
               {
                  outputText("她回到你的臀部，又打量了一番。她几乎是绝望地爬到你身上，用伸出的毒刺不断地戳你，导致你的" + get_player().vaginaDescript(0) + "向后喷出液体。[pg]");
                  outputText("她看到了喷射出的淫液，温柔地抚摸着你的屁股，但却无暇顾及，因为她正忙着将产卵管插入你的[asshole]。浓稠的润滑液让它迅速滑入，很快她就开始将体液泵入你的肠道。这种感觉对你极度肿胀的" + get_player().vaginaDescript(0) + "来说实在太过强烈，你开始剧烈颤抖，无法触摸自己来缓解那可怕的压力。你的[clit]开始痛苦地跳动，肿得比平时还要大。[pg]");
                  outputText("不过她似乎明白你的困扰，为了满足你的需求，她开始用她的“脚”抚摸你的" + get_player().vaginaDescript(0) + "。与此同时，她开始哼唱，那声音抹去了你仅存的几分理智，并让她的整个身体都随之震动。再加上她那覆盖着甲壳的附肢几次滑过你的[clit]，让你猛烈地高潮，淫液以惊人的力量向后喷射而出。[pg]");
                  if(get_player().wetness() == 5)
                  {
                     outputText("你喷出的大量淫液很快就让你躺在了一大滩爱液中，气味如此浓烈，尽管你的脸上涂满了蜂蜜，但淫液的味道几乎要将其掩盖。[pg]");
                  }
                  outputText("在你昏迷过去时，她仍在继续向你体内泵入体液，你的整个后庭都在隐隐作痛，精液和蜂蜜混合的气味将你淹没。");
               }
               else if(get_player().get_gender() == 3)
               {
                  outputText("她回到你的后庭，又端详了一番。她几乎是拼命地爬到你身上，用伸出的尾针不断地戳刺你，让[eachcock]变得坚硬如石，你的[vagina]也向后喷出淫液。[pg]");
                  outputText("当然，她看不到你的肉棒，虽然她看到了喷射出的淫液并温柔地抚摸着你的屁股，但却无暇顾及，因为她正忙着将产卵管插入你的[asshole]。浓稠的润滑液让它迅速滑入，很快她就开始将体液泵入你的肠道。[pg]");
                  outputText("这种感觉对你极度肿胀的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "和" + get_player().vaginaDescript(0) + "来说实在太过强烈，你开始剧烈颤抖，却无法触摸它们，因为一个被压在身下，蜂女的重量让你无法借力去摩擦坚硬的地面，而另一个则完全够不着。[pg]");
                  outputText("不过她似乎明白你的困扰，为了满足你的需求，她开始用她的“脚”按摩你的[vagina]，同时不时地抚摸你[cock]的背面。[pg]");
                  outputText("与此同时，她开始哼唱，那声音抹去了你仅存的几分理智，并让她的整个身体都随之震动。再加上她那覆盖着甲壳的附肢几次滑过你的[clit]，让你猛烈地高潮，淫液以惊人的力量向后喷射而出，精液也溅满了你的下半身。[pg]");
                  if(get_player().cumQ() >= 1500)
                  {
                     outputText("你喷出的大量体液很快就让你躺在了一大滩精液和爱液中，气味如此浓烈，尽管你的脸上涂满了蜂蜜，但体液的味道几乎要将其掩盖。[pg]");
                  }
                  outputText("在你昏迷过去时，她仍在继续向你体内泵入体液，你的整个后庭都在隐隐作痛，精液和蜂蜜混合的气味将你淹没。");
               }
               else
               {
                  outputText("她回到你的后庭，又端详了一番。她几乎是拼命地爬到你身上，用伸出的尾针不断地戳刺你，让你的[asshole]不断收缩。[pg]");
                  outputText("但她对此毫不在意，只是忙着将产卵管插入其中。浓稠的润滑液让它迅速滑入，很快她就开始将体液泵入你的肠道。这种感觉对你来说实在太过强烈，你开始剧烈颤抖，无法触摸自己来缓解那可怕的压力。[pg]");
                  outputText("不过她似乎明白你的困扰，为了满足你的需求，她开始用她的“脚”抚摸你原本应该是生殖器的地方。与此同时，她开始哼唱，那声音抹去了你仅存的几分理智，并让她的整个身体都随之震动。这种混合的感觉足以让你停止颤抖，但压力并没有消失，在她继续工作时，你昏了过去。[pg]");
               }
               dynStats(DynStat.Inte(-0.5),DynStat.Lust(100,DynStatOp.Eq));
               get_player().buttKnockUp(26,48,1,1);
               _temp_1.timesEgged += 1;
            }
            get_player().slimeFeed();
            if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
            }
            get_combat().cleanupAfterCombat();
         }
         else
         {
            if((get_player().hasStatusEffect(StatusEffects.ParalyzeVenom) || get_player().hasStatusEffect(StatusEffects.lustvenom)) && !_loc2_ && get_player().cockTotal() == 1)
            {
               outputText("蜂女直接站在你上方，脸上带着胜利而可爱的微笑俯视着你，她的目光扫视着你身体的每一毫米。你所能做的就是躺在那里，仰望着她曼妙的身姿和丰满乳房的轮廓，脸上带着会心的微笑。她四肢着地蹲下，刚好在你够不着的地方，开始像儿童玩具一样有节奏地摇晃她伸长的腹部。[pg]");
               outputText("突然，现实将你拉回，你感觉到毒液在体内流淌，你的心跳越来越快。你的大脑深处传来一阵阵钝痛，仿佛要爆炸一般；你试图抬起手臂抱住头，却做不到。慢慢地，一种新的感觉占据了上风，你的男子气概开始变大变长，试图撑破你的衣服。一阵微弱的嗡嗡声似乎从不知名的地方传来，越来越响，越来越近。随着头部的疼痛减轻，你突然感到口干舌燥，嘴巴像沙漠里的沙子一样干。你试图发出一声呻吟，但你所能做的只是急促地呼吸，仿佛体内正在燃烧。[pg]");
               outputText("又有几只蜂女出现，优雅地降落在你周围，显然是通过震动腹部在互相交流。她俯身压在你身上，用一只乳房擦过你的脸颊，同时解开你的衣服，释放出你完全勃起的男子气概。她用双手用力抓住它，开始挤压，仿佛要掐死它一样。你的视线开始模糊；如果她现在能抚摸你的阴茎，你就能死而无憾了，因为你已经体验过那种快感。蜂女继续掐住你的阴茎几分钟，迫使血液向上涌。[pg]");
               outputText("她慢慢站起身，直接站在你的男子气概上方。“终于，”你心想，“最后的一丝快感。”你闭上眼睛，幻想着她慢慢坐到你身上。几秒钟后，你睁开眼睛，想看看她在做什么。当你看到她将腹部向下弯曲到双腿之间时，一阵突如其来的恐慌袭来；一瞬间后，你感到阴茎根部传来一阵剧痛。你闭上眼睛，徒劳地试图尖叫，然后昏了过去。");
               get_combat().cleanupAfterCombat();
               outputText("[pg]几个小时后，你醒了过来，疼痛已经消失——如果说有什么感觉的话，那就是你感觉棒极了，每次你坐直身体时，都会有一股温暖的刺痛感传遍全身。当你低头看时，你发现自己仍然赤身裸体，身上沾满了你自己的精液。你微笑着，有些期待下次遇到蜂女时你能取得胜利，这样你就能向她展示如何正确地取悦你。");
               _loc2_ = true;
               get_player().orgasm("Dick");
               return;
            }
            if(get_player().get_gender() == 1)
            {
               clearOutput();
               if(get_player().get_lust() >= get_player().maxLust())
               {
                  outputText("被欲望冲昏了头脑，你扑进了她张开的双臂中。");
               }
               else
               {
                  outputText("伤痛让你无法抵抗，她将你抱起，紧紧拥入怀中。");
               }
               get_images().showImage("beegirl-loss-male");
               outputText("起初她只是紧紧抱着你，但随着她的动作，一根毒刺从她的腹部缓缓伸出，伴随着一个粗大的肉结状器官，两者都覆盖着散发甜香的润滑液。你的大脑在通感的作用下仿佛看到了无数的色彩和气味，当她温柔地将你推倒，让你趴在地上时，你并没有反抗。当她俯身压在你身上，她那根毒刺——谢天谢地它没有毒——逼近你的后庭时，你也没有抗议。她一言不发，将那根粗长带肉结的毒刺塞进了你的体内。她的“阴茎”缓缓滑入，润滑液让你在气味引发的快感昏迷中没有颤抖着挣脱。你的手甚至不由自主地摸向了自己肿胀的");
               if(get_player().cockTotal() == 1)
               {
                  outputText("阴茎");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("阴茎");
               }
               outputText("，而她则相当粗暴地强暴着你曾经紧致的后穴，全程还哼着小曲。[pg]");
               outputText("在几个小时的强行填满你的后穴，她的毒刺将几乎几加仑的蜂精泵入你的肠道，以及你几个小时的自慰直到射精之后，她终于拔了出来。她的毒刺还在往你的背上滴着精液，她微笑着看着你将最后一发精液射在身下的精液池中，然后精疲力竭地倒下。[pg]");
               outputText("你醒了过来，鼻子里满是蜂蜜般的香气，背上沾着一些奇怪的液体，感觉有什么东西正从你体内流出。");
               get_player().slimeFeed();
               get_player().orgasm("Anal");
               dynStats(DynStat.Inte(-0.5));
               if(Utils.rand(3) == 0)
               {
                  get_player().buttKnockUp(26,48,1,1);
                  _temp_2.timesEgged += 1;
               }
               get_player().buttChange(25,true,true,false);
               get_combat().cleanupAfterCombat();
               return;
            }
            if(get_player().get_gender() == 2)
            {
               clearOutput();
               if(get_player().get_lust100() < 100)
               {
                  outputText("你意识模糊，抬头看着蜂女靠近。");
               }
               else
               {
                  outputText("你被欲望吞噬，抬头看着蜂女靠近。");
               }
               outputText("你感到疲惫虚弱，你的身体开始背叛你，屈服于敌人的信息素。当她压在你身上时，你试图挣扎，她把你的双手按在地上，胸部压在你的脸上，挡住了[sun]光和空气，无视你的抗议。当蜂女骑在你身上时，你的[armor]被从你身上扒了下来。[pg]");
               outputText("当蜂女的毒刺刺穿你的肉体时，你的胃部传来一阵剧痛。还没等你叫出声，一股令人作呕的暖流从伤口涌出，冲刷掉疼痛，渗入你的全身。你的" + get_player().vaginaDescript(0) + "的汁液在你的");
               if(get_player().isTaur())
               {
                  outputText("后腿");
               }
               else
               {
                  outputText("双腿");
               }
               outputText("之间流淌，让你的大腿变得湿滑，而你的阴蒂在冷空气中几乎痛苦地悸动着。你开始喘息，心跳加速，蜂女顺着你的身体滑下，呻吟着，她的乳房蹭过你的乳头，以一种令人愉悦的方式摩擦着它们。她停在与你头部齐平的位置，用她那黑色的眼眸注视着你的眼睛。她对你微笑，你意识到她不再用除了她自身相对较轻的体重之外的任何东西压制你。你担忧地皱起眉头，因为你意识到逃跑是你脑海中最后才会想到的事情，随后那温暖的迷雾便滑入了你的脑海。性感的蜂女凑上前，温柔地吻了你，剥夺了你最后一丝抵抗的意志。[pg]");
               if(get_player().isTaur())
               {
                  outputText("她顺着你的胸膛继续往下滑，调皮地抓住了你的" + get_player().allBreastsDescript() + "。你感觉到她的膝盖顶着你的" + get_player().vaginaDescript(0) + "，粗暴地摩擦着，让你的身体一阵阵发抖。当她咬住你的一个乳头时，你轻声叫唤了一下，突如其来的感觉随着她按摩和捏弄另一个乳头而变成了愉悦的呻吟。她的膝盖在你的" + get_player().vaginaDescript(0) + "上滑动，弹拨着你的[clit]，让蜂女沾满了你的爱液。你感觉到她跨坐在你的腿上，她的脚灵巧地将你的大腿拉向她的阴部，然后开始在你身上摇晃。[pg]");
                  outputText("她的爱液与你的混合在一起，你感觉到自己正稳步走向高潮。注意到你沉重的呼吸和突然的活力，她退开了。");
               }
               outputText("她动作敏捷地顺着你的身体滑上来，直到她的阴部紧紧贴在你的脸上。她的双手抓住你的后脑勺，将你紧紧拉向她的私处，同时将她的蜂蜜涂抹在你的脸上。那气味甜得不可思议，你本能地开始取悦她。你将舌头滑入她的褶皱中，在吸吮时吞下填满你口腔的浓稠液体。");
               get_images().showImage("beegirl-loss-female");
               if(get_player().isTaur())
               {
                  outputText("过了一会儿，她那火热香甜的阴部迅速从你的视线中消失，你感觉到蜂女的重量压在你的屁股上，就在她的毒刺，");
               }
               else
               {
                  outputText("你感觉到蜂女的毒刺");
               }
               outputText("滑过你的阴唇，推挤着它们并分开了外侧的褶皱。她的腹部移动着，带动毒刺上下抽插，保持你的" + get_player().vaginaDescript(0) + "张开，同时摩擦着你的阴蒂。[pg]");
               if(get_player().isTaur())
               {
                  outputText("突然，你感到阴蒂传来一阵刺痛，紧接着是一股强烈的性快感，这股快感吞噬了你，把你变成了一个渴望性爱的荡妇。她预料到了这种效果，重新调整姿势，把她那沾满蜂蜜的小穴对准你的脸。你开始疯狂地舔舐、吸吮和亲吻它，把舌头埋进她最深处的缝隙里。起初她还在咯咯笑，但很快你从她那里听到的只有越来越强烈的呻吟声。随着她的性欲飙升，你感觉到她的双腿在抽搐，她突然抓住你的头，把你的脸按进她的胯下。你继续贪婪地舔食着她，完全忘记了呼吸等次要的事情。[pg]");
               }
               else
               {
                  outputText("你的呻吟声被贴在脸上的蜜穴闷住了，你听到她开始大声尖叫。她的大腿紧紧夹住你的耳朵，随着她的毒刺加快速度，她更用力地在你的脸上摩擦。");
               }
               outputText("呼吸变得越来越困难，随着蜂女达到高潮，浓稠的蜂蜜流几乎要让你窒息。你感觉到你的身体终于屈服于快感和缺氧，猛烈地高潮了，随着你失去意识，世界陷入了舒适的黑暗之中。");
               get_player().slimeFeed();
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Inte(-0.5));
               get_combat().cleanupAfterCombat();
               return;
            }
            if(get_player().get_gender() == 3 || get_player().get_gender() == 0)
            {
               clearOutput();
               outputText("被击败后，你几乎无法阻止蜂女的靠近，她发出专注的嗡嗡声。她在你耳边轻声哼唱，她的信息素弥漫在空气中，迅速摧毁了你的心理防线。[pg]");
               _g = this;
               doNext(function():void
               {
                  _g.beeEncounterClassicSex();
               });
            }
         }
      }
      
      public function beeMaidenPlay() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你对她点点头，走到花前。她往旁边挪了挪，拍了拍她旁边的位置。你先脱下你的[armor]，然后把你的" + get_player().assDescript() + "坐在她旁边。");
         if(get_player().cor <= 33)
         {
            outputText("你有些紧张地坐在那里，想知道她打算做什么。");
         }
         else if(get_player().cor <= 66)
         {
            outputText("你忍不住对接下来要发生的事情感到期待。");
         }
         else
         {
            outputText("你兴奋得几乎要扑向她，但你还是设法待在原地，让她先采取行动。");
         }
         if(get_player().hasVagina())
         {
            outputText("[say: 跟着我做。]她用轻柔的嗡嗡声笑着说道，然后把一只手伸进她的蜜罐里，在上面涂满了她私处的甜美汁液。你照做，把手指伸向你的" + get_player().vaginaDescript(0) + "，并且");
            if(get_player().wetness() <= 1)
            {
               outputText("勉强");
            }
            else if(get_player().wetness() <= 3)
            {
               outputText("轻松地");
            }
            else
            {
               outputText("大量地");
            }
            outputText("沾满你自己的体液。[pg]");
            get_images().showImage("beegirl-loss-female");
            outputText("她举起湿透的手，调皮地舔了一下，然后把它移到你的[vagina]上，同时你也对她做同样的事。当她沾满蜂蜜的下半部分手指迅速滑入你的" + get_player().vaginaDescript(0) + "并开始蠕动时，你喘息起来。你试图集中精力配合她的刺激。虽然你能听到她因为你的服侍而发出享受的喘息声，但你几乎无法保持头脑清醒，更不用说配合她熟练的动作了。当她把拇指和食指放在你的[clit]上时，要让你的大脑不变成一团浆糊变得尤为困难。[pg]");
            if(get_player().get_sens100() < 40)
            {
               outputText("尽管如此，你还是设法忍住了这种感觉，继续用手指穿过她涂满蜂蜜的下唇，而她的手指则在你的下唇中耕耘。这实际上是一次非常有趣的增进感情的体验，当你们俩最后一起在对方的手指上高潮时，你感到和这只蜜蜂有一种奇妙的亲近感。");
            }
            else
            {
               outputText("这太刺激了，你再也受不了了。她那令人难以置信的服侍感（蜂蜜本身可能也起到了推波助澜的作用）让你的大脑一片空白，你把手从蜂女的蜜罐里抽了出来。你甚至没有注意到她短暂的失望，因为你太沉醉于自己的快感中了。你所能做的就是用沾满蜂蜜的手抚摸你的全身，试图获得尽可能多的刺激。" + (get_player().hasBreasts() ? "特别关照你的" + get_player().allBreastsDescript() : "") + "。最后，你都不确定是这个昆虫女孩还是你自己让你达到了令人心神荡漾的高潮。");
            }
            dynStats(DynStat.Sens(0.5));
         }
         else
         {
            outputText("你的伴侣似乎困惑了一会儿，然后笑了起来，把一根手指放在嘴唇上。过了一会儿，她开始用手指在下唇上滑动，同时咯咯地笑。[say: 某只笨蜜蜂没有可以玩耍的部位！看来我们得即兴发挥了。][pg]");
            outputText("思考了片刻后，你主动提出由你来主导。你那嗡嗡作响的朋友对此感到有些惊讶，但还是同意了。你告诉她跟着你的动作，把手指放进嘴里弄湿。蜜蜂只是开始在嘴里而不是嘴唇周围搅动手指。你抬起一条腿，把它搭在伴侣的腿上，把干爽的手臂搂在她的肩膀上，同时手慢慢地顺着她的背往下走。当你的手指抚摸她时，她又咯咯地笑了起来，同时她也把湿润的手顺着你的背往下摸。很快，你的手就到了她的腹部，并在上面爬行，向着你的目标前进。[pg]");
            outputText("仅仅是让她那覆盖着甲壳的手指在你的[ass]周围游走，就感觉棒极了，光是停留在这一步就值得回味片刻。不过，你觉得还是进入正戏比较好，于是把手指移到了她后庭的边缘。你轻轻戳弄了一会儿入口，帮她为你的侵入做好准备。但你的昆虫情人可没给你准备的时间，直接把她湿润的手指尽可能深地插进了你的[asshole]。[pg]");
            outputText("突如其来的刺激相当强烈，让你也把手指猛地插进了她的体内，引得你的伴侣发出一声介于嗡嗡声和呻吟声之间的欢愉叫声，同时你感觉到一股蜂蜜喷洒在你赤裸的胯部。幸运的是，在这场欢爱中你不会感到失望。她的高潮给她的全身带来了一阵奇特的嗡嗡声，而她那根在你深处震动的手指，也将你彻底推向了极乐的巅峰。");
         }
         get_player().orgasm("Anal");
         doNext(beeMaidenConversation);
      }
      
      public function beeMaidenFertileBeeBadEndPart5() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("作为蜂巢中负责生育的一员，日子一天天过去，这位曾经的勇者的生活里除了卵，就是和雄蜂以及其他生育阶层的成员玩耍。就像她的姐姐一样，这只年轻的蜜蜂总有一天会诱惑另一位勇者投入她们的怀抱，并用她们蜂巢的卵填满他们。他们甚至无法理解，如果不是因为她那如海妖般的歌声，他们最新的孵化器是不会愿意的。他们也不会去理会几个月前派他们去完成的关键任务。她过去的自我现在已经荡然无存了。[pg]");
         get_game().gameOver();
      }
      
      public function beeMaidenFertileBeeBadEndPart4() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("[say: 欢迎，]一个压倒性的声音在你的脑海中响起。[say: 我一直在等你到来，孩子。]女王微笑着低头看着你。[say: 我看你很困惑。我女儿给你的那种糖果是用我的蜂蜜做的。它能让我们的思想连接在一起，让你成为我们蜂巢的真正一员。]单单是她的存在就让人感觉如此强大，仿佛瞬间就能将你吹飞。[pg]");
         outputText("在你的一小部分意识恐慌了片刻之后，她的意志确实席卷了你，几乎在瞬间就抹去了你曾经的一切。她的意志紧紧地拥抱着你，就像一位久别重逢的父母看到自己的孩子一样。[say: 欢迎你，我的新女儿。]她的声音既令人安慰又充满威严。[say: 作为我蜂巢的一员，我向你保证，就像我向所有女儿保证的那样：一个安全的生活，一个充满令人满意的工作的生活。][pg]");
         outputText("你的注意力被那个正被女王腹部末端的阴茎状毒刺操着的蜂女吸引了片刻。就在毒刺从她体内抽出时，她发出了高潮的尖叫。她深吸了几口气平复自己，然后站起来，转向一侧，你这才看清她的腹部已经肿胀到了你刚注意到她时的两倍大。你感觉到一只手搭在你的肩膀上，转头一看，是带你来这里的侍女。[say: 去吧，该轮到你被填满了。][pg]");
         outputText("你点点头，走向那个巨大的工具，想象着被它填满会是什么感觉。你没有太多时间去思考，因为女王立刻亲自将那东西塞进了你的蜜罐里。突如其来的入侵者填满了你的身体，你既惊讶又愉悦地尖叫起来。你的双腿很快就软了，你倒了下去，幸好你的女朋友在你倒地之前接住了你。不过你没怎么注意，你正忙着感受双腿之间强烈的抽插带来的快感，眼前一片空白。[pg]");
         outputText("女王的产卵管很快开始将大量的蜂卵卸入你的子宫深处，将你填满。你立刻高潮了，这就是你命中注定要做的事。这就是你想要度过一生的方式。被女王填满的感觉真是太棒了，而她对你脑海中这种情感的满意，只会让这种感觉变得更好。[pg]");
         outputText("又一次高潮传遍你的全身，你低头看着自己被填满的肚子，自豪地拍了拍它。然而，你发现你的肚子并没有变化，卵不见了！你赶紧向抱着你的女孩分享你的恐慌，她只是笑了笑。[say: 看你傻的，卵都在这里呢，]她把你的手放在你的腹部，你感觉到了它变得多么肿胀。事实上，当你感觉到它还在生长时，你的身体又被推向了另一次高潮的边缘。[pg]");
         outputText("被女王的卵填满的过程没过多久就结束了，毒刺从你体内抽出。你气喘吁吁，精疲力竭，你的同伴把你领到房间的一侧，与此同时，另一个蜂女走上前来接替你的位置。你看着你的朋友，问她接下来会发生什么。[say: 接下来？我们去森林里，这样想要我们卵的人就可以来被填满。然后我们再回来要更多。]然后她指了指房间里正在交配的其他女孩和雄蜂。[say: 不过，我告诉你，等我帮你产下第一批卵后，我们花点时间玩玩怎么样？]这听起来很不错，你花了一整天的时间都在做这件事。");
         doNext(beeMaidenFertileBeeBadEndPart5);
      }
      
      public function beeMaidenFertileBeeBadEndPart3() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("当你进入女王的房间时，你的感官受到了大量色情图像、声音和气味的冲击。有几十只蜜蜂处于各种放荡和性狂欢的状态。雌性都非常像你的同伴，有着丰满苗条的身体，而雄性的体型则有些不同。虽然他们的主体仍然相当苗条，而且通常有着可爱的中性面孔，但他们的主要特征是他们巨大的阳具，这些阳具都至少有[if (metric) {一米|三到四英尺}]长，直径至少有[if (metric) {十几厘米|五英寸}]。[pg]");
         outputText("雌蜂的数量至少是雄蜂的四倍，但这并不妨碍它们寻欢作乐。它们大多成双成对地互相嬉戏，发出各种淫荡的娇喘。一些幸运的雌蜂缠绕在雄蜂粗大的阴茎上，一边用自己的蜜液涂抹那些器官，一边舒服地喘息着。而雄蜂们也无一例外地发出愉悦的呻吟，这要么是因为它们的侍女伴侣的服侍，要么更常见的是因为女王本人的恩宠。[pg]");
         outputText("啊，是的，女王。这个淫乱场景的中心正是女王本人，她的一切都显得无比巨大。她至少有[if (metric) {四米|十二英尺}]高，甚至可能更高。她的体格美丽但不算娇小。如果要形容她的话，除了脸和腹部，她就像是你那位蜂女同伴的略微丰满放大版。她的面容充满母性却又威严，高贵却又慈祥。仅仅是看着她深邃的黑眼睛，就足以让你的心平静下来，而看到她那迷人的黑色嘴唇对你微笑，更是让你的心怦怦直跳。她的头顶上盘着大量的头发，编织成精美的辫子、发带和发髻。她那迷人且造型优美的黑黄相间的头发，可能是你见过的最美丽的头发了。[pg]");
         outputText("她的另一个主要特征是她的腹部，这可能是她最引人注目的部分。那东西几乎和蜂后的人形身体一样高，也一样宽。它从女王的身体向外延伸了至少[if (metric) {九米|三十英尺}]。关于她的腹部有两个主要特点。首先，它上面环绕着许多大小不一的裂口，考虑到大多数雄蜂都在急切而疯狂地将它们巨大的阴茎插入这些裂口中，你猜测那些就是她的阴道。其次，有一位侍女目前正被腹部末端一根相当大的阴茎状毒刺操着。不过，必须承认，这根[if (metric) {半米长、六厘米宽|十八英寸长、两英寸半宽}]的毒刺与雄蜂们的阴茎相比，简直是小巫见大巫。[pg]");
         outputText("这个房间是一个相当大的圆顶建筑，中间建有一个浅碗状的凹陷，女王就躺在底部。其余的蜜蜂散布在房间各处。这个地方唯一值得一提的另一件事就是气味。直到现在你才注意到，蜂巢的大部分区域都没有那种通常围绕着你蜂女同伴的、令人极度兴奋和头脑发麻的蜂蜜气味，但在这个房间里，这种气味又强烈地回来了。不仅如此，你还刚刚意识到，这是你唯一看到雄蜂的地方，蜂巢其余部分的所有工蜂都是雌性。");
         doNext(beeMaidenFertileBeeBadEndPart4);
      }
      
      public function beeMaidenFertileBeeBadEndPart2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("没过多久，你们来到了一座从树林中耸立而出的巨大黄色建筑前，它像一座多层婚礼蛋糕般层叠而起。高塔周围充斥着强烈的嗡嗡声，成群的蜜蜂四处飞窜，穿梭其间，偶尔也能看到蜂女的身影。[say: 来吧，]你的向导让你观察了一会儿之后，带你走向降落区。当你们落地时，一对高大健壮的蜂女手持甲壳制成的长矛朝你们走来。[say: 没事的嗞，守卫嗞，这个刚刚拿过我们女王的蜂蜜嗞，]你的向导对她们说。其中一个打量了你一番，然后俯身检查你的生殖器，另一个则在那位侍女的蜜穴旁嗅了几下。她们互相点了点头，然后回到了各自的岗位上。[pg]");
         outputText("现在可以自由行动了，你们俩向蜂巢深处走去。整个地方都忙忙碌碌的。无论是人形还是其他形态的蜜蜂，都没有停下来休息的。小蜜蜂不断地为蜂巢带来花蜜，而人形蜜蜂则忙着把这些东西变成蜂蜜、储存起来，或者守卫其他人。酿造蜂蜜的蜜蜂体型非常大，至少中间部分是这样。她们狼吞虎咽地吃着小蜜蜂带来的花蜜，然后从夸张的蜜蜂女性部位大量排泄出蜂蜜。既然你已经进来了，她们谁也没有看你一眼，她们完全不像你一直以来相处的那个放松而充满爱意的侍女。不过话又说回来，她们中也没有一个像她那样美丽或身材姣好，所以你也没什么好抱怨的。[pg]");
         outputText("当你继续深入蜂巢时，看到的最有趣的东西是一个类似育婴室的地方。你之前看到到处乱飞的那些较小的蜜蜂，正被混入六角形的槽盆中，里面盛满了由其他蜂女分泌的奇怪稠厚液体。这些蜂女的乳房比你见过的其他蜜蜂要大得多，而臀部则几乎没什么分量。你最初见到这些蜜蜂时，还以为她们胸前的装饰只是摆设，但似乎至少有一种蜂女的胸部确有其用——这些看护者正在往槽盆里灌入所谓的“蜂乳”。有些槽盆正被运往蜂巢的其他区域。[say: 它们被带走后会成为蜂巢的新成员嗞，]你的同伴解释道，[say: 再过几个月嗞，它们就会长成像我这样的成年蜜蜂嗞。]她指着其中一个槽盆，那里正有红色液体和那稠厚的东西混合在一起，[say: 那些蜜蜂嗞会成为女王嗞的侍女。那些嗞会成为守卫，那些是看护者，那些是酿蜜师嗞，]她依次指着其他槽盆继续说道。[pg]");
         outputText("你着迷地听着她解释蜂巢的内部运作，已经对这里的熙熙攘攘感到宾至如归。最终，你的向导将你带到育婴室的后方，进入一个类似大厅的地方，里面挤满了蜜蜂守卫。守卫们不安地盯着你，但你向导的存在似乎让他们平静下来，你们继续沿着大厅前进。[say: 这是我们参观的最后一站，也是我最喜欢的部分，]当你们到达大厅尽头时，她对你说，然后你们走进了前面的房间。");
         doNext(beeMaidenFertileBeeBadEndPart3);
      }
      
      public function beeMaidenFertileBeeBadEnd() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你深吸了一口气，接过了昆虫情人递来的糖果。它很小，圆圆的，呈泪滴状，大约[if (metric) {两厘米半长，一厘米左右|一英寸长，半英寸}]厚。你把它放进嘴里。它柔软香甜，但有一点酸涩的余味。过了一会儿，你觉得天旋地转，你重新躺倒在花朵上，而蜜蜂则爬到你身上，用她覆盖着甲壳的手臂轻轻抚摸你的脸。突然，你的全身开始疼痛，然后燃烧起来。你低头看了看自己，想知道发生了什么，却看到一层黑色的甲壳正慢慢在你的躯干上生长，位置和上面的蜜蜂一模一样！看来你现在正在变成一只完全的蜜蜂了。[pg]");
         outputText("随着你身体更多部位发生变化，你的精力迅速衰退。[say: 闭上眼睛，] 你听到女孩说。伴随着身体的疲惫和强烈的眩晕感，你毫不犹豫地照做了。[say: 放松，深呼吸。] 在变形过程中，你努力平稳呼吸。这并不容易，特别是当" + (get_player().hasVagina() ? "你的" + get_player().vaginaDescript(0) + "发生了根本性的变化，你" : "你感觉到原本光秃秃的腹股沟上裂开了一道口子，并") + "感觉到有粘稠的液体开始从中流出。值得庆幸的是，让你难以深呼吸的不再是痛苦的喘息，而是欢愉的喘息。你迫不及待地想感受身体另一个部位的重组，并体验从中涌出的新感觉。特别是你的新蜜罐（不然还能叫什么呢？）传来的感觉几乎令人难以招架，每隔一会儿就会喷出一股蜂蜜。[pg]");
         outputText("最终，变形结束了，你重新睁开眼睛。侍女随后扶你站了起来。你打量着你们俩的身体，发现你们确实变得几乎像彼此的镜像。你拉了拉嘴唇，发现是的，你现在拥有了性感的黑色嘴唇。你的全身现在都覆盖着甲壳，就像对面的女孩一样。最后，你检查了你的女性部位，发现它现在正在分泌蜂蜜，和蜂女的没什么两样。你有点惊讶地发现，蜂蜜的气味似乎不再对你产生影响了。至少不像以前那么强烈了。[pg]");
         outputText("[say: 来吧，] 蜂女兴奋地说着，同时飞到了半空中，[say: 该去见女王了！] 你也展开了你的蜜蜂翅膀，跟在她后面。她带着你高高飞过树林，有那么一小会儿，你有机会观察下方森林蜿蜒曲折的景色。你对森林的观察并没有持续太久，因为去见蜂后的念头很快就盖过了你的好奇心。对到达新家的期待几乎触手可及。");
         doNext(beeMaidenFertileBeeBadEndPart2);
      }
      
      public function beeMaidenConversationRejectCandy() : void
      {
         outputText("[pg]你觉得这整件事有些不对劲，所以你拒绝了她。她几乎要哭出来了。[say: 可是为什么？你为什么想这么孤独？我不明白！]你试图解释，但过了一会儿，很明显你们俩的心态有着根本的不同。对她来说，能想象到的最可怕的事情就是不属于一个蜂巢，而且你不太可能在短时间内改变她的想法。最后，你只能告诉她你能接受的说法：你现在不想这样，但你希望如果她愿意的话，你们可以继续你们充满爱意的约会。听到这话，她确实精神振奋了起来，对你点了点头，[say: 好吧，那我们回头见。]然后你再次" + get_player().clothedOrNaked("穿上你的[armor]并") + "离开她的花朵。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeMaidenConversation() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         if(get_conversation() > 2 && !get_player().isPureEnough(20))
         {
            set_conversation(2);
         }
         switch(get_conversation())
         {
            case 0:
               set_conversation(1);
               outputText("在给你机会从那场折腾中恢复过来之后，你那甲壳质感的伴侣转向了你。[say: 很有趣嗞，对吧？我们应该找个时间再来一次嗞，或许也能互相了解一下嗞？]她说着，递给你一个装满蜂蜜的小瓶子。[say: 我的一些蜂蜜嗞，给你，拿着。]说完，她展开翅膀飞走了，最后朝你挥了挥手。[pg]");
               get_inventory().takeItem(get_consumables().PURHONY,get_camp().returnToCampUseOneHour);
               break;
            case 1:
               set_conversation(2);
               outputText("等你恢复过来后，她愉快地伸了个懒腰。[say: 跟同一个人玩不止一次嗞，总是那么有趣嗞。你不觉得吗？]她说着，把一只胳膊搭在你的肩膀上。你毫不犹豫地告诉她，这确实是一次有趣的体验。[say: 嘿，你是哪个蜂巢的？]她问你，[say: 也许改天我可以给你带个惊喜嗞？]你犹豫了一下，然后告诉她你其实并非来自任何蜂巢，甚至根本不是一个完全的蜂女。她瞪大了眼睛，然后恍然大悟地一巴掌拍在自己脑门上，[say: 对嗞！当然嗞，难怪你给我的感觉有点不太对嗞。]突然她僵住了，[say: 有人来了嗞，他们可能是想要我的蛋和蜂蜜嗞，我们改天再聊嗞。]她又递给你一瓶琥珀色的液体，然后把你赶走了。你还没走太远就把[armor]重新穿上了。你回头的时候正好看到一只小恶魔跳进了蜂女的怀里。[pg]");
               get_inventory().takeItem(get_consumables().PURHONY,get_camp().returnToCampUseOneHour);
               break;
            case 2:
               set_conversation(3);
               outputText("过了一会儿，你和你的伴侣靠在那朵花上，在疯狂的欢爱之后放松着。蜂女从包里掏出一根白色的小吸管递给你，但你婉拒了。她耸耸肩，透过吸管深深吸了一口，然后又同样悠长地呼了出来。[say: 和你一起玩总是很开心嗞，姐妹嗞。]你对她表达了同样的感受。[pg]");
               if(get_player().cor > 20)
               {
                  outputText("[say: 不过嗞，我真希望能给你一个地方嗞，让你和我们其他姐妹嗞待在一起嗞，但你被污染得太严重了嗞，听不到我们伟大母亲的歌声嗞。也许有一天吧嗞，]她悲伤地说道。你告诉她不要太担心，反正你们也不是不能有这些幽会。她重新振作起来，祝你好运，你穿好衣服，收拾好东西，往营地走去。不过，她不让你离开，直到你收下了一瓶她的蜂蜜。");
               }
               else
               {
                  outputText("[say: 我一直在想嗞，姐妹嗞，你不知道聆听母亲的声音嗞的喜悦，让我觉得好难过嗞。]你困惑地看着她，问她是什么意思。[say: 所有我们蜜蜂嗞都能听到母亲——女王嗞——的声音嗞。一想到你听不到她的声音嗞，我就觉得好难过嗞。]她低下头，脸上露出悲伤的表情。你想也许该对她说些什么，但她的感受对你来说实在太陌生了，你不知道究竟该说什么。[pg]");
                  outputText("她抬起头，脸上带着兴奋的表情看着你，又递给你一瓶她的蜂蜜，然后说，[say: 别担心嗞，姐妹嗞，我会试着想个办法嗞！]说完她展开翅膀飞走了。你惊讶地看到她就这么突然离开了。她的腹部还满是蛋，而且把包也落下了（你往里面看了一眼，但只找到一瓶她的蜂蜜）……她大概很快就会回来取的。你耸耸肩，穿好衣服，收拾好东西，往营地走去。[pg]");
               }
               get_inventory().takeItem(get_consumables().PURHONY,get_camp().returnToCampUseOneHour);
               break;
            case 3:
               set_conversation(4);
               outputText("在又一次熟悉的场景中放松之后，你转向你的伴侣，问她上次为什么跑得那么快，连东西都落下了。她用双手轻轻拍了下额头，然后说，[say: 哦对嗞！我有东西给你嗞。]她在包里翻了一会儿，然后掏出一个看起来像软糖的东西。一股独特的蜂蜜味从上面飘来，跟这姑娘平时产出的蜂蜜味道不一样。[say: 拿着这个嗞。它能让你听到我们母亲的声音嗞，这样你就再也不用在外面漂泊嗞、不再属于任何蜂巢了嗞。][pg]");
               outputText("这听起来有点不祥，但尽管如此，你还是会收下糖果并按照她说的做吗？");
               doYesNo(beeMaidenFertileBeeBadEnd,beeMaidenConversationRejectCandy);
               break;
            default:
               outputText("你躺在花朵上，在与蜂女做爱后享受着现在已经熟悉的放松感。你已经做过很多次了，有时你甚至会忘记她和你有多么不同。不出所料，当你站起来时，她再次拿出了蜂蜜糖果，问你是否愿意再次加入她的蜂巢。如果你拒绝，事情很可能会一成不变，但你确信吃下它会从根本上改变你。你还是要吃下它并听从蜜蜂的指示吗？");
               doYesNo(beeMaidenFertileBeeBadEnd,beeMaidenConversationRejectCandy);
         }
      }
      
      public function beeLeave() : void
      {
         clearOutput();
         outputText("[pg]你觉得和这个蜂女打交道纯粹是自找麻烦，于是立刻转身跑回营地。在玛瑞斯，小心驶得万年船，任何一见面就试图让你失去理智的东西，对你的健康绝对没好处。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeGirlsGetsDildoed() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         outputText("你走向你那");
         if(get_monster().get_HP() < 1)
         {
            outputText("倒霉的");
         }
         else
         {
            outputText("发情的");
         }
         outputText("敌人，像骑士拔剑一样从[inv]里拔出你最喜欢的新玩具。唯一的区别是，你的“剑”会晃动，还会漏出粉红色的液体。你向前冲去，一个跳跃拉近了距离，轻轻拍了拍她的脸。她抬头看着你，头晕目眩，困惑不解，张开嘴想要抗议。人造假阳具轻松地堵住了她的嘴。从她脸颊上的红晕可以看出，它的液体已经开始对她产生影响了。[pg]");
         outputText("当你拔出那个冒犯她的工具时，蜂女的眼睛诱人地半闭着。她舔了舔嘴唇，仿佛在召唤你把它重新塞回她的喉咙里，但玩具已经开始膨胀，你对它有其他的计划。你坐在她的胸口上，就在她暴露的乳房下方，越过她的蜜壶，伸手去摸她的腹部。一旦她意识到你要去哪里，她就开始拼命扭动，但在目前的位置上却无能为力。你把手伸到她的毒刺旁边，分开那里柔软的肉，找到了你要找的器官。[pg]");
         outputText("稍微刺激一下，它就开始生长出来，这是一个凌乱的黑色器官，上面有许多肉瘤和肉结，顶部是敞开的，里面晃荡着蜂蜜和体液。随着它变得越来越硬，你的俘虏停止了挣扎，这就像是对阴茎的一种奇怪的女性模仿。最后，这个婊子将在一个不该承受这些的洞里承受一些不舒服的东西。[pg]");
         outputText("假阳具很好地堵住了她的产卵管，尽管当它被完全塞进去时，一股蜂蜜喷到了你的手上。她那产卵器上的肉结和凸起看起来更加淫秽了，而当里面的假阳具开始吸收蜂蜜和蜂精，变得越来越大时，这幅画面变得更加糟糕。她在夹杂着快乐和痛苦的叫声中呼喊着，你决定看看给这样一个奇怪的阴茎状器官打手枪是什么感觉。它分泌出的光滑蜂蜜立刻浸透了你的手，当你开始给她的产卵管打手枪时，蜂蜜在你的手周围冒着泡。[pg]");
         outputText("随着假阳具塞子继续膨胀，它变得越来越粗。随着你加快节奏，她的叫声越来越大，而且听起来不再那么痛苦了。从她臀部的颤抖来看，她很享受。你开始感觉到产卵管底部周围有微小的肉结和凸起，光滑的黑色肉壁在那里慢慢变得透明，因为它被入侵者和后面堆积的卵撑得越来越宽。担心你可能会严重伤害她，你抓住粗大的性玩具，轻轻一拉，终于拔出了蜂女的塞子。[pg]");
         outputText("她在狂喜中大叫，从她大张的产卵管中喷出黄白色的黏液，溅了自己一身。卵开始从颤抖的黑色管子里滚落下来，从她的肚子和大腿上滚落到地上的黏液坑里，因为她高潮的收缩把它们一个接一个地挤了出来。它们两三个一组地出来，轻松地穿过变宽的洞口。她在你身后嗡嗡作响，沉浸在自己的小世界里，可能在想象她正在给某人的后门受精。你耸了耸肩，继续抚摸产卵管，当它硬得几乎像阴茎一样，并最后用力喷射了几次，把最后一枚卵排入那一大堆卵中时，你咯咯地笑了起来。[pg]");
         outputText("当她昏过去时，你松开了它，当你意识到她从现在起可能每走一步都会漏卵时，你笑了。");
         if(get_player().cor < 50)
         {
            outputText("你为她感到有些难过，但你");
         }
         else
         {
            outputText("你");
         }
         outputText("在经历了如此激烈的体验后，你真的需要回到营地去发泄一下。也许你应该试试你那蜂蜜味的假阳具？");
         dynStats(DynStat.Lust(20 + get_player().lib / 5 + get_player().cor / 10));
         get_combat().cleanupAfterCombat();
      }
      
      public function beeGirlRapeForTheDistinguishedGentleman() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1255,FlagDict_Impl_.arrayReadInt(_loc1_,1255) + 1);
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("蜂女向后踉跄着靠在她的栖息处，喘着粗气。你迅速向前扑去，将她的身体按在巨大的植物上，抓住她无力挣扎的手臂。灵光一闪，你从花朵下方扯下一片细长柔软的叶子，纵向扭曲，在她还没反应过来发生什么之前，用你临时制作的绳子将她的双手绑在她头顶的茎上。[pg]");
         }
         else
         {
            outputText("蜂女双膝一软，开始拼命地用手指抠弄自己的小穴，无暇顾及采取任何防御姿态。你带着露齿的微笑，文雅地走到她面前，一只手搂住她的腰，轻轻地将她向后推到她之前坐着的那朵巨大的花上。当她用既感兴趣又困惑的表情看着你时，你从花朵下方扯下一片细长柔软的叶子，纵向扭曲，做成一根草绳。你引导她的双手在头顶合拢，并将它们绑在那里的茎上，对自己的聪明才智感到非常满意。[pg]");
         }
         outputText("你一时陷入沉思，不知道接下来该怎么做，没有注意到现在被绑住且被激怒的蜜蜂最后试图扭转局面的举动，她的毒刺慢慢滑出，腹部抬起，准备使用它。");
         if(get_player().get_spe() < 50)
         {
            outputText("蜜蜂撑着茎干抬起双腿，猛地翘起毒刺，扎中了你的手臂，在你扭转身体躲开她那邪恶的尾部之前，注入了大量的毒液。你用另一只手抓住了她肿胀腹部上厚厚的绒毛。这个蜜蜂婊子真是不知好歹！你低头盯着那根可恨的毒刺，目光稍微向上游移，落在了隐藏着她干瘪黑色产卵管的柔软区域，你心中沸腾的愤怒和痛苦与你本已堕落的想法交织在一起，让你产生了一个复仇的主意。");
         }
         else
         {
            outputText("蜂女撑着茎干抬起双腿，翻起腹部，毒刺向你的侧面刺来。你反应迅速，翻滚着躲开并蹲下，抬起手臂将蜜蜂的腹部举在空中，这样她就无法调整姿势进行下一次刺击。这个蜂女真是个输不起的家伙！你的目光扫过她的腹部，看着那愤怒的小尖刺和旁边隐藏着产卵管的柔软部位，一个主意开始在你那堕落、疯狂追求新奇的脑海中成型。你咧嘴笑得更欢了，摇着一根手指，责备着受惊的蜜蜂。");
         }
         outputText("[pg]");
         outputText("你紧紧抓住腹部上的绒毛，空出的手拨开柔软的肌肉，开始抚摸蜜蜂那细小的黑色产卵管，它急切地做出反应，体积变大并探出头来。没过多久，你灵巧的刺激就使这个器官变成了一根布满肉结的肉棒，并让蜜蜂自己陷入了快乐嗡嗡叫的恍惚状态。[pg]");
         var _loc2_:Array = [];
         if(get_player().tongue.type == 1)
         {
            _loc2_[int(_loc2_.length)] = 0;
         }
         if(get_player().hasCock())
         {
            _loc2_[int(_loc2_.length)] = 1;
         }
         if(get_player().hasVagina())
         {
            _loc2_[int(_loc2_.length)] = 2;
         }
         if(get_player().biggestTitSize() >= 4)
         {
            _loc2_[int(_loc2_.length)] = 3;
         }
         var _loc3_:int = int(_loc2_[Utils.rand(int(_loc2_.length))]);
         if(_loc3_ == 0)
         {
            outputText("当你的手在不断膨胀的黑色肉棒上上下套弄时，它的顶端张开了大约[if (metric) {三厘米|一英寸}]，并开始分泌一种类似蜂蜜的液体，散发着甜味和性信息素的气味。事实上，当你那过度敏感的细长舌头在唇间飞舞品尝空气时，你觉得这是你多年来注意到的最诱人的气味！你几乎是无意识地顺着那令人陶醉、催眠的香气，把脸越来越靠近蜂女那凹凸不平的产卵管，直到你完全贴在上面。最终你失去了所有的克制，将你蛇一般的舌头伸出嘴外，探入洞中，在难以置信的味道中，你伴随着呻吟爆发了，而蜂女也因为额外的刺激而同时发出狂喜的尖叫。她的小穴高潮了，喷出一团蜂蜜般的汁液，正好打在你的侧脸上，但你不在乎，因为你正忙着舔舐光滑内壁上和越来越多卵周围你能找到的每一滴液体；用你肿胀的舌头卷起大口的这种神奇物质。你舔了几分钟，感觉就像几个小时一样漫长，里面的信息素引发了你自己的几次高潮");
            if(get_player().hasCock())
            {
               outputText("，将你粘稠的精液喷在蜜蜂腹部毛茸茸的一侧，");
            }
            outputText("然后你才心满意足。啊，谁能想到这东西在蜜蜂体内还新鲜的时候会这么好？你有一种强烈的冲动，想把这个女孩带回家，让她成为你的“储藏室”，但你迷迷糊糊地意识到，她必须由蜂后受精产卵，然后才能生产你的美食。你摇摇头，清除掉那甜蜜的迷雾，紧紧抓住蜜蜂的肉结，决定现在就执行你最初的计划；也许你以后可以抓住蜂后。[pg]");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(2),DynStat.Sens(2));
         }
         else if(_loc3_ == 1)
         {
            outputText("看到女孩的抵抗在翻白眼的喘息中结束，你决定也加入到这乐趣中来。你用空出的一只手有些困难地解开并脱下[armor]的下半部分，将你的" + get_player().cockDescript(0) + "对准她现在正喷涌着蜜汁的蜜罐。考虑到她产卵管上的前戏已经足够让她湿润得能容纳一个牛头人了，你毫不客气地将你的[cock]猛插进她体内。");
            if(get_player().cockArea(0) > get_monster().vaginalCapacity())
            {
               outputText("当你的肉棒头部痛苦地撞击她的子宫颈时，蜂女几乎没有退缩，随着你继续用现在粘乎乎的手套弄她的产卵管，她很快又恢复了狂喜的表情。");
            }
            outputText("你保持着稳定的节奏，操弄着这可怜女孩湿透的小穴，同时拉扯着那根怪诞的黑色肉棒，你的目光始终没有离开她肿胀器官根部形成的凸起。很快，你看到卵子滑入准备排出的位置时产生的明显凸起，你更加用力地握紧，同时给蜂女打飞机，以积攒更多的卵。尽管她还在呜咽，但在双重刺激下，她还是在性高潮中抽搐起来，她的身体顺从了你，又送上了一批准备好的卵。尽管你握得很紧，但增加的压力还是迫使她喷出了一股花蜜，射向空中近[if (metric) {三分之一米|一英尺}]高，然后落下来，打湿了她腹部柔软的绒毛。[pg]");
         }
         else if(_loc3_ == 2)
         {
            outputText("当蜂女的舌头从嘴里伸出来，在快感中无力地嗡嗡叫时，你放松了对她腹部柔软绒毛的抓握，将注意力集中在你手中稳步生长的多结肉茎上。你心想，在实施你的计划之前，不妨再多找点乐子，于是你设法单手解开了[armor]的下半部分。脱下衣服后，你抬起腿跨在蜜蜂的腹部，然后让你的" + get_player().vaginaDescript(0) + "顺着那怕痒的毛茸茸的表面滑下。这种不均匀的摩擦感让你惊讶地喘了口气。当绒毛慢慢摩擦你的阴唇，向着你期待的目的地前进时，你感觉到你的[clit]探了出来。到达包含毒刺和现在正在跳动的产卵管的末端时，你抬起身体，将你的" + get_player().vaginaDescript(0) + "对准后者，然后猛地插下去，花蜜从蜜蜂的下半身溅出，溅入你湿滑的褶皱中。你一只手缠绕在毒刺上，让它指向别处，另一只手抓住一块还没有被你的爱液弄湿的绒毛，开始将那根黑色的凸起肉棒在你的体内抽插。逃入你体内的花蜜开始与你自己的天然体液混合着挤出，增加的湿滑感让每一次抽插都变得更加火热。经过几分钟湿润的抽插，你感觉到蜂女那昔日的入侵者长出了更多凹凸不平的花纹，你意识到她的卵一定准备好喷发了；几个卵被抽搐的肉头挤进了你的小穴，给你带来了一阵额外的快感。你迅速从蜂女身上站起来，紧紧抓住产卵管，而那些过早释放的卵则从你湿透的裂口滑落，掉在地上。[pg]");
         }
         else if(_loc3_ == 3)
         {
            outputText("注意到蜜蜂减弱了她剧烈的反抗，转而发出愉快的嗡嗡声，并用恳求的目光注视着你，你试图寻找某种方法让自己更接近高潮，这样你就可以在实施计划的同时达到高潮，你心不在焉地抚摸着蜜蜂的肉头，同时笨拙地单手解开并脱下[armor]的上半部分。把它扔到一边，当一团从肿胀的黑色肉棒中溅出的温暖液体飞溅到你现在暴露的" + get_player().breastDescript(0) + "上时，你不由自主地打了个寒颤。你用空闲的手将这种充满感官刺激、富含信息素的液体涂抹在你的胸部，确保乳沟之间的区域湿滑，并让敏感的乳房肌肉产生进一步的颤栗，传遍全身。你弯腰趴在越来越结实的附肢上，把它夹在你的[breasts]之间，开始沿着它的长度上下推挤，同时恶毒地捏着你的" + get_player().nippleDescript(0) + "。蜂婊的黑色假阳具长出了新的凸起，因为卵子在你的服侍下顺着通道向上移动，看起来很像一个不可思议的性玩具。你用一只手把乳头捏在一起，发出一声轻微的呻吟，而另一只手滑到产卵管的尖端，紧紧抓住，把卵子留在里面，直到你准备好让她释放它们；然后你开始让你那对被捏得敏感的乳头沿着女孩凹凸不平的肉棒的另一侧上下滑动。当卵子在工具中积压时，你把你的[nipples]固定在湿润膨胀的肉茎周围，让到达的球体给你进行不规则的按摩，把你推向高潮的边缘。[pg]");
         }
         outputText("你把身体从她身上拉开；蜂女那令人陶醉的嗡嗡声带上了一丝恐慌，因为她的身体紧绷着，准备释放另一批卵，却又一次被你紧紧抓住她的器官所阻止。你和她进行眼神交流，露出恶魔般的微笑，问她是否准备好释放所有被压抑的卵。她用力地对你点头，开始自发地上下抽动她的腹部，把她的工具塞进你湿滑的拳头里，带着重新焕发的活力哼唱着。你把她的腹部轻轻向上弯曲，朝向你的[ass]，她的抽插节奏变得更快，因为她想象着终于把她的卵射进你的[asshole]里。突然，你转过身，把空闲的手移到蜜蜂的下腹部下方，用力向上向内推。可怜的、不知所措的蜂女，已经处于急切的向上抽插的中间，在你的手的引导下，用她的产卵管尖端刺穿了她自己的雏菊，而毒刺直接落入了她闪闪发光的小穴。她和谐的哼唱瞬间变成了震耳欲聋的颤音尖叫，因为强力的肛门穿透和涌入她敏感阴道的毒液，加上你严重扭曲她腹部造成的痛苦结合在一起；但这种痛苦不足以阻止她现在巨大的黑色产卵管挤出每一个卵，因为它的末端再次打开了。被压抑的卵的释放引发了受虐蜜蜂身体的另一次高潮，增加了敏感度，从而增加了她中毒小穴的痛苦，并刺激另一批卵顺着她受损的腹部发射到她自己的直肠里。当她在自己体内一次又一次地高潮时，她痛苦的哀号达到了令人难以置信的强度，你忙着用那只没有用来固定她腹部的手去");
         if(get_player().hasCock())
         {
            outputText("抚摸你的" + Appearance.cockNoun(CockTypesEnum.HUMAN));
         }
         else if(get_player().hasVagina())
         {
            outputText("揉搓你的" + get_player().vaginaDescript(0));
         }
         else
         {
            outputText("捏你的[nipples]");
         }
         outputText("，在你高潮时大笑");
         if(get_player().hasCock() || get_player().lactationQ() >= 100 || get_player().wetness() >= 5)
         {
            outputText("并把你的粘液喷满她受尽折磨的腹股沟");
         }
         outputText(".[pg]");
         outputText("该死，那可能对耳朵造成了一些伤害，但这绝对值得！蜂女终于把她所有的卵都排进了自己肿胀的屁眼，停止了高潮，昏了过去。你收拾好东西，把她扭曲湿透的身体留在身后，转身回营地。");
         if(get_player().get_spe() < 50)
         {
            get_player().changeFatigue(20);
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function beeGirlPCVictory(param1:Boolean) : void
      {
         var hpVictory1:Boolean;
         var _g:BeeGirlScene;
         spriteSelect(SpriteDb.get_s_bee_girl());
         clearOutput();
         if(param1)
         {
            outputText("看着[monster.short]倒下，无法继续战斗，你满意地笑了。她双腿间散发出的甜美气味让人难以忍受，让你欲火焚身，你看到了一个简单的缓解方法……");
            outputText("[pg]你要对她做什么？");
         }
         else
         {
            outputText("看着[monster.short]张开双腿，开始揉弄她那浸满蜂蜜的小穴，你满意地笑了。她双腿间散发出的甜美气味让人难以忍受，让你欲火焚身，你看到了一个简单的缓解方法……");
            outputText("[pg]你要对她做什么？");
         }
         dynStats(DynStat.Lust(50),DynStat.NoScale);
         menu();
         addButtonDisabled(0,"用肉棒","这个场景需要你有一根肉棒。");
         addButtonDisabled(1,"用多根肉棒","这个场景需要你至少有两根肉棒。");
         addButtonDisabled(2,"用小穴","这个场景需要你有一个小穴。");
         addButtonDisabled(3,"扶她风格","这个场景需要你是一个扶她。");
         addButtonDisabled(4,"假阳具强暴","这个场景需要你有豪华假阳具。");
         addButtonDisabled(5,"母乳喂养","这个场景需要你有足够的乳汁。");
         addButtonDisabled(6,"娜迦","这个场景需要你有毒牙和娜迦身体。");
         addButtonDisabled(7,"自我注卵","这个场景需要你有足够的体能和腐化，以及一些可以用来找乐子的部位。");
         addButtonDisabled(8,"产卵","这个场景需要你有蜘蛛产卵管和毒牙。","产卵");
         if(get_player().hasCock())
         {
            addButton(0,"用肉棒",rapeTheBeeGirlWithADick).hint("你可以用" + get_player().oMultiCockDesc() + "操她。","用肉棒");
         }
         if(get_player().cockTotal() > 1)
         {
            addButton(1,"用多根肉棒",rapeTheBeeMultiCockStuff).hint("你可以用不止一根" + get_player().multiCockDescriptLight() + "操她。","用多根肉棒");
         }
         if(get_player().hasVagina())
         {
            addButton(2,"用小穴",rapeABeeGirlWithYourVagina).hint("你可以让她在你的" + get_player().vaginaDescript() + "上高潮。","用小穴");
         }
         if(get_player().isHerm())
         {
            addButton(3,"扶她风格",futaRapesBeeGirl).hint("你可以尝试在蜂女身上同时满足你的“男性”和“女性”部分。","Herm Style");
         }
         if(get_player().hasKeyItem("Deluxe Dildo"))
         {
            addButton(4,"假阳具强暴",beeGirlsGetsDildoed).hint("你可以玩弄你的玩具。","Dildo Rape");
         }
         if(get_player().hasStatusEffect(StatusEffects.Feeder) || get_player().lactationQ() >= 500)
         {
            addButton(5,"喂奶",milkAndHoneyAreKindaFunny).hint("你可以得到一些释放。","Breastfeed");
         }
         if(get_player().isNaga() && get_player().face.type == 5)
         {
            addButton(6,"娜迦",corruptNagaBitchesRapeABee).hint("你可以专注于你那蛇一般的“娜迦”特征。","Naga");
         }
         if((get_player().isCorruptEnough(75) || get_player().hasPerk(PerkLib.Pervert) || get_player().hasPerk(PerkLib.Sadist)) && get_player().get_str() >= 60 && (get_player().tongue.type == 1 || get_player().hasCock() || get_player().hasVagina() || get_player().biggestTitSize() >= 4))
         {
            addButton(7,"自我注卵",beeGirlRapeForTheDistinguishedGentleman).hint("你可以稍微玩弄她一下，试着让她把卵产在自己体内。","Self-Egg");
         }
         if(get_player().canOvipositSpider() && (get_player().face.type == 5 || get_player().face.type == 10))
         {
            addButton(8,"产卵",layEggsInABeeSpiderLike).hint("你可以给她注射毒液，然后把你的卵产在她体内。","Lay Your Eggs");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]帮你撸蓬松你的尾巴。").sexButton(-1);
         }
         _g = this;
         hpVictory1 = param1;
         setSexLeaveButton(function():void
         {
            _g.leaveAfterDefeating(hpVictory1);
         });
      }
      
      public function beeEncounterWithWorms() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你慢慢地[walk]向蜂女，脑子里一片混沌。她的触角期待地摆动着，给了你一个充满欲望的微笑，渴望用她的“货物”填满你的屁股。你开始脱衣服，当你走到她面前时，最后一件内衣掉落在森林的地面上。[pg]");
         outputText("蜂女把手放在你的肩膀上。她温柔地拉着你接吻，但当她甜美的唾液为你接下来的事情做准备时，你感觉到你的一个环节动物乘客滑落下来，" + (get_player().hasStatusEffect(StatusEffects.WormPlugged) ? "从你的子宫颈探出你的阴道" : "顺着你的尿道，缠绕在你的阴茎顶端") + "。蜂女从吻中退缩，低头一看，吓得跳了回去，脸色苍白。[pg]");
         outputText("[say: 我的女王啊！那太恶心了！你怎么受得了？呃，不行，我不能把女王珍贵的卵产在有那种东西的身体里。] 几滴液体从她的产卵管尖端滴落，她补充道，[say: 我本来很想的。我真的必须找一个能接受这些并保护它们安全的人。][pg]");
         outputText("她飞了起来，悬停在离地[if (metric) {一米|几英尺}]的地方。[say: 祝你好运，摆脱那些东西。等你摆脱了，来找我，我会给你塞满可爱的卵，]她承诺道，手指漫不经心地抚摸着自己的下体。她摇了摇头，刻意控制住自己，强迫手指离开她的裂口，然后从树冠上的一个洞飞了上去。[pg]");
         outputText("独自一人，欲火焚身，你所能做的就是穿上衣服，回到你的营地，希望路上没有小恶魔伏击你。");
         dynStats(DynStat.Lust(0.5 * get_player().lib + 20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterWithExgartuan() : void
      {
         outputText("，当她看到你走近时，她弯下腰笑了。她站起来，欢迎你进来，她的翅膀发出轻微的嗡嗡声，张开双臂，给你一个热情的拥抱。[pg]");
         if(Utils.rand(2) == 0)
         {
            outputText("你继续向前走，你的[cock]从你的[armor]里挣脱出来。一个没有实体的声音大喊道：[say: 蜜罐，蜜罐，我爱死蜜罐啦！][pg]");
            outputText("蜂女看到这一幕，眼睛睁得大大的，被你那过度发育的身体拖向她而感到震惊，就好像你的[cock]里有磁铁一样。她紧紧贴在花瓣上，吓得不敢做任何有意义的抵抗。那个喋喋不休的声音又响起了，[say: 那么我们是要强暴她还是怎样，[name]？我需要一些蜂蜜！][pg]");
            outputText("她似乎惊讶得无法反抗。你要顺从埃克斯加图安的意思，强暴她吗？");
            menu();
            addButton(0,"是",get_game().exgartuan.exgartuanBeeRape);
            addButton(1,"否",get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("蜂女看到这一幕，眼睛睁得大大的，被你那过度发育的身体拖向她而感到震惊，就好像你的[cock]里有磁铁一样。她飞到半空中，将毒刺对准你，准备战斗！");
            startCombat(new BeeGirl());
         }
      }
      
      public function beeEncounterSheFearsYou() : void
      {
         outputText("在光线下闪闪发光。[pg]");
         outputText("当她看到你时，她惊恐地张大了嘴巴。她扔下花，开始后退，大喊道：[say:求求你别再伤害我了！我不会再试图在你体内产卵了，放我走吧！][pg]");
         outputText("你要怎么处置她？");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(14,"离开",beeLeave);
      }
      
      public function beeEncounterSheDesiresYou() : void
      {
         outputText("在光线下闪闪发光。[pg]");
         outputText("当她看到你时，她惊恐地张大了嘴巴。她扔下花，开始后退，大喊道：[say:不！我不会屈服于欲望的！走开！][pg]");
         outputText("你要怎么处置她？");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(14,"离开",beeLeave);
      }
      
      public function beeEncounterSheBeatsYouRegularlyTalk(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("[say:所以，你今天很乖嘛？]她微笑着，轻轻地飘向你。[say:我知道你到底是来干什么的，你已经无法抗拒了，]她轻轻地拍了拍你的[ass]，你发现自己开始走向那朵大花，蜂女轻轻地飘在你身后。她咯咯地笑着对你说，[say:看吧？你真的只是想要卵和蜂蜜。你是个特别的人，天生就是为了搬运蜂巢的卵而生的。]你倒在花丛中，感觉到蜂女轻轻地落在你的背上。[say:你准备好了吗？]她问你。");
         beeEncounterSheBeatsYouRegularlyLastChance();
      }
      
      public function beeEncounterSheBeatsYouRegularlyLastChance() : void
      {
         var _g:BeeGirlScene;
         if(get_player().get_lib100() + get_player().corAdjustedDown() < 70 || Utils.rand(4) == 0)
         {
            menu();
            _g = this;
            addButton(0,"是",function():void
            {
               _g.beeEncounterSheBeatsYouRegularlyAndYouLetHerLaysEggs();
            });
            addButton(1,"否",beeEncounterSheBeatsYouRegularlyDontLetHer);
         }
         else
         {
            outputText("[pg]多亏了她的诡计，你想不出任何理由不这么做。");
            beeEncounterSheBeatsYouRegularlyAndYouLetHerLaysEggs(false);
         }
      }
      
      public function beeEncounterSheBeatsYouRegularlyDontLetHer() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你勉强摆脱了她的诡计，滚到一边。你最后看了她一眼，然后爬起来，跑出了空地。这本来可以有更好的结果的。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterSheBeatsYouRegularlyAndYouLetHerLaysEggs(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你几乎喘不过气地说[say:是！]，就在你把自己交给蜜蜂嗡嗡声的警笛声和她气味令人兴奋的效果之前。[say:好[boy]，]她咕哝着，脱下了你的[armor]。然后她慢慢地用双臂环抱你的[chest]，你感觉到有什么东西开始推你的[ass]。你愉快地叹了口气，放松下来，让你的后门被入侵者穿透。你听到蜂女在你上方咯咯地笑，叹了口气，对你允许她进入你的决定感到非常满意。[pg]");
         if(get_player().hasBreasts())
         {
            outputText("当进入你肛门通道的入侵者继续前进时，她开始抓住并挤压你的[chest]。每一次动作，你都只能喘息着，在快乐中哭泣。你听到她说，[say:让我们把这变得特别一点，]她的一只手从你的胸膛上移开；不一会儿，一些湿漉漉、黏糊糊的东西被放在了空出的" + get_player().nippleDescript(0) + "上。当蜜蜂把蜂蜜揉进敏感的尖端时，你浑身发抖，当她对另一个[nipple]做同样的处理时，你尖叫起来。[pg]");
         }
         else
         {
            outputText("她的一只手从你的身体上缩了回来，你听到她说，[say:让我们把这变得特别一点。]然后你发现一根散发着甜味的指头出现在你面前；你本能地张开嘴，开始吮吸那根手指，很高兴地发现它上面沾满了蜂蜜。当你快乐地舔舐和吮吸那根手指时，蜂女开始越来越急促地摇晃着你，把她的入侵者越来越深地推入你的肛门通道。[pg]");
         }
         outputText("你上方的蜜蜂发出快乐的嗡嗡声，你感觉到一种温暖粘稠的液体开始填满你被侵犯的" + get_player().buttDescript() + "的深处。你再次喘息，蜂女说[say:现在真正的乐趣开始了。让我用这些卵填满你的那个洞。我会确保你享受整个过程。]在仍然确保你的[ass]被完全穿透的同时，蜂女轻轻地把你举到她的毒刺上。你隐约意识到自己低头看着它夹在你的两腿之间。[pg]");
         if(get_player().hasCock())
         {
            outputText("然而，你很快就对她的手缠绕在你的[cocks]上并轻轻抽动的感觉产生了更大的兴趣。当蜂女继续她的手淫时，你发出一阵令人眼花缭乱的笑声，不一会儿，你释放了你的负荷，喷洒在你面前的花朵上。[pg]");
            outputText("[say:那是一个，但在我完成你之前，我们会得到更多，]她在你耳边低语，你点点头，脸上带着茫然的微笑。当感觉到有什么坚硬的东西开始进入你的[ass]时，她的手再次开始摩擦你的" + get_player().multiCockDescriptLight() + "。这种感觉让你不知所措，你忘记了时间。你不知道你的肠道被填满的刺激和她放在你[cocks]上的手让你获得了多少次美妙的释放。[pg]");
         }
         else if(get_player().hasVagina())
         {
            outputText("这并不是真正吸引你注意力的东西，因为手指轻轻滑过你的" + get_player().vaginaDescript(0) + "的感觉很快就证明了这一点。当一些手指很快插入你的体内，而另一些手指开始在你的外阴和[clit]周围跳舞时，你发出了一声小小的哭泣。你的一个洞被填满的刺激和另一个洞被玩弄的刺激结合在一起，把你推向了高潮的边缘。[pg]");
            outputText("[say:那是一个，但在我完成你之前，我们会得到更多，]她在你耳边低语，并点点头，脸上带着茫然的微笑。当感觉到有什么坚硬的东西开始进入你的[ass]时，她的手再次开始在你少女般的下唇上跳舞。没过多久，双重感觉就让你变成了一个呻吟、高潮、一团糟的人。你不知道你在那里呆了多久，也不知道当一个接一个的卵被推入你的体内时，你被推向了多少次边缘。[pg]");
         }
         else
         {
            outputText("很快，她的手指在你的身体上游走，寻找每一个刺激你的地方。当她像拉小提琴一样玩弄你时，你咯咯地笑了起来，当一些坚硬的东西开始进入你的肠道时，你在高潮中哭喊。[say:那只是第一个，]蜂女咯咯地笑着，[say:我知道在我填满你之前，我们会玩得很开心]你给了她一个茫然的微笑，感觉到另一个高潮向你袭来。[pg]");
            outputText("你不知道这持续了多久，也不知道蜂女在你缺乏天赋的情况下设法让你高潮了多少次，但在整个过程中，你只感到了幸福和释放。[pg]");
         }
         outputText("一旦最后一颗卵被推入你的肠道深处，蜂女叹了口气，慢慢地取出了填满你[ass]的打结工具。她把你放回花上，给了你一个满嘴的吻，然后说[say:下次见...]过了一会儿，你睡着了。几个小时后你醒来，感到头晕目眩，你注意到有什么湿漉漉的东西从你的肛门里漏出来。[pg]");
         get_player().orgasm("Anal");
         dynStats(DynStat.Inte(-0.5));
         get_player().slimeFeed();
         if(Utils.rand(2) == 0)
         {
            get_player().buttKnockUp(26,48,1,1);
            _temp_1.timesEgged += 1;
         }
         get_player().buttChange(25,true);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function beeEncounterSheBeatsYouRegularly() : void
      {
         var _g:BeeGirlScene;
         outputText("在光线下闪闪发光。[pg]");
         outputText("一看到你，她就咧嘴笑了起来。[say:又见面了，调皮的[boy]，]当她站起来向你招手时，她的嗡嗡声真的开始钻进你的脑海里。[say:放轻松点，让我把卵产在你体内。不吵不闹，不打不斗。就让自己沉醉其中吧。][pg]");
         if(get_player().get_lib100() + get_player().corAdjustedDown() < 70 || Utils.rand(4) == 0)
         {
            outputText("你费了九牛二虎之力才忍住没有扑进她的怀里。输给这个女孩对你抵抗她的魅力一点帮助都没有。你发现越来越难抵抗她那不可思议的歌声和不自然的气味的召唤了，现在逃跑也许是明智的；但现在你恢复了理智，你要怎么做呢？");
            menu();
            addButton(0,"战斗",fightTheBeeGirl);
            _g = this;
            addButton(1,"交谈",function():void
            {
               _g.beeEncounterSheBeatsYouRegularlyTalk();
            });
            addButton(14,"离开",beeLeave);
         }
         else
         {
            outputText("在她的面前，你无法控制自己，你扑进她的怀里，她把你举到半空中，然后把你脸朝下放在花上，落在你的背上。[say:这就对啦，只要你放手，一切都会变得很轻松。你准备好了吗？]");
            beeEncounterSheBeatsYouRegularlyLastChance();
         }
      }
      
      public function beeEncounterSelect(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("就在这时，她出现了。那是一个身形高大的女人，黄黑条纹相间，恰如一只蜜蜂化身的侍女。她端坐在一朵巨花之上，哼着轻快的调子，手指正欢快地撕扯着另一朵花的花瓣。她四肢纤长，唯独腹部浑圆隆起。她的头颅比起蜜蜂更接近人类——一双漆黑的眼眸，一对微微颤动的触角，还有那双饱满多汁的黑唇，泛着湿漉漉的光泽，仿佛在引诱谁来舔舐");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && get_player().cockArea(0) > 100 && get_player().statusEffectv2(StatusEffects.Exgartuan) == 0)
         {
            beeEncounterWithExgartuan();
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasStatusEffect(StatusEffects.WormPlugged))
         {
            beeEncounterWithWorms();
            return;
         }
         var _loc2_:Boolean = get_player().get_race() == "bee-morph";
         if(get_player().hasCock() && (get_player().cockArea(0) >= 50 || get_player().cocks[0].get_cockType() == CockTypesEnum.BEE || _loc2_))
         {
            outputText("在光线下闪闪发光。[pg]");
            beeEncounterAsBeeMorphMaleOrGiantCock(_loc2_);
         }
         else if(_loc2_)
         {
            outputText("在光线下闪闪发光。[pg]");
            beeEncounterAsBeeMorphFemale();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1257) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1255) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1256) >= 5)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1257) > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1255) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1256))
            {
               beeEncounterSheBeatsYouRegularly();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1256) >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1255))
            {
               beeEncounterSheFearsYou();
            }
            else
            {
               beeEncounterSheDesiresYou();
            }
         }
         else
         {
            switch(get_attitude())
            {
               case 4:
                  beeEncounterAfraid();
                  break;
               case 5:
                  beeEncounterAfraidRepeat();
                  break;
               case 6:
                  beeEncounterDisgusted();
                  break;
               case 7:
                  beeEncounterDuty();
                  break;
               default:
                  outputText("，当她看到你走近时，她弯下腰笑了。她站起来，欢迎你进来，她的翅膀发出轻微的嗡嗡声，张开双臂，给你一个热情的拥抱。[pg]");
                  if(get_player().get_lib100() + get_player().corAdjustedDown() < 140 || Utils.rand(2) == 0)
                  {
                     outputText("你勉强克制住自己，没有欢天喜地地扑进她的怀里。你意识到她翅膀和谐的嗡嗡声和她蜂蜜那超凡脱俗的香气短暂地剥夺了你的理智。感觉头脑稍微清醒了一些，你打算怎么做？");
                     menu();
                     addButton(0,"战斗",fightTheBeeGirl);
                     addButton(1,"交谈",beeTalk);
                     setSexLeaveButton(beeLeave,"离开",14,2,20);
                  }
                  else
                  {
                     beeEncounterClassic(false);
                  }
            }
         }
      }
      
      public function beeEncounterRefusedHerEggsLeave() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("[pg]你现在不想和这个女孩打交道，所以你转身就走。");
         dynStats(DynStat.Lust(5 + get_player().lib / 25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterRefusedHerEggsDuty() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         set_attitude(7);
         outputText("[pg]你向她解释说，你是你们村庄的勇者，以及这意味着什么。你解释了你的职责，并且你不能做任何可能阻碍你完成职责的事情。[pg]");
         outputText("蜂女点点头，似乎理解地笑了。[say: 我明白了，我也身负职责。我必须找到人来产下我女王的卵。如果你也有职责，我不会妨碍你，我也不会强迫你携带它们。]你感谢蜂女的体谅，并为不能更直接地帮助她而道歉。她对你笑了笑，说：[say: 没关系，勇者；如果你什么时候想聊天，随时欢迎来玩。我们的女王也反对恶魔，所以我们会在心里支持你的。]");
         dynStats(DynStat.Lust(5 + get_player().lib / 25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterRefusedHerEggsDisgusted() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         set_attitude(6);
         outputText("[pg]你告诉她，你觉得她要在你体内产卵的想法很恶心，而且你厌倦了她总是试图违背你的意愿诱惑你接受。她恼怒地看了你一眼，然后重重地跺了一下她站着的那朵花，差点摔倒在一边，嘴里说着，[say: 好吧，啊！]然后用翅膀稳住了自己。[say: 如果我再看到你，你就别想有好日子过了。]然后她把你赶出了空地。你微笑着离开，现在你再也不用担心她的歌声会影响你了。");
         dynStats(DynStat.Lust(5 + get_player().lib / 25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterRefusedHerEggsAfraid() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         set_attitude(4);
         outputText("[pg]你从她身边退开，解释说并不是你不喜欢怀卵的想法，而是你害怕她对你心智的影响。你对在她身边无法清晰思考感到不舒服，而且你真的不能同意任何你记不住的事情，因此也无法真正享受它。她惊讶地歪着头，然后担忧地抿起光泽的嘴唇说：[say: 真的吗？你是说有人不喜欢失去自我的感觉？嗯，也许我应该把这件事告诉我的女王。]她对你笑了笑，开始飞走，然后在半空中停下来，飘到你身边说：[say: 下次再来吧，也许我能想出一些让你觉得舒服的方法，好吗？]");
         dynStats(DynStat.Lust(5 + get_player().lib / 25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterRefusedHerEggs() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         switch(get_attitude())
         {
            case 2:
               set_attitude(3);
               break;
            case 3:
               outputText("[pg]侍女站在花朵上，双手叉腰。[say: 为什么不呢？我保证，这对你来说绝对会非常美妙的。你为什么不接受我呢？]她撅起光泽的嘴唇抱怨道。[pg]");
               outputText("你停顿了一下，想知道自己为什么到现在一直拒绝她。是因为你害怕她以及她对你心智的影响吗？是因为一想到她的卵在你体内就觉得恶心吗？是因为你作为勇者的责任吗？还是你打算把她留在那儿自己琢磨？");
               dynStats(DynStat.Lust(5 + get_player().lib / 25));
               menu();
               addButton(0,"害怕",beeEncounterRefusedHerEggsAfraid);
               addButton(1,"恶心",beeEncounterRefusedHerEggsDisgusted);
               addButton(2,"责任",beeEncounterRefusedHerEggsDuty);
               addButton(14,"离开",beeEncounterRefusedHerEggsLeave);
               return;
            default:
               set_attitude(2);
         }
         outputText("[pg]听到你的拒绝，她的脸沉了下来，但并没有对你采取任何行动。[say: 好吧，我不会强迫你的，也许下次你会更愿意？]你勉强笑了笑，然后回到了营地。");
         dynStats(DynStat.Lust(5 + get_player().lib / 25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterDutyTalk() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("这名侍女似乎很高兴能和你聊一会儿。她对你分享的故事很感兴趣，你也有机会从她那里听到一些关于这个世界的事情。在你们聊了一会儿之后，你注意到她一直在用手抚摸自己的私处，于是你问她怎么了。[say:哦？嗯，我现在就是太饥渴了，你觉得你能帮我解决一下吗？你可以留一些蜂蜜以后用，它会对你产生一些不可思议的效果的。]你接受她的提议吗？");
         if(get_player().get_inte100() < 50)
         {
            dynStats(DynStat.Inte(0.5));
         }
         menu();
         addButton(0,"是",freeHoneyEvent);
         addButton(1,"拒绝",beeEncounterDutyLeave);
      }
      
      public function beeEncounterDutyLeave() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你拒绝了她的提议，不久之后你便告辞返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterDuty() : void
      {
         outputText("在光线下闪闪发光。[pg]");
         outputText("她的脸上绽放出笑容，嗡嗡声也渐渐平息。你微微摇了摇头，清除了你所受到的影响，然后回头看着微笑的蜂女。");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(1,"交谈",beeEncounterDutyTalk);
         addButton(14,"离开",beeLeave);
      }
      
      public function beeEncounterDisgusted() : void
      {
         outputText("在光线下闪闪发光。[pg]");
         outputText("她一看到你就皱起了眉头。她的嗡嗡声立刻停了下来，她看着你说：[say: 哦，又是你嗞，快走开嗞；我得找嗞个真正愿意搬运我女王嗞的蛋的人嗞。]她一脸嫌弃地把你赶出空地，你的意识也随之从恍惚中被拉了回来。");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(14,"离开",beeLeave);
      }
      
      public function beeEncounterClassicSex(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         if(get_attitude() == 2 || get_attitude() == 3)
         {
            set_attitude(1);
         }
         if(get_player().isTaur())
         {
            outputText("仿佛失去了对身体的控制，你小跑到她身边，完全被周围弥漫的甜美气味迷住了。她打量着你奇怪的身体，绕着你转圈，同时用她覆盖着甲壳的手抚摸你。当她走到你的侧腹时，她抬起你的尾巴，在你的[asshole]周围画圈，在里面涂抹了一点蜂蜜，让你浑身发抖。这种感觉让人麻木，你发现自己抱着一棵树来支撑自己。显然对她所看到的感到满意，蜂女走到你面前，在你抱着的树上涂抹了更多的蜂蜜。你毫不犹豫地舔了舔它，气味很快压倒了你仅存的理智。看到这一幕，蜂女咯咯地笑着拍了拍你，退回到你的侧腹。[pg]");
            outputText("她费力地拍打着翅膀，把自己拖到你的背上，休息了一会儿。她发出的轻柔嗡嗡声似乎让她的整个身体都在震动，你对这种奇怪的感觉感到高兴。一根毒刺慢慢地从她的腹部伸出，还有一个粗大的肉结状器官，两者都覆盖着一种散发着甜味的润滑剂。当她的毒刺将感觉像是液体欲望的东西注入你体内时，你没有抗议，这导致血液涌向你的后躯，你的肛门完全放松。[pg]");
            outputText("毫无预兆地，她将粗长的前端和肉结插入你的体内。她的“阴茎”慢慢滑入，你放松的括约肌轻松地接纳了全部，而你继续舔舐她慷慨地为你涂抹在树上的大量蜂蜜。[pg]");
            outputText("她的产卵管开始将更多的催情液体泵入你的直肠，因为它在你体内越来越深。她嗡嗡的声音更大了，你背上的震动也变得更强，因为巨大的球形物体开始注入你体内。[pg]");
            if(get_player().longestCockLength() >= 100 || get_player().get_gender() == 0)
            {
               if(get_player().get_gender() == 1)
               {
                  outputText("你抓住");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("你的一个");
                  }
                  outputText("你肿胀的[cocks]并猛烈地自慰，在蜂女侵犯你的[asshole]时一次又一次地高潮。");
                  if(get_player().balls == 0)
                  {
                     outputText("在你的阴茎颤抖和痉挛的同时，你继续舔舐着涂满蜂蜜的树，直到震动的蜂女结束。");
                  }
                  else
                  {
                     outputText("你的肉棒颤抖着痉挛，精液从顶端喷涌而出。");
                  }
                  if(get_player().cumQ() < 100)
                  {
                     outputText("你喷出的精液比你想象的[balls]能容纳的还要多。白色的斑点溅在树根上，你的身下形成了一个小水坑，你满足地呻吟着。[pg]");
                  }
                  else
                  {
                     outputText("你的[balls]像消防水带一样喷射，把树根和后面的一些树都涂满了。很快，你就站在了一大滩自己的精液中，气味几乎要盖过蜂蜜的味道。蜂女为了补偿，在你的背上泼了更多的蜂蜜，导致你又释放出一股浓稠的白色精液。[pg]");
                  }
               }
               else if(get_player().get_gender() == 3)
               {
                  outputText("你抓住你肿胀的[cocks]猛烈地套弄，随着蜂女侵犯你的[asshole]，你一次又一次地高潮，你的" + get_player().vaginaDescript(0) + "喷出足够的淫液，浸湿了你的后腿。");
                  if(get_player().balls == 0)
                  {
                     outputText("随着你的肉棒颤抖痉挛，你无人照料的" + get_player().vaginaDescript(0) + "不断喷水，你继续舔舐着涂满蜂蜜的树，直到震动的蜂女结束。");
                  }
                  else
                  {
                     outputText("你的肉棒颤抖着痉挛，精液从顶端喷涌而出。");
                  }
                  if(get_player().cumQ() < 100)
                  {
                     outputText("你喷出的精液比你想象的[balls]能容纳的还要多。白色的斑点溅在树根上，你的身下形成了一个小水坑，你满足地呻吟着。[pg]");
                  }
                  else
                  {
                     outputText(get_player().SMultiCockDesc() + "像消防水带一样喷射，把树根和后面的一些树都涂满了。很快，你就站在了一大滩自己的精液中，气味几乎要盖过蜂蜜的味道。蜂女为了补偿，在你的背上泼了更多的蜂蜜，导致你又释放出一股浓稠的白色精液。[pg]");
                  }
               }
               else
               {
                  outputText("来自屁股的快感如此强烈，你的双腿发软，昏了过去。当世界陷入黑暗时，蜂女继续将她的体液注入你的体内。[pg]");
               }
               outputText("在几个小时强行填满你的洞之后，她的毒刺将感觉像是几加仑的蜜蜂种子注入你的肠道，她终于拔了出来。她微笑着躺在你的背上，你的双腿终于因为疲惫而瘫软。[pg]");
               outputText("当你醒来时，你的后半身沾满了蜂蜜，你只能假设那是她产卵管的润滑液。你挣扎着站起来，注意到一条细细的蜂蜜痕迹通向灌木丛。");
            }
            else
            {
               if(get_player().get_gender() == 1)
               {
                  outputText("随着蜂女气味带来的快感流遍全身，你无法够到肿胀的[cocks]很快成了一个问题。你渴望得到抚慰，喷出前列腺液。");
               }
               else if(get_player().get_gender() == 2)
               {
                  outputText("随着蜂女气味带来的快感流遍全身，你无法够到" + get_player().vaginaDescript(0) + "很快成了一个问题，它开始反射性地起伏，试图榨取它极度渴望的肉棒，而你的[clit]在颤抖。");
               }
               else if(get_player().get_gender() == 3)
               {
                  outputText("随着蜂女气味带来的快感流遍全身，你无法够到肿胀的[cocks]很快成了一个问题。它渴望得到抚慰，喷出前列腺液。你的[clit]颤抖着，渴望接触，而你的阴道开始反射性地起伏，试图榨取它得不到的肉棒。");
               }
               if(get_player().biggestTitSize() > 1)
               {
                  outputText("你开始猛烈地捶打你的" + get_game().player.allBreastsDescript() + "，试图缓解你无法触及的腹股沟的压力。");
                  if(get_player().hasFuckableNipples())
                  {
                     outputText("你的手指在其中进进出出，让淫液四处飞溅。但蜂蜜的效果似乎阻止了你高潮。");
                  }
                  else
                  {
                     outputText("无论多少刺激似乎都无法让你高潮。");
                  }
               }
               outputText("[pg]");
               outputText("刺激变得太痛苦了，你开始疯狂地挣扎。蜂女拼命地抓紧，她的毒刺仍然留在你的[asshole]里并泵送着体液。不过她似乎意识到了问题，并试图解决它。");
               if(get_player().get_gender() == 1)
               {
                  get_images().showImage("beegirl-loss-male");
                  outputText("她的腿缠绕在你的身体上，她的“脚”紧紧抓住你的[cocks]。这种奇怪的感觉并没有引起你的注意，因为仅仅是接触就足以让你达到高潮。");
                  if(get_player().balls == 0)
                  {
                     outputText("你猛烈地高潮了，你的[cocks]颤抖着痉挛起来。");
                  }
                  else
                  {
                     outputText("你猛烈地高潮了，你的[cocks]颤抖着痉挛起来，精液从顶端喷涌而出。");
                  }
                  if(get_player().cumQ() < 100)
                  {
                     outputText("你喷出的精液比你以为你的[balls]能装下的还要多。白色的浊液斑驳地沾在你的下腹，在你身下汇聚成小水洼，你满足地呻吟着。[pg]");
                  }
                  else
                  {
                     outputText("你的[balls]像消防水管一样喷发，将你的下腹涂满白色，顺着你的前腿滴落。很快，你就站在了一大滩自己的精液中，那气味几乎要盖过蜂蜜的甜香。蜂女作为补偿，在你的背上泼了更多的蜂蜜，导致你又射出了一股浓稠的白色精液。[pg]");
                  }
               }
               else if(get_player().get_gender() == 2)
               {
                  get_images().showImage("beegirl-loss-female");
                  outputText("她的腿蜷缩在你的后腿周围，她的“脚”开始摩擦你的" + get_player().vaginaDescript(0) + "。这种奇怪的感觉并没有引起你的注意，因为仅仅是接触就足以让你达到高潮。");
                  if(get_player().getClitLength() < 3)
                  {
                     outputText("她笨拙地服侍着你的[clit]，导致你的" + get_player().vaginaDescript(0) + "涌出大量液体，你发出一声淫荡的满足呻吟。");
                  }
                  else
                  {
                     outputText("她很快找到了你的[clit]，开始像撸管一样套弄它。这种感觉令人难以置信，当你的" + get_player().vaginaDescript(0) + "涌出液体时，你淫荡地呻吟着。");
                  }
                  outputText("你的后腿很快就被你体内涌出的湿滑淫液覆盖了。[pg]");
               }
               else if(get_player().get_gender() == 3)
               {
                  if(Utils.rand(2) == 0)
                  {
                     get_images().showImage("beegirl-loss-male");
                     outputText("她的腿缠绕在你的身体上，她的“脚”紧紧抓住你的[cocks]。这种奇怪的感觉并没有引起你的注意，因为仅仅是接触就足以让你达到高潮。");
                     if(get_player().balls == 0)
                     {
                        outputText("你猛烈地高潮了，你的[cocks]颤抖着痉挛起来。");
                     }
                     else
                     {
                        outputText("你猛烈地高潮了，你的[cocks]颤抖着痉挛起来，精液从顶端喷涌而出。");
                     }
                     if(get_player().cumQ() < 100)
                     {
                        outputText("你喷出的精液比你以为你的[balls]能装下的还要多。白色的浊液斑驳地沾在你的下腹，在你身下汇聚成小水洼，你满足地呻吟着。[pg]");
                     }
                     else
                     {
                        outputText("你的[balls]像消防水管一样喷发，将你的下腹涂满白色，顺着你的前腿滴落。很快，你就站在了一大滩自己的精液中，那气味几乎要盖过蜂蜜的甜香。蜂女作为补偿，在你的背上泼了更多的蜂蜜，导致你又射出了一股浓稠的白色精液。[pg]");
                     }
                     outputText("以为你还不满足，她稍微抬起她的“脚”，开始摩擦你的" + get_player().vaginaDescript(0) + "。");
                     if(get_player().getClitLength() < 3)
                     {
                        outputText("她笨拙地服侍着你的[clit]，导致你的" + get_player().vaginaDescript(0) + "涌出大量液体，你发出一声淫荡的满足呻吟。");
                     }
                     else
                     {
                        outputText("她很快找到了你的[clit]，开始像撸管一样套弄它。这种感觉令人难以置信，当你的" + get_player().vaginaDescript(0) + "涌出液体时，你淫荡地呻吟着。");
                     }
                     outputText("你的后腿很快就被你体内涌出的湿滑淫液覆盖了。");
                  }
                  else
                  {
                     outputText("她的腿蜷缩在你的后腿周围，她的“脚”开始摩擦你的" + get_player().vaginaDescript(0) + "。这种奇怪的感觉并没有引起你的注意，因为仅仅是接触就足以让你达到高潮。");
                     if(get_player().getClitLength() < 3)
                     {
                        outputText("她笨拙地服侍着你的[clit]，导致你的" + get_player().vaginaDescript(0) + "涌出大量液体，你发出一声淫荡的满足呻吟。");
                     }
                     else
                     {
                        outputText("她很快找到了你的[clit]，开始像撸管一样套弄它。这种感觉令人难以置信，当你的" + get_player().vaginaDescript(0) + "涌出液体时，你淫荡地呻吟着。");
                     }
                     outputText("你的后腿很快就被你体内涌出的湿滑淫液覆盖了。[pg]");
                     outputText("以为你还没满足，她稍微放低了她的“脚”，开始摩擦你的[cocks]。");
                     if(get_player().balls == 0)
                     {
                        outputText("你猛烈地高潮了，你的[cocks]颤抖着痉挛起来。");
                     }
                     else
                     {
                        outputText("你猛烈地高潮了，你的[cocks]颤抖着痉挛起来，精液从顶端喷涌而出。");
                     }
                     if(get_player().cumQ() < 100)
                     {
                        outputText("你喷出的精液比你以为你的[balls]能装下的还要多。白色的浊液斑驳地沾在你的下腹，在你身下汇聚成小水洼，你满足地呻吟着。[pg]");
                     }
                     else
                     {
                        outputText("你的[balls]像消防水管一样喷发，将你的下腹涂满白色，顺着你的前腿滴落。很快，你就站在了一大滩自己的精液中，那气味几乎要盖过蜂蜜的甜香。蜂女作为补偿，在你的背上泼了更多的蜂蜜，导致你又射出了一股浓稠的白色精液。[pg]");
                     }
                  }
               }
               outputText("经过几个小时强行填满你的下体后，她的尾针将感觉像是有几加仑的蜂精泵入你的肠道，同时还笨拙地满足着你的需求；她终于拔了出来。她微笑着趴在你的背上，而你的双腿终于因精疲力竭而瘫软下来。[pg]");
               outputText("当你醒来时，你全身沾满了蜂蜜，以及你只能猜测是来自她产卵管的润滑液。你有些挣扎地站起来，注意到在你狂野的状态下，你似乎摧毁了这片小空地，因为到处都是折断的树木和被践踏的植物。一条细细的蜂蜜痕迹从这片废墟中延伸向灌木丛。");
            }
            get_player().orgasm("Generic");
            if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
            }
            dynStats(DynStat.Inte(-0.5));
            get_player().slimeFeed();
            if(Utils.rand(3) == 0)
            {
               get_player().buttKnockUp(26,48,1,1);
               _temp_1.timesEgged += 1;
            }
            get_player().buttChange(25,true);
         }
         else if(int(get_player().cocks.length) > 0)
         {
            outputText("仿佛失去了对身体的控制，你幸福地倒在她的怀里。当她紧紧抱住你时，一根尾针慢慢从她的腹部伸出，还有一个粗大的肉结状器官，两者都覆盖着散发甜香的润滑液。当你的大脑通感般地看到无数的色彩和气味时，你没有反抗，任由她温柔地将你推倒，让你跪在你的");
            if(get_player().isTaur())
            {
               outputText("飞节和膝盖上");
            }
            else
            {
               outputText("肚子上");
            }
            outputText("。当她俯身压在你身上，她的尾针——谢天谢地它没有毒——逼近你的肛门时，你也没有抗议。没有多余的话语，她将那根粗长尾针和肉结塞进了你的体内。她的“肉棒”缓缓滑入，润滑液让你不至于从气味诱发的快感昏迷中清醒过来。你的手甚至摸向了自己肿胀的");
            if(get_player().cockTotal() == 1)
            {
               outputText("阴茎");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("阴茎");
            }
            outputText("，而她则相当粗暴地强暴着你曾经紧致的后穴，全程还哼着小曲。[pg]");
            outputText("经过几个小时强行填满你的下体后，她的尾针将感觉像是有几加仑的蜂精泵入你的肠道深处，而你则抚摸着自己直到射精，她终于拔了出来。她的尾针还在你的背上滴着精液，她微笑着看着你将最后一股精液射进你身下的精液池中，然后你精疲力竭地倒下了。[pg]");
            get_player().slimeFeed();
            outputText("你醒了过来，鼻子里满是蜂蜜般的香气，背上沾着一些奇怪的液体，感觉有什么东西正从你体内流出。");
            get_player().buttChange(25,true);
            get_player().orgasm("Anal");
            dynStats(DynStat.Inte(-0.5));
            if(Utils.rand(3) == 0)
            {
               get_player().buttKnockUp(26,48,1,1);
               _temp_2.timesEgged += 1;
            }
         }
         else
         {
            outputText("你幸福地扑进蜂女的怀里，被她的哼唱和她周围空气中弥漫的罪恶般甜美的蜂蜜气味所迷住。她轻柔地拥抱着你，在你耳边轻柔却专注地哼唱着，震动着你的思绪，使其变成一团乱麻，你无力地瘫软在她的怀里。你意识到自己被移动了，她将你平放在一朵巨大的花上，然后绕到你身后，当你感觉到她手臂上覆盖的平滑甲壳温柔地抚摸你时。她把你翻转过来，同时在你耳边嗡嗡地哼唱着更多那种让你丧失思考能力的曲调。[pg]");
            outputText("你躺在那里，脸上挂着令人目眩的微笑，任由蜂女跨坐在你身上，将某种尖锐的东西刺入你的大腿。欲望在你的血管中沸腾，");
            if(int(get_player().vaginas.length) == 0)
            {
               outputText("你扭动着呻吟，却找不到释放的出口");
               if(get_player().totalNipples() > 1)
               {
                  outputText("，你的乳头因欲望而红肿。");
               }
               else
               {
                  outputText("。");
               }
            }
            else
            {
               if(get_player().vaginas[0].vaginalWetness < 2)
               {
                  outputText("集中在你现在肿胀的阴户周围。");
               }
               if(get_player().vaginas[0].vaginalWetness >= 2 && get_player().vaginas[0].vaginalWetness < 4)
               {
                  outputText("在你的" + get_player().vaginaDescript(0) + "周围变得更加强烈，因为它开始渗出你欲望的蜜汁。");
               }
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("用渴望点燃你的" + get_player().vaginaDescript(0) + "，让爱液如河流般从你肿胀的阴户间涌出。");
               }
            }
            if(get_player().biggestTitSize() > 1)
            {
               outputText("她双手冰凉坚硬的触感让你吃了一惊，她伸手按摩你丰满的胸部，用手指捏弄你坚挺的乳头");
               if(get_player().biggestLactation() > 1)
               {
                  outputText("，当一股乳汁溅在花瓣上时，她惊讶地哼了一声。");
               }
               else
               {
                  outputText("。");
               }
            }
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("她双手冰凉坚硬的触感让你吃了一惊，她开始用手抚摸你众多的乳房，用手指捏弄每一个坚挺的乳头，倾身用她弯曲柔软的舌头舔舐它们，并轻柔地哼着歌");
               if(get_player().biggestLactation() > 1)
               {
                  outputText("，当一股乳汁溅在花瓣上时，她惊讶地哼了一声。");
               }
               else
               {
                  outputText("。");
               }
            }
            outputText("本能地，当一个湿润的东西紧紧压在你的屁股上时，你的臀部收紧了。你试图集中思绪，但一阵特别强烈的嗡嗡声将它们驱散，让你完全放松下来，任由她那粗壮球状的产卵管滑入你的体内。起初很慢，然后越来越急促，蜂女将它越来越深地挺进你的体内，她开心地哼着歌，在你面前放了一把蜂蜜。你的舌头不由自主地向前伸出，舔舐着蜂蜜");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("，同时你的手被引导向你的" + get_player().vaginaDescript(0));
            }
            outputText(".[pg]");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("当你舔食她的蜂蜜时，你的手指在你的阴蒂上跳舞");
            }
            else
            {
               outputText("当你舔食她的蜂蜜时，你的手指探索着你们两人身体的每一[if (metric) {厘米|英寸}]");
            }
            outputText("，你的臀部在你的昆虫情人身下扭动挣扎。随着液体开始流入你的直肠，你的屁股里产生了一股压力，引发了一次让你翻白眼、浑身颤抖的高潮。你平静下来，但你血管中的欲望并没有消散——事实上，在被灌满蜂蜜精液");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("，你正无意识地吞咽着源源不断的催情蜂蜜，你的手指本能地蹂躏着你的" + get_player().vaginaDescript(0) + "，");
            }
            else
            {
               outputText("以及你无意识地吞食着源源不断的催情蜂蜜的双重刺激下，");
            }
            outputText("你让自己一次又一次地达到高潮。几个小时里，你躺在那里，舔舐着，自慰着，任由你的后庭被甜美的液体慢慢填满，偶尔还能感觉到凸起，你只能猜测那是卵。[pg]");
            outputText("最终你意识到她不再喂你蜂蜜了，蜂女将她干瘪的器官从你的直肠中拔出。她拍了拍你的头，开始蹒跚着离开，蜂蜜从她的大腿间滴落，她曾经肿胀的后腹部现在看起来更适合她纤细的身材了。");
            get_player().orgasm("Anal");
            dynStats(DynStat.Inte(-0.5));
            get_player().slimeFeed();
            if(Utils.rand(3) == 0)
            {
               get_player().buttKnockUp(26,48,1,1);
               _temp_3.timesEgged += 1;
            }
            get_player().buttChange(25,true);
         }
         if(param1)
         {
            get_combat().cleanupAfterCombat(get_camp().returnToCampUseFourHours);
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function beeEncounterClassic(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         if(get_attitude() == 2 || get_attitude() == 3)
         {
            set_attitude(1);
         }
         beeEncounterClassicSex(false);
      }
      
      public function beeEncounterAsBeeMorphMaleOrGiantCock(param1:Boolean) : void
      {
         var _g:BeeGirlScene;
         outputText("一看到你，她的脸上就绽放出灿烂的笑容。[say: 噢，有孤独的人儿来寻求安慰了嗡？][pg]");
         outputText("你仍然沉浸在周围的气味和声音中——或者只是充满了想要和她在一起的渴望——你对她露出一个傻笑，点了点头。这是你混乱的大脑所能做出的最好回应了。");
         if(get_player().longestCockLength() > 50 || get_player().cocks[0].get_cockType() == CockTypesEnum.BEE)
         {
            outputText("[say: 过来，[boy]，让我帮你那根漂亮的大肉棒释放一下嗡，]");
         }
         else
         {
            outputText("[say: 过来，小家伙，我会帮你成为一个真正的蜜蜂[boy]，]");
         }
         outputText("她说着，张开双臂迎接你。");
         if(get_player().get_lib100() + get_player().corAdjustedDown() < 140 || Utils.rand(2) == 0)
         {
            outputText("[pg]你勉强克制住自己，摇了摇头，把那股气味和嗡嗡声从脑海中驱散。似乎是你" + (param1 ? "新的蜜蜂身体吸引了" : "巨大的肉棒引起了") + "她的注意，她正满怀期待地盯着你的胯下。你稳住心神，决定接下来该怎么做。");
            menu();
            addButton(0,"战斗",fightTheBeeGirl);
            _g = this;
            addButton(1,"性爱",function():void
            {
               _g.beeSexForCocks();
            });
            addButton(14,"离开",beeLeave);
         }
         else
         {
            beeSexForCocks(false);
         }
      }
      
      public function beeEncounterAsBeeMorphFemaleLeave() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("[pg]你对她摇了摇头，她露出失望的神情。你自己也有些失望，但你已经决定离开了。你转身离开蜜蜂，继续你的探索。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterAsBeeMorphFemale() : void
      {
         outputText("她脸上绽放出灿烂的笑容，双手一拍。[say: 你好呀，姐妹嗡！过来，我们一起玩吧！]她在花朵上舒展开身体，一边用手指抚摸着她湿润的蜜壶，一边温柔地向你招手。[pg]");
         outputText("你微微摇头，驱散了脑海中的嗡嗡声，打量着她。");
         if(get_player().cor <= 33)
         {
            outputText("你不确定自己是否真的想和她多待一会儿，但她现在看起来挺友好的。");
         }
         else if(get_player().cor <= 66)
         {
            outputText("你发现自己盯着她看了好一会儿才回过神来。她看起来人畜无害，而且享受她所能提供的东西似乎会很有趣。");
         }
         else
         {
            outputText("你想到这里咧嘴一笑，操她肯定会很有趣，但也许强上她会更有趣？");
         }
         outputText("你打算怎么做？");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(1,"玩耍",beeMaidenPlay);
         addButton(14,"离开",beeEncounterAsBeeMorphFemaleLeave);
      }
      
      public function beeEncounterAfraidRepeatSex() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("你点点头，脱下你的[armor]。蜂女向后靠在她的花上，继续摘着手里的小花等你。直到你走到她面前，这个女孩才有所动作，然后她对你笑了笑，邀请你进入她的怀抱。你深吸了一口气，为即将发生的事情做好准备，然后倒进她的怀里。她紧紧地抱了你一会儿，");
         if(get_player().hasCock())
         {
            outputText("温柔地用手指抚摸你的[cocks]，让" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "完全勃起" + (get_player().hasVagina() ? "，" : "并"));
         }
         if(get_player().hasVagina())
         {
            outputText("将她的手指滑入你的" + get_player().vaginaDescript(0) + "和你的[asshole]，直到你湿润并准备好");
         }
         else
         {
            outputText("将她的手指滑入你的[asshole]，直到你准备好");
         }
         outputText("。你微微颤抖了一下，知道很快就会有什么东西进入那里。为了让你安心，你的昆虫情人温柔地捏了你一下。[pg]");
         outputText("几分钟后，蜂女从你身边退开，把她的腹部拉到毛茸茸的腿间，让它楔在中间休息。她用一只纤细的手，温柔地用手指摩擦着靠近毒刺底部甲壳上一个质地不同的部位。片刻之后，一个带结的附肢从里面伸了出来，那是她的产卵管。她仰面躺下，示意你应该用你的[asshole]骑上她润滑过的器官。你又做了一次深呼吸，慢慢地将自己降在那个器官上。当你感觉到每一个肉结进入你的体内时，你的伴侣发出了愉悦的嗡嗡声。[pg]");
         if(get_player().analCapacity() < 25)
         {
            outputText("将器官插入你的身体是一个缓慢但确定的过程。润滑液让你更容易将器官放入体内，但你绝对能感觉到它撑开了你的后庭入口。");
            if(get_player().ass.analLooseness == 0)
            {
               outputText("<b>好吧，至少你是心甘情愿地失去后庭童贞的。在这个世界里，这已经算是很难得的事了。</b>");
            }
            else
            {
               outputText("<b>多亏了那根带肉结的器官插进你的身体，你的[asshole]变得更松了。</b>");
            }
            get_player().buttChange(25,true);
            outputText("被撑开的疼痛很快就让位给了快感，随着每一个新的肉结进入你的身体，你与你的昆虫情人共享着这份愉悦。[pg]");
         }
         else
         {
            outputText("你在这个世界的经验让你的[asshole]为这根带肉结的器官做好了充分的准备。它润滑的表面给你久经沙场的后庭带来的只有快感，随着每一个新的肉结进入你的身体，你和你的昆虫情人都发出了愉悦的呻吟。[pg]");
         }
         outputText("一旦产卵管完全进入你的体内，蜂女就会直起身子，用双臂环抱住你。她把丰满的胸部蹭向你的胸膛，紧紧地抱着");
         if(get_player().get_tallness() <= 50)
         {
            outputText("你娇小的身体。她紧紧地依偎着你，简直就像母亲依偎着自己的孩子一样。考虑到你现在正被当作卵囊使用，这说法也许并不算太离谱。");
         }
         else if(get_player().get_tallness() <= 68)
         {
            outputText("你。她轻轻地向你的耳朵里吹气，同时低声说着甜言蜜语，告诉你很快就会感觉有多棒。");
         }
         else
         {
            outputText("她娇小的身体紧贴着你。她用脑袋蹭着你的胸口，你隐约听见她低声呢喃着什么，说强壮的载体才能孕育强壮的卵。");
         }
         outputText("没过多久，你感觉到她的蜜蜂精液开始在你的肠道内流淌。很快，伴随着精液，一些肿块也进来了，那一定是她的卵。[pg]");
         var _loc1_:int = get_player().cockThatFits(50);
         if(_loc1_ >= 0)
         {
            outputText("为了寻求更多的快感，你抱起蜂女，轻轻地将她放低到你早已饥渴难耐的" + get_player().cockDescript(_loc1_) + "上，这样她就能像你骑乘她一样骑乘你了。好吧，差不多是这样，因为你很确定她那粗糙又湿滑的内部和你" + get_player().assDescript() + "的内部截然不同。虽然一开始有点惊讶，但她很快就沉浸在你的" + get_player().cockDescript(_loc1_) + "上弹跳的快感中，而她的产卵器则继续发挥着它的魔力。[pg]");
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "感到有些空虚，所以你腾出一只手来抚慰自己。你刚开始玩弄你的[clit]，就发现蜂女也伸出了一只手加入进来，亲自来弥补这份空虚，同时还对你咧嘴笑着。你回以微笑，转而把手移到她蜜壶上的小豆豆，开始玩弄它，而她则专心对付你的阴蒂。[pg]");
         }
         outputText("你们俩就这样紧紧相连了大半个小时。尽管在这里你还能体验到其他各种快感，但你发现自己最关注的还是插在后庭里的那个器官。这位侍女似乎察觉到了这一点，开始在你的后庭里抽插她的器官。每次她身上最底部的肉结穿过你的小穴时，你们俩都会发出巨大的愉悦呻吟。[pg]");
         outputText("最终，她的卵排空了，她感谢你陪她度过的这段时光。回味着你所体验到的快感，你心里毫无疑问地觉得这非常值得。在飞走之前，她确实递给了你一份礼物，作为对你服务的最后感谢。[pg]");
         if(!get_player().isButtPregnant())
         {
            get_player().buttKnockUpForce(26,48);
            _temp_1.timesEgged += 1;
         }
         get_player().orgasm("Anal");
         get_player().slimeFeed();
         switch(Utils.rand(10))
         {
            case 0:
               get_inventory().takeItem(get_consumables().W__BOOK,get_camp().returnToCampUseOneHour);
               break;
            case 1:
            case 2:
               get_inventory().takeItem(get_consumables().OVIELIX,get_camp().returnToCampUseOneHour);
               break;
            case 3:
            case 4:
               get_inventory().takeItem(get_useables().B_CHITN,get_camp().returnToCampUseOneHour);
               break;
            default:
               get_inventory().takeItem(get_consumables().PURHONY,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function beeEncounterAfraidRepeat() : void
      {
         outputText("在光线下闪闪发光。[pg]");
         outputText("看到你，她的脸上绽放出笑容，嗡嗡声也减弱了。再一次，这里的气味比你第一次来到这片树林时要弱得多。那些同样的花朵散落在周围，以减轻气味对心灵的影响。她转过身，让你完全看到她现在肿胀的腹部，并轻轻拍了拍它。[say:你现在准备好携带一些卵了吗？我不会伤害你的，我保证我不会用我的嗡嗡声和蜂蜜强迫你这么做。这些是专门为你留的，如果你答应的话，我还有一个小礼物要送给你。你准备好来点性爱，并在屁股里塞点卵了吗？]");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(1,"性爱",beeEncounterAfraidRepeatSex);
         addButton(14,"离开",beeLeave);
      }
      
      public function beeEncounterAfraidFirstTimeSex() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         set_attitude(5);
         outputText("你微笑着向她点点头。她向你勾了勾手指，张开双腿，邀请你靠近。你慢慢走向她，脸上带着" + (get_player().cor < 40 ? "有些紧张的" : "") + "微笑。你决定借此机会再次打量她的身体。从她不同寻常的腿和脚开始，你惊叹于这个异星女人的外骨骼腿看起来多么像靴子，张得大大的，向你发出邀请。你的目光顺着她的腿向上移动到她的大腿，上面覆盖着一层迷人的黄色绒毛。你发现自己想知道触摸那层绒毛会是什么感觉。同时，它几乎就像是在指引通往她蜜罐的路；不可避免地将你的视线吸引过去。[pg]");
         outputText("她的[if (silly) {小穴|小穴}]看起来有点像人类的，但周围有一圈小块的外骨骼，可以紧紧地抓住。然而，最引人注目的部分是它似乎是一个[if (!silly) {几乎}]名副其实的蜜罐。你可以看到黄色粘液滴落出来，你猜想那一定是充满空地的甜味的的主要来源。你的思绪回到空地，你环顾四周片刻，注意到周围散落着许多红色的大花。虽然你不认识这些花，但你猜想它们可能就是这次气味不那么刺鼻的原因。现在蜜蜂的气味只是在你的脑海深处，让你兴奋并稍微平复了你的神经；这与侍女翅膀发出温和而平静，但不刺耳的嗡嗡声没什么两样。[pg]");
         outputText("你回头看向蜜蜂，却发现你的双腿已经把你带到了离她一臂远的地方。你犹豫了片刻，这促使你面前的女人把她丰满的乳房稍微挤在了一起。然后她把你的目光吸引到她的脸上。你可以看到她性感的黑色嘴唇微微张开，眼睛闭上，突然她向前飞去。瞬间，你的嘴唇和她的嘴唇深深地吻在了一起。她嘴里的味道是令人难以置信的甜蜂蜜，它几乎把你的思绪从脑海中驱逐出去，你瘫软在她的怀里片刻。意识到你的状态，侍女惊讶地把手捂在脸上。[say: 哦，抱歉，] 她道了歉，然后轻轻地把你抱起来[if (!isnaked) { 并脱下你的[armor]}]，让你从她亲吻带来的感官超载中恢复过来。[pg]");
         var _loc1_:int = get_player().cockThatFits(50);
         if(_loc1_ >= 0)
         {
            if(get_player().hasVagina())
            {
               outputText("当她检查你的" + get_player().multiCockDescriptLight() + "和你的" + get_player().vaginaDescript(0) + "并问她想玩你的哪个玩具时，你对她微笑。她抬头看着你，舔了舔她性感的黑色嘴唇，然后对你耳语，[say: 都要。] 并把你推倒仰面躺下。一瞬间，她倒挂在你的上方。她紧紧抓住你的[cocks]，给了它几下最初的抚摸，同时用她长而灵活的舌头探索你的" + get_player().vaginaDescript(0) + "。对这个蜂女的天赋感到震惊，你除了把自己推向她之外什么也做不了，渴望更多这种令人难以置信的刺激。[pg]");
               outputText("侍女似乎认为你也需要更多的刺激。她迅速将脸和舌头尽可能深地埋入你的" + get_player().vaginaDescript(0) + "中，同时将你的" + get_player().cockDescript(0) + "带到她充满异国情调的乳房上，并在它们之间挤压它。你惊呼一声，抓住你呈大字型躺着的巨花的雄蕊。你抬头看着你的[if (silly) {[i:bee]loved|蜜蜂情人}]，她现在正以大约四十五度的角度悬停在你上方，同时有趣地前后踢着她的小腿。很快，她开始上下抽动身体，以刺激你夹在她爱之枕之间的[cock]，同时还操纵她长长的昆虫舌头在你的" + get_player().vaginaDescript(0) + "内游走。[pg]");
               outputText("双重感觉让你无法承受，在强烈的刺激下，你甚至坚持不了一分钟，就迅速达到了令人难以置信的高潮。当她感觉到你的精液喷洒在她的肚子上时，她迅速从你身边退开，咯咯地笑着。你的高潮继续席卷着你，很快就屏蔽了其他一切。你确实听到她告诉你，你应该很快回来拜访，然后她翅膀吹向你的风消失了，表明她已经飞走了。你甚至没有机会完成你的高潮，并给出答复。几分钟后，你设法把自己清理干净并穿好衣服，你脑海中唯一真实的想法是[say: 她是怎么学会成为这么好的情人的？]");
            }
            else
            {
               outputText("她开始轻轻地上下抚摸你的[cocks]，同时不确定地看着你。[say: 你想把这个放哪？我其实不确定什么对你来说是最享受的……] 她问道。你微笑着指了指她的蜜罐，说你想把你的" + get_player().cockDescript(_loc1_) + "放进去。她困惑地看着你片刻，然后说，[say: 真的吗？听起来不太对，但好吧。] 她用翅膀把自己撑起来，慢慢地把她的蜜罐降到你等待的肉棒上。很快，你就被她完全吞没了。[pg]");
               outputText("她的阴户感觉就像老虎钳一样夹着你的" + get_player().cockDescript(_loc1_) + "，但同时，她温暖的蜂蜜汁液让它变得非常光滑。蜂女因这种感觉而喘息。显然，这种感觉对她来说几乎是未知的，她以前从未自愿与像你这样的人分享过。你轻轻地把她推上你的肉棒，但当她把你的" + get_player().cockDescript(_loc1_) + "猛地插回原处时，你感到很惊讶。你抬头看着她的脸，看到她的嘴唇形成了一个“O”形。她显然非常享受这一切，每次你把她从你的长度上推开一点点，她都会继续猛地把自己压回你身上。每次她刺穿自己，都会发出另一声兴奋的呻吟。[pg]");
               outputText("她蜜罐粗糙光滑的质感令人难以置信。再加上侍女骑乘你阴茎时的狂野放纵，只需几分钟就能把你推向边缘。你的蜜蜂情人似乎和你有同样的麻烦，因为她正在发出一声兴奋的嗡嗡声或尖叫声，很难分辨是哪一种，你确信那是高潮。当你的" + get_player().cockDescript(_loc1_) + "释放它的内容物时，她的蜜罐在你的胯部涌出一层奇怪的异常粘稠的蜂蜜。蜂女从你身上飘下来，有点头晕，试图向你鞠躬，然后飞走了。一旦你有机会恢复，你就穿好衣服回到营地。在那次经历之后，你非常期待你与蜜蜂侍女的下一次相遇。");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("蜂女咯咯笑着说，[say:我以前从来没有试过这个，但是我的姐妹们告诉我这很好玩。]她把你举起来，把她的腹部垫在你身下。侍女开始抚摸她甲壳上一个奇怪的部位，就在你的" + get_player().vaginaDescript(0) + "正下方，整个过程中她一直在呻吟。没过多久，一根长长的、带结的、润滑过的器官就伸了出来，在你的" + get_player().vaginaDescript(0) + "上摩擦。[say:这就是我产下女王卵的地方。今天，它要去一个它通常不该去的地方。]她再次咯咯笑起来，然后再次把你举起来，接着把你放在她的产卵管上。[pg]");
            outputText("由于刺激带来的冲击，你用双臂环抱住你的昆虫情人，每一个肉结都撞击着你的[clit]，然后在你的" + get_player().vaginaDescript(0) + "内壁上摩擦。");
            get_player().cuntChange(25,true);
            outputText("你那超凡脱俗的伴侣开始用一只手按摩和捏弄你的[clit]，而另一只手则去玩弄你的[chest]。你也不甘落后，开始在蜂女的胸部和她目前被冷落的蜜壶上施展你自己的手法。片刻之后，她因为各种不同的感觉而喘息起来，并像你刚才抱住她一样紧紧抓住了你的身体。[pg]");
            outputText("你抚摸着自己的腹部，感觉她的产卵管深深地插在你的体内。你笑了笑，是时候加快节奏了，你抬起身体，然后重重落下，将自己刺穿在入侵者上。你享受着每一秒，但这种感觉似乎并没有侍女所感受到的那么强烈。此时此刻，她所能做的就是尽可能紧紧地抱住你，因为产卵管传来的感觉过载，她只能喘息、呻吟和尖叫，无法做任何其他事情。突然，你的[nipple]传来一阵尖锐的刺痛感，蜂女在高潮中咬了下去，导致你也达到了顶峰。" + (get_player().vaginas[0].vaginalWetness >= 2 ? "这导致你" + get_player().vaginaDescript(0) + "中喷出大量的淫液，将你和她的下半身都浸透了。" : "这导致你的" + get_player().vaginaDescript(0) + "喷出一小股淫液。") + "几分钟后，蜂女终于恢复了过来。看来她也很期待你们俩的下一次见面。她留下一句[say:下次，我们要把它用在正确的地方！]并高兴地挥了挥手。");
         }
         else
         {
            outputText("你把她的长发从眼睛上拨开，指出你其实不能和她做爱，因为你没有任何生殖器。她温柔地用手指放在你的嘴唇上让你安静，然后说：[say:这样最好。这样你就不会被次要的部位分心了。]她温柔地用手指抚摸你的身体，" + (get_player().beeScore() > 0 ? "特别关注你像蜜蜂一样的改变。她似乎真的很喜欢它们，你想知道如果你获得更多改变，她是否会为你做些特别的事情？" : "挑逗她能找到的你身体上的每一个敏感部位。") + "你自己的手指也小心翼翼地探索着她的身体。这是一种独特的感觉，她细软绒毛的触感，以及她外骨骼略微湿润但几乎像橡胶一样的质地。[pg]");
            outputText("几分钟后，你的昆虫情人用双手捧住你的" + get_player().buttDescript() + "，揉捏着把玩。在她的抚摸下，你稍微扭动了一下，她的嗡嗡声突然开始变大，让你放松地倒在她的怀里，任由她把你转过去背对着她。她喘着气，再次为试图对你使用嗡嗡声而道歉。[say:这对我来说太自然了，我想我需要更多的练习来克制自己不这样做。]她温柔地抬起你的臀部，让你跪在地上，这让你不禁询问她打算做什么。[say:我要玩你的产卵孔，小傻瓜！]她说着，向你伸出她那长长而灵活的管状舌头。还没等你问她这是什么意思，她的舌头就找到了你[ass]的入口。[pg]");
            outputText("当这个超凡脱俗的女人开始探索你最私密的洞穴，用她的舌头在边缘和股沟里游走时，你颤抖了起来。整个过程中，她都在为舌头舔你屁股的感觉而咯咯笑。[say:你尝起来真不错，我想知道里面是什么样的……]你几乎没有时间去理解她刚才说的话，就因为她的舌头刺入你[ass]入口的感觉而猛吸了一口气。你向前倒在手上，你的大脑开始因为你现在所承受的一切而像坐过山车一样翻滚。接下来的几分钟对你来说就像是一场模糊的梦，她的舌头探索着你肠道的深处，你被这种感觉所淹没，还有她用舌头把蜂蜜涂抹在里面的感觉。[pg]");
            outputText("直到她从你体内退出来并送你回营地，你才恢复了理智。现在你有机会回想一下，整个过程非常生动。你知道你至少在她的舌头下高潮了3次，她告诉你下次早点回来体验完整的服务，而且你感觉比很长一段时间以来都要好！[pg]");
         }
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beeEncounterAfraid() : void
      {
         outputText("在光线下闪闪发光。[pg]");
         outputText("看到你，她的脸上绽放出笑容。她的嗡嗡声渐渐平息，你注意到林间空地里那种令人麻木的气味没有你上次来时那么浓烈了。侍女转过身，向你展示她今天相当纤细的蜜蜂腹部；看起来她这次没有带任何卵。[say: 嘶嘶，女王说我们可以和你做个小实验，如果顺利的话，也许我们就不需要用那么多嗡嗡声和蜂蜜了。] 她咯咯地笑了起来，[say: 第一次，没有卵，所以你不用担心。你准备好找点乐子了吗？]");
         menu();
         addButton(0,"战斗",fightTheBeeGirl);
         addButton(1,"做爱",beeEncounterAfraidFirstTimeSex);
         addButton(14,"离开",beeLeave);
      }
      
      public function beeEncounter() : void
      {
         var _g:BeeGirlScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("当你靠近森林边缘时，一股甜美的香气飘入你的鼻腔。诱人、撩拨、充满魅力。当你嗅着空气时，你发现自己不由自主地顺着香气走去，仿佛有一只无形的手正将你拉向它的源头。你不知道的是，这基本上就是正在发生的事情。你走得越远，香气就越浓郁，同时还伴随着一种声音。一种嗡嗡声，但并不令人烦躁，就像有人在哼唱。那是一首美妙的曲子，会在脑海中萦绕，但并不惹人讨厌。[pg]");
         unlockCodexEntry(2039,false,true);
         if(get_player().hasKeyItem("Traveler\'s Guide") && get_player().get_inte() / 2 > Utils.rand(40))
         {
            outputText("你突然想起《旅行者指南》中的一段话，上面提到了会在难以启齿的地方产卵的怪物蜜蜂。当然，勇敢的勇者会面对任何危险。");
            outputText("[pg]<b>你要继续前进吗？</b>");
            menu();
            _g = this;
            doYesNo(function():void
            {
               _g.beeEncounterSelect();
            },get_camp().returnToCampUseOneHour);
         }
         else
         {
            beeEncounterSelect(false);
         }
      }
      
      public function beeDroneBadEndPart4() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("[say: 欢迎来到我的蜂巢，美丽的家伙！我的女儿已经告诉我关于你的事了，我很高兴能在我面前看到你，]女王用一种气喘吁吁的声音对你说，她巨大的乳房随着她在快感中喘息而起伏。[say: 你确实像她告诉我的那样赏心悦目。]听到她的话，你忍不住在快感中颤抖，但这也给你的巨大阴茎带来了另一阵刺痛。[say: 看来你很渴望，虽然我不能说我也不是，]她回应你的行为说。[say: 来吧，美丽的家伙，在我的身边占据你的位置，感受我的蜂蜜覆盖你的阴茎，给它带来甜蜜的释放。][pg]");
         outputText("她的话对你的耳朵来说是甜蜜的，甜美的蜂蜜，你不需要更多的鼓励，就会冲向她腹部上一个滴着蜂蜜的空闲裂缝，并开始将你的阴茎推入其中。立刻，阴道壁在你的阴茎周围收缩，并开始慷慨地涂抹你非常需要的奇妙蜂蜜。疼痛立刻离开了你的身体，取而代之的是一种幸福的感觉，你慢慢地将你巨大的阴茎越来越深地推入她令人难以置信的巨大蜜罐中。[pg]");
         outputText("你每向她体内推进[if (metric) {一厘米|一英寸}]，她的阴道壁在你的长度周围收缩和放松的感觉就越强烈。伴随着她的蜂蜜流淌过你的身体，对于她接下来的问题，你只有一个答案：[say: 这就是你想要的一切吗？]你通过更快地推进自己来回应，赢得了女王一声短暂的快感喘息。你忍不住咧嘴一笑，既是因为你给自己带来的快感，也是因为你给女王带来的快感。[pg]");
         outputText("你的注意力被那个被女王腹部末端的阴茎状毒刺操弄的蜂女吸引了一会儿。就在它从她的身体里缩回时，她在高潮的快感中尖叫。她深吸了几口气使自己平静下来，然后站起来，转向一边，你有机会看到她的腹部已经肿胀到你第一次注意到她时的两倍大。你感觉到一只手搭在你的肩膀上，看向另一边，看到了带你来这里的侍女。[say: 我希望我能得到你的第一批卵，]她在自己走向阴茎状毒刺之前告诉你。[pg]");
         outputText("[say: 好吧，我美丽的情人，你听到她说的了。我希望你为了你的朋友多射精，]女王一边说，毒刺一边向侍女的蜜罐移动，并强行进入她的体内。随着阴茎的插入，女王的腹部突然一阵颤抖，终于将你推向了边缘。你的蜜蜂肉棒爆发出快感，你感觉到你的精液流进女王的腹部深处，使她的卵受精。" + (get_player().cumQ() < 500 ? " 你惊讶地感觉到从你体内流出的精液有多少，你以前从来没有射过这么多。" : "") + "[pg]");
         outputText("你无法再思考了，你只能向你面前奇妙的裂缝中猛插并射精，一次又一次，直到你听到身边传来一声高潮快感的呼喊。你转过头，看到你的侍女被填满了。她飘到你身边，拉起你的手，放在她肿胀的腹部上。[say: 你做得很好，情人。我希望你能永远和我们在一起，每天帮助女王使她的卵受精。][pg]");
         outputText("你当然同意，世界上再也没有什么对你重要了，只有你面前的这个阴道和你把手放在她腹部上的蜜蜂才能真正给你带来你需要的释放。你永远无法拒绝她们，也永远无法拒绝你对女王的责任。[say: 很高兴听到你这么说，情人。欢迎来到我的蜂巢，]女王的声音在你的脑海中响起。[pg]");
         get_game().gameOver();
      }
      
      public function beeDroneBadEndPart3() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("当你进入女王的房间时，你的感官受到了大量色情图像、声音和气味的冲击。有几十只蜜蜂处于各种放荡和性狂欢的状态。雌性都非常像你的同伴，有着丰满苗条的身体，而雄性的体型则有些不同。虽然他们的主体仍然相当苗条，而且通常有着可爱的中性面孔，但他们的主要特征是他们巨大的阳具，这些阳具都至少有[if (metric) {一米|三到四英尺}]长，直径至少有[if (metric) {十几厘米|五英寸}]。[pg]");
         outputText("雌蜂的数量至少是雄蜂的四倍，但这并不妨碍它们寻欢作乐。它们大多成双成对地互相嬉戏，发出各种淫荡的娇喘。一些幸运的雌蜂缠绕在雄蜂粗大的阴茎上，一边用自己的蜜液涂抹那些器官，一边舒服地喘息着。而雄蜂们也无一例外地发出愉悦的呻吟，这要么是因为它们的侍女伴侣的服侍，要么更常见的是因为女王本人的恩宠。[pg]");
         outputText("啊，是的，女王。所有这些性爱场景的中心就是女王本人，她的一切都非常巨大。她至少有[if (metric) {四米|十二英尺}]高，可能更高。她有着美丽但不一定娇弱的体格。如果你必须描述她，除了她的脸和腹部之外，一个稍微丰满放大的蜂女同伴的版本就不会差得太远。她的脸充满母性但又严厉，威严但又仁慈。仅仅看着她深邃的黑眼睛就足以让你的心平静下来，看到她甜美的黑嘴唇对你微笑，你的心就会怦怦直跳。她的头顶上有大量的头发，梳成了一套精致的辫子、发带和发结。她那甜美而造型优美的黑黄相间的头发可能是你见过的最美丽的头发。[pg]");
         outputText("她的另一个主要特征是她的腹部，这可能是她最引人注目的部分。这东西几乎和蜂后的类人身体一样高，也一样宽。它从女王的身体向外延伸至少[if (metric) {九米|三十英尺}]。关于她的腹部有两个主要因素。首先，它周围环绕着许多大小不一的裂缝，考虑到大多数雄蜂都在急切而疯狂地将他们巨大的阴茎插入这些裂缝中，你猜想它们是她的阴道。其次，是目前正在被它末端一个相当大的阴茎状毒刺操弄的侍女。不过，不可否认的是，这个[if (metric) {半米长、六厘米宽|十八英寸长、两英寸半宽}]的毒刺与雄蜂拥有的阴茎相比显得相形见绌。[pg]");
         outputText("这个房间是一个相当大的圆顶，房间中间建有一个浅碗。女王就在碗底休息。其余的蜜蜂散布在房间各处。关于这个地方唯一值得一提的另一件事是气味。你直到现在才注意到，蜂巢的大部分地方都没有那种通常围绕着你的蜂女同伴的令人难以置信的唤起性欲和麻木神经的蜂蜜气味，它在这个房间里又恢复了力量。不仅如此，你还刚刚意识到这是你唯一见过雄蜂的地方，蜂巢其余部分的所有工蜂都是雌性。[pg]");
         doNext(beeDroneBadEndPart4);
      }
      
      public function beeDroneBadEndPart2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_bee_girl());
         outputText("没过多久，你们就到达了一个从树林中升起的巨大黄色建筑，形状像一个多层的婚礼蛋糕。尖塔周围有强烈的嗡嗡声，成群的蜜蜂在里面飞来飞去，进进出出。偶尔还会看到蜂女。[say:来吧，]你的向导让你观察了一会儿这个地方后对你说，并带你去了降落区。当你们降落时，两个拿着几丁质长矛、肌肉发达的高大蜂女向你们走来。[say:没事的，守卫们，是女王让我带这个男孩来的，]你的向导对她们说。其中一个打量着你，仔细地看着你，而另一个则闻了几下侍女的蜜罐。然后她向另一个点了点头，守卫们回到了她们的岗位。[pg]");
         outputText("现在可以自由行动了，你们俩向蜂巢深处走去。整个地方都忙忙碌碌的。无论是人形还是其他形态的蜜蜂，都没有停下来休息的。小蜜蜂不断地为蜂巢带来花蜜，而人形蜜蜂则忙着把这些东西变成蜂蜜、储存起来，或者守卫其他人。酿造蜂蜜的蜜蜂体型非常大，至少中间部分是这样。她们狼吞虎咽地吃着小蜜蜂带来的花蜜，然后从夸张的蜜蜂女性部位大量排泄出蜂蜜。既然你已经进来了，她们谁也没有看你一眼，她们完全不像你一直以来相处的那个放松而充满爱意的侍女。不过话又说回来，她们中也没有一个像她那样美丽或身材姣好，所以你也没什么好抱怨的。[pg]");
         outputText("当你继续深入蜂巢时，看到的最有趣的东西是一个类似育婴室的地方。你之前看到到处乱飞的那些较小的蜜蜂，正被混入六角形的槽盆中，里面盛满了由其他蜂女分泌的奇怪稠厚液体。这些蜂女的乳房比你见过的其他蜜蜂要大得多，而臀部则几乎没什么分量。你最初见到这些蜜蜂时，还以为她们胸前的装饰只是摆设，但似乎至少有一种蜂女的胸部确有其用——这些看护者正在往槽盆里灌入所谓的“蜂乳”。有些槽盆正被运往蜂巢的其他区域。[say: 它们被带走后会成为蜂巢的新成员嗞，]你的同伴解释道，[say: 再过几个月嗞，它们就会长成像我这样的成年蜜蜂嗞。]她指着其中一个槽盆，那里正有红色液体和那稠厚的东西混合在一起，[say: 那些蜜蜂嗞会成为女王嗞的侍女。那些嗞会成为守卫，那些是看护者，那些是酿蜜师嗞，]她依次指着其他槽盆继续说道。[pg]");
         outputText("你听得入了迷，但你巨大的蜜蜂肉棒传来的疼痛再次吸引了你的注意力，你忍不住把手放了上去。你的向导看到你这样做时倒吸了一口凉气，并开始拼命向你道歉，[say:我太抱歉了，我太兴奋于带你参观我的家，以至于我忘了我们一开始为什么来这里。来吧，这边走。]她带你走到育婴室的后面，进入一个类似大走廊的地方，里面满是蜜蜂守卫。守卫们不安地看着你，但你的向导在场似乎让她们在你走过走廊时保持了平静。[pg]");
         doNext(beeDroneBadEndPart3);
      }
      
      public function beeDroneBadEnd() : void
      {
         outputText("她的脸上绽放出灿烂而会心的笑容。[say:又见面了，我那长着大肉棒的朋友，]她说着站起身，轻轻地悬停在你上方。[say:你知道吗，女王正急切地等待着见你。她能比我更好地照顾你，但如果你愿意的话，我想我们还是可以一起度过一些时光的。][pg]");
         outputText("你有些困惑地看着她，不确定她到底在告诉你什么。[say:傻男孩，我一直跟女王说我们见面的事，她很渴望接纳你进入蜂巢！]她走上前，把你的[armor]从你身上脱下来，轻轻地摩擦你的[cock]。[say:我告诉过你，只有蜂后才能帮你解决这么大的问题，你将能够用它填满她，并使她所有的卵受精。这就是你一直渴望的释放，来吧！][pg]");
         outputText("她的提议极大地引起了你的兴趣，你无法想象拒绝她，至少现在不能。曾经，你也许能够拒绝，但现在你有了这根蜜蜂肉棒，并且感受到了蜜蜂蜂蜜带给你的释放感，你根本无法拒绝。你急切地向蜂女点点头，并且[pg]");
         if(get_player().wings.type == 2)
         {
            outputText("展开你的翅膀。她牵起你的手，然后升入空中，带你回家。[pg]");
         }
         else
         {
            outputText("接过她递给你的特制蜂蜜，你一口气喝了下去。");
            if(get_player().wings.type == 0)
            {
               outputText("你的背部立刻开始发麻，一对蜜蜂翅膀在你身后长了出来，它们迅速变大，经过几次尝试性的拍打，你发现它们可以承受你的体重。");
            }
            else if(get_player().wings.type == 1)
            {
               outputText("你的翅膀一阵酥麻，然后突然变得更大了。你测试了一会儿，发现它们现在大到足以让你飞起来了！");
            }
            else
            {
               outputText("你的[wings]感到一阵瘙痒，然后完全脱落。不过你没多少时间去担心这个，因为几乎紧接着你就长出了一对巨大的蜜蜂翅膀，你用它们将自己升入空中。[pg]");
            }
            outputText("蜂女赞许地点点头，牵起你的手，你们俩飞向天空，侍女带领你前往你的新家。[pg]");
         }
         outputText("她带着你高高飞过树林，有那么一小会儿，你有机会观察下方森林蜿蜒曲折的景色。你对森林的观察并没有持续太久，因为对见到蜂后的期待很快就盖过了你的好奇心。你没有再去想这可能是你最后一次看到外面的世界。");
         doNext(beeDroneBadEndPart2);
      }
      
      public function beeAlternate() : void
      {
         spriteSelect(SpriteDb.get_s_bee_girl());
         var _loc1_:int = get_player().biggestCockIndex();
         var _loc2_:int = get_player().biggestCockIndex2();
         clearOutput();
         if(Utils.rand(2) == 0)
         {
            outputText("晕头转向的蜂女踉跄了一下，你抓住她毒刺上方的腹部。把它高高举起，你强迫她跪下，然后把她弯下来，让她的触角垂到地上。你使出浑身解数，强迫她把毒刺刺进自己的肩膀。蜂女疯狂地挣扎了一会儿，然后呻吟起来，因为你强迫她注射到自己体内的毒液开始生效了。她的动作变得不那么疯狂，而是更加放荡，浓稠的花蜜开始从她暴露的小穴里流出来，有些滴到了她的大腿内侧。");
            outputText("[pg]");
            if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("你解开[armor]，释放出你的肉棒。最大的那根——一根触手——向蜂女的小穴伸去，显然渴望将自己沉入她温暖、粘稠的深处。你把它拿在手里，引导蘑菇状的龟头抵住她撅起的下唇。蜂女喘息着扭动着，她的动作显然更多的是渴望和屈辱，而不是任何认真的逃跑尝试。你拖着触手肉棒宽大的头部上下移动，在释放它之前收集了一层厚厚的花蜜。你的肉棒紧贴着她的褶皱，然后随着你向前推臀部慢慢沉入，当你感觉到她的温暖包围着你时，你幸福地叹了口气。她呻吟着，把背拱得更高，她的触角顺从地下垂，因为你灵活的阴茎在她体内蠕动，撑开她紧致的小通道，不放过任何一个角落和缝隙。");
            }
            if(get_player().hasKnot(_loc1_))
            {
               outputText("你解开[armor]，释放出你的肉棒。把最大的那根拿在手里，你抚摸着你的[cock]，直到它足够坚挺，然后把[cockhead]压在她的阴蒂上，戏弄着那个小肉核。蜂女喘息着扭动着，把她现在撅起的阴蒂推回你身上。你把尖端向上拖，一边走一边收集花蜜，直到到达她的开口，然后用臀部抽插。她的阴唇急切地分开，你发现她很紧，但很欢迎你。尽管如此，尽管你很想放纵地操这个女孩，你还是忍住了，从来没有让你的肉结沉入她体内。");
            }
            if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("你解开[armor]，释放出你的肉棒。最大的那根马茎已经流出了先列腺液，你欣赏着无助、扭动的蜂女。像挥舞鞭子一样挥舞着它，你打她的屁股，让女孩尖叫起来，并在她的屁股球体上留下粘稠的先列腺液痕迹。你咧嘴笑着，把你的肉棒在她的小穴上来回拖动，在她的花蜜中润滑它。最后，你把尖端压在她的开口上。对你来说，她很紧，当你的肉棒无情地撑开她的小穴时，她尖叫得更响了。");
            }
            if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON || get_player().cocks[_loc1_].get_cockType().get_Index() > 4)
            {
               outputText("你解开[armor]，释放出你的肉棒。最大的那根龟头已经流出了先列腺液，你欣赏着无助、扭动的蜂女。引导它向前，你打她的屁股，让女孩尖叫起来，并在她的屁股球体上留下粘稠的先列腺液痕迹。你咧嘴笑着，把你的肉棒在她的小穴上来回拖动，在她的花蜜中润滑它。最后，你把尖端压在她的开口上。对你来说，她很紧，当你的肉棒无情地撑开她的小穴时，她尖叫得更响了。");
            }
            get_images().showImage("beegirl-win-male");
            outputText("你享受着让女孩放松并探索她小穴深处的过程，慢慢来。最终，你把自己从她体内抽出来，你的" + get_player().cockDescript(_loc1_) + "伴随着湿润的吸溜声逃脱，在它的尾流中拖出一条浓稠的花蜜。花点时间检查你的杰作，你看到她的小穴放荡地张开，被你的肉棒撑得变形了。");
            outputText("[pg]");
            outputText("把你稍微小一点的" + get_player().cockDescript(_loc2_) + "拿在手里，你把它滑进去作为替代。可怜的亲爱的，她不像以前那么紧了，但和你第一根" + get_player().cockDescript(_loc1_) + "一样温暖，而且滑了两倍。你较大的" + get_player().cockDescript(_loc1_) + "沿着她的屁股一侧滑动，用她的花蜜把那里黑黄相间的" + (get_noFur() ? "皮肤" : "皮毛") + "涂满并压平。但这还不够令人满意，低头看去，你注意到她后面有一个洞没有被使用。");
            outputText("再次从她体内退出，你把你最大的" + get_player().cockDescript(_loc1_) + "的尖端抵在她的屁眼上。当你压在她的括约肌上时，她尖叫着反抗，但没过多久，那圈肌肉就投降了，你浸满花蜜的" + get_player().cockDescript(_loc1_) + "滑入了她的身体。她在屈辱中呜咽，双手抓着草地，移动臀部试图在你的粗壮周围找到更舒服的姿势。你在她屁股极其紧致的深处翻找，享受着她在你身下和周围移动和扭动的方式。");
            outputText("[pg]");
            outputText("几乎，但没有完全从她体内抽出来，你拿起你第二大的肉棒，把它放回她小穴的入口，然后用臀部抽插，把你最大的肉棒深深地沉入她的屁股，同时再次刺穿她，把你的" + get_player().cockDescript(_loc2_) + "埋在她的阴道里。她大声尖叫，翅膀疯狂地拍打了一会儿，然后伴随着一声投降的呜咽完全瘫软下来。你咧嘴大笑，开始在她体内像活塞一样抽插，她欲望的甜美香气萦绕在你的鼻孔。对她下半身的掠夺让空气中充满了湿润的吸溜声，很快她就随着每一次抽插呻吟起来，触角因需要而颤抖。");
            outputText("你感觉到肉棒里传来一阵令人愉悦的悸动，于是你加倍努力，每一次抽插都更加用力地操她，直到伴随着一声释放的喘息，你弓起背，几乎把她推倒在草地上。你颤抖的肉棒在她深处抽搐，将你的精液灌满她的身体。蜂女发出一声颤抖的、嗡嗡的尖叫，然后瘫软在你身下，她颤抖的肌肉榨取着你的精液。你喘着粗气，从她现在大张的洞里滑了出来。这个可怜的小家伙似乎晕过去了；她瘫倒在一侧，你的精液从她抽搐的身体里流出来。你在她毛茸茸的大腿上把自己擦干净后，整理好衣服，开始搜寻蜂女可能带有的任何战利品。");
         }
         else
         {
            outputText("倒在地上后，蜂女在茫然的恐惧中抬起头，看着你露出你的[cocks]，她的眼睛注视着你因她脸上害怕和无助的表情而因欲望而跳动。");
            outputText("[pg]");
            outputText("一旦你靠得足够近，你就抓住她的胳膊，强行压在她身上，移动膝盖分开她的双腿。你的" + get_player().multiCockDescriptLight() + "拍打在她略微湿滑的" + Appearance.vaginaDescript(get_monster(),0) + "上。面对这意想不到的触碰，她的脸上闪过一丝介于恐惧和兴趣之间的神情，尽管这种兴趣并没有阻止她勇敢地挣扎，试图逃离你。最后，你把她的手臂按在地上，把她张得足够大，用你的一根[cocks]刺穿她的" + Appearance.vaginaDescript(get_monster(),0) + "，同时看着她的脸因享受和痛苦的诱人混合而扭曲。当你开始猛烈撞击她时，她的挣扎减弱了，紧绷的腹部肌肉在你身下放松，她向后仰起头，在粗暴的插入下发出一声呜咽。");
            get_images().showImage("beegirl-win-male");
            outputText("起初，占有她让你感到非常满足，但当你看着她的脸随着你臀部每一次震撼身体的抽插而变得迷离时，一个念头闪过脑海。你抓住剩下的" + get_player().cockDescript(_loc2_) + "，将它推向已经插入的那根，在下一次抽插时，你将它们同时刺入。");
            if(get_player().averageCockThickness() > 2)
            {
               outputText("她的身体惊人地为你撑开，像老虎钳一样紧紧夹住你。你猜想，如果不是因为她奇特的身体构造，以及她不断流出的、涂满你全身的大量蜂蜜，你早就把她撕裂了。");
            }
            outputText("[pg]蜂女剧烈地颤抖着，发出嗡嗡声和呻吟声交织的尖叫，一股浓稠的蜂蜜喷溅在你的双茎上，让它们滑入得更加顺畅。她的手臂向上挥舞，一只手抓住你的肩膀，用力之大足以留下淤青，另一只手在你的手下扭动，身体在你身下紧绷。被两根" + get_player().multiCockDescriptLight() + "撑到极限，她的小穴像老虎钳一样紧紧夹住你，每一次抽插都肉眼可见地将她撑开。你抽插得越快，她就越湿润，当你占有她时，她的眼睛在你身下疯狂地闪烁，她的挣扎变成了迎合，下半身感激地向上挺起。你的[cocks]拍打并猛烈撞击着她饱受蹂躏的" + Appearance.vaginaDescript(get_monster(),0));
            if(get_player().balls > 0)
            {
               outputText("你的[balls]重重地撞击在她的腹部，发出响亮的拍打声，在周围的森林中回荡。");
            }
            else
            {
               outputText("。");
            }
            outputText("[pg]");
            if(int(get_player().cocks.length) >= 3)
            {
               outputText("当你猛烈地抽插时，你发现大量的汁液从她的" + Appearance.vaginaDescript(get_monster(),0) + "流出，漫过她的腹部，流向她毒刺根部附近的那个洞。带着邪恶的意图，你伸手抓住一根空闲的" + get_player().multiCockDescriptLight() + "，在向后拉扯臀部的同时，将它强行抵住她紧致的后穴。她瞪大眼睛看着你，重新开始挣扎，双腿向你踢去，翅膀带着坚定的决心拍打着地面，试图扭动着逃跑。你紧紧地抓住她，将臀部压向她，把你的" + get_player().multiCockDescriptLight() + "埋入她的体内。蜂蜜的流动几乎没有减少摩擦，你的" + get_player().cockDescript(2) + "[if (metric) {一点一点|一寸一寸}]地沉入她的后穴。她的" + Appearance.vaginaDescript(get_monster(),0) + "被撑得更大了，随着你每一次的抽插，她的后穴开始微微张开，她尖叫着，发出类似嗡嗡声的呻吟。花了一两分钟，你终于用全部三根[cocks]触底。[pg]");
            }
            outputText("操了她一会儿后，她嗡嗡的抱怨和疯狂的挣扎开始融化，她在你身上高潮了，颤抖着将臀部向上挺起，让你的" + get_player().cockDescript(_loc1_) + "更深地插入她体内。她开始达到高潮，每次被撑开的穴口紧紧夹住你时，她的肌肉就变得越来越放松。快感的浪潮开始淹没你，很快你就开始尽可能用力地操她，蜂蜜湿漉漉地溅在她的身上，她似乎终于在你的身体攻势下崩溃了。她的眼神肉眼可见地黯淡下来，嘴唇里隐约回荡着嗡嗡的欢愉声，身体在你身下完全瘫软。你没有停下来，继续占有她，最终感觉到精液在体内膨胀");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]");
            }
            else
            {
               outputText("你的前列腺");
            }
            outputText("当你深深刺入她体内时。你的释放量非常大，当你尽可能深地抽插时，浓稠的精液喷溅在她光滑的内壁上。");
            if(int(get_player().cocks.length) >= 3)
            {
               outputText("她饱受蹂躏的" + Appearance.vaginaDescript(get_monster(),0) + "紧紧地夹住你的双根[cocks]，尽可能地榨干你的每一滴精液。白色的河流开始从她被虐待的洞里流出，与她自己的分泌物混合在一起，顺着她的腹部流下，慢慢滴落到森林的地面上。");
               if(int(get_player().cocks.length) == 4)
               {
                  outputText("没有插入她体内的" + get_player().cockDescript(3) + "在你射精时疯狂地颤抖；你的精液喷射在她饱受蹂躏的身体上，给她涂上了一层白色。");
               }
               if(int(get_player().cocks.length) > 4)
               {
                  outputText("没有插入她体内的[cocks]在你射精时疯狂地颤抖；你的精液喷射在她饱受蹂躏的身体上，给她涂上了一层白色。");
               }
            }
            outputText("[pg]");
            outputText("当你伴随着一声呻吟从她体内拔出时，你们俩身上都散发着性爱的气味。你跪在她身上，用她未被玷污的嘴唇一根一根地擦干你的[cocks]。她的嘴唇本能地微微张开，你能感觉到她吞下了涂在你身上的精液。等她做完后，你迅速站起来，");
            if(!get_player().isTaur())
            {
               outputText("把你的[cocks]塞进你的[armor]里");
            }
            else
            {
               outputText("你那雄伟但疲惫的[cocks]在你的肚子下晃荡，");
            }
            outputText("然后把这个完全筋疲力尽、浑身湿透的女人留在森林的地面上，她的翅膀和腿还在微微抽搐，在周围的地面上喷洒出一层细细的精液薄雾。");
         }
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
         get_combat().cleanupAfterCombat();
      }
   }
}

