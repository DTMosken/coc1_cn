package classes.scenes.areas.glacialRift
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class ValkyrieScene extends BaseContent
   {
      
      public function ValkyrieScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winAgainstValkyrie(param1:Boolean = true) : void
      {
         var _g:Combat;
         clearOutput();
         if(param1)
         {
            outputText("被打败并流血的女武神踉跄了一下，然后扔下了她的长矛和盾牌。她跪在你面前，头低得长发都扫到了冰冷的地面。");
         }
         else
         {
            outputText("无法抑制自己的情欲，女武神扔下武器，跪倒在地，将一只手伸进她的短裙里。");
         }
         outputText("[say: 我投降，]她虚弱地承认，避免与你眼神接触。[say: 看来我太弱了，无法打败你。随你怎么处置我吧。]");
         menu();
         addButtonDisabled(0,"空中交媾","此场景需要你拥有阴茎并有足够的性奋度。");
         addButtonDisabled(1,"肛交","此场景需要你拥有阴茎并有足够的性奋度。");
         addButtonDisabled(2,"被舔","此场景需要你拥有阴道并有足够的性奋度。");
         addButtonDisabled(3,"磨豆腐","此场景需要你拥有阴道并有足够的性奋度。");
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               addButton(0,"空中交媾",valkyrieAerialFuck);
               addButton(1,"肛交",valkyrieAnalFuck);
            }
            if(get_player().hasVagina())
            {
               addButton(2,"被舔",valkyrieLicksYou);
               addButton(3,"磨豆腐",valkyrieScissor);
            }
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         _g = get_combat();
         setSexLeaveButton(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function valkyrieScissor() : void
      {
         clearOutput();
         outputText("你轻轻地将跪着的女武神推倒仰躺，解开你的[armor]，刚好露出你的[vagina]。女孩扭动了一下，但你严厉的话语让她停了下来，你分开她的双腿并摆好姿势。你轻松地将她的一条长腿扛在肩上，将她湿滑的小穴紧贴着你的。");
         outputText("[pg]你对她微微一笑，开始在她的腿上摩擦，用你的[vagina]蹭着她的大腿，感受着她光滑的肌肤微微分开你的阴唇。她也不愿只是干躺着，你欣慰地看到你的伴侣开始用她的小穴摩擦你的，回应着你的爱意。既然现在是真正的双向互动，你稍微加快了速度，与女武神进入了绝佳的节奏。");
         outputText("[pg]你伸出手，在情人的些许帮助下，解开了她的胸甲。现在她只穿着一件薄薄的衬裙，你抓住她挺拔的双乳，开始挤压和抚摸，在把玩她柔软胸部的同时，时不时捏一下她小巧的乳头，并粗暴地揉捏着。每一次揉捏或挑逗都让她发出一声轻喘，最终她也予以回敬，将手滑进你的[armor]，抓住了你的[breasts]。她用力拧了一下你的乳头，疼得你倒吸一口凉气。");
         outputText("[pg]接下来的几分钟里，你们愉快地互相摩擦和爱抚，但这似乎并不能完全满足这位女武神。出乎你意料的是，她伸出手紧紧地抱住了你。[say:求求你……快点。我太需要了……]她坦白道，一边亲吻着你的脖子，一边挺起臀部迎合你。好吧，好吧。你欣然同意了她的请求，加快了速度，直到你真真切切地在操她，你们的臀部互相摩擦着，女武神亲吻并抚摸着你，对于一个几分钟前还显得如此冷酷和骄傲的人来说，她现在出奇地温柔。");
         outputText("[pg]你捧起她的脸颊，在她的嘴唇上深深一吻。当你松开时，她笑得很美。那个笑容，以及她的小穴对你的摩擦，让你达到了顶峰。你紧紧抱住你长着翅膀的情人，高潮了，你在她肩头呻吟着，度过了一次强烈的性高潮。女武神依然微笑着，用翅膀裹住你，发出一声轻哼，你感觉到她喷在了你身上，用她的淫液浸透了你本就湿透的胯部。");
         outputText("[pg]在经历了这场充满情趣的性爱后，女武神精疲力尽地仰面倒下，彻底被榨干了。你拍了拍她的脸颊，飞快地吻了她一下，然后抓起几颗宝石，动身返回营地。");
         get_player().orgasm("Vaginal");
         if(get_player().canDepositEel())
         {
            outputText("[pg]<b>在你们俩忙活的时候，一条寄生鳗悄悄地钻进了她的体内。</b>");
            get_player().depositEel();
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function valkyrieLicksYou() : void
      {
         clearOutput();
         outputText("你决定利用女武神女孩跪着的姿势。你走到她面前，解开你[armor]的胯部，露出你的[vagina]。在她反应过来之前，你抓住她金发的后脑勺，把她的脸按进你的阴户。你告诉她舔，令你惊讶的是，她毫不犹豫地照做了。[pg]");
         outputText("女孩的舌头出奇地熟练。她迅速地在你的阴蒂上挑逗，让你立刻在突如其来的快感中呻吟。你可以看到她在你身下傻笑，因为她开始挑逗和玩弄你的快感按钮，用她平坦的舌头给周围敏感的肉挠痒痒。你回以微笑，用轻轻拍打她的头和肩膀来鼓励她，甚至伸手去托住她胸甲下那对挺拔的乳房之一。[pg]");
         outputText("她终于伸进舌头，开始抚摸你[vagina]的内壁，用她柔软、温暖的舌头以令人愉悦的速度和温柔沿着你最深处游走。你微笑着，双手穿过她的长发，抚摸着她，而她抓住你的臀部，把脸埋在你的阴户里，完全屈服于你的快感。[pg]");
         outputText("当她吃你的时候，你开始把你的阴户磨蹭在她的脸上，随着她熟练的舌头动作的节奏，把你的阴户在她的鼻子和额头上摩擦。然而，在这样幸福的几分钟后，你感觉到她的一只手开始向前爬行。当她剥开你[ass]的脸颊，用指尖划过你的[asshole]时，你对她微微点了点头。[pg]");
         outputText("当女武神把一根手指滑进你的菊花时，你发出了一声轻喘。她缓慢而稳定地向内推进，温柔地用手指抠你的菊花，同时加快了她舌交的节奏。通过你最深处，你感觉到她的舌头和手指几乎碰到了，只隔着最薄的壁。当它们穿过你的阴道壁互相摩擦和抚摸时，你浑身发抖，难以置信的、撕裂心灵的快感刺穿了你的身体。[pg]");
         outputText("你无法长时间抵抗她的双重攻势。你抓住女武神的头，强迫她的脸埋在你的双腿之间，在你高潮时尽可能地把她的舌头全部吞入体内，将你的淫液喷了她一脸");
         if(get_player().hasCock())
         {
            outputText("，同时你的肉棒也释放出来，将精液喷在她的头发上");
         }
         outputText(".[pg]");
         outputText("彻底满足后，你放开了女武神。她瘫软下来，将手指和舌头从你体内抽出，然后脸朝下栽倒在雪地里。你咯咯地笑着，拍了拍她沾满精液的头，然后抓起几颗宝石，动身返回营地。");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function valkyrieAnalFuck() : void
      {
         clearOutput();
         outputText("你抓住战败的女武神的头发，把她按倒在地，让她四肢着地。当你绕到她身后，狠狠地拍了一下她的屁股时，她呻吟了一声。然而，战败的她并没有试图反抗你，你跪在她身后，掀起她的裙子，露出她丰满的臀瓣、湿润的阴户，以及紧致、皱缩的小菊花。你把手伸进你的[armor]里，掏出你的" + get_player().cockDescript() + "，为了取暖而抚摸自己，直到你能把肉棒塞进女武神的屁股中间。[pg]");
         outputText("你抓住她的臀部，开始向上和向后抽插，慢慢地在这个战败女孩的屁股里进行乳交，只停下来把她流口水的阴户汁液涂抹在你的肉棒上，作为急需的润滑剂。你快速而俏皮地拍了一下她的屁股，让她条件反射地夹紧你的肉棒。你笑着，进入了一个很好的节奏，每抽插几次就打她一次屁股，从她身上获得一点额外的刺激。[pg]");
         outputText("令你惊讶的是，女武神回头看了看，脸上泛着焦急的欲望，低声说：[say:好吧……你还在等什么，嗯？就……插进去吧！][pg]");
         outputText("好吧，既然她这么渴望。你向后靠，猛地插进去，将你的" + get_player().cockDescript() + "猛地塞进她紧致的菊花里。她已经试图放松，但你突然而有力的入侵让她紧紧夹住，像湿润的丝绸老虎钳一样挤压你的肉棒。当你把越来越多的肉棒塞进她那令人幸福的温暖深处时，你呻吟着，一寸一寸地把你的肉棒喂给她的屁股，直到");
         if(get_player().cockArea(0) >= 16)
         {
            outputText("你插到底。");
         }
         else
         {
            outputText("将女武神插到根部。");
         }
         outputText("当你猛烈地撞击她的后庭时，她在快感和痛苦中尖叫，但一旦你停止前进，无法继续时，她就平静下来。慢慢地，你开始在她的体内摇晃你的臀部，缓慢而温柔地操她的屁股。[pg]");
         outputText("当她开始呻吟并扭动臀部，终于投入到你给她的肛交中时，你笑了。既然她已经安顿下来，你加快了节奏，开始更快、更有力地抽插。你保持逐渐增加，让女武神跟上，这样当你粗暴地捣她的屁股时，她正在摸索自己并大喊[say:用力操我！用力操我！]你满足了她，猛撞她的屁股并恢复了你的打屁股，虐待她的屁股直到她尖叫。[pg]");
         outputText("有了这样一个紧致、热切的伴侣，你设法坚持了很长一段时间。然而，天下没有不散的筵席。伴随着一声巨大的咆哮，你把肉棒尽可能深地插进她体内并射精，用你的种子涂满她的内壁。当你填满她时，她也达到了高潮，她的菊花拼命地挤压你，而她未使用的阴户在她的双腿上喷出了一点淫液。你愉快地笑着，继续捣她的屁股，直到你完全筋疲力尽并软下来，而你的伴侣已经瘫倒，脸埋在雪里。[pg]");
         outputText("你伴随着一声湿润的\"啵！\"声拔了出来，咧嘴笑着看着你的精液从她现在大张的肛门里滴落，和她自己的体液一起在身下汇聚成一滩。你轻轻拍了拍她那布满淤青、鲜红的屁股，将阴茎收回盔甲中，然后动身返回营地，留下你那失去知觉的情人瘫倒在冰面上，浑身沾满精液。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function valkyrieAerialFuck() : void
      {
         clearOutput();
         outputText("站在被击败的女武神面前，你的目光落在了她巨大的白色翅膀上。它们绝对足够强大，能让一个强壮、全副武装的女人在空中飞翔……那么为什么不能让你们两个一起呢？你把女战士拉起来，从你的[armor]中释放出你的 " + get_player().cockDescript() + "，紧紧地抱住她。你在她的屁股上狠狠地拍了一下，让她飞起来。[pg]");
         outputText("她犹豫了一下，这又引来了一次严厉的拍打。无法抗拒你的欲望，被击败的女孩展开了她强壮的翅膀，用力一扇，飞向了空中。你高高飞翔，很快就升到了冰冷的荒原之上，俯瞰着下方玛瑞斯的北部地区。你可以看到其他生物在荒原上游荡——巨人和维京人以及其他低飞的女武神，在你下面看起来就像蚂蚁一样。意识到你在这个世界上的高度，加上女武神女孩的亲密，她的乳房贴着你的胸膛，她热乎乎的呼吸吹在你的脸颊上，这些都让你的 " + get_player().cockDescript() + " 在你们两人之间变得坚硬如石，紧紧地夹在你们的肚子之间。[pg]");
         outputText("突然，你意识到，如果不放开女孩，你就不可能把你的鸡巴插进她体内。好吧，该死。你和女武神四目相对，她给了你一个害羞的微笑，令你惊讶的是，她紧紧地抱住了你。你决定信任她，松开了一只手。你抓住你的 " + get_player().cockDescript() + "，掀起她的裙子，顺利地把它引导进她湿润而等待着的小穴。当你进入她紧致的通道时，她喘息着，你赶紧再次抓住她，以免她忘记抱住你。[pg]");
         outputText("现在在她的体内，你命令女武神尽可能快地飞向她想去的任何地方。她微笑着点点头，翅膀用力向海洋方向扇动。当她这样做时，她的阴道肌肉紧紧地收缩在你的鸡巴周围，随着她强壮翅膀的每一次拍打，奇妙地挤压着你。你死死地抱住女武神，在她飞行时亲吻和抚摸她柔软的脖子和脸颊，让她每一个优雅的动作都轻轻地按摩你的鸡巴。[pg]");
         outputText("她似乎也从满载飞行中获得了不少快感，很快就在你的脖子上淫荡地呻吟起来，抛弃了她曾经骄傲的面容，变成了一个好色的女仆。她用双腿缠住你的腰，把你的鸡巴更深地埋进她体内，直到");
         if(get_player().cockArea(0) >= 16)
         {
            outputText("她再也容不下你了。");
         }
         else
         {
            outputText("你已经没有更多可以插入的了。");
         }
         outputText("你投桃报李，开始将臀部挺进她收缩的通道，用快速、短促的抽插操她，让你们两人紧紧贴在一起。[pg]");
         outputText("[say:我……得降落了，]她呻吟着。她的肌肉现在收缩得更厉害、更快了，你能感觉到她滑腻的淫液现在正从你的肉棒周围漏出来。你对她微微点了点头，你自己也快到极限了，但看起来太迟了！女孩尖叫着，在高潮时紧紧夹住你的肉棒，将她的汁液喷射到她和你的大腿上。然而，半空中的高潮让她忘记了她的翅膀，很快你们就向地面坠落！[pg]");
         outputText("当冰冷的地面向你逼近时，你一半是快感，一半是恐惧地尖叫着，你的肉棒在她体内释放，将滚烫的精液泵入她湿透的肉穴中。[pg]");
         get_player().orgasm("Generic");
         if(get_player().canFly())
         {
            outputText("你试图拍打自己的翅膀来自救，但你的冲力太大，而全副武装的女武神紧紧地缠绕着你，在你们双双高潮时拒绝松手。[pg]");
         }
         else
         {
            outputText("你紧紧抓住女武神，准备迎接不可避免的结局，尽管末日即将来临，你还是越来越多地射在她体内。[pg]");
         }
         outputText("突然，女武神展开翅膀飞了起来，在几乎没有多余空间的情况下拉升，你能感觉到脸颊擦过雪地。她喘着粗气，最后一次拍打翅膀，然后把你们俩放在海岸上，俯瞰着冰冷水域的冰川落差。[pg]");
         outputText("你浑身发抖，同时从高潮和濒死体验中缓过神来。同样筋疲力尽的女武神瘫倒在你身上，头靠在你的大腿上。当她进入梦乡时，看来你给女武神留下了好印象，你和她的体液在她的双腿间汇聚。你从她的背包里摸出一条毯子（和几颗宝石），尽可能地给她盖好，然后跌跌撞撞地走回营地。");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToValkyrieForcedOral() : void
      {
         var _loc1_:Number = get_player().get_gems() / 100 + 10 + Utils.rand(20);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         if(_loc1_ > get_player().get_gems())
         {
            _loc1_ = get_player().get_gems();
         }
         _loc1_ = Math.round(_loc1_);
         outputText("女武神站在你上方，她薄薄的裙子已经被你激起的欲望浸透了。她将一条长腿跨过你的头，让你在跌落到你身上之前好好看看她那光滑紧致的小穴，把你的脸砸进她的缝隙里。[say:你这个" + get_player().mf("混蛋","婊子") + "，竟敢试图把一个英勇的战士变成一堆流着口水的欲望。我不会允许的——你会完成你开始的事情，弱者。现在舔！][pg]");
         outputText("太");
         if(get_player().get_HP() <= 0)
         {
            outputText("被打败");
         }
         else
         {
            outputText("发情");
         }
         outputText("面对对手，你根本无力反抗，尤其是在这种姿势下，你别无选择，只能照她说的做。你的舌头如蛇般探出，试探性地舔了舔女武神湿润的阴道口。她的双腿早已被情欲浸透，刚一触碰她的阴唇，你的舌头上就沾满了她的爱液。[pg]");
         outputText("显然，这种试探性的舔弄并不能满足这位女战士；她蹲得更低了，湿润的小穴在你的脸上摩擦。你喘息着，试图在她的攻势下呼吸，但她不断的摩擦和移动让你感到困难。你无奈地抓住她的臀部稳住她，然后将舌头尽可能深地探入她的小穴。女武神呻吟着，抓住你的肩膀稳住自己，你开始认真地工作，快速地舔弄和轻咬她的阴唇。[pg]");
         outputText("很快，你的脸上就沾满了她的淫液，当你用舌头操她时，你能感觉到这个长着翅膀的俘虏开始颤抖。你加倍努力，希望能尽快让她高潮。你尽可能地抬起头，让她坐在上面，让你的舌头能清楚地对准她那小小的阴蒂。你把嘴唇贴在上面，用力吸吮她的阴蒂，同时用湿润的舌头在上面舔舐。[pg]");
         outputText("作为回报，女武神发出一声尖叫，一股淫液从她湿滑的小穴中喷涌而出，溅在你的胸口和脖子上。女孩呻吟着，抓住你的肩膀，将臀部猛地撞向你的脸，在你身上摩擦，直到你完全被她的淫液浸透。当她结束时，你被你们两人周围浓烈的麝香和性爱的气味熏得头晕目眩，但她终于放开了你，站了起来。[pg]");
         outputText("[say: 哼，对于一个好色的变态来说，还不错，]她笑着，笨拙地试图整理她湿透的裙子。[say: 也许……也许我以后还会让你再做一次。如果你运气好的话。][pg]");
         outputText("还没等你回答，她就伸手从你身上拿走了 " + _loc1_ + " 颗宝石，然后飞向天空。你也被自己的情欲弄得半晕，踉踉跄跄地站起来，回到了营地。[pg]");
         dynStats(DynStat.Lust(50));
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - int(_loc1_));
         get_combat().cleanupAfterCombat();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function loseToValkyrie() : void
      {
         clearOutput();
         outputText("无法抵抗");
         if(get_player().get_HP() <= 0)
         {
            outputText("她的猛攻");
         }
         else
         {
            outputText("你不断上升的欲望");
         }
         outputText("，你跪倒在地，完全任由女武神摆布。她将长矛插在地上，离你的头只有几英寸，然后用脚将你翻转过来，让你仰面朝天。[pg]");
         if(get_monster().get_lust100() >= 70)
         {
            loseToValkyrieForcedOral();
         }
         else
         {
            outputText("她轻蔑地一脚踢在你的头上，直接把你踢晕了。");
            outputText("在寒冷中暴露了这么长时间后，你彻底冻僵了。");
            if(get_player().get_str100() > 50)
            {
               dynStats(DynStat.Str(-1));
            }
            dynStats(DynStat.Str(-1));
            if(get_player().get_spe100() > 50)
            {
               dynStats(DynStat.Spe(-1));
            }
            dynStats(DynStat.Spe(-1));
            get_combat().cleanupAfterCombat();
         }
      }
   }
}

