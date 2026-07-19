package classes.scenes.dungeons.lethicesKeep
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.Player;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class HermCentaur extends Monster
   {
      
      public var _usedHeal:Boolean;
      
      public var _usedGottaCum:Boolean;
      
      public var _lustAtChargeStart:Number;
      
      public var _hypnoCockUses:int;
      
      public var _chargingArouse:Boolean;
      
      public var _arouseCooldown:int;
      
      public function HermCentaur()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _hypnoCockUses = 0;
         _arouseCooldown = 0;
         _lustAtChargeStart = -1;
         _chargingArouse = false;
         _usedHeal = false;
         _usedGottaCum = false;
         super();
         set_a("");
         set_short("herm centaur");
         imageName = "hermcentaur";
         set_long("在几英尺外高傲地站着一个巨大的恶魔，与你见过的任何恶魔都不同。她完全是个半人马——马的身体、蹄子、皮毛等等一应俱全，但她的体型也同样巨大——大约有九英尺高，而且同样丰满。随着呼吸起伏、颤动着的E罩杯骄傲地从她的胸前挺出，毫无拘束地暴露在世人面前，粗大的乳头点缀其上，就像雄伟的性爱王冠。在她的腹部下方，一根粗大的马鸡巴随着她的每一步湿漉漉地拍打着她的皮毛，沉甸甸的睾丸在后面晃荡。一根纯黑色的角从她的额头突出，证明了恶魔的腐化正流淌在这个怪物般的女人的血管里。不过，如果没有这根角，你绝对猜不到她是个恶魔。她闪亮的火橙色头发和苍白、长着雀斑的皮肤，看起来就像你在一个天真的女仆身上看到的那样，而不是一个腐化堕落的兽性祭坛。");
         set_race("Demon");
         set_tallness(108);
         createBreastRow(Appearance.breastCupInverse("E"));
         createCock(36,5,CockTypesEnum.HORSE);
         createVagina(false,4,5);
         balls = 2;
         ballSize = 3;
         hips.rating = 15;
         butt.rating = 13;
         initStrTouSpeInte(100,100,65,65);
         initLibSensCor(85,40,100);
         set_weaponName("fists");
         set_weaponAttack(1);
         set_weaponVerb("punch");
         set_armorName("wraps");
         bonusHP = 800;
         set_gems(75 + Utils.rand(50));
         level = 22;
         lustVuln = 0.6;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().lethicesKeep.hermCentaur.inSovietCoCPonyRidesYou(param1,param2);
      }
      
      override public function performCombatAction() : void
      {
         --_arouseCooldown;
         var _loc1_:MonsterAI = new MonsterAI();
         if(_chargingArouse)
         {
            _loc1_.add(arouseSpellCast,1,true,10,FATIGUE_MAGICAL,CombatRange.Omni);
         }
         else if(get_lust100() >= 60 && !_usedGottaCum)
         {
            _loc1_.add(gottaCum,1,true,10,FATIGUE_NONE,CombatRange.Tease);
         }
         else if(HPRatio() <= 0.5 && !_usedHeal)
         {
            _loc1_.add(healUp,1,true,0,FATIGUE_MAGICAL_HEAL,CombatRange.Self);
         }
         else if(Utils.rand(get_lust()) >= 40)
         {
            _loc1_.add(hypnoCock,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         }
         else
         {
            _loc1_.add(feminineMusk,1,true,10,FATIGUE_PHYSICAL,CombatRange.Tease);
            _loc1_.add(aphrodisiacSquirt,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
            if(!_chargingArouse && _arouseCooldown <= 0)
            {
               _loc1_.add(arouseSpellCharge,1,true,0,FATIGUE_MAGICAL,CombatRange.Omni);
            }
         }
         _loc1_.exec();
      }
      
      public function hypnoCock() : void
      {
         _hypnoCockUses += 1;
         if(_hypnoCockUses == 1)
         {
            outputText("啪！你被这奇怪的声音吓了一跳——你们俩都没有接触到对方。啪叽！这次是一个滑稽的湿润声音打断了噪音。恶魔半人马正咧嘴大笑，随着声音的继续，她的脸颊微微泛红，每一次都加深了她的红晕。到底怎么回事？啪叽——哧溜！");
            outputText("[pg]你及时向下瞥了一眼，看到她的肉棒正慢慢地从她马身的下腹部拉开，似乎被她浓稠的先列腺液粘连着。直到它垂得足够低，闪亮的粘液丝断裂时，它才动起来，带着新鲜的欲望向上涌动，拍打在她的肚子上，将先列腺液的液滴溅在毛茸茸的肉体上。它有着稳定、不可否认的节奏——每一次撞击似乎都遵循着与前一次相同的隐藏节拍，回荡在庭院里，传入你脆弱的耳朵。");
            outputText("[pg]在着迷地看了一会儿之后，你才意识到女恶魔已经开始说话了，她低声耳语道，[say: 很难移开视线，不是吗？有人告诉我，它可能相当具有催眠作用……几乎……令人着迷。]");
            outputText("[pg]好吧，你可以自己看。很容易就能看着它慢慢降下，然后向上拍打，喷出一大股高潮前的淫液。反正你在和她战斗时也得看着她，所以你不介意看着那里。你可以盯着她最脆弱的地方。");
         }
         else
         {
            outputText("啪！她又开始用肉棒拍打自己的肚子了，你不假思索地再次寻找声音的来源，刚好及时发现她那肿胀的马屌砰的一声撞在她的肚子上，一丝先列腺液顺着它坚硬的下侧流下。它慢慢降下，然后再次升起，伴随着湿润的拍打声，猛地撞击在她被精液弄湿的下腹部。节奏和以前一样稳定而有规律，而恶魔的声音更是火上浇油。");
            outputText("[pg][say: 是的，你的眼睛似乎锁定了它，不是吗？它们看到了我坚挺的肉棒，除了看着它，让它完全占据你的视野，它们很难做任何其他事情，]她轻声说道。");
            outputText("[pg]是的……这很迷人。你试图抬起头，但那根肉棒似乎又拍回了你的视线，撞击的回声在你的头骨里回荡。性感的半人马沉思着，[say: 我看得出来你很喜欢它。放松下来看着它肯定没有坏处，对吧？]");
         }
         if(get_player().get_inte() * (2 / _hypnoCockUses) > Utils.rand(get_player().lib / 3 + get_player().sens / 3 + get_player().cor / 3))
         {
            get_player().takeLustDamage(2 + Utils.rand(get_player().lib / 20 + get_player().sens / 20),true);
            if(get_player().get_lust100() <= 33)
            {
               outputText("[pg]脑海中闪过的一丝警觉让你猛然从肉棒引发的迷思中惊醒——这个恶魔正试图催眠你，很可能是想诱惑你屈服。这次可不行！你强行移开视线，得意地直视她的眼睛。");
            }
            else if(get_player().get_lust100() <= 66)
            {
               outputText("[pg]内心深处一个微弱的声音响起，警告你情况不对。这足以让你从昏沉中清醒过来，点燃你的意志力，将视线从敌人那根轻轻晃动的肉棒上移开。你得意地直视她的眼睛。");
            }
            else
            {
               outputText("[pg]一个谄媚的声音乞求你把目光从眼前那根诱人跳动的肉棒上移开，但你几乎无视了它。那根粗大的肉棒看起来太他妈诱人了——它在你面前跳动起舞，如此催眠，让你着迷。不！你猛地抬起视线，直视恶魔的眼睛，看到她幸灾乐祸的样子时皱起了眉头。你可能已经准备好做爱了，但这次你不会再上她的当了！");
            }
         }
         else
         {
            get_player().takeLustDamage(20 + 2 * _hypnoCockUses + 2 + Utils.rand(get_player().lib / 10 + get_player().sens / 10),true);
            outputText("它慢慢地往下坠，越垂越低……啪！它又弹了上去，带着你那被迷住的目光一起上下起伏。[say:真是个好[boy]，]这根肉棒的主人低语道，[say:只要跟着节奏，让它填满你的脑海，随着每一次跳动渗入你的体内。]");
            outputText("[pg]操！她是对的，现在越来越难去想别的事情了。你进一步死盯着那根肉棒，不愿或无法移开视线。");
            outputText("[pg][say:就这么看着，让你的思绪从脑海中流走，是不是很容易？]那个声音问道。");
            outputText("[pg]你点了点头。");
            outputText("[pg][say:每一次摇摆，每一个动作，都那么性感，不是吗？]");
            outputText("[pg]你再次点了点头。");
            outputText("[pg]那个声音继续说道，[say:每一次跳动，每一次黏糊糊的分泌，每一次悸动……它们都那么性感，那么湿润火热。你盯得越紧，它就越让人兴奋……你就越想摸它。]");
            outputText("[pg]天哪，你太想摸它了。其中一根坚硬的青筋在跳动，你太想抚摸它了，想感受它在你手中抽搐，把液体滴得你满身都是。它看起来那么棒，那么充满力量和欲望。光是看着它就让你欲火焚身。操它会是什么感觉？骑在它上面呢？弯下腰，主动献上自己被它刺穿呢？");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("[pg]你呜咽着，已经发情到什么都不在乎了。当你意识到她要让你怀孕时，你满怀期待地呻吟起来……");
            }
            else
            {
               outputText("你向前踉跄了一步，这个动作竟然让你从情欲的迷雾中惊醒。这正是你摆脱这邪恶强迫所需要的，你重新做好准备，要击倒这个麻烦的敌人。尽管如此，你的目光还是不断地往下瞥。你将更难抵御任何类似的挑逗……");
               outputText("[pg][say:现在让我们看看强大的“勇者”怎么抵抗我，]这只半人马恶魔嘲弄道，终于停下了她那根惹麻烦的肉棒的动作。");
            }
         }
      }
      
      public function healUp() : void
      {
         _usedHeal = true;
         outputText("恶魔擦去伤口上的一滴血，烦躁地皱起眉头。[say:你知道当你满脑子想着从后面干一个勇者的时候，施展治疗法术有多难吗？]她闭上眼睛集中注意力，性液毫无阻碍地从她混合的生殖器中流出。与此同时，她的伤口愈合了，覆盖着新长出的马毛或淡粉色的皮肤。片刻之后，她微微摇晃了一下，嘟囔道，[say:全好了……希望你别再来一次。我怀疑我还能不能再施展一次。不过话又说回来，到那时你很可能已经被我的肉棒插到底，或者舌头深陷在我的小穴里了，不是吗？]");
         set_HP(maxHP());
      }
      
      public function gottaCum() : void
      {
         _usedGottaCum = true;
         outputText("恶魔叹了口气，向你投去充满欲望的一瞥，并用蹄子漫不经心地跺着地。[say:别再让我——嗯——发情了……你这个愚蠢的……性感的……呃，该死！]她抗议着，她那根坚硬的肉棒拍打着她的肚子，而女性精液的细流则顺着填满她黑色阴囊的闪亮球体滴落。半人马带着毫不掩饰的欲望揉捏着自己的乳房，毫不留情地拉扯着她那又大又硬的乳头，同时她的后腿在周围蹒跚，可能只是为了更用力地摩擦那厚厚的女性阴唇。");
         outputText("[pg]这个被腐化玷污、皮肤白皙的生物娇喘着咕哝道，[say:现在你得看着我高潮了，勇者。]");
         outputText("[pg]数百磅重的巨大半人马身躯扭动着，她的身体因极乐而剧烈收缩，她肚子下方的肉棒坚硬地膨胀起来。她呻吟着，粉红色的乳汁从她坚硬的乳头滴落，同时她的小穴爆发了，释放出一股黏滑的女性精液，溅落在她蹄子间的草地上，空气中弥漫着她的气味。一秒钟后，她完全扩张的龟头颤抖着，湿润的马眼大大张开。一股白色的液体从那个狭窄的洞口喷涌而出，像潮水一样凌乱地溅落在鹅卵石上，空气中充满了咸咸的精液味。她那因精液而膨胀的蛋蛋颤抖着，随着每一次精液的喷射慢慢缩小，直到它们几乎只有大苹果那么大。");
         outputText("[pg]恶魔红着脸呜咽道，[say:……我想我不能再来一次了，但我也不认为你能让我再像那样发情两次！]");
         set_lust(0);
         get_player().takeLustDamage(15,true);
      }
      
      public function feminineMusk() : void
      {
         outputText("恶魔半人马娘转过身，抬起尾巴，露出她那肿胀的黑色母马小穴，阴唇上沾满了黏滑的淫液。她将人类的上半身向后仰躺，展现出惊人的柔韧性，让你能看到她那凸起乳头的轮廓，同时她的尾巴慵懒地将她那被腐化强化的费洛蒙扇向你。当这股生物情欲的微风拂过你时，空气温度似乎骤升了几度。芬芳的雌性体液似乎渗入了你的每一个毛孔，尽管你渴望赢得胜利，");
         if(get_player().get_lust100() <= 50)
         {
            outputText("你的[skin]还是变得滚烫。");
         }
         else
         {
            outputText("血液涌向你的下半身，刺激着");
            if(get_player().hasCock())
            {
               outputText("[eachCock]，渴望着能插入那个多汁火热的洞穴中。");
            }
            else if(get_player().hasVagina())
            {
               outputText("你的[vagina]，让你产生屈服的渴望，淫液在你的[legs]间汇聚。");
            }
            else
            {
               outputText("你的肛门，直到它收缩起来，渴望着有什么东西能填满它——什么都行。");
            }
         }
         get_player().takeLustDamage(8 + get_player().lib / 10 + get_player().sens / 10,true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lethicesKeep.hermCentaur.beatThePony(param1);
      }
      
      public function arouseSpellCharge() : void
      {
         outputText("半人马娘闭上眼睛片刻，然后又睁开。她的眼睛已经变成了完全纯粹的黑色。她低声吟唱着，你看到她身下的肉棒随着神秘的咒语上下摆动，渗出先列腺液。你必须阻止她！");
         if(get_player().get_inte() > 80)
         {
            outputText("挑逗攻击可能是最有效的攻击方式。");
         }
         _chargingArouse = true;
         _lustAtChargeStart = get_lust();
         _arouseCooldown = 7;
      }
      
      public function arouseSpellCast() : void
      {
         _chargingArouse = false;
         _lustAtChargeStart = -1;
         if(get_lust() >= _lustAtChargeStart + 10)
         {
            outputText("女恶魔浑身一颤，咒语念得磕磕巴巴，一道红宝石般的光芒笼罩了她的身躯！一声低沉、淫靡的呻吟从那被深红色雾气包围的轮廓中传出，回荡着无尽的情欲，因为主人的法术反噬了她自己。像大多数男人的精液一样浓稠的先列腺液喷溅在草地和鹅卵石上，而这个双性人的睾丸似乎增大了一倍。即便如此，那沉甸甸的雄性囊袋依然闪烁着暗淡的光芒，完全被滴落的母马淫液浸透了。");
         }
         else
         {
            outputText("吟唱在你能够阻止之前达到了高潮，当这个九英尺高的女人指向你时，你几乎来不及吐出一个诅咒。她的法术已经降临到你身上。一道深红色的光芒闪过，似乎和太阳一样明亮，然后你被一股强烈的欲望击中，这股欲望强烈得简直就像一股物理力量。它狠狠地扇了你一巴掌，让你踉跄后退，同时你的心脏将每一滴多余的血液都泵向下方。你因被迫勃起而大叫，随着快感的攀升而疯狂地胡言乱语，你和你的敌人以各种能想象到的性交姿势纠缠在一起的画面淹没了你的意识。");
            get_player().takeLustDamage(20 + get_player().lib / 6 + get_player().sens / 6,true);
         }
      }
      
      public function aphrodisiacSquirt() : void
      {
         outputText("半人马娘抓住她沉甸甸的乳房，随意地挤压着顶端坚挺的乳头。一缕玫瑰色的汁液流了出来，顺着她的乳房下沿滴落，在光线下湿润地闪烁着。你一时被迷住了，惊奇地看着这恶魔般的泌乳景象。空气中弥漫着淡淡的甜味，你不由自主地舔了舔嘴唇。接着，她用力一挤，一股粉红色的母乳直接向你喷射而来，液体分裂成无数股，让你根本无望躲闪。");
         get_player().takeLustDamage(8 + get_player().lib / 10 + get_player().sens / 10,true);
         if(get_player().get_lust100() < 30)
         {
            outputText("[pg]你紧闭嘴巴，忍受着这闪烁的乳汁阵雨，拼尽全力抵抗这种阴险液体的效果。无论它击中你哪里，都会很快消失，直接被你的身体吸收。");
         }
         else if(get_player().get_lust100() < 40)
         {
            outputText("[pg]你的心跳加快了。");
         }
         else if(get_player().get_lust100() < 50)
         {
            outputText("[pg]你的脸颊泛红，努力不去想象你要如何操这样一头野兽。");
         }
         else if(get_player().get_lust100() < 60)
         {
            outputText("[pg]你眨了眨眼，却发现眼睛闭上的时间比你预想的要长，脑海中全是你吸吮那粉色甜美乳汁的画面。");
         }
         else if(get_player().get_lust100() < 70)
         {
            outputText("[pg]当你意识到将要发生什么时，你失望地呻吟了一声，但一旦你被这催情剂沾满，");
            if(get_player().hasCock())
            {
               outputText("[eachCock]就苏醒了，充血直到完全勃起。");
            }
            else if(get_player().hasVagina())
            {
               outputText("你的下半身泛起一阵湿热作为回应，并且每时每刻都在变得更加强烈。");
            }
            else
            {
               outputText("你的[asshole]一阵刺痛，渴望着有什么东西能填满它。");
            }
         }
         else if(get_player().get_lust100() < 80)
         {
            outputText("[pg]你叹了口气，试图在这场粉红色的雨中找个更好的姿势");
            if(get_player().hasCock())
            {
               outputText("无视了[eachCock]越来越硬的胀痛感");
            }
            else
            {
               outputText("无视了贴身[armor]越来越湿润的感觉");
            }
            outputText("。随着内心欲望的不断涌现，你越来越难以保持清醒的头脑。没过多久，你就发现自己舌头伸在外面，口水流了自己一身。天哪，你好想做爱！");
         }
         else if(get_player().get_lust100() < 90)
         {
            outputText("[pg]你狂热地喘息着，试图无视那粉红色的雨滴，但这只是徒劳。它让你的[skinfurscales]滚烫，以恶魔般的效率渗入你的体内，将你的情欲之火煽动到超越常理的极限。");
            if(get_player().hasCock())
            {
               outputText("先列腺液开始从你那滚烫且准备就绪的马眼里滴落，渴望着喷涌出精液的洪流。");
            }
            else if(get_player().hasVagina())
            {
               outputText("湿透的淫液顺着你的[legs]流下，证明了你那想要交配的邪恶欲望。");
            }
            outputText("你需要马上做爱。你几乎无法控制自己了！");
         }
         else if(get_player().get_lust100() < 100)
         {
            outputText("[pg]你大声呻吟着，将洒落在你身上的东西涂抹在你的[chest]上，不断攀升的欲望几乎达到了你的极限。你非常想抚摸自己，但你知道，如果这么做了，你就会沦为这只半人马的母马，也许永远都是。你必须抵抗！你不能成为这个……迷人生物的受害者。");
         }
         else
         {
            outputText("你跪倒在地，开始试图撕开你的[armor]。你已经不在乎输赢了——操这个女人……这只野兽……这才是唯一重要的事情。你不在乎她怎么对待你，只要能射她一身就行！");
         }
      }
   }
}

