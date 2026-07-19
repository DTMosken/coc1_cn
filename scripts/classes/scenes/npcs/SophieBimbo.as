package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._SophieBimbo.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class SophieBimbo extends NPCAwareContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var eggTypes:Array;
      
      public var eggColors:Array;
      
      public function SophieBimbo()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         eggTypes = null;
         eggColors = ["黑色","蓝色","棕色","粉色","紫色","白色"];
         globalSave = false;
         saveVersion = 1;
         saveName = "sophiebimbo";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function yesToSophieIncest() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你对着满脸期待的女孩咧嘴一笑，凑上前去亲吻她的嘴唇，同时伸手抓住她那富有弹性的屁股。你紧紧握住那丰满的臀部，将她拉向自己，拍打着她那颤动的双颊。你粗暴的动作让这只刚刚成年的鹰身女妖发出了饥渴难耐的尖叫。你对着曲线迷人的女儿坏笑，告诉她，就像她母亲一样，她是她们种族中美丽、丰满的典范。你再次将她拉入怀中亲吻，将舌头滑入她温暖的口中。她将一条粗壮、充满生育力的大腿缠绕在你身上，回应着你的吻，将身体更紧密地贴向你。");
         outputText("[pg][say: 哦哦哦！真幸运！太不公平了，把[name]一个人霸占了，]索菲嘟着嘴看着你和女儿亲热。你在吻中咧嘴一笑，退后一步，将女儿放回巢穴，然后拉起索菲轮到她了。你的");
         if(bimboSophie())
         {
            outputText("私人无脑花瓶");
         }
         else
         {
            outputText("饥渴主母");
         }
         outputText("非常乐意回报你突如其来的爱意，她的双手在你身上游走，挑逗地在你身上摩擦。你用张开的手掌在她屁股上狠狠拍了一下，放开了她，告诉两只鹰身女妖你很快会再和她们玩。两个饥渴的女孩咯咯笑着，开始讨论她们将要拥有的所有乐趣。");
         dynStats(DynStat.Lust(5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,743,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function yesSophieSleepWith() : void
      {
         clearOutput();
         sophieSprite();
         outputText("当你同意时，索菲兴奋地拍着手，立刻扑上来给你一个拥抱，将她那");
         switch(get_pregnancy().get_event())
         {
            case 1:
               outputText("隆起的");
               break;
            case 2:
               outputText("肿胀的");
               break;
            case 3:
            case 4:
               outputText("巨大、沉甸甸的");
               break;
            default:
               outputText("紧绷的");
         }
         outputText("腹部和柔软的胸部紧紧贴着你。[say: 你太棒了，[name]，你知道吗？你绝对是" + get_player().mf("帅气","可爱") + "又棒极了！] 她转过身，开心地跳着舞，一边走一边朝你的方向摇晃着她那丰满的臀部。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Sophie");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function watchIzmaSophie() : void
      {
         clearOutput();
         outputText("[say: 现在，我们按我的方式来，]伊兹玛说。[say: 如果你想按你的方式来，你刚才就应该更好地反抗。]她兴高采烈地摸着鹰身女妖的屁股，让索菲再次来回晃动。一根红色的手指缓慢地试探性地插入那多汁、充满蜜液的通道，引发了这个被绑住的无脑荡妇一连串淫荡的呻吟。[say: 是啊……你喜欢这样，不是吗，你这个贪婪的小荡妇？天哪，我敢打赌你整天无所事事，就是在想新办法弄点硬东西进去，对吧？好吧，你应该多动动脑子，因为在你的药效过去之前，这个小穴是属于我的。然后呢？然后，我要把你吊一会儿，让你好好反省一下你的错误。]");
         outputText("[pg]索菲的眼睛听到这话亮了起来。[say: 你保证？]她用疑问的语气娇嗔道。[say: 你真的要操我吗？]");
         outputText("[pg]伊兹玛一只手抓住她坚挺的肉棒，然后把它拍在索菲的阴阜上，汁液四溅，鹰身女妖的淫液立刻润滑了她的肉棒。她把一只带条纹的手放在这个大胸女人的腰部，用力将她向后推，使她摇晃到接近水平的位置。伊兹玛微笑着调整了她那十五英寸怪物的角度，随着索菲的惯性耗尽，重力不可抗拒的拉力逆转了运动，将这个湿透了的羽毛荡妇的裂口径直拉向那根等待着的条纹肉棒。");
         outputText("[pg]伴随着短暂的“哧溜”声，紧接着是肉体碰撞的清脆回声，两人的下体撞击在一起，随后是一声愉悦的尖叫。索菲呻吟着，[say: 哦哦哦，这完全戳中要害了，]她适应着体内那根巨大的红橙色肉棒。两对曲线优美的奶子挤压在一起，女人们调整着姿势，每一对坚挺的乳头都压在对方身上，滑过彼此布满颗粒、汗津津的乳晕。当她们固定好姿势时，每个女孩的嘴里都发出热烈、兴奋的呻吟，当伊兹玛将手陷入索菲的屁股并开始将她来回摇晃，把她当成一个私人飞机杯时，这种呻吟达到了顶峰。");
         outputText("[pg]这一幕让你非常兴奋，你一边看一边开始自慰，享受着这一切带来的偷窥快感。此时索菲已经公然喘息起来。她的小穴被伊兹玛粗大坚硬的肉棒明显撑开，厚实的阴唇在条纹肉棒周围痉挛，试图在每次弹跳时紧紧抓住它，当她弹开时，阴唇微微拉伸，仿佛要抓住它不放。来回晃动，这个被欲望冲昏头脑的鹰身女妖就像一个性爱秋千，无助地被绑着，完全任由这个更强大的女孩摆布。她在每次弧线的最低点都发出愉悦的娇喘，摇晃着她的奶子，那沉重、丰满的重量随着每一次抽插撞击着伊兹玛较小的那对。");
         outputText("[pg][say: 接受吧，你这个大奶荡妇！]伊兹玛咆哮着，用力抽插着那个流着口水的鹰身女妖小穴。[saystart]你能吃到肉棒就已经很幸运了");
         if(get_player().hasCock())
         {
            outputText("，不管是我还是我的阿尔法");
         }
         outputText("。如果按我的意思，你早被绑在湖边了，这样我的姐妹们就能玩弄你这对荒谬的奶子，同时把你的肥臀塞满精液，让你的肚子里怀满小鲨鱼。[sayend]");
         outputText("[pg]索菲在淫荡的娇喘声中咯咯笑着，[say: 噢噢，宝贝，你简直太坏了！用力操我，求你了！用那根粗大的鲨鱼鸡巴塞满我的小穴！]");
         outputText("[pg]这个身上有条纹的湖滨居民松开了索菲的肥臀，双手上移，抓住了那对起伏的肉球。她纤细的手指深深陷入鹰身女妖柔软的肌肤中，没过多久，那双乱摸的手就抓住了每只乳房顶端的乳头，来回揉捏着敏感的蓓蕾。伊兹玛的臀部继续无情地挺动着，听起来就像在拍打被绑猎物的小穴。每次这临时的秋千将她们的下体结合在一起，都会伴随着一声回响和喷溅而出的鹰身女妖淫液。你可以看到伊兹玛那四个精液工厂在囊袋里跳动，在索菲药物的作用下，看起来肿胀得厉害。");
         outputText("[pg]伊兹玛的睫毛危险地颤动着，她在自制的捆绑架上颠簸着被绑住的女人，尽情地玩弄着她的奶子，感受着它们在自己手中的挤压、变形和弹跳，同时粗暴地操弄着这个沉迷化妆的荡妇的小穴。伊兹玛不假思索地开始亲吻索菲，正中她那被称为嘴巴的金色、像被蜜蜂蛰过一样的嘟嘟唇。琥珀色的唇彩立刻也涂满了鲨鱼女孩的嘴唇，她立刻意识到了这个错误。");
         outputText("[pg][say: 操！] 伊兹玛叫道，中断了亲吻，[say: 我没有……你让……该死！啊，管他呢。] 她再次抓住这个大屁股无脑花瓶丰满的臀部，开始急切地加快摇晃的速度，用坚定有力的抽插操弄着索菲的小穴，她的手臂加快了这位成熟主妇下落的速度，以确保每次插入都比之前更快、更猛烈。这位占主导地位的水生双性人再次沉浸在亲吻中，这次她没有退缩。她的舌头滑过鹰身女妖毫不抵抗的嘴唇，在里面探索，同时她继续抽插，让自己的身体享受体内药物指示她去寻找的快感。长着翅膀的女人的丰满臀瓣一次又一次地颤抖着，淫荡地起伏跳动，露出她的后庭和漏水小穴的底部，现在正快乐地张开，迎接那根在最深处耕耘的粗大红色鸡巴，那根鸡巴肉眼可见地跳动着，尿道随着高潮的临近有节奏地扩张。");
         outputText("[pg]索菲发出催眠般的呼噜声，[say: 噢噢，快给我吧！把那些精液都射出来！为你最喜欢的、漂亮的小鸟射精吧……] 听到这话，伊兹玛突然停止了亲吻，眼睑低垂，嘴巴幸福地张开。她的喉咙深处发出一声低沉的呻吟，伴随着你自己发出的微弱、狂喜的喘息。这些话令人难以抗拒地兴奋，你的高潮在你不经意间爆发了。你的整个背部都在兴奋中颤抖，你只是看着这一幕，同时");
         if(get_player().hasCock())
         {
            outputText("在极乐中抚摸自己");
         }
         else
         {
            outputText("在极乐中用手指抠弄自己");
         }
         outputText("。伊兹玛那四个装满精液的睾丸突然在她紧绷的囊袋中升起，开始与她的鸡巴同步跳动。起初，没有明显的变化，但没过多久，精液开始在抽搐的鲨鱼肉棒周围冒出泡泡，溅落到下面的地上。你自己的高潮也逐渐平息");
         if(get_player().hasCock())
         {
            if(get_player().cumQ() >= 1000)
            {
               outputText("，让你留在一滩自己黏糊糊的体液中");
            }
         }
         outputText("。伊兹玛继续徒劳地抽插了一会儿，你看到索菲的肚子因为大量的精液注入而微微隆起。");
         outputText("[pg]伊兹玛喘着粗气，带着心满意足的叹息从她自制的奶油派中拔出，但她的鸡巴依然像以前一样硬，尽管她的囊袋看起来小了一点。她一边摇摇晃晃地走开，一边大声呻吟着，嘴里嘟囔着几分钟后要回来“检查”一下鹰身女妖。她走的时候，手试探性地套弄了几下，考虑到她接触了那么多口红，你确信她很快就会回来。她一离开视线，索菲就展开翅膀，轻松地挣脱了绳结。她挣脱束缚落到地上，然后把一根手指伸进还在流口水的小穴里，接着吸进嘴里品尝。[say: 嘿嘿，愚蠢的鲨鱼！] 她一边唱着一边轻快地走开。[say: 我得记住在她回来之前赶回来……这简直太好玩了！]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         doNext(playerMenu);
      }
      
      public function unlockResistance() : void
      {
         if(get_player().hasCock())
         {
            outputText("[pg]到现在为止，鹰身女妖口红的效果应该已经开始显现了，但你并没有感觉到有什么不同。当然，你感觉很硬，准备好把卵射进最近的鹰身女妖体内，但同时，你已经非常习惯这种感觉了。这几乎就像你的身体在多次重复涂抹后，已经适应了这种含有药物的口红的效果。见鬼，你甚至可能让一群母狗把这玩意涂满你的全身，你也不会觉得困扰！也许你甚至可以随身带着它，用来对付男性敌人？[pg]");
         }
         else
         {
            outputText("[pg]你已经非常习惯嘴唇上涂有鹰身女妖口红了，你确信自己对它免疫，即使你长出了阴茎。如果你能找到的话，你甚至会很乐意随身带着它，用来对付男性敌人。[pg]");
         }
         outputText("<b>(解锁特质：适应淫纹唇膏 - 你的最低欲望永久提高，但你对欲望的抵抗力增加10%。在战斗中，你对它免疫，尽管在做爱时它仍然会给你带来快感。你也足够适应它，如果你能找到的话，你可以像鹰身女妖一样使用它。)</b>[pg]");
         get_player().createPerk(PerkLib.LuststickAdapted,0,0,0,0);
      }
      
      public function tellSophieToVisitIzma() : void
      {
         clearOutput();
         outputText("你建议她再去拜访伊兹玛。也许这次她不会再被绑起来了？");
         outputText("[pg]索菲尖叫道，[say: 真的吗？] 然后向营地的另一边飞去。这应该会很有趣。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,781,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stopHarvest() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你告诉索菲不要再给你蛋了；你宁愿她把它们用来为农场赚钱。");
         if(get_silly())
         {
            outputText("[pg][say: 我真希望我能有你那样敏锐的财务头脑，以及对小规模农业供需的把握，宝贝。你说了算！]");
         }
         else
         {
            outputText("[say: 我真希望我擅长算数之类的，]索菲渴望地叹了口气，抠着肚脐眼。[say: 那样我就知道什么时候把蛋给你，什么时候给狗狗了。反正你说了算，宝贝！]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1102,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function sophiesEggHatches() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,742,0);
         sophieSprite();
         outputText("[pg]营地的宁静突然被响亮的鸟叫声和尖叫声打破。到底是什么让索菲如此激动？你叹了口气，走向你那长着羽毛的");
         if(bimboSophie())
         {
            outputText("无脑花瓶般的");
         }
         else
         {
            outputText("女人");
         }
         outputText("大吵大闹的地方。一看到索菲，你就不禁注意到翅膀的拍打声和散落一地的羽毛。这个");
         if(bimboSophie())
         {
            outputText("愚蠢的");
         }
         outputText("鹰身女妖又在为她刚生下的蛋大惊小怪了，不过这次她似乎更加慌乱了。看到你，她的脸瞬间亮了起来，一个灿烂");
         if(bimboSophie())
         {
            outputText("、快乐");
         }
         outputText("的笑容在她丰满的金色嘴唇上蔓延开来，她蹦蹦跳跳地向你跑来，抓住你的手。");
         if(bimboSophie())
         {
            outputText("[pg][say:是时候了！是时候了！我们的蛋真的要孵化了！快来，宝贝！来看看你毛茸茸的新小可爱！]她一边说，一边把你拉到她的巢穴。你一到那里，就已经能明白这个兴奋的无脑花瓶的意思了。蛋在扭动和摇晃，坚硬的外壳上出现了裂缝，仿佛里面的东西正试图破壳而出。既然你在这里看着，索菲就放开了你，蹦蹦跳跳地走向她珍贵的蛋。她温柔地抚摸着它，对它发出咕咕的声音，为她的小鹰身女妖宝宝加油。索菲可能是一个愚蠢好色的无脑花瓶，但她似乎仍然非常关心她的后代。");
         }
         else
         {
            outputText("[pg][say:是时候了！是时候了！我们的蛋要孵化了！快来！来看看你的新女儿！]她一边说，一边把你拉到她的巢穴。你一到那里，就已经能明白这位准妈妈在说什么了。蛋在扭动和摇晃，坚硬的外壳上出现了裂缝，仿佛里面的东西正试图破壳而出。既然你在这里看着，索菲就放开了你，蹦蹦跳跳地走向她珍贵的蛋。她温柔地抚摸着它，对它发出咕咕的声音，为她的小鹰身女妖宝宝加油。索菲可能有点专横，但她对她的后代展现出的只有无限的温柔。");
         }
         outputText("[pg][say:哦，它来了！加油，亲爱的，你快出来了，]她对她的蛋咕咕地说。仿佛受到了母亲呼唤的鼓舞，蛋摇晃得更厉害了，蛋壳上裂开了大大的裂缝。你发现自己对鹰身女妖女儿的长相很感兴趣，于是走近了一步，屏住呼吸看着一只长着利爪的脚从蛋里爆裂而出。仅仅几秒钟后，一只手砸穿了蛋壳。一次又一次，你刚出生的女儿将她蛋的束缚外壳打破，直到她摆脱了旧家保护性的束缚。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) < 4)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 0)
            {
               outputText("[pg]当你看到你刚出生的——或者是刚孵化出的？——女儿时，脑海中浮现的第一个词是……“毛茸茸的”。她身上覆盖着可爱柔软的粉色绒毛，一双蓝色的大眼睛好奇地四处张望。她看起来可爱极了");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  outputText("，尽管她的嘴唇比你想象的要大一点——也许是遗传了她妈妈？");
               }
               else
               {
                  outputText("。");
               }
               outputText("这只鹰身女妖雏鸟实际上大约有四五岁孩子那么大，她好奇地抬头看着索菲。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,750,1);
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 1)
            {
               outputText("[pg]你可能会想，既然这是你第二次看到索菲的蛋孵化，你应该更习惯这种场面了，但这景象依然让你感到惊叹");
               if(get_player().cor > 66)
               {
                  outputText("那么一点");
               }
               outputText("。这只刚孵化出的雏鸟看起来和另一只差不多大——大概四五岁的样子。与第一只不同，她的脸看起来相当正常，不过你觉得以她的五官，长大后肯定是个美人。她的屁股和臀部比她姐姐稍微丰满一些，眼睛是紫罗兰色的，而羽毛则和她母亲一样 - ");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  outputText("白金色的");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,751,1);
               }
               else
               {
                  outputText("纯粉色的");
               }
               outputText("。她的羽毛显然也更长，尽管现在还只是毛茸茸的绒毛。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 2)
            {
               outputText("[pg]你再次目睹了另一只鹰身女妖体验她难忘生命中的最初时刻。这只拥有完美、看起来很正常的比例，虽然她明显有着象征她种族特征的宽大臀部，但远没有她那个大屁股姐姐的那么大。最令人惊讶的是，她没有她妈妈和姐姐们都有的利爪。取而代之的是，她长着正常的人类双脚。索菲担忧地皱起了眉头，但你忍不住想，这鬼地方总算有个孩子长得像你了。她的眼睛是锐利的紫罗兰色，而她的羽毛则是深紫色的。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,752,1);
               }
            }
            else
            {
               outputText("[pg]你的第四个孩子似乎在各方面都像她妈妈。她有着和索菲一样的蓝眼睛，粉色的羽毛");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  outputText("就像她母亲变成无脑花瓶前那样");
               }
               outputText("，而且她的体型似乎预示着她成熟后会非常丰满。她好奇地环顾四周，已经开始拍打着翅膀，那翅膀似乎比她姐姐们在这个年纪时发育得更好。你不得不好奇，随着年龄的增长，它们会长到多大。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,753,1);
               }
            }
            if(bimboSophie())
            {
               outputText("还没等女孩尝试站起来，她就被狂喜的母亲一把抱起。[say: 噢噢噢噢，看看你！我的宝贝女儿太可爱了！毛茸茸的，而且，超级柔软！]");
            }
            else
            {
               outputText("还没等女孩尝试站起来，她就被狂喜的母亲一把抱起。[say: 噢噢噢噢，你太可爱了！我的宝贝女儿太可爱了！哦，等你长大了，男孩子们肯定会为你疯狂的，我敢肯定！]");
            }
         }
         else
         {
            outputText("[pg]你永远看不腻这一幕，年轻的鹰身女妖破壳而出，蛋壳碎片散落在巢穴周围，毛茸茸的小鹰身女妖钻了出来。这个");
            if(Utils.rand(2) == 0)
            {
               outputText("粉色的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
            {
               outputText("金色的");
            }
            else
            {
               outputText("白色的");
            }
            outputText("女孩咕咕叫着，遮挡着她的");
            if(Utils.rand(2) == 0)
            {
               outputText("紫色的");
            }
            else
            {
               outputText("蓝色的");
            }
            outputText("眼睛，挡住阳光。小鸟娘很快就破壳而出了，但看起来已经有四五岁大了。和往常一样，这个可爱的小家伙就像刚出生的小鸡一样毛茸茸的，羽毛向四面八方翘起，让她看起来更像是一个露出皮肤的毛球，而不是一个小鹰身女妖宝宝。女孩还没来得及尝试站起来，就被她欣喜若狂的母亲一把抱起。");
            if(bimboSophie())
            {
               outputText("[say: 哦哦哦，快看看你！我的宝贝女儿太可爱了！毛茸茸的，超级柔软！]");
            }
            else
            {
               outputText("[say: 哦哦哦，你太可爱了！我的宝贝女儿太可爱了！哦，等你长大了，男孩子们一定会为你疯狂的，我敢肯定！]");
            }
         }
         outputText("[pg]小鹰身女妖发出一声惊讶的叫声，没想到她的母亲会这么激动。她在索菲的怀里扭动着，感到害怕，不知道该怎么对付这个抓住她的巨乳怪物。");
         if(bimboSophie())
         {
            outputText("[say: 哦，亲爱的，乖，乖，冷静点，甜心。别担心，索菲妈妈在这里。] 这位慈祥的鹰身女妖温柔地将这个扭动的毛球抱进她那巨大柔软的乳房里，双手轻轻抚摸着她那挑剔的女儿毛茸茸的头发。");
         }
         else
         {
            outputText("[say: 乖，乖，冷静点，宝贝。索菲妈妈在这里……我在这里。] 这位慈祥的鹰身女妖温柔地将这个扭动的毛球抱进她那巨大柔软的乳房里，双手轻轻抚摸着她那挑剔的女儿毛茸茸的头发。");
         }
         outputText("[pg]在如此温柔的母爱下，你的小女儿终于平静下来，发出一声吱吱声，然后依偎在母亲柔软温暖的乳房里。她温柔地将脸贴在那片柔软上，双臂紧紧抱住索菲。看到这甜得发腻的一幕，你忍不住笑了。");
         outputText("[pg]不想错过这有趣的时刻，你走上前去，拥抱你毛茸茸的家人，向你刚出生的女儿展示她在这里有一个家。你紧紧地抱着你的鸟类爱人和后代，毛茸茸的羽毛让你的[skinfurscales]感到痒痒的。你的触摸似乎让索菲更加高兴了，亲密的接触让她嘴角泛起一个大大的傻笑。[say: 哦，宝贝，我们生了个真可爱的小家伙，不是吗？]");
         outputText("[pg]你对着你的");
         if(bimboSophie())
         {
            outputText("曲线优美的无脑花瓶咧嘴一笑，你伸出手抓住她那巨大圆润的屁股，用力捏着把她拉近。粗暴的抓捏让你的熟女鹰身女妖发出一声惊讶的喘息。[say: 呀！宝贝……别在我们的雏鸟面前！嗯，好吧，索菲妈妈很乐意和你玩，宝贝，先让我把我们的小女孩放在这里睡个午觉。然后你和我就可以，完全开始把另一个蛋放进我肚子里了！][pg]");
         }
         else
         {
            outputText("曲线优美、充满母性的鹰身女妖咧嘴一笑，你伸出手抓住她那巨大圆润的屁股，用力捏着把她拉近。粗暴的抓捏让你的熟女鹰身女妖发出一声惊讶的喘息。[say: 哦，[name]……别在我们的雏鸟面前！嗯，好吧，索菲妈妈很乐意和你玩，宝贝，先让我把我们的小女孩放在这里睡个午觉。然后我会好好照顾你的，我那精力充沛的" + get_player().mf("种马","繁育者") + "……][pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,741,336);
      }
      
      public function sophieSprite() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) == 0)
         {
            spriteSelect(SpriteDb.get_s_sophieBimbo());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_sophie());
         }
      }
      
      public function sophieSeasonExpiration() : void
      {
         sophieSprite();
         outputText("[pg]索菲不再在你身边表现得那么古怪了，虽然她的举止依然充满欲望，但她似乎不再那么专注于让肉棒插进她的小穴了。<b>她的发情期，或者说这些鸟脑鹰身女妖类似的时期，已经结束了。</b>[pg]");
      }
      
      public function sophiePreggoTitJobs() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         sophieSprite();
         outputText("你掏出[oneCock]并指向索菲的乳房，表示你想操它们。她将双臂交叉在弹性的胸部下方，将乳房挤在一起，形成了一道可以操的乳沟峡谷。她吧唧着嘴唇，期待地流着口水，说道：[say: 所以你想操索菲妈妈怀孕的乳房，是吗？] 你盯着那片颤动的、光滑的、奶油般的胸部，立刻硬了起来，变得比以前更粗了。索菲前后摇晃着，引发了一场巨大的乳房地震，她的双手开始在那片宽阔的肉体上慢慢游走，试图仅用她的乳房来诱惑你。她不知从哪里拿出一瓶琥珀色的液体（你打赌是唇彩），倒在她的乳房上，确保大部分都倒在中间，你的阴茎很快就会依偎在那里。");
         outputText("[pg]索菲的乳沟本来就很诱人，但当整个胸部裂缝像贵金属一样闪闪发光，散发着蜂蜜的味道，并且如此诱人地弹跳时，你感到自己被不顾一切地吸引了，你的[legs]不由自主地移动，带你靠近那闪亮的乳房。她接住一滴液体，把它涂在乳头上。她的手指一圈又一圈地转动，每一圈都留下一层更厚的反光材料。一旦她那巨大的乳头被适当地装饰好，她就把最后一点黄色的颜料挤到乳头的顶端，完成了着色。你无意中舔了舔嘴唇，知道如果你的嘴唇碰到那个乳头，或者你的阴茎碰到那个被催情剂毒害的山谷，就意味着陷入无法控制的发情期。这只永远多情的鹰身女妖在另一边重复着这个动作，然后放弃了，让金色的液体流到她的胯部，这是一条淫秽的、反光的快乐小径，当你向她走去时，你的眼睛高兴地上下追随。");
         outputText("[pg]索菲咕哝着，[say: 哦，你已经准备好了，是吗，[name]？索菲妈妈给你一个好运之吻怎么样？] 她抬起乳房，把它们挤在一起，乳头对着乳头，离你的脸只有几英寸。反正你也要操她的乳房……你还不如享受整个过程。把它们都吸进嘴里，你让你的舌头在双峰上游走，一种化学的嗡嗡声立刻滑过你的口腔黏膜。你的嘴唇滑过镀金的乳晕，吸收了更多的药物。冒泡的欲望在你的身体里泵动，直达你的腹股沟，在那里它开始嗡嗡作响，[eachCock]里一种令人愉快的刺痛感让你觉得准备好操翻整个世界，从山上的每一只鹰身女妖开始！不过现在，你继续亲吻那些乳头。蜂蜜的味道让它们很容易享受，而索菲的呻吟声让你知道这些喜爱不仅仅是被感激的。");
         outputText("[pg]突然，那琥珀色的凸起被抽走了，你晕眩地踉跄了一下，意识到你刚才一直没有呼吸。索菲在你面前跪下，托着你的[butt]支撑着你。她深情地揉捏着你，同时亲吻着你的" + get_player().cockHead(_loc1_) + "。");
         if(get_player().cockTotal() > 1)
         {
            outputText("然后，她摸索出");
            if(get_player().cockTotal() == 2)
            {
               outputText("另一个");
            }
            else
            {
               outputText("其余的");
            }
            outputText("从你的[armor]里，给");
            if(get_player().cockTotal() == 2)
            {
               outputText("它");
            }
            else
            {
               outputText("每个");
            }
            outputText("一个缓慢的，深情的抚摸，然后她回到她的目标。");
         }
         outputText("敏感的顶端在她的嘴里肿胀，回应着湿漉漉的、丰满的嘴唇亲吻和现在在你体内流淌的药物的结合。");
         outputText("[pg]你那渴望阴茎的曲线女王向后靠去，让你滑脱，当她拱起背部，把她巨大的乳房投入使用时，一条金色的唾液线将你们连接在一起。当你不受限制的勃起向前倾斜，浸入她为你制作的光滑山谷时，她把它们张得很大。她的口红非常光滑，你的" + get_player().cockDescript(_loc1_) + "的整个下侧立刻被反光的催情剂镀上了金。丰满的鹰身女妖从两侧压入她的乳房，紧绷度的变化立刻被你敏感的阴茎肉注意到。一种美味的、温暖的摩擦从四面八方包裹着你的男性特征。光滑的、涂满唇彩的皮肤似乎从各个角度抚摸着你，紧紧地压缩着你的周长，因为索菲的手完成了把她乳房的令人愉快的力量发挥到充分的色情效果。你的[legs]颤抖着，你的头在砰砰直跳，因为你太渴望做爱了，一次射精——任何能让你达到高潮的东西。");
         outputText("[pg]你低头看着索菲，那个无脑花瓶也看着你，慢慢地用舌头舔着她的上唇，颜色和你的阴茎一样，完美匹配。她戏弄道，[say: 超级棒，不是吗？来，让我把它变得更好！] 在你还没弄明白发生了什么之前，索菲就把她的乳房往下推，迎合着");
         if(get_player().cocks[_loc1_].cockLength > 30)
         {
            outputText("你那巨大勃起的根部");
         }
         else
         {
            outputText("你的" + get_player().cockHead(_loc1_) + "");
         }
         outputText("，她的嘴唇已经撅成了一个丰满的、专门用来吸吮肉棒的欢愉甜甜圈。当你的" + get_player().cockDescript(_loc1_) + "");
         if(get_player().cocks[_loc1_].cockLength > 30)
         {
            outputText("抵住");
         }
         else
         {
            outputText("滑入");
         }
         outputText("她那肿胀、撅起的孔洞时，发出的声音湿润得难以形容，那是一种黏糊糊的吸吮声，如果不是她的乳房和嘴巴已经榨出了源源不断的汁液，光是这声音就能让你滴下前列腺液。");
         if(get_player().cocks[_loc1_].cockLength > 30)
         {
            outputText("索菲向后退去，喘着气，[say:你太长了，我连龟头都含不住！]");
         }
         outputText("[pg]你忍不住晃动你的[hips]，但你刚一动，索菲就把她的乳房移开了。[say:宝贝，就让我来榨干你的肉棒吧。别动，我保证会让你爽上天的。]为了强调，她诱人地晃了晃她的奶子。");
         outputText("[pg]你是让她随心所欲地用乳房摩擦你的肉棒，还是把她推倒，在她那对因怀孕而变大的巨乳上尽情狂欢？");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
         menu();
         addButton(0,"随她去",letSophieMilkYoDick);
         addButton(1,"尽情狂欢",goHogWildOnSophieBewbs);
      }
      
      public function sophiePregChance() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0)
         {
            return;
         }
         if(Utils.rand(4) == 0 || get_player().cumQ() > Utils.rand(1000))
         {
            get_pregnancy().knockUpForce(25,168);
         }
      }
      
      public function sophieMoveInAttempt() : void
      {
         clearOutput();
         sophieSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,739,1);
         outputText("索菲向你走来，她那通常空洞的脸上带着一种特别严肃的表情，紧张地将食指对在一起。她平时的步伐夸张而性感，但现在却显得温顺而拘谨。你歪着头，好奇地看着她。");
         outputText("[pg][say: 我能，晚上和你一起睡吗？我想……也许……既然你让我怀……怀……怀孕了什么的，你不会介意我们睡觉的时候我依偎着你吧？] 她满怀希望地问道，无辜地向你眨着长长的睫毛。[say: 我保证，我不会在夜里打扰你或者吵醒你什么的……我只是想在冷的时候，有个人可以抱抱。] 她立刻补充道：[say: 而且我是一个非常好的枕头，自从你给我喝了那种饮料之后！] 索菲为了证明效果，调皮地抖了抖她的胸部，红着脸等待你的回答。");
         outputText("[pg]这个无脑花瓶鹰身女妖似乎是真心渴望陪伴，不过从她那裂缝里流出并顺着她" + (get_noFur() ? "" : " 长满羽毛的") + "大腿流下的液体来看，她很可能会在某个时候和你做爱，即使不是在半夜。你想让这个身材火辣的女孩晚上和你一起上床吗？");
         menu();
         addButton(0,"是",yesSophieSleepWith);
         addButton(1,"不了",noSophieSleepWith);
      }
      
      public function sophieKidMaturation() : void
      {
         clearOutput();
         sophieSprite();
         outputText("查看你正在成长的女儿时，你发现她又和她的母亲索菲在一起了。两只鹰身女妖正在闲聊着这个那个，突然你那看起来像青少年的女儿痛苦地呻吟起来。担心你后代的状况，你走近巢穴，仔细检查你的女儿。在她旁边，索菲拍打着翅膀，为女儿的健康而焦急。就在你眼前，你的女儿发生了变化——她原本平淡无奇的身体开始生长，女性的曲线优美地膨胀起来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,750) == 1)
            {
               outputText("[pg]她的胸部和嘴唇发育得非常显著，尤其是胸部。她的乳房巨大无比，类似于你在牛娘身上看到的那样，突出的乳头和柔软白皙的皮肤让你不禁想知道挤鹰身女妖的奶会是什么感觉。她肿胀的乳房实际上让她的母亲相形见绌，当女孩的嘴唇变得比她自己的还要丰满时，索菲嫉妒地看着。这个成熟女人的臀部只变宽了一点点，比大多数鹰身女妖的腰围要细一根头发，但仍然非常引人注目。她用手指触摸着她那像被蜜蜂蛰过一样丰满的嘴唇，呻吟着，显然很享受她那柔软的肉棒枕头带来的敏感。");
            }
            else
            {
               outputText("[pg]她的胸部和嘴唇发育得非常显著。对于鹰身女妖来说，她的乳房很大，类似于你在年轻牛娘身上看到的那样，突出的乳头和柔软白皙的皮肤让你不禁想知道挤鹰身女妖的奶会是什么感觉。她肿胀的乳房实际上勉强让她的母亲相形见绌，当女孩的嘴唇变得比她自己的稍微丰满一点时，索菲嫉妒地看着。这个成熟女人的臀部只变宽了一点点，比大多数鹰身女妖的腰围要细一根头发，但仍然非常引人注目。她用手指触摸着她那变大的嘴唇，呻吟着，显然很享受她的肉棒枕头带来的敏感。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,751) == 1)
            {
               outputText("[pg]她的屁股和臀部一起急剧膨胀。很快，这个刚成熟的鹰身女妖就拥有了足以与她母亲媲美的臀部，但这还不止于此。她巨大的臀部膨胀到完全无视重力的地步，那是一片颤动、柔软的屁股，让人忍不住想抓、捏，甚至操。她的胸部相当适中，大概是B或C罩杯。她全身的金色羽毛也变长了，她的“头发”垂到屁股下面，腿和手臂周围的羽毛蓬松而毛茸茸的，就像腿套和臂套一样。当变化完成时，她舔了舔嘴唇，欣赏着自己新的、豪华的臀部。");
            }
            else
            {
               outputText("[pg]她的屁股和臀部一起膨胀。很快，这个刚成熟的鹰身女妖就拥有了足以与她母亲媲美的臀部，但这还不止于此。她肿胀的臀部膨胀到非常豪华的地步，那是一片颤动、柔软的屁股，让人忍不住想抓、捏，甚至操。她的胸部相当适中，大概是A或B罩杯。她全身的羽毛也变长了，她的“头发”垂到屁股下面，腿和手臂周围的羽毛蓬松而毛茸茸的，就像腿套和臂套一样。当变化完成时，她舔了舔嘴唇，欣赏着自己新的、变大的臀部。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,752) == 1)
            {
               outputText("[pg]她长成了一个看起来完美的鹰身女妖——除了她的脚，仍然完全是人类的脚。她的臀部宽阔而漂亮，她的乳房只比鹰身女妖的平均水平大一点，最多可能是C或D罩杯，她的翅膀看起来和其他鸟类女人一样令人印象深刻。这个成熟的女人沮丧地跺着脚——显然她希望它能和她身体的其他部分一起改变。尽管如此，索菲在她耳边低语了一些话，让她脸红的同时又笑了。她抬起脚，蜷缩着脚趾，以一种全新的眼光看着自己。");
            }
            else
            {
               outputText("[pg]她长成了一个看起来完美的鹰身女妖——除了她的脚，仍然完全是人类的脚。她的臀部宽阔而漂亮，她的乳房只比鹰身女妖的平均水平大一点，最多可能是C罩杯，她的翅膀看起来和其他鸟类女人一样令人印象深刻。这个成熟的女人沮丧地跺着脚——显然她希望它能和她身体的其他部分一起改变。尽管如此，索菲在她耳边低语了一些话，让她脸红的同时又笑了。她抬起脚，蜷缩着脚趾，以一种全新的眼光看着自己。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,753) == 1)
            {
               outputText("[pg]她的屁股、臀部和胸部都在同等程度地膨胀，直到达到一个临界点才停下来，这让她和她的母亲平起平坐，也许只小了一个罩杯。她试探性地欣赏着自己崭新的身体，几乎没有意识到她的翅膀还在生长。当它们停止生长时，已经比她妈妈的要大得多，拖着一缕缕柔软的羽绒。她把翅膀卷在新的乳房周围，紧紧地挤压着那巨大的肉团，发出愉悦的呻吟。索菲微笑着说了一些关于翅交的事情，这让刚成年的鹰身女妖羞红了脸。");
            }
            else
            {
               outputText("[pg]她的屁股、臀部和胸部都在同等程度地膨胀，直到达到一个临界点才停下来，这让她和她的母亲平起平坐，也许只小了一个罩杯。她试探性地欣赏着自己崭新的身体，几乎没有意识到她的翅膀还在生长。当它们停止生长时，已经比她妈妈的要大得多，拖着一缕缕柔软的羽绒。她把翅膀卷在新的乳房周围，紧紧地挤压着那巨大的肉团，发出愉悦的呻吟。索菲微笑着说了一些关于翅交的事情，这让刚成年的鹰身女妖羞红了脸。");
            }
         }
         else
         {
            outputText("[pg]她的肉体泛起涟漪，臀部和屁股膨胀成宽阔的、适合生育的臀部，配上圆润成熟的屁股，简直是在乞求被拍打和抓捏。她曾经不起眼的乳房像洪水般涌出柔软的乳肉。不断生长的双球膨胀到几乎和索菲一样大，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
            {
               outputText("无脑花瓶般的");
            }
            outputText("乳房——同样高耸、圆润、挺拔，却又大又柔软，摸起来就像最柔软的枕头。");
         }
         outputText("既然变化已经停止，刚获得新身体的鹰身女妖松了一口气，显然对发生的事情感到惊讶，也很高兴一切都结束了。你走近一点，以便更好地观察你的女儿，欣赏着她崭新的身体。你曾经娇小的鹰身女妖女孩现在看起来更像是一个身材火辣的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("无脑花瓶");
         }
         else
         {
            outputText("性感尤物");
         }
         outputText("，就像她的母亲一样。");
         if(bimboSophie())
         {
            outputText("从她脸上好奇的神情和眼中闪烁的智慧火花来看，她似乎并没有失去理智，变成一个无脑花瓶。");
         }
         if(bimboSophie())
         {
            outputText("[pg][say: 哦！就像，我怎么了，[Daddy]？嗯……这具身体，简直太性感了！]你的女儿一边检查着自己崭新、更匀称的身体一边说道。看来她也继承了她母亲的说话方式。你可以猜到她可能也继承了她那贪得无厌的性欲……");
         }
         else
         {
            outputText("[pg][say: 哦，我怎么了，[Daddy]？这具身体好不一样……好奇怪……好……性感！]你的女儿一边检查着自己崭新、更匀称的身体一边说道。你可以猜到她可能也继承了她那贪得无厌的性欲……");
         }
         if(bimboSophie())
         {
            outputText("[pg][say: 甜心！看看你！你长成了一个性感尤物！妈妈真为你骄傲！宝贝，我们的小女孩是不是超级性感？！]索菲一边说着，一边把她刚成年的女儿推向你。你那快乐、曲线优美的女儿紧紧地抱住你，把她崭新的身体贴在你身上，在你的脸颊上亲了一口。她的吻在你的[skinfurscales]上留下了一个大大的金色唇印。[say: 你觉得呢，[Daddy]？我是不是超级无敌性感？]她问道，然后凑近你，把她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 1 ? "适中的胸部" : "巨大挺拔的乳房") + "贴在你身上，对你嘟起嘴，炫耀着她丰满诱人的嘴唇。");
         }
         else
         {
            outputText("[pg][say: 哇，你长成了一个漂亮的鹰身女妖！索菲妈妈真为你骄傲！[name]，我们的小女孩是不是个辣妹？！]索菲一边说着，一边把她刚成年的女儿推向你。你那快乐、曲线优美的女儿紧紧地抱住你，把她崭新的身体贴在你身上，在你的脸颊上亲了一口。她的吻在你的[skinfurscales]上留下了一个大大的金色唇印。[say: 你觉得呢，[Daddy]？我可爱吗？]她问道，然后凑近你，把她巨大挺拔的乳房贴在你身上，对你嘟起嘴，炫耀着她丰满诱人的嘴唇。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,743) == 1)
            {
               outputText("[pg]你点点头，告诉她她非常漂亮，就像她的妈妈和姐姐一样");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 1)
               {
                  outputText("");
               }
               outputText("。她对你绽放出一个灿烂的笑容，转过身来，诱惑地对你摇晃着她的屁股，[say: 那么，你什么时候想试试我呢，" + get_player().mf("Daddy","\'Mom\'") + "？]");
               outputText("[pg]你向她保证，在适当的时候你会的。");
            }
            else
            {
               outputText("[pg]你苦笑着，示意她把注意力转回她母亲身上，此时她母亲正兴奋地拍打着翅膀，向女儿保证，一旦她有了自己的伴侣，她就能品尝到成年的许多乐趣。你只希望她不要在营地里惹出什么麻烦。");
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]很明显，真正的问题是你是否想和你刚成年的后代发生乱伦关系。如果你回答是，你可能最终会得到另一个渴望你的鸟人女孩（也许以后还会更多）。如果你想保持柏拉图式的关系，你最好说不。");
            menu();
            addButton(0,"是--乱伦",yesToSophieIncest);
            addButton(1,"拒绝",noToSophieIncest);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,740,FlagDict_Impl_.arrayReadInt(_loc1_,740) + 1);
      }
      
      public function sophieIsInSeason() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,737) > 551)
         {
            return !get_pregnancy().get_isPregnant();
         }
         return false;
      }
      
      public function sophieImpregnationSex() : void
      {
         var _loc1_:int = get_player().cockThatFits(sophieCapacity());
         var _loc2_:int = get_player().cockThatFits2(sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         sophieSprite();
         outputText("你匆忙脱下衣服，意识到她是对的——你真的想把[oneCock]滑进那个镀金的入口，然后射精，直到她完全彻底地怀孕。美妙的是，你的[armor]把[eachCock]往下拉，然后在纯粹、毫无保留的释放瞬间，你的龟头");
         if(get_player().cockTotal() > 1)
         {
            outputText("们");
         }
         else
         {
            outputText("高潮");
         }
         outputText("挣脱了那件碍事衣服的边缘，猛地");
         if(get_player().cockTotal() == 1)
         {
            outputText("");
         }
         outputText("弹起，骄傲地勃立着。");
         if(get_player().cockTotal() == 1)
         {
            outputText("它摇晃着");
         }
         else
         {
            outputText("它们摇晃着");
         }
         outputText("，");
         if(get_player().cockTotal() > 1)
         {
            outputText("每一根");
         }
         outputText("上下跳动。索菲的眼睛从未离开过那根跳动的勃起肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。她似乎完全陷入了对肉棒的痴迷中，无意识地舔着她那涂满闪亮唇彩的嘴唇。你抓住");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的一根肉棒");
         }
         else
         {
            outputText("你的肉棒");
         }
         outputText("并摇晃");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("，把这个发呆的无脑花瓶从她空洞的凝视中惊醒。");
         outputText("[pg]索菲慢慢地把思绪拼凑起来，无辜地眨了眨眼。她最终下定了决心，脸庞微微上扬，睫毛低垂，那火辣的目光坚定地迎上了你的视线。[say: 好大，]她娇声说着，同时握住了你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("[sheath]");
         }
         outputText("，开始缓慢而性感的按摩。[say: 你为了我变得<b>这么</b>硬……而且还在变得更硬……好……硬……]她又用那种抑扬顿挫、充满诱惑力的声音说话了，她的话语在你的脑海、身体，最重要的是，在你过度肿胀的肉棒中震荡。[EachCock]开始在空中跳动，随着每一次心跳有节奏地脉动，血管在脉动中明显变粗，肥大而充血。当她熟练地抚摸你的男性象征时，你忍不住呻吟起来。她的羽毛在你的大腿、[legs]以及你下体的[skinfurscales]上轻轻摩擦，带来阵阵酥痒。");
         outputText("[pg]索菲慢慢地把你拉到地上，她那柔软的胸部和如匕首般挺立的乳头在你的身侧摩擦。她那丰满的臀部，被强化成了淫荡的、适合生育的腰线，来回扭动着，她的翘臀在你面前高高拱起，让你大饱眼福，欣赏着她那颤动的臀沟。当你坐在那里看着时，她“头发”上的羽毛散落在她拱起的后背上，她的抚摸、淫荡的舞姿和性感的呼噜声让你陷入了难以置信的性唤起状态。");
         outputText("[pg]那金色的嘴唇慢慢向你的" + get_player().cockHead(_loc1_) + "靠近，在只有一发之隔的地方停了下来。它们慢慢张开，令人痛苦地分开，在你敏感、极度兴奋的勃起上呼出热气。索菲狡黠地笑了笑，当她抬头看你时，眼中闪烁着令人惊讶的狡黠光芒。在这整个过程中，她的双手一直在继续灵巧地摆弄你的生殖器，将你胯下那沸腾的欲望之锅搅动得远超沸点。她对着你的阴茎呼出热气，用她一直使用的那种熟悉的、催眠般的语调，同时对它和你低语：[say: 好硬……好热……好满……好想做爱！][say: 你会<b>狠狠地</b>操我，像疯了一样狠狠地操。你绝对会一次又一次地骑上这个小穴。它会让你的肉棒感觉<b>太</b>爽了，你根本不想拔出来，即使射精后也不想。就是，那么爽。]");
         outputText("[pg]当她的话语起作用时，你浑身一颤。索菲现在出奇地专注，她决心要让你操那个光荣的……湿透的……美丽的小穴。你再也等不及了！你抓住这个迟钝的无脑花瓶的头，把它按在[oneCock]上，让自己被她丰满、包裹、令人酥麻的嘴唇所带来的柔软快感所包围。当粗暴地深喉她时，她那柔软的肉棒枕头吸吮成一个真空密封的圈，将你的男性象征沐浴在令人酥麻的催情唇彩中。索菲那性感的嘴唇边缘泛起唾液的泡沫。每次你把她拉回来时，她的鼻孔都会扩张，吸入大口大口的空气。当然，她吸入的空气完全充满了你男性象征的气味，并带有强烈的雄性荷尔蒙，这让她的裂缝在你的[foot]上滴下湿滑的液体。");
         outputText("[pg]她的嘴感觉很好，<i>真的</i>很好，但滴在你[leg]上的液体提醒你，有一个多汁的小穴正等着被射入精液，而你的肉棒……它<b>需要</b>进入它……狠狠地操它！索菲的嘴比起她那奶油般的小穴来说，显得苍白无力。你强行推开她，这个无脑花瓶那丰满的、吸吮肉棒的嘴唇仍然通过一张闪闪发光的湿润口水网与你相连。");
         outputText("[pg]索菲喘着粗气，[say: 操我，[name]。狠狠地操我！]她试图四肢着地爬行，当她转身时，肿胀的乳房在你的下半身拖拽。一旦她的屁股转向你，你就失去了理智。她那心形的臀部如此曲线优美、如此挺拔、如此令人愉悦地柔软，以至于你无法抗拒身体的冲动，那在你的每一个细胞中歌唱的繁殖呼唤。<b>你必须骑上去！</b>她那" + (get_noFur() ? "" : "长满羽毛的") + "大腿上沾满了性感的湿润，淫荡的性需求水滴从那丰满的臀部底部滴落，从索菲性器官那闪闪发光的三角区滑落。它就像一个金色的目标，一个靶心，正等着一根肉棒来刺穿它。");
         outputText("[pg]你一秒钟就站了起来，片刻之后，你已经把这个无脑花瓶推倒，让她四肢着地，你的" + get_player().cockDescript(_loc1_) + "已经压在她的阴阜上");
         if(get_player().cockTotal() > 1)
         {
            outputText("，你那涂满口红的肉棒的其余部分在柔软、涂满润滑液的大腿之间滑动");
         }
         outputText("。她的尾羽在你的[fullChest]上展开，像一把白金扇子。值得庆幸的是，它们张得足够开，这样你就可以看着你的长度慢慢滑过涂满另一层索菲药物的黄色阴唇。你已经被她的挑逗极度唤起，但深喉留下的催情剂已经开始发挥作用，让你的脑海中充满了幻觉，幻想着丰臀的鹰身女妖在你的肉棒上跳动，用亲吻和湿滑的小穴让你窒息，四周被蛋包围。");
         outputText("[pg]你的[hips]拍打在索菲光滑圆润的臀部上，这冲击力将你从幻想中拉回现实。你的身体向后拉，然后反复猛烈撞击，几乎是出于本能地移动。你抓住这个无脑花瓶跳动的臀部，满把的屁股在你手中随着你猛烈操弄、撑开小穴的狂怒所带来的动能冲击而颤动。索菲那肿胀的阴唇随着每一次后拉紧紧贴着你的" + get_player().cockDescript(_loc1_) + "，用轻柔的拉扯饥渴地吸吮着你的长度。你没有满足她，直到你的" + get_player().cockHead(_loc1_) + "成为唯一依偎在她紧致阴唇内的部分，一根染成金色的阴茎，滴着鹰身女妖散发着果香的阴道润滑液。紧接着是一次强有力的、刺穿般的猛插，循环重新开始，空气中充满了毫无疑问的性感、湿滑的声音。");
         outputText("[pg]索菲试图再次施展她的魔法，但她喘息和呻吟得太厉害，无法控制自己。取而代之的是疯狂的乞求。[say: 操我，[name]！操我发情的——哦，是的——鹰身女妖小穴！嗯嗯嗯……给我……给我你的精液！要让我成为一个妈妈，[name]，一个完全怀孕的、怀着蛋的、渴望被操的……<b>哦哦哦</b>……妈妈！]");
         outputText("[pg]你的双手摸索到了这个鸟脑女孩腰部上方的位置，随着你每一次像活塞一样的向前推进，开始把她往下拉，迫使她迎合你。你像手提钻一样猛捣索菲的小穴，随着你每一次摇晃臀部、填满小穴的猛插，液体喷涌而出。你的" + get_player().cockDescript(_loc1_) + "感觉如此敏感，如此坚硬，以至于她的裂缝感觉就像一个熔化的快乐套");
         if(get_player().cockTotal() > 1)
         {
            outputText("，而多余的");
            if(get_player().cockTotal() > 2)
            {
               outputText("在她大腿之间");
            }
            else
            {
               outputText("在她大腿之间");
            }
            outputText("同样在天堂中，随着她阴道分泌物的潮汐滴落，慢慢收集了更多的药物");
         }
         outputText("。索菲在你周围反复高潮，在每次高潮之间以圆周运动扭动她的屁股来刺激你。这很有效。她的小穴就像一个肉棒吸尘器——无论你怎么动，它都会把你吸回里面，吸入一个你再也无法抗拒，也不想抗拒的快乐天堂。");
         outputText("[pg]你全身的每一分力气都用来将你的" + get_player().cockDescript(_loc1_) + "尽可能深地塞进索菲那湿透了的、令人迷醉的小穴里，你用力猛撞，让她发出一声半是欢愉半是痛苦的娇啼。你的阴茎");
         if(get_player().cockTotal() > 1)
         {
            outputText("肿胀起来");
         }
         else
         {
            outputText("肿胀起来");
         }
         outputText("，随着你即将释放");
         if(get_player().balls > 0)
         {
            outputText("，你的[balls]开始在[sack]中有节奏地跳动");
         }
         else
         {
            outputText("，你体内的某种东西开始有节奏地收缩");
         }
         outputText("。索菲的小穴被你不断增加的粗度撑开，滴下琥珀色的蜜液");
         if(get_player().cockTotal() > 1)
         {
            outputText("，流到你那拍打着大腿的额外肉棒上");
         }
         if(get_player().cockTotal() > 2)
         {
            outputText("");
         }
         outputText("。作为回应，你体内温暖的狂喜化作巨大的喷射涌出，将一团团浓稠的白色精液一次又一次地射进鹰身女妖那包容的小穴里。");
         if(get_player().cockTotal() > 1)
         {
            outputText("一股股乳白色的精液滴落在地上和索菲的乳房下侧，但这个沉醉在情欲中的鹰身女妖似乎和你一样毫不在意。");
         }
         outputText("她饥渴的小穴津津有味地吞咽着精液，将它从你体内吸出，甚至还在榨取更多。");
         if(get_player().cumQ() >= 500)
         {
            outputText("你给了她想要的，用精液淹没了她的小穴。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("在你填满她的子宫后，雪白的精液从她的阴唇渗出，顺着你的[legs]和她自己" + (get_noFur() ? "" : "长满羽毛的") + "大腿滴落。");
         }
         if(get_player().cumQ() >= 2000)
         {
            outputText("地面很快变成了一片咸湿的泥潭，索菲的双手都陷了进去。");
         }
         if(get_player().cumQ() >= 5000)
         {
            outputText("很快，随着你展现出巨大的雄风，那些水滴变成了浓稠的精液。你按住她，在你用力内射她、用滚烫的精液淹没她时，让她的肚子在你身下鼓胀起来。");
         }
         outputText("[pg]随着你的高潮逐渐平息，索菲向前滑倒，脸颊蹭着泥土，舌头耷拉着，她那被过度使用的小穴在你周围断断续续地抽搐着。你叹了口气，虽然有些满足，但[eachCock]依然像往常一样勃起，依然坚挺发麻，渴望着鹰身女妖的洞穴。索菲的后穴随着高潮的痉挛席卷她的身体而一张一合，看着这一幕，你知道在给她注入几个孩子的精液之前，你必须得尝尝她的后庭。");
         outputText("[pg]那沾满白色精液和金色蜜汁的阴唇依依不舍地松开了你抽出的肉棒。");
         if(get_player().cockTotal() > 1)
         {
            outputText("她的大腿似乎也舍不得让你多余的肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("就这样离开。");
         }
         if(get_player().hasKnot(_loc1_))
         {
            outputText("你肿胀肉结的粗度让拔出变得比你想象的要困难，你只能前后摇晃，同时继续将精液滴入她体内，让充血的肉块慢慢缩小，进一步用你的精液填满她的子宫。最终，伴随着一声湿润的“啵”声，你解脱了，留下索菲的小穴大张着，就像一只被好好配种过的乖母狗。");
         }
         else
         {
            outputText("你伴随着一声刺耳的“噗嗤”声滑了出来，留下索菲成为一个被操得乱七八糟、一团糟的鹰身女妖。");
         }
         outputText("索菲浑身一颤，困惑地看着你。她呜咽着，[say:不——，再操我一次！]");
         outputText("[pg]你微微调整姿势，抓起她丰满的屁股借力，那充满弹性的无脑花瓶翘臀让你的手指深陷进柔软的肉里，随着你将它们掰开，完美地顺应了你的动作——为你沾满精液的肉棒提供了一条直通她纯洁后庭的完美通道！你立刻将你的" + get_player().cockDescript(_loc1_) + "抵在她的后门上。感受到片刻的阻力后，索菲放松下来，覆盖在你肉棒上的精液、爱液和滑腻的催情剂帮助你轻松滑入她顺从的后庭深渊。");
         if(_loc2_ >= 0)
         {
            outputText("与此同时，一股罪恶的紧致感夹紧了你的" + get_player().cockDescript(_loc2_) + "。你竟然不小心开始了双管齐下！第二个阴茎周围那湿滑火热的阴道触感，足以让你忘记这仅仅是个意外。");
         }
         outputText("你继续推进，沉醉于她肛门括约肌紧紧夹住你每一寸肉棒的快感中，当你更深地埋入这只鹰身女妖丰满的臀部时，它就像一个滑溜溜的屌环一样挤压着你");
         if(get_player().cumQ() >= 1000)
         {
            outputText("和渗着精液的小穴");
         }
         outputText("。");
         if(_loc2_ < 0)
         {
            outputText("[pg]索菲呻吟着，[say:嘿……你不能——呃——这样让我怀……怀孕的！]");
         }
         else
         {
            outputText("[pg]索菲呻吟着，[say:哦，我不想——呃——把它弄进我的，呃，屁股里，或者别的什么地方！]");
         }
         outputText("[pg]你双手各抓着一边发红的臀瓣，将它们掰开后又松开，让它们拍打在你的[sheath]两侧。你开始用自信、稳健的抽插，好好地钻探她的屁股");
         if(_loc2_ >= 0)
         {
            outputText("和小穴");
         }
         outputText("。你没有说出口的回答，通过你的行动变得显而易见：她让你如此欲火焚身，你要让她的每一个洞都怀上你的种，无论花多长时间。她的屁眼很紧，在体验过她的小穴后，甚至感觉<i>太紧了</i>，你能感觉到下一波精液已经在你的[balls]里开始翻滚，那沉重、温暖的重量越来越大。");
         outputText("[pg]索菲那迷人的臀部感觉棒极了，但你已经厌倦了自己一个人出力。你松开她丰满柔软的臀瓣，双臂环绕住她的躯干，就在她的乳房下方，然后向后靠去，将这个身体柔软的无脑花瓶鸟拉到你身上。她的重量让她的屁股压在你身上，用光滑的皮肤和柔软的羽毛包裹住你的[hips]。这只大屁股的鹰身女妖可能很蠢，但她<b>懂</b>做爱！她立刻开始在你身上弹跳，当她抬起身子，将她丰满的屁股从你身上拉开时，她紧致的屁眼紧紧夹住你。你那闪着金光的肉棒");
         if(_loc2_ >= 0)
         {
            outputText("被");
         }
         else
         {
            outputText("被");
         }
         outputText("短暂地暴露在冷空气中，然后");
         if(_loc2_ < 0)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("被火热、包裹着的肛门入口吞噬");
         if(_loc2_ >= 0)
         {
            outputText("和紧致的小穴");
         }
         outputText("重来一次。");
         outputText("[pg]索菲呻吟着，[say:这，呃，对你来说感觉好吗，[name]？]她回头看着你。");
         outputText("[pg]你坐起身，揉捏着她的乳房作为回答，");
         if(get_player().get_tallness() >= 74)
         {
            outputText("轻咬她的耳朵");
         }
         else if(get_player().get_tallness() >= 60)
         {
            outputText("轻咬她的肩膀");
         }
         else
         {
            outputText("轻咬她的侧腰");
         }
         outputText("，同时回答道：[say: 是的。]她的乳房摸起来比她那枕头般的臀部还要柔软，即使是现在，那两团软肉也正挤压着你的臀部和[legs]，用柔软的温暖将你淹没，而她的体内则在不断榨取你的肉棒");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。你粗暴地揉捏着她的乳房，由于太专注于紧贴的胯部间慢慢积聚的高潮，你根本无法温柔下来。她的乳房在你的摆弄下弹跳晃动。她那像铅弹一样坚挺的乳头，就像磁铁一样吸引着你探索的指尖，很快你就锁定了它们，捏住、拉扯，随着每一次弹跳揉捏着它们以示鼓励。索菲在坐到底时尖叫起来，将身体向后推向你，大声地高潮了，她的淫液");
         if(_loc2_ < 0)
         {
            outputText("喷洒在你的[legs]上");
         }
         else
         {
            outputText("像小河一样顺着你的" + get_player().cockDescript(_loc2_) + "流下");
         }
         outputText("，弄得一团糟。伴随着后庭痉挛般的收缩，黏稠的爱液爆发出来，你用力捏住她的乳头，再次让自己沉浸在血液中涌动的不自然欲望中。");
         outputText("[pg]精液在索菲的直肠里像雪花石膏般的花朵一样绽放，喷射到每一个角落。你拼尽全力紧紧抱住她，双手将她固定在原地，那巨大的无脑花瓶美臀被压扁在你的肉棒上");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。她把手臂绕到身后，深情地抱住你。你一次又一次地将一波又一波的精液射入她柔软的臀部。");
         if(_loc2_ >= 0)
         {
            outputText("同时，你让她的小穴变得更加泥泞");
            if(get_player().cumQ() >= 1000)
            {
               outputText("，让她的肚子更加鼓胀");
            }
            outputText("。");
         }
         outputText("你的高潮根本停不下来——它甚至可能比上一次更强烈、更凶猛！索菲只能默默承受，将她的爱液喷得你满身都是。");
         if(get_player().cumQ() >= 500)
         {
            outputText("随着你填满她越来越多的肠道，她的肚子发出咕噜声，最终");
            if(get_player().cumQ() < 1000)
            {
               outputText("让她挺起了一个");
            }
            else
            {
               outputText("让她本就明显的");
            }
            outputText("精液肚。");
            if(get_player().cumQ() >= 1500)
            {
               outputText("很快，精液就从你周围喷射出来");
               if(get_player().hasKnot(_loc1_))
               {
                  outputText("的肉结");
               }
               outputText("。你已经用精液填满了她肠道的每一寸，你新鲜、充满活力的精液除了喷出来，简直无处可去！");
            }
         }
         outputText("鹰身女妖在你的怀里瘫软下来，当你继续在她的臀部和乳头上满足自己时，她的阴户仍在滴水。");
         outputText("[pg]你叹了口气，但你知道自己还远未结束。首先，你得从她的屁眼里出来，这样你才能把下一发精液射到它该去的地方：直接射进她的小穴里……一次又一次。一想到这里，你就忍不住呻吟出声，[eachCock]在这个被精液塞满的肉便器里变得更加坚挺。你把索菲从你身上推开，让她摔在自己喷出的一滩淫液里。她脸朝下摔倒，发出一声痛苦的尖叫，因为那些淫秽的黏液完全覆盖了她的正面。这足以让她从高潮的昏迷中清醒过来，这个无脑花瓶转过身来，责骂道：[say:你这个坏蛋！]");
         outputText("[pg]你抓住她的脸，再次把她拉到[oneCock]上，毫无预兆地把它塞进她的喉咙。她发出一声不满的闷哼，然后再次吸吮起来，和上次一样热情。当她开始自己上下套弄时，她那沾满泥巴的乳房在你的[legs]上摩擦，为你下一次进入她那金门卵巢做准备。那些湿漉漉的无脑花瓶嘴唇对你来说太刺激了。[EachCock]是一座巨大的快感之塔，因为她的唇彩和接连不断的高潮而变得如此敏感，以至于一阵狂喜立刻向你袭来。你虚弱地喷出几股精液——这是你的身体在这么短的时间内能提供的最好的东西了。");
         outputText("[pg]索菲舔了舔嘴唇，吟唱道：[say:再来一次，在我的小穴里，求你了？求你了，再射在我的小穴里吧！]她就这样继续着，请求着，乞求着，甚至哀求着，同时转过身，把她那丰满的、浸满精液的阴阜放回你的" + get_player().cockDescript(_loc1_) + "上。那丝滑的肉壁像量身定制的手套一样紧紧地贴合着你。她立刻开始上下弹跳，回头看着你的脸，因为一波波的快感压倒了你的抵抗，瓦解了你的意识。你立刻射了，在已经射入的精液上又喷出了一长串的快感。她弹跳着，迫使更多的狂喜穿过你的" + get_player().cockDescript(_loc1_) + "，在你身上凌乱地劳作着，那淫荡的姿态足以让妓女脸红。她那柔软的肉壁在你的肉棒上每一次向上摩擦，都能得到你加速的生殖系统自上一次向下摩擦以来所能提供的所有精液，虽然只是微弱的喷射，但对她的小穴来说，仍然是额外的一剂奶油。");
         outputText("[pg]你向后倒去，眼睛狂野地翻滚着，无法控制地呻吟着。对你来说，意识只剩下穿过你的" + get_player().cockDescript(_loc1_) + "的刺痛感和随之而来的高潮。在某个时刻，你失去了时间概念，昏了过去。");
         sophiePregChance();
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1));
         if(get_player().cumQ() < 5000)
         {
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 3;
         }
         get_sophieScene().luststickApplication(8);
         menu();
         addButton(0,"继续",postSophieImpreg);
      }
      
      public function sophieGotKnockedUp() : void
      {
         sophieSprite();
         outputText("[pg]索菲脸上似乎挂着比平时更大、更傻的笑容。她涂在耻骨丘上的金色唇彩现在已经变成了一团模糊的污渍，有些地方还沾着白色的滴落物。她整理着凌乱的羽毛头发，在清理自己时偶尔揉揉肚子。多亏了你“强有力”的介入，这只长满羽毛的无脑花瓶似乎已经度过了她的发情期。[pg]");
      }
      
      public function sophieGoesIntoSeason() : void
      {
         sophieSprite();
         outputText("[pg]索菲似乎比平时更注重打扮自己了。她总是找借口待在你身边，近得让你能闻到她身上散发出的那种甜美、如桃子般的欲望气息。她的下唇比平时更加肿胀充血，你注意到她甚至在上面涂了一些唇彩。这只无脑花瓶鹰身女妖不断地在岩石、凳子和火坑旁弯下腰，总是把她那巨大、摇晃的屁股诱人地朝向你，金色的嘴唇在下面若隐若现。<b>她显然在发情期——准备好被配种，并且希望你来做！</b>[pg]");
      }
      
      public function sophieFenCraftedSex(param1:Boolean = false) : void
      {
         var _loc2_:int = get_player().cockThatFits(sophieCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         sophieSprite();
         if(param1)
         {
            outputText("[pg]哦，感觉真好。有一种滑溜溜、温暖舒适的感觉包裹着你的" + get_player().cockDescript(_loc2_) + "，伴随着稳定节奏的快速“咕叽-咕叽-咕叽”声。随着你的热情高涨，你的心跳加快，与你不断勃起的阴茎步调一致");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。睡意依然笼罩着你的大脑，但你也开始察觉到其他的感觉。你的[legs]上能感觉到羽毛柔软的触感，上下滑动，还有温暖光滑的皮肤一次又一次地压在你的[hips]上。包裹着[oneCock]的柔软通道在完全吞没你时愉快地挤压着，引得你发出一声舒服的呻吟。你自己发出的享受声足以让你睁开眼睛，随即你便看到索菲正以女上位骑在你身上。");
            outputText("[pg]索菲在你醒来时对着你摇晃她的乳房，叽叽喳喳地说：[say: 早上好，[name]。我给你准备了点性爱！] 她为自己糟糕的笑话咯咯笑了起来，然后继续骑乘，她的臀部做着小圈的旋转，用美妙的压力将她的肉壁紧紧压在你的" + get_player().cockDescript(_loc2_) + "的每一处。[say: 想要不操像你这么可爱的人睡觉，简直太……难了！我差点就没……啊啊啊……没，就是，没忍住。] 索菲兴奋地颤抖着，继续说道：[say: 你马上就要让，索菲妈妈，<b>真的</b>爽到喷水了！]");
         }
         else
         {
            clearOutput();
            sophieSprite();
            outputText("你急忙脱下盔甲，躺回毯子上，用手招呼索菲过来。这个淫荡、性饥渴的无脑花瓶踮起脚尖跳跃着，拍打着翅膀支撑着自己，她那宽大的臀部迷人地扭动着，越来越近。没过多久，她就跨坐在你仰卧的身体上；滴着淫液的私处悬在上方一英尺处。她那肿胀、发情的阴唇分泌出的汁液不时滴落在你的");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 150)
            {
               outputText("怀孕的");
            }
            outputText("腹部，这些滚烫的水滴闪烁着光芒，证明了索菲对鸡巴永远燃烧的渴望。在上方，她那巨大的乳沟在你身上投下了一道壮观的阴影。每一个起伏的肉球上都顶着一个突出的乳头。她的乳晕看起来几乎和你的[cocks]一样硬，你看着它们，忍不住舔了舔嘴唇。");
            outputText("[pg]你指着你的" + get_player().cockDescript(_loc2_) + "，挥手示意索菲继续。这个长着羽毛的荡妇立刻照做，伴随着一声响亮的“啪叽”声，她把自己拍在你的胯部，声音大到营地里的任何地方都能听到。你当时的角度也不对，无法插入她。相反，她柔软的阴唇向两侧分开，多汁的裂口开始了一场漫长的摩擦盛宴，将她的阴蒂重重地压在你现在已经润滑的肉棒上，坚硬的花核伴随着性感的抽插上下拖拽。索菲娇嗔道：[say: 哦，我，一直都想这样，[name]。为什么我们不能多做几次？]");
            outputText("[pg]这个大胸女人加快了臀部弹跳的速度，疯狂地摩擦着，上下滚动着她那摇晃的屁股，让你有东西可看——当然，前提是你的眼睛没有死死盯着她那沉甸甸的乳房。当她骑着你的时候，她的汁液变得越来越丰富，但很快，索菲就到了临界点。她叽叽喳喳地说：[say: 必须把你弄进去，性感宝贝，] 然后把自己往前拖。她的手伸到身后，抓住你的根部调整角度，然后向后推，将" + get_player().cockDescript(_loc2_) + "深深埋入她多汁的肉丘中。[say: 哦，那会让索菲妈妈高潮得<b>超——</b>厉害的，] 她呻吟着。");
         }
         outputText("[pg]索菲向后仰着身子呻吟着，被你的肉棒刺穿，同时贪婪地抚摸着自己的一个乳房。她的手指笨拙地抓弄着手中巨大柔软的乳房，反复抚摸着乳头。你用一只手肘撑起身体，用另一只手伸上去加入索菲对她巨大乳房的爱抚。它们是如此巨大，如此……柔软，以至于它们本该下垂，但它们却保持着完美、诱人的形状，即使在激烈的性爱中摇晃和弹跳时也是如此。她的乳头很快就落入了你的手指中，你开始在指尖滚动那敏感的血肉，欣赏着那颗粒状的质感，而索菲则开始像个淫荡的婊子一样呻吟起来。");
         outputText("[pg][say: 操！对！拽我的乳头！你让我感觉，<b>太</b>他妈爽了！] 索菲尖叫着，把她的金发向后甩去。她移动时眼睛微微翻白，开始越来越快地弹跳。她紧致的阴唇拖过每一个敏感的脊背和静脉，甚至你的" + get_player().cockHead(_loc2_) + "，然后再次在那奢华的热度中吞没你。");
         if(get_player().balls > 0)
         {
            outputText("每次索菲坐到底时，她巨大的臀部都会滑过你的[balls]，她的尾羽在你的[sack]底部挠痒痒。");
         }
         outputText("你拉扯着她的乳头，换来索菲一声充满惊喜和兴奋的尖叫。她在你的掌控中扭动着，扭来扭去，更用力地拉扯着她可怜的被虐待的乳头，而她的阴户在你周围疯狂地收缩。");
         outputText("[pg]当她达到高潮时，你感觉到她的淫液滴落在你的阴茎上，流过你的腰间，她的一只手扶着你的肩膀作为支撑。她天鹅绒般的内壁奇妙地痉挛着，在你的" + get_player().cockDescript(_loc2_) + "周围抽搐，这只能是高潮的阵痛。索菲弯下腰，将她的乳房贴在你的");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("自己");
         }
         else
         {
            outputText("胸口");
         }
         outputText("，她热情地吻着你，在你的嘴里呻吟。她那强效唇彩的效果立刻击中了你，将你的快感强化成海啸般的兴奋，无论你是否愿意，这股兴奋都在不断攀升。你在索菲的舌头上大叫出声，臀部将她抬离地面，你猛烈地高潮了。你的精液射出长长、浓稠的白色绳索，将鹰身女妖湿透的内壁染成白色。随着她的褶皱被精液覆盖，你痉挛的" + get_player().cockDescript(_loc2_) + "将剩余的欲望倾注进她体内，彻底清空了你的[balls]。");
         if(get_pregnancy().get_isPregnant())
         {
            outputText("彻底的播种将她完全填满——她的子宫里塞满了蛋，根本没有空间容纳精液，每一次新的注入都会让精液滴落出来。");
            if(get_player().cumQ() >= 500)
            {
               outputText("你射得太猛了，以至于精液像洪流一样从她的缝隙中冲刷出来，她的子宫被你和她一起制造的蛋堵住了。");
            }
         }
         if(get_player().cumQ() >= 2000)
         {
            outputText("渗出的精液把你彻底浸透了，索菲的大腿也因为从她唇间喷出的几加仑粘液而变得黏糊糊的。");
         }
         outputText("[pg][say: 哦哦哦哦哦哦哦哦！]她对着你的嘴尖叫，最终当她力气耗尽，身体软绵绵地瘫倒在你身上时，才停了下来。她深情地吻了几下你的后颈，缓慢地扭动了几下臀部，将浓稠粘稠的精液挤到你们汗津津的身体上。");
         outputText("[pg]索菲慢慢地从你身上爬起来，当你从她仍在痉挛的小穴中退出时，她强忍住又一声呻吟。[say: 哦，谢谢你，[name]。我太需要这个了。]这个无脑花瓶又在你的嘴唇上快速啄了一下，让它们感到一阵刺痛。她摇曳生姿地走开了，精液从她丰满的臀部之间滴落。");
         if(param1)
         {
            outputText("[pg]你收拾好你的[armor]，前往溪边清洗干净，然后开始新的一天。多么美好的早晨！");
         }
         else
         {
            outputText("[pg]你收拾好你的[armor]，试图忽略在那场混乱的性爱之后它是如何粘在你身上的。");
         }
         if(sophieIsInSeason())
         {
            sophiePregChance();
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         if(param1)
         {
            doNext(playerMenu);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sophieEggApocalypse() : void
      {
         sophieSprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,284) == 0)
         {
            outputText("你发现她在翻找你的物品，好奇地用脚夹起瓶子，试图弄清楚每样东西的作用。她对玻璃瓶出奇地小心，将紧抓的爪子举到与视线齐平的位置，左右晃动着脑袋，然后才去抓下一瓶药水。[say: 这些符号是什么意思？]她好奇地问道。然而，当她抓起一个六边形的瓶子时，她的眼睛亮了起来。[say: 哦！我认识这个！这是一个蛋！]她把它举起来，骄傲地展示着你的产卵灵药上的蛋形符号。你点了点头，她因为猜对了一个而泛起了毫无来由的骄傲红晕。[say: 我以前下过好多蛋。都是我漂亮的小宝宝，]她惆怅地叹了口气。鹰身女妖撅起金色的嘴唇，皱起眉头思考着，努力想把一个想法拼凑起来。当这个想法逐渐穿透你给她造成的欲望迷雾时，她精神振奋起来。[say: 啊！如果我喝了这个会怎么样？我会产更多的蛋吗？哦哦哦，拜托了？你能把这一小瓶给我，让我再做一次妈妈吗？]她用白金色的羽毛抚摸着平坦的小腹，焦急地回忆着年轻时的怀孕经历。你想扮演尽职的配偶，给你这个鸟脑子的无脑花瓶一个重温她放荡青春的机会吗？");
         }
         else
         {
            outputText("你让索菲在你的补给中找到了另一瓶产卵灵药，她平时空洞的表情定格成了一个急不可耐的狂喜笑容。[say: 哦，我们能再来一次吗？拜托拜托拜托！]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,284,FlagDict_Impl_.arrayReadInt(_loc1_,284) + 1);
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"爸爸",beBimboSophiesSugarDaddy);
         }
         else
         {
            addButtonDisabled(0,"爸爸");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"妈妈",beBimboSophiesSugarMommy);
         }
         else
         {
            addButtonDisabled(1,"妈妈");
         }
         addButton(14,"离开",playerMenu);
      }
      
      public function sophieChildren() : int
      {
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,742) > 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function sophieCapacity() : Number
      {
         return 179;
      }
      
      public function sophieCampLines() : void
      {
         var _loc1_:Number = Utils.rand(4);
         if(get_silly())
         {
            _loc1_ = Utils.rand(5);
         }
         if(_loc1_ == 0)
         {
            outputText("索菲独自坐着，在她那丰满的无脑花瓶嘴唇上又涂了一层闪亮的唇彩。");
         }
         else if(_loc1_ == 1)
         {
            outputText("索菲正独自坐着，漫不经心地揉弄着自己的小穴，发出响亮的呻吟。她一直朝你这边看，希望你能走过去。");
         }
         else if(_loc1_ == 2)
         {
            outputText("这只沙滩金发鹰身女妖正打扮着自己，脸上挂着空洞无脑的表情。她那丰满如蜂蛰般的嘴唇微微张开，上面涂着厚厚一层金色的唇彩。");
         }
         else if(_loc1_ == 3)
         {
            outputText("你的专属无脑花瓶索菲正在玩弄着自己的乳房，在愉悦的叹息中抚摸和爱抚着那沉甸甸的肉球。她一直朝你这边瞥，希望你能加入她。她真是欲求不满！");
         }
         else
         {
            outputText("索菲正独自坐着，摆出嘟嘟唇的姿势，用她的芬恩手机自拍。等等，她从哪弄来的？");
         }
         outputText("[pg]");
      }
      
      public function sophieBirthsEgg() : void
      {
         sophieSprite();
         outputText("[pg]一声高亢的欢愉尖叫响彻你的营地。你冲向声音传来的地方，从那高亢的音调中你知道那只能是鹰身女妖索菲。她靠在一块岩石上，双腿大张。在她柔软的大腿下，有一张用稻草、布料和树叶精心制作的床，隐约像一个巢穴。她一直在忙！");
         outputText("[pg]索菲肿胀的小穴完全暴露在外，虽然入口扩张得很宽，完全张开。你可以看到肌肉收缩在她的肚子和腿上荡漾，每一次收缩都导致圆润的肿块在她的身体上向下移动。她抬头看着你，呻吟道，[say:它要出-出-出来了！] 一只手紧紧抓住她的乳房，但另一只手正忙着在她的阴蒂上画圈，只在摩擦她敏感的阴唇和她肿胀的阴阜外部时才停下来。润滑液从她体内涌出，她潮红的脸颊和紧绷、起皱的乳头毫无疑问地表明她很享受这种情况。她呻吟着，");
         if(bimboSophie())
         {
            outputText("[say:过来，[name]！我……哇哦……我想在卵出来的时候握住你的手！]");
         }
         else
         {
            outputText("[say:过来，[name]！我……哇哦……我需要抓着点什么，这东西要出来了！]");
         }
         if(get_player().cor < 33)
         {
            outputText("你在她旁边坐下，心想这对她来说一定很正常，你用一只手握住她的手，另一只手摸索着她空闲的乳房。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你叹了口气，在她旁边坐下。好吧，至少你可以用另一只手摸她的奶子！");
         }
         else
         {
            outputText("你在她旁边一屁股坐下，但无视了她伸出的手，而是抓住了她胸前那两个多汁的瓜之一。你咧嘴笑着，不禁觉得无论如何，这都是一件更柔软的东西。");
         }
         outputText("[pg]你的手指陷入柔软的胸部肌肉中，其中两根手指捏住敏感的乳晕。索菲喘息着，随着她怀孕的肚子移动而颤抖。里面的卵在她的身体上清晰可见，下降得更低了。鹰身女妖的臀部伸展开来，仿佛被施了魔法一样变宽，她的腿停在你的身上");
         if(get_player().isBiped())
         {
            outputText("rs");
         }
         outputText("。一个圆润的白色边缘从她痉挛的阴唇间探出，上面闪烁着润滑液的光泽，液体滴落的速度快得几乎连成了一条线。");
         outputText("[pg]索菲的指尖开始飞快地揉搓她的阴蒂，快得几乎成了一道残影，她的臀部随着抽搐的摇摆动作抬起，每一次动作都露出更多的白色。她紧紧地抓住你，无意中用那匕首般锋利的指甲刺入你的皮肤。随着欲望将她淹没，她的睫毛疯狂地颤动着，她兴奋地尖叫出声，声音高亢而刺耳。之前的抽搐动作被一次长长的收缩所取代。你那长着羽毛的女孩体内的卵形肿块现在移动得很快，以缓慢而稳定的动作穿过她的阴唇。当它到达一半时，蛋的进度停滞了，尽管索菲的高潮并没有停止。她的尖叫声戛然而止，但她的身体仍在颤抖。你支撑着她，即使当她翻白眼，你开始担心蛋可能会卡住时也是如此。");
         outputText("[pg]一股体液突然从这位丰满的鹰身女妖主母体内喷射而出，半透明的胚胎伴随着巨大的“啵”声滑落出来。索菲瘫倒在你的怀里，虚弱地喘息着，她的臀部和被撑开的阴户开始收缩，恢复到更“正常”的大小（至少对她来说是这样）。她仍然每隔几秒钟就颤抖一次——哪怕只是把你的手从她的乳房上移开，也会让她过度兴奋，引发新一轮的爱液流淌。");
         outputText("[pg]就蛋而言，这颗蛋看起来很正常。表面迅速干燥，失去了抛光的光泽，呈现出平坦的哑光白色调。索菲眨了眨眼睛，依偎着你，说道：[say:看看我们做了什么，[name]。它真美。]");
         outputText("[pg]你留下来待了足够长的时间，以确保索菲和她的蛋都没事，然后才离开。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) == 0)
         {
            outputText("你能应付营地里再多住一只鹰身女妖吗？[pg]");
         }
         else
         {
            outputText("你的营地到底能容纳多少只鹰身女妖？[pg]");
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
      }
      
      public function sophieBimboAppearance() : void
      {
         var output1:Boolean;
         var _g:SophieBimbo;
         clearOutput();
         outputText("索菲是一只高大丰满的鹰身女妖，这点毫无疑问。她有着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("非常");
         }
         outputText("长的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("白金色的");
         }
         else
         {
            outputText("粉色的");
         }
         outputText("“头发”，像鸟的羽毛一样垂在肩膀上。像大多数同类一样，她总是丰满的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("、超大号的");
         }
         outputText("嘴唇上涂着厚厚的一层金色唇膏，这种唇彩能让她的声音具有一种令人无法抗拒的特质，或者在接触男性或扶他时引起他们的性欲。她的脸上缺乏许多姐妹身上那种青春的气息，不过你也看不到任何表明年龄的皱纹。");
         outputText("[pg]索菲的乳房");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0)
         {
            outputText("大得如果她试图飞行，就会把她拖到地上，这是你给她喝的药水留下的性感后遗症。那对摇晃的无脑花瓶奶看起来大约是F罩杯。");
         }
         else
         {
            outputText("异常巨大。这位丰满的鹰身女妖似乎确实被它们稍微拖累了，但仍然能够飞行。她的乳房看起来大约是DD罩杯，又大又软，非常适合轻轻揉捏或粗暴地乳交。");
         }
         outputText("[pg]在她粗壮的大腿之间隐藏着一个闪闪发光、湿润的小穴，" + (get_noFur() ? "在它下面开始" : "两者都开始") + "覆盖着羽毛，一直延伸到她那像鸟一样长着利爪的脚上。她每迈出夸张的一步，那摇晃的臀部就会微微颤动，长长的尾羽在上面呈扇形散开。你确信在它们之间有一个紧致的后穴，就在它该在的地方，但周围都是丰满的屁股，你实在看不清楚。");
         outputText("[pg]索菲的手臂上也覆盖着羽毛，外观有点像翅膀，尽管末端长着人类的手。她的主翼更大，从肩胛骨上方长出来。她经常把它们折叠在身后以免碍事，但当她想的时候，她可以用它们卷起巨大的沙尘暴。");
         if(get_game().farm.farmCorruption.hasTattoo("sophie"))
         {
            outputText("[pg]");
            if(get_game().farm.farmCorruption.sophieFullTribalTats())
            {
               outputText("她从头到尾都覆盖着部落纹身，色情的线条在她赤裸的身躯上蜿蜒，让她看起来像一个勉强被驯服的野蛮人。");
            }
            else
            {
               if(get_game().farm.farmCorruption.numTattoos("sophie") > 1)
               {
                  outputText("她的身上印有以下纹身：\n");
               }
               else
               {
                  outputText("她有");
               }
               if(1145 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1145) + "\n");
               }
               if(1146 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1146) + "\n");
               }
               if(1147 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1147) + "\n");
               }
               if(1148 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1148) + "\n");
               }
            }
         }
         menu();
         _g = this;
         output1 = false;
         addButton(0,"返回",function():void
         {
            _g.approachBimboSophieInCamp(output1);
         });
      }
      
      public function sophieAndIzmaPlay() : void
      {
         outputText("[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,780,FlagDict_Impl_.arrayReadInt(_loc1_,780) + 1);
         outputText("<b>发生了一件奇怪的事，在那个");
         if(get_game().time.hours < 6 || get_game().time.hours > 20)
         {
            outputText("夜晚");
         }
         else if(get_game().time.hours < 12)
         {
            outputText("早晨");
         }
         else if(get_game().time.hours == 12)
         {
            outputText("中午");
         }
         else if(get_game().time.hours < 5)
         {
            outputText("下午");
         }
         else
         {
            outputText("傍晚");
         }
         outputText("……</b>");
         outputText("[pg][say: 歇会儿吧，你这长毛的荡妇！]伊兹玛熟悉但烦躁的声音喊道。[say: 就算你想吸鸡巴，也不代表你可以掀起我的裙子，把那……嗯……可爱的口红涂满我的老二……就在那儿……]这只双性鲨鱼人的声音上扬，带着兴奋的快感轻哼着。很明显，索菲正在伊兹玛的草裙下，用她那厚厚的唇彩尽可能地擦拭着她的肉棒。你慢慢靠近，听到了索菲那被蜜蜂蛰过般的嘴唇在伊兹玛那带有虎纹的肉棒上发出清晰的“吧唧吧唧”声，伴随着兴奋的呻吟。");
         outputText("[pg]这位拥有傲人尺寸的美女突然停止了呻吟，发出一声烦躁的咕哝。[say: 不，操！不行就是不行，妈的！]你及时从一块石头后面探出头来，看到伊兹玛咆哮着举起鹰身女妖，然后将她抛向十几英尺的高空。她那引以为傲的十五英寸肉棒从草裙的叶片间突出来，跳动着，几乎硬得发痛，顶端呈纯金色，比你见过的任何时候都要肿胀。看来索菲亲了不止几下。就在你眼前，鲨鱼女孩的阴茎上渗出了一大滴浓稠的预精液，摇摇欲坠地悬挂着，然后慢慢拉长，滴向地面。她烦躁地呻吟了一声，然后用手握住它，呻吟道：[say: 哦，[name]永远不需要给我下药就能让我变成这样……]");
         outputText("[pg]索菲用力拍打着翅膀降落，微微喘着气，咯咯笑着说：[say: 哎呀，你干嘛非得那样扔我？别这么小气嘛！我只是想让你感觉非常、非常美味和舒服。]她把一根手指伸进她那宽大、撅起的嘴唇里，高兴地呻吟着，深喉着那根手指，同时不断向伊兹玛投去饥渴的目光。被下药的红色双性人呻吟着，从她的男性器官上又滴下了一滴粘稠的欲望之珠。她的大腿也闪闪发亮，反射着渗出的女性欲望。");
         outputText("[pg]伊兹玛有目的地向前走去，而那个鸟脑花瓶则咕咕叫着：[say: 哦，你是不是感觉很敏……敏……嗯……要让我骑你吗？]");
         outputText("[pg][say: 差不多吧，]虎鲨人一边解开裙子一边保证道。索菲蹦蹦跳跳地穿过剩下的距离，完全没有意识到伊兹玛眼中危险的光芒。这个赤裸着、阴茎坚挺的双性人抓住了鹰身女妖的手腕，熟练地扭动着，将她的身体转了过来。她抓住这只尖叫着的鸟女孩空闲的手臂，将衣服缠绕在长满羽毛的手腕上，直到索菲的手臂完全无法动弹，最后打了一个结实、牢固的结。");
         outputText("[pg]索菲毫无头绪地问：[say: 你在干什么，宝贝？我们这样没法做爱！]她在束缚中徒劳地挣扎着，翅膀疯狂地拍打着，而伊兹玛则不慌不忙地在她的箱子里翻找着。慌乱的鹰身女妖跌跌撞撞地跟在她后面，拍打着翅膀以保持平衡。[say: 嘿，性感的鲨鱼！我在跟你说话呢！你不能就这样把我绑起来！]");
         outputText("[pg]伊兹玛拿出一根盘好的绳子，解释道：[say: 当然不是，我才刚刚开始呢。]她露出一个危险的大大笑容，将索菲的翅膀平压在背上，用绳子绕圈将它们绑住。绳子的前半部分穿过索菲那对巨大、无脑花瓶般的奶子下方和上方，最后伊兹玛在那个山谷女孩般深邃的乳沟处打了个结。[say: 现在我们有点进展了，]伊兹玛骄傲地宣布，然后把这个被绑起来的荡妇扛到了肩上。");
         outputText("[pg]索菲踢腿扭动，但无济于事——伊兹玛实在太强壮了。这个被绑起来的无脑花瓶最终发出一声恼怒的叹息，放弃了挣扎，吹开挡在眼前的一缕白金羽毛。[say: 你真没意思，你知道吗？]");
         outputText("[pg]伊兹玛翻了个白眼，回答道：[say: 我不知道，我玩得很开心。你难道不开心吗？]");
         outputText("[pg][say: 不开心。]");
         outputText("[pg][say: 会改变的，]鲨鱼女承诺着，将较轻的鸟人举过一根她用来晾衣服的杆子。索菲粗壮的大腿勾在木架上，而伊兹玛则将这个扭动着的荡妇的躯干高高举起。[say: 快好了……]她站直身子，将索菲对折，把她那对起伏的奶子压在杆子上。伊兹玛咕哝了一声，抓住这个曲线优美的鹰身女妖胸前的绳子，重新打结，将它们连接到支撑杆上。完成后，她退后一步，欣赏着自己的杰作。");
         outputText("[pg]索菲完全动弹不得，被吊在那里，她小穴里滑腻的分泌物在充血的下体阴唇上清晰可见，被她那巨大而光滑的粗壮大腿包围着，简直就是在乞求被人抓住并骑上去。索菲唯一能做的就是踢动她长着利爪的脚，但这只会让她沉重的臀部像钟摆一样来回晃动，高度正好在那个带着恶意笑容的双性人腰部。");
         outputText("[pg]你考虑着你的选择。你可以让伊兹玛对这个性感的鹰身女妖尤物为所欲为，或者你可以在事情发展得太过火之前阻止它。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,780) == 1)
         {
            outputText("[pg]（无论如何，你也许可以建议索菲以后再试一次……）");
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         menu();
         addButton(0,"打断",interruptSophieIzma);
         addButton(1,"观看",watchIzmaSophie);
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         sophieSprite();
         outputText("[say: 我要你去湖边，]你对你的宠物无脑花瓶说，[say: 找一个农场。你要把自己交给那……]你停了下来。索菲正满脸不解地盯着你，下意识地抠弄着自己。");
         outputText("[pg][say: 宝贝，你刚才说了好多大词。农场是什么？]你叹了口气。");
         outputText("[pg]你花了好一会儿，还在地上画了好几张图，索菲才终于明白你的意思。");
         outputText("[pg][say: 哇，我要去冒险啦！]她兴奋地咯咯笑着，上下蹦跳。如果说这只鹰身女妖有什么拿手好戏，那就是蹦跳了。[say: 我要去挤牛奶，给好心的狗狗女士下好多好多蛋，然后，然后你会偶尔来看我，我们还会做爱，对吧？]你向她保证会这样的。索菲高兴地拍着手，然后开始一蹦一跳地朝湖边滑翔而去。你觉得她作为惠特尼的工人或保镖可能没什么用，但她在产蛋方面的贡献绝对能弥补这一点。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1081,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function rideDatSophieVag(param1:Boolean = false) : void
      {
         clearOutput();
         sophieSprite();
         var _loc2_:int = get_player().cockThatFits(sophieCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         var _loc3_:int = -1;
         if(get_player().cockTotal() > 1)
         {
            _loc3_ = get_player().cockThatFits2(sophieCapacity());
            if(_loc3_ < 0)
            {
               _loc3_ = get_player().biggestCockIndex();
               if(_loc3_ == _loc2_)
               {
                  _loc3_ = get_player().smallestCockIndex();
               }
            }
         }
         if(get_player().cor <= 50)
         {
            param1 = true;
         }
         if(param1)
         {
            outputText("还没等你决定到底要对你这只淫荡的鹰身女妖做什么，索菲就摇摇晃晃地朝你走来，每走一步，她大腿内侧都滴落着淫液。你看着这只丰满的鸟儿摇摇晃晃，她太兴奋了，而且体型太大，根本走不直，但最终她还是成功地走到了你面前。");
            if(get_pregnancy().get_event() >= 2)
            {
               outputText("她那因怀孕而隆起的腹部也确实没帮上什么忙。");
            }
            outputText("[pg][say: 那个，嘿，宝贝……]她娇嗔着，身子前倾，将她那柔软、硕大的乳房压在你身上。特别是她的乳头，紧紧地顶着你的[armor]，这只鹰身女妖已经完全发情了，还没等你做出任何反应——她就凑过来吻了你，那沾满药物的嘴唇绝望地一次又一次地砸在你的嘴唇上。");
            outputText("[pg]有一瞬间，你迷失在其中，因为掺了药的鸡尾酒开始流遍你的全身，让[eachCock]开始跳动和脉动，因为");
            if(get_player().cockTotal() >= 2)
            {
               outputText("它们变");
            }
            else
            {
               outputText("它变");
            }
            outputText("得在你[armor]里坚硬起来，你的手臂慢慢开始向上伸去抚摸这个沾满药物的鹰身女妖。当你抚摸她时，她在你的吻中咕咕叫着，为你摇晃着她" + (get_noFur() ? "" : "长满羽毛的") + "屁股，当你挤压它时，直到最后，当你在这个胖东西上轻轻拍了一下时，她才从你们被药物束缚的吻中抽离出来。");
            outputText("[pg][say: 我们能，我们能做爱吗？能吗？索菲妈妈太需要了……]每次你摸她那戴着金环的屁股时，她的声音就会跳跃，她的思绪就会游荡，但尽管你……很享受，她还是设法把问题问了出来。你表达了这样一个事实：在此之前，你并没有确切地<i>告诉</i>她你想做爱，她撅了一会儿嘴……直到[oneCock]透过你的[armor]顶着她，她立刻高兴起来。");
            outputText("[pg][say: 那么，就像，你现在完全想操了，对吧？]索菲问你，她的声音变成了一声轻柔、沙哑的呻吟。你低声嘟囔着，鹰身女妖转过身，漫不经心地走开了，她那肥大的屁股随着她那长着爪子的腿的每一步而晃动，她再次转过身坐下，那鼓鼓的屁股蛋显然是一个非常舒服的垫子。");
            outputText("[pg]索菲看着你——还有那凸起");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("穿着你的[armor]——然后一边看着你会怎么做，一边开始用手指抠弄自己，她湿润的阴唇轻易地为她那饥渴、探索的手指分开了。");
            outputText("[pg][say: 所以我们，你知道的，我们做爱吧，好吗？好吗，宝贝？我们可以做爱，对吧？]她咬着下唇，向你恳求。她的手指现在更深地抠进了她那湿透的阴部，你可以看出，要么你会把她操到昏迷，要么她会自己解决。该死，你现在<i>确实</i>硬了，所以不如就由你来吧。");
            outputText("[pg]你嘟囔着脱下你的[armor]，[eachCock]随着你的动作弹跳着，你走向那个手舞足蹈的鹰身女妖，她用空闲的手向你招手，发出微弱的“<i>耶</i>”和“<i>过来</i>”的叫声。你把鹰身女妖推倒，让她仰面躺下，有些好笑地看着她那巨大的胸部因撞击而摇晃弹跳。");
            outputText("[pg]你决定现在还不想操她，于是你抓住她自慰的手和招手的手，将它们向上猛拉，俯身压在鹰身女妖身上，将她的双手固定在她的头顶。[say: 耶！]索菲叫道，感觉到[eachCock]在她的胯部摩擦。[say: 做，做吧！我，我太需要了！]她低吟着，向你抖动着她的胸部。你用空闲的手揉捏着她柔软的乳房，同时慢慢地用你的臀部摩擦她，用你的[cock biggest]直接摩擦她的阴部。");
            outputText("[pg][say: 还没呢，]你漫不经心地告诉她，邪恶地笑着，[say: 你需要先受点惩罚，你这个荡妇。]你放开鹰身女妖的大乳房，抓住她的一个乳头，用力捏下去，刚好能让她感到疼痛——刚好能让一点痛苦与快感混合在一起。[say: 不，不，宝贝！我喜欢，我需要，像——]你打断了她，用力捏紧了一会儿，让她在呻吟时声音哽咽。她实际上很享受！");
            outputText("[pg][say: 你需要什么？]你问她，并不打算让她回答，因为你再次捏住了她巨大的乳房。她痛得叫了一声，牙齿微微咬紧，变得更加湿润，你停下来，用手指来回捏揉她的乳头。你用灵巧的手指摩擦着那颗小小的花蕾，看着鹰身女妖的眼睛几乎和她的小穴一样湿润。");
            outputText("[pg][say: 怎么了？]你问她。[say: 你需要什么？]当你准备再次捏她时，她张开了嘴，但随后又闭上了，从喉咙里发出一声高亢、清脆的呜咽。[say: 是的，这样更好，]你柔声说道，慢慢地把手放下来，拍打着这个荡妇敏感的乳房。她因为接触而呜咽，特别是当你把手压下去，在她的乳头上前后摩擦时，但她保持了安静。");
            outputText("[pg][say: 这样更好，]你再次确认，抓住她摇晃的乳房的底部。你向上拉，从底部到乳头挤压着这个超大的肉球，她紧闭着嘴唇呻吟着，你再次抓住她的乳头，捏住那颗发红的肉粒。这让她发出了一声更高亢的呻吟，她恳求地盯着你的眼睛，但作为回应，你只是用你的" + get_player().cockDescript(_loc2_) + "摩擦她，让鹰身女妖感受到它。");
            outputText("[pg]随后你俯下身，托起一个巨大、柔软的乳房，将你充满药物的嘴唇锁在上面；索菲发出一声尖叫，嘴唇猛地张开，但当你抬头看她时，她又闭上了嘴。看来你<i>确实</i>能教无脑花瓶新把戏。你开始吸吮她的乳头，舌头在她敏感的乳晕和乳头上游走，她的身体颤抖着，你空闲的手蹂躏着她的另一个乳房，在你攻击这只荡妇鸟超大的乳沟时，所有的摸索、捏揉和挤压都用上了。");
            outputText("[pg]索菲的臀部开始摩擦你，力度刚好能用你的重量压住她肥大臀部的围度，结果你的" + get_player().cockDescript(_loc2_) + "摩擦她饥渴的裂口的感觉得到了增强。你咬住索菲的乳头，看着她的眼睛里闪过一丝担忧，然后你慢慢地前后摩擦，粗暴地用牙齿摩擦那颗肉粒。");
            outputText("[pg]这一次，她<i>确实</i>张大了嘴，发出一声尖锐的哭喊般的呻吟，但你没有理会，而是将对这只鸟人那对巨大乳房的刺激推向了高潮，舔舐、吮吸、揉捏、摩擦，索菲发出呜咽和尖叫，声音汇聚成连绵不断的欢愉叫喊。如果你的嘴里没有塞满鹰身女妖的奶子，你肯定会咧嘴笑，但现在……你松开了口，看着她的乳房落回胸前弹跳着，对她露出了坏笑。");
            outputText("[pg][say: 那么，]你柔声说道，伸手抓住你的" + get_player().cockDescript(_loc2_) + "。你撸动了几下，享受着鸡巴在手指间的感觉，然后调整角度，让龟头直接摩擦索菲喷涌的阴户，这只鸟用眼睛恳求你。你放开她的另一个乳房，去摩擦一条" + (get_noFur() ? "皮肤光滑的" : "长满绒毛的") + "大腿，当你轻笑时，她咬住了嘴唇。");
            outputText("[pg][say: 准备好了吗？]你问她，用龟头顶着她的入口。她张开嘴想回答——你一下子全插了进去，享受着她在极度愉悦中呻吟时声音提高几个八度的样子。她湿透的阴户紧紧夹住你的" + get_player().cockDescript(_loc2_) + "，内部肌肉拼命地想榨取你，但你没给它们多少空间；你反而直接拔了出来，看着索菲的手臂——从你的抓握中解脱出来——伸出来试图把你拉回来。");
            outputText("[pg]它们不需要这么做。你用你跳动的鸡巴再次刺穿了鹰身女妖，享受着她湿润的内壁在真正夹紧你之前颤抖的样子，然后再次拔出，进入了节奏。[say: 告诉我你想要什么，]你命令她，慢慢地将你的臀部推向疯狂。");
            outputText("[pg]索菲急切地顺从了，她的声音响彻四周。[say: 是的，是的，是的，操，是的，还要！求、求你！是、是的！]她哭喊着，平时结结巴巴的语言被迫变成了一连串对你和你肉棒的不断、绝望的乞求。你听到一阵轻微的沙沙声，那是她那被称为尾巴的羽毛扇试图在她身下前后摆动，在泥土上画出一个小小的天使印记，你再次向前倾身，真正地投入其中。");
            outputText("[pg]当你俯身压在她身上时，索菲伸手抱住你，你这次满足了她，让这个从主妇变成无脑花瓶的女人把你拉向她弹跳、起伏的胸部。当你操她时，你的脸直接埋进了她的乳沟，你的[chest]撞击着下面，你把脸埋在鹰身女妖的乳房里，在它们之间来回移动时用力吸吮着每一个肉球。");
            outputText("[pg]她对这种对待半是咯咯笑半是呻吟，但你加快了抽插的速度，转移了她的注意力。你的先头液溢出在她的体内，她的肉壁适应了你快速的节奏，随着每一次挺进，越来越好地紧紧夹住你，你们交媾混合的体液开始从这个婊子紧致的穴口流出，洒在地上。");
            outputText("[pg]当你们俩一起交媾时，你用双臂抱住她，向下伸去，当她试图用她肥大、柔软的臀部摩擦你时，你的手设法穿过金色的羽毛，摸到了她那肥大、柔软的臀部，她的尾巴轻轻拍打着你的手腕。你用双手抓住她摇晃的臀瓣，将鹰身女妖的臀部抬起贴紧你自己的臀部，你们做爱的汁液流到厚厚的肉丘上，你利用增加的杠杆作用更用力地操这个无脑花瓶荡妇。");
            outputText("[pg]你的臀部变成了断断续续的拍打声，你帮助索菲迎合你不断的猛烈抽插，她的内壁拼尽全力榨取你" + get_player().cockDescript(_loc2_) + "的精液，她长满羽毛的手臂划过你的背，她发出了另一声尖锐的呻吟——然后她的身体僵住了。");
            outputText("[pg]这只鸟婊子高潮了，她的身体颤抖着，她的体液喷满了你的鸡巴，多余的体液随着她的内脏收缩而喷射出来，但你没有停下来；相反，你把头从她的乳沟里抬起来——这很难做到，因为那两个沉甸甸的肉球太大了——并对她咆哮。[say: 你已经高潮了？]你大声问道，为了赶上她而更用力地操她。");
            outputText("[pg]当她大叫时，你的双手紧紧抓住她肥硕的臀部，[say: 对不起！对不骑！对、对不起！对不——对不——对不骑——哈啊！啊嗯！啊！]她用越来越破碎的语调重复着，呻吟的冲动很快压倒了道歉的冲动。你低下头，厌倦了伸长脖子，嘴角勾起一抹坏笑，决定自己来获取高潮——再说，有什么比让你那大屁股的无脑花瓶女孩在你的肉棒周围不停地喷射淫液，直到你射精更好的呢？");
            outputText("[pg]于是，你用力捏住索菲的屁股，将她的臀部固定在原位，一次又一次地在她身上抽插，你的臀部重重地拍打在她的臀部上，直捣她那湿热的小穴深处，寻找更多的快感。你也确实找到了快感；这只母鸟饥渴的小穴非常乐意榨取你肉棒的精液，像活物一样在它周围起伏蠕动。");
            outputText("[pg]当你快要高潮时，快感从你的前列腺一直蔓延到你的胯部，");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]弹跳着，拍打着索菲那翘臀上它们能触及的部位，");
            }
            outputText("随着你越来越接近高潮，你开始随着臀部的每一次动作发出粗重的喘息和呻吟。索菲也察觉到了，她流着口水，双眼放光，她那抚摸着你背部的手臂将你拉向她。");
            outputText("[pg][say: 射、射精，射精！射在我里面！填、填满我，让我看看你有多爱，我，索菲妈妈的小、小穴！]这只鸟人荡妇乞求着你，她的双腿缠绕在你的大腿上。你没费多大功夫就满足了她；在她鼓励的呻吟声中，你越来越快地在她火热的深处抽插挺进，最后，伴随着一声大喊，你将自己深深埋入她的体内。");
         }
         else
         {
            outputText("还没等你决定到底要对你这只淫荡的鹰身女妖做什么，索菲就摇摇晃晃地朝你走来，每走一步，她大腿内侧都滴落着淫液。你看着这只丰满的鸟儿摇摇晃晃，她太兴奋了，而且体型太大，根本走不直，但最终她还是成功地走到了你面前。");
            if(get_pregnancy().get_event() >= 2)
            {
               outputText("她那因怀孕而隆起的腹部也确实没帮上什么忙。");
            }
            outputText("[pg][say: 那个，嘿，宝贝……]她娇嗔着，身子前倾，将她那柔软、硕大的乳房压在你身上。特别是她的乳头，紧紧地顶着你的[armor]，这只鹰身女妖已经完全发情了，还没等你做出任何反应——她就凑过来吻了你，那沾满药物的嘴唇绝望地一次又一次地砸在你的嘴唇上。");
            outputText("[pg]有那么一瞬间，你迷失在其中，混合着药物的唾液开始在你体内流淌，让[eachCock]开始跳动、脉动，[if (cocks >= 2) {它们}][if (cocks = 1) { 它}]在你的[armor]里变得坚硬，你的手臂慢慢抬起，想要抚摸这只充满药物的鹰身女妖……然后你猛地睁大眼睛，一把推开了她。");
            outputText("[pg][say: 你这婊子！]你咒骂她，怒视着她跌坐在她那肥硕的屁股上。这只愚蠢的鸟儿愣了一下，试图弄清楚刚才发生了什么，但你根本不吃这一套。[say: 如果我想操你，我他妈早就操了！]你斥责她，慢慢脱下你的[armor]。尽管你大声吼叫，她似乎只觉得更兴奋了；她舔了舔嘴唇，开始揉搓她那流着口水的小穴，看着你脱衣服，你全程怒视着她，只觉得她那鼓励的呻吟声很烦人。");
            outputText("[pg][say: 哎呀，那个，你现在完全想操了，对吧？]索菲问你，她的声音变成了一声轻柔、沙哑的呻吟。[say: 所以我们，你知道的，我们做爱吧，好吗？好吗，宝贝？我们可以做爱，对、对吧？]她的手指现在深深地挖进了她那湿透的小穴，你可以看出，要么你把她操到昏迷，要么她自己把自己弄昏迷。该死，你现在<i>确实</i>硬了，所以还不如你来。");
            outputText("[pg]你嘟囔着踢掉最后一件[armor]，[eachCock]随着你的动作弹跳着，你走向那只手舞足蹈的鹰身女妖，她用空出的手向你招手，发出短促的“<i>耶</i>”和“<i>过来</i>”的叫声。你把鹰身女妖推倒，让她仰面躺下，有些好笑地看着她那巨大的胸部因撞击而摇晃弹跳。");
            outputText("[pg]你决定，不，你现在还不想操这个荡妇，你抓住她自慰的手和招唤你的手，猛地向上拉，俯身压在鹰身女妖身上，将她的双手固定在她的头顶。[say: 耶！]索菲大叫，感觉到[eachCock]在她的胯部摩擦。[say: 做、做吧！我，我太需要了！]她娇嗔着，对着你抖动她的胸部。你用空出的手揉捏她那柔软的乳房之一，同时慢慢地用你的臀部在她身上摩擦，将你的[cock " + (_loc2_ + 1) + "]直接贴在她的私处摩擦。");
            outputText("[pg][say: 不，]你漫不经心地告诉她，邪恶地笑着，[say: 你需要先受到惩罚，你这烂货。]你松开鹰身女妖的大乳房，手在空中划出一道弧线，以一个角度拍打在她的双乳上，鹰身女妖在你身下痛苦地叫唤。[say: 不、不要，宝贝！我喜欢，我需要，那个——]你再次拍打她那巨大的乳房打断了她，让她的声音卡在喉咙里。");
            outputText("[pg][say: 你需要什么，你这只塞得满满的火鸡？]你问她，没打算让她回答，又一次拍打她那巨大的乳房。她痛得叫了一声，咬紧牙关，你停下来，用手指捏住她的一个乳头。你用指尖揉搓、滚动那颗小小的花蕾，看着鹰身女妖眼泪汪汪、恳求地盯着你，你笑了。");
            outputText("[pg][say: 嗯？]你问她。[say: 你需要什么？]当你把手拉回来准备再打一巴掌时，她张开了嘴，但随后又闭上了，喉咙里发出一声高亢、清脆的呜咽。[say: 很好，这样才乖。]你轻声哄着，慢慢放下手，拍了拍这荡妇发红的乳房。她因为接触而呜咽，特别是当你把手压下去，在她的乳头上前后摩擦时，但她保持了安静。");
            outputText("[pg][say: 这样才乖。]你再次确认，抓住她那摇晃的乳房的根部。你向上拉扯，从底部到乳头挤压这个硕大的肉球，她在你手下低声呻吟，你再次抓住她的乳头，捏住那发红的凸起。这让她发出一声更高亢的呻吟，她恳求地盯着你的眼睛，但作为回应，你只是将你的[cock " + (_loc2_ + 1) + "]在她身上摩擦，让鹰身女妖感受到它。");
            outputText("[pg]之后你俯下身，托起一只巨大、下垂的乳房，将你那沾满药物的嘴唇锁在上面；索菲发出一声尖叫，嘴唇猛地张开——但当你抬头看她时，她又闭上了嘴。看来你<i>确实</i>能教无脑花瓶新把戏。你开始吸吮她的乳头，舌头在她敏感的乳晕和乳头上游走，她的身体颤抖着，你空出的手蹂躏着她的另一只乳房，所有的摸索、捏挤和揉捏都在攻击这只淫荡鸟儿那巨大的乳沟。");
            outputText("[pg]索菲的臀部开始在你身上摩擦，勉强能用你的体重压住她那肥硕臀部的围度，结果你的[cock " + (_loc2_ + 1) + "]摩擦她那饥渴裂缝的感觉只变得更强烈。你咬住索菲的乳头，看着她眼中闪过一丝担忧，然后你慢慢地前后摩擦，粗暴地用牙齿研磨那颗凸起。");
            outputText("[pg]这一次，她<i>确实</i>张大了嘴，发出一声尖锐的哭喊般的呻吟，但你没有理会，而是将对这只鸟人那对巨大乳房的刺激推向了高潮，舔舐、吮吸、揉捏、摩擦，索菲发出呜咽和尖叫，声音汇聚成连绵不断的欢愉叫喊。如果你的嘴里没有塞满鹰身女妖的奶子，你肯定会咧嘴笑，但现在……你松开了口，看着她的乳房落回胸前弹跳着，对她露出了坏笑。");
            outputText("[pg][say: 那么，荡妇。]你柔声说道，伸手握住你的[cock " + (_loc2_ + 1) + "]。你撸动了几下，享受着肉棒在指尖的触感，然后调整角度，让龟头直接摩擦着索菲那汁水四溢的小穴，这只鸟人正用眼神向你乞求。你松开她的另一只乳房，去抚摸她那" + (get_noFur() ? "皮肤光滑" : "长满绒毛") + "的大腿，当你轻笑时，她咬住了嘴唇。");
            outputText("[pg][say: 准备好了吗？]你问她，用龟头顶着她的入口。她张开嘴想要回答——而你却猛地一下全根没入，享受着她呻吟时声音瞬间拔高几个八度的样子。她湿透的小穴紧紧夹住你的[cock " + (_loc2_ + 1) + "]，内部的肌肉拼命地想要套弄你，但你没给它们多少空间；相反，你直接拔了出来，看着索菲那从你手中挣脱的双臂伸出来，试图把你拉回去。");
            outputText("[pg]它们不需要这么做；你再次用跳动的肉棒刺穿了这只鹰身女妖，享受着她湿润的内壁在真正夹紧你之前那一瞬间的颤抖，然后再次拔出，进入了一种节奏。[say: 给我叫出来，你这饥渴的骚货！]你命令她，臀部慢慢开始疯狂地抽插。");
            outputText("[pg]索菲急切地顺从了，她的声音响彻四周。[say: 是的，是的，是的，操，是的，还要！求、求你！是、是的！]她哭喊着，平时结结巴巴的语言被迫变成了一连串对你和你肉棒的不断、绝望的乞求。你听到一阵轻微的沙沙声，那是她那被称为尾巴的羽毛扇试图在她身下前后摆动，在泥土上画出一个小小的天使印记，你再次向前倾身，真正地投入其中。");
            outputText("[pg]当你俯身压在她身上时，索菲伸出双臂环抱住你，你这一次顺从了她，让这个从主母变成荡妇的女人把你拉向她那弹跳起伏的胸膛。当你操弄她时，你的脸直接埋进了她的乳沟里，你的[chest]撞击着她的下乳，你在鹰身女妖的奶子间来回摩擦，用力吮吸着每一个肉球。");
            outputText("[pg]她对这种对待半是咯咯笑半是呻吟，但你加快了抽插的速度，转移了她的注意力。你的先头液溢出在她的体内，她的肉壁适应了你快速的节奏，随着每一次挺进，越来越好地紧紧夹住你，你们交媾混合的体液开始从这个婊子紧致的穴口流出，洒在地上。");
            outputText("[pg]当你们交媾时，你伸出双臂环抱住她，双手穿过金色的羽毛，摸到了她那肥大柔软的屁股上，她试图用屁股迎合你的抽插，她的尾巴轻轻拍打着你的手腕。你双手抓住她那颤动的臀瓣，将鹰身女妖的臀部抬起贴紧你自己的，你们交媾的汁液顺着厚实的肉丘流下，你利用增加的杠杆作用，更用力地操弄这个大荡妇。");
            outputText("[pg]你的臀部变成了断断续续的拍打和撞击声，你帮助索菲迎合你不断的猛烈抽插，她的肉壁拼尽全力想要榨干你[cock " + (_loc2_ + 1) + "]里的精液，当她发出另一声尖锐的呻吟时，她长满羽毛的手臂划过你的背部——然后她的身体僵住了。");
            outputText("[pg]这只鸟人婊子高潮了，她的身体颤抖着，她的体液喷洒在你的老二上，多余的汁液随着她体内紧缩而喷涌而出，但你没有停下；相反，你把头从她的乳沟里抬起来——这很难做到，因为那对沉重跳动的肉球太大了——并对她低吼。[say: 你居然比我先高潮，你这愚蠢的婊子！]你冲她大喊，在愤怒中更用力地操她。");
            outputText("[pg]当她哭喊时，你的双手紧紧抓住她肥大的屁股，[say: 对不起！对不起！对、对不起！对不——对不——对不起——啊！嗯！啊！]她用越来越破碎的语调重复着，呻吟的冲动很快压倒了道歉的冲动。你嘟囔着再次低下头，厌倦了拉伸脖子，决定自己去寻找高潮。");
            outputText("[pg]于是你用力捏住索菲的屁股，固定住她的臀部，一次又一次地在她身上驰骋，当你在她火热湿润的小穴里寻找更多快感时，你的臀部重重地拍打着她的臀部。你找到了快感；这只鸟人婊子饥渴的小穴非常乐意榨取你肉棒的精液，像活物一样起伏蠕动着包裹着它。");
            outputText("[pg]当你快要高潮时，快感从你的前列腺蔓延到你的胯部，[if (hasBalls) {你的[balls]弹跳着拍打着索菲那翘臀上它们能碰到的部位，}]随着你臀部的每一次动作，你开始发出咕哝和呻吟。索菲也察觉到了，她流着口水，眼睛亮了起来，她那抚摸你背部的手臂把你拉向她。");
            outputText("[pg][say: 射、射精，射精！射在我里面！填、填满我，让我看看你有多爱，我，索菲妈妈的小、小穴！]这只鸟人荡妇乞求着你，她的双腿缠绕在你的大腿上。你没费多大功夫就满足了她；在她鼓励的呻吟声中，你越来越快地在她火热的深处抽插挺进，最后，伴随着一声大喊，你将自己深深埋入她的体内。");
         }
         if(get_player().cockTotal() == 1)
         {
            if(get_player().cumQ() < 250)
            {
               outputText("[pg]你的[cock " + (_loc2_ + 1) + "]在这只鸟人婊子体内跳动痉挛，你滚烫的精液在里面翻涌——然后你将它释放在她体内，一波又一波滚烫粘稠的精液喷洒在索菲的内壁上，这只鸟人婊子发出咕咕声并颤抖着，迎来了她自己的一次轻微高潮。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("[pg]你的肉棒在索菲火热的小穴里翻涌，在她体内释放出浓稠的精液，当你用精液涂满她的内壁时，这个荡妇无脑花瓶发出柔和的呻吟，快感在你的臀部激荡，她用臀部贴着你的臀部画着小圆圈摩擦，彻底享受着体内被注入一股滚烫精液的感觉。作为回应，当她拥抱你时，你抚摸揉捏着她的屁股，她的双腿从你的背上松开，你发出一声长长的叹息，开始放松下来。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("[pg]当你的高潮展开时，你的身体僵住了，一股股精液排入这个荡妇的小穴，她抚摸着你的背部并哭喊着，迎来了与你相匹配的高潮——而这额外的刺激只是助长了你自己的高潮，将你拥有的一切都释放进这个长满羽毛的婊子体内。你的精液顺着你的[cock " + (_loc2_ + 1) + "]滴落流淌，加入了已经从她体内涌出的混合性液中，你发出一声颤抖的叹息。");
            }
            else if(get_player().cumQ() < 3000)
            {
               outputText("[pg]当大量精液开始在你体内涌动时，你的臀部跳动颤抖着，你发现自己在索菲的奶子里呻吟，这只鸟人荡妇怂恿着你，一遍又一遍地嘟囔着[say: 射精！射精！射精！]。当你的第一股精液射入鹰身女妖的小穴时，你发出一声呻吟——然后闸门大开。你的臀部不断地撞击着这只鸟人婊子，她呻吟着享受着快感，每一次挺进都伴随着一股精液——这些精液很快就开始从她体内流出。[pg]索菲自己的高潮很快就开始了，她的肚子开始因为你的高潮而膨胀，你的精液把她的内壁、大腿和股沟连同你的胯部都染成了白色，当你结束时，她的肚子已经鼓起了一个小包。她颤抖着，臀部仍在抽搐，充满爱意地抚摸着你的背。");
            }
            else
            {
               outputText("[pg]你瘫倒在地，沉浸在快感中好一会儿，索菲似乎有些困惑，仍然偶尔发出咕咕声，但除此之外就安静了下来。就在她似乎要问怎么了的时候，你的臀部跳动了一下，给了你所需的最后一点刺激——第一股巨大的精液顺着你的[cock " + (_loc2_ + 1) + "]射出一道滚烫的快感弧线，体液喷涌而出，一次性填满了索菲的小穴。她发出一声尖锐的叫喊，头向后仰，整个身体都在颤抖。你发出一声绝望、饥渴的呻吟，把臀部向后拉，然后再次像活塞一样插入她体内，另一股精液释放在她已经过度充盈的通道里，当你一次又一次地插入她时，多余的精液从你的肉棒周围涌出，每一次推入都伴随着另一股滚烫的精液。");
               outputText("[pg]她的肚子很快就因为这种对待而膨胀起来，你的精液溢入她的子宫");
               if(get_pregnancy().get_event() >= 2)
               {
                  outputText("（或者至少是弄得到处都是，因为她的子宫已经被你的蛋塞满了）");
               }
               outputText("当你的[cock " + (_loc2_ + 1) + "]堵住了一切，不让它们流出时，索菲的叫声随着她再次高潮而变得更加响亮，她的肚子被你浓稠滚烫的精液撑得鼓鼓的，紧紧贴着你的[chest]。你终于完全插入了她，又释放了几股精液，这次它们无处可去——于是全都顺着你的肉棒溢了出来，高压喷射的白色浓浆将你的胯部和身下的地面涂满了黏糊糊的种子。");
            }
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("[pg]随着你高潮的爆发，[EachCock]抽搐着喷射出精液，插在索菲湿润小穴里的[cock " + (_loc2_ + 1) + "]首先迎来了来自你[balls]的喷发，紧接着，留在她体外的肉棒[if (cocks > 2) { s}]也喷射出第二股。你的[EachCock]又喷射了几股精液，把索菲的体内和大腿弄得黏糊糊的，然后你叹了口气，瘫倒在地。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("[pg]随着你高潮的爆发，[EachCock]在你身下跳动，你最初射出的几股精液溅得到处都是；索菲的大腿、胯部和体内都沾满了你的浓浆，你一边喷射一边颤抖，清空了你的[balls]，她开心地咕哝着，抚摸着你的背。她伸出另一只手抓住你的[cock " + (_loc3_ + 1) + "]，抚摸着较短的那根，它又在她的手腕上喷射了几股，她把你抱在怀里。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("[pg]当你坐着，在边缘摇摇欲坠时，索菲的体内挤压着你的[cock " + (_loc2_ + 1) + "]——然后你听到她从上方传来的声音。[say:射给我，宝贝，我，我想全都要！求、求你了……] 这就够了；用你的精液填满索菲的想法变成了一种奇怪的自我实现预言；你的腿在身后踢腾，臀部猛地一挺，第一股滚烫的种子从你的[cock " + (_loc2_ + 1) + "]中喷涌而出，用你自己的滚烫情欲浇灭了索菲小穴里的热火。当你用第二股、第三股、第四股填满她时，她发出了一声高亢的呻吟——你的[cock " + (_loc3_ + 1) + "]也同样喷洒在她的双腿和阴唇上");
            if(get_player().cockTotal() == 3)
            {
               outputText("，连同你的第三根肉棒，一起喷洒在她的肚子上。");
            }
            else if(get_player().cockTotal() > 3)
            {
               outputText("，连同你剩下的肉棒，你所有的肉棒都把种子喷洒在她身上。");
            }
            if(get_player().cockTotal() == 2)
            {
               outputText("。");
            }
            outputText("索菲颤抖着叹了口气，用手抚摸着你的[hair]，你听到她轻声说了一句[say:谢谢你……]");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("[pg][EachCock]痉挛着，抽搐着，被你的种子淹没——第一股爆发直接射在索菲的子宫颈上，你的[cock " + (_loc2_ + 1) + "]给这只鸟人荡妇染上了你的颜色。你摸索着揉捏她的屁股，把她肥大的臀部紧紧贴在你的臀部上，你在她体内和身上高潮，当你把精液喷洒在她的肚子和大腿上时，她白金色的羽毛被慷慨地染成了白色——在这个过程中，你的肚子和[chest]也沾满了精液，你在她巨大的乳沟里呻吟着，喊出了你的高潮。[pg]这只鸟人荡妇紧紧地抱住你，拼命地抓着你，她沾满精液的肚子因为你一次又一次的喷射而鼓胀起来，她的肉壁在充满繁殖欲的高潮中紧紧夹住你的肉棒。你从[balls]里释放出剩下的种子，给她留下了一个沾满精液的臀部和鼓胀的肚子，然后瘫倒在地，让她肥大的屁股重重地摔在身下湿润的泥土上。");
         }
         else
         {
            outputText("[pg][EachCock]同时爆发，你滚烫、痉挛的肉棒一起卸下了它们的种子——结果你不仅把索菲的体内喷成了白色，开始用你滚烫的浓浆淹没她的子宫，你还把精液涂满了她的大腿和肚子，当你尽力让这个变态的鸟人婊子怀孕时，你慷慨地把种子喷洒在她的双腿上。索菲尖叫着表达她的快感，当你一次又一次地在她体内和体外喷射精液时，她弓起了背——你的[cock " + (_loc2_ + 1) + "]发现自己被紧紧挤压和夹住，因为索菲的高潮只会让你的高潮更加强烈。[pg]你的[balls]拒绝清空，因为你的精液让索菲的肚子鼓胀起来，这只鹰身女妖在母性的高潮中再次高潮，发出嘎嘎的叫声，你发现自己在她的胸前呻吟，你的种子继续喷射，无力阻止自己的高潮。你试图压抑它，快感太强烈了，热流直冲你的脊椎，但你做不到；每一股巨大的种子都让你失去了控制，迫使你不断地在这个肥胖的鹰身女妖体内和身上高潮。[pg]最后你咬住了鹰身女妖的乳头，当你试图度过自己快感的浪潮时，她叫了出来，她颤抖着、呻吟着，喷出自己的汁液加入你的精液中，多余的浓浆和汁液淋湿了你的胯部和你们俩周围的泥土。她兴奋的嘎嘎声和尖叫声足够大，你确信营地里的其他人都能听到，但你不在乎；你的高潮终于开始减弱，索菲的肚子被你的精液撑得鼓鼓的，看起来就像怀了<i>好几个</i>蛋一样。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]就像事后才想起来一样，你被忽视的[vagina]在强烈的高潮后仍然在刺痛和颤抖，");
            if(get_player().wetness() >= 4)
            {
               outputText("喷射着");
            }
            else
            {
               outputText("滴落着");
            }
            outputText("它自己的汁液；在男性那一半的高潮中，你几乎没有注意到它，但是，当你重新调整姿势时，顺着大腿滴落的黏滑感是毋庸置疑的。");
         }
         outputText("[pg]索菲咕哝着抚摸你的头，对这（粗暴、性感、虐待狂般的）操弄非常感激，她抬起你的头，在你的脸上印下无数个充满泡沫的吻，似乎忘记了她抹在脸上的迷药鸡尾酒。你本来会担心不得不为了消除药效而再操她几次，但你现在太累了，就算你想，也无法再操她一次。相反，你再次瘫倒在你淫荡的鹰身女妖熟女身上，");
         if(get_pregnancy().get_event() >= 2)
         {
            outputText("把头靠在她怀孕的肚子上，暗自微笑。");
         }
         else
         {
            outputText("紧紧地抱着她，而她则尽力表达她的感激之情。");
         }
         if(sophieIsInSeason())
         {
            sophiePregChance();
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-4));
         if(!param1 && get_player().cor < 50)
         {
            dynStats(DynStat.Cor(1));
         }
         get_sophieScene().luststickApplication(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function reset() : void
      {
         saveContent.cuddlingDaughter = false;
         saveContent.daughterRocked = 0;
         saveContent.daughterMarried = 0;
      }
      
      public function postSophieTooBigImpreg() : void
      {
         clearOutput();
         sophieSprite();
         outputText("索菲又榨取了你三次高潮，直到她终于累了，而此时，你也同样筋疲力尽。你依偎在她身边昏睡过去，当她在你小睡期间开始亲吻你的阳具，想要第四次品尝你那溢出的种子时，你才勉强醒来。当你将近八小时后醒来时，她正睡得香甜，旁边留着一个水袋和几条肉干，供你恢复体力。和一个无脑花瓶生活在一起似乎也不错！");
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function postSophieImpreg() : void
      {
         clearOutput();
         sophieSprite();
         outputText("当你醒来时，索菲正依偎在你身边，她的手脚深情地缠绕着你。旁边放着一杯水和几条肉干……显然是她趁你睡着时弄来的，知道你会又渴又饿。你用手指穿过她那白金色的、柔软如绒毛的头发。有一个住在一起的无脑花瓶其实也没那么糟。");
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function postEggSelector(param1:String) : void
      {
         clearOutput();
         sophieSprite();
         outputText("[say: 那我就专门为你生一些漂亮的" + param1.toLowerCase() + "蛋吧，帅哥，]她说。[say: 不过我一周只能生一个。其他的都要卖掉。我会把它和每周的收入放在一起，好吗？]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1102,1);
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1103) != param1)
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,1103,param1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1104,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1105,7);
         }
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noToSophieIncest() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你的手滑到女儿的脸颊上，温柔地抚摸着她，然后用手指穿过她羽毛般的头发。你轻柔的触碰让女儿发出了像鸟儿一样温柔的咕咕声。你引导她坐下，告诉她经历了这样的转变后应该休息一下。她应该在家庭之外寻找伴侣。你不想这么快就鼓励这种公然的性行为，于是你让她坐在索菲的巢穴里休息。立刻，她的母亲就来到了她身边，兴奋地拍打着翅膀，拉着女儿谈论你，以及一旦她找到自己的伴侣后能拥有的所有乐趣。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noSophieSleepWith() : void
      {
         clearOutput();
         sophieSprite();
         outputText("索菲垂下眼睛说道：[say: 我明白了……那我就……回我的巢里睡吧。一个人……] 她步履蹒跚地走开了，尾羽无力地垂在她那巨大、弹跳的臀部上，显然对这个决定很不高兴。即使她消失在一块岩石后面，你也能听到她吸鼻子的声音，她正努力不让自己哭出来。");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Sophie")
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function moveSophieInRepeat() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你走到这个长着羽毛的无脑花瓶面前，漫不经心地问她是否还想和你同床共枕");
         if(!get_pregnancy().get_isPregnant())
         {
            outputText("，尽管她已经不再怀孕了");
         }
         outputText("。索菲丰满的、涂着口红的嘴唇弯成一个灿烂的笑容，她涂抹的金色唇彩让这个笑容更加迷人。");
         outputText("[pg][say: 真的吗？就是说，我睡觉的时候可以依偎在你身边，而你可以把我的胸部当枕头用？！] 她问道，声音里掩饰不住少女般喜悦的尖叫。索菲上下蹦跳着；她的翅膀因为极度兴奋而疯狂拍打，扬起的灰尘几乎要迷住你的眼睛。[say: 我保证你睡觉的时候我不会打扰你，但也许我们可以，比如，在早上来个速战速决？]");
         outputText("[pg]你翻了个白眼，对她竖起大拇指。毕竟，你不可能和一个性饥渴的无脑花瓶睡觉，还指望她不会在某个时候“骑”上来。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Sophie");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function letSophieMilkYoDick() : void
      {
         clearOutput();
         sophieSprite();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你对索菲点点头，保持身体不动。作为奖励，她再次用乳房包裹住你，将你重新笼罩在紧致的快感中。");
         if(get_player().balls > 0)
         {
            outputText("当她开始动作时，你的[balls]在怀孕的肚子上拖拽，但你一点也不介意。让它们撞击你们结合的果实，有一种说不出的色情意味。");
         }
         outputText("她的乳房毫无预兆地开始跳动，上下完美同步。紧致的乳交几乎让人受不了。你能感觉到你的阴茎在那令人窒息、浸满润滑液的胸部中弯曲。索菲伸出舌头舔你，她的舌头给你已经勃起的阴茎带来了一阵阵兴奋的冲击波。");
         outputText("[pg]你大声呻吟着，拼命地克制着自己的本能。索菲微笑着说：[say: 嗯，我特别的[boy]喜欢[his]阴茎被摩擦，而[he]却不得不站在那里焦急万分吗？]她深情地啄了一下你的阴茎，又一个令人酥麻的吻叠加在巨大的化学快感上，让你的[balls]紧缩。[say: 我知道你喜欢，宝贝。索菲妈妈会，就是，把那些浓稠、下流的精液都挤到她脸上给你。你想快点射吗？我能，就是，随时让你射出来！]");
         outputText("[pg]你点点头，咬住嘴唇。索菲歪着头，似乎不明白你的意思。[say: 是的！我想射！求你了！]");
         outputText("[pg]索菲夸张地翻了个白眼，把嘴从你的鸡巴上移开。[say: 你干嘛不直接说呢，性感小宝贝？]她可爱地咯咯笑着，继续打磨你那根镀金的肉棒。她的眼睛再次看向你，嘴角上扬，开始在你的" + get_player().cockDescript(_loc1_) + "上哼唱。索菲突然改变了节奏，左乳向下弹跳，右乳向上托起。两边奶油般的乳房以不同的节奏运动着，带着令人愉悦的交替摩擦，将滑腻的药物涂抹在你的" + get_player().cockDescript(_loc1_) + "上，它立刻开始抽搐和跳动。这感觉就像你的鸡巴同时操着两个不同的逼，同时还享受着一双丰满、被蜜蜂蛰过般的无脑花瓶嘴唇的口交。");
         outputText("[pg]索菲停止口交，用嘴型对你说：[say: 射吧。现在，]然后立刻把嘴放回原处");
         if(get_player().cocks[_loc1_].cockLength <= 30)
         {
            outputText("，准备接住精液");
         }
         else
         {
            outputText("，帮助精液");
         }
         outputText("带着灼热的温度从你的[balls]里冒出来。她从两边用力挤压，用她滑腻的乳房夹住你的" + get_player().cockDescript(_loc1_) + "，你的尿道因为沉重的负担而膨胀。伴随着清晰的挤压声，你感觉身体里的每一滴精液都像长矛一样喷射而出。");
         if(get_player().cocks[_loc1_].cockLength <= 30)
         {
            outputText("索菲");
            if(get_player().cumQ() < 250)
            {
               outputText("毫无怨言地吞了下去，当她吸吮你那少量的精液时，眼睛里闪烁着愉快的笑意。令人惊讶的是，你又向她体内喷射了几次，一次比一次弱。这个鸟人女孩轻松地喝了下去，目光从未离开过你。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("的脸颊因为你精液的量而鼓了起来，但她还是大口大口地咽了下去。令人惊讶的是，你又向她等待的喉咙里喷射了几股浓稠的奶油，一次比一次弱，但量大到让她难以吞咽。她咽下精液时，目光从未离开过你。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("的脸颊因为你巨大的喷射量而夸张地鼓了起来，奶油从她的嘴角溢出，她可怜的嘴巴被淹没了。她的喉咙滑稽地上下滑动，试图跟上水流，但当你紧接着那强劲的喷射，又射出几股较小但依然强劲的精液时，她放弃了，任由精液顺着她的嘴唇和脸颊流下，滴在她的乳房上。在整个过程中，她的眼睛从未离开过你。");
            }
            else
            {
               outputText("的脸颊滑稽地鼓起了一瞬间，然后快感让精液从她的鼻子里喷涌而出，从她的嘴角喷射出来。她<b>试图</b>吞下它，但她那狭窄的喉咙根本无法");
               if(get_silly())
               {
                  outputText("抵挡如此规模的精液");
               }
               else
               {
                  outputText("处理这么多精液");
               }
               outputText("。一次又一次，你把精液喷在她的脸上，直到索菲干呕着退开。作为努力的回报，她得到了一张精液面具，即使她已经吞下了一肚子的精液。她<b>本来</b>在看着你的脸，直到你的精液遮住了她的眼睛，即使在那时，她的头也一直对着你，让你看着你的精液顺着她美丽的脸庞流下，从每一个曲线滴落。");
            }
            outputText("鸟人女孩退开了");
            if(get_player().cumQ() < 1000)
            {
               outputText("带着幸福的微笑");
            }
            else
            {
               outputText("咳嗽着，语无伦次");
            }
            outputText("一旦你把每一滴都射出来。她深情地抚摸着你的" + get_player().cockDescript(_loc1_) + "，在它的底部挠痒痒，她涨红的脸似乎对让你射得这么厉害感到非常满意。索菲的手慢慢抚摸着她的肚子，抬头看着你，低声说：[say: 你对索菲妈妈太好了。一定要尽快再为我的小穴射精，好吗？它想你了。]");
         }
         else
         {
            outputText("索菲");
            if(get_player().cumQ() < 250)
            {
               outputText("当精液喷射到空中并落到她的头顶时，她开心地咯咯笑着，在精液渗入她白金色的羽毛时，她贴着你的鸡巴呻吟着。在整个过程中，她舔舐和吸吮着你的肉棒，榨干每一滴精液，目光从未离开过。");
            }
            else if(get_player().cumQ() < 800)
            {
               outputText("当你浓稠的精液喷溅在她的头发上，顺着她金色的羽毛滴落，形成一张凌乱的网时，她发出了呻吟。在整个过程中，她不停地吸吮和舔舐着你，清理着你的" + get_player().cockDescript(_loc1_) + "，直到她确信每一滴精液都被排到了她曲线优美的身体上。");
            }
            else
            {
               outputText("当你巨大的精液团溅落在她身上，顺着她的头发浓稠地流下，浸透了她的肩膀，甚至像一张湿滑的面具一样滴落在她的脸上时，她发出了淫荡的呻吟。她不停地亲吻和吸吮，以确保你榨干每一滴，直到她感觉到你的尿道停止了高潮的跳动才停下来。即使在那时，她的脸仍然仰视着你，让你看着你的精液毫无阻碍地流过她丰满的身体，从每一道曲线上滴落。");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("她从头到脚都湿透了");
                  if(get_player().cumQ() >= 3000)
                  {
                     outputText("并且一个");
                     if(get_player().cumQ() < 4000)
                     {
                        outputText("水坑");
                     }
                     else if(get_player().cumQ() < 6000)
                     {
                        outputText("大水坑");
                     }
                     else if(get_player().cumQ() < 10000)
                     {
                        outputText("小湖");
                     }
                     else
                     {
                        outputText("淫秽的湖泊");
                     }
                     outputText("已经在你们俩周围形成了");
                  }
                  outputText("。");
               }
            }
            outputText("当你瘫倒回去时，她收集了一些你的精液，涂抹在她的乳房和肚子上，陶醉在皮肤上的感觉以及她那巨大的、怀孕的乳房感觉有多么美妙。");
            outputText("[pg]索菲抓住你，把你拉向她沾满精液的肚子，她的双手在那个光滑的、孕育着卵的球体上上下摩擦。她柔声说道，[say:你对索菲妈妈真是太好了。一定要确保很快再为我的小穴射精，好吗？它想你了。]");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(-2));
         get_sophieScene().luststickApplication(8);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function interruptSophieIzma() : void
      {
         clearOutput();
         outputText("你下定决心。虽然看着这两个狐狸精搞在一起很诱人，但你必须让她们知道她们是<b>你</b>后宫的一部分。当然，任何没有你参与的乐趣都不算乐趣。你从岩石后面走出来，向虎鲨人和被绑住的鹰身女妖喊话，要求知道发生了什么事。");
         outputText("[pg]伊兹玛惊讶地从鹰身女妖身边跳开。[say: 哦，阿尔法！]她结结巴巴地说，转过身来面对你。她想了一会儿，本就湿润的额头上渗出一滴汗珠。[say: 我，呃，只是在为你准备你的奴隶，]她撒谎道。");
         outputText("[pg]你眯起眼睛看着她们，看向那个大胸荡妇，问这是不是真的。[say: 不是的，[name]，但我只是<b>太</b>发情了！]");
         outputText("[pg]你冷冷地瞪了伊兹玛一眼，命令她把索菲放下来。她照做了，尽管有些不情愿。你提醒伊兹玛，你是她的阿尔法，而不是反过来，她应该把手从你的商品上拿开。你摸了摸这个无脑花瓶丰满的屁股，把她带离了伊兹玛的营地区域，低声对她说，她迟早会得到她想要的。");
         doNext(playerMenu);
      }
      
      public function harvestEggs() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你问索菲，她在这里的时候能不能产出特定颜色的蛋。");
         outputText("[pg][say: 当然可以啦，小傻瓜，]她咯咯笑着。[say: 你不知道吗，那边水里会冒出漂亮的小颜色哦？]她指着湖的方向。[say: 狗狗经常带我去那边散步。那些颜色“嗖”的一下，就钻进让人舒服的地方啦！]她生动地比划着。[say: 宝贝，你想要什么颜色的？]");
         eggSelector();
      }
      
      public function goHogWildOnSophieBewbs() : void
      {
         clearOutput();
         sophieSprite();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你才不在乎她的保证——眼前就有一对柔软的乳房等着肉棒去操，没有什么能阻止你随心所欲地把精液射在上面！索菲还没来得及反应，你就把她掀翻仰躺，骑在了她的胸口上。当你把你的" + get_player().cockDescript(_loc1_) + "调整到完美的位置时，你的[butt]摩擦着她怀孕隆起的肚子上方。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你其他的肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("向外张开");
            }
            else
            {
               outputText("向外张开");
            }
            outputText("，无力地擦过她乳房的外侧。");
         }
         outputText("索菲惊讶地嘟囔着，直到你的");
         if(get_player().cocks[_loc1_].cockLength <= 30)
         {
            outputText(get_player().cockHead(_loc1_) + "挤进她那受惊的肉棒枕头里，比任何口塞都更有效地堵住了她的嘴。她立刻吸吮起来，眼中闪烁着快乐的光芒。这个无脑花瓶似乎只想躺在那里，为你清理肉棒。");
         }
         else
         {
            outputText("巨大的肉棒拍打在她的脸上，因为它太长了，根本无法塞进她的喉咙。它完全盖住了她的脸，用坚硬、青筋暴起的肉棒肌肉闷住了她的五官。在丰满嘴唇的帮助下，她立刻开始在肉棒底部慷慨地舔舐和留下长长湿润的吻。当她的眼睛从你的" + get_player().cockDescript(_loc1_) + "下面露出来时，看起来平静而快乐。看来这个荡妇只想躺在那里，好好伺候你的肉棒。");
         }
         outputText("[pg]你抓住索菲丰满的乳头，立刻把它们当作着力点，在你的肉棒上方将它们拉拢在一起。那小巧的、像卵石一样的“操纵杆”几乎已经坚硬如石了！随着你的拉扯将她的乳房挤压在你的" + get_player().cockDescript(_loc1_) + "周围，并在她的大脑中引发爆炸般的快感，索菲努力保持清醒，以便继续用嘴伺候你的阳具。她舌头的舔舐很快开始退化为痉挛般的、本能的抽动，带着淫荡的狂热在你的底部扫过。感觉依然很好，所以你并不介意。索菲屁股下方的空间泥泞地晃动着，这证明了这只鹰身女妖有多享受这场幽会，即使你已经反客为主。");
         outputText("[pg]索菲的乳房重重地撞击着你的胯部。你的[hips]已经开始前后摆动，从你怀孕的小骚货巨大的肚子上弹开，又撞回她丰满的乳房上。这些摇晃的乳房紧紧包裹着你的" + get_player().cockDescript(_loc1_) + "，感觉实在太棒了，你甚至无法理解为什么有人会愿意等待这种快感。你用力地操着她的乳房，动作如此猛烈，以至于索菲开始发出短促的痛苦喘息，停止了口交，因为痛苦和快感在她的脑海中令人困惑地交织在一起。她从侧面抓住自己的双乳，将它们压向你，以减轻她受虐乳头的一些张力。");
         outputText("[pg]她那涂了蜂蜜唇彩的嘴唇效果对你来说越来越明显，最直观的表现就是你的" + get_player().cockDescript(_loc1_) + "正在经历着粗大且极其快速的跳动。它在鹰身女妖肥大的乳房中快乐地抽搐、跳动。她柔软的乳房有着完美的弹性，而润滑它们的金色液体使它们像湿润的小穴一样滑溜，甚至可能更滑。前列腺液正从你的龟头滴落");
         if(get_player().cocks[_loc1_].cockLength <= 30)
         {
            outputText("直接滴进索菲的嘴里");
         }
         else
         {
            outputText("滴在索菲的头顶");
         }
         outputText("。这只鸟骚货停止了她疯狂的口交，乞求道：[say: 射在我身上吧，[name]！射满索菲妈妈的脸和奶子！我他妈的超喜欢，就是，被精液覆盖的感觉！]");
         outputText("[pg]你正要训斥她，她又叫了起来，声音更大，更有力，几乎带有催眠效果，在你体内引发了一连串强烈的快感，让你根本无法抗拒，[say: 射给我！]");
         outputText("[pg]索菲把你推开，距离刚好够你把精液卸在她的脸和乳房上");
         if(get_player().balls > 0)
         {
            outputText("，她用一只手托住你的[balls]并按摩它们以帮助你射精");
         }
         outputText("。你的[butt]紧紧贴着她的肚子，你们俩都汗流浃背，在彼此身上滑来滑去。在她的乳房拥抱中膨胀，你的" + get_player().cockDescript(_loc1_) + "弯曲着，你的" + get_player().cockHead(_loc1_) + "变粗了。");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("你的肉结膨胀到了一个荒谬的程度，被涂满金色液体的光滑乳房从四面八方挤压着，很高兴被温暖的肉体吞没。");
         }
         outputText("精液像喷泉一样从你体内喷涌而出，溅落在索菲的脸上，其中一些在途中落在了她的乳房上。一条白色的粘液带悬挂在她高耸的胸部和下巴之间，只有当你再次将雪白的乳霜喷射在她的乳房上时才会断裂，大部分精液都和你一起被困在她紧密的乳沟里。你向前滑动身体，继续射精，将滚烫、粘稠的精液喷射在她的脸上。");
         if(get_player().cumQ() > 1000)
         {
            outputText("一次又一次，你继续把她涂成白色。当你射精时，你的高潮似乎永无止境。索菲的脸被精液浸透了，她的乳房变成了涂满糖霜的山峰。");
         }
         if(get_player().cumQ() > 2500)
         {
            outputText("当你结束时，精液已经在她身下积成了一滩。你的鹰身女妖宠物能做到的最好反应，就是沐浴在你的精液中，露出一个沾满精液的微笑。");
         }
         outputText("你推了推你的" + get_player().cockHead(_loc1_) + "，在射精结束时得到了她的一个吻，最后一点精液渗到了她肥厚的嘴唇上。当你抽出时，她发出了最令人兴奋的呜咽声，你在她肿胀的肚子上擦拭你的阴茎，再次将她标记为你的所有物。");
         outputText("[pg]你微笑着退开，穿上衣服，而那个无脑花瓶则无助地开始自慰。你的金棒很快消失在你的[armor]里，但她唇膏的余韵会让你在一段时间内一直想着她……");
         outputText("[pg][say: 哦，就是，谢谢你！]她在你身后喊道，[say: 下次给我的小穴来点，好吗？它完全想你了！]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(-2));
         get_sophieScene().luststickApplication(8);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giantCocksImpregnateSophie() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         sophieSprite();
         outputText("该死，这个丰满的鹰身女妖说得对——[eachCock]真的，<i>真的</i>很想操她的小穴，但绝对塞不进去！不管怎样，你开始脱衣服，心想总能找到办法把几发精液深深地射进那个湿漉漉的成熟小穴里。你的[armor]一脱下，[eachCock]就开始膨胀到它那淫猥的极限尺寸。无论以什么标准来看，你的生殖器都大得惊人，你迫不及待地想用用它们。它们感觉太棒了，不用简直暴殄天物！");
         outputText("[pg]索菲咯咯地笑着，[say:哇，[name]，你简直，巨……巨大……真的好大，之类的！]她跪在你身边，双手环抱住你巨大的阴茎，感受着光滑敏感的皮肤在她的指尖跳动。血管明显变粗，完全扩张时几乎和她的小指一样粗，像一个荒谬的气球一样使[eachCock]膨胀起来。索菲立刻在肿胀的底部印下了一个吻，留下了一个完美的、金色的唇印。那个地方奇妙地刺痛着，这只会鼓励你不断勃起。当你半硬的阴茎垂在她的头上时，她抱住它，一遍又一遍地亲吻它，不顾一切地在你" + get_player().cockDescript(_loc1_) + "最敏感的区域涂抹越来越多的催情剂。在你意识到之前，你已经变得坚硬而饥渴，因为她唇彩里的某种药物而全身刺痛，兴奋得根本不在乎。");
         outputText("[pg]索菲从那团肉块下探出头来，抬头迎上你的目光，说道：[saystart]哦哦，[name]，你真是太有男人味了！我打赌你的精液肯定在里面晃荡晃荡的");
         if(get_player().balls > 0)
         {
            outputText("在你那饱满的蛋蛋里");
         }
         else
         {
            outputText("在你的体内");
         }
         outputText("，就等着喷射出来呢！[sayend] 她的语气更像是在陈述一个事实，那古怪而又催眠的、如歌唱般的嗓音仿佛直达你的心底。精液似乎<b>真的</b>在你的体内翻腾，随着你的心跳加速，你对这只丰满鹰身女妖的渴望也愈发强烈。索菲用她柔软的手掌在你的阴茎下方摩擦，正好擦过你的尿道口，她用那种奇怪的语调继续说道，[say: 你<b>好</b>硬，好满。这让你的肉棒变得更……] 她又给了你一个湿润的吻，这次是吻在你的" + get_player().cockHead(_loc1_) + "上。[say: ……更敏感了。<b>这么</b>敏感，就像我只是用手指摩擦你，就和操小穴一样爽，对吧？]");
         outputText("[pg]索菲用修剪整齐的指尖划过你的一根暴起的青筋。她……她说得对。你发誓那根本不是指尖，而是丝滑、湿润的褶皱，正将温暖、湿润的润滑液涂抹在你那巨大的肉棒上。当另外四根手指也加入进来时，你发现自己沉浸在了一个湿滑、诱人的天堂中，完全不想离开。索菲一边抚摸着你巨大的肉棒，一边咯咯地笑着，在手指划过的地方留下新的吻痕。先列腺液几乎立刻从你的龟头冒了出来，滴落在索菲的头发上，把她的卷发粘在脑后。她抓起一团精液开始涂抹，这让快感达到了全新的高度。你不由自主地呻吟起来，射出一股浓稠的先列腺液，期待着即将到来的高潮。");
         outputText("[pg]突然，索菲向后仰倒，平躺在地上。你的" + get_player().cockDescript(_loc1_) + "正好落在她的双乳之间，龟头离她撅起的嘴唇只有几英寸。索菲舔了舔嘴唇，当你俯下身时，她盯着你巨大的肉棒。你能感觉到你巨大的阴茎在这个荡妇曲线优美的身体上愉快地刺痛着，感受着她的每一道曲线、每一片羽毛，以及美丽无瑕的肌肤。索菲吸溜了一大滴从你尿道里滚出来的先列腺液，并大声地吞了下去。她尽可能地张大嘴唇，吻在你的精孔周围。一股强烈的欲望立刻席卷全身，集中在你敏感的" + get_player().cockHead(_loc1_) + "上。糖浆般的先列腺液溅在她的脸上，她扭动着身体向后退，她的整个身体都在抚摸着你，直到你的" + get_player().cockHead(_loc1_) + "紧紧地贴在她那闪烁着金色光芒的阴唇上，吸收着更多她那催情的分泌物。");
         outputText("[pg][say: 看起来，你好像准备好要射了，嗯？] 索菲一边沉思着，一边用脚抓住你的肉棒，小心翼翼地不让爪子抓伤你。你仍然能感觉到它们，那锋利的爪尖压在你敏感的皮肤上，虽然不至于痛，但足以让你感觉到。她开始慢慢地用爪子为你手淫，做着小幅、快速的来回运动。她高兴地用那种如歌唱般的嗓音呻吟着，[say: 来吧，为索菲妈妈射出来！把精液射进我那火热、湿润、多汁的小穴里，好吗？你那巨大的肉棒应该很容易就能把我塞满卵子，对吧？所以继续吧，释放出来。释放出你体内积压得紧紧的、翻腾的欲望。]");
         outputText("[pg]索菲一边说话一边用臀部摩擦着你，但没过多久，她就因为自己的呻吟而不得不停止了闲聊。当她与你目光交汇时，她那湿滑的阴部变得越来越湿润，她直勾勾地盯着你，无声地用口型说道：[say: 射给我。] 那股被压抑的压力、情欲、渴望，以及药物带来的迷幻感，在你的脑海中交织在一起。她的话语就像打开了你体内的阀门，伴随着一声狂喜的咆哮，你体内那团炽热的狂喜之结爆发了。一股液态的情欲从你的龟头喷涌而出，直接射进了索菲那湿透的小穴里。她尽可能地张大嘴唇以缓解水流，但仍有一些精液从她的指甲周围冒出，将她涂着金色指甲油的指尖染成了雪白。就像某种淫秽的精液泵一样，你一发接一发地射出浓稠的精液，尿道里鼓胀着你们交媾的果实。");
         if(get_player().cumQ() >= 500)
         {
            outputText("没过多久，索菲的肚子就开始隆起，压力使得你越来越多的种子浪费在这个无脑花瓶的大腿上。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("你强烈的射精很快就让那个小小的隆起膨胀成了一个圆顶。大量的精液从你的龟头周围流出，随着每一次新的射精而微微喷涌。你实在无法再把更多的精液塞进她体内了，多余的精液在她柔软的臀部周围汇聚成水坑。");
         }
         outputText("[pg]索菲娇嗔道：[say: 哦，是的，全射进来，[name]。感觉<b>太太太</b>棒了！] 她弓起背，享受着这种感觉，最后用拇指在阴蒂周围紧紧地打圈摩擦，直到她开始颤抖、痉挛，因为被充分受精而高潮迭起。你自己的高潮汁液停止了流动，但你的阴茎依然坚挺且刺痛。精液从索菲痉挛的小穴里溢出，这是她高潮时紧缩的结果。这个金发无脑花瓶慢慢平静下来，用手指蘸了一点从她蜜壶里渗出的性爱污泥，舔了舔品尝了一下。她抓住你巨大的阳具，把它拉到唇边又吻了一下。");
         outputText("[pg][say: 准备好第二回合了吗？] 她问道，已经感觉到新鲜的情欲在你的阴茎中涌动。你当然准备好了……");
         sophiePregChance();
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1));
         if(get_player().cumQ() < 5000)
         {
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 3;
         }
         get_sophieScene().luststickApplication(8);
         menu();
         addButton(0,"继续",postSophieTooBigImpreg);
      }
      
      public function get_pregnancy() : PregnancyStore
      {
         return get_game().sophieScene.pregnancy;
      }
      
      public function get_eggTypes() : Array
      {
         if(eggTypes == null)
         {
            eggTypes = [get_consumables().L_BLKEG,get_consumables().L_BLUEG,get_consumables().L_BRNEG,get_consumables().L_PNKEG,get_consumables().L_PRPEG,get_consumables().L_WHTEG];
         }
         return eggTypes;
      }
      
      public function get_debugName() : String
      {
         return "Sophie";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fuckYoPregnantHarpyWaifu(param1:Boolean = false) : void
      {
         var _loc2_:int = get_player().cockThatFits(sophieCapacity());
         if(param1)
         {
            sophieSprite();
            outputText("[pg]哦哇，感觉真好。你前后摇晃着脑袋，试图弄清楚把你从睡梦中唤醒的愉悦感觉。有一股温暖的湿润，不，是一股滚烫的湿气包裹着你的" + get_player().cockDescript(_loc2_) + "，被紧紧的、天鹅绒般的帘子包裹着。在那之上，有一个沉甸甸的重量压在你的肚子上——不是太重，但足以让你完全意识到它的存在。" + (get_noFur() ? "她的" : "长满羽毛的") + "大腿紧紧夹住你的[hips]，随着它们主人的每一个动作上下摩擦。你睁开眼睛，映入眼帘的是你怀孕的鹰身女妖荡妇妻子的景象。");
            outputText("[pg]索菲正在你的" + get_player().cockDescript(_loc2_) + "上摩擦，尽管你看不见你的阴茎在她肿胀的阴阜中进进出出。她怀着蛋的肚子坐在你身上，用它那闪亮、紧绷的皮肤遮挡了下方任何性爱场景的视线。当你看到索菲的肚脐凸出来时，你轻笑了一声，并轻轻戳了它一下。");
            outputText("[pg]这位准妈妈高兴地叽叽喳喳地说，[say: 你喜欢我们的宝宝吗，[name]？她会超级可爱的，就像我一样。也许她甚至会像我一样，长出大胸部！或者长出能够一个接一个地产卵的丰满、多产的臀部……]索菲一想到这里就浑身发抖，抓住你的手，把它按在她的肚子上。她让你抚摸她怀孕的肚子，同时继续在你的鸡巴上摩擦，沉浸在母性光辉和漫长、缓慢的");
            if(param1)
            {
               outputText("，早晨");
            }
            outputText("性爱带来的双重感觉中。她的皮肤如丝般光滑，如果你稍微用力推一下，你实际上能感觉到她体内生长的坚实曲线。那颗蛋确实变大了！");
         }
         else
         {
            clearOutput();
            sophieSprite();
            outputText("你脱下你的[armor]，让索菲欣赏[eachCock]的景色。她立刻蹦蹦跳跳地走过来，在你面前跪下。她的手环绕着" + get_player().cockDescript(_loc2_) + "，");
            if(get_player().get_lust() > 50)
            {
               outputText("感受着它的坚挺。[say: 哇，你已经这么硬了，[name]！]她评论道。");
            }
            else
            {
               outputText("慢慢地抚摸着它，直到它开始跳动，在她的手中变粗。");
            }
            outputText("你的坚挺工具很快就在她的手淫下愉快地刺痛起来，怀孕的无脑花瓶饥渴地舔着嘴唇。她问道：[say: 你能躺下让我坐在上面吗？这样对我来说会容易些，因为我现在肚子很大。]她用手抚摸着她怀孕的腹部，显然在等待时很享受。");
            outputText("[pg]你向后靠在毯子上，照她说的做，因为和孕妇做爱确实需要一点互相迁就。索菲摇摇晃晃地走过来，当她爬到你身上时，她曲线优美的臀部仍然设法诱人地扭动着。她沉甸甸的乳房，通常足够挺拔以支撑自己，当她安顿下来时，放在她肿胀的肚子上，微微晃动。你把你的" + get_player().cockDescript(_loc2_) + "拿在手里，把它举到她的阴唇上，正好赶上她放低自己，把你吸收到她小穴那个挤压鸡巴的避风港里。当她接纳你时，她呻吟着。[say: 哦哦，你提醒了我为什么一开始会怀上这个蛋！]你和她一起抚摸着她的肚子，只是欣赏着她光滑、曲线超级优美、怀孕的身躯。那颗蛋确实很大！");
         }
         outputText("[pg]索菲缓慢地转动臀部画着圈，自信地骑乘着你的" + get_player().cockDescript(_loc2_) + "。");
         outputText("[pg][say:你根本不知道我有多需要这个，]她说道。[say:一开始我的胸部变得好大，然后我的小穴也变得更湿了！只要一想到你，它就像个该死的水龙头一样，现在看到你光着身子？天哪，我都要<b>喷水</b>了！]湿润的水流顺着你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]流下，在掉落到地上之前，它们在上面挂成了厚厚的水滴，");
         }
         else
         {
            outputText("会阴和[legs]");
         }
         outputText("多次证明了她的话的真实性。你看不见那湿润，但你的" + get_player().cockDescript(_loc2_) + "绝对能感觉到，当那湿润的波浪滚过时，它在索菲丝滑的裂缝里抽搐着。");
         outputText("[pg]你坐起身，双臂环抱住鹰身女妖怀孕的腹部，抓住她的后腰。她的乳房摇晃着，互相碰撞，就在你触手可及的地方。你紧贴着她孕育着生命的肚子，起身亲吻了她的一个乳房。索菲呻吟着，开始将臀部抬高几英寸，然后重重地落回你身上。她的目光与你交汇，小心翼翼地托起一只乳房，将乳头推向你的嘴。你贪婪地吮吸着她的乳晕，舌头在她肿胀紧绷的小乳头下方游走。你每吸吮一下她的胸部，索菲的小穴就会收缩一下，这让你产生了一个罪恶而愉快的想法。");
         outputText("[pg]你释放压力，她的小穴也随之放松。然后，你再次吸吮她紧绷的乳头。她湿透的小穴用另一次柔软的挤压配合了你的策略。没过多久，你就把这个无脑花瓶的大乳头当成了她小穴的控制杆，一次又一次地吸吮和释放，让她用尽全力榨取你的" + get_player().cockDescript(_loc2_) + "。索菲没有任何抱怨——只有幸福的喘息和淫荡的呻吟交织在一起。即使作为一个怀孕的鹰身女妖母亲，她的身体也绝对是为性爱而生的，简直不可思议。空气中几乎弥漫着她果味的体香——每次你让她挤压你的肉棒并释放出新鲜的淫液时，这种气味就会变得更浓。");
         outputText("[pg]索菲颤抖着，她的乳头在你的嘴里变得更加肿胀。过了一会儿，你注意到另一个乳头似乎同样肿胀，但还没有被吸吮，所以你把那个被吸得红肿的乳头从嘴里吐出来，贪婪地咬住另一个，重新开始循环。索菲的裂缝在你第一次吸吮时就爆发了，在你周围起伏，疯狂地紧握着你。她的眼睛向上翻，半隐藏在颤动的睫毛下，释放出一声长长低沉的呻吟，她的整个身体都因为这一切的兴奋而颤抖。你的" + get_player().cockDescript(_loc2_) + "浑身酥麻，被润滑液、感官的愉悦和一座丰满的鹰身女妖屁股山所淹没。你把手移到下面，捏住那弹跳的臀瓣，死死抓住，因为鹰身女妖的小穴正用狂喜攻击着你。");
         outputText("[pg]索菲恳求道，[say:哦哦哦，射在里面，宝贝，我想再感受一次！]你还没来得及回答，[eachCock]就已经满足了这位准妈妈的愿望。所有被压抑的压力、兴奋和欲望都从你体内喷涌而出，液体的波浪从你被榨干的" + get_player().cockDescript(_loc2_) + "中直接排入鹰身女妖的通道。");
         if(get_player().cockTotal() > 1)
         {
            outputText("她那巨大的、怀孕的肚子底部突然顺滑地滑过你，被你未使用的肉棒喷出的浪费的精液润滑着");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。无意中的腹交让快感加倍，迫使你应对一次真正的、多根肉棒的高潮。");
         }
         outputText("立刻，你射入她体内的精液开始被挤出来。由于里面巨大的蛋，她的子宫被堵住了，你的下半身变成了果味、咸味的混合物，全都是索菲挤出的精液和淫液。");
         if(get_player().cumQ() >= 500)
         {
            outputText("那里有足够多的液体");
            if(get_player().cumQ() < 1000)
            {
               outputText("浸透你的毯子");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("浸透你的毯子和下面的地面");
            }
            else if(get_player().cumQ() < 5000)
            {
               outputText("浸透你的毯子并在下面形成一个巨大的水坑，让你感觉自己像是在一张由精液做成的水床上。");
            }
            else
            {
               outputText("浸透你的毯子并形成一个湖泊，你们俩部分沉入其中，周围是泥泞的、精液味的泥浆。");
            }
         }
         outputText("[pg]当最后几滴液体漏出时，你瘫软下来。索菲滚到一边，大口喘着粗气。她咯咯地笑着，");
         if(param1)
         {
            outputText("[say:这...真是...开始...早晨的...好方法！]");
         }
         else
         {
            outputText("[say:哦哦...你...会成为...一个很棒的...[daddy]...]");
         }
         outputText("伴随着气喘吁吁的呼吸声。");
         outputText("[pg]索菲把你留在那里");
         if(get_player().cumQ() >= 1000)
         {
            outputText("在变硬的泥土中");
         }
         outputText("，性感地摇晃着她的臀部，精液从小穴里流出，汇成一条条浓稠的小河。当你去洗漱穿衣时，你感到湿润、粘稠，并且得到了满足");
         if(param1)
         {
            outputText("。这将是美好的一天。");
         }
         else
         {
            outputText("当你去穿衣服的时候。你必须确保在某个时候洗干净，但现在你享受着你的无脑花瓶宠物精液的甜美气味。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         if(param1)
         {
            doNext(playerMenu);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function fuckBimboSophiesTits() : void
      {
         sophieSprite();
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你一把抓住索菲的乳房用力揉捏，把她拉向你，用拇指弹拨着这个无脑花瓶的乳头。她跌跌撞撞地走向你，发出满足的呼噜声：[say: 现在是谁在主动呀，嗯？如果你想玩索菲妈妈的奶子，你只要，嗯，开口就行了嘛！][pg]");
         outputText("鹰身女妖抓住你的[armor]并脱了下来，让你的双手可以自由地继续抚摸她的乳房。一旦你变得和你那淫荡的荡妇一样赤裸，你终于放开了那对巨大的、像西瓜一样的乳房，欣赏你的杰作。索菲那愚蠢、空洞的眼睛放大了，她的嘴巴张开着流着口水，她的乳头很容易就有你的拇指那么大。她轻轻地喘着气，只是用呆滞的眼神盯着你。你只能假设她那简单的大脑已经陷入了某种色情恍惚状态，但这只会让你觉得用她那巨大、柔软的乳房来释放自己这个想法更加诱人。[pg]");
         outputText("你抓住她的乳头，在附近的一块石头上坐下；这只晕乎乎的鹰身女妖被拉得跪了下来。");
         if(get_pregnancy().get_event() >= 2)
         {
            outputText("当她摆好姿势时，她肿胀的肚子压在你的[legs]上，那个沉重的、被蛋撑得变形的肿块紧贴着你。");
         }
         outputText("她摇摇晃晃地向前倾，她那巨大的双峰轻松地滑到[onecock]的两侧，将其完全吞没。你依然抓着她的乳头，把它们拉拢在一起，并且");
         if(get_player().cocks[_loc1_].cockThickness < 8)
         {
            outputText("将你自己完全包围");
         }
         else
         {
            outputText("尽可能多地包围你自己");
         }
         outputText("在温暖、光滑的皮肤里。你的" + get_player().cockDescript(_loc1_) + "距离她鼻子只有几英寸，这味道似乎把索菲从恍惚中惊醒，她绽放出一个大大的笑容，大到你都担心会把她的脸撑破。[pg]");
         outputText("[say: 发-发生什么事了-嗯嗯嗯，看起来真不错！哦，它已经在索菲妈妈的大奶子里了！耶！那个，你介意我亲它一下吗？]这个无脑花瓶带着斗鸡眼、对鸡巴上瘾的表情问道。你点头同意并向后靠去，对事情的进展感到非常满意。[pg]");
         outputText("突然，索菲那撅起的嘴唇贴上了你的" + get_player().cockHead(_loc1_) + "，轻柔地吮吸着，同时她的舌头还挑逗着你敏感的尿道口。她抬起头换了口气，眼中满是情欲，口水从她丰满的嘴唇边滴落，润滑着她的双乳。你的" + get_player().cockDescript(_loc1_) + "周围印着一圈金色的唇印，标志着她用口交给你带来了多少快感。她抬起双手，将手掌按在沉甸甸的乳房上，几乎把它们完全遮住，然后顺着你" + Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸长的肉棒向上滑动。她那涂了药的口红让你的" + get_player().cockHead(_loc1_) + "感到一阵美妙的刺痛，你叹了口气，很高兴你这个金发碧眼的婊子长出了如此壮观的乳房。[pg]");
         outputText("丰满滑润的嘴唇再次包裹住你，用琥珀色的唇彩进一步弄脏了你的" + get_player().cockDescript(_loc1_) + "。这足以让你神魂颠倒，欲火焚身，当她用乳房套弄你时，你在她那令人窒息的肉团中变得更加粗壮。索菲在吮吸你龟头的间隙柔声说道，[say: 嗯，好美味的肉棒！让我的奶子把你肉棒里美味的精液都榨出来，好吗，宝贝？][pg]");
         outputText("你没有拒绝，开始挺动臀部。这个无脑花瓶烦躁地抖了抖她白金色的羽毛，但她现在可不敢阻止你。你也抓住了她的乳房，将它们从她的手中托起，开始认真地操弄它们，你的肉棒随着每一次抽插穿过那巨大的乳沟。索菲傻乎乎地笑着，很快就忘记了被如此粗暴对待的不快，每当你的" + get_player().cockHead(_loc1_) + "靠近她的嘴时，她就会继续膜拜它。口水和金色的口红顺着她的乳沟流下，很快你的肉棒看起来就像一根金色的欲望之矛，在你这个无脑荡妇那如山峰般高耸的苍白沟壑中颤抖。[pg]");
         outputText("闭上眼睛，你沉浸在极乐之中，你的肉棒被涂满了助孕药物，同时还在操弄着一位充满母性的鹰身女妖的巨大乳房，这种汹涌的快感让你得到了极大的满足。一个简单的、气喘吁吁的声音乞求道，[say: 拜托，为我射出来吧……把你那些好玩的东西都射在我的奶子和这双贪吃肉棒的荡妇嘴唇上。就像，用你的种子涂满我，我想做你大屁股的鹰身女妖荡妇！][pg]");
         outputText("这个愚蠢的金发女郎的一只手在她那弹跳、晃动的胸部下方画着圈，抚摸着你的" + get_player().cockDescript(_loc1_) + "，用口水、汗水和涂了药的唇彩作为润滑剂为你打飞机。她又重又快地套弄着你，把它涂抹得");
         if(get_player().balls > 0)
         {
            outputText("到处都是，每当她需要休息时，就会涂满你的蛋蛋，你感觉到你的[balls]越来越沉重。");
         }
         else
         {
            outputText("到处都是，涂满你的会阴和屁眼，你感觉到你的身体在翻滚，为你这个白痴伴侣积攒着更多的种子。");
         }
         outputText("" + get_player().SMultiCockDesc() + "变得更加粗壮肿胀，一股暖流从根部涌上，你体内的肌肉紧紧收缩，挤出了一团粘稠的精液。它从你的马眼喷涌而出，喷了索菲一脸。[pg]");
         outputText("你才刚刚开始。索菲得意地笑了笑，张开嘴，伸出舌头品尝你的精液，与此同时，你射出了下一股精液，这股精液长得从她的头发一直拖到下巴，浓稠得从她脸侧滴落。她高兴地哼着歌，用乳房紧紧夹住你的" + get_player().cockDescript(_loc1_) + "，压力让下一股喷射在你体内积聚。片刻的积蓄之后，你的种子在鹰身女妖的乳房上萌发绽放，用精液浸透了它们。精液的液滴飞溅到你们俩周围的地上，但你还在继续射精。在你的脑海中，你幻想着自己让一个又一个鹰身女妖怀孕，那些淫荡的鸟类女孩骑在你那喷泉般的肉棒上，直到她们的肚子被种子撑大才离开。像这样，你可以让整个部落受孕……[pg]");
         outputText("当这个念头过去后，你瘫倒在地，筋疲力尽，口干舌燥。你眨了眨眼，驱散眼前的迷雾，看向索菲。她仰面躺着，不停地自慰，完全沉浸在自己的世界里。她漂亮的金色头发贴在身上，乳房上覆盖着厚厚一层白色的液体，");
         if(get_pregnancy().get_event() >= 2)
         {
            outputText("她肿胀的腹部闪闪发光，");
         }
         outputText("她的眼睛闭着，被厚厚的一层精液粘住了。她被彻底地颜射了，浑身湿透，从她疯狂地揉弄小穴的样子来看，她简直不能再高兴了。至于你，[eachcock]依然勃起着，尽管你觉得你已经一滴都不剩了。当然，浸透你金色肉棒的药物可能会让你保持坚挺，并准备好连续交配几个小时。[pg]");
         get_sophieScene().luststickApplication(5);
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function eggSelector() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(eggColors.length))
         {
            addButton(_loc1_,eggColors[_loc1_],(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var selected:Array = param2;
               return function():void
               {
                  _g[0].postEggSelector(selected[0]);
               };
            })([this],[eggColors[_loc1_]]));
            _loc1_++;
         }
      }
      
      public function declineBimboSophie() : void
      {
         sophieSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,283,1);
         clearOutput();
         outputText("你转身逃离这座山，赶在她强迫你带她回营地像兔子一样做爱之前。谁知道身边有这么一个发情的鸟人，你什么时候才有时间去探索。她很快就会找到伴侣的，你确信这一点。[pg]");
         get_combat().cleanupAfterCombat();
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function daughterRock() : void
      {
         clearOutput();
         outputText("尽管太阳早已落山，你那毛茸茸的宝贝女儿仍然兴奋地在营地里跑来跑去。你忍不住注意到，这只刚孵化不久的雏鸟今晚似乎精力充沛。看到她这么兴奋，你向她招手让她过来。你一引起她的注意，她就急忙向你冲过来，甚至差点被自己的脚绊倒！");
         outputText("[pg]当她靠得足够近时，你的女儿给了你一个大大的拥抱，并不耐烦地要求道：[say:[Daddy]，我们玩吧！]你回抱了她，告诉你的小鹰身女妖你们明天早上可以玩。你解释说，现在她应该睡觉了。");
         outputText("[pg][say:可是我不累，[Daddy]！]她不高兴地大喊。");
         outputText("[pg]虽然你可以直接强迫你的女儿上床睡觉，但你有一个更好的主意。你把毛茸茸的小雏鸟抱进你的[arms]里，这样你就可以摇着她了。从她发出的惊讶的叽叽声中，你可以看出她没想到你会把她抱起来。不过她毫不犹豫地依偎在你的[chest]上，变得越来越舒服。你开始以放松的节奏慢慢地前后摇晃这只年轻的鹰身女妖，试图帮助她入睡。悠闲的动作很快就让你的女儿难以睁开眼皮。");
         outputText("[pg]你继续充满爱意地摇晃着怀里长满羽毛的女孩，直到她再也睁不开眼睛。她几乎完全瘫软在你的怀里，对休息的渴望已经占据了她年幼的身体。你忍不住花点时间欣赏女儿可爱的脸庞。她睡着的时候看起来真的很平静，这让你想知道她所有的精力都去哪儿了。看到她终于准备好休息一晚了，你把女儿抱到她做的小窝里，轻轻地把她放下");
         outputText("[pg]在你离开之前，你一定要在她的额头上温柔地亲吻一下道晚安。你的女儿稍微动了动，她可爱的笑容几乎让你想整晚都陪在她身边……");
         saveContent.daughterRocked = get_time().days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function daughterPat() : void
      {
         var _g:SophieBimbo;
         var _loc1_:* = null as Function;
         clearOutput();
         outputText((saveContent.daughterMarried >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + 1 ? "想要向你的\"妻子\"表达一些爱意" : "无法抑制你的爱意") + "，你把你正在发育的女儿叫过来，想和她增进一下感情。");
         outputText("[pg][say:[Daddy]！]这只容易兴奋的小鸡叽叽喳喳地叫着。她走近时伸出长满羽毛的手臂，给了你一个拥抱。你把手放在她的头上，轻轻地抚摸着她的头发，看着她的羽毛因为你的动作而高兴地竖起来，你咧嘴笑了。");
         outputText("[pg][say:我爱你，[Daddy]。]她笑得合不拢嘴，可爱的脸颊鼓鼓的，这副模样让你愿意为了保护她而杀人。你多抱了女儿一会儿，直到她那充满青春活力的身体变得焦躁不安。在你放开她后，她调皮地跑开了。");
         if(bimboSophie())
         {
            _g = this;
            _loc1_ = function():void
            {
               _g.approachBimboSophieInCamp();
            };
         }
         else
         {
            _loc1_ = get_sophieFollowerScene().followerSophieMainScreen;
         }
         doNext(_loc1_);
      }
      
      public function daughterMarriage() : void
      {
         var _loc4_:* = null as Jewelry;
         clearOutput();
         outputText("你摆弄着手里的戒指，看着你可爱毛茸茸的女儿在不远处蹦蹦跳跳。你的小女孩沉浸在自己的世界里，你很难想象她在想象中会做什么。她时不时地从一只脚跳到另一只脚，咯咯地笑，这让你[if (ischild) {极度想加入|几乎感觉自己又像个孩子了}]，但你摇了摇头，想起了你的意图：你想和你的女儿结婚，或者至少做类似的事情。");
         outputText("[pg][if (ischild) {你自己甚至还没到适婚年龄|她肯定比英格纳姆任何结婚的人都要年轻一点}]，但你还是想表达你的爱意，你想象她会比任何事情都更享受仪式本身。你[walk]过去[if (tallness >= 60) {并且[if (singleleg) {放低身子|蹲下}]}]，呼唤你的女儿。");
         outputText("[pg]鹰身女妖雏鸟立刻冲了过来，放弃了她沉浸其中的任何奇思妙想，转而和你玩耍。这个举动可能意义不大，但它仍然温暖了你的心，增强了你伸出戒指并问她是否愿意嫁给你的信心。");
         outputText("[pg][say:那是什么？]她回答道，脸上带着明显的困惑，但还是兴奋地踮起小脚，目光在戒指和你之间来回跳跃。你猜想玛瑞斯的大多数居民都不知道婚姻是什么，更不用说社会结构截然不同的鹰身女妖了。然而，这只会让你更渴望向她展示什么是婚礼——这会让它变得更加特别。");
         outputText("[pg]你的感情一定很明显，因为你的女儿露出了与你表情相配的微笑，当你开始向她解释你的意思时，她变得更加高兴了。你告诉她，这是一场亲密的聚会，两个人会在全世界面前展示他们对彼此的爱。他们的一群朋友和家人都会出席，大家一起跳舞、聊天，分享这段经历，度过一段美好的时光。这真的是一段神奇的时光，此时你意识到你不需要再多说什么了——这只鹰身女妖的眼睛已经瞪得像铜铃一样大了。");
         outputText("[pg][say:我们可以一起做那个吗，[Daddy]？]她轻轻跳了一下，惊呼道。[say:我们以前为什么没做过？]");
         outputText("[pg]你情不自禁地被她的热情所感动，所以你回答说她是对的，但这只意味着你们必须弥补失去的时光。一秒钟也不能浪费；你把她[if (!ischild) {小小的}]手握在你的手里[if (ischild) {——对你来说大小刚刚好——| }]，然后出发，把她带到营火旁一个合适的地方。");
         outputText("[pg][say:那我们该怎么开始呢？]她问道，现在看起来对这件事有点紧张。你猜想你并没有大多数能让婚礼变得美好的东西——没有音乐，没有给[if (isfeminine) {" + (get_player().hasDress() ? "另一个" : "任何一个") + "|}]新娘的礼服，没有鲜花，甚至没有蛋糕——但同样地，真正重要的是分享的感情。你不需要任何东西来爱你的女儿。");
         outputText("[pg]但这仍然留下了你们实际要做什么的问题。你没有准备任何誓言或类似的东西，这里也没有人来主持仪式，但你把这些顾虑抛在一边，转向小女孩。她满怀希望地对你微笑，你想起了要说的话。");
         outputText("[pg]你开始说出从她出生那天起你就一直想说的话。你看着她从一个小婴儿成长为现在这个美好、充满活力的女孩。她总是那么活泼，在营地周围俯冲嬉戏，更重要的是，她让营地感觉真正充满了生机。你可以花上几个小时——甚至你的余生——只是看着她。");
         outputText("[pg]你的赞美让她越来越飘飘然，到最后，她看起来简直要高兴得炸开了。年轻的鹰身女妖显然没有预料到如此真诚和突然的事情，当你把结婚戒指递给她并问她是否愿意接受你时，她更加惊讶了。");
         outputText("[pg][say:呃……好！]你告诉她那些神奇的词。[say:哦，我愿意！]");
         outputText("[pg]你把戒指戴在她的手指上，她的眼睛闪闪发光。戒指有点大，所以戴得有些松，但你的女儿似乎并不在意，她伸出手，欣赏着那微光。她又回到了她自己的世界，你愿意付出任何代价来知道她的小脑袋里在想什么。");
         outputText("[pg][say:哦！]她突然喊道，眼睛猛地睁大。[say:在这里等一下！]");
         outputText("[pg]说完，她转过身，落到地上。她这样背对着你，你看不到她在做什么，但她似乎在非常执着地忙活着什么。你很容易就能探过身去偷看一眼，但那只会破坏惊喜。无论如何，没等多久，她就拍打着翅膀跳了回来，再次面对你，脸上带着灿烂的笑容，手里紧紧抓着什么东西。");
         outputText("[pg][say:你愿意，呃，接受……我吗？作为……嗯，不管你怎么说的。]");
         outputText("[pg]她的手指像娇嫩花朵的花瓣一样展开，里面握着一个用草编成的小圆环，形状像一枚戒指。它被绑起来，用一朵粉红色的小花固定着，那朵花比她能放在上面的任何宝石都要闪亮。这让人难以承受，但你接受了，你每一次都会接受她。");
         outputText("[pg]你的小女孩走上前，把圆环戴在你的手指上，她手工制作的戒指竟然不可思议地完美贴合。你胸中涌起的感情几乎让你不知所措，但你还是设法把鹰身女妖抱进怀里，当你靠近时，她的脸红了。你只享受了片刻甜蜜的期待，然后你的嘴唇就找到了她的嘴唇，她柔软、年轻的肌肤是世界上最令人欣慰的东西。");
         outputText("[pg]就接吻而言，这相对来说比较纯洁，但你尽可能地享受着它，当她对着你轻柔地叹息时，你几乎失去了镇定。过了一会儿，你把头向后仰，只是凝视着你女儿的眼睛，她半闭着眼睛，微微喘息着。吻可能结束了，但你还不想放她走，所以你用鼻子蹭了蹭她的[if (tallness >= 60) {头|肩膀}]，放松下来。");
         outputText("[pg]你把她紧紧地压在你的胸前，尽可能地靠近。你不希望你们之间有一丝一毫的距离——你希望你们的身体能像你们的心一样紧密相连。小鹰身女妖也依偎过来，显然和她的[father]有着同样的感觉，你们俩就这样安顿下来。她头发上淡淡的香气充满了你，自然而清新，你让你的眼睛慢慢闭上。");
         outputText("[pg]当你们最终分开时，你不知道已经过了多久，但对你来说，世界上的其他东西化为灰烬也无所谓。你能看出你的女儿因为所有的兴奋而有点疲惫，但更重要的是，她不断瞥向戒指的方式清楚地表明她想要一些时间来欣赏它。你不是那种会违背鸟儿意愿把它关在笼子里的人，所以你在她的额头上留下最后一个吻，依依不舍地看着她慢悠悠地走回她的巢穴。");
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740);
         saveContent.daughterMarried = _loc1_ + 1;
         var _loc2_:int = 0;
         var _loc3_:Array = [get_jewelries().SILVRNG,get_jewelries().GOLDRNG,get_jewelries().PLATRNG,get_jewelries().DIAMRNG];
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(get_player().destroyItems(_loc4_))
            {
               break;
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function daughterFlight() : void
      {
         clearOutput();
         outputText("你快步走向你的小雏鸟，把她拥入怀中。");
         outputText("[pg]这个小鸟女孩发出一阵咯咯的笑声。[say:我爱你，[Daddy]！]她说。来自这只柔软、长满绒毛的小鸟如此直接的爱意，让你的[paternal]本能高速运转，你毫不犹豫地回应了她的感情。然而，你并没有忘记你找她的目的，你看着这个孩子的眼睛，问她是否愿意和你一起飞。");
         outputText("[pg]她的眼睛奇妙地亮了起来。[say:好！我想像[Daddy]一样飞！]你保持着一个体面的姿势，拍打了一下你的[wings]，吹走了一阵风。你再次问你的女儿是否愿意，因为在天上可能会很可怕。当然，她迅速点头回应。[say:嗯哼！]");
         outputText("[pg]这一次，你认真地拍打着翅膀，紧紧抱住叽叽喳喳的小女孩，向前跃起。你升入空中，实现了适当的低空飞行。把这个孩子带得太高会很鲁莽，毕竟她还很小，但她对你给她的刺激已经足够着迷了。你的举动也没有逃过索菲的眼睛，你看到她坐在巢里，直直地盯着你。这位充满母性的鹰身女妖挥了挥手，你的女儿也欣喜若狂地挥手回应。");
         outputText("[pg][say:嗨，妈妈——！]小家伙尖叫着。尽管对你们俩来说，这次冒险都很刺激，但你确实感觉到了肌肉的酸痛。你从拍打翅膀过渡到更平缓的滑翔，相应地，你的女儿也和你一起伸出双臂，模仿你展开[wings]的样子。");
         outputText("[pg]当你倾斜翅膀下降时，阵风明显地吹动了附近营地的各种设施。暂时这样就足够了。小鸟儿咯咯地笑个不停，你一放下她，她就转身抱住你。[say:我爱你，[Daddy]！]她大声喊道，被兴奋感淹没了。鹰身女妖生来就是要飞翔的，所以她有这样的热情是件好事。你充满爱意地拍了拍她的头，示意她回去在索菲身边玩耍。");
         if(get_player().get_str() < 80)
         {
            get_player().dynStats(DynStat.Str(1));
         }
         get_player().changeFatigue(25);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function daughterCunnyContinuation() : void
      {
         clearOutput();
         outputText("过了好长一段时间，年轻的鹰身女妖再次睁开眼睛，抬头看着你。在你温暖的拥抱下，她的小睡比以往任何时候都更让人精力充沛！你的女儿用尽全力抓住你的身体，欣喜若狂地依偎着你。");
         outputText("[pg][say:我爱你，[Daddy]，]她叽叽喳喳地说着，脸上挂着灿烂的笑容。你回蹭了她一下，回应了她的感情，然后放她回去玩了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function daughterCunny() : void
      {
         clearOutput();
         outputText("你向你的女儿招手。一看到你伸出的双臂，她就兴奋地跳了起来，急忙扑进[father]的怀抱，把脸依偎在你身上，沉浸在你的拥抱中。");
         outputText("[pg][say:[Daddy]！你找我有什么事吗？]小鸟儿叽叽喳喳地说着，尾羽像小狗的尾巴一样高兴地摇晃着。你充满爱意地捏了捏她的脸颊，宣布“亲亲”，然后开始用嘴唇快速地啄她。鹰身女妖雏鸟开心地咯咯笑着。");
         outputText("[pg]你把她拉下来，身子前倾，嘴唇从她的脸移到她的胸部，在她裸露的躯干上点缀着令人发痒的亲吻。她抱住你的头，笑得更欢了，当你继续向前推进时，她顺势躺了下来。没过多久，你就让她躺下，大腿贴着你的脸颊，在她的阴蒂上印下一个吻。");
         outputText("[pg]你的女儿因为这种淫荡刺激的转变而颤抖着，喃喃地说：[say:我……我喜欢这种亲吻，[Daddy]。]");
         outputText("[pg]你拥抱着她大腿的温度，把脸贴进去，又啄了几个吻，然后让你的[tongue]滑过她的阴唇。她的爪子随着你器官的运动而满足地卷曲着。她宝贵部位甜美可口的味道满足了你原始的一部分，你用长长的动作让你的味蕾充分沾满她的兴奋。你用牙齿轻轻咬住她的阴蒂，听到她发出一声惊讶的叽叽声；很难不对鹰身女妖能发出的声音感到好笑。当你更加狂热地深入时，你的女儿抓住你的[if (hashorns) {horns like handles|head}]，在压倒性的刺激中稳住自己。");
         outputText("[pg][say:我感觉……]她在喘息间喃喃自语，[say:又暖又麻，[Daddy]。" + (saveContent.daughterMarried >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + 1 ? " 你结婚的时候也是这样做的吗？" : "") + "]她不由自主地在原地扭动时撞到了你的头，腿的动作也温暖了你的脸。年轻的鹰身女妖真的缺乏耐力！");
         outputText("[pg]你的舌尖绕着她那小小的凸起打转，在短短几分钟内就把她推过了边缘，她喘着粗气，尽可能多地用身体缠住你。虽然相当令人窒息，但你太兴奋了，根本无暇抱怨。");
         outputText("[pg]你的女儿重新躺下，在余韵中放松下来，只剩下轻微的颤抖。你又充满爱意地啄了她几下，然后躺下和她依偎在一起。她用尽最后一丝力气转向你，寻求最后一个充满爱意的亲吻，然后在你的怀里蜷缩起来，意识渐渐模糊。");
         get_player().slimeFeed();
         get_player().dynStats(DynStat.Lust(10));
         doNext(daughterCunnyContinuation);
      }
      
      public function daughterCuddle() : void
      {
         var _g:Camp;
         clearOutput();
         outputText("你向精力充沛的小鹰身女妖挥手，她很快就注意到了，没过一会儿就跑到了你身边。她似乎因为那些喧闹的举动而精疲力尽了。");
         outputText("[pg][say:[Daddy]——！]她喊着，整个人软倒在你身上。看来她比看上去还要累。小雏鸟需要好好休息，你把她抱进怀里，准备带她离开。该睡觉了。你把她架到肩上，朝床铺走去；女儿趁机张开长着羽毛的双臂，装作自己正在翱翔！虽然这模样很可爱，但她困倦的小脸实在让这场表演没什么说服力。等你走进你的[cabin]时，她的双臂又垂回了身侧。");
         outputText("[pg]你稍微调整了一下姿势，把女儿从肩膀上放下来抱在怀里，让她最后再体验一次飞翔的感觉，然后把她拉进[if (builtcabin) {床|你的铺盖卷}]里和你一起睡。");
         outputText("[pg]小鹰身女妖立刻蹭了蹭你的脸。[say:我爱你，[Daddy]。]");
         outputText("[pg]你回蹭了她一下，在她的脸颊上印下一个吻，然后依偎在女儿柔软的羽毛中。" + (saveContent.daughterMarried >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + 1 ? " 就在她睡着之前，她把戒指举到唇边，轻轻吻了一下，然后咯咯地笑了起来。" : "") + " 睡意很快就温柔地降临了。");
         saveContent.cuddlingDaughter = true;
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"harpy");
         _g = get_camp();
         doNext(function():void
         {
            _g.doSleep();
         });
      }
      
      public function daughterCheckup() : void
      {
         var _g:SophieBimbo;
         var _loc1_:* = null as Object;
         clearOutput();
         if(get_time().hours >= 22 && saveContent.daughterRocked <= get_time().days + 7)
         {
            daughterRock();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 200)
         {
            outputText("回到巢穴，你可爱的小鹰身女妖还只是一只小雏鸟。她的身体娇小，像个孩子，羽毛蓬松柔软，让你觉得你的小女孩的手脚像毛球一样。这只小鹰身女妖看起来已经有四五岁了，和那个年龄的人类孩子一样精力充沛。她到处乱飞，从一个东西爬到另一个东西。值得庆幸的是，这个喧闹的小宝贝很快就耗尽了爆发性的能量，突然倒在地上，变成一团毛茸茸的东西，快速地睡了个午觉。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 100)
         {
            outputText("回到巢穴，你可爱的小鹰身女妖开始长大了！她的身体比以前大得多，虽然她的婴儿肥已经扩散到她更大的身体上，看起来比你习惯看到的那些大屁股鹰身女妖更瘦长。她的羽毛甚至开始变得光滑，尽管她仍然是一个毛球。你确信，用不了多久，鹰身女妖闻名的曲线就会开始出现。她作为小雏鸟时散发出的能量仍然驱使她“恐吓”你的营地，四处乱窜，从一个地方飞到另一个地方，卷入各种各样的事情。你毛茸茸的女儿似乎能够比以前保持活跃的时间更长，尽管你仍然看到她每隔一段时间就蜷缩起来睡个午觉。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
         {
            outputText("你四处寻找正在发育的女儿，发现她和你的");
            if(bimboSophie())
            {
               outputText("喧闹的无脑花瓶");
            }
            else
            {
               outputText("慈祥的鹰身女妖");
            }
            outputText("正在共度美好的母女时光。索菲正在帮小女孩化妆，教她如何使用她族人非常喜欢的那种金色催情唇膏。你不太确定这对你的女儿来说是否合适，但话又说回来，鹰身女妖就是这样的，对吧？除了那支充满情欲的口红，你的");
            if(bimboSophie())
            {
               outputText("同居无脑花瓶");
            }
            else
            {
               outputText("最喜欢的鸟人");
            }
            outputText("接着弄她的头发和指甲，一直喋喋不休地谈论你，以及她计划要生的所有女儿。");
            outputText("[pg]你的女儿长得真快！她的身体已经开始发育，乳房在胸前隆起成柔软的凸起。她的臀部开始膨胀成鹰身女妖著名的标志性生育臀和圆润、好抓的屁股。[pg]");
         }
         if(saveContent.daughterMarried >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + 1)
         {
            outputText("[pg]");
         }
         menu();
         addNextButton("抚摸",daughterPat).hint("亲昵地揉揉她的头。");
         addNextButton("拥抱",daughterCuddle).hint(get_silly() ? "揉揉毛茸茸。" : "花一晚上和女儿拥抱。").disableIf(get_time().hours < 21,"现在拥抱还太早了。");
         addNextButton("飞行",daughterFlight).hint("带着小鸟翱翔。").disableIf(!get_player().hasFatigue(25),"你现在太累了，不能这么做。").disableIf(!get_player().canFly(),"你需要足够强壮的翅膀才能和女儿一起飞行。");
         if(get_allowChild())
         {
            addNextButton("舔阴",daughterCunny).hint("舔她的阴道。");
            addNextButton("假装结婚",daughterMarriage).hint("你可能无法举行正式的仪式，但你可以尽力而为。").disableIf(!get_player().hasItemArrayAny([get_jewelries().SILVRNG,get_jewelries().GOLDRNG,get_jewelries().PLATRNG,get_jewelries().DIAMRNG]),"你需要一枚戒指。").hideIf(saveContent.daughterMarried >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) + 1);
         }
         if(bimboSophie())
         {
            _g = this;
            _loc1_ = function():void
            {
               _g.approachBimboSophieInCamp();
            };
         }
         else
         {
            _loc1_ = get_sophieFollowerScene().followerSophieMainScreen;
         }
         setExitButton("返回",_loc1_);
      }
      
      public function daughterAwaken() : void
      {
         clearOutput();
         outputText("你醒来时，听到一阵轻微的啁啾声。这声音几乎有节奏，就像是鸟儿在打呼噜。鹰身女妖就是这样打呼噜的吗？这似乎是以后要考虑的问题，因为你的起身吵醒了你的女儿。你毫不迟疑地把她拉近，给了她一个早安拥抱，确保她一天中第一个清醒的时刻是父母的怀抱。");
         outputText("[pg][say:早上好！]小鸟儿欢快地叫道。在短暂的依偎之后，你起身开始新的一天，让这个小淘气包再次跑去营地里捣乱。");
         saveContent.cuddlingDaughter = false;
         doNext(playerMenu);
      }
      
      public function changeEggs() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你让索菲改变她为你产的蛋的类型。");
         outputText("[pg][say: 没问题，宝贝，]她咯咯笑着。[say: 你不知道吗，那边水里会冒出漂亮的小颜色哦？宝贝，你想要什么颜色的？]");
         eggSelector();
      }
      
      public function buttFuckBimboSophie() : void
      {
         sophieSprite();
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你命令你的无脑小母狗弯下腰，向你展示你留着她就是为了看的那圆润的臀部。她背对着你俯下身，屁股高高撅起，尾羽蓬松，一脸茫然地问：[say: 嗯……像这样吗，宝贝？还是这样？][pg]");
         outputText("这个无脑花瓶前后晃动着她的臀部，沉甸甸的臀肉在离你几英寸的地方抖动着。在两瓣臀肉之间，索菲那紧缩的肛门和汁水淋漓的小穴似乎在向你的[cocks]招手，但你现在只是看着，欣赏着这美丽的屁股为你抖动摇晃的景象。过了一会儿，她问：[say: 还是说你指的是这样？] 鹰身女妖紧绷大腿，开始随着一种只有你的荡妇似乎能听到的、充满活力的摇臀节奏上下弹跳她的屁股。你的目光上下游移，追随着那颗光彩夺目的心形肉团的弹道轨迹，而[eachcock]变得坚硬无比，完全准备好占有那个弹力十足的屁股。[pg]");
         outputText("你走近一步，脱下你的[armor]，回答道：[say: 对，就是这样。][pg]");
         outputText("索菲拍着手，发出少女般幸福的尖叫。[saystart]真的吗？我、我能再靠近一点做这个吗？");
         if(get_player().cockTotal() > 1)
         {
            outputText("那些鸡巴看起来");
         }
         else
         {
            outputText("那根鸡巴看起来");
         }
         outputText("好美……好……好美味！[sayend] 你拍了一下她的屁股，抓住她的尾羽，把鹰身女妖那微微翕动的肛门拉下来，套在你的" + get_player().cockDescript(_loc1_) + "上。她的声音提高了，不是因为愤怒，而是因为高兴，你的" + get_player().cockHead(_loc1_) + "在鹰身女妖直肠的前几英寸里愉快地跳动着。无脑花瓶放松下来，沉下身子，咯咯笑着问：[say: 我的屁股，嗯……让你感觉好吗？它好紧，而且让我的小穴都湿透了！][pg]");
         outputText("你用力捏住她颤抖的臀部，力道大到能感觉到她的肉从你指缝间挤出来，柔软的臀瓣几乎吞没了你的手，然后你用力拉她，把你的" + get_player().cockDescript(_loc1_) + "剩下的部分全部塞进她体内，一直插到");
         if(!get_player().hasSheath())
         {
            outputText("根部");
         }
         else
         {
            outputText("包皮");
         }
         outputText("。索菲的乳房在身下摇晃，下垂的肉球偶尔会垂得很低，以至于她拇指大小的乳头在粗糙的泥土上拖拽。");
         if(get_pregnancy().get_event() >= 2)
         {
            outputText("就像她的乳房一样，她怀孕的肚子也微微摇晃着，因为你给她的蛋的重量而显得沉甸甸的。");
         }
         outputText("每次发生这种情况，无脑花瓶都会叫得更大声，而且随着时间的推移，听起来越来越像个荡妇，越来越淫荡——一个真正的肛交荡妇。她回头看着你，眼中充满情欲，脸上挂着欢快的笑容。突然，这个笨蛋的一根手指在");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]上");
         }
         else
         {
            outputText("你的会阴上");
         }
         outputText("划过。它一路向下，穿过你们身体结合的地方，到达主人自己的小穴，在肿胀的阴唇上打圈，直到一长串淫液垂向地面。[pg]");
         outputText("[say: 太……爽了。怎么没人告诉我肛交这么、超级无敌好玩？] 气喘吁吁的无脑花瓶前后摇晃着屁股，你让她尽情享受她的“乐趣”。她扭动着，挣扎着，被一根鸡巴刺穿，并且乐在其中。你只是放松下来，让她尽情发挥，无脑花瓶的手指在湿透的阴户里穿梭，配合着她身体摇臀的扭动。她的肛门像机器一样榨取着你的" + get_player().cockDescript(_loc1_) + "，抽出浓稠的预精，让她的屁股几乎和她的小穴一样泥泞。她这么高效地伺候你，你很难站着不动，在让你的无脑花瓶用她丰满的臀部取悦了你一会儿之后，你厌倦了等待。[pg]");
         outputText("你把她推开，将你" + Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸的大部分从索菲被撑开的肛门里拔出来，只留下你的" + get_player().cockHead(_loc1_) + "撑开直肠的入口。她失望地呜咽着，直到你猛地向前扑去，突然把她塞满鸡巴，让她喷出几滴润滑液。你一手抓住她的头发，又快又狠地操着她的屁股，每一次抽插都伴随着你那没脑子的肛交玩具发出顺从的快乐尖叫。索菲欢呼着：[say: 操我，" + get_player().mf("stud","babe") + "，操我的屁股！嗯，对、对，就是那样。嗯，对，扯我的头发，告诉我我有多坏！][pg]");
         outputText("天哪，她真是个下贱的小鸟婊子！你猛地向后扯住她的头发，越过她的肩膀凑近低语道：[say: 喜欢这样吗，你这无脑花瓶？低头看看你小穴里流出的那些淫水。除了发情的荡妇，还有谁被操屁股会爽成这样？我看没有吧。][pg]");
         outputText("你继续又狠又快地操着她的屁股，无视了那些溅在你[legs]上黏糊糊的、充满母性的鹰身女妖淫液。在低沉的呻吟和尖叫声中，她尽可能大声地吼出[say: 爽！]，然后又陷入了安静、疲惫的喘息。然而，她的小穴并没有停止那惊人的渗漏；甚至可以说，她流出和喷出的顺从女孩淫水越来越多了。这只鹰身女妖的肛门环在你周围痉挛着，被你猛烈的抽插弄得只剩下无意义的颤抖。她半闭着眼睛回头看，乞求道：[say: 射……射我屁股里……那会……那会超级爽的，宝贝。求你了？把你的精液给我吧！][pg]");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋因为索菲的请求而紧绷起来，你发誓你甚至能听到精液在你体内翻滚、激荡的声音，随后它在你体内烧出了一条温暖的通道。");
         }
         else
         {
            outputText("你的内脏似乎因为索菲的请求而紧绷起来，你发誓你甚至能感觉到液体在你体内翻滚，烧出了一条温暖的通道。");
         }
         outputText("精液从你的" + get_player().cockDescript(_loc1_) + "喷射到你那无脑花瓶肥美的屁股里，伴随着清晰可闻的咕噜声，这让她的脸颊泛起了红晕。你更用力地扯住她的头发，用你的[hips]在她的屁股上撞击了几下，一边在她现在已经泥泞不堪的肛门里抽插，一边把剩下的精液都注入她体内。");
         if(get_player().cumQ() >= 500)
         {
            outputText("尽管你的精液随着每一次推挤从她的臀瓣间起泡喷涌，你依然没有停下");
            if(get_player().cumQ() >= 1000)
            {
               outputText("，用精液填满了她的肚子");
            }
            outputText("。");
         }
         outputText("伴随着最后几下愉悦的收缩，你肉棒喷涌的精液渐渐变成了滴落。你叹了口气，心想现在你的[balls]肯定已经被完全掏空了，你瘫靠在一块石头上，看着你的精液从索菲的屁股里涌出。她带着胜利的微笑，把一些精液推进了她粉嫩的下体，显然对自己很满意。[pg]");
         outputText("这只大胸笨蛋依然精力充沛，她蹦蹦跳跳地接住从她张开的屁股里流出的精液，把越来越多的精液塞进她湿透的小穴里。等她玩腻了，她甚至舔了舔手指，说道：[say: 谢谢你把我的屁眼弄得这么黏糊糊的！你甚至还给我留了足够的精液，可以塞进我的小穴里，这样我就能怀上蛋了！耶！][pg]");
         if(get_pregnancy().get_event() >= 2)
         {
            outputText("索菲又咯咯地笑了起来，揉着她已经装得满满的肚子，向你眨了眨眼，就好像你们在分享什么荒谬的笑话。你翻了个白眼——无脑花瓶！");
         }
         if(sophieIsInSeason())
         {
            sophiePregChance();
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bimbotizeMeCaptainSophie() : void
      {
         sophieSprite();
         clearOutput();
         get_player().consumeItem(get_consumables().BIMBOLQ);
         outputText("当你看着鹰身女妖");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("自慰");
         }
         else
         {
            outputText("在巢穴周围的泥土里扭动");
         }
         outputText("。解开你其中一个袋子的系带，你把手伸进去拿出里面的东西。你华丽地拿出了那瓶傻妞利口酒，当你走近倒下的鹰身女妖主母时，在它的牢笼里摇晃着这种强效液体；她用一种愚蠢的眼神抬头看着你，");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("情欲");
         }
         else
         {
            outputText("痛苦");
         }
         outputText("呆滞的眼睛，她那美丽却无法理解的脸庞下巴微张，空洞无神。这副模样对她来说还挺好看的。[pg]");
         outputText("你轻轻一拔，软木塞便从瓶口弹开，释放出一阵散发着酒精、浓烈香料和甜味的粉色细雾。你用手托住索菲的下巴，掰开她的嘴，将瓶口对准这个战败荡妇微张的嘴。这样一来，她几乎就完美了……几乎。你抬高瓶底，将美味的无脑花瓶酒滴入索菲那柔软、毫无抵抗的嘴里。酒液一碰到她的舌头，她便大口吞咽起来，随着魔法开始生效，她危险地前后摇晃着。你紧紧抓住她，将剩下的酒液直接倒进她的喉咙里。这位胸部丰满的鹰身女妖浑身颤抖，翻着白眼，微微咳嗽着。她的抽搐变得如此剧烈，以至于挣脱了你的控制，在她的巢穴地板上翻滚起来。[pg]");
         outputText("从她的头部开始，她那火烈鸟般粉红色的羽毛变得更加明亮，呈现出霓虹般的色彩。颜色不断变浅，直到红晕完全消失，一种淡淡的、几乎是金色的色调在她的羽毛状头发中逐渐显现。同样的景象也在她的翅膀、腿和长满羽毛的" + (get_noFur() ? "尾巴" : "臀部") + "上重演，白金色的羽毛覆盖了她的身体。随着索菲不由自主的颤抖慢慢停止，那些改变了颜色的羽毛柔软地蓬松起来。她摇了摇头，嘟囔着，[say: 哦，什么……你给我吃了什么？好……好难……思考。][pg]");
         outputText("你向鹰身女妖展示瓶子上的警告标签，等待她的反应。她困惑地眯起眼睛，向后退缩，她那起伏的乳房随之晃动弹跳着。[say: 那是什么？某种像，奇怪的语言之类的？我看不懂。] 索菲困惑地皱起眉头——你几乎能看到她那双睁大、无知的眼睛后面，大脑的齿轮正试图转动。她敲了敲下巴，手臂擦过她突然变大的资产，再次让她那膨胀的胸部晃动起来。[say: 我的天哪！我的咪咪变大了吗？] 她咯咯笑着问道。[say: 它们好……好晃好弹！][pg]");
         outputText("低头一看，证实了她的说法。虽然这对双胞胎肉瓜以前绝对是DD罩杯，但现在已经膨胀到了E罩杯，而且这绽放的胸部丝毫没有停止生长的迹象。在你的注视下，索菲的乳房长成了一对真正宏伟的巨乳，像果冻碗一样晃动着、泛起涟漪。她的乳头膨胀充血，这些小凸起在发情状态下轻松地增大了一倍，伸长到将近一英寸。随着索菲奶油般的肌肤泛起粉红，它们也变得通红，她的肉体因为胸部淫秽的生长而染上了愉悦的色彩。在恐慌和情欲中睁大眼睛，索菲的眼中闪烁着半成形的泪水，她哀嚎着，[say: 我这样没法飞了！][pg]");
         outputText("你轻笑一声，托起鹰身女妖那沉甸甸的肉球之一，惊叹于她那沉重乳房的光滑柔软。[pg]");
         outputText("索菲尖叫着，[say: 停、停下来！好、好、好敏感！][pg]");
         outputText("你叹了口气，用拇指摩擦她的乳晕，在巨大的乳头周围画圈，然后用力弹了一下那长长的凸起。这位鸟类主母因此颤抖呻吟，拱起背，将那巨大的肉团进一步压进你的手中，它们的重量迫使你背靠着山壁。她那坚硬的乳头更加突出，在你的指间滑动。谢天谢地，它们似乎没有再变大；虽然你不是裁缝，但你估计它们现在至少有F罩杯了。你漫不经心地按摩着这对超越了母亲级别的肉瓜，引得鹰身女妖那涂着金色唇彩的嘴唇发出一阵呻吟。她宽阔的臀部带着性感的渴望扭动着，空气中弥漫着发情鹰身女妖的气味。你一定是做对了什么。[pg]");
         outputText("索菲喘着粗气退后，转过身来，将她那沉甸甸的臀部放在你面前。长长的尾羽让你觉得痒痒的，但你烦躁地哼了一声，把那金色的绒毛拨开。[say: 是、是你把我变成这样的！不管是什么让我变得这么……发情、湿漉漉、美味又愚蠢……嗯……我们能做爱吗？] 她指责道，在她的长篇大论中途失去了思路，因为汁液开始从她发炎的阴唇滴落。[pg]");
         outputText("你用一根手指从索菲小穴的顶部滑到底部，甚至停下来，将润滑的手指滑过她的会阴，在敏感的肛门周围画圈。她呻吟着在原地弹跳，当她向后压时，她的臀部几乎挡住了你的视线。它们也变大了吗？你停下来观察她那吞噬双手的臀瓣，确认它们确实在变大——就像她的乳房一样。那毛绒绒的枕头臀变得更加圆润，膨胀得更大。你低头注意到她的双腿也分开了，因为索菲改变的身体和扩张的臀部而变得更宽。[pg]");
         outputText("索菲咯咯笑着，[say: 就像，你那么喜欢我湿漉漉的小穴吗？天哪，真可爱！但我为什么这么发情和愚蠢？] 她咯咯笑着。[say: 我不明白。我的头好轻好飘！不像以前那样。] 她的声音稍微低沉了一些，似乎在与自己挣扎。[say: 好难……好难思考。必须……必须……像，找个人做爱！嗯，你能给我舔舔吗？你感觉不到索菲妈妈的小穴有多热吗？它好像，需要一根舌头来降温什么的。][pg]");
         outputText("鹰身女妖那冒着泡沫的裂口在你的鼻子和嘴唇上摩擦，在你的脸上留下了一道芬芳的女孩蜜汁。在那个光荣的时刻，你完全失去了光线，只剩下这个新晋无脑花瓶的小穴贴在你的嘴唇上。她的大腿将高山的声音掩盖得几乎听不见，你发现自己不由自主地舔舐起来，试探性地舔着，看看她那变得淫荡的解剖结构中哪些部分会释放出最强烈的体液喷涌。一旦你用舌头刺激她的阴蒂，她就高潮了，用鹰身女妖的润滑液浸透了你的脸。金发女郎的大腿锁住你，将你紧紧抱在无脑婊子的小穴里，接受她那麝香般的洗礼。[pg]");
         outputText("经过片刻如倾盆大雨般粘稠的喷发后，索菲颤抖的小穴痉挛着，她的双腿失去了力量。她瘫倒在地，屁股翘在空中，完全暴露在外，她咯咯笑着，[say: 哇！你让我高潮得好厉害，[mister]！我能，像，跟你回家吗？我真的不想和这些婊子竞争，而且你超级" + get_player().mf("handsome","hot") + "！我们可以做很多，像，做爱之类的事情！][pg]");
         outputText("你对她的反应有点吃惊，但这说得通。这个愚蠢的女人已经被搞得太惨了，如果不成为某人的性奴，她就活不下去。她还不如成为你的。她回过头，用闪亮、充满希望的眼睛和厚嘴唇上恳求、撅嘴的表情看着你。它们也变大了吗？[pg]");
         outputText("说不似乎很愚蠢……她现在太他妈性感了，你毫不怀疑她会像你的私人自慰玩具一样。索菲窃笑着，[say: 拜托拜托拜托！嗯，我会一直亲吻你，像，用我的舌头舔你。别说不……我绝对需要操你！][pg]");
         outputText("你摇了摇头，感觉到那种强迫感在你的脑海中挥之不去。该死，她还能试图用她的话语来强迫你。你要带她回家，让她成为你首选的同居无脑花瓶吗？");
         dynStats(DynStat.Cor(5));
         doYesNo(acceptBimboSophie,declineBimboSophie);
      }
      
      public function bimboSophieSixtyNineAfterCunnilingus() : void
      {
         var _loc1_:int = 0;
         sophieSprite();
         clearOutput();
         if(!get_player().hasCock() || get_player().cockThatFits(sophieCapacity()) == -1)
         {
            outputText("你朝索菲扑了过去，脑子里全是快感和她那看起来美味的小穴，只想把嘴唇贴上她的小穴，不顾一切地吮舔。她硬是扛住了这一撞，和你一起在泥土与尘埃中翻滚，直到你摔坐在自己的[ass]上，又弹了几下才停住，而鹰身女妖那双" + (get_noFur() ? "" : "覆着羽毛的") + "大腿正夹紧你的脑袋。");
            if(get_pregnancy().get_event() >= 2)
            {
               outputText("她怀孕的肚子靠在你的腰间，丝毫没有受到粗暴摔倒的影响。");
            }
            outputText("她是怎么做到的？当你抬起头，看到你的目标——索菲那沾满淫液的三角区时，你的疑问烟消云散了。那里湿润得仿佛能让空气起雾，召唤着你将舌头探入其中，品尝它的滋味。[pg]");
            outputText("带着贪婪的欲望，你抓住鹰身女妖长满绒毛的屁股，揉捏着她丰满的臀部，把她滴着水的阴部直接拉到你的脸上。当那股强烈的女人味在你的[face]上蔓延，顺着你的下巴滴落时，你颤抖了一下。没有片刻犹豫，你长长地舔了一口索菲美味的汁液。它们有一种浓郁的味道，似乎在你的舌尖上发出嘶嘶声，然后变成一种柔软、甜美、像桃子一样的味道。你舒服地哼了一声——鹰身女妖是对的；你的舌头真的想品尝她。[pg]");
            outputText("[say: 哇！你舔小穴的技术真好，宝贝，]索菲宣布道，她缓慢而刻意地撅起嘴唇，清晰地吐出剩下的话语，[say: 你的舌头就是吃不够鹰身女妖的小穴！哦，耶，你绝对是我遇到过的最棒的舔阴高手！嗯，你喜欢索菲妈妈的淫液，对吧？耶——啊……舔舔舔！]说完，她含糊不清地咯咯笑了起来，扭动着臀部，把她流水的阴道涂满你的脸。你把[face]更深地埋进索菲那奶油般的阴部，一遍又一遍地舔舐，舌头卷进每一个美味的角落和褶皱。[pg]");
            outputText("索菲用手肘撑在地上，她那长及臀部的金色羽毛在你的[legs]上挠痒痒，同时她检查着你的腹股沟。这个荡妇鹰身女妖俯身在你沾满金色淫液的胯部，给了你的[clit]一个吻，她柔软的嘴唇将这个");
            if(get_player().getClitLength() < 1)
            {
               outputText("小巧的");
            }
            outputText("器官包裹在温暖的口交快感中。你在她丰满的小穴里呻吟，当震动引发一阵鹰身女妖的淫液瀑布时，你咯咯地笑了起来。受到启发，你开始随着每一次舔舐哼唱，声音从你的喉咙传出，把你的舌头变成了这个无脑花瓶的新型按摩棒。[pg]");
            outputText("你们俩在放肆的渴望中疯狂地攻击着对方的小穴，吸吮和呻吟的声音如此之大，估计一百码外都能听到。索菲的小穴似乎随着你味蕾的每一次接触变得更加美味，如果真有这种可能的话。你那愚蠢的伴侣似乎也同样迷恋你的小穴，她吸吮着你的阴蒂");
            if(get_player().getClitLength() >= 3)
            {
               outputText("，甚至停下来像打飞机一样给它手淫");
            }
            outputText("，动作急促，充满了需求。你斗鸡眼般地吸吮和舔舐，为了尽快让鹰身女妖高潮，你大口大口地吞咽着无脑花瓶的淫液。[pg]");
            outputText("索菲伴随着一声湿润的*啵*声，将她丝绸般的嘴唇从你沾满金色液体的腹股沟移开。[say: 你舔小穴的技术真是太棒了，宝贝！嗯嗯嗯，就，像，这样继续。你很快就会让索菲妈妈高潮的！让我高潮，宝贝！哦，试着让我高潮是不是让你对我的小穴感到饥渴？你要高潮了……我知道……你会和我一起高潮的，]这个无脑婊子一边说着，一边用手指搅动你的小穴，在周围抚摸，用长指甲划过你下体敏感的肌肤。她的话像波浪一样击中你，你带着新的活力，把整个舌头深深地插进鹰身女妖体内，下唇在她的快感豆上前后摩擦。你用力拉着她的臀部，用嘴疯狂地蹂躏她的小穴，完全不顾周围的一切，你的身体因为让你的宠物高潮而感觉太好，变得滚烫。[pg]");
            outputText("终于，这个无脑花瓶光秃秃的小穴在你的努力下达到了高潮，一股麝香般的女孩淫液溅了你一身。你仍然非常需要她的小穴，以至于你无法停止。你以非人的渴望舔舐、吸吮、吞咽，直到你上面的那个盒子除了你的唾液什么都不剩。然后，只有在那时，你才终于感到了释放。你的[vagina]为了索菲高潮了，浸湿了她的手指，并像你的生命取决于它一样紧紧绞着它们。她咯咯地笑着，从自己的高潮中平复下来，对她的话语在你身上产生的效果感到非常满意。[pg]");
            outputText("鹰身女妖站了起来，但只是转过身来，面对面地趴在你身上");
            if(get_pregnancy().get_event() >= 2)
            {
               outputText("，被蛋撑大的肚子在你们之间挤压着");
            }
            outputText("。 [say: 刚才太好玩了！那个，我们以后一定要再玩一次，但我现在需要喝点东西，而且你身上有小穴的味道。嗯，我喜欢那个味道。这意味着好玩的事情！]索菲在你的嘴上深深地吻了一下，她那沾满淫液的肿胀嘴唇用她的琥珀色唇膏染红了你的嘴唇。 [say: 你是，那个，最棒的舔穴高手，你知道吗？][pg]");
            outputText("索菲大摇大摆地走了，用手指摸了摸自己的阴户，然后舔了舔，品尝着你残留的唾液。");
            get_sophieScene().luststickApplication(5);
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(-1));
         }
         else
         {
            _loc1_ = get_player().cockThatFits(sophieCapacity());
            if(_loc1_ < 0)
            {
               _loc1_ = get_player().smallestCockIndex();
            }
            outputText("你扑向索菲，脑子里全是快感，以及她那看起来诱人的小穴。你想象着把嘴唇贴上她的阴户，肆无忌惮地吮吸舔舐；于是你猛地撞上去，将她扑倒。她硬生生扛下了这一撞，和你一起在泥土与尘埃中翻滚，直到你一屁股摔在[ass]上，又弹了几下才停住，而鹰身女妖那" + (get_noFur() ? "" : "覆着羽毛的") + "大腿正夹在你的脑袋两侧。");
            if(get_pregnancy().get_event() >= 2)
            {
               outputText("她那怀孕般隆起的肚子撞上了你的肚子，不知怎么的，在刚才那番粗暴的翻滚中竟然毫发无损。");
            }
            outputText("她是怎么做到的？当你抬起头，看到你的目标——索菲那沾满淫液的三角区时，你的疑问烟消云散了。那里湿润得仿佛能让空气起雾，召唤着你将舌头探入其中，品尝它的滋味。[pg]");
            outputText("带着贪婪的欲望，你抓住鹰身女妖那长满绒毛的屁股，揉捏着她丰满的臀部，将她滴着水的私处直接拉到你的脸上。当那股强烈的女人味在你的[face]上蔓延，顺着你的下巴滴落时，你忍不住打了个寒颤。没有丝毫犹豫，你深深地舔了第一口索菲美味的汁液。它们有一种浓郁的味道，似乎在你的舌尖上嘶嘶作响，然后渐渐变成一种柔软、甜美的桃子味。你舒服地哼了一声——这只鹰身女妖说得对：你的舌头真的很想品尝她。[pg]");
            outputText("[say: 哇！你舔穴的技术真好，宝贝，]索菲说道，她缓慢而刻意地撅起嘴唇，清晰地吐出接下来的话，[say: 你的舌头简直对鹰身女妖的小穴欲罢不能！哦哦哦，是的，你绝对是我遇到过的最棒的舔穴高手！嗯，你喜欢索菲妈妈的淫水，对吧？耶……舔吧舔吧舔吧！]说完，她含糊不清地咯咯笑了起来，扭动着臀部，把她漏出的汁液抹得你满脸都是。你把嘴更深地塞进索菲那奶油般的私处，一遍又一遍地用舌头舔舐，让你的嘴部肌肉卷过每一个美味的角落和褶皱。[pg]");
            outputText("索菲用手肘撑着身子趴下，她那长及臀部的金色羽毛在你的[legs]上挠痒痒，同时她打量着你的腹股沟。这个荡妇鹰身女妖俯身在[onecock]上方，轻轻地捏了捏它，用全神贯注的目光盯着那根跳动的阴茎。[say: 嗯，好美味的鸡巴！它，就像，是为了我这个小可爱才变得这么硬的吗？哦，太可爱了，宝贝！你只要躺下舔就好了，索菲妈妈会把你体内那些黏糊糊、臭烘烘的精液都弄出来的！][pg]");
            outputText("这个没脑子的鹰身女妖用她那修长、修剪整齐的指甲在你的尿道上摩擦，不断地挑逗着你可怜的" + get_player().cockDescript(_loc1_) + "。你在极乐中大叫出声，你那紧绷的声音被脸上流淌的如天堂般美妙的私处汁液所掩盖，尽管这充满激情的叫声让你的舌头产生了振动，似乎极大地取悦了她那迷人的小穴。它释放出一股汁液，流到你的舌头和嘴里，给了你更多你渴望的桃子和浓郁的味道。索菲的小穴尝起来太棒了，你必须得到更多！[pg]");
            outputText("你捏住她那颤动着的、无脑花瓶般的大屁股，把她的小穴更用力地压在你的嘴唇上。还要！你必须更多地品尝她！你疯狂地舔舐着她粉嫩的小穴，舌头如鞭子般狂乱地甩动。与此同时，索菲呻吟着弯下腰，用她厚厚的嘴唇包住你那因前列腺液而跳动的阴茎。她太温暖了，感觉你的鸡巴都要融化在那些毛绒绒的、涂着口红的嘴唇之间了。这个无脑花瓶用舌头在你光滑的龟头上打圈，不断地将地狱般的快感射入你的肉棒。她大声地吸吮着，也开始口交，她的脸颊因为努力想把精液直接从你的" + get_player().cockDescript(_loc1_) + "里吸出来而凹陷下去。[pg]");
            outputText("这个无脑花瓶的嘴就像你个人的天堂。当她继续为你口交时，你能感觉到你的[skin]在发红，你的心脏因为化学物质的涌入而狂跳。索菲用焦糖色的药物闷住你的" + get_player().cockDescript(_loc1_) + "，但你已经沉沦得太深，根本不在乎了。她的嘴感觉太好了，她的小穴尝起来更好，即使你想停下来，你也无法停止舔舐。你的舌头……它就是对那美妙的私处欲罢不能。太棒了……太美味了。你拼尽全力地舔着，你的口腔器官渴望一直埋在那个湿漉漉的盒子里，尽管它已经尽可能深地推了进去。[pg]");
            outputText("索菲伴随着一声淫荡的呻吟，把你的" + get_player().cockDescript(_loc1_) + "吐了出来，完全不顾连接着她和你的胯部的金色唾液丝。[say: 太美味了！我有没有告诉过你，你的鸡巴是，就像，最好吃的东西？它把你的糖霜滴在我的舌头上，简直太棒了。快点给我更多——把它喷满我的嘴唇和舌头！用你的爱覆盖我，宝贝，还有，不要停止舔！]她命令道。[pg]");
            outputText("当她的命令传遍你的全身时，你颤抖着摇晃起来。" + get_player().OMultiCockDesc() + "立刻释放出一团前列腺液，索菲就像一个寻找毒品的瘾君子一样扑了上去。她那带着药物的吸吮再次袭来，让你几乎无法承受，你感觉到你的" + get_player().cockDescript(_loc1_) + "在她的嘴里肿胀，" + get_player().cockHead(_loc1_) + "在她饥渴的舌头上变粗。她在你身上颤抖，释放出另一波糖浆般的液体。你吞下一大口，强迫性地喝下她那惊人的小穴里丰富的淫水。你的背部弓起，你的[legs]紧绷，你在你的无脑花瓶那皱起的、吸吮着的嘴里爆发了，让她的扁桃体洗了一个奶油般的精液浴。精液的细流流过她多汁的嘴唇，因为你射得太快，她根本来不及吞咽。");
            if(get_player().cumQ() >= 500)
            {
               outputText("她尽可能快地大口吞咽，但精液开始从她的鼻子里渗出，从她的嘴角滴落，并从你的" + get_player().cockDescript(_loc1_) + "周围喷涌而出，溅在你的腹股沟上。");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("过了一会儿，吃饱喝足的鹰身女妖退了回来，让你把剩下的精液涂在她的脸上、头发上和高耸的乳房上。");
               }
            }
            outputText("[pg]");
            outputText("索菲发出一声没头脑的咯咯笑，跳了起来，完全不顾她肚子里晃荡的你的体液");
            if(get_pregnancy().get_event() >= 2)
            {
               outputText("以及她那塞满卵的子宫的晃动");
            }
            outputText("。在光线的照射下，一张由鹰身女妖润滑液组成的网在她的腹股沟和你湿透的脸之间拉伸开来。你试图坐起来，把你的舌头放回它该去的地方——她的体内，但她把一只长着爪子的脚踩在你的胸口上，调皮地把你钉在地上。[pg]");
            outputText("金发尤物咯咯娇笑着，[say: 哎呀，你不用再舔我的小穴了，宝贝。你刚才太棒了，让我爽翻了。而且你射给我的时候也超棒的！你先在那儿休息一会儿，我去弄点喝的什么的。我们下次再来！][pg]");
            outputText("索菲俯下身吻了吻你的嘴唇，把更多催情口红抹在你的嘴上。" + get_player().SMultiCockDesc() + "依然坚硬如铁，但用舌头伺候她小穴的冲动正在慢慢消退。尽管你还勃起着，却感到一种莫名的满足，但你知道，只要看一眼你那脑子空空的鹰身女妖情妇，她口红的药效很可能就会让你再次陷入发情狂乱之中。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(1),DynStat.Sens(-1));
            get_sophieScene().luststickApplication(5);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bimboSophieSexMenu() : void
      {
         var _g2:SophieBimbo;
         var _g1:SophieBimbo;
         var _g:SophieBimbo;
         clearOutput();
         outputText("你要怎么和这个脑子里塞满羽毛的荡妇做爱呢？");
         menu();
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(sophieCapacity()) && get_player().get_lust() >= 33)
            {
               addButton(2,"肛交",buttFuckBimboSophie);
            }
            else
            {
               outputText("[pg]<b>你太大了，没法操她的屁股。</b>");
            }
            if(get_pregnancy().get_event() >= 2)
            {
               addButton(5,"乳交",sophiePreggoTitJobs);
            }
            else
            {
               addButton(5,"乳交",fuckBimboSophiesTits);
            }
            if(get_player().hasCockThatFits(sophieCapacity()))
            {
               if(sophieIsInSeason())
               {
                  addButton(0,"受孕",sophieImpregnationSex);
               }
               else
               {
                  _g = this;
                  addButton(0,"温柔地操",function():void
                  {
                     _g.sophieFenCraftedSex();
                  });
               }
               _g1 = this;
               addButton(1,"粗暴地操",function():void
               {
                  _g1.rideDatSophieVag();
               });
            }
            else
            {
               outputText("[pg]<b>你太大了，没法好好操她的小穴。</b>");
            }
            if(get_player().biggestCockArea() > sophieCapacity() && sophieIsInSeason())
            {
               outputText("[pg]你总是可以试着用你最大的那根让她怀孕……");
               addButton(6,"巨根受孕",giantCocksImpregnateSophie);
            }
         }
         if(get_player().hasVagina())
         {
            addButton(3,"被舔",bimboSophieLicksRugs);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,284) > 0 && get_player().get_gender() > 0 && !get_pregnancy().get_isPregnant())
         {
            if(get_player().hasItem(get_consumables().OVIELIX) || get_inventory().hasItemInStorage(get_consumables().OVIELIX))
            {
               addButton(4,"产卵灵药",sophieEggApocalypse);
            }
            else
            {
               outputText("[pg]<b>如果你在物品栏或营地仓库里有产卵灵药，索菲就能用它找点乐子了……</b>");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,781) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,780) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("[pg]你可以让索菲再去拜访伊兹玛。她可能又会被绑起来。");
            addButton(7,"拜访伊兹玛",tellSophieToVisitIzma);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,740) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,743) > 0 && get_player().hasCockThatFits(sophieCapacity()))
         {
            addButton(8,"操女儿",get_sophieFollowerScene().sophieIncestInHerCooterOrSomethingIDunno);
         }
         _g2 = this;
         addButton(14,"离开",function():void
         {
            _g2.approachBimboSophieInCamp();
         });
      }
      
      public function bimboSophieLustStickSurprise() : void
      {
         outputText("[pg]");
         var _loc1_:Number = Utils.rand(4);
         if(_loc1_ == 0)
         {
            sophieSprite();
            outputText("还没等你反应过来，索菲就扑进你的怀里，在你的嘴唇上亲了一下。");
            if(!get_player().hasCock())
            {
               outputText("你笑了笑，暂时把这个热情的无脑花瓶从怀里推开。");
               dynStats(DynStat.Lust(1));
            }
            else
            {
               outputText("你打了个寒颤，[eachcock]变得坚硬，准备好屈服于这个长满羽毛的金发女郎的爱。也许你很快就会处理这件事……");
               dynStats(DynStat.Lust(15));
            }
            get_sophieScene().luststickApplication(5);
         }
         else if(_loc1_ == 1)
         {
            sophieSprite();
            outputText("在闲暇时，你感觉到沉甸甸的乳房挤压着你的背部。索菲抚摸着你的[chest]，轻咬你的耳朵。她问，[say: 宝贝，我们能快点做爱吗？我一个人在这里湿透了，只能抚摸着我的小穴，幻想着你。] 你忍不住转过身对她微笑，但你一转身，她就在你的嘴唇上印下了一个吻。");
            if(!get_player().hasCock())
            {
               outputText("你把她推开，在她的屁股上拍了一下，用口型说：“很快”。");
               dynStats(DynStat.Lust(1));
            }
            else
            {
               outputText("你把她推开，尽量不让[onecock]碰到她。你的嘴唇危险地刺痛着，你知道你至少会有几个小时对鹰身女妖充满欲望。");
               dynStats(DynStat.Lust(15));
            }
            get_sophieScene().luststickApplication(5);
         }
         else if(_loc1_ == 2)
         {
            sophieSprite();
            if(get_player().hasCock())
            {
               outputText("当你站在那里喝水时，一双有力的手拉下了你的[armor]。丰满的嘴唇包裹住" + get_player().oMultiCockDesc() + "，将其闷在柔软温暖的滑腻中。你低头看着你的无脑花瓶鹰身女妖，叹了口气，而[onecock]在她的嘴唇里变得更硬了。她松开嘴问，[say: 想做爱吗？] 你叹了口气，试图抵抗脑海中涌现的自己骑在鹰身女妖身上的画面。也许是时候和她做爱了……");
               dynStats(DynStat.Lust(15));
            }
            else
            {
               dynStats(DynStat.Lust(10));
               outputText("当你站在那里喝水时，一双有力的手拉下了你的[armor]。丰满的嘴唇滑过你的");
               if(get_player().hasVagina())
               {
                  outputText("外阴，吸吮着你的阴蒂包皮。那些金色的、流着口水的舔穴者在你的腹股沟上看起来很不错，你发现自己在她的口交下释放出爱液。也许是时候和她做爱了……");
               }
               else
               {
                  outputText("光滑的腹股沟，最终舔舐着你的[asshole]。那些金色的、流着口水的舔舐者紧贴着你，看起来很不错。也许是时候和她做爱了……");
               }
            }
            get_sophieScene().luststickApplication(5);
         }
         else
         {
            sophieSprite();
            outputText("索菲从岩石上滑翔而下，重重地落在你身上。她给了你一个湿漉漉的响吻，问道，[say: 想我了吗？我超级想你！]");
            if(get_player().hasCock())
            {
               dynStats(DynStat.Lust(15));
               outputText(get_player().SMultiCockDesc() + "似乎在你的[armor]里扭动。该死，她在你身上感觉真好！也许你该快点操这个荡妇了？");
            }
            outputText("你点点头，索菲站起来，绽放出灿烂的笑容，蹦蹦跳跳地离开了，她的屁股在身后诱人地摇摆着。");
            dynStats(DynStat.Lust(2));
            get_sophieScene().luststickApplication(5);
         }
         outputText("[pg]");
      }
      
      public function bimboSophieLicksRugs() : void
      {
         sophieSprite();
         clearOutput();
         outputText("你靠在附近的一块岩石上，张开你的[legs]");
         if(get_player().balls > 0)
         {
            outputText("，把你沉重的阴囊挪开");
         }
         outputText("让索菲能清楚地看到你的[vagina]。索菲那呆滞、有些迷离的眼睛在看到你的小穴时亮了起来，她专注地向前倾身，把一根手指伸进自己体内，问道：[say: 哦，我能，那个，帮你舔舔吗？看起来好好吃哦！][pg]");
         if(get_player().cor < 33)
         {
            outputText("你紧张地点点头，一想到这个无脑荡妇肥厚的嘴唇亲吻和舔舐你的小穴，你就羞得满脸通红。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你点点头，微笑着，一想到这个无脑荡妇肥厚、舔过小穴的嘴唇贴在你的小穴上，你就不禁有些脸红。");
         }
         else
         {
            outputText("你自信地微笑着，把你的[hips]往前挪了挪，期待着这个无脑婊子肥厚、舔过小穴的嘴唇贴在你的小穴上的感觉。");
         }
         outputText("索菲只是看着你，她睁大眼睛，目光从未离开过你肿胀的阴唇。在盯着你看了足足一分钟后，她终于想起来点头意味着“是”，她兴奋地上下蹦跳，拍手欢呼，她的奶子也随之夸张地晃动。她凑近你，鼻子几乎要碰到你");
         if(get_player().wetness() < 3)
         {
            outputText("湿润的");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("湿透的");
         }
         else if(get_player().wetness() < 5)
         {
            outputText("泥泞的");
         }
         else
         {
            outputText("浸透的");
         }
         outputText("阴唇。鹰身女妖停下来，睁大眼睛抬头看着你，然后慢慢伸出舌头。[pg]");
         outputText("下体传来的快感让你浑身颤抖。她的嘴巴温暖而湿润，当她亲吻和舔舐你的外阴时，你似乎无法从这只呆鸟顺从的眼神中移开视线。她每次用舌头试探性地刺入后都会呼气，将热气吹过你敏感的阴阜，增加了你的快感。粉红色的舌头滑入你的通道，将索菲起泡的唾液和你麝香般的淫液混合成一个冒泡的湿润漩涡。在整个过程中，她一直看着你。这个放荡的无脑花瓶甚至在最终将目光转向你的[clit]之前，还对你眨了眨眼。[pg]");
         if(get_player().getClitLength() < 3)
         {
            outputText("丰满圆润的嘴唇包裹住你的阴蒂，剥开“阴蒂包皮”，将阴蒂完全暴露出来。她灵巧的舌头扭动着，在你最敏感的地方打转，卷曲着，用充满激情的舔舐挤压着你。索菲抬头看了你一眼，脸颊向后拉，露出一个幸福的微笑，然后又把注意力集中在你的小穴上。她吸吮的力度恰到好处，让你的[clit]变得更硬、更敏感，像给微型鸡巴口交一样给这个微小的女性器官口交。她的技巧既熟练又充满激情，没过多久，你就开始在这个无脑花瓶的脸上挺动，像个发情的荡妇一样在她的嘴唇上摩擦。[pg]");
         }
         else if(get_player().getClitLength() < 7)
         {
            outputText("丰满圆润的嘴唇在你的阴蒂上蠕动，剥开包皮，露出仍然很小的阴蒂头。她灵巧的舌头向上卷起触碰它，在你的[clit]在她嘴里变粗时缓慢地绕圈。当索菲感觉到粗壮的阴蒂填满她的喉咙时，她的动作加快了，一旦你粗大的女性器官变得像鸡巴一样，她就开始愉悦地哼哼。带着满足的坏笑，她向后滑动，让她那肿胀、闪闪发光的阴唇在极其敏感的女孩鸡巴上滑动，模仿口交的动作。你愉悦地呻吟着，弓起臀部，将你的阴蒂鸡巴尽可能深地插入你那无脑花瓶的用力吸吮的嘴里。她舔舐着下面，让舌头沿着整个肿胀的长度滑动，然后将她的口腔肌肉埋回你的小穴，品尝并舔舐着你滑溜溜的阴户里流出的又一大股淫液。[pg]");
         }
         else
         {
            outputText("丰满圆润的嘴唇在你的阴蒂上蠕动，剥开包皮，露出潜藏的女孩鸡巴。她灵巧的舌头向上卷起触碰它，在它在她嘴里变粗时缓慢地绕圈。当索菲感觉到粗壮的阴蒂填满她的喉咙时，她的动作加快了，一旦你粗大的女性器官变得像鸡巴一样，她就开始愉悦地哼哼。她惊讶地咕噜了一声，向后退去，在你仍在生长、极度男性化的阴蒂周围喘息。肿胀的母狗鸡巴继续膨胀，直到索菲惊慌失措地松开它，让它抹在她的脸颊上。她带着一种安静的难以置信的表情盯着她那涂满润滑液的无脑脸庞。[pg]");
            outputText("[say:它……就像，嗯……很大！天哪，你是个大女孩！嗯，当我在，嗯，吸这根粗大的柱子时，你会为索菲妈妈狠狠地高潮的，对吧？]这个屁股丰满的鸟婊子调戏道。[pg]");
            outputText("当鹰身女妖恢复她的口部攻势时，你浑身发抖，她一口气将你的" + get_player().clitDescript() + "深深地吸进喉咙。她高兴地哼哼着，舔舐着女性肉棒的下半部分，同时试图让她那肥厚柔软的阴唇更靠近你多汁的小穴。你向前摇晃臀部，将你的[clit]更深地插入你那无脑花瓶的喉咙里。她开心地咕噜着，鞭打着你的[vagina]，她的舌头在你的深处留下滚烫的性愉悦的痕迹，她那滚烫的喉咙像没有明天一样榨取着你。[pg]");
         }
         outputText("索菲渴望地发出咕噜声，当你听到除了你的小穴之外还有什么东西发出独特的湿润的吧唧声时，你意识到她正在用力地自慰。你伸长脖子去看鹰身女妖狂乱抽动的双手，看着它们消失在她肿胀、因情欲而发红的阴唇里，就像变魔术一样。索菲");
         if(get_player().getClitLength() < 3)
         {
            outputText("在你的阴蒂上哼哼着，加快了舔舐的速度，而你看着她用手指操着她那泥泞的小穴。");
         }
         else
         {
            outputText("用手在你的阴蒂上抽插，加快了她那鞭打般的舌头的速度，而你看着她用手指操着她那泥泞的小穴。");
         }
         outputText("这一幕将你推向了身体颤抖、肌肉紧绷的高潮边缘。你僵住了，并且");
         if(get_player().wetness() >= 5)
         {
            outputText("喷射出");
         }
         else if(get_player().wetness() >= 4)
         {
            outputText("涌出");
         }
         else if(get_player().wetness() >= 3)
         {
            outputText("漏出");
         }
         else if(get_player().wetness() >= 2)
         {
            outputText("滴下");
         }
         else
         {
            outputText("流出");
         }
         outputText("女性精液喷了索菲一脸，用你的爱标记了这个无脑花瓶。这只发情的鹰身女妖似乎也很享受，因为她正对着你的阴唇淫荡地呻吟着，让液体冒泡并掩盖了她的叫声。[pg]");
         outputText("你们俩都向后倒去，气喘吁吁，有点神志不清。你的整个腹股沟都覆盖着一层金色的涂层，闪烁着鹰身女妖的口红和你自己的女性体液。在某种程度上，这种景象出奇地迷人。你的[vagina]在光线下闪闪发光，而鹰身女妖那过厚的口红渗入你的皮肤，让你的身体充满了旨在刺激男性的药物。");
         if(!get_player().hasCock())
         {
            outputText("幸好你没有阴茎！");
         }
         else
         {
            outputText("你呻吟着，你的腹股沟燃烧着欲望，让你的[cocks]充血。你脑海中充满了你无情地操你那无脑花瓶新娘，让她一次又一次怀孕的画面。你颤抖着脸红了，试图抵抗在你的身体里跳动的人造需求，但你意识到你的身体已经准备好了。");
         }
         outputText("[pg]");
         outputText("这个无脑的金发女郎咯咯地笑着，捏了捏她那丰满的乳头，柔声说道，[say:那绝对美味！你的小穴就像，完全好吃。我们再来一次吧！]在经历了美妙的口交之后，你觉得有点被操干了，于是你拒绝了。[pg]");
         outputText("索菲反驳道，[say:但我现在就想操！]她撅起嘴，伸出下唇说道，[say:来吧……看看我的小穴……看看它。你难道，嗯，看不出你让我有多湿吗？你知道你想舔我……你的舌头完完全全想尝尝我甜蜜的蜜罐！]鹰身女妖把腿张得那么开，几乎要劈叉了，把她的阴唇拉开，向你展示你把那肿胀的粉红色入口弄得有多湿。你不得不承认……它看起来确实很不错。她的话似乎……不知怎么的有些沉重，就像它们背后有额外的分量。你很难在她的逻辑中找到错误——她现在尝起来肯定很好……[pg]");
         outputText("[saystart]求你了？我会让你感觉和上次一样好，也许更好。看着我，看着我的嘴唇，它们会骗你吗？我敢打赌，它们回到你那滚烫湿润的小穴上感觉会非——常好");
         if(get_player().hasCock())
         {
            outputText("，或者又粗又多汁的肉棒");
         }
         outputText("。过来跟我69吧，宝贝！[sayend]索菲欢呼着，扭动着她那丰满的臀部。该死，她的嘴唇真是太丰满性感了，还有那屁股——天哪，她让你湿透了");
         if(get_player().hasCock())
         {
            outputText("并且硬了");
         }
         outputText("又来了！你想把她扑倒在地，把你的胯部砸在她的脸上！操，她是不是在对你使用精神控制？而且还奏效了！[pg]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         get_sophieScene().luststickApplication(4);
         if(get_player().get_inte() * 2 < get_player().cor + get_player().lib)
         {
            outputText("事已至此，你根本无法拒绝她……看看她的嘴唇……它们绝对不会对你撒谎。那感觉一定会很好……");
            doNext(bimboSophieSixtyNineAfterCunnilingus);
         }
         else
         {
            outputText("你要怎么做？");
            menu();
            addButton(0,"69式",bimboSophieSixtyNineAfterCunnilingus);
            setExitButton();
         }
      }
      
      public function bimboSophieAtCamp() : Boolean
      {
         if(bimboSophie())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0;
         }
         return false;
      }
      
      override public function bimboSophie() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,745) == 0;
         }
         return false;
      }
      
      public function beBimboSophiesSugarMommy() : void
      {
         sophieSprite();
         clearOutput();
         if(get_player().hasItem(get_consumables().OVIELIX))
         {
            get_player().consumeItem(get_consumables().OVIELIX);
         }
         else if(get_inventory().hasItemInStorage(get_consumables().OVIELIX))
         {
            get_inventory().consumeItemInStorage(get_consumables().OVIELIX);
         }
         outputText("你咧嘴一笑，调皮地耸了耸肩。你觉得如果她是个好女孩，你可以把它当礼物送给她。索菲精力充沛地点点头，挺起胸膛，伸展双臂和翅膀，徒劳地展示着她银色的羽毛。[say: 别担心，索菲妈妈已经做过一百次了！]她弹开瓶子，将绿色的液体倒入嘴里，当浓稠的液体溅在她的舌头上时，她的表情充满了强烈的喜悦，充满了希望。她扑腾着飞到半空中，几乎无法抬起她巨大的乳房，双臂环绕着你的肩膀，双腿勾住你的腰。她甜美地微笑着，倾身索吻，将她闪闪发光的嘴唇贴在你的嘴唇上，她那掺有催情剂的口红的热量瞬间流遍你的全身。你张开嘴轻轻喘息，她利用这个开口加深了吻。在药物带来的兴奋中，你几乎没有注意到冰凉的灵药流入你的嘴里。你开始后退，但索菲肌肉发达的舌头强行撬开你的嘴唇，她急切地将更多的药水滚过你的牙齿，进入你的喉咙。然后，她自己也大口咽下，高兴地用鼻子蹭了蹭你的鼻子。[say: 现在我们俩都是妈妈了！][pg]");
         outputText("你恼怒地试图把这个无脑花瓶从你身上甩开，但腹部传来的一阵颤抖的抽动夺走了你的愤怒。产卵灵药发生了一些奇怪的事情——其效果的渐进过程似乎被疯狂地加速了。你不确定是因为涂了药的口红还是鹰身女妖唾液的缘故，但索菲的吻显然影响了药水。看来她也遭受了同样的影响，至少：鹰身女妖的肚子随着时间的推移在你的皮肤上膨胀，这个骨瘦如柴的荡妇的腰部在受孕的药水下像气球一样膨胀。你自己的肚子也贴着她的肚子生长，一阵满足感在你的[skin]上荡漾，肿胀的子宫的重量让你的" + get_player().vaginaDescript(0) + "期待地流口水。甚至你的" + get_player().allBreastsDescript() + "也感觉更重了，因为你的身体在几分钟内就被踢入了怀孕的深渊。调皮的鹰身女妖呻吟着，一只手抚摸着她的肚子，同时将她挺拔的乳头磨蹭着你的[nipple]，从你们突出的肚子相互挤压的张力中获得快感，肚子里塞满了卵，像蘑菇一样相互挤压。通过她摸索的接触，你能感觉到你伸展的子宫里的东西在你体内获得了形状和硬度，受孕的突然性剥夺了你的克制。不由自主地，你发出一声淫荡的呻吟，你的身体在你膨胀的生长中紧缩高潮。[pg]");
         outputText("你喘着粗气，跌坐在你的[ass]上，却发现突如其来的冲击引发了分娩！也许是出于同情的反应，索菲的躯干剧烈抽动，颤抖着，因为她的身体开始收缩以挤出卵。[say: 哦，这和我记忆中的一样好，]她在狂喜中尖叫。[say: 看着索菲妈妈，她会教你怎么做！]膨胀的鹰身女妖仰面翻滚，将双腿踢向空中，涂着粉红色的爪子张得大大的，同时稳定着呼吸。随着子宫的重量呻吟着，她将手指深深地抓进地里，紧闭双眼，当她用尽全力推挤时，狂喜的口水从她的嘴角漏出。不甘示弱，你自己的小穴也因发炎的快感而刺痛，你的肌肉因体内的压力而颤抖。你咬住脸颊内侧，试图够到你的[clit]来自慰，却发现你过度充盈的肚子阻挡了你的手臂够到你的小穴。你无助地用手抚摸着你伸展的[skin]，你痉挛的、塞满卵的深处的每一次咕噜颤抖都会点燃微小的高潮，这些高潮像喷涌、蠕动的性释放的洪流一样倾泻过你的身心。直到第一个卵滑出你的身体，你才注意到你已经进入了分娩状态，随着你内壁的每一次痉挛，最小的卵从你的" + get_player().vaginaDescript(0) + "中弹出来。[pg]");
         outputText("卵从你的身体里滚落，又厚又快，两三个一组地从你紧缩的小穴里滚出来，你的肌肉完全出于本能地运作，你只是向后躺着，在无法集中的极乐中发出咕噜声，润滑的女孩精液从你持续不断的高潮中喷涌而出。小卵很容易就清除了你的子宫，但剩下的卵感觉大得多。你揉了揉肚子，透过汗津津的腹部感受着它们的周长。最大的卵发现自己紧贴着你的子宫颈，一阵疼痛像泼了一盆冷水一样穿透了令人窒息的狂喜。你挣扎着，喘着粗气，试图把它推出来，但你叛逆的肌肉拒绝放松，尽可能久地将这个巨大的卵留在你的子宫里。随着你剩下的负担被清空，你实际上可以透过你的[skin]看到那个巨大卵的形状，一个庞大的突起拒绝离开你疼痛的子宫。在绝望中，你尝试了索菲的方法，将体重滚到背上，将膝盖抬高到与肩同高。你咬紧牙关以减缓呼吸，双手握成拳头，将每一寸力量都集中在将卵推过子宫颈上。伴随着痛苦的缓慢，大卵从你的子宫中挤出，进入你的产道，穿过你颤抖的外阴，最后从你的小穴里扑通一声掉出来。一声如释重负的粗重喘息从你的肺部颤抖而出，感觉就像一块巨大的重物从你的胸口移开了。生下这个巨大的椭圆形的纯粹快感足以给你最后一次高潮，你的身体虚弱得甚至无法抬起头。[pg]");
         outputText("没过多久你就醒了，全身都因为刚才的经历而酸痛。索菲在你的大腿之间，用她狭长的舌头舔舐着你的" + get_player().vaginaDescript(0) + "，用她丰满的金色嘴唇吸吮着你的[clit]。你正想把她推开，却意识到她温柔的服侍正在带走你受虐的小穴分娩后挥之不去的疼痛。你小心翼翼地检查了你渗出液体的下体，松了一口气，发现你的身体并没有像你想象的那样被那个毁灭性的卵撑得那么大。[say: 傻女孩，]索菲责备道，[say: 口红对两片嘴唇都有好处！你以为我们怎么还能取悦我们的伴侣？]她指着你们俩产下的一堆堆卵，你倒吸了一口凉气。足足有三打卵，最小的也有苹果那么大。看到你子宫里孕育出的果实如此庞大，你感到有些害怕。[say: 女孩，总有一天你得给我们找些种马！如果卵受精了，那会好得多。]她凑近了，神秘兮兮地说。[say: 它们会变得更大，]她咯咯地笑着。你很想告诉她，带着更大卵的想法去死吧，但玛莱保佑你，你就是无法改变。你摇了摇头，把这个鹰身女妖无脑花瓶撅起的嘴按下去，让她把你的小穴亲得更舒服一点，然后清理干净，清点所有的卵。[pg]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         get_sophieScene().luststickApplication(2);
         get_inventory().takeItem(get_consumables().LARGE_EGGS[Utils.rand(int(get_consumables().LARGE_EGGS.length))],get_camp().returnToCampUseOneHour);
      }
      
      public function beBimboSophiesSugarDaddy() : void
      {
         sophieSprite();
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(sophieCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         if(get_player().hasItem(get_consumables().OVIELIX))
         {
            get_player().consumeItem(get_consumables().OVIELIX);
         }
         else if(get_inventory().hasItemInStorage(get_consumables().OVIELIX))
         {
            get_inventory().consumeItemInStorage(get_consumables().OVIELIX);
         }
         outputText("你对索菲狡黠地笑了笑，从她的爪子里夺过产卵灵药，用指尖划过她锋利的下颌线，同时绕着她缓慢地、若有所思地转圈。这种期待让这个淫荡的鹰身女妖发狂，她胸口起伏，张着嘴，湿润的呼吸喷吐在她涂着厚厚唇彩的金色嘴唇上。你在她身后停下，一只手抓住这个着迷女人的羽毛状头发，猛地把她的头向后拉，她倒吸了一口凉气，然后无法控制地咯咯笑了起来。你拔掉六边形瓶子上精致的玻璃塞，把它举到她等待的嘴巴上方几英尺处，极其缓慢地倾斜药瓶，直到一小滴翠绿色的汁液在灵药的尖端冒出气泡。索菲不耐烦地伸出舌头，在空中扭动着，仿佛她那纯粹的、好色的欲望能把药水拉进她的喉咙。最后，在令人痛苦的等待后，你将这烈性药水倒进她贪婪的嘴里，这个妓女训练有素的本能让她那沾满口水的嘴接住了这翠绿色的液体，一滴也没有漏掉。她让混合物在舌头上滚动，品味着这药水的承诺，然后将闪闪发光的嘴唇闭合成一个满意的亲吻状，心满意足地一口吞下了这股液体。[pg]");
         outputText("在索菲旁边坐下，你忍不住注意到她看起来已经变厚实了。[say: 噢噢噢噢……]她呻吟着，[say: 我能感觉到它们在我的肚子里！可爱的小蛋在妈妈的肚子里生长。]她引导你的手放到她的腹部，你的手指抚摸着她微微隆起的柔软腹部。果然，你能感觉到她的子宫里泛起一阵颤抖，随着卵的急剧生长而膨胀。捧起她滴水的下体，你享受着她小穴散发出的热量，怀孕的承诺让这个头脑简单、渴望性爱的荡妇兴奋得湿漉漉的。你将几根手指滑入她流出淫液的小穴，引得这个扭动的熟女发出一声高亢的欢愉尖叫。她将臀部贴向你，把你沾满蜜汁的手从她的双腿间抽出，再次按在她的肚子上。看来卵还在生长，而且速度非常快！她的肚子已经膨胀成一个明显的凸起，她身体里发出的每一次咕噜声都让她的腰围增加一英寸。[say: 你必须让我受精，]她半闭着眼睛乞求道。[say: 妈妈需要那浓稠的精液射在里面，]她呻吟着，脸颊绯红，双手滑入双腿之间，疯狂地用两个拇指揉搓着她湿透的小穴。[pg]");
         outputText("你很确定产卵灵药的蛋是无法受精的，但这个笨蛋并不知道，而且她颤抖的脸上那种放荡而绝望的神情，足以成为找点乐子的借口。你脱下衣服，双手穿过她的腋下将她拉起，尽管她胸前那对汗津津的巨大乳房在晃动，但这只鹰身女妖的身体却出奇地轻。你躺在地上，将索菲放在你的" + get_player().cockDescript(_loc1_) + "上方。她用脚引导着你抽动的阴茎靠近她粉红色的肉缝，你觉得好笑的是，她竟然把爪子涂成了粉红色，就好像那是脚趾甲一样。当你的龟头滑过她的阴唇时，她发出一声狂喜的叹息，仿佛你扑灭了她体内的欲火。她无法克制自己，猛地坐了下来，将你紧绷的肉棒完全吞没，她那巨大的屁股拍打着你的大腿内侧。她停顿了片刻，品味着充满蛋的子宫和塞满肉棒的阴道带来的奇妙淫靡感，随后你猛地向上一挺，提醒这个没脑子的女人，这根" + get_player().cockDescript(_loc1_) + "可是长在人身上的。");
         if(get_player().balls > 0)
         {
            outputText("蛋-");
         }
         outputText("插在她的体内。她同时使用翅膀和手臂，疯狂地拍打着，将自己抬高几英寸，然后体内不断增长的重量将她拉回地面，让索菲重重地摔在你的肉棒上。她太笨了，无法识别规律，她一直试图飞起来，结果却被困在地上，用她身体里的每一块肌肉在你的阴茎上上下抽插。每次她撞击你时，她那发出吧唧声的肚子似乎都会变大，直到你甚至能看清她鼓起的皮肤下卵的轮廓。[pg]");
         outputText("随着高潮的临近，你对她徒劳的飞行尝试感到厌倦，此时这已经变成了单纯的摩擦——即使是用腿，她也无法将自己从你的阴茎上抬起。你双手抓住鹰身女妖宽阔的臀部，对着她怀孕的重量咕哝着，将这个臃肿的熟女推倒仰面躺下，起身俯身在她身上完成工作。随着节奏的加快，你尽可能用力地操着这个金发无脑花瓶，她的乳房随着每一次猛烈的撞击来回摇晃。她用手臂和翅膀环绕着你的背部，一层令人目眩、发痒的羽毛帘子包裹着你，你失去了注意力，足以让你的高潮沸腾。浓稠、肥沃的精液绳索从你的" + get_player().cockDescript(_loc1_) + "中喷发而出，溅入索菲的深处，乳白色的种子舔舐着她的子宫颈，将这个荡妇的子宫涂抹得像她的羽毛一样白金般苍白。她无言地咕咕叫着，她的肚子在你跳动的精液软管的刺激下翻腾、发出吧唧声。她的腹部已经肿胀到正常腰围的好几倍，怀孕如此严重，看起来她好像要生下三只小牛头人。[pg]");
         outputText("当你拔出时——粘稠的珠光精液丝仍然将你与她颤抖的小穴连接在一起——她的背部在性高潮的极乐中拱起，她的胃在分娩的痉挛中剧烈抽动。索菲漫无目的地自言自语，咬着涂满口红的嘴唇，随着宫缩的加速，将爪子深深地抓进地里。你推开她的膝盖，将手指抵在她肿胀的外阴上，就在一个没有特征的卵表面推过她的阴唇时，这个椭圆形似乎越来越大，直到它终于弹出来，一个像葡萄柚一样大的不规则球体滚入你的手中。紧随其后，更多的卵挣扎着获得自由，索菲在令人惊讶的悦耳的极乐阵痛中尖叫。当一堆变成两堆，然后是三堆时，你意识到她的子宫里一定长了几十个卵，也许她的身体对产卵灵药的反应是倾尽所有。随着小卵的排出，她的肚子终于恢复到更合理的厚度，尽管很明显她还没有结束。索菲尽可能用力地喘着粗气，发出一声巨大的努力呻吟，并将双腿尽可能地张开。缓慢地，伴随着痛苦的狂喜，她推出了一个像西瓜一样大的卵，过度换气，然后收紧全身的每一块肌肉，紧接着第一个卵排出了第二个。她的小穴涌出高潮的蜜汁，第三个巨大的卵弹出来，最后，她似乎空了。如果她没有那么宽的、适合生育的臀部和整个青春期的生育经验，你不确定她是否能排出这些巨大的卵。即使在经历了这一切之后，她的小穴似乎也恢复了正常大小，没有因为那些大得离谱的卵而留下任何持久的不良影响。难怪索菲如此为成为一名妈妈而自豪——这样一窝卵会毁掉一个较弱的女人。[pg]");
         outputText("在余韵中沉浸了片刻，她开始梳理自己，脸上的骄傲比她金色的妆容还要厚。[say: 索菲妈妈太擅长生蛋了，]她吹嘘着，双臂环绕着你的肩膀。[say: 但你也太棒了，[Daddy]，]这位年长的女人评论道，深情地在你的脸上涂满吻。有些鸟是无法改变的。你叹了口气，随着催情剂渗入你的皮肤，[eachcock]再次变硬，变得柔软僵硬。在接下来的一个小时里，你们俩像新婚夫妇一样做爱，只有在你们俩都酸痛疲惫时，才懒得去清点那些没有生命的卵。[pg]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         get_sophieScene().luststickApplication(2);
         get_inventory().takeItem(get_consumables().LARGE_EGGS[Utils.rand(int(get_consumables().LARGE_EGGS.length))],get_camp().returnToCampUseOneHour);
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         sophieSprite();
         outputText("你告诉她回营地去；你有些事情需要对她做，而在这里做不了。而且要反复做。索菲的脸稍微垮了下来。");
         outputText("[pg][say: 哎呀，我在这里玩得正开心呢。算啦！] 她的失望只持续了飞过大门的那一小会儿，之后她就被自己的一根羽毛吸引了注意力。幸运的是，风正吹向你营地的方向。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1081,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function approachBimboSophieInCamp(param1:Boolean = true) : void
      {
         var _g:Camp;
         var _loc2_:Number = NaN;
         sophieSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            if(param1)
            {
               clearOutput();
               if(sophieIsInSeason() && get_player().hasCock())
               {
                  outputText("你一呼唤索菲，这个金发无脑花瓶就小跑着来到你身边，双臂抱在胸前，几乎包不住里面那对巨大而弹跳的乳房。她像往常一样一丝不挂。当她停下脚步时，那扑闪的睫毛娇媚地垂下，巨大臀部前后摇摆，令人目眩神迷。她的尾羽向上向后抽动，朝你扇起一阵充满性爱费洛蒙的微风。当这只鹰身女妖贴上你的手臂时，她那带有桃子般酸甜气味的欲望几乎要冲破你的鼻腔。她紧紧地贴着你，将乳房压在你身上，那突出的乳头硬得几乎要刺痛你的[skinfurscales]。");
                  outputText("[pg]她那粗壮柔软的大腿缠绕着你的[leg]，将湿滑的热度压向你，同时娇嗔道：[say: 我整整一天都在想你，[name]，我就在想，也许索菲妈妈应该得到一点特别的奖励，毕竟我总是对你那么好。]");
                  outputText("[pg]这只丰满的鹰身女妖再次用双腿夹紧你，隔着你的[armor]拍打着[oneCock]，让你清楚地知道她想要什么。她的手指性感地在你的[cockHead biggest]周围画圈。你几乎立刻就开始变硬了。");
                  outputText("[pg][say: 哦，变得<b>这么</b>硬了，不是吗？你为什么不直接把那东西塞进我身体里，一直射到我完全被填满、怀孕为止呢？你的肉棒想要这样，对吧？]她用唱歌般的语调问道，同时继续爱抚着你坚如磐石的肉棒，她的话语似乎搅动了你内心沸腾的欲望之锅。");
                  outputText("[pg]你清楚索菲试图强迫你做她想做的事，但自从她变成无脑花瓶后，她在这方面就不太擅长了。你要操她的小穴吗？她整个阴阜，包括阴唇和所有部位，都沾满了她的爱液，闪烁着一层层金色的催情唇膏。操那地方绝对是天堂般的享受，但这可能会花掉大半天的时间，而且很可能会让她怀孕。你也可以用一块布把它擦掉，然后做点别的事情。");
                  dynStats(DynStat.Lust(20));
               }
               else if(get_pregnancy().get_isPregnant())
               {
                  switch(get_pregnancy().get_event())
                  {
                     case 3:
                        outputText("像往常一样，索菲躺在你的铺盖上。每天，她肚子里孕育着卵的隆起似乎都在变大。这个确实怀孕的女人带着母爱，漫不经心地抚摸着她孕育着卵的肚子。她甚至在爱抚自己身体时，对着不断隆起的肚子轻声细语，显然很喜欢自己又怀上了一颗卵的事实。没过多久，她就看到了你；她那丰满的嘴唇上绽放出一个大大的傻笑，急忙从你的毯子上爬起来，向你蹦蹦跳跳地走来。随着她的每一步，她那丰满的身体都在摇晃和弹跳，她那巨大丰满的胸部在起伏和颤抖，她那成熟圆润的臀部像果冻一样颤动，为你摇摆着她那多产的臀部。");
                        outputText("[pg][say: 你在这儿啊，[name]！快看我！你的卵在我肚子里变得好大好大！看看我有多大、多性感！]这个无脑花瓶女人叽叽喳喳地说着，同时将她曲线优美的身体压向你，确保你能感觉到她那又大又软的乳房和不断隆起的孕肚。从她身体的触感来看，你确信她那原本就丰满的无脑花瓶般的乳房因为怀孕而变得更大了。[say: 谢谢你让我怀孕之类的！]");
                        dynStats(DynStat.Lust(5));
                        break;
                     case 4:
                        outputText("你怀孕的无脑花瓶再次慵懒地躺在你的铺盖上，脸埋在你的枕头里，深吸着你的气味。即使她处于这种——脆弱的……姿势，脸朝下，屁股朝上，你也能清楚地看到她那装满卵的肚子圆鼓鼓地隆起。看着你这只羽毛荡妇如此大腹便便，你确信用不了多久她就会产下那颗撑满子宫的卵。仿佛感觉到了你的目光，索菲开始摇摆她那圆润、欠揍的屁股，她的双腿似乎也张得更开了。当她回头看你时，你的猜测得到了证实；她那丰满的无脑花瓶嘴唇向你飞吻，用充满欲望的眼神看着你。");
                        outputText("[pg]这只多情的鹰身女妖几乎是从你的床上跳了起来，她那丰满的身体随着每一步的跳跃而弹跳着，向你蹦蹦跳跳地走来。尽管她已经身怀六甲，但索菲似乎依然步履轻盈，这位风韵犹存的鹰身女妖已经很好地适应了怀着重卵的状态。趁着你片刻的分心，这个兴奋、快乐的无脑花瓶向你扑来，将你扑倒并开心地拥抱着你。她将她那沉甸甸的孕肚和巨大、挺拔的乳房压向你，说道：[say: 哦！很快就要生了，索菲妈妈要为你生下一颗漂亮的大卵了，宝贝！]她凑上前，在你的脸颊上印下了一个湿漉漉的吻，然后将手滑向她那圆鼓鼓的肚子。[say: 这也会是一颗非常大的卵！别担心，我很擅长生蛋，而且我的小穴会为你保持得紧紧的，宝贝！]");
                        dynStats(DynStat.Lust(5));
                        break;
                     default:
                        outputText("索菲独自坐在你舒适的铺盖上。这只长着羽毛的雌性似乎已经喜欢上了你休息的地方。你那鸟脑子的性奴显然渴望尽可能地靠近你，或者至少是靠近你那父亲般的气味。沉浸在充满欲望的幻想中，她抚摸着肚子上微微隆起的肿块，这是你那充满活力的种子在她孕育卵的子宫里发挥了神奇作用的明显迹象。她的一只手漫不经心地滑入双腿之间，手指轻轻地玩弄着她湿润的小穴，而另一只手则揉着她的肚子。");
                        outputText("[pg]终于注意到你注视着她的身体，索菲抬起头，带着多情的微笑看着你，她那粗壮、多产的大腿张开，向你展示着她那紧致丰满的小穴。这个金发无脑花瓶向你展示着她怀孕的身体，向你展示你男子气概的成果，并诱惑你与她火辣、充满欲望的身体玩耍。");
                        dynStats(DynStat.Lust(3));
                  }
               }
               else
               {
                  _loc2_ = Utils.rand(3);
                  if(_loc2_ == 0)
                  {
                     outputText("索菲扑扇着翅膀，在自己周围扬起一小团灰尘，同时改变姿势，向你展示她那巨大的F罩杯乳房。她一丝不挂，你可以看到她那充满欲望的粘稠、湿透的体液毫无阻碍地顺着她粗壮的大腿流下。这只鹰身女妖转过身，弯下腰向你展示她那摇晃的屁股变得有多大、多圆，那鼓起的臀瓣被金色的羽毛状头发勾勒出来，披在她的臀部上。她问道：[say: 嗯，宝贝，我好饥渴，我们能，比如，做爱或者干点别的吗？]");
                     dynStats(DynStat.Lust(5));
                  }
                  else if(_loc2_ == 1)
                  {
                     outputText("这只鹰身女妖正向后靠着，羽毛在她身后散开。她的双腿叉开，粗壮的大腿微微颤抖。当你走近时，你看到了是什么让她抽搐。她正用两根涂着金色指甲油的长指甲在她丰满的下体嘴唇上划过。指尖在她那丰满、肥胖的小阴蒂周围慵懒地画着圈，偶尔用最轻柔的触碰拂过它。当她拱起脊背，将她那起伏、沉重的肉球举向空中时，女孩的精液流过鹰身女妖曲线优美的屁股，在下面的地上汇成一滩。你发誓，这看起来简直就像她在为你表演！她的乳头丰满而坚挺，几乎和你的拇指一样粗，骄傲地向世界展示着她充满欲望的状态。那巨大的凸起看起来饱满得让人想吸吮，乞求着一双嘴唇含住它们。这个无脑花瓶直起身，撅起嘴唇，用她沾满精液的手向你飞吻。[say: 有什么东西是索菲妈妈可以，比如，触摸或玩弄来让你开心的吗，宝贝？]");
                     dynStats(DynStat.Lust(15));
                  }
                  else
                  {
                     outputText("当你靠近时，索菲弯下腰，将她的大部分身体隐藏在她那巨大乳房下垂的重量后面。那沉甸甸的肉球来回摇摆，被汗水浸透的皮肤以一种美妙的节奏滑动，几乎将她沉重的乳头拖过泥土。你发现自己被眼前的景象迷住了，被这个无脑花瓶催眠般的身体所吸引，而她则为了你的愉悦而摇晃和颤抖。[pg]");
                     outputText("[say: 喜欢这场表演吗？]她伴随着一声轻柔的呼气发出满足的咕噜声。你抬起头，直视着她那毛绒绒的、琥珀色的嘴唇，不由自主地打了个寒颤，下意识地想象着那些");
                     if(get_player().hasCock())
                     {
                        outputText("阴唇肉枕在你的阴茎上吸吮着。");
                     }
                     else if(get_player().hasVagina())
                     {
                        outputText("，那对诱人的肉枕挤压着你的阴户。");
                     }
                     else
                     {
                        outputText("，那对诱人的肉枕将你紧紧锁在怀中。");
                     }
                     if(get_player().cor < 33)
                     {
                        outputText("你发现自己一边点头，一边面红耳赤地欣赏着这个无脑花瓶的身体。");
                     }
                     else if(get_player().cor < 66)
                     {
                        outputText("你发现自己一边点头，一边露出淫荡的笑容，欣赏着这个无脑花瓶的身体。");
                     }
                     else
                     {
                        outputText("你用力地点头，用好色的目光打量着这只鹰身女妖的身体。");
                     }
                     dynStats(DynStat.Lust(10));
                  }
               }
            }
         }
         else if(param1)
         {
            clearOutput();
            sophieSprite();
            outputText("当你呼唤索菲的名字时，她从鸡舍里走出来，扭动着身子向你走来。");
            outputText("[pg][say: 嘿，宝贝！我只是在孵……孵……孵化……坐在一些蛋上。那位好心的狗女士说我天生就是干这个的！] 她自豪地拍了拍自己巨大的臀部。");
         }
         menu();
         addButton(0,"外貌",sophieBimboAppearance);
         if(get_player().get_lust() < 33 && param1)
         {
            outputText("[pg]<b>你现在还不够兴奋，无法享受索菲的“服务”。</b>");
         }
         addButton(1,"性爱",bimboSophieSexMenu).sexButton();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,742) > 0 && param1)
         {
            outputText("[pg]<b>索菲的蛋就放在附近。</b>");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
         {
            addButton(5,"女儿",daughterCheckup);
         }
         if(get_player().hasItem(get_consumables().DEBIMBO))
         {
            addButton(6,"解除花瓶",get_sophieFollowerScene().unbimboSophie);
            if(param1)
            {
               outputText("[pg]<b>你可以用解除花瓶药水来恢复索菲的智力……</b>");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,739) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Sophie")
            {
               if(param1)
               {
                  outputText("[pg]你可以邀请她晚上和你同床共枕。");
               }
               addButton(9,"同睡",moveSophieInRepeat);
            }
            else
            {
               if(param1)
               {
                  outputText("[pg]你现在晚上和索菲同床共枕。你可以把她赶出去。");
               }
               addButton(9,"不抱抱",noSophieSleepWith);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0 && !get_pregnancy().get_isPregnant() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            addButton(10,"农活",sendToFarm);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0)
         {
            addButton(10,"回营地",backToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1102) == 0)
         {
            addButton(11,"收获鸟蛋",harvestEggs);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1102) == 1)
         {
            addButton(11,"更换鸟蛋",changeEggs);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1102) == 1)
         {
            addButton(12,"停止收获",stopHarvest);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) == 0)
         {
            _g = get_camp();
            addButton(14,"离开",function():void
            {
               _g.campSlavesMenu();
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1081) != 0)
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
      }
      
      public function acceptBimboSophie() : void
      {
         sophieSprite();
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,282,1);
         if(get_pregnancy().get_isPregnant())
         {
            get_pregnancy().knockUpForce(get_pregnancy().get_type(),int(get_pregnancy().get_incubation() * 1.75));
         }
         outputText("你点点头，索菲用她强有力的双腿向前跳跃，她的力量并没有因为无脑花瓶转变的影响而减弱。她用熊抱将你扑倒，一遍又一遍地亲吻你的[chest]，因为她的冲力将你们俩都带离了山腰。你们在空中翻滚，在坠落时尖叫着");
         if(get_player().canFly())
         {
            outputText("并且由于手臂将你的翅膀压在背上，你无法展开它们");
         }
         outputText("。[pg]");
         outputText("索菲抬起头，倒吸了一口凉气，[say: 哦不！] 幸好，这个笨蛋还记得自己有翅膀，她展开双翼，将下落减缓为快速而受控的滑翔。你松了一口气，在几千英尺的高空中被她的手脚支撑着。索菲吃吃地笑了起来，[say: 那个，我们该往哪边走，[name]？上面的一切都好奇怪，我也不知道你住在哪里。我们需要找个地方做爱！][pg]");
         outputText("你勉强指引她向你的营地滑翔，你们俩很快就到了。当然，索菲湿润、流着淫水的阴户在途中把你的[armor]和[legs]弄得一团糟，大量的淫液浸透了它们。到了营地后，她已经精疲力尽，欲火焚身，结果降落时非常粗暴。你在泥土里摔了一大跤，但并没有受什么重伤。索菲似乎也同样幸运——她正坐在丰满的屁股上，双腿大张，毫无头绪地抓着自己柔软的金色羽毛。[pg]");
         outputText("几秒钟后，这个无脑花瓶呆滞的眼睛似乎亮起了喜悦的光芒。[say: 哦，这就是你住的地方吗？太棒了！哦，你，那个，睡在那边吗？我可以和你一起睡吗？我们能每天晚上都做爱吗？哦，我，那个，有好多问题！嗯……我刚才问了哪些来着？我忘了！][pg]");
         outputText("你叹了口气，带着这个无脑花瓶四处转转。她似乎对这些安排非常满意，参观结束后，她就跑去补妆了，尽管你看到她全程都在自慰。");
         if(get_rathazul().followerRathazul())
         {
            outputText("之后，她提出要给拉萨祖尔口交。这只老鼠看起来快要心脏病发作了，但在结巴了一会儿后，他还是勉强保持着尊严拒绝了她的提议。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
         {
            outputText("之后，她提出要给伊兹玛口交。伊兹玛看了你一会儿，然后摇了摇头，表示拒绝。尽管她给出了否定的回答，但她的裙子还是明显地鼓了起来。也许她会喜欢有个处于食物链底端的人可以使唤？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0)
         {
            outputText("之后，她提出要舔艾米莉的小穴，如果艾米莉也愿意为她这么做的话。艾米莉");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
            {
               outputText("脸上泛起红晕，用一句简短的“不”拒绝了这个无脑花瓶的请求。");
            }
            else
            {
               outputText("脸涨得通红，朝索菲的方向扭动着臀部。这只淫荡、堕落的老鼠和索菲显然会在你不在的时候互相满足彼此的需求。");
            }
         }
         else if(campCorruptJojo())
         {
            outputText("之后，她提出要给乔乔口交。这只堕落的淫荡老鼠点点头，高兴得浑身僵硬，尽管他一直回头看你。这两个人可能会花很多时间在一起……");
         }
         else if(jojoFollower())
         {
            outputText("之后，她提出要给乔乔口交。这只纯洁的老鼠惊得下巴都掉下来了，但当他回过神来时，他回答道，[say: 绝不。我的身体和我的灵魂一样纯洁！]");
         }
         else if(get_game().isabellaFollowerScene.isabellaFollower())
         {
            outputText("之后，她提出要舔伊莎贝拉的小穴。伊莎贝拉严厉地回答，");
            if(isabellaAccent())
            {
               outputText("[say: Nein! 但你偶尔可以喝我的奶。]");
            }
            else
            {
               outputText("[say: 不！但你偶尔还是可以喝我的奶。]");
            }
            outputText("这位牛娘脸涨得通红。你毫不怀疑，只要舔几下乳头，她就会为这个无脑的鹰身女妖张开她粗壮的大腿。");
         }
         outputText("[pg]");
         outputText("好吧，你知道任何时候你想操这个充满母性的无脑花瓶时，去哪里找她。");
         outputText("[pg]<b>(无脑花瓶索菲已加入奴隶菜单！)</b>");
         get_combat().cleanupAfterCombat();
      }
   }
}

