package classes.scenes.npcs
{
   import classes.CoC;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class NephilaCovenScene extends NPCAwareContent
   {
      
      public function NephilaCovenScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winRapeChoices() : void
      {
         var _g1:NephilaCovenFollowerScene;
         var _g:Combat = get_combat();
         var _loc1_:Function = function():void
         {
            _g.cleanupAfterCombat();
         };
         if(!get_game().get_inCombat())
         {
            set_monster(new NephilaCoven());
            _g1 = get_nephilaCovenFollowerScene();
            _loc1_ = function():void
            {
               _g1.nephilaCovenFollowerAppearance();
            };
            get_monster().set_lust(100);
            get_monster().set_HP(2);
            if(get_player().get_lust() < 34)
            {
               get_player().set_lust(34);
            }
         }
         clearOutput();
         if(get_monster().get_HP() < 1 && get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10 && !get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("集会姐妹瘫倒在地，她黏糊糊的肉体因疲惫而下垂。[say:现在怎么办？]她问。[say:你准备好了。如果你愿意，我可以带你去见你的女儿们。我们有那么多奇妙的东西要给你看。]");
         }
         else if(get_monster().get_HP() < 1 && !get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("集会姐妹瘫倒在地，她黏糊糊的肉体因疲惫而下垂。[say:现在怎么办？]她问。[say:你很强，但你还没准备好。我拒绝承认你是我们的蜂后。]");
         }
         else if(get_monster().get_HP() < 1)
         {
            outputText("你的女儿精疲力竭地倒在竞技场中央，粘液从她众多的伤口中滴落。其他粘液女孩向空中抛洒花瓣，庆祝你的胜利，主母对你微笑着。如果你愿意，你可以利用被击败的络新妇为她的姐妹们表演一场秀。[pg]");
         }
         else if(!get_player().hasPerk(PerkLib.NephilaArchQueen) && get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
         {
            outputText("集会姐妹瘫倒在地，伸手去摸她那流着淫液的小穴，用她粗壮的背部触手自慰。[say:现在怎么办？]她在喘息和呻吟中问道。[say:你……<b>哦……</b>你准备好了。如果你愿意，我可以带你去见你的女儿们。我们有那么多奇妙的东西要给你看。]");
         }
         else if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("集会姐妹瘫倒在地，伸手去摸她那流着淫液的小穴，用她粗壮的背部触手自慰。[say:现在怎么办？]她在喘息和呻吟中问道。[say:你……<b>哦……</b>你还没准备好。我拒绝承认你是我们的蜂后。]");
         }
         else
         {
            outputText("你的女儿倒在地上，伸手去摸她那流着淫液的小穴，用她粗壮的背部触手自慰，而其他粘液女孩则向空中抛洒花瓣，并对她发出嘘声。在圆形剧场中央的看台上，主母微笑着俯视着你。如果你愿意，你可以利用被击败的络新妇为她的姐妹们表演一场秀。[pg]");
         }
         menu();
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
         {
            addButtonDisabled(0,"接受提议");
         }
         addButtonDisabled(1,"舔阴");
         addButtonDisabled(2,"子宫吞噬络新妇");
         addButton(1,"舔阴",nephilaCovenCunnilingus);
         if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
            {
               addButton(0,"接受提议",get_nephilaCovenFollowerScene().nephilaCovenAcceptOffer);
            }
            addButton(2,"子宫吞噬络新妇",nephilaCovenUnbirth);
         }
         setSexLeaveButton(_loc1_,"离开",14,2,10);
      }
      
      public function startAFightWithNephilaCoven() : void
      {
         startCombatImmediate(new NephilaCoven());
      }
      
      public function nephilaCovenUnbirthBadEnd() : void
      {
         clearOutput();
         outputText("你惊讶地叫出声来，因为你的孩子们突然比平时更加剧烈地蠕动起来，导致你的肚子在你上方来回颠簸，反复将你撞得喘不过气来。过了一会儿，你的肚子又开始膨胀，越来越大，没有停止的迹象。");
         outputText("[pg]起初，你肚子似乎永无止境的生长让你感到兴奋，你催促它继续。然而，在你已经巨大的肚子的催化下，你吞噬的黏液女孩的魔法影响被证明是无止境的，当肚子顶端的[skinfurscales]因为极度拉伸而开始发痒时，你开始感到担忧。[pg][say: 够了，亲爱的们，]你说，轻轻拍着肚子，紧张地流着汗。[say: 妈妈现在已经吃够了。你们可以停止生长了。][pg]你肚子里蠕动的幼崽唯一的反应是活动增加，因为你的子宫壁被拉紧，触手无法再向外扩张。你的肚子随着压力的增加而震动，因为它继续被越来越多的后代填满，但却无法再长得更大来容纳它们。[pg][say: 哦哦哦……<i>不要这样，</i>]你说。[say: 我们还有那么多事情要做，还要变得更大……][pg]你停止了说话，因为你体内有什么东西伴随着一声清脆的断裂声和一阵灼热的疼痛断裂了。你那塞满黏液的巨大肚子几乎是透明的，它被拉得太薄了，黏液珠正从你的[skinfurscales]中冒出来。你试图呻吟，但从你嘴里出来的只有血液和紫色的软泥。当意识到<i>这顿</i>大餐是你永远不该吞噬的时候，你的视线变黑了。");
         outputText("[pg]当你那爆炸性膨胀的肠胃开始沿着最薄弱的地方凸起，准备进行最后、致命的释放时，你脑海中最后的念头是以前在你的家乡，在那个更天真的时代里的自己，以及对你生命中所有那些毫无意义的牺牲的遗憾之情。");
         outputText("[pg]你的肚子爆炸了，触手和黏液散落了将近一英里。<b>你死了。</b>");
         get_game().gameOver();
      }
      
      public function nephilaCovenUnbirth() : void
      {
         clearOutput();
         outputText("你嘲笑集会姐妹的鲁莽。这个愚蠢的婊子已经");
         if(get_monster().get_HP() < 1)
         {
            outputText("被打败，俯卧");
         }
         else
         {
            outputText("俯卧，自慰");
         }
         outputText("却依然觉得她能对你发号施令。你一脚踢在她的肚子上，把她踹翻在地，然后放出你的子嗣压住她的触手。[pg]");
         outputText("她被踢得闷哼一声，捂着肚子。[say:母亲大人，求求你，]她说道。你把她的头埋进你的[vagina]里，让她闭嘴。[pg]");
         outputText("[say:舔我，]你说道。史莱姆女孩开始在你身上忙活，舔舐并挑逗着你的[clit]。[pg]");
         outputText("[say:就是这样，]你说道。[say:让“母亲大人”舒服舒服。][pg]");
         outputText("史莱姆在你那流着淫液的入口处的努力显得有些不足，所以你把全部重量压在她身上，用你那巨大的触手气球压碎了她那布满触手的黏糊糊的肚子。这把她的头完全塞进了你的体内，几乎把软泥女人的身体压扁在你的重量之下。她在你身下虚弱地挣扎着，她背部的触手在你圆滚滚的肚子上乱抓。[pg]");
         outputText("被压扁的络新妇在你庞大的身躯下扭动，她的头被闷在你的阴道里，这种感觉让你达到了高潮的边缘。你垂涎欲滴，决定品尝一下这异国情调的零食，于是你催促你的孩子们蜂拥而上，将这个史莱姆女孩收集起来，塞进你的子宫里。有那么一瞬间，它们似乎在抗拒你的精神命令——在进食时它们从未这样做过——但随后它们蜂拥而出，将史莱姆和它自己的触手宝宝一个接一个地收集起来，拉进你的体内。[pg]");
         outputText("你的肚子隆起到了一个极其下流的程度，体积翻了一倍多。你向后滚去，揉搓着你能够到的那一点点侧腹，双[legs]交叠摩擦，试图用这种方式取悦自己，因为在这个角度，你根本碰不到你的[vagina]。[say: 就是这样，宝贝们，]你说。[say: 这是迄今为止最美味的一顿。][pg]");
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 19)
         {
            outputText("你惊讶地叫出声来，因为你的孩子们突然比平时更加剧烈地蠕动起来，导致你的肚子在你上方来回颠簸，反复将你撞得喘不过气来。过了一会儿，你的肚子又开始膨胀，变得比刚吃饱时还要大。你的");
            if(get_player().tone >= 60)
            {
               outputText("肌肉发达的");
            }
            else if(get_player().thickness < 50)
            {
               outputText("苗条的");
            }
            else
            {
               outputText("丰满的");
            }
            outputText("身体也明显变得更加丰腴了。你感觉如此饱足，以至于你觉得你的饥饿感好几天都不会再回来了。那个黏液女孩体内的某种东西产生了神奇的效果，让你膨胀起来，并大大增强了你作为体内络新妇触手宿主的适应性。[pg]");
            menu();
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
            var _temp_1:* = get_player();
            _temp_1.thickness = _temp_1.thickness + 4;
            get_player().addStatusValue(StatusEffects.ParasiteNephila,1,1);
            if(get_player().hasStatusEffect(StatusEffects.ParasiteNephilaNeedCum))
            {
               get_player().removeStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 3)
            {
               outputText("你已经成为了这些寄生虫名副其实的育母。你的肚子因为蠕动的幼崽而永久性地肿胀着，让你看起来像是怀了三胞胎即将临盆的孕妇");
               get_player().vaginas[0].vaginalWetness = 5;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 5)
            {
               outputText("你伸出手去拥抱你那巨大的肚子，然后舒服地呻吟起来，因为你意识到你现在已经肿胀得太大了，根本够不到你那敏感的凸肚脐。<b>你现在看起来像个怪物一样大腹便便。你肚子里那群半液态的触手幼崽在你的脑海中低语，让你感觉自己变得更聪明了，但你的行动却因为这沉重的负担而变得迟缓。</b>");
               dynStats(DynStat.Spe(-5),DynStat.Inte(5),DynStat.Sens(2),DynStat.Cor(2));
               get_player().vaginas[0].vaginalWetness = 5;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 10)
            {
               outputText("你试图将饱胀的身体从地上撑起，但你的肚子现在已经肿胀到了惊人的尺寸，甚至能轻松装下以前的你。你发现，无论你在下面怎么挣扎，试图站起来时它都几乎纹丝不动。当你意识到自己有多么无助时，你高潮了，然后向你的“孩子们”呼救，祈求它们能提供任何帮助。寄生的软泥怪从你泛红、喷涌着黏液的阴户中蜂拥而出。它们爬过你肿胀的庞大身躯，摇晃着你的肚子，直到它向前移动，你才能“站起来”。然而，“站起来”这个词并不能准确描述你现在的处境，因为你发现你<i>真的</i>必须用力伸展才能勉强让脚趾碰到地面。当你放弃了恢复正常行走的希望，转而靠在让你无法动弹的球状肚子上时，你的脚趾兴奋地蜷缩起来。这让你的丰满臀部翘到了半空中，你张开双腿，以适应现在不断从你阴道中出生和被吞回子宫的史莱姆。当你的孩子们蜂拥而至时，你对它们发出咕咕的叫声，它们用滋润的黏液覆盖着你紧实肌肤的每一寸，慢慢地拉着你和你美丽的肚子向前移动。你很高兴你的宝宝们在妈妈狩猎时如此努力地帮助她，并决心从现在起更加努力工作，以确保你和它们都能吃饱。以这种体型，你永远无法快速移动，但支撑着你肚子的虫群让你感到受保护和安全；不知为何，你觉得与你的寄生虫之间有一种联系。它们明白它们的生存归功于你，现在你可以在战斗中向它们寻求帮助了！");
               outputText("[pg]获得特质：<b>络新妇女王！</b>");
               get_player().vaginas[0].vaginalLooseness = 5;
               dynStats(DynStat.Spe(15,DynStatOp.Eq),DynStat.Tou(10),DynStat.Inte(5),DynStat.Sens(2),DynStat.Cor(100,DynStatOp.Eq));
               awardAchievement("络新妇女王",290,true,true);
               get_player().createPerk(PerkLib.NephilaQueen,0,0,0,0);
               get_player().vaginas[0].vaginalWetness = 4;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 15)
            {
               outputText("当你意识到自己已经达到了一个里程碑式的尺寸时，你暗自微笑。你的肚子在身体和心灵上都完全让你相形见绌，你发现<b>你曾经怀抱的关于成为勇者的任何愚蠢想法都在迅速消退。</b>");
               get_player().vaginas[0].vaginalLooseness = 5;
               dynStats(DynStat.Spe(15,DynStatOp.Eq),DynStat.Tou(10),DynStat.Inte(5),DynStat.Sens(2),DynStat.Cor(100,DynStatOp.Eq));
               get_player().vaginas[0].vaginalWetness = 4;
            }
            else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 11)
            {
               outputText("<b>无论你在速度上取得了什么进步，都会再次被你那深不可测的“怀孕”肚子的肿胀所抵消。你的心思仍然集中在喂养你的后代上，你那流着黏液的阴户永远张开着，络新妇在里面爬进爬出。</b>");
               get_player().vaginas[0].vaginalLooseness = 5;
               dynStats(DynStat.Spe(-5),DynStat.Inte(5),DynStat.Cor(100,DynStatOp.Eq));
               get_player().vaginas[0].vaginalWetness = 4;
            }
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + (1 + Utils.rand(3));
            removeButton(0);
            removeButton(1);
            removeButton(2);
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            doNext(nephilaCovenUnbirthBadEnd);
         }
      }
      
      public function nephilaCovenRapesYou() : void
      {
         get_player().slimeFeed();
         clearOutput();
         outputText("集会姐妹低下头，失望地叹了口气，因为你");
         if(get_player().get_HP() < 1)
         {
            outputText("瘫倒在地，被击败了。");
         }
         else
         {
            outputText("放弃并开始自慰。");
         }
         if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("[say:我很伤心，母亲大人，]她说。[say:你显然还没准备好。不过……][pg]");
         }
         else
         {
            outputText("[say:<b>哦……</b>太抱歉了，母亲大人，]她说。[say:但往好处想，现在我们可以给观众表演一场<b>秀</b>了。][pg]旁观的络新妇听到她的话，开始疯狂地欢呼，怂恿你的对手。[pg]");
         }
         outputText("黏液女孩向前压来，柔软的身体贴着你，一只手依依不舍地抚摸着你巨大的肚子");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("，还趁机偷偷摸了一把你的" + get_player().allBreastsDescript());
         }
         outputText("。 [say: 我该拿你怎么办呢？离你这么近，让我心烦意乱。][pg]");
         outputText("她按压你的肚子，让你体内膨胀的史莱姆在压力下蠕动起来。[say: 战斗结束后，我的妹妹们也迫不及待了。我知道了！不如我们来个快速探访吧。][pg]");
         outputText("有那么短暂而困惑的一瞬间，你还在想她是什么意思，但紧接着你的双手和[legs]就被她的触手迅速地像绑猪一样捆在了一起。这只络新妇动作快得惊人，在你那被惊呆的大脑还没反应过来之前，她就已经完成了这一切。你完全无力抵抗，她利用你庞大的身躯将你翻转过来，让你那巨大的肚子在你上方晃动，同时她将嘴唇贴上了你的[vagina]。抵抗是徒劳的，你决定不露出一丝恐惧或悔恨，坦然面对即将发生的一切。[pg]");
         outputText("天空被你肚子的阴影遮蔽，女孩舔舐着你甜美的花蜜。你那被体液润滑的阴唇一直张开着，但在她的服侍下，它们张得更大了。你呻吟着，体内的触手向外涌出，抓住了黏液女孩的头。令人惊讶的是，它们似乎只想在她将你推向情欲的狂热巅峰时抚摸她。驱使你孩子们的饥饿感似乎对舔舐你等待着的双唇的黏液毫无兴趣。[pg]");
         outputText("[say: 嗯……] 她说。[say: 这个味道——真让人怀念。] 女孩停止了对你的束缚，将她的触手收回到你孕育之地的远端，然后将头从取悦你的动作中抽离。你沮丧地呻吟着，接着尖叫起来，因为她将背部的触手刺入你的小穴，将其撑开到一个疯狂的程度，以至于尽管你有如此强悍的身体素质，你仍然感到一阵疼痛。黏液挤进你的私处，直到她的头完全进入其中。[pg]");
         outputText("然后，伴随着痛苦的寸寸推进，她将整个肿胀的身体穿过你那饱受蹂躏的爱巢，进入你的子宫，只留下她巨大的触手在外面挥舞。[pg]");
         outputText("你原本就宽大的肚子向外爆炸般膨胀，几乎增大了一倍。你呻吟着、哭喊着，你的" + get_player().skin.skinFurScales() + "因疼痛而悲鸣，随着你的血肉被拉紧，变得几乎透明。[pg]");
         outputText("当你感觉到她在你的子宫里向前移动，导致你体内的其他史莱姆也跟着扭动时，你开始失去意识。你的眼睛瞪得大大的，因为她的头和张开的双臂的轮廓穿透了你肚子的顶部，向你靠近，她透过你几乎破裂的血肉给了你一个吻。[pg]");
         outputText("你所处环境的变态而暴力的性行为让你不堪重负，你晕了过去，倒在她子宫内的怀抱中，同时被假性宫缩的阵痛折磨着。当你醒来时，黏液已经从你的子宫中解脱出来，正在你身边休息，用她的触手在你疼痛的肚子上涂抹着舒缓的黏液。[pg]");
         if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("她低语道：[say: 去狩猎，去成长吧，母亲大人。等你变得更强了再回来。我会一直等你的。]");
         }
         else
         {
            outputText("你的其他女儿们就在附近懒洋洋地休息，见你醒来，她们迅速行动起来，安慰你度过这份失去的悲痛。当你终于恢复到足以返回营地的状态，正拖着你的庞大躯体向宫殿的出口传送门移去时，你隐约听见几名侍女在争论下一个能有幸\"陪母亲大人玩\"的会是谁。");
         }
         dynStats(DynStat.Lust(200));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function nephilaCovenFirstTimeRepeat() : void
      {
         clearOutput();
         outputText("一个白色的、看起来像天使一样的粘液女孩再次出现。她打量着你。[say:你看起来更强了，母亲大人，]她说。[say:向我证明你已经准备好了！][pg]");
         outputText("她展开背部的触手，拖着庞大的身躯向前冲去！");
         startCombat(new NephilaCoven());
      }
      
      public function nephilaCovenFirstTime() : void
      {
         clearOutput();
         outputText("一个面熟的史莱姆女孩出现在你面前。她那苍白的\"皮肤\"、羽毛状的附饰、巨大的背部触手，以及更为惊人的庞大腹部，标志着她是一名\"络新妇\"，与当初引领你走上繁育蜂后之路的那一位同类。她见到你时愣了一下，显然在打量你那超度膨胀的身躯，随后向你款款走来。[say: 是你，]她说。[say: 母亲大人。][pg]");
         outputText("她渗出粘液拥抱你，将她巨大的腹部挤压在你的腹部上，然后向前翻滚，用她黏糊糊的手掌捧起你的头，看着你的眼睛。[pg]");
         outputText("[say:不，]她说。[say:你可能是母亲大人，但你还没准备好。向我展示你的力量——否则我们永远不会接受你作为我们的蜂后！][pg]");
         outputText("络新妇发动了攻击！");
         unlockCodexEntry(2924);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2920,1);
         startCombat(new NephilaCoven());
      }
      
      public function nephilaCovenCunnilingus() : void
      {
         get_player().slimeFeed();
         clearOutput();
         if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("你嘲笑集会姐妹的鲁莽。这个愚蠢的婊子已经");
         }
         else
         {
            outputText("你向欢呼的人群挥手，然后大摇大摆地走向被击败的黏液女孩。她");
         }
         if(get_monster().get_HP() < 1)
         {
            outputText("被打败，俯卧");
         }
         else
         {
            outputText("俯卧，自慰");
         }
         if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("却依然觉得她能对你发号施令。你一脚踢在她的肚子上，把她踹翻在地，然后放出你的子嗣压住她的触手。[pg]");
         }
         else
         {
            outputText("趴在竞技场的地面上，一滩紫色软泥怪从她黏腻的小穴中渗出，蔓延在地下竞技场引进的泥土上。你将支配性的[foot]踩上她颤抖的肚子，轻轻下压直到她发出一声清晰可闻的\"呼——\"，随后收回你的触手。[pg]");
         }
         outputText("她呻吟着，捂住自己的肚子。[say: 母亲大人，求你了，] 她说。你让你的孩子们去操她的脸，以此来让她闭嘴。触手从你的[vagina]里爬出来，蜂拥到她的脸上，塞满她的嘴，直到她作呕，触手还在她的嘴唇间诱人地扭动着。[pg]");
         outputText("你咧嘴一笑，将[armor]从臀部褪下，抚摸着你肿胀的阴蒂");
         outputText("[say:你说什么，婊子？]你问道。[say:我听不见。大声点！][pg]");
         if(!get_player().hasPerk(PerkLib.NephilaArchQueen))
         {
            outputText("当你对她说着下流话时，这只发情的软泥怪嘴里塞满了触手，发出呻吟声。[pg]");
         }
         outputText("你在蠕动的轿子上向前滚动，然后将你的小穴对准受害者嘴里鼓出的扭动触手。集会姐妹的喉咙向外膨胀，以容纳粗壮的触手。[say: 来吧，]你说。[say: 让你这张嘴发挥点更好的作用。]\"[pg]");
         outputText("你微微降低胯部，让触手可以把玩你的[vagina]。它们挥舞着，挑逗着你爱穴的入口，困惑了片刻，然后猛地刺入你的体内，让你发出欢愉的叫声。[pg]");
         outputText("你向下瘫倒，将黏液女孩那不成形的脸埋在你的臀瓣之间，并在她身上摩擦，让她窒息。[pg]");
         outputText("你在她身上摩擦，晃动着你的");
         if(get_player().biggestTitSize() > 1)
         {
            outputText("淫荡的 " + get_player().allBreastsDescript() + "，用你的双手，");
         }
         else
         {
            outputText("身体");
         }
         outputText("上下起伏，同时你骑着你粗壮的触手宝宝们，任由它们蹂躏黏液女孩的脸。[pg]");
         outputText("当你终于达到高潮并向前滚动放开她时，史莱姆已经失去了意识。你决定暂时离开她，继续狩猎。");
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(3),DynStat.Sens(3),DynStat.Cor(1));
      }
      
      public function encounterNephilaCoven() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2920) == 0)
         {
            nephilaCovenFirstTime();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2920) == 1)
         {
            nephilaCovenFirstTimeRepeat();
            return;
         }
      }
   }
}

