package classes.scenes.areas.volcanicCrag
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.areas.volcanicCrag._GiltScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class GiltScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function GiltScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "gilt";
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
         saveContent.encountered = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function giltWinChoices(param1:Boolean) : void
      {
         registerTag("lustvictory",TagFun_Impl_.fromBool(!param1));
         clearOutput();
         outputText("母猪恶魔[if (lustvictory) {瘫倒|被击倒}]在地，发出一声沉闷的巨响，砸在干裂的泥土上。扬起的灰尘渐渐散去，化作一层烟雾，透过烟雾，你可以看到她那充满渴望的眼神死死地盯着你。她仰面躺着，虚弱得无法再战斗。");
         menu();
         addNextButton("口交",giltOral).hint("使用她的嘴巴。").sexButton();
         addNextButton("操",giltFuck).hint("她有阴道，你有阴茎。[if (silly) { 你绝对想不到接下来会发生什么！}]").sexButton(1);
         addNextButton("摩擦",giltGrind).hint("[if (tailLeg) {小穴对小穴|[if (silly) {享受金棕色的大腿|互相摩擦大腿}]}]。").sexButton(2).disableIf(get_player().isTaur(),"你需要不同数量的腿才能做到这一点。");
         addNextButton("耳交",giltEarFuck).hint("[if (silly) {给这个蝙蝠婊子一点颜色看看|操她的耳朵}]。").sexButton(1).disableIf(get_player().isTaur(),"你需要不同数量的腿才能做到这一点。");
         addNextButton("杀死",giltKill);
         setSexLeaveButton();
      }
      
      public function giltOral() : void
      {
         clearOutput();
         outputText("你毫不掩饰自己的意图，径直向她走去，[if (isnakedlower) {即使你想掩饰也做不到，因为你[if (silly && hasVagina) {整个小穴都露在外面|[if (isTaur || tailLeg) {[genitals]一直暴露在外|[if (isnaked) {没穿|穿着暴露的}]衣服}]}]|你边走边花时间解开下半身的衣物}]。母猪恶魔的表情变得风情万种，带着一丝娇羞。[say: [Boy]费这么大劲就是因为[he]喜欢我？]她翻过身侧躺着，然后像掠食者一样爬行，收起翅膀，挤进你的双腿之间。");
         outputText("[pg]当她打量着眼前的[if (hasCock) {[cocks]|[if (hasVagina) {[pussy]|平滑的耻骨丘}]}]时，她拇指上的爪子轻轻划过你的大腿，灼热的呼吸喷洒在你的腹股沟上。她在那儿停顿了片刻，细细品味着，然后伸出恶魔般的舌头，从[if (hasVagina) {你的小穴|[if (hasBalls) {阴囊|会阴}]}]到[if (hasCock) {[cockhead]|[if (hasVagina) {[clit]|耻骨}]}]，舔出一条长长宽宽的痕迹。");
         if(get_player().isGenderless())
         {
            outputText("[pg][say:来吧，别害羞，我不会咬你的，]她说着，亲吻着你的腹股沟。可惜，那并不是你需要她舌头去的地方。这头母猪恶魔再次戳了戳你那没有性征的表面。[say:但是为什么？]她的话被你当成了耳旁风，你[if (isTaur) {弹动着你的后腿|摆好你的[ass]}]，向她传达你的指令。她撅起嘴，但随后将脸埋进你的臀瓣之间[if (isDrider) {，甚至还没爬上你的蜘蛛背就开始施展她的魅力}]，让你脊背发凉！她的舌头热情地在你湿润的[asshole]上蠕动。起初有些痒，直到最初的紧张和惊讶消退，然后变成了在边缘周围舒缓的按摩。她可能不了解你的身体，但她在做好本职工作方面却出奇地有原则。随着你越来越舒服，你向前倾斜并压低身子，完全献出你的后庭。");
            outputText("[pg]她那扭动的附肢让你放松下来，然后猛地插了进去，让你发出一声愉悦的呻吟。一声轻响拍打在[if (isDrider) {你蜘蛛腹部的中心|地上}]，你回头瞥了一眼，看到蝙蝠女的尾巴在她的双腿间扫过，摩擦着她的小穴。为了不让你的荡妇分心，你[if (isTaur) {抬起你的后[foot]踩在她的尾膜上——这让她发出不满的呜咽|向后伸出手，抓住她那巨大的耳朵，把她拉向你。然而，你本意是想惩罚她，却让她舒服得浑身发抖}]。现在她更有动力了，用舌头操着你的内壁。当她那黏糊糊的触手像一条滑行的蛇一样在你体内兴风作浪，寻找任何能给你带来快感的弱点时，你毫不掩饰自己的反应。当你向前倾斜，把它拉出来时，快感从你的肛门中脉动而出，然后你再次[if (isTaur) {把你的[foot]踩在她的尾巴上|挤压并猛拉她的耳朵}]，让她重新插进去。");
            outputText("[pg]这比你需要的还要多。甚至当你如释重负地呻吟时，声音在胸腔里回荡的感觉也增加了这种幸福感。然而，这一切并没有戛然而止；你俘虏的母猪恶魔深深地亲吻着你的屁股，并在舌头退出的过程中向各个方向卷动。");
         }
         else
         {
            outputText("[pg]蝙蝠恶魔开始站起来，但你[if (isTaur) {用你的[foot]}]把她推倒，向她说明她在这里只能用嘴。她对此明显地撅起了嘴，但在你把腹股沟推向她的嘴之前，她无法抗议。[saystart]呸——好吧，好吧！但下次[if (cor >33) {——[sayend]你挺起臀部打断了她。如果还有下次，她仍然没有发言权。|我们要按我的方式来。[sayend]你是否会再次遇到这个特定的恶魔还有待观察，但如果你打败了她一次，你可能还能再打败她一次。}]她顺从地用饥渴、草率的啜饮声工作着——与其说是优雅，不如说是用力[if (hasCock) {，因为她吸吮着你的[cock][if (cockLength < 6) {直到根部|尽可能深地吞进喉咙}]}]。[if (!isTaur) {她的眼睛盯着你的眼睛，观察着你的一举一动。}]她不时地退缩，咧嘴笑着舔舔嘴唇，然后再次投入其中，她翼尖的爪子占有欲极强地抓着你的大腿。");
            outputText("[pg][if (!isTaur) {你的[hand]放在她闪亮的深色羽毛上，抓住她的头，把她紧紧地抱在怀里，这样你就可以沉浸在她火热的嘴巴吸吮和舔舐的感觉中。你放松下来，手指顺着她的侧面滑下，然后用拇指抵住她的耳根。母猪恶魔僵硬了一下，蹭了蹭你的动作，在你的手指摩擦那大块皮瓣的感觉中呻吟着。一阵颤栗传遍她的全身，翅膀向外抽动，金古铜色的皮肤上泛起深深的红晕。她向后靠了靠，说道，[say:还、还要……继续。]她以两倍的热情将嘴重新埋进你的身体里。}]她的舌头[if (hasCock) {包裹着你的肉棒}][if (isHerm) {并且}][if (hasVagina) {滑下去探测你的小穴，带着对你私密味道的渴望戳着那个洞}]。[if (hasCock) {她毫无顾忌地吸吮着，紧紧抓住你的根部，继续为你口交。}]");
            outputText("[pg][if (hasVagina) {[if (isvirgin) {随着那滑溜溜的触手在你的三角区上下摩擦，并轻弹你的阴蒂|随着那滑溜溜的触手钻进你的小穴，操弄着你的阴道}]，你|你}]舒服得呻吟起来。[if (!isTaur) {女恶魔得到了她的奖励，你伸出一只手抚摸她的另一只耳朵，将两只耳朵都把玩在手中。[i:呼噜声]传到你身上，这女孩现在可能流了更多的口水。显然，她渴望继续得到奖励，她|她}]吞噬着你，舌头推挤，嘴唇紧贴，每一次舔舐都更加火热和急切。她的速度越来越快，直到你忍不住抓住她的嘴，随着不断增长的强度，用你的臀部在她的脸上弹跳。第一波高潮的快感撕裂了你，[if (!isTaur) {你紧紧抓住她耳朵的力道远超你的预期，但她却高兴地尖叫起来，而且她|她}]气喘吁吁地致力于吃掉每一滴，伴随着你的呻吟和高潮。她紧紧地贴着你，陶醉于你的每一次颤抖，舔舐着你流出的任何[if (hasCock) {喷涌的精液|喷射的淫液}]。");
            get_player().orgasm("VaginalAndDick");
         }
         outputText("[pg]直到你踉跄后退，她才终于停下，脸颊绯红，下巴上闪烁着被蹂躏后的光泽。她用翅膀的背面擦了擦嘴。[if (silly) {[say:太火辣了，我还以为你揍我只是为了抢劫我。] 听到她的话，你猛地清醒过来，趁她还没恢复到能再次和你战斗之前，把她推倒并抢劫了她。|疲惫和间歇性的窒息让她付出了代价，她毫无形象地倒下睡着了。}]");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function giltLose(param1:Boolean) : void
      {
         registerTag("lustvictory",TagFun_Impl_.fromBool(!param1));
         clearOutput();
         outputText("[if (lustvictory) {被冲动所克服，你踉跄着倒在地上|被击倒在地，你试图喘口气，但只是吸入了一些因撞击而松动的灰烬，让你语无伦次，迷失了方向}]。这只母猪恶魔将翅膀压在泥土上，爬来爬去，打量着你。");
         outputText("[pg]她黑色的羽毛随着她的咯咯笑声抖动着，然后她俯下身，直到她那充满肉味的呼吸拂过你的脸颊。[say:学得挺快嘛，]她说着，用舌头沿着你的[ear]舔舐。舔舐变成了一种顽皮的咬合，让你退缩，这让她咯咯笑得更厉害了。[say:你是个不错的猎物。]");
         if(!get_player().hasCock())
         {
            outputText("[pg][if (!isnaked) {伴随着一声咕哝，她完全解除了你的遮蔽，把它扔到一边。}]蝙蝠恶魔急切地戳弄着你的腹股沟[if (hasVagina) {，用脚趾分开你的阴户，好奇地揉捏着}]。[say:快点！]她喊道。[say:把肉棒亮出来！]");
            outputText("[pg]现实花了一点时间才显现出来。她的脸因烦恼而扭曲。她猛地拉了一下锁链，把它缠在你的手腕上，紧紧地绑在你的头顶上。[say:啧。你也在找鸡巴！]她气呼呼地说，翅膀猛地张开，然后把臀部向上推，跨过你。");
            outputText("[pg]她的大腿夹住你的脸，滴着水的下体贴在你的嘴上。[say:舔，]她命令道，用力地磨蹭着。她褶皱的热度淹没了你的感官，她锋利的臀部勾勒出她修长、头重脚轻的身体。烟雾弥漫的空气被潮湿的性唤起所取代——咸咸的，引人流口水。你毫不迟疑地张开嘴品尝，这让她非常高兴。");
            outputText("[pg]这只母猪恶魔不知羞耻地用力摇晃着，把她的汁液涂抹在你的嘴唇和舌头上。[say:就是这样，[boy]，对，对！舔，舔，别浪费我的时间！]她呻吟着，即使在嘲笑你时也在颤抖。世界缩小到她臀部的摇摆和填满你嘴巴的美味湿润，她的味道在你的舌头上热烈地萦绕。");
            outputText("[pg]她的爪子刮擦着你头旁边的岩石和泥土，仿佛在争取杠杆，以便更用力地操你的脸。在你上方，她翅膀的黑色帷幕随着她失去镇静而坍塌和膨胀。尖锐、沙哑的叫声刺穿了你的耳朵，然后她猛地摔倒，完全淹没了你，在性高潮中抽搐。");
            outputText("[pg]锁定在你太阳穴上的肌肉发达的腿有节奏地紧张和放松。[if (watersports) {[say:啊-啊，失败者[boy]，喝下我吧，]她说着，用充满她内在热量和下体残留物味道的尿液淹没了你的嘴|当她的小穴在你的舌头上痉挛时，一股光滑的热流淹没了你的嘴，她的整个身体在狂喜中颤抖}]。她在你的脸上扭动着，度过了性高潮，大腿在你周围抽搐时狂野地喘息着。只有当她的颤抖减慢时，她才向前瘫倒，在世界陷入昏迷之前，用她的湿润涂抹你。");
         }
         else
         {
            outputText("[pg][if (!isnaked) {伴随着一声咕哝，她完全解除了你的遮蔽，把它扔到一边。}]她把湿滑滚烫的阴户坐在你的[cocks]上，转动着臀部，建立起期待。她在庆祝的喜悦中叹息着，伴随着一声尖锐的喘息，她将自己抬起又放下，带着强烈的需求向前倒在你身上。这个蝙蝠般的怪物吻了你。");
            outputText("[pg][say:来吧，动动你的臀部！操我！]她喊道。她的翅膀随着每一个动作而颤抖，随着她臀部更用力地猛击而张开。她一边磨蹭，一边在你的耳边热烈地喘息，然后再次咬它。你猛拉并推力以满足她的要求，将自己埋入[if (cockArea>16) {直到你看到她狭窄的肠道明显移动以适应|深深地插入她狭窄的小穴}]。");
            outputText("[pg]她的节奏越来越快，她翅膀上带爪的拇指刺痛了你的皮肤，因为她紧紧抓住你。[say:对，对！]她呻吟着，弓起背。[if (isChild) {[say:谁说小孩子的鸡巴不好，就是不好！]}]她光滑紧绷的皮肤闪烁着汗水，她的内脏燃烧着比闷热的空气更强烈的热量。[say:射在我里面！射！]这只母猪恶魔收紧了，挤压着每一次推力，直到她的呼吸变成沙哑的喘息。");
            outputText("[pg]然后她的整个身体都僵住了，翅膀猛烈地张开，她仰起头尖叫起来。你阴茎周围滚烫、令人窒息的肉在你的长度上痉挛，紧紧抓住你的肉棒，湿润的液体顺着你的阴茎涌下。在同一个动作中，你在自己的性高潮中抽搐和喘息，将精液洒在她饥渴的子宫里。这只母猪恶魔伴随着沉重、野性的叫声度过了她性高潮的顶峰，然后向前倾斜，用力咬你的耳朵，足以让你感到刺痛。她的身体在汗水中挣扎和颠簸，你担心她的牙齿会永远印在你的身上。");
            outputText("[pg]当她终于松开时，你把头靠在开裂的泥土上，不知不觉地让自己陷入昏迷。");
            get_player().orgasm("Dick");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function giltKill() : void
      {
         clearOutput();
         registerTag("isTerrestialMagic",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2721) == 1));
         outputText("抓住时机，当母猪恶魔察觉到威胁并挣扎着想要撑起她头重脚轻的身体时，你拉近了距离。你");
         if(get_player().get_weapon().isHolySword())
         {
            outputText("将你闪烁的刀刃刺入她胸甲的底部，用神圣的钢铁劈开了她的心脏。");
         }
         else if(get_player().get_weapon() == get_weapons().DULLSC)
         {
            outputText("高举你黑暗的镰刀，发出令人生畏的光芒，你的敌人僵在原地。没有询问遗言，你挥舞着这把邪恶的生命吞噬者划过她的脖子，迅速终结了这个恶魔。");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("[if (singleleg) {滑行|跳}]到她的脚踝上，促使她最后一次回头看你，同时你挥舞着[weapon]重重地砸在她的脸上，将其劈开。");
         }
         else if(get_player().get_weapon().isFirearm())
         {
            outputText("[walk]穿过烟雾与火焰，直击她的头部，终结了她的生命。");
         }
         else if(get_player().get_weapon().isStabby())
         {
            outputText("你盯上了她腹部没有防护的血肉，顺着那里向上直到宽阔的胸膛，然后将你的[weapon]刺入，粉碎了她的心脏。");
         }
         else if(get_player().get_weapon().isStaff() && get_player().get_weapon().isChanneling())
         {
            outputText("将你的[if (isTerrestialMagic) {大地|奥术}]力量集中在[weapon]上，一击砸碎她的脑袋，完成处决。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("快步上前，挥舞[weapon]砸向她的头部，将她砸进干燥的泥土中。");
         }
         else
         {
            outputText("冲上前去击中她的脖子，让她咳血窒息，紧接着果断地扭断了她的脖子。");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function giltGrind() : void
      {
         clearOutput();
         outputText("你[if (isnakedlower) {带着战斗的敌意逐渐消退而[walk]|抓起你的[armor]一边[walk]一边脱下}]。母猪恶魔没有浪费时间，张开双腿，像孔雀开屏求偶一样展开翅膀。[saystart]这就对了——[if (hasCock || clitlength > 4.5) {把它塞进我里面|把那根肉棒拔出来}]！[sayend]");
         outputText("[pg]也许令她沮丧的是，[if (hasCock || clitlength > 4.5) {你的[cockclit]这次不是主角|你的[pussy]里没有藏着肉棒}]，但无论如何你都会玩得很开心。你蹲下身子，[if (tailLeg) {将你的生殖裂压在她的阴部上|跨坐在她的大腿上，同时将你自己的腿压在她的阴户上}]。母猪恶魔看起来有些不太相信，但你抓住她并在她身上挺动，感受着你们两人之间的热度，让她轻轻喘息。这个女孩已经湿透了，不管她是否对没有插入感到失望。她用双臂环抱住你，轻轻叹息。");
         outputText("[pg][say:这样也不错，]她承认道。她金古铜色的大腿紧紧地锁住你[if (!tailLeg) {rs}]，直到你们的下体紧紧贴在一起，颤抖着摩擦。她的翅膀折叠起来，像茧一样弯曲，将你们包裹在其中。世界的其他部分被她的翼膜遮蔽，只留下她身体的摩擦、性爱的气味，以及她靠过来时拂过你[if (height > 84) {chest|[if (height < 72) {forehead|cheek}]}]的呼吸。[if (height > 84) {她巨大、有脊的蝙蝠耳在她摩擦时不断地拂过你的脸，在一种本能的冲动下，你咬住那半个锥形的耳朵，让它停止拍打|她的嘴没有去寻找你的嘴唇，相反，你发现自己因为她饥渴地啃咬你的耳朵而退缩。在她锋利牙齿的轻轻捏咬之间，她的舌头在轮廓上弹动，她将她的情欲喘息进你的体内}]。女恶魔的大腿夹得更紧了，臀部坚持不懈地摇摆着，湿润的液体在你们两人之间涂抹。[say:对！[if (height > 84) {就是这样，别停|真是个可爱的小点心}]！]她发出低沉而沙哑的呻吟，臀部以一种充满渴求的节奏画着圈，将[if (tailLeg) {她的阴蒂在你的阴蒂上摩擦|你们的阴蒂在彼此的腿上摩擦}]。[if (tailLeg || hasTail) {一根肉质的绳索像蛇一样缠绕并挤压着，弄得你的[if (tailLeg) {tail|[tail]}]痒痒的。}]");
         outputText("[pg]她翅膀形成的帷幕构成了一个回荡着呻吟和湿润体外摩擦的回音室。[if (height > 84) {每次你咬她时，她都会颤抖，用她的爱液浸湿你，当你将舌头滑过她耳朵的螺旋处时，她会充满爱意地亲吻和依偎你的[breasts]|母猪恶魔对你的耳朵着迷了，当她长长的恶魔舌头戳刺和逗弄它，压在耳道上然后又缩回去让她再次啃咬和拉扯时，你忍不住颤抖和摇晃}]。对你感官的持续冲击让你忘记了时间；你每一次移动她都会抽搐，这暴露了她也同样沉迷于这一刻。");
         outputText("[pg][if (height < 85) {你抓住机会反客为主，伸手抓住了一只那巨大的蝙蝠耳。你的[claws]合拢在上面，慢慢探索它内部的曲线。反应是立竿见影的。[say:啊——啊！]她叫道。}]当你逗弄那些隆起时，她金色的皮肤上泛起了更深的红晕；她的翅膀颤抖着，茧随着她身体的每一次涌动而颤抖。她的节奏只剩下急促的发情。你感觉到她要在你身上崩溃了，手脚抽搐，快感淹没了她。伴随着一声尖锐、沉闷的叫喊，她猛地绷紧，阴蒂在你[if (tailLeg) {rs}]身上跳动，她猛烈地高潮了，在你的掌控中颤抖，无法控制地在你的[pussy]里扭动，让你在即将到来的绝望高潮中颤抖。你把她按在身下，继续摩擦，在这个过程中让她更加兴奋。有那么短暂的一刻，周围安静了下来，直到母猪恶魔发出一声沉重的呼气，在性爱的挫败中喘息着。你的身体一阵阵地紧绷又放松，宣告着满足[if (hasCock) {，并将你的精液喷洒在她的臀部和肚子上}]。");
         outputText("[pg]随着高潮的平息，女恶魔瘫倒在灰烬般的泥土上。即使余震还在她体内荡漾，她还是喃喃自语道，[say:下——下次再来吧[if (ischild) {，孩子}]……]离开这个满足的蝙蝠女孩，你踉跄着站起来，整理好自己。她现在的状态根本注意不到你为了补偿自己而顺手牵羊，你带着稍微鼓一点的钱包出发了。");
         dynStats(DynStat.Cor(1));
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function giltFuck() : void
      {
         clearOutput();
         outputText("由于你如此兴奋，你[if (isnakedlower) {无法隐藏你的勃起[if (multicock) {}]|急忙让自己准备好}]，很明显，这只战败的母猪恶魔和你一样渴望这个。然而，还没等你摆好姿势，她的爪子就以惊人的热情抓住了你的[if (tailLeg) {鳞片尾巴|[if (singleleg) {下半身|脚踝}]}]。她展示了令人印象深刻的腹部力量，她[if (isTaur) {在你的四足身体下将自己拉起，然后紧紧地合拢翅膀|沿着你的身体向上爬，甚至在还没爬完之前就直起身子面对你}]。恶魔青铜色的大腿在你的臀部周围张开，而你还在微微踉跄，并从她巨大的翅膀带来的阵风中退缩。");
         outputText("[pg][say: 终于！] 她大喊道。[say: 这就是我一直想要的！] 她的爪子抓着你的臀部借力，当她固定好自己时，她那覆盖着装甲的胸部重重地撞击着你——她那滴着水、滚烫的小穴随意地压在你的[cockhead]上。[say:别摔倒了！] 她要求道。");
         outputText("[pg]理智地说，让失败者做所有的工作似乎是正确的，但是[if (isTaur) {你不耐烦地将臀部挺进你那渴望的新下盘|你忍不住本能地拥抱并稳住她。你没有跌倒，而是把你的[hands]放在她轮廓分明的臀部上，挺进这只发情的蝙蝠}]，强迫你的[cock]进入。随之而来的是一声愉悦的喘息，就像把你的肉棒埋在滚烫的肌肉里一样。这只母猪恶魔从一开始就以疯狂的速度反击。她臀部的每一次撞击都震动着她的装甲板，每一次挺进都发出湿润的拍打声，因为她的热情吞噬了你。她紧绷而紧致，但涌出的汁液足以滑过[if (cockthickness > 3) { 即使是像你这样粗的[if (cockthickness > 5 && cockLength < 10) {奶酪轮|桅杆}]}]。");
         outputText("[pg]有那么一瞬间，她慢了下来，叹了口气。[say:傻[boy]，我们不需要为了这个而打架，] 她说。蝙蝠依偎得更紧了，细细品味着这种感觉。[if (ischild) { [say:那些说小孩子的肉棒没用的女孩太挑剔了！] 她呻吟道。|[if (isElder) { [say:有人说老[men]会变老和抱怨，或者别的什么，但你仍然知道什么是好东西！]}]}]");
         outputText("[pg]可能是因为战斗后她的体力还没有恢复，所以她放慢了节奏，但你却没有。为了得到满足，你[if (singleleg) {[if (tailLeg) {卷起你的尾巴|展开你的身体}]以保持稳定|调整你的姿势以获得力量和稳定性}]，然后[if (isTaur) {开始|在挺进之前摸索恶魔紧绷、苗条的体格}]！她咕哝了一声，几乎失去了对你的控制，但随后以同样的信念操弄着你的[cocktype]。她的节奏现在更加一致，与你同步弹跳。凶猛、紧绷的大腿要求更深的捣弄。每一次动作的震颤都传遍了她宽阔的胸膛，她的声音变成了充满欲望的叫喊。");
         outputText("[pg][say:我是一个幸运的失败者，] 她呻吟着。她的大耳朵随着每一次颠簸而抽动，她在狂喜中向后仰起头。她再次向前倾，牙齿闪烁着咬你[if (!isTaur && height < 85) {的[ear]，咯咯笑着啃咬}]，但她的主要注意力集中在臀部疯狂的弹跳上，决心趁你还站着的时候把你榨干。她的胸部随着沉重的呼吸而起伏，但她依然毫不减弱地摩擦着你的肉棒。这只母猪恶魔在原始的快感中呻吟，你无法抑制住射精的冲动，因为一团紧绷的柔软肌肉勒住了你的肉棒——随着她的节奏变成无情的渴求风暴，她更加用力地挺进，贪婪地放纵着榨取你。");
         outputText("[pg]你的身体终于在她的要求下崩溃了，在达到高潮的极乐中排空了肺部的空气，你在她体内深处又硬又热地喷涌而出。与潮红、滚烫的小穴相比，你喷涌的精液几乎是凉的。她高兴地呻吟着。[say:这就对了，真是个好[boy]，] 她说着，用翅膀虚弱地拍了拍你，而你则发出了满足的最后一声叹息。当你闭上眼睛的那一刻，重量和压迫感突然消失了，紧接着是蝙蝠毫无形象地摔在干燥、灰烬般的泥土上发出的沉闷的[i:砰]声。她闭上眼睛休息时，咕哝了一些你认为是邀请下次再来的话。");
         dynStats(DynStat.Cor(1));
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function giltEarFuck() : void
      {
         registerTag("seenHellmouth",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2712) == 1));
         clearOutput();
         outputText("这只母猪恶魔挣扎着靠折叠的翅膀支撑起自己，她的瞳孔锁定了为你[if (isnakedlower) {肿胀|在你脱衣服时暴露在空气中}]的勃起。她期待地深吸了一口气，然后坐了起来。然而，你并没有给她她显然期望的东西，而是温柔地抚摸她的脸颊。");
         outputText("[pg][say: 噢，你真的很喜欢我，不是吗？] 她调侃道，急切地靠在你的手掌上。但是你的[hand]滑得更高了。你的手指拂过她头上的一些羽毛，擦过她大而圆锥形的耳朵底部，恶魔颤抖着，脊柱像拉紧的弓弦一样弯曲。[say:天哪，那真是——]当你的拇指按压她的耳道时，她的声音变得很高[say:——太棒了！]");
         outputText("[pg]这只母猪恶魔在耳朵的把玩下融化了，当你抚摸那长而敏感的软骨时，她的整个身体都变软了，呼吸也变得急促。她带着无助、本能的需要依偎在你的抚摸中，胸腔里发出低沉的呼噜声。她的大腿摩擦在一起，发出一声微弱、尴尬的呻吟。[if (seenHellmouth) {这些耳朵很大，但不如地狱口的那么厚实柔软。}]当你的[cock smallest]压在她耳朵娇嫩的边缘时，她喘着粗气。虽然她的身体僵硬了，但她没有做出任何抵抗的举动。");
         outputText("[pg]龟头顶了进去。她的呻吟声高了八度，整个轻盈的身躯都在颤抖。里面的肉紧致得不可思议，却又柔软无比，所有用来收集声音的轮廓都在努力夹紧你的龟头。你更加用力地戳刺，随着紧致的耳道被撑开，她的呼吸变成了短促、破碎的呜咽。");
         outputText("[pg][say:你真的和我一样喜欢我的耳朵，]她粗声粗气地说，几乎要失去理智。她长着利爪的拇指紧紧抓住你的大腿。[say:操[b:操]我，[boy]！]");
         outputText("[pg]受到鼓舞，你将手指穿过她闪烁着虹彩的黑色羽毛，双手抓住她的头作为支撑，然后用力一推，直到你整个[cockhead smallest]都插了进去！每一次浅浅的抽插都让整个耳朵包裹着你颤抖。这个像蝙蝠一样的女恶魔翻着白眼，对着空气挺动腰肢，仿佛本能在告诉她这就是在做爱。");
         outputText("[pg]当她再次开始组织语言时，那些语无伦次的鼻音和咕哝声停了下来。[say:再深点！]光是龟头还不够。");
         outputText("[pg]你那根肉棒在这个发情的女人乞求下抽动着，于是你固定住她的头，开始感受包裹着你整根肉棒的灼热。你用另一只[hand]抓住她另一边的耳朵。你捏住它的那一刻，她舒服得尖叫起来，扭动着头，让她的耳道在你的肉棒上旋转。");
         outputText("[pg][say:不——不行，如果我高潮了，就结束了！]");
         outputText("[pg]你的抽插比以前更深了，你的肉棒在极其敏感的耳朵肉里滑动的湿润声音回荡着。随着每一次感觉的冲击波，她的翅膀无助地拍打着。它可能不像小穴那样湿滑、能榨干精液，但那紧致的压迫感和热度绝对不容忽视。她的大腿颤抖着，紧紧地夹着空气，你越是抚摸她的两只耳朵，她的声音就越是疯狂和语无伦次。");
         outputText("[pg]你收紧她的耳朵，开始向高潮冲刺。你的手掌沿着她耳朵的长度最后用力一拉，将她推向了边缘。母猪恶魔尖锐地叫喊着，臀部猛烈地挺动，高潮以原始的强度撕裂了她[if (watersports) {，同时她尿在了干涸的土地上}]。你的高潮也随之而来，你的腹肌收缩，[if (hasballs) {balls|loins}]紧绷，你急促地喘息着，将一波又一波的精液射入这个鸟脑袋里肯定很宽敞的空间。随着每一次喷射，她都痉挛着，像疯了一样颤抖，你的精液从你进入的地方涌出。");
         outputText("[pg]当最后的喷射消退时，她幸福地瘫倒在地，翅膀在泥土中张开。");
         outputText("[pg][if (silly) {她虚弱地咧嘴笑了。[say:抱歉之前攻击了你，我想我终于听懂你的意思了。]看来她脑子坏掉了。}]");
         dynStats(DynStat.Cor(1));
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function get_debugName() : String
      {
         return "Gilt";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function encounterGilt() : void
      {
         clearOutput();
         if(!saveContent.encountered)
         {
            outputText("当你[walk]入更深的峭壁时，原本就干燥的空气似乎变得更加干燥——尽管你正努力远离那些敞开的熔岩喷口。当你踩碎脚下干燥、易碎的岩石时，煤烟不时地喷出。这里的烟雾和灰烬刺激着你的感官，你一边保护眼睛免受碎屑的伤害，一边向更稳定的地面走去。");
            outputText("[pg]虽然你被致盲了，但你集中注意力在其他感官上，捕捉到了远处的回声和咔哒声。你停下脚步，试图弄清楚那是什么声音，接着前方传来了锁链的撞击声；你转移注意力，看到烟雾被翅膀的拍打声吹散！你向侧面闪避，成功预判了一次攻击——当那个身影飞过时，一条锁链上悬挂着锋利的边缘。你保持警惕，准备战斗，转身面对一个看起来像恶魔般灵活的蝙蝠女。缠绕在她腿上的金属链条自由地悬挂着，末端有一把弯曲的刀刃。当她滑翔时，武器向她的另一条腿摆动，让她能用爪子般的脚接住它。");
            outputText("[pg]在全貌中，你看到她的翅膀是一层薄膜，连接着她的手臂和身体，跨越了她大部分的身高。她俯冲到地面，直起身子时直视着你的眼睛。[say:反应不错！]她说道。她宽阔的桶状胸膛上覆盖着板甲，但她腹部的深井完全暴露在外，展现出她光滑、金古铜色皮肤的光泽。虽然她的脸是人形的，但她的额头上长着一排短角，身后长长的镰刀状尾巴结合在一起，构成了毫无疑问的恶魔印记。");
            outputText("[pg][saystart][if (isChild) {年轻敏捷的小[boy]|[if (isElder) {尽管你看起来这样，但你还没老到不能玩|你看起来[if (isfeminine) {很可爱|很帅气}]，速度很快}]}]！[sayend]她兴奋地叽叽喳喳叫着。");
            saveContent.encountered = true;
         }
         else
         {
            outputText("一阵微弱的旋律回声让你的耳朵竖了起来，接着一次沉重的拍打将灰烬吹向你，你本能地躲开了这只俯冲的野兽。这只蝙蝠般的恶魔咯咯笑着，四肢着地，爬来爬去，准备再次起飞。");
         }
         startCombat(new Gilt());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

