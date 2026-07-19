package classes.scenes.places.swim
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.Player;
   import classes.SelfDebug;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.swim._JellyFishGirlScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class JellyFishGirlScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var elementLong:String;
      
      public var element:String;
      
      public function JellyFishGirlScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "jellyfishgirl";
         saveContent = new SaveContent(null);
         elementLong = "sapphire";
         element = "blue";
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function tieUpJellyFishGirl() : void
      {
         clearOutput();
         outputText("凝胶女颤抖着，她那[jellyColor]的凝胶状薄膜在水中晃动，徒劳地试图用她那乱糟糟的触手缠住你。你抓住那些黏糊糊的细丝，感觉到它们在你手中跳动，注意到它们是多么黏稠和柔软。当你拉扯她那软乎乎的小身躯时，她发出一声可爱的高亢尖叫，你将她自己的触手交叉、穿插、缠绕在她的全身。你打了一个又一个结，将它们编织成一张纵横交错的网，把她的四肢拉起，让她的背部拱起，凸显出她娇小柔软的身躯。这些束缚在她天然的半透明身体上，在[sun]的照射下闪闪发光，凝胶绳索形成了一个复杂的挽具，将她像装饰品一样挂在她的伞帽上。");
         outputText("[pg]她好奇的眼睛困惑地眨了眨。也许如果你给她时间思考，她那无定形的薄膜能让她解决这个困境，但你[if (isTaur) {骑上她，跨坐在那柔软的伞帽上，盲目地向她那软绵绵的阴阜挺进|滑到她身后，[if (isnakedlower) {将你的[cocks]压在|露出你的[cocks]压在}]她柔软的阴阜和小巧的屁股上}]。她身体的渗透性可能让你插哪里都无所谓，然而当你把龟头磨蹭进那黏滑的阴户时，她发出了类似水下[i:呼噜]声的共鸣。你感觉到你的肉棒[if (multicock) {们}]不知怎么的变得更硬了，[if (isTaur) {你用[legs]稳住她|你的手指陷入她小屁股的柔软中借力}]，然后用力挺进。当你[if (cockLength>5) {刺穿|插进}]她那充满弹性、滑溜溜的小穴时，凝胶女颤抖起来。她的内部贴合着你的形状，与[cocktype]的每一个轮廓和细节完美契合。在你直没根部的那一刻，凝胶在入口处泛起阵阵涟漪。");
         outputText("[pg]她扭动着身体——不是为了逃跑，只是本能地试图挤压入侵者[if (cockthickness > 2 || (cocklength > 10 && cockthickness > 1)) {，这让她的[if (allowbaby) {婴儿般|娇小}]身体鼓胀变形}]。她自己触手形成的绳索随着她的动作拉伸弯曲，在你抽插时将这个性爱套筒固定在原位。她黏滑的内壁沿着你的长度颤抖，饥渴地紧握着，她被束缚的身体随着每一次深深刺入果冻的抽插而颤抖。你进进出出地抽插着肉棒，在快感中呻吟，然后[if (isTaur) {用四条腿紧紧夹住她，把她的伞帽像茧一样挤压在她周围[if (isCentaur) {——或者像个假母马}]|把你的[face]埋进她的伞帽里，在它柔软的拥抱中掩盖你的声音。你的[hands]探索着她，抓住那[if (silly) {Q版|袖珍}]的[if (allowChild) {[if (allowBaby) {婴儿|儿童}]|女人}]身躯，在你手指饥渴的力量下挤压她[if (allowChild) {平坦|一手可握}]的胸部}]。");
         outputText("[pg]她的身体紧紧收缩，在你周围疯狂地脉动，她的颤抖和哆嗦标志着她达到了高潮。当她在自己触手编织的网中抽搐时，你更加用力地挺进。她高潮时内膜的震颤席卷了你的[cock]，没过多久，你也紧绷起身体，喘息起来。精液从你体内喷涌而出，迅速混合进她流体般的身体中。即使她瘫软下来，她的身体仍在继续泛起涟漪，挤压着你敏感的肉棒，榨取你能给她的每一次[if (cumlow) {微小|[if (cumhighleast) {喷涌|浓稠}]}]的射精。");
         outputText("[pg]心满意足的她凝聚力减弱了，所有的触手都融入了她那黏糊糊的皮肤中。你决定在被这无定形的史莱姆粘住之前抽身离开，整理好自己，确保没有把什么东西留在这一团黏糊糊的烂摊子里。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function tieDownJellyFishGirl() : void
      {
         clearOutput();
         outputText("凝胶女颤抖着，她[jellyColor]的凝胶状薄膜在水中晃动，徒劳地试图用她那乱糟糟的触须缠住你。你抓住那些黏糊糊的细线，感觉到它们在你手中跳动，注意到它们是多么的粘稠却又柔软。当你拉扯她柔软的小身躯，将她自己的附肢交叉、穿插、到处打结时，她发出一声可爱的、高亢的尖叫。一个结接着一个结，你把它们编织成一个纵横交错的网，把她的四肢拉起来，突出了她小巧、柔软的身形。");
         outputText("[pg]对你的杰作感到满意，你把被绑起来的女孩拖到湖底，把她倒过来，这样她巨大的凝胶状伞帽就会伴随着令人满意的砰砰声压在沙子上。它的稠度在她的重量下微微散开，形成了一个天然的垫子。凝胶女发出柔和的颤音，但当你坐在她身上时，她没有反抗。");
         outputText("[pg]粗壮的带状触手在水中缓慢地移动，当你伸手抓住其中一根时，它卷住了你的[if (singleleg) {臀部|大腿}]。它比你想象的要坚韧，但依然柔软光滑，在你的手中微微起伏。将它带到[if ((isDrider || tailLeg) && isgenderless) {你的[ass]之间，当光滑的表面滑过你的小穴时，你颤抖了一下|你们两人的身体之间，你将它压在自己身上，当光滑的表面滑过你的[if (isgenderless) {nullge|[clit]}]时，你颤抖了一下}]。同时，你引导[if ((isDrider || tailLeg) && isgenderless) {另一根触手穿过凝胶女的大腿，哄骗她在取悦你的同时取悦自己|它穿过凝胶女的大腿，将你们的臀部压在一起，让跳动的膜夹在你们两人之间}]。");
         outputText("[pg]你开始移动，以缓慢而有意的动作摇晃着，在坚韧又柔软的触手上摩擦着自己。凝胶女发出一声愉悦的哼声，她那短粗的手臂在束缚中抽动着。她的表情依然像以前一样幸福而空洞，但发出了微小而急切的声音，她的身体自然地对刺激做出了反应。她的质地湿滑，比周围的水稍微温暖一些，提供了一个绝妙的性玩具，点燃了你心中想要被插入的渴望——[if (isvagorassvirgin) {你对此有一丝恐惧。温柔、顺从的粘液可能不会带来痛苦，非常适合你的[vagorass]。[if (cor or lib >= 33) {对更深层刺激的渴望压倒了抑制，你更用力地压住粗壮的触手，无言地坚持你的欲望。凝胶女顺从了她的本能，将凝胶状的带子插入其中，引起你的一声喘息，同时你的内脏感到一阵刺痛。冲动的紧张感压缩了入侵物，而无定形的本质可以毫无问题地弯曲和伸展，直到你再次放松。" + Std.string(get_player().cuntChange(0,true,false,false)) + "当一根带子在你体内时，你哄骗凝胶女用另一根带子操自己[if (hasVagina) {，而剩下自由的触手仍然缠绕在你们两人之间，提供了一个光滑且不平整的表面供你们摩擦。}]|然而，尽管你充满欲望，你还是在凝胶状带子的长度上摩擦，感受着它的簇绒和不平整的形状。即使在克制中也有幸福。}]|你毫无节制地满足了这种渴望，将粗壮的触手压在自己身上，直到凝胶女顺从她的本能将其插入。}]你臀部的每一次旋转都会在你的脊椎上激起火花。凝胶女小巧的身躯移动着，她的动作一开始很慢，但逐渐加快以配合你的节奏。压力加剧，你们湿滑的身体紧贴在一起，粗壮的带子跳动着，对来自双方的刺激做出反应。");
         outputText("[pg]你的呼吸变得急促，即使在水中也是如此，因为热量在你体内积聚。凝胶女发出一声轻柔、愉悦的叹息，当你自发地拥抱她小巧的身体时，她发出了一声可爱的尖叫，在更多萌芽的热量中微微颤抖。你紧紧抓住她被绑住的身体，[if (isvagorassvirgin) {更用力地摩擦|希望她能以更大的热情操你和她自己}]，紧张感瞬间爆发。");
         outputText("[pg]一声尖叫从你唇边溢出，释放感如电击般席卷了你。凝胶女的呻吟声与你的交织在一起，这[if (allowBaby) {婴儿般的}]史莱姆颤抖着，与你一同达到了高潮。她身体的所有延伸部分，从束缚到触手，再到凝胶状的床本身，都微弱地跳动着，随着共享的愉悦而脉动，然后松弛下来，失去凝聚力，融合成一团粘稠的混合物。");
         outputText("[pg]你喘着粗气，终于放松下来，让愉悦的余韵渐渐消散。凝胶女在你身下几乎认不出来了，她心满意足，完全不受打扰。对你的胜利和战利品感到满意后，你从粘液中抽身而出，检查自己身上是否留下了什么东西，然后游走了。");
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.encountered = false;
      }
      
      public function randomJelly(param1:Boolean = false) : JellyFishGirl
      {
         var _loc2_:WeightedChoice = new WeightedChoice().add("blue",2).add("purple",2).add("crystal",1);
         if(isHalloween())
         {
            _loc2_.add("orange",3);
         }
         element = _loc2_.choose();
         if(param1)
         {
            element = "blue";
         }
         var _loc3_:IMap = new StringMap();
         var _loc4_:Array = ["blue","azure","cerulean","sapphire"];
         if("blue" in StringMap.reserved)
         {
            _loc3_.setReserved("blue",_loc4_);
         }
         else
         {
            _loc3_.h["blue"] = _loc4_;
         }
         _loc4_ = ["purple","violet","plum","amethyst"];
         if("purple" in StringMap.reserved)
         {
            _loc3_.setReserved("purple",_loc4_);
         }
         else
         {
            _loc3_.h["purple"] = _loc4_;
         }
         _loc4_ = ["glassy","crystal","prismatic"];
         if("crystal" in StringMap.reserved)
         {
            _loc3_.setReserved("crystal",_loc4_);
         }
         else
         {
            _loc3_.h["crystal"] = _loc4_;
         }
         _loc4_ = ["orange","pumpkin","tangerine","sunstone"];
         if("orange" in StringMap.reserved)
         {
            _loc3_.setReserved("orange",_loc4_);
         }
         else
         {
            _loc3_.h["orange"] = _loc4_;
         }
         var _loc5_:IMap = _loc3_;
         var _loc6_:String = element;
         _loc4_ = _loc6_ in StringMap.reserved ? _loc5_.getReserved(_loc6_) : _loc5_.h[_loc6_];
         elementLong = _loc4_[Utils.rand(int(_loc4_.length))];
         registerTag("jellyColor",TagFun_Impl_.fromString(elementLong));
         return new JellyFishGirl(element,elementLong);
      }
      
      public function oralTheJellyFishGirl() : void
      {
         clearOutput();
         outputText("凝胶女在原地晕乎乎地漂浮着，她那简单的表情显得茫然失焦。胜利在握，你决定好好享受她那小巧的嘴巴，游向她，心中的欲望随着期待进一步高涨。当你推开她那宽大且呈凝胶状的[jellyColor]伞帽时，它随着浮力上下摆动，迫使她的头向上仰起。[if (tailLeg) {你用尾巴卷住她的身体，张开你的泄殖腔[if (hasCock) {，肿胀到完全勃起}]|你跨坐在她的脸上，将你的下体压在她柔软的凝胶状身体上}]，她本能地张开了嘴。当然，她没有反抗。");
         outputText("[pg]她的舌头伸出来，在你的[if (hasVagina) {[vagina]|[if (hasBalls) {[balls]|会阴}]}]上缓慢而笨拙地舔舐。质感既紧实又流动，变形以涂抹每一个细节。随着快感的袭来，你[if (tailLeg) {[if (isMer) {下意识地发出咕咕声，用你丝滑的鳍长长地抚摸这个小女孩|收紧你的盘绕，无意中扭曲了这个小女孩原本矮胖的比例}]|用你的[if (isDrider) {前腿|大腿}]紧紧抓住这个[if (allowChild) {[if (allowBaby) {婴儿形状的史莱姆|小孩子}]|娇小的女人}]}]。她在你最敏感的部位发出温柔、愉悦的震动，那令人愉悦的声音让你的核心感到阵阵酥麻。那震动变成了一种渴望、急切的吸吮，她的小手将你固定在原位，同时她[if (hasvagina) {吸吮着你情欲的味道|用鼻子蹭着你的[genitals]的下方}]。[if (hasCock) { 准备进一步沉浸其中，你将你的肉棒压在她的脸上，遇到了她薄膜的阻力[if (silly) {并在中间留下了一个深深的[cocktype]形状的山谷。你眨了眨眼，努力弄清楚该如何看待她凹陷的脸庞和斗鸡眼。凝胶似乎并不在意，抓住你的阴茎再次拍打在她的脸上，使凹陷更深，然后又一次，终于穿透了她的薄膜，薄膜在片刻后重新结合|只有片刻，然后渗透性就让步了}]。}][if (hasVagina) { [if (isHerm) {当你深深陷入她的头部时，她的舌头恢复了滑动|在急切中颤抖，你轻轻地在舌头上摇晃，感觉它滑动}]穿过你的外阴，刺激着里面珠状的欲望。你的阴唇在不抵抗的情况下尽可能地张开，每一个褶皱和皱纹都被活生生的史莱姆刺激着。}]");
         outputText("[pg]一股滑溜溜的触感沿着你的腰际游走。她原本无力垂下的触须开始活动起来。起初，它们只是在水中漂浮，轻轻拂过你的身体两侧，但很快它们变得有目的性起来，开始卷曲并抚摸你的身体。光滑、柔软的粘液带[if (hasBreasts) {缠绕在你的[breasts]上，轻轻地挤压和揉捏|滚过你的胸膛，按摩着你的胸肌，似乎在惊叹你[if (isemaciatedbuild) {骨瘦如柴的食尸鬼般的身体|[if (isfitbuild) {肌肉线条|[if (ischubbybuild) {柔软的身体|身体的每一处轮廓}]}]}]}]，这种压力让你呼吸一滞。");
         outputText("[pg]你越是用力摩擦她，她就越是狂热。她的舌头越来越热情地旋转着，嘴唇吸吮着[if (hasBalls) {你的[balls]|[if (hasVagina) {你的[clit]|你的阴茎}]}]，驱使你更用力地操她的脸。你的[hands]陷入她伞帽的薄膜中以获得更多杠杆力，当她吸吮的嘴巴变形覆盖你整个胯部时，你喘息着。[if (hasVagina && !isvirgin) {那条原本虔诚地品尝和戳刺的舌头，将其[i:变粗的]长度插入，像阴茎一样抽插着。}]你体内的热量不断增强。你的临界点不远了，在沉重的挺胯中，你发出一声欢愉的叫喊。她的触须抽搐和弯曲，鼓励着你，诱哄你更近一步。你身体的每一根纤维都变得更紧、更硬，然后在紧张感断裂之前短暂地屏住呼吸，像洪流一样高潮！[if (hasCock) { 你一直紧紧拥抱的伞帽从半透明变成了[if (cumlow) {略微的}]乳白色，因为你的精液在整个体积中消散了。}]");
         outputText("[pg]她的吸吮慢了下来。当你终于抽身离开时，凝胶女用一种平静的表情抬头看着你。在离开这个小小的、有知觉的史莱姆之前，你确保没有留下任何东西。");
         get_player().orgasm("VaginalAndDick");
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function loseYourMilkToTheJelly() : void
      {
         clearOutput();
         outputText("一阵眩晕袭来，[jellycolor]的凝胶女抓住了你的弱点，用她较粗的、有褶边的丝带将你的身体拉近。虽然她那各种各样较细的触须将你缠住，但幸运的是它们没有造成任何伤害。她发出愉悦的嗡嗡声，小手放在你的胸前，小巧的身体在你身上上下浮动。");
         outputText("[pg]她半透明的眼睛睁得大大的，没有焦点，在研究你的[breasts]时缓慢地眨着，短粗的手指带着漫不经心的好奇按压揉捏着。然后，她灵机一动，凑上前去，将凝胶状的嘴唇贴在你的[nipple]上。她那伞状的伞帽像枕头一样压在你的脸上。吸吮是立竿见影且坚持不懈的，她带着盲目的饥饿感吸吮着，舌头在打转、哄骗、期待着。[if (islactating) {她的眼睛似乎亮了起来，但实际上是你的乳汁填满了她半透明的脑袋。}]即使凝胶女似乎被你的乳头迷住了，触须仍在继续对你的身体进行缓慢而有条理的探索。");
         outputText("[pg]其中一根丝带状的触手滑上你的[if (tailLeg) {[if (isgenderless) {臀部|生殖裂}]|大腿内侧}]，它柔软而坚定的压力在你的[vagorass]上彰显着它的存在，戳刺着想要找出里面藏着什么。更多的触须加入进来，拂过并描摹着每一道曲线，盘绕在你的[if (ischubbybuild) {柔软的肚子|[if (isfitbuild) {结实的腹肌|腰部}]}]、你的手腕、你的[if (tailLeg) {长长的尾巴|[if (singleleg) {下半身|[if (isDrider) {八条腿|小腿}]}]}]上——用一种挑逗性的收缩将你包裹起来，色情地滑动摩擦着。她描绘出你身体的每一[if (metric) {厘米|英寸}]，仅凭触觉来了解你。");
         outputText("[pg][if (!lactating) {由于没有乳汁流出，她心中涌起一阵挫败感，眉头微微皱起。}]她吸吮得更用力了，她那[if (silly) {Q版|[if (allowBaby) {幼儿般|短粗}]}]的身体更紧地贴着你，臀部出于漫不经心的本能转动着。由于不满足，在你[vagorass]处戳刺的丝带快速扭动着，它那光滑、无实质的性质让人无法拒绝它的进入。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(0,true,false);
         }
         else
         {
            get_player().buttChange(0,true,false);
         }
         outputText("柔软、凝胶状、顺从的质感像一个充满爱意的拥抱一样从内部侵入你，将一种舒缓的凉意推向深处。她的触须随着缓慢的起伏荡漾着，挠痒并按摩着每一丝肌肤。");
         outputText("[pg]当她退后时，一声微弱的、闷闷的呜咽在你的胸前震动，嘴唇分开时发出一声湿润的“啵”声。她的伞帽倾斜到一边，眼睛抬头看着你，充满期待，似乎在等待什么事情发生。你的嘴巴因为史莱姆在抽插你的洞而张开，你几乎无法思考这团凝胶在寻找什么，但你顺从本能，凑上前去亲吻，与她的嘴唇锁在一起。整个触手团因为你这出人意料的举动而颤抖，作为回应，她更用力地操你。丝带形状上的小簇和不平整处湿漉漉地摩擦着你的内壁。一切终于达到了顶点；你的[if (hasVagina) {小穴|屁股}]在性高潮中扭动着，你的喘息打断了亲吻，留下凝胶女继续试图在你的乳头上吸吮，而你则慢慢陷入了非常舒适的沉睡。");
         get_player().orgasm("VaginalAnal");
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function killJellyFishGirl() : void
      {
         clearOutput();
         outputText("你将全身的重量压在攻击上，重重地击打在凝胶女的身上，正中她伞帽的中心！你的瞄准非常精准，击中了核心，将其直接推入了她的头部。");
         outputText("[pg]她被打得晕头转向，向后飘了一小段距离。你看到她的脸向两侧大幅扩张以容纳那个核心，两只眼睛分得极开。你被这滑稽的模样逗乐了，丢下这个顶着[if (metric) {橄榄球|足球}]脑袋的史莱姆，径直回家了。");
         get_combat().cleanupAfterCombat();
      }
      
      public function jellyWinChoices(param1:Boolean) : void
      {
         clearOutput();
         registerTag("lustwin",TagFun_Impl_.fromBool(!param1));
         outputText("伴随着气泡和呜咽声，[jellyColor]的凝胶女瘫软下来[if (lustwin) {，她更专注于揉弄自己那小巧的肉缝，而不是撤退}]。");
         menu();
         addNextButton("捆绑",tieUpJellyFishGirl).hint("用她自己的触须把她吊起来，然后操她。").sexButton(1);
         addNextButton("捆绑",tieDownJellyFishGirl).hint("用她自己的触手把她绑起来，玩弄她的丝带。").sexButton(2);
         addNextButton("口交",oralTheJellyFishGirl).hint("[if (hasCock) {操她的嘴|使用她的嘴}]").sexButton(-1).disableIf(get_player().isTaur(),"你需要少几条腿才能这么做");
         if(get_silly())
         {
            addNextButton("杀死",killJellyFishGirl).hint("消灭这个令人作呕的生物。");
         }
         setSexLeaveButton();
      }
      
      public function jellyWantsYourPenis() : void
      {
         clearOutput();
         outputText("凝胶女抓住了机会，用触手将你缠住。一股突如其来的拉力先是拽着你的[legs]，还没等你反抗，你已经被扭转翻转——倒吊在她的怀抱中。这和在陆地上倒吊的感觉截然不同，很难用语言形容。世界倾斜了，她的触手紧紧束缚着你，她那小巧、[if (silly) {Q版|短粗}]的身体在你的腹股沟前上下浮动。你伸长脖子想看看她在做什么。她半透明的[jellycolor]薄膜在[sun]的光芒下发出微弱的光，当她的小手向前伸出，好奇地滑过你的[if (isnakedlower) {[cocks]|腹股沟时，你能感觉到一丝遥远的迷恋。她笨拙而茫然地剥去你的[armor]，这让你确信她根本不明白穿衣服的目的是什么。哎，她确实找到了她的战利品，她凝胶状的触碰在你的[cocks]上留下了一层光滑的温暖}]。");
         outputText("[pg]起伏的触手环绕着你的躯干，顺着你的胸膛滑到你的[if (ischubbybuild) {肚子|[if (isfitbuild) {腹肌|胃部}]}]，在你的[if (isTaur) {四足身体|[if (tailLeg) {生殖裂|大腿内侧}]}]上挑逗，然后更粗、更大胆的丝带滑向[if (hasBalls) {你的[balls]周围|[if (multicock) {你的肉棒之间|你的肉棒周围}]}]。它有节奏地跳动着，但好戏还在后头。");
         outputText("[pg]当她凑近时，水中传来一阵令人颤抖的嗡嗡声，她柔软的嘴唇在[cockhead]周围张开。这种感觉是立竿见影的；当她急切地吸吮时，一种光滑、炽热的拥抱吞没了你。她嘴里的质地混合了坚实和流动——那是凝胶。她的舌头缓慢而极不协调地舔舐着你，满怀期待，渴望着你的精液。即使在水下，倒吊着也会让人有些迷失方向，被抚摸和口交让你不安地颤抖，盲目地挣扎着寻找可以支撑的东西。那些轻轻拉紧、拉扯和放松的丝带，不顾你的扭动，将你能挤出的任何营养液体都榨取出来。");
         outputText("[pg]一种类似[i:growl]的声音在你的阴茎中回荡，因为凝胶女显然很不耐烦，到目前为止你除了先列腺液什么都没给她。她微微向后退去，嘴唇仍然紧紧贴着你的龟头，小手按在你的臀部。一个迅速的动作，她把她那软绵绵的脸猛地撞向你的骨盆；当你的整个长度都埋在一团粘液中时，感觉非常明显。她体内的每一个角落和缝隙都在蠕动并挤压着入侵物。她吸吮得更用力了。她的需求很简单，出于本能：她寻求营养，不达目的誓不罢休。");
         outputText("[pg]她舌头缓慢而有条理的揉捏变成了狂野、绝望的纠缠，随着她开始越来越快地上下浮动，她喉咙有节奏的收缩也加剧了。构成她嘴巴的起伏凝胶重塑成你[cock]的形状，被塑造成挤出她渴望的每一滴液体的样子。");
         outputText("[pg]无情的吸吮、蠕动的触感，以及被悬吊着榨精的压倒性快感，在令人陶醉的高潮中交织碰撞。随着不可避免的顶点到来，你的腹肌紧绷，尽管被她的触手紧紧抓住，你的臀部还是不由自主地抽动。当你第一股浓稠的精液射入她贪婪的嘴里时，你发出一声颤抖的喘息[if (multicock) {，你的[if (cocks>3) {那排肉棒|其他肉棒[if (cocks==3) {}]}]也在痉挛，肆意地喷洒在她的脸上和伞帽里}]。她发出一声沉闷而贪婪的呜咽，紧握的触手终于开始放松。她吞咽着，品尝着每一股喷射，当她饮下那浓稠的白浊时，她的身体在你身上愉悦地扭动着。");
         outputText("[pg]即使你的高潮逐渐消退，凝胶女依然像个婴儿般深情地吸吮着。直到她确信已经把你榨干到一滴不剩，她才松开你那疲软的肉棒。你无力地漂浮在水中，在她渐渐远去的轻柔哼唱声中沉沉睡去。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function jellyLossChoices(param1:Boolean) : void
      {
         clearOutput();
         registerTag("lustwin",TagFun_Impl_.fromBool(!param1));
         if(get_player().hasBreasts() && get_player().hasCock())
         {
            if(Utils.randomChance(50))
            {
               loseYourMilkToTheJelly();
            }
            else
            {
               jellyWantsYourPenis();
            }
         }
         else if(get_player().hasCock())
         {
            jellyWantsYourPenis();
         }
         else
         {
            loseYourMilkToTheJelly();
         }
      }
      
      public function jellyFishGirlEncounter() : void
      {
         var _loc1_:* = null as Array;
         clearOutput();
         if(!saveContent.encountered)
         {
            outputText("当你向前游动时，你抬起视线，看到水面附近有一道红色的闪光。它看起来并不大，但即使在你这么深的地方也足以引起注意，于是你屈服于好奇心，向上游去。[sun]的光线在物体周围折射出不同的光彩——当你靠近时，这个物体看起来就像一块未经雕琢的宝石原石。你伸出一只[hand]，你——");
            outputText("[pg]你被一股凝胶状的力量拦住了。两只眼睛在你的手指旁形成，交叉着打量它们。这一刻近乎超现实，但就在你意识到这是一个史莱姆女孩时，你周围的水流收紧了！史莱姆触手！");
            outputText("[pg]你挥舞着手臂向后退去，对着这个无定形的生物挥拳，但毫无效果。幸运的是，她似乎比你更困惑，并没有紧紧抓住你。看起来她的大部分质量都漂浮在湖面上，红宝石般的核心安全地位于中心，而曾经融入周围水中的部分，现在看起来像是从主体上垂下来的史莱姆触须，就像水母一样。凝胶女开始下沉，她的触手一马当先！");
         }
         else
         {
            _loc1_ = ["你的水下冒险有所发现——一个泡泡。在湖底。你好奇地戳了戳它，它脱落下来，原来是一个凝胶女！","红色的闪光吸引了你的目光，你意识到一个凝胶女正在漂流。巨大的凝胶状伞帽在水中推进时扭动着，从上面降下来的小巧的、类似[if (allowBaby) {幼儿|人类}]的身体转过头来，用她那单纯的表情看着你。不过，当她向你冲来时，你并没有措手不及！","当一个凝胶女在头顶漂浮时，像丝带一样有褶边的触须也随之漂流。在[sun]的照耀下，这景象相当漂亮，但那些黏液状的触手紧绷起来，开始向你靠拢。她开始进攻了！"];
            outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         }
         startCombat(randomJelly(saveContent.encountered));
         saveContent.encountered = true;
      }
      
      public function get_debugName() : String
      {
         return "JellyFishGirl";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

