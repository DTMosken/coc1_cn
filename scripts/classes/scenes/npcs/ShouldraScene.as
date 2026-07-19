package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.SettingsNPC;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.IMap;
   
   public class ShouldraScene extends NPCAwareContent implements TimeAwareInterface
   {
      
      public function ShouldraScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function yankeeEchoPapa() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl());
         clearOutput();
         outputText("你欣然接受了她的提议，她高兴地点了点头。[say:太好了！那么，我们开始吧……][pg]");
         doNext(littlePigLittlePigLetMeIn);
      }
      
      public function timeChangeLarge() : Boolean
      {
         var _loc1_:int = 0;
         if(get_shouldraFollower().followerShouldra() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,516) == 0 && get_game().time.hours == 3)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,516,-1);
            get_shouldraFollower().shouldraDream1();
            return true;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,513) == 0.5 && get_game().time.hours == 6)
         {
            get_game().shouldraFollower.morningShouldraAlert();
            return true;
         }
         if(get_shouldraFollower().followerShouldra() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,517) <= -236 && get_game().time.hours == 3 && get_player().get_gender() > 0)
         {
            get_game().shouldraFollower.nightTimeShouldraRapesThePC();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,365) > 0)
         {
            if(get_player().cockTotal() > 1 || get_player().face.type != 0 || get_player().lowerBody.type != 0 || get_player().tail.type > 0 || get_player().horns.value > 0 || !get_player().isPureEnough(15) || get_player().longestCockLength() > 10 || get_player().get_tallness() < 65 || get_player().get_tallness() > 78 || get_player().hasVagina())
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,365,0);
            }
            else
            {
               _loc1_ = 365;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,365) == 0)
               {
                  paladinModeFollowup();
                  return true;
               }
            }
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,518) >= 1)
         {
            _loc2_ = 518;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(get_shouldraFollower().followerShouldra())
         {
            if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && get_player().hasCock() && Utils.rand(10) == 0)
            {
               if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,520) == 1)
               {
                  get_shouldraFollower().exgartumonAndShouldraFightPartII();
                  _loc1_ = true;
               }
               else if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,520) == 2)
               {
                  get_shouldraFollower().exgartumonAndShouldraFightPartIII();
                  _loc1_ = true;
               }
            }
            _loc2_ = 517;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            if(get_shouldraFollower().shouldersWarnings())
            {
               _loc1_ = true;
            }
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,517) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,517) < 0 && int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,517) % 16) == 0) && !get_player().sleeping)
            {
               get_shouldraFollower().shouldraWakesUpOrPokesPCsForShitsAndGigglesIdunnoHowLongCanIMakeThisFunctionNameQuestionMark();
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,516) > 0 && get_game().time.hours == 3)
            {
               _loc2_ = 516;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            }
         }
         return _loc1_;
      }
      
      public function superCoolPaladinSexStuffDudeGasmJizzMonkies() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl());
         clearOutput();
         outputText("当你英姿飒爽地穿行在城镇的废墟中时，你察觉到了危险，并在半步之间停了下来。你竖起英勇的耳朵，倾听任何不寻常的声音，当你听到一间异端半毁小屋里传来一阵脚步声时，你那充满英雄气概的双眼瞬间睁大。你暗骂自己在这个法外之地竟然放松了警惕，随即准备好你那无比正义的[weapon]并等待着。又一声不敬的声音传来，你绷紧了神经。当一条完全属于人类的腿迈出门道时，你稍微有些猝不及防。一位贞洁的" + (ghostLoli() ? "年轻" : "") + "少女很快站在了你的面前，好奇地打量着你。深吸一口气平复心情后，你询问这样一个纯洁的" + (ghostLoli() ? "小女孩" : "女人") + "怎么会出现在这种地方。面对你那全能的存在，女孩并没有像常理那样被吓倒，反而轻声笑了笑，对你的举动挑起了眉毛。你对这种轻视你虔诚举止的行为愤怒地眯起了眼睛，并要求她道歉。[say: 啊，非常抱歉，]她回答道，不可否认的动听嗓音中只带着一丝幽默，[say: 我没想到会有像你这样……非凡的男人路过这里。你来这里有什么事吗？][pg]");
         outputText("在她说话时，你情不自禁地注意到她的身体看起来是多么纯洁；" + (ghostLoli() ? "她似乎刚到可以生育的年纪，而且" : "") + "她宽松的束腰外衣非常端庄地垂到大腿，保护着她的身躯免受可能潜伏在周围的任何邪恶生物的淫荡目光的侵扰。她的皮质紧身裤虽然贴身，但款式时尚而纯真，你对此并不反感。你告诉她你那清除世界上所有污秽的神圣使命，她点点头，你认为那是出于钦佩。一时冲动之下，你牵起眼前这位" + (ghostLoli() ? "年轻" : "") + "女士的手，将它举到唇边，然后询问她的婚姻状况。她花了一会儿才从如此直白的问题带来的震惊中缓过来，但她很快就恢复了镇定。[say: 我目前还是单身，]她向你保证，脸上开始浮现出一丝假笑。[say: 这是一种极其含蓄的求爱尝试吗？][pg]");
         outputText("你抬起头，凝视着她那还算迷人的脸庞。是吗？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,366,FlagDict_Impl_.arrayReadInt(_loc1_,366) + 1);
         doYesNo(courtCrazyGirlsDotCom,noCourtingYouFag);
      }
      
      public function slimeyPenorsAhoy() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("[say: 等一下，]她吩咐道，你好奇地看着史莱姆开始剧烈翻滚。在你眼前，这团不起眼的物质向上喷涌，重新塑造成了你所熟悉的那个幽灵的摇晃复刻版。那两个代替眼睛的大圆圈甚至闪烁着同样的琥珀色火焰。[say: 体验过被史莱姆幽灵骑乘的感觉吗？]她娇羞地问道，张开双臂向你滑来。你笑着摇了摇头，迎上前去。令你惊讶的是——从她的反应来看，她自己也很惊讶——她的皮肤对你的触碰似乎异常敏感。当你抚摸你能触及的她[say: 身体]的每一个部位时，这团史莱姆几乎要在你探索的手指下退缩。作为回报，你听到了一声满足的咕哝，突然，她双手勾住你的头，把你拉进她充满史莱姆的胸膛。这个迷恋你的幽灵女孩无视了你的挣扎好一会儿，然后才似乎回过神来，把你从令人窒息的困境中释放出来。[say: 抱歉！这史莱姆比我想象的还要狡猾一点……]她解释道，一抹红晕莫名其妙地爬上了她翠绿的脸庞。你坚持说没关系，她感激地点点头。[say: 哦！]她惊呼一声，灵光一闪，[say: 我有个好主意！][pg]");
         outputText("她开始吟唱法术——考虑到她现在的身体，这声音听起来很奇怪——你只能不耐烦地等待她完成咒语。她以一个指向你的手势结束了吟唱，暗示你就是法术的接受者。你苦笑着张开双臂，她高兴地接受了这个邀请。你们俩都没有在调情上浪费时间，都因为太兴奋而顾不上那么多了。幽灵史莱姆女孩开心地跳起来，将自己刺入你的" + get_player().cockDescript(_loc1_) + "。她急切地抽搐着，双腿环绕在你的腰上，将自己固定在你依然站立的身体上");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("，同时将她的小乳房挤压在你自己的" + get_player().allBreastsDescript());
         }
         outputText("上。然而，还没等你细想她这似乎有碍性事的举动，你生殖器传来的一阵感觉就吸引了你的注意力——随着你被史莱姆包裹的阴茎在魔法作用下大幅变宽，幽灵在狂喜中尖叫起来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,356) > 0)
         {
            outputText("你总觉得她以前用过这个特殊的法术。真是一个毫无创意的幽灵。");
         }
         outputText("你不断变粗的阴茎将史莱姆幽灵塞得越来越满，她热情地在你身上扭动着。[say:嗯……摸我，笨蛋！]她在兴奋的喘息中要求道。你很乐意从命，伸手去挠她那翠绿色的乳房。这种刺激让这位迷恋你的异界女子发出咕噜声，你感觉到她那团跳动的黏液紧紧包裹住你肿胀的阴茎。你加倍努力，几乎要穿透她，就像厨师揉捏顽固的面团一样揉捏着黏液。她的双腿放松了对你[hips]的夹紧；你抓住这个破绽，双手立刻滑向她被强行撑开的臀部。[pg]");
         outputText("无视她那几乎不走心的抗议，你将幽灵女孩举到你手臂能达到的最高处，然后直接松开手。就在这时，你阴茎周围的黏液开始震动，将她重新拉回你身上。当她顺着你仍在变粗的阴茎滑下时，一阵疯狂的笑声从幽灵口中传出。你从这项活动中获得的快感几乎和她一样多，而她那几乎可以预见的[say:再来一次！]的请求也迅速得到了回应。当她顺着你的肉棒上升时，史莱姆幽灵像游乐园里兴奋的孩子一样欢呼尖叫，而当她开始下降时，这些异想天开的声音很快就变成了高潮的呻吟。[say:嗯——我……啊……]她咕噜着，她黏滑的内脏开始因期待而翻滚。[pg]");
         outputText("包裹着你异常粗大阴茎的凝胶几乎让你发疯，没过多久，你也感觉到自己快要到极限了。你尽可能地将她压向你的腹股沟，在准备高潮时紧绷起来，注意到她也在做同样的事。黏液开始榨取你的阴茎");
         if(get_player().balls > 0)
         {
            outputText("并挑逗你颤抖的睾丸");
         }
         outputText("以引发你的高潮，效果惊人。很快，大量的精液开始让你的输精管膨胀，你紧紧抓住她黏糊糊的皮肤，里面的史莱姆仍在旋转并挑逗着你。不知怎的，当你的第一股精液喷涌进同样达到高潮的幽灵凝胶中时，你设法保持了平衡。你很快意识到她的法术不仅仅是为了让阴茎变粗，因为你的精液继续涌入她体内，在射精的游行中甚至没有减速。史莱姆幽灵的身体开始向外膨胀，为涌入的液体腾出空间……没过多久，她看起来就圆滚滚的了。她的黏液和你的精液的共同重量让你很难保持直立，迫使你跪了下来。你尽可能轻柔地将抽搐的女孩放到草地上，仍在向她肿胀的身体里泵入精液。在至少两分钟的不间断释放后，你的精液终于减缓成涓涓细流，让你松了一口气。当你拔出时，你叹了口气，一阵头晕目眩袭来。你暗自记下要警告这个过分热情的幽灵，她使用的魔法可能有危险，然后你起身准备离开。[pg]");
         outputText("[say:等一下，]一个奇怪的、闷闷的水声在你身后响起。[say:我还没……完事呢。]你好奇地转过身看着那团史莱姆，当你注意到那些你几乎没有察觉到的变化时，你倒吸了一口凉气。就在你注视的时候，你那被困住的大量精液在幽灵女孩的身体里晃动着，慢慢地融入了黏液中。原本深绿色的史莱姆，因为你的加入而变得浅了许多。肿胀的幽灵女孩抬起头看着你，抚摸着她那被精液撑得鼓鼓的肚子。奇怪的是，当她继续注视着你时，她那黄色的眼睛渐渐变成了黄绿色。[say:过来……操我，]她要求道，声音变得低沉，几乎难以辨认。也许“海绵”比她想象的还要强大。她那像气球一样鼓起的肚子明显地颤抖着，当你的精液开始分散到她身体的其他部位时，你忍不住向前倾了倾身子。她C罩杯的胸部因为新增加的体积而鼓了起来，她的臀部也紧随其后。幽灵黏液原本纤细的腰部和修长的大腿也变得粗壮起来；没过多久，你这位死后的玩伴就从一个骨瘦如柴、毫不起眼的女孩变成了一个曲线玲珑的诱惑者。你倒吸了一口凉气，在你的大脑反应过来要从这个为精液发狂的史莱姆女孩身边逃跑之前，她就把你扑倒在地。她增加的体重把你压得死死的，一根触手从她丰满的果冻肚子里长出来，挑逗着你那半软不硬、依然粗大的阴茎。这根灵活的触手不断地刺激着你；抚摸、画圈、挤压、套弄……没过多久，你又一次完全硬了起来，准备好大干一场。伴随着一声愉悦的尖叫——你注意到，那声尖叫中还带着一丝恐惧——她再次将自己扑向了你。[pg]");
         outputText("即使你试图在做爱时帮助她，此时的幽灵女孩也已经神志不清，根本意识不到。她把你的胳膊和腿压得死死的，拼命地干着她的活，她那超大的屁股");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("拍打着你的尾巴");
         }
         else if(get_player().isGoo())
         {
            outputText("挤压着你的黏液");
         }
         else
         {
            outputText("很快就把你的大腿弄得青一块紫一块");
         }
         outputText("。随着史莱姆幽灵继续骑乘着你，一声野兽般的低吼从她口中传出。尽管如此，你还是开始享受这种待遇，甚至开始随着节奏挺动臀部。");
         if(get_player().balls > 0)
         {
            outputText("这个几乎失去理智的女孩用两根史莱姆触手抚摸你的阴囊作为奖励。突如其来的刺激让你倒吸一口凉气，但很快你就开始享受其中。");
         }
         outputText("高潮很快到来，虽然法术的效果已经开始消退，但长达三十秒的射精让这个变成史莱姆的幽灵女孩变得比以前更大了；她的乳房至少达到了G罩杯，悬挂在她肿胀的肚子上方，她的臀部在身后淫荡地高高翘起，她的臀部和牛一样宽，甚至更宽。你精疲力竭地倒下，以为最糟糕的已经过去了。然而，史莱姆却另有打算。[pg]");
         outputText("随着幽灵黏液女孩的目光转移到你被困住的身体上，她那越来越绿的眼睛里露出疯狂的神色，特别关注着你抽搐、变软的阴茎。虽然你希望这场骑乘能结束，但她近乎歇斯底里的表情向你保证，这不会很快结束。另一个法术开始从她口中念出，让你只能猜测这个法术会做什么。你的阴茎开始发热，很快从“温暖”攀升到“令人不适的滚烫”。违背你的意愿和（大部分）你的愿望，你的阴茎再次勃起，被已经摩擦着它的、对体液疯狂的幽灵黏液所迷惑。她一定是疯了；她现在的身体还能装下多少？当");
         if(get_player().balls > 0)
         {
            outputText("热量蔓延到你的睾丸，迅速用神秘的雄风将它们撑大时，你的疑虑加倍了");
         }
         else
         {
            outputText("你感到前列腺开始有些不适，仿佛这个器官正随着神秘的雄风而膨胀");
         }
         outputText("。她再次跳到你身上，开始对你的生殖器发起猛烈的攻势。然而，抬头看着她的脸，她似乎对预计的产出并不十分满意。虽然并不惊讶，但当她开始施放同样的法术，甚至第三次施放时，你还是感到惊恐万分。");
         if(get_player().balls > 0)
         {
            outputText("你的[legs]被你不断膨胀的精囊强行撑开");
         }
         else
         {
            outputText("你几乎要被生殖器上的压力逼疯了");
         }
         outputText("，但她甚至没有注意到，她被即将被填满的想法兴奋得忘乎所以。[pg]");
         outputText("在你目前过度充盈的状态下，仅仅经过她两分钟的疯狂侍弄，就让你的");
         if(get_player().balls > 0)
         {
            outputText("睾丸翻腾起来");
         }
         else
         {
            outputText("身体准备好释放");
         }
         outputText("。那个迷恋你的幽灵女孩得到的唯一警告就是一声微弱的呻吟，随后闸门就真的打开了。第一波完全扭曲了她的腹部，第二波将黏糊糊的皮肤撑得异常薄。随着所有的压力释放，你的第三次也是最后一次爆发将史莱姆幽灵连同她增加的质量一起从你身上掀飞，重重地落在近十英尺外。你们俩都静静地躺了几分钟，胸口起伏，下体滴着液体。最终，你强迫自己站起来，然后");
         if(get_player().balls > 0)
         {
            outputText("摇摇晃晃地走到那个在地上抽搐、发出微弱叫声的幽灵女孩身边；你现在正在缩小的睾丸阻碍了你的步伐。");
         }
         else
         {
            outputText("一瘸一拐地走到那个在地上抽搐、发出呜咽声的幽灵女孩身边；你现在正在缩小的先列腺阻碍了你的步伐。");
         }
         outputText("就像穿过一大盘果冻一样，你把手伸进那只膨胀的史莱姆的胃里，四处摸索着任何……来世的迹象。一只纤细的手抓住了你的手，你轻松地把幽灵女孩从她的宿主里拉了出来。她绕着你转圈。[say: 太感谢你了，]她高兴地哭着说。[say: 我差点就迷失在里面了！里面有太多的……空虚。][pg]");
         outputText("你微笑着摇了摇头。你纳闷，最后那个史莱姆里还剩下多少她。足够回忆起一个法术……算了吧，你决定不去想了。最终，你们都毫发无损地出来了。幽灵女孩一实体化，就冲向你，给了你一个大大的拥抱。[say: 我现在该回去了，]她承认道。[say: 不能整天待在这里。哦，在我走之前……]她厚颜无耻地解开她的紧身裤，把它们从她的胯部拉开，然后把手伸进她的小穴里。她掏出大量的灵质，然后从她束腰外衣里面的口袋里拿出一个小瓶子，把粘液挤进去。她带着和蔼的笑容，把瓶子递给你，你点头表示感谢。你送她离开，然后开始返回你自己的营地。在重新穿衣服的时候，你忍不住最后粗略地看了一眼那堆史莱姆，它仍然是人形的，现在正在盲目的幸福中摩擦着它增大的尺寸。有意思……[pg]");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,356,FlagDict_Impl_.arrayReadInt(_loc2_,356) + 1);
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function slimeGinaFlation() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         outputText("你站了一会儿，下巴托在手上，思考着让你们俩都快乐的最佳方式。当一个想法浮现在脑海中时，你点点头，跪在变成史莱姆女孩的幽灵女孩旁边，将手指伸入她柔软的身体。肿块因快乐而颤抖，你对这种反应感到有点惊讶。你问她这是否真的感觉很好，她半有形的嘴向上拉成一个假笑。[say: 非常好，]她用她能发出的最诱人的声音说，考虑到她必须使用的奇怪声音。受到鼓励，你充满活力地回到你的工作中，深深地挖入黏糊糊的软泥中。当它在你干练的手下颤抖时，你按摩着这东西。敏感的女孩开始发出唤情的呻吟。你慢慢地将刺激集中到一个可抓握的区域。像一个陶瓷雕塑家一样，你开始揉捏绿色粘液，将这东西塑造成一个圆锥体。[pg]");
         outputText("你继续塑造你的作品，直到最后释放它并站起来仔细检查你的作品。你似乎成功地塑造了一个八英寸长的史莱姆突起。轻轻弹了一下，让幽灵女孩黏糊糊的宿主打了个寒颤，你带着微笑确认了它的坚固性。当你爬上绿色史莱姆，将自己对准你创造的阴茎时，幽灵女孩发出一声低沉的呻吟。虽然你想通过悬停在她临时制作的阴茎上方来稍微戏弄一下女孩，但她显然没有心情进行前戏。颤抖的肿块向上推向你，你立刻被整整八英寸刺穿了。然而，她的史莱姆不会停在那里，粘液恢复到半固体状态……在你的" + get_player().vaginaDescript(0) + "里。当你感觉到软泥紧紧地压在你的通道上时，你咬住了下唇。可塑的糊状物挤过你的子宫颈，迅速填满了你的子宫。她体积的重新分配破坏了你的平衡，你滑倒了。你的[ass]拍打在史莱姆上，就在幽灵女孩的脸正上方；");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你的尾巴被推到一边，为插入让路");
         }
         else if(get_player().isGoo())
         {
            outputText("你黏糊糊的身体挤进绿色的史莱姆中，就像两团果冻在互相碰撞");
         }
         else
         {
            outputText("你往下沉时，双腿被迫劈叉");
         }
         outputText("。虽然感觉很棒，但你还是让幽灵女孩慢一点。她的回应是强行将更多的黏液塞进你的小穴，你的肚子微微鼓起以容纳这些黏液。你惊讶地叫了一声，双手按在翠绿色的表面上，试图安抚这个幽灵。她的反应却截然相反，加快了粗暴的动作。一根史莱姆触手伸上来，戏弄地在你的菊穴周围打转，并且");
         if(get_player().cor < 50)
         {
            outputText("你求她在事情失控之前停下来。");
         }
         else
         {
            outputText("你感觉到肉穴受到持续不断的刺激，这削弱了你的决心，直到你几乎开始鼓励她。");
         }
         outputText("[pg]");
         outputText("幽灵女孩发出一声担忧的呻吟。[say:不是我……这东西，它……饿了，]她的声音越来越绝望。[say:对不起！]话音刚落，那突起物就刺入了你的[asshole]，急切地在你的结肠里蠕动。虽然没有你想象的那么痛，但这种插入还是让你咬紧牙关倒吸了一口凉气。在你阻止它之前，绿色史莱姆又射出一条缠绕的触手，直奔你的[face]而来。这东西涌入你的嘴里，撑起你的脸颊，强行要求进入。你紧紧闭上嘴巴，知道必须控制住局面，但微小的触手直接从主触手上断开，开始寻找其他进入的途径。其中两条滑过你的鼻子，当它们蠕动着进入你口腔后部时，你睁大了眼睛。这怪物般的黏液因胜利而抖动，尽管里面那张幽灵般的脸庞担忧地皱起了眉头。一旦进入，黏液就涌向你的下巴，强行把它撑开，刚好足以打开闸门。这东西像一条翡翠河一样流进你的喉咙。你猛地把头向后仰，试图摆脱这东西，但它只是跟着你，把你推得更往后。面对这种怪诞的三重插入，你唯一能发出的抗议就是一声沉闷的哭喊。你唯一的安慰是你不知怎么还能呼吸，你觉得你的幽灵朋友肯定在其中发挥了作用。[pg]");
         outputText("你听到，仿佛从很远的地方传来，幽灵女孩在施放另一个法术时急促的吟唱声。甚至不让你去想她在这个状态下到底会对你做什么，黏液就从三个洞里涌入你体内更深处。当史莱姆滑下你的喉咙，穿过你的肠道，抵住你的子宫时，你的肚子淫秽地胀大。[say:这可能会有帮助，]幽灵女孩喘息着，完成了她的法术。[say:求求你，快点……这东西在得逞之前是不会停下来的，而我……哦……我感觉自己……快要失去意识了……]虽然你想听从女孩的警告，但面对这凝胶状怪物的猛攻，你无能为力。你感到肚子里一阵刺痛，因为它被拉伸到了极限，你想知道这会不会是你的末日。突然，疼痛消失了，你低头瞥见法术的力量。你伸手捏了捏肉，当你发现它很容易被捏扁时，你倒吸了一口凉气……尽管前一刻它还那么紧绷。幽灵女孩因魔法的成功而发出了一声扭曲、如释重负的叹息。当然，绿色史莱姆现在唯一能想到的就是它能塞进你体内的黏液量。攻击的强度翻倍，然后是三倍，史莱姆不顾一切地涌入你的身体。");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("随着你身下的史莱姆缩小，你的身体被推来推去。");
         }
         else
         {
            outputText("随着你身下的史莱姆缩小，你的身体被推来推去，你那充满黏液的肚子把你的" + get_player().allBreastsDescript() + "推到了你不堪重负的下巴上。");
         }
         outputText("[pg]");
         outputText("你那鼓胀的肚子随着黏液的晃动而颤抖，像是一个刚被牛头人颜射过的地精一样膨胀起来。在痛苦的快感层层掩盖下，有一丝微弱的念头在不断呼唤你。这绿色的史莱姆喜欢你按摩它；按摩它，你就能离开这里。在这种情况下，这已经是你能得到的最合理的推断了。你伸出手，用手指环绕住那根粗大的口部触手。你把它当成一根巨大的阴茎，尽可能地抚摸、挤压和揉搓你能触及到的、大部分已经凝固的黏液。受到刺激的绿色史莱姆作为回报，从根部开始隆起一个巨大的凸起，并向你移动。那个几乎被淹没的幽灵女孩尖叫着发出警告，当你考虑到那东西时，你几乎要惊慌失措了。当然，你看不见它们，但填满你下半身缝隙的附肢也开始形成类似的凸起，并且它们也开始向你移动。你只能惊恐地等待着，口部触手上的肿块挤过你现在僵住的手指，用它的厚度将它们撑开。这是一场可怕的比赛，看谁能先把你撑开，无论结果如何，你都有一种感觉，你不会喜欢这个奖品的。你阴道里的触手赢了，随着你的阴道为了适应而扩张，你的哀号无人理睬。[pg]");
         outputText("满足于获得第二名，当球状物涌入时，你的肛门也被撑开了。片刻之后，甚至在你还没来得及从前两次的冲击中恢复过来，你的下巴就被迫张得更大，为这个球状的沉积物腾出空间。随着喉咙的扩张，你不满地哼哼着，就像一只呱呱叫的青蛙。你原本就巨大的肚子因为这些新加入的东西而变得更加膨胀，直到它至少有");
         if(get_player().hasStatusEffect(StatusEffects.MeetWanderer))
         {
            outputText("马库斯的两个睾丸加起来的两倍大！");
         }
         else
         {
            outputText("一辆手推车那么大！");
         }
         outputText("[pg]");
         outputText("此时的史莱姆已经太小，无法支撑你，你的[ass]接触到了柔软的草地。最后，绿色的史莱姆分裂成了三个独立的部分。底部的两个滑入你的孔洞，当它们安顿下来，离开你可怜的被撑开的洞口时，你松了一口气，但连接你嘴巴的那个还有最后一个惊喜。那个幽灵女孩，在她所处的无脑躯壳中疯狂地挣扎着想要保持自我，向你蠕动过来。她那几乎看不见的脸上锁定着一种坚定却又充满欲望的痛苦表情。[say:做点什么！]她恳求道，就在最后一点黏液消失在你嘴里的几秒钟前。[pg]");
         outputText("你像只倒霉的乌龟一样四脚朝天被困在地上，仍在不断膨胀的肚子的重量压迫着你。你肠胃里的黏液不耐烦地晃荡着，在皮肤下翻滚，就像五只愤怒的牛头人。你脑海中闪过一个念头，虽然有点疯狂，但你觉得不妨利用现有的条件试试。你尽可能地顺着肚子向一侧倾斜，然后用尽全力向另一侧猛地一翻。这股冲力带着你翻滚过来，直到你趴在自己软绵绵的肚子上。你的体重挤压着你肿胀的身体，你能感觉到黏液似乎要从它们进入的那些大张的孔洞里喷涌而出。你体内的物质因为压力而欢快地颤动着，你松了一口气，终于有了些进展。你拼命地揉捏按压着紧绷的皮肤，用你的");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("[if (isNaga) {蛇|鱼}]一般的下半身");
         }
         else if(get_player().isGoo())
         {
            outputText("起伏不定的黏稠身躯");
         }
         else if(get_player().tail.type == 0)
         {
            outputText("手臂和[legs]");
         }
         else
         {
            outputText("手臂、[legs]和尾巴");
         }
         outputText("，享受着体内幽灵女孩隐约传来的哭喊与呻吟。吞下的绿色史莱姆开始翻滚，起初还很轻柔，但随后越来越剧烈。随着肉体的震颤不断加剧，你甚至从摇摇欲坠的栖身处被震落，重重地侧摔在地上。震动戛然而止，就像它开始时一样突然，但你继续揉搓着，感觉最糟糕的时刻还没有过去。[pg]");
         outputText("确实，你的服侍正是这只绿色史莱姆（以及被它拖着、越来越不知所措的幽灵女孩）达到“高潮”所需要的。当你可怜的肚子胀得更大时，你只能发出一声压抑的惊呼。然而，这种新的填充物感觉……有些不同。更软了。你戳了戳自己的肚子——这并不难，因为此时你的肉几乎要溢出你的手臂了——并确定了一个相当明显的事实；史莱姆刚刚射了。你又躺了一会儿，然后开始想你到底要怎么把这些黏液弄出来。仿佛看穿了你的心思，那团凝胶脉动了一下，然后开始消退。当这些东西缩进你的身体时，你的肚子终于感到了舒适，你只能猜测这些东西会从哪个洞里出来。胸口突然传来的一阵不适让你有了个大概的猜测，你低头看向");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("看到你的[nipple]在不规律地扭动。");
         }
         else
         {
            outputText("看到你的" + get_player().allBreastsDescript() + "在颤抖，[nipple]在急切地抽动。");
         }
         outputText("当你的胸部向前隆起，充满了刚才塞满肚子的同一种史莱姆时，你惊愕得张大了嘴巴。[pg]");
         outputText("你几乎没注意到自己又躺平了；那种黏液不知怎么地泵入你乳房的感觉，几乎要将你淹没。你乳房的生长与你肚子的缩小成正比；就好像黏液实际上只是在交换位置。你忍不住想要挤压其中一个正在膨胀的乳房，而这种挤压只会刺激黏液，导致它移动得更快。为了以最有效的方式将黏液排出体外，你开始在膨胀的乳房上大做文章。你把它们挤在一起，揉搓它们，用拇指划过你正在变长的乳头……任何能加速这个过程的事情你都做。没过多久，就有足够的黏液流入你的乳房，使它们比原来至少大了三个罩杯，而且");
         if(!get_player().hasFuckableNipples())
         {
            outputText("你的乳头不断生长，直到你可以用手握住它们……你立刻就这么做了。像抚摸一对青筋暴起的阴茎一样抚摸着乳头，你的手臂被迫弯曲，以适应不断增加的柔软乳肉。你感觉到一股温暖的刺痛感从你的胸骨开始，一直蔓延到你肿胀的乳房，你加快了自我刺激的速度。");
         }
         else
         {
            outputText("你那跳动的乳头穴张得更开了。它们几乎在乞求爱抚，所以你照做了；你把一根手指滑入乳头，然后是两根，然后是四根，然后是拇指。你轻松地将手滑过开口，毫不犹豫地将手伸进湿透的乳头穴中。随着你的乳肉继续生长，润滑的通道在你周围闭合。尽管如此，你也不敢放慢刺激的速度，因为你知道越早把这个生物从你体内弄出来，就越容易把幽灵女孩从里面解救出来。最后，在大约一分钟的扭动、推挤和拉扯之后，你感觉到一种刺痛感从你的胸骨开始。温暖的刺痛感穿过你的乳房，直到到达你的乳头。伴随着巨大的吸吮声，你从饥渴的乳头穴中抽出手臂，开始挑逗乳晕。");
         }
         outputText("一种淡绿色的水分开始从你乳头的毛孔中渗出，再抚摸几下，你就达到了乳房的高潮。你仰起头，张开嘴，发出一声无法用言语表达的高潮快感的呻吟，黏液混合着你的乳汁，以令人陶醉的喷射状从你体内爆发出来。[pg]");
         outputText("这种黏稠的排泄持续了许多漫长而充满快感的心跳，随着黏液从你体内喷出，你的乳房也随之干瘪。最终，喷射变成了毛毛雨，你挤压恢复正常的乳房，将剩余的黏液排出。你把手伸进稀释的鼠尾草色物质中，摸索着可怜的幽灵女孩的任何生命迹象。你感觉到一只纤细的手缠绕在你的手腕上，你轻松地将幽灵从抽搐的黏液中拉了出来。摆脱了绿色黏液大部分空虚的影响，她异想天开地在你周围飘浮。[say:你花了这么长时间！]她生气地责备你。[say:……但是，你成功地把我从那里弄了出来，而且我的理智完好无损……而且我确实玩得很开心，所以……]她在你面前实体化，笑容灿烂。[say:谢谢，]她和蔼地说。[say:我要回家了。哦，在我走之前……]她厚颜无耻地解开紧身裤，把它们从胯部拉开，把手伸进她的阴道。她抽出大量的灵质，然后从束腰外衣里面的口袋里拿出一个小瓶子，把黏液挤进去。她带着和蔼的笑容，把瓶子递给你，你点头表示感谢。你们在那里分道扬镳，你穿好衣服，回到你的营地，而幽灵女孩则开始跋涉回到城镇废墟。");
         get_player().orgasm("Vaginal");
         get_player().orgasm("Anal");
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,509,FlagDict_Impl_.arrayReadInt(_loc1_,509) + 1);
      }
      
      public function slimeGhostGalForHerms(param1:Boolean = false) : void
      {
         if(param1)
         {
            clearOutput();
         }
         outputText("当你赤身裸体地跑向翠绿色的粘液时，担忧冲刷着你的性欲，你停了下来。你脸上形成的沉思表情引起了你幽灵朋友的注意。[say: 我完全知道你在琢磨什么，但别担心，]她带着居高临下的轻笑向你保证。这个闹鬼的粘液团慢慢向你靠近，从它无定形的形态无缝过渡到幽灵大步流星的完美再现。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) == 0)
         {
            outputText("[say: 我已经把这件事完全弄清楚了。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) == 1)
         {
            outputText("[say: 我已经把这件事完全弄清楚了。这次是真的。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) == 2)
         {
            outputText("[say: 我已经把这件事完全弄清楚了。这次是真的。我保证。]");
         }
         else
         {
            outputText("[say: 嘛……别【太】担心了。]");
         }
         outputText("[pg]在你们之前几次黏糊糊的交欢中，她的自信从来都不是问题。她的言语中似乎没有哪怕一丝一毫的扭曲。她的形态看起来确实比你记忆中她能做到的要令人印象深刻得多。这团被附身的软泥比你见过的任何粘液女孩都要坚实。它甚至在幽灵女孩原本长雀斑的地方有轻微的酒窝。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) <= 2)
         {
            outputText("也许她真的牢牢掌握了这头野兽的缰绳。");
         }
         else
         {
            outputText("无论如何，这种逢场作戏你已经经历过够多次了，你知道无论如何肯定会出岔子。");
         }
         outputText("[pg]一只湿润的手搭在你的肩膀上，打消了你的疑虑。一个调皮的笑容融化了你的担忧。一只相当大的手掌捂住你的胯部，增强了你的热情。[say: 你带我来湖边，总不只是为了在水里嬉戏吧？]这些毫不掩饰的暗示突破了你最后的防线，迫使你投降。幽灵女孩接受了你未言明的和平条约，开始用她那令人费解的巫术语言说话。尽管你一个音节也听不懂，但其中却夹杂着一丝熟悉感。你那仍被捂着的胯部传来的刺痛感证实了你的怀疑。你的[cock]已经明显变宽了。你试图用一个居高临下的假笑来回应，但这个本应缺乏创造力的幽灵还没完。[say: 我必须重新熟悉一下我最喜欢的一些作品，]她一边说着，一边将她那无定形的肢体从你的腹股沟挥向她自己的。[say: 不然我怎么能完善这套装备呢？]");
         outputText("[pg]这团粘液重新变成了她那原本平淡无奇的手——除了那翠绿的色调——在她的腹部展现出了一个你男子气概的完美复制品。");
         if(get_player().cocks[0].cockLength > 24)
         {
            outputText("然而……它的尺寸并不完全符合你那巨大的规模。");
         }
         outputText("除了闪闪发光的绿色皮肤，她的[cock]与你的每一个细节都相匹配，甚至连紧贴在它上方的[vagina]也一样……等等。你对这颠倒的生殖器感到困惑，而她则用一种淫荡的琥珀色目光回应了你。[say: 发挥你的想象力，]幽灵坚持道，同时拉着你们俩跪了下来。");
         outputText("[pg]这只闹鬼的史莱姆分开你的双腿，靠近你并拥抱你。你对她丝滑的触感同样感到惊讶；它仍然有些湿润，还有点凉，但她几乎和这里大多数非粘液相关的物种一样不透水。不，真正让你惊讶的是，当她的肉棒刺穿你的爱之通道时。出于直觉的预见，你的小探险家也进入了你爱人的通道，完成了你们两人之间的欲望循环。幽灵般的粘液女孩将她的[cock]狠狠地插入你体内，如果不是你现在的坐姿，她的主动出击几乎要把你撞倒。满意的呻吟从她嘴里滑出，她放慢了速度，对你放松了些，她潮湿的身体紧贴着你，仿佛要把你举在秋千上。你很快就明白了，当你靠向她的[vagina]时，你把你的伴侣推了回去。由于你的肉棒比对手的“地势更高”，在这场决斗中，杠杆作用很容易站在你这边。");
         outputText("[pg]这场跷跷板式的性爱战争继续激烈进行，你们每个人都将自己增强了粗度的武器越来越深地刺入对方的");
         if(get_player().looseness() == 0)
         {
            outputText("紧致");
         }
         else if(get_player().looseness() == 1)
         {
            outputText("宽容");
         }
         else if(get_player().looseness() == 2)
         {
            outputText("松弛");
         }
         else if(get_player().looseness() == 3)
         {
            outputText("大张");
         }
         else
         {
            outputText("空洞");
         }
         outputText("，天鹅绒般的剑鞘中。双手太忙于抓住彼此的臀部，");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("你和这只幽灵史莱姆都把乳房紧贴在一起，你们摇摆的冲刺只会加剧乳房的融化。");
         }
         else
         {
            outputText("这只幽灵史莱姆将她的乳房狠狠地压在你平坦的胸膛上，你的旋转让它们兴奋不已。");
         }
         outputText("激烈的战斗节奏加快；你们过去用来试图在心理上击败对方的狡猾的斜视，正在让位于轻微的甩头和咬紧牙关的喘息。");
         outputText("[pg]终于，你取得了胜利。当这个黏糊糊的幽灵将她自己（好吧，就是她自己）注满你的深处时，她紧紧抓住你的肉体；她在神圣的满足中向着天空嚎叫。此时你的性欲几乎没有机会，成为了连锁反应的牺牲品，你的[if (cumHigh) {潮水|[if (cumMedium) {水坝|[if (cumNormal) {细流}]}]}]喷涌而出，进入了这个黏糊糊的女孩体内。从性高潮中平静下来，当你看到你的子孙在深绿色凝胶中旋转时，你感到了一丝乐趣。你还注意到，你对手的形态已经不像刚才那样令人印象深刻地坚硬了。她也瘫倒了，头埋在你的[chest]里，同时温顺地在你的胯部抽插。这种性情的突然变化重新唤醒了你之前思考过的迫在眉睫的恐惧，让你把手放在了她颤抖的肩膀上。");
         outputText("[pg]就在你的[skinfurscales]接触到它的那一刻，那只黏糊糊的幽灵的目光猛地向上，与你四目相对。她的眼睛睁得大得不似人类……那是你所见过的最深邃、最冰冷的黑色。当你猛地站起身时，你的眼睛也睁得几乎一样大，一声压低的咒骂几乎伴随着你喘不过气来的倒吸冷气声。你紧张地转向湖边去拿你的装备……却没有注意到一根粗壮的黏液索直接连进了你的[vagina]。随着你的小穴被堵住，那疯狂的幽灵黏液轻易地从你身后拉扯你的腹股沟，破坏了你的平衡，导致你的下巴重重地砸在地上。你慢慢地设法翻过身来，刚好看到那笨重的黏液已经到了你的脚边。");
         outputText("[pg]你还未从刚才的性爱中缓过神来，气喘吁吁，而那幽灵黏液跪下来打量着你的一系列生殖器官，你几乎别无选择。幽灵女孩曾经引以为傲的原始形态现在几乎消失殆尽——只剩下她脸部模糊的轮廓。你那令人印象深刻的武器也退化成了废品，逐渐消失在湿漉漉的黏液中。看来你的担心是对的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) > 0)
         {
            outputText("又一次。");
         }
         outputText("[pg]然而，令你大吃一惊的是，这团泥沼并没有在你的下半身狂欢。实际上，看起来她……它在研究它们？她还在用极低的音调自言自语。听起来她只是在不断重复[say: 冷]和[say: 饿]。[if (hasBalls) {当这团粘稠的黏液按摩你的睾丸时，你畏缩了一下，它的目光完全集中在它们上面。|当这团粘稠的黏液漫不经心地戳弄你的腹股沟，专注于你的阴茎和阴囊之间的缝隙时，你未能成功地忍住倒吸一口冷气。}]你这位超自然的朋友显然又一次屈服于她那没有大脑的宿主了……但这一次，她那好色的疯狂似乎有了一定的条理。随着这生物的喃喃自语声越来越大，变成了某种吟唱而不是……你变得越来越焦虑。");
         outputText("[pg]……这该死的东西又在施展法术了！幽灵女孩的声音极度扭曲；咒语的吟唱速度慢得像蜗牛一样，每一个音节都痛苦地从这东西的喉咙里渗出来。就你所知，她可能正在从地狱召唤一个恶魔，但这黏液对你[balls]的按摩让你觉得并非如此。咒语的最后一段在空气中回荡，在你的腹部深处召唤出一阵强烈的隆隆声[if (hasBalls) {一种熟悉的感觉流遍你的全身。你腹股沟周围紧绷的肌肉放松下来。感觉就像你皮肤的边界已经……哦，不。|有什么东西开始从你的[cock]下面强行挤出来。你想在痛苦中扭动，但在黏糊糊的侵略者的强力束缚下，这只是一个转瞬即逝的幻想。肉质的生长物从你体内爆发出来，轻轻地刷过你的[clit]，你可能看不到它们，但很明显，在你的骄傲和喜悦之间长出了一对睾丸。然而，刺激的旅程并没有就此结束；刺痛的感觉流遍你的皮肤，你紧绷的肌肉慢慢放松。你觉得你好像可以伸展——哦，该死。}]");
         outputText("[pg]那种熟悉的感觉与之前你的每一个孔洞都被幽灵黏液填满的场合惊人地相似。一个可怕的念头在你脑海中浮现：难道……难道你的黏液参与者在你每一次的幽灵冒险中都是同一个选手？这个疯狂的幽灵女孩这次似乎确实有一个目标，而她挣扎的迹象还没有出现。随着一声刺耳的尖叫，你那令人不寒而栗的发现冲向了未知的领域；那可怕的黏液突然将强度调到了十一，将自己泵入你腰部以下能找到的每一个洞里。她准备好的戏法意味着你的身体不幸地能够承受这个滑溜溜的幽灵所能施加的任何折磨。");
         outputText("[pg]而她确实兴致勃勃地施加了折磨；你柔软的外表并没有让这如潮水般的折磨减轻分毫。草地被你的汗水弄得湿滑，你的身体随着每一次有力的抽插顺着你的阴茎、贴着你的屁股、径直穿过你的小穴滑动。你的子宫看起来正在膨胀，但这股黏液洪流似乎只是把它当作通往你身体其他地方的休息站。透过翡翠般的果冻，你隐约看到一个新形态从你起伏的肚子后面升起：[if (hasBalls) {你不断膨胀的[balls]。|你新获得的精液工厂。}]难怪幽灵女孩一直在抱怨又冷又饿！如果这确实是你一直以来都在操的那团黏液，你已经让它体验了生活中基本必需品的变态版本。多亏了你恶作剧幽灵般的恶作剧，这只被食尸鬼强化的生物得以在变态的庇护所中打滚，并享受着适合玛瑞斯最伟大娼妇女王的盛宴。幽灵女孩和黏液的性渴望混合在一起，在这对危险的组合中暴露出了新水平的堕落：一种意图。");
         outputText("[pg]然而，这些启示是你日程表上的最后一件事。翻滚的精囊[if (isGoo) {轻易地压垮了你黏糊糊的下半身，将它压在草地上。}][if (tailLeg) {从你[if (isNaga) {蛇形的}]裂口中涌出，它的重量开始压住你的下半身。}][if (isBiped) {已经包围了你的腿，用它惊人密集的质量将它们压住。}][if (isTaur) {只是变得越来越大，随着它体积和密度的增加，越来越牢固地锚定你的身体。}]这团超凡脱俗的黏液最后一次毫无灵魂地盯着你，然后它的脸分裂成几个部分，每一个都退回你的身体里。现在，既然对你性器官的不自然灾难已经结束，你终于可以得到一些急需的喘息了。入侵者剩下的部分似乎已经完成了在你富有弹性的下体深处安营扎寨。你的精囊似乎仍在缓慢膨胀——这个贪吃鬼显然在里面捣乱，玩得很开心——但已经不像以前那么严重了。");
         outputText("[pg]急于摆脱这个负担，你试图从地上爬起来。但就像你之前的遭遇一样，即使是对你闹鬼区域最轻微的擦伤，也会让它高兴地扭动起来。你对抗这个摇晃的庞然大物所能做到的，仅仅是在原地打转和跌跌撞撞地回到地上。也许你可以像以前一样把它哄出来？你的任务很明确，你慢慢地试图坐起来，把手牢牢地放在你的蛋蛋上。闹鬼的阴囊猛烈地向你反扑，冲击力迫使你和你失败的抓取回到地上，因为仅仅是这个动作的感觉就让你的脊背发凉。你仍然宽大的[cock]进入全面警戒状态，喷射出一股带有翡翠色调的先列腺液。然后，你被诅咒的钱袋向前涌动，粗心地拖着你在它后面，一个蛋蛋在另一个前面[if (balls > 2) {其余的也齐声跟进。}]，向湖边爬去！");
         outputText("[pg]现在事情已经完全失控了。你无意让这堆被附身的东西把你拖向毁灭！你叛逆的蛋蛋的力量轻易地粉碎了你试图抓住地面的任何微弱尝试。你只剩下一个选择：用你所知道的最好方式清空你的存货。抓住你湿润的[cock]，你开始尽可能好地撸它。你那拉扯的折磨者让你很难保持抓握，更不用说支撑你的背部了。但你的男子气概仍然被其丰富的周长所诅咒，迫使你必须双手进行这项工作。当你达到相当可观的爆发，将带有绿色调的精液射向高空时，你的囊袋高兴地颤抖着。但这几乎不足以让如此肿胀的蛋蛋爆裂。");
         outputText("[pg]这些事件终于赶上了你，随着你的手臂疲惫不堪，你对阴茎的抓握开始动摇。你深沉的呼吸被一声喘息打断；水正在拍打你爬行的精囊。这场荒谬的闹剧已经持续够久了！当你用双手牢牢地重新握住你的[cock]时，你感到新的活力涌遍全身。重写现存的每一个“手淫大师”的笑话，熟练、有力的抽动支配着你的阴茎，你紧咬牙关，深呼吸在你的嘴里进进出出。你的下半身在颤抖，这是即将在地平线上爆发的不祥之兆。甚至连黏糊糊的偷渡者强大的攀爬也让步了，你不断增加的紧张感压倒了它，让它陷入了恐惧的痉挛。");
         outputText("[pg]方圆几英里的生物一定都听到了那充满空气的可怕喊叫声，那是在");
         if(get_game().time.hours < 11)
         {
            outputText("早上");
         }
         else if(get_game().time.hours < 17)
         {
            outputText("下午");
         }
         else
         {
            outputText("晚上");
         }
         outputText("。然而，这种声音对你来说无关紧要；你太忙于让它下雨了。你的背拱得尽可能高——甚至可能比那更高。随着每一次不自然地巨大的精液涌动，你被附身的[if (hasBalls) {[balls]|蛋蛋}]移动、洗牌、猛烈抽打和挥舞，因为它们被强行排干了你凝胶状的压迫者。视线范围内的一切都被翡翠色的精液浸透了；甚至湖水也得到了你黏糊糊的生命之水的健康剂量。无法说出到底需要多少次巨大的起伏才能完全驱散这个流氓……");
         outputText("[pg]你被留在湖岸边，只剩下深沉的呼吸，身上结满了颤抖的精液，同样受到袭击的湖水拍打着你的腹部。当你感觉到你的[cock]终于减轻了它沉重的周长时，你发出了一声响亮的叹息。同样轻松的感觉也随之而来，[if (hasBalls) {你的[balls]终于恢复了正常大小，在辛苦工作了一天后，舒适地停留在你的阴茎和[vagina]之间。|你不想要的痛苦之囊退回你的腹股沟，消失在它产生的邪恶深渊中。}]看来你终于可以打卡下班，回到营地了……");
         outputText("[pg]……但是，幽灵女孩怎么了？她未知的命运终于在你脑海中浮现，促使你迅速从地上跳起来。你低头看着你身体和周围区域的烂摊子，颤抖的精液漫无目的地游荡，懒洋洋地试图重组自己。她还会被困在那个东西里吗？也许你应该试着帮她重新组装……但这可能需要一整天的时间！但在你眼角的余光中，湖面上一个清晰的斑点在呼唤你。你低头看着倒影……你的眼睛闪烁着淡黄色的光芒。");
         outputText("[say: 嘘！]你的脸对你大喊，引发了你惊慌失措的向后跳跃，结果导致你滑倒在你的[butt]上。在你摔倒的过程中，幽灵轻易地从你体内穿过，完美地站在你之前的位置上，用和之前一样恶作剧的微笑低头看着你。");
         outputText("[say: 是的，在那团毫无知觉的黏液把你填满，为“蛋蛋号”命名的时候，我就弃船了，]她解释道，语气中没有任何责任感。[saystart]你很幸运我在附近帮你收拾烂摊子。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) == 0)
         {
            outputText("正如我们今天所见，你连打手枪都打不好，更别提保命了。[sayend]");
         }
         else
         {
            outputText("显然，自从上次之后，你根本没有进行任何有意义的练习，[sayend]幽灵一边责备你，一边做了一个夸张的打手枪动作。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) == 1)
         {
            outputText("[say: 我还怕你已经……放弃这只幽灵了呢。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,510) > 1)
         {
            outputText("[say: 但如果是这样的结局，我非常乐意下次再来一次！]");
         }
         outputText("[pg]幽灵女孩对你露出一个温暖的笑容，然后伸手进她的外衣里掏出一个瓶子，迅速扔给你，你手忙脚乱地接住了它。[say: 这次我可是有备而来……而且不止一种准备。]伴随着微弱的挥手，幽灵飞回了废墟，留下你重新调整并清理自己。当你重新穿好衣服时，你盯着幽灵留给你的<b>装有灵质的容器</b>。……她进出身体的时候，到底把这些东西藏在哪里了？你一边思考着这个谜团，一边拖着步子走回营地，拍掉粘在肩膀上的最后一点有意识的翡翠精液。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,510,FlagDict_Impl_.arrayReadInt(_loc2_,510) + 1);
      }
      
      public function shouldraGreeting() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_ghostGirl());
         clearOutput();
         if(get_silly() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,366) == 0)
         {
            if(!(get_player().cockTotal() > 1 || get_player().face.type != 0 || get_player().lowerBody.type != 0 || get_player().tail.type > 0 || get_player().horns.value > 0 || !get_player().isPureEnough(15) || get_player().longestCockLength() > 10 || get_player().get_tallness() < 65 || get_player().get_tallness() > 78 || get_player().hasVagina()))
            {
               superCoolPaladinSexStuffDudeGasmJizzMonkies();
               return;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,351) < 3)
         {
            outputText("你小心翼翼地走进村庄的废墟，在通道中穿梭，寻找任何值得装进口袋的东西。从一座半塌的茅草屋里传来的声音让你停下了脚步。你皱起眉头，对自己竟然在这种地方放松警惕感到懊恼。不幸的是，那个存在似乎察觉到了你，你听到它正拖着脚步走向破损的门口。你蹲下身子，准备好你的[weapon]，准备战斗。当一条完全正常的女性腿从门框里迈出来时，你有些措手不及。这个年轻的" + (ghostLoli() ? "女孩" : "女人") + "走近了几步，似乎暂时无视了你那威吓的姿态，上下打量着你。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,351) == 0)
            {
               outputText("[say: 你就是那个拿走我架子的混蛋，对吧？我本来在囤……呃，我本来在盯着那些东西的！]她指责道，愤怒地眯起眼睛。");
            }
            outputText("最后，她终于注意到了你准备战斗的姿态。她叹了口气，耸了耸肩，举起双臂，摆出了一个正统的拳击姿势。你再次举起你的[weapon]。");
            startCombat(new Shouldra());
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,352) >= 3 && int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,351) % 10) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) > 0)
            {
               get_game().shouldraFollower.initialShouldersRecruitment();
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,351,FlagDict_Impl_.arrayReadInt(_loc1_,351) + 1);
               return;
            }
            outputText("你小心翼翼地走进村庄的废墟，在通道中穿梭，寻找任何值得装进口袋的东西。从一座半塌的茅草屋里传来一阵现在已经很熟悉的声音，让你停下了脚步。当一个看起来很普通的女孩走出来面对你时，你并不感到惊讶。她双手叉腰，好奇地歪着头。[say: 又是你？]她和蔼地问道，长满雀斑的脸上开始浮现出一丝笑容。[say: 哎呀，你总不会是专门回来看我的吧。][pg]");
            outputText("还没等你确认或否认她的猜测，她就蹲下身子摆出战斗姿态，在举起的双拳后面对你微笑。[say: 我们来一场友好的小切磋怎么样？]她问道。[say: 如果我赢了，我就能和你玩玩。]你点点头，举起你的[weapon]准备战斗。[say: 你连一丝胜算都没有，]她调侃道。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,352) >= 3)
            {
               outputText("[say: 或者……还是算了吧？说实话，我觉得你已经充分证明了你揍我的能力。想直接跳到精彩部分吗？][pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,352) == 3)
               {
                  outputText("你完全没料到会这样。看来她提议放弃战斗，直接开始做爱。");
               }
               outputText("你想接受她的提议，还是无论如何都要和她打一场？");
               menu();
               addButton(0,"接受",yankeeEchoPapa);
               addButton(1,"战斗",novemberAlphaHotel);
            }
            else
            {
               startCombat(new Shouldra());
            }
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,351,FlagDict_Impl_.arrayReadInt(_loc1_,351) + 1);
      }
      
      public function shouldraGiantCockLoss() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("她的注意力不可避免地转移到了你巨大的阴茎上，不知何故它仍然被包裹在你的衣服里，她迅速吵闹着要把它从监狱里释放出来。她几乎撕掉了你的[armor]，把你的头向后仰，以便完全吸收你的" + get_player().cockDescript(_loc1_) + "，一小行口水从你的嘴角流出。她张开你的嘴，似乎想说话，但找不到词，而是发出一声长长而焦虑的呻吟。她的第一反应是简单地抱住那巨大的肉棒，高兴地挤压着。最终，她似乎意识到了自己最初的意图，退了回来，用你的手抚摸着你的下巴，显然在确定刺激你怪物的最佳方式。伴随着一声小小的“啊哈！”，她挣扎着站起来，不习惯这种奇怪的平衡中心。带着你一起，她开始在城市的街道上漫游，控制着你的嘴大喊：[say: 我的天哪，我到底要怎么用这根巨大的阴茎射精呢？]当听到一阵轻微的脚步声时，她的努力得到了回报，起初很遥远，但匆忙地向你走来。两个地精从拐角处冲出来，花点时间确认了你男子气概的报告尺寸，然后赶紧跑过来，脱衣服、绊倒、互相推搡，努力赢得比赛以赢得你的注意。当它们到达你身边时，这些兴奋的小生物几乎把你撞倒，它们开始抚摸和舔舐它们能接触到的每一寸阴茎肉。[say: 女孩们！]幽灵严厉地喊道（用你的声音），在它们转过头来看你时，将你的双臂交叉在胸前。她继续说道，嘴角露出一丝微笑：[say: 相信我，我会有足够的精力满足你们俩的。][pg]");
         outputText("她二话不说，伸出手抓住其中一个地精的肩膀，开始用她那奇怪的未知语言念咒，对着那个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("困惑的");
         }
         else
         {
            outputText("兴奋的");
         }
         outputText("女孩。她潇洒地完成了咒语，然后走到另一个地精面前重复这个过程。与此同时，第一个地精，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("在她的身体上寻找任何变化的迹象，当她什么也没发现时，开始撅起嘴。");
         }
         else
         {
            outputText("忍住把她的奶子挤在一起的冲动，用她能鼓起的最大耐心等待着。");
         }
         outputText("这时，幽灵女孩已经完成了咒语，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("她没有提供解释，只是");
         }
         else
         {
            outputText("并且，令那个绿皮肤女孩明显高兴的是，");
         }
         outputText("伸出手揉捏地精的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("小巧坚挺的B罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 1)
         {
            outputText("挺拔丰满的C罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 2)
         {
            outputText("形状姣好、富有弹性的D罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 3)
         {
            outputText("大而柔软的E罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 4)
         {
            outputText("硕大且随着呼吸起伏的F罩杯");
         }
         else
         {
            outputText("巨大且毫无遮掩的G罩杯");
         }
         outputText("。地精");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("立刻停止了抗议，按摩带来的刺激让她瞬间把魔法偏心抛到了脑后，");
         }
         else
         {
            outputText("在依然不可思议的快感中发出狂喜的叫声，");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("尽管这并没有阻止第二只地精开始表达她自己的不满");
         }
         else
         {
            outputText("而且你忍不住注意到第二只地精脸上泛起的兴奋红晕");
         }
         outputText("。幽灵女孩捏住一颗迅速变硬的乳头向外拉扯，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("然后……把整个乳房也跟着拉了出来？");
         }
         else
         {
            outputText("并把整个乳房也跟着拉了出来。");
         }
         outputText("你在心里倒吸一口凉气");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("随着魔法的效果显现出来");
         }
         else
         {
            outputText("尽管以前见过这种魔法，但总是被这个过程所吸引");
         }
         outputText("；它把地精的乳房变成了一种几乎像油灰一样的物质");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("，很明显！");
         }
         else
         {
            outputText("又一次。");
         }
         outputText("幽灵女孩开始加快速度，轻轻地将地精放在地上，揉捏着这个绿皮肤女孩的乳房，每一次拉扯都至少增加半个罩杯。第二只地精在你身后目不转睛地看着，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("惊讶地喘息着，");
         }
         else
         {
            outputText("再也无法克制自己的冲动，");
         }
         outputText("迅速伸手粗暴地抓住她自己的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("娇小的乳房");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 1)
         {
            outputText("适中的胸部");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 2)
         {
            outputText("丰满的胸部");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 3)
         {
            outputText("巨大的双峰");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 4)
         {
            outputText("硕大的乳房");
         }
         else
         {
            outputText("泰坦般的巨乳");
         }
         outputText("，兴奋地叫喊着，因为她的乳房在自己的揉捏下也开始膨胀起来。[pg]");
         outputText("此时，第一只地精的乳房至少已经达到了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("E罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 1)
         {
            outputText("F罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 2)
         {
            outputText("G罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 3)
         {
            outputText("H罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 4)
         {
            outputText("I罩杯");
         }
         else
         {
            outputText("J罩杯");
         }
         outputText("，而幽灵女孩进一步加快了按摩的速度。她对这个进度并不满意，于是将地精的头抬到你的唇边，向这个小女人的喉咙里吹入一股稳定的气流，更有效地将她闪闪发光的乳房像气球一样吹大。这个过程一直持续到地精几乎要在她新长出的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("HH罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 1)
         {
            outputText("II罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 2)
         {
            outputText("JJ罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 3)
         {
            outputText("KK罩杯");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 4)
         {
            outputText("LL罩杯");
         }
         else
         {
            outputText("MM罩杯");
         }
         outputText("，幽灵女孩将你的注意力转向第二个地精，由于她……不熟练的技术，她的乳房尴尬地不对称。幽灵女孩把你移向她，仁慈地将目前");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 0)
         {
            outputText("DD罩杯（另一侧是C罩杯）");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 1)
         {
            outputText("EE罩杯（另一侧是D罩杯）");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 2)
         {
            outputText("FF罩杯（另一侧是E罩杯）");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 3)
         {
            outputText("GG罩杯（另一侧是F罩杯）");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) == 4)
         {
            outputText("HH罩杯（另一侧是G罩杯）");
         }
         else
         {
            outputText("II罩杯（另一侧是H罩杯）");
         }
         outputText("的乳房弄平，然后再次向地精的嘴里吹气，使地精膨胀，直到她与第一个地精匹配。伴随着兴奋的咯咯笑声，幽灵女孩让你转过身，站在两个惊愕的地精女孩之间，将一大团先列腺液甩到第一个地精的脸上，她立刻将其涂抹在乳房上，享受着额外的润滑。她慢慢地落到你的背上，将你的肉棒垂直地展示给两个越来越渴望的女孩，并下达了一个简单的命令：[say: 乳交。][pg]");
         outputText("不需要问第二次，两个女孩在你巨大的肉棒两侧就位，将她们肿胀的乳房托起并包裹住你的阴茎。柔软的乳肉令人愉悦地挤压在你的胯部，包裹着你的" + get_player().cockDescript(_loc1_) + "，并在中间相遇，地精们的乳头相互摩擦。她们看着你寻求最后的确认，幽灵女孩点点头；在这一点上，你发现自己自愿地跟着她点头，完全被这种情况迷住了。伴随着兴奋的咕哝和呻吟，地精们开始在你的肉棒上上下滑动她们柔软、光滑的肉体，在突然的影响下，她们踩在你的臀部上，将自己撑起，利用增加的高度来刺激你更多的" + get_player().cockDescript(_loc1_) + "。你和幽灵女孩都被地精双重乳交的感觉惊呆了，没过多久，你就感觉到自己达到了性高潮的边缘，幽灵女孩将此事告知了地精。考虑到她们最近的增加，第二个地精以你认为不可能的速度冲到你的肩膀上，把你拉到一个坐姿，你巨大的肉棒正好落入第一个女孩的手中，她立刻用她的双唇包裹住你头部的两侧，将她的嘴唇插入你现在扩张的尿道，贪婪地吮吸着，并从她过度刺激的乳房中挤出几滴母乳。为了帮助你达到高潮，第二个地精将她自己的乳房挤压在你的背上，上下滑动，在你身上留下小小的乳白色痕迹。[pg]");
         outputText("伴随着焦急的呻吟，你向后仰起头，绷紧身体，精液开始在你胯部和龟头之间广阔的土地上跋涉，第二个地精立刻爬了过来，留下你支撑着自己，在期待中扭动着身体，咬紧牙关。地精二人组将自己靠在你的男子气概上，张大嘴巴，第一团精液以足够的力量猛烈撞击她们，使她们两人的脸颊都鼓了起来。她们迅速将乳房托在身下，在她们巨大的乳沟峡谷中接住任何游荡的精液。这种情况还在继续，精液的体积随着每一次脉动而增加，直到两个地精都好像把四加仑的白漆倒在自己身上一样。伴随着最后一次强烈的爆发，你向后倒去，胸部起伏，高潮的余波冲击着你。当你躺在那里，偶尔有精液滴落在你的[chest]上时，你设法瞥了两人一眼，发现她们正在一起努力，尽可能多地将积累的精液舀进她们饥渴的肉洞里。你发呆了大约五分钟，当你意识到幽灵的存在消失时，你很快就从恍惚中清醒过来。你不稳地站起来，看到地精们还在用你的精液做着什么，肚子因为你令人印象深刻的高潮而肿胀。她们跌跌撞撞地站起来，确保在穿衣服时把一只手放在她们的阴户下面，以尽可能多地保留精液——如果你甚至可以把她们的装束称为衣服的话。你注意到她们过大的乳房正在迅速缩小，瘪下去，直到恢复到接近正常的状态。当你意识到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,363) <= 4)
         {
            outputText("她们从这次经历中至少保留了一个罩杯大小的肉");
         }
         else
         {
            outputText("她们的乳房似乎已经达到了顶峰，保持着相同的（不可否认的令人难以置信的丰满）尺寸");
         }
         outputText("时，你勉强挤出了一丝微笑，她们在并肩走开时高兴地抚摸着。走到你的[armor]前重新穿好衣服，你摇了摇头，不止一次地想，这么大的附属物是否真的对你有益，并想这是否是你最后一次见到你的两个新地精朋友。[pg]");
         outputText("你的腹部开始产生一种奇怪的感觉，你好奇地将手按在肉体上。你迅速把手移开，因为一个熟悉的脑袋突然钻了出来，扭动着直到面对你。她笑了笑，然后把手臂从她的躯干里抽出来，以此为杠杆（伴随着一句低语的咒语，让她的手变得有形），将自己完全从你体内拔了出来。她嘟囔着一句咒语，再次凝固了她那不起眼的身形，向你眨了眨眼，拿起她的束腰外衣，套在身上。在你的注视下，她将拇指和食指伸进她那满足的小穴里，挤出了一大团黏糊糊的幽灵物质。她把手伸进束腰外衣的口袋里，掏出一个小瓶子，迅速把灵质挤了进去。她把瓶子递给你，解释道：[say:这算是一个……幽灵高潮的产物吧。留着吧，对你有好处。]她高兴地道了别，走进一条小巷，顺手抓起她那破烂的紧身裤和丢弃的鞋子，消失在阴影中。你正准备离开，却发现你的[legs]变得沉重，附身后的疲惫感席卷而来。不知不觉中，你已经跪倒在地，不得不努力不让眼皮耷拉下来。你屈服于疲惫，瘫倒在地，很快就满足地打起了呼噜。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,363,FlagDict_Impl_.arrayReadInt(_loc2_,363) + 1);
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sharkyEctoginas() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("随着她的招手，你挑起眉毛，走向这个被幽灵附身的鲨鱼女孩。幽灵没有说话，而是指了指她的下半身，那里依然（勉强）被黑色的比基尼包裹着。让她感到困惑的是，灰色的手臂痉挛起来，因为宿主正在反抗这场第三方的强暴。鲨鱼女孩似乎差点就成功了，黄色的眼睛甚至稍微改变了色调，但幽灵女孩又把自己塞回了主导地位。尽管还有持续挣扎的迹象，她还是用那只再次变成琥珀色的眼睛向你眨了眨眼，并满怀期待地用手抚摸着她粗糙的大腿。你把她往后推，直到她被迫用鲨鱼尾巴作为三脚架支撑身体，然后你蹲下身子，与她那海洋生物般的下体平齐，布料上滴落着水、汗水以及偶尔渗出的一小滴淫液的混合物。你轻轻舔了一下，对舌尖传来的咸味并不感到意外，然后开始以越来越大的力度舔弄。她的双腿因初现的性唤起而颤抖，呼吸变得急促，喉咙里逸出短促的呻吟和性感的叹息。你用手指勾住她的比基尼泳裤，准备露出她的私密部位，但当她的臀部突然膨胀，将布料再次紧紧贴在肉上时，你停了下来。你抽出手指，向后靠去，意识到你即将见识到她法术的效果。幽灵女孩发出一声特别充满激情的呻吟，但随后又被一声担忧的喘息打断。鲨鱼女孩的面容在她分心时瞬间重组，显露出附身者特征的痕迹。在注意到并纠正了这一疏忽后，她转向你。[saystart]……我想……我施放了……错误的法术……");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,354) > 0)
         {
            outputText("又一次……");
         }
         outputText("[sayend]她喘息着，眉头突然因担忧而紧锁。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,354) == 0)
         {
            outputText("你刚想问她在说什么，但话到嘴边却咽了下去，因为");
         }
         else
         {
            outputText("你只能无奈地摇摇头，看着");
         }
         outputText("她右臂的肌肉在皮肤下疯狂蠕动，拉伸并膨胀。她的手迅速变得和头一样大；上臂也同样变粗，直到手肘几乎碰到腰部。这重量对她那比例依然正常的身体来说负担太重，那只手臂无力地垂落在地上。然而，这只手臂并没有停止生长。[pg]");
         outputText("现在你和她一样惊慌，你开始后退并站起来，但被眼前这个满脸通红的女孩发出的一声惊讶的“哦”给拦住了去路。你的犹豫让你失去了逃跑的机会，她挥舞着新变大的手臂，粗暴地抓住你的后脑勺，把你推回她的双腿之间。仿佛是配合着她的动作，鲨鱼女孩的阴唇向前涌出，吞没了试图束缚它的紧绷衣物，然后伴随着多汁的吧唧声拍打在你的脸上。她的阴蒂紧随其后，在身体其他部位还没跟上之前就长到了最大尺寸。如果她愿意，她很可能把那根肿胀的肉棒直接拉进她的乳沟里。你知道安抚这个幽灵鲨鱼女孩将是你逃脱的唯一方法，你狂热地用舌头攻击她的爱之通道，滑过并挤压着排列在里面的触手。与此同时，你设法将头倾斜到足以看到她的左臂肿胀到与右臂相匹配的程度，从她腹部肌肉越来越急促的隆隆声中，你可以看出她的躯干也快要变大了。出乎意料的是，你的头被迫抬高了几英寸，你伸手去确认你的怀疑；她的尾巴，以及周围结实的屁股，也跟着变大了。出于冲动，你粗暴地按摩着那肌肉发达的臀瓣，引起了你爱人喉咙深处的呻吟，并加快了生长的速度。她的臀部、屁股和尾巴继续肿胀，直到她那不堪重负、紧绷得令人难以置信的丁字裤带子在压力下断裂并脱落，引起了女孩如释重负的喘息。你只停顿了一下，慢慢地从她润滑的肉洞里抽出泳装的残骸，额外的刺激导致幽灵女孩不断发出的色情声音音调略微升高。你突然被从她双腿之间的位置举起，当她最终在快感下崩溃时，你被拦腰抱起，当她倒在柔软的草地上时，你被鱼鳍稍微推向一边。当你回头看着她那现在正在蠕动的双腿随着法术的力量膨胀时，你不需要任何解释，变粗的大腿以足以压碎任何愚蠢到留在它们之间的可怜灵魂的力量相互靠近。[say:你……傻了吗！？]被附身的鲨鱼女孩喘息着。从她的声音从悦耳变成粗糙的方式，你可以猜出是谁把你从命运中拯救出来的。[say:当……一个女孩的腿在变大时，别傻站着……哦……哦……哦……][pg]");
         outputText("你将注意力转移到她的乳房上，回头看去，正好看到一个起伏的球体随着新的质量而膨胀，紧接着是另一个，这动作看起来像某种荒谬的舞蹈。虽然你可以切断开始陷入肿胀乳房的带子，但当乳房在限制性织物周围凸起时，你忍住了。她的乳房以惊人的速度攀升，在比基尼上衣最终屈服于压力之前达到了I罩杯，当汹涌的乳房挣脱牢笼时，引起了从她的乳头一直延伸到脚底的涟漪。当你沐浴在未被遮盖且仍在肿胀的乳房的光辉中时，你的眼睛睁大了。它们最后一次涌动，然后停止了，你环顾四周，看到变化基本完成。伴随着最后一声颤抖的叹息，幽灵女孩抬起头来审视你突然变得微不足道的身躯。曾经站着（或者，你猜，躺着）一个矮小、吵闹的鲨鱼女孩的地方，现在躺着一个呻吟、流汗、极其饥渴的鲨鱼女巨人！你在心里迅速记下，原谅所有你曾经想占便宜的妖精，因为鲨鱼幽灵再次把你抱起来，沉醉在她任性法术带来的意想不到的结果的兴奋中。你设法深吸了一口绝望的气，然后她毫不夸张地把你重新塞回她的爱唇之间，一直埋到腰部，陷入那扭动、摇晃的混乱之中。[pg]");
         outputText("你咬紧牙关，狂热地投入工作，抚摸、抓捏、舔舐你能触及的每一寸肌肤，注意到她喘息和呻吟的频率增加了。仿佛是为了奖励你的努力，女孩伸出手，将她的小指对准你那被冷落的私处，不知不觉中，你突然被撑开了");
         if(get_player().hasKeyItem("Deluxe Dildo"))
         {
            outputText("被你自塔玛尼的豪华假阳具以来所体验过的最大的物体");
         }
         outputText("，插入的规模之大让你的眼睛几乎都要对眼了。不到一分钟，高潮就席卷了你的身体，随之而来的痉挛将幽灵女孩推向了边缘，她发出一声急促的尖叫，声音中既有幽灵的空灵，又有鲨鱼女孩的野性。在胃部被撑得如此之大的情况下，你集中起所能聚集的全部注意力，在她的高潮到来前的一瞬间，拼命地从巨大的鲨鱼小穴中挣脱出来。由于没能完全逃脱，你被喷了一脸的爱液，这让你翻了个跟头");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("并且多余的润滑液糊满了你的乳沟");
         }
         outputText("。当情欲的云雾从幽灵女孩平时聪慧的头脑中散去后，她不禁注意到你一定很不舒服，因为她巨大的小指正塞在你的" + get_player().vaginaDescript(0) + "里，让你不停地扭动。[pg]");
         outputText("考虑到她现在的体型，她尽可能温柔地将手指从你的阴道里拔了出来，伴随着“啵”的一声，她将你依偎在她的乳房上，让你靠在她柔软的、像人类一样的乳头上休息，直到魔法效果消失。果然，几分钟后，你感觉到她的身体颤抖了一下，开始缩小，你一直紧紧抱住她的乳房，直到鲨鱼女孩恢复到她正常的运动体型。[pg]");
         outputText("过了一会儿，伴随着另一个更加轻柔的吻，你将幽灵吸回体内，留下了一个非常疲惫却出奇满足的鲨鱼女孩。她在整个经历中都保持着清醒，甚至还向幽灵女孩道歉");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,354) > 0)
         {
            outputText("再次");
         }
         outputText("因为打断了法术——尽管幽灵并不在意，声称虽然这个法术不是她本意要施展的——甚至她都不太清楚怎么施展——但她也很享受这次经历。伴随着友好的挥手，现在赤身裸体的鲨鱼女孩潜回了她习惯的家中。[pg]");
         outputText("事情解决后，你和你临时的幽灵同伴决定在这里分道扬镳。幽灵女孩从你的胃里推出来，流出你的身体并重新成形，给了你一个快速的拥抱，并保证她度过了一段美好的时光。当她开始跋涉回废墟城市时，她警告说，如果你指望她顺从你的意愿，你最好准备好打一架。");
         get_player().orgasm("Vaginal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,354,FlagDict_Impl_.arrayReadInt(_loc1_,354) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function sharkbustersVictory() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你平安无事地到达了湖边，并迅速跳上了等候在那里的船。当你驶离码头时，你留意着猎物的任何踪迹；幸运的是，你没有等太久。一个标志性的鱼鳍破水而出，径直朝你游来。你掉转船头划回岸边，跳下船焦急地等待着，幽灵女孩在你耳边尖叫着警告湖里有鲨鱼，但这无济于事。那条[say:鲨鱼]游到岸边，优美地跃出水面。你险些被溅了一身水，她稳稳地落在地上，转过身来面对你。鲨鱼女孩对你露出了她那标志性的、满是利齿的凶狠微笑。[say:想玩玩吗？当心……唔唔！][pg]");
         outputText("你甚至没给她把话说完的时间，冲上前去，用一个热烈的吻堵住了她的嘴");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，" + get_player().allBreastsDescript() + "紧紧贴在她那几乎衣不蔽体的胸膛上挤压着");
         }
         outputText("。困惑的鲨鱼女孩僵硬地站着，手臂胡乱挥舞。当幽灵女孩的形态在心灵感应的命令下突然实体化……在你的嘴里时，这个堕落生物的困惑只增不减。幽灵化作一条蛇，穿过嘴唇的桥梁，在鲨鱼女孩甚至来不及吸一口气之前，就顺着她的喉咙滑了下去。你轻轻地松开拥抱并后退，而这两个女孩开始了她们的内部战斗。经过长时间的喘息、抱头和咬牙切齿后，鲨鱼女孩安静下来，抬头看着你的脸。以前红色的眼睛现在闪烁着淡黄色的光芒，这正是你之前拥有的光芒。她微笑着点头，表示幽灵女孩成功控制了这具身体。你耐心地站着，看着她习惯她的新宿主，灰色的手在构成她皮肤的奇异真皮齿上游走。你注意到她在腹股沟处停留了很长时间。当幽灵女孩将一根试探性的手指插入鲨鱼女孩的小穴，发现里面有纤毛状的结构在蠕动时，她发出了满足的呼噜声。分析完成后，幽灵女孩将鲨鱼的目光转回给你。[say:好吧，我们本来可以就这么做爱的，]她开始说道，[say:但让我把这变得更有趣一点……][pg]");
         outputText("她思考了一会儿自己的选择，当她似乎找到了一个好主意时，打了个响指。[say:哦，这会很有趣的，]她发出呼噜声，然后开始施展古老的法术。然而，在吟唱了一小段后，幽灵女孩的声音颤抖了，她跪倒在地。你猜想鲨鱼女孩认为她的心智还没有完全被占据，但这从未阻止过幽灵，她的声音变得强硬，强迫自己说出剩下的词，以一声不舒服的呻吟结束了最后一个词。一旦她的注意力回到自己身上，她就在精神上将鲨鱼女孩重新压制，然后站起来，拍了拍身上的灰尘，对你耸了耸肩。你回以同样的动作，然后走上前去检查法术的结果。");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"用阴茎",ghostIzmaPenis);
         }
         else
         {
            addButtonDisabled(0,"用阴茎");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"用阴道",sharkyEctoginas);
         }
         else
         {
            addButtonDisabled(1,"使用阴道");
         }
      }
      
      public function penisLossThatIsntALoss() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            dewormYourGhost();
            return;
         }
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            penisGartuanGhostSmexVictory();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,358) == 0)
         {
            outputText("她突然兴奋地喘着粗气，开始把你的手移向你的腹股沟，不过你迅速夺回了控制权。[say:你有阴茎，]她通过心灵感应向你传递信息，声音中带着焦虑和兴奋。[say:我的宿主……他们很少……他们……]");
         }
         else
         {
            outputText("她轻声笑着，回忆起你们共度的时光，她再次饥渴地扑向你的男性象征，尽管你把她推开了。");
         }
         outputText("随着幽灵女孩的意志与你的意志对抗，交流突然中断，她脑海中所有顺从的念头都消失了。");
         if(get_player().get_inte() < 50)
         {
            outputText("她很容易就打破了你的防线，你很快就感觉到自己被她庞大的精神力量推到了一边。");
         }
         else
         {
            if(!(get_player().get_inte() < 90 || get_player().cockThatFits(80) == -1))
            {
               _loc1_ = get_player().cockThatFits(80);
               outputText("幽灵女孩进行了顽强的抵抗，但你对她的精神攻击早有准备。当她的入侵被压倒时，你感觉到她的恐慌，虽然她试图切断精神链接，但你轻松地阻止了她。她在精神上向你尖叫抗议，但你耳边的嗡嗡声只会加强你对这个可怜幽灵的心理支配。没过多久，她就变成了一个呜咽的废人。[say:出去，]你命令道，厌倦了这个麻烦幽灵的干涉。当然，她现在甚至不会尝试反抗，顺从地聚集她的精华并开始退出。片刻之后，幽灵女孩从你的身体里流出，并在你面前重新凝固。[pg]");
               outputText("她气呼呼地转身要走，但你用一个心灵感应命令阻止了她。你提醒她，她现在是你的了，既然她费尽心思试图让你高潮，她不妨把事情做完。尽管她撅起嘴唇，固执地生着闷气，但一股支配性的影响浪潮席卷了她，她不由自主地开始摇摇晃晃地走向你。你决定迎上前去，大步走到她面前，把她按在你的膝盖上。在她的注视下，你脱下你的[armor]，把你的" + get_player().cockDescript(_loc1_) + "举到她的唇边，非常明确地暗示了你的期望。幽灵女孩看到你的男性象征，眼睛睁得大大的，随着新一波的性唤起席卷全身，她畏缩了一下。她因为无法平息自己压倒性的性欲而发出一声小小的呜咽，但你只是嘲弄地笑着，指了指你的男性象征。[say:幽灵口交，]你冷嘲热讽地嘟囔着。[pg]");
               outputText("你甚至不给她自己行动的机会，直接伸出手，抓住她的头，把她按在你的" + get_player().cockDescript(_loc1_) + "上。她接受得惊人地好，也毫不意外地轻松，第一下就吞下了大部分肉棒。她甚至没有发出一声闷哼，就不耐烦地双手抓住你的[ass]，把头往前凑。还没等你反应过来，你整根" + get_player().cockDescript(_loc1_) + "就已经被包裹在一条肉感的爱之隧道里了。");
               if(get_player().cockTotal() > 1)
               {
                  outputText("注意到");
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("你的另一根肉棒");
                  }
                  else
                  {
                     outputText("剩下的[cocks]");
                  }
                  outputText("，这个被精神控制的女孩迅速抓住了");
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("你的另一根肉棒，用力地套弄起来。");
                  }
                  else if(get_player().cockTotal() == 3)
                  {
                     outputText("你的另外两根肉棒，用力地套弄起来。");
                  }
                  else
                  {
                     outputText("另外两根肉棒，用力地套弄起来。");
                  }
               }
               outputText("[pg]");
               outputText("幽灵女孩在你的下体上大干特干，你的意志和她不断高涨的欲望共同驱使着她的动作。[pg]");
               outputText("尽管她的嘴被塞得满满的，但当她开始施放法术时，她的声音清晰地在你的脑海中响起。你低头看着她，从她近乎平静的表情和深邃的眼眶中猜测，她甚至已经克服了无法高潮的障碍。她像往常一样华丽地完成了法术，然后再次将注意力集中在取悦你上。");
               if(get_player().cockTotal() == 2)
               {
                  outputText("将手从你的另一根肉棒上移开，这名");
               }
               else if(get_player().cockTotal() >= 3)
               {
                  outputText("将双手从你的其他肉棒上移开，这名");
               }
               else
               {
                  outputText("这名");
               }
               outputText("幽灵女孩含着你的肉棒笑了起来，你只能猜测她有什么计划。然而，你并没有等太久；一股奇怪的翻滚感出现在");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]里");
               }
               else
               {
                  outputText("你的肉棒根部附近");
               }
               outputText("。");
               if(get_player().balls == 0)
               {
                  outputText("当一个沉甸甸的精囊形成并垂在你的双腿之间时，法术的初步效果以一种夸张的方式显现出来。");
               }
               outputText("这种奇怪的感觉集中在你的睾丸上，让你很难集中精力去压制这个幽灵女孩。你对意志力的控制一直没有动摇，直到你感觉到你的双腿被推得更开。好奇的瞥视变成了惊恐的凝视，因为你看到了你现在");
               if(get_player().ballSize >= 9)
               {
                  outputText("巨大无比");
               }
               else
               {
                  outputText("篮球");
               }
               outputText("大小的蛋蛋。[pg]");
               outputText("趁你分心，你曾经的心灵奴隶将你推倒并骑在你身上。她那无力却湿透的阴户在你的肚子上留下了一道道清澈的淫液，同时她继续在你的肉棒上套弄着");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("并来回扭动着臀部。她的双手开始揉搓你不断变大的睾丸，但两只手无法覆盖越来越大的面积来进行有效的刺激。她耸了耸肩，满足于拍打、挠痒和挤压她能触及的皮肤。你那巨大的精囊里开始剧烈翻滚，这种动静甚至让地面都震动了起来。你们俩都知道这意味着什么，幽灵女孩甚至停下了狂热的口交，渴望地盯着你。看来你掌握着满足她欲望或拒绝她渴望的高潮的关键；你要怎么做？");
               menu();
               addButton(0,"让她高潮",letShouldraIn);
               addButton(1,"把她赶出去",kickShouldraOut);
               return;
            }
            outputText("你开始占据上风，但幽灵女孩比你预想的要狡猾。她开始向你发送精神入侵脉冲，扰乱你的思绪，这短暂的时间足以让她超越你，把你推到一边。[say:想挑战我，你还早了一百年呢，]她斥责道。[say:我的智慧早已超越了这个位面上的绝大多数生物。]");
         }
         outputText("[pg]");
         outputText("她完全控制了你的身体，仿佛它从来都不属于你一样，她脱下你的[armor]并随意地扔在地上。她双手抓住你的" + get_player().cockDescript(_loc1_) + "笨拙地抚摸着，尽管她智力很高，但显然对男性生理结构缺乏经验。她继续摸索着你不断变长的阴茎，承认道：[say:即使在我附身过的少数男性身体中，我也很少有机会玩弄他们的……]当幽灵女孩重温她以前尴尬的附身经历时，你感到脸红了。你的阴茎终于伸展到全长，你的双手笨拙但确实有效地在上面上下滑动。当你跪倒在地时，汗水很快开始浸湿你的身体，你被这种简单的自我刺激带来的快感弄得有些不知所措。你以前自慰时从未感觉这么好过！你觉得你这位新“室友”的超自然影响与此有关。仿佛为了证明你的理论，你的嘴里说出女孩那种奇怪的古老语言，你的身体在痛苦和快感中僵硬，因为");
         if(get_player().balls > 0)
         {
            outputText("你的睾丸因充沛的生育力而翻腾，并且");
         }
         outputText("你的阴茎因新获得的粗度而膨胀。这种生长迫使你的双手分得更开，直到你颤抖的肉棒看起来像一个非常兴奋的消防栓。当她咬住你的下唇，在刺激的狂喜中向后仰起头时，口水开始从你的嘴角流下。最后，你感到阴囊一紧，而你——这次完全靠你自己，因为幽灵女孩完全被你身体的高潮所控制——将手移到肉棒底部。令人惊讶的是，你甚至能感觉到精液在你的手指下蠕动着准备释放。伴随着一声幽灵与人类交织的狂喜尖叫，你的背部弓起，一股精液如间歇泉般喷涌而出，像喷泉一样洒在你身上。在跪着颤抖了很长一段时间后，你终于恢复了理智，重新站了起来，注意到你那没有实体的幽灵朋友不再抵抗。当你看着现在疲软的阴茎缩小回原来的比例时，你松了一口气。[pg]");
         outputText("她的快感得到满足后，幽灵女孩头朝下从你的肚子里出现，流出来并重新组合成你最初遇到的那个普通的棕眼女孩。几乎是事后才想起来，她伸出手，把手伸进她还在滴水的阴道里。显然，她抓住了什么东西，费了一番力气，她拽出了一把半透明的绿色粘液。[say: 灵质，]她解释道，伸手去抓她的束腰外衣。她把手伸进口袋，拿出一个小瓶子，把黏糊糊的物质塞了进去。[say: 基本上是幽灵高潮的产物，你非常友好地为我提供了。]她微笑着，把瓶子递给你，然后走向她的衣服，迅速穿好。她挥了挥手，走开了，拐过一个弯，从视线中消失了。你决定再次找到她——她的魔法相当有趣！");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,358,FlagDict_Impl_.arrayReadInt(_loc2_,358) + 1);
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function penisGartuanGhostSmexVictory() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         outputText("当幽灵女孩注视着你那异常巨大的" + get_player().cockDescript(_loc1_) + "时，你感到一阵几乎无法抗拒的焦虑与兴奋交织的冲动。你决定顺水推舟，将手放在[armor]的凸起处，享受着她看到你的阴茎微微抽动变硬时发出的欢快窃笑。你正准备脱衣服，却被半勃起的阴茎里传来的一阵熟悉的洪亮声音打断了。[say: 这婊子到底是谁？]困惑的埃克斯加图安暴躁地吼道。[say: 住在别人身体里可是老子的专利！][pg]");
         outputText("震惊的幽灵女孩差点当场从你体内跳出来。[say: 哦……我……我很抱歉……呃……啊……]她用你的声音结结巴巴地说着，话语几乎无法在你的嘴里成型。在心灵感应中，她愤怒地向你传达：[say: 你为什么不告诉我这里……还有别人？]你只好怯生生地为自己的疏忽道歉。[say: 说话啊！？]埃克斯加图安咆哮着，你那半软的阴茎愤怒地抽动了一下。[pg]");
         outputText("又犹豫了片刻，幽灵女孩沉到你的腰部，把头从你的[hips]探了出来。[say: 我很抱歉，先生，但我们的——呃，抱歉，你的宿主并没有提到他已经被……占用了，]她用柔和的女性嗓音承认道。[pg]");
         outputText("[say:等一下，]恶魔要求道，突然变得不那么喧闹了。[saystart]你是说你是个妞，对吧？而且不是那种带把的妞");
         if(get_player().hasVagina())
         {
            outputText("像这个婊子一样");
         }
         outputText("？[sayend][pg]");
         outputText("幽灵女孩的[skintone]脸颊上（不知为何）泛起了一阵红晕，她温顺地点了点头。显然，她不知道这个反复无常的生物会做出什么举动。突然，她发出一声轻呼，脑袋被吸回了你的体内。你能隐约感觉到她的存在发生了转移，然后，仿佛被牵引着一般，移动到了……你的阴茎里？你感觉到自己完全恢复了控制权，于是把手放在你那巨大的肉棒下，微微托起。那东西在你手中猛地一跳，吓了你一跳。[say: 好了，婊子，让我们开始灵魂交媾吧，]埃克斯加图安大喊道，令你惊讶的是，你体内的这位新来的灵魂竟然满怀期待地呻吟了一声。[pg]");
         outputText("[say: 可是你太大大大大了，]她声音沙哑地调戏着，你的脑海中突然充满了这个女孩和恶魔的画面。他们位于一个巨大的肉质通道里……你很容易就能猜到那意味着什么。你看到一个只能是埃克斯加图安的模糊人形（显然是赤裸的），红色的烟雾从他身上飘散并在他周围环绕。他那巨大的雄性象征裸露在外，不断抽动着，在海绵状的地面上拖行。幽灵女孩还是你记忆中的样子；不过，她已经把束腰外衣扔到了一边，把紧身裤褪到了膝盖处。这个被唤起情欲的幽灵四肢着地跪在天赋异禀的恶魔面前，轻轻摇晃着她那柔软的臀部，充满欲望地越过肩膀看向她那无形的爱人。趁着你分心，埃克斯加图安的影响力涌入你的身体，随着他接管控制权，你发现自己被进一步拉入了这个脑海中的画面。你的双手移向你的肉棒，就像他自己的动作一样，他把那根东西抬到了幽灵女孩的背上；这导致了一个奇怪的景象：你自己的命根子悬浮在半空中，而你无法夺回足够的控制权来修正这种怪异的现象。她颤抖着，这重量刺激着她，引出了几声发情的娇喘。[pg]");
         outputText("埃克斯加图安缓慢地向后拖动他那根巨柱（你自己的身体也模仿着这个动作），当肉棒滑过她裸露的肌肤时，幽灵女孩因为压抑的兴奋而剧烈地颤抖着。最后，恶魔到达了她滴着淫液的阴阜，用龟头诱惑地戳着她的阴唇，用少许先列腺液进一步润滑她。她不耐烦地向后倒在那根巨大的东西上，但埃克斯加图安");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,360) > 0)
         {
            outputText("再一次");
         }
         outputText("在最后一刻狡猾地将臀部向上抬起。幽灵女孩没有得到预期的阴道插入，而是被过量的恶魔粗壮塞进了她的肛门。你因为感同身受的不适而退缩，但当她狂喜地呻吟时，你感到惊讶；当你感觉到自己的肉棒被近乎老虎钳般的紧致包裹时，你更加惊讶了。她的臀部变宽以适应插入，平坦的腹部开始出现隆起。幽灵女孩在极乐中扭动，当埃克斯加图安要求时，她的呻吟更加强烈，[say:脸朝下，屁股撅起来。]她顺从了，将她" + (ghostLoli() ? "小巧的" : "坚挺的") + "乳房挤压在肉质的地板上，并将下半身向上突出。恶魔张开双腿，然后猛烈地挺动臀部——当然，当你做出这个动作时，你会觉得自己完全是个傻瓜。你默默地感谢玛莱，周围没有人看着你……或者，至少，没有你能看到的人。他将巨大的肉棒埋入急切的幽灵女孩体内，深入不少于八英寸，这让她非常高兴。当你感觉到紧致的隧道也在你的阴茎上滑动时，你强忍住呻吟，如果不是埃克斯加图安控制着你，你肯定会摔倒。[pg]");
         outputText("随着巨大的生殖器继续它们的旅程，幽灵的腹部像气球一样向前膨胀，几乎不受任何人类解剖学结构的束缚。当她沐浴在“精神性爱”中时，一连串毫无意义的话语从她嘴里流出。你的阴茎开始稳定地滴下先列腺液，当你的身体模仿你恶魔同谋的淫荡骨盆运动时，液体溅在人行道上。你感觉到她的身体，被你的" + get_player().cockDescript(_loc1_) + "刺穿到胸部，随着恶魔的先列腺液脉动进入她过度伸展的胃部，肉体周围变得更加紧致。当她的中段稳定地向外脉动时，她的手飞向那里。幽灵终于到底了，埃克斯加图安的龟头停留在她肋骨所在的位置。意识到插入不会再深入，幽灵卷起手臂并旋转自己；当扭曲转移到你的柱子上时，你的眼睛几乎要交叉了。幽灵女孩试图找到恶魔，但她的腹部已经超出了她的视野。那个目标失败了，她挤压大腿，用脚踝摩擦颤抖的肉体。当她的应用取得巨大成功时，你和埃克斯加图安都不感到惊讶。你和他的阴茎根部随着第一波精液的脉动而膨胀。你的精液隧道肿胀，为即将到来的喷发腾出空间。[pg]");
         outputText("当第一股精液挤进她受虐的雏菊时，幽灵女孩尖叫着表达她的快乐。你的身体锁定在埃克斯加图安的高潮姿势；双手泵送你的精液，骨盆在期待中来回摇晃。过度敏感的" + (ghostLoli() ? "女孩" : "女人") + "的哭声随着每一股精液溢入她体内而加快节奏，恶魔把她当作活体避孕套。他把她泵得越来越大，超凡脱俗的高潮持续了你觉得像几个小时的时间。甚至无法改变姿势，你站在那里畏缩，因为至少一加仑的精液倒在破裂的道路上。就像破裂的水管一样，粘稠的物质从你高耸的男性特征中自由流出。");
         if(get_silly())
         {
            outputText("在你射精冒险的中途，拍打翅膀的声音提醒你上方有存在。虽然在你目前的情况下无法移动头部，但当一个像鸟一样的声音尖叫着，[say:荡妇，]在她的肺部顶部时，你非常清楚入侵者的性质。伴随着最后一声乌鸦叫，她飞走了，没有留下任何痕迹。");
         }
         outputText("终于，在经历了至少一分半钟的高潮后，你的“消防水龙”减缓成水流，然后变成涓涓细流。埃克斯加图安满意地释放了对你的控制，你向后瘫倒在深深的精液水坑里。当然，你几乎没有注意到，你的注意力都集中在那个圆润的幽灵女孩身上，她在身下肉质的地板上虚弱地扭动着。她的肚子看起来像一个巨大的、晃荡的飞艇，当埃克斯加图安注视着她时，你感觉你的舌头就像一条好奇的蛇一样在嘴唇上闪烁。[pg]");
         outputText("她仍然被塞在恶魔慢慢变软的阴茎上，甚至无法站起来。女孩毫不在意，无助地咯咯笑着，等待埃克斯加图安将她从他的阳具控制中释放出来。恶魔做得更好；他不仅把他的男性象征从她现在大张的屁股里拔了出来，甚至在拔出后还走到她身边，给了她“一臂之力”。他伸出手，将手压在幽灵女孩不断膨胀的肚子上，然后向下推。她开始指责他粗暴的对待，但随着精液从她的喉咙里冒出泡泡，从她的嘴角漏出，这些话很快就变成了咯咯的尖叫声。与此同时，精液以极快的速度从她的肛门喷涌而出——当她被抽干精液时，可怜的女孩的眼睛翻向了对面的墙壁。[pg]");
         outputText("当一切尘埃落定，你昏昏沉沉地动了动。你眨了眨眼，赶走睡意，看着淹没街道的巨量精液，不由得愣住了。你感觉到终于疲软下来的阴茎里又传来一阵异样的感觉，于是低头看去。一股苍白透明的烟雾从你的尿道中缓缓飘出，重新凝聚成那个非常疲惫、有些酸痛，但却无比满足的幽灵女孩。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,360) == 0)
         {
            outputText("[say: 灵魂性爱……我不能说我曾经尝试过，] 她承认道。[say: 如果这都不算好，那还有什么算好呢。][pg]");
         }
         else
         {
            outputText("[say: 该死，] 她叹了口气，[say: 我得说，这仍然是一次很棒的体验……][pg]");
         }
         outputText("[say: 他们叫我“操逼恶魔”可不是白叫的，]你的鸡巴恶魔插嘴道。你们俩相视一笑，她友好地挥了挥手，转身离去。她蹚过地上那层精液，你忍不住注意到一滴白色的液体从她光着的屁股上滴落下来。那滴液体在精液中激起了一圈小小的涟漪。你摇了摇头，嘴角泛起一丝微笑。和幽灵做爱……真是太荒谬了。[pg]");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,360,FlagDict_Impl_.arrayReadInt(_loc2_,360) + 1);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function paladinModeFollowup() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         outputText("离开那位你曾表白过的纯真少女两天后，你感到了一丝轻微的焦虑。你的漫步将你带回了初次相遇的地方，果不其然，你听到附近一座破旧建筑里传来了声音。这位完全是人类的女孩很快再次站在你面前，你们相视一笑。[say: 最近过得怎么样？]她礼貌地问道，试图开启话题。你花了一小会儿时间描述你继续斩杀眼前一切腐化的任务，她全神贯注地听着你的每一个字，时不时地点头以示她在认真倾听。话题不可避免地转向了你们刚刚萌芽的关系，她那完全正常的棕色眼眸中闪烁起光芒。[say: 我们为什么不找个没人的地方继续聊呢？]她提议道，用出乎意料的有力手掌抓住你的手腕，将你领进她的住所。你低头钻过变形的入口，走进了小屋。令人惊讶的是，你注意到房间里陈设简陋，毫无杂物；简直就像她是由僧侣抚养长大的一样！[pg]");
         outputText("" + (ghostLoli() ? "女孩" : "女人") + "注意到了你的钦佩，并向你绽放了一个灿烂的笑容。无法抑制你对她的吸引力，你走向她，将一只手放在她娇嫩的肩膀上。你向她表白了你对她不朽的爱，尽管你的脸颊变暗了，你还是向前推进，并恳求她为了繁衍后代的唯一目的而进行双方同意的传教士式交媾。她的眼睛睁大了，她似乎又想告诉你什么，但她似乎无法做到。[say:愚蠢的男孩，]她对你嘟囔着，[say:向一个你刚刚认识的人提出如此淫秽和不合适的癖好要求。]你尴尬地移开视线，开始走开。肩膀上的轻拍让你的头转了回来，正好赶上受宠若惊的" + (ghostLoli() ? "女孩" : "女人") + "的一个吻。她从你身边挣脱，一条闪闪发光的小唾液线连接着你们的嘴唇。[say:愚蠢的男孩，]她沙哑地呼吸着，将你拉向前，放在她房间角落里那张铺得整整齐齐的床上。她的第一个动作，甚至在你想到指出它之前，就是点燃她床头柜上的蜡烛。确实，没有开灯就无法进行纯洁的结合！迷人的女孩拉开一个稍微腐烂的抽屉，伸手进去拿出一本风化的手册。[say:我从一个神秘的旅行商人那里买了这个，]她解释说，将她" + (ghostLoli() ? "娇小的" : "适中的") + "、健美的屁股扑通一声坐在床上。[say:它解释了如何取悦女人。][pg]");
         outputText("你开始问她为什么会拥有这样的东西，但她伸出一只手让你安静下来。她张开的手掌变成了一个让你坐在她旁边的手势，你顺从了，感到困惑。[say:要取悦一个女人，]她以一种夸张的清晰方式开始，[say:你必须首先让她知道你想要她-...]当你的手轻轻放在她的乳房上时，她被打断了，话语在她的喉咙里消失了。她把手册扔到一边，高兴地开始戏弄你未受腐化的男子气概。你已经受够了前戏；你神圣的法杖需要关注。当你脱下你的[armor]并将衣服放在床脚时，她的笑容变宽了，她也跟着做了。你们俩滑到床上，她假设了你下面的位置。最后深情地凝视着她的眼睛，你将你神圣的男子气概插入她等待的阴道。然后，你继续为了繁衍后代的唯一目的而在传教士的位置上进行双方同意的性行为……然而，你忍不住注意到她看起来有多无聊。你给了她一个特别用力的推力，她微微跳了一下，仿佛从白日梦中醒来。她的呻吟声，虽然听起来仍然奇怪地缺乏活力，但足以推动你达到高潮，以一种完全模糊但肯定性感的方式将你的种子存入她的子宫。经过几分钟的拥抱和依偎，你们都重新穿好衣服，你宣布你需要离开。她理解地点点头，当你离开她的家时，她跟着你走到路上。[say:哦，顺便说一句，]她喊道，好奇地把你转过来。[say:你刚才完全操了一个幽灵。][pg]");
         outputText("她的眼睛亮了起来，那双棕色的眼眸变成了两团邪恶的琥珀色火焰，她看着你完全惊呆的表情大笑起来。伴随着一个恶魔般的眨眼和一句[say: 我要变成鬼了！]的宣言，她化作无形，被一阵风卷走。当你追踪着她那如烟似雾的轨迹时，你坚定地咬紧了牙关。看来[say: 不死生物]又要回到你的[say: 报复性消灭]名单上了……不过，你不得不承认，她为了繁衍后代而进行的传教士体位双方同意的性行为感觉还挺不错的。对于一个怪物来说。");
         if(get_game().time.hours < 6 || get_game().time.hours >= 23)
         {
            outputText("[pg]你愤怒地打了个胶，并考虑要不要回去睡觉。");
         }
         get_player().orgasm("Dick");
         doNext(playerMenu);
      }
      
      public function ourDadTaughtUsNotToBeAshamedOfOurDicks() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,358) == 0)
         {
            outputText("她突然兴奋地倒吸了一口凉气，");
         }
         else
         {
            outputText("她回想起你的身体构造，轻柔地发出了“哦哦”的声音，");
         }
         outputText("你感觉到自己的手不受控制地向胯部移去。你迅速把这双不安分的手收回身侧，清楚地知道她想干什么。然而，在意志的较量中，幽灵女孩很快证明了她更胜一筹，最终你的意志崩溃了，她再次完全控制了你的身体。她强迫你的身体站起来，脱下你的[armor]并随意地扔在地上。她用双手握住你的" + get_player().cockDescript(_loc1_) + "，笨拙地抚摸着，显然对男性的身体构造缺乏经验。[say:我附身过的大多数宿主都是女性，]她一边解释，一边继续摸索着你不断变长的阴茎。[say:而且即便如此，我也很少有机会玩弄她们的……][pg]");
         outputText("当幽灵女孩重温她以前笨拙的附身经历时，你感到脸上泛起一阵红晕。你的阴茎终于伸展到了极限，你的双手在它上面笨拙却又出奇有效地上下滑动。当你跪倒在地时，汗水很快浸透了你的身体，你被这种简单的自我刺激带来的快感淹没，感到困惑不已。你自慰时从未感觉如此美妙！你觉得这位新“室友”的超自然影响肯定与此有关。仿佛是为了证明你的理论，你的嘴巴开始用女孩那种奇怪的古老语言说话，你的身体在痛苦和快感中僵硬，因为");
         if(get_player().balls > 0)
         {
            outputText("你的睾丸因充沛的生育力而翻腾，并且");
         }
         outputText("你的男子气概因新获得的粗壮而膨胀。这种生长迫使你的双手分得更开，直到你那颤抖的肉棒看起来就像一个非常兴奋的消防栓。口水开始从你的嘴角流下，她咬住你的下唇，在刺激的狂喜中向后仰起头。最后，你感觉到阴囊一阵紧缩。幽灵女孩完全沉浸在你身体高潮的奴役中，所以你自己把手移到了肉棒的底部。令人惊讶的是，你真的感觉到精液在你的手指下蠕动着准备释放。伴随着一声兼具幽灵和人类特征的狂喜尖叫，你的背部弓起，一股精液如间歇泉般喷涌而出，像喷泉一样洒落在你身上。在跪着颤抖了很长一段时间后，你终于恢复了理智，重新站了起来，注意到你那位非实体朋友不再反抗。当你看着现在疲软的阴茎缩小到原来的比例时，你松了一口气。[pg]");
         outputText("你的腹部开始产生一种奇怪的感觉，你好奇地将手按在肉体上。你迅速把手移开，因为一个熟悉的脑袋突然钻了出来，扭动着直到面对你。她笑了笑，然后把手臂从她的躯干里抽出来，以此为杠杆（伴随着一句低语的咒语，让她的手变得有形），将自己完全从你体内拔了出来。她嘟囔着一句咒语，再次凝固了她那不起眼的身形，向你眨了眨眼，拿起她的束腰外衣，套在身上。在你的注视下，她将拇指和食指伸进她那满足的小穴里，挤出了一大团黏糊糊的幽灵物质。她把手伸进束腰外衣的口袋里，掏出一个小瓶子，迅速把灵质挤了进去。她把瓶子递给你，解释道：[say:这算是一个……幽灵高潮的产物吧。留着吧，对你有好处。]她高兴地道了别，走进一条小巷，顺手抓起她那破烂的紧身裤和丢弃的鞋子，消失在阴影中。你正准备离开，却发现你的[legs]变得沉重，附身后的疲惫感席卷而来。不知不觉中，你已经跪倒在地，不得不努力不让眼皮耷拉下来。你屈服于疲惫，瘫倒在地，很快就满足地打起了呼噜。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,358,FlagDict_Impl_.arrayReadInt(_loc2_,358) + 1);
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function nowOnVickiLake() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("一时冲动之下，你转过身，开始坚定地向最近的地标进发：湖泊！这花了一点时间，但你最终找到了正确的路线并开始跋涉。幽灵女孩开始在你体内搅动，你感觉到她的灵魂正向你的二头肌集中。一张类似她人类形态的脸从皮肤里凸了出来，她耐心地等待着你从她长满雀斑的脸出现在你手臂上的最初震惊中缓过来。[say: 你要去哪？] 她终于担忧地问道。[say: 我还以为我们要高潮了呢！] 你恳求她等着看，她轻哼了一声，在焦急的期待中退回了你的体内。[pg]");
         outputText("你想寻找哪种遭遇？");
         menu();
         if(get_player().hasStatusEffect(StatusEffects.BoatDiscovery) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) > 0)
         {
            addButton(0,"鲨鱼",sharkbustersVictory);
         }
         else
         {
            addButtonDisabled(0,"鲨鱼");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,364) > 0)
         {
            addButton(1,"软泥",ghostGooGurlzDuckfaces);
         }
         else
         {
            addButtonDisabled(1,"软泥");
         }
      }
      
      public function novemberAlphaHotel() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl());
         clearOutput();
         outputText("你慢慢摇了摇头，举起你的[weapon]注视着她。[say:啊，所以你想这样？]她娇笑着，脸上浮现出笑容。[say:既然如此，废话少说……看招！][pg]");
         startCombat(new Shouldra());
      }
      
      public function noSlimingSlimer() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你生气地对着这个厚颜无耻的女孩摇了摇头，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) == 0)
         {
            outputText("不想理会这个奇怪女孩的任性要求。");
         }
         else
         {
            outputText("对让幽灵附身于你的身体的想法感到困惑。");
         }
         outputText("你转过身，大步走开。她站起来，尖叫道：[say: 好吧！我再去附身一只该死的地精好了！] 然后气冲冲地朝另一个方向走去。在你走远之前，你听到那个离去的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) == 0)
         {
            outputText("女孩传来一声抽泣——但她说的“附身”地精是怎么回事？");
         }
         else
         {
            outputText("幽灵传来一声抽泣，一阵内疚感涌上你的心头。");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function noCourtingYouFag() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl());
         outputText("");
         outputText("你赶紧告诉她这是一个误会；你的骑士团肯定不会允许这样的关系。她点点头，似乎并没有因为被拒绝而感到困扰。[say: 真遗憾。那么，再见了，圣骑士朋友，]她说着，转身走回她的小屋。[say: 也许我们还会再见面的。]你留在原地目送她离开，不久后你也启程了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function loseToShouldraWithWorms() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,359) == 0)
         {
            outputText("她突然兴奋地倒吸了一口凉气，");
         }
         else
         {
            outputText("她回想起你的身体构造，轻柔地发出了“哦哦”的声音，");
         }
         outputText("你感觉到自己的手不受控制地向胯部移去。然而，在意志的较量中，幽灵女孩很快证明了她更胜一筹，最终你的意志崩溃了，她夺取了控制权。她把你的身体从地上拽起来，脱下你的[armor]并随意地扔在地上。她用双手握住你的[cock]，笨拙地抚摸着，显然对男性的身体构造缺乏经验。[say:我附身过的大多数宿主都是——这他妈是什么鬼！？][pg]");
         outputText("她笨拙地把你的身体向后抛去，同时把你的骨盆向前推（仿佛是为了尽可能地远离你那被污染的肉体），因为几条虫子从你的尿道口蠕动着爬了出来。当她看着它们时，你的整个身体都在发抖。[say:为什么会有东西从你的鸡巴里爬出来？]她质问道，当另一条虫子掉出来时，她再次尖叫起来。你没有注意到，但当你向她解释你感染了这些东西时，你的眼睛从黄色变回了正常的颜色。你试图向她保证它们大部分时间都不会碍事，以此来安抚她，但她显然已经受够了这些东西。还没等你反应过来，她就从你的身体里流了出来，变回了肉体形态。当她的脚刚变得足够坚实可以行走时，她就踉跄着后退，脸上流露出惊恐的表情。你做了最后一次挽救局面的尝试，提议道：[say:嘿，至少它们很小，对吧？][pg]");
         outputText("幽灵女孩的反应是迎上你的目光，恶狠狠地盯着你，还没等你阻止她，她就向你扑来，转过身，一脚踢在你的脖子侧面。你摔倒在地，摇摇晃晃地抬起头，看着她跺着脚走开，嘴里还嘟囔着关于虫子和变态恋物癖的话。路面迎面扑来，世界逐渐消失，你陷入了昏迷。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,359,FlagDict_Impl_.arrayReadInt(_loc1_,359) + 1);
         get_player().takeDamage(10000);
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToShouldraAsHerm() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,362) == 0)
         {
            outputText("她突然兴奋地倒吸了一口凉气，");
         }
         else
         {
            outputText("当她回想起你的身体构造时，她发出了轻柔的咕哝声，");
         }
         outputText("你感觉到你的双手不由自主地向你的胯部移动。你迅速将这双不听使唤的手收回身侧，因为你完全知道她想干什么。然而，在意志的较量中，这个幽灵女孩很快证明了她更胜一筹，最终，你的意志崩溃了，她再次完全控制了你的身体。她强迫你的身体站起来，脱下你的[armor]并随意地扔在地上。她用双手握住你的[cock]，笨拙地抚摸着，显然对男性的身体构造缺乏经验。[say: 我附身过的大多数宿主都是女性，]她一边解释，一边继续摸索着你不断变长的阴茎。[say: 即使那样，我也很少有机会玩弄她们的……][pg]");
         outputText("当幽灵女孩重温她以前尴尬的附身经历时，你感到你的脸涨得通红。你的阴茎终于伸展到了它的最大长度，你的双手在它的长度上笨拙但确实有效地上下滑动。当你的其中一只手滑得更低，擦过一个完全属于女性的阴道时，她惊讶地“哦”了一声。");
         if(get_player().balls > 0)
         {
            outputText("她停下了双手的抚摸，将你的手滑到你那碍事的[balls]下面，轻轻地将它们推开，以便更好地观察你之前未被注意到的女性特征。");
         }
         outputText("她邪恶地轻笑着，你呻吟着，脑海中盘旋着女孩冲动可能带来的后果。你的嘴唇不由自主地卷起一个邪恶的微笑，然后开始默念一个古老的咒语，你在心里退缩，做好了最坏的打算。她念完咒语，又回到了剧烈的抚摸中，留下你独自纳闷这个咒语是用来干什么的——直到你感觉到一种刺痛感从你的[cock]根部开始，慢慢地爬上肉棒，直到你的整个长度都被这种感觉覆盖。[pg]");
         outputText("当你的骄傲、坚硬的阴茎变得更加有弹性时，你的眼睛睁大了。随着幽灵女孩继续抚摸，你对这种奇怪的感觉感到惊叹，它灵活却依然坚挺。她突然停了下来，开始将肉棒向下弯曲，你很清楚她打算用你那被魔法改变的男子气概做什么。果不其然，她迅速将你弯曲的阴茎绕过来，牢牢地插入你的小穴中，创造了你所经历过的最令人困惑的兴奋感。她继续推，直到你的肉棒达到极限，能够将整个东西塞进你那流着淫液的裂口中。");
         get_player().cuntChange(get_player().cockArea(0),true);
         outputText("在你目前的位置上做不了什么，幽灵女孩再次开始施法，声音中带着坚定的边缘。刺痛感再次出现，这次从你的头部开始并加剧。当你的龟头开始振动和扭动，比任何假阳具都能更好地刺激你的通道时，你猛地吸了一口气。振动对阴茎本身也有类似的影响，当刺痛感爬上你的肉棒时，你忍不住呻吟起来。这种紧张感持续了令人印象深刻的时间，而幽灵女孩对你的忍耐力感到厌烦，大喊了一个词，加剧了你阴茎的推挤，并从你那里引出了一声喉咙里的咯咯声。任何克制的概念在刺激下都很快被粉碎，你高潮了，在开裂的路面上扭动着，因为幽灵协助的自我操弄的实际发生而在狂喜中大叫。你的精液穿过你畸形的尿道的旅程只会把你推向更远的边缘，弯曲导致了精液的轻微“交通堵塞”，并进一步拉伸了尿道。[pg]");
         outputText("最后，精液以爆炸性的飞溅溢出到你的肉欲通道中，你的尖叫声只会加剧，幽灵女孩用她自己悠扬的声音在你的脑海中加入。一股又一股的精液喷涌进你的体内。你振动的头部防止精液漏出，而你的肚子则稍微突出以容纳它们。在许多幸福的时刻之后，你的高潮平息了，你崩溃了。幸运的是，你仍然保持着足够的理智，将你的阴茎（随着振动的减弱）拖回露天，女性爱液和精液的洪流倾泻而出，聚集在你的[ass]周围。你躺在那里几分钟，恢复理智，感觉到你的阴茎逐渐再次变硬，效果消失了。经过几次尝试，你设法召唤出足够的力量滑入坐姿，想知道现在会发生什么。[pg]");
         outputText("你的腹部开始产生一种奇怪的感觉，你好奇地将手按在肉体上。你迅速把手移开，因为一个熟悉的脑袋突然钻了出来，扭动着直到面对你。她笑了笑，然后把手臂从她的躯干里抽出来，以此为杠杆（伴随着一句低语的咒语，让她的手变得有形），将自己完全从你体内拔了出来。她嘟囔着一句咒语，再次凝固了她那不起眼的身形，向你眨了眨眼，拿起她的束腰外衣，套在身上。在你的注视下，她将拇指和食指伸进她那满足的小穴里，挤出了一大团黏糊糊的幽灵物质。她把手伸进束腰外衣的口袋里，掏出一个小瓶子，迅速把灵质挤了进去。她把瓶子递给你，解释道：[say:这算是一个……幽灵高潮的产物吧。留着吧，对你有好处。]她高兴地道了别，走进一条小巷，顺手抓起她那破烂的紧身裤和丢弃的鞋子，消失在阴影中。你正准备离开，却发现你的[legs]变得沉重，附身后的疲惫感席卷而来。不知不觉中，你已经跪倒在地，不得不努力不让眼皮耷拉下来。你屈服于疲惫，瘫倒在地，很快就满足地打起了呼噜。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,362,FlagDict_Impl_.arrayReadInt(_loc1_,362) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function loseToShouldra() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你伴随着沉闷的扑通声倒在废弃的道路上，被这个看似不起眼的年轻" + (ghostLoli() ? "女孩" : "女人") + "彻底打败了。当你挣扎着站起来时，她漫不经心地走到你面前，双手叉腰，低头看着你。你僵住了，不想对这个不可预测的对手做出任何突然的举动。她慢慢脱下宽松的束腰外衣，露出她那" + (ghostLoli() ? "小巧但好捏的A" : "坚挺且好捏的C") + "罩杯。奇怪的是，她踢掉了舒适的鞋子，却留下了紧身打底裤。你怀疑有什么不对劲，当她跨坐在你身上时，你挑了挑眉毛。出乎意料的是，她跳起来并完全转过身，落在你的腹部，屁股对着你，力度大到让你发出一声“呃”。你低头看着她；她半转过身，调皮地（带着一丝恶意的意图）看着你。你的肚子传来一阵轻微的隆隆声，这是你得到的唯一警告，然后她的打底裤突然奇怪地鼓了起来，里面包含的肉量比前一刻大得多。她的屁股继续肿胀，开始在越来越紧的腰带上方翻滚，你忍不住举起一只手，捏住那不断膨胀的臀肉。当它在你的手周围进一步跳动，挤压得更深时，你享受着这种感觉。随着她的臀部加入生长的行列，布料上开始形成小裂缝，不断增加的后部让她随着时间的推移微微抬高。");
         if(get_player().hasCock())
         {
            outputText("每一次跳动都将她进一步推向你变硬的命根子");
         }
         else if(get_player().hasVagina())
         {
            outputText("你无法否认你的下体慢慢涌起的灼热，你的爱之通道变得越来越湿润");
         }
         else
         {
            outputText("你无法否认热量慢慢开始聚集在你赤裸的下体");
         }
         outputText("。最后，她那可怜的衣服的腰带爆裂了，几把臀肉溢到了你的躯干上。[pg]");
         outputText("你想知道那有什么意义，你抬起头，瞥了一眼她的脸，现在至少比刚才高了四英寸。她伸出手，给了你的");
         if(get_player().hasCock())
         {
            outputText("颤抖的命根子");
         }
         else if(get_player().hasVagina())
         {
            outputText("湿透的裂口");
         }
         else
         {
            outputText("敏感的胯部嫩肉");
         }
         outputText("漫不经心的一抚，然后闭上眼睛，开始用一种奇怪的语言吟唱，她的声音听起来就像微风吹过树丛。当你看到淡蓝色的火焰勾勒出她的身体，她的形态变得……不那么实体化时，你睁大了眼睛。她睁开眼睛，以前棕色的虹膜现在闪烁着苍白的黄光。她低语着咒语的最后一个词，有一瞬间，什么也没发生……直到，令你惊讶的是，她开始沉入你的躯干！[say: 嘘！]她发出一声可爱的咯咯笑声。你开始站起来，但随着她超凡脱俗的影响力开始渗透你，你僵住了。再次倒下，你努力与不受欢迎的入侵者抗争，但无济于事；在这一点上，她已经下沉到肩膀，当她的头下降时，她兴奋地向你眨了眨眼。当幽灵女孩与你争夺肌肉控制权时，你的手指抽搐了大约一分钟。然而，最终，她找到了一种控制方法；你已经高涨的性欲。你的头脑变得模糊，唯一清醒的时刻充满了足以让最坚强的圣骑士脸红的反常刺激。[pg]");
         outputText("当你终于从幽灵影响的幻象中走出来时，你发现自己不情愿地坐了起来，幽灵女孩开始自由地探索你的身体。伴随着沮丧的叹息，你将身体的控制权让给了幽灵女孩——至少暂时如此。在她的控制下，你的身体做出反应，将你的眼睛颜色转变为与她幽灵形态相同的黄色调。[pg]");
         if(get_player().get_gender() == 1)
         {
            if(get_player().hasStatusEffect(StatusEffects.Infested))
            {
               loseToShouldraWithWorms();
            }
            else if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
            {
               ghostGartuanLossSceneOrSomeShit();
            }
            else if(get_player().biggestCockArea() >= 200)
            {
               shouldraGiantCockLoss();
            }
            else
            {
               ourDadTaughtUsNotToBeAshamedOfOurDicks();
            }
         }
         else if(get_player().get_gender() == 2)
         {
            ghostGinaLosses();
         }
         else if(get_player().get_gender() == 3)
         {
            if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
            {
               ghostGartuanLossSceneOrSomeShit();
            }
            else if(get_player().biggestCockArea() >= 200)
            {
               shouldraGiantCockLoss();
            }
            else
            {
               loseToShouldraAsHerm();
            }
         }
         else
         {
            genderlessShouldrasLossRapes();
         }
      }
      
      public function littlePigLittlePigLetMeIn() : void
      {
         var _loc2_:* = null as Object;
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你决定");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) == 0)
         {
            outputText("你可以对这个明显绝望的女孩稍微冒点险");
         }
         else
         {
            outputText("有个幽灵跟班可能会有点意思");
         }
         outputText("，并同意了她附身你的请求。她摇摇晃晃地站起来，脱下衣服，因为无法满足的性欲而喘息和颤抖着。你向她伸出手，将她拉");
         if(get_player().get_tallness() < 84)
         {
            outputText("入怀中紧紧拥抱");
         }
         else
         {
            outputText("起抱入怀中紧紧拥抱");
         }
         outputText("。年轻的" + (ghostLoli() ? "女孩" : "女人") + "发出一声幸福的叹息，然后开始对着你的肩膀嘟囔着咒语。很快，女孩的身体变得半透明，她开始融入你的体内，在进去的时候还在你的脸颊上轻轻啄了一下。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) == 0)
         {
            outputText("等等……什么！？你刚才是不是让某种……" + (get_silly() ? "幽……幽……幽……幽……幽……幽灵" : "幽灵") + "附身了？");
         }
         outputText("[say: 该、该死，] 她叹了口气，声音因为积聚的欲望而颤抖，[say: 得习惯这些[skinfurscales]……] 你尽最大努力适应与一个幽灵共享身体的事实，然后将注意力转向她。你通过心灵感应问她，对于缓解她的欲望，她有没有什么特别的想法。她向你传回一声“嗯”，表示她允许你来决定她的命运。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,353,FlagDict_Impl_.arrayReadInt(_loc1_,353) + 1);
         menu();
         switch(get_player().get_gender())
         {
            case 0:
               _loc2_ = genderlessGhostBuster;
               break;
            case 1:
               _loc2_ = penisLossThatIsntALoss;
               break;
            case 2:
               _loc2_ = ghostGinaWinSexings;
               break;
            case 3:
               _loc2_ = hermaphroditeGhostsCumEctoplasm;
               break;
            default:
               _loc2_ = null;
         }
         addButton(0,"就地做爱",_loc2_);
         if(get_player().get_gender() > 0 && (get_player().hasStatusEffect(StatusEffects.BoatDiscovery) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,364) > 0))
         {
            outputText("你可以带她去湖边找个人玩玩……[pg]");
            addButton(1,"湖边",nowOnVickiLake);
         }
         else
         {
            addButtonDisabled(1,"湖边");
         }
      }
      
      public function letShouldraIn() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("当你允许她部分控制时，幽灵女孩兴奋地尖叫起来——只够她感觉到你的阴茎，就像那是她自己的一样。伴随着狂喜、胜利的尖叫，她将自己刺穿在你的肉棒上，把整个东西吞进喉咙，就像什么都没发生一样。你的精液如喷气流般射入她的嘴里，把她的头直接从你的肉棒上炸飞，撞到你的[chest]上，发出一声[say: 哎哟。][pg]");
         ghostBJFinisher(true);
      }
      
      public function kickShouldraOut() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你提醒她这是对她低估你的惩罚，你坚决拒绝了她进入的请求。她明亮的黄色眼睛因失望而变得呆滞，但她不敢违背你的意愿。幽灵女孩转过身，机械地回到她的工作中。然而，当她把起皱的嘴唇滑下你抽搐的肉棒时，你已经超过了忍耐的极限，一股精液把她的头直接从你的肉棒上抬了起来。她的后脑勺撞到你的[chest]上，发出一声[say: 哎哟。][pg]");
         ghostBJFinisher(false);
      }
      
      public function hermaphroditeGhostsCumEctoplasm() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,362) == 0)
         {
            outputText("她突然兴奋地喘着粗气，开始把手伸向你的腹股沟，尽管你迅速夺回了对这不听话的附属物的控制权。[say:你有一个阴茎，]她通过心灵感应向你发送脉冲，声音中带着焦虑和兴奋的边缘。[say:我的宿主……他们很少……他们……]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,362) > 0)
         {
            outputText("当她回忆起你们分享的时光时，她轻声笑着，并再次饥渴地扑向你的男性特征，尽管你在精神上把她甩开了。");
         }
         outputText("随着幽灵女孩的意志与你对抗，交流突然中断，她脑海中所有顺从的念头都消失了。");
         if(get_player().get_inte() < 50)
         {
            outputText("她很容易就打破了你的防线，你很快就感觉到自己被她庞大的精神力量推到了一边。");
         }
         else
         {
            if(!(get_player().get_inte() < 90 || get_player().cockThatFits(80) == -1))
            {
               _loc1_ = get_player().cockThatFits(80);
               outputText("幽灵女孩进行了顽强的抵抗，但你对她的精神攻击早有准备。当她的入侵被压倒时，你感觉到她的恐慌，虽然她试图切断精神链接，但你轻松地阻止了她。她在精神上向你尖叫抗议，但你耳边的嗡嗡声只会加强你对这个可怜幽灵的心理支配。没过多久，她就变成了一个呜咽的废人。[say:出去，]你命令道，厌倦了这个麻烦幽灵的干涉。当然，她现在甚至不会尝试反抗，顺从地聚集她的精华并开始退出。片刻之后，幽灵女孩从你的身体里流出，并在你面前重新凝固。[pg]");
               outputText("她气呼呼地想要离开，但你用一个心灵感应的要求阻止了她。你提醒她，她是你的，既然她费尽心思想要让你高潮，她不妨把工作做完。即使她撅起嘴唇，倔强地撅着嘴，一股支配性的影响浪潮席卷了她，不管她自己怎么想，她开始摇摇晃晃地向你走来。你决定在中间相遇，大步走到她面前，把她推倒在膝盖上。当她看着的时候，你脱下你的[armor]，把你的" + get_player().cockDescript(_loc1_) + "举到她的唇边，留下了你期望的相当清晰的暗示。幽灵女孩看到你的男子气概时睁大了眼睛，当新一波的性欲席卷她时，她退缩了。她因为无法平息自己压倒性的性欲而发出一声小小的呜咽，但你只是嘲弄地笑了笑，指了指你的男性特征。[say:幽灵口交，]你冷嘲热讽地嘟囔着。[pg]");
               outputText("你甚至不给她自己行动的机会，直接伸出手，抓住她的头，把她按在你的" + get_player().cockDescript(_loc1_) + "上。她接受得惊人地好，也毫不意外地轻松，第一下就吞下了大部分肉棒。她甚至没有发出一声闷哼，就不耐烦地双手抓住你的[ass]，把头往前凑。还没等你反应过来，你整根" + get_player().cockDescript(_loc1_) + "就已经被包裹在一条肉感的爱之隧道里了。");
               if(get_player().cockTotal() > 1)
               {
                  outputText("注意到");
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("你的另一根肉棒");
                  }
                  else
                  {
                     outputText("剩下的[cocks]");
                  }
                  outputText("，这个被精神控制的女孩迅速抓住了");
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("你的另一根肉棒，用力地套弄起来。");
                  }
                  else if(get_player().cockTotal() == 3)
                  {
                     outputText("你的另外两根肉棒，用力地套弄起来。");
                  }
                  else
                  {
                     outputText("另外两根肉棒，用力地套弄起来。");
                  }
               }
               outputText("[pg]");
               outputText("幽灵女孩在你的下体上大干特干，你的意志和她不断高涨的欲望共同驱使着她的动作。[pg]");
               outputText("尽管她的嘴被塞得满满的，但当她开始施放法术时，她的声音清晰地在你的脑海中响起。你低头看着她，从她近乎平静的表情和深邃的眼眶中猜测，她甚至已经克服了无法高潮的障碍。她像往常一样华丽地完成了法术，然后再次将注意力集中在取悦你上。");
               if(get_player().cockTotal() == 2)
               {
                  outputText("将手从你的另一根肉棒上移开，这名");
               }
               else if(get_player().cockTotal() >= 3)
               {
                  outputText("将双手从你的其他肉棒上移开，这名");
               }
               else
               {
                  outputText("这名");
               }
               outputText("幽灵女孩含着你的肉棒笑了起来，你只能猜测她有什么计划。然而，你并没有等太久；一股奇怪的翻滚感出现在");
               if(get_player().balls > 0)
               {
                  outputText("你的[balls]里");
               }
               else
               {
                  outputText("你的肉棒根部附近");
               }
               outputText("。");
               if(get_player().balls == 0)
               {
                  outputText("当一个沉甸甸的精囊形成并垂在你的双腿之间时，法术的初步效果以一种夸张的方式显现出来。");
               }
               outputText("这种奇怪的感觉集中在你的睾丸上，让你很难集中精力去压制这个幽灵女孩。你对意志力的控制一直没有动摇，直到你感觉到你的双腿被推得更开。好奇的瞥视变成了惊恐的凝视，因为你看到了你现在");
               if(get_player().ballSize > 10)
               {
                  outputText("巨大无比");
               }
               else
               {
                  outputText("篮球");
               }
               outputText("大小的蛋蛋。[pg]");
               outputText("趁你分心，你曾经的心灵奴隶将你推倒并骑在你身上。她那无力却湿透的阴户在你的肚子上留下了一道道清澈的淫液，同时她继续在你的肉棒上套弄着");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("并来回扭动着臀部。她的双手开始揉搓你不断变大的睾丸，但两只手无法覆盖越来越大的面积来进行有效的刺激。她耸了耸肩，满足于拍打、挠痒和挤压她能触及的皮肤。你那巨大的精囊里开始剧烈翻滚，这种动静甚至让地面都震动了起来。你们俩都知道这意味着什么，幽灵女孩甚至停下了狂热的口交，渴望地盯着你。看来你掌握着满足她欲望或拒绝她渴望的高潮的关键；你要怎么做？");
               menu();
               addButton(0,"让她高潮",letShouldraIn);
               addButton(1,"把她赶出去",kickShouldraOut);
               return;
            }
            outputText("你开始占据上风，但幽灵女孩比你想象的要狡猾，她开始向你发出精神入侵的脉冲，扰乱你的思绪，这时间刚好够她超过你并把你推到一边。[say:你想挑战我还早了一百年呢，]她责备道。[say:我的智力早就超过了这个位面上的大多数生物。]");
         }
         outputText("[pg]");
         outputText("她完全控制了你的身体，就好像这具身体从来不属于你一样。她脱下你的[armor]，随意地扔在地上。她用双手抓住你的" + get_player().cockDescript(_loc1_) + "，笨拙地抚摸着。尽管她很聪明，但显然对男性的生理构造缺乏经验。她继续摸索着你不断变长的阴茎，承认道：[say: 即使在我附身过的少数男性身体里，我也很少有机会玩弄他们的……][pg]");
         outputText("当幽灵女孩回味她以前那些尴尬的附身经历时，你感到脸上泛起一阵红晕。你的阴茎终于完全勃起，你的双手在它上面笨拙但相当有效地上下滑动。当你的其中一只手滑得更低，擦过一个完完全全的女性小穴时，她惊讶地“哦”了一声。");
         if(get_player().balls > 0)
         {
            outputText("她停下了双手的抚摸，将你的手滑到你那碍事的[balls]下面，轻轻地将它们推开，以便更好地观察你之前未被注意到的女性特征。");
         }
         outputText("她恶意地轻笑着，你呻吟了一声，脑海中盘旋着这个女孩冲动之下可能造成的后果。你的嘴唇不由自主地卷起一抹邪恶的微笑，然后开始默念一句古老的咒语。你内心退缩了一下，做好了最坏的打算。她念完咒语，又回到了剧烈的套弄中，而你只能猜测那个法术是用来做什么的——直到你感觉到你的" + get_player().cockDescript(_loc1_) + "根部开始发麻，慢慢地爬上阴茎干，直到你整个阴茎都被这种感觉覆盖。[pg]");
         outputText("当你那骄傲、坚硬的阴茎变得明显更有弹性时，你睁大了眼睛。随着幽灵女孩继续套弄，你惊叹于这种奇怪的感觉，灵活却依然坚挺。她突然停了下来，开始将阴茎干向下弯曲，你很清楚她打算用你那被魔法改变的命根子做什么。果不其然，她迅速将你弯曲的阴茎绕过来，牢牢地插入你的小穴，创造了你所经历过的最令人困惑的兴奋感。她继续推进，直到你的阴茎干达到极限，将整个东西塞进你那流着淫液的裂口中。");
         get_player().cuntChange(get_player().cockArea(_loc1_),true,true,false);
         outputText("在你目前的姿势下，幽灵女孩做不了什么，她再次开始施法，声音中带着坚定的边缘。刺痛感再次袭来，这次从你的头部开始并不断加剧。当你的龟头开始振动和扭动，比任何假阳具都能更好地刺激你的通道时，你猛地吸了一口气。振动对阴茎本身也有类似的影响，当刺痛感爬上你的阴茎干时，你忍不住呻吟起来。这种紧张感持续了令人印象深刻的时间，幽灵女孩对你的忍耐力感到厌烦，大喊了一个词，加剧了你阴茎的推挤，让你发出了沙哑的咕噜声。任何克制的概念在刺激下都迅速粉碎，你高潮了，在开裂的路面上扭动着，因为幽灵协助的自我操弄而狂喜地大叫。你的精液穿过你畸形的尿道，弯曲导致精液出现小小的“交通堵塞”，将尿道进一步撑开，这只把你推向了更深的边缘。[pg]");
         outputText("最后，精液爆炸性地溅入你的肉欲通道，你的尖叫声更加强烈，幽灵女孩用她自己悠扬的声音在你的脑海中加入进来。一股又一股的精液喷射进你的体内。你振动的龟头防止了精液漏出，而你的肚子则稍微凸起以容纳它们。在许多幸福的时刻之后，你的高潮平息下来，你瘫倒在地。幸运的是，你仍然保持着足够的理智，在振动减弱的情况下，将你的阴茎拖回外面，女性爱液和精液的混合物倾泻而出，在你的[ass]周围汇聚成一滩。你躺在那里几分钟，恢复理智，感觉你的阴茎逐渐再次变硬，效果已经消失。经过几次尝试，你设法鼓起足够的力气让自己滑入坐姿，想知道现在会发生什么。[pg]");
         outputText("她的欲望得到了满足，幽灵女孩从你的肚子里探出头来，流出来并重新组合成你最初遇到的那个普通的、棕色眼睛的女孩。几乎是事后才想起来，她微笑着，走向她的衣服并迅速穿上，然后向你挥了挥手，转过一个拐角，从视线中消失了。你决心再次找到她——她的魔法非常有趣！");
         get_player().orgasm("Vaginal");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,362,FlagDict_Impl_.arrayReadInt(_loc2_,362) + 1);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ginaBoobgartuanShouldra() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("[say: 哎，]她叹了口气，在你的身体里安顿下来，[say: 只有女人的部位……好吧……呃。]你能感觉到她的失望，不管现在的情况有多荒谬，你觉得让她开心起来会有所帮助。灵机一动，你开始挠痒痒并挑逗你的" + get_player().allBreastsDescript() + "。没过多久，幽灵女孩的抗议就变成了满足的咕哝声。[say: 那些……真不错，]她承认道，考虑到她的快乐，你更用力地揉捏着那对鱼雷，引得她发出一声轻喘。然而，你没有想到的是，你正在揉捏的这对超大球体里的住客。伴随着一阵真正把你的手震开的乳震，大恶魔埃克斯加图安猛地清醒过来。");
         outputText("[pg][say: 好了，这他妈的是什么鬼！？]过了好一会儿，你才意识到你的恶魔双峰指的是你临时的“室友”。还没等你开始解释，那个幽灵就把她的精华移到了你的肩膀上，她的头从皮肤里钻出来，为了更好地看清你那会动、会说话的" + get_player().allBreastsDescript() + "。");
         outputText("[pg][say: 这他妈的是谁？]她反驳道，尖锐的语气让你皱起了眉头。[say: 你为什么在这个女孩的胸部里？哦，还有——]她的话被打断了，脸扭曲成一副不舒服的表情。幽灵的头开始上下摆动，好像有什么东西在拉她的脚。伴随着一声短促的尖叫，她完全消失了，被拉回了你的身体，并且……进入了你的乳房？确实，你甚至能感觉到那个幽灵正在进入" + get_player().biggestBreastSizeDescript() + "，这种感觉让你忍不住打了个寒颤。当你好奇地把手移向你的天赋时，一个声音——肯定是那个幽灵女孩的——响了起来。[say: 哦，不！我被抓住了！]她哀嚎着，但尽管她这么说，你还是察觉到了几乎令人发腻的兴奋意味。当你正在思考她态度的转变时，你突然陷入了一种如梦似幻的恍惚状态。当你的视线清晰时，你看到了一个巨大房间里的两个身影。你注意到，墙壁有着一种可疑的肉质纹理。");
         outputText("[pg]结合房间半球形的形状，你很容易就能猜到这个“梦”发生在哪里。那两个身影移动了一下，你的视线被拉近了。你的目光立刻锁定在那个只能是埃克斯加图安的身影上，你忍不住盯着她的化身看。恶魔的" + get_player().allBreastsDescript() + "闪闪发光，被她眼中燃烧的邪能之火照亮。不知不觉中，你的目光开始向下移动，打量着她那不可思议的纤细腰肢和相对巨大的臀部。这位比例完美的女人走向跪着的幽灵女孩，她下半身的摇曳让你和幽灵都陷入了轻微的恍惚之中。");
         outputText("[pg]在你们俩做出反应之前，埃克斯加图安已经拉近了距离。恶魔故意用手指划过幽灵的下巴，轻轻地托起她的头。仿佛被纯粹的欲望所拖累，她慢慢地眨了眨眼，微微张开嘴唇，试图对恶魔说话。然而，她的嘴刚一长开，就被埃克斯加图安的[nipple]填满了，眼睛睁得大大的，随后便消失在视线中，因为你那堕落的模仿者将她巨大的乳房压在了幽灵的脸上。她长满雀斑的脸庞完全被肉海淹没了。在没有其他选择的情况下，幽灵只能开始热情地吸吮着那个凸起，在威胁要吞没她的乳房墙中发出幸福的呻吟。");
         outputText("[pg]这种吸吮的感觉瞬间传递到了你自己的胸部，你那无法动弹的身体被一波波的快感所折磨，这种快感是你从未想象过能从简单的吸乳中获得的。她的双手，直到现在还无力地垂在身体两侧，在明显的突发灵感下恢复了生机；一只手抬起来挠痒痒并挤压埃克斯加图安另一只更空虚的乳房，而另一只手则落到了食尸鬼的腿间。当幽灵女孩的手指刷过她的私处并引起真正的刺激时，她陷入了疯狂，尽可能用力地吸吮着恶魔的乳头。这个迷恋的幽灵不顾一切地摸索和摇晃着另一只巨大的乳房，同时在她那反常地有反应的肉壶上大干特干。");
         outputText("[pg]尽管吸吮的感觉很好，但你无法否认你对幽灵女孩近乎狂暴的反应感到兴奋。你愿意付出任何代价来控制哪怕一只手……但是，当然，埃克斯加图安知道这一点，现在是她在发号施令。纯白色的母乳像小河一样从恶魔的[nipple]流出，倒在幽灵女孩的手上，顺着她的下巴滴落。你和埃克斯加图安都能感觉到释放的到来，不断地积聚，直到……轰！一大股乳汁从她的乳头喷涌而出，大量的液体让幽灵的脸颊鼓了起来。她开心地大口吞咽着，甚至不让泌乳打断她的自慰。她大口大口地吞咽着那些东西，甚至连强大的埃克斯加图安似乎都对她的容量印象深刻。从你观察的地方，你可以清楚地看到幽灵女孩的肚子因为她肆意的消耗而迅速膨胀，很快就大到足以撞到埃克斯加图安的大腿。");
         outputText("[pg]这个超自然玩物的肚子咕噜咕噜地响，它装载的乳汁随着她的每一次动作而晃动。当恶魔把她推倒，踩在她超载的肚子上，迫使一点乳汁流出来顺着她的脸颊流下时，她的呻吟声变得更大了。幽灵女孩在这种对待下在狂喜中颤抖，当埃克斯加图安继续把脚踩进幽灵那像健身球一样的肚子里时，她只用高潮的叫声来回应。显然是对这种做法感到厌倦了，恶魔跪在幽灵的腿间，好奇地检查着她肿胀的阴唇。[say: 把它变大，]埃克斯加图安命令幽灵女孩，轻轻拍打着嘴唇来具体说明她的要求。[say: 大到足以容纳我想插入的任何东西。]");
         outputText("[pg][say: 当……当然……夫人，]幽灵喘息着，在开始她众多咒语中的一个之前，收集了一些理智。每当幽灵被戏弄时，无论是按压她的肚子还是弹击她颤抖的阴蒂，恶魔似乎都对她声音的颤抖感到愉悦。伴随着一声热情的尖叫，幽灵女孩完成了她的法术，回到挤压和摩擦她能带来快感的每一个部位，随着法术开始生效。就像一朵含苞待放的花朵，幽灵女孩的外阴在奥术力量的作用下肿胀起来，绽放成一片真正巨大的、柔软的血红色下体肉。");
         outputText("[pg][say: 完美，]埃克斯加图安满意地发出呼噜声，捏着并探测着她新发现的褶皱。这个精神奴隶的嘴巴张得大大的，舌头从一边伸出来，在恶魔戏弄的触摸下扭动着。仅仅用一声轻笑作为警告，埃克斯加图安尽可能地把嘴唇拉开，露出她黑暗的深处，引得幽灵女孩发出一声尖锐的惊叫。还没等她恢复过来，这个巨乳恶魔就托起她的一只[breasts]并向前倾身，毫不费力地将[nipple]和她的一大块乳房滑了进去。跪着的女孩发出一声咕哝，恶魔发出一声呻吟，这就足够了。幽灵女孩似乎连叫都叫不出来，因为她本来就圆滚滚的肚子被推高，为埃克斯加图安的乳房让路。完全在堕落的乳房恶魔的影响下，你模仿着这个动作，乳房在空气中被压缩。当这尴尬的一幕上演时，你的脸上泛起了强烈的红晕；你只能希望没有人偷看你。");
         outputText("[pg]幸好她是个幽灵，当你看着女孩可怜的肚子长到绝对荒谬的大小时，你心想。即使有了增强的肉壶，她的阴道壁压在埃克斯加图安的乳房上——推而广之，也是你的乳房，当你看着乳汁飞溅到地上时，你哀叹道——的压力，将一股浓郁的乳汁喷射到幽灵女孩的深处。恶魔发出恶魔般的咯咯笑声，抓住那个太大的肚子，压进去，迫使那个被塞满的幽灵发出咕噜声。");
         outputText("[pg]幽灵女孩拼尽全力想要抓住她的大肚子，但她甚至无法完全环抱住……她几乎连一半都够不到！埃克斯加图安兴奋地咯咯笑着，把她的乳房抽回一半，然后向后靠，将乳肉挤压在幽灵的下体上，引导它回到里面。这场奇异的乳交开始得很慢，然后随着幽灵女孩丰富的体液和埃克斯加图安自己的乳汁的润滑而加快了速度。");
         outputText("[pg]当女孩们进入节奏时，一首美丽的尖叫二重唱在巨大的肉质房间里回荡，幽灵女孩沉重的摇晃补充了恶魔笨重却轻盈的动作。很快，两个女孩都气喘吁吁，埃克斯加图安挤压并抚摸着她另一只无人看管的乳房。带着迅速接近高潮的狂热，埃克斯加图安用你所有的力量撞击幽灵女孩的深处，就在她的“闸门”打开的前一刻。");
         outputText("[pg]曾经像健身球一样的东西迅速膨胀到更加夸张的比例，因为她肚子和子宫里混合的乳汁相互碰撞。俯卧的幽灵咳嗽了一声，然后带着满足的哼哼声晕了过去。埃克斯加图安伴随着一声轻微的“啵”声从慢慢缩小的阴道中退出，动作流畅地站起身来，把手放在双腿之间。直到那时，当你感觉到大量的液体浸透了你的大腿（当然，因为你被迫模仿埃克斯加图安的动作），你才意识到；你刚才仅仅因为泌乳就高潮了！");
         outputText("[pg]她轻笑了一声，然后打了个响指，把你的感知拉回现实。你发现自己摆着和埃克斯加图安离开时一样华丽的姿势，你急忙调整了一下。你的腹部开始发出轻微的隆隆声和麻木感；幽灵女孩滚了出来，幸福地打着呼噜。对你和你的中段的完整性来说幸运的是，她的肚子恢复了紧绷的常态，但这并不能阻止她揉着自己的中段，偶尔发出呻吟。");
         outputText("[pg]尽管因为埃克斯加图安对你身体的对待而感到疲惫和有点酸痛，你还是保持着清醒的头脑弯下腰——把你的[breasts]推开——从她仍然张开的肉壶里舀起一点灵质。当你把幽灵女孩留在那里睡觉，走回营地时，你故意忽略了埃克斯加图安胜利的笑声。真是充实的一天。");
         get_player().orgasm("Tits");
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ghostLoli() : Boolean
      {
         if(get_npcSettings().shouldraChild)
         {
            return get_allowChild();
         }
         return false;
      }
      
      public function ghostIzmaPenis() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你迅速脱下衣服，将你的[armor]放在一边，展现出你那正在勃起的[cocks]的全部荣耀。幽灵女孩看到这一幕，眼睛一亮，甚至允许自己微微晕眩了一下（考虑到她现在这副强悍的鲨鱼般的躯体，这看起来绝对很滑稽），她注视着你的男子气概。");
         outputText("她踉跄着向前走去，在你面前跪下");
         if(get_player().balls > 0)
         {
            outputText("并以几乎虔诚的温柔捧起你的[balls]，用她粗糙的鲨鱼皮手指尽可能轻柔地滑过你的阴囊");
         }
         outputText("。[pg]");
         outputText("她抬起下巴，用舌头滑过你龟头的底部，奇妙地刺激着它，让你不由自主地因为期待而紧张起来。她睁大眼睛，露出一个只承诺快乐的笑容，温柔地引导你走向船，你顺从地登上了搁浅的船只，在甲板上伸展身体，鲨鱼幽灵紧随其后。她俯下身，薄薄的嘴唇形成一个“O”形，靠近你的肉棒。然而，当她的脸颊被你的龟头戳到时，她的计划改变了……这个龟头突然比它应该在的位置离你的臀部远了至少六英寸。你用担忧的目光注视着幽灵女孩，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,355) == 0)
         {
            outputText("她的表情表明她和你一样毫无头绪。");
         }
         else
         {
            outputText("当她意识到自己再次在施法中犯了“错误”时，她只是笑了笑。");
         }
         outputText("[say: 这根本不是法术应该有的样子，] 女孩若有所思地说，舔了舔嘴唇");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,355) == 0)
         {
            outputText("心不在焉地思考着是什么导致了你下体的变长");
         }
         else
         {
            outputText("期待着你们俩即将再次经历的体验");
         }
         outputText("。当她的嘴唇撅起时，你的下巴都惊掉了，突然看起来比以前更加性感和丰满。你的精神诱惑者也迅速注意到了这一点，她的嘴唇卷起一个调皮的微笑");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,355) == 0)
         {
            outputText("当她推断出这个法术的性质时。[say: 我想……哦，天哪……我宿主的唾液可能对……身体的性特征有膨胀作用，]她解释道。[say: 所以，如果我这样做……]");
         }
         else
         {
            outputText("[say: 你看看，我的魔法唾液还有效！不如我直接……]");
         }
         outputText("[pg]");
         outputText("还没等你阻止她，她就把头凑到你抽搐的肉棒上方，张大了嘴巴。一股由她的唤情和无疑是魔法影响混合而成的口水倾泻而出，溅在你的男性象征上");
         if(get_player().balls > 0)
         {
            outputText("还有那轻轻翻腾的阴囊上");
         }
         outputText("。你瑟缩了一下，然后随着被施了魔法的唾液开始生效而挣扎起来。[say: 真是个有趣的错误，]她若有所思地说，你感觉到她既是在对你说话，也是在对那个沉睡的鲨鱼女孩说话。她坐起身，将唾液流直接向下引，冲刷着她的乳房，同时将唾液揉进那小巧——但很快就不再小巧——的胸部，甚至懒得脱下比基尼。她的双手仍然滴着水，耸了耸肩，向后伸手，双手在紧绷的屁股上拍了一下，将剩下的液体均匀地涂抹在她的臀肉和尾巴上，最后用手顺着丁字裤的前面滑下，用唾液换取淫液。她抬起头，看着你那跳动、发红的阴茎，踮起脚尖去够它，双手抓住你的龟头，将嘴唇紧紧贴在你的开口上。她让唾液顺着你的肉棒流下，当你的阴茎比以前更快地膨胀时，你几乎要尖叫起来。随着你的肉棒变宽并向前生长，几个令人不安的唤情时刻过去了，让人想起一棵快速生长的树苗。当一切尘埃落定，你的阴茎就像一艘静止的湖船上的一根肉质桅杆。仿佛直到那时才意识到她的鲨鱼女孩身体发生的变化，幽灵狂喜地叫了起来，因为她的尺寸在衣服下凸起。她的乳房肿胀起来，在她的上衣下奇怪地扭曲着，她轻轻摇晃了一下肩膀，惊叹于她新乳房的摇晃程度。与此同时，她新的翘臀几乎吞没了她紧绷的丁字裤，她疯狂地扭动着臀部，引起了一场名副其实的臀肉地震。[pg]");
         outputText("幽灵女孩迅速从那件可怜的衣服里滑了出来，将注意力转移到她肿胀的阴道上。女孩以惊人的柔韧性将她的大屁股扑通一声坐在甲板上，抓住脚踝，将它们举起，使她那吸吮鸡巴的嘴唇与阴唇齐平。不出所料，她张开嘴，迄今为止最大量的口水倾泻到她等待的通道中，这种感觉很快让幽灵女孩变成了一堆扭动、呻吟的摇晃肉体。最后，她振作起来站了起来。[say: 嗯嗯……]她呻吟着，[say: 坐、坐起来……我想成为你的……“旗帜”……]看着她现在像洞穴一样的阴户，女性液体如波浪般涌出，溅在甲板上，你对她健康的担忧减轻了，你觉得在这一点上，这是取悦她的唯一方法。你站起身，你那被施了魔法的阴茎从船上翻落到外面的草地上。[pg]");
         outputText("没有丝毫犹豫，鲨鱼身体的幽灵冲了出去。她仰面躺下，向前蠕动，双手抓住你的龟头——引得你猛吸一口气——然后将自己刺穿在你的肉棒上，只有一丝不适。[say: 躺下！]她恳求道，虽然你觉得这整件事完全疯了，但你还是照做了。她将线条分明的双腿蜷缩在身下，当你向后靠时，她从地上跳了起来。她兴奋地“呜呼！”一声向上荡去，直到停下来，悬停在你上方。幽灵女孩喘息着、呻吟着、狂喜地大叫着，开始在你巨大的鸡巴上扭动，拼命想把自己降到你身上。她突然停了下来，整个身体僵硬了。虽然你看不见她的脸，但你可以看出她脑子里发生了一些事情，她咆哮着，[say: 该死的，你这个没用的……东西，你完全做错了，]声音中充满了沮丧，还夹杂着一丝快感。[say: 让我来！]还没等你考虑性格的转变，鲨鱼女孩强壮、有弹性的尾巴就缠住了你的肉棒并用力拉扯。一寸一寸地，她陷得更深，将她迅速膨胀的阴道拉伸到超乎物理极限的程度。随着每一次滑动，她的尖叫声越来越高，在幽灵优雅的语调和鲨鱼粗糙的节奏之间交替，这动作引得你发出一声长长的呻吟。这感觉太棒了。你的眼睛睁得大大的，几乎要从眼眶里滚出来，因为你感觉到你的肉棒上有一种熟悉的刺痛感，你抬起头，发现被刺穿的女孩疯狂地摇着头，含糊不清地说着什么；你一遍又一遍地听到“生长”和“操”这两个词。你意识到，你一定是对她小穴里残留的唾液产生了反应，为了尽快结束这一切，你伸出手抓住她的脚踝，将她向下拉了几英寸，越过你仍在肿胀的男性象征，引得她发出一声半痛苦、半高潮的尖叫。紧绷感太强烈了，你被推到了忍耐的极限。你停顿的喘息足以给同样达到顶峰的鲨鱼幽灵女孩提供线索，她加倍努力，把你们俩都推向高潮。[say: 还要！]她哭喊着，你顺从了她，用尽全力进行了最后一次巨大的拉扯。当肿胀的龟头撞击到她被魔法强化的子宫顶部时，她触底了，这个动作给了你们俩所需的一点推力。");
         if(get_player().balls > 0)
         {
            outputText("当你达到高潮时，你那被施了魔法的睾丸发出了清晰的呻吟。");
         }
         else
         {
            outputText("你感觉到腹股沟有什么东西在搅动，随着刺痛感的加剧，你扭动着身体。");
         }
         outputText("你的尿道膨胀起来，浓稠、非常浓稠的精液涌过，而那一点点额外的粗度正是幽灵女孩达到高潮所需要的，她的双手热情地在她膨胀的身体上游走，当这种感觉震撼她时，她的声音攀升为尖叫。你的第一股和第二股精液使她肿胀的肚子变圆了，到了第三股，鲨鱼女孩的腹部看起来就像是一场为期一周的恶魔狂欢后的惨状。最后，随着你第四次也是最后一次爆炸性的喷发，她的嘴唇松开了对你肉棒的死死钳制，巨大的精液和淫液如雨般倾泻在你身上，几乎填满了船，让你漂浮在性爱的浴缸里。[pg]");
         outputText("幽灵女孩甚至懒得从你高耸的鸡巴上挣脱出来，开心地悬挂着，直到魔法开始消退。她异想天开地骑着你的鸡巴下到船上，双脚踩在两边，在你上方保持平衡，同时她自己的尺寸也在调节。你站起身，潜入湖中洗去身上难闻的液体，然后漫步回到岸边，被附身的鲨鱼女孩正在那里等着。你走进她张开的双臂，嘴唇锁在一个柔软的吻中，女孩跳回你等待的喉咙里。当鲨鱼女孩甚至没有质疑刚刚发生的事件，只是转身涉水回到她的水上家园，留下你和你的幽灵独处时，你松了一口气。[pg]");
         outputText("事情解决后，你和你临时的幽灵同伴决定在这里分道扬镳。幽灵女孩从你的胃里推出来，流出你的身体并重新成形，给了你一个快速的拥抱，并保证她度过了一段美好的时光。当她开始跋涉回废墟城市时，她警告说，如果你指望她顺从你的意愿，你最好准备好打一架。");
         get_player().orgasm("Generic");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,355,FlagDict_Impl_.arrayReadInt(_loc1_,355) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function ghostGooGurlzDuckfaces() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你轻松地沿着环湖小路徒步旅行，警惕地留意任何潜在的玩物。你努力无视来自你异界同伴越来越沮丧的心灵感应抗议。你开始吹起轻快的口哨，但当你瞥了一眼，看到幽灵女孩欲望的完美接受者——一团变形虫般的粘液时，你打断了声音。当幽灵女孩注意到这个黏糊糊的东西时，她的抱怨停止了，你可以想象当她询问时眼睛亮了起来，[say: 哦，哦，我们能强奸那个吗？]你带着灿烂的笑容证实了她的兴奋。意识到你不能完全偷偷溜到那东西身边，因为你不知道它的感知是如何运作的，你命令幽灵充当先锋。[say: ……这到底包括什么？]她犹豫地回答，你叹了口气，直截了当地告诉她去附身那东西。[say: 啊，]她轻声说。[say: 这就说得通了。][pg]");
         outputText("幽灵女孩从你的躯干里扭动着出来，在评估她预定的猎物时犹豫地盘旋了一会儿，然后向它飘去。当她像一个几乎无形、隐约呈人形的缕缕轻烟在空中缓慢“爬行”时，你强忍住笑声。她到达了史莱姆，下定决心，潜了进去。当灵魂将自己推入绿色肿块时，史莱姆像……嗯，明胶一样摇晃。你等了一会儿，困惑地观察着那团焦躁物质的旋转。然后，动作就……停止了。好奇尝试是否奏效，你犹豫地走近。绿色史莱姆在原地洗牌，转过身来看着你。仔细观察这东西，你隐约看到了幽灵女孩的脸，你捕捉到了一个眨眼。知道这意味着什么，你脱下你的[armor]，大步走向她，");
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("向幽灵史莱姆展示你的[cocks]。");
         }
         else if(get_player().hasVagina())
         {
            outputText("渴望地将手滑向你的[clit]。");
         }
         else
         {
            outputText("你们俩的性器官都兴奋地跳动着。");
         }
         outputText("当女孩咯咯笑时，凝胶状的肿块颤抖着，声音奇怪地扭曲了。[say: 这东西太……空了，]她用一种奇怪的水声和咕噜声说。[say: 就像接管了一块海绵！]你对这个奇怪的比喻扬起眉毛，但没多想。你还有工作要做。[pg]");
         if(get_player().get_gender() == 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,509) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,356) > 0)
            {
               slimeGhostGalForHerms(false);
            }
            else if(Utils.rand(2) == 0)
            {
               slimeyPenorsAhoy();
            }
            else
            {
               slimeGinaFlation();
            }
         }
         else if(get_player().hasCock())
         {
            slimeyPenorsAhoy();
         }
         else
         {
            slimeGinaFlation();
         }
      }
      
      public function ghostGinaWinSexings() : void
      {
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && Utils.rand(2) == 0)
         {
            ginaBoobgartuanShouldra();
            return;
         }
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("幽灵女孩完全融入你的身体时，发出一声略带失望的叹息。[say: 我有过……很多女性宿主，]她解释道。你瞬间因为幽灵的不满而感到尴尬，几乎要开口道歉，但话到嘴边又咽了回去，你防备地交叉起双臂。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,361) == 0)
         {
            outputText("她在你脑海里“嗯”了好几次，但你能感觉到一阵狂喜涌上心头，显然她想到了解决办法。[say: 当然！]她兴奋地叫道。[say: 我以前还从来没这么做过呢！][pg]");
         }
         else
         {
            outputText("[say: 哎呀，我想我们总是可以再来一次的，]她若有所思地说。[say: 第一次效果就挺好的。][pg]");
         }
         outputText("你正想问她到底在说什么，但很快就闭上了嘴，因为她温柔而坚定地控制了你的身体，脱下你的[armor]，漫不经心地抚摸着你的小穴。你让她控制你的嘴，她念了一段相当长的咒语，随着咒语的进行，她那漫不经心的自慰也变得越来越狂热。伴随着最后一句大喊出的力量之语，你们俩都叫出了声，因为你的阴蒂突然在你的手中跳动并肿胀起来，那倍增的敏感度几乎让你发疯。然而，你的淫核并没有就此停止，而是随着每一次心跳不断膨胀。你翻着白眼，嘴里发出原始的咕哝和呻吟，你的阴蒂在幽灵魔法的作用下不断充血，直到长到原来长度的至少四倍才停下来。一阵微风吹过废墟的屋顶，风拂过你那变长的淫核，你尖叫起来。太敏感了……这东西实在太敏感了！[pg]");
         outputText("违背你的意愿，也违背你所有更好的本能，幽灵女孩——她有多兴奋你就有多不舒服——把双手移到你的私处，抓住它并捏了一把。你的整个身体都僵住了，导致你向后倒在路面上，因为一阵毁灭性的高潮席卷了你的全身。一声被压抑的哭喊是你对这种爆炸性感觉唯一能做出的反应。然而，幽灵女孩对这种突如其来的高潮并不满足，她开始用一只手狂热地抚摸你的阴蒂，另一只手伸进你的爱之隧道，刺激里面粉红色的嫩肉。你弓起背，试图用你的[feet]在路上挖出小坑，因为冲击波一次又一次地穿过你的身体，根本不给你恢复的机会。你听到，仿佛从很远的地方传来，一阵疯狂的笑声和高潮的愉悦叫喊声在你的脑海中回荡。最后，谢天谢地，你陷入了昏迷，留下幽灵女孩继续她那持续不断的刺激。[pg]");
         outputText("一段时间后，你在一个巨大的女性精液水坑中醒来。你试图坐起来，却被地上的一声闷响阻碍了。闷响？你用手肘撑起自己，低头一看，发现一根粗大的金属管，大概是在你昏迷期间插进了你的阴道。你伸手下去，从你的小穴里拔出整整十英寸长的管子，对你那不属于这个世界的身体入侵者的顽强摇了摇头。然而，你很高兴感觉到胯部收紧，因为魔法终于消退了，你的女性特征恢复成了" + get_player().vaginaDescript(0) + "。你还注意到你那巨大的阴蒂不见了，并给自己轻轻抚摸了一下以确认；它也恢复了正常大小。你猜，结局好一切都好。");
         get_player().cuntChange(-1,true,true,false);
         outputText("[pg]她的快感得到了满足，幽灵女孩头朝下从你的肚子里出现，流出来并重新组合成你最初遇到的那个正常的、棕色眼睛的女孩。几乎是事后才想起来，她笑了笑，走向她的衣服并迅速穿上，然后给你挥了挥手，转身走过拐角，从视线中消失了。你决定再次找到她——她的魔法相当有趣！");
         get_player().orgasm("Vaginal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,361,FlagDict_Impl_.arrayReadInt(_loc1_,361) + 1);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ghostGinaLosses() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         outputText("当幽灵女孩完全进入你的身体时，她发出了一声略带失望的叹息。[say:我曾有过……许多女性宿主，]她解释道。对于她的不满，你几乎感到尴尬，甚至在想起她抱怨的原因之前，你还考虑过道歉。你交叉双臂（或者说尝试交叉，因为幽灵仍然完全控制着你的身体），恼怒地哼了一声。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,361) == 0)
         {
            outputText("她“嗯嗯”了几声，举起你的手，用手指敲打着你的下巴。她打了个响指，仿佛恍然大悟。[say:当然！]她兴奋地叫道。[say:我以前还从来没这么做过！]");
         }
         else
         {
            outputText("[say:哦，好吧，我想我总可以再做一次，]她若有所思地说。[say:第一次的效果就很好。]");
         }
         outputText("[pg]");
         outputText("你正想问她到底指的是什么，但很快就闭上了嘴，因为她滑出了你的[armor]，漫不经心地抚摸着你的小穴。她控制了你的嘴，念了一段相当长的咒语，随着咒语的进行，她那漫不经心的自慰也逐渐变得狂热起来。伴随着最后一句大声喊出的力量之语，你们俩都大叫起来，因为你的阴蒂突然在你的手中跳动并肿胀，敏感度的增加几乎让你发疯。然而，你的敏感点并没有就此停止，而是随着每一次心跳而膨胀。你的眼睛向上翻白，嘴唇里逸出原始的咕哝和呻吟声，你的阴蒂在幽灵魔法的作用下充血，直到达到原来长度的至少四倍才停下来。一阵微风吹过废墟的屋顶，当风拂过你拉长的敏感点时，你尖叫起来。太敏感了……这东西实在太敏感了！[pg]");
         outputText("违背你的意愿，也违背你所有更好的本能，幽灵女孩——她有多兴奋你就有多不舒服——把双手移到你的私处，抓住它并捏了一把。你的整个身体都僵住了，导致你向后倒在路面上，因为一阵毁灭性的高潮席卷了你的全身。一声被压抑的哭喊是你对这种爆炸性感觉唯一能做出的反应。然而，幽灵女孩对这种突如其来的高潮并不满足，她开始用一只手狂热地抚摸你的阴蒂，另一只手伸进你的爱之隧道，刺激里面粉红色的嫩肉。你弓起背，试图用你的[feet]在路上挖出小坑，因为冲击波一次又一次地穿过你的身体，根本不给你恢复的机会。你听到，仿佛从很远的地方传来，一阵疯狂的笑声和高潮的愉悦叫喊声在你的脑海中回荡。最后，谢天谢地，你陷入了昏迷，留下幽灵女孩继续她那持续不断的刺激。[pg]");
         outputText("过了一段时间，你在自己流出的一大滩淫液中醒来，试图慢慢坐起来，却被地上的一声闷响阻碍了。闷响？你用手肘撑起身子，低头一看，发现一根粗大的金属管插在你的阴道里，大概是在你昏迷期间插进去的。你伸出手，从你的小穴里拔出了整整十英寸长的管子，对你体内那个超自然入侵者的执着摇了摇头。不过，你很高兴地感觉到胯部一阵紧缩，因为魔法终于失效了，你的女性特征又变回了" + get_player().vaginaDescript(0) + "。你还注意到你那巨大的阴蒂不见了，你轻轻摸了一下以确认；它也恢复了正常大小。你觉得，结局好就一切都好。");
         get_player().cuntChange(-1,true,true,false);
         outputText("[pg]你的腹部开始产生一种奇怪的感觉，你好奇地把手按在肉上。你迅速把手拿开，因为一个熟悉的脑袋突然钻了出来，扭动着直到面对着你。她笑了笑，然后把手臂从你的躯干里抽出来，以此为杠杆（伴随着一句让她的手变得有形的低语咒语）将自己完全从你体内拔出。她嘟囔着咒语，再次凝固了她那不起眼的身形，向你眨了眨眼，拿起她的束腰外衣套在身上。在你的注视下，她把拇指和食指伸进她那满足的小穴里，弄出了一大团黏糊糊的幽灵物质。她把手伸进束腰外衣的口袋里，掏出一个小瓶子，迅速把灵质挤了进去。她把瓶子递给你，解释道：[say:如果你愿意的话，这算是一个……幽灵高潮的产物。留着吧，对你有好处。]伴随着一声愉快的道别，她走进了一条小巷，顺手捡起她破烂的紧身裤和丢弃的鞋子，消失在阴影中。你正要离开，却发现你的[legs]变得沉重，附身后的疲惫感席卷全身。不知不觉中，你已经跪倒在地，不得不努力不让眼皮耷拉下来。你屈服于疲惫，瘫倒在地上，很快就满足地打起了呼噜。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,361,FlagDict_Impl_.arrayReadInt(_loc1_,361) + 1);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(1));
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ghostGartuanLossSceneOrSomeShit() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("当幽灵女孩注视着你那过分巨大的" + get_player().cockDescript(_loc1_) + "时，你全身都因愉悦而颤抖。她把你的手放在你[armor]的凸起处，当你那根东西抽动并稍微变硬时，她高兴地咯咯笑了起来。她急切地脱下衣服，却被一个从半勃起的阴茎里传来的熟悉而响亮的声音打断了。[say:这婊子到底是谁？]困惑的埃克斯加图安暴躁地大喊。[say:住在别人的身体里是我的专利！][pg]");
         outputText("震惊的幽灵女孩差点当场从你身体里跳出来。[say:哦……我……我很抱歉……呃……啊……]她用你的声音结结巴巴地说，这些词几乎无法在你的嘴里成型。在心灵感应中，她愤怒地向你传递信息：[say:你为什么不告诉我这里还有……别人？]你只好怯生生地为这个疏忽道歉。[say:所以呢！？]埃克斯加图安咆哮着，你那半软的阴茎也跟着愤怒地抽动。[pg]");
         outputText("犹豫了片刻后，幽灵女孩沉到你的腰部，把头从你的[hips]伸出来。[say:我很抱歉，先生，但我们——呃，抱歉，你的宿主没有提到他已经……被占用了，]她用柔和的女性声音承认道。[pg]");
         outputText("[say:等一下，]恶魔要求道，突然变得不那么喧闹了。[saystart]你是说你是个妞，对吧？而且不是那种带把的妞");
         if(get_player().get_gender() == 3)
         {
            outputText("就像这边的这个婊子一样");
         }
         outputText("？[sayend][pg]");
         outputText("一抹红晕（不知怎么地）爬上了她[skintone]的脸颊，幽灵女孩温顺地点了点头。她显然不知道这个喜怒无常的生物会做出什么举动。她突然发出一声轻呼，她的头被吸回了你的身体里。你能隐约感觉到她的存在发生了转移，然后，仿佛被拉扯一般，移动到了……你的阴茎里？你把一只手——既然幽灵女孩现在无暇他顾，你感觉完全的控制权又回到了你身上——放在你那巨大的肉棒下，微微将其托起。当那东西在你手中猛地跳动时，你吓了一跳。[say: 好了，婊子，让我们来一场灵魂交欢吧，]埃克斯加图安大喊道，令你惊讶的是，你体内的这位灵体新客竟然满怀期待地呻吟了一声。[pg]");
         outputText("[say: 可是你太大大大大了，]她声音沙哑地调戏着，你的脑海中突然充满了这个女孩和恶魔的画面。他们位于一个巨大的肉质通道里……你很容易就能猜到那意味着什么。你看到一个只能是埃克斯加图安的模糊人形（显然是赤裸的），红色的烟雾从他身上飘散并在他周围环绕。他那巨大的雄性象征裸露在外，不断抽动着，在海绵状的地面上拖行。幽灵女孩还是你记忆中的样子；不过，她已经把束腰外衣扔到了一边，把紧身裤褪到了膝盖处。这个被唤起情欲的幽灵四肢着地跪在天赋异禀的恶魔面前，轻轻摇晃着她那柔软的臀部，充满欲望地越过肩膀看向她那无形的爱人。趁着你分心，埃克斯加图安的影响力涌入你的身体，随着他接管控制权，你发现自己被进一步拉入了这个脑海中的画面。你的双手移向你的肉棒，就像他自己的动作一样，他把那根东西抬到了幽灵女孩的背上；这导致了一个奇怪的景象：你自己的命根子悬浮在半空中，而你无法夺回足够的控制权来修正这种怪异的现象。她颤抖着，这重量刺激着她，引出了几声发情的娇喘。[pg]");
         outputText("埃克斯加图安慢慢地将他那根肉柱向后拖（你自己的身体也模仿着这个动作），当肉棒滑过她裸露的肌肤时，幽灵女孩因压抑的兴奋而真切地颤抖起来。最后，恶魔到达了她湿漉漉的阴阜，用龟头诱惑地戳着她的阴唇，用冒着小泡的先列腺液进一步润滑着她。她不耐烦地向后倒向那根巨大的东西，但埃克斯加图安");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,360) > 0)
         {
            outputText("再一次");
         }
         outputText("在最后一刻狡猾地将臀部向上抬起。幽灵女孩没有得到预期的阴道插入，而是被过量的恶魔粗度塞进了她的肛门。你因为预感到的不适而皱眉，但当她狂喜地呻吟时，你感到惊讶；当你感觉到一个近乎老虎钳般的紧绷感封住了你自己的阴茎时，你更加惊讶了。她的臀部变宽以适应插入，平坦的腹部开始出现隆起。幽灵女孩在极乐中扭动，当埃克斯加图安要求时，她的呻吟声只会加剧，[say:脸朝下，屁股朝上。]她顺从了，将她" + (ghostLoli() ? "小巧的" : "坚挺的") + "乳房挤压在肉质的地板上，并将下半身向上突出。恶魔张开双腿，然后猛烈地挺动臀部——当然，当你做出这个动作时，你会感到非常愚蠢。你默默地感谢玛莱，周围没有人看着你……或者，至少，没有你能看到的人。他将他那巨大的阴茎埋入渴望的幽灵女孩体内，下沉了不下八英寸，这让她非常高兴。当你感觉到紧致的通道也滑上你的阴茎时，你强忍住呻吟，如果不是埃克斯加图安控制着你，你肯定会倒下。[pg]");
         outputText("随着巨大的生殖器继续深入，幽灵的肚子向前鼓起，几乎不受任何人类解剖学常识的束缚。当她沐浴在“灵魂性爱”中时，一连串毫无意义的词语从她嘴里流出。你的阴茎开始稳定地滴下先列腺液，液体溅在路面上，你的身体模仿着你恶魔同谋淫荡的骨盆运动。你感觉到她的身体，被你的" + get_player().cockDescript(_loc1_) + "刺穿到胸口，随着恶魔的先列腺液脉动进她过度拉伸的胃里，她的身体进一步收紧。她的双手飞向中段，因为那里正稳定地向外脉动。灵魂终于被插到底了，埃克斯加图安的龟头卡在她肋骨的位置。意识到无法再深入，幽灵举起双臂，旋转起自己的身体；当这种扭曲传递到你的肉棒上时，你几乎要翻白眼了。幽灵女孩试图找到恶魔，但她的肚子已经大得超出了她的视野。目标失败后，她夹紧大腿，用脚踝摩擦着颤抖的肉体。当她的动作取得巨大成功时，你和埃克斯加图安都不感到惊讶。你——还有他——的阴茎根部随着第一股精液的脉动而膨胀。你的精液通道肿胀起来，为即将到来的喷发腾出空间。[pg]");
         outputText("当第一股精液挤进她那被蹂躏的后庭时，幽灵女孩尖叫着表达她的快感。你的身体锁定在埃克斯加图安的高潮姿势中；双手泵送着你的精液，骨盆在期待中来回摇晃。随着每一次射入她体内的精液，这个过度敏感的" + (ghostLoli() ? "女孩" : "女人") + "的哭喊声节奏加快，恶魔把她当成了一个活生生的避孕套。他把她越泵越大，这种超凡脱俗的高潮对你来说似乎持续了几个小时。你甚至无法改变姿势，只能站在那里畏缩着，看着至少一加仑的精液倾泻在开裂的道路上。就像破裂的水管一样，粘稠的物质从你高耸的阳具中自由流淌。最后，在至少一分半钟的高潮之后，你的“消防水管”减缓成水流，然后变成涓涓细流。心满意足的埃克斯加图安释放了对你的控制，你向后瘫倒在一大滩精液中。当然，你几乎没有注意到，你的注意力都集中在那个圆滚滚的幽灵女孩身上，她在身下肉质的地板上虚弱地扭动着。她的肚子就像一个巨大的、晃荡的飞艇，当埃克斯加图安注视着她时，你感觉到你的舌头就像一条好奇的蛇一样在嘴唇上闪过。[pg]");
         outputText("由于她仍然被塞在恶魔慢慢变软的阴茎上，她甚至无法站起来。女孩毫不畏惧，无助地咯咯笑着，等待着埃克斯加图安将她从他那阳具的掌控中释放出来。恶魔做得更好；他不仅将他的男性象征从她现在张开的屁股中拔出来，甚至在拔出后走到她身边，给了她一只“援助之手”。他伸出手，将手压在幽灵女孩隆起的肚子上，然后向下推。她开始指责他粗暴的对待，但随着精液从她的喉咙里冒出泡泡并从嘴角漏出，这些话很快就变成了咯咯的尖叫声。与此同时，精液以极快的速度从她的肛门喷出——可怜的女孩的眼睛向上翻向对面的墙壁，因为她被抽干了精液。[pg]");
         outputText("当一切尘埃落定，你昏昏沉沉地动了动。你眨了眨眼，赶走睡意，看着淹没街道的巨量精液，不由得愣住了。你感觉到终于疲软下来的阴茎里又传来一阵异样的感觉，于是低头看去。一股苍白透明的烟雾从你的尿道中缓缓飘出，重新凝聚成那个非常疲惫、有些酸痛，但却无比满足的幽灵女孩。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,360) == 0)
         {
            outputText("[say: 幽灵交媾……我可没试过这种事，]她承认道。[say: 不过这感觉真他妈爽。]");
         }
         else
         {
            outputText("[say: 靠，]她叹了口气，[say: 不得不说，这依然是一次超棒的体验……]");
         }
         outputText("[pg]");
         outputText("[say: 他们叫我“操穴恶魔”可不是白叫的，]你的阴茎恶魔插嘴道。你们俩相视一笑，幽灵友好地挥了挥手，转身离开。她蹚过铺满地面的精液，你忍不住注意到一滴白色的液体从她光溜溜的屁股上滴落下来。这滴液体在精液的海洋中荡起了一圈微小的涟漪。你摇了摇头，嘴角泛起一丝微笑。幽灵交媾……真是太荒谬了。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,360,FlagDict_Impl_.arrayReadInt(_loc2_,360) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function ghostBJFinisher(param1:Boolean) : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         var _loc2_:int = get_player().cockThatFits(80);
         outputText("就像一个被堵住的间歇泉，你巨大的睾丸将滚烫、浓稠的精液从你疲惫的" + get_player().cockDescript(_loc2_) + "中直接推向空中。精液溅到了你和");
         if(param1)
         {
            outputText("兴奋地抽搐着");
         }
         else
         {
            outputText("几乎被欲望麻痹的");
         }
         outputText("女孩，你们俩都累得懒得躲开这如雨般落下的精液。你大口喘着粗气，终于把自己撑了起来，顺便把娇小的幽灵女孩也拉了起来。[pg]");
         get_player().orgasm("Dick");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,358,FlagDict_Impl_.arrayReadInt(_loc3_,358) + 1);
         if(param1)
         {
            outputText("[say:太感谢你了，]她轻声喘息着，伸出双臂温柔地抱住你。[say:如果积攒了那么多欲望却得不到释放，我甚至都没法正常思考了。]你微笑着弹了一下她的鼻子，她则以一个狡黠的半笑作为回应。[say:哦，这个给你，]她补充道，迅速拉下裤子，把手伸进还在流着淫液的小穴里，掏出了一把灵质。她从衬衫口袋里掏出一个小瓶子，把黏糊糊的东西塞进去，然后眨着眼睛递给你。[say:再次感谢！][pg]");
            outputText("你看着她迈着轻快的步伐走进废墟，轻笑一声，然后自己也动身返回营地。");
         }
         else
         {
            outputText("她几乎是夸张地摇晃了一下，然后侧身倒下，脑袋重重地磕在地上，溅起一小片精液。然而，就算她感觉到了疼痛，也完全没有做出任何反应，只是呆滞地盯着一栋破旧的建筑，嘴角微微流着口水。你心想，这应该能给她个教训，让她不敢再对你耍两次花招。当你大步走过她身边时，你把她的裤子扒到膝盖处，从她的阴道里挖出了一大把灵质。你伸手进她的口袋里摸出一个瓶子（顺手捏了一把她" + (ghostLoli() ? "小小的" : "") + "乳房，惹得她发出一阵发情的抽搐），把黏液倒进去，然后塞进你的[inv]里。你一边踏上回营地的路，一边想着她最后大概会找到个地精吧。");
         }
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function genderlessShouldrasLossRapes() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         outputText("幽灵女孩兴奋地想知道你是什么样的宿主，迅速完全控制了你的身体，并用手捂住你的胯部，感觉……什么都没有。她很困惑，迅速从你的[armor]中挣脱出来，又摸了一次，除了皮肤什么也没感觉到。[say: 狗娘养的……请不要告诉我你没有任何我可以玩的性器官！]她气呼呼地说，你尴尬地笑了笑，不知道该告诉她什么。她不高兴地呻吟着，倒在你的[ass]上，在你的呼吸下咕哝着一连串的脏话。[say: 够了！]她怒气冲冲地说。[say: 不管你愿不愿意，我都要爽一下！]她继续咒骂着，扭动着你的臀部一会儿，然后突然停了下来，你的脸上掠过一丝得意的笑容。[say: 不管你愿不愿意……][pg]");
         outputText("她跳起来，走向你第一次见到她的那间破旧小屋。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,357) == 0)
         {
            outputText("你挑了挑眉，真心好奇她会怎么解决自己的欲望。");
         }
         outputText("幽灵女孩冲进屋内，径直走向一个扭曲且半腐烂的梳妆台。在翻找了几个装满各种小玩意儿和饰品的抽屉后，她兴奋地尖叫了一声，拿出了一个看起来很普通的鸡蛋盒。她走到房间的另一边，打开了一个做工精良的箱子，顺手把鸡蛋盒放在了床头柜上。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,357) == 0)
         {
            outputText("你对里面的东西很好奇，便往里瞥了一眼——那是一整箱假阳具，各种形状和尺寸的都有。还没等你问为什么一个幽灵会带着一整箱假阳具，");
         }
         else
         {
            outputText("你清楚地记得那个箱子里的东西，所以并不感到惊讶");
         }
         outputText("当她伸手进去翻找时，拿出了两根八英寸长、带有凹凸不平恶魔肉棒纹理的按摩棒。她退回房间中央，一边走一边念起了一段简短的咒语。她把假阳具放在同一个床头柜上，打开鸡蛋盒，拿出了四个白色的大鸡蛋。[pg]");
         outputText("你惊叹于这个幽灵女孩的足智多谋，然后停下来思考这些鸡蛋可能带来的后果。你的怀疑得到了证实，因为");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你的胸前长出了两个新器官。");
         }
         else if(get_player().biggestTitSize() <= 8)
         {
            outputText("你的" + get_player().allBreastsDescript() + "开始四处弹跳。");
         }
         else
         {
            outputText("你的" + get_player().allBreastsDescript() + "微微肿胀，为突然增加的乳汁腾出空间。");
         }
         outputText("随着幽灵继续在房间里穿梭，");
         if(get_player().biggestTitSize() <= 8)
         {
            outputText("你新长出的EE罩杯乳房稳定了下来");
         }
         else
         {
            outputText("泌乳仍在继续");
         }
         outputText("，幽灵女孩回到桌边，稍微平静了下来。对这些变化感到满意后，她毫不迟疑地将鸡蛋在桌上敲碎。当她把半个蛋壳凑向你同样充满抗拒的嘴时，你的手臂短暂地僵硬了一下，但她很快就占了上风，强行掰开你的下巴，把里面的东西倒了进去。她轻松地吞下了美味的内容物，然后将手滑到你的胸前，满怀期待地托起你巨大的乳房。随着前三个鸡蛋被吞下，你的乳头肿胀突出，变长变硬。然而，最后一个鸡蛋在你的身体上产生了完全不同的反应；一种舒适温暖的刺痛感从你那硕大乳房的深处开始，稳步向上蔓延到你的乳头。伴随着满足的呻吟，幽灵女孩用一根手指挑逗地在刺痛的乳头上画圈，变化仍在继续。最后，她将一根手指分别插入突然变得柔软的乳头中，因插入的快感而颤抖。她不再浪费时间，抓起她的两个假阳具，塞进你的");
         if(!get_player().hasFuckableNipples())
         {
            outputText("新的");
         }
         else
         {
            outputText("甚至更大的");
         }
         outputText("乳头穴中，打开开关，凹凸不平的恶魔假阳具穿透了你未经人事的乳房。随之而来的震动在你的乳房上掀起阵阵波浪，随着它们的晃动，幽灵女孩发出了一声压抑的欢愉尖叫。沉醉于这种感觉中，她踉跄着，因你的乳头被侵犯的快感而发出呜咽和咕噜声。她的脚被床柱绊了一下，整个人扑倒在地上，胸部着地，凹凸不平的性玩具被推得更深地进入你的乳房。她徒劳地将你的骨盆在地上撞击了几次，试图进一步增加她的快乐，然后翻倒在一边，目光最终落在了那个仍然敞开的假阳具箱子上。她慢慢地拖着身体爬过去（将你的胸部压在地上，引发了几声快乐的咕哝），伸手抓起一根13英寸长的软趴趴的马阴茎复制品。你的虹膜在附身者的黄色苍白和你自然的颜色之间来回切换，你的眼睛因恐惧而睁大。她不可能……[pg]");
         outputText("她把它拍打");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("在你的泄殖腔上");
         }
         else if(get_player().isGoo())
         {
            outputText("进入你柔软的黏液中");
         }
         else
         {
            outputText("双腿之间");
         }
         outputText("，似乎忘记了你没有生殖器，于是勉强转向下一个可以插入的孔洞：你的[asshole]。她完全不顾安全，振动棒还在你越来越热的乳头里欢快地嗡嗡作响，她把马屌摔在地上，等它稍微停止扭动，然后把你的屁股对准它那喇叭状的顶端。她疯狂的笑声和你惊恐的尖叫声交织在一起，她一屁股坐了上去，第一次插入就至少插进去了四英寸");
         if(get_player().ass.analLooseness <= 4)
         {
            outputText("并且把你的屁股撑得不成样子");
         }
         outputText("。");
         get_player().buttChange(50,true,true,false);
         outputText("她像个疯狂的瘾君子一样胡言乱语，大脑越来越被三重插入的快感所蒙蔽，她上下跳动，每一次弹跳都把假阳具更深地推入你的肛门。最后，八英寸的马屌塞进了你的屁股，而振动着的恶魔鸡巴也从未停止对你乳头的快感轰炸，这个幽灵女孩迎来了一次巨大的高潮。她伸出手，粗暴地把振动棒从你的乳头穴里拔出来，用力地抚摸着它们，它们喷射出透明精液和浓稠白乳的混合物，就像两个高潮快感的迷你喷泉。在地上躺了一会儿，深呼吸让你的乳房相互碰撞，幽灵女孩终于伸出手，把马屌从你的后庭里拔了出来，满足地叹了口气，把它扔到一边。[say:我跟你说过什么？]她轻声问道。[say:不择手段。][pg]");
         outputText("你暗自轻笑，不得不承认对她的本领印象深刻。胸口的压迫感消失了，你下意识地抬起手，发现");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你的乳房，连同变长的乳头，都缩回了平坦的胸部");
         }
         else if(get_player().biggestTitSize() <= 8)
         {
            outputText("你的乳肉缩回了正常大小，乳头也是");
         }
         else
         {
            outputText("乳头再次变短，泌乳也终于稳定下来");
         }
         outputText("。伴随着一声满足的叹息，你撑起身子，重新穿上你的[armor]，再次走入废墟之中。[pg]");
         outputText("你的腹部开始产生一种奇怪的感觉，你好奇地将手按在肉体上。你迅速把手移开，因为一个熟悉的脑袋突然钻了出来，扭动着直到面对你。她笑了笑，然后把手臂从她的躯干里抽出来，以此为杠杆（伴随着一句低语的咒语，让她的手变得有形），将自己完全从你体内拔了出来。她嘟囔着一句咒语，再次凝固了她那不起眼的身形，向你眨了眨眼，拿起她的束腰外衣，套在身上。在你的注视下，她将拇指和食指伸进她那满足的小穴里，挤出了一大团黏糊糊的幽灵物质。她把手伸进束腰外衣的口袋里，掏出一个小瓶子，迅速把灵质挤了进去。她把瓶子递给你，解释道：[say:这算是一个……幽灵高潮的产物吧。留着吧，对你有好处。]她高兴地道了别，走进一条小巷，顺手抓起她那破烂的紧身裤和丢弃的鞋子，消失在阴影中。你正准备离开，却发现你的[legs]变得沉重，附身后的疲惫感席卷而来。不知不觉中，你已经跪倒在地，不得不努力不让眼皮耷拉下来。你屈服于疲惫，瘫倒在地，很快就满足地打起了呼噜。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,357,FlagDict_Impl_.arrayReadInt(_loc1_,357) + 1);
         get_player().orgasm("Tits");
         get_player().orgasm("Anal",false);
         dynStats(DynStat.Sens(1));
         if(get_game().get_inCombat())
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().ECTOPLS.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("[pg]");
            get_inventory().takeItem(get_consumables().ECTOPLS,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function genderlessGhostBuster() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("你很兴奋能帮助这个女孩缓解她不断积累的欲望，你允许她控制你的手臂。她急切地用手捂住你的胯部去感觉……什么都没有。她很困惑，迅速地从你的[armor]里挣脱出来，又去摸索了一番，除了皮肤什么也没感觉到。[say: 妈的……请不要告诉我你没有任何我可以玩的性器官！]她气呼呼地说，你不好意思地笑了笑，不知道该告诉她什么。她呻吟着倒在你的[ass]上，在你嘴里低声嘟囔着一连串的脏话。[say: 够了！]她怒气冲冲地说。[say: 不管你愿不愿意，我都要爽一爽！]她继续咒骂着，扭动你的臀部了一会儿，然后突然停了下来，你的脸上掠过一丝得意的笑容。[say: 不管你愿不愿意……][pg]");
         outputText("她跳到你的脚边，走向你第一次看到她的那个破旧小屋。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,357) == 0)
         {
            outputText("你挑了挑眉，真心好奇她会怎么解决自己的欲望。");
         }
         outputText("幽灵女孩冲进屋内，径直走向一个变形且半腐烂的梳妆台。在翻找了几个装满各种小玩意的抽屉后，幽灵兴奋地尖叫了一声，拿出了一个看起来很普通的鸡蛋盒。她走到房间的另一边，打开了一个做工出奇精良的箱子，顺手把鸡蛋盒放在了床头柜上。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,357) == 0)
         {
            outputText("你对里面的东西很好奇，往里瞥了一眼——那是一箱假阳具，各种形状和尺寸的都有。还没等你问为什么一个幽灵会带着一箱假阳具，");
         }
         else
         {
            outputText("你清楚地记得那个箱子里的东西，所以并不感到惊讶");
         }
         outputText("当她伸手进去翻找时，拿出了两个八英寸长、带有凹凸不平恶魔肉棒形状的按摩棒。她退回房间中央，一边走一边施放了一个简短的法术。她把假阳具放在同一个床头柜上，打开纸盒，拿出四个白色的大鸡蛋。你惊叹于这个幽灵女孩的足智多谋，然后停下来思考这些鸡蛋的用途。你的怀疑得到了证实，因为");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你的胸前长出了两个新器官。");
         }
         else if(get_player().biggestTitSize() <= 8)
         {
            outputText("你的" + get_player().allBreastsDescript() + "开始四处弹跳。");
         }
         else
         {
            outputText("你的" + get_player().allBreastsDescript() + "微微胀大，为突然增加的乳汁腾出空间。");
         }
         outputText("当幽灵继续在房间里飞来飞去时，");
         if(get_player().biggestTitSize() <= 8)
         {
            outputText("你新长出的EE罩杯乳房稳定了下来");
         }
         else
         {
            outputText("泌乳还在继续，幽灵女孩退回桌边，稍微安顿下来");
         }
         outputText("。她对这些变化感到满意，毫不迟疑地将蛋在桌上敲击，利落地打碎。当她把半个蛋壳倾斜向你同样充满抗拒的嘴时，你的手臂瞬间僵住了，但她很快就占了上风，强行掰开你的下巴，将里面的东西倒了进去。她兴奋地吞下里面的东西，然后伸手满怀期待地托起你沉甸甸的乳房。随着前三个蛋被吞下，你的乳头肿胀突出，变长变硬。然而，最后一个蛋在你的身体上产生了完全不同的反应；一种舒适温暖的刺痛感开始出现，从你那硕大乳房的中心深处，稳定地向上蔓延至你的乳头。伴随着满足的呻吟，幽灵女孩用一根挑逗的手指在刺痛的乳头周围画圈，变化仍在继续。最后，她将一根手指分别插入突然变得柔软的乳头中，因这插入而舒服得发抖。她不再浪费时间，抓起她的两根假阳具，将它们塞进你");
         if(!get_player().hasFuckableNipples())
         {
            outputText("新的");
         }
         else
         {
            outputText("甚至更大的");
         }
         outputText("乳头穴里，打开开关，凹凸不平的恶魔假阳具插入你饥渴的乳房。随之而来的震动让你的乳房在摇晃中泛起阵阵波浪，幽灵女孩发出一声压抑的欢愉尖叫。沉醉于这种感觉中，她踉跄着，因你的乳头被侵犯的快感而发出呜咽和咕噜声。她的脚被床柱绊了一下，扑通一声倒在地上，胸部先着地，凹凸不平的性玩具稍微更深地推入你的乳房。她徒劳地将你的骨盆在地上撞击了几次，试图进一步增加她的快乐，然后翻倒在一边，目光终于落在了那个仍然敞开的装满假阳具的箱子上。她慢慢地拖着身体向它爬去，将你的胸部压在地上，引发了几声快乐的咕哝，伸手进去抓起一根13英寸长的软趴趴的马屌复制品。当你的眼睛因恐惧而睁大时，你的虹膜在附身者的苍白黄色和你原本的颜色之间来回变换。她不可能……[pg]");
         outputText("她把它拍在你的双腿之间，似乎忘记了你没有生殖器，然后不情愿地转向下一个可以插入的孔洞：你的[asshole]。她完全不顾安全，振动棒还在你越来越热的乳头里欢快地嗡嗡作响，她把马屌摔在地上，等它稍微停止晃动，然后让你的屁股对准它那张开的顶端。她疯狂的笑声与你惊恐的尖叫声交织在一起，她坐了上去，在最初的插入中至少把它推进了四英寸");
         if(get_player().ass.analLooseness < 4)
         {
            outputText("并且把你的屁股撑得不成样子");
         }
         outputText("。");
         get_player().buttChange(31,true,true,false);
         outputText("她像个疯狂的瘾君子一样胡言乱语，大脑越来越被三重插入的快感所蒙蔽，她上下跳动，每一次弹跳都把假阳具更深地推入你的肛门。最后，八英寸的马屌塞进了你的屁股，而振动着的恶魔鸡巴也从未停止对你乳头的快感轰炸，这个幽灵女孩迎来了一次巨大的高潮。她伸出手，粗暴地把振动棒从你的乳头穴里拔出来，用力地抚摸着它们，它们喷射出透明精液和浓稠白乳的混合物，就像两个高潮快感的迷你喷泉。在地上躺了一会儿，深呼吸让你的乳房相互碰撞，幽灵女孩终于伸出手，把马屌从你的后庭里拔了出来，满足地叹了口气，把它扔到一边。[say:我跟你说过什么？]她轻声问道。[say:不择手段。][pg]");
         outputText("你暗自轻笑，不得不承认对她的本领印象深刻。胸口的压迫感消失了，你下意识地抬起手，发现");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("你的乳房，连同拉长的乳头，都缩回了平坦的胸部。");
         }
         else if(get_player().biggestTitSize() <= 8)
         {
            outputText("你胸部的肉缩回了正常大小，包括乳头。");
         }
         else
         {
            outputText("乳头再次变短，泌乳终于稳定下来。");
         }
         outputText("伴随着一声满足的叹息，你直起身子，重新穿上你的[armor]，再次走进废墟。");
         outputText("她的欲望得到了满足，幽灵女孩从你的肚子里探出头来，流出来并重新组合成你最初遇到的那个普通的、棕色眼睛的女孩。几乎是事后才想起来，她微笑着，走向她的衣服并迅速穿上，然后向你挥了挥手，转过一个拐角，从视线中消失了。你决心再次找到她——她的魔法非常有趣！");
         get_player().orgasm("Anal");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,357,FlagDict_Impl_.arrayReadInt(_loc1_,357) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function dewormYourGhost() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         outputText("当幽灵女孩在你的身体里安顿下来时，她立刻察觉到了抵在你[armor]上那陌生的凸起，当她注视着你的肉棒时，你感到一阵喜悦传遍全身。你手背上的皮肤颤动了一下，当幽灵的脸浮现在上面时，你吓了一跳。她耐心地等你从最初的震惊中缓过来，然后问道：[say:我能……求你了……我是说，你……啊……]你猜她一定是被自己的发现弄得有些不知所措。你轻声问她是不是指你的阳具，她突然急切地回应道：[say:嗯嗯！][pg]");
         outputText("你暗自轻笑，答应了她的请求，她发出一声欢快的尖叫，缩回了你的体内。你脱下[armor]，把手放在还没完全勃起的阳具上，随着血液开始涌入你的肉棒，她发出了娇柔的轻哼，这让你感到十分愉悦。很快，你的阴茎就在你手中跳动起来，完全勃起，准备好迎接刺激。你轻轻捏了捏它，甚至没注意到一只藏在你胯下的蠕虫滑了出来，在地板上扭动着。但这绝对逃不过幽灵女孩的眼睛，她发出一声刺耳的尖叫，震得你耳朵嗡嗡作响，头痛欲裂。你有些担心，问她怎么了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,359) == 0)
         {
            outputText("，而她的回应是控制了你的手，指着从你胯下爬出来的那只蠕动生物。[say: 哦，那个？]你嗤之以鼻，不以为意地挥了挥另一只手；当你试图解释时，你那只被幽灵控制的手臂仍在固执地颤抖着。[say: 我体内还有成吨的这种小家伙在爬来爬去呢。想看看吗？]");
         }
         else
         {
            outputText("，随着她控制了你的嘴巴，你的双眼闪烁起黄色的光芒。[say: 你居然还带着那些恶心、可怕、糟糕、恐怖的东西！？]她难以置信地大喊，很明显她无法理解这些扭动的小生物的魅力。你试图从更实际的角度来说服她，告诉她这些战斗型阴茎蠕虫在战术上的优势。");
         }
         outputText("[pg]");
         dynStats(DynStat.Lust(15));
         outputText("沉默了片刻后，你几乎被她心灵感应的尖叫声震晕过去，[say: 绝对不行！]她以创纪录的速度从你体内涌出。她显现出实体，不断后退，直到撞上了一座废墟建筑。然后，她转身就跑，沿着街道狂奔，只想离你越远越好。你耸了耸肩，心想至少你处理了她的发情问题，尽管方式有些出人意料，然后你开始跋涉回营地。");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,359,FlagDict_Impl_.arrayReadInt(_loc1_,359) + 1);
      }
      
      public function defeatDannyPhantom() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl2());
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("伴随着一声震耳欲聋、令人毛骨悚然的哀嚎，迫使你跪倒在地，那个");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) >= 1)
            {
               outputText("幽灵");
            }
            outputText("女孩向后倒去，伤势过重。还没等你阻止，她的身体就变得虚无缥缈，衣服也随之变化。一阵微风吹过废墟，卷起幽灵，将她吹散在风中。");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("女孩低头看了一眼自己的紧身裤，然后愣了一下，仿佛第一次意识到自己已经完全被欲望淹没了。她跪倒在地，拉下裤子，把一只手压在自己的耻骨丘上。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) < 1)
            {
               outputText("奇怪的是，这个动作似乎几乎没有任何效果。");
            }
            else
            {
               outputText("当然，由于她处于幽灵状态，这个动作对她的性欲毫无影响。");
            }
            outputText("她抬起头看着你，眼神中充满了绝望，喘息着：[say:求你了，英雄……我需要释放……让我进去？]你向前迈了一步，轻轻抚摸着下巴沉思起来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,353) < 1)
            {
               outputText("她说的[say:让我进去？]是什么意思？你想弄清楚吗？");
            }
            else
            {
               outputText("你要怎么做？");
            }
            menu();
            addButton(0,"让她进来",littlePigLittlePigLetMeIn);
            addButton(1,"拒绝",noSlimingSlimer);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,352,FlagDict_Impl_.arrayReadInt(_loc1_,352) + 1);
      }
      
      public function courtCrazyGirlsDotCom() : void
      {
         spriteSelect(SpriteDb.get_s_ghostGirl());
         clearOutput();
         outputText("当她注视着你那令人敬仰的面容时，笑容变得更灿烂了。[say: 是这样吗？]她轻声说道。[say: 有意思。我马上回来。]她回到她的[say: 房子]里，翻找了好一会儿才回到你身边，双手藏在背后。[say: 如果我要被一位圣骑士追求，我们必须按规矩来，]她解释道，递给你一块小丝绸手帕。白色的布料像神圣的圣水一样滑过你的手指，你虔诚地将她的礼物塞进你的[armor]里，放在贴近心脏的位置。[say: 请在两天后回来，]她轻声要求道。你们的目光交汇了良久，她似乎在努力想说些什么。但她最终还是移开了视线，开始走回她的住所。[say: 注意安全，]她嘱咐道，微笑着挥了挥手，便消失了。你静静地站了一会儿，然后转身迈着长长而神圣的步伐离开。还有更多的工作要做。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,365,48);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

