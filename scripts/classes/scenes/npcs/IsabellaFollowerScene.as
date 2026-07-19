package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.npcs._IsabellaFollowerScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class IsabellaFollowerScene extends NPCAwareContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var lastNursingCheck:int;
      
      public var globalSave:Boolean;
      
      public function IsabellaFollowerScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         lastNursingCheck = 0;
         globalSave = false;
         saveVersion = 1;
         saveName = "isabella";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function yesToIsabellaTF() : void
      {
         clearOutput();
         outputText("你告诉伊莎贝拉，经过深思熟虑，你认为她应该把魔石用在自己身上。毕竟，她的变形不是让她比任何正常人类都更高大强壮吗？虽然你确实试图推翻恶魔领主，但你怀疑这并不能让它们全部随风消散，所以把这种力量传给她的孩子才是最仁慈的做法。");
         outputText("[pg][say: ……我没想过这个。]伊莎贝拉承认道。然后她" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2213) == 0.5 ? "从她的物品中取出包裹并打开，然后" : "") + "单手拿起那块结晶的灵魂物质碎片，轻轻地将毯子扔到她蹄子旁边的地上。她用另一只手包住它，闭上眼睛，看起来像是在祈祷，然后开始轻声自言自语。你意识到她说的肯定是她自己的语言；这加重了她平时的口音，让它变得更加浓重，直到你一个字也听不懂。你漫不经心地想，也许她可以教教你，直到你被一道刺眼的闪光打断。当你再次能看清时，伊莎贝拉正眨着眼睛恢复视力，并张开双手，里面什么也没有。");
         outputText("[pg][say: 好吧……我想就是这样了，]她宣布道，给了你一个歪歪扭扭的微笑。[say: 我想我们要等到这个小家伙出来打招呼，才能知道它是否起效了。]她一边说着，一边揉着肿胀的腹部。");
         outputText("[pg]你同意她的看法，并建议她躺下休息；毕竟，那肯定耗尽了她的精力。伊莎贝拉看起来有点怀疑，但显然也觉得休息一下是理所应当的，所以她只是点点头，笨拙地拿回毯子，去睡午觉了，留下你一个人离开。");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2213,1);
         doNext(playerMenu);
      }
      
      public function turnDownIsabellaFollower() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         isabellaAffection(-10);
         clearOutput();
         outputText("你带着些许沮丧，从伊莎贝拉令人窒息的拥抱中挣脱出来。当她意识到发生了什么时，这位巨乳女人的脸颊因尴尬而泛红，她退回到她的盾牌旁，紧张地揉捏着坚硬的金属边缘。你告诉她，她现在最好留在这里，至少在你成功完成任务并给这个陌生的地方带来和平之前。[pg]");
         outputText("听到你的话，伊莎贝拉叹了口气，瘫倒在她的金属防御者身上。最终，她回答道：[say: 我……明白，[name]。我将继续我孤独的守夜。你还有什么需要我做的吗，嗯？][pg]");
         menu();
         addButton(0,"交谈",get_isabellaScene().talkWithIsabella);
         addButton(1,"喝奶",get_isabellaScene().nomOnMommaIzzysTits);
         if(get_player().shortestCockLength() <= get_isabellaScene().tinyPenis())
         {
            addButton(2,"被舔",get_isabellaScene().izzyGivesSmallWangsFreeOral);
         }
         else
         {
            addButtonDisabled(2,"被舔","她喜欢舔小鸡巴。");
         }
         addButton(3,"强暴战",get_isabellaScene().fightIsabella);
         addButton(4,"提供口交",get_isabellaScene().volunteerToSlurpCowCunt);
         setExitButton();
      }
      
      public function toggleIsabellasMorningWoodChopping() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,376) == 0)
         {
            outputText("你告诉伊莎贝拉，你宁愿自己处理晨勃，如果可能的话，把精液攒起来，而不是让她每天早上都把它吸干。她看起来有点失望，但同意早上不打扰你。在你离开之前，她提议道，[saystart]");
            if(isabellaAccent())
            {
               outputText("如果你改变主意了，就告诉伊莎贝拉，好吗？[sayend]");
            }
            else
            {
               outputText("如果你改变主意了，就告诉我，好吗？[sayend]");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,376,1);
         }
         else
         {
            outputText("你");
            if(get_player().cor < 33)
            {
               outputText("脸红着");
            }
            else if(get_player().cor >= 66)
            {
               outputText("假笑着");
            }
            outputText("告诉伊莎贝拉，如果她还有兴趣的话，你希望她能再次在每天早上为你口交。她脸红了，但你看到她丝绸衬衫下八个乳头尖端硬挺地凸起，她回答道，[saystart]");
            if(get_player().shortestCockLength() > get_isabellaScene().tinyPenis())
            {
               outputText("我[w]会的，但前提是你得把[th]那个怪物变小。我[if (isabellaAccent) {可应付不来|可应付不来}]这种[th]东西！");
            }
            else
            {
               outputText("当然；[w]我们可不[w]希望你欲求不满地在[th]外面和恶魔战斗。谁知道[w]会发生什么？");
            }
            outputText("[sayend]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,376,0);
         }
         doNext(campIzzySexMenu);
      }
      
      public function toggleIsabellaContraceptives() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2212) == 1)
         {
            outputText("你告诉伊莎贝拉，你觉得她最好还是重新开始服用避孕药。");
            outputText("[pg]牛娘通情达理地点了点头。[saystart]Ja，[th]确实有道理。我们在这里过着艰苦的生活；这个时代[if (isabellaAccent) {，他们}]太危险了，没法合理地指望你照顾一个怀孕的[w]oman，然后还要照顾小宝宝，[if (isabellaAccent) {ja|yes}]？");
            if(get_isabellaScene().totalIsabellaChildren() > 0)
            {
               outputText("此外，[w]我们已经有 " + Utils.num2Text(get_isabellaScene().totalIsabellaChildren()) + " 个小" + (get_isabellaScene().totalIsabellaChildren() == 1 ? "婴儿" : "婴儿") + "需要照顾了。");
            }
            outputText("[sayend]");
            outputText("[pg]你感谢她的理解，然后回到了营地的主要区域。");
            outputText("[pg]<b>(伊莎贝拉不能再怀孕了。)</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2212,-1);
         }
         else
         {
            outputText("你告诉伊莎贝拉，如果她仍然想和你组建家庭，你愿意成为她孩子的父亲。");
            outputText("[pg]伊莎贝拉的脸亮了起来。[say: 我当然还是想要你，傻[manboy]。]她紧紧地抱住你，把你挤进她的乳房里，力气大得你能感觉到乳汁从她的八个乳头渗出" + get_player().clothedOrNaked("并弄脏了你的衣服") + "。");
            if(get_isabellaScene().totalIsabellaChildren() > 0)
            {
               outputText("[pg]她调皮地对你咧嘴一笑。[say: " + Utils.Num2Text(get_isabellaScene().totalIsabellaChildren()) + " 个小" + (get_isabellaScene().totalIsabellaChildren() == 1 ? "婴儿" : "婴儿") + " [w]还不够，嗯？你[if (isabellaAccent) {还想要|想要}]更多？]");
            }
            outputText("[pg]你只是对她微笑，享受了片刻的拥抱，然后礼貌地挣脱并告辞。");
            outputText("[pg]<b>(伊莎贝拉现在可以怀孕了。)</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2212,1);
         }
         doNext(isabellaTalkMenu);
      }
      
      public function tentacleBoneFollowerIzzy() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:int = -1;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         var _loc8_:int = -1;
         var _loc9_:int = -1;
         var _loc10_:int = -1;
         var _loc11_:Number = 0;
         var _loc12_:int = int(get_player().cocks.length);
         while(_loc11_ < get_player().countCocksOfType(CockTypesEnum.TENTACLE) && _loc12_ > 0)
         {
            _loc12_--;
            if(get_player().cocks[_loc12_].get_cockType() == CockTypesEnum.TENTACLE && get_player().cocks[_loc12_].cockLength >= 24)
            {
               _loc11_++;
               if(_loc1_ == -1)
               {
                  _loc1_ = _loc12_;
               }
               else if(_loc2_ == -1)
               {
                  _loc2_ = _loc12_;
               }
               else if(_loc3_ == -1)
               {
                  _loc3_ = _loc12_;
               }
               else if(_loc4_ == -1)
               {
                  _loc4_ = _loc12_;
               }
               else if(_loc5_ == -1)
               {
                  _loc5_ = _loc12_;
               }
               else if(_loc6_ == -1)
               {
                  _loc6_ = _loc12_;
               }
               else if(_loc7_ == -1)
               {
                  _loc7_ = _loc12_;
               }
               else if(_loc8_ == -1)
               {
                  _loc8_ = _loc12_;
               }
               else if(_loc9_ == -1)
               {
                  _loc9_ = _loc12_;
               }
               else if(_loc10_ == -1)
               {
                  _loc10_ = _loc12_;
               }
            }
         }
         clearOutput();
         outputText("你对着伊莎贝拉咧嘴一笑，若无其事地脱下你的[armor]，将你那完全勃起的怪物般的触手肉棒暴露在她惊恐的面前。你双臂交叉，站在她面前，肉棒四处蠕动。[saystart]");
         if(isabellaAccent())
         {
            outputText("哦，mein Gott！它……它们……太巨——等等，什么，你在做什么？");
         }
         else
         {
            outputText("我的天！它……它们……太巨——等等，你在做什么？");
         }
         outputText("[sayend][pg]");
         if(isabellaAccent())
         {
            outputText("你一言不发，熟练地引导着你那群蠕动的触手肉棒向她的身体靠近，慢慢地将她包围。没过多久，你的" + get_player().cockDescript(_loc1_) + "就已经缠住了她柔软的腰肢，紧接着是你的" + get_player().cockDescript(_loc2_) + "；利用你那对非人类般强大的肉棒肌肉的结合力量，你把她从地上举了起来。[say: 哦……你是个变态的男孩，ja？好吧，如果这就是你想要的……]");
         }
         else
         {
            outputText("你一言不发，熟练地引导着你那群蠕动的触手肉棒向她的身体靠近，慢慢地将她包围。没过多久，你的" + get_player().cockDescript(_loc1_) + "就已经缠住了她柔软的腰肢，紧接着是你的" + get_player().cockDescript(_loc2_) + "；利用你那对非人类般强大的肉棒肌肉的结合力量，你把她从地上举了起来。[say: 哦……你是个变态的男孩，不是吗？好吧，如果这就是你想要的……]");
         }
         outputText("起初她还在挣扎，但最终还是屈服于[onecock]的摆弄和抚摸；由于接触到她扭动的身体，你已经非常兴奋了，你的肉棒开始滴下先列腺液。你用自己的体液大量涂抹她的身体，用半透明的粘液涂抹她的肚子和乳房。你那橡胶般的阴茎群在她赤裸的皮肤上摩擦，戏弄着她，当你用灵活的生殖器无情地抚摸她时，你能感觉到她的颤抖和哆嗦。[pg]");
         if(get_player().canFly() && get_player().get_str() >= 90)
         {
            outputText("[say: 是时候来场狂野的兜风了，亲爱的。]你拍打着[wings]，调动全身的肌肉让自己腾空而起。你背负的重量简直重得离谱，你在起飞的尝试中呻吟喘息；最终，你设法一点点脱离了那充满占有欲的地面，当你看到加倍的努力得到了回报时，你得意地咕哝着；很快你就飞到了高空，伊莎贝拉的肉棒牢笼在你把她拖在身下时来回摇晃。要不是你那巨大的触手力量，这个可怜的牛娘可能几秒钟内就会坠落地面。你继续上升，直到伊莎贝拉意识到你们俩有多高并尖叫起来。[saystart]");
            if(isabellaAccent())
            {
               outputText("但……但是等等！我要掉下去了——我要……[sayend][pg]");
            }
            else
            {
               outputText("但……但是等等！我要掉下去了——我要……[sayend][pg]");
            }
            outputText("你坚定地向她保证你把她抱得很好，你绝不会让她掉下去，她应该为怀疑你坚定的触手肉棒而感到羞愧。你左右飞行，漫无目的地呈之字形飞行，交替俯冲和上升，随着你获得越来越多的动力；这种疯狂的速度、近乎危险的刺激和性挑逗的混合体让你脊背发凉。你兴奋地大笑，到处飞行，惊叹于下方玛瑞斯的景色，同时野蛮地抚摸着你的伴侣。[pg]");
         }
         outputText("在把玩了她一会儿后，你决定把你的其他触手肉棒也加入游戏；凭借专家般的精准度，你将你的" + get_player().cockDescript(_loc3_) + "移到她的脸上。在你的温柔服侍下呻吟着，她甚至没有注意到那根突出的巨物即将塞进她流着口水的嘴里。伴随着凶猛的猛刺，你将它一路猛烈地插入她柔软的嘴唇之间。当你用植物肉棒堵住她的气管时，她愉悦的叹息声戛然而止。你开始在她的喉咙里上下抽插你的肉棒，它原始的麝香让她感到头晕目眩。她试图通过用舌头绕着你勃起的" + get_player().cockDescript(_loc3_) + "移动来适应撑开她嘴巴的怪物，在这里和那里挤压它，抚摸你的静脉，并从你的尿道中挤出你的先列腺液。你因为舌头的挑逗而呻吟，并开始用渗出的液体填满她的胃；亲密的接触让她在几乎无法忍受的性唤起下更加扭动。她的嘴巴做得很专业，她的喉咙感觉那么好，那么柔软……你试图把更多的" + get_player().cockDescript(_loc3_) + "塞进她体内，总是想要更多的快感；当她急切地吞咽你的植物肉棒时，额外的压力几乎让她达到了高潮。[pg]");
         if(get_player().tongue.type == 2 || get_player().tongue.type == 1 || get_player().tongue.type == 3)
         {
            outputText("利用你长长、可伸缩的舌头，你决定舔舐她的身体。你的舌头向前飞奔，轻轻地找到了她柔软的乳房；你用强有力的触手肉棒把伊莎贝拉拉近，开始吸吮她的乳房，一次喝下一滴她美味的乳汁。你不断的刺激让她越来越兴奋，很快她的乳头就释放出规律的精华涓流。你毫不留情地喝着她，用舌头探查她的两个乳房，仿佛要更深地挖掘这种美妙甘露的源头。你一直大口吞咽着乳汁，直到你感到饱足，然后你又喝了一些。它甜美、可口、令人振奋；你可以靠她的乳房吃上好几天。你吸吮着她，直到她的身体因为持续的触觉挑逗而颤抖，然后才把舌头缩回来。[pg]");
         }
         if(_loc4_ >= 0)
         {
            outputText("你记得你的另一根肉棒还没有派上用场，而你触手拥抱中的性感女孩还有洞需要填补。你迅速开始操纵你的" + get_player().cockDescript(_loc4_) + "朝她的小穴走去；触手在她周围移动，开始四处戳刺，试图找到她后门的入口。你错过了好几次，每一次肉棒的刺入都让她在紧张中颤抖。你热情地用你" + get_player().cockDescript(_loc4_) + "的尖端按压她丰满的臀部，享受着柔软的质感；最后，你厌倦了玩弄她的屁股，把你的触手肉棒猛地插入她的肛门，把它撑得超出了正常的容量。幸运的是，你植物肉棒的灵活性让它在压缩自己并穿过她的结肠时能够完全贴合。你迅速用你的肉棒填满她的内部，并开始来回抽插，因为你感觉到与她内部粗糙但美妙的摩擦。伊莎贝拉的眼睛在纯粹的侵犯下睁得大大的，你能感觉到她无声地呻吟着，无法用塞满肉棒的嘴巴充分表达她强烈的情感。然后她把自己交给了你，让你玩弄她的身体，而你则庄严地盯着她的眼睛，双臂交叉，触手展开。[pg]");
         }
         if(_loc5_ >= 0)
         {
            outputText("但你还有肉棒剩下，她的另一个洞还没有被照顾到。你迅速采取行动来弥补这一点；几秒钟内，另一根" + get_player().cockDescript(_loc5_) + "已经指向了她精致的小穴。你以挑逗的方式刺了它一会儿；她已经失去了对自己身体的控制，她的两个洞被彻底穿透，当你开始耕耘她时，她忍不住疯狂地挣扎。你的" + get_player().cockDescript(_loc5_) + "似乎几乎无法适应，因为当你试图强行进入时，她的阴道肌肉不断挤压和按摩它……天哪，她太紧了！她小穴钢铁般的抓地力几乎让你瞬间射精，但你艰难地恢复了镇定，强迫自己忍受威胁要接管你胯部的快感浪潮。她美丽的身体在第一次插入时应该得到的不仅仅是单纯的射精；她显然需要被彻底地操弄和猛烈撞击，以满足你们俩。一旦你设法将最大数量的植物肉棒塞进她的爱之隧道，你就会采取更舒适的抽插节奏，交替操弄她的每个洞，确保她每时每刻都至少有一根肉棒深埋在体内。你们俩都相当兴奋，大量的先列腺液，以及口水和淫液，从她的每个洞里溢出；很快你的营地就回荡着三重插入发出的巨大吧唧声。[pg]");
         }
         if(_loc6_ >= 0)
         {
            outputText("但等等，这还不够。你的另一根触手肉棒被抛在后面，没有得到满足。带着腼腆的微笑，你在伊莎贝拉的眼前摇晃着它，而她正试图适应在空中被三重插入。她的眼睛，起初充满了渴望，现在变得担忧起来，因为她想知道你的" + get_player().cockDescript(_loc6_) + "能做些什么。下面突然的拉伸让她意识到你打算用更多的肉棒填满她；将你的" + get_player().cockDescript(_loc5_) + "压在她阴唇的一侧，你强行将你的" + get_player().cockDescript(_loc6_) + "带到她已经塞满的阴道入口，试图再塞进一根肉棒。经过几次不成功的尝试，让她反复收紧和紧张后，你终于设法进入了几英寸；然后你轻松地滑入剩余的植物肉棒，有效地双重插入了她的小穴。你的" + get_player().cockDescript(_loc6_) + "很快在速度和强度上与你的" + get_player().cockDescript(_loc5_) + "相匹配，你的一对肉棒在无情的蹂躏小穴比赛中简直是在互相竞争。[pg]");
         }
         if(_loc7_ >= 0)
         {
            outputText("被她裸体被侵犯的景象深深迷住，你想要更多地虐待它。她那巨大、摇晃的乳房太诱人了，让你无法抗拒；在你甚至想到它之前，你的" + get_player().cockDescript(_loc7_) + "已经在她赤裸的肉体上滑行，沿着她赤裸的肚子潜行，因为它在她西瓜般的球体之间找到了一条路。它们开始渗出自己美味的乳汁，她的体液加入你的体液，因为她的身体被涂成了白色。凭借轻松和专家般的精准度，你将肉棒滑入她的乳房之间，让它们弹跳和旋转，因为你毫不费力地乳交她。她的乳房太柔软了……你的" + get_player().cockDescript(_loc7_) + "，几乎是出于自己的意愿，决定环绕她诱人的肉球，在坚硬的乳头上摩擦，并在她的胸部渗出树液般的先列腺液。");
            if(_loc8_ >= 0)
            {
               outputText("很快你的" + get_player().cockDescript(_loc8_) + "也加入了进来，每根肉棒照顾一个乳头，用她坚硬的乳头浅浅地插入来挑逗这些洞，先列腺液与相反方向的乳汁流动作斗争，并拉伸你的尿道，这种感觉让你疯狂地颤抖。");
            }
            outputText("你继续用手——或者说肉棒——抚摸她的乳房，而你其余的肉棒则恶毒地猛击她；你的");
            if(_loc8_ >= 0)
            {
               outputText("一对抚摸乳房的肉棒几乎愤怒地颤抖着，找不到任何剩下的洞可以填补。这只会让它们更用力、更快地乳交她。");
            }
            else
            {
               outputText("抚摸乳房的肉棒几乎愤怒地颤抖着，找不到任何剩下的洞可以填补。这只会让它更用力、更快地乳交她。");
            }
            outputText("[pg]");
         }
         if(_loc9_ >= 0)
         {
            outputText("可悲的是，只有这么大的空间可以容纳你庞大的肉棒。你的同伴没有魅魔那种张开的、淫荡的洞，你不可能把更多的肉棒塞进她体内的任何地方。你剩下的肉棒");
            if(_loc10_ >= 0)
            {
               outputText("无处可塞，在沮丧中扭动着。你认为让它们派上用场是公平的：你把一根缠在她的手腕上，绑住她的手并固定她，以减轻其他肉棒插入的难度，然后用尖端划过她身体未使用的部分，简单地享受她娇嫩的皮肤对你" + get_player().cockDescript(_loc9_) + "的抚摸，感受她在你流畅的触手运动下颤抖。你剩下的" + get_player().cockDescript(_loc10_) + "缠绕在她的脸上，挤压她的脸颊，并将其尖端指向她的眼睛，以确保她的每一个感官都充满了肉棒。");
            }
            else
            {
               outputText("无处可塞，在沮丧中扭动着。你认为让它派上用场是公平的：你把它缠在她的手腕上，绑住她的手并固定她，以减轻其他肉棒插入的难度，然后用尖端划过她身体未使用的部分，简单地享受她娇嫩的皮肤对你" + get_player().cockDescript(_loc9_) + "的抚摸，感受她在你流畅的触手运动下颤抖。");
            }
            outputText("[pg]");
         }
         outputText("这场彻底的触手操弄让你感到疲惫和荒谬的兴奋。你的");
         if(get_player().canFly() && get_player().get_str() >= 90)
         {
            outputText("翅膀和你的");
         }
         outputText("[cocks]完成了所有的工作；你的腹股沟因为为了进行最大程度的有效插入而付出的巨大努力而感到酸痛。当你继续用你扭动的肉棒抽插、摩擦和挑逗她时，你感觉到胯部和尿道一直向上生长的压力；你加快了抽插的速度，即使");
         if(get_player().canFly() && get_player().get_str() >= 90)
         {
            outputText("你降落下来，[feet]重新踩在泥土上，但依然把伊莎贝拉举在半空中；");
         }
         outputText("你感觉到高潮越来越近。伊莎贝拉的身体在快感中几乎要昏厥过去，她的脸上展现出即将迎来强烈高潮的所有迹象。看到爱人如此沉醉的模样，足以将你推向顶峰；伴随着惊人且非人的力量，你射精了。精液狂暴地沸腾着，从[eachcock]中喷涌而出。你沉浸在强烈的性高潮中，用白色的浓浆涂满她的身体，灌满她的喉咙");
         if(_loc4_ >= 0)
         {
            outputText("，");
            if(_loc5_ < 0)
            {
               outputText("和");
            }
            outputText("她的肠道");
         }
         if(_loc5_ >= 0)
         {
            outputText("，");
            if(_loc7_ < 0 || _loc10_ < 0)
            {
               outputText("和");
            }
            outputText("她的小穴");
            if(get_player().cumQ() >= 1500)
            {
               outputText("，直到她看起来像怀孕了8个月一样");
            }
         }
         if(_loc7_ >= 0)
         {
            outputText("；用你的精液淹没她的乳头");
         }
         if(_loc10_ >= 0)
         {
            outputText("，并在你注视着她时射在她的脸上");
         }
         outputText("。她那迷人的双眼");
         if(_loc10_ < 0)
         {
            outputText("最终");
         }
         else
         {
            outputText("立刻");
         }
         outputText("被液体遮蔽，因为你将精液倾泻在她的身上。没有一处肌肤不被你的体液涂抹；没有一个洞穴不被浓稠的精液填满。");
         if(_loc4_ >= 0)
         {
            outputText("她自己直肠");
            if(_loc5_ >= 0)
            {
               outputText("和阴道");
            }
            outputText("喷出的液体看起来微不足道，因为她的身体简直被精液的洪流浸透了。");
         }
         outputText("你不断用充满欲望的精液喷泉浸泡着她，直到你的");
         if(get_player().balls > 0)
         {
            outputText("阴囊");
         }
         else
         {
            outputText("腹股沟");
         }
         outputText("感觉被掏空了，再也挤不出一滴液体喷在她身上。");
         outputText("你用[eachcock]继续抱了她一会儿，你们俩都享受着这强有力的拥抱，毕竟你这可是名副其实的“肉棒抱”。她的全身都滴着你的精液，但她似乎并不在意。最后，你把她放了下来，让她扑通一声掉进你胯下牢笼下方形成的汁液水坑里。终于，你松开了双臂。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-1),DynStat.Cor(0.3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sparring(param1:int = 1) : void
      {
         var _loc2_:Number = NaN;
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,382) == 1)
         {
            outputText("你和伊莎贝拉带着一些旧家具和破毯子徒步走到平原边缘，布置了一个假营地供你们在周围战斗。布置完成后，你们在开始前稍微喘了口气。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,382,2);
         }
         else
         {
            outputText("你和伊莎贝拉徒步走到平原边缘，在那里你们搭起了用于切磋的临时营地。[pg]");
         }
         outputText("伊莎贝拉举起她的盾牌，用指关节敲击着坚固的钢铁，发出响亮的、像锣一样的声音，传出很远。你举起你的[weapon]准备战斗。开始了！");
         if(param1 == 1)
         {
            outputText("知道你们是在动真格的，这让你的心跳加速了。");
         }
         startCombat(new Isabella());
         get_monster().createStatusEffect(StatusEffects.Sparring,param1,0,0,0);
         get_monster().set_gems(0);
         if(param1 == 2)
         {
            _loc2_ = get_monster().XP / 2;
            get_monster().XP = Math.round(_loc2_);
         }
         spriteSelect(SpriteDb.get_s_isabella());
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         isabellaSprite();
         outputText("[say: 你觉得你能帮我个忙吗？] 你对这个日耳曼巨乳怪物说。[say: 湖边附近有个农场。我需要任何强壮、警惕，并且……有很多奶水的人……] 让你松了一口气的是，伊莎贝拉对这个主意反应很好。");
         if(isabellaAccent())
         {
            outputText("[pg][say: 耶，我自个儿旅行时就晓得这地方。那农场的狗儿可好啦，是不是？我想啥时候用挤奶机都行。要是她的农场现在是咱家的，我肯定乐意帮忙！]");
         }
         else
         {
            outputText("[pg][say: 是的，我在自己的旅行中知道这个地方。那个农场狗很善良，对吧？她让我随时使用挤奶机。如果她的农场现在是我们的农场，我很乐意帮忙！]");
         }
         outputText("[pg]她高兴地收拾好东西，然后摇曳着走向湖边。你觉得她会和惠特尼相处得很好，同时也能为农场提供大量的力量和奶水。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1083,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function runAwayFromIzzyBurps() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,383) == 0)
         {
            outputText("让常识主导你的判断，你从这位深色皮肤的女人身边退开，一直退到她不再向你挥手为止。她做了个鬼脸，显然是痛苦和……快乐的交织？她的脸颊鼓了起来，胸部也挺了出来。尽管如此，你还是忍不住欣赏她的“乳房”在她挺出的躯干上的样子，随着她身体的颤抖不断地晃动。最后，当她似乎再也忍不住时，她的嘴巴张得比你见过的任何时候都大，打出了一个巨大的饱嗝。一团肉眼可见的雾状气体从她张开的大嘴里喷涌而出，体积不断增大，随着随后的打嗝声荡漾开来，不祥地盘旋在她周围。为了把所有讨厌的气体从她可怜的身体里排出去，伊莎贝拉粗暴地挤压着自己的腹部，每次强迫它们排出时都会痛苦地皱起眉头。[pg]");
            outputText("这阵气体攻击终于减弱了，她的肚子恢复了健康的状态，云雾也散去了。等了几分钟确认这阵风波结束后，伊莎贝拉跺着脚走向你，脸颊上泛起一阵猛烈的红晕。[saystart]");
            if(isabellaAccent())
            {
               outputText("你给我吃了什么？这简直太尴尬了！");
            }
            else
            {
               outputText("你给我吃了什么？这简直太尴尬了！");
            }
            outputText("[sayend]她抱怨道，嘴唇因为生气而撅起。你忍不住同意，但你也指出毕竟没有发生什么坏事。[pg]");
            outputText("[say: ……确实，]她承认道，意识到这一点后，她的气势减弱了一些。[saystart]");
            if(isabellaAccent())
            {
               outputText("看来我的身体因为某种原因排斥这种“超级牛奶”。[sayend]没造成什么伤害，也不算犯规，你满怀希望地提议，她点了点头。[say: 但下次再给我药水之前，一定要认真考虑一下！]她警告道，朝你摇了摇一根充满预兆的手指。你回想起那团气体，以及在近距离接触这种东西可能产生的效果。然而，即使你想测试一下，你也需要另一瓶超级牛奶……");
            }
            else
            {
               outputText("看来我的身体因为某种原因排斥这种“超级牛奶”。[sayend]没造成什么伤害，也不算犯规，你满怀希望地提议，她点了点头。[say: 但下次再给我药水之前，一定要认真考虑一下！]她警告道，朝你摇了摇一根充满预兆的手指。你回想起那团气体，以及在近距离接触这种东西可能产生的效果。然而，即使你想测试一下，你也需要另一瓶超级牛奶……");
            }
            doNext(callForFollowerIsabella);
         }
         else
         {
            outputText("让常识主导你的行动，你从这位深色皮肤的女人身边退开，同时解释你改变主意的原因。她点头同意，然后抱着翻滚的肚子，痛苦地做着鬼脸，只有一点点罪恶的快感。不出所料，她的脸颊和胸部都鼓了起来。你趁机欣赏她的胸部，沉重的肚子更加凸显了那巨大而美丽的胸部，随着她身体的颤抖不断地晃动。最后，当她似乎再也忍不住时，她的嘴巴张得比你见过的任何时候都大，打了一个巨大的饱嗝。一团肉眼可见的雾气从她张开的嘴里喷涌而出，体积不断增大，不祥地盘旋在她周围，随后的饱嗝也接踵而至。为了把所有讨厌的气体从她可怜的身体里排出去，伊莎贝拉粗暴地挤压着她的腹部，每排出一股气体，她都会痛苦地皱起眉头。[pg]");
            if(isabellaAccent())
            {
               outputText("这阵气体攻击终于减弱了，她的肚子恢复了健康的状态，云雾也散去了。她松了一口气，拍了拍肚子，看着你，表情中带着一丝失望的阴霾。[say: 我想我正在习惯这个，]当你走近时，她叹了口气。[say: 如果你能在这里……和我一起享受，那就好玩多了。下次你再给我带这种东西的时候，考虑一下好吗？][pg]");
            }
            else
            {
               outputText("这阵气体攻击终于减弱了，她的肚子恢复了健康的状态，云雾也散去了。她松了一口气，拍了拍肚子，看着你，表情中带着一丝失望的阴霾。[say: 我正在习惯这个，]当你走近时，她叹了口气。[say: 如果你能在这里……和我一起享受，那就好玩多了。下次你再给我带这种东西的时候，考虑一下好吗？][pg]");
            }
            outputText("看到你点头，她满意地笑了笑，然后走开了。你不能确定，但你几乎发誓你又听到她打了个嗝。");
            doNext(callForFollowerIsabella);
         }
      }
      
      public function reset() : void
      {
         saveContent.oviElixirAmount = 0;
         saveContent.babyNotVirgin = [];
         saveContent.ghostJudged = false;
      }
      
      public function repeatGermanBratwurstInCamp() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         var _loc1_:int = get_player().smallestCockIndex();
         outputText("你问伊莎贝拉是否介意在你再次出门前帮你释放一下压力。她低头瞥了一眼[eachcock]并");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,378) < 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,378) > 0)
         {
            if(isabellaAccent())
            {
               outputText("嘟囔道，[say: 这么快？我不是刚伺候过你吗？] 脸红的牛娘调侃道，[saystart]你真的有那么饥渴，还是说你就那么喜欢我的屁股？");
            }
            else
            {
               outputText("嘟囔道，[say: 这么快？我不是刚伺候过你吗？] 脸红的牛娘调侃道，[saystart]你真的有那么饥渴，还是说你就那么喜欢我的屁股？");
            }
         }
         else if(get_player().cockArea(_loc1_) > 38)
         {
            _loc1_ = get_player().biggestCockIndex();
            if(isabellaAccent())
            {
               outputText("喘息着说，[saystart]哦，是的，我看到了。它看起来憋得好难受……可惜它太大了，没法在我的屁股里享受全套服务。不过你还是会射在我的屁股上，对吧？");
            }
            else
            {
               outputText("喘息着说，[saystart]哦，是的，我看到了。它看起来憋得好难受……可惜它太大了，没法在我的屁股里享受全套服务。不过你还是会射在我的屁股上，对吧？");
            }
         }
         else if(isabellaAccent())
         {
            outputText("高兴地沉思着，[say: 噢，我明白了。我当然会帮你的，[name]！] 她用手指沿着[onecock]的轮廓画圈，继续说道，[saystart]我很乐意把它全榨进我的屁股里。这就是你想要的，不是吗？");
         }
         else
         {
            outputText("高兴地沉思着，[say: 噢，我明白了。我当然会帮你的，[name]！] 她用手指沿着[onecock]的轮廓画圈，继续说道，[saystart]我很乐意把它全榨进我的屁股里。这就是你想要的，不是吗？");
         }
         outputText("[sayend][pg]");
         if(get_player().cor < 33)
         {
            outputText("你涨红了脸，羞怯地给出了肯定的回答。");
         }
         else if(get_player().cor < 66)
         {
            outputText("觉得没有理由隐瞒，你便承认了。");
         }
         else
         {
            outputText("你眼中闪烁着会意的光芒，赞同了这位巨乳女人的直觉，诱人地摇晃着臀部。她的目光在你的命根子上停留了片刻，然后才回过神来，迎上你的视线。");
         }
         outputText("伊莎贝拉将双臂交叉在肚子上，对她那对高耸的巨乳两侧施加了恰到好处的压力，使它们在衣服里晃动并膨胀起来。当她笑出声时，那深邃的乳沟似乎快要把上衣撑破了，[say: 眼睛往上看，大[boy]。] 就像偷吃饼干被抓包的小孩一样，你");
         if(get_player().cor < 33)
         {
            outputText("感到一阵强烈的羞耻感涌上心头");
         }
         else if(get_player().cor < 66)
         {
            outputText("感到有些羞愧");
         }
         else
         {
            outputText("因为盯着看被抓包而脸红");
         }
         outputText("，但伊莎贝拉并没有深究。她转过丰满的臀部，将背面展现给你，掀起裙子露出光溜溜的屁股，并开始收缩肌肉，让那深色的丰腴软肉随之摇晃颤动。[pg]");
         outputText("[say: 你打算一直盯着看，还是脱衣服？]牛娘问道，她那熟练而撩人的摇晃动作丝毫没有减慢。你脱下衣服，但只要她那样摇摆，你的目光就牢牢锁定在那诱人、丰满的臀部上。你的[armor]落在你身后的一堆，终于释放出[eachcock]来呼吸空气。那丰满、汗水滑润的臀瓣相互摩擦，对于任何有幸滑入那宽阔臀缝的人来说，这都预示着天堂般的快感。当你意识到她打算让你感受这一切时，你忍不住感到欣喜若狂。[pg]");
         if(isabellaAccent())
         {
            outputText("伊莎贝拉向你勾了勾手指，命令道：[saystart]过来，坐下，但向后靠，这样伊莎贝拉就有足够的空间来榨干这条调皮的");
         }
         else
         {
            outputText("伊莎贝拉向你勾了勾手指，命令道：[saystart]过来，坐下，但向后靠，这样我就有足够的空间来榨干这条调皮的");
         }
         if(get_player().cockArea(_loc1_) <= 38)
         {
            outputText("小");
         }
         outputText("蛇……[sayend][pg]");
         outputText("你慢慢靠近，贪婪地注视着你牛娘同伴那曲线优美的身体，吞噬着她身体的每一个细节。从她曲线优美的大腿和饱满的臀部，到她苍白、乳白色的斑点，她的身体似乎被雕刻得能挑逗任何有幸欣赏她丰满身躯的眼睛。伊莎贝拉转动着她摇晃的臀部，将她古铜色的屁股拍在你身上。这令人惊讶的冲击力将你推入她之前指过的露营椅中，在她完全掌控局面的同时，短暂的皮肤与胯部接触挑逗着你。" + get_player().SMultiCockDesc() + "从你的下体挺立而出，坚硬地跳动着，渴望着再次触碰伊莎贝拉的臀部。[pg]");
         outputText("这位自信的女人继续着她的旋转，非常清楚她对你产生的影响。[say: 不，还没到时候，]她命令道，她那滴着汗水的屁股危险地靠近[onecock]。伊莎贝拉将她迷人的背部抬得更高，把它带到你的面前。她慢慢地扭动着，然后张开双腿，让你看到她闪闪发光的阴道和紧紧闭合的菊花从她暗色的脸颊后露出来。[say:[if (isabellaAccent) {So vet,|So wet,}]]她呻吟着，然后恢复了她的摇晃，");
         outputText("[say: 好热……我让你觉得热了吗，[name]？你的肉棒已经为我抽动了吗？是不是又酸又漏，弄得自己一团糟[if (isabellaAccent) {, ja}]？][pg]");
         outputText("你点点头，无意中闻到了她那充满麝香的阴户散发出的气味。你根本无法避免，她的身体就在你[face]前几英寸的地方，摇晃得如此完美，如此靠近，以至于偶尔会有水滴落在你的鼻子上。你的双手死死地抓住椅子，努力克制着不立刻站起来强暴她那娇嫩、撩人的菊花。" + get_player().SMultiCockDesc() + "正在滴落着液体，随着你的心跳跳动，你的[legs]因为被压抑的欲望而颤抖。你必须做点什么……操她、冲刺，或者只是打飞机……什么都行——你的[cocks]受不了了！[pg]");
         outputText("被你的肉棒拉起，你松开了抓着牛皮椅子的手，开始向伊莎贝拉身上挺进。她熟练地把她富有弹性的屁股贴在你的[chest]上。这把你撞回了原位，同时她责骂道，");
         outputText("[say: 我说了还没到时候。你[w]ant我帮你高潮还是不想？]");
         outputText("你对她点点头，在你的欲望被你渴望的对象打断后，你感觉稍微恢复了一些控制。伊莎贝拉半闭着眼睛回头看着你，低语道，");
         outputText("[say: 乖[boy]。放松，伊莎贝拉妈妈[w]ill照顾你的。][pg]");
         outputText("这位曲线玲珑的牛娘稍稍调整了姿势，她那充满挑逗的摇臀舞停了片刻，好让自己的屁股贴上你的" + get_player().cockDescript(_loc1_) + "。");
         if(get_player().cockTotal() == 2)
         {
            outputText("另一根阴茎被推到一边，被遗忘了，因为伊莎贝拉选择了那根幸运的肉棒。");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("其他的阴茎被推到一边，被遗忘了，因为伊莎贝拉选择了那根幸运的肉棒。");
         }
         outputText("她弓起身体，在你的" + get_player().cockDescript(_loc1_) + "上滑上滑下，随着每一次抽插，逐渐增加她压在上面的重量。你滴着液体的肉棒伴随着一声湿润的*啵*声滑入伊莎贝拉紧紧挤压的臀缝中。她的臀部好热……好滑……好……好紧。你甚至还没开始操她");
         if(get_player().cockArea(_loc1_) <= 38)
         {
            outputText("，虽然你的肉棒完全被她的大屁股吞没，你也差不多算是操进去了。");
         }
         else
         {
            outputText("，正如从她臀缝顶部升起的桅杆所表明的那样。");
         }
         outputText("然而，你毫无疑问地知道，此刻就将精华倾泻，把那红发女郎紧致的臀沟化为满是白灼的溪谷，这并不可耻。[pg]");
         if(get_player().cockArea(_loc1_) <= 38)
         {
            if(isabellaAccent())
            {
               outputText("[say: 哎呀，我的屁股是不是感觉太棒了，以至于你那可爱又美味的肉棒甚至还没体验到最棒的部分，就要在我身上射出来了？]伊莎贝拉一边挑逗着，一边交替收缩着两边的臀瓣，迫使你的" + get_player().cockDescript(_loc1_) + "在两团丰满臀肉的夹击下弯曲。她继续用那丰满的屁股抚摸着你的肉棒，挑逗着你。[say: 你脸上的表情真下流，只是和伊莎贝拉妈妈玩了一小会儿，口水都流出来了。不，别停，我想看着我套弄你那根漂亮又滚烫的肉棒时，高潮的快感在你体内蔓延。我的小穴想亲吻它……我能用我的小穴亲吻你的肉棒吗？]");
            }
            else
            {
               outputText("[say: 哎呀，我的乳交是不是感觉太棒了，以至于你那可爱又美味的肉棒甚至还没体验到最棒的部分，就要在我身上射出来了？]伊莎贝拉一边挑逗着，一边交替收缩着两边的臀瓣，迫使你的" + get_player().cockDescript(_loc1_) + "在两团丰满臀肉的夹击下弯曲。她继续用那丰满的屁股抚摸着你的肉棒，挑逗着你。[say: 你脸上的表情真下流，只是和伊莎贝拉妈妈玩了一小会儿，口水都流出来了。不，别停，我想看着我套弄你那根漂亮又滚烫的肉棒时，高潮的快感在你体内蔓延。我的小穴想亲吻它……我能用我的小穴亲吻你的肉棒吗？]");
            }
            if(get_silly() && (get_player().get_lust100() < 50 || get_player().lib <= 20))
            {
               outputText("听到她那可笑的同人本级别的枕边话，你的肉棒立刻软了下来，从她的臀沟里滑落。你稍后会把这句话发到4chan上博人一笑。");
               dynStats(DynStat.Lust(-99));
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("她甚至不给你回答的机会。她突然停止了来回的收缩，转而开始上下套弄，用她那长满斑点的紧致臀部夹着你的" + get_player().cockDescript(_loc1_) + "摩擦。[pg]");
            outputText("你双手再次紧紧抓住椅子，在伊莎贝拉的屁股在你的肉棒上滑动时，努力忍住不射。那种感觉如此火热、湿润且充满肉欲，你为了保持不动而浑身颤抖，但你还是坚持住了，因为你知道忍得越久，最后的高潮就越棒。她慢慢地在她的臀沟里套弄着你的" + get_player().cockDescript(_loc1_) + "，而你则发出呜咽和呻吟，随着时间的推移，你脸上的表情变得越来越淫靡。当最后你觉得再也忍不住时，你呻吟着，[say: 要……要射了！][pg]");
            outputText("伊莎贝拉粗暴地抬起身体，发出啧啧声，[say: 不，这[th]可[w]不行。]");
            outputText("你呜咽着，在她拒绝你插入时，在她身下颤抖。然后，她改变了角度，压了下来。她柔软的臀瓣滑过你的肉棒，紧紧地包裹着它，牛娘那布满皱褶的后庭停在了你的" + get_player().cockHead(_loc1_) + "上。你们俩都因为这突如其来的、触电般的感觉而喘息，被这种全新的感觉短暂地定住了。接着，伊莎贝拉压了下来，她的肛门扩张开来，让你那因欲望而肿胀的肉棒进入她的后门。她的后庭甚至比刚才的臀沟还要紧致，当那紧缩的、布满皱褶的圆环向你的根部移动时，你知道在它稍微松开之前，你是无法射精的。[pg]");
            outputText("那个完美紧致后庭的主人问道，[say: 我现在需要担心你射精吗？不需要？我就知道。]她将臀部贴着你的腹股沟扭动，将那汗水浸透的臀瓣在你的臀部和肚子上用力摩擦了一会儿，力度大到让椅子都摇晃起来。你的" + get_player().cockDescript(_loc1_) + "试图滴出液体，试图泄漏，但它被夹得太紧了，连最微小的一滴释放都无法逃脱。起初很慢，这位美丽的牛娘开始向上滑动，以令人痛苦的缓慢速度拖动着那个圆环，让你最底部的部分再次感受到她臀瓣的性感抚摸。然后，当她刚好在龟头下方时，她猛地压下，这次速度更快，你感觉你的肉棒几乎要被从头到尾压碎了。[pg]");
            if(isabellaAccent())
            {
               outputText("知道现在除了等待她的括约肌松弛之外别无他法，你向后瘫倒，看着伊莎贝拉被束腰裹住的腹部在你身上弹跳，她的乳房如此巨大，以至于你可以看到大量的侧乳随着每一次动量的改变而颤动。每次她的臀部撞击你时，振动的涟漪就会在她的臀部脂肪中荡漾，这一景象只会让你的" + get_player().cockDescript(_loc1_) + "在她体内变得更硬。伊莎贝拉现在弹跳得快多了，她回头看着你说，[say: 你有一根多么美味、完美的肉棒给我啊，是的。当它填满我时，挤压的感觉真好。你还在变硬，不是吗？你的肉棒要在我的体内爆炸了吗？它会爆裂并喷出所有那些乱七八糟的精液，好让勇者能再次清醒思考吗？还是说这根虚弱的小肉棒无法射精，让我骑一整天？][pg]");
            }
            else
            {
               outputText("知道现在除了等待她的括约肌松弛之外别无他法，你向后瘫倒，看着伊莎贝拉被束腰裹住的腹部在你身上弹跳，她的乳房如此巨大，以至于你可以看到大量的侧乳随着每一次动量的改变而颤动。每次她的臀部撞击你时，振动的涟漪就会在她的臀部脂肪中荡漾，这一景象只会让你的" + get_player().cockDescript(_loc1_) + "在她体内变得更硬。伊莎贝拉现在弹跳得快多了，她回头看着你说，[say: 你有一根多么美味、完美的肉棒给我啊。当它填满我时，挤压的感觉真好。你还在变硬，不是吗？你的肉棒要在我的体内爆炸了吗？它会爆裂并喷出所有那些乱七八糟的精液，好让勇者能再次清醒思考吗？还是说这根虚弱的小肉棒无法射精，让我骑一整天？][pg]");
            }
            if(isabellaAccent())
            {
               outputText("尽管她不断挑逗，但操弄时持续的拉伸摩擦使她紧致的圆环在你周围放松下来。每一次撞击、弹跳和挤压似乎都让你比以前更接近高潮，你积压的体液随时都有可能喷射而出。你知道快了，但你不知道是什么时候。伊莎贝拉似乎并不介意你的不适，因为她正在用力快速地弹跳，拉扯着她的乳头，一边呻吟一边从中挤出浓稠的乳汁。她的整个身体都在紧绷和颤抖，当她的乳汁变成奶油时，你意识到她高潮了，仅仅是因为骑着你的肉棒！她的高潮持续了很久，把你下面的地毯变成了一团被乳汁浸透的烂摊子。然而，一旦她结束，她的肛门括约肌就会松弛下来，让你的" + get_player().cockDescript(_loc1_) + "终于释放出精液。伊莎贝拉呻吟着问道，[say: 哦，你刚才射在我的屁股里了吗？你还在射，不是吗？]她开始慢慢地上下弹跳，在你的肉棒因高潮而收缩时榨取它，将浓稠的积压精液喷射到伊莎贝拉最深处的黑暗中。这位曲线优美的牛娘继续说着下流话，[say: 是的，给我。把你积压的所有下流精液都给我。让我的屁股吸干你的精液，这样你就不会浪费它了。真是个邋遢、调皮的[boy]。][pg]");
            }
            else
            {
               outputText("尽管她不断挑逗，但操弄时持续的拉伸摩擦使她紧致的圆环在你周围放松下来。每一次撞击、弹跳和挤压似乎都让你比以前更接近高潮，你积压的体液随时都有可能喷射而出。你知道快了，但你不知道是什么时候。伊莎贝拉似乎并不介意你的不适，因为她正在用力快速地弹跳，拉扯着她的乳头，一边呻吟一边从中挤出浓稠的乳汁。她的整个身体都在紧绷和颤抖，当她的乳汁变成奶油时，你意识到她高潮了，仅仅是因为骑着你的肉棒！她的高潮持续了很久，把你下面的地毯变成了一团被乳汁浸透的烂摊子。然而，一旦她结束，她的肛门括约肌就会松弛下来，让你的" + get_player().cockDescript(_loc1_) + "终于释放出精液。伊莎贝拉呻吟着问道，[say: 哦，你刚才射在我的屁股里了吗？你还在射，不是吗？]她开始慢慢地上下弹跳，在你的肉棒因高潮而收缩时榨取它，将浓稠的积压精液喷射到伊莎贝拉最深处的黑暗中。这位曲线优美的牛娘继续说着下流话，[say: 是的，给我。把你积压的所有下流精液都给我。让我的屁股吸干你的精液，这样你就不会把它浪费在别处。真是个邋遢、调皮的[boy]。][pg]");
            }
            outputText("伊莎贝拉的话激励着你将每一盎司、每一滴积攒的精液都射入她饥渴的后门。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她的肚子因注入的液体而膨胀时，她满意的表情微微改变了");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("，最终隆起成怀孕般的曲线");
               }
               outputText("。她微微呜咽着咕哝道，[say: 这么有生育能力的[boy]……伊兹妈妈能承受得住。]");
            }
            outputText("你的" + get_player().cockDescript(_loc1_) + "在极乐中扭动了似乎很久，但在你意识到之前，你已经回到了现实。伊莎贝拉对你耳语道，[say: 好[boy]，]然后站了起来，无视从她那深色后庭滴落下来弄脏[eachcock]的精液。她把你扶起来，她的手亲昵地揉了揉你的头发。然后她转身走向她那边的营地，离开时走得有点罗圈腿。");
         }
         else
         {
            if(isabellaAccent())
            {
               outputText("[say: 哎呀，我的屁股在你那根被称为肉棒的巨大、下流的东西上感觉有那么好吗？]伊莎贝拉一边挑逗着，一边交替收缩着两边的臀瓣，迫使你的" + get_player().cockDescript(_loc1_) + "在两团丰满臀肉的夹击下弯曲。她继续说道，[say: 你脸上的表情真下流，像狗一样流着口水。这就是拥有一根大肉棒对你的影响吗？它是不是让你如此饥渴、意志薄弱，以至于你会把精液浪费在我的屁股上？]伊莎贝拉停止了来回的收缩，开始上下弹跳。她柔软、收缩的臀瓣抚摸着你的" + get_player().cockDescript(_loc1_) + "，从根部");
            }
            else
            {
               outputText("[say: 哎呀，我的乳交在你那根被称为肉棒的巨大、下流的东西上感觉有那么好吗？]伊莎贝拉一边挑逗着，一边交替收缩着两边的臀瓣，迫使你的" + get_player().cockDescript(_loc1_) + "在两团丰满臀肉的夹击下弯曲。她继续说道，[say: 你脸上的表情真下流，像狗一样流着口水。这就是拥有一根大肉棒对你的影响吗？它是不是让你如此饥渴、意志薄弱，以至于你会把精液浪费在我的屁股上？]伊莎贝拉停止了来回的收缩，开始上下弹跳。她柔软、收缩的臀瓣抚摸着你的" + get_player().cockDescript(_loc1_) + "，从根部");
            }
            if(get_player().cocks[_loc1_].cockLength > 48)
            {
               outputText("一直到她能触及的高耸肉棒的最高处");
            }
            else
            {
               outputText("直到" + get_player().cockHead(_loc1_));
            }
            outputText("。随着她的动作，你那因情欲而超载的颤抖身体发出了一声痛苦的呻吟。[pg]");
            outputText("当快感席卷你丰满的身体时，你紧紧抓住椅子，呜咽着，[say: 要……要……要射了……][pg]");
            outputText("伊莎贝拉伸手到两腿之间，去");
            if(get_player().balls > 0)
            {
               outputText("捏住了你的蛋蛋");
            }
            else if(get_player().hasVagina())
            {
               outputText("揉捏着你湿透的阴户和[clit]");
            }
            else
            {
               outputText("抚摸着你的会阴");
            }
            outputText("。她用悦耳的声音戏弄你，带着一丝轻蔑的意味，[say: 这么快就要射了？很[w]好，那就继续[th]吧。让你那恶心、淫荡的鸡巴控制你吧。我能感觉到它在[if (isabellaAccent) {唔的|我的}]屁股上滴滴答答。照你那肥大、粗壮的鸡巴的吩咐去做，射在伊莎贝拉妈妈的屁股上吧。又大又粗的鸡巴似乎总是射得[w]太快了。][pg]");
            outputText("你浑身颤抖，努力保持静止以延长快感，但[eachcock]却在上下抽动，不顾一切地在伊莎贝拉火热湿滑的臀谷中摩擦。" + get_player().cockHead(_loc1_) + "像飓风中的旗杆一样在上方跳动，你再也无法忍受了。你要射了……射得非常猛烈。你全身紧绷，背部因用力而微微弓起。伊莎贝拉滑到你那根抽搐的肉棒底部，继续在她古铜色的臀瓣间滚动你的" + get_player().cockDescript(_loc1_) + "，导致你喷发的精液在空中形成慵懒的“S”形，然后溅落在她起伏的臀部上。");
            if(get_player().cumQ() <= 200)
            {
               outputText("你的巨根给她的屁股涂上了一层漂亮的糖霜，不过这位牛娘在你射完之前就站了起来，让最后一股精液无力地滴在你的肚子上。");
            }
            else if(get_player().cumQ() <= 500)
            {
               outputText("你的巨根喷出的浓稠精液很快就把她的屁股完全覆盖了，不过她从你身上站了起来，让你把最后几滴精液喷在自己的肚子上。");
            }
            else
            {
               outputText("她的屁股、背部、头发和你自己的胯部很快就被你射出的精液淹没了。这位牛娘似乎并不介意纵容你，但当精液顺着她粗壮的大腿流下时，她站了起来，让你用最后的精液涂抹自己的肚子。");
            }
            outputText("[pg]");
            outputText("伊莎贝拉呻吟着，双手在她臀部的曲线上揉搓，将精液涂抹在她巧克力色的皮肤上。她甚至抓起一把多余的精液，涂抹在她滴水的阴户上，在走开时因自己无声的高潮而颤抖，双腿因快感而微微呈O型。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,378,1);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,379,FlagDict_Impl_.arrayReadInt(_loc2_,379) + 1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function registerTags() : void
      {
         registerTag("isabellaonherb",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2212) == -1));
         registerTag("isabellapregnancy",TagFun_Impl_.fromInt(get_isabellaScene().pregnancy.get_event()));
         registerTag("w",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 100 ? TagFun_Impl_.fromString("v") : TagFun_Impl_.fromString("w"));
         registerTag("th",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 100 ? TagFun_Impl_.fromString("z") : TagFun_Impl_.fromString("th"));
      }
      
      public function receiveAllTheCowTOngues() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         outputText("当你同意时，伊莎贝拉把你拉到她的腿上。你靠在她身上，你们俩陷进她那张大椅子的毛绒垫子里；");
         if(get_player().get_tallness() <= 78)
         {
            outputText("你几乎被伊莎贝拉那巨大的乳肉堆所吞没，滑入她那巨大、充满乳汁的双峰之间。");
         }
         else
         {
            outputText("伊莎贝拉在你的脖子上蹭了蹭，你巨大的身躯几乎把她压进了椅子里。");
         }
         outputText("牛娘温柔地将双臂环绕在你的身体上，手指顺着你的两侧向上走到你的胸前。她托起你的[chest]，挤压和抚摸着你敏感的肌肤。她强壮的手指陷入你的乳房，直到你发出一声轻柔的呻吟，在她的刺激下因快感而喘息。");
         outputText("[pg]你感觉到一股出乎意料的强烈的淫液从你的[pussy]中流出，弄脏了你的大腿，流到了伊莎贝拉斑驳的皮肤上。看到你的汁液溅到她身上，伊莎贝拉特别粗暴地捏了捏你的乳房，并掐住你的乳头[if (isLactating) {，导致一股浓稠的奶油状母乳从你体内喷涌而出}]。");
         if(isabellaAccent())
         {
            outputText("[say: 我希望你还没想着要高潮，我的朋友，]她责备道，稍微温柔地揉捏着你的乳肉。[say: 毕竟，我们甚至还没开始舔小穴呢……]");
         }
         else
         {
            outputText("[say: 我希望你还没想着要高潮，[name]，]她责备道，揉捏你乳肉的动作稍微轻柔了一些。[say: 我们还没到最精彩的部分呢……]");
         }
         outputText("[pg]你试图克制自己，但她的服侍几乎让你无法招架——对于伊莎贝拉这样有着如此丰满乳房的牛娘，你还能指望什么呢，当然是极致的专业技巧！当你咬住下唇时，她继续对你的[chest]发起攻势；她努力的重点转移到了你那敏感得无可救药的乳头上，挤压并捏弄着[if (isLactating) {，直到乳汁顺着你的胸膛自由流淌，给你洗了个名副其实的牛奶浴}]。你不堪重负地哭喊着，用力向后靠在伊莎贝拉的胸前，力道大得让她也漏出了乳汁，温热的牛奶涂满了你的[skinfurscales]。");
         if(isabellaAccent())
         {
            outputText("[pg][say: 嗯，我想这样就足够了，]");
         }
         else
         {
            outputText("[pg][say: 嗯，我想这样就足够了！]");
         }
         outputText("伊莎贝拉说着，抓住你的肩膀，展示出她惊人的力量，将你们俩翻转过来，让你坐在她的椅子上，而她则跨坐在你身上。");
         outputText("[say: 该上主菜了，]");
         outputText("她补充道，用她那宽大的牛舌舔了舔嘴唇。她[if (isBiped) {分开了你的[legs]|调整了你的下半身}]，让你的[pussy]暴露在外，那里已经被你的淫液浸透，乞求着被填满或取悦。");
         outputText("[pg]伊莎贝拉温柔地将脸凑到你的腹股沟上方，开始吹气，一阵凉风拂过，让你不禁打了个寒颤。你因这轻微却愉悦的感觉而喘息颤抖，当伊莎贝拉将另一口呼吸吹向你的[clit]，用温暖有力的气流冲刷你的快感开关时，你的心脏在胸腔里狂跳。与此同时，伊莎贝拉将双手放在你小穴的两侧，拉紧你的阴唇——又一股淫液从你的通道中漏出，在她的椅子布料上留下了一块污渍。");
         outputText("[pg][say: 啧！调皮的女孩，]伊莎贝拉笑着说，尽管那吸水材料已经将湿润的斑点吸收得仿佛从未发生过一样。");
         if(isabellaAccent())
         {
            outputText("[say: 看来我们得教教你注意别到处乱漏！]");
         }
         else
         {
            outputText("[say: 看来我得教教你注意别到处乱漏！]");
         }
         outputText("[pg]作为“惩罚”，伊莎贝拉把嘴直接凑到你的[pussy]上，让她那巨大宽阔的舌头伸出来，几英寸几英寸地从她嘴里涌出，直到你的小穴被这温暖湿润的肌肉覆盖。当伊莎贝拉从下到上进行了一次漫长而缓慢的舔舐，将她那令人愉悦的柔软舌头拖过你敏感的血肉，并以对你[clit]的挑逗性弹拨结束时，你呻吟出声，这几乎让你濒临崩溃。");
         outputText("[pg]你设法将手指从椅子的扶手上移开，当伊莎贝拉收回舌头时，你将双手放在她的头上，强迫她退后。牛娘的眼睛睁大了一瞬，但还是任由你引导她的脸埋进你的小穴，并顺从地开始认真舔舐。伊莎贝拉的舌头几乎是从嘴里飞出来的，在你的[pussy]上发出啧啧的水声。当她巨大的牛舌舔舐你颤抖的小穴时，你放纵地呻吟着，它宽大的尖端偶尔滑过你的阴唇，舔舐你的内壁，将闪电般的快感从你的腹股沟传到你的脊椎，当她深入你体内时，你大声叫了出来。");
         outputText("[pg]你能感觉到高潮正在快速逼近。你的手指深深陷入伊莎贝拉的头皮，把她的脸更深地推入你的胯部，好让她那巨大的舌头能更深入你体内一点。最后，你感觉到她舌头的最尖端弹拨到了你的子宫颈口。");
         outputText("[pg]那对你最深处的触碰让你彻底爆发。你大叫着高潮了，死死夹住伊莎贝拉的头和舌头，让她无法拔出，被困在其中。你将淫液喷射在她的脸上和头发上，用你的汁液将她浸透，同时你挺动着臀部");
         if(get_player().getClitLength() < 1)
         {
            outputText("，你的阴蒂在她的鼻子上摩擦，");
         }
         outputText("直到你终于用足够的淫水将她浸透，才放她出来。");
         outputText("[pg]当她退出时，你闷哼了一声，但你的高潮还在继续，直到你变成了一个半昏迷的废人，在伊莎贝拉的椅子上扭动着，而这头母牛则居高临下地看着你，脸上带着自我满足的笑容。");
         if(isabellaAccent())
         {
            outputText("[say: 那么，感觉如何，[name]？]");
         }
         else
         {
            outputText("[say: 那么，你觉得怎么样？]");
         }
         outputText("她娇羞地问道，舔掉脸颊上的一点你的女性喷雾。");
         outputText("[pg]你虚弱地朝她竖起大拇指，然后在她舒适的椅子上昏睡过去，小憩了一会儿。");
         if(isabellaAccent())
         {
            outputText("她有些困惑，但还是离开了，回来时端着一杯饮料，放在你旁边，然后让你继续休息。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nursingCheck() : Boolean
      {
         if(get_isabellaScene().totalIsabellaChildren() > 0)
         {
            if(get_game().time.get_totalTime() == Math.abs(lastNursingCheck))
            {
               return lastNursingCheck > 0;
            }
            lastNursingCheck = int(get_game().time.get_totalTime());
            if(Utils.rand(2) == 0)
            {
               return true;
            }
            lastNursingCheck *= -1;
            return false;
         }
         return false;
      }
      
      public function noToIsabellaTF() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2213) == 0)
         {
            outputText("你告诉伊莎贝拉，你认为她应该保持现在的样子——至少，在你考虑清楚之前。这位牛娘看起来很感激，理解地点了点头，把魔石重新包好收了起来。你找了个借口离开，漫步回到你营地的那一边，思考着这件事。");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,2213,0.5);
            doNext(playerMenu);
            return;
         }
         outputText("你决定最好让伊莎贝拉保持原样，转而问她点别的事情。");
         doNext(isabellaTalkMenu);
      }
      
      public function noMilkingMilky() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你对伊莎贝拉咧嘴一笑，把她拉到你身边。你一只手搂住她的腰，告诉她这只是权宜之计；从现在起，你将负责满足她所有的需求。为了强调你的观点，你");
         if(get_player().cor > 50)
         {
            outputText("粗暴地抓住");
         }
         else
         {
            outputText("温柔地抚摸");
         }
         outputText("她左乳上敏感的乳头；她在你的抚摸下");
         if(get_player().cor > 50)
         {
            outputText("痛苦地");
         }
         outputText("发情地呻吟起来，因为在惠特尼面前上演这样一出戏而羞红了脸。农夫耸了耸肩。[say: 你们自便。如果需要的话，挤奶器就在这里。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,375,-2);
         get_inventory().takeItem(get_consumables().IZYMILK,get_camp().returnToCampUseOneHour);
      }
      
      public function moveTheBitchIn() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你一头，伊莎贝拉就笑了，她把盾牌从地里拔出来，在她的地毯上掀起了一阵泥土和卵石的小雪崩。这位勤劳的牛娘立刻开始收拾东西。[say: 反正也该搬出这个小营地了，]她一边把椅子折叠成一个箱子一边宣布。你饱览了她丰满的臀部，随着伊莎贝拉的每一个动作，那丰满的臀部都在前后摇晃和抖动。这几乎令人着迷，即使它半隐藏在她橄榄色的裙子下。微风吹起裙摆的一部分，虽然没有吹得很高，但你还是带着好奇、茫然的目光注视着。[pg]");
         outputText("伊莎贝拉发现你在盯着她看，给了你一个性感迷人的眼神，问道：[say: 嗯，你看到你喜欢的东西了吗，[name]？你喜欢在我工作的时候看着我的屁股吗？如果是这样的话，一旦我搬进去，我们就什么也做不成了！]你犹豫地抬起头看着她的脸，她笑了起来，声音像铃铛一样清脆。[say: 如果你想的话，你可以那样看着我，但我更希望你帮我搬这些东西，]牛娘提到。你苦笑着帮你的");
         if(get_camp().hasCompanions())
         {
            outputText("最新的");
         }
         outputText("营地追随者收集并把她的财产搬到你的营地。这花了将近一个小时的时间，但所有的装饰都跟着你，所以这可能是值得的。");
         outputText("[pg]<b>（伊莎贝拉已添加到恋人菜单中。）</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2219,240);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,368,100);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,369,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,370,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milktasticLacticLactation() : void
      {
         registerTags();
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("[say:[if (isabellaAccent) {哦，我的奶子……|哦，我的奶子……}]][pg]");
         outputText("伊莎贝拉的呻吟声分散了你的注意力，你转头看去。她正小心翼翼地揉着自己的乳房，用手指试探着她那奇怪的乳头，疼得皱起了眉头。你要去看看她吗？");
         doYesNo(izzyMilkingMeinMilkersMya,izzyMilkYourselfDamnit);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function judgmentalGhost() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         outputText("[say: 哦，勇者！] 夺魂者插话道。[say: 你真的对你自己的宝宝做了那种事吗？]");
         outputText("[pg]怎么，她现在要批评[i:你]的性癖了吗？");
         outputText("[pg][say: 不是那个；你知道我喜欢走极端，我只是从来没有在那种事情上走得[b:那么]远。] 舒尔德拉的声音渐渐变小，带着一种奇怪的节奏。[say: 老实说，那很……]");
         outputText("[pg]一阵奇怪的寒意流遍你的脊背，你从这个灵魂身上感觉到某种兴奋。");
         outputText("[pg][say: [b:刺激。]] 她总结道。死了这么久，真的能挑战获得快感的极限。");
         saveContent.ghostJudged = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izzyTentacleRapeBool() : Boolean
      {
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:int = 0;
         var _loc2_:int = get_player().cockTotal();
         while(_loc1_ < get_player().countCocksOfType(CockTypesEnum.TENTACLE) && _loc2_ > 0)
         {
            _loc2_--;
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE && get_player().cocks[_loc2_].cockLength >= 24)
            {
               _loc1_++;
            }
         }
         if(_loc1_ >= 3)
         {
            return true;
         }
         return false;
      }
      
      public function izzyMilkingMeinMilkersMya2() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("没过多久，伊莎贝拉就在你的隔间里就位了，你帮她系好安全带，接上吸奶杯。机器嗡嗡作响，将她沉重的身体举到半空中");
         if(get_player().thickness <= 50)
         {
            outputText("伴随着嘎吱嘎吱的吃力声，因为它最初是根据你苗条的身材校准的");
         }
         else
         {
            outputText("惊人地快，因为它已经设定为你更重的体型");
         }
         outputText("。过程正式开始，当吸力作用在她被手指摩擦过的乳头上时，伊莎贝拉呻吟起来。");
         if(isabellaAccent())
         {
            outputText("[say: 哦，我的乳房……感觉好像快要爆开了！][pg]");
         }
         else
         {
            outputText("[say: 哦，我的乳房……感觉好像快要爆开了！][pg]");
         }
         outputText("果然，伊莎贝拉象牙色的母乳先是滴落，然后喷涌而出，顺着管子流进饥渴的机器里。叮当作响的吸奶过程持续了将近一个小时，随着乳房压力的减轻，伊莎贝拉的呻吟很快变成了如牛般的如释重负的吼叫。过了一会儿，你注意到身后谷仓地板上传来另一个人轻柔的脚步声，你回头看去。[pg]");
         outputText("[say: 嘿，[name]！还有嘿，伊莎贝拉；好久不见了！] 惠特尼说道。[say: 我还以为只有你在用机器呢，] 她歪着头看着你，[say: 但当我听到谷仓门外飘出不同的声音时，我差点把正在扔的马厩粪便掉在地上！我偷偷溜进谷仓，才认出是谁！我看你还是像以前一样沉浸在挤奶中，亲爱的。] 这位犬娘偷偷瞥了一眼伊莎贝拉的裙子，那里有一股淫液弄脏了前面。[pg]");
         outputText("这位牛娘满脸笑容，吐着舌头，仍然设法向农夫轻快地点了点头。[saystart]");
         outputText("[Th]没错，我——哦——有太多的事情要做，以至于我没有时间排空哦-哦-出我-我-我的……我的……哞哞大奶子！啊，啊，啊！[sayend] 伊莎贝拉抽搐着，弓起背，她裙子前面的黑斑明显变大了；她刚刚因为排空了大量的乳汁而高潮了！惠特尼注意到你在盯着看，苦笑了一下，拍了拍你的肩膀。[say: 以前也经常发生这种事，] 她低声说。[say: 她会在一周后进来抱怨她的奶子有多痛，把机器弄得全是奶，自己也爽得喷水。我提议让她住在农场里，这样她就不用等那么久了，但她听不进去。我想她太独立了；就像你一样。] 惠特尼把手拿开，走到装瓶站，把它打开。[pg]");
         outputText("随着奶流减弱，背带将面色潮红、气喘吁吁的伊莎贝拉放到了地上。你走过去查看她的情况，她虚弱地伸出双臂抱住你，用她那依然赤裸但已得到释放的乳房蹭着你，并给了你一个湿漉漉的吻。[say: 哦，[name]，太感谢你提醒我这个地方了。][pg]");
         outputText("惠特尼回来了，递给你们俩温热的牛奶瓶。[say: 给你们：刚从泵里抽出来的。伊莎贝拉，你觉得你以后会经常来吗？我可以把你的旧隔间留出来。][pg]");
         if(isabellaAccent())
         {
            outputText("女战士用力地点了点头。[say: 是的，这对我现在这么忙有很大帮助！这样可以吗，[name]？我每天来一次，减轻我乳房的压力？][pg]");
         }
         else
         {
            outputText("女战士用力地点了点头。[say: 是的，这对我现在这么忙有很大帮助！这样可以吗，[name]？我每天来一次，减轻我乳房的压力？][pg]");
         }
         outputText("你");
         if(get_player().cor > 50)
         {
            outputText("短暂地考虑过直接禁止她，以便再次看到她脸上那种痛苦又愉悦的绝美表情，但你觉得她不会答应。");
         }
         else
         {
            outputText("觉得只要她还有剩下的能解你的渴，这也没什么问题，但问题就在这里，不是吗？");
         }
         outputText("你怎么说？");
         menu();
         addButton(0,"允许",AllowIzzyMilkerUse);
         addButton(1,"我的！",noMilkingMilky);
      }
      
      public function izzyMilkingMeinMilkersMya() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(get_player().cor < 50)
         {
            outputText("关切地");
         }
         else
         {
            outputText("漫不经心地");
         }
         outputText("，你走过去看看是怎么回事。她抬头看着你，平时总是挂着开朗笑容的脸上此刻布满了痛苦。[saystart]");
         if(isabellaAccent())
         {
            outputText("啊，[name]……我已经好久没有被好好挤过奶了，我可怜的乳房现在涨得前所未有的大。我一直试着自己释放压力，但我每天要做的事情太多了，根本没有足够的时间，而且我的乳头也变得很痛，对吧？");
         }
         else
         {
            outputText("啊，[name]……我已经好久没有被好好挤过奶了，我可怜的乳房现在涨得前所未有的大。我一直试着自己释放压力，但我每天要做的事情太多了，根本没有足够的时间，而且我的乳头也变得很痛。");
         }
         outputText("[sayend][pg]");
         outputText("她说得对；她的奶子比你见过的任何时候都要大，与其说是在晃动，不如说是在发出清晰的晃水声。你同情地皱起眉头，她则用充满希望、泪汪汪的眼神注视着你。[saystart]");
         if(isabellaAccent())
         {
            outputText("你觉得你能帮我挤挤奶吗？里面肯定存了一个多星期的量了！[sayend][pg]");
         }
         else
         {
            outputText("你觉得你能帮我挤挤奶吗？里面肯定存了一个多星期的量了！[sayend][pg]");
         }
         outputText("虽然一想到能喝到她那起泡的奶油般香甜的乳汁你就垂涎欲滴，但你完全怀疑自己是否有能力在不引起糖休克的情况下处理掉这么多奶水，于是你把这告诉了她。她垂头丧气地开始抽泣，大声哭诉道：[say:[if (isabellaAccent) {那——吸溜——我|那——吸溜——我}]该拿我这些奶水怎么办啊？呜呜呜！][pg]");
         outputText("看到这位骄傲的女战士如此情绪失控，真是");
         if(get_player().cor < 33)
         {
            outputText("让你于心不忍，但你很快");
         }
         else
         {
            outputText("其实让你觉得有点兴奋，但最终你还是");
         }
         outputText("决定了解决她问题的方法；去一趟惠特尼的农场，在你的挤奶隔间里待上几个小时，把那些压力都释放出来。你迅速宣布了拯救她的方案——并忍住了摆出英雄姿势的冲动——伊莎贝拉从座位上跳起来，一把抱住你，当她酸痛的乳头撞到你的[chest]时，她疼得缩了一下。[pg]");
         outputText("[say: 哦，[name]，我完全忘了[th]那些挤奶器，[w]因为营地里的[th]那些[w]活儿！是的，我们马上去[th]那儿吧！][pg]");
         doNext(izzyMilkingMeinMilkersMya2);
      }
      
      public function izzyMilkYourselfDamnit() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,375,0);
         get_camp().returnToCampUseOneHour();
      }
      
      public function isabellasAppearance() : void
      {
         clearOutput();
         if(get_isabellaScene().pregnancy.get_isPregnant())
         {
            switch(get_isabellaScene().pregnancy.get_event())
            {
               case 0:
               case 1:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣是透明的白色丝绸，几乎什么也遮不住，尤其是她那奇特的四头乳头。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。自从你们决定要个孩子以来，几乎没有什么变化。尽管伊莎贝拉已经停用了避孕草药，");
                  if(get_player().cumQ() >= 500)
                  {
                     outputText("加上你强大的造人能力，");
                  }
                  outputText("你还是忍不住怀疑你的种子是否已经“种”在了这位牛娘的子宫里。");
                  break;
               case 2:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。自从你们做了那事之后，你经常发现她坐在她那丰满结实的臀部上。");
                  if(get_player().lib >= 60)
                  {
                     outputText("每当风吹得恰到好处时，你偶尔能欣赏到她双腿间那润滑良好的女性私处。");
                  }
                  outputText("你好几次问她是否还好，但她向你保证只是脚踝肿了。伊莎贝拉的上衣是透明的白色丝绸，几乎什么也遮不住，尤其是她那奇特的四头乳头，以及你希望是微微隆起的孕肚。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
                  break;
               case 3:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣是透明的白色丝绸，紧紧贴在她隆起的肚子上，几乎什么也遮不住，尤其是她那奇特的四头乳头。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色，除了她现在总是泛红的脸颊。在你的余光中，你发誓她一直在盯着你看。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
                  break;
               case 4:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的步态有些不稳，你只能猜测是因为她怀着珍贵的新生命导致重心发生了偏移。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣是透明的白色丝绸，已经很难包裹住她圆润的肚子了。你不确定，但你发誓她的乳房也肿胀了起来。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。她偶尔会举起双手揉揉太阳穴，以缓解又开始发作的头痛。");
                  break;
               case 5:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她现在走路已经没有太大困难了，你必须承认她很会带孩子。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣已经包不住她的大肚子了，肚子从下面微微凸出。看着她四头乳头附近不断湿润的污渍，你觉得喉咙有些发干。看来怀孕增加了她本来就很强的产奶量。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。当你看到她因身体抽筋而退缩时，你忍不住感到难过。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
                  break;
               case 6:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣是由上等丝绸制成的，紧紧贴在她最近变大的胸部和肚子上。不幸的是，对于这件曾经精美的衣服来说，牛娘增加的泌乳量弄脏了这件白色衬衫。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。你经常发现自己在回避她的目光。你记得听说过英格纳姆的母亲们会经历情绪波动，但没有什么能让你为这做好准备！似乎当她不对你大喊大叫时，她就会让你窒息。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
                  break;
               case 7:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。你很惊讶她最近吃得这么多，还能保持身材。当你再次听到她肚子咕咕叫时，你在心里记下稍后要检查一下你的食物储备。伊莎贝拉的上衣是由上等丝绸制成的，曾经是纯白色的，与她的皮肤形成了鲜明的对比。现在这件脆弱的衣服看起来快要裂成两半了！她那紧绷的衣服几乎包不住她的乳房，她的肚子几乎完全从下面凸出来，这位牛娘让她的上衣滑过隆起的肚子，以防止它被撕裂。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。尽管外面相对凉爽，但她的额头上还是挂着一层细汗。她甚至还有一对牛耳，不时地前后扇动。");
                  break;
               case 8:
                  outputText("伊莎贝拉现在似乎睡得更多了。看来怀孕极大地消耗了她的精力。这位牛娘站立时大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉不再穿她那件精美的丝绸衬衫，不想再损坏它。每当她移动时，她那傲人的胸部就会微微摇晃，她的乳头因为冷空气而挺立起来。她不断地抚摸着她那圆润的肚子，偶尔会瞥你一眼。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。女人的脸上洋溢着纯粹的满足和幸福。似乎尽管经历了所有的艰辛，她还是无比快乐。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
                  break;
               case 9:
               case 10:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。这个高大的女人站立时膝盖微微发抖。你发现自己盯着这位牛娘那裸露的巨大胸部，随着她的每一次呼吸而起伏，她那可怜的奇特乳头不断地渗出乳汁，让她那像瓜一样的肚子变得光滑发亮，已经准备好喂养你的后代了。偶尔，你会听到这位牛娘在抚摸她那肿胀的大肚子时发出的咯咯笑声。进一步询问后，她只是回答说“它踢了我”。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。伊莎贝拉似乎患有慢性阵痛（也许是假性宫缩？），但当她看到你看着她时，她仍然能挤出微笑。你觉得应该快了。");
                  break;
               default:
                  outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣是透明的白色丝绸，几乎什么也遮不住，尤其是她那奇特的四头乳头。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
            }
         }
         else
         {
            outputText("这位牛娘大约有[if (metric) {两又四分之一米|七英尺半}]高。她的双脚是蹄子，腿上还长着一部分皮毛。她的橄榄色裙子只遮住了她那暗褐色、带有斑点的丰满大腿的上半部分，随着她臀部的摇曳，裙摆迷人地散开。伊莎贝拉的上衣是透明的白色丝绸，几乎什么也遮不住，尤其是她那奇特的四头乳头。与她身体的其他部分不同，她的脸上没有黑白相间的斑点，而是纯粹的巧克力色。两只小小的牛角从她那乱蓬蓬的红色卷发中探出。她甚至还有一对牛耳，不时地前后扇动。");
         }
         doNext(callForFollowerIsabella);
      }
      
      public function isabellasAccentCoaching() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,373) > 1)
         {
            outputText("伊莎贝拉摇了摇头说：[say:Nein。我现在不想把时间花在这上面。]");
            doNext(callForFollowerIsabella);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) == 0)
         {
            outputText("你告诉伊莎贝拉，你想给她上课，以减少她的口音，让她更容易被理解。她双臂交叉在胸前抗议道：[say:你也有口音，nein？][pg]");
            outputText("你轻笑了一下，点了点头，但指出你的口音比她更接近这片土地上的人。她虽然不情愿，但还是同意了。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,372,1);
         }
         var _loc2_:Number = get_player().get_inte() / 5 + Utils.rand(9);
         var _loc3_:int = 0;
         if(_loc2_ < 12)
         {
            _loc1_ = Utils.rand(3);
            if(_loc1_ == 0)
            {
               outputText("你花了一个小时和伊莎贝拉交谈，但最终，你发现几乎没有取得任何进展。这位牛娘似乎对失败感到有些沮丧，但她还是给了你一个大大的拥抱。");
            }
            else if(_loc1_ == 1)
            {
               outputText("尽管你努力教导这位异国牛娘，但她似乎没有任何进步。最糟糕的是，当你纠正她时，她总是无精打采地瘫坐着，这只会让她的胸部晃动，乳沟看起来比以前更深了。到你们结束时，你已经完全分心了。");
               dynStats(DynStat.Lust(10));
            }
            else
            {
               outputText("无论你做什么，你都无法让这位平时勤奋的牛娘现在集中注意力。她显然对你教她的尝试感到无聊，她把整节课的时间都花在用身体挑逗你上。这比你愿意承认的还要有效");
               if(get_player().hasCock())
               {
                  outputText("，当你结束课程离开时，你的下半身感到一阵僵硬。");
               }
               else if(get_player().hasVagina())
               {
                  outputText("，当你结束课程离开时，你的内裤已经湿透了。");
               }
               else
               {
                  outputText("。");
               }
               dynStats(DynStat.Lust(25));
            }
         }
         else if(_loc2_ < 14)
         {
            _loc1_ = Utils.rand(2);
            if(_loc1_ == 0)
            {
               outputText("你花了一个小时和伊莎贝拉一起复习她的语言和措辞。她似乎取得了一点进步，这让她很高兴，但你觉得从大局来看，她可以做得更好。");
            }
            else
            {
               outputText("你和伊莎贝拉一起复习她的用词，并试图在她用错词或滑入母语时纠正她。她似乎取得了一点进步，但她低垂的眼睛表明她觉得自己本可以做得更好。");
            }
            _loc3_ = 4 + Utils.rand(5);
         }
         else if(_loc2_ <= 20)
         {
            _loc1_ = Utils.rand(2);
            if(_loc1_ == 0)
            {
               outputText("你花了一个小时试图教伊莎贝拉如何正确说话。虽然她经常因为自己的错误而感到慌乱，但她在这节课上取得了显著的进步。当你们俩结束时，她似乎对自己很满意。");
            }
            else if(_loc1_ == 1)
            {
               outputText("你和伊莎贝拉一起复习她的用词，并试图在她用错词或滑入母语时纠正她。这需要一些时间，但你很高兴地告诉伊莎贝拉，她似乎取得了显著的进步。");
            }
            _loc3_ = 8 + Utils.rand(8);
         }
         else
         {
            _loc1_ = Utils.rand(2);
            if(_loc1_ == 0)
            {
               outputText("你和伊莎贝拉坐下来再次练习她的语言。她非常投入这节课，这位牛娘在减少口音方面迈出了一大步。");
            }
            else
            {
               outputText("你和伊莎贝拉一起复习她的用词，努力减少她的口音。很快，这位牛娘就用全神贯注的眼睛看着你，当你帮助她掩饰口音以匹配周围的人时，她对你的每一句话都言听计从。");
            }
            _loc3_ = 12 + Utils.rand(10);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) + _loc3_ >= 100)
         {
            outputText("[pg]伊莎贝拉自豪地说：[say: 我想我已经学会了你要教的一切，[name]。]你对她取得的进步微笑并鼓掌。[b:你几乎没有什么可以教她的了。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 90 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) + _loc3_ >= 90)
         {
            outputText("[pg][b:伊莎贝拉在努力时通常可以不带口音地说话，尽管她似乎还没有在日常对话中这样做。不过她已经很接近了！]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 75 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) + _loc3_ >= 75)
         {
            outputText("[pg][b:伊莎贝拉有时会在上课时说出一两句没有任何错误的句子。这是很好的进步！]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) + _loc3_ >= 50)
         {
            outputText("[pg][b:伊莎贝拉已经获得了足够的语言控制能力，可以正确地说话……如果她说话的速度只有平时的一半的话。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 25 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) + _loc3_ >= 25)
         {
            outputText("[pg][b:伊莎贝拉在你的课上变得越来越好。通常，如果她停下来思考她刚才说的话，她就能挑出大部分错误。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) + _loc3_ >= 10)
         {
            outputText("[pg][b:伊莎贝拉已经取得了足够的进步，如果她仔细思考，她有时会自己发现错误。]");
         }
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,372,FlagDict_Impl_.arrayReadInt(_loc4_,372) + _loc3_);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,372,100);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,373,4 + Utils.rand(13));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isabellaTalksAboutPotentialPregnancy() : void
      {
         registerTags();
         spriteSelect(SpriteDb.get_s_isabella());
         outputText("[pg]当你走向你的" + (get_camp().homeDesc() == "cabin" ? "床" : "睡袋") + "，期待着又一个漫长的一天结束时，你注意到伊莎贝拉走了过来，对于这位牛娘战士来说，她显得异常紧张。你向她打招呼，问她是不是有什么事。");
         outputText("[pg][say: 啊，[name]，我正希望能见到你，]她回答道。她紧张地看着地面，用一只分趾的蹄子刨着干燥的泥土，突然脱口而出，[say: 你对孩子有什么看法，[name]？]");
         outputText("[pg]你惊讶地看着她，问她为什么要问你这个。伊莎贝拉依然保持着紧张的神情，然后尴尬地开口道：[say: 我……嗯，我一直以为，总有一天，我会有一个家庭，但首先我必须找到一个值得托付的男人，然后就是冒险，而且……嗯，在来到这个世界之前，我一直没有机会。但是，现在我有了你……我明白有很多理由不这么做，但是，如果你真的想和我组建一个家庭，我愿意。好吗？我只是想告诉你这些，希望你能记住[if (!isabellaAccent) {这事}]。]");
         outputText("[pg]说完这些，这位牛娘战士匆忙撤退，让你去睡觉。不可否认，这让你在睡觉时有了一些思考。");
         outputText("[pg]<b>你现在可以和伊莎贝拉谈论她是否应该采取避孕措施了。</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2219,-1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2212,-1);
      }
      
      public function isabellaTalkMenu() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("你想和伊莎贝拉讨论什么？");
         if(get_debug())
         {
            outputText("[pg]<b><u>调试：</u></b>");
            if(int(get_isabellaScene().isabellaOffspringData.length) > 0)
            {
               _loc1_ = 0;
               while(_loc1_ < int(get_isabellaScene().isabellaOffspringData.length))
               {
                  outputText("\n类型：" + int(get_isabellaScene().isabellaOffspringData[_loc1_]) + "; 年龄：" + (get_game().time.days - int(get_isabellaScene().isabellaOffspringData[_loc1_ + 1])) + "天" + (get_game().time.days - int(get_isabellaScene().isabellaOffspringData[_loc1_ + 1]) == 1 ? "" : ""));
                  _loc1_ += 2;
               }
            }
         }
         menu();
         addButton(0,"聊天",get_isabellaScene().talkWithIsabella).hint("和伊莎贝拉聊聊天打发时间。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2219) == -1)
         {
            addButton(1,"避孕措施",toggleIsabellaContraceptives).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2212) == 1 ? "告诉伊莎贝拉开始使用避孕草药。这应该能防止伊莎贝拉怀孕，尽管它不能取消任何现有的怀孕。" : "告诉伊莎贝拉停止使用避孕草药。这将允许你让她怀孕。");
         }
         addButton(14,"返回",callForFollowerIsabella);
      }
      
      public function isabellaTakesOviElixir() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().OVIELIX);
         if(saveContent.oviElixirAmount == 0)
         {
            outputText("你递给伊莎贝拉一瓶促孕药剂，提到这会加快婴儿的发育。犹豫爬上了她的脸庞。[if (isabellaAccent) {[say: 这样好吗？伊莎贝拉不想让孩子变异……]|[say: 这样好吗？我不想让我们的孩子变异……]}]据你所知，这药剂是安全的，你向她保证了这一点。这位牛娘拿着瓶子静静地待了一会儿，然后接过来一口气喝光了。她本质上还是人类，所以你不确定你到底缩短了多少时间。");
         }
         else if(saveContent.oviElixirAmount == 1)
         {
            outputText("你又递给伊莎贝拉一瓶缩短孕期的药剂，她接在手里看着它。[say: 又来？]她问道。你想早点看到你的孩子。[say: 嗯，]她回答道，也许在早点看到孩子和更长、更自然的孕期之间犹豫不决。尽管如此，她还是毫无问题地把液体灌了下去。");
         }
         else
         {
            outputText("你从[pouch]里拿出一瓶促孕药剂递给伊莎贝拉。她接过来，猛喝了一大口，立刻把里面的东西喝光了。这位牛娘满足地揉着肚子，也许是感觉到了生长突增的发生。");
         }
         if(get_isabellaScene().pregnancy.get_incubation() > 240)
         {
            get_isabellaScene().pregnancy.knockUpForce(get_isabellaScene().pregnancy.get_type(),get_isabellaScene().pregnancy.get_incubation() - 240);
         }
         else
         {
            get_isabellaScene().pregnancy.knockUpForce(get_isabellaScene().pregnancy.get_type(),1);
         }
         _temp_1.oviElixirAmount += 1;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2216,1);
         doNext(playerMenu);
      }
      
      public function isabellaSprite() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
      }
      
      public function isabellaSparMenu() : void
      {
         var type1:int;
         var _g1:IsabellaFollowerScene;
         var type:int;
         var _g:IsabellaFollowerScene;
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,382) == 0)
         {
            outputText("当你提议切磋时，伊莎贝拉笑了，她用力地点了点头，大声说道：[saystart]");
            if(isabellaAccent())
            {
               outputText("这对我们俩都有好处，对吧！？[sayend]这位满面笑容的牛娘用手指敲了敲下巴，建议道：[say:我们应该在平原边缘布置一下，这样就不会破坏这个营地了。]");
            }
            else
            {
               outputText("这对我们俩都有好处！[sayend]这位满面笑容的牛娘用手指敲了敲下巴，建议道：[say:我们为什么不在平原边缘建一个假营地呢，这样就不会破坏这个营地了。好吗？]");
            }
            outputText("这听起来很合理。这就像是一次重温旧梦的旅行。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,382,1);
         }
         else
         {
            outputText("你提议进行一场切磋。");
         }
         if(isabellaAccent())
         {
            outputText("伊莎贝拉问道：[say:我们要下什么赌注？你是想我们点到为止，还是像这个世界的怪物那样战斗？]");
         }
         else
         {
            outputText("伊莎贝拉问道：[say:我们该怎么打？你是想我们点到为止，还是像这个世界的怪物那样战斗？]");
         }
         outputText("[pg]（你是想进行输了也没有后果的“轻度”切磋，还是想进行“重度”切磋（输赢都有完全的后果）？）");
         menu();
         _g = this;
         type = 2;
         addButton(0,"轻度",function():void
         {
            _g.sparring(type);
         });
         _g1 = this;
         type1 = 1;
         addButton(1,"重度",function():void
         {
            _g1.sparring(type1);
         });
         addButton(14,"返回",callForFollowerIsabella);
      }
      
      public function isabellaMorningWakeupCall() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,377,FlagDict_Impl_.arrayReadInt(_loc1_,377) + 1);
         var _loc2_:int = get_player().shortestCockIndex();
         outputText("[pg]");
         outputText("你幸福地叹了口气，你的梦境带上了明显的性色彩，在睡梦中，一阵阵令人愉悦的感觉萦绕在你的下半身。你的[hips]微微抽动，因为你的身体对现在僵硬的肉棒散发出的火热、愉悦的感觉做出了反应。肿胀的阴茎就像一根避雷针，在雷鸣般的快感冲击下每隔几秒钟就会颤抖一次。当你的身体开始苏醒时，你发出了一声困倦而满足的叹息。这种触觉似乎与火热、紧致的小穴如此相似，却又如此令人痛苦地不同。有时，有几个地方暴露在凉爽的晨风中，微风吹拂着你阴茎那部分皮肤，与挤压其余部分的热量形成性感的对比。[pg]");
         outputText("有一种安静、几乎听不见的黏糊糊的声音在刺激你模糊的意识，就像漏水的水龙头发出烦人的滴水声；你做了一个半梦半醒、沉醉在快感中的" + get_player().mf("男人","扶他") + "在这种情况下唯一能做的事：睁开眼睛，低头看你的腹股沟。一团卷曲的深红色头发挡住了你视线，两侧是两只向下垂的可爱牛耳。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,377) == 1)
         {
            outputText("伊莎贝拉在给你口交！？");
         }
         else
         {
            outputText("伊莎贝拉正在给你来一发她传统的早安口交。");
         }
         outputText("她巨大而柔软的舌头包裹着你的" + get_player().cockDescript(_loc2_) + "，努力提升你的快感。一缕温暖浓郁的乳汁从压在你[legs]上的沉甸甸的乳房中溢出，向你展示了她有多么享受为你口交。那团乱蓬蓬的深红色头发开始在你的下体上缓慢地上下起伏，伊莎贝拉棕色的大眼睛带着洋溢的幸福抬头看着你，她的嘴角弯起一个塞满肉棒的微笑。[pg]");
         outputText("看到这位性感牛娘调皮的目光，你忍不住大声呻吟起来。她毫不费力地把你的" + get_player().cockDescript(_loc2_) + "往喉咙深处吞吐，同时慵懒而淫荡地舔舐着你阳具的每一个部位。你的肉棒完全被她厚实的口腔器官无助地束缚着。它在她口腔肌肉的包裹中抽搐，不受控制地渗出股股先列腺液，你分泌得有多快，它们消失在伊莎贝拉喉咙里的速度就有多快。你可以看到她的双颊凹陷，因为她开始将那根被舌头包裹的肉棒深深吸入嘴里，强烈的吸力让你的" + get_player().cockDescript(_loc2_) + "对牛娘的动作变得异常敏感。[pg]");
         outputText("[say: 操！]你情不自禁地呻吟出声，挺起[hips]将你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]抵在她的下巴上，随着高潮的临近，那两颗胀满精液的肉球随着你的" + get_player().cockDescript(_loc2_) + "不断跳动和颤抖。");
         }
         else
         {
            outputText(get_player().cockDescript(_loc2_) + "完全送入她的嘴里，牛娘湿滑火热的双唇紧紧地包裹住你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("。");
         }
         outputText("伊莎贝拉把头发撩到脑后观察你的反应；她闪亮的双眼始终没有离开你的脸庞，同时她开始加倍努力，仅仅用她舌头的湿热来吞吐和抚弄你的" + get_player().cockDescript(_loc2_) + "。[pg]");
         outputText("伊莎贝拉轻声哼哼着，与其说是声音，不如说是一种轻微而缓慢的震动感。她性感的呼噜声与她舌头狂热的吞吐相结合，将你推向了极限。从身体最深处开始，你彻底屈服于她带来的快感，释放出高潮的温热。");
         if(get_player().balls > 0)
         {
            outputText("你的睾丸紧紧收缩，释放出你的精液");
         }
         else
         {
            outputText("你浑身紧绷，释放出你的精液");
         }
         outputText("射向牛娘那如真空般紧闭的双唇，喷出大量浓稠的精液填满她饥渴的小嘴。");
         if(get_player().cockTotal() > 1)
         {
            outputText("与此同时，你也从");
            if(get_player().cockTotal() > 2)
            {
               outputText("你其余的[cocks]");
            }
            else
            {
               outputText("她没有碰过的那根肉棒");
            }
            outputText("中射了出来，喷洒在你的肚子和[chest]上。伊莎贝拉一如既往地体贴，一把抓住那根抽搐的肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("并上下套弄，帮助缓解你体内残留的欲望。");
         }
         if(get_player().cumQ() < 250)
         {
            outputText("她微笑着把精液全部咽下，当喉咙吞下你最后一点咸腥的浓精时，她开心地对你眨了眨眼。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("她艰难地吞咽着，但即使以她的天赋，伊莎贝拉也无法将其全部咽下。这位嘴角流着精液的红发女郎在你结束时向你眨了眨眼，用手指收集起多余的精液并吞了下去。");
         }
         else
         {
            outputText("由于突然被强行灌入嘴里的大量精液，她发出咕噜咕噜的声音，精液从她塞满的嘴角喷涌而出。这惊人的射精量似乎丝毫没有影响到她，她只是更加用力地压下身子，放松喉咙，让你把精液直接射进她迅速鼓起的肚子里。");
            if(get_player().cumQ() >= 2000)
            {
               outputText("当伊莎贝拉的身体被精液塞得再也装不下时，连这也失败了，这位牛娘把你从她嘴里拔出来，让你把剩下的精液喷在她的脸上。在整个过程中，她的舌头就像手一样抚摸着你，鼓励你尽可能地弄得一团糟。");
            }
            outputText("一旦你结束，她向你眨了眨眼，并吸溜起一些漏出来的精液。");
         }
         outputText("[pg]");
         outputText("这位口交迷恋者的红发女郎起身时颤抖着，轻声呻吟，她满是污渍的手指从皱巴巴的裙子下抽出，手指上的痕迹清晰地显示出她的愉悦。伊莎贝拉柔滑的白色上衣完全被散发着甜香的奶油浸湿了，这股香气也同样弥漫在");
         if(get_player().cumQ() >= 2000)
         {
            outputText("沾满精液的");
         }
         outputText("在你[legs]周围留下一滩乳汁。她叹了口气，说道，[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,377) == 1)
         {
            if(isabellaAccent())
            {
               outputText("嗯，你的阴茎给我带来了如此美味的款待。只要把那根肉棒保持在我的嘴能容纳的大小，我就会很乐意每天早上照顾它，好吗？");
            }
            else
            {
               outputText("嗯，你的阴茎给我带来了如此美味的款待。只要把那根肉棒保持在我的嘴能容纳的大小，我就会很乐意每天早上照顾它，好吗？");
            }
         }
         else if(get_player().cumQ() >= 500)
         {
            outputText("美味！你为[if (isabellaAccent) {Izabella|Isabella}]妈妈射得这么猛，不是吗？[sayend]吃饱喝足的牛娘深情地捏了捏你的" + get_player().cockDescript(_loc2_) + "，然后喃喃自语道，[saystart]真好吃……");
         }
         else if(isabellaAccent())
         {
            outputText("希望你不要介意我吃点零食……");
         }
         else
         {
            outputText("希望你不要介意我吃点零食……");
         }
         outputText("[sayend][pg]");
         outputText("你瘫倒在地，紧张感从你的身体中渗出。当你能再次移动时，伊莎贝拉已经走向了她在营地的那片区域。是你的错觉，还是她今天早上的屁股摇摆得特别性感？");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1.5));
         doNext(playerMenu);
      }
      
      public function isabellaMoovesInGreeting() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,367) == 0)
         {
            outputText("当你走进伊莎贝拉的营地时，她给了你一个温暖的微笑，并将盾牌的尖锐边缘刺入地下，让它立在自己身边。她那双棕色的大眼睛里充满了对朋友的温暖和喜爱，她向你打招呼说：[say:欢迎回来，[name]。你想我了吗？][pg]");
            outputText("你");
            if(get_player().cor < 33)
            {
               outputText("微笑着承认你确实很享受和她在一起的时光。");
            }
            else if(get_player().cor < 66)
            {
               outputText("咧嘴一笑，开玩笑说她可能更想你。");
            }
            else
            {
               outputText("坏笑着想知道你是想她了，还是想她那美妙的身体了。");
            }
            outputText("伊莎贝拉深吸了一口气，然后站直了她那[if (metric) {两米多|七英尺多}]高的身体。[say:[name]，我已经深思熟虑过了，]她开始说道。[say:我想加入你的营地，协助你完成你的任务。这似乎是一项有价值的事业。]这位高大的牛娘把她那不羁的红发向后梳了梳，承认道：[say:我需要陪伴……][pg]");
            outputText("好吧，你没料到会这样。当你在思考这个想法时，伊莎贝拉扭着腰走过来给了你一个拥抱。她的乳房");
            if(get_player().get_tallness() < 80)
            {
               outputText("挤压着你的头，让你窒息在沉重、充满乳汁的乳肉中");
            }
            else
            {
               outputText("挤压着你的[chest]，每个充满乳汁的乳房上的四个坚硬乳头都压在你的乳头上。");
            }
            outputText("你脸红了，在这位深色皮肤女战士的爱意下有些扭捏，但你还是忍受了下来。[pg]");
            outputText("你要邀请她去营地吗？");
            doYesNo(moveTheBitchIn,turnDownIsabellaFollower);
         }
         else
         {
            outputText("你跌跌撞撞地走进伊莎贝拉的营地，发现她正在努力修理她的盾牌。目前她正用一把巨大的锤子敲打上面的凹痕。你到达时她几乎没有抬头，但从你所能看到的来看，这位牛娘的嘴角挂着温暖的微笑。这位深色皮肤的美女停顿了一下，抬起头问道：[say:你考虑过我的提议了吗？我们一起工作能比分开做更多的好事。]她完成了任务，将盾牌的边缘猛地插入地下，这块金属因为突然的撞击而微微震动。[pg]");
            outputText("伊莎贝拉似乎仍然认为搬进来是个好主意；你是接受她的提议，还是暂时拒绝？她似乎对这个想法并不太执着。");
            menu();
            addButton(0,"交谈",get_isabellaScene().talkWithIsabella);
            addButton(1,"喝奶",get_isabellaScene().nomOnMommaIzzysTits);
            if(get_player().shortestCockLength() <= get_isabellaScene().tinyPenis())
            {
               addButton(2,"被舔",get_isabellaScene().izzyGivesSmallWangsFreeOral);
            }
            else
            {
               addButtonDisabled(2,"被舔","她喜欢舔小鸡巴。");
            }
            addButton(3,"强暴战",get_isabellaScene().fightIsabella);
            addButton(4,"提供口交",get_isabellaScene().volunteerToSlurpCowCunt);
            addButton(5,"接受提议",moveTheBitchIn);
            setExitButton();
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,367,FlagDict_Impl_.arrayReadInt(_loc1_,367) + 1);
      }
      
      public function isabellaKnockUpAttempt() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2212) > 0 && get_isabellaScene().pregnancy.knockUpChance(30 - get_isabellaScene().totalIsabellaChildren(),90))
         {
            get_isabellaScene().pregnancy.knockUp(25,2160);
         }
      }
      
      public function isabellaGivesBirth() : void
      {
         registerTags();
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:int = 0;
         if(get_game().isabellaScene.pregnancy.allowHerm && Utils.rand(10) < 1)
         {
            _loc1_ = 3;
         }
         else
         {
            _loc1_ = 1 + Utils.rand(2);
         }
         outputText("[pg]当你准备就寝时，一声响亮的低鸣传到了你的耳朵里。这让你想起了一头痛苦的母牛，有一瞬间你发现自己在想这声音是从哪里来的。然后，理智猛击了你的大脑，你意识到肯定发生了什么，这让你飞奔穿过营地，来到伊莎贝拉的[say: 领地。]");
         outputText("[pg]在那里，正如你所料，你发现这位牛娘靠在一块方便的巨石上，脱得精光，一只手捂着肿胀的腹部。她看到了你，勉强给了你一个虚弱的微笑，但没有费心去说话。相反，随着又一次宫缩的袭来，她发出了一声非常有牛味的吼叫。你迅速走过去支持她，站在她身后，尽可能地伸出手臂抱住她，揉搓并支撑着她过度肿胀的子宫，以及里面拼命扭动、竭尽全力想要出来的婴儿。");
         outputText("[pg]终于，几个小时后，伊莎贝拉发出了最后一声痛苦的吼叫，她刚出生的孩子从她的子宫里滑了出来，落入你等待的臂弯中。");
         outputText("[pg]你手里抱着这个扭动的婴儿，是一个美丽、发育完美的人类小孩；快速看了一眼它的双腿之间，确认它是一个" + (_loc1_ == 1 ? "boy" : (_loc1_ == 2 ? "girl" : "hermaphrodite")) + "。" + babyMF("他","她",_loc1_) + "有着你[haircolor]的头发，你觉得也许还有你的眼睛，但" + babyMF("他","她",_loc1_) + "的皮肤是" + (Utils.rand(2) == 0 ? "温暖的巧克力棕色" : "乳白色") + "，就像" + babyMF("他","她",_loc1_) + "母亲的单色版本。带着充满爱意的父亲般的微笑，你向伊莎贝拉宣布了婴儿的性别，并把" + babyMF("他","她",_loc1_) + "递给了她。");
         outputText("[pg]伊莎贝拉带着充满母爱的喜悦笑容接过了" + babyMF("他","她",_loc1_) + "，现在能抱住自己的" + babyMF("儿子","女儿",_loc1_) + "，她已经忘记了分娩的疲惫。[say: " + babyMF("他","她",_loc1_) + "是不是很漂亮，[name]？]她问道。你同意" + babyMF("他","她",_loc1_) + "确实很漂亮，看着这位欣喜的新母亲将她的新生儿放在她那不断渗出乳汁的四乳头上；丰沛乳汁的气味帮助引导婴儿找到她的乳房，" + babyMF("他","她",_loc1_) + "很快就带着新生儿贪婪的热情吸吮起来。伴随着一声轻柔的用力呻吟，伊莎贝拉瘫倒在地上，靠在巨石上坐下，给她的新" + babyMF("儿子","女儿",_loc1_) + "喂奶。");
         outputText("[pg]你轻轻地为这位新妈妈和" + babyMF("儿子","女儿",_loc1_) + "拿来一条毯子，在伊莎贝拉继续哺乳的时候，用温暖柔软的毯子把他们俩裹起来。你问她还需要什么，但这位牛娘只是给了你一个幸福的微笑，摇了摇头。你轻轻地吻了吻她的脸颊，悄悄地退下，让母子俩培养感情。");
         get_isabellaScene().isabellaOffspringData.push(_loc1_);
         get_isabellaScene().isabellaOffspringData.push(int(get_game().time.days));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2216,0);
         get_isabellaScene().pregnancy.knockUpForce();
      }
      
      override public function isabellaFollower() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,369) == 1)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,371) == 0;
         }
         return false;
      }
      
      public function isabellaCowifyPrompt() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2213) == 0)
         {
            outputText("当你在和这位怀孕的战士聊天时，你注意到她摸着自己隆起的肚子时，偶尔会露出悲伤的表情，于是你问她怎么了。[say: 没什么，[name]，]她起初这样回答，但你能看出那不是实话，于是继续追问，直到她叹了口气解释道。[say: 只是，嗯……我已经不再是人类了，但是，根据我在平原上听到的，我的小宝宝们将会是人类。我不后悔放弃我的人性，但我有时确实会担心，有一个像我这样名副其实的牛娘做母亲，会对他们产生什么影响。]");
            outputText("[pg]你指出这听起来确实有点令人担忧，但是，嗯，你们俩似乎都没有办法改变这一点。");
            outputText("[pg]伊莎贝拉的脸变成了一种奇怪的表情，既高兴又紧张。[say: 嗯，那不完全正确。你看，前段时间我在平原上遇到了一个恶魔，经过一番……劝说……他们给了我一些东西。]她转过身，开始在她的物品箱里翻找，在这个过程中让你极好地欣赏了她的屁股，然后她转过身来，手里拿着一包用厚布紧紧包裹的东西。她小心翼翼地解开它，向你展示了一小块某种水晶状物质的碎片。");
            if(get_player().hasKeyItem("Marae\'s Lethicite"))
            {
               outputText("[pg]你立刻认出这是一块魔石碎片，虽然显然不如你从堕落女神那里偷来的那块强大。你告诉她，这样的水晶几乎肯定能让她真正变成她看起来那样的牛娘，并让这种特征遗传给你们的孩子。");
            }
            else
            {
               outputText("[pg]你问这水晶是什么。[say: 这叫魔石，是恶魔变形力量的源泉。]伊莎贝拉解释道。[say: 我想……我想，有了这个，我就能真正变成我现在看起来的样子，并把我的本质遗传给我们的孩子。]");
            }
            outputText("[pg]她看着你，紧张而不确定。[say: 我……我不知道什么对我们的孩子最好，[name]。告诉我，你觉得我应该用它吗？]");
         }
         else
         {
            outputText("你在想是否应该告诉伊莎贝拉把那块魔石用在自己身上……");
         }
         doYesNo(yesToIsabellaTF,noToIsabellaTF);
      }
      
      public function isabellaChildCunnilingus(param1:int = 0) : void
      {
         clearOutput();
         outputText("你紧紧抱住你的女儿，在她咯咯笑的时候在她的脸上印下亲吻。你的任何女儿都值得一个恰当的吻，所以你把她抱到一个更私密的地方让她躺下。在伊莎贝拉布置的更舒适的家具中，你轻轻地把婴儿放在一个看起来很精致的枕头上。你的女儿安静地躺在柔软的布料上，宛如和平的灯塔。你脱下伊莎贝拉给她穿上的布料，在她赤裸的身体上印下更多的吻。");
         outputText("[pg]一切准备就绪，你蹲在女儿柔软娇嫩的大腿之间；她未发育的阴唇散发出的淡淡香气让你从心底感到兴奋。你将嘴唇压在光滑丰满的外阴上，用亲吻的感觉逗弄你的女儿[if (isababyherm) {，让她的小阴茎抽动}]。当你的舌头在她年轻的阴阜之间滑动时，她的笑声开始变成困惑却又愉悦的呻吟。她婴儿般性器官的味道充满了你的上颚；即使她这么小，她仍然在刺激下变得湿润。她确实是你的女儿。你将舌头平贴在她的阴蒂上，坚定地摩擦着，同时看着她的小脚趾蜷缩起来。你试探性地引导你" + (get_player().hasLongTongue() ? "异常长的" : "") + "舌头来到她阴道的入口。伴随着谨慎而温柔的试探，舌尖滑入了[if (isababyvirgin) {她处女膜的}]微小开口。你听到女儿喘息，但你仍然没有停止前进。你的每一个动作都尽可能地小心翼翼[if (isababyherm) {，而她勃起的阴茎清楚地表明了你的成效}]。");
         outputText("[pg]当你的肉[tongue]陷入时，" + (get_player().hasLongTongue() ? "你遇到了你认为是她小小的婴儿宫颈的东西。当你轻轻吸吮她最深处，并沿着整个通道摩擦时，她发出呜咽声。" : "你的舌头撑开了[if (isababyvirgin) {处女的}]婴儿小穴。她对轻微的拉伸发出呜咽，但似乎仍然沉醉其中。") + " 抱着并按摩她丰满的身体很好地让她保持放松。然而，你没有足够的耐心保持温柔，开始来回伸缩你的舌头。每一刻速度都在加快，直到你用舌头操你的宝贝女儿。当然，就像你的任何好孩子一样，她非常接受。在口交快感的猛攻下，她颤抖着呻吟。没过多久，她就达到了彻底的高潮，发出沉重的呻吟，整个身体在性高潮的狂喜中颤抖扭动。喷涌的液体浸湿了你的嘴唇和舌头，你退了出来。她没有多少体力，但无论如何你都很高兴这样做。");
         outputText("[pg]在简单地把她擦干后，你把她带回给她母亲伊莎贝拉。");
         if(Boolean(saveContent.babyNotVirgin.contains(param1)))
         {
            saveContent.babyNotVirgin.push(param1);
         }
         dynStats(DynStat.Lust(10),DynStat.Cor(2));
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,513) > 0 && !saveContent.ghostJudged)
         {
            doNext(judgmentalGhost);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function isabellaChildCocknursingSelection(param1:int = 0) : void
      {
         var child2:int;
         var x2:int;
         var _g1:IsabellaFollowerScene;
         var child1:int;
         var x1:int;
         var _g:IsabellaFollowerScene;
         clearOutput();
         var _loc2_:int = get_player().randomCockThatFits(2,"width");
         var _loc3_:int = get_player().randomCockTooBig(2,"width");
         if(_loc2_ >= 0 && _loc3_ >= 0)
         {
            outputText("你可以用小一点的肉棒，把它塞进孩子的嘴里，或者用大一点的，让" + get_isabellaScene().getIsabellaChildGender(param1,"他","她") + "只吸吮龟头。你要用哪一个？");
            menu();
            _g = this;
            x1 = _loc2_;
            child1 = param1;
            addButton(0,"小",function():void
            {
               _g.isabellaChildCocknursing(x1,child1);
            });
            _g1 = this;
            x2 = _loc3_;
            child2 = param1;
            addButton(1,"大",function():void
            {
               _g1.isabellaChildCocknursing(x2,child2);
            });
         }
         else
         {
            if(_loc2_ < 0)
            {
               _loc2_ = get_player().smallestCockIndex();
            }
            isabellaChildCocknursing(_loc2_,param1);
         }
      }
      
      public function isabellaChildCocknursing(param1:int = 0, param2:int = 0) : void
      {
         clearOutput();
         outputText("紧紧抓住这个小巧可爱的孩子，让你的脸和腹股沟感到温暖。你带着你的小" + get_isabellaScene().getIsabellaChildGender(param2,"男孩","女孩") + "来到伊莎贝拉用来搭遮阳篷的一些岩石后面，随身带着一个相当舒适的脚凳让你的孩子坐下。你脱下[armor]的下半部分，跨坐在凳子上。对你孩子的" + get_player().mfn("父爱","母爱","父母之爱") + "迫使你再次将你的" + get_isabellaScene().getIsabellaChildGender(param2,"儿子","女儿") + "抱在脸前，然后在" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的脸颊上印下一个吻，引得这个备受宠爱的后代发出欢快的咯咯笑声。");
         outputText("[pg]你安慰地告诉" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "，[daddy]会给" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "很多营养，帮助" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "长大后变得和你一样，同时你把" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "放在你光溜溜的胯部前面。你感觉到你的" + get_player().cockDescript(param1) + "因需求而跳动，你毫不迟疑地将龟头塞进你" + get_isabellaScene().getIsabellaChildGender(param2,"儿子","女儿") + "的嘴里。" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的本能立刻发挥了作用，" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "撅起嘴，试图吸吮推入的温暖肉棒。");
         if(get_player().cocks[param1].cockThickness > 2)
         {
            outputText("[pg]当你的" + get_player().cockDescript(param1) + "滑过" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "柔软湿润的嘴唇时，一阵战栗流遍你的脊背。你叹了口气，因为你痛苦地意识到，你不可能把这么粗的工具塞进这么小的下巴里。你接受了你未发育完全的" + get_isabellaScene().getIsabellaChildGender(param2,"儿子","女儿") + "甜美的、吸吮的小嘴只含住龟头的幸福。" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "好奇的小手探索着你" + get_player().cockDescript(param1) + "的宽度，因为" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "尽其所能地理解这种情况。" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的眼睛抬头看着你，你开始做出舔舐的动作来帮助引导他们。");
            outputText("[pg]很快，你感觉到你小" + get_isabellaScene().getIsabellaChildGender(param2,"男孩","女孩") + "的舌头笨拙地舔舐着你的" + get_player().cockDescript(param1) + "，那触感宛如天堂。你的心跳加快，忍不住撸动起自己的肉棒。孩子对你明显的愉悦发出一声咯咯的笑，舔得更加起劲了——虽然还是那么笨拙。你每一次呼气都伴随着呻吟。随着你腹股沟的躁动预示着高潮的临近，兴奋感达到了顶峰。你用一只手固定住婴儿，将你的肉棒顶端直接对准" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的喉咙。你绝望的喘息声现在无疑能被其他人听到，但你撸动肉棒的狂热却不会减弱。");
            outputText("[if (hasballs) {你感觉到你的[balls]紧绷起来|你感觉到骨盆肌肉一阵紧绷}]，很快，汹涌的精液喷射进了你小天使渴望的肚子里！");
         }
         else
         {
            outputText("[pg]当你的" + get_player().cockDescript(param1) + "滑入" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "柔软湿润的嘴唇之间时，一阵战栗传遍你的脊背。当婴儿的下巴张开，迎接你入侵的喂食器时，你在极度的满足中发出一声惬意的叹息。你深情地抚摸着" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的脸颊，同时缓慢地来回抽插你的肉棒，每次深入都获得更多的深度。每次你压入时引起的轻微颤抖和咕噜声起初让你有些担忧，但很快你就感到安心，因为你的" + get_isabellaScene().getIsabellaChildGender(param2,"儿子","女儿") + "闭上" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的眼睛，露出充满爱意的微笑。" + get_player().mfn("父性","母性","父母") + "纽带的平静是这种堕落行为中纯洁的庇护所。乱伦喂养的狂喜让你迷失在这一刻，感谢自己孕育了一个天生的吸精机器。");
            outputText("[pg]你的" + get_isabellaScene().getIsabellaChildGender(param2,"儿子","女儿") + "发出咕噜声和呻吟声，你尽可能深地插入，彻底填满了你天使的小嘴。你享受着这种刺激，在湿热的环境中滑动你的" + get_player().cockDescript(param1) + "，将你的味道慷慨地涂抹在宝宝的舌头上。" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "强迫性地用力吸吮着你固定下来的位置，你很快发出一声低沉的呻吟。你鼓励地抚摸着孩子的头发。你下体的兴奋感如电流和火花般席卷全身，一种想要倾泻每一滴精液的冲动难以抑制。是时候让自然接管一切了，你微微前后扭动臀部，为你承诺提供的营养做准备。");
            outputText("[if (hasballs) {你感觉到你的[balls]紧绷起来|你感觉到骨盆肌肉一阵紧绷}]，预示着最终的高潮。你喘息着呻吟，精液喷涌而出，射入你宝宝" + get_isabellaScene().getIsabellaChildGender(param2,"男孩","女孩") + "渴望的肚子里。一旦你感觉到精液倒流，你意识到是时候从" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "的嘴里退出来，将剩余的极乐喷射在他们的脸上了。");
         }
         outputText("[pg]对你们的亲子体验感到满意，你开始清理孩子身上的污渍。你给" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "一个亲密而充满保护欲的蹭蹭，接着是一个令人安心的吻，然后把" + get_isabellaScene().getIsabellaChildGender(param2,"他","她") + "带回给伊莎贝拉照看。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Cor(3));
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,513) > 0 && !saveContent.ghostJudged)
         {
            doNext(judgmentalGhost);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function isabellaChildCockSucking(param1:int = 0) : void
      {
         clearOutput();
         outputText("你把男婴[isababyboy]抱到伊莎贝拉的一个垫子上，在放下[isababyhim]之前，你最后一次把[isababyhim]紧紧抱在你的[breasts]上。解开襁褓，婴儿胖乎乎的身体在空气中扭动着，你打量着那根几乎不像阴茎的微小鸡巴。[if (tailLeg) {你长满鳞片的尾巴滑过，盘绕在垫子下面|你弯下腰}]。离 [isababyhis][father]的脸这么近，你的[isababyson]高兴地盯着你的[eyes]，伸出一只手。你本能地抓住它并亲吻了一下。");
         outputText("[pg]嘴唇压在[isababyhis]手掌上，你的欲望驱使你进行下一个吻，吻在[isababyhis]手腕上。兴奋的咯咯笑声促使你加快了速度，你亲吻了[isababyhis]手臂好几次，直到转移到[isababyhis]胸部和肚子上。扭动的四肢轻轻地敲打着你的鼻子和头，伴随着更多的笑声——当你把嘴凑到宝宝的腹股沟，嘴唇贴在[isababyhis]可爱的、面条般的肉棒上时，笑声随着一声喘息而停止了。它抽动的感觉让你的心漏跳了一拍。这么小，却这么快就发情了。");
         outputText("[pg]你把你的[tongue]平贴在[isababyhis][if (isababyherm) {小穴上，扭动着品尝[isababyhis]对性需求的最初迹象|光滑、紧绷的阴囊上}]。[Isababyhis]阴茎随着你舌头在下面的滚动而颤抖，你宝宝[isababyboy]的咕咕声点燃了你的欲望——抛开犹豫，你吞没了[isababyhis][if (silly) {牛牛|勃起}]。");
         outputText("[pg]这离填满你的嘴还差得远，但这让它变得更加可爱。你的[hands]抚摸着软绵绵的宝宝，爱抚和按摩着[isababyhis]身体。[if (isChild) {取悦一个比你小得多、年轻得多的人是一种与众不同的体验；你脑海中确实闪过一个念头，想知道当伊莎贝拉对你上下其手时，她是否也有你现在的感觉。}][Isababyhe]抓着你，试图拥抱你的整张脸[if (hasHorns) {却只够到了你的[horns]|[if (hasAntennae) {却只够到了你的触角|[if (hasHair) {并拉扯着你的[hair]}]}]}]。吸吮你嘴里的宝宝肉棒让[isababyhim]浑身发抖，[isababyhe]甚至还摇晃着[isababyhis]臀部！");
         outputText("[pg]你的舌头顺着[isababyhis]肉棒短短的距离滑下，一直滑到[if (isababyherm) {隐藏在[isababyhis]阴道顶部的阴蒂|悬挂在下面的蛋蛋}]。反应是立竿见影的，你的宝宝抽搐起来！你没有减速，继续舔舐你的目标，在这个过程中，你的舌头顺便摩擦了[isababyhis]阴茎的整个长度。[if (hasLongTongue) {进一步伸出你的触手，你[if (isababyherm) {推开[isababyhis]阴唇，探入[isababyhis][if (silly) {小妹妹|小穴}]的入口。[Isababyhe]比刚才更湿了，即使这与成年人完全不同，但知道你的宝宝有多兴奋，驱使你贪婪地舔舐|捧住整个小阴囊，轻轻挤压它来鼓励[isababyhim]}]。}]现在气喘吁吁，发情的宝宝因为一种[isababyhe]还无法理解但却很喜欢的快感而扭动着。[Isababyhis]肌肉突然收缩，空气从[isababyhim]口中溢出！你让你的[isababyson]高潮了，你只希望[isababyhe]能把所有的满足感都喷射到你体内，但[isababyhe]还是太小了。");
         outputText("[pg]不用说，你确实很享受，即使你完全忽略了自己的需求；你的脸因为对你拥有的孩子的喜爱和爱而涨得通红，你把[isababyhim]包裹起来，然后最后一次深情地依偎着。毫无疑问，伊莎贝拉很快就会想要[isababyhim]了。");
         dynStats(DynStat.Lust(10),DynStat.Cor(3));
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,513) > 0 && !saveContent.ghostJudged)
         {
            doNext(judgmentalGhost);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function isabellaBurps() : void
      {
         get_player().consumeItem(get_consumables().PROBOVA);
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,383) == 0)
         {
            outputText("[say:[if (isabellaAccent) {亲爱的，那是什么？|你拿的是什么？}]]伊莎贝拉天真地问道，打量着你递给她的那瓶浑浊液体。你告诉她这是超级牛奶，基本上就是她变成现在这样时喝的药剂的强化版。她的眼神有些迷离，心不在焉地挤压着自己那对巨大的乳房，这是她发生变化的最明显标志。[say:你想让我多喝点？]她问道，醇厚的声音中只带着一丝不安。");
            if(isabellaAccent())
            {
               outputText("[say: 好吧……不会发生什么不可逆转的事，对吧？]");
            }
            else
            {
               outputText("[say: 好吧……没有什么我们变不回来的，对吧？]");
            }
            outputText("[pg]在你保证她除了明显的牛娘特征外不会有其他变化后，她明显平静下来，对你露出灿烂的笑容，伸手去拿药剂。[say:既然这样，那就干杯吧！]");
            outputText("她惊呼道，拔开超级牛奶的塞子，一口气全喝了下去。[say: 味道还不错，]她评论道，满意地咂了咂嘴。[say: 现在，什……][pg]");
            outputText("她的思绪完全被肚子里愤怒的咕噜声打断了。她咕哝了一声，用握紧的拳头捶了几下肚子，试图让这个粗鲁的器官安静下来，但她的尝试只换来了另一声更响亮的肠鸣。你们交换了一下眼神，都在想这药剂到底会对她做什么——以及已经做了什么。伊莎贝拉好奇地检查着自己的手臂，似乎想发现任何变化的迹象，但除了巧克力色的皮肤和劳动妇女长满老茧的双手外，什么也没发现。突然，牛娘退缩了一下，痛苦地捂住肚子。有一瞬间，你考虑问她怎么了，但随着你的视线下移，你很快就自己弄明白了。她那通常平坦结实的肚子，现在明显肿胀起来，鼓成了一个小圆肚子，并且还在慢慢变大。[pg]");
            outputText("你们俩都不知道该说什么，目光在彼此和她的肚子之间快速交替。伊莎贝拉出乎意料地直起身子，现在双手紧紧抓着肚子。[say: 好紧……]她咬紧牙关呻吟道。[say: 在动……][pg]");
            outputText("当她意识到发生了什么时，眼睛睁得大大的。[say: 退后，]她警告道，虚弱地向你挥了挥手。[say: 过敏……]似乎有什么东西要出来了。你是要逃离这个痛苦的牛娘，还是试图帮助她解决问题？不过，从她的反应来看，帮忙可能不是个好主意……");
            menu();
            addButton(0,"逃跑",runAwayFromIzzyBurps);
            addButton(1,"留下",getIzzyBurped);
         }
         else
         {
            outputText("当你从物品栏里拿出另一瓶超级牛奶递给她时，她爽朗地笑了起来，只犹豫了片刻就接了过去。[saystart]");
            if(isabellaAccent())
            {
               outputText("你确定要这样，对吧？[sayend]她轻轻向你摇晃着瓶子，确认道。[say: 你知道这对我有什么影响。]你调皮的微笑就是她需要的唯一答案。她轻松地咽下药剂，已经开始揉肚子，显然是在期待着什么。她注意到了你好奇的目光，用紧张的轻笑回答。[say: 就是那种感觉，对吧？]她试图在等待反应发作时解释。[say: 让你变得更像我……这不知怎么的让人感到安慰。][pg]");
            }
            else
            {
               outputText("你确定要这样，对吧？[sayend]她轻轻向你摇晃着瓶子，确认道。[say: 你知道这对我有什么影响。]你调皮的微笑就是她需要的唯一答案。她轻松地咽下药剂，已经开始揉肚子，显然是在期待着什么。她注意到了你好奇的目光，用紧张的轻笑回答。[say: 就是那种感觉……]她试图在等待反应发作时解释。[say: 让你变得更像我……这不知怎么的让人感到安慰。][pg]");
            }
            outputText("[say: 啊，我感觉到了，]她警告说，果然，她上衣的下摆掀起，露出了一个不紧不慢地肿胀起来的肚子。[say: 你准备好了吗，还是你改变主意了？]当你思考她的问题时，你的目光落在了她咕噜作响的圆肚子上。你觉得再吸入一次伊兹的气体有什么害处吗，还是你想躲开这次？");
            menu();
            addButton(0,"逃跑",runAwayFromIzzyBurps);
            addButton(1,"留下",getIzzyBurped);
         }
      }
      
      public function isabellaBarnFuckPartII() : void
      {
         clearOutput();
         outputText("在经历了口交带来的高潮后，伊莎贝拉瘫倒在地，浑身颤抖、抽搐着。你调皮地用手捧起她那被挤过奶的乳房，将她翻转过来，让她毛茸茸的双腿环绕在你的臀部。当你俯身压在她身上时，伊莎贝拉的嘴唇里溢出一丝轻微的呻吟。你迅速将她八个渴望被吸吮的乳头中的一个含入口中。你的舌头刚一触碰，一股超甜的乳汁就喷涌而出，顺着你的喉咙流下，速度快得你都来不及吞咽。当你吸吮她时，这头母牛的奶水似乎永远也吸不完。你的头随着她起伏的胸膛上下移动，而她则从你刚刚带给她的那场喷水、双腿发软的高潮中恢复过来。");
         get_player().refillHunger(25);
         outputText("[pg]当你继续大口大口地吸吮着伊莎贝拉饱满乳房中甜美的乳汁时，你慢慢地向上移动，让你[armor]的胯部摩擦着她湿透的小穴的阴唇。伊莎贝拉颤抖着，在刚刚高潮过后，她依然非常、非常敏感。你的手滑过爱人柔软、顺从的肌肤，指关节拂过她柔软的大腿和许多优美的曲线，最后，一根手指开始在她突出的樱桃般的阴蒂上画圈。伊兹的头向后仰去，当你的指尖在她玫瑰红色的阴蒂上进行漫长而性感的抚摸时，她屏住了呼吸。然而，在你再次开始用手指狂野地操弄她之前，你从她湿润的裂缝中退了出来，将手移向你的[armor]，释放出你的[cock]。几个快速的动作后，你的手指上沾满了你[cock smallest]因兴奋而流出的乳白色液体。那根跳动的肉棒从你的手中滑出，在光线下闪闪发光。你那沾满先列腺液的肉棒底部覆盖着她准备就绪的小穴，并摩擦着你刚刚逗弄完的阴蒂。");
         outputText("[pg][say: 哦，[name]……]这只牛娘呻吟着。你臀部一个慵懒的动作，将你的[cock smallest]带到了她渴望的肉洞前，你的龟头刚好穿过她的阴唇，亲吻着她小穴温暖的入口。伊莎贝拉抓住你的肩膀，将你的脸更深地埋进她柔软的胸膛，她那" + (get_noFur() ? "" : " 长满毛的") + "大腿环绕着你的[hips]，催促你继续前进，她的双腿将你的肉棒又推进了一英寸。你心领神会，开始慢慢进入她，让伊莎贝拉有力的双腿引导你，将你的[cock smallest]送入她温暖、欢迎的阴道怀抱中。");
         if(get_player().cocks[get_player().smallestCockIndex()].cockLength <= get_isabellaScene().tinyPenis())
         {
            outputText("你轻松地滑入她的体内，直到你的[hips]压在伊莎贝拉的大腿上，你们的腹股沟紧紧贴合在一起。");
            if(isabellaAccent())
            {
               outputText("[say: 嗯，真合适，]");
            }
            else
            {
               outputText("[say: 嗯，真合适，]伊莎贝拉叹息着，她的阴道肌肉温柔地抚摸着你的肉棒。");
            }
         }
         else if(get_player().smallestCockArea() < 40)
         {
            outputText("你的肉棒进入了她，撑开了伊莎贝拉的肉壁，直到你的[cock smallest]抚摸到她闭合的子宫颈口，急切地摩擦着她子宫的入口。");
            if(isabellaAccent())
            {
               outputText("[say: 啊，太大了]");
            }
            else
            {
               outputText("[say: 太大了，]");
            }
            outputText("伊莎贝拉咕哝着，她的小穴已经在努力地榨取你的肉棒了。");
         }
         else
         {
            outputText("当你那巨大的肉棒将她撑得大大的时候，伊莎贝拉咬紧了嘴唇。当你的[cock smallest]推进她的子宫时，她呜咽着说你快把她撕裂了，她的子宫颈唇紧紧地夹住你那粗壮肉棒的前几英寸。[saystart]啊啊啊啊，");
            if(isabellaAccent())
            {
               outputText("这实在是太大了，怎么这么巨大？[sayend]");
            }
            else
            {
               outputText("天哪，太巨大了，我……它快把我撕裂了！[sayend]");
            }
         }
         outputText("[pg]一旦你尽可能深地进入伊莎贝拉体内，她就放松了对你[ass]的死命抓握。你开始移动臀部，缓慢地向后摇晃，将几英寸粗壮的肉棒缓慢而诱人地从她体内抽出。伊莎贝拉淫荡地呻吟着，当你让她的肉洞空虚时，她弓起了背。当你抽出时，她的内部深处大张着……然后你再次猛插进去。当你用一次猛烈的抽插再次捣入时，她狂喜地尖叫起来，你将自己");
         if(get_player().smallestCockArea() <= 164)
         {
            outputText("直没至柄，用浓稠的先列腺液涂抹她疯狂收缩的肉壁");
         }
         else
         {
            outputText("直到你的[cock smallest]撞击她的子宫，浓稠的先列腺液涂抹在她的子宫口");
         }
         outputText("。你双臂紧紧环抱住爱人的肩膀，紧紧拥抱着她，同时你的[cock smallest]在她体内像活塞一样抽插，随着你[hips]的每一次挺动，动作越来越猛烈，越来越快。伊莎贝拉再次大叫起来，她张开的嘴正是你滑入舌头的绝佳机会，你的舌尖沿着她宽阔粉嫩的舌面滑动。她的嘴唇锁住你，吸吮着你的舌头，就像你刚才吸吮她的乳头一样，通过这个吻品尝着你身上的她自己的味道。");
         outputText("[pg]她短暂地中断了亲吻，刚好够她抓住自己巨大的、充满乳汁的乳房并将其托起，让她的嘴唇包裹住其中一个小小的乳头。你也加入进来，将她的四个乳头中的另一个含入嘴里，你们的嘴唇近得几乎能碰到，你们都在享受着从她胸前自由流淌的甜美乳汁。然而，随着你的每一次抽插，伊莎贝拉丰满的胸部都在颤抖，乳浪在她的胸前翻滚，你猛烈地撞击她的阴户，让她的阴道润滑液飞溅而出，同时乳汁也顺着她摇晃的乳沟自由流淌。");
         if(isabellaAccent())
         {
            outputText("[pg][saystart]啊，[name]，再用力点！像对待野兽一样操我……");
         }
         else
         {
            outputText("[pg][saystart]哦，[name]！操我！再用力点，对，就像对待野兽一样……");
         }
         outputText("啊啊啊，我要高潮了！[sayend] 当伊莎贝拉尖叫着表达她的快感时，你呻吟着，她的肌肉在收缩时挤压并榨取着你的[cock smallest]，她的高潮震撼了她的全身，大腿颤抖，乳房弹跳。她疯狂地抽搐着，尖叫着，你更加用力地捣弄她，把你剩下的每一分力量都投入到最后的几秒钟，直到你也冲过顶点，第一股滚烫的精液喷射进她体内，用你强效的种子填满伊莎贝拉。当高潮的快感如波浪般冲击你的身体，让每一根神经都因感觉超载而燃烧时，你几乎要大叫出来。");
         outputText("[pg]这次伊莎贝拉把脸埋在你的[chest]上，当你最后不规则的抽插在她体内结束时，她发出轻微的喘息和娇喘，当你慢慢抽出时，白色的液体涂抹在她阴户的嘴唇上。[saystart]");
         if(isabellaAccent())
         {
            outputText("[name]，那真是……啊，[name]");
         }
         else
         {
            outputText("哦，哇，[name]，那真是……那真是不可思议！");
         }
         outputText("[sayend] 伊莎贝拉在急促的呼吸间喘息着。[saystart]");
         if(isabellaAccent())
         {
            outputText("你真的很懂怎么取悦女人，对吧？");
         }
         else
         {
            outputText("你真的很懂怎么让女孩开心，不是吗？");
         }
         outputText("[sayend]");
         outputText("[pg]你笑了笑，把头靠在她沾满乳汁的胸部那如枕头般温暖的地方。你几乎准备好进入性交后的昏睡状态，这时你听到身后传来一个尖锐的声音，[say: 伊莎贝拉？你在里面没事吧？]");
         outputText("[pg]你回头看去，惠特尼推开门，手里拿着干草叉，好像在期待什么恶魔。你尴尬地咧嘴笑了笑，你光溜溜的[ass]直勾勾地盯着这个农家女孩的脸，而你的裤裆蛇正滴着液体落在谷仓的地板上。惠特尼默默地转过身退了出去，随手关上了门。沉默了片刻后，你和伊莎贝拉爆发出大笑，两人都伸手去拿衣服。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-3));
         get_player().changeFatigue(-25);
         isabellaKnockUpAttempt();
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function isabellaAtCamp() : Boolean
      {
         if(isabellaFollower())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1083) == 0;
         }
         return false;
      }
      
      public function isabellaAffection(param1:int = 0) : int
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,368,FlagDict_Impl_.arrayReadInt(_loc2_,368) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,368) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,368,100);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,368) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,368,0);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,368);
      }
      
      public function isabellaAccentUncoaching() : void
      {
         clearOutput();
         outputText("你告诉伊莎贝拉，她可以随心所欲地恢复她以前的口音。她睁大眼睛说：[say: 谢谢你，[name]！][pg]");
         outputText("<b>伊莎贝拉的口音现在恢复了。如果你改变主意，你必须重新指导她。</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,372,0);
         doNext(callForFollowerIsabella);
      }
      
      override public function isabellaAccent() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 100)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,374) != 0)
         {
            return true;
         }
         return false;
      }
      
      public function get_debugName() : String
      {
         return "Isabella";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getMilk() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你告诉伊莎贝拉你想要一瓶她的奶。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,380) > 0)
         {
            outputText("伊莎贝拉摇了摇头，告诉你她");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) == -1)
            {
               outputText("现在没有瓶装奶了，你应该晚点再来看看。");
            }
            else
            {
               outputText("上次弄得现在还疼，你应该晚点再来。");
            }
            doNext(callForFollowerIsabella);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) == -1)
         {
            outputText("伊莎贝拉点点头，从她最近在农场挤奶的备用品中拿了一瓶给你。[say: 给你！挤出来还不到二十四小时，[if (isabellaAccent) {ja?|好吗？}]][pg]");
         }
         else
         {
            outputText("伊莎贝拉点点头，递给你一个空瓶子，然后拉下上衣，露出她那布满大理石纹理的丰满乳房。[say: 记住，你的承诺……][pg]");
            outputText("你苦笑着，开始挑逗和拉扯她一侧乳房的乳头，同时俯身到另一侧，将两个乳头含入嘴里。[saystart]");
            if(isabellaAccent())
            {
               outputText("Ja，zat 感觉太棒了……快点把 mein 奶吸出来……[sayend]");
            }
            else
            {
               outputText("哦，感觉太棒了……快点把我的奶水挤出来……[sayend]");
            }
            outputText("[pg]这种刺激很快引发了几股乳白色的水流，一股流进瓶子里，另外两股流进你的胃里，剩下的则随着伊莎贝拉靠向你而滴落到地上。没过多久，你们两人的容器都满了，你松开了她的乳头。[saystart]");
            if(isabellaAccent())
            {
               outputText("这");
            }
            else
            {
               outputText("这");
            }
            outputText("感觉真好……谢谢你！[sayend]伊莎贝拉气喘吁吁地说；她裙子前面又出现了那块显眼的湿斑。你努力不让自己盯着它看，但她发情时的气味，加上她那颤抖着、充满感激的乳肉，让你考虑留下来享受更多乐趣……[pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,375,-2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,380,7 + Utils.rand(4));
         get_inventory().takeItem(get_consumables().IZYMILK,get_camp().returnToCampUseOneHour);
      }
      
      public function getIzzyBurped() : void
      {
         var changed1:Boolean;
         var _g:IsabellaFollowerScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,383,FlagDict_Impl_.arrayReadInt(_loc1_,383) + 1);
         var _loc2_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,383) == 1)
         {
            outputText("你完全无视了警告，立刻跑去帮助你的牛娘同伴解决她胃部不适的问题。她难以置信地看了你一眼，嘴里结结巴巴地抗议了十几次。然而，你心意已决，尽职尽责地揉着她的肚子，一心想减轻她的痛苦。[say:你……你……笨蛋！[if (isabellaAccent) {Vhat-|What-}]]");
            outputText("她语无伦次地说着，最后一个音节神秘地中断了。你对这种中断感到好奇，从按摩中抬起头看着她的脸。伊莎贝拉的脸颊严重膨胀，好像她试图忍住……哦。哦哦哦哦。几乎像戏剧一样准时，她的第一个回声般的饱嗝在你恍然大悟的同时击中了你，那股令人惊讶的甜美气流把你的[hair]吹到了脑后。[pg]");
            outputText("你向后踉跄了一下，无意中更用力地压了她的肚子，让她弯下了腰——但在那之前，你又被喷了一脸的饱嗝。你从伊莎贝拉上半身周围突然出现的雾气中蹒跚而出，但还是吸了几口那东西。离开中心地带后，你再次面对这位牛娘，却发现她跪在地上，一只手揉着肚子，另一只手捂着嘴打嗝。她的脸红得好像要变成小恶魔一样，因为气体的猛烈攻击还在继续。[pg]");
            outputText("令人羞耻的疯狂打嗝开始平息，发生的频率越来越低，直到最后停止。伊莎贝拉一屁股坐在地上，松了一口气，周围的雾气终于开始散去。");
            if(get_player().lowerBody.type != 1 || get_player().horns.value <= 0 || get_player().horns.type != 2)
            {
               outputText("随着整个事件的结束，你站了起来……却发现自己又摔倒了。");
            }
            if(get_player().lowerBody.type != 1)
            {
               if(get_player().isTaur())
               {
                  outputText("你困惑地迅速检查了一下自己，然后目光落在了你的蹄子上——或者你应该说，你唯一的一对蹄子。由于你猜测是超级牛奶的烟雾引发的，你的半人马身体消失了，只留下一对像牛一样的蹄子。");
               }
               else
               {
                  outputText("你困惑地迅速检查了一下自己，然后目光落在了你的" + get_player().feet() + "上——或者你应该说，以前的" + get_player().feet() + "。由于你猜测是超级牛奶的烟雾引发的，你的[feet]迅速而无痛地重塑成了偶蹄——和伊莎贝拉现在炫耀的那些没什么两样。");
               }
               _loc2_ = true;
            }
            if(get_player().horns.value <= 0 || get_player().horns.type != 2)
            {
               if(get_player().horns.value > 0 && get_player().horns.type > 0)
               {
                  outputText("你现有的角颤抖着，然后重塑成了" + get_player().mf("公牛","母牛") + "的角");
               }
               else
               {
                  outputText("你的额头上长出两个小凸起，迅速变粗并长成一对巨大的弯曲牛角");
               }
               outputText("，让你失去了平衡，又一次试图站稳的努力宣告失败。");
               _loc2_ = true;
            }
            if(get_player().ears.type != 3)
            {
               outputText("你的耳朵动了动，然后直接移到了头顶，并在移动的过程中变长变宽。不知不觉中，你长出了一对牛耳。");
               _loc2_ = true;
            }
            if(get_player().tail.type != 4)
            {
               if(get_player().tail.type > 0)
               {
                  outputText("你尾巴的尖端变成了一簇毛发，整条尾巴也随之改变以相匹配。");
               }
               else
               {
                  outputText("一条尾巴从你的[armor]里钻了出来，翘起并迅速生长。尾巴尖端爆出一簇毛发，其余部分也随之改变以相匹配。");
               }
               _loc2_ = true;
            }
            if(get_player().hasVagina() && get_player().biggestTitSize() < 15 && get_player().biggestLactation() < 2)
            {
               outputText("在你不知情的情况下，伊莎贝拉强效的牛气已经在你的[breasts]上大显身手，让它们长到了夸张的G罩杯……不，你意识到，不完全是生长，而是充盈……你捏了捏肿胀的乳头，对喷涌而出弄脏了你[armor]的乳汁并不感到意外。[pg]");
               _loc2_ = true;
            }
            else if(get_player().hasVagina() && get_player().biggestLactation() >= 2)
            {
               outputText("像你这样被柔软的[breasts]托着下巴支撑起来，你可以轻易地看到渗入地面的雪白液体越积越多。你用力撑起身子，作为回报，一股乳汁喷射到空中，因为你那明显超载的乳房在你的[armor]里晃动。看来伊莎贝拉的气体效果让你的泌乳能力超负荷运转了。");
               _loc2_ = true;
            }
            if(get_player().hasCock() && get_player().longestCockLength() < 18)
            {
               outputText("你的胯部产生了一种压力，起初很微妙，然后变得令人难以忍受，以至于你不得不解开[armor]的下半部分来寻求某种解脱。当你盯着你以前的[cock]时，你完全震惊了，它现在至少有18英寸长——伊莎贝拉已经注意到了这种情况，并且显然正在构思一句抱怨。");
               if(get_player().balls < 0)
               {
                  outputText("两颗睾丸落入你肿大的肉棒根部附近的阴囊中，已经肿胀成了棒球大小的欢乐球。");
               }
               else if(get_player().ballSize < 4)
               {
                  outputText("你的睾丸在牛娘对超级牛奶的剧烈反应的转化力量下充血，很快就长到了棒球大小。");
               }
               _loc2_ = true;
            }
            if(_loc2_ && get_player().hasVagina() && get_player().get_race() != "cow-girl")
            {
               outputText("[say:天哪，看看你！]伊莎贝拉惊呼道，挥手驱散了残留的雾气。[say:现在你肯定能和我[if (isabellaAccent) {一较高下了，对吧？|一较高下了，亲爱的！}]]");
               outputText("考虑到你目前的状况，你真的无法反驳。她高兴地走过来，给了你一个大大的拥抱，把你的乳房挤在她的乳房上，开心地扭动着，把引发晃动的能量波传递到你的乳房上。[saystart]");
               if(isabellaAccent())
               {
                  if(get_player().get_tallness() < 87)
                  {
                     outputText("现在，要是我们能让你再高一点，我们就是双胞胎了！");
                  }
                  else if(get_player().get_tallness() < 95)
                  {
                     outputText("看看这个，你和我一样成熟了！");
                  }
                  else
                  {
                     outputText("当然，在身高方面，你确实比我强！");
                  }
               }
               else if(get_player().get_tallness() < 87)
               {
                  outputText("现在，要是我们能让你再高一点，我们就是双胞胎了！");
               }
               else if(get_player().get_tallness() < 95)
               {
                  outputText("看看这个，你和我一样成熟了！");
               }
               else
               {
                  outputText("当然，在身高方面，你确实比我强！");
               }
               outputText("[sayend][pg]");
            }
            else if(_loc2_ && get_player().hasCock() && get_player().get_race() != "cow-morph")
            {
               outputText("[saystart]");
               if(isabellaAccent())
               {
                  outputText("Nein nein nein nein，这可不行！");
               }
               else
               {
                  outputText("不，不！这太糟糕了！");
               }
               outputText("[sayend]她一边靠近一边喊道，眼睛死死盯着你那过大的生殖器。");
               if(get_player().longestCockLength() < 18)
               {
                  if(isabellaAccent())
                  {
                     outputText("[say: 它没必要变得更大！真是个悲剧！你可怜的小鸡鸡！]");
                  }
                  else
                  {
                     outputText("[say: 它没必要变得更大！真是个悲剧！你可怜的小鸡鸡！]");
                  }
                  outputText("你对她这种选择性的担忧挑了挑眉，向她展示你变得有多像牛。");
                  if(isabellaAccent())
                  {
                     outputText("[say: ……是啊，那也很重要，但我可怜的小穴……]");
                  }
                  else
                  {
                     outputText("[say: 我想那也很重要，但我可怜的女孩部位怎么办？]");
                  }
               }
               outputText("[pg]");
            }
            else
            {
               outputText("伊莎贝拉站着，好奇地打量着你。[saystart]看来");
               if(isabellaAccent())
               {
                  outputText("我的……气体……并没有伤害到你，对吧？那就好，对吧？[sayend]你勉强挤出一个微笑并点了点头，对一切最终都安然无恙感到无比欣慰。[pg]");
               }
               else
               {
                  outputText("我的……气体……并没有伤害到你，对吧？那就好，对吧？[sayend]你勉强挤出一个微笑并点了点头，对一切最终都安然无恙感到无比欣慰。[pg]");
               }
            }
            outputText("有一段时间，这位丰满的女人只是在蹄子间来回挪动，踢着地，摆弄着她的头发。[say: ……我想我应该道个歉，]她终于在紧闭而噘起的嘴唇间嘟囔道。她慢慢靠近，但并没有真正乞求原谅，而是用一只手搂住你的头，给了你一个绵长的吻。当她慢慢退开时，她的眼睛闪烁着不可否认的欲望，舌头舔舐着你们嘴唇间那座小小的口水桥。[say: 你接受我的道歉吗？]她苦笑着问。[pg]");
         }
         else
         {
            outputText("你靠得很近，在等待不可避免的事情发生时，用鼻子蹭着你的牛娘情人。你调皮地把手压在她胀鼓鼓的肚子上，让她打了个小嗝，并假装恼怒地哼了一声。[say: 等你的——嗝——回合！]她责骂道，说话的动作迫使她从深处又打了一个先发制人的嗝。[pg]");
            outputText("为了惩罚你的鲁莽，她退后一步，深吸了一大口气，然后给了你一个大大的拥抱。她的肚子挤压着你的身体，把大量积聚的气体挤到了她的喉咙里。你惊叹于她喉咙里试图逃逸的恶臭气体造成的凸起，在最后一刻，你才想起你离她目前紧闭的嘴唇有多近。然而，你挣扎的唯一效果就是更用力地压在她像气球一样膨胀的肚子上。Braaaaap！她雷鸣般的饱嗝把你的头吹向后仰，迫使你在她开始气体攻击时无力地悬挂在她的怀抱中。伊莎贝拉在打嗝的间隙开始咯咯地笑，显然对你轻松的反应感到好笑。[pg]");
            outputText("作为奖励，她腾出一只手臂搂住你的头，把你拉进她那闪闪发光的乌黑双峰之间。伊莎贝拉摇晃着，用棉花糖般舒适的罩子包裹着你的头，继续用力打嗝，直到所有的气体都排空才罢休。在口头排气平息后，她把你从肉体监狱中拉出来，随着她那充满气体的魔法开始生效，她把你和她一起拖到了地上。[pg]");
            if(get_player().lowerBody.type != 1 || get_player().horns.value <= 0 || get_player().horns.type != 2 || get_player().ears.type != 3 || get_player().tail.type != 4 || get_player().hasCock() && get_player().longestCockLength() < 18)
            {
               outputText("当你变成现在熟悉的牛[boy]形态时，你并不感到惊讶，");
               if((!get_player().hasCock() || Utils.rand(2) == 0) && get_player().hasVagina())
               {
                  outputText("伊莎贝拉看着你那晃动膨胀的胸部，满脸热切。[pg]");
               }
               else if(get_player().hasCock())
               {
                  outputText("当你的老二长到令人羡慕的尺寸时，伊莎贝拉无法掩饰脸上的些许沮丧。[pg]");
               }
            }
            else
            {
               outputText("不出所料，她散发出的甜美气味只会进一步加剧你的性欲，从她的眼神来看，她很期待。[pg]");
            }
            outputText("伊莎贝拉微笑着将你拉近，给了你一个温柔的吻。[say:我想我真的应该再次道歉，]她一边沉思着一边慢慢退开，舌头舔去你们唇间拉出的一丝银线。[say:你接受我的道歉吗？]她苦笑着问道。");
         }
         _g = this;
         changed1 = _loc2_;
         doYesNo(acceptCowpology,function():void
         {
            _g.declineIzzysCowBurpApology(changed1);
         });
      }
      
      public function fuckIsabellaInTheBarn() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         outputText("你悄悄溜进谷仓，走向伊莎贝拉的隔间。无声地打开门，你可以清楚地看到那个赤裸着弯下腰的牛娘，你的眼睛贪婪地注视着她丰满的曲线和厚实柔软的屁股——以及她肉感大腿之间闪闪发光的小穴，被一双斑驳的手指微微分开，正在揉捏和挑逗她的大阴蒂。");
         outputText("[pg]脱下你的[armor]，你悄悄走到这头心不在焉的母牛身后，抓住你的" + get_player().cockDescript(_loc1_) + "，轻轻地撸了几下，直到它变得又硬又挺。然后，你咧嘴一笑，松开手，让它落在伊莎贝拉那诱人的臀瓣之间，迅速埋入她柔软的肉体中。");
         outputText("[pg][say: 哞哞哞！]她惊慌地叫了起来，挣扎着想向后靠，看看袭击她的人是谁，却被挤奶管缠住了。你轻笑一声，拍了拍她的屁股，告诉她放松……只是你而已。");
         outputText("[pg]");
         if(isabellaAccent())
         {
            outputText("[say: 哎呀，[name]？你以为你在干什么？这样偷偷摸摸地靠近别人……]");
         }
         else
         {
            outputText("[say: 哦，[name]？你以为你在干什么，嗯？这样偷偷摸摸地靠近别人……]");
         }
         outputText("[pg]你假装道歉，但感觉到你的鸡巴被夹在她肉感的臀瓣之间，你忍不住向后摇晃你的[hips]，慢慢地用你的[cock]在她的屁股间摩擦。");
         if(isabellaAccent())
         {
            outputText("[pg][say: 嗯……不如你帮我弄弄挤奶器……我就不叫你停下来……]");
         }
         else
         {
            outputText("[pg][say: 嗯……不如你帮我挤点奶，我就不叫你停下来……]");
         }
         outputText("[pg]你立刻答应了，伸手绕过大牛娘的肩膀，把挤奶管从她的乳房上拔下来，俯下身直到你的[chest]压");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("es");
         }
         outputText("她的背上，你的[cock]在她的臀瓣之间越推越深，直到你的手放在她的八个乳头上，用手指夹住她众多的乳蕾，直到一股迟疑的乳汁流过你的手，倾泻在谷仓的地板上，你给这头母牛进行了一次更性感的挤奶。你的手指滑过她的乳头，从一个大而饥渴的乳头移到下一个，温柔地抚摸她充满乳汁的乳房，直到伊莎贝拉的头向后仰去，发出一声低沉的哞叫，她的后庭紧紧地夹住你的肉棒。你发出一声低吟，一时想起了自己的需求。你开始移动你的臀部，慢慢地开始操伊莎贝拉的屁股，同时把下巴埋在她的肩膀上，在她的后颈上印下连串的吻。");
         outputText("[pg]在享受了一会儿你的爱抚后，伊莎贝拉转过身来抓住你，将她的嘴唇压在你的嘴唇上，她的一条有力的手臂搂住你的腰。她张开嘴，邀请你的舌头进入，在她的舌头上游走，她的舌头异常宽大温暖。你用舌尖滑过她平坦的舌头，感觉到她灼热、急促的呼吸拂过你的喉咙。在嘴唇交缠的间隙，你伸出手捧住伊莎贝拉的脸颊，拨开一缕赤褐色的头发，看着她明亮、发光的眼睛，在昏暗的谷仓隔间里，每一只眼睛都像一口白色的井。");
         outputText("[pg]她结束了亲吻，柔软的唾液丝挂在你们的嘴唇之间，即使牛娘无声地用嘴型说着，[say: 我想要你……]也依然连接着你们。你再次吻了她，但这次你的手从她的脸颊滑下，抚摸并捧起每一道曲线，直到她厚实、肉感的大腿。你的手指滑入伊莎贝拉双腿间纠结的红色丛林，指尖只是挑逗着她女性部位的嘴唇。她在你嘴里呻吟，她宽大的舌头滑过你的舌头，你开始挑逗她的快乐小豆豆和外阴唇，给她带来诱人的快感，却不给她插入的满足。");
         outputText("[pg]随着你的每一个动作，伊莎贝拉的臀瓣都会收紧，折磨着夹在你肚子和她后背之间的" + get_player().cockDescript(_loc1_) + "。你的臀部在她身上缓慢移动，轻轻地推入她柔软、宽容的肉体，然后向后倾斜，直到只有" + get_player().cockHead(_loc1_) + "留在她温柔的拥抱中。在亲吻和爱抚之间，你听到你的爱人乞求更多，乞求你将粗壮的肉棒滑入她渴望的洞穴，但还不是时候……还不是时候……");
         outputText("[pg]你结束了漫长的亲吻，用脸颊蹭着伊莎贝拉的脸颊，同时那只不在她双腿间忙碌的手从她柔软的乳房上松开，轻轻地将她向下推。牛娘疑惑地看着你，但很快就屈服了，你把她从挤奶机旁拉开，拉到地上，让她四肢着地，而你稳稳地站在她身后。你的臀部向后摇晃，将你的肉棒从她丰满的臀瓣中释放出来，你用手将它们分开，露出她最私密的部位。当你伸出舌头，从会阴舔到阴蒂，并在她光滑的裂缝上尽情亲吻和吸吮时，这头母牛喘息着。");
         outputText("[pg]当你把脸埋进伊莎贝拉的小穴时，她发出一声沙哑的哞叫催促着你。你的舌头诱人地滑过她的阴唇……却又退了出来，转而抚摸她的阴蒂。");
         if(isabellaAccent())
         {
            outputText("[say: 我想要……求你了，[name]，别这么逗我了……]");
         }
         else
         {
            outputText("[say: 快点，[name]，给我吧……别再逗我了……]");
         }
         outputText("她双腿的颤抖只会更加刺激你，你将两根手指伸进她那已经湿透的小穴里沾湿，然后顺着她的臀瓣滑向她另一个未被触碰过的洞穴。");
         outputText("[pg]你的手指轻松地滑了进去，但毫无预兆。伊莎贝拉猛地向后仰起头，发出混合着惊讶与狂喜的尖叫。眨眼间，你的手指就深深埋入她的体内，直到最后一节指节，轻松地撑开她的菊穴，让你的拇指也能同时插入。与此同时，你的整个舌头也侵入了她的花径，从两面将她完全填满。面对你突如其来、意想不到的双重插入，伊莎贝拉全身紧绷，几乎无法阻挡那决堤的洪流。你只需在她的后庭快速而有力地抽插几下，就让她尖叫着达到了高潮。她那歌剧般的声音在谷仓里回荡，紧紧地夹住你的手指和舌头。你微笑着帮她度过高潮，粗暴地用手指操弄着她的后庭，而你的脸上则沾满了她喷涌而出的淫液。");
         menu();
         addButton(0,"继续",isabellaBarnFuckPartII);
      }
      
      public function fuckIsabella() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:int = get_player().shortestCockIndex();
         if(get_player().cocks[_loc1_].cockLength > get_isabellaScene().tinyPenis())
         {
            _loc1_ = get_player().cockThatFits(164);
         }
         var _loc2_:int = _loc1_ + 1;
         outputText("你问伊莎贝拉是否介意帮你发泄一下；任何人都能看出你因为发情而满脸通红，你的[cock " + _loc2_ + "]紧紧地顶着你的[armor]。看着你的状态，伊莎贝拉");
         if(get_player().cocks[_loc1_].cockLength <= get_isabellaScene().tinyPenis())
         {
            outputText("把你的小[cockFit " + _loc2_ + "]从盔甲里掏出来，准备像往常一样给你口交。你抓住她的肩膀阻止了她，这次你更想……回报她。");
         }
         else
         {
            outputText("对你挑起一根眉毛，双臂交叉抱在她那巨大的胸部前。[say: [name]，]她叹了口气，");
            if(isabellaAccent())
            {
               outputText("[say: 我不知道……我更偏爱那些可爱的小鸡巴……它们太适合我了……]");
            }
            else
            {
               outputText("[say: 我不知道……你知道我喜欢可爱又小巧的。它们太适合我了……]");
            }
         }
         if(get_player().cocks[_loc1_].cockLength <= get_isabellaScene().tinyPenis())
         {
            if(isabellaAccent())
            {
               outputText("[pg][say: 哦，是的！]");
            }
            else
            {
               outputText("[pg][say: 哦，是的！]");
            }
            outputText("伊莎贝拉说着，直起身子");
            if(get_player().get_tallness() < 72)
            {
               outputText("高高地俯视着你娇小的身躯");
            }
            outputText("。");
            if(isabellaAccent())
            {
               outputText("[say: 你那小巧的鸡巴真是太可爱了，[name]，我简直无法拒绝……]");
            }
            else
            {
               outputText("[say: 你那小巧的鸡巴真是太可爱了，[name]……我怎么能拒绝呢？]");
            }
         }
         else
         {
            outputText("[pg]你催促她重新考虑，说你真的需要发泄，而且你确定她自己也积攒了一些欲望……[say: 呃，]这个高大的红发女郎说着，猛地把头转过去。");
            if(isabellaAccent())
            {
               outputText("[say: 我想我自己也需要发泄一下……好吧，[name]。我们来做爱吧，你和我。]");
            }
            else
            {
               outputText("[say: 我想我自己也需要发泄一下……好吧，[name]，我们来吧。]");
            }
         }
         outputText("[pg]带着充满欲望的笑容，伊莎贝拉伸手到背后，开始解开她紧身胸衣的系带。片刻之后，她那巨大的乳房挣脱了束缚，随着主人的每一次呼吸，巨大的柔软球体自由地晃动着。你的牛娘朋友也迅速把你从[armor]里拉出来，让你赤身裸体地站在微风中，你的[cock " + _loc2_ + "]在她偶尔的触碰或抚摸下变硬。");
         outputText("[pg]脱光衣服后，伊莎贝拉跪下来，托起她巨大的乳房，把它们举到你的[cock " + _loc2_ + "]周围。当她温暖柔软的乳肉包裹住你的肉棒时，你浑身一颤，");
         if(get_player().cockArea(_loc1_) < 50)
         {
            outputText("完全吞没了你的长度");
         }
         else
         {
            outputText("包住了你粗大肉棒的很大一部分");
         }
         outputText("。慢慢地，牛娘开始用她的乳房夹着你的肉棒摩擦，用她光滑、带有斑纹的皮肤上下套弄，偶尔还会伸出她那巨大宽阔的舌头舔你，在乳房摩擦的间隙，几乎用湿润的肌肉将你包裹起来。");
         outputText("你舒服地呻吟着，抚摸着牛娘深红色的头发，催促她继续，并用一点力气控制她的节奏，确保她的速度正好符合你的喜好。她顺从了你，舔舐和乳交让你爽到极点，直到你感觉快要爆发了；这时你才把她推开，粗暴地把她按在地上，分开她那粗壮的偶蹄双腿。");
         if(isabellaAccent())
         {
            outputText("[pg][say: 别介么粗暴！]");
         }
         else
         {
            outputText("[pg][say: 别这么粗暴！]");
         }
         outputText("她叫喊着，但还是毫不犹豫地为你张开双腿，露出她湿滑的小穴和紧致的肛门，它们几乎隐藏在她丰满的臀瓣之间。你一看到她的花穴就开始行动，把脸埋在她的腹股沟里，用舌头吸吮她的缝隙，舔舐着附着在她内壁上的点点淫液。她大声呻吟着，高亢的歌声颤抖着变成了一声长长的[say: 哞——！]，你的舌头挑逗和爱抚着她的阴蒂；她抓住你的[hair]，在你开始吸吮她的阴蒂时把你推得更深。你继续舔舐她的私处和花蕾，直到她到处漏水，她的小穴在你的服侍下完全湿透了。你对自己的努力感到满意，推开她的手，跪在地上，你的[cock " + _loc2_ + "]重重地拍在她湿润的胯部。");
         outputText("[pg]你将肉棒滑过她的入口，沾满她湿滑的淫液作为准备。当你将肉棒滑入她体内，撑开她的阴唇进入温暖的怀抱时，牛娘再次大声吼叫。");
         if(get_player().cockArea(_loc1_) < 80)
         {
            outputText("伊莎贝拉平时很紧，但现在几乎被淫液浸透了，这让你很容易就把肉棒塞进她体内；很快你的臀部就紧贴着她翘起的屁股，她粗壮的大腿缠绕着你的身体。");
         }
         outputText("你向后退去，将你的腹股沟猛地撞向伊莎贝拉的腹股沟，看着她将淫液喷洒在你的肉棒周围，你咧嘴笑了，显然她很享受你体内的[cockFit " + _loc2_ + "]。");
         outputText("[pg]你加快了速度，给她漂亮、有力的抽插，直到地面被她的汁液和你偶尔滴落的先列腺液浸透。然而，你并不满足于简单的传教士体位，你抓住伊莎贝拉的肩膀把她拉起来，含住她八个大乳头中的一个，大口吞咽着快速流出的乳汁。她呻吟着，发出哞哞声，抚摸着你的头发，你一边吸吮她的乳汁，一边将肉棒猛地插入她体内，在牛娘身上索取和给予，直到她仰起头尖叫，在你的肉棒周围猛烈地高潮。你一路挺进，骑在上面感受她强有力的收缩，不断地抽插，直到她气喘吁吁，乳汁的流量也减少到只剩你嘴里的一点点。");
         outputText("[pg]这可不行。你把伊莎贝拉转过来，强迫她像一头母牛一样四肢着地。在经历了双重高潮后，她筋疲力尽，只能在你的肉棒滑回她体内时发出抗议的咕哝声，你的臀部很快就靠在她丰满、柔软的屁股上。你用力操她，手指陷入她柔软的脸颊，猛烈地撞击她湿透的小穴，她的淫液和潮吹液帮助你以极快的速度在她体内进进出出。她发出哞哞声，但当你把她的脸按在地上并猛拉她的尾巴时，这声音变成了尖叫，导致她的通道像老虎钳一样紧紧地收缩，夹住你。");
         outputText("[pg]湿滑紧致，伊莎贝拉的母牛小穴是你饥渴的[cock " + _loc2_ + "]的完美洞穴。你咆哮着，最后一次猛拉她的尾巴，射入她体内，将你滚烫的精液溅在她最深处");
         if(get_player().cumQ() <= 250)
         {
            outputText("直到你精疲力尽");
         }
         else if(get_player().cumQ() <= 1000)
         {
            outputText("直到精液从她的通道喷出，弄脏了她的大腿");
         }
         else
         {
            outputText("直到她的肚子开始因为你塞进她体内的精液量而膨胀");
         }
         outputText("。[pg]");
         outputText("你最后拍了一下伊莎贝拉的屁股，看着这位高傲的牛娘瘫倒在你为她制造的精液和淫液的池子里，筋疲力尽，你笑了起来。");
         if(get_player().cocks[_loc1_].cockLength <= get_isabellaScene().tinyPenis())
         {
            if(isabellaAccent())
            {
               outputText("[pg][say: 这就系为什么我更喜欢小个子，ja？]牛娘开心地呻吟着，从她的小穴里舀出一点你的精液，吸溜着吃掉。[say: 介么可爱，介么小……但又介么强力！]");
            }
            else
            {
               outputText("[pg][say: 这就是为什么我爱死小个子了，]牛娘开心地呻吟着，从她的小穴里舀出一点你的精液，吸溜着吃掉。[say: 这么小，这么可爱……但又他妈的这么强力！]");
            }
         }
         else if(isabellaAccent())
         {
            outputText("[pg][say: 也许我对大鸡巴的看法是错的，ja？那真是……你太棒了，我的[name]。]");
         }
         else
         {
            outputText("[pg][say: 天哪，我对大鸡巴的看法真是大错特错。那真是……你用那玩意儿真是太不可思议了，[name]。]");
         }
         outputText("[pg]你咧嘴一笑，揉了揉这头大母牛的头发，然后穿好衣服。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         isabellaKnockUpAttempt();
         get_player().refillHunger(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findIzzyMilking() : void
      {
         clearOutput();
         outputText("当你在惠特尼的农场里闲逛时，你的探索让你回到了谷仓附近。在烈日下待了将近一个小时后，你擦去额头上的汗水，背靠在坚硬的木墙上休息——却听到里面传来微弱但明显欣喜若狂的哞哞声。你走到最近的窗户前向里看去，惊讶地看到一个熟悉的高大牛娘正靠在栏杆上，一对超大的挤奶器正在她巨大的乳房上不停地抽动。看到她随着挤奶器吸吮她乳头上的浓稠奶油而发出轻柔的哞哞声，你很快就被眼前的景象激起了性欲……你觉得可以在她挤奶的时候给她一个性感的惊喜。");
         menu();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,707,1);
         addButton(0,"操她",fuckIsabellaInTheBarn);
         setExitButton();
      }
      
      public function declineIzzysCowBurpApology(param1:Boolean) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,383) == 1)
         {
            outputText("尽管情况很奇怪，但你现在觉得太诡异了，至少暂时无法去安慰伊莎贝拉，你把这个想法告诉了她。虽然有些沮丧，但她还是很好地接受了这个消息，再次真诚而严肃地道了歉，然后回到了她指定的露营地。");
            if(param1)
            {
               outputText("令人高兴的是，大约一个小时后，你恢复了原来的形态，将那打嗝带来的牛娘恩赐抛在了脑后。");
            }
         }
         else
         {
            outputText("尽管你被激起了奇怪的性欲，但你还是拒绝了牛娘。虽然有些沮丧，但她还是很好地接受了这个消息，再次真诚而严肃地道了歉，然后回到了她指定的露营地。令人高兴的是，大约一个小时后，你恢复了正常。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function childrenMenu2(param1:int) : void
      {
         var child2:int;
         var _g2:IsabellaFollowerScene;
         var child1:int;
         var _g1:IsabellaFollowerScene;
         var child:int;
         var _g:IsabellaFollowerScene;
         var _loc2_:* = null as Array;
         var _loc4_:Boolean = false;
         switch(param1)
         {
            case 1:
               _loc2_ = [1];
               break;
            case 2:
               _loc2_ = [2,4];
               break;
            case 3:
               _loc2_ = [3,5];
               break;
            default:
               _loc2_ = [3,5];
         }
         var _loc3_:int = get_isabellaScene().chooseRandomIsabellaChild(_loc2_);
         registerTag("isababyherm",TagFun_Impl_.fromBool(param1 != 1 && param1 != 2));
         registerTag("isababyvirgin",TagFun_Impl_.fromBool(Boolean(saveContent.babyNotVirgin.contains(_loc3_))));
         registerTag("isababyboy",TagFun_Impl_.fromString(get_isabellaScene().getIsabellaChildGender(_loc3_,"boy","girl","girl")));
         registerTag("isababyhim",TagFun_Impl_.fromString(get_isabellaScene().getIsabellaChildGender(_loc3_,"him","her","her")));
         registerTag("isababyhis",TagFun_Impl_.fromString(get_isabellaScene().getIsabellaChildGender(_loc3_,"his","her","her")));
         registerTag("isababyson",TagFun_Impl_.fromString(get_isabellaScene().getIsabellaChildGender(_loc3_,"son","daughter","daughter")));
         registerTag("Isababyhe",TagFun_Impl_.fromString(get_isabellaScene().getIsabellaChildGender(_loc3_,"he","she","she")));
         outputText(_loc3_ + "[pg]");
         outputText("[pg]你把你的" + get_isabellaScene().getIsabellaChildGender(_loc3_,"儿子","女儿") + "紧紧抱在胸前，在父母体温的舒适中轻轻摇晃着" + get_isabellaScene().getIsabellaChildGender(_loc3_,"他","她") + "。" + get_isabellaScene().getIsabellaChildGender(_loc3_,"他","她") + "看起来和" + get_isabellaScene().getIsabellaChildGender(_loc3_,"他","她") + "的母亲一样漂亮！你沉浸在父母的本能中了一会儿，然后才考虑接下来该做什么。");
         menu();
         if(get_allowBaby())
         {
            _loc4_ = get_player().get_lust() < 33 || get_player().cor + get_player().lib < 50;
            _g = this;
            child = _loc3_;
            addButton(0,"肉棒喂奶",function():void
            {
               _g.isabellaChildCocknursingSelection(child);
            }).hint("也许伊莎贝拉需要一些帮助来喂养他们……").disableIf(!get_player().hasCock() || _loc4_,"这个场景需要足够的欲望、腐化和一根肉棒。");
            _g1 = this;
            child1 = _loc3_;
            addButton(1,"舔阴",function():void
            {
               _g1.isabellaChildCunnilingus(child1);
            }).hint("在“嘴唇”上亲吻。").disableIf(param1 == 1 || _loc4_,"这个场景需要足够的欲望、腐化，并且孩子必须有阴道。");
            _g2 = this;
            child2 = _loc3_;
            addButton(2,"吸吮",function():void
            {
               _g2.isabellaChildCockSucking(child2);
            }).hint("在[isababyhe]喜欢的地方亲吻[isababyhim]。").disableIf(param1 == 2 || _loc4_,"这个场景需要足够的欲望、腐化，并且孩子必须有肉棒。");
         }
         addButton(14,"离开",callForFollowerIsabella).hint("你还有其他事情要做，也许还要照顾其他孩子。");
      }
      
      public function childrenMenu() : void
      {
         var childGender2:int;
         var _g2:IsabellaFollowerScene;
         var childGender1:int;
         var _g1:IsabellaFollowerScene;
         var childGender:int;
         var _g:IsabellaFollowerScene;
         clearOutput();
         if(get_isabellaScene().totalIsabellaChildren() == 1)
         {
            outputText("你有一个" + get_isabellaScene().getIsabellaChildGender(0,"男","女","扶她") + "宝宝。" + get_isabellaScene().getIsabellaChildGender(0,"他","她") + "已经" + get_isabellaScene().getIsabellaChildAge() + "天大了，几乎没有受到玛瑞斯老化魔法的影响。" + get_isabellaScene().getIsabellaChildGender(0,"他","她") + "有着和" + get_isabellaScene().getIsabellaChildGender(0,"他","她") + "母亲一样浅褐色的皮肤。");
         }
         else
         {
            outputText("你有" + get_isabellaScene().totalIsabellaChildren() + "个孩子：");
            outputText("\n" + get_isabellaScene().getIsabellaChildType(1) + "个男孩" + (get_isabellaScene().getIsabellaChildType(1) == 1 ? "" : "") + "。");
            outputText("\n" + (get_isabellaScene().getIsabellaChildType(2) + get_isabellaScene().getIsabellaChildType(4)) + "个女孩" + (get_isabellaScene().getIsabellaChildType(2) == 1 ? "" : "") + "。");
            outputText("\n" + (get_isabellaScene().getIsabellaChildType(3) + get_isabellaScene().getIsabellaChildType(5)) + " 双性人" + (get_isabellaScene().getIsabellaChildType(3) == 1 ? "" : "们") + "。");
         }
         menu();
         if(get_isabellaScene().getIsabellaChildType(1) > 0)
         {
            _g = this;
            childGender = 1;
            addButton(0,"儿子",function():void
            {
               _g.childrenMenu2(childGender);
            }).hint("花点时间陪陪" + (get_isabellaScene().getIsabellaChildType(1) > 1 ? "你的一个儿子。" : "你的儿子。"));
         }
         else
         {
            addButtonDisabled(0,"儿子","你和伊莎贝拉还没有任何儿子。");
         }
         if(get_isabellaScene().getIsabellaChildType(2) + get_isabellaScene().getIsabellaChildType(4) > 0)
         {
            _g1 = this;
            childGender1 = 2;
            addButton(1,"女儿",function():void
            {
               _g1.childrenMenu2(childGender1);
            }).hint("花点时间陪陪" + (get_isabellaScene().getIsabellaChildType(2) + get_isabellaScene().getIsabellaChildType(4) > 1 ? "你的一个女儿。" : "你的女儿。"));
         }
         else
         {
            addButtonDisabled(1,"女儿","你和伊莎贝拉还没有任何女儿。");
         }
         if(get_isabellaScene().getIsabellaChildType(3) + get_isabellaScene().getIsabellaChildType(5) > 0)
         {
            _g2 = this;
            childGender2 = 3;
            addButton(2,"扶她女儿",function():void
            {
               _g2.childrenMenu2(childGender2);
            }).hint("花点时间陪陪" + (get_isabellaScene().getIsabellaChildType(2) + get_isabellaScene().getIsabellaChildType(4) > 1 ? "你的一个扶她女儿。" : "你的扶她女儿。"));
         }
         else
         {
            addButtonDisabled(2,"扶她女儿","你和伊莎贝拉还没有任何扶她女儿。");
         }
         addButton(14,"返回",callForFollowerIsabella);
      }
      
      public function campIzzySexMenu() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         menu();
         addButtonDisabled(2,"乳交");
         addButtonDisabled(4,"触手交","需要你至少有3根相当长的触手肉棒。");
         addButtonDisabled(5,"被口交");
         addButtonDisabled(6,"Fuck Her");
         var _loc1_:Function = null;
         if(izzyTentacleRapeBool() && get_player().get_lust() >= 33)
         {
            _loc1_ = tentacleBoneFollowerIzzy;
         }
         var _loc2_:Function = null;
         var _loc3_:Function = null;
         var _loc4_:String = "";
         var _loc5_:Function = null;
         if(get_player().hasCock())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,376) == 0)
            {
               _loc4_ = "不要口交";
            }
            else
            {
               _loc4_ = "想要口交";
            }
            _loc3_ = toggleIsabellasMorningWoodChopping;
            if(get_player().shortestCockLength() <= get_isabellaScene().tinyPenis() && get_player().get_lust() >= 33)
            {
               _loc5_ = get_isabellaScene().izzyGivesSmallWangsFreeOral;
            }
         }
         outputText("[pg]");
         outputText("你可以直接从源头畅饮伊莎贝拉美味的乳汁。");
         if(_loc1_ != null)
         {
            outputText("或者你可以利用你众多的触手让她享受一段真正美妙的时光。");
         }
         if(_loc5_ != null)
         {
            outputText("或者你可以让她现在就给你口交，因为她似乎对你阴茎的尺寸很着迷。");
         }
         outputText("也有机会钻进她的裙底，好好伺候她一番。");
         if(get_player().get_lust() < 33)
         {
            outputText("<b>你还不够兴奋，无法发起性爱。</b>");
         }
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            _loc2_ = repeatGermanBratwurstInCamp;
         }
         var _loc6_:Function = null;
         if(get_player().hasCockThatFits(164) && get_player().get_lust() >= 33)
         {
            _loc6_ = fuckIsabella;
         }
         addButton(0,_loc4_,_loc3_);
         addButton(1,"喝奶",get_isabellaScene().nomOnMommaIzzysTits);
         addButton(2,"乳交",_loc2_);
         addButton(3,"侍奉她",get_isabellaScene().volunteerToSlurpCowCunt);
         addButton(4,"触手交",_loc1_);
         addButton(5,"被口交",_loc5_);
         addButton(6,"操她",_loc6_);
         addButton(14,"返回",callForFollowerIsabella);
      }
      
      public function callForFollowerIsabella() : void
      {
         var _g:Camp;
         registerTags();
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1083) == 0)
         {
            outputText("你引起了伊莎贝拉的注意，把这位丰满的牛娘叫到你身边。当她从之前的工作中抽身出来时，她似乎有点慌乱，但当她向你靠近时，她满脸笑容。[if (lust > 33 or libido > 75) { 当她漫步走过来时，你有充足的时间欣赏这位曲线优美的佳人的身体。}][if (!isabellaonherb and isabellapregnancy == 0) { 尽管伊莎贝拉已经停用了避孕草药，但自从你们决定要个孩子以来，几乎没有什么变化。}][if (isabellapregnancy == 2) { 她似乎花更多的时间坐在她丰满的臀部上。你问她是否还好，但她不以为然，说只是脚踝肿了。}][if (isabellapregnancy == 3) { 在你的余光中，你发誓她一直在盯着你。}][if (isabellapregnancy == 4) { 她的步态有些不安，你只能假设，这是因为她携带了新的珍贵货物而导致的重心转移。她还不时揉揉太阳穴，以缓解反复发作的头痛。}][if (isabellapregnancy == 5) { 她的上衣无法包裹住微微凸起的大肚子。看着她四个乳头附近不断湿润的污渍，你的喉咙感觉有点干。看来怀孕增加了她本来就很强劲的产奶量。}][if (isabellapregnancy == 6) { 当你在营地里闲逛时，你经常发现自己最好避开她的目光。英格纳姆的母亲们经历过情绪波动，而这些转变并没有让伊莎贝拉有太大的不同；似乎当她不对你大吼大叫时，她就会让你窒息，但她此刻还算平静。}][if (isabellapregnancy == 7) { 她的乳房几乎无法被紧绷的衬衫包裹住，她的肚子完全从下面凸出来——这位牛娘让她的上衣盖过隆起的肚子，以防止它被撕裂。她的额头上挂着一层细细的汗珠。}][if (isabellapregnancy == 8) { 她现在似乎睡得更多了；看来怀孕消耗了她大量的精力。尽管如此，她还是保持着满足的表情，不断抚摸着怀孕的肚子，沉浸在做母亲的幸福中。}][if (isabellapregnancy >= 9) { 这位高大女人的膝盖在走路时微微发抖。你发现自己盯着牛娘裸露的巨大胸部，它随着每一次呼吸而起伏，她可怜的异国情调的乳头慢慢地不断渗出乳汁，让她像瓜一样的肚子变得光滑，已经准备好喂养你的后代了。伊莎贝拉似乎正遭受着慢性疼痛的折磨——也许是假性宫缩？——但当你看着她时，她仍然设法微笑。你觉得现在应该不会太久了。}][pg]");
            if(nursingCheck())
            {
               if(get_isabellaScene().totalIsabellaChildren() == 1)
               {
                  outputText("在她的怀里是你心爱的宝宝" + get_isabellaScene().getIsabellaChildGender() + "，刚喂完奶正在休息。");
               }
               else
               {
                  outputText("在她的怀里是你心爱的一个孩子，刚喂完奶正在休息。");
               }
            }
            else
            {
               outputText("伊莎贝拉");
               if(get_player().get_tallness() < 72)
               {
                  outputText("把你抱在怀里，给了你一个令人窒息的拥抱，在放开你之前几乎把你埋在她的乳肉里。");
               }
               else
               {
                  outputText("给了你一个令人窒息的拥抱，把她的奶子紧紧压在你的身上。");
               }
            }
            outputText("她说道，[say:[if (isabellaAccent) {嗨，[name]！你需要伊莎贝拉做些什么？|嗨，[name]！有什么我可以帮忙的吗？}]]");
            if(get_player().hasCock())
            {
               if(get_player().shortestCockLength() > get_isabellaScene().tinyPenis())
               {
                  outputText("[pg]遗憾的是，你太大了，伊莎贝拉对在早晨给你口交不感兴趣。");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,376) == 0)
               {
                  outputText("[pg]你可以要求伊莎贝拉不要在早晨给你口交。（在性爱菜单中）");
               }
               else
               {
                  outputText("[pg]你可以要求伊莎贝拉在早晨给你口交。（在性爱菜单中）");
               }
            }
         }
         else
         {
            outputText("伊莎贝拉放下她提着的奶罐，在你靠近时擦了擦额头。");
            outputText("[pg][say:[if (isabellaAccent) {Guten tag，[name]。伊莎贝拉能帮你什么忙吗？|你好，[name]。伊莎贝拉能帮你什么忙吗？}]]");
         }
         menu();
         addButton(0,"外貌",isabellasAppearance).hint("仔细打量伊莎贝拉的外貌。");
         addButton(1,"交谈",isabellaTalkMenu).hint("向伊莎贝拉询问一些事情。");
         addButton(2,"性爱",campIzzySexMenu).hint("和这位牛娘做爱。");
         addButton(3,"切磋",isabellaSparMenu).hint("和伊莎贝拉进行一场快速的战斗！");
         if(get_isabellaScene().totalIsabellaChildren() > 0)
         {
            addButton(5,"孩子",childrenMenu).hint("与你和伊莎贝拉的孩子互动。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) < 0)
         {
            addRowButton(1,"取奶",getMilk).hint("获取一瓶伊莎贝拉的奶水。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,372) < 100)
         {
            addRowButton(1,"口音纠正",isabellasAccentCoaching).hint("教伊莎贝拉用正常的口音说话。");
         }
         else
         {
            addRowButton(1,"取消纠正",isabellaAccentUncoaching).hint("让伊莎贝拉用她喜欢的方式说话。这几乎会让你之前所有的纠正进度付诸东流。");
         }
         if(get_player().hasItem(get_consumables().PROBOVA) && get_player().get_gender() > 0)
         {
            outputText("[pg]<b>如果你给伊莎贝拉一瓶ProBova，她大概会喝下去。</b>");
            addRowButton(1,"给予ProBova",isabellaBurps).hint("给伊莎贝拉一瓶ProBova？","给予ProBova");
         }
         if(get_player().hasItem(get_consumables().OVIELIX) && get_isabellaScene().pregnancy.get_isPregnant())
         {
            outputText("[pg]<b>你可以给伊莎贝拉一瓶产卵灵药，让她的孕期缩短十天。</b>");
            addRowButton(1,"给予产卵灵药",isabellaTakesOviElixir).hint("给伊莎贝拉一瓶产卵灵药？这会让她的当前孕期缩短十天。","给予产卵灵药").disableIf(get_isabellaScene().pregnancy.get_incubation() == 1,"伊莎贝拉的孕期无法再缩短了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1083) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            addButton(10,"农场工作",sendToFarm);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1083) == 1)
         {
            addButton(10,"回营地",backToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1083) == 1)
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
         else
         {
            _g = get_camp();
            addButton(14,"返回",function():void
            {
               _g.campLoversMenu();
            });
         }
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         isabellaSprite();
         outputText("[say: 你能回营地去吗？只是……晚上那里有点寂寞。] 你的策略奏效了，伊莎贝拉高兴地捏了捏你的脸颊。");
         if(isabellaAccent())
         {
            outputText("[pg][say: 噢，我的小泰迪熊是不是一个人觉得又冷又孤单了？伊莎贝拉会回来给你保暖的，是的，非常非常暖和！]");
         }
         else
         {
            outputText("[pg][say: 噢，我的小泰迪熊是不是一个人觉得又冷又孤单了？伊莎贝拉会回来给你保暖的，是的，非常非常暖和！] 你留下她收拾东西，然后离开了。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1083,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function babyMF(param1:String, param2:String, param3:int) : String
      {
         if(param3 == 1)
         {
            return param1;
         }
         return param2;
      }
      
      public function angryMurble() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你带着玛布尔来到营地里伊莎贝拉所在的地方，觉得现在正是介绍她们认识的好时机。玛布尔热情地向伊莎贝拉打招呼，但立刻开始连珠炮似地询问她的来历。从她的执着来看，她似乎对遇到另一个牛娘很感兴趣。虽然有些不知所措，但伊莎贝拉很快恢复了过来，解释了她的来历以及她作为牛娘的不纯正性。玛布尔明显感到失望。");
         outputText("[pg]话题逐渐转移到了玛布尔来到营地的原因上。玛布尔似乎很高兴能认识你的朋友，并渴望以后能和她多相处一段时间。另一方面，伊莎贝拉似乎对玛布尔的举动有些反感。只有时间才能证明这两人会如何相处。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,381,2);
         doNext(playerMenu);
      }
      
      public function acceptCowpology() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,383) == 1)
         {
            outputText("你闪过一丝坏笑，向她招手示意她过来，同时脱下你的[armor]。你动作轻柔而刻意地将伊莎贝拉沾满乳汁的衬衫下摆拉下，探入她乳沟深处，握住她那硕大的乳房。你需要费点力气才能将那沉甸甸、充满液体的乳房从她的衬衫里托出来。一旦暴露在空气中，她的四个乳头便抽搐着变硬，当你用指甲边缘交替挑逗她的乳头时，它们只会肿胀得更厉害。你沿着乳晕画着小圆圈，在乳头上上下滑动；你那温柔却致命的抚摸技巧让伊莎贝拉浑身颤抖，双膝在难以抑制的狂喜中互相碰撞。如果给你足够的时间，你觉得仅仅通过乳头刺激就能让这个牛娘达到高潮，但你自己的身体也需要满足。[pg]");
            if(get_player().hasCock())
            {
               outputText("你打算好好利用你那硕大的器官，于是你拨开伊莎贝拉的乳房，将你坚硬的肉棒拍打在它们之间。一旦她明白了你的意图，牛娘便主动接管，将她那柔软的资本挤压在一起，包裹住你的男性象征。也许是因为气体的缘故，但原本应该只是简单的乳交，现在却让你在快感中陷入疯狂；她那温暖、汗津津的乳房肌肤贴合着你肉棒和龟头的曲线，感觉就像任何一个小穴一样美妙。你情不自禁——你开始挺动臀部，你的龟头探出来，在伊莎贝拉的脸庞上方诱人地舞动，然后缩回去，几秒钟后又再次探出。牛娘微笑着张大嘴巴，她长长的舌头从庇护所里滑了出来。[pg]");
               outputText("在你下一次挺进时，她熟练地舔舐和弹拨你肉棒的下侧，一股近乎电流般的快感传遍你的全身。你们俩很快找到了节奏，摩擦、挺进和舔舐完美同步。随着你越来越接近高潮，你开始加快速度；你的爱人也非常乐意配合。突然，伊莎贝拉松开了抱住胸部的手，转而用双臂环抱住你的[ass]，将你拉向她和她那张大开的嘴。你的腿碰到了她的乳房，但她甚至没有注意到，而是用她丰满的嘴唇尽可能多地含住你的肉棒。尽管她温暖湿润的嘴巴感觉很好，但她的舌头才是最吸引你注意力的。它完全包围了你的下体，缠绕着肉棒，挠着下面，甚至还在抚弄——一个完美的、能灵活抓握的射精辅助工具。[pg]");
               outputText("你再也忍不住了，伊莎贝拉也感觉到了——她甚至抬起头，让你更容易抓住。滚烫的精液以创纪录的速度穿过你的尿道，在狂喜的驱使下，你尽可能深地将自己推入她体内。她吞下了惊人数量的肉棒，没有丝毫的抗拒，只是对你即将到来的捐赠发出幸福的呻吟。");
               if(get_player().cumQ() < 100)
               {
                  outputText("你将精液喷射到她的喉咙深处，惊叹于她吞咽的速度。");
               }
               else if(get_player().cumQ() <= 500)
               {
                  outputText("温暖的精液直接泵入伊莎贝拉的喉咙，当她高兴地吞下时，她的脖子微微鼓起。");
               }
               else if(get_player().cumQ() <= 1000)
               {
                  outputText("看到你能灌入她嘴里的精液量，她的眼睛微微凸起，当她努力跟上你的节奏时，她的脸颊和脖子都鼓了起来。当她设法吞下那些东西后，她对着你的肉棒松了一口气。");
               }
               else
               {
                  outputText("当你射精——射精——再射精，一波又一波的精液涂满她的食道壁时，伊莎贝拉露出了一种真正关切的表情。她几乎无法应付如此大量的精液，即使她正在尽可能快地吞咽，精液仍然从她的嘴角和鼻孔溢出。最后，你的阀门关闭了，可以这么说，她吞下了足够多的精液，终于能够再次呼吸。事后她的肚子明显变圆了，但她只是揉了揉，似乎非常满足。");
               }
               outputText("[pg]");
               if(isabellaAccent())
               {
                  outputText("[say: 简直太完美了，]当伊莎贝拉终于将嘴唇从你仍在颤抖的阴茎上移开时，她呻吟着说。你微笑着翻身下马，扶她站起来。新增加的内容物导致她胃里的东西再次翻滚，迫使她打了个小嗝。[say: 抱歉，]她嘟囔着，你们对整个经历相视一笑。她眨了眨眼，走回自己的铺位。你能感觉到伊莎贝拉气体的效果正在消退，在接下来的一个小时里，当你慢慢恢复正常时，你开始思考给她喂更多超级牛奶的后果。那可能会很酷……");
               }
               else
               {
                  outputText("[say: 简直太完美了，]当伊莎贝拉终于将嘴唇从你仍在颤抖的阴茎上移开时，她呻吟着说。你微笑着翻身下马，扶她站起来。新增加的内容物导致她胃里的东西再次翻滚，迫使她打了个小嗝。[say: 抱歉，]她嘟囔着，你们对整个经历相视一笑。她眨了眨眼，走回自己的铺位。你能感觉到伊莎贝拉气体的效果正在消退，在接下来的一个小时里，当你慢慢恢复正常时，你开始思考给她喂更多超级牛奶的后果。那可能会很酷……");
               }
            }
            else
            {
               outputText("伊莎贝拉决定采取主动，托起你的一只乳房，将它拉到嘴边。她那丰满的嘴唇包住你已经很敏感的乳头，这种感觉让你不由自主地后退。为了不让她占上风，你张大嘴巴，吞没了她那四个漏奶的乳头。你们俩就像在比赛一样，一边吸吮着一只乳房，一边揉捏着另一只。随着这场较量的继续，她的脸红得更深了，但直到你的大腿擦过她的大腿，你才真正意识到她的性唤起。大量的淫液涂抹在你的[skinfurscales]上。[pg]");
               outputText("你将牛娘放倒在地上，自己也跟着趴下，你们俩仍在热情地吸吮着。她用空闲的手在你的身体上游走，顺着你腰部的曲线滑下，调皮地捏了捏你的[ass]。你发出一声满足的闷哼，也跟着照做，将手滑下她的腹部。你的手指分开她那厚实、湿透的阴唇，滑了进去。只花了短短几秒钟挠她的小阴蒂，它就在你手中肿胀起来。伊莎贝拉的双膝互相碰撞，但她吸吮的力度却加倍了。[pg]");
               outputText("她摸到了你的入口并插了进去，突然间，比赛的赌注翻倍了；谁先泌乳，谁先高潮。然而，可怜的伊莎贝拉因为做牛娘的时间更长而处于劣势；你能感觉到她的乳头在抽动，你怀疑你已经赢得了比赛的第一阶段。一股温暖、奶油般的乳汁泵入你的嘴里，你被迫快速吞咽以跟上她喷射的乳房。[pg]");
               outputText("然而，泌乳似乎是她的临界点。她在你的手上摩擦了几次，然后猛烈地高潮了。伴随着她高潮时狂喜的叫声，一股如洪流般的淫液流过你的手指，在地上汇聚成一滩。你很快也高潮了，用你狂欢的体液填满了她的手掌和脸颊。[pg]");
               outputText("几分钟后，你们俩从高潮后的慵懒中苏醒过来，躺在这场短暂而甜蜜的冒险的余韵中。伊莎贝拉没有说话，只是向你飞吻，然后翻身站起，步履蹒跚地走回她的铺位。你在那里躺了剩下的一个小时，感觉她打嗝的影响慢慢消退。");
            }
         }
         else
         {
            outputText("你闪过一丝坏笑，向她招手示意她过来，同时脱下你的[armor]。你动作轻柔而刻意地将伊莎贝拉沾满乳汁的衬衫下摆拉下，探入她乳沟深处，握住她那硕大的乳房。你需要费点力气才能将那沉甸甸、充满液体的乳房从她的衬衫里托出来。一旦暴露在空气中，她的四个乳头便抽搐着变硬，当你用指甲边缘交替挑逗她的乳头时，它们只会肿胀得更厉害。你沿着乳晕画着小圆圈，在乳头上上下滑动；你那温柔却致命的抚摸技巧让伊莎贝拉浑身颤抖，双膝在难以抑制的狂喜中互相碰撞。如果给你足够的时间，你觉得仅仅通过乳头刺激就能让这个牛娘达到高潮，但你自己的身体也需要满足。[pg]");
            if(get_player().hasCock() && (!get_player().hasVagina() || Utils.rand(2) == 0))
            {
               outputText("你打算好好利用你那硕大的器官，于是拨开伊莎贝拉的双乳，将你坚挺的肉棒拍打在它们之间。这牛娘一明白你的意图，便主动接管了局面，将她那如枕头般柔软的丰满双峰挤压在一起，包裹住你的男性象征。也许是因为气体的作用，原本简单的乳交竟让你爽得快要发疯；她温暖、汗津津的乳房肌肤完美贴合着你肉棒和龟头的曲线，感觉丝毫不亚于任何小穴。你情不自禁地开始挺动臀部，你的顶端探出头来，在伊莎贝拉的脸庞上方诱人地舞动，然后又缩回去，几秒钟后再次探出。牛娘微笑着张大嘴巴，她长长的舌头从庇护所里滑了出来。[pg]");
               outputText("在你下一次挺进时，她熟练地舔舐和弹拨你肉棒的下侧，一股近乎电流般的快感传遍你的全身。你们俩很快找到了节奏，摩擦、挺进和舔舐完美同步。随着你越来越接近高潮，你开始加快速度；你的爱人也非常乐意配合。突然，伊莎贝拉松开了抱住胸部的手，转而用双臂环抱住你的[ass]，将你拉向她和她那张大开的嘴。你的腿碰到了她的乳房，但她甚至没有注意到，而是用她丰满的嘴唇尽可能多地含住你的肉棒。尽管她温暖湿润的嘴巴感觉很好，但她的舌头才是最吸引你注意力的。它完全包围了你的下体，缠绕着肉棒，挠着下面，甚至还在抚弄——一个完美的、能灵活抓握的射精辅助工具。[pg]");
               outputText("你再也忍不住了，伊莎贝拉也感觉到了——她甚至抬起头，让你更容易抓住。滚烫的精液以创纪录的速度穿过你的尿道，在狂喜的驱使下，你尽可能深地将自己推入她的体内。她出人意料地吞下了大量的肉棒，没有丝毫的结巴，只是对你即将到来的捐赠发出幸福的呻吟。");
               if(get_player().cumQ() < 100)
               {
                  outputText("你将精液深深地射入她的喉咙，惊叹于她吞咽的速度。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("温暖的精液直接泵入伊莎贝拉的喉咙，她的脖子微微鼓起，开心地将它们吞下。");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("看到你能将如此多的精液倾注到她的嘴里，她的眼睛微微凸起，脸颊和脖子都鼓了起来，努力跟上你的节奏。当她终于把这些东西咽下去后，她对着你的肉棒松了一口气。");
               }
               else
               {
                  outputText("当你射精——射精——再射精，一串串的精液涂满她食道的内壁时，伊莎贝拉露出了真正关切的表情。她几乎无法应付如此大量的精液，尽管她正在尽可能快地吞咽，但精液仍然从她的嘴角和鼻孔溢出。最后，你的阀门终于关上了，她吞下了足够的精液，终于能够再次呼吸。事后她的肚子明显圆润了许多，但她只是揉了揉，似乎非常满足。");
               }
               outputText("[pg]");
               if(isabellaAccent())
               {
                  outputText("[say: 简直太完美了，]当伊莎贝拉终于将嘴唇从你仍在颤抖的阴茎上移开时，她呻吟着说。你微笑着翻身下马，扶她站起来。新增加的内容物导致她胃里的东西再次翻滚，迫使她打了个小嗝。[say: 抱歉，]她嘟囔着，你们对整个经历相视一笑。她眨了眨眼，走回自己的铺位。你能感觉到伊莎贝拉气体的效果正在消退，在接下来的一个小时里，当你慢慢恢复正常时，你开始思考给她喂更多超级牛奶的后果。那可能会很酷……");
               }
               else
               {
                  outputText("[say: 简直太完美了，]当伊莎贝拉终于将嘴唇从你仍在颤抖的阴茎上移开时，她呻吟着说。你微笑着翻身下马，扶她站起来。新增加的内容物导致她胃里的东西再次翻滚，迫使她打了个小嗝。[say: 抱歉，]她嘟囔着，你们对整个经历相视一笑。她眨了眨眼，走回自己的铺位。你能感觉到伊莎贝拉气体的效果正在消退，在接下来的一个小时里，当你慢慢恢复正常时，你开始思考给她喂更多超级牛奶的后果。那可能会很酷……");
               }
            }
            else
            {
               outputText("伊莎贝拉决定采取主动，托起你的一只乳房，将它拉到嘴边。她那丰满的嘴唇包住你已经很敏感的乳头，这种感觉让你不由自主地后退。为了不让她占上风，你张大嘴巴，吞没了她那四个漏奶的乳头。你们俩就像在比赛一样，一边吸吮着一只乳房，一边揉捏着另一只。随着这场较量的继续，她的脸红得更深了，但直到你的大腿擦过她的大腿，你才真正意识到她的性唤起。大量的淫液涂抹在你的[skinfurscales]上。[pg]");
               outputText("你将牛娘放倒在地上，然后跟了上去，你们俩仍在热情地吸吮着。她用空闲的手在你的身上游走，顺着你腰部的曲线滑下，调皮地捏了捏你的[ass]。你发出一声闷闷的满足呻吟，也跟着照做，将手滑下她的腹部。你的手指分开她厚实、湿透的阴唇，滑了进去。仅仅几秒钟的挠痒，她的小阴蒂就在你手中肿胀起来。伊莎贝拉的双膝撞在一起，但她吸吮的力度却加倍了。[pg]");
               outputText("她摸到了你的入口并插了进去，突然间，比赛的赌注翻倍了；谁先泌乳，谁先高潮。然而，可怜的伊莎贝拉因为做牛娘的时间更长而处于劣势；你能感觉到她的乳头在抽动，你怀疑你已经赢得了比赛的第一阶段。一股温暖、奶油般的乳汁泵入你的嘴里，你被迫快速吞咽以跟上她喷射的乳房。[pg]");
               outputText("然而，泌乳似乎是她的临界点。她在你的手上摩擦了几次，然后猛烈地高潮了。伴随着她高潮时狂喜的叫声，一股如洪流般的淫液流过你的手指，在地上汇聚成一滩。你很快也高潮了，用你狂欢的体液填满了她的手掌和脸颊。[pg]");
               outputText("几分钟后，你们俩从高潮后的慵懒中苏醒过来，躺在这场短暂而甜蜜的冒险的余韵中。伊莎贝拉没有说话，只是向你飞吻，然后翻身站起，步履蹒跚地走回她的铺位。你在那里躺了剩下的一个小时，感觉她打嗝的影响慢慢消退。");
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function AllowIzzyMilkerUse() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你微笑着告诉伊莎贝拉，只要她觉得憋得慌，随时都可以来这里，只要还能留够你们一起找乐子的量就行。伊莎贝拉再次拥抱了你，她的乳房和乳头紧紧贴在你的");
         if(get_player().get_tallness() < 72)
         {
            outputText("脸上");
         }
         else
         {
            outputText("胸前");
         }
         outputText("，她向你保证，只要她和你在一起，你永远是第一位的。[pg]");
         if(get_player().hasCock())
         {
            outputText("（你有一种预感，如果你去农场“探索”，也许能撞见她在使用挤奶器，前提是她最近没有被挤过奶。）[pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,375,-1);
         get_inventory().takeItem(get_consumables().IZYMILK,get_camp().returnToCampUseOneHour);
      }
   }
}

