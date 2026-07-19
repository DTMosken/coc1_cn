package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Armor;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.forest._AkbalScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class AkbalScene extends BaseContent implements SelfDebug, SelfSaving, Encounter
   {
      
      public static var AKBAL_EVENTS_DONE:uint = 15;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var AKBAL_QUEST_STARTED:int;
      
      public var AKBAL_QUEST_DONE:int;
      
      public var AKBAL_QUEST_BADEND:int;
      
      public var AKBAL_EVENT_KITSUNE2:int;
      
      public var AKBAL_EVENT_KITSUNE1:int;
      
      public var AKBAL_EVENT_GOBLIN:int;
      
      public var AKBAL_EVENT_ALICE:int;
      
      public function AkbalScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "akbal";
         saveContent = new SaveContent(null,null);
         AKBAL_QUEST_DONE = 64;
         AKBAL_QUEST_BADEND = 32;
         AKBAL_EVENT_KITSUNE2 = 16;
         AKBAL_EVENT_KITSUNE1 = 8;
         AKBAL_EVENT_ALICE = 4;
         AKBAL_EVENT_GOBLIN = 2;
         AKBAL_QUEST_STARTED = 1;
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function topAkbitchFromDaBottom() : void
      {
         clearOutput();
         get_images().showImage("akbal-deepwoods-male-akbalonback");
         outputText("你咧嘴一笑，拉了拉阿克巴尔的项圈，他发出一声几乎无法抑制的呼噜声。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,902) == 1)
         {
            outputText("当你听到这意想不到的声音，意识到你已经把这个恶魔般的性掠食者变成了你个人的荡妇时，你[face]上的笑容变得更加灿烂。仿佛为了证实这一点，他");
         }
         else
         {
            outputText("他");
         }
         outputText("抬起尾巴，让你完美地看到他的整个胯部，从他自带润滑的括约肌到他饱满的睾丸，以及坚如磐石的恶魔猫阴茎。在欲望的驱使下，他的意志已经被打破，现在他是你的了。[pg]");
         if(get_player().isGoo())
         {
            outputText("你带着调皮的笑容躺在柔软的草地上。你用项圈把阿克巴尔猛拉向前，导致他的脸撞在你的[vagOrAss]上。瞬间，你整个身体感觉就像纯粹的狂喜之波在你体内倾泻。这种感觉以一种不可预测的模式达到顶峰并消退，你迷失在恶魔神秘唾液的感觉中，度过你的高潮，陶醉在他涂满那种奇妙唾液的舌头的热度中。当你再也受不了时，你把恶魔推倒仰面躺下，看着他那坚硬的工具一边漏出液体一边颤抖着指向天空。");
         }
         else
         {
            outputText("你手里拿着项圈躺在柔软的草地上。你双臂环抱你的[legs]，把它们举起来，给恶魔一个更容易的目标。轻轻一拉，恶魔就明白了暗示，把他的脸撞在你的[vagOrAss]上。当他的舌头掠过你的");
            if(get_player().hasVagina())
            {
               outputText("阴蒂");
            }
            else
            {
               outputText("前列腺");
            }
            outputText("让你感到一阵战栗。你的新玩具舔舐着你的[vagOrAss]，让你的[vagOrAss]变得湿润，一阵阵颤栗传遍全身。他的唾液似乎带有一种魔力，让你感受到一种近乎触电般的快感。当你再也无法忍受时，你将恶魔推倒仰面朝上，看着他那根颤抖的坚挺肉棒。");
         }
         outputText("[pg]被束缚的恶魔双腿蜷缩在腹部，他那长满倒刺的肉棒因期待而弯曲。你触摸它，感觉到自带润滑的恶魔肉棒的湿润感附着在你的手指上，同时你摸到了其中一根倒刺。它是海绵状的，柔软但又不过分柔软。当你挑逗他时，恶魔发出嘶嘶声，你的手指滑过覆盖在他坚硬如石的性器官上的橡胶状倒刺。当你开始将自己降到他颤抖的肉棒上时，恶魔开始发出呼噜声。");
         menu();
         addButton(0,"继续",topAkbitchFromBottomDuex);
      }
      
      public function topAkbitchFromBottomDuex() : void
      {
         var _loc1_:Boolean = false;
         clearOutput();
         get_images().showImage("akbal-deepwoods-male-akbalonback2");
         if(!get_player().hasVagina() && get_player().ass.analLooseness < 2 || get_player().hasVagina() && get_player().looseness() <= 2)
         {
            outputText("当你开始将自己刺入这根恶魔肉柱时，你喘息着，因为你的[vagOrAss]被阿克巴尔那相当巨大的恶魔猫肉棒撑得大大的。他留在你[vagOrAss]上的唾液残余物与那神秘的润滑液发生了反应，你本会感到的任何疼痛都消失了，取而代之的是令人大脑麻木的极乐。恶魔开始在你的[vagOrAss]里向上挺进，你情不自禁地允许了。这种感觉超越了狂喜——这是纯粹的愉悦，像鞭炮一样爆炸，像波浪一样穿透你的身体。很快，快感就达到了顶峰。");
         }
         else if(!get_player().hasVagina() && get_player().ass.analLooseness < 4 || get_player().hasVagina() && get_player().looseness() < 4)
         {
            outputText("当你将自己刺入恶魔那颤抖的肉棒时，一声呻吟从你的嘴里传出。当残留在你[vagOrAss]里的唾液接触到覆盖在他那长满倒刺的肉棒上的润滑液时，你眼冒金星。沉浸在这一刻，你无法相信有什么能感觉这么好。你在恶魔那该死的性器官的整个长度上起伏。这简直就像你在纯粹的极乐之柱上上下弹跳，就像你的整个存在都被纯粹的快乐所刺穿。很快，快感就达到了顶峰。");
         }
         else
         {
            outputText("当你顺着恶魔颤抖的肉棒滑下时，你翻了翻白眼。当覆盖在你[vagOrAss]上的恶魔唾液与他那长满倒刺的恶魔猫肉棒上的润滑液接触时，你无法相信有什么能感觉这么好。突然，你尽可能用力地弹跳着，而恶魔则向上挺进你的身体。你们的身体撞击在一起，在空地上回荡着雷鸣般的掌声，你尽可能用力地骑乘着他。他那带有螺纹和纹理的肉棒的尺寸和厚度，加上化学刺激物的结合，让你整个存在都在尖叫。你感觉自己仿佛溺水在狂喜中，仿佛一个无尽的天堂正在从你的[vagOrAss]里绽放。很快，快感就达到了顶峰。");
         }
         if(get_player().hasVagina())
         {
            get_player().cuntChange(new Akbal().cockArea(0),true,true,false);
         }
         else
         {
            get_player().buttChange(new Akbal().cockArea(0),true,true,false);
         }
         if(get_player().hasCock())
         {
            outputText("[pg]你用手握住肿胀的[oneCock]。你身体里的每一个神经末梢都在爆炸，因为");
            if(get_player().hasVagina())
            {
               outputText("你的两根");
            }
            outputText("性器官");
            if(get_player().hasVagina())
            {
               outputText("同时达到了高潮");
            }
            else
            {
               outputText("达到了高潮");
            }
            outputText("。你的[vagOrAss]在恶魔插入的肉棒周围痉挛，[eachCock]在他的胸膛和脸上涂抹了厚厚一层精液。你的高潮还在继续，将你的性液覆盖在恶魔猫身上，用比你想象的还要多的精液将他浸透。");
            _loc1_ = true;
         }
         else
         {
            outputText("[pg]当你在美洲豹身上抽搐时，你身体里的每一个神经末梢都在爆炸。伴随着沙哑的呻吟，你的[vagOrAss]开始在插入的快感之柱周围痉挛，喷涌出比你想象的还要多的液体。很快，美洲豹就被完全浸透了。");
         }
         outputText("[pg]你咧嘴笑着回头看你的新婊子，而他正在恢复理智。当你离开森林时，你听到阿克巴尔的合唱声中传来一个承诺，[say:你会后悔的……勇者。]");
         get_player().orgasm(_loc1_ ? "Anal" : "Vaginal");
         dynStats(DynStat.Cor(3));
         if(get_player().hasVagina())
         {
            get_player().knockUp(1,432,101);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeAdvantageOfAkbitch() : void
      {
         var ride5:Boolean;
         var _g5:AkbalScene;
         var ride4:Boolean;
         var _g4:AkbalScene;
         var ride3:Boolean;
         var _g3:AkbalScene;
         var ride2:Boolean;
         var _g2:AkbalScene;
         var ride1:Boolean;
         var _g1:AkbalScene;
         var ride:Boolean;
         var _g:AkbalScene;
         var _loc1_:* = null as Akbal;
         clearOutput();
         outputText("你蹑手蹑脚地绕到阿克巴尔所在空地周围的许多树木后面，直到你的目光偶然落在一根藤蔓上。它海绵状、很长，而且很难扯断——换句话说：完美。");
         if(!get_player().hasTailInsteadOfLegs())
         {
            outputText("[pg]你迈着无声的[feet]走向阿克巴尔，打了个结，把藤蔓变成套索。");
         }
         else
         {
            outputText("[pg]你无声无息地滑向你的猎物，打了个结，把藤蔓变成套索。");
         }
         outputText("[pg]一旦进入射程，你便拿起藤蔓，咆哮着扑向毫无防备的恶魔背部。");
         if(get_player().get_str() < 50)
         {
            outputText("[pg]一团绿色的火焰咆哮着出现。突如其来的高温让你从几乎要吞噬你[face]的炼狱中退缩。美洲豹挣脱了你的抓捕，当你抬起头时，另一个绿色火球正朝你飞来。看来你有一场硬仗要打了。[pg]");
            _loc1_ = new Akbal();
            startCombat(_loc1_);
            _loc1_.akbalSpecial();
            return;
         }
         outputText("[pg]一团绿色的火焰咆哮着出现。你毫不费力地将阿克巴尔的头按在地上。翠绿色的火柱在森林地面上咆哮，只烧毁了植被和虫子。你用身体和一只手将他按住，同时抓起藤蔓。把恶魔的腿绑在一起后，你很容易就能在力量上压倒他。你几乎可以无视他不断挣扎、试图把你甩开的举动，将他死死按住。");
         if(get_player().get_inte() < 60)
         {
            outputText("[pg]阿克巴尔突然停止了挣扎，你听到有人在喊你的名字。当你移开视线时，阿克巴尔从你身下滚了出来。一阵地火点燃了藤蔓，他伸出爪子向你扑来。[pg]");
            startCombat(new Akbal());
            get_monster().eAttack();
            return;
         }
         outputText("[pg]阿克巴尔突然停止了挣扎，你听到有人在喊你的名字。你笑了，知道这声音是阿克巴尔试图分散你注意力的把戏。你无视他绝望的策略，抓住这只恶魔豹，将他摔在地上。他挣扎着，你再次将他按下。在发了一通脾气、咒骂了一番之后，他瘫软下来。他接受了自己的命运，让你继续。他的腿还被绑着，你把一部分藤蔓像项圈一样绑在他的脖子上，剩下的部分从主体上垂下来，就像一条皮带。这会很有趣的。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,902,FlagDict_Impl_.arrayReadInt(_loc2_,902) + 1);
         menu();
         addButtonDisabled(0,"操他","这个场景需要你有一根阴茎。");
         addButtonDisabled(1,"力量.操","这个场景需要你有一根阴茎和极高的力量。");
         addButtonDisabled(6,"力量.骑乘","这个场景需要你有极高的力量。");
         addButtonDisabled(2,"高速操","这个场景需要你拥有肉棒和极高的速度。");
         addButtonDisabled(7,"速度.骑乘","这个场景需要你有极高的速度。");
         addButtonDisabled(3,"体质.操","这个场景需要你有阴茎和极高的体质。");
         addButtonDisabled(8,"体质.骑乘","这个场景需要你有极高的体质。");
         if(get_player().hasCock())
         {
            addButton(0,"操他",buttFuckbuttFuckbuttFuckAkbal);
         }
         addButton(5,"骑乘他",topAkbitchFromDaBottom);
         if(get_player().get_str() >= 70)
         {
            if(get_pc().hasCock())
            {
               _g = this;
               ride = false;
               addButton(1,"力量.操",function():void
               {
                  _g.akbitchHighStrengthVariant(ride);
               }).hint("用你的阴茎强行操他。");
            }
            _g1 = this;
            ride1 = true;
            addButton(6,"力量.骑乘",function():void
            {
               _g1.akbitchHighStrengthVariant(ride1);
            }).hint("强行骑乘他的阴茎。");
         }
         if(get_player().get_spe() >= 70)
         {
            if(get_pc().hasCock())
            {
               _g2 = this;
               ride2 = false;
               addButton(2,"速度.操",function():void
               {
                  _g2.akbalBitchSpeed(ride2);
               }).hint("用你的阴茎猛烈地操他。");
            }
            _g3 = this;
            ride3 = true;
            addButton(7,"速度.骑乘",function():void
            {
               _g3.akbalBitchSpeed(ride3);
            }).hint("猛烈地骑乘他的阴茎。");
         }
         if(get_player().get_tou() >= 70)
         {
            if(get_pc().hasCock())
            {
               _g4 = this;
               ride4 = false;
               addButton(3,"体质.操",function():void
               {
                  _g4.akbitchToughness(ride4);
               }).hint("用你的阴茎彻底地操他。");
            }
            _g5 = this;
            ride5 = true;
            addButton(8,"体质.骑乘",function():void
            {
               _g5.akbitchToughness(ride5);
            }).hint("彻底地骑乘他的阴茎。");
         }
      }
      
      public function superAkbalioTalk() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         clearOutput();
         outputText("沉默片刻后，你问道：[say: 你说的“臣服”是什么意思？] 阿克巴尔咧嘴一笑，张开嘴时露出一排邪恶的象牙色牙齿。你突然感觉到恶魔强壮的身体将你按倒在地，宽大的舌头舔舐着你的脖子，爪子在你的背上挠痒痒，这种感觉既令人恐惧又充满肉欲。然而，在接受了这一切片刻之后，你意识到他仍然站在你面前，一动不动地咧嘴笑着。你能猜到这个画面的含义：他想让你做他一天的伴侣，以弥补你入侵他领地的过错。你该怎么做？[pg]");
         menu();
         addButton(0,"战斗",startuAkabalFightomon);
         addButton(1,"臣服",akbalSubmit);
      }
      
      public function startuAkabalFightomon() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         clearOutput();
         outputText("你准备好你的[weapon]，准备与恶魔美洲豹战斗。");
         startCombat(new Akbal());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,15,FlagDict_Impl_.arrayReadInt(_loc1_,15) + 1);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.timesRaped = 0;
         saveContent.strayCat = false;
      }
      
      public function repeatAkbalPostSubmission() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         clearOutput();
         outputText("当你穿过森林时，你听到身后传来一阵呼噜声。转过身来，你发现阿克巴尔来找你了。他用头把你推向他领地的方向，显然是想再次支配你。[pg]");
         outputText("你该怎么做？");
         menu();
         addButton(0,"臣服",akbalSubmit);
         addButton(1,"拒绝",akbalDeny);
         addButton(4,"战斗",startuAkabalFightomon);
      }
      
      public function rapeAkbalForcedFemaleOral() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,903,FlagDict_Impl_.arrayReadInt(_loc1_,903) + 1);
         clearOutput();
         if(get_player().hasTailInsteadOfLegs())
         {
            get_images().showImage("akbal-deepwoods-naga-forcedfemaleoral");
            outputText("你滑行着缠绕住这只恶魔猫的身体，将他紧紧包裹，直到他喉咙里发出一声恐惧的呜咽。[if (isMer) {美丽的鳞片尽可能温柔地压在他身上，几乎带着一种深情的温柔|蛇形的盘绕紧紧勒住阿克巴尔，直到他喘不过气来}]。你问他是否愿意为你做一个乖巧的小恶魔。他点了点头。[pg]");
            outputText("当你松开盘绕的身体时，你不禁碰到了阿克巴尔那根像漏水水龙头一样黏糊糊的肉棒。在你的命令下，他抬起后臀，让你能完美地看到他低垂的睾丸和包皮。你绕过他毛茸茸的球体，将他肿胀的阴茎向后拉，直到这只美洲豹[if (metric) {40厘米|15英寸}]长的肉棒完全显露出来。[pg]");
            outputText("当你看到他那不断渗出先列腺液的龟头周围长着几根邪恶的倒刺时，你瞪大了眼睛。你没有去处理这根看起来像是为了惩罚罪人而生的巨大肉棒，而是滑到了这只生物的面前。[pg]");
            outputText("你的气味让阿克巴尔胸腔里发出的低吼声变得颤抖起来。你躺在他面前，伸手将他的脸按进你的[vagina]里。这只恶魔无法摆脱他那令人虚弱的性唤起，开始舔舐你的[vagina]。他把脸贴在你的[vagina]上，扭动着嘴唇，将舌头钻进你的体内，无情地攻击着你的[clit]，让你在狂喜中尖叫、嚎叫和战栗。[pg]");
            outputText("他开始抬起头，可能是想爬到你身上来满足他的欲望，但你强行把他的脸按回你的[vagina]里。在你放话告诉他，他必须让你高潮，否则就把他的头拧下来之后，阿克巴尔发出了呜咽声，显然因为无法将他那根胀痛的肉棒插进你的[vagina]而感到痛苦。[pg]");
         }
         else if(get_player().isTaur())
         {
            get_images().showImage("akbal-deepwoods-taur-forcedfemaleoral");
            outputText("你粗暴地抓住恶魔的后颈，朝着他的肚子狠狠地打了一拳，让他痛得大叫起来。[pg]");
            outputText("当你把阿克巴尔推倒在森林的地上时，他发出了咆哮。你低头看着他，已经完全准备好要随心所欲地玩弄他的恶魔肉棒了。但你所看到的景象让你的[vagina]不禁一缩，你不敢想象如果你输了，这只恶魔用那玩意儿对付你会发生什么。[pg]");
            outputText("阿克巴尔双腿间那根巨大肉棒的龟头上布满了十几个微小的倒刺，看起来就像是为了惩罚罪人而生的。[pg]");
            outputText("你绕着这只生物走了一圈，因为无法蹲坐在这根大得离谱的恶魔猫肉棒上而感到恼火。当你走到他的另一侧时，你把后臀坐在了他的脸上。[pg]");
            outputText("阿克巴尔起初发出了一声沉闷的叫声，但很快他就明白了你的意思。他的舌头滑进了你的[vagina]。你稍微抬起了一点身子；好吧……你稍微向前倾了倾，好让这只美洲豹能喘口气。事实证明这是一个正确的选择，因为阿克巴尔对你的[vagina]如饥似渴。[pg]");
            outputText("他将舌头钻进你的体内，无情地攻击着你的[clit]，让你在狂喜中尖叫、嚎叫和战栗。他开始抬起头，可能是想把你身体的重量从他的脸上移开，但你一把抓住了他那毛茸茸的娇嫩睾丸，迫使他在你做出什么过激举动之前停了下来。[pg]");
            outputText("在你放话告诉他，他必须让你高潮，否则就把他的头拧下来之后，阿克巴尔发出了呜咽声，显然因为无法将他那根胀痛的肉棒插进你的[vagina]而感到痛苦。[pg]");
         }
         else
         {
            get_images().showImage("akbal-deepwoods-forcedfemaleoral");
            outputText("你粗暴地抓住恶魔的后颈，对着他的肚子狠狠地打了一拳，让他痛苦地叫了出来。");
            outputText("当你把阿克巴尔的脸按在地上时，他发出了闷哼。在你的命令下，他抬起后臀，让你能完美地看到他低垂的睾丸和包皮。你绕过他毛茸茸的球体，将他肿胀的阴茎向后拉，直到这只美洲豹[if (metric) {40厘米|15英寸}]长的肉棒完全显露出来。[pg]");
            outputText("当你看到他那不断渗出先列腺液的龟头周围长着几根邪恶的倒刺时，你瞪大了眼睛。你没有去处理这根看起来像是为了惩罚罪人而生的巨大肉棒，而是绕到了这只生物的面前。[pg]");
            outputText("你的气味让阿克巴尔的低吼声变得颤抖起来。你躺在他面前，抓住他的头，将他的脸按进你的[vagina]里。这只恶魔无法摆脱他那令人虚弱的性唤起，开始舔舐你的[vagina]。他扭动着嘴唇，将舌头钻进你的体内，无情地攻击着你的[clit]，让你在狂喜中尖叫、嚎叫和战栗。他开始抬起头，可能是想爬到你身上，但你强行把他的脸按回你的[vagina]里。在你放话告诉他，他必须让你高潮，否则就把他的头拧下来之后，阿克巴尔发出了呜咽声，显然因为无法将他那根胀痛的肉棒插进你的[vagina]而感到痛苦。[pg]");
         }
         outputText("伴随着施虐般的笑声，你享受着高潮，直到你瘫软成一团颤抖的肉泥。恢复过来后，你穿好[armor]，留下阿克巴尔在你身后痛苦地呻吟。他一边抓挠着地面一边嚎叫，身下那根带刺的肉棒依然坚硬如铁。就在你准备离开时，你注意到一群小恶魔正在注视着你和这只美洲豹，他们掏出肉棒，渗出淫液，参差不齐的牙齿咧开，露出野性的笑容。你甚至看到人群中混杂着几只地精，每只都转动着一瓶液体，玩弄着自己的小穴。[pg]");
         outputText("当你离开时，阿克巴尔发出了咆哮，那些曾经惧怕他的生物正利用他发情的状态来报复这位地狱之火的“神明”。即使你已经走到了森林的边缘，依然能听到这只美洲豹恶魔痛苦的嚎叫声，尽管这声音几乎被小恶魔尖锐的笑声和地精的咯咯笑声所淹没。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeAkbal() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,903,FlagDict_Impl_.arrayReadInt(_loc1_,903) + 1);
         var _loc2_:int = get_player().cockThatFits(50);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         clearOutput();
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你滑行着缠绕住这只恶魔猫的身体，将他紧紧包裹，直到他喉咙里发出一声恐惧的呜咽。[if (isMer) {美丽的鳞片尽可能温柔地压在他身上，几乎带着一种深情的温柔|蛇形的盘绕紧紧勒住阿克巴尔，直到他喘不过气来}]。你问他是否愿意为你做一个乖巧的小恶魔。他点了点头。[pg]");
            get_player().orgasm("Dick");
            get_images().showImage("akbal-deepwoods-male-naga-rapeakbal");
            if(get_player().cocks[_loc2_].cockLength <= 7)
            {
               outputText("当你松开盘绕的身体时，你不禁碰到了阿克巴尔那根像漏水水龙头一样黏糊糊的肉棒。在你的命令下，他抬起后臀，让你能完美地看到他紧闭的后穴。从外观上看，似乎从来没有任何东西触碰过那紧紧封闭的边缘。首先，你用手指戳了戳它，这种感觉让阿克巴尔不禁退缩。你握住你的" + get_player().cockDescript(_loc2_) + "，毫不犹豫、毫不留情地插了进去。那如处子般紧致的穴口紧紧夹住，当你强行撑开他时，阿克巴尔痛苦地嘶嘶作响。没过多久，你就开始在恶魔的后穴里用力抽插你的" + get_player().cockDescript(_loc2_) + "，享受着它在你插入的" + get_player().cockDescript(_loc2_) + "周围颤抖和蠕动的感觉。[pg]");
            }
            else if(get_player().cocks[_loc2_].cockLength <= 12)
            {
               outputText("当你松开盘绕的身体时，你不禁碰到了阿克巴尔那根像漏水水龙头一样黏糊糊的肉棒。在你的命令下，他抬起后臀，让你能完美地看到他紧闭的后穴。从外观上看，似乎从来没有任何东西触碰过那紧紧封闭的边缘。你用手指轻轻一敲，那个小小的穴口就因为恐惧而收缩，阿克巴尔的整个身体都从你身边退缩开来。你带着残忍的微笑抓住了你的" + get_player().cockDescript(_loc2_) + "。[pg]");
               outputText("当你把你的" + get_player().cockDescript(_loc2_) + "塞进他紧致的后庭时，你毫不意外地发现你的" + get_player().cockDescript(_loc2_) + "几乎无法突破那紧闭的肉壁。你费力地闷哼着，缓慢地向前推进，阿克巴尔在你身下嚎叫扭动，你完全不顾及他的感受，强行占有了他。[pg]");
               outputText("在几十次极其缓慢的抽插之后，阿克巴尔的后庭开始变得松弛，你开始用力地在他的小穴里进进出出，这只恶魔猫的嚎叫声也从痛苦变成了愉悦。[pg]");
            }
            else
            {
               outputText("当你舒展开身体时，你忍不住碰到了阿克巴尔那根滑腻漏液的肉棒。在你的命令下，他抬起后半身，让你能完美地看到他紧致的后庭。只需看一眼，你就知道你的" + get_player().cockDescript(_loc2_) + "根本塞不进去……但你什么时候因为这个就放弃尝试过？[pg]");
               outputText("当你用一根手指滑过他那如处子般紧致的小穴时，阿克巴尔退缩了，原本就紧致的小穴因为恐惧而紧紧闭合。[pg]");
               outputText("你把阿克巴尔的尾巴攥在手里扭动，听到美洲豹喉咙里发出恐惧的呜咽声，你忍不住笑了起来。你一手拉着阿克巴尔的尾巴，另一手开始把你的巨大肉棒推入。当你侵入他紧缩的括约肌时，这只野兽发出呜咽和嚎叫，你的" + get_player().cockDescript(_loc2_) + "强行将他紧致粉嫩的小穴撑大到了危险的程度。很快你就被卡住了，你巨大的肉棒只能勉强塞进阿克巴尔那如处子般紧致的小穴里一英尺多一点。你觉得这样就够了，于是拔出来再往前推，却遇到了和之前一样的阻力。[pg]");
               outputText("在经过几个小时的抵抗和嚎叫后，阿克巴尔的身体颤抖着，他的后穴因为彻底的精疲力竭而放松下来。与你巨大的肉棒搏斗似乎让他几乎昏厥，他再也没有力气反抗你了。随着你开始毫无润滑、毫不留情地猛烈抽插，这只美洲豹的身体随着你的每一次挺进都在抽搐。[pg]");
            }
            outputText("你以不断增加的力度强暴着美洲豹紧致的小穴，你的[hips]以火车头般的冲力撞击着他的身体，让他大声哭喊。尽管如此，他那[if (metric) {40厘米|15英寸}]肿胀的性器官在他身下喷出先列腺液，让你知道他的痛苦中混合着大量不情愿的快感。[pg]");
            if(get_player().cumQ() > 1000)
            {
               outputText("阿克巴尔颤抖的小穴那令人窒息的紧致感将你推向了高潮的边缘，伴随着一声震天动地的嚎叫，你开始在他的体内喷射。美洲豹也爆发了，他的身体随着你仍在抽插的[cock]的节奏而抽搐。[pg]");
               outputText("当你的肉棒继续将成吨的液体泵入美洲豹体内时，你将仍在肿胀的性器官在他体内研磨，在你们俩身下，他的肚子因为被灌满而开始鼓起。当你巨大的高潮消退时，你拔了出来，释放出如洪水般汹涌的浓稠精液，顺着他的腿流下，在森林的地面上形成了一个大水坑。阿克巴尔松了一口气，显然很高兴你终于结束了对他的强暴。[pg]");
            }
            else
            {
               outputText("阿克巴尔颤抖的小穴那令人窒息的紧致感将你推向了高潮的边缘，伴随着一声震天动地的嚎叫，你开始在他的体内喷射。在你身下，阿克巴尔也迎来了高潮，当你继续在他高潮时操弄他时，美洲豹瘫软了下来。当你拔出时，你朝着阿克巴尔现在非常娇嫩的屁股拍了一巴掌，你这突如其来的一击让他痛呼出声。[pg]");
            }
            outputText("当你站起来时，你收集好你的[armor]，转身离开这个虚弱的恶魔。就在你开始走开的时候，你注意到一群小恶魔在看着你和美洲豹，他们的肉棒露在外面，还在滴着液体。混在人群中的还有几个地精，每个人都拿着一瓶液体，脸上带着恶意的笑容。[pg]");
            outputText("当你离开时，阿克巴尔发出咆哮，因为那些曾经惧怕他的生物利用他虚弱的状态，向这位地狱之火的“神明”展开报复。即使你已经走到了森林的边缘，美洲豹恶魔痛苦的咆哮声依然隐约可闻，只是勉强盖过了恶魔小鬼尖锐的笑声和雌性地精的咯咯笑声。");
            dynStats(DynStat.Cor(1));
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().isTaur())
         {
            outputText("你粗暴地抓住恶魔的后颈，朝着他的肚子狠狠地打了一拳，让他痛苦地叫出声来。[pg]");
            outputText("[say:现在谁要屈服了……婊子？][pg]");
            get_player().orgasm("Dick");
            get_images().showImage("akbal-deepwoods-male-taur-rapeakbal");
            if(get_player().cocks[_loc2_].cockLength <= 7)
            {
               outputText("当你把阿克巴尔按倒在一根圆木上时，他发出可怜的咆哮。一想到要挫挫这个“神明”的锐气，你的" + get_player().cockDescript(_loc2_) + "就忍不住漏出液体。在你的命令下，他拱起背，翘起尾巴，让你能完美地看到他紧致的后庭。只需看一眼，你就知道那紧闭的边缘似乎从未被触碰过。当你用手指轻轻敲击时，它退缩了，随着阿克巴尔的身体因恐惧而后退，它变得更加紧致。[pg]");
               outputText("你后腿直立，站立了片刻，然后前腿落到地上，阿克巴尔的头夹在你的前腿之间，他的皮毛摩擦着你的肚子。你试探性地抽插了几下。第一下让你的" + get_player().cockDescript(_loc2_) + "滑上了阿克巴尔翘起的屁股，让他瑟缩了一下。然而，第二下，进去了。[pg]");
               outputText("那如处子般紧致的小穴紧紧闭合，当你强行撑开他时，阿克巴尔痛苦地嘶嘶作响。没过多久，你就在这只恶魔如处子般紧致的小穴里进进出出，享受着它在你埋入的" + get_player().cockDescript(_loc2_) + "周围颤抖和蠕动的感觉。阿克巴尔喉咙里发出的声音多种多样，但其中包括许多不情愿的愉悦呻吟。他显然比他愿意承认的更喜欢这样。[pg]");
            }
            else if(get_player().cocks[_loc2_].cockLength <= 12)
            {
               outputText("当你把阿克巴尔按倒在一根圆木上时，他发出可怜的咆哮。一想到要挫挫这个“神明”的锐气，你的" + get_player().cockDescript(_loc2_) + "就忍不住漏出液体。在你的命令下，他拱起背，翘起尾巴，让你能完美地看到他紧致的后庭。只需看一眼，你就知道那紧闭的边缘似乎从未被触碰过。当你用手指轻轻敲击时，它退缩了，随着阿克巴尔的身体因恐惧而后退，它变得更加紧致。[pg]");
               outputText("你后腿直立，站立了片刻，然后前腿落到地上，阿克巴尔的头夹在你的前腿之间，他的皮毛摩擦着你的肚子。你试探性地抽插了几下。第一下让你的" + get_player().cockDescript(_loc2_) + "滑上了阿克巴尔翘起的屁股，让他瑟缩了一下。然而，第二下，进去了。[pg]");
               outputText("当你把你的" + get_player().cockDescript(_loc2_) + "向前塞进他如处子般紧致的后庭时，你毫不意外地发现你的" + get_player().cockDescript(_loc2_) + "几乎无法突破那紧闭的肉壁。你费力地闷哼着，缓慢地向前推进，阿克巴尔在你身下嚎叫扭动，你完全不顾及他的感受，强行占有了他。[pg]");
               outputText("在经过十几次极其缓慢的抽插后，阿克巴尔的后穴开始变得松弛，你开始用力地将你的" + get_player().cockDescript(_loc2_) + "在他的小穴里进进出出。这只恶魔猫的嚎叫声从痛苦变成了愉悦，显然他比自己愿意承认的更享受这场后庭强暴。[pg]");
            }
            else
            {
               outputText("当你把阿克巴尔按倒在一根圆木上时，他发出了可怜的咆哮。一想到要把这个“神”拉下神坛，你的" + get_player().cockDescript(_loc2_) + "就渗出了液体。在你的命令下，他弓起背，翘起尾巴，让你能完美地看到他紧致的小穴。从外观上看，似乎从来没有任何东西触碰过那紧紧闭合的边缘。当你用手指轻轻敲击它时，它退缩了，随着阿克巴尔的身体因恐惧而后退，它变得更加紧致。你的" + get_player().cockDescript(_loc2_) + "绝对不可能塞进这么紧的东西里，但是……你什么时候因为这个停下过脚步？[pg]");
               outputText("你后腿直立，站立了片刻，然后前腿落到地上，阿克巴尔的头夹在你的前腿之间，他的皮毛摩擦着你的肚子。你试探性地抽插了几下。第一下让你的" + get_player().cockDescript(_loc2_) + "滑上了阿克巴尔翘起的屁股，让他瑟缩了一下。然而，第二下，进去了。[pg]");
               outputText("恶魔哀嚎着，将爪子抓进泥土里，试图挣脱你" + get_player().cockDescript(_loc2_) + "带来的灼热压力。当你侵入他紧绷的括约肌，强行将阿克巴尔紧致粉嫩的小洞撑大到危险的程度时，他的声音都变调了。很快你就停了下来，你巨大的肉棒只能勉强塞进阿克巴尔那宛如处子般紧致的小洞里不到一英尺。觉得这样就足够了，你拔出来，然后再次向前推进，遇到了和之前一样的阻力。[pg]");
               outputText("你咧嘴一笑，意识到这可能需要一段时间……[pg]");
               outputText("在经过几个小时的抵抗和嚎叫后，阿克巴尔的身体颤抖着，他的后穴因为彻底的精疲力竭而放松下来。与你巨大的肉棒搏斗似乎让他几乎昏厥，他再也没有力气反抗你了。随着你开始毫无润滑、毫不留情地猛烈抽插，这只美洲豹的身体随着你的每一次挺进都在抽搐。[pg]");
            }
            outputText("你以不断增加的力量强暴着美洲豹紧致的小洞，你的身躯像货运列车一样撞击着他瑟缩的身体，让他随着你的闷哼声大叫。尽管如此，他那肿胀的[if (metric) {40厘米|15英寸}]性器官在他身下分泌着先列腺液，让你知道他的痛苦中混合着大量不情愿的快感。[pg]");
            if(get_player().cumQ() > 1000)
            {
               outputText("阿克巴尔颤抖的小洞那令人窒息的紧致感将你推向了高潮，伴随着一声巨大的嚎叫，你开始在他的体内喷射。阿克巴尔突然收紧的括约肌让你知道他也达到了高潮。");
               outputText("你继续将你仍然肿胀的性器官滑入他颤抖的小洞，同时将成吨的液体泵入这个伪神的胃和肠道。在你们俩身下，他的肚子开始鼓起来，因为他被填满到了危险的程度。");
               outputText("一旦你巨大的高潮平息，你拔了出来，释放出如洪水般倾泻而下的浓稠精液，顺着他的腿流下，在森林的地面上形成了一个大水坑。阿克巴尔松了一口气，显然很高兴你终于强暴完他了。[pg]");
            }
            else
            {
               outputText("阿克巴尔颤抖的小洞那令人窒息的紧致感将你推向了高潮，伴随着一声巨大的嚎叫，你开始在他的体内喷射。阿克巴尔突然收紧的括约肌让你知道他也达到了高潮。当你继续在他高潮时抽插他时，美洲豹的身体变得瘫软。当你拔出来时，你瞄准阿克巴尔现在非常娇嫩的屁股拍了一巴掌，让你意想不到的打击让他发出一声尖叫。[pg]");
            }
            outputText("当你站起来时，你收集好你的[armor]，转身离开这个虚弱的恶魔。就在你开始走开的时候，你注意到一群小恶魔在看着你和美洲豹，他们的肉棒露在外面，还在滴着液体。混在人群中的还有几个地精，每个人都拿着一瓶液体，脸上带着恶意的笑容。[pg]");
            outputText("当你离开时，阿克巴尔发出了咆哮，因为曾经害怕他的生物利用他虚弱的状态向这个地狱之火的“神”复仇。即使你已经到达了森林的边缘，美洲豹恶魔痛苦的咆哮声仍然可以听到，但只是勉强盖过了恶魔小鬼尖锐的笑声和雌性地精的咯咯笑声。[pg]");
            dynStats(DynStat.Cor(1));
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("你粗暴地抓住恶魔的后颈，对着他的肚子狠狠地打了一拳，让他痛苦地叫了出来。");
         outputText("[pg][say: 现在谁要屈服了，婊子？][pg]");
         get_player().orgasm("Dick");
         get_images().showImage("akbal-deepwoods-male-rapeakbal");
         outputText("当你把阿克巴尔的脸按在地上时，他闷哼了一声。在你的命令下，他抬起后半身，让你能完美地看到他紧致的小穴。从外观上看，他那紧紧闭合的边缘看起来就像个处子。[pg]");
         if(get_player().cockArea(0) < 13)
         {
            outputText("你先用手指戳了戳它，让阿克巴尔对这种感觉感到退缩。你把你的" + get_player().cockDescript(0) + "拿在手里，毫不犹豫、毫不留情地塞了进去。那宛如处子般的小洞紧紧闭合，当你强行撑开他时，阿克巴尔痛苦地嘶嘶作响。没过多久，你就在恶魔紧致的小洞里进进出出地抽插着你的" + get_player().cockDescript(0) + "，享受着它在你插入的[cock]周围颤抖和蠕动的方式。[pg]");
         }
         else if(get_player().cockArea(0) < 25)
         {
            outputText("你用手指轻轻一敲，那个小洞就收缩了，阿克巴尔的整个身体都因恐惧而退缩。你带着残忍的微笑抓住了你的" + get_player().cockDescript(0) + "。当你把自己塞进他紧致的小穴时，你并不惊讶地发现你的[cock]几乎无法突破那紧紧闭合的肉壁。你吃力地闷哼着，慢慢地向前挪动，阿克巴尔在你身下嚎叫着、扭动着，因为你完全不顾及他的快感而占有了他。[pg]");
            outputText("在经过十几次极其缓慢的抽插后，阿克巴尔的后穴开始变得松弛，你开始用力地将你的[cock]在他的小穴里进进出出。这只恶魔猫的嚎叫声在痛苦的尖叫和愉悦的呻吟之间波动。[pg]");
         }
         else
         {
            outputText("只看一眼你就知道你的[cock]塞不进去……但是你什么时候因为这个停止过尝试？你将一根手指滑过那宛如处子般紧致的小洞，阿克巴尔退缩了。他本来就很紧的小洞因为恐惧而紧紧闭合，似乎这样做就能以某种方式阻止这不可避免的侵入。[pg]");
            outputText("你把阿克巴尔的尾巴缠在拳头上，听到这只美洲豹喉咙里发出的恐惧呜咽，你忍不住笑出声来。你一手拉着他的尾巴，另一手开始把你的" + get_player().cockDescript(0) + "往里推。当你侵入他紧缩的括约肌，强行将那紧致粉嫩的小穴撑开到危险的程度时，这只恶魔发出了哀鸣和嚎叫。但你很快就被迫停了下来，你那根[cock]最多只能塞进一英尺，阿克巴尔那如处子般紧致的后穴实在难以容纳更多。你觉得这样也够了，于是拔出来再次向前推进，却遇到了和之前一样的阻力。[pg]");
            outputText("在经历了似乎长达数小时的抵抗和嚎叫后，阿克巴尔的身体猛地一颤，他的后穴因彻底筋疲力尽而放松下来。与你[cock]的战斗似乎让他快要昏厥，他再也没有力气反抗你了。你每一次毫无润滑、毫不留情的粗暴抽插，都让这只美洲豹的身体随之痉挛。[pg]");
         }
         outputText("你以不断增强的力量强暴着这只美洲豹紧致的后穴，你的[hips]像货运火车一样猛烈地撞击着他的身体，让他忍不住大声叫唤。尽管如此，他那[if (metric) {40厘米|15英寸}]肿胀的性器官却在身下不断分泌出先列腺液，这让你知道，他的痛苦中夹杂着大量不情愿的快感。[pg]");
         outputText("阿克巴尔那颤抖后穴传来的令人窒息的紧致感将你推向了高潮的边缘，伴随着一声震天动地的嚎叫，你将精液全部释放在他体内。阿克巴尔突然紧缩的括约肌让你知道，他也达到了高潮。[pg]");
         if(get_player().cumQ() > 1000)
         {
            outputText("你继续将依然肿胀的[cock]在他颤抖的后穴里抽插，同时将成吨的液体泵入这个伪神的胃和肠道里。在你们俩身下，他的肚子开始鼓胀起来，被填满到了一个危险的程度。[pg]");
            outputText("当你那巨大的高潮平息后，你拔了出来，释放出一股巨大的浓稠精液洪流，顺着他的腿流下，在森林的地面上形成了一个大水坑。阿克巴尔如释重负地叹了口气，显然很高兴你终于结束了对他的强暴。[pg]");
         }
         else
         {
            outputText("当你继续在他高潮时猛烈抽插，这只美洲豹的身体变得软绵绵的。当你终于拔出来时，你瞄准阿克巴尔现在非常娇嫩的屁股拍了一巴掌，这突如其来的打击让他痛呼出声。[pg]");
         }
         outputText("站起身来，你收拾好你的[armor]，转身把虚弱的恶魔留在身后。当你走开时，你注意到一群小恶魔正看着你和那只美洲豹，他们的肉棒露在外面，还滴着液体。人群中还混杂着几个地精，每个人手里都拿着一瓶液体，脸上挂着恶意的笑容。[pg]");
         outputText("当你离开时，阿克巴尔发出了咆哮，那些曾经惧怕他的生物正利用他虚弱的状态，向这位地狱之火的“神”复仇。即使你已经走到了森林边缘，依然能听到这只美洲豹恶魔痛苦的嚎叫——尽管，那声音勉强盖过了小恶魔们尖锐的笑声和雌性地精们的咯咯笑声。");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function loseToAckballllllz() : void
      {
         clearOutput();
         if(!get_player().isTaur())
         {
            get_images().showImage("akbal-deepwoods-losslust-analed");
            outputText("你跪倒在地，开始狂热地自慰。阿克巴尔走向你，他长长的肉棒在双腿间不祥地晃动着。他做的第一件事就是用爪子把你推倒仰面躺下，然后站在你上方，将他巨大的[if (metric) {40厘米|15英寸}]肉棒压在你的嘴唇上，用肉棒拍打你的下巴。[pg]");
            outputText("就像一个发情的荡妇一样，你张开嘴，淫荡地舔舐着美洲豹的龟头，感觉到奇怪的倒刺摩擦着你的舌头。你把嘴张得大大的，但甚至无法越过龟头，因为阿克巴尔巨大的性器官实在太粗了，阻止了它的前进。阿克巴尔满足于让你用嘴在龟头上摸索片刻，然后他用有力的爪子把你翻转过来，在欲火焚身的状态下，你忍不住撅起屁股作为祭品，将你的[asshole]暴露在众目睽睽之下。[pg]");
            outputText("[say: 违抗的代价，]当阿克巴尔向你展示他巨大的长度时，你脑海中回荡的只有这句合唱。你惊恐地睁大了眼睛，数着他那根粗大得离谱的肉棒龟头上十几个邪恶的倒刺。[pg]");
         }
         else if(get_player().isTaur())
         {
            get_images().showImage("akbal-deepwoods-losslust-taur-analed");
            outputText("当你的欲望达到顶点时，你像一匹喝醉的小马一样跌跌撞撞，你在心底里知道，你现在任由这个邪恶的恶魔摆布。[pg]");
            outputText("阿克巴尔走向你，他长长的、半勃起的肉棒在双腿间不祥地晃动着。[pg]");
            outputText("[say: 违抗的代价，]当阿克巴尔向你展示他巨大的长度时，你脑海中回荡的只有这句合唱。你惊恐地睁大了眼睛，数着他那根粗大得离谱的、巨大的肉棒龟头上十几个邪恶的倒刺。[pg]");
            if(get_player().ass.analLooseness < 3)
            {
               outputText("阿克巴尔迅速骑上你，开始向你体内推进，他巨大龟头上的倒刺让你在[asshole]被强行撑开时痛得嚎叫。他的美洲豹爪子抓住你的两侧，利用你的身体作为杠杆，将他恶魔般的勃起强行塞进你体内。[pg]");
               outputText("当阿克巴尔向前猛推时，那种拉扯感让你觉得快要晕过去了；他带刺的性器官带来的疼痛刚好让你保持清醒。他开始拔出，你意识到他甚至没有把那根肿胀的性器官的一半长度塞进你的[asshole]里。[pg]");
               outputText("在阿克巴尔长长的猫鞭被缓慢地强行塞进你的[asshole]几个小时后，你的身体垮了，你因为过度劳累而筋疲力尽，甚至连手臂都抬不起来。伴随着一声胜利的咆哮，阿克巴尔向前猛刺，他龟头上的尖刺埋入你体内，但是，没有了你的抵抗，它们似乎在你体内震动，就像十二颗小珠子在按摩你的内脏。这种突如其来的变化让你发出低吟，你用蹄子刨着地，突然渴望得到更多。");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("阿克巴尔迅速骑上你，开始向你体内推进，他那巨大阴茎头上的倒刺让你在被强行撑开时痛苦地皱起眉头。毫无预兆地，他伴随着一声低吼，将他那巨大的长度完全塞入你体内。最初的侵入让你咬紧牙关，那根带刺的肉棒侵犯着你的[asshole]。你张开双腿，试图减轻带刺龟头带来的突然切割般的压力。就在你这么做的那一刻，倒刺开始震动，感觉更像是嗡嗡作响的性爱珠，而不是你所知道的在体内的那根邪恶的攻城锤。你无法抑制喉咙里突然发出的声音，向强暴你的人宣告你的狂喜。");
            }
            else
            {
               outputText("阿克巴尔迅速骑上你，开始向你体内推进，他那巨大阴茎头上的倒刺让你痛苦地皱起眉头。他瞬间插到底，你听到身后传来满意的呼噜声。当他开始以稳步增加的力量在你的[asshole]里抽插他那充血的性器官时，你忍不住想知道为什么倒刺没有给你带来痛苦。你发出一声呻吟，因为那些倒刺开始震动，感觉更像是嗡嗡作响的性爱珠，而不是惩罚性的尖刺。[pg]");
               outputText("阿克巴尔把臀部撞向你时发出低吼，显然很高兴你能承受他巨大的长度。这个恶魔似乎忘记了他正在强暴你，开始舔舐你像马一样的下半身的背部，当他粗暴地操你，同时用他的唾液涂满你的背部时，你的全身都颤抖起来。");
            }
            get_player().buttChange(new Akbal().cockArea(0),true);
            outputText("[pg]");
            outputText("阿克巴尔埋入你体内的整根阴茎开始在你体内嗡嗡作响，随着他加快速度，你忍不住大声叫喊。他的每一次抽插都像锤子一样重重地敲击着你饥渴的臀瓣。毫无预兆地，他的抽插变得杂乱无章，你感觉到他巨大的工具在你体内膨胀，把你撑得更开。[pg]");
            outputText("突然，阿克巴尔在达到高潮时发出一声咆哮。你感觉到他巨大的阴茎在冲刷你的内脏，当他度过高潮时，用他堕落的恶魔之种填满你。他的臀部从未停止过动作。你感觉到自己的高潮即将浮出水面，却突然消失了，你意识到体内的堕落之种实际上阻止了你达到高潮。然而，阿克巴尔一次又一次地把他的精液喷进你的[asshole]，一刻也没有减速。很快，你的肚子就肿胀得不成样子，你甚至在喉咙里尝到了猫精的味道。然而阿克巴尔只是继续，残忍地操着你无助的身体，拒绝让你释放。[pg]");
            outputText("在做了他几个小时的玩具后，你昏了过去，从未达到过自己的高潮。");
            dynStats(DynStat.Lust(10 + get_player().lib / 10),DynStat.Cor(5 + Utils.rand(10)));
            return;
         }
         if(get_player().ass.analLooseness < 3)
         {
            outputText("阿克巴尔迅速骑上你，开始向你体内推进，他那巨大阴茎头上的倒刺让你在[asshole]被强行撑开时痛苦地嚎叫。他的美洲豹爪子压在你的肩膀上，利用你的身体作为杠杆，将他恶魔般的勃起强行塞入你体内。[pg]");
            outputText("阿克巴尔推挤带来的压力让你觉得快要晕过去了，然而他那带刺性器官带来的痛苦却让你保持清醒。过了一会儿，你意识到他甚至没有用他的全部长度来操你；他肿胀的阴茎正缓慢地将不到一半的巨大长度塞进你的[asshole]。[pg]");
            outputText("在阿克巴尔那根长长的猫鸡巴缓慢地塞进你的[asshole]几个小时后，你的身体终于支撑不住了。你已经因为压力而精疲力竭，甚至连手臂都抬不起来。伴随着一声胜利的低吼，阿克巴尔向前猛刺，他龟头上的尖刺埋入你体内。没有了你的抵抗，它们似乎在你体内像十二颗小珠子一样震动，按摩着你的内脏。这突然的改变让你在张开[legs]时发出低吟，突然渴望得到更多。");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("阿克巴尔迅速骑上你，开始向你体内推进，他那巨大阴茎头上的倒刺让你在被强行撑开时痛苦地皱起眉头。毫无预兆地，他伴随着一声低吼，将他那巨大的长度完全塞入你体内。仅仅是最初的侵入就让你几乎晕厥，但随着他将他的长度进进出出，你的身体不由自主地做出了反应。你张开[legs]，试图减轻带刺龟头带来的突然切割般的压力。就在你停止抵抗的那一刻，倒刺开始震动；它们开始感觉更像是嗡嗡作响的性爱珠，而不是你所知道的在体内的那根邪恶的倒刺。当狂喜的浪潮向你袭来时，你无法抑制身体发出的颤抖和呻吟。");
         }
         else
         {
            outputText("阿克巴尔迅速骑上你，开始向你体内推进，他那巨大阴茎头上的倒刺让你痛苦地皱起眉头。他几乎瞬间插到底，带着野性的笑容低头看着你。阿克巴尔开始以稳步增加的力量在你的[asshole]里抽插他那充血的性器官。你发出一声呻吟，因为覆盖在阿克巴尔长长的猫鸡巴上的倒刺开始震动，感觉更像是嗡嗡作响的性爱珠。作为回应，你张开[legs]，阿克巴尔把臀部撞向你时发出低吼，显然很高兴你能承受他巨大的长度。这个恶魔似乎忘记了他正在强暴你；他开始舔舐你的脖子，当他粗暴地把你操进森林的地面时，这让你全身颤抖。");
         }
         get_player().buttChange(new Akbal().cockArea(0),true);
         outputText("[pg]");
         outputText("阿克巴尔埋入你体内的阴茎开始在你体内嗡嗡作响，随着他加快速度，你忍不住大声叫喊。他的每一次抽插都像锤子一样重重地敲击着你张开的[legs]。突然，他的抽插变得杂乱无章，你感觉到他巨大的工具在你体内膨胀，把你撑得更开。阿克巴尔在达到高潮时发出一声咆哮，你感觉到他巨大的阴茎在冲刷你的内脏，当他度过高潮时，用他堕落的恶魔之种填满你。他的臀部从未停止过动作。你感觉到自己的高潮即将浮出水面，却突然消失了。你惊恐地意识到，体内的堕落之种实际上阻止了你达到高潮。然而，阿克巴尔一次又一次地把他的精液喷进你的[asshole]，一刻也没有减速。很快，你的肚子就肿胀得不成样子，你甚至在喉咙里尝到了猫精的味道。然而阿克巴尔只是继续，残忍地把你操进地里。[pg]");
         outputText("在做了他几个小时的玩具后，你终于昏了过去，从未达到过自己的高潮。");
         dynStats(DynStat.Lust(10 + get_player().lib / 10),DynStat.Cor(5 + Utils.rand(10)));
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function healthLoss() : void
      {
         var _gthis:AkbalScene = this;
         clearOutput();
         outputText("当你挣扎着站起来时，你的呼吸在喉咙里燃烧着。无论你多么努力，无论你多么咬紧牙关推着泥土，你都找不到力量。浓烈的血腥味[if (isgoo) {和粘液味}]在空气中弥漫，令人作呕地提醒着你战败的事实，你有些庆幸自己无法支撑起身体去看看究竟有多少是你的。从你每次艰难呼吸时胸口传来的刺痛感来看，你不确定自己是否会喜欢看到的结果。");
         outputText("[pg]但你需要移动。这个事实在你脑海中以一种你不完全确定是自己的声音向你尖叫，随着你[if (isgoo) {核心|头骨}]不稳定的跳动而起伏。这足以让你[if (hasclaws) {把爪子刺进|抓挠}]泥土并拖着自己向前，拼命想要逃跑。每一个艰难赢得的[if (metric) {厘米|英寸}]都比上一个更艰难，然而远处依然遥远的树木似乎并没有比以前更近。");
         outputText("[pg]你[if (!singleleg) {双脚}]猛地停住，阿克巴尔那双闪烁着绿光的眼睛穿透了他领地的阴霾，在[if (isday) {昏暗的[timeofday]光线|深林的黑夜}]中燃烧着。每一声低语都让你更深地陷入他的魔咒，夺走你肺里的空气，当他从阴影中大步走来时，你战败的证明" + (get_player().isGoo() && get_player().skin.tone == "tan" ? "纠结在" : "在") + "他的皮毛上显得格外显眼，呈现出大胆的[if (isgoo) {[skintone]|红}]色。");
         outputText("[pg][say: 蠢货。] 他的声音在你脑海中回荡，低沉而充满蔑视。[say: 你是[if (timessubmitted > 0) {我的|软弱的}]。]");
         outputText("[pg]他的步伐有一种从容的优雅，他静静地滑过森林的地面，越来越近，直到你被笼罩在他的阴影中，他那温暖而恶臭的呼吸喷洒在你的脸上。他的牙齿似乎比你想象的还要锋利，当他的嘴张得更大，粗糙的舌头舔过你的脸颊时，你无法阻止一阵颤抖传遍全身。那双眼睛灼烧着你，像森林本身一样深邃而翠绿。");
         outputText("[pg][say: 记住这点。]");
         outputText("[pg]伴随着这些话，低语声平息了。昆虫不再嗡嗡作响，树叶不再在你的[if (tailLeg) {尾巴|[if (isgoo) {重量|脚}]}]下嘎吱作响，整个深林都像你一样寂静无声，毫无生气。甚至连大自然都不敢在这里侵扰，随着脚步声在你身旁和身后轻轻沙沙作响，你对阿克巴尔想要什么有一种令人不安的直觉。");
         outputText("[pg]当他");
         if(get_player().isNakedLower())
         {
            outputText("[if (singleleg) {跨坐在你的[if (tailLeg) {[if (isMer) {鱼|蛇}]尾|泥泞史莱姆}]上|顶开你的双腿}]时，这一点变得更加清晰，他的胡须[if (!singleleg) {爬上你的大腿内侧，直到它们停在}]你的[ass]上，让你感到发痒。每一次呼气都让你的[asshole][if (lust > 66) {因渴望而抽搐|一想到就紧绷}]，他第一次将鼻子压在你裸露的[skinshort]上，就足以让你扭动起来。然而，他仍然不断地推挤、甩动头部，将你从地上抬起，他的低吼声掠过你的[ears]，直到你终于[if (isbiped) {爬起来跪下|用手掌撑起身体}]。这样一来，你再也无法隐藏[if (lust < 33 || isgenderless) {自己|[if (hascock) {你那[if (lust < 50) {初露头角|勃然大怒}]的勃起[if (cocks > 1) {}]}][if (isherm) {和}][if (hasvagina) {[if (lust < 50) {布满脸颊的红晕|[if (isherm) {顺着大腿流下的情欲痕迹|你自己的情欲，湿滑地沾在}]大腿上}]}]}]。你的每一寸肌肤都暴露在阿克巴尔饥渴的目光下。");
         }
         else
         {
            outputText("他爬上你的背，重心前移，直到你能感觉到他每一次呼气都喷在你的[if (hashair) {[hair]|头皮}]上。他的牙齿像刀子一样抵在你脖子脆弱的[if (hasscales || isgoo) {柔软处|血肉}]上。");
            outputText("[pg][say:脱掉，]他咆哮着，下巴猛地合上，一股火焰涌出，灼热地掠过你的[skindesc]，在茂盛的森林空气中发出嘶嘶声。");
            outputText("[pg]服从突然变得容易多了，只需点点头，就能将火焰的灼热换成他唾液在你伤口上冰冷、刺痛的触感。当它渗入你[if (hasscales) {鳞片之间|[if (isgoo) {史莱姆里|皮肤下}]}]时，你打了个寒颤，片刻之后，一种奇怪的瘙痒感传遍全身，伤口从内部愈合了。然后感觉消失了，你背上的压力减轻了，足以让你[if (isbiped) {跪起来|从地上撑起身体}]。");
            outputText("[pg]显然不够快，因为阿克巴尔很快用头顶了顶你的侧腹，发出一声低吼，并轻轻咬了一口。你急忙[if (singleleg) {直起身|站起来}]，双手已经麻利地脱下你的[armor]。当你唯一的遮蔽物伴随着" + (get_player().get_armor().get_perk() == "Heavy" ? "[i:砰]的一声" : "无声的嗖嗖声") + "掉落在泥土上时，你的每一寸肌肤都暴露在阿克巴尔饥渴的目光下。");
         }
         outputText("[pg]但他不见了，你的呼吸变得急促而踉跄。");
         outputText("[pg]空气似乎静止了一秒，寂静在你的肠胃里翻腾，冰冷地流过你的[if (isgoo) {核心|血管}]。太安静了，太平和了，你讨厌当你向前[if (singleleg) {滑行|[if (isbiped) {爬行|拉扯自己}]}]时，四肢在自身重量下弯曲的感觉，你拼命想忽略每次屈伸时肌肉的酸痛。你能感觉到他在你的脑海里，听到他柔软的脚垫踩在树叶上发出的嘎吱声，尽管你告诉自己这是个骗局，这一切都在你的脑海里，但你知道还有更多。");
         outputText("[pg]你甚至还没碰到[if (!isnaked) {你的[armor]|[if (!isunarmed) {你的[weapon]|灌木丛的安全地带}]}]，世界就崩溃了，爪子刺痛了你的背，一股压倒性的力量将你死死地压在地上，同时也夺走了你唇边的呼吸。沉重的爪子深深地陷入你的[skinshort]，将你按倒在地，把你所有的哭喊都闷在泥土里，即使你用尽残存的力气向后挺起肩膀，他也毫不松懈。");
         outputText("[pg]只有当你的挣扎停止时，阿克巴尔才对你施以仁慈。他稍微退后了一点，让你能绝望地喘口气，然后他便认真地骑上你，他的皮毛[if (hasplainskin) {火热地|紧紧地}]贴着你的[if (hasfur) {皮毛|[skindesc]}]，空气中弥漫着他浓重的麝香。它包围着你，将一股原始的欲望直接送入你的腹股沟，但即使你的[if (isgenderless) {身体}][if (hascock) {[cocks]}][if (isherm) {和}][if (hasvagina) {[vagina]}][if (lust < 33) {开始|燃烧得更旺}]，你也无法摆脱那股在喉咙里盘旋的冰冷不安。");
         outputText("[pg]你知道接下来会发生什么。你以前见过动物。你在自己[if (timessubmitted > 0) {可耻的过去|最狂野的[if (cor > 50) {幻想|恐惧}]}]中[if (timessubmitted > 0) {经历过|[if (cor > 50) {梦见过|感受过}]}]。");
         outputText("[pg]你感觉到它在你的大腿间生长，温暖、粗壮，随着他臀部的每一次抽插，在你的[if (hasvagina) {[clit]|[if (hasballs) {[balls]|[if (hascock) {cock|stomach}]}]}]上摩擦，阿克巴尔在你身上挺动，直到他野性精液的最初痕迹涂抹在你的[skindesc]上，你的身体随着他体重的每一次转移而绷得更紧。他太重了，太强壮了，你无法抵抗，你知道他也知道，因为他的节奏随着隆隆的低吼声加快了。");
         outputText("[pg]他野兽般的倒刺一次又一次地擦过你，摸索着一个他似乎找不到的洞，尽管你尽量不[if (timesraped > 0) {回忆|想象}]它们在你体内会做什么，但当他抬起身体，将他的肉棒拖过你最敏感的[skinshort]，他的刺在你[ass]上显得很锋利时，你根本无法忽视。他戳刺、推挤，他的爪子[if (hasscales) {深深地陷入|撕扯着}]你的[if (isgoo) {史莱姆|血肉}]，试图将你固定住，只有你的尖叫声打破了他平稳的呼吸声和臀部的拍打声。");
         outputText("[pg]没有回答。除了你背上的重量、手掌下粗糙的地面，以及滑入你臀沟，在你[asshole]处又热又硬地拉扯的压力之外，什么也没有。每一次推挤都比上一次更加坚决，猛烈地撞击着你颤抖的肌肉，直到它们每次收缩都燃烧起来。他情欲的咸味萦绕在你的鼻尖，让你窒息，即使看不见，你也能辨认出阿克巴尔肉棒的真实尺寸，它在你身上滑动，在你的[skindesc]上又滑又粘。");
         outputText("[pg]进不去的。你知道的。至少不把你撕[if (anallooseness < 3) {成两半|开}]是进不去的，这个想法让你紧绷起来，直到泥土积聚在你的[if (hasclaws) {爪子|指甲}]下，你的牙齿咬得发酸。每一次抽插的回声都比上一次更响亮，龟头越来越用力地压在你[if (isanalvirgin) {未被触碰过的}]入口处，只有当你的抵抗终于在一阵火辣辣的疼痛中崩溃时，他才松口。");
         get_player().buttChange(new Akbal().cockArea(0),true);
         outputText("[pg]湿润、炽热的呜咽从你的唇间溢出，却又在你的喉咙里消散，因为他的臀部猛烈地撞击着你，用他那巨大的肉棒将你撑开。在凶猛的咆哮和牙齿的咬合声中，你的手臂失去了力量，地面在你的脸上摩擦，灰尘在你的舌头上干燥而粗糙。你失去了意志，找不到力量，而他只是更加用力地压迫，更深地推入你的肠道，你的[asshole]" + (get_player().isGoo() || get_player().ass.analLooseness >= 3 ? "bulges around" : "contorts with") + "他的形状。");
         outputText("[pg]每一寸都比他的火焰舔舐还要灼热，当他的肉棒完全沉入体内时，只有阿克巴尔的爪子支撑着你，你的肉壁" + (get_player().isGoo() || get_player().ass.analLooseness >= 3 ? "紧紧地拉伸" : "鼓起") + "，包裹着他的粗壮。每一次呼吸，他肌肉的每一次屈伸，都将他的刺[if (isgoo) {沉入|拖过}]你的[if (isgoo) {史莱姆|血肉}]，在一次无情的抽插中撕去你最后的挣扎，让你恶心反胃。");
         outputText("[pg]你[if (timessubmitted > 0) {将永远是|是}]他的玩具，锁在一起，你的身体内外都留下了印记，他的臀部拍打着你，向整个深林宣告你已经成为了恶魔的伴侣。你体内再也没有什么可以尖叫的了，没有眼泪可以隐藏你的视线，除了手指下的沙砾和你[ass]上沉重的重量之外，什么也没有。");
         outputText("[pg]每一次抽插都[if (isgoo) {在你的体内翻滚|震撼着你的身体}]，当他用沾满新鲜[if (isgoo) {黏液|鲜血}]的锋利爪子紧紧抓住你的两侧时，你痛苦地皱起了眉头。他那炽热而狂乱的呼吸喷洒在你身上，抽插的节奏逐渐加快，变成了一种稳定而惊人的律动，在他野兽般的力量下，[if (isgoo) {你的思绪被打散|你的骨头被震得咯咯作响}]。");
         outputText("[pg]当他伴随着野兽般的咆哮一插到底时，你只能无力地扭动。他的肉刺张开，刮擦着你的肉壁，他的肉棒跳动着，第一股被污染的精液渗入你的肠道深处。当你的身体吸收他的堕落时，一种不自然的火焰充满了你的全身，这股热量让你的脸颊泛红，你自己的欲望也随之涌起，迎合着他的需求。当阿克巴尔在你体内清空自己时，黏糊糊的温热液体在你的[genitalsdetail]中汇聚，恶魔精液的每一次喷射都让你的[if (cor > 50) {灵魂沐浴其中|[skinshort]起鸡皮疙瘩}]。");
         outputText("[pg]但事与愿违，他并没有停下来。他一次又一次地撞击你[if (!isgoo && !hasscales) {伤痕累累的}][if (isgoo) {身体|肉体}]，即使他的精液顺着你的大腿流下，[timeofday]的天空[if (hours < 12) {在正午的阳光下燃烧|在[if (hours < 16) {暮色|黎明}]中闪耀}]，他也从未放慢速度……");
         doNext(function():void
         {
            _gthis.clearOutput();
            _gthis.outputText("你在泥土中醒来，[if (istaur || tailLeg) {侧躺着|蜷缩成一团}]，痛得无法动弹。阿克巴尔已经走了，尽管空气中仍然弥漫着他情欲的酸味。你用颤抖的[if (singleleg) {手臂|双腿}][if (singleleg) {撑起身子|站起来}][if (!isnaked) {，穿上你的[armor]，}]并抓起你的[if (isunarmed) {[inv]|[weapon]}]。你仍然能尝到他的气味，感觉到他压在你背上的重量，当你慢慢[if (singleleg) {爬回|跛行回}]营地时，每一片树叶的沙沙声都像是在你脑海中低语，你的[asshole]一路上都在抽搐。");
            _gthis.dynStats(DynStat.Cor(2));
            if(_gthis.get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               _gthis.get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
            }
            _gthis.get_combat().cleanupAfterCombat();
         });
      }
      
      public function girlsRapeAkbalPart2() : void
      {
         clearOutput();
         get_game().output.hideUpDown();
         get_images().showImage("akbal-deepwoods-female-taur-bindakbal");
         if(get_player().isTaur())
         {
            outputText("当粗壮的肉棒撑开你的阴唇，在你的阴蒂上跳动，倒刺在你的内壁上颤抖时，你深深地呻吟着，你扭动着身体，将你的臀部紧紧地贴在他的下腹部，淫液流到了他的皮毛上");
            if(get_player().hasCock())
            {
               outputText("，[eachcock]来回摆动，偶尔会撞到他被绑住的双腿");
            }
            outputText("。恶魔呻吟着，紧闭双眼，拒绝接受你强加给他的待遇，但他的身体却出卖了他，因为他的猫科动物的肉棒变得更粗更长，迫不及待地想要填满你的小穴。当你退到他肉棒的最顶端时，你沉浸在他渴望的呻吟中，高兴地打了个寒颤。[pg]");
            if(get_player().cor > 33)
            {
               outputText("如果你不是那么急于利用他来发泄，你可能会考虑这样挑逗他，然后把他绑在树上。");
            }
            outputText("很快，你适应了前后摇摆的节奏，每次向下冲刺时，你都会把全身的重量压在树上，树发出嘎吱嘎吱的响声，你身后的猫变成了一只喵喵叫着乞求的小猫，徒劳地试图刺入你湿透的阴户。[pg]");
            outputText("你这样持续了大半个小时，他的倒刺刮擦着你的内壁，让你的身体不断颤抖，但你似乎无法仅靠自己的弹跳来达到高潮。你没有多想，就松开了绑住阿克巴尔前腿的藤蔓，去摸你自己的[chest]，粗暴地抚摸着自己。[pg]");
            outputText("谢天谢地，阿克巴尔和你一样渴望发泄，他利用了新获得的自由，前腿环绕着你的侧腹，紧紧地抓住。他立刻咆哮起来，将他的猫科动物的肉棒深深地插入你的体内，这种感觉比你仅仅在他身上摇晃时要好得多，你的母马阴户喷出汁液，紧紧地包裹着他，试图榨取他的精液");
            if(get_player().hasCock())
            {
               outputText("，而你的肉棒拍打着你的肚子，先列腺液从顶端飞溅出来，涂满了你的下半身和下方的土地");
            }
            outputText("。他一次又一次地深深埋入，他那肥大肿胀的睾丸拍打着你，感觉出奇地自然");
            if(get_player().balls > 0)
            {
               outputText("，你自己的睾丸也摇摆着迎合他");
               if(get_player().ballSize >= 12)
               {
                  outputText("尽管他压抑着欲望，但还是让他相形见绌");
               }
            }
            outputText("，诱哄出纯粹的快乐的呻吟和呻吟，与他享受的咆哮和呼噜声交织在一起。[pg]");
            outputText("最后，美洲豹先射了，他向着树林咆哮着他的快乐，将他的小猫奶油喷射到你的阴户里，填满了你。如果你有心情去猜的话，从你下半身的肿胀程度来看，你可能会想象这只猫也填满了你的子宫，这引起了一阵担忧，你想知道这只猫科动物是否有可能让你的子宫受孕。然而，他还没有结束，他继续在释放中抽插，将你拉向越来越高的性高潮的极乐，当你终于与他的第五次高潮同时释放时。你的[vagina]紧紧地夹住他，用女性的汁液涂满他的皮毛，当你榨取他时");
            if(get_player().hasCock())
            {
               outputText("当[eachcock]抽搐并释放，将你的精液喷洒在地上");
            }
            outputText("。[pg]");
            outputText("当恶魔瘫倒在你的下背部，轻轻地抓住你那马一样的臀部时，你的身体颤抖着，你只想和他一起瘫倒，他的重量在你的背上出奇地舒服。你摇了摇头，让自己清醒过来，开始转过身，小心翼翼地不让阿克巴尔从他明显舒适的位置上掉下来，他滴着水的肉棒从你的小穴里滑出来，发出淫秽的吧唧声。你放下尾巴，让恶魔滑落，笨拙地解开他脚上的藤蔓，释放了他，他心满意足地瘫倒在地上。当你直起身子，开始往营地走去时，你意识到你也有同样的感觉；非常满足。也许以后留意一下这位神明也不是个坏主意……");
            get_player().knockUp(1,432,101);
            get_player().cuntChange(new Akbal().cockArea(0),true,true,false);
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Cor(1));
         }
         else if(get_player().vaginalCapacity() < new Akbal().cockArea(0))
         {
            outputText("判断那丝滑的皮毛已经足够光滑，你把尾巴从他嘴里拽出来，拉向你的[vagina]唇，用尾尖挑逗着你的褶皱，然后引导他进入。猫科动物领会了你的暗示，扭动着尾巴，再次抬起臀部，推入你的体内，当他把自己压在你的[foot]上时，发出轻微的呼噜声。他的肉棒顶端已经开始渗出先列腺液。当他的皮毛在你体内竖起时，你大声喘息着，他的唾液让你的女性部位因渴望而颤抖，你感觉到他滑得更深了，盘旋扭曲着。为了确保不冷落这只猫科动物，你");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[if (isMer) {移动你的尾巴|更紧地挤压他的肉，移动你的盘绕}] 在他的猫科动物肉棒上上下移动，同时使用 [if (isMer) {你丝滑柔软的鳍刷和扭动|你的尾巴最尖端挑逗和戳}] 他的尿道，涂满他的先列腺液");
            }
            else if(get_player().isGoo())
            {
               outputText("在他猫科动物肉棒的根部扭动和翻滚，像一个活生生的性玩具一样震动你那液体般的附肢，导致他的睾丸微微晃动");
            }
            else
            {
               outputText("将他的肉棒紧紧压在他的肚子上，脚底板顺着他的长度缓慢地上下滑动，引诱他发出愉悦的低吼和呼噜声");
            }
            outputText("作为他用快感淹没你小穴的无声报酬。[pg]");
            outputText("当你站在那里时，时间似乎被拉长了，你把这位曾经骄傲而强大的神明压在身下，现在他只是一只致力于取悦你的喵喵叫的小猫");
            if(get_player().hasCock())
            {
               outputText("同时你配合着他的抽插抚摸着[onecock]");
            }
            outputText("。他灵活的尾巴戳刺并抚摸着你最深处的凹陷，你用挑逗的手段让他永远处于边缘，而他锋利的爪子在泥土中挖出沟壑，他紧紧贴着你，完全沉浸在快感中，无法在脑海中表达他的欲望。相反，他张开嘴巴，像野兽一样发出欲望的信号，充满了嚎叫、咆哮和呼噜声，在你的耳中创造出一种奇怪的悦耳的刺耳声，让你感觉自己就像" + get_player().mf("万兽之王","万兽女王") + "，将你自己的野性呼唤加入到他的呼唤中。[pg]");
            outputText("然而，随着下面熟悉的压力逐渐积聚，他尾巴的蠕动变得难以忍受。你加快了取悦他肉棒的节奏，放低身子，试图将那条熟练的尾巴更多地推入你的体内，");
            if(get_player().get_gender() == 3)
            {
               outputText("粗暴地抚摸着[onecock]，");
            }
            outputText("大声呻吟着，你的阴唇开始收缩紧绷，滑腻的汁液顺着他的皮毛流下。感觉到你的临近，阿克巴尔加倍努力，他蠕动的尾巴竖起，拖着皮毛摩擦你的内壁。最后，当你释放时，一切都变得难以忍受，你浓稠的女性汁液从你被塞满的小穴中倾泻而出，落在他紧绷的肉棒上");
            if(get_player().hasCock())
            {
               outputText("当[eachcock]献上它的恩赐时，痉挛着，让场面变得更加混乱");
            }
            outputText("。你高潮时增加的热量和湿润让他达到了极限，他发出一声足以震动树木的咆哮，他粗壮的带刺肉棒猛烈地喷射，弓起背，他的精液溅到上方树木的叶子上，像一场变态的雨一样落在你们俩身上。[pg]");
            outputText("你的[chest]起伏着，你努力大口呼吸，[legs]因为猫尾巴带来的高潮的纯粹力量而颤抖。");
            if(get_player().cumQ() > 500)
            {
               outputText("他的整个腰部都沾满了你的汁液，这只曾经骄傲的猫坐在你留下的水洼中，脸上带着满足的笑容，就像抓到金丝雀的猫一样");
            }
            else
            {
               outputText("他坐在那里，当你射出的精液覆盖他的腹股沟时，他感到头晕目眩，他的肉棒仍然因为你倾泻在上面的洪流而闪闪发光。尽管如此，他的脸还是扭曲成了一声呼噜");
            }
            outputText("当他瘫倒在树干上时，被快感淹没了。带着你自己满意的笑容，你捡起你的[armor]然后离开。也许你有空应该再去找找这位[say: 大地之火神]……");
            get_player().orgasm("Vaginal");
         }
         else
         {
            outputText("当阿克巴尔令人印象深刻的肉棒将你的小穴撑开时，你大声呻吟，立刻庆幸自己事先想到了给他润滑。你不太情愿的伴侣也将他的呻吟加入到你的呻吟中，他肉棒的抽动表明他并不像他表现出来的那么反对这个想法。也许他对支配欲情有独钟，无论从哪个角度来看。尽管如此，你继续向下推，直到你的臀部轻轻地碰到他的臀部。他巨大的阴茎填满你的感觉让你颤抖，然后你靠向恶魔，将你的胸部压在他的胸部上，陶醉在他丝滑的皮毛同时抚摸你身体的多个部位。嚎叫的雄性开始发力，移动他的头去舔舐和轻咬你的[nipples]。[pg]");
            outputText("当你抬起自己时，你的头开始晕眩，因为他以前没有注意到的倒刺刮过你的内壁，从里面拉扯、捕捉和按摩，因为它们开始振动，导致你");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[if (isMer) {高兴地拍打你的鱼尾半身，同时将你所有的重量都压在他身上|将你的盘绕缠绕在他和树上，为你向下冲刺增加杠杆作用}]。");
            }
            else if(get_player().isGoo())
            {
               outputText("将自己包裹在他的臀部和腹股沟周围，你的整个下半身都在他的肉棒周围蠕动和扭动。");
            }
            else
            {
               outputText("用你的腿锁住他的躯干，以更大的力量在他身上弹跳。");
            }
            outputText("你粗暴地使用他的腹股沟，用力地刺穿自己，足以在你们俩身上留下瘀伤，而他则用他的尾巴去");
            if(get_player().cockTotal() == 1)
            {
               outputText("缠绕在你紧绷的肉棒上，皮毛的触感增强了他抽插的效果");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("艰难地缠绕在你每一根跳动的肉棒上，用他粗糙的皮毛挑逗着它们");
            }
            else
            {
               outputText("抚摸并挠着你的屁股和下背部");
            }
            outputText("。[pg]");
            outputText("你不确定自己坐在那里多久了，在猫妖的肉棒上粗暴地弹跳着，他紧闭着双眼，陶醉在你温暖湿润的小穴和你的[butt]摩擦他肿胀阴囊的感觉中。最终，他的肉棒和尾巴的共同努力将你推向了高潮，你饥渴的阴唇紧紧地夹住他，有节奏地挤压着，试图榨干他的肉棒");
            if(get_player().hasCock())
            {
               outputText("当[eachcock]抽搐紧绷，准备爆发时");
            }
            outputText("，而他当然没有让你失望。伴随着一声足以震动树木的咆哮，他在你的通道内猛烈地爆发了，他滚烫、冒着热气、充满活力的精液倾泻进你的深处");
            if(get_player().cockTotal() == 1)
            {
               outputText("，这引起了你肉棒的共鸣，将浓稠的精液喷射在他的肚子上");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("让你所有的肉棒都汹涌澎湃，将你的精液溅在猫妖身上");
            }
            outputText("，他的脸扭曲成一种充满快感和满足的咆哮。[pg]");
            outputText("你慢慢地从高潮的余韵中平息下来，挣扎着从恶魔的腿上离开，步履蹒跚地走向你的[armor]，新鲜的猫妖精液顺着你的身体流下，你因女性私处的轻微瘀伤而倒吸一口凉气。你揉了揉肚子，开始怀疑让恶魔把精液射进你的子宫里是不是有点冒险。然而，尽管有轻微的悸动，你还是感到精神焕发，阿克巴尔强效的精液让你奇妙地恢复了力量，你回头瞥了一眼，看到这位曾经骄傲的神明正陶醉在他自己的释放中。也许以后再去找他也不是个坏主意……");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Cor(1));
            get_player().knockUp(1,432,101);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function girlsRapeAkbal() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,903,FlagDict_Impl_.arrayReadInt(_loc1_,903) + 1);
         clearOutput();
         outputText("看着这位所谓的“地狱之火神”在地上抽搐成一团，你暗自冷笑。脱下你的[armor]，你的手滑向你那女性的缝隙，盘算着该如何利用他。[pg]");
         get_images().showImage("akbal-deepwoods-female-bindakbal");
         if(get_player().isTaur())
         {
            outputText("你已经能预见到，想要让你的体型适应某人会有多麻烦，但正如你们村里人常说的，[say:有志者事竟成。]你从附近的树上扯下一些藤蔓，走向几乎昏迷的阿克巴尔，把他扛在背上，一边在脑海中构思着细节，一边咧嘴笑了起来。[pg]");
            outputText("在美洲豹恢复过来并提出抗议之前，你用最长的藤蔓将他的前腿绑住，然后把藤蔓抛过几根结实的树枝，做成了一个简易的滑轮系统。你把他拉起来，让他靠在树干上，他微微动了一下，但依然没有力气反抗。你估计在他完全清醒之前还有点时间，于是抓紧机会，把他的后脚绑在树根附近，有效地把他变成了一个供你用[vagina]刺穿的骑乘玩具。[pg]");
            outputText("趁着他的双腿被绑住，你花时间检查了你的战利品，伸手抚摸他那饱满的、棒球大小的囊袋和摇晃的带刺肉棒。看起来，尽管你把他打得屈服了，但这只恶魔并不完全排斥这个想法，因为他在你手中恢复了生机，微微跳动着。美洲豹开始睁开他那翠绿色的眼睛，怒视着你，但还是试图把臀部向前推，当他发现因为你的捆绑而无法在树上找到合适的着力点时，他发出了烦躁的低吼。[pg]");
            outputText("你手里紧紧抓着绑住他前腿的藤蔓，慢慢转过身，翘起尾巴，让你那湿透的母马小穴对着阿克巴尔眨眼");
            if(get_player().hasCock())
            {
               outputText("[eachcock]在下面晃荡着，因期待而抽动");
            }
            outputText("。你对着这个无助的神灵嘲弄地笑了笑，后退了一步，对准位置，然后粗暴地将自己压向他，将他那带刺的猫科肉棒深深地推入你的体内。");
         }
         else if(get_player().vaginalCapacity() < new Akbal().cockArea(0))
         {
            outputText("你用脚把他翻转过来，让他仰面朝天，你不耐烦地啧了一声，因为你知道，如果不经历相当大的痛苦，你根本无法把那根巨大的猫咪肉棒塞进你的双腿之间，而且你也不太相信这只恶魔，不敢让他那长满尖牙的嘴靠近你最敏感的部位。谢天谢地，还有另一个选择，此刻正在你脚边抽动着。[pg]");
            outputText("你弯下腰，抓住他那甩动的尾巴，无视他因不适而发出的猫科动物般的哀嚎，用几根手指抚摸着那长满斑点、如丝般光滑的皮毛，这种感觉让你的脊背一阵阵发麻，欲火中烧。你的脑海中已经浮现出各种画面，想象着你能用这根附肢做些什么，你从中挑选了最突出的一个想法，然后抓住这只恶魔猫的后颈，");
            if(get_player().get_str() > 60)
            {
               outputText("像拎新生小猫一样把他拖向一棵树");
            }
            else
            {
               outputText("把他拖向最近的树");
            }
            outputText("强迫他靠在树上。[pg]");
            outputText("你再次抓住他的尾巴，揪住他的后颈，把他拽下来，强硬地将尾尖按在他的嘴唇上。即使在虚弱状态下，阿克巴尔也拒绝张嘴，直到你无意中瞥见他双腿之间。看来这个恶魔比他愿意承认的更喜欢你占据主导地位。");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("你用尾尖卷住他的肉棒，让倒刺轻轻刮过你的鳞片[if (!isMer){ 并用力挤压}]，引诱出一声低沉的愉悦嚎叫，你急忙利用这个机会，");
            }
            else if(get_player().isGoo())
            {
               outputText("你集中精神，延伸出一小部分液态身体，将他的猫科肉棒包裹在自己体内，小心地避开顶端。猫科阴茎周围湿润温暖的感觉太过强烈，让他张开嘴发出一声无声的呻吟，你急忙利用这个机会，");
            }
            else
            {
               outputText("你抬起[leg]，将脚底牢牢地贴在他长满倒刺的肉棒上，将其压在他的肚子上，迫使这只美洲豹发出一声低沉的呻吟，你迅速利用这个机会，");
            }
            outputText("把他的尾巴塞进他自己的嘴里。当他试图把尾巴推出来时，你故意移开你的[foot]，低头盯着这个恶魔。他虚弱地向你抬起臀部，温顺地开始吸吮自己的尾巴，闭上他那充满活力的翠绿眼眸，而你则将注意力转回他的肉棒上。[pg]");
         }
         else
         {
            outputText("你咧嘴一笑，把他翻过身仰面躺着，低头盯着他双腿之间的繁殖工具，它坚挺地立在他那相当饱满的囊袋上。很明显，这位“神明”已经很久没有发泄过了，所以才会对你表现出攻击性。你一边稍微用手指抚弄自己，一边检查他那根猫科肉棒，上面覆盖着层层倒刺，看起来会相当痛苦。你俯下身，用手指划过它们，看着它们微微弯曲，你得意地笑了。它们可能不足以伤害你，但做爱绝对会很不舒服……除非你附近刚好有合适的润滑剂来源。[pg]");
            outputText("回想起家乡的猫");
            if(get_player().hasPerk(PerkLib.Flexibility))
            {
               outputText("以及你自己在这方面的经验");
            }
            outputText("，你觉得你很清楚哪里可以找到可靠的润滑剂来源。你咧嘴一笑，揪住这只恶魔猫的后颈，");
            if(get_player().get_str() > 60)
            {
               outputText("像拎新生小猫一样把他拖向一棵树");
            }
            else
            {
               outputText("把他拖向最近的树");
            }
            outputText("强迫他靠在树上。[pg]");
            outputText("在晕眩状态下，当你把阿克巴尔按在树上时，他几乎没有反抗。然而，当你抓住他的头，把他按向他自己那根紧绷的肉棒时，情况就变了。愤怒的低语在你脑海边缘掠过，你轻易地将它们挥开，伸手捏住恶魔的脸颊，强迫他张开嘴。你迅速用他自己的肉棒堵住他的嘴，按住他的头，强迫他用自己的唾液涂满他的肉棒。");
            if(get_player().cor < 33)
            {
               outputText("在短暂的怜悯中，你伸出手，在阿克巴尔吸吮时抚摸他紧绷的囊袋，感受着它们在他吵闹的吸吮和流口水时颤抖。");
            }
            else
            {
               outputText("你得意地笑了，几乎是粗暴地抓住他饱满的囊袋，摇晃着它们，他用翠绿的眼睛盯着你，虽然你分不清那是愤怒还是欲望。");
            }
            outputText("[pg]");
            outputText("最后，你判断他做得够多了，允许他喷着口水抬起头，不过考虑到他顶端和嘴唇上流淌的先列腺液，这次经历很难说是痛苦的。他用燃烧着绿色火焰的眼睛瞪着你，而你");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("直起身子，用自己的尾巴支撑着体重，双手在下方探索，找到你肿胀的阴唇，用两根手指慢慢分开它们，让你的气味和湿润涂满这只美洲豹的脸。");
            }
            else if(get_player().isGoo())
            {
               outputText("伸出手，你液态的身体包裹住他的双腿并让它们张开，你的手向下伸去，把玩着你湿润、张开的肉洞，看着他试图假装不感兴趣，尽管他的囊袋明显在跳动，你忍不住轻笑出声。");
            }
            else
            {
               outputText("开始站在他上方，张开双腿露出你湿润、张开的小穴，他的表情滑稽地从愤怒变成困惑，再变成纯粹的欲望，这只猫科动物舔了舔嘴唇，尽管上面还有他自己的味道。");
            }
            outputText("[pg]");
            outputText("从他身体里传来的渴望的颤抖来看，很明显，你的举动让他比他想象的还要兴奋。你用下半身压住他的双腿，一边往下沉，一边抓住他的前腿，当你用他那根光滑的肉棒的顶端摩擦你的入口时，你故意发出更大的呻吟声，好让他听见。");
         }
         dynStats(DynStat.Lust(50));
         doNext(girlsRapeAkbalPart2);
      }
      
      public function get_debugName() : String
      {
         return "Akbal";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fuckAkbitchsButt() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         get_images().showImage("akbal-deepwoods-male-buttfuck2");
         outputText("毫无预兆地，阿克巴尔的内脏变得像真空一样紧。痉挛传遍他的全身，你意识到他已经达到了高潮，而根本没有理会他那长满倒刺的阴茎。");
         if(get_player().cor < 90)
         {
            outputText("你抓住恶魔临时做的项圈，让他在纯粹的狂喜中大叫着度过高潮，陶醉在知道你已经让他成为你的婊子的满足感中。");
         }
         else
         {
            outputText("你猛烈地捣弄着你婊子颤抖的直肠，陶醉在脉动的压力中。阿克巴尔在你身下咆哮，当你用残酷的抽插摧毁他紧绷的小穴时，发出混合着痛苦和狂喜的声音。");
         }
         outputText("[pg]很快你就感觉到那种熟悉的压力在积聚。压在他身上，你开始猛烈地迎合他的抽插，享受着恶魔的咆哮，每次你们两人的身体伴随着响亮的拍打声相遇时，他的尾巴都会卷曲起来。");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("[pg]你用臀部的拍打声迎接你新婊子的屁股，将你的[cock biggest]在他那紧致得令人惊叹的小穴里来回抽插。当你伴随着一声清晰的“啵”声，将你肿胀的肉结强行塞进他的后庭时，他嚎叫起来。他的反应是倒在地上，试图逃离突然侵入他尾穴的额外粗度，并把你一起拉倒。你双臂环抱着他，嚎叫着将你爆发的[cock biggest]磨进他被堵住的肠道里，用滚烫的精液填满恶魔的身体，导致他的肚子微微隆起。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("[pg]当你的肉棒将阿克巴尔劈成两半时，他不知怎么的甚至无法跟上你[cock biggest]重新焕发的凶猛捣弄。一次深入灵魂的抽插让阿克巴尔喷出火焰，你猛拉他的项圈并停住，将精液倾注进他的肠道，直到它从被残酷撑开的小穴里溢出，顺着你的[cock biggest]流下浓稠的白色粘液。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("[pg]突然你的[cock biggest]变得狂野起来。阿克巴尔嚎叫着，因为他的肠道被你的[cock biggest]重新排列。低头看去，你可以看到你的[cock biggest]在他的皮肤和皮毛下移动。当你高潮的第一股精液开始射入他跳舞的肠道时，阿克巴尔向后推，将自己撞向你，因为你的[cock biggest]刺激了他非常肿胀和受虐的前列腺，他迎来了第二次高潮。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT)
         {
            outputText("[pg]阿克巴尔似乎特别喜欢你的[cock biggest]，因为他在它坚硬的长度上跳舞。当你埋入的[cock biggest]开始向恶魔的肠道喷射滚烫的精液时，你控制住局面，开始无情地将你的[hips]猛烈撞击美洲豹翘起的后背。当你打出一个巨大的高潮时，他颤抖着。即使在你精疲力竭之后，他仍然继续在你的[cock biggest]上摩擦。");
         }
         else
         {
            outputText("[pg]你拉住项圈向前倒去。你开始向阿克巴尔颤抖的肠道喷射滚烫的精液，同时继续将他捣弄到屈服，当你打出高潮时，项圈紧紧攥在你的拳头里，精液顺着这个婊子的腿和阴囊流下。");
         }
         outputText("[pg]当他恢复理智时，你带着咧嘴笑回头看着你的新婊子。当你离开森林时，你听到阿克巴尔的合唱声中传来一个承诺，[say:你会后悔的……勇者。]");
         get_player().orgasm("Anal");
         dynStats(DynStat.Cor(3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:* = null as Array;
         spriteSelect(SpriteDb.get_s_akbal());
         registerTag("timesraped",TagFun_Impl_.fromInt(saveContent.timesRaped));
         registerTag("timessubmitted",TagFun_Impl_.fromInt(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,16)));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) > 0)
         {
            _loc1_ = [];
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & AKBAL_EVENT_GOBLIN) == 0)
            {
               _loc1_.push(0);
            }
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & AKBAL_EVENT_ALICE) == 0)
            {
               _loc1_.push(1);
            }
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & AKBAL_EVENT_KITSUNE1) == 0)
            {
               _loc1_.push(2);
            }
            if(int(_loc1_.length) > 0)
            {
               _loc2_ = _loc1_;
               switch(int(_loc2_[Utils.rand(int(_loc2_.length))]))
               {
                  case 0:
                     akbalEventGoblin();
                     break;
                  case 1:
                     akbalEventAlice();
                     break;
                  case 2:
                     akbalEventKitsune();
               }
            }
            else
            {
               akbalQuestConclusionPrompt();
            }
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,903) >= 2)
         {
            akbitchEncounter();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,17) == 2)
         {
            repeatAkbalPostSubmission();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,17) == 1)
         {
            ackbalRepeatAfterWin();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,17) == -1)
         {
            ackbalRepeatAfterLoss();
            return;
         }
         akbalFirstEncounter();
      }
      
      public function encounterName() : String
      {
         return "akbal";
      }
      
      public function encounterChance() : Number
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & AKBAL_QUEST_DONE) > 0)
         {
            return 0;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) > 0)
         {
            if((15 & FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715)) == 0 && get_time().days > 1 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2717))
            {
               return 1;
            }
            if((15 & FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715)) > 0 && get_time().days > 3 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2717))
            {
               return 1;
            }
            return 0;
         }
         return 1;
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function buttFuckbuttFuckbuttFuckAkbal() : void
      {
         clearOutput();
         get_images().showImage("akbal-deepwoods-male-buttfuck");
         outputText("你咧嘴一笑，拉了拉阿克巴尔的项圈，他发出一声几乎无法抑制的呼噜声。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,902) == 1)
         {
            outputText("当你听到这意想不到的声音，意识到你已经把这个恶魔般的性掠食者变成了你个人的荡妇时，你[face]上的笑容变得更加灿烂。仿佛为了证实这一点，他");
         }
         else
         {
            outputText("他");
         }
         outputText("抬起尾巴，让你完美地看到他的整个胯部，从他自带润滑的括约肌到他饱满的睾丸，以及坚如磐石的恶魔猫阴茎。在欲望的驱使下，他的意志已经被打破，现在他是你的了。[pg]");
         if(get_player().cockTotal() == 1)
         {
            outputText("你跪在他身后，带着笑容沉入恶魔湿润的深处。");
         }
         else
         {
            outputText("你跪下来往下看，在[eachCock]中挑选了最大的一根。");
            outputText("你把你的[cock biggest]抬到合适的位置，咧嘴一笑，开始推入恶魔湿润的深处。");
         }
         var _loc1_:int = get_player().biggestCockIndex();
         if(get_player().cocks[_loc1_].cockLength < 7)
         {
            outputText("[pg]阿克巴尔低声吟唱，你发现自己不禁在想，他一开始为什么要反抗。你拉了拉他那森林制造的项圈，阿克巴尔开始顺从地用你的[cock biggest]操自己。当恶魔用你的[cock biggest]操自己时，你可以向后靠，放松一下。当他慢下来时，突然拍打他肌肉发达的后臀，让他重新回到正轨。天然润滑的洞甚至在跳动，挤压着你的[cock biggest]，因为阿克巴尔吞下了你所能提供的每一[if (metric) {厘米|英寸}]。");
         }
         else if(get_player().cocks[_loc1_].cockLength <= 12)
         {
            outputText("[pg]当你侵入他滴着润滑液的尾洞时，阿克巴尔在胸腔深处呻吟。当你向前推时，他开始从你的[cock biggest]上拉开。猛拉一下他的项圈纠正了这一点，你继续努力进入他的身体。一旦你的[cockHead biggest]进入他体内，他就会昏厥过去，并将他肌肉发达的臀部推回到你的[cock biggest]上，而不需要进一步的指示。每次你的整个长度滑入他体内，他都会发出一声尖锐的叫喊，这是一种饥渴的声音，既显示了他的紧致，也显示了他对你的[cock biggest]的需要。他在你的[cock biggest]上取悦自己时，保持着狂热的节奏。");
         }
         else
         {
            outputText("[pg]当你开始把自己塞进他紧致的尾穴时，阿克巴尔嚎叫着瑟缩起来。他的臀部扭动着，你不得不猛拉你用森林藤蔓做的项圈，以保持你的[cock biggest]埋在他那湿润得不可思议的紧致小穴里。一旦你设法让你的[cockHead biggest]穿过他紧绷的穴口，他又开始呜咽起来。你不得不拉着他的项圈，强迫他顺着你[cock biggest]的长度往下坐，但当你的巨根有一英尺进入他体内时，你的推进就停止了。还没等你抱怨，他的内脏就开始蠕动，变移着为你剩下的[cock biggest]腾出空间。你伸出手抓住他的臀部，把他往后拉，直到他那猫科动物的屁股紧紧贴在你的躯干上。当你紧紧抓住他肌肉发达的猫科臀部，不让他移动分毫时，他嚎叫起来。通过你完全埋入的[cock biggest]，你能感觉到他的小穴在颤抖，因为它泵出大量奶油般光滑的润滑液，试图让这场性爱变得更容易。猛拉项圈让恶魔开始慢慢地顺着你[cock biggest]的长度前后强迫自己。经过几次抽插后，阿克巴尔加快了速度，迷失在用你的巨根操自己的快感中。当他不断地将他贪得无厌的屁股撞向你时，他天然的润滑液甚至滑落下来，滴在你的[legs]上。当恶魔在你身上努力时，一声呻吟不由自主地从你嘴里溢出，他在几分钟内就从新手变成了专家。");
         }
         menu();
         addButton(0,"继续",fuckAkbitchsButt);
      }
      
      public function aliceTerm() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0)
         {
            return "爱丽丝";
         }
         return "小恶魔";
      }
      
      public function akbitchToughness(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         clearOutput();
         outputText("你低头看着你的杰作，惊叹于被伏击和支配竟然让这个恶魔如此兴奋。然而你想知道这只恶魔美洲豹到底有多喜欢这种事……你抓住了挂在他临时项圈上的藤蔓，[face]上浮现出恶意的笑容。你退后一步，无声地一拉，叫他过来。他躺在那里，双腿被绑无法动弹，燃烧的绿色眼睛里闪烁着骄傲，低声咆哮着露出牙齿。又一次突然的猛拉让他被拖在地上向前移动。他精瘦身体上的每一块肌肉都紧绷着，你知道这个自称[say: god]的家伙恨你。你微笑着看着他那肌肉发达的屁股在斑点皮毛下移动，你把他拖得离你更近。当他靠得足够近时，你蹲了下来。你伸出手，抓住他的脸，看着那双绝望而挑衅的眼睛。从他扭动那火热小屁股的方式，你能看出他的勃起正在困扰着他。他试图忍住呼噜声，眼睛落在了你的[feet]上。");
         outputText("[pg]当声音传入你的耳朵时，");
         if(get_player().hasCock())
         {
            outputText("[eachCock]抽搐着，开始流出先列腺液，为即将到来的事情做准备。你");
         }
         else
         {
            outputText("你");
         }
         outputText("忍不住揉了揉你的[nipple]，恶魔抬头看着你，眼中既有恐惧也有挑衅，同时还试图用低沉的咆哮来掩饰你让他有多兴奋。真是个骄傲的小婊子。");
         outputText("[pg]你命令他停止咆哮。他不仅声音更大了，还对你呲牙咧嘴。好吧，这可不行。你绕过这个咆哮的婊子，在他身后跪下。你重复了命令，但你的命令再次被无视。你抓住恶魔的后颈，将空着的手举向天空，然后伴随着回荡在树林中的响亮啪声落下。");
         outputText("[pg][say: 吼吼吼吼吼吼吼] 当你低头看着他现在紧紧夹住的毛茸茸的屁股时，阿克巴尔尖叫起来。你揉了揉那个地方，享受着恶魔咆哮时肌肉发达的后腿的触感。你再次抬起手，瞄准同一个地方，当你的手带着报复的意味再次落下时，恶魔再次咆哮起来。");
         outputText("[pg]你让他闭嘴，每一个音节都伴随着对他臀部的又一次打击。他拼命地嚎叫着，甚至没有试图服从你的命令。你瞄准他未受惩罚的一侧狠狠地打了一巴掌，他咆哮着，用他脑海里的声音威胁要用各种变态的惩罚来对付你。看来这个婊子还不明白，他不断的侮辱和威胁已经触及了你的底线。");
         outputText("[pg]抛开你伪装的平静，你开始肆无忌惮地狠狠打这只吵闹的美洲豹翘起的屁股。他的身体抽搐着，被绑住的腿试图在你身下疯狂地踢打。他试图扭过身来，你不得不紧紧抓住他的皮毛，以保持这个婊子面朝下。很快你的手掌就开始刺痛，他咬紧牙关努力保持安静。在几下用力、震动身体的试探性拍打之后，你觉得也许现在这个婊子愿意顺从了。");
         outputText("[pg][say: 好男孩，] 你一边说一边揉着那团滚烫的肉，当你接触到他刺痛的后臀时，恶魔退缩了一下。");
         outputText("[pg][say: 你会为此付出代价的，勇者，] 阿克巴尔保证道，他脑海里的声音充满了毒意。");
         outputText("[pg]一个婊子怎么敢这样对主人说话？被他的挑衅激怒，你开始再次打他翘起的屁股。你对恶魔的哭喊没有丝毫怜悯或同情，空气中充满了你空出的手化作残影疯狂拍打他屁股的声音。经过几分钟认真的掌掴后，你换了只手继续。恶魔继续扭动着，甚至开始求饶。他偶尔试图让自己安静下来，但你已经不再满足于仅仅是顺从。直到你的新换的手像旧手一样刺痛时，你才停下来。你抓住他的屁股，恶魔的整个身体都绷紧了，但他没有发出声音。这让你笑了。当你揉捏和抚摸他滚烫的屁股时，你让他清楚地知道到底是谁说了算。你告诉他你有多清楚他是个婊子。你甚至嘲笑他告诉你他是个[say: 神。] 他默默地承受着你的辱骂，没有反驳。最后打了一巴掌作为结束，你解开了恶魔的腿。他看向空地的另一边，似乎在考虑要不要疯狂地冲过去。你拽了拽他的项圈，无声地提醒他他仍然被你束缚着。当他终于真正屈服时，你的[face]上绽放出了一个笑容。");
         if(get_player().hasCock() && !param1)
         {
            get_player().orgasm("Dick");
            get_images().showImage("akbal-deepwoods-male-hightoughness");
            outputText("[pg]你命令恶魔把屁股撅起来。当他照做时，你帮他把胸部按在地上，确保他正确地拱起背。他毛茸茸的尾巴抬起，露出了他滴着水的小粉红玫瑰花蕾。你开始脱下你的[armor]，他的小穴收缩了几次，导致乳白色的润滑液滴到他的阴囊上。当你将自己暴露在空气中时，[EachCock]变得坚硬。阿克巴尔向你扭动着屁股，你意识到他有多渴望你进入他。看来这个恶魔已经决定做一个乖巧的小婊子了。你抓住你的[cock biggest]，咧嘴笑着放低身体骑上他。");
            _loc2_ = get_player().biggestCockIndex();
            if(get_player().cocks[_loc2_].cockLength < 7)
            {
               outputText("[pg]当你把你的[cockHead biggest]推入美洲豹体内时，他开始发出呼噜声，但很快就停了下来，想起他应该保持安静。从他紧致的直肠管滴下的润滑液变热了，你将坚硬的[oneCock]滑过他的操穴隧道，直到你将整个长度埋入他饥渴的尾穴中。你瞄准他仍然柔软的屁股打了一巴掌，导致通道收紧。你开始慢慢地将你的[cock]在他紧致的洞里抽插，陶醉在恶魔肠道里火热的湿润中。");
            }
            else if(get_player().cocks[_loc2_].cockLength <= 12)
            {
               outputText("[pg]当你把你的[cockHead biggest]推入美洲豹体内时，他退缩了一下，勉强保持安静。从他肛门开口滴下的润滑液帮助你把你的[cock biggest]塞进他紧致的洞里。这需要一些尝试，但一旦你把所有的[cock biggest]都沉入恶魔的后门，你瞄准他仍然柔软的屁股打了一巴掌，导致恶魔将他那活生生的肉棒管状尾穴紧紧缠绕在你深深嵌入的[cock biggest]上。你开始慢慢地前后摇晃，享受着他湿润的直肠通道挤压你[cock biggest]的感觉。");
            }
            else
            {
               outputText("[pg]当你把你的[cockHead biggest]推入美洲豹体内时，他的臀部转向一侧，躲避你的[cock biggest]。你拍了拍他柔软的臀部，然后抓住他纤细的臀部，猛地把他拉回原位。你一只手抓住他尾巴的根部，另一只手拿着你的[cock biggest]，慢慢地强行进入这个婊子紧致的洞里。让你的[cock biggest]滑入紧致的洞里是一项艰苦的工作。他刚刚受到的恶毒打屁股也没有让他成为最容易接受的婊子。恶魔的通道在你的[cock biggest]慢慢滑入他体内时颤抖着。一旦你把一英尺长的[cock biggest]插入他的身体，你缓慢的推进就停止了。包裹在你[cock biggest]前[if (metric) {四分之一米|十二英寸}]的紧致肉手套开始移动。当你开始把更多的[cock biggest]沉入阿克巴尔体内时，你能感觉到这个婊子的身体在腾出更多的空间。在对他受虐的后背狠狠地打了一巴掌后，你抓住他的臀部，把剩下的[cock biggest]强行塞进他体内，把扭动和咆哮的恶魔撑到了极限。你提醒他闭嘴，恶魔的手飞快地捂住嘴，试图让自己安静下来，避免进一步的惩罚。当你的根部压在恶魔柔软的屁股上时，你感觉到他的肛门环紧紧收缩并开始痉挛。阿克巴尔无法控制自己，当你的巨大肉棒让他把你们俩下面的草地染成白色时，他咆哮起来。你笑着，因为你嵌入的[cock biggest]被痉挛的通道榨取着。一旦结束，他就瘫软了，迫使你再次拍打他肌肉发达的脸颊，猛地把他柔软的屁股拉回正确的位置。现在他回到了正轨，你开始前后摇晃，他的通道现在比以前放松得多，也更容易穿透了。");
            }
            outputText("[pg]既然这个小婊子有点舒服了，你加快了节奏。用你[cock biggest]的全部长度，你开始伴随着回荡的啪啪声猛烈地撞击恶魔。每次你的身体撞击他翘起的臀部时，阿克巴尔都会退缩；好几次他发出了性感的小声呜咽。你猛烈地撞击他柔软的屁股和粗暴地操他紧致的洞的结合，让阿克巴尔几乎无法保持安静。你再次拍打他的小屁股，他发出一声叫喊，然后拼命试图让自己闭嘴。滴水的通道让你[cock biggest]因渴望而跳动。当你继续深深地操这只美洲豹时，他突然嚎叫起来。他的屁股向后推，紧紧夹住你大部分的[cock biggest]，同时他向地面喷射出");
            if(get_player().cocks[_loc2_].cockLength > 12)
            {
               outputText("另一股");
            }
            else
            {
               outputText("一股");
            }
            outputText("堕落的精液。");
            if(get_player().cor < 90)
            {
               outputText("[pg]恶魔的洞在你[cock biggest]周围痉挛，让你呻吟起来，随着阿克巴尔的高潮开始消退，允许你再次在他火热、湿润的直肠通道里移动。");
            }
            else
            {
               outputText("[pg]你抓住他的臀部，强行把这个小婊子颤抖的肛门环撞得变形，陶醉在脉动的压力中，阿克巴尔在你身下咆哮，当你用粗暴的推力摧毁他紧握的洞时，发出混合着痛苦和狂喜的声音。");
               outputText("[pg]阿克巴尔在地上抓挠着，当你带着报复的快感将臀部猛烈撞向他那被过度使用的穴口时，他发出了咆哮。当你狠狠地操着这个恶魔，粗暴地将你的[cock biggest]插进他那恶魔般的尾穴，直到你达到无法回头的临界点时，你能感觉到[eachCock]在渴望中跳动。");
            }
            if(get_player().hasKnot(_loc2_))
            {
               outputText("[pg]当你将肿胀的肉结强行塞进他那被摧毁的肛门环时，阿克巴尔发出了嘶嘶声。当肿胀的肉体被他那滚烫湿润的内脏吞没时，你全身都蜷缩了起来。你的[cock biggest]以百万吨级炸弹的威力爆发了。伴随着一声无言的尖叫，你颤抖着将阿克巴尔灌满了你的精液。当你的高潮消退时，你倒在他的背上，将你的肉结在他那被堵住的肠道里摩擦，直到肿胀消退到足以让你把[cock biggest]从他的穴里拔出来，让你的种子像瀑布一样从他那大张的尾穴流下。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("[pg]当你的[cock biggest]刺入他体内并膨胀时，阿克巴尔试图再次保持安静。你颤抖着抓住他的臀部并向后仰，咬紧牙关将你的精液射入恶魔那被塞满的肠道中。你能感觉到阿克巴尔的内脏在你的[cock biggest]的每一节周围痉挛，因为他正在拼命地榨取它。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("[pg]当你将[cock biggest]完全插入他那饱受蹂躏的穴中时，你只能听到阿克巴尔咆哮的声音。当你的[cock biggest]变得狂暴，以疯狂的舞蹈重新排列他的肠道，导致恶魔颤抖着迎来另一次较小的高潮时，他咬紧了牙关。这疯狂的舞蹈撑大了他的穴，当你在他那被摧毁的穴里摩擦你的[cock biggest]时，你的种子溢出，流到了你的[legs]和他的阴囊上。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("[pg]你感觉到你的[cock biggest]开始在阿克巴尔那被破坏的尾穴里跳动，他突然向后推，包裹住你整个[cock biggest]并挤压。当恶魔收缩的肛门肌肉将你推向狂喜的边缘时，你咆哮起来。你伴随着像锤击一样震撼你身体的剧烈痉挛，将你的种子射入他那挤压的肠道中。即使在你的高潮完全消退之后，这个小婊子仍然在挤压你那变软的[cock biggest]，让你的精液顺着你的[legs]和他的腿流下。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DRAGON)
            {
               outputText("[pg]你以不断增加的力量猛击恶魔那肌肉发达的屁股，将你[cock biggest]底部的球体在他的穴里来回锯动，每一次像攻城锤一样的猛击都让他痛呼出声。伴随着一声龙啸，你达到了高潮，用你那散发着奇特气味的种子填满了恶魔颤抖的肠道，而他则因为你给他的粗暴操弄和打屁股而颤抖。白色的粘液顺着他的阴囊和你的[legs]流下，当恶魔在你身下瘫软时，你露出了微笑。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.LIZARD)
            {
               outputText("[pg]阿克巴尔的内脏随着你疯狂的抽插而颤抖。你看着你那凹凸不平、紫色的[cock biggest]在阿克巴尔体内来回锯动，直到这种感觉让你仰起头。伴随着一声呻吟，你的[cock biggest]爆发了，当你插进去并保持不动时，将大量的精液射入阿克巴尔的肠道。当你将仍在喷射的[cock biggest]从阿克巴尔的穴里拔出来，并在他那圆润、肌肉发达、饱受蹂躏的屁股上涂上几股精液时，你的身体颤抖着。");
            }
            else
            {
               outputText("[pg]当你的[cock biggest]将阿克巴尔的肛门壁涂成白色时，你继续操着他那被摧毁的屁股。你每一次的喷射都带来一阵解脱感，你以火车般的冲力撞击恶魔的穴，猛击他那柔软的屁股，同时将乳白色的液体射入他颤抖的穴中。当你的高潮消退时，你最后一次拍打恶魔的屁股，这让他挤压他那饱受蹂躏的臀部，让乳白色的液体冲过你那嵌在里面的[cock biggest]，流下他那毛茸茸的阴囊。");
            }
            outputText("[pg]当你站起来时，阿克巴尔瘫软了。当你低头看时，你忍不住轻笑起来，你意识到你弄得一团糟。恶魔的身体颤抖着，他回头看，他的眼神在询问他作为婊子的职责是否已经完成。满意后，你收拾好你的[armor]，让阿克巴尔自己待着。当你到达森林边缘时，你听到他向一个小恶魔宣示主权的声音。你停下来，听着恶魔试图夺回他男子气概的声音，你心里清楚，他的屁股一直又酸又痛，还在滴水，这提醒着他，他到底是个多大的婊子。");
         }
         else
         {
            get_player().orgasm("VaginalAnal");
            get_images().showImage("akbal-deepwoods-female-highspeed");
            outputText("[pg]你把恶魔翻过来；当他酸痛的侧腹碰到森林的地面时，他几乎无法抑制地发出嘶嘶声。你用那根作为他小项圈牵引绳的藤蔓，跨坐在他的脸上，把恶魔的口鼻拉进你的[vagOrAss]里。");
            outputText("[pg]就像一个听话的婊子一样，他毫不犹豫地服从了你无声的命令。当那宽大的美洲豹舌头舔舐你的[vagOrAss]时，你在爆炸般的快感中摩擦着。他那美妙的唾液让你在片刻间颤抖起来。如果这还不够，他熟练地摆弄着你的[vagOrAss]，用他长长的舌头挑逗着你的");
            if(get_player().hasVagina())
            {
               outputText("[clit]");
            }
            else
            {
               outputText("前列腺");
            }
            outputText("。当你紧紧抓住项圈，让他的脸埋在你[vagOrAss]的重量下时，你的身体微微痉挛，那奇妙的舌头将你送入了天堂。");
            outputText("[pg]你把恶魔从你身边推开，带着性感的微笑顺着他的身体滑下。你毫不犹豫地伸手去抓他那长满倒刺的阴茎，把它对准你的[vagOrAss]，然后蹲下，直到他那坚硬的长度停在你的入口处。");
            if(!get_player().hasVagina() && get_player().ass.analLooseness < 2 || get_player().hasVagina() && get_player().looseness() <= 2)
            {
               outputText("[pg]当你的[vagOrAss]触碰到阿克巴尔那长满倒刺的蘑菇状龟头时，你的身体被爆炸般的快感击中。这种感觉是纯粹的狂喜，从你的[vagOrAss]爆发，传遍你的全身。你的[vagOrAss]开始扩张，阿克巴尔的唾液和浸透他勃起阴茎的润滑液的神秘混合物，让你毫无困难地吞下那根巨大的倒刺阴茎。你的肉体扩张以包容阿克巴尔阴茎的感觉既陌生又奇妙。一旦你能吞下整个长度，你就在他那令人产生快感的阴茎上上下弹跳，你的[face]上挂着灿烂的笑容。");
            }
            else if(!get_player().hasVagina() && get_player().ass.analLooseness < 4 || get_player().hasVagina() && get_player().looseness() < 4)
            {
               outputText("[pg]当你的[vagOrAss]触碰到阿克巴尔那长满倒刺的蘑菇状龟头时，你的身体被爆炸般的狂喜击中。阿克巴尔巨大的性器官就这样停留在你的[vagOrAss]里，这种感觉让纯粹的快感如波浪般传遍你的全身。你仰起头，拼尽全力骑乘着这个恶魔。");
            }
            else
            {
               outputText("[pg]当你的[vagOrAss]触碰到阿克巴尔那湿润的、长满倒刺的蘑菇状龟头时，你开始感到眩晕。他那沾满润滑液的阴茎触碰你那浸透唾液的[vagOrAss]的感觉，就像快感的海洋在你的身体里翻滚。你任由自己被这股浪潮席卷，开始熟练地在阿克巴尔的阴茎上上下滑动。你脸上挂着纯粹狂喜的表情，用尽你的一切骑乘着这个恶魔。");
            }
            if(get_player().hasVagina())
            {
               get_player().cuntChange(new Akbal().cockArea(0),true,true,false);
            }
            else
            {
               get_player().buttChange(new Akbal().cockArea(0),true,true,false);
            }
            outputText("[pg]恶魔开始试图将他的阴茎向上滑入你体内，以增加他自己的快感。你只需抬起一只手，他就停了下来，你可以自由地控制自己的节奏，有了这种自由，你加快了节奏，直到恶魔咬紧牙关，脚趾蜷缩。他不得不努力保持静止，这让你感到好笑，因为他对更多痛苦的恐惧战胜了他那传奇般的欲望。然后你感觉到了。他的身体开始痉挛。你感觉到他的阴茎在你体内爆发，让你充满了一种滚烫的温暖，这加剧了在你[vagOrAss]内发生的化学反应。");
            outputText("[pg]伴随着一声尖锐的叫喊，你高潮了，你的[vagOrAss]爆发了，让瀑布般的湿润顺着阿克巴尔嵌在你体内的肉棒流下。");
            if(get_player().hasCock())
            {
               outputText("[EachCock]同时喷发，将阿克巴尔的胸膛涂满了白色的粘液。随着每一次高潮席卷全身，你都变成了一滩颤抖的烂泥。不管你怎么说这个小婊子，他的鸡巴绝对是独一无二的。");
            }
            outputText("随着高潮消退，你任由恶魔那依然勃起的鸡巴在你体内磨蹭了一会儿。不需要再次威胁他，你站起身来，任由精液顺着双腿流下，滴落在阿克巴尔的腹股沟上。");
            outputText("[pg]你头也不回地拿起你的[armor]，带着[face]上灿烂的笑容离开了森林。");
         }
         if(get_player().hasVagina())
         {
            get_player().knockUp(1,432,101);
         }
         dynStats(DynStat.Cor(3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbitchNoThnx(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你转过身，让这只恶魔清理完自己，并庆幸他这次没有伏击你。");
         if(get_player().get_lust() < 33)
         {
            outputText("况且，你现在也没什么性致。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbitchHighStrengthVariant(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         clearOutput();
         outputText("带着邪恶的笑容，你撕下你的[armor]，抓住被束缚的恶魔的后颈。当你把他举到与你视线齐平时，他做了一个性感的小扭动，你轻松地操纵着他轻盈的体重，检查着他苗条、健美的身体。他的胸膛起伏着，他勃起的恶魔猫肉棒流下了一条浓稠的乳白色河流，弄脏了他阴囊和大腿内侧的皮毛。这将会很有趣。");
         if(get_player().hasCock() && !param1)
         {
            get_images().showImage("akbal-deepwoods-male-highstrength");
            outputText("[pg]阿克巴尔舔着你的[face]，很明显已经迷失在欲望中。你忍不住轻笑，因为这个自称神明的家伙已经变成了你顺从的小婊子。你把他按在附近的一棵树上，双手顺着他那被欲望逼疯的身体滑下。然后你抓住你的[cock]，把它推入恶魔柔软的裂缝中。");
            _loc2_ = get_player().biggestCockIndex();
            if(get_player().cocks[_loc2_].cockLength < 7)
            {
               outputText("[pg]当你把你的[cockHead biggest]塞进他那火热、滴水的洞穴时，阿克巴尔发出了呼噜声。从他肛门壁渗出的纯天然润滑液帮助你顺畅地滑过紧致的圆环。为了展示力量，你把恶魔从树上拉开，支撑着他的全部重量，开始在你的[cock biggest]的整个长度上将他举起又放下。当你肆无忌惮地将他的整个身体撞向你挺进的[cock biggest]时，阿克巴尔发出了呼噜声。巨大的倒刺肉棒滑过你的[fullChest]，他那火热、湿润的尾洞的紧致感让你呻吟，这让他的快乐变得更加明显。");
            }
            else if(get_player().cocks[_loc2_].cockLength <= 12)
            {
               outputText("[pg]当你把你的[cockHead biggest]塞进他那火热、滴水的尾洞时，阿克巴尔发出了呻吟。从他肛门壁渗出的润滑液让你毫不费力地将你的整个[cock biggest]滑入光滑的通道，你从眼角余光中瞥见恶魔的脚趾在扭动。为了炫耀你的肌肉，你把恶魔的整个身体举起，直到只有你的[cock biggest]的尖端还埋在他紧致的开口里。毫无预兆地，你向前挺进，同时将他猛地摔下，尽可能用力地将你的整个[cock biggest]撞入他体内。他退缩并咆哮着。当你继续支撑着他的全部重量并猛击他紧紧依附的内脏时，他的恶魔猫肉棒不断地滑过你的[fullChest]，顺着你的身体流下一股稳定的先列腺液。他苗条的体重很容易操纵。他的洞穴随着你的挺进有节奏地挤压着，按摩着你插入的[cock]，刺激你更加用力地撞向他颤抖的洞穴。");
            }
            else
            {
               outputText("[pg]当你的[cockHead biggest]被塞进他那紧致、滴水的尾洞时，阿克巴尔发出了咆哮。纯天然的润滑液几乎无法帮助你打通进入他结肠的道路。他在你怀里扭动着，试图逃离你强行入侵的[cock biggest]带来的突然压力。你笑着把他拉下来，同时向上推入他滴水的尾洞。在你的[cock biggest]大约有一英尺强行进入他火热的内脏后，你停了下来。你开始感觉到一阵隆隆声，让你插入的[cock biggest]部分感到发痒。你意识到阿克巴尔的内脏已经开始移动，为你的[cock biggest]腾出空间。当你把被束缚的恶魔苗条的身体推下你的[cock biggest]，直到他的屁股吞没了你的整个长度时，他退缩并咆哮着。恶魔颤抖着，他那长满倒刺的工具爆炸了，用长长的、甜美的、奶油般的猫精液涂满了你的[fullChest]和[face]。你弯曲肌肉，把他的背从树上拉开，开始在你的[cock biggest]的整个长度上将阿克巴尔举起又放下。尽管他之前已经高潮过，但阿克巴尔那长满倒刺的肉棒仍然坚如磐石地抵在你的[fullChest]上，并顺着你已经弄脏的前胸流下一条浓稠的乳白色河流。当你把他猛地摔下，用你的[cock biggest]劈开这个心甘情愿的婊子时，你咧嘴笑着，看着这个地狱之火的“神明”翻着白眼。");
            }
            outputText("[pg]突然，阿克巴尔的身体开始抽搐，一股白热的奶油喷射到你的下巴上，紧接着又是一股，又是一股，导致他的洞穴在你插入的肉棒周围颤抖，因为恶魔卸下了");
            if(get_player().cocks[_loc2_].cockLength > 12)
            {
               outputText("另一股");
            }
            else
            {
               outputText("一股");
            }
            outputText("巨大的高潮喷射在你的[fullChest]上。");
            if(get_player().cor < 90)
            {
               outputText("[pg]看着恶魔欢愉的证据不断喷涌，把你下巴以下的地方都浸透在恶魔的精液中，你忍不住笑了起来，这让你知道他确实是你的小婊子。");
            }
            else
            {
               outputText("[pg]你绷紧肌肉，双臂环抱住阿克巴尔纤细的腰肢，微微弯腰以获得更好的角度。你开始在恶魔颤抖的洞穴里抽插，用粗暴的冲刺蹂躏着那痉挛的肉鞘。随着他那恶魔猫鸡巴的爆发，你每一次震撼灵魂的冲刺都让恶魔发出嚎叫，把你下巴以下的地方都弄得一团糟，沾满了滚烫、浓稠的液体。");
            }
            outputText("[pg]阿克巴尔在高潮结束时浑身发抖。你的[cock biggest]仍然插在里面，你们俩倒在森林的地面上。伴随着一声咆哮，你用尽全力将你的[cock biggest]撞进他的身体，你感觉到[eachCock]开始颤抖。你的[cock biggest]每一次整根没入的撞击，都会从恶魔的喉咙里逼出一声尖叫。很快，当你把阿克巴尔按在地上猛干时，你感觉到腹股沟处积聚起一种熟悉的压力。");
            if(get_player().hasKnot(_loc2_))
            {
               outputText("[pg]你用尽全力，将你的[cock biggest]猛地撞进这个婊子被蹂躏的尾穴中，伴随着“啵”的一声，强行将你肿胀的肉结塞了进去。当你塞住他的肛门环，确保你的精液不会从他火热的小洞里漏出来时，恶魔发出了一声低吼。伴随着隆隆的嚎叫，你将精液卸入恶魔被塞住的肠道中，你的精液倾泻进那火热的管道里，直到你的[cockHead biggest]浸泡在你自己的精液中，阿克巴尔的肚子也微微鼓起。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("[pg]你仰起头，用尽全力撞向这个小婊子，抽插的力度加倍。在阿克巴尔被重新排列的肠道深处，你的[cock biggest]向他颤抖的体内喷射出如潮水般的精液。当你的[cock biggest]在他体内抽搐，用新鲜的精液灌满他时，你和恶魔一起大叫起来，同时你在他那小婊子的洞里研磨着你的[cock biggest]。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("[pg]当你感觉到即将到来的高潮压力不断积聚时，你将你的[cock biggest]直插到底。在阿克巴尔的肠道里，你的[cock biggest]变得疯狂起来。你不得不加倍努力，把他的腿按在他沾满精液的胸前，因为当你的[cock biggest]在他过度刺激的屁股里扭动和旋转时，他还在挣扎。当你深深埋入的[cock biggest]开始溢出精液时，你忍不住将你的[cock biggest]在阿克巴尔被摧毁的肠道里研磨，而恶魔则变得软弱无力，太累了，无法抗拒你的[cock biggest]给他带来的强烈感觉。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("[pg]当你将你的[cock biggest]直插到底时，阿克巴尔大声地发出呼噜声，显然非常喜欢你的[cock biggest]。你的[fullChest]紧贴着他沾满精液的胸膛，你的[cock biggest]开始用滚烫的精液轰炸他的内脏。随着你高潮的肆虐，你在恶魔那按摩般的洞穴里研磨着你的[cock biggest]。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DRAGON)
            {
               outputText("[pg]当你将你的[cock biggest]整根撞进阿克巴尔翘起的屁股时，他退缩了一下，因为你阴茎底部的球茎被推入了他的体内。这对你来说无关紧要，因为你的[cockHead biggest]开始向他颤抖的肠道里喷射出大量的滚烫精液。当你在他的洞里研磨你的[cock biggest]时，恶魔扭动着身体，一条白色的浓稠河流从被蹂躏的洞里溢出，顺着他的身体滑落到森林的地面上。");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.LIZARD)
            {
               outputText("[pg]当你将你的[hips]撞进阿克巴尔翘起的屁股时，他突然收紧了。恶魔享受着那凹凸不平的质感，当你埋入的[cock biggest]爆发并将滚烫的精液射入他被塞满的肠道时，他发出了呻吟。随着你的身体随着[cock biggest]的每一次抽搐而痉挛，这个婊子的洞开始溢出，浓稠的精液从他被蹂躏的洞里溢出。");
            }
            else
            {
               outputText("[pg]你用尽全力将你的[cock biggest]撞进他翘起的屁股里并保持不动，当你把一团团白热的精液射进他被摧毁和蹂躏的洞里时，恶魔发出了咆哮。很快，你的精液顺着他翘起的屁股滴落，洒在森林的地面上。");
            }
            if(get_player().cor < 90)
            {
               outputText("[pg]你站起来，让阿克巴尔放松下来，同时你收集你的[armor]。穿好衣服后，你弯下腰解开他，然后返回营地。");
            }
            else
            {
               outputText("[pg]你站起来，阿克巴尔的腿从你把它们按在他胸前的地方无力地垂下。你收集你的[armor]并穿好衣服，然后狠狠地扇了阿克巴尔娇嫩的脸颊一巴掌，把他绑在那里，留给那些你发现正在树林里偷看你们俩的小恶魔和地精。[pg]你告诉他，他现在全是他们的了，然后带着一个阴谋得逞的笑容返回营地。");
            }
            get_player().orgasm("Dick");
            dynStats(DynStat.Cor(3));
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_images().showImage("akbal-deepwoods-female-highstrength");
            outputText("[pg]阿克巴尔舔着你的[face]，很明显已经迷失在情欲中。他已经失去了作为某个神的伪装，现在是你个人的小婊子。带着邪恶的笑容，你让他屁股着地摔在地上，让他平躺着。你转过身，蹲下，直到你的[vagOrAss]对着他的脸，让他好好闻闻。然后你毫不客气地抓住他头上的毛，把他的脸猛地塞进你的[vagOrAss]里。");
            outputText("[pg]阿克巴尔开始用老手的技巧舔弄你的[vagOrAss]。当他用他滚烫的唾液涂抹你的");
            if(get_player().hasVagina())
            {
               outputText("下唇");
            }
            else
            {
               outputText("入口");
            }
            outputText("时，你退缩了一下。一股像闪电一样的电流穿过你的身体，让你把自己撞向他的脸。他又长又粗的舌头是滚烫的极乐，像个专业人士一样挑逗和取悦你，一次又一次地把那诱发快感的唾液带进你的[vagOrAss]。你的身体在那种感觉中研磨，这个好小婊子的唾液浸透了你的[vagOrAss]，直到它滴下你性液和他唾液的混合物。你把他留在这里，直到那挑逗的快感强烈到你快要爆发。");
            outputText("[pg]毫无预兆地，你把这个小贱货推倒在地，把他的腿压在胸前。他沉甸甸的囊袋紧绷着，自带润滑的肉棒依然在喷涌着润滑液和先列腺液。你用肌肉的力量，用双腿将他困在这个姿势，然后伸手到身后抓住他带倒刺的肉棒。那带刺的器官像橡胶一样，沾满了湿滑的液体。你的触碰让阿克巴尔试图向上挺动，但在像你这样强壮的人面前，这几乎是不可能的。你将他那湿滑、带棱纹的恶魔猫肉棒对准你的[vagOrAss]，开始缓缓坐下。");
            if(!get_player().hasVagina() && get_player().ass.analLooseness < 2 || get_player().hasVagina() && get_player().looseness() <= 2)
            {
               outputText("[pg]当你的[vagOrAss]开始包裹住阿克巴尔那根巨大的、带倒刺的肉棒粗大的头部时，你发出一声响亮的呻吟。当你[vagOrAss]上残留的唾液与阿克巴尔肿胀性器官上的润滑液混合时，你的身体因如潮水般涌来的快感而退缩。甚至那些华丽的倒刺感觉也像是柔软、振动的珠子，在你包裹住这根恶魔肉棒时扭动着。多亏了这种混合液，你能够吞下他的全部长度，并沉浸在拥有所有这些男人肉体所带来的拉伸感中。阿克巴尔试图移动，试图向上挺进你的[vagOrAss]，但你把他按在这里，轻松地压制住这个小贱货，彰显你的统治地位。");
            }
            if(!get_player().hasVagina() && get_player().ass.analLooseness < 4 || get_player().hasVagina() && get_player().looseness() < 4)
            {
               outputText("[pg]当你的[vagOrAss]开始包裹住阿克巴尔那根巨大的、带倒刺的肉棒粗大的头部时，你发出一声欢快的尖叫。当你沾满唾液的[vagOrAss]接触到浸透他恶魔肉棒的润滑液时，你几乎要被这种混合物带来的巨大快感弄得晕厥过去。那些奇妙的倒刺甚至在你娇嫩的肉体上振动。你体内那根粗壮的肉棒是纯粹的灼热和振动的快感，让你的身体从[vagOrAss]一直酥麻到[feet]。阿克巴尔试图移动，试图向上挺进你的[vagOrAss]，但你把他按在这里，轻松地压制住这个小贱货，彰显你的统治地位。");
            }
            else
            {
               outputText("[pg]当那根巨大的勃起物一接触到你的[vagOrAss]，你的脸就扭曲成一种纯粹因极度兴奋而产生的性感表情。你沾满唾液的[vagOrAss]开口接触到他浸透润滑液的性器官，让你眼冒金星。再加上里面倒刺似乎在振动的感觉，你简直置身于天堂。你毫无困难地顺着阿克巴尔的长度滑了下去。阿克巴尔试图移动，试图向上挺进你的[vagOrAss]，但你把他按在这里，轻松地压制住这个小贱货，彰显你的统治地位。");
            }
            if(get_player().hasVagina())
            {
               get_player().cuntChange(new Akbal().cockArea(0),true,true,false);
            }
            else
            {
               get_player().buttChange(new Akbal().cockArea(0),true,true,false);
            }
            outputText("[pg]你把手放在阿克巴尔肌肉发达的小腿上并向下压，导致恶魔的肉棒在你体内颤抖。你的双腿放在他的双腿外侧，你夹紧他的双腿，开始前后摇摆。当你慢慢地在阿克巴尔坚挺的快感之棒上滑上滑下时，他发狂了。当你尽可能慢地在他身上折磨般地滑上滑下时，你能感觉到他的肌肉在对抗你老虎钳般的抓握，你强迫自己不要发狂，默默地对你的贱货宣示你的统治地位。过了一会儿，你开始加速，在你滑过他坚如磐石的恶魔肉棒时，慢慢加快节奏。");
            outputText("[pg]很快你就感觉到阿克巴尔埋入的肉棒开始跳动，当他滚烫的浓精射入你现在快速骑乘的[vagOrAss]时，每一种感觉都被放大了。这种感觉太强烈了。");
            if(get_player().hasVagina())
            {
               outputText("[pg]你的[vagina]爆发了，导致你的身体抽搐扭曲，你快速地泵出你的高潮。");
            }
            else
            {
               outputText("[pg]你的身体开始痉挛，你感觉仿佛有纯粹狂喜的闪电射穿了你的灵魂。");
            }
            if(get_player().hasCock())
            {
               outputText("[EachCock]肿胀并爆发，当你射出一股又一股浓稠的白色精液时，浓精射满了阿克巴尔的大腿、胸部和脸庞。");
            }
            get_player().orgasm("VaginalAnal");
            dynStats(DynStat.Cor(3));
            if(get_player().hasVagina())
            {
               get_player().knockUp(1,432,101);
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function akbitchEncounter() : void
      {
         var _g:AkbalScene;
         clearOutput();
         outputText("当你在密林深处探索时，你开始听到一阵轻柔的吸吮声。在这个世界里，你知道任何奇怪的声音，尤其是那种湿漉漉的声音，很可能意味着前方有危险……或者某个危险的家伙正在操某个没那么危险的家伙。当你小心翼翼地前进时，你看到了美洲豹恶魔阿克巴尔的毛皮。这只恶魔豹坐在空地中央，伸出一条腿，用宽大的舌头不断舔舐着自己的后穴，大概是在清理拜你所赐的小恶魔精液。他如此全神贯注，以至于没有注意到你的靠近。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,903,1);
         if(!get_player().isCorruptEnough(40) && !get_player().hasPerk(PerkLib.Pervert) && !get_player().hasPerk(PerkLib.Sadist) || get_player().get_lust() < 33)
         {
            akbitchNoThnx(false);
         }
         else
         {
            outputText("[pg]你要再次占他的便宜吗？");
            menu();
            _g = this;
            addButton(1,"否",function():void
            {
               _g.akbitchNoThnx();
            });
            addButton(0,"是",takeAdvantageOfAkbitch);
         }
      }
      
      public function akbalWon(param1:Boolean, param2:Boolean = false) : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,17,-1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,903,0);
         _temp_1.timesRaped += 1;
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有感到恶心到要离开……");
         }
         if(param1)
         {
            healthLoss();
         }
         else
         {
            loseToAckballllllz();
         }
      }
      
      public function akbalSubmit() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         get_player().slimeFeed();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,16,FlagDict_Impl_.arrayReadInt(_loc1_,16) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,17,2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,903,-1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,16) > 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,15) < 2 && get_player().butt.rating >= 13 && get_player().tone < 80)
         {
            akbalBigButtSubmit();
            return;
         }
         clearOutput();
         if(get_player().hasTailInsteadOfLegs())
         {
            get_images().showImage("akbal-deepwoods-naga-sumbitanal");
            outputText("思考了片刻后，你向阿克巴尔点了点头，脑海中那个充满磁性的声音命令你脱下衣服。你脱下[armor]放在一边，没过多久，恶魔就扑到了你身上。[pg]");
            outputText("阿克巴尔将你脸朝下按在地上，前爪压在你的背上，把你的胸膛死死地钉在地面。他移开爪子，你试图调整姿势，却又被按了回去，这无声的命令让你保持这个姿势。当你的下半身蜷缩在腹部下方，高高撅起[butt]时，你忍不住扭动了一下。[pg]");
            outputText("当他把脸埋进你的[butt]时，你因为这突如其来、莫名其妙的色情感觉而瑟缩了一下。[pg]");
            outputText("他将湿滑的舌头伸进你的[asshole]，贪婪地舔舐着你暴露的后庭，仿佛那是一个快要融化的冰淇淋。这种感觉让你呻吟出声，你向后迎合着他的舌头，瞬间沉浸在狂喜之中[if (!isMer) {。你长长尾巴的一部分缠绕在他的腰上，将他固定在那里，你陶醉|，陶醉}]在被一个行家舔弄后庭的快感中。你甚至弓起背，让他那又长又粗的美洲豹舌头更深地插入你的[asshole]。你感觉到他的唾液，像融化的糖果一样浓稠温暖，滑入你的体内，涂满你的内壁。[pg]");
            outputText("一股突如其来的暖流加热了你的内脏，让你在狂喜中颤抖。阿克巴尔停顿了片刻[if (isMer) {喘息|，将你的下半身从他胸前解开}]，然后起身骑上你。一只爪子将你抬起的胸膛和脸再次按进泥土里，当阿克巴尔在你上方就位时，冰冷的泥土粘在了你的身上。[pg]");
            if(get_player().ass.analLooseness < 3)
            {
               outputText("你感觉到他在你的[asshole]周围试探，并很快意识到他的阴茎不仅大得离谱，而且龟头上还布满了十几个微小的倒刺。你咬紧牙关，做好了迎接疼痛的准备，然而，多亏了他涂抹在你体内的那种奇怪唾液，当他巨大的阴茎强行撑开你的[asshole]时，你并没有感到任何疼痛。[pg]");
               outputText("被阿克巴尔那又长又滑的阴茎撑开的感觉让你不寒而栗，那奇怪的唾液甚至变热了，在你的体内产生了一种蒸汽般的温暖，而阿克巴尔同样滚烫的阴茎将你撑开，让你的身体微微痉挛。在几次缓慢、浅浅的抽插之后，你开始感觉到倒刺在震动。这种震动让你发疯，那些看起来邪恶的倒刺感觉更像是嗡嗡作响的性爱珠，而不是惩罚性的尖刺。当阿克巴尔加快速度时，你咬紧牙关，因为你被撑到了自然极限之外。");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("你感觉到他在你的[asshole]周围试探，并很快意识到他的阴茎不仅相当大，而且上面布满了将近十几个微小的倒刺。然而，多亏了他涂抹在你体内的那种奇怪唾液，当他巨大的阴茎强行撑开你的[asshole]时，你并没有感到任何疼痛。[pg]");
               outputText("阿克巴尔那巨大的阴茎撑开了你的[asshole]，让你在他身下呻吟，陶醉在肠道里那湿滑的灼热和饱满感中。他的唾液变热了，在你的体内产生了一种蒸汽般、令人愉悦的温暖。当他开始在你体内抽插他那巨大的性器官时，覆盖在他龟头上的倒刺开始震动，用排山倒海般难以忍受的快感冲击着你的身体，感觉更像是震动的性爱珠，而不是惩罚性的尖刺。你的身体开始不受控制地行动，你的[butt]迎合着他的抽插，当他那巨大的性器官滑入时，他的根部撞击着你的[butt]，发出有节奏的、回荡的啪啪声。");
            }
            else
            {
               outputText("你感觉到他在你的[asshole]周围摸索，很快意识到他的阴茎不仅相当大，而且布满了近十几个微小的倒刺。当阿克巴尔开始插入你时，他惊讶地发现他的根部突然撞到了你的[butt]，这突如其来的入侵让你低吟出声。[pg]");
               outputText("他涂满你内壁的奇怪唾液瞬间开始变热，覆盖在他龟头上的倒刺开始震动。震动的倒刺感觉就像十几个滑溜溜的小性爱珠在被推入你体内时旋转和摇晃。阿克巴尔没有浪费时间，开始不顾一切地强行操弄你的[asshole]，他每一次粗暴的抽插都让你的身体在泥土中向前滑动。你试图迎合他深深的抽插，但这只美洲豹以猎豹般的速度和力量操你，不断震动的倒刺让你体内每一次锤击都让你的身体颤抖。");
            }
            get_player().buttChange(new Akbal().cockArea(0),true);
            outputText("[pg]");
            outputText("阿克巴尔的臀部快速运动，像活塞一样将他那长长的恶魔猫阴茎在你的[asshole]里抽插。你的声音随着他疯狂的抽插而起伏。你的身体被一次又一次的高潮折磨着，很快你就趴在自己的爱液池中，胸部和膝盖着地。[pg]");
            outputText("阿克巴尔发出一声粗哑的咆哮，你感觉到那根巨大的猫科动物阴茎在你体内抽搐和膨胀。当恶魔猫滚烫、堕落的种子射入你体内时，你自己的胸腔里也发出了一声咆哮。尽管已经达到了高潮，但这只美洲豹的活塞式抽插并没有减慢，直到他爆发了不下六次，整个过程中都在巧妙地操弄着你的小穴。[pg]");
            outputText("在他最后一次大规模爆发之后，你感觉到这只美洲豹拔了出来，从你快乐的小穴中释放出更多他那丰富的精液，在一种奇妙的满足感中，浓稠的白色奶油像瀑布一样顺着你的身体流下。[pg]");
            outputText("这只美洲豹似乎不再介意你出现在他的领地里，他将疲惫的身体覆盖在你的身上，你们俩陷入了性爱后的昏迷中。");
            dynStats(DynStat.Cor(4 + Utils.rand(8)));
            dynStats(DynStat.Spe(1 + Utils.rand(2)));
            get_player().orgasm("Anal");
            if(get_player().butt.rating < 8)
            {
               outputText("[pg]在你的睡梦中，你的屁股微微丰满起来，为了迎合恶魔的愿望而变大……");
               var _temp_1:* = get_player().butt;
               _temp_1.rating = _temp_1.rating + 1;
            }
            get_player().createStatusEffect(StatusEffects.PostAkbalSubmission,0,0,0,0);
            get_player().sleeping = true;
            doNext(get_camp().returnToCampUseEightHours);
            return;
         }
         if(get_player().isTaur())
         {
            get_images().showImage("akbal-deepwoods-taur-sumbitanal");
            outputText("思考了片刻后，你向阿克巴尔点了点头。你脑海中那个低沉的声音命令你脱下衣服。你脱下[armor]放在一边，同时在心理上为这个恶魔的想法做好准备。[pg]");
            outputText("这只美洲豹迅速骑上你，开始用他强有力的臀部推着你向前，他的恶魔猫阴茎在你的[butt]缝隙中滑动。他引导你走向一棵树，强迫你胸部朝前贴在粗糙的树皮上。[pg]");
            outputText("回头看，你看到阿克巴尔弯下腰，当他消失在你身后时，你失去了这只美洲豹的视线。有一瞬间你想知道他在做什么，但很快你就感觉到他伴随着一声咆哮，把脸埋进了你的[butt]。他开始将湿滑的舌头伸进你的[asshole]，贪婪地舔舐着你暴露的后庭，仿佛那是一个快要融化的冰淇淋。这种感觉让你呻吟出声，迎合着他的舌头，瞬间沉浸在狂喜之中。你对恶魔脖子上的力量感到惊讶，他仅仅用嘴就把你的身体撞在树上。你感觉到他的唾液，像融化的糖果一样浓稠温暖，滑入你的体内，涂满你的内壁。");
            if(get_player().hasVagina())
            {
               outputText("阿克巴尔一路吸吮到你的[vagina]，扭动着他的脸，将舌头钻进你体内，无情地攻击你的[clit]，让你在狂喜中尖叫、嚎叫和退缩。然后他用舌头在你的[clit]上旋转，让你将肿胀的性器官在美洲豹的嘴唇上摩擦。");
            }
            if(get_player().balls > 0)
            {
               outputText("阿克巴尔顺着你的身体舔舐到你的[sack]，将他浓稠温热的唾液涂抹在你的阴囊上。阿克巴尔灵巧的舌头挑逗并轻轻把玩着你敏感的[balls]，让你忍不住呻吟出声。他将你的两颗睾丸都吸入口中，这种感觉让你爽得直翻白眼，浑身战栗。");
            }
            outputText("当他的口舌服务结束后，你的体内突然涌起一阵暖意，随着恶魔起身骑上你，你在极致的快感中颤抖起来。[pg]");
            if(get_player().ass.analLooseness < 3)
            {
               outputText("你感觉到他在你的[asshole]周围试探，并很快意识到他的阴茎不仅大得离谱，而且龟头上还布满了十几个微小的倒刺。你咬紧牙关，做好了迎接疼痛的准备，然而，多亏了他涂抹在你体内的那种奇怪唾液，当他巨大的阴茎强行撑开你的[asshole]时，你并没有感到任何疼痛。[pg]");
               outputText("被阿克巴尔那根又长又滑的阴茎撑开的感觉让你浑身发抖。那种奇怪的唾液甚至开始发热，在你的体内产生了一种湿热的温暖感，阿克巴尔滚烫的阴茎让你的身体微微痉挛。在几次缓慢而浅的抽插之后，你开始感觉到那些倒刺在震动。这种震动让你的身体一阵抽搐，那些看起来邪恶的倒刺感觉更像是嗡嗡作响的性爱珠，而不是惩罚性的尖刺。当阿克巴尔加快速度时，你咬紧牙关，因为你被撑到了自然极限之外。");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("你感觉到他在你的[asshole]周围试探，并很快意识到他的阴茎不仅相当大，而且上面布满了将近十几个微小的倒刺。然而，多亏了他涂抹在你体内的那种奇怪唾液，当他巨大的阴茎强行撑开你的[asshole]时，你并没有感到任何疼痛。[pg]");
               outputText("阿克巴尔巨大的阴茎撑开了你的[asshole]，让你呻吟着抓挠着他把你压在上面的那棵树，沉浸在肠道中那滑腻的灼热和充实感中。他的唾液开始发热，在你的体内产生了一种湿热却又令人愉悦的温暖感。当他开始在你体内抽插他巨大的性器官时，覆盖在龟头上的倒刺开始震动，一波又一波难以忍受的快感如潮水般冲击着你的身体，感觉更像是震动的性爱珠，而不是惩罚性的尖刺。你向后迎合着他的抽插，他的身体开始有节奏地撞击你的[butt]，发出响彻森林的啪啪声。");
            }
            else
            {
               outputText("你感觉到他在你的[asshole]周围试探，并很快意识到他的阴茎不仅相当大，而且上面布满了将近十几个微小的倒刺。当阿克巴尔开始进入你时，他惊讶地低吼了一声，因为他巨大的肉棒轻易地没入了你的[butt]，这突如其来的入侵让你忍不住娇吟出声。[pg]");
               outputText("他涂抹在你体内的奇怪唾液立刻开始发热，覆盖在他龟头上的倒刺也开始震动。那种感觉就像十几个滑腻的小性爱珠在被推入你体内时旋转和摇晃。阿克巴尔没有浪费时间，开始不顾一切地强行操弄你的[asshole]，他每一次粗暴的抽插都让你被压着的那棵树前后摇晃。你试图迎合他深深的抽插，但这只美洲豹以猎豹般的速度和力量操着你，不断震动的倒刺让你在每一次对你体内的锤击中浑身战栗。");
            }
            get_player().buttChange(new Akbal().cockArea(0),true);
            outputText("[pg]");
            outputText("阿克巴尔快速地摆动着臀部，像活塞一样将他那根长长的恶魔猫肉棒在你的[asshole]里进进出出。你的身体被一次又一次的高潮折磨着，很快，你那不断刨地的蹄子下方的地面就被一层厚厚的、你自己的爱液覆盖了。然后，阿克巴尔发出一声粗哑的咆哮，你感觉到那根巨大的猫科动物阴茎在你体内抽搐并膨胀。你的胸腔里也发出了一声低吼，因为恶魔猫滚烫、堕落的精液射入了你的体内。那种湿热的温暖感被更深地操进你体内的感觉，与无上的极乐如此接近，你几乎分辨不出其中的区别。[pg]");
            outputText("过了一会儿，你意识到阿克巴尔并没有减速。他那像活塞一样抽插的臀部直接穿过了他的高潮，并且从未停止撞击你的[butt]。他继续着，直到他爆发了不下八次，整个过程中都在熟练地操弄着你的小穴。[pg]");
            outputText("在他最后一次大规模的爆发之后，你感觉到这只美洲豹拔了出来，从你那快乐的小穴中释放出更多他那丰富的精液，形成了一种奇妙而令人满足的浓稠白色奶油瀑布，像瀑布一样顺着你的腿流下来");
            if(get_player().totalCocks() > 0)
            {
               outputText("与你自己的混合在一起");
            }
            outputText("。[pg]");
            outputText("你闭上眼睛，心甘情愿地陷入了性爱带来的沉睡中。");
            dynStats(DynStat.Cor(4 + Utils.rand(8)));
            dynStats(DynStat.Spe(1 + Utils.rand(2)));
            get_player().orgasm("Anal");
            if(get_player().butt.rating < 8)
            {
               outputText("[pg]在你的睡梦中，你的屁股微微丰满起来，为了迎合恶魔的愿望而变大……");
               var _temp_2:* = get_player().butt;
               _temp_2.rating = _temp_2.rating + 1;
            }
            get_player().createStatusEffect(StatusEffects.PostAkbalSubmission,0,0,0,0);
            get_player().sleeping = true;
            doNext(get_camp().returnToCampUseEightHours);
            return;
         }
         get_images().showImage("akbal-deepwoods-sumbitanal");
         outputText("思考了片刻后，你向阿克巴尔点了点头。你脑海中那个低沉的声音命令你脱下衣服。你顺从地脱下你的[armor]并把它放在一边，就在恶魔扑向你之前。[pg]");
         outputText("阿克巴尔把你脸朝下推倒在地上，把他的前爪放在你的背上，把你的胸部压在地上。几秒钟后他移开了爪子，你试图重新调整姿势，却又被推倒在地：这是一个无声却强硬的命令，让你保持这个姿势。[pg]");
         outputText("他突然把你翘起的下半身拉向他，并把脸埋进你的[butt]里。他那滑溜溜的湿舌头开始钻进你的[asshole]，贪婪地舔舐着你暴露的后背，就好像它是一个快要融化的冰淇淋蛋筒。这种感觉让你呻吟着在舌头上摩擦，很快就迷失在狂喜中。你张开你的[legs]并拱起背，让他那又长又粗的美洲豹舌头钻进你的[asshole]更深处。你感觉到他浓稠温热的唾液滑入你的体内，涂满了你的内壁。[pg]");
         if(get_player().hasVagina())
         {
            outputText("阿克巴尔顺着你的身体舔舐到你的[vagina]，扭动着脸，将舌头钻进你的体内，无情地攻击你的[clit]，让你在刺激中尖叫、嚎叫和退缩。然后他转动舌头抵住你的[clit]，让你将肿胀的私处摩擦着他的美洲豹嘴唇。");
         }
         else if(get_player().balls > 0)
         {
            outputText("阿克巴尔顺着你的身体舔舐到你的[sack]，将他温热的唾液涂抹在你的阴囊上。阿克巴尔灵巧的舌头挑逗并轻轻把玩着你敏感的[balls]，让你忍不住呻吟出声。你的身体因为这种感觉而不断地因快感而抽搐。");
         }
         outputText("当你的内脏突然感到一阵温暖时，他的口交服务结束了。恶魔起身骑上你，你因狂喜而颤抖。他的一只爪子将你抬起的胸部和脸部按回泥土中，当阿克巴尔在你上方就位时，冰冷的泥土粘在你的脸上。[pg]");
         outputText("你感觉到他在你的[asshole]周围试探，很快就发现他的阴茎不仅大得离谱，而且龟头上还布满了数十个微小的倒刺。");
         if(get_player().ass.analLooseness < 3)
         {
            outputText("你咬紧牙关，准备迎接疼痛。然而，多亏了他涂抹在你内脏上的奇怪唾液，当他巨大的阴茎强行撑开你的[asshole]时，你并没有感到任何疼痛。");
            get_player().buttChange(new Akbal().cockArea(0),true);
            outputText("[pg]");
            outputText("被阿克巴尔又长又滑的阴茎撑开让你不寒而栗。那奇怪的唾液甚至开始升温，在你体内产生一种热气腾腾的温暖，而阿克巴尔同样滚烫的阴茎将你撑开，你的身体因这种感觉而微微痉挛。在几次缓慢而浅的抽插之后，你能感觉到倒刺开始振动。突如其来的动作让你的身体抽搐起来，那些看起来邪恶的倒刺与其说是倒刺，不如说是嗡嗡作响的性爱珠。当阿克巴尔加快速度时，你只能更用力地咬紧牙关，因为你被撑得越来越超出你的自然极限。[pg]");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("多亏了他涂抹在你内脏上的奇怪唾液，当他巨大的阴茎强行撑开你的[asshole]时，你并没有感到任何疼痛。");
            get_player().buttChange(new Akbal().cockArea(0),true);
            outputText("[pg]");
            outputText("阿克巴尔巨大的阴茎撑开你的[asshole]，让你在他身下呻吟，沉醉在滑溜溜的热度和你肠道的充实感中。他的唾液升温，在你体内产生一种热气腾腾且令人愉悦的温暖。当他开始在你体内抽插他巨大的阴茎时，覆盖在他龟头上的倒刺开始振动。你的身体被一波波难以忍受的快感击中，那些看起来邪恶的倒刺与其说是倒刺，不如说是嗡嗡作响的性爱珠。你的身体开始不由自主地行动；当他巨大的性器官滑入时，你的[butt]迎合着他的抽插，他的躯干撞击着你的[butt]，发出有节奏的拍打声，在森林中回荡。[pg]");
         }
         else
         {
            outputText("当阿克巴尔开始进入你时，他惊讶地呻吟了一声，因为他巨大的阴茎如此轻易地沉入你的[butt]，而突如其来的入侵让你发出了低吟。[pg]");
            outputText("他涂抹在你体内的奇怪唾液瞬间升温，覆盖在他龟头上的倒刺突然开始振动。振动的倒刺感觉就像黏糊糊的性爱珠，在被推入你体内时旋转和摇晃。阿克巴尔没有浪费时间，开始不顾一切地强行操你的[asshole]，他每一次粗暴的抽插都让你的身体在泥土中向前滑动。你试图迎合他深深的抽插，但这只美洲豹正以猎豹般的速度和力量操你。不断振动的倒刺让你在每一次对你体内的猛烈撞击中都浑身发抖。[pg]");
         }
         outputText("阿克巴尔快速地扭动着臀部，像活塞一样将他那根长长的恶魔猫阴茎在你的[asshole]里抽插。你嘴里不断发出的胡言乱语随着他的每一次抽插而中断，你的身体被一次又一次的高潮折磨着。你很快就趴在胸口和膝盖上");
         if(get_player().hasVagina() || get_player().totalCocks() > 0)
         {
            outputText("在一滩你自己的爱液中");
         }
         else
         {
            outputText("在性爱的极乐中");
         }
         outputText("。[pg]");
         outputText("阿克巴尔发出一声刺耳的咆哮，你感觉到他巨大的猫科动物阴茎在你体内抽搐并肿胀。当恶魔猫滚烫、堕落的种子射入你体内时，你也发出了一声咆哮。感觉到那滚烫、湿润的温暖被操得更深，这感觉如此接近无上的极乐，以至于你几乎分辨不出其中的区别。[pg]");
         outputText("在感觉开始平息后，你意识到阿克巴尔并没有放慢速度。他的臀部在射精后继续像活塞一样运动，不断地撞击你的[butt]。他坚持不懈，直到他爆发了不下八次，整个过程中都熟练地操弄着你的洞。[pg]");
         outputText("在他最后一次大规模的爆发后，这只美洲豹拔了出来。他大量的精液从你快乐的洞里释放出来，形成一种令人奇怪地满足的浓稠白色奶油瀑布，像瀑布一样顺着你的[legs]流下。[pg]");
         outputText("这只美洲豹似乎不再介意你出现在他的领地里，他把身体盖在你的身上，你们俩陷入了性爱后的沉睡。");
         dynStats(DynStat.Cor(4 + Utils.rand(8)));
         dynStats(DynStat.Spe(1 + Utils.rand(2)));
         get_player().orgasm("Anal");
         if(get_player().butt.rating < 8)
         {
            outputText("[pg]在你的睡梦中，你的屁股微微丰满起来，为了迎合恶魔的愿望而变大……");
            var _temp_3:* = get_player().butt;
            _temp_3.rating = _temp_3.rating + 1;
         }
         get_player().createStatusEffect(StatusEffects.PostAkbalSubmission,0,0,0,0);
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function akbalSubmissionFollowup() : void
      {
         clearOutput();
         hideMenus();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,16) < 4)
         {
            outputText("你在营地醒来，感觉自己危险、强大，并且极度满足。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,15) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,16) >= 8 && get_player().isCorruptEnough(80))
         {
            if(!get_player().hasPerk(PerkLib.FireLord))
            {
               outputText("你睁开眼睛，当看到阿克巴尔翠绿色的眼睛看着你时，你几乎惊讶地叫出声来。你还在森林里，他那柔软的美洲豹身体还在你身上；你很快意识到他并没有移动你，因为你仍然躺在一滩混合的性爱汁液中。[pg]");
               outputText("[say:你是一只忠诚的宠物，]阿克巴尔站起来时说道。这句赞美让你微笑，但当他突然在你脸上发出一声令人毛骨悚然的咆哮时，微笑很快就变成了恐惧的表情。绿色的火焰开始从他张开的嘴里喷涌而出，你尖叫着挥舞双手，试图徒劳地挡住火焰。[pg]");
               outputText("在短暂的恐惧之后，你意识到自己并没有燃烧。你能感觉到那翠绿色的火焰在你的肺里，散发着明显的温暖。阿克巴尔猛地合上牙齿，脸上带着野性的笑容，停止了火焰的喷射。[pg]");
               outputText("你能感觉到阿克巴尔的恶魔气息在你的肺里，慢慢地积聚，直到最后伴随着一声巨大的咆哮从你张开的嘴里爆发出来，随之而来的是一道翠绿色的火焰。[pg]");
               outputText("(你现在可以喷吐阿克巴尔的火焰了。)");
               get_player().createPerk(PerkLib.FireLord,0,0,0,0);
            }
            else
            {
               outputText("你在营地醒来，感觉自己危险、强大，并且极度满足。");
            }
         }
         else if(!get_player().hasPerk(PerkLib.Whispered) && get_player().isCorruptEnough(40))
         {
            outputText("你在营地醒来，阿克巴尔站在你上方，你脑海中的合唱声达到了一首痛苦而美丽的歌曲的顶点，然后归于沉寂。当你站起来时，阿克巴尔舔了舔你的脸，然后转身冲进了森林。[pg]");
            if(!get_player().hasPerk(PerkLib.Whispered))
            {
               outputText("(你现在被低语了。)");
               get_player().createPerk(PerkLib.Whispered,0,0,0,0);
            }
         }
         else
         {
            outputText("你在营地醒来，感觉自己危险、强大，并且极度满足。");
         }
         if(get_player().hasPerk(PerkLib.Whispered) && get_player().hasPerk(PerkLib.FireLord))
         {
            awardAchievement("阿克巴尔至大",180,true,true,false);
         }
         doNext(playerMenu);
      }
      
      public function akbalQuestRewardKittyYes() : void
      {
         clearOutput();
         outputText("你要给你的新小猫起什么名字？");
         doNext(akbalQuestRewardKittyName);
         genericNamePrompt();
      }
      
      public function akbalQuestRewardKittyNo() : void
      {
         var _g:AkbalScene;
         clearOutput();
         outputText("你宁愿不要。");
         outputText("[pg][say: 那这将是个好机会，看看小恶魔们喜不喜欢拿猫当飞机杯。]菲拉异想天开地说道。[say: 在外面玩得开心点，小阿基。]");
         outputText("[pg]“小阿基”在女神的驱赶下跑开了。小恶魔，是吗？你琢磨了一会儿，不知道他的身体能不能承受得住那些。");
         saveContent.strayCat = true;
         _g = this;
         doNext(function():void
         {
            _g.akbalQuestEnd();
         });
      }
      
      public function akbalQuestRewardKittyName() : void
      {
         var _g:AkbalScene;
         var input:String = getInput();
         if(input == "")
         {
            clearOutput();
            outputText("<b>你必须设置一个名字。</b>");
            genericNamePrompt();
            doNext(akbalQuestRewardKittyName);
            return;
         }
         var _loc1_:Array = ["snuggl","fuzz","fluff","baby","kitty","kitten","mitten"];
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,2718,input);
         clearOutput();
         input = input.toLowerCase();
         var _loc2_:String = input;
         if(_loc2_ == "akbal")
         {
            outputText("如果你保留他的旧名字，那会有一种更绝妙的讽刺意味。让这片土地上唯一为人所知的阿克巴尔，成为睡在英格纳姆勇者桌子上的宠物猫。这是对他曾经高傲自大的侮辱。");
         }
         else if(_loc2_ == "akky")
         {
            outputText("阿基是个好名字。阿克巴尔的一个毫无威胁的变体。很合适。");
         }
         else if(_loc2_ == "alice")
         {
            outputText("你猜，吃什么补什么吧。");
            if(Boolean(["dick","richard","pussy","vagina","cunt","cock","penis","gash","ass","wang","cum","spooge","kitty","cunny"].contains(get_player().get_short().toLowerCase())))
            {
               outputText("就像你自己一样。");
            }
         }
         else
         {
            if(_loc2_ == "fera")
            {
               outputText("女神得意地笑了笑，那表情让你脊背发凉。[say: 我会重新考虑你的选择的，我的勇者。]");
               doNext(akbalQuestRewardKittyYes);
               return;
            }
            if(_loc2_ == "tama")
            {
               outputText("一只适合待在主人身边的优秀宠物。你很期待看到他表现良好。");
            }
            else if(Lambda.exists(_loc1_,function(param1:String):Boolean
            {
               return StringTools.startsWith(input,param1);
            }))
            {
               outputText("当你给他起名时，脸上露出了调皮的笑容。[akky]！可爱又无害！");
            }
            else if(input == "nig" || input.indexOf("nigg") == 0)
            {
               outputText("曾经是你的敌人，现在是你的宠物，你们将建立起充满爱的羁绊。");
            }
            else
            {
               outputText("[akky]就挺好。");
            }
         }
         outputText("[pg][akky]听到声音喵了一声，似乎已经很适应了。你蹲下身把他抱起来。他非常柔软。看来你获得了一些魔法力量和一只全新的宠物。就任务而言，你对这个结果相当满意。");
         _g = this;
         doNext(function():void
         {
            _g.akbalQuestEnd();
         });
      }
      
      public function akbalQuestRewardKitty() : void
      {
         clearOutput();
         outputText("你的脸上露出了笑容。你转头看向菲拉，问她是否碰巧知道那个美洲豹诅咒是怎么运作的。她能再施放一次吗，这次要正确地施放？阿克巴尔作为一只家猫会很可爱的。");
         outputText("[pg]女神发出一阵欢快的笑声。[say: 我很乐意。]");
         outputText("[pg]阿克巴尔尖叫起来，[say: 不，]拼命想要站起来。[say: 如果你想的话，就在我躺下的地方杀了我，但我绝不会回到那个诅咒中！我拒绝变成某种无能的毛茸茸的动物。]");
         outputText("[pg]菲拉什么也没说，只是微笑着抓住他。她的指甲划过他的肉体，在上面刻下神秘的符号。阿克巴尔痛苦地呻吟着。当她把手掌贴在他的胸口时，他的皮肤开始发光。[say: 不——不！不要再来了！该死的你，菲拉！该死的你，[name]！该死的一切！]");
         outputText("[pg]你遮住眼睛，挡住了这强大的神秘力量展示。当你回头看时，菲拉手里抱着一只非常小的猫。仍然像美洲豹一样有斑点和黄褐色，但显然是家养品种。他看起来小到可以在你腿上睡觉！她放下这只穿着美洲豹外套的小猫，它只是困惑和恐惧地环顾四周。你惊奇地歪着头。");
         outputText("[pg][say: 他现在对任何人都不再是威胁了。他甚至几乎无法理解自己是谁。]女神说。[say: 小阿基的心智处理能力大概就和你在某个上流社会精英家里看到的普通小猫差不多。不会有任何火焰或低语了。不过，你可以教他认得自己的名字。如果你不想要他，也许某个堕落的小恶魔会迷恋到收养他。]");
         outputText("[pg]你想收养这只猫吗？");
         doYesNo(akbalQuestRewardKittyYes,akbalQuestRewardKittyNo);
      }
      
      public function akbalQuestRewardKillYes() : void
      {
         var _g:AkbalScene;
         clearOutput();
         outputText("你点头同意，这让菲拉高兴地拍起了手。[say: 我知道该怎么做。即使是个失败品，阿基的诅咒也创造出了如此奇妙的野兽。那可爱的皮毛会是个合适的纪念品。]");
         outputText("[pg]菲拉俯身在倒下的恶魔上方，指甲刺入他毫无生气的肉体，刻下神秘的符号。当她完成时，他的皮肤开始发光，逐渐被刺眼的光芒吞噬，你不得不移开视线。当光芒褪去时，尸体已经恢复了熟悉的美洲豹形态。");
         outputText("[pg]菲拉毫不费力地划开美洲豹的皮肤，锋利的指甲从肛门滑到脖子，然后顺着每条腿向上。她将手伸入切口，平滑地将皮肤与肌肉和脂肪分离，像脱衣服一样剥下毛皮，留下了一具可怕——但异常干净——的被剥皮的尸体。");
         outputText("[pg]女神舔了舔沾满鲜血的手上的一些血块，将恶魔美洲豹的毛皮递给你。[say: 毫无疑问，你能好好利用它，我的勇者。]");
         _g = this;
         var _loc1_:Function = function():void
         {
            _g.akbalQuestEnd();
         };
         get_inventory().takeItem(get_useables().AKBPELT,_loc1_);
      }
      
      public function akbalQuestRewardKillNo() : void
      {
         clearOutput();
         outputText("你摇了摇头。最好还是让这个恶魔被遗忘吧。[pg]");
         akbalQuestEnd(false);
      }
      
      public function akbalQuestRewardKill() : void
      {
         var _g:AkbalScene;
         clearOutput();
         outputText("哦，你在骗谁呢？无论是复仇这种堕落的行为，还是他已经在诅咒中生活了几十年的事实，都不需要什么微不足道的正义。净化他。");
         if(get_player().get_weapon().isHolySword())
         {
            outputText("你走向阿克巴尔，手里拿着闪闪发光的剑。只需要稳稳地向下刺入他的心脏；尖叫声告诉你，他的恶魔核心正在正义之刃下燃烧。没过多久，他就安静了下来。");
         }
         else if(get_player().get_weapon().isScythe())
         {
            outputText("你把镰刀移到阿克巴尔身边，滑入他的脖子下方。他努力把头抬高，不让镰刀碰到。只需快速轻松地一拉，就能撕裂他的血肉，顺着镰刀滑行，让它更深地切入，直到你砍下他的头颅。");
         }
         else if(get_player().get_weapon().isFirearm())
         {
            outputText("你将[weapon]对准阿克巴尔的头，靠近他。一击毙命。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你高高举起[weapon]，向阿克巴尔跃去，用它那钝重的力量砸向他的头骨。他的头骨碎裂，大脑变成了一团浆糊。");
         }
         else if(get_player().get_weapon().isKnife())
         {
            outputText("你走到阿克巴尔面前，将[weapon]滑入他的脖子下方。你缓慢而从容地将它拉过他的血肉，让他的鲜血洒满大地。");
         }
         else if(get_player().get_weapon().isBladed())
         {
            outputText("你拿着[weapon]走向阿克巴尔。你举起刀刃，刀尖向下，刺入他的心脏。虽然他痛苦地呻吟着，但随着你猛地拔出剑，他的痛苦很快就结束了。");
         }
         else
         {
            outputText("你走近这位陨落的“神”，抓住他巨大的角。找准角度，你猛地一扭，扭断了他的脖子。");
         }
         get_player().upgradeBeautifulSword();
         outputText("这就是他的结局。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2716) >= 4)
         {
            outputText("[pg]女神带着怜悯的目光俯视着被杀死的恶魔。[say: 真遗憾，世界失去了一个如此美丽的掠食者。也许我的勇者想要留个纪念？]");
            doYesNo(akbalQuestRewardKillYes,akbalQuestRewardKillNo);
         }
         else
         {
            _g = this;
            doNext(function():void
            {
               _g.akbalQuestEnd();
            });
         }
      }
      
      public function akbalQuestFight(param1:int) : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,param1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2716,FlagDict_Impl_.arrayReadInt(_loc2_,2716) + 1);
         switch(param1)
         {
            case 0:
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2719,1);
               outputText("你猛挥[weapon]，扫开周围的灌木丛，冲进空地，宣告你的到来。阿克巴尔没有任何反应。");
               outputText("[pg][say: 哎呀，你好啊！真高兴在这儿见到你，伙计。你是阿基的朋友吗？]这个还不知道名字的地精问道。阿克巴尔这次的呻吟声更大了。你表明你是来教训他一顿的。地精回答说：[say: 那可不太好哦，你知道的。他看起来像只凶猛的大猫，但如果你了解他，就会发现他其实没那么坏。]这位炼金术士真是个善良的灵魂。");
               outputText("[pg]阿克巴尔昏昏沉沉地站起来面对你。他很恼火，但依然死心塌地要完成他的任务。战斗开始了。");
               break;
            case 1:
               outputText("你推开挡路的灌木丛，摆好战斗姿势，激发了阿克巴尔的防御本能。战斗开始了。");
               break;
            case 2:
               outputText("你从树丛中一跃而出，毫不掩饰自己的存在。阿克巴尔恶狠狠地盯着你，除此之外，他依然站在狐狸上方一动不动。你准备好你的[weapon]，冲上前去破坏他的好事。");
         }
         startCombat(new Akbal());
      }
      
      public function akbalQuestEnd(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2715,FlagDict_Impl_.arrayReadInt(_loc2_,2715) | AKBAL_QUEST_DONE);
         outputText("菲拉伸展了一下四肢，整理着她那橘色的长发。[say: 我为你的技巧感到骄傲，[name]。如果你还想再来找我，我会尽力让你免受那些让我乐在其中的喷药植物的困扰。我期待着我们的下一次相遇……]");
         outputText("[pg]女神漫步走进了灌木丛。除了回家也没什么可做的了" + (FlagDict_Impl_.arrayReadString(KFLAGS.flags,2718) != "" ? "，还带着[akky]" : "") + "。");
         get_combat().cleanupAfterCombat();
      }
      
      public function akbalQuestConclusionWin() : void
      {
         clearOutput();
         outputText("所有绝望的努力似乎都白费了，阿克巴尔没能站起来。一切都结束了。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 ? "值得称赞的是，他的力量并不逊色于恶魔女王本人。" : "") + "你开始思考该拿他怎么办，却看到菲拉从阿克巴尔身后走上前来。");
         outputText("[pg][say: 可怜的阿基。你的虚张声势也不过如此。我的勇者现在理应获得完成这项任务的奖励。]");
         outputText("[pg]女神抓住阿克巴尔的头发，把他的头抬起来，直到他跪在她身边，与她的胸口齐平。他的挣扎是徒劳的，菲拉的手悬停在他的脸上。她再次开口，[say: 我得感谢你喜欢把力量赐予他人的倾向。这让你在现在这种时候变得容易对付得多……]");
         outputText("[pg]你着迷地看着阿克巴尔眼睛和嘴里的翠绿色火焰开始向菲拉的手飘去。他在她的掌控中尖叫着、虚弱地扭动着，完全无力阻止这一切。越来越多的地狱之火倾泻而出。阿克巴尔的痛苦似乎难以忍受。不过，这个过程并没有持续太久。");
         outputText("[pg][say: 现在，[name]，来领取你的奖励吧。]");
         outputText("[pg]了解她的人都知道，你还有什么选择呢？不过，力量就是力量。你走近她，向她手掌上那空灵的火焰伸出手。当你触碰到它们时，它们翻腾着散开，不断膨胀，直到你的手臂完全被覆盖！不过并没有燃烧的感觉。久远时代的声音在你的脑海中回荡；那是阿克巴尔学习运用力量的记忆。现在，你也学会了。一阵震颤感传遍你的全身，你感受到了一股不可思议的力量。出于本能，你将这种感觉引导出来，向四面八方席卷大地！森林在震动，你的身体在翠绿色的地狱火中闪烁。");
         outputText("[pg](<b>获得特质：地狱之火——你现在可以在营地选择不同类型的魔法了</b>)");
         get_player().createPerkIfNotHasPerk(PerkLib.TerrestrialFire,0,0,0,0);
         get_player().addMastery(MasteryLib.TerrestrialFire,0,75,false);
         unlockCodexEntry(2722);
         outputText("[pg]当力量终于被吸收殆尽时，你感到如释重负，并且能够掌控自如。你现在知道如何施展新法术了。");
         outputText("[pg]一阵掌声将你从恍惚中唤醒，你的注意力转向了菲拉。[say: 令人印象深刻。你确实有魔法天赋。我真希望你喜欢这个奖励。你为了得到它付出了很多努力——和我们的小阿基玩耍，扮演一个贪玩的捕食者。他现在全是你的了。你可以杀了他，把他锁起来，强暴他，随你怎么处置。]");
         outputText("[pg]你打量着阿克巴尔战败的身体。他筋疲力尽，伤痕累累。没有什么能阻止你对他做任何你想做的事。杀了他固然不错，但也许正义并不等同于处决。那个诅咒他的法师本意是想把他变成一只家猫。也许菲拉知道如何重新施加那个诅咒，而且这次是正确的。无论你想做什么，现在都由你决定。");
         menu();
         addButton(0,"杀死",akbalQuestRewardKill);
         addButton(1,"诅咒",akbalQuestRewardKitty);
      }
      
      public function akbalQuestConclusionWho() : void
      {
         clearOutput();
         outputText("他并不全是在虚张声势，他确实是一个巨大而强大的恶魔。也许看起来很壮观，但他为什么这么强大？是什么让他如此特别？在宏大的计划中，他到底是个什么角色？");
         outputText("[pg][say: 我是谁？我是阿克巴尔，<b>大地之火的神</b>，]他一边傲慢地舒展翅膀，一边将柔滑的黑发向后甩过肩膀。[say: 这是我第一次晋升为这种奇妙形态时获得的称号。]他看起来越来越傲慢自恋了。不过，这并没有回答你的问题。恶魔有很多，但似乎没有一个能像他一样散发出如此强烈的奥术狂怒。");
         outputText("[pg][say: 你看，[name]，我曾经也是人类" + (get_player().startingRace == "human" ? " 就像你 " + (get_player().get_race() == "human" ? "现在一样" : "曾经一样") : "") + "。我是这个该死的世界里最强大的巫师之一！我们所有伟大的法师合作来提升我们的力量。为了说明我的头衔，我一直最喜欢土和火。]阿克巴尔发出一声满足的叹息。[say: 然后有一天，在我们都被困在这里多年之后，我们中的一个人发现了打破我们魔法极限的秘密。]");
         outputText("[pg]恶魔女王，莉希丝，也许吧？");
         outputText("[pg][say: 是的，完全正确。她发现了将我们灵魂中所有不可思议的能量提炼成水晶的力量。她的新形态……很美。角、翅膀、皮肤，甚至她的头发都激发了那种深深的<b>欲望</b>……对力量的渴望，]他狂笑着说。[say: 力量！我紧随其后，就像我们大多数人自愿做的那样。我很高兴能牺牲我的灵魂！我很美！如此巨大强壮，拥有令人难以置信的控制力。与凡人相比，我终于成了一个神。]");
         outputText("[pg]更像是个怪物。如果他如此高高在上，为什么莉希丝成了女王，而他却成了一只小猫咪？");
         outputText("[pg]阿克巴尔对这句话嗤之以鼻。[say: 我很傲慢，我承认。对我的超凡力量如此狂喜，以至于我不得不冲到前线，徒手撕裂我的敌人。我不得不强奸、杀戮，并吹嘘我的神性。所有人都必须知道，他们要么崇拜我，要么死……然而，即使在那个时候，莉希丝也确实是女王。我更强大，但她非常狡猾。她有战略眼光和野心。我可能很傲慢，但我认得出一个好领导者。让她策划征服，而我则在激烈的战斗中享受乐趣。]");
         outputText("[pg][say: 不过，别误会我的意思，因为我可以向你保证，在你死后，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 ? "我将取代莉希丝" : "莉希丝就是下一个") + "。她失败了。她的征服已经持续了——什么——20年了？然而你站在这里，作为反抗她的活生生的化身。她曾经是一位伟大的领导者，但她的时代已经过去了。有了我的女神菲拉，我毫不怀疑一切都会在我的脚下崩溃。整个世界都是我的猎物，而我就是捕食者。]");
         outputText("[pg]所以他是一个伟大而强大的法师，最终被困在了玛瑞斯。莉希丝向他展示了如何通过成为恶魔来解锁他的力量，而他认为自己是神。公平地说，相对于其他人，他已经尽可能接近凡人所能达到的极限了。尽管如此，你还是会像你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 ? "反抗过" : "反抗") + "莉希丝一样反抗他。");
         outputText("[pg]阿克巴尔开始歇斯底里地大笑，双手放在胸前嘲弄着。");
         outputText("[pg][say: 那我们开始吧！]");
         startCombat(new AkbalUnsealed());
      }
      
      public function akbalQuestConclusionTaunt() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 1);
         clearOutput();
         outputText("这就是一切的结局？那只小小的猫咪现在变成了大大的坏恶魔？哦，真是太可怕了。");
         outputText("[pg][say: 注意你的言辞，<b>婊子</b>，]阿克巴尔眼中带着怒火说道，[say: 否则我会在强奸你可悲的身体时把它扯下来。]");
         outputText("[pg]这么小的虫子，口气倒挺大，自尊心也挺强。真正伟大的战士会采取行动，而不是用这种虚张声势来磨蹭。不过，真正伟大的战士也不会让自己变成可爱的小猫！");
         outputText("[pg]阿克巴尔在压抑的愤怒中退缩了一下，猛地向前挥出一拳，在你向后跳跃时险些击中你。看来废话的时间结束了！");
         startCombat(new AkbalUnsealed());
      }
      
      public function akbalQuestConclusionPrompt() : void
      {
         clearOutput();
         outputText("你突然有种危险的预感。在继续前进之前，最好为任何情况做好充分准备。你现在要折返吗？");
         menu();
         addButton(0,"继续",akbalQuestConclusion);
         addButton(1,"离开",akbalQuestConclusionDelay).hint("你还没准备好看看她接下来有什么计划。");
      }
      
      public function akbalQuestConclusionLose() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2715,FlagDict_Impl_.arrayReadInt(_loc1_,2715) | AKBAL_QUEST_BADEND);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("这一切对你来说太沉重了。阿克巴尔是个恶魔，但他自称为神的说法却无法反驳。菲拉走到你身后，掐住你的脖子把你举起来，猛地把你的头向后拉，看着你。");
         outputText("[pg][say: 可怜的，可怜的[name]。我本来和你玩得很开心的。我真的以为你能赢。]她纤细的手托起你的下巴。她的眼睛是美丽的红色，就像她的嘴唇一样。你现在要死了吗？[say: 你的命运现在属于我的小阿基了。我只是来最后好好看你一眼的。]");
         outputText("[pg]当阿克巴尔来领取他的奖品时，女神把你扔回了地上。他的声音一如既往地傲慢，散发着优越感。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2716) > 1 ? "[say: 我会让这尽可能痛苦。]" : "[say: 这是我应得的，但我一定会对你温柔点。前提是，如果我没有太兴奋的话。]"));
         outputText("[pg]巨大的恶魔降临在你身上，撕扯掉你身上所有的衣物。他不需要你的装备对你有什么好处；他的目标是你赤裸的身体。");
         outputText("[pg]粗糙有力的恶魔之手抓住你的感觉让你的嘴唇发出喘息声。阿克巴尔揉捏着你的[breasts]，一条长长的舌头从他的嘴里滑进你的嘴里。你几乎感觉不到这黏糊糊的附肢有什么味道，只有它在你的喉咙里进进出出的原始物理感觉。就好像你在深喉一根触手肉棒。");
         outputText("[pg]阿克巴尔把他的舌头从你的" + (get_silly() ? "口腔" : "嘴里") + "抽了出来。[say: 你似乎太享受这个了。天生就是个受虐狂，不是吗？]");
         outputText("[pg]你喘着粗气，努力平复呼吸，但你根本没机会及时做出连贯的回答；阿克巴尔继续对你的身体发起攻势。当他那滚烫巨大的恶魔肉棒贴上你的骨盆时，情况突然升级了。他打算做到底。他的猫科形态有着带倒刺的阴茎，完全成熟的恶魔肉棒也是如此。幸运的是，倒刺只在龟头周围，但这真的能让人安心吗？话又说回来，你对被它弄疼还有点兴奋。痛苦与快感交织的刺激让你发狂。");
         outputText("[pg]他长着利爪的手滑向你的[hips]，将你牢牢固定住，同时那根跳动的肉棒抵住了你的括约肌。粗大且带刺，潜在的疼痛让你的心狂跳不止。你准备好了吗？你输了这场战斗，无论你是否准备好，这都是你应得的。你下定决心，而你的肛门却以痛苦的速度扩张和拉伸。它燃烧着、刺痛着，但你却像个荡妇一样呻吟出声。阿克巴尔一直很喜欢肛交，无论这会让受害者多么痛苦。每一[if (metric) {厘米|英寸}]滚烫的肉棒滑过你的体内，都几乎能让你发出一阵异想天开的眩晕轻笑。");
         outputText("[pg][say: 这就是你现在的样子。你输了。你被一个更强大的捕食者打败了，现在你是我的<b>婊子</b>。我甚至兴奋得忘了给你的[ass]润滑。你注意到了吗？当然没有。你已经全心全意地屈服于你的新神了，]他说道，话语中带着不可逃避的真相。");
         outputText("[pg]阿克巴尔那如神一般的恶魔肉棒插得更深了，一次又一次地弄疼你。它把空气从你的肺里挤了出去，但你还是忍不住乞求更多。你的新神掐住你的喉咙，禁止你发出荡妇般的胡言乱语。抽插还在继续，而你的视线越来越模糊、暗淡……");
         get_game().gameOver();
      }
      
      public function akbalQuestConclusionFight() : void
      {
         clearOutput();
         outputText("别磨蹭了。他变成什么形态都无所谓；你才是顶级捕食者。你才是<b>勇者</b>。如果阿克巴尔想打一架，不管是不是女神的命令，他都会如愿以偿。你举起你的[weapon]，摆出准备战斗的姿势。");
         outputText("[pg][say: 你对自己评价很高嘛。很好，那就亲眼见识一下我的力量吧。]");
         startCombat(new AkbalUnsealed());
      }
      
      public function akbalQuestConclusionDelay() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("[pg]你决定这几天避开这片森林。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalQuestConclusion4() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2716) > 1)
         {
            outputText("[say: [name]！这将会是多么令人难以置信的愉悦啊。]阿克巴尔说着，拉近了你们之间的距离。");
         }
         else
         {
            outputText("[say: [name]！非常抱歉要这么做。真的，别往心里去。]阿克巴尔说着，拉近了你们之间的距离。");
         }
         if(get_player().get_tallness() >= 96)
         {
            outputText("很少有其他生物能与你的身高如此接近。");
         }
         else
         {
            outputText("他惊人的身高让你不得不仰视才能迎上他的目光。");
         }
         menu();
         addButton(0,"战斗",akbalQuestConclusionFight).hint("开始吧。不管是恶魔还是小猫咪，跟你比起来他什么都不是。");
         addButton(1,"质问",akbalQuestConclusionWho).hint("他到底是谁？");
         addButton(2,"嘲讽",akbalQuestConclusionTaunt).hint("仅仅因为他比以往任何时候都强大，并且现在下定决心要残忍地谋杀你，并不意味着你不能对他冷嘲热讽。");
      }
      
      public function akbalQuestConclusion3(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("菲拉将沾满鲜血的爪子从美洲豹的胸膛中抽出，留下一道闪烁的绿光。她将他扔到地上。阿克巴尔痛苦地呻吟着，身体开始膨胀！他痛苦地捂住胸口，火焰从他爪子的缝隙中喷涌而出。他的惨叫和喘息预示着几十年前被施加的诅咒正在发作。阿克巴尔的尖叫声变得越来越像人类。头部的突起刺破了血肉和皮毛，火焰烧焦了它们经过的每一根毛发。鲜血浸透了他的背部，一对翅膀开始撕裂皮肉破体而出。");
         outputText("[pg]这只庞大的怪物强撑着站了起来，用他那嘎吱作响、扭曲变形的双腿支撑着身体。他的皮毛完全烧尽，露出了深红色的皮肤。他的四肢终于变得有些像人类了，除了那灰白色的、如恶魔般锋利粗壮的指甲。阿克巴尔最后一次尖叫，发出一声震天动地的咆哮。他的体型和形态猛然膨胀，终于达到了这次变形的顶点。现在，阿克巴尔以全盛姿态傲然挺立，俯视着菲拉。他大约有[if (metric) {两米半|至少八英尺}]高，肌肉贲张，身上纹着发光的翠绿色符文。他长发及腰，黑如暗夜。他睁开双眼，用比以往任何时候都更加活跃的绿色火焰凝视着你的灵魂。");
         outputText("[pg][say:欣赏我真实形态的威严，[name]？]他一边说着，一边舒展着翅膀，欣赏着自己新获得的全套功能齐全的手指。[say:兽皮缠腰布不太符合我的风格，但我想它倒是挺应景的。]你甚至都没意识到，这次你居然没看到某人那根巨大的鸡巴，不过现在你低头看去，确实注意到他胯下那根尺寸相当可观。他的鸡巴甚至已经半硬了。你心想，这份自由对他来说想必是相当“兴奋”吧。");
         outputText("[pg]菲拉微笑着，轻声笑着欣赏他。[say: 那么，阿克巴尔，既然你已经重获自由，你打算做些什么呢？现在你可以随心所欲地在世界上游荡，炫耀你当年恶魔初降群山时所拥有的力量……]");
         outputText("[pg]阿克巴尔跪倒在地，面向女神。[say: 我将为您效劳，捕食女神。在我的内心深处，我是一个真正的<b>捕食者</b>。能为您效劳是我的荣幸。]");
         outputText("[pg]菲拉的表情充满了得意的喜悦，对这些事情感到非常高兴。她玩得很开心。她的目光转向你，那双深红色的眼睛令人着迷。[say: 但是阿克巴尔，我已经有一位勇者了。我的勇者只能是最强的捕食者。你不觉得你们两个应该证明一下自己吗？]");
         if(param1)
         {
            outputText("将你固定在原地的树根退了回去，让你再次获得了自由。");
         }
         outputText("[pg][say: 这是我的荣幸，女神。]");
         doNext(akbalQuestConclusion4);
      }
      
      public function akbalQuestConclusion2(param1:Boolean = false) : void
      {
         var resisted:Boolean;
         var _g:AkbalScene;
         clearOutput();
         if(param1)
         {
            outputText("休想得逞！你大声喝止，并");
            if(get_player().get_weapon().isUnarmed())
            {
               outputText("摆出战斗姿态");
            }
            else
            {
               outputText("准备好你的[weapon]");
            }
            outputText("。阿克巴尔低声咆哮，但你已经准备好战斗来阻止这一切。");
            outputText("[pg]菲拉满不在乎地<i>哼！</i>了一声，仿佛在表达你的反对对她来说是多么微不足道。[say: 我答应过他，只要他成功，我就赐予他祝福。我从不食言。]");
            outputText("[pg]树根从你脚下的泥土中钻出，立刻将你紧紧缠绕。");
            if(get_player().isGoo())
            {
               outputText("你本以为自己无定形的身体不会这么容易被束缚，然而你身体的每一丝纤维都变得坚硬无比。也许你还能挣脱陷阱，但在这个过程中你会失去大量的质量。");
            }
            outputText("菲拉把你牢牢地固定在原地。你准备");
            if(get_player().get_weapon().isFirearm())
            {
               outputText("不顾一切地开火，");
            }
            else if(get_player().get_weapon().isChanneling())
            {
               outputText("烧毁束缚，");
            }
            else
            {
               outputText("冲破束缚，");
            }
            outputText("但长而锋利、充满威胁的树根");
            if(get_player().isGoo())
            {
               outputText("深深地蜿蜒向你身体的核心。");
            }
            else
            {
               outputText("刺探着你的血肉。");
            }
            outputText("她不给你任何退路。你忍不住对释放这个怪物感到有些后悔。也许你早该做点什么？如果菲拉不是那么冷漠和难以寻觅，也许你可以在事情发展到这一步之前，就去面对她所带来的危险。");
         }
         else
         {
            outputText("看来这一切真的要发生了。你不能说你对此感到非常惊讶；你甚至可能对阿克巴尔的真实面貌感到有些兴奋。");
         }
         outputText("[pg]就在你思考这些事情的时候，捕食女神在美洲豹周围漫步。当[sun]光透过树叶照在他身上时，他那长满斑点的黄褐色皮毛显得如此温暖舒适。菲拉也以她完美无瑕的白皙肌肤和长长的橙色秀发在草木中脱颖而出。看到她在这里抚摸着一只美洲豹，真是再合适不过了。她身边是一只为了侍奉她而付出巨大努力的、浑身是血的野蛮掠食者。");
         outputText("[pg]女神红宝石般的嘴唇弯成一个邪恶的微笑。[say: 哦，我最亲爱的妹妹，你的信徒们如此努力地想要封印这个恶魔。你极大地削弱了他，然而现在在我面前的，是一个强大的掠食者。我强大的掠食者。把他从这个形态中剥离出来几乎是一种耻辱，玛莱。然而你自己也对那么多野兽做过同样的事。]她闭上眼睛，带着对过去的怀念。从你回忆起的那些传说中，玛莱确实提升了许多生物，让它们获得了人类的智慧。阿克巴尔继续耐心地等待着，也许在某种程度上甚至享受着被抚摸皮毛的感觉。");
         outputText("[pg]菲拉叹了口气，再次睁开眼睛。[say: 很好，阿克巴尔。是时候让你恢复真实的自我了。]");
         outputText("[pg]女神站直身体，抓住那只大美洲豹的后颈，将他从地上拉了起来。菲拉深红色的眼睛闪烁着喜悦的光芒，她将长长、锋利、黑色的指甲深深刺入阿克巴尔的胸膛。这只恶魔野兽震惊地睁大了眼睛，他痛苦的咆哮声在四周回荡，他的鲜血急切地顺着菲拉的手臂流下。她的轻笑声让人感到非常不安。");
         outputText("[pg][say: 我喜欢看到健康强壮的血液。那种顺着我的皮肤流淌的感觉，以及它覆盖在我的血肉上时红白相间的对比，真是令人陶醉。我可从来没说过这会是无痛的，阿克巴尔。]");
         if(param1)
         {
            outputText("至少看到你不是唯一一个被她折磨得死去活来的人，感觉还不错。");
         }
         menu();
         _g = this;
         resisted = param1;
         addButton(0,"继续",function():void
         {
            _g.akbalQuestConclusion3(resisted);
         });
      }
      
      public function akbalQuestConclusion() : void
      {
         var resist1:Boolean;
         var _g1:AkbalScene;
         var resist:Boolean;
         var _g:AkbalScene;
         clearOutput();
         outputText("你再次漫步在茂密的森林中，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2716) > 1)
         {
            outputText("渴望能有再次折磨可怜的阿基的机会。");
         }
         else
         {
            outputText("感官时刻保持警惕，提防着阿克巴尔接下来可能会做什么。");
         }
         outputText("正如你所怀疑的那样，血腥味飘进你的鼻腔，这肯定是阿克巴尔干的好事。你顺着气味向森林深处走去，直到你遇到了一片相当开阔的空地，比你想象中自然形成的要大得多。阿克巴尔坐在空地中央，喘着粗气。他身上沾满鲜血，似乎摆出了一阵奇怪的物品。");
         outputText("[pg][say: 在等什么吗？] 这个女性的声音让你脊背发凉。尽管没有闻到那种掺杂了药物的蒸汽味，菲拉还是在神不知鬼不觉的情况下靠近了你。[say: 来吧，我的勇者。好戏现在才开始。]");
         outputText("[pg]菲拉越过你走向阿克巴尔，你紧随其后。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2716) > 1)
         {
            outputText("阿克巴尔立刻注意到了，死死地瞪着你。他的沮丧显而易见。");
         }
         outputText("[pg][say: 哦，我亲爱的小阿克巴尔，] 女神说道，[say: 你做得很好。我看到你完成了这么多事情，尽管我派了我的勇者来阻挠你。] 菲拉回头看了你一眼，得意地笑了笑，认为你一直是个麻烦。突然，你发现你也能听到阿克巴尔说话了，尽管他似乎是在对菲拉说话。[say: 废话……没什么我应付不了的，女神。]");
         outputText("[pg]菲拉继续切入正题。[say: 我说到做到。你成功完成了你的任务，现在是给你奖励的时候了。]");
         menu();
         _g = this;
         resist = false;
         addButton(0,"观看",function():void
         {
            _g.akbalQuestConclusion2(resist);
         }).hint("一切都指向了这里。");
         _g1 = this;
         resist1 = true;
         addButton(1,"阻止她",function():void
         {
            _g1.akbalQuestConclusion2(resist1);
         }).hint("不！你不能让他这样的恶魔得逞。");
      }
      
      public function akbalFirstEncounter() : void
      {
         clearOutput();
         outputText("当你走在森林里时，头顶上突然传来树枝折断的声音。你迅速抬头看向声音的来源，却只看到一双隐藏在树冠阴影中的闪闪发光的翠绿色眼睛。一股恶魔般的力量席卷了你，让你僵在原地，一只美洲豹的爪子从黑暗中伸出。这只优雅的杀手在树枝上潜行，很快就完全暴露在你的视线中。沐浴在透过头顶树叶过滤的阳光下，这只生物将你锁定在它的目光中——这目光太聪明了，不属于一只普通的野生动物。一阵窃窃私语的合唱在你的耳边响起，但声音太小，你听不清在说什么。[pg]");
         outputText("美洲豹眨了眨眼，将你从恍惚中释放出来，这只生物终于跳到了地上。它张开双腿，发出一声震耳欲聋的咆哮，似乎同时从四面八方传来，淹没了一切，只剩下你自己的心跳在胸腔里砰砰作响的声音。[pg]");
         outputText("这只生物绕着你转了一圈，然后你听到一个低沉的男声在窃窃私语的合唱中响起。[pg]");
         outputText("[say:我是阿克巴尔，地火之神。你正在侵入圣地……臣服，或者死。][pg]");
         outputText("从这个“阿克巴尔”身上散发出来的光环一点也不像神；你认出了这个恶魔的真面目。然而，它象牙般的牙齿和锋利的爪子向你证明，它可以兑现它的威胁。你该怎么办？");
         menu();
         addButton(0,"交谈",superAkbalioTalk);
         addButton(1,"战斗",startuAkabalFightomon);
         setExitButton();
      }
      
      public function akbalEventKitsuneWin() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 1);
         outputText("阿克巴尔在猛攻下倒下了。即使他拿出最认真的态度，你依然是顶级的掠食者。");
         outputText("[pg]你走到那只仍因恐惧而僵住的狐妖面前，把她扶了起来。经过一番摇晃让她回过神来后，她开口了。[say: 谢……谢谢……]");
         outputText("[pg]红发狐妖一言不发地走进了森林。不管阿克巴尔对她做了什么，显然都给她留下了阴影。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventKitsuneTerror() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 3);
         outputText("从激烈的眼神交流中你可以看出，阿克巴尔很可能正在用他的心灵感应探测她的大脑。为了什么，你不知道，但你对心灵魔法略知一二……");
         outputText("[pg]集中精神，你将魔法引导成对狐妖的精神攻击，让她的脑海中充满了可怕的、令人毛骨悚然的怪物。随着你手腕的每一次挥动，你都在这只可怜狐狸的脑海中描绘出一片片抽象的恐怖景象，而阿克巴尔的心灵探测正一头扎进其中。");
         outputText("[pg]美洲豹咆哮着，嘶嘶作响，向后跳去，不停地摇头。看来他还没准备好！阿克巴尔冲进树林，似乎想逃离自己的思想。你轻笑一声，回家了，成功地挫败了这个混蛋。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventKitsuneLose() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("你颓然倒下，接受了失败。阿克巴尔对你咆哮了一声，然后回到了那只仍处于震惊中的狐妖身边。尽管你们发生了一场战斗，她却连动都没动一下。");
         outputText("[pg]阿克巴尔继续他的……干瞪眼比赛。他那发光的绿色眼睛死死盯着狐妖好一会儿，直到最后眨了眨眼，活动了一下身体，似乎是因为保持静止太久而僵硬了。他在狐妖脸上舔了几下，动作出奇地友善，然后转身走回了森林。见状，你也起身回家，心想菲拉大概不会知道也不在乎你这次没能阻止阿克巴尔。");
         get_combat().cleanupAfterCombat();
      }
      
      public function akbalEventKitsuneLeave() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("阿克巴尔继续他的……眼神交流。他那发光的绿色眼睛紧紧地盯着狐妖看了一会儿，直到最后眨了眨眼，挪动了一下身体，似乎是因为保持静止太久而僵硬了。他在狐妖的脸上舔了几下，显得异常友好，然后转身走回森林。你也跟着站起身，回家了，心想菲拉不会知道也不在乎你这次没有阻止阿克巴尔。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventKitsune() : void
      {
         var event:int;
         var _g:AkbalScene;
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2715,FlagDict_Impl_.arrayReadInt(_loc1_,2715) | AKBAL_EVENT_KITSUNE1);
         var _loc2_:Array = ["Whisper","Terror","Illusion"];
         var _loc3_:Boolean = get_player().abilityAvailable(OneOf_Impl_.fromB(_loc2_),{
            "ignoreLust":true,
            "ignoreFatigue":true
         });
         outputText("在树叶中艰难跋涉时，你遇到了一对不幸的妖狐。在非常小的空地上躺着两个狐妖女孩，一个是金发，另一个是红发，金发的那个已经遭遇了不幸。阿克巴尔站在红发狐妖的四肢上，把她按在地上。虽然她似乎被抓伤了，受到了惊吓，但她基本上没有受伤。她震惊地盯着阿克巴尔愤怒的翠绿色眼睛……");
         menu();
         _g = this;
         event = 2;
         addButton(0,"攻击",function():void
         {
            _g.akbalQuestFight(event);
         }).hint("阻碍他任务的最明显的方法。");
         addButton(1,"恐惧",akbalEventKitsuneTerror).hint("用你的魔法吓唬他们一下。").disableIf(!_loc3_,"需要一个能引起恐惧的法术。");
         addButton(2,"离开",akbalEventKitsuneLeave).hint("反正你对菲拉的任务也没那么上心。");
      }
      
      public function akbalEventGoblinWin() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 1);
         outputText("你那野兽般的对手颓然倒在草地上。你依然是这片森林真正的顶级掠食者！你转过身，将目光投向地精，而她也随之将目光从阿克巴尔转移到你身上。");
         outputText("[pg][say: 你真的把那只猎豹揍得很惨。你为什么这么有攻击性？这药水不会伤害任何人的……大概吧。]");
         outputText("[pg]尽管如此，你的目标是破坏他的任务。你拿着[weapon]走向地精。");
         outputText("[pg]她防御性地举起双手。[say: 嘿、嘿！我不想惹麻烦，伙计！你想要药水？拿去吧。] 她从炼金混合物旁退开。");
         outputText("[pg]你拿起药水，好奇地打量着。你控制好力度，将瓶子砸向一棵树，瓶子碎裂，里面的液体溅了出来。");
         outputText("[pg]炼金术士插话道。[say: 等等！你——啊伙计，你为什么要这样？那可是好东西——一种非常小众的饮料，尝起来有点像甘草和屁股，确实，但它其实挺好喝的！就这么扔了太浪费了。] 她叹了口气，然后继续说道。[say: 好吧，至少你没有弄坏我其他的炼金用品。谢谢你让我置身于你和阿基之间的事情之外。顺便说一下，我叫阿丽安德拉！你可以叫我阿丽，简称。你又是谁？]");
         outputText("[pg]你决定告诉她你的名字，并简要说明你和阿克巴尔之间的情况。阿丽点点头，似乎很感兴趣，但你没心情闲逛。你告诉阿丽安德拉赶紧跑，否则她<b>会</b>被卷入你们的麻烦中。她把警告听进去了，然后离开了。现在阿克巴尔没有了炼金术士，他的进度会被拖延。可怜的他！你带着骄傲和满足感离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventGoblinPossess() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 4);
         if(get_game().shouldraFollower.followerShouldra())
         {
            outputText("[say: 嘿，勇者！]你一直藏匿在体内的幽灵实体插话道。[say: 我本来想问“你在想我所想的吗”，但我已经知道你在想了……]");
            outputText("[pg]你猜，住在别人脑子里的好处就是知道他们的想法。舒尔德拉详细说明了她的想法：[say: 来点附身应该能让这场戏更热闹。我来吗？]");
            outputText("[pg]她会的。当幽灵飞出你的身体时，你感到一种奇怪的感觉席卷全身。阿克巴尔对鬼魂了解多少？当你看着舒尔德拉施展魔法时，你心里暗自纳闷。");
            outputText("[pg]地精炼金术士的眼睛变成了黄色，这清楚地表明了舒尔德拉的存在。幸运的是，由于和一个喋喋不休的女人一起旅行带来的精神疲惫，阿克巴尔仍然脸朝下趴在草地上。真是太方便了！一个法术开始在混合物上编织，伴随着她眼中明亮的光芒。舒尔德拉看着你，眨了眨眼。在将更多的成分混合在一起后，她拿起瓶子，猛烈地摇晃起来。" + (get_silly() ? " 科学！" : ""));
            outputText("[pg][say:好了，阿基，药水已经完全成熟，准备好了！]被附身的地精说着，把冒泡的液体推到阿克巴尔的脸上。阿克巴尔对这种咄咄逼人的举动嗤之以鼻，但还是用嘴咬住了瓶子。紧接着，舒尔德拉立刻跳了起来，后退了几步。[say:这是一种特殊的酿造，专为你这种脾气暴躁的母猫准备的~！]她用俏皮的语气说道。");
            outputText("[pg]阿克巴尔的眼睛睁得大大的，因为气泡呈指数级增加，最终导致玻璃和蒸汽的猛烈爆发。气态的混合物将美洲豹笼罩在橙色的雾气中。紧接着是一声强大而愤怒的咆哮，带着一丝痛苦。绿色的火焰从云层中喷发出来，蔓延开来，驱散了所有的气体。站在燃烧的草地上的是阿克巴尔，皮毛的颜色变成了粉红色，眼睛和鼻子似乎被烧伤了。这只恶魔野兽在恢复镇定时喘着粗气，咳嗽着，舒尔德拉在离开可怜的地精之前放声大笑。这可能会变得一团糟。");
            outputText("[pg][say:啊，呃，等等，阿基——阿克巴尔，阿克巴尔，我没有——]炼金术士在恐慌中只能嘟囔这些，然后那只粉红色的猫跳了起来，用牙齿咬住她的喉咙，在盲目的愤怒中扭曲和撕裂它。他的爪子恶毒地砍伤了她的身体。当舒尔德拉再次在你的身体里安顿下来时，你看着这场可怕的流血事件。");
            outputText("[pg][say:哇！真是一只愤怒的小猫，不是吗？]舒尔德拉带着喜悦的叹息说道。[say:很少有这样的机会把一个通灵恶魔变成粉红公主。如果他不是对那个地精感到如此厌倦，我想我不可能在不被注意的情况下溜进去。]");
            outputText("[pg]好吧，它起作用了，这就是现在最重要的。这也是一场精彩的表演，谁知道他要怎么把皮毛上的粉红色弄掉。你冷笑着，步履蹒跚地走回家，舒尔德拉告诉你，你真的应该寻找更多像这样她可以跳进去的机会。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2720,1);
         }
         else
         {
            outputText("回想你那幽灵般的面容，你孵化了一个狡猾的计划。这需要一些努力，但你设法将你的身体完全变成一个空灵的幽灵，准备猛扑过去。你最后确认了一眼阿克巴尔，确保他的脸还在草地上，然后冲向毫无防备的地精……");
            outputText("[pg][say:呜哇——嘿！谁——发生什么事了？]你听到她的脑海中回荡着声音。当你试图掌握完全控制权时，你的大脑受到了思想的轰炸。由于混乱的程度，你设法找到了方向，并开始摆弄你面前的炼金设备。");
            outputText("[pg][say:嘿，现在，这可不行！阿基——啊，阿克巴尔！你在哪里？你读不懂我的心思吗？帮帮忙！]她徒劳地说道。毫无疑问，阿克巴尔已经厌倦了探查这个地精的思想。然而，她有点让人分心，你试图压制她。她只会变得更大声。[say:不！你不能拥有我的身体，即使是一小会儿！我有重要的炼金术要表演，我不希望有邪灵玷污阿丽安德拉·德·丽娜的名字！]");
            outputText("[pg]你坚定决心，继续前进，");
            if(get_player().hasPerk(PerkLib.HistoryAlchemist))
            {
               outputText("破译摆在你面前的成分的用途。所有这些伴随你成长的炼金术研究在这样的时候确实派上了用场。你把蘑菇和一些椭圆形的叶子捣碎，直到形成糊状，然后把一部分刮进烧瓶里。倒入一些水和一点蜂蜜，就可以混合了。你在阿丽安德拉的火焰上加热烧瓶，每次几秒钟，在中间摇晃里面的东西。");
            }
            else
            {
               outputText("把一半的成分扔在一起，不特别考虑它们的用途。一朵充满活力、特别刺鼻的花最吸引你的兴趣，你把整朵花塞进烧瓶里。你塞住瓶子，猛烈地摇晃它，希望这能让它做点什么！在半分钟的鲁莽放纵之后，你看着混合物，看到里面冒泡和冒蒸汽！" + (get_silly() ? " 科学！" : ""));
            }
            outputText("虽然这是一种非常即兴的混合物，但这<i>应该</i>会带来一场有趣的表演。");
            outputText("[pg]你把塞着软木塞的烧瓶塞到阿克巴尔的脸上，尽你最大的努力模仿阿丽安德拉。[say:给你，阿基！药水已经按照你想要的方式酿造好了！]你自信地说道。真正的阿丽安德拉在你的脑海中喘着粗气，指责你的表现。[say:我不是那样说话的！]");
            outputText("[pg]这不是你的问题；阿克巴尔还是不情愿地拿起了烧瓶。你站起来，后退了一小段距离，焦急地期待着你的创造物的效果。阿丽安德拉不断地争夺控制权，你觉得这种行为相当令人头痛。你大脑令人不快的跳动将不得不等待更长的时间……");
            outputText("[pg]阿克巴尔嘴里叼着的烧瓶剧烈地冒泡，几乎在摇晃，你把这当作离开的信号！");
            if(get_player().isPureEnough(33))
            {
               outputText("你将最后一丝精神控制力集中在唯一的命令上：跑。");
               outputText("[pg]控制某人这么长时间的疲惫付出了沉重的代价，但片刻之后，真正的阿丽安德拉意识到了情况的严重性，转身逃跑。在接下来的几秒钟里，一声响亮而令人震惊的玻璃和烟雾爆发增加了一阵偏执的战斗或逃跑的冲动。当阿丽安德拉在即将到来的阿克巴尔的愤怒中惊恐地逃跑时，你失去了对她的所有控制。你空灵的形态漂移到灌木丛中，看着炼金术士像她的生命取决于它一样冲刺。你身后愤怒的咆哮表明，确实，她的生命取决于它。");
               outputText("[pg]你在树叶中悄悄爬行以避免被发现。在头顶上跳跃追逐地精的是阿克巴尔，而且——而且他是<b>粉红色的！</b>当粉红色的猫在盲目的愤怒中争先恐后地寻找造成这一切的罪魁祸首时，你忍住了笑。希望阿丽安德拉能设法躲起来，因为她绝对跑不过他。");
               outputText("[pg]你站起身，环顾四周。安全了。成功搞完事。你回家的路上心情愉快，一路上都在嘲笑那个“强大的掠食者”。");
            }
            else
            {
               outputText("你迅速离开地精，立刻听到她大喊。[say: 等、等等！阿基，别——]");
               outputText("[pg]她太迟了。玻璃瓶破裂，碎片四散，更重要的是，气体喷涌而出，将阿克巴尔完全笼罩。阿丽安德拉踉跄后退，剧烈咳嗽着，试图捂住口鼻。她惊恐地看着阿克巴尔在浓雾中愤怒地咆哮。绿色的火焰从云雾中喷发，将其驱散，留下了一只非常生气的猎豹站在燃烧的草地上。他——他变成粉红色的了！");
               outputText("[pg]阿丽安德拉在恐惧中强忍住笑声，试图安抚这只毛茸茸的野兽。[say: 阿、阿基，呃，这——这是个意外！我发誓，我告诉你，那不是——] 唉，她绝望的解释被阿克巴尔降临的怒火打断了。他撕裂了她的血肉，在这样做的时候散发着无法抑制的愤怒。可怜的阿丽安德拉。");
               outputText("[pg]你启程回家，在逃离那个“强大掠食者”的听力范围时轻笑着。毫无疑问，那要花点功夫才能清理干净。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2720,1);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventGoblinLose2() : void
      {
         clearOutput();
         outputText("喝下一些灵药后，你身上的酸痛感渐渐消退。看来你刚才短暂地昏过去了，而那个地精正在喂你喝某种新调配的混合物。");
         outputText("[pg][say: 你好啊，瞌睡虫！我叫阿丽安德拉·德·丽娜，你可以叫我阿丽。阿基把你揍得可真惨，不是吗？]");
         outputText("[pg]她向你解释了她拼凑出来的这种简易治疗药水，然后拍了拍你的肩膀，说她还有地方要去，便转身离开了。你虽然还有些发懵，但感觉身体好多了，于是动身返回营地。");
         get_combat().cleanupAfterCombat();
      }
      
      public function akbalEventGoblinLose() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("在野兽般恶魔的猛攻下，你渐渐不支，疲惫地瘫倒在草地上。");
         outputText("[pg]地精叹了口气。[say: 说实话，你真是自找的。你没事吧，阿基？] 阿克巴尔愤怒地瞪着她，这次甚至不需要心灵感应来传达他的想法。炼金术士轻笑了一声，[say: 你的药水在这儿，别担心。全搞定了！把材料放进去，搅拌，加热，大功告成。]");
         outputText("[pg]她把那瓶不知名的混合物装瓶，递给阿克巴尔。尽管阿克巴尔很沮丧，但他对那些为他服务的人一向慷慨。盯着看了一会儿后，地精说：[say: 好吧，没问题！我会在我们见面的老地方等你，等你忙完了再把报酬给我。回见！]");
         outputText("[pg]阿克巴尔跑向他的下一个目标。");
         doNext(akbalEventGoblinLose2);
      }
      
      public function akbalEventGoblinLeave() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("虽然你可以破坏这里的炼金术，但让阿克巴尔继续忍受这个非常善于交际的地精那令人讨厌的喋喋不休似乎更合适。");
         outputText("[pg][say: 你知道吗，阿基，学做这个其实很容易。如果你以后想多做点，我可以教你，] 她说道，但只换来了猎豹的一声冷哼。[say: 哦，对了。阿克巴尔。抱歉。你对绰号有什么意见吗，小猫咪？] 她的问题似乎没有得到回答，但她继续说着。[say: 我在外面有个朋友，说……] 炼金术士喋喋不休地说个不停。");
         outputText("[pg]看到这只骄傲而强大的森林掠食者脸朝下趴在草地上，周围散发着痛苦的气息，你得意地笑了。这比你能想出的任何折磨都更合适。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventGoblin2() : void
      {
         var event:int;
         var _g:AkbalScene;
         outputText("[pg]当你在树叶间悄悄穿行时，终于找到了那个叽叽喳喳的地精。她步履轻盈地走来走去，带着各种各样的材料。走在她旁边的是一只美洲豹——阿克巴尔。");
         outputText("[pg][say: 这根本不是什么大问题，阿基——啊，抱歉，我是说阿克巴尔。你真该放轻松点，小猫咪，]她大胆地说道。阿克巴尔哼了一声，没做别的。你好奇的一面短暂地为阿克巴尔的心灵感应感到惋惜，这让你无法知道他的反应。地精继续说道：[say: 我想如果我们在空地上采一些蘑菇，我们就能凑齐你那小药水所需的所有材料了。]");
         outputText("[pg]阿克巴尔呻吟着，显然很期待这一切结束。无论他试图配制什么药水，一定很重要，才让他忍受这一切。当他们穿过一些灌木丛进入前面提到的空地时，你悄悄地在附近躲了起来。");
         outputText("[pg]正如这个绿色小炼金术士所说，那片空地上确实有蘑菇。她开始搭建一个临时的炼金台，而“阿基”则从土里拔出几个蘑菇。他们在瓶子和材料堆的两边坐下，地精迅速而勤奋地开始工作。她是个话痨，但看起来确实很有能力。");
         outputText("[pg][say: 只要几分钟就好了，阿基——啊，该死，我又来了。你知道我没有不尊重可怕的火焰之主的意思——]她停顿了一下。[say: 陆地之火的神明。天哪，你真的需要这么挑剔吗？]阿克巴尔呻吟着，把额头贴在地上。看到这里有另一种不怕他的生物，确实很有趣。");
         menu();
         _g = this;
         event = 0;
         addButton(0,"攻击",function():void
         {
            _g.akbalQuestFight(event);
         }).hint("阻碍他任务的最直接方式。");
         addButton(1,"精神控制",akbalEventGoblinPossess).hint("溜进去制造一些混乱。").disableIf(!(get_game().shouldraFollower.followerShouldra() || get_player().hasPerk(PerkLib.Incorporeality)),"需要附身他人身体的能力。");
         addButton(2,"离开",akbalEventGoblinLeave).hint("反正你对菲拉的任务也没那么上心。");
      }
      
      public function akbalEventGoblin() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2715,FlagDict_Impl_.arrayReadInt(_loc1_,2715) | AKBAL_EVENT_GOBLIN);
         outputText("当你在茂密的树林中跋涉时，一阵叽叽喳喳的声音引起了你的注意。听起来像是地精的声音，不过就你所听到的而言，无论她在和谁说话，对方都没有回应。无论发生了什么，都足以引起你的兴趣，你动身去寻找声音的来源。");
         doNext(akbalEventGoblin2);
      }
      
      public function akbalEventAliceWin() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 1);
         outputText("阿克巴尔跌跌撞撞地走进草丛，失去了战斗能力。你四下张望，想看看那个" + aliceTerm() + "在哪里，但她似乎已经趁机逃跑了。只要你让阿克巴尔的任务变得更困难，你就成功了，你耸了耸肩。回家的路上，你的步伐中多了一份骄傲。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventAliceShootLeave() : void
      {
         outputText("[pg]又一次成功挫败了他的计划，你骄傲地回家了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventAliceShootHelp() : void
      {
         var _loc1_:Array = ["治疗","神圣之风","阿瑞安的护符 - 治疗"];
         var _loc2_:Boolean = get_player().abilityAvailable(OneOf_Impl_.fromB(_loc1_),{
            "ignoreLust":true,
            "ignoreFatigue":true
         });
         outputText("你在那里等了一小会儿，对造成的附带伤害感到一丝内疚，于是你没有回家，而是回到了现场。");
         outputText("[pg]你瞧，那个" + aliceTerm() + "还在那里；她似乎已经昏迷了。虽然有些碎片击中了她的身体，但出血量很少。");
         if(_loc2_)
         {
            outputText("你运用体内的奥术能力，用魔法缝合血肉，抚平了伤口。");
         }
         else
         {
            outputText("你拿出一些补给品，给她做了简单的包扎。");
         }
         outputText("这并不能让她断掉的手指或失去的眼睛长回来，但至少能给她一线生机。你站起身，向营地走去，心想以后还是多考虑一下比较好。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventAliceShoot() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2716,FlagDict_Impl_.arrayReadInt(_loc1_,2716) + 3);
         if(get_player().get_weapon().isRanged() && get_player().hasPerk(PerkLib.Scattering))
         {
            outputText("你用你的[weapon]瞄准，心想在这么远的距离击中这么小的瓶子通常很难。然而，通常情况下，枪也不会把火力锥内的一切都撕碎！你对所有潜在的附带伤害不屑一顾，径直瞄准瓶子开了火。");
            outputText("[pg]玻璃碎了！与此同时，那个" + aliceTerm() + "的手指和她的一只眼睛也碎了。不过，对于后者来说，也许用“爆开”来形容更合适。那个" + aliceTerm() + "痛苦地尖叫着倒在地上。阿克巴尔又惊又怒，但你已经穿梭在树林中，消失在他的视线里了。他还有更重要的事情要处理，而不是试图追捕你，在意识到你已经跑得太远后，他很快就放弃了。");
            if(get_player().isPureEnough(33))
            {
               menu();
               addButton(0,"帮助" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0 ? "爱丽丝" : "孩子"),akbalEventAliceShootHelp);
               addButton(1,"离开",akbalEventAliceShootLeave);
            }
            else
            {
               outputText("[pg]又一次成功挫败了他的计划，你骄傲地回家了。");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("你用你的" + (get_player().get_weapon().isRanged() || get_player().get_weapon().isChanneling() ? "[weapon]" : "弓") + "瞄准，将注意力集中在树的“乳头”下方拿着的玻璃瓶上。你花了一些时间才稳住身形，但这一击非常精准！玻璃碎裂，让那个" + aliceTerm() + "陷入了恐慌，而阿克巴尔看着破碎的瓶子，愤怒地凝视着树林。太迟了，你早就逃之夭夭了。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function akbalEventAliceLose() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("阿克巴尔把你按在地上，冷笑着看着你战败的样子。你躺在那里，已经筋疲力尽，无法再与他战斗。确认了这一点后，阿克巴尔站起身，环顾四周。那个" + aliceTerm() + "在战斗中途跑掉了，不见踪影。你看不清阿克巴尔的脸，但你确信他一定气得面部扭曲。不管那个恶魔跑到哪里去了，她最好祈祷自己别被找到。");
         outputText("[pg]阿克巴尔跑开了，很可能是去弄个新瓶子来达到他的目的。你休息了一会儿，恢复了体力，赶在其他怪物发现你之前逃回了营地。");
         get_combat().cleanupAfterCombat();
      }
      
      public function akbalEventAliceLeave() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2717,get_time().days);
         outputText("你很乐意让这一幕继续下去。那个" + aliceTerm() + "紧张地把树液引诱出来，装进瓶子里，偶尔回头看看那只正恶狠狠地盯着她的美洲豹。终于，瓶子似乎装得差不多了，" + aliceTerm() + "开始往瓶口塞软木塞。阿克巴尔打了个喷嚏。女孩吓得缩了一下，尖叫了一声，但她并没有把瓶子掉在地上。过了一会儿，她转过身，把瓶子放进阿克巴尔的嘴里。她站在那里，浑身发抖，等待着离开的命令。阿克巴尔放下瓶子，" + aliceTerm() + "跪在他面前，很可能是他通过心灵感应告诉她这么做的。当美洲豹靠近时，她颤抖得更厉害了，他那剑齿虎般的牙齿离她近得可怕。他张开了嘴……");
         outputText("[pg]阿克巴尔舔了舔这个小恶魔作为奖励，然后重新叼起瓶子，向森林深处走去，继续他的任务。那个" + aliceTerm() + "似乎受了点惊吓，但她很快深吸了一口气，独自漫步离开了。你也趁机离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalEventAlice() : void
      {
         var event:int;
         var _g:AkbalScene;
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2715,FlagDict_Impl_.arrayReadInt(_loc1_,2715) | AKBAL_EVENT_ALICE);
         var _loc2_:Boolean = false;
         if(get_player().get_weapon().isRanged() || get_player().get_weapon().isChanneling() || get_player().hasKeyItem("Bow") || get_player().hasKeyItem("Kelt\'s Bow"))
         {
            _loc2_ = true;
         }
         outputText("你闻到了一股熟悉的腐化林地的气味。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) >= 99)
         {
            outputText("这让你非常震惊，毕竟你为了清除这些污秽可是费了九牛二虎之力。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) >= 50)
         {
            outputText("这也许是仅存的几个腐化林地之一了，现在正是将它们彻底消灭的好时机。");
         }
         else
         {
            outputText("虽然这种气味很常见，但它依然很容易吸引你。");
         }
         outputText("你朝着这股淫靡之气的源头走去，却在空地上发现了阿克巴尔。你压低身子，悄无声息地靠近。在阿克巴尔旁边的是");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0)
         {
            outputText("一个爱丽丝，那种像小孩子一样的恶魔");
         }
         else
         {
            outputText("一个看起来像小孩子的人，不过她的角和翅膀暴露了她某种恶魔的身份");
         }
         outputText("。她正拿着一个瓶子，试图将一些腐化的树液挤进去，这很可能是阿克巴尔的计划，为了让收集过程变得更容易。毕竟就算有魔法，爪子的灵活性也是有限的……");
         menu();
         _g = this;
         event = 1;
         addButton(0,"攻击",function():void
         {
            _g.akbalQuestFight(event);
         }).hint("阻挠他任务最直接的方法。");
         addButton(1,"击碎瓶子",akbalEventAliceShoot).hint("尝试开枪打碎她手里的瓶子。" + (get_player().hasPerk(PerkLib.Scattering) ? "不过你武器的散射可能会造成一些意外的伤害……" : "")).disableIf(!_loc2_,"需要远程武器。");
         addButton(2,"离开",akbalEventAliceLeave).hint("反正你对菲拉的任务也没那么上心。");
      }
      
      public function akbalDeny() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         clearOutput();
         outputText("你摇了摇头，挠了挠这只充满情欲的美洲豹耳后，告诉他你很忙。恶魔翻了个白眼，舔了舔你的[leg]，然后他的目光落在了你们俩上方树上的一个小恶魔身上。[pg]");
         outputText("知道他找到了新玩具，阿克巴尔允许你安然无恙地离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalDefeated(param1:Boolean) : void
      {
         var _g1:Combat;
         var _g:NaughtyNunsHabit;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,17,1);
         menu();
         clearOutput();
         outputText("阿克巴尔倒在地上" + (param1 ? "，被打得血肉模糊" : "，无法继续战斗") + "。然而，他的胸腔里仍然发出低沉的咆哮，当他低下头，猫肚子紧贴地面时，你立刻认出了这是顺从的姿态。");
         outputText("[pg]你面带微笑地绕着阿克巴尔" + (param1 ? "伤痕累累" : "欲火焚身") + "的身体走了一圈。这只恶魔继续低吼着，等待着你的审判。");
         addButton(0,"爆菊",rapeAkbal).sexButton(1,false);
         addButton(1,"小穴承受",girlsRapeAkbal).sexButton(2,false);
         addButton(2,"强迫舔阴",rapeAkbalForcedFemaleOral).sexButton(2,false);
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            _g = get_player().get_armor();
            addButton(4,"膜拜肉棒",function():void
            {
               _g.naughtyNunCockWorship();
            }).hint("通过对这个生物的肉棒的奉献来赞美你的主。");
         }
         _g1 = get_combat();
         setSexLeaveButton(function():void
         {
            _g1.cleanupAfterCombat();
         });
      }
      
      public function akbalBitchSpeed(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("阿克巴尔脸朝下趴在泥土里呻吟着。你微笑着看着他操弄着草地。看到他徒劳地试图刺激自己的样子，你欲火焚身，几乎是扯下了你的[armor]，带着坏笑抓住了被绑住的恶魔。");
         outputText("[pg][say: [Master]，]阿克巴尔的合唱声在你的脑海中低吟。");
         var _loc2_:int = get_player().biggestCockIndex();
         if(get_player().hasCock() && !param1)
         {
            get_player().orgasm("Dick");
            get_images().showImage("akbal-deepwoods-male-highspeed");
            outputText("[pg]你拉着他的尾巴，直到被绑住的恶魔美洲豹脸朝下，屁股撅起。他柔软粉嫩的穴口闪烁着他分泌的天然润滑液。他抬起长满斑点的尾巴，让你知道他准备好了。你站稳[feet]，俯身压在他的身上。你手里拿着[cock biggest]，将[cockHead biggest]对准他的后庭。你用空着的手对准恶魔等待的臀部拍了一巴掌，看着一滴润滑液从等待的穴口滴落。不需要进一步的邀请，你开始推入恶魔的体内。");
            if(get_player().cocks[_loc2_].cockLength < 7)
            {
               outputText("[pg]你的双手放在他的臀部以提供必要的平衡，你开始像手提钻一样猛捣他的内脏。当你不断地将你的[cock biggest]刺入恶魔上翘的穴口时，空气中弥漫着持续不断、几乎永无止境的吧唧声。");
               if(get_player().balls == 0)
               {
                  outputText("你的[cock biggest]将他滑腻的润滑液滴落到你身体的下半部分。");
               }
               else
               {
                  outputText("你的[cock biggest]将他滑腻的润滑液滴落到你的[sack]和双腿内侧。");
               }
               outputText("你咬紧牙关，驱使自己以更快的速度操弄恶魔，达到了你的最高速度。");
            }
            else if(get_player().cocks[_loc2_].cockLength <= 12)
            {
               outputText("[pg]阿克巴尔向后推挤着你，他圆润结实的屁股在你的躯干上扭动，他的尾巴滑过你的[fullChest]。你站稳[feet]，[if (metric) {一厘米一厘米|一英寸一英寸}]地沉入恶魔滚烫的穴口。你的双手放在他的臀部以提供必要的平衡，你开始像手提钻一样猛捣他的内脏，导致恶魔对你低吼。你向前伸出手，向下压住恶魔被绑住的双腿，利用它们强迫他抬起屁股，给你一个更容易的目标。你的[cock biggest]刺入滚烫颤抖的通道所引起的吧唧声充满了空气。你猛烈地撞击着你下方恶魔毛茸茸的肌肉臀部。天然的润滑液从阿克巴尔被塞满的尾穴中涌出，用它奶油般的热度涂抹着你的[cock biggest]。被你自己的欲望所驱使，你开始像疯子一样在恶魔的穴口里像活塞一样进出。");
            }
            else
            {
               outputText("[pg]你很惊讶自己竟然能塞进恶魔的尾穴。包裹着你[cock biggest]的血肉紧绷着，因为你被阿克巴尔的身体挡住了。你只能将你[cock biggest]的一英尺塞进恶魔体内，但你能感觉到他的内脏在变移。被塞得超出容量的恶魔不知为何正在为你[cock biggest]的其余部分腾出空间，你们俩都能感觉到。包裹着你[cock biggest]的蠕动肉洞是滚烫的极乐，滑动、挤压并按摩着你缓慢推进的[cock biggest]。在你身下，当你[if (metric) {一厘米一厘米|一英寸一英寸}]地沉入他变移的内脏时，阿克巴尔畏缩着，咬紧牙关轻声低吼。当你的躯干柔软地贴合在恶魔上翘的屁股上时，一阵痉挛震撼了他的身体。他的内脏收紧，直到你无法移动，阿克巴尔颤抖着释放出沉重的高潮。你感觉到了每一次痉挛、每一次肌肉收缩和每一次抽搐，恶魔将一股又一股奶油般的猫精液溅到了他的膝盖上。一旦阿克巴尔的穴口再次放松，你站稳[feet]，带着恶作剧的笑容俯身压在他的身上。你的双手放在他的臀部以提供必要的平衡，你开始像手提钻一样猛捣他的内脏，导致恶魔咆哮着抓挠地面，因为你把他漂亮粉嫩的穴口弄得一团糟。每一次向前挺进都让他的身体退缩，当你快速地将你的[cock biggest]在他的穴口里锯进锯出时，把他撞得喘不过气来。他体内的润滑液从他的穴口滴落，粘在你的肉棒上，滴落到他的囊袋上。当你的速度达到顶峰时，你的[cock biggest]变成了一团模糊的影子，当你残酷地侵犯恶魔的穴口时，发出了类似于掌声的声响。");
            }
            outputText("[pg]你向下压住他的背部，将恶魔美洲豹的腹部平压在地面上，同时你的[cock biggest]开始肿胀。在你身下，阿克巴尔的穴口在颤动，你知道他快到了。随着最后一次残酷地刺入被支配的恶魔猫受虐的穴口，你将他的整个身体平摔在森林的地面上并释放出来。你们俩一起嚎叫，直到你们共同的声音变得嘶哑。你畏缩了一下，将你的[cock biggest]从阿克巴尔滴着精液的穴口中拔了出来。");
            outputText("[pg]阿克巴尔躺在地上，颤抖着翻身侧躺。被绑住的恶魔美洲豹的肚子和森林的地面上覆盖着一层厚厚的精液，粘稠的丝线甚至将恶魔的胸部与水坑连接起来。伴随着沉重的呼吸，恶魔睡着了，而你收拾好你的[armor]离开了。");
         }
         else
         {
            get_player().orgasm("VaginalAnal");
            get_images().showImage("akbal-deepwoods-female-highspeed");
            outputText("[pg]你抓住阿克巴尔的腿，将这只被绑住的恶魔翻转过来，直到他那根坚挺的肉棒直指天空。这根又长又带棱纹的恶魔猫阴茎分泌出天然的润滑液，伴随着清澈的先列腺液顺着前端滴落。它看起来非常诱人，但美洲豹的脸、宽大的舌头和黑色的嘴唇，看起来更加诱人。");
            outputText("[pg]你蹲在恶魔的脸上方。还没等你把[vagOrAss]压到他的嘴唇上，他就猛地向上扑来，在你准备好之前就把脸埋进了你的下体。当他的唾液接触到你的[vagOrAss]时，一阵如瀑布般的狂喜涌入你的身体。你倒了下去，恶魔也顺势跟上，你张开双腿，让他更容易用口舌为你带来极乐。他用大量的唾液涂抹你的[vagOrAss]，同时用宽大的舌头舔舐你暴露的私处。当他开始用长舌头挑逗你的");
            if(get_player().hasVagina())
            {
               outputText("阴蒂");
            }
            else
            {
               outputText("前列腺");
            }
            outputText("时，你开始颤抖。然后你想起了你想做的事。在他让你高潮之前，你把他的脸推开，将他推倒仰面躺下，他的肉棒再次高高挺立。你再也无法克制自己，不想再拖延下去，你跨坐在那只非常情愿的美洲豹身上，毫不犹豫地坐到了他那根抽动着的勃起上。");
            if(!get_player().hasVagina() && get_player().ass.analLooseness < 2 || get_player().hasVagina() && get_player().looseness() <= 2)
            {
               outputText("[pg]当阿克巴尔那根巨大肉棒的蘑菇状龟头触碰到你的[vagOrAss]时，一道狂喜的闪电穿透了你的身体。涂满你[vagOrAss]的唾液与恶魔肉棒上的液体混合在一起，让你从灵魂深处发出呼喊。仿佛那炽热、近乎毒品般的快感还不够，你的[vagOrAss]被撑开了，不知为何竟毫无困难地吞下了阿克巴尔那根巨大肉棒的全部长度。一旦你完全包裹住他，那些倒刺就开始震动，像性爱珠一样跳动，让你进入了超速状态。[pg]你开始上下套弄。你的身体渴望更多，你以最快的速度在阿克巴尔那根奇妙而坚挺的肉棒上上下起伏，以此回应这种渴望。每次你的[vagOrAss]撞击他时，都会发出一声响亮的拍打声，很快，你的速度快得听起来就像兴奋的掌声。在你身下，阿克巴尔颤抖着，你骑他的速度和力度都前所未有。你[vagOrAss]的紧致对这样一个天赋异禀的恶魔来说似乎是难得的享受。");
            }
            else if(!get_player().hasVagina() && get_player().ass.analLooseness < 4 || get_player().hasVagina() && get_player().looseness() < 4)
            {
               outputText("[pg]当阿克巴尔那根带刺肉棒的蘑菇状龟头触碰到你的[vagOrAss]时，你全身都感觉到了这种入侵。涂满你那被唾液润滑的阴道的唾液与阿克巴尔肉棒上的液体发生反应，引起了一种化学反应般的快感。仿佛这还不够，覆盖在肉棒上的倒刺开始震动，刺激着你的[vagOrAss]，让你发狂。");
               outputText("[pg]你站稳脚跟，开始拼尽全力骑乘阿克巴尔。你用尽所有的速度和力量，将身体撞向他，产生了一种不稳定、几乎无休止的节奏。在你身下，阿克巴尔颤抖着，你骑他的速度太快、力度太大，他根本跟不上。恶魔的脚趾蜷缩起来，眼睛甚至翻白了。");
            }
            else
            {
               outputText("[pg]当阿克巴尔那根华丽肉棒的蘑菇状龟头触碰到你的[vagOrAss]时，你退缩了。当你那被唾液浸透的");
               if(get_player().hasVagina())
               {
                  outputText("阴道");
               }
               else
               {
                  outputText("屁股");
               }
               outputText("触碰到那根浸满液体的恶魔肉棒时，一股纯粹的狂喜如潮水般席卷了你的全身。仿佛化学反应还不够，阿克巴尔肉棒上的倒刺开始震动，挠痒并挑逗着你的[vagOrAss]。");
               outputText("[pg]你知道该怎么对付一根感觉如此美妙的肉棒：你站稳脚跟，开始用尽全力在那根带来狂喜的肉棒上上下起伏。很快，你起伏的速度快得你们身体碰撞的声音听起来更像是掌声，而不是两个活泼的伴侣在做爱。你可以看到恶魔的舌头从嘴里伸出来，眼睛翻白。");
            }
            if(get_player().hasVagina())
            {
               get_player().cuntChange(new Akbal().cockArea(0),true,true,false);
            }
            else
            {
               get_player().buttChange(new Akbal().cockArea(0),true,true,false);
            }
            outputText("[pg]从他的反应你知道他绝对很享受，但你根本不在乎。他不过是一个活生生的性玩具，一个拥有无与伦比的肉棒和舌头的生物，你正在利用他让你的[vagOrAss]感受到这种不断增强的、如瀑布般倾泻的快感。在你身下，恶魔开始猛烈挺动，很快你就感觉到了他爆炸的肉棒的温度，他将你射满了精液。你一直沉浸其中的狂喜达到了顶峰。你的身体不由自主地蜷缩起来，嘴巴张开，发出无声的尖叫。");
            if(get_player().hasCock())
            {
               outputText("[pg]当[eachCock]爆发时，你忍不住紧紧握住它，用你浓稠的精液涂满了阿克巴尔的胸膛。");
            }
            if(get_player().hasVagina())
            {
               outputText("[pg]随着你的身体继续抽搐，你的[vagina]释放出大量的乳白色液体。你的高潮持续了几分钟，在这期间，你把阿克巴尔涂满了证明他让你多么满足的证据。");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("[pg]当你呼喊时，你的身体开始抽搐。你的[ass]感觉恶魔的肉棒就像一根避雷针，不断地释放出狂喜的洪流。");
            }
            outputText("[pg]当你从恶魔那根奇妙的肉棒上下来时，你的[vagOrAss]感到幸福的酸痛和疯狂的敏感。你[face]上带着微笑，收拾好你的[armor]，转身离开森林。你沉浸在令人眼花缭乱的狂喜中走着，每一个动作都会让你的[vagOrAss]感受到一阵近乎痛苦的高潮后快感。直到你听到小恶魔和地精的咯咯笑声，你才想起你把阿克巴尔绑在那里，毫无防备……哎呀。");
            if(get_player().hasVagina())
            {
               get_player().knockUp(1,432,101);
            }
         }
         dynStats(DynStat.Cor(3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function akbalBigButtSubmit() : void
      {
         clearOutput();
         get_images().showImage("akbal-deepwoods-bigbuttanaled");
         outputText("满怀期待地微笑着准备再次侍奉这位美洲豹领主，你脱下[armor]，四肢着地，慢慢地将脸贴向地面。当你的脸颊贴在泥土上时，你的[butt]缓慢地前后扭动着，为了你的恶魔之神的享受而贬低自己。");
         outputText("[pg]一个深沉的声音在你敞开的脑海中回荡，发出呼噜声，[say:一个合适的祭品。]那愉悦的弦外之音让你对这位猫科主人的看法毫无疑问——他喜欢你后面的样子。美洲豹柔软的爪子几乎立刻落在了你的[butt]上，粗暴地揉捏着柔软的臀瓣。你顺从地垂下眼睛，但有一瞬间，你看到了你的美洲豹领主在你上方若隐若现，被你那丰满的屁股迷住了。他的身体肌肉发达，线条分明，覆盖着一层如油般闪亮的丝滑斑点皮毛。总而言之，他光芒四射。");
         outputText("[pg]当阿克巴尔依偎在你为他提供的舒适垫子之间时，一声赞许的心灵咆哮在你的头骨中回荡，他张开嘴舔舐你的[asshole]");
         if(get_player().balls > 0)
         {
            outputText("和[balls]");
         }
         else if(get_player().hasVagina())
         {
            outputText("和[vagina]");
         }
         outputText("。你忍不住因为这种关注而扭动起来，感觉到他那滑溜溜、热乎乎的肌肉长度在试探你敏感的后庭。紧随其后，美洲豹灵活的舌头留下了大量光滑的唾液，让你的皮肤产生愉悦的刺痛感。你没时间去想这些，因为他扩大了他游移的注意力，用爱意涂抹你的每一寸臀瓣，舔舐着你的[skinfurscales]，这只能被描述为崇拜。一阵欣喜的骄傲在你的脑海中荡漾——你的主人认可他仆人的身体！");
         outputText("[pg]你撅着屁股，在放松的愉悦中喘息着，任由阿克巴尔把你的[butt]弄得闪闪发光。直到你柔软的臀部的每一寸都被猫的唾液涂满后，他才回到他真正的意图，掰开你的臀瓣，露出你被唾液润泽的后庭。你的后庭饥渴地抽动着，因为你神明的变态体液而刺痛，敏感而渴望爱抚。他没有拒绝你身体无声的请求，那条长长、扭动的舌头滑了进去，扭进你的后门，用更多他可爱的汁液装饰你的内部。你忍不住呻吟起来——这感觉比它应有的还要好，就像是对你内脏的一次火热、滑溜的按摩。");
         if(get_player().hasCock())
         {
            outputText("在你身下晃动，[eachCock]毫不掩饰你有多享受这一切，细细的先列腺液摇摇欲坠地挂在下面。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的外阴早就变得更大更肿，明显发情了，闪烁着你欲望的湿润。");
         }
         outputText("[pg]那条舌头深入你体内，过了一会儿，你不再试图判断他到底进去了多深。你有什么资格质疑他？你的[asshole]任由他处置，这个想法让你臀部的肌肉快乐地收缩。他的手指挤压并抚摸着你放在他面前的臀部盛宴，一边揉捏一边舔吻，把越来越多他那充满气泡、令人刺痛的唾液弄得到处都是。感觉太好了，以至于你的[legs]失去了力量，但你努力保持直立，颤抖着。你必须继续向他展示你自己！这个想法，起初看起来很陌生，但感觉太对了，无法抗拒，你就像往常对待你的领主一样——服从。");
         outputText("[pg]一旦他看到你的[legs]在发抖，阿克巴尔就给了你的[asshole]一个吻，然后收回了他的舌头，让你感到痛苦的空虚，除了刺痛和渴望有东西进入你之外，什么都没有。他没有让你久等。强壮的爪子陷进你两侧的泥土里，当他摆好姿势时，他的一簇簇皮毛掠过你湿润的背部。你再次颤抖，不再像以前那样挣扎着保持屁股朝上，而是充满渴望。一些热乎乎的东西，一些简直奇妙温暖的东西，压在你身上。你[butt]里的每一根神经都在要求你推回去接受他，用你柔软的臀部闷死他。然而，你知道人们对你的期望。你是他的，任他索取，你会等待他的快乐。");
         outputText("[pg]阿克巴尔轻轻地戳了几下，试探你，或者也许，只是享受他那长满倒刺的粗壮肉棒滑过你那满是口水的臀沟的感觉。无论如何，你等待你的神明完成，他奖励了你。粗壮跳动的美洲豹肉棒插入你的[asshole]，轻松地滑过你被口水浸透的后庭。覆盖在他肉棒上的倒刺一点也不疼，当它们接触到他的唾液时就会变软，以至于它们变成了快乐的小凸起——服从的奖赏。当你被占有时，你发出低沉而响亮的呻吟，很快，他毛茸茸的囊袋停在你的背上，他的长度完全没入。你的臀部因为这一切的刺激而刺痛，因为他堕落的唾液而变得火热温暖，并本能地通过肌肉收缩快乐地按摩着他的阴茎。");
         get_player().buttChange(new Akbal().cockArea(0),true,true,false);
         outputText("[pg]当你将自己献给这位火之领主时，你双眼迷离，迷失在被占有的快感中。你的身体现在一半是神庙，一半是性玩具，完全属于他，而你爱死了这种感觉。");
         if(get_player().hasCock())
         {
            outputText("此时[EachCock]正肆意流着口水，尽管阿克巴尔没有去碰它，但他那温暖的肉棒在你体内的感觉似乎一直传到了你的[cockHead]上。");
         }
         else if(get_player().hasVagina())
         {
            outputText("此时你的[vagina]正肆意滴落着淫液，尽管阿克巴尔没有去理会它，但他那温暖的肉棒散发出的感觉似乎穿透了你跳动的小穴，一直传到了你那坚挺湿润的[clit]上。");
         }
         outputText("突然，那根神圣的工具离开了你过度敏感的内脏，但片刻之后又回来了，伴随着坚定而有节奏的抽插再次插入。当恶魔美洲豹的肉棒再次精准地插到底，进入你的[asshole]时，你尖叫起来，这一下抽插从你那被快感折磨的身体里引出了一次高潮");
         if(get_player().hasCock())
         {
            outputText("，你的[cock]肆意地将精液释放到你身下的泥土中，用你白白浪费的精液玷污了地面");
            if(get_player().cumQ() >= 500)
            {
               outputText("并在你周围汇聚成水坑");
               if(get_player().cumQ() >= 1000)
               {
                  if(get_player().cumQ() < 3000)
                  {
                     outputText("汇聚成一个小湖");
                  }
                  else
                  {
                     outputText("汇聚成一片深邃、黏滑的泥沼");
                  }
               }
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("，");
            if(get_player().wetness() >= 4)
            {
               outputText("喷射");
            }
            else
            {
               outputText("渗漏");
            }
            outputText("进泥土里，直到泥土散发出你小穴的骚味");
         }
         outputText("。");
         outputText("[pg]阿克巴尔呻吟着，但并没有释放，还没到时候。他只是继续占有你，用力但不粗暴地操着你，坚定地宣示着他对你的支配权。你被困在肛门快感的天堂里，颤抖着，一次又一次地高潮，但从未真正得到释放。随着时间的推移，美洲豹逐渐加快了节奏；很快，你就幸福地胡言乱语起来，盲目地赞美着你的领主和主人，而他则用熟练的抽插探索着你湿透的臀部。当他用越来越坚定的动作占有你时，你的脸在森林的地面上被拖来拖去，然后，阿克巴尔在你头顶喷出一团火焰，用他的高潮祝福了你的[butt]。");
         outputText("[pg]他那滚烫、堕落的精液第一次喷射就让你再次颤抖和高潮，甚至比第一次还要猛烈。他的精液在你的[asshole]里汹涌澎湃，而他肉棒上的倒刺开始震动。这对你来说太刺激了，你停止了胡言乱语，在空洞的狂喜中流下口水");
         if(get_player().hasCock())
         {
            outputText("，几乎没有注意到新一波你自己的精液溢进了你的嘴里");
         }
         outputText("。你高潮了一次又一次，沉浸在接受阿克巴尔精液的快感中。它似乎填满了你的身体和灵魂，用滚烫、堕落的极乐淹没了你的肛门和思想。两次……三次……四次……他只是不断地把更多浓稠的精液射进你体内。第五次喷射让你感觉被填满了。第六次让你的肠道微微膨胀。第七次让你更加肿胀，精液从你的[asshole]里喷射出来，浸湿了你的臀部和皮毛。第八次是最大也是最后一次，你领主的精华完全淹没了你。它把你的肚子撑成了一个圆滚滚的精液罐。当他拔出时，一条精液河涌了出来，你再次高潮了。");
         outputText("[pg]满足之后，你被抱起来，移到了一个");
         if(get_player().hasCock() && get_player().cumQ() >= 1000)
         {
            outputText("干涩，");
         }
         outputText("舒适的地方。阿克巴尔把他那猫科动物的肉棒重新插回你那渗着精液的肛门里堵住它，然后依偎在你身边。你就这样睡着了，梦见他一次又一次地占有你。");
         if(get_player().butt.rating < 20)
         {
            outputText("睡梦中，你的[butt]微微发麻。它在阿克巴尔唾液的改造下变得更加丰满，以便更好地服侍他。");
            var _temp_1:* = get_player().butt;
            _temp_1.rating = _temp_1.rating + 1;
         }
         else if(get_player().tone > 30)
         {
            outputText("睡梦中，你的[butt]微微发麻。它随着你身体的其他部位一起变得柔软，在阿克巴尔唾液的改造下，成了一个更柔软、更适合操弄的部位。");
            get_player().modTone(30,5);
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Cor(5));
         get_player().slimeFeed();
         get_player().createStatusEffect(StatusEffects.PostAkbalSubmission,0,0,0,0);
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function ackbalRepeatAfterWin() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         clearOutput();
         outputText("当你穿过森林时，你听到一声咆哮，抬头一看，刚好躲过了美洲豹恶魔阿克巴尔的突袭。你的");
         if(get_player().isTaur())
         {
            outputText("四足跳跃让你与他拉开了一段距离。你是战斗还是逃跑？[pg]");
         }
         else
         {
            outputText("翻滚躲闪让你与他拉开了一段距离。你是战斗还是逃跑？[pg]");
         }
         menu();
         addButton(0,"战斗",startuAkabalFightomon);
         setExitButton();
      }
      
      public function ackbalRepeatAfterLoss() : void
      {
         spriteSelect(SpriteDb.get_s_akbal());
         clearOutput();
         outputText("当美洲豹恶魔阿克巴尔落在你面前时，你的脑海中响起了一阵笑声。他用充满磁性的声音说道：[say: 哎呀，这不是那个愚蠢至极、再次闯入我领地的叛逆小鬼吗。你是要臣服，还是非要我再给你上生动的一课？][pg]");
         menu();
         addButton(0,"臣服",akbalSubmit);
         addButton(1,"战斗",startuAkabalFightomon);
         setExitButton();
      }
   }
}

