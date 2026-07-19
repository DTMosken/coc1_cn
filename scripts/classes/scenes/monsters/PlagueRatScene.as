package classes.scenes.monsters
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Vagina;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters._PlagueRatScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class PlagueRatScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function PlagueRatScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "plagueRat";
         saveContent = new SaveContent(null,null);
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
         saveContent.metRat = false;
         saveContent.ratsKilled = 0;
      }
      
      public function plagueWashThrow() : void
      {
         clearOutput();
         outputText("在你费了这么大劲帮他洗澡之后，他居然在水里呕吐，这实在是太粗鲁了。你觉得他只能自己洗了，于是你从他身上下来，顺便把他拉了起来。");
         outputText("[pg][say:对！对！我自己洗！]他用气喘吁吁、沙哑的声音大喊道。那就祝他好运吧，反正你也不会在旁边看着了。你用尽全力，把老鼠扔进了开阔的水域。在精疲力竭的状态下，他似乎费了很大的劲才挣扎着游回岸边。希望他以后能学会保持卫生。");
         get_combat().cleanupAfterCombat();
      }
      
      public function plagueWashKill() : void
      {
         clearOutput();
         outputText("他竟敢如此放肆，毁了你费了这么大劲帮他洗的澡！你绝不接受这种程度的不敬。你甚至不等他停止咳嗽，就把这只瘟疫鼠的头按进了水里。他挣扎着，但比之前弱了许多。没过多久，他就不动了。");
         outputText("[pg]你把老鼠留在原地，他的脸依然浸在水里。");
         _temp_1.ratsKilled += 1;
         get_combat().cleanupAfterCombat();
      }
      
      public function plagueWash() : void
      {
         clearOutput();
         outputText("这种满是泥土、污垢、虫子和各种污秽的东西必须被清洗干净。你抓住这只瘟疫鼠的衬衫，注意到上面的汗水和磨损让它并不比他的身体干净多少，然后把他拖到了湖边。战斗让他一时没有察觉到周围的环境，但现在他开始恐慌了。");
         outputText("[pg][say: 你、你要带我去哪！？]他尖叫道。不管你是否向他解释，他都不太可能有能力阻止你。尽管如此，这只油腻的老鼠还是在沮丧中挣扎和呻吟。[say: 你不能带走我！]");
         outputText("[pg]你站稳脚跟，把老鼠扔过了剩下的[if (str < 25) {一点 }]距离，加快了行程。他尖叫着半个身子落入水中，脸被淹没了。你[walk]过去，坐在他的背上，用手按住他的头。过了一会儿，你才让他把脸抬起来。");
         outputText("[pg]他喘着粗气，尖叫着：[say:不——！]然后你再次把他的头按了下去。他只是需要洗个澡，如果他能保持冷静，就不会觉得这么可怕了。你一边向他解释情况，一边把他的头拉起来。[say:好！好！我洗！]你再次把他的脸按进水里，这次粗暴地擦洗着他的头。虽然你注意到了他的配合，但他看起来还是需要一些“亲手”的帮助。");
         outputText("[pg]当你终于把他的头拉起来时，他干呕着吐出了大量的水。这可不行，你不能在满是呕吐物的水里给他洗澡。");
         menu();
         addNextButton("杀死",plagueWashKill).hint("他竟敢弄脏自己的洗澡水。");
         addNextButton("扔掉",plagueWashThrow).hint("把他扔进海里。");
      }
      
      public function plagueVictory() : void
      {
         var _loc1_:Boolean = false;
         clearOutput();
         outputText("你还没来得及自己倒下，那只恶魔啮齿动物就扑了上来，将你仰面按倒在地。");
         outputText("[pg][say:真美味，]他咯咯笑着，用颤抖的舌头舔着你。他的舔舐变成了啃咬，将黏糊糊的门牙压在你的脸上。你已经感觉好像要起水泡了，尽管这肯定不会发生得这么快。[say:你，好好伺候我！]他命令道。");
         outputText("[pg]老鼠窜了上来，跨坐在你的[chest]上，露出了他那粉红色、头重脚轻的肉棒。他阴茎的头部覆盖着一圈肉质的凸起，比阴茎干要粗得多。[say:伺候我！]他大喊着，咳出唾液。当然，你别无选择，因为他粗暴地抓住你的脸，强行掰开你的下巴。");
         outputText("[pg]那根肉棒紧接着滑了进去，让你的味蕾浸透了麝香、汗水和腐烂的味道。这只可怕的啮齿动物在极乐中呻吟着，急切地开始操你的脸。你的喉咙在球状的龟头周围痛苦地扩张，感觉到结节滑过喉壁时产生的发痒感。尽管呕吐的冲动像巨浪一样向你袭来，但这个过程仍在毫无阻碍地继续。");
         outputText("[pg]当老鼠发出震耳欲聋的满足尖叫时，一股股滚烫的精液顺着你的食道流下。[say:你伺候得很好，现在轮到我伺候你了！]他宣布道。尽管你的胃感觉像着火了一样，但你还是庆幸口交的折磨结束了。然而，这种解脱被证明是错付了。恶魔把长满疣的肉棒留在你的嘴里，用爪子抓住你的[hips]。片刻之间，你们就互相胯部对着脸了。");
         outputText("[pg]瘟疫鼠[if (!isnakedlower) {粗暴而令人沮丧地扯下你的下装，并}]热情地舔舐你的[genitals]。他唾液的黏稠感让你扭动起来，几乎忘记了那根仍然依偎在你喉咙里的恶心肉棒。另一方面，他并没有忘记。当他的舌头肆意地滑过一切时，他的臀部又开始抽插。拍打你鼻子的阴囊散发出的气味淹没了你的鼻孔，让你看到了一丝希望，也许你真的会晕过去。");
         if(get_player().isGenderless())
         {
            outputText("老鼠的门牙带着可怕的灼痛刺穿了你的屁股，尽管那怪异的肉棒堵住了你的嘴，你还是忍不住叫出声来。");
            if(get_player().buttVirgin() && get_silly())
            {
               outputText("[b:你的肛门被撕裂了，夺走了你的童贞。]");
            }
            get_player().buttChange(3,get_player().buttVirgin() && get_silly(),false,true);
            outputText("他将恶魔般的舌头滑入你的体内，并肆无忌惮地撕咬，这种混合的刺激带来的痛苦和肾上腺素飙升，远比单纯被他那散发着奶酪味汗水的肉棒噎住要强烈得多。然而更令人不安的是，你意识到他那滑腻的触手刺入你的肠道时感觉[i:很舒服]。尽管这很恶心，但你可能会对疼痛变得麻木，并忘记嘴里的味道。然而，你的希望似乎落空了。");
         }
         else if(get_player().hasCock())
         {
            outputText("[pg]参差不齐的牙齿开始刮擦你的肉棒，威胁着你紧张的勃起。随着这可怕的口交继续进行，这只啮齿动物的牙齿咬得更紧了，微微撕裂了你的皮肤。你的心因恐惧而狂跳，但尽管你感到恐惧，这只会让你的[cock]更加坚挺。当他那充满疾病的牙龈中的脓液渗入抓痕时，痛苦的灼热感充满了你的全身。[if (watersports) {你颤抖的腹股沟失去了肌肉控制，尿液淹没了恶魔的嘴。|你的骨盆肌肉突然而猛烈地收缩，在痛苦中不由自主地射精了。}] 反过来，恶魔很享受你体液的味道。");
         }
         else
         {
            outputText("[pg]一种可怕的撕裂感让你的肾上腺素飙升。他那又长又厚的门牙强行深深地刺入你的体内。");
            _loc1_ = get_player().vaginas[0].virgin;
            get_player().cuntChange(3,true,true,true);
            if(_loc1_)
            {
               outputText("你的小穴有生以来第一次被插入，竟然是被一只腐化老鼠那带病的门牙。");
            }
            outputText("当脓液从他的牙龈渗入你的体内时，一阵灼烧感引发了你骨盆肌肉的痉挛。[if (watersports) {你颤抖的下体失去了肌肉控制，尿液涌入了恶魔的嘴里。}]他津津有味地品尝着你的体液，把脸在你的下体上摩擦，舒服得几乎发出了呼噜声。");
         }
         outputText("[pg]令你绝望的是，你看到他的睾丸不断紧绷，精液再次射入你的喉咙。与第一次不同，这次的高潮对他来说要强烈得多，你的肚子根本无法承受这如洪流般腐臭的老鼠精液。你不知道自己有没有吐出来，因为你谢天谢地地晕了过去。");
         if(get_player().hasCock())
         {
            get_player().orgasm("Dick");
         }
         get_player().slimeFeed();
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function plaguePenetrate(param1:Boolean = true) : void
      {
         clearOutput();
         outputText("盯着倒下的瘟疫鼠，你感到怒火在心中翻腾。这个腐臭的混蛋竟敢攻击你，光是他的存在本身就是一种严重的冒犯。你需要找个东西来发泄怒火，而且你已经想好该怎么做了。");
         outputText("[pg]这只老鼠仍在地上扭动，他太" + (param1 ? "虚弱" : "发情") + "了，无法进行真正的抵抗，但当你[walk]上前把手放在他身上时，他确实试图挣扎着逃跑。手指触碰到他那肮脏皮肤的感觉几乎让你想要放弃，但那打结的毛发提供了足够好的抓手，让你能把他举起来并翻转过来，让他趴在地上。这个恶魔似乎后知后觉地意识到了你的意图，这让他重新开始努力逃跑，但这都是徒劳的。");
         outputText("[pg][say:不！不应该是这样的！你这肮脏的——]");
         outputText("[pg]他管谁叫肮脏呢？你迅速[if (singleleg) {猛击|踢了}]他的肚子，让他暂时闭嘴。当你撕掉他营养不良的身体上仅存的几块破布，露出他那肮脏的后庭时，这只晕头转向的恶魔发出了痛苦的呻吟。当你看到它的那一刻，一股难闻的恶臭扑鼻而来，你差点流下眼泪，但你已经下定决心要这么做，所以你[if (isnaked) {挺起你的[cock]|掏出你的[cock]并摆好姿势}]。");
         outputText("[pg]你将龟头抵在他紧致的肛门上。出乎意料的是，要撬开他非常困难，也许是因为他极差的卫生习惯，但你暂时把这个想法抛在脑后。你不得不拉扯他骨瘦如柴的臀部来将他撑开，伴随着一声响亮的吧唧声，你终于刺穿了他的深处。当你缓慢而不可阻挡地挤进他的体内时，这只老鼠尖叫着抓挠着地面，显然不习惯被操的感觉。然而，你惊讶地发现，在穿过他的入口后，你的动作相当顺畅，因为老鼠的肠道足够湿滑，你可以轻松地进出。");
         outputText("[pg]不去管这到底是因为什么，你开始前后摇摆你的[hips]。老鼠痛苦地呻吟着，你能感觉到他破损的屁眼在你周围抽搐，但他仍然太虚弱了，无法反抗。受到这种毫无抵抗的鼓励，你开始认真地抽插，让你的欲望占据主导地位。尽管这只啮齿动物的本性令人作呕，但他的肉壁和其他人一样好用，没过多久你就真正开始享受了。");
         outputText("[pg]你不太确定，但老鼠的呻吟似乎变得不那么痛苦，而是更加愉悦了，但你并不担心这个。当你继续猛烈撞击他骨瘦如柴的屁股时，你只专注于从这个可怜的生物身上榨取尽可能多的快感。袭击你的无数感觉混合在一起，混合成一种混合物，尽管它的成分令人不快，但却出奇地令人兴奋。通常会让你感到恶心的气味、景象和质地现在只会驱使你前进，在你操弄这只扭动的老鼠时满足你变态的欲望。");
         outputText("[pg]你能感觉到自己快要释放了，于是你将自己齐根没入这只扭动的啮齿动物体内，尽情释放。当你猛烈抽插时，他和你一起尖叫，你将精液灌满他那被侵犯的括约肌，直到你被彻底榨干。");
         outputText("[pg]当你终于瘫倒向后时，你的[cock]从那只被蹂躏的老鼠体内滑落出来，上面覆盖着一层你根本不想去辨认的、由各种体液混合而成的恶臭液体。他身下那一小滩灰白色的液体清楚地表明，这对他来说也并非完全不享受，但这只老鼠本身似乎已经彻底不省人事了。");
         outputText("[pg]你迅速动身回家，希望在洗个澡后能再次感觉到干净。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function plagueMount() : void
      {
         var _loc1_:Boolean = false;
         clearOutput();
         outputText("撇开污垢不谈，你的需求仍未得到满足；如果不爽够了，你是不会离开的。为了让他停止喉咙里的各种咳嗽和干呕，你挥动[leg]踢向这只老鼠，让他岔气并陷入眩晕。趁他失去反抗能力，你迅速扒掉他破烂的衣服[if (!isnaked) {，也毫不客气地解开了你自己的[armor]}]。");
         outputText("[pg]这只啮齿动物的肉棒弹了出来，在空气中抽搐着。它有些细长，龟头很大呈球状，按这个世界的标准来看，长度有点不够看。那股发霉的气味浓烈到隔着一段距离都能尝到，但也许并没有你想象的那么刺鼻。准备好好利用它一番，你长长地舔了一口，发现自己的感官被变质奶酪和铜锈的味道所冲击。这让人有点头晕目眩，但你那少量的唾液已经与它天然的分泌物混合，产生了一点黏滑的残留物。尽管理智告诉你不要这么做，你还是用[tongue]在他的老鼠肉棒上又滑动了几下，确保整个东西都得到了充分的润滑。");
         outputText("[pg][say:你对、对我真好……]恶魔嘟囔着。他的颤抖和不断流出的先列腺液表明，现在是继续前进并骑上去的好时机。看到你爬上前去跨坐在他身上，这只老鼠兴奋地喘着粗气。[say:对！对我好点！]");
         outputText("[pg]你俯下身，双手环住他的脖子，让这只生物安静下来。这是你的享受，不是他的。他那光滑的龟头抵在你的[assholeorpussy]上。你的入口抗拒着进入，但唾液和包皮垢形成了一种非常合适的润滑剂，让这肮脏的工具滑了进去。");
         if(get_player().hasVagina())
         {
            _loc1_ = get_player().vaginas[0].virgin;
            get_player().cuntChange(8,true,true,true);
         }
         else
         {
            _loc1_ = get_player().ass.virgin;
            get_player().buttChange(8,true,true,true);
         }
         if(_loc1_)
         {
            outputText("这很刺痛，一方面是因为你的身体对它认为是感染的东西产生了反应，另一方面是因为你把纯洁献给了这么一个怪诞而不修边幅的东西。");
         }
         outputText("沉下去，[if (hascock) {你的[cock]不由自主地抽搐和跳动，并且}]他的阴茎完全进入了你的体内，直到你平坐在他的臀部上。");
         outputText("[pg]老鼠呻吟着，颤抖着。你感觉到他随着每一次颤抖在你体内跳动，这非常刺激。随着每一次起伏，你的[assholeorpussy]越来越迷恋这种体验。这根邪恶的肉棒喷出几股精液，他早泄的本性让你感到失望。然而，这只喵喵叫的瘟疫鼠并没有失去硬度，你继续毫无问题地上下摇晃你的[hips]。额外的温暖和粘稠感极大地增强了快感。");
         outputText("[pg]你的内脏微微蠕动，伴随着一阵轻微的高潮席卷全身。这只令人作呕的野兽竟然让你高潮了。你拥抱你那堕落的伴侣，双手滑过他粗糙的皮肤和一簇簇油腻的毛发，开始更快地摆动臀部。又一阵小高潮袭来，你感觉几乎要神志不清了。老鼠也再次射精，而且比之前猛烈得多。他那极乐的尖叫让你头疼，但这并不能让你慢下来。你呻吟着，强迫自己以更大的热情猛烈地挺动骨盆。从他肉棒里溢出的所有黏液开始从你的穴里流出。最后，你倒下了。");
         outputText("[pg]你费了很大的劲才重新平复下来。当你回过神来时，你看到那只老鼠已经因为这场狂欢完全昏死过去了。你希望自己没有从他那里染上什么病，但你也不想为此发愁。");
         get_player().orgasm("VaginalAnal");
         get_player().slimeFeed();
         dynStats(DynStat.Cor(1));
         if(get_player().hasVagina())
         {
            get_player().knockUp(1,432);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function plagueKill() : void
      {
         clearOutput();
         if(get_player().get_weapon().isHolySword())
         {
            outputText("你毫不迟疑地将闪烁的刀刃刺入这只啮齿动物的胸膛。他立刻尖叫起来，伤口处冒出阵阵青烟。片刻之后，他便断了气。");
         }
         else if(get_player().get_weapon().isScythe())
         {
            outputText("即便是瘟疫本身也无法逃脱死亡。你握紧邪恶的镰刀，挥舞着斩过恶魔的脖颈，将这只流着口水的野兽的头颅砍飞。");
         }
         else if(get_player().get_weapon().isSpear())
         {
            outputText("[if (silly) {虽然你可能会说你就算拿着九尺半长的杆子也不想碰这怪物，但为了杀它你可以破个例|多亏了这把[weapon]提供的距离，你终结了这个恶魔}]。一记势大力沉的突刺，老鼠的心脏在你的矛刃上被撕裂。");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("这只老鼠是下一个待宰的羔羊。你挥舞着[weapon]向下劈砍，轻松地劈开了恶魔啮齿动物的骨头。");
         }
         else if(get_player().get_weapon().isBladed())
         {
            outputText("你深吸一口气，猛地向前冲去，刺穿了老鼠那腐败、堕落的心脏。");
         }
         else if(get_player().get_weapon().isWhip())
         {
            outputText("你将[weapon]缠绕在老鼠的脖子上，用力拉扯将它拽近。当它向前踉跄时，你用[foot]重重地踩在它身上，并更用力地拉扯鞭子。这野兽被勒住脖子，挣扎着，但很快就一动不动了。");
         }
         else if(get_player().get_weapon().isStaff() && get_player().get_weapon().isChanneling())
         {
            outputText("准备好终结这个害虫后，你给[weapon]充能，然后挥向它的侧脑。在它虚弱的状态下，这把充能的法杖足以杀死它。");
         }
         else if(get_player().get_weapon().isFirearm())
         {
            outputText("你用[weapon]猛击老鼠的额头，紧接着零距离开火。瞬间，它那仅存的一点脑浆喷洒了一地。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你挥舞[weapon]砸向那只恶魔鼠的脸，将他打得仰面朝天。他躺在那里，捂着断掉的鼻子，尖叫着咒骂。你又是一记更沉重的挥击，将这只老鼠的头骨砸成了碎片和肉泥。");
         }
         else
         {
            outputText("你受够了他，用尽全力一拳正中这只老鼠的喉咙。他倒在地上剧烈咳嗽，你紧接着一击打在他的后颈上，结束了战斗。");
         }
         _temp_1.ratsKilled += 1;
         get_player().upgradeDeusVult();
         get_combat().cleanupAfterCombat();
      }
      
      public function plagueEncounter() : void
      {
         clearOutput();
         if(saveContent.metRat)
         {
            outputText("熟悉的疾病恶臭让你的[eyes]开始抽搐，促使你转过身来准备战斗。");
            outputText("[pg]一只瘟疫鼠正准备扑过来，现在却因为你的警觉而显得有些恼怒。这恶魔尖叫着，准备发动攻击。");
         }
         else
         {
            outputText("你停下脚步，[ears]竖起，突然察觉到了[i:某种东西]。命运眷顾着你，就在你提高警惕的几秒钟后，有什么东西从背后扑向你，险些击中。");
            outputText("[pg]袭击者从你身边踉跄退开，转过身来，脸上挂着愤怒的表情。站在你面前的是一只驼背的、长着酒红色头发的鼠魔。他[if (nofur) {身上散布的几块}]皮毛看起来凌乱又油腻，身上还散发着挥之不去的疾病气息。[say:你看起来很好吃！]他尖叫着，在你们之间的空气中挥舞着沾满污渍的爪子。不清楚他这话到底是什么意思，但不管怎样，你都觉得这绝非好事。");
            outputText("[pg]这只邪恶的生物再次跃起，不过动作意图太明显，很容易就能躲开。当他的脚爪落地时，他开始转身，对你使出一记回旋踢。");
            get_player().takeDamage(10 + Utils.rand(10),true);
            outputText("[pg]野兽咯咯笑着，咬牙切齿，牙龈里溅出点点脓液。[say:好吃……]");
            saveContent.metRat = true;
         }
         unlockCodexEntry(2740);
         startCombat(new PlagueRat());
      }
      
      public function plagueDefeat(param1:Boolean) : void
      {
         var _g1:Combat;
         var hpVictory1:Boolean;
         var _g:PlagueRatScene;
         clearOutput();
         if(param1)
         {
            outputText("瘟疫鼠踉跄着后退并倒下，陷入了一阵剧烈的咳嗽和干呕之中。");
         }
         else
         {
            outputText("完全被原始的欲望所吞噬，这只老鼠开始剧烈喘息，隔着裤子抚摸起自己来。");
         }
         menu();
         _g = this;
         hpVictory1 = param1;
         addNextButton("插入",function():void
         {
            _g.plaguePenetrate(hpVictory1);
         }).hint("好好地干他一顿。").sexButton(1);
         addNextButton("骑乘",plagueMount).hint("骑在这只啮齿动物身上。").disableIf(get_player().get_lust() < 33,"你还不够兴奋，无法做爱。");
         addNextButton("杀死",plagueKill);
         if(get_player().location == "湖泊")
         {
            addNextButton("清洗",plagueWash).hint("必须进行强制清洗。");
         }
         if(get_silly() && get_player().hasItem(get_useables().TELBEAR))
         {
            addNextButton("赠送熊",plagueBear).hint("送他一只熊，向他表达同情。");
         }
         if(get_player().hasItem(get_consumables().LIDDELL))
         {
            addNextButton("利德尔药水",forceLiddellium).hint("也许炼金术能把这个恶心的生物变得可爱一点？");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]给你梳理尾巴。").sexButton(-1);
         }
         _g1 = get_combat();
         setExitButton("离开",function():void
         {
            _g1.cleanupAfterCombat();
         });
      }
      
      public function plagueBear() : void
      {
         clearOutput();
         outputText("这只可怜的老鼠现在不过是一团呻吟的污垢。也许他真正需要的是一个拥抱——当然不是直接抱，你才不想碰那玩意儿。");
         outputText("[pg]你在随身物品里翻找了一下，迅速拿出了你一直带着的毛绒熊。你拍了拍瘟疫鼠的肩膀，引起了他的注意。他抬头看了看你和熊，似乎对你的意图感到困惑。你把毛绒玩具推到他胸前，并表达了你对此事的看法。");
         outputText("[pg][say:诶——诶？]他说道，显得更加困惑了。这可怜的家伙病得太重了，似乎连拥抱是什么都不记得了。不幸的是，他已经碰过那只熊了，所以你并不想把它拿回来示范。[say:不，我知道他妈的拥抱是什么，]他向你保证道。");
         outputText("[pg]你松了一口气，因为你不需要真的去拥抱他，你拍了拍这只被腐化的啮齿动物，挥手让他离开。他忐忑不安地照做了，跌跌撞撞地站起来时，把熊紧紧地抱在胸前。你看着他离去，心满意足地知道你向这个世界证明了，一个拥抱真的能产生深远的影响。");
         get_player().destroyItems(get_useables().TELBEAR);
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function liddLeave() : void
      {
         clearOutput();
         outputText("你不需要再做任何事了；这本身就已经足够令人满意了。你不仅为这个世界消除了一潜在的威胁，还让它变得不那么丑陋，真是一件干得漂亮的工作。");
         outputText("[pg]至于她这边，这个\"爱丽丝\"看起来既困惑又痛苦。她不停地试探着触摸自己崭新的身体，却又一次次畏缩回去，显然被这剧变折磨得心神不宁。半晌过后，她抬起头哀求道，[say:快变回去！把这副娘们的身体弄走！]她的眼角已经泛起了泪珠。");
         outputText("[pg]你一边准备离开，一边心想，这么尖锐的声音肯定会招来最糟糕的注意。瘟疫鼠朝你的方向爬过来，但很快就绊倒了，显然还不习惯她的新身体。没过多久，你已经把她抛在脑后，让她去过那种她应得的生活。");
         dynStats(DynStat.Cor(0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function liddKill() : void
      {
         clearOutput();
         outputText("够了，你不想让这东西在玛瑞斯多待一秒钟。即使是个小女孩，它也令人不快，你不想让它继续它那可悲的存在。带着杀意，你向前[if (singleleg) {移动|迈出}]了一步。");
         outputText("[pg]这只啮齿动物一定是察觉到了不对劲，它的眼睛因为恐惧而睁得大大的，然后转身试图爬走。然而，它那刚变短的四肢破坏了它的协调性，它很快就摔倒在地。你紧随其后。");
         outputText("[pg]虽然利德尔素可能有些浪费，但它仍然让你更容易将恶魔制服。它的小手试图将你拍开，但你[if (str > 30) {轻松地|设法}]将它按在原地，它整个身体试图挣脱，但都是徒劳。当它意识到无路可逃时，它只能开始嚎啕大哭，沉重的抽泣声摇晃着它那孩童般的身体。这种可怜的景象只会让你想更快地结束这一切。");
         outputText("[pg]用你的[if (singleleg) {[if (tailLeg) {尾巴|粘液}]包裹住它|膝盖牢牢地压在它的胸口上}]，你伸手去拿附近的一块石头，并掂量了一下。似乎足够满足你的目的了。老鼠开始过度换气。");
         outputText("[pg][say:不——不要，你不能这么做。我什么都愿意做，好吗？]它哭喊着。你不会被动摇的。");
         outputText("[pg]你高高举起石头，然后用尽全力砸下。你瞄准它的太阳穴，在它以前的角残端下方，你的[arm]以致命的弧线落下。撞击导致小恶魔的头向后仰，一声震惊的叫喊几乎脱口而出，但并没有。相反，它的表情凝固在难以置信中，显然被正在发生的一切所淹没。");
         outputText("[pg]但尽管它病态的皮肤上多了一道新的[gash]，从它闪烁的眼神来看，你的工作还没有完全结束。石头再次举起，老鼠甚至没有意识到它的末日正在降临，最后一声沉闷的撞击声宣告了它生命的终结。");
         outputText("[pg]大功告成，你站起[feet]转身离开，甚至懒得再看那死去的恶魔一眼。当你动身返回营地时，你感到一种满足感，因为你让玛瑞斯变得更美好了一点。");
         _temp_1.ratsKilled += 1;
         if(!get_player().isReligious())
         {
            dynStats(DynStat.Cor(1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function liddFuck() : void
      {
         clearOutput();
         outputText("她仍然是一只瘟疫鼠，但像这样，你开始能够忍受将她据为己有的想法了。她青春期前的身体曲线还算不错，更具少女气息的特征平衡了她残存的野兽形态。这种反差，加上女孩脸上混合着羞耻和仇恨的有趣表情，让你有些兴奋。你已经决定了——你现在不会回头了。");
         outputText("[pg]虽然她的外表可能略有改善，但你不需要面对她来做这件事；事实上，你觉得如果她的[if (nofur) {鼻子|口鼻}]被按在[if (" + Std.string(get_player().isInBog() || get_player().isInSwamp()) + ") {泥里|地上}]，她看起来会好得多，而且她虚弱的身体也无力抵抗你的心血来潮。这只老鼠的本能并没有消失，当你靠近时，她开始拼命挣扎，但你恰到好处的一记[if (singleleg) {重击|踢击}]就解决了这个问题。没有其他选择，她只能蜷缩起来，把爪子放在头上，抽泣着。");
         outputText("[pg][say:这不是真的，这不是真的，这不是真的，]当你俯下身子与她平视时，她一遍又一遍地重复着。你可能得想办法处理一下她那烦人的声音。");
         outputText("[pg]当你把她翻过来并扯下她那少得可怜的破布时，你需要躲避几次胡乱的挥击，但药水已经把她的力量削弱到了极其可怜的地步，所以当你露出你想要的东西时，你的战利品来得令人满意地快。你将你的[claws]刺入她纤细大腿的肉中，并将它们分开。");
         outputText("[pg]她新形成的小穴是纯净的粉红色，[if (cocklength >= 6) {虽然它看起来对你来说[if (cocklength >= 10) {太小了|有点小}]|而且看起来大小正合适}]。这只老鼠的小屁股在室外的空气中微微颤抖，但除了偶尔的喘息声，她似乎暂时退缩到了自己的世界里。你知道该怎么打动她。");
         outputText("[pg]你的[cockhead][if (isnaked) {从你的[armor]中滑出|准备就绪}]，速度创下新高，让你能在不知不觉中把它移到合适的位置。靠得这么近，你能感觉到她身上散发出的些许热量，想象着她在里面的感觉，你期待地抽动了一下。你轻轻地戳了她一下，几乎是温柔地。");
         outputText("[pg]她意识到你在做什么时已经太晚了，只来得及发出一声颤抖的、破音的[say:不！]，然后你就在纯粹的极乐中完全刺穿了她。");
         outputText("[pg]当你压进去的时候，你把全身的重量都压在上面，迫使[if (hasknot) {你的肉结进入她体内|她娇小的臀部贴在地上}]，而她在下面扭动着。尽管如此，你这样压着她，她没有自由来阻止你，在她体内跳动的[cock]引出了痛苦的呻吟。一旦那个声音传到你的[ears]里，你就放弃了任何节制的想法，开始反复地猛烈撞击她。一只手伸到她的后脑勺，确保她的嘴巴被塞满，而她挣扎着呼吸时肌肉的紧绷是一个令人愉快的惊喜。");
         outputText("[pg]当你开始真正投入其中时，你的另一只手移到了她的臀部，享受着变形药剂带来的全部好处。尽管她仍然有点病态，但她的新身体和真的一样令人满意，而且她如此令人厌恶的事实只会让你自由地做你想做的事，而不用去关心这个邪恶的恶魔。");
         outputText("[pg]你响亮地拍打她的屁股，她发出的尖叫让你不寒而栗，即使声音被泥土闷住了。你的臀部动作加快。你开始揉捏你能触及的每一寸肌肤，喘息着将她的身体推向极限。你自己的极限也快到了。");
         outputText("[pg]一阵抽搐，你向欲望投降。你把你的[cock]尽可能深地插进去，紧紧贴在她的背上，[if (cumhighleast) {你[if (cumveryhighleast) {过度}]填满了她|一股[if (cumnormal) {微弱的精液|精液}]流入她体内}]，呻吟声不由自主地从你嘴里溢出。当她在下面拼命想把你推开时，你在她发育不全的缝隙里颤抖、跳动，快感几乎让你失去理智。");
         outputText("[pg]为了让她彻底明白，在一切似乎终于结束之后，你又给了她最后三次猛烈的抽插，但这已经是你目前能做的极限了，你最后的种子终于倾泻而出。当你躺在那里恢复体力时，你觉得这女孩的抽泣声听起来真的很符合她的年龄。你花了[if (hasknot) {好几次尝试才把你的肉结拔出来|一些时间才鼓起勇气拔出来}]，但你最终还是做到了，留下她的小穴在你的蹂躏下惨不忍睹。");
         outputText("[pg]你迅速站起来，[if (isnaked) {伸了个懒腰|重新穿好衣服}]，想尽快离开这里。你不确定这只被遗弃的老鼠会遭遇什么，但肯定不会是什么好事。无论如何，这都不是你的问题；你带着一种平静的满足感[walk]回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_debugName() : String
      {
         return "Plague Rat";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function forceLiddellium() : void
      {
         clearOutput();
         outputText("你可能不知道这到底会产生什么效果，但你确信几乎任何形态都会比你面前的这个更讨人喜欢，想到这里，你从你的[pouch]里拿出一个烧瓶。");
         outputText("[pg]当你打开利德尔药剂的瓶子时，闻到了一股令人愉悦的香味，你走近倒下的啮齿动物。也许，有人会希望，这种气味也能转移过去，但这可能只是一厢情愿。你毫不迟疑地抓住这只邪恶恶魔的角，把药水塞进他的嘴里，强迫他灌下去，尽管他立刻抗议并扭动着身体。");
         outputText("[pg]液体流进他的喉咙，在重新获得呼吸自由后，这只瘟疫鼠开始剧烈咳嗽。他试图站起来，跌跌撞撞地逃离你可能计划的任何其他事情，但却被自己绊倒了，显得极度头晕。[say: 你——你给——给我吃了什么？]");
         outputText("[pg]回答他担忧的嘟囔毫无意义，因为毫无疑问，他很快就会看到效果。在你的眼前，这只恶魔全身都在缩小和改变，很快就变得更像个女孩。他长满疣的皮肤和斑驳的毛发开始变得更加柔软，他的脸庞更加年轻，爪子和牙齿也不再那么发达。你不确定这个过程是否真的如此之快，或者是因为它太迷人了以至于你不在乎，但无论如何，它很快就完成了。");
         outputText("[pg]这只瘟疫鼠现在看起来像个小女孩，尽管可能是一个疾病缠身的小女孩。她的脸有些像人类，有着可爱圆润的脸颊，小巧的鼠鼻，以及比以前更小的下巴。然而，她仍然保留着这种生物的起源特征，她的皮肤坑坑洼洼，在淡红色的色调中夹杂着浅色和深色的斑块，她的牙齿虽然变短了，但仍然有着明显的鼠类门牙，并带有不干净的黄色调。");
         outputText("[pg]你对这些结果并不完全满意，但这仍然算是一种进步。现在剩下的就是决定这只恶魔的命运了……");
         get_player().consumeItem(get_consumables().LIDDELL);
         menu();
         addNextButton("操她",liddFuck).hint("既然她准备好了，就尝尝味道吧。").sexButton(1);
         addNextButton("杀死",liddKill).hint("彻底解决掉这个生物。");
         setExitButton("离开",liddLeave).hint("这个惩罚已经足够了。");
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
   }
}

