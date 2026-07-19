package classes.scenes.places.boat
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class SharkGirlScene extends BaseContent
   {
      
      public function SharkGirlScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function sharkgirlHypnosis() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         outputText("鲨鱼娘踉跄了一下，摔倒在仰面朝天。你[if (isSwimming) {在水中滑行|迅速滑行}]向她靠近，当她[if (isSwimming) {调整姿势|坐起来}]时，脸上露出了极度恐惧的表情。显然，她不习惯在任何意义上成为“猎物”。你决定改变这一点。你抓住她的肩膀，把她按在你的掌控之中。显然在战斗中被削弱了，她在你手中瘫软下来，仍然害怕得微微发抖，但无力反抗。你花了一点时间欣赏她身体流畅的曲线，并沉思着你面前的猎物是多么的完美。[pg]");
         outputText("鲨鱼娘开始在你身下微微蠕动，在明显的恐惧之下，对这种拖延感到一丝烦躁，她结结巴巴地说，[if (isSwimming && silly) {[say:咕-咕噜 咕噜？]|[say: 你-你在等什么？]}]你对她向刚刚打败她的人提出要求的态度感到好笑。相反，你猛地抬起头，目光锁定她的眼睛，保持着一种可怕的面无表情。她立刻退缩了，显然期待着接下来会有什么痛苦的事情发生。在恐惧中僵住片刻后，她慢慢地把头转回你这边。这次她的愤怒更加明显，她说道，[if (isSwimming && silly) {[say:咕噜，咕噜咕噜！]|[say: 好吧，不管你要做什么，快点开始吧！]}]她睁开眼睛，期待地看着你的眼睛。随着她的思想开始变得模糊，她的脸从愤怒和恐惧的表情转变为完全的困惑，因为你催眠的目光影响了她的心智。她虚弱地开始说，[if (isSwimming && silly) {[say:咕噜…… 咕噜 咕噜……]|[say: 为什么…… 你在做什么……]}]但她无法完成她的句子，也无法打破你对她的咒语。她的问题悄然消失，她的脸保持着茫然、下巴微张的表情盯着你。她的肌肉放松了，你看到她的四肢慢慢变得瘫软，因为她的身体似乎忘记了它所处的境地。[pg]");
         outputText("你[if (isSwimming) {放开她|把她轻轻放回地面}]，保持着面无表情、坚持不懈的凝视，并慢慢地将手沿着她粗糙的皮肤移向她的乳房，用伸出的手指轻轻描摹着她的一个乳头。除了她空洞的眼睛，她脸上的每一寸肌肤都暴露了她体内不断积聚的欲望，尽管她没有采取任何行动来释放自己。你[if (isSwimming) {俯身|弯下腰}]抓住她的手腕，很高兴看到她的眼睛不由自主地跟着你的眼睛。把她的手放在她比基尼下面她自己迅速变得湿滑的阴部上，你把她的几根手指滑进去，引导她的手做缓慢的摇摆动作。当你开始加快速度时，她的身体似乎注意到了，并开始自己动起来。你移开你的手，她很快就因为毫无顾忌的快感而叹息和呻吟起来。你看着她，她的自慰变得越来越不机械，她的手也变得越来越快。很高兴能成为引起她发声的人，你发现你自己的手[if (hasCock) {滑下你的肉棒[if (isHerm) {，并且|，抚摸着肿胀的肉柱}]}][if (hasVagina) {拨开你[vagina]的阴唇}]。你慢慢地滑上她的身侧，你的" + get_player().allBreastsDescript() + "摩擦着她的身体，被她粗糙的皮肤刺激着。最终你的头在她的头上方并稍微靠后，迫使她向后仰起头以保持你们的相互凝视。一直以来，她都在把手越来越多地插进她松弛的阴道里，并相当大声地呻吟着。这，连同她茫然的凝视，构成了一幅奇怪但令人兴奋的景象。[pg]");
         outputText("你从她身上抬起，把你的腹股沟靠近她的脸。她似乎没有注意到这一点，也没有领会暗示。起初你对她轻率的傲慢感到愤怒，但随后你记起是你导致了这一切。你用一只手指着你的[genitals]，另一只手伸近她的耳朵。当你打响指时，她立刻按照你的意愿行事，把她的脸粗暴地推向你的胯部，并翻着白眼以保持眼神交流。[if (hasCock) {你的[cock]毫无怨言地插进她的嘴里[if (isHerm) {，并且她}]}][if (hasVagina) {[if (!hasCock) {她}]长长的舌头滑进你的[vagina]，它深深推入你深处的感觉让你阴部令人愉悦的灼热感变得几乎无法忍受}]。你伸手到她的脑后，把她的脸狠狠地按向你，捂住她的呻吟，尽管它们很快就被你自己的呻吟所取代。只想着她能多么深入地刺激你，你在自己的恍惚中操着这个没有思想的鲨鱼娘的脸。你感觉自己几乎像是在漂浮，你想永远保持这样，希望你体内的灼热感永远不会停止积聚。唉，你的高潮临近了，她对你的呻吟声越来越大，标志着她的高潮也来了。这个想法太强烈了，它把你推向了边缘；把鲨鱼娘的脸紧紧按在你的下体，你被拉向高潮，大声喊叫着，而她对着你长满鳞片的尾巴发出了最后一声闷哼。[pg]");
         outputText("快感剥夺了你的思考能力；你抬起头，打破了你对鲨鱼娘的咒语。你很快意识到自己的错误，低头看去，发现她因困惑而瘫痪，显然是在高潮期间被扔回了自己的身体。她不敢动弹一下，她的手还在比基尼里，她的嘴还贴在你的[genitals]上。你向她投去友好的目光，她给了你一个更害羞、更困惑的微笑，然后摇了摇头，把手抽了出来。当她笨拙地挣扎着从你的盘绕[if (isSwimming) {中|下}]出来时，你咯咯地笑了起来。她终于出来了，开始踉踉跄跄地[if (isSwimming) {穿过|走向}]水面。你回到营地，对这次相遇感到满意。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm();
         dynStats(DynStat.Sens(-1));
         if(get_player().cor < 33)
         {
            dynStats(DynStat.Cor(1));
         }
      }
      
      public function sharkgirlFacesitting() : void
      {
         outputText("下定决心要强暴鲨鱼娘，你[if (!isnaked) {脱下你的[armor]并}]靠近这个荡妇，紧紧抓住她的银发。当你把她的头拉向你的[genitals]时，不需要磨蹭地指示。鲨鱼娘也不需要鼓励，急切地用她长长的舌头探测你的[if (hasVagina) {[pussy]|长度}]");
         if(get_player().get_gender() == 2)
         {
            outputText("，断断续续地拔出来舔你的[clit]。");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("。你提醒她不要忽视你的[cock]，鲨鱼娘的反应是彻底舔舐你坚硬的勃起[if (hasBalls) {并吸吮你的[balls]}]。");
         }
         outputText("[pg]");
         outputText("你把鲨鱼娘按在[if (isSwimming) {肥沃的湖底|地上}]，更加坚定地把你的胯部贴在她的脸上，命令鲨鱼娘继续。她热情地顺从了，以更大的强度舔舐着，显然很喜欢被支配的感觉。你不得不承认，你很享受作为主人的角色。[pg]");
         outputText("为了奖励你的小荡妇的努力，你的[hand]伸到她的双腿之间，滑入她暴露的黑色丁字裤下，用手指抠弄她湿润的阴户。你很快听到一系列闷闷的呻吟声从[if (singleleg) {你的胯部|你的双腿下方}]传来。但她很聪明，知道不要停止舔舐，你对你在鲨鱼娘身上产生的效果窃笑。一声可爱的小叫声从你小奴隶的嘴里传出，你把手从她的阴户里抽出来，然后舔掉你手指上她甜美的汁液。不久之后，你在高潮中大叫");
         if(get_player().get_gender() == 2)
         {
            outputText("，汁液从你的下体喷射而出，涂满了女孩的脸。");
         }
         else
         {
            outputText("并站起来，握住你的[cocks]，把浓稠的精液喷在她的脸上。");
         }
         outputText("鲨鱼荡妇饥渴地舔舐着你的体液。[pg]");
         outputText("彻底满足后，你把沾满你体液的鲨鱼娘留在地上，动身返回你的营地。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         if(get_player().cor < 33)
         {
            dynStats(DynStat.Cor(1));
         }
      }
      
      public function sharkgirlDickTail() : void
      {
         get_player().addStatusValue(StatusEffects.SharkGirl,1,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("你滑向疯狂自慰的鲨鱼娘。她[if (isSwimming) {双腿朝上漂浮|躺在背上}]，拼命试图缓解自己的欲望。她看了你一秒钟，但她的注意力很快又回到了你自己的性器官上，大声呻吟和叹息。也许这是一个值得欣赏片刻的场景，但你决定她必须为她试图强奸你而受到惩罚。[pg]");
         }
         else
         {
            outputText("你滑向被打败的鲨鱼娘。她[if (isSwimming) {双腿朝上漂浮|躺在背上}]，显然因为战斗而虚弱和痛苦。你可能会同情这个可怜的女孩，但很快想起她刚刚试图强奸你。被[if (cor > 33) {复仇的需要和}]满足你欲望的需要所克服，你决定惩罚她对你痛苦的侵犯。[pg]");
         }
         outputText("你抓住鲨鱼娘的臀部，[if (isSwimming) {借着她的身体调整自己的位置|把她举了起来}]。还没等她伸手稳住自己，你就扭转她[if (isSwimming) {漂浮的身体}]，把她的正面[if (isSwimming) {朝下压去|按在地上}]。她呻吟着，试图[if (isSwimming) {调整姿势|把自己撑起来}]，但她的手臂[if (isSwimming) {只是在空中乱舞|很快就支撑不住她的体重，她又摔回了沙地上}]。你的尾巴灵巧地甩出，[if (isMer) {掀起一股水流冲掉她的比基尼|一把扯下她穿的比基尼}]。她回头看了你一眼，愤愤不平地[say: 哼]了一声，然后[if (isSwimming) {把头靠了回去，}]听天由命地接受你为她安排的任何命运。她的阴部因期待而湿润；然而，你对她另有打算。你用尾巴紧紧缠住她的尾巴，用[hands]抓住她的臀部。当你把她的下半身稍微抬起时，鲨鱼娘惊讶地叫了一声，[if (isSwimming) {移动她的尾巴|[if (isMer) {用你的尾巴支撑她的重量|用你尾巴惊人的力量轻松支撑她的重量}]。她的脚仍然接触着地面，但她的腿并没有支撑她。你把她的尾巴再抬高一点}]，露出她紧致的肛门。她很快明白了你的意图，你看到她的眼睛开始泛起泪光。[if (isSwimming && silly){[say:咕噜，]她乞求道，[say: 咕噜咕噜……]|[say: 不，]她乞求道，[say: 不要那样……]}]她发出了极其微弱的抽泣声，你翻了个白眼[if (cor > 33) {，对这可怜的表演不屑一顾}]。你心软了，决定做出某种妥协。[pg]");
         outputText("当你松开她的尾巴，解开你自己的尾巴，用手臂保持她同样的姿势时，她那轻柔的哭泣声可疑地迅速停止了。你有点恼火，即使你打败了她，你还是让她操纵了你，你决心完全掌控局面。[if (!isSwimming) {伴随着一声闷哼，你|你}]把她稍微举高一点，将你尾巴的尖端对准她光滑的阴部，让[underbody.skinfurscales]在阴唇上下来回滑动，让她的润滑液涂满你的尾巴。她大声表达了她的感激之情，脸上绽放出灿烂的笑容。也许笑得太灿烂了。你继续抚摸，同时把她的屁股直接对准你勃起的阴茎。当你把你的" + get_player().cockDescript(_loc1_) + "塞进她紧致的肛门时，她转过身来看着你，愤怒而惊讶地大叫起来。你不顾她的抗议，把尾巴抽出来，深深地插进她宽阔的阴道里。随着快感开始占据她的身体，她的叫喊声开始变得语无伦次，退化为大声的闷哼和呻吟；当她适应两个洞同时被插入时，她的脸扭曲了。你一次又一次地猛烈撞击她的屁股，挺动你的臀部，以越来越快的节奏把她拉向你，同时用你的尾巴抽插她越来越宽的阴道，每次都插得更深，用[if (isMer) {你柔软弯曲的鳍|细长的尖端}]探测着内壁。她的屁股紧得惊人；显然你正在向她介绍一些新东西。从她脸上的表情来看，她比她想象的要享受得多。[pg]");
         outputText("你保持着动作，随着你的" + get_player().cockDescript(_loc1_) + "和尾巴的每一次抽插，都更深地进入她。你那锥形尾巴不断扩大的周长撑开了她原本就松弛的阴道，直到你确信拔出时它会合不拢。你惊讶于她能吞下你这么深，但最让你惊讶的是，当你的尾巴开始[if (isSwimming) {顶起她的肚子|隔着她的肚子撞击地面}]时。她在你身下的呻吟声越来越大，你发现你的" + get_player().cockDescript(_loc1_) + "中不断积聚的快感正迅速将你推向高潮。你最后一次猛烈地插进她体内，把她的屁股紧紧贴着你，把你的尾巴尽可能深地插进去。当你把滚烫的精液射满她的屁股时，她翻着白眼，张大嘴巴，达到了高潮。她现在用手臂作为杠杆，用力把你推开，然后终于在你身下瘫软下来。当你的阴茎开始变软时，你把它和你的尾巴从她体内拔出，把她像一滩烂泥一样留在[if (!isSwimming) {沙地上}]。就在她昏过去之前，她回头看了你一眼，脸上浮现出一丝狡黠的微笑。你[if (isSwimming) {游走了|滑行离开}]，对着这个荡妇摇了摇头。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         if(get_player().cor < 33)
         {
            dynStats(DynStat.Cor(1));
         }
      }
      
      public function sharkgirlDickFuck() : void
      {
         get_player().addStatusValue(StatusEffects.SharkGirl,1,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         outputText("你下定决心要随心所欲地对付她，你撕下她的比基尼，掏出你的[cock]，然后开始命令她——但你还没说完，鲨鱼娘突然把你的整个阴茎含进嘴里[if (cockLength > 5) {，尽可能深地塞进她的喉咙}]。毫无疑问，这真是一个荡妇。更让你惊讶的是，她那些锋利的尖牙似乎可以缩回，后面隐藏着一套更像人类的牙齿。[pg]");
         if(get_player().get_gender() == 3)
         {
            outputText("在给你口交的时候，她的手稳稳地滑向[if (tailLeg) {你的泄殖腔|你的双腿之间}]。毫无预兆地，她把[if (isvirgin) {一根手指塞进你的裂缝，这意想不到的进入让你吓了一跳|三根手指塞进你的[pussy]，推入并撑开湿润的通道}]。[pg]");
         }
         outputText("你突然把阴茎从她嘴里拔出来，让鲨鱼娘惊讶地喘着粗气。她抬头看着你，眼里盈满泪水，[if (isSwimming && silly) {[say:咕噜咕噜！咕噜噜！]|[say: 求你让我做完！我需要这个！]}]你得意地笑了笑，命令鲨鱼娘[if (isSwimming) {展示自己|趴在地上}]。她的表情亮了起来，顺从地照做，[if (isSwimming) {在水中灵巧地扭动身体，献出她的下体|趴下并向你撅起屁股}]。[if (isTaur) {用你的前腿骑上她|紧紧抓住她结实的臀部}]，你把你的[cock]塞进她湿润的小穴，鲨鱼娘兴奋地尖叫起来。质感令人惊讶；虽然外面看起来很像人类，但里面实际上长满了奇怪的触手状结构，当你的阴茎推进时，它们会蠕动并按摩它。[if (hasBreasts || isfeminine) { 你发现自己在按摩你的" + get_player().biggestBreastSizeDescript() + "并捏着你的[nipples]，试图将你的快感提升到更高的高度。}][pg]");
         outputText("鲨鱼娘在高潮中大叫，当触手包裹住你的阴茎时，她的小穴收紧了。这让你达到了顶点，你把你的精液泵入她饥渴的小穴，被榨干了每一滴。你满意地拔出来，当你转身离开时，你看到鲨鱼娘把精液揉进她的阴户，并向你眨眼。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         if(get_player().cor < 33)
         {
            dynStats(DynStat.Cor(1));
         }
      }
      
      public function sharkWinChoices() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         if(get_monster().get_HP() < 1)
         {
            outputText("鲨鱼娘倒下了，显然是被打败了。");
         }
         else
         {
            outputText("鲨鱼娘开始自慰，放弃了支配你。这景象真是令人着迷。");
            dynStats(DynStat.Lust(15));
         }
         menu();
         addButton(0,"用鸡巴干",sharkgirlDickFuck).sexButton(1);
         addButton(1,"尾巴与鸡巴",sharkgirlDickTail).hint("操她的屁股，用尾巴干她的小穴。").sexButton(1).disableIf(!get_player().isNaga(),"你需要成为娜迦才能这么做。");
         addButton(2,"骑脸",sharkgirlFacesitting).sexButton(2);
         addButton(3,"假阳具强暴",sharkGirlGetsDildoed).hint("这个场景需要你拥有豪华假阳具。").disableIf(!get_player().hasKeyItem("Deluxe Dildo"));
         addButton(4,"催眠",sharkgirlHypnosis).hint("强迫你的猎物为你服务。").sexButton(-1).disableIf(!get_player().isNaga(),"你需要成为娜迦才能这么做。");
         setSexLeaveButton();
      }
      
      public function sharkLossRape() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         if(get_player().get_gender() == 0)
         {
            outputText("你颓然倒下，承认失败，你实在太");
            if(get_player().get_HP() < 1)
            {
               outputText("受伤了");
            }
            else
            {
               outputText("发情了");
            }
            outputText("无法继续战斗。[pg]");
            outputText("鲨鱼女孩几乎是在炫耀她的胜利，她扭动着臀部走到你面前。她迅速[if (isnaked) {开始探索你的身体|脱下你的[armor]}]，但当她注意到你没有任何生殖器时，她的笑容消失了，取而代之的是茫然的表情。[if (isSwimming && silly) {[say:咕噜……]|[say: 搞什么……]}]她嘟囔着，戳了戳你的腹股沟。发现你完全没用后，她沮丧地咆哮着，愤怒地踩在你的脸上。突如其来的疼痛让你晕了过去。");
            get_combat().cleanupAfterCombat();
            dynStats(DynStat.Tou(-2));
            return;
         }
         if(get_player().hasVagina() && (get_player().totalCocks() == 0 || Utils.rand(2) == 0))
         {
            outputText("你颓然倒下，承认失败，你实在太");
            if(get_player().get_HP() < 1)
            {
               outputText("受伤了");
            }
            else
            {
               outputText("发情了");
            }
            outputText("无法继续战斗。[pg]");
            outputText("鲨鱼女孩咯咯笑着走到你面前，[if (isnaked) {高兴地抚摸着你的身体|不耐烦地拉扯着你的[armor]}]。她的尾巴甩来甩去，拍打着你的" + get_player().assDescript() + "。[if (isSwimming && silly) {[say: 咕噜噜噜，咕噜？咕噜噜……]|[say: 你会让我很开心的，听见了吗？否则……]}]她张大嘴巴，你看到她的獠牙在光线下闪烁着威胁的光芒。你艰难地咽了口唾沫，点了点头，换来了鲨鱼女孩的微笑。[pg]");
            outputText("她毫不耽搁，脱下了她暴露的泳装和你的装备。");
            if(get_player().get_gender() == 3)
            {
               outputText("看到你的[cock]，鲨鱼女孩脸上露出了笑容，她紧紧握住你勃起的肉棒。[if (isSwimming && silly) {[say:咕噜，咕噜噜噜，咕？咕噜噜 咕噜噜噜噜。咕噜噜……]|[say: 哎呀，你还真是充满惊喜，不是吗？也许有时间我会试试这个坏男孩。不过现在嘛……]}]");
            }
            outputText("她的目光移向你的" + get_player().vaginaDescript(0) + "，高兴地舔了舔嘴唇。[if (isSwimming && silly) {[say:咕噜！咕噜 咕噜。]|[say: 这才是我想要的！告诉你吧，亲爱的，你把我弄湿了，我也许会给你一些快乐。]}][pg]");
            outputText("她粗暴地抓住你[if (hasHair){的头发|的头}]，把你的脸拉向她流着淫液的小穴，你的舌头本能地探入其中。[if (isSwimming && silly) {[say:咕噜噜噜…… 咕噜 咕噜，咕噜，]|[say: 嗯……你要是识相的话，就别停下舔，你这蠢婊子，]}]她命令道。你加快了舌头的动作作为回应。你有点不好意思承认，但她那充满支配欲的命令让你感到相当燥热。[pg]");
            outputText("鲨鱼女孩终于满意地叹了口气，松开了[if (hasHair) {抓着你头发的}]手，把你的头拉开了几[if (metric) {厘米|英寸}]。[if (isSwimming && silly) {[say:咕噜 咕噜，咕噜。咕噜 咕噜噜。]|[say: 不错嘛，婊子，不错。现在[if (isSwimming) {翻个身|躺平}]。]}]你服从了女主人的命令，[if (isSwimming) {趟水|扑通一声}]仰面躺下。当她[if (isTaur) {用大腿把你的脸按在[if (isSwimming) {湖底|地上}]时，一种喜悦感充满了你。鲨鱼女孩好斗地耸动着，用你的嘴和舌头操着自己，然后用尾巴末端拍打你的[pussy]来激励你。鱼鳍一开始笨拙地刺入你的裂缝，但很快就以一种粗暴却又令人愉悦的方式在你的双唇间滑动。你努力跟上她要求的节奏，但你越努力，她对你就越好，甚至恰到好处地扭动着，在不压碎你的[clit]的情况下刺激它。她的高潮来得很突然，把女孩的淫液溅在你的嘴唇、鼻子和脸颊上，你也骑着她的鲨鱼尾巴，走完了通往自己高潮的最后一段路|把她的胯部放在你的脸前，把她自己的头移到[if (singleleg) {你的[pussy]|你的双腿之间}]。你很快又开始吃她，这次她也加入了这场盛宴。没过多久，你们俩就高潮了，把女孩的淫液喷到了对方的脸上}]。[pg]");
            outputText("鲨鱼女孩[if (isSwimming) {抛了个媚眼，然后游走了|站起身准备离开，在潜回水中之前对你眨了眨眼}]。你最终因为过度劳累而晕了过去。");
            get_player().orgasm("Vaginal");
            if(get_player().cor < 30)
            {
               dynStats(DynStat.Cor(1));
            }
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("你颓然倒下，承认失败，你实在太");
         if(get_player().get_HP() < 1)
         {
            outputText("受伤了");
         }
         else
         {
            outputText("发情了");
         }
         outputText("无法继续战斗。[pg]");
         outputText("你感觉到鲨鱼娘赤裸的脚踩在你的胸口，她粗暴地将你推倒在[if (isSwimming) {肥沃的湖底|你的背上}]。[if (isSwimming && silly) {[say:咕，咕噜咕噜，咕噜……]|[say: 噢天哪，我都不记得上次拥有一个真正的男人是什么时候了……]}]鲨鱼娘说着，[if (isnakedlower) {跨坐在你的腹股沟上|扯下你的[if (haslowergarment) {[lowergarment]|[armor]}]}]。看到你坚挺的勃起，你的对手得意地笑了笑，舔了舔嘴唇，然后将你整根[cock]含入嘴里。那种感觉简直像在天堂，她长长的舌头在你的肉棒上滑行。[pg]");
         outputText("但在你还没来得及真正享受之前，她就把头抽开了，清晰可见的唾液丝仍然连接着她的嘴和你的[cock]。鲨鱼娘迅速调整姿势，跨坐在你的肉棒上，然后重重地坐了下去，你们俩都因为这种感觉而猛地喘了口气。[if (isSwimming && silly) {[say:唔，咕噜咕噜……咕噜咕噜。咕噜？]|[say: 嗯，好孩子……你让我先高潮，我就不咬你。成交？]}]你点了点头，不过考虑到她小穴里奇特的触须正在按摩你的肉棒，你不知道自己还能坚持多久。[pg]");
         outputText("鲨鱼娘可没有这样的顾虑，她像骑机械牛一样骑着你，以令人难以置信的速度在你的[cock]上起伏锤击。这感觉确实很爽，但这种粗暴的骑乘方式也确实很痛。在这之后，你肯定会[walking]得很滑稽，这是毫无疑问的。[pg]");
         outputText("最终，她的阴道紧紧夹住你的肉棒，在性高潮中大叫起来。你大声闷哼，几秒钟后也射了，将你的种子泵入她的子宫。鲨鱼娘俯下身，在你的嘴唇上轻轻印下一个吻。[if (isSwimming && silly) {[say:咕噜咕噜。呜咕噜噜咕噜。]|[say: 好孩子。我一定会再来找你的。]}]她再次站起身，你看着她重新进入水中，然后你便晕了过去。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(1));
         if(get_player().cor < 30)
         {
            dynStats(DynStat.Cor(1));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function sharkGirlGetsDildoed() : void
      {
         clearOutput();
         outputText("你咧嘴大笑，露出足以让即使是被打败的鲨鱼娘也感到不寒而栗的牙齿。向着俯卧的怪物女人逼近，你");
         if(!get_player().get_weapon().isAttached())
         {
            outputText("收起你的[weapon]并");
         }
         outputText("从你的小袋里掏出一根闪闪发光的粉色假阳具，就好像它是一把武器。她抬头看着你，立刻明白了你的意图。");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("她的双腿诱人地大张着，在情欲的狂热中撕下了自己的比基尼泳裤。你将假阳具举到她上方，轻轻捏了一下，挤出几滴粉红色的液体[if (isSwimming) {，它们消散在水中。你轻轻搅动玩具，引导这股被污染的液体像水流一样拂过她暴露的小穴|从这个特殊的假阳具中滴落。它们落在她暴露的小穴上}]，几秒钟内她就在你身下扭动起来，对着[if (isSwimming) {水流|空气}]挺动下体。");
         }
         else
         {
            outputText("她反抗地夹紧双腿，但你强行将它们掰开，撕下她的比基尼泳裤，露出她光洁的阴唇。你将假阳具举到她上方并用力捏紧，将一股粉红色的液体喷射到她暴露的小穴上。效果立竿见影，没过一会儿她就开始对着[if (isSwimming) {水流|空气}]挺动下体，并流出了她自己的淫液。");
         }
         outputText("[pg]");
         outputText("真是一个奇妙的玩具，你一边想着，一边跪在你[if (cor > 50) {最新的受害者|曾经的敌人}]的双腿间，吸嗅着她的气味。[if (isSwimming) {你的鳃几乎能尝到那咸咸的味道|闻起来出奇的咸}]，让你想起了大海。砂纸般的皮肤擦过你的脚踝。你甚至不需要低头就能认出那是她的尾巴卷住了你的[if (singleleg) {[leg]|腿和大腿}]的感觉。在她利用尾巴占据优势之前，你用一只[hand]轻轻拨开她的外阴唇，用另一只手插入了那根人造阳具。鲨鱼女孩的尾巴立刻垂了下来，她的身体颤抖着放松下来，只能勉强抽搐几下。[pg]");
         outputText("她下体散发出的海腥味变得更加浓烈，你感觉到手中的假阳具膨胀了起来。她已经高潮了！[pg]");
         outputText("你用力拍打她的左臀，她粗糙的皮肤在肌肤相亲时发出了完美的[i:啪]声，你责骂她这么快就高潮了。[pg]");
         outputText("这个水生魔物娘呜咽着，感觉到自己被不断变大的玩具撑得越来越宽。为了惩罚她试图强暴你[i:以及]这么快就高潮，你双手紧紧握住假阳具，将其连根没入。她的尾巴扑腾着、拍打着[if (isSwimming) {，推着你们俩在水里转来转去}]，直到假阳具完全插到底。她像一条濒死的鱼一样扑腾着，尽管她身上唯一“濒死”的可能就是因为小穴感受到的极乐而死掉的几个脑细胞。对插入的深度感到满意后，你抓住它的底部往回拉，费力地拔出紧紧卡在她小穴里的玩具。[pg]");
         outputText("你来回扭动着它，把它拔出一部分，然后再猛地插回去。鲨鱼娘在你身下呻吟着、摇晃着，双眼变成了斗鸡眼，试图迎合你双手的抽插。她的双手伸进黑色薄上衣里，握住自己那对小巧的乳房，揉捏抚摸着。当她的手指碰到乳头时，她喘息着，口水顺着下巴流了下来。[pg]");
         outputText("她那充满海盐味的小穴紧紧地夹着，但从她洞里流出的湿滑汁液让你越来越容易地将膨胀的性玩具在她的爱洞里抽插。你厌倦了这个荡妇的呻吟和欢愉的喘息，决定了结她。你拔出假阳具，惊讶地倒吸了一口凉气，因为她抽搐的小穴淫靡地大张着，让你能看到她爱道的整个深度，一直到她的子宫颈。她因为突然失去快感而呻吟，但在她有机会把手指塞进她那饥渴的洞里之前，你[i:用力]挤压那个变态的玩具，将一股浓稠的粉红色液体直接射入她的子宫。[pg]");
         outputText("你把那根还在颤动的假阳具重新插回她被撑开的小穴里，像活塞一样把液体直接打进她的子宫，引发了一声足以让你起鸡皮疙瘩的狂乱尖叫。她疯狂地颤抖着，你不得不[if (isSwimming) {用你的[legs]夹住她的尾巴|坐在她的尾巴上}]，以免她的尾巴尖抽到你的脑袋。你[hands]里的假阳具越胀越大，直到它自己弹了出来，露出了鲨鱼女小穴里粉红色的内壁。你可以看到肌肉在起伏收缩，不过由于她被撑得太开，你觉得她现在连牛头人的尺寸都夹不住了。几秒钟后，除了偶尔的抽搐，她的身体安静了下来，你意识到她已经晕过去了。[pg]");
         outputText("该死，真他妈性感。你回营地后肯定得好好发泄一下。也许你该试试这根假阳具？它上面还残留着你猎物的味道。");
         dynStats(DynStat.Lust(20 + get_player().lib / 5 + get_player().cor / 10));
         get_combat().cleanupAfterCombat();
      }
      
      public function sharkGirlEncounter(param1:Number = 0) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,230,1);
         }
         if(!get_player().hasStatusEffect(StatusEffects.SharkGirl))
         {
            get_player().createStatusEffect(StatusEffects.SharkGirl,0,0,0,0);
         }
         else if(get_player().statusEffectv1(StatusEffects.SharkGirl) >= 7 && get_player().totalCocks() > 0)
         {
            spriteSelect(SpriteDb.get_s_sharkgirl());
            sharkBadEnd();
            return;
         }
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         if(param1 == 1)
         {
            outputText("当[if (isSwimming) {在湖里游泳|划船穿过湖面}]时，你发现一个鲨鱼鳍正朝你游来。[if (isSwimming) {你做好准备，下沉并寻找岩石或深湖树根|担心它可能会损坏小船，你[if (isMer) {将你海蛇般的身体滑入水中，用你卓越的游泳能力推着船，无视湖水的污垢|急忙划回岸边，跳出船。}]}]鲨鱼没有减速的迹象，而且[if (isSwimming) {很快你就能看到她清晰的身影向你冲来。在最后一刻，你用力推开地形，将自己推开，看着她片刻后撞在上面|鳍在即将[if (isMer) {到达浅滩|上岸}]之前消失了}]。");
            if(get_player().location == "swim")
            {
               outputText("身材健美、充满女人味的鲨鱼娘转过身来面对你，一边摇晃着尾巴，一边发出呼噜声。你准备好你的[weapon]，看到她也做出了回应，露出了她那排刀子般的牙齿！[if (!ismer) { 你在水里处于严重的劣势，但如果她有任何兴趣把你留在她的魔爪中，你根本不可能跑得过她。}]");
            }
         }
         else
         {
            outputText("你在湖边沙滩上漫步，突然对一个奇怪的景象挑起了眉毛：一个孤零零的鳍，在水里盘旋。当那个鳍突然以非人的速度向岸边冲来时，你惊讶地后退了一步。");
         }
         outputText("一个灰色的模糊身影从水中冲出，落在离你[if (metric) {一米|几英尺}]远的地上。[pg]");
         outputText("那是一个女人——一个奇特地被腐化的女人，有着闪亮的灰色皮肤、银色的头发，肩胛骨之间长着一个鳍。她穿着相当暴露的黑色泳装。女孩抬头看着你，咧嘴大笑，露出一排排刀子般的牙齿。[say: 想玩吗？不过提醒你一下，我玩得很“粗暴”！]");
         unlockCodexEntry(2054);
         startCombat(new classes.scenes.places.boat.SharkGirl());
         spriteSelect(SpriteDb.get_s_sharkgirl());
      }
      
      public function sharkBadEnd2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         outputText("几个月和几次突变之后……[pg]");
         outputText("你将肉棒插入又一个鲨鱼娘体内，这是过去一小时里的第三个了，同时还用手指抠弄着另外两个。你已经连续几周没日没夜地操逼了。自从你变异成鲨鱼人后，做爱几乎成了你脑子里唯一能想到的事。有那么一瞬间，你想起自己曾经有个名字，也隐约记得自己还有什么重要的事情要做……不过，肯定没有这个重要。没有让你的后宫怀孕重要。[pg]");
         outputText("[say: 哎呀，他……还真是个精力旺盛的家伙，不是吗？]一只虎鲨娘问道，在附近的一块岩石上坐了下来。另一个鲨鱼娘轻笑着回应，[say: 噢，我知道。因为他，我们的人数几乎翻了一倍。]她指了指几个在沙滩上慵懒地躺着、肚子高高隆起的鲨鱼娘，她们正开心地抚摸着自己的孕肚。[pg]");
         outputText("[say: 哇。当我听到传闻说你们族群来了个新雄性时，我必须得亲自来看看。但我没想到他会是这个样子……]虎鲨娘说着，揉弄着自己的私处。你在鲨鱼娘体内射精，然后停顿了一下喘口气，你那四个哈密瓜大小的睾丸翻滚着，酝酿着更多的精液。你抬起头，准备开始操下一个女孩，却瞥见一个人类正沿着海岸线走过。看到这一幕，你的脸上浮现出一丝狞笑，你引导女孩们的注意力转向那个落单的人类。[pg]");
         outputText("[say: 新鲜的肉！]");
         get_game().gameOver();
      }
      
      public function sharkBadEnd() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_sharkgirl());
         outputText("几个星期过去了，你再次来到了湖边，你的下半身渴望着能再有一只鲨鱼女游过来。只要一想到她们那不可思议的性器官，以及从她们身上获得的征服感，你就会感到兴奋。但遗憾的是，连个影子都没有，所以你决定先睡个午觉。[pg]");
         outputText("没过多久，你被嘴里某种温暖蠕动的东西弄醒了。你猛地睁开眼睛，担心自己是不是吞了虫子之类的东西。然而，当你的视线重新聚焦时，你清楚地意识到，那其实是某人的舌头在你的嘴里探索。从她那适中的三围和矮小的身材来看，这似乎是一个十几岁的年轻鲨鱼女。她把头缩回去，冲你咧嘴一笑，然后大喊道：[say: 嗨，爸爸！]你挑了挑眉毛。然后你转过头，看到还有好几个十几岁的鲨鱼女，她们每个人都死死地按住了你的手脚。[pg]");
         outputText("考虑到她们的身材，她们的力量惊人地大，即使是牛头人也很难把她们全部推开。再加上一股强烈的性欲涌遍全身，你发现自己很难集中注意力。她们肯定是在你睡觉的时候给你灌了几瓶催情剂。[pg]");
         outputText("[say: 发-发生什么事了？]你问道，声音在情欲和恐惧之间徘徊。跨坐在你胸口的小女孩咯咯笑着，用手指在你的皮肤上画着圈，[say: 哎呀爸爸，别害怕。你要和你的孩子们一起玩了！听起来是不是很有趣？]另一个补充道，[say: 既然你似乎很喜欢让我们鲨鱼娘怀孕，我们觉得你大概会想以此为生……]你微微睁大眼睛，问她，[say: 你这话是什么意思？][pg]");
         outputText("女孩们相视一笑，然后跨坐在你身上的那个女孩拔出了一颗形状奇特的鲨鱼牙齿。[say: 噢，你会明白的。张大嘴……！]");
         doNext(sharkBadEnd2);
      }
   }
}

