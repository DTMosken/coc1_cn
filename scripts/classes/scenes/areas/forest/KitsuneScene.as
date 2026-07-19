package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.items.weapons.HugeWarhammer;
   import classes.lists.ColorLists;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.forest._KitsuneScene.SaveContent;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.Imp;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class KitsuneScene extends BaseContent implements SelfDebug, SelfSaving, Encounter
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function KitsuneScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "kitsune";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function winKitsuneImpFight() : void
      {
         var firstTime2:Boolean;
         var willing:Boolean;
         var _g2:KitsuneScene;
         var firstTime1:Boolean;
         var _g1:KitsuneScene;
         var firstTime:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         if(Utils.rand(3) == 0)
         {
            get_monster().hair.color = "blonde";
         }
         else if(Utils.rand(2) == 0)
         {
            get_monster().hair.color = "black";
         }
         else
         {
            get_monster().hair.color = "red";
         }
         kitsuneSprite();
         outputText("[say: 哦，谢谢你，谢谢你！如果不是你及时赶到，我真不知道</i>会<i>发生什么。][pg]" + (get_player().cor < 50 ? "当小恶魔倒在你脚下时，你放下你的[weapon]，转向那个感激的女孩。打倒一只小恶魔真的没什么大不了的，但你很高兴能帮上忙，并带着友好的微笑告诉了她。" : "你傲慢地嘲笑了一声，放下你的[weapon]，转向那个女孩。你告诉她，打倒一只小恶魔根本不值得你浪费时间，然后烦躁地交叉起双臂。") + "[pg]");
         outputText("[say: 我的英雄！] 她神魂颠倒地说着，笑容满面。[say: 哦，如果我能做</i>任何<i>事情来报答你，请告诉我！][pg]");
         outputText("你发现自己正深深地凝视着她的眼睛，一层淡淡的薄雾进入你的脑海，你被越来越深地吸入那闪闪发光的绿色池塘中。当她开始向你走来时，她的嘴角卷起一个灿烂的笑容，有一瞬间你发誓你看到了她身上微妙的变化。你揉了揉眼睛，确信它们在捉弄你，慢慢地跟随着她那六条尾巴的轻轻摇摆，看着她走到你面前。" + (get_player().get_lust100() > 70 || get_player().get_inte() < 40 ? " 不，这里没什么不对劲的……[pg][say: 嗯……我的英雄……] 她再次轻声说道，伸手抚摸你的脸颊。" : "[pg]等等。") + "[pg]");
         if(get_player().get_lust100() < 70 || get_player().get_inte() >= 40)
         {
            outputText("你推开她，在绊倒在一个树桩上时差点把头磕破。既然你已经挣脱了她的巫术，你就能看清她的真面目了。一对巨大的三角形狐狸耳朵从她");
            if(get_monster().hair.color == "blonde")
            {
               outputText("及背的亚麻色");
            }
            else if(get_monster().hair.color == "black")
            {
               outputText("及臀的乌黑");
            }
            else
            {
               outputText("齐肩的深红");
            }
            outputText("头发中探出，六条毛茸茸的尾巴在她身后呈扇形散开。[pg]");
            outputText("[say: 这么说，你看穿了我的伪装是吗？真让人印象深刻……]她说着，用尾巴挑逗着你。你向后退去，但当你感觉到自己撞到了什么东西时，你吓了一跳，猛地转过身来。");
            _g = this;
            firstTime = true;
            doNext(function():void
            {
               _g.followTheWillOWisp(firstTime);
            });
         }
         else if(get_player().isReligious() || get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            outputText("她碰到你的那一瞬间，伴随着一声尖叫猛地缩了回去，一道耀眼的闪光让你们俩都暂时失明了。[pg]");
            outputText("[say: 哎哟，哎哟，哎哟！][pg]");
            outputText("当你眼前的光斑散去时，狐妖的伪装已经被驱散，露出了她的真面目。一对大大的三角形狐狸耳朵从她的");
            if(get_monster().hair.color == "blonde")
            {
               outputText("及背的亚麻色");
            }
            else if(get_monster().hair.color == "black")
            {
               outputText("及臀的乌黑");
            }
            else
            {
               outputText("齐肩的深红");
            }
            outputText("头发中探出，六条毛茸茸的尾巴在她身后呈扇形散开。一层华丽的纹身覆盖着她裸露的肌肤，恰到好处地突出了她女性的曲线。[pg]");
            outputText("[say: 这么说，你看穿了我的伪装是吗？真让人印象深刻……]她说着，用尾巴挑逗着你。你向后退去，但当你感觉到自己撞到了什么东西时，你吓了一跳，猛地转过身来。");
            _g1 = this;
            firstTime1 = true;
            doNext(function():void
            {
               _g1.followTheWillOWisp(firstTime1);
            });
         }
         else
         {
            outputText("她的触摸让你的脊背不由自主地发麻，你被她的眼睛深深吸引。她的手指划过你的下巴，从你身边溜走，并示意你跟上她。你的[legs]不受控制地移动着，拖着你跟在她身后，她带领你沿着一条蜿蜒的小路走向黑暗。");
            menu();
            _g2 = this;
            willing = true;
            firstTime2 = true;
            addButton(0,"继续",function():void
            {
               _g2.mansion(willing,firstTime2);
            });
         }
      }
      
      public function willOWisp() : void
      {
         var _g1:KitsuneScene;
         var _g:KitsuneScene;
         clearOutput();
         if(Utils.rand(3) == 0)
         {
            get_monster().hair.color = "blonde";
         }
         else if(Utils.rand(2) == 0)
         {
            get_monster().hair.color = "black";
         }
         else
         {
            get_monster().hair.color = "red";
         }
         kitsuneSprite();
         outputText("当你深入茂密的树林探索时，你突然意识到周围的环境在毫无预兆的情况下变暗了。你的后颈微微发麻，有一种不祥的预感，你本能地准备好你的[weapon]，感到有些不安。你被偏执狂所折磨，发现自己会转向每一个随机的噪音，你<i>发誓</i>你刚才听到了树林里传来的声音。又来了！当那幽灵般的女性笑声充满你的耳朵时，你确信这绝对不是你的想象。你向左转，然后向右转，试图确定声音的来源，但现在听起来它似乎就在你周围。[pg]");
         outputText("眼角余光瞥见一丝动静，你猛地转过身去，却惊讶地发现那里只有一个小小的淡蓝色火焰，在漫无目的地飞舞。它催眠般地跳动着，当你凝视着它幽灵般的光芒时，你发现你的意识变得模糊起来。你的担忧突然变得微不足道，你发现自己逐渐放松下来，因为这空灵的鬼火沿着你的手臂滑行，在它接触你的地方留下凉爽的刺痛感。[pg]");
         outputText("它似乎在召唤你跟着它。");
         if(get_player().hasKeyItem("Traveler\'s Guide"))
         {
            outputText("[pg]当你记起《旅行者指南》上的一条注释时，你的大脑从迷雾中清醒过来。它警告说，森林里神秘的火焰会把倒霉的冒险者引入歧途。你现在犹豫了，不知道该怎么办。");
            menu();
            addButton(0,"返回",turnBackFromWillOWisp);
            _g = this;
            addButton(1,"跟随",function():void
            {
               _g.followTheWillOWisp();
            });
         }
         else
         {
            _g1 = this;
            doNext(function():void
            {
               _g1.followTheWillOWisp();
            });
         }
      }
      
      public function turnBackFromWillOWisp() : void
      {
         clearOutput();
         outputText("你绝不可能为了追逐一团火焰而在树林里乱跑。你摇了摇头，理清思绪，警惕地转身朝营地走去。有那么一瞬间，你几乎敢发誓那团火焰看起来很失望，你为这种愚蠢的想法轻笑了一声。");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tribbingWithAKitsune() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你有些怀疑地盯着她看了一会儿，小心翼翼地靠近她俯卧的身体。然而，她那众所周知的花招似乎已经用尽了，她允许你靠近而没有进一步的骚扰，只是在草地上慢慢向后爬。她谨慎的撤退无法超过你靠近的速度，没过多久，你就把臀部稳稳地压在她的臀部上，把她按在地上" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "，她的肉棒紧贴着她的肚子" : "") + "。[pg]");
         outputText("她尴尬地笑了笑，当你靠近时，她狡黠地笑着，深邃的翠绿色眼睛离你只有几英寸远。你把嘴唇贴在她的嘴唇上，一只手穿过她的头发，用指尖抚摸她敏感的耳背，同时用空出的手脱下她的衣服。一声呻吟从她的胸腔传到你的嘴唇，当她开始向后靠，屈服于你的激情时，她的脸颊烧得通红，显得有些慌乱。[pg]");
         outputText("她下体的热量辐射到你的下体，将你的激情提升到新的高度，你将狐妖的肩膀按在地上，在她的耻骨丘上前后滑动你的臀部。当你的骨盆在她的骨盆上前后摩擦时，你的[clit]偶尔会滑入她小穴的裂缝中，拂过她肿胀的阴蒂，让一阵嗡嗡的快感传遍你的脊椎。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? (int(get_player().cocks.length) > 0 ? " 你们的肉棒一起抽动着，弹跳着" : " 她的肉棒抽动着，弹跳着") + "，每次你的臀部向前骑乘时，都会撞击她的肚子，一根前列腺液的丝线从龟头连接到她的肚脐。" : "") + "[pg]");
         outputText("每次你的[clit]拂过她的阴蒂时，你都会因快感而颤抖，但你很快意识到你所采取的姿势……还不够。你现在的角度根本无法获得你所寻求的那种令人神经崩溃的快感——这必须得到纠正。[pg]");
         outputText("你迅速翻转身体，双手顺着她诱人的大腿向上滑，抓住她的小腿。当你把她的后半身向上翻，让她向后弯折成一个淫荡的姿势时，她惊愕地叫了一声，她的私处滴落着甜美的花蜜，落在了她的脸上。[pg]");
         outputText("[say: 哈哈，你以为你在做什么，你这个愚蠢的凡人……] 她轻笑着说道，你跨坐在她身上，将你的[butt]压在她张开的大腿上，你的[vagina]与她的紧密贴合。" + (int(get_player().cocks.length) > 0 ? get_player().sMultiCockDesc() + "垂" + (int(get_player().cocks.length) > 1 ? "" : "") + "在她丰满圆润的臀瓣上，渗出的前列腺液滴落在她奢华的尾巴上" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "，而她自己的肉棒则悬在离她鼻子几英寸的地方。" : "。") : "") + " 当你恢复缓慢而有节奏的摩擦时，你满意地呻吟着，发现这个新姿势令人满足得多。[pg]");
         outputText("每次你向前挺动臀部，她肿胀的阴蒂就会在你的阴唇间向上滑动，每次你向下压，它都会与你的阴蒂奇妙地摩擦。" + (get_player().getClitLength() > 4 ? " 你喘息着，毫无预兆地，你的[clit]轻松地滑入她温暖湿润的通道，被一种奇怪的吸力拉进她小穴湿滑的褶皱中。她温暖的阴道壁紧紧包裹着你，贴合着你巨大女性特征的轮廓，紧紧挤压。" : "") + " 你的手向下游走到她宽大的臀部，手指深深陷入柔软有弹性的肉中，将她的臀部拉得与你的紧贴。它像果冻一样摇晃颤动，每次你向前挺动臀部时，涟漪就会穿过它，令人愉悦地扭曲了上面刻画的图案。继续缓慢而有条理地用你的腹股沟摩擦她的，你像揉一团软面团一样揉捏她的大屁股，充满欲望地挤压和抚摸它，同时满意地呻吟着。[pg]");
         outputText("[say: 嗯，哦，就是那里，] 她娇喘着，用腿将她柔软的身体向上推，腿伸到肩膀附近的地面上，双臂张开支撑着。[pg]");
         outputText("她配合着你的摩擦挺动，她的六条尾巴像一群毛茸茸的蛇一样向你的身体弯曲。它们挑逗地缠绕着你，以缓慢而感性的卷曲在你的身体上挠痒痒，然后开始向南漂移，" + (int(get_player().cocks.length) > 0 ? " 温柔地包裹着[eachCock]并" : "") + " 滑向你的后方。当她的尾巴缠绕着你时，丝滑的皮毛在你的臀部竖起，其中一个毛茸茸的线圈向下移动到你的下体，挑逗着你阴唇的边缘。她尾巴的尖端轻轻拂过你[clit]的上表面，让你感到一阵快感，但它并没有停在那里——伴随着燧石敲击钢铁的声音，她在尾巴末端变出了一团蓝色的火焰，在你抗议之前，将它紧紧地压在你女性特征的根部。[pg]");
         outputText("耀眼的神秘蔚蓝火舌舔舐着你的[clit]，随着一阵冰凉的刺痛感开始在你的神经中蔓延，所有的感觉都被强化，你的快感也被放大了十倍。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 你充血的阴部因为这额外的快感而肿胀起来，你能感觉到狐妖的小穴变得越来越紧……还是说你的阴蒂变得更大了？不管原因是什么，感觉都棒极了，你只能开始以一种新的热情挺动你的臀部，捏着她的屁股，狂热地将自己像活塞一样抽插进她诱人的洞穴中。" : "") + "[pg]");
         outputText("她和你一起发出了淫荡的合唱，向上挺动身体贴着你，兴奋地抓着自己的乳房，用指尖弹拨着她肿胀的乳头。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 现在，一股持续不断的先列腺液从她的肉棒上滴落下来，在她的脸和乳房上投下了一层薄薄的、闪闪发光的光泽。" : "") + " 你用力地前后挺动着臀部，逐渐积聚动力，追求着你越来越近的高潮。森林里充满了淫荡的磨豆腐发出的稳定的“噗嗤-噗嗤-噗嗤”声，女性体液的丝线和水珠将你的[vagina]和她的连接在一起，并在彼此的腹股沟上弄得一团糟。[pg]");
         outputText("就像一个盘绕的弹簧，一种紧张感慢慢地在你们交织的下半身达到顶点，随着一股热流穿过你的子宫，这种紧张感稳步攀升。你向前倾斜，当你感觉到一根纤细的手指滑向你的[asshole]，轻轻地在里面蠕动时，一声呻吟卡在了你的喉咙里。这个入侵者的加入让你接近了忍耐的极限，你颤抖着克制自己，将手指深深地陷入她那柔软、丰满的、令人惊叹的臀部中。决定回报她的善意，你用指尖在紧绷的菊穴周围画圈，将其插入到指关节处。她的肛门环毫无怨言地在你的手指周围张开，她直肠的温暖诱人地将入侵的手指吸入体内" + (get_player().getClitLength() > 4 ? "，作为回应，她的阴道立刻紧紧地包裹住你的[clit]，将其困在一个类似真空的吸力中" : "") + "。[pg]");
         outputText("当你把体重压在她向上挺起的骨盆上，双手顺着她的臀部滑到她的后腰时，你身体的每一块肌肉都与激情产生共鸣。你本能地抓住她尾巴的根部作为支撑，努力保持平衡，因为你的[vagina]开始抽搐，一股女性润滑液的瀑布从你的下体溢出，流入她的下体。整条淫荡的河流顺着她的身前流下，将她彻底浸透，闪烁着光泽，而她的尾巴在你的抓握中疯狂地拍打着，狐妖的高潮近在咫尺。[pg]");
         outputText("盘绕的弹簧断裂了，当你的高潮开始撕裂你时，你的背部反射性地拱起。狐妖同时达到了她的顶峰，她扭曲的身体在你身下尴尬地弯曲着，因为她努力在扭曲的姿势中保持平衡，在快感的阵痛中挣扎。" + (get_player().getClitLength() > 4 ? " 她的阴道在你过度生长的阴部上起伏，血液从热量和吸力中泵入已经充血的器官。" : "") + (get_player().wetness() == 5 ? " 你紧紧地抱住她，向前挺动你的臀部，一股光滑的女性精液从你的阴部喷射而出，麝香般的女性体液顺着她背部的曲线滑落。" : "") + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 随着快感抽搐和肿胀，" + (get_player().cor > 15 ? "她深深地呻吟着，期待着她即将到来的高潮。就在她即将释放的时候，你收紧了对她根部的抓握，调皮地笑着。看看<i>她</i>喜不喜欢被戏弄！[pg]她的肉棒在你的手下异常肿胀，徒劳地跳动和抽搐着，因为她拼命地试图克服阻塞。她的脸扭曲成痛苦的表情，带着一丝受虐的幸福感。她在你的抓握中扭动和挣扎，翻着白眼，舌头伸了出来。[pg][say: 不-不公平！让-让我射！操，求你了！][pg]你向后靠，将她抽搐的肉棒从你自己身上移开，松开你的抓握，然后" : "") + "她肿胀的肉棒开始将一波又一波浓稠的精液倾倒在她的脸上，喷射成带状和块状。她左右摇头，无法避开自己充满活力的排放物，珍珠白色的精液从她的脸颊上滑落，她一边喷溅，一边自嘲地笑着。" : "") + "[pg]");
         outputText("随着高潮的余韵渐渐消退，你瘫软下来，心满意足地从她身上滑落，在草地上喘着粗气。你和她头脚相向地躺着，" + (get_player().isBiped() ? "[legs]张开，" : "") + "深呼吸着试图平复呼吸。你闭上眼睛片刻，发出一声满足的叹息，当你再次睁开眼睛时，狐妖已经不见了。她的火焰在你[clit]上留下的酥麻感依然存在，树叶间还飘荡着微弱的欢快笑声。");
         get_player().changeClitLength(0.1 + Utils.rand(3) / 10);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function tentacleKitsuneWingWangs() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("[say: 哎呀！看来今晚我们有大餐了，姐妹们……] 金发女郎一边说着，一边用手抚摸着你那令人印象深刻的灵活触手。[pg]");
         outputText("[say: 嗯……触手……我最喜欢的口味，] 黑发女郎附和道，揉着她那胖乎乎的肚子，饥渴地舔着嘴唇。她们滑入你身旁的水中，每个人都用手抓住你的一根粗壮触手，急切地咧嘴笑着。她们齐心协力，将尾巴穿过你那扭动的触手群，紧紧缠绕在每根触手的根部，手指则沿着柔软的触手滑动。蓝色的火焰在每根扭动的触手上跳跃，让你陷入一阵颤抖、战栗的狂热之中，三姐妹心照不宣地相视一笑。你那被酒精麻痹的大脑现在已经太模糊了，无法抵抗她们的挑逗，" + (get_player().lib < 50 ? "含糊不清的抗议声被当成了耳旁风。" : "不过谁又想抵抗呢？") + "[pg]");
         outputText("[say: 哦，我真是太喜欢我们的工作了，] 金发女郎评论道，她的手滑到你肉棒的顶端，试探性地捏了捏那球状的龟头。看到你坚实的肉体在她的触摸下屈服，她露出了满意的笑容，轻轻地点了点头。她的一条尾巴尖沿着底部滑动，性感地挑逗着你，更多的毛茸茸的尾巴在这个淫秽的器官上抚摸和揉捏着。[pg]");
         outputText("[say: 我们就是太太太太喜欢触手了，] 黑发女孩向你解释道，像个女学生一样咯咯笑着，因为你的一根淫秽触手开始自己动了起来，滑到她的双腿之间，穿过她宽阔的臀瓣。[say: 当我们看到这么粗、这么长、而且……] 她停顿了一下，用嘴唇包裹住你肉棒的顶端，舌头沿着龟头滑动，[say: ……嗯……多汁的触手……我们简直无法抑制自己的兴奋。][pg]");
         outputText("仿佛是为了证明这一点，她饥渴地吞下了你将近一英尺长的扭动触手，一缕口水从她嘴角慵懒地垂下，她小心翼翼地吞咽着你的长度。你扭动的触手受到了来自四面八方的各种触摸和爱抚；手指、舌头、尾巴和乳房都在完美地配合着，挑逗并取悦着你。一根触手本能地缠绕在金发女郎的一个乳房上，紧紧地挤压着，而触手尖则戳刺着柔软的肉体，挑逗着她挺立的粉色乳头。她呻吟着回应，手指沿着根部滑动，冰冷的蓝色火焰在她的指尖噼啪作响，让你的身体感到一阵战栗。你那粗壮的触手不可思议地肿胀起来，狐妖的魔法在表面传递着阵阵快感。当苍白的火焰在你的腹股沟上跳跃时，你感觉到一种奇怪的紧张感在积聚，在一阵粘稠的精液喷发中，你的下体爆发成一团巨大的、扭动的、至少有十几根起伏的触手！[pg]");
         outputText("[say: 呵呵，我们就喜欢这样！]金发女郎轻笑着说，将身体贴在蠕动的触手堆上，满怀期待地呻吟着。[pg]");
         outputText("你感觉到有什么温暖的东西在戳你的侧腰，低头一看，发现红发女郎的双腿之间有着她姐妹们所没有的东西。你的一根起伏不定的肉棒卷曲在她的双腿之间，她开始在你身上摩擦，将她粗壮跳动的阴茎对准你的一根，淫荡地前后扭动着臀部。她抓住你粗壮肉棒的一段，将其缠绕在自己阴茎的根部，穿过肉棒形成的圆环抽插着，在你耳边呻吟。[pg]");
         outputText("她灼热的呼吸倾泻在你的肩膀上，紧接着是一股独特的薄荷清凉。两种感觉的强烈对比让你不寒而栗，随着快感的累积，你的胸膛快速起伏。金发女郎被她黑发的姐妹扑倒在你的胸前，这突如其来的冲击让你喘不过气来。活泼的黑发女郎一手抓着触手，一手抓着金发女郎丰满的乳房，在两者之间交替，吸吮、挤压、抚摸，同时前后扭动着她丰满的臀部。你的双手开始不由自主地在她们丝滑的肌肤上滑动，抚摸着柔软的肉体和闪烁的尾巴，揉捏着她们坚挺的乳房，手指穿过她们柔软的头发。[pg]");
         outputText("你的几根肉棒被一群长长的黑色尾巴缠住，引导它们向下进入她翘起的阴道，慢慢地让其中一根的头部在她闪闪发光的小穴上上下滑动。她爬过她的金发姐妹，俯身和红发女郎一起轻咬你的耳朵，并从牙缝里嘟囔着：[say: 嗯……该上主菜了……继续，你知道你想插进去……蹂躏我们吧。][pg]");
         outputText("没有犹豫，你的触手肉棒在你思考之前就急切地钻进了她湿透的小穴。你的呻吟声和她的呻吟声汇成了一首淫荡的交响乐，你每一根扭动的触手都在一个或另一个洞里找到了归宿，让这三个女孩在你身上陷入了充满情欲的狂乱。没过多久，你就分不清哪个女孩在哪里了，你的双手在她们柔软顺滑的身体上游走，交织在肉体、尾巴、触手和情欲的肉欲漩涡中。[pg]");
         outputText("你的触手不受控制地动了起来，将三姐妹紧紧缠绕在由肢体和触手交织而成的密集网中。红发女孩倒挂着，脚踝被吊起，脸上带着极度幸福的表情。她那根肉棒正被你的一根触手疯狂地套弄着，同时她的两个小穴也被两根粗壮的触手交替抽插着。黑发女孩的处境也好不到哪里去，她翻着白眼，舌头伸在外面，屁股里塞满了跳动的触手，一只手还胡乱地和另一根触手一起插进她的小穴里。[pg]");
         outputText("[say: 呜哦哦……我的肚子好饱啊……]她高潮般地呻吟着，紧紧抓着自己的肚子。你的肉棒在她的体内蜿蜒穿行，明显地扭曲了她那圆润的肚子。她的身体变得瘫软，手从腹股沟处滑落，一股浓稠的淫液在空中划出一道弧线。她的脸涨得通红，眼神因狂喜而变得空洞。[pg]");
         outputText("金发女孩被折叠成两半，大腿张开，脚踝勾在脑后，她的六条尾巴都在疯狂地抽搐着。她的乳房在你的触手挤压和盘绕下被压扁并凸起，触手淫荡地摩擦着她的乳头。似乎理智早已从她的脑海中被驱逐，她张着嘴，眼神因欲望而空洞。她的喉咙因你肉棒的侵入而鼓起，混合着口水的预精液顺着她的下巴滴落。她急切地开始吸吮它，臀部自动地与你在她其他孔洞中的肉棒的起伏同步抽插着。[pg]");
         outputText("空气中弥漫着浓重、麝香般的精液气味，一股精液从红发女孩的肉棒中冲天而起，每次她喷出另一股精液时，那根跳动的肉棒都会明显肿胀。整个甲板和你周围的水都被她的精液染红了，她和她的姐妹们从头到脚都沾满了她大量的分泌物。薄荷的清凉感渗透进你皮肤上那些粘稠水滴落下的地方，让你在快感中颤抖。她的精液顺着你的触手滴落的刺痛感给你的腹股沟带来了难以忍受的快感。[pg]");
         outputText("这三只失去知觉的狐妖在你的触手紧握下无助地抽搐着，被快感逼疯了。你那被魔法强化的触手毫无停歇地在她们身上耕耘，不断地捶打着她们被蹂躏的孔洞。你身体的每一块肌肉都紧绷着，准备迎接一次不可思议的高潮，欲望在你的下体像盘绕的弹簧一样沸腾。压力不断累积，直到你再也无法忍受，在三姐妹身下抽搐着，在狂喜中呻吟着。你的高潮同时射入你的每一根肉棒，从根部肿胀到尖端，将你浓稠的精液释放在她们体内。[pg]");
         if(get_player().cumQ() <= 150)
         {
            outputText("温暖的精液从你的每根触手中流出，把姐妹俩的里里外外都涂成了白色。滚烫的精液珍珠浸透了这三只狐妖，与红发女孩的精液混合在一起，从她们的身体上滚落，滴入水中。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("浓稠的精液从你的触手中倾泻而出，在空中喷射出白色的条纹，给姐妹俩里里外外涂上了一层闪闪发光的白色。精液珍珠从她们的身体上滴落，与红发女孩的精液混合在一起，滚落到水中。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("浓稠的乳白色精液像丝带一样在空中飞舞，落在姐妹俩的身体上，用你滚烫的精液涂抹着她们的内脏。一层厚厚的珍珠白精液覆盖在她们的身体上，使她们的头发变得暗淡无光，并从她们丰满的曲线上滴落下来。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("浓稠的滚烫精液喷射在空中，高高地划出一道弧线，像白色的阵雨一样洒在姐妹俩身上。当你的触手将一波又一波滚烫、乳脂状的精液泵入她们被蹂躏的洞穴时，她们的腹部开始肿胀，细细的水流从你的每根肉棒周围喷涌而出，顺着她们的曲线滴落下来。一层厚厚的珍珠白精液覆盖在她们的身体上，使她们的头发变得暗淡无光，并从她们丰满的曲线上大块大块地脱落。");
         }
         else if(get_player().cumQ() > 2500)
         {
            outputText("浓稠的精液在空中划出一道弧线，像热水澡一样倾泻在三姐妹身上，精液绳溅落在她们的身体上，给她们涂上了一层厚厚的白色。粗大的凸起顺着你淫秽的触手向下移动，一波又一波的精液喷发进她们被蹂躏的洞穴，让她们的腹部开始肿胀，随着你精液的重量不断向外扩张。没过多久，加压的水流从你的肉棒周围逸出，两股精液从她们的鼻子里喷射而出。姐妹俩被你充满活力的精子浸透、纠结、完全塞满，软绵绵地挂在你触手的线圈里，四肢和尾巴微弱地抽搐着。");
         }
         outputText("[pg]你下体的每一次抽搐和痉挛都让你感到更加疲惫，眼皮因困倦而变得沉重，你能感觉到生命力正在从你体内流失。三个姐妹绝望地喘息着，随着你疲软的触手慢慢将她们放回水中，她们逐渐恢复了理智" + (get_player().cumQ() > 1000 ? "，她们的手臂保护性地环抱着被精液胀满的肚子" : "") + "。在经历了这场折磨后，你筋疲力尽，让自己放松下来，陷入了一种幸福的昏迷状态，只隐约感觉到自己被拖上了甲板。在失去意识之前，你看到的最后一件事是三姐妹爬到你身边，哄骗着你耗尽精力的触手重新恢复活力，她们的眼睛里闪烁着饥渴的光芒。");
         outro();
         get_player().orgasm("Dick");
      }
      
      public function talkAfterResistingKitsunellusion() : void
      {
         var talked:Boolean;
         var _g1:KitsuneScene;
         var firstTime:Boolean;
         var willing:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         kitsuneSprite();
         outputText("尽管她很古怪，但似乎并没有明显的威胁，所以你决定试着和她谈谈。你在脑海中搜寻着该说些什么，最后只是简单地问她为什么要引你来这里。[pg]");
         if(get_monster().hair.color == "blonde")
         {
            outputText("[say: 哎呀，那不重要啦，小笨蛋，]她狡黠地笑着说。[say: 重要的是你现在在这里……][pg]");
            outputText("自从谈话开始，她就一直用饥渴的眼神看着你，在你周围漫不经心地踱步。她时不时地凑近，用尾巴抚摸你，并让你能从一个不错的角度看到她那身日式长袍下的风光。[pg]");
         }
         else if(get_monster().hair.color == "black")
         {
            outputText("你眨了眨眼，她就已经扑到了你身上，食指在你的胸膛上画着圈。她几乎是挂在你身上，说道：[say: 你可是今天的猎物哦，小可爱！嗯~嗯，看起来真是一块美味的点心。][pg]");
            outputText("你不知道被她称为食物是该感到被侮辱还是恐惧，所以你决定两者兼有。不过，当她四处走动，用尾巴抚摸你，并凑近用她丰满的胸部挑逗你时，你的目光还是被她吸引了。[pg]");
         }
         else
         {
            outputText("[say: 啊！被你抓到了，]她假装尴尬地说。[say: 你们凡人在树林里跌跌撞撞的样子真是太可爱了……我简直无法抗拒！]");
            outputText("[pg]你狠狠地瞪了她一眼，感到有些被冒犯，但她只是狡黠地笑了笑，对你的不满不以为意。她漫不经心地在你周围踱步，尾巴滑进你的[armor]下，挠着你的敏感带，同时用她那暴露的长袍下的风光挑逗你。[pg]");
         }
         outputText("你扭过身子，试图摆脱爬满全身的酥麻感，这种感觉正在削弱你理性思考的能力。[pg]");
         outputText("[say: 哎呀，你真没意思，]当你拉开距离时，她微微撇了撇嘴说。[say: 不来玩玩吗？我保证你不会失望的……我和我的姐妹们会好好招待你的。][pg]");
         outputText("当你考虑她的提议时，自我保护的本能与好奇心" + (get_player().get_lust100() > 50 ? "和欲望" : "") + "在激烈交锋，" + (get_player().lib < 50 ? "权衡着你的机会与潜在的危险。" : "你的目光紧盯着她长袍下丰满的曲线。"));
         menu();
         _g = this;
         willing = true;
         firstTime = false;
         addButton(0,"跟随",function():void
         {
            _g.mansion(willing,firstTime);
         });
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDKT) == 0)
         {
            addNextButton("藤蔓",get_game().swamp.alrauneScene.askKitsune).hint("知道怎么解决这个吗？");
         }
         _g1 = this;
         talked = true;
         addButton(14,"离开",function():void
         {
            _g1.leaveKitsune(talked);
         });
      }
      
      public function takeAKitsuneStatue() : void
      {
         clearOutput();
         outputText("一想到你能用它换到多少宝石，就足以迅速压制这些感觉，贪婪战胜了内疚。");
         dynStats(DynStat.Lust(10));
         get_inventory().takeItem(get_useables().GLDSTAT,get_camp().returnToCampUseOneHour);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,709,1);
      }
      
      public function tailJobKitsuneWin() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("看着她丝滑的尾巴，你想到一个绝妙的主意来缓解一些紧张感。你动作迅速地解开狐妖腰间的腰带，然后重新系上，把她的双臂绑在身体两侧。你把她翻转过来，让她靠在一棵树上，然后开始脱下你的[armor]，伸手将她的六条尾巴抱在怀里。她好奇地抬头看着你，看着你把其中一圈毛茸茸的尾巴缠绕在[eachCock]上，指尖慢慢地穿过那光泽的皮毛。当你的手指滑过它们毛茸茸的表面时，她不由自主地颤抖了一下，脸颊泛起微红。尾巴似乎自动收紧了，不需要任何进一步的鼓励，紧紧的毛环开始上下滑动，性感地挤压和按摩着你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "。[pg]");
         outputText("她对尾巴的控制力简直不可思议！它们在你的腹股沟处抚摸和挠痒，用它们柔软如刷子般的尖端扫过它们能找到的每一寸裸露的肌肤。" + (get_player().balls > 0 ? " 一圈温暖的尾巴开始缠绕在你的[balls]上，露出底部，这样尾尖就可以卷下来，在缝隙上轻轻来回滑动，让你脊背发凉。" : "") + (int(get_player().cocks.length) > 1 ? " 她剩下的尾巴开始在你的肉棒之间穿梭，卷曲并缠绕在肉棒上。当它们上下滑动时，它们开始轻轻收缩，就像毛茸茸的阴茎环一样。" : " 她剩下的尾巴缠绕在你的阴茎上，沿着肉棒上下滑动。其中一条尾巴缠绕在你的" + (get_player().hasSheath() ? "包皮" : "根部") + "上，开始轻轻收缩，就像一个毛茸茸的阴茎环。") + " 你感觉在它们极其细腻的触碰下几乎立刻就能射精，但每次你感觉到高潮即将来临时，狐妖都会退缩。[pg]");
         outputText("[say: 愚蠢的凡人……你真的在用我的尾巴自慰吗？] 她戏谑道，一边摆弄着尾巴，一边带着狡黠的笑容抬头看着你，其中一条尾巴滑上来，居高临下地抚摸着你的下巴。尽管她这么说，但她脸上泛起的红晕却暴露了她真正的快乐，她毛茸茸的尾巴随着每一个轻柔的动作而竖起。[pg]");
         outputText("你结结巴巴地抗议，" + (get_silly() ? "告诉她你才不是喜欢她超级柔软的尾巴什么的。" : "告诉她她是你的俘虏，应该表现得像个俘虏。") + " 她咯咯地笑了一下，顺从地点点头，不再说话，向后靠在树干上，任由她的尾巴继续戏弄和抚摸你。[pg]");
         outputText("你想找点事做，于是用一只手撑在她上方的树干上，臀部抵着她的尾巴，另一只手轻轻地穿过她的头发。她一次又一次地把你带到高潮的边缘，戏弄地让你悬在边缘，然后在最后一秒把你从边缘拉回来。这纯粹是美妙的折磨，如果不是感觉这么好，你可能会生她的气，因为她本该是你的俘虏，却胆敢做出这种事。[pg]");
         outputText("就在这样一次快感与拒绝循环的顶峰，你感到一阵凉爽刺痛的感觉席卷全身，低头一看，只见狐妖的嘴唇撅在" + (get_player().balls > 0 ? "你的" + get_player().ballsDescriptLight() + "下方" : "你的" + get_player().cockDescript(0) + "的" + (get_player().hasSheath() ? "包皮" : "根部")) + "，轻轻地向你的腹股沟吹着苍白的火焰。[pg]");
         outputText("强烈的刺痛感正是你所需要的，你冲出边缘，迎来了高潮的全部力量。[EachCock]跳动着，紧绷的毛环阻止你完全释放，即使你的肌肉徒劳地痉挛。" + (get_player().balls > 0 ? "浓稠的精液开始在你的[balls]里涌出，让它们因为积聚的精液而肿胀得可怕。" : "") + "谢天谢地，她似乎很快就厌倦了戏弄你，抽回了那些作恶的尾巴。");
         if(get_player().cumQ() <= 150)
         {
            outputText("你那被延长了三次的高潮在她的脸上爆发，一股股浓稠的精液射在她的额头和脸颊上，顺着她的嘴唇滴落。她微微叹了口气，开始清理自己，舔掉舌头够得着的地方的精液，然后用她的腰带当毛巾擦掉剩下的。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("浓稠的精液溅在她的额头上，让她的头发缠结在一起，顺着她的脸慢慢滴落。她舔掉舌头够得着的地方的精液，然后用手擦掉剩下的，把腰带当毛巾用。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("你用浓稠的精液把她的脸弄得湿透了，精液的量让她有点惊讶，你给了她一个漂亮浓厚的颜射。她舔掉挂在嘴唇周围的几滴浓稠精液，用她的腰带当毛巾清理剩下的。");
         }
         else if(get_player().cumQ() < 2500)
         {
            outputText("你的精液在她的脸上爆发，让她的头发缠结在一起，给她覆盖上一层厚厚的、温暖粘稠的精液。沉重的精液顺着她的脸颊滴落，落在她的胸前，几股迷路的精液压在她的耳朵上。被你的精液彻底淋透后，她用舌头舔了舔嘴唇外侧，然后开始用她的腰带当毛巾擦掉剩下的。");
         }
         else
         {
            outputText("你用你充满男子气概的射精把她彻底浸透了，在她的胸前释放出粗壮的精液绳。她的头发、脸和胸部都被你的精液彻底浸透了，精液滴落下来，大声地溅在地上。她用舌头舔了舔嘴外侧，吞下她能碰到的任何东西，然后开始清理自己，用她的腰带当毛巾。");
         }
         outputText("[pg]很难说她究竟是什么时候挣脱束缚的，但当你还在从精疲力竭的高潮中恢复时，她从你身下溜了出来，冲向灌木丛，早熟地咯咯笑着。[pg]");
         outputText("[say: 随时来找我，亲爱的！]当她安全地离开视线时，她回头喊道。你短暂地考虑过追赶，但决定不值得费力，收拾好你的[armor]，转身向营地走去。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(5));
         get_combat().cleanupAfterCombat();
      }
      
      public function stealAStatue() : void
      {
         clearOutput();
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,709) == 0)
         {
            outputText("感觉这个机会实在不容错过，你贪婪地搓了搓手，从神龛上抢走了金雕像。当你把它塞进你的[inv]时，你被一种强烈的罪恶感所淹没。你开始重新考虑了……");
            addButton(0,"拿走",takeAKitsuneStatue);
         }
         else
         {
            outputText("空荡荡的祭坛立在那里，显然缺少了你从上面拿走的雕像。如果你想的话，你可以把它放回去。");
            addButton(0,"放回",putKitsuneStatueBack);
         }
         addButton(14,"返回",kitsuneShrine);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function rideDatRedheadKitsuneCockIntoTheSkyDiamonds() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你密切注视着倒下的狐妖，在靠近时绕着她转圈。再怎么小心也不为过，你当然有理由怀疑这可能只是另一个诡计。值得庆幸的是，看来这位聪明的诱惑者的诡计已经用尽了。");
         outputText("[pg]小心翼翼地" + (get_player().isBiped() || get_player().isTaur() ? "伸出一只" + get_player().foot() : "向下伸手") + "，你推开她的大腿，分开她的双腿，看看她在长袍下藏了什么。你把丝绸衣服向上翻，把她一英尺长的阴茎从奢华的束缚中解放出来。它向上翘起迎接你的目光，从根部到顶端都在跳动，带着一种顽皮的淫荡抽搐。[pg]");
         outputText("当你开始用手指沿着那根跳动的肉棒滑动时，她对你咧嘴一笑，她火热的翠绿色眼睛里燃烧着骄傲和兴奋的混合物。[pg]");
         outputText("[say: 嘿嘿，你喜欢吗？][pg]");
         outputText("你紧紧地握住它作为回答，她娇羞的评论立刻变成了呻吟，她的双腿不由自主地张开，放弃了对她那不匹配的生殖器的控制。当你让她尝尝自己的苦头，以缓慢而有条理的节奏抚摸她的肉棒时，她戏弄的态度稍微融化了一些。只需在她的额头上轻轻一推，就能让她四仰八叉地倒在地上，她双手枕着头，满足地笑着躺在那里。[pg]");
         outputText("你随意地脱下你的[armor]，将它们扔到一边。此时，她已经完全任你摆布，随着你手掌每一次挑逗的抚摸，她全身都在颤抖。[pg]");
         outputText("[say: 哦……你还真懂得怎么对待女孩子……]她娇嗔着，用她那过大的犬齿尖端咬着食指的第一指节。[pg]");
         outputText("你带着坏笑，用一根手指顺着她肉棒的长度滑下，挑逗地挠着。你的指尖在下方性感地滑动，拨开她丰满双唇柔软的粉色嫩肉。当你越来越靠近她湿滑的小穴时，她脊背一阵战栗，最后你猛地一挺，将前两根手指齐根没入。[pg]");
         outputText("她温暖的甬道几乎立刻收缩，紧紧包裹住你侵入的手指，她的背高高拱起，发出一声响亮的呻吟，盖过了她湿透的小穴挤压你指尖时发出的甜美水声。你的手指抽插了几下，另一只手则缓慢地抚摸着她跳动的肉棒，从顶端收集起一滴滴的淫液，并将其涂抹在肉棒上。[pg]");
         outputText("你调整好姿势，将自己降到她的臀部上方，双手放在她的膝盖上作为支撑。当她肉棒的顶端亲吻你" + get_player().vaginaDescript() + "的开口时，一阵凉爽的刺痛感开始从你的下体蔓延，顺着脊椎向上战栗。你调皮地前后摇摆臀部，用你温暖的裂隙性感地抚摸着她肉棒的顶端。一丝细细的润滑液顺着她敏感的肉棒滑下，让她高兴得浑身发抖。你放慢动作，几乎到了静止的地步，" + (get_player().vaginas[0].vaginalLooseness > 2 ? "然后突然向前一倾，你将自己压在她跳动的肉棒上，一次性将其齐根没入。一种闷烧的刺痛感在你的下体起伏，在她跳动的肉棒顶端最为强烈。" : "慢慢地让它进入。随着你慢慢坐下，当粗壮的肉棒撑开你的[vagina]时，你发出急切的呻吟。终于，你的臀部与她的相连，你深吸一口气，停顿了片刻，一种闷烧的刺痛感从你的下体辐射开来。"));
         get_player().cuntChange(12,true,true,false);
         outputText("[pg]");
         outputText("你的臀部缓慢地起伏，前后滚动，同时你内部的肌肉挤压并按摩着她跳动的肉棒，用你所能调动的所有技巧来挑逗她。看来这个爱捉弄人的捣蛋鬼很享受自食其果的滋味——她的胸膛随着低沉的呻吟而颤抖，双手在胸前缓慢地游走，毫无保留地展现着她的狂喜。你抓住她的手腕，将她的手臂按在头部两侧，用你的[hips]压住她，将她固定在地上。她曲线优美的臀部在你身下扭动挣扎，试图寻找任何可以借力的地方，哪怕只是最微小的移动。你问她喜不喜欢自食其果的滋味，嘲笑她的挣扎，并用指尖在她的额头上画圈。她从沙哑的呻吟中停顿了片刻，调皮地撅起嘴，绿色的眼睛带着一丝无奈的挫败感瞪着你。你所有的挑逗显然并没有削弱她那火热的性子，尽管现在它被一层狂热的欲望所掩盖，随着你的每一次触摸，这股欲望都在她的核心中战栗。[pg]");
         outputText("她的肉棒在你体内膨胀，将一阵刺痛的凉意传遍你的躯干。你颤抖着，" + (get_player().biggestTitSize() > 3 ? "你的[fullChest]左右摇晃，" : "") + "无法阻止呻吟从喉咙里溢出。作为报复，你抬起身子，将你的[hips]比之前更用力地砸向她的臀部，用你的骨盆肌肉用力挤压她的肉棒。你一次又一次地将她宽大的臀部撞向地面，让她泄了气，再次变成一滩颤抖的烂泥。六条深红色的尾巴在她身下狂乱地拍打着，本能地向你的身体卷曲，试图缠绕住它们能触及的任何东西。丝滑的尾巴滑过你的[skin]和她自己的皮肤，在它们经过的地方迸发出火花，将你们俩带上了快乐的巅峰。[pg]");
         outputText("你们骨盆碰撞的声音充满了森林，淫荡的拍打声在树林间回荡。她肿胀的肉棒在你的肉壁上跳动，几乎不停地抽搐着，她的高潮正在向一个美妙的结局积聚。你也快到极限了，你的阴道肌肉自由地收缩着，你带着坚定的热情骑乘着她跳动的肉棒，准备榨干她所能提供的一切。第一股粘稠的精液像冰块一样击中你的子宫，让你在惊讶的快感中皱起眉头，随后它化作一阵温暖的刺痛，将平静传遍你痉挛的下体。你的肌肉在她的肉棒上起伏，将她的精液向上吸入你等待的子宫。至少可以说，她的产量相当惊人，一缕缕翻滚起泡的精液喷射进你的子宫，发出清晰的晃动声。你的肚子摇晃着膨胀起来，慢慢地被她刺痛的种子填满，直到它膨胀到西瓜大小，浓稠的精液从你的裂口涌出" + (get_player().wetness() == 5 ? "，同时一股粘稠的爱液喷洒在她的身前" : "") + "。[pg]");
         outputText("随着她的高潮开始消退，她急促的喘息声慢了下来，她的两条尾巴几乎是保护性地缠绕着你充满精液的肚子。你一只手放在肚子上，笨拙地转移重心，从精疲力尽的狐妖身上下来，松了一口气，因为一条名副其实的精液河开始从你的[vagina]涌出，洒在狐妖的身前。她那根用过的肉棒无力地挂在一条大腿上，仍然在微微抽搐着。[pg]");
         outputText("当她那巨大的精液排空后——主要排在了她身上——你清理干净并再次开始穿衣服。你的注意力被树叶沙沙作响的声音所吸引，当你转头看时，六条红色的尾巴消失在灌木丛中，紧随其后的是一只调皮挥舞的手。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_player().slimeFeed();
         get_combat().cleanupAfterCombat();
      }
      
      public function reset() : void
      {
         saveContent.hadVision = false;
         saveContent.statueLocation = "";
         saveContent.statueDay = 0;
      }
      
      public function redheadsDontDeserveToHavePenisesBecauseTheyreTooGayForPenisOrSomethingIDontReallyKnowHowThisWorksOrWhyThisFunctionNameIsSoFuckingLong() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你微微眯起眼睛，皱着眉头色眯眯地盯着狐妖双腿间的凸起。你的目光在她丰满的身躯上游走，仔细打量着女孩迷人的曲线。决定了——如果你要和她寻欢作乐，那东西必须去掉。[pg]");
         outputText((get_silly() ? "[say: 不喜欢鸡巴，你是什么，同性恋吗？]狐妖用完美的冷面滑稽语气调侃道。" : "[say: 哦，真无聊，]她失望地嘟囔着，下唇颤抖着，做出嘲弄的撅嘴表情。") + "[pg]");
         outputText("你恼怒地嘟囔着，用手指戳向她的腹股沟，然后用拇指指着肩膀上方的空气，发出一声坚持的口哨。[pg]");
         outputText("她翻了个白眼，犹豫地顺从了，一圈火焰吞噬了她不协调的生殖器，伴随着打火石被敲击的噼啪声。当蔚蓝色的火焰消散时，她一英尺长的肉棒已经退化成一个挺拔的樱桃色小肉突。[pg]");
         outputText("[saystart]好吧，你赢了。愿赌服输...");
         if(get_silly())
         {
            outputText("你这个怪物。");
         }
         outputText("[sayend][pg]");
         outputText("<b>你现在打算拿她怎么办？</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,627,0);
         defeatTheKitsunes(false);
      }
      
      public function readKitsuneBooks() : void
      {
         clearOutput();
         outputText("你决定翻阅书架上的旧书。令你沮丧的是，其中许多似乎是用你无法理解的奇怪文字写成的。不过，经过一番寻找，你找到了几本你能读懂的书，小心翼翼地翻阅着那些布满灰尘的旧书页。[pg]");
         var _loc1_:int = Utils.rand(3);
         if(_loc1_ == 0)
         {
            outputText("这本书读起来相当枯燥，但信息量很大。一章又一章地解释了魔法的底层理论，细节多得几乎让人难以忍受。" + (get_player().get_inte() < 50 ? "很多内容你都看不懂，但这本书确实澄清了一些问题。你合上书，把它放回书架，感觉自己学到了一些东西。" : "大部分内容只是复习，但在合上书并将其放回书架之前，你确实收集到了一些事实。"));
            dynStats(DynStat.Inte(2));
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(_loc1_ == 1)
         {
            outputText("这似乎是某种宗教文本。当你翻阅书页时，你读到了各种仪式和经文，熟悉了这片土地上的神灵。你终于合上了书，恭敬地把它放回书架，反思着里面的教义。");
            dynStats(DynStat.Cor(-1));
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你开始翻阅书页，随着你深入阅读这本显然是某种色情小说的书，你的脸颊上慢慢泛起深深的红晕。几乎每一页都充斥着女人被触手怪侵犯的生动描写，" + (get_player().lib < 50 ? "你在读下去之前猛地合上了书，已经感觉到腹股沟处升起一股热流。" : "你饥渴地舔了舔嘴唇，仔细阅读着每一行淫词艳语。"));
            dynStats(DynStat.Lib(1),DynStat.Lust(5));
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function putKitsuneStatueBack() : void
      {
         clearOutput();
         outputText("后悔你的决定，你把雕像放回了基座上，今天你的良知战胜了贪婪。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,709,0);
         get_player().consumeItem(get_useables().GLDSTAT);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function putItInAKitsunesAssWin() : void
      {
         clearOutput();
         kitsuneSprite();
         var _loc1_:int = get_player().cockThatFits(144);
         outputText("你的目光在她可爱的身躯上游走，欣赏着每一道丰满的曲线和线条。最后，你的目光停留在她那宽大、摇晃的屁股上，仔细端详着右边屁股上那个巨大的彩色纹身。当你盯着它看时，热量涌向[eachCock]，几乎被那光滑的球体迷住了。你搓着双手，色眯眯地咧嘴笑着，伸出手将狐妖摆成四肢着地的姿势，将她那美味丰满的臀部抬到半空中，扯开她的长袍，毫不客气地把它们扔到一边。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 1 ? " 她半软的肉棒在双腿间晃荡，一缕细细的淫水从顶端垂下，随着它的摆动来回晃动。" : "") + "[pg]");
         outputText("你用力地拍了一下她的屁股，试探性地打了一巴掌，然后你高兴地咯咯笑了起来，因为那两瓣颤抖的屁股像果冻一样摇晃了感觉足足有一分钟才停下来。狐妖发出一声可爱的娇喘，回头看着你，微微一笑，现在把脸颊靠在手臂上。她一点也不抗拒你的进攻，当你掏出你的" + get_player().cockDescript(_loc1_) + "并把它放在她圆润的臀部上时，她似乎很高兴，自动把尾巴抬起来让开。[pg]");
         outputText("[say: 哦，不，这么大、这么强壮的肉棒……我该</i>怎么<i>办呢？]她带着苦笑说道，开始用她丰满的脸颊在你的肉棒上下滑动，她的一条尾巴盘旋而下，轻轻地缠绕在" + (get_player().hasSheath() ? "包皮" : "根部") + "上。[pg]");
         outputText("好吧，如果她不抱怨，你也不会！[pg]");
         outputText("第二条尾巴垂下来，插入她湿润的小穴，出来时沾满了她滑溜溜的淫水。她像画笔一样使用它，在你迅速变硬的勃起处上下旋转，用她的汁液涂抹你。这有点痒，当温暖、光滑的液体涂抹在你的肉棒上时，你高兴得浑身发抖。一旦你的肉棒被充分润滑，她的尾巴就会华丽地向上翻转，从你的鼻子底下经过，用她浓郁的女性麝香挑逗你。[pg]");
         outputText("她把臀部向前拉，用她丝般柔软的尾巴抚摸你的阴茎，引导它亲吻她紧致的粉红色小穴，同时舔了舔嘴唇。你抓住她宽大、曲线优美的臀部，将手指深深陷入她的肉中，开始用力将你的" + get_player().cockHead(_loc1_) + "推向她的屁股，当它出人意料地轻松滑入时，你高兴地喘着粗气。她肌肉发达的肉环奇妙地伸展，欢迎你的肉棒进入它的深处，并用温暖包围它。当她的肠道以你从未想过的方式在你周围荡漾和挤压时，你呻吟了一下。[pg]");
         outputText("[say: 别表现得那么惊讶，亲爱的，]狐妖在呻吟的间隙说道，活动着她屁股的肌肉，让两瓣屁股独立地颤抖和摇晃。[say: 简直就像你以前从来没有操过狐妖的屁股一样。][pg]");
         outputText("当你开始挺动臀部时，她前后摇晃身体来迎合你，咬着舌头，从牙缝里发出呻吟。每次你拔出时，她的肛门都会压迫你，挤压得如此之紧，以至于似乎永远不会释放你，然后当你再次插入时，它又变得松弛而诱人。这个过程一遍又一遍地重复，每次拔出都强有力地榨取你，几乎把你吸回体内，在几分钟内将你送上快乐的顶峰。[pg]");
         outputText("感觉到你即将到来的高潮，她收紧了缠绕在你" + (get_player().hasSheath() ? "包皮" : "根部") + "的尾巴环，阻止你的高潮释放，并将血液困在你肿胀的" + get_player().cockDescript(_loc1_) + "中，使其变得更加敏感。[pg]");
         outputText("[say: 嘿，我们才刚刚开始！你不想这么快就结束，对吧？][pg]");
         outputText("你感觉到你的[balls]肿胀起来，因为你的精液开始在你的" + (get_player().hasSheath() ? "包皮" : "根部") + "后面堆积，它释放的通道被调皮的狐狸女孩的尾巴挡住了。不知何故，即使被击败了，她仍然找到了玩弄你的方法！你的肉棒在她体内痉挛，试图将它乳白色的精液释放到她温暖的内脏中，但无济于事——然而，从好的方面来说，你不知何故能感觉到她肉体的每一次涟漪和波动都放大了十倍，紧紧地抓住你，愉快地榨取你的肉棒。[pg]");
         outputText("每次拔出时，她的一条尾巴的尖端开始沿着你肿胀的肉棒滑动，挠着敏感的肉体，使感觉更加复杂。当一小串劈啪作响的空灵火焰开始在肉棒下方跳跃时，你几乎高兴得弯下腰，让你充满一种刺痛的凉爽感，这种凉爽感蔓延到你的腹股沟，并突出了她屁股令人难以置信的炽热温暖。当你开始迷失在快乐中时，她趁机将两条尾巴缠绕在你的腰上，用它们像活塞一样前后推动你的骨盆。她那极其柔软的屁股拍打着你的臀部，每次她把它们向后推以迎合你时，都会摇晃和颤抖，一次又一次地将自己刺穿在你多肉的肉棒上。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 你能感觉到她自己坚硬的肉棒在双腿间来回晃动，偶尔拍打你的[legs]，并在其后留下一串淫水。" : "") + "[pg]");
         var _loc2_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         var _loc3_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         outputText("她展示了惊人的柔韧性，毫不犹豫地翻身仰卧，双腿张开并合拢在你的臀部周围。" + (_loc2_ ? " 她粗壮的肉棒搁在肚子上，淫水滴入肚脐，每次她强迫你进入时都会无所事事地抽搐。" : "") + " 她的直肠在你肉棒周围轻轻扭动，给混合物增添了另一种感觉，让你高兴得呻吟和发抖，你的手本能地向下摸索她甜美的屁股。她的双臂交叉在脑后，向后放松，用下半身引导你一次又一次地进入她。每次你试图放慢速度，她的腿就会弯曲并再次将你向前推，从不松懈。她开始有点夸张地呻吟，在挑逗的展示中摸索和抚摸自己的乳房。" + (_loc3_ ? " 一只手顺着她的肉棒向上摸去，开始抚摸它，挤出一团淫水，她把它举到唇边，奢侈地吸了下去。" : "") + " 显然，她很享受她让你经历的幸福折磨，因为她带着一种假装的无辜盯着你，把她肿胀的乳头之一举到唇边，轻轻地吸吮着。[pg]");
         outputText("够了！她已经玩够了！被欲望和快乐逼疯了，你用力地扑倒在她身上，抓住她的手腕，把它们按在地上。你咕哝着，呻吟着，开始毫不留情地把你的肉棒捣进她的屁股，受够了她的挑逗。她竟然有胆量，在你光明正大地打败她之后，试图剥夺你应得的奖励！[pg]");
         var _loc4_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         var _loc5_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         outputText("[say: 啊啊啊！]当你从她手中夺回控制权时，她尖叫起来，几乎立刻放下了她娇羞的伪装，发出一声巨大的呻吟。[say: 哦！所以你终-终于受够了，是-是吗？]她气喘吁吁地说，可爱地咬着食指的第一个指关节。一股清澈的女性淫水浸透了你的肚子，她湿透的小穴像有人打开了水坝的闸门一样喷涌出液体" + (_loc4_ ? "，同时一缕淫水从她的肉棒喷出，落在她的肚子上" : "") + "。看起来你突然表现出的统治力已经成功地突破了她卖弄风骚的外壳，唤醒了下面那个好色的荡妇！" + (_loc5_ ? " 你向前伸出手，抓住她跳动的肉棒，紧紧地握在拳头里，开始随着你强有力的推力抽动它，让狐妖高兴地嚎叫，疯狂地向后仰着头，从头到脚都在发抖。" : "") + "[pg]");
         outputText("当她喷涌的小穴继续痉挛并用她光滑的液体浸透你的臀部时，她的屁眼像老虎钳一样夹住你的阴茎，内部肌肉颤抖着，以一种令人难以置信的强烈吸吮感榨取你的阴茎。她尖叫着达到高潮，失去了对你" + get_player().cockDescript(_loc1_) + "的控制，你迟来的高潮终于能够爆发到她的肠道中，像一条汹涌的白色河流一样冲进她的肠道。");
         if(get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            outputText("她的肉棒在你手中跳动和抽搐，");
            if(get_player().cor > 15)
            {
               outputText("处于高潮的边缘。就在她即将获得释放时，你收紧了对她根部的握力，恶作剧地笑着。是时候让这个小荡妇尝尝她自己的苦果了！[pg]她的肉棒在你的手下过度肿胀，徒劳地跳动和抽搐，因为她拼命试图克服阻塞。她的脸扭曲成痛苦的表情，带着一丝受虐的幸福。她在你的掌控中扭动和挣扎，眼角涌出泪水，在狂喜的折磨中翻白眼。[pg][say: 我-我很抱-抱歉！求-求求你！求求你，求求你，求求你，我求求你了！][pg]这还差不多。你向后靠，把她抽搐的肉棒从你自己身上移开，松开你的握力，她的肉棒开始不受控制地痉挛，");
            }
            outputText("浓稠的精液如绳索般射向空中，伴随着悦耳的飞溅声落在她的脸、胸和肚子上。她发出一声强有力的呻吟，在狂喜中挺动着臀部，将一波又一波浓稠的精液喷射到自己身上，把她的正面完全涂满了她自己浓稠的种子。");
         }
         if(get_player().cumQ() <= 150)
         {
            outputText("比你想象中还要多的精液涌入她温暖的体内，她的肠道挤压并吸吮着你所能提供的最后一滴精液。你浓稠的种子涂满了她的肠壁，在她强壮的内部肌肉即使在你射完最后一滴后仍继续收缩时，发出清晰可闻的吧唧声。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("浓稠的精液如绳索般在她的体内爆发，释放的奇妙感觉几乎令人痛苦，因为每一股精液都撑开你的尿道，将她丰满的后庭填得满满当当。你能感觉到她直肠的肠壁仍在收缩，紧紧包裹着你疲软的阴茎，将你的最后一滴精液榨干，并发出清晰可闻的咕噜声。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("巨大的精液团几乎痛苦地撑开你的尿道，你将一大桶精液释放进这只可怜狐妖的屁股里，像野兽一样呻吟着，翻着白眼压在她身上，你的臀部疯狂地挺动和痉挛。她的体内发出清晰可闻的咕噜声和吧唧声，即使在你的阴茎干涸很久之后，仍在饥渴地榨取着它，她的肚子也呈现出迷人的凸起，随着她的每一次呼吸微微颤动。");
         }
         else if(get_player().cumQ() < 2500)
         {
            outputText("你身体的每一块肌肉都因快感而共鸣，终于获得了光荣的释放，一团浓稠的精液在你的肉棒中膨胀，大声地喷射进她的屁股里。你将一波又一波浓稠的精液射入她渴望精液的体内，像野兽一样呻吟着，她肌肉发达的肠壁挤压并榨干你的每一滴精液。随着你将越来越多充满活力的种子塞进她的结肠，她的肚子开始像气球一样鼓起来，直到她挺着一个巨大圆润、看起来像怀孕一样的肚子，随着每一次呼吸微微颤动和晃荡。");
         }
         else
         {
            outputText("你的肉棒因为突然涌向出口的精液量而肿胀，一条粗壮的河流伴随着清晰可闻的水声倾泻进狐妖的屁股里。尽管她强有力的内部肌肉试图榨干你的每一滴精液，但这巨大的精液量对她来说还是太多了，高压的水流从她紧闭的肛门倒流出来，溅在你的臀部上。在你那不可思议的高潮结束很久之后，她的直肠肌肉还在不受控制地痉挛，而她则隔着那被精液撑得大得离谱的肚子，迷迷糊糊地抬头看着你。");
         }
         outputText("[pg]狐妖的舌头以一个奇怪的角度伸出来，歪向一边，同时她还在喘着粗气。" + (get_player().cumQ() > 2400 ? "当你拔出时，一股名副其实的精液洪流跟着你的肉棒，倾泻到地上。即使她身下有一小池子你的精液，她的肚子仍然保持着健康的隆起，她的一条尾巴正悠闲地抚摸着它。" : "当你拔出时，她的肌肉本能地收紧，将你的精液困在她的体内，同时一条尾巴悠闲地抚摸着她的肚子。") + "[pg]");
         outputText("[say: 呵……对于一个凡人来说……还不错，]她说道，恢复了之前那种戏弄的语气，尽管从她脸上满足的表情" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "以及她那疲软下垂的阴茎" : "") + "你可以看出她并没有那么想。[pg]");
         outputText("你花了一点时间恢复体力，然后开始收拾你的东西，但当你把注意力转回狐妖身上时，除了树叶间飘荡的女性咯咯笑声外，已经没有她的踪影了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function outro(param1:Boolean = false) : void
      {
         get_player().changeFatigue(15);
         kitsuneSprite();
         dynStats(DynStat.Tou(-2));
         if(get_player().get_fatigue100() > 80 && get_player().get_fatigue100() < 100)
         {
            outputText("[pg]你的梦境被幻象所萦绕：你在一座宏伟庄园的走廊里徘徊，绝望地寻找出路。无论你转向哪里，扭曲的走廊似乎都会绕回原点。你被困住了，注定要永远在这座庄园的走廊里徘徊，任由你那三位美丽的女主人随意玩弄。");
         }
         if(get_player().get_fatigue() >= get_player().maxFatigue())
         {
            doNext(mansionBadEnd);
         }
         else
         {
            outputText("[pg]第二天早上你醒来时，姐妹们、温泉和豪宅都不见踪影。你赤身裸体地躺在荒野中，你的物品整齐地堆放在不远处，而你对昨晚的记忆只是一场模糊的狂热梦境");
            if(param1)
            {
               outputText("——至少，你的下体似乎恢复了平时的构造");
            }
            outputText("。你坐起身，但几乎立刻又倒了下去，宿醉的沉重感像一吨砖头一样向你袭来，让你忍不住呻吟。过了很久，你才鼓起意志力收拾好东西，准备返回营地，但当你出发时，你发誓你能听到树林中回荡着幽灵般的笑声。[pg]");
            if(get_player().cumQ() < 10000 || !get_player().hasCock() && get_player().lactationQ() < 10000)
            {
               outputText("<b>由于姐妹俩魔法的残留效果，你的");
               if(get_player().hasCock())
               {
                  outputText("精液");
                  if(get_player().cumQ() < 500)
                  {
                     var _temp_1:* = get_player();
                     _temp_1.cumMultiplier = _temp_1.cumMultiplier + 3;
                  }
                  if(get_player().cumQ() < 2000)
                  {
                     var _temp_2:* = get_player();
                     _temp_2.cumMultiplier = _temp_2.cumMultiplier + 2;
                  }
                  if(get_player().cumQ() < 10000)
                  {
                     var _temp_3:* = get_player();
                     _temp_3.cumMultiplier = _temp_3.cumMultiplier + 1;
                  }
               }
               else
               {
                  outputText("乳汁");
                  if(get_player().lactationQ() < 500)
                  {
                     get_player().boostLactation(3);
                  }
                  if(get_player().lactationQ() < 2000)
                  {
                     get_player().boostLactation(2);
                  }
                  if(get_player().lactationQ() < 10000)
                  {
                     get_player().boostLactation(1);
                  }
               }
               outputText("产量增加了。</b>");
            }
            get_game().time.hours = 6;
            var _temp_4:* = get_game().time;
            _temp_4.days = _temp_4.days + 1;
            if(!get_game().get_inCombat())
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               get_combat().cleanupAfterCombat();
            }
         }
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nonTentaclePCMansion(param1:Boolean) : void
      {
         var willing2:Boolean;
         var _g1:KitsuneScene;
         var willing1:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         kitsuneSprite();
         outputText("[say: 我们希望你喜欢我们准备的盛宴，]那个有着乌黑头发的女孩说道，她和她的姐妹们在水里围着你，一丝不挂。[say: 现在，轮到</i>我们<i>了。][pg]");
         outputText("[say: 放松点，]红发女孩用一种似乎能摧毁任何抵抗痕迹的温暖语调在你耳边低语。[say: 我们会照顾好一切的……]半个身子泡在温泉温暖的水中，你忍不住屈服于她们的意志，你的烦恼从你身上流走。被她们那超凡脱俗的温暖肉体四面八方地包裹着，你靠在她们的怀里，幸福地叹息着，每一次触摸和爱抚都让你的脊背一阵发抖。[pg]");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_EVENT_KITSUNE1) > 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_EVENT_KITSUNE2) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2715) & get_game().forest.akbalScene.AKBAL_QUEST_DONE) == 0)
         {
            doNext(akbalFollowupMansion);
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            doNext(tentacleKitsuneWingWangs);
         }
         else if(get_player().hasCock())
         {
            _g = this;
            willing1 = param1;
            doNext(function():void
            {
               _g.kitsuneMaleOrHermMansion(willing1);
            });
         }
         else
         {
            _g1 = this;
            willing2 = param1;
            doNext(function():void
            {
               _g1.kitsuneFemaleOrGenderless(willing2);
            });
         }
      }
      
      public function nonFutaRedHeadIsWorstRedheadLapsittingHandjobThingIDontKnow() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("当你靠近时，这个被打败的女孩没有做出任何抵抗或逃跑的努力。她仔细地看着你走近，闪烁着绿光的眼睛里失去了许多火焰，取而代之的是一种虔诚的顺从。当你伸出手抚摸她的头顶时，她的耳朵耷拉在两边，她把脸颊贴在你的臀部，脸上泛起淡淡的粉红色红晕。[pg]");
         outputText("一条毛茸茸的深红色尾巴轻轻拂过你的手腕，轻轻地卷在上面，她的手犹豫地滑向你的胯部，轻柔地抚摸着它。她探询地抬头看着你，似乎在请求许可，你微微点头表示赞许，示意她继续。[pg]");
         outputText("她将手指勾进你的[armor]并慢慢拉开，露出[eachCock]。" + (get_player().balls > 0 ? "她用一只手掌轻轻托起你的[sack]，" : (get_player().get_gender() == 3 ? "她用一只手轻轻罩住你的[vagina]，并轻轻插入中指，" : "她轻轻托住你腹股沟的下方，")) + "另一只手环绕着你[cock biggest]，开始缓慢地抚摸它。[pg]");
         outputText("她轻轻地将脸贴在你的腹股沟上，让[eachCock]垂在她的脸上，并" + (int(get_player().cocks.length) > 1 ? "在它们之间" : "绕过它") + "抬头看着你。当她把你的肉棒挤压在额头上时，轻柔的亲吻和抚摸顺着你的[cock biggest]向上蔓延，她纤细的手指在柱身上上下抚摸。当你把手放在她的后脑勺上，把她紧紧拉向你的胯部，同时手指穿过她的头发时，她发出了一声轻微的呜咽。当你的另一只手开始抚摸她耳朵的内缘时，呜咽变成了愉悦的呻吟，一阵不由自主的颤栗顺着她的脊背流遍全身。[pg]");
         outputText("当女孩在你的抚摸下几乎融化时，你慢慢退开，降低身子坐在地上，把她拉进你的怀里。将她拉回你的[fullChest]上，你用双臂环抱住她，让她坐在[eachCock]的根部上方。她的大腿轻轻合拢，夹住" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "，紧紧地挤压着" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "，同时顺从地放松在你的怀里。你引导她的手向下摸到你的[cock biggest]，她立刻开始抚摸它，向后仰着头，恳求地在你的手上蹭着。[pg]");
         outputText("当你拉扯绳结时，她腰间的腰带掉了下来，你伸手绕过去，手指顺着她长袍的前面滑下，把它们拉开。她赤裸的乳房弹了出来，她挺起胸膛，试图让你挤压它们。当你开始摸索和挑逗那柔软的隆起时，她身上几乎每一块肌肉都松弛下来，她的手臂仍然在自动地在你的肉棒上上下套弄。只需要最轻微的挑逗，就能哄得她的乳头充血，变成坚硬敏感的凸起，到那时，她就成了你手中的玩物。[pg]");
         outputText("她的下巴无力地垂着，每一次颤抖的呼吸都让她的乳房在你的手中颤动，她半闭着眼睛，茫然地盯着前方。她的六条尾巴几乎完全停止了移动，软绵绵地卷在你身上，只有当你捏她娇嫩的乳头或用手指性感地划过她赤裸的肌肤时，才会偶尔微微抽动一下。每次你性感的挑逗让她无法自拔时，你就会退缩，只有当她恢复理智并继续抚摸你的肉棒时，你才会继续奖励她——毕竟，她不能忘记谁才是主导者。[pg]");
         outputText("她非常听话，尽管她的技巧似乎因为你的挑逗而变得有些含糊不清。改变你的策略，你将一只手滑到她的臀部，另一只手移到她的脸上，轻轻托起她的头，将其向一侧倾斜，露出她的脖子。你用力将指尖埋入她颤抖的臀部肌肉中，充满欲望地摸索和挤压着，然后倾身向前，将嘴唇贴在她的肩膀上，用舌头性感地舔过她光滑的肌肤。[pg]");
         outputText("她向前倾倒，惊讶地叫出声来，身体紧绷，因愉悦而颤抖，嘴巴张开，发出无声的呻吟。她软绵绵的尾巴恢复了生机，拼命地缠绕在你的四肢上，她颤抖的双手开始以新的活力抚摸你坚硬的肉棒。你轻轻地咬住她的肉，她的臀部向前猛地一挺作为回应，促使她开始将现在流着淫液的小穴在你的肉棒上摩擦。她的双腿张开，双脚踩在地上借力，向后靠在你的胸前，完全沉浸在愉悦之中。[pg]");
         outputText("你的臀部很快就被她大量的淫液浸透了，但湿滑的液体只会放大她用力抚摸的感觉。她的手向下移动到根部，收集了一把她自己的淫液，然后滑到龟头，将其与你滴落的清液混合，然后将这种充满麝香味的混合物涂抹在你的肉棒上。" + (int(get_player().cocks.length) > 1 ? "她小心翼翼地没有忽视你其他的" + (int(get_player().cocks.length) > 2 ? "肉棒" : "肉棒") + "，将它们挤在一起，并急切地按摩它们" + (int(get_player().cocks.length) > 2 ? "全部" : "两个") + "。" : "") + "她的呼吸变得沉重而不规律，似乎只需要轻轻推一把，就能让她达到高潮。[pg]");
         outputText("[say:我要……要……]她在喘息和在你怀里挣扎之间结结巴巴地说。你轻轻咬住她的耳朵打断了她，并咬紧牙关嘟囔着，禁止她在你之前高潮。[pg]");
         outputText("她对你的宣言做出了回应，身体颤抖着，眼睛翻白，显然她把每一分意志力都投入到了服从你的命令中。然而，很明显她坚持不了多久了，她似乎也痛苦地意识到了这一点，拼命地加倍努力让你释放，以便你能允许她释放。[pg]");
         outputText("这可能对她有回报，因为你感觉到腹股沟开始积聚高潮的紧张感，[eachCock]肿胀着准备爆发。感觉到你即将到来的高潮，她开始比以往任何时候都更加疯狂地抚摸，她的手臂变成了一团肉色的模糊影子。很难说谁先高潮，精液和淫液同样在空中飞舞，她用高潮的喷射浸透了你的下半身，精液的喷泉溅到了她的肚子上。");
         if(get_player().cumQ() <= 150)
         {
            outputText("当她继续快速地在你不由自主抽搐的肉棒上下套弄时，黏稠的精液丝线溅到了她的胸前，将滚烫的精液四处乱甩。绝大部分精液落在了她的腹部，给她涂上了一层黏糊糊的精液网，而剩下的则将森林的地面染成了白色。结束时，她疲惫地喘着粗气，软绵绵地躺在你的怀里，同时慢慢地将沾满精液的手举到嘴边，用舌头仔细地舔干净。[pg]");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("当她继续快速地在你不由自主抽搐的肉棒上下套弄时，滚烫的精液如彩带般溅到了她的身上，导致你大量的精液在空中四处飞溅。大部分精液落在了她的肚子上，几股迷失方向的精液涂抹在她的乳房上，而剩下的则将森林的地面染成了白色。当她疲惫地向后躺下，疲惫的双臂变得软绵绵时，浓稠的精液珠顺着她的胸膛滚落。她虚弱地将手举到嘴边，舔得干干净净，仔细地舔舐着每一滴，然后平静下来，大口喘着粗气。[pg]");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("当她继续快速地在你不由自主抽搐的肉棒上下套弄时，浓稠的精液如彩带般溅到了她的胸前，将你惊人的精液四处飞溅。当几股迷失方向的精液落在她的脸上时，她微微皱了皱眉，绝大部分精液溅到了她的胸部和肚子上。她的整个前胸都涂满了一层厚厚的精液，晶莹剔透的精液珍珠从她的脸颊滴落，落到她的胸部，顺着她的肚子流下。她疲惫地靠在你身上，软绵绵地将手举到唇边，用舌头仔细地舔干净。她满足地叹了口气，最后一次抬头看着你，仿佛在寻求你的认可，你高潮的残余仍然明显地留在她的脸上。[pg]");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("当她继续快速地在你不由自主抽搐的肉棒上下套弄时，滚烫的精液如丝带般溅到了她的胸前，冲上她的乳房，溅到她的脸上，将你那可怕的精液四处飞溅到空中。当你的精液如瀑布般倾泻在她的脸上时，她紧紧地闭上眼睛，在她的脸颊上涂抹着闪亮的白色条纹，顺着她的下巴滴落，并大声地滑落到她的胸部和肚子上。她的手继续在你的肉棒上套弄，直到最后一滴精液顺着肉棒滚落到她的手上，她终于疲惫地靠在你身上放松下来，大口喘着粗气。她虚弱地举起双臂，用舌头舔干净双手，但脸上的厚厚精液却原封不动，带着满足的微笑抬头看着你。[pg]");
         }
         else
         {
            outputText("当她继续快速地在你不由自主抽搐的肉棒上下套弄时，浓稠的精液柱撞击着她的胸膛，将非人数量的精液溅到她的乳房和脸上，将你那可怕的精液四处飞溅到空中。当你的精液如雨点般落在她身上时，她紧紧地闭上眼睛，用一层珍珠般的精液涂满她的全身，精液成片地从她身上滚落。她的手继续在你的肉棒上套弄，直到她从你的尿道中挤出最后一滴精液，伴随着最后一次浓稠的喷射，她终于疲惫地靠在你身上放松下来，大口喘着粗气。她试图举起软绵绵、疲惫的双臂来清理它们，但未能鼓起必要的力气，脸上的厚厚精液原封不动，带着满足的微笑抬头看着你。[pg]");
         }
         outputText("最后，她闭上眼睛，将头靠在你的肩膀上，已经失去了知觉，对你继续的抚摸只有轻微的颤抖。你需要返回营地几乎是一种遗憾，因为你毫不怀疑，如果你给她机会，她可能会蜷缩在你的腿上睡觉。你把她放在草地上，然后清理干净自己，再往回走。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(3));
         get_combat().cleanupAfterCombat();
      }
      
      public function nonFutaRedHeadBondageIGuessYouTieHerUpWithYourPenisThenHuh() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("当你靠近你倒下的猎物时，她似乎对自己的命运相当顺从。她象征性地试图逃跑，但当你的手触碰到她的一条深红色尾巴时，她就平躺下来，翻滚着表示屈服。你低低地趴在她身上，按住她的臀部，指尖划过她的脸颊，轻轻地揉乱她的头发，戏弄着她的耳垂。她的耳朵轻轻地弹了一下，然后平贴在头的两侧，脸上泛起明亮的粉红色红晕。[pg]");
         outputText("[say:我-我们要做什么-][pg]");
         outputText("你把一根手指放在她的唇上让她安静下来，她顺从地点点头，把头偏向一侧，向你露出光洁的脖子以示屈服。你带着坏笑接受了她的提议，俯下身将牙齿压入她光滑的皮肤，引得女孩发出一声颤抖的呻吟。当你把嘴唇移开时，它似乎在她的喉咙里卡了一下，伴随着一声微弱的呜咽逃了出来，一条细细的唾液线连接着你的嘴和她的脖子。[pg]");
         outputText("她完全解除了武装，在你开始有条不紊地脱下她的衣服时，她在你身下颤抖着，把她的手臂从长袍里抽出来，让丝滑的布料顺着她的身体滑落到她的脚踝处成一堆。她对你温柔地戏弄她赤裸的身体做出了一点抽搐的反应，只需稍微哄一下，她就轻松地翻滚到肚子上。[pg]");
         outputText("你的手掌顺着她的后腰滑下，轻轻地描绘着她异国情调的纹身边缘，向着她那束奢华的尾巴走去。当你的手指刷过它们底部的短毛时，一阵颤栗顺着她的脊椎蔓延开来，当你用指尖顺着它们扭曲的长度向上滑动时，颤栗只会加剧。你把手掌卷在一条尾巴上，慢慢地抚摸它，把它推下去平放在她的背上。每一次触摸和抚摸都会带来更大的快感，剩下的五条尾巴在空中扭动和抽搐。[pg]");
         outputText("你把手伸进她脚边的衣服堆里，拉出曾经用来系紧她长袍的布带，在你的双手之间拉紧，当你看到布料像鞭子一样啪啪作响时，你得意地笑了。你迅速而小心地将布带绕在她的手腕上，将她的尾巴一次一条地穿过它，最后用一个装饰性的蝴蝶结系紧，退后一步欣赏你的作品。令人惊讶的是，她丝毫没有反抗，当你看着她试探性地挣扎着挣脱束缚时，她欣喜若狂的表情更能说明问题。每次她拉扯手腕时，她的尾巴都会被拉紧，当敏感的线圈在缎面绑带上抽打时，她会发出愉悦的呻吟。尽管她平时总是虚张声势，但这个喧闹的红发女郎似乎有受虐倾向。[pg]");
         outputText("出于好奇，你伸出手，像拨动竖琴的琴弦一样拨动她的一条尾巴，发现它发出了一种不同种类的美妙旋律。即使是最轻微的触摸也会引起被绑住的美女发出愉悦的嚎叫和呻吟，空气中弥漫着令人愉悦的狂喜交响乐。带着恶作剧的坏笑" + (get_player().get_str() < 50 ? "并且有点困难，你" : "，你") + (get_player().get_str() < 25 ? "拖着" : "抱着") + "她走到附近的一棵树旁，在一个合适的高度找到了一根树枝。" + (get_player().get_str() < 50 ? "你稍微咕哝了一下，" : "你") + "把她吊起来，挂在树枝上，听着树枝嘎吱作响，等着看它是否会在重压下折断。过了一会儿，它似乎支撑得很好，为了测试它，你在女孩的屁股上狠狠地拍了一巴掌，听着她在前后摇摆时发出令人兴奋的羞耻叫声。[pg]");
         outputText("树枝依然坚固稳定，只是在她不舒服地移动时稍微弹跳了一下，一条口水从她张开的嘴里滴落，而女性的汁液则不断地从她湿透的小穴中滴落。当她轻轻地呜咽时，她星形纹身下颤抖的肉慢慢变成了愤怒的红色，她的眼睛因快感而变得呆滞。当你用手抚摸她曲线优美的屁股表面时，你打赌你可以把一颗宝石从上面弹开" + (get_silly() ? "并决定就这样做。你把手伸进包里，拿出一颗宝石，把它弹到装饰在她右脸颊上的星星中心。正如你所怀疑的那样，它从她匀称的屁股上轻快地弹开，你在空中接住了它，看着她的屁股非常壮观地抖动" : "") + "。[pg]");
         outputText("在决定这已经足够前戏后，你漫不经心地脱下你的[armor]，滑到她身后，将[eachCock]放在她颤抖的臀部之间。你握住她的臀部，开始在像山一样的脸颊之间来回摩擦，当她的尾巴被她悬挂的布带拉扯时，她发出的轻柔呻吟让你感到高兴。你毫不浪费时间，将[cock biggest]的尖端压在她流着口水的裂缝上，当你向前移动时，紧紧地挤压她的臀部。当它滑过她的入口时，她高兴地喘着粗气，她光滑的肉壁吞没了你的肉棒，因为你" + (get_player().biggestCockArea() > 70 ? "惊人地设法" : "") + "滑入每一英寸。你花了一点时间真正品味她内部肌肉收缩和挤压你跳动的肉棒的方式，感觉她湿滑的肉壁在长度上性感地起伏。你大声呻吟着，开始挺动你的臀部，将你的骨盆压在她柔软的屁股上，让它随着每一次推力而起伏。[pg]");
         outputText("你一次又一次地用你的[cock biggest]猛击她可怜的小穴，带着发情动物般狂热的热情将你的臀部拍打进她的屁股。树枝在重压下嘎吱作响，但当你用跳动的肉棒残忍地猛击她的小穴时，它继续将她高高举起。在一个流畅的动作中，你突然从她抽搐的小穴中抽出你抽搐的肉棒，向前猛击以刺穿她的屁眼，轻松地滑过她的肛门。每次你向前冲刺时，她都会发出一声愉悦的呻吟，直到你深深地埋入她温暖、紧致的屁股里。[pg]");
         outputText("你陷入了疯狂的挺动中，有力地将你的臀部压在她的臀部上。没过几次推力，她的屁股就被你疯狂的攻击弄松了，她肛门的肌肉环拼命地试图抓住你不断移动的肉棒，但却找不到着力点。当你最后一次向前猛击你的臀部，然后换回她湿滑的小穴，再次深深地埋入她小穴潮湿的深处时，她高兴地嚎叫起来。[pg]");
         outputText("你进入了节奏，轮流猛击她的每一个洞一两分钟，然后换到另一个洞，每次新的插入都会迫使她喉咙里发出一声新的呻吟。在你虐待的过程中，她脸上的深红色红晕稳步加深，很明显她坚持不了多久了。至少对她来说幸运的是，你也是如此，因为你感觉到快感已经达到了你忍受的极限。[pg]");
         if(get_player().cumQ() <= 150)
         {
            outputText("当你终于被推过边缘时，你深深地埋入她的小穴，" + (get_player().balls > 0 ? "直到蛋蛋" : "直到臀部") + "，你张开嘴，发出一声隆隆的呻吟，从头到脚震撼着你的身体。在你后退之前的那一刻，一根根充满活力的精液射入她的子宫，将你的[cock biggest]放在她宽阔的屁股上，用你滚烫的精液沐浴她的背部。仿佛在暗示，当第一股精液落下时，她的小穴开始抽搐，向你的前胸喷射出粘稠的淫液。当她停止挣扎时，她看起来相当壮观，清澈的液体不断顺着她的大腿滴落，你的精液在她的背上涂抹了薄薄的一层。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("当你终于翻过边缘时，你的肉棒深深地埋在她小穴火热的范围内，" + (get_player().balls > 0 ? "直到蛋蛋" : "直到臀部") + "，一声隆隆的呻吟从头到脚震撼着你。在你后退之前的那一刻，浓稠、充满活力的精液如丝带般溅到她子宫的内壁上，将你抽搐的[cock biggest]放在她宽阔的屁股上，用你滚烫的精液沐浴她的背部。仿佛在暗示，当第一股精液落下时，她的小穴开始抽搐，向你的前胸喷射出粘稠的淫液。当她停止挣扎时，她看起来相当乱，清澈的液体不断顺着她的大腿滴落，几团浓稠的精液从她的背上滑落。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("当你终于跌落快感的悬崖时，你的肉棒已经" + (get_player().balls > 0 ? "连根" : "齐根") + "埋入了她颤抖的小穴中，一阵低沉的呻吟让你从头到脚都在颤抖。在你拔出之前，浓稠而充满活力的精液涌入她的子宫，随后你将抽搐的[cock biggest]搭在她宽阔的臀部上，用滚烫的精液彻底浸透她的后背。仿佛是排练好的一样，第一股精液落下的瞬间，她的小穴开始抽搐，向你的身前喷射出粘稠的淫液。当她停止挣扎时，她看起来相当狼狈，清澈的液体不断顺着她的大腿滴落，浓稠的精液块从她的背上滑落。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("当你终于跌落快感的悬崖时，你的肉棒已经" + (get_player().balls > 0 ? "连根" : "齐根") + "埋入了她颤抖的小穴中，一阵低沉的呻吟让你从头到脚都在颤抖。在你拔出之前，浓稠而充满活力的精液涌入她的子宫，惊人的射精量暂时撑起了她的肚子。当你从她被精液浸透的小穴中抽出肉棒时，精液又涌了出来，你将抽搐的[cock biggest]搭在她宽阔的臀部上，用剩余的滚烫精液彻底涂满她的后背。仿佛是排练好的一样，第一股精液落下的瞬间，她的小穴开始抽搐，向你的身前喷射出粘稠的淫液。当她停止挣扎时，她看起来相当狼狈，清澈的液体不断顺着她的大腿滴落，成片的精液块从她的背上滑落。");
         }
         else
         {
            outputText("当你终于跌落快感的悬崖时，你的肉棒已经" + (get_player().balls > 0 ? "连根" : "齐根") + "埋入了她颤抖的小穴中，一阵低沉的呻吟让你从头到脚都在颤抖。在你拔出之前，浓稠而充满活力的精液猛烈地涌入她的子宫，惊人的射精量撑起了她的肚子。当你从她被精液浸透的小穴中抽出肉棒时，一半的精液又涌了出来，你将抽搐的[cock biggest]搭在她宽阔的臀部上，用剩余的巨量精液彻底涂满她的后背。仿佛是排练好的一样，第一股精液落下的瞬间，她的小穴开始抽搐，向你的身前喷射出粘稠的淫液。当她停止挣扎时，她看起来相当狼狈，清澈的液体不断顺着她的大腿滴落，你的精液成片地从她的背上滑落，在地上溅成一滩。");
         }
         outputText("[pg]她沉浸在无尽的极乐中，身体前后摇晃，滴落着你滚烫的精液，发出阵阵呻吟。沉重的眼皮下，她的眼睛只剩下一丝翠绿的缝隙，舌头慵懒地伸出，无助地挂在束缚中享受着快感。" + (get_player().cor > 50 ? "你微微冷笑，带着居高临下的态度在迷糊的狐妖屁股上拍了一巴掌，引得她发出一声迷乱的呻吟。当你收拾好东西准备返回营地时，她依然挂在高高的树枝上。" : "你小心翼翼地把她从树上放下来，让她侧躺在树根旁。你像盖毯子一样把她的长袍盖在她赤裸的身体上，在她入睡时轻轻拍了拍她的头，然后转身返回营地。"));
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function meditateLikeAKitsuneEhQuestionMark() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:* = null as String;
         clearOutput();
         registerTag("incamp",TagFun_Impl_.fromBool(saveContent.statueLocation != ""));
         outputText("你[if (incamp) {[if (isbiped) {坐在[if (builtchair) {椅子上|地板上}]|站着}]|小心翼翼地坐在一个小垫子上}]，面对着[if (incamp) {雕像|神龛}]，清空了思绪。闭上眼睛，你冥想着迄今为止在旅途中学到的东西，并决心继续与弥漫在这片土地上的腐化力量作斗争。[pg]");
         if(get_player().hasItem(get_consumables().FOXJEWL) && get_player().tail.type == 13 && get_player().tail.venom < 9 && get_player().tail.venom + 1 <= get_player().level && get_player().tail.venom + 1 <= get_player().get_inte() / 10 && get_player().ears.type == 9 && (!get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().perkv4(PerkLib.CorruptedNinetails) > 0) && (!get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().perkv4(PerkLib.EnlightenedNinetails) > 0) && saveContent.statueLocation == "")
         {
            outputText("在冥想即将结束时，你莫名其妙地被迫把手伸进包里，拿出你带着的泪滴状小宝石。当你凝视着珠子半透明的表面，看着里面跳动的火焰时，宝石开始在你的手中溶解，里面苍白的火焰溢出并蔓延到你的全身。[pg]");
            if(get_player().tail.venom < 8)
            {
               outputText("坐在无声的冥想中，你任由火焰洗刷着你，并开始感到有些……顿悟。你毛茸茸的尾巴开始发出诡异幽灵般的光芒，伴随着电能的噼啪声，分裂成了 " + (get_player().tail.venom + 1) + " 条！");
               var _temp_1:* = get_player().tail;
               _temp_1.venom = _temp_1.venom + 1;
            }
            else
            {
               outputText("当神秘的火焰冲刷着你时，你的大脑受到了超凡脱俗的知识和力量的漩涡的冲击。有那么一瞬间，你感觉自己的大脑要被撕裂了，但你已经准备好了。你的旅行和冥想已经让你做好了充分的准备，你敞开心扉接受启迪。[pg]");
               outputText("你那毛茸茸的尾巴开始闪烁着诡异的幽光，伴随着电能的噼啪声，分裂成了九条尾巴。<b>你现在是一只九尾狐了！无法估量的宇宙力量从你的身体中散发出来！请明智地使用它……</b>");
               get_player().tail.venom = 9;
               get_player().createPerkIfNotHasPerk(PerkLib.EnlightenedNinetails,0,0,0,0);
               if(!Boolean(ColorLists.ELDER_KITSUNE.contains(get_player().hair.color)))
               {
                  if(get_player().hasFur() && Boolean(ColorLists.ELDER_KITSUNE.contains(get_player().skin.furColor)))
                  {
                     get_player().hair.color = get_player().skin.furColor;
                     if(get_player().hair.length > 0)
                     {
                        outputText("[pg]现在你的头发变成了与皮毛相配的[haircolor]，就像真正的狐妖长老一样。你看起来真的很有王者风范！");
                     }
                  }
                  else if(get_player().hasFur())
                  {
                     _loc1_ = ColorLists.ELDER_KITSUNE;
                     _loc2_ = _loc1_[Utils.rand(int(_loc1_.length))];
                     get_player().hair.color = _loc2_;
                     get_player().skin.furColor = get_player().hair.color;
                     if(get_player().hair.length > 0)
                     {
                        outputText("\n现在你的皮毛和头发都变成了[haircolor]，就像真正的狐妖长老一样。你看起来真的很有王者风范！");
                     }
                     else
                     {
                        outputText("\n现在你的皮毛变成了[furcolor]，就像真正的狐妖长老一样。你看起来真的很有王者风范！");
                     }
                  }
                  else
                  {
                     _loc1_ = ColorLists.ELDER_KITSUNE;
                     _loc2_ = _loc1_[Utils.rand(int(_loc1_.length))];
                     get_player().hair.color = _loc2_;
                     get_player().skin.furColor = get_player().hair.color;
                     if(get_player().hair.length > 0)
                     {
                        outputText("\n现在你的头发变成了[haircolor]，就像真正的狐妖长老一样。你看起来真的很有王者风范！");
                     }
                  }
               }
               else if(get_player().hasFur() && !Boolean(ColorLists.ELDER_KITSUNE.contains(get_player().skin.furColor)))
               {
                  get_player().skin.furColor = get_player().hair.color;
                  outputText("\n现在你的皮毛变成了与头发相配的[furcolor]，就像真正的狐妖长老一样。你看起来真的很有王者风范！");
               }
               outputText("[pg]你停顿了片刻，回味着新获得的智慧，带着对任务重燃的活力，你站起身，向营地出发。");
               dynStats(DynStat.Inte(2),DynStat.Lust(-20),DynStat.Cor(-2));
            }
            get_player().consumeItem(get_consumables().FOXJEWL);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你小心翼翼地在神龛前的一个小垫子上坐下，清空思绪。闭上眼睛，你冥想着在旅途中学到的东西，并下定决心继续对抗弥漫在这片土地上的腐化力量。当你再次睁开眼睛时，你感觉仿佛肩上的重担被卸下了。");
            outputText("[pg]带着对任务重燃的活力，你[if (incamp) {[if (isbiped) {站起身，}]开始你[if (hours < 21) {白天|晚上}]的活动|站起身，向营地出发}]。");
            if(saveContent.statueLocation == "")
            {
               dynStats(DynStat.Inte(1),DynStat.Lust(-20),DynStat.Cor(-2));
            }
            else if(saveContent.statueDay != get_time().days)
            {
               dynStats(DynStat.Inte(0.5),DynStat.Lust(-10));
               saveContent.statueDay = get_time().days;
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function mansionBadEnd() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你猛地惊醒，从床上弹了起来，美梦戛然而止。你浑身被冷汗浸透，一种莫名的恐惧感让你惊慌失措，大口喘着粗气。当你环顾四周时，这种恐惧感变得更加强烈。有那么一瞬间，你以为自己回到了英格纳姆，但陌生的环境立刻打消了这个念头。然而，你也不在营地的[bed]上。伴随着颅骨中痛苦的跳动，你逐渐拼凑起昨晚发生的事情。");
         outputText("[pg]这个认知如同当头一棒，你立刻" + (get_player().isBiped() ? "跳了起来" : "采取行动") + "，从舒适的床上跃起。你的[armor]不见了，取而代之的是用上等丝绸织成的异国长袍。更糟的是，你手无寸铁！宿醉让你还有些头晕目眩，你跌跌撞撞地走到走廊上，想在豪宅神秘的主人发现你逃跑之前找到出路。[pg]");
         outputText("你的肌肉因为昨晚的活动而充满了疲惫和酸痛，感觉就像肩膀上扛着一个装满铅块的背包。在你昏过去之后，她们三个到底干了多久？从你臀部传来的阵阵刺痛来看，感觉她们一定是一直干到了天亮。[pg]");
         outputText("你在庄园蜿蜒的走廊里徘徊了感觉有几个世纪那么久，寻找着任何出口的迹象。终于，你发现自己来到了一个熟悉的区域，隐约记得在去姐妹们为你准备的宴会的路上经过了这个房间。直到现在，你才真正意识到接受这三个捣蛋鬼的食物是一个多么愚蠢的决定。[pg]");
         outputText("逃跑的希望就在眼前，当你转过拐角时，前门进入了视线。当你径直冲向出口时，走廊似乎无限延伸，门却始终没有靠近。当你的逃跑希望被短短几个字粉碎时，一种下沉的感觉进入了你的胃底。[pg]");
         outputText("[say: 这么快就要走了吗，亲爱的？][pg]");
         outputText("你转过身，面对着庄园的三位女主人，她们手里拿着食物和饮料，向你招手。虽然她们的表情天真而快活，但当她们慢慢向你逼近时，却带着一种恶毒的气息。[pg]");
         outputText("[say: 你就不能再多留一晚吗？你可以让你疲惫的骨头休息一下，尽情地喝……][pg]");
         outputText("你拒绝了她们的提议，不断地向门口退去。当她们离你只有一臂之遥时，你试图逃跑，在原地转了一圈，疯狂地冲向门口——但唉，你注定失败的逃跑尝试以惨败告终。你刚转过身，就再次面对她们，而这次她们挡住了你的去路。[pg]");
         outputText("[say: 求你了，做我们的客人吧……这里就我们三个，太寂寞了……][pg]");
         outputText("你把谨慎抛到九霄云外，冲向她们，推开她们，冲过门，让你的肺里充满自由的新鲜空气。然而，门另一边的景象却让你的心沉了下去，因为你发现的不是庭院开阔的空气，而是另一段走廊，与你刚刚离开的那段一模一样。在门槛外迎接你的是那三只狐妖，她们的嘴唇抿着一模一样的假笑。[pg]");
         outputText("当她们围拢过来时，你能感觉到脑海中的光芒一盏接一盏地熄灭。蔚蓝色的火焰在房间里盘旋，将你困在催眠的魔咒中。你慢慢瘫倒在地，被狐妖的巫术彻底迷住了。[pg]");
         outputText("[say:你会留下来的，对吧？]金发狐妖说着，将手托在你的下巴上，轻轻地将你的头向后仰，让你仰视她的眼睛。当你感觉自己被拉入那两潭碧绿的深渊时，你听到有人在表示同意，却发现那声音竟是你自己的。[pg]");
         outputText("你拼尽全力紧紧抓住脑海中最后的一丝清明，但无济于事。你的大脑仍然被昨晚喝下的烈酒搅得浑浊不堪，屈服于这三位女巫的催眠力量。十八条毛茸茸的尾巴卷住你，将你拉入一个温暖、平静的拥抱中。在仅存的自由意志被永远熄灭之前，你只来得及感觉到一种冰凉的刺痛感蔓延全身。");
         doNext(kitSuneMansionBadEndII);
      }
      
      public function mansion(param1:Boolean, param2:Boolean = false) : void
      {
         var willing1:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         kitsuneSprite();
         if(param1)
         {
            if(!param2)
            {
               outputText("好奇心和欲望战胜了你，你决定把谨慎抛到九霄云外，接受她的提议。如果她的姐妹们有她一半迷人，那你肯定会大饱眼福。她似乎对你的决定很满意，用一条尾巴挑逗着你的下巴，示意你跟她走。[pg]");
            }
            outputText("她带着你往森林深处越走越远，没过多久夜幕就降临了。幸好你的向导召唤出了几团苍白的火焰为你照亮前路。当你凝视着火光范围之外的黑暗时，你意识到现在改变主意已经太迟了——即使你想回头，你也肯定会迷路。[pg]");
            outputText("妖狐停了一会儿，转过身来面对你，然后伴随着少女般的咯咯笑声消失在灌木丛中。你短暂地担心她把你抛弃在荒野中，但当你跟着她穿过那片未被驯服的树篱的另一边时，你几乎一头撞在一堵巨大的石墙上。在你面前矗立着一座宏伟的宅邸，四周被令人印象深刻的围墙环绕。你短暂地想知道是什么样的疯子会在荒郊野外建造如此奢华的家，但当你看到妖狐从大门探出头来，向你调情地挥手时，你从沉思中惊醒。[pg]");
         }
         else
         {
            outputText("火焰的催眠力量迫使你跟着它走了几个小时，在森林中迷迷糊糊地蹒跚而行。头顶的天空已经变暗，尽管你身体的每一个细胞都希望你抵抗这鬼火的诱惑，但你的身体却根本不听使唤。你只隐约感觉到自己跨过了一扇巨大的木门，感觉自己就像是一个在身体之外的观察者。一座宏伟的宅邸出现在你面前，你残存的理智短暂地想知道是什么样的疯子会在荒郊野外建造如此奢华的住所。[pg]");
         }
         outputText("[saystart]欢迎");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) > 0)
         {
            outputText("回来");
         }
         outputText("，[sayend]当你进入庭院时，你听到了这句话，让你稍微吃了一惊。在宅邸门口迎接你的是");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) > 0)
         {
            outputText("那熟悉的三姐妹妖狐。");
         }
         else
         {
            outputText("三位可爱的少女——");
            if(param1)
            {
               outputText("包括带你来这里的那个，");
            }
            outputText("一个金发，一个红发，还有一个有着如丝般柔滑的黑发。她们暴露的长袍在所有该丰满的地方都撑得满满的，紧贴着她们迷人的曲线。她们每个人都长着一对大大的狐狸耳朵和一簇奢华柔软的尾巴，正催眠般地挥舞着。");
         }
         if(param1)
         {
            outputText("[pg][say: 我们一直在等你，]金发的那个说道，带着调情的笑容走上前来。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,626) > 0)
         {
            if(get_player().get_fatigue100() < 70)
            {
               outputText("[pg][say: 我们都很高兴你决定再来看我们！]");
            }
            else
            {
               outputText("[pg][say: 你知道，如果你一直这样回来，我们可能就不得不把你留下了……]");
            }
         }
         else
         {
            outputText("[pg][say: 我很高兴你决定跟我来……]");
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,626,FlagDict_Impl_.arrayReadInt(_loc3_,626) + 1);
         outputText("[pg]");
         outputText("三位女士围拢在你身边，双手在你的身体上游走，轻轻地咯咯笑着。你发现自己几乎漂浮在她们众多的尾巴中，沉醉在她们带领你穿过门厅时所承诺的欢愉中。她们让你在一张摆满极其丰盛食物的长桌前坐下，没过多久，你就在尽情享用你做梦都不敢想的美味佳肴。[pg]");
         outputText("你的杯子从来不会空太久，因为其中一个姐妹总是很快就会拿着一瓶新的酒过来。烈酒下肚时灼烧着你的喉咙，没过多久你的头就开始晕乎乎的了。你现在已经醉得连女孩们把你带出餐厅都没察觉到，直到你感觉到自己被拉进一个温暖的水池里，才注意到周围环境的变化。[pg]");
         menu();
         _g = this;
         willing1 = param1;
         addButton(0,"继续",function():void
         {
            _g.nonTentaclePCMansion(willing1);
         });
      }
      
      public function loseToKitsunesWithBallsAndHighCumQ() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("被彻底击败后，你倒在地上，在最后短暂的抵抗中支撑起自己。当你颓然倒下时，狐狸女孩欢快地跳到你俯卧的身体旁，稍作停顿，弯下腰在你的额头上留下一个居高临下的吻。她抓住你的腋下，将你的身体拖向一根倒下的圆木" + (get_player().get_tallness() > 96 ? "，当她最终将你半昏迷的身体拖到位时，她的脸因为用力而变得通红" : (get_player().get_tallness() > 60 ? "，毫不掩饰地因为用力而发出咕哝声" : "")) + "。[pg]");
         outputText("[say: 让我们来看看……]她小声地自言自语，将手滑入你的[armor]下，[say: 我们这里有什么……][pg]");
         outputText("当她的指尖滑过你的[balls]，给它们一个坚定而温柔的挤压时，她娇羞的笑容变成了惊喜。她舔了舔嘴唇，眼中闪烁着饥渴的光芒，急切地脱下你的[armor]，举起你的[cock biggest]并微微弯曲它，仿佛在检查它。她俯下身，脸靠近你的睾丸，伴随着一声长长的叹息，贪婪地吸吮着它们的气味。[pg]");
         outputText("[say: 闻起来你好像在酝酿一根粗大的……]她咯咯笑着说，轻轻地舔着" + (get_player().hasSheath() ? "包皮" : "根部") + "。六条漆黑的尾巴滑出来绑住你的四肢，将你的手腕扭到背后。[say: 让我们看看能不能帮它一把……][pg]");
         outputText("她打了个响指，蓝色的火花从她的指尖迸发出来，点燃成一团在她手上跳跃的纤细的蔚蓝色火焰。[pg]");
         outputText("当她将手掌压在你的睾丸上时，你试图抑制呻吟却失败了，随着阴囊收紧，一阵强烈的刺痛感爬过你的阴囊。你腹股沟的紧张感稳步增加，随着你阴囊的肉变得紧绷，你意识到她的魔法正导致你的睾丸因为精液而物理性地膨胀！[pg]");
         outputText("她用双手紧紧握住你的[cock biggest]，紧紧挤压根部，同时用力抚摸阴茎干，直到它完全勃起。带着戏谑的微笑，她用手捧住你的[cockHead biggest]并向里面吹气。蔚蓝色的火焰顺着你的长度倾泻而下，让你不由自主地弓起背，向上挺起臀部，因为冰凉的快感蔓延过你的腹股沟。[pg]");
         outputText("她对你颤抖的呻吟和绝望的挣扎咯咯地笑，把你的臀部推回去，压低身体，用手肘把你钉在原地。她柔软丰满的乳房滑过你的[cock biggest]" + (get_player().cocks[get_player().biggestCockIndex()].cockLength > 8 ? "，同时她尽情地舔舐暴露的部分，用她大得不可思议的舌头包裹住它，并以紧密的螺旋状挤压。" : "，她低下头，用丰满的嘴唇包裹住龟头，用她大得不可思议的舌头尽情地舔舐下侧。") + "当她为你口交时，她颤动的臀部欢快地左右摇摆" + (get_player().biggestCockArea() > 70 ? "，尽可能深地吞下，让你过大的阴茎塞满她的喉咙，伴随着一声呻吟。" : "，嘴唇紧紧贴在你的腹股沟上，吸吮着你的预精液，嘴角扬起一抹绝妙的笑容。") + "[pg]");
         outputText("她向后退去，她丰满的嘴唇停留在你阴茎的[cockHead biggest]后面，她盘绕的舌头慢慢地缩回嘴里。舌尖轻轻地戳着你的尿道，由此产生的感觉让你剧烈地颤抖。她将一只手臂绕在乳房下方，将肩膀并拢，将你紧紧地挤压在她的乳沟里。与此同时，她的另一只手滑到你肿胀的睾丸下方，指尖在紧绷的肌肤上优雅地跳舞。[pg]");
         outputText("[say: 嗯，感觉怎么样？]她逗弄着你，伴随着一声湿润的吸溜声，她再次俯身含住你的肉棒，用喉咙口爱抚着龟头。[pg]");
         outputText("她的睫毛轻轻颤动，一边用手指轻轻捏揉着乳头，一边顺着你的肉棒发出一声低吟。当你感觉到她的指尖顺着你阴囊敏感的缝隙滑下时，你也同样发出了呻吟，淡蓝色的火花在上面噼啪作响，引出更大的快感。她的手指继续在你的蛋蛋上游走，留下一串幽灵般的火焰，在舔舐你的肌肤时不断地引起刺痛。过了一会儿，她改用手掌捧住它们，轻轻地揉搓着，仿佛只要这样做就能刺激它们产生更多的精液。[pg]");
         outputText("她的另一只手臂不再将乳房压在你的肉棒上，她换到了一个更低的位置，让你的[cock biggest]搭在她的脸上，同时将鼻子埋在你的蛋蛋之间。当她抬头看着你时，绿色的眼睛在你的肉棒两侧闪烁，她高耸的脸颊暴露了被你肿胀的睾丸遮挡的娇羞笑容。她张大嘴巴，用柔软粉嫩的嘴唇爱抚着它们，而她滑溜的舌头则卷在它们下面，轻轻起伏着按摩它们。[pg]");
         outputText("仿佛是为了展示她高超的舌技，她让双手在你的下半身自由游走，同时继续用舌头弹跳和挤压你的蛋蛋。" + (get_player().get_gender() == 3 ? "舌尖蜿蜒而下，紧贴着你蛋蛋的弧度，然后开始试探性地戳弄你的[vagina]，轻轻弹拨你的阴蒂。" : "") + "当你感觉到她的食指在你的[asshole]周围戳弄时，快感变成了惊讶，在你还没来得及抗议之前，她就把手指深深地埋进了你的体内。突如其来的入侵让你的肉棒弯曲，静脉在皮肤表面凸起，作为回应，它微微肿胀起来。[pg]");
         outputText("那根扭动的手指找到了你的前列腺，毫不犹豫地开始工作，从里面摩擦着你，同时她把注意力集中在你的蛋蛋上。她空闲的手在你的肉棒上滑上滑下，偶尔停下来深情地蹭蹭下面，用脸颊摩擦着它。所有这些因素的结合足以让你在几分钟内达到高潮的边缘，她熟练的舔舐和抚摸让你达到了难以置信的快感巅峰。就在你即将释放的时候，她的手像老虎钳一样死死掐住你的肉棒根部，阻断了水流。[pg]");
         outputText("[say: 调皮调皮，想射在我的嘴外面，]她带着戏谑的笑容责备你，保持着对你肉棒的抓握，同时向后拉，改变了姿势。她的指尖划过你敏感的肉棒边缘，最轻微的触碰就足以让你在快感中发狂。当你挣扎着试图挣脱她的抓握时，她警告性地摇了摇手指，张开嘴巴指着里面强调她的观点。[pg]");
         outputText("当她把沉重的屁股重重地坐在你的胸膛上，把你的肺里的空气都挤出来时，你的挣扎就停止了。至少，你能清楚地看到她那丰满、摇晃的屁股，右半边屁股上印着一个巨大的太阳形状的纹身。这是在世界变成五彩斑斓的快感模糊之前你看到的最后一件事——狐妖丰满的嘴唇再次包裹住你肿胀的龟头，她舌头滑过龟头的感觉被放大到了近乎痛苦的程度。[pg]");
         outputText("考虑到你绝望的状态，狐妖似乎终于准备好让你用浓稠的精液填满她了……尽管看起来她似乎还有些调戏的冲动没有发泄完。她的抓握一次松开一根手指，从粉红色的手指开始，然后是无名指，然后是中指。她的拇指和食指形成的紧密圆环保持了令人痛苦的漫长时间，最后，它终于松开了，让你乳白色的精液冲进她等待的喉咙里。[pg]");
         if(get_player().cumQ() <= 2500)
         {
            outputText("当第一股咸咸的精液打在她的喉咙上时，她开始在狂喜中呻吟，双手轻柔地捧着你的蛋蛋。她的嘴唇紧紧地贴着你的肉棒，舌头在嘴里来回旋转，收集你浓稠的精液并将其漏斗状地送入她的食道。被贪婪的欲望所克服，她把你的肉棒拉进喉咙深处，一边按摩你的[balls]，一边把它们吸干。即使在她的胃开始扩张，随着你翻滚的精液而肿胀之后，她继续吸下每一股新的精液。随着你爆炸性的高潮开始减缓，她开始按摩你肉棒的两侧，挤出最后几滴精液。她的舌头最后一次卷住你的长度，用力吸吮，带着极大的修饰吸干最后一滴。[pg]");
            outputText("[say: 嗯，不错……非常不错。对于一个凡人来说，]她调侃道，坐在你的胸前，心满意足地揉着她鼓胀的肚子。[pg]");
         }
         else if(get_player().cumQ() <= 6000)
         {
            outputText("当你的第一股浓稠精液开始流入她的喉咙时，她深深地呻吟着，双手轻柔地捧着你的蛋蛋。她的嘴唇紧紧地贴着你的肉棒，舌头在嘴里来回旋转，收集你浓稠的精液并将其漏斗状地送入她的食道。被贪婪的欲望所克服，她把你的肉棒拉进喉咙深处，一边按摩你的[balls]，一边把它们吸干。即使她的胃开始因为你精液的重量而肿胀，她也从未停止吸吮你浓稠的精液。你爆炸性的高潮继续流淌，尽管她勇敢地努力吞下所有精液，但还是有几股浓稠的精液从她的嘴角和鼻孔里逃了出来。随着漫长的高潮终于开始平息，她的舌头最后一次卷住你的长度，用力吸吮，带着极大的修饰吸干最后一滴。[pg]");
            outputText("[say: 哦，好浓……好满，]她呻吟着，坐在你的胸前，心满意足地揉着她鼓胀的肚子。[pg]");
         }
         else
         {
            outputText("当你的精液开始流入她的嘴里时，她不由自主地向前挺身，双颊鼓起，紧紧地用嘴唇裹住肉棒，拼命地想要把它留在里面。她的双手紧紧抓住你跳动的肉棒，把它固定在原位，同时深深地喝下你非人的精液，两股精液从她的鼻孔里流出，而她尽力吞下所有的精液。尽管她努力了，浓稠的精液还是从她的嘴角喷涌而出，溅落在地上。尽管她的胃已经肿胀得像个西瓜一样大，她继续深深地喝下你浓稠的精液，眼睛翻白，露出极度狂喜的表情。她的胃继续扩张，随着你精液的重量而摇晃，发出清晰的晃动声。随着漫长的高潮终于开始平息，她带着满嘴的精液退开，有些困难地吞了下去。[pg]");
            outputText("[say: 太多了……我吃撑了……]她呻吟着，坐在你的胸前，双手放在肚子上，现在已经超过了沙滩排球的大小。[pg]");
         }
         outputText("随着你的[cock biggest]开始疲软，你被魔法强化的蛋蛋慢慢恢复到正常大小。疲劳充满了你的肌肉，你发现很难睁开眼睛。在你昏迷之前看到的最后一件事是一个颤抖的纹身屁股从你的胸前升起，两只手充满爱意地捧着一个看起来像怀孕一样的肚子，它在轻轻地摇晃着。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         if(get_player().cumQ() < 30000)
         {
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 5;
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToKitsunes() : void
      {
         clearOutput();
         var _loc1_:Array = [];
         if(get_player().hasCock())
         {
            _loc1_.push(loseFightToHerms);
         }
         if(get_player().get_gender() != 1)
         {
            _loc1_.push(femalesAndNuetersLoseToKitsunes);
         }
         if(get_monster().hair.color == "blonde" && get_player().cockTotal() == 1 && get_player().longestCockLength() < 9)
         {
            _loc1_ = _loc1_.concat([blondeKitsuneRapesSmallWangs,blondeKitsuneRapesSmallWangs,blondeKitsuneRapesSmallWangs,blondeKitsuneRapesSmallWangs]);
         }
         if(get_monster().hair.color == "black" && get_player().lactationQ() >= 50)
         {
            _loc1_ = _loc1_.concat([loseToBlackHairLatexWhileMilky,loseToBlackHairLatexWhileMilky,loseToBlackHairLatexWhileMilky,loseToBlackHairLatexWhileMilky]);
         }
         if(get_player().hasCock() && get_player().balls > 0 && get_player().cumQ() > 1000)
         {
            _loc1_ = _loc1_.concat([loseToKitsunesWithBallsAndHighCumQ,loseToKitsunesWithBallsAndHighCumQ]);
         }
         if(get_monster().hair.color == "red")
         {
            _loc1_.push(getRapedByRedHeadFutaKitsune);
            if(get_monster().get_lust100() > 50)
            {
               _loc1_.push(getRapedByRedHeadFutaKitsune);
            }
            if(get_monster().get_lust100() > 70)
            {
               _loc1_.push(getRapedByRedHeadFutaKitsune);
            }
            if(get_monster().get_lust100() > 85)
            {
               _loc1_.push(getRapedByRedHeadFutaKitsune);
            }
         }
         _loc1_[Utils.rand(int(_loc1_.length))]();
      }
      
      public function loseToBlackHairLatexWhileMilky() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你倒在地上，挣扎着支撑自己，你的肌肉因");
         if(get_player().get_HP() < 1)
         {
            outputText("疲劳");
         }
         else
         {
            outputText("欲望");
         }
         outputText("而颤抖。当你倒下时，你发现自己被一群丝滑的黑色尾巴垫住了。它们卷曲着环绕着你，温柔地抱着你，把你翻转到仰卧的姿势，然后把你拉起来坐着。[pg]");
         outputText("狐妖微微一笑，迅速开始脱下你的[armor]，小心翼翼地将它们拉下，并用她的一条尾巴将它们推到一边。她的指尖轻轻划过你的[chest]，在你的肌肤上留下一道道蓝色的火焰轨迹，每一秒都伴随着噼啪声和刺痛感，让你舒服得呻吟起来。她的食指轻轻地在你的[nipple]上画圈，当她看到你乳白色的乳汁开始滴落时，她高兴地睁大了眼睛，饥渴地舔了舔嘴唇。[pg]");
         outputText("[say: 噢，我今天的运气真是太好了！]她咧嘴笑着说道，淫荡地摆动着手指，同时她的尾巴滑过你的四肢，将它们牢牢地钉在地上。[pg]");
         outputText("伴随着打火石敲击钢铁的声音，她的指尖亮起耀眼的蓝色火花，她开始慢慢地揉捏和抚摸你的[chest]，在你的身体上画出一个个劈啪作响的微小火焰圆圈，并高兴地看着你在快感中扭动。刺痛感随着时间的推移而加剧，逐渐蔓延到你的胸部，直到你真的感觉自己像着火了一样。最后，狐妖的法术效果显现出来，你感觉到你的[chest]因为增加的重量而膨胀，不断涌出的乳汁带来的压力变得几乎难以忍受。[pg]");
         outputText("[say: 别担心，亲爱的，这不会持续太久的……]狐妖向你保证，戏谑地捏着你肿胀的乳头，挤出一股浓稠的乳汁。[pg]");
         outputText("当她终于用嘴唇包裹住你肿胀的乳头时，你无法控制自己发出一声呻吟，你充满乳汁的乳房上的每一种感觉都被放大了十倍。当她开始吸吮时，她的嘴角向上卷起一个微笑，用她那双绿色的大眼睛调皮地看着你。随着巨大的压力突然得到缓解，你弓起背呻吟着，" + (int(get_player().cocks.length) > 0 ? get_player().sMultiCockDesc() + "变得坚硬如石" : "") + (get_player().get_gender() == 3 ? "并且" : "") + (get_player().get_gender() >= 2 ? "一滩水开始在你的双腿间蔓延" : "") + "，这完全是因为它带来的纯粹快感。" + (int(get_player().cocks.length) > 0 ? "[pg]她开心地笑着，掀起长袍的后摆，露出她宽阔的臀部，将颤动的臀瓣压在[eachCock]上。她的几条尾巴像蛇一样滑下来，缠绕住" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "，将" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "紧紧地压在她的屁股上，并开始慢慢地上下抽动。虽然从这个角度你看不见，但你能感觉到她巨大的臀瓣在[eachCock]周围性感地颤抖，随着每一次动作诱人地晃动。" : "") + "[pg]");
         outputText("" + (get_player().get_gender() >= 2 ? (get_player().get_gender() == 3 ? "另一条" : "一条") + "如丝般柔滑的黑色尾巴滑落到你的双腿之间，戏谑地挠着你的腹股沟。它慢慢地在你的[vagina]周围画圈，将尖端刷过你的[clit]，轻轻地把玩着敏感的阴唇，偶尔压在你的入口处，却从未真正插入。这种折磨令人难以忍受，但你无助地被压在她的身下，所以你所能做的就是接受她折磨人的戏弄。[pg]" : "") + "");
         outputText("她的舌头不断地在你的[nipple]上舔舐和旋转，吸干你一个乳房的乳汁，同时轻轻地挤压和抚摸另一个" + (int(get_player().breastRows.length) > 1 ? "" : "") + "。当你的一个[fullChest]干涸时，她很快就放弃了它，转向" + (int(get_player().breastRows.length) > 1 ? "另一个" : "另一个") + "，用她的魔法诱导你产生更多。她一遍又一遍地吸干你的乳房，重复这个循环至少半打次，直到你开始失去计数。每次你的乳房开始再次充满乳汁时，它们的敏感度似乎都会增加。最终，你变成了一个颤抖、呻吟的废人，你的[nipples]变得像阴蒂一样敏感。[pg]");
         outputText("正当你觉得看不到尽头时，胸部和腹股沟越来越强烈的紧绷感告诉你，你即将达到高潮。一阵阵颤栗顺着你的脊椎上下游走，你开始呻吟，起初很轻，但声音越来越大" + (int(get_player().cocks.length) > 0 ? "。[eachCock]抽搐着，将精液喷射到狐妖的臀瓣之间，用你充满活力的精液浸透了她的下背部" : "") + (get_player().get_gender() >= 2 ? (get_player().get_gender() == 2 ? "你" : "，同时你") + "被忽视的肉洞里的每一块肌肉都紧绷起来，肆意地挤压着空气，你的体液涌出，在你身下汇成一滩" : "") + "[pg]");
         outputText("你的高潮伴随着如泉涌般的乳汁，狐妖看到你巨大的高潮，忍不住咯咯笑了起来，舔掉她手臂和手指上的乳汁水滴。随着高潮的最后余波离开你的身体，你的[chest]恢复了正常大小，尽管你似乎仍然比以前分泌了更多的乳汁。喝下了肯定有几加仑的乳汁后，狐妖的肚子比以前胖了不少，她满意地叹了口气，轻轻地拍了拍她的肚子。[pg]");
         outputText("[say: 嗯……真是</i>太棒了<i>，]她宣布道，轻轻地向前倾身，在你的额头上吻了一下。[say: 现在好好睡一觉吧……别让触手咬你……][pg]");
         outputText("她用一种奇怪的语言低语着咒语，你可以慢慢感觉到你已经被快感折磨得筋疲力尽的意识正在离开你，取而代之的是一种温暖、舒适的黑暗。你的梦中萦绕着你被变成一头人类奶牛的景象，被迫作为你饥饿的狐妖主人的活体产奶工厂度过余生。");
         get_player().orgasm("Tits");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_player().boostLactation(1.5);
         if(get_player().hasPerk(PerkLib.Feeder))
         {
            get_player().addStatusValue(StatusEffects.Feeder,1,1);
            get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function loseKitsuneImpFight() : void
      {
         clearOutput();
         if(Utils.rand(3) == 0)
         {
            get_monster().hair.color = "blonde";
         }
         else if(Utils.rand(2) == 0)
         {
            get_monster().hair.color = "black";
         }
         else
         {
            get_monster().hair.color = "red";
         }
         kitsuneSprite();
         outputText("当你战败倒地时，你抬头看到小恶魔正站在你上方。你做好了最坏的打算，却惊讶地看到这只邪恶的生物在一阵蓝色的火焰中消失了。[pg]");
         outputText("[say: 嗯……这比我想象的……要容易得多。说实话，有点无聊。][pg]");
         outputText("刚才那个女人弯下腰看着你，带着困惑的微笑。在你的眼前，她的脸、身体和衣服都开始变形。她穿着一套宽松暴露的长袍，将她[monster.hair]的头发从脸上拨开，伸手整理了一下她那巨大的三角形狐狸耳朵。六条光泽浓密的尾巴在她身后左右摇摆，催眠般地吸引着你的目光，一层华丽的纹身顺着她身体的曲线蔓延。[pg]");
         outputText("[say: 哎呀，哎呀，你还真是个软柿子，不是吗？] 她说道，露出早熟的笑容。[say: 好吧，希望你作为点心能比作为保镖更有价值。]");
         menu();
         addButton(0,"继续",loseToKitsunes);
      }
      
      public function loseFightToHerms() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("[say: 如果你打算这么轻易放弃，你一开始就可以说出来，省得给自己找麻烦！][pg]");
         outputText("她咯咯的笑声在你耳边回荡，当她费力地把你翻转过来时，笑声因她发出的咕哝声而短暂中断。[pg]");
         outputText("[say: 是时候领取我的奖品了……][pg]");
         outputText("她轻声哼着歌，小心翼翼地脱下你的[armor]，整齐地叠成一堆，推到一边。她饥渴地盯着你赤裸的身体，开始让双手顺着你的[fullChest]慢慢滑下，让指尖掠过你身体的每一处隆起和曲线，同时在你的肌肤上画出一道道耀眼的火焰。她的触摸让你的脊背一阵阵发麻，让你不由自主地颤抖和呻吟。慢慢地，她的手稳稳地向下移动到你的下体，非常温柔地在你的[hips]周围挑逗" + (get_player().isBiped() ? "，挠着你大腿内侧" : "") + "，然后向上滑向你" + (get_player().get_gender() >= 2 ? "迅速湿润的裂缝。她的手指在你的阴唇内侧跳舞，在入口处打转，几乎——但始终没有——将指尖推入其中，当你将一股体液释放在她的掌心时，她满意地窃笑起来。她用一条尾巴的尖端像羽毛一样轻柔地滑过你的[clit]，然后将注意力转向她真正的奖品，你" : "") + "逐渐硬挺的[cock biggest]。[pg]");
         outputText("她紧紧握住你的" + (get_player().hasSheath() ? "包皮" : "根部") + "，用另一只空闲的手指在你的肉棒上下爬行，在底部留下微小的火焰珠，当它们舔过你坚硬的肉棒时，会产生令人难以置信的火花和刺痛感。这种待遇没过多久，你就已经摇摇欲坠了，但这位技艺高超的诱惑者对你有其他计划，并在你释放前的一瞬间收回了快感。[pg]");
         outputText("[say: 哦，不，亲爱的，好戏才刚刚开始，] 她用一种假装责备的语气说道，调皮地笑着。[pg]");
         outputText("快如闪电，她的三条尾巴向前猛抽，紧紧套住你的肉棒，用它们异常柔软的皮毛包裹并在肉棒上滑动。闪烁的线圈以缓慢、挑逗的节奏在你的阴茎上下移动，轻轻挤压和扭动，将你拖向快感的边缘，每次都让你在恢复美妙的折磨之前飘落下来。[pg]");
         outputText("当她爬到你身上时，她的尾巴继续独立运作，将她柔软、有弹性的臀部放在你的[hips]上，然后向后挪动，直到[eachCock]被温暖的球体包裹。两条尾巴卷起，轻轻掀起她长袍的下摆，露出她臀部柔软、颤动的肉，她挑逗地扭动臀部，让巨大的臀瓣在你的[cock biggest]周围轻轻颤抖。她的手顺着肩膀滑下，滑过她颤动的乳房，将手指勾进长袍，把它们拉下来，这样她挺拔的乳头就勉强被包裹住了。她以令人痛苦的缓慢速度脱下长袍，全程注视着你，并对你对她挑逗性展示的反应发出诱人的笑声。随着她的衣服被扔到一边，你可以一览无余地看到她年轻、柔软的身体，" + (get_monster().hair.color == "blonde" ? "飘逸的金发瀑布般倾泻在她健美、丰满的沙漏形身材上。" : (get_monster().hair.color == "black" ? "肚子周围微微隆起的肉肉突显了她丰满的身材。" : "你的目光立刻被那根现在横跨在你肚子上的、一英尺长、跳动着的肉棒吸引住了。")) + "她羞涩地笑着，摆出一个迷人的姿势，半眯着眼睛色眯眯地看着你，嘴角挂着一抹欢快的坏笑。[pg]");
         outputText("[say: 嗯……是不是觉得浑身燥热，亲爱的？] 她几乎是用耳语说道，声音里充满了诱惑。[pg]");
         outputText("当她俯下身将胸部贴上你的胸膛时，她的尾巴继续在你的[cock biggest]上缠绕滑动，挑逗着、挤压着，用神秘的狐火涂抹着你的下体。她丰满的臀瓣在你的肉棒上方起伏，轻轻颤动着。她抚摸着你的脸颊，在你的下巴下方印下一个轻吻。丰润饱满的双唇贴上你的嘴唇，带来冬青的甜美气息。她的手指以惊人的力度扣住你的后脑勺，在你的唇间释放出一声强烈的娇喘，一阵酥麻的凉意在你的舌尖蔓延，随后传遍全身。[pg]");
         outputText("她的魔力流经你的身体，渗透进你的四肢百骸，让你充满战栗、颤抖的欲望。你很快就忘记了自己是这个阴险骗子游戏里不情愿的参与者，理智被最原始的本能所颠覆。她下体的热度在你的[cock biggest]周围散发，你脑子里想的全是那光荣、狂喜的插入瞬间。肯定很快就会来了。她肯定不能一直这样挑逗你……[pg]");
         outputText("她小心翼翼地抬起又放下臀部，舌尖在齿间若隐若现，用两片丰满臀瓣之间温暖的沟壑爱抚着你的肉棒。她的节奏缓慢而有条不紊，完美地控制着尺度，让你始终在边缘摇摇欲坠，却又不足以将你推过临界点。[pg]");
         outputText("[say: 哦，可怜的小东西，] 她柔声说道，看着你的脸因无耻的欲望而扭曲成痛苦的表情。她为什么还不快点开始！？当你伸手试图控制局面时，她拍开了你的手，两条尾巴向前卷曲绑住你的手腕。[say: 调皮调皮！你可以看，但今天负责摸的人会是<i>我</i>，亲爱的。][pg]");
         outputText("你试图挣脱她毛茸茸的束缚，但无济于事。凝视着她那如清澈绿池般的眼眸，你非常清楚，身体上的抵抗是徒劳的——她催眠般的巫术已经抽干了你肌肉的力量，让你无力地悬挂在她的尾巴里。她的手指再次在你的[chest]上缓慢起舞，在你的胸前画出复杂的火焰图案，并咯咯地笑着。当她终于开始抬起臀部，将温暖湿润的阴唇滑过你的肉棒时，你猛地吸了一口气。随着她湿润的嘴唇包裹住你[cock biggest]的[cockHead biggest]，女性的淫液顺着你的肉棒缓慢滴落，你的兴奋感稳步攀升。当她前后摇摆臀部，用你的龟头在她的入口处打转，并狡黠地对着你笑时，一声呻吟从你的唇间溢出。[pg]");
         outputText("[say: 你想要这个，对吧？你很想要吧？]她挑逗着，对你跳动的肉棒施加了极其微小的压力。你的龟头抵在她入口处紧致的肌肉环上，正处于插入的边缘，但狐妖似乎非常享受折磨你的过程，始终不让你进入。[pg]");
         outputText("当你因渴望而呜咽时，她顺着你肉棒的下方滑下，将你的肉棒压在你的身前，缓慢地前后摩擦着臀部。她来回滑动，阴蒂坚硬的肉芽轻轻地摩擦着你的肉棒，继续挑逗着你，带着近乎施虐的狂喜咧嘴笑着。她湿透的小穴里流出的滑腻淫液漫过你的肉棒边缘，很快就在你身上涂上了一层薄薄的润滑液" + (get_monster().hair.color == "red" ? "，同时，一丝前列腺液从她跳动的肉棒顶端流出，粘稠的液体滴落在你的肚子上" : "") + "。[pg]");
         outputText("你双眼翻白，绝望地呻吟着，徒劳地试图向上挺动臀部，给自己最后冲刺所需的推力。就在你确信自己会因快感而发疯时，她向前滑去，俯下身抓住你的肩膀，深深地吻了你。你感觉到她的尾巴滑到你的肉棒下方，将其抬起就位，然后你的视野爆炸成一片色彩的海洋，进入她小穴的强烈快感终于光荣地赐予了你。" + (get_player().biggestCockArea() > 50 ? " 她根本不可能舒服地容纳这么大的东西，但不知为何她却轻松做到了，温暖、极其紧致的阴道肉一寸寸地拉伸，以容纳你巨大的肉棒。" : "") + " 她的臀部向后滑动，直到与你平齐，你的肉棒完全被她阴道柔软湿润的温暖所包裹。[pg]");
         outputText("当她开始在你的[cock biggest]上起伏时，她的舌头热情地探入你的口中，一条尾巴紧紧地卷住你的" + (get_player().hasSheath() ? "包皮" : "根部") + "。血液涌入你的腹股沟无处可逃，让你的肉棒在她的阴道内肿胀，并加剧了她肌肉小心翼翼地挤压和收缩你时已经令人难以置信的感觉。蓝色的火舌舔舐着你的[skinfurscales]，她的尾巴像一套画笔一样在你的身体上画出火花，让你因快感而战栗。每次她将自己从你的肉棒上拔出时，强有力的肌肉都会紧紧地挤压你的肉棒，在你的整个长度上荡漾，然后再将你吸回去。[pg]");
         outputText("事实证明，这种快感让人难以忍受，尤其是在她不断的挑逗之后，没过多久，你就感觉到你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "因高潮的压力而肿胀。缠绕在你" + (get_player().hasSheath() ? "包皮" : "根部") + "的尾巴收紧了许多，狐妖开始以更加猛烈的激情骑乘你，她宽大的臀瓣每次猛烈撞击你的[hips]时都会发出响亮的拍打声。[pg]");
         outputText("[say: 快了，亲爱的！嗯，就差一点了，啊！再多一点……][pg]");
         outputText("她向后靠，用你的胸膛支撑着自己，以一种充满激情的凶猛姿态挺动臀部，将骨盆狠狠地压向你，让她的乳房" + (get_monster().hair.color == "red" ? "和她的肉棒" : "") + "不知羞耻地上下弹跳。她的小穴有力地从" + (get_player().hasSheath() ? "包皮" : "根部") + "到顶端绞榨着你的肉棒，她体内每一次荡漾的动作都以非人的控制力和技巧在各个方向爱抚着你。随着她自身高潮的临近，她的节奏继续加快，双眼翻白，比以往任何时候都更加用力地向下摩擦，不顾你绝望的释放请求。" + (get_monster().hair.color == "red" ? " 当她的高潮临近时，她的一条尾巴向前卷曲，开始套弄她的肉棒，咸咸的前列腺液滴溅落在你的嘴唇上。" : "") + " 伴随着满足的颤抖，她弓起背，最后一次将臀部重重地压在你身上，在极乐的狂喜中呻吟，她的尾巴从你的四肢上解开。一股液体浸湿了你的腰际，" + (get_monster().hair.color == "red" ? "滚烫的精液从她抽搐的肉棒中喷涌而出，在你的脸、脖子和胸膛上留下珍珠白色的条纹。" : "一股温暖的潮吹液从她的小穴中喷射而出，溅在你的脸、脖子和胸膛上。") + "[pg]");
         outputText("当高潮席卷她时，她的尾巴放松了对你" + (get_player().hasSheath() ? "包皮" : "根部") + "的束缚，你终于能够从折磨中解脱出来，浓稠的精液冲上你的肉棒，在狐妖颤抖的下体中爆发。");
         if(get_player().cumQ() <= 150)
         {
            outputText("滚烫粘稠的精液喷射进她的体内，用你的精液将她的子宫染成白色。她的肉壁挤压并榨取着你的肉棒，贪婪地吸出你提供的每一滴种子。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("滚烫的精液如丝带般溅在她的子宫颈上，冒着泡涌入她的子宫。她的肉壁用力挤压，肌肉的荡漾从你的肉棒中吸出每一滴种子，饥渴地榨取着。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("随着每一股新的精液喷出，你的肉棒从根部到顶端都在肿胀，用你温暖强效的种子填满她的子宫。她的小穴在你的肉棒周围蠕动挤压，榨干你所有的价值。随着更多起泡的精液流入她的体内，她的肚子上形成了一个小凸起，伸展成一道平缓的曲线。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("大量的精液通过你跳动的肉棒涌上，像一座粘稠的白色火山一样在她的子宫里爆发。她的小穴痉挛着，在你的周围挤压，有力地榨取着你的肉棒，吸出你最后一滴粘稠的精液。随着每一股新鲜的精液流入她的体内，她的肚子都会膨胀一点，肿胀成一个漂亮的、颤动的凸起。");
         }
         else
         {
            outputText("浓稠、充满活力的精液在你的肉棒中膨胀，溅在她的肉壁上，像河流一样流入她的子宫。当你的肉棒在她的体内跳动抽搐时，她的小穴有力地挤压和痉挛，将每一滴精液向上漏斗状地输送到她的子宫。她的腹部向外膨胀，像气球一样鼓成一个淫秽的、颤动的球体，随着你非人精液的重量而晃动。");
         }
         outputText("[pg]她极其满足地深吸了一口气" + (get_player().cumQ() > 350 ? "，一只手放在肚子上" : "") + "，向后靠去，稍微扭动了一下臀部，挑逗着你疲软的肉棒。沐浴在她" + (get_monster().hair.color == "red" ? "充满麝香的扶他精液" : "女性的淫液") + "中，你微微抽搐，极乐和疲惫同等地蔓延全身。她再次向前倾身，将嘴唇凑到你的耳边，一边抚摸着你的脸颊，一边低声念诵了一段简短的咒语。[pg]");
         outputText("在失去知觉之前，你看到的最后一件事是，当狐妖整理她的长袍时，一对令人愉悦的丰满圆润的脸颊在快乐地晃动着。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveKitsune(param1:Boolean = false) : void
      {
         clearOutput();
         kitsuneSprite();
         if(param1)
         {
            outputText("你紧张地感谢她慷慨的提议，但还是拒绝了，转身准备离开。");
         }
         else
         {
            outputText("你转身准备离开，想和这个堕落的骗子拉开一些距离。");
         }
         outputText("[pg][say: 别急着走嘛，]你刚转身就听到了这句话，当你差点撞上她时，你猛地停下了脚步。她又来了，毫无预兆地突然出现在你面前。[pg]");
         outputText("[say: 我有东西要给你……][pg]");
         outputText("她递出一个用绳子绑着的小白色包裹，满脸期待地笑着。你犹豫了一下，不知道收下这个小女孩的礼物是否明智，但还没等你抗议，她就把包裹塞到了你手里。当你从毫无特征的包装上抬起头时，她已经不见了踪影，只留下树林间回荡的调皮笑声。[pg]");
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().KITGIFT.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            get_inventory().takeItem(get_consumables().KITGIFT,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function lactaidDoseAKitSune() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你饥渴地舔了舔嘴唇，盯着她那几乎要撑破长袍的丰满双乳。你把手伸进[inv]，拿出一瓶催乳剂，在手里晃了晃，阴险地笑着。当你俯身靠近她时，狐妖狐疑地看着你，目光在瓶子和你之间来回游移。她半推半就地试图爬走，当你抓住她的" + (get_player().cor < 33 ? "长袍下摆" : "尾巴") + "把她拉回来时，她发出了一声惊呼。[pg]");
         outputText("[say: 呃……你知道之前那些都只是闹着玩的，对吧？呀！][pg]");
         outputText("你把她按倒在地，将瓶子里乳白色的液体倒进她的嘴里，清楚地表明她必须咽下每一滴。你把瓶口紧紧贴在她的嘴上，直到她乖乖地把里面的东西全部吞下，然后扔掉空瓶子。[pg]");
         outputText("几乎立刻，她原本就很大的乳房开始膨胀，在长袍里鼓胀起来，然后随着丰满的晃动溢出。她把手移上去支撑她迅速膨胀的胸部，她的乳房在一分钟内就增大了好几个罩杯。当她乳房的肿胀开始减缓时，她的乳头也紧随其后，乳晕膨胀起来，吞没了她小指大小的乳头。起初很慢，一种乳白色的物质开始从她内陷的乳头中滴落，随着时间的推移，流量逐渐增加。[pg]");
         outputText("[say:我……我的胸部！感……感觉好……好热……]她呻吟着，翻着白眼，开始把玩起自己的乳房，双手揉捏着那膨胀的肉团，乳汁顺着曲线流下，漫过她的手指。总而言之，你估计她那巨大的乳房大约有H罩杯大小，即使对她那曲线优美的身材来说也显得极不协调。[pg]");
         outputText("你咧嘴一笑，色眯眯地搓了搓手掌，然后伸出手将它们从她手中夺过，解释说她那肥大的奶子现在属于你了。你两只手各抓着她那大得离谱的奶子，将它们挤压在一起，在手掌间揉捏着，感受着那触感，不禁浑身颤抖。每一次挤压，那柔软得不可思议的肉团都会从你的指尖溢出，乳汁从她那肿胀起皱的乳头喷射而出，浸透了她的前胸。你试探性地将一根沾满乳汁的手指举到唇边舔了舔，品尝着那甜美、几乎带有薄荷味的余韵，这让你不由自主地顺着脊背打了个冷战。[pg]");
         outputText("对你的小实验结果感到满意，你松开了她那巨大的奶子，让它们弹跳着颤动回原位，然后站起身来。脱下你的[armor]，你的双手顺着腹股沟滑下，再次俯身压在她身上，向前挪动，紧贴着她乳房的下部。将[eachCock]放在那起伏的乳肉堆之间，你拢起她的乳房，再次将它们挤压在一起，当柔软的肌肤包裹住你那跳动的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "时，你发出了呻吟。温暖的乳汁顺着她那深邃的乳沟流下，流过你的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "，留下一种奇特的刺痛感，让你浑身颤抖。[pg]");
         outputText("[say:哦……感觉……]她呻吟着，咬着指关节，脸颊上泛起一抹淡淡的粉红。[pg]");
         outputText("你的手向上游移，抚上她肿胀的乳晕，拇指在敏感的肌肤上打圈，引得这只狐妖发出一连串不知羞耻的呻吟。她弓起背，在你身下向上挺起胸膛，喷射出大量的乳汁，就像一个淫荡的喷泉。你将指尖按进她柔软的奶子里，看着那颤动的肉团在你的手周围泛起涟漪并被挤压，心中充满了几乎令人眩晕的愉悦。即使是最轻微的压力，也会让一股新鲜的乳汁从她内陷的乳头溢出，滴落下来，填满那宽阔的峡谷。[pg]");
         outputText("你慢慢地开始将[eachCock]穿过那滑腻的通道，沉醉于她那巨大的乳房紧紧包裹着你跳动的肉棒" + (int(get_player().cocks.length) > 1 ? "s" : "") + "的感觉。她肉体的温暖与覆盖在你阴茎" + (int(get_player().cocks.length) > 1 ? "s" : "") + "上的乳汁带来的冰凉刺痛感形成了绝妙的对比，将你的快感提升到了难以置信的程度，让你忍不住呻吟和颤抖。她的胸膛随着每一次沉重的呼吸在你身下起伏，伴随着她饥渴的呻吟而颤动。[pg]");
         outputText("[say:哦，玛莱，感觉太棒了！]她呻吟着，沉浸在快感中翻着白眼，而你则继续将[eachCock]在她敏感的双乳间抽插。[say:操我的奶子，继、继续！][pg]");
         outputText("她将前臂向上移动，压在乳房两侧，手指勾住胸部的顶端，用手肘向内挤压。腾出双手的你，开始揉捏她的乳头，用拇指在边缘画着大圈，慢慢向内盘旋。你用拇指向内按压，撑开她那肿胀的乳晕，将手指伸进去触碰里面敏感的凸起。当你捏住她充血的乳头时，她发出狂喜的叫声，你轻轻拉扯，挤出浓稠的乳汁，迫使它们凸出来。直到现在，你才真正体会到你喂她吃下的催乳剂的效果，她敏感的粉色乳头已经肿得像大樱桃一样大了。[pg]");
         outputText("你捏住她那过度生长的乳头根部，将它们倾斜向她的脸并挤压，将乳汁喷射到狐妖的脸上。起初她惊讶地皱了皱眉，但随后张开嘴，用舌头接住水流，急切地舔舐着。你用力一挤，然后将她充血的乳头对准自己的嘴，俯下身大口吸吮。很大一部分乳汁没有落到你的舌头上，而是顺着你的下巴滴落下来，弄得一团糟，但你细细品味着勉强喝到嘴里的那一点点，发出满足的哼声。[pg]");
         outputText("你和她一起，尽可能紧地将她那摇晃的乳房压在[eachCock]上，并开始以新的活力抽插，每次你的臀部撞击她那充满乳汁的乳房时，都会在她的胸部引起阵阵涟漪。她不知羞耻地呻吟着，伸长脖子舔舐胸部顶端的乳汁，甚至只要够得着，就会用舌头舔过[oneCock]。她剧烈地颤抖着，开始在胸部两侧上下滑动双臂，为这美妙的乳交增添了一点额外的刺激。她的乳房现在不断地喷涌出乳汁，整个前胸都湿透了，地上也在她周围形成了一个水洼。[pg]");
         outputText("你压在她的胸口上，加倍用力地抽插，下腹部开始积聚起不可避免的高潮带来的颤抖。每次你在她巨大的乳房之间穿梭时，空气中都会充满响亮的液体拍打声，乳汁和前列腺液覆盖了她乳沟的每一寸肌肤。伴随着一声呻吟，你最后一次向前挺动臀部，[eachCock]随着高潮的爆发而抽搐着。[pg]");
         if(get_player().cumQ() <= 150)
         {
            outputText("浓稠的精液在她的双乳间喷涌而出，几股高压的精液从她的胸口飞溅到她的脸上，湿漉漉地落在她的嘴唇上。浓稠的精液顺着她的胸骨上方浅浅的凹陷处流下，汇聚成一滩。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("她深邃的乳沟里填满了你冒泡的精液，浓稠的精液飞溅到她的脖子和脸上。她的胸前沾满了乳汁和精液，顺着她的肩膀和下巴滴落流淌。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("你的腹股沟压力骤增，你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "在高潮前的那一刻肿胀起来。浓稠的精液从她的双乳间喷射而出，伴随着一连串湿润的拍打声飞溅在她的脸和脖子上。她的胸部和脸部被乳汁和精液混合而成的奶油面具浸透，一条浓稠的珍珠项链顺着她的肩膀缓缓滴落。");
         }
         else
         {
            outputText("你的肉棒");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("肿胀");
            }
            else
            {
               outputText("肿胀");
            }
            outputText("得令人难以置信，浓稠的精液同时喷涌而出，一股浓稠的精液飞溅在她乳沟的肉壁上，喷射到她的脸上。一波又一波的精液从她的双乳间喷射而出，在她的脸和胸部覆盖上一层粘稠的面具，将她金色的头发粘在一起。");
            if(get_player().cumQ() >= 2500)
            {
               outputText("你的高潮似乎永无止境，新鲜的精液四处飞溅，直到她周围那滩乳白色的水洼里，乳汁和精液各占一半。");
            }
         }
         outputText("[pg]当突如其来的高潮震颤她的胸膛时，她发出一声低沉的呻吟，新鲜的乳汁像温暖的奶油洒水器一样四处喷涌，如雨点般落在你周围。即使你满意地躺下喘口气，狐妖的乳房仍在继续漏奶，乳白色的溪流顺着她胸部巨大的曲线缓缓流下。当你终于站起身来清理自己时，你回头看到那个发情的狐狸女孩正把她肿胀的乳房举到唇边，深深地吮吸着。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_player().consumeItem(get_consumables().LACTAID);
         get_combat().cleanupAfterCombat();
      }
      
      public function kitsunesGetBonedBy3PlusTentacles() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你慢慢地靠近倒下的狐狸女孩，警惕地看着她，保持安全距离，以防她还有什么花招。你每向她迈出一步，她就慢慢地向后退，当你俯冲下去抓住她的手臂时，她惊讶地叫了起来。她试图爬到安全的地方，但她的挣扎只让她平躺在地上，因为她被自己的长袍缠住了。[pg]");
         outputText("你把她按倒，低身靠近，开始慢慢地脱下她的衣服，你的手淫荡地滑过她曲线优美的身体。当你解开她腰间的腰带并把它扔到一边时，她的乳房随着诱人的弹跳弹了出来。她继续挣扎了一下，试图挣脱，但当你用手穿过她的头发，轻轻地抓挠她的耳背时，她疯狂的挣扎很快就平静下来了。[pg]");
         outputText("你的指尖慢慢地滑过她光滑的皮肤，沿着她许多充满异国情调的纹身边缘，一路滑向她丰满的臀部。你的手指深深地陷进柔软的肉里，当你挤压和揉捏它时，她宽大的臀部诱人地晃动着。作为实验，你用手指轻轻弹了一下那肉质的球体，引得狐妖发出一声惊呼。圆润的脸颊剧烈地摇晃和颤抖，肉在你的手下像果冻一样起伏和晃动。[pg]");
         outputText("你轻柔地开始抚摸她六条奢华尾巴根部的细毛，轻笑着看着她脸颊上的粉红色加深成强烈的深红色。你指尖最轻微的触碰就让她尾巴上的毛发竖了起来，眼角涌出小小的泪花，她的呼吸变得沉重而急促。一旦她被你坚持不懈的爱抚满意地变成了一堆颤抖的欲望，你就会退后一步，脱下你的[armor]，缓慢而戏弄地工作，让这个害羞的骗子尝尝她自己的苦果。[pg]");
         outputText("当你的" + Utils.num2Text(get_player().countCocksOfType(CockTypesEnum.TENTACLE)) + "根扭动的触手从你的[armor]的束缚中挣脱出来时，狐妖的眼睛因为欲望而睁得大大的，她的下巴松弛地垂着，舌头从嘴里伸出来。当她饥渴地盯着你滑动的触手，身体前倾，手脚并用地向你爬来时，一道口水顺着她的下巴滑落。[pg]");
         outputText("[say: 触手……]她用近乎虔诚的语气低语，伸手抓住其中最大的一根，温柔地挤压着它。在你意识到之前，她已经把脸埋在你的胯部，闭上眼睛，快乐地哼着歌，她的手在你扭动的、植物般的肉棒上上下滑动。[pg]");
         outputText("你的触手本能地缠绕在她的手臂上，包裹住她的肩膀，把她拉得更紧，进入你的触手怀抱。她通过鼻子深吸了一口气，当她的脸埋在你的腹股沟时，品味着你肉棒浓郁的麝香味。她的舌头沿着你最大的触手肉棒的下方滑出，她的手掌在肉棒上稍高一点的地方抚摸着。当你低头看时，她清澈的绿色眼睛翻到了头骨里，脸上挂着纯粹的狂喜表情。当她热切地把脸在你的许多触手肉棒上摩擦时，她的脸颊在你的触手肉棒上滚烫地燃烧着，发出快乐的呻吟。[pg]");
         outputText("[say: 好强壮……好粗……]她呻吟着，舌头沿着一根扭动的肉棒滑动，热切地抚摸着另外两根。[say: 哦，如果我早知道……][pg]");
         outputText("当你的肌肉触手滑入她的腋窝，把她从地上举起来时，她高兴地抽搐着。她的尾巴甩了出来，缠绕在它们能碰到的任何东西上，蛇形的毛发线圈以一种崇拜的激情抚摸着你众多的肉棒。她毫不犹豫地把腿举到空中，用自己的尾巴把脚踝拉到耳朵边，并把它们固定在那里。[pg]");
         outputText("当两根扭动的肉棒开始在她的腹股沟摩擦时，她喉咙里发出一声颤抖的呻吟，一根滑过她湿透的裂缝，另一根穿过她丰满的脸颊。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "你的触手迅速滑过她的肉棒，紧紧地缠绕在根部，从头到尾挤压着它。" : "") + "她淫荡地呻吟着，试图把臀部向你挺去，但由于她奇怪的姿势和被你扭曲的肉棒丛林缠住，她遇到了一些困难。[pg]");
         outputText("最大那根肉棒的顶端轻轻分开她闪闪发光的小穴，摩擦着她肿胀的樱桃色阴蒂，挑逗着她的入口。她的下体紧紧夹住你触手的冠部，肌肉在顶端起伏，饥渴地吮吸着，仿佛试图将其吸入体内。她急切地将臀部推向你的肉棒，疯狂地点头并发出呜咽声，尽最大努力表达她的渴望。[pg]");
         outputText("你呻吟着满足了她，一记挺送便将一英尺长的触手埋入她泥泞的小穴中。她张着嘴，发出赞许的呻吟，你迅速移动另一根蠕动的触手填满她的嘴。她的喉咙放松下来，接纳了入侵的肉棒，不知不觉中，你已经将她两头贯穿，让她在快感中陷入疯狂。[pg]");
         outputText("她的手指和脚趾卷曲着，缠绕在你藤蔓般的肉棒的不同部位，带着爱慕的狂热抚摸着它们。你的第三根触手继续在她丰满的臀瓣间淫秽地蠕动，将滑腻的淫液涂抹在她玫瑰色的肛门周围。随着你蠕动的触手迅速插入她紧致的后庭，用一英尺长跳动的植物肉棒刺穿她的直肠，对她的侵犯变得彻底。温暖诱人的通道在你周围起伏，强健的肌肉努力将你蠕动的触手越来越多地吸入体内。[pg]");
         outputText("当她的喉咙在你的第二根触手周围震动时，空气中弥漫着含混不清的呻吟声，她的身体在紧张和放松的混乱循环中抽搐。她的脸上隐隐闪烁着泪光，泪水顺着脸颊流下，与从嘴角滴落的口水汇合，但从她继续疯狂地迎合你抽插的肉棒来看，这只能是欢愉的泪水。[pg]");
         outputText("她的双手颤抖着，恳求地向你伸出。她死死地抓住你的肩膀，放下双腿缠住你的[hips]，将她拉得更紧。有了新的支撑，她开始认真地迎合你的触手挺动。当你无情地抽插她的孔洞时，喜悦的泪水从她的眼中流出，她的肉体因你肿胀的触手的侵入而明显变形。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 她的肉棒在你的一根触手的缠绕中颤抖跳动，当你粗暴地抚摸那根跳动的肉棒时，淫液喷涌而出。" : "") + "[pg]");
         outputText("你的双手顺着她的身体滑下，将她拉入你淫秽的触手肉棒丛中，以便你能抚摸她丰满的曲线。你的指尖再次陷入她柔软的臀部，另一只手粗暴地揉捏着她的乳房。她的身体在你的身上上下摩擦，漂浮在快感和触手的海洋中，被你从头到尾彻底贯穿。[pg]");
         outputText("[say: 嗯，嗯，要高潮了！]她含着你植物般的肉棒大喊，她的话语被含糊不清的吸吮声掩盖了。[pg]");
         outputText("一股滚烫的淫水从她湿透的小穴中喷涌而出，她肌肉发达的肉壁在你周围颤抖跳动。令人难以置信的是，感觉她的小穴实际上正在将你藤蔓般的肉棒拉得更深，进入她那宽敞得离谱——却又矛盾地紧致的阴道。她的肛门紧紧夹住入侵者，直肠强健的肌肉也将其向内拉扯，并有力地榨取着肉棒。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "她的肉棒在你的触手缠绕中跳动抽搐，" + (get_player().cor > 15 ? "濒临高潮。就在她即将释放之际，你咧嘴一笑，将触手紧紧缠住她的根部。看看<i>她</i>喜不喜欢被戏弄！[pg]她的肉棒在藤蔓的缠绕下异常肿胀，徒劳地跳动抽搐着，拼命想要冲破阻碍。她的脸扭曲成痛苦的表情，带着一丝受虐的狂喜。她在你的掌控中扭动挣扎，喉咙里的触手发出含糊不清的恳求声，最后你决定她受够了。你向后靠，将她抽搐的肉棒从你身上移开，松开你的抓握，她的肉棒开始不受控制地痉挛，" : "") + "一条浓稠的精液从她抽搐的肉棒中喷发而出，在空中悬停片刻后坠落在她的脸上。这是从她肿胀的肉棒中像淫荡的喷泉一样喷涌而出的众多精液中的第一股，给她身体涂上了一层厚厚的珍珠般光泽的精液。" : "") + " 你继续用疯狂的抽插侵犯她的孔洞，快感和压力在你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "中积聚，直到最后在翻滚、颤抖的高潮中爆发。[pg]");
         outputText("当浓稠的精液顺着触手向上涌动时，你在狂喜中呻吟，");
         if(get_player().cumQ() <= 150)
         {
            outputText("从三个方向将细长的温暖精液注入她的体内。她的臀部、喉咙和小穴齐心协力，榨干你所能挤出的每一滴精液，用强大的吸力榨取你的下体。");
         }
         else
         {
            outputText("从三个方向将滚烫的精液注入她的体内。" + (int(get_player().cocks.length) > 3 ? "你多余的肉棒在她身上喷射出黏稠的精液，给她披上了一层闪闪发光的精液网。" : "") + "她的屁股、喉咙和小穴齐心协力，挤出你所能产生的每一滴精液，用强大的吸力榨取你的下半身。");
         }
         if(get_player().cumQ() > 350)
         {
            outputText("当你粗壮的精液穿过你蠕动的触手时，触手的根部会微微膨胀，当它强行穿过时，会撑开她的嘴唇、屁眼和小穴，包裹住肿胀的肉棒。");
         }
         if(get_player().cumQ() > 350 && get_player().cumQ() <= 1000)
         {
            outputText("滚烫的精液球从三个方向注入她的体内" + (int(get_player().cocks.length) > 3 ? "，同时她的身体被你多余的肉棒喷射出的黏稠精液淋湿" : "") + "，你充满活力的种子将她的洞穴塞得满满当当。她屁股、喉咙和小穴强健的肌肉协同工作，沿着你触手的长度挤压，抽出你所能产生的每一滴精液。当你把黏稠的精液倒进她体内时，她的腹部因为精液的体积而微微隆起，撑大了她的子宫和胃，而她的肠道也被种子淹没了。");
         }
         if(get_player().cumQ() > 1000 && get_player().cumQ() < 2500)
         {
            outputText("你从三个方向将一波又一波滚烫的精液注入她体内" + (int(get_player().cocks.length) > 3 ? "，你多余的肉棒将黏稠的白色精液从头到脚淋在她身上" : "") + "，充满活力的种子将她的洞穴塞得满满当当。她的屁股、喉咙和小穴协同工作，沿着肉棒的长度用力挤压，榨取你的肉棒。倾泻入她体内的精液使她的腹部像气球一样向外膨胀，变成一个摇晃的肚子，淹没了她的子宫和内脏，而浓稠的种子流从她被蹂躏的下体溢出，用力喷射出来，溅落在地上。");
         }
         if(get_player().cumQ() > 2500)
         {
            outputText("你的肉棒从三个方向将一升又一升乳白色的精液注入她体内" + (int(get_player().cocks.length) > 3 ? "，用浓稠的、充满麝香的精液覆盖她从头到脚的身体，并且" : "，") + "用浓稠的种子淹没她的内脏。她的屁股、喉咙和小穴协同工作，用强大的吸力和沿着它们长度的肌肉挤压，抽出你所能产生的每一滴种子。她的胃因为你的精液而膨胀，沉重地向外摇晃，迫使她的身体远离你，因为它伸展以容纳不断膨胀的种子体积。随着时间的推移，她被填满了，她的孔口徒劳地夹紧，试图容纳你惊人排放的剩余部分，但完全失败了。加压的精液流从所有三个孔口喷发，两股精液从她的鼻孔喷出，浸透了她的前胸。");
         }
         outputText("[pg]你气喘吁吁地将她温暖的身体紧紧抱在怀里一段时间，看着理智逐渐回到她被蹂躏的身体。你的触手一根接一根地缩回，小心翼翼地将她" + (get_player().cumQ() > 350 ? "肿胀的" : "") + "身体放到地上。她的胸膛剧烈地起伏着，" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "当你的触手松开抓握时，她的肉棒软绵绵地耷拉在大腿上，而且她的" : "") + "舌头从张开的嘴巴一侧伸了出来。");
         var _loc1_:Boolean = int(get_player().cocks.length) > 3 || get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         var _loc2_:String = get_player().cumQ() > 350 ? "，抚摸着她充满精液的肚子" : "";
         outputText("[pg]她懒洋洋地躺在草地上，处于一种放松的昏迷状态，脸上挂着灿烂的笑容。她的手滑过她的皮肤" + (_loc1_ ? "，在涂抹在她前胸的精液中画出痕迹" : "") + _loc2_ + "，同时她满足地呻吟着，发出一声沉重的赞许叹息。[pg]");
         outputText("[say:触手……]她重复着，从头到脚都在发抖。");
         get_player().orgasm("Dick",true,3);
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function kitsunesGenderlessShoveHer() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("尽管你醉得不省人事，但你还是足够清醒，及时意识到发生了什么并阻止了她。你用力推了她的胸口一把，她失去平衡，跌入水中，溅起水花。她带着喧闹的叫声冲出水面，在热气腾腾的温泉中与你扭打时，不小心把她的姐妹们撞开了。当你俩在水中翻滚，把热气腾腾的泡沫抛向空中时，那对惊讶的姐妹笑着遮住了眼睛。当翻滚的波浪终于平息下来时，你把喧闹的红发女郎按在浴池边上，你的胯部淫荡地摩擦着她高高翘起的屁股上柔软的脸颊。她挣扎了一会儿，但一旦她接受了你已经制服了她的事实，她就慢慢地放松下来，进入一种顺从的状态，她的肌肉放松，她的耳朵耷拉在头顶上。[pg]");
         outputText("[say: 好-好吧……] 她小声说道，当你挠她耳后并用手指强迫性地滑过她的脸颊时，她舒服地翻了翻白眼。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "" : " 伸手到她的双腿之间，当你感觉到她的肉棒慢慢退去，缩小成她肿胀的阴唇之间一个挺拔、坚实的快感芽时，你满意地点了点头。") + "[pg]");
         outputText("你对失望的狐妖稍微放松了一点，手指滑过她裸露的背部，看着她在愉悦的痛苦中颤抖。在她的尾巴根部轻轻抓挠了一下，打破了她最后的防线，她伴随着颤抖的叹息瘫倒在水池边的木甲板上。她的姐妹们再次靠近，用她们的尾巴摩擦你赤裸的身体，并用她们闪烁着火花的手指轻轻滑过你的[skin]。[pg]");
         outputText("金发狐妖漫不经心地涉水走到红发狐妖身边，将她翻转过来，带着傲慢的笑容坐在她妹妹的臀部上。可怜的红发狐妖被她的重量压在身下，因放肆的欲望而涨红了脸，她的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "阴茎在金发狐妖的臀瓣间急切地抽动着。" : "巨大的阴蒂在姐姐的阴蒂上摩擦着。") + "金发狐妖的一条尾巴缠绕在你的胯下，将你拉向前，进入那闪闪发光的金色线圈中，虽然毛茸茸的森林遮挡了你的视线，但你能感觉到从里面散发出的湿润温暖，近在咫尺。[pg]");
         outputText("她的尾巴盘绕并紧紧缠住你的大腿，将你拉向前，紧贴着她颤抖的嘴唇，同时尾尖性感地拂过你敏感的下体，让你的脊背感到一阵阵轻微的刺痛。" + (get_player().getClitLength() > 4 ? "当你感觉到你的[clit]轻轻滑入她湿润的阴唇之间时，你发出一声轻哼，四周被温暖湿润的肉体抚摸着，肌肉收缩以完美贴合它的形状。" : "") + "当你轻轻压在她身上时，她满意地颤抖着，几条尾巴缠绕在你的[hips]上，将你紧紧抱住。红发狐妖的尾巴在她身下不时地挥舞着，因快感而竖起，因为" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "挑逗地滑过她阴茎的顶端" : "你在她流着口水的裂缝上摩擦") + "，让她的脊背一阵颤抖，脸颊泛起红晕。[pg]");
         outputText("你感觉到有什么东西在摩擦你，低头一看，发现黑发女孩把脸贴在你的[butt]上，双手在你的[hips]上上下游走，还轻轻拍了一下你的脸颊。当她湿滑的舌头顺着你的股沟向上舔舐，用唾液涂抹你的[asshole]时，一阵不由自主的颤抖顺着你的脊背蜿蜒而上。她的指尖掐进你臀部的肉里，" + (get_player().get_gender() == 2 ? "另一只手顺着你的[vagina]滑动，捏住并揉搓你的[clit]。" : "一根手指轻轻描摹着你脸颊的曲线，火花在它身后噼啪作响。") + "片刻之后，你离地一两英寸，一个蠕动的入侵者刺穿了你的屁股。她丰满的嘴唇像柔软的枕头一样压在你身上，一声闷笑在她的舌尖震动。当她戳刺你的内脏时，你的力量消失了，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "同时用她的重量将你拉倒" + (get_player().get_gender() == 2 ? "，让你被红发狐妖的阴茎刺穿。" : "，就在你被红发狐妖的阴茎刺穿时，她的舌头退缩了。湿滑的器官在她的阴茎根部滑动，紧紧收缩，你能感觉到它肿胀起来，静脉和隆起变得更加明显。") : "而在你最脆弱的时候，她将红发狐妖的两条尾巴扭成紧紧的一束，刺入你的" + (get_player().get_gender() == 2 ? "阴道。" : "屁股。")));
         get_player().cuntChange(24,true,true,false);
         outputText("[pg]");
         outputText("红发狐妖因快感而尖叫，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "当她跳动的肉棒刺穿你的" : "当她的尾巴无情地刺入你的") + (get_player().get_gender() == 2 ? "小穴" : "屁股") + "时，她的双手抬起，抓住金发狐妖的肩膀，热情地掐进去。夹在金发狐妖湿透的小穴、红发狐妖的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "阴茎" : "尾巴") + "和黑发狐妖旋转的舌头之间，你沉浸在如此的快感中，以至于你再也分不清来源。你的身体在三人放纵的猛攻下抽搐颤抖，臀部在激情的奇观中相互摩擦挤压。[pg]");
         outputText("你抓住金发狐妖匀称的臀部，开始在她湿滑的裂缝上摩擦，随着热浪席卷全身，你不知羞耻地呻吟着。她饥渴地舔着嘴唇，翻着白眼，在狂喜中呻吟，将快感发挥到极致，以挑逗她的妹妹们。她狡黠地笑着，举起一根食指，按在你的" + (get_player().get_gender() == 2 ? get_player().clitDescript() : "裸露的胯部") + "上，一团淡蓝色的火焰让一阵快感的火花穿过你的身体。[pg]");
         outputText("她不成熟地咯咯笑着，在挑逗和戏弄你的同时，画出一个小小的火焰图案。被压在金发女郎身下，红发女郎因快感而颤抖，拼命地将臀部向上顶向你，在纯粹的狂喜中，她的双手在姐姐的背上上下游走。[pg]");
         outputText("你越来越接近高潮，下半身的紧张感不断累积，让你因快感而颤抖。黑发女孩舌头性感的舔舐给了你最后的一推，你的肌肉在疯狂的高潮中收紧，用尽全力挤压着红发女郎的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "肉棒" : "尾巴") + "。" + (get_player().wetness() == 5 ? "一股粘稠的淫水从你的下体喷涌而出，浸湿了金发女郎和红发女郎。" : "") + "与此同时，你能感觉到红发女郎的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "肉棒" : "尾巴") + "开始在你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "中抽搐，她也处于高潮的边缘。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            outputText("[pg]金发女郎瞥了你一眼，将一根手指放在唇边，狡黠地笑着，她的一条尾巴滑落到红发女郎的臀部和你自己的臀部之间。金色的尾巴紧紧地缠绕在她偶尔抽搐的肉棒上，你期待的爆发性射精并没有到来。红发女郎的脸扭曲成痛苦的表情，她肉棒的根部肿胀着，精液痛苦地积聚在姐姐的尾巴后面。金发女郎只是咯咯地笑着，用指尖在红发女郎的额头上挑逗她，同时把尾巴勒得更紧。可怜的被虐待的红发女郎因渴望而颤抖，咬紧牙关呻吟着，因为她的高潮继续被拒绝，压力每秒都在增加。[pg]");
            outputText("带着苦笑，金发女郎终于把她从折磨中释放出来，她肉棒上厚厚的凸起几乎立刻就穿过了她的阴茎，像咸咸的奶油洪水一样喷发到你的子宫里。充满活力的冲击让你脊背发凉，因为它无情地涌入你的" + (get_player().get_gender() == 2 ? "子宫" : "内脏") + "，导致你的腹部肿胀并向外冒泡。它慢慢膨胀，长成一个晃荡的、充血的肚子，大小和比例与西瓜差不多。在感觉像永恒之后，女孩的高潮开始消退，她奇妙地在金发女郎的重压下崩溃，溅起水花。你紧随其后，疲惫地向前瘫倒在金发女郎的胸前。[pg]");
            outputText("黑发女孩滑动的舌头缠绕在红发女郎变软的肉棒根部，伴随着“噗！”的一声，把它从你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "中拔了出来。" + (get_player().get_gender() == 2 ? "一股精液开始从你被虐待的小穴中溢出，涌过红发女郎的腹股沟，蔓延到水中。随着黑发女孩舌头的介入，水流很快被止住了，她柔软的嘴唇紧贴着你的小穴，饥渴地吸吮着喷涌而出的精液。她大声而贪婪地吞咽着，用拇指撑开你的阴唇，吞下每一口美味的咸味，她的胃肿胀颤抖着，而你自己过饱的腹部也开始同样地瘪下去。" : "当她的肉棒滑出时，一股精液开始从你被虐待的屁股中溢出，涌过红发女郎的腹股沟，蔓延到水中，最终缓解了你腹部的压力。") + "[pg]");
            outputText("随着你肌肉的每一次抽搐和痉挛，你感觉到你的力量在每一次痉挛中流失，你的眼皮因为一种不寻常的疲惫而变得沉重。[pg]");
         }
         else
         {
            outputText("[pg]你们四个人在似乎是永恒的快感浪潮中度过，在狂喜中呻吟着，互相摩擦着。当你在尾巴和肉体的海洋中被抛来抛去时，冷却的火焰在你赤裸的身体上劈啪作响，空气中充满了高潮释放的声音和气味。终于，快感开始消退，你和三个女孩一起倒下，疲惫地瘫倒在金发女孩的胸前。[pg]");
            outputText("你肌肉的每一次残余抽搐和痉挛都让你感到比以往任何时候都更加疲劳，力量随着每一次痉挛从你身上溜走，你的眼皮因为一种不寻常的疲惫而变得沉重。[pg]");
         }
         doNext(genderlessKitsuneStillHungry);
      }
      
      public function kitsunesGenderlessLetHer(param1:Boolean) : void
      {
         clearOutput();
         kitsuneSprite();
         outputText((param1 ? "你决定让这个女孩尽情玩乐，任由她变换姿势，开始急切地用她那跳动的肉棒摩擦你的" + (get_player().get_gender() == 2 ? get_player().vaginaDescript() : "平坦的腹股沟") + "。" : "你迟缓地摇了摇头，但你含糊不清的抗议被当成了耳旁风。当你试图推开她时，她轻松地避开了你的[leg]，滑步上前，在你的脸颊上印下一个令人解除武装的吻。一缕明亮的蓝色火焰从她的唇间噼啪作响，就这样——随之而来的快感火花顺着你的脊椎蔓延，击碎了你最后的抵抗，你的顾虑像黄油一样融化了。") + " 当她缓慢地用她那跳动的肉棒摩擦你时，她的姐妹们也围拢过来，加入了这场狂欢。[pg]");
         outputText("你的头被拉进了金发女孩的腿上，手指轻柔地滑过" + (get_player().hair.length > 0 ? "你的" + get_player().hairDescript() : "你的脸颊两侧") + "，用她神秘的火焰轻轻拂过你。一对印有太阳形状纹身的大而匀称的屁股进入了你的视野，很快你的视线就被黑发女孩宽阔的臀部完全遮挡，只剩下一丝光线从她和金发女孩之间透下来。她湿润的小穴滑过你的嘴唇，引诱你的舌头伸出嘴外。她弯下腰，将红发女孩的阴茎拉进嘴里片刻，涂满唾液，然后用她的食指和中指分开你的" + (get_player().get_gender() == 2 ? "阴唇" : "屁股") + "，怂恿着她。[pg]");
         outputText("红发女孩毫不迟疑地接受了邀请，一记猛刺刺穿了你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "。她粗壮的肉棒刺入了你等待的洞口，带来了一种独特的、令人兴奋的刺痛感。她的双手环抱住你的[hips]，开始肆意地抽插，伴随着夸张的呻吟声，她的乳房随着臀部的每一次挺动而前后摇晃，尽情享受着快感。");
         if(get_player().get_gender() >= 2)
         {
            get_player().cuntChange(14,true,true,false);
         }
         else
         {
            get_player().buttChange(14,true,true,false);
         }
         outputText("[pg]");
         outputText("你头下柔软的大腿滑开，取而代之的是一层厚厚的金色尾巴，而你视野中仅存的部分很快就被另一对颤抖的臀瓣遮蔽了，她紧贴着她姐妹的臀部，试图把自己也挤到你的嘴边。她们臀部的尺寸使得找到一个舒适的姿势相当困难，两人最终为了争夺你蠕动的舌头而互相推搡着。[pg]");
         outputText("当你感觉到一对金色的尾巴滑过黑发女孩的腿时，胜负已分，一声惊讶的尖叫宣告了尾巴插入了女孩的屁股和小穴。金发女孩带着傲慢的笑容就位，她的尾巴交替着在姐妹的洞里抽插，同时热情地骑在你的脸上，抚摸着你的头顶。[pg]");
         outputText("当她的内脏被姐妹的尾巴猛击时，饥渴的黑发女孩顺着你的身体爬下来，把头低到你的腹股沟，让她的舌头滑出，绕在红发女孩的肉棒上。它缠绕在根部，扭曲并紧紧勒住，充当着阴茎环的作用。随着血液泵入她的肉棒并被困住，它肿胀起来，粗大的肉棱和静脉变得更加明显，刺激着你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "，让你达到更高层次的狂喜。[pg]");
         outputText("你的舌头在金发女孩的小穴里旋转扭动，引出一波又一波咸甜的淫液。芳香的汁液喷在你的舌头和脸上，你的呻吟声被她压下来的柔软脸颊的重量所掩盖。她很体贴，每隔一会儿就给你留出呼吸的空间，轻轻地向后摇晃臀部，低头看着你的眼睛，她的表情介于溺爱的母亲和施虐狂之间。她的臀部再次压在你的嘴唇上，恢复了热情的研磨，大腿夹紧了你的头部两侧。[pg]");
         outputText("红发女孩的臀部有节奏地撞击着你的臀部，速度越来越快，她的舌头淫荡地伸出嘴外。她粗大的肉棒一次又一次地刺穿你，每一次抽插都伴随着发情的红发女孩更加狂喜的呻吟。她的姐妹们与她齐声呻吟，仿佛在从她野兽般的欲望中汲取养分来助长她们自己的情欲，而当你的忍耐力被拉伸到极限时，似乎你们所有人都会一起跨过那条线。[pg]");
         outputText("红发女郎的肉棒根部因为积聚了大量的精液而肿胀起来，就堵在她妹妹的舌头后面。她又在你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "里抽插了一次、两次、三次，然后黑发女孩松开了紧紧缠绕在肉棒根部的舌头，虽然很难说这是她自愿的，还是因为她下体咆哮着的高潮导致的。你只有一瞬间的时间来思考这个问题，随后一股令人酥麻的精液涌入你的" + (get_player().get_gender() == 2 ? "子宫" : "肠道") + "，让你浑身颤抖。唾液和爱液如河流般流淌，金发女郎湿透的小穴浸湿了你的脸，她的花径颤抖着，紧紧挤压着你的舌头。黑发女郎开始向上升起，被你不断膨胀的腹部顶起，她在狂喜中抽搐着，金发女郎的尾巴深深地埋在她的穴里。[pg]");
         outputText("当你们四个人在快感的浪潮中起伏时，充满激情的呻吟声充满了空气，在感觉像是过了一个世纪之后，你们终于在狂喜中一起瘫倒。你肌肉的每一次抽搐都让你感到更加疲惫，你的眼皮感觉像是有千斤重。" + (get_player().get_gender() == 3 ? " 一股精液开始从你被蹂躏的小穴中溢出，涌过红发女郎的腹股沟，蔓延到水中。黑发女孩的舌头很快就阻止了精液的流淌，她丰满的嘴唇紧紧贴着你的小穴，饥渴地吸吮着涌出的精液。她大声而贪婪地吞咽着，用拇指拨开你的阴唇，吞下每一滴美味的咸味汁液，她的肚子肿胀颤抖着，而你过度饱满的腹部也开始同样程度地瘪下去。" : "") + " 双手放在你" + (get_player().get_gender() == 0 ? "肿胀的" : "瘪下去的") + "肚子上，你开始屈服于疲惫，你的力量消退，一种罕见的疲惫感席卷了你。[pg]");
         doNext(genderlessKitsuneStillHungry);
      }
      
      public function kitsuneTouchTailBadEnd() : void
      {
         clearOutput();
         rawOutputText("你惊醒过来，当你看到你是一个人时，一声尖叫死在你的嘴唇上。你意识到，你真的是一个人，没有狐妖在你视野边缘跳舞是非常受欢迎的。你转来转去，但你周围真的什么都没有。你唯一能听到的声音是风轻轻吹过树叶的声音。");
         rawOutputText("\n\n你松了一口气。");
         rawOutputText("\n\n但随后你身后传来咯咯的笑声。");
         outputText("[pg]你转过身，一只狐妖在那里。很多狐妖。多得你数不清。她们的尾巴在你面前旋转和拂动空气，即使你诅咒自己，你也无法阻止你的手徒劳地抓住残酷的幻影。");
         outputText("[pg]你向前踉跄，不再能正确地看到你的周围环境。一切都是尾巴、耳朵和假笑。你头晕目眩，似乎无法再次站稳脚跟。你所能做的就是徒劳地向前爬行，被你面前的幻影引导，绝望，丧失亲人。当你意识到你永远不会触摸它们，永远不会再触摸它们时，眼泪从你的眼睛里流出来。");
         get_player().removeStatusEffect(StatusEffects.kitsuneVision);
         outputText("[pg][b: 在一切消失在黑暗中之前，你感觉到的最后一件事是温暖、舒适的绒毛。]");
         get_game().gameOver();
      }
      
      public function kitsuneTouchTail2() : void
      {
         clearOutput();
         outputText("你醒了。你躺在你睡着的同一个地方，但狐妖似乎在某个时候溜走了。这真的是一个当之无愧的午睡，当你伸展僵硬的四肢时，你想。");
         outputText("[pg]拍拍你的人，你发现一切都在它适当的位置——似乎那只调皮的狐狸很享受这一切，不再对你玩任何把戏。你带着微笑出发去营地，她温暖皮毛的残余感觉仍然萦绕在你的手上。");
         get_combat().cleanupAfterCombat();
      }
      
      public function kitsuneTouchTail() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.kitsuneVision))
         {
            rawOutputText("你现在已经陷得太深了，没有什么能阻止你这样做。也许你本该更小心一点，但当你盯着她那六条摇摆的尾巴时，你知道事情注定会变成这样。");
         }
         outputText("[pg]你告诉狐妖你只想要一样东西，并毫不掩饰兴奋地瞥了一眼她的臀部。她的眼睛闪烁着，急切地顺从了你的欲望，转过身来，将臀部向后挺起，方便你进入。");
         outputText("[pg][say: 嗯，我喜欢他们这么直接……]");
         outputText("[pg]你的[hands]靠近了你的战利品，你几乎因为期待而流汗。它就在你面前，诱惑着你，乞求着被触摸。你几乎要流口水了。");
         outputText("[pg][say: 好了，别逗我了，我——咦？]");
         outputText("[pg]你抓住了一条尾巴。现在只有一条，这是你目前能应付的极限。它柔软的皮毛在你的[if (hasfur) {own|[skindesc]}]上感觉像天堂一样，你在尝试抚摸它之前花了一些时间来适应。你先给它一次长长、缓慢的抚摸，只是为了感受一下她的绒毛。");
         outputText("[pg][say: 嗯……你没事吧？难道没有——啊-啊！]");
         outputText("[pg]当你更坚定地在她的绒毛尾巴上上下滑动手指时，狐妖继续发出轻微的呻吟。在你专业的对待下，她的抱怨完全停止了，你因此变得非常大胆。事实上，你如此大胆，以至于你偷偷地将一只手稍微向前滑动了一点。");
         outputText("[pg][say: 嗯嗯——你-你-你确定你知道你在——哦哦哦……]");
         outputText("[pg]同时两条——！一开始的震惊几乎让人难以承受，但你克服了敬畏，继续前进，开始移动。狐娘在你的手中就像腻子一样，你像天生的一样挥舞着她的尾巴，她的手向前倒在附近的树干上以寻求支撑。当你贪婪的眼睛已经开始打量第三条时，你必须克制自己。");
         outputText("[pg]你几乎不敢相信她的皮毛这么柔软——这是某种魔法吗？不应该有这种感觉，但你在这里，她丝滑的皮毛任你索取。你气喘吁吁地靠过去，把脸颊贴在上面，立刻因为这种感觉而不由自主地叹了口气。你没想到在这个凡人领域存在这样的乐趣。");
         if(get_player().hasStatusEffect(StatusEffects.kitsuneVision))
         {
            rawOutputText("\n\n但对于一个[manboy]来说，这只狐妖实在太过了，你最终屈服于现在充满你混乱大脑的绒毛。尾巴在你视野的每个角落有节奏地摇摆，如果不是因为它们皮毛的柔软感觉，你将无法将真实的尾巴与所有的幻影区分开来。柔软迷人的感觉很快将你向下拉，向下拉，直到你倒在森林的地面上，绒毛像烟雾一样从你的手中飘走。");
            addNextButton("继续",kitsuneTouchTailBadEnd).hint("");
         }
         else
         {
            outputText("[pg]但这几乎让你太兴奋了；你需要在被淹没之前放松一下。幸运的是，你确切地知道该怎么做，轻轻地将几乎失去知觉的狐狸和你一起拖到森林的地面上。在这一点上，她似乎并不介意让你随心所欲，所以你充分利用了这个机会。");
            outputText("[pg]你温柔地将疲惫的头靠在狐妖的尾巴上，它们的绒毛立刻包裹了你。一缕散落的皮毛稍微痒痒了你的[ear]，但你很快找到了一个舒适的姿势，依偎在她的温暖中，叹了口气。这比你在营地里能梦想到的任何床都要好得多，你发现自己越来越困了。");
            outputText("[pg]没过多久你就开始打瞌睡了。");
            doNext(kitsuneTouchTail2);
         }
         dynStats(DynStat.Lib(1),DynStat.Lust(10));
      }
      
      public function kitsuneTitjobWin() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("当你打量着狐妖少女那充满活力的身体——已经成熟可以采摘了——你忍不住对脑海中涌现的想法咧嘴笑了起来。她注意到你在色眯眯地盯着她；伴随着一声窃笑和一个会意的笑容，她的尾巴开始缠绕在她的身体上，完美地勾勒出她的曲线和傲人的胸部。");
         outputText("[pg][say: 那么，" + get_player().mf("boy","lover") + "，你是满足于就这么站着——还是打算来领取你的奖品呢？] 她不用问第二遍。你毫不犹豫地脱下衣服，任由装备掉在地上。你短暂地思考了一下要如何享用你的奖品，但在你付诸行动之前，她已经先发制人，显然替你做出了决定。");
         outputText("[pg][say: 你真是个强大的勇者，] 她发出满足的呼噜声。她坐起身，褪下和服，苍白的乳房随之弹跳而出，随着她的每一个动作淫荡地晃动着。她的双手顺着你的胸膛滑下，将身体紧贴着你，一边在你身上印下轻柔的吻，一边向你那跳动的阴茎移动。你很好奇这个被击败的诱惑者会做些什么，于是没有试图阻止她。[say: 多么淫荡的气味啊，] 她轻笑着评论道。她抓住你的肉棒，深吸了一口气，眼睛闪闪发光地抬头看着你。她开始轻轻地抚摸你，同时沿着你的肉棒印下温柔的吻，从根部一直吻到顶端。");
         outputText("[pg]你轻哼了一声，对她的挑逗越来越不耐烦——你甚至有点想抓住她的头发，把肉棒塞进她的喉咙里。仿佛感觉到了这一点，她发出一声满意的轻哼，舔了舔嘴唇，在你的龟头上印下最后一吻。她张大嘴巴，一口吞下了你半根肉棒。你叹了口气，享受着她喉咙的温暖，她逐渐吞没每一寸，一直到根部。当她吞咽你的时候，她也不忘关照你的[if (hasBalls) {睾丸，她柔软的双手灵巧地揉捏按摩着你饱满的球体|会阴}]。她的按摩伴随着指尖上冷却的蓝色火焰带来的轻微瘙痒感，因为她对你施加了附魔；[if (hasBalls) {你的睾丸感觉更重了，就好像你几天没射过一样，而且}]你原本就肿胀的肉棒感觉比以前更硬了。");
         outputText("[pg]你呻吟着，向前挺动臀部，试图操弄这个有着[monster.hair]头发的美女的脸。每次你试图从她的喉咙里拔出来，她都会把脸往前凑，把你重新锁住。每次她的嘴唇回到你的根部，你都能感觉到她的喉咙在你的肉棒周围震动，因为她在笑。你既厌倦了她的挑衅，又想教训她一下，因为她竟敢挑逗战斗的胜利者，于是你伸手下去，开始反过来挑逗她。你抓住了手能碰到的第一样东西——她毛茸茸的耳朵。你立刻得到了回报：她的身体僵住了，尾巴变得僵硬，然后任性地搅动着。你咧嘴一笑，继续抓住她的耳朵，把肉棒从她的喉咙里拔出来，享受着龟头擦过她嘴唇的感觉。");
         outputText("[pg]你短暂地端详了一下她的脸——她紧闭着双眼，脸上泛起淡淡的红晕。你轻轻地开始按摩她毛茸茸的狐狸耳朵，引出一声长长的呜咽，加深了她的红晕。[say: 不-不，不要——] 她结结巴巴地说，她的抗议被轻轻的一捏打断了。[say: 不~……停下……很-很敏感……]");
         outputText("[pg]现在轮到你偷笑了——她楚楚可怜地哀求着，就像个初尝禁果的女学生。看来你找到了她的弱点。虽然你很享受戏弄这只狐狸精，但你还不满足——你[if (hasBalls) {那胀满精液的睾丸}]渴望释放。你把狐妖拉上前，将你的肉棒滑入她的双乳之间。");
         outputText("[pg]你停止了按摩，故意哼了一声，示意她开始，免得你再挠她的耳朵。她抬头看着你，对你暗示的威胁撅起嘴，但还是热情地将双乳挤在一起。你那沾满唾液的肉棒很快就被她柔软的乳房包裹住，随着她缓慢地上下套弄，胸前的两团软肉温柔地按摩着它。她的尾巴仿佛有了自己的意识，在她动作时开始盘绕并缠住你，在空气和你们两人的身体上拖曳出蓝色的火焰。她用乳房在你的肉棒上稳稳地上下套弄了一会儿，然后俯下身，将你的龟头含入嘴里。她的舌头急切地在你的顶端打转起舞，舔舐着你的前列腺液，并淫荡地戳弄着你的尿道。她在服侍的过程中哼唱着，似乎在低声吟唱，你开始感觉到她尾巴在你身上画出的蓝色火焰轨迹中涌动着一股力量，让你感到阵阵刺痛。");
         outputText("[pg]你几乎觉得有必要再挠挠她的耳朵来惩罚她，但你[if (hasBalls) {睾丸|核心}]中不断膨胀的快感阻止了你。她的舌头缠绕着你的肉棒，一边吸吮舔舐一边呻吟。她显然能感觉到你在她双乳间跳动，于是她迅速加快了节奏，随着你高潮的临近，你发出了沉重的呻吟。她显然很享受她的魔法带来的效果，也许是对她耳朵的一点报复；不过，你现在可没资格抱怨，因为第一股精液从你的肉棒中喷射而出，化作长长的绳状射流，溅落在她的脸上。她咯咯地笑着，张开嘴用舌头接住你的精液，你挺动的臀部随着你[if (hasBalls) {睾丸|肉棒}]的每一次跳动，稳定地射出精液。");
         outputText("[pg]当她继续用乳房套弄你的肉棒，伴随着淫荡的呻吟和温柔的双手将精液从你体内榨出时，你的大脑已经迷失在快感中。她急切地用你的精液弄脏自己，精液均匀地涂满了她的脸和乳房；她的魔法强化只会增加你目前涂抹在她身上的精液量。[say: 真是完美的量，]她娇嗔道。她将你的肉棒从她浸满精液的双乳间滑出，舔了舔手指，对自己感到很满意。[say: 我想这是个合适的奖励吧，最英勇的勇者？]即使跪在地上，浑身沾满精液，她也忍不住要戏弄你。");
         outputText("[pg]你大口喘着粗气，你的肉棒随着每一次呼吸而疲软。你告诉她这还不够，她得意地笑了，以为你还有更多淫荡的惩罚等着她，好让她从你身上榨取更多的精液。当你伸手抓住她的耳朵时，她瞪大了眼睛；当你毫不留情地揉搓她敏感的器官时，她尖叫起来，随着你灵巧的触摸让她的头皮一阵阵发抖，她的抵抗也随之瓦解。");
         outputText("[pg]你很快就把她弄得浑身发抖、口水直流，甚至连微弱的抗议都发不出来，不过你也不确定她现在是否真的想让你停下来。她看起来非常享受，她的尾巴疯狂地缠绕在一起，夕阳红的脸上挂着傻乎乎的笑容。确实是个弱点。当你用拇指沿着她耳朵内缘向上摩擦时，她突然像个荡妇一样呻吟起来，带着炽热的激情将大腿并拢，而为了展示仁慈——或者可能是残忍——你突然放开了她。她瘫倒在柔软的森林地面上，喘着粗气，而你则收拾好装备，把这个失去知觉的狐妖留在身后。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function kitsuneStillHungryMansion() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("就在你即将失去意识的时候，你感觉到狐妖将你从她姐姐的怀抱中拉了出来，让你平躺在地上，然后低头俯身在你上方，这感觉让你清醒了过来。[pg]");
         outputText("[say:还是好饿……]她轻声说道，轻轻地揉着她胖乎乎的肚子，发出一阵轻微的咕噜声。[pg]");
         outputText((get_player().balls > 0 ? "她摊开掌心向上，双手搓揉了片刻，然后轻轻吹了一口气。伴随着一阵清脆的噼啪声，一团明亮的蓝色火焰在她的手中燃烧起来，她将手掌按在你的[balls]上，温柔地按摩着。" : "她伸出食指和中指，伴随着一阵清脆的噼啪声，一团明亮的蓝色火焰在她的指尖燃烧起来。还没等你抗议，你的[butt]就被她那带着火焰的手指侵入了，坚持不懈地按压着你的前列腺。") + " 随着她那神秘火焰带来的冰凉刺痛感蔓延过你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "，你能感觉到一股紧绷的压力正在积聚，快感流遍全身，你那耗尽的精液储备奇迹般地开始补充，你那疲软的" + get_player().cockDescript(get_player().biggestCockIndex()) + "瞬间恢复了活力，做好了准备！[pg]");
         outputText("你坚如磐石的肉棒立刻被女孩柔软的双乳包裹，龟头被她温暖口腔的湿润牢笼困住。一条长得不可思议的舌头从女孩嘴里滑出，将唾液涂抹在你肿胀的肉棒上，并紧紧地缠绕着它。她那粉嫩丰满的嘴唇带着性感的吸吮抚摸着你的" + get_player().cockHead(get_player().biggestCockIndex()) + "，将你向内吸入，并娇柔地轻咬着那里的嫩肉。[pg]");
         outputText((get_player().biggestCockArea() < 70 ? "她一口吞下了你的肉棒，嘴唇一路滑到根部，温暖的喉咙包裹着你，轻轻地挤压着。" : "她尽可能地把你的肉棒含进嘴里，喉咙在你的龟头周围拉伸，把它吸进去。当她再也吞不下时，她停下来通过鼻子稳定呼吸，然后满足地叹了口气。") + " 她的眼睛愉快地翻白，抬头看了你一眼，嘴角勾起一抹狡黠的笑意，舌头仍然卷在你的硬挺肉棒上，就在她嘴唇的边缘。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            outputText("红发女孩走过来加入这场狂欢，轻轻拍了拍她妹妹的屁股，你的肉棒随之传来一阵颤抖的呻吟。她的肉棒滑入那个丰满的黑发女孩宽大的臀部之间，然后猛地一挺，插入了她湿透的小穴。每次她向前挺进，黑发女孩都会发出愉悦的呻吟，她的喉咙美妙地紧紧夹住你的肉棒。当她被姐姐粗暴对待时，口水开始顺着她的下巴滑落，她的头在你的肉棒上前后摆动，胸部紧紧挤压着它。[pg]");
         }
         else
         {
            outputText("当红发女孩滑到你身边时，手指轻柔地划过你的[chest]，指尖在环绕你的[nipple]时擦出火花，引出一声呻吟。她的身体柔软地贴着你，一条腿搭在你的腰上，她低下头，开始用舌头舔舐你乳头的边缘。[pg]");
         }
         outputText("你突然感觉到一双手温柔地抚摸着你的头部两侧，随后你的视线被一对形状优美的臀部遮挡，上面有一个新月形的纹身，在你的头顶诱人地晃动，然后向你的脸部降下。金发女孩的小穴亲吻着你的嘴唇，甜美、麝香般的气味充满了你的鼻子，而她的双手充满爱意地抚摸着你的头顶，轻柔地将你拉向她的胯部。她的臀部在你的脸上前后滚动，每次动作她丰满的屁股都会晃动和颤抖，她将湿透的小穴在你的嘴唇上摩擦。[pg]");
         outputText("由于刚刚经历的令人兴奋的狂欢，你仍然过度敏感，你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "开始在黑发女孩的喉咙里兴奋地跳动和抽搐，已经被推到了你忍耐的极限。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            outputText("红发女孩的臀部一次又一次地拍打着她妹妹的屁股，将她压在你的肉棒上，发出一声响亮的、作呕的吞咽声。黑发女孩的喉咙在你的肉棒上湿润地起伏着，随着红发女孩将手指深深陷入她宽大的臀肉中，她翻着白眼，发出淫秽的呻吟声，喉咙深处也随之震动。当红发女孩释放出如洪流般的精液时，空气中充满了液体咕噜咕噜的声音，黑发女孩的肚子也慢慢地鼓了起来。随着时间的推移，她围绕着你肉棒的呻吟声越来越大，双手用力地抚摸着你肉棒上没有被她喉咙吞没的部分。[pg]");
         }
         outputText("[say: 射给……]她呻吟着，由于你肿胀的肉棒塞在嘴里，她的话语含糊不清。[pg]");
         outputText("一团蓝色火焰在你的肉棒根部燃起，迫使你不得不服从。一种不自然的压力开始充满你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "，这肯定是狐妖之前施展的巫术所致。你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "根部肿胀起来，粗大的凸起慢慢地顺着你的肉棒向上移动，强行挤过她丰满粉嫩的嘴唇。你的大脑一片空白，眼前冒出白色的斑点，你高潮般地呻吟着，将舌头深深地插进金发女孩咸咸的小穴里。一升又一升的精液，比你以前产生的任何精液都要浓稠、更具活力，开始流入黑发狐妖的喉咙，被她毫不犹豫地贪婪吞下。两股水流从她的鼻子里喷涌而出，她的脸颊因精液而鼓起，嘴唇紧紧地闭着，尽可能多地含住精液，而她的肚子则随着重量的增加而继续晃动，随着越来越多的精液流入她的喉咙，肚子发出咕噜咕噜的声音并颤抖着。[pg]");
         outputText("一股粘稠的淫液喷在你的脸上，顺着你的下巴滴落，金发女孩在你之后不久也达到了高潮，你们四个人一起在快感的浪潮中沉浸了仿佛几个世纪之久。每一秒过去，你都感到越来越疲惫，眼皮越来越沉重，肌肉也变得无力。[pg]");
         outputText("在经历了这场折磨后，你筋疲力尽地陷入了幸福的昏迷中，只隐约感觉到自己被拖到了甲板上。在失去知觉之前，你记得的最后一件事是三姐妹爬到你身边，用她们的魔法再次唤醒你已经射过两次的阴茎，眼中闪烁着饥渴的光芒。");
         get_player().orgasm("Dick");
         outro();
      }
      
      public function kitsuneStatueYes() : void
      {
         clearOutput();
         var _loc1_:String = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2012) > 0 ? "desk" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) > 0 ? "bookshelf" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2009) > 0 ? "table" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2007) > 0 ? "nightstand" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2008) > 0 ? "dresser" : "corner"))));
         saveContent.statueLocation = _loc1_;
         outputText("[pg]" + (saveContent.statueLocation == "corner" ? "找不到其他地方放，你只好把雕像放在卧室的角落里。虽然这可能不是什么高贵的地方，但总比你发现它的那个破烂棚子好。" : "你环顾四周，寻找放置它的最佳位置，最后决定把它放在你的" + saveContent.statueLocation + "上。毕竟你费了那么大劲才偷到它，不妨好好炫耀一番。"));
         doNext(playerMenu);
      }
      
      public function kitsuneStatueNo() : void
      {
         outputText("[pg]不，把它展示出来就是招人偷——正如它的前任主人已经了解到的那样。对于这么贵重的东西，最安全的地方是你的[inv]。");
         get_inventory().returnItemToInventory(get_useables().GLDSTAT);
      }
      
      public function kitsuneStatue() : void
      {
         outputText("你拿出金雕像，在手里转了几圈，仔细检查着覆盖在精美神像上的复杂金银丝细工和铭文。无论谁制作了这个，肯定在他们的手艺上投入了大量的时间和心血。" + (get_player().cor < 50 ? " 检查着它煞费苦心的细节，你对把它从它应在的地方偷走感到一丝内疚。你把这些想法推开，推断它不会被想念——毕竟，主人在你到达之前很久就已经离开了。" : "") + "[pg]");
         outputText("除了装饰之外，它对你没有太大用处，但仅凭工艺，你判断如果你把它当掉，你可以卖个好价钱。");
         if(!get_game().get_inCombat() && !get_game().inDungeon && get_camp().get_builtCabin())
         {
            outputText("[pg]你要把它摆在你的[cabin]里吗？");
            doYesNo(kitsuneStatueYes,kitsuneStatueNo);
         }
         else
         {
            get_inventory().returnItemToInventory(get_useables().GLDSTAT);
         }
      }
      
      public function kitsuneSprite() : void
      {
         if(get_monster().hair.color == "blonde")
         {
            spriteSelect(SpriteDb.get_s_kitsune_blonde());
         }
         else if(get_monster().hair.color == "black")
         {
            spriteSelect(SpriteDb.get_s_kitsune_black());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_kitsune_red());
         }
      }
      
      public function kitsuneShrine() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,708) == 0)
         {
            outputText("今天，你的旅途带你走上了一条蜿蜒穿过森林的小路，深入树林腹地。你迈出的每一步都让你感觉茂密的树叶正在逼近，粗糙的泥土小路在前方几乎消失殆尽。无论这条小路很久以前是用来做什么的，现在它都处于被荒野重新占领的晚期。[pg]");
            outputText("虽然你很清楚这片土地的危险，但你很好奇这片森林里可能隐藏着什么秘密。你继续前进，在杂草丛生的小路上跋涉，在前进的过程中尽最大努力保持清醒。[pg]");
            outputText("你从茂密的树叶中走出来，进入了一片开阔的空地。你的目光立刻被中央一棵大得离谱的树吸引住了，它风化的树干上布满了树结和疙瘩。一些树枝上挂着奇怪的纸符，在没有风的情况下诡异地摇曳着。破旧的石板路绕过这棵古老的树，通向一座破旧的木制小建筑，如果它不是处于如此破旧的状态，看起来它可以舒适地容纳一个人。[pg]");
            outputText("你大声呼喊，但这个地方似乎被废弃了。你耸耸肩，决定在建筑周围看看，把一根腐烂的木材从门前搬开，小心翼翼地溜进去，以防你真的不是一个人。[pg]");
            outputText("你的眼睛花了一点时间才适应发霉棚屋里昏暗的光线，但你最终开始拼凑出一个简单住所的轮廓。一个旧铺盖卷放在一个角落里，各种各样的烹饪工具小心翼翼地挂在一个小火坑上。在这个单间建筑的后部供奉着一个小基座，上面矗立着一个雌雄同体的九尾金像。不远处有一个书架，里面装满了发霉的书籍和各种形状和大小的卷轴。[pg]");
            outputText("从所有东西上覆盖的灰尘来看，住在这里的人已经很久没有回来过了。你确信他们不会介意你拿走一些书——你也许能学到一两样东西。那座金雕像也很诱人，但另一方面，它似乎具有某种精神上的意义——把它从原本的位置偷走可能不是个明智的主意。当然，你也可以试着向它祈祷。");
         }
         else
         {
            outputText("你再次找到了那座废弃的狐妖神社。这个地方到处都是腐烂的木头，但它有一个装满保存完好的书籍的书架。这里还有营地的遗迹，尽管主人奇怪地不在。从所有东西上覆盖的灰尘来看，住在这里的人已经很久没有回来过了。你确信他们不会介意你拿走一些书——你也许能学到一两样东西。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,708,FlagDict_Impl_.arrayReadInt(_loc1_,708) + 1);
         menu();
         addButton(0,"读书",readKitsuneBooks);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,709) == 0)
         {
            addButton(1,"冥想",meditateLikeAKitsuneEhQuestionMark);
         }
         if(get_player().hasItem(get_useables().GLDSTAT) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,709) == 0)
         {
            addButton(2,"雕像",stealAStatue);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,709) == 0)
         {
            addNextButton("捐献",donation).hint("向神社捐献。");
         }
         setExitButton();
      }
      
      public function kitsuneShoveHerMansion() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("尽管你醉得有些神志不清，但你还是足够清醒，及时意识到发生了什么并阻止了她。你用手臂推开她的胸膛，她失去平衡跌入水中，激起一片水花。她带着喧闹的叫声冲出水面，在热气腾腾的温泉中与你扭打时，不小心把她的姐妹们也撞倒了。那两个受惊的女孩笑着捂住眼睛，而你们在水里翻滚，将热腾腾的水花抛向空中。当翻腾的水波终于平息下来时，你已经用手肘将那个喧闹的红发女孩按在浴池边，[eachCock]淫荡地摩擦着她高高撅起的柔软臀瓣。她挣扎了一会儿，但一旦她接受了你已经制服她的事实，她就慢慢放松下来，进入了一种顺从的状态，肌肉松弛，耳朵也耷拉在头顶上。[pg]");
         outputText("[say: 好-好吧……] 她小声说道，当你挠她耳后并用手指强迫性地滑过她的脸颊时，她舒服地翻了翻白眼。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "" : " 伸手到她的双腿之间，当你感觉到她的肉棒慢慢退去，缩小成她肿胀的阴唇之间一个挺拔、坚实的快感芽时，你满意地点了点头。") + "[pg]");
         outputText("你对这只失望的狐妖稍微放宽了些，手指顺着她赤裸的背部滑下，看着她在愉悦的折磨中颤抖。在她的尾根处轻轻一挠，击溃了她最后的防线，她伴随着一声颤抖的叹息，瘫倒在池边的木甲板上。她的姐妹们再次靠近，用她们的尾巴蹭着你赤裸的身体，指尖闪烁着火花，轻轻划过你的[skin]。");
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0)
         {
            get_player().orgasm("Dick");
            outputText("[pg]金发女孩漫不经心地涉水走到红发女孩身边，将她宽大的臀部坐在姐妹的背上，向后靠去，嘴角挂着一抹傲慢的冷笑。可怜的红发女孩在她的重量下颤抖着，脸颊因为未被满足的需求而泛红，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 被冷落的肉棒低垂在水中，" : "") + " 尾巴在金发女孩的双腿间来回摆动，而这位亚麻色头发的狐娘则用一根手指引诱着你。金发女孩的一根尾巴缠绕住你" + get_player().cockDescript(get_player().biggestCockIndex()) + "的" + (get_player().hasSheath() ? "包皮" : "根部") + "，将它拉进那闪烁着深红与金色的交错之中，尽管毛茸茸的丛林遮挡了你的视线，但你能感觉到" + get_player().cockHead(get_player().biggestCockIndex()) + "正抵在金发女孩温暖诱人的小穴上。[pg]");
            outputText("她的尾巴缠绕并收紧在你的阴茎上，拉着你向前，伴随着湿润的吸溜声，你深深地插入了那等待着的褶皱中。" + (get_player().biggestCockArea() > 50 ? " 她的肉壁将你向内拉扯了很久，沿着你的长度性感地起伏着，她那深邃的阴道似乎没有尽头。虽然听起来可能不可思议，但她似乎打算将你全部吞下。" : "") + " 当你的臀部轻轻压在她的臀部上时，她满意地颤抖着，双腿张开并缠绕在你的[hips]上，尽可能地将你拉近" + (int(get_player().cocks.length) > 1 ? "，[eachCock]纠缠在红金相间的尾巴丛林中，它们挑逗地抚摸和挠痒着。" : "。") + " 红发女孩的尾巴偶尔挥舞着，随着你的" + (int(get_player().cocks.length) > 1 ? "阴茎们滑过" : "阴茎滑过") + "敏感的线圈，她因快感而竖起毛发，脊背发抖，脸颊泛起红晕。[pg]");
            outputText("你感觉到水里有什么东西蹭到了你的[legs]，低头一看，发现那个黑发女孩正挤在红发女孩的双腿之间，双手在她姐姐丰满的大腿上游走，还顺手在她的臀部上拍了一下。红发女孩发出一声惊呼，顺从地抬起臀部，一个愤怒的红色掌印在她颤动的臀瓣上显现出来，在她脸颊上那个巨大的星形纹身衬托下隐约可见。有了新的呼吸空间，黑发女孩抬起头，贴近她姐姐火热的胯部，开始热情地蹭着，她那柔软丰满的粉色嘴唇沿着" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "她肿胀肉棒的底部" : "她湿润的阴道裂缝") + "印下一连串的吻。[pg]");
            outputText("握住金发女孩匀称的臀部，你开始在她饥渴的肉缝中进进出出，她紧致火热的肉壁有节奏地挤压着你的阴茎，让你忍不住因为快感而毫无廉耻地呻吟出声。当她在红发女孩的背上被前后摇晃时，她那棉花糖般柔软的双乳在胸前晃荡拍打着，她的双臂向后弯曲，抓住甲板以作支撑。她饥渴地舔了舔嘴唇，翻着白眼，在狂喜中呻吟着，为了戏弄她的姐妹们，她把这种快感表现到了极致。就在你准备向后抽出的那一刻，她以极其熟练的时机用她那肌肉发达的小穴紧紧夹住你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "，像老虎钳一样死死封住你的肉棒，以至于空气中响起了一声清晰可闻的“吧唧”水声。[pg]");
            outputText("她对这淫秽的声音发出不成熟的咯咯笑声，用手捂住嘴，向你露出一个“谁，我吗？”的坏笑。她湿滑的小穴收缩着，熟练地伴随着吸溜声将你重新拉回体内，刺激你继续狂野地抽插。在下方，黑发女孩已经从挑逗性的舔舐进阶，开始" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "充满爱意地吸吮她姐姐的阴茎前端，饥渴地含着肉棒呻吟。" : "认真地舔舐她姐姐的阴唇之间，饥渴地对着她湿滑的小穴呻吟。") + "被夹在姐妹之间，红发女孩因快感而颤抖，将臀部向下磨蹭着饥渴的黑发女孩的脸" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "，伴随着呻吟将她的阴茎塞进她的喉咙。贪吃的女孩高兴地吞下它，粗大的肉棒穿过时她的喉咙鼓起，大声而饥渴地吞咽着。" : "，用力地将湿滑的淫液涂抹在饥渴的黑发女孩脸上。贪吃的女孩舔干每一滴，将她长长的舌头伸进湿滑的阴唇之间，用舌尖插入她。") + "[pg]");
            outputText("你越来越接近高潮，随着压力在你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "中不断积聚，你因快感而颤抖。当第一团浓稠的精液涌出，强行射入金发女郎毫无防备的子宫时，你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "的" + (get_player().hasSheath() ? "包皮" : "根部") + "向外凸起。");
            if(get_player().cumQ() <= 150)
            {
               outputText("几股充满活力的精液喷射进她的体内，用你浓稠的精液把她的通道涂得一塌糊涂。就在你的势头开始减弱时，你感觉到她金色的尾巴缠绕在你的根部，阻断了水流。你发出一声低沉的抗议，因为你的肉棒干涩地痉挛着，她肌肉发达的小穴伴随着一声响亮的“噗！”将你挤了出来。当你剩下的精液在她的尾巴后面痛苦地积聚时，她把一根手指放在嘴唇上，狡黠地看着你。还没等你弄明白是怎么回事，她的尾巴就引导着你跳动的肉棒向下，你感觉到自己插入了红发女孩的" + (get_player().biggestCockArea() > 80 ? "阴道！" : "毫无防备的肛门！") + "这个毫无防备的女孩呻吟着向前倾斜，与此同时，金发女孩松开了对你" + (get_player().hasSheath() ? "包皮" : "根部") + "的抓握，让你浓稠的精液自由地洒进她妹妹柔软的" + (get_player().biggestCockArea() > 80 ? "小穴。她的裂口" : "屁股。她的直肠") + "不由自主地挤压着你，她的脸上夹杂着震惊和高潮的快感。");
            }
            else if(get_player().cumQ() <= 350)
            {
               outputText("无数股水流喷射进她的体内，用你浓稠的精液把她的通道涂得一塌糊涂。她内部的肌肉贪婪地挤压着你，按摩着你的肉棒，把你的精液吸向她痉挛的子宫。就在你的势头开始减弱时，你感觉到她金色的尾巴缠绕在你的根部，阻断了水流。你发出一声低沉的抗议，因为你的肉棒干涩地痉挛着，她肌肉发达的小穴伴随着一声响亮的“噗！”将你挤了出来。当你剩下的精液在她的尾巴后面痛苦地积聚时，她把一根手指放在嘴唇上，狡黠地看着你。还没等你弄明白是怎么回事，她的尾巴就引导着你跳动的肉棒向下，你感觉到自己插入了红发女孩的" + (get_player().biggestCockArea() > 80 ? "阴道！" : "毫无防备的肛门！") + "这个毫无防备的女孩呻吟着向前倾斜，与此同时，金发女孩松开了对你" + (get_player().hasSheath() ? "包皮" : "根部") + "的抓握，让你浓稠的精液自由地洒进她妹妹柔软的" + (get_player().biggestCockArea() > 80 ? "小穴。她的裂口" : "屁股。她的直肠") + "不由自主地挤压着你，最后一股精液喷发进她的" + (get_player().biggestCockArea() > 80 ? "通道" : "肠道") + "，她的脸上夹杂着震惊和高潮的快感。");
            }
            else if(get_player().cumQ() <= 1000)
            {
               outputText("浓稠的精液如丝带般喷射进她的体内，将你强效的精华胡乱地涂抹在她的通道里。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，将你充满活力的种子吸向她抽搐的子宫，细小的水流从她的入口处凌乱地喷出，她的腹部开始因压力而隆起。就在你的高潮即将达到顶峰时，你感觉到她金色的尾巴缠绕在你的根部，阻断了水流。你发出一声低沉的抗议，你的肉棒干涩地痉挛着，她肌肉发达的小穴伴随着一声响亮的“噗”将你挤了出来！一股特别急切的精液设法逃脱，无力地顺着龟头滴落，当你剩余的精液在她的尾巴后面痛苦地积聚时，她将一根手指放在唇边，狡黠地看着你。还没等你弄明白发生了什么，她的尾巴就引导着你跳动的肉棒向下，你感觉到自己插入了红发女孩的" + (get_player().biggestCockArea() > 80 ? "阴道！" : "毫无防备的肛门！") + "毫无防备的女孩呻吟着向前倾斜，与此同时，金发女孩松开了对你" + (get_player().hasSheath() ? "包皮" : "根部") + "的抓握，让你自由地将精液洒进她妹妹柔软的" + (get_player().biggestCockArea() > 80 ? "小穴。她的裂口" : "屁股。她的直肠") + "不由自主地挤压着你，你甜腻的精液喷发进她的" + (get_player().biggestCockArea() > 80 ? "小穴并淹没了她的子宫" : "屁股并淹没了肠道") + "，她的脸上夹杂着震惊和高潮的快感，她的肚子开始微微隆起。");
            }
            else if(get_player().cumQ() <= 2500)
            {
               outputText("滚烫的精液喷溅进她的子宫，将你浓稠的精华涂抹在她身上。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，随着它一次又一次地充满活力的种子而肿胀，粗壮的水流从她的入口处喷出，她的肚子开始因压力而膨胀成一个摇晃的圆滚滚的肚子。在你高潮的顶峰，你感觉到她金色的尾巴缠绕在你的根部，阻断了水流。你发出一声低沉的抗议，你的肉棒勇敢地痉挛着，她肌肉发达的小穴伴随着一声响亮的“噗”将你挤了出来！你" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "里的压力太大了，她无法全部阻挡，许多加压的水流强行通过，在她身上留下了滚烫的精液。她张开嘴，高兴地用舌头接住了一股迷路的精液，然后将一根手指放在唇边，狡黠地看着你。还没等你弄明白发生了什么，她的尾巴就引导着你跳动的肉棒向下，你感觉到自己插入了红发女孩的" + (get_player().biggestCockArea() > 80 ? "阴道！" : "毫无防备的肛门！") + "毫无防备的女孩呻吟着向前倾斜，与此同时，金发女孩松开了对你" + (get_player().hasSheath() ? "包皮" : "根部") + "的抓握，让你自由地将精液洒进她妹妹柔软的" + (get_player().biggestCockArea() > 80 ? "小穴。她的裂口" : "屁股。她的直肠") + "不由自主地挤压着你，你甜腻的精液喷发进她的" + (get_player().biggestCockArea() > 80 ? "小穴并淹没了她的通道" : "屁股并淹没了她的肠道") + "，她的脸上夹杂着震惊和高潮的快感，她的肚子随着摇晃而膨胀，因为你精液的重量而低垂着。");
            }
            else if(get_player().cumQ() > 2500)
            {
               outputText("滚烫的精液如波浪般拍打着她的" + (get_player().biggestCockArea() > 80 ? "子宫颈" : "括约肌") + "，用你浓稠的精华淹没了她的" + (get_player().biggestCockArea() > 80 ? "子宫" : "肛门") + "。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，随着它一次又一次地充满活力的种子而肿胀，加压的水流从她的" + (get_player().biggestCockArea() > 80 ? "小穴" : "菊穴") + "喷出，她的腹部膨胀到一个淫秽的大小。在你高潮的顶峰，你感觉到她金色的尾巴缠绕在你的根部，徒劳地试图阻止水流。你发出一声低沉的抗议，你的肉棒剧烈地痉挛着，她肌肉发达的" + (get_player().biggestCockArea() > 80 ? "小穴" : "菊穴") + "伴随着一声响亮的“噗”将你挤了出来！你" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "里的压力太大了，她无法阻挡，她的努力只成功地将你喷发的水流变成了零星的精液阵雨，伴随着打击乐般的啪嗒声在她的身前留下痕迹。她陶醉在精液的阵雨中，高兴地用舌头接住了几股水流，然后将一根手指放在唇边，狡黠地看着你。还没等你弄明白发生了什么，她的尾巴就引导着你跳动的肉棒向下，你感觉到自己插入了红发女孩的" + (get_player().biggestCockArea() > 80 ? "阴道！" : "毫无防备的肛门！") + "毫无防备的女孩呻吟着向前倾斜，与此同时，金发女孩松开了对你" + (get_player().hasSheath() ? "包皮" : "根部") + "的抓握，让你丰富的精液自由地飞溅进她妹妹柔软的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁股") + "。她的" + (get_player().biggestCockArea() > 80 ? "裂口" : "直肠") + "不由自主地挤压着你，你甜腻的精液喷发进她的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁股") + "并淹没了她的" + (get_player()
               .biggestCockArea() > 80 ? "通道" : "肠道") + "，她的脸上夹杂着震惊和高潮的快感，她的肚子迅速膨胀成一个沉重的、怀孕般的肚子，发出清晰的晃动声。");
            }
            outputText("[pg]突然的插入" + (get_player().biggestCockArea() > 80 ? "" : "她的后庭") + "瞬间将她推向了边缘，很快你的耳朵里就传来了饥渴的吸吮声。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "黑发狐妖急切地吞咽着她妹妹肿胀的肉棒，吸溜着一波又一波浓稠的扶他精液。她举起手，将两根手指滑入女孩抽搐的裂缝中，随着她喉咙里丰富的精液喷泉变得更加浓稠，她发出了赞许的呻吟。她的另一只手慢慢地按摩着她逐渐膨胀的肚子，抚摸着不断增长的隆起，同时她将指尖捣入她妹妹的小穴，吸出每一口奶油般咸味的汁液。" : "黑发狐妖急切地舔舐着她妹妹抽搐的小穴，浓稠的淫水喷溅在她的脸上，她尽力用嘴接住。她的嘴唇包裹着女孩颤抖的小穴，她开始从粘稠的喷泉中大口饮用，整个过程中都哼唱着她的快感。") + "在感觉像是过了一个世纪之后，女孩的高潮开始消退，她伴随着水花奇妙地瘫倒在金发女孩的重量下，在倒下的过程中险些避开黑发女孩的脸。[pg]");
            outputText("她温暖的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁眼") + "仍然紧紧地抓住你的肉棒，将你和她一起拖下去。你瘫倒在金发女孩张开的双臂中，发现自己被压在她如山般乳房的棉花糖般的拥抱中。当你的肉棒在红发女孩的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁股") + "里释放出你最后的精液时，你感觉到你的力量随着每一次痉挛而流失，你的眼皮因一种不寻常的疲惫而变得沉重。[pg]");
         }
         else if(get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            get_player().orgasm("Dick");
            get_player().orgasm("Vaginal");
            outputText("[pg]金发女郎漫不经心地走到红发女郎身边，将她翻转过来，带着傲慢的笑容滑到她妹妹的臀部上。可怜的红发女郎被她的重量压在身下，因放肆的欲望而涨红了脸，她的阴茎在金发女郎的臀瓣间急切地抽动着。金发女郎的一条尾巴缠绕在你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "的" + (get_player().hasSheath() ? "包皮" : "根部") + "，将其拉入闪烁的金色线圈中，虽然毛茸茸的森林遮挡了你的视线，但你能感觉到" + get_player().cockHead(get_player().biggestCockIndex()) + "正压在金发女郎温暖诱人的阴户上。[pg]");
            outputText("她的尾巴盘绕并紧缩在你的阴茎上，拉着你向前，伴随着湿润的吸溜声，你一头扎进了那等待着的褶皱中。" + (get_player().biggestCockArea() > 80 ? " 她的肉壁将你向内拉扯了很久，沿着你的长度性感地起伏，她那深邃的阴户似乎永远没有尽头。尽管听起来不可思议，但她似乎打算将你全部吞下。" : "") + " 当你的臀部轻轻压在她的臀部上时，她满意地颤抖着，她的几条尾巴在你的[hips]周围抽打，尽可能地将你拉近" + (int(get_player().cocks.length) > 1 ? "，[eachCock]纠缠在金色的丛林中，挑逗地抚摸和挠痒痒。" : "。") + " 红发女郎的尾巴在她身下偶尔挥舞，因你的[vagina]挑逗地滑过她阴茎的顶端而兴奋地竖起，让她的脊背一阵战栗，双颊泛起红晕。[pg]");
            outputText("你感觉到有什么东西在摩擦你，低头一看，发现黑发女孩正把脸贴在你的[butt]上，双手在你的[hips]上下游走，还轻轻拍了一下你的脸颊。当她湿滑的舌头顺着你的股沟向上舔舐，用唾液涂抹你的[asshole]时，一阵不由自主的战栗顺着你的脊椎蜿蜒而上。她的指尖掐进你臀部的肉里，另一只手沿着你的[vagina]滑动，捏揉着你的[clit]。片刻之后，你离地一两英寸，一个蠕动的入侵者刺穿了你的屁股。她柔软的嘴唇像软枕头一样压在你身上，一声沉闷的咯咯笑声顺着她的舌头震动到你的前列腺。当她戳弄你的前列腺时，你的力量消失了，同时用她的重量将你拖倒，让你被红发女郎的阴茎刺穿。");
            get_player().cuntChange(24,true,true,false);
            outputText("[pg]");
            outputText("红发女郎因她跳动的肉棒刺穿你的下体而发出愉悦的尖叫，她的双手抬起，紧紧抓住金发女郎的肩膀，充满激情地掐了进去。被夹在金发女郎湿透的阴户、红发女郎的阴茎和黑发女郎旋转的舌头之间，你被如此多的快感包围，以至于你再也分不清快感的来源。你的身体在三人放纵的猛攻下扭动和颤抖，臀部在充满激情的奇观中相互摩擦和挤压。[pg]");
            outputText("你抓住金发女郎匀称的臀部，开始在她饥渴的裂口中抽插，因她紧致火热的肉壁有节奏地挤压你的阴茎而带来的快感，你不知羞耻地呻吟着。她饥渴地舔着嘴唇，翻着白眼，在狂喜中呻吟，将快感发挥到极致，以此来戏弄她的姐妹们。她把握着绝佳的时机，就在你准备拔出的时候，她用肌肉发达的阴户紧紧夹住你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "，像老虎钳一样紧紧锁住肉棒，空气中回荡着清晰的“哧溜！”声。[pg]");
            outputText("她对这淫秽的声音发出稚气的咯咯笑声，回头看着你，露出一个“谁，我吗？”的坏笑。她湿滑的小穴收缩着，伴随着“咕叽”一声，熟练地将你重新吸入体内，刺激你再次开始狂野的抽插。被压在金发女郎身下的红发女郎因快感而颤抖，拼命地将臀部向上迎合你的动作，双手在姐姐的背上上下抚摸，沉浸在纯粹的狂喜中。[pg]");
            outputText("你越来越接近高潮，随着压力在你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "中不断积聚，你因快感而颤抖。当第一团浓稠的精液涌出，强行射入金发女郎毫无防备的子宫时，你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "的" + (get_player().hasSheath() ? "包皮" : "根部") + "向外凸起。");
            if(get_player().cumQ() <= 150)
            {
               outputText("几股充满活力的精液射入她的体内，将你浓稠的精液泥泞地涂抹在她的肉壁上。她的内部肌肉不由自主地挤压着你，一抹深红色的红晕在她的脸颊上蔓延开来，同时一股浓稠的淫液从她的小穴中喷涌而出。");
            }
            else if(get_player().cumQ() > 150 && get_player().cumQ() <= 350)
            {
               outputText("无数股精液射入她的体内，将你浓稠的精液泥泞地涂抹在她的肉壁上。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，将你的精液吸向她痉挛的子宫，同时一股浓稠的淫液从她的小穴中喷涌而出。");
            }
            else if(get_player().cumQ() <= 1000)
            {
               outputText("浓稠的精液如丝带般射入她的体内，将你强效的精液泥泞地涂抹在她的肉壁上。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，将你的精液吸向她痉挛的子宫。当你的精液喷发并淹没她的子宫时，她的小穴不由自主地收缩，一抹深红色的红晕在她的脸颊上蔓延开来，同时一股浓稠的淫液从她的小穴中喷涌而出。");
            }
            else if(get_player().cumQ() <= 2500)
            {
               outputText("滚烫的精液如绳索般喷射进她的子宫，将你浓稠的液体涂抹在她的体内。她的内壁贪婪地挤压着你，按摩着你那因充满雄性精液而一次又一次膨胀的肉棒，浓稠的精液从她的穴口喷涌而出，她的肚子在压力下开始膨胀成一个圆滚滚、晃动着的腹部。当你的精液喷发进她体内并淹没她的子宫时，她的小穴不由自主地收缩着，她的肚子随着晃动而膨胀，沉甸甸地垂在红发女子的腹部，里面装满了你的精液，同时一股浓稠的淫液从她的小穴中喷射而出。");
            }
            else if(get_player().cumQ() > 2500)
            {
               outputText("滚烫的精液如波浪般冲击着她的子宫颈，用你浓稠的液体淹没了她的子宫。她的内壁贪婪地挤压着你，按摩着你那因充满雄性精液而一次又一次膨胀的肉棒，高压的精液从她的穴口喷发而出，她的腹部膨胀到了一个淫秽的大小。当你的精液喷发进她颤抖的小穴时，她的小穴不由自主地挤压着你，她的肚子迅速膨胀成一个沉重、怀孕般的腹部，发出清晰的晃动声，并压在红发女子的腹部上。");
            }
            outputText("[pg]与此同时，你能感觉到红发女子的肉棒开始在你的小穴里抽动，她也处于高潮的边缘。金发女子回头看了你一眼，将一根手指放在唇边，狡黠地笑着，她的一条尾巴滑到了红发女子的臀部和你自己的臀部之间。金色的尾巴紧紧地缠绕在她那偶尔抽动的肉棒上，你所期待的爆炸性精液喷发并没有到来。红发女子的脸扭曲成痛苦的表情，她的肉棒根部因为精液被她姐姐的尾巴痛苦地堵住而肿胀起来。金发女子只是咯咯地笑着，用指尖在红发女子的额头上逗弄她，同时将尾巴勒得更紧。可怜的被虐待的红发女子因渴望而颤抖，咬紧牙关呻吟着，因为她的高潮继续被拒绝，压力每秒都在增加。[pg]");
            outputText("金发女子带着苦笑，终于把她从折磨中释放出来，她肉棒上粗大的凸起几乎立刻膨胀穿过她的肉棒，如咸湿、奶油般的洪水般喷发进你的子宫。这股雄性的猛攻让你脊背发凉，因为它无情地涌入你的子宫，导致你的腹部膨胀并向外凸起。它慢慢地膨胀，长成一个晃动着、充血的肚子，大小和比例与西瓜无异。在感觉像过了漫长的时间之后，女孩的高潮开始减退，她奇妙地倒在金发女子的重压下，溅起水花。你紧随其后，感觉到黑发女孩的舌头离开，你向前滑到金发女子的背上。[pg]");
            outputText("滑动的舌头缠绕在红发女子变软的肉棒根部，伴随着“扑通”一声将它从你的[vagina]中拔出！一股精液开始从你被虐待的小穴中溢出，涌过红发女子的腹股沟并蔓延到水中。水流很快被黑发女孩的舌头堵住，她柔软的嘴唇压在你的小穴上，饥渴地吸吮着流出的精液。她大声而贪婪地吞咽着，用拇指撑开你的阴唇，吞下每一滴美味的咸味液体，她的肚子膨胀并颤抖着，而你自己过饱的腹部也开始同等程度地缩小。[pg]");
            outputText("随着你抽搐的肉棒在金发女孩的小穴里释放出最后的精液，你感到力量随着每一次痉挛从你身上流失，你的眼皮因为一种不寻常的疲惫感而变得沉重。[pg]");
         }
         doNext(kitsuneStillHungryMansion);
      }
      
      public function kitsuneMaleOrHermMansion(param1:Boolean = true) : void
      {
         var willing:Boolean;
         var _g1:KitsuneScene;
         var willing1:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         kitsuneSprite();
         outputText("[say: 让我们看看我们这里有什么，]金发女孩说着，滑上前来轻轻托起[eachCock]，同时舔着嘴唇。[say: 哎呀，这么有活力！]金发女孩惊呼道，急切地看着你的" + (int(get_player().cocks.length) > 1 ? "肉棒们肿胀到它们的" : "肉棒肿胀到它的") + "全部长度和粗细，这仅仅是因为她灵巧的双手稍微抚摸了一下。[pg]");
         outputText("柔软如天鹅绒般的皮毛爱抚着你的性感带，数不清的尾巴缠绕着你的四肢，柔软的嘴唇亲吻着你暴露的肌肤。蓝色的火舌伴随着像敲击燧石一样的噼啪声燃起，沿着你的身体舔舐，每一次触摸都让快感的涟漪流遍全身，随着每一秒的流逝，引出更多的欲望。[pg]");
         outputText("三条尾巴包裹住[eachCock]，紧紧地挤压着" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "，同时还有几条尾巴缠住你的四肢，让你无助地被束缚着。你那被酒精麻痹的大脑现在已经太模糊了，无法抵抗她们的进攻，她们解除武装的爱抚打破了你的抑制力，取而代之的是色欲和渴望。毛茸茸的附属物一致地开始上下套弄，同时姐妹们继续对你倾注爱意，用手指性感地" + (get_player().hair.length > 0 ? "穿过你的头发" : "划过你的头皮") + "，并用充满爱意的小咬逗弄你的脖子。[pg]");
         outputText("[say: 现在是主菜……]黑发妖狐在你耳边低语，轻轻地啃咬着外耳廓。[pg]");
         outputText("三条尾巴以令人痛苦的缓慢速度从[eachCock]上退去，黑发女孩将她那丰满的臀部圆球降下，贴在你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "上。她的臀部缓慢地起伏，用她后部如丝般柔软的肉体逗弄着你肉棒的下侧，看到她那有纹身的后臀轻轻地包裹着你的阴茎，让新鲜的血液涌向你的腹股沟。当金发女孩开始抚摸和揉捏它时，你的快感只会被放大，当她把嘴唇降向" + get_player().cockHead(get_player().biggestCockIndex()) + "时，她向你投来一个性感的冷笑。她柔软的舌头沿着顶部边缘温暖地滑动，从根部游走到尖端，然后再回来，每一个动作都经过仔细的衡量和控制，以逗弄和刺激你。[pg]");
         outputText("她性感的舔舐让你陷入快感的漩涡，冲破了你醉酒的阴霾。被欲望所克服，你带着醉意向前猛扑，带着好色的笑容把这三人撞倒。她们惊讶地尖叫起来，当你跌跌撞撞地撞向她们时笑了起来，但当你扑通一声掉进水里压在她们身上时，她们很容易就适应了她们的新角色，用丝滑的尾巴编织成的网接住你，并诱人地张开双臂。[pg]");
         outputText("[say: 哦，你这个</i>野兽<i>！]金发女孩戏谑地叫道，用指甲轻轻地沿着你的[chest]前面划过，指尖发出噼啪作响的火花。[pg]");
         outputText("你抓住她的臀部把她拉起来，双手顺着那极其宽阔的曲线向下游走，绕到后面去摸她那枕头般的臀部。她的姐妹们围拢在你身边，把她们丰满的乳房压在你身上，当她们的手在你的身体两侧慢慢上下游走时，她们害羞地咯咯笑着。当红发女孩把自己压在你身上时，你能感觉到一个温暖的凸起在你的[hips]上跳动。你低头一看，发现她拥有一些她姐妹们似乎缺乏的特殊东西——从她脸上那恶魔般的笑容来看，你对她打算用它做什么有了一点预感。[pg]");
         if(param1)
         {
            outputText("<b>你要如何回应？</b>");
            menu();
            _g = this;
            willing1 = param1;
            addButton(0,"随她去",function():void
            {
               _g.kitSuneLetHerMansion(willing1);
            });
            addButton(1,"推开她",kitsuneShoveHerMansion);
         }
         else
         {
            _g1 = this;
            willing = true;
            doNext(function():void
            {
               _g1.kitSuneLetHerMansion(willing);
            });
         }
      }
      
      public function kitsuneGenericFluff() : void
      {
         clearOutput();
         outputText("看到[monster.he]无力反抗，你[walk]向[themonster]，让你的[tail]在身后自由摆动。尽管[monster.he]试图集中注意力" + (get_monster().get_lust() >= get_monster().maxLust() ? "满足[monster.his]自己的需求" : "远离你") + "，但你迷人的绒毛对[monster.him]来说实在太让人分心了，" + (get_monster().get_lust() >= get_monster().maxLust() ? "[monster.his]的双手停了下来，[themonster]" : "[monster.he]瘫倒在地，") + "无法移开视线。[if (singleleg) {当你靠近[monster.him]时|再走一步，}]你们的目光交汇，看到曾经骄傲的[monster.short]如此彻底地被你迷住，你的[skinshort]因渴望而刺痛，[if (hasplainskin) {泛起红晕，}]渴望被触摸。");
         outputText("[pg]你需要感受[monster.him]被你的皮毛包裹，当你凝视[monster.his]呆滞的双眼时，你知道你一定会如愿以偿。这已经是不可避免的了。这不过是早在[if (iselder) {甚至}]你出生之前就写在宇宙中的一个简单、不变的真理。太阳照耀，小恶魔交配，而你——你那[tailnumber]条最柔软的[haircolor]色尾巴——将被抚摸，[monster.his]手指卷曲在你的绒毛上，从根部到尖端为你按摩。");
         outputText("[pg]也许连[themonster]现在也意识到了这一点，[monster.his]眼睛睁得大大的，你的尾巴[if (tailnumber == 9) {在你身后展开|左右摇摆}]，伴随着你臀部的摇晃，[monster.his]手立刻向你伸来，伴随着每一次浅浅的呼吸和从[monster.his]嘴里溜出的每一声可怜的呻吟，绝望地颤抖着。在[monster.he]接触到你之前，你向后退去，[monster.his]手指差一点就碰到了你的绒毛，[monster.he]几乎因为[monster.his]惯性而跌倒。[if (cor < 50) {看到[themonster]变得如此卑微，几乎让人感到尴尬|这让你感到充满活力}]，但既然你是一个仁慈的[race]，你卷起一条尾巴，轻轻拂过[monster.his]脸颊。");
         outputText("[pg]仅仅是这一丝快感的暗示就让[monster.him]颤抖起来，空气中已经弥漫着[monster.his]不断增长的欲望的气息。甚至不需要你吩咐，[themonster]就疯狂地寻找[monster.his]" + (get_monster().hasCock() ? get_monster().cockDescript(0) : get_monster().vaginaDescript(0)) + "，伴随着幸福的叹息摩擦着[monster.his]跳动的" + (get_monster().hasCock() ? "肉棒" : "阴蒂") + "。现在[monster.his]的欲火" + (get_monster().hasCock() ? "已经在[monster.his]的龟头上渗出水珠" : "") + (get_monster().isHerm() ? "并且" : "") + (get_monster().hasVagina() ? "顺着[monster.his]大腿流下" : "") + "，但尽管这很诱人，你来这里是为了别的事情。");
         outputText("[pg]伴随着尾巴的旋转，你转到[themonster]身边，让[if (tailnumber == 2) {两条|所有[tailnumber]条}]尾巴拂过[monster.his]起伏的胸膛，" + (get_monster().biggestTitSize() >= 1 ? "托起[monster.his]" + get_monster().breastDescript(0) + "，同时你" : "确保") + "挑逗[monster.his]敏感的乳头。当[monster.he]已经倾身迎合你的嘴唇，[monster.his]自己的嘴唇如此温柔，如此顺从你的每一个心血来潮时，[monster.he]真的认为[monster.he]还有机会吗？它们急切地为你分开，[themonster]颤抖的呼吸消失在你的嘴里，[if (tailnumber == 2) {你的另一条尾巴|你的另一条尾巴}]顺着[monster.his]侧面滑下，你的皮毛像任何情人的触摸一样如丝般柔软。");
         outputText("[pg]即使是现在，[monster.he]仍在犹豫不决中颤抖，[monster.his]手在[monster.his]" + (get_monster().hasCock() ? get_monster().cockDescript(0) : get_monster().vaginaDescript(0)) + "的需求和第一次抓住你天堂般的绒毛之间挣扎。当[themonster]伸出手时，你的尾巴变成了一团[haircolor]色的模糊，[monster.his]手指抓了个空，[monster.he]沮丧地呻吟着。当你从[monster.his]嘴唇上移开时，[monster.his]眼中的阴霾似乎散去了一秒钟，[themonster]现在肯定明白了，那[tailnumber]条柔软、抚摸着的尾巴属于你。");
         outputText("[pg]如果[monster.he]想摸它们，[monster.he]也会如愿的。");
         outputText("[pg]作为回应，对方茫然地点了点头，不过当你[if (singleleg) {滑|退}]后时，这种点头很快变得更加疯狂，让你毛茸茸的尾巴的每一次爱抚都消散在粗糙的空气中。当最后一条尾巴消失时，[themonster]像刚被刺伤一样颤抖着，[monster.his]眼睛仍然盯着你飘逸的皮毛，即使你[if (isnaked) {伸展身体，感受微风拂过你的[if (hascock) {[cock]|[vagina]}]|脱下你的[armor]，直到[if (hascock) {你的[cock]自由悬垂|你的[vagina]裸露在外，在微风中感到刺痛}]}]。");
         outputText("[pg]尽管戏弄[themonster]很有趣，但你[if (hascock) {肉棒|阴唇}]内的热度提醒你，你自己还没有被触摸过。你的[tail]渴望感受到[monster.his]双手包裹着它们的温暖，在一次[if (cor < 50) {非凡的|明显的}]慷慨之举中，你向[themonster]伸出其中一条，并示意[monster.him]过来。柔软的绒毛像海妖之歌一样呼唤着[monster.him]，[monster.he]用不属于[monster.his]自己的四肢靠近，[monster.his]手指已经抓住了你如丝般柔滑的皮毛。");
         outputText("[pg]当它们第一次相遇时，[Themonster]的呻吟声在整个[areaname]回荡，[monster.his]身体仅仅因为将[monster.his]手放在你的尾巴尖上就颤抖起来。再往下，[monster.his]" + (get_monster().hasCock() ? get_monster().cockDescript(0) + "抽动着" : get_monster().vaginaDescript(0) + "闪烁着") + "兴奋的光芒——尽管你怀疑[monster.he]是否意识到了这一点，[monster.he]被你的绒毛迷住了。现在[monster.he]终于能够触摸到你了，[themonster]用双手抓住你的尾巴，在[monster.his]手指间挤压着柔软的皮毛。当[monster.he]抱着你并一路向下摸到根部时，每一次抚摸都是饥渴而性感的，很快你自己的身体也因为被如此彻底地抚摸而变得温暖起来。");
         outputText("[pg]虽然你可以咬紧牙关不发出声音，但你无法隐藏[if (hascock) {你变硬的[cock]}][if (isherm) {和}][if (hasvagina) {弄脏你大腿的淫液}]，不过如果[themonster]注意到了你的兴奋，[monster.he]也没有表现出来。相反，[monster.he]伸手去抓[if (tailnumber == 2) {你的另一条|另一条}]尾巴，已经气喘吁吁，当[monster.his]手找到目标时，你自己也几乎无法呼吸。在[themonster]颤抖、不同步的触摸下，你只能向前耷拉着脑袋，[if (hascock) {握住你自己的肉棒|用手指在你的[clit]周围滑动}]，刺痛的快感在你的[skinshort]上荡漾。从后面传来的一点拉扯让你喘息，你忍不住注意到" + (get_monster().hasCock() ? "[monster.his]" + get_monster().cockDescript(0) + "撞到了你的[ass]，因为[monster.he]贪婪地抚摸着你的尾巴" : "空气中弥漫着[monster.his]兴奋的气味，每次[monster.he]抚摸你的尾巴时，这种气味就会泄漏得更多") + "。");
         if(get_player().tail.venom > 2)
         {
            outputText("[pg]你意识到你还有" + Utils.num2Text(get_player().tail.venom - 2) + "条尾巴没有被触碰，你担心[if (tou < 40) {你们俩|[monster.he]没有}]足够的体力坚持那么久。你决定充分利用它，将一条尾巴缠绕在[themonster]的背上，尽可能紧紧地抱住[monster.him]。[if (tailnumber > 3) {另一条尾巴在[monster.his]肚子上挠痒痒，[monster.his]每一次颤抖都令人愉悦地流入你的绒毛中。}][if (tailnumber > 4) {你的第五条尾巴" + (get_monster().hasCock() ? "在[themonster]的" + get_monster().cockDescript(0) + "周围盘旋，像你自己的手一样抚摸着[monster.him]" : "滑入[themonster]的阴唇之间，毫不费力地插入[monster.his]深处") + "，[monster.he]立刻挺起[monster.his]臀部，每一次抽插都回荡给你。}][if (tailnumber > 5) { [Themonster]呻吟着，因为你的第六条尾巴" + (get_monster().hasCock() ? "挑逗着[monster.his]" + (get_monster().balls > 0 ? get_monster().ballsDescript() : get_monster().assholeDescript()) + "。" : "拂过[monster.his]" + get_monster().clitDescript() + "。") + "而因渴望而颤抖。}][if (tailnumber > 6) {虽然[monster.he]看起来几乎要被包裹在这么多绒毛中的快感所征服，但你还有更多的尾巴，所以你的第七条[if (tailnumber > 7) {和第八条尾巴缠绕|尾巴缠绕}]在[monster.his]手臂上，让你随着[monster.his]的每一个动作而颤抖。}]");
         }
         if(get_player().isNineTails())
         {
            outputText("[pg]但是，即使[themonster]完全被你毛茸茸的尾巴缠住了，你还剩下一条。[if (cor < 50) {无事可做，你把最后一条尾巴拿在手里，[if (hascock) {沿着天堂般的皮毛摩擦你的[cock]|在嘴唇间摩擦天堂般的皮毛}]，将你如丝般的柔软转向自己。仅仅是擦过它就让你的胃里翻江倒海，你的呼吸变得灼热而急促，你的[if (hascock) {肉棒|阴蒂}]跳动着，绝望地渴望解脱。|再看一眼，你注意到[monster.he]并没有[i:完全]被覆盖，当你的最后一条尾巴缠绕在[monster.his]喉咙上时，[monster.he]僵硬的样子让你充满喜悦。稍微挤压一下很快就让[monster.him]再次动起来，疯狂地在你的绒毛上摩擦，试图让你高潮。}]");
         }
         var _loc1_:String = get_monster().hasCock() ? "向前挺进，[monster.his]精液溅在你的[haircolor]色皮毛上，[monster.he]将[monster.his]" + get_monster().cockDescript(0) + "埋在你的[if (tailnumber > 2) {两条}]尾巴之间" : "紧紧夹住[if (tailnumber > 4) {留在[monster.him]体内的你的尾巴|[monster.his]手中的尾巴}]";
         var _loc2_:Boolean = get_player().isNineTails() && get_player().cor >= 50;
         var _loc3_:Boolean = get_player().isNineTails() && get_player().cor < 50;
         outputText("[pg]当[themonster]迷失在你[if (tailnumber == 2) {双|[tailnumber]}]尾巴压倒性的快感中时，你的视线开始模糊，但首先屈服于[monster.his]欲望的是[monster.he]，[monster.he]粗暴地抓住你，" + _loc1_ + "。[Themonster]的哭喊声" + (_loc2_ ? "死在[monster.his]喉咙里" : "似乎充满了整个[areaname]") + "，当[monster.he]在你的怀抱中颤抖时，[monster.him]在你毛茸茸的尾巴中颤抖的突然感觉超出了你的承受能力，你的[if (singleleg) {身体|双腿}]摇晃着，[tailnumber]尾高潮的全部炽热热量撕裂了你。你的脑海里似乎除了绒毛什么都没有，[if (hascock) {你的[cock]最后一次跳动，温暖流过[if (isgoo) {你|你的静脉}]，因为它把它的负荷倒在地上。|你空虚的[vagina]痉挛，你的兴奋[if (vaginalwetness < 3) {滴落在|浸透}]" + (_loc3_ ? "你的尾巴" : "地面") + "上。}]");
         outputText("[pg]你仍在颤抖，把手放在[if (hascock) {你的肉棒下方|你敏感的[clit]上}]，颤抖着，[if (hascock) {[if (hasballs) {你的[balls]|你}]哄出另一发精液，|你在手掌中摩擦，让绽放的温暖积聚，直到}]你[if (singleleg) {向前|跪倒}]瘫软，彻底精疲力竭。在你身后，[themonster]的情况好不到哪里去，昏迷在地上，显然没有准备好承受你毛茸茸尾巴的全部威力。在喘口气并休息到足以平复你狂跳的心脏后，你[if (!singleleg) {用颤抖的双腿}]撑起身体，回到你的营地，只留下" + (get_player().hasCock() || get_monster().hasCock() ? "精液" : "性爱") + "的恶臭和一个非常困惑的[monster.short]。");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function kitsuneFemaleOrGenderless(param1:Boolean = true) : void
      {
         var willing:Boolean;
         var _g1:KitsuneScene;
         var willing1:Boolean;
         var _g:KitsuneScene;
         clearOutput();
         kitsuneSprite();
         outputText("[say: 放轻松，亲爱的，]金发女郎用轻柔的语调说道，她的手在水下顺着你的[hips]向下滑动。她丝般柔软的指尖轻轻地在你的" + (get_player().get_gender() >= 2 ? get_player().clitDescript() : get_player().assholeDescript()) + "周围打圈，让你浑身一颤。你仅存的顾虑现在都已烟消云散，你" + (get_player().isBiped() ? "张开双腿，" : "") + "完全沉浸在她的温柔抚摸中。[pg]");
         outputText("无数柔软的尾巴抚摸着你的敏感带，其中几条缠绕在你的四肢上，防止你乱动。柔软的嘴唇亲吻着你每一寸裸露的肌肤，伴随着打火石般的声音，蓝色的火焰燃起，在你的身体上轻轻舔舐盘旋，让阵阵快感流遍全身。你被酒精麻醉的大脑现在已经太模糊了，无法抵抗她们的攻势，她们那令人毫无防备的抚摸打破了你的矜持，取而代之的是无尽的欲望。[pg]");
         outputText("一根手指探入后，紧接着是第二根，轻轻地侵入你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "直到第二指节，让你舒服得呻吟出声并夹紧了下身。温柔的抚摸顺着你的[fullChest]滑下，姐妹们对你倾注着爱意——这里轻轻一捏，那里轻轻一咬，每一个动作都经过精心计算，以挑逗和唤起你的欲望。黑发女郎小心翼翼地爬到你身上，用嘴唇含住你的一侧[nipples]，用舌头轻轻弹弄。" + (get_player().lactationQ() > 0 ? " 当你新鲜的乳汁开始涌入她的嘴里时，她兴奋地娇笑着，轻轻按摩你的[chest]以刺激乳汁流出，并急切地吞咽下去。[pg][say: 嗯……真美味，]她坏笑着说，低下头又喝了一口。" : "她的牙齿在娇嫩的肌肤上轻轻摩擦，给你带来阵阵快感。淡蓝色的火焰从她的唇角蔓延开来，让快感进一步升华，你发现自己很难停止颤抖。") + "[pg]");
         outputText("你感觉到有什么温暖的东西在戳你的侧腰，低头一看，发现红发女郎拥有某种她姐妹们所缺乏的“特殊部位”——从她脸上那恶魔般的笑容来看，你已经隐约猜到她打算用它做什么了。[pg]");
         if(param1)
         {
            outputText("<b>你要如何回应？</b>");
            menu();
            _g = this;
            willing1 = param1;
            addButton(0,"随她去",function():void
            {
               _g.kitsunesGenderlessLetHer(willing1);
            });
            addButton(1,"推开她",kitsunesGenderlessShoveHer);
         }
         else
         {
            _g1 = this;
            willing = true;
            doNext(function():void
            {
               _g1.kitsunesGenderlessLetHer(willing);
            });
         }
      }
      
      public function kitsuneDrinkingNo() : void
      {
         outputText("[pg]也许如果你能更好地控制自己的能力，但你已经说过你不想做爱。虽然需要一点注意力，但你站直了身子，动身前往营地。可以听到妖狐夸张地发出一声呻吟。看来她觉得很没趣。");
         get_combat().cleanupAfterCombat();
      }
      
      public function kitsuneDrinking2() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("管他呢，你心想，然后开始脱下你的[armor]。那里积聚了很多压力，你有什么理由拒绝让一个美丽的女人抚摸你的身体呢？");
         outputText("[pg]狐狸喝完酒，带着红晕的目光爬向你。虽然你可能有点怀疑，但你趴在肚子上，感觉所有的担忧都在她的触摸下融化了。这个女人一定是个经验丰富的按摩师！在她的神仙手指揉捏你的背部和肩膀时，时间仿佛消失了。你应该多要求这样的服务。");
         outputText("[pg][say:好了~现在轮到我了，]她说着，把你从那一刻拉了回来。你知道时间已经过去很久了，但感觉就像一瞬间。");
         outputText("[pg]虽然你很害怕轮到你结束，但你现在感觉<i>很棒</i>，所以很公平。你坐起来，告诉狐狸躺下，却发现她已经躺下了。你脑海中闪过你的技术可能不如她的念头，但你一开始她就舒服地呻吟起来。她也同样需要这个！");
         outputText("[pg][say:再往下！]她附和道。你按照她的要求，把手放在她背部更低的地方，但她又要求道：[say:再往下！]你照做了。");
         outputText("[pg][say:再往下啊啊啊！]她呻吟着，部分原因是她喝醉了。你很快就无路可退了。[say:揉揉我的大腿，亲爱的。]");
         outputText("[pg]你的手揉过她柔软的屁股，把她毛茸茸的尾巴拨到一边。她的大腿很柔软，但很紧绷。她皮肤的温暖感觉很好，让你不得不停止接受按摩也没那么糟糕。这有点治疗作用。");
         outputText("[pg][say:再深一点，亲爱的，]她说。你的手指更用力地揉进她的大腿，但她还是重复了一遍。[say:你知道我想要更多。]也许是酒精让你变慢了，但事后看来，你应该料到事情会这样发展。");
         outputText("[pg]你把一根手指伸进她湿滑的小穴，注意到她整个身体都在颤抖，同时呻吟着。湿热的褶皱热切地欢迎你的手指。");
         outputText("[pg][say:<b>再深一点，</b>亲爱的，]她说。你又滑进一根手指，把它们全部推了进去，抚摸着她的内壁，显然很成功，但她又说话了。[say:再深一点，再深一点！我全都要！]");
         outputText("[pg]你皱起眉头，把拳头塞了进去，引得妖狐发出一声惊讶的叫喊。这吓了你一跳，你开始往外拔，但她阻止了你。[say:对！对！就是这样，继续！]");
         outputText("[pg]这是一个奇怪的举动，你想知道你是否误解了她想要什么进入她体内，但如果这有效，那你也可以继续。你把手伸得更深，笨拙地抽插着，一路上被浸透了。她<b>爱死</b>这个了。");
         outputText("[pg][say:再——深——一——点！]她乞求道。带着决心，你把自己推向极限，插入了你的整条手臂。这一刻的胜利被困惑所取代，因为你似乎碰到了什么硬东西。你感到困惑，抓住它开始拉，妖狐在你这样做时幸福地尖叫起来。它纹丝不动！你试图把狐妖固定在原地，用更大的杠杆力拉。");
         outputText("[pg]慢慢地，你感觉自己的手臂正从那幽深湿热的洞穴中退出。你找到的东西还真的<i>在里面陷得很深！</i>你一寸一寸地往外拽，整条手臂早已湿透，但你的目标就快取出来了。最后一记猛拽，那东西伴随着一声淫靡的*噗啾！*声滑了出来。");
         outputText("[pg]这——这是一把战锤！一把巨大的金属战锤！");
         outputText("[pg]狐妖从她那场惊人的高潮中缓过气来。[say: 哦！原来在这里！我之前还在纳闷我们那个展示品去哪儿了呢！我从家里的楼梯上摔下来，发现原本挂在那儿的锤子不见了，当时真是百思不得其解。松了口气倒是真的，但完全摸不着头脑。]");
         outputText("[pg]你难以置信地盯着看。这一切都说不通。那东西怎么能塞进她体内！？");
         outputText("[pg][say: 哦，呃。我们狐妖的小穴，大概可以算是个…随身储物空间？解释起来有点尴尬……总、总之！你想留着它的话就拿走吧，就当是帮我把它掏出来的谢礼。]");
         outputText("[pg]她似乎脸红了，把目光移开，也许是因为意识到这里发生了什么而清醒过来。你感到相当头晕和困惑，接受了她的提议，把锤子带走了。");
         get_player().changeFatigue(-20);
         var _loc1_:Inventory = get_inventory();
         var _loc2_:HugeWarhammer = get_weapons().WARHAMR;
         _g = get_combat();
         _loc1_.takeItem(_loc2_,function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function kitsuneDrinking() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("打败了狐妖之后，你现在真的没有心情做爱，但你想放松一下。");
         outputText("[pg]妖狐琢磨着什么，然后不知从哪里掏出一个瓶子，说道：[say:喝一杯怎么样？]");
         outputText("[pg]你觉得这个提议有点奇怪，但在这一刻听起来很完美。你坐下来，狐妖倒了两杯。她把你的递给你，然后迅速喝下她的酒，接着又倒满了。你不想认输，也跟着照做。这是一种清澈的酒，有点烈，但很容易品尝，结果非常令人愉快。");
         outputText("[pg]又喝了几杯后，妖狐终于开口了。[say:我已经很久没有和除了我姐妹以外的人坐下来喝酒了。]她把目光投向你时，身体微微摇晃，继续说道：[say:本着放松的精神，来点“按摩”怎么样？]");
         outputText("[pg]狐狸性感的目光暗示着这不仅仅是简单的按摩。喝酒很愉快，你现在更有心情进行肌肤之亲了……");
         menu();
         addButton(0,"按摩",kitsuneDrinking2);
         addButton(1,"拒绝",kitsuneDrinkingNo);
      }
      
      public function kitsuneDraftRide() : void
      {
         clearOutput();
         outputText("你咧嘴一笑，看着倒下的狐妖。她之前的自信已经完全被绝望所取代，眼中的渴求显而易见，看到她落得如此下场，你感到十分有趣。你盘算着该如何享受这一刻。她之前那么想让你欲火焚身，现在看看她自己喜不喜欢这种感觉，一定会很有趣。而你刚好有能派上用场的东西。");
         outputText("[pg][say:求、求求你……] 她开口说道，却无法说完这句话。");
         outputText("[pg]狐娘正用恳求的眼神看着你，于是你掏出那瓶催情剂，开始说明你即将进行的交媾条件。然而，还没等你解释完，狐妖就一把从你手中抢过药水，毫不犹豫地一饮而尽。看来她比你想象的还要渴望，但这正合你意。");
         outputText("[pg]药水的效果立竿见影：狐妖的脸红得像" + (get_monster().hair.color == "red" ? "她的头发" : "甜菜") + "一样，大腿饥渴地摩擦着。你觉得她无法再这样等下去了，于是你命令她躺下，她立刻照做，显然只要能得到满足，她根本不在乎你有什么计划。");
         outputText("[pg][say:操、操，我——] 她咽了口唾沫，眼神迷离。[say:我、我脑子都不清醒了。求你了，我不在乎怎么做，操我就行！] 看来她真的等不及了。对她来说幸运的是，你打算让她得到极大的满足。");
         outputText("[pg]你迅速脱下你的[armor]，[if (singleleg) {滑|走}]到她仰卧的身体旁。狐妖用毫不掩饰的欲望看着你，肆无忌惮地欣赏着你的[chest]和[ass]。但你知道自己想要什么，于是你移动臀部，直到你的入口悬停在她等待的嘴唇上方。");
         outputText("[pg]还没等你俯下身去迎合她，狐妖的双手就抓住了你，她抬起嘴，吸吮着你[if (vaginalwetness > 2) {滴水|饥渴}]的阴唇。她的舌头试探性地舔了几下，然后便一头扎进去，认真地探索你的深处。她很清楚自己的位置，这很好，而且她天生妖艳的性格加上现在的醉态，让她成为一个相当刺激的伴侣。她急切地舔舐着你，以惊人的速度找到了所有能让[if (isfluffy) {你的[skindesc]竖起|你四肢起鸡皮疙瘩}]的敏感点。");
         outputText("[pg]从你的角度，你可以看到她的手急忙伸向她" + (get_monster().hair.color == "red" ? "坚挺的肉棒" : "流着淫液的小穴") + "并开始抚摸。从她熟练的动作中，你可以看出她在这方面有多么经验丰富，你甚至有一瞬间感到有些嫉妒，但随后她蠕动的舌头提醒你，你已经被伺候得很舒服了。");
         outputText("[pg]既然她正在自己解决，你的双手就可以自由地游走，你充分利用了这个安排。你托起她的乳房，花点时间享受她完美的肌肤，在你的触摸下光滑而凉爽。当你的手指移到她的乳头时，她对着你喘息，让你的全身都感到一阵酥麻。渴望更多，你扭动它们，狐妖在你身下扭动时发出了特别悦耳的声音。");
         outputText("[pg]狐妖进入了稳定的节奏，毫不费力地让你们俩都感到愉悦。每隔一段时间，她的下唇就会擦过你的阴蒂，这总能让你的身体感受到纯粹的狂喜。除了这种身体上的刺激，你还欣赏到了一场精彩的表演，她疯狂地" + (get_monster().hair.color == "red" ? "套弄" : "指插") + "着自己，让" + (get_monster().hair.color == "red" ? "前列腺液顺着肉棒流下" : "汁液顺着大腿流下") + "，她的呻吟声与你相呼应，甚至超过了你。你的高潮即将来临，你没有理由退缩，所以你将骨盆磨蹭着她可爱的嘴唇，释放了自己。");
         outputText("[pg]随着高潮开始在你体内蔓延，狐妖将脸贴向你，她贪婪的胃口驱使她尽可能多地吞噬你。你没有时间慢慢平息，你的身体在温柔的服侍下不断颤抖。很快，你的核心肌肉因为快感而痉挛，宣告了第二次高潮的到来，你向前瘫倒在狐妖身上。她的手继续在她的" + (get_monster().hair.color == "red" ? "跳动的肉棒" : "自己的阴唇") + "上动作，你尽力回报她充满爱意的对待，在她的双腿上上下抚摸，她也沉浸在极乐之中。");
         outputText("[pg]你们俩气喘吁吁地躺了几分钟，累得连换个舒服的姿势都做不到，但你最终还是强迫自己站了起来。当你这样做的时候，欲火焚身的狐妖开始虚弱地抓挠你的下体，所以你决定在她把你拉入另一场耗费体力的运动之前离开这里。");
         outputText("[pg]当你离开时，你听到身后传来一阵颤抖的呻吟。看来她很乐意自己继续。");
         get_player().orgasm("Vaginal");
         if(get_player().hasItem(get_consumables().L_DRAFT))
         {
            get_player().consumeItem(get_consumables().L_DRAFT);
         }
         else
         {
            get_player().consumeItem(get_consumables().F_DRAFT);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function kitSuneMansionBadEndII() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("很难说你在这里住了多久。在这个被永远困在世界之间的地方，时间没有任何意义。偶尔，你从前自我的一丝微光会浮现出现在你那一直浑浊不堪的脑海表面，让你隐约想起除了侍奉女主人之外，你还有别的目的。[pg]");
         outputText("虽然这只是记忆中最模糊的影子，但在这样的夜晚，它迫使你寻找离开的方法，在构成这座庄园的永远在变移的走廊和扭曲的过道迷宫中蹒跚前行。你的寻找永无止境，每个新房间都以新的方式扭曲现实，你的路径相互循环，蜿蜒穿过不适合凡人眼睛看到的怪异领域。无论你的路线多么曲折，你的旅程总是结束在同一个地方。[pg]");
         outputText("当你的意志开始消退的那一刻，你被送到了姐妹们卧室的门口。疲惫的精神让你的思绪变得迟钝，而服侍女主人们的渴望再次占据了你的脑海。她们在门口迎接你，今晚穿着几乎透明的丝绸薄纱睡裙，将你迎了进去。[pg]");
         outputText("[say:进来吧，亲爱的。让我们来缓解你的紧张，]金发女郎低语着，将你拉入一个令人安心的拥抱中。[pg]");
         outputText("三人围着你，在你走向床铺的路上，她们对你倾注了充满爱意的亲吻和抚摸，并为你宽衣解带。她们柔软的指尖滑过你的[skinfurscales]，解开你的丝绸长袍，将其从你的上半身褪下。她们温柔地抚摸着你的[chest]，她们的许多尾巴在你背上忙碌地上下扫动，用尾尖挑逗着你。感觉过了很久，你的长袍才堆落在地板上，露出了你下半身那令人憎恶的模样。从臀部往下，你的身体被一团蠕动的触手所取代，几十根湿滑的触须从你骨盆曾经连接着一双人类双腿的地方伸展出来。[pg]");
         outputText("较粗的触手长满了小吸盘，用来支撑你的体重，而其余的触手则在空中扭动、蠕动，本能地寻找着三件丝绸长袍褪去后裸露的肌肤。它们仿佛有了自己的意识，缠绕在床柱上，将你托起，并把三只狐妖也拉了过来。当她们慢慢被你众多蠕动的肢体缠住时，每个女孩都满怀期待地笑着。她们一起将你按倒在床上，互相推搡着争夺有利位置，同时高高撅起她们沉甸甸的臀部，用指尖在你的胸膛上划出火花。[pg]");
         outputText("你的六根肌肉发达、能够抓握的触手滑入她们摇晃的臀瓣之间，引得她们每个人都发出一声呻吟和颤抖。停留在每个洞口的边缘，当你一次一个地进入她们时，你发出狂喜的嚎叫，与她们一起在欢愉的合唱中提高嗓音。当你感觉到红发女郎那根粗壮、肉感的肉棒滑入你的喉咙时，你的声音戛然而止，你的肌肉顺从地放松，将其完全吞入。她的双手滑到你的后颈，在欢愉中仰起头，向前挺动臀部，而塞满她屁股和小穴的触手则插得更深，在她的肚子上顶出了清晰的轮廓。[pg]");
         outputText("你的黑发女主人有她自己的计划，她挑了你能找到的最粗的触手，用她的手臂、双腿和尾巴缠住它，慢慢地将它吸入嘴里。当她把它越来越深地吞入喉咙时，她的呻吟声在你体内震荡，她脖子上的凸起随着每一次吞咽触手而变大。直到每一个角落和缝隙都被蠕动的肉质触须填满，她才会满足，但作为一个卑微的仆人，你很乐意效劳。[pg]");
         outputText("金发女郎向后倒去，双腿大张，用脚底接住几根粗壮的触手，轻轻地来回摩擦，引导它们滑入大腿之间。她像个廉价妓女一样呻吟着，将你粗壮的触手一根接一根地塞进她湿滑的穴里，用更多起伏的触须填满已经撑开的通道。她饥渴的阴户那深不见底的深度包围着你，强健的肌肉在她已经设法塞进去的半打蠕动触须上泛起涟漪。[pg]");
         outputText("你过去的闪光点早已被遗忘，留给你的只有她们利用你多肢身体的堕落，这是她们自己赐予你的可憎形态。每天晚上她们都会蹂躏你直到你精疲力竭，她们扭曲的魔法维持着你远超凡人的耐力，以满足她们自己扭曲的欲望。[pg]");
         outputText("你现在永远是姐妹俩的仆人了，一只纯粹为了给她们提供快乐而培养出来的变态野兽。[pg]");
         outputText("<b>游戏结束</b>");
         get_game().gameOver();
      }
      
      public function kitSuneLetHerMansion(param1:Boolean = true) : void
      {
         clearOutput();
         kitsuneSprite();
         outputText((param1 ? "你决定让她玩个痛快，把注意力集中在她两个可爱的姐妹身上。当你被红发女孩的“资产”分散注意力时，看来早熟的金发女孩和黑发女孩已经撇下你开始了！" : "你含糊不清的抗议被当成了耳旁风，你的头因为喝了许多瓶烈酒而晕乎乎的。你试图把她推开，但她接住了你醉醺醺的攻击，并温柔地靠上来，在你的脸颊上给了一个解除武装的轻吻。虽然你在精神上试图坚持争执，但你发现你的顾虑逐渐消失，直到你只能把注意力集中在女孩的两个姐妹身上，她们似乎已经撇下你开始了。") + " 黑发女孩躺下，把脸深深地埋在金发女孩臀部起伏的肉体中，吸吮着她滴水的褶皱，而金发女孩则在上面回应，用她的前两根手指捣着她姐妹肿胀的小穴。[pg]");
         outputText("金发女孩那惊人的臀部随着她本能地上下抽动臀部而弹跳和摇晃。那颤抖的臀瓣诱惑着你，几乎是催眠般地吸引着你，不知不觉中，你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "已经" + (get_player().balls > 0 ? "齐根" : "齐根") + "没入她湿滑的私处。[pg]");
         outputText("当你那" + get_player().cockDescript(get_player().biggestCockIndex()) + "插入她最深处时，这位丰满的狐狸女孩发出了愉悦的呻吟，她温暖的肉体包裹着你滚烫的阴茎，并紧紧地挤压着，一股女性的淫液涌出，洒在黑发女孩的脸上。" + (get_player().biggestCockArea() > 50 ? " 她的褶皱似乎可以无限延伸，像一个充满温暖和快感的无底洞一样吞噬着你肿胀的工具。" : "") + " 你的双手深深地陷入她那如山般臀部的枕头状隆起中，把它们揉捏在一起，就像揉捏温暖的面团一样。[pg]");
         outputText("当红发女孩把自己紧紧贴在你的[butt]上时，纤细的手指合拢在你的[hips]上，试图与你对齐，而你的骨盆则狂野地贴着她姐妹起伏的臀部摩擦。她的肉棒在你的臀瓣之间向上滑动，滴下的前列腺液在你的肉体上引起阵阵刺痛，她终于设法将自己对准了你的");
         if(get_player().get_gender() >= 2)
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText(get_player().assholeDescript());
         }
         outputText("并刺入，用十二英寸长跳动的扶他肉棒将你刺穿。齐根埋在你的");
         if(get_player().get_gender() == 1)
         {
            outputText("后庭");
         }
         else
         {
            outputText("温暖的褶皱");
         }
         outputText("中，她用双臂环抱住你，指尖顺着你的[chest]向下滑动，一路上拖曳着蔚蓝色的火花。");
         if(get_player().get_gender() == 1)
         {
            get_player().buttChange(14,true,true,false);
         }
         else
         {
            get_player().cuntChange(14,true,true,false);
         }
         outputText("[pg]");
         outputText("夹在两个多情的妖狐之间，你在快感中颤抖，感觉到金发女孩湿滑的小穴挤压并沿着你的长度榨取，而红发女孩则以一种动物般的狂热顶撞着你抽搐的臀部。你感觉到有什么湿滑的东西沿着你" + get_player().cockDescript(get_player().biggestCockIndex()) + "的" + (get_player().hasSheath() ? "包皮" : "根部") + "滑动，黑发妖狐长长的舌头缠绕着它，饥渴地吸吮着上面金发女孩的汁液。" + (get_player().balls > 0 ? " 她那枕头般的嘴唇充满爱意地贴在你的[balls]上，大声地吸吮着，并高兴地在上面发出嗡嗡声。" : "") + "[pg]");
         outputText("红发女孩的双手性感地按摩着你的下半身，");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("她的手掌爱抚着");
            outputText("你剩下的" + Utils.num2Text(int(get_player().cocks.length) - 1) + "根肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("并且紧紧地挤压着");
         }
         else
         {
            outputText("用食指在你的肚脐上画圈，并将她挺拔的双峰紧紧贴在你的背上");
         }
         outputText("同时继续用力地在你体内抽插。[pg]");
         outputText("金发女孩紧致的通道紧紧地夹住你的肉棒，用肌肉的收缩将你固定在里面，迫使你放慢抽插的速度。她强有力的阴道肌肉突然松开你，一股滑腻的雌性体液顺着你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "涌出，浸湿了她妹妹的脸。黑发女孩开心地舔舐着，然后作为报复，她将双腿抬起环绕在金发女孩的脖子上，将她拉向自己的胯部，在女孩开始为她舔阴时露出了极其淫荡的表情。[pg]");
         outputText("红发女孩跳动的肉棒开始在你的");
         if(get_player().get_gender() >= 2)
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText(get_player().assholeDescript());
         }
         outputText("里抽动和抽搐，她正在积聚力量准备高潮。你也快到极限了，忍耐着即将到来的释放让你的肌肉紧紧收缩，包裹住她肿胀的肉棒。你的");
         if(get_player().get_gender() >= 2)
         {
            outputText("小穴");
         }
         else
         {
            outputText("直肠");
         }
         outputText("强有力的收缩将她推向了边缘，她开始在你耳边大声呻吟，指尖深深地陷入你的[hips]。她肿胀的肉棒在你的");
         if(get_player().get_gender() >= 2)
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText(get_player().assholeDescript());
         }
         outputText("里颤抖，一个粗大的凸起穿过肉棒，猛烈地喷射进你的");
         if(get_player().get_gender() >= 2)
         {
            outputText("湿滑的洞穴");
         }
         else
         {
            outputText("体内");
         }
         outputText("。浓稠的精液像冰水一样击中你的");
         if(get_player().get_gender() >= 2)
         {
            outputText("子宫");
         }
         else
         {
            outputText("肠道");
         }
         outputText("，然后迅速变成一种令人疼痛的温暖，当甜腻的精液涌入你的腹部时，你的脊背一阵发凉。你的腹部开始膨胀成一个鼓起的肚子，晃荡的精液填满了你的内脏，用扶他精液堵塞了你的通道，她向你体内倾注了真正非人数量的精液。[pg]");
         outputText("你不断膨胀的腹部传来的令人愉悦的压力将你的快感推向了新的极端，你开始将骨盆压入金发女孩颤抖的臀瓣中，追求你那辉煌的释放。" + (get_player().biggestCockArea() > 80 ? "她向前倾斜，手指抓着沿着水池边缘的木甲板，整个身体因快感而起伏。" : "当你感觉到下半身盘绕的弹簧接近极限时，你突然感觉到红发女孩的手包裹住了你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "。她狡黠地靠在你的肩膀上，将一根手指放在嘴唇上，对你低语，[say:嘘……][pg]毫无预兆地，她猛地将你向后拉，就在你开始高潮时，将你从金发女孩颤抖的小穴中拉出来，迅速调整角度，并向前挺起臀部，将你抽搐的肉棒猛地插入金发女孩的屁股里！她柔软的肛门环出人意料地轻松地屈服于入侵，仿佛条件反射般地张开，然后当你的臀部再次接触到她颤抖的臀瓣时，紧紧地夹住你的根部。她向前倾斜，发出一声惊讶的喘息，几乎在你强制性的肛交攻击下崩溃，她的整个身体因震惊和快感的结合而起伏。") + "[pg]");
         if(get_player().cumQ() <= 150)
         {
            outputText("几股充满活力的精液喷射进她的体内，将你浓稠的精液胡乱地涂抹在她的" + (get_player().biggestCockArea() > 80 ? "肉道" : "肠道") + "里。她的内部肌肉不由自主地挤压着你，随着一股浓稠的淫液从她的小穴喷涌而出，一抹深红色的红晕在她的脸颊上蔓延开来。淫液溅到了黑发女孩的脸上，她张开嘴接住了所有的淫液，将丰满的嘴唇贴在姐姐颤抖的小穴上，大口地喝着，同时对着她的阴蒂哼唱着满足的旋律。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("无数股精液喷射进她的体内，将你浓稠的精液胡乱地涂抹在她的通道里。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，将你的精液" + (get_player().biggestCockArea() > 80 ? "吸向她痉挛的子宫。" : "吸入她痉挛的肠道深处。") + "随着一股浓稠的淫液从她的小穴喷涌而出，一抹深红色的红晕在她的脸颊上蔓延开来。淫液溅到了黑发女孩的脸上，她张开嘴接住了所有的淫液，将丰满的嘴唇贴在姐姐颤抖的小穴上，大口地喝着，同时对着她的阴蒂哼唱着满足的旋律。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("浓稠的精液如丝带般喷射进她的体内，将你强效的精液胡乱地涂抹在她的" + (get_player().biggestCockArea() > 80 ? "肉道" : "肠道") + "里。她的内部肌肉贪婪地挤压着你，按摩着你的肉棒，将你的精液" + (get_player().biggestCockArea() > 80 ? "吸向她痉挛的子宫。她的小穴" : "吸入她痉挛的肠道深处。她的直肠") + "不由自主地收紧，随着你甜腻的精液喷发进她" + (get_player().biggestCockArea() > 80 ? "颤抖的小穴并淹没她的肉道" : "的屁股并淹没她的肠道") + "，一股浓稠的淫液从她的小穴喷涌而出，一抹深红色的红晕在她的脸颊上蔓延开来。淫液溅到了黑发女孩的脸上，她张开嘴接住了所有的淫液，将丰满的嘴唇贴在姐姐颤抖的小穴上，大口地喝着，同时对着她的阴蒂哼唱着满足的旋律。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("滚烫的精液如绳索般射入她的" + (get_player().biggestCockArea() > 80 ? "肉缝" : "屁眼") + "，用你浓稠的精液涂抹着她。她的内壁贪婪地挤压着你，按摩着你那因充满雄性种子而一次又一次肿胀的肉棒，浓稠的精流从她的洞口喷涌而出，她的肚子在压力下开始膨胀成一个圆滚滚的、晃动的小腹。她的" + (get_player().biggestCockArea() > 80 ? "小穴" : "直肠") + "不由自主地收缩，你那甜腻的精液喷发进她" + (get_player().biggestCockArea() > 80 ? "颤抖的阴户，淹没了她的通道" : "屁股，淹没了她的肠道") + "，她的肚子随着晃动而膨胀，因你精液的重量而低垂沉重。一抹深红的红晕在她的脸颊上蔓延，一股浓稠的淫水从她的小穴中喷涌而出，溅在黑发女孩的脸上，她张开嘴接住这一切，将丰满的嘴唇压在姐姐颤抖的阴户上，大口大口地喝着，同时对着她的阴蒂哼着满足的旋律。");
         }
         else if(get_player().cumQ() > 2500)
         {
            outputText("滚烫的精液如波浪般拍打着她的" + (get_player().biggestCockArea() > 80 ? "子宫颈，用你浓稠的精液淹没了她的子宫" : "括约肌，用你浓稠的精液淹没了她的屁股") + "。她的内壁贪婪地挤压着你，按摩着你那因充满雄性种子而一次又一次肿胀的肉棒，高压的水流从她的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁股") + "喷发而出，她的腹部肿胀到了一个淫秽的大小。她的" + (get_player().biggestCockArea() > 80 ? "小穴" : "直肠") + "不由自主地挤压着你，你那甜腻的精液喷发进她" + (get_player().biggestCockArea() > 80 ? "颤抖的阴户，淹没了她的通道" : "屁股，淹没了她的肠道") + "，她的肚子迅速肿胀成一个沉重的、像怀孕一样的肚子，发出清晰的晃动声。一抹深红的红晕在她的脸颊上蔓延，一股浓稠的淫水从她的小穴中喷涌而出，溅在黑发女孩的脸上，她张开嘴接住这一切，将丰满的嘴唇压在姐姐颤抖的阴户上，大口大口地喝着，同时对着她的阴蒂哼着满足的旋律。");
         }
         outputText("在经历了仿佛一个世纪那么漫长的时间后，金发女孩的高潮开始消退，她奇妙地瘫倒在黑发女孩的身上。[pg]");
         outputText("她温暖的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁眼") + "仍然紧紧地夹着你的肉棒，把你和她一起拉倒。你瘫倒在她身上，从红发女孩的肉棒上滑落，跌入金发女孩金色的卷发中。");
         if(get_player().get_gender() >= 2)
         {
            outputText("一股精液开始从你受虐的小穴中溢出，涌过红发女孩的腹股沟，蔓延到水中。这股水流很快就被黑发女孩的舌头堵住了，她丰满的嘴唇压在你的阴户上，饥渴地吸吮着涌出的精液。她大声而贪婪地吞咽着，用拇指掰开你的阴唇，吞下最后一点美味的咸味，她的肚子肿胀颤抖着，而你自己过饱的腹部也开始同等程度地干瘪下去。");
         }
         outputText("随着你抽搐的肉棒将最后的精液释放在金发女孩的" + (get_player().biggestCockArea() > 80 ? "小穴" : "屁股") + "里，你感到自己的力量随着每一次痉挛而流失，眼皮因为一种不寻常的疲惫感而变得沉重。[pg]");
         get_player().orgasm("Dick");
         get_player().orgasm("VaginalAnal");
         doNext(kitsuneStillHungryMansion);
      }
      
      public function hotdogAnalInKitsuneButtDontLetTailTickleYourNose() : void
      {
         clearOutput();
         kitsuneSprite();
         var _loc1_:int = get_player().cockThatFits(144);
         outputText("你让你的目光色眯眯地在她俯卧的身体上游走，花时间观察每一道丰满的曲线。最后你的目光停留在她巨大的屁股上，她的长袍随意地卷到臀部，露出颤动的肉体。右侧臀瓣上装饰着一个巨大的太阳形状的纹身，用异国情调的色彩突出了圆润球体的奶油色肌肤。即使是最轻微的动作，它们也会剧烈地颤动，以一种几乎催眠的方式抖动着，迫使你靠近。在你意识到之前，你已经趴在她的身上，将她宽大的臀部抬到半空中，带着毫不掩饰的欲望在她的身上摩擦。[pg]");
         outputText("当你粗暴地把她摆好姿势时，她惊讶地叫出声来，但当你进入节奏时，她顺从地低下了身子，她的尾巴在缠绕你的身体时来回摆动。闪亮的黑色线圈在你的[armor]下运作，以熟练的技巧将它们拉开。毛茸茸的、浓密的尾巴温柔地抚摸着[eachCock]，将" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "拉到她如山般高耸的臀瓣之间，用尾尖深情地抚摸着" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "。你的手沿着她臀部宽阔的曲线滑动，陷入她柔软的腰间赘肉中，她颤抖的后臀瓣温柔地抚摸着你的" + (int(get_player().cocks.length) > 1 ? "肉棒" : "肉棒") + "的两侧。[pg]");
         outputText("她的尾巴滑开，让[eachCock]被她巨大的臀部温柔地包裹着。相反，它们散开，在乌黑的皮毛毯子的衬托下，勾勒出她奶油色的球体，更加突出了它们的突出。她用手肘撑着身子，把头靠在手臂上，透过半闭的眼睛斜视着你，轻浮地眨着睫毛。[pg]");
         outputText("[say: 你喜欢我的屁股，是吗？好吧，我能说什么呢，你显然有极好的品味，]她带着得意的笑容说道，并用她的屁股轻轻拍打你的臀部来强调她的话。她的屁股重重地撞击着你，右侧臀瓣上太阳形状的印记随着肉体因撞击而产生的抖动和涟漪而令人愉悦地扭曲着。[pg]");
         outputText("你在她的屁股上狠狠地拍了一巴掌，她呻吟着回应，舒服地翻了个白眼，顺从地沉了下去。[pg]");
         outputText("[say: 嗯，再来……打我！][pg]");
         outputText("当你的手掌再次接触到她的屁股时，森林里回荡着另一声清脆的“啪”声，手掌陷入柔软的肉体中，并在其中激起涟漪。她的舌头淫秽地伸出来，尾巴上的毛发卷曲着，她向前挺动，大口喘气。你感觉到有什么温暖湿润的东西顺着你的[legs]前面流下来，当你意识到她真的从中得到了快感时，你咧嘴笑了！[pg]");
         outputText("你用双手紧紧抓住她如山般高耸的臀瓣，将它们挤压在[eachCock]周围，缓慢而有力地向前挺动你的臀部。她宽大的臀部几乎大到足以将你的" + (int(get_player().cocks.length) > 1 ? "肉棒" : "肉棒") + "完全包裹起来，温暖的肉体在四面八方挤压和抖动着" + (int(get_player().cocks.length) > 1 ? "它们" : "它") + "。随着你的每一次抽插，她的臀部都会向后滑动以迎接你，用她颤抖的臀部热切地抚摸着你的" + (int(get_player().cocks.length) > 1 ? "肉棒" : "肉棒") + "，满足地呻吟着。[pg]");
         outputText("她的一条尾巴滑向你的肚子，向下卷曲，用它毛茸茸的温暖环绕着你的" + get_player().cockDescript(_loc1_) + "。它轻轻地收缩根部，用恰到好处的压力挤压你，使你肉棒的静脉在表面肿胀，轻轻地跳动。她的尾尖在下面弹了一下或两下，伴随着划火柴的声音，你的肉棒突然被蓝色的火焰吞没，火焰在它周围跳跃，留下凉爽的刺痛感。火焰的存在增强了每一种感觉，冰冷的凉爽与空灵的热量混合在一起，从四面八方包围着[eachCock]。[pg]");
         outputText("你挤压她的臀部，在她的屁股上又向前挺动了几次，感觉到高潮的紧张感正在逼近。前戏够了，那么——是时候进入正题了。最后一次将你的" + get_player().cockDescript(_loc1_) + "滑入她颤抖的臀瓣之间，你向后拉，将她的臀部向上倾斜一点，对准她紧致粉嫩的屁眼。当你向前挺动时，守卫她直肠的肌肉环以惊人的轻松让步，几乎是自愿地将你拉入，因为它挤压着你跳动的肉棒。她舔了舔嘴唇，将臀部向后推，用她温暖、紧致的屁股完全吞没你的肉棒，向后伸手抓住她自己的臀瓣，同时用她的肛门向下压，将你困在里面。[pg]");
         outputText("[say: 噢，你现在可是我的人了，]她发出一声愉悦的叹息，脸颊泛起深红。你向后抽动，准备再次挺进，同时捏紧她的臀瓣，让它们紧紧包裹住你的肉棒。[say: 抓到你了……啊！就在我想要的……地方……][pg]");
         outputText("她真的抓到你了吗？不知为何，她的虚张声势显得有些无力，尤其是当你在她屁股里粗暴地冲刺，她只能在欢愉的喘息中勉强挤出这些话时。当然，既然这本来就是她想要的，从某种意义上说她也没说错。你懒得浪费时间去思考这些复杂的状况，而是恢复了有节奏的抽插，用你的" + get_player().cockDescript(_loc1_) + "猛烈地撞击她的后庭，而她则在极致的快感中毫无羞耻地呻吟着。[pg]");
         outputText("强健的肌肉在你的肉棒上下来回蠕动，以你以前从未想过的方式挤压着你。她的内壁带着一种超凡脱俗的温暖紧紧夹住你，爱抚着你的柱身，熟练地榨取着。每次你向后抽动时，都感觉她的屁股几乎要再次将你拉进去，把你吸回她的深处。[pg]");
         outputText("你的胯部猛烈撞击她宽大臀部发出的响亮啪啪声在空气中回荡，与她的呻吟声交织成一首狂喜的打击乐。她的尾巴缠绕在你的四肢上，将你向前拉扯，在她的热情中，她不小心失去了控制，把你拉到了她的背上。当你向前倒去时，她的双腿一软，瘫倒在你身下，突如其来的冲击让她瞬间岔了气。[pg]");
         outputText((get_player().cor > 45 ? "你没有等确认她是否安然无恙，" : "在短暂确认她大体无恙后，") + "你重新调整了平衡，恢复了节奏，抓住她的肩膀作为支撑。当你向后抽动准备再次挺进时，她轻轻合拢双腿，使她突出的臀瓣变得更加明显。当你用力向下冲刺时，它们起到了很好的缓冲作用，随着你胯部每一次猛烈的撞击，像果冻一样晃动着。[pg]");
         outputText("你紧紧抓住她腰间的赘肉，将指尖陷入柔软丰满的肉中，急切地捶打着她紧致的屁股，一次又一次地将胯部拍打在她丰满的臀瓣上。她的大腿随着你的抽插有节奏地紧绷和放松，配合着内部肌肉，给你的" + get_player().cockDescript(_loc1_) + "带来了一场堪比按摩大师的感官按摩。然而，她腰部以上的所有部位都完全放松了，瘫软成一团颓废欲望的淫秽肉堆。当她翻白眼时，只能看到一丝微弱的翠绿，她的舌头从嘴里耷拉出来，伴随着一条长长的口水。[pg]");
         outputText("当你最后一次猛烈地撞入她的屁股时，最后一声清脆的拍打声在空地上回荡。你的" + get_player().cockDescript(_loc1_) + "在达到高潮时疯狂地抽搐，你发出了狂喜的呻吟。");
         if(get_player().cumQ() <= 150)
         {
            outputText("她直肠中痉挛的肌肉强有力地榨取着你的肉棒，从根部到龟头紧紧挤压，你将一股又一股浓稠甜腻的精液射入她的体内。在快感的顶峰，你恢复了充满欲望的抽插，随着你的高潮开始消退，她的肉体在浅浅的波浪中颤抖。当最后的一股精液喷射进她被蹂躏的后庭时，你将手掌按在她厚实的臀瓣上，将它们挤压在一起，紧紧包裹住你的肉棒。当她的肛门紧紧夹住时，你缓慢地向后抽出，将你尿道中最后的存货榨取出来。[pg]");
            outputText("她呈大字型趴在地上，满足地喘息着，六条乌黑的尾巴在空中左右摇摆。你拔出肉棒后不久，一小股精液跟着流了出来，滴落在她双腿之间的地上。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("她直肠中痉挛的肌肉强有力地榨取着你的肉棒，从根部到龟头紧紧挤压，你将一条条滚烫、浓稠、粘稠的精液射入她的体内。在快感的顶峰，你恢复了充满欲望的抽插，随着你的高潮开始消退，她的肉体不断地颤抖。当最后的一股精液喷射进她被蹂躏的后庭时，你将手掌按在她厚实的臀瓣上，将指尖陷入肉中，将它们挤压在一起，紧紧包裹住你的肉棒。当她的肛门紧紧夹住你跳动的肉棒时，你缓慢地向后抽出，将你尿道中最后的存货挤压出来。[pg]");
            outputText("她呈大字型趴在地上，满足地喘息着，六条乌黑的尾巴在空中左右摇摆。你拔出肉棒后不久，一小股精液跟着流了出来，溅落在她双腿之间的地上。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("她直肠中痉挛的肌肉强有力地榨取着你的肉棒，阵阵涟漪般的快感从根部到龟头反复挤压着你，你将一条条浓稠的精液倾泻进她的体内，让你甜腻的精液溅满她的肠道。在快感的顶峰，你恢复了充满欲望的抽插，随着你的高潮开始消退，她的肉体随着每一次强有力的精液喷射不断地颤抖。当最后几股浓稠的精液填满她被蹂躏的后庭时，你将指尖陷入她柔软的肉中，将她的臀瓣挤压在一起，紧紧包裹住你的肉棒。当她的肛门紧紧夹住你跳动的肉棒时，你缓慢地向后抽出，将你尿道中最后的存货挤压出来。[pg]");
            outputText("她呈大字型趴在地上，满足地喘息着，六条乌黑的尾巴在空中左右摇摆。你拔出肉棒后不久，一大股浓稠的精液跟着涌了出来，溅落在她双腿之间的地上。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("她直肠中痉挛的肌肉强有力地榨取着你的肉棒，沉重的涟漪感从根部到龟头反复挤压着你，你将非人般大量的精液倾泻进她的体内，用你甜腻的精液塞满她的肠道。当她开始微微离开地面时，喉咙里发出一声沙哑的呻吟，当你完全彻底地填满她时，那淫秽的精液量撑大了她的肚子。在快感的顶峰，你恢复了充满欲望的抽插，随着你的高潮开始消退，她的肉体随着每一次强有力的精液喷射不断地颤抖。当最后几股浓稠的精液塞满她被蹂躏的后庭时，你将指尖陷入她柔软的肉中，将她的臀瓣挤压在一起，紧紧包裹住你的肉棒。当她的肛门紧紧夹住你跳动的肉棒时，你缓慢地向后抽出，饥渴地榨取着你尿道中最后的存货。[pg]");
            outputText("她呈大字型趴在地上，满足地喘息着，六条乌黑的尾巴在空中左右摇摆。你拔出肉棒后不久，大量的精液跟着涌了出来，一股接一股地积聚在她双腿之间的地上。");
         }
         else
         {
            outputText("她直肠中痉挛的肌肉强有力地榨取着你的肉棒，沉重的涟漪感从根部到龟头反复挤压着你，你将真正怪物般大量的精液倾泻进她的体内，用你甜腻的精液塞满她。当她开始离开地面时，喉咙里发出一声沙哑的呻吟，当你的精液在她的肠道中汹涌澎湃时，那淫秽的精液量像气球一样填满了她的肚子。她的后半身被抬到半空中，因为她被精液胀大的肚子向前倾斜，现在已经胀到了健身球的大小。在快感的顶峰，你恢复了充满欲望的抽插，当你过度填满她时，她的肉体不断地颤抖，高压的精液柱在你的" + get_player().cockDescript(_loc1_) + "周围喷射而出。当你最后的存货塞满她被蹂躏的后庭时，你将指尖陷入她柔软、沾满精液的肉中，将她的臀瓣挤压在一起，紧紧包裹住你的肉棒。当她的肛门紧紧夹住你跳动的肉棒时，你缓慢地向后抽出，饥渴地榨取着你尿道中最后的存货。[pg]");
            outputText("她呈大字型趴在地上，满足地喘息着，六条乌黑的尾巴在空中左右摇摆。你拔出肉棒后不久，一条连续不断的精液河流跟着流了出来，在她双腿之间的地上积聚成一个湿滑的水坑。");
         }
         outputText("[pg]她翻了个身，侧躺在汗水和性爱的水坑里，双手放在她" + (get_player().cumQ() > 1000 ? "膨胀的" : "胖乎乎的") + "肚子上，满足地叹息着，尾巴尖因为残留的快感而轻轻抽搐。你花了一点时间恢复体力，然后收拾好东西，转身向营地走去，留下失去知觉的狐妖自己恢复。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function helixZeKitsunes() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你警惕地看着那个生闷气的狐妖，想知道这是否只是她的另一个把戏，但当你靠近她时，似乎她已经认命了。她带着半挑衅的撅嘴抬头看着你，双臂交叉在胸前，但除了当你抓住她的肩膀把她扔到地上，让她四肢着地时发出一声惊恐的[say: 呀！]之外，没有做出任何抵抗你的尝试。[pg]");
         outputText("好吧，至少她知道什么时候该认输。当你解开系着她长袍的腰带时，你的双手因兴奋而颤抖，你瞬间脱下她的衣服，然后自己也脱得精光。她闪闪发光的深红色尾巴本能地竖起，在微风中左右摇摆，她顺从地将肩膀压向地面，高高撅起臀部。[pg]");
         outputText("[say: 好了，来吧，你打算就这么盯着看吗，亲爱的？]她说道，用手托着下巴，娇羞地对你坏笑。即使在完全顺从的状态下，她们也真的从不错过任何一个挑逗你的机会，不是吗？[pg]");
         outputText("她的屁股随着每一个微小的动作诱人地摇晃着，显眼地展示着右臀上一个五角星形状的大纹身。你淫荡地舔了舔嘴唇，伸出手慢慢地抚摸和揉捏那肉感的球体。她的一条尾巴从你面前扫过，促使你伸出手，用手指抚摸那柔软丝滑的皮毛。[pg]");
         outputText("[say: 啊！~]狐妖呻吟着，她的脸很快变得和她火焰般的头发一样红，绿色的眼睛向上翻白。[say: 哦-哦，就是那里……][pg]");
         outputText("你坏笑着，最后一次用手指滑过她丰满的臀部曲线，然后举起手，重重地拍了下去。她本能地尖叫着向前挺身，这一巴掌让她宽大臀部上摇晃的肉泛起阵阵涟漪。你继续向下滑动，将手指托在她的腹股沟下方，感受着她滴水的小穴散发出的热量，几滴女性的润滑液顺着她的裂隙滚落。那颗透明的水珠慢慢地顺着她耻骨丘的曲线滑下，然后突然开始顺着红发女孩肉棒那长长跳动的轴滚落，与她身下汇聚的稳定的预精液汇合在一起。[pg]");
         outputText("你用拳头紧紧握住她肉棒的根部，另一只手穿梭在她众多的尾巴之间，抚摸着她后腰附近敏感的皮毛。你双手并用，开始缓慢而性感地套弄她的肉棒，同时用手在她的尾巴上进行长长而缓慢的抚摸。[pg]");
         outputText("狐妖发出一声几乎听不见的呜咽，咬着下唇，脸颊上的红晕明显加深了。看来她正试图不表现出她有多享受这种待遇！好吧，你可不能让她得逞，对吧？你稍微用力地挤压她跳动的肉棒，在上下套弄时微微扭动你的手腕。这招奏效了——她再也忍不住了，发出一声低沉沙哑的呻吟，屈服于她最基本的本能，向下挺动着迎合你的拳头，兴奋地弯曲着大腿。[pg]");
         outputText("对你挑逗的结果感到满意，你改变了姿势，抓住她的臀部，将你的[cock biggest]滑入她如山般的臀沟之间。她的尾巴自动卷曲下来，开始抚摸你的肉棒，缠绕在" + (get_player().hasSheath() ? "包皮" : "根部") + "，并在你前后滑动时轻轻收缩。你向后拉，将你的肉棒向下移动，滑过她湿润的阴户外部裂隙，让你的肉棒在她的肉棒下方滑动。你的臀部前后滑动了几次，用她湿滑的体液涂满自己，最后将自己对准她颤抖的双唇，将[cockHead biggest]向前推进，轻轻地分开它们。肌肉收缩，轻轻地挤压和吸吮着你肉棒的顶端，仿佛在主动试图将它吸得更深。[pg]");
         outputText("你双手握住她宽大丰满的臀部，开始将重心向前倾，慢慢地将自己沉入她流着口水的小穴中。第一英寸就迫使她喉咙里发出一声低沉的呻吟，直到你的臀部撞击她巨大的臀部，齐根埋入她温暖紧致的阴道中才停止。" + (get_player().biggestCockArea() > 50 ? " 令人惊讶的是，你毫不费力地把整个东西都塞了进去。尽管这有些令人困惑，但你还是继续前进，而不是对这份意外之喜挑三拣四。" : "") + "[pg]");
         outputText("你小心翼翼地托起她的臀部，站起身来，将她的身体向前弯折成L形。她呻吟着，用大腿夹紧你的腰，双腿和尾巴勾住你的背，张开双臂以保持平衡。别的不说，她的柔韧性确实惊人。[pg]");
         outputText("你向下伸手，" + (get_player().balls > 0 ? "拨开你的[balls]，绕到她的身下，" : "绕到她的身下，") + "握住她粗壮的肉棒，轻轻地将其弯向你的[vagina]。她很容易就领会了你的意图，滑下一条尾巴来帮忙，用毛茸茸的尾巴卷住她粗大的阴茎，引导它滑向你饥渴的阴道。虽然费了一番功夫，但一两分钟后，当龟头开始进入你的体内时，她便发出了愉悦的呻吟。");
         get_player().cuntChange(12,true,true,false);
         outputText("[pg]");
         outputText("你浑身颤抖着，将双手放在她颤动的臀瓣上，让手指深深陷入那柔软的肉中。你开始缓慢而小心地前后挺动臀部，由于姿势有些别扭，动作放得很慢。她那波浪起伏的小穴饥渴地挤压着你的阴茎，而你也不甘示弱，每次抽回时都紧紧夹住她的肉棒，再次挺进时发出清晰的吧唧声。[pg]");
         outputText("[say: 哦哦哦，对，操，就是这样！]她淫荡地哀嚎着，一次又一次地向上挺起臀部迎合你。[pg]");
         outputText("你的手指深深陷入她丰满的臀肉中，紧紧抓住，同时将你的骨盆压向她的。随着你[cock biggest]的每一次抽插，响亮湿润的吸吮声在森林中回荡。每次你挺进她湿透的小穴时，她那根坚硬的肉棒也会在你的体内肿胀跳动，随着你狂暴捣弄的节奏加快，一丝丝粘稠的淫液飞溅到你的肚子上。[pg]");
         outputText("每次你抽回时，她那饥渴的小穴紧紧夹住你阴茎的感觉足以让你欲火焚身，强健的肌肉在你的肉棒上挤压跳动，并强有力地将其吸回。你体内的肌肉也做出了回应，紧紧夹住她跳动的肉棒，随着它开始肿胀，预示着一场巨大的高潮即将到来。[pg]");
         outputText("你又将臀部压向她几次，与她一同发出野兽般的呻吟，你们都越来越接近释放的边缘。你能感觉到她的心跳通过她充血的肉棒传来，与你自己的心跳交织出激情的节奏，随着你们下体的热度不断攀升，快感和欲望不断积累，直到在呻吟和颤抖的交响乐中沸腾溢出。[pg]");
         if(get_player().cumQ() <= 150)
         {
            outputText("虽然你表现得相当出色，但你射出的粘稠精液根本无法与这位红发女郎高潮时产生的惊人量相比。当你的粘稠精流将她的肉壁涂成珍珠白时，她继续将她那令人酥麻、冒着泡的精液泵满你的子宫。每一次抽搐都会喷出另一股浓稠的狐妖精液，进入你迅速膨胀的肚子，伴随着她肌肉发达的肉壁的挤奶般的挤压，榨干你每一滴精液。没过多久，你看起来就像是怀胎十月，你那摇晃着、被精液胀满的肚子沉甸甸地悬挂在她柔软的臀部上方。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("你将一股又一股浓稠的精液射入她饥渴的小穴，在她的肉壁上留下珍珠白的条纹，但即使是你那惊人的射精量也无法与她相比。她的肉棒肿胀跳动，滚烫地压迫着你的阴道壁，将一股又一股浓稠、冒着泡的精液射入你的子宫。她肉棒的每一次痉挛都伴随着她阴道强有力的吸吮，同时将你榨干并填满。当她狂野跳动的肉棒终于平静下来时，你的肚子随着最后一股精液的注入而摇晃，低低地、沉甸甸地悬挂在她柔软的臀部上方。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("你咕哝着、呻吟着，你的[cock biggest]在她的阴道里跳动、抽搐，被精液胀满，将浓稠的精液射入她的子宫深处。你将浓稠的精液倾泻入她饥渴的小穴，与她惊人的射精量不相上下。当你的高潮开始减缓时，她继续将她滚烫的扶他精液泵满你的子宫，一直呻吟着。她的腹部因为你的精液而明显胀大，微微晃动着，但当她的腹部停止膨胀时，你的腹部却继续膨胀，变成了一个圆滚滚的肚子。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("你们一起用惊人数量的精液填满彼此，随着你们的肉棒同时肿胀，你们的精液流不相上下。精液的河流流入狐妖饥渴的子宫，用你充满活力的精液将其填满，而她也以同样的方式回报，你们两人的腹部都在压力下慢慢膨胀。在这次交换中，惊人数量的精液被交易，直到你们都挺着相配的肚子，随着彼此惊人精液的重量而晃动。");
         }
         else
         {
            outputText("她的高潮虽然令人印象深刻，但在强度和活力上完全被你自己的高潮所掩盖，因为你的[cock biggest]随着精液的体积而肿胀，将浓稠的精液河流倾泻入她饥渴的子宫。肌肉发达的肉壁用尽全力挤压和榨取你的肉棒，混合着你浓稠精液的麝香淫液流在阴唇周围喷涌而出，在你的下腹部留下条纹。你的子宫在她浓稠精液的温暖下起泡，随着她将惊人数量的精液泵入你的体内而向外膨胀。你们俩很快就挺着相配的肚子，随着彼此的精液沉重地摇晃和晃动，尽管由于你惊人的产量，她的肚子继续膨胀了一段时间。最终她再也容纳不下了，多余的精液从你的肉棒周围以加压的精流喷发出来，溅在你被精液胀满的肚子下方。");
         }
         outputText("[pg]一旦从她强烈的高潮中充分恢复过来" + (get_player().cumQ() > 1000 ? "并被填满" : "") + "，她花时间伸长脖子，以便能对你回以微笑，脸上挂着满足而又娇羞的笑容。她的尾巴轻轻地散开，覆盖在你肿胀的腹部，温柔地抚摸着，用她神奇的火焰在敏感、被撑开的肉体上画着小圆圈。神奇的火焰在你的[skinfurscales]上引起一阵酥麻，让你几乎要将她掉落，你颤抖着，小心翼翼地将她放到地上。[pg]");
         outputText("当你们的肉棒在分开时擦过彼此，紧随其后的是浓稠、散发着麝香味的精液喷泉，从你们拔出塞子的阴道中倾泻而出，在地上汇聚成一大滩均匀的水洼。狐妖筋疲力尽地翻身仰躺，她那根用尽的肉棒软绵绵地挂在一条大腿上" + (get_player().cumQ() > 1000 ? "，她肿胀的腹部慢慢地排空到森林的地面上" : "") + "。[pg]");
         outputText("你转身去收集你的[armor]，清理干净并再次穿好衣服，然后听到树叶沙沙作响的声音，猛地转过身来。一串黏糊糊的脚印将你的视线引向灌木丛的边缘，一闪而过的红色尾巴和一对丰满的臀瓣消失在森林中。");
         get_player().orgasm("Dick");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function get_debugName() : String
      {
         return "狐妖";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getRapedByRedHeadFutaKitsune() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你瘫倒在地上，虚弱得再也无法反抗。红发女子带着恶作剧的笑容，调皮地走到你面前，蹲下来戳了戳你的侧腹。[pg]");
         outputText("[say: 已经结束了？我以为像你这样强壮的[boy]会反抗得更激烈些呢。][pg]");
         outputText("她轻轻耸了耸肩，停止了对你的责备，开始办正事，小心翼翼地脱下你的[armor]，把你翻转过来，好好看看你的身体。当她的手在你赤裸的身体上游走时，你徒劳地反抗着她不断的捏掐和抚摸，无法抗拒被唤起的欲望。她的指尖滑过你的[chest]，在你的[nipples]周围打转时轻轻按下。空灵的火焰在她的手指滑过你的肌肤时在指尖后方噼啪作响，让你全身都因快感而刺痛，迫使你喉咙里发出一声呻吟。[pg]");
         outputText("当她开始检查你的下半身时，她那毛茸茸的红色尾巴开始缠绕你的四肢，把你的手臂绑在背后。" + (int(get_player().cocks.length) > 0 ? " 她漫不经心地举起[oneCock]，调皮地来回摇晃，看着你因快感而扭曲的表情咯咯地笑。" : "") + (get_player().balls > 0 ? " 她用手捧住你的[balls]，稍微掂量了一下，仿佛在估量它们的大小，用一条尾巴的尖端挠着你阴囊的底部。" : "") + (get_player().get_gender() >= 2 ? " 然后她的指尖轻轻地在你的腹股沟上游走，滑下去爱抚并分开你[vagina]的阴唇，带出一条细细的女性淫液。" : "") + "[pg]");
         outputText("" + (get_player().get_gender() == 0 ? "[say: 呵，好吧，这情况有点尴尬……]她看着你那奇怪的、没有特征的腹股沟说道。她把你翻转过来趴着，微笑着，轻轻拍了拍你的[ass]。[say: 但至少看起来你还是能玩<i>一些</i>花样的……]" : "[say: 哦，我们将会玩得<i>很开心</i>的，你和我，]她说着，轻轻拍了拍你的头。") + "[pg]");
         outputText("当她对自己的挑逗感到满意后，她决定进入正题，脱下了她的长袍。她把长袍从肩膀上拉下来时，向你露出了狡黠的笑容，任由她那巨大的乳房弹跳出来，给你表演了一番，她捏着自己的乳头，发出轻微的呻吟。她扯下腰间的腰带，让长袍完全掉落，你看着她那根跳动着的、十二英寸长的肉棒弹了出来，不再受到衣服的束缚。[pg]");
         outputText("虽然她那令人印象深刻的本钱并不像这片奇异土地上的其他怪物那样可怕，但环绕在它周围的诡异蓝色火焰却让你感到担忧。不过你对此无能为力，因为你被她的尾巴缠住了，无法抵抗她的进攻。当你感觉到她压在你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "上时，你扭动了一下，徒劳地挣扎着，试图挣脱绑住你的尾巴。当你感觉到龟头推开你的");
         if(get_player().hasVagina())
         {
            outputText("入口");
         }
         else
         {
            outputText("肛门");
         }
         outputText("时，你的恐惧稍微减轻了一些，你意识到那幽灵般的火焰并没有烧伤你，而是让你充满了一种凉爽的刺痛感。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(24,true,true,false);
         }
         else
         {
            get_player().buttChange(24,true,true,false);
         }
         outputText("[pg][say:嘘，放松点，很快就会结束的，亲爱的，]她在你耳边低语，露出牙齿，带着一种近乎施虐的快意。[pg]");
         outputText("她用双臂环住你的腰，猛地一挺，将她那粗壮的肉棒剩下的部分塞进你的体内，让你在");
         if(get_player().hasVagina())
         {
            if(get_player().vaginalCapacity() < 30)
            {
               outputText("痛苦和");
            }
            outputText("快感中嚎叫起来。你的肌肉本能地夹紧了入侵者，不顾你自己的意愿，榨取着她跳动的肉棒，狐妖舒服地呻吟着，眼睛微微翻白。[pg]");
         }
         else
         {
            if(get_player().analCapacity() < 30)
            {
               outputText("痛苦和");
            }
            outputText("快感中嚎叫起来。你的肌肉本能地夹紧了入侵者，不顾你自己的意愿，榨取着她跳动的肉棒，狐妖舒服地呻吟着，眼睛微微翻白。[pg]");
         }
         if(get_player().get_gender() >= 2)
         {
            outputText(get_player().vaginas[0].vaginalLooseness < 3 ? "[say:啊！又紧又舒服，正是我喜欢的！]她呻吟着，紧紧抓住你的腰，开始用力地抽插。" : "[say:嗯……对我来说有点松，不过我想也只能这样了。你该不会是和牛头人还有触手怪鬼混过吧，小可爱？]她戏谑地说着，居高临下地捏了捏你的脸颊。");
         }
         else
         {
            outputText(get_player().ass.analLooseness < 3 ? "[say:啊！又紧又舒服，正是我喜欢的！]她呻吟着，紧紧抓住你的腰，开始用力地抽插。" : "[say:嗯……对我来说有点松，不过我想也只能这样了。你该不会是和牛头人还有触手怪鬼混过吧，小可爱？]她戏谑地说着，居高临下地捏了捏你的脸颊。");
         }
         outputText("[pg]火焰的凉意和她肉棒的温暖在你的体内争夺主导权，随着她的每一次抽插，你都能感觉到她的心跳在肉棒中跳动。[pg]");
         outputText("当她把你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "当成她个人的泄欲洞时，她的许多尾巴开始在你赤裸的身体上抚摸和挑逗，用它们毛茸茸的尖端给你挠痒痒，在你的肉体上画出一道道火焰的痕迹。每当其中一条尾巴划过你的性感带时，你都会忍不住颤抖，凉爽的火焰在你最敏感的部位挠痒痒，带来阵阵刺痛。你在她身下扭动挣扎，发出一声颤抖的呻吟，你身体的每一块肌肉都因为她尾巴温柔的抚摸和她肉棒粗暴的活塞式抽插所形成的奇妙对比而产生共鸣，沉浸在快感之中。[pg]");
         outputText("[say:是的，是的，哦，天哪，是的！]她仰天尖叫，舌头放肆地伸在外面，以一种近乎野蛮的狂热将她的骨盆砸向你的骨盆。痛苦早已被快感所取代，但你知道，当这一切结束时，你明天早上可能会感到酸痛。[pg]");
         outputText("你感觉到自己被稍微抬离了地面，一条尾巴在你的背上滑上滑下。当它刷过你时，你的肌肉不由自主地收缩起来，现在你几乎能看清这个鲁莽红发女郎肉棒上的每一根血管和皱纹，感觉到她心跳的快速跳动。她的肉棒因充满了浓稠的精液而肿胀，你能感觉到滑腻滚烫的精液喷射而出，淹没了你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "。你的内脏榨干了她肿胀的肉棒里每一滴扶他精液，她的臀部不断地抽动，像个发情的青少年一样粗暴地撞击着你。她那庞大的精液量是如此之大，以至于你能感觉到你的腹部开始肿胀，高压的精液流开始溢出，洒在地上。[pg]");
         outputText("当她终于平静下来，伴随着满足的叹息拔出肉棒时，你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "大张着，一条精液小河缓缓流出。你的肚子已经肿得像个西瓜，随着她那惊人分量的扶他精液的重量沉甸甸地晃动着。她那根用过的肉棒软绵绵地挂在双腿之间，精液和爱液的混合物从顶端滴落。[pg]");
         outputText("她俯下身，在你耳边用某种奇怪的语言低语了一句，你几乎立刻感觉到你的意识开始模糊。在你失去知觉之前，你看到的最后一件事是她那半软的肉棒在双腿之间快乐地摇摆着，她弯下腰去捡她的衣服，让你最后看了一眼她那宽大圆润的屁股。[pg]");
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function getLickedByKitsunes() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("为了防备她再耍花招，你慢慢地向前走，眼睛死死盯着她，以防她突然发难。你运气不错，她只是退到了一棵树旁，后脑勺撞到树皮上发出一声令人作呕的闷响，她痛呼一声，皱起了眉头。当她揉着后脑勺的痛处时，你的目光在她的身上游走，女性下体中积聚起一阵渴望。当你蹲下身与她平视时，你轻轻抬起她的下巴，倾身吻她，当她柔软粉嫩的嘴唇微微张开接纳你的舌头时，你发出了轻声的呻吟。[pg]");
         outputText("你一只手抚摸着她的后脑勺，沉浸在这个吻中，身体充满激情地贴着她的身体滑动，你的[nipple]因为兴奋而变硬。当你的舌头和她的舌头交缠时，你在她的大腿上摩擦，将麝香般的汁液涂抹在上面。你的双手在她的脸和胸前上下滑动，指尖滑过每一道曲线，最后你结束了这个吻，一条银丝连接着你和她的下唇。[pg]");
         outputText("当你盯着那闪亮的粉色软肉时，你用拇指轻轻地刷过它们，惊叹于它们是多么的柔软和丰满。没过多久，你开始想象它们吻在你身体其他部位的感觉，你决定满足自己的好奇心，拉开你的[armor]，露出你的[vagina]。看到你湿滑的缝隙，她几乎难以察觉地舔了舔嘴唇，饥渴的目光停留在你的双腿之间。[pg]");
         outputText("当你躺在草地上时，她几乎不需要任何强迫就低下了头，" + (get_player().isBiped() ? "埋在你的双腿之间" : "埋进你的胯部") + "。你把手放在她的后脑勺上，仅仅是做做样子，因为她正以毫不掩饰的热情一头扎进你湿滑的阴户。当她丰满的嘴唇轻轻包裹住你的[clit]，舌尖在上面轻轻弹动时，你无法抑制住呻吟。她用拇指勾住你的下唇，轻轻地将它们分开，舌头在你的阴唇内侧打转，一路向下。她丰满的嘴唇张成一个粉红色的O形，舌头滑出，仿佛过了一个世纪那么长，像一条淫秽的触手一样扭动着。舌尖在守卫你入口的肉环上戏弄地打转，似乎在试图哄骗它为她打开。[pg]");
         outputText("虽然她的嘴深深地埋在你的褶皱中，但你可以看出她抬头看着你时在微笑。当她的舌头继续挑逗你，却始终没有插入你等待的褶皱时，她绿色的眼睛里闪烁着恶作剧的光芒。然而，这种游戏两个人都能玩，你对她的戏弄进行了反击，将指尖按在她的后脑勺上，臀部向前挺，强迫她埋进你颤抖的阴户。[pg]");
         outputText("当她明白你的暗示——你不是好惹的——你的眼睛向上翻，她用扭动的舌头探索你的深处，灵活的器官滑入你的体内，在你敏感的内壁上滚动。舌尖卷曲着抵住你内部腔室的顶部，轻轻地戳着敏感的肉体，让你的脊背一阵阵发抖。当她沉得更低时，她的眼睑下垂，温柔的呻吟通过你痉挛的内壁传上来，她扭动的舌头探索着你内心的深处，戳着你以前没有完全意识到的区域。[pg]");
         outputText("当你把她紧紧抱在腹股沟时，你的双手在颤抖，在狂喜中弓起背，对着空气呻吟。她舌头熟练的服侍给你带来了无与伦比的快感，像一条扭动的蛇一样在你的[vagina]里扭来扭去。她有目的地控制着她的舌头，每一次涂满唾液的挑逗都让你进一步陷入激情的阵痛中。你狂热地发抖，抚摸着她的耳廓，引出她深沉的呻吟，呻吟声穿过你的内壁，在你体内回荡，你也大声地回应着她的情感。[pg]");
         outputText("就在你觉得即将达到高潮的边缘时，她温柔的攻势出现了停顿，她的舌头慢慢地抽离，你被从边缘拉了回来，你太清楚自己离高潮有多近了。还没等你责备她的无礼，你被一阵难以置信的快感惊呆了。就在你的感官在色彩和声音的海洋中爆炸之前，你看到这个调皮的女孩用拇指和食指捏住你的[clit]，指尖上跳跃着旋转的蔚蓝火焰。强烈的刺痛感同时又热又冷，以一种奇怪的节奏起伏，让你有规律地在快感中挣扎。[pg]");
         outputText("被同样的火焰包裹着，她的舌头再次探下分开你的阴唇，将蔚蓝的火花带入你的[vagina]深处，好奇地探索着你的深处。你的双手再次摸索到她的后脑勺，手指与她闪亮的黑发交织在一起，用尽全力将她按在你的腹股沟上。你臀部的每一次向上挺动都将她扭动的舌头深深地推入你颤抖的阴户，燃烧的舌尖戳着你的子宫颈，让你的脊背一阵阵发抖。她柔软的粉色嘴唇抚摸着你的阴唇，轻轻地挤压和啃咬，她全身心地投入到取悦你的任务中。[pg]");
         outputText("当你迅速被逼回悬崖边缘时，你全身都在颤抖，她被魔法强化的舌头服侍没有给你任何喘息的机会，她以一种近乎饥渴的狂热攻击着你的下体。当一股液体溢出流进狐妖的嘴里，用你麝香般的女性汁液浸湿她的下巴时，你的肌肉紧紧地夹住她的舌头。你用尽最后一丝力气将她向内拉，淫秽地呻吟着，然后重复了第二次和第三次。在第三次呻吟时，你狂喜的尖叫声在森林中回荡，惊飞了天空中的鸟儿，你的高潮像海啸一样席卷了你的身体。[pg]");
         outputText("在你挣扎着达到高潮的整个过程中，她的舌头继续在你颤抖的内壁上扭动，饥渴地将流出的每一滴液体都吸进嘴里。" + (get_player().vaginas[0].vaginalWetness == 5 ? " 淫液从你流着口水的阴户中喷射而出，在几秒钟内浸湿了她的脸，然后她张大嘴巴，贪婪地吞下所有能吞下的东西。" : "") + " 感觉过了一个世纪那么长，你的高潮开始消退，颤抖的快感脉冲逐渐减弱，你的头脑慢慢清醒。你喘着粗气，松开了紧紧抓住她头的手，让她退后喘口气，而你也仰面瘫倒在地，做着同样的事情。[pg]");
         outputText("她满意地舔了舔嘴唇，然后用袖子擦了擦嘴，幸福地叹了口气，然后瘫倒在树旁休息。你在狂喜中四仰八叉地躺在地上好几分钟，最后才鼓起力气站起来，当你这样做时，粗略地环顾四周，发现这只狡猾的狐妖已经逃之夭夭了。当你收拾好东西准备回营地时，你几乎能听到森林里传来一阵恶作剧般的咯咯笑声的微弱回音。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function getABJFromAFoxGirl() : void
      {
         clearOutput();
         kitsuneSprite();
         var _loc1_:int = get_player().cockThatFits(108);
         outputText("站在被击败的狐妖面前，你听到了一声微弱的呻吟。出于好奇，你弯下腰，惊讶地发现声音是从女孩的肚子里传出来的。[pg]");
         outputText("她轻轻地揉着她那有些圆润的肚子，叹息着呜咽道，[say: 好饿……][pg]");
         outputText("所以，她饿了，是吗？你带着坏笑告诉她，你正好有东西可以解决这个问题。[pg]");
         outputText("脱下你的[armor]，你把她拉成跪姿，将她的背压在一棵树上，笑着展示你的" + get_player().cockDescript(_loc1_) + "。她饥渴地盯着它，舔了舔嘴唇，眼中满是欲望。当她伸手想把它握在手里时，你却抓住了她的手腕，把它们按在树干上。你解释说，她只能用嘴，如果她做得好，<i>那么</i>你就会满足她的饥饿感。[pg]");
         outputText("她娇羞地撅起嘴，撅起她那丰满、诱人的嘴唇。你的目光被它们吸引，直到现在你才注意到它们是多么的多汁和丰满。当她向前倾身，将嘴唇贴在你的" + get_player().cockHead(_loc1_) + "上时，它们似乎变得更加丰满了，它们温暖的湿润感让你的腹股沟一阵愉悦的颤栗。[pg]");
         outputText("她抬头对你咧嘴一笑，钻到你的肉棒下方，用鼻子把它顶起来，将舌头平铺在你的" + (get_player().hasSheath() ? "包皮" : "根部") + "下方，然后慢慢向上滑动。双手被束缚似乎并没有妨碍她取悦你的能力——甚至似乎让她更加兴奋。她用鼻子把你的" + get_player().cockDescript(_loc1_) + "推到你的肚子上，渴望地沿着下方亲吻，发出湿润的吧唧声。[pg]");
         outputText("[say: 嗯……太好吃了……等不及你喂我好多好吃的精液了，]她含糊不清地含着你变硬的肉棒说道，总是用那双绿色的大眼睛端庄地看着你。[pg]");
         outputText("她一寸一寸地用舌头沿着肉棒向上舔，毫不掩饰地大声舔舐着，对你的肉棒倾注着爱意。伴随着最后一声夸张的吸吮声，她用湿润的舌头从" + (get_player().hasSheath() ? "包皮" : "根部") + "舔到" + get_player().cockHead(_loc1_) + "，调皮地眯起了眼睛。温暖的湿润感包裹着你肉棒的末端，当她从鼻子里慢慢呼气时，一阵微风拂过。她凉爽的薄荷味呼吸和她嘴里的温暖形成对比，让愉悦的火花在你的肉棒上呈锯齿状蔓延，让你浑身发抖。[pg]");
         outputText("你不得不承认，这个贪吃的荡妇确实有两把刷子！当她把丰满的嘴唇张成一个大大的O型，吞没你的肉棒时，你不得不强忍住呻吟。她把头歪向一边，脸颊鼓了起来，把你困在那里。她直起身子，开始上下摆动头部，不断地把你推向她的喉咙深处。她那柔软的粉色嘴唇在你的肉棒上滑动的触感在你的下半身荡漾，让你在愉悦中发出低沉的呻吟。然而，在你得意忘形之前，她向后退去，嘴唇紧紧地挤压着每一寸，直到你跳动的肉棒伴随着一声响亮的“啵”声从她的嘴唇中挣脱出来！她熟练地用下唇接住了顶端，舌头蛇般伸出，轻轻地托住下方。[pg]");
         outputText("[say: 嗯……我太幸运了……]她低声哼唱着，嘴角上扬，轻轻地亲吻着它，在顶端吹过凉爽的蔚蓝色火焰。[say: 感觉好吗？][pg]");
         outputText("你的肉棒再次被吞没，被迫进入她的喉咙深处，她一寸一寸地吞下你跳动的肉棒。她向后退去，仿佛她的生命取决于此般吸吮着，然后再次低下头，绝望地吸吮着你咸咸的淫液。你肉棒的" + get_player().cockHead(_loc1_) + "一次又一次地撞击着她的喉咙深处，");
         if(get_player().cocks[_loc1_].cockLength > 9)
         {
            outputText("她头部的每一次摆动都让她的嘴唇越来越靠近你的");
            if(get_player().balls > 0)
            {
               outputText(get_player().ballsDescriptLight());
            }
            else
            {
               outputText("[sheath]");
            }
            outputText("。她饥渴地吞咽着你的长度，对着你肿胀的肉棒呻吟着，最后将嘴唇贴在你的" + (get_player().hasSheath() ? "包皮" : "根部") + "上，在愉悦中翻着白眼，她的脖子因为你肉棒的存在而微微凸起。[pg]");
         }
         else
         {
            outputText("每次她吞下你时，她的嘴唇都会性感地挤压着" + (get_player().hasSheath() ? "包皮" : "根部") + "。她剧烈地呻吟着，闭上眼睛，在嘴里来回滚动你的" + get_player().cockDescript(_loc1_) + "，用舌头性感地在上面盘旋。[pg]");
         }
         outputText("她的喉咙肌肉在你周围起伏和跳动，发出响亮的吸吮和吞咽声，这只会助长你的欲望。她向后退去，嘴唇只撅在最顶端，渴望地盯着你看了一会儿，然后闭上眼睛，再次吞下你的整个长度。当她的脸刺穿你的肉棒时，你能感觉到她的舌头从嘴里滑出来，低头看到那条长得离谱的舌头缠绕在你的肉棒上，轻轻地挤压着。你的肉棒在它周围凸起，肿胀得令人难以置信，狐妖抬头看着你，装出一副无辜的样子。[pg]");
         outputText("她继续狂野地深喉，在你一次又一次将整根肉棒塞入她喉咙时，她含着你的阴茎发出呻吟。随着她头部的每一次起伏，混合着前列腺液的唾液开始从她嘴角飞溅而出，顺着你的肉棒滴落" + (get_player().balls > 0 ? "并流过你的" + get_player().ballsDescriptLight() : "") + "。在欲望的驱使下，你决定放弃之前的交涉，松开她的手腕，转而抓住她的后脑勺。当你向前挺动臀部，让她的头微微后仰并发出低沉的呻吟时，你的阴茎感受到了一阵轻微的颤动。[pg]");
         outputText("趁着重获自由，狐妖的双手在你的身体两侧上下滑动，一缕缕火焰在她的指尖燃起并跳跃，只为进一步提升你的快感。");
         outputText(get_player().balls > 0 || int(get_player().vaginas.length) > 0 ? " 她的手滑过你的身体两侧，" + (get_player().balls > 0 ? "用手托起你的[balls]，紧紧地揉捏着" + (int(get_player().vaginas.length) > 0 ? "，并且" : "") : "") + (int(get_player().vaginas.length) > 0 ? "用食指挑逗地划过你的肉缝" : "") + "。" : "");
         outputText("她的喉咙肌肉完全放松，开心地屈服于你粗暴的口交。[pg]");
         outputText((get_player().cocks[_loc1_].cockLength > 15 ? "你一次又一次地向前挺动[hips]，将骨盆压在她的脸上。你的" + get_player().cockDescript(_loc1_) + "滑入她的喉咙，让她的脖子向外凸起，而她唯一的反应就是含着它呻吟，饥渴地吞咽着。她用嘴唇性感地按摩着你的肉棒，用她的舌头和喉咙" : "她用嘴唇性感地按摩着你的肉棒，用她的舌头") + "在你每次后撤时都急切地将你再次吸入。从你剧烈挺动的腹股沟传来的强烈呻吟声中，你判断她一定很享受被这样使用，这个想法让你的欲望更加高涨。[pg]");
         outputText("当你的快感开始达到顶峰时，你感觉到你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺") + "中有一股紧绷感在膨胀，你的手指穿过她柔软的乌黑秀发。她闪烁着绿光的眼睛向上翻起，张开喉咙欢快地迎接你的高潮，她的舌头在你的肉棒上舞动。当你的高潮降临时，在她的舌头仍然紧紧抓住你的" + (get_player().hasSheath() ? "包皮" : "根部") + "的后方，一个粗大的凸起开始膨胀。它不断积聚，直到压力大到无法抑制，然后一次性全部释放出来，当美味、咸涩的浓精涌入她的喉咙时，狐妖含着你的阴茎发出强烈的呻吟。[pg]");
         outputText("她饥渴地吸吮着，双手紧紧握住你的肉棒，拼命地榨取着它，仿佛这是她最后一顿饭。");
         if(get_player().cumQ() <= 150)
         {
            outputText("当一股又一股粘稠的精液倾泻进她的喉咙时，她的舌头在嘴里打转，收集着每一滴溢出的精液。她急切地吞咽着，最后一次将你的肉棒吞下，收紧嘴唇，从你的尿道中挤出最后几滴精液，然后伴随着一声响亮的“吧唧！”声抽离。[pg]");
            outputText("[say: 嗯……真好吃……还有……还有吗？]她满怀希望地问道，擦去嘴角的唾液，饥渴地舔着指尖。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("你将一缕缕浓稠的精液灌入她的喉咙，发出高潮的呻吟，她的舌头在周围打转，接住任何溢出的水滴。她急切地吞咽着，最后一次将你的肉棒吞下，收紧嘴唇，从你的尿道中挤出最后几滴精液，然后伴随着一声响亮的“吧唧！”声抽离。[pg]");
            outputText("[say: 嗯，真是……美味，]她带着幸福的微笑说道，满意地舔了舔嘴唇。[say: 你确定没有更多了吗？]");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("浓稠的精液喷涌进她的喉咙，用你翻滚的、咸涩的精液填满了她的胃。她急切地吞咽着，最后一次将你的肉棒吞下，收紧嘴唇，从你的尿道中挤出最后几滴精液，然后伴随着一声响亮的“吧唧！”声抽离。[pg]");
            outputText("[say: 哦，真是</i>神仙般的享受<i>，]她带着满意的笑容说道，拍了拍肚子，渴望地舔了舔嘴唇。[say: 拜托……你还有吗？]");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("一股浓稠的精液洪流撑胀了你的肉棒，倾泻进她的喉咙，由于想要一次性流下的量太大，让她的喉咙微微凸起。即使她如此热情地吸吮，还是有几股精液溢了出来，从她嘴角喷出，顺着下巴滴落。她含着你的阴茎发出低沉的呻吟，吸干了你提供的最后一滴精液，随着她吞下一股又一股精液，她略显丰满的肚子微微凸起。她最后一次吞下你的肉棒，收紧嘴唇，从你的尿道中挤出最后几滴精液，然后伴随着一声响亮的“吧唧！”声抽离。[pg]");
            outputText("[say: 哦，真是</i>神仙般的享受<i>。这么多……]她说道，向后靠在树上，满意地抚摸着现在圆鼓鼓的肚子，舌头慢慢地舔过上唇。[say: 你觉得我还能再要一点吗？]");
         }
         else if(get_player().cumQ() <= 6000)
         {
            outputText("浓稠的精液撑胀了你的肉棒，像一条白色的河流一样涌入她的喉咙，由于一次性流下的精液量太大，她的脖子微微凸起。她尽力吞下每一滴精液，她丰满的肚子开始膨胀成一个圆鼓鼓的凸起，但即使她热情地吸吮也无法阻止精液倒流。浓稠的精液从她嘴角喷出，她的舌头拼命地想要接住它们，而两股精液则从她的鼻孔喷出，顺着下巴滴落。她的肚子已经膨胀成一个极其巨大的圆形凸起，随着你加入的每一股新精液而晃动，上面沾满了她无法吞咽的滴落物。她最后一次吞下你的肉棒，收紧嘴唇，从你的尿道中挤出最后几滴精液，然后伴随着一声响亮的“吧唧！”声抽离。[pg]");
            outputText("[say: 哦哦哦哦哦，是的……这么多……这么美味……我吃饱了，]她语无伦次地嘟囔着，揉着肚子，脸上露出极其满意的表情。[say: 你随时都可以来操我的喉咙……]");
         }
         else
         {
            outputText("大量的精液在你的肉棒中积聚，努力冲破你紧绷的尿道，向着最终的目的地不断膨胀。当浓稠的精液顺着她痉挛的食道流下时，她的脖子凸了起来，当第一股精液几乎瞬间填满她的胃时，她惊讶地向前倾倒。她的嘴唇紧紧包住你的肉棒，她尽最大努力吞下最后一滴精液，但她喉咙肌肉强大的挤压力根本无法与你男子气概的惊人压力相抗衡。她丰满的肚子在片刻之间膨胀到了一个惊人的大小，而她的舌头拼命地在你的阴茎边缘游走，试图接住从她嘴角溢出的浓稠精液。两股精液从她的鼻孔喷出，喷在你的腹股沟上，又溅回到她的脸上，而大量的精液则从她的嘴唇溢出，溅落在她的下巴上，覆盖了她的胸部和肿胀的腹部。尽管有如圣经洪水般的精液涌入她的体内，她还是努力地试图尽可能多地咽下去，吞下一股又一股精液，她的肚子继续向外晃动，随着你精液的重量而晃动。她的脸颊不时地被倒流的精液撑起，然后她强迫自己再次吞咽，现在似乎处于自动驾驶状态——她绿色的眼睛空洞而呆滞，斗鸡眼并向上翻起，露出一种纯粹的、令人崩溃的快感表情。[pg]");
            outputText("当你后撤时，她的喉咙肌肉紧紧包住你的肉棒，从你的尿道中挤出最后几股精液，当你抽离时，森林中回荡着一声响亮的“吧唧”声。她丰满的嘴唇撅在一起，两颊都鼓鼓的，里面装着你强力喷射的最后残余。它们颤抖了片刻，然后她羞愧地低下头，大量的乳白色液体流入她向上翻起的手掌中。[pg]");
            outputText("她双手捧成杯状，试图徒劳地保存这一切，但实在太多了，相当一部分精液最终大声地溅落到地上。在她失去更多之前，她低下头开始舔舐手掌，贪婪地吸吮着残渣，同时为失去那最后几滴而惋惜。[pg]");
            outputText("当她抬头看着你时，她的下巴和脸颊上涂满了一层厚厚的精液，但她的眼睛里闪烁着只能被描述为纯粹、毫不掩饰的崇敬的光芒。[pg]");
            outputText("[say: 我……我从来没有……我从来没有被一个凡人……这-这样填满过……再来……再操一次我的喉咙……求你了？]");
         }
         outputText("[pg]你满意地叹了口气，从树旁退开，喘了口气。" + (get_player().cumQ() > 1000 ? " 狐妖向后靠去，双手捧着她饱满的肚子，脸上带着幸福的微笑，几丝混着精液的唾液顺着她的下巴滴落，一小滩汁液在她的膝盖间蔓延开来。你刚给了她那样粗暴的深喉，她怎么还能看起来这么高兴，这让你无法理解，但从目前的情况来看，她对结果非常满意。" : " 狐妖向后靠去，一只手放在肚子上轻轻揉搓着。你听到一声清晰的咕噜声，她困惑地叹了口气，摇了摇头。") + " 不管怎样，这个筋疲力尽的女孩似乎不会很快站起来，所以你收拾好东西，准备回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function genderlessKitsuneStillHungry() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("就在你即将失去意识的时候，你被黑发狐妖将你从她姐姐的怀抱中拉出来的感觉唤醒了，她让你平躺着，然后俯身在你上方。[pg]");
         outputText("[say:还是好饿……]她轻声说道，轻轻地揉着她胖乎乎的肚子，发出一阵轻微的咕噜声。[pg]");
         outputText("她摊开手掌，相互摩擦了一会儿，然后轻轻吹了口气。伴随着噼啪的脆响，一团明亮的蓝色火焰在她的手中燃起，她将手掌按在你的[chest]上，轻柔地按摩着。随着她神秘火焰那清凉的刺痛感在你的胸前蔓延，你能感觉到一股紧绷的压力正在积聚，快感流遍全身。你的" + (get_player().biggestTitSize() < 3 ? (get_player().biggestTitSize() == 0 ? "平坦的胸部开始" : "乳房开始") + "膨胀，晃动的乳肉在紧绷的刺痛感中溢出，直到你自豪地拥有一对尺寸可观的C罩杯" : "乳房似乎丰满了一些，乳头变硬，紧绷的刺痛感在其中蔓延。") + "你弓起背，紧紧抓住胸口，随着刺痛感的加剧，快感的烈焰在你的胸腔中燃烧。在达到高潮的顶点时，你的乳汁开始从乳头喷射而出，像淫荡的喷泉一样飞溅到空中。[pg]");
         outputText("你坚硬如石的乳头立刻被女孩柔软的嘴唇包裹，陷入了她温暖口腔的湿润牢笼中。一条长得不可思议的舌头滑了出来，将唾液涂抹在你肿胀的乳房上，并紧紧缠绕住其中一个。她那柔软粉嫩的嘴唇性感地吸吮着你的乳头，将它们吸入并娇柔地啃咬着果肉，你的乳汁开始顺着她的喉咙流下。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            outputText("当红发女孩涉水过来加入这场狂欢，并轻轻拍打她妹妹的屁股时，一声颤抖的呻吟穿透了你的乳房。她的肉棒滑入那个丰满黑发女孩宽阔的臀部之间，然后猛地一挺，插入了她湿透的小穴。她每一次向前挺动，黑发女孩都会发出愉悦的呻吟，那种嗡嗡的感觉令人愉悦地在你的乳头中震荡。当她被姐姐粗暴对待时，唾液的丝线开始顺着她的下巴滑落，她的头埋进你的乳沟，同时性感地将自己的胸部贴紧你。[pg]");
         }
         else
         {
            outputText("当红发女孩滑到你身边时，手指轻柔地划过你的[chest]，指尖火花四溅，她环绕着你空闲的[nipple]，引出一声呻吟。她的身体柔软地贴着你，一条腿搭在你的腰上，她低下头，开始用舌头沿着外缘舔舐，为她妹妹做着热身。[pg]");
         }
         outputText("当六条金色的尾巴压在你的身体上，蔚蓝色的余烬性感地在你的皮肤上嘶嘶作响时，一阵快感的冲击穿透了你。金发女孩在挑逗你时轻轻地咯咯笑着，眼中充满了恶作剧的意味，一根手指轻轻地描摹着你的下颌轮廓。这是一个简单的动作，但她做的方式让你几乎融化在她的怀里，现在的你比以往任何时候都更像是快感的奴隶。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
         {
            outputText("红发狐妖的胯部一次又一次地拍打着她姐妹的屁股，将她顶得撞向你的胸膛，发出一声惊呼。黑发女孩的嘴唇湿润地在你的乳头上起伏滑动，随着红发狐妖将手指深深陷入她丰满的臀肉中，她翻着白眼发出淫靡的呻吟，喉咙深处震颤出低沉的喘息。随着红发狐妖释放出如注的精液，空气中响起液体咕噜咕噜的声音，黑发狐妖的肚子慢慢胀大。她贴着你胸膛的呻吟声随着时间的推移越来越强烈，双手热情地揉捏挤压着你的乳房。[pg]");
         }
         outputText("[say: 喂我……]黑发狐妖低语着，从你那充满乳汁的乳房上稍稍移开了一会儿。[pg]");
         outputText("你的乳房周围出现了一簇蓝色火焰，这强制性的要求让你别无选择，只能顺从。一种不自然的压力再次开始充满它们，这肯定是狐妖之前施展的巫术的结果。你的乳头胀大，浓稠的后乳慢慢涌向表面，流过她丰满粉嫩的嘴唇。你的大脑一片空白，视线中闪烁着白斑，你在空气中发出高潮般的呻吟。一升又一升的乳汁" + (get_player().lactationQ() > 0 ? "，这是你分泌过的最浓稠的，" : "") + "开始流入黑发狐妖的喉咙，被她毫不犹豫地急切吞下。两股乳汁从她的鼻子里喷出，她的脸颊因乳汁而鼓起，嘴唇紧紧闭合，尽可能多地含住乳汁，而她的肚子随着重量的增加继续晃动，随着越来越多的乳汁流进她的喉咙，肚子发出咕噜咕噜的晃动声。[pg]");
         outputText("当你们四人在快感的浪潮中沉浮了仿佛几个世纪之久，每一秒的流逝都让你感到越来越疲惫，你的眼皮越来越沉重，肌肉也变得无力。[pg]");
         outputText("被这场折磨耗尽了体力，你放松下来，陷入了幸福的昏迷中，只隐约感觉到自己被拖到了甲板上。在失去意识之前，你最后记得的是三姐妹爬到你身边，在你精疲力竭的身体上施展她们扭曲的魔法。");
         outro();
      }
      
      public function fuckDraftBlond() : void
      {
         clearOutput();
         kitsuneSprite();
         var _loc1_:int = -1;
         var _loc2_:int = 0;
         while(_loc2_ < get_player().cockTotal() && _loc1_ < 0)
         {
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DOG || get_player().cocks[_loc2_].hasKnot())
            {
               _loc1_ = _loc2_;
            }
            _loc2_++;
         }
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         outputText("你恶作剧地笑了笑，有了一个特别邪恶的主意。如果她这么喜欢恶作剧，好吧，你有一个绝妙的恶作剧要给她！你把手伸进你的[inv]，拿出一瓶冒着泡的红色药水，手指划过侧面刻着的“操”字。[pg]");
         outputText("[say:嘿……等等，你在做什——][pg]");
         outputText("当你把她摔倒在地时，她抗议地大叫，你用拇指拔开瓶塞，用另一只手捏住她的鼻子。你坚持把药水瓶口贴在她的嘴唇上，没过多久她就不得不大口喘气，让你把里面的东西倒进她的喉咙。她咳嗽着，稍微喷了一点，试图把它吐出来，但你在她的下巴上施加了一点压力，以防止她这样做，轻轻按摩她的脖子，帮助强迫她吞下去。当这种强效催情剂开始流下她的喉咙时，你能感觉到她皮肤表面因欲望而发热，最深红的红晕蔓延到她的脸上。[pg]");
         outputText("女性麝香的强烈气味几乎立刻充满了空气，一滩粘稠的水洼在她的双腿之间蔓延，浸透了她长袍的胯部。" + (get_player().hasKnot(_loc1_) || get_player().get_inRut() ? "当这种强烈的气味充满你的鼻孔时，你的[cock " + _loc1_ + 1 + "]期待地肿胀起来，本能地对发情期雌性的气味做出反应。用你的" + (get_player().hasKnot(_loc1_) ? "[knotword " + _loc1_ + 1 + "]" : get_player().cockDescript(_loc1_)) + "堵住她湿滑的小穴，把她的肚子塞满幼崽的淫秽幻想不由自主地涌入你的脑海" + (get_player().cor < 20 ? "，让你感到有些不安" : "") + "。" : "") + "她的身体因肉欲的需要而颤抖和震颤，纯粹的动物欲望在她的眼中燃烧。随着化学物质引起的发情期影响全面显现，她努力保持某种理性的思考，拼命地想要爬走。[pg]");
         outputText("你带着些许好笑看着她拖着自己爬了一英尺、两英尺、三英尺，然后崩溃成一个颤抖的残骸，把她丰满的臀部撅到空中。她的臀部违背她的意愿弯曲和抽动，她所有的六条金色尾巴高高举起并展开，她从长袍中爬出来，露出她湿透的肉洞和华丽的纹身屁股。[pg]");
         outputText("[say:哦哦哦，天哪，你对我做了什么？！]她在快乐的喘息中质问道，把手伸进她湿透的小穴，疯狂地抽插着手指。[say:好——好……热……我感觉……啊！看在玛莱的份上，操——操我吧！][pg]");
         outputText("你" + (get_player().cor < 33 ? "强忍住笑，观察着她有些滑稽的困境。" : "放声大笑，享受着骄傲的妖狐彻底的屈辱。") + "她的脸扭曲成一个美丽的高潮快感的鬼脸，她无耻地伸出舌头，翻着白眼，突然而猛烈地高潮了。清澈的女性精液从她痉挛的小穴中倾泻而出，在地上溅成一滩浓稠的水洼。[pg]");
         outputText("她的脸颊贴在地上，扭动着身体，挺起臀部，气喘吁吁。她的手一次又一次地潜入她的小穴，一次又一次地消失在饥渴的肉褶中。[pg]");
         outputText("[say:呃……为什么这不起作用！？]她绝望地哭喊着，眼角泛起泪花。[say:我……啊……精液！求你了，我——我现在就需要精液射进我里面！][pg]");
         outputText("你对她的宣言笑了笑，向前伸出手，轻轻地顺着她的脊椎滑下手指。在你轻柔的触摸下，她几乎崩溃了，在快乐中痉挛着，她的每一条尾巴都竖了起来，几乎又因为这个而高潮了。" + (get_player().cor < 33 ? "你想知道你是否做得太过分了，以及你是否应该对这个可怜的小东西的理智感到有些担忧。不过，如果你不采取措施满足她贪得无厌的欲望，单凭这一点可能就足以击垮她。" : "你邪恶地笑着，指尖拖过你新宠物背部，看着她不受控制地痉挛，不断喷出淫液，你大笑起来。这个小骚货之前那么热衷于愚弄你——她现在那种自鸣得意的优越感去哪儿了？") + "[pg]");
         if(get_player().hasKnot(_loc1_) || get_player().get_inRut())
         {
            outputText("她大量淫液的甜美麝香让你脑海中充满了欲望的阴霾，随着动物交配本能开始接管，高级思维过程逐渐关闭。");
         }
         outputText("你将你的[cock " + _loc1_ + 1 + "]滑入她柔软的臀部之间，当她开始沿着肉棒前后滑动臀部，轻柔地发出咕咕声时，你舒服地呻吟着。从她湿透的阴道散发出的温暖湿润的气息抚摸着你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else
         {
            outputText(get_player().legs());
         }
         if(get_silly())
         {
            outputText("热得你可以在上面烤棉花糖。");
         }
         else
         {
            outputText("伴随着一阵热流，血液涌向你的腹股沟。");
         }
         outputText("她抬高臀部，发出轻微的呜咽声，拼命试图将你的[cock " + _loc1_ + 1 + "]对准她饥渴的肉洞。[pg]");
         outputText("[say: 停、停止戏弄……]她气喘吁吁地说，当她连续第三次未能用她颤抖的小穴接住你的[cockhead " + _loc1_ + 1 + "]时，她发出了呜咽声。她的臀部笨拙地向后摇晃，喉咙里发出一声绝望的哀鸣，试图平复颤抖的身体，以便最终将自己刺穿在你不断变硬的肉棒上。");
         if(get_player().hasKnot(_loc1_) || get_player().get_inRut())
         {
            outputText("你想要让面前这名丰满的雌性怀孕的兽性需求与你想要戏弄她的欲望作斗争，但冲动很快战胜了理智。你只能再克制片刻，然后便屈服于本能，将你的肉棒插入她饥渴的小穴");
            if(get_player().cockArea(_loc1_) > 50)
            {
               outputText("根本不管她是否能承受。值得庆幸的是，你无需担心——她的小穴急切地将你的肉棒整个吞下，不知为何，里面还有多余的空间");
            }
         }
         else
         {
            outputText("她急切的挺送让你对她的绝望产生了怜悯，迅速打破了你戏弄她的欲望。你坚持了一会儿，最终屈服于你的欲望，将你的肉棒深深地插入她饥渴的小穴");
            if(get_player().cockArea(_loc1_) > 50)
            {
               outputText("根本不管她是否能承受。值得庆幸的是，你无需担心——她的小穴急切地将你的肉棒整个吞下，不知为何，里面还有多余的空间");
            }
         }
         outputText("。她的体内感觉就像一个火炉，滑腻的肉壁紧紧包裹着你的肉棒，沿着肉棒剧烈地起伏。[pg]");
         outputText("当狐妖在地上抓挠，陷入又一次高潮的阵痛时，一股温暖的淫水喷溅在你的" + (get_player().balls > 0 ? get_player().ballsDescriptLight() : get_player().legs()) + "上。她的肉壁在跳动的肉棒周围抽搐，像老虎钳一样紧紧夹住你。它们将你吸得更深，促使你开始用力挺动臀部，你响亮的呻吟声与她的叫喊声汇成一曲快感的合唱。当她颤抖的高潮开始消退，转变为更容易承受的交配快感时，她开始将臀部向后猛撞来迎接你，每一次挺送都将肺部的空气挤出，并在每一次呻吟中伴随着一声响亮的咕哝。[pg]");
         outputText("[say: 嗯啊！操！感、感觉太爽了！][pg]");
         outputText("你的指尖紧紧抠住她那丰满柔软的巨臀，开始使出浑身解数猛烈地抽插她湿润的阴道，激情地喘息呻吟着。");
         if(get_player().hasKnot() || get_player().get_inRut())
         {
            outputText("满脑子都是用你那充满活力的精液填满她小穴的生动幻想，你已经无法思考其他任何事情。无论发生什么，你知道你必须让她怀孕——根本没有其他选择。");
         }
         outputText("她将丰满的臀部猛烈地撞向你的骨盆，如果不是那布满纹身的宽大臀部缓冲了冲击，明早你肯定会感到酸痛。[pg]");
         if(get_player().hasKnot())
         {
            outputText("随着你的每一次抽插，她湿滑小穴的阴唇都会被你的[cockanimalityadj " + _loc1_ + 1 + "][knotword " + _loc1_ + 1 + "]撑开一点，在最后一次野蛮的冲刺中，你将肉结强行塞入她的体内，爽得从头到脚都在颤抖。[pg]");
            outputText("狐妖翻着白眼，张开嘴发出一声震耳欲聋的欢愉尖叫，被她有史以来最强烈的高潮惊得浑身僵硬。她的内壁肌肉紧紧地收缩，死死咬住你的肉结，将你固定在原地，滚烫的高潮淫液喷涌而出，溅满了你的腹股沟。[pg]");
            outputText("尽管你费了点劲才把它塞进去，但她的阴道却很好地容纳了你的肉结，紧紧包裹着那青筋暴起的凸起，随着她从高潮中逐渐平息，阴道内壁也随之产生令人愉悦的波纹。欢愉的泪水沾湿了她的脸颊，与下巴上肆无忌惮流下的口水混合在一起，她的嘴巴一直半张着，流露出最纯粹的欲望。[pg]");
         }
         outputText("你将她的尾巴揽入怀中，紧紧地贴在胸前，引得这只被欲望逼疯的狐妖发出一声愉悦的呻吟。当你突然用力拉扯她的尾巴，借力加倍猛烈地抽插时，她发出了一声痛苦的尖叫。透过她的阴道壁，你能感觉到她那如小鹿乱撞般的心跳，滚烫的淫液爱抚并榨取着你的肉棒，更多的汁液从你的" + (get_player().hasKnot(_loc1_) ? "肉结" : get_player().cockDescript(_loc1_)) + "周围喷涌而出。[pg]");
         var _loc3_:String = get_player().cor < 33 ? "她的手上。" : "她的手腕上，将她按倒在地。";
         var _loc4_:Boolean = get_player().hasKnot(_loc1_) || get_player().get_inRut();
         var _loc5_:String = get_player().balls > 0 ? get_player().ballsDescriptLight() : "前列腺";
         outputText("你的快感开始攀升至顶峰，每一次充满激情的抽插都让你离最终那不可思议的释放越来越近。为了准备迎接这一刻，你俯身压在她身上，将手放在" + _loc3_ + (_loc4_ ? " 你突然产生了一股想要咬她脖子的冲动，于是你顺从了这股冲动，用牙齿咬住她肩膀上的软肉。" : "") + " 伴随着一声震耳欲聋的呻吟，你最后一次挺动臀部，猛地撞向她那柔软的臀部，停在那里，直到你" + _loc5_ + "里的压力终于沸腾爆发。");
         if(get_player().cumQ() <= 150)
         {
            outputText("你的肉棒不受控制地痉挛着，将一股又一股浓稠的精液喷射进她饥渴的小穴中。精液刚一流入她的体内，她就陷入了另一次不可思议的高潮，手指紧紧地抠进泥土里，眼角流下泪水，大声地呻吟着。她的肉壁不断地榨取和按摩着你，贪婪地吞咽着你那充满活力的精液。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("黏稠的精液如丝带般接连不断地射入她饥渴的小穴，用你浓稠咸腥的精液涂满了她湿滑的肉壁。精液刚一流入她的体内，她就陷入了另一次不可思议的高潮，手指紧紧地抠进泥土里，眼角流下泪水，大声地呻吟着。她的肌肉不断地收缩痉挛，贪婪地榨取着你肉棒里的每一滴精液。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("你的尿道扩张开来，一波又一波黏稠的精液顺着你的肉棒涌出，在狐妖的肚子里泛起泡沫。精液刚一流入她的体内，她就陷入了另一次不可思议的高潮，手指紧紧地抠进泥土里，眼角流下泪水，大声地呻吟着。随着她的肉壁有节奏地榨取和挤压你的肉棒，她的肚子开始微微隆起，肿胀的腹部随着你射精的重量微微晃动。");
         }
         else if(get_player().cumQ() < 2500)
         {
            outputText("你的肉棒胀大了一圈，浓稠的精液开始从龟头喷涌而出，冲刷着她湿透的肉洞，倾泻进她的子宫。精液刚一流入她的体内，她就陷入了另一次不可思议的高潮，手指紧紧地抠进泥土里，眼角流下泪水，大声地呻吟着。即使你那丰富的储备已经被榨干，她的肌肉依然在贪婪地挤压着你的肉棒，她那被精液撑得鼓鼓的肚子在她身下晃荡，随着你精液的重量而颤动。");
         }
         else
         {
            outputText("你甚至能听到精液倾泻进她体内的声音，一波又一波浓稠的精液填满了她肥沃的子宫。精液刚一流入她的体内，她就陷入了另一次不可思议的高潮，手指紧紧地抠进泥土里，眼角流下泪水，大声地呻吟着。");
            if(get_player().hasKnot(_loc1_))
            {
               outputText("她的肚子像气球一样膨胀到了一个荒谬的大小，随着你继续将她填满，她的肚子每秒都在变大。你的肉结堵住了唯一的出口，迫使她忍受着腹部被你的种子撑得鼓鼓囊囊，沉甸甸地晃动着。");
            }
            else
            {
               outputText("这庞大的精液量超出了她的承受能力，当她那看起来像快要临盆的肚子开始压迫地面时，高压的精液流开始从她紧致的小穴中喷涌而出，溅落在你的[hips]和[fullChest]上。");
            }
            outputText("尽管她看起来就像吞下了一个沙滩排球，但她那泥泞不堪的小穴依然在榨取着你肉棒里的每一滴精液，甚至在你那惊人的储备被榨干很久之后依然如此。");
         }
         outputText("[pg]现在，她的子宫里装满了新鲜温暖的精液，她那贪得无厌的交配欲望似乎终于平静下来，你种子的存在扑灭了她下腹熊熊燃烧的欲火。她喘息着，叹息着，在你身下陷入了放松的昏睡状态，尽管她那高潮的表情似乎已经永远地刻在了她的脸上。她的六条尾巴无力地抽动着，手臂或腿偶尔会不由自主地痉挛一下。");
         outputText((get_player().hasKnot() ? " 你试图拔出来，但有些沮丧地发现她的小穴依然死死地咬着你膨胀的肉结。你叹了口气，瘫倒在她身上，享受着她肉体的温暖，" + (get_player().cor < 33 ? "同时轻轻抚摸着她金色的头发，" : "") + "等待着肿胀的肉结瘪下去。" : "") + "[pg]");
         outputText("当你的肉棒开始滑出时，她发出一声微弱的呜咽，" + (get_player().cumQ() > 1000 ? "紧接着一股小喷泉般的精液喷涌而出，在空中划出一道弧线，她的肚子也随之瘪了下去，释放了一些压力。" : "她肿胀的阴唇有节奏地挤压着突然出现的空虚。") + " 在快感中筋疲力尽的你昏倒在她身上，而她则躺在你身下，你们俩躺在一滩混合着你们体液的水洼中。[pg]");
         outputText("你不确定自己睡了多久，但当你恢复意识时，你发现只剩下你一个人了。一条散发着麝香气味的体液痕迹一直延伸到灌木丛中，虽然你怀疑以她现在的状况走不了多远，但你需要回去检查你的营地。当你收拾东西时，你稍微停顿了一下，嘴角露出一丝坏笑，你确信自己能听到树林中传来的呻吟声。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_player().consumeItem(get_consumables().F_DRAFT);
         get_combat().cleanupAfterCombat();
      }
      
      public function fuckAKitsuneVaginally() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你小心翼翼地靠近倒下的妖狐，警惕着她可能藏在袖子里的任何把戏。她试图挣扎着站起来逃跑，但你抓住了她的" + (get_player().cor < 40 ? "长袍衣领" : "尾巴") + "把她拉了回来，将她转过身按在一棵树上，凑近了她。[pg]");
         outputText("[say: 哎呀……]当你靠近她，灼热的呼吸喷洒在她的脖子上时，她微微红着脸说道。[pg]");
         outputText("你的指尖穿过她的头发，滑过她的脸颊和脖子，向下抚过她丰满的胸部，滑过她臀部的曲线。另一只手扯下她长袍的腰带，让她挺拔的双峰弹跳而出，开始揉捏挤压。你抓了一把她丰满多汁的屁股，惹得她发出一声小小的尖叫，随后她平静下来，在你的抚摸下颤抖着，她的六条尾巴向前卷曲，温柔地抚摸着你。[pg]");
         outputText("[say: 嘿，别以为你已经赢了我，]她说道，用尽全身的力气抵抗着你抚摸带来的快感。[say: 我会……我会……][pg]");
         outputText("你只是轻笑一声，手指划过她的侧腰，凑上前去轻咬她的脖颈。她几乎融化在你的怀里，翻着白眼呻吟着，脸颊因欲望而泛红。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 你感觉到有什么东西轻轻撞击着你的胯部，你低头一看，忍不住窃笑，只见她长袍的下半部分撑起了一个大帐篷。你戏谑地将手顺着她的身前滑下，隔着布料握住它，缓慢地套弄着。" : "") + "[pg]");
         outputText("[say: 啊-啊！停、停下，你、你会——][pg]");
         outputText("[say: 我会怎样？]你打断了她的话，非常享受戏弄这个平时总是故作矜持的骗子，你把她扭动的身体按在树上，手顺着她的双腿滑下，将一根手指探入她湿润的阴唇之间。她呻吟着，头歪向一边，胸口剧烈起伏，全身从头到脚都在颤抖。[pg]");
         var _loc1_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         var _loc2_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         var _loc3_:Boolean = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0;
         outputText("你脱下你的[armor]，毫不犹豫地扔在地上，然后小心翼翼地掀起妖狐长袍的下摆，检查她的胯部。" + (_loc1_ ? " 她那根跳动着的阴茎立刻挺立起来，前列腺液缓慢但持续地从顶端渗出，顺着粗壮的肉棒流下，滑过她闪闪发光的下体。" : "") + " 一个小小的纹身落在她的耻骨丘上，突显了她" + (_loc2_ ? " 一英尺长的阴茎和" : "") + " 剃得光秃秃的小穴。" + (_loc3_ ? " 你将她那根跳动着的肉棒握在手中，开始用力地套弄，看着她的脸因快感而扭曲成各种表情，你的拳头在已经被前列腺液浸湿的肉棒上滑上滑下。" : "") + "[pg]");
         outputText("你的[cock biggest]在她的双腿间挺立起来，沿着她阴道的开口滑动，仿佛在提醒你最终想要的是什么。感觉已经把这女孩戏弄得够了，你把她的双腿抬起抱在怀里，将她按在树上，让她悬在半空中。你的肉棒在她的肚子上拍打着，你开始在她的" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "那根抽搐着的阴茎" : "骨盆") + "上前后摩擦，把前列腺液滴得她满身都是。[pg]");
         outputText("[say: 你、你还在等什么？]她气喘吁吁地质问道，用尾巴缠住你的腰，抓住你的肩膀支撑身体。[say: 这就是你想要的，对吧？来吧，操我！][pg]");
         outputText("你把一只手臂从她的腿下抽出来，将一根手指按在她的嘴唇上，告诉她现在还没资格对你提要求。她深深地红了脸，点了点头，眼神有些迷离，顺从地接受了自己的角色。[pg]");
         outputText("[say: 就、就这一次……][pg]");
         outputText("你坏笑着，再次将她的腿抬到你的肩膀上，继续用你的肉棒在她的胯部滑动，让她充分湿润后才将它顶上去。当你挺进她体内时，粘稠的淫液顺着你的肉棒流下，当你把[cockHead biggest]推入时，她忍不住发出一声呻吟，她湿滑的阴唇轻易地分开，邀请你进入。" + (get_player().biggestCockArea() > 50 ? " 她小穴的内壁不可思议地扩张着，吞没了你那根肿胀肉棒的一寸又一寸，仿佛没有尽头。" : "") + " 当你的[hips]撞击她的臀部时，她的乳房轻轻晃动，" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "她的阴茎在肚子上拍打着，留下一道麝香味的前列腺液痕迹，" : "") + "她小穴的内壁紧紧地夹住你的肉棒。[pg]");
         outputText((get_player().balls > 0 ? "深至囊袋" : "直没至柄") + "地埋在她温暖诱人的小穴里，你舒服地呻吟着，双手向上滑去，揉捏她那饱满诱人的双臀。你深深地呻吟着，将臀部向后拉，然后开始抽插，每次你的[cock biggest]深深挺入时，她颤抖的内壁都会发出响亮的吧唧声。她将双臂搂住你的肩膀，然后充满情欲地向后仰起头，翻着白眼，舌头因快感而伸出。她湿透了的小穴痉挛着，紧紧挤压着你跳动的肉棒，完美地贴合着每一道曲线和褶皱。她用双腿勾住你的[hips]，让你腾出一只手去揉捏她的乳房，另一只手则滑下去揉捏她丰满的屁股。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 你的手指向上滑动，越过她的大腿，紧紧握住她那根跳动着的阴茎，在沾满前列腺液的肉棒上滑上滑下。你拳头的每一次套弄和臀部的每一次抽插，都会从顶端挤出一大团浓稠的前列腺液，让你手上沾满了这种粘稠滑溜的液体。" : "") + "[pg]");
         outputText("当你继续狂野地抽插时，她用尾巴缠住你的下半身，以此为支点，迎合着你的每一次抽插，沉浸在情欲之中。她的一条尾巴滑上来，缠绕着你的[cock biggest]，用柔软的皮毛充满爱意地抚摸着它，然后紧紧缠绕在" + (get_player().hasSheath() ? "包皮" : "根部") + "。你的肉棒因为这个临时的阴茎环而肿胀发热，当她尾巴的尖端刷过你时，一阵轻微的刺痛感在你的胯部游走，留下了一道幽灵般的蓝色火焰痕迹。[pg]");
         outputText("[say:哦，别停，求你了……用力操我……]她呻吟着，向你抛了个媚眼，手滑上你的脖子，手指" + (get_player().hair.length > 0 ? "穿过你的头发。" : "划过你的头皮。") + "[pg]");
         outputText("你满足了这个风骚女孩的要求，加倍用力地抽插，双臂环抱住她的背，对着她毛茸茸的三角形耳朵呻吟。你肿胀的肉棒一次又一次地撞击她的阴户，粘稠的润滑液顺着你的腹股沟流下，滴在地上发出响声。她狂野地呻吟着，用她湿漉漉的小穴挤压你的[cock biggest]，并向下挺起臀部迎合你，你发现自己正以一种不顾一切的凶猛姿态猛捣她的小穴。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 她的肉棒在你的手中强有力地抽动，将前列腺液喷洒在她的胸前，每一次抽插都让她的体内紧紧地夹住你。" : "") + "[pg]");
         outputText("她的尾巴把你的肉棒缠得更紧了，似乎察觉到了你即将到来的高潮，并试图阻止它。你的肉棒在她的体内肿胀得更大了，让你们俩异口同声地呻吟起来。你感觉仿佛能分辨出她柔软内壁的每一丝涟漪和波动，它们如同瀑布般倾泻在你充血的肉棒上，从四面八方抚摸着它。你像野兽一样发情、咕哝着，又向她体内挺进了三次，然后深深地呻吟了一声，你的肉棒在她的体内剧烈地抽搐着。你的肉棒在她的尾巴造成的阻塞后方肿胀起来，积聚着压力，但要么是压力太大她无法再抑制，要么是她自己的高潮让她分心，以至于失去了抓握力，你的高潮像狂暴的白色河流一样喷涌而出。[pg]");
         outputText("" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? "她的肉棒在你的紧握中跳动、抽搐，" + (get_player().cor > 15 ? "濒临高潮。就在她即将释放的时候，你收紧了握住她根部的手，恶作剧般地坏笑着。看看<i>她</i>喜不喜欢被戏弄！[pg]她的肉棒在你的手下异常肿胀，徒劳地跳动和抽搐，拼命想要克服阻塞。她的脸扭曲成痛苦的表情，带着一丝受虐的狂喜。她在你的紧握中扭动挣扎，最后你决定她已经受够了。你向后倾斜，将她抽搐的肉棒从你身上移开，松开你的手，她的肉棒开始不受控制地痉挛，" : "") + "将滚烫的扶他精液喷射到空中，用乳白色的精液丝覆盖了她的胸部和脸庞。她强有力地呻吟着，在狂喜中挺起臀部，将一波又一波浓稠的精液喷洒在自己身上，让自己的正面完全沾满了自己浓稠的精液。" : ""));
         if(get_player().cumQ() <= 150)
         {
            outputText("她的阴道壁在你抽搐的肉棒周围痉挛，榨干你每一滴滚烫、粘稠的精液。当你的精液溢入她的子宫时，她发出高潮的呻吟，双腿缠住你的腰，紧紧地抱住你，仿佛无法忍受哪怕一滴精液逃脱的想法。");
         }
         else if(get_player().cumQ() < 350)
         {
            outputText("她的小穴紧紧地挤压着你抽搐的肉棒，榨干你所能提供的每一股精液。肌肉发达的入口紧紧地夹住，她收紧了缠绕在你腰间的双腿，在她的高潮震撼她的身体时，拼命地坚持着。即使在她颤抖的高潮结束后，她仍然紧紧地依附着你，不让哪怕一滴精液逃脱。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("当你将浓稠的精液射入她的子宫时，你的肉棒在她的体内淫秽地肿胀，她小穴的内壁在你抽搐的肉棒周围痉挛，榨干你的所有价值。她深深地呻吟着，双腿紧紧缠住你的腰，拼尽全力压向你，高潮在她的体内咆哮，让她不受控制地颤抖。尽管她入口周围的肉环紧紧地夹住，但还是有几股精液设法逃脱，顺着你肉棒的底部滴落，溅在地上。");
         }
         else if(get_player().cumQ() <= 2500)
         {
            outputText("她的小穴在你狂野抽搐的肉棒周围痉挛起伏，当第一股粘稠的精液在她的体内爆炸时，一个厚厚的凸起顺着你的肉棒漏斗状向上移动，用你强效的精液填满了她脆弱的子宫。她向后仰起头呻吟着，双手向下移到她的肚子上，因为肚子开始肿胀成一个漂亮的圆形凸起，随着你的精液晃动。她肌肉发达的内壁榨干了你最后一滴精液，从你的尿道中挤出精液，并紧紧夹住你的肉棒。尽管她做出了勇敢的努力，但随着她的肚子肿胀以容纳你难以置信的精液量，几股加压的精液还是设法从她的入口逃脱，浸湿了你腰部以下的地方。");
         }
         else
         {
            outputText("由于大量的精液在其中穿行，你的肉棒难以置信地膨胀，一次一股浓稠的洪流流入她的子宫。她向后仰起头呻吟着，剧烈地颤抖着，双手向下移到她的肚子上，因为肚子开始膨胀，向外晃动成一个巨大的圆肚子。她的内壁在你抽搐、跳动的肉棒周围剧烈痉挛，榨干你最后一滴粘稠的精液，并紧紧地挤压着你。随着她的肚子继续淫秽地向外肿胀，她可怜的被虐待的小穴根本无法承受巨大的压力，浓稠的精液喷涌而出，浸透了你腰部以下的地方。");
         }
         outputText("伴随着一声呻吟，你向后退去，" + (get_player().cor < 45 ? "双手托住她的肩膀下方，防止她一下子摔倒在地上，然后慢慢地将她放下。" : "让她“砰”的一声毫不客气地摔在地上。她虚弱地尖叫着抗议，揉着她瘀伤的臀部，但没有再说什么。") + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 ? " 她的肉棒软绵绵地悬挂在她被精液" + (get_player().cumQ() > 1000 ? "胀满" : "浸透") + "的肚子上，仍然有大量的扶他精液流过她的大腿。它轻轻地抽搐着，在安息之前进行了最后一次喷射。" : "") + " 你轻轻地喘着气，靠在树上喘口气，低头看着她，她也筋疲力尽地抬头看着你。[pg]");
         outputText("最后，你转身收拾好你的东西，稍微清理了一下自己，然后重新穿上你的[armor]。当你再次转过身去查看那个失去知觉的狐妖时，你只能挠着头，盯着她刚才还在的地方。她留下的只有一滩混合着液体的水洼，大部分已经被地面吸收，还有穿过树林传来的微弱的恶作剧般的笑声。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function followTheWillOWisp(param1:Boolean = false) : void
      {
         clearOutput();
         if(!param1)
         {
            outputText("火焰突然窜入树林的黑暗中，你发现自己无法抗拒地追了上去。感觉就像是被某种超自然的力量吸引着，但每当你的疑心开始加重时，火焰就会停下来在你周围飘浮，挑逗着你的敏感带，然后继续向前。");
            dynStats(DynStat.Lust(15));
         }
         if((get_player().get_lust() >= get_player().maxLust() || get_player().get_inte() < 20) && !param1)
         {
            mansion(false,false);
         }
         else
         {
            kitsuneSprite();
            if(!param1)
            {
               outputText("你不确定自己跌跌撞撞地追着火焰跑了多久，但在短暂的清醒瞬间，你猛地停下脚步，警惕地环顾四周。突然，你深深地后悔跟着火焰偏离了这么远。当你再次听到那令人毛骨悚然的幽灵般的笑声时，你感到毛骨悚然，不由自主地打了个寒颤。当你转身准备原路返回时，你惊讶得差点从[skinfurscales]里跳出来。离你仅仅几英寸的地方站着一个奇怪的女孩，她有着");
               if(get_monster().hair.color == "blonde")
               {
                  outputText("及背的亚麻色");
               }
               else if(get_monster().hair.color == "black")
               {
                  outputText("及臀的乌黑");
               }
               else
               {
                  outputText("齐肩的深红");
               }
               outputText("头发，正早熟地坏笑着。[pg]");
               outputText("[say: 呼呼呼，我们是不是很聪明呀？][pg]");
               outputText("随着她进一步拉近距离，你现在注意到她并不是什么普通、无害的小女孩——一对巨大的狐狸耳朵从她头顶的头发中探出，六条毛茸茸的尾巴在她周围呈扇形散开。一层华丽的纹身覆盖了她部分裸露的肌肤，恰到好处地突显了她女性的曲线。她现在离得太近了，几条尾巴正顺着你的[skinfurscales]游走，留下一串噼啪作响的蓝色火花，带来与那团火焰相同的冰凉刺痛感。[pg]");
               outputText("[say: 你竟然抵抗了我的幻觉……真让人印象深刻，]她用尾巴挑逗着你说道。你向后退去，但当你感觉自己撞到了什么东西时，你吓了一跳，猛地转过身来。[pg]");
            }
            outputText("[say: 想去哪儿呀？][pg]");
            outputText("她是怎么这么快跑到你身后的？你可是一直盯着她看的！你迅速回头瞥了一眼，确认这不是双胞胎，但当你转过身面对她时，她又一次消失了！[pg]");
            outputText("[say: 在这儿呢，小笨蛋~]她用调皮的语气呼唤你，当你猛地转过身面向她的声音时，她正向你招手。[say: 别害羞嘛，我不咬人的……通常不咬……][pg]");
            outputText("她的语气听起来很无害，但她的举止不知为何让人有些不安。你打算怎么做？");
            menu();
            addButton(0,"战斗",fightSomeKitsunes);
            addButton(1,"交谈",talkAfterResistingKitsunellusion);
         }
      }
      
      public function fightSomeKitsunes() : void
      {
         clearOutput();
         outputText("这个女孩让你觉得有些不对劲，你谨慎地举起你的[weapon]，警惕地注视着她。[pg]");
         startCombat(new Kitsune(get_monster().hair.color));
         kitsuneSprite();
         if(get_monster().hair.color == "blonde")
         {
            outputText("[say: 啊，所以我们要这么玩，是吗？] 她咧嘴一笑，在空中做了一个小小的抓挠动作。[say: 很好，亲爱的，既然你想要这样，但我可不会因为你可爱就对你手下留情哦~。]");
         }
         else if(get_monster().hair.color == "black")
         {
            outputText("[say: 哎呀，亲爱的……你确定不能施舍哪怕一丁点儿吗？我好饿啊……][pg]她舔了舔嘴唇以强调这一点，并揉了揉肚子。然而，你可不想成为她的盘中餐，或者不管她打算对你做什么。[pg][say: 好吧，看来也没办法了，] 她调皮地撅起嘴唇说道。");
         }
         else
         {
            outputText("[say: 噢，你是不打算让我轻松得手了，是吧？]");
            outputText("[pg]她带着一丝苦笑，后退一步，捏得指关节咔咔作响，你的目光被她长袍下微微隆起的帐篷吸引了。[say: 很好，我喜欢猎物有点反抗精神。只是输了可别哭哦~] 她说着，一只手滑下去抚摸着紧贴大腿的凸起。不管她藏着什么，至少有12英寸长，而且她似乎很想用它。");
         }
         outputText("[pg]<b>你现在正在与一只");
         if(get_monster().hair.color == "blonde")
         {
            outputText("金发");
         }
         else if(get_monster().hair.color == "black")
         {
            outputText("黑发");
         }
         else
         {
            outputText("红发");
         }
         outputText("妖狐战斗！</b>");
      }
      
      public function femalesAndNuetersLoseToKitsunes() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("[say: 哎呀呀，这么快就结束了？] 狐妖俯身看着你瘫软的身体，狡黠地笑着说道。[say: 如果你打算这么轻易就放弃，你一开始就可以说出来，省得给自己找麻烦！][pg]");
         outputText("她咯咯的笑声在你耳边回荡，当她费力地把你翻转过来时，笑声因她发出的咕哝声而短暂中断。[pg]");
         outputText("[say: 呵呵，是时候领取我的奖品了……][pg]");
         outputText("她轻哼着，小心翼翼地脱下你的[armor]，整齐地叠成一堆，推到一边。她饥渴地盯着你赤裸的身体，双手开始慢慢地顺着你的[fullChest]滑下，让指尖掠过你身体的每一处起伏和曲线，同时在你的肌肤上画出一道道蓝色的火焰。她的触摸让你的脊背上下发麻，让你不由自主地颤抖和呻吟。她的手缓慢而坚定地向下移动到你的腰部，非常温柔地在你的[hips]周围挑逗" + (get_player().isBiped() ? "，挠着你大腿内侧的痒痒" : "") + "，然后向上滑到你" + (get_player().get_gender() == 2 ? "迅速湿润的裂隙。她的手指在你的阴唇内侧跳舞" : get_player().assholeDescript() + "。她的手指在你的臀瓣之间跳舞") + "，在入口处打转，几乎——但始终没有——将指尖推入其中，当你释放出一小股体液到她的掌心时，她满意地窃笑起来。" + (get_player().get_gender() == 2 ? " 她用一条尾巴的尖端像羽毛一样精致地滑过你的[clit]，上下弹动着。" : "") + "[pg]");
         outputText("她的食指指尖" + (get_player().get_gender() == 2 ? "按在你的阴蒂末端" : "温柔地按在你的雏菊上") + "，留下一颗微小的火珠，当蔚蓝的火舌舔舐你的下体时，带来难以置信的刺痛感。这种待遇没过多久，你就已经在边缘摇摇欲坠，但这位技巧娴熟的诱惑者对你另有打算，在你要释放的前一刻收回了快感。[pg]");
         outputText("[say: 哦，不，亲爱的，好戏才刚刚开始，] 她用一种假装责备的语气说道，调皮地笑着。[pg]");
         outputText("她向前滑动，优雅地坐在你的臀部上，用她宽大臀部的重量将你压住。" + (get_player().isBiped() ? "一对毛茸茸的尾巴滑入你的双腿之间，卷住它们并将其向外分开，剩下的尾巴利用你无助的状态，开始在你大腿内侧上下刷动，其中一个尾尖在" + (get_player().get_gender() == 2 ? "你阴道敏感的裂隙" : "你的" + get_player().buttDescript() + "的臀瓣之间") + "上下滑动。" : "她的尾巴飘过你敏感的胯部，刷过" + (get_player().get_gender() == 2 ? "你阴道的裂隙" : "你的" + get_player().buttDescript() + "的臀瓣之间") + "，性感地挠着痒痒。") + " 她的双手顺着肩膀滑下，越过她晃动的双乳，将手指勾进长袍并向下拉，直到她挺拔的乳头勉强被包裹住。她以一种令人痛苦的缓慢速度脱下长袍，全程注视着你，对你对她挑逗展示的反应发出诱惑的笑声。随着她的衣服被扔到一边，你可以一览无余地看到她年轻、柔软的身体，" + (get_monster().hair.color == "blonde" ? "飘逸的金发瀑布般倾泻在她健美、丰满的沙漏形身材上。" : (get_monster().hair.color == "black" ? "肚子周围微微的赘肉突显了她丰满的身材。" : "你的目光立刻被那根现在横跨在你肚子上、长达一英尺的跳动肉棒所吸引。")) + " 她狡黠地笑着，摆出一个诱人的姿势，半眯着眼睛色眯眯地看着你，嘴角挂着一抹欢快的坏笑。[pg]");
         outputText("[say: 嗯……是不是觉得浑身燥热，亲爱的？] 她几乎是用耳语说道，声音里充满了诱惑。[pg]");
         outputText("当她俯身将胸部贴紧你时，她的尾巴继续在你的腹股沟上扭动滑行，用它们神秘的火焰挑逗并涂抹你的" + (get_player().get_gender() == 2 ? "湿滑裂隙" : "肛门") + "。她开始逐渐在你的腹部前后摩擦她的臀部，她的脸颊微微颤动，同时她俯身抚摸你的脸，在你的下巴下方轻轻印下一个吻。丰满的红唇压在你的唇上，带来冬青的甜美滋味。她的手指以惊人的力量紧紧扣住你的后脑勺，并在你的唇间释放出一声有力的呻吟，一种刺痛的凉意在你的舌头上蔓延，然后扩散到你身体的其他部位。[pg]");
         outputText("她的魔法流经你的身体，渗透到你的四肢，让你充满颤抖的欲望。你很快就忘记了自己是这个狡猾骗子游戏中不情愿的参与者，理智被更原始的本能所颠覆。纯粹的熔岩般的欲望冲向你的下体，你满脑子想的都是自己光荣的释放。肯定很快就会来了。肯定，她不能永远这样挑逗你……[pg]");
         outputText("她的尾巴将" + (get_player().get_gender() == 2 ? "你的阴唇尽可能地撑开" : "你的臀瓣分开") + "，第三条尾巴温柔地在你的" + (get_player().get_gender() == 2 ? "阴蒂周围画着火焰的圆圈，而第四条尾巴则坚持不懈地压在你的入口处" : "起皱的肛门周围画着火焰的圆圈") + "。柔软的刷子向前推进，遇到你" + (get_player().get_gender() == 2 ? "湿润、粉红色的肉" : "肌肉环") + "的阻力，用插入的承诺挑逗你，却始终没有真正进入。[pg]");
         outputText("[say: 哦，可怜的小东西，] 她柔声说道，看着你的脸因无耻的欲望而扭曲成痛苦的表情。她为什么还不快点开始！？当你伸手试图控制局面时，她拍开了你的手，两条尾巴向前卷曲绑住你的手腕。[say: 调皮调皮！你可以看，但今天负责摸的人会是<i>我</i>，亲爱的。][pg]");
         outputText("你在她毛茸茸的线圈中挣扎，但无济于事。凝视着她如翡翠深潭般的眼眸，你非常清楚，身体上的抵抗不会有任何结果——她催眠般的巫术已经抽干了你肌肉的力量，无力地悬挂在她的尾巴的掌控中。她的手指再次慢慢地在你的[chest]上跳舞，一边开心地咯咯笑，一边在你的胸前画出复杂的火焰图案。缓慢而痛苦地，她的尾巴再次降落在你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "上，在入口处盘旋扭动。柔软奢华的皮毛贴在你的下体感觉棒极了，当她越来越接近最终将其插入时，兴奋感不断建立，在外面盘旋了令人难以忍受的漫长时间。[pg]");
         outputText("[say: 你想要这个，对吧？让我看看你有多想要，] 她挑逗着，" + (get_player().get_gender() == 2 ? "温柔地向后伸手，将指尖按在你的[clit]上，在拇指和食指之间来回滚动。" : "用食指在你的肚脐周围画圈。") + " 她的尾尖极其轻微地滑入你渴望的洞穴，在里面旋转搅动，然后抽出，留下你绝望的渴望。[pg]");
         outputText("你在她身下尽你所能地呻吟和挣扎，徒劳地试图抬起臀部去迎合她的尾巴，而那条尾巴正折磨人地悬停在刚好够不着的地方。当她在你身上摩擦时，湿滑的汁液顺着你的腹部滴落" + (get_monster().hair.color == "red" ? "，她的肉棒也渗出大量的先兆精液到你的肚子上" : "") + "，一股强烈的热量从她的双腿之间辐射出来，暴露了她自己的欲望。[pg]");
         outputText("你的眼睛向上翻，淫荡地呻吟着，在她身下扭动挣扎，拼尽全力试图克服她对你的催眠控制，以便你能夺回控制权，给予自己如此迫切需要的释放。就在你确信自己快要发疯的时候，她俯身向前，抓住你的肩膀，将你拉入一个漫长而持久的吻中。那条一直不断挑逗地扫射你入口的尾巴终于扭动到位，当它插入时，你的视野爆炸成一片色彩的海洋，一次性深深埋入你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "中。狐妖平躺在你的[chest]上，将她晃动的屁股撅到半空中，将她的大部分重量都投入到这个充满激情的唇吻中。随着狐妖将第二条尾巴穿过第一条尾巴的环，伴随着一声呻吟将其插入她自己湿透的小穴，空气中回荡着淫荡的摩擦声。[pg]");
         outputText("" + (get_monster().hair.color == "red" ? "她的肉棒在你的肚子和她的肚子之间火热地跳动，当她前后摇摆时，先兆精液和女性汁液润滑了它的通道。" : "") + "刷子般的尾巴和柔软的指尖以温柔的激情抚摸着你身体的每一处曲线和起伏，在它们经过的地方留下刺痛的火焰轨迹。随着时间的推移，你" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "里的尾巴抽插得更加猛烈，将你的汁液水滴甩到空中，让森林里充满了你的气味。[pg]");
         outputText("一阵突如其来的寒意冲上你的脊背，强烈的刺痛感开始从你的核心向外散发，让你陷入快感的痉挛。在你因狂喜而翻白眼的前几秒钟，你可以看到你的腹部发出微弱的光芒，狐妖的尾巴从内部点燃了你！力量瞬间涌回你的肌肉，让你能在强烈的拥抱中紧紧抓住狐妖，当你的身体被快感折磨时，你的指尖深深陷入她赤裸的背部。[pg]");
         outputText("你的反应引起了狡猾狐娘兴奋的呻吟，导致她加倍热情地抽插她的尾巴。她中断了亲吻，足以在你的耳边发出呻吟，一股体液从她湿滑的小穴中溅出，滴落到你的身上。[pg]");
         outputText("[say: 快了，亲爱的！嗯，就差一点了，啊！再多一点……][pg]");
         outputText("她毫不羞耻地用臀部在你的身前摩擦，双手在你的肩膀和[chest]上摸索，同时用她的尾巴猛烈地抽打着你的" + (get_player().get_gender() == 2 ? "小穴和她自己的小穴" : "后庭和她自己湿透的肉洞") + "。滑腻的尾巴越来越快地抽插着你，耀眼的火焰在你的腹股沟上跳跃，像闪电一样让快感传遍你的全身。狐妖的手指几乎是痛苦地紧紧抓住你的二头肌，她先达到了高潮，当她的尾巴猛地从你体内抽出时，大量的汁液像倾盆大雨一样喷洒在她的尾巴周围。" + (get_monster().hair.color == "red" ? " 当她的肉棒在你们两人的身体之间抽搐和跳动时，温暖的感觉蔓延到你的腹部，浓稠的精液像丝带一样溢出，流在你的肚子上。一股又一股浓稠的扶他精液在你们的身体之间挤压，粘在你的胸前，然后变成闪闪发光的珍珠状水滴滚落下来。" : "") + "[pg]");
         outputText("你的" + (get_player().get_gender() >= 2 ? get_player().vaginaDescript() : get_player().assholeDescript()) + "紧紧地夹住她的尾巴，在柔软的皮毛周围挤压和起伏。当你的高潮完全到来时，强烈的快感让你浑身发抖。" + (get_player().wetness() >= 4 ? " 一股滚烫的淫水在空中划出一道弧线，溅在发情的狐妖的臀部上，用你粘稠的体液浸透了她的尾巴。" : "") + " 在你高潮期间，她的尾巴继续猛烈地刺入你的身体，将高潮延长了几分钟，完全不顾你绝望的挣扎。终于，它猛地从你体内抽出，伴随着一声湿润的拍打声，将你滑腻的体液甩到空中，疲惫开始取代快感。你感觉自己好像好几天没睡觉了，眼皮变得沉重，狐妖俯下身，嘴唇贴在你的耳边，一边抚摸着你的脸颊，一边低声念着简短的咒语。[pg]");
         outputText("在失去知觉之前，你看到的最后一件事是，当狐妖整理她的长袍时，一对令人愉悦的丰满圆润的脸颊在快乐地晃动着。");
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function feederTheKitsunes() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("当你站在这个被击败的骗子面前时，你听到她肚子里传来微弱的呻吟声。她的双手放在她胖乎乎的肚子曲线上，漫不经心地揉捏着，做着鬼脸。[pg]");
         outputText("[say: 好饿……][pg]");
         outputText("饿了，是吗？你咧嘴一笑，告诉她你正好有解决办法，眼中闪烁着捕食者的光芒，向她逼近。[pg]");
         outputText("当她的背撞到树上时，她微微皱眉，她试图爬到安全地方的企图被你干脆利落地挫败了，你猛扑过去，紧紧抓住她的肩膀。当你居高临下地看着她时，她的眼中流露出一丝恐惧，但她显然在尽力掩饰，她丰满的嘴唇颤抖着，对你假笑，试图保持平静、端庄的假象。当你拉开你的[armor]，露出你的[chest]时，她闪闪发光的绿色眼睛似乎睁得像餐盘一样大。她舔了舔嘴唇，目光追随着顺着你乳房曲线滚落的乳白色液体。[pg]");
         outputText("她的眼睛闪烁着奇异的光芒，不再是恐惧，而是欲望和饥饿。你放低身子跨坐在她的腿上，用身体将她压在树上，尽管此时你认为没有必要用这种束缚来阻止这只贪吃的狐妖逃跑。当你沉甸甸、充满乳汁的乳房来回摇晃时，她的目光追随着你漏奶的乳头，被那催眠般的晃动迷住了。她的舌头慵懒地舔过上唇，湿润着那丰满柔软的嘴唇，为她期待已久的美餐做准备。[pg]");
         outputText("[say: 奶水……]她气喘吁吁地低语，毫不犹豫地向前倾身，含住你的[nipple]。她发出赞许的呻吟，闭上眼睛，深深地吸吮着你溢出的乳房，发出吧唧吧唧的声音。[pg]");
         outputText("两股乳白色的液体顺着她的嘴角流下，向内滴落并在她的下巴汇合，然后顺着她脖颈的曲线滚落。当她贪婪地喝下你的乳汁时，她发出了各种各样的淫荡声音，把脸埋进你柔软的胸膛里。你轻轻拍着她的头顶，把她的脸按在你的乳沟上，轻轻摇晃着，手指缓慢地穿过她柔软的、");
         if(get_monster().hair.color == "black")
         {
            outputText("乌黑亮丽的");
         }
         else
         {
            outputText(get_monster().hair.color);
         }
         outputText("头发。[pg]");
         outputText("她暂时从你的乳房上抬起头，她那火热的绿色眼睛变得暗淡，蒙上了一层顺从的玻璃色。你颤抖着发出赞许的呻吟，双臂环抱住被俘虏的狐妖，霸道地将她抱在怀里。她丰满的嘴唇一刻也没有离开过你的[nipple]，当它们热情地吸吮你时，那柔软湿润的嘴唇感觉棒极了。[pg]");
         outputText("她的双手揉捏抚摸着你的双乳，用手指夹住你空闲的乳头拉扯，挤出一股新鲜的乳汁喷在她的脸上。你开始轻轻地挠她那大大的三角形耳朵后面，在你的臂弯里慢慢地前后摇晃她。她轻柔地咕咕叫着，靠在你柔软的乳房上，一抹温暖的粉红色红晕慢慢蔓延过她的脸颊。你的耳边传来一阵轻柔的哼唱旋律，过了一会儿你才意识到这声音是你发出的！[pg]");
         outputText("你换了一个更舒服的姿势，当你暂时拉开距离，坐在潮湿的草地上并将她拉到你的腿上时，狐妖发出渴求的呜咽。她顺从地蜷缩在你的臂弯里，紧贴着你的身体，继续摸索和吸吮你的[chest]。你哼着充满母性的曲调，前后摇晃着这个饥饿的女孩，手指慢慢地穿过她长长而奢华的头发。[pg]");
         outputText("你的另一只手慢慢地游走在她身体柔软的曲线上，挑逗和挤压她的乳房，捏她胖乎乎的肚子。当你注意到它比以前重了一点时，你得意地笑了，轻轻地拍了拍那晃动的凸起——这只贪吃的狐狸肯定吃饱了。你的手掌滑过她宽阔的臀部，手指暂时陷入她宽大屁股的柔软肉体中，然后向上移动到她柔软毛茸茸的[monster.hair]尾巴根部。[pg]");
         outputText("当你开始挠她尾巴和后腰交界处的细毛时，她整个身体都因为兴奋而泛红，嘴唇比以前更紧地吸住你的乳头。其中一条尾巴缠住你的手腕，绕着你的前臂，死死地抓住。当她继续渴望地吸吮你肿胀乳房里的乳汁时，她整个身体都在颤抖，一只手慢慢地滑向她湿润的小穴。[pg]");
         outputText("就在她设法将手指插入小穴的前几秒，你抓住了她的手腕，阻止了她自我安慰。她恳求地看着你，她的手在她的入口上方颤抖，仍然大口吞咽着你的奶水，无法打破你对她的控制。你停止了轻柔的哼唱，给了她一个不赞同的眼神，她慢慢地收回了手，小声地呜咽着。她似乎不明白为什么她的身体不听使唤，手指在她饥渴的小穴上方抽动。[pg]");
         outputText("你紧紧地将她抱在胸前，用一股新鲜的乳汁扑灭了她的抵抗。她的手无力地落在腿上，尽管她的小穴继续在她的整个大腿上漏出粘稠的淫液，她的身体因为未被满足的需求而颤抖。她的胃因为喝了大量的奶水而不可思议地膨胀起来，腹部周围那层薄薄的脂肪在明显圆润的凸起上绷得更紧了。她没有表现出停止甚至减速的迹象，饥渴地吸干你乳房里每一滴珍贵的乳白色液体。[pg]");
         outputText("你的手滑过她晃动的圆滚滚的肚子，性感地抚摸着她紧绷的肉体，恢复了你轻柔的哼唱。你乳房里的压力开始减弱，浓稠的后乳开始流入这个贪婪女孩的喉咙。伴随着满意的叹息，你将她移到另一个乳房，当奶水晃动的声音传入你的耳朵时，你轻声笑着，她肿胀的腹部剧烈地颤抖着。[pg]");
         outputText("随着时间的推移，她变得越来越湿，她每吞咽一口，就有一股新的液体浸湿你的[leg]。为了奖励这个女孩在吸干你充满乳汁的乳房时所做的令人钦佩的努力，你将一根手指滑入她的双腿之间，满足她之前为自己寻求的快乐，在你的指尖下慢慢地来回滚动她樱桃红色的阴蒂。你将中指和无名指滑入她的入口，迫使她从喉咙里发出一声喘息，导致她有点呛到，奶水喷溅出来，浸湿了她的前胸。[pg]");
         outputText("你开始在她的湿润的裂口中抽插手指，女孩在吞咽的间隙继续大声呻吟，狼吞虎咽地吃着你丰富的母乳。她越接近吸空你的乳房，你插她小穴的速度就越快、越用力，将她推向高潮，同时你也感觉到自己产生了一种奇怪的快感。[pg]");
         outputText("热量蔓延过你的胸膛，在你的[skin]表面嗡嗡作响，深红色的红晕覆盖了你的身体。狐妖蜷缩起来，大腿夹住你的前臂，臀部向下顶着你的手，她肌肉发达的小穴紧紧夹住你的手指，剧烈地抽搐着。她不知怎么地在自己沙哑的呻吟声中找到了时间吸完你的乳房，而你自己也在快感中深深地呻吟，暂时排空的甜蜜解脱感在你的[chest]中荡漾。[pg]");
         outputText("在完全喝光了你的乳汁后，狐妖平躺在你的腿上，疲惫地喘着粗气，而她的小穴还在继续轻轻地吸吮着你的手指。她的肚子已经胀得像个沙滩排球那么大，随着她的每一次呼吸而颤动，她的长袍敞开着，无法将其包裹住。她用双臂环抱着肚子，爱抚着它，偶尔发出呻吟，而她的尾巴则无力地在身下抽动着。[pg]");
         outputText("[say: 哦……我好饱……]她呻吟着，翻着白眼，舌头舔过嘴唇，品尝着残留在上面的乳汁。[pg]");
         outputText("你小心翼翼地把她放在地上，站起身来，再次穿上你的[armor]。狐妖依然呆在原地，被她那过大的肚子压得动弹不得。直觉告诉你，她可能有一段时间都无法离开那个地方了。");
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         get_player().orgasm("Tits");
         dynStats(DynStat.Sens(3));
         get_combat().cleanupAfterCombat();
      }
      
      public function execEncounter() : void
      {
         if(Utils.rand(3 + get_player().itemCount(get_consumables().FOXJEWL)) >= 2)
         {
            kitsuneShrine();
         }
         else
         {
            enterTheTrickster();
         }
      }
      
      public function enterTheTrickster() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,628) > 0)
         {
            willOWisp();
            return;
         }
         clearOutput();
         outputText("[say: 救、救命！][pg]");
         outputText("你猛地转过身，只见一个小女孩冲破灌木丛，一头撞进了你的怀里。她看起来被粗暴地对待过——她那简单的农家衣服被撕破磨损，额头上还有几处污迹，似乎是在泥土中被拖拽过。[pg]");
         if(get_player().isChild())
         {
            outputText("[say: 你在干什么？！快跑！有个……东西，它在追我！]她哭喊着，抓住你的手臂拉着你，为了不摔倒，你不得不顺着路走了几步。你抓住她的肩膀，问她发生了什么事，她仔细看了看你，注意到了你的[weapon]，然后平静了下来。[say: 我和姐姐在外面采野果，然后，然后……那些可恶的、可怕的小东西袭击了我！][pg]");
            outputText("你正要问她，却被一只从灌木丛中飞出的小恶魔打断了，它咆哮着，张牙舞爪地向你扑来。至少……很明显它<i>试图</i>表现得很凶恶。这种夸张的表演看起来更多的是滑稽，但躲在你身后的小女孩显然感觉到了威胁，所以你最好还是处理掉这个害虫。");
         }
         else
         {
            outputText("[say: 谢、谢天谢地！求求你，你一定要帮帮我！]她哭喊着，飞快地躲到你身后。[say: 我在外面采野果，然后，然后……那些可恶的、可怕的小东西袭击了我！][pg]");
            outputText("你正要问她，却被一只从灌木丛中飞出的小恶魔打断了，它咆哮着，张牙舞爪地向你扑来。至少……很明显它<i>试图</i>表现得很凶恶。这种夸张的表演看起来更多的是滑稽，但躲在你身后的小女孩显然感觉到了威胁，所以你最好还是处理掉这个害虫。");
         }
         startCombat(new Imp());
         get_monster().createStatusEffect(StatusEffects.KitsuneFight,0,0,0,0);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,628,FlagDict_Impl_.arrayReadInt(_loc1_,628) + 1);
      }
      
      public function encounterName() : String
      {
         return "狐妖";
      }
      
      public function encounterChance() : Number
      {
         return 1;
      }
      
      public function doseAKitsuneWithOviElixirs() : void
      {
         var _loc2_:* = null as ItemType;
         clearOutput();
         kitsuneSprite();
         var _loc1_:int = get_player().cockThatFits(100);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         outputText("你在[inv]里摸索着，找出一个挂着鸡蛋标签的六角形大瓶子。你把它举到光亮处，摇晃着里面浓稠的绿色液体。当你向她靠近时，狐妖警惕地盯着你，慢慢地向后爬，直到撞上一棵树。她拼命想要逃跑，但在你" + (get_player().cor < 33 ? "一把抓住她的长袍，将她拽入怀中" : "踩住她的一条尾巴，让她惊叫一声，摔了个狗啃泥") + "时，她的逃跑计划彻底泡汤了。[pg]");
         outputText("你一手拿着瓶子，用拇指顶开塞子，将她按倒在地。她无力反抗，你轻而易举地制服了她微弱的挣扎，将水晶瓶倒进她的嘴里。你按住她的头，让瓶口一直贴着她的嘴唇，直到最后一滴液体消失在她的喉咙里，然后随手扔掉瓶子，退后一步准备看好戏。[pg]");
         outputText("[say:呃……我、我的肚子……]她呻吟着，双手捂住腹部，你听到她体内传来清晰的咕噜声。她的肚子开始膨胀，肉体简直像在冒泡一样，隆起成一个坚实的圆球。[pg]");
         outputText("她微微喘息着，向后靠在树上支撑着身体，试图平复呼吸。她抬头对你咧嘴一笑，气喘吁吁地调侃道：[say:所、所以，你……呃……你喜欢怀孕的女孩，是吗？你最好……嗯……负起责任来……][pg]");
         outputText("很明显，她试图保持狡黠的姿态，但完全失败了。随着她模拟怀孕的阶段不断推进，她不时地弯下腰，紧紧捂住肚子。她的魔法一定与药水发生了反应，或者类似的情况，因为自从你开始这个小实验以来，她的肚子已经膨胀了近四倍，沉甸甸地垂在臀部上方。[pg]");
         outputText("她呻吟着，顺着树干滑坐下来，双臂支撑着她那曲线惊人的沉重腹部。你现在确信有些不对劲了，因为她的乳房从长袍里溢出，随着剧烈的晃动，两股乳汁从她迅速膨胀的乳房中喷洒而出。据你所知，产卵灵药可不会有这种效果。[pg]");
         outputText("她进一步瘫倒下去，充满爱意地抚摸着肚子，平躺在地上。她那肿胀的乳房随着她每一次艰难的呼吸而起伏着。[pg]");
         outputText("[say:如果你只是站在那里傻看……嗯……你可能会错过机会的，]她说道，随着子宫内卵子剧烈膨胀的平息，她恢复了一些镇定。[pg]");
         outputText("她的话将你从恍惚中拉回现实，你冲过去，匆忙脱下[armor]。你在她身边跪下，双手开始在她身上游走，揉捏着她那极度肿胀的乳房，引出她一声轻柔的呻吟。当你将手掌滑过她隆起的孕肚，温柔地抚摸着紧绷的肌肤时，她发出了轻柔的娇喘。你的抚摸向下延伸，在她的双腿上短暂停留，然后将它们分开，探向中间那肿胀的阴唇。[pg]");
         outputText("你温柔地将一根手指插入她湿润的小穴，享受着你慢慢抽插手指时她发出的呻吟声。当你的手指在她光滑粉嫩的裂隙中滑动时，她剧烈地颤抖了一下，肚子里传来一阵急促的咕噜声。[pg]");
         outputText("意识到如果再拖延下去，你真的会错过机会，你急忙抽出手指，重新调整姿势，来到她张开的双腿之间，将你的[cock biggest]撸到完全勃起。当" + get_player().cockHead(_loc1_) + "压上她温暖的爱洞时，她呻吟着，微微弓起背，尽管肚子的重量让她有些吃力。[pg]");
         outputText("当你准备挺身进入她颤抖的阴唇时，两条金色的尾巴缠上了你跳动的阴茎，一条卷住你的" + (get_player().hasSheath() ? "包皮" : "根部") + "，另一条则在阴茎下方慢慢地挠痒。" + (get_player().get_gender() >= 2 ? "它在你的肉棒上缓慢地上下游走，然后向下飘向你的[vagina]，温柔地挑逗着你的[clit]。" : "") + "当你深入她的深处时，她肿胀的小穴轻松地为你分开，充满肉欲地包裹着你的阴茎。肌肉壁在你周围拉伸，一股稳定的女性淫液顺着你的" + get_player().cockDescript(_loc1_) + "流出。[pg]");
         outputText((get_player().biggestCockArea() > 50 ? "无论你将多少跳动的肉棒塞进她饥渴的小穴，她颤抖的肉壁都在不断延伸，贪婪地吞咽着你的阴茎。" : "") + "你的骨盆轻轻地撞击着她的骨盆，让她的孕肚泛起一阵涟漪，你慢慢开始挺动臀部。你俯身压在她身上，开始摸索揉捏她肿胀的乳房，双手抚摸着柔软顺从的肌肤，用力挤压出一点乳汁。[pg]");
         outputText("当你把玩她的乳房时，她顺从地放松下来，手指穿过自己亚麻色的头发，大声呻吟着。她的双腿紧紧缠住你的[hips]后部，将你向前拉，紧贴着她肚子的下方，你能感觉到她子宫里仍在生长的卵子发出的轻微震动。[pg]");
         outputText("[say:玩、玩得开心吗，我希望？啊，我好饱……]她发出一声沙哑的呻吟，舒服地翻了个白眼。[pg]");
         outputText("当你将双手陷入她肿胀乳房柔软黏糊的肉中时，她伸出手臂环住你的肩膀，将你拉向她的胸膛。她圆润的肚子在你身下凸起，让你在这个姿势下很难保持平衡，但你尽力将[feet]稳扎在泥土中，并加倍用力地挺动臀部。她的手指划过你的后颈，将你拉向她那肿胀漏奶的乳头之一，轻声呻吟着。[pg]");
         outputText("[say:请……喝吧，]当你含住并开始吸吮她浓郁的乳汁时，她带着颤抖的叹息说道。[say:我、我的奶好喝吗，亲爱的？][pg]");
         outputText("你唯一的回答就是大口吸吮她浓稠的乳汁，同时像发情的野兽一样将臀部猛烈地撞击她湿滑的阴道，对着她晃动的乳房呻吟。她的呻吟在胸腔里回荡，当你吸干她一侧乳房的内容物，然后换到另一侧时，那声音弄得你嘴唇发痒。当美味的乳汁滑下你的喉咙时，你感到一阵清凉的刺痛感，舌尖萦绕着独特的冬青余味。[pg]");
         outputText("这种刺痛感从你的核心蔓延开来，一直向下延伸到你的腹股沟。当她体内的每一次挤压和蠕动都被放大十倍时，你几乎要在快感中失去理智。你感觉到她膨胀的腹部传来一阵响亮的咕噜声，看着她脸上的愉悦突然被紧张的痛苦表情所取代。你没有多少时间了——急于结束的你将双手移到她的臀部，开始不顾一切地猛烈抽插。你臀部的每一次挺动都让她肿胀的乳房淫荡地晃动，乳汁飞溅到空中。[pg]");
         outputText("[say:哈-啊！别停！就、就快……到了！]她大喊着，脸上交织着痛苦与欢愉，她湿透的阴道紧紧夹住你，每一次抽插都有一股温暖的淫液溅在你的肚子上。[pg]");
         outputText("当你高潮时，她的身体突然紧绷起来，手指深深掐进你的肩膀，咬紧牙关，用尽全力夹紧你的[cock biggest]。就在你第一股精液开始注入她塞满卵的子宫的瞬间，你感觉到一个坚硬圆润的东西开始沿着紧致的通道滑下，紧贴着你抽搐的阴茎。" + (get_player().cumQ() > 1000 ? " 高压的精液带开始从她的小穴口喷涌而出，每一次泥泞的抽插都发出响亮的吧唧声。她怀孕般的肚子微微泛起液体的晃动，你的精液在她的子宫和卵之间提供了一层缓冲。" : "") + "[pg]");
         outputText("你的阴茎伴随着一声响亮的“啵”声被挤出了她的肉褶，紧接着是一颗浸满精液的卵。" + (get_player().cumQ() > 350 ? "温暖的精液继续从你抽搐的肉棒中喷出，在空中划出一道弧线，伴随着湿润的拍打声落在她的" + (get_player().cumQ() > 1000 ? "脸、胸和" : "") + "肚子上。" : "又有几股精液喷洒在她的下腹部，用你粘稠的精液将其染白。") + " 她发出一声深沉的呻吟，双手捂住肚子，第二颗卵开始露头，挤出来并在混合液体的水坑中滚动。" + (get_player().cumQ() > 1000 ? "随着她排出的每一颗新卵，一条小小的精液河从她的小穴中喷涌而出，随着每颗卵下降暂时堵住她的洞口，然后用力弹出，水流时断时续。" : "那颗卵很快又被另一颗、再另一颗跟着，似乎无穷无尽的一窝卵一次一颗地从她紧闭的小穴中弹出。") + "[pg]");
         outputText("随着她产下的每一颗卵，她的肚子逐渐瘪了下去，她一边用力一边发出咕哝声。当最后一颗巨大的卵终于从她湿透的小穴中被挤出时，她发出了巨大的呻吟声，在汗水、乳汁和精液的水坑中筋疲力尽地喘息着。你也坐下来喘口气，看着狐妖的乳房慢慢缩小回正常大小，然后把注意力转向地上的那堆卵。[pg]");
         outputText("它们");
         if(Utils.rand(3) == 0)
         {
            _loc2_ = get_consumables().LARGE_EGGS[Utils.rand(int(get_consumables().LARGE_EGGS.length))];
         }
         else
         {
            _loc2_ = get_consumables().SMALL_EGGS[Utils.rand(int(get_consumables().SMALL_EGGS.length))];
         }
         outputText("大约有鸵鸟蛋那么大。你拿起一个仔细端详，在手里转了转。灌木丛中的沙沙声把你的注意力拉回狐妖身上，但当你抬起头时，你只看到几条金色的尾巴溜进了灌木丛。[pg]");
         get_player().consumeItem(get_consumables().OVIELIX);
         outputText("[say: 照顾好我的小蛋蛋，亲爱的！]");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,_loc2_.get_id());
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function donation() : void
      {
         var item3:ItemType;
         var _g3:KitsuneScene;
         var item2:ItemType;
         var _g2:KitsuneScene;
         var item1:ItemType;
         var _g1:KitsuneScene;
         var item:ItemType;
         var _g:KitsuneScene;
         clearOutput();
         outputText("即使神龛看起来无人照管，你也确信留下一些东西作为捐赠是件公平的事。肯定会有任何可能仍在注视着这个地方的神明为此感激不尽。");
         menu();
         addNextButton("宝石",donateGems).hint("留下一些宝石。").disableIf(get_player().get_gems() < 10);
         var _loc1_:String = Utils.cnName(get_consumables().H_BISCU.get_shortName());
         _g = this;
         item = get_consumables().H_BISCU;
         addNextButton(_loc1_,function():void
         {
            _g.donateItem(item);
         }).hint("留下一块饼干。").disableIf(!get_player().hasItem(get_consumables().H_BISCU));
         var _loc2_:String = Utils.cnName(get_consumables().LOLIPOP.get_shortName());
         _g1 = this;
         item1 = get_consumables().LOLIPOP;
         addNextButton(_loc2_,function():void
         {
            _g1.donateItem(item1);
         }).hint("捐赠一根棒棒糖。").disableIf(!get_player().hasItem(get_consumables().LOLIPOP));
         var _loc3_:String = Utils.cnName(get_consumables().KITGIFT.get_shortName());
         _g2 = this;
         item2 = get_consumables().KITGIFT;
         addNextButton(_loc3_,function():void
         {
            _g2.donateItem(item2);
         }).hint("留下一个狐妖礼物。").disableIf(!get_player().hasItem(get_consumables().KITGIFT));
         var _loc4_:String = get_useables().TELBEAR.get_shortName();
         _g3 = this;
         item3 = get_useables().TELBEAR;
         addNextButton(_loc4_,function():void
         {
            _g3.donateItem(item3);
         }).hint("留下一个泰迪熊。").disableIf(!get_player().hasItem(get_useables().TELBEAR));
         setExitButton("返回",kitsuneShrine).hint("也许你还想在神社里做点别的什么事。");
      }
      
      public function donateItem(param1:ItemType) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         clearOutput();
         if(param1 == get_consumables().H_BISCU == true)
         {
            outputText("你选择留下一块饼干作为神龛的供品。你从包里拿出食物，谦卑地放在金色雕像前，开始默默祈祷好运降临。希望有更高的力量能听到你的声音，至少能看顾你[if (corruption < 30) {高尚的}]旅程。");
            outputText("[pg]离开神龛和你的供品，你只能希望今天留下的东西能让仍然居住在这里的神明感到高兴。");
         }
         else
         {
            _loc4_ = param1 == get_consumables().LOLIPOP;
            if(_loc4_ == true)
            {
               outputText("你伸手进包里，拿出了你藏起来的棒棒糖。这种美妙的甜食肯定会让许多人垂涎三尺。[if (ischild) {你依依不舍地牺牲了你的甜食，把它放在神龛前，开始默默祈祷好运|你把棒棒糖放在神龛前，开始默默祈祷好运}]。你只能希望有更高的力量能听到你的恳求，并愿意在你的冒险中至少看顾你。");
               outputText("[pg]当你离开时，你想知道你的供品是否会让仍然居住在神龛里的神明感到高兴。");
            }
            else
            {
               _loc3_ = param1 == get_consumables().KITGIFT;
               if(_loc3_ == true)
               {
                  outputText("你伸手进包里，拿出了你从狐妖那里得到的方形包裹。里面的东西对你来说是个谜，但这并不意味着它们是坏东西。你轻轻地把包装好的狐妖礼物放在神龛前，献上谦卑的祈祷。你只能希望有更高的力量能听到你的恳求，并可能至少考虑看顾你的旅程。");
                  outputText("[pg]离开神龛，你想知道你的供品是否会让仍然居住在里面的神明感到高兴。");
               }
               else
               {
                  _loc2_ = param1 == get_useables().TELBEAR;
                  if(_loc2_ == true)
                  {
                     outputText("你伸手进包里，拿出了里面可爱的泰迪熊。在艰难时期，这个毛绒玩具绝对是一件奢侈品，[if (ischild) {你最后一次充满爱意地挤压它作为告别，然后}]你把它放在金色雕像前。献上谦卑的祈祷，你只能希望比你更强大的力量能听到它，并选择慷慨地看顾你[if (cor < 30) {高尚的}]旅程。");
                     outputText("[pg]离开神龛[if (ischild) {和你的泰迪熊}]，你希望仍然居住在里面的神明会对你留给他们的东西感到满意。");
                  }
               }
            }
         }
         get_player().destroyItems(param1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function donateGems() : void
      {
         clearOutput();
         outputText("你决定留下一些宝石，于是伸手进钱包，拿出了一些你辛苦赚来的钱。你谦卑地将供品放在金色雕像前，默默祈祷好运降临。至少，你可以希望有更高的力量能看顾你的旅程。");
         outputText("[pg]离开神龛时，你只能好奇，这里是否还有神明居住，他们是否会对你留下的东西感到满意。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defeatTheKitsunes(param1:Boolean = true) : void
      {
         var _g1:KitsuneScene;
         var _g:LustyMaidensArmor;
         var _loc2_:Boolean = false;
         var _loc3_:* = null as String;
         if(param1)
         {
            clearOutput();
            kitsuneSprite();
            if(get_monster().get_HP() < 1)
            {
               outputText("狐妖“哎哟”一声摔倒在地，重重地落在了她那肉感十足的屁股上。" + (get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0 ? " 当她圆润的臀部撞击到泥土的那一刻，一团旋转的火焰在她的双腿之间噼啪作响，吞噬了她暴露在外的肉棒。当火焰熄灭时，她那根跳动的肉棒只剩下一颗挺立的樱桃色花蕾，夹在她滴水的阴唇之间。" : "") + " 她揉着酸痛的后部，痛苦地皱着眉头，像个孩子一样撅着嘴。[pg]");
               outputText("[say:我只是想玩玩而已……]她垂头丧气地说。[pg]" + (get_player().get_lust() >= 33 ? "<b>好吧，你当然能想到一些“玩”的方法。你要对她做什么？</b>" : ""));
            }
            else
            {
               _loc2_ = get_monster().hair.color == "red" && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0;
               _loc3_ = get_player().get_lust() >= 33 ? "<b>看着她淫荡的表演，你意识到自己的欲望还没有得到满足。你要对她做什么？</b>" : "";
               outputText("狐妖倒在地上，一只手伸进长袍里，不知羞耻地自慰着，她太兴奋了，根本无法继续战斗。" + (_loc2_ ? " 当她圆润的臀部撞击到泥土的那一刻，一团旋转的火焰在她的双腿间噼啪作响，吞噬了她暴露的肉棒。当火焰熄灭时，她那根跳动的肉棒只剩下一个挺拔的樱桃色花蕾，夹在她滴水的阴唇之间。" : "") + "[pg]" + _loc3_);
            }
         }
         menu();
         if(get_player().hasCock())
         {
            addNextButton("操小穴",fuckAKitsuneVaginally);
         }
         else
         {
            addNextButtonDisabled("操小穴","这个场景需要你有一根肉棒。","操她的小穴");
         }
         if(get_player().hasCockThatFits(144))
         {
            addNextButton("操屁眼",putItInAKitsunesAssWin);
         }
         else
         {
            addNextButtonDisabled("操屁眼","这个场景需要你有一根合适的肉棒。","操她的屁眼");
         }
         addNextButton("乳交",kitsuneTitjobWin).disableIf(!get_player().hasCock(),"这个场景需要你有一根肉棒。");
         if(get_player().hasVagina())
         {
            addNextButton("磨豆腐",tribbingWithAKitsune);
         }
         else
         {
            addNextButtonDisabled("磨豆腐","这个场景需要你有一个阴道。");
         }
         if(get_player().hasCock())
         {
            addNextButton("尾交",tailJobKitsuneWin);
         }
         else
         {
            addNextButtonDisabled("尾交","该场景需要你拥有阴茎。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            addNextButton("触手",kitsunesGetBonedBy3PlusTentacles);
         }
         else
         {
            addNextButtonDisabled("触手","该场景需要你至少拥有3根触手阴茎。");
         }
         addNextButton("催情骑乘",kitsuneDraftRide).hint("给她下药，然后坐在她的脸上。").disableIf(!get_player().hasItem(get_consumables().L_DRAFT) && !get_player().hasItem(get_consumables().F_DRAFT),"你需要一瓶催情剂或强效催情剂。").sexButton(2);
         if(get_monster().hair.color == "blonde")
         {
            if(get_player().hasItem(get_consumables().F_DRAFT) && get_player().hasCock())
            {
               addNextButton("使用强效催情剂",fuckDraftBlond).hint("你可以给她灌下强效催情剂……");
            }
            else
            {
               addNextButtonDisabled("使用强效催情剂","该场景需要你拥有阴茎和一瓶强效催情剂。","使用强效催情剂");
            }
            if(get_player().hasItem(get_consumables().LACTAID) && get_player().hasCock())
            {
               addNextButton("使用催乳剂",lactaidDoseAKitSune).hint("你可以给她灌下催乳剂……");
            }
            else
            {
               addNextButtonDisabled("使用催乳剂","该场景需要你拥有阴茎和一瓶催乳剂。","使用催乳剂");
            }
            if(get_player().hasItem(get_consumables().OVIELIX) && get_player().hasCock())
            {
               addNextButton("使用产卵灵药",doseAKitsuneWithOviElixirs).hint("你可以对她使用产卵灵药……");
            }
            else
            {
               addNextButtonDisabled("使用产卵灵药","该场景需要你拥有阴茎和一瓶产卵灵药。","使用产卵灵药");
            }
         }
         if(get_monster().hair.color == "black")
         {
            if(get_player().hasCockThatFits(144))
            {
               addButton(1,"热狗肛交",hotdogAnalInKitsuneButtDontLetTailTickleYourNose);
            }
            else
            {
               addButtonDisabled(1,"热狗肛交","该场景需要你拥有尺寸合适的阴茎。","热狗肛交");
            }
            if(get_player().hasVagina())
            {
               addNextButton("被舔",getLickedByKitsunes);
            }
            else
            {
               addNextButtonDisabled("被舔","该场景需要你拥有阴道。","被舔");
            }
            if(get_player().hasCockThatFits(108))
            {
               addNextButton("接受口交",getABJFromAFoxGirl);
            }
            else
            {
               addNextButtonDisabled("接受口交","该场景需要你拥有尺寸合适的阴茎。");
            }
         }
         if(get_monster().hair.color == "red")
         {
            if(get_player().hasCockThatFits(144))
            {
               addNextButton("捆绑",nonFutaRedHeadBondageIGuessYouTieHerUpWithYourPenisThenHuh);
            }
            else
            {
               addNextButtonDisabled("捆绑","该场景需要你拥有尺寸合适的阴茎。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0 && get_player().hasCock())
            {
               addNextButton("大腿手交",nonFutaRedHeadIsWorstRedheadLapsittingHandjobThingIDontKnow);
            }
            else
            {
               addNextButtonDisabled("大腿手交","该场景需要你拥有尺寸合适的阴茎。她必须是纯粹的女性。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 && get_player().isHerm())
            {
               addNextButton("扶她螺旋",helixZeKitsunes);
            }
            else
            {
               addNextButtonDisabled("扶她螺旋","该场景需要你们双方都是扶她。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0)
            {
               addNextButton("长出阴茎",bringBackDick);
            }
            else
            {
               addNextButton("抛弃阴茎",redheadsDontDeserveToHavePenisesBecauseTheyreTooGayForPenisOrSomethingIDontReallyKnowHowThisWorksOrWhyThisFunctionNameIsSoFuckingLong);
            }
            if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0)
            {
               addNextButton("骑乘她的阴茎",rideDatRedheadKitsuneCockIntoTheSkyDiamonds);
            }
            else
            {
               addNextButtonDisabled("骑乘她的阴茎","该场景需要你拥有阴道。她必须是扶她。","骑乘她的阴茎");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) > 0 && get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armorName() == "lusty maiden\'s armor")
            {
               _g = get_player().get_armor();
               addNextButton("B.Titfuck",function():void
               {
                  _g.lustyMaidenPaizuri();
               });
            }
         }
         if(get_player().hasPerk(PerkLib.Feeder) || get_player().lactationQ() >= 2000)
         {
            addNextButton("母乳喂养",feederTheKitsunes);
         }
         else
         {
            addNextButtonDisabled("母乳喂养","该场景需要你拥有极高的产奶量。");
         }
         if(get_silly())
         {
            if(get_monster().hair.color == "red" || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,627) == 0)
            {
               addNextButton("饮酒",kitsuneDrinking);
            }
         }
         addNextButton("抚摸尾巴",kitsuneTouchTail).hint("试着摸摸她那诱人的尾巴。");
         _g1 = this;
         setSexLeaveButton(function():void
         {
            _g1.leaveKitsune();
         });
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function bringBackDick() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("你若有所思地打量着她，一边摸着下巴，一边盯着她的胯部。不知怎么的，那里似乎……空荡荡的。好像少了点什么。[pg]");
         outputText("当你告诉这个红发女孩你希望她重新长出肉棒时，她的眼睛亮了起来。她急切地服从了，脸上露出欣喜的笑容。火花从她张开的双腿间飞溅而出，一道蓝色的火柱在她的阴蒂周围喷发。她发出痛苦而又愉悦的呻吟，蓝色的火舌开始凝聚成一个隐约的阴茎形状。[pg]");
         outputText("当最后一缕火焰在空气中卷曲并消失时，她的肉棒凝固了，骄傲地挺立着，柱身上已经有一丝清液滴落下来。[pg]");
         outputText("[say:嗯……你终于决定要狂野一把了，]她调侃道，对你露出娇媚的笑容。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,627,1);
         defeatTheKitsunes(false);
      }
      
      public function blondeKitsuneRapesSmallWangs() : void
      {
         clearOutput();
         kitsuneSprite();
         outputText("当你气喘吁吁地倒在地上时，早熟的狐妖带着掠食者般的冷笑向你逼近。你抬头看着她，害怕她会对你做些什么。你鼓起仅存的一点意志力，拼命向后爬，但当你试图挣扎着站起来时，你发现你的脸压在了一些极其柔软的东西上。六条闪闪发光的金色尾巴缠绕在你的身体上，你从狐妖丰满的乳房之间抬起头，看到她正低头对你咧嘴笑，她的表情介于溺爱和饥渴之间。[pg]");
         outputText("[say: 嘘……如果你不反抗的话，会轻松很多，]她低声说道，她温暖的声音几乎瞬间瓦解了你的抵抗。[pg]");
         outputText("她的手指划过你的脸颊，耀眼的火花在她的指尖下绽放，并在你的皮肤上舔舐，让你舒服地发抖。虽然你脑海中仍有一小部分声音敦促你挣脱她温柔的抚摸，但当她把手滑进你的[armor]下，用指尖抚摸你赤裸的身体时，这种声音很快就消失了。你不由自主地呻吟起来，剧烈地颤抖着，感觉肌肉变得松弛。[pg]");
         outputText("她没有把手从你身上拿开，而是熟练地用尾巴把你的[armor]一件一件地脱下来，慢慢地把你向后放倒在地上。你一丝不挂，任由她温柔地抚摸，当冰冷的火焰沿着你的[fullChest]向你的腹股沟呈之字形移动时，你浑身发抖。你的[cock]勃起，擦过她前臂的下侧，轻轻地抽搐着。她高兴地冷笑了一声，轻轻地捏了捏它，把它推回你的肚子上，当她松开它，看着它弹回来，把几根细细的预先分泌的精液甩到空中时，她咯咯地笑了起来。[pg]");
         outputText("[say: 哇，太可爱了……]她说着，食指在你的肉棒上上下滑动，一小颗蔚蓝色的火焰紧随其后。[pg]");
         outputText("你的阴茎不由自主地跳动和抽搐，当她用指尖划过你敏感的肉棒时，她神奇的触摸让你在快感中扭动和不安。你的臀部不由自主地向上挺起，一根滑腻的预先分泌的精液从你的肉棒中挤出，落在狐妖鼻子上方一点的脸上。[pg]");
         outputText("[say: 不行！坏孩子！]她说着，带着顽皮的怒容弹了一下你的鼻子。她把你的肉棒握在手里，压在你的[hips]上，强迫你回到地上，并用惊人的力量把你按住。[pg]");
         outputText("她的尾巴像蛇一样向前伸展，缠绕在你的四肢上，你发现自己被按住了，徒劳地挣扎着，试图挣脱那异常强壮的毛茸茸的线圈。她点点头，对你的无助感到满意，然后俯下身轻轻地蹭你的[cock]，轻柔地咕咕叫着，用她柔软湿润的舌头沿着下侧从根部滑到尖端，发出一声小小的咯咯笑声。她的舌头在你的" + get_player().cockHead() + "的下侧来回盘旋，包裹着它，吸吮着你滑腻的预先分泌的精液。[pg]");
         outputText("[say: 嗯……这样才对嘛。][pg]");
         outputText("她脸上带着满意的笑容，再次坐直身子，慢慢地拉下她的长袍。你只能躺在地上看着她脱衣服，你的阴茎现在在空中自由地来回摆动。她用她丝绸般的尾巴戏弄和刷过你的腹股沟，当她开始性感的脱衣舞时，她害羞地冷笑着。当她长袍的上半部分掉落时，她丰满挺拔的乳房自由地弹跳着，她开始摩擦敏感的粉红色小凸起，让它们轻轻地弹出来。她的手向下滑动，吸引你的目光穿过她赤裸、乳白色的肌肤。你数了数她身上的许多纹身，但你的目光却被她腰带上方露出的那个纹身迷住了。她来回摇摆着臀部，拉扯着固定长袍下半部分的腰带，轻轻地把它们拉下来，稍微转过身来炫耀她健美但宽阔的臀部。[pg]");
         outputText("当她跨坐在你的肩膀上，把颤抖的脸颊降到你的脸上时，你可以看得更清楚。被埋在柔软的土丘下，你抗议地呻吟着，但这只会让狐妖因快感而发抖。然而，在她让你窒息之前，她躺在你的身前，给你足够的空间让你向后仰起头，在巨大的脸颊再次覆盖你的脸之前，大口呼吸新鲜空气。你的舌头尝到了她小穴甜腻的味道，滑出来分开湿润的褶皱，沿着她的阴蒂上下舔舐。[pg]");
         outputText("她的整个身体都有些发抖，当她俯下身轻轻地亲吻你的[cock]的末端时，你现在可以感觉到她柔软的乳房压在你的腹股沟上。她开始在你的脸上来回摇晃她宽大、曲线优美的臀部，把她的胯部磨进你的嘴里，并发出呻吟声。没有按住你四肢的尾巴轻轻地卷在你的脖子下面，抬起你的头。当你感觉到她的嘴唇轻轻地包裹住你肉棒的尖端，她的舌头在" + get_player().cockHead() + "上轻轻地玩耍时，你在她的小穴里呻吟。当她拉开距离时，她的嘴唇发出轻柔的吧唧声，她开始高兴地玩弄你的阴茎，用她的食指戏弄地抚摸它，只是为了感受你的反应在她的腰部颤抖。[pg]");
         outputText("[say: 哦，是的，没错，就是这样！做个好[boy]，舔妈妈的小穴，]她呻吟着，把她的小穴捣进你的脸上，带着动物般的热情骑在你的舌头上。[pg]");
         outputText("她的尾巴弯曲，拉起你的手臂，把你的手放在她美味的臀部上，在你阻止自己之前，你开始挤压她柔软、柔韧的臀部脸颊。你的手指深深地陷入肉质的球体中，它们令人愉悦的晃动让你的脑海中充满了各种淫秽的幻想。你抬起臀部，徒劳地试图引起你那狡猾的袭击者的一些注意，结果却被推回泥土中。" + (get_player().get_inte() > 50 ? "虽然你可能很虚弱，但你确定她实际上不可能那么强壮——这<i>一定</i>是她的另一个幻觉。" : "你不记得她有那么强壮！") + "[pg]");
         outputText("[say: 不行！你要乖，调皮的[boy]！]她咆哮道。你几乎能感觉到她在皱眉，尽管你的视线几乎完全被她巨大的臀部遮挡了。为了惩罚你的越轨行为，她的尾巴把你的手从她的屁股上拉开，她坐起来，用它让你窒息。[pg]");
         outputText("你的舌头继续探索她的深处，而你在她晃动的脸颊下慢慢窒息。你用尽每一分意志，试图从她甜美的蜜罐中抽离，但无济于事。她的尾巴缠绕在你的后脑勺上，让你紧紧地塞在她的胯部，她上下骑乘，完全不顾你挣扎的抗议。[pg]");
         outputText("你终于喘息着从她流着口水的小穴中挣脱出来，咳嗽着，拼命地深吸了一口新鲜空气。你的胸口剧烈起伏，肺部充满了空气，滑腻的汁液顺着你的下巴流下，她那女性的麝香气味渗透了你的感官。然而，这喘息的时间是短暂的，几秒钟后，你的头又被狐妖沉重的屁股压回了泥土里。这种模式又重复了几次，到最后，你气喘吁吁，脑海中所有反抗的念头都被清除了。[pg]");
         outputText("对你的顺从感到满意，她慢慢地再次将她的前半身降到你的腹股沟，用她温暖柔软的乳房包裹住你被冷落的阴茎。[pg]");
         outputText("[say: 嗯，你好啊，小家伙，]她用一种唱歌般的声音说道，用一只手臂环抱住她的乳房，将它们挤压下来并固定住，同时用食指轻轻地拨弄着你的[cock]的顶端。[pg]");
         outputText("[say: 哦，就在那里，舔那里！如果你是个乖[boy]，我可能会让你射在我的奶子上。][pg]");
         outputText("你还没来得及阻止自己就点头同意了，意识到你已经无法控制自己的身体了。她的尾巴松开了抓握，允许你再次抓住她那丰满的屁股，她开始慢慢地将她涂满前列腺液的奶子在你的肉棒上上下滑动，看着它在她的乳沟里抽动，不停地咯咯笑着。她奖励你的服从和顺从，高兴地用舌头舔过你的" + get_player().cockHead() + "，并根据你取悦她的程度来调整她的速度。[pg]");
         outputText("渴望释放的你，强迫自己的舌头深入她那甜蜜湿润的裂缝，比你想象的还要深，用你能想到的唯一方式催促她给你想要的性高潮。在突然的深度入侵下，她向前挺动，她的嘴唇包裹住你的阴茎顶端，因为它从她那柔软的乳房之间向上推。她嘴巴的温暖和她舌头抚摸你肉棒的柔软，让一阵快感传遍你的脊背，你只能尽力不让自己的臀部再次向上挺动，因为你很清楚这不会有什么好结果。[pg]");
         outputText("她的嘴唇在你痉挛的肉棒周围起伏，每次她向后拉时，低沉的呻吟声都会穿透它。你可以感觉到她的脸颊因为吸吮的力量而向内拉扯，每次她嘴唇几乎密封的缝隙中形成空隙时，空气中都会充满响亮的吧唧声。她尽可能地挤压她的乳房，降低嘴唇去亲吻你的" + (get_player().hasSheath() ? "包皮" : "根部") + (get_player().balls > 0 ? "，并伸手下去轻轻抚摸你的" + get_player().ballsDescriptLight() : "") + (get_player().get_gender() == 3 ? "，她那修长灵巧的手指滑入你的" + get_player().vaginaDescript() : "") + "[pg]");
         outputText("你的呻吟声被她喷涌的小穴所掩盖，当你把脸埋进她的阴户时，手指深深地陷入她屁股那柔软的肉中，你那充满欲望的哀嚎在她的洞穴中回荡，就像音乐厅里的交响乐。你们不约而同地把脸埋进对方的腹股沟，带着毫不掩饰的激情吸吮和舔舐。[pg]");
         outputText("她的小穴在你的舌头周围抽搐，几乎要把舌头从你嘴里吸出来，你突然尝到了她高潮汁液的浓重味道，一阵淫水浸透了你的脸，喷溅在你的胸膛上。当她把嘴移开，发出一声呻吟时，凉爽的空气拂过你的阴茎，你下半身的压力达到了顶峰，沸腾起来。");
         if(get_player().cumQ() <= 150)
         {
            outputText("你的阴茎疯狂地抽搐和痉挛，热流般的精液喷射而出，在呻吟的狐狸女孩的乳房上画出细细的白色条纹。闪闪发光的精液水滴慢慢地从她胸部的曲线上滚落，聚集在乳沟的一个小口袋里，而你那疲软的阴茎则慢慢地退回到她温暖的怀抱中。");
         }
         else if(get_player().cumQ() <= 350)
         {
            outputText("你将滚烫的精液喷洒在她摇晃的乳房上，给她留下白色的条纹，几股迷失方向的精液甚至飞溅到了她的下巴上。一颗闪闪发光的精液水珠顺着她脖子的曲线滑落，与其余的精液一起汇聚在她乳房之间的一个小水坑里，你那疲软的阴茎逐渐退回到她的乳沟中。");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("乳白色的精液丝带从你的阴茎中飞溅而出，高高地划过一道弧线，然后落在她的脸和胸膛上。浓稠的精液滴落在她的下巴上，掉落下来，加入了聚集在她乳房之间的精液水坑中，发出稳定的、啪嗒啪嗒的拍打声，而你的阴茎则慢慢地退回到她的乳沟中。");
         }
         else if(get_player().cumQ() < 2500)
         {
            outputText("你的肉棒因快感而肿胀，将浓稠的精液喷射到空中。很快，她的脸、胸膛和头发上都涂满了一层珍珠般光泽的精液，浓稠湿润的精液从她身上滴落和滚落。一滩精液溢出她摇晃的乳房，你的肉棒消失在乳白色的水池中，退回到她的乳沟里。");
         }
         else
         {
            outputText("一股浓稠的精液在你的阴茎中膨胀，高高地喷射到空中。一场乳白色的倾盆大雨以浓密的条纹落在她的头部和胸部，给她涂上了一层沉重的、闪闪发光的珍珠般精液面具。它顺着她脸部和乳房的曲线倾泻而下，成团成片地从她身上滴落和滑落。她的每一次呼吸都会导致聚集在她乳沟里的精液湖溢出到地上，你的肉棒早已消失在她那浸透精液的乳沟深处。");
         }
         outputText("[pg]终于从她那狂野的高潮中平静下来，狐妖让你那疲软的阴茎从她的乳房之间垂下，她气喘吁吁地从你身上滚下来，坐在你那筋疲力尽、俯卧的身体旁边。她轻声哼着歌，用她长袍上宽大的布腰带把自己清理干净，然后把注意力转向你。带着一种居高临下的假笑，她把食指放在你的鼻子上，俯身亲吻你的额头，并在你耳边低语了一句听起来很奇怪的胡言乱语。[pg]");
         outputText("在因狐妖的法术而昏迷之前，你看到的最后景象是一片乳白色的肌肤在诱人地摇晃，在一簇尾巴下轻轻颤抖。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function akbalFollowupMansion() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2715,FlagDict_Impl_.arrayReadInt(_loc1_,2715) | get_game().forest.akbalScene.AKBAL_EVENT_KITSUNE2);
         outputText("你禅定的时刻被一声尖叫打破了。你周围的妖狐们立刻警觉起来，就在这时，门被火焰和力量猛地撞开。美洲豹阿克巴尔站在烧焦的木头碎片上。他那翠绿色的眼睛直直地盯着你……看着你赤裸的身体泡在温暖的水池里，几个赤裸的女人正趴在你身上。");
         outputText("[pg]你骄傲的一面无法摆脱给他一个得意冷笑的冲动。也许妖狐们做了什么降低了你的抑制力。幸好，阿克巴尔不是为你而来的。对妖狐们来说幸运的是，他也不是为她们中的任何一个而来的，他转身穿过宅邸离开了。也许这就是他之前审问那个狐狸女孩的原因？不管他在这里找什么，他还在继续寻找。");
         outputText("[pg]黑发妖狐打破了门被毁和与美洲豹短暂相遇后尴尬的沉默。[say: 嗯……我们应该处理一下那个。呃，听着……你现在能……先走吗？]");
         outputText("[pg]金发女孩也插话道，补充说[say: 这需要处理一下，我们下次再和你玩！所以，呃，回见！]");
         outputText("[pg]这群女孩把你拉起来，把你的装备塞进你的怀里，然后引导你出门。你站在那里，赤身裸体，满脸困惑。你对这些事件耸耸肩，穿上你的物品。那么，回营地去吧。");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

