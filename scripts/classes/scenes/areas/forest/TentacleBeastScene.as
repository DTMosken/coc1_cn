package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.forest._TentacleBeastScene.SaveContent;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs.pregnancies.PlayerTentacleBeastPregnancy;
   import flash.Boot;
   
   public class TentacleBeastScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function TentacleBeastScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "tentaclebeast";
         saveContent = new SaveContent(null);
         super();
         new PlayerTentacleBeastPregnancy(param1);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function tentacularGenderGooTimes() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         get_images().showImage("tentaclebeast-sad-monster");
         outputText("突然，触手从灌木丛中抽打出来抓住你。不过，它们移动得太快了，设法将你的体壁挤压在一起，以至于你几乎被挤成了两半。[pg]");
         outputText("[say: 操。操。操。操。] 一个奇怪的人类声音在大声咒骂。[say: 你死了吗？][pg]");
         outputText("你回答说你没死，只是现在大部分变成了液体，没什么实体。[pg]");
         outputText("[say: 嗯哼……是吗？好吧，只要你还有点实在的下流部位，我就很开心了。][pg]");
         outputText("一阵尴尬的沉默。[pg]");
         outputText("[say: 你什么都没长，对吧？][pg]");
         outputText("你摇了摇头。[pg]");
         outputText("[say: 哎，操。] 一根触手戳了戳你，你猜这野兽正一边轻笑一边看着你晃动。[say: 也许这还不算完全浪费。我想知道，你尝起来是什么味道？][pg]");
         outputText("其中一根较大的触手伸出来，吸附在你的底部，它那类似肛门的开口轻轻吸吮着你粘稠的身体。接下来有那么短暂的一刻，你对眼前的处境并不感到害怕，反而自己也有些好奇你尝起来是什么味道。[pg]");
         outputText("[say: 操！] 那个声音再次传来。[say: 你是酸苹果味的！我他妈最讨厌酸苹果味了！][pg]");
         outputText("它猛地挥下触手，残暴的一击将你打晕了过去。");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function tentacleVictoryRape() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
         {
            get_images().showImage("tentaclebeast-win-male");
            outputText("抓住机会，你趁怪物停下时冲向它。你抓住你能找到的最粗的中空触手，干脆利落地一脚把野兽踹倒在地。你用一只脚踩住这只生物，拿着那根中空的触手，将它对准你那怒挺的勃起。[pg]");
            outputText("[say: 你想要鸡巴奶吗，你这怪物？！]你得意洋洋地咆哮道。[say: 给你！][pg]");
            outputText("你将触手套在你的阴茎上，开始疯狂地挺动，把这只生物的附肢当成了你个人的飞机杯。这只生物疯狂地扭动着，试图逃脱你被欲望驱使的力量。你用空闲的脚迅速踢了它一下作为回应，这只生物逃跑的决心动摇了。[pg]");
            outputText("[say: 别他妈乱动了，乖乖吃药！]你怒吼着，顺势又给了野兽一记阴招。[pg]");
            outputText("感觉到高潮即将来临，你任由肌肉有节奏地收缩，像攻击堡垒的榴弹炮一样将精液倾泻进这只生物体内。伴随着每一次射精，你像个疯子一样大笑，看着你的精液溢出，而这只生物则在努力吸收你的“捐赠”。[pg]");
            outputText("拔出你的肉棒，你把野兽扔到一边，既觉得好笑又心满意足地走开了。野兽虚弱地跌跌撞撞地退回它来时的树林，显然在这场遭遇战中吃了大亏。");
         }
         else
         {
            get_player().slimeFeed();
            get_images().showImage("tentaclebeast-win-female");
            if(get_player().cor >= 66)
            {
               outputText("抓住机会，你趁怪物停下时冲向它。你抓住你能找到的最粗的阳具状触手，干脆利落地一脚把野兽踹倒在地。你用一只脚踩住这只生物，拿着那根触手肉棒，将它对准你那湿漉漉的小穴。[pg]");
               outputText("你像个真正的疯子一样大笑着，把触手塞进了你的子宫里。");
               get_player().cuntChange(20,true,true,false);
               outputText("你的阴道肌肉迅速开始工作，抚摸、挤压、揉捏着这根附肢。这只怪物比起操弄你的小穴，更想逃跑，于是开始挣扎。你像个职业拳击手一样，毫不犹豫地狠狠揍了它一顿，制止了它的挣扎。[pg]");
               outputText("[say:别挣扎了，快操我的小穴！]你尖叫道。[pg]");
               outputText("怪物射精的感觉立刻引起了你的注意。当你的子宫被它温暖的精液填满时，一个残忍的想法占据了你的脑海。这只怪物在你打它之后做出了反应。你像恶魔一样坏笑着，把怪物当成了沙袋。你每打一下，怪物就会在你的身体深处喷射出一股粘液。喷射的纯粹力量让你的小穴陷入了狂喜的癫狂。当你高潮时，你再次猛击怪物，迫使另一股精液冲刷你的女性私处。就这样过了一个小时，你达到了多重高潮的顶峰并释放了出来。当你把软绵绵的触手从身体里拔出来时，怪物虚弱地抽搐着。多余的精液像打翻的水桶一样流了出来，弄得一团糟。你心满意足地离开了。目前还不清楚这只触手怪物是否在你的欲望中存活了下来……但谁在乎呢。反正你只在乎自己的满足感。");
            }
            else
            {
               outputText("抓住机会，你趁怪物停下时冲向它。你抓住你能找到的最粗的阳具触手，毫不犹豫地把怪物推倒在地。你用身体的重量压住怪物，拿着那根触手肉棒，把它对准你湿漉漉的小穴。[pg]");
               outputText("你坐在怪物身上，开始把触手当成活体假阳具来用。你的重量压在它上面，怪物无法移动或挣扎，尽管它根本没有尝试这样做。你把触手越推越深，直到你感觉到它抵住了你的子宫颈。");
               get_player().cuntChange(20,true,true,false);
               outputText("[pg]感觉到你的需求，被驯服的怪物从主触手上伸出一根细须，轻松地穿过你的子宫颈口，进入了你子宫的最深处。触须穿过你的子宫，尽可能深地扎根。怪物开始快速地震动和起伏它的器官，刺激你私处的最深处。[pg]");
               outputText("你很快就达到了让小穴痉挛的高潮，这迫使怪物在你体内卸下了一股滚烫、充满麝香味的液体。当怪物本能地将它精囊里的所有东西……或者不管它把精液储存在哪里……喷射到你体内时，你感到腹胀和充实。你快速地挤压了一下，开始排出触手，这促使怪物收回它的触须并离开你的身体。你心满意足地离开了，而那只怪物已经筋疲力尽，无法动弹。");
            }
            get_player().knockUp(39,120);
         }
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function tentacleRapeContinuationForFemales() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         get_images().showImage("tentaclebeast-loss-female-third-part");
         if(int(get_player().vaginas.length) == 1)
         {
            outputText("心满意足后，这只生物利索地把你扔下，从你身上抽出肢体，笨重地走开了。你浑身沾满精液，看到你的阴蒂已经肿胀到了");
            if(get_player().hasPerk(PerkLib.BigClit) && get_player().getClitLength() > 2 || get_player().getClitLength() > 3)
            {
               outputText("将近" + Utils.num2Text(Math.floor(get_player().getClitLength() * 1.75)) + "英寸长。");
            }
            else
            {
               outputText("将近四英寸长。你浑身青紫，酸痛不已，昏了过去");
            }
         }
         else
         {
            outputText("心满意足后，这只生物利索地把你扔下，从你身上抽出肢体，笨重地走开了。你浑身沾满精液，看到你的" + int(get_player().vaginas.length) + "个阴蒂已经肿胀到了将近四英寸长。你浑身青紫，酸痛不已，昏了过去，");
         }
         if(get_player().cor < 75)
         {
            outputText("你沉醉在情欲中，无暇为自己受到的侵犯而愤怒。");
         }
         else
         {
            outputText("你沉醉在情欲中，无法继续享受快感。");
         }
         if(get_player().getClitLength() < 7 && get_player().getClitLength() >= 3.5 && get_player().hasPerk(PerkLib.BigClit))
         {
            get_player().changeClitLength(0.1 + get_player().cor / 100);
            outputText("你巨大的阴蒂最终缩小了，但保留了很大一部分昔日的荣光。现在它在勃起时有" + int(get_player().getClitLength() * 10) / 10 + "英寸长，");
            if(get_player().getClitLength() < 5)
            {
               outputText("就像一根小肉棒。");
            }
            if(get_player().getClitLength() >= 5 && get_player().getClitLength() < 7)
            {
               outputText("就像一根光滑跳动的肉棒。");
            }
            if(get_player().getClitLength() >= 7)
            {
               outputText("就像一根又大又粗的肉棒。");
            }
         }
         else if(get_player().getClitLength() < 3.5)
         {
            outputText("过了一会儿，你的阴蒂恢复到了比较正常的大小，但还是比原来大了一点。");
            get_player().changeClitLength(0.2);
         }
         else
         {
            outputText("过了一会儿，它恢复到了正常的大小，失去了所有多余的体积。");
         }
         if(get_player().vaginas[0].vaginalLooseness == 0)
         {
            get_player().vaginas[0].vaginalLooseness = 1;
         }
         get_player().slimeFeed();
         get_player().knockUp(39,120);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function tentacleRapeContinuation() : void
      {
         dynStats(DynStat.Tou(1),DynStat.Inte(-0.5),DynStat.Lib(2),DynStat.Sens(1),DynStat.Cor(0.5));
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         if(get_player().get_gender() == 1)
         {
            get_images().showImage("tentaclebeast-loss-male-sec-part");
            outputText("接着，你感到一阵恶心的感觉，另一根触手挤过你的肛门，进入你的直肠。当异物在你的体内深入几英寸时，你因为沮丧和愤怒而哭泣，而不是因为疼痛。伴随着狂暴而协调的节奏，怪物开始让插入你屁股的触手膨胀，并");
            if(get_player().cockTotal() == 1)
            {
               outputText("用吸吮和抽插的动作对付你无助的[cocks]。屁股里触手的膨胀压迫着你的前列腺，带来一种矛盾的快感和痛苦。你惊恐地意识到，这只野兽正在榨取你的精液！");
            }
            else
            {
               outputText("用吸吮和抽插的动作对付你的[cocks]。屁股里触手的膨胀压迫着你的前列腺，带来一种矛盾的快感和痛苦。你惊恐地意识到，这只野兽正在榨取你的精液！");
            }
            get_player().buttChange(50,true);
            outputText("[pg]在这种粗暴而原始的刺激带来的快感中，你无助且不知所措，你所能做的就是给这只生物它想要的；你滚烫的精液。你的身体只对来自你的");
            if(get_player().cockTotal() == 1)
            {
               outputText("[cocks]和屁股的感觉做出反应，在很短的时间内，你的阴茎爆发了，将一股又一股滚烫浓稠的精液射入这个恐怖的生物体内。随着怪物的每一次抽插，你的臀部和骨盆都会剧烈地挺动，因为它熟练地抚弄你的[cocks]并榨取你前列腺的体液。你伴随着每一次高潮哭泣，促使这东西更用力地榨取你。在经历了仿佛永恒的连续射精后，这个生物收回了它邪恶的手臂，把你留在了地上，变成了一堆伤痕累累、被过度操弄的肉块，就像人们饭后扔掉的玉米棒一样被丢弃。");
            }
            else
            {
               outputText("[cocks]和屁股的感觉做出反应，在很短的时间内，你的阴茎爆发了，将一股又一股滚烫浓稠的精液射入这个恐怖的生物体内。随着怪物的每一次抽插，你的臀部和骨盆都会剧烈地挺动，因为它熟练地抚弄你的[cocks]并榨取你前列腺的体液。你伴随着每一次高潮哭泣，促使这东西更用力地榨取你。在经历了仿佛永恒的连续射精后，这个生物收回了它邪恶的手臂，把你留在了地上，变成了一堆伤痕累累、被过度操弄的肉块，就像人们饭后扔掉的玉米棒一样被丢弃。");
            }
            if(Utils.rand(2) == 0)
            {
               get_player().orgasm("Anal");
            }
            else
            {
               get_player().orgasm("Dick");
            }
         }
         else
         {
            if(get_player().get_gender() == 2)
            {
               get_images().showImage("tentaclebeast-loss-female-sec-part");
               outputText("野兽直起身子，露出一张像喙一样的巨口。它张开巨大的下颚，露出");
               if(int(get_player().vaginas.length) == 1)
               {
                  outputText("一条形状像巨大肉棒的舌头，就像其他触手一样，立刻寻找你毫无防备的小穴。它嘲弄地在你的阴唇周围戳刺，而你试图收缩以防止它侵犯你，剥夺你仅存的尊严。这个生物弯曲它的附肢，轻松地强行进入你的阴道");
               }
               else
               {
                  outputText(int(get_player().vaginas.length) + " 条形状像大鸡巴的舌头，像其他触手一样，寻找着你毫无防备的小穴。当你试图收缩阴唇以防止它们侵犯你，剥夺你仅存的尊严时，它在你的阴唇周围嘲弄地戳刺着。这怪物弯曲着它的附肢，轻松地强行进入你的" + get_player().vaginaDescript(0) + "s");
               }
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("");
               }
               outputText("。当你惊恐地叫喊时，另一个肉棒状的附肢强行进入你的喉咙。野兽小心翼翼地防止你被它的肢体噎住。");
               outputText("[pg]以一种只能表明更高智商的协调性，怪物操着你的" + get_player().vaginaDescript(0));
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("");
               }
               outputText("和嘴巴，开始榨取你肿胀的乳房，并吸吮你跳动的");
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("阴蒂。");
               }
               else
               {
                  outputText("阴蒂。");
               }
               get_player().cuntChange(get_player().vaginalCapacity() * 0.76,true);
               outputText("当快感从胯部一直冲击到头部时，你的身体背叛了你的抵抗。过了一段时间，你开始配合着生物的抽插挺动臀部，沉醉在快感中。当你达到高潮的顶峰时，你感觉到这个生物在你的子宫里插到了底。滚烫的精液如海洋般淹没了你的" + get_player().vaginaDescript(0));
               if(int(get_player().vaginas.length) > 1)
               {
                  outputText("");
               }
               outputText("和嘴里。你正被这头怪物内射，但你已经不在乎了。这种交媾的感觉太棒了。滚烫、带着麝香的液体涌入你的嘴里。这种味道击溃了你最后的一丝抵抗，你还需要更多，不只是吞咽，还要用你的子宫去吞噬。你设法挣脱了一只手，却只是为了抓住嘴里的触手，好让更多的精液进入你的体内。你感觉到你的胃因为贪婪地吞下的精液而膨胀起来。野兽注入的精液超出了你的承受能力，多余的液体从你不堪重负的孔洞中流出，将你从头到脚浸泡在它的体液中。");
               doNext(tentacleRapeContinuationForFemales);
               get_player().slimeFeed();
               get_player().boostLactation(0.3);
               if(Utils.rand(2) == 0)
               {
                  get_player().orgasm("Anal");
               }
               else
               {
                  get_player().orgasm("Vaginal");
               }
               return;
            }
            if(get_player().get_gender() == 3)
            {
               get_images().showImage("tentaclebeast-loss-herm-sec-part");
               if(get_player().cockTotal() == 1)
               {
                  outputText("一阵猛烈的拉扯告诉你，这只生物已经把它的触手吸附在了你的" + get_player().cockDescript(0) + "上。你看到" + get_player().totalBreasts() + "根较小的触手吸住了你挺立的乳头。当这只生物在你的乳晕周围形成完美的密封时，你感觉到乳汁开始渗出。一根粗壮的、阳具状的触手在你被困住的[cock]下方探索，直到它找到了你的阴道口。当这根触手冲破你的阴道口并在你的子宫里探底时，你大叫起来。触手膨胀起来，直到它完全填满了你的" + get_player().vaginaDescript(0) + "。");
                  get_player().cuntChange(get_player().vaginalCapacity() * 0.76,true,false,true);
                  outputText("这只野兽以一种怪异的协调性，一边吸吮着你的" + get_player().cockDescript(0) + "和乳房，一边猛烈地抽插着你的" + get_player().vaginaDescript(0) + "。压倒性的快感流遍你的全身，引发了立即的高潮，将大量的精液射入吸附在你" + get_player().cockDescript(0) + "周围的触手中。你的体液进入这只生物体内的感觉促使它更用力地吸吮你的[cock]，并更快地抽插你的" + get_player().vaginaDescript(0) + "，导致了一连串的高潮。[pg]");
                  outputText("沉醉在快感中，你陶醉于射精到这只生物体内的感觉，同时它还在吸吮你的乳房。你所能做的就是沉溺于这种从头到脚被榨取的感觉中。这只生物开始更快地抽插你的小穴，你感觉它要用它的阳具触手把你刺穿了。[pg]");
                  outputText("这只生物榨乳的触手停止了移动，你感觉到那根肉棒触手猛烈地压在你的子宫上。你感觉到滚烫的液体以雷霆万钧之势射入你的体内，这只生物在你体内反复射精，引发了又一次高潮。这只生物一阵阵地射精，在你体内反复喷射。片刻之后，多余的精液从你的" + get_player().vaginaDescript(0) + "中喷涌而出，因为它再也装不下了，但这只生物还在继续射精。[pg]");
                  outputText("过了一会儿，这只生物从你身上抽出了它的触手。它把触手肉棒悬在你的脸上，射出了最后一发，用滚烫、浓稠的精液覆盖了你的脸。你条件反射地张开嘴，让大量的咸味汁液顺着喉咙流下。发泄完后，这只生物蹒跚离去，留下你被彻底榨干，浑身沾满精液。");
               }
               else
               {
                  outputText("一阵猛烈的拉扯告诉你，这只生物已经把它的触手吸附在了你的[cocks]上。你看到" + get_player().totalBreasts() + "根较小的触手吸住了你挺立的乳头。当这只生物在你的乳晕周围形成完美的密封时，你感觉到乳汁开始渗出。一根粗壮的、阳具状的触手在你被困住的肉棒下方探索，直到它找到了你的阴道口。当这根触手冲破你的阴道口并在你的子宫里探底时，你大叫起来。触手膨胀起来，直到它完全填满了你的" + get_player().vaginaDescript(0) + "。");
                  get_player().cuntChange(get_player().vaginalCapacity() * 0.76,true,true,false);
                  outputText("这只野兽以一种怪异的协调性，一边吸吮着你的[cocks]和乳房，一边猛烈地抽插着你的" + get_player().vaginaDescript(0) + "。压倒性的快感流遍你的全身，引发了立即的高潮，将大量的精液射入吸附在你肉棒周围的触手中。你的体液进入这只生物体内的感觉促使它更用力地吸吮你跳动的肉棒，并更快地抽插你的" + get_player().vaginaDescript(0) + "，导致了一连串的高潮。[pg]");
                  outputText("沉醉在快感中，你陶醉于射精到这只生物体内的感觉，同时它还在吸吮你的乳房。你所能做的就是沉溺于这种从头到脚被榨取的感觉中。这只生物开始更快地抽插你的小穴，你感觉它要用它的阳具触手把你刺穿了。[pg]");
                  outputText("这只生物榨乳的触手停止了移动，你感觉到那根肉棒触手猛烈地压在你的子宫上。你感觉到滚烫的液体以雷霆万钧之势射入你的体内，这只生物在你体内反复射精，引发了又一次高潮。这只生物一阵阵地射精，在你体内反复喷射。片刻之后，多余的精液从你的" + get_player().vaginaDescript(0) + "中喷涌而出，因为它再也装不下了，但这只生物还在继续射精。[pg]");
                  outputText("过了一会儿，这只生物从你身上抽出了它的触手。它把触手肉棒悬在你的脸上，射出了最后一发，用滚烫、浓稠的精液覆盖了你的脸。你条件反射地张开嘴，让大量的咸味汁液顺着喉咙流下。发泄完后，这只生物蹒跚离去，留下你被彻底榨干，浑身沾满精液。");
               }
               get_player().knockUp(39,120);
               get_player().slimeFeed();
               get_player().boostLactation(0.3);
               get_player().orgasm("Vaginal");
               get_player().orgasm("Tits",false);
            }
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function tentacleLossRape() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as StatusEffect;
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         _temp_1.timesLost += 1;
         if(get_player().get_gender() == 0)
         {
            if(get_player().isTaur())
            {
               centaurGenderlessRetardation();
               return;
            }
            if(get_player().isNaga())
            {
               genderlessHilarityForNagaKenDolls();
               return;
            }
            if(get_player().isGoo())
            {
               tentacularGenderGooTimes();
               return;
            }
            get_images().showImage("tentaclebeast-sad-monster");
            if(get_player().cor < 75)
            {
               outputText("尽管你试图抵抗这个怪物，但它那原始的肌肉力量实在太强大了。");
            }
            outputText("它轻松地把你按在地上。你感觉到黏糊糊的触手在你的腹股沟上下游走，这怪物似乎在寻找它期望你拥有的性腺。当它意识到你既没有阴茎也没有阴道时，它立刻把你扔到地上，显然感到非常厌恶。");
            outputText("[pg][say: 这他妈的是什么鬼东西？！！]怪物用一种令人不安的人类声音说道。你完全懵了，只能震惊地坐在那里。[pg]");
            outputText("[say: 你的下体在哪，该死！]怪物咆哮道。[say: 我们触手怪需要进食！][pg]");
            outputText("你怯生生地表示自己是无性别的，没有生殖器。");
            outputText("[pg][say: 你他妈在逗我吧！！]怪物轻蔑地咆哮着。[say: 在我伏击的所有混蛋里，偏偏遇到了唯一一个我没法吸食的废物！我现在该怎么办，混蛋？！我得吃东西！]");
            outputText("[pg]你一时语塞，怯生生地向怪物递上一些你的食物。怪物一巴掌把食物从你手里打飞，差点弄断你的手腕。");
            outputText("[pg][say: 我吃不了那种垃圾！]怪物咆哮道。[say: 我看起来像是有他妈的嘴来嚼那玩意儿吗？！不！！！我靠吸食鸡巴和迷途女人的汁液为生！扶他的精液和奶水！你什么都没有！！！]");
            outputText("[pg]野兽结结实实地拍了一下你的屁股，似乎在催你走。[say: 给我滚出去！]它尖叫着。[say: 滚开，这样我才能去猎一顿真正的美餐！！！]");
            outputText("你离开了那个怪物，它也躲回了灌木丛中。跋涉了一段路后，你开始怀疑刚才发生的一切是否真的发生过……");
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
            return;
         }
         if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0 && get_player().cocks[0].cockLength > 15 && get_player().cocks[0].cockThickness >= 3)
         {
            if(get_player().cor < 75 && get_player().get_lust() < get_player().maxLust())
            {
               outputText("它在你逃跑之前抓住了你！[pg]当你试图抵抗这个怪物时，它原始的肌肉力量太强大了。");
            }
            outputText("它轻松地把你按在地上。你立刻感到鸡巴根部传来一阵可怕的剧痛。你低头一看，发现一根长满刺的触手末端刺穿了你的骨盆区域。当你感觉到怪物向你体内注射某种液体时，火烧般的疼痛流遍你的静脉。随着疼痛的灼烧，你那巨大的马鸡巴立刻完全勃起，先列腺液从你的龟头冠状沟处肆意流出。[pg]");
            outputText("你看到一根巨大的中空触手试图套住你坚挺的鸡巴。令你惊讶且让怪物沮丧的是，它勉强张开的宽度只够覆盖你那惊人肉棒的顶端。怪物盲目地继续试图包裹你的阴茎。它只成功地让一阵阵快感顺着你的肉棒传导，鸡巴顶端的撞击感直达根部。[pg]");
            outputText("你既觉得好笑又感到兴奋，决定在这怪物不断试图吸吮你的马屌时，假装顺从以麻痹它。每一波快感都让你的肉棒上下跳动");
            if(get_player().balls > 0)
            {
               outputText("，你感觉到你那[ballsfull]随着肌肉的收缩而起伏，将新生成的精液推送到准备释放的位置");
            }
            outputText("。[pg]");
            get_images().showImage("tentaclebeast-loss-horse");
            outputText("你沉浸在快感的余韵中，而那怪物还在你的肉棒周围笨拙地摸索，完全没意识到你实在太大了。一个邪恶的念头闪过你的脑海。既然这东西这么想要你，为什么不成全它呢？由于你的马类特征，你的力量大增，这出乎了怪物的意料。你猛地挣脱了它的束缚，一把抓住那根试图包裹你阴茎的触手。伴随着猛烈的挺动和推挤，你强行将肉棒塞进触手，将其撑得极大。怪物发出一声非人的嚎叫，痛苦地回应着你突如其来的狂热。[pg]");
            outputText("你开始像疯了一样抽插挺动，努力让自己达到高潮。怪物试图抽身，却发现自己才是无法逃脱的那一个。感觉到你的");
            if(get_player().balls > 0)
            {
               outputText("睾丸");
            }
            else
            {
               outputText("肉棒");
            }
            outputText("升起，你尽可能深地挺进，然后开始将一股巨大、稳定的精液流喷射进怪物里面。在接下来的几分钟里，你不断地将自己排空到这头野兽体内，而它则在四处扑腾，试图逃跑。几分钟后，怪物挣扎得更加厉害，你感觉到自己阴茎前端周围有自己精液的湿热感。精液开始从触手中大量漏出。");
            if(get_player().balls > 0)
            {
               outputText("你的睾丸把怪物灌满了！[pg]");
            }
            else
            {
               outputText("你的精液把怪物灌满了！[pg]");
            }
            outputText("怪物最后一次猛烈的抽搐挣脱了你的控制，它把自己从你的肉棒上拔了出来，多余的精液四处溢出，在它扑腾的时候飞溅在空中。显然，这头野兽已经被压垮了，它笨拙地蹒跚着退回灌木丛中。你暗自发笑，因为你让这怪物尝到了自作自受的滋味，它试图压制你的努力完全适得其反。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Str(0.5),DynStat.Spe(-0.5),DynStat.Inte(-1),DynStat.Lib(5),DynStat.Sens(1),DynStat.Cor(1));
            get_monster().set_HP(0);
            if(get_player().get_HP() == 0)
            {
               _loc1_ = get_player();
               _loc1_.set_HP(_loc1_.get_HP() + 1);
            }
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
            return;
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            _loc2_ = get_player().statusEffectByType(StatusEffects.TentacleBadEndCounter);
            if(_loc2_ == null)
            {
               get_player().createStatusEffect(StatusEffects.TentacleBadEndCounter,0,0,0,0);
            }
            else
            {
               _loc2_.value1 += 1;
               if(_loc2_.value1 >= 3 && get_player().cor > 50 && get_player().get_gender() == 3)
               {
                  futaTentacleBadEnd();
                  return;
               }
            }
         }
         else if(get_player().isTaur())
         {
            outputText("还没等你阻止，触手就缠住了你的腿。它们继续在你的腿上盘绕，一股令人不适的温热感传遍了你的半马之躯。另一根触手缠住了你的躯干，散发着同样的温热感，让你的大脑变得模糊。你抓住一根能够够到的触手，试图把它从你身上扯下来，但两根更细、半透明的触须固定住了你的手臂，把它们拉到了你的脑后。[pg]");
            get_player().slimeFeed();
            outputText("它们在你的身上滑行，试探着你的身体。一根小触手顺着你的嘴钻了进去，缠绕着你的舌头，顺着喉咙往下。它很小心，没有让你窒息，似乎对你的内脏和你的外壳一样好奇。不过你没多少时间思考，因为一股液体被注入了你的胃里，让你射精的欲望更加强烈。缠绕着你的尖刺也起着类似的作用，无论它们接触到你[skin]的哪里，都会散发出温热感。[pg]");
            if(get_player().hasCock())
            {
               if(get_player().cockArea(get_player().smallestCockIndex()) <= 50)
               {
                  outputText("更多的催情毒素注入你的体内，导致[eachcock]膨胀起来。");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("怪物一开始似乎很惊讶能发现这么大的一对肉棒，它试探着它们的质地，并分别缠绕在每一根上。你的[cocks]通过扭动来回应，诱惑着野兽继续探索，但这个举动是徒劳的，它们被抛弃了，不过并没有持续太久。");
                  }
                  outputText("[pg]");
                  outputText("一种奇特的感觉席卷而来，一根看不见的触手吞没了你，起伏着挤奶般套弄你的[cock]。你的身体本能地试图挺进，但触手不够强壮，无法提供阻力。你狂野的抽插导致它在你的下腹部上下撞击，这是一种令人惊讶的愉悦感。触手没有理会，继续在你周围起伏和收缩；伴随着先列腺液被吸出的感觉，还发出了一阵吸吮声。[pg]");
               }
               else
               {
                  outputText("更多的催情毒素注入你的体内，导致[eachcock]膨胀起来。有什么东西撞上了龟头，但似乎无法包裹住你的[cock]。它继续尝试了一会儿，一阵阵快感顺着肉棒传下来。触手最终放弃了，吸附在龟头上，正好位于你尿道的开口处。它吸吮着你滴落的先列腺液，伴随着响亮的吸吮声。");
                  if(get_player().balls > 0)
                  {
                     outputText("吸吮感一直延伸到你的[balls]，这是一种极其奇特的感觉，但感觉却棒极了。");
                  }
                  outputText("[pg]");
               }
            }
            get_images().showImage("tentaclebeast-loss-taur");
            if(get_player().hasVagina())
            {
               outputText("一根蠕动的触手强行钻进你的" + get_player().vaginaDescript(0) + "，起伏蠕动着，越钻越深。你的身体通过分泌更多的淫液来回应，让这怪物的进入变得更加容易。");
               get_player().cuntChange(32,true,true,false);
               if(get_player().hasCock())
               {
                  if(get_player().cockArea(get_player().smallestCockIndex()) <= 50)
                  {
                     outputText("尽管你的身体力量很大，但你的抽插似乎并没有影响怪物继续努力。");
                  }
               }
               outputText("你感觉到这头野兽顶到了你的子宫，你舒服地叫出声来，扭动着身体，液体在你身后喷洒。[pg]");
            }
            if(get_player().biggestTitSize() >= 1 && get_player().lactationQ() <= 0)
            {
               outputText("游走的触手吸附在你的" + get_player().allBreastsDescript() + "上；微小的尖刺刺入每一个[nipple]，注入某种滚烫的液体。");
               if(get_player().totalBreasts() == 2)
               {
                  outputText("类似肛门一样的尖端吸附在它们上面。");
               }
               else
               {
                  outputText("类似肛门一样的尖端吸附在一对乳房上，同时出现更多的尖端来吸附其他的。");
               }
               outputText("你感觉到一股液体从体内涌出，半透明的触手变成了纯白色。它们注入的液体让你开始泌乳！它们不停地吸吮着你，没过多久，你的乳头就因为过度使用而隐隐作痛，乳房也被完全吸干了。[pg]");
               get_player().boostLactation(1.5);
            }
            if(get_player().ass.analLooseness >= 4)
            {
               outputText("你的[asshole]对这团蠕动的肉块来说是个诱人的目标，它很快就抓住了机会。一根特别粗大的触手滑入深处，以一种连你训练有素的后穴都未曾体验过的方式翻滚着。");
               if(get_player().hasCock())
               {
                  outputText("一连串起伏的肿块滑过你的前列腺，挤出了一股先列腺液。");
               }
               outputText("你对这头野兽惊人的技巧表示赞赏，对着嘴里的触手呻吟着。[pg]");
            }
            if(get_player().biggestTitSize() >= 1 && get_player().lactationQ() > 0 && get_player().lactationQ() < 1000)
            {
               outputText("游走的触手吸附在你的" + get_player().allBreastsDescript() + "上，微小的尖刺刺入你的[nipples]，注入某种滚烫的液体。随着你感觉到乳汁分泌增加，体内的压力变得几乎无法忍受。让你松了一口气的是，一个类似肛门一样的尖端吸附在每个乳头上。它们不停地吸吮着你，没过多久，你的乳头就因为过度使用而隐隐作痛，乳房也被完全吸干了。[pg]");
               get_player().boostLactation(1);
            }
            else if(get_player().biggestTitSize() >= 1 && get_player().lactationQ() >= 1000)
            {
               outputText("游走的触手吸附在你的" + get_player().allBreastsDescript() + "上，微小的尖刺刺入你的[nipple]，注入某种滚烫的液体。随着你感觉到乳汁分泌增加，体内的压力变得几乎无法忍受。让你松了一口气的是，一个类似肛门一样的尖端吸附在每个乳头上。它们不停地吸吮着你，没过多久，你的乳头就因为过度使用而隐隐作痛，但你的乳房仍然准备提供更多的乳汁！随着面前的野兽被灌满，吸力减弱，最终它被迫放弃了。[pg]");
               if(get_player().hasCock())
               {
                  outputText("你的[cock]在生物体内爆发，");
                  if(get_player().cumQ() <= 500)
                  {
                     outputText("将这只生物推向了它容纳液体的极限。");
                  }
                  else
                  {
                     outputText("迅速灌满了吸附在上面的触手；它从你身上爆开，让你的精液从你和退却的野兽身上喷洒而出。");
                  }
               }
               outputText("抓住你的触手松开了，到处漏着液体。你高兴地狠狠踩了其中一根较大的触手一脚，作为不要惹你的警告。");
               get_player().orgasm("Tits");
               dynStats(DynStat.Tou(0.5),DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
               get_player().boostLactation(0.5);
               get_monster().set_HP(0);
               if(get_player().get_HP() == 0)
               {
                  _loc1_ = get_player();
                  _loc1_.set_HP(_loc1_.get_HP() + 1);
               }
               if(get_game().get_inCombat())
               {
                  get_combat().cleanupAfterCombat();
               }
               else
               {
                  doNext(get_camp().returnToCampUseOneHour);
               }
               return;
            }
            if(get_player().hasCock())
            {
               var _temp_2:* = get_player();
               _temp_2.cumMultiplier = _temp_2.cumMultiplier + 0.5;
               outputText("随着你的[cock]开始肿胀，这只生物的欲望很快得到了满足。");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]紧紧贴着你，准备迎接不可避免的释放，准备将它们滚烫的精液喷射到野兽体内。");
               }
               outputText("当一阵强烈的快感涌遍全身时，你直起身子；你那马一般的力量成功地压制住了按住你前腿的触手，在极短的时间内将你的精液释放到触手的吸盘中，你感觉到它被迅速吸出并向下流向那团蠕动的肉块。[pg]");
            }
            if(get_player().hasVagina())
            {
               outputText("当你高潮时，你的" + get_player().vaginaDescript(0) + "在盘绕的入侵者周围泛起涟漪；淫液顺着触手滴落，让周围充满了你麝香般的气味。当一阵强烈的快感涌遍全身时，你直起身子，在极短的时间内成功地压制住了按住你前腿的触手。但即使你的前腿自由了，你" + get_player().vaginaDescript(0) + "里的触手依然存在，伴随着一波波的精液在体内喷射出大量滚烫的液滴。淹没你爱之通道的粘稠物质将你推向了边缘，你再次高潮，一边舒服地叫出声来一边喷洒出更多的液体。[pg]");
            }
            if(get_player().hasCock() && get_player().cumQ() < 1500 && get_player().ass.analLooseness < 4)
            {
               outputText("就在你以为一切都结束的时候，另一根触手猛地插入你的[asshole]，开始粗暴地按摩你的前列腺，同时它急剧膨胀，导致你再次喷出一股精液，然后是另一股，又一股。");
               get_player().buttChange(40,true,true,false);
               outputText("它继续侵犯你的屁股，直到你精疲力竭地晕过去，你释放的精液数量已经数不清了。");
               get_player().orgasm("Anal");
               dynStats(DynStat.Tou(1),DynStat.Inte(-0.5),DynStat.Lib(2),DynStat.Sens(1),DynStat.Cor(0.5));
               if(get_game().get_inCombat())
               {
                  get_combat().cleanupAfterCombat();
               }
               else
               {
                  doNext(get_camp().returnToCampUseTwoHours);
               }
               return;
            }
            if(get_player().hasCock() && get_player().cumQ() < 1500 && get_player().ass.analLooseness >= 0)
            {
               outputText("正当你以为一切都结束时，你[asshole]里的触手开始急剧膨胀，导致你又喷出了一股精液，接着又是一股，又是一股。它继续侵犯着你的屁股，直到你精疲力竭地昏死过去，你释放的精液数量已经数不清了。");
               get_player().orgasm("Anal");
               dynStats(DynStat.Tou(1),DynStat.Inte(-0.5),DynStat.Lib(2),DynStat.Sens(1),DynStat.Cor(0.5));
               if(get_game().get_inCombat())
               {
                  get_combat().cleanupAfterCombat();
               }
               else
               {
                  doNext(get_camp().returnToCampUseTwoHours);
               }
               return;
            }
            if(get_player().hasVagina())
            {
               outputText("正当你以为一切都结束时，一根触手猛地插进你的[asshole]，并开始急剧膨胀，导致你又喷出了一股淫液，接着又是一股，又是一股。");
               get_player().buttChange(40,true,true,false);
               outputText("它继续侵犯着你的屁股，直到你精疲力竭地昏死过去，你高潮的次数已经数不清了。");
               get_player().orgasm("Anal");
               dynStats(DynStat.Tou(1),DynStat.Inte(-0.5),DynStat.Lib(2),DynStat.Sens(1),DynStat.Cor(0.5));
               if(get_game().get_inCombat())
               {
                  get_combat().cleanupAfterCombat();
               }
               else
               {
                  doNext(get_camp().returnToCampUseTwoHours);
               }
               return;
            }
            if(get_player().hasCock())
            {
               outputText("你继续向怪物注入越来越多的精液，直到令你惊讶的是，精液淹没了怪物，并汹涌地倒流出来，覆盖了你的");
               if(get_player().balls > 0)
               {
                  outputText("[sack]和");
               }
               outputText("后腿。当怪物试图拉开距离时，你笨拙地向前迈了一步，前腿仍然抬起，继续将你大量的精液直接喷射到它的主体上。它在你身下扭动，无能为力，因为它那湿透的、沉甸甸的触手现在根本无法与你的力量抗衡。[pg]");
               outputText("最终你");
               if(get_player().balls > 0)
               {
                  outputText("的[balls]");
               }
               outputText("空了，你转过身准备离开，并迅速踢了那团沾满精液的肉块一脚，以彰显你的优越感。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Tou(0.5),DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
               get_monster().set_HP(0);
               if(get_player().get_HP() == 0)
               {
                  _loc1_ = get_player();
                  _loc1_.set_HP(_loc1_.get_HP() + 1);
               }
               if(get_game().get_inCombat())
               {
                  get_combat().cleanupAfterCombat();
               }
               else
               {
                  doNext(get_camp().returnToCampUseOneHour);
               }
               return;
            }
            get_player().orgasm("Generic");
            dynStats(DynStat.Tou(1),DynStat.Inte(-0.5),DynStat.Lib(2),DynStat.Sens(1),DynStat.Cor(0.5));
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseTwoHours);
            }
            return;
         }
         if(get_player().biggestLactation() >= 3.5 && get_player().get_gender() > 0)
         {
            get_player().slimeFeed();
            outputText("还没等你反应过来，怪物已经用一根长而强健的触须缠住了你的每条腿。第三根触须迅速绕过你的腰部。你立刻感受到了怪物的力量，当它收紧抓握时，你痛得倒吸一口凉气。紧缩的疼痛之后是一种刺痛，几乎是灼烧的感觉，你很快意识到这意味着怪物给你注射了某种毒素。一股温暖的感觉涌遍全身，你猛然意识到这种毒素实际上是一种催情剂。[pg]");
            dynStats(DynStat.Lib(2));
            outputText("随着药物迅速在你体内蔓延，你感到头晕目眩。你的");
            if(get_player().get_gender() == 1)
            {
               outputText(get_player().multiCockDescriptLight());
               if(get_player().cockTotal() > 1)
               {
                  outputText("开始");
               }
               else
               {
                  outputText("开始");
               }
            }
            else if(get_player().cockTotal() > 0)
            {
               outputText(get_player().vaginaDescript(0) + "和[cocks]");
               outputText("开始");
            }
            else
            {
               outputText(get_player().vaginaDescript(0));
               outputText("开始");
            }
            outputText("急促地跳动。你几乎没有察觉到怪物的靠近；强壮的触手将你轻轻地，几乎是温柔地放倒，而你被药物蒙蔽的大脑试图数清它们的数量。它们移动得太快，不可能准确计数，但你可以看出有两种。较粗、较强壮的触手覆盖着大小不一的圆顶状突起，每个末端都有一个非常像肛门的褶皱。较小的触手光滑且半透明，允许一些光线穿过。它们的末端也有一个紧致的、像肛门一样的孔洞。[pg]");
            outputText("当你的" + get_player().allBreastsDescript() + "迅速被较小的触手包围并猥亵时，你浑身颤抖。你肿胀的乳房隐隐作痛，因为触手将它们的孔洞附着在你渗出乳汁的乳头上。触手开始了一种独特的挤奶模式，交替着先挤哪个乳头；你愉悦地呻吟着，看着你的乳汁穿过触手干，流向那只蹒跚怪物的身体。[pg]");
            if(get_player().get_gender() == 2)
            {
               if(get_player().vaginalCapacity() < 30)
               {
                  outputText("这只野兽察觉到了你的兴奋，以惊人的速度用一根粗大、布满疙瘩的触手迅速刺穿了你的" + get_player().vaginaDescript(0) + "。当你感觉到每一寸凹凸不平的触手都在猛烈地撞击你，你的小穴被撑大到难以置信的程度时，你痛苦又愉悦地尖叫起来。触手很快就在你浅浅的洞里探到底了，紧紧压在你的子宫颈上，开始有节奏地猛烈抽插你的" + get_player().vaginaDescript(0) + "。[pg]");
               }
               else
               {
                  outputText("这只野兽察觉到了你的兴奋，以惊人的速度用一根粗大、布满疙瘩的触手迅速刺穿了你的" + get_player().vaginaDescript(0) + "。当野兽那布满疙瘩的肉棒轻松滑入时，你像个荡妇一样呻吟着，每一个凸起都让你的脊背发凉，直到它最终在你的小穴深处探到底，急切地压在你的子宫颈上。怪物开始尽情地猛烈抽插你的" + get_player().vaginaDescript(0) + "，空气中充满了淫荡的黏腻水声。[pg]");
               }
               get_player().cuntChange(20,true);
               outputText("[pg]");
            }
            if(get_player().get_gender() == 3)
            {
               if(get_player().vaginalCapacity() < 30)
               {
                  outputText("这只野兽察觉到了你的兴奋，以惊人的速度用一根粗大、布满疙瘩的触手迅速刺穿了你的" + get_player().vaginaDescript(0) + "。你兴奋又痛苦地哀嚎着，但还没等你消化这种侵犯，另一根触手就刺穿了你的" + get_player().cockDescript(0) + "。那个像肛门一样的开口张开包裹住你，慢慢吞噬你的肉棒。这种双重攻击让你的身体发狂，你开始迎合入侵者，将你的[cock]更深地插入它紧致的肉洞中。[pg]");
               }
               else
               {
                  outputText("这只野兽察觉到了你的兴奋，以惊人的速度用一根粗大、布满疙瘩的触手迅速刺穿了你的" + get_player().vaginaDescript(0) + "，但还没等你消化这种侵犯，另一根触手就刺穿了你的" + get_player().cockDescript(0) + "，那个像肛门一样的开口张开包裹住你。这种双重攻击让你的身体发狂，你开始迎合入侵者，将你的[cock]更深地插入它紧致的肉洞中。[pg]");
               }
               get_player().cuntChange(20,true);
               outputText("[pg]");
            }
            outputText("你慢慢意识到野兽已经放缓了对你生殖器的攻击，很快就完全停止了，并完全抽离。野兽发出一声清晰的咕噜声，当你感觉到触手加倍攻击你的" + get_player().nippleDescript(0) + "时，你笑了。野兽用它强壮的触手慢慢将你从地上举起，悬在离地大约三英尺的地方，然后将你翻转过来。你悬在半空中，你的" + get_player().allBreastsDescript() + "在身下淫荡地摇晃着。突然，随着对你疼痛的[nipples]的攻击继续，你感到一种想要[say: 哞哞叫]的冲动。触手继续攻击了似乎好几个小时，但随后你逐渐感觉到触手开始放缓。另一声咕噜声证实了你的怀疑——野兽想要你的奶水，但很明显你提供的太多了！当野兽的触手开始下垂时，你邪恶地咧嘴一笑，迅速伸手去抚摸和按摩你的[breasts]。这种刺激导致更多的奶水顺着触手流下。在几分钟的加强攻击后，野兽呻吟着释放了你，触手从你的乳头上发出清晰的“啵”声，在释放你时将你的奶水喷洒得到处都是。[pg]");
            if(get_player().get_gender() >= 2)
            {
               outputText("你的" + get_player().allBreastsDescript() + "很痛，但你可以立刻看出它们还没有被吸干。当触手试图撤退时，更多的奶水滴落下来，你咧嘴一笑，对野兽的攻击感到很不满足。你伸手到大腿间，抓住最近的那根布满疙瘩的触手。野兽已经吃饱了，当你开始用这根活体假阳具猛烈抽插你的" + get_player().vaginaDescript(0) + "时，它没有提供任何抵抗。反客为主强暴野兽的想法驱使你达到新的高潮，你很快就在那根布满疙瘩的肉棒周围高潮了，你的小穴痉挛着，用力地榨取着那根凹凸不平的触手。当你用完触手后，野兽发出了最后一声咕噜声，退回了森林。");
            }
            else
            {
               outputText("当触手试图撤退时，你感觉到你的[nipples]滴下奶水。你意识到野兽根本没有把你吸干，当你" + get_player().cockDescript(0) + "强有力地跳动时，你急切地咧嘴一笑。你向后伸手抓住最近的那根布满疙瘩的触手，当你把你的" + get_player().cockDescript(0) + "塞进紧致、起皱的孔口时，野兽没有提供任何抵抗。你愉悦地呻吟着，当你疯狂地操弄那个紧致的洞时，你开心地咕哝着。反客为主强暴野兽的想法让你更接近高潮；很快你就把所有的肉棒都埋进了这个紧致的性爱工具里，把大量的精液射进了触手里。你滚烫的精液涌入野兽体内，当你把野兽填得更满时，你能感觉到触手在抗议中跳动和扭动。在你的[cock]滑出后，野兽发出了最后一声失败的咕噜声，滑进了森林。");
            }
            get_player().orgasm("Tits");
            dynStats(DynStat.Tou(0.5),DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Lib(1),DynStat.Sens(1),DynStat.Cor(1));
            get_player().boostLactation(0.5);
            get_monster().set_HP(0);
            if(get_player().get_HP() == 0)
            {
               _loc1_ = get_player();
               _loc1_.set_HP(_loc1_.get_HP() + 1);
            }
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
            return;
         }
         if(get_player().hasVirginVagina())
         {
            outputText("你被野兽压制得无法继续前进，于是你准备撤退；然而，触手怪迅速将它的卷须缠绕在你的[legs]上，伴随着令人头晕目眩的沉闷撞击声，你被摔倒在地。当它把你拖过泥土时，你本能地恐惧地尖叫起来。");
            outputText("[pg]几根触手像蛇一样[if (!isnaked) {钻进你的[armor]，迅速解开它并拉扯着脱掉你的衣服|沿着你的身体}]游走。那天然光滑黏腻的肉体摩擦着你，感觉很奇特，又有一种令人不适的愉悦感。你挣扎着反抗袭击者，却只惹得它把你猛摔在地上，让你头晕目眩。");
            outputText("[pg]一根长着长刺的触手出现在你的视野中，引起了你内心深处的恐慌。野兽仔细瞄准，将刺扎进你[vagina]上方的[skinfurscales]几英寸深，紧接着一股暖流涌来。当你的脸因兴奋而泛红时，[if (singleleg) {你的[leg]在试图稳住它的触手下焦急地颤抖着|本能让你的双腿焦急地并拢，但触手缠绕着它们，并继续在膝盖处将它们拉开}]。恐惧和欲望交织在一起，让你浑身发抖。");
            outputText("[pg]没有任何进一步的警告，一根阳具状的卷须猛烈地撞击你的小穴，只停顿了片刻，它的力量和冲力就撕裂了你的处女膜，深深地插入你的体内。你本能地退缩了一下，但剧烈的疼痛被你下体的燥热所掩盖。入侵的附肢抽出了，你无助地痛苦哀鸣，但当它更用力地插回来时，你却发出了一声沉重的呻吟。即使你尖叫哭泣，那根湿润带血的触手也拒绝减速。");
            get_player().cuntChange(get_player().vaginalCapacity() * 0.76,true,true,false);
            outputText("[pg]当你喘着粗气张开嘴时，野兽向你释放了另一根阳具状的卷须，直捣你的喉咙。你呻吟着，被这根肉质的口塞噎住了，它撑开了你的食道，像操另一个小穴一样虐待它。触手不同步的抽插刺激太强烈了，你无法有意识地跟上，无数的信号淹没了你的大脑。");
            outputText("[pg]触手怪发出奇怪的野兽般的嚎叫，伴随着卷须厚度的惊人增长，它向你注入了大量的精液。一次又一次的射精让你的胃和子宫都胀满了，你的肚子微微隆起。眩晕感袭来；你很快就晕了过去。");
            get_player().slimeFeed();
            get_player().orgasm("Vaginal");
            get_player().knockUp(39,120);
            dynStats(DynStat.Tou(1),DynStat.Inte(-0.5),DynStat.Lib(2),DynStat.Sens(1),DynStat.Cor(1));
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseTwoHours);
            }
            return;
         }
         if(get_player().get_gender() == 1)
         {
            get_images().showImage("tentaclebeast-loss-male");
            dynStats(DynStat.Str(-1),DynStat.Inte(-1),DynStat.Lib(5),DynStat.Sens(2),DynStat.Lust(25),DynStat.Cor(1));
            if(get_player().cor < 75)
            {
               outputText("它在你逃跑之前抓住了你！[pg]当你试图抵抗这个怪物时，它原始的肌肉力量太强大了。");
            }
            outputText("它轻松地把你按在地上。你立刻感觉到一阵剧烈、可怕的疼痛");
            if(get_player().cockTotal() > 1)
            {
               outputText("在你的[cocks]根部。");
            }
            outputText("你低头看到一根带刺的卷须末端刺穿了你的骨盆区域。当你感觉到怪物向你注射某种液体时，火烧般的疼痛流遍你的静脉。当疼痛灼烧着你时，");
            if(get_player().cockTotal() == 1)
            {
               outputText("你的肉棒立刻完全勃起，先列腺液从你的顶端大量漏出。");
            }
            else
            {
               outputText("你的肉棒立刻完全勃起，先列腺液从顶端滴落。");
            }
            outputText("[pg]意识到即将发生的事情，你试图挣扎。野兽的反应是把你猛摔在地上几次，把你打晕了。");
            if(get_player().cockTotal() == 1)
            {
               outputText("在你晕眩之中，你看到一根巨大的中空触手悬停在你那怒胀的肉棒上方。你震惊地尖叫抗议，但你的呼喊无人理会。触手降临在你那渴望释放的阴茎上，紧紧夹住你的耻骨丘，将你的阴茎完全包裹起来。");
            }
            else
            {
               outputText("在你晕眩之中，你看到" + get_player().cockTotal() + "根巨大的中空触手悬停在你那怒胀的肉棒上方。你震惊地尖叫抗议，但你的呼喊无人理会。触手降临在你那渴望释放的[cocks]上，紧紧夹住你的耻骨丘，将你的阴茎完全包裹起来。");
            }
         }
         if(get_player().get_gender() == 2)
         {
            get_player().slimeFeed();
            get_images().showImage("tentaclebeast-loss-female");
            dynStats(DynStat.Spe(-1),DynStat.Inte(-1),DynStat.Lib(5),DynStat.Sens(3),DynStat.Lust(20),DynStat.Cor(1));
            if(get_player().cor < 75)
            {
               outputText("它在你逃跑之前抓住了你！[pg]尽管你奋力挣扎，但这野兽的原始力量远非你所能匹敌。");
            }
            outputText("触手从那团肉块中爆出，绑住了你的手臂、双腿和腰部。");
            if(get_player().cor < 75)
            {
               outputText("你挣扎着想要挣脱，但这怪物只是把你勒得更紧，确保你无法动弹。");
            }
            outputText("绑住你双腿的触手猛地一拉，让你在这恐怖怪物的巨口前呈大字型张开。");
            if(get_player().cor < 75)
            {
               outputText("出于对生命的恐惧，你尖叫着挣扎求救，但回应你的只有大自然冷漠的声音。");
            }
            outputText("[pg]" + Utils.Num2Text(get_player().totalBreasts() + 1) + "根长满尖刺的触须出现，刺穿了你的乳房和腹股沟。一阵剧痛和灼烧感撕裂了你，盖过了之前的快感。你感觉到有液体被注入体内，一种独特的、令人痛苦的折磨流入你的血管。你的乳房和");
            if(int(get_player().vaginas.length) == 1)
            {
               outputText("阴蒂");
            }
            else
            {
               outputText("阴蒂");
            }
            outputText("发热并开始肿胀。你乳房里的压力令人发狂，令你震惊的是，你感觉到自己正在漏奶。");
         }
         if(get_player().get_gender() == 3)
         {
            get_player().slimeFeed();
            get_images().showImage("tentaclebeast-loss-herm");
            dynStats(DynStat.Spe(-1),DynStat.Inte(-1),DynStat.Lib(5),DynStat.Sens(4),DynStat.Lust(35),DynStat.Cor(2));
            if(get_player().cor < 75)
            {
               outputText("尽管你试图抵抗这个怪物，但它那原始的肌肉力量实在太强大了。");
            }
            outputText("它轻易地把你按在地上。你立刻感觉到你的");
            if(get_player().cockTotal() > 1)
            {
               outputText("肉棒");
            }
            else
            {
               outputText(get_player().cockDescript(0));
            }
            outputText("根部传来一阵可怕的剧痛。你低头一看，发现一根长满尖刺的触须末端刺入了你的骨盆区域。当你感觉到这怪物向你注射某种液体时，火烧般的疼痛流遍你的血管。随着疼痛灼烧你的全身，你的");
            if(get_player().cockTotal() > 1)
            {
               outputText("[cocks]立刻完全勃起，先列腺液从顶端大量漏出。");
            }
            else
            {
               outputText("肉棒立刻完全勃起，先列腺液从顶端大量漏出。");
            }
            outputText("" + Utils.Num2Text(get_player().totalNipples()) + "根长满尖刺的触手刺穿了你的乳头，你感觉就像有人把酸液射进了你的乳房，它们立刻开始肿胀起来。");
            get_player().growTits(1,int(get_player().breastRows.length),false,2);
            outputText("[pg]意识到即将发生什么，你试图挣扎。野兽的反应是把你狠狠地摔在地上几次，把你摔晕了。在你晕眩之中，你看到一根巨大的中空触手悬停在你那");
            if(get_player().cockTotal() > 1)
            {
               outputText("狂怒的肉棒。");
            }
            else
            {
               outputText("狂怒的肉棒。");
            }
            outputText("你惊恐地尖叫抗议，但你的呼喊完全被无视了。触手降临在你的");
            if(get_player().cockTotal() > 1)
            {
               outputText("[cocks]上，现在正乞求着释放，并紧紧夹住你的耻骨丘，完全包裹住你的阴茎。");
            }
            else
            {
               outputText("[cock]上，现在正乞求着释放，并紧紧夹住你的耻骨丘，完全包裹住你的阴茎。");
            }
         }
         doNext(tentacleRapeContinuation);
      }
      
      public function startTentacleBeastCombat() : void
      {
         startCombatImmediate(new TentacleBeast());
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.timesLost = 0;
      }
      
      public function pumpkinBirth() : void
      {
         clearOutput();
         outputText("你的腹部突然一阵痉挛，疼得你蜷缩起来。你俯下身子趴在地上，握紧双拳，试图忍受这种极度的不适。");
         outputText("[pg]你感觉到体内的肿块在移动，尽管很痛，但你的肌肉似乎在自行运动，将体内的东西向外推。");
         outputText("[pg]在疼痛中，你注意到有什么东西正从你的[vagina]里滴落。那是一种黏糊糊的黑色粘液，它的气味像锤子一样击中你，让你迅速变得头晕目眩、浑身放松。你向后倒去，张着嘴，疼痛让你麻木，你的[vagina]因变态的欲望而阵阵发麻。");
         outputText("[pg]你很快就忘记了你正试图排出的物体，");
         if(!get_player().isTaur())
         {
            outputText("慵懒地将手伸向小穴，屈服于你的欲望。你惊讶地发现那个大肿块已经出来了三分之一，" + (get_player().vaginas[0].vaginalLooseness < 4 ? "将你的肉壁和阴唇撑到了极限" : "对你已经大张的阴道没造成什么影响") + "。[pg]你开始揉捏你的[clit]，从种子上刮下一些黑色粘液，涂抹在你的阴蒂上。它淫靡地充血肿胀，神经因快感而燃烧。你一边呻吟一边在空中挺动臀部，将更多的粘液喷洒在身体上，它触碰到的每一个地方都变得和你的阴蒂一样敏感，同时那个物体被慢慢推了出来。");
         }
         else
         {
            outputText("你除了抚摸自己什么也做不了，根本够不到你那燃烧着的小穴。你感觉到那个大肿块开始离开你的肉壁，" + (get_player().vaginas[0].vaginalLooseness < 3 ? "将你的肉壁和阴唇撑到了极限" : "对你已经大张的阴道没造成什么影响") + "。");
            outputText("[pg]你因渴求而颤抖，小穴紧紧夹住那个肿块，试图从这个奇怪的物体中汲取尽可能多的快感。更多的黑色粘液蔓延到你的阴唇周围，使它们淫靡地充血肿胀，神经因快感而燃烧。你一边呻吟一边狂野地摇晃着后臀，单凭收缩的力量就将那个物体慢慢推了出来。");
         }
         outputText("[pg]那个物体从你的小穴里滑了出来，你高潮了，因那奇怪的黑色物质带来的淫靡快感而颤抖不已。");
         get_player().orgasm("Vaginal");
         outputText("[pg]你沉浸在高潮后的余韵中几分钟，然后才起身检查那个刚刚离开你身体的物体。令人惊讶的是，那是一颗大得离谱的南瓜籽！");
         outputText("[pg]你挠了挠头，想知道这到底是怎么回事。刚才到底是什么东西操了你？");
         if(get_player().hips.rating < 10)
         {
            var _temp_1:* = get_player().hips;
            _temp_1.rating = _temp_1.rating + 1;
            outputText("[pg]生完孩子后，你的[armor]在[hips]处显得更紧了些。");
         }
         get_player().knockUpForce();
         outputText("[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,800,1);
         get_inventory().takeItem(get_consumables().P_SEED,playerMenu);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_debugName() : String
      {
         return "触手怪";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function genderlessHilarityForNagaKenDolls() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         get_images().showImage("tentaclebeast-sad-monster");
         outputText("不知从哪里冒出来的触手绑住了你的手臂和尾巴，在几秒钟内将你牢牢固定。你挣扎着想要挣脱，但在你目前的状态下，面对抓住你的野兽的力量，你无能为力。更多的附肢开始在你的身体周围挑逗，似乎在寻找什么。有几根测试了你[asshole]的入口，但显然那不是它们想要的。[pg]");
         outputText("一个奇怪的人类声音从灌木丛中传来，让你措手不及。[say: 听着，我对此真的很抱歉，但我真的不太熟悉，呃，不管你是什么。你把那些下流的部位藏在哪了？][pg]");
         outputText("这个问题让你有点震惊，你告诉那个声音你没有任何[say: 下流的部位。][pg]");
         outputText("[say: 抱歉，也许我只是问得不好。嗯，你把你的阴茎……们和/或阴道……们藏在哪了。] 这些话后面跟着长时间的嘶嘶声，这可能代表也可能不代表通常试图通过添加新后缀将一种语言转换为另一种语言的尝试。[pg]");
         outputText("感觉到这是一个摆脱困境的机会，你用自己的一系列嘶嘶声和手势作为回应，仿佛在说你不知道这只野兽想要什么。它叹了口气作为回应，你从它的抓握中被释放，有点狼狈地摔在地上。[pg]");
         outputText("[say: 该死的游客。] 它用触手狠狠地砸下来，把你打晕了。");
         get_player().takeDamage(15);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function futaTentacleEpilogue() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2065) > 0)
         {
            outputText("[say:哎呀，哎呀，哎呀。看来你还没完全废掉嘛。]一个尖锐的男性声音说道。[pg]");
            outputText("虽然你脑子里的迷雾还没有完全散去，但你认出这个声音是那个声名狼藉的商人，贾科莫。[pg]");
            outputText("[say:幸好我今天刚好在外面闲逛。]贾科莫说道。[say:我当时正在测试一种要卖的新武器，刚好看到了一只那种恶心的触手怪。我根本不知道它们会捕获猎物！见鬼，你肯定在那个东西里面待了几个月来喂它！][pg]");
            outputText("你试图说点什么，却发现自己无法说话。你感觉到男人骨瘦如柴的手把你抱起来，放在感觉像是他的手推车里。[pg]");
            outputText("[say:好吧，我也不能一直是个彻头彻尾的混蛋。]贾科莫得意地笑道。[say:我想我可以把你放在我经过的下一个村庄，让你恢复一下。我真是太好了！更棒的是！我还是免费做这件事的！][pg]");
            outputText("贾科莫为自己廉价的人道主义暗自发笑。你的一部分在害怕接下来会发生什么，因为这个商人从来没有让你觉得值得信任。然而，大约一天后，他信守诺言，把你留在了他经过的第一个城镇的诊所里。你的康复花了大半年的时间。治疗师和药剂师清除了你所有的腐化，除了你的跨性别状态。然而，你身体承受的巨大压力实际上结束了你的冒险生活，你只好认命，安定下来，过着相对平凡的生活，偶尔会有对你的生殖器感到好奇的村民来和你幽会，打破这种平静。");
         }
         else
         {
            outputText("[say: [he]能活下来吗？]一个温柔的女性声音说道。[pg]");
            outputText("[say: 是的，医生。[He]能活下来。]一个粗犷且明显是男性的声音回答道。[pg]");
            outputText("[say: 那只野兽死了吗？]医生问道。[pg]");
            outputText("[say: 死得透透的了，女士。]男人回答道。[pg]");
            outputText("[say: 我们不能把这个可怜的" + get_player().mf("男人","女人") + "就这样留在野外。把" + get_player().mf("他","她") + "抬上马车。我们要带[him]回村里。我确信我能帮这个[manboy]康复。]医生平静地说道。[pg]");
            outputText("强壮有力的男性双手轻松地抬起你萎缩的身体，将你放在一块木板上。你感觉到马车的颠簸，这种移动冲击着你迟钝的感官。过了一会儿，你注意到马车停了下来，似乎到达了目的地。嘈杂的声音此起彼伏，你感觉到有五六个人把你搬进了一个只能是诊所的地方。在你接受检查并被涂抹各种药物时，许多声音在你耳边不断交谈。一两天后，你的视力恢复了，发现自己身处一家医院，正是医护人员的辛勤努力让你重获新生。[pg]");
            outputText("你的康复花了大半年的时间。治疗师和药剂师清除了你身上所有的腐化，除了你跨性别的状态。然而，身体承受的巨大压力实际上已经终结了你的冒险生涯，你只好认命，安顿下来过上相对平凡的生活，偶尔会有对你生殖器感到好奇的村民来找你幽会，打破这种平静，而你也非常乐意向他们展示。");
         }
         get_game().gameOver();
      }
      
      public function futaTentacleBadEnd() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         outputText("在旅途中多次被触手怪蹂躏后，你屈服于又一次被迫享受的野蛮折磨。然而，怪物张开大嘴向前扑来。你完全惊呆了，还没来得及反应，怪物的触手就抓住了你，把你整个吞了下去！[pg]");
         outputText("当怪物闭上喙，把你困在里面时，最后的一丝光线也消失了。一想到要被活生生地吃掉，你就在极度的恐慌中开始挥舞手臂和挣扎。当你挣扎时，无数的触手缠绕在你的手臂和腿上，基本上把你绑在了怪物体内。一根粗壮的触手强行塞进你的嘴里，你感觉到熟悉的咸味欲望被排空到你的嘴里。你的[cock]立刻勃起，触发了一根触手将你的阴茎完全包裹起来。与此同时，另一根触手深深地埋进了你的屁股里。[pg]");
         get_images().showImage("badend-tentaclebeast");
         outputText("然后，怪物开始以前所未有的猛烈程度榨取你的肉棒。你感觉你的阴茎都要从胯部被扯下来了，你立刻达到了高潮，把一波又一波的精液倾泻到这个怪物身上。你的射精只会让怪物更用力地榨取你，引发了几乎持续不断的高潮循环。过了一会儿，震惊和痛苦消退了，你完全沉醉在不断产生的精液流的感觉中。[pg]");
         outputText("在你最后清醒的时刻，你意识到你并没有被吃掉，也没有受到任何实质性的伤害。怪物已经把你当成了活生生的食物生产者。只要你健康并且还在射精，它就有它想要的所有食物……只要你的性腺还能撑得住。[pg]");
         outputText("你晕了过去，只是短暂地醒来，感觉到精液不断地从你的身体里流出。如果不是触手强行喂你，你会在持续高潮的感觉中虚弱地发出愉悦的呻吟。你无数次地在清醒和昏迷之间徘徊。当你清醒时，你只能享受你还在射精的事实。[pg]");
         outputText("然而，你有一次清醒过来，注意到你不再射精了。事实上，你感觉到全身都有一种刺痛的温暖。尽管你闭着眼睛，刺眼的光线还是穿透了你。你还注意到嘴里和屁股里的触手都不见了。你也听到了声音，但你听不清他们在说什么。一股刺鼻的酸味侵入你的鼻孔，让你完全清醒过来。你感到非常虚弱，光线仍然让你无法睁开眼睛。然而，在很大程度上，你是清醒的，并且意识到了你周围的环境。");
         doNext(futaTentacleEpilogue);
      }
      
      public function encounter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         if(get_player().get_gender() == 0 && Utils.rand(3) == 0 && !get_player().hasTailInsteadOfLegs() && !get_player().isTaur() && !get_player().isGoo())
         {
            get_images().showImage("tentaclebeast-sad-monster");
            outputText("你看到一个巨大的、蹒跚前行的身影从灌木丛中出现。虽然乍一看像是一大团灌木，但它挪动着球状的身躯，露出了一堆长满刺的卷须和头足类动物般的肢体。感觉到你的存在，它全速向你笨重地冲来，触手伸得笔直。[pg]");
            if(get_player().cor > 50 && get_player().cor <= 75)
            {
               outputText("你还在权衡从这种生物面前逃跑的利弊，却发现现在逃跑已经太迟了。");
            }
            if(get_player().cor > 75)
            {
               outputText("你微笑着大步向前，迎接你期望从这种怪物身上得到的快感。");
            }
            if(get_player().cor < 75)
            {
               outputText("尽管你试图抵抗这个怪物，但它那原始的肌肉力量实在太强大了。");
            }
            outputText("它轻松地把你按在地上。你感觉到黏糊糊的触手在你的腹股沟上下游走，这怪物似乎在寻找它期望你拥有的性腺。当它意识到你既没有阴茎也没有阴道时，它立刻把你扔到地上，显然感到非常厌恶。");
            outputText("[pg][say: 这他妈的是什么鬼东西？！！] 怪物用一种令人不安的人类声音说道。[pg]");
            outputText("你完全懵了，只能震惊地坐在那里。");
            outputText("[pg][say: 你的下体呢，该死！] 怪物咆哮道。[say: 我们触手生物需要进食！][pg]");
            outputText("你怯生生地表示自己是无性别的，没有生殖器。");
            outputText("[pg][say: 你他妈在逗我吧！！]怪物轻蔑地咆哮着。[say: 在我伏击的所有混蛋里，偏偏遇到了唯一一个我没法吸食的废物！我现在该怎么办，混蛋？！我得吃东西！]");
            outputText("你一时语塞，怯生生地向这只生物递上你为旅途准备的一些食物。怪物一巴掌把食物从你手里打飞，差点把你的手腕打折。");
            outputText("[pg][say: 我吃不了那种狗屎！]这头怪物咆哮着。[say: 我看起来像是有张他妈的嘴来嚼那玩意儿吗？！不————！我靠吸食鸡巴和迷途的女人们为生！精液和母乳！你他妈一样都没有！！！]");
            outputText("野兽结结实实地拍了一下你的屁股，似乎是想赶你走。[say: 给我滚出去！]它尖叫着。[say: 滚开，好让我去猎一顿真正的美餐！！！]");
            outputText("你离开了那个怪物，它也躲回了灌木丛中。跋涉了一段路后，你开始怀疑刚才发生的一切是否真的发生过……");
            dynStats(DynStat.Lust(-5));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         get_images().showImage("monster-tentaclebeast");
         outputText("你看到一个巨大的、步履蹒跚的身影从灌木丛中浮现。虽然它看起来像一棵大灌木，但它那球状的身躯上长满了带刺的卷须和类似头足类动物的肢体。察觉到你的存在，它伸出触手，全速向你笨重地冲来。[pg]");
         if(get_player().cor > 50 && get_player().cor <= 75)
         {
            outputText("你暗自盘算着从这种生物面前逃跑的利弊。[pg]");
         }
         if(get_player().cor > 75)
         {
            outputText("你微笑着大步向前，迎接你所期待的从这种怪物身上获得的快感。[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("它瞬间完全停了下来，抽搐着，仿佛在嗅着空气，然后转过身，消失在灌木丛中。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().cor > 50)
         {
            outputText("你是愉快地屈服，还是奋起反击？[pg]");
            menu();
            addButton(0,"战斗",startTentacleBeastCombat);
            addButton(1,"屈服",tentacleLossRape);
            return;
         }
         startCombat(new TentacleBeast());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function centaurGenderlessRetardation() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_tentacleMonster());
         get_images().showImage("tentaclebeast-sad-monster");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,247) == 0 || get_player().balls == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,247,1);
            outputText("触手在你来得及阻止之前缠住了你的双腿，将你紧紧束缚并向上盘绕。其中一根沿着你的下腹部缓慢滑动，让你因");
            if(get_player().cor < 50 && get_player().get_lust100() < 70)
            {
               outputText("恐惧");
            }
            else
            {
               outputText("期待");
            }
            outputText("而发抖，但当它到达你的臀部时停了下来。另一根触手开始试探同一区域，短暂地触碰了你的[asshole]，但显然没有找到它想要的东西。[pg]");
            outputText("[say: 你的身体到底有什么毛病？！] 一个令人不安的人类声音大喊道。[pg]");
            outputText("你的惊讶盖过了恐惧，嘴巴张得大大的。[pg]");
            outputText("[say: 为什么我他妈找不到你多汁的部位？] 怪物尖叫道。[say: 我饿得甚至敢去偷一群发情地精的精液！][pg]");
            outputText("你结结巴巴地说自己没有生殖器，脑子一片混乱，根本没法掩饰。[pg]");
            outputText("[say: 哦，你觉得这很搞笑，是吧？] 声音变成了嘲弄的语气。[say: 我懂了，让我们在森林里闲逛，去耍那些想要美味营养精液的饥饿怪物！让它们为了我的乐子白忙活！这他妈太搞笑了！][pg]");
            outputText("一根触手重重地拍打你的[ass]，声音恢复了正常。[pg]");
            outputText("[say: 我刚抓到一匹他妈的马，结果发现你身上根本没有能让我吃的东西！你知道抓一匹马有多他妈难吗！？][pg]");
            outputText("你现在感到有些羞愧，同意马可能确实很难抓，但你指出你<i>并不是</i>真正的马，你是一个半人马。这换来了一阵惊愕的沉默，而你因为不太能读懂怪物的情绪，决定用自己的声音打破沉默。你简要解释了马和半人马的主要区别，然后提到你并不是<i>自愿</i>成为猎物的；怪物当然也没有问过你是否可以从你的生殖器进食，也许它应该重新考虑一下它的策略。[pg]");
            outputText("更久的沉默。[pg]");
            outputText("一根触手不知从哪冒出来，狠狠地扇了你一巴掌。[pg]");
            outputText("[say: 去你的，你这头蠢马！你为什么不长对蛋蛋？字面意思上的！][pg]");
            outputText("它举起触手，齐刷刷地砸向你，将你击倒在地，失去了知觉。随后，触手缩了回去，怪物步履蹒跚地走进森林，嘴里嘟囔着什么燃烧之类的话。");
         }
         else
         {
            outputText("触手在你来得及阻止之前缠住了你的双腿，将你紧紧束缚并向上盘绕。其中一根沿着你的下腹部缓慢滑动，让你因");
            if(get_player().cor < 50 && get_player().get_lust100() < 70)
            {
               outputText("恐惧");
            }
            else
            {
               outputText("期待");
            }
            outputText("，向前滑行，在你的后腿之间探寻。它找到了你的[sack]，并带着些许仪式感地抚摸和把玩着。[pg]");
            outputText("[say: 这才是我想要的！] 怪物用它那令人毛骨悚然的声音唱道。[say: 爸爸需要他的药！][pg]");
            outputText("第二根触手也加入了进来，在你的[balls]周围摸索，寻找任何可以作为释放阀的器官。你盯着它搜索，非常确定接下来会发生什么。[pg]");
            outputText("[say: 不，不，不。他妈的到底在哪？] 怪物嘟囔着，沮丧让它的声音变得尖锐。[pg]");
            outputText("你油嘴滑舌地解释说，虽然你确实如它所愿有“一对”，但你仍然是无性别的，没有任何性器官。[pg]");
            outputText("当触手的主人消化你的话时，触手停止了运动；它开始明显地颤抖，并在这个过程中抖落了树叶。[pg]");
            outputText("[say: 你这个……死脑筋的……混蛋！] 它嚎叫着，带着狂怒的恶意转向你，让你退缩。[say: 首先，你不是无性别，你是无性征！性别认同包含了社会和行为因素，比如男性或女性的举止、穿着和家庭角色；你唯一缺少的是双腿之间任何有用的东西！如果你要卖弄学问，至少试着说对！][pg]");
            outputText("你畏缩了，惊讶于自己猜错了它的反应。[pg]");
            outputText("[say: 其次，] 它继续说道，[say: 我突然想到，在你那被误导的热情中，你忘记了你，a：有蛋蛋，b：无法合拢双腿！这就引出了C：触手击中腹股沟！][pg]");
            outputText("当你们争论时一直静止的一根触角从你的[sack]上抽离，然后带着清脆的拍打声返回，你的眼睛凸了出来；当你的视线在恶心的浪潮下变得粉红时，怪物松开了你的腿，你瘫倒在地，摆出了只能被认为是半人马胎儿的姿势。[pg]");
            outputText("[say: 证明完毕，混蛋！] 它大喊着，一边用触手在空中狂乱地挥舞，一边转身走回茂密的灌木丛中。");
         }
         get_player().takeDamage(5);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
   }
}

