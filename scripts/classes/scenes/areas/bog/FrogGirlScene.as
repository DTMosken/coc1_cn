package classes.scenes.areas.bog
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Output;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.AnalPregnancy;
   import classes.scenes.Camp;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.bog._FrogGirlScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class FrogGirlScene extends BaseContent implements TimeAwareInterface, Encounter, SelfDebug, SelfSaving, AnalPregnancy, VaginalPregnancy
   {
      
      public static var NOSEX:int = 0;
      
      public static var RAPED:int = 1;
      
      public static var VAG:int = 2;
      
      public static var NONVAG:int = 3;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var outputGui:GuiOutput;
      
      public var globalSave:Boolean;
      
      public function FrogGirlScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "froggirl";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null);
         super();
         outputGui = param1;
         PregnancyProgression.registerVaginalPregnancyScene(25,23,this);
         PregnancyProgression.registerAnalPregnancyScene(25,23,this);
         pregnancy = new PregnancyStore(2738,2739);
         SelfSaver.register(this);
         DebugMenu.register(this);
         CoC.timeAwareClassAdd(this);
      }
      
      public function voluntarilyGetEggedEpilogue() : void
      {
         clearOutput();
         outputText("一小时后你醒了过来，花了好一会儿才想起发生了什么。渐渐地，你拼凑出了过去一小时的记忆，想起了蛙女、她催眠的歌声和致幻的粘液。你仰面漂浮在一个清澈见底的水池里，在你上方，在红树林树冠之间，玛瑞斯的天空在头顶高处慵懒地漂浮着。");
         outputText("[pg]还有那些卵。哦，见鬼，那些卵！你在水里扑腾着，稳住身子，低头看着自己肿胀的肚子。你看起来像怀孕九个月了！蛙女真的接受了你的提议，你的肚子不舒服地凸了出来。你似乎也无法把它们逼出来——看来你只能把这些卵怀到足月了。");
         outputText("[pg]你双臂环抱着沉甸甸的肚子，爬出了水池。水从你赤裸的身体上流下，将最后的粘液留在了不再清澈的水中。");
         outputText("[pg]你有些费力地将[armor]穿在巨大的肚子上，然后冒险返回营地，虽然感觉有点酸痛，但为自己帮助了一位需要帮助的母亲而感到自豪。");
         get_player().buttKnockUp(23,30,1,1);
         dynStats(DynStat.Sens(1),DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function vaginalBirth() : void
      {
         get_images().showImage("birth-froggirl-vag");
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("[pg]你感到腹股沟处传来一阵可怕的压力……接着是伴随着肉体撕裂的难以置信的疼痛。你低下头，看到：一个阴道。");
            get_player().createVagina();
         }
         else
         {
            outputText("[pg]当你感觉到熟悉的刺激性黏液顺着大腿流下时，你浑身一颤。");
         }
         outputText("随着你肿胀的肚子翻滚，对水的本能渴望传遍全身。");
         outputText("[pg]你尽可能快地挺着孕肚赶到营地溪流的岸边，扑通一声跳进齐腰深的水中。当你把[ass]靠在河床光滑的石头上时，凉爽的溪水缓解了你的急迫感。你呻吟着闭上眼睛，捂住肚子，双腿间传来一阵剧痛。");
         outputText("[pg]在疼痛完全爆发之前，你感觉到小穴处传来一阵凉意。熟悉的青蛙黏液涂抹在你的阴道上。你再次呼吸顺畅，低头看到青蛙女孩的头就在水面下。粉红色的头发在水流中慵懒地漂浮着，她的头在你双腿间上下浮动。当你感觉到更多她那令人神魂颠倒的黏液附着在你的下体时，你叹了口气。");
         outputText("[pg]当黏液开始麻痹你的小穴时，她的头从水里冒了出来。");
         outputText("[pg][say:我不经常这样产卵，]她说着，把舌头吸回嘴里。[say:所以我想过来看看，确保一切顺利。]");
         outputText("[pg]你刚来得及简短地向她道谢，就感觉到臀部下方传来巨大的压力。你向后仰起头，惊讶地发现青蛙女孩的手在那里，正捧着你的[hair]。");
         outputText("[pg][say:放轻松，亲爱的，]她喃喃地说着，倾身向前，将嘴唇贴在你的嘴唇上。当她的舌头滑入你的嘴里时，你惊讶地眨了眨眼。那个肌肉发达的器官在你的双唇间蠕动，而她的另一只手则轻轻地抚摸着你的喉咙。");
         outputText("[pg]你条件反射地咽了一下，吞下了一大口她的黏液。你立刻感到头晕目眩，轻声呻吟着，四肢感到一阵熟悉的无力。她的舌头从你嘴里滑出，留下一缕黏液顺着你的下巴流下。");
         outputText("[pg][say:让我们放松你的肌肉，释放你的心灵，亲爱的，]青蛙女孩微笑着说。你试图把注意力集中在她身上，但你的眼睛似乎不受控制地对眼又分开。她湿滑的嘴唇再次贴在你的嘴唇上，你感觉到一大股黏液强行进入你的嘴里，她肌肉发达的舌头紧随其后。");
         outputText("[pg]由于缺乏抵抗的肌肉控制力，你咽了下去，你的视野变得明亮，闪烁着跳舞的光点和旋转的色彩。你几乎感觉不到她的嘴唇离开，但你感觉到黏液顺着你的下巴流到你的[chest]上。");
         outputText("[pg]当你向前倾身咯咯笑时，你周围的森林变得天翻地覆，你试图弄清楚发生了什么。你感觉到你的小穴被撑得越来越大，但没有疼痛，只有温暖的麻木和眼角快乐的云彩。在你的双腿之间，你看到青蛙女孩的指尖推开你的阴唇，轻轻地托住葡萄柚大小的卵，看着它们从你的身体里挤出来。");
         get_player().cuntChange(80,true,true,false);
         outputText("[pg]你数不清有多少软乎乎的卵穿过你的阴道，你的注意力被它们在水中上下浮动的迷人方式所吸引，它们被固定在青蛙女孩的身边。");
         outputText("[pg]你甚至不记得自己晕过去了，只记得在熟悉的哼唱声中醒来。当你睁开眼睛时，空气中弥漫着迷人的鸟鸣声合唱。你眨了眨眼，让视线变得清晰，发现自己躺在河岸的蕨类植物上。");
         outputText("[pg][say:抱歉，我们吵醒你了吗？]青蛙女孩的声音问道。你撑起身子，看到她漂浮在溪流中央，周围环绕着六个青蛙女孩若虫。从腰部以上看，她们是母亲的微缩版，有着不同颜色的头发，但从腰部以下看，她们就像大蝌蚪。她们只有几英尺长，在母亲指挥她们唱歌时，在母亲身边上下浮动。");
         outputText("[pg][say:我只是留下来确保你没事，]她说。");
         outputText("[pg]水中的若虫都转向你，睁大眼睛，兴奋地呱呱叫着。");
         outputText("[pg][say:还要确保你得到适当的感谢，]她说。[say:女孩们？]");
         outputText("[pg][say: 谢谢你，小姐！]她们异口同声地喊道，随后咯咯地笑了起来。");
         outputText("[pg]你虚弱地笑了笑，想知道青蛙黏液是否还在影响你。");
         outputText("[pg][say: 好了！我们该走了，]青蛙女孩说道。在照顾小家伙们的时候，她看起来稳重多了。");
         outputText("[pg]她对你眨了眨眼，说道：[say: 你知道的，她们很快就会长大——所以欢迎随时来沼泽帮忙孵下一批！]");
         outputText("[pg]伴随着扑通一声，她潜入水中，她的孩子们也紧随其后。她们游过的涟漪顺流而下，直到她们消失在视线中。");
         outputText("[pg]你坐起身来，疲惫地摇了摇头，脑袋还在微微发晕。");
         outputText("[pg]你皱着眉头，动身返回营地，希望青蛙黏液没有对你造成永久性的影响。");
         if(get_player().vaginas[0].vaginalWetness < 5)
         {
            var _temp_1:* = get_player().vaginas[0];
            _temp_1.vaginalWetness = _temp_1.vaginalWetness + 1;
            outputText("很快就清楚了。<b>你的小穴比以往任何时候都要湿润。</b>");
         }
         if(get_player().hips.rating < 25)
         {
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + 1;
            outputText("你的[hips]也变得更加丰满。");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:Boolean = false;
         if(get_player().get_pregnancyIncubation() == 8)
         {
            if(get_player().hasVagina())
            {
               outputText("[pg]你的肠胃翻江倒海，伴随着吧唧一声，一股透明的粘液从你的[vagina]喷涌而出。你立刻跪倒在地，湿漉漉地落在粘液中。周围的世界短暂地闪烁着令人难以置信的色彩，你听到有人在咯咯地笑。");
               outputText("[pg]过了一会儿，你意识到那是你。");
               if(get_player().hasVagina())
               {
                  outputText("黏液贴着你的[vagina]，感觉既温暖又冰冷，引诱你的[clit]产生令人愉悦的颤栗。");
               }
               else if(get_player().balls > 0)
               {
                  outputText("涂满致幻的青蛙黏液，你的蛋蛋一阵刺痛，将温暖的快感脉冲一路送入你的大脑。");
               }
               else
               {
                  outputText("你的[vagina]开始抽搐，渴望着有什么东西能一遍又一遍地插进去。");
               }
               outputText("坐在自己的黏液中，你轻声呻吟，双手忍不住在自己身上游走。");
               dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
               _loc1_ = true;
            }
            else
            {
               outputText("[pg]你的肠胃翻江倒海，但过了一会儿就平静下来了。之后你的肚子似乎变得更大、更沉重了，就像你正在被液体填满，却没有任何排出的途径。你突然怀疑失去小穴是不是个好主意。");
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      public function updateAnalPregnancy() : Boolean
      {
         if(get_player().get_buttPregnancyIncubation() == 8)
         {
            outputGui.text("[pg]你的肠胃翻江倒海，伴随着一阵吧唧声，一股透明的史莱姆黏液从你的屁股里喷涌而出。你立刻跪倒在地，湿漉漉地跌落在黏液中。周围的世界短暂地闪烁着不可思议的色彩，你听到有人在咯咯地笑。\n\n过了一会儿，你才意识到那是你自己在笑。");
            if(get_player().hasVagina())
            {
               outputGui.text(" 史莱姆紧贴着你的[vagina]，感觉既温暖又冰冷，诱哄着你的[clit]发出令人愉悦的颤抖。");
            }
            else if(get_player().balls > 0)
            {
               outputGui.text(" 涂满致幻青蛙史莱姆后，你的蛋蛋一阵刺痛，将温暖的快感脉冲一路送入你的大脑。");
            }
            else if(get_player().hasCock())
            {
               outputGui.text(" 史莱姆溅在你的" + get_player().multiCockDescriptLight() + "下方，留下一种温暖、渗出的感觉，让你只想一遍又一遍地摩擦[eachCock]。");
            }
            else
            {
               outputGui.text(" 你的屁眼开始抽搐，渴望有什么东西能一遍又一遍地穿过它。");
            }
            outputGui.text(" 坐在你自己的史莱姆里，你轻声呻吟，无法将手从自己身上移开。");
            dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
            return true;
         }
         return false;
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() <= 0)
         {
            _temp_1.eggCount += 5 + Utils.rand(4);
            pregnancy.knockUpForce();
         }
         return false;
      }
      
      public function teachDatFrogALesson() : void
      {
         clearOutput();
         get_images().showImage("froggirl");
         if(get_player().get_inte() < 20)
         {
            outputText("这个青蛙婊子在引诱人时需要小心点。");
            outputText("[pg]你这么说着，跳进水里，水没过腰部，大步走向蛙女，抓住她的手腕。由于怀孕而行动迟缓，她似乎无力反抗。");
            outputText("[pg]你的手在发麻，但这并不能阻止你把这个蛙女按倒，在紫橙色的水里……在面包做成的树下……用假阳具狠狠地操她？");
            outputText("[pg]你踉跄着后退，捂着头，不小心把手上的粘液抹在了脸上。为什么你能……听到颜色？");
            outputText("[pg]那只青蛙女孩在池塘对面怒视着你。她看起来就像一个愤怒色彩的万花筒，所有的颜色都在旋转。快得让你眼睛都跟不上，她的舌头在空中挥舞，湿漉漉地拍在你的脸上。");
            outputText("[pg]这并没有带来真正的疼痛，只是更多的黏液，当世界开始倾斜时，你抓住树池的边缘来稳住自己。你闭上眼睛片刻，试图让世界停止旋转，然后沉入池中。");
            outputText("[pg]当你再次睁开眼睛时，青蛙女孩正站在你上方。她身后的天空看起来像着火了，她身上覆盖着旋转的光芒。[say: 好吧，我承认，我是一个糟糕的母亲，但我很确定你会更糟，]她气呼呼地说，再次用舌头拍打你的脸。");
            outputText("[pg]颜色、光线和声音爆发出来，你晕了过去，再也无法承受。");
            menu();
            addButton(0,"继续",lessonFollowup);
         }
         else
         {
            outputText("你绝不是一个可以随意摆布的受害者。对于她试图用这种卑劣手段引诱你，你会给她远超她预期的教训，于是你迅速推开池塘的浅水区。被你咄咄逼人的举动惊动，青蛙女孩防御性地举起双手。");
            outputText("[pg][say: 等等，不，不要！]她恳求道，但你无视了她的痛苦。");
            outputText("[pg]你抓住她的手腕，拉扯她的身体，直到她在水中跌倒。她黏滑皮肤的感觉立刻渗入你的手，导致你的头皮发热，视线扭曲，你后退一步，评估这种感觉。毫无疑问，她的身体一定覆盖着某种致幻毒素。青蛙女孩看着你，怯生生地保持着你离开她时的姿势；也许她希望毒素能在你造成任何伤害之前压倒你。用你未受污染的手，你揉了揉太阳穴，再次让自己平静下来。");
            outputText("[pg]青蛙眨了眨眼，问道：[say: 一句“对不起”和“再见”够了吗？]");
            outputText("[pg]你不能依靠性侵犯她来报复她。[if (isunarmed) {手里没有武器可以打她，你想你可以在泥里找块石头，足以|你的[weapon]可以轻易地}]将她击倒。或者只是吓唬她。");
            saveContent.taughtLesson = 1;
            menu();
            if(get_player().get_weapon().isWhip())
            {
               addNextButton("鞭打",lash).hint("想在她身上爽一把是没戏了，但你手里的[weapon]可不介意沾点黏液。");
            }
            else
            {
               addNextButton("杀死",kill).hint("想在她身上爽一把是没戏了，但你手里的[weapon]可不介意沾点黏液。").hideIf(get_player().isUnarmed());
            }
            addNextButton("吓唬",scare).hint("心意到了就行——让她感受到死亡的威胁就够了。");
            setExitButton("离开",lessonLeave);
         }
      }
      
      public function tadpoleFinger() : void
      {
         clearOutput();
         outputText("继续抚摸着你的小蝌蚪，你突然有了一个主意，开始摩擦她的腹部。她似乎开心地绕着你的手指打转，也许很享受你对她仍在发育的身体提供的温柔触碰。你最终发现了一个非常小的洞，那里肯定塞不进你的任何一根肉棒。");
         outputText("[pg]虽然有些失望，但你还是小心翼翼地用最小的手指戳向那个肯定未被探索过的入口。当你感觉到指尖慢慢撑开那极小的入口时，小蝌蚪的尾巴甩动了起来。在充分的安抚下，你勉强将小指的一点点滑入蝌蚪的小穴中。你轻轻地将指尖在她小小的身体里抽插。她的内壁挤压着你，这只蝌蚪似乎在扭动着，试图将你的手指夹在里面。");
         outputText("[pg]她继续奇怪地扭动着，直到你感觉到她的小穴紧缩，整个身体都在颤抖。在她停止颤抖的瞬间，她将你的手指从她的小穴中拔出，以惊人的速度游走了。也许她被自己身体的反应吓到了？你决定不再多想，回到泥泞的岸边，希望你没有吓坏你正在发育的青蛙女孩。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tadpole() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {脱个精光，把你的[armor]扔到一边，然后}]涉水走进凉爽的水中，你那些咯咯笑的女儿们正在那里欢快地玩耍。当你走向其中一个时，你感觉到有什么柔软黏滑的东西在调皮地撞击你。低头一看，你发现了一只看起来相当大的蝌蚪，于是用指尖轻轻地碰了碰它。它的皮肤滑溜溜的，你忍不住注意到她多么开心地在你的手指上蹭来蹭去……");
         menu();
         addNextButton("口交",tadpOral).hint("向她介绍你的肉棒。").sexButton();
         addNextButton("手指",tadpoleFinger).hint("挑逗你女儿的小穴。");
      }
      
      public function tadpOral() : void
      {
         clearOutput();
         outputText("感觉心脏在胸腔里狂跳，你用力咽了口唾沫，然后把你的[cock]推向那只蝌蚪的脸。她黏滑的身体在你的肉棒上撞了几下，但你很快就设法顶上了她那张宽得出奇的嘴。感受到龟头被她那美妙的大嘴含住时，你的下身不由得颤抖起来。小蝌蚪的尾巴来回摆动、拍打着，舌头则缠上了你抽动的阳具。");
         outputText("[pg]你发出一声轻柔的呻吟，当那天真的蝌蚪贪婪地吸吮着你的[cock]时，你的臀部本能地挺动着。你非常小心地挺动腰部，轻轻地将你的性器在女儿未成熟的小嘴里抽插。每次你拔出来时，她都会相当调皮地追上来，再次吞下你的肉棒。那冰凉的吸吮感让你的[if (hasballs) {[balls] quiver|abdomen warmly tighten}]，以回应你不断逼近的高潮。");
         outputText("[pg]你的小女孩将整个身体向前推，甩动着尾巴，试图完全吞下更多她[daddy]的[cock]。就在她这么做的那一刻，你感觉到精液顺着你颤抖的肉棒涌上，淹没了你正在发育的孩子的小嘴。你仰起头呻吟着，射出一股又一股的精液，直接灌进这只蝌蚪的嘴里，随后她吐出了你仍在抽搐的性器。她最后一次撞了一下你的肉棒，然后转过身，迅速游离了你。");
         outputText("[pg]你感到一种奇异的满足，回到泥泞的岸边[if (!isnaked) {，捡起你的[armor]后离开|，暂时让你的孩子们独自待着}].");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoYesSub() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {脱下你的[armor]并}][if (isbiped) {跪在|摆好姿势站在}]不耐烦地对你呱呱叫的蛙女身后。她向后爬了一点，让你的[cock]刚好抵在她丰满的臀瓣之间。她缓慢扭动丰满的臀部，让你的肉棒在她的双丘间滑动，这让你的心跳开始加速。她冰凉的皮肤上覆盖着一层薄薄的黏液，为你接下来的插入起到了润滑作用。你向后退了一点，抓住女孩的臀部，将你的[cockhead]对准她等待着的缝隙。当你慢慢分开她润滑良好的阴唇时，她可爱地呱呱叫了一声，被包裹的感觉让一阵阵美妙的快感传遍你的全身。");
         if(get_player().biggestCockLength() >= 10)
         {
            outputText("[pg]当你向蛙女体内推进得更深时，你的[cock]顶到了她柔软的子宫颈。很明显，蛙女天鹅绒般的爱之隧道无法完全容纳你，但这并不能阻止你紧紧抓住她充满母性光辉的腰肢，无情地试图将自己完全埋入她体内。每次你戳刺她的子宫时，她都会发出一连串听起来很兴奋的呱呱声，女孩显然很喜欢你试图穿透它的徒劳努力。当你粗暴地插入时，蛙女的小穴发出淫荡的吧唧声，这对你来说简直是天籁之音，她顺从的呜咽声更是让你备受鼓舞。当你一次又一次地用龟头戳刺她的子宫时，她的内壁令人愉悦地紧紧包裹着你的肉棒。她突然以一个几乎不可能的角度弓起背，发出一声响亮的、充满快感的呱呱声。你继续无情地捣弄着她被快感折磨的身体，用你的肉棒分开她紧缩的阴唇，让她黏糊糊的爱液溅到你的胯部。她在高潮时颤抖的身体榨取你的方式，让你勃起的肉棒因欲望而狂喜地抽动。");
         }
         else
         {
            outputText("[pg]她的内壁完全包裹住你的[cock]，就像戴着一双奢华的丝绸手套一样贴合。你的臀部紧紧贴着蛙女柔软的后部，她冰凉皮肤上的黏液蹭到了你身上。你收紧了对她充满女人味的腰肢的抓握，开始用力捣弄她，每次你的[hips]拍打在她颤动的屁股上时，都会发出响亮的啪啪声，在周围回荡。蛙女弓起背，她臀部浅绿色的皮肤因为你用力的撞击而迅速变成了刺痛的红色。她快乐地哀号着，因为你热情的动作，她几乎脸朝下摔进泥里。她的内壁突然紧紧包裹住你，她的身体在颤抖，这一定是她的高潮，她可爱地叫喊着、颤抖着。一想到很快就能用你所有压抑的欲望填满她，你勃起的肉棒就狂喜地跳动着。");
         }
         outputText("[pg]流经你下半身的温暖快感让你无法承受太久，你的[if (hasballs) {[balls]|小腹}]紧绷起来，准备释放你积蓄的精华。" + (get_player().hasKnot() && get_player().biggestCockLength() < 10 ? " 你的肉结在蛙女的入口处撞击了几次，让你觉得它可能进不去。但你坚持不懈，当它发出“啵”的一声挤过她的褶皱将你锁在里面时，她发出了一声微弱的呜咽。" : "") + " 她滑溜溜的内壁在你的[cock]周围快乐地颤抖着，当你的射精感涌上来时，你忍不住呻吟出声。伴随着最后一次[if (biggestcocklength >= 10) {将你的[cockhead]抵在她的子宫上|深入到你身体极限}]的冲刺，你咬紧牙关，将无数股浓稠的精液射入她颤抖的身体。蛙女在你的怀抱中瘫软下来，微弱地呜咽着，快乐地扭动着她丰满的臀部，感受着你将她填满。[if (cumhighleast) { 她柔软的腹部[if (cumveryhighleast) {因为你注入的精液量太大而迅速膨胀，让她看起来好像已经怀胎十月|因为你注入的精液而开始微微隆起]}。}]");
         outputText("[pg]你发出一声满足的叹息，[if (hasknot) {等待你的肉结消退后，才将|慢慢地将}]你疲软的阴茎从蛙女被填满的阴道中拔出。没有你托着她的臀部，她瘫倒在泥地里，大口喘着粗气，试图在你刚刚慷慨赐予她的强烈快感后平复呼吸。你注意到她微笑着看着你，同时抚摸着她乳白色的肚子，然后她摇摇晃晃地站了起来。在你从地上站起来后，她靠近你，在你的脸颊上印下了一个温柔的吻。然后她转身离开，在跳入水中之前，让你欣赏了一下她丰满的臀部。");
         outputText("[pg]现在只剩下你一个人了，你凝视着平静的水面片刻，然后离开了这个地方。");
         get_player().orgasm("Dick");
         knockUpSuwako();
         saveContent.submissive = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoWon(param1:Boolean) : void
      {
         clearOutput();
         outputText("你最终倒在地上，由于" + (param1 ? "流遍全身的痛苦" : "下半身的燥热") + "而无法继续战斗。青蛙女孩跳到你倒下的身体旁，把你翻过来，让你仰面躺着。[if (!isnaked) {然后她像孩子拆礼物一样脱下你的[armor]，毫不在意地把你所有的装备扔到一边。}]");
         if(get_player().hasCock())
         {
            outputText("[pg]看到你的包裹，她金色的眼睛几乎闪闪发光。她一刻也没有耽搁，骑在你身上，用她黏糊糊、长着蹼的手抓住了你的肉棒。她表情专注，长长的舌头挂在嘴角，将你的[cock]对准她的裂口。这个两栖女孩迫使你颤抖，你的[cockhead]粗暴地擦过她的阴唇，未能进入她的女性部位。她平复了沉重的喘息，再次将你对准，这一次，她慢慢放低丰满的臀部，让你深深滑入她的体内。");
            if(get_player().biggestCockLength() >= 10)
            {
               outputText("[pg]你的[cockhead]很快就抵到了蛙女的子宫颈，当她试图把你完全塞进去时，发出一声可爱的喘息。她无法将你的[cock]完全吞入，但她那湿滑的肉褶包裹住的部分，将无尽的快感火花传递到你的大脑。每次她用力将你的龟头顶在她的子宫上，弯曲你的肉棒时，你都会发出一声闷哼，很快你发现自己不由自主地摆动起臀部。每当你发出满足的声音时，她就会加快速度，显然很高兴听到你和她一样享受这一切。");
            }
            else
            {
               outputText("[pg]你的[cock]被蛙女湿滑的小穴完全吞没，让你浑身颤抖，舒服得呻吟出声。她丰富的淫液慷慨地涂满你的柱身，让你能轻松地在她的深处进出。你撑开她的内褶，享受着它们包裹你的方式，一波又一波无尽的快感直冲大脑。每次你将肉柱推入她体内时，她都会发出可爱的呜咽，每当你发出幸福的声音时，她都会为你摇摆臀部。你的肉棒跳动着，被她的内壁紧紧挤压，你觉得她可能是打算把你榨干。");
            }
            outputText("[pg]蛙女抓住你的手，将它们放在她柔软的乳房上，催促你抚摸她那覆盖着一层薄薄的冰凉黏液的胸部。她滑溜溜的奶子大得你的手都握不住，你的手指陷入了松弛的肉里。当你抚摸她那没有乳头的胸部时，她发出了一声可爱的呻吟。随着你即将释放，你的阴茎抽动着，你忍不住像狗一样喘着粗气。她一定意识到你快要高潮了，因为她粗暴地用她光滑的内壁摩擦着你的[cock]。一种本能的欲望笼罩了你的大脑，你配合着她的动作抽插，享受着她的女性私处淫荡地紧贴着你跳动的肉棒的感觉。你的精液开始涌上你的阴茎，让你的身体不受控制地颤抖，你咬紧了牙关。蛙女大声地呱呱叫着，向后仰起头，你的第一股精液终于直接射入了她的子宫。你看着她脸上淫荡的表情，她金色的眼睛也回望着你。");
            outputText("[pg]尽管她的体内因为纯粹的快感而痉挛，她还是不断地摇晃着臀部。你看到她眼中闪过一丝变态的神色，意识到她试图从你这里再榨取一次。她很容易就如愿以偿了，你的[cock]喷出了最后的一股，她用一声渴望的蛙鸣作为回应。一旦你用你[if (hasballs) {[balls]|body}]所能聚集的所有精液淹没了她，她就把你那根精疲力竭的肉棒从她滴水的阴户里滑了出来。你看到她把手放在她的裂缝上，拼命地想把你所有的精液都留在她体内。蛙女舔了舔你的脸，在你的脸颊上留下了一道黏液，让它感到刺痛。她呱呱叫着，向你展示了一个几乎是感激的表情，然后跳回水中，消失在水下。");
            outputText("[pg]你花了一点时间恢复体力，然后开始跋涉回营地。");
            get_player().orgasm("Dick");
            knockUpSuwako();
         }
         else
         {
            outputText("她那得意的脸扭曲成[if (isgenderless) {一种好奇的表情，她检查着你的胯部，寻找你丢失的生殖器。她甚至好奇地拍了拍你，然后看着你，又看了看你的胯部|一种恼怒的表情，因为她看到了你的[pussy]。她瞪着你，好像你做错了什么，她的肩膀耷拉着，这只能是失望}]。当你试图站起来时，你突然被她巨大的舌头击中脸部，强大的冲击力迫使你的后脑勺猛烈地撞在泥地上，你的视线很快就变暗了……");
            outputText("[pg]一段时间后你醒了过来，[if (!isnaked) {收拾好你的[armor]，然后}]花了一点时间从袭击中恢复过来。也许你应该再来这里教训一下那个蛙女？这是你以后回营地恢复体力时会考虑的事情。");
            get_player().takeDamage(150);
         }
         saveContent.lastEncounter = 1;
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoVaginal() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {脱下你的[armor]并}]靠近倒下的蛙女，她" + (get_monster().get_HP() < 1 ? "疲惫地盯着你" : "饥渴地盯着你的肉棒") + "。她似乎相当接受你爬到她身上，没有试图从你的束缚中挣扎出来。她赤裸的身体让你对她充满女人味的身材一览无余，你抚摸着她柔软的乳房，它们没有乳头，像她的肚子一样呈乳白色。你托起她沉甸甸的奶子，欣赏着它们的重量和晃动。当你轻轻地将手指按入那团软肉时，她发出一声欢快的呱呱声。");
         outputText("[pg]蛙女在你的抚摸下发出可爱的呻吟，为你张开她结实的双腿，露出她闪闪发光的肉缝。她用金色的眼睛盯着你，用她那长得离谱的舌头缠住你的[cock]，舌头上冰凉的粘液让你打了个寒颤。你看着她引导你来到她的入口，让你的龟头沿着她张开的肉缝摩擦，欢迎你的入侵。她那湿滑的感觉让你的阴茎颤抖，本能驱使你抓住她那充满母性的臀部，将自己挺进她湿滑的肉褶中。");
         if(get_player().biggestCockLength() >= 10)
         {
            outputText("[pg]她柔软的子宫颈很快就抵住了你的[cockhead]，阻止你完全没入她冰凉的通道中。每次你捅得这么深，这个两栖女孩的嘴里都会发出一声痛苦的“哦”。你惊人的长度让她的肚子凸起，她肉壁的褶皱摩擦着她能容纳下的你的每一寸。她紧紧地抱住你，当你肆无忌惮地将[cock]撞进她体内，用龟头直捣她的子宫时，她显然很高兴。[If (hasknot) {肉结肿胀的感觉让你难以维持节奏，因为你太大而无法与她锁结的事实让你心中闪过一丝沮丧。}]");
         }
         else
         {
            outputText("[pg]她的小穴很快就吞没了你的长度，你的臀部紧紧地贴着她那沾满粘液的丰满臀部。这个两栖女孩用她有力的双腿缠住你的腰，不让你把肉棒抽得太出。感觉到你的[cock]刮擦着她内部的肉褶，她可爱地喘息着。她通道的湿滑让你能随心所欲地快速用力冲刺。感觉到她紧紧挤压着你，你的阴茎随之跳动。每次你的胯部拍打在她的臀部上，她都会把你抱得更紧，将她柔软的胸部贴在你的[chest]上。[If (hasknot) {你的肉结撞击着她的阴唇，刺激着你，让你渴望尽快与她锁结。}]");
         }
         outputText("[pg]她抬起臀部迎合你果断的冲刺，淫荡地帮助你把[cock]推得更深。你能感觉到释放的时刻即将到来，你用力捏住她的臀部，在她闪闪发光的浅绿色皮肤上留下了青紫色的瘀伤。你只能再冲刺几下，随后你的肉棒一阵抽动，精液顺着你颤抖的肉柱喷涌而出。" + (get_player().hasKnot(get_player().biggestCockIndex()) && get_player().biggestCockLength() < 10 ? "你用[knotword]撞击她的阴唇，轻松滑入并让它肿胀起来，将自己与她锁结以确保受精。" : "") + "你和蛙女都在狂喜中颤抖，感觉到你的精液淹没了她等待着的子宫，她的脸因极乐而扭曲。[if (cumhighleast) {你注入的巨大精量让她的肚子胀得像怀孕了几个月一样。她温柔地抚摸着肚子，亲吻你的脸颊。也许是在欣赏你惊人的男子气概。}]");
         outputText("[pg]你[if (hasknot) {需要等待肉结消肿，然后才能}]将疲软的阴茎从她体内拔出，看着你的精液缓缓流出。她将带蹼的手放在胯部，似乎拼命想把你刚刚注入她体内的每一滴精液都留在里面。蛙女跳入水中，回头看了你一眼，似乎带着微笑，然后潜入水下。看到她离开了，你[if (!isnaked){收拾好衣服，}]返回营地。");
         get_player().orgasm("Dick");
         knockUpSuwako();
         saveContent.lastEncounter = 2;
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoTongue() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            outputText("你[if (!isnaked) {脱下你的[armor]，然后}]靠近倒下的蛙女，她" + (get_monster().get_HP() < 1 ? "看到你的阴茎时看起来没那么担心了" : "太沉迷于情欲的迷雾中，没有注意到你的靠近") + "。当你抓住她长长的舌头时，她试图无力地挣脱。那滑腻的器官差点从你手中滑落，但你设法将它缠绕在你勃起的长度上。你开始扭动臀部，将你的[cock]在滑腻的肌肉上摩擦。她滑腻的唾液可能是你用过的质量最好的润滑剂，也是你能在她口腔器官如此紧紧挤压你的情况下还能移动的唯一原因。令人惊讶的是，她开始自己动起来，套弄着你坚硬的工具。随着她迅速加快节奏，愉悦的呻吟从你的喉咙深处传出。你能感觉到你的阴茎[if (hasballs) { 和[balls]}]随着你即将到来的释放而跳动。");
            outputText("[pg]两栖女孩收紧了舌头对你长度的抓握，切断了你精液喷涌而出的冲动。还没等你抱怨，她就把你的[cock]塞进她冰凉的嘴里，一边给你口交，一边用她有力的舌头套弄你。你全身颤抖，沉浸在两种变态感觉交织在一起的愉悦中。你抓住她的头顶，用你的[hips]抽插来帮助她雄心勃勃的口交。当她的舌头松开对你的抓握时，你猛地向后仰起头，你的[if (virility > 50) {浓稠}]种子化作无数股绳索，直接涌入她的嘴里。她试图把你拔出来，但你紧紧抓住她的头，直到你用完她这个私人性玩具。");
            outputText("[pg]伴随着一声响亮的“啵”声，你拔出疲软的阴茎，你[if (!isnaked) {穿好衣服，然后}]看着蛙女迅速将你的种子吐到她带蹼的手里，并试图把它倒进她的缝隙里。虽然这一幕有点奇怪，但既然你已经发泄完了，你就离开了她。");
         }
         else
         {
            outputText("当你[if (!isnaked) {脱下你的[armor]，然后}]靠近倒下的蛙女时，她金色的眼睛依然冷冷地盯着你。你抓住她滑腻的舌头，她似乎试图在恐惧中挣脱。也许她担心你会对她攻击你的行为进行报复。不过，她显然缺乏逃脱你掌控的" + (get_monster().get_HP() < 1 ? "精力" : "意志") + "，因为你能轻松地将她的身体拖过泥地，让她再次靠近你。当你开始将她的舌头慢慢地在你的[if (hasvagina) {小穴|菊穴}]上摩擦时，蛙女获得了前排观看的特权。她的脸因明显的厌恶而扭曲，眼中燃起了仇恨的怒火。");
            outputText("[pg]她滑腻的器官在你的入口处戳刺的感觉，是一个太令人愉悦的机会，不容错过。她长长的舌头开始像蠕虫一样扭动，几乎拼命地想要避免插入你。你用双手稳住那根粗壮的器官，引导她走向你的[vagorass]，钝钝的舌尖轻松地滑入你渴望的身体。伴随着一声充满情欲的呻吟，蛙女的舌头推入你更深处，它表面覆盖的滑腻唾液帮助了插入。当它[if (hasvagina) {粗暴地戳刺你的子宫颈|完全填满你的[butt]}]时，你在狂喜中颤抖。");
            outputText("[pg]当你在肌肉抚摸你内壁的持续快感中呻吟时，你的伴侣显然在试图扭动和转动她的舌头，试图从你的深处逃脱，但无济于事。多亏了她徒劳的抵抗，她意外地带给你的感觉让你的视野中闪烁着白色的火花，快感麻木了你的大脑。随着蛙女试图挣脱，你的喘息声越来越大，但随着你体内热量的积聚，你的抓握现在像铁一样坚固。");
            outputText("[pg]舌头突然摩擦到了恰到好处的位置，迫使你在极乐中哀嚎并不受控制地颤抖。你的抓握只松开了一瞬间，让挣扎的蛙女从你的[vagorass]中滑落，伴随着水花跌回水中。她狠狠地瞪了你一眼，然后潜入水中消失在你的视线中。当你恢复镇定[if (!isnaked) {和装备}]时，你觉得蛙女可能不太乐意再次见到你。");
            _temp_1.analMad += 1;
         }
         get_player().orgasm("Generic");
         saveContent.lastEncounter = 3;
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoTalk() : void
      {
         clearOutput();
         outputText("你清了清嗓子，试图和她交换名字。青蛙女孩转过身来，挑起一根眉毛盯着你。她显然完全听不懂你在问什么。你又试了一次，这次语速放慢了些，作为回应，她也同样缓慢地呱呱叫了一声。她呱呱叫着，然后又用稍微不同的语调呱呱叫了一声，接着又继续把她圆润的屁股对着你。");
         outputText("[pg]很明显，你们之间存在语言障碍，迟早需要克服。");
         button(null,"交谈").disable();
         get_output().flush();
      }
      
      public function suwakoSubSex() : void
      {
         clearOutput();
         outputText("你盯着蛙女一丝不挂的身体，决定……");
         menu();
         addNextButton("阴道交",suwakoSubFuck).hint("以传教士体位操她。");
         addNextButton("肛交",suwakoSubAnal).hint("操她的屁眼。");
         addNextButton("口交",suwakoSubOral).hint("让她用那条舌头好好伺候你。");
         setExitButton("返回",submissiveSuwako);
      }
      
      public function suwakoSubOral() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {脱下[armor]，}]找了个不那么泥泞的地方躺下，让自己舒服些。蛙女饥渴地盯着你的[cock]，她对你的渴望显而易见，双腿不停地摩擦着。当她兴奋地试图主动骑上来时，你轻轻抓住她的臀部阻止了她。当你从她身下溜出，把她的头按向你的胯部时，她脸上明显的困惑消失了。当你把勃起的肉棒在她柔软却滑溜溜的脸颊上摩擦时，你能看到她开始对你嘟起嘴。");
         outputText("[pg]有那么一瞬间，你以为她不会顺从你的欲望，但她张开了嘴，突然用她那长得离谱的舌头紧紧缠住了你的肉棒。你颤抖着喘了口气，身体也跟着哆嗦起来，因为这青蛙女孩把你含进嘴里，开始给你进行一场湿漉漉的口交。你的肉棒[if (biggestcocklength >= 10) {撑起了她紧绷的喉咙，青蛙女孩的口腔器官勤奋地套弄着那些塞不进去的部分|消失在她的嘴里，每次她吞吐时脸颊都会鼓起来}]。她那热情的嘴里发出的淫靡水声在周围回荡，每次她有力的舌头摩擦你的[cock]时，它都会兴奋地跳动。");
         if(get_player().totalCocks() > 1)
         {
            outputText("[pg]你的第二根肉棒也没有被冷落，她那光滑的蹼手迅速握住了它。她用力地套弄了无数次，当它颤抖着滴下先列腺液时，你发出了一声饥渴的呻吟。");
         }
         if(get_player().cockTotal() > 2)
         {
            outputText("蛙娘用另一只手抓住你的第三根肉棒，像撸第二根一样快速地套弄着。一阵阵令人麻木的快感不规律地传遍你的全身，三根肉棒同时被取悦的感觉让你疯狂地颤抖。");
         }
         outputText("[pg]你无法控制自己全身的颤抖，一股令人愉悦的暖流在你的[if (hasballs) {[balls]|腹部}]积聚。青蛙女孩深情地凝视着你的眼睛，[if (cocks > 1) {取悦着你的每一根肉棒|勤奋地吸吮着你的肉棒}]，那姿态仿佛在乞求你终于将你的精液赐予她。她的舌头紧紧缠绕着你，榨取着不断涌出的精液，这种感觉很快就让你无法承受。伴随着一声充满情欲的闷哼，你感觉到你的[cock]在跳动和颤抖，精液喷涌而出。[if (cocks > 1) {你的肉棒将温暖的精液射在她丰满的乳房上，每一发都将她的身体涂抹得更加泥泞}]青蛙女孩继续吸吮着，贪婪地吸出了比你想象中还要多的精液，而你的心脏在胸腔里怦怦直跳。");
         outputText("[pg]她大声地将你疲软的肉棒从嘴里拔出，[if (frogpreg) {然后大口咽了下去|将精液吐在她长着蹼的手里。你看着她张开结实的双腿，小心翼翼地试图让每一滴精液都滴进她狭窄的缝隙里}]。感到满足后，你[if (!isnaked) {穿上你的[armor]，然后}]向青蛙女孩道别，她有些忧郁地呱呱叫了一声，作为对你离开的回应。");
         get_player().orgasm("Dick");
         knockUpSuwako();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoSubLeave() : void
      {
         clearOutput();
         outputText("你" + (saveContent.shownKids != 0 ? "站起身，" : "") + "看到蛙女伤心地低下头，似乎对你这么快就要离开感到失望。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoSubFuck() : void
      {
         clearOutput();
         if(saveContent.shownKids != 0)
         {
            outputText("你随意地将手伸进蛙女紧致的双腿间，指尖轻轻擦过她冰凉的阴唇。当你戏谑地捏住她勃起的阴蒂时，她浑身一颤，发出一声类似蛙鸣的呻吟。你的触碰让她的下体开始痉挛，她那响亮的、淫荡的爱液声足以证明她的兴奋。蛙女用渴望的眼神看着你，将她带蹼的手放在你的胯部，[if (!isnaked) {隔着衣服}]抚摸你的[cock]。你把手从女孩的双腿间抽出，将沾满爱液的手指放进她的嘴里，津津有味地看着她淫荡地吸吮，直到手指变得干干净净。");
            outputText("[pg]蛙女仰面躺下，向你抛了个调皮的媚眼，同时张开双腿，露出她那早已水光泛滥的小穴。你自然不会让她失望，[if (!isnaked) {脱下你的[armor]并}]将自己置于这只发情的两栖动物迷人的双腿之间。你轻轻地将一只手放在女孩的[if (frogpreg) {怀孕的肚子上，感受着她的子宫已经有多么饱满|平坦的肚子上，短暂地想知道它什么时候会再次隆起}]。她可爱地呱呱叫着，扭动着丰满的臀部，让你的勃起在她湿滑的阴唇上滑动。看到她如此渴望你进入她的身体，你将你的[cockhead]放在她抽搐的入口处，这让女孩淫荡地微笑着，期待着即将到来的插入。");
            if(get_player().biggestCockLength() >= 10)
            {
               outputText("[pg]当你轻松地将勃起的阴茎推入她湿润的褶皱，并将她的爱之隧道撑到极限时，蛙女发出了愉悦的呻吟。她的子宫颈很快阻止了你的前进，你的龟头猛地压在上面，导致她全身颤抖。当你试图用果断的抽插将你的[cock]完全插入她体内时，蛙女只能颤抖，她的子宫拒绝你进入她[if (frogpreg) {已经被占据的}]育儿室。当你猛烈撞击她时，她那兴高采烈的表情进一步激发了你的动作。");
            }
            else
            {
               outputText("[pg]当你的[cock]完全消失在她热情的深处时，蛙女发出了一声淫荡而愉悦的呻吟。你的[hips]撞击她的臀部，发出响亮的啪啪声，在周围回荡。每次你的[cockhead]刮擦她的褶皱时，她都会可爱地喘息和娇喘，让她体内围绕着你痉挛。当你一波又一波的快感传遍她的身体，并完全将她占为己有时，蛙女只能在你身下扭动。");
            }
            outputText("[pg]感受着她体内收紧和痉挛来按摩你的阴茎，你忍不住呻吟起来。看着她[if (frogpreg) {怀孕的腹部与她肿胀的}]乳房一起淫荡地晃动。她的体内紧绷起来，紧紧地收缩在你的长度周围，这让你的[if (hasballs) {[balls]|cock}]因为即将到来的射精而跳动。" + (get_player().hasKnot(get_player().biggestCockIndex()) && get_player().biggestCockLength() < 10 ? " 本能驱使你与你的伴侣锁结，你的肉结在这位两栖女孩体内发出响亮的爆裂声。当她的阴道被撑到极限，感觉到你卡在她体内时，她痛苦地发出微弱的呜咽声。" : ""));
            outputText("[pg]你强健的种子冲上你的阴茎，淹没了蛙女[if (frogpreg) {已经被占据的|肥沃的}]子宫。每一股射出的精液都让你不受控制地颤抖。当她的内壁几乎吸干你所能给的每一滴精液时，你忍不住在快感中喘息。她拥抱着你[if (frogpreg) {，她那沉甸甸的孕肚紧贴着你赤裸的身体}]，而你则将她完全填满。她深情地吻着你，在每一个吻之间发出甜美的呱呱声，并扭动着她丰满的臀部，试图从你那里哄出更多的精液。");
            outputText("[pg]你感到完全精疲力尽[if (hasknot) {，只能等待你的肉结缩小，然后才能|，并}]慢慢地将你疲软的阴茎从她仍在收缩的小穴中拔出。蛙女温柔地抚摸着她[if (frogpreg) {已经怀孕的|目前平坦的}]肚子，一个可爱的微笑完美了她美丽的脸庞。当你从女孩身上滚下来躺在她身边时，她把头靠在你的胸前。你发现自己把她抱在怀里，她黏糊糊的皮肤帮助你在潮湿的沼泽中降温。不过她很快就从你身边拉开，在你的嘴唇上深情地吻了一下，然后跳回了水里。");
         }
         else
         {
            outputText("你[if (!isnaked) {脱下你的[armor]，并}]花了一点时间欣赏蛙女已经" + (saveContent.analMad >= 3 ? "向你展示她多汁的臀部" : "为你张开双腿") + "的景象。" + (saveContent.analMad >= 3 ? "虽然她已经预料到你会像往常一样操她的屁股，这诱惑着你去满足她的期望，但你今天想用正确的洞。当你让女孩仰面躺下时，她发出了一声明显带着困惑的呱呱声。" : "") + "爬到你的伴侣身上，你将自己定位在她结实的双腿之间，并开始戏弄地将你的[cock]在她光滑的阴唇上摩擦。蛙女可爱地呱呱叫着作为回应，当你的[cockhead]一次又一次地在她勃起的阴蒂上摩擦时，她兴奋地颤抖着。她湿滑的汁液很快慷慨地涂满了你的整个长度，让它即使在周围萤火虫提供的微弱光线下也闪闪发光。确信她现在准备好接受你进入了，你捏住她丰满的臀部，刺入她欢迎的阴道。");
            if(get_player().biggestCockLength() >= 10)
            {
               outputText("[pg]推开她滑溜溜的内褶，当你的龟头刺入她最深处时，你很快就到底了。她因为你的龟头不断撞击她的子宫而在快感中哀号。虽然你完全清楚你无法将你的长度完全塞进蛙女体内，但你仍然狂热地努力这样做。你不断威胁要闯入她最深处的房间，导致她的内脏在你周围收缩，这是一种徒劳的抵抗，只会让天堂般的快感冲击你的全身。");
            }
            else
            {
               outputText("[pg]推入蛙女滑溜溜的褶皱中，每次你的[hips]直接撞击她的臀部时，你都忍不住在喜悦中颤抖。当你一路撞进她颤抖的阴道时，她发出了可爱的呱呱声，女孩的整个身体都在美味的欲望中颤抖。当你的[cockhead]在她的内壁上摩擦时，她的小穴在你周围收缩，将你的先列腺液与她淫荡地挤压出的汁液混合在一起。你的爱人发出响亮的哀号，你充满激情的冲刺震撼了她的核心。");
            }
            outputText("[pg]她丰满的双乳随着你熟练的动作诱人地晃动着。你伸出一只手，抚摸揉捏着那柔软的乳肉。一阵突如其来的战栗传遍全身，你的[if (hasballs) {[balls]|阴茎}]因即将到来的高潮而剧烈跳动。" + (get_player().hasKnot(get_player().biggestCockIndex()) && get_player().biggestCockLength() < 10 ? "你的肉结撞击着蛙女湿润的阴唇，当它最终挤进去时，她发出一声呜咽。" : "") + "你咬紧牙关，强忍住呻吟，精液顺着你颤抖的肉棒喷涌而出，淹没了蛙女毫无防备的子宫。她的阴道壁不规则地收缩着，紧紧裹住你的肉棒，几乎榨干了你还在颤抖的阴茎里的每一滴精液。[if (cumhighleast) {女孩柔软的腹部[if (cumveryhighleast) {因为你注入的惊人精液量而淫靡地肿胀起来，毫无疑问，她的体内已经被填得满满当当|因为你注入的大量浓稠精液而开始微微隆起}]。}]你可以看到蛙女那长得不可思议的舌头从嘴角垂下，她淫荡的笑容清楚地表明，她很享受你射入她体内的每一股精液。");
            outputText("[pg]当你终于发泄完毕后，你[if (hasknot) {感觉你的肉结已经缩小到可以}]从她那正滴着精液的肉缝中拔出。当你试图从女孩身上下来时，她抱紧了你，开始在你的脖子上落下无数温柔的吻。她在每一个吻之间可爱地呱呱叫着，也许是在提前感谢你即将赐予她成为母亲的礼物。女孩最终还是停止了她那热烈的示爱，当你从她身上爬起并离开时，她露出了失落的神情。");
         }
         get_player().orgasm("Dick");
         knockUpSuwako();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoSubAnalLeave() : void
      {
         clearOutput();
         if(saveContent.shownKids != 0)
         {
            outputText("你心满意足地起身，把青蛙女孩留在泥地里。当你离开时，你能听到她因你的离去而发出悲伤的呱呱声……");
         }
         else
         {
            outputText("把[if (hasballs) {[balls]|精液}]都射进青蛙女孩体内后，你感到心满意足，便径直离开，留下她独自在泥地里抽泣。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoSubAnalCuddle() : void
      {
         clearOutput();
         if(saveContent.shownKids != 0)
         {
            outputText("躺在发抖的青蛙女孩身边，你把她拉近，紧紧地把她颤抖的身体抱在怀里。她发出一声轻柔的呱呱声，幸福地依偎着你，迷人的脸上带着微笑。很快她就不再颤抖了，因为你，她的身体放松了下来。当你们俩拥抱时，女孩把你的手放在她[if (frogpreg) {怀孕的肚子|平坦的肚子}]上。她的笑容令人心头一暖，你确信她[if (frogpreg) {喜欢她|期待着}]和你生更多的孩子。你把她紧紧抱在胸前一会儿，用手抚摸她潮湿的黑发，只是品味着她因为你温柔的抚摸而发出幸福的呱呱声。");
            outputText("[pg]在你起身离开之前，青蛙女孩用甜美的声音呱呱叫着，在你的嘴唇上印下温柔的一吻。当你离开前最后一次看着她时，她微笑着的脸庞仍然传达出对你离去的微妙悲伤。");
         }
         else
         {
            outputText("你没有丢下青蛙女孩不管，而是躺在她颤抖的身躯旁，将她揽入怀中。她在你的拥抱中不安地发抖，金色的眼眸流露出担忧，似乎害怕你还想再来一发，毕竟她的屁股可能还在隐隐作痛。虽然这确实是个诱人的想法，但你只是抚摸着她湿润的黑发，对她轻声说着甜言蜜语。女孩慢慢停止了颤抖，身体在你的怀里放松下来。当她试图靠得更近时，她那微凉肌肤上的黏液沾到了你身上，你确信她现在的担忧已经烟消云散了。");
            outputText("[pg]从她可爱脸庞上淡淡的微笑可以看出，她非常享受这段共处的时光，但你遗憾地明白，你很快就得离开了。当你试图起身时，青蛙女孩依依不舍地紧紧抱住你，发出低沉的呱呱声。当你依然从她身边抽身时，她那悲伤的表情让你感到一丝内疚。当你[if (!isnaked) {重新穿上[armor]|准备离开}]时，青蛙女孩吻了你，脸颊绯红。她发出一声轻柔的呱呱声，避开你的视线，然后伴随着一声响亮的[b:扑通]声跳入水中。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoSubAnal2(param1:Boolean) : void
      {
         clearOutput();
         if(saveContent.shownKids != 0)
         {
            if(param1)
            {
               outputText("伴随着一声野兽般的低吼，你将你的[cock]深深地猛插入女孩痉挛的肛门，她发出一声微弱的痛苦呱呱声。你仰起头，感觉自己仿佛置身天堂，而她的内脏则贪婪地榨取着你的长度。你的每一股精液几乎都是从你体内吸出来的，她抽搐的肛门吞咽着每一滴精液。[if (cumhighleast) {你注入她体内的精液量之大，让她[if (frogpreg) {已经怀孕的}]肚子都鼓了起来。}]");
            }
            else
            {
               outputText("你颤抖着，将你的[cock]从她紧致的肛门中拔出，转而猛插入她湿滑的阴道。她小穴天鹅绒般的内壁紧紧包裹着你的肉棒，欢迎你的入侵，简直是在乞求你充满活力的精液快点淹没它。青蛙女孩的小穴很快就如愿以偿了，一股温暖的快感迫使你的身体颤抖，将你的精子从你的[if (hasballs) {[balls]|cock}]中喷涌而出，去迎接她等待的卵子。[if (frogpreg) {她圆鼓鼓的肚子清楚地表明，你的小蝌蚪们可能会有点失望地发现，这个女孩可能已经怀孕到极限了。}]");
            }
            outputText("[pg]当你终于完成充满活力的射精时，你轻轻地将你的长度从青蛙女孩仍在颤抖的身体中拔出。她不受控制地颤抖着，她的肛门仍在因为刚才的折磨而抽搐。女孩温顺地呜咽着，擦拭着泪汪汪的眼睛，深吸着气。");
         }
         else if(param1)
         {
            outputText("你最后一次粗暴地深深刺入她的直肠。那决定性的最后一下抽插，伴随着她紧绷的肛门内壁紧紧包裹着你的感觉，从你充满快感的身体中诱导出了浓稠的精液。[if (cumhighleast) {她的肚子[if (cumveryhighleast) {因为你注入她屁股里的大量强效精液而迅速膨胀，大到让你想起一个怀孕最后一个月的女人|因为你迅速淹没她屁股的大量强效精液而开始微微凸起}]。}]");
            outputText("[pg]青蛙女孩只能在你紧紧抓住她臀部的手中颤抖，尽管她发出悲伤的呜咽，她的肛门还是急切地榨取着你。当你终于排空精液时，你松开了对女孩的束缚，她可怜地瘫倒在泥泞中。她蜷缩起来，可怜地抽泣着，她的身体因为粗暴的对待而发抖。");
         }
         else
         {
            outputText("决定给她想要的，你将你的肉棒从她紧缩的肛门中猛地拔出，你突然的退出迫使她发出一声呜咽。你用力撸了几下你的[cock]，将你的[cockhead]推过她的入口。当你的精子淹没多产的青蛙女孩的小穴时，一股温暖的快感流遍你的全身，直达你的大脑。[if (cumhighleast) {她的肚子[if (cumveryhighleast) {因为你注入她屁股里的大量强效精液而迅速膨胀，大到让你想起一个怀孕最后一个月的女人|因为你迅速淹没她屁股的大量强效精液而开始微微凸起}]。}]");
            outputText("[pg]青蛙女孩在你紧紧抓住她丰满臀部的手中颤抖着，不过当你决定松开她时，她发出一声温顺的呜咽，倒在泥泞中。她轻轻抚摸着她乳白色的肚子，当她蜷缩起来时，脸上交织着痛苦和遗憾。");
            outputText("[pg]你可以听到她在颤抖时发出微弱的抽泣声……");
         }
         get_player().orgasm("Dick");
         _temp_1.analMad += 1;
         saveContent.lastEncounter = 3;
         menu();
         var _loc2_:String = saveContent.shownKids != 0 ? "你想要拥抱。" : "温柔地拥抱她，直到她平静下来。";
         addNextButton("拥抱",suwakoSubAnalCuddle).hint(_loc2_);
         var _loc3_:String = saveContent.shownKids != 0 ? "该走了。" : "她会挺过去的。";
         addNextButton("离开",suwakoSubAnalLeave).hint(_loc3_);
      }
      
      public function suwakoSubAnal() : void
      {
         var ass1:Boolean;
         var _g1:FrogGirlScene;
         var ass:Boolean;
         var _g:FrogGirlScene;
         clearOutput();
         if(saveContent.shownKids != 0)
         {
            outputText("当你盯着这只[if (frogpreg) {怀孕的}]青蛙女孩完全赤裸的身体时，你感到你的男根色情地抽动了一下。顺从于你那变态的欲望，你把一只手放在女孩的下巴下，把她的脸转向你。她看着你的眼睛，当你的嘴唇温柔地触碰她的嘴唇时，她发出一声呜咽。你一只手放在她丰满的臀部上，另一只手揉捏着她柔软的乳房。手指微微陷入她乳房软肉的触感只会让你的欲望更加强烈。进一步加深这个吻，她任由你的[tongue]侵入她的小嘴，并笨拙地试图模仿你的动作。当你退开时，青蛙女孩试图追逐你的嘴唇，她红扑扑的脸上露出了失望的表情。");
            outputText("[pg]你[if (!isnaked) {脱掉衣服，}]让青蛙女孩四肢着地，指示她把丰满的屁股高高翘起。你来到她身后，抓住她丰腴的胯部，把你的[cock]放在她漂亮的臀瓣之间。她天生黏滑的皮肤帮你用臀缝摩擦着整根肉棒。美妙的触感诱得几滴先列腺液从你的[cockhead]滴落到她身上。虽然光是这样蹭下去就足以让你射出来，但你还是决定进入正餐。你双手按在青蛙女孩圆润的臀肉上，手指轻轻陷进她的屁股里，将她的大屁股掰开。她的肛口在你面前一张一合，简直像是在求你随心所欲地使用它。当你开始把龟头抵上她的屁眼时，青蛙女孩害怕地回头看向你。你开始慢慢挤进去，她的脸因疼痛而皱成一团。泪水顺着她的脸颊流下，她紧紧闭上眼睛，准备迎接你无可避免的进入。");
            outputText("[pg]你顶开她抗拒的肛门环，让这只绿色两栖姑娘发出一声痛苦的呱鸣，听起来就像尖叫。" + (saveContent.analMad >= 3 ? "尽管她的肛门已经习惯被你彻底操弄，仍然剧烈收缩，试图" : "她的肛门紧紧包住你的肉棒，剧烈收缩着，试图") + "把你挤出去。你把[cock]狠狠顶进她绷紧的肛门里，她凄惨的呱叫也越来越响。你的每一次抽插都让你的[if (hasballs) {[balls]|腹部}]绷得越来越紧。你的阳物[if (biggestcocklength >= 10) {没法完全塞进她体内，但她的内壁仍愉悦地裹住能容纳的部分。每当你的龟头顶到最深处，她圆润的屁股都会美妙地颤动起来|没入她体内，你的[hips]重重撞在她圆润的屁股上，发出响亮的拍击声，让那臀肉诱人地颤动起来}]。你狂热的动作让女孩的[if (frogpreg) {高高隆起的孕肚和}]丰满乳房也跟着晃动不已。");
            outputText("[pg]当你将阴茎压入青蛙女孩痉挛的肛门时，她痛苦的叫声已经变成了几乎听不见的呜咽。她仍然没有试图从你的抽插中挣脱，只是承受着你的捣弄，努力取悦你。你的肉棒抽动着，极乐的快感冲击着你的大脑，催促着你的精液顺着你勃起的阴茎喷涌而出。");
            outputText("[pg]你只有片刻的时间来决定射在哪里。");
         }
         else
         {
            outputText("你[if (!isnaked) {脱下你的[armor]并}]享受着青蛙女孩顺从地" + (saveContent.analMad >= 3 ? "向你展示她诱人的臀部" : "为你张开她可爱的双腿") + "。当你只是站在那里用审视的目光看着她时，她发出一声奇怪的呱呱声，金色的眼睛清楚地传达出她紧张的情绪。你没有让女孩被担忧所困扰，而是" + (saveContent.analMad == 0 ? "让她四肢着地，将自己置于她正后方。她兴奋地呱呱叫着，扭动着圆润的屁股，完全不知道你即将征服她的[b:另一个]洞的意图" : (saveContent.analMad >= 3 ? "将自己置于她身后。她有些忧郁地呱呱叫着，皱着眉头的脸清楚地表明她对自己的屁股再次被使用是多么的不情愿" : "让女孩四肢着地，这样她整个屁股就翘了起来。她温顺地呱呱叫着，显然对你再次侵犯她的屁股并不热衷")) + "。将你的[cock]放在她柔软的臀瓣之间，你开始在它们之间缓慢地摩擦。你坚硬的勃起现在几乎流出了先列腺液，与覆盖在她浅绿色皮肤上的天然粘液混合在一起。");
            outputText("[pg]现在你的心脏在胸腔里砰砰直跳，你掰开女孩的臀瓣，露出她紧缩的入口。她发出一声" + (saveContent.analMad == 0 ? "惊讶的呱呱声，转过头用金色的眼睛惊讶地看着你。当你的[cockhead]触碰到她的肛门，你试图推入的那一刻，她疯狂地挣脱，同时恐惧地对你摇头说“不”。你紧紧抓住她丰满的臀部，把她拖回泥泞中，粗鲁地撞开她的肛门括约肌，这让青蛙女孩发出一声撕心裂肺的纯粹痛苦的哀嚎" : "温顺的呱呱声，进一步低下头，接受你即将对她紧缩的肛门做的事情。你的[cockhead]粗鲁地试探着她的肛门，直到它不情愿地让步，欢迎你入侵的肉棒进入。你紧紧抓住她丰满的臀部，当你将肉枪刺入她体内时，你的手指微微压入她浅绿色的肉中，让青蛙女孩痛苦地发出可怜的呱呱声") + "。");
            outputText("[pg]她的直肠吞没[if (biggestcocklength >= 10) {你大部分惊人的|你的}]长度的感觉让你高兴得发抖，但却让你的伴侣发出紧张的呱呱声。每次你猛插得更深时，它试图将你排出的徒劳努力只会进一步取悦你的[cock]。每次你在她体内抽插时，青蛙女孩都会不受控制地颤抖，你对她后门的耕耘导致眼泪顺着她的脸颊流下。每当你的[if (biggestcocklength >= 10) {肉棒在她体内触底|臀部大声拍打在上面，留下浅绿色皮肤上刺痛的鲜红色}]时，她的臀部就会美味地晃动。青蛙女孩的内脏痉挛并紧紧包裹着你的粗壮，她可怜的抽泣声变得如此微弱，以至于在你充满欲望的咕哝声中几乎听不见。");
            outputText("[pg]用力地抽插你的[hips]，你的肉棒随着她体内不可预测的收缩而跳动。你只要求再往她紧致得惊人的屁股里推几下；咬紧牙关，你的身体绷紧，你拼命忍住不射精。[if (hasballs) {你的[balls]跳动着，大声拍打着女孩的阴部，你的精液在其中充满活力地搅动着。}]尽管你拼命试图再享受一会儿快感，但你感觉到你的精液不可抑制地顺着你的肉棒涌上来。");
         }
         menu();
         _g = this;
         ass = true;
         addNextButton("射在屁股里",function():void
         {
            _g.suwakoSubAnal2(ass);
         }).hint("用精液淹没她的屁股。");
         _g1 = this;
         ass1 = false;
         addNextButton("射在小穴里",function():void
         {
            _g1.suwakoSubAnal2(ass1);
         }).hint("用精液淹没她的小穴。");
      }
      
      public function suwakoSexLeave() : void
      {
         clearOutput();
         outputText("你从青蛙女孩身边退开，她虚弱地跳回水中。在潜入水下之前，她最后瞪了你一眼。");
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoService() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            outputText("你[if (!isnaked) {脱下你的[armor]并}]注意到这三个蛙女正" + (get_monster().get_lust() >= get_monster().maxLust() ? "饥渴地" : "") + "盯着你的[cock]。你靠近她们，指着自己的肉棒，示意她们满足你。绿色的那个不情愿地先行动起来，在你的肉棒上印下轻柔的吻，另外两个也很快加入了进来。她们柔软的嘴唇湿滑且有些冰凉，让你不禁打了个寒颤。三条冰凉的舌头开始在你的肉棒上摩擦，让它在三人滑腻的唾液下闪闪发光。唾液本身似乎让你的心脏在胸腔里狂跳，体内的热量让你开始出汗。你发出一声愉悦的呻吟，享受着这三个女人一边挤压着她们柔软的乳房，一边齐心协力舔舐你抽动着的肉棒的景象。");
            outputText("[pg]绿色蛙女突然用舌头缠住你的肉棒，将你深深含入口中。她的同伴显然被她的贪心惹恼了，气得对她咕呱直叫。她却毫不理会，打定主意要独吞你即将赐给她的每一滴精液。她有力的舌头不断抚弄着你，脑袋也飞快地上下套动，逼得你不由自主地挺起腰来。无数快感冲击着你的脑海，而另外两个蛙女也为你献上一场香艳的表演——她们一边狂躁地揉搓着自己的小穴，一边抓弄着没有乳头的丰乳。你大声呻吟着，把自己悸动的肉棒从绿色蛙女嘴里抽了出来，她可怜巴巴地咕呱叫着表示抗议。");
            outputText("[pg]转眼间，另外两个青蛙女孩把绿色的那个推到一边，她脸朝下摔进了泥里。她们轮流把你的[cock]含进冰凉的嘴里，又啪地吐出来，把彼此留在你身上的唾液舔得干干净净。你的男根兴奋地抽动着，精液在你的[if (hasballs) {[balls]|body}]里不断涌起。伴着一声低吼，种子冲过你的尿道；那两个青蛙女孩感到它溅在自己黏滑的皮肤上，开心地呱呱叫个不停。她们心满意足地看着你，把你的精液抹在自己弹软的乳房和平坦的小腹上。绿色青蛙女孩皱着眉擦去脸上的泥，你甚至觉得自己好像听见她抽了抽鼻子，随后她便跳进水里，消失在水面之下。");
            outputText("[pg]粉色和红色的女孩也离开了，不过她们都愉快地向你挥了挥手，然后潜入蔚蓝的深处。");
         }
         else
         {
            outputText("你[if (!isnaked) {脱下你的[armor]，然后}]注意到三个蛙女正仔细地盯着你。你走近这三人，抓住粉色那位的头发，把她的脸按进你的[if (hasvagina) {胯间|[ass]}]。她毫不犹豫地开始粗暴地舔舐你，唾液让你的心脏在胸腔里砰砰直跳。她舌尖厚钝，抵住你的入口，轻而易举地滑了进去。那根粗大的舌头在你体内扭动，让你根本无法压抑住愉悦的呻吟。当它[if (hasvagina) {深入到底，顶刺着你的子宫颈|淫猥地摩擦着你的直肠内壁}]时，你浑身都颤抖起来。");
            outputText("[pg]红色蛙女似乎已经看腻了，幸好她一把抱住你，没让你摔进泥里。她颇为亲昵地吻着你，抚摸着你身上的每一处。她带蹼的手在你身上游走，给你抹上一层清凉的黏液，感觉竟然出奇地舒服。那条在你体内肆意搅动的舌头，逼得你腹中的热意变得更加炽烈，强烈的快感几乎让你的意识都要融化。你无法控制地颤抖着，那根粗大的舌头不断撞击着[if (hasvagina) {你的宫颈|你[asshole]最深处}]。");
            outputText("[pg]在你不断颤抖时，紧紧抱住你的红色青蛙女孩热情地亲吻着你。她有力的支撑让你没有倒下，在她那异常甜美的亲吻间隙，你忍不住大口喘着气。你感觉到那根舌头突然从你体内抽离，并察觉到粉色女孩从背后抱住了你。她柔软的双乳紧贴着你，让你满足地叹了口气。至今仍在震撼你身体的高潮慢慢让你的视线变得模糊，两个女孩小心翼翼地将你放在一块没那么泥泞的地方休息。");
            outputText("[pg]透过模糊的视线，你看到绿色的青蛙女孩正用明显的鄙视眼神瞪着你，然后伴随着巨大的水花声跳回水中。全心全意服侍你的粉色和红色女孩各自在你脸颊上印下了一个相当纯洁的吻。随后她们也跳回了水里，留下你独自一人恢复体力。");
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoRepeat() : void
      {
         clearOutput();
         outputText("当你在沼泽中漫步时，你回到了上次遇到青蛙女孩的地方。她的舌头从水里弹出来，试图抓住你，但你这次预料到了这种战术，避开了这个湿滑的器官。舌头迅速缩回水中，伴随着一声水花，这个两栖女人从水里跳到了泥泞的陆地上。");
         §§push(§§findproperty(outputText));
         §§push("[pg]从青蛙女孩盯着你的眼神可以明显看出，她");
         §§push(["看到你很不高兴。也许她对你上次打败她感到恼火","[if (hascock) {相信她这次也能轻易地对你为所欲为|看到你并不高兴。如果说有什么不同的话，她看起来有点厌恶}]","看到你显得出奇地高兴","见到你不是很高兴。事实上，你会说她看起来相当愤怒"]);
         var _temp_1:* = saveContent.lastEncounter;
         §§push(_temp_1);
         if(!(_temp_1 is Number))
         {
            throw "Class cast error";
         }
         §§pop().outputText(§§pop() + §§pop()[int(§§pop())] + "。女孩试图再次用她长得离谱的舌头攻击你，这本该是强有力的一击，却险些擦过你的脸。");
         outputText("[pg]看来你别无选择，只能面对她了！");
         saveContent.lastEncounter = 0;
         startCombat(new FrogGirl());
      }
      
      public function suwakoPregnancy() : void
      {
         clearOutput();
         outputText("你小心翼翼地引导大腹便便的青蛙女孩平躺下来，她高兴地照做了。接着，你给了她一个温柔的吻，她兴奋地不断回应，同时发出愉悦的呱呱声。当你把嘴唇移开，让她够不着时，她似乎皱起了眉头，原本快乐的呱呱声变成了低沉的呜咽。你让双手在她充满女人味的曲线上悠闲地游走，欣赏着她的每一寸肌肤，最后停在她丰满的臀部上。看着她的脸，你能看到她正满怀期待地注视着你。");
         outputText("[pg]你慢慢移动手，将其放在她沉甸甸的肚子上，触摸着紧绷的皮肤。你发现里面充满了无数的小卵，这无疑有你的一份功劳。一种小小的自豪感在你胸中涌起，因为你创造了这么多新生命。你温柔地在青蛙女孩乳白色的肚皮上落下几个轻吻，她对这甜蜜的举动感到十分受用，亲昵地蹭了蹭你的头。");
         outputText("[pg]当你再次看向她的眼睛时，从她美丽脸庞上灿烂的笑容就能轻易看出，她非常喜欢你这么做。当你起身准备离开时，青蛙女孩挣扎着想要站起来，直到你扶她起身，她突然给了你一个热烈的吻。她把你的手放回她怀孕的肚子上，自己的手也覆在你的手上停留了片刻。");
         outputText("[pg]女孩可爱地呱呱叫着，虽然你听不太懂，但她在最终放你走之前又吻了你一次。");
         doNext(submissiveSuwako);
      }
      
      public function suwakoPat() : void
      {
         clearOutput();
         outputText("你轻轻地拍了拍她的头，她湿漉漉的黑发粘在你的手指上。她闭上眼睛，微笑着轻柔地呱呱叫。你很快让手滑到她的脸颊，温柔地抚摸着她滑溜溜的皮肤。当你抚摸她时，她深情地用手背触碰你的手背，并亲昵地用脸颊蹭你。");
         outputText("[pg]当你终于把手抽开时，尽管她漂亮的脸上带着微笑，但似乎还是有点失落。");
         doNext(submissiveSuwako);
      }
      
      public function suwakoNoSub() : void
      {
         clearOutput();
         outputText("你转身准备离开，听到青蛙女孩用相当低沉的语调呱呱叫了一声，然后伴随着一声响亮的[i:扑通]声跳回了水里。");
         outputText("[pg]你猜她大概是因为你今天对她的身体不感兴趣而感到失望吧。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suwakoDefeated(param1:Boolean) : void
      {
         clearOutput();
         outputText("青蛙女孩倒下了，" + (param1 ? "她的伤势让她无法再反抗你。你可以看到她不确定地看着你，可能在担心你现在会给她带来什么样的命运" : "脸上带着羞愧的红晕。你看着她把带蹼的手伸到双腿之间，揉搓着她的小穴，试图释放你激起的欲火") + "。");
         menu();
         addNextButton("阴道交",suwakoVaginal).hint("用你的肉棒操她的小穴。").sexButton(1);
         addNextButton("肛交",suwakoAnal).hint("把你的鸡巴塞进她的屁股。").sexButton(1);
         addNextButton("舌交",suwakoTongue).hint("让她用那条长舌头为你服务。").sexButton();
         setSexLeaveButton(suwakoSexLeave);
      }
      
      public function suwakoChildren() : void
      {
         clearOutput();
         if(saveContent.shownKids < 2)
         {
            outputText("你看着青蛙女孩，试图向她解释你想再见见你们的孩子。她起初似乎有些困惑，但在你比划了几个手势后，她便热切地点点头，拉起你的手。女孩带着你穿过沼泽，直到你们来到另一个似乎很隐蔽的水池，和你通常找到她的那个水池很像。");
            outputText("[pg]你看到几个小青蛙女孩在水里惬意地游来游去，直到她们发现了你，便发出惊恐的呱呱声潜入水下。她们的母亲发出一声响亮的呱呱声，这才让她们犹豫着重新浮出水面。你注意到其中一个孩子似乎认出了你，兴奋地从水里爬了出来。她高兴地对你呱呱叫着，同时兴高采烈地挥舞着手臂。她可能就是你已经见过的那个。当你温柔地摸摸她的头时，她发出了一声充满热情的呱呱声。水里的其他孩子看到她们的姐妹似乎很喜欢你充满父爱的抚摸，也放松了下来，你觉得她们最终都会对你敞开心扉的。");
            saveContent.shownKids = 2;
         }
         else
         {
            outputText("你温柔地抚摸着青蛙女孩的脸颊，表达了你想去看看孩子们的意愿。她发出一声充满热情的呱呱声，她的笑容清楚地表明她明白了你的意思，并且很高兴你打算去见你们的孩子。这里离孩子们玩耍的水池只有很短的距离，你已经能听到她们呱呱叫着、开心地戏水的声音了。当她们注意到你时，都兴奋地呱呱叫了起来，向你挥手后又继续互相玩耍。");
         }
         outputText("[pg]你目前有 " + Utils.num2Text(saveContent.eggCount) + " 个青蛙女孩孩子。");
         menu();
         addNextButton("玩耍",kidsPlay).hint("和你的女儿们一起玩耍。");
         addNextButton("下流",kidsLewd).hint("你想和她们[i:玩点别的]。").hideIf(!get_allowChild());
         setExitButton("离开",kidsLeave);
      }
      
      public function suwakoBadEnd3() : void
      {
         clearOutput();
         outputText("你在这里待了多久了？");
         outputText("[pg]当你再次醒来，酸痛的双臂依然被紧紧绑在头顶时，你脑海中浮现出这个念头。在你身旁，你看到四个大腹便便的怀孕蛙女在睡梦中依偎着你。其中一个靠得更近了，她结实的腿不小心擦过了你敏感的肉棒。你忍不住发出一声呜咽。她们每天都在疯狂地使用你，以至于即使是最轻微的触碰也会让你全身涌起阵阵快感。你发出的声音似乎唤醒了这四个两栖女孩，其中两个开始在你身上四处轻吻，而另一个则开始将你对准她流着淫液的小穴。你的[cock]被包裹住，让你发出虚弱的呻吟，怀孕的蛙女狂热地摇晃着腰肢，以至于她高高隆起的肚子都在上下弹跳。她可爱的脸庞因极度的快感而扭曲，同时将你的脸按在她光滑、没有乳头的乳房之间。");
         outputText("[pg]蛙女的内壁紧紧夹住你跳动的肉棒，你终于屈服于她湿滑小穴带来的快感。你把脸从她涂满粘液的胸部中挣脱出来，大口喘着粗气。当你将浓稠的精液射入她已经被占据的子宫时，她发出了一声纯粹满足的可爱叹息。当你终于把她填满后，她在你的脸颊上印下温柔的一吻。就在心满意足的蛙女从你身上下来的那一刻，另一个蛙女正准备接替她的位置，这时那个高大的橙色蛙女走了进来。和这里的其他蛙女一样，你看到她也挺着一个惊人的孕肚。");
         outputText("[pg]你感觉到原本试图骑上你的蛙女爬了下来，和另外三个一起离开了，只留下你和那个橙色的蛙女独处。两个更小巧的橙色蛙女提着一小盆水走了进来，把它放在你附近。当其中一个好奇地看着你时，你忍不住注意到这个年幼的孩子脸上出现了一些你微妙的面部特征。这只橙色的两栖动物对她们温柔地呱呱叫着，拍了拍她们的头，然后在她们的小屁股上轻轻拍了一下，打发她们离开。");
         outputText("[pg]现在只剩下你们俩了，女人从盆里拿出一块抹布，悠闲地擦拭你的身体。她轻柔地把你身上所有的蛙女粘液和其他干涸的体液擦干净，轻柔地呱呱叫着，仿佛在进行一场单方面的对话。你看着她把带蹼的手放在沉甸甸的肚子上，脸上带着微笑，然后亲吻了你的脸颊，把脏抹布放回盆里。她跨坐在你身上，你敏感的肉棒在她柔软的阴唇上滑动。然后你被推入她那欢迎你的肉褶中，你们俩都发出了一声呻吟。你的[cockhead][if (biggestcocklength >= 10) {撞击着她的子宫颈|刮擦着她的内壁}]的感觉让你和她都充满期待地喘息着。她紧紧地抱住你，把你的脸埋进她的胸膛。伴随着颤抖和呻吟，当她小穴那湿滑的肉壁收紧时，感觉你的阴茎都要炸开了。她可爱地呜咽着，快速地摇晃着丰满的腰肢，甚至让那巨大的臀瓣拍打出声。");
         outputText("[pg]你浑身紧绷，将一股股精液灌入这个已经大腹便便的蛙女的子宫里。她不断地亲吻你的头顶，每次你把越来越多的精液注入她体内时，她都会可爱地喘息。当你终于筋疲力尽时，她带着愉悦的微笑，慢慢地让你从她那流着淫液的小穴中滑出。已经有其他的蛙女探进头来，显然很期待轮到她们和你做爱……");
         outputText("[pg]毫无疑问，她们打算把你永远留在这里……");
         outputText("[pg][b:你的余生都将作为种马，一次又一次地让无数的蛙女怀孕。]");
         get_game().gameOver();
      }
      
      public function suwakoBadEnd2() : void
      {
         clearOutput();
         outputText("一阵快感流过你的[cock]，促使你睁开沉重的眼皮。你唯一的亮光来自岩石缝隙中长出的几朵发出微弱蓝光的蘑菇。当你试图移动手臂时，你发现它们被紧紧地绑在悬挂在你头顶的一根巨大的圆木上。随着你的视线变得更加清晰，你看到一对美丽而巨大的乳房在你面前淫荡地弹跳着。一声愉悦的蛙鸣传到你的[ears]里，一个黏糊糊的身体拥抱你的感觉让你的[skin]发麻。之前那个橙色的青蛙女孩正骑着你，她有蹼的手揉捏着她巨大的乳房。她每次挤压胸部，你都能感觉到她的体内在收紧。你的阴茎兴奋地跳动着，看到她没有乳头的乳房，感觉到她湿透的阴户，促使你射精。她长长的舌头挂在嘴角，摇晃着她充满母性的腰肢，显然非常渴望你把她填满。当你感觉到你的精液[if (hasballs) {从你的[balls]}]穿过你的阴茎，用无数股精液填满女人抽搐的体内时，你所能做的就是颤抖。");
         outputText("[pg]她颤抖着将你那疲软的阴茎从她那滴着淫液的穴口拔出，她的体液和你的精液让你那根肉棒即使在这个光线昏暗的小房间里也闪闪发光。你听不懂她对你呱呱叫了些什么，但她用冰冷的蹼手占有欲极强地抚摸你的脸和[chest]的方式，让你感到……至少可以说是有些不安。她站起身来，充满爱意地抚摸着她目前平坦的小腹，然后推开一些布帘，把你一个人留在了这里。你得承认，她离开时那丰满的臀部弹跳的景象很迷人，但你觉得现在最好还是把注意力集中在如何离开这里上。趁着独处的这段时间，你开始摆弄那些把你绑起来的粗藤蔓。你为了挣脱而做的每一次扭动和转身，都只会让你的手腕感到火辣辣的疼。突然，布帘动了，你看到两个娇小的绿色青蛙女孩探出她们可爱的脸蛋。");
         outputText("[pg]她们紧张地靠近你，带着不确定的表情互相看了一眼。其中一个伸手摸向你的[cock]，一边试探性地抚摸，一边盯着你的眼睛。她长着蹼的手摸起来滑溜溜的，还有点凉。她慢慢地加快速度，急切地套弄着你敏感的肉棒，让你发出一声满足的叹息，引得两个青蛙女孩咯咯直笑。那个女孩紧紧握住你的肉棒，另一个则凑过来热情地吻你。她长长的舌头在你的口腔里探索，慢慢变得更加主动和自信。突然，你的阴茎被一个紧致的小穴紧紧包裹，那个刚刚还在给你手淫的女孩现在正急切地摇晃着她少女般的臀部，显然是想把你的精液诱哄出来。你[if (biggestcocklength >= 10) {对她来说有点太大了，你的肉棒无法完全塞进去。你巨大的阴茎把她乳白色的肚子撑得鼓鼓的，当你的龟头粗暴地顶弄她柔软的子宫颈时，你忍不住浑身发抖|完全被她欢迎的肉褶包裹住了。你的龟头粗暴地摩擦着她内壁光滑的褶皱，这种感觉让你浑身发抖}]。");
         outputText("[pg]你推开正在亲吻你的蛙女，发出一声充满情欲的呻吟。紧致的小穴用力榨取着你，仿佛在乞求你的精液，这种感觉让你无法忍受太久。她用力压下狭窄的臀部，当她的内壁夹紧你跳动的肉棒时，嘴里溢出一声欢愉的喘息。你浑身紧绷，你的[if (hasballs) {[balls]跳动着，}]精液猛烈地冲进蛙女体内，无数急切的精子大概已经淹没了她嗷嗷待哺的子宫。她紧紧地抱住你，小巧的乳房贴着你，感激地接受着你的精液。就在她把你从她颤抖的通道里拔出来的那一刻，另一个两栖女孩兴奋地骑上了你敏感的肉棒，在她的狂热动作下，你所能做的只有扭动。");
         outputText("[pg]又一发精液从你疲惫的身体里被强行榨出，她满足的娇喘在小房间里回荡。正当她准备再来一回合时，更多的蛙女走了进来，把她拉开了。你被一次又一次地骑乘，你的精液不断被榨取，直到你的肉棒酸痛，彻底被榨干……");
         doNext(suwakoBadEnd3);
      }
      
      public function suwakoBadEnd() : void
      {
         clearOutput();
         outputText("这三个蛙女显然很高兴能再次击败你，尽管你觉得这次有些不对劲……");
         outputText("[pg]她们轻声地互相呱呱叫着，偶尔摇头或点头，似乎在进行某种辩论。当你开始爬走时，粉色的青蛙女孩重重地跳到你的背上，发出一声沉闷的[b:砰]响。她可能并不胖，但她突然压在你身上的重量足以阻止你的逃跑企图。你听到红色的青蛙女孩突然拍起她带蹼的双手，狂喜地对她的朋友们呱呱叫着。无论她说了什么，都让粉色和绿色的青蛙女孩露出了让你感到恐惧的微笑。");
         outputText("[pg][if (!isnaked) {你很快就被扒了个精光，你的[armor]被随意地扔到一边[if (hasweapon) {，连同你的[weapon]一起}]。|[if (hasweapon) {你的[weapon]被蛙女们随意地扔到一边，让你手无寸铁。}]}]其中两个抓住了你的胳膊，红色的蛙女用舌头紧紧地缠住你的脖子，就像牵引绳一样。当她们开始把你拉向水里时，你[if (hasgills) {知道你的鳃至少能防止你被残忍地淹死|不禁感到恐慌，认为她们可能打算残忍地淹死你}]。尽管你拼命挣扎，试图挣脱她们的控制，但你还是伴随着巨大的水花声被拉进了冰凉的水池中，并被拖入阴暗的深处。当你在水中被拖拽时，你注意到她们正把你带向一个看起来像是水下洞穴的地方。");
         outputText("[pg]这里似乎有一系列狭窄的隧道，你感到[if (hasgills) {庆幸自己有鳃，能让你在这种环境中轻松呼吸|恐惧，不知道当你的肺部对氧气的渴望最终变得无法忍受时，你会怎么做}]。幸运的是，你似乎到达了一个开口处，并很快被这三个女孩推到了一些凉爽的岩石上。[if (!hasgills) {你贪婪地大口喘着气，庆幸自己没有惨死。}]环顾四周的新环境，你意识到自己被带进了一个巨大的洞穴，当你看到眼前的景象时，你睁大了眼睛……");
         outputText("[pg]这里有无数的青蛙女孩，她们都好奇地盯着你，彼此间轻声地呱呱叫着。她们中有些胸部丰满，体态妖娆，而有些则娇小玲珑。她们闪闪发光的皮肤颜色各异。突然，青蛙女孩们让开了一条路，一位身材高大、手持白色木制长杖的青蛙女孩走了出来。她的皮肤是亮橙色的，除了乳白色的腹部和巨大的乳房外，全身布满了黑色的斑点。她用审视的目光打量着你，金色的眼睛和紧皱的眉头表明她对你被带到这里感到不满。绿色和粉色的青蛙女孩在她面前温顺地低下头，轻声地呱呱叫着。你猜测这个橙色的青蛙女孩就是这里的负责人");
         outputText("[pg]突然，你的老二被红皮女孩一把抓住。她撸动了几下，似乎在炫耀她们带回来的[cock][if (hasballs) {，甚至还掂了掂你的[balls]}]，脸上挂着相当得意的坏笑。也许她们的首领很满意，因为她也露出了慈祥的微笑，然后转身对着人群大声地呱呱叫着。她们交头接耳地窃窃私语，直到橙皮首领用手杖底部敲击岩石地面，人群瞬间安静下来。她又大声地呱呱叫了一声，高高举起双臂，这让人群兴奋地呱呱叫着，互相张望。橙皮女人似乎要求其他人再次安静，这大群人毫不犹豫地照做了。");
         outputText("[pg]一个绿色的小青蛙女孩抱着一大堆藤蔓匆匆跑向那个高大的橙色女人，差点被自己带蹼的脚绊倒。她低下头，当女人温柔地拍拍她的头并接过藤蔓时，她露出了微笑。青蛙女孩丰满的乳房随着她拿着藤蔓走向你而跳动，她把藤蔓扔给那个红色的女孩，后者只是点了点头。意识到她们打算把你绑起来，你试图挣扎，直到那个高大的女人用她坚硬的法杖狠狠地敲击你的头。这沉重的一击迫使你倒在冰冷的地面上，你的视线几乎瞬间变黑……");
         doNext(suwakoBadEnd2);
      }
      
      public function suwakoAppearance() : void
      {
         clearOutput();
         outputText("这个蛙女身高大约[if (metric) {一百五十厘米|五英尺}]。她的皮肤上闪烁着一层薄薄的粘液，除了腹部和乳房周围是乳白色外，其余部分都是浅绿色。她有一张出奇迷人的脸，带着柔和的女性特征。你相信，如果是在你的家乡，她至少会吸引一些回头率，尽管她那张长着异常长舌头的宽大嘴巴可能会让一些人感到反感。她的两只金色眼睛被黑色短发的刘海稍微遮挡，但仍能透过缝隙看出她现在正好奇地盯着你。她的身体柔软，有着女性的曲线。蛙女的手脚都有蹼，你只能猜测这是为了帮助她游泳。");
         outputText("[pg]她一丝不挂，身体的每一个部位都一览无余。[if (frogpreg) {她原本柔软的腹部现在明显凸起，让你想起了家乡那些怀孕最后一个月的女人。}] 蛙女有两个[if (frogpreg) {E罩杯|DD罩杯}]的乳房，但完全没有乳头。");
         outputText("[pg]在她结实的双腿之间有一条似乎总是湿润的缝隙，虽然你无法确定那是她的爱液还是覆盖在她皮肤上的天然粘液。在她丰满的臀部之间，有一个单独的肛门，与她宽大的臀部相得益彰。");
         doNext(submissiveSuwako);
      }
      
      public function suwakoAngryWon() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            if(saveContent.angryLosses >= 4)
            {
               suwakoBadEnd();
               return;
            }
            outputText("这三人[if (!isnaked) {从你身上剥下[armor]，并}]在看到你[if (lust >= maxlust) {勃起|疲软}]的阴茎时，眼中闪烁着恶意的光芒。你最终被翻转成趴着的姿势，她们强迫你把屁股撅到半空中，这三人扭曲地互相咯咯笑着。两只冰冷的手抓住你的[ass]，痛苦地掰开你的屁股，露出你的[asshole]。你回头看去，看到粉红色的蛙女正盯着你的穴口。当你开始挣扎时，绿色和红色的女孩把你按住，粉碎了你逃脱当前困境的任何希望。");
            outputText("[pg]粗大的舌头猛烈地穿透你的肛门括约肌，迫使你的背部因突然的插入而拱起。她的唾液涂满了你屁股的内壁，每次她进出时都会发出淫荡的挤压声。你感到的任何疼痛都随着你心跳加速而迅速消失。有一种奇怪的刺痛感，你的肉棒[if (lust >= maxlust) {已经开始滴下先列腺液|瞬间变得比以往任何时候都更加坚挺}]。也许是注意到了你的弱点，另外两个蛙女放开了你，你被[if (haslegs) {拉起来跪着|强迫坐起来}]。");
            outputText("[pg]红色的女孩在你面前四肢着地，展示她多汁的臀部，并张开双腿，足以露出她的肉缝。她抓住你的[cock]，将你的[cockhead]压在她冰凉的阴部上，慷慨地为你涂满润滑液。仍在你的屁股里蠕动的粗大舌头慢慢开始拔出，暂时缓解了你体内的压力。突然，这个器官毫不留情地撞击你的前列腺，迫使你的视线变白。瞬间，你强效的精子[if (hasballs) {从你的[balls]中}]冲上你的阴茎，射入蛙女等待的体内。你只能在一次又一次被戳弄前列腺的感觉中虚弱地颤抖，迫使你筋疲力尽的身体射出一发又一发的精液。红色蛙女的阴唇在你的龟头周围颤抖，嘲笑你她并没有让你真正插入她的阴道。");
            outputText("[pg]当你把能挤出的所有东西都倾注到她体内后，她把你萎缩的阴茎从她现在沾满精液的入口拉开。她回头看去，满意地舔了舔嘴唇，同时揉了揉肚子。浅绿色的蛙女似乎想接下来轮到她，因为她仰面躺下并拉着你，让你被困在她健美的双腿之间。她用黏滑的带蹼的手引导你进入她渴望的洞穴，但只让你的[cockhead]滑入。你的前列腺被恶毒地压下，迫使你再次射出一股精液，涂满了你伴侣的体内。你筋疲力尽地喘息着，而绿色的女孩则发出一声满意的呻吟。她傲慢地笑了笑，然后把你的肉棒尖从她体内滑出。");
            outputText("[pg]然后你被翻转过来仰面躺着，这样你就可以盯着高高在上的参天大树。粉红色的蛙女谢天谢地把她的舌头从你的[asshole]里拔了出来，你的身体仍然因为她唾液中的某种毒素而刺痛。她一定想轮到她了，因为她爬到你身上，开始用她冰冷的手撸动你疲惫的肉棒。不过你已经精疲力竭了，在你的屁股受到如此虐待之后，你不可能再硬起来了。你没有勃起的事实似乎激怒了她，她有力的舌头盘绕在你的脖子上，就像一条试图压碎猎物的蛇。肌肉开始收紧，切断了你急需的空气。你抓住那个器官，用尽全力抓挠它，但无济于事。粉红色的蛙女似乎并不关心你的痛苦，看起来漠不关心，同时增加你喉咙上的压力，直到你感觉你的头快要从身体上掉下来了！她的眼睛似乎突然闪烁起来，尽管你感到如此头晕目眩，你的肉棒却奇迹般地变得痛苦地勃起。");
            outputText("[pg]她狂热地将你的[cock]滑入她的阴道，发出一声愉悦的呻吟，并稍微放松了对你脖子的抓握，刚好让你吸入一小口甜美的氧气。你的肉棒[if (biggestcocklength >= 10) {太大了，无法完全塞进她的阴道，急切地撞击着她柔软的子宫颈|被蛙女的阴道完全吞没，她的深处令人愉悦地挤压着你的每一寸}]。每次她抬起丰满的臀部，她都会猛地坐下，将你完全吸回她紧致的阴道里。她的褶皱按摩你敏感长度的感觉迫使你因不断累积的释放感而颤抖。你所能做的就是咬紧牙关，大口喘气，而你的袭击者则快乐地呻吟着。");
            outputText("[pg]她的体内紧紧挤压着你的[cock]，迫使一股微弱的精液冲上你颤抖的阴茎，涂满她跳动的肉壁。当她再摇晃一下腰部时，你发现你的阴茎非常敏感，甚至开始疼痛。你注意到，当你因另一次被迫释放而颤抖，但你的肉棒里什么也没射出来时，她看起来相当失望。她把舌头从你的脖子上解开，终于让你随心所欲地大口喘气。");
            outputText("[pg]这三人最后看了你一眼，然后跳回水中，幸运地留你一个人休息，重新积蓄力量。");
            knockUpSuwako();
         }
         else
         {
            outputText("当[if (hp < 1) {你受的伤|你下半身的燥热}]变得让你无法忍受时，你倒在了地上。[if (!isnaked) {这三个蛙女迅速脱掉你的[armor]，}]粉红色的那个兴奋地扑向你。她慢慢地舔着你的[chest]，她的唾液让你的皮肤刺痛，乳头痛苦地变硬。你只能因为渴望而[if (haslegs) {摩擦你的大腿|扭动}]。红色的蛙女把你的手臂按在你的头顶上，你意识到绿色的女孩正站在你上方，带着傲慢的笑容。她的肉缝将黏糊糊的汁液滴在你的[face]上，尽管你只盯着它看了一会儿，她就坐在了你的头上。你完全被她的女性特征所窒息，她在你身上摩擦，肯定是在要求你取悦她。");
            outputText("[pg]你不情愿地用你的[tongue]攻击她湿滑的阴唇，让她把健美的大腿挤压在你的脸颊上。她的爱液慷慨地涂满了你的舌头，尝起来有点酸，但让你的心在胸腔里狂跳。突然，你感觉到有什么粗大的东西被推向你的[vagorass]。粉红色的蛙女一定是对只挑逗你的[chest]感到无聊了，显然选择品尝更精致的东西。她粗壮的器官深深地钻进你的[if (hasvagina) {[pussy]，直到它戳到你柔软的子宫颈|[ass]，并淫荡地刮擦你直肠的内壁}]。无论她的唾液里有什么，都让你的体内刺痛，你的大脑迅速淹没在无尽的快感海洋中。你只能在这些感觉中虚弱地呻吟和颤抖，下半身的强烈燥热让你出汗。");
            outputText("[pg]坐在你脸上的蛙女颤抖着，她的肉缝将黏糊糊的液体涂抹在你身上。当她从你身上下来时，红色的蛙女取代了前一个人的位置，你发现自己被闷在她丰满的屁股之间。她向后伸手抓住你的头，催促你开始舔她抽搐的屁眼。不知为何，你发现自己急切地用舌头在女孩的穴口上拖拽，导致她兴奋地呱呱叫，并在你身上颤抖。你[if (hasvagina) {[pussy]|[asshole]}]里粗大的舌头淫荡地挤压着，你的大脑感觉好像完全融化了。你扭动腰部以配合该器官的剧烈运动，享受着它如何猥亵你的内壁。当你的[tongue]进入她的屁眼时，红色的女孩颤抖着，她多汁的屁股摇晃着，同时她发出一声愉悦的呻吟。她一心一意地在你脸上多摩擦了一下，然后拉开距离，让你在她离开前凝视她完美的背影。");
            outputText("[pg]你的身体突然僵住，视线闪烁着白光。猛烈敲打你[assholeorpussy]的舌头并没有停止它的攻击，快感迫使你像个荡妇一样哀嚎。蛙女舌头的钝端用力地[if (hasvagina) {一次又一次地残忍撞击你的子宫|用她的唾液涂抹你直肠的内壁}]。你所能做的就是颤抖，你的身体完全任她摆布，而每一次震撼你的高潮都让你拼命地喘气。然后她突然把舌头从你仍在颤抖的身体里拔出来，她异常灼热的唾液似乎从你现在被虐待的[vagorass]中滴落。");
            outputText("[pg]当你躺在泥地里时，三个蛙女站在你上方，可爱的脸上带着得意的笑容，互相小声地呱呱叫着。她们显然觉得你拼命喘气、恢复体力的样子很有趣。刹那间，绿色蛙女的舌头从嘴里弹出来，重重地打在你的脸上，你晕了过去……");
            outputText("[pg]过了一会儿你醒了过来，她们三个显然已经离开了。花了一秒钟理清思绪，[if (!isnaked) {你收拾好[armor]，然后}]站起来离开了这个地方。");
         }
         get_player().orgasm("Generic");
         _temp_1.angryLosses += 1;
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoAngryLeave() : void
      {
         clearOutput();
         outputText("你直接丢下这三个蛙女，任由她们" + (get_monster().get_lust() >= get_monster().maxLust() ? "拼命想要缓解你挑起的欲火" : "脸朝下趴在泥地里") + "。");
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoAngryDefeated() : void
      {
         clearOutput();
         outputText("三个蛙女瘫倒在泥地里，" + (get_monster().get_lust() >= get_monster().maxLust() ? "每个人都在疯狂地揉弄着她们的肉缝" : "显然痛得无法继续和你战斗了") + "。");
         menu();
         addNextButton("肛交",absolutelyFuriousAnal).hint("操她们的屁股。").sexButton(1);
         addNextButton("阴道交",suwakoVaginal).hint("给她想要的。").sexButton(1);
         addNextButton("侍奉",suwakoService).hint("让她们好好利用那令人印象深刻的舌头。").sexButton();
         setSexLeaveButton(suwakoAngryLeave);
      }
      
      public function suwakoAngry() : void
      {
         clearOutput();
         outputText("当你在沼泽中探索时，你回到了遇到蛙女的地方。仿佛是安排好的一样，蛙女长长的舌头从水中弹起，试图抓住你。你轻松地躲开了这个器官，蛙女皱着眉头从水中跳了出来。令你惊讶的是，紧接着又传来了两声水花，另外两个蛙女突然出现了！");
         outputText("[pg]她们看起来也不太高兴见到你……");
         startCombatMultiple(new FrogGirl(),new FrogGirlPink(),new FrogGirlRed(),null,suwakoAngryDefeated,suwakoAngryWon,suwakoAngryDefeated,suwakoAngryWon,"你目前正面临着三个蛙女。在很大程度上，除了颜色之外，她们三个看起来非常相似。一个是粉红色的，腹部是白色的；第二个是红色的，除了四肢是深蓝色的；最后，是那个常见的浅绿色蛙女，她这次一定是带着她的两个朋友来试图教训你。[pg]每个女孩都有一对丰满的乳房和女人味的臀部，支撑着她们丰满的屁股。她们湿漉漉的黑发相当短，尽管刘海长到足以稍微遮住那双似乎在仔细观察你一举一动的金色眼睛。虽然她们三个确实有着迷人女人的面孔，但你还是忍不住对她们目前对你表现出的极其敌意的表情保持警惕。[pg]虽然她们没有使用常规武器，但被她们肌肉发达的舌头和健美的腿击中肯定会很痛。");
      }
      
      public function suwakoAnalWon() : void
      {
         clearOutput();
         outputText("当你倒在泥泞的地上，因[if (hp < 1) {伤势过重|欲火焚身}]而无法继续战斗时，蛙女向你跳了过来。她歪着头，脸上带着明显的恶意笑容，低头盯着你战败的身体。在你完全任她摆布的情况下，蛙女[if (!isnaked) {迅速剥去你的[armor]并}]将你翻转成趴着的姿势。你还在思考她要做什么，直到她带蹼的双手强行掰开你的[ass]，露出你紧缩的穴口。还没等你开口阻止她可能要做的事，她就猛地将舌头的钝端塞进你的穴口。你咬紧牙关，她的口腔器官[if pc anal virgin){在你的[asshole]上蠕动，试图强行撑开它|成功滑入了你的[asshole]}]。");
         outputText("[pg]当她又长又粗的舌头深入你的屁股时，你忍不住皱起眉头。它刮擦着你的肠壁，像虫子一样在你体内蠕动。她把舌头缩了回去，让你以为折磨已经结束，直到她再次强行将其塞入。女孩抽回舌头，再次猛烈地塞入，只是这次她碰到了某个让你舒服得叫出声来的地方。你的[if (hp < 1) {肉棒瞬间勃起，|已经勃起的肉棒}]颤抖着，感觉像是要释放了，尽管什么也没射出来。你犹豫地回头看去，发现蛙女的两只金黄色眼睛似乎因为你刚才发出的声音而闪烁着愉悦的光芒。");
         outputText("[pg]她的舌头戳弄着你海绵状的前列腺，迫使一股不想要的暖流流遍你的全身。每次她用湿滑舌头的钝端敲打它时，你的胃都会收紧。感觉就像你要一次又一次地高潮，你的[cock]颤抖着，滴下先列腺液。蛙女用她带蹼的双手紧紧抓住你的[hips]，将你固定在原地，她黏滑的舌头无情地撞击着你的[if (silly) {发射按钮|内壁}]，直到你的大脑融化。突然，她将舌头紧紧压在你屁股里最敏感的地方，你能感觉到数以百万计的精子冲上你颤抖的肉棒，让你可悲地在极乐中叫出声来。");
         outputText("[pg]蛙女迅速将一只手移到你的肉棒下，成功接住了每一滴精液，同时她的舌头还在你体内横冲直撞，迫使你被快感折磨的身体挤出更多。即使她的舌头从你的[asshole]中滑出，你仍然无法停止颤抖和喘息。蛙女在你面前坐下，带着一种奇怪扭曲的笑容展示她从你身上榨取的东西。你看着她张开健美的双腿，向你展示她闪闪发光的肉缝。她撑开自己的穴口，让你的精液流入其中，同时咧着嘴盯着你。看起来她几乎是在试图嘲笑你，为成功偷走你的精液而感到沾沾自喜！");
         outputText("[pg]她把相当迷人的脸凑近你，直视你的眼睛。然后女孩轻轻摸了摸自己的肚子，突然在你的脸颊上舔了长长的一口，充满占有欲，在你的皮肤上留下了一道唾液的痕迹。随着你的视线开始模糊，她跳进美丽的池塘，对你吐了吐舌头，然后消失在水下。");
         get_player().orgasm("Dick");
         knockUpSuwako();
         saveContent.lastEncounter = 1;
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoAnal2() : void
      {
         clearOutput();
         outputText("你掰开这个两栖女孩丰满的臀部，欣赏着她紧致的菊穴，短暂地欣赏着你即将占为己有的入口。当你的[cockhead]触碰到她的后门时，蛙女肯定感觉到了，因为她开始发抖。她对你摇头说“不”，显然对你打算使用她的屁股而不是正常的入口感到恐惧" + (saveContent.analMad > 1 ? " again" : "") + "。蛙女拼命地试图挣脱，但你紧紧抓住她充满女人味的臀部，让她无法逃脱。当你按住她并开始向前挺动腰部时，你能听到她发出一声可怜的、充满挫败感的呱呱声。你不情愿的伴侣在你的掌控中颤抖着，她的菊花很快就屈服了，让你终于滑了进去。");
         if(get_player().biggestCockLength() >= 10)
         {
            outputText("[pg]当你的[cock]将她的小后门撑开成你的形状时，蛙女发出痛苦的哀嚎。她的身体剧烈地颤抖着，当你试图强迫她承受超过她身体极限的尺寸时，她大声地呱呱叫。你无法将你的整个长度塞进这个两栖女孩体内，你的阴茎有很大一部分留在她冰凉的身体外面，但这并不能阻止你随心所欲地蹂躏她。你每一次挺腰，都让她的丰臀诱人地颤动，你巨大的长度扭曲了她的肚子。每次你猛烈地撞击她时，她都会发出无数痛苦的叫声。[if (hasknot) {你的肉结肿胀的感觉很不幸，因为你意识到你永远不可能把它塞进她体内。}]");
         }
         else
         {
            outputText("[pg]当你的阴茎完全被她的菊花吞没时，蛙女发出尖锐的叫声。它紧紧地挤压着你颤抖的肉棒的每一部分，试图抵抗你的入侵。你的臀部粗暴地撞击着她丰满的屁股，让它们颤动起来，并将浅绿色的皮肤变成刺痛的鲜红色。每次你插入她，并将你勃起的长度摩擦她直肠的内壁时，她都会发出可怜的声音。当你慢慢从女孩体内抽出时，她似乎稍微放松了一点，深吸了一口气，但当你强行将自己完全插回她紧致的菊花时，她又痛苦地呱呱叫起来。[if (hasknot) {你的肉结肿胀的感觉刺激着你的抽插，你把它砸在她的菊穴上。每当你的肉结撞击她的屁股时，她似乎收得更紧了，害怕你成功地把它滑进她体内。}]");
         }
         outputText("[pg]蛙女早就停止了对你凶猛抽插的抵抗。她只发出最微弱、最悲惨的呱呱声，轻易地被你自己的咕哝声所掩盖。她的屁股突然紧紧夹住你的[cock]，将无数天堂般的快感传递到你的大脑。你的精液在你的[if (hasballs) {[balls]|身体}]内涌动，刺激着你尽可能深地插入她。当你的阴茎不受控制地跳动时，你用力捏住女孩的臀部，在她闪闪发光的皮肤上留下了瘀伤。" + (get_player().hasKnot(get_player().biggestCockIndex()) && get_player().biggestCockLength() < 10 ? " 你用你的[knotword]撞击她的菊花，滑过去让它肿胀起来，将自己锁在她体内。" : "") + " 你抓住她的黑发，拉扯着它，你咬紧牙关，在解脱中颤抖，你所有的精液涌过你的阴茎，淹没了蛙女紧闭的菊花。每一次喷射都让女孩虚弱地呜咽，你让她的后庭成为了你的精液垃圾桶。");
         outputText("[pg]当你终于把最后一滴种子排空在她体内时[if (hasknot) {，你等待你的肉结缩小，然后}]你从她的后庭拔出自己，让她瘫倒在泥里。你可以看到你的一些精液从她看起来受尽虐待的菊花里[if (cumhighleast) {涌出|慢慢流出}]。蛙女用她那双依然流着泪的金色眼睛狠狠地瞪了你一眼，然后虚弱地爬回水里。");
         outputText("[pg]看到她潜回水下后，你[if (!isnaked) {收拾好你的[armor]，然后}]离开了这个地方。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         _temp_1.analMad += 1;
         saveContent.lastEncounter = 3;
         get_combat().cleanupAfterCombat();
      }
      
      public function suwakoAnal() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {脱下[armor]扔到一边，}]把虚弱的蛙女翻过身，让她趴着。她丰满的臀部配上宽阔的胯部，你抓住她的胯部，把她的后半身抬得更高。她回头看着你，目光扫过你的[cock]" + (get_monster().get_lust() >= get_monster().maxLust() ? "，眼中充满渴望" : "") + "。你把阴茎对准她的屁眼，蛙女吓了一跳。她轻轻地把屁股抬得更高，张开双腿，向你展示她流着淫液的阴道。很明显，她试图诱惑你使用[i:正确的]洞。");
         menu();
         addNextButton("操小穴",assToVag).hint("使用“正确的”洞。");
         addNextButton("肛交",suwakoAnal2).hint("那个屁股是你的，即使她讨厌它。");
      }
      
      public function suwako() : void
      {
         clearOutput();
         outputText("你跋涉穿过荒凉的沼泽，拨开挡路的茂密枝叶。事实证明，穿越这个地方是一场无休止的挣扎。你经常差点陷入沼泽深处的淤泥中，而且不止一次在[walking]时，你觉得听到了身后水花飞溅的声音，或者是高耸的树木愤怒地沙沙作响。当你先发制人地为任何潜在的攻击做好准备时，却发现什么也没有发生。你安慰自己，听到的声音只是你的想象。这个令人不安的地方只是在扰乱你的心智。");
         outputText("[pg]你越往深处走，周围就越暗。上方的光线几乎完全被树木遮挡，只有极细微的光束透进来。你花了一点时间让视力适应，然后拨开像窗帘一样垂下的湿润苔藓。得益于无数的红树林，清澈见底的水池映入你的眼帘。萤火虫以一种近乎神奇的方式飞舞着，奇妙地照亮了这个以前隐藏的地方。虽然你发现自己被这景色迷住了，但当你看到周围泥泞的地面有多么湿滑时，你停下了脚步。哪怕是最轻微的失足，都有可能让你掉进水里……不过，既然来了，在这里冲洗一下身子也许会很惬意。");
         menu();
         addNextButton("靠近",approach).hint("无论如何都要靠近水池。");
         addNextButton("算了",forget).hint("别自找麻烦。");
      }
      
      public function suwakAttack() : void
      {
         clearOutput();
         outputText("你[if (haslegs) {踢了|打在}]她撅起的臀部上，让她脸朝下摔在泥泞的地上。蛙女发出一声痛苦的尖叫，连滚带爬地逃开。她转向你，擦去脸上的泥巴，然后怒视着你。");
         outputText("[pg]她那双金色眼睛中燃烧的怒火，清楚地表明了你们从今往后的关系将永远是敌对的。");
         saveContent.fought = true;
         startCombat(new FrogGirl());
      }
      
      public function superBonusFrogEggsInYerCooch() : void
      {
         clearOutput();
         get_images().showImage("froggirl-vag");
         outputText("[say: 等等，你想把它们放在哪里？] 蛙女难以置信地问道。");
         outputText("[pg]你重复说，你希望她把卵产在你的子宫里，舔了舔嘴唇，手指顺着你的[vagina]滑下。");
         outputText("[pg][say: 咦，我怎么没想到呢？] 蛙女皱着眉头咕哝道。[say: 不过，这是个绝妙的主意，] 她欢快地说。[say: 我只需要你摆好姿势。]");
         outputText("[pg]她靠向你，嘴唇拂过你的嘴唇，宽大的手滑到你身后，冰凉的触感在你的背上留下一层令人刺痛的粘液。你条件反射地弓起背，感觉到一阵愉悦的刺痛从你的[face]一直蔓延到你的[legs]。");
         outputText("[pg]随着你的后腰向上推，你的臀部在水中升起，在蛙女轻抚你的[ass]的引导下。她的每一个指尖都将致幻剂送入你的体内，让世界亮起、旋转，或者充满微小的光点。当她把光滑的大腿搭在你的[leg]上时，你正对着眼前展开的万花筒般的宇宙咯咯地笑。");
         outputText("[pg]你听到蛙女发出咕咕的叫声，她的小穴贴着你的小穴，将她的湿滑涂抹在你的阴阜上。她的触碰让你的脊椎传来一阵阵颤栗、银铃般的感觉，你感觉到自己的湿润也渗出来，贴着她。");
         outputText("[pg]更浓稠的粘液将她的小穴粘在你的小穴上，让每一次摩擦和推挤都成为一种共同的感觉。当她向下挤压肚子时，压力积聚在你的开口处，她的小穴嘴唇贴着你的嘴唇张开，将你分开，接纳她的第一颗卵。当她卵上果冻状的物质开始挤进你体内时，世界变成了紫色，然后是蓝色，然后你周围的水似乎慢慢升到了空中。");
         outputText("[pg]如果你现在能清醒地思考，你会把这归咎于令人神志不清的青蛙粘液，但你现在满脑子想的都是你的小穴越张越大的感觉，接纳着另一颗覆盖着粘液的卵。蛙女的大腿夹着你，一条贴着你的肚子，另一条");
         if(get_player().tail.type > 0)
         {
            outputText("勾住你的尾巴，");
         }
         else
         {
            outputText("紧贴着你的[ass]，");
         }
         outputText("将越来越多的黏液涂抹在你的身体上。");
         get_player().cuntChange(25,true,true,false);
         outputText("[pg]当一颗又一颗卵挤进你体内时，你感觉你的大脑在快乐地翻着跟头。在这个过程中的某个时刻，你高潮了，但你甚至不确定——你的大脑被致幻的粘液弄得太模糊了。");
         outputText("[pg]你不确定蛙女是什么时候结束的。当树木停止跳舞，天空停止荡漾时，你正仰面漂浮在水池中，看着你现在肿胀的肚子的曲线，在水中轻轻地上下浮动。");
         outputText("[pg]当意识慢慢开始渗入你的大脑时，你眨了眨眼，坐起来时微微呻吟，抓着你巨大、怀孕的肚子，当你走出水面时，感觉到里面的果冻卵在移动。你停顿了一下，一小股粘液从你的阴道渗出，让你的视野中闪过一道短暂的彩虹，高潮的回声在你的体内回荡，然后你穿上[armor]，踉踉跄跄地走回营地。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(1));
         get_player().knockUp(23,30,1,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function submissiveSuwako() : void
      {
         clearOutput();
         registerTag("frogpreg",TagFun_Impl_.fromBool(pregnancy.get_isPregnant()));
         if(!saveContent.submissive)
         {
            outputText("你再次穿行在阴郁的沼泽中，最终来到那个古怪却迷人的地方——上次你就是在这里与蛙女对峙。你凝望着波光粼粼的水面，很快便看见她探出头来盯着你。她那张诱人的脸上神情相当空洞，让你完全无法判断她的感受。你当然已经做好了击退她的准备，但她并没有离开水面，也没有试图用舌头抓住你。相反，她潜入水下，消失在你的视野中，留给你片刻去思考：她会不会是因为多次徒劳地试图制服你，已经感到厌倦了。这个念头很快被打断——她突然跳上泥泞的岸地，伴随着轻轻的[b:扑通]一声，丰满的胸臀也随之淫靡地颤动起来。");
            outputText("[pg]虽然一时有些措手不及，但你还是摆出了战斗姿态，死死盯着那个青蛙女孩。她歪着头看着你，平静的举止似乎并没有任何敌意。你仍然小心翼翼地注视着这个两栖女孩，只见她双手双膝着地，然后撅起屁股，展示出她丰满的臀部。接着，她可爱地呱呱叫了一声，分开结实的双腿，露出闪闪发光的入口。她犹豫地回头瞥了一眼，你觉得她可能是在试探你的反应。当你依然不为所动时，她开始慢慢地左右摇晃起她的大屁股。");
            outputText("[pg]这显然是在引诱你占有她。");
            menu();
            addNextButton("交谈",suwakoTalk).hint("试着交流一下？");
            addNextButton("操她",suwakoYesSub).hint("很明显她想让你再上她一次。").sexButton(1,false);
            addNextButton("攻击",suwakAttack).hint("你想打架！这样做可能会让她再也不敢尝试这种事了。");
            addNextButton("离开",suwakoNoSub).hint("既然她不打算攻击，那你还是走吧。");
         }
         else if(!get_player().hasCock())
         {
            outputText("当你回到平时和青蛙女孩见面的地方时，你注意到她正从水里探出头来。她跳上岸，用一种奇怪的表情看着你。青蛙女孩用她有蹼的手拍了拍你的胯部，歪着头，可爱的脸上泛起愁容。她指着你的胯部，露出厌恶的表情，同时摇了摇头。你看着她用有蹼的手做了一个相当像阴茎的手势，微笑着，热情地呱呱叫着，并急切地点头。");
            outputText("[pg]她伴随着一声响亮的[b:扑通]声跳回水中，留下你一个人。你猜想，她大概是想让你重新长出阴茎。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(saveContent.shownKids == 0 && saveContent.eggCount >= 35)
         {
            outputText("穿过可怕的沼泽，你很快就来到了那个蛙女通常待的地方。当你靠近平静的水面时，你注意到那个女孩探出头来盯着你。奇怪的是，她并没有跳上岸，而是潜回了水下。你等了一会儿，蛙女很快又浮出水面，身边还跟着一个小一号的蛙女。她催促着那个绿色的小家伙上岸，然后自己也跳了上来。");
            outputText("[pg]两栖女孩微笑着，指了指小女孩，又指了指你，最后指了指她自己。当你观察这个孩子气的小家伙时，你开始注意到她稚嫩的脸庞上隐约有你自己的特征。她赤裸的身体远不如她母亲那般丰满，胸部完全平坦。从身高和体型来看，她让你想起了十岁的孩子。当你向小女孩迈出一步时，她防备地后退，金色的眼睛透露出她对你仍然感到不确定。");
            outputText("[pg]看到小女孩不愿主动靠近你，她的母亲轻轻拍了拍女孩娇小的臀部，催促孩子上前。当小青蛙女孩站在你面前时，你开始向她伸出一只手，这让她紧紧闭上了眼睛。你温柔地抚摸着她黑色的短发，湿润的头发紧贴着你的手指。孩子很快偷看了你一眼，显然在你温柔的抚摸下放松了下来，并可爱地呱呱叫着。你的青蛙女儿开始微笑，看着她的母亲，呱呱叫着似乎在问一个问题。年长的青蛙女孩点了点头，这促使孩子给了你一个短暂的拥抱，然后跳回了水里。");
            outputText("[pg]你的爱人甜蜜地对你呱呱叫着，她的笑容清楚地表明她很高兴让你见到你帮忙孕育的孩子之一。她走近你，给了你一个相当纯洁的吻，然后跳回了深蓝色的池塘。");
            outputText("[pg]随着母女俩的离去，你离开了，想知道也许你还能再次见到你的孩子。");
            saveContent.shownKids = 1;
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(saveContent.eggCount >= 50 && Utils.randomChance(10))
         {
            foursome();
         }
         else
         {
            if(saveContent.shownKids != 0)
            {
               outputText("你回到了青蛙女孩似乎居住的大水池，当你坐下时，看到她从水里探出头来。她跳上岸，高兴地坐在你旁边。你们俩安静地坐了一会儿，女孩温柔地握着你的手，靠在你身上，可爱的脸上带着满足的表情。");
               outputText("[pg]很快，她拉起你的手，放在她[if (frogpreg) {圆润的肚子上，脸上带着深情的微笑。你觉得她很高兴能怀上更多你的孩子|平坦的肚子上。从她金色的眼眸中，你能看出她希望你尽快让它再次孕育生命}]。");
            }
            else
            {
               outputText("当你小心翼翼地穿过沼泽时，你偶然来到了蛙娘似乎总是在的地方，并走近大水池的边缘。一两分钟后，你看到女孩小心翼翼地从水里探出头来，带着" + (saveContent.lastEncounter == 3 ? "撅嘴" : "相当深情的微笑") + "。她轻松地跳上泥泞的岸边" + (saveContent.analMad >= 3 ? "，温顺地将她丰满的臀部呈现给" : "，仰面躺下，然后张开她结实的双腿迎接") + "你。");
            }
            menu();
            addButton(0,"外貌",suwakoAppearance).hint("靠近些看她。");
            if(saveContent.shownKids != 0)
            {
               addButton(1,"摸头",suwakoPat).hint("摸摸她的头。");
               addButton(5,"孩子",suwakoChildren).hint("你想再次见到你的女儿们。");
               addButton(6,"怀孕",suwakoPregnancy).hint("轻轻抚摸并亲吻她高高隆起的孕肚。").disableIf(!pregnancy.get_isPregnant(),"她现在没有怀孕。");
            }
            addNextButton("性爱",suwakoSubSex).hint("你幻想着能对她做的所有变态事情……").sexButton();
            setExitButton("离开",suwakoSubLeave);
         }
      }
      
      public function scare() : void
      {
         clearOutput();
         outputText("虽然你决心让她后悔惹上你，但杀人或严重致残还是有点极端了。然而，当你深陷泥潭时，你的选择很有限，直接接触会让你产生吸毒般的幻觉，所以你举起你的[if (isunarmed) {沉重石头|[weapon]}]向她逼近，摆出致命攻击的架势。随着你的靠近，青蛙女孩惊恐地呜咽着，试图逃跑，但由于怀孕身体的负担，她的努力徒劳无功。在跌跌撞撞了一阵后，她用双臂护住头和脸，等待着末日的降临。你[if (hasranged) {射击|击打}]了她旁边的水面，她惊恐地尖叫起来。在一段沉默让她消化这一切后，她似乎意识到你不会再要她的命了。在蹚水离开这个地方之前，你最后严厉地瞪了她一眼，确信她已经明白了不要再招惹旅行者的信息。");
         saveContent.taughtLesson = 2;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function resistDatFrog() : void
      {
         clearOutput();
         get_images().showImage("froggirl");
         outputText("你摇了摇头，扑倒在地上，把头浸入一个清澈见底的水池中。你抬起头时，头脑已经清醒，冰冷的水珠从你的[hair]上滴落，你皱着眉头看向那个蛙女。");
         outputText("[pg]意识到你已经摆脱了她的催眠，蛙女咽了口唾沫，这个动作发出了一阵奇怪的呱呱声。当你重重地踩上阶地时，她手脚并用地爬出水池，或者说至少试图这么做。");
         outputText("[pg]她被一个巨大如沙滩排球般的孕肚压得喘不过气来，肚子像月亮一样苍白，闪烁着两栖动物的黏液。她把自己从深水池里拽出来，却又扑通一声滑了回去。");
         outputText("[pg]你站在水池边，怒视着她，要求她给个解释。");
         outputText("[pg][say: 好吧，天哪，对不起，]她举起宽大手指的手掌说道。[say: 对不起——我不干了，没造成伤害，不算犯规。你走你的吧。]");
         outputText("[pg]她皱起没有鼻子的脸，没精打采地滑进水里，一直沉到水面没过眼睛下方，呼出一口冒着泡的叹息。");
         outputText("[pg]你承认自己有点好奇她为什么试图引诱你，但你手头确实还有自己的任务。另一方面，她刚才确实试图引诱你进行你不想要的性行为。你打算就这样放过她吗？你是要质问这个蛙女，继续赶路，还是教训她一顿？");
         menu();
         addButton(0,"质问",questDatFrogGirl);
         if(saveContent.taughtLesson != 0)
         {
            if(get_player().get_weapon().isWhip())
            {
               addNextButton("鞭打",lash).hint("想在她身上爽一把是没戏了，但你手里的[weapon]可不介意沾点黏液。");
            }
            else
            {
               addNextButton("杀死",kill).hint("想在她身上爽一把是没戏了，但你手里的[weapon]可不介意沾点黏液。").hideIf(get_player().isUnarmed());
            }
            addNextButton("吓唬",scare).hint("心意到了就行——让她感受到死亡的威胁就够了。");
         }
         else
         {
            addButton(1,"教训",teachDatFrogALesson);
         }
         addButton(14,"离开",leaveFrogBe);
      }
      
      public function reset() : void
      {
         saveContent.taughtLesson = 0;
         saveContent.metSuwako = false;
         saveContent.lastEncounter = 0;
         saveContent.analMad = 0;
         saveContent.angryLosses = 0;
         saveContent.fought = false;
         saveContent.eggCount = 0;
         saveContent.submissive = false;
         saveContent.shownKids = 0;
         saveContent.pattyCake = false;
      }
      
      public function questDatFrogGirl() : void
      {
         clearOutput();
         get_images().showImage("froggirl");
         outputText("你决定质问这个撅着嘴的两栖动物，在她的水池边坐下，问她刚才为什么试图引诱你。");
         outputText("[pg][say: 我怀孕了，]她简短地吐着泡泡说道，仍然半沉在水池里。她撇了撇嘴，目光从你身上移开。");
         outputText("[pg]你挑了挑眉，要求她提供更多的信息。");
         outputText("[pg]她把自己从水里拉得更高，在这个过程中至少滑下去了两次。[say: 呼——！]她恼火地叹了口气，向后伸出手，抓住水池边缘，把自己撑起来，直到她隆起的肚子像个小岛一样浮出水面。[say: 我怀孕了，我烦透了！]她没好气地说，皱着眉头看着自己的肚子。");
         outputText("[pg]你打了个手势，想从这个暴躁的平胸准妈妈那里了解更多信息。");
         outputText("[pg][say: 我产卵的速度实在太快了，]她说着，漫不经心地把水泼在她巨大的肚子上。[say: 它们总是把我塞得满满的，我讨厌这种笨重迟缓的感觉。我甚至连自己的水池都爬不出去。]");
         outputText("[pg][say: 所以我本来打算……]她的眼睛飞快地左右闪躲，[say: ……把你迷晕……然后把我的卵塞满你的屁股。]她飞快地嘟囔着最后半句，显然是希望你没听见。");
         outputText("[pg]还没等你反应过来，她又赶紧补充道：[say: 这不会伤害到你——也不会伤害到卵——你只需要带着它们几天，直到它们孵化。然后我就不用管它们了。这真的是双赢！]");
         outputText("[pg]你好奇带着这么一大堆卵会是什么感觉。你是想主动提出帮这只青蛙怀卵，还是继续赶路？");
         menu();
         addButton(0,"小穴",superBonusFrogEggsInYerCooch).sexButton(2,false).disableIf(get_player().isPregnant(),"你已经怀孕了。");
         addButton(1,"怀卵",carryBeeGirlsEggsVoluntarilyYouButtSlut);
         setExitButton("离开",continueOnYourWay);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function lessonLeave() : void
      {
         clearOutput();
         outputText("你在这里做不了什么，所以你决定直接回家。女孩松了一口气，身体往水里沉了沉，庆幸自己躲过了你可能想到的任何报复。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lessonFollowup() : void
      {
         clearOutput();
         outputText("两小时后你醒来，独自漂浮在池塘里，偏头痛发作，衣服湿透。你捂着头，艰难地爬出来，回到营地。");
         dynStats(DynStat.Tou(-1));
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function leaveFrogBe() : void
      {
         clearOutput();
         outputText("你耸了耸肩，把撅着嘴的蛙女留在她的池塘里，跳下层层水池的阶地，走回你的营地，希望你的[hair]能在你回去的时候干透。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lash() : void
      {
         clearOutput();
         outputText("既然你不能用自己的身体享受她的身体，你唯一合理的做法就是使用你的[weapon]，你用一声清脆的响声向她表明了这一点。青蛙呜咽着，转身想离你远点，但你挥舞鞭子，抽打着她背部娇嫩闪亮的皮肤。她震惊地尖叫起来。");
         outputText("[pg][say: 求、求求你！我很抱歉试图骗你……]");
         outputText("[pg]你无视了她的求饶，再次挥鞭抽打，听着她尖叫，看着她疼得跳起来。你刚才抽打过的地方已经泛起红肿；看起来相当痛苦。不过，现在欣赏你的杰作还为时过早，于是你又继续抽了下去。");
         outputText("[pg]又是一声尖叫后，抽泣着的青蛙女孩再次转头看向你。[say:我……我真的很抱歉，我再也不会这么做了。]");
         outputText("[pg]看来已经足够了。她最好遵守这个承诺，否则你以后可能还得像这样惩罚她。你蹚过水，开始离开这个地方。");
         saveContent.taughtLesson = 2;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function knockUpSuwako() : void
      {
         var _loc1_:int = 0;
         if(pregnancy.knockUpChance(20,100,get_player()))
         {
            pregnancy.knockUp(25,96);
            _loc1_ = int(Math.max(saveContent.analMad - 1,0));
            saveContent.analMad = _loc1_;
         }
      }
      
      public function kill() : void
      {
         clearOutput();
         outputText("对她来说不幸的是，她光滑外表的影响意味着你唯一的报复方式是你的[if (isunarmed) {石头|[weapon]}]。");
         if(get_player().get_weapon().isRanged())
         {
            outputText("[pg]你瞄准目标，发现这个小池塘距离很近，很容易射中。虽然她试图躲闪，但青蛙缺乏足够的协调能力来躲避，她的生命在瞬间结束。");
         }
         else
         {
            outputText("[pg]你拉近距离，向青蛙挥舞，只听到一声短暂的尖叫，因为这个可怜的生物因怀孕而负担过重，无法逃脱。你的[if (isunarmed) {沉重石头|[weapon]}]全力击中她的头部，她安静了下来。");
         }
         outputText("[pg]除了水面上漂浮着一只毫无生气的臃肿两栖动物外，你在这里找不到任何有价值的东西，继续你的[day]。");
         saveContent.taughtLesson = 3;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidsPlay() : void
      {
         clearOutput();
         switch(Utils.rand(4))
         {
            case 0:
               outputText("当你观察着小女孩们在水里游来游去时，你注意到其中一些正坐在泥泞的岸边。你看着她们玩泥巴，把泥巴堆起来，表情显得相当无聊。");
               outputText("[pg]你决定花点时间和青蛙女孩们在一起，于是你[if (!isnaked) {脱下[armor]，}]和她们坐在一起。这四个小家伙茫然地盯着你，然后又继续漫无目的地推着泥巴。你再次引起了她们的注意，这次你开始把她们的泥堆塑造成一个小城堡。她们似乎被这个建筑迷住了，金色的眼睛里闪烁着惊奇的光芒，很快她们也急切地试图各自做一个属于自己的。");
               outputText("[pg]虽然她们自己做的小泥堡有点歪歪扭扭，但你还是给予了她们充满父爱的赞扬，并关爱地摸了摸她们每个人的头。这个举动让她们都开心地呱呱叫了起来，大大的笑容暴露了她们获得你喜爱后是多么的兴高采烈。");
               break;
            case 1:
               outputText("你看着可爱的青蛙女儿们在平静的水中悠闲地游来游去。在观察她们时，你决定加入她们，这可能是一次美妙的增进感情的经历。[if (!isnaked) {脱下[armor]|既然你已经一丝不挂了}]，你涉入冰冷的水中，你的女儿们兴奋地呱呱叫着向你游来。");
               outputText("[pg]你和小青蛙女孩们在水里悠闲地游着。在游泳时，你注意到你的女儿们有着奇特的差异。有几个没有胳膊或腿，让你不可思议地联想到大蝌蚪。不过有几个明显正在长腿，正热情地踢着腿以跟上你。虽然你发现你的大部分女儿看起来就像是她们母亲的缩小版。");
               outputText("[pg]和孩子们游了一会儿后，你很快就感到有些疲倦，于是向岸边游去。她们一路跟着你回到陆地，当你试图离开水面时，她们拼命地抱住你的身体。看着她们满是泪水的悲伤脸庞，你几乎想再多陪她们一会儿。这也许很遗憾，因为你知道你不能永远留在这里陪她们。");
               outputText("[pg]你拥抱着你的女儿们，给了她们每个人一个紧紧的拥抱，她们也忧郁地回抱了你，你试着温柔地解释说，只要有空你就会回来。希望她们能理解，在你离开前她们脸上露出的淡淡微笑让你确信，她们至少知道你很在乎她们。");
               break;
            case 2:
               if(saveContent.pattyCake)
               {
                  outputText("你的一个女儿兴奋地呱呱叫着，迅速靠近你，抱住你的手臂，催促你和她一起坐下。当你坐下后，她开始玩拍手歌，你意识到她就是你最初教的那一个。她按照歌曲的节奏呱呱叫着，并做着手部动作。");
                  outputText("[pg]当她完成时，她那可爱天真的脸上露出了灿烂的笑容。然后，女孩深情地拥抱了你，紧紧地抱住你，同时用她的脸颊蹭着你的脸颊。你回应了她的动作，这让她狂喜地呱呱叫起来，然后又回去玩拍手歌。这一次你和她一起念儿歌，年轻的青蛙女孩开心地配合着你的节奏。");
                  outputText("[pg]很快你就得走了，你站起身来，这让小女孩紧紧地抱住了你。她悲伤的呜咽声让你几乎重新考虑离开，但你真的不能再待下去了。你[if (tallness >= 72) {蹲下来并}]张开双臂抱住她，把她拉近，给她一个温暖的拥抱，她也紧紧地回抱了你。你温柔地擦去她的眼泪，向她保证你会再回来玩的。她把悲伤的目光移向地面，希望她能理解你不能留在这里陪她。温柔地亲吻她的额头，至少让她再次露出了淡淡的微笑……");
                  outputText("[pg]你慢慢地拍了拍她的头，然后离开了你的小女儿……");
               }
               else
               {
                  outputText("你走向坐在泥泞岸边的一个女儿，示意她面向你。她高兴地照做了，发出一声欢快的蛙鸣，同时前后摇晃着身体。你回想起家乡的拍手歌，决定试着教她。起初她很难跟上节奏，但很快她就能跟上你的步伐了，于是你决定开始加快速度。节奏的加快让她发出了愉快的咯咯笑声，并吸引了她的其他兄弟姐妹靠近，带着着迷的表情观察。");
                  outputText("[pg]很快，你的其他小青蛙女孩也开始这样做了，她们以相同的音调和节奏发出蛙鸣，而不是跟着歌词唱。看到她们如此迅速地被手部动作和声音所吸引，尽管她们可能并不理解实际的歌词，这让你感到有些有趣。尽管你很好奇，但你知道你必须得走了。你起身离开的那一刻，她们都停止了玩耍，开始慢慢地回去游泳，或者只是坐在泥里。这让你不禁想，她们是不是只是因为你在做，才对模仿这个动作感兴趣。");
                  outputText("[pg]你最初教这个游戏的那个女儿突然抱住了你，用模仿你刚才教她的欢快歌唱节奏发出蛙鸣。你能看出她想让你继续，但你摇了摇头，同时深情地拍了拍她的头。当你从她身边抽身时，她显然很伤心。她可爱的脸上挂着愁容。她最终带着一声悲伤的蛙鸣坐回了泥泞的岸边，在你离开时，她独自一人忧郁地唱着那首歌……");
                  saveContent.pattyCake = true;
               }
               break;
            case 3:
               outputText("你在泥泞的岸边，在一个女儿旁边坐下，看着她心不在焉地踢着浸在平静水面下的脚。当你轻轻地[if (isbiped) {把她拉到你的腿上|让她坐在你面前}]时，小女孩没有反抗。你用一只手臂紧紧地搂住她的腰，开始深情地拍她的头，她高兴地对你发出蛙鸣。当你继续充满爱意地抚摸她的头发，并欣赏你其他女儿悠闲地游来游去时，她湿润的黑色卷发紧贴着你的手指。看着女孩在你腿上可爱地呱呱叫，你觉得也许值得试着教她和你说一样的语言。如果有一天能和你的女儿们进行真正的对话，那肯定会很棒。");
               outputText("[pg]你一边继续摸着她的头，一边开始慢慢地对她清晰地念出[say:[爸爸]]这个词，这让她转过头来看你。她歪着头，显然不确定你期望她做什么。当你再次对她说这个词时，蛙女慢慢地呱呱叫了一声。你不断尝试让她说[say:[爸爸]]，但都无济于事，只得到了不确定的声音作为回应。");
               outputText("[pg]也许带着一丝失望，你[if (isbiped) {把小蛙女从你的腿上移开，然后}]起身准备离开。孩子紧紧地抱住你，她皱着眉头，泪眼汪汪，让你感到一种奇怪的内疚，也许是因为你让她感到苦恼了。在你走之前，你抓住她的腋下把她举起来，调皮地把她稍微抛向空中。她发出一声害怕的呱呱叫，直到你接住她，她之前的愁容现在变成了欢乐的笑容。");
               outputText("[pg]你又和她玩了一会儿，然后离开，留下小蛙女在原地开心地跳上跳下。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidsOrgy2() : void
      {
         clearOutput();
         outputText("你在青蛙女儿们玩耍的池塘泥岸上醒来，回想起刚才对她们每个人进行的无休止的肏弄。当你准备坐起来时，你感觉到身上有轻微的重量，并注意到你的孩子们都可爱地依偎着你。她们依偎着你时那宁静的表情本该是令人心暖的，前提是她们身上没有沾满你黏糊糊的精液，或者小穴里没有精液滴落下来……");
         outputText("[pg]你小心翼翼地不吵醒她们，虚弱地一瘸一拐回到营地。");
         cheatTime(4);
         get_player().changeFatigue(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidsOrgy() : void
      {
         clearOutput();
         outputText("看到你亲爱的女儿们都用充满变态欲望的金色眼眸盯着你，你决定大胆地走进这群可爱的小女孩中，给她们最渴望的东西。她们兴奋地呱呱叫着，互相推搡，试图抢占享受你肉棒的轮次。不过你决定自己做主，抓起其中一个青蛙女孩，让她弯下腰，把翘挺的小屁股撅向你。女孩转过头看着你，微微摇晃着柔软的臀部，脸上带着调皮的坏笑，仿佛在乞求你占有她。当你抓住她纤细的臀部，将你的[cock]深深地猛插进她丝滑的深处时，她那调皮的笑容瞬间消失了。");
         outputText("[pg]她软弱地哭出声，每当你的[if (biggestcocklength >= 10) {[cockhead]刺入她尚未发育成熟的子宫颈|[cock]完全没入她的小穴}]时便喘不过气来。你以钢铁般的力道将她牢牢把持，每次无情地冲入那个小女孩时，阵阵快感穿透你的身体。她那上乘小穴绝妙的褶皱和纹路爱抚着你的肉棒，令你愈发亢奋。你的精液在[if (hasballs) {[balls]|体内}]中汹涌翻腾，随着快感节节攀升而渴望释放。你仍然把持着孩子的纤细腰肢，将她一路向下压到底，呻吟着将精液深灌入她那等待已久的子宫。你的女儿可爱地哀鸣着，在极乐中颤抖，而她那润滑的内壁则贪婪地从你依然颤动的[if (hasballs) {囊|肉棒}]中尽可能地榨取每一滴精液。");
         outputText("[pg]你把女儿从你的鸡巴上拔下来，环顾四周，看到你的其他孩子都用羡慕的眼神看着。很明显，她们想要和她们的姐妹一样的待遇，被她们[daddy]的爱填满。幸运的是，你无意让你这些两栖天使们失望。你打了个响指，让女孩们都靠在池塘岸边。看着她们孩子气的屁股为了讨好你而扭动，你敏感的[cock]兴奋地抽动着。你走近其中一个，一挺身就撞进了她湿透的洞里。她紧致的内壁紧紧夹住你，拼命榨取你，让你操得更加爽快。你的鸡巴[if (biggestcocklength >= 10) {猛烈撞击着她颤抖的子宫颈|完全没入她湿滑的褶皱中}]，同时你开始用手指抠弄另外两个正急切等待轮到她们的青蛙女孩。你发出一声沉重的闷哼，精液冲进你女儿的小穴，把她的子宫染成纯白色。");
         outputText("[pg]另外两个被玩弄着颤抖小穴的女儿，用乞求的眼神看着你。你毫不犹豫地把肉棒从刚刚填满精液的洞里拔出来，开始交替抽插这两个急不可耐的小女孩。你的肉棒在两个小穴之间进进出出，交替着深深地撞击她们的内部，让你的女儿们在狂喜中发出可爱的哀鸣。很快，你感觉到你的男子气概痛苦地跳动着，你猛地抽出肉棒，把黏糊糊的白色精液涂在她们毛绒绒的浅绿色屁股上。她们俩都带着满足的微笑盯着你，各自发出呱呱的叫声，让你确信她们在说，[say:我们爱你，[Daddy]。]");
         outputText("[pg]你看了看，发现还有无数的小女孩在不耐烦地等待着轮到她们。她们带着温顺的微笑渴望地注视着你，撅起她们稚嫩的屁股，等着你很快来填满。在接下来的几个小时里，你继续操着你的每一个青蛙女儿，你的肉棒感觉就像着火了一样，因为你在她们湿滑的裂缝里射了太多次。这是天堂还是地狱？你不太确定；你满脑子想的都是操你能弄到手的每一个紧致得惊人的青蛙小穴。每抽插几下，你就会把现在少得可怜的精液射进一个等待的洞里，然后再转向下一个，直到最后一切都变得模糊不清……");
         get_player().orgasm("Dick");
         doNext(kidsOrgy2);
      }
      
      public function kidsLewd() : void
      {
         clearOutput();
         outputText("看着你完全赤裸的小蛙女们天真地在水里玩耍，你的心跳开始加速，你决定……");
         menu();
         addNextButton("操",kidsFuck).hint("开始好好地干她们一顿。").sexButton();
         addNextButton("蝌蚪",tadpole).hint("和你最年幼的一个女儿[i:玩耍]。").hideIf(!get_allowBaby());
         addNextButton("舔阴",cunny).hint("舔她们其中一个的小穴。");
         setExitButton("返回",suwakoChildren);
      }
      
      public function kidsLeave() : void
      {
         clearOutput();
         outputText("看到你的女儿们在平静的池塘里安详地玩耍，你心中涌起了一丝身为[father]的喜悦。你注视了她们一会儿，然后决定离开。");
         outputText("[pg]当你转身准备离开时，你听到孩子们齐声地呱呱叫着，你回头一看，发现她们都在高兴地向你挥手告别。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidsFuck() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {急不可耐地脱下并扔掉你的[armor]，然后走|走}]进池塘冰凉的水中，你的女儿们正开心地在里面戏水。当其中一个游过你身边时，你一把抓住她，将她拉近。当你猛烈地将嘴唇压在她的嘴唇上时，她发出一声惊讶的[b:呱呱]声。当你强迫她吞下你的唾液时，你抚摸着她平坦的胸部和丰满的小屁股。将嘴唇从她身上移开，你听到她气喘吁吁的喘息声，看到这个小青蛙娘在你的怀里颤抖着。你开始抚摸她那两个完全没有乳头的初具雏形的乳房。她发出的声音让你想把她按倒，像玩偶一样操她。然而，你克制住了这种可怕的欲望，转而将手伸进她那纤细却又无比柔软的双腿之间。");
         outputText("[pg]她紧闭的缝隙相当湿滑，但即使是容纳你的一根手指也显得有些吃力。你色情地在小女孩体内抽插着手指，她在你灵巧的抚摸下颤抖着。她的内壁渴望地夹紧你侵入的手指，不断收缩着试图榨取它。插入第二根手指让这个青蛙女孩痛得皱起眉头，发出一声微弱的呱呱叫，但你很清楚她必须忍受这些，才有可能吃下你的肉棒。没过多久，她痛苦的表情就变得淫荡起来，巨大的舌头从嘴角垂下，大口大口地喘着粗气。她发出一声柔弱的呜咽，小穴痉挛着，贪婪地缠绕着你蠕动的手指。");
         outputText("[pg]你抓住女儿柔软的大腿，将她抬起，为不可避免的插入调整好角度。你已经勃起的肉棒在感受到[cockhead]试图[if (biggestcocklength >= 10) {挤入|推开}]她那柔软小穴褶皱时颤抖着期待。终于被包裹住的感觉让你浑身战栗，而你的女儿则因你猛地将肉棒插入她颤抖身躯深处而发出一声痛苦的哭叫。她的洞口仿佛天生为你而生，每当你推入再抽出时，她的每一道褶皱和纹路都在抚摩你。你的小女儿那纯洁的小穴[if (biggestcocklength >= 10) {容纳不下你完整的长度。她那尚未发育成熟的子宫被你的龟头不断叩击，让她颤抖着发出软弱的哀鸣，红润的脸上浮现出痛苦的表情|将你完整的长度全数吞入。她软弱的哀鸣和每次你完全插入时发出的淫荡喘息不断催促着你}]。");
         outputText("[pg]你的小女儿在你坚硬如石的肉棒上起伏，她的爱之隧道用粘稠的淫液润滑着你。她绝望地紧紧抱住你，她天生冰凉的肌肤与你摩擦的感觉，帮助你在这个潮湿的沼泽中，不至于因为这场激烈性爱所需的体力消耗而过热。很快，她温顺的喘息和呜咽变成了可爱的欢愉娇啼，她湿滑的内壁贪婪地挤压着你，乞求你用充满活力的精液让她受孕，就像你对她母亲做的那样。你的阴茎兴奋地跳动着，一股暖流传遍全身，而她那淫荡的小穴则乞求着她自己[father]的大量精液。");
         outputText("[pg]要不是她小穴里的淫液，你根本不可能完成那最后一次冲刺，将你推向高潮。你的[if (hasballs) {[balls]翻腾|肉棒颤抖}]的感觉实在难以忍受，你的精子冲上你的肉棒，试图填满你女儿的小穴。你的小女孩在你的怀里颤抖，你紧紧抓住她柔软的大腿，那力道比最上等的钢铁还要坚硬，很可能会在她浅绿色的皮肤上留下淤青。每一股精液注入你忠诚女儿等待着的子宫时，那种令人迷醉的感觉麻痹了你的大脑，直到你完全精疲力尽。[if (cumhighleast) { 当你把她灌满时，小女孩的肚子已经肿胀起来，看起来就像是怀了孕一样可爱。}]");
         outputText("[pg]你将疲软的肉棒从她的小穴中抽出，抱着颤抖的女孩来到泥泞的岸边，让她躺下。当你试图松开她时，她发出了呜咽声，她仍在颤抖的身体让你决定紧紧抱住她。当你抚摸她湿润的黑发时，她沉重的喘息声慢慢平息下来。");
         outputText("[pg]当女孩终于平静下来时，你注意到你其他可爱的女儿们已经把你围了起来。她们全都色眯眯地盯着你，一边兴奋地摩擦着她们纤细的大腿，回味着刚才目睹的一切。");
         get_player().orgasm("Dick");
         menu();
         addNextButton("群交",kidsOrgy).hint("把她们全干了。");
         addNextButton("逃跑",kidsFlee).hint("你今天宁愿逃跑。");
      }
      
      public function kidsFlee() : void
      {
         clearOutput();
         outputText("感觉到危险迫在眉睫，你赶在所有宝贝女儿决定对你发起攻击之前，匆忙逃之夭夭。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gillEscape() : void
      {
         clearOutput();
         outputText("多亏了你的鳃，你能在水中呼吸。当青蛙女孩意识到你今天不会为她溺水时，她的表情失去了曾经的自信。她松开了你，迅速向岸边游去，而你则紧追不舍。当怪物到达水边时，她跳上了泥泞的陆地。你跟着她爬了出去，拒绝让她逃跑。");
         outputText("[pg]你可以看到她用金色的眼睛瞪着你，很可能是打算在最初的计划失败后把你打倒！");
         startCombat(new FrogGirl());
      }
      
      public function get_debugName() : String
      {
         return "蛙女";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getFrogButtFilled() : void
      {
         clearOutput();
         outputText("一小时后你醒了过来，花了好一会儿才想起发生了什么。渐渐地，你拼凑出了过去一小时的记忆，想起了蛙女、她催眠的歌声和致幻的粘液。你仰面漂浮在一个清澈见底的水池里，在你上方，在红树林树冠之间，玛瑞斯的天空在头顶高处慵懒地漂浮着。");
         outputText("[pg]还有那些卵。哦，见鬼，那些卵！你在水里扑腾着，稳住身子，低头看着自己高高隆起的肚子。你看起来就像怀孕九个月了！那个蛙女把卵排进了你的体内，然后拍拍屁股走人，留你下来把它们生出来。你似乎也没法把它们逼出来——看来你只能怀着这些卵直到足月了。");
         outputText("[pg]你双臂环抱着沉甸甸的肚子，爬出了水池。水从你赤裸的身体上流下，将最后的粘液留在了不再清澈的水中。");
         outputText("[pg]你费力地将[armor]穿在巨大的肚子上，然后动身返回营地，虽然身体有些酸痛，但这次磨难让你长了点记性。");
         dynStats(DynStat.Inte(1));
         get_player().buttKnockUp(23,30,1,1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function foursomeNo() : void
      {
         clearOutput();
         outputText("你决定自己对四人行没兴趣，便干脆转身，沿着来路往回走。当你[walk]离开时，还能听见两道恼火的呱呱声在身后追着你响起，直到你走到听不见为止。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function foursomeFuck() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {脱下你的[armor]，然后靠近|靠近}]这顺从的三人组，并[if (isbiped) {跪在|来到}]绿色蛙女的身后。你用你的[cock]戏谑地拍打着她丰满的臀部，让她浑身颤抖，她淫荡的身体正期待着你接下来肯定会给她的粗暴操弄。她犹豫地回头看着你，咬着下唇，你将你那根的顶端抵在她已经滴着水的穴口上。你抓住她那充满母性的臀部，开始慢慢地将你的长度沉入她那润滑良好的深处。她湿滑的褶皱很容易就被你的长度分开，内壁高兴地拥抱着你。女孩[if (biggestcocklength >= 10) {大声喘息着，因为你的[cock]很快就捣到了她的子宫|可爱地呜咽着，因为你的[cock]完全消失在她丝滑的通道里}]。你每一次快速的抽插都让女孩的小穴紧紧地夹住你，她丰满的双乳因为你猛烈的交媾而剧烈地弹跳着。");
         outputText("[pg]她因纯粹的欢愉而大声呱呱叫，这更让你兴奋起来，令你[if (biggestcocklength >= 10) {每一次[hips]挺动都把肉棒直顶到她的宫颈|用你的[hips][b:{smack}]地撞上她丰满的臀部}]。你很快感觉到自己的[if (hasballs) {[balls]|男根}]因渴望填满她而阵阵悸动；你牢牢抓住她充满女人味的腰肢，热烈的抽插也变得更加粗暴。快感的震颤冲击着你的脑海，而这只蛙女拼命向后挺起屁股，迎合你娴熟抽插的感觉，也让她颤抖的小穴愉悦地紧紧裹住你。你喉间逸出一声野性的低吼，肉棒最后一次[if (biggestcocklength >= 10) {亲吻到她的宫颈|被她完全吞没}]，随后便向她不断收缩的体内射入无数股精液。");
         outputText("[pg]当你射满眼前的伴侣时，你望向另外两个，只见她们正急切地抚弄着自己，饥渴地舔着嘴唇。你把仍然兴致勃勃的肉棒从绿色女孩体内抽出，她伤心地呜咽起来，阴唇也因失去你的陪伴而抽动。接着你抓住那名粉色蛙女，握住她的腰，一下子将你的[cock]顶进她体内。你不断抽插她湿软的小穴，她发出的淫荡哀鸣在你听来简直如同乐声。每当你[if (biggestcocklength >= 10) {猛撞她颤抖的子宫颈|将自己完全没入她曲线丰润的身体}]时，她的小穴都会紧紧夹住你。她试图退开时，你便把她拽回来迎向你的抽插，并开始用力揉捏她丰满的乳房，力道大得很可能会留下淤痕。");
         outputText("[pg]你最后一次将[if (biggestcocklength >= 10) {[cockhead]狠狠顶在她等待受孕的子宫口上|[cock]整根插进她体内}]，开始把浓烈的精液灌满她仍在痉挛的深处。她小穴内壁不断收缩，贪婪地想把你榨干。你继续将承载你未来子嗣的子宫灌得满满当当，同时玩弄着她柔软的乳房，直到那里真的留下了一片淡淡的淤痕。粉色蛙女对你这样对待她的乳房只发出柔弱的呜咽，但她陶醉的表情却说明她享受着每一秒。");
         outputText("[pg]当你终于发泄完毕时，你忍不住在将阴茎从她仍在痉挛的小穴中拔出的感觉中颤抖。看到你的精液从她现在湿漉漉的裂缝中滴落，你欣赏着你把她弄得一团糟的样子。你听到一声兴奋的蛙鸣，转向最后一个女孩。你看到她仰面躺着，耐心地等待着，她健美的双腿张得大大的。无法抗拒她闪闪发光的裂缝的景象，你爬到她身上，将你的[cockhead]在女孩湿润的入口处摩擦。当你终于用你[masculine]的长度分开她的阴唇并深入她的深处时，她变态地喘息着。当你的[cock][if (biggestcocklength >= 10) {撞击她的子宫|完全消失在她的阴道里}]时，她的呻吟声越来越大。她用强壮的双腿缠住你的腰，防止你在抽插时拔得太远。你需要咬紧牙关，才能忍受你敏感的肉棒被她收缩的内壁不断挤奶。每次你用力捣入她时，她柔软的乳房[if (hasbreasts) {都会压在你的乳房上|都会晃动}]。");
         outputText("[pg]你抓住女孩丰满的臀部，将这个红色女人毫不留情地干进泥里。你感觉到自己的[if (hasballs) {[balls]翻腾起来|小腹绷紧起来}]，精液在体内躁动不已，渴求着释放。最后一次有力的挺入后，你将[cock][if (biggestcocklength >= 10) {顶到她的子宫颈上|整根没入她体内}]，把剩下的每一滴都射进这个颤抖的女孩体内。她的内壁缠住你的肉棒，榨取着你，好让她的子宫喝下你所有残余的精种。你只能浑身发颤、喘息不止，她的双腿仍紧紧夹着你，不让你离开。当你终于将能射出的东西全都灌进她那已经塞满精液的小穴里时，女孩温柔地亲吻你的脸颊，一边抚摸你的后背，一边在你耳边甜甜地呱鸣。");
         outputText("[pg]她把你的手放在她此刻仍平坦的小腹上，那心满意足的笑容让你明白，她有多感激你刚刚给她的礼物。终于感觉到她的双腿从你身上松开，你颤巍巍地从女孩身上抽离，深吸一口气。你环顾四周，看见三个蛙女的小穴都在滴落你充满生命力的精液。她们美丽的脸上都挂着满足的微笑。那个绿色的女孩朝你送来一个飞吻，眼神告诉你，她已经迫不及待想再次见到你。");
         outputText("[pg]一股自豪感在你疲惫的胸中涌起，你心里有一小部分也为能让她们三个都满足而感到欣慰。也许你以后还得再来一趟，看看她们怀孕后能带来什么好处；不过眼下，你只是抹去从额头淌下的汗水，把疲惫的三人留在身后，转身离开。");
         get_player().orgasm("Dick");
         knockUpSuwako();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function foursome() : void
      {
         clearOutput();
         outputText("再次穿过潮湿的沼泽时，你很快就偶然发现了那个蛙女似乎居住的平静池塘。既然你已经在这里了，你决定不妨去拜访她。坐在泥泞的岸边，你凝视着这个相当大的池塘，听着昆虫的歌声，等待着看那个女孩是否会像往常一样出现。");
         outputText("[pg]没过多久，那个相当迷人的女孩就从水里探出头来，两只金色的眼睛盯着你。她从水里跳了出来，尽管她可爱的脸上带着一丝皱眉。突然，又有两声水花溅起，一个粉红色和一个红色的青蛙女孩从水里跳到了泥泞的地上。这两个新来的女孩除了颜色不同外，与你认识的那个女孩惊人地相似。即使她们的金色眼睛被黑色的刘海稍微遮挡，你也能看出她们都在像打量一件珍贵的奖品一样打量着你。");
         outputText("[pg]不安感涌上心头，你迅速[if (isbiped) {跃起|站起身}]，准备击退任何潜在的攻击。");
         outputText("[pg]当粉色和红色的两栖女孩眼中闪烁着情欲的光芒开始向你靠近时，你那绿色的情人突然以一种令人惊讶的占有欲抓住了你的手臂。她迅速对另外两人呱呱叫了几声，那两人耸了耸肩，只是四肢着地，向你展示她们丰满的臀部。可爱地依偎在你手臂上的女孩深情地用脸颊蹭了蹭你，用柔和的语调呱呱叫了一声，然后松开了手。你看着她在其他女孩旁边四肢着地，和她们一起向你展示她们美丽的后臀。");
         outputText("[pg]看着她们各自扭动着丰满臀部的样子，你很容易就能明白她们想让你和她们交配……");
         menu();
         addNextButton("干",foursomeFuck).hint("把她们三个都配种。");
         addNextButton("算了",foursomeNo).hint("你今天没心情玩四人行……");
      }
      
      public function forget() : void
      {
         clearOutput();
         outputText("你摇了摇头，决定暂时忽略这个发现，继续探索沼泽。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followDatFrog() : void
      {
         clearOutput();
         get_images().showImage("froggirl-anal");
         outputText("你踩着水花爬上水池的梯田，一边走一边脱下你的[armor]，把你的装备搭在红树林的树脊上。当你赤身裸体地走进她的水池时，她向你伸出双臂。她站起来迎接你，你注意到水下隐藏着一个肿胀的、怀孕的肚子。");
         outputText("[pg]她的皮肤摸起来滑溜溜的，当她把你拉近时，她把她的体液留在了你的手臂和[chest]上。它接触到你的地方会感到刺痛，你周围的[sun]光似乎变得更亮了一些。她的歌声继续着，你发誓你能看到音乐在空气中飘荡，每一个不同的音符都是在空气中漂浮的不同的霓虹灯。半专注状态下，你的眼睛来回扫视，追踪着微小的光点。");
         outputText("[pg]她圆滚滚的肚子摩擦着");
         if(get_player().hasCock())
         {
            outputText("[eachCock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[vagina]");
         }
         else
         {
            outputText("你赤裸而敏感的腹股沟");
         }
         outputText("，同时她将指尖举到你的唇边。被她的歌声迷住的你张开嘴，将她的手指含入。上面那层薄薄的黏液尝起来有股柑橘般的甜味，又一阵令人陶醉的快感蒙蔽了你的意识。她歌声的色彩在空中飘荡得更加强烈，当她把你向后推，让你靠在树根墙上，舒服地漂浮在水里时，你迷迷糊糊地笑了起来。");
         outputText("[pg]你的双臂搭在水池边缘，她微笑着抚摸你的脸颊，让又一阵色彩和光芒冲刷过你的大脑。在药物的作用下，你放松下来，任由你的[legs]在水池中慵懒地漂浮，而蛙女则微笑着，调皮地咬着下唇。");
         outputText("[pg][say: 抱歉玩了这出偷梁换柱，小闪光，但我需要别人来帮我怀这些……]她说着，拍了拍她沉甸甸的孕肚。[say: 但我肯定你会享受每一分钟的。]");
         outputText("[pg]她的话让你警觉起来，你试图推开她。");
         outputText("[pg][say: 不行不行不行……]她柔声哄着，滑溜溜的手张开按在你的[chest]上。她冰凉湿滑的嘴唇贴上你的，那条涂满更多致幻黏液的舌头强行挤进你惊讶的嘴里。那长得离谱的器官深深地推入你体内，顺着你的喉咙滑下。你条件反射地吞咽，咽下了一大口她那黏糊糊的汁液。");
         outputText("[pg]她结束了这个吻，在你们的嘴唇之间拉出一条长长的唾液丝。蛙娘得意地笑了，你咯咯地笑着，想问她有什么好笑的。然而，还没等你开口，一阵强烈的颤栗快感就席卷了你。从你的[feet]开始，它在你的身体里轰鸣而上，感觉就像每一个神经末梢都在高潮。它可能需要几秒钟或几个小时才能到达你被药物麻痹的大脑，但你已经完全不在乎了。");
         outputText("[pg]你向后躺去，在水中颤抖着，张着嘴，眼睛松散地聚焦在上方蛙女的身上。你的视野里充满了色彩，当她再次张开嘴唱歌时，色彩和声音的星云弥漫在空气中。");
         outputText("[pg][say: 现在感觉好点了吗？]她问道，世界溶解在无法名状的色彩中。她的声音在水面上奇特地回荡着。");
         outputText("[pg]你完全迷失在感觉中，当你感觉到滑溜溜的手指在水下摆弄你的[asshole]时，你喘息着。当蛙娘在你双腿之间摆好姿势时，美妙的、轻飘飘的感觉加剧了你的快感。一种冰凉的柔软压在你的屁眼上，某种浓稠的黏液将它粘在你抽搐的穴口上。");
         outputText("[pg]你斗鸡眼般地试图看清蛙女，她抓住你的臀部调整着自己的姿势。她摆出一种类似剪刀式的姿势，小穴紧贴着你的屁眼。伴随着一声咕哝，她双臂环抱着自己苍白的肚子，紧紧抱住自己。你感觉到她柔软的小穴在你身上抽搐，同时有什么黏糊糊的、巨大的东西压在你的花蕾上。");
         outputText("[pg][say: 啊！嗯！]她呻吟着，颤抖着，用力压着自己的孕肚。一团圆滚滚、黏糊糊的东西从她的小穴里渗出，在进入你体内时撑开了你的屁眼。");
         get_player().buttChange(30,true,true,false);
         outputText("[pg]当一个苹果大小的青蛙卵挤进你体内时，你醉醺醺地咯咯笑着。如果你不是那么沉迷于令人神魂颠倒的快感中，你可能会对这种压力感到担忧。相反，你只觉得更加头晕目眩——那些卵一定是用蛙女的粘液润滑过的——随着一颗卵进入你的体内，世界开始旋转。");
         outputText("[pg][say: 搞定一个……]蛙女咬紧牙关嘶嘶地说。但你甚至连对她的话挑眉的力气都没有了。压力再次在你的屁眼处聚集，蛙女又把一个巨大的、软绵绵的卵推进了你体内。[say: 嗯！]她咕哝着，因为努力把卵塞进你身体而颤抖着。");
         outputText("[pg]你又咯咯地笑了起来，喜欢随着每一颗卵进入你体内而世界旋转的感觉。她把一颗又一颗卵产进你体内。这对你来说终于太多了，你的意识崩溃了。世界完全溶解成了一个由色彩、感觉和声音组成的漩涡拼贴画。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(1));
         menu();
         addButton(0,"继续",getFrogButtFilled);
      }
      
      public function findTheFrogGirl() : void
      {
         clearOutput();
         get_images().showImage("froggirl");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1017) == 0)
         {
            outputText("你开始在沼泽中跋涉，在浓稠的泥浆中艰难前行。昆虫每秒都在你耳边嗡嗡作响，在你头顶盘旋飞舞。");
            outputText("[pg]你很快就注意到，在嗡嗡声的背后，有一种新的声音——一种悦耳的啁啾声。你一步步向它走去，拨开垂下的灰色苔藓帘子，直到沼泽中黑暗的树木让位于红树林宽阔的根部。零星的音符滴入你的耳朵，当你向声源移动时，你感到异常放松。");
            outputText("[pg]宽阔的树根形成了独立的小池塘，看起来像是冷凝水汇集成了清澈湛蓝的水池。啁啾声在红树林根部的高墙间回荡，来自坐在最大水池中的一个苗条身影。她隐约有着女性的特征，盘腿坐在齐腰深的水池中，双臂张开，表示欢迎。光线在她柔软光滑的皮肤上闪烁，她张开嘴唇，发出一连串诱人悦耳的音符。");
            outputText("[pg]你走近了一些，爬上由清澈水池组成的低矮梯田，你的[feet]敲击着红树林粉白色的木头。靠近声源后，阳光的刺眼程度降低了，歌唱者的身影突然变得清晰起来。");
            outputText("[pg]她有着石灰绿色的皮肤和白色的下腹部，最像一只青蛙，甚至从头到脚都覆盖着一层滑溜溜的光泽。尽管有着明显的女性骨架，但她珍珠般洁白的胸部完全平坦，没有乳头。黄色和红色的斑纹点缀着她，顺着她的四肢蔓延。她的手臂末端是异常宽大的手，指尖呈宽阔的圆形。她的一只手拨开垂下的粉红色刘海，一双黄色的大眼睛在刘海下明亮地向你眨眼。");
            outputText("[pg]她撅起嘴唇，吹出另一串奇特诱人的音符，它们在空气中飘荡，缠绕在你的头上，让你沉浸在令人陶醉的音乐迷雾中。不由自主地，当音符在你的大脑中荡漾时，你感到眼睛半闭。");
            outputText("[pg]她笑了，一条三英尺长的舌头从嘴里伸出，顺着她平坦的胸部滑下，一层粘液涂抹在她的躯干上。她举起一只手，向你勾了勾手指，示意你靠近她的水池。");
         }
         else
         {
            outputText("在探索沼泽时，你注意到在嗡嗡声的背后有一种熟悉的声音——一种悦耳的啁啾声。你一步步向它走去，拨开垂下的灰色苔藓帘子，直到沼泽中黑暗的树木让位于红树林宽阔的根部。零星的音符滴入你的耳朵，当你向声源移动时，你感到异常放松。");
            outputText("[pg]宽阔的树根形成了独立的小池塘，看起来像是冷凝水汇集成了清澈湛蓝的水池。啁啾声在红树林根部的高墙间回荡，来自坐在最大水池中的一个苗条、熟悉的身影。蛙女盘腿坐在齐腰深的水池中，双臂张开，表示欢迎。光线在她柔软光滑的皮肤上闪烁，她张开嘴唇，发出一连串诱人悦耳的音符。");
            outputText("[pg]你走近了一些，爬上由清澈水池组成的低矮梯田，你的[feet]敲击着红树林粉白色的木头。靠近声源后，阳光的刺眼程度降低了，歌唱者的身影突然变得清晰起来。");
            outputText("[pg]她撅起嘴唇，吹出另一串奇特诱人的音符，它们在空气中飘荡，缠绕在你的头上，让你沉浸在令人陶醉的音乐迷雾中。不由自主地，当音符在你的大脑中荡漾时，你感到眼睛半闭。");
            outputText("[pg]她笑了，一条三英尺长的舌头从嘴里伸出，顺着她平坦的胸部滑下，一层粘液涂抹在她的躯干上。她举起一只手，向你勾了勾手指，示意你靠近她的水池。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1017,FlagDict_Impl_.arrayReadInt(_loc1_,1017) + 1);
         outputText("[pg]你是要跟着音乐投入蛙女的怀抱，还是抵抗她的旋律？");
         menu();
         addButton(0,"跟随",followDatFrog);
         addButton(1,"抵抗",resistDatFrog);
      }
      
      public function execEncounter() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(Utils.randomChance(!pregnancy.get_isPregnant() || saveContent.shownKids != 0 ? 33 : 100) && get_player().get_buttPregnancyIncubation() == 0 && saveContent.taughtLesson < 2)
         {
            findTheFrogGirl();
         }
         else
         {
            if(true == !saveContent.metSuwako == true)
            {
               suwako();
               return;
            }
            _loc2_ = true == (saveContent.eggCount >= 15 && !saveContent.fought);
            if(_loc2_ == true)
            {
               submissiveSuwako();
               return;
            }
            _loc1_ = true == saveContent.analMad >= 3;
            if(_loc1_ == true)
            {
               suwakoAngry();
               return;
            }
            suwakoRepeat();
         }
      }
      
      public function encounterName() : String
      {
         return "蛙女";
      }
      
      public function encounterChance() : Number
      {
         var _loc1_:Number = 0;
         if(get_player().get_buttPregnancyIncubation() == 0 && saveContent.taughtLesson < 2)
         {
            _loc1_ += 0.5;
         }
         if(!pregnancy.get_isPregnant() || saveContent.shownKids != 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null,null,null));
      }
      
      public function cunny2() : void
      {
         clearOutput();
         outputText("几个小时后你醒了过来，你的一个小女儿坐在你旁边，用她那令人愉悦的冰凉蹼手温柔地抚摸着你汗湿的额头。尽管你意外地晕倒了，但她温柔的微笑帮助你保持了冷静。孩子用深情的语气对你呱呱叫着，亲吻了你的脸颊，然后你慢慢坐了起来。当你试图和你的女儿说话时，她只是歪着头看着你，并给出了一个相当困惑的呱呱声作为回应。");
         outputText("[pg]你其实听不懂她们在说什么，但你发誓你以前听得懂……也许那只是你的错觉？");
         outputText("[pg]你揉了揉隐隐作痛的太阳穴，从泥泞的地上爬起来，亲昵地拍了拍女儿的头，然后回到了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cunny() : void
      {
         clearOutput();
         outputText("你走向坐在岸边的一个可爱的小女儿，轻松地把她翻过身来。当你抓住她的大腿，分开她的双腿，露出她美丽的入口时，女孩发出一声惊讶的呱呱声。她的小缝闪闪发光，你忍不住慢慢舔了舔嘴唇，期待着在你的[tongue]上品尝她的一些花蜜。");
         outputText("[pg]当你把头埋进她的双腿之间，开始舔舐她的爱液时，你发现它的味道极其苦涩。你本想退缩，但你亲爱的女儿却用双腿夹住你的头，把你困在原地继续舔舐。她紧紧地夹着你，让你别无选择，只能坚持吃下去。你热情地攻击她颤抖的阴部，每次舔舐都让她的阴唇颤抖。她微小的喘息和呜咽声很可爱，但她的花蜜却奇怪地开始让你的舌头麻木。");
         outputText("[pg]当你继续舔舐她苦涩的花蜜时，你注意到你的孩子正在改变颜色……她的皮肤正慢慢从浅绿色变成霓虹粉色、蓝色和黄色，然后迅速重复这个循环……为什么树木在扭动？你毫无头绪，但你只是继续勤奋地吞咽着你小女儿淫荡的汁液。你每一次舔舐，她的呻吟声都会变大，她对你的抓握也变得更紧。大量的花蜜从她的蜜壶中滴落，让你的脸沾满了她温柔的女性气息。突然，可爱的女孩呜咽起来，全身颤抖。她对你头部的铁钳般抓握松开了，让你得以抽身并吐出苦涩的液体。觉得已经受够了，你试图站起来，却差点摔倒。你的腿感觉如此摇晃和无力……");
         outputText("[pg]接着你听到有人气喘吁吁地嘟囔着，[say: 你……你没事吧，[Dad]？]你注意到你刚才舔弄的那个小青蛙女孩正担忧地看着你，并说道，[say: 你的脸色看起来不太好！]");
         outputText("[pg]另一个可爱的女孩补充道，[say:是啊！[He]看起来有点……不对劲？也许你应该躺下，[Daddy]？]奇怪的是，你突然能听懂她们的话了，但真正让你感到困惑的是她怎么倒挂在半空中。你试图对她们说些什么，但却发不出声音。感觉嘴里塞满了棉花，舌头根本动弹不得。最终你无法保持直立，下半身突然失去了力量。你仰面躺下，凝视着遮蔽天空的树木，它们所有的树枝似乎都在像蛇一样疯狂地摇晃和扭动。");
         outputText("[pg]你的视线开始模糊，世界开始旋转，你发誓你还能听到你的女儿们在和你说话，但你现在什么也看不见了……");
         doNext(cunny2);
      }
      
      public function continueOnYourWay() : void
      {
         clearOutput();
         outputText("你同情地点了点头，拍了拍蛙女的头，但决定不再多问。她叹了口气，身子往下沉了沉，无奈地接受了自己作为母亲的职责。");
         outputText("[pg]你顺着梯田般的水池离开，向你的营地走去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function carryBeeGirlsEggsVoluntarilyYouButtSlut() : void
      {
         clearOutput();
         get_images().showImage("froggirl-anal");
         outputText("出于对蛙女的同情，你主动提出帮她分担重负。");
         outputText("[pg][say: 天哪，真的吗？]她说着，伴随着水花向前扑来。她伸出双臂搂住你的肩膀。[say: 我保证会让你感觉棒极了。]");
         outputText("[pg]她手臂上的黏液让你感到一阵酥麻，当她为你脱下衣服，剥去你的[armor]时，她在你的手臂、肚子和[chest]上留下了黏糊糊、令人发麻的印记。当你看着她时，她的动作似乎留下了光轨，周围的[sun]光似乎也变得更亮了一些。她自顾自地哼着歌，你发誓你能看到音乐漂浮在空中，每一个不同的音符都是一道不同的霓虹光芒在空中飘荡。你半梦半醒，眼球来回转动，追踪着那些微小的光点。");
         outputText("[pg]她圆滚滚的肚子摩擦着");
         if(get_player().hasCock())
         {
            outputText("[eachCock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[vagina]");
         }
         else
         {
            outputText("你赤裸而敏感的腹股沟");
         }
         outputText("，同时她将指尖举到你的唇边。被她的歌声迷住的你张开嘴，将她的手指含入。上面那层薄薄的黏液尝起来有股柑橘般的甜味，又一阵令人陶醉的快感蒙蔽了你的意识。她歌声的色彩在空中飘荡得更加强烈，当她把你向后推，让你靠在树根墙上，舒服地漂浮在水里时，你迷迷糊糊地笑了起来。");
         outputText("[pg]你的双臂搭在水池边缘，她微笑着抚摸你的脸颊，让又一阵色彩和光芒冲刷过你的大脑。在药物的作用下，你放松下来，任由你的[legs]在水池中慵懒地漂浮，而蛙女则微笑着，调皮地咬着下唇。");
         outputText("[pg][say: 我真的很感激……]她一边说着，一边按摩着自己沉甸甸的孕肚。[say: 如果你喜欢这样，过几天我还会为你准备好下一批。]");
         outputText("[pg]她滑溜溜的双手在你的[chest]上摊开。她冰凉湿滑的嘴唇贴上你的，舌头上涂满了更多致幻的粘液，强行挤进你等待着的嘴里。那长得离谱的器官深深地探入你的体内，顺着你的喉咙滑了下去。你条件反射地吞咽着，咽下了一大口她那黏糊糊的粘液。");
         outputText("[pg]她结束了这个吻，在你们的嘴唇之间拉出一条长长的唾液丝。蛙女得意地笑了，你也咯咯地笑了起来，想问她有什么好笑的。然而，还没等你开口，一阵强烈的、令人战栗的快感就席卷了你。从你的[feet]开始，它如雷鸣般穿过你的身体，感觉就像每一个神经末梢都在高潮。可能过了几秒，也可能过了几个小时，这感觉才传到你那被药物麻痹的大脑，但你已经完全不在乎时间了。");
         outputText("[pg]你向后躺去，在水中颤抖着，张着嘴，眼睛松散地聚焦在上方蛙女的身上。你的视野里充满了色彩，当她再次张开嘴唱歌时，色彩和声音的星云弥漫在空气中。");
         outputText("[pg][say: 哦，你喜欢这样，不是吗？]她问道，此时世界已经溶解成了无法名状的色彩。她的声音在水面上诡异地回荡着。");
         outputText("[pg]你完全迷失在感觉中，在水下，你感觉到滑溜溜的手指在你的[asshole]处摸索，你喘息着。当蛙女在你的双腿之间摆好姿势时，可爱、轻盈的感觉加剧了你的快感。一种冰凉的柔软压在你的屁眼上，某种浓稠的粘液涂抹在你抽搐的洞口。");
         get_player().buttChange(20,true,true,false);
         outputText("[pg]你斗鸡眼般地试图看清蛙女，她抓住你的臀部调整着自己的姿势。她摆出一种类似剪刀式的姿势，小穴紧贴着你的屁眼。伴随着一声咕哝，她双臂环抱着自己苍白的肚子，紧紧抱住自己。你感觉到她柔软的小穴在你身上抽搐，同时有什么黏糊糊的、巨大的东西压在你的花蕾上。");
         outputText("[pg][say: 啊！嗯！]她呻吟着，颤抖着，用力压着自己的孕肚。一团圆滚滚、黏糊糊的东西从她的小穴里渗出，在进入你体内时撑开了你的屁眼。");
         outputText("[pg]当一个苹果大小的青蛙卵挤进你体内时，你醉醺醺地咯咯笑着。如果你不是那么沉迷于令人神魂颠倒的快感中，你可能会对这种压力感到担忧。相反，你只觉得更加头晕目眩——那些卵一定是用蛙女的粘液润滑过的——随着一颗卵进入你的体内，世界开始旋转。");
         outputText("[pg][say: 搞定一个……]蛙女咬紧牙关嘶嘶地说。但你甚至连对她的话挑眉的力气都没有了。压力再次在你的屁眼处聚集，蛙女又把一个巨大的、软绵绵的卵推进了你体内。[say: 嗯！]她咕哝着，因为努力把卵塞进你身体而颤抖着。");
         outputText("[pg]你又咯咯地笑了起来，喜欢随着每一颗卵进入你体内而世界旋转的感觉。她把一颗又一颗卵产进你体内。这对你来说终于太多了，你的意识崩溃了。世界完全溶解成了一个由色彩、感觉和声音组成的漩涡拼贴画。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(1));
         menu();
         addButton(0,"继续",voluntarilyGetEggedEpilogue);
      }
      
      public function autoRape() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            outputText("你醒来时，身体靠在池塘的浅水边。你咳出一些水，迟钝地试图集中精神。当模糊的视线开始清晰时，你注意到你正盯着两只金色的眼睛，并努力寻找站起来的力气，以便击退袭击者。不幸的是，这个女性身影用她长着蹼的手牢牢地按在你的肩膀上，轻松地阻止了你在筋疲力尽的状态下逃跑。她长长的舌头挂在嘴边，悠闲地开始用她黏糊糊的身体在你的身前摩擦。她柔软的乳房压在你身上的感觉让你的下半身开始因渴望而躁动。");
            outputText("[pg]她一定注意到了你的[cock]正急切地戳着她，因为她的脸上露出了兴奋的笑容。她没有太多技巧，试图将你的男子气概对准她黏糊糊的裂口。当她没对准，只是让你的[cockhead]擦过她的入口时，一阵战栗顺着你的脊背爬上。这个两栖女孩的表情变得更加专注，她的第二次尝试显得更有耐心，她小心翼翼地引导你的顶端进入她的体内。当她悠闲地放低腰部，将你的[cock]纳入她热情的身体时，你发出了一声充满欲望的喘息。");
            if(get_player().biggestCockLength() >= 10)
            {
               outputText("[pg]你本能地挺动臀部，当你的[cockhead]毫不退缩地撞击她的子宫颈时，迫使她发出可爱的叫声。她紧紧地抱住你，脸上洋溢着兴高采烈的表情。当青蛙女孩摇晃着她充满女人味的臀部，她的通道在你周围扭动时，你的肉棒跳动着。她的热情将肉欲的欢愉传遍你的全身，你的心脏在耳边怦怦直跳。即使她无法容纳你的全部长度，她塞进她湿滑通道里的部分也被她的肉壁充满爱意地拥抱着，几乎让你的大脑因快感而麻木。湿透的小穴尽其所能地收缩着，渴望榨干你身体能提供的任何东西。");
            }
            else
            {
               outputText("[pg]感觉到你的[cock]在她的内壁上摩擦，她明显高兴地颤抖着。你咬着嘴唇，你的长度被青蛙女孩贪婪的洞穴完全吞没。你发现自己本能地挺动臀部，你的心跳和你的肉棒一样剧烈。当她为你摇晃腰部时，她兴高采烈的喘息声让你因不断高涨的欲望而颤抖。你能感觉到她湿漉漉的通道像手套一样包裹着你，渴望直接从你的[if (hasballs) {[balls]|身体}]中抽出种子。");
            }
            outputText("[pg]你发出一声炽热的叹息，似乎刺激了她的动作，你发誓，听到你发出的声音，她的脸上露出了一丝微笑。她也许对赐予你的快感感到高兴的想法很快从你的脑海中消失，因为她摇晃臀部的速度越来越快。她发出一声响亮的呱呱声，她的女性部位紧紧挤压着你，同时她颤抖着依附着你。青蛙女孩大口喘着气，她的黑发像面纱一样遮住了她金色的眼睛。尽管她颤抖得厉害，她还是不停地扭动着腰部，在试图哄出你的种子时显得几乎绝望。伴随着一声呻吟，你抓住她丰满的臀部，开始自发地将你的肉矛深深地刺入她的深处。她试图跟上你的节奏，渴望你很快用精液淹没她等待的子宫。");
            outputText("[pg]青蛙女孩一定意识到了你的阴茎不断颤抖意味着什么，因为她把你推入她所能承受的最深处。她拥抱着你，你用力挤压她的腰部，足以留下瘀伤。你继续挺动臀部，盲目地将你能给的所有种子倾注到她颤抖的身体里。她不停地扭动着腰部，试图从你敏感的阴茎中再获得哪怕一滴精液，令你惊讶的是，你竟然满足了她，喷出了一股你都不知道自己还有的精液。");
            outputText("[pg]当她从她的通道中拔出你精疲力竭的肉棒时，你注意到她相当满足地摸了摸自己的肚子，然后瞥了你一眼。[if (!isnaked) {她指了指你身后，你顺着看去，发现你的[armor]被扔成一堆乱七八糟的。}]青蛙女孩跳进水里，而你则摇摇晃晃地站了起来。她回头看了你最后一眼，然后潜入水中，消失在你的视线中。");
            outputText("[pg]随着她的离开，你[if (!isnaked) {穿上你的[armor]并}]离开了这个地方。");
            knockUpSuwako();
            get_player().orgasm("Dick");
         }
         else
         {
            outputText("你醒来时，身体安全地靠在池塘边[if (!isnaked) 并且一丝不挂]。你摇了摇头，咳出一些水，然后把自己拖回泥泞的陆地上。尽管差点淹死，你发现自己并没有受到其他伤害。你想这大概是这次可怕经历中唯一的好处了。[if (!isnaked) 环顾四周，你发现你的[armor]乱七八糟地放在附近，虽然它们是湿的，你还是把它们穿了回去。]");
            outputText("[pg]尽管追捕那个青蛙女孩并教训她一顿可能很诱人，但你还是选择回到营地，以便恢复体力。");
            get_player().takeDamage(150);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function assToVag() : void
      {
         clearOutput();
         outputText("当你的[cockhead]触碰到她的私处时，蛙女发出一声如释重负的呱呱声。你注意到她慢慢地将屁股向后挪，试图让你滑入她的入口。虽然你可以任由她为所欲为，但你认为[b:你]才是这里的主导者，于是你将臀部向后拉了一点，刚好阻止了她的努力。然后你在她丰满的屁股上拍了一巴掌，打得两瓣臀肉直颤，她的背也淫荡地弓了起来。这名两栖女孩因为这一击而可怜地呜咽着，你打过的地方在她浅绿色的皮肤上留下了一道鲜红的印记。你嘲弄地将[cock]在滑腻的阴唇上摩擦，只把前端放进去就停了下来。她一动不动，也许是不确定如果她自己有什么动作，你是否会再次打她的屁股。你让她等着，注意到女孩在发抖，还能听到她因为期待被插入而发出的喘息声。她已经很有耐心了，所以你猛地向前挺动臀部，将你的长度送入她娇嫩的肉褶中。");
         if(get_player().biggestCockLength() >= 10)
         {
            outputText("[pg]当你终于侵犯她湿滑的小穴时，蛙女发出一声响亮的呱呱声，将带蹼的手指深深插入泥土中。你的[cock]无法完全进入你的伴侣，你的龟头刺向她的子宫颈，使她全身颤抖。尽管她的深处无法真正容纳你的长度，但你还是忍不住享受她湿润的内壁贪婪地紧贴着它们[b:所能]容纳的一切。你每一次挺进都迫使她向前倾，但你紧紧抓住她的臀部，让你能轻松地将她拉回你身边。");
         }
         else
         {
            outputText("[pg]当你的阴茎在她的内壁上摩擦时，蛙女高兴地喘息着。你的臀部重重地撞击着女孩多汁的臀部，使其诱人地颤动，她的小穴已经完全吞没了你的[cock]。每次你滑出她只剩[cockhead]时，都会发出一声愉悦的咕哝，然后又将她拉回你的整个长度上。随着你将自己完全插入她的深处，她的汁液淫荡地挤压着你，她的呱呱声也越来越大。");
         }
         outputText("[pg]她的内壁突然紧紧夹住你的[cock]，让她的身体颤抖起来。你继续在里面抽插，摩擦着她滑腻的肉褶[if (biggestcocklength >= 10) { 并无情地戳刺着她海绵状的子宫颈}]。当你开始抚摸她美丽的屁股时，蛙女呜咽起来。她的皮肤冰凉且有点黏糊糊的，但你的手指按压在甜美的臀部上，简直是令人愉悦的视觉享受。当你感觉到你的阴茎因为即将射精而跳动时，阵阵快感不断冲击着你的大脑。蛙女将臀部向后推以迎合你的抽插，并在极乐中大声呱呱叫。");
         outputText("[pg]伴随着一声呻吟，你感觉到精液冲破你的[cock]，彻底淹没了蛙女。她的内壁贪婪地榨取着你的每一滴精华，并迫使你射出的每一发都到达她饥渴的子宫。[if (cumhighleast){你注入她体内的所有精液让她的肚子看起来已经肿胀起来。}]你小心翼翼地将你疲软的阴茎从蛙女体内抽出，她转过头，带着一种沉醉在快感中的表情看着你。她微微摇晃了一下屁股，似乎希望你能再来一发。虽然这是一个诱人的提议，但你真的太累了，无法满足她。她一定明白你现在已经精疲力尽了，所以她把手放在她的缝隙上，防止你的种子溢出，然后跳回水中。");
         outputText("[pg][if (cumhighleast) {你确实注意到她在潜回水下时犹豫了一下，在潜下去之前最后看了你一眼。}]她走后，你[if (!isnaked) {穿上你的[armor]，然后}]离开了这个地方。");
         get_player().orgasm("Dick");
         knockUpSuwako();
         saveContent.lastEncounter = 2;
         get_combat().cleanupAfterCombat();
      }
      
      public function approach() : void
      {
         clearOutput();
         saveContent.metSuwako = true;
         outputText("你走近那片美丽的池水，打算洗去这次探险中积攒的汗水。");
         if(get_player().get_spe() >= 60)
         {
            outputText("[pg]当你这么做时，伴随着巨大的水花声，一条长长的附肢突然从水中弹起，直奔你而来！你向后跳去，成功躲开了它抓取你的企图。当你举起你的[if (hasweapon){[weapon]|拳头}]时，你摆出了防御姿态，以防潜伏在水面下的东西再次试图抓住你。你最不想发生的事情就是被某个腐化的沼泽怪物抓住。");
            outputText("[pg]令你惊讶的是，那条黏糊糊的触手没有再从水里出来。取而代之的是更大的水花声，一个奇怪的生物伴随着轻柔的[i:扑通]声跳到了泥泞的岸边。你发现刚才试图抓住你的附肢其实是这个怪物长长的舌头。这个器官在它的嘴唇上舔过，然后慢慢消失在它异常宽大的嘴里。");
            outputText("[pg]看这生物恶狠狠地盯着你的样子，你猜它是不打算让你不战而退了！");
            startCombat(new FrogGirl());
         }
         else
         {
            outputText("[pg]当你这么做时，一条长长的附肢突然从水中弹起，像铁钳一样紧紧缠住你的手臂。这条黏糊糊的触手猛地把你拉向池塘，试图把你拖进去！你拼尽全力挣扎，试图把这滑溜溜的东西从身上弄下来，但无济于事。");
            if(get_player().get_str() >= 60)
            {
               outputText("[pg]然而，你凝聚起全身的力量，抓住那根滑溜溜的触手，猛地向后拉扯。你差点被拖入水中，但你的力量不容小觑，让你成功反制了抓住你的怪物！很快，抓住你的生物从美丽的池塘里飞了出来，伴随着一声轻柔的[i:砰]声，落在了泥泞的岸边。它看起来对被拉上岸感到相当惊讶，松开了你现在才看清是它长长舌头的东西，然后这个黏糊糊的器官从你手中滑落，缩回了生物的嘴里。");
               outputText("[pg]她恶狠狠地瞪着你，显然是想和你打一架！");
               startCombat(new FrogGirl());
            }
            else
            {
               outputText("[pg]当你被拖入水中时，一阵冰冷的恐惧攫住了你的心。很快，你被拉入了一个看似无底的深渊。你拼命挣扎，试图摆脱抓住你的东西，渴望重获自由。然而，这一切都是徒劳的，你的身体被越拖越近，离那个抓住你的东西越来越近。");
               outputText("[pg]看到黑发在水中自由飘荡，一双闪烁着金光的眼睛死死盯着你，让你不寒而栗。随着那个生物进入视线，你看到缠绕在你手臂上的附肢是她长长的舌头。她看起来确实很有女人味，有着微妙的曲线和圆润的乳房，如果不是你现在处境危险，这绝对会很诱人。她的皮肤是浅绿色的，不过她看起来柔软的下腹部明显是白色的。她有两只长着蹼的手和相配的脚。你发现她的嘴巴异常宽大，从里面伸出的长舌头让你想起了青蛙。她令人毛骨悚然地咧嘴笑着，也许是因为你还在试图挣脱她的束缚而感到有趣。" + (get_player().hasGills() ? "" : " 对空气的渴望让你再也无法忍受。当你拼命大口呼吸氧气时，一股水流涌入你的肺部。你的视线很快变得越来越暗，直到你什么也感觉不到了……"));
               if(get_player().hasGills())
               {
                  doNext(gillEscape);
               }
               else
               {
                  doNext(autoRape);
               }
            }
         }
      }
      
      public function analBirth() : void
      {
         get_images().showImage("birth-froggirl-anal");
         outputGui.text("[pg]<b>哦，不……</b>[pg]你呻吟着，感觉到内心深处传来一阵颤栗，肠胃里一阵翻江倒海。一丝黏液从你的[asshole]流下，顺着你的[legs]滑落，你感觉到体内深处传来一阵压力。");
         outputGui.text("\n\n水——你需要靠近水！这种本能突然而清晰，你踉踉跄跄地走向营地附近的小溪。你低低地蹲在河岸上，双手撑地，膝盖向上弯曲，摆出一个奇怪的像青蛙一样的姿势。");
         outputGui.text("\n\n黏液在你身下汇聚，随着第一枚卵开始从你体内挤出，流进了水里。感觉……很奇怪。这种压力虽然不像你在玛瑞斯遇到的某些东西那么强烈，但依然大得惊人。你的后穴被撑得大大的，虽然被黏液麻痹了一点，但扩张的程度依然远超你的想象。当这枚卵吧唧一声落到地上时，你意识到这些卵像果冻一样，柔软得足以让你在产卵时有一些缓冲的余地。");
         outputGui.text("\n\n第一枚卵滚落到水中，被汇聚的黏液固定住，但你连多看一眼的功夫都没有。下一枚卵紧接着挤压着你，你呻吟着，颤抖着喘息，试图把它挤出来。你身体的每一次抽动都让后穴隐隐作痛，但最终，第二枚西瓜大小的卵摇摇晃晃地从你的屁股里滑了出来。当你感觉到下一枚卵即将到来时，你已经筋疲力尽了，但你还是设法把这枚也挤了出来，然后脸朝下瘫倒在地上。");
         get_player().buttChange(80,true,true,false);
         outputGui.text("\n\n然而，大自然的力量推着你继续，你的身体努力地将下一枚卵排出。你呻吟着，意识只剩下一半，皮肤上的青蛙黏液再次让你进入一种迷离的状态，一枚接一枚的卵从你体内挤出。");
         outputGui.text("\n\n<b>后来，你被一阵水花飞溅的声音吵醒……</b>\n河里有十几个小小的身影，每个都不超过一英尺长，腰部以上都和那个蛙女一模一样，但腰部以下却奇怪地没有任何特征。她们的下半身末端是隐约带有鳍的尾巴，就像蝌蚪一样。");
         outputGui.text("\n\n这些蝌蚪女孩在水里互相泼水嬉戏，但在你醒来时注意到了你。看来她们一直在等你——表现出了她们生母所缺乏的关切。也许这是遗传自你？她们挥挥手，顺流游走，你注意到其中几个的头发和皮肤上有一些不寻常的色彩斑点，看起来比她们的母亲更像你。");
         outputGui.text("\n\n你暗自点头，很高兴终于结束了那场折磨。当你站起来时，你注意到臀部有些沉重，屁眼也变得更加湿滑。\n");
         var _temp_1:* = get_player().hips;
         _temp_1.rating = _temp_1.rating + 1;
         var _temp_2:* = get_player().ass;
         _temp_2.analWetness = _temp_2.analWetness + 1;
         if(get_player().ass.analWetness > 5)
         {
            get_player().ass.analWetness = 5;
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(1));
      }
      
      public function absolutelyFuriousAnal() : void
      {
         clearOutput();
         outputText("你[if (!isnaked) {随手脱下衣服，将你的[armor]丢到一旁，然后}]走向那三个蛙女，注意到她们正饥渴地盯着你的身体。你把那个绿色的蛙女拉到近前，用力捏了一把她肥美的臀部。当你把一根手指捅进她紧缩的屁眼时，她害怕地颤抖着，发出一声惊恐的呱呱声。接着你把她的脸按进泥里，让她四肢着地趴好，同时向另外两个女孩投去不容抗拒的目光。她们显然明白了你的意思，伴随着悲伤的呱呱声，顺从地向你展示着她们的身体。三个圆润的屁股并排摆在面前，这幅景象绝对能让家乡的任何热血男儿为之疯狂。问题是，该从谁开始呢……？");
         outputText("[pg]为什么不从绿色的蛙娘开始，重温旧梦呢？你抓住她丰满的臀部，当你的[cockhead]顶住她的后庭时，她惊恐地叫出声来。女孩挣扎着，拼命想从你和你那粗壮的肉棒下逃脱。她早该知道这种尝试是徒劳的，你毫不留情地向前挺动[hips]。她的后庭紧缩，试图阻止你的入侵，但无济于事，她的哀嚎声大得足以震碎玻璃。每次你撞击她时，你的[cock][if (biggestcocklength >= 10) {无法完全塞进女孩的屁眼，严重扭曲了她白皙的肚子|完全被女孩的后庭吞没，你的臀部大声拍打着她多汁的臀部}]。很快，绿色的女孩停止了毫无意义的挣扎，她可怜的呜咽声几乎被你响亮的喘息声掩盖。虽然你已经可以在她完美的屁股里释放你的精液，但你还有另外两个洞想尝尝。将你跳动的肉棒拔出，让女孩虚弱地颤抖了一下，你粗鲁地把她推倒在泥地里。把注意力转向另外两个女孩，你看到她们都在为你刚才展现的残忍而颤抖。");
         outputText("[pg]粉色蛙女拼命在泥地里爬行，想从你身边逃开；相比你可能对她做的其他事，她更害怕自己的屁股被弄坏。可她还不够快，你很快就抓住了她柔美的腰。她的皮肤相当滑腻，但你还是轻而易举地把肉棒深深顶进她体内，逼得她痛苦地尖叫起来。一阵小小的兴奋掠过全身，她的后穴把你夹得如此紧，简直让你以为那还是处女之身。大量先列腺液和她黏滑的内壁帮着你抽插，身下的蛙女只能哭叫着，愤愤地无力蹬着双脚。你像野兽一样从背后干着她，[if (biggestcocklength >= 10) {你的[cock]长度对她来说实在太过分，根本没法完全吞下|你的[cock]一路塞进她紧紧收缩的后穴深处}]。她突然弓起背，穴口收得那么紧，你不得不咬紧牙关，才忍住没跟着她一起射出来。她粗重的喘息灌满你的耳朵，而她的挣扎终于停了下来。想把你依旧坚硬的肉棒拔出来几乎不可能，但你还是不知怎么做到了，这让她发出一声痛苦的呜咽。");
         outputText("[pg]你的阴茎此刻胀得仿佛快要爆开，但你终于把注意力转向了那个耐心等待着的红色蛙女。她为你抬起臀部，轻轻扭了扭，确实诱人。女孩回头瞥向你，盯着你看，似乎想知道你会不会接受她的邀请。你刚一来到她身后，她就用屁股蹭上你的[cock]，一小股精液溅到她那漂亮而泛着光泽的皮肤上，让你不由得浑身一颤。你稳住心神，抓住她诱人的臀部，一挺身便将肉棒深深顶进她的肛口。她弓起背，发出一声哀鸣，那突如其来的闯入让痛楚与快感混杂在一起。每当你抽送时，她体内的肉壁都像是想把你重新拉回去，催促着你把她紧紧搂在怀里。她在你臂弯中颤抖，急切地把那颤巍巍的屁股向后顶来，迎合你热烈的抽插。很显然，她深爱着你的[if (biggestcocklength >= 10) {巨大阳具把她的小腹顶得变形——瞧她那副爱怜地抚摸着你顶出的淫猥凸起的模样|腰胯响亮地拍打在她屁股上——瞧她那副淫荡地呜咽和呱呱叫的模样}]。");
         outputText("[pg]你拼命压抑至今的精液，此刻正狂暴地想从[if (hasballs) {你的[balls]|你体内}]释放出来。你发出野兽般的低吼，将自己尽可能深地撞进红色蛙女体内。你的精液终于沿着抽动的肉棒喷涌而上，把她颤抖的屁眼内侧涂成一片纯白。她只是在你的掌握中发颤，一边喘着气，一边愉悦地扭动腰肢。她的直肠内壁仿佛要榨出你的每一滴，贪婪地吞咽着你灌进她体内的所有精液。你深吸一口气，慢慢将已经射空的肉棒从她仍在抽搐的屁眼里拔出来。她鼓着脸，可爱地对你呱呱叫了几声，又无力地摇晃着屁股，怎么看都是在催促你再来一次。");
         outputText("[pg]粉色和绿色的青蛙女孩似乎明白你已经玩够了她们，虚弱地爬回水中，随后消失在水面之下。不过那个红色女孩似乎有些犹豫，但很快也跟着潜了下去。");
         get_player().orgasm("Dick");
         _temp_1.analMad += 1;
         get_combat().cleanupAfterCombat();
      }
   }
}

